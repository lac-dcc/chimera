module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire15;
  wire signed [(4'h8):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire12;
  wire [(3'h6):(1'h0)] wire11;
  wire [(4'hd):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  wire signed [(2'h3):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire5;
  assign y = {wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = $signed({(~&(wire0 & {wire0, wire2}))});
  assign wire6 = wire2[(2'h2):(1'h0)];
  assign wire7 = wire5[(1'h1):(1'h0)];
  assign wire8 = ($signed((~&wire4)) - {$unsigned(($signed(wire2) ~^ (|wire5))),
                     $signed(wire4[(5'h14):(4'h8)])});
  assign wire9 = $unsigned($signed(wire5));
  assign wire10 = wire1[(3'h6):(2'h3)];
  assign wire11 = (($signed($unsigned($unsigned(wire8))) >>> $unsigned($unsigned((-wire3)))) ?
                      ({$unsigned(((8'ha2) ? wire7 : wire10)),
                          wire6[(1'h1):(1'h0)]} - (~^wire9)) : wire8);
  assign wire12 = {(wire8[(1'h0):(1'h0)] >= {(wire11[(2'h2):(2'h2)] ?
                              wire6 : (&wire11)),
                          (wire0 ^ $unsigned(wire11))}),
                      ($signed(((^wire6) ~^ wire3[(4'hb):(4'hb)])) << $unsigned(wire6))};
  assign wire13 = $unsigned((((^(wire2 ? wire8 : wire1)) && $unsigned({wire7,
                      (7'h43)})) || wire6));
  assign wire14 = ($unsigned((($unsigned(wire6) <= wire8[(5'h15):(3'h5)]) && $signed($unsigned((8'hb1))))) ?
                      wire7[(2'h2):(2'h2)] : wire4[(2'h2):(1'h0)]);
  assign wire15 = (+(wire3 >> $unsigned(wire11)));
endmodule
