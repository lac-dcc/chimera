module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned($unsigned(((~|$signed((8'hb6))) >>> $unsigned($signed(wire1)))));
  assign wire5 = wire4[(4'hf):(4'hb)];
  assign wire6 = {({wire3[(1'h0):(1'h0)]} >= $unsigned((~&$signed((8'ha7))))),
                     ((-(wire0 ?
                         wire1[(1'h0):(1'h0)] : (wire3 <<< wire2))) << (8'hae))};
  assign wire7 = $signed(wire0[(1'h1):(1'h1)]);
endmodule
