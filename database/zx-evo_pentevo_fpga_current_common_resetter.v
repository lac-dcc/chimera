`include "tune.v"

// Reset from MCU must be long enough
module resetter
(
  input  wire clk,
  input  wire rst_in_n,      // external asynchronous reset
  output reg  rst_out_n      // synchronized reset
);

  always @(posedge clk)
    rst_out_n <= rst_in_n;

endmodule

