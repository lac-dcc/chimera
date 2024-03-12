`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:31:29 11/16/2016
// Design Name:   mips
// Module Name:   D:/ISE/P4/mips_txt.v
// Project Name:  P4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mips
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mips_txt;

	// Inputs
	reg clk;
	reg reset;
	reg interrupt;

	// Outputs
	wire [31:0] addr;
	

	// Instantiate the Unit Under Test (UUT)
	mips uut (
		.clk(clk), 
		.reset(reset),
		.addr(addr),
		.interrupt(interrupt)
	);

	parameter delay_pc = 32'h00004198;
	integer delay_count;
	integer interrupt_counter;
	integer needInterrupt;

	initial begin
		delay_count = 0;
		interrupt = 0;
		needInterrupt = 0;
		interrupt_counter = 0;
		// Initialize Inputs
		clk = 0;
		reset = 1;
		#20 reset = 0;
		// Wait 100 ns for global reset to finish
		// Add stimulus here

	end
   always #2 clk = ~clk;

   always @(negedge clk) begin
      if (reset) begin
	  	interrupt_counter = 0;
		needInterrupt = 0;
		interrupt = 0;
	  end else begin
	  	if (interrupt) begin
		  	if (interrupt_counter == 0) begin
				interrupt = 0;
			end else begin
				interrupt_counter = interrupt_counter - 1;
			end
		end else if (needInterrupt) begin
			needInterrupt = 0;
			interrupt = 1;
			interrupt_counter = 5;
		end else begin
			case (addr)
				delay_pc: 
					begin
						if (delay_count == 0) begin
							delay_count = 1;
							interrupt = 1;
							interrupt_counter = 5;
						end
					end
			endcase
		end
	  end
	
   end

endmodule

