// ECE6370
// Author: Manasa Tempalli 5355
// Register for storing and loading
module load_register(logout,I,Q,ld,enable,clk,rst);
 input[3:0] I;
 input ld,clk,rst,enable,logout;
 output[3:0] Q;

 reg[3:0] R;
 
always @ (posedge clk)
begin
//Register bits set to '0' when reset is set
 if(rst==0) 
  begin
  R<=4'b0000;
  end
//storing to the register when load button set to '1'
 else if(enable==1)
 begin
 if(logout==1)
  R<=4'b0000;
 if(ld==1)
  begin
  R<=I;
  end
 end
 else R<=4'b0000;
end
//assigning R to Q
assign Q=R;
endmodule
