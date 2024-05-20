// This program was cloned from: https://github.com/faramire/TT06-simple-stopwatch
// License: Apache License 2.0

module clockDividerIce (
  input wire clk_in, // input clock 12 MHz
  input wire ena,
  input wire res,    // reset, active low
  output reg clk_out // output clock 1 MHz
);

  reg[2:0] counter;
  parameter div     = 6; // 12 MHz / 12 = 1 MHz, 50% duty cycle => 1/2 of that


  always @(posedge clk_in) begin
    if (!res) begin // reset
      counter <= 3'b0;
      clk_out <= 1'b0;
    end else if (ena) begin
      if (counter < (div-1)) begin    // count up
        counter <= counter + 1;
      end else begin                  // reset counter and invert output
        counter <= 3'b0;
        clk_out <= ~clk_out;
      end
    end
  end

endmodule //clockDividerIce
