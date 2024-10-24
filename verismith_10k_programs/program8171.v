module top
#(parameter param50 = ((((!((8'ha9) || (7'h44))) <= (+((8'hb9) ? (8'ha1) : (8'hac)))) == {(^((8'hbf) ? (8'h9e) : (8'hab))), (^(-(8'hab)))}) ? (~|(&(((8'hb4) - (8'hb3)) ? ((7'h43) ? (8'ha8) : (8'ha4)) : ((8'hbf) ? (7'h43) : (8'hb8))))) : ((^~(((8'ha2) ? (8'haf) : (8'hb5)) ~^ ((8'h9f) <<< (8'ha5)))) ? ((~&{(8'hb2), (8'hbf)}) == {((8'ha3) ? (8'haa) : (8'ha9)), ((8'hb2) ^ (8'hac))}) : ((~^((8'h9f) || (8'hab))) ? (~&{(8'hba), (8'ha1)}) : (8'hb8)))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h98):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire [(4'h9):(1'h0)] wire49;
  wire signed [(5'h12):(1'h0)] wire48;
  wire signed [(5'h13):(1'h0)] wire46;
  wire signed [(4'h9):(1'h0)] wire34;
  wire signed [(4'ha):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire9;
  wire signed [(3'h5):(1'h0)] wire10;
  wire [(4'h9):(1'h0)] wire30;
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire46,
                 wire34,
                 wire33,
                 wire32,
                 wire5,
                 wire9,
                 wire10,
                 wire30,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = wire3[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg6 <= $unsigned($signed(wire4));
      reg7 <= (($signed((~&wire0[(3'h6):(3'h5)])) ?
              wire4[(4'hd):(4'ha)] : $signed((^$unsigned(wire3)))) ?
          (~^$unsigned((~&$signed(wire2)))) : wire1[(2'h3):(1'h0)]);
      reg8 <= ((8'had) ?
          ($unsigned($signed(wire3)) <<< (~|$signed((wire0 ?
              wire3 : reg6)))) : {{wire1}, (8'hac)});
    end
  assign wire9 = {wire0[(4'hc):(4'hb)], reg8};
  assign wire10 = $signed(((((wire2 ? wire2 : reg6) ?
                          wire3[(2'h3):(2'h2)] : (wire0 ?
                              wire4 : reg6)) & wire2[(2'h2):(1'h1)]) ?
                      (^reg6) : (reg8 ?
                          (~wire2[(3'h6):(1'h1)]) : $signed(wire9[(4'hc):(4'h9)]))));
  module11 #() modinst31 (wire30, clk, wire0, reg8, wire4, wire1);
  assign wire32 = (8'h9e);
  assign wire33 = (~&$signed($unsigned($unsigned((^reg7)))));
  assign wire34 = wire9[(4'hc):(1'h1)];
  module35 #() modinst47 (wire46, clk, reg8, wire2, wire33, wire1, wire0);
  assign wire48 = wire0;
  assign wire49 = reg6;
endmodule

module module35  (y, clk, wire40, wire39, wire38, wire37, wire36);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire40;
  input wire [(3'h5):(1'h0)] wire39;
  input wire [(4'ha):(1'h0)] wire38;
  input wire [(5'h12):(1'h0)] wire37;
  input wire [(5'h15):(1'h0)] wire36;
  wire [(3'h5):(1'h0)] wire45;
  wire [(5'h13):(1'h0)] wire44;
  wire [(5'h10):(1'h0)] wire43;
  wire [(4'h9):(1'h0)] wire42;
  wire [(2'h2):(1'h0)] wire41;
  assign y = {wire45, wire44, wire43, wire42, wire41, (1'h0)};
  assign wire41 = ($signed({$unsigned($unsigned(wire36)),
                          $signed($unsigned(wire38))}) ?
                      $signed((&$signed($signed(wire37)))) : (~^(~|(((8'hb2) ?
                              wire38 : wire40) ?
                          {wire39} : wire38[(3'h7):(1'h0)]))));
  assign wire42 = ($unsigned((~^(wire40 & (wire39 >= wire38)))) ?
                      (wire37[(3'h6):(1'h0)] || $signed(({wire38} >>> (^wire36)))) : wire40);
  assign wire43 = $signed((wire42[(3'h5):(3'h4)] >= $signed({(wire39 ?
                          wire41 : (8'hab))})));
  assign wire44 = $signed($unsigned(($unsigned((^~wire38)) >> $signed((!(8'hab))))));
  assign wire45 = (!wire39);
endmodule

module module11
#(parameter param29 = (({{((8'hb8) ^~ (8'ha2))}} & ((&(8'had)) <= (((8'ha1) - (8'hae)) + ((8'h9d) ? (8'hb1) : (8'hbc))))) << {((+((8'h9e) << (8'hbf))) || {((8'ha3) ~^ (7'h43)), {(7'h44), (8'hbd)}}), {(((8'hb2) ? (7'h44) : (7'h44)) ? ((8'hb3) ? (8'hba) : (8'h9c)) : ((7'h43) * (8'ha0)))}}))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire15;
  input wire signed [(5'h10):(1'h0)] wire14;
  input wire signed [(5'h15):(1'h0)] wire13;
  input wire [(5'h12):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire28;
  wire signed [(4'h8):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire23;
  wire [(5'h15):(1'h0)] wire22;
  wire [(4'hf):(1'h0)] wire21;
  wire signed [(5'h15):(1'h0)] wire20;
  wire [(3'h5):(1'h0)] wire19;
  wire [(2'h2):(1'h0)] wire18;
  wire [(4'hb):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire16;
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  assign y = {wire28,
                 wire25,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 reg27,
                 reg26,
                 reg24,
                 (1'h0)};
  assign wire16 = wire13;
  assign wire17 = wire13;
  assign wire18 = wire15;
  assign wire19 = ($unsigned($signed((wire14[(4'hb):(3'h6)] + $signed(wire17)))) <= wire17[(1'h1):(1'h1)]);
  assign wire20 = $signed((~&wire19));
  assign wire21 = wire19[(3'h4):(3'h4)];
  assign wire22 = ((&((&wire14[(4'he):(3'h7)]) ?
                          $unsigned((wire18 ?
                              wire16 : wire13)) : ({wire13} == (&wire15)))) ?
                      $signed({((~wire13) == $signed(wire14)),
                          wire16[(4'ha):(3'h4)]}) : $signed($signed($unsigned((-(8'hac))))));
  assign wire23 = wire20[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg24 <= {($signed($signed((wire17 ? wire17 : (8'ha2)))) ?
              $unsigned((+wire16)) : wire15),
          wire13[(1'h0):(1'h0)]};
    end
  assign wire25 = wire23;
  always
    @(posedge clk) begin
      reg26 <= $signed($unsigned({wire13,
          ((reg24 ^~ wire17) <<< (wire12 ? reg24 : wire20))}));
      reg27 <= (+(8'hbe));
    end
  assign wire28 = $signed($unsigned({wire23, wire17[(2'h2):(2'h2)]}));
endmodule
