module two_digit_timer(clock,rst,twodigit,begin_timer,load_time,reconfig2,input_num,time_stop,timedig1,timedig2,stop,b);
input clock,rst;
input begin_timer,load_time,stop,twodigit;
input [3:0] reconfig2;
input [7:0] input_num;
output time_stop;
output [3:0] timedig1,timedig2;

wire outpulse,borrow,stop_upstream;
output b;

Reconfig_timer reconinst2(clock,rst,begin_timer,reconfig2,outpulse,stop);
timer_digit2 timedig11(outpulse,load_time,input_num[3:0],timedig1,stop_upstream,time_stop,borrow,clock,rst);
timer_digit2 timedig22(borrow,load_time,input_num[7:4],timedig2,twodigit,stop_upstream,b,clock,rst);
endmodule
