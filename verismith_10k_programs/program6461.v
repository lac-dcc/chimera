module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h343):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire137;
  wire [(2'h3):(1'h0)] wire126;
  wire signed [(4'he):(1'h0)] wire125;
  wire signed [(3'h7):(1'h0)] wire123;
  wire signed [(3'h6):(1'h0)] wire56;
  wire signed [(2'h2):(1'h0)] wire55;
  wire signed [(5'h11):(1'h0)] wire54;
  wire [(5'h11):(1'h0)] wire53;
  wire [(4'h8):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire51;
  wire signed [(3'h7):(1'h0)] wire37;
  wire [(5'h12):(1'h0)] wire36;
  wire signed [(4'ha):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire21;
  wire [(3'h5):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire4;
  reg signed [(5'h10):(1'h0)] reg144 = (1'h0);
  reg [(3'h4):(1'h0)] reg143 = (1'h0);
  reg [(5'h15):(1'h0)] reg142 = (1'h0);
  reg [(5'h14):(1'h0)] reg141 = (1'h0);
  reg [(5'h11):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg139 = (1'h0);
  reg [(4'he):(1'h0)] reg138 = (1'h0);
  reg [(4'ha):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg135 = (1'h0);
  reg [(5'h14):(1'h0)] reg134 = (1'h0);
  reg [(4'hd):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg132 = (1'h0);
  reg [(4'h8):(1'h0)] reg131 = (1'h0);
  reg [(3'h4):(1'h0)] reg130 = (1'h0);
  reg [(4'h9):(1'h0)] reg129 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg127 = (1'h0);
  reg [(5'h12):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg7 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg39 = (1'h0);
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(3'h7):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg44 = (1'h0);
  reg [(4'h8):(1'h0)] reg45 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg47 = (1'h0);
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg49 = (1'h0);
  reg signed [(4'he):(1'h0)] reg50 = (1'h0);
  assign y = {wire137,
                 wire126,
                 wire125,
                 wire123,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire37,
                 wire36,
                 wire23,
                 wire22,
                 wire21,
                 wire5,
                 wire4,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
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
                 (1'h0)};
  assign wire4 = ((~^$unsigned($unsigned((wire3 ?
                     wire1 : wire3)))) <<< {$unsigned(wire2[(3'h7):(1'h1)])});
  assign wire5 = (wire1[(1'h0):(1'h0)] ?
                     wire2 : $signed($unsigned((^~(-wire4)))));
  always
    @(posedge clk) begin
      reg6 <= (8'h9e);
      reg7 <= $unsigned($signed(($unsigned(wire0) <= (wire2[(4'ha):(3'h6)] ?
          (wire4 ? wire0 : reg6) : wire1[(3'h6):(2'h3)]))));
      if ($signed($unsigned($signed($signed({wire1, wire0})))))
        begin
          reg8 <= $signed((((+wire0) ? (&wire2) : (^~(wire1 > wire4))) ?
              wire5[(2'h2):(1'h1)] : (&$signed(wire2[(2'h2):(2'h2)]))));
          if (wire4)
            begin
              reg9 <= wire5[(1'h0):(1'h0)];
              reg10 <= ($signed((wire4[(3'h5):(1'h1)] <= $signed((reg7 ?
                  reg7 : (7'h40))))) != {$signed((~reg8[(4'h8):(3'h7)]))});
            end
          else
            begin
              reg9 <= {reg9,
                  ($unsigned({(reg9 ? reg10 : reg10)}) < reg8[(3'h7):(2'h2)])};
              reg10 <= wire4[(2'h3):(1'h0)];
              reg11 <= $signed(((-$unsigned({(8'hb3), reg7})) ?
                  (8'ha4) : reg8[(3'h4):(3'h4)]));
            end
          if ($signed($signed(reg9[(5'h10):(2'h3)])))
            begin
              reg12 <= (8'hbf);
              reg13 <= $signed($unsigned(($unsigned($signed(reg12)) ?
                  reg11 : wire3)));
              reg14 <= (wire1 ? reg10 : wire4[(1'h1):(1'h0)]);
              reg15 <= ($signed((~^reg9[(4'ha):(3'h4)])) ?
                  $signed(($signed(wire4) ?
                      (reg12[(3'h7):(1'h0)] ?
                          $unsigned(reg11) : reg11) : reg14)) : $unsigned((~|wire4[(1'h0):(1'h0)])));
            end
          else
            begin
              reg12 <= $unsigned(wire4);
              reg13 <= reg12[(3'h7):(3'h5)];
              reg14 <= ((^reg12) ?
                  $signed(reg6[(2'h2):(2'h2)]) : wire3[(2'h3):(1'h1)]);
              reg15 <= reg14[(2'h3):(1'h1)];
            end
          reg16 <= (+reg6[(3'h5):(3'h5)]);
          if ({(($signed({reg8}) ?
                      ({reg12} <<< (reg12 ?
                          (8'haa) : wire1)) : wire1[(2'h2):(1'h1)]) ?
                  $signed($unsigned(reg12)) : $signed({(^~reg8), reg11})),
              reg11})
            begin
              reg17 <= ($signed(reg9[(3'h4):(1'h1)]) ?
                  ((~&wire2) & ((reg13 ?
                      $signed((8'hb7)) : $signed(reg8)) != ((^(8'ha5)) == $signed(reg10)))) : {$signed({(reg16 <= reg13),
                          $signed((7'h44))}),
                      ((((8'hb1) ? reg9 : (8'ha6)) ?
                              reg6[(5'h10):(4'hb)] : reg7[(1'h0):(1'h0)]) ?
                          (wire4 ? $signed(reg7) : $unsigned(reg8)) : ((reg13 ?
                              reg14 : reg16) ^ (^~wire3)))});
              reg18 <= (~(reg7[(2'h2):(1'h0)] << $signed((wire5[(2'h3):(2'h2)] ?
                  (reg13 || wire4) : {reg14}))));
            end
          else
            begin
              reg17 <= (wire4[(1'h0):(1'h0)] ?
                  reg9[(5'h10):(1'h0)] : wire1[(3'h5):(1'h0)]);
            end
        end
      else
        begin
          if (reg18)
            begin
              reg8 <= reg8;
              reg9 <= reg16;
              reg10 <= $signed($unsigned($signed($signed((!reg13)))));
              reg11 <= wire0[(5'h12):(4'he)];
            end
          else
            begin
              reg8 <= reg12;
              reg9 <= reg13;
              reg10 <= $unsigned(($signed(wire0) - (+((+wire1) == $unsigned(reg7)))));
              reg11 <= ($unsigned(($unsigned(wire2) - ($signed(reg16) || {(8'hae),
                  reg12}))) ^ (+((wire1[(2'h2):(1'h1)] * $unsigned(reg17)) < $unsigned((~reg14)))));
            end
          reg12 <= (wire1[(1'h1):(1'h1)] ?
              $signed((reg13[(4'hc):(2'h3)] ?
                  $signed(reg7[(1'h1):(1'h0)]) : wire3[(1'h0):(1'h0)])) : reg17);
          reg13 <= $unsigned((+{(~|$signed((8'hb8))), reg7}));
          if (reg9[(4'h8):(3'h7)])
            begin
              reg14 <= wire4[(1'h1):(1'h1)];
              reg15 <= (reg14 <<< ({$unsigned(wire3),
                  $unsigned({wire5})} == {$unsigned((reg10 ? (8'ha4) : reg6)),
                  reg8[(3'h6):(1'h1)]}));
              reg16 <= (~^reg12);
            end
          else
            begin
              reg14 <= $signed((|(!wire2)));
              reg15 <= $signed((reg14[(3'h6):(3'h5)] <<< ((reg8[(2'h2):(1'h1)] >> reg12[(2'h2):(2'h2)]) != reg15)));
              reg16 <= $unsigned($unsigned((~{(reg16 ? reg10 : reg17)})));
              reg17 <= reg12[(3'h7):(2'h2)];
              reg18 <= ((&(^~(reg7 ? reg18[(2'h3):(1'h1)] : $signed(reg12)))) ?
                  $unsigned($unsigned((-reg8))) : (reg14 && reg13[(4'he):(4'h9)]));
            end
          reg19 <= ($signed(reg10[(4'h9):(4'h9)]) ?
              (($signed((^reg13)) || $unsigned(reg12[(3'h6):(1'h1)])) ?
                  $unsigned(reg13[(4'hb):(2'h2)]) : {(reg11[(4'h8):(1'h1)] ?
                          reg11[(4'h9):(4'h9)] : (~(8'hb9)))}) : {reg12});
        end
      reg20 <= wire2[(1'h0):(1'h0)];
    end
  assign wire21 = (wire4 ?
                      (((wire1[(3'h4):(3'h4)] & $signed(wire4)) ?
                          wire5 : (reg6[(4'hf):(3'h7)] < reg7[(1'h1):(1'h1)])) & reg9) : ((~$signed(wire0)) ^ $unsigned((^~(reg6 ?
                          wire5 : (8'hb1))))));
  assign wire22 = $unsigned($unsigned(reg16));
  assign wire23 = ($signed(($signed($signed(wire3)) + $signed(reg10))) >>> ((~^$unsigned((reg6 && reg10))) >= (wire5 ?
                      wire2 : reg19)));
  always
    @(posedge clk) begin
      if ($unsigned(wire3))
        begin
          reg24 <= wire3;
          reg25 <= (reg8[(4'h9):(4'h9)] + reg20);
          if (reg11[(3'h5):(2'h3)])
            begin
              reg26 <= (^wire21);
            end
          else
            begin
              reg26 <= $unsigned($unsigned($unsigned($signed($unsigned(wire0)))));
            end
          if ((!$unsigned((~|wire3[(2'h2):(1'h1)]))))
            begin
              reg27 <= ((((8'ha1) >= (^{reg10,
                      (8'ha3)})) ~^ (((!reg12) & (reg9 ? reg26 : reg16)) ?
                      $unsigned($signed(reg11)) : wire21)) ?
                  reg12[(3'h5):(2'h3)] : $signed((8'hb3)));
            end
          else
            begin
              reg27 <= $signed((^~((^~reg27) << ($unsigned(wire3) >>> (reg9 >= wire23)))));
              reg28 <= (-$signed($unsigned((+((8'hb9) ? wire5 : wire2)))));
              reg29 <= reg26[(1'h0):(1'h0)];
              reg30 <= wire21[(1'h0):(1'h0)];
              reg31 <= $signed((wire3 >= wire1));
            end
          reg32 <= (|(8'ha3));
        end
      else
        begin
          reg24 <= $signed($signed(reg32[(4'ha):(4'h8)]));
          reg25 <= wire22[(1'h0):(1'h0)];
          reg26 <= (reg13[(4'hb):(2'h2)] | $signed($unsigned((reg19[(3'h4):(1'h0)] ?
              {reg10} : reg31))));
          reg27 <= wire1;
        end
      reg33 <= $signed((|(reg13[(1'h0):(1'h0)] ?
          $signed(wire5) : reg31[(2'h2):(2'h2)])));
      reg34 <= $unsigned($unsigned({(!(-(8'h9e))), $signed((reg32 > reg26))}));
      reg35 <= reg18;
    end
  assign wire36 = reg9;
  assign wire37 = (^$signed(reg6));
  always
    @(posedge clk) begin
      if ({$unsigned(reg25), reg28[(4'hd):(3'h5)]})
        begin
          reg38 <= $signed(((|$unsigned($unsigned(reg16))) ^~ ($signed((^~reg9)) < reg9)));
          reg39 <= (^{({(^reg29)} | $signed($signed(reg31))),
              ($signed((!reg24)) < $unsigned((~^reg34)))});
          reg40 <= wire3;
          if (reg39[(4'ha):(3'h6)])
            begin
              reg41 <= reg35[(4'ha):(2'h2)];
              reg42 <= $unsigned({reg31});
            end
          else
            begin
              reg41 <= ({wire4[(1'h1):(1'h0)]} ?
                  $signed(wire1) : $unsigned((reg13 || $unsigned(reg30[(1'h0):(1'h0)]))));
              reg42 <= $signed($signed((reg19[(1'h0):(1'h0)] >>> $unsigned(reg28[(2'h3):(2'h2)]))));
              reg43 <= reg14[(4'ha):(2'h3)];
              reg44 <= reg26[(1'h1):(1'h1)];
            end
        end
      else
        begin
          reg38 <= (~wire37);
          reg39 <= reg27;
          reg40 <= (^(wire37[(1'h0):(1'h0)] < (^~reg30)));
          reg41 <= $signed((+$signed(reg12[(3'h6):(2'h3)])));
        end
      reg45 <= $unsigned($unsigned($unsigned((reg38 ^~ reg43))));
      if (reg25)
        begin
          reg46 <= (reg20[(2'h3):(2'h2)] & $unsigned($signed(((~&reg8) ?
              {(8'hb0), wire21} : reg35[(1'h1):(1'h1)]))));
          reg47 <= $signed((~^$signed(reg33[(1'h0):(1'h0)])));
          reg48 <= (~|(~|reg26));
          reg49 <= ((-{((reg45 ^~ reg17) > reg32)}) ?
              {(^~reg39),
                  ((^~reg48[(4'hc):(4'ha)]) * $unsigned(((8'haf) | reg18)))} : ($unsigned((+reg18[(1'h1):(1'h1)])) ?
                  (wire23[(3'h5):(2'h2)] != $unsigned($unsigned((8'hb0)))) : ($signed(((8'hb2) ^~ reg13)) ?
                      reg12[(3'h7):(3'h5)] : (^~reg8))));
        end
      else
        begin
          reg46 <= $unsigned(reg17[(3'h7):(1'h1)]);
        end
      reg50 <= $signed($unsigned(reg8));
    end
  assign wire51 = (-((^~($signed(reg49) ?
                      $unsigned(wire2) : $signed(reg11))) == reg46[(1'h0):(1'h0)]));
  assign wire52 = reg38;
  assign wire53 = (($unsigned(((reg12 & wire0) <<< (wire23 ? reg24 : reg31))) ?
                          (wire22 ?
                              ($unsigned(wire4) ?
                                  wire36 : (wire1 >>> (8'hb2))) : $unsigned((wire21 <= reg18))) : $signed(reg13[(1'h0):(1'h0)])) ?
                      {((~&reg12[(2'h3):(2'h3)]) > reg11[(4'h8):(3'h5)]),
                          (&{(|(8'h9f)),
                              (wire2 ^~ reg48)})} : wire3[(2'h2):(1'h1)]);
  assign wire54 = $signed(reg26[(1'h1):(1'h0)]);
  assign wire55 = $signed((($signed({reg7}) ?
                      $signed($unsigned(reg43)) : $signed((8'h9f))) == reg26[(1'h0):(1'h0)]));
  assign wire56 = ((($unsigned(reg7[(1'h1):(1'h0)]) >>> reg35[(2'h3):(2'h3)]) ?
                      $signed((^$signed(reg38))) : (8'hbf)) & $unsigned(((~^(reg7 && reg13)) ?
                      wire37 : (8'hb9))));
  module57 #() modinst124 (.wire60(reg46), .y(wire123), .clk(clk), .wire58(reg15), .wire62(reg9), .wire59(reg35), .wire61(reg48));
  assign wire125 = reg41;
  assign wire126 = wire52[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      if ({(|$unsigned(($signed((8'ha2)) >> (reg24 && reg44))))})
        begin
          if (wire3)
            begin
              reg127 <= (wire22 && wire55);
            end
          else
            begin
              reg127 <= ((8'h9e) ? reg27[(1'h1):(1'h1)] : reg44[(1'h1):(1'h0)]);
              reg128 <= (!$signed($signed($signed(((8'hac) == wire56)))));
              reg129 <= ((reg48 ?
                  (wire21[(1'h1):(1'h1)] != $signed($unsigned(reg20))) : (~^$signed(wire55[(1'h0):(1'h0)]))) ^~ $signed((reg18[(1'h1):(1'h0)] <<< wire54[(2'h2):(2'h2)])));
              reg130 <= reg46[(3'h5):(2'h2)];
              reg131 <= (((($unsigned(reg26) ? (^(8'hb0)) : (wire53 * reg6)) ?
                          $unsigned((wire1 ^~ wire51)) : $signed(wire37[(2'h3):(1'h0)])) ?
                      (~&(reg46[(4'h8):(1'h1)] - reg30)) : $unsigned(reg20[(4'hb):(2'h2)])) ?
                  $signed((!reg39[(2'h3):(2'h2)])) : (~^$signed((~^(reg20 != wire1)))));
            end
          if ((8'h9c))
            begin
              reg132 <= ($unsigned((reg15[(3'h5):(2'h2)] == $signed(reg24[(2'h2):(1'h0)]))) ?
                  reg20 : reg48[(5'h10):(4'h8)]);
              reg133 <= (8'hbb);
              reg134 <= {((|$unsigned((reg48 != reg34))) ?
                      ($unsigned($signed(reg50)) ?
                          ((reg31 ? reg40 : (8'hba)) ?
                              (7'h44) : (wire123 ?
                                  (8'h9d) : reg31)) : ((reg128 >> reg43) || wire21[(1'h1):(1'h1)])) : (~(reg35 >= $unsigned(reg33))))};
              reg135 <= wire36[(1'h1):(1'h1)];
            end
          else
            begin
              reg132 <= reg43;
              reg133 <= reg42;
              reg134 <= $signed(reg13[(2'h2):(1'h0)]);
              reg135 <= (7'h44);
            end
        end
      else
        begin
          if (reg27)
            begin
              reg127 <= ($signed(((~|(wire53 < (8'hbd))) ~^ ($unsigned(reg9) >= reg19[(2'h2):(1'h1)]))) - (^reg34));
              reg128 <= {(^~(reg44 ?
                      $unsigned((~|(7'h42))) : ($signed((8'hb3)) ?
                          (wire2 < wire4) : $unsigned(wire125))))};
            end
          else
            begin
              reg127 <= {{(^~$signed($signed(wire123)))}};
              reg128 <= (-((^(8'ha0)) >> $signed((|$unsigned((8'ha9))))));
              reg129 <= {reg28,
                  ($unsigned($unsigned($signed((7'h43)))) ?
                      wire22[(4'he):(4'ha)] : (8'hbe))};
              reg130 <= (reg130[(1'h0):(1'h0)] ?
                  (^(((reg10 ? reg24 : reg29) ? (|reg32) : $signed(wire37)) ?
                      reg9[(3'h7):(3'h6)] : (((8'ha1) ? reg43 : reg18) ?
                          wire53 : wire22[(3'h7):(3'h5)]))) : (~|reg132));
            end
          reg131 <= $signed({$unsigned($signed(wire5))});
          reg132 <= reg49[(1'h1):(1'h1)];
          reg133 <= ((($signed(wire2[(3'h6):(2'h2)]) ?
                      (8'hbe) : ((~wire22) != $signed(reg49))) ?
                  $unsigned(wire5[(1'h1):(1'h1)]) : reg133) ?
              (&$unsigned(((^wire0) ~^ $unsigned(reg127)))) : wire36);
        end
      reg136 <= ((7'h40) ?
          reg134 : (|({(~|reg28), {wire126, reg128}} ?
              ({reg29} ?
                  (reg26 ?
                      reg34 : wire37) : reg33[(2'h2):(1'h1)]) : wire37[(1'h1):(1'h0)])));
    end
  assign wire137 = {($signed({(wire1 ^~ (8'hbf))}) * $signed((!(wire3 > reg11))))};
  always
    @(posedge clk) begin
      if ($signed(($signed((~|$unsigned(reg34))) & reg28)))
        begin
          reg138 <= (reg40[(2'h2):(2'h2)] ?
              (((!reg27) >>> ({reg16} * (reg41 ?
                  reg34 : reg135))) == (wire3 > reg30)) : reg17);
          reg139 <= reg133[(4'h8):(2'h3)];
          reg140 <= wire23[(3'h6):(1'h0)];
        end
      else
        begin
          if (reg33[(3'h7):(1'h1)])
            begin
              reg138 <= $signed(reg134);
              reg139 <= $signed((~&(8'hbe)));
              reg140 <= (~reg43[(3'h4):(3'h4)]);
              reg141 <= (((((reg47 ? reg16 : reg39) | wire22[(3'h6):(1'h1)]) ?
                      (reg18 ?
                          $signed(reg27) : (~^reg127)) : (reg7 ~^ {(8'had)})) ?
                  reg42 : reg7) ^~ (reg138[(4'ha):(1'h1)] & $signed($unsigned(reg129))));
              reg142 <= $unsigned(reg9[(4'he):(3'h5)]);
            end
          else
            begin
              reg138 <= reg32;
              reg139 <= (reg39 != ((^~$signed(reg8)) ~^ ({((8'hbc) << (7'h41)),
                  reg13} << ((+wire126) ~^ $signed(reg128)))));
              reg140 <= reg12;
            end
          reg143 <= $signed(reg13);
        end
      reg144 <= (-reg138[(1'h0):(1'h0)]);
    end
endmodule

module module57
#(parameter param122 = {(8'h9f), ((+(((8'hb4) <= (8'hbc)) ? ((8'ha6) ? (8'hbe) : (8'hbd)) : (~^(8'hb6)))) ~^ ((!(~&(8'hbf))) > (((8'hab) ? (8'hb7) : (8'hb9)) & (~&(8'hb2)))))})
(y, clk, wire58, wire59, wire60, wire61, wire62);
  output wire [(32'h1bd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire58;
  input wire [(4'ha):(1'h0)] wire59;
  input wire [(4'ha):(1'h0)] wire60;
  input wire [(3'h6):(1'h0)] wire61;
  input wire signed [(4'ha):(1'h0)] wire62;
  wire signed [(4'h9):(1'h0)] wire121;
  wire signed [(4'hd):(1'h0)] wire120;
  wire signed [(5'h12):(1'h0)] wire112;
  wire signed [(5'h11):(1'h0)] wire111;
  wire signed [(4'hc):(1'h0)] wire110;
  wire signed [(3'h7):(1'h0)] wire63;
  wire signed [(4'hc):(1'h0)] wire64;
  wire signed [(5'h14):(1'h0)] wire65;
  wire signed [(4'hc):(1'h0)] wire66;
  wire signed [(4'ha):(1'h0)] wire67;
  wire signed [(5'h14):(1'h0)] wire78;
  wire [(4'he):(1'h0)] wire79;
  wire signed [(5'h10):(1'h0)] wire80;
  wire [(4'hf):(1'h0)] wire81;
  wire signed [(3'h5):(1'h0)] wire82;
  wire signed [(3'h6):(1'h0)] wire83;
  wire [(5'h11):(1'h0)] wire84;
  wire signed [(4'hb):(1'h0)] wire108;
  reg signed [(5'h12):(1'h0)] reg119 = (1'h0);
  reg [(5'h11):(1'h0)] reg118 = (1'h0);
  reg [(2'h2):(1'h0)] reg117 = (1'h0);
  reg [(4'hb):(1'h0)] reg116 = (1'h0);
  reg [(4'hd):(1'h0)] reg115 = (1'h0);
  reg [(5'h10):(1'h0)] reg114 = (1'h0);
  reg [(4'h9):(1'h0)] reg113 = (1'h0);
  reg [(4'ha):(1'h0)] reg68 = (1'h0);
  reg [(4'he):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg70 = (1'h0);
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(4'hb):(1'h0)] reg72 = (1'h0);
  reg [(5'h11):(1'h0)] reg73 = (1'h0);
  reg [(3'h4):(1'h0)] reg74 = (1'h0);
  reg [(5'h11):(1'h0)] reg75 = (1'h0);
  reg signed [(4'he):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg77 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire112,
                 wire111,
                 wire110,
                 wire63,
                 wire64,
                 wire65,
                 wire66,
                 wire67,
                 wire78,
                 wire79,
                 wire80,
                 wire81,
                 wire82,
                 wire83,
                 wire84,
                 wire108,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
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
                 (1'h0)};
  assign wire63 = $unsigned($unsigned((-(~^(wire62 <<< wire59)))));
  assign wire64 = (!wire63);
  assign wire65 = $unsigned((wire62[(1'h1):(1'h0)] < (!wire63)));
  assign wire66 = $unsigned(((wire63[(3'h7):(1'h0)] ?
                          {$unsigned(wire65)} : (~^(!wire63))) ?
                      (~wire59) : wire58[(4'h8):(2'h3)]));
  assign wire67 = {$signed((((wire58 ? wire60 : (8'hbc)) ?
                          (wire58 >= wire63) : {wire64}) | $signed((8'hb0)))),
                      ($unsigned(($unsigned(wire66) ^ wire60[(4'ha):(2'h2)])) ?
                          $unsigned($signed($signed((8'hb4)))) : ((wire65[(4'h8):(3'h4)] ?
                              $signed(wire62) : (!wire62)) && ((-wire59) ?
                              (wire64 <<< (8'hac)) : (wire62 >= (8'hbf)))))};
  always
    @(posedge clk) begin
      if ($unsigned({(+{{wire59, wire59}, (wire60 - (8'ha8))}),
          wire61[(2'h3):(2'h2)]}))
        begin
          reg68 <= ((wire62[(3'h5):(3'h4)] ~^ (~&(8'ha9))) ?
              $unsigned(wire63[(3'h4):(3'h4)]) : (-wire59));
          reg69 <= $signed(($signed((wire63[(3'h6):(2'h3)] - $unsigned((8'hbb)))) || $unsigned($signed((~wire66)))));
          reg70 <= ((({wire62[(4'h9):(2'h3)]} < ($unsigned(wire60) ?
                  wire65[(5'h11):(4'h8)] : $signed(wire67))) ?
              wire59 : $unsigned(wire65[(4'ha):(3'h6)])) >> $unsigned($unsigned($signed(wire63[(1'h0):(1'h0)]))));
          reg71 <= ((~&$unsigned($unsigned((wire64 ^~ (8'hbc))))) ~^ (-(|reg70)));
          if (wire59)
            begin
              reg72 <= (((((~reg68) ?
                  (^reg68) : (|wire61)) >= ((~wire66) * (wire60 ?
                  (8'hae) : wire63))) <= $signed((~&(-wire67)))) || $signed($signed($signed((wire65 >= wire67)))));
              reg73 <= (-reg68);
              reg74 <= (&$signed($unsigned(($signed(wire62) ^ $unsigned(reg69)))));
            end
          else
            begin
              reg72 <= $unsigned((&($unsigned({wire66,
                  wire67}) << (|(reg71 >= reg68)))));
              reg73 <= ((^$unsigned(reg72)) ?
                  $signed($signed({((7'h43) <= wire66),
                      $signed(wire67)})) : ($unsigned($unsigned((|wire63))) & $unsigned($unsigned(wire64))));
            end
        end
      else
        begin
          reg68 <= wire58;
          reg69 <= (($unsigned(($signed(reg69) <= (reg72 ?
              reg68 : (8'ha8)))) >>> reg71[(3'h6):(2'h3)]) + reg69[(3'h5):(3'h4)]);
          if ($unsigned($signed(($signed($signed(wire61)) - $signed($unsigned(reg72))))))
            begin
              reg70 <= $unsigned($signed({$unsigned(wire59)}));
              reg71 <= ((~$signed(((|wire62) ? {wire67} : (^wire60)))) ?
                  {$signed($unsigned(((8'hb2) > reg71))),
                      ((|wire63) >= (wire63 ~^ (wire61 > wire58)))} : $signed((&{(reg70 ~^ wire60)})));
              reg72 <= $unsigned($signed((wire63 ?
                  {wire62[(2'h3):(1'h1)]} : reg69[(1'h0):(1'h0)])));
              reg73 <= (^~reg74[(1'h1):(1'h0)]);
              reg74 <= $signed((reg69[(4'hd):(3'h5)] - ($unsigned((~^wire64)) & reg72)));
            end
          else
            begin
              reg70 <= $signed(($signed(reg68) ?
                  wire59[(4'ha):(3'h4)] : ({(wire61 ? reg74 : (8'ha3)),
                      (wire67 ?
                          reg70 : reg74)} & ($unsigned(wire64) > $signed(reg68)))));
              reg71 <= ($unsigned($signed(($unsigned((8'hba)) ?
                  {wire58, wire67} : (wire63 ?
                      reg74 : reg71)))) - $signed((!(wire62[(4'h9):(1'h0)] * reg68))));
              reg72 <= (|(^~$unsigned((~^{wire62, reg68}))));
              reg73 <= (((7'h43) - (~^$unsigned((-reg71)))) && {($signed(reg69) * reg74[(2'h3):(2'h2)])});
              reg74 <= wire59[(2'h2):(1'h0)];
            end
          reg75 <= ((~|{$unsigned((~wire67))}) != wire58[(3'h7):(3'h6)]);
          reg76 <= (~&$signed($unsigned(reg68)));
        end
      reg77 <= (8'hab);
    end
  assign wire78 = $signed(($signed(wire66[(2'h2):(1'h0)]) ?
                      reg70 : {$signed($signed(reg71)),
                          $signed(wire63[(3'h5):(3'h4)])}));
  assign wire79 = $unsigned($signed({((reg69 ? reg71 : reg77) ?
                          (&wire62) : (wire59 ? reg71 : wire61))}));
  assign wire80 = ($unsigned(((8'ha2) ?
                          $signed({wire79}) : {$signed(wire66),
                              (reg76 ? reg72 : wire63)})) ?
                      wire59 : $unsigned(reg77));
  assign wire81 = (((&wire61[(3'h5):(3'h4)]) && (((!wire65) ?
                          $signed(wire67) : reg77[(2'h3):(2'h3)]) ?
                      $signed(wire66) : ((~reg77) ?
                          wire66 : $unsigned(wire58)))) == (|(^~wire64)));
  assign wire82 = (+{{{reg68[(1'h0):(1'h0)], $unsigned((8'hac))}}});
  assign wire83 = (|$unsigned(reg77));
  assign wire84 = ({(~wire59[(4'h8):(1'h1)]),
                          (wire63 & ((~|reg74) <<< (wire79 >> wire80)))} ?
                      ((!(8'ha4)) & $signed($signed(wire83[(3'h5):(1'h1)]))) : ((wire58[(4'he):(4'hd)] <<< wire67) <<< $signed(($signed(reg76) * $unsigned(wire64)))));
  module85 #() modinst109 (.wire87(wire66), .wire89(wire78), .wire88(wire61), .wire86(reg75), .clk(clk), .y(wire108));
  assign wire110 = {$unsigned($signed(((wire59 ?
                           wire61 : (8'ha1)) + $unsigned(wire81))))};
  assign wire111 = $signed(((((reg76 ? wire64 : reg75) == (reg76 ?
                           wire84 : reg73)) ?
                       $unsigned({reg71,
                           reg72}) : $signed(wire80)) <= (&{(~reg74),
                       (wire108 >= wire110)})));
  assign wire112 = (~wire83[(2'h3):(1'h0)]);
  always
    @(posedge clk) begin
      reg113 <= $unsigned($unsigned((($unsigned(wire58) ? reg77 : (8'ha2)) ?
          wire83 : ((reg71 ^~ wire64) && $signed((8'hb4))))));
      if ($signed($signed(wire108[(1'h1):(1'h0)])))
        begin
          if (((^~wire64) ?
              $unsigned({((wire108 ? wire58 : wire111) ?
                      (wire82 * reg71) : $signed(wire78))}) : {wire66,
                  (((~|(8'hbe)) <<< wire59[(1'h0):(1'h0)]) ?
                      $signed((!reg72)) : {$signed(wire112)})}))
            begin
              reg114 <= $signed(wire60[(3'h7):(3'h6)]);
              reg115 <= (~|$signed(((^$unsigned(wire63)) >>> $unsigned($signed(reg69)))));
              reg116 <= (!($unsigned((reg68 ?
                      wire81[(4'hf):(4'he)] : $signed(wire111))) ?
                  reg73[(3'h7):(3'h5)] : $signed({((8'ha5) ?
                          wire112 : reg68)})));
            end
          else
            begin
              reg114 <= reg75[(4'hc):(2'h3)];
              reg115 <= ((8'ha9) ?
                  reg75[(5'h11):(1'h1)] : (-(($signed(reg76) ?
                      $unsigned(wire83) : $signed(reg73)) < wire82[(1'h1):(1'h0)])));
            end
          reg117 <= reg76;
        end
      else
        begin
          if ((wire64 ?
              wire65 : ((8'hb8) ?
                  {$signed($signed(reg74)),
                      (!$unsigned(reg75))} : $signed($signed((|wire63))))))
            begin
              reg114 <= $signed(wire83[(2'h3):(2'h3)]);
              reg115 <= (|reg116);
              reg116 <= ((&$signed(((+reg114) ?
                  (wire59 >>> wire78) : (wire63 ?
                      reg75 : wire80)))) >>> ((($signed(reg116) & (reg70 != wire66)) ?
                      {$unsigned((8'ha1)), wire60} : wire59[(4'h8):(3'h5)]) ?
                  (^~reg76[(4'ha):(1'h0)]) : (+(wire65 < (reg77 == reg71)))));
              reg117 <= (~|$unsigned((!$unsigned(wire65[(3'h4):(1'h1)]))));
            end
          else
            begin
              reg114 <= reg72[(4'ha):(3'h6)];
              reg115 <= (~reg73[(4'h8):(2'h3)]);
              reg116 <= $signed(($signed(wire59) ?
                  $unsigned(wire79[(3'h5):(1'h1)]) : {(~|$unsigned((8'ha2)))}));
            end
        end
      reg118 <= wire65[(4'hd):(3'h5)];
      reg119 <= reg75[(3'h5):(2'h2)];
    end
  assign wire120 = $unsigned($unsigned(wire63));
  assign wire121 = ($signed(wire112[(1'h0):(1'h0)]) & (-(~{$unsigned(reg70)})));
endmodule

module module85
#(parameter param107 = ((({((8'hbe) <= (7'h43)), ((8'ha9) ? (8'hb4) : (8'h9c))} ? (&((8'h9c) ? (8'ha5) : (8'ha8))) : (8'hbf)) ? (~|{{(8'ha4)}, ((8'hb9) >> (8'ha7))}) : (({(7'h41)} ? ((8'hae) ? (8'h9f) : (8'ha2)) : {(8'hac), (8'hb5)}) ? (8'hbc) : (~(~(8'h9d))))) ? ({(((8'h9e) | (8'h9d)) >> {(8'ha5)}), (((8'hb0) ? (8'ha5) : (8'hae)) ? (!(8'hba)) : ((8'ha8) ? (7'h41) : (8'hb6)))} ? ((~^((7'h42) * (7'h40))) >= (+((8'ha5) * (8'hbe)))) : (~|({(8'haa), (8'ha2)} ? (8'ha5) : (|(8'hbe))))) : {{(|((8'hbe) >>> (7'h43)))}}))
(y, clk, wire89, wire88, wire87, wire86);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire89;
  input wire [(3'h6):(1'h0)] wire88;
  input wire [(4'hc):(1'h0)] wire87;
  input wire [(5'h11):(1'h0)] wire86;
  wire [(4'ha):(1'h0)] wire106;
  wire signed [(4'hb):(1'h0)] wire105;
  wire [(2'h2):(1'h0)] wire104;
  wire [(4'ha):(1'h0)] wire103;
  wire signed [(3'h7):(1'h0)] wire102;
  wire signed [(2'h3):(1'h0)] wire101;
  wire [(5'h15):(1'h0)] wire100;
  wire [(3'h5):(1'h0)] wire99;
  wire [(4'he):(1'h0)] wire98;
  wire [(5'h13):(1'h0)] wire97;
  wire signed [(4'hd):(1'h0)] wire96;
  wire signed [(4'h8):(1'h0)] wire95;
  wire [(4'ha):(1'h0)] wire94;
  wire signed [(3'h4):(1'h0)] wire93;
  wire signed [(4'h8):(1'h0)] wire90;
  reg [(4'hc):(1'h0)] reg92 = (1'h0);
  reg [(5'h12):(1'h0)] reg91 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire90,
                 reg92,
                 reg91,
                 (1'h0)};
  assign wire90 = wire86[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg91 <= {(((!$unsigned(wire88)) ?
              (8'ha0) : wire89[(5'h10):(1'h0)]) >>> ($signed($unsigned((8'haf))) <<< wire90))};
      reg92 <= (~^$signed(wire90));
    end
  assign wire93 = wire89[(3'h4):(2'h2)];
  assign wire94 = ($signed(((wire87[(1'h1):(1'h0)] ?
                          {reg91, wire87} : $unsigned(wire87)) ?
                      (~|reg91[(4'h8):(2'h3)]) : $signed($unsigned(wire93)))) != $signed($signed(($unsigned(wire86) >> (reg92 ?
                      wire88 : reg91)))));
  assign wire95 = (~&((&$signed((^wire89))) >= {wire88}));
  assign wire96 = (&$signed({(8'hb1), wire90}));
  assign wire97 = $signed({wire88[(2'h3):(1'h0)]});
  assign wire98 = wire89[(3'h6):(3'h5)];
  assign wire99 = wire88;
  assign wire100 = $unsigned(((reg91 ?
                       ({wire94, wire89} ~^ (wire88 ?
                           wire90 : wire96)) : (wire97[(3'h7):(3'h6)] ^ ((8'haa) ?
                           wire96 : wire94))) != (^($signed(wire98) ?
                       (&wire98) : (8'ha6)))));
  assign wire101 = wire96;
  assign wire102 = ($signed((($signed(wire86) ? (8'hb6) : $unsigned(wire89)) ?
                           (wire98[(3'h6):(3'h5)] >= (~^wire93)) : (-$signed(wire98)))) ?
                       wire86[(3'h5):(1'h1)] : ((8'ha9) & wire99));
  assign wire103 = reg92;
  assign wire104 = $signed(($signed($signed((wire90 | reg91))) ?
                       ($unsigned(wire101[(1'h1):(1'h1)]) == $unsigned(wire97[(3'h5):(1'h0)])) : wire86[(4'hb):(2'h3)]));
  assign wire105 = ((wire104[(1'h0):(1'h0)] ?
                           ((|$unsigned(reg91)) && wire97) : wire98) ?
                       {wire93, (~&wire87)} : (8'hb3));
  assign wire106 = (($unsigned((~wire104[(2'h2):(1'h1)])) ? (8'hb8) : wire103) ?
                       (~&((8'ha2) ?
                           wire99 : $signed((wire104 ?
                               wire104 : wire100)))) : (((wire101[(2'h3):(2'h3)] ?
                               wire105 : {wire101, (8'ha9)}) < wire103) ?
                           wire88[(2'h3):(1'h1)] : (~^$unsigned(wire86))));
endmodule
