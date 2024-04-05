`include "macros.vh"

module serializer #(parameter IN_WIDTH = 64, parameter OUT_WIDTH = 8)
(
  input clk,
  input reset,

  input                in_val,
  input [IN_WIDTH-1:0] in_bits,
  output               in_rdy,

  output reg             out_val,
  output [OUT_WIDTH-1:0] out_bits,
  input                  out_rdy
);

  reg [`ceilLog2(IN_WIDTH/OUT_WIDTH)-1:0] cnt;
  reg [IN_WIDTH-1:0] bits;

  always @(posedge clk)
  begin
    if (reset)
      out_val <= 1'b0;
    else if (in_rdy && in_val)
      out_val <= 1'b1;
    else if (out_rdy && out_val && cnt == IN_WIDTH/OUT_WIDTH-1)
      out_val <= 1'b0;

    if (in_rdy && in_val)
      cnt <= {`ceilLog2(IN_WIDTH/OUT_WIDTH){1'b0}};
    else if (out_rdy && out_val)
      cnt <= cnt+1'b1;

    if (in_rdy && in_val)
      bits <= in_bits;
    else if (out_rdy && out_val)
      bits <= bits >> OUT_WIDTH;
  end

  assign in_rdy = ~out_val;
  assign out_bits = bits[OUT_WIDTH-1:0];

endmodule

module deserializer #(parameter IN_WIDTH = 8, parameter OUT_WIDTH = 64)
(
  input clk,
  input reset,

  input                in_val,
  input [IN_WIDTH-1:0] in_bits,
  output               in_rdy,

  output                     out_val,
  output reg [OUT_WIDTH-1:0] out_bits,
  input                      out_rdy
);

  reg [`ceilLog2(OUT_WIDTH/IN_WIDTH)-1:0] cnt;
  reg val;

  always @(posedge clk)
  begin
    if (reset)
      val <= 1'b0;
    else if (in_rdy && in_val)
      val <= 1'b1;
    else if (out_rdy && out_val)
      val <= 1'b0;

    if (in_rdy && in_val)
    begin
      cnt <= val ? cnt+1'b1 : 1'b0;
      out_bits <= {in_bits, out_bits[OUT_WIDTH-1:IN_WIDTH]};
    end
  end

  assign out_val = val & (cnt == OUT_WIDTH/IN_WIDTH-1);
  assign in_rdy = ~out_val;

endmodule
