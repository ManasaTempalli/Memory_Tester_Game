module timer_digit2(decrement,load,input_num,output_num,stop_upstream,stop_downstream,borrow,clock,rst);
input decrement,load;
input clock,rst;
input [3:0] input_num;
input stop_upstream;
output [3:0] output_num;
output stop_downstream,borrow;

reg[3:0] num;
reg flag,flag2;
reg stop_down,b;

always @(posedge clock)
begin
 if(rst==0)
 begin
  stop_down=0;
  b<=0;
 end

 else
 begin
  if(load==1)
  begin
  stop_down<=0;
  num<=input_num;
  end
  if(decrement==1)
  begin
    if(num==4'b0001)
    begin
     if(stop_upstream==1)
     begin
       flag2<=1;
     end
    end
    if(num==4'b0000)
    begin
     if(stop_upstream==1)
     begin
      stop_down<=1;
      b<=0;
     end
     else
     begin
      b<=1;
     end
    end
   flag<=1;
  end
  else flag<=0;
  if(flag==1)
  begin
    if(flag2==1)
    begin
     stop_down<=1;
     flag2<=0;
    end
    if(num==4'b0000)
    begin
     b<=0;
     if(stop_upstream==1)
     begin
      num<=4'b0000;
     end
     else
     begin
      num<=4'b1001;
     end
    end
    else if(num!=4'b0000)
    begin
    b<=0;
    num<=num-4'b0001;
    end
  end
 end

end
assign output_num=num;
assign stop_downstream=stop_down;
assign borrow=b;
endmodule
