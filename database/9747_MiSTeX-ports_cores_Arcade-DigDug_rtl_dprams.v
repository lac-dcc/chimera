// This program was cloned from: https://github.com/MiSTeX-devel/MiSTeX-ports
// License: BSD 3-Clause "New" or "Revised" License

//--------------------------------------------
// Dualport RAM modules for FPGA DigDug
//
//					Copyright (c) 2017 MiSTer-X
//--------------------------------------------

`timescale 1 ps / 1 ps

module DPR2KV
(
	input					CL0,
	input	[10:0]		AD0,
	input					EN0,
	input					WR0,
	input  [7:0]		DI0,
	output [7:0]		DO0,
	
	input					CL1,
	input	[10:0]		AD1,
	output [7:0]		DO1
);

DPR2K ram(
	CL0, AD0,  EN0,  WR0,  DI0, DO0,
	CL1, AD1, 1'b1, 1'b0, 8'h0, DO1
);

endmodule


module DPR2K
(
	input					CL0,
	input	[10:0]		AD0,
	input					EN0,
	input					WR0,
	input  [7:0]		DI0,
	output reg [7:0]	DO0,
	
	input					CL1,
	input	[10:0]		AD1,
	input					EN1,
	input					WR1,
	input  [7:0]		DI1,
	output reg [7:0]	DO1
);

reg [7:0] core[0:2047] /* synthesis ramstyle = "no_rw_check, M10K" */;

always @( posedge CL0 ) begin
	if (EN0) begin
		DO0 <= core[AD0];
		if (WR0) core[AD0] <= DI0;
	end
end

always @( posedge CL1 ) begin
	if (EN1) begin
		DO1 <= core[AD1];
		if (WR1) core[AD1] <= DI1;
	end
end

endmodule


module LBUF1K
(
	input				CL0,
	input	 [9:0]	AD0,
	input				WR0,
	input  [7:0]	DI0,
	
	input				CL1,
	input	 [9:0]	AD1,
	input				WR1,
	input  [7:0]	DI1,
	output [7:0]	DO1
);

dpram #(10,8) lbuf(
	.clock_a(CL0),
	.address_a(AD0),
	.data_a(DI0),
	.wren_a(WR0),
	.q_a(),

	.clock_b(CL1),
	.address_b(AD1),
	.data_b(DI1),
	.wren_b(WR1),
	.q_b(DO1)
);

endmodule


module DLROM #(parameter AW=8,parameter DW=8)
(
	input							CL0,
	input [(AW-1):0]			AD0,
	output reg [(DW-1):0]	DO0,

	input							CL1,
	input [(AW-1):0]			AD1,
	input	[(DW-1):0]			DI1,
	input							WE1
);

reg [DW-1:0] core[0:((2**AW)-1)] /* synthesis ramstyle = "no_rw_check, M10K" */;

always @(posedge CL0) DO0 <= core[AD0];
always @(posedge CL1) if (WE1) core[AD1] <= DI1;

endmodule


module DLROMe #(parameter AW=8,parameter DW=8)
(
	input							RE0,
	input							CL0,
	input [(AW-1):0]			AD0,
	output reg [(DW-1):0]	DO0,

	input							CL1,
	input [(AW-1):0]			AD1,
	input	[(DW-1):0]			DI1,
	input							WE1
);

reg [DW-1:0] core[0:((2**AW)-1)] /* synthesis ramstyle = "no_rw_check, M10K" */;

always @(posedge CL0) if (RE0) DO0 <= core[AD0];
always @(posedge CL1) if (WE1) core[AD1] <= DI1;

endmodule

