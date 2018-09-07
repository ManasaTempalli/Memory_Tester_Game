// ECE6370
// Author: Manasa Tempalli 5355
//Seven segment display mapping 
module seven_seg5(seg_in, seg_out);
 //declaring inputs and outputs
 input[4:0] seg_in;
 output[6:0] seg_out;
 reg[6:0] seg_out;
 
 //loop for sensitivity list
 always @ (seg_in)
 begin //mapping inputs to the display leds begins
//'0' turns LED On and '1' turns LED Off
  case(seg_in)
   5'b00000:
   begin
    seg_out=7'b0000001;
    //displays '0'
   end
   5'b00001:
   begin
    seg_out=7'b1001111;
    //displays '1'
   end
   5'b00010:
   begin
    seg_out=7'b0010010;
    //displays '2'
   end
   5'b00011:
   begin
    seg_out=7'b0000110;
    //displays '3'
   end
   5'b00100:
   begin
    seg_out=7'B1001100;
    //displays '4'
   end
   5'b00101:
   begin
    seg_out=7'b0100100;
    //displays '5'
   end
   5'b00110:
   begin
    seg_out=7'b0100000;
    //displays '6'
   end
   5'b00111:
   begin
    seg_out=7'b0001111;
    //displays '7'
   end
   5'b01000:
   begin
    seg_out=7'b0000000;
    //displays '8'
   end
   5'b01001:
   begin
    seg_out=7'b0000100;
    //displays '9'
   end
   5'b01010:
   begin
    seg_out=7'b0000010;
    //displays 'a'
   end
   5'b01011:
   begin
    seg_out=7'b1100000;
    //displays 'b'
   end
   5'b01100:
   begin
    seg_out=7'b0110001;
    //displays 'C'
   end
   5'b01101:
   begin
    seg_out=7'b1000010;
    //displays 'd'
   end
   5'b01110:
   begin
    seg_out=7'b0010000;
    //displays 'e'
   end
   5'b01111:
   begin
    seg_out=7'b0111000;
    //displays 'F'
   end
   default:
   begin
    seg_out=7'b1111111;
   end
  endcase
 end
endmodule
