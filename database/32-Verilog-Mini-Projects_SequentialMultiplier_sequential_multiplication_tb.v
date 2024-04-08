module test;

reg [7:0] a,b;
wire [15:0] p;
reg clk,rst,load;
wire valid;
final12 x1 (a,b,p,load,rst,clk,valid);

initial
begin
clk=1;
forever #5 clk=~clk;
end

initial
begin
rst=1;
#20;

rst=0;
load=1;
a=255;
b=255;
#10
load=0;
#100

rst=1;
#20

rst=0;
load=1;
a=128;
b=128;
#10
load=0;
#100

load=1;
a=128;
b=0;
#10
load=0;
#100

load=1;
a=128;
b=1;
#10
load=0;
#100

load=1;
a=25;
b=5;
#10
load=0;
#100

load=1;
a=64;
b=64;
#10
load=0;
#100

load=1;
a=36;
b=36;
#10
load=0;
#100

load=1;
a=11;
b=33;
#10
load=0;
#100

load=1;
a=80;
b=10;
#10
load=0;
#100;
end
endmodule
