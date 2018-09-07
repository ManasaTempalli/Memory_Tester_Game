//MISSION-V
//Test bench for ROM user ID top module
`timescale 1ps/1ps
module tb_ROM_User_ID_Top();
 reg [3:0] toggle_entry;
 reg [6:0] status;
 reg auth_button,log_out;
 reg clock,rst;
 wire [2:0] internal_id;
 wire ROM_access,RAM_access,red_led_user,green_led_user;


ROM_User_ID_Top_Module ROM_User_Top1(toggle_entry,auth_button,status,internal_id,ROM_access,RAM_access,green_led_user,red_led_user,log_out,clock,rst);


always
begin
 clock=0;
 #10;
 clock=1;
 #10;
end

initial
begin
 rst=0;toggle_entry=4'b1100;status=7'b0000000;
 @(posedge clock);
 #5 rst=1;
 @(posedge clock);
 #5 auth_button=1;
 @(posedge clock);
 #5 auth_button=0;
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
 #5 toggle_entry=4'b0110;
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
 #5 toggle_entry=4'b1000;
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
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 log_out=1;
 @(posedge clock);
 #5 log_out=0;
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 toggle_entry=4'b1100;status=7'b0000010;
 @(posedge clock);
 #5 rst=1;
 @(posedge clock);
 #5 auth_button=1;
 @(posedge clock);
 #5 auth_button=0;
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
 #5 toggle_entry=4'b0110;
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
 #5 toggle_entry=4'b1000;
 @(posedge clock);
 #5 auth_button=1;
 @(posedge clock);
 #5 auth_button=0;
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
end
endmodule
