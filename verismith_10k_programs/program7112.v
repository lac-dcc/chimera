module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h218):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire73;
  wire [(3'h5):(1'h0)] wire72;
  wire signed [(3'h7):(1'h0)] wire71;
  wire [(5'h10):(1'h0)] wire70;
  wire [(4'h9):(1'h0)] wire69;
  wire [(5'h14):(1'h0)] wire25;
  wire signed [(3'h7):(1'h0)] wire26;
  wire signed [(2'h3):(1'h0)] wire42;
  wire [(3'h5):(1'h0)] wire43;
  wire [(5'h13):(1'h0)] wire67;
  reg signed [(3'h7):(1'h0)] reg5 = (1'h0);
  reg [(4'he):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg36 = (1'h0);
  reg [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg39 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg41 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire25,
                 wire26,
                 wire42,
                 wire43,
                 wire67,
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
                 reg27,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (~|wire3);
      if (($unsigned(wire1) ?
          {($signed((|wire0)) ^ (wire3[(1'h1):(1'h1)] != (7'h44))),
              reg5} : (wire3[(3'h4):(2'h3)] ? (~^wire4[(1'h1):(1'h0)]) : reg5)))
        begin
          reg6 <= ((reg5 || $signed($signed(wire0[(1'h1):(1'h0)]))) ?
              reg5 : $signed($signed((~^(8'hba)))));
          if ($unsigned(($unsigned((wire2 ? reg6 : $unsigned(reg5))) ?
              ({(reg6 ? wire2 : wire2),
                  $unsigned(reg6)} <= (+(wire3 || wire4))) : wire0)))
            begin
              reg7 <= $signed($unsigned((((reg5 + (8'hbc)) && wire4) ?
                  reg5 : {$unsigned(wire2)})));
              reg8 <= wire3;
              reg9 <= ({$unsigned((7'h40)),
                      (((-reg7) ?
                          (reg6 ?
                              wire1 : wire0) : reg7[(4'h8):(2'h2)]) != {((7'h43) != wire3)})} ?
                  (^~$unsigned((wire1 ^~ (reg6 ?
                      wire2 : wire1)))) : (|$unsigned(($unsigned(wire3) <<< (reg5 ^ reg5)))));
            end
          else
            begin
              reg7 <= {wire0[(1'h0):(1'h0)]};
              reg8 <= $signed(reg9);
              reg9 <= ((((8'h9e) << ((^reg8) ?
                  (wire0 ?
                      reg6 : wire0) : $signed(wire2))) <= $unsigned($signed($signed((7'h41))))) || (~^($unsigned((^wire4)) <<< $signed(reg5[(2'h2):(1'h0)]))));
              reg10 <= ($signed(($unsigned(wire4[(1'h1):(1'h1)]) >= $unsigned((~^wire4)))) ?
                  {$unsigned($signed($unsigned(reg7))),
                      ({(~(7'h44)), (wire0 ? wire4 : wire1)} ?
                          $unsigned($unsigned(wire0)) : reg9)} : wire0[(1'h0):(1'h0)]);
              reg11 <= (reg5 & ((~((wire0 && reg6) - (8'haf))) ?
                  {{(7'h41), reg6[(2'h3):(1'h1)]},
                      $signed((reg10 <= wire3))} : (reg5 - ({reg7,
                      reg8} > reg10))));
            end
          reg12 <= (~|(^~$unsigned($signed($signed((8'hb9))))));
          reg13 <= ($signed(wire2[(2'h2):(1'h0)]) + $signed((reg8[(5'h10):(4'hb)] != (reg9[(4'h8):(3'h7)] ~^ reg11[(3'h5):(2'h2)]))));
          if ($signed((wire3 ?
              $unsigned(((-wire2) ?
                  (!reg5) : wire1[(3'h7):(3'h4)])) : ((~$unsigned(wire0)) ?
                  (+$unsigned(wire3)) : wire3))))
            begin
              reg14 <= {wire0[(1'h1):(1'h1)]};
              reg15 <= reg9;
              reg16 <= ((($unsigned((wire0 >>> reg10)) ?
                      (~$unsigned(reg5)) : {$signed(wire3),
                          (8'hb0)}) || wire0[(1'h0):(1'h0)]) ?
                  ($unsigned((!{reg9, reg13})) != $signed({(7'h42),
                      (reg8 ^~ reg5)})) : ({({reg6, reg7} ?
                              (reg10 ? reg11 : reg8) : wire0[(1'h0):(1'h0)]),
                          $unsigned(reg13[(2'h2):(1'h1)])} ?
                      (8'hb6) : reg13[(2'h2):(2'h2)]));
              reg17 <= $signed({{(wire3[(5'h13):(4'h8)] - wire3),
                      {(reg16 ? wire1 : (8'hb3)), ((8'h9f) << wire0)}}});
            end
          else
            begin
              reg14 <= $unsigned({reg14});
            end
        end
      else
        begin
          reg6 <= reg10;
          if ((reg9 < $signed((~^(+(8'hae))))))
            begin
              reg7 <= reg5;
              reg8 <= reg11;
              reg9 <= reg9;
              reg10 <= $signed(wire0);
            end
          else
            begin
              reg7 <= (!$unsigned(reg5[(3'h7):(3'h4)]));
              reg8 <= ({$signed(reg13[(3'h7):(3'h4)]), $signed(reg6)} ?
                  (((((8'ha0) ? (8'hba) : wire3) ?
                      $signed((8'ha3)) : wire4[(3'h4):(1'h1)]) & $unsigned({reg15})) << ((reg15 ^ $unsigned(reg14)) >= reg5)) : $unsigned((((reg6 > reg8) << (~wire2)) ^~ (-(^~reg12)))));
              reg9 <= (-{$unsigned(((reg7 ? wire4 : wire1) ?
                      reg7[(4'he):(2'h3)] : {reg10}))});
            end
          reg11 <= (reg10[(4'hf):(4'he)] | reg7[(4'hb):(3'h6)]);
          reg12 <= reg17[(5'h10):(4'hc)];
          if (reg12[(5'h10):(4'he)])
            begin
              reg13 <= (reg11 ?
                  $unsigned(reg6) : (^~((~(wire2 ? wire1 : wire2)) ?
                      (&reg8) : reg5)));
            end
          else
            begin
              reg13 <= wire1;
              reg14 <= reg10;
              reg15 <= $signed($signed((8'ha7)));
              reg16 <= (&$signed((-reg11)));
              reg17 <= (~$unsigned($signed($signed(((7'h42) + reg14)))));
            end
        end
      if ((~&reg17[(3'h5):(3'h5)]))
        begin
          reg18 <= wire3[(3'h7):(3'h6)];
          reg19 <= (reg15[(4'hf):(4'hd)] > $signed((reg12[(5'h10):(1'h1)] ?
              $unsigned((wire1 ? reg8 : wire1)) : $signed(reg5))));
          reg20 <= (~|((+(!(~|wire1))) ?
              (reg14[(3'h4):(3'h4)] ^~ {$unsigned(wire1),
                  $unsigned((8'h9e))}) : reg13[(3'h4):(1'h1)]));
          reg21 <= $unsigned({$signed((~&(^wire4)))});
        end
      else
        begin
          if ($signed(((($unsigned((8'hae)) == (|wire4)) <<< wire2) ?
              $unsigned(reg20[(2'h2):(2'h2)]) : (wire3 & reg15))))
            begin
              reg18 <= $signed(reg13[(3'h6):(1'h0)]);
              reg19 <= ($signed((8'hbb)) - reg15[(4'hf):(4'h9)]);
              reg20 <= reg12[(4'hc):(2'h3)];
              reg21 <= ((~$signed(((|reg11) >> $unsigned(reg7)))) ?
                  wire2[(4'h9):(3'h5)] : $signed(wire0[(1'h0):(1'h0)]));
            end
          else
            begin
              reg18 <= $unsigned($unsigned((^~$unsigned((reg5 ?
                  reg11 : reg14)))));
              reg19 <= (reg8 != {{$unsigned((|wire3))}});
              reg20 <= reg6;
              reg21 <= reg17[(4'hd):(2'h3)];
            end
          reg22 <= ({$unsigned(reg7[(1'h1):(1'h0)]), (~|reg10[(3'h6):(2'h2)])} ?
              (8'ha3) : (wire0[(1'h1):(1'h0)] ?
                  wire1[(3'h4):(1'h0)] : $unsigned(reg15[(3'h7):(3'h4)])));
          reg23 <= reg11[(3'h4):(1'h1)];
        end
      reg24 <= $unsigned((($signed($signed(reg22)) * $signed(reg21[(2'h3):(2'h3)])) >> reg7));
    end
  assign wire25 = (~$unsigned(((|(wire0 ? reg23 : reg7)) >> {reg22,
                      $unsigned(reg20)})));
  assign wire26 = (|reg18[(3'h5):(3'h4)]);
  always
    @(posedge clk) begin
      reg27 <= $signed(((|$signed((reg19 << wire4))) ?
          (reg19[(4'hb):(2'h2)] ?
              $unsigned(reg19) : ($signed(wire25) ?
                  $signed(reg12) : $unsigned(reg12))) : {$unsigned((reg20 <<< wire2))}));
      reg28 <= (~&$unsigned(($signed({reg17}) ? {((7'h42) << wire3)} : reg17)));
    end
  always
    @(posedge clk) begin
      reg29 <= reg19[(3'h6):(3'h5)];
      if ((({reg28[(2'h3):(2'h2)], (!(wire26 ? wire3 : reg16))} ?
              ((8'hb7) ?
                  ((reg17 > reg7) ?
                      wire2[(4'h8):(1'h0)] : (+wire0)) : reg15) : {(~^(reg28 ?
                      (8'h9e) : wire2)),
                  (-$unsigned(reg12))}) ?
          (8'hb2) : ((-$signed((~|wire4))) >= wire25[(4'h9):(3'h5)])))
        begin
          if ($unsigned($signed($signed(reg29[(1'h0):(1'h0)]))))
            begin
              reg30 <= (-(reg7[(4'h9):(4'h8)] * $unsigned((((8'hb9) ?
                      reg7 : wire0) ?
                  $unsigned((7'h41)) : {(8'had), (7'h43)}))));
              reg31 <= reg29;
              reg32 <= ((reg13[(2'h2):(1'h1)] ^~ (((reg31 ?
                      wire2 : wire4) >> $unsigned(reg29)) ?
                  wire2 : (~((8'hbd) >> reg14)))) == $unsigned(reg16[(3'h7):(3'h7)]));
              reg33 <= reg31;
              reg34 <= $unsigned(reg15[(5'h10):(1'h0)]);
            end
          else
            begin
              reg30 <= {reg12[(2'h3):(2'h2)], wire1};
              reg31 <= $unsigned(reg10[(2'h2):(1'h1)]);
            end
          if ({reg28[(3'h6):(3'h5)],
              $unsigned((($signed(reg5) | {wire3, reg11}) ?
                  (^$unsigned(reg13)) : reg15[(3'h6):(2'h2)]))})
            begin
              reg35 <= ({{(~&(-reg29)), ((|reg14) ^~ (~|reg13))}} ?
                  reg7 : reg32[(2'h3):(2'h3)]);
            end
          else
            begin
              reg35 <= (reg20[(1'h0):(1'h0)] > $signed((((reg9 ?
                      reg16 : reg20) ?
                  (reg10 + (8'hb6)) : reg18) ^ $signed(reg13[(4'hc):(1'h1)]))));
              reg36 <= ((reg12 * (reg10 ?
                      reg27 : (reg6[(2'h3):(2'h3)] ?
                          (^reg33) : (reg28 != (8'hb7))))) ?
                  wire4[(3'h5):(1'h1)] : ((|$signed((~^reg34))) * (~reg23)));
              reg37 <= reg10[(5'h10):(4'hc)];
              reg38 <= (~&{$signed($unsigned($signed(reg23)))});
            end
          reg39 <= reg6;
          reg40 <= $signed(reg36[(3'h4):(2'h2)]);
        end
      else
        begin
          reg30 <= $unsigned((8'hb0));
        end
      reg41 <= reg14[(2'h3):(1'h1)];
    end
  assign wire42 = (~(&(wire0 ~^ (reg8 || reg19[(1'h0):(1'h0)]))));
  assign wire43 = $unsigned($signed((~&((^~reg15) > $signed(reg15)))));
  module44 #() modinst68 (.wire46(reg32), .clk(clk), .wire45(reg40), .wire47(reg6), .y(wire67), .wire48(wire0));
  assign wire69 = (!($signed(($signed(reg12) ?
                      (reg18 ? reg7 : reg16) : (reg10 ?
                          reg5 : reg15))) | reg13));
  assign wire70 = $unsigned({reg22[(2'h3):(1'h0)]});
  assign wire71 = ((~|{$signed(wire70),
                          ({reg7, reg19} ? (reg8 >>> reg37) : wire4)}) ?
                      ($unsigned($unsigned((reg9 << reg24))) ?
                          $signed(($unsigned(wire42) & (reg35 ?
                              reg30 : (8'ha4)))) : reg7) : (^~{(reg20[(4'hc):(4'h9)] ^~ (reg28 ?
                              wire1 : reg34)),
                          $unsigned($unsigned(wire69))}));
  assign wire72 = (wire26[(3'h5):(2'h2)] || (&(^~wire67)));
  assign wire73 = (+(reg27[(2'h2):(1'h1)] ?
                      (wire71 ?
                          $unsigned(wire0[(2'h2):(1'h0)]) : (|reg30[(4'hc):(3'h7)])) : ((-$unsigned(wire3)) ?
                          reg12[(4'ha):(3'h4)] : (^~reg24))));
endmodule

module module44  (y, clk, wire48, wire47, wire46, wire45);
  output wire [(32'h102):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire48;
  input wire signed [(4'he):(1'h0)] wire47;
  input wire [(2'h2):(1'h0)] wire46;
  input wire signed [(5'h11):(1'h0)] wire45;
  wire signed [(5'h10):(1'h0)] wire66;
  wire [(4'he):(1'h0)] wire65;
  wire [(4'h9):(1'h0)] wire49;
  reg [(5'h12):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg54 = (1'h0);
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(5'h11):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg50 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire49,
                 reg64,
                 reg63,
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
                 (1'h0)};
  assign wire49 = $signed(wire45);
  always
    @(posedge clk) begin
      reg50 <= ((wire49[(1'h1):(1'h0)] ?
              wire47 : (wire49 <<< ({wire49, wire49} ?
                  $unsigned(wire45) : wire49))) ?
          (-$signed(($unsigned((8'hae)) >= wire48))) : (wire46[(1'h0):(1'h0)] ^~ (^~(^(^wire47)))));
      reg51 <= wire46;
      reg52 <= $unsigned(wire45);
      if ((((&$signed((wire45 ^ wire47))) << $signed((8'h9e))) ?
          $signed(wire48[(1'h1):(1'h0)]) : wire46[(1'h0):(1'h0)]))
        begin
          reg53 <= $signed($unsigned({$signed((wire45 <<< reg50)),
              ({wire48, wire46} ^~ $signed(wire48))}));
          if ({(reg51 ? wire49 : reg51[(2'h3):(1'h1)])})
            begin
              reg54 <= wire49;
              reg55 <= $signed(wire46);
              reg56 <= {$signed($signed(wire47)),
                  $unsigned({{$unsigned(reg55), (reg54 ? wire49 : reg53)},
                      $unsigned($unsigned(wire47))})};
              reg57 <= $unsigned(($signed(wire49[(1'h0):(1'h0)]) & reg52));
            end
          else
            begin
              reg54 <= wire48[(3'h5):(1'h1)];
            end
          if ($signed(wire45[(2'h3):(2'h2)]))
            begin
              reg58 <= $unsigned($signed($unsigned($signed(reg51))));
              reg59 <= $unsigned({(~|$signed((7'h40)))});
              reg60 <= reg54[(1'h0):(1'h0)];
              reg61 <= wire49[(3'h5):(3'h4)];
              reg62 <= reg57[(3'h4):(2'h2)];
            end
          else
            begin
              reg58 <= reg56;
              reg59 <= wire49[(3'h7):(3'h5)];
            end
        end
      else
        begin
          reg53 <= (~|reg53);
          reg54 <= $signed($unsigned(reg50));
        end
      if ((reg60[(4'hc):(2'h3)] ~^ (~&$signed($unsigned((8'hb6))))))
        begin
          reg63 <= (reg57 <<< (|reg59[(2'h2):(1'h1)]));
          reg64 <= reg55[(4'hd):(4'h8)];
        end
      else
        begin
          reg63 <= ((wire49[(2'h2):(1'h0)] ^~ $unsigned(wire49)) ?
              $unsigned({($signed(reg50) ?
                      ((8'had) | reg56) : reg57)}) : $signed($signed(((reg61 > wire46) ?
                  wire49[(1'h1):(1'h0)] : $unsigned(reg64)))));
        end
    end
  assign wire65 = wire46[(1'h1):(1'h1)];
  assign wire66 = $unsigned((reg60 < $signed(reg53)));
endmodule
