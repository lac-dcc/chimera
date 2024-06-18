// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module top (SW, KEY, LEDR, GPIO);

	 input wire [9:0] SW;        // DE-series switches
    input wire [3:0] KEY;       // DE-series pushbuttons
	 inout wire [31:0] GPIO;
	 output wire [9:0] LEDR;     // DE-series LEDs   

    sm_cpu sm_cpu (KEY[0], KEY[3], SW[4:0], LEDR[9:0], GPIO[31:16], GPIO[15:0]);

endmodule

