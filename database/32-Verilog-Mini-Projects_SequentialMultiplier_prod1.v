//Prod1
module s4(clk,rst,d,l,q3);

input clk,rst,l,d;
output reg [7:0] q3;

always @(negedge clk)
begin
if(rst)
q3<=7'd0;
else if(l)
q3<=q3;
else
begin
q3[0]<=q3[1];
q3[1]<=q3[2];
q3[2]<=q3[3];
q3[3]<=q3[4];
q3[4]<=q3[5];
q3[5]<=q3[6];
q3[6]<=q3[7];
q3[7]<=d;
end
end
endmodule
