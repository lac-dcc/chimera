// This program was cloned from: https://github.com/hacksterous/Zed80
// License: GNU General Public License v3.0


module tbje6850 ();

	reg clk, resetn;
	reg uartTx;
	wire uartRx;
	wire [7:0] dataOut;
	reg [7:0] dataIn;
	reg rs, rnw, e;
	wire nirq, nrts;
	reg [19:0] pacerCounter;
	reg nCTS;

	initial nCTS = 1'b0;
	initial dataIn = 8'h0;
	initial resetn = 1'b0;
	initial #27 resetn = 1'b1;
	initial clk = 1'b0;
	initial uartTx = 1'b1;
	initial rs = 1'b0;
	initial rnw = 1'b1;
	
	always @(clk) begin
		#5 clk <= ~clk;
	end

	initial begin
		#50000 $finish;
	end

	initial begin
		#200 uartTx = 1'b1;
		#100 uartTx = 1'b0; //data start
		#640 uartTx = 1'b1; //'hB3
		#640 uartTx = 1'b1;
		#640 uartTx = 1'b0;
		#640 uartTx = 1'b0;
		#640 uartTx = 1'b1;
		#640 uartTx = 1'b1;
		#640 uartTx = 1'b0;
		#640 uartTx = 1'b1;
		#640 uartTx = 1'b1; //data stop

		#5000 uartTx = 1'b0; //data start
		#640 uartTx = 1'b1; //'h79
		#640 uartTx = 1'b0;
		#640 uartTx = 1'b0;
		#640 uartTx = 1'b1;
		#640 uartTx = 1'b1;
		#640 uartTx = 1'b1;
		#640 uartTx = 1'b1;
		#640 uartTx = 1'b0;
		#640 uartTx = 1'b1; //data stop
	end

	initial begin
		$dumpfile ("je6850.vcd");
		$dumpvars;
	end

	always @(posedge clk) begin
		if  (~resetn)
			pacerCounter <= #1 20'h0;
		else
			pacerCounter <= #1 pacerCounter + 1'b1;
	end

	wire doingTx = (pacerCounter > 2500);
	always @(posedge clk) begin
		if (~nirq & ~doingTx) begin
			e <= #1 1'b1;
			rs <= #1 1'b1;
		end else begin
			e = #1 1'b0;
			rs = #1 1'b0;
		end
		if (~nirq & doingTx) nCTS <= #1 1'b1;
		if (pacerCounter == 2501) begin
			//done with write into TDR
			dataIn <= #1 8'h0;
			rnw <= #1 1'b1;
			e <= #1 1'b0;
			rs <= #1 1'b0;
		end else if (pacerCounter == 2500) begin
			//write into TDR
			dataIn <= #1 8'h75;
			rnw <= #1 1'b0;
			e <= #1 1'b1;
			rs <= #1 1'b1;
		end
	end

	je6850 #(.DVSIM(1)) acia(
		.CLK (clk),
		.nCTS (nCTS),
		.nDCD (1'b0),
		.nRESET (resetn),
		.E (e),
		.RS (rs),
		.RnW (rnw),
		.RXDATA (uartTx),
		.CS (3'b011),
		.DI (dataIn),
		.nIRQ (nirq),
		.nRTS (nrts),
		.TXDATA (uartRx),
		.DO (dataOut));

endmodule
