// This program was cloned from: https://github.com/Motherboard77/8-point-Number-Theoretic-Transform-NTT-processor-with-on-the-fly-twiddle-generator
// License: GNU General Public License v3.0


module index_GEN(j,t,i,jmod,tprev,index1,index2);

input [4:0] j;
input [4:0] t;
input [4:0] i;
input [4:0] jmod;
input [4:0] tprev;
output [4:0] index1;
output [4:0] index2;

wire [4:0] w1,w6,w7,w9,w10;
wire w2,w3,w4,w5,w8;

SUB_4BIT1 SUB1(t,j,w1);
assign w2 = w1[3];
assign w3 = |w1;
assign w4 = ~w3;
or OR1(w5,w2,w4);
assign w8 = |w7;
assign w6 = j*2;

SUB_4BIT1 SUB2(i,5'b00010,w7);

ADDER_4BIT1 ADD1(jmod,tprev,w9);

mux_2to1_4bit1 MUX1(w6,w9,w8,w10);
mux_2to1_4bit1 MUX2(j,w10,w5,index1);

assign index2 = index1 + t;

endmodule


module mux_2to1_4bit1(a,b,sel,data_out);


input [4:0] a;
input [4:0] b;
input sel;

output [4:0] data_out;

assign data_out = sel ? b:a;

endmodule

module SUB_4BIT1(a,b,sub);

input [4:0] a;
input [4:0] b;

output [4:0] sub;


assign sub = a-b;

endmodule

module ADDER_4BIT1(a,b,sum);

input [4:0] a;
input [4:0] b;

output [4:0] sum;


assign sum = a+b;

endmodule