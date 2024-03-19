module counter(
  input wire clk,
  input wire [WIDTH-1:0] in,
  input wire sel_in,
  input wire reset,
  input wire down,
  output reg [WIDTH-1:0] out
);

  parameter WIDTH = 8;

  initial
    out = 0;

  always @(posedge clk) begin
    if (sel_in)
      out <= in;
    else
      if (down)
        out <= out - 1;
      else
        out <= out + 1;
  end

  always @(posedge reset) begin
    out <= 0;
  end

endmodule
