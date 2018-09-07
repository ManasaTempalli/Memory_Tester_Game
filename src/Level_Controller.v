//MISSION-V
//Level_Controller
`timescale 1ps/1ps
module Level_Controller(levelupdated,green_user,rng_button,log_out,internal_id,auth_bit,win,address,level_i,level_o,wren,level_num,clk,rst);
//Decalring input and output signals
 input [2:0] internal_id,level_i;
 input auth_bit,clk,rst,rng_button,log_out,green_user;
 input win;
 output reg [2:0] address,level_o;
 output reg [3:0] level_num;
 output reg wren,levelupdated;
 
//Declaring state register and the state values
 reg [3:0] state;
 reg [2:0] level;
 parameter INIT=0,wait1=1,wait2=2,level_check=3,level_inc=4,level_update=5,win_wait=6,halt=7,halt2=8;

//Begin functionality procedure
 always @(posedge clk)
 begin
 if(rst==0)
 begin
  address<=3'b000;
  level_o<=3'b000;
  level_num<=4'b0000;
  level<=3'b000;
  state<=INIT;
 end
 else
 begin
  case(state)
  INIT:
  begin
   address<=3'b000;
   wren<=0;
   level_o<=3'b000;
   level_num<=4'b0000;
   level<=3'b000;
   if(green_user==1)
   begin
   address<=internal_id;
   state<=wait1;
   end
  end
  wait1:
  begin
   wren<=0;
   if(log_out==1)
   begin
    state<=halt2;
   end
   else state<=wait2;
  end
  wait2:
  begin
   if(log_out==1)
   begin
    state<=halt2;
   end
   else state<=level_check;
  end
  level_check:
  begin
   if(log_out==1)
   begin
    state<=halt2;
   end 
   else if(level_i==3'b000)
   begin
    level<=level_i;
    state<=level_inc;
   end
   else if(level==3'b110)
   begin
    state<=halt;
   end
   else
   begin
    level<=level_i;
    level_num<={1'b0,level_i};
    levelupdated<=1;
    if(auth_bit==1)
    state<=win_wait;
   end
  end
  level_inc:
  begin
   if(log_out==1)
   begin
    state<=halt2;
   end
   else 
   begin
   level<=level+3'b001;
   wren<=1;
   state<=level_update;
   end
  end
  level_update:
  begin
   if(log_out==1)
   begin
    state<=halt2;
   end
   else if(level!=3'b110)
   begin
    level_o<=level;
    state<=wait1;
   end
   else state<=halt;
  end
  win_wait:
  begin
   levelupdated<=0;
   if(log_out==1)
   begin
    state<=halt2;
   end
   else if(level==3'b101 && win==1)
    state<=halt;
   else if(win==1 && level!=3'b101)
   begin
    state<=level_inc;
   end
  end
  halt:
  begin
   if(log_out==1)
   begin
    state<=halt2;
   end
   else if(rng_button==1)
   begin
    wren<=1;
    level_o<=3'b001;
    state<=INIT;
   end
  end
  halt2:
  begin
   if(green_user==0)
    state<=INIT;
  end
  default:
  begin
   state<=INIT;
  end
  endcase
 end
 end
endmodule

