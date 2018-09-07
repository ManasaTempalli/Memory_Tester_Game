//MISSION-V
//Random Sequence module
`timescale 1 ps/1 ps
module Random_seq(win,loose,twodigit,time_stop,begin_timer,reconfig2,input_num,load_time,logout,random_num,enable,level_num,time_in,time_out,stop,address,q,reg_enable,reg_enable2,shl,flash_num,reconfig,clock,rst);
//Declaring inputs and outputs
input [3:0] random_num;
input [3:0] level_num;
input enable,time_in,logout,time_stop;
input clock,rst;
input [4:0] q;
output reg[4:0] address;
output reg time_out,reg_enable,reg_enable2,shl,stop,twodigit;
output reg [4:0] flash_num;
output reg [3:0] reconfig,reconfig2;
output reg begin_timer,load_time;
output reg [7:0] input_num;
input win,loose;

reg [2:0] count;
reg [3:0] state;
reg [4:0] gap;

parameter INIT=0,seq_ON=1,wait1=2,wait2=3,get_seq=4,wait_for_sec=5,flash0=6,wait_for_sec2=7,timer=8,halt=9;
always @(posedge clock)
begin
 if(rst==0)
 begin
  state<=INIT;
  address<=5'b00000;
  time_out<=0;
  flash_num<=5'b11111;
  gap<=5'b00000;
  count<=3'b000;
  reg_enable<=0;
  reg_enable2<=0;
  input_num<=8'b00000000;
  begin_timer<=0;
  load_time<=0;
  reconfig2<=4'b1010;
  twodigit<=1;
 end
 else
 begin
 case(state)
 INIT:
 begin
  address<=5'b00000;
  time_out<=0;
  flash_num<=5'b11111;
  gap<=5'b00000;
  count<=3'b000;
  reg_enable<=0;
  reg_enable2<=0;
  begin_timer<=0;
  load_time<=1;
  reconfig2<=4'b1010;
  stop<=0;
  twodigit<=1;

  if(enable==1)
  begin
   reg_enable<=0;
   reg_enable2<=0;
   address<={1'b0,random_num+flash_num[3:0]};
   gap<={1'b0,random_num};
   case(level_num)
   3'b001:
   begin
    count<=3'b011;
    input_num<=8'b00110000;
   end
   3'b010:
   begin
    count<=3'b100;
    input_num<=8'b00110101;
   end
   3'b011:
   begin
    count<=3'b101;
    input_num<=8'b01000000;
   end
   3'b100:
   begin
    count<=3'b110;
    input_num<=8'b01000101;
   end
   3'b101:
   begin
    count<=3'b111;
    input_num<=8'b01010000;
   end
   default:
    count<=3'b000;
   endcase
   state<=seq_ON;
  end
 end
 seq_ON:
 begin
  load_time<=0;
  reg_enable<=1;
  reg_enable2<=1;
  count<=count-3'b001;
  if(logout==1)
  begin
   state<=INIT;
   reg_enable<=0;
   reg_enable2<=0;
  end
  if(count==0)
  begin
   begin_timer<=1;
   state<=timer;
  end
  else
  begin
   address<=address+gap+level_num+flash_num[3:0];
   state<=wait1;
  end
 end
 wait1:
 begin
  state<=wait2;
  if(logout==1)
  begin
   state<=INIT;
   reg_enable<=0;
   reg_enable2<=0;
  end
 end
 wait2:
 begin
  state<=get_seq;
  if(logout==1)
  begin
   state<=INIT;
   reg_enable<=0;
   reg_enable2<=0;
  end
 end
 get_seq:
 begin
  flash_num<={1'b0,q[3:0]};
  shl<=1;
  time_out<=1;
  reconfig<=4'b1010;
  state<=wait_for_sec;
  if(logout==1)
  begin
   state<=INIT;
   reg_enable<=0;
   reg_enable2<=0;
  end
 end
 wait_for_sec:
 begin
  time_out<=0;
  shl<=0;
  if(logout==1)
  begin
   state<=INIT;
   reg_enable<=0;
   reg_enable2<=0;
  end
  if(time_in==1)
  begin
   state<=flash0;
  end
 end

 flash0:
 begin
  flash_num<=5'b11111;
  time_out<=1;
  reconfig<=4'b1010;
  state<=wait_for_sec2;
  if(logout==1)
  begin
   state<=INIT;
   reg_enable<=0;
   reg_enable2<=0;
  end
 end
 wait_for_sec2:
 begin
  time_out<=0;
  if(logout==1)
  begin
   state<=INIT;
   reg_enable<=0;
   reg_enable2<=0;
  end
  if(time_in==1)
  begin
   state<=seq_ON;
  end
 end
 timer:
 begin
  if(win==1||loose==1)
  begin
   stop<=1;
   input_num<=8'b00000000;
   reconfig2<=4'b1010;
   reg_enable<=0;
   reg_enable2<=0;
   state<=halt;	
  end
  else if(logout==1)
  begin
   state<=INIT;
   input_num<=8'b00000000;
   reg_enable<=0;
   reg_enable2<=0;
  end
  load_time<=0;
  flash_num<=5'b11111;
  begin_timer<=0;
  if(time_stop==1)
  begin
   stop<=1;
   input_num<=8'b00000000;
   reconfig2<=4'b1010;
   reg_enable<=0;
   reg_enable2<=0;
   state<=halt;	
  end
 end
 halt:
 state<=INIT;
 endcase
 end
end
endmodule

