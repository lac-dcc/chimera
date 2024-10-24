module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire101;
  wire [(5'h13):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire4;
  assign y = {wire101, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire0;
  assign wire5 = ((^{wire2[(3'h7):(3'h7)],
                         ($unsigned(wire4) ?
                             wire4[(1'h1):(1'h0)] : (wire3 ? wire1 : wire2))}) ?
                     (8'had) : $unsigned(((+$unsigned(wire3)) != wire2[(4'ha):(3'h4)])));
  assign wire6 = ((-wire2[(2'h2):(1'h1)]) ?
                     ($signed(wire0) > $unsigned({((8'hb7) ?
                             wire3 : wire1)})) : {wire0});
  assign wire7 = wire1;
  assign wire8 = ($unsigned(wire0) && {$unsigned(({wire3} | wire3[(2'h3):(2'h3)])),
                     wire2});
  module9 #() modinst102 (.wire13(wire3), .wire10(wire6), .y(wire101), .wire11(wire8), .clk(clk), .wire12(wire4));
endmodule

module module9
#(parameter param100 = ((+(^(((8'hb7) + (8'had)) ? (~^(8'ha5)) : ((8'haa) ? (8'hb7) : (8'ha0))))) ? ((((+(8'h9f)) ? (+(8'hb8)) : (8'ha1)) ? ((~|(8'ha5)) <<< ((8'hbc) ? (8'hae) : (8'hb4))) : (~|((8'hb3) ? (8'haf) : (8'hb9)))) ? (+(((8'ha7) >= (8'hb1)) != (-(8'haa)))) : (&(-((7'h42) ? (8'h9c) : (8'hb1))))) : ((+(((8'hac) ? (8'ha4) : (8'haa)) == {(8'ha8), (8'hba)})) == {((8'hb6) || ((8'had) + (8'ha8)))})))
(y, clk, wire10, wire11, wire12, wire13);
  output wire [(32'h1cd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire10;
  input wire signed [(5'h13):(1'h0)] wire11;
  input wire signed [(4'h8):(1'h0)] wire12;
  input wire [(5'h11):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire99;
  wire signed [(3'h5):(1'h0)] wire98;
  wire signed [(5'h14):(1'h0)] wire95;
  wire signed [(5'h15):(1'h0)] wire94;
  wire signed [(4'hf):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire17;
  wire [(4'h9):(1'h0)] wire33;
  wire [(5'h12):(1'h0)] wire34;
  wire signed [(4'he):(1'h0)] wire35;
  wire [(4'h9):(1'h0)] wire63;
  wire [(4'hd):(1'h0)] wire65;
  wire signed [(5'h11):(1'h0)] wire66;
  wire signed [(5'h10):(1'h0)] wire69;
  wire signed [(3'h7):(1'h0)] wire92;
  reg signed [(5'h10):(1'h0)] reg97 = (1'h0);
  reg [(4'hd):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg68 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire95,
                 wire94,
                 wire14,
                 wire17,
                 wire33,
                 wire34,
                 wire35,
                 wire63,
                 wire65,
                 wire66,
                 wire69,
                 wire92,
                 reg97,
                 reg96,
                 reg15,
                 reg16,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg67,
                 reg68,
                 (1'h0)};
  assign wire14 = (wire10 ?
                      {((~&$unsigned((8'h9d))) ?
                              (wire12[(1'h0):(1'h0)] ?
                                  wire10 : wire11[(2'h2):(1'h1)]) : wire13[(5'h10):(3'h4)]),
                          $unsigned((wire11[(2'h2):(1'h0)] == wire11))} : (~&wire12));
  always
    @(posedge clk) begin
      reg15 <= wire11[(1'h0):(1'h0)];
      reg16 <= reg15[(2'h2):(1'h0)];
    end
  assign wire17 = $unsigned({(^wire10[(5'h13):(5'h11)]),
                      $unsigned(wire13[(5'h11):(5'h10)])});
  always
    @(posedge clk) begin
      reg18 <= wire11[(1'h1):(1'h0)];
      reg19 <= (!(^$unsigned(wire12[(3'h7):(1'h0)])));
      reg20 <= $unsigned(reg16[(4'ha):(3'h4)]);
      reg21 <= ((8'ha4) || {wire12[(2'h3):(2'h3)], $unsigned(wire17)});
      if ((^~(wire13 | $signed(((wire11 ? (8'hbf) : reg18) < (^wire14))))))
        begin
          if ({wire11, $signed((~reg16))})
            begin
              reg22 <= $signed((^~reg16[(2'h2):(1'h0)]));
              reg23 <= wire10[(1'h0):(1'h0)];
              reg24 <= {($unsigned(($signed((8'h9c)) ?
                          (wire12 && reg20) : (reg15 & reg18))) ?
                      wire13[(1'h0):(1'h0)] : {$unsigned((reg19 ?
                              reg23 : reg16)),
                          ((wire14 << (8'hbb)) ?
                              (reg23 ? (8'h9c) : reg15) : (reg22 ?
                                  reg15 : reg21))})};
              reg25 <= $unsigned($signed((((wire12 ? reg20 : reg18) ?
                  ((8'hbb) ?
                      reg18 : reg19) : (reg19 > reg15)) && (~^$signed(wire13)))));
            end
          else
            begin
              reg22 <= (($unsigned((^~reg25)) < (8'ha4)) + $unsigned(wire14[(3'h5):(3'h4)]));
              reg23 <= reg23;
            end
          reg26 <= reg21;
          if (reg18)
            begin
              reg27 <= wire17;
              reg28 <= $signed(($signed(($unsigned(wire12) ^~ (wire13 ?
                  wire10 : reg27))) ^ reg16));
              reg29 <= wire10;
              reg30 <= ($signed($signed(reg19)) < {$unsigned(reg16[(4'hd):(4'hc)]),
                  (({wire13} <= reg27) || wire13)});
              reg31 <= (+((^~(^{wire13})) ?
                  wire14[(3'h4):(1'h1)] : $unsigned((reg22[(3'h7):(2'h3)] ?
                      $signed(reg24) : (^wire17)))));
            end
          else
            begin
              reg27 <= wire13;
              reg28 <= (reg18[(2'h2):(1'h1)] >= wire13);
              reg29 <= $signed(((($unsigned(reg30) <= ((8'ha3) ?
                      wire13 : reg25)) ?
                  {$unsigned((8'h9d))} : (reg15 ?
                      reg22 : (~&reg18))) == reg23[(5'h11):(3'h7)]));
              reg30 <= {$unsigned({({reg25, reg22} ?
                          (wire13 ? wire14 : reg31) : reg27),
                      wire14}),
                  {(~^(reg23[(4'h8):(3'h5)] == ((7'h44) ? reg19 : (8'hb4))))}};
              reg31 <= (reg25 ?
                  (~&wire10[(3'h7):(3'h7)]) : ($signed(reg23) ?
                      (!$signed($signed(reg28))) : {($unsigned(reg24) != reg19),
                          (!$unsigned(reg23))}));
            end
          reg32 <= (~^$signed(((reg21[(1'h1):(1'h0)] ?
              reg22 : reg19[(1'h0):(1'h0)]) << reg24[(4'h9):(2'h3)])));
        end
      else
        begin
          reg22 <= (&$unsigned((^(reg20 <= (&wire14)))));
          reg23 <= $unsigned(wire10);
          reg24 <= reg26[(4'h9):(1'h1)];
          reg25 <= ({reg21} ?
              wire13 : ($signed((reg16[(2'h2):(1'h1)] ?
                      reg30 : reg22[(3'h7):(3'h6)])) ?
                  (~|(^~reg31)) : reg26[(2'h2):(1'h0)]));
          reg26 <= wire10[(4'h9):(3'h7)];
        end
    end
  assign wire33 = ({reg24, reg31[(4'hc):(4'h9)]} ^~ wire11[(2'h2):(1'h1)]);
  assign wire34 = ((reg18 ^~ {$signed((reg26 >= reg27)),
                          $unsigned(reg25[(3'h7):(1'h1)])}) ?
                      $signed($unsigned(({wire12} ?
                          (!wire11) : wire33))) : (-(({reg31} ^ (reg20 << reg32)) * $signed((reg32 ?
                          reg20 : reg29)))));
  assign wire35 = $signed((^$unsigned(((~reg25) < wire12[(3'h4):(2'h2)]))));
  module36 #() modinst64 (wire63, clk, wire11, wire10, wire34, wire33);
  assign wire65 = ((8'hb5) * $signed(reg25));
  assign wire66 = ((((~&{reg26, (8'hb5)}) + $signed(wire14)) ?
                      $unsigned($signed((~&wire35))) : (({wire14} ?
                              (wire63 >>> reg21) : (wire14 < reg19)) ?
                          (~&(reg21 >> (8'hb1))) : (&(reg23 ?
                              wire11 : wire35)))) || $unsigned({((reg28 ?
                          reg30 : (8'hba)) || $signed(reg22))}));
  always
    @(posedge clk) begin
      if (($signed($signed(($signed(wire17) ?
          (~^reg32) : (!wire65)))) >= {(wire33 ?
              ({wire10, reg15} || (reg25 ? wire63 : reg25)) : (8'ha3)),
          {$unsigned($signed(reg29))}}))
        begin
          reg67 <= (((reg20[(3'h7):(2'h3)] >> $signed((reg19 ?
                  (8'hb3) : reg21))) ?
              ((+(wire11 ?
                  (8'ha5) : wire66)) >> $signed($signed((8'hbb)))) : ($unsigned($unsigned(wire34)) ^ ((wire63 == reg26) << wire66[(3'h4):(2'h3)]))) || (+(^~($unsigned(reg20) | (wire17 || wire12)))));
          reg68 <= wire11[(1'h0):(1'h0)];
        end
      else
        begin
          reg67 <= ((((wire66 ? (~|wire63) : (reg23 ~^ reg16)) ?
                  reg23[(3'h7):(1'h1)] : (~^wire11[(4'hf):(3'h7)])) >= reg24[(3'h4):(1'h0)]) ?
              ({(~^$signed(wire17)), $signed($unsigned(reg20))} ?
                  ($unsigned($signed(wire65)) ?
                      ((&(8'hb8)) == $signed(reg20)) : (~|reg29[(5'h12):(4'he)])) : $signed((reg23[(5'h13):(4'hc)] ?
                      (wire63 ?
                          reg68 : reg25) : (&reg30)))) : wire65[(4'ha):(3'h7)]);
          reg68 <= reg18[(2'h3):(1'h0)];
        end
    end
  assign wire69 = reg19;
  module70 #() modinst93 (.clk(clk), .y(wire92), .wire72(reg21), .wire74(wire10), .wire71(wire63), .wire73(wire66));
  assign wire94 = ((reg20 >= (wire34 ?
                          ($unsigned(wire34) || (reg24 ?
                              reg16 : wire35)) : (~^(~|(8'hb1))))) ?
                      $unsigned($signed((-(7'h44)))) : {reg20[(1'h0):(1'h0)],
                          reg68[(2'h3):(2'h2)]});
  assign wire95 = reg26;
  always
    @(posedge clk) begin
      reg96 <= (wire66 ? reg20[(4'h8):(3'h4)] : wire33[(1'h0):(1'h0)]);
      reg97 <= (^~reg18[(4'h8):(1'h0)]);
    end
  assign wire98 = (!$signed((+{reg15[(2'h2):(1'h1)], wire94[(4'h9):(2'h2)]})));
  assign wire99 = {$signed(reg23[(1'h0):(1'h0)]), (~^{$signed((&(7'h41)))})};
endmodule

module module70
#(parameter param91 = {(((^((8'hac) ? (8'hb2) : (8'hae))) > (-((8'h9e) ? (8'ha4) : (7'h43)))) || (((-(8'hb4)) == ((8'ha7) && (8'ha3))) >>> ((|(8'hb7)) <= (^~(8'hb4))))), ((((8'ha3) != {(8'hb7), (8'ha8)}) * (|((8'hb3) ? (8'hb6) : (7'h42)))) ? (!(((7'h44) ^ (8'ha2)) ? (-(8'ha9)) : ((7'h44) && (8'hb3)))) : (-(((8'ha4) ? (8'hae) : (8'hb5)) == {(8'hac)})))})
(y, clk, wire74, wire73, wire72, wire71);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire74;
  input wire [(5'h11):(1'h0)] wire73;
  input wire [(4'he):(1'h0)] wire72;
  input wire [(4'h9):(1'h0)] wire71;
  wire signed [(4'ha):(1'h0)] wire90;
  wire [(5'h10):(1'h0)] wire89;
  wire signed [(5'h11):(1'h0)] wire88;
  wire signed [(4'h9):(1'h0)] wire87;
  wire [(4'hd):(1'h0)] wire86;
  wire [(4'hc):(1'h0)] wire75;
  reg signed [(4'hf):(1'h0)] reg85 = (1'h0);
  reg [(2'h3):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg81 = (1'h0);
  reg [(4'hb):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg79 = (1'h0);
  reg [(5'h10):(1'h0)] reg78 = (1'h0);
  reg [(3'h5):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg76 = (1'h0);
  assign y = {wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire75,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 (1'h0)};
  assign wire75 = {(($unsigned(wire73) || wire71[(1'h1):(1'h0)]) ?
                          $signed(wire73[(1'h0):(1'h0)]) : $unsigned({$unsigned(wire74),
                              (wire71 >>> wire73)}))};
  always
    @(posedge clk) begin
      if (wire71[(3'h6):(1'h1)])
        begin
          if ($signed(((wire73 ? wire71 : wire75) ?
              ($unsigned(wire71) ?
                  (~|wire74) : wire73[(4'hc):(4'hc)]) : {(~^(wire73 | (8'ha2)))})))
            begin
              reg76 <= {$signed(wire71[(1'h0):(1'h0)]), wire73[(4'hf):(2'h3)]};
              reg77 <= $signed(((&reg76[(2'h3):(2'h2)]) ?
                  wire72[(3'h5):(2'h3)] : $unsigned(reg76[(1'h0):(1'h0)])));
              reg78 <= ($unsigned({$unsigned((wire73 ? wire74 : (8'hbc))),
                      (reg76[(4'h8):(1'h1)] ? reg76 : $signed(reg77))}) ?
                  $unsigned((^(~$signed(wire71)))) : (($unsigned((wire74 >> wire72)) + (wire74 >= wire75)) >>> wire72[(1'h0):(1'h0)]));
              reg79 <= $signed(((($signed(wire72) ~^ (!reg77)) ?
                      $signed((reg76 != reg76)) : wire73) ?
                  $unsigned(((8'hbe) ?
                      (~&wire74) : wire72)) : (wire75 && ($signed(reg76) - (~^reg76)))));
            end
          else
            begin
              reg76 <= wire71;
              reg77 <= (^wire75);
              reg78 <= $signed(wire73[(4'he):(4'hc)]);
              reg79 <= ((((reg76 >> ((8'hae) >> reg76)) ~^ wire75[(3'h6):(2'h3)]) ?
                  $unsigned(reg77[(3'h5):(3'h4)]) : (~&((wire75 - wire71) || (-wire74)))) >>> $unsigned((wire74[(5'h12):(4'ha)] < reg77[(3'h4):(2'h2)])));
            end
          reg80 <= $signed(({$unsigned((wire75 ? (8'hb4) : wire74)),
              (-wire74[(2'h3):(2'h2)])} || wire75));
          if ((reg76 ^~ (8'hbe)))
            begin
              reg81 <= $signed(((((reg79 >> wire75) ?
                          (~wire71) : $signed(wire75)) ?
                      reg80[(1'h1):(1'h0)] : $signed(((8'had) ?
                          wire73 : (8'hb1)))) ?
                  {$unsigned($unsigned(reg80))} : wire72[(1'h1):(1'h0)]));
            end
          else
            begin
              reg81 <= $unsigned((8'hab));
              reg82 <= $unsigned({$signed((~&(!wire75)))});
            end
        end
      else
        begin
          reg76 <= (+reg78[(4'hd):(3'h4)]);
          reg77 <= {{(-($unsigned(reg81) ?
                      (reg79 ? reg77 : wire71) : reg78[(4'hf):(4'h8)]))},
              $unsigned((wire75[(1'h0):(1'h0)] ? (|(~|reg76)) : wire75))};
          reg78 <= wire71[(1'h0):(1'h0)];
          reg79 <= (($unsigned(($unsigned(reg80) + reg76[(3'h4):(1'h1)])) ?
                  (~reg79) : reg77[(3'h5):(3'h4)]) ?
              (~(|reg81[(3'h4):(3'h4)])) : (((wire75[(4'ha):(3'h7)] ?
                      (|wire73) : (~&wire72)) - reg82) ?
                  $signed(({wire75, (8'ha8)} ^~ (reg80 ?
                      reg78 : (8'hb0)))) : ($signed((reg79 ? reg76 : wire71)) ?
                      ((reg82 <= (8'ha6)) | wire73) : $signed(reg76))));
          reg80 <= $signed((+(~^$unsigned({(8'ha1)}))));
        end
      reg83 <= $unsigned({(8'haa)});
      reg84 <= $signed($unsigned(($signed({reg77, (8'ha9)}) >= reg82)));
      reg85 <= ($signed(((-(wire73 ? reg84 : wire72)) <= ((reg81 - wire71) ?
              {reg84} : reg83[(5'h10):(4'h8)]))) ?
          ((reg79[(4'he):(2'h2)] ?
              ({reg80} | $unsigned(reg77)) : reg78) << $unsigned(({reg79,
              wire71} == {reg81}))) : (reg77 & (|(reg79[(5'h11):(4'hd)] >> reg77[(2'h3):(2'h3)]))));
    end
  assign wire86 = reg81[(3'h7):(1'h0)];
  assign wire87 = reg85[(3'h7):(1'h0)];
  assign wire88 = $unsigned((~(reg84 && $signed((reg80 ? wire75 : wire72)))));
  assign wire89 = reg76;
  assign wire90 = wire89;
endmodule

module module36
#(parameter param62 = (~&(^~{(((8'hb2) << (8'hb5)) & ((8'hb7) ? (8'hb0) : (8'hb5)))})))
(y, clk, wire40, wire39, wire38, wire37);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire40;
  input wire [(5'h13):(1'h0)] wire39;
  input wire signed [(5'h12):(1'h0)] wire38;
  input wire signed [(4'h9):(1'h0)] wire37;
  wire [(5'h14):(1'h0)] wire61;
  wire signed [(4'h8):(1'h0)] wire60;
  wire signed [(4'hd):(1'h0)] wire59;
  wire signed [(2'h2):(1'h0)] wire51;
  wire signed [(3'h5):(1'h0)] wire50;
  wire [(2'h3):(1'h0)] wire49;
  wire [(4'h9):(1'h0)] wire48;
  wire signed [(5'h11):(1'h0)] wire47;
  wire signed [(5'h14):(1'h0)] wire46;
  wire signed [(5'h13):(1'h0)] wire45;
  wire [(5'h14):(1'h0)] wire44;
  wire [(4'he):(1'h0)] wire43;
  wire [(3'h4):(1'h0)] wire42;
  wire signed [(4'hb):(1'h0)] wire41;
  reg signed [(5'h10):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg56 = (1'h0);
  reg [(4'ha):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg53 = (1'h0);
  reg [(5'h14):(1'h0)] reg52 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  assign wire41 = wire39[(4'h9):(3'h7)];
  assign wire42 = (wire41 <= (+$signed($unsigned((wire39 ? wire38 : wire37)))));
  assign wire43 = $signed($unsigned(((^~wire41) ?
                      ($unsigned(wire38) ?
                          wire37 : {wire39}) : $signed((-wire42)))));
  assign wire44 = (~&$unsigned(wire41));
  assign wire45 = wire37;
  assign wire46 = (((~wire44[(4'hd):(3'h4)]) ?
                      ($unsigned((&wire43)) <<< $unsigned(wire37)) : (^~{(wire45 ^ wire38),
                          wire43})) || wire41);
  assign wire47 = wire42[(3'h4):(2'h2)];
  assign wire48 = $signed(($signed(($unsigned(wire39) <= wire41)) ?
                      {wire39[(1'h0):(1'h0)]} : $unsigned(wire37)));
  assign wire49 = (wire46 >> wire42);
  assign wire50 = ($signed(wire37) * $signed({$unsigned($signed(wire48))}));
  assign wire51 = (&((($signed(wire43) + $unsigned(wire46)) < wire40[(1'h1):(1'h1)]) ?
                      wire45[(3'h7):(1'h0)] : wire41[(3'h7):(2'h3)]));
  always
    @(posedge clk) begin
      if (((-wire40) ? wire40 : (~&wire37)))
        begin
          reg52 <= (^~(((~{(8'hb8)}) ? $signed(wire44) : wire39) <<< wire42));
          reg53 <= $unsigned((((~(wire46 <<< (8'h9f))) ?
                  $signed((wire43 + (8'had))) : (8'hb9)) ?
              wire47 : (!$unsigned($signed(wire38)))));
          reg54 <= (((8'haa) ?
              ($unsigned((^wire37)) ?
                  (^~(8'h9f)) : wire38) : $signed((!wire41[(4'hb):(1'h0)]))) >>> reg52[(1'h1):(1'h0)]);
        end
      else
        begin
          reg52 <= (&$unsigned(wire45[(4'h8):(3'h7)]));
        end
      reg55 <= (((8'had) ? $unsigned({((7'h40) ^ wire46)}) : wire39) ?
          wire51 : $signed((8'ha7)));
      reg56 <= (-(-($signed(wire46[(4'hd):(3'h7)]) || $unsigned((8'hb0)))));
      reg57 <= $unsigned((^((~wire45) ?
          (~&$signed(reg52)) : ((wire46 < wire49) ?
              (wire40 ^ (8'had)) : (|wire44)))));
      reg58 <= ($signed((reg55[(3'h6):(1'h0)] ?
          reg53[(1'h0):(1'h0)] : (((8'hbe) ? wire44 : wire44) ~^ {wire51,
              wire51}))) | wire40);
    end
  assign wire59 = ($unsigned((+wire43)) ?
                      $signed(wire42[(1'h0):(1'h0)]) : ($signed((!$signed(wire46))) ?
                          wire38[(4'he):(2'h2)] : {{((8'hae) - wire45)},
                              $unsigned((wire43 ? wire43 : reg56))}));
  assign wire60 = $signed((^(($unsigned((8'ha5)) ^ reg53[(3'h4):(1'h0)]) ?
                      $signed((wire45 ? wire41 : reg57)) : reg54)));
  assign wire61 = wire48[(3'h6):(2'h3)];
endmodule
