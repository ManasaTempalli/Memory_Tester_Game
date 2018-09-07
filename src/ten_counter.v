module ten_counter(pulse,clk,rst,countsec);
	input clk,rst,pulse;
	output reg countsec;
	reg [3:0] count;

	always @(posedge clk)
		begin
			if(rst == 0)
				begin
					count<=0;
					countsec=0;
					
				end
			else
				begin
					if(pulse==1) begin
					
						if(count>4'b1010) begin
							count<=4'b0000;
						end
						count <=count+4'b0001;
						
						if(count==4'b1010) begin	
							countsec=1;
							count<=0;
						end
						else begin
							countsec=0;
						end	
					end
					else begin
					if(countsec==1)begin
					countsec=0;
					end
					
					end
									
				end
		end
endmodule

