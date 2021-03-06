module LFSR(clk,rst,lfsr_to,button_pulse,stop);
  input clk,rst,button_pulse,stop; 
 //output reg lfsr_out;

 reg [10:0]count;
  reg [7:0] LFSR;
  output reg lfsr_to;
  reg flag;
 // assign lfsr_to = (LFSR == 11'h359);
  always @(posedge clk)
  begin
if (rst==0)begin 
LFSR[7:0] <= 8'h00;
count =0;
lfsr_to=0;
flag=0;
end
else
begin
if(button_pulse==1) begin
flag=1;
end
if(stop==1)
begin
flag=0;
end

if(flag==1)begin
if(LFSR ==8'h01)begin
count=count+1'b1;
end
if(count==11'b11110110000 && (LFSR == 8'h61)) begin
lfsr_to=1;
count=0;
end
else begin
lfsr_to=0;
end
if (lfsr_to) begin 
LFSR[7:0] <= 8'h00;
end
else
begin
     LFSR[0] <= ~LFSR[1] ^ LFSR[2] ^ LFSR[3] ^ LFSR[7];
    LFSR[7:1] <= LFSR[6:0];
 end
end
end
end
endmodule

