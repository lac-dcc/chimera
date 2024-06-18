// This program was cloned from: https://github.com/martinmaly21/ELEC374
// License: MIT License

module neg_32_gate(
	input wire [31:0] a_in,
	output wire [31:0] b_out
	);
	
	wire [31:0] not_result; 
    not_32_gate test1(a_in, not_result);

    wire [31:0] add_result;
    add_32_gate test2(not_result, 32'd1, add_result);
	
    assign b_out = add_result;

endmodule