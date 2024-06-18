// This program was cloned from: https://github.com/hacksterous/Zed80
// License: GNU General Public License v3.0

module tbzed80 ();
	reg clk, resetn;
	reg uartTx;
	wire uartRx;

	initial resetn = 1'b1;
	initial #75 resetn = 1'b0;
	initial #275 resetn = 1'b1;
	initial clk = 1'b0;

	always @(clk) begin
		#5 clk <= ~clk;
	end

	initial begin
		#8000000 $finish;
	end

	initial begin
		$dumpfile ("zed80.vcd");
		$dumpvars;
	end

	zed80 soc (
		.areset (~resetn), //active high reset input
		.HEARTBEAT (),
		.clk29 (clk),
		.nRTS (),
		.UART_TX (uartRx),
		.UART_RX (uartTx));


endmodule
