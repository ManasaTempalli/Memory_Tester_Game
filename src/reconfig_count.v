module reconfig_count(pulse,clk,rst,reconfig,outpulse);
	input clk,rst,pulse;
        input [3:0]reconfig;
	output reg outpulse;
	reg [3:0] count;

	always @(posedge clk)
		begin
			if(rst == 0)
				begin
					count<=4'b0000;
					outpulse=0;
				
				end
			else
				begin
					if(pulse==1) begin
				
						if(count>reconfig) begin
							count<=4'b0000;
						end
						count <=count+4'b0001;
						if(count==reconfig) begin	
						outpulse=1;
						count<=0;
						end
						else begin
							outpulse=0;
						end
					end
					else begin
					if(outpulse==1)begin
					outpulse=0;
					end
				
					end
										
				end
		end
endmodule

