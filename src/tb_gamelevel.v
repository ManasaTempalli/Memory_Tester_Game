`timescale 1ps/1ps

module tb_gamelevel();

reg rng_button,auth_bit,punch_button,log_out,clock,rst,green_user;
reg [3:0] toggle_answer;
reg [2:0] internal_id;
wire [3:0] flash_num;
wire  loose;
wire win;
wire[3:0] level_num;
wire [3:0] seg_in_ans;
wire [6:0] seg_ans,flash_seg;
integer i;

game_level testgamelevel(rng_button,green_user,auth_bit,punch_button,log_out,clock,rst,toggle_answer,internal_id,flash_num,loose,win,level_num,seg_in_ans,flash_seg,seg_ans,clock,rst);

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
#5 green_user=1;internal_id<=3'b001;
@(posedge clock);
for(i=0;i<=20;i=i+1)
begin
@(posedge clock);
end 
#5 auth_bit=1;
@(posedge clock);

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
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;
#5 toggle_answer=4'b1101;
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
@(posedge clock);
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;
#5 toggle_answer=4'b0100;
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
@(posedge clock);
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;

//level 2
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
#5 toggle_answer=4'b0100;
@(posedge clock);
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;
#5 toggle_answer=4'b1000;
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
@(posedge clock);
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;
#5 toggle_answer=4'b0101;
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
@(posedge clock);
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;
#5 toggle_answer=4'b0111;
@(posedge clock);
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;

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
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;
#5 toggle_answer=4'b0101;
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
@(posedge clock);
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;
#5 toggle_answer=4'b0110;
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
@(posedge clock);
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;
#5 toggle_answer=4'b1110;
@(posedge clock);
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;
#5 toggle_answer=4'b0011;
@(posedge clock);
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;
#5 toggle_answer=4'b0011;
@(posedge clock);
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;

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
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;
#5 toggle_answer=4'b0110;
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
@(posedge clock);
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;
#5 toggle_answer=4'b1111;
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
@(posedge clock);
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;
#5 toggle_answer=4'b0100;
@(posedge clock);
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;
#5 toggle_answer=4'b0101;
@(posedge clock);
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;
#5 toggle_answer=4'b0110;
@(posedge clock);
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;

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
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;
#5 toggle_answer=4'b1110;
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
@(posedge clock);
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;
#5 toggle_answer=4'b0100;
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
@(posedge clock);
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;
#5 toggle_answer=4'b0101;
@(posedge clock);
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;
#5 toggle_answer=4'b1000;
@(posedge clock);
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;
#5 toggle_answer=4'b1101;
@(posedge clock);
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;
#5 toggle_answer=4'b0101;
@(posedge clock);
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;
for(i=0;i<=40;i=i+1)
begin
@(posedge clock);
end
#5 rng_button=0;
@(posedge clock);
@(posedge clock);
#5 rng_button=1;
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;

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
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;
#5 toggle_answer=4'b0100;
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
@(posedge clock);
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;
#5 toggle_answer=4'b0110;
for(i=0;i<=3;i=i+1)
begin
@(posedge clock);
end
@(posedge clock);
#5 punch_button=1;
@(posedge clock);
#5 punch_button=0;
end
endmodule
