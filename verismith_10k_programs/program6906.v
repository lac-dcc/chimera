module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3b7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire175;
  wire [(5'h14):(1'h0)] wire174;
  wire signed [(4'h8):(1'h0)] wire173;
  wire signed [(5'h15):(1'h0)] wire171;
  wire signed [(4'hb):(1'h0)] wire81;
  wire signed [(3'h4):(1'h0)] wire80;
  wire [(3'h7):(1'h0)] wire79;
  wire [(2'h3):(1'h0)] wire78;
  wire signed [(5'h11):(1'h0)] wire77;
  wire [(4'hf):(1'h0)] wire63;
  wire signed [(3'h6):(1'h0)] wire35;
  wire [(4'h8):(1'h0)] wire34;
  wire [(4'h9):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  reg [(5'h11):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg75 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg73 = (1'h0);
  reg [(4'hb):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg71 = (1'h0);
  reg [(4'ha):(1'h0)] reg70 = (1'h0);
  reg [(4'he):(1'h0)] reg69 = (1'h0);
  reg [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(4'h9):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg65 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg62 = (1'h0);
  reg [(4'ha):(1'h0)] reg61 = (1'h0);
  reg [(3'h6):(1'h0)] reg60 = (1'h0);
  reg [(4'ha):(1'h0)] reg59 = (1'h0);
  reg [(5'h15):(1'h0)] reg58 = (1'h0);
  reg [(4'hf):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg54 = (1'h0);
  reg [(4'ha):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg50 = (1'h0);
  reg [(4'hb):(1'h0)] reg49 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(4'h8):(1'h0)] reg42 = (1'h0);
  reg [(4'he):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(3'h7):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg [(3'h5):(1'h0)] reg8 = (1'h0);
  assign y = {wire175,
                 wire174,
                 wire173,
                 wire171,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire63,
                 wire35,
                 wire34,
                 wire7,
                 wire6,
                 wire5,
                 reg76,
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
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
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
                 reg8,
                 (1'h0)};
  assign wire5 = wire3[(1'h1):(1'h0)];
  assign wire6 = wire2[(4'hc):(4'h8)];
  assign wire7 = (wire1 <= (-$unsigned($signed(((7'h44) >> wire1)))));
  always
    @(posedge clk) begin
      reg8 <= ((&wire7[(4'h9):(1'h0)]) && {$signed($unsigned((wire4 ?
              wire6 : (8'hbf)))),
          ({((7'h43) || wire4)} ?
              (wire7[(1'h1):(1'h1)] - (wire0 >>> wire0)) : {{wire6, wire4},
                  (&wire4)})});
      reg9 <= (|wire7[(1'h0):(1'h0)]);
      reg10 <= (&$unsigned((wire4 < (+wire5))));
      reg11 <= wire0;
    end
  always
    @(posedge clk) begin
      reg12 <= (wire1[(4'h8):(1'h0)] > reg9[(4'hb):(3'h4)]);
      reg13 <= wire4[(4'hb):(1'h1)];
      if ($unsigned((((wire7[(2'h2):(1'h0)] != wire1) ?
              {reg12} : ((reg9 ^~ reg9) || $unsigned(wire2))) ?
          wire4[(4'h8):(4'h8)] : $signed($signed((7'h43))))))
        begin
          reg14 <= $unsigned($signed($unsigned($signed({wire6}))));
          if ((^~(+reg13[(4'ha):(1'h1)])))
            begin
              reg15 <= (8'h9e);
              reg16 <= {(^$signed(((8'haf) && (~|reg11))))};
              reg17 <= $signed((~reg9[(4'hb):(1'h0)]));
              reg18 <= ($signed((((reg15 ? wire1 : reg8) ?
                          reg10 : $unsigned(reg14)) ?
                      ($signed(reg12) >>> (8'ha8)) : (reg11 ^~ wire4))) ?
                  ((^~({reg9} || (reg16 ?
                      wire0 : (8'hb0)))) ^ wire5[(4'hc):(4'h9)]) : {$unsigned(wire4[(1'h1):(1'h0)]),
                      (&(8'hb3))});
            end
          else
            begin
              reg15 <= reg14;
              reg16 <= (((~&{(reg9 ? reg13 : reg16)}) ?
                      reg17 : (~&((^wire7) & ((8'had) < wire0)))) ?
                  $unsigned((!$unsigned($signed(wire6)))) : wire7);
              reg17 <= $unsigned(reg8[(2'h2):(1'h1)]);
              reg18 <= ({{(~&(&reg17))},
                      $signed(($unsigned((8'hb8)) ? reg14 : wire2))} ?
                  wire2[(4'hc):(1'h0)] : (wire1[(4'h9):(3'h6)] <<< $unsigned((^$unsigned(reg17)))));
              reg19 <= ((|(^wire3[(2'h2):(1'h1)])) ?
                  (($unsigned((-wire3)) && reg14) ?
                      $signed((|$signed((8'haa)))) : $signed(({reg8,
                          wire4} < reg8[(3'h4):(3'h4)]))) : $unsigned({(8'ha8)}));
            end
          if ({(reg14[(2'h2):(2'h2)] * (~&(reg12[(3'h4):(2'h2)] ?
                  wire0 : {reg18, reg18}))),
              reg18})
            begin
              reg20 <= ({wire6[(3'h4):(1'h1)]} ^ ($unsigned($unsigned($signed(reg14))) ?
                  (reg8 ?
                      reg15[(2'h2):(2'h2)] : wire7) : $unsigned($signed($unsigned(wire3)))));
              reg21 <= wire2;
              reg22 <= reg19[(2'h3):(2'h3)];
              reg23 <= $signed(reg13);
              reg24 <= (8'hbf);
            end
          else
            begin
              reg20 <= {((wire3[(1'h1):(1'h1)] != (-(reg12 ?
                          (7'h43) : wire5))) ?
                      {reg9} : (((8'hae) << (reg20 <<< reg17)) >>> ($signed(reg19) | $signed((8'ha8))))),
                  (|(((!wire2) <= (+reg24)) ?
                      $signed($signed(wire1)) : $unsigned(reg20[(3'h6):(3'h4)])))};
              reg21 <= reg12[(4'h8):(4'h8)];
            end
        end
      else
        begin
          reg14 <= wire0;
          reg15 <= $unsigned((^~$unsigned(($unsigned((8'ha5)) & $signed(reg8)))));
          reg16 <= (reg21 >= $unsigned((($signed(reg17) - $signed(reg18)) ?
              reg13 : (~^(wire3 ? (8'h9d) : (8'ha7))))));
        end
      if ((wire2 ? reg16[(3'h6):(3'h6)] : (8'hb9)))
        begin
          if (reg19[(3'h7):(1'h1)])
            begin
              reg25 <= $signed((($unsigned($signed((8'ha7))) ^ wire5[(4'hb):(4'h9)]) ?
                  $signed(($signed((8'ha5)) && (-wire5))) : $signed(((reg9 ?
                          reg10 : reg14) ?
                      $signed((8'hb6)) : wire6[(2'h2):(2'h2)]))));
              reg26 <= wire2[(4'ha):(4'h9)];
              reg27 <= (8'ha2);
              reg28 <= reg27[(2'h3):(2'h3)];
              reg29 <= wire0[(1'h1):(1'h0)];
            end
          else
            begin
              reg25 <= (8'ha8);
            end
          if ($signed($signed(((~&wire2[(4'h8):(3'h5)]) ?
              ((|reg27) * $signed((8'ha7))) : {wire3[(2'h2):(2'h2)]}))))
            begin
              reg30 <= wire5;
            end
          else
            begin
              reg30 <= {((|reg13) ?
                      reg23[(4'h9):(4'h9)] : $signed($unsigned($unsigned(wire5))))};
            end
          reg31 <= reg12[(1'h1):(1'h0)];
        end
      else
        begin
          reg25 <= $unsigned(((^(~$unsigned(reg25))) <= {$unsigned(wire0),
              reg30[(4'h9):(3'h7)]}));
          reg26 <= reg15[(1'h1):(1'h1)];
          reg27 <= wire5[(3'h6):(3'h6)];
          if ($signed($signed(($signed($signed((7'h44))) >>> {$signed(reg18)}))))
            begin
              reg28 <= (+$signed(reg29));
              reg29 <= reg23;
            end
          else
            begin
              reg28 <= $signed(reg14);
              reg29 <= $unsigned(({((&reg12) ~^ $unsigned(reg22)),
                      (reg30[(3'h5):(1'h0)] >>> (reg18 * reg15))} ?
                  (reg13[(5'h13):(4'hb)] ~^ $unsigned(reg13)) : $unsigned(((wire2 - reg29) * $unsigned(reg24)))));
              reg30 <= reg26[(2'h3):(1'h0)];
              reg31 <= (+$signed(wire5[(4'ha):(2'h3)]));
            end
          reg32 <= reg12;
        end
      reg33 <= {(reg22 ? (~{(reg19 & reg31)}) : $unsigned(wire0))};
    end
  assign wire34 = ($signed((^$signed(reg8))) ?
                      wire2 : (~$signed(reg15[(3'h5):(1'h0)])));
  assign wire35 = $signed(({wire4[(3'h6):(3'h6)]} ~^ (reg22[(4'h8):(3'h6)] ?
                      ((~^reg16) ?
                          $signed(reg26) : (!wire6)) : $signed(reg26[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      reg36 <= wire7;
      reg37 <= ({reg17, {$signed((reg26 & reg9)), (&wire1[(1'h1):(1'h1)])}} ?
          (^$signed($signed({reg24,
              wire5}))) : (reg14[(4'hf):(4'hf)] > (^~reg18[(2'h3):(2'h3)])));
      if (wire0)
        begin
          if ((((((reg25 ? reg37 : reg17) ^ wire34[(4'h8):(3'h4)]) > (8'hb5)) ?
                  reg13[(4'h8):(4'h8)] : $signed(((reg22 <<< reg27) ?
                      ((8'h9f) < reg16) : (reg14 ? reg28 : (8'had))))) ?
              reg12[(3'h7):(1'h0)] : $signed($unsigned(reg22[(4'hb):(3'h6)]))))
            begin
              reg38 <= {$signed(wire3[(1'h1):(1'h1)])};
              reg39 <= $signed(reg36);
              reg40 <= (~|$signed({$unsigned((reg30 ? wire0 : reg13))}));
              reg41 <= reg20;
              reg42 <= {reg13[(1'h1):(1'h0)], reg26};
            end
          else
            begin
              reg38 <= (~&(^~($unsigned($signed(reg32)) ?
                  ((8'h9c) > (&(8'hb2))) : (^(reg20 ~^ reg22)))));
              reg39 <= (~^$signed(reg36));
              reg40 <= $signed((~&(((!reg19) + reg8) - $signed((~wire5)))));
              reg41 <= reg38[(4'h9):(3'h4)];
            end
          reg43 <= reg33[(3'h5):(2'h2)];
          reg44 <= (reg37 ?
              $signed((((wire5 ? reg31 : (8'ha6)) ?
                  $signed(reg13) : wire1) < (!(reg21 ?
                  reg9 : wire7)))) : (8'hb7));
          reg45 <= ($unsigned({((8'ha3) ?
                  $signed(reg32) : (wire6 ? reg29 : reg8)),
              (wire34[(4'h8):(2'h3)] ^~ $unsigned(reg25))}) << $unsigned((((reg37 & reg11) ?
              reg27 : {reg37, wire7}) == $unsigned((+reg37)))));
          if (wire7[(2'h2):(1'h0)])
            begin
              reg46 <= reg38[(3'h4):(3'h4)];
              reg47 <= (+((reg40 ^~ reg36) ?
                  (wire3[(2'h2):(2'h2)] ~^ (|reg8[(1'h1):(1'h0)])) : reg38));
              reg48 <= ((reg25[(1'h1):(1'h1)] < (+reg17[(3'h6):(1'h0)])) ^~ $signed(wire1[(2'h2):(2'h2)]));
              reg49 <= $unsigned(reg29[(1'h0):(1'h0)]);
              reg50 <= $signed((^~{($unsigned(reg30) ?
                      {reg9, reg40} : $signed(reg13)),
                  {reg32, $unsigned(reg43)}}));
            end
          else
            begin
              reg46 <= (^~reg14[(3'h5):(2'h2)]);
              reg47 <= reg28;
              reg48 <= $signed($signed((~^(wire35[(3'h4):(2'h2)] ^ $signed(reg25)))));
            end
        end
      else
        begin
          reg38 <= ($signed(((~|(8'ha0)) ?
              $unsigned(((8'hb4) ? (7'h42) : reg8)) : (reg47[(3'h6):(1'h1)] ?
                  reg13[(4'h9):(3'h5)] : $unsigned(wire35)))) ~^ reg42[(2'h3):(2'h3)]);
          if (((wire7[(2'h2):(1'h0)] ^ (($unsigned(reg32) ?
              (reg13 ?
                  reg30 : (8'hb1)) : $signed(reg40)) << $unsigned((^reg25)))) >>> reg40[(2'h2):(1'h1)]))
            begin
              reg39 <= wire6[(4'h9):(4'h8)];
              reg40 <= reg38[(1'h1):(1'h0)];
              reg41 <= reg20[(1'h0):(1'h0)];
              reg42 <= ($signed((~^reg45)) - reg45[(2'h3):(1'h0)]);
              reg43 <= reg40[(2'h2):(1'h0)];
            end
          else
            begin
              reg39 <= reg24[(2'h2):(1'h0)];
              reg40 <= reg11;
              reg41 <= (7'h41);
              reg42 <= wire4[(3'h6):(1'h0)];
            end
          reg44 <= ($unsigned(wire34) ^~ $unsigned(reg36[(3'h7):(3'h7)]));
        end
      if ((((~$signed(wire3)) <<< ($signed((reg29 && (8'ha2))) ?
          {(8'hbc)} : (!((8'ha1) ?
              (8'hab) : reg39)))) <<< (reg13 | reg9[(1'h0):(1'h0)])))
        begin
          reg51 <= ($signed($signed($unsigned($unsigned(reg32)))) >> reg26[(2'h3):(2'h3)]);
          if (((reg14[(1'h0):(1'h0)] || $unsigned((&$signed(reg36)))) ?
              {($signed((reg44 * reg27)) ?
                      $unsigned($signed(reg15)) : (^~$signed(reg47)))} : wire0[(2'h2):(1'h1)]))
            begin
              reg52 <= reg37;
              reg53 <= $signed($signed(($signed(wire4) <<< (reg45[(1'h1):(1'h1)] + ((8'h9d) ?
                  reg16 : reg42)))));
              reg54 <= (!$signed($unsigned(reg19)));
            end
          else
            begin
              reg52 <= (reg51[(2'h2):(2'h2)] - (reg38 ?
                  {(^$unsigned(reg22))} : reg22));
              reg53 <= wire1[(2'h3):(1'h0)];
              reg54 <= wire4[(4'ha):(3'h4)];
              reg55 <= $unsigned($signed(({{reg40},
                  $signed(reg19)} + ((|reg42) ? (~reg27) : (8'ha9)))));
            end
          if ($signed((-(($unsigned(reg9) ?
              (&reg22) : (reg29 ? wire35 : reg36)) - {$signed(reg20)}))))
            begin
              reg56 <= (!$signed((|(!reg17[(3'h5):(3'h5)]))));
              reg57 <= reg44;
              reg58 <= ((reg12[(1'h0):(1'h0)] & ((-reg23) ?
                      $signed((8'ha9)) : $unsigned(reg29[(5'h11):(4'hb)]))) ?
                  (({$unsigned(wire35), {reg45}} ?
                      ((-reg26) ?
                          (^reg29) : ((8'hbe) << reg14)) : reg31[(4'hb):(2'h3)]) > wire5[(4'h9):(4'h9)]) : $unsigned(((^~reg33) >>> $unsigned((reg8 ?
                      reg57 : reg57)))));
            end
          else
            begin
              reg56 <= $signed((~^(~reg38[(1'h1):(1'h1)])));
              reg57 <= $signed($unsigned(reg43[(3'h4):(1'h0)]));
            end
          if ($unsigned($signed((|reg19))))
            begin
              reg59 <= ($unsigned((^((|reg33) >> reg55[(4'hb):(3'h7)]))) << reg41);
              reg60 <= $signed((|$unsigned((7'h41))));
              reg61 <= $unsigned($signed((((8'hb4) >= $signed((8'ha5))) + ($signed(wire35) ^ reg37))));
              reg62 <= ($unsigned({$signed((~wire2)),
                  reg29}) >> (($unsigned($unsigned(reg59)) ?
                      ((wire3 ^ wire35) ?
                          (reg54 + reg8) : $unsigned(reg43)) : ((wire2 ^~ reg30) <= ((8'hbd) & (8'h9f)))) ?
                  $unsigned(wire2[(2'h2):(1'h1)]) : (reg51 ~^ wire35[(2'h2):(1'h0)])));
            end
          else
            begin
              reg59 <= (reg24 >= ($signed($signed(reg58)) <<< reg44));
              reg60 <= reg59;
              reg61 <= (($unsigned(($unsigned(reg9) - $signed(reg43))) ?
                  reg22 : reg49) < reg16);
              reg62 <= reg41[(4'h8):(1'h1)];
            end
        end
      else
        begin
          reg51 <= $unsigned(reg62);
        end
    end
  assign wire63 = reg20[(4'h9):(3'h5)];
  always
    @(posedge clk) begin
      if (reg24[(1'h0):(1'h0)])
        begin
          reg64 <= $unsigned((8'ha1));
          if ({reg29})
            begin
              reg65 <= reg25;
              reg66 <= reg52;
              reg67 <= reg60[(1'h1):(1'h0)];
            end
          else
            begin
              reg65 <= (^$unsigned($unsigned(((reg43 < reg42) ?
                  $signed(reg54) : reg32))));
              reg66 <= $unsigned((reg16[(4'hc):(3'h4)] * $signed($unsigned((^~reg27)))));
              reg67 <= wire1[(2'h3):(1'h1)];
              reg68 <= (-reg23[(1'h1):(1'h0)]);
            end
          reg69 <= ((reg21[(3'h5):(1'h0)] != $signed(wire63[(3'h6):(1'h0)])) ?
              reg49 : reg26);
          if ($unsigned((reg67[(3'h6):(1'h0)] ?
              ($unsigned((reg12 * (8'hab))) ^~ {{(8'hbd)},
                  $unsigned((8'haa))}) : reg49)))
            begin
              reg70 <= $unsigned(wire7[(4'h8):(1'h1)]);
              reg71 <= $signed((($unsigned($unsigned(reg51)) ^ (8'hb0)) ~^ wire34));
              reg72 <= {wire0};
              reg73 <= $signed({{({reg22, reg30} ?
                          (reg64 == reg59) : ((8'hb1) ^~ reg21)),
                      {(~^reg28)}}});
            end
          else
            begin
              reg70 <= {(reg19 | reg46)};
            end
          reg74 <= $unsigned({(((reg57 ? reg29 : reg45) ?
                      {reg8} : $signed((8'hae))) ?
                  ((reg64 > reg25) ?
                      {reg46} : (reg33 ?
                          reg54 : (7'h44))) : $unsigned(reg17[(3'h5):(1'h1)]))});
        end
      else
        begin
          if (reg74)
            begin
              reg64 <= ((!$unsigned({(reg37 ? wire63 : reg23)})) ?
                  (reg40[(2'h3):(1'h1)] ?
                      reg30[(4'hc):(1'h1)] : wire0[(3'h4):(1'h1)]) : (8'ha4));
              reg65 <= (8'h9f);
              reg66 <= $signed($unsigned((~&($signed(reg68) <= (reg14 ?
                  reg37 : wire3)))));
            end
          else
            begin
              reg64 <= (~|$unsigned((^~$signed({reg37}))));
              reg65 <= {reg62[(4'ha):(4'ha)],
                  {{$unsigned(reg36),
                          ($unsigned(reg17) ?
                              reg22[(3'h5):(1'h1)] : (reg17 << reg40))}}};
            end
          reg67 <= $unsigned(reg42[(3'h4):(1'h0)]);
          reg68 <= (((+{(reg58 || (8'hbf)), reg17[(4'h8):(3'h6)]}) ?
                  (~^(8'ha8)) : $unsigned((reg28 ?
                      $signed((8'hb7)) : (reg9 ? reg59 : reg8)))) ?
              {reg33,
                  $unsigned((reg15[(2'h2):(2'h2)] ?
                      $signed(reg17) : wire7))} : $unsigned(reg16));
        end
      reg75 <= reg12;
      reg76 <= (reg67[(3'h5):(2'h2)] ^ {$unsigned(((reg38 ? reg28 : reg22) ?
              reg56 : reg26))});
    end
  assign wire77 = reg46[(4'h9):(3'h5)];
  assign wire78 = (($signed((((8'ha6) ? reg54 : reg28) ?
                      wire34 : {reg72, reg68})) || $signed(((8'h9c) ?
                      {reg56} : $unsigned(reg27)))) ~^ reg24);
  assign wire79 = ((reg14[(4'hb):(2'h2)] == $signed({((8'ha1) ?
                          (8'ha7) : reg10)})) && $unsigned(reg16[(2'h3):(2'h3)]));
  assign wire80 = ($signed({(((8'h9f) ? reg45 : reg42) ?
                          $signed(reg65) : reg59)}) << (|wire1));
  assign wire81 = wire34;
  module82 #() modinst172 (wire171, clk, reg23, reg38, reg22, reg75);
  assign wire173 = reg8[(1'h0):(1'h0)];
  assign wire174 = {$unsigned(reg50),
                       (~^(wire4 ?
                           ($unsigned((8'hb2)) ?
                               (reg13 == (8'hbc)) : (reg26 ^ (8'hac))) : {$signed((7'h41))}))};
  assign wire175 = $signed(((&reg57) ?
                       (reg67 ?
                           $signed(wire79[(3'h4):(1'h0)]) : $signed((8'ha1))) : wire0[(1'h0):(1'h0)]));
endmodule

module module82
#(parameter param169 = {(7'h41)}, 
parameter param170 = (~&(param169 <<< param169)))
(y, clk, wire83, wire84, wire85, wire86);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire83;
  input wire signed [(5'h12):(1'h0)] wire84;
  input wire signed [(3'h5):(1'h0)] wire85;
  input wire [(3'h6):(1'h0)] wire86;
  wire [(3'h5):(1'h0)] wire168;
  wire signed [(4'he):(1'h0)] wire167;
  wire signed [(4'hd):(1'h0)] wire166;
  wire [(3'h6):(1'h0)] wire104;
  wire [(5'h12):(1'h0)] wire164;
  reg [(4'ha):(1'h0)] reg87 = (1'h0);
  reg [(4'hb):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg91 = (1'h0);
  reg [(2'h2):(1'h0)] reg92 = (1'h0);
  reg [(5'h14):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg94 = (1'h0);
  reg [(4'he):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg98 = (1'h0);
  reg [(3'h4):(1'h0)] reg99 = (1'h0);
  reg [(5'h11):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg102 = (1'h0);
  reg signed [(4'he):(1'h0)] reg103 = (1'h0);
  assign y = {wire168,
                 wire167,
                 wire166,
                 wire104,
                 wire164,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed(wire86[(3'h5):(2'h3)]))
        begin
          reg87 <= $unsigned((wire85 ?
              $signed(wire83[(2'h3):(2'h3)]) : (8'hb4)));
          reg88 <= reg87;
          reg89 <= wire84[(3'h4):(2'h3)];
          reg90 <= (({wire84, reg88} ?
                  $unsigned(((reg89 ? wire83 : wire83) ?
                      $signed(reg88) : (+reg89))) : wire84[(3'h4):(2'h2)]) ?
              wire86 : (8'hae));
        end
      else
        begin
          reg87 <= (((reg87 <<< ((|reg90) ~^ wire84[(2'h2):(2'h2)])) ?
              reg87 : (~&reg88[(1'h1):(1'h1)])) ^~ (+$unsigned(((wire84 <<< wire86) ?
              {wire84, reg87} : wire84[(3'h5):(2'h2)]))));
          reg88 <= {reg87[(3'h6):(2'h3)],
              {$unsigned((~&((8'hbf) ? reg89 : wire86)))}};
          reg89 <= (!$signed({({wire83} ? (reg88 || (8'hac)) : (|wire83))}));
        end
      if (({(wire84[(4'he):(1'h1)] == {(wire84 ? wire84 : (8'h9f)),
                  $unsigned(wire84)}),
              $unsigned(((wire83 ? reg90 : (7'h40)) + (wire85 ?
                  reg88 : wire84)))} ?
          $signed((wire84[(3'h6):(1'h0)] ?
              (reg90[(3'h4):(1'h0)] ?
                  $unsigned((8'hae)) : (&(8'h9f))) : (8'hb9))) : ((reg89[(2'h2):(2'h2)] && $signed(((7'h44) ?
              reg89 : reg89))) < {$unsigned($signed(wire83)), wire84})))
        begin
          reg91 <= (~^wire83[(4'he):(1'h1)]);
          reg92 <= wire86;
          reg93 <= $signed($unsigned($signed((8'ha0))));
          reg94 <= ($signed(wire86) >>> ((^~(8'ha7)) ?
              (wire86[(3'h5):(1'h1)] ?
                  $signed({reg91, reg87}) : $signed((~(8'hbb)))) : reg88));
          reg95 <= (({$unsigned(reg93)} << reg89) ?
              (reg91 ?
                  $unsigned((reg92[(1'h1):(1'h0)] >> $signed(reg89))) : ((wire86[(3'h5):(2'h3)] ?
                          $signed((7'h41)) : $unsigned(wire85)) ?
                      ((wire85 ? (7'h42) : reg93) ?
                          $signed(reg94) : {wire83}) : (~reg93))) : $signed((^~(reg91[(3'h6):(1'h0)] >>> (!reg90)))));
        end
      else
        begin
          reg91 <= (reg94 >> ($unsigned(reg88) ?
              (reg92[(1'h0):(1'h0)] | (-$unsigned((8'hb3)))) : $signed($unsigned({(8'hb7),
                  reg87}))));
          reg92 <= $unsigned(wire85[(1'h0):(1'h0)]);
          reg93 <= ({(~^(-$unsigned(reg92))),
              (($signed(reg91) > $signed(reg87)) ?
                  $unsigned((reg89 <<< wire86)) : $unsigned(reg88[(2'h2):(1'h1)]))} < $signed(reg89));
          reg94 <= wire83;
        end
      reg96 <= reg95;
      if ($unsigned((~^reg92[(1'h0):(1'h0)])))
        begin
          reg97 <= ((($signed($signed((8'h9d))) <<< (~|reg94)) ?
              ({((8'had) >> reg90)} ?
                  $signed(wire83) : $signed({wire85})) : reg88) < reg96);
          if (reg93[(2'h2):(2'h2)])
            begin
              reg98 <= (~reg93[(3'h6):(1'h0)]);
              reg99 <= ((7'h40) ?
                  wire86 : $unsigned(((wire84 ? (8'hb0) : reg96) ^~ reg89)));
              reg100 <= {wire85,
                  ((~^$signed($signed(reg91))) >= $unsigned({(reg88 >> reg90),
                      (^~reg96)}))};
              reg101 <= (8'h9c);
              reg102 <= reg96[(3'h4):(2'h2)];
            end
          else
            begin
              reg98 <= reg99[(1'h1):(1'h1)];
              reg99 <= ((8'haa) ? reg90[(3'h4):(1'h0)] : wire86);
            end
          reg103 <= {wire83, reg91[(2'h2):(1'h1)]};
        end
      else
        begin
          if ({reg97[(2'h2):(2'h2)]})
            begin
              reg97 <= {(~($unsigned((8'hae)) + ({reg101, wire83} ?
                      ((8'ha2) ? (8'hb0) : (8'h9f)) : {wire86, (8'hb8)}))),
                  {wire86[(2'h2):(1'h1)]}};
              reg98 <= reg91[(1'h1):(1'h0)];
              reg99 <= (&((+$signed($unsigned(reg96))) != $signed(wire86)));
            end
          else
            begin
              reg97 <= $unsigned(wire83);
              reg98 <= $unsigned(reg88[(4'ha):(3'h5)]);
            end
        end
    end
  assign wire104 = {((((reg97 ? wire83 : wire86) ?
                                   ((8'hb0) ~^ reg101) : (-reg93)) ?
                               reg93 : (8'hab)) ?
                           reg100 : {reg101[(3'h6):(2'h3)],
                               {$unsigned((8'hba))}}),
                       (reg103[(4'hd):(3'h4)] <<< (8'ha0))};
  module105 #() modinst165 (.clk(clk), .wire109(reg95), .wire107(reg102), .wire106(wire86), .y(wire164), .wire108(reg93));
  assign wire166 = (reg90 >>> $unsigned($signed((wire84[(3'h5):(1'h0)] < $unsigned(reg92)))));
  assign wire167 = ((+(wire85[(3'h4):(1'h1)] ?
                           ((^reg103) ?
                               {reg93, reg97} : (wire83 ?
                                   reg87 : wire85)) : (~|(reg98 ?
                               reg98 : wire86)))) ?
                       reg87[(3'h4):(2'h3)] : $signed($unsigned(($unsigned(wire166) <= (reg87 & (8'hae))))));
  assign wire168 = $unsigned((!reg91));
endmodule

module module105  (y, clk, wire109, wire108, wire107, wire106);
  output wire [(32'h266):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire109;
  input wire [(4'hc):(1'h0)] wire108;
  input wire signed [(4'hb):(1'h0)] wire107;
  input wire signed [(3'h6):(1'h0)] wire106;
  wire [(4'hf):(1'h0)] wire163;
  wire signed [(3'h4):(1'h0)] wire162;
  wire [(4'hf):(1'h0)] wire161;
  wire [(4'hc):(1'h0)] wire153;
  wire [(5'h12):(1'h0)] wire152;
  wire [(5'h11):(1'h0)] wire151;
  wire [(5'h13):(1'h0)] wire150;
  wire signed [(5'h11):(1'h0)] wire149;
  wire signed [(3'h4):(1'h0)] wire148;
  wire [(4'hc):(1'h0)] wire138;
  wire [(3'h6):(1'h0)] wire137;
  wire signed [(3'h4):(1'h0)] wire136;
  wire signed [(3'h7):(1'h0)] wire135;
  wire signed [(5'h13):(1'h0)] wire134;
  wire [(4'hb):(1'h0)] wire133;
  wire [(3'h6):(1'h0)] wire113;
  wire [(5'h11):(1'h0)] wire112;
  wire signed [(4'h8):(1'h0)] wire111;
  wire [(3'h6):(1'h0)] wire110;
  reg signed [(4'hc):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg158 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg157 = (1'h0);
  reg [(4'h9):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg155 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg154 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg147 = (1'h0);
  reg [(4'hb):(1'h0)] reg146 = (1'h0);
  reg [(5'h10):(1'h0)] reg145 = (1'h0);
  reg [(5'h12):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg143 = (1'h0);
  reg [(4'hc):(1'h0)] reg142 = (1'h0);
  reg [(4'hc):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg139 = (1'h0);
  reg [(3'h5):(1'h0)] reg132 = (1'h0);
  reg [(4'hd):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg130 = (1'h0);
  reg [(4'he):(1'h0)] reg129 = (1'h0);
  reg [(4'hc):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg127 = (1'h0);
  reg signed [(4'he):(1'h0)] reg126 = (1'h0);
  reg [(5'h10):(1'h0)] reg125 = (1'h0);
  reg [(4'hd):(1'h0)] reg124 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg123 = (1'h0);
  reg [(5'h10):(1'h0)] reg122 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg121 = (1'h0);
  reg [(4'he):(1'h0)] reg120 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg119 = (1'h0);
  reg [(4'hc):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg116 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg114 = (1'h0);
  assign y = {wire163,
                 wire162,
                 wire161,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
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
                 (1'h0)};
  assign wire110 = wire106[(3'h4):(1'h0)];
  assign wire111 = (-(~((~^((8'hbb) && wire108)) == ((wire108 | wire110) ?
                       wire110[(2'h3):(2'h3)] : $unsigned(wire106)))));
  assign wire112 = ((|(|(wire108[(4'ha):(4'ha)] ?
                       $unsigned(wire107) : (^~wire111)))) - wire110);
  assign wire113 = (($signed($signed($signed(wire112))) ?
                           wire108 : {$unsigned(wire107[(3'h6):(2'h2)])}) ?
                       $unsigned((!wire108)) : wire109);
  always
    @(posedge clk) begin
      reg114 <= (((wire106 >= {((8'hbe) <<< wire110),
          wire113[(3'h4):(1'h1)]}) < wire112) * wire113);
      if ({(^wire107)})
        begin
          reg115 <= {wire109, wire111[(1'h0):(1'h0)]};
          reg116 <= (8'had);
          reg117 <= reg114[(3'h7):(3'h4)];
          reg118 <= $unsigned($unsigned((~(~|wire113))));
        end
      else
        begin
          reg115 <= $signed((8'hb8));
          reg116 <= wire107[(1'h0):(1'h0)];
          reg117 <= {((^$unsigned((wire112 ? (8'hbe) : (8'hb2)))) ?
                  (((&reg118) ^~ (~reg116)) ?
                      $unsigned((reg117 ?
                          reg118 : reg114)) : wire109[(2'h3):(1'h0)]) : $signed($signed(((8'hb6) > wire113))))};
          reg118 <= $unsigned(wire106[(3'h6):(3'h5)]);
        end
      reg119 <= {{(((reg117 ^ (8'ha4)) ?
                  reg114[(2'h2):(1'h1)] : $signed(wire110)) ^ $unsigned($unsigned(reg118)))},
          wire109};
      reg120 <= $unsigned(wire107[(2'h3):(2'h2)]);
      if (((((wire106[(2'h3):(1'h0)] != wire107[(3'h7):(1'h0)]) & reg117) >= wire112[(5'h11):(4'h8)]) ?
          (wire108 ?
              reg120[(4'ha):(3'h6)] : (|wire106)) : $unsigned((($unsigned(reg119) ?
              (~&(8'hbe)) : (!(8'hbf))) ^~ reg117))))
        begin
          if ($signed(reg115[(3'h5):(1'h1)]))
            begin
              reg121 <= $signed((^wire111));
              reg122 <= (wire109[(2'h3):(2'h2)] ?
                  $signed($signed(reg119)) : reg120[(4'ha):(2'h3)]);
              reg123 <= (({((reg118 != reg120) << reg122[(2'h2):(2'h2)]),
                      reg122[(3'h7):(3'h5)]} >>> {$signed((wire111 > reg116))}) ?
                  wire113 : ($signed((|(~&(7'h41)))) ?
                      (^~(+reg122[(4'hf):(3'h6)])) : $signed(wire106)));
              reg124 <= (8'h9c);
              reg125 <= ($signed(reg117[(3'h4):(1'h0)]) ?
                  reg115[(1'h0):(1'h0)] : wire109[(3'h5):(3'h4)]);
            end
          else
            begin
              reg121 <= ({reg120[(4'h9):(3'h4)]} ?
                  ((reg119[(1'h0):(1'h0)] & reg119) ?
                      $unsigned(((|wire112) ?
                          (wire109 ?
                              reg123 : reg122) : reg119)) : $signed(wire111)) : $unsigned($signed({wire113[(2'h3):(1'h1)],
                      ((8'hbf) ? reg124 : reg119)})));
              reg122 <= $unsigned((wire112 ?
                  {{reg125},
                      ($unsigned(reg118) ?
                          $signed((8'ha8)) : wire107)} : $signed(((^~wire106) ?
                      (wire111 ? reg118 : reg125) : wire109))));
              reg123 <= (wire107[(1'h0):(1'h0)] ?
                  (+reg121) : wire112[(4'he):(1'h1)]);
            end
          reg126 <= (reg121 >> (($signed((|reg125)) | $unsigned(((8'hb3) ?
                  wire112 : (8'hbc)))) ?
              $signed($unsigned((wire107 != reg119))) : ((+$signed((8'ha2))) && (|wire112[(5'h10):(4'hd)]))));
          reg127 <= reg114[(3'h6):(1'h0)];
          if ($signed((~|(~|(~|(wire111 > reg121))))))
            begin
              reg128 <= reg114[(1'h0):(1'h0)];
              reg129 <= reg124[(3'h5):(1'h0)];
              reg130 <= ($signed($signed((|(8'hbc)))) * (~&((reg115 && reg117[(1'h0):(1'h0)]) && (reg122 || ((8'ha4) ?
                  reg123 : reg120)))));
              reg131 <= ({wire106} ?
                  {reg124[(4'hc):(4'ha)],
                      $signed({reg128, $unsigned(reg119)})} : (8'haa));
              reg132 <= $unsigned((|(((~|(8'hb6)) ?
                      reg120[(2'h3):(1'h0)] : $signed(wire113)) ?
                  ((wire111 & reg131) != (wire107 & reg116)) : (((8'h9f) || reg119) ?
                      wire111[(3'h4):(1'h0)] : (reg115 == reg119)))));
            end
          else
            begin
              reg128 <= $signed(($signed(((reg127 ? wire109 : reg129) ?
                      wire108[(4'h9):(3'h7)] : (|reg132))) ?
                  $signed((-(reg118 ? reg122 : reg131))) : (8'hb0)));
              reg129 <= ((|$signed($signed(reg129[(4'h9):(3'h4)]))) < wire110);
            end
        end
      else
        begin
          reg121 <= wire108;
        end
    end
  assign wire133 = (reg130[(4'h8):(3'h5)] >= reg120[(4'hc):(3'h5)]);
  assign wire134 = $unsigned({{wire108[(3'h7):(3'h6)]}});
  assign wire135 = (8'ha9);
  assign wire136 = reg119[(2'h2):(1'h0)];
  assign wire137 = (reg127 | wire108[(2'h3):(2'h3)]);
  assign wire138 = $unsigned((~$unsigned(($unsigned(reg114) ?
                       reg126 : (|reg126)))));
  always
    @(posedge clk) begin
      reg139 <= $unsigned(reg114[(2'h3):(2'h2)]);
      if ($signed($unsigned((($signed((8'h9e)) ?
          $signed(wire108) : (!reg114)) || {reg114}))))
        begin
          reg140 <= (8'haf);
          reg141 <= (reg140 ?
              $unsigned($unsigned(($signed(reg121) + {reg120}))) : $signed($signed($signed(((7'h43) ?
                  (8'ha1) : reg121)))));
          if ($signed(wire136[(2'h2):(2'h2)]))
            begin
              reg142 <= (!{$signed((reg115 ?
                      (reg116 ? wire137 : (8'hb1)) : ((8'ha5) >= (8'ha7))))});
            end
          else
            begin
              reg142 <= $signed((^~(~&reg124)));
              reg143 <= (^$unsigned(reg117[(1'h0):(1'h0)]));
            end
          reg144 <= (reg131 < $signed((-reg123)));
        end
      else
        begin
          reg140 <= {$signed($unsigned($unsigned((8'hb2)))),
              $unsigned(({wire113} - $unsigned($unsigned(reg127))))};
          reg141 <= (^~(reg128[(1'h0):(1'h0)] ?
              {wire112[(2'h3):(2'h2)]} : wire109));
          if ((((wire112[(4'hd):(4'hc)] ?
                  ($unsigned((8'ha4)) ?
                      reg144 : wire134) : reg117[(3'h4):(2'h2)]) ?
              $unsigned(((^~reg142) >= wire109)) : reg126[(4'hb):(4'h8)]) ~^ wire106))
            begin
              reg142 <= reg140[(1'h1):(1'h0)];
              reg143 <= $signed(($unsigned(wire136[(3'h4):(2'h3)]) ?
                  (^$signed(((8'ha6) == (8'ha5)))) : $signed($unsigned((wire108 ?
                      wire138 : reg130)))));
              reg144 <= (((wire133[(2'h3):(2'h3)] && wire137) ?
                      reg144[(4'h9):(4'h9)] : wire106) ?
                  $unsigned($signed($signed($unsigned(reg131)))) : wire136[(1'h0):(1'h0)]);
            end
          else
            begin
              reg142 <= {$signed($signed(((-wire113) ^~ $signed(wire137))))};
              reg143 <= ((~&wire136) ?
                  ($signed(($signed(reg132) >>> $signed(reg140))) ?
                      {(reg125[(4'h9):(3'h4)] ?
                              {reg125} : (reg142 > wire106))} : wire133[(4'h8):(3'h5)]) : $unsigned(wire110));
              reg144 <= ($signed(reg120[(4'hd):(4'h8)]) ?
                  ($signed(((~|wire112) <= $unsigned(reg126))) ?
                      (&(^~$signed(wire135))) : {((8'hbe) & (!reg140)),
                          wire136}) : (reg121[(3'h6):(3'h6)] | (({(7'h41)} ?
                      {reg131} : reg126[(1'h0):(1'h0)]) ^ (^$unsigned(reg143)))));
            end
        end
      if ($unsigned(({reg143, $unsigned(reg115)} && reg115)))
        begin
          reg145 <= $signed(($signed(((8'hb8) >= (reg118 << (8'hbf)))) < $unsigned(reg122)));
        end
      else
        begin
          reg145 <= {($unsigned((&(wire112 ?
                  (8'haf) : (8'hbd)))) >>> $signed($signed((&reg118))))};
        end
      reg146 <= wire110;
      reg147 <= ({reg143,
          (-(~&(wire108 ? reg128 : reg115)))} ~^ wire111[(1'h1):(1'h1)]);
    end
  assign wire148 = $signed((~^reg143[(5'h12):(1'h0)]));
  assign wire149 = wire137;
  assign wire150 = (wire138 ?
                       (8'ha3) : (wire111[(3'h6):(1'h1)] < ((!wire138[(4'h9):(3'h6)]) ?
                           (+(reg132 ?
                               reg126 : (7'h41))) : $signed(reg130[(2'h2):(1'h1)]))));
  assign wire151 = reg132;
  assign wire152 = (^~{(({wire111, reg129} ?
                           wire134 : reg114[(3'h4):(1'h1)]) == {(!wire106)})});
  assign wire153 = {(~^$signed(reg115))};
  always
    @(posedge clk) begin
      if ($signed($unsigned(($signed({wire138,
          wire151}) * $unsigned($signed(reg131))))))
        begin
          reg154 <= (reg129 ?
              reg116 : $unsigned(((!((8'ha4) ?
                  reg127 : reg139)) ~^ ($signed(reg122) ?
                  $signed(reg122) : (8'h9f)))));
          reg155 <= reg120[(4'hb):(4'h8)];
          reg156 <= $unsigned($unsigned((~^(~^$signed(wire137)))));
        end
      else
        begin
          reg154 <= ($unsigned(({reg127} <= $unsigned(wire148))) ?
              reg121 : $signed((wire151 ?
                  reg139[(4'h8):(1'h1)] : (~^$unsigned(reg120)))));
          reg155 <= ($signed((((reg154 ? (8'ha8) : reg117) >= $signed(reg155)) ?
              reg127 : reg129)) || $unsigned((^~$signed($signed(reg122)))));
          if (reg119)
            begin
              reg156 <= ($signed(($unsigned(((8'hb9) ?
                  reg116 : wire148)) ~^ (~&(reg126 < reg132)))) < wire138[(3'h7):(3'h5)]);
            end
          else
            begin
              reg156 <= (-$unsigned(wire138[(3'h4):(2'h2)]));
            end
          reg157 <= wire112[(3'h4):(2'h2)];
          reg158 <= $unsigned(((~reg125) ?
              {(8'ha4),
                  ($unsigned(reg114) ?
                      wire109[(1'h1):(1'h0)] : $unsigned(reg147))} : {reg125}));
        end
      reg159 <= reg128;
      reg160 <= $unsigned(reg114[(1'h0):(1'h0)]);
    end
  assign wire161 = (~^(~^((reg145[(4'hf):(1'h1)] != $unsigned(reg144)) == (+$unsigned(wire138)))));
  assign wire162 = reg143[(3'h4):(1'h1)];
  assign wire163 = (($unsigned((-reg132)) ?
                       (|(^(reg121 - reg115))) : wire107[(2'h3):(1'h0)]) >= reg154);
endmodule
