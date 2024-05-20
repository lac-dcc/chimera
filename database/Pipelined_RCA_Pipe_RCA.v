// This program was cloned from: https://github.com/Nilesh002/Pipelined_RCA
// License: MIT License

`timescale 1ns / 1ps

module pipe_rca4 (Cout,Sum,A,B,Cin,Clk);
input [3:0]A,B;
input Cin;
input Clk;
output [3:0]Sum;
output Cout;

reg l12_a1, l12_a2, l12_a3, l12_b1, l12_b2, l12_b3, l12_cin;
reg l12_sum0, l12_cout0;

reg l23_a2, l23_a3, l23_b2, l23_b3, l23_sum0;
reg l23_sum1, l23_cout1;

reg l34_a3, l34_b3, l34_sum0, l34_sum1;
reg l34_sum2, l34_cout2;

reg l45_sum0, l45_sum1, l45_sum2, l45_sum3, l45_cout3;

assign Sum={l45_sum3,l45_sum2,l45_sum1,l45_sum0};
assign Cout=l45_cout3;


always@(posedge Clk)
begin
    l12_a1<=A[1];
    l12_a2<=A[2];
    l12_a3<=A[3];

    l12_b1<=B[1];
    l12_b2<=B[2];
    l12_b3<=B[3];

    l12_cin<=Cin;

    l12_sum0<=A[0] ^ B[0] ^ Cin;
    l12_cout0<=(A[0] & B[0]) | ((A[0] ^ B[0]) & Cin);
end


always@(posedge Clk)
begin
    l23_a2<=l12_a2;
    l23_a3<=l12_a3;

    l23_b2<=l12_b2;
    l23_b3<=l12_b3;

    l23_sum0<=l12_sum0;

    l23_sum1<=l12_a1 ^ l12_b1 ^ l12_cout0;
    l23_cout1<=(l12_a1 & l12_b1) | ((l12_a1 ^ l12_b1) & l12_cout0);
end


always@(posedge Clk)
begin
    l34_a3<=l23_a3;

    l34_b3<=l23_b3;

    l34_sum0<=l23_sum0;
    l34_sum1<=l23_sum1;

    l34_sum2<=l23_a2 ^ l23_b2 ^ l23_cout1;
    l34_cout2<=(l23_a2 & l23_b2) | ((l23_a2 ^ l23_b2) & l23_cout1);
end

always@(posedge Clk)
begin
    l45_sum0<=l34_sum0;
    l45_sum1<=l34_sum1;
    l45_sum2<=l34_sum2;

    l45_sum3<=l34_a3 ^ l34_b3 ^ l34_cout2;
    l45_cout3<=(l34_a3 & l34_b3) | ((l34_a3 ^ l34_b3) & l34_cout2);
end


endmodule
