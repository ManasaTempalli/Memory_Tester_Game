//MISSION-V
//score conv
`timescale 1ps/1ps
module score_conv(score,out_score,clock,rst);
 input clock,rst;
 input [5:0] score;
 output reg [7:0] out_score;

always @(posedge clock)
begin
 if(rst==0)
 begin
  out_score<=8'b00000000;
 end
 else
 begin
 case(score)
 6'b000000:out_score=8'b00000000;
 6'b000001:out_score=8'b00000001;
 6'b000010:out_score=8'b00000010;
 6'b000011:out_score=8'b00000011;
 6'b000100:out_score=8'b00000100;
 6'b000101:out_score=8'b00000101;
 6'b000110:out_score=8'b00000110;
 6'b000111:out_score=8'b00000111;
 6'b001000:out_score=8'b00001000;
 6'b001001:out_score=8'b00001001;
 6'b001010:out_score=8'b00010000;
 6'b001011:out_score=8'b00010001;
 6'b001100:out_score=8'b00010010;
 6'b001101:out_score=8'b00010011;
 6'b001110:out_score=8'b00010100;
 6'b001111:out_score=8'b00010101;
 6'b010000:out_score=8'b00010110;
 6'b010001:out_score=8'b00010111;
 6'b010010:out_score=8'b00011000;
 6'b010011:out_score=8'b00011001;
 6'b010100:out_score=8'b00100000;
 6'b010101:out_score=8'b00100001;
 6'b010110:out_score=8'b00100010;
 6'b010111:out_score=8'b00100011;
 6'b011000:out_score=8'b00100100;
 6'b011001:out_score=8'b00100101;
 6'b011010:out_score=8'b00100110;
 6'b011011:out_score=8'b00100111;
 6'b011100:out_score=8'b00101000;
 6'b011101:out_score=8'b00101001;
 6'b011110:out_score=8'b00110000;
 6'b011111:out_score=8'b00110001;
 6'b100000:out_score=8'b00110010;
 6'b100001:out_score=8'b00110011;
 6'b100010:out_score=8'b00110100;
 6'b100011:out_score=8'b00110101;
 6'b100100:out_score=8'b00110110;
 6'b100101:out_score=8'b00110111;
 6'b100110:out_score=8'b00111000;
 6'b100111:out_score=8'b00111001;
 6'b101000:out_score=8'b01000000;
 6'b101001:out_score=8'b01000001;
 6'b101010:out_score=8'b01000010;
 6'b101011:out_score=8'b01000011;
 6'b101100:out_score=8'b01000100;
 6'b101101:out_score=8'b01000101;
 6'b101110:out_score=8'b01000110;
 6'b101111:out_score=8'b01000111;
 6'b110000:out_score=8'b01001000;
 6'b110001:out_score=8'b01001001;
 6'b110010:out_score=8'b01010000;
 6'b110011:out_score=8'b01010001;
 6'b110100:out_score=8'b01010010;
 6'b110101:out_score=8'b01010011;
 6'b110110:out_score=8'b01010100;
 6'b110111:out_score=8'b01010101;
 6'b111000:out_score=8'b01010110;
 6'b111001:out_score=8'b01010111;
 6'b111010:out_score=8'b01011000;
 6'b111011:out_score=8'b01011001;
 6'b111100:out_score=8'b01100000;
 6'b111101:out_score=8'b01100001;
 6'b111110:out_score=8'b01100010;
 6'b111111:out_score=8'b01100011;
 endcase
 end
end
endmodule
