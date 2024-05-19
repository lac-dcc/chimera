// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module top (CLOCK_50, KEY, SW, LEDR);

    input CLOCK_50;             // DE-series 50 MHz clock signal
	 input wire [3:0] KEY;       // DE-series pushbuttons
    input wire [9:0] SW;        // DE-series switches
    
    output wire [9:0] LEDR;     // DE-series LEDs   

    lab5 lab5 (CLOCK_50, KEY[1:0], SW[9:0], LEDR[9:0]);

endmodule
