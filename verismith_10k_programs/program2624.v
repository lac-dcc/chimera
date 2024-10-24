module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire17;
  wire [(4'h9):(1'h0)] wire16;
  wire [(3'h6):(1'h0)] wire15;
  wire signed [(5'h15):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire13;
  wire signed [(3'h7):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire11;
  wire signed [(4'hb):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire4;
  assign y = {wire17,
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
  assign wire4 = {$unsigned(wire2[(1'h0):(1'h0)]),
                     ((^$unsigned((8'hab))) | wire0)};
  assign wire5 = ((~^$signed((~&(wire0 ? wire2 : wire0)))) | wire1);
  assign wire6 = ($signed((^$unsigned((!wire2)))) || $unsigned($unsigned($signed($unsigned(wire5)))));
  assign wire7 = (8'hb0);
  assign wire8 = wire1[(4'h9):(3'h4)];
  assign wire9 = ($signed({($unsigned(wire6) + (~^wire6))}) >>> wire3[(3'h6):(3'h4)]);
  assign wire10 = (^~wire7[(3'h4):(1'h1)]);
  assign wire11 = $signed($unsigned($unsigned($signed(wire0[(4'h8):(2'h3)]))));
  assign wire12 = ((8'ha1) > $unsigned(wire7[(3'h6):(2'h2)]));
  assign wire13 = wire10;
  assign wire14 = $signed(((((wire11 ? (8'ha5) : wire9) ~^ {wire4, wire2}) ?
                          (((8'hb1) ? (8'hbc) : wire4) ?
                              wire9 : wire13) : ({wire8} >> {wire7, wire2})) ?
                      {{((8'hae) != wire13),
                              (^wire10)}} : $signed((~&$unsigned((8'hb5))))));
  assign wire15 = {wire0,
                      (($unsigned((~&wire9)) <= $unsigned(wire11)) ?
                          wire5[(4'hc):(4'hb)] : ($signed($unsigned(wire10)) ?
                              (~^(8'hb7)) : ($signed(wire6) > (wire1 || wire4))))};
  assign wire16 = ($unsigned(wire3[(3'h4):(3'h4)]) ^~ $signed($unsigned(({wire7} ~^ (wire15 ?
                      wire9 : wire10)))));
  assign wire17 = $unsigned($signed(($signed(((8'hb8) && wire16)) ?
                      $signed((8'ha9)) : ((|wire6) ?
                          (wire7 - wire5) : {(8'hb4), wire12}))));
endmodule
