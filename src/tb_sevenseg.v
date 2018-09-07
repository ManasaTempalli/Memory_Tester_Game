//MISSION-V
//seven segment test bench

module tb_sevenseg();
  reg[3:0] seg_in;
 wire[6:0] seg_out;

seven_seg test_seven(seg_in, seg_out);

initial
begin
 seg_in=4'bzzzz;
end
endmodule
