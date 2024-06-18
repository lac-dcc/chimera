// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 231109

`timescale 1ns/1ns
`default_nettype none

module TerminalVIM828_tb();
	
	parameter CLOCK_HZ       = 1_000_000;
	parameter HALF_PERIOD_NS = 1_000_000_000 / (2 * CLOCK_HZ);
	
	// Clock generator
	reg Clock = 1'b1;
	always begin
		#HALF_PERIOD_NS;
		Clock = !Clock;
	end
	
	// Variables
	reg Reset  = 1'b0;
	reg TxRequest = 1'b0;
	reg [7:0] TxData = 8'd0;
	wire TxDone;
	wire TxRxCommon;
	
	// Instantiate UART transmitter
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
	
	// Instantiate device under test
	TerminalVIM828 #(
		.CLOCK_HZ(CLOCK_HZ),
		.BAUD(100_000)
	) DUT(
		.Clock(Clock),
		.Reset(Reset),
		.Rx_i(TxRxCommon),
		.Pin_o()
	);
	
	// Task to send a byte via UART transmitter
	task UartSend(input [7:0] Data);
		begin
			TxData    <= Data;
			TxRequest <= 1'b1;
			@(posedge Clock);
			TxData    <= 8'bxxxxxxxx;
			TxRequest <= 1'b0;
			@(posedge TxDone);
		end
	endtask
	
	
	// Variable dump
	initial begin
		$dumpfile("terminal_vim828.vcd");
		$dumpvars(0, TerminalVIM828_tb);
	end

	// Test sequence
	initial begin
		$timeformat(-6, 3, "us", 10);
		$display("===== START =====");
		$display("CLOCK_HZ = %9d", CLOCK_HZ);

		@(posedge Clock);
		Reset = 1'b1;
		
		repeat(99) @(posedge Clock);
		
		// Send data to be displayed via UART
		UartSend("A");
		UartSend("B");
		UartSend("C");
		UartSend("D");
		UartSend("E");
		UartSend("F");
		UartSend("G");
		UartSend("H");
		
		// Wait through all eight states of VIM828 controller
		repeat(8) begin
			@(posedge DUT.VIM828_inst.ChangeState);
		end
		
		$display("====== END ======");
		$finish;
	end

endmodule
`default_nettype wire
