// This program was cloned from: https://github.com/sep-81/Digital-Logic-Design-Lab-Experiments
// License: MIT License

`timescale 1ns/1ns
module booth(in,start,clk,rst,ready,out,get);
    input [7:0] in;
    input start,rst,clk,get;
    output ready;
    output [15:0] out;
    wire shen,ldAm,ldAl,ldBm,ldBl,ldp,lastbit,pr_rst;
    wire [7:0] A,B;
	wire [31:0]out32;
	assign out = out32[15:0];

    DP DP1(.clk(clk),.pr_rst(pr_rst),.rst(rst),.shen(shen), .ldAm(ldAm), .ldAl(ldAl),
	 .ldBm(ldBm), .ldBl(ldBl), .ldP(ldp), .lastbit(lastbit), .A(in), .B(in),.out(out32));

    controller CU(.clk(clk),.rst(rst),.start(start),.get(get),.ready(ready),.A_ldLsb(ldAl),.A_ldMsb(ldAm),.B_ldLsb(ldBl),.B_ldMsb(ldBm),.pr_rst(pr_rst),
        .last_bit(lastbit),.pr_ld(ldp),.shift_en(shen));
	wire [0:6] d1,d2,d3,d4; 
	
	//assign out28 = {d1,d2,d3,d4};
endmodule
