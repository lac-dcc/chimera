module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h140):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire38;
  wire signed [(3'h6):(1'h0)] wire37;
  wire signed [(3'h6):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire4;
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  reg [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg30 = (1'h0);
  reg [(2'h3):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = $signed((($unsigned($signed(wire3)) != wire2) * (wire2 < $signed($unsigned(wire1)))));
  assign wire5 = wire1[(1'h0):(1'h0)];
  assign wire6 = ($signed($unsigned({wire0[(3'h5):(2'h2)]})) ?
                     wire3[(4'he):(3'h4)] : ((|($signed(wire3) ^~ (wire3 ?
                             wire1 : wire5))) ?
                         (~(wire5 <= (wire5 ? wire4 : wire4))) : ((~|((8'hba) ?
                             wire0 : (8'hb4))) ~^ ((wire3 & wire4) ?
                             (8'hb3) : wire0[(5'h12):(5'h10)]))));
  assign wire7 = (wire6 > (|(|((wire3 ? wire6 : wire3) + $unsigned((8'hae))))));
  assign wire8 = $signed((wire4[(3'h6):(1'h0)] ?
                     $signed(((wire2 ? wire2 : wire1) ?
                         (wire6 || wire1) : $signed(wire4))) : wire2));
  always
    @(posedge clk) begin
      reg9 <= (wire8 << wire4[(3'h5):(2'h3)]);
      if ({(!(~$signed(wire0[(5'h10):(4'he)])))})
        begin
          reg10 <= ((!$signed(wire5)) ?
              (~($unsigned($signed(wire2)) + $unsigned(((8'hb4) < reg9)))) : (8'ha5));
          reg11 <= $unsigned($signed((8'ha8)));
        end
      else
        begin
          reg10 <= $unsigned(wire6[(1'h1):(1'h1)]);
          reg11 <= ({$unsigned({(^wire3), (wire3 && reg10)}),
                  $unsigned(({wire5, wire3} == (wire4 ^~ wire1)))} ?
              reg9[(1'h1):(1'h1)] : (~|(reg10 ?
                  (~^$signed(wire7)) : (wire0 ? wire2 : {reg10, reg9}))));
          if ($signed({$signed($signed($signed(reg10)))}))
            begin
              reg12 <= ((&$unsigned(wire3[(4'hf):(1'h0)])) <<< wire8[(2'h2):(1'h1)]);
              reg13 <= reg12;
              reg14 <= $unsigned(((!{((8'ha1) ? reg9 : reg12)}) ?
                  wire1 : (8'h9e)));
              reg15 <= wire5;
              reg16 <= reg13;
            end
          else
            begin
              reg12 <= $signed((~wire6));
              reg13 <= (~^(wire5[(4'hb):(3'h7)] ?
                  (wire4 - $signed($unsigned(wire4))) : (^~reg15[(2'h3):(1'h1)])));
            end
          reg17 <= $unsigned(reg16);
        end
      if ((((($signed(reg15) ? wire2 : (8'hac)) ?
              (^{wire3}) : (reg15 <= (reg11 ? reg16 : reg16))) ?
          $unsigned(((reg9 ? reg16 : (8'hb4)) ?
              wire5 : $unsigned(wire0))) : $unsigned((wire1[(3'h4):(3'h4)] ?
              reg12[(4'hb):(4'ha)] : $unsigned(wire4)))) & ((^~{wire5[(4'h9):(3'h7)]}) ?
          (reg11[(1'h1):(1'h0)] ~^ reg15) : reg11[(1'h0):(1'h0)])))
        begin
          reg18 <= $unsigned((|wire8));
          if ((reg18[(3'h4):(2'h3)] ?
              reg13[(3'h6):(1'h1)] : {$signed((reg14[(3'h4):(1'h0)] ?
                      reg16[(4'he):(3'h7)] : (wire2 ? wire8 : (8'ha0)))),
                  reg9[(2'h2):(1'h1)]}))
            begin
              reg19 <= wire1[(2'h2):(1'h0)];
              reg20 <= (~&$signed($signed($unsigned(reg15))));
              reg21 <= (reg15[(4'h8):(2'h3)] ? {reg17} : (~|$unsigned(reg13)));
            end
          else
            begin
              reg19 <= $unsigned(wire8);
              reg20 <= ($unsigned($signed((wire8[(3'h4):(2'h2)] ?
                  {reg15} : $signed(wire4)))) <= (reg21 > $signed($signed((reg18 ^~ wire7)))));
              reg21 <= ({(&reg9[(1'h1):(1'h0)]),
                  $signed($signed({reg11,
                      wire0}))} | (^~$unsigned(wire4[(2'h2):(2'h2)])));
              reg22 <= ($unsigned((reg21[(4'h8):(1'h0)] + ($unsigned(reg14) ?
                  reg18 : (~|wire2)))) | (&reg18));
            end
          reg23 <= (+reg12);
        end
      else
        begin
          if ({((wire6 && wire0) ?
                  ((wire2 ?
                      $unsigned(reg22) : (reg19 && wire7)) & (~$unsigned(reg18))) : $unsigned(reg19)),
              wire7[(4'hd):(3'h5)]})
            begin
              reg18 <= {(~^(((&wire0) & {reg14, reg10}) ?
                      $unsigned(reg12) : ((8'hae) + {reg23, wire7})))};
              reg19 <= reg18;
              reg20 <= (8'haa);
              reg21 <= $signed($unsigned(($signed((~&wire4)) ?
                  ((wire6 ? reg17 : reg18) ?
                      (wire7 ?
                          wire4 : reg9) : (reg21 >>> reg9)) : $signed((&reg10)))));
              reg22 <= (8'hba);
            end
          else
            begin
              reg18 <= $signed(wire4);
            end
          reg23 <= ($signed($signed(reg10)) ?
              wire8[(2'h3):(2'h3)] : ($unsigned(((reg22 ? wire8 : reg23) ?
                  reg15 : (wire1 ?
                      (8'ha1) : wire2))) * $signed($signed($unsigned((8'had))))));
          reg24 <= wire0[(5'h10):(3'h7)];
        end
      if (($signed($signed((&wire8[(1'h0):(1'h0)]))) <<< reg10))
        begin
          if (wire6[(2'h2):(1'h1)])
            begin
              reg25 <= $unsigned(reg19[(2'h3):(1'h1)]);
              reg26 <= ((reg12[(3'h4):(2'h3)] ?
                      (((reg13 ? reg17 : wire4) ?
                          $signed(reg22) : reg9) != $signed({wire8})) : ($signed($unsigned(wire8)) ^ wire1)) ?
                  ((($unsigned(reg16) ?
                          $signed((8'ha7)) : (reg15 ?
                              (8'ha4) : reg17)) == reg16) ?
                      reg23 : (((reg13 ? reg17 : reg19) ?
                              wire4[(2'h3):(1'h0)] : (reg11 < wire1)) ?
                          ($unsigned(reg9) & (reg17 && wire8)) : $unsigned({reg20}))) : (($unsigned((reg20 ?
                          reg22 : reg25)) ?
                      {(8'ha1), $signed(wire2)} : ($signed(reg25) + (wire4 ?
                          reg16 : (7'h40)))) || wire5[(1'h0):(1'h0)]));
              reg27 <= wire3;
              reg28 <= reg27[(1'h1):(1'h1)];
              reg29 <= (((~|(+$signed(wire5))) == (7'h44)) >> (8'ha7));
            end
          else
            begin
              reg25 <= $signed(reg10[(2'h3):(1'h0)]);
              reg26 <= wire4;
              reg27 <= (^(^reg17));
            end
          if ((~^reg13))
            begin
              reg30 <= (|(^(({(8'ha6), (8'ha0)} << $unsigned((7'h43))) ?
                  ($signed((8'hbb)) != $signed(reg25)) : (reg17 ?
                      (&wire1) : reg12[(1'h0):(1'h0)]))));
              reg31 <= {((&$unsigned(wire6)) ? (&reg19) : wire0)};
              reg32 <= wire8[(1'h0):(1'h0)];
              reg33 <= ((reg28 ?
                      (reg12[(5'h11):(2'h2)] > reg15) : {reg10[(3'h7):(2'h2)]}) ?
                  ($signed({wire2[(2'h3):(1'h1)],
                      (reg16 ? reg25 : reg16)}) != ((~^wire0) ?
                      $signed({(8'h9f),
                          reg17}) : $signed({reg11}))) : {$unsigned({(reg13 ?
                              reg11 : wire3),
                          (reg9 >> (8'hbd))}),
                      $unsigned(wire3[(3'h7):(1'h1)])});
            end
          else
            begin
              reg30 <= (8'h9e);
              reg31 <= (~|(reg30 ?
                  (reg18 + {wire3[(4'h8):(3'h6)],
                      (|reg22)}) : {wire7[(2'h3):(1'h1)],
                      reg25[(3'h4):(2'h2)]}));
              reg32 <= (~&(~|reg18[(4'ha):(4'h9)]));
            end
          reg34 <= $signed((+(reg15[(4'h8):(1'h1)] ?
              $signed(wire6[(1'h0):(1'h0)]) : ((7'h43) ?
                  (reg17 | (7'h44)) : reg29[(1'h0):(1'h0)]))));
          reg35 <= (reg28 == reg17);
        end
      else
        begin
          reg25 <= $signed((^~{$signed((reg10 ? reg28 : reg17)),
              $unsigned((reg11 >>> (8'hb4)))}));
          reg26 <= reg30[(3'h6):(3'h5)];
          if (((8'ha3) == $signed($unsigned((reg10 << reg21[(4'h8):(1'h0)])))))
            begin
              reg27 <= (|(reg29 ?
                  (^~{$unsigned((8'hab)), wire8}) : (|$unsigned((reg33 ?
                      reg33 : reg23)))));
              reg28 <= $unsigned($unsigned(($unsigned(reg15[(3'h7):(2'h2)]) | (wire5[(4'h8):(2'h2)] & $signed(reg15)))));
              reg29 <= $unsigned($signed((((wire8 & reg33) ?
                  (reg23 >= wire4) : reg15) && (((8'hb7) ^ wire4) ?
                  $unsigned(reg18) : reg18[(4'hc):(3'h6)]))));
              reg30 <= $signed(reg31[(2'h3):(1'h0)]);
              reg31 <= (|{reg16});
            end
          else
            begin
              reg27 <= $signed(reg31);
              reg28 <= (reg31 & (8'h9d));
            end
          reg32 <= ({wire8} < reg34);
          if (reg29[(2'h2):(1'h1)])
            begin
              reg33 <= reg28[(2'h2):(1'h0)];
            end
          else
            begin
              reg33 <= ((reg22 ?
                  ($unsigned(reg24[(1'h0):(1'h0)]) ?
                      $signed((reg28 ~^ reg20)) : ((reg32 << reg35) > (-(8'hba)))) : (~&((8'ha7) & (8'hb4)))) ^~ (8'ha7));
              reg34 <= $signed(((((reg35 || (8'hb5)) ^ reg15[(1'h0):(1'h0)]) ?
                  $unsigned(wire2) : wire0) & ((8'had) >= (^~reg17[(2'h2):(1'h0)]))));
              reg35 <= ({reg30[(2'h2):(1'h1)]} & reg11[(2'h2):(2'h2)]);
              reg36 <= reg26[(4'h8):(3'h6)];
            end
        end
    end
  assign wire37 = (reg28 ?
                      {$unsigned((~&$signed(wire3)))} : $unsigned($unsigned(reg34[(3'h7):(3'h5)])));
  assign wire38 = {reg24};
endmodule
