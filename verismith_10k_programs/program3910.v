module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h283):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire165;
  wire signed [(5'h11):(1'h0)] wire164;
  wire [(4'h9):(1'h0)] wire163;
  wire [(5'h12):(1'h0)] wire162;
  wire signed [(3'h6):(1'h0)] wire161;
  wire signed [(5'h13):(1'h0)] wire160;
  wire [(4'ha):(1'h0)] wire151;
  wire signed [(4'h9):(1'h0)] wire149;
  wire signed [(4'ha):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire20;
  wire [(2'h3):(1'h0)] wire19;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire4;
  reg [(4'he):(1'h0)] reg159 = (1'h0);
  reg [(4'h8):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg155 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg154 = (1'h0);
  reg [(4'he):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg31 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg34 = (1'h0);
  reg [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg36 = (1'h0);
  reg [(4'h9):(1'h0)] reg37 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg43 = (1'h0);
  assign y = {wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire151,
                 wire149,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire6,
                 wire5,
                 wire4,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
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
                 reg43,
                 (1'h0)};
  assign wire4 = (+wire3[(1'h0):(1'h0)]);
  assign wire5 = wire3;
  assign wire6 = wire0[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg7 <= ((~|(wire4[(3'h4):(1'h1)] ?
          ($unsigned((8'hb0)) ~^ wire3[(1'h0):(1'h0)]) : $unsigned({wire2}))) && (wire5 && wire3[(1'h1):(1'h0)]));
      if ((wire2 >> wire3[(1'h1):(1'h1)]))
        begin
          if (wire5[(1'h0):(1'h0)])
            begin
              reg8 <= ($unsigned((wire2 ? wire0[(2'h2):(2'h2)] : (!(8'h9d)))) ?
                  ({($unsigned(wire0) ? (|wire4) : $signed(wire0)),
                      ((wire2 ?
                          wire4 : wire2) >> $signed(wire2))} | $signed(($signed(wire4) ?
                      (+wire0) : wire4[(4'h8):(3'h7)]))) : {(((wire1 ^~ (8'hbe)) | (|wire1)) ?
                          wire0[(2'h2):(2'h2)] : $unsigned({wire4, wire3})),
                      (^~(~|wire4))});
              reg9 <= reg8;
              reg10 <= ((&((&{(8'h9e), reg9}) ?
                      (wire3[(2'h2):(2'h2)] ?
                          (8'ha8) : (wire5 >>> wire5)) : ((wire0 > wire0) ?
                          $unsigned(wire5) : $unsigned(wire4)))) ?
                  reg7[(3'h7):(3'h4)] : (^~$unsigned(((wire5 | wire3) + reg9[(2'h3):(1'h0)]))));
              reg11 <= {(~wire5[(3'h5):(3'h4)])};
              reg12 <= {$unsigned((8'had))};
            end
          else
            begin
              reg8 <= {{wire5[(4'hd):(2'h2)]}};
              reg9 <= (reg11 ? (~^reg11) : $signed((wire2 < reg12)));
              reg10 <= $signed({wire0[(1'h1):(1'h1)]});
            end
          if ({(|(($unsigned(wire3) ?
                  $unsigned(reg11) : reg7) <<< ((~^wire1) ^ $signed(wire4)))),
              ($signed((-{reg12, wire1})) && (^~wire4[(5'h10):(3'h5)]))})
            begin
              reg13 <= $unsigned((8'ha2));
            end
          else
            begin
              reg13 <= (wire0 ?
                  $signed(wire4) : ((reg13[(4'h8):(1'h1)] ?
                          (^wire4[(4'h9):(2'h2)]) : {(~&wire4)}) ?
                      wire1 : {(+$unsigned(wire6))}));
              reg14 <= (($unsigned(wire5[(4'h8):(3'h4)]) << ($unsigned((&(8'hb4))) ?
                      $unsigned(reg13[(1'h1):(1'h1)]) : reg10[(2'h2):(1'h1)])) ?
                  wire6 : $signed(reg12));
              reg15 <= reg9;
            end
          reg16 <= (reg13[(4'ha):(3'h4)] ?
              reg13[(4'h9):(3'h5)] : $signed(((wire1 ?
                      (wire5 ? reg9 : reg9) : (~&(8'hab))) ?
                  wire0 : reg7[(2'h3):(2'h3)])));
          reg17 <= reg7[(3'h4):(1'h1)];
          reg18 <= ($signed({$unsigned(reg11), wire1}) ?
              reg15 : reg11[(2'h2):(1'h0)]);
        end
      else
        begin
          reg8 <= $signed((~&((^~reg17) | reg13)));
          reg9 <= reg10[(4'h8):(3'h4)];
          if ((wire6 <= (|((&reg12[(2'h3):(2'h3)]) ?
              reg15[(3'h5):(2'h2)] : reg7))))
            begin
              reg10 <= $unsigned(wire5[(4'h8):(3'h4)]);
              reg11 <= (8'hae);
              reg12 <= {$unsigned({$signed({reg15, wire5})}), reg17};
              reg13 <= wire5;
              reg14 <= $unsigned((wire1[(3'h6):(1'h0)] <= reg12[(1'h1):(1'h1)]));
            end
          else
            begin
              reg10 <= (((wire0[(1'h1):(1'h0)] ?
                          ({(8'ha7)} ^ $unsigned((8'had))) : $unsigned((reg11 ^~ reg8))) ?
                      {($signed(wire1) != $signed(reg10)),
                          (&{reg7})} : $signed($signed(reg18[(2'h2):(2'h2)]))) ?
                  ({((|wire1) <= (-reg17))} ?
                      (((8'hae) ? (wire0 << reg9) : (!wire0)) ?
                          reg9 : reg7[(4'hf):(1'h0)]) : ({(wire6 <= (8'hbf))} ?
                          (~|reg10[(2'h3):(2'h2)]) : (reg15[(1'h1):(1'h0)] ?
                              $unsigned(reg12) : reg11))) : $unsigned(({reg8,
                          {reg11, reg16}} ?
                      (7'h44) : ($unsigned((8'haa)) >>> $unsigned(wire2)))));
              reg11 <= (reg9 && $unsigned($signed($unsigned((~|reg11)))));
              reg12 <= (reg14[(1'h0):(1'h0)] < ((8'hbe) ?
                  $unsigned((reg16[(2'h2):(1'h1)] ?
                      (reg10 | (7'h44)) : reg11)) : ((wire6 ?
                          (reg9 >>> reg18) : wire1) ?
                      (~|(wire6 ? (8'ha0) : (8'hb8))) : reg13[(4'ha):(1'h1)])));
            end
          reg15 <= (|reg17);
        end
    end
  assign wire19 = $signed($unsigned(($signed((wire1 < wire4)) > (wire3 == wire2[(3'h5):(2'h3)]))));
  assign wire20 = $signed((8'hb5));
  assign wire21 = $unsigned({wire1[(4'h9):(3'h6)],
                      ($unsigned((reg9 ?
                          reg11 : wire1)) != reg7[(1'h0):(1'h0)])});
  assign wire22 = (~^$signed(((8'ha5) + wire6[(2'h3):(1'h1)])));
  always
    @(posedge clk) begin
      reg23 <= $signed(($unsigned(($unsigned(reg8) && $unsigned(wire4))) ^ $unsigned((((8'hb3) ?
              reg7 : (8'hb6)) ?
          wire4 : $signed(wire4)))));
      if ($signed((wire20[(2'h3):(1'h0)] + ($unsigned({reg14}) && ((^~reg9) != ((8'hb8) ~^ wire1))))))
        begin
          if ($unsigned(reg8[(4'he):(3'h5)]))
            begin
              reg24 <= $signed(reg11[(3'h5):(1'h1)]);
              reg25 <= wire5;
            end
          else
            begin
              reg24 <= (|((+wire20[(3'h6):(2'h3)]) >> {$signed($signed((8'hb2))),
                  ($signed((8'hb2)) ? reg10 : $unsigned(reg24))}));
              reg25 <= $signed($signed((&(^wire1[(1'h1):(1'h0)]))));
              reg26 <= (((~^$unsigned($signed(wire19))) ?
                  (8'hbb) : $signed(reg14[(3'h4):(3'h4)])) > ($signed(({(8'hbe),
                          wire1} ?
                      $signed(wire21) : wire19)) ?
                  $signed(reg8) : $unsigned((!wire5[(4'hd):(3'h5)]))));
              reg27 <= $signed($signed(($unsigned($unsigned(reg26)) ?
                  ((reg7 < wire6) ?
                      reg11[(3'h7):(1'h0)] : $signed(reg24)) : ((wire21 << reg12) ?
                      (wire0 * reg11) : (reg18 != (8'h9d))))));
              reg28 <= wire19;
            end
          reg29 <= {$unsigned(($signed(((8'hb6) ? reg11 : (7'h41))) ?
                  ({wire22, reg10} & $unsigned((8'had))) : {(-reg7),
                      wire22[(4'h9):(2'h2)]})),
              $signed(reg8)};
          reg30 <= $unsigned(({reg25,
              ($unsigned(reg15) ?
                  (wire6 ? wire5 : reg7) : {reg11, wire0})} == (~^{(^~wire22),
              reg27})));
        end
      else
        begin
          reg24 <= (!(8'h9f));
          reg25 <= $signed(wire6);
          reg26 <= reg14[(4'h9):(4'h9)];
          reg27 <= reg18[(3'h4):(2'h3)];
          if ($signed(($signed((+reg13[(3'h7):(1'h1)])) << $unsigned($signed((reg23 ?
              wire20 : reg30))))))
            begin
              reg28 <= $unsigned(reg29[(4'h9):(1'h0)]);
              reg29 <= ($unsigned(reg30) ?
                  reg27[(3'h4):(3'h4)] : $signed($signed(wire22[(2'h2):(2'h2)])));
            end
          else
            begin
              reg28 <= wire1[(1'h1):(1'h1)];
              reg29 <= reg14;
              reg30 <= $unsigned($signed((8'hbc)));
              reg31 <= ({(8'h9d)} ?
                  reg26 : ($signed(wire4[(2'h3):(2'h2)]) <= $signed((+$unsigned(reg13)))));
              reg32 <= $signed(((8'haa) | $signed(wire19)));
            end
        end
      reg33 <= (|reg28[(2'h2):(1'h1)]);
      if (reg30)
        begin
          reg34 <= $unsigned((($unsigned(reg29[(4'h8):(2'h2)]) ?
                  $signed($unsigned(wire19)) : $unsigned((reg16 >> reg8))) ?
              (reg14[(5'h10):(4'he)] < reg27[(1'h1):(1'h1)]) : $signed($unsigned($signed((8'hbd))))));
          if ((((-wire4[(4'ha):(2'h3)]) > $unsigned(reg15[(4'he):(1'h1)])) >>> $signed(reg10[(3'h7):(2'h2)])))
            begin
              reg35 <= (|(($signed(reg15) | (^~reg30[(5'h10):(2'h3)])) ?
                  $unsigned((reg14 * ((8'ha7) ?
                      wire3 : wire6))) : {$signed($unsigned(reg14))}));
              reg36 <= (7'h42);
              reg37 <= reg30;
              reg38 <= {{$unsigned(reg9), (-wire0[(2'h3):(1'h1)])},
                  (reg27 ?
                      $unsigned(wire6[(4'h9):(1'h0)]) : $unsigned($signed($signed(reg32))))};
              reg39 <= (8'hbc);
            end
          else
            begin
              reg35 <= (&(8'had));
              reg36 <= (+({reg27,
                  ($unsigned(wire22) ? reg7 : reg32)} != wire6));
              reg37 <= $unsigned($signed($unsigned($unsigned(((8'hb2) << reg26)))));
              reg38 <= (reg38[(4'hc):(4'h8)] - (!reg32));
            end
          reg40 <= $signed(reg39[(1'h0):(1'h0)]);
          reg41 <= $unsigned((($unsigned($unsigned(reg11)) || (reg30 * $signed(reg18))) <<< (+$unsigned($unsigned(wire5)))));
        end
      else
        begin
          if (({((!((7'h40) ? wire4 : reg14)) <= $unsigned((wire6 ?
                  reg39 : wire21))),
              $signed((!{reg10}))} <= (reg15[(3'h5):(1'h1)] > reg24[(3'h5):(2'h3)])))
            begin
              reg34 <= reg30[(1'h1):(1'h0)];
              reg35 <= reg26[(3'h6):(3'h6)];
              reg36 <= (~^(8'hb6));
            end
          else
            begin
              reg34 <= ($signed((^(~|reg11[(3'h7):(1'h1)]))) ?
                  $unsigned($unsigned({reg11, (reg36 + reg15)})) : (+wire5));
              reg35 <= reg39[(2'h2):(1'h1)];
              reg36 <= $signed(reg9);
              reg37 <= $unsigned(wire22[(3'h5):(2'h2)]);
            end
          reg38 <= ($unsigned((+$signed((wire5 ? reg23 : reg40)))) ?
              $signed(reg38) : $signed(reg35));
          if (reg11)
            begin
              reg39 <= ($signed((reg25[(4'hb):(3'h7)] ^~ $unsigned((~|reg24)))) + (reg37 <<< {reg12[(1'h1):(1'h1)]}));
              reg40 <= $unsigned($signed((|$unsigned((~wire6)))));
              reg41 <= {(((wire0[(2'h2):(1'h1)] != ((8'hb5) ?
                      reg26 : reg15)) ~^ $unsigned(wire3[(1'h0):(1'h0)])) == $signed({{reg38}}))};
              reg42 <= (($signed({(wire5 ?
                          reg26 : wire22)}) == $unsigned($unsigned((wire19 || reg28)))) ?
                  reg16 : $signed($unsigned(((!wire1) & {reg38, reg28}))));
              reg43 <= reg30[(2'h2):(2'h2)];
            end
          else
            begin
              reg39 <= $unsigned(wire3[(2'h2):(1'h1)]);
              reg40 <= ((!(-(8'ha0))) + {{((~|(8'hbd)) ? (^~reg15) : reg7),
                      $unsigned(reg30[(4'hb):(3'h6)])},
                  (~|({reg35, reg16} > {reg29}))});
              reg41 <= ($signed({reg9}) ?
                  {(+{(reg26 ? reg28 : reg16)}),
                      ($unsigned({reg26,
                          wire22}) & $signed(reg24[(1'h0):(1'h0)]))} : reg7);
              reg42 <= (wire0[(3'h4):(3'h4)] ?
                  $signed(reg24) : $signed($signed((&(reg24 ?
                      (8'ha7) : wire5)))));
            end
        end
    end
  module44 #() modinst150 (.wire45(wire5), .wire49(reg34), .clk(clk), .wire47(reg30), .wire48(wire3), .wire46(reg25), .y(wire149));
  assign wire151 = reg13;
  always
    @(posedge clk) begin
      reg152 <= (wire6 < ((~{wire21[(5'h10):(3'h5)], $unsigned(wire6)}) ?
          ({wire0} ^ reg40[(4'hf):(4'ha)]) : {$unsigned($unsigned((7'h43))),
              (&reg14[(4'ha):(2'h2)])}));
      reg153 <= ({$signed(reg33[(3'h6):(3'h4)])} ?
          wire6[(3'h6):(3'h4)] : reg18[(1'h1):(1'h0)]);
      if (wire2)
        begin
          reg154 <= (~|wire21[(4'ha):(3'h4)]);
          reg155 <= wire22[(3'h4):(3'h4)];
          reg156 <= $signed(($signed(($unsigned(reg37) ^ reg13)) ?
              ($signed($unsigned(reg154)) ?
                  $signed(reg152) : (|(-reg7))) : ($signed({reg35}) ?
                  $unsigned((reg15 >>> reg23)) : reg43)));
          reg157 <= (reg11[(1'h0):(1'h0)] ? reg26 : reg9);
        end
      else
        begin
          reg154 <= $unsigned(($unsigned((reg33 <<< reg11[(4'h8):(4'h8)])) ?
              reg15 : reg34));
          reg155 <= (|(reg30 ?
              reg33[(3'h7):(1'h0)] : (wire4[(1'h1):(1'h1)] > (reg34 * $signed(reg18)))));
          reg156 <= ({$unsigned(((~reg40) ?
                  (reg9 ? reg39 : reg33) : $unsigned(reg12))),
              $unsigned($signed(((8'hba) ?
                  reg9 : (8'hb7))))} + reg155[(3'h6):(2'h2)]);
          reg157 <= $unsigned({{$unsigned($signed(reg23))}});
          reg158 <= (reg14[(3'h6):(2'h3)] >= reg42[(2'h3):(2'h3)]);
        end
      reg159 <= {(~|(8'hb8))};
    end
  assign wire160 = (reg39[(3'h6):(3'h5)] ?
                       reg153 : $signed($unsigned(($signed(reg14) ?
                           $unsigned(wire19) : (wire20 ? (7'h42) : wire21)))));
  assign wire161 = reg31[(4'h9):(4'h8)];
  assign wire162 = $unsigned((~|(8'hb5)));
  assign wire163 = ((^$unsigned({(~(8'hb8))})) ?
                       ((reg13 ?
                           $unsigned((wire1 ~^ reg41)) : $unsigned($signed(reg38))) && reg38[(4'h8):(2'h2)]) : reg39);
  assign wire164 = reg30;
  assign wire165 = wire0;
endmodule

module module44
#(parameter param148 = ((((((8'hb5) >> (8'h9d)) * ((8'ha7) >>> (8'ha3))) != ((&(8'hba)) ? ((8'hb8) <<< (8'had)) : (~&(8'ha7)))) ? (((-(7'h40)) | (^(8'haa))) ? (8'hb6) : (^~(~|(8'hab)))) : ((((8'hbf) ? (8'h9c) : (7'h43)) ? ((7'h44) > (8'ha9)) : ((8'hb7) & (8'ha8))) ? (~&{(8'ha3)}) : (~^(~|(8'hbc))))) ? (-(((|(8'hbb)) ? (+(8'hb9)) : {(8'hb0)}) ? ({(8'haf), (8'hb0)} ? ((8'haa) ? (8'haa) : (8'hab)) : (!(8'ha6))) : (((7'h40) ? (8'ha5) : (7'h41)) ? (8'hbc) : (-(7'h44))))) : (((((8'hbb) ? (7'h42) : (8'had)) ? {(8'hac), (8'ha3)} : {(8'haf), (8'ha5)}) ? (^~((8'hac) >>> (8'hbb))) : ((^~(7'h43)) - ((8'hb2) ? (8'ha2) : (7'h42)))) ? ((-((8'ha0) > (8'ha9))) >= (~|((8'had) ? (8'ha4) : (7'h43)))) : {(~{(8'h9d), (8'hb4)}), (8'haf)})))
(y, clk, wire49, wire48, wire47, wire46, wire45);
  output wire [(32'h2a1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire49;
  input wire [(3'h4):(1'h0)] wire48;
  input wire [(5'h14):(1'h0)] wire47;
  input wire signed [(5'h11):(1'h0)] wire46;
  input wire [(4'h9):(1'h0)] wire45;
  wire signed [(4'h9):(1'h0)] wire147;
  wire signed [(5'h12):(1'h0)] wire146;
  wire [(3'h6):(1'h0)] wire130;
  wire [(4'ha):(1'h0)] wire100;
  wire signed [(4'ha):(1'h0)] wire71;
  wire [(5'h15):(1'h0)] wire70;
  wire signed [(4'hd):(1'h0)] wire69;
  wire signed [(2'h2):(1'h0)] wire132;
  wire signed [(5'h12):(1'h0)] wire144;
  reg signed [(4'he):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg97 = (1'h0);
  reg [(5'h14):(1'h0)] reg96 = (1'h0);
  reg [(3'h6):(1'h0)] reg95 = (1'h0);
  reg [(2'h2):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg91 = (1'h0);
  reg [(2'h3):(1'h0)] reg90 = (1'h0);
  reg [(5'h12):(1'h0)] reg89 = (1'h0);
  reg [(5'h10):(1'h0)] reg88 = (1'h0);
  reg [(4'hb):(1'h0)] reg87 = (1'h0);
  reg [(5'h13):(1'h0)] reg86 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg85 = (1'h0);
  reg [(3'h6):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg83 = (1'h0);
  reg [(2'h2):(1'h0)] reg82 = (1'h0);
  reg [(3'h6):(1'h0)] reg81 = (1'h0);
  reg [(4'h8):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg79 = (1'h0);
  reg [(5'h10):(1'h0)] reg78 = (1'h0);
  reg signed [(4'he):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(4'h8):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg73 = (1'h0);
  reg [(4'ha):(1'h0)] reg72 = (1'h0);
  reg [(5'h11):(1'h0)] reg68 = (1'h0);
  reg [(2'h3):(1'h0)] reg67 = (1'h0);
  reg [(4'ha):(1'h0)] reg66 = (1'h0);
  reg [(3'h6):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg64 = (1'h0);
  reg [(4'hf):(1'h0)] reg63 = (1'h0);
  reg signed [(4'he):(1'h0)] reg62 = (1'h0);
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg59 = (1'h0);
  reg [(5'h15):(1'h0)] reg58 = (1'h0);
  reg [(5'h15):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg56 = (1'h0);
  reg [(4'ha):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(5'h11):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg52 = (1'h0);
  reg [(5'h15):(1'h0)] reg51 = (1'h0);
  reg [(5'h14):(1'h0)] reg50 = (1'h0);
  assign y = {wire147,
                 wire146,
                 wire130,
                 wire100,
                 wire71,
                 wire70,
                 wire69,
                 wire132,
                 wire144,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
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
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
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
  always
    @(posedge clk) begin
      if (({$signed($unsigned($unsigned(wire49)))} * (~&(wire47 > $signed((wire45 * wire47))))))
        begin
          if (((wire49[(2'h2):(1'h0)] | wire49) ^~ wire48))
            begin
              reg50 <= $unsigned($unsigned($signed(wire46)));
              reg51 <= {$unsigned($unsigned(wire47[(3'h5):(2'h2)])),
                  reg50[(3'h4):(2'h3)]};
              reg52 <= wire45;
              reg53 <= ({reg52[(4'hc):(3'h5)],
                  $signed({wire49[(3'h4):(3'h4)],
                      (wire49 >> wire47)})} >>> (wire47 ?
                  (($signed(reg51) ~^ (-reg52)) >>> (~&$unsigned(wire47))) : $unsigned(wire48[(3'h4):(2'h3)])));
              reg54 <= reg52;
            end
          else
            begin
              reg50 <= $signed($unsigned(({(~&wire48)} ?
                  wire46 : ((wire45 ? wire45 : wire45) ? wire46 : wire46))));
              reg51 <= ((&$signed($unsigned($unsigned(reg53)))) ?
                  {reg50,
                      $unsigned({(~wire46),
                          (wire46 ? reg53 : reg50)})} : reg50[(5'h11):(3'h7)]);
              reg52 <= $unsigned(reg54);
              reg53 <= (($signed(($unsigned((8'hba)) ?
                      (wire45 ? reg50 : (8'hb1)) : wire49)) ?
                  reg50 : $unsigned(((|reg51) ?
                      $unsigned((7'h42)) : (wire45 - wire47)))) ^ $unsigned($unsigned(wire46[(2'h2):(2'h2)])));
            end
          reg55 <= reg52;
          if (wire45)
            begin
              reg56 <= (~|$signed({{reg50}}));
              reg57 <= $unsigned(wire48);
              reg58 <= reg51[(2'h3):(1'h1)];
              reg59 <= $unsigned(reg56);
            end
          else
            begin
              reg56 <= ((wire47 ?
                  $unsigned({((8'ha7) >> reg54),
                      (reg59 ?
                          reg50 : wire49)}) : (~^(~&wire45[(3'h6):(3'h6)]))) << ((wire45[(3'h7):(2'h3)] | (((8'had) == wire47) ?
                  $unsigned(reg50) : $unsigned(reg57))) >> $signed((&reg55))));
              reg57 <= $unsigned((~&reg53));
              reg58 <= ($unsigned($signed(wire46[(2'h2):(1'h0)])) ?
                  $signed((~^(+$unsigned(wire46)))) : (8'haf));
            end
          reg60 <= (reg58 ? {$unsigned((+reg55))} : reg56);
        end
      else
        begin
          reg50 <= ($signed((((wire49 ?
                      (8'hbf) : reg57) ^ reg57[(4'h8):(3'h7)]) ?
                  $signed((reg60 ? wire46 : wire48)) : {reg55})) ?
              $unsigned((!((8'h9e) && reg51[(5'h10):(4'h9)]))) : (reg55[(3'h6):(2'h3)] ?
                  (($signed(reg50) ? $unsigned(reg55) : $unsigned(wire49)) ?
                      wire48 : ($unsigned(reg51) > (reg58 ?
                          reg59 : reg52))) : (^~((^~wire47) ~^ (reg53 ^~ wire45)))));
        end
      reg61 <= (+$signed($unsigned($unsigned($signed(reg52)))));
      reg62 <= reg58[(5'h15):(4'ha)];
      reg63 <= ((7'h40) ?
          reg52[(4'hf):(4'ha)] : (({wire49, reg53[(3'h7):(3'h7)]} ?
                  $unsigned($signed(wire49)) : reg61[(3'h6):(3'h4)]) ?
              (+reg50) : (~|(!reg60[(1'h1):(1'h0)]))));
      if (((&(~&wire48)) ?
          $unsigned((^~$signed((reg58 != reg58)))) : ({$unsigned(wire46[(4'hb):(4'ha)])} >= ($signed(wire47) ?
              (+(reg59 ~^ wire47)) : ((reg54 < reg62) ?
                  (reg52 ? reg59 : reg58) : $signed((8'hab)))))))
        begin
          reg64 <= (^~$unsigned($signed($signed(reg61))));
        end
      else
        begin
          reg64 <= $signed(wire48);
          reg65 <= reg60[(2'h2):(1'h0)];
          reg66 <= (~|(wire46 ?
              {((wire46 ? (8'h9d) : reg57) | reg53),
                  reg56} : reg51[(5'h15):(4'hf)]));
          reg67 <= ((~$unsigned(wire46)) || reg55);
          reg68 <= {{reg53[(4'ha):(1'h0)]}};
        end
    end
  assign wire69 = reg62;
  assign wire70 = reg59;
  assign wire71 = reg66[(3'h4):(2'h2)];
  always
    @(posedge clk) begin
      if (reg51[(3'h4):(1'h0)])
        begin
          reg72 <= ($signed(reg54) ?
              (8'haf) : ($signed($signed($unsigned(reg57))) ?
                  reg50 : ((wire45[(4'h9):(1'h0)] ?
                      {reg59} : (reg58 << wire46)) >>> reg54)));
          reg73 <= $unsigned((^$unsigned((reg66[(1'h1):(1'h0)] ?
              (reg60 & reg66) : ((8'haf) && reg65)))));
          reg74 <= (8'h9e);
          reg75 <= reg66;
          reg76 <= reg51;
        end
      else
        begin
          reg72 <= $unsigned((~^({((8'h9f) ? reg55 : reg58), {(7'h42)}} ?
              wire47[(4'h9):(4'h8)] : reg57)));
          reg73 <= (8'hb5);
          reg74 <= reg57[(3'h5):(1'h0)];
          reg75 <= ($signed(wire70) ?
              (wire45 ?
                  (({wire71,
                      reg51} + $signed(wire46)) == (~|reg68)) : ({$signed(reg52),
                          (reg64 ? wire70 : reg64)} ?
                      (8'hac) : $unsigned((reg64 != reg56)))) : (+({reg54[(4'hd):(1'h1)],
                      ((7'h41) || reg76)} ?
                  $signed($unsigned(wire47)) : ((reg76 >>> reg58) << $signed(reg64)))));
        end
      reg77 <= reg63;
      if ((|wire69))
        begin
          reg78 <= reg67;
        end
      else
        begin
          if (reg52[(3'h7):(1'h1)])
            begin
              reg78 <= ($unsigned(((reg56 + (reg53 <= wire45)) + (^~(reg78 != reg61)))) ?
                  ({((^reg57) & {reg63, wire48}), $unsigned((~&wire48))} ?
                      (8'ha2) : $unsigned((+(+wire46)))) : reg63[(4'hf):(2'h3)]);
              reg79 <= $signed((wire49[(1'h1):(1'h1)] ^~ $unsigned($signed(wire47[(4'hb):(3'h5)]))));
            end
          else
            begin
              reg78 <= $unsigned(($signed(wire45) ?
                  reg74 : {{(reg53 >= reg72)}}));
              reg79 <= ((reg50[(4'h9):(3'h7)] ?
                      $unsigned($unsigned(wire71)) : reg51[(5'h10):(1'h0)]) ?
                  reg55 : {reg64, $signed(reg67[(1'h1):(1'h0)])});
            end
          if (((wire69[(2'h3):(1'h0)] ?
              ((~$unsigned(wire70)) ?
                  (reg61[(2'h3):(2'h3)] ?
                      $unsigned(wire46) : (wire45 ?
                          reg57 : reg75)) : ({reg64} | $unsigned(reg59))) : reg68[(1'h1):(1'h1)]) >> reg57[(3'h6):(3'h6)]))
            begin
              reg80 <= $unsigned($signed(($signed((reg72 ? wire45 : (7'h40))) ?
                  {reg64[(1'h0):(1'h0)], $signed(reg59)} : ({(8'hbc)} ?
                      $signed((8'hbe)) : reg56[(3'h6):(3'h6)]))));
              reg81 <= ((8'hab) ^~ $signed($signed((-$signed(reg51)))));
              reg82 <= reg66;
              reg83 <= $signed(reg64);
            end
          else
            begin
              reg80 <= wire45[(4'h8):(1'h0)];
              reg81 <= (+reg76[(2'h2):(1'h0)]);
              reg82 <= (wire45[(1'h1):(1'h0)] << $signed($unsigned(reg77)));
              reg83 <= (8'h9d);
              reg84 <= $signed($unsigned(reg64[(3'h6):(1'h0)]));
            end
          if ((8'hba))
            begin
              reg85 <= (^~reg53);
              reg86 <= reg68;
            end
          else
            begin
              reg85 <= $unsigned({$signed((8'h9c)),
                  {$signed(reg74[(3'h6):(3'h5)])}});
              reg86 <= {reg66};
              reg87 <= reg84;
            end
          reg88 <= reg85;
          reg89 <= wire70[(1'h1):(1'h0)];
        end
      if (reg58)
        begin
          reg90 <= reg84[(1'h1):(1'h1)];
          reg91 <= {$signed($unsigned(($unsigned(reg85) ?
                  $signed(reg50) : (reg60 && reg50)))),
              reg90};
          reg92 <= $unsigned(wire47[(5'h10):(4'he)]);
          reg93 <= reg55[(1'h0):(1'h0)];
          reg94 <= ($signed($unsigned(((reg91 >>> reg53) ?
                  {reg80} : reg68[(4'h8):(4'h8)]))) ?
              (^~reg87) : ((($unsigned(reg91) ?
                  (reg57 ?
                      reg78 : reg74) : (&(7'h41))) & $signed((reg90 >> reg59))) ~^ (reg66[(4'h9):(3'h7)] == {$signed(reg68)})));
        end
      else
        begin
          if ((((({(8'hbb)} | $unsigned((8'hba))) << (reg87[(2'h3):(2'h2)] ?
                      reg65 : (reg66 == reg94))) ?
                  (wire71[(2'h2):(2'h2)] <= $unsigned((reg59 < wire70))) : reg87[(4'ha):(2'h2)]) ?
              ((^~wire71[(1'h0):(1'h0)]) > $signed($unsigned((+reg56)))) : (-reg79[(1'h1):(1'h1)])))
            begin
              reg90 <= $unsigned({(~&wire46),
                  ((~&$signed(reg82)) ? $unsigned({reg92, reg87}) : (8'h9c))});
              reg91 <= (^$unsigned($signed(((!wire47) << $unsigned(reg81)))));
              reg92 <= ($unsigned(({(reg86 ? reg77 : reg82),
                      $unsigned(reg86)} ^~ (wire45 == {(8'hb6), reg63}))) ?
                  ({(reg50 ^~ $unsigned(wire46)),
                          ($unsigned(reg55) ? (^~reg84) : $signed(reg81))} ?
                      reg90 : ((reg60 <= reg67) ?
                          (8'ha5) : (8'hbb))) : (((|wire46[(1'h1):(1'h0)]) ?
                          (-$signed(reg94)) : ($signed((8'hb4)) ?
                              (reg93 < reg57) : (+reg77))) ?
                      (+$unsigned(reg75[(1'h1):(1'h1)])) : (reg64[(3'h7):(3'h6)] ?
                          ((reg85 ?
                              (8'hae) : (8'hae)) ^~ (-(8'hbb))) : reg61[(3'h5):(1'h1)])));
              reg93 <= reg54[(1'h0):(1'h0)];
              reg94 <= reg89;
            end
          else
            begin
              reg90 <= $unsigned((($signed($unsigned(reg63)) ^ reg86[(1'h1):(1'h1)]) ?
                  reg73[(3'h7):(3'h6)] : {($signed(reg72) ?
                          (reg53 ? reg94 : wire47) : {(8'haf)}),
                      (((8'ha3) != (8'h9f)) ?
                          $signed(reg80) : reg88[(2'h3):(2'h3)])}));
            end
          if ((^~(~reg63[(3'h6):(2'h2)])))
            begin
              reg95 <= $unsigned(reg55[(1'h1):(1'h1)]);
              reg96 <= (-reg72);
              reg97 <= (+(!{reg60[(1'h1):(1'h1)]}));
              reg98 <= $unsigned(reg52[(4'hf):(4'hc)]);
              reg99 <= $signed($signed(reg91[(4'hc):(3'h7)]));
            end
          else
            begin
              reg95 <= wire71[(3'h7):(1'h1)];
              reg96 <= (reg96 ?
                  (~&reg62) : $signed($unsigned(reg87[(3'h4):(3'h4)])));
              reg97 <= (+$signed($unsigned({$unsigned(wire71)})));
              reg98 <= reg86[(3'h6):(3'h5)];
              reg99 <= (((-({reg94} ?
                      $unsigned(reg96) : ((8'hab) ?
                          reg72 : reg81))) >>> $signed(reg89)) ?
                  $signed((((reg77 ^~ reg79) & {reg68,
                      (8'haa)}) | ($unsigned(reg90) ?
                      $unsigned(reg65) : (reg63 >= reg90)))) : ({{((8'ha0) ?
                                  reg57 : reg88),
                              {reg50, reg74}},
                          reg93[(3'h6):(2'h2)]} ?
                      $unsigned((~reg59[(4'hd):(2'h3)])) : reg96[(4'h8):(3'h7)]));
            end
        end
    end
  assign wire100 = {(reg78 >= $unsigned(($unsigned(reg88) * $unsigned((8'ha5))))),
                       {$unsigned((&$unsigned(reg61))), (!(8'ha6))}};
  module101 #() modinst131 (.wire103(reg54), .clk(clk), .wire105(reg75), .wire102(reg51), .wire104(reg79), .wire106(wire100), .y(wire130));
  assign wire132 = reg86[(1'h0):(1'h0)];
  module133 #() modinst145 (.wire137(reg76), .clk(clk), .y(wire144), .wire138(reg72), .wire135(reg63), .wire134(reg64), .wire136(wire70));
  assign wire146 = (((|((8'hbb) >> wire49)) ?
                       reg88[(4'hb):(4'h9)] : ({$signed(reg66),
                               $signed(reg56)} ?
                           reg61[(4'hf):(3'h7)] : (^~reg99[(4'hd):(4'h8)]))) ^ (^(~^reg54[(1'h0):(1'h0)])));
  assign wire147 = (wire146 << wire45[(4'h9):(3'h4)]);
endmodule

module module133
#(parameter param143 = (((({(8'hb9), (8'hb8)} != ((8'ha8) ? (8'hbe) : (8'h9f))) >> (^(8'hb6))) ? (&(~^((8'haa) <<< (8'hbd)))) : ((~^{(7'h40), (8'hb5)}) == (-((7'h43) ? (8'hbe) : (8'h9d))))) ? (((((8'hb2) ? (8'h9c) : (7'h44)) ? (8'haf) : ((8'hba) ? (7'h40) : (8'hb6))) ? (((8'hbe) ^ (8'hb8)) ? ((7'h41) + (8'hbc)) : ((8'had) * (8'ha0))) : (((8'hb2) ? (8'hb7) : (8'hb8)) << ((8'hac) ? (8'haf) : (8'h9c)))) >>> (({(8'hba)} <<< ((8'hb6) < (8'hac))) ? (((8'ha5) && (8'hb0)) ^ {(8'h9d), (8'h9f)}) : (((8'h9c) == (7'h43)) ? ((8'hbc) ? (8'hab) : (8'ha8)) : (-(8'ha3))))) : (((8'ha6) | (+{(8'ha7), (8'hb7)})) ? (((&(8'haf)) ? ((8'hbd) << (8'hb3)) : {(8'ha9)}) ? (~^(|(8'hba))) : ((~(7'h42)) ? (^(8'hb7)) : (8'haa))) : (((^(8'hb1)) - (8'hae)) ? (&((8'hb4) ? (8'ha0) : (8'hbe))) : (8'ha4)))))
(y, clk, wire138, wire137, wire136, wire135, wire134);
  output wire [(32'h21):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire138;
  input wire signed [(4'hd):(1'h0)] wire137;
  input wire [(5'h15):(1'h0)] wire136;
  input wire [(3'h5):(1'h0)] wire135;
  input wire signed [(3'h4):(1'h0)] wire134;
  wire [(3'h4):(1'h0)] wire142;
  wire [(5'h15):(1'h0)] wire141;
  wire signed [(3'h4):(1'h0)] wire140;
  wire signed [(2'h3):(1'h0)] wire139;
  assign y = {wire142, wire141, wire140, wire139, (1'h0)};
  assign wire139 = $unsigned(wire134[(2'h3):(1'h0)]);
  assign wire140 = ((-$signed({(~^wire139),
                       wire137[(4'hb):(4'h9)]})) * $unsigned((((wire138 ?
                           wire139 : wire139) ?
                       $unsigned(wire135) : wire139) - wire135)));
  assign wire141 = (wire138[(1'h0):(1'h0)] ?
                       wire135[(3'h5):(3'h5)] : (~|(+wire137[(4'ha):(4'h8)])));
  assign wire142 = (-($unsigned({((8'hb7) ? wire139 : (8'ha7)),
                       wire141}) && (((wire140 <= wire137) < wire139) ?
                       (wire140 ?
                           (wire139 >>> wire134) : $unsigned(wire140)) : wire135)));
endmodule

module module101
#(parameter param129 = ({(-(((8'hbd) ? (8'haf) : (8'ha4)) | ((8'hbf) ? (8'hb4) : (8'ha5))))} ? (((((8'ha0) + (8'h9d)) << ((8'hbe) ? (8'ha4) : (8'hb9))) > (((8'hbf) >= (8'hbd)) ? ((8'hb2) + (8'hba)) : ((8'h9e) ? (8'hb5) : (8'hb3)))) ? (&((~^(8'haa)) ? ((8'ha3) ? (8'ha6) : (8'had)) : (~^(8'ha2)))) : {(((8'hb1) ? (8'ha0) : (8'ha2)) * {(7'h43), (8'ha6)})}) : (8'hbc)))
(y, clk, wire106, wire105, wire104, wire103, wire102);
  output wire [(32'h152):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire106;
  input wire [(4'h8):(1'h0)] wire105;
  input wire signed [(4'hb):(1'h0)] wire104;
  input wire signed [(5'h13):(1'h0)] wire103;
  input wire signed [(4'hd):(1'h0)] wire102;
  wire signed [(3'h4):(1'h0)] wire128;
  wire signed [(5'h15):(1'h0)] wire127;
  wire signed [(5'h12):(1'h0)] wire124;
  wire signed [(5'h14):(1'h0)] wire123;
  wire [(5'h14):(1'h0)] wire122;
  wire [(5'h13):(1'h0)] wire121;
  wire signed [(5'h12):(1'h0)] wire120;
  wire [(4'ha):(1'h0)] wire113;
  wire [(4'h8):(1'h0)] wire112;
  wire signed [(5'h11):(1'h0)] wire111;
  wire [(5'h12):(1'h0)] wire110;
  wire [(3'h6):(1'h0)] wire109;
  wire [(4'hc):(1'h0)] wire108;
  wire signed [(5'h13):(1'h0)] wire107;
  reg signed [(5'h11):(1'h0)] reg126 = (1'h0);
  reg signed [(4'he):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg118 = (1'h0);
  reg [(5'h11):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg116 = (1'h0);
  reg [(4'hc):(1'h0)] reg115 = (1'h0);
  reg [(4'hd):(1'h0)] reg114 = (1'h0);
  assign y = {wire128,
                 wire127,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 reg126,
                 reg125,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 (1'h0)};
  assign wire107 = ($unsigned({$unsigned((wire105 & (7'h40))),
                       (~&(wire103 >> wire104))}) ^~ (wire104 + wire106));
  assign wire108 = $signed((wire107 | (wire105[(3'h6):(3'h5)] > ($unsigned((8'ha0)) ^ wire105[(3'h5):(2'h3)]))));
  assign wire109 = $unsigned((wire106[(1'h1):(1'h0)] ?
                       $signed(wire104[(2'h2):(1'h1)]) : {wire106}));
  assign wire110 = $unsigned(wire105);
  assign wire111 = ((wire110[(4'hb):(2'h3)] >> {(8'haf)}) ?
                       wire110[(4'hb):(4'hb)] : wire107[(4'h8):(3'h7)]);
  assign wire112 = (&($unsigned((|(wire106 ? wire109 : wire105))) ?
                       (((wire103 != wire103) << ((8'ha5) ?
                               wire111 : (8'ha1))) ?
                           (~^(!wire102)) : {wire109[(2'h2):(1'h1)]}) : $unsigned((wire104 ?
                           wire110[(5'h11):(3'h6)] : (wire102 ?
                               wire108 : wire102)))));
  assign wire113 = $unsigned(wire104[(2'h3):(1'h1)]);
  always
    @(posedge clk) begin
      reg114 <= ((wire109 ?
              ((wire105 >> (~|wire105)) ?
                  $unsigned($signed((8'h9f))) : {{wire107}}) : $signed($signed((^~wire112)))) ?
          (({wire102[(1'h1):(1'h1)]} ?
                  $signed(wire113) : (|$unsigned((8'h9f)))) ?
              wire103 : $unsigned($unsigned($signed(wire112)))) : (wire108 ?
              wire103[(3'h7):(3'h7)] : (wire107[(4'h8):(4'h8)] ?
                  wire102[(2'h2):(2'h2)] : wire110[(1'h0):(1'h0)])));
      if (wire113[(2'h2):(2'h2)])
        begin
          reg115 <= $signed((wire104 ?
              $signed(((8'ha6) | (wire106 || wire102))) : $signed($unsigned((wire113 ?
                  reg114 : (7'h42))))));
          reg116 <= $signed($unsigned(wire105));
          reg117 <= reg114[(1'h1):(1'h1)];
        end
      else
        begin
          reg115 <= (wire105 ? wire106 : wire109);
          reg116 <= $unsigned(wire110[(5'h10):(3'h5)]);
          reg117 <= ((!wire105) ?
              ((wire104 ?
                  wire112[(2'h3):(2'h3)] : reg114) ^ (^(+$signed(wire104)))) : (((^~$signed(wire107)) <<< wire108[(3'h4):(2'h3)]) <= (^~wire107[(4'h8):(2'h2)])));
        end
      reg118 <= $signed($signed($signed(wire105)));
      reg119 <= {$unsigned((&(-$unsigned(wire108))))};
    end
  assign wire120 = wire113[(3'h6):(2'h3)];
  assign wire121 = wire108[(3'h5):(1'h1)];
  assign wire122 = (wire106 ? (&$unsigned({$unsigned((8'hbd))})) : wire105);
  assign wire123 = ((8'ha8) ?
                       $unsigned(wire107[(4'hc):(4'ha)]) : $unsigned(reg115));
  assign wire124 = wire111;
  always
    @(posedge clk) begin
      reg125 <= reg119;
      reg126 <= $signed($signed(wire104));
    end
  assign wire127 = reg116;
  assign wire128 = $unsigned($unsigned($unsigned((|wire104))));
endmodule
