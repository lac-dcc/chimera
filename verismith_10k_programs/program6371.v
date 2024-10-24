module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1a2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire36;
  wire [(5'h14):(1'h0)] wire35;
  wire signed [(4'he):(1'h0)] wire5;
  reg [(4'hd):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire5,
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
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = wire2;
  always
    @(posedge clk) begin
      reg6 <= wire4;
      if (((~(~|((|reg6) << ((8'hae) > wire5)))) ?
          (8'h9f) : (^(((~^(8'ha8)) & ((8'hb1) && wire4)) <<< $signed((wire2 == wire3))))))
        begin
          if (wire0[(3'h5):(3'h4)])
            begin
              reg7 <= $unsigned(wire1[(1'h0):(1'h0)]);
              reg8 <= (-($signed($signed(wire1[(5'h11):(4'hc)])) ?
                  $unsigned((8'hba)) : {$signed((~|wire1)), wire2}));
            end
          else
            begin
              reg7 <= $unsigned(wire5);
              reg8 <= ((wire1[(5'h10):(4'he)] << (^~{(wire5 && reg7), wire1})) ?
                  {(^~wire5), wire4[(1'h1):(1'h1)]} : (~|{$unsigned({reg7,
                          reg6}),
                      {{(8'ha2)}, wire5[(3'h7):(2'h2)]}}));
              reg9 <= reg7;
              reg10 <= (($signed($signed((wire2 ? wire1 : wire5))) >> wire0) ?
                  ($unsigned($signed((wire2 ? (8'ha4) : wire0))) ?
                      $signed({reg7,
                          wire1[(1'h1):(1'h0)]}) : wire5[(3'h6):(3'h5)]) : $signed(wire4));
              reg11 <= $unsigned(wire0[(3'h4):(1'h0)]);
            end
          if ((wire0 <= (($unsigned((8'had)) ?
                  (wire3[(1'h1):(1'h1)] || (wire1 ?
                      (8'ha3) : wire3)) : $signed($unsigned(reg7))) ?
              wire1 : ({(~|wire2)} > $signed((wire4 > wire3))))))
            begin
              reg12 <= wire2;
              reg13 <= $signed($unsigned((~&(+(wire3 ? reg11 : reg6)))));
            end
          else
            begin
              reg12 <= $unsigned(($unsigned($signed(wire5)) ?
                  ($signed((wire2 ? wire2 : (7'h40))) ?
                      $unsigned((^~wire5)) : ((wire5 ?
                          reg6 : (8'hb5)) == reg8[(4'ha):(4'h9)])) : wire1));
            end
        end
      else
        begin
          reg7 <= $signed($unsigned((^~(|wire3))));
          reg8 <= (~((($unsigned(wire3) ?
                      (reg9 ? reg12 : wire4) : $signed((8'hb1))) ?
                  (8'hb9) : $signed($signed(reg12))) ?
              (reg8 ?
                  $unsigned((wire5 ^~ (8'hac))) : wire2[(2'h2):(1'h1)]) : (($unsigned(wire5) ?
                  {wire5} : $unsigned(reg12)) <<< ($unsigned(reg7) >>> wire2))));
        end
      reg14 <= {$signed($unsigned($signed($unsigned(wire3)))),
          {reg11, (^($unsigned(wire3) ? reg6[(4'hb):(2'h2)] : (8'hb1)))}};
      reg15 <= $signed((reg8 ?
          (reg7[(1'h1):(1'h0)] | (8'hb7)) : (wire4 & (^~$signed(wire2)))));
      reg16 <= wire5[(1'h1):(1'h0)];
    end
  always
    @(posedge clk) begin
      if ($unsigned((((+(~&reg6)) == $signed($unsigned(reg13))) ?
          ((wire0[(4'h8):(3'h7)] - $unsigned(reg15)) != wire0) : $unsigned((reg11[(2'h3):(1'h0)] ?
              wire1[(3'h7):(3'h4)] : (reg9 ? reg14 : reg10))))))
        begin
          reg17 <= $unsigned($unsigned((|($signed(reg6) + $signed(reg15)))));
          reg18 <= (&wire4[(4'h9):(4'h8)]);
          if (($unsigned($signed($signed($signed(reg17)))) ?
              $signed(reg15[(3'h6):(2'h2)]) : reg16))
            begin
              reg19 <= reg7[(1'h0):(1'h0)];
              reg20 <= reg11;
              reg21 <= reg10;
            end
          else
            begin
              reg19 <= (wire3 ? {reg14} : reg17);
              reg20 <= (8'hb2);
            end
          reg22 <= $unsigned(reg7);
        end
      else
        begin
          reg17 <= reg17[(2'h2):(1'h0)];
          reg18 <= $unsigned($signed(reg18[(5'h11):(5'h11)]));
          if ((~(~^$signed(((~&(8'hb4)) ? wire3[(1'h1):(1'h1)] : {(8'ha0)})))))
            begin
              reg19 <= (&{reg8[(3'h6):(2'h2)],
                  ((reg12 <<< reg18) != reg21[(2'h2):(1'h0)])});
              reg20 <= $signed($unsigned($signed($unsigned($signed((8'hb3))))));
              reg21 <= ((|$unsigned((~|(reg22 ? wire4 : reg22)))) ?
                  (~&reg7[(1'h1):(1'h1)]) : reg17);
              reg22 <= (wire0[(3'h4):(3'h4)] || ((!(~|$unsigned(wire1))) && (((reg14 ?
                      reg11 : wire5) ?
                  $unsigned(reg19) : reg6) ^~ $unsigned($unsigned(reg14)))));
            end
          else
            begin
              reg19 <= reg9;
              reg20 <= (^reg15[(4'h8):(3'h7)]);
            end
          reg23 <= reg13[(4'h9):(3'h5)];
          reg24 <= (wire2[(1'h0):(1'h0)] ?
              $unsigned($unsigned($unsigned(((8'ha9) * (8'hb0))))) : $unsigned({reg22[(2'h2):(2'h2)],
                  wire1}));
        end
    end
  always
    @(posedge clk) begin
      reg25 <= (($unsigned($unsigned(reg9[(3'h7):(3'h5)])) ?
              (|wire4[(4'hf):(4'hd)]) : {{reg8[(4'ha):(2'h3)]},
                  ({wire3} ? $signed(reg8) : $unsigned(reg12))}) ?
          {reg15[(3'h6):(3'h4)]} : reg15[(4'ha):(1'h1)]);
      reg26 <= $signed($signed(wire3));
      if ({(~^reg21[(2'h3):(2'h2)]), (^$unsigned((~$unsigned(wire3))))})
        begin
          reg27 <= {reg6,
              $signed(($unsigned((wire5 && reg25)) ? wire0 : reg25))};
          reg28 <= {reg14};
          reg29 <= reg14;
        end
      else
        begin
          if ((8'hac))
            begin
              reg27 <= $signed((~^$signed(($signed((8'hb7)) ?
                  (~wire2) : wire0[(3'h4):(2'h2)]))));
              reg28 <= (^$unsigned(((reg7 ^~ reg24) ?
                  {(reg8 ? reg27 : reg23), (reg26 ~^ wire0)} : reg13)));
              reg29 <= ((reg24[(4'hd):(4'hc)] ?
                      $unsigned($unsigned(reg10[(5'h10):(2'h3)])) : (7'h44)) ?
                  ((&(|((8'hb8) ?
                      reg19 : reg10))) != $unsigned(($unsigned((8'hb7)) ?
                      reg21 : (^~reg29)))) : $signed((^~($signed(wire5) >>> reg23))));
            end
          else
            begin
              reg27 <= (~^reg9[(2'h3):(1'h0)]);
              reg28 <= {$signed((reg15[(1'h1):(1'h1)] ?
                      ((reg14 & reg10) ?
                          (+wire3) : $unsigned((8'ha2))) : $signed(reg8[(3'h6):(3'h4)]))),
                  (((+$unsigned(reg19)) >> {{reg11,
                          reg13}}) ^ (~^{$signed(reg25), $signed(reg19)}))};
              reg29 <= $signed($signed((~&$signed($unsigned(wire1)))));
              reg30 <= (reg15[(2'h2):(1'h0)] < $unsigned(((wire2 ?
                      (reg25 * wire4) : (reg20 ? reg13 : (8'hba))) ?
                  $signed((reg9 ?
                      reg25 : reg8)) : $unsigned($signed((8'hbc))))));
            end
          reg31 <= (&reg13[(3'h7):(3'h4)]);
          reg32 <= reg19;
          reg33 <= wire2[(1'h1):(1'h0)];
          reg34 <= wire5;
        end
    end
  assign wire35 = (reg33[(3'h4):(2'h3)] ?
                      ({(reg24[(3'h6):(1'h1)] ~^ {wire4, (8'h9f)}),
                              (~&$signed(wire4))} ?
                          reg19[(1'h0):(1'h0)] : (-(~^$signed(wire3)))) : reg31);
  assign wire36 = (-reg13);
endmodule
