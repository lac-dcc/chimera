// This program was cloned from: https://github.com/martinmaly21/ELEC374
// License: MIT License

module div_32_gate(
			input wire [31:0] a_dividend,
			input wire [31:0] b_divisor,
			output reg [63:0] c_quotient_and_remainder
			);	
	integer i; 
	//sign extended
	reg [32:0] dividend_se;
	reg [64:0] quotient_and_remainder_se;

	always @(a_dividend or b_divisor) begin
		quotient_and_remainder_se[31:0] = b_divisor;
		quotient_and_remainder_se[64:32] = 0;
		dividend_se[31:0] = a_dividend;

		for(i=0;i<32;i= i + 1) begin
			dividend_se[32] = dividend_se[31];
			quotient_and_remainder_se = quotient_and_remainder_se << 1;
			quotient_and_remainder_se[64:32] = quotient_and_remainder_se[64:32] - a_dividend;

			if (quotient_and_remainder_se[63] == 1) begin
				quotient_and_remainder_se[0] = 0;
				quotient_and_remainder_se[64:32] = quotient_and_remainder_se[64:32] + dividend_se;
			end else if (quotient_and_remainder_se[63] == 0) begin
				quotient_and_remainder_se[0] = 1;
			end
		end
		c_quotient_and_remainder <= quotient_and_remainder_se[63:0];
	end
endmodule