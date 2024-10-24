module top
#(parameter param68 = {{((((8'ha0) >>> (8'hb2)) ? ((8'hae) < (8'h9e)) : ((8'hae) & (8'h9e))) ? (((7'h42) > (8'hac)) ? (~|(8'hb1)) : (~|(8'hae))) : ({(8'haf)} ~^ ((7'h43) > (8'hb1)))), ((!((8'hb5) <= (8'h9c))) <= (-((7'h43) ? (8'h9c) : (8'hb5))))}, (+(^~((^(8'hab)) && ((8'h9d) > (8'hb5)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h13c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire67;
  wire signed [(5'h13):(1'h0)] wire66;
  wire signed [(4'h8):(1'h0)] wire64;
  wire [(5'h12):(1'h0)] wire28;
  wire [(4'ha):(1'h0)] wire27;
  wire [(3'h6):(1'h0)] wire26;
  wire [(2'h3):(1'h0)] wire25;
  wire signed [(4'he):(1'h0)] wire11;
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg4 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire64,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire11,
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
      if (wire1)
        begin
          if (wire3)
            begin
              reg4 <= (wire2[(3'h5):(3'h5)] ?
                  ({wire0[(2'h2):(1'h1)],
                      (8'hb9)} ^ (+wire0[(2'h2):(1'h0)])) : ($unsigned((~|(^wire2))) ?
                      ((wire2[(3'h6):(2'h2)] ? wire0 : wire3[(1'h0):(1'h0)]) ?
                          ((wire0 > wire1) ?
                              ((8'ha1) ~^ wire3) : wire2[(3'h7):(2'h2)]) : wire2[(3'h4):(2'h2)]) : (|$signed((wire0 ?
                          (8'h9c) : wire2)))));
            end
          else
            begin
              reg4 <= $signed(($signed((~|((8'hbc) <= reg4))) ?
                  wire2 : (|(+reg4))));
              reg5 <= ($unsigned((+(reg4[(2'h2):(2'h2)] ?
                      wire0[(1'h1):(1'h1)] : (wire0 <= wire3)))) ?
                  wire1[(1'h1):(1'h1)] : {(+$signed({reg4, wire3})),
                      wire1[(4'h8):(2'h2)]});
              reg6 <= (~&$signed($unsigned(wire3[(3'h5):(1'h0)])));
              reg7 <= $unsigned(wire0);
            end
          reg8 <= reg5;
          reg9 <= (~|($signed(($unsigned(wire3) ?
                  reg8[(3'h5):(2'h3)] : wire2)) ?
              $signed($unsigned((&reg8))) : $signed(reg6[(1'h0):(1'h0)])));
          reg10 <= (7'h41);
        end
      else
        begin
          reg4 <= ($unsigned(reg5[(5'h12):(2'h3)]) ?
              (8'ha4) : ((reg7[(4'hf):(4'he)] <= reg4) ?
                  $unsigned($unsigned((8'ha3))) : (reg8 >= (^~(~^reg5)))));
        end
    end
  assign wire11 = wire0[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      if (reg7)
        begin
          reg12 <= (~|reg9[(2'h2):(1'h0)]);
          reg13 <= $unsigned(($signed((reg8[(1'h1):(1'h1)] ?
              $unsigned(reg8) : (8'ha8))) ^~ reg7));
        end
      else
        begin
          reg12 <= reg5;
          reg13 <= {$signed(wire0)};
          if ($signed((~&(($signed(reg13) ?
                  wire11[(3'h4):(1'h0)] : $signed((7'h44))) ?
              (^(reg5 ? reg8 : reg7)) : reg9))))
            begin
              reg14 <= ((reg13[(5'h12):(3'h4)] ~^ ({reg4[(4'ha):(4'h8)]} ?
                      {$signed((8'h9e))} : wire3)) ?
                  ({(8'ha6)} ?
                      reg12[(4'h9):(4'h9)] : $signed((8'hb1))) : $signed((((reg6 <<< wire3) || $unsigned(wire1)) ?
                      (~|((8'h9c) ? reg13 : wire11)) : reg10[(2'h2):(1'h0)])));
              reg15 <= (((8'hb3) + (reg14[(2'h3):(1'h1)] >> ($signed(reg14) ?
                  (reg10 ? reg5 : reg10) : $unsigned((8'hbd))))) - (8'hbb));
              reg16 <= {(~&wire1[(2'h3):(1'h0)])};
              reg17 <= $signed((8'hb8));
            end
          else
            begin
              reg14 <= ((~^{wire1[(1'h0):(1'h0)]}) & {wire0[(2'h3):(1'h0)],
                  $signed((&$signed(wire1)))});
              reg15 <= reg17;
              reg16 <= (!wire1);
              reg17 <= (+reg5);
              reg18 <= $unsigned(reg5);
            end
          reg19 <= (($signed((~&wire3[(3'h4):(3'h4)])) ?
                  ({{(8'hb0), (7'h44)}} ?
                      $unsigned(reg9) : (reg12[(4'hf):(1'h1)] & wire0[(2'h3):(2'h3)])) : reg16) ?
              $signed(reg8[(3'h4):(1'h1)]) : ($signed({(&(8'ha1)),
                      reg10[(3'h6):(2'h2)]}) ?
                  reg17 : $unsigned($signed(wire3))));
        end
      if (($signed(reg9[(1'h0):(1'h0)]) - {(^~wire0), reg4}))
        begin
          reg20 <= $unsigned($unsigned(((8'hb6) && $signed({reg19, reg15}))));
          reg21 <= $signed($unsigned(reg20));
          reg22 <= (~|reg9[(2'h3):(1'h1)]);
          reg23 <= $unsigned((!{(wire0 >= (~&reg16)),
              ((reg9 ? reg8 : reg20) ? wire0 : (reg19 ? reg12 : reg7))}));
          reg24 <= ({($unsigned({reg8}) ~^ {{reg7, reg13}, (reg12 ^ reg22)}),
              (^wire1[(3'h7):(3'h7)])} - ((reg9 ?
                  wire3 : wire1[(4'h9):(1'h0)]) ?
              $signed({(reg8 == reg21)}) : (reg13[(5'h10):(1'h1)] >>> ((8'ha3) ?
                  (~^wire11) : $unsigned(reg17)))));
        end
      else
        begin
          reg20 <= reg23[(2'h2):(1'h0)];
          reg21 <= (8'hb3);
        end
    end
  assign wire25 = (((8'hbe) ?
                      $signed((+$unsigned(wire11))) : $signed(($unsigned(wire0) ?
                          (reg12 == reg19) : (^~reg23)))) >= {$signed(($signed(wire3) ^ (8'hb2)))});
  assign wire26 = ((reg6 || ($unsigned(reg20[(4'hc):(3'h5)]) ?
                      wire1[(3'h4):(2'h2)] : $signed((wire0 ^ reg17)))) == $unsigned((($unsigned(reg7) ?
                      (reg9 ?
                          reg24 : reg14) : (reg21 >= wire3)) << $unsigned(reg9[(1'h1):(1'h1)]))));
  assign wire27 = (($unsigned(wire2[(1'h1):(1'h1)]) ~^ (reg9[(2'h3):(1'h1)] ?
                          ($signed(reg5) ?
                              $signed(wire25) : (~|wire0)) : ((reg18 ?
                                  wire0 : reg13) ?
                              $unsigned(wire3) : $unsigned(wire2)))) ?
                      $signed((^$unsigned((reg18 ?
                          (7'h40) : reg10)))) : $unsigned({reg24[(3'h5):(3'h5)]}));
  assign wire28 = $unsigned(reg23);
  module29 #() modinst65 (.y(wire64), .clk(clk), .wire33(reg16), .wire31(reg18), .wire32(reg21), .wire30(reg17));
  assign wire66 = $unsigned((^(~&$unsigned(((7'h42) ? reg16 : wire28)))));
  assign wire67 = reg16;
endmodule

module module29  (y, clk, wire33, wire32, wire31, wire30);
  output wire [(32'h161):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire33;
  input wire signed [(5'h12):(1'h0)] wire32;
  input wire signed [(4'h8):(1'h0)] wire31;
  input wire signed [(3'h4):(1'h0)] wire30;
  wire [(2'h3):(1'h0)] wire63;
  wire [(5'h12):(1'h0)] wire62;
  wire signed [(4'hc):(1'h0)] wire61;
  wire signed [(3'h4):(1'h0)] wire57;
  wire signed [(4'hd):(1'h0)] wire56;
  wire [(5'h15):(1'h0)] wire53;
  wire signed [(5'h13):(1'h0)] wire52;
  wire [(3'h4):(1'h0)] wire51;
  wire [(5'h15):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire49;
  wire [(4'he):(1'h0)] wire48;
  wire signed [(5'h12):(1'h0)] wire42;
  wire signed [(4'hf):(1'h0)] wire41;
  wire [(5'h11):(1'h0)] wire40;
  wire [(5'h11):(1'h0)] wire39;
  wire signed [(4'hd):(1'h0)] wire38;
  wire [(4'hf):(1'h0)] wire37;
  wire signed [(3'h7):(1'h0)] wire36;
  wire [(2'h3):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire34;
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg58 = (1'h0);
  reg [(5'h12):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire57,
                 wire56,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 reg60,
                 reg59,
                 reg58,
                 reg55,
                 reg54,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 (1'h0)};
  assign wire34 = $unsigned(wire31[(3'h5):(1'h0)]);
  assign wire35 = $unsigned(((+$signed({wire32})) * $unsigned(wire34[(3'h7):(1'h1)])));
  assign wire36 = (8'hb8);
  assign wire37 = wire31;
  assign wire38 = wire37;
  assign wire39 = {$signed({wire33[(1'h1):(1'h0)],
                          {(-wire38), $unsigned(wire31)}}),
                      $signed({(wire38 <= (wire33 ? wire30 : wire35))})};
  assign wire40 = $unsigned($unsigned(((wire33[(2'h2):(1'h0)] == (wire36 ?
                      wire38 : (8'hb2))) ^ $unsigned(wire36[(2'h2):(2'h2)]))));
  assign wire41 = wire32[(1'h1):(1'h0)];
  assign wire42 = (!($signed({$unsigned(wire31), wire36}) ?
                      (((wire39 ? wire38 : wire31) ?
                              (wire33 ? wire30 : wire35) : (wire30 ?
                                  wire34 : wire31)) ?
                          $unsigned({wire35}) : $signed((wire39 - (8'ha4)))) : ((^~wire36) << (wire30[(3'h4):(1'h1)] ^~ wire37))));
  always
    @(posedge clk) begin
      reg43 <= wire33[(1'h1):(1'h0)];
      reg44 <= $unsigned(reg43[(3'h5):(3'h5)]);
      reg45 <= $signed((~|($unsigned((&wire35)) > ((wire41 <= wire37) ?
          ((7'h43) ? wire35 : wire31) : (wire36 ? wire30 : (8'haa))))));
      reg46 <= ((^~$signed((8'hae))) >= {wire37[(4'he):(2'h2)],
          ($signed($signed(reg44)) ? reg43 : (&{wire38}))});
      reg47 <= $signed({wire37});
    end
  assign wire48 = ($unsigned((~^(wire39 ?
                          (wire34 ? wire39 : wire42) : $signed(reg45)))) ?
                      ($signed((^$signed(wire34))) ?
                          $signed((wire34[(2'h2):(1'h0)] != (~^wire40))) : {(~^wire30[(2'h3):(2'h3)])}) : ((($unsigned(wire38) ?
                          wire38[(3'h7):(2'h2)] : (|reg44)) & wire42) <= wire35));
  assign wire49 = wire30[(1'h0):(1'h0)];
  assign wire50 = (($signed($signed($unsigned(reg46))) ~^ (+($unsigned(wire33) >> {wire48,
                          (8'hbc)}))) ?
                      (~$unsigned(($unsigned(wire42) ^~ $signed(wire31)))) : $unsigned(wire40));
  assign wire51 = wire38[(3'h7):(3'h6)];
  assign wire52 = {(((((8'had) ? wire42 : wire40) ?
                              $unsigned(wire39) : $signed(wire36)) * (-$unsigned(reg46))) ?
                          $unsigned(wire31[(1'h0):(1'h0)]) : (wire49 ?
                              (8'haa) : {$unsigned(wire38)}))};
  assign wire53 = {(+((~|(reg44 <<< wire35)) + $unsigned($signed(wire33))))};
  always
    @(posedge clk) begin
      reg54 <= {(~|{$signed((reg47 ? reg46 : reg47)), (reg46 + reg45)}),
          $signed(($signed((wire51 ? reg44 : wire35)) ?
              $unsigned((~^wire32)) : wire38[(1'h0):(1'h0)]))};
      reg55 <= $signed({wire41,
          {{{wire34, wire35}, $signed(wire39)}, $unsigned({wire40, wire38})}});
    end
  assign wire56 = $unsigned(reg45);
  assign wire57 = $unsigned((7'h42));
  always
    @(posedge clk) begin
      reg58 <= ((&{$unsigned((^(8'ha1))), (8'hb8)}) ?
          (^~((reg44[(1'h1):(1'h1)] ?
                  (wire32 ? (8'hab) : reg46) : $unsigned(wire40)) ?
              ($signed(wire32) > wire50) : wire34)) : $unsigned((7'h44)));
      reg59 <= (8'hb6);
      reg60 <= {(!{(reg43 * $unsigned(reg55)),
              (wire35 - (wire51 ? wire39 : wire48))}),
          $unsigned((wire30[(2'h3):(1'h0)] ?
              wire52 : $unsigned(wire38[(3'h4):(2'h3)])))};
    end
  assign wire61 = (~|$signed((wire40 ? {(+reg54)} : wire33)));
  assign wire62 = $unsigned((~&$unsigned($signed((8'ha4)))));
  assign wire63 = (wire33 ?
                      wire39[(4'ha):(2'h3)] : (!($signed((wire49 - wire33)) >> $unsigned((reg45 + reg45)))));
endmodule
