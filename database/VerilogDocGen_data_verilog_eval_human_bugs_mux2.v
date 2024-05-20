// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module bugs_mux2 (
  input sel,
  input [7:0] a,
  input [7:0] b,
  output reg [7:0] out

);

  // assign out = (~sel & a) | (sel & b);
    assign out = sel ? a : b;

endmodule



