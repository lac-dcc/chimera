// This program was cloned from: https://github.com/trun/fpgaboy
// License: MIT License

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:37:09 04/26/2012
// Design Name:   joypad_snes_adapter
// Module Name:   G:/Projects/s6atlystest/joypad_snes_adapter_tb.v
// Project Name:  s6atlystest
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: joypad_snes_adapter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module joypad_snes_adapter_tb;

	// Inputs
	reg clock;
	reg reset;
  
	wire [1:0] button_sel;
	wire controller_data;

	// Outputs
	wire [3:0] button_data;
	wire controller_latch;
	wire controller_clock;

	// Instantiate the Unit Under Test (UUT)
	joypad_snes_adapter uut (
		.clock(clock), 
		.reset(reset), 
		.button_sel(button_sel), 
		.button_data(button_data), 
		.controller_data(controller_data), 
		.controller_latch(controller_latch), 
		.controller_clock(controller_clock)
	);

  assign button_sel = 2'b0;
  assign controller_data = 1'b0;

	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 1;
    
    // Wait 100 ns for module reset to finish
    #100 reset = 0;
	end
  
  always begin
    #10 clock = !clock;
  end
      
endmodule

