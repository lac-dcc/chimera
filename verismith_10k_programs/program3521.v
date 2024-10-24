module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h97):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire14;
  wire [(4'hc):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire5;
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(2'h2):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(2'h3):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  assign y = {wire18,
                 wire14,
                 wire13,
                 wire6,
                 wire5,
                 reg17,
                 reg16,
                 reg15,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = (^~(~^{wire1, $signed($unsigned(wire2))}));
  assign wire6 = (~^$signed(wire0));
  always
    @(posedge clk) begin
      if (wire1)
        begin
          reg7 <= ({wire5[(4'h8):(3'h5)], $unsigned((!wire0))} ?
              $unsigned($signed(wire4[(1'h0):(1'h0)])) : wire6[(4'hf):(4'he)]);
        end
      else
        begin
          reg7 <= ($unsigned((8'ha1)) && (8'ha0));
          reg8 <= (~&wire5);
          reg9 <= {{wire6,
                  (wire3[(2'h2):(1'h1)] ?
                      ((reg7 ? reg8 : wire0) ?
                          wire1 : (wire6 ?
                              wire6 : wire2)) : $unsigned(((8'ha0) ?
                          reg7 : reg7)))}};
          reg10 <= $signed($unsigned($signed(reg9[(2'h2):(1'h1)])));
          reg11 <= ((wire4[(1'h1):(1'h1)] ?
                  ($signed((wire5 ? wire6 : reg7)) ?
                      reg8 : {$unsigned(reg8)}) : $signed(($unsigned(wire3) & wire2))) ?
              reg7[(5'h11):(3'h7)] : $signed(wire6[(3'h4):(2'h3)]));
        end
      reg12 <= $unsigned((&wire6));
    end
  assign wire13 = wire0[(4'ha):(4'ha)];
  assign wire14 = wire13[(4'hc):(3'h4)];
  always
    @(posedge clk) begin
      reg15 <= (((8'hbd) > wire6[(4'he):(2'h3)]) ? (8'hbe) : $signed(reg7));
      reg16 <= (~$unsigned((((wire3 > wire2) ?
              (reg7 ? wire0 : reg15) : (&wire1)) ?
          wire0[(4'h8):(4'h8)] : {{reg10, reg15}, $signed((8'hb5))})));
      reg17 <= $unsigned((8'ha2));
    end
  assign wire18 = $unsigned(($signed((~{(7'h42)})) ?
                      (({reg7, wire3} ? $signed(wire1) : wire5) ?
                          wire13 : reg7) : $unsigned((reg8[(1'h1):(1'h1)] ?
                          $signed(wire2) : (reg8 ? (8'ha1) : reg12)))));
endmodule
