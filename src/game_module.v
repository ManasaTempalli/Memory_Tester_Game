//MISSION-V
//Game Module
module game_module(twodigit,time_stop,begin_timer,reconfig2,input_num,load_time,stop,levelupdated,logout,button_pulse,auth_bit,punch_button,level_num,toggle_answer,flash_num,win,loose,seg_in_ans,clock,rst);
input clock,rst;
input button_pulse,auth_bit,punch_button,logout,levelupdated;
input [3:0] level_num;
input [3:0] toggle_answer;
input time_stop;
output begin_timer,load_time;
output [3:0] reconfig2;
output [7:0] input_num;
output [4:0] flash_num;
output win,loose,stop,twodigit;
output [3:0] seg_in_ans;

wire reg_enable2;
wire [27:0] store_reg;
wire time_out,time_in;
wire[3:0] reconfig;
wire win,loose;

RSG rsg2(win,loose,twodigit,time_stop,begin_timer,reconfig2,input_num,load_time,stop,logout,button_pulse,auth_bit,level_num,time_in,time_out,flash_num,reg_enable2,store_reg,reconfig,clock,rst);
Comparision comp1(time_stop,levelupdated,logout,button_pulse,level_num,store_reg,toggle_answer,auth_bit,punch_button,reg_enable2,win,loose,seg_in_ans,clock,rst);
Reconfig_timer reconfig_inst(clock,rst,time_out,reconfig,time_in);

endmodule
