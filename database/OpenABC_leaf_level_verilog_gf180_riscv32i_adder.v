// This program was cloned from: https://github.com/NYU-MLDA/OpenABC
// License: BSD 3-Clause "New" or "Revised" License

module adder (input [31:0] a, b,
              output [31:0] y);
   
   assign y = a + b;
   
endmodule