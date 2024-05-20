// This program was cloned from: https://github.com/dinoboards/V9958-Super
// License: BSD 3-Clause "New" or "Revised" License

/////////////////////////////////////////////////////////////////////////////////////////
// Differential Clock Divider
//
// This clock divider provides a fine grained clock division achieving much better
// results in dividing source clocks.
//
// It works by integrating the difference (clock skew) over the time and skipping
// cycles everytime the difference is over 1 cycle to keep up with the target clock.
//
// For example: integer dividing 125Mhz by 3.579545 gives us 34 wich provides a clock
// of 3.676470588 Mhz or 2.71% off !
//
// By using this differential clock divider on the same values you can achieve 3.58Mhz
// wich corresponds to 0.01% off !!!!
//
// Don't forget to add a BUFG to the output clk for a higher fanout of the signal
//
// Author: Felipe Antoniosi
// Date: 2023/07/01
//
/////////////////////////////////////////////////////////////////////////////////////////


module CLOCK_DIV #(
    parameter real CLK_SRC = 125,
    parameter real CLK_DESIRED = 3.579545,
    parameter int PRECISION_BITS = 16
) (
    input  clk_src,
    output clk_desired
);

  localparam int CLK_HALF = $rtoi($floor(CLK_SRC / CLK_DESIRED / 2.0));
  localparam int CLK_END = $rtoi($floor(CLK_SRC / CLK_DESIRED));
  localparam real CLK_SKEW = (CLK_SRC / CLK_DESIRED) - $floor(CLK_SRC / CLK_DESIRED);
  localparam int SKW_TICKS = $rtoi($floor(CLK_SKEW / 2.0 / (1.0 / ($pow(2.0, $itor(PRECISION_BITS)) - 1))));

  localparam C_DEV_PRECISION_BITS_MSB = $clog2(CLK_END - 1);
  localparam C_DEV_PRECISION_BITS = (C_DEV_PRECISION_BITS_MSB+1);

  logic [C_DEV_PRECISION_BITS_MSB:0] cdiv = 1;
  logic [PRECISION_BITS:0] sdiff = 0;
  logic clk_skew = 0;
  logic ff_clk_desired;

  always_ff @(posedge clk_src) begin

    if (sdiff[PRECISION_BITS-1] == 0)
      if (cdiv != CLK_HALF - 1 && cdiv != CLK_END - 1) cdiv++;
      else begin
        ff_clk_desired <= ~ff_clk_desired;
        if (cdiv == CLK_END - 1) begin
          sdiff = PRECISION_BITS'(sdiff + SKW_TICKS);
          cdiv  = 0;
        end else cdiv = C_DEV_PRECISION_BITS'(cdiv + 1);

      end
    else sdiff[PRECISION_BITS-1] = 0;

  end

  assign clk_desired = ff_clk_desired;

endmodule
