module Reconfig_timer(clock,rst,enable,reconfig,outpulse,stop);
input clock,rst;
input enable,stop;
input [3:0] reconfig;
output outpulse;

wire lfsr_to,countsec;

LFSR lfsr1(clock,rst,lfsr_to,enable,stop);
ten_counter tencount1(lfsr_to,clock,rst,countsec);
reconfig_count recnfigcnt(countsec,clock,rst,reconfig,outpulse);

endmodule
