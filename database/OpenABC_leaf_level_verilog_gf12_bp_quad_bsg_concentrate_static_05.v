// This program was cloned from: https://github.com/NYU-MLDA/OpenABC
// License: BSD 3-Clause "New" or "Revised" License

module bsg_concentrate_static_05
(
  i,
  o
);

  input [4:0] i;
  output [1:0] o;
  wire [1:0] o;
  assign o[1] = i[2];
  assign o[0] = i[0];

endmodule