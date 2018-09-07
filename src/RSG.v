//MISSION-V
//Random Sequence Generator
module RSG(win,loose,twodigit,time_stop,begin_timer,reconfig2,input_num,load_time,stop,logout,button_pulse,auth_bit,level_num,time_in,time_out,flash_num,reg_enable2,store_reg,reconfig,clock,rst);
input logout,button_pulse,clock,rst,time_in,auth_bit;
input [3:0] level_num;
input time_stop;
input win,loose;
output begin_timer,load_time;
output [3:0] reconfig2;
output [7:0] input_num; 
output wire [4:0] flash_num;
output time_out,stop,twodigit;
output reg_enable2;
output [27:0] store_reg;
output [3:0] reconfig;
wire [3:0] random_num;
wire enable,reg_enable,shl;
wire [4:0] address,q;


RNG rn1(button_pulse,auth_bit,clock,rst,random_num,enable);
Random_seq rs1(win,loose,twodigit,time_stop,begin_timer,reconfig2,input_num,load_time,logout,random_num,enable,level_num,time_in,time_out,stop,address,q,reg_enable,reg_enable2,shl,flash_num,reconfig,clock,rst);
ROM_seq romseq1(address,clock,q);
shift_reg_28 shl28(flash_num,reg_enable,shl,store_reg,clock,rst);
endmodule
