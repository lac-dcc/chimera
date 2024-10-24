module top
#(parameter param20 = (-(~|(!({(8'hbf), (8'ha3)} | {(8'ha5), (7'h43)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire19;
  wire signed [(5'h14):(1'h0)] wire18;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire4;
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire6,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = (^~(wire0[(3'h7):(3'h6)] >>> $unsigned(wire3)));
  assign wire5 = {wire4};
  assign wire6 = (wire5 ? wire2[(2'h3):(2'h3)] : wire4[(3'h4):(1'h0)]);
  always
    @(posedge clk) begin
      reg7 <= ($signed((wire0 ?
              wire3 : ((8'hb7) ? {(8'haf), wire5} : {wire0}))) ?
          $unsigned(wire3) : ({($signed(wire5) ?
                  (wire0 ? wire6 : wire3) : (wire5 ? (8'ha7) : wire5)),
              wire5[(2'h3):(1'h1)]} != (wire6 ?
              $signed({wire0}) : ($unsigned(wire4) ?
                  $unsigned(wire4) : wire5[(1'h1):(1'h0)]))));
      if (wire4)
        begin
          reg8 <= ((&$signed({$signed((8'ha9)), wire2})) ?
              wire6 : $signed(wire6[(4'h8):(1'h0)]));
        end
      else
        begin
          reg8 <= $signed(reg8[(1'h1):(1'h1)]);
        end
      if ($signed((wire6[(3'h6):(2'h3)] ?
          $signed(wire1[(3'h4):(1'h0)]) : (-($signed(wire0) ?
              $unsigned(wire2) : wire5[(2'h3):(2'h3)])))))
        begin
          reg9 <= wire5;
          reg10 <= (wire5 ? (!wire5) : $unsigned(reg7));
        end
      else
        begin
          reg9 <= reg9;
          reg10 <= ($signed($unsigned(reg7[(1'h0):(1'h0)])) ?
              $unsigned((-({reg7} ~^ (reg7 ?
                  (8'hbc) : wire5)))) : $signed((-($unsigned((8'ha6)) || wire4))));
          reg11 <= $signed($signed((|wire0)));
          if (wire2)
            begin
              reg12 <= wire6;
              reg13 <= (~&$unsigned(reg10));
              reg14 <= ($unsigned((|(&(wire4 ? reg12 : wire5)))) ~^ wire4);
            end
          else
            begin
              reg12 <= (^(^~(($signed(wire1) ?
                  (wire3 < reg10) : wire4[(1'h0):(1'h0)]) == (((8'h9c) >= reg9) ?
                  $unsigned(reg10) : $unsigned(reg7)))));
              reg13 <= ((($signed((wire2 ?
                  (8'h9f) : reg8)) & $signed($signed(wire0))) != {wire1[(1'h1):(1'h1)]}) || ({$unsigned((8'ha2)),
                      reg12[(2'h2):(1'h0)]} ?
                  $unsigned($unsigned($signed((8'ha3)))) : ((wire4 & reg10) ?
                      reg13 : reg14[(1'h0):(1'h0)])));
              reg14 <= reg14[(3'h4):(3'h4)];
              reg15 <= ($unsigned($unsigned($signed((reg8 ?
                  reg14 : wire3)))) * $signed({(reg14[(3'h4):(2'h2)] * (^wire6)),
                  reg12}));
            end
        end
      reg16 <= wire6;
      reg17 <= $signed($signed({((reg9 >> wire4) ?
              reg9[(4'ha):(2'h2)] : $signed(wire3)),
          wire0[(2'h3):(1'h0)]}));
    end
  assign wire18 = (((&({reg15} ?
                          ((8'hbf) ~^ reg16) : $unsigned(reg13))) & (($signed(reg17) ?
                          reg17 : reg7[(3'h4):(1'h1)]) != (7'h40))) ?
                      $signed((&{reg8[(3'h4):(1'h0)]})) : ((($unsigned((8'hbc)) && $unsigned(reg17)) ?
                          wire2[(5'h12):(5'h10)] : $signed((^(8'hbc)))) >>> wire4));
  assign wire19 = $signed(((~^$signed((reg15 ? wire18 : (8'hb6)))) ?
                      reg12[(3'h7):(2'h2)] : reg14));
endmodule
