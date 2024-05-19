// This program was cloned from: https://github.com/viduraakalanka/HDL-Bits-Solutions
// License: The Unlicense

module top_module (
    input in1,
    input in2,
    output out);
	assign out = in1&&~in2;
endmodule
