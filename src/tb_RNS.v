//MISSION-V
//test bench for Random sequence Generator
`timescale 1 ps/1 ps
module tb_RNS();
reg button_pulse,clock,rst,time_in,auth_bit;
reg [2:0] level_num;
wire [3:0] flash_num;
wire [27:0] store_reg;
wire time_out,reg_enable2;
wire[3:0] reconfig;

RSG rsg1(button_pulse,auth_bit,level_num,time_in,time_out,flash_num,reg_enable2,store_reg,reconfig,clock,rst);

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
 #5 rst=1;
 @(posedge clock);
 #5 level_num=3'b011;
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 button_pulse=0;
 @(posedge clock);
 #5 auth_bit=1;
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 button_pulse=1;
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 time_in=1;
 @(posedge clock);
 #5 time_in=0;
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 time_in=1;
 @(posedge clock);
 #5 time_in=0;

 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 time_in=1;
 @(posedge clock);
 #5 time_in=0;

 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 time_in=1;
 @(posedge clock);
 #5 time_in=0;
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 time_in=1;
 @(posedge clock);
 #5 time_in=0;
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 button_pulse=0;
 @(posedge clock);
 #5 auth_bit=1;
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 button_pulse=1;


end
endmodule
