module top
#(parameter param67 = (^(~&{(8'ha7)})), 
parameter param68 = {param67})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1a0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire66;
  wire [(5'h13):(1'h0)] wire64;
  wire signed [(5'h12):(1'h0)] wire38;
  wire [(4'h8):(1'h0)] wire37;
  wire [(4'hf):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg [(3'h6):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg5 = (1'h0);
  reg [(4'he):(1'h0)] reg4 = (1'h0);
  assign y = {wire66,
                 wire64,
                 wire38,
                 wire37,
                 wire36,
                 wire7,
                 wire6,
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
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (((wire2[(4'hc):(1'h0)] >= wire2[(4'h9):(3'h7)]) + wire3) - wire2);
      reg5 <= (~^(!wire2));
    end
  assign wire6 = reg4[(4'hb):(4'ha)];
  assign wire7 = $signed(wire6);
  always
    @(posedge clk) begin
      reg8 <= wire2[(1'h1):(1'h0)];
      reg9 <= ((($signed($signed(wire3)) ?
                  (reg5[(3'h6):(3'h4)] && $unsigned((8'hb0))) : {$signed(reg5),
                      (wire0 >>> wire2)}) ?
              reg8 : $unsigned(wire7)) ?
          wire0[(1'h1):(1'h1)] : wire7[(1'h1):(1'h0)]);
      if (((~^(($unsigned(wire2) > (8'ha1)) == (((8'hb3) << wire2) ^ (reg8 ?
              wire1 : reg4)))) ?
          $unsigned(reg8) : wire7))
        begin
          if ((($unsigned((+wire3)) ?
                  (((wire3 ? reg4 : reg8) ? (8'hb7) : wire1[(3'h4):(3'h4)]) ?
                      (~(reg8 && reg8)) : wire0) : $signed((7'h43))) ?
              {{reg8}} : {(wire2 >> (~&(8'hb2))), wire2}))
            begin
              reg10 <= $signed($signed(wire0));
              reg11 <= reg8;
              reg12 <= $signed({((~^{wire7, wire0}) < ((wire3 < wire7) ?
                      $signed(reg5) : (wire6 | wire6))),
                  (((wire6 ? wire0 : reg9) ? (^reg10) : (reg10 ~^ (8'ha8))) ?
                      wire1 : ($signed(reg11) ? reg11 : reg5))});
            end
          else
            begin
              reg10 <= (reg9 ?
                  $unsigned({($unsigned(reg4) ? wire1[(2'h2):(2'h2)] : {reg5}),
                      $unsigned($signed(reg11))}) : (&{(wire3 ?
                          (8'haa) : $signed(reg9)),
                      {wire1, $signed((8'ha2))}}));
              reg11 <= ((~$unsigned(wire0[(1'h1):(1'h0)])) ?
                  (~^(^(~|(reg11 > reg11)))) : (|((8'ha8) ?
                      ((wire1 ^ wire0) ?
                          (reg8 - reg8) : ((8'ha8) ?
                              wire3 : wire7)) : $signed($unsigned(wire1)))));
              reg12 <= (((^$signed((wire6 >>> reg8))) ?
                  (|($signed(reg12) << reg4)) : reg5[(1'h1):(1'h0)]) + $unsigned(((~^(wire7 * (7'h42))) ?
                  ($unsigned(reg12) <<< reg5[(3'h6):(2'h3)]) : $signed($unsigned(reg11)))));
              reg13 <= $signed(((!(8'hb4)) < ($signed((reg11 ?
                  wire2 : wire0)) > {(~^wire3)})));
              reg14 <= $signed(($unsigned(((8'h9f) >>> (8'hb7))) | reg12[(3'h7):(3'h5)]));
            end
          reg15 <= $unsigned(((reg14[(1'h1):(1'h1)] ? reg12 : wire3) & reg4));
          reg16 <= reg5[(1'h0):(1'h0)];
        end
      else
        begin
          reg10 <= ((!wire3) & (reg13[(3'h4):(2'h3)] >> wire2[(4'ha):(4'ha)]));
          reg11 <= (reg5[(3'h4):(2'h2)] ?
              reg4 : ((^~$unsigned(((8'hb3) >> wire0))) ?
                  ($signed(wire6[(1'h1):(1'h0)]) <= ((^~wire6) ?
                      (~^reg9) : (reg14 && reg10))) : $signed((~|$unsigned((8'ha5))))));
        end
      reg17 <= {reg4, $signed((!reg16[(4'h8):(3'h5)]))};
      reg18 <= reg17[(2'h2):(1'h1)];
    end
  always
    @(posedge clk) begin
      if ((reg5[(2'h2):(1'h1)] ^~ $signed($signed($signed($unsigned((7'h43)))))))
        begin
          reg19 <= (|{reg11, (-$signed($signed(reg17)))});
        end
      else
        begin
          if ((7'h41))
            begin
              reg19 <= $signed({$signed($unsigned(wire7[(4'h9):(2'h2)])),
                  (((8'ha6) ?
                      reg19[(4'hb):(3'h7)] : reg16[(4'h8):(2'h3)]) < (-reg8[(2'h2):(1'h1)]))});
            end
          else
            begin
              reg19 <= reg14[(2'h2):(1'h0)];
              reg20 <= $unsigned(($signed($unsigned((~&reg10))) <= {$unsigned((wire7 ?
                      (7'h40) : reg13))}));
              reg21 <= $unsigned(((~|{$signed(reg5)}) ?
                  reg13 : ({reg13[(4'h9):(2'h2)], wire7} ?
                      (&$unsigned(reg4)) : reg14)));
              reg22 <= (^~(($signed(reg14) ~^ $unsigned(wire7)) ?
                  $unsigned({{reg18}}) : $signed((!(8'hae)))));
              reg23 <= (-reg16);
            end
        end
      if ({reg4})
        begin
          if (((($signed((reg8 ? (8'ha3) : (8'hb3))) ?
                  ((~reg19) ?
                      (wire3 ?
                          reg5 : reg5) : $signed((8'hb7))) : $signed((!reg22))) & (reg14[(2'h3):(1'h0)] ?
                  reg22 : {$signed(reg13)})) ?
              (wire7 >> reg10) : reg12[(3'h4):(1'h1)]))
            begin
              reg24 <= reg16;
              reg25 <= $unsigned({$signed((&reg11)), reg24[(3'h6):(1'h0)]});
              reg26 <= reg11[(2'h2):(1'h1)];
              reg27 <= $unsigned({wire2[(2'h3):(2'h2)], reg17[(1'h1):(1'h0)]});
            end
          else
            begin
              reg24 <= reg25;
            end
          if (({(wire2[(3'h5):(3'h5)] & $signed((reg9 - wire0)))} ?
              $signed(reg9) : reg8))
            begin
              reg28 <= (((reg17[(3'h6):(1'h0)] ? $signed({reg13}) : (8'ha3)) ?
                  {reg11} : reg5) <= $unsigned((~^$signed(((8'hb0) >= reg24)))));
              reg29 <= (^reg22[(1'h0):(1'h0)]);
              reg30 <= reg12[(3'h4):(2'h2)];
            end
          else
            begin
              reg28 <= $signed({({$signed(reg15)} >> reg24[(4'ha):(3'h6)])});
              reg29 <= (wire7 ? reg11[(2'h2):(1'h1)] : reg19);
            end
          reg31 <= $signed($unsigned($unsigned((^(wire2 >>> reg29)))));
          reg32 <= (reg8[(3'h5):(1'h1)] ?
              $signed(((reg18[(4'hd):(1'h0)] & $signed(reg11)) | $signed((reg24 ?
                  reg31 : reg29)))) : $unsigned((reg27[(4'hc):(3'h6)] << reg20[(3'h5):(3'h4)])));
          reg33 <= reg8[(3'h4):(1'h0)];
        end
      else
        begin
          reg24 <= reg29[(4'hf):(3'h6)];
          reg25 <= ((^~reg21[(1'h0):(1'h0)]) && $unsigned((({reg23} >= reg32) ?
              (~&reg17) : wire0[(3'h7):(3'h4)])));
          reg26 <= (reg33[(1'h1):(1'h1)] && (wire1 * (((reg16 <<< reg10) >>> $unsigned(reg12)) <= reg28)));
        end
      reg34 <= $signed((($unsigned((reg17 || reg9)) ?
          $unsigned((reg31 ? reg9 : (8'ha7))) : (reg32[(1'h1):(1'h0)] ?
              {reg14, reg33} : reg17)) || ((+(reg19 ? (8'ha2) : reg11)) ?
          $unsigned($signed((8'ha5))) : reg4[(2'h2):(1'h0)])));
      reg35 <= ($unsigned(reg16[(4'h8):(1'h1)]) ? wire2[(1'h1):(1'h0)] : reg24);
    end
  assign wire36 = (reg31 << ({wire1} ?
                      $signed($unsigned($unsigned(reg30))) : (^~$signed({wire3}))));
  assign wire37 = (+reg9[(2'h2):(1'h1)]);
  assign wire38 = ({$signed(($signed((8'hbd)) ?
                              (reg16 ? reg22 : reg31) : $unsigned(reg24)))} ?
                      ($unsigned((reg14 ?
                              {(8'hb8), reg25} : ((8'hbb) ? (8'h9c) : wire0))) ?
                          {(reg13[(4'hd):(3'h6)] ?
                                  (reg9 | reg8) : reg20[(2'h3):(1'h0)])} : $signed($unsigned((+reg25)))) : reg35);
  module39 #() modinst65 (wire64, clk, reg14, reg4, reg30, reg19);
  assign wire66 = (~^$signed(($signed((^~reg19)) || $unsigned($signed(reg31)))));
endmodule

module module39
#(parameter param63 = (^(((((7'h40) ~^ (7'h43)) ~^ (~|(8'hb5))) + ({(8'ha5), (8'ha2)} >> ((8'hb4) ? (8'hb2) : (8'hab)))) ? ({(~&(8'hb4)), (~(8'hae))} ? (((8'ha6) || (8'hbd)) ? {(8'hb9)} : ((8'ha2) >>> (8'hbd))) : (~((8'hb2) << (8'hba)))) : ({((8'hb9) ? (8'hb3) : (8'hbd))} ? (|(8'ha1)) : ((~^(8'h9c)) ? ((8'ha3) ? (8'ha9) : (8'hb0)) : ((7'h40) ? (8'ha7) : (8'hb8)))))))
(y, clk, wire43, wire42, wire41, wire40);
  output wire [(32'hce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire43;
  input wire signed [(3'h4):(1'h0)] wire42;
  input wire signed [(4'hd):(1'h0)] wire41;
  input wire signed [(4'hf):(1'h0)] wire40;
  wire [(4'hd):(1'h0)] wire62;
  wire signed [(5'h15):(1'h0)] wire52;
  wire signed [(3'h5):(1'h0)] wire48;
  wire signed [(3'h4):(1'h0)] wire47;
  wire [(5'h10):(1'h0)] wire46;
  wire [(4'hd):(1'h0)] wire45;
  wire signed [(4'he):(1'h0)] wire44;
  reg [(3'h7):(1'h0)] reg61 = (1'h0);
  reg [(2'h2):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg [(4'hc):(1'h0)] reg55 = (1'h0);
  reg [(3'h7):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg [(2'h3):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  reg [(4'hd):(1'h0)] reg49 = (1'h0);
  assign y = {wire62,
                 wire52,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg51,
                 reg50,
                 reg49,
                 (1'h0)};
  assign wire44 = wire40[(2'h2):(2'h2)];
  assign wire45 = (8'ha4);
  assign wire46 = (!(^wire42));
  assign wire47 = wire40;
  assign wire48 = ((~^wire40) ?
                      wire40[(4'ha):(3'h5)] : $unsigned($signed(wire40[(2'h2):(2'h2)])));
  always
    @(posedge clk) begin
      reg49 <= $signed((8'hbe));
      reg50 <= (wire40 >> (~|(wire44[(4'hb):(4'h8)] * ((~&wire43) != wire41))));
      reg51 <= wire47;
    end
  assign wire52 = ($unsigned(($unsigned($signed(wire42)) ~^ $signed({wire46,
                          wire45}))) ?
                      (^~(~(-wire42[(3'h4):(1'h1)]))) : (~^$unsigned({$signed(reg49),
                          (wire47 ^~ wire42)})));
  always
    @(posedge clk) begin
      if (wire41[(3'h4):(1'h0)])
        begin
          reg53 <= (8'hbd);
          reg54 <= $signed(((~(+wire52)) ?
              ($signed($signed(wire44)) ?
                  $unsigned($unsigned(wire44)) : (8'hac)) : (8'hb3)));
        end
      else
        begin
          if ($signed(wire48))
            begin
              reg53 <= (wire42 ?
                  ((+$unsigned(wire41[(4'hb):(1'h1)])) > $unsigned($unsigned((wire46 ?
                      (8'hb4) : wire46)))) : wire46);
              reg54 <= wire41[(1'h1):(1'h0)];
            end
          else
            begin
              reg53 <= (|{(wire41 ^~ reg50)});
              reg54 <= $signed(wire42);
              reg55 <= $unsigned({(!(reg53 ?
                      (reg49 ? reg53 : wire44) : {wire42}))});
              reg56 <= ($signed(($signed((wire44 == (7'h43))) ?
                  (~^((8'hb6) - wire52)) : (|(reg51 >= wire43)))) < ((&({wire40} ?
                  wire52[(4'h8):(4'h8)] : wire47[(1'h1):(1'h0)])) << ($signed({(8'hab)}) && (wire52 & (wire44 ?
                  wire42 : wire45)))));
            end
          reg57 <= $signed((8'hb1));
        end
      reg58 <= wire45;
      reg59 <= $unsigned((($unsigned((|wire44)) ?
              $unsigned((-reg56)) : $signed(((8'hbd) ? wire40 : reg57))) ?
          $unsigned((~&reg49)) : (({reg58, (8'hb8)} ?
              (~&wire48) : ((8'hb8) ?
                  reg50 : reg51)) * $signed($signed(reg58)))));
      reg60 <= wire52;
      reg61 <= {$unsigned(reg54),
          (((((8'h9f) ^ (8'ha4)) ?
                  $unsigned(wire47) : (reg50 ? wire43 : wire46)) ?
              ((reg57 > reg55) ?
                  ((8'ha4) ^ (7'h40)) : ((7'h40) ? reg59 : reg58)) : ({wire52,
                  reg54} >>> (~wire43))) | $signed($unsigned(reg53[(3'h5):(3'h5)])))};
    end
  assign wire62 = (!reg50[(3'h4):(1'h0)]);
endmodule
