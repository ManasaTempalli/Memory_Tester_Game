//MISSION-V
//controller for RAM storing scores. Score controller
module score_controller(clock,rst,green_user,internal_id,auth_bit,log_out,level_num,win,loose,address,q,data,wren,disp_button,disp,green_max);
input clock,rst;
input [2:0] internal_id;
input [3:0] level_num;
input green_user,auth_bit,win,loose,log_out,disp_button;
input [5:0] q;
output reg wren,green_max;
output reg [2:0] address;
output reg [5:0] data;
output reg [5:0] disp;

reg [5:0] ind_score,team_max;
reg [3:0] state;
parameter INIT=0,wait1=1,wait2=2,read_team_max=3,wait3=4,wait4=5,read_ind_score=6,wait_for_win=7,update_RAM=8,wait5=9,wait6=10,wait7=11,update_team_max=12;

always @(posedge clock)
begin
	if(rst==0)
	begin
		address<=3'b000;
		disp<=6'b000000;
		ind_score<=6'b000000;
		team_max<=6'b000000;
		wren<=0;
		green_max<=0;
                state<=INIT;
	end
	else
	begin
        	case(state)
			INIT:
			begin
				address<=3'b111;
                                disp<=6'b000000;
				ind_score<=6'b000000;
				team_max<=6'b000000;
				wren<=0;
				green_max<=0;
				state<=wait1;
			end
			wait1:
			begin
				state<=wait2;
			end
			wait2:
			begin
				state<=read_team_max;
			end
			read_team_max:
			begin
				team_max<=q;
				if(green_user==1)
 				begin
					address<=internal_id;
					state<=wait3;
				end
			end
			wait3:
			begin
				state<=wait4;
			end
			wait4:
			begin
				state<=read_ind_score;
			end
			read_ind_score:
			begin
				ind_score<=q;
				if(auth_bit==1)
				state<=wait_for_win;
			end
			wait_for_win:
			begin
				wren<=1;
                                if(log_out==1)
				begin
					state<=update_RAM;
				end
				else if(win==1)
				begin
					ind_score<=ind_score+level_num;

				end
                       		else if(loose==1)
				begin
     					ind_score<=6'b000000;
				end
                                if(ind_score>=team_max)
				begin
					green_max<=1;
					team_max<=ind_score;
				end
      				else green_max<=0;
				if(disp_button==1)
				begin
					disp<=ind_score;
				end
                                else disp<=team_max;
			end
			update_RAM:
			begin
				data<=ind_score;
                                state<=wait5;
			end
			wait5:
			begin
                                address<=3'b111;
				state<=wait6;
			end
			wait6:
			begin
				state<=wait7;
			end
                        wait7:
                        begin
                                state<=update_team_max;
			end
                        update_team_max:
			begin
				data<=team_max;
				state<=INIT;
			end
		endcase
	end
end
endmodule
