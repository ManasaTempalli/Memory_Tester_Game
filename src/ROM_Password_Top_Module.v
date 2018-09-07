//MISSION-V
//ROM password top module
module ROM_Password_Top_Module(ROM_access,rng_button,auth_button,log_out,toggle_entry,internal_id,auth_bit,red_led,green_led,RAM_access,password_change,clock,rst);
 input auth_button,log_out,ROM_access,rng_button;
 input[3:0] toggle_entry;
 input [2:0] internal_id;
 input clock,rst;
 output auth_bit, red_led, green_led, RAM_access, password_change; 
 wire [2:0] address;
 wire [15:0] password;
 wire valid_bit;
 wire [15:0] entered;

Shift_Reg shif_rompass1(ROM_access,ROM_access,toggle_entry,auth_button,log_out,entered,valid_bit,clock,rst);
ROM_Password_Control ROM_Password_control1(rng_button,valid_bit, ROM_access,auth_button,log_out, entered, internal_id, address, password, auth_bit, red_led, green_led, RAM_access, password_change,clock, rst);
ROM_Password_Module ROM_Password1(address,clock,password);

endmodule
