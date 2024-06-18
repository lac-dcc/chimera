// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 240411

`timescale 1ns/1ns

`default_nettype none
module top_tb();
	
	// Configuration
	parameter CLOCK_HZ = 25_000_000;
	parameter DELAY    = 7894;			// Delay between edges of SCK
	
	// Clock generator
	reg Clock = 1'b1;
	always begin
		#(1_000_000_000.0 / (2 * CLOCK_HZ));
		Clock = !Clock;
	end
	
	// Variables
	reg Reset = 0;
	reg CS    = 1;
	reg SCK   = 0;
	reg MOSI  = 0;
	wire MISO;
	
	// Variable dump
	initial begin
		$dumpfile("top.vcd");
		$dumpvars(0, top_tb);
	end
	
	// Instantiate device under test	
	top DUT(
		.Clock(Clock),
		.Reset(Reset),
		.CS(CS),
		.SCK(SCK),
		.MOSI(MOSI),
		.MISO(MISO),
		.Cathodes_o(),
		.Segments_o()
	);
	
	// Display message after a byte is received
	always @(posedge DUT.SlaveSPI_inst.TransactionDone_o) begin
		$display("%t Received:     %H %b", 
			$realtime, 
			DUT.SlaveSPI_inst.DataReceived_o, 
			DUT.SlaveSPI_inst.DataReceived_o
		);
	end
	
	// Task to send a byte from master to slave
	task TransmitSPI(input [7:0] Data);
		integer i;
		begin
			$display("%t Transmitting: %H %b", $realtime, Data, Data);
			for(i=7; i>=0; i=i-1) begin
				SCK = 0;
				MOSI = Data[i];
				#DELAY;	
				SCK = 1;
				#DELAY;
			end
		end
	endtask
	
	// Test sequence
	initial begin
		$timeformat(-6, 3, "us", 10);
		$display("===== START =====");
		
		@(posedge Clock);
		Reset = 1'b1;
		repeat(5) #DELAY;
		
		// Transmit four bytes
		CS = 0;
		TransmitSPI(8'b00000001);
		TransmitSPI(8'b00000011);
		TransmitSPI(8'b00000111);
		TransmitSPI(8'b00001111);
		CS = 1;
		
		repeat(5) #DELAY;
		
		$display("====== END ======");
		$finish;
	end
	
endmodule
