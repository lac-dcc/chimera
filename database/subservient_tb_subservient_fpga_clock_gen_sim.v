// This program was cloned from: https://github.com/olofk/subservient
// License: Apache License 2.0

module subservient_fpga_clock_gen
  (input wire  i_clk,
   input wire  i_rst,
   output wire o_clk,
   output reg  o_rst);

   assign o_clk = i_clk;
   always @(posedge i_clk) o_rst <= i_rst;

endmodule
