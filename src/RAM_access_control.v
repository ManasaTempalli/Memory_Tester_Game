//MISSION-V
//RAM access control
module RAM_access_control(RAM_access1,RAM_access2,password_change,internal_id,auth_button,wren,entered,valid_bit,data,address,password,status,log_out,green_led,red_led,auth_bit,clock,rst);
 input RAM_access1,RAM_access2,password_change,valid_bit,log_out,auth_button;
 input clock,rst;
 input[2:0] internal_id;
 input [15:0] entered,password;
 output reg[15:0] data;
 output reg[2:0] address;
 output reg [6:0] status;
 output reg red_led,green_led,auth_bit,wren;

 reg[3:0] state;
 parameter INIT=0,password_update=1,update=2,update_done=3,password_check=4,RAM_addr=5,delay1=6,delay2=7,compare=8,success=9,fail=10,halt=11;


always @(posedge clock)
begin
 if(rst==0)
 begin
  state<=INIT;
   red_led<=0;
   green_led<=0;
   auth_bit<=0;
   address<=3'b000;
   data<=16'b0000000000000000;
   status<=7'b0000000;
 end
 else
 begin
  case(state)
  INIT:
  begin
   red_led<=0;
   green_led<=0;
   auth_bit<=0;
   address<=3'b000;
   wren<=0;
   if(RAM_access2==1 && password_change==1)
   begin
    state<=password_update;
   end
   else if(RAM_access1==1 && password_change==0)
   begin
    state<=password_check;
   end
   else
    state<=INIT;
  end
  password_update:
  begin
   address<=internal_id;
   wren<=password_change;
   state<=update;
  end
  update:
  begin
   if(valid_bit==1)
   begin
   data<=entered;
   state<=update_done;
   end
  end
  update_done:
  begin
   green_led<=1;
   status[internal_id]<=1;
   state<=halt;
    if(log_out==1)
    begin
     state<=INIT;
    end
  end
  password_check:
  begin
   if(valid_bit==1)
   begin
    state<=RAM_addr;
   end
  end
  RAM_addr:
  begin
   address<=internal_id;
   state<=delay1;
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
    state<=success;
   end
   else
   begin
    state<=fail;
   end
  end
  success:
  begin
   green_led<=1;
   red_led<=0;
   auth_bit<=1;
   state<=halt;
   if(log_out==1)
   begin
    wren<=0;
    state<=INIT;
   end
  end
  fail:
  begin
   red_led<=1;
   green_led<=0;
   if(log_out==1)
   begin
    wren<=0;
    state<=INIT;
   end
  if(auth_button==1)
  begin
   state<=password_check;
  end
  end
  halt:
  begin
   if(log_out==1)
   begin
    state<=INIT;
   end
   
  end
  endcase
 end
end
endmodule
