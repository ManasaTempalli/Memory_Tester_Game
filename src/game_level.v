module game_level(rng_button,green_user,auth_bit,punch_button,log_out,clock,rst,toggle_answer,internal_id,flash_num,loose,win,level_num,seg_in_ans,flash_seg,seg_ans,clock,rst);
input rng_button,auth_bit,punch_button,log_out,clock,rst,green_user;
input [3:0] toggle_answer;
input [2:0] internal_id;
output wire [3:0] flash_num;
output  loose;
output wire win;
output wire[3:0] level_num;
output wire [3:0] seg_in_ans;
output [6:0] flash_seg,seg_ans;
wire button_pulse,levelupdated;


button_shaper b1(rng_button, button_pulse, clk, rst);
game_module gameleveltest(levelupdated,log_out,rng_button,auth_bit,punch_button,level_num,toggle_answer,flash_num,win,loose,seg_in_ans,clock,rst);
level_top_module levelgametest(levelupdated,green_user,punch_button,log_out,auth_bit,win,internal_id,level_num,clock,rst);
seven_seg s1(seg_in_ans,seg_ans);
seven_seg s2(flash_num,flash_seg);

endmodule
