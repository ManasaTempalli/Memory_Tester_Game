//MISSION-V
//Module for ROM User ID Control
`timescale 1ps/1ps
module ROM_User_ID_Control(entered,log_out,valid_bit,status,address,user_id,internal_id,ROM_access,RAM_access,green_led_user,red_led_user,clock,rst);
 input[15:0] entered,user_id; 
 input [6:0] status;
 output reg [2:0] internal_id,address;
 output reg ROM_access,RAM_access,red_led_user,green_led_user;
 input valid_bit,log_out;
 input clock,rst;
 reg[2:0] state;
 parameter INIT=0,ROM_addr=1,delay1=2,delay2=3,comparing=4,ROM_RAM_access=5,fail=6,halt=7;

always @(posedge clock)
begin
 if(rst==0)
 begin
  red_led_user<=0;
  green_led_user<=0;
  state<=INIT;
  address<=3'b111;
  ROM_access<=0;
  RAM_access<=0;
  internal_id<=3'b000;
 end
 else
 begin
  case(state)
  INIT:
  begin
   red_led_user<=0;
   green_led_user<=0;
   address<=3'b111;
   ROM_access<=0;
   RAM_access<=0;
   internal_id<=3'b000;
   if(valid_bit==1)
   begin
    state<=ROM_addr;
   end
   else state<=INIT;
  end
  ROM_addr:
  begin
   if(address!=3'b110)
   begin
   address<=address+3'b001;
   state<=delay1;
   end
   else begin 
   state<=fail;
   red_led_user<=1;
   end
  end
  delay1:
  begin
   state<=delay2;
  end
  delay2:
  begin
   state<=comparing;
  end
  comparing:
  begin
   if(entered==user_id)
   begin
    green_led_user<=1;
    internal_id<=address;
    state<=ROM_RAM_access;
   end
   else
   begin
    red_led_user<=1;
    state<=ROM_addr;
   end
  end
  ROM_RAM_access:
  begin
   green_led_user<=1;
   red_led_user<=0;
   if(log_out==1)
   begin
    ROM_access<=0;
    RAM_access<=0;
    state<=INIT;
    green_led_user<=0;
   end
   else begin
    state<=ROM_RAM_access;
   end
   if(status[internal_id]==1)
   begin
    RAM_access<=1;
    state<=halt;
   end
   else
   begin
    ROM_access<=1;
    state<=halt;
   end
  end
  fail:
  begin
   red_led_user<=1;
   if(log_out==1)
   begin
    ROM_access<=0;
    RAM_access<=0;
    green_led_user<=0;
    state<=INIT;
   end
   else
    state<=fail;
  end
  halt:
  begin
   if(log_out==1)
   begin
    ROM_access<=0;
    RAM_access<=0;
    state<=INIT;
    green_led_user<=0;
   end
   else
    state<=halt;  
  end
  endcase
 end
end
endmodule
