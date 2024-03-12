`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////
// Company: 		Gpixel
// Engineer: 		Hongliang.An
// Create Date:	07/09/2014 
// Module Name: 	clock_generator_pll_s8
// Project Name: 	
// Target Devices:Spartan-6 xc6slx150-3fgg676
// Tool versions: ISE13.1
// Function:		generate a global clock and io clock, the factor is 8.
//						ioclock output by bufpll and gclk output by bufg.
// Interface:
// Dependencies:
// Revision: 1.0
//////////////////////////////////////////////////////////////////////////
module clock_generator_pll_b1(
	clk_in, rst_n,
	gclk, gclk2,rxioclk, reset, rxserdesstrobe
	);
	
	input				clk_in;
	input				rst_n;
	
	output			gclk;
	output         gclk2;
	output			rxioclk;
	output			reset;
	output			rxserdesstrobe;
	
	// SIGNALS
	wire 				clkfbout;
	//wire 				gclk_unbuf;
	wire 				gclk2_unbuf;
	wire 				ioclk_unbuf;
	wire 				pll_locked;
	reg [4:0]		rst_pll_pipe;
	
	assign	reset = rst_pll_pipe[0];
	always @(posedge gclk) begin
		if (!rst_n || pll_locked == 1'b0) begin
			rst_pll_pipe		<= 5'b11111;
		end
		else begin
			rst_pll_pipe		<= {1'b0, rst_pll_pipe[4:1]};
		end
	end
	
	assign gclk = clk_in;
	
	PLL_BASE #(
		.CLKFBOUT_MULT			(12),
		.CLKOUT0_DIVIDE		(1),
		.CLKOUT1_DIVIDE		(6),
		.DIVCLK_DIVIDE			(1),
		.CLKIN_PERIOD			(20),
		.CLK_FEEDBACK			("CLKFBOUT")
	)
	PLL_BASE_INST (
		.CLKFBOUT				(clkfbout),
		.CLKOUT0					(ioclk_unbuf),
		.CLKOUT1					(gclk2_unbuf),
		.CLKOUT2					(),
		.CLKOUT3					(),
		.CLKOUT4					(),
		.CLKOUT5					(),
		.LOCKED					(pll_locked),
		.CLKFBIN					(clkfbout),
		.CLKIN					(clk_in),
		.RST						(~rst_n)
	);
	
	BUFG BUFG_INST (
		.O							(gclk2),
		.I							(gclk2_unbuf)
	);
						
	BUFPLL # (
		.DIVIDE					(6),
		.ENABLE_SYNC			("TRUE")
	)
	BUFPLL_INST (
		.IOCLK					(rxioclk),
		.LOCK						(),
		.SERDESSTROBE			(rxserdesstrobe),
		.GCLK						(gclk2),
		.LOCKED					(pll_locked),
		.PLLIN					(ioclk_unbuf)
	);	


endmodule
