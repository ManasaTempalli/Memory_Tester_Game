//MISSION-V
//Shift_Register
module Shift_Reg(enable1,enable2,toggle_entry,auth_button,log_out,entered,valid_bit,clock,rst);
 input[3:0] toggle_entry;
 input clock,rst,auth_button,log_out,enable1,enable2;
 output reg [15:0] entered;
 output reg valid_bit;
 reg [1:0] count;
 reg [15:0] R;
 reg[2:0] state;
 parameter INIT=0,button_wait=1,load=2,enter=3,halt=4;

always @(posedge clock)
begin
 if(rst==0)
 begin
  state<=INIT;
  R<=16'b0000000000000000;
  entered<=16'b0000000000000000;
  count<=2'b11;
  valid_bit<=0;
 end
 else
 begin
  case(state)
  INIT:
  begin
   R<=16'b0000000000000000;
   entered<=16'b0000000000000000;
   count<=2'b00;
   valid_bit<=0;
   if(enable1==1 || enable2==1)
   begin
   state<=button_wait;
   end
   else
   state<=INIT;
  end
  button_wait:
  begin
   if(auth_button==1)
   begin
    count<=count+2'b01;
    state<=load;
   end
   else state<=button_wait;
  end
  load:
  begin
   R[15:12]<=R[11:8];
   R[11:8]<=R[7:4];
   R[7:4]<=R[3:0];
   R[3:0]<=toggle_entry;
   if(count==2'b00)
   begin
    state<=enter;
   end
   else
   begin
    state<=button_wait;
   end
  end
  enter:
  begin
   valid_bit<=1;
   entered<=R;
   state<=halt;
   if(log_out==1)
   begin
    valid_bit<=0;
    state<=INIT;
   end
   else state<=enter;
  end
  halt:
  begin
   if(log_out==1)
   begin
    valid_bit<=0;
    state<=INIT;
   end
   else state<=halt;
  end
  endcase
 end
end
endmodule
