// This program was cloned from: https://github.com/n1gp/Anvelina_PROIII
// License: GNU General Public License v3.0

// Interpolating CIC filter, order 5.
// Produce an output when clock_en is true.  Output a strobe on req
// to request an input from the next filter.

module CicInterpM5(
	input clock,
	input clock_en,				// enable an output sample
	output reg req,				// request the next input sample
	input signed [IBITS-1:0] x_real,	// input samples
	input signed [IBITS-1:0] x_imag,
	output signed [OBITS-1:0] y_real,	// output samples
	output signed [OBITS-1:0] y_imag
	);
	
	parameter RRRR = 160;		// interpolation; limited by size of counter
	parameter IBITS = 20;		// input bits
	parameter OBITS = 16;		// output bits
	parameter GBITS = 30;		//log2(RRRR ** 4);	// growth bits: growth is R**M / R
	// Note: log2() rounds UP to the next integer - Not available in Verilog!
	localparam CBITS = IBITS + GBITS;	// calculation bits  CBITS = 24 + 38 = 62

	reg [9:0] counter;		// increase for higher maximum RRRR  **** was [7:0]

	reg signed [CBITS-1:0] x0, x1, x2, x3, x4, x5, dx0, dx1, dx2, dx3, dx4;		// variables for comb, real
	reg signed [CBITS-1:0] y1, y2, y3, y4, y5;	// variables for integrator, real
	reg signed [CBITS-1:0] q0, q1, q2, q3, q4, q5, dq0, dq1, dq2, dq3, dq4;		// variables for comb, imag
	reg signed [CBITS-1:0] s1, s2, s3, s4, s5;	// variables for integrator, imag

	wire signed [CBITS-1:0] sxtxr, sxtxi;
	assign sxtxr = {{(CBITS - IBITS){x_real[IBITS-1]}}, x_real};	// sign extended
	assign sxtxi = {{(CBITS - IBITS){x_imag[IBITS-1]}}, x_imag};
//	assign y_real = y5[CBITS-1 -:OBITS]+ y5[45];		// [61:46]output data  with truncation to remove DC spur  
//	assign y_imag = s5[CBITS-1 -:OBITS]+ s5[45]; 	
	
	assign y_real = y5[CBITS-1 -:OBITS]+ y5[44];		// [61:46]output data  with truncation to remove DC spur
	assign y_imag = s5[CBITS-1 -:OBITS]+ s5[44];    // Gain of 2 for testing 
	
	initial
	begin
		counter = 0;
		req = 0;
	end

	always @(posedge clock)
	begin
		if (clock_en)
		begin
			// (x0, q0) -> comb -> (x5, q5) -> interpolate -> integrate -> (y5, s5)
			if (counter == RRRR - 10'd1)
			begin	// Process the sample (x0, q0) to get (x5, q5)
				counter <= 10'd0;
				x0 <= sxtxr;
				q0 <= sxtxi;
				req <= 1'd1;
				// Comb for real data
				x1 <= x0 - dx0;
				x2 <= x1 - dx1;			
				x3 <= x2 - dx2;				
				x4 <= x3 - dx3;				
				x5 <= x4 - dx4;			
				dx0 <= x0;
				dx1 <= x1;
				dx2 <= x2;
				dx3 <= x3;
				dx4 <= x4;
				// Comb for imaginary data
				q1 <= q0 - dq0;
				q2 <= q1 - dq1;
				q3 <= q2 - dq2;
				q4 <= q3 - dq3;
				q5 <= q4 - dq4;
				dq0 <= q0;
				dq1 <= q1;
				dq2 <= q2;
				dq3 <= q3;
				dq4 <= q4;
			end
			else
			begin
				counter <= counter + 10'd1;
				x5 <= 0;	// stuff a zero for (x5, q5)
				q5 <= 0;
				req <= 1'd0;
			end
			// Integrate the sample (x5, q5) to get the output (y5, s5)
			// Integrator for real data; input is x5
			y1 <= y1 + x5;
			y2 <= y2 + y1;
			y3 <= y3 + y2;
			y4 <= y4 + y3;
			y5 <= y5 + y4;
			// Integrator for imaginary data; input is q5
			s1 <= s1 + q5;
			s2 <= s2 + s1;
			s3 <= s3 + s2;
			s4 <= s4 + s3;
			s5 <= s5 + s4;
		end
		else
		begin
			req <= 1'd0;
		end
	end
endmodule

