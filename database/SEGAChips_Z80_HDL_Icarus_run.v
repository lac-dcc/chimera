// This program was cloned from: https://github.com/emu-russia/SEGAChips
// License: Creative Commons Zero v1.0 Universal


`timescale 1ns/1ns

module Z80_Run();

	reg CLK;
	wire [15:0] abus;	
	wire [7:0] dbus;
	reg nReset;
	reg nBusReq;
	reg nWait;
	reg nNMI;
	reg nINT;

	always #25 CLK = ~CLK;

	Z80 z80 (
		.CLK(CLK),
		.A(abus),
		.D(dbus),
		.n_RESET(nReset),
		.n_BUSREQ(nBusReq),
		.n_WAIT(nWait),
		.n_NMI(nNMI),
		.n_INT(nINT) );

	initial begin

		$display("Check that the Z80 is moving.");

		CLK <= 1'b0;
		nReset <= 1'b1;
		nBusReq <= 1'b1;
		nWait <= 1'b1;
		nNMI <= 1'b1;
		nINT <= 1'b1;

		$dumpfile("z80.vcd");
		$dumpvars(0, z80);

		repeat (1000) @ (posedge CLK);
		$finish;
	end	

endmodule // SM83_Run
