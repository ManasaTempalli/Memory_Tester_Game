`timescale 1ps/1ps
module tb_game();
reg clock,rst;
reg button_pulse,auth_bit,punch_button;
reg [3:0] level_num;
reg [3:0] toggle_answer;
wire [3:0] flash_num;
wire win,loose;
integer i;

game_module test_game(button_pulse,auth_bit,punch_button,level_num,toggle_answer,flash_num,win,loose,clock,rst);

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
#5 auth_bit=1;level_num=3'b101;
@(posedge clock);
#5 button_pulse=0;
@(posedge clock);
@(posedge clock);
@(posedge clock);
@(posedge clock);
#5 button_pulse=1;
for(i=0;i<=3000;i=i+1)
begin
@(posedge clock);
end
#5 toggle_answer=4'b0100;
@(posedge clock);
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;
@(posedge clock);
#5 toggle_answer=4'b1000;
@(posedge clock);
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;
@(posedge clock);
#5 toggle_answer=4'b0101;
@(posedge clock);
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;
@(posedge clock);
#5 toggle_answer=4'b0111;
@(posedge clock);
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;
@(posedge clock);
#5 toggle_answer=4'b0110;
@(posedge clock);
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;
@(posedge clock);
#5 toggle_answer=4'b1000;
@(posedge clock);
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;
@(posedge clock);
#5 toggle_answer=4'b1111;
@(posedge clock);
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;


end
endmodule
