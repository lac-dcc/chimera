module register(
  input wire [WIDTH-1:0] in,
  input wire clk,
  input wire reset,
  input wire enable,
  output reg [WIDTH-1:0] out
);

  parameter WIDTH = 8;

  always @(posedge clk) begin
    if (enable)
      out <= in;
  end

endmodule
