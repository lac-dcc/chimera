// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 230819

`timescale 1ns/1ns  // time-unit, precision

`default_nettype none
module UartRx_tb();

	parameter CLOCK_HZ	          = 1_000_000;
	parameter real HALF_PERIOD_NS = 1_000_000_000.0 / (2 * CLOCK_HZ);
	
	// Clock generator
	reg Clock = 1'b1;
	always begin
		#HALF_PERIOD_NS;
		Clock = !Clock;
	end
	
	// Variables
	reg  Reset = 1'b0;
	
	reg  [7:0] TxData;
	reg        TxRequest = 1'b0;
	wire       TxDone;
	
	wire [7:0] RxData;
	wire       RxDone;
	
	wire       TxRxCommon;
	
	// UART Transmitter
	UartTx #(
		.CLOCK_HZ(CLOCK_HZ),
		.BAUD(100_000)
	) UartTx_Inst(
		.Clock(Clock),
		.Reset(Reset),
		.Start_i(TxRequest),
		.Data_i(TxData),
		.Busy_o(),
		.Done_o(TxDone),
		.Tx_o(TxRxCommon)
	);
	
	// UART Receiver
	UartRx #(
		.CLOCK_HZ(CLOCK_HZ),
		.BAUD(100_000)
	) UartRx_Inst(
		.Clock(Clock),
		.Reset(Reset),
		.Rx_i(TxRxCommon),
		.Done_o(RxDone),
		.Data_o(RxData)
	);
	
	// Variable dump
	initial begin
		$dumpfile("uart_rx.vcd");
		$dumpvars(0, UartRx_tb);
	end

	// Test sequence
	initial begin
		$timeformat(-6, 3, "us", 12);
		$display("===== START =====");
		$display("Ticks per half bit = %0d", UartRx_Inst.TICKS_PER_HALF_BIT);
		
		@(posedge Clock);
		Reset     <= 1'b1;
		
		// Sending 1st byte
		repeat(99) @(posedge Clock);
		TxData    <= 8'hAB;
		TxRequest <= 1'b1;
		@(posedge Clock);
		TxData    <= 8'bxxxxxxxx;
		TxRequest <= 1'b0;
		
		// Sending 2nd byte
		@(posedge TxDone);
		TxData    <= 8'hCD;
		TxRequest <= 1'b1;
		@(posedge Clock);
		TxData    <= 8'bxxxxxxxx;
		TxRequest <= 1'b0;
		
		// Wait for end of the transmission
		@(posedge TxDone);
		repeat(100) @(posedge Clock);
		
		$display("====== END ======");
		$finish;
	end
	
	// Display the byte being sent when transmission begins
	always begin
		@(posedge TxRequest)
		$display("%t Transmitting byte: %H %s", 
			$realtime, 
			UartTx_Inst.Data_i,
			UartTx_Inst.Data_i
		);
	end
	
	// Display received byte after transmission is complete
	always begin
		@(posedge RxDone)
		$display("%t Received byte:     %H %s", 
			$realtime, 
			UartRx_Inst.Data_o,
			UartRx_Inst.Data_o
		);
	end

endmodule
`default_nettype wire
