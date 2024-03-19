module VNU_6_tb();

wire P;
wire signed [31:0] Q1;
wire signed [31:0] Q2;
wire signed [31:0] Q3;
wire signed [31:0] Q4;
wire signed [31:0] Q5;
wire signed [31:0] Q6;
reg signed [31:0] R1;
reg signed [31:0] R2;
reg signed [31:0] R3;
reg signed [31:0] R4;
reg signed [31:0] R5;
reg signed [31:0] R6;
reg signed [31:0] L;
reg clk;
reg rst;

VNU_6 dc1(
.R1(R1),
.R2(R2),
.R3(R3),
.R4(R4),
.R5(R5),
.R6(R6),
.Q1(Q1),
.Q2(Q2),
.Q3(Q3),
.Q4(Q4),
.Q5(Q5),
.Q6(Q6),
.P(P),
.L(L),
.clk(clk),
.rst(rst)
);

initial begin
L = 32'd2;
#40 
L = 32'd4;
#10
R1 = 32'hfffffffc; 
R2 = 32'd10;
R3 = 32'd5;
R4 = 32'hfffffffa;
R5 = 32'd7;
R6 = 32'd8;
#40 
R1 = 32'hfffffffc; 
R2 = 32'd1;
R3 = 32'hfffffff5;
R4 = 32'hfffffffa;
R5 = 32'd7;
R6 = 32'd6;
L = 32'd4;
#100 $finish;
end

initial begin
clk =1'b0;
rst =1'b1;
 #20 clk = ~clk;
rst =1'b1;

 #20 clk = ~clk;
rst = 1'b0;
 #20 clk = ~clk;
forever #20 clk = ~clk;
end

always@(posedge clk)
//begin
//if (~rst)
//always@*
begin
$display("Output Q values : %d : %d : %d : %d : %d :%d ; Output decoded value : %b",Q1,Q2,Q3,Q4,Q5,Q6,P);
$display("Input R values ; %d : %d : %d : %d : %d :%d  ; Input L value :   %d",R1,R2,R3,R4,R5,R6,L);
end
endmodule
