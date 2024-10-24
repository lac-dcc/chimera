module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire10;
  wire [(4'h9):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  assign y = {wire10, wire6, wire5, reg9, reg8, reg7, (1'h0)};
  assign wire5 = $unsigned(wire4);
  assign wire6 = $unsigned((wire4[(4'hb):(1'h1)] ?
                     $unsigned(wire1) : (({wire0, wire0} ?
                         ((8'ha8) << wire3) : wire1[(4'hb):(3'h5)]) != ((wire5 ?
                         (7'h44) : wire1) - (wire4 ? wire4 : wire2)))));
  always
    @(posedge clk) begin
      reg7 <= ($signed(wire0) ? wire2[(1'h1):(1'h0)] : (+wire0));
      reg8 <= ((((wire3[(2'h2):(2'h2)] || (wire6 << wire3)) ?
              (^~wire0[(4'h8):(3'h7)]) : {(wire4 ? wire2 : wire6),
                  (wire5 < (7'h40))}) << wire5) ?
          $unsigned(($unsigned((^wire5)) ?
              $unsigned(wire4[(3'h4):(3'h4)]) : wire4[(3'h5):(2'h3)])) : wire6);
      reg9 <= $unsigned(($signed(((~&wire2) ?
          (^~wire2) : (8'hb8))) >= $signed(($signed(wire1) ?
          wire4[(3'h5):(2'h2)] : $signed(wire0)))));
    end
  assign wire10 = ({wire0[(3'h4):(2'h2)]} ?
                      $unsigned($unsigned((((8'hb2) - reg7) ?
                          (wire6 >> wire3) : $unsigned(reg9)))) : wire4[(3'h4):(1'h0)]);
endmodule
