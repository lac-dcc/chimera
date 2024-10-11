// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

`timescale 1ns/1ns

`default_nettype none
module RAM_tb();

	parameter CLOCK_HZ	          = 10_000_000;
	parameter real HALF_PERIOD_NS = 1_000_000_000.0 / (2 * CLOCK_HZ);
	
	// Clock generator
	reg Clock = 1'b1;
	always begin
		#HALF_PERIOD_NS;
		Clock = !Clock;
	end
	
	// Variables
	reg        Reset       = 1'b0;
	reg        ReadEnable  = 1'b0;
	reg        WriteEnable = 1'b0;
	reg  [3:0] Address;
	reg  [7:0] DataIn;
	wire [7:0] DataOut;
	integer    i;
	
	// Instantiate device under test
	RAM #(
		.ADDRESS_WIDTH(4),
		.DATA_WIDTH(8)
	) DUT(
		.Clock(Clock),
		.Reset(Reset),
		.ReadEnable_i(ReadEnable),
		.WriteEnable_i(WriteEnable),
		.Address_i(Address),
		.Data_i(DataIn),
		.Data_o(DataOut)
	);
	
	// Variable dump
	initial begin
		$dumpfile("ram.vcd");
		$dumpvars(0, RAM_tb);
		
		// Dump all data from the memory
		for(i=0; i<DUT.MEMORY_DEPTH; i=i+1) begin
			$dumpvars(2, DUT.Memory[i]);
		end
	end

	// Test sequence
	initial begin
		$timeformat(-6, 3, "us", 12);
		$display("===== START =====");
		$display("MEMORY_DEPTH: %d", DUT.MEMORY_DEPTH);
		$display("        Time Address DataIn DataOut");
		$monitor("%t       %H     %H      %H", 
			$realtime, 
			Address, 
			DataIn,
			DataOut
		);
		
		@(posedge Clock);
		Reset <= 1'b1;
		@(posedge Clock);
		
		// Write some data
		for(i=0; i<=15; i=i+1) begin
			WriteData(i, $urandom_range(8'h00, 8'hFF));
		end
		WriteEnd();
		
		// Read the data
		ReadEnable <= 1'b1;
		for(i=0; i<=15; i=i+1) begin
			Address <= i;
			@(posedge Clock);
		end
		
		ReadEnable <= 1'b0;
		
		// Pause
		repeat(2) @(posedge Clock);
		
		$display("===== END =====");
		$finish;
	end
	
	task WriteData(input [3:0] Adr, input [7:0] Dat); 
		begin
			Address     <= Adr;
			DataIn      <= Dat;
			WriteEnable <= 1'b1;
			@(posedge Clock);
		end
	endtask
	
	task WriteEnd(); 
		begin
			Address     <= 4'dX;
			DataIn      <= 8'dX;
			WriteEnable <= 1'b0;
			@(posedge Clock);
		end
	endtask

endmodule
`default_nettype wire
