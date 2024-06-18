// This program was cloned from: https://github.com/RustamSubkhankulov/verilog-labs
// License: MIT License

module invertor(
  input wire in,

  output wire out
);

assign out = ~in;

endmodule
