module top
#(parameter param96 = {(((8'hbf) >= ((8'haf) ? {(8'had)} : (-(7'h44)))) ? (^~(((8'h9f) ? (8'hb4) : (8'hbd)) ? ((8'ha4) ? (8'hbe) : (8'hbc)) : ((8'ha7) ? (8'hbc) : (8'h9e)))) : ((((8'hbb) ? (8'h9d) : (8'hbb)) ? (^~(8'h9c)) : ((8'hb5) ? (8'hb5) : (8'hb1))) ? (!{(8'hac), (8'ha8)}) : ((~(8'hb9)) ? ((8'haa) == (8'hbe)) : (^~(8'hae)))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h15b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire95;
  wire [(5'h12):(1'h0)] wire94;
  wire signed [(3'h7):(1'h0)] wire93;
  wire signed [(3'h5):(1'h0)] wire92;
  wire [(2'h2):(1'h0)] wire90;
  wire [(4'h8):(1'h0)] wire30;
  wire signed [(4'ha):(1'h0)] wire5;
  reg signed [(3'h6):(1'h0)] reg6 = (1'h0);
  reg [(2'h2):(1'h0)] reg7 = (1'h0);
  reg [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire90,
                 wire30,
                 wire5,
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
                 reg28,
                 reg29,
                 (1'h0)};
  assign wire5 = $signed($unsigned(((wire3 ?
                     $unsigned(wire1) : (wire2 + wire0)) == $unsigned((wire4 ?
                     wire0 : (8'hbe))))));
  always
    @(posedge clk) begin
      if ((!{$unsigned(wire1)}))
        begin
          reg6 <= {({(wire3 ? wire3[(3'h5):(1'h1)] : wire5[(3'h6):(1'h1)]),
                      (wire3[(1'h0):(1'h0)] ? {wire0} : (^wire4))} ?
                  wire2 : wire3[(1'h0):(1'h0)]),
              $signed((($signed(wire0) < (|wire3)) ?
                  ($unsigned(wire5) - (~wire2)) : wire5[(3'h7):(3'h7)]))};
          if ((wire4 & $signed((8'hb0))))
            begin
              reg7 <= ($unsigned($signed($unsigned(wire0))) ?
                  wire2 : (wire1 && wire2[(1'h0):(1'h0)]));
              reg8 <= (wire3[(2'h3):(2'h3)] ?
                  wire3 : ({wire3, wire3[(2'h2):(1'h1)]} ?
                      (^$signed({wire3, (8'hba)})) : wire3));
              reg9 <= {($signed($signed((wire2 ?
                      wire4 : wire0))) & (($signed(reg7) ^~ reg7) ?
                      wire0 : (wire5 ^ $unsigned((8'hb6)))))};
            end
          else
            begin
              reg7 <= (($unsigned(($unsigned(wire0) > (~|reg6))) && wire1[(1'h1):(1'h1)]) ?
                  (+$unsigned((-(wire1 >>> (8'ha7))))) : {($signed($signed(reg8)) + (&wire0))});
              reg8 <= wire1;
            end
        end
      else
        begin
          reg6 <= {(+wire2), $signed(reg7)};
          reg7 <= (wire0[(4'hb):(4'h8)] <<< $unsigned((-(wire5 && $signed((8'ha1))))));
          reg8 <= wire1;
        end
      if (((7'h44) || $signed(($signed($unsigned(reg9)) * reg9))))
        begin
          reg10 <= {(8'ha8)};
          reg11 <= ($unsigned((((wire0 ? (8'hbe) : (7'h42)) ?
                      wire2[(2'h2):(2'h2)] : (7'h42)) ?
                  (((8'ha2) ? (7'h40) : (7'h40)) || (reg10 ?
                      reg6 : wire1)) : reg8)) ?
              reg6[(3'h6):(2'h3)] : wire1);
          reg12 <= (wire5[(4'h9):(3'h5)] + reg6);
        end
      else
        begin
          if ($unsigned(reg11[(4'hb):(1'h0)]))
            begin
              reg10 <= $unsigned($signed({reg12}));
              reg11 <= wire1;
              reg12 <= $unsigned(($unsigned(((wire4 ? reg11 : wire0) ?
                      (~|(8'ha5)) : (8'hbd))) ?
                  reg6 : reg8));
              reg13 <= reg7;
              reg14 <= $signed($unsigned((8'hb0)));
            end
          else
            begin
              reg10 <= $signed($unsigned((!$signed({wire3, reg14}))));
              reg11 <= ($signed({($unsigned(reg9) >= (wire1 ? wire5 : reg7)),
                  reg11}) || (+(~&(wire5[(4'ha):(3'h5)] * $signed(wire4)))));
              reg12 <= (|($unsigned((!reg8[(3'h4):(1'h1)])) ?
                  (((|reg12) ^ (reg14 < (7'h43))) ?
                      $signed($unsigned(reg14)) : (wire2 & (reg7 * reg6))) : (wire4 >= reg8[(1'h1):(1'h1)])));
            end
          reg15 <= $unsigned($signed($unsigned(reg10)));
          reg16 <= ((({$signed((7'h42))} != (8'ha3)) ? wire4 : reg7) ?
              (8'hbd) : reg7);
        end
      if ({(reg14 <<< (^wire2[(1'h0):(1'h0)]))})
        begin
          if (({$signed($unsigned({reg16}))} >> ($signed($unsigned($unsigned(reg14))) ?
              {(8'hbc),
                  $unsigned((!reg9))} : $unsigned((~^$unsigned((8'hba)))))))
            begin
              reg17 <= $unsigned((+(($unsigned(reg11) ?
                      wire0 : ((8'hae) ? wire4 : reg15)) ?
                  $signed((&reg9)) : {((8'hb3) && reg9)})));
              reg18 <= wire0[(3'h6):(1'h1)];
              reg19 <= $signed($signed($signed($unsigned($unsigned(reg10)))));
              reg20 <= (8'h9e);
              reg21 <= (~(wire3 ^~ reg12));
            end
          else
            begin
              reg17 <= reg16[(3'h4):(1'h0)];
              reg18 <= $signed(((({(8'hb5), reg17} * $unsigned(reg10)) ?
                  $signed(((8'hb1) ? wire1 : reg15)) : ({reg14} ?
                      (wire4 || wire5) : $unsigned(reg21))) || {reg21}));
            end
          if ($signed((|reg20[(1'h1):(1'h0)])))
            begin
              reg22 <= (wire1[(4'h8):(3'h4)] != wire5[(2'h2):(1'h0)]);
              reg23 <= {(reg10 + $unsigned($unsigned(reg19[(2'h3):(1'h0)])))};
              reg24 <= $unsigned(reg13[(4'he):(1'h1)]);
              reg25 <= $signed((+$unsigned((^$unsigned((8'hab))))));
            end
          else
            begin
              reg22 <= {(wire0[(3'h7):(3'h6)] ?
                      (($unsigned(reg8) ? (reg7 ^ wire5) : $unsigned(reg18)) ?
                          ((~&reg18) ?
                              wire5[(1'h1):(1'h0)] : reg15[(4'h8):(2'h3)]) : reg14[(3'h5):(3'h5)]) : {wire0[(4'hf):(3'h7)]}),
                  {($signed(reg18) ? reg22 : reg16),
                      (((|reg11) ? wire1 : reg6) ?
                          ((wire2 ?
                              wire0 : reg24) == (reg23 | (8'had))) : wire1)}};
            end
          reg26 <= reg13[(2'h3):(1'h0)];
          reg27 <= reg15[(4'he):(3'h4)];
        end
      else
        begin
          reg17 <= reg7;
          if ($signed($unsigned(reg20)))
            begin
              reg18 <= $unsigned((!reg13));
              reg19 <= ($unsigned(wire1[(4'h8):(2'h3)]) ?
                  $signed($unsigned(reg11)) : wire0[(3'h6):(1'h0)]);
            end
          else
            begin
              reg18 <= (8'h9f);
            end
          reg20 <= (((((reg20 ? reg20 : reg8) ?
                      reg17 : (reg23 ?
                          reg21 : reg13)) + $signed($signed(reg23))) ?
                  ((reg24[(2'h2):(2'h2)] ? (reg20 ? reg16 : (8'ha3)) : reg15) ?
                      ((8'hb0) ?
                          (8'ha0) : (reg13 << reg22)) : wire5) : {$unsigned({reg22,
                          reg16})}) ?
              $unsigned(reg14[(3'h5):(3'h4)]) : (8'h9d));
          if ((~^$unsigned($unsigned((+wire4[(3'h4):(1'h0)])))))
            begin
              reg21 <= {((~&(reg11 ? $unsigned(reg15) : $signed(reg19))) ?
                      (~(|(~|reg10))) : reg9),
                  $unsigned((((~|reg20) >= $unsigned(reg18)) ?
                      ((~reg21) ^ $unsigned(wire5)) : $unsigned((^~reg24))))};
              reg22 <= wire4[(2'h3):(1'h0)];
            end
          else
            begin
              reg21 <= ($unsigned(wire4[(1'h0):(1'h0)]) ?
                  ($unsigned($unsigned(reg6)) ?
                      ((~$unsigned(wire0)) ?
                          reg19[(2'h3):(2'h3)] : reg8[(1'h1):(1'h1)]) : wire0[(4'hc):(3'h6)]) : wire0[(3'h5):(3'h5)]);
            end
          reg23 <= (wire3[(3'h5):(3'h5)] ?
              reg19 : ((7'h41) - $unsigned(reg27[(4'hd):(3'h7)])));
        end
      reg28 <= $unsigned((((8'hbc) ? wire0[(3'h5):(2'h2)] : reg11) ?
          (({wire0, reg16} ? (reg9 ? reg14 : wire2) : (|reg23)) ~^ ((reg16 ?
                  (8'ha3) : reg15) ?
              (reg20 ?
                  reg9 : reg10) : wire0)) : (($unsigned(reg23) || (reg27 & wire1)) == $signed((reg9 ?
              wire2 : reg20)))));
      reg29 <= (!$signed((&$signed($signed(wire2)))));
    end
  assign wire30 = reg23;
  module31 #() modinst91 (wire90, clk, reg17, wire2, wire4, reg22, reg21);
  assign wire92 = reg17[(5'h10):(4'h8)];
  assign wire93 = $signed((~|$unsigned($unsigned(reg9[(1'h1):(1'h0)]))));
  assign wire94 = (((~((~&wire2) ? (reg20 ? (8'hbc) : reg29) : reg17)) ?
                          reg15 : reg19[(1'h0):(1'h0)]) ?
                      $signed(reg16) : {$unsigned(($signed(reg12) + $signed(reg16)))});
  assign wire95 = $signed({reg7});
endmodule

module module31  (y, clk, wire32, wire33, wire34, wire35, wire36);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire32;
  input wire [(4'hf):(1'h0)] wire33;
  input wire signed [(4'hf):(1'h0)] wire34;
  input wire [(5'h12):(1'h0)] wire35;
  input wire [(4'hf):(1'h0)] wire36;
  wire signed [(5'h13):(1'h0)] wire89;
  wire [(3'h4):(1'h0)] wire88;
  wire [(2'h3):(1'h0)] wire87;
  wire signed [(5'h12):(1'h0)] wire86;
  wire [(3'h5):(1'h0)] wire37;
  wire [(5'h13):(1'h0)] wire38;
  wire signed [(5'h15):(1'h0)] wire39;
  wire signed [(3'h7):(1'h0)] wire40;
  wire signed [(4'hc):(1'h0)] wire41;
  wire signed [(2'h3):(1'h0)] wire84;
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire84,
                 (1'h0)};
  assign wire37 = wire34;
  assign wire38 = ($signed($signed(wire37[(2'h2):(1'h1)])) >> ({wire36} ?
                      ((8'ha4) ?
                          (wire36 ?
                              (~wire33) : {wire37,
                                  wire33}) : $signed(wire36[(1'h1):(1'h0)])) : (($signed(wire32) ?
                              $signed((8'h9c)) : wire36) ?
                          ({wire36} ?
                              (~wire36) : (wire34 != wire37)) : wire32[(4'hb):(4'ha)])));
  assign wire39 = ({(wire32[(4'hc):(1'h1)] ?
                          (|(7'h43)) : $signed((wire33 ? wire32 : wire36))),
                      wire34} <<< wire36);
  assign wire40 = (({wire36[(4'h8):(2'h3)]} ?
                          $unsigned(wire38) : $unsigned(wire38[(4'hb):(2'h3)])) ?
                      ((&wire33[(1'h1):(1'h0)]) ?
                          $signed(((8'haf) ?
                              (wire34 ?
                                  wire39 : wire35) : $unsigned(wire35))) : $signed({(wire36 ?
                                  (8'hb3) : wire38)})) : wire34[(4'hb):(3'h5)]);
  assign wire41 = (-(8'hbe));
  module42 #() modinst85 (wire84, clk, wire36, wire39, wire33, wire35, wire41);
  assign wire86 = $signed($signed($signed(({wire36} < wire34[(4'ha):(4'ha)]))));
  assign wire87 = wire41;
  assign wire88 = (wire32[(5'h10):(4'h9)] ?
                      wire39 : $unsigned($signed((^(~&wire37)))));
  assign wire89 = (((+$unsigned($signed(wire41))) >> $signed({(wire32 * wire36)})) ?
                      (8'hb4) : wire39);
endmodule

module module42
#(parameter param82 = (~^{((-(+(8'ha0))) | {(|(8'hb4)), (+(8'h9f))})}), 
parameter param83 = (8'hac))
(y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'h180):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire47;
  input wire [(5'h15):(1'h0)] wire46;
  input wire signed [(4'hf):(1'h0)] wire45;
  input wire signed [(5'h12):(1'h0)] wire44;
  input wire [(4'ha):(1'h0)] wire43;
  wire [(3'h5):(1'h0)] wire81;
  wire signed [(5'h10):(1'h0)] wire77;
  wire [(4'h9):(1'h0)] wire76;
  wire [(5'h12):(1'h0)] wire60;
  wire signed [(5'h11):(1'h0)] wire54;
  wire signed [(4'ha):(1'h0)] wire53;
  wire signed [(2'h3):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire51;
  wire signed [(4'hb):(1'h0)] wire50;
  wire signed [(5'h12):(1'h0)] wire49;
  wire signed [(5'h12):(1'h0)] wire48;
  reg [(5'h15):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg79 = (1'h0);
  reg [(4'h9):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg74 = (1'h0);
  reg [(2'h2):(1'h0)] reg73 = (1'h0);
  reg [(4'hd):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg70 = (1'h0);
  reg [(5'h11):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg67 = (1'h0);
  reg [(4'ha):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg64 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg62 = (1'h0);
  reg [(2'h3):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg [(5'h13):(1'h0)] reg57 = (1'h0);
  reg [(4'hf):(1'h0)] reg56 = (1'h0);
  reg [(5'h13):(1'h0)] reg55 = (1'h0);
  assign y = {wire81,
                 wire77,
                 wire76,
                 wire60,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 reg80,
                 reg79,
                 reg78,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 (1'h0)};
  assign wire48 = ((($unsigned((wire45 ? wire46 : wire46)) & $unsigned({wire45,
                      (8'ha9)})) <<< $unsigned((8'ha9))) < wire46);
  assign wire49 = ($unsigned(wire48) ?
                      $unsigned($signed(((wire44 ?
                          (8'ha7) : wire48) == (wire44 ~^ wire48)))) : (+$signed((^~(wire44 ^ wire47)))));
  assign wire50 = ((+$unsigned(wire45[(4'he):(4'hc)])) ?
                      wire45[(4'h9):(4'h9)] : wire48[(4'ha):(3'h4)]);
  assign wire51 = $unsigned($unsigned((($unsigned(wire45) ?
                          $signed(wire48) : wire49[(2'h3):(2'h2)]) ?
                      (&$signed(wire47)) : (!(wire43 || wire49)))));
  assign wire52 = $signed({(((^wire47) - {wire49,
                          wire47}) > ($unsigned(wire46) ?
                          (wire45 ? wire48 : (7'h41)) : (wire51 ?
                              wire50 : wire45)))});
  assign wire53 = wire44;
  assign wire54 = ({wire44[(5'h12):(5'h12)]} ^ ((^$signed((wire53 + wire44))) >> (wire45 <<< $signed({wire52,
                      (7'h40)}))));
  always
    @(posedge clk) begin
      reg55 <= ({wire53[(1'h0):(1'h0)], (+(^(wire52 != wire49)))} ?
          {$signed($signed((&wire48)))} : $unsigned($unsigned(((wire54 ?
              wire53 : (8'hb5)) && $signed(wire52)))));
      reg56 <= (^$signed((!(^$unsigned((8'hb6))))));
      reg57 <= {wire48[(1'h0):(1'h0)]};
      reg58 <= (~$unsigned((^$unsigned(wire51))));
      reg59 <= wire44;
    end
  assign wire60 = {$unsigned(reg59)};
  always
    @(posedge clk) begin
      reg61 <= (wire51[(3'h6):(3'h6)] > wire48);
    end
  always
    @(posedge clk) begin
      reg62 <= ($signed((wire53 ?
          ((wire54 >> wire47) != (^~(7'h40))) : (~^wire45[(4'h9):(4'h8)]))) * (8'ha9));
      if ((~^(~&$unsigned(($unsigned(wire60) >>> {reg61, (8'hb7)})))))
        begin
          if (wire52)
            begin
              reg63 <= $unsigned((~&$unsigned((~$unsigned(reg61)))));
              reg64 <= {wire60[(5'h12):(3'h6)]};
              reg65 <= reg61;
            end
          else
            begin
              reg63 <= reg61;
              reg64 <= (((8'h9f) ?
                  ($unsigned((^~reg57)) == ((!reg56) <<< (wire51 ?
                      (8'hb9) : wire52))) : ($unsigned({reg59,
                      reg59}) > ((wire52 <= wire50) ?
                      reg65[(2'h3):(2'h3)] : ((8'ha6) ?
                          reg59 : reg63)))) ^~ {wire47,
                  ($signed((|reg59)) ?
                      ((&(8'h9d)) ?
                          ((8'haa) << wire53) : ((8'hb9) ?
                              wire46 : reg62)) : $signed((reg63 >>> wire54)))});
            end
          reg66 <= (wire60[(2'h2):(1'h1)] ~^ reg61[(2'h3):(2'h3)]);
          reg67 <= ((reg61 < wire52) || (({{wire48, (8'hbd)},
                  (wire53 >>> wire46)} ?
              wire45[(4'he):(2'h3)] : ($signed(wire50) ?
                  (reg62 <= (8'hb4)) : (wire53 * reg57))) & reg61[(1'h1):(1'h1)]));
        end
      else
        begin
          reg63 <= wire47[(4'ha):(4'h8)];
          reg64 <= (~&$unsigned(($unsigned((-reg62)) >> $signed(wire52))));
          reg65 <= $signed((($signed(reg66) ?
              (reg58[(4'he):(4'hc)] ~^ ((8'ha3) ?
                  reg58 : reg61)) : ($signed(wire49) ?
                  $unsigned((8'hbe)) : (wire50 * reg66))) == ({$signed(wire53)} ?
              (~|(&(8'hb2))) : (~^(^~wire50)))));
          reg66 <= (^~wire51);
          reg67 <= (8'haf);
        end
      if ($signed((($signed((~&reg64)) != $unsigned((wire48 ?
              (7'h42) : reg55))) ?
          reg55 : reg56)))
        begin
          reg68 <= (8'hb3);
        end
      else
        begin
          reg68 <= (+reg55);
          reg69 <= (reg63 ?
              ($signed($signed($signed(reg57))) && (8'hbd)) : ($signed((reg64[(3'h4):(3'h4)] ?
                  $unsigned(reg59) : $signed(wire45))) > $signed(reg59)));
          reg70 <= $signed(reg66);
          reg71 <= $unsigned(reg58);
          reg72 <= (~$signed($signed((reg64 ? wire46 : reg63))));
        end
      if ({wire48,
          (reg63[(3'h5):(2'h2)] && (wire51 && $signed((reg58 | wire54))))})
        begin
          reg73 <= {$unsigned($signed(reg63[(1'h0):(1'h0)])), (8'h9f)};
          reg74 <= ($signed(reg71) ?
              (~|wire47) : ($signed(wire60[(4'h8):(2'h2)]) || ((~wire48) ?
                  ((+reg58) << (reg67 - (8'had))) : ($signed(reg64) || $unsigned((8'hb4))))));
          reg75 <= ({(((~^reg68) ? (wire51 ? (8'ha2) : reg63) : (^reg56)) ?
                      (~|reg74[(2'h2):(1'h0)]) : reg59[(2'h2):(1'h1)]),
                  reg70} ?
              reg71 : {{($signed(wire54) >>> (wire44 ? (8'hbb) : reg57)),
                      (reg64 ? (reg74 ? wire60 : reg61) : reg67)},
                  reg61});
        end
      else
        begin
          reg73 <= (&((^~reg68[(2'h3):(1'h0)]) >= (-reg69[(4'ha):(1'h0)])));
          reg74 <= {wire47[(4'ha):(4'h9)]};
          reg75 <= $signed((8'ha4));
        end
    end
  assign wire76 = (^~(wire49 ?
                      $signed(($signed((7'h41)) != {wire46,
                          (8'hb9)})) : $unsigned(wire53[(1'h0):(1'h0)])));
  assign wire77 = $unsigned($signed(($signed((wire47 ? reg70 : reg58)) ?
                      {{reg68}, wire54} : $signed($unsigned((8'ha8))))));
  always
    @(posedge clk) begin
      reg78 <= reg68;
      reg79 <= $signed({reg55});
      reg80 <= reg64[(1'h0):(1'h0)];
    end
  assign wire81 = reg69;
endmodule
