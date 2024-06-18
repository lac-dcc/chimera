// This program was cloned from: https://github.com/emeb/up5k_osc
// License: MIT License

// sine.v - Sine wave shaper
// 03-20-21 E. Brombaugh

`default_nettype none

// interpolated sine
module sine(
    input clk,              	// system clock
	input reset,				// system reset
	input ena,					// system clock enable
	input [31:0] phs,			// phase input
	output signed [15:0] out,	// wave output
	output valid
);	
	// enable pipeline
	reg [6:0] ena_pipe;
	always @(posedge clk)
		if(reset)
			ena_pipe <= 6'b000;
		else
			ena_pipe <= {ena_pipe[6:0],ena};
	
	// select interp components
	reg [7:0] idx;
	reg signed [15:0] interp;
	always @(posedge clk)
		if(ena_pipe[0])
		begin
			idx <= phs[31:24];
			interp <= 16'h7fff - phs[23:9];
			//interp <= 16'h7fff;
		end
		else if(ena_pipe[1])
		begin
			idx <= phs[31:24] + 8'h01;
			interp <= {1'b0,phs[23:9]};
			//interp <= 16'h0;
		end
			
	// sine lookup table
	reg [15:0] sine_mem[255:0];
	initial
		$readmemh("../src/sine.hex",sine_mem);
	
	// look up sine & delay interpolation
	reg signed [15:0] interp_d;
	reg signed [15:0] sin;
	always @(posedge clk)
		if(ena_pipe[1] | ena_pipe[2])
		begin 
			sin <= sine_mem[idx];
			interp_d <= interp;
		end
	
	// sum of products
	reg signed [31:0] m;
	always @(posedge clk)
		if(ena_pipe[2] | ena_pipe[3])
			m <= sin * interp_d;
		
	reg signed [31:0] acc;
	always @(posedge clk)
		if(ena_pipe[2])
			acc <= 32'd0;
		else if(ena_pipe[3] | ena_pipe[4])
			acc <= acc + m;
	
	reg signed [15:0] out;
	always @(posedge clk)
		if(ena_pipe[5])
			out <= acc[30:15];
	
	assign valid = ena_pipe[6];
endmodule

