module multiplier_tb;

reg [15:0] x,y;
wire [31:0] out;
reg clk,reset;
multiplier x1 (clk,reset,x,y,out);

initial
begin
clk=1;
forever #5 clk=~clk;
end

initial
begin
reset=1;
#20;

reset=0;
x=255;
y=255;
#100

reset=1;
#20

reset=0;
x=128;
y=128;
#100


x=128;
y=0;
#100


x=128;
y=1;
#100


x=25;
y=5;
#100

x=64;
y=64;
#100

x=36;
y=36;
#100

x=11;
y=33;
#100

x=80;
y=10;
#100;
end
endmodule
