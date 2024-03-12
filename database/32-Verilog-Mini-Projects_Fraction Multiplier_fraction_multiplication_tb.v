module fraction_multiplication_tb;

reg [3:0] Mplier,Mcand;
wire [6:0] Product;
reg CLK,St;
wire Done;
fraction_multiplication x1 (CLK, St, Mplier, Mcand, Product, Done);

initial
begin
CLK=1;
forever #5 CLK=~CLK;
end

initial
begin
#20;


St=1;
Mplier=255;
Mcand=255;
#10
St=0;
#100


#20

St=1;
Mplier=128;
Mcand=128;
#10
St=0;
#100

St=1;
Mplier=128;
Mcand=0;
#10
St=0;
#100

St=1;
Mplier=128;
Mcand=1;
#10
St=0;
#100

St=1;
Mplier=25;
Mcand=5;
#10
St=0;
#100

St=1;
Mplier=64;
Mcand=64;
#10
St=0;
#100

St=1;
Mplier=36;
Mcand=36;
#10
St=0;
#100

St=1;
Mplier=11;
Mcand=33;
#10
St=0;
#100

St=1;
Mplier=80;
Mcand=10;
#10
St=0;
#100;
end
endmodule
