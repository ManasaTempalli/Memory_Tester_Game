//MISSION-V
//Test bench for Top module
`timescale 1ps/1ps
module tb_Top();
 reg auth_button,log_out,rng_button;
 reg [3:0] toggle_user,toggle_pass,toggle_answer;
 reg clock,rst;
 wire red_led_user,green_led_user,red_led_rom,green_led_rom,red_led_ram,green_led_ram,loose;
 wire [6:0] flash_seg,level_seg,seg_answer;

 integer i;

Project_Top_Module test_proj(auth_button,log_out,rng_button,toggle_user,toggle_pass,toggle_answer,red_led_user,green_led_user,red_led_rom,green_led_rom,red_led_ram,green_led_ram,loose,flash_seg,level_seg,seg_answer,clock,rst);
always
begin
 clock=0;
 #10;
 clock=1;
 #10;
end

initial
begin
//User ID test
 rst=0;toggle_user=4'b1100;
 @(posedge clock);
 #5 rst=1;
 @(posedge clock);
 #5 auth_button=0;
 @(posedge clock);
 @(posedge clock);
 #5 auth_button=1;
 @(posedge clock);
 #5 auth_button=0;
 @(posedge clock);
 @(posedge clock);
 #5 auth_button=1;
 @(posedge clock);
 @(posedge clock);
 #5 toggle_user=4'b0110;
 @(posedge clock);
 #5 auth_button=0;
 @(posedge clock);
 @(posedge clock);
 #5 auth_button=1;
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 toggle_user=4'b0111;
 @(posedge clock);
 #5 auth_button=0;
 @(posedge clock);
 @(posedge clock);
 #5 auth_button=1;
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 toggle_user=4'b1000;
 @(posedge clock);
 #5 auth_button=0;
 @(posedge clock);
 @(posedge clock);
 #5 auth_button=1;
 @(posedge clock);

//ROM Password Test
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 toggle_pass=4'b0010;
 @(posedge clock);
 #5 rst=1;
 @(posedge clock);
 #5 auth_button=0;
 @(posedge clock);
 @(posedge clock);
 #5 auth_button=1;
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 toggle_pass=4'b0101;
 @(posedge clock);
 #5 auth_button=0;
 @(posedge clock);
 @(posedge clock);
 #5 auth_button=1;
 @(posedge clock);
 @(posedge clock);
 #5 toggle_pass=4'b0110;
 @(posedge clock);
 #5 auth_button=0;
 @(posedge clock);
 @(posedge clock);
 #5 auth_button=1;
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 toggle_pass=4'b1111;
 @(posedge clock);
 #5 auth_button=0;
 @(posedge clock);
 @(posedge clock);
 #5 auth_button=1;
 @(posedge clock);

//RAM Password test
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 auth_button=0;
 @(posedge clock);
 @(posedge clock);
 #5 auth_button=1;
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 toggle_pass=4'b0001;
 @(posedge clock);
 #5 rst=1;
 @(posedge clock);
 #5 auth_button=0;
 @(posedge clock);
 @(posedge clock);
 #5 auth_button=1;
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 toggle_pass=4'b0010;
 @(posedge clock);
 #5 auth_button=0;
 @(posedge clock);
 @(posedge clock);
 #5 auth_button=1;
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 toggle_pass=4'b0011;
 @(posedge clock);
 #5 auth_button=0;
 @(posedge clock);
 @(posedge clock);
 #5 auth_button=1;
 @(posedge clock);
 @(posedge clock);
 @(posedge clock);
 #5 toggle_pass=4'b0100;
 @(posedge clock);
 #5 auth_button=0;
 @(posedge clock);
 @(posedge clock);
 #5 auth_button=1;
 for(i=0;i<=50;i=i+1)
 begin
 @(posedge clock);
 end
 #5 rng_button=0;
 @(posedge clock);
 @(posedge clock);
 #5 rng_button=1;
 

//level 1
for(i=0;i<=20;i=i+1)
begin
@(posedge clock);
end
#5 rng_button=0;
@(posedge clock);
@(posedge clock);
#5 rng_button=1;
for(i=0;i<=50;i=i+1)
begin
@(posedge clock);
end
#5 toggle_answer=4'b0011;
@(posedge clock);
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
#5 auth_button=0;
@(posedge clock);
@(posedge clock);
#5 auth_button=1;
#5 toggle_answer=4'b1101;
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
#5 auth_button=0;
@(posedge clock);
@(posedge clock);
#5 auth_button=1;
#5 toggle_answer=4'b0100;
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
#5 auth_button=0;
@(posedge clock);
@(posedge clock);
#5 auth_button=1;

//level 2
for(i=0;i<=20;i=i+1)
begin
@(posedge clock);
end
#5 log_out=1;
@(posedge clock);
#5 log_out=0;
#5 rng_button=0;
@(posedge clock);
@(posedge clock);
#5 rng_button=1;
for(i=0;i<=70;i=i+1)
begin
@(posedge clock);
end
#5 toggle_answer=4'b0100;
@(posedge clock);
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
#5 auth_button=0;
@(posedge clock);
@(posedge clock);
#5 auth_button=1;
#5 toggle_answer=4'b1000;
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
@(posedge clock);
#5 auth_button=0;
@(posedge clock);
@(posedge clock);
#5 auth_button=1;
#5 toggle_answer=4'b0101;
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
@(posedge clock);
#5 auth_button=0;
@(posedge clock);
@(posedge clock);
#5 auth_button=1;
#5 toggle_answer=4'b0111;
@(posedge clock);
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
#5 auth_button=0;
@(posedge clock);
@(posedge clock);
#5 auth_button=1;

//level 3
for(i=0;i<=20;i=i+1)
begin
@(posedge clock);
end
#5 rng_button=0;
@(posedge clock);
@(posedge clock);
#5 rng_button=1;
for(i=0;i<=70;i=i+1)
begin
@(posedge clock);
end
#5 toggle_answer=4'b1000;
@(posedge clock);
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
#5 auth_button=0;
@(posedge clock);
@(posedge clock);
#5 auth_button=1;
#5 toggle_answer=4'b0101;
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
@(posedge clock);
#5 auth_button=0;
@(posedge clock);
@(posedge clock);
#5 auth_button=1;
#5 toggle_answer=4'b0110;
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
@(posedge clock);
#5 auth_button=0;
@(posedge clock);
@(posedge clock);
#5 auth_button=1;
#5 toggle_answer=4'b1110;
@(posedge clock);
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
#5 auth_button=0;
@(posedge clock);
@(posedge clock);
#5 auth_button=1;
#5 toggle_answer=4'b0011;
@(posedge clock);
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
#5 auth_button=0;
@(posedge clock);
@(posedge clock);
#5 auth_button=1;
#5 toggle_answer=4'b0011;
@(posedge clock);
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
#5 auth_button=0;
@(posedge clock);
@(posedge clock);
#5 auth_button=1;

//level 4
for(i=0;i<=40;i=i+1)
begin
@(posedge clock);
end
#5 rng_button=0;
@(posedge clock);
@(posedge clock);
#5 rng_button=1;
for(i=0;i<=70;i=i+1)
begin
@(posedge clock);
end
#5 toggle_answer=4'b0101;
@(posedge clock);
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
#5 auth_button=0;
@(posedge clock);
@(posedge clock);
#5 auth_button=1;
#5 toggle_answer=4'b0110;
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
@(posedge clock);
#5 auth_button=0;
@(posedge clock);
@(posedge clock);
#5 auth_button=1;
#5 toggle_answer=4'b1111;
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
@(posedge clock);
#5 auth_button=0;
@(posedge clock);
@(posedge clock);
#5 auth_button=1;
#5 toggle_answer=4'b0100;
@(posedge clock);
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
#5 auth_button=0;
@(posedge clock);
@(posedge clock);
#5 auth_button=1;
#5 toggle_answer=4'b0101;
@(posedge clock);
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
#5 auth_button=0;
@(posedge clock);
@(posedge clock);
#5 auth_button=1;
#5 toggle_answer=4'b0110;
@(posedge clock);
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
#5 auth_button=0;
@(posedge clock);
@(posedge clock);
#5 auth_button=1;

//level 5
for(i=0;i<=70;i=i+1)
begin
@(posedge clock);
end
#5 rng_button=0;
@(posedge clock);
@(posedge clock);
#5 rng_button=1;
for(i=0;i<=70;i=i+1)
begin
@(posedge clock);
end
#5 toggle_answer=4'b0111;
@(posedge clock);
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
#5 auth_button=0;
@(posedge clock);
@(posedge clock);
#5 auth_button=1;
#5 toggle_answer=4'b1110;
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
@(posedge clock);
#5 auth_button=0;
@(posedge clock);
@(posedge clock);
#5 auth_button=1;
#5 toggle_answer=4'b0100;
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
@(posedge clock);
#5 auth_button=0;
@(posedge clock);
@(posedge clock);
#5 auth_button=1;
#5 toggle_answer=4'b0101;
@(posedge clock);
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
#5 auth_button=0;
@(posedge clock);
@(posedge clock);
#5 auth_button=1;
#5 toggle_answer=4'b1000;
@(posedge clock);
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
#5 auth_button=0;
@(posedge clock);
@(posedge clock);
#5 auth_button=1;
#5 toggle_answer=4'b1101;
@(posedge clock);
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
#5 auth_button=0;
@(posedge clock);
@(posedge clock);
#5 auth_button=1;
#5 toggle_answer=4'b0101;
@(posedge clock);
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
#5 auth_button=0;
@(posedge clock);
@(posedge clock);
#5 auth_button=1;
for(i=0;i<=40;i=i+1)
begin
@(posedge clock);
end
#5 rng_button=0;
@(posedge clock);
@(posedge clock);
#5 rng_button=1;
#5 auth_button=0;
@(posedge clock);
@(posedge clock);
#5 auth_button=1;

//level1 repeats
for(i=0;i<=10;i=i+1)
begin
@(posedge clock);
end
#5 rng_button=0;
@(posedge clock);
@(posedge clock);
#5 rng_button=1;
for(i=0;i<=50;i=i+1)
begin
@(posedge clock);
end
#5 toggle_answer=4'b1000;
@(posedge clock);
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
#5 auth_button=0;
@(posedge clock);
@(posedge clock);
#5 auth_button=1;
#5 toggle_answer=4'b0100;
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
@(posedge clock);
#5 auth_button=0;
@(posedge clock);
@(posedge clock);
#5 auth_button=1;
#5 toggle_answer=4'b0110;
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
@(posedge clock);
#5 auth_button=0;
@(posedge clock);
@(posedge clock);
#5 auth_button=1;
end
endmodule
