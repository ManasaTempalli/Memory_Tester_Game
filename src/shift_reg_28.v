//MISSION-V
//shift register for 28 bit sequence storage
module shift_reg_28(flash_num,reg_enable,shl,Q,clock,rst);
 input shl,reg_enable,rst,clock;
 input [3:0] flash_num;
 output [27:0] Q;
 reg [27:0] R;

always @(posedge clock)
begin
 if(rst==0)
 R<=28'b0;
 else if (reg_enable==1)
 begin
  if(shl==1)
  begin
  R[3:0]<=flash_num;
  R[7:4]<=R[3:0];
  R[11:8]<=R[7:4];
  R[15:12]<=R[11:8];
  R[19:16]<=R[15:12];
  R[23:20]<=R[19:16];
  R[27:24]<=R[23:20];
  end
  else R<=R;
 end
 else R<=28'b0;
end
assign Q=R; 
endmodule
