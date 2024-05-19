// This program was cloned from: https://github.com/maxs-well/ad7606-driver-verilog
// License: GNU General Public License v2.0



module ad_top(
	input						clk		,
	input						rst_n		,
	
	input	[15:0]			data_in	,
	input						busy		,
	input						fdata		,

	output					cs			,
	output					rd			,
	output					cvtA		,
	output					cvtB		,
	output					range		,
	output					phy_rst	,
	output			[ 2:0]os			,
	output					vio		
);
wire 				clk_50m	;
wire 				en			;
wire	[15:0]	ch1		;
wire	[15:0]	ch2		;
wire	[15:0]	ch3		;
wire	[15:0]	ch4		;
wire	[15:0]	ch5		;
wire	[15:0]	ch6		;
wire	[15:0]	ch7		;
wire	[15:0]	ch8		;

pll pll_inst(
	.inclk0(clk),
	.c0	(clk_50m)
);

generate_en en_inst
(
	.clk		(clk_50m),
	.rst_n	(rst_n),
	
	.en_o		(en)
);

AD7606_ctrl 
AD_inst
(
	//system signals
	.clk		(clk_50m),
	.rst_n	(rst_n)	,
	//time control
	.en		(en)		,
	//contrl start
	.start	(1'b1)	,
	//phy interface and signals
	.busy		(busy)	,
	.fdata	(fdata)	,
	.cvtData	(data_in),
//	.ch_A_B_n(1'b1)	,
	
	.cs		(cs)		,
	.rd		(rd)		,
	.cvtA		(cvtA)	,
	.cvtB		(cvtB)	,
	// output	reg					refSlt	,
	.range	(range)	,
	.phy_rst	(phy_rst),
	.os		(os)	,
	
	.ch1		(ch1)	,
	.ch2		(ch2)	,
	.ch3		(ch3)	,
	.ch4		(ch4)	,
	.ch5		(ch5)	,
	.ch6		(ch6)	,
	.ch7		(ch7)	,
	.ch8		(ch8)	,
	.update	()	,
	.phy_busy()	,
	
	.vio		(vio)
);

endmodule
