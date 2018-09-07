`timescale 1ps/1ps
module tb_reconfig();
reg clock,rst;
reg enable;
reg [3:0] reconfig;
reg stop_in;
wire time_out;
integer i;

reconfig_timer test_reconfig(clock,rst,enable,stop_in,reconfig,time_out);


always
begin
 clock=0;
 #10;
 clock=1;
 #10;
end
 
initial
begin
rst=0;
@(posedge clock);
#5 rst=1;reconfig=4'b1010;
@(posedge clock);
#5 enable=1;
@(posedge clock);
#5 enable=0;
 for(i=0;i<=2000;i=i+1)
 begin
 @(posedge clock);
 end
#5 stop_in=1;
@(posedge clock);
#5 stop_in=0;
 for(i=0;i<=2000;i=i+1)
 begin
 @(posedge clock);
 end
#5 enable=1;
@(posedge clock);
#5 enable=0;

end
endmodule
