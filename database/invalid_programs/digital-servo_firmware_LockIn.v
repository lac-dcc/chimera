///////////////////////////////////////////////////////////////////////////////
// LockIn.v
//
// 3/2/12
// David Leibrandt
//
//	Lock-in module.
//
///////////////////////////////////////////////////////////////////////////////

`include "timescale.v"

module LockIn(
   input  wire												clk_in,
	input  wire												rst_in,
	input  wire				[23:0]						pinc_in,
	input  wire signed	[23:0]						poff_in,
	
	input  wire signed	[15:0]						signal_in,
	output reg  signed	[31:0]						signal_out,
	output wire signed	[23:0]						LO_out
);

// DDSs
wire		   [23:0] dds_phase1;
reg			[23:0] dds_phase2;
wire signed [15:0] dds_out2;

dds_PG_pw24 PG_inst(
	.clk(clk_in),
	.pinc_in(pinc_in),
	.phase_out(dds_phase1)
);

always @(posedge clk_in) begin
	dds_phase2 <= dds_phase1 + poff_in;
end

dds_LUT_pw24_ow24 LUT_inst1(
	.clk(clk_in),
	.phase_in(dds_phase1),
	.sine(LO_out)
);

dds_LUT_pw24_ow16 LUT_inst2(
	.clk(clk_in),
	.phase_in(dds_phase2),
	.sine(dds_out2)
);

// Mixer
always @(posedge clk_in) begin
	signal_out <= signal_in*dds_out2;
end

// Low pass filters - are located in the parent module

endmodule
