module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire8;
  wire signed [(2'h3):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  assign y = {wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = {wire2[(1'h1):(1'h0)]};
  assign wire6 = wire1;
  assign wire7 = wire1[(1'h1):(1'h0)];
  assign wire8 = (~|({(&$signed(wire0))} >>> $unsigned((wire6[(4'ha):(4'h9)] ?
                     (-wire3) : (&wire6)))));
  assign wire9 = (+wire7[(2'h2):(1'h1)]);
endmodule
