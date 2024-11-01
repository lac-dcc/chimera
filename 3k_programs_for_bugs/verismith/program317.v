module top
#(parameter param235 = ((^{(!{(8'ha0), (8'hb8)})}) <= (-{(&((8'haf) ? (8'hbd) : (8'ha8))), (8'had)})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h185):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire234;
  wire signed [(4'hb):(1'h0)] wire232;
  wire [(5'h11):(1'h0)] wire58;
  wire [(4'ha):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire24;
  wire [(5'h13):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire20;
  wire signed [(5'h13):(1'h0)] wire19;
  wire signed [(5'h12):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire4;
  wire signed [(4'hc):(1'h0)] wire60;
  wire signed [(5'h13):(1'h0)] wire61;
  wire signed [(4'hd):(1'h0)] wire160;
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  assign y = {wire234,
                 wire232,
                 wire58,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 wire60,
                 wire61,
                 wire160,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 (1'h0)};
  assign wire4 = ({$signed(wire0), {wire0[(3'h4):(2'h2)]}} ?
                     $unsigned((!wire3[(3'h4):(1'h0)])) : $unsigned(wire1[(1'h0):(1'h0)]));
  assign wire5 = $signed({wire1[(1'h1):(1'h0)],
                     $unsigned((~wire3[(5'h10):(4'ha)]))});
  assign wire6 = wire0;
  assign wire7 = $signed(wire4);
  always
    @(posedge clk) begin
      reg8 <= $signed({$signed($unsigned({(8'hb1), wire6})),
          (wire5[(5'h10):(4'hb)] > {(wire3 & wire3), (&wire2)})});
      if (wire2[(2'h2):(1'h1)])
        begin
          reg9 <= ((~&($signed(wire7[(2'h2):(1'h1)]) ?
                  ($signed(wire0) ?
                      (^wire0) : (~&reg8)) : $signed($unsigned((7'h40))))) ?
              (~|(wire1 ^ $unsigned($unsigned(wire4)))) : $signed((~wire6[(2'h3):(1'h1)])));
          reg10 <= (wire2[(1'h0):(1'h0)] ^~ wire3);
          reg11 <= ((|(|$unsigned($signed(wire3)))) ?
              (&$unsigned((reg9 - (-wire4)))) : $signed($signed((8'hbb))));
          if (reg10[(5'h11):(2'h2)])
            begin
              reg12 <= (reg9 ?
                  ((((8'ha0) ?
                      (~&wire3) : wire1[(1'h0):(1'h0)]) * (((8'hac) >= wire6) >>> (~&reg9))) - (reg10 ^ $signed(reg9))) : {({wire6} || wire7),
                      $unsigned(({(8'h9f)} && (~^wire3)))});
            end
          else
            begin
              reg12 <= {$signed(($unsigned(reg12) * $signed((8'ha1))))};
              reg13 <= {$unsigned(({$unsigned(reg8),
                      $signed(wire5)} == (!$signed(wire1)))),
                  ($unsigned(wire1[(2'h2):(1'h0)]) <= (reg9[(5'h11):(4'hc)] ?
                      $unsigned($signed(wire3)) : (^{reg12, wire6})))};
            end
          reg14 <= reg13[(3'h6):(2'h3)];
        end
      else
        begin
          reg9 <= ($signed((({(8'hb3)} ? (&reg13) : (wire1 ? (8'hbb) : wire4)) ?
                  $unsigned((-reg14)) : reg10[(5'h13):(4'h9)])) ?
              wire0[(2'h3):(2'h2)] : wire7);
          reg10 <= ((|((wire6 ? reg9 : (&wire5)) ?
                  $signed(reg13[(3'h6):(1'h0)]) : (reg11[(3'h6):(3'h4)] & (wire5 > wire2)))) ?
              ($signed($unsigned((wire7 ?
                  wire5 : reg11))) || $signed((wire4[(2'h3):(2'h2)] ?
                  reg11 : (^wire1)))) : (~(&((wire5 ? reg11 : wire6) ?
                  $signed((8'hae)) : wire4))));
          reg11 <= $signed({reg10[(4'hf):(4'hc)], reg8[(4'he):(1'h1)]});
          if (((($unsigned($unsigned(reg9)) >= (^~(~|reg9))) << ((-wire5) ?
                  $unsigned(reg14) : reg8[(4'h9):(2'h3)])) ?
              ($unsigned((^{reg14})) ^~ (wire6[(3'h7):(3'h5)] >> (~^(reg9 ?
                  wire6 : wire3)))) : ((|$unsigned((wire1 ? wire7 : wire3))) ?
                  reg10 : $unsigned(wire2[(1'h0):(1'h0)]))))
            begin
              reg12 <= $signed($signed((~|(~|$unsigned(reg11)))));
              reg13 <= wire1;
            end
          else
            begin
              reg12 <= {((wire1 ?
                      $signed((reg10 ?
                          wire6 : reg11)) : ($unsigned(reg11) | $unsigned(reg11))) ~^ reg12[(2'h3):(2'h3)])};
              reg13 <= wire4[(1'h0):(1'h0)];
              reg14 <= (-$signed($signed($signed($unsigned(reg12)))));
              reg15 <= wire0;
              reg16 <= {$signed(wire1[(2'h2):(1'h1)]), wire3};
            end
        end
      reg17 <= (((&$signed({wire3})) ?
              (wire0[(2'h2):(1'h0)] >> (|(reg14 >>> reg13))) : wire7) ?
          wire6 : ((|wire0[(3'h5):(1'h1)]) ?
              (&{(reg16 * reg16), reg12}) : wire1[(1'h1):(1'h0)]));
      reg18 <= wire4;
    end
  assign wire19 = $unsigned($unsigned((reg18 ?
                      ((8'had) ?
                          reg15[(2'h2):(1'h1)] : ((8'hac) >= reg13)) : ((reg12 == reg15) | {reg16,
                          (8'ha0)}))));
  assign wire20 = wire0[(1'h0):(1'h0)];
  assign wire21 = $unsigned($signed($unsigned(((&reg18) ?
                      reg13[(2'h3):(2'h3)] : wire4[(4'h8):(3'h6)]))));
  assign wire22 = (~|(8'ha6));
  assign wire23 = reg17[(2'h2):(1'h1)];
  assign wire24 = ($unsigned((&$unsigned($unsigned(wire2)))) * reg10[(4'hd):(4'hb)]);
  assign wire25 = ((-wire24[(1'h1):(1'h0)]) ?
                      wire0 : $unsigned((($signed(reg11) ?
                          reg15[(1'h1):(1'h0)] : wire2[(1'h1):(1'h1)]) | $unsigned((wire22 >>> wire3)))));
  module26 #() modinst59 (wire58, clk, reg11, reg13, wire19, wire2, wire21);
  assign wire60 = ($signed($unsigned($signed((8'hbe)))) ?
                      wire5 : $signed($unsigned(wire2[(3'h5):(2'h3)])));
  assign wire61 = (~^($unsigned({$signed(wire20), {wire60}}) ?
                      $unsigned(($signed(wire6) ?
                          reg10[(4'h8):(2'h3)] : (|wire20))) : wire1[(1'h0):(1'h0)]));
  module62 #() modinst161 (wire160, clk, wire58, wire61, wire24, reg11);
  module162 #() modinst233 (wire232, clk, wire2, reg15, wire22, reg13);
  assign wire234 = {wire0, $signed(wire22[(3'h4):(1'h0)])};
endmodule

module module162
#(parameter param230 = (((~|{(~&(8'ha7)), (!(8'hb5))}) != (8'h9f)) && {(((-(7'h43)) ? (~^(8'hbb)) : ((8'h9c) ? (8'hbb) : (8'ha0))) & (((7'h42) ? (8'hae) : (8'h9d)) + ((8'hbc) < (8'h9e))))}), 
parameter param231 = (!(param230 + (!((param230 <<< param230) ? param230 : {param230, (8'ha5)})))))
(y, clk, wire166, wire165, wire164, wire163);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire166;
  input wire signed [(4'h8):(1'h0)] wire165;
  input wire signed [(5'h12):(1'h0)] wire164;
  input wire signed [(4'ha):(1'h0)] wire163;
  wire signed [(4'hb):(1'h0)] wire228;
  wire signed [(5'h12):(1'h0)] wire195;
  wire signed [(3'h6):(1'h0)] wire194;
  wire signed [(4'ha):(1'h0)] wire193;
  wire [(4'hb):(1'h0)] wire192;
  wire signed [(3'h7):(1'h0)] wire191;
  wire signed [(5'h12):(1'h0)] wire190;
  wire [(4'h8):(1'h0)] wire189;
  wire [(5'h11):(1'h0)] wire187;
  wire signed [(4'hc):(1'h0)] wire172;
  wire [(5'h11):(1'h0)] wire171;
  wire [(5'h15):(1'h0)] wire170;
  wire [(5'h10):(1'h0)] wire169;
  wire [(3'h7):(1'h0)] wire168;
  wire [(5'h10):(1'h0)] wire167;
  assign y = {wire228,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire187,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 (1'h0)};
  assign wire167 = $unsigned((({wire164} <= $unsigned($signed(wire166))) ?
                       ($unsigned((wire166 ? wire163 : wire166)) ?
                           wire164 : (~(~wire165))) : ($signed(wire164[(4'hc):(4'hb)]) <<< {wire163})));
  assign wire168 = wire165;
  assign wire169 = wire167[(5'h10):(5'h10)];
  assign wire170 = ($unsigned($unsigned(((^~wire163) ^~ (~&wire166)))) >> (8'h9d));
  assign wire171 = $unsigned(wire169);
  assign wire172 = $signed(wire171[(1'h0):(1'h0)]);
  module173 #() modinst188 (.wire175(wire163), .wire177(wire169), .wire176(wire166), .wire174(wire172), .y(wire187), .clk(clk));
  assign wire189 = $unsigned((|($signed(wire170) | ($signed(wire167) > $unsigned(wire163)))));
  assign wire190 = $unsigned($signed(wire170[(4'hf):(2'h3)]));
  assign wire191 = (8'ha2);
  assign wire192 = wire164;
  assign wire193 = wire187[(4'he):(4'hb)];
  assign wire194 = (wire171 ?
                       wire164[(3'h4):(2'h3)] : (^~((wire171 < (wire163 ?
                               wire172 : (8'h9c))) ?
                           (wire167 == ((8'hba) ?
                               wire169 : (8'ha8))) : (wire168[(3'h4):(1'h1)] ?
                               wire165[(2'h3):(1'h0)] : wire163))));
  assign wire195 = wire191;
  module196 #() modinst229 (.clk(clk), .y(wire228), .wire197(wire171), .wire199(wire166), .wire200(wire189), .wire198(wire187));
endmodule

module module62
#(parameter param158 = (+{(8'hac), ({((7'h42) >>> (8'ha6))} ? ({(8'hb5), (8'hbd)} && ((8'hb9) ? (8'ha8) : (8'hb1))) : (((7'h43) ? (8'hb4) : (8'hba)) < ((8'hb3) ? (8'had) : (8'ha1))))}), 
parameter param159 = ((param158 ? (((+param158) * (param158 ~^ param158)) ? (^~((8'ha2) ? param158 : param158)) : {(+(8'hbe))}) : (param158 < (~(~param158)))) && (param158 == {param158})))
(y, clk, wire66, wire65, wire64, wire63);
  output wire [(32'hda):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire66;
  input wire [(4'he):(1'h0)] wire65;
  input wire [(5'h14):(1'h0)] wire64;
  input wire [(5'h12):(1'h0)] wire63;
  wire [(5'h11):(1'h0)] wire157;
  wire [(5'h11):(1'h0)] wire118;
  wire signed [(3'h4):(1'h0)] wire70;
  wire [(4'hf):(1'h0)] wire69;
  wire signed [(5'h10):(1'h0)] wire68;
  wire [(5'h15):(1'h0)] wire67;
  wire signed [(3'h4):(1'h0)] wire120;
  wire signed [(2'h2):(1'h0)] wire121;
  wire [(4'hf):(1'h0)] wire122;
  wire [(4'hc):(1'h0)] wire130;
  wire signed [(4'h8):(1'h0)] wire131;
  wire [(4'hb):(1'h0)] wire155;
  reg signed [(3'h5):(1'h0)] reg123 = (1'h0);
  reg [(4'he):(1'h0)] reg124 = (1'h0);
  reg [(4'h8):(1'h0)] reg125 = (1'h0);
  reg [(5'h12):(1'h0)] reg126 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg128 = (1'h0);
  reg [(4'hd):(1'h0)] reg129 = (1'h0);
  assign y = {wire157,
                 wire118,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire120,
                 wire121,
                 wire122,
                 wire130,
                 wire131,
                 wire155,
                 reg123,
                 reg124,
                 reg125,
                 reg126,
                 reg127,
                 reg128,
                 reg129,
                 (1'h0)};
  assign wire67 = (($unsigned($unsigned(wire65[(3'h5):(3'h4)])) ?
                      $unsigned((((8'h9e) + wire65) ?
                          wire66[(1'h1):(1'h0)] : wire63)) : ($unsigned({wire66}) < $unsigned($signed((8'hab))))) * ($signed(wire66) >> (-wire65)));
  assign wire68 = wire66[(5'h11):(3'h6)];
  assign wire69 = wire65[(3'h6):(2'h2)];
  assign wire70 = (-$signed((~((~wire64) ?
                      wire67[(4'hd):(4'hb)] : ((8'ha5) ? wire64 : wire68)))));
  module71 #() modinst119 (wire118, clk, wire65, wire68, wire69, wire66, wire64);
  assign wire120 = (|wire118);
  assign wire121 = ((|(8'hae)) ?
                       $signed($signed({(wire66 == wire120)})) : (wire120 >= (wire66 ?
                           $unsigned($unsigned(wire64)) : wire65[(4'hd):(3'h6)])));
  assign wire122 = wire64;
  always
    @(posedge clk) begin
      if (((~|(|($signed(wire118) & $signed(wire120)))) - wire68[(3'h6):(1'h1)]))
        begin
          if (wire121)
            begin
              reg123 <= $signed((~&(((|wire68) ?
                  ((8'haf) ?
                      wire64 : wire121) : $unsigned(wire64)) != wire68[(3'h7):(3'h6)])));
              reg124 <= wire64[(3'h4):(1'h0)];
              reg125 <= ((wire67 && ($unsigned(wire68[(1'h0):(1'h0)]) ?
                  wire69 : ($unsigned(wire120) != $unsigned(wire66)))) <<< $unsigned((reg124 | ((wire121 > wire67) && $unsigned(wire65)))));
            end
          else
            begin
              reg123 <= $unsigned({$signed((7'h43)), wire121});
              reg124 <= wire120;
              reg125 <= wire70;
              reg126 <= wire67[(4'he):(3'h6)];
            end
        end
      else
        begin
          reg123 <= wire67;
          if ((8'ha2))
            begin
              reg124 <= ((((|wire69) ?
                      ((wire68 ? (8'hab) : (8'hb9)) ?
                          {reg125,
                              wire65} : $signed((8'hbf))) : (+{reg126})) << wire118) ?
                  ((($unsigned((8'hbd)) ~^ (wire64 ? reg124 : wire63)) ?
                          (wire120[(2'h3):(2'h2)] ?
                              (wire63 + wire64) : {wire63}) : (7'h43)) ?
                      $signed(({reg125} ?
                          $signed((8'hb1)) : ((8'ha5) ?
                              reg125 : wire64))) : ({wire118} ?
                          $signed((!wire67)) : $unsigned($signed(wire122)))) : $signed(wire68[(4'hb):(1'h0)]));
              reg125 <= ((8'h9f) ?
                  {$unsigned($unsigned($signed(wire69)))} : $unsigned((8'hab)));
              reg126 <= ($signed(($unsigned($signed(wire63)) ?
                      (~^{wire67, (8'h9f)}) : $signed((wire70 ?
                          wire65 : wire66)))) ?
                  $signed((~^(wire67 ?
                      $unsigned(wire120) : $signed(wire70)))) : reg125);
            end
          else
            begin
              reg124 <= $signed(wire65);
              reg125 <= wire68;
              reg126 <= {(wire118[(3'h7):(2'h2)] - (|(&(~|wire69))))};
              reg127 <= ({$signed(wire120[(3'h4):(2'h2)]), reg124} ?
                  reg126[(1'h1):(1'h1)] : wire69);
              reg128 <= ((($unsigned((7'h42)) | wire68) ?
                  (($signed(wire70) || wire68) >>> ((reg125 ?
                      reg127 : reg124) && (|(8'hb0)))) : $signed((~(wire121 ?
                      reg127 : wire65)))) & wire65[(4'he):(4'hd)]);
            end
        end
      reg129 <= $signed($unsigned((reg123 ~^ {(~^(8'hb2))})));
    end
  assign wire130 = (reg124[(3'h7):(1'h1)] >= ($signed(reg127[(3'h7):(2'h2)]) ?
                       (~|wire67[(4'hf):(4'hf)]) : {reg126[(3'h5):(3'h4)],
                           wire63[(1'h1):(1'h0)]}));
  assign wire131 = $signed($signed($unsigned(($unsigned(wire66) >>> (wire67 ?
                       wire70 : reg126)))));
  module132 #() modinst156 (.wire134(wire131), .wire135(wire122), .clk(clk), .wire136(wire66), .y(wire155), .wire133(reg125));
  assign wire157 = reg123[(2'h2):(1'h1)];
endmodule

module module26  (y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'h10b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire31;
  input wire [(4'ha):(1'h0)] wire30;
  input wire [(4'h9):(1'h0)] wire29;
  input wire [(4'h8):(1'h0)] wire28;
  input wire signed [(5'h13):(1'h0)] wire27;
  wire [(3'h5):(1'h0)] wire57;
  wire [(4'hb):(1'h0)] wire39;
  wire [(4'hd):(1'h0)] wire38;
  wire [(4'h8):(1'h0)] wire37;
  wire [(3'h5):(1'h0)] wire36;
  wire [(4'he):(1'h0)] wire35;
  wire [(3'h4):(1'h0)] wire34;
  reg signed [(5'h12):(1'h0)] reg56 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg [(4'h9):(1'h0)] reg54 = (1'h0);
  reg [(4'hc):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg51 = (1'h0);
  reg [(4'hb):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg49 = (1'h0);
  reg [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg47 = (1'h0);
  reg [(4'hd):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(4'ha):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(4'hc):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(2'h2):(1'h0)] reg32 = (1'h0);
  assign y = {wire57,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 reg56,
                 reg55,
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
                 reg41,
                 reg40,
                 reg33,
                 reg32,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg32 <= (wire31 >>> wire28[(3'h4):(1'h1)]);
      reg33 <= (wire31[(2'h2):(1'h0)] ?
          ($unsigned((-{wire28, wire27})) ?
              (~$unsigned((~&wire27))) : wire29) : $unsigned((!$unsigned((wire29 ?
              wire27 : (8'hb4))))));
    end
  assign wire34 = wire30[(3'h7):(3'h6)];
  assign wire35 = reg33[(3'h5):(1'h0)];
  assign wire36 = $unsigned($signed(wire35[(4'hb):(2'h2)]));
  assign wire37 = $signed(wire31);
  assign wire38 = (^wire29[(4'h8):(3'h5)]);
  assign wire39 = wire29;
  always
    @(posedge clk) begin
      if ((($signed($unsigned((wire27 & reg33))) >= (wire30[(1'h0):(1'h0)] & (~^(wire38 ?
              wire37 : wire30)))) ?
          wire27[(5'h11):(5'h11)] : ($signed(reg32) << reg33[(4'h8):(3'h5)])))
        begin
          if ((|(~&$signed($signed($unsigned(reg32))))))
            begin
              reg40 <= {wire29};
              reg41 <= $unsigned({(wire38[(4'hd):(4'hd)] ?
                      ((8'hb8) ?
                          (wire36 ?
                              (8'hbb) : wire29) : $signed(wire36)) : wire39)});
              reg42 <= reg32[(1'h1):(1'h1)];
            end
          else
            begin
              reg40 <= wire29;
              reg41 <= wire35[(1'h0):(1'h0)];
              reg42 <= (wire36[(2'h3):(2'h3)] + {(wire38 + $signed(((8'ha6) ^ wire36)))});
            end
          if (reg32)
            begin
              reg43 <= $signed((reg32 ?
                  {(8'had)} : ((!(!reg33)) ?
                      reg32 : $unsigned(reg32[(1'h0):(1'h0)]))));
              reg44 <= ((wire30[(3'h4):(1'h0)] ?
                  ({$signed(reg33)} << wire30) : wire31[(4'h9):(2'h3)]) && $unsigned(reg43));
            end
          else
            begin
              reg43 <= (($unsigned((&$unsigned(wire34))) ?
                  ((~&(wire31 ? wire39 : wire27)) ?
                      $unsigned(wire37) : wire34[(2'h2):(2'h2)]) : ((~|wire31[(3'h4):(2'h2)]) - wire36)) << (wire34[(2'h3):(1'h1)] & wire30[(3'h7):(3'h6)]));
              reg44 <= reg42[(4'h9):(2'h3)];
              reg45 <= ((+(~|$signed(((7'h41) < reg33)))) ?
                  $signed($unsigned($signed(reg43))) : wire39[(3'h6):(2'h2)]);
            end
          if ({($signed($unsigned(((8'hb9) ?
                  reg43 : wire27))) >= {$unsigned({wire39, reg43}),
                  $unsigned($signed(wire27))})})
            begin
              reg46 <= (~&(~$signed($signed({(8'hb1)}))));
            end
          else
            begin
              reg46 <= {$unsigned(reg44),
                  {($unsigned($signed(reg43)) & (~|$unsigned(wire38))),
                      (((8'hba) ? $unsigned(wire34) : reg44) ^~ (8'h9c))}};
              reg47 <= wire35[(1'h1):(1'h1)];
              reg48 <= reg33;
            end
          reg49 <= (reg45 ? reg40 : (-$signed((~&$unsigned(wire30)))));
          reg50 <= wire36;
        end
      else
        begin
          reg40 <= wire34;
        end
      reg51 <= $signed($signed(($signed($unsigned(wire27)) ?
          wire28 : ((wire36 ? wire31 : wire36) ?
              (wire31 ~^ (8'hba)) : (wire37 ? wire38 : wire31)))));
      reg52 <= reg44;
      if ((~&{wire37,
          ($unsigned($unsigned(wire34)) <<< ((wire29 * reg51) ?
              reg40 : reg41[(3'h6):(2'h3)]))}))
        begin
          reg53 <= $unsigned(reg43);
        end
      else
        begin
          reg53 <= ($unsigned(($unsigned((wire39 ^ (8'ha1))) | reg46)) ?
              reg51 : ((wire37[(1'h0):(1'h0)] ^ $unsigned($signed(wire27))) ?
                  reg51[(4'he):(3'h5)] : {(-(wire31 ? reg49 : reg40)),
                      $signed(reg49)}));
          reg54 <= reg47[(2'h3):(2'h2)];
          reg55 <= reg45[(3'h5):(1'h1)];
          reg56 <= $signed($unsigned($signed(($signed((8'ha8)) | (wire27 ?
              reg50 : wire29)))));
        end
    end
  assign wire57 = (~^$unsigned(($unsigned((reg46 ?
                      reg33 : reg43)) & wire37[(2'h3):(1'h1)])));
endmodule

module module132  (y, clk, wire136, wire135, wire134, wire133);
  output wire [(32'hdd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire136;
  input wire [(4'hd):(1'h0)] wire135;
  input wire [(4'h8):(1'h0)] wire134;
  input wire signed [(4'h8):(1'h0)] wire133;
  wire [(5'h11):(1'h0)] wire154;
  wire [(5'h10):(1'h0)] wire153;
  wire [(4'ha):(1'h0)] wire152;
  wire [(4'hf):(1'h0)] wire151;
  wire signed [(4'hf):(1'h0)] wire150;
  wire signed [(3'h5):(1'h0)] wire149;
  wire [(4'h9):(1'h0)] wire148;
  wire signed [(5'h14):(1'h0)] wire147;
  wire signed [(5'h15):(1'h0)] wire145;
  wire [(5'h13):(1'h0)] wire144;
  wire signed [(3'h6):(1'h0)] wire143;
  wire signed [(2'h2):(1'h0)] wire138;
  wire [(5'h12):(1'h0)] wire137;
  reg [(4'hd):(1'h0)] reg146 = (1'h0);
  reg [(4'ha):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg141 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg140 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg139 = (1'h0);
  assign y = {wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire145,
                 wire144,
                 wire143,
                 wire138,
                 wire137,
                 reg146,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 (1'h0)};
  assign wire137 = ((wire133 >> wire136[(3'h6):(1'h0)]) ?
                       {wire133[(2'h2):(2'h2)]} : ((wire136 >> wire134) ?
                           {(~^$signed(wire136)), (8'hab)} : $signed((((8'had) ?
                               wire133 : wire134) ~^ (wire134 << wire136)))));
  assign wire138 = ((wire136 ?
                       $unsigned($unsigned((~|wire135))) : wire135) && (~&wire136[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      reg139 <= (!((8'hac) >= (|((wire137 >> wire138) ?
          (-wire137) : wire135[(3'h5):(2'h3)]))));
      reg140 <= reg139[(1'h0):(1'h0)];
      reg141 <= $unsigned(wire134[(4'h8):(3'h4)]);
      reg142 <= (reg141 << ((($unsigned(wire137) ? $unsigned(reg140) : reg139) ?
          wire135 : $unsigned($unsigned(reg140))) == $signed($signed((wire135 & wire137)))));
    end
  assign wire143 = ((~^{($signed(reg140) ^~ $unsigned((8'h9f))),
                           ((wire138 <<< reg140) >> $unsigned(wire134))}) ?
                       (((&((8'h9d) ? wire134 : wire134)) ?
                               $signed((~&wire136)) : $signed((reg140 == (8'ha5)))) ?
                           ((reg139 ?
                               (wire136 < wire134) : (reg139 | wire137)) != (-reg142)) : ((|$signed(wire136)) ^ ($signed(reg139) ~^ $signed(wire138)))) : (8'ha6));
  assign wire144 = $signed((~|$signed((~(^reg139)))));
  assign wire145 = reg142;
  always
    @(posedge clk) begin
      reg146 <= wire134[(3'h4):(2'h2)];
    end
  assign wire147 = reg142;
  assign wire148 = (wire147[(5'h10):(3'h5)] ?
                       (~&$signed({wire143[(1'h0):(1'h0)],
                           $unsigned(wire136)})) : ({((^wire136) >= $signed(reg139))} ?
                           ($unsigned((reg141 | wire145)) ^~ ((wire138 ?
                               wire147 : wire138) & (wire137 ?
                               (8'haa) : reg141))) : (~|wire145[(2'h3):(1'h0)])));
  assign wire149 = $signed($signed($signed((^~$signed(wire133)))));
  assign wire150 = wire133;
  assign wire151 = ($unsigned($signed(reg146[(3'h5):(1'h1)])) ?
                       reg139[(2'h2):(1'h0)] : wire133[(3'h6):(1'h1)]);
  assign wire152 = $signed((7'h42));
  assign wire153 = wire138;
  assign wire154 = $signed(reg139[(1'h0):(1'h0)]);
endmodule

module module71  (y, clk, wire76, wire75, wire74, wire73, wire72);
  output wire [(32'h196):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire76;
  input wire [(4'hc):(1'h0)] wire75;
  input wire signed [(4'hf):(1'h0)] wire74;
  input wire [(4'ha):(1'h0)] wire73;
  input wire [(5'h14):(1'h0)] wire72;
  wire [(2'h3):(1'h0)] wire117;
  wire signed [(4'h9):(1'h0)] wire116;
  wire [(3'h6):(1'h0)] wire115;
  wire signed [(3'h5):(1'h0)] wire114;
  wire signed [(4'he):(1'h0)] wire113;
  wire [(3'h7):(1'h0)] wire112;
  wire [(4'hc):(1'h0)] wire111;
  wire [(5'h14):(1'h0)] wire110;
  wire [(2'h3):(1'h0)] wire109;
  wire signed [(4'h8):(1'h0)] wire108;
  wire [(5'h14):(1'h0)] wire107;
  wire [(4'hd):(1'h0)] wire106;
  wire [(2'h2):(1'h0)] wire105;
  wire signed [(4'hd):(1'h0)] wire77;
  reg signed [(5'h15):(1'h0)] reg104 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg103 = (1'h0);
  reg [(3'h5):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg100 = (1'h0);
  reg [(4'hc):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg98 = (1'h0);
  reg [(3'h7):(1'h0)] reg97 = (1'h0);
  reg [(4'hc):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg95 = (1'h0);
  reg [(2'h3):(1'h0)] reg94 = (1'h0);
  reg [(4'ha):(1'h0)] reg93 = (1'h0);
  reg [(3'h4):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg91 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg90 = (1'h0);
  reg [(3'h6):(1'h0)] reg89 = (1'h0);
  reg [(3'h6):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg83 = (1'h0);
  reg [(4'hf):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg81 = (1'h0);
  reg [(4'he):(1'h0)] reg80 = (1'h0);
  reg [(5'h10):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg78 = (1'h0);
  assign y = {wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire77,
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
                 (1'h0)};
  assign wire77 = (-$unsigned(wire73[(3'h4):(3'h4)]));
  always
    @(posedge clk) begin
      if ((8'hbb))
        begin
          reg78 <= (~&{(((wire75 ? wire76 : wire75) > {wire75,
                  wire77}) >= {{wire74}}),
              ($signed($unsigned(wire72)) ?
                  wire74[(4'hb):(3'h5)] : $unsigned(((8'hb1) ?
                      (8'ha9) : wire74)))});
          reg79 <= $signed(($signed(((8'hb5) ^~ wire75)) + {wire73[(4'ha):(3'h6)],
              wire76[(2'h2):(1'h1)]}));
          reg80 <= ((~(~|wire76)) ?
              $unsigned(wire74[(4'hc):(3'h4)]) : $unsigned((((8'ha8) + (reg78 && wire72)) == ($signed(wire77) ?
                  (wire75 ? wire72 : reg78) : (wire74 & (8'had))))));
        end
      else
        begin
          if (reg80[(1'h0):(1'h0)])
            begin
              reg78 <= wire76[(1'h0):(1'h0)];
              reg79 <= wire76[(4'he):(4'h9)];
              reg80 <= (wire77 ?
                  (~^(wire76 >>> (reg80 ?
                      ((7'h44) ? wire74 : wire72) : {reg79,
                          wire72}))) : $unsigned({wire72[(1'h0):(1'h0)],
                      wire74}));
              reg81 <= ((wire75[(4'ha):(2'h2)] ?
                      (~(~(|wire76))) : $signed((wire73[(3'h4):(2'h2)] ?
                          reg78[(2'h2):(2'h2)] : (&wire72)))) ?
                  $signed(($signed(((8'hb8) || wire73)) ?
                      $signed((^~reg80)) : (reg80 ?
                          wire77 : $signed(reg80)))) : {(reg79[(2'h3):(2'h3)] ?
                          ($signed(reg79) >>> wire75[(2'h3):(2'h3)]) : (8'ha5)),
                      (~^reg80[(4'hb):(2'h2)])});
              reg82 <= reg78;
            end
          else
            begin
              reg78 <= $unsigned((($unsigned($unsigned(wire76)) ?
                      (wire74 && $unsigned(reg80)) : wire74) ?
                  (~((reg78 ~^ reg79) ?
                      {wire72} : (wire74 ^ reg82))) : $unsigned($unsigned((~|(7'h43))))));
              reg79 <= $signed($signed(((((8'ha7) ^ wire76) || $unsigned(wire73)) >> $signed($unsigned(wire76)))));
              reg80 <= (wire77 - ($signed(reg82[(4'h8):(3'h6)]) && wire74));
              reg81 <= $signed(((8'hb5) && wire77));
            end
          reg83 <= (wire73 - (($signed(reg81) << $unsigned(reg82)) & reg80));
          if ($signed(((~&($unsigned(wire73) && (wire73 - reg83))) ?
              (8'hb5) : (^~{$unsigned(reg79)}))))
            begin
              reg84 <= {({(~&(reg82 && (8'hbc))), reg80} ?
                      (($signed(reg79) ?
                          $unsigned(reg81) : (~|(8'h9e))) < ((wire74 >>> reg79) ?
                          (~|wire75) : reg79[(2'h3):(2'h2)])) : {{(reg78 < reg80)},
                          (((8'hb8) ? reg79 : reg78) & $unsigned(wire72))}),
                  ((reg78[(1'h0):(1'h0)] ?
                      reg82 : (&$signed(wire72))) + (~$unsigned((wire73 ?
                      wire73 : wire76))))};
              reg85 <= $unsigned(reg82);
              reg86 <= reg79[(2'h3):(2'h2)];
              reg87 <= (wire72[(5'h14):(2'h3)] ?
                  $signed($signed($unsigned($unsigned(wire75)))) : wire77[(3'h4):(2'h3)]);
            end
          else
            begin
              reg84 <= wire72;
              reg85 <= ($signed((~reg84)) ?
                  (~|(({reg82} | $unsigned(reg79)) >= $unsigned(((8'hb1) ?
                      reg85 : (8'hbb))))) : (wire73[(1'h0):(1'h0)] && reg80));
              reg86 <= $signed(($unsigned(($signed((8'ha9)) ?
                  (reg86 ?
                      reg82 : reg82) : reg86)) <<< $unsigned(((+wire75) >= (^~reg78)))));
              reg87 <= $unsigned($signed($unsigned((reg79 | wire76[(3'h5):(2'h2)]))));
              reg88 <= (reg83 == ({((8'hbf) << (&reg78)),
                  wire77} ^~ reg83[(3'h4):(1'h0)]));
            end
        end
      if ((((~|((reg88 << reg81) >>> (reg88 | reg84))) ?
          {$unsigned(reg86)} : reg82[(2'h3):(2'h3)]) + (^~(($unsigned(reg79) != wire77[(4'hb):(4'h8)]) ?
          (|reg81) : reg83))))
        begin
          reg89 <= wire74;
        end
      else
        begin
          if (((wire75 ?
              {{(reg89 ? wire76 : reg80)},
                  (reg82[(2'h2):(1'h0)] ?
                      reg82[(4'ha):(3'h4)] : {reg81})} : reg78) << $unsigned(reg82)))
            begin
              reg89 <= ({(reg88[(2'h3):(1'h0)] ?
                      ((8'hb0) + (reg81 ?
                          (7'h40) : reg89)) : (reg85 >= reg82[(4'h9):(1'h1)]))} == ((reg79 ?
                  $unsigned($signed(reg83)) : $unsigned(reg88[(2'h3):(1'h1)])) != (($signed(reg86) ?
                  $signed(reg87) : reg82[(3'h4):(2'h2)]) ^~ ((wire73 ?
                      reg79 : reg81) ?
                  (reg81 ? wire75 : reg88) : reg87))));
              reg90 <= $unsigned((($signed(reg81[(3'h4):(1'h0)]) ?
                  (|(wire73 <<< reg87)) : reg82[(4'h9):(3'h5)]) == reg81[(3'h6):(3'h5)]));
              reg91 <= reg81;
            end
          else
            begin
              reg89 <= reg79[(4'hf):(3'h4)];
            end
          reg92 <= ($signed($unsigned(($unsigned(reg84) | (reg91 ?
                  wire76 : reg79)))) ?
              wire73[(4'h8):(3'h6)] : (!((^$signed((8'ha3))) ?
                  (reg83 - reg85[(1'h1):(1'h0)]) : (wire76 && $unsigned((8'hba))))));
        end
      reg93 <= wire73[(4'h8):(3'h7)];
      if (reg78)
        begin
          if (wire72[(5'h11):(3'h4)])
            begin
              reg94 <= $unsigned((reg83[(2'h3):(2'h2)] << {($signed(reg91) & {reg81,
                      wire73}),
                  (|(reg78 ? (8'hb5) : (8'hab)))}));
              reg95 <= (|wire74);
              reg96 <= (8'hb1);
              reg97 <= (~|$unsigned(reg80));
              reg98 <= (reg96[(1'h0):(1'h0)] - $signed({$unsigned($signed(reg79)),
                  $unsigned($signed(reg90))}));
            end
          else
            begin
              reg94 <= ((8'ha3) ?
                  (~|$signed((reg88 & wire77))) : ((~&reg96[(4'h9):(3'h6)]) ?
                      (reg93 * ((^~wire74) << (reg86 ?
                          wire72 : wire73))) : $unsigned(wire74[(4'he):(4'he)])));
              reg95 <= reg79;
            end
        end
      else
        begin
          if (($signed((((~reg86) ?
                  $signed(reg82) : $unsigned(reg97)) <= $unsigned(reg88))) ?
              $unsigned($signed($signed($signed((8'ha6))))) : {($signed(reg94[(2'h2):(2'h2)]) ?
                      wire72[(5'h14):(2'h2)] : (&$unsigned(reg89)))}))
            begin
              reg94 <= reg93;
            end
          else
            begin
              reg94 <= {(^reg97[(3'h7):(2'h2)])};
              reg95 <= (~|$signed($unsigned({(8'haa), wire73[(2'h2):(2'h2)]})));
              reg96 <= reg97[(2'h2):(1'h0)];
            end
          if (reg97[(3'h7):(3'h5)])
            begin
              reg97 <= (!$signed((~|(!(reg91 <= reg86)))));
              reg98 <= (~reg96[(1'h1):(1'h0)]);
              reg99 <= reg96[(1'h0):(1'h0)];
              reg100 <= (^~((({reg82, wire72} ?
                      (wire73 >= wire72) : (reg89 ^~ wire73)) ?
                  reg96[(1'h1):(1'h1)] : (reg97 ?
                      $signed(reg96) : $unsigned(reg80))) - wire74[(3'h6):(3'h5)]));
            end
          else
            begin
              reg97 <= reg78;
              reg98 <= reg78;
              reg99 <= (8'hb7);
              reg100 <= wire77[(4'h8):(3'h5)];
            end
          reg101 <= reg84;
          reg102 <= ((+(~|$signed((reg91 ? reg79 : reg88)))) ?
              reg99 : ({$signed({reg89})} ? (~reg87) : reg85));
          if (reg79[(4'hf):(1'h1)])
            begin
              reg103 <= ((wire74 >>> (~&$signed((-wire73)))) ?
                  {(8'h9e)} : reg95);
              reg104 <= (((^(^reg79[(5'h10):(2'h2)])) ?
                  reg100[(3'h5):(3'h4)] : (^~reg89)) + reg86[(3'h7):(1'h0)]);
            end
          else
            begin
              reg103 <= $signed(reg99[(3'h7):(3'h6)]);
              reg104 <= reg100;
            end
        end
    end
  assign wire105 = reg91;
  assign wire106 = reg83[(2'h3):(2'h3)];
  assign wire107 = reg96;
  assign wire108 = wire73;
  assign wire109 = wire75;
  assign wire110 = {(reg96 + ($unsigned($signed(reg80)) <= {{reg79}})),
                       $signed((8'hb3))};
  assign wire111 = reg96[(4'hb):(3'h4)];
  assign wire112 = {(|(({reg79, wire111} + wire75) ?
                           ($unsigned(reg80) <= (reg92 ?
                               reg80 : wire72)) : ({reg82} ?
                               (wire111 <<< reg104) : (wire111 ?
                                   (8'hb6) : reg91))))};
  assign wire113 = $signed($signed((-$signed($unsigned(reg102)))));
  assign wire114 = $signed((&((-reg98[(3'h6):(2'h3)]) ?
                       (reg88[(3'h6):(1'h1)] <<< (reg103 ?
                           reg93 : wire73)) : reg91)));
  assign wire115 = {wire113,
                       (^(((~reg84) >> reg100[(2'h3):(1'h1)]) ?
                           wire111 : (~&((8'hbb) | wire74))))};
  assign wire116 = (~&(~reg78));
  assign wire117 = (^~wire113);
endmodule

module module196
#(parameter param227 = {({((7'h42) ~^ {(7'h43), (8'ha5)})} < (~^(|((8'hb7) >>> (8'hb5))))), (~(((&(8'hbe)) > ((8'ha7) ? (8'hb4) : (8'hbb))) + (((8'hae) >= (8'ha3)) ? {(8'hbc), (8'hb8)} : (^(8'hb1)))))})
(y, clk, wire200, wire199, wire198, wire197);
  output wire [(32'h10b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire200;
  input wire signed [(4'ha):(1'h0)] wire199;
  input wire [(4'hd):(1'h0)] wire198;
  input wire signed [(5'h11):(1'h0)] wire197;
  wire signed [(4'ha):(1'h0)] wire226;
  wire [(5'h12):(1'h0)] wire225;
  wire signed [(4'hc):(1'h0)] wire224;
  wire [(3'h6):(1'h0)] wire223;
  wire [(5'h12):(1'h0)] wire222;
  wire signed [(3'h6):(1'h0)] wire209;
  wire signed [(2'h2):(1'h0)] wire208;
  wire signed [(3'h5):(1'h0)] wire207;
  wire signed [(4'hb):(1'h0)] wire206;
  wire [(4'h8):(1'h0)] wire205;
  wire signed [(5'h14):(1'h0)] wire204;
  wire [(3'h7):(1'h0)] wire203;
  wire [(3'h4):(1'h0)] wire202;
  wire [(5'h12):(1'h0)] wire201;
  reg signed [(4'hb):(1'h0)] reg221 = (1'h0);
  reg [(2'h2):(1'h0)] reg220 = (1'h0);
  reg [(4'hc):(1'h0)] reg219 = (1'h0);
  reg [(4'h8):(1'h0)] reg218 = (1'h0);
  reg [(4'he):(1'h0)] reg217 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg216 = (1'h0);
  reg [(5'h13):(1'h0)] reg215 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg214 = (1'h0);
  reg [(4'ha):(1'h0)] reg213 = (1'h0);
  reg [(4'he):(1'h0)] reg212 = (1'h0);
  reg [(5'h11):(1'h0)] reg211 = (1'h0);
  reg [(3'h4):(1'h0)] reg210 = (1'h0);
  assign y = {wire226,
                 wire225,
                 wire224,
                 wire223,
                 wire222,
                 wire209,
                 wire208,
                 wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 (1'h0)};
  assign wire201 = ($signed(((wire200[(3'h5):(1'h1)] <<< wire197[(5'h11):(3'h5)]) ?
                           $signed((wire199 ?
                               wire199 : wire197)) : $unsigned({wire198,
                               wire198}))) ?
                       wire198[(2'h2):(1'h0)] : $unsigned($signed(($signed(wire197) && (~&wire199)))));
  assign wire202 = $unsigned(wire201[(1'h0):(1'h0)]);
  assign wire203 = wire198[(1'h0):(1'h0)];
  assign wire204 = $unsigned($unsigned((^~$unsigned((|(8'hb3))))));
  assign wire205 = (wire204[(4'hb):(4'h8)] < (+wire203));
  assign wire206 = ($unsigned(wire204) >> (wire197 <= $signed($unsigned((wire198 ?
                       (7'h42) : wire203)))));
  assign wire207 = wire198[(4'h9):(3'h7)];
  assign wire208 = wire198;
  assign wire209 = $signed(wire203);
  always
    @(posedge clk) begin
      reg210 <= wire203[(3'h6):(1'h0)];
      if (reg210)
        begin
          reg211 <= wire199;
          reg212 <= (!(^$signed(wire197)));
          reg213 <= $signed(wire206[(2'h3):(2'h2)]);
          reg214 <= (~^$unsigned($unsigned({$unsigned(wire204)})));
        end
      else
        begin
          reg211 <= wire206;
          reg212 <= wire197[(2'h2):(1'h0)];
        end
      if ((8'hbb))
        begin
          reg215 <= ((reg213[(1'h0):(1'h0)] >> (^$unsigned(reg212[(2'h2):(2'h2)]))) | (wire202[(1'h1):(1'h0)] != $unsigned((wire207 ?
              $signed(reg212) : wire208[(1'h1):(1'h1)]))));
          if (((|($unsigned((wire209 ?
              wire199 : reg211)) - {(wire203 >> wire200),
              $unsigned(wire207)})) >> (($unsigned($unsigned((8'hb0))) ?
                  ((~^reg210) >> $signed(wire197)) : wire207[(3'h4):(2'h2)]) ?
              (&{wire200}) : (|reg211))))
            begin
              reg216 <= (^{reg211[(5'h11):(5'h11)],
                  $signed(wire204[(4'hf):(3'h7)])});
              reg217 <= wire206;
            end
          else
            begin
              reg216 <= (~|wire203[(2'h2):(1'h1)]);
            end
        end
      else
        begin
          reg215 <= $unsigned($signed({$unsigned(((8'ha2) > wire207))}));
          reg216 <= (&(~|$signed(wire200[(3'h4):(1'h0)])));
          reg217 <= (~&((wire205[(1'h1):(1'h1)] ?
              wire208 : ((wire206 || (8'hb8)) ?
                  wire204 : wire201)) ^ (|$signed((wire207 || wire205)))));
          reg218 <= (~|$unsigned($signed(($unsigned((8'ha6)) ?
              wire206[(4'h9):(3'h7)] : wire200))));
          if (((wire209 ?
              ({wire203} ?
                  (8'ha9) : wire206[(4'h8):(3'h7)]) : $unsigned(($signed(wire200) ?
                  wire197[(2'h3):(1'h1)] : {(8'h9d)}))) * wire209))
            begin
              reg219 <= $unsigned($signed(((^(reg213 * reg216)) ~^ $unsigned(wire197))));
              reg220 <= $unsigned((reg211 ?
                  $signed((((8'hb5) - (8'hb8)) ?
                      wire208 : {reg217, wire205})) : ((reg210 ?
                      $unsigned(reg210) : (reg217 ?
                          wire206 : reg216)) ^ (~^(wire200 > wire203)))));
            end
          else
            begin
              reg219 <= ((^reg217[(3'h5):(1'h0)]) >> (8'hb6));
            end
        end
      reg221 <= $signed(((^((reg219 ?
          wire204 : reg215) * reg218[(3'h6):(2'h3)])) >= $unsigned((reg212 << $signed(wire207)))));
    end
  assign wire222 = wire200;
  assign wire223 = $signed(wire199[(4'h9):(3'h7)]);
  assign wire224 = ((~&$unsigned($signed((|reg214)))) ?
                       (reg215[(4'h9):(3'h5)] ?
                           $signed({wire223[(1'h0):(1'h0)],
                               {reg210}}) : wire198[(3'h6):(3'h6)]) : $unsigned(reg221));
  assign wire225 = (8'had);
  assign wire226 = (((((wire203 ?
                           reg219 : reg218) ^~ wire206[(2'h2):(1'h1)]) < $signed($unsigned(wire224))) ?
                       $signed((reg216[(3'h6):(3'h5)] ?
                           (~^wire204) : $unsigned(wire200))) : (wire205 == ((wire207 >= reg218) + {wire204,
                           (8'h9c)}))) + ((-{$unsigned(wire207),
                           ((8'ha8) ? wire223 : wire206)}) ?
                       $signed({$unsigned((8'hba)),
                           $signed((8'hbc))}) : ($signed(wire204) ?
                           wire224[(4'ha):(3'h4)] : $signed($unsigned(wire225)))));
endmodule

module module173  (y, clk, wire177, wire176, wire175, wire174);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire177;
  input wire [(3'h4):(1'h0)] wire176;
  input wire signed [(4'ha):(1'h0)] wire175;
  input wire signed [(3'h5):(1'h0)] wire174;
  wire [(3'h4):(1'h0)] wire186;
  wire signed [(4'hd):(1'h0)] wire185;
  wire signed [(4'h9):(1'h0)] wire184;
  wire signed [(5'h10):(1'h0)] wire183;
  wire [(2'h2):(1'h0)] wire182;
  wire signed [(2'h3):(1'h0)] wire181;
  wire [(3'h5):(1'h0)] wire178;
  reg [(4'he):(1'h0)] reg180 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg179 = (1'h0);
  assign y = {wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire178,
                 reg180,
                 reg179,
                 (1'h0)};
  assign wire178 = wire177[(3'h5):(2'h3)];
  always
    @(posedge clk) begin
      reg179 <= wire174;
      reg180 <= (wire176 > {wire176[(2'h3):(2'h3)], wire176[(1'h1):(1'h0)]});
    end
  assign wire181 = wire175[(3'h7):(3'h6)];
  assign wire182 = wire176[(2'h3):(1'h1)];
  assign wire183 = $unsigned($signed(wire182));
  assign wire184 = $signed(($signed(wire174) & wire183));
  assign wire185 = wire181[(2'h3):(1'h0)];
  assign wire186 = wire181;
endmodule
