module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = ($unsigned((wire4[(4'hc):(4'hb)] && ((wire2 && wire3) ^~ (^wire2)))) * $unsigned(wire3[(1'h0):(1'h0)]));
  assign wire6 = $unsigned($signed(({{wire1, wire3}, $signed((8'ha5))} ?
                     wire4[(1'h1):(1'h0)] : (^wire4))));
  assign wire7 = wire2[(2'h3):(2'h2)];
  assign wire8 = $signed(wire1[(3'h7):(1'h1)]);
endmodule
