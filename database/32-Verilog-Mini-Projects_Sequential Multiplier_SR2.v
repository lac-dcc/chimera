//SR

module s3(clk,rst,d,l,q2);

input clk,rst,l;
input [7:0] d;
output reg [7:0] q2;

always @(posedge clk)
begin
if(rst)
q2=0;
else if(l)
q2=q2;
else
q2=d;
end
endmodule
