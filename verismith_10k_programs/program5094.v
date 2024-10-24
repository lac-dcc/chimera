module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h284):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire59;
  wire [(4'ha):(1'h0)] wire50;
  wire [(3'h4):(1'h0)] wire49;
  wire [(5'h14):(1'h0)] wire48;
  wire [(4'h9):(1'h0)] wire44;
  wire signed [(5'h10):(1'h0)] wire43;
  wire [(2'h3):(1'h0)] wire42;
  wire [(4'he):(1'h0)] wire41;
  wire [(2'h2):(1'h0)] wire40;
  wire [(4'hc):(1'h0)] wire39;
  wire signed [(4'h8):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire37;
  wire signed [(4'hc):(1'h0)] wire36;
  wire signed [(4'hb):(1'h0)] wire35;
  wire signed [(5'h11):(1'h0)] wire34;
  wire signed [(5'h15):(1'h0)] wire33;
  wire [(4'hb):(1'h0)] wire32;
  wire signed [(3'h7):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire22;
  reg signed [(3'h7):(1'h0)] reg58 = (1'h0);
  reg [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg56 = (1'h0);
  reg [(4'ha):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(4'hd):(1'h0)] reg53 = (1'h0);
  reg [(4'he):(1'h0)] reg52 = (1'h0);
  reg [(3'h4):(1'h0)] reg51 = (1'h0);
  reg [(5'h15):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(4'h9):(1'h0)] reg45 = (1'h0);
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(3'h5):(1'h0)] reg28 = (1'h0);
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  reg [(3'h4):(1'h0)] reg6 = (1'h0);
  reg [(4'h9):(1'h0)] reg5 = (1'h0);
  reg [(4'ha):(1'h0)] reg4 = (1'h0);
  assign y = {wire59,
                 wire50,
                 wire49,
                 wire48,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire22,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg47,
                 reg46,
                 reg45,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
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
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire3)
        begin
          reg4 <= $signed(wire2);
          if ((^(^~wire1)))
            begin
              reg5 <= reg4[(3'h5):(1'h0)];
              reg6 <= (^~(~wire3[(1'h0):(1'h0)]));
              reg7 <= reg4;
              reg8 <= $signed((|(&$signed(wire0[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg5 <= reg5;
              reg6 <= $signed(reg8);
              reg7 <= $signed($unsigned(wire1[(4'h8):(1'h0)]));
            end
        end
      else
        begin
          reg4 <= wire1;
          reg5 <= reg4[(2'h3):(2'h3)];
        end
      reg9 <= $unsigned({((^~(reg6 >> (7'h43))) ?
              $unsigned({wire3}) : $signed((wire2 ? reg8 : reg5))),
          ($unsigned($unsigned(reg8)) ? (~^reg4) : wire3[(3'h5):(2'h3)])});
      if ({(reg7[(2'h3):(2'h2)] ^ ($signed($unsigned(reg9)) >>> {reg7[(3'h4):(1'h1)]}))})
        begin
          reg10 <= $unsigned((~|({$signed((8'hac))} ?
              wire3 : ($signed(reg5) ? wire0 : $signed(reg5)))));
          reg11 <= reg6[(2'h2):(2'h2)];
          if ((~|{(reg11 != wire1)}))
            begin
              reg12 <= (!(~|$signed(wire3[(3'h6):(3'h6)])));
              reg13 <= {($signed((-(reg9 ? reg8 : reg7))) ?
                      ((reg12[(1'h0):(1'h0)] != wire2) - $signed((reg9 <<< reg8))) : $unsigned((8'ha7)))};
              reg14 <= (({$signed((reg13 << reg8))} ?
                      reg9 : $unsigned(($unsigned(wire3) >> $unsigned(wire0)))) ?
                  {$unsigned({(reg13 > reg5)}),
                      (((reg8 == reg5) < $signed(reg9)) ?
                          $signed((8'ha0)) : $unsigned({wire1}))} : ((((&wire0) ?
                              reg5 : $signed(reg9)) ?
                          reg9 : reg6) ?
                      $unsigned(reg8[(3'h5):(1'h1)]) : ($unsigned({reg12,
                              wire0}) ?
                          reg11 : $unsigned(reg9))));
              reg15 <= $unsigned((((&wire0[(2'h2):(1'h1)]) >> wire1[(2'h3):(1'h1)]) ?
                  reg9[(4'h9):(2'h2)] : (reg14 ?
                      $signed($unsigned((8'hb5))) : $unsigned(wire3))));
              reg16 <= ((~&(reg4[(3'h6):(1'h1)] << ($unsigned(wire0) > reg9[(2'h3):(1'h0)]))) & $signed({$signed(((8'h9d) * reg8))}));
            end
          else
            begin
              reg12 <= $signed(wire3);
              reg13 <= (+(reg7[(4'h8):(2'h3)] ?
                  $unsigned($unsigned((wire2 >= reg5))) : reg15[(4'ha):(2'h2)]));
              reg14 <= (-$unsigned($unsigned((^~reg13[(2'h3):(1'h1)]))));
            end
        end
      else
        begin
          reg10 <= reg11;
          reg11 <= ($unsigned(reg4) > reg4[(2'h2):(1'h1)]);
          reg12 <= {($unsigned((&$signed(reg10))) >= ({(reg10 & wire0),
                  (wire0 <= wire0)} > {(reg5 || reg10)})),
              reg4[(3'h4):(3'h4)]};
          reg13 <= $unsigned(({$unsigned($signed(reg9))} ?
              (({reg15,
                  reg16} == reg9[(2'h3):(2'h2)]) << {((7'h43) < reg14)}) : wire3));
          reg14 <= reg9;
        end
      if (reg12)
        begin
          reg17 <= $unsigned(($signed(($signed(wire2) ?
              wire1[(2'h2):(1'h0)] : $signed(reg6))) * (reg7 ?
              ((~^wire3) ? reg7[(3'h7):(1'h1)] : reg9) : {$signed(wire3),
                  (reg16 ? wire3 : reg12)})));
        end
      else
        begin
          reg17 <= (^(8'ha2));
          reg18 <= (8'hb0);
          reg19 <= wire1;
          reg20 <= reg16;
          reg21 <= (|{(8'ha9), wire0});
        end
    end
  assign wire22 = (reg4 >> wire0);
  always
    @(posedge clk) begin
      reg23 <= ($unsigned((((reg6 >= reg9) ?
              reg9[(3'h7):(1'h1)] : wire22[(3'h4):(2'h3)]) ?
          wire1 : ((~|wire1) ?
              $signed(wire1) : wire22))) + (-reg6[(1'h0):(1'h0)]));
      if ($unsigned(((reg8[(2'h2):(1'h1)] <<< reg5[(4'h8):(1'h0)]) ~^ $unsigned(((~|reg13) < (reg12 ^~ wire22))))))
        begin
          reg24 <= wire3[(1'h1):(1'h1)];
          reg25 <= wire22[(1'h0):(1'h0)];
        end
      else
        begin
          reg24 <= reg20;
          reg25 <= reg24[(3'h5):(1'h0)];
          reg26 <= {reg25};
          reg27 <= ((reg21[(4'h8):(3'h6)] > wire0) ?
              $signed((wire22[(4'h9):(3'h4)] ?
                  $signed($unsigned((8'hb9))) : wire3)) : $unsigned(((~^(reg25 ?
                      reg19 : reg10)) ?
                  {reg19[(3'h5):(1'h1)]} : (^(-reg19)))));
        end
      reg28 <= $signed(reg14[(2'h3):(2'h3)]);
      reg29 <= ((^(!{(wire1 == reg13)})) >>> (^~(reg20[(3'h4):(2'h3)] ?
          ((reg9 ? reg28 : reg25) ?
              reg10 : (wire22 & reg11)) : ((+wire3) && reg19))));
      reg30 <= $signed((-$signed({(+reg23), reg29[(4'he):(4'ha)]})));
    end
  assign wire31 = (~|$signed({reg6, $unsigned($unsigned(reg11))}));
  assign wire32 = ($signed($unsigned($unsigned((reg4 > reg29)))) | ($signed(((~&reg18) ?
                      reg28[(3'h5):(3'h4)] : (~|wire3))) * ((reg13 ?
                          (-reg10) : (reg4 << (8'ha8))) ?
                      reg21 : $signed($unsigned(wire31)))));
  assign wire33 = $signed(($unsigned(reg27[(2'h2):(1'h1)]) ?
                      $unsigned(wire31[(3'h7):(2'h2)]) : {reg9[(4'he):(1'h1)],
                          ($unsigned(reg10) ~^ (reg14 == (8'hbe)))}));
  assign wire34 = {(~^(~^$signed($signed(wire32))))};
  assign wire35 = ((~^reg12[(2'h2):(1'h0)]) - $unsigned($unsigned(((~|reg29) && $unsigned(reg26)))));
  assign wire36 = ((7'h42) ^ {reg4});
  assign wire37 = $unsigned(wire31[(3'h4):(1'h0)]);
  assign wire38 = $unsigned((~&(-reg12)));
  assign wire39 = $unsigned(reg26[(2'h2):(2'h2)]);
  assign wire40 = (^(($unsigned((wire2 ?
                      reg30 : reg28)) + reg23[(3'h7):(1'h1)]) - (8'hb9)));
  assign wire41 = $signed($signed(reg9));
  assign wire42 = reg24[(1'h1):(1'h0)];
  assign wire43 = ((~|reg16) ?
                      ($signed(reg30[(1'h0):(1'h0)]) ^ reg10[(5'h14):(3'h5)]) : ((((^reg5) | $signed(reg26)) - reg5) ?
                          reg14 : (wire32[(4'ha):(2'h2)] ^~ $unsigned((reg5 ~^ (8'h9e))))));
  assign wire44 = wire33;
  always
    @(posedge clk) begin
      reg45 <= ((($signed((wire0 * (8'hb4))) & wire35) ?
              reg17 : $signed($signed($unsigned(wire33)))) ?
          (|(~|((wire39 ? reg27 : reg12) ?
              (reg20 ?
                  (8'ha1) : reg15) : wire39[(3'h7):(1'h0)]))) : wire41[(3'h7):(3'h4)]);
      reg46 <= $signed($signed((~&{(reg26 ? wire39 : (8'hbe))})));
      reg47 <= $unsigned(reg7[(1'h0):(1'h0)]);
    end
  assign wire48 = $signed({(wire22 || $signed((reg7 >> wire38)))});
  assign wire49 = $signed(($signed({(~reg47)}) ?
                      $signed((~|$unsigned(wire34))) : (~|reg46)));
  assign wire50 = $signed(reg4[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      if ($signed(reg19))
        begin
          if (($signed((($unsigned(reg15) ?
              $unsigned(reg46) : (^wire40)) != reg17[(3'h4):(2'h2)])) <= $signed(wire32)))
            begin
              reg51 <= wire39[(1'h1):(1'h1)];
              reg52 <= (|$unsigned((^~(~^reg25[(5'h12):(3'h6)]))));
              reg53 <= (($signed((+(8'ha5))) <= (reg19 ?
                  $signed(reg15[(2'h2):(1'h1)]) : (((8'hb1) ^ wire32) ?
                      $unsigned(reg28) : $signed(reg24)))) - reg18);
              reg54 <= (|((!(7'h44)) <= (8'ha3)));
              reg55 <= (((((reg26 ? wire2 : reg18) ?
                          (wire0 ?
                              wire50 : wire50) : (+(8'ha8))) && ((&wire32) <= (reg12 && (8'ha0)))) ?
                      reg46[(1'h0):(1'h0)] : wire35[(1'h1):(1'h1)]) ?
                  (reg16 >= $unsigned(wire42[(2'h3):(1'h1)])) : ($unsigned((wire0 || $signed(reg21))) ?
                      reg17[(4'hd):(4'hd)] : $unsigned(wire35)));
            end
          else
            begin
              reg51 <= ($signed(reg20[(4'he):(4'hc)]) == (^~wire48[(1'h0):(1'h0)]));
              reg52 <= wire36;
            end
          reg56 <= ($signed($unsigned(wire32)) >>> wire3[(3'h6):(2'h2)]);
          reg57 <= $unsigned(wire39[(2'h3):(1'h0)]);
        end
      else
        begin
          reg51 <= ((((^~$unsigned(wire0)) * $unsigned(wire0[(2'h2):(1'h1)])) >>> $unsigned((reg5[(4'h8):(3'h7)] ?
              $signed(reg14) : (+reg14)))) && ((8'hab) ?
              ((~^(8'hab)) ?
                  reg29[(3'h5):(3'h4)] : $unsigned((!reg7))) : (wire38[(3'h5):(3'h5)] ?
                  (!wire3) : ((8'ha1) != (wire35 ~^ reg46)))));
          reg52 <= ($signed(reg51[(3'h4):(3'h4)]) ?
              (((8'had) ? reg9 : wire3) <= $signed(((reg27 ^ wire41) <= (reg28 ?
                  reg28 : (8'hac))))) : $unsigned((8'ha5)));
          reg53 <= ($signed(($signed($signed((7'h44))) <= ({reg23, (8'ha9)} ?
                  (~|wire49) : (wire2 ^ wire48)))) ?
              (~wire0) : reg28);
          reg54 <= $unsigned(($unsigned($signed((^wire36))) << $signed($unsigned($signed((8'hb2))))));
          if ($signed(reg24[(4'hc):(4'hc)]))
            begin
              reg55 <= {$unsigned((8'hb6)), $signed(reg9)};
              reg56 <= reg19[(3'h7):(1'h0)];
              reg57 <= wire37[(5'h11):(5'h10)];
              reg58 <= {(+(8'ha5)), $signed(reg5)};
            end
          else
            begin
              reg55 <= $signed({($signed(reg45[(3'h5):(2'h3)]) << wire43[(4'h8):(2'h3)]),
                  wire42[(2'h3):(1'h1)]});
              reg56 <= ((!wire1[(2'h3):(1'h0)]) ?
                  ((reg14 ? {reg24} : ((reg6 ? reg14 : wire42) ~^ {wire48})) ?
                      reg24[(4'ha):(3'h6)] : wire36) : (!(!$signed($signed(wire0)))));
              reg57 <= (wire32 != $signed({(!(~&(8'ha5)))}));
              reg58 <= {(reg23[(2'h2):(2'h2)] ?
                      ({{reg12}, $unsigned(wire41)} << ((~reg28) ?
                          (~^(8'ha5)) : (!wire3))) : reg54),
                  $unsigned($signed((^wire3)))};
            end
        end
    end
  assign wire59 = ($signed($unsigned(reg21)) ?
                      {(+$signed(reg18[(3'h6):(2'h2)]))} : $unsigned(wire49[(1'h0):(1'h0)]));
endmodule
