// This program was cloned from: https://github.com/huangxc6/Software_Hardware_Co-Design_24Spring
// License: MIT License

// Name:CPU
// Function: 
// KEY[0] is the reset input, 
// KEY[1] is the clock,
// SW[7] is the Run input,
// SW[5-0] are the Din

// bus appears on LEDR[5-0],
// done appears on LEDR[7].
// Author: caojian
module cpu (clk_in1_n, clk_in1_p, KEY, SW, LEDR);
    input      clk_in1_n, clk_in1_p;
	input       KEY;
	input [7:0] SW;
	output [7:0] LEDR; 	

	wire Resetn,  Run, Done;
	wire Manual_Clock;
	wire [5:0] DIN, Bus;

	assign Resetn = SW[6];
	assign Manual_Clock = KEY;	
		// Note: can't use name Clock because this is defined as
		// the 50 MHz Clock coming into the FPGA from the board
	assign DIN = SW[5:0];
	assign Run = SW[7];

	proc U1 (clk_in1_p, clk_in1_n, DIN, Resetn, Manual_Clock, Run, Done, Bus);

	assign LEDR[5:0] = Bus;
	assign LEDR[6] = 1'b0;
	assign LEDR[7] = Done;

endmodule