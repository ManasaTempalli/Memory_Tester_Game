// ECE6370
// Author: Manasa Tempalli 5355
//Random Number Generator
`timescale 1ps/1ps
module RNG(button_pulse,auth_bit,clk,rst,random_num,enable);
 input button_pulse,clk,rst,auth_bit;
 output [3:0] random_num;
 output enable;
 wire button_inv;

Button_Inverter button_inv1(button_pulse,auth_bit,clk,rst,button_inv);
four_Bit_Binary_Counter binary_counter1(button_inv,clk,rst,random_num,enable);
endmodule
