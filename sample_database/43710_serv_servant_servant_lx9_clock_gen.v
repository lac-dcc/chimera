// This program was cloned from: https://github.com/olofk/serv
// License: ISC License

`default_nettype none
module servant_lx9_clock_gen
  (input wire  i_clk,
   input wire  i_rst,
   output wire o_clk,
   output reg  o_rst);

   wire   clkfb;
   wire   locked;
   reg 	  locked_r;

   PLL_BASE
     #(.BANDWIDTH("OPTIMIZED"),
       .CLKFBOUT_MULT(16),
       .CLKIN_PERIOD(25.0), //40MHz
       .CLKOUT1_DIVIDE(40), //16MHz
       .DIVCLK_DIVIDE(1))
   PLL_BASE_inst
     (.CLKOUT1(o_clk),
      .CLKOUT2(),
      .CLKOUT3(),
      .CLKOUT4(),
      .CLKOUT5(),
      .CLKFBOUT(clkfb),
      .LOCKED(locked),
      .CLKIN(i_clk),
      .RST(i_rst),
      .CLKFBIN(clkfb));

   always @(posedge o_clk) begin
      locked_r <= locked;
      o_rst  <= !locked_r;
   end

endmodule
