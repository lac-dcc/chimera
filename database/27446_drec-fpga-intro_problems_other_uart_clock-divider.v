// This program was cloned from: https://github.com/alexpaniman/drec-fpga-intro
// License: GNU General Public License v2.0

module clock_divider #(
  parameter NATIVE_CLK_FREQUENCY = 1,
  parameter TARGET_CLK_FREQUENCY = 1,
  parameter DELAYED_START = 0
) (input wire clk, input wire reset, output wire target_clk);
   parameter REDUCTION_RATE = NATIVE_CLK_FREQUENCY / TARGET_CLK_FREQUENCY;
   
   reg [$clog2(REDUCTION_RATE):0]counter = 0;

   always @(posedge clk, posedge reset)
       counter <= reset? DELAYED_START : counter + 1;

   assign target_clk = counter == REDUCTION_RATE;

   // NOTE: Question, is it ok to use negedge clk?
   always @(negedge clk)
       if (target_clk)
           counter <= 0;
endmodule
