// This program was cloned from: https://github.com/ckugel/Reaction-Time-Game
// License: MIT License

`include "RegisterFile/RegisterRow.v"
`include "RegisterFile/Mux8.v"
`include "RegisterFile/Decoder3to8.v"

module regfile(DATAP, DATAQ, RP, RQ, WA, LD_DATA, WR, CLK, CLRN);
	output [12:0] DATAP;
	output [12:0] DATAQ;
	input [2:0] RP;
	input [2:0] RQ;
	input [2:0] WA;
	input [12:0] LD_DATA;
	input WR;
	input CLK;
	input CLRN;

	wire [7:0] decoded;
	wire [12:0] VALUE0;
	wire [12:0] VALUE1;
	wire [12:0] VALUE2;
	wire [12:0] VALUE3;
	wire [12:0] VALUE4;
	wire [12:0] VALUE5;
	wire [12:0] VALUE6;
	wire [12:0] VALUE7;

	wire [12:0] DATAP;
	wire [12:0] DATAQ;
	
	// Decoder handles writes
	Decoder3to8 decoder (.X(WA), .Enable(WR), .OUT(decoded));
	
	RegisterRow reg0 (.In(LD_DATA), .Load(decoded[0]), .Clock(CLK), .CLRN(CLRN), .Q(VALUE0));
	RegisterRow reg1 (.In(LD_DATA), .Load(decoded[1]), .Clock(CLK), .CLRN(CLRN), .Q(VALUE1));
	RegisterRow reg2 (.In(LD_DATA), .Load(decoded[2]), .Clock(CLK), .CLRN(CLRN), .Q(VALUE2));
	RegisterRow reg3 (.In(LD_DATA), .Load(decoded[3]), .Clock(CLK), .CLRN(CLRN), .Q(VALUE3));
	RegisterRow reg4 (.In(LD_DATA), .Load(decoded[4]), .Clock(CLK), .CLRN(CLRN), .Q(VALUE4));
	RegisterRow reg5 (.In(LD_DATA), .Load(decoded[5]), .Clock(CLK), .CLRN(CLRN), .Q(VALUE5));
	RegisterRow reg6 (.In(LD_DATA), .Load(decoded[6]), .Clock(CLK), .CLRN(CLRN), .Q(VALUE6));
	RegisterRow reg7 (.In(LD_DATA), .Load(decoded[7]), .Clock(CLK), .CLRN(CLRN), .Q(VALUE7));
	
	// muxes handle reads
	Mux8 outputMuxP (.S2(RP[2]), .S1(RP[1]), .S0(RP[0]), .W7(VALUE7), .W6(VALUE6), .W5(VALUE5), .W4(VALUE4), .W3(VALUE3), .W2(VALUE2), .W1(VALUE1), .W0(VALUE0), .F(DATAP));

	Mux8 outputMuxQ (.S2(RQ[2]), .S1(RQ[1]), .S0(RQ[0]), .W7(VALUE7), .W6(VALUE6), .W5(VALUE5), .W4(VALUE4), .W3(VALUE3), .W2(VALUE2), .W1(VALUE1), .W0(VALUE0), .F(DATAQ));


endmodule
