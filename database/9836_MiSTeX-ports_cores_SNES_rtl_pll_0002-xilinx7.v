// This program was cloned from: https://github.com/MiSTeX-devel/MiSTeX-ports
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/10ps
module  pll_0002 (
	input  wire refclk,
	input  wire rst,
	output wire outclk_0,
	output wire outclk_1,
	output wire outclk_2,
	output wire locked,
	input  wire [63:0] reconfig_to_pll,
	output wire [63:0] reconfig_from_pll
);

	wire [15:0] din;
	wire [6:0]  daddr;
	wire [15:0] dout;
	wire        den;
	wire        dwe;
	wire        rst_mmcm;
	wire        drdy;
	wire        dclk;

	// inputs from PLL
	assign reconfig_from_pll[15:0] = dout;
	assign reconfig_from_pll[16]   = drdy;
	assign reconfig_from_pll[17]   = locked;

	// outputs to PLL
	assign din      = reconfig_to_pll[15:0];
	assign daddr    = reconfig_to_pll[22:16];
	assign den      = reconfig_to_pll[23];
	assign dwe      = reconfig_to_pll[24];
	assign rst_mmcm = reconfig_to_pll[25];
	assign dclk     = reconfig_to_pll[26];

    wire feedback;
	wire clkout0;
	wire clkout1;
	wire clkout2;
	
	MMCME2_ADV #(
		.BANDWIDTH("OPTIMIZED"),
		.CLKFBOUT_MULT_F(60.125),
		.CLKIN1_PERIOD(20.0),
		.CLKOUT0_DIVIDE_F(7.0), // 50*60.125/35 ~= 85.909080
		.CLKOUT0_PHASE(1'd0),
		.CLKOUT1_DIVIDE(8'd14),     // 50*60.125/70 ~= 42.954540
		.CLKOUT1_PHASE(-67.494),
		.CLKOUT2_DIVIDE(8'd28),     // 50*60.125/140 ~= 21.477270
		.CLKOUT2_PHASE(1'd0),
		.DIVCLK_DIVIDE(8'd5),
		.REF_JITTER1(0.01),
		.STARTUP_WAIT("FALSE")
	) pll_0002_inst (
		.CLKFBIN   (feedback),
		.CLKIN1    (refclk),
		.PWRDWN    (1'b0),
		.RST       (rst),
		.CLKFBOUT  (feedback),
		.CLKOUT0   (clkout0),
		.CLKOUT1   (clkout1),
		.CLKOUT2   (clkout2),
		.DO        (dout),
		.DRDY      (drdy),
		.DADDR     (daddr),
		.DCLK      (dclk),
		.DEN       (den),
		.DI        (din),
		.DWE       (dwe),
		.LOCKED    (locked)
	);

	BUFG clk_bufg0 (.I(clkout0), .O(outclk_0));
	BUFG clk_bufg1 (.I(clkout1), .O(outclk_1));
	BUFG clk_bufg2 (.I(clkout2), .O(outclk_2));

endmodule

