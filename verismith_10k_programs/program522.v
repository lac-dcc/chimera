module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire8;
  wire [(4'h8):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire4;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (~(((-(8'hb2)) ~^ $signed(((8'ha0) | wire0))) ?
                     wire0[(4'ha):(1'h1)] : (|wire1)));
  assign wire5 = wire3[(4'hb):(3'h4)];
  assign wire6 = (!(($unsigned((wire1 * (8'hb7))) & $signed(wire2[(4'hd):(1'h1)])) | wire3[(1'h0):(1'h0)]));
  assign wire7 = $signed((~^{wire3, (+(~wire5))}));
  assign wire8 = (&wire3);
  assign wire9 = (|$unsigned((~wire4)));
  assign wire10 = wire6[(3'h6):(3'h6)];
  assign wire11 = {$signed($signed((wire6[(3'h4):(2'h2)] ?
                          (wire5 <= wire8) : ((8'hbf) >> wire1)))),
                      $unsigned(wire2)};
endmodule
