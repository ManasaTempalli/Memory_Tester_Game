//MISSION-V
//Test bench for shift register
module tb_shift_reg();
 reg[3:0] toggle_entry;
 reg clock,rst,auth_button,enable1,enable2,log_out;
 wire [15:0] entered;
 wire valid_bit; 

Shift_Reg test_shift_reg1(enable1,enable2,toggle_entry,auth_button,log_out,entered,valid_bit,clock,rst);


//P1 Generating clock pulses
always
begin
 clock=0;
 #10;
 clock=1;
 #10;
end

//P2
initial
begin
 rst=0; toggle_entry=4'b0001;enable1=1;
 @(posedge clock);
 #5 rst=1;
 @(posedge clock);
 #5 auth_button=1;
 @(posedge clock);
 #5 auth_button=0;
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 toggle_entry=4'b0010;
 @(posedge clock);
 #5 auth_button=1;
 @(posedge clock);
 #5 auth_button=0;
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 toggle_entry=4'b0011;
 @(posedge clock);
 #5 auth_button=1;
 @(posedge clock);
 #5 auth_button=0;
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 toggle_entry=4'b0100;
 @(posedge clock);
 #5 auth_button=1;
 @(posedge clock);
 #5 auth_button=0;
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 log_out=1;
 @(posedge clock);
 #5 log_out=0;
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 toggle_entry=4'b0001;enable1=1;
 @(posedge clock);
 #5 rst=1;
 @(posedge clock);
 #5 auth_button=1;
 @(posedge clock);
 #5 auth_button=0;
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 toggle_entry=4'b0010;
 @(posedge clock);
 #5 auth_button=1;
 @(posedge clock);
 #5 auth_button=0;
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 toggle_entry=4'b0011;
 @(posedge clock);
 #5 auth_button=1;
 @(posedge clock);
 #5 auth_button=0;
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 toggle_entry=4'b0100;
 @(posedge clock);
 #5 auth_button=1;
 @(posedge clock);
 #5 auth_button=0;
 @(posedge clock);
end
endmodule
