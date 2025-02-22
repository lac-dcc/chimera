// This program was cloned from: https://github.com/lnis-uofu/OpenFPGA
// License: MIT License

//-------------------------------------------------------
//  Functionality: A 12-bit multiply-acculumate circuit
//  Author:        Xifan Tang
//-------------------------------------------------------

module mac_12(a, b, c, out);
parameter DATA_WIDTH = 12;  /* declare a parameter. default required */
input [DATA_WIDTH - 1 : 0] a, b, c;
output [DATA_WIDTH - 1 : 0] out;

assign out = a * b + c;

endmodule









