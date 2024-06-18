// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module conditional (
  input [7:0] a,
  input [7:0] b,
  input [7:0] c,
  input [7:0] d,
  output reg [7:0] min

);

  always_comb begin
    min = a;
    if (min > b) min = b;
    if (min > c) min = c;
    if (min > d) min = d;
  end

endmodule



