module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h187):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire36;
  wire signed [(4'he):(1'h0)] wire35;
  wire [(2'h3):(1'h0)] wire31;
  wire signed [(5'h14):(1'h0)] wire30;
  wire signed [(5'h12):(1'h0)] wire20;
  wire signed [(5'h12):(1'h0)] wire19;
  wire signed [(4'h8):(1'h0)] wire5;
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg6 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire31,
                 wire30,
                 wire20,
                 wire19,
                 wire5,
                 reg34,
                 reg33,
                 reg32,
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
  assign wire5 = (8'ha7);
  always
    @(posedge clk) begin
      if ({wire4,
          ((($unsigned((8'h9d)) >>> $unsigned(wire3)) ?
                  (wire1 >= {wire3}) : ((wire3 ~^ wire3) & (^~wire2))) ?
              wire1[(4'he):(3'h5)] : wire5[(3'h6):(2'h3)])})
        begin
          reg6 <= wire0[(2'h3):(1'h0)];
          reg7 <= (~({{wire2}, $unsigned(wire1[(3'h6):(3'h6)])} >>> wire5));
          reg8 <= wire4[(3'h4):(1'h1)];
        end
      else
        begin
          reg6 <= {(^{(^reg6), $unsigned(reg7[(1'h1):(1'h1)])})};
          reg7 <= $unsigned(((wire5 ?
              {$unsigned(wire1)} : (-$signed(wire1))) > (reg7[(4'h8):(2'h2)] && (&wire2[(2'h3):(2'h3)]))));
          if ({reg8[(3'h5):(1'h0)]})
            begin
              reg8 <= reg8[(2'h2):(1'h0)];
              reg9 <= $unsigned({$unsigned($signed({(8'h9e), wire2}))});
              reg10 <= (^((^$unsigned((wire4 | reg7))) >= wire0[(2'h3):(1'h1)]));
              reg11 <= ((8'hbf) >>> (-$unsigned((wire2 ?
                  $signed(reg6) : (wire4 + reg8)))));
            end
          else
            begin
              reg8 <= wire3;
              reg9 <= ((wire2[(1'h1):(1'h1)] ? reg10[(2'h3):(1'h1)] : reg8) ?
                  {$unsigned(reg7[(3'h6):(2'h2)])} : ({((8'hb4) <<< $signed(wire5))} && wire2));
              reg10 <= ((reg10 ^~ wire3) ^~ $signed((((8'hbf) - ((8'ha8) >> wire2)) <<< (+(+reg11)))));
              reg11 <= $unsigned(reg10);
              reg12 <= $signed($unsigned($unsigned((reg11[(3'h6):(2'h2)] >= reg11))));
            end
          if ($unsigned($unsigned(wire5)))
            begin
              reg13 <= {$signed(($signed((wire4 ?
                      reg11 : reg11)) < $unsigned(reg6[(3'h7):(3'h6)])))};
              reg14 <= reg6[(5'h13):(5'h11)];
              reg15 <= (|(reg10[(2'h3):(2'h3)] ?
                  ($unsigned($signed(reg11)) ?
                      ({reg6} ? (^(8'hab)) : $signed(reg13)) : reg13) : reg6));
              reg16 <= reg13;
              reg17 <= (&$signed(wire1[(3'h5):(3'h4)]));
            end
          else
            begin
              reg13 <= (~&(-(!wire4[(1'h1):(1'h0)])));
              reg14 <= $signed((~|$signed(wire5[(3'h4):(1'h1)])));
              reg15 <= $unsigned((reg7 + $signed({{reg10},
                  (reg15 ? reg16 : reg16)})));
            end
        end
      reg18 <= (~|{(~|($unsigned(wire1) ^~ (wire5 == reg9))),
          wire4[(2'h3):(2'h3)]});
    end
  assign wire19 = $unsigned((reg17[(3'h7):(3'h4)] == reg11));
  assign wire20 = (^~reg16[(3'h4):(1'h1)]);
  always
    @(posedge clk) begin
      reg21 <= reg15;
      if (reg11)
        begin
          reg22 <= $signed($signed($signed((reg6[(4'hf):(4'hd)] << (wire19 ^~ wire2)))));
          reg23 <= wire2;
          if ((|($unsigned($unsigned(wire20)) ?
              reg21 : ((reg22 * (-reg12)) ?
                  reg18 : ($unsigned(wire1) ? wire4 : (&reg9))))))
            begin
              reg24 <= $unsigned(({((^~wire3) ?
                          (wire2 ? (8'hb4) : reg21) : (|reg12))} ?
                  reg14[(3'h5):(2'h3)] : ((wire5 * (wire2 <= wire2)) ?
                      reg8 : {wire1[(1'h1):(1'h0)], reg21[(2'h2):(1'h1)]})));
              reg25 <= (|$signed(reg10[(1'h1):(1'h1)]));
              reg26 <= $signed(reg9[(2'h2):(1'h0)]);
              reg27 <= reg18[(4'hc):(3'h7)];
            end
          else
            begin
              reg24 <= $unsigned(reg25);
              reg25 <= reg15[(4'hd):(3'h6)];
              reg26 <= {($unsigned(($signed(reg26) ~^ (reg15 ^ wire1))) ?
                      {(8'hbd), (reg15 ? reg7 : (~reg24))} : {(~{reg26})}),
                  (+reg9[(3'h4):(3'h4)])};
            end
        end
      else
        begin
          reg22 <= reg25;
          reg23 <= ((|($signed((wire19 >> wire5)) != $unsigned(wire4))) ^~ (-((((8'ha7) ?
                  reg21 : wire0) <= {reg8, (8'hb4)}) ?
              wire2[(2'h2):(1'h1)] : ((~^reg26) <= reg17[(3'h7):(2'h3)]))));
        end
      reg28 <= reg16[(4'hc):(4'h9)];
      reg29 <= ((reg6[(2'h2):(1'h0)] << reg7[(4'ha):(4'ha)]) ?
          (((wire3[(2'h2):(1'h1)] ~^ (wire0 * reg9)) ?
                  ((~^reg8) && $signed(wire20)) : $signed($signed(reg27))) ?
              (wire2 >> (wire20[(3'h5):(3'h5)] << (reg8 ?
                  reg12 : (8'hb6)))) : ({(wire5 ? reg23 : wire3), (~&wire1)} ?
                  (reg17 || reg7[(4'he):(4'he)]) : ((reg8 <= (8'ha5)) ?
                      (reg24 ?
                          wire1 : wire19) : (!(8'hb7))))) : $unsigned((|(reg15[(4'hd):(4'h8)] != (reg14 ?
              reg14 : reg17)))));
    end
  assign wire30 = {$unsigned(((+(reg23 - reg13)) ?
                          reg6[(4'hd):(1'h1)] : ($unsigned(wire19) >> (wire5 ?
                              wire5 : reg23))))};
  assign wire31 = {{wire20[(2'h2):(1'h1)]},
                      ($signed(((reg8 ? wire1 : wire5) ?
                          (!wire19) : (-(8'ha6)))) && (~|reg26[(4'hd):(3'h7)]))};
  always
    @(posedge clk) begin
      reg32 <= wire1[(5'h12):(4'hc)];
      reg33 <= {(^(wire31 > {$signed(reg26)})),
          (~|(((reg18 <= reg9) ? $unsigned(wire2) : {reg18, reg12}) ?
              (-(~&wire20)) : $unsigned($unsigned((8'h9e)))))};
      reg34 <= (~^($signed($signed((reg22 & reg12))) != wire1));
    end
  assign wire35 = wire20;
  assign wire36 = (reg23 ~^ (|(|$signed(reg11[(3'h7):(2'h3)]))));
endmodule
