module VNU_6(
output reg signed [31:0] Q1,
output reg signed [31:0] Q2,
output reg signed [31:0] Q3,
output reg signed [31:0] Q4,
output reg signed [31:0] Q5,
output reg signed [31:0] Q6,
input  signed [31:0] R1,
input  signed [31:0] R2,
input  signed [31:0] R3,
input  signed [31:0] R4,
input  signed [31:0] R5,
input  signed [31:0] R6,
input  signed [31:0] L,
output P,
input clk,
input rst);

reg signed [31:0] P_sample;



assign P = P_sample[31]? 1'b1 : 1'b0;

always@(posedge clk or posedge rst)
begin

if(rst)
begin
P_sample = L;
Q1 = L;
Q2 = L;
Q3 = L;
Q4 = L;
Q5 = L;
Q6 = L;
end
else
begin
P_sample = R1 + R2 + R3 + R4 + R5 + R6 + L;
Q1 = P_sample - R1;
Q2 = P_sample - R2;
Q3 = P_sample - R3;
Q4 = P_sample - R4;
Q5 = P_sample - R5;
Q6 = P_sample - R6;
end
end
endmodule

