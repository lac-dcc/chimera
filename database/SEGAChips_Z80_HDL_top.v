// This program was cloned from: https://github.com/emu-russia/SEGAChips
// License: Creative Commons Zero v1.0 Universal

// TOP description of the Z80 processor.

module Z80 (CLK, A, D, n_RFSH, n_M1, n_RESET, n_BUSACK, n_BUSREQ, n_WAIT, n_RD, n_WR, n_IORQ, n_MREQ, n_HALT, n_NMI, n_INT);

	input CLK;
	output [15:0] A;
	inout [7:0] D;
	output n_RFSH;
	output n_M1;
	input n_RESET;
	output n_BUSACK;
	input n_BUSREQ;
	input n_WAIT;
	output n_RD;
	output n_WR;
	output n_IORQ;
	output n_MREQ;
	output n_HALT;
	input n_NMI;
	input n_INT;

	pad_inout DataPads [7:0] ();

endmodule // Z80
