// Monitor any transitions, stretch the pulse so it's human-visible
//
// GNSS Firehose
// Copyright (c) 2012 Peter Monta <pmonta@gmail.com>

module activity(
  input clk,
  input x,
  output reg led
);

  reg x0;
  reg [23:0] c;

  always @(posedge clk) begin
    x0 <= x;
    if (x0^x)
      c <= 0;
    else
      c <= (c==24'd16777215) ? c : c+1;
    led <= (c!=24'd16777215);
  end


endmodule
