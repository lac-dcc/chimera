// This program was cloned from: https://github.com/YosysHQ/apicula
// License: MIT License

module top(outp);
  output outp;
  wire gen_000_;
  OBUF myobuf (
    .I(gen_000_),
    .O(outp)
  );
endmodule
