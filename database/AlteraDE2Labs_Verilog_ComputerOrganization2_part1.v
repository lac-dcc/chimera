module part1 (CLOCK_50, KEY, LEDR, LEDG, SW);
	input CLOCK_50;
	input [3:0] KEY;
	input [17:0] SW;
	output [17:0] LEDR;
	output [8:0] LEDG;
	
	nios_system CPU (CLOCK_50, SW[7:0], LEDG[7:0], LEDR[15:0], KEY[0]);
endmodule