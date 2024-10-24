module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h293):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire60;
  wire [(5'h12):(1'h0)] wire59;
  wire [(4'h8):(1'h0)] wire57;
  wire [(5'h10):(1'h0)] wire56;
  wire signed [(4'hb):(1'h0)] wire55;
  wire signed [(4'h9):(1'h0)] wire39;
  wire signed [(5'h11):(1'h0)] wire38;
  wire [(5'h15):(1'h0)] wire37;
  wire [(3'h5):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire21;
  wire [(4'hb):(1'h0)] wire20;
  wire [(4'h9):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire18;
  wire signed [(2'h2):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire4;
  reg signed [(5'h12):(1'h0)] reg62 = (1'h0);
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg54 = (1'h0);
  reg [(3'h4):(1'h0)] reg53 = (1'h0);
  reg [(4'hb):(1'h0)] reg52 = (1'h0);
  reg [(5'h14):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg47 = (1'h0);
  reg [(4'h8):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg45 = (1'h0);
  reg [(2'h2):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg6 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire57,
                 wire56,
                 wire55,
                 wire39,
                 wire38,
                 wire37,
                 wire26,
                 wire25,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire5,
                 wire4,
                 reg62,
                 reg61,
                 reg58,
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
                 reg24,
                 reg23,
                 reg22,
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
  assign wire4 = (((((wire2 ? wire3 : wire1) ?
                         (wire1 > (7'h40)) : (wire3 && wire0)) ~^ $unsigned($unsigned(wire1))) ?
                     (($unsigned(wire1) ?
                             (wire1 ? wire1 : wire0) : $signed(wire3)) ?
                         wire1[(5'h14):(5'h10)] : {$signed(wire2)}) : (8'h9d)) > wire1[(4'he):(3'h4)]);
  assign wire5 = wire2;
  always
    @(posedge clk) begin
      if ($unsigned((8'hb5)))
        begin
          reg6 <= wire1[(5'h10):(5'h10)];
          reg7 <= wire3[(1'h1):(1'h1)];
        end
      else
        begin
          reg6 <= (~^(-$unsigned({$unsigned(wire2), $unsigned((8'hb5))})));
        end
      if (wire4[(3'h5):(2'h3)])
        begin
          reg8 <= (-((~$signed(wire2[(3'h6):(1'h1)])) >> wire0[(4'hc):(4'hb)]));
          if (reg7)
            begin
              reg9 <= ((!wire0[(1'h0):(1'h0)]) < (($signed((8'hb3)) + (+reg7[(1'h0):(1'h0)])) ?
                  wire0 : $unsigned(reg6)));
            end
          else
            begin
              reg9 <= reg7;
            end
          if ((8'haf))
            begin
              reg10 <= (wire5 <= (((|$signed(reg8)) >= $signed((wire3 <<< wire1))) ?
                  reg7[(3'h6):(2'h2)] : wire5));
            end
          else
            begin
              reg10 <= (wire1 ?
                  (((wire4 ?
                      (wire4 ^ wire4) : (reg6 ?
                          wire4 : wire0)) ^~ (&$unsigned((8'hb3)))) <= (($signed(reg10) * (reg9 ?
                      wire3 : wire5)) >>> (wire5 ?
                      (wire3 ?
                          (7'h44) : reg6) : (^~reg9)))) : wire4[(2'h2):(2'h2)]);
              reg11 <= ((((reg10 > $signed(reg9)) ?
                      $unsigned(wire5[(2'h2):(1'h1)]) : (reg8[(3'h6):(2'h3)] ?
                          (-reg10) : $unsigned(wire1))) ?
                  {$unsigned((wire1 < (8'ha0)))} : (($signed(reg8) << $signed(wire4)) & $signed(wire2[(1'h0):(1'h0)]))) - reg10);
              reg12 <= (wire3[(3'h7):(3'h5)] << reg6);
              reg13 <= ((^reg9) - (+{(&reg8), wire1[(4'hb):(1'h1)]}));
            end
          reg14 <= $signed(wire1[(3'h6):(3'h4)]);
        end
      else
        begin
          if ($unsigned(reg7))
            begin
              reg8 <= reg7;
              reg9 <= wire2[(3'h7):(3'h6)];
              reg10 <= (($unsigned($unsigned($signed(wire5))) > reg9[(1'h0):(1'h0)]) & ((|reg13[(2'h2):(1'h1)]) > $unsigned(((~(8'hb5)) * (wire2 ?
                  wire5 : reg7)))));
              reg11 <= reg14;
              reg12 <= reg8[(4'he):(4'he)];
            end
          else
            begin
              reg8 <= $unsigned($signed(reg11[(3'h4):(3'h4)]));
            end
          reg13 <= (^~$signed(reg14[(4'ha):(2'h2)]));
          reg14 <= ((8'haa) ? reg8 : (!reg13));
        end
      if ($signed((^($unsigned(wire1) ? reg14[(4'h8):(3'h4)] : (~{wire3})))))
        begin
          if ((&(&reg12)))
            begin
              reg15 <= {wire0[(3'h5):(3'h4)], $unsigned((~&reg7))};
              reg16 <= ((($signed(wire0[(4'hc):(2'h3)]) ?
                          ($unsigned(reg13) ?
                              (!wire4) : {reg14, reg6}) : ((wire5 ?
                                  wire4 : (8'hb2)) ?
                              reg13[(4'h8):(2'h2)] : $signed((8'ha6)))) ?
                      (((wire0 >>> reg8) ? (reg7 && reg8) : $signed((7'h42))) ?
                          (^(-reg11)) : {(wire5 * wire4),
                              $unsigned(reg10)}) : {($signed(wire3) != (~&(8'had))),
                          $unsigned(wire1)}) ?
                  (!wire5) : reg7);
              reg17 <= $unsigned($signed((-wire1)));
            end
          else
            begin
              reg15 <= ($unsigned({{reg13[(3'h4):(3'h4)]}, reg17}) ?
                  (wire5 ?
                      (-reg11) : (8'hb0)) : $unsigned($signed(($signed(reg13) ?
                      (!reg15) : reg14[(4'hd):(3'h6)]))));
              reg16 <= (reg11[(3'h4):(3'h4)] | ({(~reg14),
                  $signed((7'h40))} || {($unsigned(wire4) ?
                      (&reg8) : ((7'h40) ? reg9 : reg10))}));
              reg17 <= (reg12[(3'h4):(3'h4)] ?
                  $signed($signed($unsigned(reg8[(5'h14):(4'hd)]))) : reg11);
            end
        end
      else
        begin
          reg15 <= ((~^$unsigned($unsigned(reg11))) == $unsigned({$unsigned($signed(wire3)),
              ($signed(reg17) ? ((8'hbd) * reg10) : wire4[(3'h4):(3'h4)])}));
          reg16 <= $unsigned((^~$signed((reg12 ?
              wire4 : (reg16 ? (8'hbc) : reg17)))));
          reg17 <= (($signed((!{wire4, (8'hb4)})) << ({(^~wire4), wire1} ?
              (~(wire4 ? reg11 : (7'h40))) : (~|(-wire5)))) ^~ reg7);
        end
    end
  assign wire18 = reg14;
  assign wire19 = reg8[(5'h10):(4'hd)];
  assign wire20 = ((({reg17} ?
                      (8'hac) : ((wire3 & reg10) | $unsigned(wire4))) <= {$signed(wire18[(4'hb):(4'h9)]),
                      (|$signed(wire2))}) + ((7'h43) ?
                      (wire19 ~^ $unsigned(reg10)) : (!(((8'ha8) ?
                              reg16 : wire1) ?
                          ((8'hba) << reg8) : $unsigned(reg6)))));
  assign wire21 = $unsigned(($unsigned(($unsigned(reg14) ?
                      (reg16 >>> (8'h9f)) : (reg17 < reg10))) || ((reg12[(2'h2):(1'h0)] ?
                          reg16 : wire19) ?
                      ((wire3 || (8'hba)) ? (8'hb0) : (^~reg7)) : reg10)));
  always
    @(posedge clk) begin
      if (reg8)
        begin
          reg22 <= wire21[(2'h2):(1'h1)];
        end
      else
        begin
          reg22 <= ({reg12[(2'h3):(1'h0)],
              $signed(({reg6, wire21} ^ wire21))} | wire2);
          reg23 <= $signed(((+$signed(reg9)) ?
              (wire1 >= $signed((reg12 ~^ reg22))) : $signed(reg6)));
          reg24 <= (~&(($signed(wire4[(3'h4):(1'h0)]) ^~ ((reg16 ?
                  reg7 : reg11) < wire5[(1'h1):(1'h0)])) ?
              (!(^~$signed(reg8))) : $unsigned(({reg12} ?
                  (reg9 | reg11) : reg10[(3'h4):(2'h2)]))));
        end
    end
  assign wire25 = reg11;
  assign wire26 = ((8'ha6) ?
                      $unsigned(($unsigned(wire25[(5'h13):(5'h10)]) ?
                          $unsigned($unsigned(wire18)) : (-(&wire3)))) : $unsigned(wire19));
  always
    @(posedge clk) begin
      reg27 <= reg23;
      reg28 <= (^(reg22 ? $unsigned(reg8) : $signed(reg10)));
      reg29 <= reg24[(1'h0):(1'h0)];
      if (($unsigned($signed((~|(-reg11)))) ?
          $signed((reg23[(4'h9):(1'h1)] ?
              (-wire3) : (~^wire5))) : $unsigned((~reg7[(3'h6):(1'h1)]))))
        begin
          reg30 <= ($unsigned((!reg12)) ?
              (((+(wire20 ? reg10 : (8'h9e))) ?
                      (-reg15[(2'h2):(2'h2)]) : reg7[(3'h6):(1'h1)]) ?
                  (-(wire4[(3'h5):(1'h1)] || {wire20})) : $signed(($signed(reg24) ?
                      reg9 : (wire25 ?
                          reg9 : (8'hba))))) : $unsigned($unsigned({wire25})));
        end
      else
        begin
          reg30 <= ((reg12 ?
              $unsigned((7'h41)) : $unsigned($signed(reg24[(1'h0):(1'h0)]))) + {(&$unsigned($signed(wire5)))});
          reg31 <= $signed($unsigned(wire4[(2'h3):(2'h2)]));
          reg32 <= wire26[(1'h1):(1'h0)];
          if (($unsigned(reg22) >> reg31[(2'h2):(2'h2)]))
            begin
              reg33 <= reg28[(1'h0):(1'h0)];
              reg34 <= $unsigned((reg29[(1'h0):(1'h0)] ?
                  wire3[(4'hb):(2'h3)] : $signed($unsigned((reg30 == reg11)))));
              reg35 <= (~|$signed((^~reg7)));
            end
          else
            begin
              reg33 <= $signed($unsigned(($unsigned($unsigned(reg35)) ?
                  ($unsigned(wire19) ?
                      wire2[(1'h1):(1'h0)] : {reg14}) : (|(reg15 << (8'hae))))));
            end
          reg36 <= $signed(reg35);
        end
    end
  assign wire37 = $unsigned((reg7[(4'h9):(4'h9)] > $unsigned($signed((^wire21)))));
  assign wire38 = $unsigned(reg23[(3'h5):(2'h2)]);
  assign wire39 = (($signed(reg14[(4'h9):(4'h9)]) ?
                      ($signed((reg31 == reg7)) == $unsigned(wire37[(1'h0):(1'h0)])) : wire25[(2'h2):(1'h0)]) ^ (^($signed(reg11) < $signed((reg8 ?
                      reg33 : reg10)))));
  always
    @(posedge clk) begin
      reg40 <= reg28;
      reg41 <= $signed((^($unsigned((wire20 ? (8'ha1) : wire0)) || (((8'ha6) ?
              reg40 : reg8) ?
          wire18[(5'h11):(5'h11)] : {wire39}))));
      if ((^~((^reg36) ?
          $signed(((reg40 ? reg24 : reg7) ?
              (reg30 ^ wire5) : (reg23 ?
                  wire4 : wire18))) : ((8'hae) <<< ($signed((8'ha7)) + {reg41,
              reg36})))))
        begin
          if (reg29[(3'h4):(2'h2)])
            begin
              reg42 <= ($signed($signed((&wire2[(3'h4):(3'h4)]))) ?
                  ((reg7 >> (reg31 ? wire39 : (8'ha6))) ?
                      $unsigned(reg11) : ($signed($unsigned((8'ha1))) ?
                          reg33[(4'hc):(4'h9)] : (((7'h44) | (8'hbf)) - reg36))) : (wire5 != (~|({reg10,
                      reg31} & reg22[(4'h8):(3'h4)]))));
              reg43 <= $signed($unsigned((-($signed(reg9) * $unsigned(wire25)))));
              reg44 <= reg22[(4'h9):(3'h5)];
              reg45 <= $signed(wire19);
              reg46 <= (((~($unsigned(reg28) ?
                      {reg31} : {reg44,
                          reg8})) > $signed($signed($signed(reg24)))) ?
                  (^wire37[(3'h5):(3'h4)]) : $signed(reg10));
            end
          else
            begin
              reg42 <= $unsigned(reg14[(2'h3):(2'h3)]);
              reg43 <= reg23;
              reg44 <= reg29[(5'h11):(3'h6)];
            end
        end
      else
        begin
          if ((reg27[(3'h7):(3'h6)] != (~^(~(wire3[(3'h5):(1'h0)] < reg15)))))
            begin
              reg42 <= $unsigned(reg22);
              reg43 <= (^~{((8'hb4) | (-(8'ha7))),
                  {((+wire3) <<< wire20[(3'h7):(3'h4)])}});
              reg44 <= (reg46 >> {reg17[(4'h9):(4'h9)]});
              reg45 <= (8'hba);
              reg46 <= {$unsigned((~|$signed((~|wire1))))};
            end
          else
            begin
              reg42 <= {$unsigned(($signed((reg27 <<< wire20)) - ((reg45 ?
                      reg13 : wire20) >>> $unsigned(wire5)))),
                  $unsigned($unsigned((~|wire37[(5'h12):(4'ha)])))};
              reg43 <= reg24;
              reg44 <= reg6;
              reg45 <= ({(|$unsigned(reg27[(1'h1):(1'h1)]))} << ($signed($signed(wire38[(3'h6):(1'h1)])) & (-(^~(reg35 ?
                  wire26 : reg24)))));
              reg46 <= ((reg46 & reg30[(3'h7):(2'h2)]) ?
                  $signed(wire25) : reg40[(4'h8):(2'h2)]);
            end
          reg47 <= (~wire37);
        end
      if (reg15[(3'h5):(3'h5)])
        begin
          reg48 <= reg30;
          reg49 <= reg45;
          reg50 <= ($signed($signed($signed($signed(reg31)))) ?
              (reg24[(2'h2):(1'h0)] | {(reg17 != reg10)}) : reg28);
          if ({$unsigned((reg40 ?
                  ({(8'hb1), reg12} ?
                      $unsigned((8'ha8)) : $signed(reg44)) : ((wire20 == reg14) >>> (reg15 != wire37))))})
            begin
              reg51 <= (&reg29[(3'h6):(1'h0)]);
              reg52 <= reg7;
              reg53 <= wire38;
              reg54 <= $unsigned(reg30);
            end
          else
            begin
              reg51 <= reg24[(1'h0):(1'h0)];
              reg52 <= reg48;
              reg53 <= $unsigned({((!(reg24 ? reg11 : wire3)) ?
                      ($signed((8'hb7)) != reg29) : {{wire18, (8'h9d)},
                          {reg32, reg46}}),
                  ($signed((-reg16)) >>> wire19[(3'h5):(3'h4)])});
            end
        end
      else
        begin
          reg48 <= reg53[(2'h3):(2'h2)];
          reg49 <= (reg9[(4'ha):(3'h4)] ?
              (~^{reg52,
                  $signed((reg48 ? reg44 : wire26))}) : reg44[(1'h0):(1'h0)]);
          reg50 <= $signed($unsigned((($signed(reg29) <= $unsigned(reg51)) ?
              $unsigned($unsigned(reg31)) : $unsigned((~^reg53)))));
          reg51 <= (!$unsigned($signed((reg44[(2'h2):(1'h1)] ?
              (reg29 || (8'ha5)) : {reg41}))));
        end
    end
  assign wire55 = (reg32 < ((8'ha0) ?
                      $unsigned(wire3) : $signed(reg15[(1'h1):(1'h1)])));
  assign wire56 = ((($signed((reg10 > reg15)) ^ $unsigned($signed(reg47))) ?
                      (reg42 && $signed(reg17[(4'h9):(3'h5)])) : wire1) ^ wire37[(3'h5):(3'h5)]);
  assign wire57 = ({reg8, $unsigned(wire21[(1'h0):(1'h0)])} ?
                      (~^reg50) : {$signed(reg27),
                          {($unsigned((8'ha1)) == (8'haa))}});
  always
    @(posedge clk) begin
      reg58 <= ((~|reg28[(1'h1):(1'h0)]) << reg22);
    end
  assign wire59 = ($unsigned((8'ha4)) >>> (|((~^(~&(8'hb3))) <= wire55)));
  assign wire60 = {($unsigned({(^~wire4)}) <= $unsigned((reg7[(2'h2):(1'h0)] ^~ reg15[(1'h0):(1'h0)])))};
  always
    @(posedge clk) begin
      reg61 <= (~&{(wire57 ? $unsigned(reg15) : {(reg52 && reg41)}),
          $signed(((|wire59) == (reg50 >= reg30)))});
      reg62 <= (^$signed((wire0[(4'hc):(1'h0)] ?
          reg50[(3'h5):(2'h2)] : {((8'ha7) ? wire20 : reg43)})));
    end
endmodule
