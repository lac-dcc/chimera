//SR

module s2(rst,l_s,clk,q1,d);

input l_s,clk,rst;
input [7:0] d;
output reg [7:0] q1;

always @(posedge clk)
begin
if(rst)
q1=0;
else if(l_s)
q1=d;
else
q1=q1>>1;
end
endmodule
