// This program was cloned from: https://github.com/martinmaly21/ELEC374
// License: MIT License

module or_32_gate(
			input wire [31:0] a_in,
			input wire [31:0] b_in,
			output[31:0] c_out
			);
			
			
			genvar i;
			generate
					for(i = 0; i<32; i = i + 1)
						begin: gen_loop
							assign c_out[i] = ((a_in[i])|(b_in[i]));
						end
			endgenerate
endmodule
							
