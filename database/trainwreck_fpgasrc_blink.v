module blink #(parameter BITS = 24)
(
  input clk,
  input reset,
  output blink
);

  reg [BITS-1:0] counter;

  always @(posedge clk or posedge reset)
  begin
    if (reset)
      counter <= {BITS{1'b0}};
    else
      counter <= counter + 1'b1;
  end

  assign blink = counter[BITS-1];

endmodule
