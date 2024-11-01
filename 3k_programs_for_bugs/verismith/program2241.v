module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h20):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (+wire1[(4'h9):(3'h6)]);
  assign wire6 = wire1;
  assign wire7 = wire5;
  assign wire8 = wire0;
endmodule
