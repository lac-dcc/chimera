module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire [(3'h6):(1'h0)] wire21;
  wire signed [(5'h10):(1'h0)] wire20;
  wire signed [(5'h12):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire17;
  assign y = {wire21, wire20, wire19, wire4, wire17, (1'h0)};
  assign wire4 = (~^$signed(wire1));
  module5 #() modinst18 (wire17, clk, wire3, wire2, wire4, wire1, wire0);
  assign wire19 = {((~^(wire1[(4'h8):(2'h2)] || wire4[(3'h7):(3'h5)])) < (+$unsigned({(8'ha2),
                          wire2}))),
                      (($unsigned($unsigned(wire3)) ?
                              ((wire2 | (8'ha6)) + $unsigned(wire0)) : (-wire0)) ?
                          {(wire17[(1'h1):(1'h1)] ?
                                  (wire17 <= wire3) : {wire3}),
                              wire1[(3'h6):(1'h1)]} : (8'hb8))};
  assign wire20 = ((!$unsigned({$unsigned((8'h9f)),
                      (&wire19)})) - $signed((8'hbe)));
  assign wire21 = (({(~^(wire20 ? (7'h40) : wire0))} ?
                      (!(&$unsigned(wire1))) : $unsigned({{wire20}})) == (^$signed($unsigned($unsigned(wire20)))));
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire10;
  input wire [(5'h15):(1'h0)] wire9;
  input wire signed [(3'h6):(1'h0)] wire8;
  input wire signed [(3'h5):(1'h0)] wire7;
  input wire [(5'h14):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire16;
  wire [(4'hb):(1'h0)] wire15;
  wire [(4'hf):(1'h0)] wire14;
  wire signed [(5'h12):(1'h0)] wire13;
  wire signed [(4'he):(1'h0)] wire12;
  wire signed [(3'h7):(1'h0)] wire11;
  assign y = {wire16, wire15, wire14, wire13, wire12, wire11, (1'h0)};
  assign wire11 = {$unsigned({$unsigned((wire10 ? (7'h41) : wire8))})};
  assign wire12 = wire9;
  assign wire13 = (wire12[(4'ha):(1'h1)] ?
                      $signed($unsigned($signed((wire6 >>> wire8)))) : $unsigned(({{wire8,
                                  wire7}} ?
                          $unsigned($unsigned(wire12)) : wire10[(1'h0):(1'h0)])));
  assign wire14 = wire7[(2'h2):(2'h2)];
  assign wire15 = wire6;
  assign wire16 = wire6;
endmodule
