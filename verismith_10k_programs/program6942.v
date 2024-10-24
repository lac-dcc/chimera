module top
#(parameter param29 = (({(((8'hae) | (8'h9c)) ? (8'hbf) : (~|(8'ha4))), (((8'h9c) ? (8'hb8) : (8'haa)) <= (+(7'h40)))} & (8'hb4)) ? (~^(+(^~(&(8'hba))))) : (-(((~^(7'h40)) ? ((8'hab) ? (8'hbf) : (8'hae)) : ((8'hb5) << (8'hb9))) ? (8'h9e) : (((8'ha3) ^~ (8'h9e)) ? (|(8'hb1)) : (~|(7'h42)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h74):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  wire [(4'he):(1'h0)] wire28;
  wire signed [(5'h11):(1'h0)] wire27;
  wire [(3'h6):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire25;
  wire [(3'h4):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire23;
  wire [(5'h10):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire21;
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire4,
                 wire21,
                 (1'h0)};
  assign wire4 = $signed($signed($signed(wire2[(3'h4):(1'h0)])));
  module5 #() modinst22 (wire21, clk, wire1, wire4, wire2, wire0, wire3);
  assign wire23 = (-wire3);
  assign wire24 = wire23[(3'h4):(2'h3)];
  assign wire25 = ((+(^$unsigned((wire0 ^~ wire2)))) >= $signed(wire23[(4'ha):(1'h1)]));
  assign wire26 = wire4[(4'hb):(3'h7)];
  assign wire27 = (($signed($unsigned(wire4)) ?
                          ($signed(wire21[(2'h2):(1'h1)]) ?
                              $signed($signed(wire24)) : (((8'ha0) << wire4) == (wire3 * wire24))) : (((+wire4) ?
                              (8'hb6) : $unsigned((8'ha5))) && ((8'ha0) + wire4[(3'h5):(2'h2)]))) ?
                      wire3 : $signed(wire26));
  assign wire28 = $unsigned(wire3);
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire10;
  input wire [(4'ha):(1'h0)] wire9;
  input wire [(4'h9):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire7;
  input wire signed [(3'h4):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire20;
  wire [(5'h15):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire18;
  wire signed [(4'hc):(1'h0)] wire17;
  wire [(4'hd):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire15;
  wire signed [(2'h2):(1'h0)] wire14;
  wire signed [(4'h8):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire11;
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 (1'h0)};
  assign wire11 = {(((^~{wire6, (8'hbb)}) | $unsigned({wire6,
                          wire8})) ^ wire8[(3'h5):(1'h1)]),
                      {(&$unsigned($unsigned(wire9))), (8'ha8)}};
  assign wire12 = $signed(wire9[(3'h6):(1'h0)]);
  assign wire13 = (8'hb4);
  assign wire14 = (~&wire13[(3'h4):(1'h1)]);
  assign wire15 = ($unsigned(((-(wire14 >= wire8)) - {wire13[(3'h4):(2'h2)]})) & wire12);
  assign wire16 = (+$signed({$signed((~&wire11)),
                      (-(wire7 ? wire14 : wire11))}));
  assign wire17 = $signed($unsigned((8'hba)));
  assign wire18 = (^(+((~&(wire13 && wire9)) ?
                      (((8'ha8) || wire6) ?
                          (!wire17) : $signed(wire11)) : (wire9 ?
                          $unsigned(wire16) : wire16[(4'hb):(1'h0)]))));
  assign wire19 = ((8'hbe) < ({((wire9 ? wire10 : wire17) ~^ wire13),
                      $signed(wire13)} & wire15));
  assign wire20 = ((~&$unsigned(((wire14 ? (8'haf) : wire15) ?
                      (wire17 ?
                          (8'hb0) : wire16) : wire8[(1'h1):(1'h1)]))) == $unsigned(($signed((wire10 ~^ wire11)) ?
                      wire10[(3'h4):(1'h1)] : $unsigned($unsigned(wire11)))));
endmodule
