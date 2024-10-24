module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hbc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire23;
  wire signed [(4'hd):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire21;
  wire signed [(3'h5):(1'h0)] wire20;
  wire signed [(4'h9):(1'h0)] wire19;
  wire signed [(3'h4):(1'h0)] wire18;
  wire signed [(3'h5):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire16;
  wire [(5'h13):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire11;
  wire [(5'h10):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire4;
  assign y = {wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
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
                 wire4,
                 (1'h0)};
  assign wire4 = {(~|wire1[(2'h3):(2'h2)])};
  assign wire5 = wire2[(4'h8):(3'h7)];
  assign wire6 = $unsigned(((wire3 * wire1[(3'h4):(3'h4)]) ^~ (&((wire5 != wire2) ?
                     (wire2 ? wire1 : (8'hb9)) : wire1[(2'h2):(2'h2)]))));
  assign wire7 = {wire2, $unsigned($signed(wire0))};
  assign wire8 = (wire2[(4'hb):(1'h0)] || wire3[(3'h4):(2'h2)]);
  assign wire9 = (&(|(-(^~(wire8 & wire2)))));
  assign wire10 = (wire3 <<< $signed(wire4[(2'h3):(1'h0)]));
  assign wire11 = $signed(wire1);
  assign wire12 = (|($unsigned({(~wire7), $signed(wire11)}) ?
                      ((~wire11) ?
                          ((wire7 ? wire0 : wire3) ?
                              (wire9 ?
                                  wire6 : wire1) : (+wire9)) : $signed((wire5 > wire9))) : wire6));
  assign wire13 = $signed(wire12[(3'h6):(1'h0)]);
  assign wire14 = ($unsigned($unsigned($unsigned($signed((8'hb4))))) | (($unsigned((-wire8)) ?
                          wire8 : $signed(wire10)) ?
                      $signed($signed(wire12)) : wire7[(1'h0):(1'h0)]));
  assign wire15 = {$unsigned((+$signed({(8'hb1), wire8})))};
  assign wire16 = ($unsigned(wire1) | wire0[(4'h9):(1'h1)]);
  assign wire17 = wire10;
  assign wire18 = (^~$unsigned((((wire17 <<< wire12) == (wire12 ?
                      (7'h40) : wire7)) ~^ (&wire9))));
  assign wire19 = wire11[(1'h1):(1'h0)];
  assign wire20 = (8'ha3);
  assign wire21 = (((+wire15[(4'hb):(4'hb)]) >> wire8[(1'h0):(1'h0)]) != wire4[(1'h1):(1'h1)]);
  assign wire22 = (8'ha3);
  assign wire23 = $unsigned((-wire8));
endmodule
