module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h293):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire [(3'h4):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire125;
  wire [(2'h3):(1'h0)] wire109;
  wire [(3'h4):(1'h0)] wire108;
  wire signed [(4'h8):(1'h0)] wire107;
  wire [(2'h3):(1'h0)] wire106;
  wire signed [(4'hb):(1'h0)] wire105;
  wire signed [(3'h6):(1'h0)] wire104;
  wire signed [(5'h14):(1'h0)] wire76;
  wire [(4'hd):(1'h0)] wire75;
  wire signed [(5'h11):(1'h0)] wire74;
  wire signed [(2'h2):(1'h0)] wire73;
  wire signed [(4'hd):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire71;
  reg signed [(3'h5):(1'h0)] reg124 = (1'h0);
  reg [(3'h7):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg119 = (1'h0);
  reg [(2'h2):(1'h0)] reg118 = (1'h0);
  reg [(4'ha):(1'h0)] reg117 = (1'h0);
  reg [(3'h4):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg114 = (1'h0);
  reg [(4'hd):(1'h0)] reg113 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg112 = (1'h0);
  reg [(4'ha):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg102 = (1'h0);
  reg [(2'h3):(1'h0)] reg101 = (1'h0);
  reg signed [(4'he):(1'h0)] reg100 = (1'h0);
  reg [(3'h4):(1'h0)] reg99 = (1'h0);
  reg [(5'h11):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg96 = (1'h0);
  reg [(3'h7):(1'h0)] reg95 = (1'h0);
  reg [(4'hb):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg92 = (1'h0);
  reg [(5'h15):(1'h0)] reg91 = (1'h0);
  reg [(5'h10):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg89 = (1'h0);
  reg [(4'hc):(1'h0)] reg88 = (1'h0);
  reg [(5'h11):(1'h0)] reg87 = (1'h0);
  reg [(5'h11):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg84 = (1'h0);
  reg [(3'h5):(1'h0)] reg83 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg80 = (1'h0);
  reg [(4'h9):(1'h0)] reg79 = (1'h0);
  reg [(3'h5):(1'h0)] reg78 = (1'h0);
  reg [(5'h11):(1'h0)] reg77 = (1'h0);
  assign y = {wire125,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire71,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 (1'h0)};
  assign wire5 = (!wire0[(4'ha):(1'h0)]);
  assign wire6 = $unsigned(wire4);
  assign wire7 = $unsigned(wire5[(4'h8):(3'h4)]);
  assign wire8 = wire3[(4'hc):(3'h6)];
  assign wire9 = {($unsigned(($signed(wire6) - $unsigned(wire4))) != $unsigned(wire5)),
                     (wire6[(1'h0):(1'h0)] ?
                         wire5 : $signed((wire6[(4'hb):(1'h1)] ?
                             {wire8} : $unsigned(wire7))))};
  module10 #() modinst72 (.wire14(wire4), .clk(clk), .wire15(wire7), .wire11(wire9), .wire13(wire6), .wire12(wire3), .y(wire71));
  assign wire73 = (~^(8'hb2));
  assign wire74 = (^((!$unsigned(wire4[(3'h4):(2'h3)])) ?
                      (8'h9e) : (wire6 ~^ (wire8 ?
                          $unsigned(wire3) : $unsigned(wire73)))));
  assign wire75 = $signed(($signed(((~wire5) ? $signed(wire5) : (8'h9c))) ?
                      (($signed(wire5) >>> {(8'hbd)}) || wire3) : (wire9[(2'h3):(1'h0)] ?
                          {(~wire4), (wire2 ^ wire3)} : ((wire4 ?
                              wire1 : wire74) << wire8[(4'he):(4'hc)]))));
  assign wire76 = $signed($unsigned(({(~wire1)} ? (8'ha3) : wire6)));
  always
    @(posedge clk) begin
      if (wire6[(4'hd):(4'ha)])
        begin
          reg77 <= (+wire1);
          if (($signed($signed(wire4)) ?
              $signed((wire9[(5'h10):(3'h4)] ?
                  $unsigned(((7'h43) ?
                      wire0 : (8'ha6))) : wire1[(2'h3):(2'h3)])) : ($unsigned((8'ha7)) ~^ {wire76})))
            begin
              reg78 <= ((!(~^(wire0 >> wire74))) + (wire6[(5'h12):(4'hc)] ?
                  $unsigned((wire71 ?
                      (wire71 ?
                          (8'ha5) : wire3) : wire6)) : $signed($unsigned((wire76 <<< (8'ha1))))));
              reg79 <= reg78;
              reg80 <= (8'ha0);
            end
          else
            begin
              reg78 <= wire8[(4'hf):(2'h2)];
              reg79 <= $unsigned(({$signed((~reg78))} ?
                  $unsigned($signed(wire73)) : reg78));
              reg80 <= reg78[(2'h3):(1'h0)];
              reg81 <= $unsigned($signed((reg77[(1'h0):(1'h0)] >= (8'ha1))));
            end
          reg82 <= $signed($unsigned(($signed((reg80 ? (8'hbd) : wire74)) ?
              (wire8 ? wire1 : $unsigned(wire7)) : (wire7 >> (wire75 ?
                  wire7 : reg80)))));
          reg83 <= ((~|reg80[(3'h7):(3'h5)]) ?
              $unsigned($signed((&wire5[(3'h4):(1'h0)]))) : $signed(reg78[(3'h4):(1'h0)]));
          reg84 <= (^(-$unsigned({$unsigned(wire8)})));
        end
      else
        begin
          reg77 <= {(wire73 ?
                  (~((wire5 ? reg81 : wire7) ?
                      wire76[(4'hb):(2'h2)] : (wire6 ?
                          wire6 : wire71))) : $unsigned((-(~wire2)))),
              $signed((|wire8))};
          reg78 <= (-($signed(reg78) ?
              $unsigned((~|$unsigned(wire7))) : (!((wire6 && wire7) ~^ {wire0}))));
          reg79 <= $unsigned(($signed($unsigned((-reg80))) ?
              $signed((wire4[(2'h3):(1'h0)] ^~ wire3[(4'hb):(2'h3)])) : (~reg77[(4'hd):(3'h6)])));
        end
      reg85 <= ($unsigned($unsigned({$signed(wire71), (8'hb0)})) ?
          $unsigned(reg81) : wire0);
      if ((~&(+(^$signed((wire1 - wire75))))))
        begin
          reg86 <= $signed(({(wire76 || $unsigned(wire4))} ?
              wire9 : wire5[(4'hc):(2'h3)]));
          reg87 <= ((reg86[(2'h2):(2'h2)] ?
              ({(wire8 ? wire4 : wire0)} ?
                  wire4[(1'h0):(1'h0)] : $signed((~|reg83))) : (8'hbc)) << $signed(wire75[(4'ha):(3'h7)]));
        end
      else
        begin
          reg86 <= (8'hb1);
          reg87 <= (~^((~&$unsigned((~&wire73))) ? (&reg82) : (8'ha3)));
          if ((wire7 ? $unsigned(wire73) : ((8'hb0) >>> reg83[(1'h1):(1'h1)])))
            begin
              reg88 <= ({wire6,
                      ({wire9[(1'h0):(1'h0)]} ?
                          wire71[(3'h6):(2'h2)] : $signed((&reg87)))} ?
                  (({((8'hb0) < reg82)} ?
                      (wire75 != ((8'ha9) >= wire7)) : (|wire9[(3'h7):(1'h1)])) * (wire3 ?
                      $unsigned(wire8[(3'h7):(3'h7)]) : $unsigned({wire75}))) : reg77[(1'h1):(1'h1)]);
              reg89 <= $signed($unsigned(reg78[(1'h1):(1'h1)]));
              reg90 <= (^$signed(reg83));
              reg91 <= $unsigned((wire3 ?
                  $signed($unsigned($signed(wire2))) : wire75));
            end
          else
            begin
              reg88 <= $signed((~$unsigned({(8'hb6), $unsigned((8'h9c))})));
              reg89 <= ({$unsigned(wire76[(5'h10):(4'hf)]),
                  reg79} + (^{wire4[(3'h7):(2'h3)]}));
            end
          reg92 <= $signed(($unsigned(reg82[(3'h4):(1'h0)]) - (((^reg86) ?
                  reg91 : $unsigned((8'ha1))) ?
              {$unsigned(wire71), $signed(reg86)} : reg83)));
        end
      reg93 <= {reg86[(2'h2):(1'h1)]};
      if (wire6)
        begin
          reg94 <= $unsigned(reg93);
        end
      else
        begin
          reg94 <= $signed(($unsigned(((wire3 ~^ wire1) << (^~reg87))) == (($signed((8'hba)) - (^wire71)) > reg92)));
          if (reg89)
            begin
              reg95 <= ((((&(~wire9)) >> ((wire75 ? wire0 : reg94) ?
                      reg91 : $unsigned((8'haa)))) ?
                  ($unsigned((8'h9e)) ?
                      $unsigned(reg79[(4'h8):(1'h1)]) : $signed({wire4,
                          reg87})) : $unsigned((&(^~(8'ha4))))) == reg81[(4'h9):(2'h3)]);
              reg96 <= $signed(($signed($unsigned(((8'hb0) + reg85))) * ((~&reg80[(4'ha):(4'ha)]) ?
                  {wire74[(4'h8):(1'h0)],
                      (reg93 ? (8'haa) : reg94)} : $signed((~|reg94)))));
              reg97 <= reg81[(4'hc):(1'h0)];
              reg98 <= ($unsigned(wire75[(1'h1):(1'h1)]) ?
                  $unsigned($signed(reg79)) : $signed($signed((~&{wire5,
                      reg89}))));
              reg99 <= (+reg87);
            end
          else
            begin
              reg95 <= reg96[(1'h1):(1'h1)];
              reg96 <= $unsigned(reg85);
              reg97 <= ((reg86 ? reg87[(3'h7):(3'h5)] : reg89) << wire5);
              reg98 <= (^~wire1[(1'h1):(1'h1)]);
              reg99 <= ($signed($signed($signed($signed(wire2)))) ?
                  reg84 : wire2);
            end
          reg100 <= $unsigned({(-$signed(((8'hb4) <= reg84))),
              wire5[(1'h0):(1'h0)]});
          reg101 <= (&(^~$unsigned({wire76, ((8'ha9) * reg80)})));
        end
    end
  always
    @(posedge clk) begin
      reg102 <= ($unsigned($unsigned((|(reg82 ^ reg78)))) ?
          (($signed($unsigned((8'ha8))) ?
              (!$signed(reg87)) : reg95) >= wire76) : wire0);
      reg103 <= (-(wire73 - (wire0[(2'h2):(1'h0)] && ($unsigned(reg85) * $unsigned(reg94)))));
    end
  assign wire104 = $unsigned((-$signed(reg83)));
  assign wire105 = $unsigned($unsigned($signed($unsigned(((8'hac) ?
                       wire6 : reg82)))));
  assign wire106 = (|reg84);
  assign wire107 = (+((((~&(8'hb0)) & $unsigned(wire4)) ?
                       $unsigned($signed(reg81)) : ({wire3} ?
                           (reg102 >= reg95) : (8'hb0))) <<< wire5));
  assign wire108 = ((-({wire8, $signed(reg85)} ? wire73 : $unsigned(reg84))) ?
                       $unsigned(($unsigned((^~(8'hac))) || {(wire1 == (8'haf)),
                           (^(8'h9c))})) : $signed(reg99));
  assign wire109 = $unsigned($unsigned({((+wire9) || wire8)}));
  always
    @(posedge clk) begin
      if (($signed(reg99[(2'h3):(2'h2)]) ?
          $unsigned({wire1[(3'h4):(2'h2)]}) : (!({(wire1 | reg88)} ?
              $unsigned(((8'ha9) ? reg85 : wire74)) : ($signed(reg85) ?
                  $signed(reg100) : reg83)))))
        begin
          if ((&reg81[(1'h1):(1'h0)]))
            begin
              reg110 <= {wire2};
            end
          else
            begin
              reg110 <= ((reg92 ?
                      (wire71 | reg95[(2'h3):(2'h2)]) : reg101[(1'h0):(1'h0)]) ?
                  reg94 : (~&($unsigned(wire74) && $unsigned((wire2 ?
                      reg96 : reg102)))));
              reg111 <= (reg97 != (&$signed((^(wire7 ? wire5 : wire5)))));
            end
          reg112 <= (-$unsigned($signed($unsigned($unsigned(wire1)))));
        end
      else
        begin
          reg110 <= $unsigned({$signed(((reg101 ? wire0 : reg81) < reg102)),
              wire4});
          if (wire6)
            begin
              reg111 <= $unsigned($signed(wire8));
              reg112 <= ($unsigned($unsigned(($unsigned(reg80) ?
                  (^reg103) : reg81[(1'h0):(1'h0)]))) == {reg87,
                  $unsigned(wire5[(2'h2):(1'h1)])});
              reg113 <= ({$signed((+(8'hab)))} - $unsigned((^($unsigned((8'haf)) ?
                  (8'hb0) : $signed(reg111)))));
              reg114 <= reg113[(4'hb):(4'ha)];
            end
          else
            begin
              reg111 <= (wire74 << (+((!reg87) >>> (^~$unsigned(reg113)))));
              reg112 <= (8'hae);
              reg113 <= {reg81[(1'h1):(1'h1)]};
              reg114 <= $signed(wire8);
            end
          if ($unsigned($signed($signed((((8'ha4) && reg81) ?
              reg83[(1'h1):(1'h0)] : (reg101 >> (8'h9c)))))))
            begin
              reg115 <= reg92[(4'h9):(3'h4)];
              reg116 <= ({((~|$signed(reg111)) && wire105[(2'h2):(2'h2)])} ?
                  (~^wire76) : {wire5});
              reg117 <= {$unsigned(reg96)};
            end
          else
            begin
              reg115 <= reg97;
              reg116 <= reg102;
              reg117 <= ($unsigned((!(~^reg117[(3'h4):(1'h1)]))) ?
                  reg93 : $unsigned(((~wire105[(2'h2):(1'h1)]) ?
                      (~&(reg89 ? reg94 : reg89)) : (~|(reg93 >>> (8'hbf))))));
            end
          if ((~&((((|wire5) || reg79[(1'h0):(1'h0)]) ?
              {(reg117 ? reg100 : (7'h44)), (^(8'ha6))} : $unsigned((reg90 ?
                  wire5 : wire105))) >>> $unsigned((~^$unsigned((7'h42)))))))
            begin
              reg118 <= $signed((reg91 | wire9));
              reg119 <= (reg89[(4'ha):(4'h8)] ?
                  $unsigned(reg83[(3'h4):(1'h1)]) : reg114);
              reg120 <= (^{($signed({wire2}) - reg112),
                  ($signed($signed((7'h40))) & reg82[(1'h0):(1'h0)])});
              reg121 <= $signed({$signed($unsigned(wire104[(2'h3):(2'h3)])),
                  $signed((8'ha0))});
              reg122 <= (~&$unsigned(reg80[(3'h5):(1'h1)]));
            end
          else
            begin
              reg118 <= ((~&(&$signed({reg113, reg99}))) ? reg85 : {reg84});
              reg119 <= $signed((wire9[(3'h5):(2'h3)] ^ (^~$unsigned($unsigned((8'hb4))))));
              reg120 <= $signed($unsigned((((~reg118) ?
                      {reg101, wire8} : $unsigned(wire107)) ?
                  reg117 : {(|reg94), (reg85 * reg114)})));
            end
          reg123 <= wire9;
        end
      reg124 <= $unsigned($signed(($signed($unsigned(reg119)) ?
          (~|(!(8'ha4))) : reg116)));
    end
  assign wire125 = (|((^(~|$unsigned(wire6))) ?
                       $signed({wire73, wire0}) : ((reg84 ?
                               (reg85 ^ reg82) : (reg116 ? wire9 : reg114)) ?
                           wire0 : wire3)));
endmodule

module module10
#(parameter param70 = (((~(^{(8'ha9), (8'hb2)})) & (({(8'hbc)} ? ((8'hb4) ? (8'ha6) : (8'ha1)) : (~^(8'hae))) ? (((8'hbd) != (8'ha9)) ? ((8'ha1) ? (8'h9d) : (8'hb6)) : ((8'h9f) * (8'ha8))) : (((8'had) != (8'ha2)) - ((8'hae) ? (8'ha9) : (8'ha1))))) ? (^~((((8'ha6) ? (7'h43) : (7'h41)) ? ((8'ha8) ? (8'ha3) : (7'h43)) : {(8'hbe)}) <<< ((!(8'ha5)) + ((8'hb0) <<< (8'hbc))))) : (((((7'h40) || (8'h9d)) & (~&(8'ha7))) < {((8'hbe) ? (8'hbe) : (8'h9f))}) + (^(((7'h42) || (8'h9f)) - ((8'haa) ? (7'h42) : (8'ha0)))))))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h16b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire15;
  input wire [(4'h9):(1'h0)] wire14;
  input wire signed [(5'h11):(1'h0)] wire13;
  input wire signed [(3'h7):(1'h0)] wire12;
  input wire [(5'h11):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire69;
  wire [(3'h4):(1'h0)] wire68;
  wire [(4'ha):(1'h0)] wire67;
  wire signed [(4'hc):(1'h0)] wire66;
  wire signed [(5'h12):(1'h0)] wire65;
  wire signed [(2'h3):(1'h0)] wire64;
  wire [(3'h7):(1'h0)] wire63;
  wire signed [(4'hf):(1'h0)] wire62;
  wire signed [(4'hb):(1'h0)] wire61;
  wire [(4'hf):(1'h0)] wire60;
  wire signed [(4'hb):(1'h0)] wire59;
  wire [(5'h14):(1'h0)] wire58;
  wire signed [(3'h7):(1'h0)] wire53;
  wire [(3'h7):(1'h0)] wire49;
  wire [(3'h4):(1'h0)] wire48;
  wire signed [(4'h9):(1'h0)] wire47;
  wire [(4'hd):(1'h0)] wire45;
  wire [(5'h12):(1'h0)] wire21;
  reg [(4'h8):(1'h0)] reg57 = (1'h0);
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg55 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg54 = (1'h0);
  reg [(5'h15):(1'h0)] reg52 = (1'h0);
  reg [(5'h13):(1'h0)] reg51 = (1'h0);
  reg [(5'h12):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire53,
                 wire49,
                 wire48,
                 wire47,
                 wire45,
                 wire21,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg52,
                 reg51,
                 reg50,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg16 <= $unsigned((&{$signed((!(8'hbd))),
          ($unsigned((8'hb0)) <= {wire15})}));
      reg17 <= (!$unsigned((~&(~^$signed(wire12)))));
      reg18 <= $signed({$unsigned({reg16[(3'h4):(1'h1)]}),
          ({wire15[(2'h2):(2'h2)]} ~^ $unsigned(wire13[(3'h5):(3'h4)]))});
      reg19 <= wire13;
      reg20 <= ((~&(wire11[(5'h10):(3'h7)] >= ($unsigned(wire12) ^ (wire15 ?
          wire12 : reg16)))) << $unsigned({(reg18 ?
              (wire14 ? (8'hae) : reg17) : (~reg17)),
          (8'hba)}));
    end
  assign wire21 = (8'hb2);
  module22 #() modinst46 (wire45, clk, reg17, reg20, wire21, reg19, wire13);
  assign wire47 = reg17;
  assign wire48 = wire14[(4'h9):(2'h2)];
  assign wire49 = wire14[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg50 <= {$unsigned(wire13[(3'h7):(3'h4)]), (8'hb5)};
      reg51 <= reg19[(3'h6):(3'h5)];
      reg52 <= {(reg18[(2'h3):(2'h2)] < {$unsigned({wire47, wire13}),
              (~^wire12[(2'h2):(2'h2)])}),
          $unsigned((~|$signed((wire45 ? wire21 : wire11))))};
    end
  assign wire53 = ($signed(($signed((~wire47)) & wire45)) == ($signed($signed($signed(reg17))) | ($signed(wire13) ?
                      (^~$signed(wire45)) : $unsigned((^~wire21)))));
  always
    @(posedge clk) begin
      if ((wire11 >= ($signed((8'ha4)) <= wire15[(2'h2):(2'h2)])))
        begin
          if (wire15)
            begin
              reg54 <= ($signed($unsigned((((8'hba) != reg20) >= $signed(reg17)))) ?
                  (8'h9c) : ((((^~reg17) << $unsigned((8'hb9))) ?
                      (^wire49[(3'h7):(2'h3)]) : wire45[(2'h2):(2'h2)]) << ($unsigned(((8'hbf) && reg16)) ?
                      reg19 : ((~(8'hb2)) ? (reg16 == reg19) : {(8'hb9)}))));
              reg55 <= (($signed($unsigned((wire14 || wire48))) - $signed($unsigned((reg18 ?
                      wire13 : wire53)))) ?
                  $unsigned($unsigned((~&reg51[(5'h12):(4'hf)]))) : (wire12 ?
                      $unsigned(((+wire21) ?
                          $unsigned(reg18) : (&reg54))) : $unsigned(reg20)));
            end
          else
            begin
              reg54 <= {(-$unsigned((~|((7'h42) < reg19)))), $signed(wire13)};
            end
        end
      else
        begin
          reg54 <= wire12[(3'h6):(1'h0)];
          reg55 <= wire53;
          reg56 <= ((|(-({reg54} ? (~&reg20) : $signed(reg51)))) ?
              $unsigned(($signed(reg19[(4'ha):(4'ha)]) ^~ reg16[(2'h3):(2'h3)])) : (reg16[(2'h2):(1'h0)] ?
                  $unsigned(((!(8'hb6)) ?
                      (wire15 ?
                          wire45 : reg16) : wire14)) : reg51[(1'h1):(1'h0)]));
          reg57 <= (reg55 & ($signed($unsigned((wire45 < wire13))) ?
              {$signed($unsigned(reg50))} : reg50));
        end
    end
  assign wire58 = ((((((8'hbd) == reg50) ? reg51 : wire49) ?
                      {(~&wire49)} : (reg18 ?
                          $signed(reg16) : $signed(reg55))) < $unsigned($signed(reg51))) >= {reg16[(2'h2):(2'h2)]});
  assign wire59 = ({($unsigned($signed((8'hb4))) ?
                          wire14 : (!reg56[(3'h4):(2'h2)]))} && (({$signed(reg16)} ?
                          reg19[(4'ha):(4'h9)] : wire11) ?
                      ($unsigned(reg51) ?
                          reg50[(1'h0):(1'h0)] : $signed(wire48)) : reg20));
  assign wire60 = {(((|(^~(8'hae))) & $unsigned((~&reg50))) ?
                          reg16 : (!reg50))};
  assign wire61 = (^~(reg19 ?
                      ((8'hb8) ?
                          ((reg50 << (8'hb1)) ?
                              $signed(wire47) : (reg19 ?
                                  reg16 : wire48)) : $unsigned((^~wire60))) : wire11[(2'h2):(1'h0)]));
  assign wire62 = $signed((^~($signed(((8'hbc) ?
                      wire49 : wire21)) > {(~^(7'h43)), $unsigned(reg54)})));
  assign wire63 = wire45[(4'h9):(2'h3)];
  assign wire64 = (|wire59);
  assign wire65 = (($unsigned(wire53) ?
                      (8'hac) : (($unsigned(wire59) ?
                              reg16[(1'h1):(1'h1)] : (-reg52)) ?
                          wire59[(2'h2):(1'h0)] : ((wire13 ~^ wire45) ~^ (8'ha2)))) <= $signed((~$unsigned({(8'h9c),
                      wire12}))));
  assign wire66 = ((8'ha9) ?
                      wire61[(3'h4):(1'h0)] : {(~|reg17[(5'h12):(4'h8)])});
  assign wire67 = wire61[(1'h0):(1'h0)];
  assign wire68 = (^~$signed({(^{wire60}),
                      ($unsigned(reg52) < (wire63 ? (8'ha4) : (8'hb0)))}));
  assign wire69 = reg17[(2'h2):(2'h2)];
endmodule

module module22
#(parameter param44 = {(((((8'hab) ? (8'hb6) : (8'ha7)) ? {(7'h44), (8'hb9)} : ((8'hbe) ? (8'h9d) : (8'ha4))) ? (((7'h41) ^~ (8'hbd)) & (^~(7'h43))) : (&((8'ha5) ? (8'h9f) : (7'h43)))) ? {(((8'ha3) == (7'h42)) >>> ((8'hb8) - (8'hb9))), (^~((8'hac) + (8'hbf)))} : (&(!((8'ha5) ? (8'hb1) : (8'hb4))))), (8'hb9)})
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'hab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire27;
  input wire [(5'h12):(1'h0)] wire26;
  input wire [(4'h9):(1'h0)] wire25;
  input wire signed [(4'hf):(1'h0)] wire24;
  input wire signed [(5'h11):(1'h0)] wire23;
  wire signed [(4'h9):(1'h0)] wire43;
  wire signed [(2'h3):(1'h0)] wire42;
  wire [(5'h14):(1'h0)] wire41;
  wire [(4'he):(1'h0)] wire40;
  wire signed [(4'h9):(1'h0)] wire39;
  wire signed [(4'h9):(1'h0)] wire38;
  wire [(3'h4):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire34;
  wire signed [(4'he):(1'h0)] wire33;
  wire signed [(3'h4):(1'h0)] wire32;
  wire [(4'h9):(1'h0)] wire31;
  reg [(5'h12):(1'h0)] reg36 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 reg36,
                 reg35,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg28 <= $unsigned(wire25);
      reg29 <= wire24;
      reg30 <= $signed(reg28[(2'h2):(1'h0)]);
    end
  assign wire31 = $signed($signed(({(wire23 ~^ wire25)} ? reg28 : wire27)));
  assign wire32 = ((wire25 <= (wire31 ? (+{wire26}) : wire27)) ^ reg28);
  assign wire33 = wire32;
  assign wire34 = wire25;
  always
    @(posedge clk) begin
      reg35 <= (((wire32[(2'h2):(2'h2)] ~^ {{wire33},
          (^(7'h43))}) | reg28[(1'h1):(1'h0)]) & {$signed((~(8'hae))),
          (~(^wire32))});
      if ($unsigned(($signed($unsigned((reg28 >= wire25))) ?
          {((wire25 + wire27) ?
                  {wire27, wire33} : (^~wire34))} : {((reg30 + wire24) ?
                  (reg28 ? wire26 : (8'ha1)) : wire26[(3'h4):(2'h2)])})))
        begin
          reg36 <= wire31;
        end
      else
        begin
          reg36 <= (~^wire34[(1'h0):(1'h0)]);
        end
    end
  assign wire37 = $signed($unsigned((wire24 ?
                      wire26[(1'h0):(1'h0)] : $unsigned((wire27 ?
                          wire34 : wire27)))));
  assign wire38 = $signed((wire26 == wire26));
  assign wire39 = $unsigned($unsigned({wire23}));
  assign wire40 = $signed((wire37 ?
                      (^~{$signed((8'h9f))}) : (~^wire23[(3'h7):(3'h6)])));
  assign wire41 = $signed($signed(wire40[(4'ha):(4'ha)]));
  assign wire42 = reg28[(1'h0):(1'h0)];
  assign wire43 = ($signed(($unsigned($unsigned(wire32)) | $signed((~&(8'hbc))))) ?
                      reg29 : (8'hb8));
endmodule
