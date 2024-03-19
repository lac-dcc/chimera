module CNU_6_tb();
reg clk;
reg signed [31:0] Q1;
reg signed [31:0] Q2;
reg signed [31:0] Q3;
reg signed [31:0] Q4;
reg signed [31:0] Q5;
reg signed [31:0] Q6;
wire signed [31:0] R1;
wire signed [31:0] R2;
wire signed [31:0] R3;
wire signed [31:0] R4;
wire signed [31:0] R5;
wire signed [31:0] R6;

CNU_6 dc1(
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
.clk(clk)
);

initial begin
#20 
Q1 = 32'hfffffffe; 
Q2 = 32'hfffffffc;
Q3 = 32'd5;
Q4 = 32'hfffffffa;
Q5 = 32'd7;
Q6 = 32'd8;

#150 $finish;
end

initial begin
clk =1'b0;
//rst =1'b1;
 #20 clk = ~clk;
//rst =1'b0;

 #20 clk = ~clk;
 #20 clk = ~clk;
forever #20 clk = ~clk;
end

always@(negedge clk)
//begin
//if (~rst)
//always@*
begin
$display("Inputs; %d : %d : %d : %d : %d :%d",Q1,Q2,Q3,Q4,Q5,Q6);
$display("Outputs; %d : %d : %d : %d : %d :%d",R1,R2,R3,R4,R5,R6);
end
endmodule
