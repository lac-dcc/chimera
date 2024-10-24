module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h133):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire28;
  wire [(2'h3):(1'h0)] wire18;
  wire signed [(4'hc):(1'h0)] wire5;
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg6 = (1'h0);
  assign y = {wire28,
                 wire18,
                 wire5,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
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
  assign wire5 = ($unsigned({$signed((+wire1))}) ^ $signed(($unsigned(wire0[(3'h4):(2'h2)]) - wire0)));
  always
    @(posedge clk) begin
      reg6 <= $signed((~$signed((~|((8'hba) ? wire4 : wire3)))));
      reg7 <= {wire5, wire2[(5'h10):(4'hf)]};
    end
  always
    @(posedge clk) begin
      if ($signed({(~^(8'ha1)), $signed(((-wire1) == reg7))}))
        begin
          if ($unsigned($signed(wire1[(3'h4):(3'h4)])))
            begin
              reg8 <= wire0[(3'h5):(1'h0)];
              reg9 <= reg8[(3'h4):(2'h2)];
              reg10 <= $unsigned((wire4[(3'h4):(2'h2)] | (^~$signed((&(8'hb5))))));
              reg11 <= wire4;
              reg12 <= ($unsigned($unsigned(reg11)) <<< $signed($unsigned(({wire4,
                      reg10} ?
                  (wire2 || wire5) : $signed(wire4)))));
            end
          else
            begin
              reg8 <= ((reg7 ?
                  $unsigned(($signed(reg9) & (~^reg11))) : $unsigned(($signed((8'hb8)) ?
                      wire1[(4'hb):(2'h2)] : $signed(wire1)))) >> $signed({wire1[(4'h9):(2'h3)],
                  (reg12 ? {reg11, reg6} : (reg12 ? reg12 : wire4))}));
              reg9 <= {$unsigned($unsigned((~&(wire4 && reg9)))),
                  wire4[(3'h6):(1'h1)]};
              reg10 <= $signed((reg10 >> reg12[(2'h3):(2'h2)]));
              reg11 <= (((|wire4[(2'h2):(2'h2)]) ?
                  $signed(($unsigned(wire3) ?
                      ((8'ha0) ?
                          wire0 : wire4) : $signed(wire2))) : {(!(reg10 - wire5))}) || {$signed($unsigned((wire2 ?
                      reg12 : wire5)))});
              reg12 <= ($unsigned($signed($unsigned((reg11 == reg6)))) | (-$signed((~^((8'hb2) >>> wire5)))));
            end
          if ($unsigned((~|(wire2[(3'h7):(3'h6)] ?
              $signed(wire0) : ((~^wire2) ? (^~(8'hb8)) : $unsigned(wire2))))))
            begin
              reg13 <= $signed($unsigned((wire1 ?
                  {{reg8}} : (-$unsigned(wire4)))));
            end
          else
            begin
              reg13 <= ($signed(wire1[(1'h0):(1'h0)]) ?
                  (+((wire4[(1'h0):(1'h0)] == (wire2 | reg13)) ?
                      $signed((-wire4)) : reg9)) : (~^{wire5,
                      (reg13 - $unsigned(reg9))}));
              reg14 <= $unsigned($signed($unsigned(((reg13 ?
                  reg7 : reg12) == reg7[(4'he):(4'hc)]))));
              reg15 <= (-$signed($signed(reg11)));
              reg16 <= $signed(reg10);
              reg17 <= ($unsigned($unsigned($unsigned((reg11 != wire0)))) ?
                  $signed($signed((~&reg10[(3'h7):(2'h3)]))) : (8'h9e));
            end
        end
      else
        begin
          reg8 <= ($signed((((~^reg14) > $unsigned((8'ha2))) == ((reg13 >= wire5) >>> {reg17,
              reg8}))) < {wire3[(4'hd):(3'h5)],
              $signed((((7'h40) ? wire2 : (8'ha7)) ?
                  $signed(reg9) : (wire3 > (8'haa))))});
          if (reg13)
            begin
              reg9 <= $unsigned(reg17[(3'h4):(3'h4)]);
              reg10 <= ($unsigned($signed(reg13)) <= (-(-wire4)));
              reg11 <= (&(reg17 || wire1));
              reg12 <= wire5[(4'h9):(2'h3)];
            end
          else
            begin
              reg9 <= {($signed($unsigned((reg14 - reg6))) ?
                      ((+(wire5 << reg13)) | (&((8'haa) ?
                          reg16 : reg15))) : reg14),
                  $signed((+(8'hb7)))};
              reg10 <= ($unsigned(wire3[(4'hf):(3'h4)]) >= ($signed($unsigned((-reg6))) ?
                  $unsigned($unsigned((reg9 ?
                      wire0 : wire1))) : (|({reg8} ^~ {wire4}))));
              reg11 <= reg11[(4'ha):(3'h7)];
              reg12 <= (8'hbb);
              reg13 <= reg14[(1'h0):(1'h0)];
            end
          reg14 <= (^~reg6);
          reg15 <= {(-$unsigned(wire5)), (-{(reg6 | (!reg7))})};
          reg16 <= ($unsigned($signed($unsigned(reg8[(3'h5):(1'h1)]))) ?
              ($signed($signed(((8'ha7) ?
                  wire1 : wire0))) <<< (($signed((8'ha4)) || reg9[(4'ha):(3'h6)]) < reg16)) : (-{$unsigned((reg16 << wire1))}));
        end
    end
  assign wire18 = ($signed(wire0) ?
                      ((-reg15) && $signed((8'hbd))) : (~^reg12[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg19 <= (8'hbc);
      if ((($signed(reg12[(3'h5):(1'h0)]) ?
          (+(reg14 * (-wire3))) : reg13[(2'h3):(2'h2)]) < (8'ha1)))
        begin
          reg20 <= $signed(reg17[(3'h7):(3'h7)]);
          reg21 <= $unsigned((8'hb0));
        end
      else
        begin
          if ((reg17[(3'h4):(2'h3)] ?
              $signed($signed((((7'h42) ^ reg14) >= reg15[(3'h7):(3'h6)]))) : reg19[(2'h3):(2'h2)]))
            begin
              reg20 <= wire4[(1'h1):(1'h1)];
              reg21 <= (((^~(reg15[(3'h7):(3'h7)] ?
                      $unsigned(reg13) : (reg7 != reg13))) | $unsigned($unsigned($signed(reg20)))) ?
                  (|((^(~|reg16)) != ((reg8 ? reg19 : wire2) ?
                      (reg12 ? reg15 : reg8) : {reg21,
                          wire3}))) : (~&(reg14[(3'h5):(2'h3)] >= ((reg17 ?
                          reg17 : wire2) ?
                      (reg20 ? reg7 : wire4) : (reg20 ? wire18 : reg14)))));
              reg22 <= $signed({(reg17[(2'h2):(1'h1)] ?
                      (wire4 ?
                          ((8'hb1) ? (8'hbd) : (8'hb4)) : (reg14 ?
                              (8'ha1) : reg17)) : (8'ha1))});
              reg23 <= ($signed((+(^(7'h42)))) == ($unsigned((wire18 && $unsigned(reg22))) ^ reg11[(3'h6):(3'h6)]));
              reg24 <= reg12[(4'ha):(4'h8)];
            end
          else
            begin
              reg20 <= wire18;
              reg21 <= {$unsigned($signed($unsigned($signed(reg8)))),
                  (((~&$unsigned(reg12)) ?
                          (^~$unsigned((8'haa))) : reg12[(4'ha):(3'h6)]) ?
                      wire2[(2'h3):(2'h3)] : wire3)};
            end
        end
      reg25 <= $signed((~^(wire4 & ((&reg23) > $unsigned(wire2)))));
      reg26 <= $unsigned((($unsigned(wire0) ^ reg16[(4'he):(1'h0)]) ?
          reg20[(2'h3):(1'h1)] : ((wire2 != reg10) ?
              $signed((^~reg23)) : reg17[(3'h4):(3'h4)])));
      reg27 <= (-{reg14[(2'h2):(1'h1)], reg25[(2'h3):(2'h3)]});
    end
  assign wire28 = (|reg23[(3'h7):(3'h5)]);
endmodule
