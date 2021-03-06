//MISSION-V
//Test bench for ROM password top module
`timescale 1ps/1ps
module tb_ROM_Password_Top();
 reg auth_button,log_out,ROM_access,rng_button;
 reg[3:0] toggle_entry;
 reg [2:0] internal_id;
 reg clock,rst;
 wire auth_bit, red_led, green_led, RAM_access, password_change; 

ROM_Password_Top_Module ROM_Pass_Top1(ROM_access,rng_button,auth_button,log_out,toggle_entry,internal_id,auth_bit,red_led,green_led,RAM_access,password_change,clock,rst);

always
begin
 clock=0;
 #10;
 clock=1;
 #10;
end

initial
begin
 //correct password and log_out operation
 rst=0; internal_id=3'b100;ROM_access=1;
 toggle_entry=4'b0100;
 @(posedge clock);
 #5 rst=1;
 @(posedge clock);
 #5 auth_button=1;
 @(posedge clock);
 #5 auth_button=0;
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 toggle_entry=4'b0111;
 @(posedge clock);
 #5 auth_button=1;
 @(posedge clock);
 #5 auth_button=0;
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 toggle_entry=4'b1110;
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
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 auth_button=1;
 @(posedge clock);
 #5 auth_button=0;
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 log_out<=1;
 @(posedge clock);
 #5 log_out<=0;

//checking RAM access after rng button is pressed
 internal_id=3'b100;ROM_access=1;
 toggle_entry=4'b0100;
 @(posedge clock);
 #5 rst=1;
 @(posedge clock);
 #5 auth_button=1;
 @(posedge clock);
 #5 auth_button=0;
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 toggle_entry=4'b0111;
 @(posedge clock);
 #5 auth_button=1;
 @(posedge clock);
 #5 auth_button=0;
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 toggle_entry=4'b1110;
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
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 rng_button=0;
 @(posedge clock);
 #5 rng_button=1;
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 auth_button=1;
 @(posedge clock);
 #5 auth_button=0;
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 log_out<=1;
 @(posedge clock);
 #5 log_out<=0;

end
endmodule
