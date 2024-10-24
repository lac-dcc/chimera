module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h569):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  wire [(4'hd):(1'h0)] wire132;
  wire [(5'h10):(1'h0)] wire128;
  wire [(5'h12):(1'h0)] wire127;
  wire [(4'hd):(1'h0)] wire126;
  wire signed [(3'h5):(1'h0)] wire4;
  wire [(4'hb):(1'h0)] wire27;
  wire [(4'h9):(1'h0)] wire61;
  wire [(4'ha):(1'h0)] wire62;
  wire signed [(4'he):(1'h0)] wire81;
  wire signed [(5'h11):(1'h0)] wire82;
  wire signed [(5'h12):(1'h0)] wire93;
  wire signed [(5'h13):(1'h0)] wire94;
  wire [(5'h15):(1'h0)] wire104;
  wire signed [(3'h4):(1'h0)] wire124;
  reg [(3'h7):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg140 = (1'h0);
  reg [(5'h15):(1'h0)] reg139 = (1'h0);
  reg [(5'h11):(1'h0)] reg138 = (1'h0);
  reg [(5'h10):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg136 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg135 = (1'h0);
  reg [(5'h10):(1'h0)] reg134 = (1'h0);
  reg [(4'he):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg131 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg130 = (1'h0);
  reg [(5'h15):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg44 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg46 = (1'h0);
  reg [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg48 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  reg [(4'ha):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(4'he):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg55 = (1'h0);
  reg [(2'h3):(1'h0)] reg56 = (1'h0);
  reg [(4'h9):(1'h0)] reg57 = (1'h0);
  reg [(4'ha):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg59 = (1'h0);
  reg [(4'hd):(1'h0)] reg60 = (1'h0);
  reg signed [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(4'hf):(1'h0)] reg64 = (1'h0);
  reg [(5'h10):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg67 = (1'h0);
  reg [(4'h9):(1'h0)] reg68 = (1'h0);
  reg [(2'h2):(1'h0)] reg69 = (1'h0);
  reg [(4'hf):(1'h0)] reg70 = (1'h0);
  reg [(2'h3):(1'h0)] reg71 = (1'h0);
  reg [(3'h7):(1'h0)] reg72 = (1'h0);
  reg [(4'he):(1'h0)] reg73 = (1'h0);
  reg [(4'h8):(1'h0)] reg74 = (1'h0);
  reg [(4'hb):(1'h0)] reg75 = (1'h0);
  reg [(4'he):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg77 = (1'h0);
  reg [(4'hf):(1'h0)] reg78 = (1'h0);
  reg [(3'h5):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg80 = (1'h0);
  reg [(5'h12):(1'h0)] reg83 = (1'h0);
  reg [(3'h7):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg86 = (1'h0);
  reg [(5'h12):(1'h0)] reg87 = (1'h0);
  reg [(5'h14):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg90 = (1'h0);
  reg [(4'hf):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg96 = (1'h0);
  reg [(4'h8):(1'h0)] reg97 = (1'h0);
  reg [(4'h8):(1'h0)] reg98 = (1'h0);
  reg [(4'hd):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg100 = (1'h0);
  reg [(5'h10):(1'h0)] reg101 = (1'h0);
  reg [(4'h8):(1'h0)] reg102 = (1'h0);
  reg [(3'h7):(1'h0)] reg103 = (1'h0);
  assign y = {wire132,
                 wire128,
                 wire127,
                 wire126,
                 wire4,
                 wire27,
                 wire61,
                 wire62,
                 wire81,
                 wire82,
                 wire93,
                 wire94,
                 wire104,
                 wire124,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg131,
                 reg130,
                 reg129,
                 reg5,
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
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
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
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 reg99,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 (1'h0)};
  assign wire4 = wire3;
  always
    @(posedge clk) begin
      reg5 <= ((-{wire4[(1'h0):(1'h0)],
          ($signed(wire1) == $unsigned((7'h43)))}) >= $unsigned((+wire0)));
      if ((&$signed(($signed((8'ha7)) ?
          reg5 : (wire4[(1'h0):(1'h0)] & (wire1 ? wire3 : wire2))))))
        begin
          reg6 <= $unsigned(wire1[(5'h15):(5'h13)]);
          reg7 <= (reg5[(3'h6):(1'h0)] >> (!$unsigned($signed(reg5[(1'h0):(1'h0)]))));
          reg8 <= $unsigned((($unsigned((wire4 ? wire0 : reg7)) ?
                  (~(wire0 ? wire3 : wire3)) : reg7) ?
              (!((reg7 == wire2) ?
                  (|reg5) : $unsigned(reg5))) : ($signed(wire0) ?
                  wire3[(3'h7):(3'h6)] : reg6)));
          reg9 <= (($unsigned((^(reg5 ? reg7 : reg5))) ?
              (&$signed(wire2[(4'he):(3'h5)])) : ({((8'hb6) ? wire4 : wire1)} ?
                  $unsigned((~&wire4)) : $signed($unsigned(wire0)))) > ($unsigned(reg7[(3'h7):(2'h2)]) ?
              (8'ha7) : ($unsigned((8'hb8)) == $unsigned((~|reg5)))));
          reg10 <= $signed((|(($unsigned(reg7) || (wire3 <<< wire2)) < ($unsigned(wire2) ?
              wire0[(2'h3):(1'h0)] : (wire1 | wire3)))));
        end
      else
        begin
          reg6 <= (~(~($unsigned(wire2) && wire1[(4'ha):(4'h9)])));
          reg7 <= (-(wire0[(1'h0):(1'h0)] >> $signed((^reg10[(1'h1):(1'h1)]))));
          reg8 <= reg9[(5'h10):(3'h4)];
          reg9 <= $unsigned({$signed(($signed(reg10) ?
                  $unsigned(wire2) : wire0)),
              ((~&wire1) ? reg5[(3'h5):(1'h0)] : wire4)});
        end
      if ($unsigned(((($unsigned(reg7) ?
              (wire3 ^~ (8'hae)) : $signed((8'h9c))) ?
          wire3 : wire4) <= $signed(wire0[(4'ha):(3'h7)]))))
        begin
          reg11 <= $signed(reg8);
          reg12 <= wire4;
        end
      else
        begin
          reg11 <= wire1;
          reg12 <= reg12;
          reg13 <= {(((|(wire1 >>> wire4)) ?
                  ($unsigned((8'h9e)) > wire3) : ((wire3 ?
                      reg8 : reg5) || (wire2 || reg8))) + ($signed((reg7 || wire4)) && $unsigned($signed(wire1))))};
        end
      if ({($signed((&reg12)) ? $signed(reg5[(3'h7):(3'h5)]) : (~(-(8'ha2))))})
        begin
          reg14 <= {((((~|(7'h42)) >> {wire4, reg13}) ?
                      $signed((reg7 & reg10)) : (~^$unsigned(reg5))) ?
                  wire2[(4'hf):(2'h2)] : (8'hb3))};
          reg15 <= $signed(wire4[(3'h4):(3'h4)]);
          if (((wire2[(2'h3):(1'h1)] + ($unsigned($signed(wire1)) ?
              wire2 : ($unsigned((8'h9d)) << (wire1 + wire1)))) >>> ((((reg13 ?
                      wire2 : reg13) ?
                  reg8[(4'h8):(1'h0)] : {wire3}) ?
              (((8'ha9) == reg5) >>> wire0[(3'h5):(2'h2)]) : {((8'h9f) <= wire1)}) + ((^~(~wire0)) ?
              $signed((reg14 ? (8'h9c) : wire4)) : reg6))))
            begin
              reg16 <= {($unsigned({$unsigned(wire3),
                      (reg6 >>> wire2)}) >>> $unsigned(reg13))};
              reg17 <= wire1[(3'h6):(1'h1)];
              reg18 <= (({(8'hbf), (+((8'ha7) != (8'ha8)))} ?
                      $unsigned($signed(wire0[(3'h5):(3'h4)])) : $signed(wire4)) ?
                  reg9 : wire3);
              reg19 <= ((reg9[(1'h1):(1'h1)] && $signed((~|$signed(reg7)))) <<< $signed(wire1));
            end
          else
            begin
              reg16 <= reg13[(3'h7):(3'h4)];
              reg17 <= reg13[(4'ha):(3'h6)];
              reg18 <= ({(reg8 <= $signed(((8'ha8) ~^ reg16)))} ?
                  {$signed(((^reg14) << reg7[(3'h6):(2'h3)]))} : (!$signed($unsigned((+reg15)))));
              reg19 <= $signed({{{(!wire0)}, $unsigned(reg13[(4'ha):(1'h0)])}});
              reg20 <= ({$signed({(reg18 ? reg18 : reg9),
                      reg7})} || $signed($signed($unsigned($unsigned((8'hbf))))));
            end
          if ({($signed($unsigned($unsigned(reg8))) ?
                  (($unsigned(wire2) ? (|wire4) : {reg9, (7'h43)}) ?
                      ($unsigned(reg5) || reg12[(2'h2):(2'h2)]) : reg13) : ($unsigned($unsigned(wire4)) | reg12))})
            begin
              reg21 <= (reg6 ?
                  (({$signed(reg16), wire4} ?
                      $unsigned($unsigned((8'hb4))) : $unsigned($unsigned(reg11))) == reg17[(4'hd):(4'hd)]) : ($unsigned($signed((+wire4))) - (wire3 ?
                      $unsigned((wire4 ?
                          reg19 : reg6)) : reg13[(4'he):(4'he)])));
              reg22 <= ({(-$unsigned($unsigned((8'hbf))))} ?
                  {{{reg5[(3'h4):(1'h0)],
                              (reg13 ?
                                  wire2 : reg5)}}} : (reg20[(2'h3):(2'h3)] << reg19));
            end
          else
            begin
              reg21 <= (reg8[(4'he):(4'h8)] == ((((~|reg14) * {wire3,
                  reg5}) ^ $signed(reg12)) >> (reg10[(2'h2):(1'h1)] ?
                  $signed(((8'hb2) ? wire2 : reg6)) : wire0)));
              reg22 <= $signed((&reg9[(4'h9):(2'h3)]));
              reg23 <= $unsigned($unsigned((~&(&wire4[(3'h5):(1'h1)]))));
              reg24 <= (~|(~&($signed($signed(reg18)) == (8'ha0))));
            end
          reg25 <= (((8'hba) ?
                  $signed(wire4[(1'h0):(1'h0)]) : reg16[(2'h2):(1'h1)]) ?
              $unsigned((((reg17 > (8'ha9)) ?
                  wire1 : (reg13 ? reg5 : reg16)) + {$unsigned(wire2),
                  $unsigned(reg23)})) : $unsigned((reg7[(4'hd):(4'hd)] << (+$signed(reg5)))));
        end
      else
        begin
          if ($signed(reg11[(3'h5):(1'h0)]))
            begin
              reg14 <= reg11;
            end
          else
            begin
              reg14 <= $signed($unsigned(reg12));
              reg15 <= ({(-wire1[(4'ha):(3'h4)]),
                  wire2} & reg18[(1'h1):(1'h1)]);
              reg16 <= (reg20 + (reg7 | (($signed((7'h40)) ?
                      (reg5 || reg11) : $signed(reg18)) ?
                  $unsigned((reg19 ^~ wire2)) : reg8[(4'h8):(4'h8)])));
            end
          if ($unsigned($signed({$signed(wire0[(1'h1):(1'h0)]),
              (&(wire0 < reg20))})))
            begin
              reg17 <= ({wire4[(3'h4):(2'h2)],
                  ($unsigned((~^reg10)) != reg22)} ^~ $unsigned((wire0[(1'h1):(1'h1)] << $signed((reg13 ?
                  reg8 : reg23)))));
              reg18 <= (8'hb9);
            end
          else
            begin
              reg17 <= $unsigned((8'ha1));
              reg18 <= reg25;
              reg19 <= reg15;
              reg20 <= reg22;
              reg21 <= $signed((^~$unsigned($unsigned((|wire2)))));
            end
          reg22 <= ((-$unsigned(reg8)) ?
              ($signed((~(wire4 ? reg13 : reg6))) ?
                  $signed($signed($unsigned(reg15))) : $unsigned($unsigned((reg7 >>> (8'hbe))))) : $unsigned((8'hb4)));
          reg23 <= $unsigned(reg11[(3'h4):(1'h0)]);
        end
      reg26 <= (8'hb6);
    end
  assign wire27 = reg13;
  always
    @(posedge clk) begin
      reg28 <= reg12;
      if ((~^(!(~&($signed(reg7) ? wire3 : wire0[(4'ha):(4'ha)])))))
        begin
          if (wire4[(2'h3):(2'h3)])
            begin
              reg29 <= $unsigned((~(($unsigned(reg19) <<< reg21[(3'h5):(1'h0)]) ?
                  $signed(reg8[(4'hd):(4'h9)]) : (|$signed(reg10)))));
              reg30 <= $signed(wire3[(2'h3):(1'h0)]);
              reg31 <= ((reg14 + (^$unsigned((8'haa)))) ^~ {(((-reg9) ?
                      wire27[(1'h0):(1'h0)] : (reg11 ?
                          reg22 : (8'had))) && (&((8'hbf) >>> (8'hb1)))),
                  ($unsigned({reg21, reg12}) ?
                      ($signed(reg14) ? reg13 : (^~reg15)) : {{(8'ha5),
                              (8'hb3)}})});
            end
          else
            begin
              reg29 <= (~&{$signed($unsigned($unsigned(wire27))),
                  ($signed(reg16[(1'h0):(1'h0)]) ?
                      $signed((!wire4)) : (reg7[(2'h2):(1'h0)] + {reg6}))});
              reg30 <= reg28;
              reg31 <= $unsigned(wire1);
            end
        end
      else
        begin
          reg29 <= ({(^(-{reg5, reg15})), (8'h9e)} ?
              {(~&((~|reg10) ? $unsigned(reg23) : (!wire3)))} : wire1);
          reg30 <= (wire1 <= reg21[(3'h7):(3'h7)]);
        end
      if (reg12[(3'h7):(1'h1)])
        begin
          reg32 <= wire27[(4'ha):(2'h3)];
          if ((-$signed((^~((wire2 ? reg29 : reg10) ?
              $unsigned(reg16) : reg9)))))
            begin
              reg33 <= (8'hbd);
              reg34 <= {reg6};
              reg35 <= $signed(reg30[(3'h6):(1'h0)]);
              reg36 <= reg9[(4'ha):(2'h3)];
              reg37 <= ($signed((wire2 * {$signed(reg28), (~reg9)})) ?
                  (~^reg6[(1'h1):(1'h0)]) : reg11[(2'h2):(1'h1)]);
            end
          else
            begin
              reg33 <= (-$unsigned((reg26[(3'h6):(2'h3)] >= ((wire27 && reg16) ?
                  (wire0 <<< (8'hb5)) : reg5[(2'h3):(1'h0)]))));
              reg34 <= (^((($signed(reg17) ?
                  (~&reg36) : (~^reg25)) && reg14) || (~|reg11[(5'h10):(4'ha)])));
              reg35 <= $signed(($unsigned(reg29[(5'h15):(5'h15)]) ?
                  reg25[(3'h7):(3'h5)] : ((reg18[(1'h1):(1'h0)] ?
                          (reg20 ? wire4 : reg29) : $unsigned((8'hb6))) ?
                      (^{reg8}) : reg9)));
            end
        end
      else
        begin
          reg32 <= $unsigned(reg7[(3'h6):(2'h3)]);
          reg33 <= ({$signed({reg6[(3'h4):(1'h1)]}),
              $unsigned({(-reg18), $unsigned(reg28)})} | reg13);
          reg34 <= reg28;
          reg35 <= (~^(reg30 ?
              (~^$unsigned((reg20 - wire0))) : $unsigned(((-reg35) ?
                  ((8'hbe) ? reg5 : wire2) : $signed(reg13)))));
          reg36 <= (~^(reg23 <= $signed(((!reg21) >>> reg5))));
        end
      reg38 <= wire27[(2'h3):(1'h0)];
      if ((reg34[(1'h1):(1'h1)] || (reg9[(4'hf):(4'hf)] ?
          ($signed({reg5}) >> ($signed((8'ha1)) >> (reg15 ?
              reg6 : reg6))) : ({wire3, (!reg32)} >= $signed($signed(reg28))))))
        begin
          reg39 <= $signed(reg21[(2'h3):(2'h3)]);
        end
      else
        begin
          reg39 <= {($unsigned($signed(reg15)) ?
                  $unsigned({reg8}) : $signed((~&$unsigned(reg36))))};
          if (((reg7[(4'h9):(3'h4)] >= (|$unsigned((reg13 ?
              wire0 : reg37)))) <<< $unsigned(((~&(-reg29)) ?
              $unsigned((reg37 ^~ reg26)) : ($unsigned(reg21) - reg19[(2'h2):(1'h1)])))))
            begin
              reg40 <= (reg12[(4'h8):(3'h5)] ?
                  reg16 : $signed($unsigned(reg25[(3'h4):(2'h3)])));
              reg41 <= $unsigned(reg35);
              reg42 <= (reg7 ?
                  (^(((wire3 ? reg30 : (8'ha5)) > reg7[(1'h0):(1'h0)]) ?
                      (^~(reg10 ?
                          reg41 : reg30)) : $unsigned((wire4 << (8'h9e))))) : ((^wire0[(4'hb):(2'h2)]) ?
                      (7'h44) : reg33));
            end
          else
            begin
              reg40 <= reg38[(1'h0):(1'h0)];
            end
          reg43 <= (reg10[(2'h2):(1'h0)] && $unsigned(((&(^~reg6)) ?
              (~|reg28[(1'h0):(1'h0)]) : $signed($unsigned((7'h42))))));
          reg44 <= (-{$unsigned(($signed(reg20) ? (!reg17) : reg23)),
              $unsigned(reg36)});
          reg45 <= (($signed($unsigned($unsigned(reg29))) ?
              $signed($unsigned(reg20[(2'h2):(2'h2)])) : $unsigned((~^reg31[(2'h2):(1'h0)]))) | $unsigned(wire1));
        end
    end
  always
    @(posedge clk) begin
      reg46 <= reg38[(2'h3):(2'h3)];
      if (reg31)
        begin
          if ($signed((!$signed($signed($unsigned(reg15))))))
            begin
              reg47 <= {(~|(7'h43)), reg23};
              reg48 <= $signed(reg22);
              reg49 <= $unsigned((^~((reg37 - {reg33, reg39}) ?
                  {(+reg6)} : $unsigned(reg25))));
            end
          else
            begin
              reg47 <= {reg28[(4'hd):(4'hc)],
                  ($signed(reg24) ? reg15 : (&reg41))};
              reg48 <= $unsigned({(-(8'hae))});
              reg49 <= $signed($unsigned($signed((8'h9e))));
              reg50 <= (-$unsigned(reg18));
              reg51 <= $signed(reg10);
            end
          if (reg5)
            begin
              reg52 <= reg29;
              reg53 <= reg49[(3'h7):(1'h0)];
              reg54 <= $signed((8'hbc));
              reg55 <= (reg5[(1'h1):(1'h0)] || reg25[(4'h9):(2'h2)]);
              reg56 <= reg24[(2'h2):(1'h0)];
            end
          else
            begin
              reg52 <= $unsigned(((~&reg8) ?
                  reg45[(1'h0):(1'h0)] : $signed((~^reg8[(1'h1):(1'h0)]))));
              reg53 <= $unsigned(({reg18, reg31[(4'hc):(4'h9)]} ?
                  (|$signed((reg46 >= wire0))) : ({(reg18 ?
                          reg9 : reg30)} >> wire27[(3'h6):(3'h4)])));
            end
          if ($unsigned(reg33))
            begin
              reg57 <= reg50[(3'h7):(3'h4)];
              reg58 <= {($unsigned($signed($signed(reg34))) << (reg54 ?
                      (^~wire27) : (^~$signed(reg33))))};
              reg59 <= $unsigned($signed(reg33));
              reg60 <= $signed($signed((~reg24[(1'h0):(1'h0)])));
            end
          else
            begin
              reg57 <= ((-{$unsigned($unsigned(reg33))}) ^~ (-reg26));
              reg58 <= $signed($signed(($unsigned($unsigned(reg21)) <= $signed((~&wire2)))));
              reg59 <= (~|({({reg37} ~^ wire4[(1'h0):(1'h0)]),
                  ($unsigned(reg14) ^ $signed(wire3))} << reg31));
            end
        end
      else
        begin
          reg47 <= (reg24[(1'h0):(1'h0)] == ($unsigned((~&reg11[(4'hb):(4'h8)])) ?
              reg60[(2'h3):(1'h1)] : {$unsigned((reg8 < reg39))}));
          reg48 <= $signed(reg50[(3'h5):(3'h4)]);
          reg49 <= $signed($signed($signed($unsigned(reg50[(1'h0):(1'h0)]))));
          reg50 <= $signed($unsigned(wire0[(3'h4):(3'h4)]));
        end
    end
  assign wire61 = (~|(reg46 ?
                      $signed(reg57[(3'h7):(2'h2)]) : ({(reg42 * reg32)} <<< ((+reg46) ?
                          $unsigned((8'hab)) : (^reg32)))));
  assign wire62 = ({reg10[(2'h2):(1'h1)],
                      {$unsigned((~^reg9))}} ^ ($unsigned(((~reg40) ?
                          ((8'hac) <= reg25) : reg14)) ?
                      (((reg21 >= reg37) <<< (^~reg46)) ?
                          reg13 : (reg35 >>> $unsigned(reg18))) : reg35[(4'h8):(3'h6)]));
  always
    @(posedge clk) begin
      if ((~|$unsigned($signed((8'hb5)))))
        begin
          reg63 <= $signed(reg44);
          if ((&$unsigned((|{(&(8'haa)), $signed(reg42)}))))
            begin
              reg64 <= reg29[(3'h7):(1'h0)];
              reg65 <= ({((|(~^reg22)) ?
                          ((8'ha6) != reg7[(2'h3):(1'h1)]) : reg18)} ?
                  $signed(reg30[(4'h9):(2'h3)]) : wire62[(3'h6):(2'h3)]);
              reg66 <= {$signed(reg63[(4'he):(2'h2)])};
              reg67 <= {reg25};
              reg68 <= reg22[(4'he):(4'hd)];
            end
          else
            begin
              reg64 <= (wire0 ?
                  reg56[(1'h1):(1'h1)] : $unsigned(reg43[(2'h2):(1'h1)]));
              reg65 <= $signed({$unsigned((~&$unsigned(reg5))),
                  $unsigned({$signed(reg32), (reg10 >> reg33)})});
            end
          reg69 <= $unsigned(reg47);
        end
      else
        begin
          reg63 <= (|(|$signed(wire1)));
          reg64 <= $signed($unsigned($signed($signed(wire2[(2'h3):(2'h3)]))));
          if ($unsigned((~reg44)))
            begin
              reg65 <= reg59[(1'h0):(1'h0)];
            end
          else
            begin
              reg65 <= reg63;
              reg66 <= reg13[(1'h0):(1'h0)];
              reg67 <= wire0[(2'h3):(1'h0)];
              reg68 <= (~&$signed(reg11[(3'h4):(2'h2)]));
            end
          reg69 <= reg46;
          reg70 <= (|(((^~(reg49 >>> reg15)) - reg32) ?
              $signed($signed($unsigned(reg7))) : reg18[(2'h3):(1'h1)]));
        end
      reg71 <= (^(reg37 < (reg43[(1'h0):(1'h0)] ?
          ($signed((8'hb2)) && ((8'hab) ^ reg13)) : ($signed((8'hb7)) >>> reg7[(1'h1):(1'h1)]))));
      if ((7'h42))
        begin
          reg72 <= reg17;
          reg73 <= wire0[(4'h9):(3'h6)];
          reg74 <= (-(reg51[(2'h2):(2'h2)] ?
              ({{reg5,
                      reg48}} != (~|reg11[(5'h12):(4'hb)])) : $unsigned((~&reg33))));
          reg75 <= reg53[(1'h0):(1'h0)];
        end
      else
        begin
          if ((wire4 >>> (((reg7 >> wire2) <<< wire61[(3'h7):(2'h3)]) == (($unsigned(reg14) ?
              reg14 : (8'ha8)) < ($signed(reg58) <= (reg54 ? reg43 : reg8))))))
            begin
              reg72 <= $signed({((8'had) ~^ wire61[(4'h9):(4'h8)])});
              reg73 <= (wire0[(3'h5):(1'h0)] ?
                  $signed((~^reg12)) : $signed($signed((^~(~(8'hb7))))));
              reg74 <= (~&(|{wire2[(1'h1):(1'h0)], reg47}));
              reg75 <= (reg45 ? reg30 : $unsigned({(!{(8'hac)})}));
              reg76 <= (($signed(reg29[(4'h8):(4'h8)]) || (-$signed((reg38 ?
                      reg23 : wire2)))) ?
                  reg20[(1'h1):(1'h1)] : (reg55 ^~ reg38));
            end
          else
            begin
              reg72 <= (8'hac);
            end
          if (reg56[(1'h1):(1'h0)])
            begin
              reg77 <= (8'ha6);
              reg78 <= reg57[(1'h1):(1'h1)];
            end
          else
            begin
              reg77 <= wire2[(2'h2):(2'h2)];
              reg78 <= reg38[(3'h6):(2'h2)];
              reg79 <= reg10[(1'h1):(1'h1)];
              reg80 <= (^$signed((8'hb0)));
            end
        end
    end
  assign wire81 = $signed(((((reg66 ? reg20 : reg58) ?
                          (&reg72) : $signed(reg45)) ?
                      $unsigned((&reg55)) : reg22) >> reg14));
  assign wire82 = {(~|((^(reg6 ^ reg48)) ?
                          $signed((reg66 ?
                              reg58 : (8'hbd))) : $signed($unsigned(reg29)))),
                      {({((8'hac) && reg54)} ?
                              reg47[(1'h0):(1'h0)] : reg24[(1'h0):(1'h0)]),
                          (8'hb7)}};
  always
    @(posedge clk) begin
      reg83 <= $unsigned(reg72[(3'h6):(1'h0)]);
      reg84 <= wire62;
      reg85 <= $unsigned(reg84[(3'h7):(3'h5)]);
      if ({(wire4 ? (8'hb4) : reg42), (reg53 << wire82)})
        begin
          reg86 <= $unsigned(((^~(~^reg23[(3'h5):(3'h5)])) ?
              (7'h41) : ($unsigned($signed(reg54)) ?
                  ($signed((8'hb3)) ? reg35 : {reg5}) : ((reg37 ?
                          reg40 : reg57) ?
                      ((8'ha3) - reg23) : $signed((7'h40))))));
          if ($unsigned($signed(reg23)))
            begin
              reg87 <= reg13;
              reg88 <= $signed($signed({{wire27[(3'h6):(3'h6)],
                      reg28[(3'h7):(2'h2)]},
                  (-(reg77 ? wire2 : reg76))}));
              reg89 <= reg8[(4'h8):(4'h8)];
            end
          else
            begin
              reg87 <= $unsigned(wire82);
              reg88 <= reg73[(1'h0):(1'h0)];
              reg89 <= reg23;
              reg90 <= ($unsigned((^reg69[(1'h1):(1'h0)])) - ((reg50 ?
                      (!(~(8'hbe))) : (wire0 >= {reg37, reg25})) ?
                  wire0 : (^$unsigned(reg80[(2'h3):(2'h2)]))));
              reg91 <= $signed((^$signed(wire62)));
            end
          reg92 <= reg25[(3'h4):(2'h3)];
        end
      else
        begin
          reg86 <= (^~(($signed($signed(reg71)) + (reg72[(3'h4):(3'h4)] ?
              reg78 : (~^reg38))) >> (({wire82} ?
              $unsigned(reg39) : $unsigned(reg37)) >> ($unsigned(reg75) <<< (~reg21)))));
        end
    end
  assign wire93 = {$unsigned($signed($unsigned((|(8'ha2))))), $signed(reg60)};
  assign wire94 = reg53[(4'hd):(4'ha)];
  always
    @(posedge clk) begin
      reg95 <= ($signed((reg75 ?
          $signed(((8'ha9) && reg44)) : $signed(((8'h9d) <<< reg21)))) ~^ {reg63[(1'h0):(1'h0)]});
      if ({(((~$unsigned(reg34)) ?
                  (((8'hba) && reg79) ?
                      reg26[(4'hb):(1'h1)] : $signed((8'ha0))) : $unsigned((reg9 != reg84))) ?
              ($unsigned(reg85) << $unsigned({reg12})) : $unsigned((^~{reg31}))),
          $signed(reg11[(1'h0):(1'h0)])})
        begin
          reg96 <= (~&$unsigned($signed((~(reg11 ? reg72 : (8'h9f))))));
          if (((8'hb1) ^ reg96[(1'h0):(1'h0)]))
            begin
              reg97 <= $unsigned($signed($signed($signed($unsigned(reg47)))));
              reg98 <= reg60;
            end
          else
            begin
              reg97 <= $unsigned((((~&{reg89}) ?
                  $unsigned(reg54[(1'h0):(1'h0)]) : (~^$unsigned((8'hb0)))) > {reg77[(2'h2):(1'h1)]}));
            end
          reg99 <= reg51;
        end
      else
        begin
          reg96 <= (8'h9d);
        end
      if ($signed(((~({(7'h42)} ? {(8'haa)} : (^reg20))) ?
          (|(&reg25[(4'hf):(2'h3)])) : $signed(({reg65} ?
              $unsigned(reg78) : $unsigned(reg23))))))
        begin
          reg100 <= $unsigned(($unsigned((~(reg19 ?
              wire94 : reg76))) + (wire2[(4'hd):(3'h6)] != {$unsigned(reg32),
              $unsigned(reg79)})));
        end
      else
        begin
          reg100 <= {reg79[(3'h5):(3'h4)],
              (|($signed({wire27, reg28}) > (reg8 < $signed(reg41))))};
          reg101 <= {reg69[(1'h0):(1'h0)]};
          reg102 <= (reg84[(1'h0):(1'h0)] ?
              (((reg42[(4'ha):(3'h4)] ?
                      reg39 : $signed(reg71)) & ((reg66 && (8'ha4)) << {reg18,
                      reg84})) ?
                  $signed(($unsigned(reg42) > (reg69 ?
                      reg84 : reg85))) : reg46[(3'h6):(3'h6)]) : reg36);
          reg103 <= $unsigned($unsigned((|wire62)));
        end
    end
  assign wire104 = $unsigned((reg102 == (|(&$signed(reg41)))));
  module105 #() modinst125 (.wire107(reg25), .wire106(wire1), .y(wire124), .wire108(reg44), .clk(clk), .wire109(reg40));
  assign wire126 = $signed(reg6);
  assign wire127 = wire61[(1'h1):(1'h1)];
  assign wire128 = $unsigned($signed(reg78));
  always
    @(posedge clk) begin
      reg129 <= (((((^~reg29) * (reg92 ?
              reg74 : reg76)) || reg42) >>> {((+reg68) && $signed(reg92)),
              $unsigned(reg73)}) ?
          ($unsigned(((reg52 * reg97) ?
                  ((8'h9c) ? (8'hb3) : reg42) : (reg11 ? (8'hb6) : (7'h42)))) ?
              reg88[(4'he):(4'he)] : $signed({(reg59 > wire4)})) : reg14[(5'h10):(2'h2)]);
      reg130 <= ((~^$signed(reg91)) ?
          reg102[(3'h7):(2'h3)] : wire93[(3'h4):(3'h4)]);
      reg131 <= (8'ha9);
    end
  assign wire132 = wire27;
  always
    @(posedge clk) begin
      reg133 <= (reg29[(4'hd):(3'h4)] ?
          ((({reg99} ?
              (reg17 - (8'hbd)) : $signed(wire82)) || (^~((8'ha7) ^ wire2))) || reg44[(1'h1):(1'h1)]) : (reg67[(2'h2):(1'h0)] <= reg129));
      reg134 <= ((8'hb6) ^ {($signed($unsigned((8'h9d))) ?
              ($unsigned((7'h42)) || reg65) : $unsigned(reg30)),
          {($unsigned(reg54) ? reg95[(3'h5):(3'h5)] : (reg60 ~^ (8'hb8)))}});
      if ({reg76})
        begin
          reg135 <= (wire62 ?
              ($unsigned(reg59[(2'h3):(2'h3)]) ^ reg101) : ($unsigned($signed(reg21[(4'hc):(1'h0)])) & $signed(reg79[(2'h3):(1'h1)])));
          reg136 <= $unsigned(((((reg73 | reg48) * wire127) ?
                  $signed($unsigned(reg63)) : $unsigned((reg32 | (8'ha1)))) ?
              ((~reg129[(5'h11):(4'hb)]) ?
                  reg12[(1'h0):(1'h0)] : $unsigned((reg64 ^~ (8'hbd)))) : reg60));
          reg137 <= (~|(+$signed((8'hac))));
        end
      else
        begin
          reg135 <= reg30;
          if (reg52[(2'h3):(1'h0)])
            begin
              reg136 <= $unsigned($unsigned(reg63[(3'h6):(2'h3)]));
              reg137 <= $signed((reg13 + reg89));
              reg138 <= reg33[(2'h2):(1'h1)];
            end
          else
            begin
              reg136 <= wire127[(3'h7):(3'h4)];
              reg137 <= reg100[(2'h2):(1'h0)];
              reg138 <= {reg103,
                  (wire126[(4'hd):(4'h8)] && reg13[(3'h4):(1'h1)])};
              reg139 <= $unsigned(reg46);
              reg140 <= (reg14 == $signed($unsigned($signed((-reg69)))));
            end
          reg141 <= $signed($signed((~|reg66)));
        end
    end
endmodule

module module105  (y, clk, wire109, wire108, wire107, wire106);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire109;
  input wire signed [(4'h9):(1'h0)] wire108;
  input wire signed [(5'h13):(1'h0)] wire107;
  input wire [(4'h9):(1'h0)] wire106;
  wire [(3'h4):(1'h0)] wire123;
  wire signed [(5'h15):(1'h0)] wire122;
  wire [(2'h2):(1'h0)] wire121;
  wire [(2'h2):(1'h0)] wire120;
  reg signed [(5'h11):(1'h0)] reg119 = (1'h0);
  reg [(4'hc):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg112 = (1'h0);
  reg [(5'h14):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg110 = (1'h0);
  assign y = {wire123,
                 wire122,
                 wire121,
                 wire120,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg110 <= wire107;
      reg111 <= ((($unsigned(wire106[(1'h0):(1'h0)]) >= (^reg110)) ?
          ($unsigned($signed(wire109)) ?
              (&(~wire108)) : wire107[(4'ha):(1'h0)]) : ({((8'ha7) + wire109)} | $unsigned($signed(wire107)))) ^ (wire107 >>> $unsigned(wire109[(1'h1):(1'h0)])));
      reg112 <= (~&((reg110[(2'h3):(1'h1)] ? wire109 : reg111[(2'h3):(2'h3)]) ?
          ($unsigned((&wire109)) ?
              $unsigned($signed(reg111)) : (~&(reg111 == reg111))) : $signed((8'hb6))));
      reg113 <= (($signed({$unsigned((8'h9d)), reg110[(1'h1):(1'h1)]}) ?
              wire106[(3'h5):(2'h2)] : ($unsigned((wire108 >>> wire106)) ?
                  $unsigned($signed(reg111)) : ($unsigned(reg112) ?
                      $unsigned(reg112) : ((7'h44) ? reg112 : reg111)))) ?
          $signed(wire107[(5'h13):(4'hb)]) : reg111[(4'he):(4'ha)]);
      reg114 <= $unsigned(wire108[(1'h1):(1'h0)]);
    end
  always
    @(posedge clk) begin
      reg115 <= wire109[(1'h1):(1'h0)];
      reg116 <= {{(~|(+(reg110 ? wire106 : wire109)))},
          ((^~$unsigned((reg112 && (8'hab)))) ~^ wire107)};
      reg117 <= (reg115[(3'h5):(1'h1)] <= $unsigned((wire106[(2'h3):(1'h1)] != (wire107 ^~ ((8'hbf) ?
          wire109 : reg111)))));
      reg118 <= wire107;
      reg119 <= ((&(reg115 <= wire108)) >>> ((^~((wire106 | (7'h43)) || ((7'h42) ~^ reg118))) ?
          reg115 : reg111[(5'h14):(3'h7)]));
    end
  assign wire120 = (+((reg114[(3'h6):(1'h0)] ^ reg113) ?
                       reg115[(3'h6):(1'h0)] : (&(~|((8'hb2) ?
                           reg111 : reg114)))));
  assign wire121 = $unsigned(wire120);
  assign wire122 = $signed(reg112[(4'ha):(4'ha)]);
  assign wire123 = $signed($unsigned(reg116));
endmodule
