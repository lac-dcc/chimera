module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire9;
  wire [(4'hb):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire4;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire0;
  assign wire5 = (wire1[(1'h0):(1'h0)] && ($signed((+(wire3 ^ wire0))) << (8'ha5)));
  assign wire6 = wire3[(2'h2):(1'h0)];
  assign wire7 = (~&$unsigned((wire2[(4'h9):(4'h8)] ?
                     (wire4 | wire4[(1'h1):(1'h0)]) : ($unsigned(wire4) ?
                         (wire5 ? wire1 : (8'ha3)) : ((8'h9e) ?
                             (7'h44) : wire1)))));
  assign wire8 = (($signed({$signed(wire2)}) < $signed($signed((wire0 ?
                     wire5 : wire3)))) != {(|wire7[(4'ha):(1'h1)])});
  assign wire9 = wire0[(4'h9):(3'h4)];
  assign wire10 = $unsigned(wire6);
  assign wire11 = {wire2,
                      ((((~&wire0) ? wire4[(2'h3):(1'h0)] : $unsigned(wire0)) ?
                          wire4[(1'h0):(1'h0)] : $signed(((8'h9c) ?
                              wire4 : wire3))) * wire7)};
endmodule
