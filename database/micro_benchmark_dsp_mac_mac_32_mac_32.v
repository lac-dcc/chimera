// This program was cloned from: https://github.com/tangxifan/micro_benchmark
// License: MIT License

//-------------------------------------------------------
//  Functionality: A 32-bit multiply-acculumate circuit
//  Author:        Xifan Tang
//-------------------------------------------------------

module mac_32(a, b, c, out);
parameter DATA_WIDTH = 32;  /* declare a parameter. default required */
input [DATA_WIDTH - 1 : 0] a, b, c;
output [DATA_WIDTH - 1 : 0] out;

assign out = a * b + c;

endmodule









