module top
#(parameter param41 = (&(^~(^(((8'h9f) ^ (8'hb6)) - ((7'h44) ? (8'hb2) : (8'hb7)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h19e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire40;
  wire signed [(4'h9):(1'h0)] wire39;
  wire signed [(4'hc):(1'h0)] wire38;
  wire [(5'h13):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire36;
  wire signed [(3'h4):(1'h0)] wire35;
  wire signed [(2'h3):(1'h0)] wire34;
  wire [(3'h4):(1'h0)] wire27;
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(4'hf):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg4 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire27,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
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
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (~($unsigned(($signed(wire3) && wire0)) + {wire0, wire3}));
      if (reg4)
        begin
          reg5 <= (+$signed($signed((wire3 ? wire0 : wire0[(2'h3):(2'h2)]))));
          reg6 <= (reg5 < $signed(reg4));
          reg7 <= {wire3[(3'h5):(1'h0)]};
          if ((((reg4[(3'h6):(2'h2)] - (~^$unsigned(reg6))) != ($unsigned((reg6 ?
                  wire0 : wire3)) ?
              $signed($unsigned(reg7)) : (!$signed((8'hba))))) && (wire1 ?
              ($unsigned(wire2[(1'h1):(1'h1)]) && wire2) : reg4[(3'h5):(1'h1)])))
            begin
              reg8 <= (reg4[(2'h2):(1'h0)] ?
                  wire1 : (^$unsigned(($unsigned(wire0) ?
                      (reg7 ? reg4 : wire0) : {reg6}))));
              reg9 <= $signed(((reg4 || ((reg5 ?
                  (8'haf) : reg4) == {wire3})) + (~&wire0)));
              reg10 <= (~wire2[(3'h4):(3'h4)]);
              reg11 <= (+reg6[(4'hd):(3'h7)]);
            end
          else
            begin
              reg8 <= (|(wire2 ?
                  ((reg9[(4'h9):(4'h8)] < (wire2 != reg5)) ?
                      reg11 : ({wire3,
                          reg11} > (8'ha4))) : wire3[(2'h3):(2'h2)]));
              reg9 <= (!(~wire1));
              reg10 <= wire2;
              reg11 <= $signed($signed(wire2[(2'h2):(1'h1)]));
            end
        end
      else
        begin
          reg5 <= (!wire1[(3'h4):(1'h0)]);
          reg6 <= ((wire3[(1'h0):(1'h0)] ?
                  {{(reg10 ? reg10 : reg4)},
                      (+reg10[(1'h0):(1'h0)])} : {(reg6[(1'h0):(1'h0)] >> {reg4}),
                      $unsigned((reg4 ? reg8 : reg11))}) ?
              ((^~$unsigned((^~reg8))) >>> (!reg9[(3'h4):(3'h4)])) : (+$signed($signed((-reg4)))));
          reg7 <= ((wire0 != $signed((~reg4[(4'hb):(4'h8)]))) == (((((8'hb9) ?
                      (8'hbe) : reg11) ^~ (reg10 ~^ reg10)) ?
                  reg8[(2'h3):(2'h2)] : wire3[(3'h4):(3'h4)]) ?
              (|(~^(reg9 ? wire2 : reg4))) : (((reg8 ? wire2 : reg5) ?
                      (+reg8) : {reg11}) ?
                  $signed(wire1) : wire1)));
        end
      reg12 <= reg4;
      if (wire3)
        begin
          reg13 <= reg12[(2'h3):(2'h2)];
        end
      else
        begin
          if (wire1[(1'h0):(1'h0)])
            begin
              reg13 <= $signed(((~^(~|reg11[(3'h5):(3'h4)])) ?
                  wire2[(2'h2):(1'h0)] : ((|(reg5 ? reg10 : wire1)) ?
                      {{reg10}} : $signed((reg12 ? reg8 : reg5)))));
              reg14 <= $signed(reg5[(4'h9):(3'h7)]);
            end
          else
            begin
              reg13 <= ($unsigned((((reg6 ? (7'h43) : (7'h43)) ?
                  {reg13,
                      reg4} : $unsigned(reg7)) & (((8'hb5) << reg11) || $signed(reg11)))) < reg7);
            end
          reg15 <= $signed($unsigned(reg7));
          reg16 <= (reg4[(4'h9):(3'h5)] & {(($signed(reg6) ?
                  (~reg7) : {(8'hae)}) <<< $unsigned((reg15 <<< wire3))),
              ($signed(reg6) ?
                  ($unsigned(reg15) ?
                      $signed(reg5) : reg9) : reg5[(4'hf):(1'h1)])});
        end
      if ({reg6[(4'hd):(4'h8)], $signed(wire3)})
        begin
          reg17 <= (reg4 >> ((-((+(8'hb5)) < reg7)) ?
              ((~^reg14) >= ((reg14 ? reg13 : reg14) >> (reg13 ?
                  reg15 : reg9))) : (+(reg11[(4'hb):(3'h7)] ?
                  $signed(wire3) : $signed(reg6)))));
          reg18 <= reg4[(4'hc):(3'h7)];
          reg19 <= $signed($unsigned(($unsigned((reg11 ?
              (8'haf) : wire1)) >> $signed((reg7 > reg9)))));
          reg20 <= $unsigned((~^(8'ha7)));
        end
      else
        begin
          if ($signed({($unsigned($signed(reg5)) >= ((reg10 ?
                  (8'ha1) : wire3) == reg12[(3'h7):(1'h1)])),
              $unsigned((~^$signed(wire3)))}))
            begin
              reg17 <= reg18[(3'h7):(1'h1)];
              reg18 <= {reg13[(2'h3):(1'h1)], reg19[(2'h2):(1'h0)]};
            end
          else
            begin
              reg17 <= ((8'haf) ?
                  ((~&$signed((!reg17))) > (({reg10} - reg7) >= reg13[(1'h1):(1'h0)])) : $signed((|{(&reg5)})));
              reg18 <= $signed(((($signed(reg12) ? reg15 : $unsigned((8'hb3))) ?
                  ($unsigned(reg11) <= (~^reg13)) : (reg15 <= $unsigned(reg14))) ^~ ({reg9[(3'h6):(3'h4)]} + $signed($unsigned(reg11)))));
              reg19 <= $unsigned($unsigned($unsigned({wire3[(3'h4):(1'h1)],
                  reg17})));
              reg20 <= reg15[(4'h9):(4'h9)];
              reg21 <= $unsigned(($unsigned(((reg4 - reg16) == $unsigned(reg18))) - reg11));
            end
        end
    end
  always
    @(posedge clk) begin
      reg22 <= $signed(({wire3} && $unsigned(($unsigned((8'ha8)) && reg6))));
      reg23 <= reg15[(1'h0):(1'h0)];
      reg24 <= reg4;
      reg25 <= (|((~|reg13[(2'h2):(2'h2)]) | (!wire1)));
      reg26 <= reg21[(1'h0):(1'h0)];
    end
  assign wire27 = reg12;
  always
    @(posedge clk) begin
      reg28 <= (((~|$signed((reg11 ~^ reg11))) ?
          reg21[(2'h2):(1'h1)] : wire27) && (+reg22[(1'h0):(1'h0)]));
      reg29 <= {reg13};
      if (reg5)
        begin
          reg30 <= reg25[(3'h7):(2'h3)];
          reg31 <= (($unsigned($signed($signed(reg5))) ?
              reg10[(1'h1):(1'h1)] : reg6) << reg7);
        end
      else
        begin
          if (reg11)
            begin
              reg30 <= $signed(wire1[(2'h3):(1'h0)]);
              reg31 <= $signed($signed((|(&$signed(reg25)))));
              reg32 <= ((((reg10[(2'h3):(1'h0)] >= (reg23 ^ reg25)) ?
                      $unsigned(reg13) : $signed({reg7,
                          wire3})) * reg19[(2'h2):(1'h1)]) ?
                  ({(reg6 ? reg19 : $unsigned(reg12))} >= {reg24,
                      $unsigned($signed(reg22))}) : reg19[(2'h3):(1'h1)]);
              reg33 <= ((^(({reg32, reg11} ?
                      reg16[(4'h9):(1'h1)] : $unsigned(reg18)) ~^ $signed((8'h9d)))) ?
                  $signed(($unsigned($signed(reg19)) ?
                      (^~reg17[(3'h4):(1'h0)]) : $signed((^reg9)))) : {{(reg29 & (reg28 == reg4))},
                      reg7});
            end
          else
            begin
              reg30 <= reg29[(4'hb):(4'h9)];
              reg31 <= $signed((reg9 < reg11));
              reg32 <= reg21;
              reg33 <= reg21[(1'h1):(1'h1)];
            end
        end
    end
  assign wire34 = reg15[(1'h0):(1'h0)];
  assign wire35 = (^$signed({wire2[(1'h1):(1'h0)]}));
  assign wire36 = reg10[(2'h3):(2'h2)];
  assign wire37 = reg24;
  assign wire38 = (|$signed($signed(reg20[(3'h7):(3'h4)])));
  assign wire39 = reg20;
  assign wire40 = reg26;
endmodule
