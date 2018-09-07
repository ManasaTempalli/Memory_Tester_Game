//MISSION-V
//Module for getting results and compare
module Comparision(time_stop,levelupdated,logout,rng_button,level_num,store_reg,toggle_answer,auth_bit,punch_button,reg_enable2,win,loose,seg_in_ans,clock,rst);
input logout,rng_button,auth_bit,punch_button,reg_enable2,clock,rst,levelupdated,time_stop;
input [3:0] toggle_answer;
input [27:0] store_reg;
input[3:0] level_num;
output win,loose;
output [3:0] seg_in_ans;

wire [27:0] shif_answer;

result_comp res1(time_stop,levelupdated,logout,rng_button,auth_bit,punch_button,shif_answer,store_reg,level_num,win,loose,clock,rst);
shift_reg_28 shl28reg(toggle_answer,reg_enable2,punch_button,shif_answer,clock,rst);
load_register loadinst(logout,toggle_answer,seg_in_ans,punch_button,reg_enable2,clock,rst);

endmodule
