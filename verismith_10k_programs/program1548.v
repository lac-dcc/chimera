module top
#(parameter param156 = ({((-((8'hb5) ? (8'h9e) : (8'hb7))) == (~|((8'ha9) ? (8'hbe) : (8'hbc))))} && (8'hae)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h103):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire154;
  wire signed [(3'h6):(1'h0)] wire19;
  wire signed [(5'h12):(1'h0)] wire18;
  wire signed [(4'h8):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire4;
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(3'h5):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg5 = (1'h0);
  assign y = {wire154,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire4,
                 reg22,
                 reg21,
                 reg20,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = {wire2[(2'h3):(1'h1)]};
  always
    @(posedge clk) begin
      reg5 <= $signed((8'ha7));
      if ($signed(wire4))
        begin
          reg6 <= $unsigned($signed((7'h40)));
          reg7 <= $signed(($signed(wire3) ?
              (wire3[(1'h0):(1'h0)] ?
                  wire4[(4'hb):(4'h9)] : (8'h9c)) : $signed(((wire4 ?
                      (8'hbb) : wire1) ?
                  wire2[(3'h7):(2'h3)] : (+(8'ha3))))));
        end
      else
        begin
          reg6 <= $signed(($signed((!$signed(reg6))) ?
              $signed({wire0}) : $unsigned(wire2)));
          reg7 <= (wire4[(3'h4):(1'h1)] && $signed(((reg5[(4'hc):(4'h9)] ?
                  (wire2 ? reg7 : (8'hb0)) : $signed(reg6)) ?
              (~^reg5) : $signed((+wire0)))));
        end
      if (wire3[(1'h0):(1'h0)])
        begin
          if (($unsigned(reg6[(3'h5):(3'h4)]) ?
              {$unsigned($signed((wire3 >>> (7'h41)))),
                  ($signed((-wire1)) & wire3)} : {reg6[(4'h9):(3'h5)],
                  (~^wire0[(2'h3):(2'h2)])}))
            begin
              reg8 <= $signed($unsigned({wire1[(4'hb):(2'h3)]}));
              reg9 <= $unsigned(reg6);
              reg10 <= ((((((8'hac) ^~ reg6) ?
                  $unsigned(reg5) : ((8'ha9) <<< reg5)) & $unsigned((~&reg6))) ^~ reg7) <= $unsigned({({reg8} > (reg9 ?
                      reg6 : wire2)),
                  (&(reg6 | reg8))}));
              reg11 <= wire0;
            end
          else
            begin
              reg8 <= $unsigned(reg6[(2'h3):(2'h3)]);
              reg9 <= ($signed((({(8'haf)} * wire0) ?
                      wire0 : $signed($unsigned(wire3)))) ?
                  $signed((~^$unsigned((wire1 ?
                      reg11 : reg11)))) : $signed(wire1[(4'hd):(4'hc)]));
            end
        end
      else
        begin
          reg8 <= $unsigned($unsigned($signed((!wire0[(4'hd):(4'h8)]))));
        end
      if ((reg9[(4'hc):(3'h6)] ? reg9[(4'hb):(1'h1)] : $signed((~|reg8))))
        begin
          reg12 <= reg9[(4'hc):(3'h7)];
        end
      else
        begin
          reg12 <= $signed($signed(((^~$unsigned(reg5)) ?
              (~^(reg8 ? reg6 : (8'ha4))) : ((~|wire2) < $signed(reg9)))));
        end
    end
  always
    @(posedge clk) begin
      reg13 <= $unsigned(reg8[(1'h0):(1'h0)]);
      reg14 <= ((~reg12) ?
          $unsigned((reg5 ?
              $unsigned(reg11) : ($unsigned(reg12) << $unsigned(reg7)))) : $signed($signed($unsigned((!reg10)))));
      reg15 <= (~^($signed(($unsigned((8'hae)) ? {wire1} : (reg5 << (7'h43)))) ?
          wire1 : (^reg11)));
    end
  assign wire16 = $signed(((~&(~&$signed(reg8))) ?
                      wire2[(4'h8):(3'h5)] : (~((reg14 ? wire4 : reg12) ?
                          reg5 : {reg7}))));
  assign wire17 = ($unsigned($unsigned(wire16[(4'hf):(1'h0)])) ?
                      $unsigned(({(reg12 >>> wire1), (8'hb0)} | $signed((wire2 ?
                          reg15 : reg13)))) : reg11);
  assign wire18 = wire4;
  assign wire19 = (^$unsigned($unsigned(reg15[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg20 <= (^(7'h43));
      reg21 <= (((({(8'hac), wire4} | (^(8'hb3))) ?
                  {$unsigned(reg20),
                      $unsigned(wire2)} : wire18[(4'hb):(2'h2)]) ?
              (reg7 << reg7[(1'h1):(1'h1)]) : {$unsigned((wire18 ?
                      wire1 : reg7))}) ?
          ((~reg15[(3'h7):(3'h6)]) || reg10) : reg15);
      reg22 <= reg6[(4'h8):(3'h4)];
    end
  module23 #() modinst155 (.wire24(reg9), .clk(clk), .wire25(reg15), .wire26(reg7), .y(wire154), .wire27(reg12));
endmodule

module module23
#(parameter param152 = (|(~^{((8'ha8) & ((8'ha3) ? (8'hb1) : (8'ha1))), {(~|(8'ha2))}})), 
parameter param153 = (((^~param152) * param152) & (param152 & (^~((param152 <<< param152) ? (~param152) : (8'hb5))))))
(y, clk, wire24, wire25, wire26, wire27);
  output wire [(32'h60):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire24;
  input wire signed [(4'hc):(1'h0)] wire25;
  input wire [(4'h8):(1'h0)] wire26;
  input wire signed [(5'h15):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire76;
  wire [(5'h10):(1'h0)] wire78;
  wire [(5'h11):(1'h0)] wire79;
  wire signed [(5'h15):(1'h0)] wire80;
  wire signed [(4'hb):(1'h0)] wire81;
  wire signed [(4'ha):(1'h0)] wire82;
  wire [(2'h3):(1'h0)] wire149;
  reg [(2'h2):(1'h0)] reg151 = (1'h0);
  assign y = {wire76,
                 wire78,
                 wire79,
                 wire80,
                 wire81,
                 wire82,
                 wire149,
                 reg151,
                 (1'h0)};
  module28 #() modinst77 (wire76, clk, wire24, wire25, wire27, wire26, (7'h44));
  assign wire78 = ($unsigned({wire27[(4'hf):(4'he)]}) ?
                      $signed((~(~(8'haf)))) : {wire26[(4'h8):(2'h2)],
                          wire24[(4'hf):(2'h3)]});
  assign wire79 = wire24;
  assign wire80 = ((wire26 ?
                      (-wire79) : (wire25[(1'h1):(1'h1)] || ((&wire25) ^ (wire25 ?
                          wire76 : (7'h42))))) != $unsigned(wire24[(4'ha):(3'h5)]));
  assign wire81 = $unsigned(((!$unsigned(wire78)) > (&$signed((wire80 & wire78)))));
  assign wire82 = ($unsigned(($signed(wire26) ?
                      wire79 : (~&(~&(8'ha5))))) <<< (&wire25));
  module83 #() modinst150 (wire149, clk, wire25, wire81, wire80, wire24, wire78);
  always
    @(posedge clk) begin
      reg151 <= (-(&wire25[(2'h2):(2'h2)]));
    end
endmodule

module module83
#(parameter param148 = ((8'h9e) ? {(+(~&(^~(7'h42))))} : ({{(&(8'ha2)), ((8'hba) >>> (8'haf))}, ({(8'h9e), (8'hbf)} ? ((8'had) && (8'ha5)) : ((8'ha0) << (8'hbe)))} ? {{((8'haf) - (7'h40))}} : {(-(^~(8'ha9))), (^{(8'ha5)})})))
(y, clk, wire88, wire87, wire86, wire85, wire84);
  output wire [(32'h2ea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire88;
  input wire [(4'hb):(1'h0)] wire87;
  input wire signed [(5'h15):(1'h0)] wire86;
  input wire signed [(4'hd):(1'h0)] wire85;
  input wire [(5'h10):(1'h0)] wire84;
  wire signed [(5'h11):(1'h0)] wire133;
  wire [(4'he):(1'h0)] wire132;
  wire [(3'h7):(1'h0)] wire131;
  wire signed [(5'h11):(1'h0)] wire130;
  wire [(5'h11):(1'h0)] wire129;
  wire signed [(5'h10):(1'h0)] wire128;
  wire signed [(4'ha):(1'h0)] wire127;
  wire [(5'h12):(1'h0)] wire126;
  wire [(5'h11):(1'h0)] wire125;
  wire [(3'h7):(1'h0)] wire124;
  wire [(5'h11):(1'h0)] wire121;
  wire signed [(5'h13):(1'h0)] wire120;
  wire signed [(5'h12):(1'h0)] wire119;
  wire [(2'h2):(1'h0)] wire118;
  wire signed [(2'h3):(1'h0)] wire117;
  wire signed [(4'h9):(1'h0)] wire116;
  wire signed [(5'h11):(1'h0)] wire115;
  wire [(5'h11):(1'h0)] wire114;
  wire signed [(5'h13):(1'h0)] wire113;
  reg [(4'he):(1'h0)] reg147 = (1'h0);
  reg signed [(4'he):(1'h0)] reg146 = (1'h0);
  reg [(4'hd):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg144 = (1'h0);
  reg [(3'h6):(1'h0)] reg143 = (1'h0);
  reg [(3'h7):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg141 = (1'h0);
  reg [(5'h14):(1'h0)] reg140 = (1'h0);
  reg [(4'he):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg138 = (1'h0);
  reg [(4'h8):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg136 = (1'h0);
  reg [(3'h7):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg134 = (1'h0);
  reg [(4'hd):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg111 = (1'h0);
  reg [(4'hb):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg109 = (1'h0);
  reg [(5'h10):(1'h0)] reg108 = (1'h0);
  reg signed [(4'he):(1'h0)] reg107 = (1'h0);
  reg [(3'h7):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg105 = (1'h0);
  reg [(5'h11):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg102 = (1'h0);
  reg [(3'h5):(1'h0)] reg101 = (1'h0);
  reg [(5'h14):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg99 = (1'h0);
  reg [(2'h2):(1'h0)] reg98 = (1'h0);
  reg [(5'h12):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg96 = (1'h0);
  reg [(5'h15):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg94 = (1'h0);
  reg [(2'h2):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg92 = (1'h0);
  reg [(4'ha):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg89 = (1'h0);
  assign y = {wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg123,
                 reg122,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg89 <= ($signed((+(wire87[(3'h5):(2'h3)] ^~ $unsigned(wire85)))) ?
          ($unsigned($unsigned((wire85 | wire86))) ?
              ($unsigned(((8'h9f) ?
                  wire84 : (8'ha1))) >= $unsigned((~^wire87))) : (!$unsigned((wire85 ?
                  (8'hac) : wire86)))) : ((wire86 ~^ ($signed(wire84) ?
                  wire86[(4'hd):(3'h5)] : (~&wire84))) ?
              wire86 : {wire85[(1'h0):(1'h0)]}));
      if ((8'hb7))
        begin
          if ($unsigned($unsigned(reg89)))
            begin
              reg90 <= $signed({$signed({(^wire86), $unsigned(wire88)}),
                  ($unsigned({(7'h42),
                      wire84}) * (reg89 != $unsigned(reg89)))});
              reg91 <= (($unsigned($signed(reg89[(5'h10):(3'h7)])) ^ $unsigned(($signed(wire85) < (+wire84)))) ?
                  reg89[(4'h8):(3'h4)] : wire85[(1'h1):(1'h1)]);
            end
          else
            begin
              reg90 <= ((wire87 >>> {((wire88 ?
                          wire85 : (8'haf)) <= wire84[(4'h8):(1'h0)]),
                      wire85[(4'ha):(1'h1)]}) ?
                  $signed(($unsigned((~&wire84)) ?
                      (|(reg91 >= reg90)) : {((8'ha5) ?
                              wire86 : wire84)})) : $signed(wire85[(4'h9):(1'h1)]));
              reg91 <= wire87[(4'hb):(3'h5)];
              reg92 <= {($unsigned(wire85[(3'h7):(1'h1)]) << wire88),
                  ($unsigned(($signed(wire85) == (wire86 ? wire87 : wire84))) ?
                      reg90 : $unsigned($signed((reg90 ? (8'ha1) : wire87))))};
              reg93 <= (^~(wire86[(3'h7):(3'h6)] * $signed(wire86[(3'h7):(3'h6)])));
            end
          if (wire88)
            begin
              reg94 <= $unsigned({wire87, (~&reg92[(1'h0):(1'h0)])});
              reg95 <= ((&$unsigned(reg93[(1'h0):(1'h0)])) ?
                  {wire86,
                      $unsigned($signed(reg93))} : ((reg90 > {$signed(reg93),
                      $signed(reg91)}) >>> $unsigned((7'h41))));
              reg96 <= $unsigned(((reg92[(1'h1):(1'h0)] <= $unsigned(((8'ha7) ?
                      (8'hb3) : wire86))) ?
                  $signed((^~reg89[(2'h2):(2'h2)])) : $unsigned(reg94[(2'h2):(2'h2)])));
              reg97 <= wire86[(4'h8):(1'h0)];
              reg98 <= $signed((reg90[(5'h13):(5'h10)] ?
                  wire87 : (wire85 ?
                      $unsigned(reg95[(4'he):(3'h6)]) : (-(wire84 && reg91)))));
            end
          else
            begin
              reg94 <= ((~^(($unsigned(wire85) ? (8'hb7) : reg98) ?
                      reg92 : $unsigned((^~reg89)))) ?
                  ($unsigned({$unsigned(wire87)}) ?
                      (8'hba) : (($signed(reg91) ?
                          (reg91 ~^ (8'h9f)) : $signed(reg98)) ^~ reg90)) : reg95[(1'h0):(1'h0)]);
              reg95 <= $unsigned((~^wire85));
            end
          if ($signed(reg91[(4'h8):(3'h4)]))
            begin
              reg99 <= $signed(reg94[(1'h0):(1'h0)]);
              reg100 <= ($signed(reg91[(4'ha):(3'h4)]) ?
                  {(~(|((8'hb5) <<< reg92))),
                      (($unsigned(wire84) ? {(8'hbe)} : (reg95 + (8'haf))) ?
                          reg89 : ({reg98, wire85} || (wire84 ?
                              (8'hbb) : (8'hbd))))} : reg99[(2'h3):(1'h0)]);
              reg101 <= (~&((reg89 <= $signed((~^reg100))) >>> reg99));
              reg102 <= reg89;
              reg103 <= (7'h40);
            end
          else
            begin
              reg99 <= $unsigned((!{reg100, (8'hb2)}));
            end
          reg104 <= (~&$unsigned((~^(reg101 << (wire88 << (8'ha7))))));
          reg105 <= (^~($signed($signed($unsigned(reg89))) | ((8'hae) ?
              {(reg91 <= reg100)} : reg101[(3'h4):(1'h1)])));
        end
      else
        begin
          if (reg91[(3'h7):(3'h4)])
            begin
              reg90 <= $unsigned(($signed((^reg104)) < $unsigned((|$signed(wire85)))));
              reg91 <= $unsigned((^reg99));
              reg92 <= ((($unsigned((^~reg102)) ?
                      ($unsigned((8'ha2)) ?
                          (reg94 ? wire88 : reg97) : (reg90 ?
                              (8'hb6) : reg103)) : $unsigned((reg99 ?
                          (8'ha0) : wire85))) ?
                  reg94 : ((8'hbf) | $signed(reg90[(4'hf):(3'h4)]))) != $unsigned($signed(reg92)));
            end
          else
            begin
              reg90 <= {$unsigned((^(|reg91))), reg92};
            end
        end
      if ($signed(($unsigned(reg91) ?
          wire85[(4'hb):(3'h4)] : ((reg92[(1'h1):(1'h1)] ?
                  (reg100 >> reg104) : $signed(reg98)) ?
              $signed($unsigned(reg99)) : $signed(reg91)))))
        begin
          reg106 <= reg95;
          reg107 <= wire84;
          reg108 <= (7'h44);
          reg109 <= (~reg101);
          reg110 <= $unsigned($signed(reg95));
        end
      else
        begin
          reg106 <= (reg110[(1'h1):(1'h0)] << $signed($unsigned($signed((reg97 ?
              reg100 : wire86)))));
        end
      reg111 <= {reg106[(3'h7):(1'h0)]};
      reg112 <= wire84;
    end
  assign wire113 = wire84;
  assign wire114 = {$signed($signed((~&$unsigned(wire85))))};
  assign wire115 = (~^(~&{$unsigned($unsigned(reg93)), wire87[(3'h6):(3'h5)]}));
  assign wire116 = reg106[(3'h7):(1'h0)];
  assign wire117 = (8'ha7);
  assign wire118 = $signed($unsigned($signed((reg101 ?
                       (wire87 | reg108) : (8'hba)))));
  assign wire119 = $unsigned((~^$unsigned($signed((+reg112)))));
  assign wire120 = reg104[(1'h0):(1'h0)];
  assign wire121 = reg111[(3'h5):(1'h0)];
  always
    @(posedge clk) begin
      reg122 <= $signed($unsigned($unsigned((8'hab))));
      reg123 <= reg94;
    end
  assign wire124 = (8'hb5);
  assign wire125 = (wire88 ?
                       $unsigned((~^reg110[(3'h5):(2'h2)])) : {$unsigned($signed(((8'ha9) || (8'hac)))),
                           ($unsigned($signed(reg122)) ^ $signed(wire115[(3'h5):(2'h3)]))});
  assign wire126 = $unsigned(((^reg96[(2'h2):(1'h0)]) && $unsigned((&(reg90 >= wire88)))));
  assign wire127 = ({(~|$signed(wire116[(3'h6):(1'h0)])),
                           wire124[(1'h0):(1'h0)]} ?
                       reg96 : wire87);
  assign wire128 = $unsigned($unsigned($signed(reg111)));
  assign wire129 = ((reg98[(1'h1):(1'h0)] | $signed((wire118 >> (reg103 | reg110)))) > $signed($signed(reg104[(4'hc):(2'h2)])));
  assign wire130 = (-{(8'haa)});
  assign wire131 = {(&(^~{(wire85 + reg96)})), reg122};
  assign wire132 = $signed((^~(!wire114[(1'h0):(1'h0)])));
  assign wire133 = $unsigned((wire117 >> $signed(reg122[(5'h13):(3'h5)])));
  always
    @(posedge clk) begin
      reg134 <= $signed($unsigned((((&reg109) ?
          wire128[(4'hb):(2'h3)] : (-reg96)) & (((8'hb0) >>> wire126) << (wire116 < wire85)))));
      reg135 <= ((8'hb2) ^ (wire115[(4'hb):(4'h9)] - {($signed((8'haf)) ?
              (7'h42) : $unsigned((8'hb7))),
          {wire115[(4'hb):(3'h5)]}}));
      reg136 <= (^~$unsigned($signed($signed($unsigned(wire130)))));
      reg137 <= $unsigned($signed(((~&reg109[(1'h0):(1'h0)]) ?
          $signed(reg101) : $signed($unsigned(wire119)))));
      reg138 <= $unsigned((~^wire85[(4'h9):(2'h2)]));
    end
  always
    @(posedge clk) begin
      reg139 <= (reg101 ?
          ($unsigned((+(~reg112))) ?
              wire88[(2'h2):(1'h0)] : reg96[(2'h2):(2'h2)]) : $unsigned(reg109));
      if ((|($signed(($signed(wire133) ?
          ((8'hb8) + (8'hb4)) : wire129)) - (8'hb4))))
        begin
          reg140 <= wire117;
        end
      else
        begin
          if ((&$signed((7'h41))))
            begin
              reg140 <= wire127[(1'h1):(1'h0)];
              reg141 <= (((((reg96 || wire88) ? wire119 : $unsigned(reg112)) ?
                          (~|(wire121 ? reg103 : wire116)) : $signed((reg110 ?
                              reg107 : wire114))) ?
                      (~^{$signed(reg110)}) : wire113) ?
                  (~^($signed((~|reg140)) ?
                      $signed($signed(reg101)) : ((reg100 ?
                          wire85 : wire133) == $signed(reg104)))) : {wire114[(2'h3):(2'h3)]});
              reg142 <= $unsigned((($signed(((8'hb9) ? (8'hbd) : (8'hb9))) ?
                      (wire85 ?
                          (wire125 ?
                              (8'ha9) : reg112) : reg112) : wire118[(1'h1):(1'h0)]) ?
                  $unsigned((&(~&reg93))) : wire88[(3'h5):(1'h1)]));
            end
          else
            begin
              reg140 <= $unsigned(((~&wire88) || reg108[(4'hc):(3'h7)]));
              reg141 <= reg95;
              reg142 <= (wire116[(3'h5):(1'h1)] << (~&($signed((~&wire121)) == $unsigned($signed(reg99)))));
              reg143 <= {(reg98[(1'h1):(1'h1)] << $unsigned(reg139)),
                  ((reg91[(1'h1):(1'h1)] ?
                          ({reg91, wire130} ?
                              (reg123 >= wire87) : $signed(reg103)) : (^~reg139)) ?
                      (~&$unsigned({(8'hb5)})) : reg102[(3'h6):(3'h4)])};
            end
          reg144 <= ((8'ha0) == ((|($unsigned(reg95) ?
              wire85[(3'h6):(2'h2)] : $signed(reg141))) <<< ({((8'hbd) ^~ reg135)} ?
              $signed($unsigned((8'hbc))) : (~|(-reg98)))));
          reg145 <= {(wire132[(1'h0):(1'h0)] & reg111[(1'h1):(1'h1)]), reg138};
        end
      reg146 <= (&(&(($unsigned(reg102) < (wire121 - reg100)) | $signed(reg109[(4'h8):(3'h5)]))));
      reg147 <= wire87[(2'h3):(1'h1)];
    end
endmodule

module module28
#(parameter param74 = (~|{(~(|(!(8'h9d))))}), 
parameter param75 = (param74 ? {(-param74), (~^param74)} : (!(^param74))))
(y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'h1d2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire33;
  input wire signed [(4'h8):(1'h0)] wire32;
  input wire [(5'h15):(1'h0)] wire31;
  input wire signed [(3'h6):(1'h0)] wire30;
  input wire [(5'h12):(1'h0)] wire29;
  wire [(5'h14):(1'h0)] wire73;
  wire [(4'h8):(1'h0)] wire72;
  wire signed [(5'h15):(1'h0)] wire62;
  wire [(2'h2):(1'h0)] wire56;
  wire [(3'h4):(1'h0)] wire55;
  wire [(5'h15):(1'h0)] wire41;
  wire signed [(5'h14):(1'h0)] wire39;
  wire signed [(4'hf):(1'h0)] wire38;
  wire signed [(2'h2):(1'h0)] wire37;
  wire signed [(4'hd):(1'h0)] wire36;
  wire [(2'h3):(1'h0)] wire35;
  wire signed [(4'h9):(1'h0)] wire34;
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(3'h5):(1'h0)] reg70 = (1'h0);
  reg [(4'ha):(1'h0)] reg69 = (1'h0);
  reg [(4'hf):(1'h0)] reg68 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg [(5'h15):(1'h0)] reg66 = (1'h0);
  reg [(4'h9):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg64 = (1'h0);
  reg [(5'h11):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg61 = (1'h0);
  reg [(4'h8):(1'h0)] reg60 = (1'h0);
  reg [(4'h8):(1'h0)] reg59 = (1'h0);
  reg [(5'h12):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg [(3'h4):(1'h0)] reg52 = (1'h0);
  reg [(4'hf):(1'h0)] reg51 = (1'h0);
  reg [(5'h11):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg47 = (1'h0);
  reg [(5'h14):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg44 = (1'h0);
  reg [(3'h5):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire62,
                 wire56,
                 wire55,
                 wire41,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg40,
                 (1'h0)};
  assign wire34 = (~|(~|(^{((8'hb1) ? wire29 : wire33)})));
  assign wire35 = (wire32[(1'h0):(1'h0)] <= {$signed(wire29)});
  assign wire36 = (wire33 ^~ (wire35[(1'h1):(1'h1)] ?
                      (wire31 <<< ($unsigned((8'hb2)) ?
                          $unsigned(wire32) : (wire35 ?
                              (8'hbc) : wire29))) : ((8'haf) < (((8'hab) ?
                              wire31 : wire30) ?
                          {(8'hbb)} : (wire29 ^ wire29)))));
  assign wire37 = wire36;
  assign wire38 = {(((wire33[(4'hc):(4'hc)] ?
                                  $signed(wire35) : $signed(wire33)) ?
                              ((wire30 ? wire35 : wire33) ?
                                  $signed(wire29) : ((8'hbb) & wire36)) : $signed({wire30,
                                  wire32})) ?
                          wire30 : wire31[(4'he):(3'h5)])};
  assign wire39 = $unsigned({$unsigned($signed(((8'hbb) > wire38))),
                      {$unsigned($unsigned(wire30)), wire37[(2'h2):(1'h0)]}});
  always
    @(posedge clk) begin
      reg40 <= {$signed((($signed(wire34) ?
              $signed(wire35) : (wire35 - wire33)) == {$unsigned(wire34),
              (wire35 ? (8'hb2) : wire29)})),
          (^(&wire38))};
    end
  assign wire41 = wire29[(4'hd):(3'h5)];
  always
    @(posedge clk) begin
      reg42 <= {$signed($signed({(wire31 < wire38), {wire34, wire29}}))};
      if (wire32)
        begin
          if (wire34[(4'h9):(4'h9)])
            begin
              reg43 <= wire35[(1'h0):(1'h0)];
              reg44 <= (&(($signed(wire34) <<< wire30) ?
                  ((&wire35[(1'h1):(1'h1)]) ?
                      $signed(wire35) : wire29) : {$signed(wire41),
                      (reg43[(2'h2):(1'h0)] ?
                          (wire39 ? reg43 : wire41) : ((8'ha8) ?
                              wire38 : wire39))}));
              reg45 <= $signed($unsigned($signed({reg44[(2'h3):(2'h3)]})));
              reg46 <= ($unsigned({($signed(wire34) ?
                      $unsigned(reg40) : {wire41,
                          (8'hb4)})}) < (~&(^reg44[(2'h3):(2'h2)])));
              reg47 <= (((+wire41) ?
                      wire35[(2'h2):(1'h0)] : $unsigned(((^wire36) ?
                          $unsigned(reg40) : $unsigned(wire34)))) ?
                  reg42[(2'h2):(2'h2)] : (reg46[(1'h1):(1'h0)] ?
                      (((^wire33) ?
                          $unsigned(wire41) : $signed(reg46)) | $signed((wire31 ?
                          (8'hae) : wire31))) : reg42[(1'h1):(1'h0)]));
            end
          else
            begin
              reg43 <= $unsigned((-{(+(&(8'h9c)))}));
              reg44 <= (8'ha2);
              reg45 <= wire34;
              reg46 <= ((!wire34) < ($signed((~&$unsigned(wire33))) ^~ (!$unsigned((wire39 ?
                  (8'h9d) : wire32)))));
              reg47 <= $signed(wire33[(4'h8):(2'h3)]);
            end
          if ($unsigned(wire39))
            begin
              reg48 <= $unsigned(reg44[(1'h0):(1'h0)]);
              reg49 <= {$unsigned((((-wire35) ?
                      $signed((7'h41)) : (wire38 && wire29)) >> wire34[(3'h4):(2'h2)])),
                  (reg43[(2'h2):(1'h1)] ?
                      (wire39 ?
                          (reg45 ?
                              wire31 : wire38) : reg48) : wire39[(4'hf):(2'h2)])};
            end
          else
            begin
              reg48 <= ((~^wire36[(2'h3):(1'h0)]) + $unsigned($unsigned(reg47)));
              reg49 <= ((^~wire31) ?
                  (~$unsigned(((reg43 ? reg45 : wire37) ?
                      reg44 : wire39))) : ($unsigned($signed((8'hb4))) << ((+$unsigned(reg48)) << wire38[(1'h1):(1'h0)])));
              reg50 <= wire30;
              reg51 <= (8'hac);
            end
          reg52 <= (~wire30);
          reg53 <= wire37;
          reg54 <= ($unsigned(($unsigned($unsigned(reg47)) == {(^~reg44)})) <<< $signed($unsigned({$unsigned(wire33),
              $signed(wire35)})));
        end
      else
        begin
          reg43 <= (!$unsigned($signed({$signed((8'ha5))})));
          reg44 <= wire30;
          reg45 <= $signed(($unsigned($signed({wire41,
              wire32})) | reg50[(4'hf):(4'hd)]));
          reg46 <= $unsigned({reg48[(2'h2):(2'h2)]});
          reg47 <= ((8'ha3) ? $unsigned((8'hae)) : reg42[(3'h4):(2'h2)]);
        end
    end
  assign wire55 = reg42;
  assign wire56 = reg47;
  always
    @(posedge clk) begin
      reg57 <= reg48;
      if (({$signed(wire56), wire36[(3'h6):(3'h6)]} ?
          (reg52[(1'h1):(1'h1)] < wire30) : ($unsigned($unsigned({wire34,
              wire34})) << wire41)))
        begin
          if ((8'haa))
            begin
              reg58 <= (-reg47[(2'h3):(1'h1)]);
              reg59 <= reg48[(1'h0):(1'h0)];
              reg60 <= wire37[(2'h2):(1'h0)];
              reg61 <= $unsigned(($unsigned((reg50[(5'h10):(3'h6)] ?
                  (reg49 || reg40) : wire55[(1'h1):(1'h1)])) ^~ wire36));
            end
          else
            begin
              reg58 <= ($unsigned($signed((wire36[(1'h1):(1'h0)] && (reg61 ?
                      reg42 : wire30)))) ?
                  {reg46[(4'hc):(4'h8)]} : $signed(($signed((wire32 ?
                          wire33 : wire39)) ?
                      (reg50[(5'h10):(4'ha)] ?
                          $signed(reg52) : reg61[(2'h3):(1'h1)]) : wire39)));
              reg59 <= reg60;
              reg60 <= wire32[(1'h1):(1'h1)];
              reg61 <= $signed((-(&(^~(~^(8'hae))))));
            end
        end
      else
        begin
          reg58 <= ((((((8'hb6) >= reg45) & wire34) & (reg46[(4'hd):(4'h8)] ?
                  wire33[(4'h9):(2'h2)] : ((8'hb4) ?
                      (8'ha0) : wire38))) > reg48[(2'h2):(1'h0)]) ?
              $signed((wire38 ?
                  $signed((&reg42)) : wire37)) : ((((wire33 & reg52) & (!reg40)) ?
                      ((8'h9c) ?
                          $signed(wire36) : ((8'h9d) ~^ reg48)) : reg45[(3'h7):(1'h0)]) ?
                  reg40[(3'h5):(2'h3)] : wire35[(2'h2):(2'h2)]));
        end
    end
  assign wire62 = reg61;
  always
    @(posedge clk) begin
      if (wire33)
        begin
          reg63 <= $signed((8'h9c));
          reg64 <= reg44[(1'h1):(1'h1)];
        end
      else
        begin
          if ((reg45[(4'hb):(4'ha)] >= wire62[(4'h8):(3'h4)]))
            begin
              reg63 <= {(^wire35), (8'hbc)};
              reg64 <= reg52;
              reg65 <= reg44;
              reg66 <= ((reg40[(4'he):(1'h0)] ?
                  (reg59 ?
                      {wire31[(4'hf):(3'h7)], (^wire41)} : ($unsigned(wire38) ?
                          reg53 : (reg60 ?
                              (8'hb6) : (8'hb3)))) : $signed(((wire39 ?
                          reg48 : wire31) ?
                      ((8'ha8) ?
                          reg51 : reg42) : wire29[(4'he):(3'h6)]))) << {reg44[(3'h4):(2'h3)],
                  $signed($unsigned($unsigned((8'ha1))))});
            end
          else
            begin
              reg63 <= ($unsigned((~&reg50[(2'h2):(1'h0)])) ?
                  ($signed(((wire30 ? (8'hb5) : wire56) & (reg47 ?
                      reg42 : wire29))) || (^(~(wire38 - (8'hbc))))) : (~$signed(reg53)));
            end
        end
      if (($unsigned($signed((wire34[(3'h6):(1'h0)] ?
              $signed(reg47) : $unsigned(wire33)))) ?
          ((^reg43) - (^$signed($unsigned(reg59)))) : (wire29 ?
              ($unsigned((~^wire39)) ?
                  ($unsigned((8'haf)) ?
                      $unsigned(reg54) : $unsigned(reg63)) : reg65[(1'h1):(1'h0)]) : reg53[(1'h1):(1'h0)])))
        begin
          reg67 <= ({$unsigned((~$signed(wire38))),
                  ($signed(wire33) | $signed($signed(reg61)))} ?
              {($unsigned($unsigned(reg51)) - (^~(~wire30))),
                  $signed(wire38[(4'hb):(4'hb)])} : $signed(wire56));
          reg68 <= $signed(({(~&(reg61 + reg59)), ((^wire55) <<< wire55)} ?
              wire34[(3'h7):(2'h3)] : reg40[(4'h8):(3'h6)]));
          if ($unsigned($signed((reg51[(1'h1):(1'h1)] | {$signed(reg67),
              ((8'ha2) >> wire37)}))))
            begin
              reg69 <= $unsigned(wire37);
            end
          else
            begin
              reg69 <= (!reg52[(1'h1):(1'h1)]);
              reg70 <= $unsigned(($signed(($unsigned((8'ha5)) ?
                  (!wire41) : $unsigned(reg50))) && $unsigned((~(reg66 < (8'hbb))))));
              reg71 <= $signed(((-(+(reg65 ? reg45 : wire30))) << wire36));
            end
        end
      else
        begin
          reg67 <= {reg64[(4'hd):(4'h8)], reg64[(3'h6):(3'h4)]};
          reg68 <= $signed((((wire33 >> {reg70, reg70}) ^~ {((8'hbd) ?
                  wire38 : (8'h9c))}) >>> $unsigned(({reg52} <= (reg42 ?
              reg53 : wire36)))));
          if (reg53[(3'h5):(1'h0)])
            begin
              reg69 <= (^wire56[(1'h1):(1'h0)]);
            end
          else
            begin
              reg69 <= {reg49[(4'ha):(2'h3)]};
              reg70 <= (8'hac);
            end
        end
    end
  assign wire72 = ((reg50 + $signed((~^(~wire31)))) ?
                      $signed((&($unsigned(wire30) + $signed(wire41)))) : $unsigned($unsigned(reg57)));
  assign wire73 = $signed((($signed(((7'h42) ? reg61 : (8'hac))) ?
                          ((reg66 ?
                              wire39 : wire55) == $unsigned(reg59)) : (~^wire72)) ?
                      $signed((|$signed(wire39))) : $signed((reg53 & (~|wire38)))));
endmodule
