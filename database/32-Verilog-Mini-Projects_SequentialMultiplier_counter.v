 //Counter 

module counter(reset,l,clk);

input reset,clk;
output reg l;
integer i;

always @(posedge clk)
begin
if(reset)
begin
i=0;
l=0;
end
else
begin
if(i==7)
l=1;
else
begin
i=i+1;
l=0;
end
end
end
endmodule
