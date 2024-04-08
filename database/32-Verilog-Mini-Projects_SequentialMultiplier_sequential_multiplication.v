
module final12 (a,b,op,load,reset,clk,valid);
input [7:0] a,b;
output [15:0] op;
output valid;
input clk,reset,load;
wire [7:0] x,y,z,s,po,lo;
wire c,v1,l,t;

s1 u1 (reset,a,clk,x,load);
s2 u2 (reset,load,clk,z,b);
assign y=x & {8{z[0]}};
counter u5 (t,l,clk);
assign valid=l;
adder u3 (y,po,c,s);
s3 u4 (clk,v1,{c,s[7:1]},l,po);
 s4 e1 (clk,v,s[0],l,lo);
assign op={po,lo};
assign v1= reset|load;
assign t=reset|load;

always @(l)
begin
if(op==a*b)
$display("the product of a=%d ,b=%d  is p=%d",a,b,op);
else
$display("Incorrect operation");
end
endmodule
