module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h208):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire24;
  wire [(4'hc):(1'h0)] wire23;
  wire [(4'h8):(1'h0)] wire22;
  wire [(4'h8):(1'h0)] wire21;
  wire signed [(5'h12):(1'h0)] wire20;
  wire [(5'h15):(1'h0)] wire19;
  wire signed [(4'hc):(1'h0)] wire18;
  wire [(4'hd):(1'h0)] wire5;
  reg signed [(4'he):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(5'h15):(1'h0)] reg42 = (1'h0);
  reg [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(4'hf):(1'h0)] reg40 = (1'h0);
  reg [(4'hd):(1'h0)] reg39 = (1'h0);
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  reg [(5'h13):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(3'h4):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire5,
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
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = wire0[(4'ha):(3'h7)];
  always
    @(posedge clk) begin
      reg6 <= wire5;
      if ($signed($unsigned(reg6[(4'h8):(1'h1)])))
        begin
          reg7 <= ($unsigned(wire2) >>> {$signed({wire2[(3'h4):(1'h0)]})});
          reg8 <= $unsigned($signed($signed($signed((reg6 & wire3)))));
          reg9 <= $unsigned((((&{wire5, reg6}) ?
              $unsigned((reg8 != (8'h9f))) : ($signed(reg7) & reg7[(2'h2):(2'h2)])) * wire4[(3'h5):(3'h4)]));
          reg10 <= (!wire3[(4'h9):(1'h0)]);
          if ({{(|$unsigned((reg7 && (8'hb6)))), wire2[(3'h6):(3'h5)]},
              ($signed((wire0[(3'h5):(1'h1)] != $unsigned(reg10))) ^ ($signed((-(8'hbf))) == $signed((wire4 > wire3))))})
            begin
              reg11 <= ((reg8 ?
                      reg9[(3'h6):(3'h5)] : ((+$unsigned(reg8)) <= ($signed(wire4) >>> $signed(wire2)))) ?
                  {(wire4 + $signed((~^wire1)))} : $signed($signed({$signed(wire0)})));
              reg12 <= $signed((!wire3[(2'h2):(1'h0)]));
              reg13 <= wire0;
              reg14 <= (reg8 ^ (((wire0 ~^ (wire3 ^ wire2)) + wire4) && $unsigned(wire0)));
              reg15 <= (^~$unsigned($signed($unsigned(reg10))));
            end
          else
            begin
              reg11 <= (-$unsigned((~|$signed((+wire0)))));
              reg12 <= $unsigned($signed(((^$unsigned(reg10)) ?
                  ((reg9 ? reg8 : reg6) ?
                      reg6[(4'ha):(3'h6)] : (^~reg13)) : (reg10 ?
                      {wire1, wire0} : (reg14 && reg7)))));
              reg13 <= ($signed(({reg8,
                  (~|(8'hb3))} || $unsigned($unsigned(reg7)))) || $unsigned(((((8'hbe) >= reg13) >> $signed(reg6)) ?
                  {(+reg9), $unsigned(reg11)} : (8'h9c))));
            end
        end
      else
        begin
          reg7 <= $signed(reg15[(4'h8):(2'h3)]);
          reg8 <= reg9;
          reg9 <= wire1;
        end
      reg16 <= $signed(((((wire3 ? (8'h9d) : reg13) ? {reg11} : {reg12}) ?
              reg13 : ($signed(wire1) ?
                  $signed((7'h43)) : (reg15 ? reg13 : (8'ha8)))) ?
          ($unsigned((wire4 ? (7'h43) : reg7)) - reg15) : reg14));
      reg17 <= {$signed({$signed($signed((8'ha7))), (~&$unsigned(reg16))}),
          reg8};
    end
  assign wire18 = ({$signed(((reg9 ? wire3 : wire3) | ((8'hb4) ?
                              wire5 : reg12))),
                          $signed($unsigned($unsigned((8'ha4))))} ?
                      ($signed(((reg14 >>> reg13) == reg6[(3'h6):(3'h6)])) || (|((wire1 ?
                              wire3 : reg11) ?
                          (reg14 >> reg8) : (^~wire0)))) : wire0[(2'h2):(2'h2)]);
  assign wire19 = wire1[(3'h5):(1'h1)];
  assign wire20 = $unsigned(reg7[(1'h0):(1'h0)]);
  assign wire21 = (reg9[(3'h6):(3'h5)] ?
                      (8'ha7) : $unsigned($signed($signed((~&reg13)))));
  assign wire22 = {wire21[(3'h4):(2'h2)]};
  assign wire23 = $unsigned((~$unsigned(({wire21, wire19} ?
                      (wire4 ^~ reg16) : (reg15 ? reg16 : (8'hb2))))));
  assign wire24 = reg13[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg25 <= (-reg9);
      if ({($unsigned(reg25[(2'h2):(1'h1)]) ?
              {wire24,
                  {{wire20, (8'hbd)},
                      (wire3 <= wire21)}} : $signed((~|$signed(wire3))))})
        begin
          if (reg9)
            begin
              reg26 <= $signed($signed(reg13));
              reg27 <= wire18;
              reg28 <= (({(-reg9)} | (reg13 ^ $unsigned((wire4 ?
                      reg12 : reg8)))) ?
                  $signed($unsigned($signed($signed(reg25)))) : $signed((reg10[(1'h1):(1'h0)] ?
                      ({reg10} ?
                          reg12 : (reg10 ?
                              reg17 : (8'hb9))) : reg10[(3'h6):(3'h6)])));
            end
          else
            begin
              reg26 <= reg17[(4'h8):(2'h2)];
              reg27 <= (wire21[(3'h5):(2'h2)] << $unsigned(wire1[(2'h2):(2'h2)]));
            end
          if ({(~|reg13[(2'h2):(1'h1)])})
            begin
              reg29 <= ($unsigned({(reg6 ?
                          {wire2, reg12} : reg15[(1'h0):(1'h0)]),
                      ((&wire18) ? (reg12 ? (8'h9d) : reg26) : wire3)}) ?
                  $unsigned((~^($unsigned(wire2) ?
                      $unsigned((8'ha6)) : wire1))) : reg15[(1'h0):(1'h0)]);
            end
          else
            begin
              reg29 <= reg7[(2'h3):(1'h1)];
              reg30 <= reg26[(4'hb):(4'hb)];
              reg31 <= (((reg14 ?
                      $unsigned((wire5 ^ reg17)) : reg26[(4'h8):(3'h6)]) * {$unsigned($signed(wire24))}) ?
                  $signed({$unsigned(((8'hb2) >>> (7'h42)))}) : reg9[(1'h1):(1'h1)]);
            end
          if ((~$unsigned(((+(~|reg29)) ? (|(reg26 ? reg17 : reg6)) : wire21))))
            begin
              reg32 <= wire21[(1'h0):(1'h0)];
              reg33 <= (8'ha4);
              reg34 <= $signed($unsigned(wire22));
            end
          else
            begin
              reg32 <= (($signed($unsigned($signed(reg26))) ?
                      $signed((((8'hb7) ?
                          reg13 : (7'h43)) != $signed((8'hb9)))) : $signed(reg33[(3'h4):(3'h4)])) ?
                  reg26 : (!reg14));
            end
          reg35 <= (($signed(wire20[(1'h0):(1'h0)]) <<< $unsigned($unsigned(wire3))) == $signed((!reg15)));
          reg36 <= ((wire3[(3'h7):(3'h6)] ?
                  $signed($signed({reg8, reg35})) : $unsigned(reg27)) ?
              {((&$signed((8'hbb))) ^~ (reg11 == (reg8 ?
                      reg29 : reg15)))} : ($signed((reg15 ?
                      reg12 : reg9[(3'h7):(3'h5)])) ?
                  {wire0[(1'h1):(1'h1)], reg32} : (~&reg28)));
        end
      else
        begin
          reg26 <= {reg10[(4'h8):(1'h1)]};
        end
      if (reg15[(3'h7):(2'h2)])
        begin
          reg37 <= wire3[(4'hb):(4'h9)];
          reg38 <= $unsigned((!$signed(($unsigned(reg27) ?
              (^~wire24) : $signed((8'hb9))))));
          if ((|(((|(wire5 ? (7'h41) : wire4)) ?
              wire21[(4'h8):(2'h3)] : (~(reg7 >>> (8'had)))) << ($signed((8'hbf)) + $signed({wire1})))))
            begin
              reg39 <= ((reg13[(1'h0):(1'h0)] + ($unsigned(wire19) | $signed({wire21,
                  (8'hb9)}))) - wire21);
              reg40 <= $unsigned((wire1[(4'h9):(3'h4)] >= reg8[(1'h1):(1'h1)]));
              reg41 <= ((~^(~&$unsigned($unsigned(wire3)))) ?
                  ((!$signed((reg38 <<< reg37))) <<< ((reg7[(3'h4):(1'h1)] & (reg9 >> reg36)) < wire2)) : $unsigned((((~^reg35) ?
                      reg11 : $unsigned(reg15)) ^ reg32[(4'he):(3'h7)])));
            end
          else
            begin
              reg39 <= (($unsigned(($signed(reg27) ?
                          $unsigned(reg10) : $signed(reg6))) ?
                      $unsigned((reg9[(3'h4):(1'h0)] != $unsigned(reg10))) : reg37) ?
                  ((|$unsigned(reg8[(4'h8):(3'h4)])) ?
                      $unsigned($unsigned(reg31[(4'h8):(1'h1)])) : $signed(((reg35 != reg15) ?
                          $signed(wire2) : wire21))) : wire2);
              reg40 <= (~&reg7[(2'h2):(1'h0)]);
            end
          if (($signed((($unsigned(reg26) ?
                  reg13 : $unsigned(wire5)) && ({reg40} ?
                  {(8'ha1), reg35} : $signed(reg32)))) ?
              {(&reg16), reg13} : (($unsigned((reg37 << reg14)) ?
                  {(+reg8)} : ((wire21 >= (8'haa)) >= {wire23,
                      wire19})) ^ {($signed(reg34) ?
                      reg27 : wire23[(2'h3):(1'h0)]),
                  (|$unsigned(reg31))})))
            begin
              reg42 <= $signed((reg7[(1'h1):(1'h0)] ~^ ((~|((8'hab) >> reg40)) ?
                  ($unsigned(reg40) ?
                      reg40[(3'h5):(3'h5)] : reg16) : (wire5[(3'h6):(1'h0)] ?
                      reg7 : $signed(reg32)))));
              reg43 <= $signed($signed((^~reg33[(3'h4):(2'h2)])));
              reg44 <= (~^wire0[(3'h4):(1'h0)]);
              reg45 <= ($unsigned($unsigned(((reg13 ? (8'hbb) : reg12) ?
                      (reg40 > wire5) : (-wire4)))) ?
                  (($signed((reg32 ? wire5 : wire0)) ?
                      (reg42[(4'hc):(3'h5)] + (~^reg7)) : {(&wire2),
                          $unsigned(reg29)}) >= $signed({(reg28 ?
                          reg14 : (8'hb2)),
                      reg41[(1'h1):(1'h0)]})) : reg25);
              reg46 <= $unsigned($unsigned($unsigned($signed((reg11 ?
                  reg10 : reg30)))));
            end
          else
            begin
              reg42 <= $unsigned($signed(reg39));
              reg43 <= ($unsigned($signed((~|$unsigned(reg44)))) ?
                  ({wire3[(3'h7):(3'h4)],
                      ($signed(reg28) < (wire23 > reg10))} * reg27) : (wire2 - (^~(reg35[(2'h3):(1'h1)] ?
                      (reg25 ? wire0 : wire3) : (+reg9)))));
            end
        end
      else
        begin
          reg37 <= reg44;
          reg38 <= (reg13[(2'h3):(1'h1)] ? reg46 : (8'hbb));
          if (($unsigned($signed(($unsigned(reg12) & $signed(reg12)))) || reg17[(2'h2):(1'h0)]))
            begin
              reg39 <= $signed($signed(reg8));
              reg40 <= {(^~reg41)};
              reg41 <= (~|(((reg35 ?
                      (wire24 != reg12) : reg31) & {wire20[(1'h1):(1'h1)],
                      (8'ha5)}) ?
                  ({(~|reg8), (!wire23)} <<< wire21) : wire24));
              reg42 <= $signed($unsigned($unsigned(wire0[(3'h7):(3'h7)])));
              reg43 <= ($unsigned(reg26[(3'h5):(1'h1)]) ? wire23 : (8'hac));
            end
          else
            begin
              reg39 <= reg39[(4'hc):(2'h3)];
            end
        end
      reg47 <= (reg41 ?
          reg6[(3'h5):(2'h3)] : ((reg28[(3'h6):(3'h6)] ?
              ($signed(reg12) ?
                  (8'hb8) : (reg45 ^ reg40)) : $unsigned(reg34[(1'h0):(1'h0)])) ~^ $unsigned((wire2[(3'h4):(1'h0)] <= reg46[(1'h1):(1'h1)]))));
      reg48 <= reg6[(3'h5):(3'h4)];
    end
endmodule
