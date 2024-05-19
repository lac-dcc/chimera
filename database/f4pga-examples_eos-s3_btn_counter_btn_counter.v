// This program was cloned from: https://github.com/chipsalliance/f4pga-examples
// License: Apache License 2.0

module top (
    input  wire       clk,
    output wire [3:0] led
);

  reg [3:0] cnt;
  initial cnt <= 0;

  always @(posedge clk) cnt <= cnt + 1;

  assign led = cnt;

endmodule
