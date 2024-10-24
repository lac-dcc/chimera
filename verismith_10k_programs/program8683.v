module top
#(parameter param86 = (((~^(((7'h41) >>> (8'hac)) >> (|(8'ha0)))) >>> (((^~(7'h44)) & ((7'h42) != (8'ha5))) ? (((7'h41) ? (8'hb5) : (8'hba)) ? ((8'had) ~^ (8'haa)) : ((7'h42) > (8'hb9))) : {(8'hab), {(8'hbf)}})) ~^ (((^((8'ha8) ? (8'hb8) : (8'hb5))) >= (~|((8'ha8) ? (8'ha6) : (8'hb6)))) ? (&(((8'hac) ? (8'ha2) : (8'h9f)) ? (8'hb6) : ((8'ha1) != (8'hbd)))) : (({(8'ha4), (8'hb3)} ? {(7'h43), (8'hbc)} : ((8'ha5) << (8'ha1))) & (|{(8'ha8)})))), 
parameter param87 = (param86 > ((((param86 || param86) <= {param86, param86}) || (8'ha7)) << {((~|param86) ? param86 : param86), ((param86 << param86) - param86)})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h23f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire85;
  wire [(5'h12):(1'h0)] wire77;
  wire signed [(2'h2):(1'h0)] wire76;
  wire signed [(5'h14):(1'h0)] wire75;
  wire signed [(4'hc):(1'h0)] wire74;
  wire [(5'h11):(1'h0)] wire73;
  wire signed [(4'hc):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire35;
  wire [(4'h8):(1'h0)] wire71;
  reg signed [(4'hf):(1'h0)] reg84 = (1'h0);
  reg [(4'hd):(1'h0)] reg83 = (1'h0);
  reg [(5'h11):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg81 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg78 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  assign y = {wire85,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire5,
                 wire6,
                 wire7,
                 wire35,
                 wire71,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
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
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 (1'h0)};
  assign wire5 = wire0;
  assign wire6 = $signed($signed($unsigned(wire0[(3'h4):(2'h3)])));
  assign wire7 = $unsigned($unsigned(wire1[(4'h9):(1'h0)]));
  always
    @(posedge clk) begin
      reg8 <= (&(wire3[(3'h4):(1'h0)] | $unsigned((8'had))));
      reg9 <= wire5;
      if ((8'ha8))
        begin
          reg10 <= (^~((~^wire2) ?
              (^~wire0[(2'h2):(2'h2)]) : $unsigned({(wire3 ^ reg8),
                  (reg9 ? wire7 : wire5)})));
          reg11 <= (($unsigned(wire6[(2'h3):(2'h2)]) ?
              reg9[(5'h11):(4'hd)] : {wire7[(4'h8):(3'h5)],
                  wire1[(4'he):(2'h2)]}) << wire5);
          reg12 <= {$signed(((((8'haf) + wire0) ?
                  (^~wire5) : wire6[(3'h5):(1'h1)]) << (wire5[(3'h4):(2'h3)] < wire5))),
              reg10[(2'h2):(1'h0)]};
          if ({{((wire5 & $unsigned(reg10)) ^ (~^wire3[(2'h2):(1'h0)]))}})
            begin
              reg13 <= $signed(($unsigned(wire6[(3'h5):(2'h2)]) < ((!(+wire0)) > ($unsigned(reg9) ?
                  (!wire1) : $signed(wire6)))));
              reg14 <= (wire2[(3'h4):(1'h0)] ?
                  (8'hb3) : $unsigned(wire6[(4'hb):(3'h5)]));
              reg15 <= reg13;
              reg16 <= wire0[(1'h0):(1'h0)];
              reg17 <= $unsigned((~$signed(((reg10 ? wire0 : reg13) ?
                  (&(8'ha8)) : (~^reg10)))));
            end
          else
            begin
              reg13 <= $unsigned($signed($signed($unsigned($signed(wire0)))));
              reg14 <= ((8'ha8) ?
                  $unsigned(((reg15[(2'h3):(1'h0)] & (~&wire0)) & reg15)) : ({(~|$signed(wire7))} | (!(~^(~reg8)))));
            end
        end
      else
        begin
          reg10 <= (reg17 < {wire0, (!wire5)});
          reg11 <= (wire7 < ((|(wire4 ~^ (wire5 ?
              (8'ha6) : (7'h40)))) > reg9[(3'h5):(2'h2)]));
          reg12 <= ((((8'hb6) ?
                  (((7'h42) * wire1) && (^~(8'hb0))) : $unsigned((reg11 ?
                      wire2 : reg17))) ?
              $signed(((8'hbe) - (-reg11))) : wire5) >= ((-(-(^~(8'ha3)))) | wire3));
          reg13 <= reg8;
          if ($unsigned(wire4[(3'h4):(2'h3)]))
            begin
              reg14 <= (({$unsigned((wire7 ? reg10 : wire1))} ?
                  $signed(reg14[(2'h3):(1'h0)]) : ($signed(reg12) ?
                      reg16 : (^((8'hbf) <= reg12)))) * $unsigned({reg8[(3'h7):(2'h2)],
                  $signed((reg8 ? wire6 : (8'hba)))}));
              reg15 <= wire2;
            end
          else
            begin
              reg14 <= reg10;
              reg15 <= reg11[(2'h3):(2'h2)];
            end
        end
      if ((~^((!reg10[(2'h2):(1'h0)]) + reg9[(5'h10):(3'h7)])))
        begin
          if ($unsigned({$unsigned(reg15),
              $signed(((wire6 ? wire7 : wire4) ?
                  {(8'hb1), reg12} : $unsigned((8'hbe))))}))
            begin
              reg18 <= (^(((reg9[(1'h0):(1'h0)] << $unsigned(reg9)) ?
                      (~^((8'hb4) ? reg8 : reg11)) : reg15) ?
                  (reg14[(3'h5):(1'h0)] + {$signed(wire5)}) : $unsigned((^$signed(wire1)))));
              reg19 <= $unsigned(((+$unsigned($signed(wire6))) ?
                  reg10 : (8'had)));
              reg20 <= reg9[(2'h2):(2'h2)];
              reg21 <= (($signed(wire1[(3'h7):(1'h1)]) ^~ wire5[(1'h0):(1'h0)]) ?
                  $signed(reg19[(1'h0):(1'h0)]) : $signed($signed(reg20[(4'h9):(2'h3)])));
            end
          else
            begin
              reg18 <= $signed(((reg8 ? reg12[(4'hd):(1'h1)] : (-(^~wire2))) ?
                  reg9 : reg13));
            end
          reg22 <= $unsigned({wire5, reg17});
          reg23 <= ((((!wire3[(1'h1):(1'h1)]) * {reg11[(2'h2):(1'h1)]}) ^~ $signed(reg20[(1'h0):(1'h0)])) & $unsigned(($signed(reg17) ?
              wire5 : $unsigned(wire2))));
          if (($unsigned(((&wire7) ? reg22[(2'h2):(1'h0)] : wire1)) != (8'ha0)))
            begin
              reg24 <= $unsigned(reg16[(4'hc):(3'h4)]);
              reg25 <= (({($unsigned(reg10) >= (^reg13)),
                      $unsigned(wire1[(4'hb):(3'h7)])} >= reg21[(1'h0):(1'h0)]) ?
                  ($unsigned(reg9) * reg20) : ((~&reg15) ?
                      reg17 : ($signed($unsigned(wire4)) - wire7[(3'h4):(2'h2)])));
              reg26 <= (+$signed($signed(((8'haa) <= reg20[(4'h9):(3'h6)]))));
              reg27 <= {{(7'h41), (reg14 && (-{reg20}))}};
            end
          else
            begin
              reg24 <= (-(8'hb0));
              reg25 <= ((~reg21[(3'h6):(3'h6)]) ?
                  wire2[(3'h5):(3'h5)] : (~({wire4, wire6} ?
                      wire1 : {(reg12 ? wire4 : reg8), (wire3 || wire3)})));
            end
        end
      else
        begin
          if (((!(($signed(reg18) || (|(8'ha2))) >>> (((8'hb1) <<< reg12) | (reg22 >>> (8'ha1))))) != {$unsigned(((reg13 ?
                  reg11 : wire6) | $unsigned(wire5))),
              wire7}))
            begin
              reg18 <= $unsigned((-wire2[(4'h8):(1'h1)]));
              reg19 <= $signed($signed($signed($signed({(8'hb3), wire0}))));
              reg20 <= reg17[(4'h9):(3'h4)];
            end
          else
            begin
              reg18 <= reg23;
              reg19 <= $signed((reg13[(4'hc):(4'ha)] ?
                  $unsigned($signed((reg13 ? (7'h41) : reg14))) : reg13));
            end
          reg21 <= (~&reg11);
          reg22 <= reg23;
          reg23 <= $signed((((+reg8[(4'hf):(4'ha)]) != ((reg27 ?
              reg13 : reg16) | (&reg27))) != ({(!reg16), $signed(reg9)} ?
              ($signed(reg12) ^ $unsigned((8'hb6))) : $signed({reg27,
                  reg13}))));
          reg24 <= (((reg10[(1'h1):(1'h0)] >> wire7) ?
              wire5 : reg25[(3'h7):(3'h6)]) + ((reg27 || $unsigned(reg23)) + $unsigned($unsigned(reg27))));
        end
      if ($unsigned(reg10))
        begin
          reg28 <= $signed((reg25[(5'h15):(5'h12)] ?
              {$signed($unsigned((8'ha9)))} : ({{reg26,
                      reg15}} || wire4[(4'hb):(4'h8)])));
          if (reg24)
            begin
              reg29 <= $signed(wire5);
              reg30 <= reg20[(4'h8):(4'h8)];
            end
          else
            begin
              reg29 <= $unsigned(reg17[(2'h3):(1'h0)]);
              reg30 <= ((!$unsigned(wire1)) ~^ (&wire0));
              reg31 <= (~^(~^reg10[(3'h4):(2'h3)]));
              reg32 <= reg23[(3'h5):(2'h3)];
            end
          reg33 <= {((^~(|(-(8'hb7)))) ? reg18[(5'h13):(4'hc)] : wire3)};
        end
      else
        begin
          if (reg14)
            begin
              reg28 <= $signed((($signed($unsigned(reg27)) < (reg23 ?
                      (8'hab) : (^~reg26))) ?
                  (^~$signed((reg12 ?
                      reg11 : wire0))) : ((reg10[(2'h2):(2'h2)] && (!(8'hae))) & reg19)));
              reg29 <= (+(({(-reg13), $signed(reg22)} ?
                      $unsigned((reg11 < reg15)) : ((^~reg18) ?
                          {wire2, reg17} : $unsigned(reg13))) ?
                  ($unsigned((wire0 < reg17)) ?
                      {$signed(wire0)} : $unsigned((~^reg23))) : (($signed((8'hb4)) ?
                      reg22 : reg26) || $signed($signed(reg33)))));
              reg30 <= wire0;
              reg31 <= ({$signed(($signed(reg23) ? $unsigned(wire6) : wire5)),
                      (wire3 ?
                          $signed((8'hbe)) : ($unsigned((8'ha0)) == (~|(8'hbc))))} ?
                  ($unsigned(((reg15 ? wire0 : wire6) ?
                      (~&wire5) : wire1)) <<< {(reg20 | $unsigned(reg29)),
                      (+{reg28,
                          wire7})}) : ($unsigned($unsigned(((8'hb9) - reg17))) >>> reg9));
              reg32 <= $signed($unsigned((8'ha6)));
            end
          else
            begin
              reg28 <= (+$signed((&reg25)));
            end
          reg33 <= {reg22[(1'h0):(1'h0)],
              (wire2 ?
                  (^~$unsigned($unsigned(reg23))) : (reg32[(2'h3):(1'h1)] && (|(reg27 ?
                      reg11 : reg32))))};
          reg34 <= {wire0};
        end
    end
  assign wire35 = $signed((~reg8));
  module36 #() modinst72 (wire71, clk, reg19, wire1, wire5, wire4);
  assign wire73 = $signed(reg33);
  assign wire74 = (&(($signed((reg10 ^~ (8'ha9))) <<< reg29) << reg26));
  assign wire75 = $unsigned(($unsigned({(wire74 ?
                          reg33 : wire4)}) | $unsigned((reg17 ~^ reg14[(1'h1):(1'h0)]))));
  assign wire76 = reg8[(3'h7):(3'h7)];
  assign wire77 = (-(|$unsigned(($signed(reg22) < (reg26 ? reg23 : reg21)))));
  always
    @(posedge clk) begin
      if ((($unsigned(((reg10 ? reg20 : reg9) >= (wire6 ?
              reg8 : wire75))) >>> $unsigned($signed(reg18))) ?
          {$signed((~^(8'hb1)))} : (($signed({reg17}) || (&{reg24,
              wire75})) << ($unsigned(wire0) > wire4[(3'h5):(1'h0)]))))
        begin
          if (reg34)
            begin
              reg78 <= $signed($unsigned(reg17));
              reg79 <= $signed((7'h41));
            end
          else
            begin
              reg78 <= (~|(|reg21[(2'h2):(1'h0)]));
              reg79 <= {wire4[(2'h3):(2'h3)]};
            end
          reg80 <= (({($unsigned(wire6) == $unsigned(wire73))} ?
                  ($signed($unsigned((8'ha6))) ?
                      (~|(~&reg29)) : ($signed((7'h43)) ?
                          $signed(wire35) : (~&reg23))) : $signed(((wire6 ^ reg79) ?
                      wire77 : wire77))) ?
              wire75 : {(8'hae)});
          reg81 <= ((reg23 ^~ reg80) ?
              ($signed((((8'hb7) & wire7) ? wire3 : $unsigned((8'hba)))) ?
                  reg18 : (8'ha8)) : {$unsigned($signed({reg12, reg11})),
                  $signed((^(wire71 ? (8'hb1) : (8'hb8))))});
        end
      else
        begin
          reg78 <= (reg78 ?
              ($unsigned({$unsigned(reg13)}) <<< {$unsigned(wire2)}) : reg80[(1'h1):(1'h0)]);
          reg79 <= $signed({wire3, {{{wire35, reg15}}}});
          if ($unsigned($unsigned(((wire0 && (~^reg21)) ?
              (^~(reg30 ? reg12 : reg25)) : $unsigned({reg27, (8'hae)})))))
            begin
              reg80 <= $unsigned(wire77[(3'h7):(3'h5)]);
              reg81 <= reg18;
            end
          else
            begin
              reg80 <= (!(|reg9));
              reg81 <= ({((((8'ha5) << wire5) - $signed(wire2)) ?
                      ($signed(reg27) ?
                          reg28[(4'hf):(3'h5)] : reg27[(3'h5):(1'h0)]) : reg10)} ~^ $unsigned($signed((~|((8'h9d) >= wire1)))));
              reg82 <= $signed(reg18);
            end
          reg83 <= wire74;
          reg84 <= wire74;
        end
    end
  assign wire85 = $unsigned(reg16);
endmodule

module module36  (y, clk, wire40, wire39, wire38, wire37);
  output wire [(32'h172):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire40;
  input wire [(3'h5):(1'h0)] wire39;
  input wire signed [(3'h7):(1'h0)] wire38;
  input wire signed [(4'hb):(1'h0)] wire37;
  wire [(3'h5):(1'h0)] wire70;
  wire signed [(5'h12):(1'h0)] wire69;
  wire signed [(4'hc):(1'h0)] wire68;
  wire [(4'ha):(1'h0)] wire67;
  wire [(4'hc):(1'h0)] wire66;
  wire signed [(5'h14):(1'h0)] wire64;
  wire signed [(3'h7):(1'h0)] wire63;
  wire [(4'ha):(1'h0)] wire62;
  wire [(4'hd):(1'h0)] wire61;
  wire signed [(3'h4):(1'h0)] wire51;
  wire [(5'h14):(1'h0)] wire50;
  reg [(4'h8):(1'h0)] reg65 = (1'h0);
  reg [(4'h8):(1'h0)] reg60 = (1'h0);
  reg [(5'h11):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg55 = (1'h0);
  reg [(4'ha):(1'h0)] reg54 = (1'h0);
  reg [(4'hf):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg [(5'h15):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(4'h9):(1'h0)] reg41 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire51,
                 wire50,
                 reg65,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg41 <= $signed(((($signed((8'ha8)) ?
              $unsigned((8'ha1)) : wire38[(2'h3):(1'h1)]) | ($unsigned(wire39) && (^~wire40))) ?
          $unsigned(wire37[(4'hb):(4'h8)]) : $unsigned(wire38)));
    end
  always
    @(posedge clk) begin
      reg42 <= wire37[(4'h9):(4'h9)];
      if (wire39[(1'h0):(1'h0)])
        begin
          reg43 <= (^{$signed($signed(wire38)), reg42[(2'h3):(1'h1)]});
        end
      else
        begin
          reg43 <= (~reg43[(2'h3):(2'h2)]);
        end
      reg44 <= ({reg42[(4'h8):(2'h3)]} & (wire37 ?
          {$unsigned(wire39),
              {(reg43 <= reg42), $unsigned(reg42)}} : reg43[(3'h6):(2'h3)]));
    end
  always
    @(posedge clk) begin
      reg45 <= reg41;
      reg46 <= (~|(8'hbb));
      reg47 <= wire37;
      reg48 <= ($signed(reg44[(1'h0):(1'h0)]) ?
          wire40 : $signed(wire38[(1'h0):(1'h0)]));
      reg49 <= reg41;
    end
  assign wire50 = (reg48[(1'h1):(1'h1)] == $signed($signed(reg44[(4'ha):(3'h4)])));
  assign wire51 = (($signed($signed((reg48 ?
                          reg41 : wire39))) == {$unsigned((wire38 ?
                              reg46 : reg41)),
                          (^reg49[(4'hd):(4'hb)])}) ?
                      $signed(($unsigned(reg49[(2'h2):(1'h1)]) <<< reg45)) : $signed(reg46[(5'h13):(4'hc)]));
  always
    @(posedge clk) begin
      if ((^~($unsigned({reg42}) ?
          $signed({(~&wire51)}) : reg46[(4'he):(4'hb)])))
        begin
          if ((^~$unsigned((~^$unsigned($unsigned(wire50))))))
            begin
              reg52 <= (reg43[(3'h6):(2'h3)] >>> ((^reg45[(5'h11):(4'ha)]) ?
                  reg42 : $unsigned($unsigned((reg46 ? reg44 : wire51)))));
              reg53 <= $signed(reg49[(4'he):(2'h2)]);
            end
          else
            begin
              reg52 <= $signed(((^~(+$unsigned(reg46))) ?
                  wire38[(2'h3):(2'h2)] : reg42));
              reg53 <= $signed(({({(8'hb6)} * reg49)} ?
                  $signed((^reg43)) : (((^(8'hb1)) <= (&reg47)) ?
                      $unsigned((~&(7'h42))) : {reg48, (|(8'h9d))})));
            end
          if ($signed(($unsigned($signed($unsigned(reg47))) ?
              $unsigned(($unsigned((8'ha3)) ?
                  (|reg53) : {(8'ha6), reg43})) : reg53[(4'hc):(2'h3)])))
            begin
              reg54 <= ($signed(reg41) ~^ (|(reg45[(3'h7):(3'h7)] ?
                  ($signed(wire39) + $signed(reg44)) : (wire37[(4'hb):(1'h0)] ^ $unsigned((8'hba))))));
              reg55 <= ((!{$unsigned(reg53), wire38[(3'h7):(2'h2)]}) ?
                  $unsigned($signed((+$signed(reg52)))) : $unsigned(reg48));
              reg56 <= (+(($unsigned($unsigned(reg47)) <= {wire38[(2'h2):(2'h2)]}) ?
                  $signed(((wire38 | wire39) ?
                      (!wire39) : $unsigned((8'hbb)))) : $unsigned(reg49)));
              reg57 <= (reg56[(5'h12):(3'h4)] ?
                  $unsigned(wire51[(2'h2):(1'h0)]) : $signed($unsigned((^$unsigned(reg56)))));
            end
          else
            begin
              reg54 <= $signed(reg41[(3'h5):(1'h1)]);
              reg55 <= ($signed(($unsigned(wire39[(3'h5):(2'h3)]) ?
                      (8'hb2) : reg57)) ?
                  wire40 : ((($unsigned(wire39) - ((8'hbd) * reg54)) ?
                          $signed($unsigned(reg43)) : $unsigned($unsigned(reg46))) ?
                      reg46[(5'h12):(3'h7)] : (!(reg54 ?
                          reg46 : (reg45 <= reg48)))));
              reg56 <= reg54[(3'h6):(3'h6)];
              reg57 <= ($unsigned(reg43[(2'h3):(1'h1)]) ~^ (8'ha9));
              reg58 <= reg47[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg52 <= reg52[(3'h7):(3'h7)];
          if ($signed($signed(reg52)))
            begin
              reg53 <= reg49;
              reg54 <= reg54;
            end
          else
            begin
              reg53 <= ($signed(((^~{(8'ha7)}) >> $signed($signed(wire38)))) << wire50);
              reg54 <= $signed(wire50[(4'h8):(2'h2)]);
              reg55 <= reg49;
              reg56 <= reg42[(3'h4):(3'h4)];
            end
        end
      reg59 <= (reg58 & $unsigned(reg54[(3'h7):(1'h1)]));
      reg60 <= (reg46 ?
          {reg45[(1'h0):(1'h0)]} : $unsigned(reg47[(4'ha):(4'h9)]));
    end
  assign wire61 = ($unsigned(reg41[(3'h5):(3'h4)]) <<< ($unsigned($signed($unsigned(reg49))) ?
                      {(reg59[(4'hd):(4'hb)] < reg58[(2'h3):(1'h1)])} : $signed((+$signed(wire39)))));
  assign wire62 = (($unsigned(reg42) == $signed($unsigned((wire38 ^ reg56)))) ?
                      $unsigned(wire37[(1'h0):(1'h0)]) : $signed(($signed({reg41,
                          reg53}) ^ reg55[(3'h4):(2'h3)])));
  assign wire63 = $unsigned(($signed(((^wire40) ?
                      (~|reg49) : (reg52 ?
                          reg42 : reg46))) ^ $unsigned(wire51[(2'h3):(1'h0)])));
  assign wire64 = (^reg53[(4'hf):(4'h9)]);
  always
    @(posedge clk) begin
      reg65 <= (reg45[(4'h8):(2'h3)] ? reg49 : reg58);
    end
  assign wire66 = {((reg49[(1'h1):(1'h1)] + reg46) ?
                          (wire38 + $unsigned({(8'hae)})) : (((-(8'hb5)) | (reg52 * wire38)) ?
                              ((reg54 * (8'hb7)) ?
                                  $unsigned((8'hb5)) : $unsigned(reg48)) : $unsigned({reg49,
                                  wire50})))};
  assign wire67 = $signed(((8'hbe) << wire64[(4'he):(4'h8)]));
  assign wire68 = {wire67[(1'h0):(1'h0)]};
  assign wire69 = $signed((~&(reg57 ?
                      {(reg47 ? wire51 : wire38)} : ({reg58} >>> {wire40}))));
  assign wire70 = {(^$unsigned(reg56[(5'h12):(4'ha)])), reg59};
endmodule
