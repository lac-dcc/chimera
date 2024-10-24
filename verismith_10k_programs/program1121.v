module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h28a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(3'h7):(1'h0)] wire136;
  wire signed [(5'h12):(1'h0)] wire124;
  wire [(5'h15):(1'h0)] wire119;
  wire [(2'h3):(1'h0)] wire118;
  wire signed [(4'h9):(1'h0)] wire117;
  wire signed [(4'hc):(1'h0)] wire113;
  wire signed [(3'h4):(1'h0)] wire107;
  wire [(5'h13):(1'h0)] wire106;
  wire [(4'hd):(1'h0)] wire105;
  wire [(4'h8):(1'h0)] wire104;
  wire [(5'h11):(1'h0)] wire76;
  wire [(4'hb):(1'h0)] wire75;
  wire [(5'h14):(1'h0)] wire74;
  wire [(4'hd):(1'h0)] wire73;
  wire [(4'ha):(1'h0)] wire72;
  wire signed [(4'hd):(1'h0)] wire70;
  reg signed [(5'h13):(1'h0)] reg77 = (1'h0);
  reg [(4'hb):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg80 = (1'h0);
  reg [(4'h9):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg82 = (1'h0);
  reg [(4'he):(1'h0)] reg83 = (1'h0);
  reg [(2'h3):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg85 = (1'h0);
  reg [(3'h4):(1'h0)] reg86 = (1'h0);
  reg [(4'he):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg88 = (1'h0);
  reg [(4'he):(1'h0)] reg89 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg92 = (1'h0);
  reg [(3'h6):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg94 = (1'h0);
  reg [(5'h12):(1'h0)] reg95 = (1'h0);
  reg [(4'he):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg97 = (1'h0);
  reg [(4'hc):(1'h0)] reg98 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg99 = (1'h0);
  reg [(3'h5):(1'h0)] reg100 = (1'h0);
  reg [(5'h12):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg103 = (1'h0);
  reg [(5'h13):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg109 = (1'h0);
  reg [(4'he):(1'h0)] reg110 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg115 = (1'h0);
  reg [(4'h8):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg120 = (1'h0);
  reg signed [(4'he):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg122 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg123 = (1'h0);
  assign y = {wire136,
                 wire124,
                 wire119,
                 wire118,
                 wire117,
                 wire113,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire70,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 reg99,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 reg112,
                 reg114,
                 reg115,
                 reg116,
                 reg120,
                 reg121,
                 reg122,
                 reg123,
                 (1'h0)};
  module5 #() modinst71 (wire70, clk, wire1, wire0, wire3, wire2, wire4);
  assign wire72 = ($signed({wire1}) ?
                      (^$unsigned((^$unsigned(wire4)))) : (~^(+wire4[(1'h1):(1'h1)])));
  assign wire73 = $unsigned($signed($unsigned(((|wire4) ?
                      {wire1} : (&wire70)))));
  assign wire74 = wire73[(4'hd):(2'h2)];
  assign wire75 = (wire0[(4'h9):(1'h1)] >= wire0[(4'h9):(1'h0)]);
  assign wire76 = ((!$signed({$signed(wire3), $signed(wire75)})) ?
                      ($signed(((wire1 ?
                              (8'hb3) : (8'ha3)) << $unsigned(wire0))) ?
                          {wire75,
                              $unsigned((wire0 & wire72))} : ($signed(wire4[(1'h0):(1'h0)]) | wire72[(2'h2):(1'h1)])) : wire0[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      reg77 <= wire76;
      if (wire0[(4'he):(4'hc)])
        begin
          if ((|wire74))
            begin
              reg78 <= wire2;
              reg79 <= wire76;
              reg80 <= {$unsigned(((8'ha6) ^~ $unsigned($signed(reg78))))};
              reg81 <= (^((((wire76 || wire0) <= wire70[(4'h8):(3'h5)]) & ($signed(wire70) ?
                  wire70 : (8'ha0))) && $unsigned($signed(wire4[(4'he):(2'h2)]))));
            end
          else
            begin
              reg78 <= reg81;
            end
          if (((wire1 - reg79) * $signed(wire0)))
            begin
              reg82 <= (wire70 ?
                  $unsigned((8'hba)) : ($signed(reg77[(4'ha):(4'h8)]) ?
                      reg80[(2'h3):(1'h1)] : ((~^wire76[(5'h10):(4'hc)]) && $unsigned((wire4 && (8'hb8))))));
              reg83 <= (~(($unsigned($signed(wire72)) ?
                      $signed(wire74) : wire1) ?
                  wire70 : $unsigned($unsigned($signed(reg77)))));
              reg84 <= (wire0[(5'h12):(1'h1)] ?
                  {wire72[(1'h1):(1'h1)],
                      $signed((reg79[(3'h5):(1'h0)] > (wire75 ?
                          wire3 : reg80)))} : reg78);
              reg85 <= wire75[(4'hb):(3'h7)];
              reg86 <= wire4;
            end
          else
            begin
              reg82 <= wire76;
              reg83 <= $signed(reg84);
            end
          if ($unsigned(reg83))
            begin
              reg87 <= (8'ha9);
            end
          else
            begin
              reg87 <= reg82[(4'h8):(4'h8)];
              reg88 <= wire3;
              reg89 <= $unsigned($unsigned($signed(wire3[(1'h1):(1'h1)])));
              reg90 <= (^(!reg86[(3'h4):(2'h3)]));
            end
          reg91 <= $signed($signed((+reg88[(4'hd):(2'h3)])));
          reg92 <= (wire70[(3'h4):(1'h0)] ?
              (|{(wire74 ? reg79 : ((8'hbb) ? wire4 : reg86)),
                  $unsigned($signed(reg88))}) : wire4[(5'h14):(4'hf)]);
        end
      else
        begin
          reg78 <= reg92[(4'hb):(3'h5)];
          if (reg77[(4'hf):(3'h6)])
            begin
              reg79 <= {(&(8'ha3))};
              reg80 <= (($signed(wire75) <= wire1) ?
                  (7'h44) : $signed((|(&(wire76 >> (7'h40))))));
              reg81 <= $unsigned(wire74[(5'h12):(3'h7)]);
              reg82 <= (~&{(8'h9c),
                  (wire75[(4'hb):(3'h7)] ?
                      $unsigned(reg81) : ((wire76 ?
                          (8'hb3) : reg82) & (reg84 && (8'ha7))))});
              reg83 <= wire2[(4'h8):(3'h5)];
            end
          else
            begin
              reg79 <= (($unsigned(($signed(reg83) ?
                      $unsigned(wire3) : (reg89 != reg81))) ~^ wire72) ?
                  wire1[(4'ha):(2'h2)] : $unsigned(((8'hb2) ?
                      (~|(&reg82)) : $unsigned(((8'ha0) >> reg78)))));
              reg80 <= {reg81,
                  ($signed(($unsigned(reg92) > ((8'hbf) ?
                      reg83 : reg82))) * (^wire75))};
            end
          reg84 <= $unsigned((~|($unsigned($signed(reg79)) || $unsigned($signed(reg92)))));
          reg85 <= $signed((reg85[(2'h3):(2'h2)] | $signed(reg90)));
          reg86 <= $unsigned((~&$signed(((7'h41) || wire70[(1'h0):(1'h0)]))));
        end
      reg93 <= reg80[(2'h2):(1'h1)];
      reg94 <= wire0[(3'h6):(2'h3)];
      if ($unsigned(reg93[(3'h5):(3'h4)]))
        begin
          reg95 <= (((((reg86 ? (8'hb2) : reg89) + {reg82}) ?
                  {reg78} : reg90[(2'h3):(1'h0)]) >= $signed(reg91[(4'h8):(3'h4)])) ?
              ((|reg84[(1'h1):(1'h1)]) ?
                  ({$unsigned(wire73)} ?
                      ((~&reg78) <<< $unsigned(wire4)) : (reg87 ?
                          (~&(8'ha0)) : reg77[(4'hf):(1'h1)])) : ($signed((reg77 ?
                          wire72 : wire73)) ?
                      (-reg84[(1'h1):(1'h1)]) : $unsigned($signed(reg78)))) : $unsigned(wire70));
          reg96 <= (wire72[(3'h7):(3'h5)] ?
              ({((8'h9e) ^~ (reg90 << wire72))} ?
                  reg82[(5'h10):(1'h0)] : reg86[(2'h3):(2'h3)]) : wire74);
          reg97 <= $signed($signed((~&$signed(reg85[(2'h3):(2'h3)]))));
          reg98 <= (8'ha3);
          if ((~|(((~$unsigned(wire1)) >= $unsigned($signed(reg92))) ?
              (wire73[(1'h1):(1'h1)] || ((reg95 ? reg86 : wire76) ?
                  (+reg98) : (|wire4))) : ({reg88,
                  $unsigned(wire3)} & (8'hb5)))))
            begin
              reg99 <= ($unsigned($signed(((reg81 ? wire74 : wire72) ?
                      $unsigned(reg87) : ((7'h42) ? reg84 : reg90)))) ?
                  reg86[(2'h3):(2'h2)] : $signed({{$signed(reg97)},
                      $unsigned((reg88 ? reg90 : reg86))}));
              reg100 <= {reg90[(2'h3):(1'h0)]};
              reg101 <= (~&$unsigned(reg99[(3'h6):(3'h4)]));
              reg102 <= $unsigned(reg92);
              reg103 <= reg86;
            end
          else
            begin
              reg99 <= (~&$unsigned((reg80 ?
                  ((reg98 ?
                      (7'h41) : wire0) ^~ reg84) : (|wire1[(3'h4):(1'h0)]))));
            end
        end
      else
        begin
          reg95 <= {reg82, $unsigned($signed(reg86))};
        end
    end
  assign wire104 = ((^~$unsigned(((reg102 != reg97) ?
                       (~&(8'hb0)) : (reg94 <= reg96)))) > (~|(~&reg83)));
  assign wire105 = $unsigned({reg77});
  assign wire106 = wire3[(3'h4):(1'h0)];
  assign wire107 = ({(!reg85[(2'h3):(1'h1)]),
                       $unsigned((|$unsigned(wire106)))} + $unsigned($unsigned(((wire73 ?
                       (8'ha2) : wire73) || $signed(reg89)))));
  always
    @(posedge clk) begin
      reg108 <= $signed((~^$unsigned((-{reg85}))));
      reg109 <= $signed({{$signed((reg86 ? reg97 : reg96))}});
      reg110 <= (+$unsigned(reg101));
      reg111 <= (reg85[(1'h1):(1'h1)] ?
          (^~wire76[(3'h7):(1'h0)]) : ({$unsigned($unsigned(reg95)), wire2} ?
              (8'had) : (~wire70)));
      reg112 <= $signed(reg87[(4'hd):(3'h4)]);
    end
  assign wire113 = (reg95[(3'h6):(3'h5)] ?
                       reg97[(2'h2):(2'h2)] : (((^$unsigned(reg93)) ^ reg82) ?
                           (~|$unsigned((reg80 & wire3))) : ($signed(reg90[(1'h1):(1'h1)]) && wire73)));
  always
    @(posedge clk) begin
      reg114 <= $unsigned((reg92[(4'ha):(3'h6)] + $signed(({wire113} ?
          (reg91 >= reg88) : wire113))));
      reg115 <= (-(reg108[(3'h5):(3'h4)] ?
          $signed(reg111) : wire104[(1'h0):(1'h0)]));
      reg116 <= $unsigned($unsigned((^$signed((reg86 || wire113)))));
    end
  assign wire117 = $unsigned((^~reg98[(4'h9):(2'h2)]));
  assign wire118 = wire73[(4'hd):(2'h3)];
  assign wire119 = (~&((!{{reg95}, ((8'haf) ? reg101 : reg96)}) ?
                       ((~|(reg92 ? reg114 : reg97)) ?
                           (reg114[(2'h2):(2'h2)] || wire75[(4'hb):(3'h7)]) : ($unsigned(reg108) << {reg95})) : (8'hb1)));
  always
    @(posedge clk) begin
      if ((((reg86[(2'h2):(2'h2)] - reg89) * $signed((((8'hae) ?
                  reg91 : reg81) ?
              $signed(wire119) : (wire107 && reg82)))) ?
          (~|(reg93[(3'h5):(1'h0)] >> (wire113[(2'h2):(1'h0)] < (reg100 + (8'hac))))) : $unsigned((($unsigned(reg77) ?
                  reg86 : ((8'hb1) ^~ reg103)) ?
              $signed(reg85) : (wire75 + wire76[(4'hd):(2'h3)])))))
        begin
          reg120 <= wire72;
          reg121 <= $unsigned(((reg100 ^ (-(reg101 ?
              (8'ha1) : reg95))) + $unsigned(wire0)));
          reg122 <= (~($unsigned(((reg81 ~^ reg92) ?
                  (^~(8'had)) : (~&(8'hb0)))) ?
              ((((7'h43) ? reg84 : wire117) >> ((8'hba) ? reg92 : wire107)) ?
                  ((reg108 ?
                      reg98 : wire76) >> (reg97 || reg100)) : reg86) : (~^$signed($signed((8'ha2))))));
        end
      else
        begin
          reg120 <= (^~wire4[(5'h14):(3'h6)]);
          reg121 <= reg98;
        end
      reg123 <= {$signed(reg94), $signed(wire106[(4'h8):(4'h8)])};
    end
  assign wire124 = {$signed(($signed((~^(8'hb1))) ^ ($unsigned((8'hae)) ?
                           reg116[(4'h8):(1'h1)] : (reg80 * wire104))))};
  module125 #() modinst137 (.y(wire136), .wire129(wire73), .clk(clk), .wire130(wire107), .wire126(reg79), .wire128(reg83), .wire127(reg120));
endmodule

module module125  (y, clk, wire130, wire129, wire128, wire127, wire126);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire130;
  input wire [(4'h9):(1'h0)] wire129;
  input wire [(4'he):(1'h0)] wire128;
  input wire [(4'hb):(1'h0)] wire127;
  input wire [(3'h5):(1'h0)] wire126;
  wire signed [(5'h10):(1'h0)] wire135;
  wire signed [(4'ha):(1'h0)] wire134;
  wire signed [(2'h3):(1'h0)] wire133;
  wire [(3'h7):(1'h0)] wire132;
  wire [(5'h10):(1'h0)] wire131;
  assign y = {wire135, wire134, wire133, wire132, wire131, (1'h0)};
  assign wire131 = ($signed((wire128 ?
                           ({(7'h41),
                               wire127} && (wire130 >>> wire130)) : wire129)) ?
                       $unsigned(wire126[(2'h3):(1'h0)]) : {$signed((!(8'hbc))),
                           (($signed(wire129) ~^ (+wire128)) ?
                               $unsigned((wire129 ?
                                   wire127 : wire129)) : (wire126[(2'h3):(2'h3)] + wire127[(4'hb):(3'h4)]))});
  assign wire132 = {{$unsigned(wire130[(3'h4):(2'h2)]),
                           (wire131[(1'h1):(1'h0)] > wire128)},
                       $unsigned(wire126)};
  assign wire133 = (wire126[(2'h3):(1'h0)] ?
                       {wire129,
                           $signed($unsigned((wire131 ?
                               wire128 : wire129)))} : $unsigned({($signed(wire131) < {wire126}),
                           wire131[(3'h7):(2'h2)]}));
  assign wire134 = $unsigned(({$signed((^~wire131))} ?
                       (&$signed((!wire132))) : ($signed((wire129 != wire128)) ?
                           (~&(wire127 + wire131)) : wire127)));
  assign wire135 = wire134;
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h189):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire6;
  input wire signed [(5'h13):(1'h0)] wire7;
  input wire [(3'h5):(1'h0)] wire8;
  input wire [(4'hb):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire67;
  wire [(4'he):(1'h0)] wire66;
  wire signed [(5'h15):(1'h0)] wire64;
  wire [(4'ha):(1'h0)] wire63;
  wire [(3'h7):(1'h0)] wire51;
  wire signed [(5'h10):(1'h0)] wire50;
  wire signed [(3'h4):(1'h0)] wire49;
  wire [(5'h14):(1'h0)] wire47;
  wire [(3'h7):(1'h0)] wire46;
  wire signed [(4'he):(1'h0)] wire11;
  wire [(3'h5):(1'h0)] wire39;
  reg [(5'h15):(1'h0)] reg69 = (1'h0);
  reg [(5'h11):(1'h0)] reg68 = (1'h0);
  reg [(5'h11):(1'h0)] reg65 = (1'h0);
  reg [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg61 = (1'h0);
  reg [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg59 = (1'h0);
  reg [(4'h9):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg57 = (1'h0);
  reg [(5'h11):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg [(4'h8):(1'h0)] reg54 = (1'h0);
  reg [(4'hd):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg48 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(3'h6):(1'h0)] reg43 = (1'h0);
  reg [(4'hb):(1'h0)] reg42 = (1'h0);
  reg [(4'hc):(1'h0)] reg41 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire64,
                 wire63,
                 wire51,
                 wire50,
                 wire49,
                 wire47,
                 wire46,
                 wire11,
                 wire39,
                 reg69,
                 reg68,
                 reg65,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg48,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  assign wire11 = $unsigned({wire7, wire7});
  module12 #() modinst40 (wire39, clk, wire11, wire6, wire9, wire7, wire10);
  always
    @(posedge clk) begin
      reg41 <= wire39;
      reg42 <= reg41;
      reg43 <= wire39[(1'h1):(1'h1)];
      reg44 <= (+$unsigned($signed(wire39[(2'h2):(1'h0)])));
      reg45 <= ($signed({reg43}) << {$unsigned((^$unsigned(wire11))), reg44});
    end
  assign wire46 = (^(((reg43[(2'h2):(2'h2)] ?
                      (wire9 | wire6) : wire7[(4'he):(1'h0)]) ~^ reg45[(1'h1):(1'h1)]) ^ wire7[(5'h13):(1'h0)]));
  assign wire47 = ({reg45[(2'h3):(1'h0)]} <<< reg45);
  always
    @(posedge clk) begin
      reg48 <= (!{((8'hac) ? wire10 : (&(reg45 ? wire8 : (8'h9e)))),
          reg41[(3'h6):(2'h3)]});
    end
  assign wire49 = wire46;
  assign wire50 = (wire10 ?
                      $unsigned($signed(($signed(wire8) ?
                          wire46[(1'h1):(1'h1)] : reg48[(4'hd):(4'h9)]))) : $unsigned(((((8'hb6) ?
                              wire39 : (8'hbd)) ~^ wire7) ?
                          $signed($unsigned(wire9)) : ((reg44 ?
                                  wire10 : (8'haf)) ?
                              wire49[(1'h0):(1'h0)] : reg42[(3'h6):(3'h6)]))));
  assign wire51 = (+$unsigned(({reg48, (!wire11)} ?
                      $unsigned((^~reg44)) : wire8[(3'h4):(2'h3)])));
  always
    @(posedge clk) begin
      reg52 <= $unsigned({($unsigned((~reg42)) >= wire46[(3'h6):(2'h2)])});
      reg53 <= reg52[(3'h5):(2'h2)];
      reg54 <= (($unsigned(wire9) ?
          $signed({(reg43 * reg41)}) : (((reg41 ?
              reg53 : wire9) < reg45) > $unsigned($unsigned(wire8)))) & (!$unsigned((reg43[(2'h3):(2'h2)] ?
          $unsigned(wire11) : $unsigned((8'ha4))))));
      reg55 <= $unsigned(wire10);
    end
  always
    @(posedge clk) begin
      if ({{(+{$unsigned(wire47), wire7[(5'h11):(4'h9)]})},
          (~|wire47[(2'h2):(1'h1)])})
        begin
          reg56 <= (!(reg54 ?
              $signed((wire10[(5'h14):(5'h11)] <= $unsigned(reg48))) : ({$signed(wire10),
                  (reg52 | (8'ha4))} | $signed({reg53}))));
          reg57 <= reg55[(4'hc):(4'hb)];
          reg58 <= ((wire47 ? $unsigned(wire7) : $unsigned(wire46)) ?
              ($unsigned((~&(reg44 ?
                  wire7 : reg48))) > $unsigned(reg43[(1'h0):(1'h0)])) : ({$signed(reg41)} >> $signed($signed(((8'ha6) ?
                  wire10 : reg43)))));
          reg59 <= $unsigned($signed(((8'hbb) == (8'hb7))));
        end
      else
        begin
          if (reg57)
            begin
              reg56 <= $signed($unsigned(wire50[(3'h5):(3'h5)]));
              reg57 <= (~(8'had));
            end
          else
            begin
              reg56 <= ($signed(reg42[(4'h9):(1'h1)]) ?
                  (^~(~&(+$unsigned(reg44)))) : reg59);
              reg57 <= $signed(((reg55[(3'h7):(3'h4)] ?
                      (((8'hb9) ? reg41 : wire7) ?
                          (+reg52) : $unsigned(reg45)) : {$unsigned(wire46),
                          $unsigned(wire6)}) ?
                  (($signed(reg59) ?
                      (reg48 ? reg45 : wire11) : (reg43 ?
                          reg54 : (8'ha5))) ~^ ((wire10 ? (8'h9c) : (8'hb7)) ?
                      (reg53 > reg42) : reg57)) : wire11));
              reg58 <= reg54;
              reg59 <= ($unsigned((($unsigned(reg42) ?
                          (wire9 < (7'h42)) : (reg53 ? reg44 : (8'hb2))) ?
                      wire8[(3'h4):(2'h3)] : wire8)) ?
                  wire10 : reg55);
            end
        end
      reg60 <= (wire7[(4'he):(3'h4)] | $signed((~^(((8'ha5) ? reg57 : (8'haa)) ?
          reg44 : $unsigned(wire46)))));
      reg61 <= $signed(wire9);
      reg62 <= $unsigned(({(~&(reg44 || reg56))} ?
          ((~&(-(8'h9c))) == (^{wire39})) : wire10));
    end
  assign wire63 = $signed((^{(^reg53[(4'h9):(1'h1)])}));
  assign wire64 = ($signed(reg53) | {{(^~(~|reg61))}});
  always
    @(posedge clk) begin
      reg65 <= (8'hbe);
    end
  assign wire66 = (^~wire7);
  assign wire67 = {$signed({(!reg60)}),
                      ((~$unsigned($unsigned(reg57))) ^~ $unsigned((^$signed(wire11))))};
  always
    @(posedge clk) begin
      reg68 <= wire11[(3'h4):(1'h0)];
      reg69 <= {$unsigned((~^(wire63 ? reg61 : $signed(reg48)))),
          (|$signed($unsigned($unsigned((8'hb9)))))};
    end
endmodule

module module12
#(parameter param38 = (~&({(~(|(8'h9f))), ({(8'ha0), (8'ha9)} + ((8'ha3) ? (8'hb0) : (8'h9e)))} ? ((((8'ha1) ? (8'hb4) : (8'hb6)) ? {(8'haf), (8'hb1)} : ((8'hb6) ^~ (8'ha7))) ? ({(8'ha5)} ? (~(8'hbc)) : ((7'h43) <= (8'h9e))) : ((~|(8'ha1)) <<< ((8'ha5) <<< (7'h42)))) : ({(~&(8'ha6))} >>> (((8'hb9) ? (8'ha7) : (8'hbd)) && ((8'h9e) ? (8'ha0) : (8'haf)))))))
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'hda):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire17;
  input wire signed [(4'ha):(1'h0)] wire16;
  input wire [(3'h6):(1'h0)] wire15;
  input wire [(5'h13):(1'h0)] wire14;
  input wire [(3'h6):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire33;
  wire [(3'h7):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire31;
  wire signed [(5'h10):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire29;
  wire [(3'h4):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire27;
  wire signed [(3'h7):(1'h0)] wire26;
  wire [(3'h5):(1'h0)] wire25;
  wire signed [(4'he):(1'h0)] wire24;
  wire [(4'h8):(1'h0)] wire23;
  wire [(4'hd):(1'h0)] wire22;
  wire signed [(4'h8):(1'h0)] wire21;
  wire signed [(4'he):(1'h0)] wire20;
  wire [(3'h4):(1'h0)] wire19;
  wire [(3'h6):(1'h0)] wire18;
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire18 = wire14;
  assign wire19 = $signed(($unsigned((!wire18[(1'h1):(1'h1)])) ?
                      wire17 : ((((8'hb0) ? wire14 : wire15) ^~ (wire14 ?
                          wire15 : wire16)) + $signed((wire16 ?
                          wire13 : wire15)))));
  assign wire20 = ({(-(wire13 ? $unsigned(wire13) : (&wire14))),
                      $unsigned((^(8'h9e)))} == $signed(wire18[(2'h3):(2'h2)]));
  assign wire21 = wire20;
  assign wire22 = {({((wire20 ? wire21 : wire16) ? (+wire17) : wire14)} ?
                          (({wire13, wire16} <<< {wire13}) ?
                              (wire16 ?
                                  (wire18 >= wire13) : wire18[(3'h6):(3'h4)]) : wire19[(2'h3):(1'h0)]) : wire17[(2'h2):(2'h2)])};
  assign wire23 = ($signed((wire15[(2'h3):(2'h3)] ?
                          wire13[(3'h4):(2'h3)] : $signed((wire20 && wire16)))) ?
                      $unsigned($signed($signed((wire15 ?
                          wire18 : wire19)))) : wire18);
  assign wire24 = $signed(wire15[(1'h1):(1'h0)]);
  assign wire25 = (~&wire16[(4'ha):(4'h9)]);
  assign wire26 = $signed($unsigned((((~wire25) - wire14[(5'h10):(4'ha)]) == wire13[(3'h4):(2'h3)])));
  assign wire27 = $signed(({((wire26 < wire22) ?
                              (wire19 >> (7'h40)) : (wire18 ~^ wire15)),
                          wire17} ?
                      $signed((^~(wire14 <<< wire23))) : wire22[(3'h5):(2'h3)]));
  assign wire28 = {{($unsigned({(8'hb0)}) ^ $signed($unsigned(wire24)))},
                      ($unsigned((|$unsigned((8'haa)))) ?
                          {{$unsigned((8'hb8)), $unsigned(wire13)}} : wire18)};
  assign wire29 = $signed($signed($unsigned(wire28[(1'h1):(1'h0)])));
  assign wire30 = $unsigned((wire14[(4'hf):(2'h3)] ?
                      $unsigned((wire29 >> wire21[(3'h5):(3'h5)])) : {$unsigned((|wire26)),
                          (|(wire29 & wire13))}));
  assign wire31 = ($signed(wire30[(3'h5):(2'h3)]) ?
                      wire18 : wire22[(3'h6):(2'h3)]);
  assign wire32 = wire26;
  assign wire33 = (wire19 & wire16);
  assign wire34 = (wire29 ?
                      $signed((wire18[(1'h1):(1'h0)] <= wire22[(3'h5):(1'h0)])) : $unsigned($unsigned((|(wire21 ~^ wire24)))));
  assign wire35 = wire31;
  always
    @(posedge clk) begin
      reg36 <= {(wire30[(4'hf):(3'h6)] | wire16)};
      reg37 <= (+(wire31 * (($unsigned(wire15) ?
          $signed(wire27) : wire22) >>> $signed($signed(wire14)))));
    end
endmodule
