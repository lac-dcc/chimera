module top
#(parameter param16 = (&(8'ha1)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h89):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire15;
  wire [(5'h13):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire12;
  wire signed [(5'h12):(1'h0)] wire11;
  wire signed [(2'h2):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
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
  assign wire5 = ({((wire3[(4'h8):(2'h2)] ?
                             ((8'hba) ? wire2 : wire3) : (wire2 << wire1)) ?
                         $unsigned($unsigned(wire4)) : {$unsigned(wire1)}),
                     (^(wire4[(3'h7):(2'h3)] ?
                         (wire1 ?
                             (8'ha5) : wire4) : (-wire0)))} ~^ {$unsigned((wire0[(4'hf):(3'h7)] + (^wire0))),
                     ($signed((wire1 != wire2)) ?
                         wire4 : ((wire4 - (7'h43)) ^ wire1))});
  assign wire6 = $unsigned($signed($signed($signed((8'ha5)))));
  assign wire7 = ((!(wire1[(2'h2):(2'h2)] == (+(wire6 ?
                     wire5 : wire4)))) | (!(((&wire5) << wire2) ?
                     wire5 : $signed(wire2))));
  assign wire8 = $unsigned((8'h9e));
  assign wire9 = wire3[(4'hc):(3'h7)];
  assign wire10 = $signed((~|wire6));
  assign wire11 = {((($signed(wire5) ? {wire7, wire1} : wire2[(1'h1):(1'h1)]) ?
                              (~$unsigned((7'h40))) : (wire0[(3'h6):(3'h5)] * ((8'hac) | wire2))) ?
                          (|wire8) : $unsigned((wire1 ~^ $signed((8'hba))))),
                      (wire7 | ($unsigned($signed(wire0)) ?
                          $signed(wire9) : wire0))};
  assign wire12 = (({((+wire9) << {wire1, (8'hbc)}),
                      (~|wire5)} - wire6) ~^ (^~((^~wire3[(4'h9):(3'h7)]) != ((wire10 ~^ wire7) && (^wire7)))));
  assign wire13 = $unsigned((~&(wire2[(1'h1):(1'h0)] >= ({(8'hab)} == {wire10}))));
  assign wire14 = $unsigned($signed((wire11[(4'h8):(3'h6)] ?
                      $signed((-wire10)) : (8'hb7))));
  assign wire15 = wire2[(3'h4):(2'h2)];
endmodule
