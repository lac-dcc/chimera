// This program was cloned from: https://github.com/Chair-for-Security-Engineering/fhewsyn
// License: BSD 3-Clause "New" or "Revised" License

module const4(
  input wire [3:0] a,
  output wire [4:0] out
);
  assign out = a + 4'b1010;
endmodule
