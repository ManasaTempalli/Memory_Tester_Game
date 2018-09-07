`timescale 1ps/1ps
module timecount(time_in,time_out,clock,rst);
 input time_in,clock,rst;
 output reg time_out;

 integer count;
 reg [0:0] state;
 parameter INIT=0,begin_count=1;

always @(posedge clock)
begin
if(rst==0)
begin
 count<=49999998;
 state<=INIT;
end
else
begin
case(state)
INIT:
 begin
 time_out<=0;
 count<=49999998;
 if(time_in==1)
  state<=begin_count;
end
begin_count:
begin
count<=count-1;
if(count==0)
begin
 time_out<=1;
 state<=INIT;
end
end
endcase
end
end
endmodule
