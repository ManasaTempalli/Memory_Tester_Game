//MISSION-V
//score top module
`timescale 1ps/1ps
module score_table(clock,rst,log_out,green_user,internal_id,auth_bit,win,loose,disp_button,level_num,disp_out,green_max);
input clock,rst,green_user,auth_bit,win,loose,disp_button,log_out;
input [3:0] level_num;
input [2:0] internal_id;
output [7:0] disp_out;
output green_max;
wire [2:0] address;
wire [5:0] data,q,disp;
wire wren;

score_controller scorecont1(clock,rst,green_user,internal_id,auth_bit,log_out,level_num,win,loose,address,q,data,wren,disp_button,disp,green_max);
RAM_score_module ramscore1(address,clock,data,wren,q);
score_conv scon1(disp,disp_out,clock,rst);
endmodule
