// ECE6370
// Author: Manasa Tempalli 5355
// Test bench for RNG
`timescale 1ps/1ps
module tb_RNG();
reg button_pulse,clk,rst,auth_bit;
wire [3:0] random_num;
wire enable;
RNG rng1(button_pulse,auth_bit,clk,rst,random_num,enable);
always
begin
#10 clk=0;
#10 clk=1;
end
initial 
begin
rst=0;button_pulse=0;
@(posedge clk);
#5 rst=1;
@(posedge clk);
#5 auth_bit=1;
#60 button_pulse=1;
@(posedge clk);
@(posedge clk);
#5 button_pulse=0;
@(posedge clk);
#40 button_pulse=1;
end
endmodule

