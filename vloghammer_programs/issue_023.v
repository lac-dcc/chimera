module issue_023(a, y);
  input [1:0] a;
  output [9:0] y;

  // icarus verilog (git b1ef099) allocates 16GB of memory to process this line
  localparam [4:0] p1 = 1'b1 << ~30'b0;

  // icarus verilog (git b1ef099) fails with an assert when trying to process this line:
  // ivl: verinum.cc:370: verinum::V verinum::set(unsigned int, verinum::V): Assertion 'idx < nbits_' failed.
  localparam [4:0] p2 = 1'b1 << ~40'b0;

  assign y = {p1, p2};
endmodule
