module top
#(parameter param32 = (~(((((8'h9d) ? (8'hb6) : (8'ha1)) != ((8'hb8) ? (8'ha4) : (8'hbc))) << (^~(~(8'h9e)))) ? ((((8'hb9) ? (8'hbf) : (8'ha6)) ^~ (~|(8'ha1))) ? (8'hb6) : (7'h41)) : (({(8'ha8), (8'ha7)} ? ((8'h9f) || (8'ha1)) : (-(8'hbd))) <= (((8'ha2) < (8'haa)) ? ((8'hb6) ? (8'hbb) : (8'h9d)) : ((8'hb8) & (8'hb2)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h136):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire20;
  wire [(4'he):(1'h0)] wire19;
  wire [(2'h2):(1'h0)] wire5;
  reg [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(4'h8):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg [(3'h4):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire5,
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
                 (1'h0)};
  assign wire5 = wire2[(3'h4):(2'h3)];
  always
    @(posedge clk) begin
      reg6 <= (wire4[(2'h2):(2'h2)] ?
          $signed($signed((~^wire3))) : (wire0[(1'h0):(1'h0)] ?
              (~|(((7'h43) ? wire2 : (8'hb9)) ?
                  (wire4 ?
                      wire1 : wire1) : (|wire0))) : $signed($unsigned(wire1))));
      if ({((~&$signed((8'hbb))) ?
              (wire1 != wire3[(1'h0):(1'h0)]) : (~&$unsigned((wire5 & (8'hac))))),
          {$signed($unsigned(wire0))}})
        begin
          if (wire0)
            begin
              reg7 <= (reg6[(1'h0):(1'h0)] ?
                  ({wire0[(1'h0):(1'h0)],
                      $unsigned((+wire2))} != (^~(~&$unsigned(wire4)))) : wire4[(2'h3):(1'h1)]);
              reg8 <= wire4;
              reg9 <= ($signed((~$signed((^reg7)))) ?
                  wire3 : (wire3 <= $signed($unsigned((^(8'hb5))))));
              reg10 <= (~&$signed((reg8 ?
                  wire1[(3'h4):(1'h1)] : ((^wire2) & (~&reg9)))));
            end
          else
            begin
              reg7 <= reg6[(2'h2):(1'h0)];
            end
          if ((($unsigned(reg10) ~^ reg9[(1'h0):(1'h0)]) ?
              (($unsigned($unsigned(reg10)) ^ (^~(^wire1))) ?
                  ({{wire4, wire1}, wire2} != $signed((wire4 ?
                      reg7 : reg6))) : $signed(((|wire2) ?
                      (reg7 ~^ reg8) : $signed(wire1)))) : $signed($signed(((~^reg9) ?
                  (&wire5) : wire1)))))
            begin
              reg11 <= $signed($unsigned((((reg10 ?
                  reg8 : wire5) ~^ $unsigned(wire2)) || ((~(8'hbc)) ?
                  (^(8'ha5)) : (-wire0)))));
              reg12 <= ((|wire2[(3'h7):(3'h6)]) || {reg7});
              reg13 <= $unsigned(({($unsigned(wire5) ?
                          $signed((7'h44)) : (wire0 == reg7)),
                      reg11} ?
                  ($signed(wire0) ?
                      reg6[(3'h6):(2'h3)] : $unsigned($unsigned(reg9))) : {$signed(reg9)}));
            end
          else
            begin
              reg11 <= $unsigned(((wire1 == wire3[(2'h2):(2'h2)]) < {($signed(wire5) | $unsigned((8'h9e)))}));
              reg12 <= reg13;
              reg13 <= wire3;
              reg14 <= reg9;
            end
          reg15 <= $signed(($signed(reg8) ?
              ($signed(reg10) ?
                  (|$signed(wire0)) : reg14[(3'h6):(3'h6)]) : wire2));
          reg16 <= $signed($signed(wire5));
        end
      else
        begin
          reg7 <= $signed(reg14[(2'h3):(1'h0)]);
          reg8 <= {((wire5 || (+$unsigned(wire4))) ?
                  (8'hac) : ((~wire4[(1'h1):(1'h0)]) <<< wire3))};
          if (reg11)
            begin
              reg9 <= (((wire0 ?
                      ((reg7 ?
                          wire5 : wire0) >> (&reg12)) : (wire0[(3'h4):(3'h4)] ?
                          wire1 : ((8'hbd) ? reg9 : reg8))) ^~ (8'ha9)) ?
                  wire1 : (($signed(((7'h42) == reg10)) ?
                      (8'hbf) : (wire5 & {reg8,
                          (8'haa)})) <= wire4[(3'h4):(1'h1)]));
              reg10 <= (wire3[(3'h4):(2'h2)] & (($unsigned((8'hbe)) ?
                      reg8[(4'ha):(1'h1)] : $signed((reg10 + wire5))) ?
                  $signed($unsigned(wire1[(3'h5):(3'h5)])) : ($signed($signed(wire2)) ?
                      $signed(reg15) : (8'had))));
              reg11 <= {{(^((!reg13) ^~ (reg8 ? reg15 : (8'hb2)))),
                      $unsigned(((reg14 ? wire4 : (8'hb5)) ?
                          (reg11 ? (8'ha1) : (8'ha1)) : $unsigned((8'h9f))))}};
              reg12 <= (~|({({reg14} ^~ ((8'hb6) ?
                      (8'hb9) : wire3))} >= (reg8[(1'h1):(1'h1)] >>> {{reg11},
                  (~|reg14)})));
              reg13 <= $signed(reg8);
            end
          else
            begin
              reg9 <= $signed(reg11);
              reg10 <= (~wire0[(3'h4):(2'h2)]);
              reg11 <= ((wire4[(3'h5):(3'h5)] ?
                  ({wire2[(3'h4):(1'h0)],
                      (reg13 ?
                          reg8 : reg16)} | reg10[(2'h2):(1'h0)]) : wire2) + {(((8'ha5) ^~ (wire2 ?
                          wire0 : reg16)) ?
                      reg8 : reg13[(2'h3):(2'h3)]),
                  (^~((!wire0) <<< reg11))});
              reg12 <= $unsigned((!{$unsigned((~^reg11))}));
              reg13 <= {{reg11, (+($unsigned(reg7) ? wire3 : $signed(reg15)))},
                  wire5};
            end
        end
      reg17 <= (~($unsigned($unsigned($signed(reg16))) * $signed((^~(reg11 ?
          (8'hb8) : wire4)))));
      reg18 <= $signed($signed($signed($signed({wire5}))));
    end
  assign wire19 = {(reg6[(3'h5):(1'h0)] ?
                          ((^~$signed(reg11)) - reg17) : (((wire1 >= reg8) && (reg15 | reg7)) ?
                              wire4[(3'h5):(3'h4)] : reg16)),
                      (wire0 ?
                          {$signed(reg12[(3'h5):(3'h5)]),
                              (&(~|reg7))} : (($signed(reg14) > (wire0 ?
                              reg8 : wire5)) || wire4[(1'h1):(1'h0)]))};
  assign wire20 = $signed(((((wire5 <= reg14) || {wire2, reg9}) ?
                      $unsigned(wire5[(1'h0):(1'h0)]) : ((reg10 + reg17) - (reg15 ^ reg13))) << reg11[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      if (((~((wire19 ? wire5[(1'h1):(1'h1)] : $signed(wire5)) ?
          $signed((reg7 >>> (7'h43))) : reg7[(2'h2):(1'h0)])) > {wire2[(1'h1):(1'h1)],
          (~|(~(wire2 > wire1)))}))
        begin
          reg21 <= (7'h42);
          reg22 <= reg7[(2'h3):(1'h1)];
          reg23 <= reg11[(2'h3):(2'h3)];
          reg24 <= wire5[(1'h0):(1'h0)];
          if ((~&$unsigned(reg21[(3'h5):(2'h3)])))
            begin
              reg25 <= reg11[(3'h6):(2'h2)];
              reg26 <= reg22[(3'h7):(3'h4)];
              reg27 <= (reg24[(3'h5):(2'h2)] < wire3[(3'h7):(3'h4)]);
              reg28 <= ((+(reg26[(2'h2):(1'h1)] ?
                  (wire20[(3'h7):(3'h5)] != (&reg14)) : reg25[(1'h0):(1'h0)])) - reg15[(3'h6):(3'h5)]);
              reg29 <= wire19;
            end
          else
            begin
              reg25 <= $unsigned($signed($unsigned((reg22 ?
                  (^~reg13) : $unsigned((8'hb7))))));
              reg26 <= $signed((7'h42));
            end
        end
      else
        begin
          reg21 <= reg16;
        end
      reg30 <= $signed(wire5);
      reg31 <= $signed(((((reg27 ? (8'hb5) : wire4) ?
          {(8'ha5), reg18} : (reg23 ?
              (8'hba) : reg13)) <<< (((8'hb7) <= reg25) ?
          (reg29 | reg10) : $unsigned(reg22))) == (reg8[(3'h7):(2'h2)] ?
          ((!reg17) >> $signed(wire0)) : (((8'hbc) && wire20) ?
              (-(8'hab)) : (reg15 ? reg6 : wire3)))));
    end
endmodule
