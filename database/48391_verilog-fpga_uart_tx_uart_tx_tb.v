// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 230814

`timescale 1ns/1ns  // time-unit, precision

`default_nettype none
module UartTx_tb();

	parameter CLOCK_HZ	          = 1_000_000;
	parameter real HALF_PERIOD_NS = 1_000_000_000.0 / (2 * CLOCK_HZ);
	
	// Clock generator
	reg Clock = 1'b1;
	always begin
		#HALF_PERIOD_NS;
		Clock = !Clock;
	end
	
	// Message to send
	reg [7:0] Memory [0:7];
	initial begin
		Memory[0] = "H";
		Memory[1] = "e";
		Memory[2] = "l";
		Memory[3] = "l";
		Memory[4] = "o";
		Memory[5] = 8'd0;
		Memory[6] = 8'd0;
		Memory[7] = 8'd0;
	end
	
	// Variables
	wire ByteTransmitBusy;
	wire ByteTransmitDone;
	reg Reset         = 1'b0;
	reg ManualRequest = 1'b0;
	
	// Pointer that selects a byte in memory to be transmitted next
	reg [2:0] Pointer;	
	always @(posedge Clock, negedge Reset) begin
		if(!Reset) begin
			Pointer <= 0;
		end else if(ManualRequest || ByteTransmitDone) begin
			Pointer <= Pointer + 1'b1;
		end else if(!ByteTransmitBusy) begin
			Pointer <= 0;
		end
	end
	
	wire ByteTransmitRequest = ManualRequest || (ByteTransmitDone && (Memory[Pointer] != 8'd0));
	
	// Instantiate device under test
	UartTx #(
		.CLOCK_HZ(CLOCK_HZ),
		.BAUD(100_000)
	) DUT(
		.Clock(Clock),
		.Reset(Reset),
		.Start_i(ByteTransmitRequest),
		.Data_i(Memory[Pointer]),
		.Busy_o(ByteTransmitBusy),
		.Done_o(ByteTransmitDone),
		.Tx_o()
	);
	
	// Variable dump
	initial begin
		$dumpfile("uart_tx.vcd");
		$dumpvars(0, UartTx_tb);
	end

	// Test sequence
	integer i;
	initial begin
		$timeformat(-6, 3, "us", 12);
		$display("===== START =====");
		$display("Clock:         %9d", CLOCK_HZ);
		$display("Baud rate:     %9d", DUT.BAUD);
		$display("Ticks per bit: %9d", DUT.StrobeGeneratorTicks_inst.TICKS);
		
		
		@(posedge Clock);
		Reset <= 1'b1;
		
		repeat(99) @(posedge Clock);
		ManualRequest <= 1'b1;
		@(posedge Clock);
		ManualRequest <= 1'b0;
		
		wait(Memory[Pointer] == 8'd0);
		@(posedge ByteTransmitDone);
		repeat(100) @(posedge Clock);
		
		$display("====== END ======");
		$finish;
	end
	
	// Display transmitted bytes
	always begin
		@(posedge ByteTransmitRequest)
		$display("%t Transmitting byte %d: %s", $realtime, Pointer, Memory[Pointer]);
	end

endmodule
`default_nettype wire