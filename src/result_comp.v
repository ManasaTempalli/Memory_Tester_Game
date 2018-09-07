//MISSION-V
//module for comparing entered sequence and random sequence
module result_comp(time_stop,levelupdated,logout,rng_button,auth_bit,punch_button,shif_answer,store_reg,level_num,win,loose,clock,rst);
input logout,rng_button,punch_button,auth_bit,levelupdated,time_stop;
input [27:0] shif_answer,store_reg;
input [3:0] level_num;
input clock,rst;
output reg win,loose;

reg [2:0] count;
reg [2:0] state;
parameter INIT=0,wait_for_rng=1,comp_res=2,wait_for_level=3;

always @(posedge clock)
begin
 if(rst==0)
 begin
  count<=3'b000;
  win<=0;
  loose<=0;
  state<=INIT;
 end
 else
 begin
 case(state)
 INIT:
 begin
  win<=0;
  loose<=0;
  case(level_num)
   4'b0001:
    count<=3'b011;
   4'b0010:
    count<=3'b100;
   4'b0011:
    count<=3'b101;
   4'b0100:
    count<=3'b110;
   4'b0101:
    count<=3'b111;
   default:
    state<=INIT;
  endcase
  if(auth_bit==1)
  state<=wait_for_rng;
 end
 wait_for_rng:
 begin
   
   case(level_num)
   4'b0001:
    count<=3'b011;
   4'b0010:
    count<=3'b100;
   4'b0011:
    count<=3'b101;
   4'b0100:
    count<=3'b110;
   4'b0101:
    count<=3'b111;
   default:
    state<=INIT;
  endcase
  win<=0;
  if(logout==1)
   state<=INIT;
  else if(rng_button==0)
  begin
  loose<=0;
  state<=comp_res;
  end
 end
 comp_res:
 begin
  if(logout==1)
   state<=INIT;
  else if(count!=0 && time_stop==1)
  begin
   loose<=1;
   win<=0;
   state<=wait_for_rng;
  end
  else if(punch_button==1)
  begin
  count<=count-3'b001;
  if(count==0)
  begin
   if(shif_answer!=0 && store_reg!=0)
   begin
    if(shif_answer==store_reg)
    begin
     win<=1;
     loose<=0;
     state<=wait_for_level;
    end
    else
    begin
     loose<=1;
     win<=0;
     state<=wait_for_rng;
    end
   end
  end
  end
 end
 wait_for_level:
 begin
 win<=0;
 if(levelupdated==1)
 begin
  state<=INIT;
 end
 end
 endcase
 end
end
endmodule
