// This program was cloned from: https://github.com/Chair-for-Security-Engineering/fhewsyn
// License: BSD 3-Clause "New" or "Revised" License

module add4(
  input wire [3:0] a,
  input wire [3:0] b,
  output wire [4:0] out
);
  assign out = a + b;
endmodule
