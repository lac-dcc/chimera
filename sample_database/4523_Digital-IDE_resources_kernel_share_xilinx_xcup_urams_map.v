// This program was cloned from: https://github.com/Nitcloud/Digital-IDE
// License: GNU General Public License v3.0

module \$__XILINX_URAM288 (CLK2, A1ADDR, A1DATA, A1EN, B1ADDR, B1DATA, B1EN);
	parameter CLKPOL2 = 1;

	input CLK2;

	input [11:0] A1ADDR;
	output [71:0] A1DATA;
	input A1EN;

	input [11:0] B1ADDR;
	input [71:0] B1DATA;
	input [8:0] B1EN;


	URAM288 #(
		.BWE_MODE_A("PARITY_INDEPENDENT"),
		.BWE_MODE_B("PARITY_INDEPENDENT"),
		.EN_AUTO_SLEEP_MODE("FALSE"),
		.IREG_PRE_A("FALSE"),
		.IREG_PRE_B("FALSE"),
		.IS_CLK_INVERTED(!CLKPOL2),
		.OREG_A("FALSE"),
		.OREG_B("FALSE")
	) _TECHMAP_REPLACE_ (
		.ADDR_A({11'b0, A1ADDR}),
		.BWE_A(9'b0),
		.DIN_A(72'b0),
		.EN_A(A1EN),
		.RDB_WR_A(1'b0),
		.INJECT_DBITERR_A(1'b0),
		.INJECT_SBITERR_A(1'b0),
		.RST_A(1'b0),
		.DOUT_A(A1DATA),

		.ADDR_B({11'b0, B1ADDR}),
		.BWE_B(B1EN),
		.DIN_B(B1DATA),
		.EN_B(|B1EN),
		.RDB_WR_B(1'b1),
		.INJECT_DBITERR_B(1'b0),
		.INJECT_SBITERR_B(1'b0),
		.RST_B(1'b0),

		.CLK(CLK2),
		.SLEEP(1'b0)
	);
endmodule
