//MISSION-V
//test bench for LFSR
module tb_lfsr();
  reg clock,rst,enable;
  wire time_out;


LFSR test_lfsr(clock,rst, enable, time_out);

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
 #5 rst=1;enable=1;
end
endmodule
