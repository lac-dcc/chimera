// This program was cloned from: https://github.com/damdoy/ice40_ultraplus_examples
// License: Mozilla Public License 2.0

`include "calc.v"
`include "calc_dsp.v"

module top(input [3:0] SW, input clk, output LED_R, output LED_G, output LED_B);

   wire correct;

   //implementation without DSP
   // calc calc_inst(
   //    .clk(clk), .correct(correct)
   // );

   //implementation with DSP
   calc_dsp calc_dsp_inst(
      .clk(clk), .correct(correct)
   );

  //leds are active low
  assign LED_R = ~correct;
  assign LED_G = ~correct;
  assign LED_B = ~correct;

  initial begin
  end

  always @(posedge clk)
  begin
  end

endmodule
