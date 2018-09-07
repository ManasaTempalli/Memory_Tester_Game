// ECE6370
// Author: Manasa Tempalli 5355
// Button Inverter
module Button_Inverter(button_pulse,auth_bit,clk,rst,button_inv);
 input button_pulse,clk,rst,auth_bit;
 output reg button_inv;

 always @ (posedge clk)
 begin
 if(rst==0)
 button_inv<=0;
 else
 begin
 if(auth_bit==1)
 button_inv<=~(button_pulse);
 else button_inv<=0;
 end
 end
endmodule
