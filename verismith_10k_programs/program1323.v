module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire41;
  wire [(3'h7):(1'h0)] wire40;
  wire [(4'he):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire4;
  assign y = {wire41, wire40, wire38, wire4, (1'h0)};
  assign wire4 = wire2;
  module5 #() modinst39 (wire38, clk, wire3, wire0, wire4, wire2);
  assign wire40 = wire0;
  assign wire41 = wire0[(4'hd):(4'h9)];
endmodule

module module5
#(parameter param37 = (((8'h9c) | ((~^((8'ha5) > (8'hb7))) ? ((8'hbd) ? (|(7'h43)) : ((8'hbe) >> (8'hb3))) : (((8'hb0) ? (7'h43) : (8'hac)) ? (8'had) : (^~(8'h9e))))) ? ({{{(8'hb5)}}} ? {(((8'hb3) < (8'ha5)) != ((8'hb0) ~^ (8'hb4))), (-(~(8'hab)))} : ((^~((8'hbd) ? (8'ha7) : (8'haf))) ? {((7'h44) ^ (8'h9c))} : (~^((8'hb5) ? (7'h41) : (8'ha7))))) : ((({(8'ha4), (8'ha5)} != ((8'hae) - (7'h42))) ^~ (8'h9d)) ? ((((8'hb7) - (8'hb7)) >> {(8'hb6), (8'hb0)}) <= ((^(8'ha1)) > ((8'hb3) ? (8'ha4) : (8'hb7)))) : ((((8'hb7) ? (8'hbb) : (8'hb3)) ? ((8'h9f) >> (8'h9e)) : {(8'h9c), (8'hb3)}) + (-(8'ha6))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h149):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire9;
  input wire signed [(5'h13):(1'h0)] wire8;
  input wire signed [(4'h9):(1'h0)] wire7;
  input wire [(4'h9):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire36;
  wire [(4'h8):(1'h0)] wire35;
  wire [(5'h15):(1'h0)] wire28;
  wire signed [(5'h11):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire26;
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire28,
                 wire27,
                 wire26,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= $signed((-wire6[(2'h2):(2'h2)]));
      reg11 <= $signed((wire8[(3'h6):(3'h4)] ~^ reg10[(2'h3):(1'h1)]));
      if (reg10[(1'h0):(1'h0)])
        begin
          reg12 <= wire9[(4'h8):(1'h1)];
          reg13 <= $signed(wire6[(3'h5):(2'h2)]);
          reg14 <= $unsigned($unsigned($signed(wire8[(3'h7):(2'h3)])));
          reg15 <= (~$unsigned((reg13 || ((7'h44) + (reg13 ?
              reg10 : (8'hac))))));
          if ({$unsigned(reg12[(3'h5):(3'h4)]), reg13})
            begin
              reg16 <= ((($signed((reg15 <= reg15)) + $signed($unsigned((8'hbd)))) | $unsigned(wire6)) ?
                  wire6[(3'h6):(3'h5)] : $signed(reg15[(3'h5):(2'h2)]));
              reg17 <= $unsigned($unsigned(reg15[(3'h6):(1'h1)]));
              reg18 <= $signed(wire7);
            end
          else
            begin
              reg16 <= $signed($unsigned({(^~(8'had)), reg14[(2'h3):(1'h0)]}));
              reg17 <= $signed((wire9 ?
                  (wire7 != $unsigned(wire6)) : wire6[(3'h5):(2'h2)]));
              reg18 <= $unsigned($unsigned((reg14 ?
                  $signed((!reg14)) : (^~reg13[(5'h11):(3'h5)]))));
            end
        end
      else
        begin
          reg12 <= (~&reg13);
        end
      if (((((^~reg18[(2'h2):(1'h1)]) <<< (|(-reg14))) * ($signed((+(7'h40))) | (7'h42))) ?
          ((reg11[(4'ha):(1'h0)] ?
              (((8'hb0) ?
                  reg17 : reg12) >> $signed(wire6)) : $unsigned((&reg18))) <<< $unsigned($unsigned((reg12 >= reg11)))) : (8'hb7)))
        begin
          reg19 <= (8'ha5);
          reg20 <= ($signed((^(reg14 >>> (|reg12)))) > reg14[(2'h2):(1'h1)]);
          reg21 <= (|(8'hba));
          reg22 <= wire9;
        end
      else
        begin
          reg19 <= (|((reg11[(4'hd):(4'hc)] == $unsigned($unsigned(wire7))) ?
              reg14[(2'h3):(1'h0)] : (!{(^~reg19), $signed(reg10)})));
          if ($unsigned(((&($signed((7'h41)) >> reg13)) > ($unsigned(wire6[(4'h9):(2'h3)]) ?
              (wire6 ? reg18 : {reg14, (8'hb5)}) : (-(reg19 >>> (8'haa)))))))
            begin
              reg20 <= reg11;
              reg21 <= $signed(wire7[(4'h9):(2'h3)]);
              reg22 <= $unsigned($signed((&reg17[(4'hd):(4'h9)])));
              reg23 <= {((reg19[(5'h14):(2'h3)] <= {$signed((8'h9c)),
                      wire9}) >> $unsigned((^(wire6 != reg10)))),
                  $signed(((&reg10) ? {$unsigned(wire6)} : reg14))};
            end
          else
            begin
              reg20 <= ($signed($signed((^$unsigned(wire8)))) ?
                  reg10 : ($unsigned((^(reg12 <= wire6))) ?
                      {$unsigned($signed((8'h9f))),
                          {{reg16}}} : (wire8 && $unsigned(reg15))));
              reg21 <= ($signed(($unsigned($unsigned((8'hb0))) ^~ ($unsigned(reg17) ?
                      reg19[(4'hd):(4'hc)] : $signed(reg11)))) ?
                  (wire6[(3'h5):(2'h2)] < {$unsigned((wire6 - reg23)),
                      $unsigned($signed(reg19))}) : reg19[(2'h2):(1'h0)]);
              reg22 <= $unsigned(((~|reg14[(1'h0):(1'h0)]) ?
                  (((wire6 || reg17) << reg16[(2'h2):(2'h2)]) + ((reg16 ?
                          wire9 : reg14) ?
                      (reg12 - wire9) : $unsigned(reg17))) : $unsigned($signed((wire9 ?
                      reg15 : wire6)))));
              reg23 <= ($unsigned((!{(!wire6), (reg10 ? reg20 : (8'h9d))})) ?
                  (~wire8) : reg15);
            end
          reg24 <= {$unsigned((7'h41))};
          reg25 <= $signed($signed(reg21[(3'h7):(1'h0)]));
        end
    end
  assign wire26 = $unsigned(((~&(8'hb5)) || (-({reg15,
                      reg17} | $signed((8'ha1))))));
  assign wire27 = $unsigned(wire26[(3'h7):(2'h2)]);
  assign wire28 = reg24;
  always
    @(posedge clk) begin
      reg29 <= $unsigned((8'hbb));
      if (reg29)
        begin
          if ($unsigned({reg20[(2'h3):(1'h0)], $unsigned((^$unsigned(reg20)))}))
            begin
              reg30 <= (reg10 ?
                  $signed($signed(((wire27 == reg17) ~^ (wire7 ?
                      reg11 : (8'hae))))) : (($signed(reg11) ?
                          wire27 : (!reg16)) ?
                      (reg17[(4'h9):(3'h7)] < $unsigned((^reg14))) : reg13));
              reg31 <= (~^wire27[(1'h1):(1'h1)]);
              reg32 <= {(8'h9f), reg12[(4'h8):(3'h7)]};
            end
          else
            begin
              reg30 <= $unsigned($signed(wire26[(4'hf):(4'hb)]));
              reg31 <= (((!(8'hbb)) < (8'h9d)) ~^ $signed((~|reg25[(2'h3):(2'h2)])));
            end
          reg33 <= (^~(-reg21[(4'h8):(4'h8)]));
        end
      else
        begin
          reg30 <= wire7[(4'h8):(1'h1)];
          reg31 <= reg11;
        end
      reg34 <= ($signed({{$unsigned(reg22),
              $signed(reg22)}}) - (($signed((|reg20)) ?
          $signed((reg15 ?
              reg29 : reg14)) : reg13) ~^ (reg31[(2'h2):(2'h2)] ~^ $unsigned($signed(wire27)))));
    end
  assign wire35 = $unsigned(reg20);
  assign wire36 = reg10[(2'h3):(1'h0)];
endmodule
