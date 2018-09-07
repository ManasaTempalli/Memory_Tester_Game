module timer_100ms(clock,rst,enable,time_out,stop_in);
input clock,rst,enable,stop_in;
output time_out;
wire time_in;

LFSR lfsr_inst(clock,rst, enable, time_in,stop_in);
ten_counter tencount_inst(clock,rst,time_out,time_in);

endmodule
