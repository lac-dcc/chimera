// This program was cloned from: https://github.com/furrtek/Arcade-TMNT_MiSTer
// License: GNU General Public License v2.0

// Z80 CPU plug into TV80 core

module cpu_z80(
	input clk,
	input nRESET,
	input [7:0] Z80_DIN,
	output [7:0] Z80_DOUT,
	output [15:0] Z80_ADDR,
	output reg nIORQ,
	output nMREQ,
	output reg nRD, nWR,
	input nINT, nNMI, nWAIT
);

	wire RFSH_n, MREQ_n;
	assign nMREQ = MREQ_n | ~RFSH_n;

	T80s cpu(
		.RESET_n(nRESET),
		.CLK(clk),
		.CEN(1),
		.WAIT_n(nWAIT),
		.INT_n(nINT),
		.NMI_n(nNMI),
		.MREQ_n(MREQ_n),
		.IORQ_n(nIORQ),
		.RD_n(nRD),
		.WR_n(nWR),
		.RFSH_n(RFSH_n),
		.A(Z80_ADDR),
		.DI(Z80_DIN),
		.DO(Z80_DOUT)
	);

endmodule
