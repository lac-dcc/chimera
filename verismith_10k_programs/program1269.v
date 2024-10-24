module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h252):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire58;
  wire [(5'h14):(1'h0)] wire43;
  wire signed [(5'h12):(1'h0)] wire42;
  wire [(4'hf):(1'h0)] wire31;
  wire [(2'h3):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire19;
  wire [(4'ha):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire17;
  wire [(4'hb):(1'h0)] wire16;
  wire [(3'h6):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire4;
  reg [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg56 = (1'h0);
  reg [(4'h9):(1'h0)] reg55 = (1'h0);
  reg [(3'h5):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg [(3'h7):(1'h0)] reg52 = (1'h0);
  reg [(5'h12):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(2'h3):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg41 = (1'h0);
  reg [(4'hf):(1'h0)] reg40 = (1'h0);
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg35 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg33 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(4'hd):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg [(3'h6):(1'h0)] reg7 = (1'h0);
  assign y = {wire58,
                 wire43,
                 wire42,
                 wire31,
                 wire30,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire6,
                 wire5,
                 wire4,
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
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
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
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = (~&wire2[(4'h8):(3'h7)]);
  assign wire5 = wire1;
  assign wire6 = (wire2[(3'h7):(3'h6)] ?
                     wire4[(3'h4):(3'h4)] : (~^(wire1[(2'h2):(1'h1)] + (~&wire2[(4'ha):(1'h1)]))));
  always
    @(posedge clk) begin
      reg7 <= (~|$signed($unsigned(wire0)));
      reg8 <= (wire5 ^~ (~&($unsigned(wire6[(5'h14):(2'h2)]) ^ ((wire4 ?
              wire6 : wire0) ?
          (&wire1) : wire5))));
      if (($unsigned(($unsigned((~(7'h40))) ? {(8'haa)} : $signed(reg8))) ?
          reg7 : (^~$signed($signed((-reg8))))))
        begin
          reg9 <= ((|{(wire0 ? $unsigned(wire5) : $unsigned(wire0)),
                  $signed((wire6 << wire3))}) ?
              (|$unsigned((wire6 - (reg7 ?
                  wire1 : wire1)))) : ((!($signed(wire2) <= (&(8'haa)))) >>> wire6[(2'h2):(2'h2)]));
        end
      else
        begin
          reg9 <= (7'h40);
          if ({$signed($signed($unsigned(((8'ha6) ? wire4 : wire4)))),
              $unsigned((|reg9))})
            begin
              reg10 <= $signed($signed((({reg7} ? $signed(wire1) : (-wire3)) ?
                  $unsigned((wire3 ? wire5 : wire2)) : wire1)));
              reg11 <= {(&wire0)};
              reg12 <= (8'ha7);
              reg13 <= wire3[(3'h7):(1'h0)];
            end
          else
            begin
              reg10 <= wire6;
              reg11 <= {(($unsigned({reg9}) * ((+reg12) & $signed(wire5))) <<< reg7),
                  ((^~$unsigned((7'h43))) <<< (($unsigned(wire2) >= wire1[(3'h7):(2'h2)]) ?
                      (8'hb9) : $unsigned({(8'ha8)})))};
            end
        end
      reg14 <= ((|(~|$signed((wire6 <<< reg11)))) ?
          $unsigned($signed($unsigned($unsigned(reg8)))) : $signed(wire6));
    end
  assign wire15 = $unsigned((~&($unsigned(reg12[(4'hc):(4'hc)]) ^ (~|$signed(wire0)))));
  assign wire16 = (-(reg11[(1'h1):(1'h1)] ^ $signed((-reg11[(2'h3):(2'h3)]))));
  assign wire17 = (~|wire5);
  assign wire18 = wire17;
  assign wire19 = {$unsigned((wire3[(4'hc):(4'ha)] ^ (-wire18[(3'h7):(1'h1)])))};
  always
    @(posedge clk) begin
      reg20 <= (wire4[(4'hb):(3'h7)] ? reg9 : ((8'ha5) - reg12[(1'h0):(1'h0)]));
      if ((|wire2[(3'h4):(1'h0)]))
        begin
          if (((8'haa) ? ((-$unsigned(wire15)) >= wire4) : wire4))
            begin
              reg21 <= (reg12[(3'h6):(2'h2)] & $signed($signed((~&reg13))));
              reg22 <= wire6[(4'ha):(1'h1)];
              reg23 <= wire19[(4'hb):(4'ha)];
              reg24 <= {((~^reg8[(3'h4):(1'h0)]) ?
                      ((~|reg20) ?
                          $signed((reg21 ^ reg8)) : (|$signed(reg21))) : (wire15 ?
                          $signed($unsigned(reg14)) : (8'ha5)))};
              reg25 <= (($signed(reg21) ?
                  reg23[(1'h0):(1'h0)] : wire0) == (^(8'hb4)));
            end
          else
            begin
              reg21 <= $unsigned(reg21);
              reg22 <= $signed($unsigned($signed(($unsigned(wire1) ?
                  $unsigned(wire19) : wire0[(4'ha):(3'h6)]))));
              reg23 <= (~&reg14[(4'hf):(2'h2)]);
              reg24 <= (8'had);
            end
          reg26 <= (($unsigned((wire3[(3'h6):(1'h0)] << reg14[(2'h3):(1'h0)])) ?
                  (((wire4 ^~ reg12) ?
                      reg21[(3'h5):(3'h5)] : wire15) <<< (&reg21[(3'h4):(2'h2)])) : wire4) ?
              $unsigned(wire16[(2'h2):(1'h1)]) : $unsigned(reg23));
          reg27 <= {$unsigned(reg13), reg26};
          reg28 <= $unsigned((reg26[(1'h0):(1'h0)] ?
              (&{(^~reg8),
                  reg10[(4'h9):(3'h7)]}) : $signed((~|(wire5 != wire15)))));
          reg29 <= wire2[(4'h9):(1'h0)];
        end
      else
        begin
          reg21 <= (((^$signed(reg29[(2'h2):(2'h2)])) ~^ ($unsigned($signed(reg27)) - ({reg22,
                      reg10} ?
                  (reg28 && (8'ha3)) : (wire1 + (8'hb3))))) ?
              wire4 : wire19);
          reg22 <= $signed((|((~^$signed(reg22)) ? wire4 : wire4)));
        end
    end
  assign wire30 = $signed((wire5[(1'h0):(1'h0)] ?
                      reg14 : (($unsigned(reg27) ?
                          reg23 : $unsigned(reg23)) >= $signed((~&reg13)))));
  assign wire31 = (^~reg8[(3'h4):(2'h3)]);
  always
    @(posedge clk) begin
      if (reg12)
        begin
          reg32 <= ($signed($unsigned(wire16[(3'h6):(3'h5)])) ^~ wire2);
          if (({$unsigned($signed($signed(reg32)))} ?
              {((wire31[(1'h0):(1'h0)] ?
                      $unsigned(reg20) : wire17[(3'h4):(3'h4)]) + reg13[(1'h0):(1'h0)]),
                  (reg11[(4'h9):(3'h5)] ?
                      ({(8'hb9)} != $signed(reg24)) : (!$signed(reg28)))} : reg25))
            begin
              reg33 <= {$unsigned($unsigned((reg22 ?
                      wire30 : $unsigned(reg11)))),
                  $unsigned($signed((&reg11)))};
              reg34 <= reg20;
              reg35 <= (((|$signed(((8'hb6) >> reg20))) ^ (wire30 ?
                      $unsigned(reg26) : $signed($signed(wire6)))) ?
                  (~|reg20[(1'h1):(1'h0)]) : (wire19[(4'hb):(4'hb)] ?
                      (|(!$unsigned(wire19))) : $unsigned(reg8)));
            end
          else
            begin
              reg33 <= wire17[(2'h2):(2'h2)];
              reg34 <= (~^wire17);
            end
          reg36 <= wire6[(2'h3):(1'h1)];
          reg37 <= wire17;
          if (((wire0[(1'h0):(1'h0)] | reg27) ?
              $signed({(~|(!reg12))}) : $unsigned($unsigned({(reg37 ?
                      reg27 : (8'ha7))}))))
            begin
              reg38 <= (~wire19[(4'hc):(4'h9)]);
              reg39 <= $unsigned((~(($unsigned(reg9) ?
                      ((8'hbf) != reg25) : $unsigned(reg25)) ?
                  ((reg14 ? reg14 : wire3) ?
                      wire4 : (&reg9)) : (-reg10[(1'h1):(1'h0)]))));
              reg40 <= (reg7 ?
                  ((+$unsigned((wire5 | reg34))) ?
                      $signed(reg9[(1'h1):(1'h1)]) : reg38) : wire5[(1'h0):(1'h0)]);
            end
          else
            begin
              reg38 <= $unsigned($signed((8'ha5)));
              reg39 <= $signed(reg23[(1'h0):(1'h0)]);
              reg40 <= ($unsigned($signed(reg24)) ?
                  (^((~^$signed(reg21)) || reg8)) : wire30);
            end
        end
      else
        begin
          reg32 <= reg8[(3'h5):(1'h0)];
          reg33 <= ((wire19 ?
              (((reg23 == wire5) ?
                  $signed(reg20) : $unsigned(wire19)) == $unsigned(reg40[(2'h3):(2'h3)])) : $signed(reg35)) >>> {reg23[(1'h1):(1'h1)]});
          reg34 <= ((&$unsigned(($signed(reg20) ?
              ((7'h44) ^~ reg9) : (~&reg27)))) < ($unsigned($signed($unsigned((8'ha2)))) && $signed(((&reg11) ?
              (-(8'hac)) : wire17))));
          if (((({$signed(reg12), reg14} ?
                  $unsigned({reg27,
                      reg35}) : reg24[(1'h1):(1'h0)]) < (($signed((7'h42)) ?
                  {reg12} : reg24[(4'h9):(1'h1)]) ~^ ((|(8'ha7)) ^~ $unsigned(wire16)))) ?
              (^~$unsigned($signed($signed(wire4)))) : (+((8'ha1) ?
                  $signed({reg7, wire2}) : $unsigned((reg35 ? reg9 : reg12))))))
            begin
              reg35 <= reg32[(1'h0):(1'h0)];
              reg36 <= $unsigned(({reg9} ?
                  {$unsigned(reg11[(3'h4):(3'h4)]),
                      {(wire16 < reg34)}} : ($unsigned($signed(wire0)) ?
                      (~^(wire17 || (8'hb3))) : ($signed(reg40) | (reg26 ?
                          reg21 : reg33)))));
            end
          else
            begin
              reg35 <= {(~^(reg7 ?
                      $signed(((8'hae) >= wire6)) : reg27[(3'h5):(1'h0)])),
                  {$unsigned((^~$signed(reg21))),
                      {((|reg27) ? reg23 : $unsigned(reg29)),
                          $unsigned((!reg14))}}};
              reg36 <= reg9;
              reg37 <= (wire3 ^~ $signed(reg40[(3'h6):(3'h5)]));
              reg38 <= (($unsigned($unsigned($unsigned(reg34))) ?
                  $signed(wire4) : {$signed(wire18[(2'h2):(1'h0)])}) && (reg32 ?
                  {$unsigned((reg20 ? reg26 : reg8)),
                      (wire30 * $signed(reg20))} : $signed({$signed(wire16)})));
              reg39 <= (($unsigned($unsigned((^wire19))) ?
                  $signed(reg35[(3'h4):(3'h4)]) : (+(reg39 ^ (reg29 ?
                      reg12 : reg29)))) & $unsigned((reg33 ?
                  wire0[(2'h3):(1'h1)] : ($unsigned(wire5) ?
                      reg36[(4'h9):(4'h9)] : wire17[(3'h4):(2'h3)]))));
            end
          reg40 <= $signed(($unsigned(($signed(wire4) ?
              wire2 : (reg33 >> wire30))) >> ($signed((wire6 ?
              reg7 : reg21)) * (wire15[(3'h4):(1'h0)] | $signed(reg10)))));
        end
      reg41 <= (({$unsigned($unsigned((8'haa)))} ?
          ((+$signed(reg36)) ? reg13 : $signed($unsigned((8'hb0)))) : (reg35 ?
              ($signed((8'hb7)) + reg13[(3'h5):(2'h2)]) : reg14)) > wire4);
    end
  assign wire42 = (8'ha2);
  assign wire43 = $signed(reg38);
  always
    @(posedge clk) begin
      reg44 <= $unsigned($unsigned((((wire17 ~^ wire15) ?
              $unsigned(reg35) : {reg23}) ?
          (wire19[(4'hd):(4'hc)] ^ {(8'hba), wire17}) : (wire30[(2'h2):(1'h1)] ?
              (reg39 << reg25) : (8'ha2)))));
      if ($unsigned($unsigned({wire17[(2'h3):(1'h1)], ({(8'hb8)} & (8'ha3))})))
        begin
          reg45 <= (+$unsigned(($unsigned(reg24[(4'h8):(3'h4)]) >= ($signed(wire19) ?
              ((8'hbd) ? (7'h42) : reg35) : wire19))));
          reg46 <= (reg29[(1'h1):(1'h1)] > wire30[(2'h3):(1'h1)]);
          reg47 <= {$unsigned(((reg39[(2'h2):(2'h2)] ?
                      reg24[(1'h0):(1'h0)] : $signed(reg21)) ?
                  $unsigned((^reg29)) : (~^(wire3 != reg35)))),
              (~|reg33)};
          if ((+wire43[(3'h7):(3'h5)]))
            begin
              reg48 <= reg10;
              reg49 <= reg14;
              reg50 <= reg13;
            end
          else
            begin
              reg48 <= reg24;
              reg49 <= ($unsigned(({(wire3 >= (8'hb8)), reg36[(3'h4):(2'h3)]} ?
                  (wire43[(5'h13):(5'h10)] ?
                      (reg9 != reg37) : (reg26 && reg11)) : (~|(wire3 || reg46)))) != $signed((!reg25)));
              reg50 <= reg26;
              reg51 <= wire3[(4'hc):(4'hc)];
              reg52 <= $unsigned(wire31[(3'h6):(3'h5)]);
            end
          if (reg11[(3'h6):(3'h5)])
            begin
              reg53 <= $unsigned(wire18[(4'ha):(3'h5)]);
              reg54 <= reg37;
            end
          else
            begin
              reg53 <= reg28;
              reg54 <= ($unsigned($signed($signed(wire4))) >= ((($signed(reg9) >= $unsigned((8'h9d))) + {(~&reg27),
                      wire42}) ?
                  $signed(reg23[(2'h2):(1'h1)]) : ((reg44[(4'hd):(1'h1)] >>> wire1) != reg33)));
              reg55 <= $unsigned(($signed(reg49[(3'h5):(1'h0)]) | $unsigned((wire6[(4'hd):(4'h8)] <<< (reg22 - reg47)))));
              reg56 <= wire43[(3'h6):(1'h0)];
            end
        end
      else
        begin
          reg45 <= reg55[(2'h3):(1'h1)];
          if ({reg38[(4'h9):(1'h1)]})
            begin
              reg46 <= {((($signed(reg44) || (wire31 << (8'hb8))) && (8'ha5)) << wire18),
                  $signed($unsigned($signed($signed(reg23))))};
              reg47 <= reg24;
              reg48 <= wire30[(1'h1):(1'h0)];
              reg49 <= $unsigned(reg10);
            end
          else
            begin
              reg46 <= (reg54 ?
                  wire30[(1'h0):(1'h0)] : {{($signed(wire0) ?
                              wire17[(1'h1):(1'h0)] : (reg51 | reg48)),
                          $unsigned($signed(wire3))},
                      reg34[(3'h5):(1'h0)]});
              reg47 <= ($signed((($signed(wire19) > wire3[(4'hc):(4'h8)]) ?
                      ($unsigned(reg51) ^~ $unsigned(reg49)) : (reg26[(1'h0):(1'h0)] + (reg24 >>> reg52)))) ?
                  ($signed(((wire30 & wire3) & reg54)) <<< {$unsigned(reg51[(1'h1):(1'h1)])}) : $unsigned($unsigned($signed((wire15 ?
                      wire18 : reg20)))));
              reg48 <= ($unsigned($unsigned((reg35[(3'h6):(3'h4)] ?
                      {wire17} : $signed(wire16)))) ?
                  reg8[(3'h4):(2'h2)] : reg34[(2'h2):(2'h2)]);
              reg49 <= $signed(reg48);
              reg50 <= ($unsigned($unsigned({(!wire4)})) ?
                  (~&$signed(reg23)) : reg12);
            end
          reg51 <= reg48;
          reg52 <= reg39;
        end
      reg57 <= (^~(~reg24));
    end
  assign wire58 = ((|reg36) ^~ wire2[(4'hb):(1'h0)]);
endmodule
