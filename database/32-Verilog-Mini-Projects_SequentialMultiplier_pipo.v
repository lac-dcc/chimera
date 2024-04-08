//PIPO
module s1(rst,d,clk,q,l);

input clk,l,rst;
input [7:0] d;
output reg [7:0] q;

always @(posedge clk)
begin
if(rst)
q=0;
else if(l)
q=d;
end
endmodule
