module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  reg signed [(5'h10):(1'h0)] reg4 = (1'h0);
  assign y = {wire7, wire6, wire5, reg4, (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (&wire2);
    end
  assign wire5 = $signed((~|wire2));
  assign wire6 = wire5[(1'h1):(1'h0)];
  assign wire7 = (8'h9f);
endmodule
