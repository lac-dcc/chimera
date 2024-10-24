module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h38f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire295;
  wire signed [(5'h15):(1'h0)] wire165;
  wire signed [(5'h11):(1'h0)] wire163;
  wire [(4'hf):(1'h0)] wire45;
  wire signed [(3'h6):(1'h0)] wire44;
  wire [(4'h8):(1'h0)] wire43;
  wire [(3'h4):(1'h0)] wire42;
  wire [(2'h3):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire26;
  wire signed [(4'hb):(1'h0)] wire19;
  wire signed [(4'he):(1'h0)] wire18;
  wire [(5'h12):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire297;
  wire signed [(4'h9):(1'h0)] wire299;
  wire [(5'h14):(1'h0)] wire300;
  wire signed [(5'h13):(1'h0)] wire301;
  wire signed [(5'h12):(1'h0)] wire302;
  wire [(3'h4):(1'h0)] wire303;
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg47 = (1'h0);
  reg [(3'h4):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg49 = (1'h0);
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg [(2'h3):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg53 = (1'h0);
  reg [(4'hf):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg56 = (1'h0);
  reg [(5'h11):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg58 = (1'h0);
  reg [(5'h10):(1'h0)] reg59 = (1'h0);
  reg [(4'ha):(1'h0)] reg60 = (1'h0);
  reg [(4'hd):(1'h0)] reg61 = (1'h0);
  reg [(5'h11):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg67 = (1'h0);
  reg [(4'h9):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg69 = (1'h0);
  assign y = {wire295,
                 wire165,
                 wire163,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire27,
                 wire26,
                 wire19,
                 wire18,
                 wire5,
                 wire4,
                 wire297,
                 wire299,
                 wire300,
                 wire301,
                 wire302,
                 wire303,
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
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
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
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 (1'h0)};
  assign wire4 = wire0;
  assign wire5 = wire4;
  always
    @(posedge clk) begin
      reg6 <= {wire2};
      reg7 <= (8'hb1);
      if ($unsigned(reg6[(1'h0):(1'h0)]))
        begin
          if ((~$unsigned((~^wire4[(3'h5):(3'h4)]))))
            begin
              reg8 <= (^~(((~^(reg6 ?
                  reg6 : (8'had))) >= $signed($signed(wire5))) <= (!(|$signed(wire4)))));
              reg9 <= reg7[(2'h2):(1'h0)];
              reg10 <= reg6[(4'h8):(3'h4)];
              reg11 <= wire4;
              reg12 <= reg11;
            end
          else
            begin
              reg8 <= (~^wire3[(1'h0):(1'h0)]);
              reg9 <= reg10[(4'hb):(3'h7)];
              reg10 <= reg8;
            end
          reg13 <= $unsigned((reg11 ? (8'hb4) : reg8[(5'h15):(5'h11)]));
          if ($signed(reg9))
            begin
              reg14 <= $signed(reg12);
              reg15 <= $signed((7'h44));
              reg16 <= ($unsigned($signed($unsigned(reg15))) > $unsigned($signed(((~|reg9) >= reg6[(5'h11):(4'h8)]))));
              reg17 <= (wire5 != $signed($signed(((reg16 ? wire3 : (8'ha2)) ?
                  $signed(wire2) : reg6))));
            end
          else
            begin
              reg14 <= $signed(reg9);
              reg15 <= {(~^$unsigned((((8'hab) ? reg8 : wire2) ?
                      $unsigned(reg17) : reg15))),
                  ($signed($unsigned({reg17})) ? reg9 : reg9[(1'h0):(1'h0)])};
            end
        end
      else
        begin
          if ($signed(reg15[(1'h1):(1'h0)]))
            begin
              reg8 <= $unsigned($unsigned((^~reg10)));
              reg9 <= $signed(((!{(8'ha5), $unsigned(reg12)}) ?
                  wire5[(1'h1):(1'h0)] : $unsigned((reg16[(1'h0):(1'h0)] ?
                      (wire4 ? wire2 : wire3) : ((8'ha4) >= wire3)))));
            end
          else
            begin
              reg8 <= wire3;
              reg9 <= reg15[(2'h3):(1'h1)];
              reg10 <= reg12[(4'he):(2'h2)];
              reg11 <= $signed((wire1 * reg6));
              reg12 <= $signed(reg7);
            end
        end
    end
  assign wire18 = ($signed($unsigned(((wire0 ? reg7 : (8'haf)) == {wire3}))) ?
                      $unsigned($signed($unsigned((reg6 - (8'hac))))) : $unsigned(reg10));
  assign wire19 = ({reg7[(4'ha):(4'ha)]} << (+$unsigned(((reg15 ?
                          wire18 : reg7) ?
                      $unsigned(reg13) : $unsigned(reg10)))));
  always
    @(posedge clk) begin
      reg20 <= $signed(({wire3,
          reg10[(3'h6):(1'h0)]} < (reg6 <= ((wire18 <<< (7'h41)) != (wire0 != reg10)))));
      if (((-$unsigned($unsigned((~&reg14)))) << $unsigned(wire3[(3'h4):(3'h4)])))
        begin
          reg21 <= ((wire18 ? wire2 : (~|reg14[(2'h2):(1'h0)])) || reg9);
          reg22 <= ($signed(reg21[(4'hd):(3'h7)]) ?
              reg13[(1'h0):(1'h0)] : ((wire2[(2'h2):(1'h1)] ?
                      $signed($unsigned(wire0)) : $signed((reg8 <= reg13))) ?
                  reg21 : ({reg6[(4'h9):(3'h7)]} >= ((^reg12) * ((8'haa) <= wire0)))));
          reg23 <= (^~$signed((wire2 ? (~|(reg16 <<< reg6)) : reg15)));
          reg24 <= reg15;
          reg25 <= reg13[(2'h2):(1'h1)];
        end
      else
        begin
          reg21 <= $signed(reg7[(4'ha):(3'h7)]);
          reg22 <= (({$unsigned((~^reg21)), (&$signed(reg7))} ?
              $unsigned((+reg16[(1'h1):(1'h0)])) : {$unsigned(wire4[(1'h1):(1'h0)]),
                  {(~(8'ha7))}}) ~^ ($signed($signed(reg8)) < ($signed((reg21 ?
              reg12 : reg23)) != reg21[(1'h0):(1'h0)])));
        end
    end
  assign wire26 = (wire0 ?
                      reg25[(4'hb):(2'h2)] : ((~&({reg6, reg17} ?
                          reg14 : $unsigned(reg25))) + {(7'h40),
                          $unsigned(reg22)}));
  assign wire27 = (~|$unsigned($signed(reg25[(4'h9):(2'h3)])));
  always
    @(posedge clk) begin
      if (reg10[(4'h8):(1'h0)])
        begin
          reg28 <= reg21[(3'h4):(1'h1)];
        end
      else
        begin
          reg28 <= ((wire2 == (8'h9c)) ?
              (-(8'h9c)) : (((((8'ha8) ? reg23 : wire0) ?
                  (8'ha4) : wire5) <<< ((reg12 ?
                  (8'hbf) : reg10) - (~reg13))) & $signed(({wire1,
                  reg17} < (reg14 | wire19)))));
          reg29 <= {reg21[(4'h8):(3'h5)],
              (^((reg15[(3'h4):(1'h1)] ?
                  reg13[(1'h1):(1'h0)] : ((8'hb3) ?
                      wire0 : wire19)) <<< $unsigned((8'ha6))))};
          if (wire5)
            begin
              reg30 <= $unsigned($signed(((8'ha7) ?
                  reg14 : wire0[(3'h7):(3'h7)])));
              reg31 <= (~&wire2[(2'h2):(1'h1)]);
              reg32 <= $unsigned({(((reg23 ?
                      reg15 : reg21) ^ reg30) | $signed((&reg21))),
                  (^~$signed(wire3[(2'h2):(2'h2)]))});
              reg33 <= $signed(reg28);
              reg34 <= $signed(wire26[(3'h4):(2'h3)]);
            end
          else
            begin
              reg30 <= ($signed({{(^~wire27),
                      (reg14 ? reg12 : wire18)}}) | wire18);
              reg31 <= (reg22[(4'h8):(2'h2)] <= $signed(wire19));
              reg32 <= (8'hbe);
              reg33 <= (reg13[(3'h5):(2'h3)] ? reg6 : (&reg22));
            end
          if ((((((reg15 | (8'hac)) >>> reg10) ?
                  $signed(wire0) : reg24[(4'h8):(1'h0)]) ?
              reg20[(4'h8):(1'h0)] : wire19[(2'h3):(1'h0)]) > $signed($unsigned((&$signed(reg31))))))
            begin
              reg35 <= (8'ha3);
              reg36 <= ($signed(reg16) ? reg6 : reg33);
              reg37 <= $signed($signed(({{(8'ha1),
                      reg28}} >> (reg33[(3'h6):(3'h6)] & reg23))));
            end
          else
            begin
              reg35 <= wire26[(2'h2):(1'h1)];
              reg36 <= (reg25[(4'ha):(1'h1)] ?
                  $signed({reg16}) : ($signed($signed($signed((8'hbe)))) ?
                      (reg24[(2'h2):(1'h0)] <<< reg35) : $unsigned($signed((+reg31)))));
              reg37 <= wire19;
              reg38 <= (reg34 ? ($signed($signed(reg23)) <<< wire27) : reg9);
              reg39 <= wire18[(4'he):(2'h3)];
            end
        end
      reg40 <= reg39;
      reg41 <= {reg7[(2'h2):(1'h1)]};
    end
  assign wire42 = (({(reg41 ? reg20 : wire5[(2'h2):(1'h0)]),
                          reg7[(2'h2):(1'h0)]} == reg40[(1'h0):(1'h0)]) ?
                      reg10[(4'hb):(3'h6)] : $signed((($signed(reg40) ?
                              reg25 : wire4) ?
                          ((~&reg8) <= $signed((8'hb8))) : $signed($signed(reg13)))));
  assign wire43 = $signed(($signed(wire0[(2'h3):(1'h0)]) >> wire18[(4'hb):(1'h1)]));
  assign wire44 = $unsigned(($signed(({reg31} ^ reg12[(2'h2):(1'h0)])) ?
                      ((reg13[(3'h4):(1'h1)] ~^ {reg6, reg41}) <= {(reg33 ?
                              wire42 : reg10)}) : reg35[(2'h3):(1'h1)]));
  assign wire45 = (wire5 ? (-$signed((^(reg23 > reg14)))) : (&reg39));
  always
    @(posedge clk) begin
      if ((($signed((reg15 ? wire4[(3'h4):(1'h1)] : (-reg39))) ?
              {((reg40 ? reg31 : reg41) >= reg6)} : wire4[(1'h0):(1'h0)]) ?
          ((+($unsigned(reg22) ~^ {reg12, wire44})) ~^ (((~&(8'ha0)) ?
              $signed(reg12) : $signed(wire5)) <<< ($signed(reg7) >>> wire26[(2'h3):(1'h1)]))) : (!(reg41 * reg31))))
        begin
          reg46 <= $signed(wire26[(2'h3):(1'h1)]);
          if (wire0[(4'h9):(1'h0)])
            begin
              reg47 <= ((-($unsigned((~&reg41)) ?
                      wire45 : reg38[(2'h2):(1'h0)])) ?
                  reg32[(4'h9):(2'h3)] : $unsigned(((^~{wire4}) ~^ ($unsigned(wire2) ?
                      reg6[(5'h13):(4'hd)] : $signed(wire26)))));
              reg48 <= ((^((-{reg40, wire42}) << (8'h9f))) ?
                  ($unsigned($signed($signed(reg9))) ?
                      {(7'h44)} : reg13[(3'h4):(2'h3)]) : ($unsigned(reg40[(1'h0):(1'h0)]) * (~^(~^$signed((8'haa))))));
            end
          else
            begin
              reg47 <= $signed(((reg10[(2'h3):(1'h0)] >>> ((&reg41) <<< (reg7 ^ reg38))) ?
                  ((^~$signed(reg46)) != $unsigned((-reg6))) : (8'hbf)));
            end
          if ({($signed({(~|wire26), $unsigned(reg39)}) ?
                  (8'hb7) : $unsigned(({(8'hbf)} ?
                      ((8'hbf) & reg7) : (+reg9)))),
              (reg21 ? (+(8'hbf)) : $signed(reg13[(3'h6):(3'h5)]))})
            begin
              reg49 <= (~^(-{reg12}));
              reg50 <= $signed($signed((reg48 ~^ (~(reg16 >> wire3)))));
              reg51 <= (((~reg24) ? $unsigned((8'hb4)) : reg40) ?
                  (^(wire2[(3'h6):(2'h2)] && wire2)) : $unsigned($signed($signed((~(7'h44))))));
            end
          else
            begin
              reg49 <= ((reg15[(1'h0):(1'h0)] || reg47) ?
                  $signed((($signed(reg30) ?
                      wire1 : $signed(wire43)) >= reg23)) : (reg50[(1'h0):(1'h0)] ?
                      {{reg10[(4'ha):(3'h7)]},
                          $signed($signed(reg12))} : reg50[(2'h2):(2'h2)]));
              reg50 <= $unsigned(reg37);
            end
          reg52 <= reg12[(4'hd):(4'hb)];
          if (wire2[(3'h6):(1'h0)])
            begin
              reg53 <= $signed((($unsigned({reg49, (8'ha5)}) ?
                      $unsigned(wire0[(2'h3):(2'h3)]) : (~$signed((8'ha1)))) ?
                  (&$signed((|reg52))) : reg37[(2'h3):(1'h1)]));
              reg54 <= reg37[(3'h4):(2'h3)];
              reg55 <= (reg23[(1'h0):(1'h0)] & $signed(wire42));
            end
          else
            begin
              reg53 <= $signed((+reg53[(3'h5):(1'h1)]));
              reg54 <= ($unsigned($signed(((reg38 ?
                  (8'ha5) : reg25) & $signed(wire19)))) + {reg20});
              reg55 <= (wire18[(3'h5):(3'h5)] ^ {({(wire4 ? reg12 : reg23)} ?
                      $signed((reg53 >> reg46)) : (-reg37))});
              reg56 <= (wire3 < (((~|((8'ha6) ? reg48 : (7'h40))) ?
                      $unsigned($signed(reg32)) : {(8'ha9), (|reg34)}) ?
                  (+$unsigned((reg11 < wire18))) : (($unsigned(reg48) >= (&reg55)) || $signed($unsigned(reg9)))));
            end
        end
      else
        begin
          if ($unsigned($signed((-reg41))))
            begin
              reg46 <= {$signed($unsigned(wire2))};
              reg47 <= {((($unsigned((8'hab)) | {reg6}) | {$signed((8'ha8)),
                          {reg15, reg28}}) ?
                      ($signed($signed(reg6)) ?
                          ($unsigned(reg10) != reg35) : ($signed(reg33) ?
                              (8'ha9) : $signed(wire0))) : reg31[(5'h14):(4'hc)])};
            end
          else
            begin
              reg46 <= (!((~^$signed(((8'hb3) ^ wire44))) << reg11[(4'he):(2'h3)]));
            end
          reg48 <= (+{reg51, reg9});
          if (({reg38,
              (wire5[(5'h10):(2'h3)] ?
                  $unsigned((reg15 ~^ wire4)) : (|(~^wire4)))} << (&(-($signed(reg41) ?
              (reg53 <= wire45) : ((8'ha2) ? wire19 : reg14))))))
            begin
              reg49 <= ($signed(reg14) >>> (reg54[(1'h0):(1'h0)] ?
                  $unsigned(reg34[(4'hb):(3'h7)]) : $signed($signed($unsigned(reg24)))));
              reg50 <= ($signed(($unsigned(reg17) ?
                  ((^wire45) <<< ((8'h9c) ? reg51 : reg11)) : {reg35,
                      reg52[(2'h2):(2'h2)]})) >> (^(({wire5,
                  wire43} * (wire3 >= reg6)) ^ $unsigned(reg32[(3'h4):(2'h3)]))));
            end
          else
            begin
              reg49 <= (^~reg32[(2'h2):(2'h2)]);
            end
          if ($signed((reg6[(5'h13):(4'hd)] ?
              ($signed(reg50) ?
                  (~&{reg40, (8'h9f)}) : (reg12 ?
                      wire4 : (reg14 ~^ reg39))) : reg48[(1'h1):(1'h1)])))
            begin
              reg51 <= $signed(($signed({((8'h9c) ? reg33 : reg16),
                      reg28[(4'h8):(4'h8)]}) ?
                  $signed($unsigned((^~reg47))) : (((wire0 + reg36) ?
                          (reg12 + reg24) : $signed(reg23)) ?
                      ((reg11 ? reg35 : reg54) ?
                          reg38[(2'h3):(2'h3)] : reg47) : reg54)));
              reg52 <= ($unsigned(reg24) ?
                  reg13[(2'h2):(1'h1)] : $unsigned({($unsigned(reg21) ?
                          ((8'hab) >> reg34) : (+(8'h9e)))}));
              reg53 <= $unsigned($unsigned(wire1[(5'h13):(4'he)]));
            end
          else
            begin
              reg51 <= (~^(8'hbf));
              reg52 <= {$signed(((^{reg10,
                      reg22}) || ($unsigned(reg23) * reg32)))};
              reg53 <= reg31[(3'h6):(2'h3)];
              reg54 <= $signed(wire45);
              reg55 <= reg40;
            end
        end
      if ({(8'hbf)})
        begin
          reg57 <= (({((8'hbd) ? (&wire44) : $unsigned(wire44)),
              $signed($unsigned((7'h42)))} || $signed((|$signed(reg55)))) > {(((wire2 <<< reg46) ?
                  $unsigned(reg53) : wire27) * $unsigned($signed(wire42))),
              reg53});
          reg58 <= wire2[(1'h1):(1'h1)];
          reg59 <= ((wire42 >= ($unsigned($unsigned(reg33)) ?
              ($signed(reg53) && (reg51 ?
                  (8'ha6) : reg36)) : ((8'hb3) ^ (reg29 >= reg39)))) | (reg12 | {{$signed((7'h40)),
                  (reg22 ? reg11 : reg55)}}));
        end
      else
        begin
          if (reg34)
            begin
              reg57 <= $signed(reg9);
            end
          else
            begin
              reg57 <= $unsigned(reg33);
            end
          reg58 <= reg22;
        end
      if (reg6[(4'ha):(3'h4)])
        begin
          reg60 <= $unsigned({(!(+$signed(wire1)))});
          if ($signed((-(&$unsigned($unsigned((8'ha8)))))))
            begin
              reg61 <= (^~reg20);
              reg62 <= wire43[(4'h8):(1'h1)];
            end
          else
            begin
              reg61 <= (wire42 ?
                  (|$unsigned((((7'h42) > reg57) ?
                      (-wire4) : reg32[(4'h9):(4'h8)]))) : reg39[(2'h2):(1'h0)]);
              reg62 <= reg55[(3'h6):(2'h2)];
              reg63 <= $unsigned({{reg17}, (~^reg62[(5'h11):(5'h11)])});
            end
          reg64 <= reg31[(5'h13):(4'h9)];
        end
      else
        begin
          if ((~|reg12))
            begin
              reg60 <= (((~({wire18} ?
                      (reg60 ?
                          reg11 : reg13) : (8'ha1))) <= (~|wire44[(2'h3):(2'h3)])) ?
                  $signed((~|reg7[(2'h3):(1'h0)])) : ({((~&wire45) ?
                              reg14[(4'h8):(4'h8)] : ((7'h42) << reg7))} ?
                      reg40 : $unsigned(((8'haa) ^~ (|reg25)))));
            end
          else
            begin
              reg60 <= $unsigned({(({reg51, (8'hb8)} ?
                      (wire5 ?
                          reg30 : wire1) : reg56[(2'h3):(1'h0)]) || reg13[(5'h12):(2'h3)])});
              reg61 <= (|reg55[(4'h9):(2'h2)]);
              reg62 <= ((^$signed($signed($signed(wire19)))) + ((reg52[(2'h2):(2'h2)] ?
                      reg39 : ((!reg7) != {reg16})) ?
                  reg53 : {$signed((reg34 * reg61)),
                      $unsigned(reg36[(4'h8):(3'h6)])}));
              reg63 <= reg61[(1'h0):(1'h0)];
            end
          reg64 <= (reg52 ?
              (&($signed(reg49) ?
                  (reg59 ?
                      $unsigned(reg8) : (wire42 ?
                          reg15 : wire0)) : $signed($signed(wire4)))) : reg63[(3'h6):(1'h0)]);
          reg65 <= {$unsigned(wire5[(1'h1):(1'h0)]),
              ((~&(~{reg8, reg48})) <= $signed({((8'ha3) ? reg39 : reg11),
                  $unsigned(reg50)}))};
          reg66 <= {((($unsigned(reg31) || (~^reg61)) > reg30[(4'he):(4'hc)]) ?
                  reg40[(1'h0):(1'h0)] : (~^($unsigned(reg64) > reg35))),
              $unsigned((&((wire45 | wire5) ?
                  {wire45, reg33} : (wire42 ^~ reg17))))};
          reg67 <= $signed((reg64[(5'h13):(5'h11)] < (&$unsigned($signed((8'ha8))))));
        end
      reg68 <= $signed($unsigned($signed({$unsigned(reg10), {reg66, reg48}})));
      reg69 <= $unsigned(($unsigned(reg25[(2'h3):(2'h2)]) ?
          reg36[(4'he):(4'he)] : reg13[(4'hd):(4'h8)]));
    end
  module70 #() modinst164 (wire163, clk, reg13, reg35, reg53, reg8, reg58);
  assign wire165 = wire5;
  module166 #() modinst296 (.wire168(wire19), .wire170(reg20), .clk(clk), .wire167(reg14), .wire169(reg60), .y(wire295));
  module263 #() modinst298 (.wire264(reg30), .wire268(reg57), .wire267(reg40), .y(wire297), .clk(clk), .wire266(wire19), .wire265(wire26));
  assign wire299 = $signed($unsigned({($signed(reg21) ^ $unsigned(reg49)),
                       ($unsigned(wire43) ? reg67[(1'h1):(1'h1)] : (8'ha1))}));
  assign wire300 = $signed($unsigned(($unsigned(reg49) ?
                       $signed(reg39) : ((!(8'hbb)) ?
                           (wire163 ?
                               (8'hb7) : reg11) : reg69[(1'h1):(1'h1)]))));
  assign wire301 = (($signed((+(reg11 ?
                           reg51 : reg52))) && $signed({reg67[(2'h3):(2'h2)]})) ?
                       (reg16[(2'h3):(2'h3)] ?
                           wire26 : $unsigned((+reg15))) : ((&$unsigned(((8'h9f) ?
                           reg58 : reg64))) ~^ $unsigned(wire27)));
  assign wire302 = (~^(+reg56));
  module226 #() modinst304 (wire303, clk, reg59, wire19, reg31, wire3, wire45);
endmodule

module module166
#(parameter param294 = (({((7'h41) << ((8'hb0) << (8'hb3)))} == (~^{((8'hbc) != (8'had)), (&(8'hb0))})) >>> (((((8'ha7) != (8'ha9)) ? ((8'hbc) >= (8'ha7)) : (~^(8'hb4))) ? (~|(&(8'hb0))) : {{(8'ha5)}}) <<< ({{(8'hbb), (8'hbd)}, ((8'hb4) ? (8'haa) : (8'hb1))} ? (8'haf) : {((8'h9c) < (8'ha9)), {(8'hb6)}}))))
(y, clk, wire170, wire169, wire168, wire167);
  output wire [(32'h145):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire170;
  input wire signed [(4'ha):(1'h0)] wire169;
  input wire signed [(4'ha):(1'h0)] wire168;
  input wire [(2'h2):(1'h0)] wire167;
  wire [(4'hb):(1'h0)] wire293;
  wire signed [(2'h2):(1'h0)] wire291;
  wire [(4'h8):(1'h0)] wire261;
  wire [(5'h12):(1'h0)] wire225;
  wire signed [(5'h14):(1'h0)] wire224;
  wire signed [(5'h14):(1'h0)] wire223;
  wire [(2'h3):(1'h0)] wire222;
  wire [(4'h9):(1'h0)] wire221;
  wire signed [(3'h7):(1'h0)] wire220;
  wire [(5'h10):(1'h0)] wire218;
  wire signed [(5'h10):(1'h0)] wire186;
  reg [(4'he):(1'h0)] reg185 = (1'h0);
  reg [(4'he):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg183 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg182 = (1'h0);
  reg [(5'h15):(1'h0)] reg181 = (1'h0);
  reg [(5'h15):(1'h0)] reg180 = (1'h0);
  reg [(3'h4):(1'h0)] reg179 = (1'h0);
  reg [(4'hb):(1'h0)] reg178 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg177 = (1'h0);
  reg [(5'h11):(1'h0)] reg176 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg174 = (1'h0);
  reg [(4'hd):(1'h0)] reg173 = (1'h0);
  reg [(4'hb):(1'h0)] reg172 = (1'h0);
  reg [(5'h15):(1'h0)] reg171 = (1'h0);
  assign y = {wire293,
                 wire291,
                 wire261,
                 wire225,
                 wire224,
                 wire223,
                 wire222,
                 wire221,
                 wire220,
                 wire218,
                 wire186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg171 <= (wire168[(4'h8):(3'h5)] ?
          $unsigned($signed(wire169[(4'h8):(3'h5)])) : (8'hb2));
      if (({$unsigned($signed({(7'h40), (7'h44)}))} || wire168[(4'h9):(1'h1)]))
        begin
          if ($unsigned($signed(($signed($signed((8'hbd))) ?
              reg171 : $signed(wire169[(4'ha):(2'h3)])))))
            begin
              reg172 <= ({$signed(wire170[(2'h2):(1'h1)]),
                      ((&wire168[(2'h3):(2'h2)]) ?
                          $signed($unsigned(wire170)) : $signed((wire167 ?
                              wire169 : wire169)))} ?
                  (((&wire169[(4'h8):(3'h7)]) <= $unsigned(wire168)) > ((&(reg171 ?
                      wire168 : wire170)) + {{wire170},
                      $unsigned(wire170)})) : $unsigned((~^(reg171 ?
                      $signed(wire170) : $unsigned(wire169)))));
              reg173 <= {(8'hbe)};
              reg174 <= ($signed($signed(($unsigned(wire168) ?
                      wire168[(2'h2):(1'h0)] : (^reg172)))) ?
                  $signed((!(+(wire169 <<< wire169)))) : (wire168[(4'h8):(1'h0)] ?
                      wire169[(2'h2):(1'h0)] : (-$unsigned({wire167}))));
              reg175 <= $unsigned($unsigned(reg173[(4'hb):(3'h4)]));
            end
          else
            begin
              reg172 <= (reg173 ^ $signed(wire167[(1'h0):(1'h0)]));
              reg173 <= (~(wire167[(2'h2):(1'h1)] ?
                  ($unsigned((+reg175)) ?
                      $unsigned(wire168[(3'h4):(2'h2)]) : $signed($signed(reg173))) : wire169));
            end
          reg176 <= wire170[(4'he):(2'h3)];
          reg177 <= $unsigned($unsigned($signed(($unsigned(wire169) ?
              (+wire169) : wire169[(2'h3):(2'h3)]))));
          if ($signed($signed(($unsigned(reg175[(1'h1):(1'h0)]) ?
              ((~|reg177) ?
                  $unsigned(wire167) : {wire168, wire168}) : {$signed(reg174),
                  $unsigned(wire169)}))))
            begin
              reg178 <= reg173;
              reg179 <= reg173;
              reg180 <= (~$unsigned(({reg174,
                  reg178[(1'h1):(1'h0)]} >> ((wire169 ^ reg178) & (+reg179)))));
              reg181 <= $signed($unsigned($unsigned($unsigned($signed(wire168)))));
              reg182 <= (8'ha0);
            end
          else
            begin
              reg178 <= $unsigned($unsigned($unsigned(wire170)));
              reg179 <= reg174;
              reg180 <= $unsigned($unsigned(wire170[(1'h0):(1'h0)]));
            end
          reg183 <= wire170[(4'hb):(1'h0)];
        end
      else
        begin
          reg172 <= {$signed($signed($unsigned({reg172, reg179}))),
              {(($signed((8'ha7)) ^~ reg181) ?
                      $signed({reg183, wire170}) : $signed(((8'hb9) ?
                          reg179 : reg172)))}};
          reg173 <= reg181;
        end
      reg184 <= ($unsigned($signed((!(reg177 ?
          reg183 : wire169)))) - (~$unsigned(($signed(reg173) ?
          ((8'h9e) ? wire169 : reg179) : {(8'ha9)}))));
      reg185 <= ({({(~&wire167)} != ($unsigned(reg171) ~^ reg177[(1'h0):(1'h0)]))} ?
          ($unsigned((reg178 ?
              {reg174} : $unsigned(reg179))) != reg171) : $signed((~|(reg184 ?
              $unsigned(wire167) : $signed(wire170)))));
    end
  assign wire186 = $unsigned({{$signed((~reg173)), reg172[(1'h0):(1'h0)]}});
  module187 #() modinst219 (.wire190(wire169), .wire189(wire186), .clk(clk), .wire191(reg181), .y(wire218), .wire188(reg178));
  assign wire220 = (^~wire169[(3'h4):(2'h2)]);
  assign wire221 = reg182[(1'h0):(1'h0)];
  assign wire222 = reg179[(2'h3):(1'h0)];
  assign wire223 = ({$unsigned((^~reg171[(4'he):(4'h9)])),
                       ($unsigned((|reg182)) >= ({wire221} ?
                           {(8'ha9)} : reg185[(4'h9):(3'h7)]))} << wire186[(2'h2):(1'h1)]);
  assign wire224 = ($unsigned((reg177[(1'h1):(1'h1)] ?
                           (reg175[(1'h1):(1'h1)] >>> (~&reg178)) : (^(^~wire223)))) ?
                       wire218[(5'h10):(1'h0)] : reg173);
  assign wire225 = ((wire218 ?
                           {(8'hb1)} : $unsigned((-(reg182 ?
                               (8'ha9) : wire220)))) ?
                       reg179 : $signed({(reg178[(2'h2):(1'h0)] ?
                               $unsigned(reg178) : reg185[(3'h7):(3'h7)]),
                           (^~{reg174, reg173})}));
  module226 #() modinst262 (wire261, clk, wire186, reg171, reg181, reg183, wire223);
  module263 #() modinst292 (wire291, clk, wire170, reg174, reg182, wire223, reg175);
  assign wire293 = (&(wire218[(3'h4):(1'h1)] <<< ($unsigned($signed(reg171)) ?
                       reg180[(3'h6):(1'h0)] : ((wire170 << wire170) >> (wire167 ^~ wire218)))));
endmodule

module module70  (y, clk, wire71, wire72, wire73, wire74, wire75);
  output wire [(32'h18e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire71;
  input wire [(4'ha):(1'h0)] wire72;
  input wire [(5'h13):(1'h0)] wire73;
  input wire [(5'h14):(1'h0)] wire74;
  input wire [(3'h6):(1'h0)] wire75;
  wire signed [(3'h5):(1'h0)] wire161;
  wire signed [(5'h12):(1'h0)] wire160;
  wire signed [(5'h12):(1'h0)] wire159;
  wire [(5'h12):(1'h0)] wire158;
  wire signed [(2'h2):(1'h0)] wire157;
  wire [(5'h10):(1'h0)] wire143;
  wire signed [(5'h11):(1'h0)] wire142;
  wire [(4'hd):(1'h0)] wire86;
  wire [(4'h9):(1'h0)] wire88;
  wire signed [(3'h6):(1'h0)] wire89;
  wire signed [(5'h12):(1'h0)] wire90;
  wire signed [(3'h4):(1'h0)] wire91;
  wire [(5'h11):(1'h0)] wire140;
  reg signed [(5'h13):(1'h0)] reg162 = (1'h0);
  reg [(4'h8):(1'h0)] reg156 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg154 = (1'h0);
  reg [(3'h6):(1'h0)] reg153 = (1'h0);
  reg [(5'h10):(1'h0)] reg152 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg151 = (1'h0);
  reg [(5'h15):(1'h0)] reg150 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg148 = (1'h0);
  reg [(5'h15):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg146 = (1'h0);
  reg [(5'h10):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg95 = (1'h0);
  reg [(4'hf):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg92 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire143,
                 wire142,
                 wire86,
                 wire88,
                 wire89,
                 wire90,
                 wire91,
                 wire140,
                 reg162,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  module76 #() modinst87 (.wire79(wire71), .wire78(wire72), .y(wire86), .wire77(wire74), .wire80(wire73), .clk(clk));
  assign wire88 = $signed(wire86);
  assign wire89 = (wire88 > $signed($unsigned(((+wire86) <= wire88[(3'h4):(2'h2)]))));
  assign wire90 = $signed(wire73);
  assign wire91 = $signed(wire74[(4'hb):(4'h9)]);
  always
    @(posedge clk) begin
      reg92 <= wire75[(3'h4):(2'h2)];
      reg93 <= $signed(((^~($unsigned(wire91) ? (&(7'h43)) : {wire72})) ?
          ((8'hb5) ?
              (wire86[(3'h4):(1'h1)] ?
                  $unsigned(wire89) : (wire74 ? wire90 : wire91)) : (wire71 ?
                  $unsigned(wire90) : {wire89,
                      wire74})) : (&wire89[(2'h3):(1'h0)])));
      reg94 <= ({wire74, ({$signed((8'hb2))} ^ wire89[(3'h4):(2'h2)])} ?
          ((wire74 ?
                  ($signed((7'h41)) || ((8'ha4) ?
                      reg93 : (8'h9c))) : wire91[(1'h1):(1'h1)]) ?
              $signed($unsigned($signed(reg92))) : $signed(wire90[(1'h1):(1'h0)])) : ($unsigned(wire86[(4'hb):(3'h6)]) | $unsigned($unsigned((~^wire73)))));
      reg95 <= $unsigned(reg92[(1'h1):(1'h1)]);
    end
  module96 #() modinst141 (wire140, clk, wire91, wire74, reg93, reg92, wire71);
  assign wire142 = wire90;
  assign wire143 = ((reg95[(4'h9):(4'h9)] == (wire91[(2'h2):(1'h0)] ?
                           $unsigned(reg95) : $unsigned((8'hb6)))) ?
                       (~&(!$signed(wire90))) : wire90);
  always
    @(posedge clk) begin
      if (((wire143[(4'hc):(2'h2)] >>> $signed(reg92)) - wire75[(2'h2):(2'h2)]))
        begin
          reg144 <= ($signed(wire73) >= $signed($unsigned($signed(((8'hb1) ?
              wire75 : wire143)))));
          reg145 <= (($signed(reg144) ?
                  $signed(((wire89 > reg144) > $signed(reg93))) : reg93[(3'h6):(1'h0)]) ?
              $unsigned($signed(wire88[(1'h1):(1'h0)])) : (8'hab));
          reg146 <= {(8'hab),
              $signed((reg95 ^~ (wire74[(2'h3):(1'h1)] ?
                  (8'hb8) : wire142[(4'hb):(2'h3)])))};
          reg147 <= {((^~(&wire140)) & ($signed((^wire74)) ?
                  (~reg92) : $unsigned((&wire73)))),
              (reg145 ?
                  $unsigned($signed(wire143[(1'h1):(1'h1)])) : wire86[(1'h1):(1'h0)])};
          if (wire88[(3'h4):(1'h0)])
            begin
              reg148 <= wire75;
              reg149 <= $unsigned(($unsigned($signed($unsigned(reg147))) << {((wire140 ^~ reg92) ?
                      wire90[(3'h4):(2'h2)] : (^~reg147))}));
              reg150 <= (wire88[(3'h5):(1'h1)] ?
                  $unsigned($signed((|$unsigned(wire90)))) : (8'hab));
            end
          else
            begin
              reg148 <= $unsigned($signed($signed((wire71[(2'h3):(1'h0)] ?
                  $signed(wire74) : wire73[(3'h6):(3'h5)]))));
              reg149 <= $signed((($signed(wire140) ?
                  ((~^wire71) << (reg93 >= wire91)) : (reg93 & (wire74 ?
                      wire142 : (8'hb3)))) ^ $signed((~&reg93))));
            end
        end
      else
        begin
          reg144 <= (wire75 & $unsigned(wire71));
          if ({(|wire90[(4'h8):(4'h8)])})
            begin
              reg145 <= reg93;
              reg146 <= (~^$signed($signed(($unsigned(wire143) - (reg95 * reg148)))));
            end
          else
            begin
              reg145 <= (+wire75);
              reg146 <= wire140[(3'h5):(3'h4)];
              reg147 <= $unsigned($signed($signed((~&(reg150 ?
                  wire89 : reg92)))));
              reg148 <= wire143[(3'h4):(2'h2)];
              reg149 <= (wire90[(4'hb):(4'ha)] * reg146[(4'hb):(1'h0)]);
            end
          reg150 <= reg147[(5'h12):(4'hb)];
          if ($unsigned({(($signed(wire91) <<< (reg145 ?
                  wire142 : reg95)) < reg145)}))
            begin
              reg151 <= $signed(wire143[(4'hd):(1'h1)]);
              reg152 <= $signed($unsigned(reg146));
              reg153 <= {$signed(((|reg93[(1'h1):(1'h1)]) != reg146))};
              reg154 <= (wire73 ^~ ((((wire75 - wire89) ?
                  $unsigned(reg92) : $signed(reg147)) >= $unsigned((~|wire86))) && $unsigned($unsigned($unsigned(reg94)))));
              reg155 <= reg93;
            end
          else
            begin
              reg151 <= $signed($signed(wire73[(3'h5):(1'h0)]));
              reg152 <= $unsigned(wire88);
            end
        end
      reg156 <= ((~^(((reg148 ?
          reg95 : wire142) != (reg149 && (8'hb2))) > $signed($signed(wire73)))) && (8'hba));
    end
  assign wire157 = $unsigned(((~|{$signed((8'ha9)),
                           ((8'ha3) ? wire86 : (8'hb1))}) ?
                       $unsigned((-$signed((8'hbe)))) : {(+reg94),
                           $signed(reg156[(3'h7):(1'h0)])}));
  assign wire158 = (reg149 ?
                       (!$signed(wire73)) : $unsigned($signed((reg93[(3'h7):(3'h5)] && (wire74 ?
                           wire143 : wire71)))));
  assign wire159 = (reg149[(1'h0):(1'h0)] ?
                       $signed((^~reg148[(2'h2):(1'h1)])) : reg95[(2'h3):(1'h1)]);
  assign wire160 = ($unsigned((8'haa)) != $signed((wire75 < wire86[(4'hb):(4'hb)])));
  assign wire161 = (($signed((reg95[(3'h7):(3'h5)] ?
                       (reg147 >> wire89) : $unsigned(reg149))) <= ((~^(~(7'h40))) ?
                       {{wire73, wire86},
                           (~|wire71)} : wire160[(3'h7):(2'h3)])) >= $unsigned((8'ha4)));
  always
    @(posedge clk) begin
      reg162 <= reg156[(3'h4):(2'h2)];
    end
endmodule

module module96
#(parameter param138 = (~(~|((((8'hb6) - (8'hb9)) + {(8'hbf), (8'hb4)}) ? (-((8'hac) >> (8'haa))) : (((8'hbd) ? (8'hb1) : (8'hbe)) && ((8'hac) ? (8'hb2) : (8'hb9)))))), 
parameter param139 = (|param138))
(y, clk, wire101, wire100, wire99, wire98, wire97);
  output wire [(32'h194):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire101;
  input wire [(4'h9):(1'h0)] wire100;
  input wire signed [(4'hb):(1'h0)] wire99;
  input wire [(2'h2):(1'h0)] wire98;
  input wire signed [(2'h2):(1'h0)] wire97;
  wire [(4'hc):(1'h0)] wire136;
  wire signed [(4'h9):(1'h0)] wire135;
  wire signed [(3'h4):(1'h0)] wire134;
  wire [(5'h12):(1'h0)] wire133;
  wire [(4'hd):(1'h0)] wire120;
  wire signed [(4'hb):(1'h0)] wire119;
  wire [(3'h4):(1'h0)] wire118;
  wire [(4'hd):(1'h0)] wire117;
  wire signed [(4'hf):(1'h0)] wire109;
  wire [(5'h11):(1'h0)] wire108;
  wire signed [(4'h9):(1'h0)] wire107;
  wire signed [(4'hb):(1'h0)] wire106;
  wire [(4'h9):(1'h0)] wire105;
  wire [(4'h8):(1'h0)] wire104;
  wire signed [(5'h15):(1'h0)] wire103;
  wire signed [(3'h5):(1'h0)] wire102;
  reg [(4'hb):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg131 = (1'h0);
  reg [(4'h8):(1'h0)] reg130 = (1'h0);
  reg [(5'h11):(1'h0)] reg129 = (1'h0);
  reg [(4'hf):(1'h0)] reg128 = (1'h0);
  reg [(4'h8):(1'h0)] reg127 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg125 = (1'h0);
  reg [(4'h9):(1'h0)] reg124 = (1'h0);
  reg [(3'h6):(1'h0)] reg123 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg122 = (1'h0);
  reg [(4'he):(1'h0)] reg121 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg116 = (1'h0);
  reg [(4'hf):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg113 = (1'h0);
  reg [(2'h2):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg110 = (1'h0);
  assign y = {wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 reg137,
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
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 (1'h0)};
  assign wire102 = (($signed({(wire101 ? wire97 : wire99),
                       wire100[(2'h3):(2'h2)]}) & wire98) >> (+(wire97[(1'h0):(1'h0)] ?
                       wire101[(1'h1):(1'h1)] : wire100[(3'h4):(2'h3)])));
  assign wire103 = (+$signed((wire98[(1'h0):(1'h0)] ?
                       wire100 : {wire102[(2'h2):(1'h0)],
                           {(8'ha6), wire101}})));
  assign wire104 = (~|wire103);
  assign wire105 = (~|(|wire99[(4'hb):(3'h7)]));
  assign wire106 = (wire105[(3'h5):(3'h5)] <<< wire98[(2'h2):(1'h0)]);
  assign wire107 = $unsigned((wire105[(1'h1):(1'h0)] <= {wire102}));
  assign wire108 = $signed($signed($unsigned($unsigned((wire105 ?
                       wire99 : (8'ha8))))));
  assign wire109 = (&{wire103,
                       (wire102 ?
                           ($signed(wire102) || (~^wire103)) : (-wire104))});
  always
    @(posedge clk) begin
      reg110 <= wire104[(3'h4):(1'h0)];
      reg111 <= (wire103[(5'h10):(4'h8)] ?
          $signed(((wire100[(3'h5):(1'h0)] ?
              wire99[(3'h7):(2'h2)] : wire106) << wire102)) : (($signed(wire103) ?
                  {(wire109 ? wire105 : wire98)} : wire100) ?
              wire108[(3'h4):(2'h2)] : wire105[(2'h3):(2'h2)]));
    end
  always
    @(posedge clk) begin
      reg112 <= {(wire106[(3'h6):(3'h4)] ?
              wire98 : (&$unsigned($unsigned(reg111))))};
      reg113 <= ({($signed((wire107 >= wire107)) ?
              wire109 : ($unsigned(wire103) & (|wire107))),
          (($unsigned((7'h43)) * (~wire106)) >= wire103[(5'h11):(1'h0)])} ~^ $unsigned($unsigned(($unsigned(wire106) ?
          wire100 : (~^wire109)))));
      if ($signed(({({wire100} & (~^reg113))} ?
          (~wire109[(1'h1):(1'h0)]) : ($signed($signed(wire102)) >>> (((8'ha4) ?
                  reg110 : wire109) ?
              (^~(8'hab)) : wire98)))))
        begin
          reg114 <= wire98;
          if ({(+($unsigned((wire105 >= wire101)) ?
                  (reg113[(3'h4):(3'h4)] ?
                      wire103 : (wire104 ?
                          reg111 : reg111)) : (reg111 * $unsigned((7'h43)))))})
            begin
              reg115 <= ((+$signed($unsigned(wire101[(3'h4):(2'h2)]))) ?
                  (~|$unsigned((^wire101[(1'h0):(1'h0)]))) : (wire109[(1'h0):(1'h0)] <= $signed(($unsigned(wire100) >>> (reg113 ?
                      reg113 : wire97)))));
            end
          else
            begin
              reg115 <= (~&reg115);
              reg116 <= $signed($unsigned($unsigned((^(reg111 >= wire107)))));
            end
        end
      else
        begin
          reg114 <= $signed(($signed((reg112[(1'h1):(1'h0)] ?
              $unsigned(reg111) : $unsigned(wire99))) ~^ wire101[(1'h0):(1'h0)]));
          reg115 <= $unsigned((^~reg111));
          reg116 <= wire108[(3'h5):(3'h4)];
        end
    end
  assign wire117 = (~|wire105);
  assign wire118 = $unsigned($unsigned((reg114[(3'h5):(2'h2)] ?
                       $signed((wire103 ?
                           wire106 : reg114)) : ((reg110 - wire102) ?
                           ((8'hab) <= wire117) : $signed(reg116)))));
  assign wire119 = wire107;
  assign wire120 = ({reg110} ?
                       wire107[(1'h1):(1'h0)] : $signed((~|wire98[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg121 <= {(~^{{wire104[(2'h3):(1'h0)]},
              $unsigned((wire107 ? wire97 : wire105))})};
      if (wire97)
        begin
          reg122 <= ((~|(|((wire117 ?
              wire120 : wire109) * wire98))) == (($signed($unsigned(reg114)) >>> $signed((wire101 ?
              wire119 : wire97))) >= (^~{{reg121}, $signed(wire119)})));
          reg123 <= $unsigned(((((^reg114) ?
              (+wire119) : (reg113 ^ wire106)) || wire100[(3'h5):(2'h3)]) || reg114[(4'ha):(3'h7)]));
          if ((reg121 <= wire120))
            begin
              reg124 <= {(wire108 == (~(^~reg122[(1'h0):(1'h0)]))),
                  (+$signed(wire120))};
              reg125 <= $unsigned(wire118);
              reg126 <= ({$signed(wire106)} ?
                  {$signed(($unsigned(reg112) * ((8'hbd) ^~ wire108))),
                      {((wire119 + wire109) ?
                              (reg122 | wire104) : (wire103 ?
                                  reg114 : (7'h40)))}} : (wire119[(4'h8):(3'h7)] ^ wire118[(2'h2):(1'h1)]));
              reg127 <= $unsigned((~^(|($unsigned(wire100) == $unsigned((8'ha4))))));
            end
          else
            begin
              reg124 <= $signed(({(reg127 << $signed(wire101)),
                      wire97[(2'h2):(1'h0)]} ?
                  $signed($signed($signed(reg111))) : $signed((reg116[(3'h4):(3'h4)] ?
                      (reg115 ? reg116 : reg124) : reg124))));
              reg125 <= (^~wire109);
            end
          if ($signed((~|$unsigned({$signed(reg126)}))))
            begin
              reg128 <= $unsigned((|(^reg110)));
              reg129 <= ((~|(reg127 < reg123[(2'h2):(2'h2)])) ?
                  {$signed($unsigned(wire98[(2'h2):(2'h2)])),
                      $unsigned(reg124)} : ($unsigned(((8'hae) >>> reg123)) ?
                      $unsigned(wire109[(2'h3):(1'h0)]) : {reg114, wire105}));
              reg130 <= (!$signed(wire102[(1'h0):(1'h0)]));
              reg131 <= reg115;
            end
          else
            begin
              reg128 <= $signed($unsigned(wire120));
              reg129 <= reg116[(3'h4):(2'h2)];
              reg130 <= $unsigned($unsigned((reg110 ?
                  ({reg127} ?
                      reg130 : (reg127 ? reg116 : wire118)) : (-(wire104 ?
                      reg114 : wire102)))));
              reg131 <= $signed((wire105 ?
                  (~&$signed(reg110)) : $signed((wire104[(2'h2):(1'h0)] << (reg129 ~^ reg121)))));
            end
          reg132 <= $unsigned(wire108[(4'ha):(4'h8)]);
        end
      else
        begin
          if (((wire118 ? wire106[(1'h1):(1'h1)] : reg115) ?
              $signed(((|wire109) ?
                  reg113[(4'hc):(3'h5)] : {(reg128 <= reg128),
                      wire97})) : ((~|$signed($unsigned((8'hbb)))) <= (-$signed((wire101 ?
                  wire120 : (7'h44)))))))
            begin
              reg122 <= $signed(($signed($signed({wire105})) >> wire100));
            end
          else
            begin
              reg122 <= (~^({($unsigned(wire119) & $unsigned(reg127)),
                      $signed(reg132)} ?
                  (~&wire104) : $unsigned((+reg124[(3'h5):(2'h3)]))));
              reg123 <= $signed((($signed($unsigned((8'h9e))) ?
                  $signed(wire117) : $signed((^reg115))) ^ (($unsigned(reg123) ?
                  (reg111 && wire109) : (wire118 * reg126)) <<< ({(8'ha4),
                      reg131} ?
                  reg130 : $unsigned(reg113)))));
              reg124 <= (~&$signed(wire109[(2'h3):(2'h3)]));
            end
          reg125 <= ({(((reg115 ? wire108 : wire109) ^~ (!wire102)) ?
                      {wire104} : ($unsigned((8'ha8)) ?
                          (~|reg123) : (&wire107))),
                  $signed((~|(~|reg113)))} ?
              $unsigned((~reg127[(1'h1):(1'h1)])) : $unsigned((|(~(^~wire119)))));
          if (({$signed($unsigned((reg123 > reg121))),
              (+(&(reg115 ?
                  (8'ha9) : reg125)))} != (($unsigned((wire107 ^ reg112)) ?
              $signed($unsigned((8'hbd))) : (wire104[(3'h6):(3'h5)] << $signed(wire98))) >>> reg132[(2'h2):(2'h2)])))
            begin
              reg126 <= $unsigned(reg131);
              reg127 <= $signed((~|((&(&(7'h40))) ?
                  $unsigned((|(8'hbd))) : {$signed(reg127)})));
            end
          else
            begin
              reg126 <= (^~wire105[(2'h3):(1'h1)]);
              reg127 <= wire104;
              reg128 <= {reg126, $unsigned((-(8'ha5)))};
              reg129 <= $unsigned((^reg116));
              reg130 <= ((7'h41) ? wire99 : (8'h9d));
            end
          reg131 <= $signed(wire102[(2'h2):(1'h0)]);
        end
    end
  assign wire133 = wire100;
  assign wire134 = ($signed((~&$unsigned($signed(reg114)))) ?
                       ((wire118[(2'h2):(1'h1)] ?
                           (~^(wire105 < wire104)) : (+$signed(wire99))) ^~ ($unsigned($unsigned(reg110)) ?
                           ($unsigned(wire98) ?
                               $unsigned(reg116) : wire97[(1'h0):(1'h0)]) : (wire105 ?
                               ((8'h9f) >= (8'hbb)) : $signed(wire108)))) : $unsigned($unsigned((-$unsigned(wire103)))));
  assign wire135 = ((~wire106[(4'h9):(4'h8)]) ?
                       wire105 : $signed((($unsigned(reg121) ?
                               ((7'h40) && reg130) : $signed(reg132)) ?
                           ((reg112 >= wire109) ~^ $signed(reg130)) : ($signed(reg130) * wire101))));
  assign wire136 = wire134;
  always
    @(posedge clk) begin
      reg137 <= ($signed((wire119 ? reg132 : (&reg115))) << $signed(reg130));
    end
endmodule

module module76
#(parameter param85 = {(&(&(((8'hb1) > (8'hbb)) | ((8'hb6) ? (8'ha2) : (8'ha6))))), ((({(8'hb8), (8'ha1)} ? (+(8'ha0)) : ((8'hac) ? (8'hba) : (8'hac))) + ((~|(8'hbb)) ? ((8'hbf) ? (7'h44) : (8'ha8)) : (~&(7'h40)))) ? ({((8'hb4) - (8'hb7))} - (~|((8'hbb) ? (8'hb3) : (8'hb1)))) : ({((8'hb4) ? (8'had) : (8'ha1)), {(8'ha8)}} ? {((8'hb5) < (8'hb6))} : (&((8'hab) ? (8'hb4) : (8'hb9)))))})
(y, clk, wire80, wire79, wire78, wire77);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire80;
  input wire [(5'h14):(1'h0)] wire79;
  input wire [(3'h7):(1'h0)] wire78;
  input wire [(5'h14):(1'h0)] wire77;
  wire [(2'h2):(1'h0)] wire84;
  wire signed [(5'h15):(1'h0)] wire83;
  wire signed [(4'h8):(1'h0)] wire82;
  wire [(5'h14):(1'h0)] wire81;
  assign y = {wire84, wire83, wire82, wire81, (1'h0)};
  assign wire81 = (|($signed(((wire79 >= wire78) <<< (wire80 ?
                          wire80 : (8'hab)))) ?
                      $signed((~&$unsigned(wire77))) : wire78));
  assign wire82 = $unsigned(wire81[(3'h6):(3'h6)]);
  assign wire83 = wire78[(1'h0):(1'h0)];
  assign wire84 = (~&(~wire81));
endmodule

module module263  (y, clk, wire268, wire267, wire266, wire265, wire264);
  output wire [(32'h108):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire268;
  input wire [(4'hd):(1'h0)] wire267;
  input wire signed [(4'h9):(1'h0)] wire266;
  input wire signed [(5'h11):(1'h0)] wire265;
  input wire signed [(3'h4):(1'h0)] wire264;
  wire [(2'h2):(1'h0)] wire290;
  wire [(4'h9):(1'h0)] wire289;
  wire [(5'h13):(1'h0)] wire288;
  wire [(4'h8):(1'h0)] wire287;
  wire signed [(3'h7):(1'h0)] wire286;
  wire signed [(3'h5):(1'h0)] wire281;
  wire [(4'hd):(1'h0)] wire280;
  wire [(4'hf):(1'h0)] wire279;
  wire signed [(5'h13):(1'h0)] wire278;
  wire signed [(4'h8):(1'h0)] wire277;
  wire [(5'h15):(1'h0)] wire276;
  wire signed [(4'hb):(1'h0)] wire275;
  wire [(5'h15):(1'h0)] wire274;
  wire signed [(4'h8):(1'h0)] wire273;
  wire [(4'hf):(1'h0)] wire272;
  wire signed [(5'h13):(1'h0)] wire271;
  wire signed [(3'h7):(1'h0)] wire270;
  wire signed [(4'hf):(1'h0)] wire269;
  reg signed [(4'h9):(1'h0)] reg285 = (1'h0);
  reg signed [(4'he):(1'h0)] reg284 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg283 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg282 = (1'h0);
  assign y = {wire290,
                 wire289,
                 wire288,
                 wire287,
                 wire286,
                 wire281,
                 wire280,
                 wire279,
                 wire278,
                 wire277,
                 wire276,
                 wire275,
                 wire274,
                 wire273,
                 wire272,
                 wire271,
                 wire270,
                 wire269,
                 reg285,
                 reg284,
                 reg283,
                 reg282,
                 (1'h0)};
  assign wire269 = (~(^~{((wire265 << wire265) != $signed(wire265)),
                       wire264[(1'h0):(1'h0)]}));
  assign wire270 = wire266;
  assign wire271 = (wire267 ?
                       $unsigned({(~^{(8'hb6)}),
                           $signed((wire268 <<< wire269))}) : ((8'hb4) ?
                           $signed((8'h9f)) : $signed(((~wire267) ?
                               (wire267 ?
                                   wire267 : (7'h42)) : $signed(wire264)))));
  assign wire272 = wire268[(1'h0):(1'h0)];
  assign wire273 = wire269[(4'hb):(1'h1)];
  assign wire274 = wire270;
  assign wire275 = $signed(((~&wire266[(4'h9):(2'h2)]) ?
                       (-$unsigned($unsigned(wire272))) : $signed(($signed(wire268) - wire273))));
  assign wire276 = wire269;
  assign wire277 = $unsigned($unsigned(($unsigned((~|wire276)) || $unsigned({wire268}))));
  assign wire278 = (~^$unsigned(wire274[(5'h13):(4'hc)]));
  assign wire279 = {$signed(((~|$unsigned((8'hb8))) ? (8'ha1) : (8'ha1)))};
  assign wire280 = wire275[(3'h5):(2'h3)];
  assign wire281 = wire272;
  always
    @(posedge clk) begin
      if ({($signed($unsigned((wire279 ?
              (8'ha4) : wire280))) ~^ (&($signed(wire274) <= $unsigned(wire280))))})
        begin
          reg282 <= $signed($signed((^wire269)));
        end
      else
        begin
          reg282 <= $signed($signed($signed(wire269[(4'ha):(1'h1)])));
        end
      reg283 <= $unsigned(wire274[(1'h0):(1'h0)]);
      reg284 <= $unsigned({wire278[(4'h8):(3'h5)]});
      reg285 <= ((~$signed(($signed(wire265) ?
              {wire266, wire270} : {wire264}))) ?
          (8'hb8) : wire271[(5'h11):(3'h4)]);
    end
  assign wire286 = ($signed($unsigned(wire268)) ?
                       wire265[(1'h0):(1'h0)] : $signed(wire267[(4'h8):(4'h8)]));
  assign wire287 = (-(wire272[(3'h6):(2'h2)] ?
                       (&$unsigned(wire274[(4'he):(4'he)])) : $signed($signed(reg285))));
  assign wire288 = $signed(wire269[(4'hb):(4'ha)]);
  assign wire289 = {$signed(wire276),
                       ($signed(((8'ha3) ? wire273 : wire271)) <<< (-wire272))};
  assign wire290 = (~^{(($unsigned(wire280) < (reg283 ? wire277 : wire273)) ?
                           (|(reg282 ?
                               wire286 : wire288)) : ($signed(wire273) >> (+wire268))),
                       ((8'hb5) <= (wire276 ^~ (-wire271)))});
endmodule

module module226  (y, clk, wire231, wire230, wire229, wire228, wire227);
  output wire [(32'h16a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire231;
  input wire [(4'ha):(1'h0)] wire230;
  input wire signed [(5'h15):(1'h0)] wire229;
  input wire [(5'h12):(1'h0)] wire228;
  input wire [(4'hf):(1'h0)] wire227;
  wire signed [(4'hb):(1'h0)] wire260;
  wire signed [(3'h6):(1'h0)] wire259;
  wire [(5'h14):(1'h0)] wire258;
  wire signed [(4'hd):(1'h0)] wire257;
  wire signed [(4'h8):(1'h0)] wire256;
  wire [(4'hc):(1'h0)] wire255;
  wire [(3'h4):(1'h0)] wire254;
  wire signed [(5'h12):(1'h0)] wire253;
  wire [(4'ha):(1'h0)] wire252;
  wire [(4'ha):(1'h0)] wire251;
  wire signed [(3'h5):(1'h0)] wire250;
  wire signed [(3'h7):(1'h0)] wire249;
  wire signed [(4'hd):(1'h0)] wire248;
  wire signed [(5'h11):(1'h0)] wire247;
  wire [(2'h2):(1'h0)] wire246;
  wire [(5'h13):(1'h0)] wire245;
  wire signed [(4'he):(1'h0)] wire244;
  wire [(4'hb):(1'h0)] wire243;
  wire signed [(4'hd):(1'h0)] wire242;
  wire signed [(5'h15):(1'h0)] wire233;
  wire signed [(3'h5):(1'h0)] wire232;
  reg [(4'he):(1'h0)] reg241 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg240 = (1'h0);
  reg [(4'he):(1'h0)] reg239 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg238 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg237 = (1'h0);
  reg [(5'h10):(1'h0)] reg236 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg235 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg234 = (1'h0);
  assign y = {wire260,
                 wire259,
                 wire258,
                 wire257,
                 wire256,
                 wire255,
                 wire254,
                 wire253,
                 wire252,
                 wire251,
                 wire250,
                 wire249,
                 wire248,
                 wire247,
                 wire246,
                 wire245,
                 wire244,
                 wire243,
                 wire242,
                 wire233,
                 wire232,
                 reg241,
                 reg240,
                 reg239,
                 reg238,
                 reg237,
                 reg236,
                 reg235,
                 reg234,
                 (1'h0)};
  assign wire232 = $signed($signed({wire229,
                       ((~(8'hb8)) == (wire230 + wire229))}));
  assign wire233 = (8'hb8);
  always
    @(posedge clk) begin
      reg234 <= (^{(($signed(wire230) ?
              (wire232 << (8'hb2)) : wire232) | $signed({wire233, wire227})),
          (^((!(8'hbf)) || $signed(wire227)))});
    end
  always
    @(posedge clk) begin
      if ((^wire230[(4'ha):(4'h9)]))
        begin
          reg235 <= (($unsigned($unsigned({wire233})) != {((wire232 | wire227) ?
                  wire228 : $signed(wire227))}) ^ (($signed(wire227[(3'h4):(3'h4)]) == wire230[(2'h2):(1'h1)]) ?
              {($signed(wire230) >= ((8'hb3) ?
                      wire233 : (8'hb2)))} : ((wire233[(2'h2):(1'h1)] * (~wire231)) ^~ wire232[(1'h0):(1'h0)])));
          reg236 <= $unsigned({($signed($unsigned(wire228)) ?
                  $unsigned((reg234 ? wire229 : wire232)) : ({wire229} ?
                      (~^wire227) : $unsigned((8'hb6))))});
          reg237 <= reg236[(4'hd):(4'ha)];
          reg238 <= (($unsigned({(wire233 > wire230)}) || reg234[(4'hf):(4'h8)]) ?
              $unsigned((+({wire231, reg234} ?
                  wire229 : (wire228 ?
                      wire227 : wire230)))) : (^~$signed($signed(wire228[(1'h1):(1'h0)]))));
        end
      else
        begin
          reg235 <= reg236[(4'ha):(2'h3)];
          if ((reg234 != wire230[(4'ha):(4'ha)]))
            begin
              reg236 <= wire227;
              reg237 <= {{((^reg236) ?
                          ((8'hbc) ?
                              $unsigned(reg238) : $signed(reg238)) : wire229)},
                  (wire230[(3'h6):(2'h3)] ? wire231 : (|{$unsigned((8'hab))}))};
              reg238 <= {{{reg238}, wire227}};
            end
          else
            begin
              reg236 <= ((reg234[(1'h1):(1'h0)] ?
                  $unsigned(({wire231,
                      reg235} == wire227[(3'h5):(1'h1)])) : ((+{reg237}) ?
                      ($signed(wire230) | wire230[(3'h4):(3'h4)]) : reg236[(2'h2):(1'h0)])) == wire228[(5'h11):(4'hb)]);
              reg237 <= $unsigned(((7'h43) ?
                  wire232[(2'h2):(1'h0)] : $signed($unsigned((reg234 ?
                      wire233 : wire233)))));
              reg238 <= reg234;
              reg239 <= reg235[(1'h0):(1'h0)];
            end
        end
      reg240 <= $signed((8'h9d));
      reg241 <= ($unsigned((~$unsigned((wire227 ^~ (8'hb2))))) ?
          (^~(~^wire232[(1'h1):(1'h0)])) : wire229);
    end
  assign wire242 = ((((^~wire227) < ((wire230 || reg236) >= (wire233 ~^ reg236))) ~^ (~|(8'hbf))) > $signed(wire228[(4'he):(1'h1)]));
  assign wire243 = $signed((|(reg236[(3'h6):(1'h0)] >>> ($unsigned(wire229) ^~ $signed(reg237)))));
  assign wire244 = $signed((8'ha3));
  assign wire245 = ((^~$unsigned(((8'hbe) <= {wire231}))) ?
                       (8'haa) : $signed(($unsigned($unsigned(wire244)) ?
                           (&wire231[(4'hb):(4'h9)]) : (&(~^wire243)))));
  assign wire246 = (|($signed(wire233[(1'h1):(1'h1)]) >>> reg234));
  assign wire247 = ((reg235[(5'h10):(4'h9)] ?
                       ((+wire231[(4'hf):(3'h5)]) & reg238[(2'h3):(2'h3)]) : reg236[(2'h2):(2'h2)]) + $unsigned((reg241[(2'h2):(1'h1)] ^~ (((8'ha5) & wire244) ?
                       $unsigned(wire233) : ((7'h41) + (8'hbc))))));
  assign wire248 = reg240;
  assign wire249 = (((!(-wire227[(4'hf):(4'ha)])) ?
                           (($signed(reg239) ? {reg237} : $unsigned(reg234)) ?
                               ((wire231 ?
                                   wire230 : wire231) | (reg236 != wire245)) : wire246) : ((((7'h41) ?
                                   wire247 : reg240) <<< (reg234 || wire227)) ?
                               $signed((wire248 ?
                                   wire228 : reg239)) : (^(~&(8'hb3))))) ?
                       $signed(reg237) : wire246[(1'h0):(1'h0)]);
  assign wire250 = (((^~$signed({wire245, reg241})) ?
                           (reg238 ?
                               ((wire242 ?
                                   (8'hac) : wire232) <<< {reg234}) : (!reg239[(4'hb):(2'h3)])) : ((((8'hb0) <<< reg241) & {wire243}) & (~|{reg239,
                               wire231}))) ?
                       wire246 : ($signed(((!reg240) ?
                           (|wire228) : wire232[(3'h4):(2'h2)])) != (~&$signed((~^wire229)))));
  assign wire251 = $signed((8'hb1));
  assign wire252 = $unsigned($unsigned((!(~|(^~wire251)))));
  assign wire253 = $unsigned(({(wire251 + (wire227 ? reg239 : wire233)),
                       $signed(((8'hba) ^ (8'ha8)))} && $unsigned($unsigned((reg241 ?
                       (8'ha2) : wire242)))));
  assign wire254 = ((reg238 ? reg236[(4'hd):(3'h6)] : wire242) ?
                       {(~|{(wire251 && reg238)})} : wire228[(1'h0):(1'h0)]);
  assign wire255 = wire246;
  assign wire256 = wire233[(4'hc):(4'hb)];
  assign wire257 = (^~reg235);
  assign wire258 = wire227[(1'h1):(1'h0)];
  assign wire259 = (~|reg236[(3'h5):(3'h5)]);
  assign wire260 = $signed((wire255 ?
                       ((!(~^reg235)) | $unsigned({(8'hb4)})) : $unsigned(((wire252 ?
                           wire232 : wire248) ^ $unsigned(reg235)))));
endmodule

module module187
#(parameter param217 = ({((~((8'hb5) && (8'h9d))) * ((~^(7'h44)) + {(8'h9f), (8'hbe)})), ({{(8'hb9), (8'ha1)}} && ({(7'h43), (8'hba)} ? ((8'hba) ? (7'h44) : (8'hb5)) : ((8'hac) ? (8'h9c) : (7'h44))))} != (~((((8'hb6) ? (7'h44) : (8'ha6)) ? (~&(8'ha2)) : ((8'hb9) * (7'h40))) ? (^(~(7'h41))) : {((8'ha3) ~^ (8'hb2))}))))
(y, clk, wire191, wire190, wire189, wire188);
  output wire [(32'h15c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire191;
  input wire [(4'h8):(1'h0)] wire190;
  input wire signed [(3'h4):(1'h0)] wire189;
  input wire [(4'ha):(1'h0)] wire188;
  wire signed [(5'h15):(1'h0)] wire216;
  wire signed [(5'h14):(1'h0)] wire215;
  wire signed [(3'h5):(1'h0)] wire197;
  wire signed [(4'hc):(1'h0)] wire196;
  reg signed [(5'h12):(1'h0)] reg214 = (1'h0);
  reg [(5'h14):(1'h0)] reg213 = (1'h0);
  reg [(5'h13):(1'h0)] reg212 = (1'h0);
  reg [(2'h2):(1'h0)] reg211 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg210 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg209 = (1'h0);
  reg [(3'h7):(1'h0)] reg208 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg207 = (1'h0);
  reg [(4'hf):(1'h0)] reg206 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg205 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg204 = (1'h0);
  reg [(4'hd):(1'h0)] reg203 = (1'h0);
  reg [(3'h6):(1'h0)] reg202 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg201 = (1'h0);
  reg [(5'h11):(1'h0)] reg200 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg199 = (1'h0);
  reg [(5'h13):(1'h0)] reg198 = (1'h0);
  reg [(4'h9):(1'h0)] reg195 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg194 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg193 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg192 = (1'h0);
  assign y = {wire216,
                 wire215,
                 wire197,
                 wire196,
                 reg214,
                 reg213,
                 reg212,
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
                 reg199,
                 reg198,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg192 <= {($signed(($unsigned(wire190) ?
                  wire188[(4'h8):(3'h4)] : (wire190 ? wire188 : (7'h44)))) ?
              $signed($signed((wire190 ?
                  wire189 : wire191))) : (($signed((8'h9c)) ?
                      (wire191 ? wire188 : (8'hb0)) : wire188) ?
                  $unsigned((wire189 ?
                      wire190 : wire191)) : $unsigned((-wire191)))),
          (((~(8'ha7)) ? wire188[(2'h3):(2'h3)] : wire191[(3'h4):(2'h3)]) ?
              wire188[(4'h8):(1'h1)] : wire191)};
      reg193 <= $unsigned(wire191[(1'h1):(1'h1)]);
      reg194 <= (8'ha5);
      reg195 <= reg194;
    end
  assign wire196 = wire188;
  assign wire197 = $unsigned(wire190);
  always
    @(posedge clk) begin
      reg198 <= wire191;
      if (($signed((~&{(-reg193),
          (wire189 ? wire197 : wire197)})) == wire189[(2'h3):(1'h1)]))
        begin
          reg199 <= ((wire191 >> ((^~(-reg198)) ?
              (reg194 ? $signed(wire197) : (|wire190)) : ((&(8'ha8)) ?
                  $unsigned(wire196) : reg193))) ^ wire190);
          reg200 <= wire197[(2'h2):(2'h2)];
          reg201 <= wire196[(4'hc):(4'h9)];
        end
      else
        begin
          reg199 <= reg193[(1'h0):(1'h0)];
          reg200 <= (8'hb3);
          reg201 <= $unsigned($unsigned(($signed(wire196) ?
              $signed($unsigned(wire196)) : (~&$unsigned(reg194)))));
          if ((~((wire190 ?
              wire190[(2'h2):(2'h2)] : (~$signed(reg201))) <<< (~|(^$unsigned((8'ha3)))))))
            begin
              reg202 <= $unsigned(((&($signed(reg193) ^ wire190[(3'h7):(1'h1)])) ?
                  (reg192 <= reg192) : ((reg195[(3'h4):(2'h3)] ?
                          $signed(reg199) : wire197[(1'h1):(1'h0)]) ?
                      ((wire188 > reg193) ?
                          $unsigned(wire197) : (~|(8'hb0))) : wire196)));
              reg203 <= $signed(reg202[(1'h1):(1'h1)]);
              reg204 <= wire190[(3'h6):(3'h4)];
            end
          else
            begin
              reg202 <= $unsigned({reg200[(4'h8):(2'h3)]});
              reg203 <= (wire197[(2'h3):(2'h3)] | ($signed(((-reg194) + (wire189 ?
                      (8'hae) : reg199))) ?
                  (^((^~reg202) & (reg201 ?
                      wire188 : reg201))) : ($unsigned($unsigned(wire197)) ?
                      reg204[(4'hf):(2'h2)] : $unsigned($unsigned(reg201)))));
              reg204 <= ((reg198[(4'h8):(1'h1)] & $signed($unsigned((reg200 ?
                  wire196 : (7'h44))))) && $signed($signed(($signed(wire188) * reg202[(3'h4):(1'h1)]))));
              reg205 <= {(7'h44), reg200[(4'hf):(1'h0)]};
            end
          reg206 <= wire191[(3'h7):(3'h7)];
        end
      reg207 <= $signed($unsigned(reg198));
      if ($unsigned(wire197))
        begin
          if ({(&(~$signed($unsigned(reg201))))})
            begin
              reg208 <= ($signed($signed({(^reg195), wire190})) ?
                  ($unsigned(wire197) ?
                      (8'hb0) : $unsigned(((wire196 > wire196) | $unsigned(wire197)))) : $signed(reg198[(4'ha):(1'h0)]));
              reg209 <= (($signed((wire196[(3'h4):(1'h1)] ?
                      $signed((8'ha1)) : $unsigned(reg205))) != $unsigned({(~|(8'ha4))})) ?
                  (reg201[(1'h0):(1'h0)] ?
                      {(8'ha8)} : $unsigned(($signed(reg203) <= (reg207 ?
                          (8'hb4) : wire191)))) : $unsigned($unsigned(({reg201,
                          wire189} ?
                      (reg207 <= reg202) : (-wire189)))));
              reg210 <= ((&reg194[(3'h5):(1'h1)]) & (-((7'h42) - (&$signed(reg205)))));
            end
          else
            begin
              reg208 <= {reg202,
                  (~^(((|reg199) <<< (!reg193)) == (&{(8'h9f), wire189})))};
            end
          reg211 <= wire191[(2'h3):(1'h1)];
          reg212 <= (reg208 != $unsigned({((reg201 ?
                  reg195 : reg193) != (reg210 <<< reg203))}));
        end
      else
        begin
          if ((+((reg200 >> reg201[(2'h2):(1'h1)]) != ((8'h9c) ?
              reg198[(1'h0):(1'h0)] : reg198[(4'ha):(4'h8)]))))
            begin
              reg208 <= wire196;
              reg209 <= (($signed(reg205) ?
                  (&reg202) : (|($signed((8'ha3)) ~^ $signed((8'hb6))))) | reg209);
              reg210 <= wire197;
              reg211 <= $signed($unsigned(reg207[(3'h7):(2'h2)]));
            end
          else
            begin
              reg208 <= {((8'hba) ?
                      (|((|reg201) < wire197)) : (~^((wire196 <= wire196) ?
                          reg194[(4'h8):(2'h3)] : ((8'hb0) ?
                              reg208 : reg203)))),
                  reg212[(5'h11):(3'h6)]};
              reg209 <= $unsigned((((&(reg195 ? wire190 : reg199)) ?
                  (reg202[(3'h4):(1'h0)] ?
                      (reg212 ?
                          (8'hb7) : wire196) : (wire190 && reg198)) : $unsigned(reg208[(1'h0):(1'h0)])) > $signed((wire197 ^ (reg207 <= reg203)))));
              reg210 <= (($signed((((8'hb2) != wire190) || (reg207 < reg210))) << $unsigned(reg212[(5'h13):(4'hf)])) - ((^~(8'ha4)) ?
                  (+{(reg207 || reg210),
                      (reg204 ? wire196 : (8'hba))}) : reg206[(3'h7):(3'h7)]));
              reg211 <= (($unsigned(((8'hb8) & (+wire196))) ?
                  $signed((wire196 >= reg201)) : reg199[(4'hd):(3'h5)]) <= (~^(&reg201)));
              reg212 <= $signed($signed((reg212[(1'h0):(1'h0)] ?
                  (reg194[(4'hb):(3'h5)] || (8'ha1)) : $signed(wire197[(1'h0):(1'h0)]))));
            end
          reg213 <= reg206;
        end
    end
  always
    @(posedge clk) begin
      reg214 <= $signed(reg195[(4'h8):(4'h8)]);
    end
  assign wire215 = {reg195};
  assign wire216 = (|{$unsigned(($unsigned(wire196) + $signed(wire196)))});
endmodule
