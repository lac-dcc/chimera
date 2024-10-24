module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h101):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire26;
  wire [(3'h5):(1'h0)] wire21;
  wire signed [(4'hf):(1'h0)] wire20;
  wire signed [(4'he):(1'h0)] wire19;
  wire signed [(4'h9):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire21,
                 wire20,
                 wire19,
                 wire7,
                 wire6,
                 wire5,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
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
                 (1'h0)};
  assign wire5 = wire0[(5'h13):(4'hb)];
  assign wire6 = wire1;
  assign wire7 = wire0[(4'ha):(1'h0)];
  always
    @(posedge clk) begin
      if ({wire1[(3'h6):(2'h2)]})
        begin
          reg8 <= $unsigned(wire7);
          if ($signed(wire2))
            begin
              reg9 <= wire4[(1'h1):(1'h1)];
              reg10 <= $signed((^(+reg9[(2'h2):(1'h0)])));
              reg11 <= (^(^($unsigned({wire2}) == $signed(wire0))));
              reg12 <= (&$signed(((reg9[(1'h0):(1'h0)] + $unsigned(wire3)) ^ wire3)));
            end
          else
            begin
              reg9 <= wire0[(2'h2):(1'h0)];
              reg10 <= reg12;
              reg11 <= (reg8 ?
                  ($signed($unsigned({reg10})) <= {wire6[(1'h1):(1'h1)],
                      (((8'hb4) ^ (8'hab)) ?
                          (reg9 ?
                              wire5 : (8'h9e)) : reg9[(3'h4):(2'h2)])}) : wire0[(2'h2):(1'h0)]);
              reg12 <= reg11;
              reg13 <= wire6;
            end
          reg14 <= $signed(((^(wire5 == (reg8 > reg13))) ?
              wire5 : (reg13[(3'h4):(1'h0)] > wire5[(4'h9):(3'h4)])));
        end
      else
        begin
          reg8 <= $signed(($unsigned(reg13[(4'ha):(4'ha)]) ?
              wire6[(2'h2):(1'h1)] : $signed((~|$unsigned((8'hb6))))));
        end
      reg15 <= (wire3 ?
          ({$signed(((8'hb1) * (8'ha0))),
              reg12[(3'h6):(3'h6)]} >= ($unsigned((8'haa)) ?
              (8'hac) : ((wire3 - reg14) ? reg12 : $unsigned(wire1)))) : wire4);
      if ($unsigned($unsigned({{(reg13 != (7'h42))}})))
        begin
          reg16 <= $signed((reg10 ?
              $unsigned($signed($unsigned((8'ha9)))) : reg15[(1'h1):(1'h0)]));
          reg17 <= $unsigned((reg16 ^ reg8[(3'h6):(3'h6)]));
        end
      else
        begin
          reg16 <= wire3;
          reg17 <= (wire4 ? wire4 : (8'ha7));
        end
      reg18 <= wire4;
    end
  assign wire19 = $unsigned($unsigned((~^($unsigned(wire7) || wire4))));
  assign wire20 = ($unsigned($unsigned(wire1)) ?
                      (!{$signed((^(8'hb7))),
                          (wire19[(4'he):(3'h5)] ?
                              (wire19 ?
                                  wire6 : reg8) : reg17)}) : $signed(reg15));
  assign wire21 = ({wire3[(1'h0):(1'h0)]} << wire2);
  always
    @(posedge clk) begin
      reg22 <= $signed($signed(reg17[(1'h1):(1'h0)]));
      reg23 <= (-wire21);
      reg24 <= ($unsigned($unsigned($unsigned($signed(wire5)))) >>> reg11[(1'h0):(1'h0)]);
      reg25 <= ($unsigned((($unsigned(wire3) - $signed(reg15)) >= wire20)) ?
          ($unsigned(((wire1 ? wire5 : reg15) ?
              (reg10 ? reg10 : wire6) : wire4)) >> (reg17[(1'h0):(1'h0)] ?
              $signed({wire2, reg14}) : wire1)) : reg9[(1'h0):(1'h0)]);
    end
  assign wire26 = {reg23[(2'h3):(1'h0)]};
  assign wire27 = $signed(wire7[(2'h3):(1'h0)]);
endmodule
