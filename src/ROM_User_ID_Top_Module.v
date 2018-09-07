//MISSION-V
//ROM user id top module
module ROM_User_ID_Top_Module(toggle_entry,auth_button,status,internal_id,ROM_access,RAM_access,green_led_user,red_led_user,log_out,clock,rst);
 input [3:0] toggle_entry;
 input [6:0] status;
 input auth_button,log_out;
 input clock,rst;
 output [2:0] internal_id;
 output ROM_access,RAM_access,red_led_user,green_led_user;
 wire [15:0] user_id,entered;
 wire [2:0] address;
 wire valid_bit;

Shift_Reg shift1(auth_button,auth_button,toggle_entry,auth_button,log_out,entered,valid_bit,clock,rst);
ROM_User_ID_Control ROM_user_control1(entered,log_out,valid_bit,status,address,user_id,internal_id,ROM_access,RAM_access,green_led_user,red_led_user,clock,rst);
ROM_User_ID_Module ROM_User_1(address,clock,user_id);

endmodule
