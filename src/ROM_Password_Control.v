// MISSION-V
// ROM password control
module ROM_Password_Control(rng_button,valid_bit, ROM_access,auth_button,log_out, entered, internal_id, address, password, auth_bit, red_led, green_led, RAM_access, password_change,clock, rst);
 //Declaring inputs and outputs
 input valid_bit,log_out,auth_button,ROM_access,rng_button;
 input [2:0] internal_id;
 input [15:0] entered,password;
 input clock,rst;
 output reg auth_bit,RAM_access,password_change;
 output reg red_led, green_led;
 output reg [2:0] address;

 //register to store state
 reg [2:0] state;
 parameter INIT=0,ROM_addr=1,delay1=2,delay2=3,compare=4,success=5,failed=6,halt=7;

 //loop at each positive edge of the clock
 always @ (posedge clock)
 begin
  if(rst==0)
  begin
   address<=3'b000;
   state<=INIT;
   red_led<=0;
   green_led<=0;
   auth_bit<=0;
   RAM_access<=0;
   password_change<=0;
  end
  else
  begin
   case(state)
   INIT:
   begin
    address<=3'b000;
    red_led<=0;
    green_led<=0;
    auth_bit<=0;
    RAM_access<=0;
    password_change<=0;
    if(ROM_access==1)
    begin
     state<=ROM_addr;
    end
    else
    begin
     state<=INIT;
     address<=3'b000;
    end
   end
   ROM_addr:
   begin
    if(valid_bit==1)
    begin
     address<=internal_id;
     state<=delay1;
    end
   end
   delay1:
   begin
    state<=delay2;
   end
   delay2:
   begin
    state<=compare;
   end
   compare:
   begin
    if(entered==password)
    begin
     green_led<=1;
     state<=success;
    end
    else
    begin
     state<=failed;
    end 
   end
   success:
   begin
    green_led<=1;
    red_led<=0;
    auth_bit<=1;
    if(log_out==1)
    begin
     RAM_access<=0;
     password_change<=0;
     state<=INIT;
    end 
    else state<=success;
    if(auth_button==1 && ROM_access==1)
    begin
     RAM_access<=1;
     password_change<=1;
     state<=halt;
    end
    else if(rng_button==0 && ROM_access==1)
    state<=halt;
    else state<=success;
   end
   failed:
   begin
    auth_bit<=0;
    red_led<=1;
    green_led=0;
    if(auth_button==1)
    begin
     state<=INIT;
    end
    else
     state<=failed;
    if(log_out==1)
    begin
     RAM_access<=0;
     password_change<=0;
     state<=INIT;
    end
    else state<=failed;
   end
   halt:
   begin
    if(log_out==1)
    begin
     RAM_access<=0;
     password_change<=0;
     state<=INIT;
    end
    else state<=halt;
   end
   endcase
  end
 end
endmodule
