`timescale 1ps/1ps
module tb_timer_100ms();
reg clock,rst,enable,stop_in;
wire time_out;
integer i;
timer_100ms test_timer_100ms(clock,rst,enable,time_out,stop_in);

always
begin
 clock=0;
 #10;
 clock=1;
 #10;
end

initial begin
rst=0;
@(posedge clock);
#5 rst=1;
@(posedge clock);
#5 enable=1;
@(posedge clock);
#5 enable=0;
 for(i=0;i<=1000;i=i+1)
 begin
 @(posedge clock);
 end
#5 stop_in=1;
@(posedge clock);
#5 stop_in=0;
 for(i=0;i<=1000;i=i+1)
 begin
 @(posedge clock);
 end
#5 enable=1;
@(posedge clock);
#5 enable=0;


end
endmodule
