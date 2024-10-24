module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire20;
  wire [(4'hb):(1'h0)] wire19;
  wire signed [(3'h6):(1'h0)] wire18;
  wire signed [(4'hf):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = $unsigned((wire3[(2'h3):(1'h0)] ?
                     ((~^(wire0 != (8'ha8))) > {wire4,
                         (^wire0)}) : wire2[(4'h9):(1'h1)]));
  assign wire6 = wire1[(3'h6):(1'h1)];
  always
    @(posedge clk) begin
      reg7 <= wire6;
      reg8 <= (&$unsigned((wire2[(4'hb):(2'h2)] ?
          $unsigned((wire6 ? wire1 : reg7)) : $signed($signed((8'ha9))))));
      reg9 <= (~|reg7);
      if (wire1[(4'ha):(4'h9)])
        begin
          if ($unsigned({$signed($unsigned(wire4[(5'h15):(4'hb)]))}))
            begin
              reg10 <= $signed({($unsigned((reg8 * wire4)) ?
                      (|wire3) : (+(wire0 ? reg9 : wire0)))});
              reg11 <= $unsigned(($signed(reg10) | $signed($unsigned((8'ha0)))));
              reg12 <= {$unsigned((+wire0[(1'h1):(1'h0)])),
                  reg7[(3'h7):(2'h3)]};
              reg13 <= $unsigned(reg10[(3'h5):(1'h0)]);
            end
          else
            begin
              reg10 <= reg10;
              reg11 <= reg10[(2'h2):(1'h1)];
              reg12 <= ($unsigned((wire5[(4'h8):(3'h7)] ?
                      reg10[(2'h3):(1'h0)] : wire0)) ?
                  (^$unsigned(reg8[(1'h1):(1'h0)])) : $unsigned(wire4));
            end
          reg14 <= reg8[(2'h3):(1'h0)];
          reg15 <= $unsigned($signed((|($unsigned(reg8) * $unsigned(reg7)))));
          reg16 <= ($unsigned($unsigned(((wire5 ? reg7 : reg12) ?
                  (reg14 << reg12) : reg8))) ?
              $unsigned(reg14) : wire3[(2'h3):(2'h3)]);
        end
      else
        begin
          reg10 <= $unsigned(((-reg7[(2'h2):(1'h0)]) ?
              (reg9[(5'h11):(4'hc)] ?
                  (^(wire6 ?
                      reg11 : reg15)) : $signed((^wire6))) : $signed($unsigned(wire1))));
        end
    end
  assign wire17 = {$unsigned({{$unsigned(reg10), reg13}})};
  assign wire18 = reg14;
  assign wire19 = $unsigned($unsigned($unsigned($unsigned(reg15[(5'h10):(5'h10)]))));
  assign wire20 = wire0;
endmodule
