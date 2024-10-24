module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h2d8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire141;
  wire signed [(4'hb):(1'h0)] wire126;
  wire [(3'h7):(1'h0)] wire124;
  wire signed [(5'h11):(1'h0)] wire47;
  wire signed [(4'hb):(1'h0)] wire46;
  wire signed [(4'h8):(1'h0)] wire45;
  wire signed [(4'hf):(1'h0)] wire44;
  wire [(3'h5):(1'h0)] wire43;
  wire signed [(4'ha):(1'h0)] wire22;
  wire signed [(3'h4):(1'h0)] wire21;
  wire [(4'h9):(1'h0)] wire20;
  reg [(3'h6):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg138 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg134 = (1'h0);
  reg [(4'h8):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg132 = (1'h0);
  reg [(5'h12):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg129 = (1'h0);
  reg [(4'ha):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg5 = (1'h0);
  reg [(4'hd):(1'h0)] reg6 = (1'h0);
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(5'h14):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg42 = (1'h0);
  assign y = {wire141,
                 wire126,
                 wire124,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire22,
                 wire21,
                 wire20,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
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
                 reg23,
                 reg24,
                 reg25,
                 reg26,
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
                 reg42,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire3[(4'hc):(1'h1)];
      if (wire2)
        begin
          reg6 <= {$unsigned(({wire4[(2'h3):(2'h3)],
                  $unsigned((8'h9c))} ^~ {$signed(wire4), (~&(8'hab))})),
              ((~$signed(wire4[(3'h4):(1'h1)])) ? wire2[(1'h0):(1'h0)] : reg5)};
          reg7 <= wire1[(4'h9):(3'h6)];
          if ((($unsigned($signed(wire3[(4'h8):(3'h5)])) >= $signed($unsigned((&wire1)))) ?
              wire4 : reg6))
            begin
              reg8 <= $signed((&(wire0 ? wire1 : $unsigned($unsigned(wire0)))));
              reg9 <= (((wire2[(4'he):(2'h3)] != wire0) <<< (wire4[(2'h2):(1'h1)] >>> {$unsigned(wire2),
                      $unsigned(wire4)})) ?
                  wire2 : (reg8 <<< wire3));
            end
          else
            begin
              reg8 <= $signed((($unsigned((reg7 ? wire0 : wire0)) ?
                      $unsigned({(8'hb4), (8'ha7)}) : wire4[(1'h0):(1'h0)]) ?
                  reg7[(1'h0):(1'h0)] : (($unsigned(reg6) < (^wire2)) == reg6)));
              reg9 <= (($unsigned($signed($signed(wire1))) ? wire0 : wire0) ?
                  {(~$signed($signed(wire1))),
                      $unsigned(($signed(reg6) ?
                          {(8'ha4)} : (wire0 || reg7)))} : ($unsigned(($unsigned(wire3) ?
                          $signed(wire4) : (~&wire3))) ?
                      reg9[(4'hb):(4'hb)] : ((~^(reg9 != reg5)) ?
                          $signed($unsigned(wire1)) : {$unsigned(wire2)})));
            end
          reg10 <= wire1;
          if ((~|(($signed($signed(reg10)) ?
              ($signed(reg8) * (~|reg7)) : reg8) || ({(reg9 ? reg10 : wire2),
                  (reg9 ? wire3 : reg6)} ?
              $unsigned((|wire4)) : reg7[(2'h3):(1'h1)]))))
            begin
              reg11 <= reg5[(4'hd):(4'hc)];
              reg12 <= {((8'hab) > wire4)};
            end
          else
            begin
              reg11 <= ({(-(-$signed(reg11))), $unsigned(reg6)} != (reg7 ?
                  {reg6[(3'h6):(2'h3)]} : (~|({(7'h43)} < $unsigned((8'h9d))))));
              reg12 <= (8'hb2);
              reg13 <= {reg12[(3'h5):(1'h0)]};
              reg14 <= $unsigned($signed((^wire2[(1'h1):(1'h0)])));
              reg15 <= (~reg9[(3'h4):(3'h4)]);
            end
        end
      else
        begin
          if (reg5[(1'h1):(1'h0)])
            begin
              reg6 <= ((8'hba) >> wire2[(4'hc):(2'h3)]);
              reg7 <= (wire4[(3'h4):(3'h4)] ?
                  ({reg12} ?
                      $unsigned($unsigned($signed(reg15))) : (reg10[(3'h4):(3'h4)] <<< (reg9 ?
                          (reg15 + wire1) : (wire2 >= reg9)))) : {((reg15[(1'h1):(1'h0)] ?
                          (8'hb9) : $signed(reg7)) >>> (reg5[(4'h9):(2'h3)] || wire2[(4'hc):(4'ha)])),
                      {((reg6 ? wire1 : reg11) <<< wire3[(4'h9):(2'h3)])}});
              reg8 <= reg10;
              reg9 <= ($unsigned($signed((+(8'hb5)))) && (reg6[(3'h7):(3'h6)] | ($unsigned({(8'hbf)}) ?
                  ({(8'ha4), wire0} ? $unsigned((8'hbb)) : reg11) : (8'hbf))));
              reg10 <= reg10;
            end
          else
            begin
              reg6 <= ((~|(~($unsigned(reg10) ?
                  (reg11 != wire0) : $signed(reg14)))) >= $unsigned(reg13[(4'h8):(3'h5)]));
              reg7 <= reg9;
            end
          if (((8'hb9) ?
              ($signed((~^(reg6 <= wire3))) ^~ (($unsigned(reg14) ?
                  (reg12 ? wire2 : reg5) : (wire4 ?
                      reg8 : (8'ha7))) != wire4[(3'h4):(2'h3)])) : {{wire3[(4'hb):(4'hb)],
                      ($unsigned((7'h40)) - ((8'had) << (8'ha2)))},
                  ($signed((&(8'hb4))) + (8'hb9))}))
            begin
              reg11 <= $signed($signed((((wire3 ? reg6 : reg11) ?
                  (reg7 ? reg7 : reg15) : (8'hbd)) != (!reg9[(3'h4):(1'h0)]))));
              reg12 <= ((~$unsigned(reg6)) ?
                  (+(~|$unsigned(reg14[(2'h3):(1'h1)]))) : (((+$unsigned(reg10)) ~^ $unsigned((wire3 ?
                      wire2 : reg13))) - reg14));
            end
          else
            begin
              reg11 <= ((8'ha7) >= $unsigned({(-wire3)}));
            end
          reg13 <= ({reg8} ?
              (~|(^~($signed(reg15) <= (wire2 & reg12)))) : (^reg7[(4'h8):(1'h0)]));
        end
      reg16 <= (($unsigned($signed(wire4)) ?
              (~&reg11) : (~^$signed(reg12[(3'h5):(1'h0)]))) ?
          reg15[(3'h7):(2'h3)] : (-(({(8'hb7)} ?
                  $signed((8'hb8)) : $signed((7'h42))) ?
              $signed((~&reg8)) : wire0[(4'h9):(4'h9)])));
    end
  always
    @(posedge clk) begin
      reg17 <= ((|((-$unsigned(wire3)) ?
          reg14 : reg14)) ~^ ((reg14[(2'h2):(1'h1)] ?
              ({reg16} ?
                  $unsigned(reg13) : ((8'ha0) >= wire0)) : {(reg9 ^ reg6),
                  (~&(8'hbc))}) ?
          reg15 : (((wire2 ? (8'hb1) : reg13) == reg9) >= reg11)));
      reg18 <= $unsigned($unsigned(reg12[(4'hb):(3'h7)]));
      reg19 <= $signed(reg15);
    end
  assign wire20 = (&reg19[(2'h3):(1'h0)]);
  assign wire21 = (reg10 + $signed($signed((~^((8'hb0) << wire4)))));
  assign wire22 = {reg5[(4'hf):(4'he)]};
  always
    @(posedge clk) begin
      reg23 <= (((reg14 ^ (8'hbf)) ?
              $unsigned($unsigned({reg15,
                  reg15})) : (wire3[(3'h4):(1'h1)] >> $unsigned((reg7 ?
                  reg12 : reg17)))) ?
          wire21[(1'h1):(1'h0)] : (wire20[(1'h0):(1'h0)] ?
              $signed((-(^~reg13))) : (wire4 && $signed((reg16 ?
                  (8'hbe) : wire20)))));
      if ($unsigned(reg19))
        begin
          if ($unsigned(($signed((~^$signed((8'hae)))) > $unsigned($unsigned((|reg10))))))
            begin
              reg24 <= ($unsigned($unsigned({(wire2 ?
                      wire22 : wire20)})) ~^ wire0);
            end
          else
            begin
              reg24 <= (&($signed((8'hae)) >> {(reg24 ?
                      (reg9 - reg10) : (&reg8)),
                  (~reg16)}));
              reg25 <= reg18[(3'h4):(2'h3)];
              reg26 <= $signed({$signed(reg9)});
            end
          reg27 <= (~({$unsigned((~&wire4)),
              (reg16[(2'h2):(2'h2)] + wire4[(4'hb):(1'h1)])} >>> reg23));
          reg28 <= $signed((reg10 <<< ((reg15[(1'h0):(1'h0)] ?
              (^reg13) : (reg23 == reg26)) && $signed($unsigned(reg23)))));
          if ({((reg11 ^ reg17[(1'h0):(1'h0)]) ?
                  (((reg17 | reg7) ^~ $signed(reg26)) ?
                      {reg23[(3'h4):(1'h1)],
                          (-reg23)} : reg17) : $unsigned(wire0[(2'h2):(1'h0)]))})
            begin
              reg29 <= (((|$signed({reg26})) & (reg17 ^~ wire2[(4'hc):(4'h9)])) ?
                  ((((reg11 ? (7'h43) : reg12) ^~ (8'hac)) ?
                      $signed((~&reg28)) : $unsigned($unsigned(wire3))) != ($unsigned(reg26[(1'h0):(1'h0)]) >>> (|{reg19,
                      (7'h43)}))) : ((8'ha5) >>> ((8'hac) ?
                      (8'ha8) : (wire20 ? $unsigned(reg18) : (8'hb5)))));
            end
          else
            begin
              reg29 <= (reg26 ?
                  reg29 : ($unsigned({(wire3 ?
                          reg25 : wire22)}) >= wire0[(5'h13):(4'hc)]));
              reg30 <= (reg5 << (!$signed((~^(wire20 >> wire20)))));
            end
          reg31 <= {$signed((8'hb6)), wire4};
        end
      else
        begin
          reg24 <= reg9;
          reg25 <= $signed((^(((reg13 ? reg17 : reg12) > (^reg8)) ?
              $unsigned($signed(wire2)) : $unsigned($signed(reg27)))));
          if (($signed(($signed((-reg9)) ?
                  wire20[(3'h6):(2'h3)] : ((reg12 ?
                      reg26 : reg24) >= (~|reg27)))) ?
              (~(+$signed($unsigned(reg26)))) : $signed(((|reg6[(1'h1):(1'h0)]) - (!(^~reg30))))))
            begin
              reg26 <= ($signed($signed($signed((reg30 ?
                  reg7 : (8'hae))))) && $unsigned((~|$signed((reg5 ?
                  reg7 : reg18)))));
            end
          else
            begin
              reg26 <= $unsigned(reg16);
              reg27 <= reg28;
              reg28 <= (~^reg13);
            end
          reg29 <= $signed($unsigned(reg31[(1'h0):(1'h0)]));
          reg30 <= (^~((($unsigned(reg24) << reg9[(1'h1):(1'h0)]) + $unsigned((reg19 ~^ reg27))) ?
              $unsigned(($signed(reg31) != ((8'hbd) ?
                  reg11 : reg30))) : ((8'ha0) ?
                  (~|reg8) : ((|reg31) ?
                      (reg9 ? reg7 : (7'h41)) : $unsigned(wire2)))));
        end
      if ((^~$unsigned({wire20[(4'h8):(2'h3)],
          $signed(((8'ha9) ? wire2 : reg29))})))
        begin
          reg32 <= (^~wire3[(4'he):(1'h0)]);
          if ((reg23[(3'h5):(1'h0)] >> $unsigned((~&$unsigned($unsigned((8'ha9)))))))
            begin
              reg33 <= $unsigned(wire0[(3'h4):(1'h1)]);
            end
          else
            begin
              reg33 <= ($unsigned(reg24[(4'h8):(3'h7)]) ?
                  (reg14 ^~ ((reg16[(2'h2):(2'h2)] ?
                      $signed(wire4) : (reg7 ?
                          reg32 : reg27)) != $signed(reg17))) : wire3[(1'h1):(1'h1)]);
              reg34 <= wire21[(1'h1):(1'h0)];
              reg35 <= reg33;
              reg36 <= reg9;
            end
          if ((|reg10))
            begin
              reg37 <= reg6;
              reg38 <= ((reg32[(3'h4):(2'h3)] ^ (&reg6)) << (~|({(-reg16),
                  (~|(8'hb7))} * reg12[(2'h2):(1'h1)])));
              reg39 <= $unsigned(((^$signed((reg7 ? wire4 : reg18))) ?
                  (((~reg30) | wire4[(4'h8):(1'h0)]) ?
                      ((~|wire22) ?
                          (+(8'ha9)) : reg36[(5'h10):(5'h10)]) : $unsigned((reg8 >= reg15))) : wire1));
            end
          else
            begin
              reg37 <= (+wire2[(4'ha):(3'h5)]);
              reg38 <= {(^~$signed((((8'hbb) * reg36) > ((8'hb6) != reg23)))),
                  reg33};
              reg39 <= $signed(($unsigned((^~$unsigned(reg5))) < ($signed(wire3) || {reg8[(4'hb):(2'h3)],
                  ((7'h43) ? (8'ha0) : (8'hb5))})));
              reg40 <= (($signed(({reg15, reg17} ? $signed(reg30) : {reg10})) ?
                      $unsigned(reg9[(3'h4):(1'h0)]) : reg8[(4'hd):(1'h0)]) ?
                  ((!((reg5 << reg5) ? (^~reg37) : {reg13, reg7})) ?
                      reg9[(1'h0):(1'h0)] : (~^(reg34[(3'h7):(3'h7)] > reg30))) : $signed((reg36[(4'ha):(4'h8)] ?
                      (wire22[(4'h9):(1'h1)] == wire2[(5'h12):(4'h9)]) : reg24[(3'h4):(1'h0)])));
              reg41 <= ($signed(({$unsigned(reg32)} * $unsigned($unsigned(reg10)))) ^ reg18[(1'h1):(1'h0)]);
            end
          reg42 <= $unsigned(reg27[(1'h0):(1'h0)]);
        end
      else
        begin
          reg32 <= wire3;
          if ($unsigned(reg24[(1'h0):(1'h0)]))
            begin
              reg33 <= $signed(reg19[(1'h1):(1'h0)]);
              reg34 <= $unsigned($signed($signed({(reg5 != (8'hb3))})));
            end
          else
            begin
              reg33 <= $unsigned($unsigned(($signed((^reg42)) || wire20)));
            end
          reg35 <= $signed($unsigned($signed((reg35[(2'h3):(2'h3)] > (&wire0)))));
          if (reg5[(4'hd):(3'h4)])
            begin
              reg36 <= $signed((^~wire22[(3'h4):(1'h0)]));
              reg37 <= (~&{$unsigned(($unsigned((7'h43)) ?
                      reg9 : (reg26 ? reg14 : reg34))),
                  (|$unsigned($unsigned(wire1)))});
            end
          else
            begin
              reg36 <= reg26[(4'h8):(1'h1)];
              reg37 <= (~&(reg36[(4'hc):(3'h7)] ?
                  $signed($signed((~&(8'haf)))) : (((reg27 ? wire20 : wire1) ?
                      $unsigned(reg14) : (reg35 ?
                          wire2 : (8'haa))) + $unsigned({reg24, reg11}))));
              reg38 <= reg30[(5'h10):(4'hd)];
            end
          if (((^(|(!reg33))) + reg16[(2'h2):(2'h2)]))
            begin
              reg39 <= {(($signed(((8'ha4) ? reg32 : reg38)) ?
                          $signed({(8'hbd),
                              reg40}) : $signed(reg37[(5'h12):(5'h10)])) ?
                      $unsigned(reg30) : $signed((wire20[(1'h0):(1'h0)] <= reg42))),
                  $signed(reg17)};
              reg40 <= (wire0 ?
                  $signed(($unsigned((~|reg18)) - (wire22 ?
                      (reg16 + reg5) : {reg37}))) : ($unsigned(reg42) ?
                      reg27[(2'h2):(1'h1)] : (|($signed(wire20) ?
                          (wire1 ? wire2 : reg16) : reg35))));
              reg41 <= reg25[(1'h1):(1'h0)];
            end
          else
            begin
              reg39 <= $unsigned(reg18);
            end
        end
    end
  assign wire43 = ((+($unsigned(reg13[(4'ha):(3'h7)]) < (wire1[(5'h11):(1'h1)] ?
                          (~reg33) : reg34))) ?
                      reg11[(1'h0):(1'h0)] : (!reg14));
  assign wire44 = (~wire0[(5'h14):(2'h3)]);
  assign wire45 = reg9;
  assign wire46 = {$signed($signed((|(reg19 ? reg38 : wire3))))};
  assign wire47 = $unsigned(((8'hbd) | $signed(({reg28,
                      (8'hb6)} ~^ (reg17 <= reg11)))));
  module48 #() modinst125 (.wire50(wire44), .wire52(reg7), .y(wire124), .wire49(reg29), .clk(clk), .wire51(wire43), .wire53(reg28));
  assign wire126 = $signed((reg9[(2'h3):(2'h3)] | (!$unsigned($unsigned(reg10)))));
  always
    @(posedge clk) begin
      reg127 <= (-(~(!($unsigned(wire4) ?
          (wire1 >> wire4) : (reg19 & reg39)))));
      reg128 <= {$signed(((^~(reg42 ?
              (8'haa) : wire43)) >> ($unsigned(reg28) ^~ (reg5 < reg29))))};
      reg129 <= $unsigned($unsigned((~^reg27)));
      if ((reg39 ?
          (wire0 ?
              reg9 : $signed((wire45[(3'h6):(2'h3)] * reg127[(3'h6):(3'h4)]))) : ($signed(((reg32 <= wire124) >> (^~reg129))) != (|reg24))))
        begin
          reg130 <= (8'hb1);
          if ($signed($signed((~^$unsigned($unsigned((8'ha4)))))))
            begin
              reg131 <= (~|(^~$unsigned(reg17[(3'h5):(3'h4)])));
              reg132 <= (+({reg127, reg34} || (+wire44[(4'h8):(3'h5)])));
              reg133 <= ((^reg13) ?
                  (~$unsigned(((reg27 <= reg11) - (wire3 ?
                      reg129 : reg129)))) : $unsigned($signed((!((8'hbc) ?
                      reg129 : (8'hb4))))));
            end
          else
            begin
              reg131 <= (((~$unsigned($signed(reg39))) ?
                      (reg28[(3'h6):(3'h5)] ?
                          (reg8 ?
                              (wire22 * wire45) : $signed(reg131)) : $unsigned((8'hb2))) : ($signed(((8'hbb) ?
                              wire22 : wire124)) ?
                          (8'ha8) : {$signed((8'hb5))})) ?
                  ((|wire126) ?
                      ((reg32[(3'h5):(2'h3)] ?
                          $unsigned(reg127) : (&reg15)) ^ $unsigned({wire2,
                          reg17})) : reg130[(5'h12):(4'hd)]) : $unsigned($unsigned(((reg6 == reg37) ~^ $signed(reg10)))));
              reg132 <= $signed(reg19);
              reg133 <= reg17[(3'h7):(3'h6)];
              reg134 <= (reg30[(1'h0):(1'h0)] ?
                  $unsigned(wire21[(2'h3):(1'h0)]) : ({reg11[(4'he):(3'h6)]} & (((+reg30) ^~ reg35) << reg36[(1'h0):(1'h0)])));
              reg135 <= ($unsigned((+wire44)) ?
                  (+$signed($unsigned(reg128[(4'h9):(3'h7)]))) : wire43[(2'h2):(1'h0)]);
            end
          if ($signed((&reg16)))
            begin
              reg136 <= ((8'had) ?
                  $unsigned(($unsigned((reg128 ~^ wire124)) ?
                      ($unsigned(reg6) ?
                          $unsigned(reg42) : wire45[(2'h2):(1'h0)]) : $unsigned(reg128[(2'h2):(2'h2)]))) : reg134[(3'h4):(3'h4)]);
              reg137 <= reg19[(2'h3):(2'h3)];
              reg138 <= (($unsigned(reg40) ?
                      $unsigned(wire124) : reg25[(1'h1):(1'h0)]) ?
                  reg132[(4'h8):(2'h3)] : {($unsigned($signed(wire21)) ?
                          $unsigned($signed(reg13)) : {(8'hbf), (~|reg14)}),
                      $signed(((|reg30) <= $signed(reg41)))});
            end
          else
            begin
              reg136 <= reg26;
              reg137 <= reg38;
            end
          if ($unsigned($unsigned((($unsigned(wire1) ~^ wire44[(2'h3):(1'h1)]) >>> ($signed(wire3) + (~&reg19))))))
            begin
              reg139 <= ({(reg10 ?
                          $unsigned((reg26 ?
                              reg19 : wire46)) : $unsigned({reg23, reg34}))} ?
                  $signed((reg40[(5'h13):(3'h4)] ^ (8'haa))) : reg35[(2'h3):(2'h3)]);
            end
          else
            begin
              reg139 <= (!($unsigned(($unsigned(reg19) <<< {wire4, reg135})) ?
                  (8'ha9) : $unsigned(wire3[(4'h8):(3'h5)])));
            end
        end
      else
        begin
          reg130 <= (reg17[(3'h5):(3'h4)] && reg13);
          reg131 <= reg25[(2'h3):(1'h1)];
        end
      reg140 <= $unsigned(wire45[(3'h6):(3'h4)]);
    end
  assign wire141 = wire22[(4'h8):(3'h5)];
endmodule

module module48
#(parameter param122 = (({(((8'ha8) ? (7'h43) : (8'hb9)) ? ((8'ha4) ~^ (8'ha6)) : (~|(8'haf))), {(|(8'hb5)), ((7'h43) + (7'h41))}} >> ((((8'haa) == (7'h43)) ? ((8'h9f) ? (8'ha1) : (8'hb5)) : ((8'hb1) ? (8'hbd) : (8'ha5))) + ({(8'ha8)} ? ((8'h9d) << (8'h9f)) : (|(8'ha9))))) == ((!(!{(7'h41), (8'haf)})) ? (((|(8'hbe)) && ((7'h44) ? (7'h43) : (7'h43))) | {(&(8'ha5))}) : (((|(8'hb1)) <<< ((8'hb4) && (8'hb9))) ~^ (~^{(8'ha6)})))), 
parameter param123 = ((^param122) & {((param122 ? (param122 <= param122) : (param122 ? param122 : param122)) ? (param122 ^ param122) : ((param122 ? param122 : (8'hbc)) + (param122 + param122)))}))
(y, clk, wire49, wire50, wire51, wire52, wire53);
  output wire [(32'h152):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire49;
  input wire signed [(4'hf):(1'h0)] wire50;
  input wire signed [(3'h5):(1'h0)] wire51;
  input wire [(4'hb):(1'h0)] wire52;
  input wire [(5'h10):(1'h0)] wire53;
  wire signed [(4'ha):(1'h0)] wire121;
  wire signed [(4'h9):(1'h0)] wire120;
  wire [(4'he):(1'h0)] wire119;
  wire [(4'he):(1'h0)] wire118;
  wire signed [(3'h6):(1'h0)] wire117;
  wire signed [(4'hd):(1'h0)] wire54;
  wire [(4'hb):(1'h0)] wire55;
  wire [(5'h12):(1'h0)] wire56;
  wire signed [(3'h7):(1'h0)] wire57;
  wire signed [(5'h15):(1'h0)] wire68;
  wire signed [(4'hf):(1'h0)] wire69;
  wire [(4'h8):(1'h0)] wire100;
  wire [(4'he):(1'h0)] wire102;
  wire [(4'h9):(1'h0)] wire103;
  wire [(4'hd):(1'h0)] wire115;
  reg signed [(5'h10):(1'h0)] reg58 = (1'h0);
  reg [(4'he):(1'h0)] reg59 = (1'h0);
  reg [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(5'h11):(1'h0)] reg62 = (1'h0);
  reg [(4'hf):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg67 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire54,
                 wire55,
                 wire56,
                 wire57,
                 wire68,
                 wire69,
                 wire100,
                 wire102,
                 wire103,
                 wire115,
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
                 (1'h0)};
  assign wire54 = (~|(wire50[(3'h7):(2'h3)] ?
                      (wire50 ?
                          (+(!wire49)) : ((wire50 <<< wire50) ?
                              ((8'h9d) ?
                                  wire50 : wire52) : wire51)) : wire52[(4'h9):(2'h2)]));
  assign wire55 = {$signed(wire54[(1'h0):(1'h0)]),
                      (((wire49 <<< wire52) ? (^wire51) : wire53) * wire51)};
  assign wire56 = (!$signed($signed(wire54)));
  assign wire57 = {$unsigned(((^$unsigned(wire54)) * wire54)),
                      (~^(wire55 ~^ wire55))};
  always
    @(posedge clk) begin
      reg58 <= {(8'haa)};
      reg59 <= wire54[(1'h1):(1'h1)];
      if ($unsigned({(-wire54[(1'h1):(1'h1)])}))
        begin
          reg60 <= $signed(reg59[(1'h1):(1'h1)]);
          reg61 <= (~|$unsigned((8'h9e)));
        end
      else
        begin
          if ($signed(wire49[(1'h0):(1'h0)]))
            begin
              reg60 <= $signed($unsigned((!$unsigned($signed(wire52)))));
              reg61 <= (~reg60[(2'h3):(2'h3)]);
              reg62 <= $unsigned((($signed((wire50 == wire55)) <<< reg61[(4'h9):(3'h6)]) | (((^~(8'hb2)) ?
                      wire55 : $signed(reg61)) ?
                  ($unsigned(wire57) ?
                      $unsigned(wire55) : (wire53 == wire54)) : {$signed(wire53)})));
              reg63 <= (wire56[(4'hf):(4'he)] ?
                  reg59 : (|reg59[(1'h1):(1'h1)]));
            end
          else
            begin
              reg60 <= $unsigned(((|$signed((wire50 ?
                  wire50 : wire57))) << $signed((wire51[(3'h5):(1'h0)] <= (wire53 ?
                  (8'hbb) : reg63)))));
              reg61 <= $signed(wire50);
              reg62 <= (wire49 ^ $signed($unsigned($unsigned((wire55 ?
                  (8'hb0) : wire52)))));
              reg63 <= wire53;
              reg64 <= $unsigned($unsigned({wire54, {$signed(reg63)}}));
            end
          reg65 <= {(($signed((reg63 & wire55)) ?
                  {{wire57, (8'haa)}} : (wire57[(1'h1):(1'h0)] ?
                      $unsigned(wire54) : $unsigned(wire51))) | {(wire56 * reg58),
                  (|{wire53, reg60})}),
              $unsigned($unsigned(($signed(reg63) && (wire57 ?
                  wire57 : reg62))))};
          reg66 <= reg61;
        end
      reg67 <= $signed(reg60[(2'h2):(1'h0)]);
    end
  assign wire68 = $signed(wire50[(1'h0):(1'h0)]);
  assign wire69 = $signed(wire68[(4'hc):(3'h7)]);
  module70 #() modinst101 (.y(wire100), .wire74(wire53), .clk(clk), .wire73(wire49), .wire72(wire68), .wire71(wire54));
  assign wire102 = reg58;
  assign wire103 = {(~&$unsigned($unsigned((wire68 ? reg58 : wire68)))),
                       (~^wire69)};
  module104 #() modinst116 (wire115, clk, reg65, wire50, reg60, reg59);
  assign wire117 = (wire49[(3'h7):(3'h6)] ?
                       ($unsigned($signed((wire102 ? wire51 : reg62))) ?
                           reg61[(5'h13):(1'h1)] : (&$signed((reg63 ?
                               reg64 : (8'hb2))))) : {wire52[(3'h4):(1'h0)],
                           ({(wire54 ? wire50 : wire53),
                               $signed(reg65)} <<< ((wire56 ?
                               reg64 : wire50) != (wire54 == (8'h9d))))});
  assign wire118 = ((reg58 ?
                           ((~^(|reg58)) ?
                               $signed((wire117 ?
                                   reg66 : wire49)) : {$unsigned(reg64)}) : $unsigned($signed($unsigned(wire51)))) ?
                       (-wire50) : wire68[(1'h1):(1'h1)]);
  assign wire119 = ($unsigned(wire57) + {$unsigned(reg60),
                       $unsigned(reg62[(4'h9):(1'h1)])});
  assign wire120 = $unsigned(reg60[(1'h0):(1'h0)]);
  assign wire121 = (~wire119);
endmodule

module module104
#(parameter param113 = ((((&((8'ha6) ? (8'hbc) : (8'hbd))) ? ({(7'h41)} != ((8'h9c) ? (8'hb0) : (7'h42))) : (((8'ha5) ? (8'ha0) : (8'h9e)) ? (~&(8'hab)) : ((8'ha8) >> (8'hbe)))) < (~({(8'haa)} ~^ ((8'ha0) >>> (8'hb2))))) ? {(((~^(8'ha4)) ^~ ((8'had) ? (8'hb4) : (8'hbb))) >>> (((7'h42) <<< (8'h9c)) & {(8'hb5)})), (!{{(8'haa), (8'ha7)}})} : (~|{(-(!(8'hbf))), (-((8'ha5) ? (8'ha0) : (8'hbf)))})), 
parameter param114 = (&(&{((param113 ? param113 : param113) <= (param113 <<< (7'h40)))})))
(y, clk, wire108, wire107, wire106, wire105);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire108;
  input wire [(4'hf):(1'h0)] wire107;
  input wire [(3'h6):(1'h0)] wire106;
  input wire [(4'he):(1'h0)] wire105;
  wire signed [(5'h10):(1'h0)] wire112;
  wire signed [(4'hc):(1'h0)] wire111;
  wire signed [(5'h10):(1'h0)] wire110;
  wire [(5'h12):(1'h0)] wire109;
  assign y = {wire112, wire111, wire110, wire109, (1'h0)};
  assign wire109 = $unsigned($unsigned((8'ha5)));
  assign wire110 = {(($unsigned(wire107[(4'h8):(2'h2)]) ?
                               ($unsigned(wire109) - (wire107 || wire109)) : wire108[(4'he):(4'h8)]) ?
                           $unsigned((8'hb9)) : {(~$unsigned(wire105)),
                               $signed($unsigned(wire109))}),
                       wire107[(2'h2):(2'h2)]};
  assign wire111 = (^$signed((wire107[(2'h2):(1'h0)] ?
                       wire106[(3'h6):(1'h0)] : wire106[(2'h3):(2'h3)])));
  assign wire112 = $unsigned(((~^$signed(wire105[(4'h9):(4'h9)])) > (8'ha2)));
endmodule

module module70
#(parameter param98 = ((8'haa) >= (&(+{((8'hbe) ? (8'hb3) : (8'h9d))}))), 
parameter param99 = (((((param98 ? param98 : param98) ? (-param98) : (param98 ? param98 : param98)) ~^ {(^~param98), ((8'hb8) ? (7'h41) : param98)}) && (param98 < ({param98} <<< (param98 ? param98 : param98)))) * param98))
(y, clk, wire74, wire73, wire72, wire71);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire74;
  input wire [(4'hd):(1'h0)] wire73;
  input wire signed [(5'h15):(1'h0)] wire72;
  input wire signed [(4'hd):(1'h0)] wire71;
  wire [(4'hd):(1'h0)] wire97;
  wire [(2'h2):(1'h0)] wire96;
  wire signed [(3'h4):(1'h0)] wire95;
  wire signed [(5'h14):(1'h0)] wire94;
  wire [(4'hf):(1'h0)] wire93;
  wire [(4'hd):(1'h0)] wire79;
  wire [(2'h3):(1'h0)] wire78;
  wire signed [(5'h14):(1'h0)] wire77;
  wire [(4'h9):(1'h0)] wire76;
  wire signed [(5'h14):(1'h0)] wire75;
  reg [(4'hc):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg91 = (1'h0);
  reg [(3'h7):(1'h0)] reg90 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg89 = (1'h0);
  reg [(5'h14):(1'h0)] reg88 = (1'h0);
  reg [(5'h12):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg86 = (1'h0);
  reg [(4'hc):(1'h0)] reg85 = (1'h0);
  reg signed [(4'he):(1'h0)] reg84 = (1'h0);
  reg [(5'h13):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg81 = (1'h0);
  reg [(5'h11):(1'h0)] reg80 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 (1'h0)};
  assign wire75 = ((^wire73) + $unsigned((wire71[(4'h9):(1'h0)] ?
                      wire72[(4'h8):(2'h2)] : wire71)));
  assign wire76 = {$unsigned(wire75[(4'hb):(3'h7)]), $unsigned((+(8'hb3)))};
  assign wire77 = ($signed((^~(&$signed(wire72)))) ? wire75 : wire74);
  assign wire78 = ($signed((wire76[(2'h3):(2'h2)] ?
                      wire71[(4'hd):(4'h9)] : $unsigned(wire72))) || (|(8'h9e)));
  assign wire79 = ((wire72[(4'ha):(4'ha)] ?
                      (wire77 ?
                          wire74 : (wire71 << (8'haf))) : $signed($unsigned($signed(wire78)))) > $signed((((~|wire71) ?
                          wire75 : (+wire76)) ?
                      (wire72 ?
                          $signed(wire74) : wire77[(4'hb):(3'h5)]) : wire72[(5'h10):(4'hd)])));
  always
    @(posedge clk) begin
      reg80 <= wire75[(4'he):(4'hb)];
      reg81 <= (wire79 ? wire74 : wire76);
      reg82 <= $unsigned($signed(wire72[(5'h15):(4'hb)]));
      reg83 <= (($signed(wire73) ?
          $signed(wire71) : (~(wire79 ?
              {wire71} : $unsigned(reg80)))) != $unsigned($signed(wire74)));
      if ((|{(reg83[(4'hd):(1'h0)] ?
              {$signed(reg83), (^~reg81)} : (~^$unsigned(wire77)))}))
        begin
          reg84 <= $signed(wire71[(4'h8):(3'h5)]);
          reg85 <= $unsigned(({reg81} ?
              ((~^wire71) ?
                  ((~wire73) ?
                      (reg82 ?
                          wire73 : wire77) : (8'hb4)) : $signed({(8'ha3)})) : (^~$unsigned(((8'hb6) ?
                  wire77 : (8'hb5))))));
          reg86 <= ($signed(((^~{reg81,
              wire79}) <<< $unsigned(wire74))) <<< $unsigned(wire71[(4'h8):(3'h4)]));
          if ((({$signed(wire78[(2'h2):(1'h0)])} + (~^reg86[(1'h1):(1'h0)])) ?
              $signed((wire77 > $signed((wire79 ?
                  wire73 : wire78)))) : {$signed(wire73[(4'ha):(1'h1)])}))
            begin
              reg87 <= {wire76[(3'h7):(3'h5)],
                  $signed(($signed({wire76, reg86}) ?
                      $unsigned((wire76 & wire72)) : (8'ha7)))};
              reg88 <= {reg87[(1'h1):(1'h0)]};
              reg89 <= ($unsigned(wire78[(2'h2):(1'h1)]) ?
                  ($unsigned((~(-wire76))) >> reg84) : ((wire73[(1'h1):(1'h0)] ?
                      (-$unsigned(reg80)) : $signed(reg86)) & {(wire77 << $signed(reg81)),
                      $signed(reg82)}));
            end
          else
            begin
              reg87 <= $unsigned($signed((wire71 ?
                  (^~reg87) : $unsigned(wire78[(1'h1):(1'h1)]))));
              reg88 <= $signed(reg87[(4'he):(3'h4)]);
            end
        end
      else
        begin
          reg84 <= (((+$signed(reg87)) ?
              $signed($unsigned($unsigned(wire71))) : wire75) >= $signed((8'hbc)));
          if ($signed(($signed(reg81[(1'h1):(1'h1)]) ^ ((wire71[(4'hd):(4'hd)] ?
              reg88[(5'h10):(5'h10)] : $signed(wire78)) != (8'hb7)))))
            begin
              reg85 <= $signed((~($signed({(8'hac)}) ?
                  ($unsigned((8'ha9)) * {reg85, wire72}) : (~^wire78))));
            end
          else
            begin
              reg85 <= wire74[(1'h1):(1'h0)];
              reg86 <= $unsigned(reg81);
              reg87 <= ($unsigned(reg88[(5'h12):(4'h8)]) | (^{wire74[(3'h4):(1'h0)]}));
            end
          if ($unsigned(({($unsigned(wire76) != wire73),
                  {wire73[(4'hd):(1'h1)]}} ?
              wire73 : ((!wire73) != ((reg81 ? (8'ha0) : wire74) ?
                  $unsigned(reg88) : ((8'h9d) ? reg88 : reg87))))))
            begin
              reg88 <= $signed((!$signed(wire71[(4'h9):(2'h2)])));
              reg89 <= (~|(($signed($signed(wire78)) | $unsigned(reg87[(3'h7):(1'h0)])) && (((reg86 ?
                          reg81 : reg86) ?
                      $unsigned((8'h9e)) : $unsigned(wire72)) ?
                  $unsigned($signed((8'haf))) : $unsigned(wire75[(1'h0):(1'h0)]))));
              reg90 <= wire73;
            end
          else
            begin
              reg88 <= {($unsigned(reg83[(2'h3):(2'h2)]) ^~ (($unsigned(reg81) ?
                          wire71[(1'h0):(1'h0)] : $unsigned(reg82)) ?
                      {(reg86 ? reg83 : reg86), (reg84 ^ reg90)} : (!(wire72 ?
                          reg82 : wire72))))};
            end
          reg91 <= $unsigned(({{$unsigned(reg82),
                  {wire73}}} != $signed($signed((~|(8'hac))))));
          reg92 <= (~|$signed((((|(8'ha2)) - $unsigned(wire73)) ~^ (+wire78[(2'h3):(2'h3)]))));
        end
    end
  assign wire93 = (-reg82[(1'h1):(1'h1)]);
  assign wire94 = $unsigned(((reg84[(3'h5):(2'h2)] >= $unsigned((wire74 ?
                      wire76 : reg87))) + ($unsigned(wire79[(2'h2):(1'h0)]) * {reg82,
                      wire75[(4'hd):(2'h3)]})));
  assign wire95 = (reg89[(2'h2):(1'h1)] << (reg87[(4'hf):(3'h7)] ?
                      $signed($signed((~&wire79))) : (wire78 ?
                          (^$unsigned(reg92)) : (+(wire74 & reg83)))));
  assign wire96 = reg91[(1'h0):(1'h0)];
  assign wire97 = reg82[(2'h2):(2'h2)];
endmodule
