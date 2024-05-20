// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 240405

`timescale 1ns/1ns

`default_nettype none
module SlaveSPI_tb();
	
	// Configuration
	parameter CLOCK_HZ     = 1_000_000;
	parameter DELAY        = 7894;			// Delay between edges of SCK
	
	// Clock generator
	reg Clock = 1'b1;
	always begin
		#(1_000_000_000.0 / (2 * CLOCK_HZ));
		Clock = !Clock;
	end
	
	// Variables
	reg Reset	= 0;
	reg CS		= 1;
	reg SCK		= 0;
	reg MOSI	= 0;
	reg [7:0] ResponseData = 0;
	
	// Variable dump
	initial begin
		$dumpfile("slave_spi.vcd");
		$dumpvars(0, SlaveSPI_tb);
	end
	
	// Instantiate device under test
	SlaveSPI DUT(
		.Clock(Clock),
		.Reset(Reset),
		.CS_i(CS),						// Chip select, active low
		.SCK_i(SCK),					// Serial clock
		.MOSI_i(MOSI),					// Master Out, Slave In
		.MISO_o(),						// Master In, Slave Out
		.DataToSend_i(ResponseData),	// Byte to be sent via MISO
		.DataReceived_o(),				// Byte received from MOSI
		.TransactionDone_o(),
		.TransmissionStart_o(),
		.TransmissionEnd_o()
	);
	
	// Display message after a byte is received
	always @(posedge DUT.TransactionDone_o) begin
		$display("%t Received:     %H %b", $realtime, DUT.DataReceived_o, DUT.DataReceived_o);
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
		$display("SCK freq is %f Hz", 1_000_000_000.0 / (2 * DELAY));
		
		@(posedge Clock);
		Reset <= 1'b1;
		
		repeat(5) #DELAY;
		
		// Transmit one byte to the slave
		CS = 0;
		ResponseData = 8'h01;
		TransmitSPI(8'h80);
		CS = 1;
		#DELAY;
		
		// Transmit one byto to another slave
		ResponseData = 8'h02;
		TransmitSPI(8'h40);
		#DELAY;
		
		// Transmit two bytes to the slave
		CS = 0;
		ResponseData = 8'h04;
		TransmitSPI(8'h20);
		#DELAY;
		TransmitSPI(8'h10);
		CS = 1;
		
		repeat(5) #DELAY;
		
		$display("====== END ======");
		$finish;
	end

endmodule
