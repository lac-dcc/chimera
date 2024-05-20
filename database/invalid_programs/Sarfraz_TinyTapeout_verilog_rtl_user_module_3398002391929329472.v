// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

`default_nettype none


module user_module_3398002391929329472 (
  input [7:0] io_in,
  output [7:0] io_out
);

  MulInv8 mod1(.clock(1'b0), .reset(1'b0), .io_in(io_in), .io_out(io_out));

endmodule
