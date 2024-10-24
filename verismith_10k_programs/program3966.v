module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire3;
  assign wire5 = wire1;
  assign wire6 = {wire5};
  assign wire7 = $signed({(~|wire6)});
  assign wire8 = (+wire4[(2'h2):(1'h1)]);
endmodule
