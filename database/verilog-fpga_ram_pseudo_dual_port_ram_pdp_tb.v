// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

`timescale 1ns/1ns

`default_nettype none
module PseudoDualPortRAM_tb();

	parameter CLOCK_READ_HZ	            = 10_000_000;
	parameter real HALF_PERIOD_READ_NS  = 1_000_000_000.0 / (2 * CLOCK_READ_HZ);
	
	parameter CLOCK_WRITE_HZ	        = 15_000_000;
	parameter real HALF_PERIOD_WRITE_NS = 1_000_000_000.0 / (2 * CLOCK_WRITE_HZ);
	
	// Clock generator for read port
	reg ReadClock = 1'b1;
	always begin
		#HALF_PERIOD_READ_NS;
		ReadClock = !ReadClock;
	end
	
	// Clock generator for write port
	reg WriteClock = 1'b1;
	always begin
		#HALF_PERIOD_WRITE_NS;
		WriteClock = !WriteClock;
	end
	
	// Variables
	reg        Reset       = 1'b0;
	reg        ReadEnable  = 1'b0;
	reg        WriteEnable = 1'b0;
	reg  [3:0] ReadAddress;
	reg  [3:0] WriteAddress;
	reg  [7:0] DataIn;
	wire [7:0] DataOut;
	integer    r;
	integer    w;
	
	// Instantiate device under test
	PseudoDualPortRAM #(
		.ADDRESS_WIDTH(4),
		.DATA_WIDTH(8)
	) DUT(
		.ReadClock(ReadClock),
		.WriteClock(WriteClock),
		.Reset(Reset),
		.ReadEnable_i(ReadEnable),
		.WriteEnable_i(WriteEnable),
		.ReadAddress_i(ReadAddress),
		.WriteAddress_i(WriteAddress),
		.Data_i(DataIn),
		.Data_o(DataOut)
	);
	
	// Variable dump
	initial begin
		$dumpfile("ram_pdp.vcd");
		$dumpvars(0, PseudoDualPortRAM_tb);
		
		// Dump all data from the memory
		for(r=0; r<=15; r=r+1) begin
			$dumpvars(2, DUT.Memory[r]);
		end
	end

	// Test sequence for write
	initial begin
		$timeformat(-6, 3, "us", 12);
		$display("===== START =====");
		$display("        Time WriteAddress DataIn ReadAddress DataOut");
		$monitor("%t            %H     %H           %H      %H", 
			$realtime, 
			WriteAddress, 
			DataIn,
			ReadAddress,
			DataOut
		);
		
		@(posedge WriteClock);
		Reset <= 1'b1;
		@(posedge WriteClock);
		
		// Write some data
		for(w=0; w<=15; w=w+1) begin
			WriteData(w, $urandom_range(8'h00, 8'hFF));
		end
		WriteEnd();
	end
	
	// Test sequence for read
	initial begin
		repeat(5) @(posedge ReadClock);
		
		// Read the data
		ReadEnable <= 1'b1;
		for(r=0; r<=15; r=r+1) begin
			ReadAddress <= r;
			@(posedge ReadClock);
		end
		
		ReadAddress <= 4'dX;
		ReadEnable  <= 1'b0;
		
		// Pause
		repeat(2) @(posedge ReadClock);
		
		$display("===== END =====");
		$finish;
	end
	
	task WriteData(input [3:0] Adr, input [7:0] Dat); 
		begin
			WriteAddress <= Adr;
			DataIn       <= Dat;
			WriteEnable  <= 1'b1;
			@(posedge WriteClock);
		end
	endtask
	
	task WriteEnd(); 
		begin
			WriteAddress <= 4'dX;
			DataIn       <= 8'dX;
			WriteEnable  <= 1'b0;
			@(posedge WriteClock);
		end
	endtask

endmodule
`default_nettype wire
