//MISSION-V
//level tabel top module
`timescale 1ps/1ps
module level_top_module(levelupdated,green_user,rng_button,log_out,auth_bit,win,internal_id,level_num,clock,rst);
//Declaring inputs and outputs
input clock,rst;
input rng_button,log_out,auth_bit,win,green_user;
input [2:0] internal_id;
output [3:0] level_num;
output levelupdated;

wire [2:0] address,data,q;
wire wren;


Level_Controller level_con1(levelupdated,green_user,rng_button,log_out,internal_id,auth_bit,win,address,q,data,wren,level_num,clock,rst);
level_table level_tab1(address,clock,data,wren,q);

endmodule
