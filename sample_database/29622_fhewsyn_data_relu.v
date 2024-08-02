// This program was cloned from: https://github.com/Chair-for-Security-Engineering/fhewsyn
// License: BSD 3-Clause "New" or "Revised" License

module my_package(
  input signed [15:0] x,
  output wire [15:0] out
);
  assign out = (x > 0) ? x : 0;
endmodule
