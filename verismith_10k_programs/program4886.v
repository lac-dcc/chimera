module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h23b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire213;
  wire signed [(3'h6):(1'h0)] wire212;
  wire signed [(3'h4):(1'h0)] wire199;
  wire [(3'h4):(1'h0)] wire198;
  wire [(3'h5):(1'h0)] wire197;
  wire signed [(5'h15):(1'h0)] wire189;
  wire [(5'h10):(1'h0)] wire188;
  wire [(4'hd):(1'h0)] wire187;
  wire signed [(4'hb):(1'h0)] wire186;
  wire [(3'h4):(1'h0)] wire184;
  wire signed [(5'h13):(1'h0)] wire29;
  wire signed [(5'h11):(1'h0)] wire28;
  wire signed [(2'h2):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire4;
  reg signed [(5'h11):(1'h0)] reg211 = (1'h0);
  reg [(2'h2):(1'h0)] reg210 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg209 = (1'h0);
  reg signed [(4'he):(1'h0)] reg208 = (1'h0);
  reg [(3'h4):(1'h0)] reg207 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg206 = (1'h0);
  reg [(5'h10):(1'h0)] reg205 = (1'h0);
  reg [(2'h3):(1'h0)] reg204 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg203 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg202 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg201 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg200 = (1'h0);
  reg [(4'he):(1'h0)] reg196 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg195 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg194 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg193 = (1'h0);
  reg [(4'hc):(1'h0)] reg192 = (1'h0);
  reg [(3'h5):(1'h0)] reg191 = (1'h0);
  reg [(5'h12):(1'h0)] reg190 = (1'h0);
  reg [(4'hb):(1'h0)] reg6 = (1'h0);
  reg signed [(4'he):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  assign y = {wire213,
                 wire212,
                 wire199,
                 wire198,
                 wire197,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire184,
                 wire29,
                 wire28,
                 wire5,
                 wire4,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg6,
                 reg7,
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
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 (1'h0)};
  assign wire4 = $unsigned(wire0);
  assign wire5 = ((({(wire1 ?
                             wire4 : wire1)} || $signed($unsigned(wire4))) || $signed($unsigned($unsigned(wire0)))) ?
                     wire4 : ($signed((wire2 ? (wire1 - wire0) : wire4)) ?
                         (^~(7'h44)) : wire1));
  always
    @(posedge clk) begin
      if (wire5)
        begin
          if ({$unsigned($signed((8'ha8))), $signed((-(8'hb4)))})
            begin
              reg6 <= wire0;
              reg7 <= (~|wire4);
              reg8 <= ({((~|$signed(wire0)) ? reg6[(1'h0):(1'h0)] : wire2)} ?
                  ((^wire3) < wire5[(2'h2):(1'h1)]) : (~wire3[(4'ha):(1'h0)]));
              reg9 <= $signed((~($unsigned($signed(reg7)) ?
                  $signed($unsigned(reg6)) : reg6[(3'h5):(1'h0)])));
              reg10 <= reg7;
            end
          else
            begin
              reg6 <= $signed(wire1[(2'h3):(2'h2)]);
            end
          reg11 <= $unsigned((8'haf));
          reg12 <= wire4[(1'h0):(1'h0)];
        end
      else
        begin
          reg6 <= (((&((|wire0) ? (wire2 ? (8'h9e) : reg6) : (7'h42))) ?
              (-((wire4 >>> reg6) ?
                  (reg11 ^~ reg6) : reg9[(3'h4):(1'h0)])) : (($signed(reg10) ?
                  (reg9 ?
                      reg11 : wire3) : $signed((8'hac))) - ($unsigned(wire2) < (~&wire0)))) || {$signed((~(~wire3)))});
          reg7 <= $unsigned({(!reg10[(3'h4):(2'h3)])});
          reg8 <= ($unsigned($signed($signed($signed(wire1)))) ?
              wire0 : ($unsigned($unsigned($signed(wire4))) ?
                  reg9[(2'h3):(1'h1)] : wire1));
          reg9 <= ((!$unsigned($unsigned({(8'ha0), (8'hb6)}))) ?
              $signed((^~{$unsigned(reg9)})) : (((reg11 ?
                          $unsigned(reg10) : wire3) ?
                      ({reg11, wire5} || (reg11 << reg7)) : wire4) ?
                  (-(wire3[(5'h13):(5'h12)] * {reg9,
                      reg6})) : ($unsigned((^reg8)) ~^ {$signed(reg8)})));
          reg10 <= $signed($signed($unsigned($unsigned($signed((7'h43))))));
        end
      if ($signed($unsigned(wire4)))
        begin
          if ((8'hb6))
            begin
              reg13 <= $signed($unsigned(($unsigned((~|reg8)) >= ((reg6 != wire5) ?
                  ((8'haf) ? wire3 : reg9) : {wire3}))));
              reg14 <= ((wire2[(2'h3):(1'h0)] | ($unsigned($signed(wire1)) ?
                  (8'hb0) : reg6)) != (~&$unsigned(((wire0 ?
                      (8'ha1) : (8'hb4)) ?
                  $unsigned(reg9) : (reg7 ? wire5 : wire2)))));
              reg15 <= (reg10 | reg10);
              reg16 <= ((!(((reg8 ?
                  wire3 : wire5) <= wire5[(2'h2):(1'h1)]) >= (wire0 | (reg9 ?
                  wire0 : reg9)))) ^ ((!{(!reg14)}) && $unsigned(wire4[(1'h0):(1'h0)])));
              reg17 <= (8'ha1);
            end
          else
            begin
              reg13 <= (reg16[(3'h4):(1'h0)] ?
                  reg6[(2'h2):(1'h0)] : ((((reg11 ? reg15 : reg7) <<< (reg17 ?
                              reg16 : reg14)) ?
                          (~&(~|reg17)) : (((8'hb3) & wire4) >> $signed(reg10))) ?
                      $unsigned(reg11[(3'h7):(1'h1)]) : reg10));
              reg14 <= $signed(reg7);
              reg15 <= wire0;
              reg16 <= ($signed({(8'h9d)}) <<< reg6);
            end
          if ({$unsigned($unsigned({reg9[(3'h5):(3'h4)], $signed((8'ha3))})),
              wire0})
            begin
              reg18 <= {{$signed(((-(8'hbf)) ? reg8 : (7'h44)))},
                  $unsigned(($unsigned($unsigned(reg14)) ?
                      $unsigned((wire4 ~^ (8'h9c))) : (~(wire0 ?
                          wire2 : reg11))))};
              reg19 <= wire1;
              reg20 <= (reg10[(3'h4):(2'h3)] << $signed(($unsigned($unsigned(reg15)) ^ reg19)));
            end
          else
            begin
              reg18 <= reg19[(3'h4):(1'h1)];
              reg19 <= ((^~{reg17, $signed((wire2 - reg9))}) ?
                  $unsigned(wire3) : (reg8[(3'h5):(1'h0)] >> $unsigned(reg6[(3'h5):(3'h4)])));
              reg20 <= $signed(reg14);
              reg21 <= wire0;
              reg22 <= $signed(wire0);
            end
          if (wire3)
            begin
              reg23 <= reg19;
              reg24 <= reg10[(3'h4):(1'h0)];
              reg25 <= (reg23[(2'h2):(2'h2)] ?
                  ($unsigned((!reg12[(3'h4):(2'h3)])) ~^ (~&reg10)) : (8'hb0));
              reg26 <= $signed({($signed($unsigned((8'ha1))) <= wire0)});
              reg27 <= (~&reg22);
            end
          else
            begin
              reg23 <= {($unsigned(($signed(reg19) ?
                          (reg8 ? reg8 : wire5) : (reg17 <= (7'h43)))) ?
                      $signed($unsigned(((8'ha7) ? reg26 : reg14))) : (8'ha9)),
                  {(~^reg27)}};
              reg24 <= ({(reg9[(3'h7):(3'h5)] ?
                      (reg8 ?
                          (reg12 != reg27) : ((7'h41) < reg16)) : ((~^reg13) < (reg9 ?
                          wire0 : reg25))),
                  reg21} - $signed(reg14[(5'h13):(3'h7)]));
              reg25 <= reg8[(3'h7):(1'h0)];
              reg26 <= wire0[(2'h2):(2'h2)];
              reg27 <= reg8;
            end
        end
      else
        begin
          reg13 <= wire4[(3'h4):(1'h1)];
          reg14 <= $signed(wire2[(2'h3):(1'h0)]);
          if ($unsigned(wire5[(1'h1):(1'h0)]))
            begin
              reg15 <= wire0;
              reg16 <= (!reg9[(3'h6):(2'h3)]);
              reg17 <= ($unsigned((((-reg12) ?
                  wire2 : $signed(wire1)) > (&(reg21 ?
                  (8'hb4) : reg18)))) <= ($signed((~&(reg26 || (8'h9c)))) ?
                  $unsigned({$unsigned(wire5)}) : wire3));
              reg18 <= (wire1 ~^ (~|$signed(((reg27 < reg20) ?
                  {reg27, (8'hb5)} : $signed(reg17)))));
            end
          else
            begin
              reg15 <= {(8'hae)};
              reg16 <= (reg14 - wire5[(2'h2):(1'h1)]);
              reg17 <= (~^wire2[(1'h0):(1'h0)]);
              reg18 <= (reg9[(4'h9):(1'h1)] > reg7[(3'h7):(3'h7)]);
            end
          if ($unsigned($signed((&$signed((+wire2))))))
            begin
              reg19 <= reg16[(5'h14):(5'h12)];
              reg20 <= (reg23[(1'h1):(1'h1)] ?
                  reg24[(1'h0):(1'h0)] : $unsigned((8'hbe)));
            end
          else
            begin
              reg19 <= ((8'hac) ?
                  (reg23 && $signed($unsigned(wire1[(2'h2):(1'h0)]))) : (reg26 == $unsigned(($unsigned(wire5) > (!reg14)))));
              reg20 <= reg20;
              reg21 <= ((!reg7[(3'h6):(2'h3)]) ?
                  (!($signed((reg11 ? (8'ha4) : reg20)) ?
                      reg21[(1'h0):(1'h0)] : reg27)) : {(reg20[(1'h1):(1'h0)] ?
                          (~(-reg13)) : wire5[(2'h2):(1'h1)])});
              reg22 <= (|$signed(((reg15[(1'h1):(1'h0)] ?
                      reg16 : reg20[(2'h2):(1'h0)]) ?
                  {(~wire0), {reg15}} : ((&reg15) ? (~reg21) : (-reg10)))));
              reg23 <= (~(reg27[(1'h1):(1'h0)] <= reg20));
            end
        end
    end
  assign wire28 = $unsigned($signed($signed(reg19)));
  assign wire29 = ((wire5[(1'h1):(1'h0)] ?
                      $signed({reg19[(3'h5):(2'h3)],
                          reg25}) : (&((reg25 >> reg24) ~^ reg21))) == $signed($signed((^reg13))));
  module30 #() modinst185 (wire184, clk, wire3, wire2, reg25, reg27, reg13);
  assign wire186 = $unsigned($unsigned($signed(wire0)));
  assign wire187 = {$unsigned($signed(((reg13 ? reg9 : reg22) ?
                           $unsigned(wire186) : reg27)))};
  assign wire188 = reg16;
  assign wire189 = (~&(|wire3[(3'h6):(2'h3)]));
  always
    @(posedge clk) begin
      reg190 <= reg6[(4'ha):(1'h1)];
      reg191 <= reg18[(3'h4):(1'h0)];
      if (wire28)
        begin
          reg192 <= (-reg20);
        end
      else
        begin
          reg192 <= wire187[(1'h0):(1'h0)];
          reg193 <= $signed(reg7);
          reg194 <= wire186;
        end
      reg195 <= ($signed(((reg16 ?
              wire189[(5'h10):(3'h5)] : reg190[(3'h6):(1'h0)]) != (reg25[(3'h6):(3'h5)] ?
              {reg17, wire29} : (reg16 ? wire184 : (7'h40))))) ?
          (wire3 ?
              (wire189 ?
                  reg20[(4'h9):(3'h6)] : $unsigned((reg6 <= (8'had)))) : $signed((8'ha5))) : (((|(|(8'haf))) ?
              ($signed(wire4) | reg27[(1'h0):(1'h0)]) : reg27[(4'ha):(4'h9)]) * wire5));
    end
  always
    @(posedge clk) begin
      reg196 <= reg24[(2'h2):(1'h1)];
    end
  assign wire197 = reg26;
  assign wire198 = $unsigned((!(({reg24, reg9} ?
                           reg15[(1'h1):(1'h1)] : {reg15, (8'hb5)}) ?
                       (~reg22) : $signed((~&wire2)))));
  assign wire199 = ($signed(((((8'h9e) <= reg192) ?
                           $unsigned((8'hbc)) : $unsigned(reg192)) ?
                       (7'h40) : reg7[(3'h4):(3'h4)])) < $signed(reg23[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg200 <= {reg193};
      reg201 <= wire198[(1'h0):(1'h0)];
      reg202 <= wire28[(3'h4):(2'h3)];
      reg203 <= ($unsigned(($unsigned(wire188) ?
              (~&reg26) : (reg196 <<< (wire0 ? reg8 : reg190)))) ?
          (^($unsigned((&wire198)) ?
              reg13 : (wire2[(4'hb):(3'h7)] ?
                  (8'ha7) : (reg202 & wire29)))) : $signed({$unsigned((reg14 ?
                  wire4 : wire184)),
              wire198[(2'h3):(2'h2)]}));
      if ($signed((~|{$unsigned((wire1 ? reg201 : (8'ha5)))})))
        begin
          reg204 <= (reg10 ?
              ($unsigned(reg203[(4'hf):(4'h8)]) - (reg195[(2'h3):(2'h3)] ?
                  reg24[(1'h1):(1'h1)] : $unsigned(((8'haa) & reg6)))) : wire28[(2'h2):(1'h1)]);
          if (wire187[(4'hc):(2'h2)])
            begin
              reg205 <= reg201;
              reg206 <= (~(+(!(|(reg194 | wire29)))));
            end
          else
            begin
              reg205 <= (~|reg195[(2'h2):(1'h0)]);
              reg206 <= $signed(($signed(reg194) >> (^wire1[(4'hb):(2'h3)])));
              reg207 <= {(((~^(~^reg24)) ?
                          (|(reg195 >= (8'h9f))) : ((reg21 ?
                              wire199 : (8'haf)) != (reg206 ?
                              wire197 : reg192))) ?
                      ((reg204[(2'h3):(1'h0)] < reg8[(4'hd):(3'h7)]) ?
                          ((~^reg10) >>> reg7[(3'h4):(2'h2)]) : reg194[(3'h6):(2'h2)]) : $signed({$unsigned(wire188)}))};
            end
          if ($unsigned(reg13[(3'h4):(3'h4)]))
            begin
              reg208 <= (reg8[(1'h0):(1'h0)] ?
                  {(wire197[(2'h3):(2'h3)] + (reg16[(4'ha):(3'h6)] ?
                          $unsigned(reg14) : wire28[(4'ha):(3'h7)]))} : reg15);
              reg209 <= wire3;
            end
          else
            begin
              reg208 <= (~&(!(~{(~wire198), reg193[(3'h5):(2'h2)]})));
              reg209 <= $signed($signed((reg24[(1'h1):(1'h1)] ?
                  $signed($unsigned(wire188)) : $signed((reg194 != (8'ha5))))));
              reg210 <= (reg12[(3'h6):(3'h4)] ^~ ((reg201 ?
                      wire5[(1'h0):(1'h0)] : $signed((~^reg208))) ?
                  reg27 : {reg205}));
            end
          reg211 <= $unsigned((&$unsigned({$signed(reg209)})));
        end
      else
        begin
          if ((wire187 ?
              reg8[(2'h2):(1'h0)] : $unsigned($unsigned($unsigned((8'hb3))))))
            begin
              reg204 <= ((~(|(reg195 | (8'hae)))) ?
                  $signed(reg201) : $unsigned((((reg210 ? (8'ha8) : reg22) ?
                      reg7 : $signed(reg10)) <<< $unsigned(reg22))));
              reg205 <= (^~reg206[(3'h4):(2'h2)]);
            end
          else
            begin
              reg204 <= wire199;
              reg205 <= (+$unsigned(reg211));
            end
          reg206 <= ((&$signed((|reg190))) ?
              ({$signed($signed(reg19))} ^~ ((8'ha8) ?
                  wire0 : $unsigned($unsigned(reg210)))) : (~^$signed(({wire4,
                      reg18} ?
                  (|(8'hac)) : {reg8, (8'ha6)}))));
          reg207 <= {(wire197 ? reg200 : $signed(reg22[(3'h5):(1'h1)]))};
          reg208 <= ((({(~reg19)} >>> wire199[(2'h2):(2'h2)]) ?
              (+reg193[(2'h2):(1'h0)]) : ((wire198 == $unsigned(reg192)) & (!$signed((8'ha5))))) ~^ (~|$unsigned(reg9[(3'h6):(1'h0)])));
          reg209 <= $unsigned($unsigned((reg201[(3'h6):(1'h1)] > {(reg17 ?
                  wire199 : (8'hb0))})));
        end
    end
  assign wire212 = reg10;
  assign wire213 = ((reg210 ?
                       ((8'hb5) | $signed($signed(reg209))) : (!$signed({reg190}))) || wire5);
endmodule

module module30
#(parameter param182 = ((&((((8'ha9) ? (8'hbb) : (8'h9f)) ? ((8'ha1) <<< (8'hbd)) : ((8'h9d) || (8'h9f))) ? (~&((8'hb8) ? (8'h9e) : (7'h43))) : (((7'h43) ? (8'hac) : (8'hb8)) < (+(8'hab))))) ? ((~^(7'h43)) ? (~^{((8'ha6) ? (8'hb2) : (8'hbd))}) : {(|{(8'ha7), (8'ha5)})}) : {((((8'ha6) || (8'hb1)) >>> (+(8'ha9))) ? ({(8'ha6), (8'hb9)} ? ((8'h9e) ? (8'ha9) : (8'hbf)) : ((8'hba) ? (8'ha1) : (8'hbb))) : ((^~(8'hb0)) <= ((7'h43) ? (8'hb0) : (8'ha1)))), ({{(8'h9f)}, ((8'hae) ? (8'hb5) : (8'had))} <= {(&(8'ha7)), ((8'hab) << (8'h9d))})}), 
parameter param183 = (&param182))
(y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'h14a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire35;
  input wire signed [(4'hc):(1'h0)] wire34;
  input wire signed [(4'hd):(1'h0)] wire33;
  input wire [(5'h14):(1'h0)] wire32;
  input wire signed [(5'h10):(1'h0)] wire31;
  wire signed [(4'h8):(1'h0)] wire181;
  wire signed [(5'h13):(1'h0)] wire179;
  wire signed [(3'h5):(1'h0)] wire157;
  wire [(5'h10):(1'h0)] wire156;
  wire signed [(4'hd):(1'h0)] wire154;
  wire signed [(5'h13):(1'h0)] wire111;
  wire [(3'h4):(1'h0)] wire110;
  wire [(4'hc):(1'h0)] wire108;
  wire [(5'h15):(1'h0)] wire90;
  wire [(4'hf):(1'h0)] wire89;
  wire [(5'h12):(1'h0)] wire87;
  wire [(5'h11):(1'h0)] wire36;
  reg signed [(5'h11):(1'h0)] reg92 = (1'h0);
  reg [(5'h14):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg159 = (1'h0);
  reg [(4'hd):(1'h0)] reg160 = (1'h0);
  reg [(4'hc):(1'h0)] reg161 = (1'h0);
  reg [(3'h7):(1'h0)] reg162 = (1'h0);
  reg [(5'h14):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg165 = (1'h0);
  assign y = {wire181,
                 wire179,
                 wire157,
                 wire156,
                 wire154,
                 wire111,
                 wire110,
                 wire108,
                 wire90,
                 wire89,
                 wire87,
                 wire36,
                 reg92,
                 reg91,
                 reg158,
                 reg159,
                 reg160,
                 reg161,
                 reg162,
                 reg163,
                 reg164,
                 reg165,
                 (1'h0)};
  assign wire36 = wire32;
  module37 #() modinst88 (.wire39(wire31), .wire40(wire36), .wire38(wire32), .wire41(wire35), .clk(clk), .y(wire87));
  assign wire89 = (!(~&wire35));
  assign wire90 = $unsigned({wire87[(4'h9):(3'h7)], wire31});
  always
    @(posedge clk) begin
      reg91 <= ({(~|wire33[(1'h0):(1'h0)])} ?
          (8'hbc) : $signed(($signed((wire87 & (8'ha5))) & $signed((wire90 ?
              wire31 : wire87)))));
      reg92 <= (+$signed($unsigned(wire90)));
    end
  module93 #() modinst109 (wire108, clk, wire33, reg91, wire32, wire89, wire34);
  assign wire110 = $unsigned(((wire31[(4'hd):(3'h6)] ?
                           $unsigned((wire89 ?
                               reg91 : (8'haa))) : $unsigned(wire108)) ?
                       wire34 : $unsigned($signed($unsigned((8'hb8))))));
  assign wire111 = wire110[(2'h3):(2'h2)];
  module112 #() modinst155 (.wire116(wire36), .wire113(wire31), .wire115(wire33), .y(wire154), .clk(clk), .wire114(wire32));
  assign wire156 = $unsigned(wire33[(1'h1):(1'h1)]);
  assign wire157 = (wire36[(1'h0):(1'h0)] > {$signed((8'hbf)),
                       $signed(wire154)});
  always
    @(posedge clk) begin
      if ((($signed((^(wire90 > wire33))) ?
          $unsigned((|(wire35 ?
              (8'ha1) : wire157))) : (wire154 & reg91)) * wire87[(2'h2):(2'h2)]))
        begin
          reg158 <= ({(($unsigned(wire157) & $signed(wire34)) ^~ ((7'h40) ?
                  (|wire35) : $signed(reg92))),
              $unsigned(wire33)} << (|((~|(^wire156)) ^ wire36)));
          reg159 <= (wire87[(4'hd):(4'hd)] ?
              ((-wire35) ? $unsigned(reg91) : (8'ha3)) : wire90);
          reg160 <= ($signed(((wire32 ~^ (wire89 ?
              wire36 : wire35)) >> wire36[(3'h4):(1'h0)])) <= {((+(wire110 ?
                      wire33 : wire110)) ?
                  $unsigned((~^wire90)) : ((wire108 > wire111) > (reg91 ?
                      wire111 : wire156)))});
          reg161 <= wire32;
        end
      else
        begin
          if ($signed(reg160[(4'h9):(1'h0)]))
            begin
              reg158 <= $unsigned((^{(~|wire89), wire110}));
              reg159 <= (wire90 < (|wire90[(4'h9):(4'h9)]));
              reg160 <= (reg91 ?
                  $unsigned((~^wire110)) : (wire111 ?
                      {$unsigned(wire110),
                          ($signed(wire157) ?
                              wire36 : $signed((8'hbe)))} : wire33[(3'h4):(2'h2)]));
              reg161 <= ({$signed(((reg91 ^ reg161) ? wire87 : (~&reg160))),
                  $signed(((reg158 && wire157) ?
                      wire111 : $unsigned(reg91)))} ^ wire87[(4'hf):(3'h6)]);
            end
          else
            begin
              reg158 <= wire36;
              reg159 <= (wire35[(3'h7):(3'h5)] + ((~|reg92[(4'hc):(2'h2)]) ?
                  (wire89 ?
                      (~^(~reg161)) : $unsigned((wire89 ?
                          wire89 : wire108))) : (+$unsigned($signed(wire111)))));
              reg160 <= $signed(wire110);
            end
        end
      reg162 <= (!wire90[(3'h6):(3'h4)]);
      reg163 <= wire34[(3'h5):(1'h0)];
      reg164 <= $unsigned($unsigned($signed({(reg163 ? (8'hbe) : wire90)})));
      reg165 <= $signed(reg159[(5'h12):(4'hf)]);
    end
  module166 #() modinst180 (.wire171(wire156), .wire168(reg164), .clk(clk), .wire169(reg158), .wire167(wire32), .wire170(reg159), .y(wire179));
  assign wire181 = (($unsigned({{reg164, wire87},
                           wire33[(3'h4):(2'h3)]}) >>> $signed(reg92[(4'h9):(3'h7)])) ?
                       (+(($signed(wire87) ?
                               (reg163 > wire111) : (wire154 ?
                                   wire154 : wire87)) ?
                           (8'hae) : $unsigned((8'hab)))) : $signed((^(((8'hab) ?
                               reg161 : reg159) ?
                           (wire87 >> wire36) : {(8'ha2)}))));
endmodule

module module166
#(parameter param178 = (~^(((8'hb3) ? (((8'hbd) != (8'hae)) ? ((8'hac) ? (8'ha2) : (8'hb1)) : ((8'hba) || (8'ha8))) : (!((8'ha8) ~^ (7'h43)))) <<< (({(8'had)} ? (^~(8'hb6)) : {(8'hbe), (8'hbe)}) == (((8'hb5) ^~ (7'h44)) ? ((7'h42) ? (8'had) : (8'h9d)) : (~&(8'hbc)))))))
(y, clk, wire171, wire170, wire169, wire168, wire167);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire171;
  input wire signed [(4'hc):(1'h0)] wire170;
  input wire signed [(5'h12):(1'h0)] wire169;
  input wire signed [(4'hf):(1'h0)] wire168;
  input wire signed [(3'h5):(1'h0)] wire167;
  wire signed [(5'h11):(1'h0)] wire177;
  wire [(3'h5):(1'h0)] wire176;
  wire [(2'h3):(1'h0)] wire175;
  wire [(4'he):(1'h0)] wire174;
  wire [(4'he):(1'h0)] wire173;
  wire signed [(2'h3):(1'h0)] wire172;
  assign y = {wire177, wire176, wire175, wire174, wire173, wire172, (1'h0)};
  assign wire172 = wire171[(4'hc):(4'hb)];
  assign wire173 = wire169;
  assign wire174 = wire169;
  assign wire175 = wire167;
  assign wire176 = ($unsigned((wire174 >> {wire175[(2'h3):(1'h1)]})) << (+(($signed((8'h9e)) - wire170[(2'h2):(2'h2)]) ?
                       wire171[(3'h7):(3'h4)] : wire168[(3'h4):(2'h3)])));
  assign wire177 = {wire175};
endmodule

module module112
#(parameter param153 = ((+((!((8'ha0) ? (8'hb1) : (8'hbf))) < (((8'ha2) ? (7'h41) : (8'haa)) != {(8'hae), (8'hb5)}))) ? {(~|{((8'haf) ? (8'hb6) : (8'hab)), ((8'hb2) ? (8'ha9) : (8'hbc))}), {(~((8'hb5) << (8'hb7)))}} : (^((((8'hbc) ? (8'hb7) : (8'ha6)) >> (~^(7'h41))) ? (~&((8'ha3) + (8'hbd))) : ((7'h40) ~^ (~^(8'hb5)))))))
(y, clk, wire116, wire115, wire114, wire113);
  output wire [(32'h168):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire116;
  input wire [(3'h5):(1'h0)] wire115;
  input wire signed [(5'h14):(1'h0)] wire114;
  input wire signed [(4'hf):(1'h0)] wire113;
  wire signed [(2'h2):(1'h0)] wire152;
  wire [(2'h2):(1'h0)] wire144;
  wire signed [(5'h14):(1'h0)] wire143;
  wire signed [(4'h8):(1'h0)] wire142;
  wire signed [(4'he):(1'h0)] wire141;
  wire [(3'h5):(1'h0)] wire140;
  wire signed [(5'h11):(1'h0)] wire131;
  wire signed [(4'h8):(1'h0)] wire130;
  wire signed [(2'h3):(1'h0)] wire129;
  wire signed [(5'h13):(1'h0)] wire128;
  wire signed [(5'h15):(1'h0)] wire127;
  wire [(4'ha):(1'h0)] wire126;
  wire [(5'h12):(1'h0)] wire125;
  wire [(5'h14):(1'h0)] wire124;
  wire [(2'h2):(1'h0)] wire123;
  wire [(4'he):(1'h0)] wire117;
  reg signed [(3'h6):(1'h0)] reg151 = (1'h0);
  reg signed [(4'he):(1'h0)] reg150 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg149 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg148 = (1'h0);
  reg [(5'h14):(1'h0)] reg147 = (1'h0);
  reg [(4'hd):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg145 = (1'h0);
  reg [(4'hc):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg138 = (1'h0);
  reg [(2'h3):(1'h0)] reg137 = (1'h0);
  reg [(2'h2):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg135 = (1'h0);
  reg [(4'h9):(1'h0)] reg134 = (1'h0);
  reg [(2'h3):(1'h0)] reg133 = (1'h0);
  reg [(2'h3):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg122 = (1'h0);
  reg [(3'h6):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg120 = (1'h0);
  reg [(3'h6):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg118 = (1'h0);
  assign y = {wire152,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire117,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 (1'h0)};
  assign wire117 = $signed($unsigned(wire114));
  always
    @(posedge clk) begin
      reg118 <= wire117;
      reg119 <= $signed((+({reg118[(3'h4):(1'h0)]} ?
          $signed(reg118[(4'hb):(4'h9)]) : wire116)));
      reg120 <= {wire115[(3'h4):(1'h1)]};
      reg121 <= ((reg118 ?
          reg118[(2'h2):(1'h0)] : wire115) >>> $signed(({wire115[(2'h3):(2'h3)]} ?
          (8'ha0) : $signed($unsigned(reg120)))));
      reg122 <= wire116;
    end
  assign wire123 = wire114;
  assign wire124 = ((((reg119[(3'h5):(2'h3)] | wire117) - ({wire123} ?
                               (wire116 ? (8'hab) : (7'h44)) : wire123)) ?
                           reg119 : (~^$signed($signed(wire117)))) ?
                       $signed(reg121) : reg121);
  assign wire125 = wire123[(1'h0):(1'h0)];
  assign wire126 = $unsigned(($signed((((8'hb8) <<< wire124) < wire116)) ~^ (($signed(reg119) ?
                       (wire125 << wire123) : reg120[(2'h3):(1'h0)]) ^~ reg118)));
  assign wire127 = (~|$unsigned(reg119));
  assign wire128 = (((reg120[(1'h1):(1'h0)] & $unsigned((wire116 >> (8'hb2)))) == wire115[(2'h2):(1'h1)]) <<< (!wire113[(4'hf):(4'hc)]));
  assign wire129 = wire116;
  assign wire130 = (({((~|(8'hab)) ~^ (wire113 ? wire123 : wire114)),
                           reg118} ^~ (&((|(8'ha3)) > (wire127 ?
                           (8'ha2) : wire117)))) ?
                       {wire123[(1'h0):(1'h0)],
                           $signed(reg119[(1'h1):(1'h0)])} : {$signed((reg122 + (wire127 ?
                               wire124 : reg119)))});
  assign wire131 = {wire116, (~^$unsigned(wire116[(5'h11):(3'h7)]))};
  always
    @(posedge clk) begin
      if ((wire116[(1'h1):(1'h0)] >>> (reg118[(2'h2):(2'h2)] ?
          wire123[(1'h1):(1'h0)] : reg121)))
        begin
          reg132 <= ((~&wire114[(4'h8):(3'h7)]) ?
              $unsigned(($signed((wire127 < reg119)) ?
                  (8'hac) : $unsigned((wire128 ?
                      reg121 : wire130)))) : wire115);
          reg133 <= (((~(&$signed(wire130))) ?
                  wire123[(1'h0):(1'h0)] : $signed((+reg118[(4'h8):(3'h4)]))) ?
              wire130 : $unsigned(reg121));
          reg134 <= ($unsigned($signed(wire114)) ?
              (^~((^wire123[(1'h0):(1'h0)]) <= $signed((reg118 ?
                  wire117 : wire126)))) : (~|(wire114[(2'h2):(1'h0)] ?
                  $unsigned((~|wire113)) : $unsigned($signed(wire126)))));
          reg135 <= ((^(~&$signed(wire114))) ?
              ($signed({reg133, $unsigned(wire123)}) ?
                  $signed(((wire127 < wire116) ?
                      $unsigned(wire123) : (-reg118))) : ($unsigned(reg121) ?
                      (wire124[(4'hf):(4'hc)] >> $unsigned(wire116)) : wire114[(5'h10):(4'ha)])) : (~&($signed({wire127}) ?
                  $unsigned(reg134[(4'h9):(2'h3)]) : (reg122 ?
                      $unsigned(wire125) : wire125))));
        end
      else
        begin
          reg132 <= $signed(wire126[(4'h9):(3'h4)]);
          reg133 <= ((|(-reg118)) ? reg134 : {$signed(wire117)});
        end
    end
  always
    @(posedge clk) begin
      reg136 <= $signed(wire113);
      reg137 <= ({$unsigned((!((8'hb0) ? wire130 : reg118))),
          ((&reg133[(1'h0):(1'h0)]) || (~$signed(reg134)))} <= wire114[(5'h14):(3'h5)]);
      reg138 <= wire114;
      reg139 <= $signed({(reg133 ?
              ({reg137, reg119} ? reg121 : {wire125, wire127}) : wire117)});
    end
  assign wire140 = $unsigned(($unsigned(wire126) && wire116));
  assign wire141 = (!{$signed({(|wire114), wire117[(4'ha):(1'h1)]})});
  assign wire142 = {wire141};
  assign wire143 = wire128;
  assign wire144 = $signed($unsigned($unsigned($unsigned(reg136))));
  always
    @(posedge clk) begin
      if ((8'hab))
        begin
          if ((~&($unsigned(($signed(wire130) * $unsigned(wire125))) ?
              {{{reg137},
                      $unsigned(wire129)}} : ((^~wire131) <<< $unsigned((!(8'hb1)))))))
            begin
              reg145 <= {(~^$signed($unsigned(wire113[(4'ha):(3'h6)])))};
              reg146 <= (~^wire130);
              reg147 <= ((wire115 ?
                      wire131[(1'h1):(1'h0)] : $unsigned(((wire123 ^ wire143) >>> (wire124 <<< reg122)))) ?
                  $unsigned($signed(wire131[(2'h3):(2'h3)])) : ({(reg132 - wire115[(1'h1):(1'h0)])} | (~wire143[(5'h14):(1'h1)])));
              reg148 <= (8'hac);
            end
          else
            begin
              reg145 <= $signed($unsigned((!$unsigned({reg132}))));
              reg146 <= (+reg138[(1'h0):(1'h0)]);
              reg147 <= $signed(wire123);
              reg148 <= ((8'hbc) ?
                  $signed($unsigned($unsigned(reg133))) : wire126[(3'h7):(1'h1)]);
            end
        end
      else
        begin
          reg145 <= $signed(((^reg135[(1'h0):(1'h0)]) ?
              ((~(~|reg122)) ?
                  $unsigned($unsigned(wire124)) : ($unsigned(wire140) < $signed(reg138))) : wire124));
        end
      reg149 <= $unsigned((|($unsigned($signed(wire117)) ?
          $unsigned(wire125) : (reg133[(2'h2):(2'h2)] ?
              (wire116 ? reg147 : wire125) : wire117[(1'h1):(1'h0)]))));
      reg150 <= (reg132 << reg122);
      reg151 <= {{{((|wire130) ?
                      $signed(reg135) : ((8'hb6) ? reg122 : wire128))},
              wire113},
          ($signed(reg119) ?
              (wire116 ?
                  wire140[(1'h0):(1'h0)] : $signed((wire140 ?
                      (8'hb2) : reg134))) : ($unsigned($unsigned(reg132)) ?
                  (wire115 ? (+reg150) : wire113) : ((wire142 ?
                      (7'h42) : reg146) && {wire144, reg120})))};
    end
  assign wire152 = $signed($unsigned({wire124[(4'he):(4'hb)]}));
endmodule

module module93
#(parameter param107 = ((((&(8'ha6)) | ({(8'hba)} && (^~(8'hb8)))) ? (({(8'hbb), (8'hb9)} && ((8'ha0) - (8'hb5))) << ({(8'hbc)} >> ((7'h44) ? (8'hbd) : (8'hb3)))) : (^((|(8'had)) + (!(8'ha6))))) ? (((((8'hba) ? (7'h41) : (8'hb3)) || ((8'hb3) <= (8'haa))) != (|(~|(8'hb2)))) ? ((|((8'ha1) || (8'hb5))) ? (((8'hbf) - (8'hab)) * ((8'hb5) ? (8'hb3) : (8'hb9))) : (~|(8'ha5))) : (~|((8'hb6) ? ((8'hb1) + (8'ha9)) : ((8'haf) ^~ (8'hbf))))) : (((((8'hb7) ^~ (8'hb7)) ? ((8'hb1) ? (8'hba) : (8'h9d)) : (8'hba)) >> (8'hb6)) ? ((8'ha7) < (((8'ha1) >= (8'hb0)) ? ((8'hab) ? (8'ha6) : (8'hb6)) : (~|(8'hb9)))) : {((|(8'h9e)) >> ((8'ha7) * (8'ha3))), {((8'hb6) ? (8'hbc) : (8'ha6))}})))
(y, clk, wire98, wire97, wire96, wire95, wire94);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire98;
  input wire signed [(5'h11):(1'h0)] wire97;
  input wire signed [(4'hf):(1'h0)] wire96;
  input wire [(4'hf):(1'h0)] wire95;
  input wire [(4'hc):(1'h0)] wire94;
  wire [(5'h15):(1'h0)] wire106;
  wire [(4'hb):(1'h0)] wire105;
  wire signed [(4'hc):(1'h0)] wire104;
  wire signed [(2'h2):(1'h0)] wire103;
  wire [(3'h6):(1'h0)] wire99;
  reg [(5'h12):(1'h0)] reg102 = (1'h0);
  reg [(3'h5):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg100 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire99,
                 reg102,
                 reg101,
                 reg100,
                 (1'h0)};
  assign wire99 = $signed($signed({wire98[(4'h8):(2'h3)]}));
  always
    @(posedge clk) begin
      reg100 <= $unsigned({{$signed(wire96)}, $signed((8'ha3))});
      reg101 <= {(($unsigned(wire95) ?
              reg100[(1'h1):(1'h0)] : reg100[(4'hc):(3'h5)]) <<< wire94[(4'hb):(2'h2)])};
      if ((^wire94[(4'hb):(2'h3)]))
        begin
          reg102 <= ({$signed($unsigned((wire94 > wire96))),
                  $signed(({reg101} ? wire94 : (+wire98)))} ?
              {($signed((reg101 <= wire97)) ?
                      (wire99[(3'h4):(1'h0)] | (wire96 && wire97)) : ($signed(wire97) ?
                          reg101 : (|(8'hab))))} : (wire98 ?
                  $signed($signed(wire96)) : (~($signed(reg100) <<< {reg100}))));
        end
      else
        begin
          reg102 <= reg100;
        end
    end
  assign wire103 = $signed($unsigned(($signed((wire94 >> reg102)) <= {wire97[(5'h10):(3'h7)]})));
  assign wire104 = {({wire99[(3'h5):(3'h5)], (|$signed(reg102))} ?
                           ({$signed(wire99)} ?
                               $signed(wire97) : (wire98 >= (wire95 ^ reg102))) : (reg100 * reg100)),
                       (wire103[(2'h2):(1'h0)] ?
                           wire97 : $signed({((7'h40) == wire98)}))};
  assign wire105 = $signed($unsigned((($unsigned(reg102) ?
                           reg101[(2'h3):(1'h1)] : wire97) ?
                       ((reg102 | wire98) ?
                           (wire98 && wire104) : reg100[(4'ha):(3'h7)]) : {$signed(reg102)})));
  assign wire106 = wire104[(4'h9):(3'h7)];
endmodule

module module37
#(parameter param86 = (-{({(^~(8'hbb))} >> {((8'had) ? (8'haf) : (8'h9d))}), {{(!(8'ha7)), ((8'hb8) < (8'hb7))}}}))
(y, clk, wire41, wire40, wire39, wire38);
  output wire [(32'h206):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire41;
  input wire signed [(4'h9):(1'h0)] wire40;
  input wire signed [(4'hd):(1'h0)] wire39;
  input wire [(4'h8):(1'h0)] wire38;
  wire [(4'hf):(1'h0)] wire85;
  wire [(4'hd):(1'h0)] wire84;
  wire signed [(5'h14):(1'h0)] wire83;
  wire [(4'hc):(1'h0)] wire82;
  wire [(5'h12):(1'h0)] wire81;
  wire [(4'hb):(1'h0)] wire80;
  wire [(5'h15):(1'h0)] wire79;
  wire signed [(5'h10):(1'h0)] wire78;
  wire signed [(4'ha):(1'h0)] wire77;
  wire [(4'hd):(1'h0)] wire71;
  wire [(4'hd):(1'h0)] wire70;
  wire [(3'h4):(1'h0)] wire69;
  wire [(4'ha):(1'h0)] wire68;
  wire signed [(4'h8):(1'h0)] wire67;
  wire signed [(3'h7):(1'h0)] wire66;
  wire signed [(4'ha):(1'h0)] wire42;
  reg signed [(4'he):(1'h0)] reg76 = (1'h0);
  reg [(3'h5):(1'h0)] reg75 = (1'h0);
  reg [(5'h11):(1'h0)] reg74 = (1'h0);
  reg [(5'h10):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg72 = (1'h0);
  reg [(4'hf):(1'h0)] reg65 = (1'h0);
  reg [(3'h6):(1'h0)] reg64 = (1'h0);
  reg [(5'h10):(1'h0)] reg63 = (1'h0);
  reg signed [(4'he):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg60 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg59 = (1'h0);
  reg [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  reg [(3'h5):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  reg [(5'h10):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg47 = (1'h0);
  reg [(3'h4):(1'h0)] reg46 = (1'h0);
  reg [(5'h15):(1'h0)] reg45 = (1'h0);
  reg [(5'h10):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg43 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire42,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg65,
                 reg64,
                 reg63,
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
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 (1'h0)};
  assign wire42 = wire41[(3'h4):(3'h4)];
  always
    @(posedge clk) begin
      if ((wire40 ?
          ($unsigned($signed(wire38[(3'h7):(3'h5)])) && (($signed((7'h41)) ?
              wire41[(4'ha):(4'ha)] : (|wire41)) - ((~|wire41) | wire39[(4'hd):(3'h6)]))) : (~^$unsigned((+((8'h9c) ?
              wire41 : wire40))))))
        begin
          reg43 <= (($signed($signed((-wire42))) ?
              $signed(wire41) : wire41) << $unsigned(wire40));
        end
      else
        begin
          if ((-{wire41, wire42[(2'h3):(1'h0)]}))
            begin
              reg43 <= wire42[(3'h5):(3'h4)];
              reg44 <= wire41;
              reg45 <= ($unsigned($unsigned((7'h43))) ?
                  (+$signed(reg43[(1'h1):(1'h0)])) : wire39);
              reg46 <= $unsigned(wire39);
              reg47 <= wire40;
            end
          else
            begin
              reg43 <= $unsigned(($unsigned(reg45) ?
                  ((reg45[(2'h2):(1'h0)] ?
                      $signed(reg44) : reg47) & {reg44[(3'h7):(3'h7)],
                      reg47}) : reg47[(4'h8):(3'h6)]));
              reg44 <= $signed((reg46 ?
                  $unsigned(({(7'h40), wire42} ?
                      (wire40 ?
                          reg46 : (8'hb0)) : wire40)) : ($unsigned((reg46 ?
                      wire41 : reg45)) & (!wire40[(1'h0):(1'h0)]))));
              reg45 <= reg47;
              reg46 <= ((8'h9d) ?
                  (($unsigned((|wire39)) << {(^reg44),
                      wire41[(4'h8):(3'h5)]}) || (-reg44[(3'h4):(2'h3)])) : wire38[(3'h7):(2'h2)]);
              reg47 <= (($signed($signed({wire39, reg47})) ?
                  (|reg43[(2'h3):(2'h2)]) : {reg45}) <= wire42);
            end
          reg48 <= $unsigned((wire40 ?
              (^{wire38[(2'h3):(1'h0)]}) : ($signed($unsigned(wire39)) == wire41[(4'hd):(4'ha)])));
          reg49 <= ((8'ha3) ?
              (wire40 ?
                  ((~^$signed(reg43)) + (-(^~reg47))) : wire40[(2'h2):(1'h1)]) : ((+$signed(reg44[(1'h0):(1'h0)])) >= (($unsigned(reg44) >> (wire40 ?
                  (8'ha5) : reg43)) ^~ ((wire42 ?
                  wire38 : (8'hb7)) * (~&wire39)))));
          if ($unsigned($unsigned($unsigned($unsigned($unsigned(reg43))))))
            begin
              reg50 <= $signed(reg47[(3'h4):(2'h3)]);
              reg51 <= reg48[(4'hf):(4'hd)];
              reg52 <= $signed(($signed(((wire39 ? (8'hab) : reg45) >= {(8'hb3),
                      wire41})) ?
                  (&(8'ha4)) : (|((^reg44) >= wire38))));
              reg53 <= reg45[(4'ha):(1'h1)];
              reg54 <= (+reg51[(2'h3):(1'h1)]);
            end
          else
            begin
              reg50 <= ({reg53, (~^wire38)} || $signed(reg50[(3'h6):(3'h6)]));
              reg51 <= ({$signed((!$unsigned(reg46))), reg47} ?
                  $unsigned($signed($unsigned((+(8'haa))))) : $signed((reg52 & (!reg45[(4'hf):(2'h3)]))));
              reg52 <= $signed((~|(wire41 ?
                  (^(&wire39)) : {(wire39 ? wire38 : wire40),
                      $unsigned((8'ha1))})));
            end
        end
      reg55 <= (reg44 ?
          ($signed((~(reg45 ?
              reg52 : wire38))) >>> {reg49}) : (reg44 <<< ($unsigned(reg46) <<< reg46[(2'h3):(2'h2)])));
      if (reg49[(3'h5):(1'h0)])
        begin
          reg56 <= (((~|wire40[(3'h7):(3'h5)]) | (reg43[(3'h7):(3'h6)] ?
              ($unsigned(reg43) ? reg48 : {reg46}) : $unsigned((reg48 ?
                  reg47 : wire39)))) <<< $signed({$unsigned(reg44[(4'h8):(4'h8)]),
              reg52}));
          reg57 <= (8'ha2);
          reg58 <= $signed(wire41);
          reg59 <= wire42[(2'h3):(2'h2)];
        end
      else
        begin
          if ($signed((&wire38)))
            begin
              reg56 <= $unsigned($unsigned(((|reg58) ?
                  {$unsigned(reg55)} : reg51[(4'h8):(3'h6)])));
              reg57 <= reg46[(2'h2):(1'h1)];
              reg58 <= reg55;
              reg59 <= {wire40[(2'h3):(2'h3)],
                  $unsigned((reg58 ?
                      {$signed(reg50),
                          (reg43 ? reg58 : (8'h9d))} : reg46[(2'h3):(1'h0)]))};
              reg60 <= $signed({(8'ha0)});
            end
          else
            begin
              reg56 <= ((~&($unsigned({reg53}) ?
                      $unsigned((reg57 ? (8'hb5) : (8'h9e))) : {{reg57},
                          (reg49 ? wire41 : reg50)})) ?
                  (!wire41) : wire42);
              reg57 <= $unsigned(reg53);
            end
          if (($signed(reg44[(3'h7):(1'h0)]) ^ $unsigned($unsigned((reg60[(2'h3):(2'h2)] ?
              (reg56 ? reg53 : wire41) : reg47)))))
            begin
              reg61 <= reg56;
              reg62 <= reg43[(3'h5):(2'h3)];
              reg63 <= ($unsigned((((reg59 & wire41) ?
                          reg59 : (reg58 >>> (8'hb6))) ?
                      $signed($signed(reg44)) : $unsigned((reg45 - wire38)))) ?
                  reg56[(2'h3):(1'h1)] : (wire38[(3'h7):(1'h1)] ?
                      (8'hbe) : wire42[(3'h7):(1'h1)]));
              reg64 <= wire39[(2'h3):(2'h3)];
            end
          else
            begin
              reg61 <= $unsigned($signed(((reg44 * (reg46 ~^ reg44)) ?
                  {$signed(wire42)} : reg47[(2'h3):(2'h2)])));
              reg62 <= ($unsigned({reg47[(3'h4):(2'h3)]}) ? reg62 : reg57);
              reg63 <= {$unsigned($signed(wire41)),
                  $signed($signed((reg44[(2'h2):(1'h1)] >> (~^reg45))))};
              reg64 <= (wire39[(3'h4):(2'h2)] <<< $unsigned({($signed(reg48) << reg43)}));
              reg65 <= (reg62[(3'h4):(3'h4)] | {{(|reg50[(1'h0):(1'h0)])},
                  $signed(((&reg55) ?
                      wire42[(2'h3):(2'h2)] : $unsigned(wire38)))});
            end
        end
    end
  assign wire66 = {(reg53 ?
                          reg53[(3'h6):(1'h1)] : (($unsigned(reg44) != $unsigned(reg44)) ^ {reg55}))};
  assign wire67 = $signed(reg55);
  assign wire68 = (((~^(^$signed((8'h9c)))) ?
                          (wire67[(3'h4):(2'h3)] << $signed({reg43})) : (~$unsigned(wire42[(4'ha):(4'h9)]))) ?
                      $signed((~^$unsigned(wire39[(4'hd):(2'h3)]))) : (~reg60));
  assign wire69 = {$unsigned($unsigned(reg57[(2'h2):(1'h1)])),
                      ((~|$signed((!reg65))) ? $signed(wire66) : {reg46})};
  assign wire70 = ({$signed($unsigned($unsigned(wire41))),
                      $signed((reg59[(1'h0):(1'h0)] ?
                          wire41 : (reg65 ?
                              reg64 : wire69)))} && $unsigned(($unsigned((reg56 < wire67)) < (8'ha6))));
  assign wire71 = $signed($unsigned($unsigned($unsigned($signed(reg60)))));
  always
    @(posedge clk) begin
      reg72 <= $signed(($unsigned(((reg56 ? reg55 : reg52) ?
          (reg43 ^~ (8'ha1)) : $unsigned(reg58))) + (+$signed($signed(wire41)))));
    end
  always
    @(posedge clk) begin
      reg73 <= $unsigned((8'hb0));
      reg74 <= (($signed({wire41[(2'h2):(1'h0)]}) ?
          (reg53[(4'hb):(3'h6)] ~^ reg73) : {($signed(reg59) + $unsigned(wire71)),
              $signed(reg55)}) <= reg59[(3'h4):(3'h4)]);
      reg75 <= $signed(($signed((~^$signed(wire69))) ?
          $signed((|$signed(reg57))) : reg63[(2'h3):(1'h1)]));
      reg76 <= (+(wire40[(3'h6):(2'h2)] ~^ (|wire39)));
    end
  assign wire77 = {((-reg60[(1'h0):(1'h0)]) ?
                          ($signed($signed(reg73)) < ($signed(reg49) & $unsigned(wire40))) : reg51),
                      (^wire69[(2'h2):(2'h2)])};
  assign wire78 = {reg60, (!{(+(reg76 ? reg43 : reg51)), reg73})};
  assign wire79 = (|(~((+(reg46 ? reg72 : wire77)) ?
                      reg63 : (^~wire71[(4'h9):(2'h3)]))));
  assign wire80 = reg65[(4'hd):(2'h3)];
  assign wire81 = wire42;
  assign wire82 = ($signed($signed(wire40)) ?
                      ($unsigned($signed((reg55 <= reg48))) <= $signed((~^$unsigned(wire41)))) : (8'ha9));
  assign wire83 = {((wire42[(4'ha):(4'h9)] ?
                          reg48 : ($unsigned(wire70) ?
                              (~&reg52) : (reg63 ?
                                  wire80 : reg59))) > {{(reg50 + (7'h44))}}),
                      (reg73[(3'h5):(3'h5)] > reg45[(5'h14):(3'h6)])};
  assign wire84 = $signed($signed((reg65[(3'h5):(1'h0)] <= reg57)));
  assign wire85 = (!$unsigned($unsigned(wire80)));
endmodule
