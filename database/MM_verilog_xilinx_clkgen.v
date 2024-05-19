// This program was cloned from: https://github.com/Canaan-Creative/MM
// License: The Unlicense

module clkgen(input wire clkin, input wire clk25m_on, output wire clkout, output wire [3:0] clk25m, output wire locked);
//reg cnt ;

wire clkout_div ;
//always @ ( posedge clkout )
//	cnt <= ~cnt ;
//assign clk25m = cnt ;
//assign clk25m = clkout_div ;
ODDR2 ODDR2_inst0 (
   .Q (clk25m[0]),   // 1-bit DDR output data
   .C0(clkout_div),   // 1-bit clock input
   .C1(~clkout_div),   // 1-bit clock input
   .CE(clk25m_on),//(1), // 1-bit clock enable input
   .D0(0), // 1-bit data input (associated with C0)
   .D1(1), // 1-bit data input (associated with C1)
   .R (0),   // 1-bit reset input
   .S (0)    // 1-bit set input
);
ODDR2 ODDR2_inst1 (
   .Q (clk25m[1]),   // 1-bit DDR output data
   .C0(clkout_div),   // 1-bit clock input
   .C1(~clkout_div),   // 1-bit clock input
   .CE(clk25m_on),//(1), // 1-bit clock enable input
   .D0(0), // 1-bit data input (associated with C0)
   .D1(1), // 1-bit data input (associated with C1)
   .R (0),   // 1-bit reset input
   .S (0)    // 1-bit set input
);
ODDR2 ODDR2_inst2 (
   .Q (clk25m[2]),   // 1-bit DDR output data
   .C0(clkout_div),   // 1-bit clock input
   .C1(~clkout_div),   // 1-bit clock input
   .CE(clk25m_on),//(1), // 1-bit clock enable input
   .D0(0), // 1-bit data input (associated with C0)
   .D1(1), // 1-bit data input (associated with C1)
   .R (0),   // 1-bit reset input
   .S (0)    // 1-bit set input
);
ODDR2 ODDR2_inst3 (
   .Q (clk25m[3]),   // 1-bit DDR output data
   .C0(clkout_div),   // 1-bit clock input
   .C1(~clkout_div),   // 1-bit clock input
   .CE(clk25m_on),//(1), // 1-bit clock enable input
   .D0(0), // 1-bit data input (associated with C0)
   .D1(1), // 1-bit data input (associated with C1)
   .R (0),   // 1-bit reset input
   .S (0)    // 1-bit set input
);

DCM_CLKGEN #( // {{{
	.CLKFXDV_DIVIDE(4), // CLKFXDV divide value (2, 4, 8, 16, 32)
	.CLKFX_DIVIDE(1), // Divide value - D - (1-256)
	.CLKFX_MD_MAX(0.0), // Specify maximum M/D ratio for timing anlysis
	.CLKFX_MULTIPLY(4), // Multiply value - M - (2-256)
	.CLKIN_PERIOD(40.0), // Input clock period specified in nS
	.SPREAD_SPECTRUM("NONE"), // Spread Spectrum mode "NONE", "CENTER_LOW_SPREAD", "CENTER_HIGH_SPREAD",
	// "VIDEO_LINK_M0", "VIDEO_LINK_M1" or "VIDEO_LINK_M2"
	.STARTUP_WAIT("FALSE") // Delay config DONE until DCM_CLKGEN LOCKED (TRUE/FALSE)
) DCM (
	.CLKFX(clkout), // 1-bit output: Generated clock output
	.CLKFX180(), // 1-bit output: Generated clock output 180 degree out of phase from CLKFX.
	.CLKFXDV(clkout_div), // 1-bit output: Divided clock output
	.LOCKED(locked), // 1-bit output: Locked output
	.PROGDONE(), // 1-bit output: Active high output to indicate the successful re-programming
	.STATUS(), // 2-bit output: DCM_CLKGEN status
	.CLKIN(clkin), // 1-bit input: Input clock
	.FREEZEDCM(1'b0), // 1-bit input: Prevents frequency adjustments to input clock
	.PROGCLK(1'b0), // 1-bit input: Clock input for M/D reconfiguration
	.PROGDATA(1'b0), // 1-bit input: Serial data input for M/D reconfiguration
	.PROGEN(1'b0), // 1-bit input: Active high program enable
	.RST(1'b0) // 1-bit input: Reset input pin
); // }}}

endmodule
