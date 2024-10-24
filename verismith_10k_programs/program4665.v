module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire16;
  wire [(5'h13):(1'h0)] wire15;
  wire [(3'h4):(1'h0)] wire14;
  wire [(3'h6):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire10;
  wire [(3'h4):(1'h0)] wire9;
  wire signed [(5'h15):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  assign y = {wire16,
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
  assign wire4 = (((wire1 ?
                         ((wire3 < wire1) ^ (|wire1)) : ($unsigned(wire0) * wire3[(5'h10):(3'h4)])) < {(wire3 < $signed(wire0))}) ?
                     $signed({(8'hb1)}) : ($signed(wire0) || (~^wire2[(2'h2):(2'h2)])));
  assign wire5 = (8'haa);
  assign wire6 = (wire2 >>> $signed($signed(((wire2 || wire3) << $signed(wire3)))));
  assign wire7 = $unsigned(wire4);
  assign wire8 = wire1;
  assign wire9 = {wire2[(3'h4):(1'h0)]};
  assign wire10 = {wire2[(2'h2):(2'h2)]};
  assign wire11 = wire9;
  assign wire12 = wire8[(4'ha):(4'h9)];
  assign wire13 = (~|$signed(wire11[(2'h3):(1'h0)]));
  assign wire14 = (+(~|wire8));
  assign wire15 = $unsigned(((8'h9c) ?
                      wire0[(3'h7):(2'h3)] : $signed(($signed(wire4) >= (wire4 != (8'hbc))))));
  assign wire16 = $unsigned((((wire4 | wire4[(4'hb):(3'h4)]) != ((wire12 >= wire9) ?
                          wire6 : (!wire9))) ?
                      ((~^(&wire12)) ?
                          $signed(((7'h43) ?
                              wire8 : wire7)) : (8'hab)) : (($signed(wire0) * wire14) ?
                          (-$unsigned(wire8)) : $unsigned(wire14[(3'h4):(3'h4)]))));
endmodule
