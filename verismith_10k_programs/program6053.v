module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h5c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire15;
  wire signed [(3'h5):(1'h0)] wire14;
  wire [(4'h9):(1'h0)] wire13;
  wire signed [(3'h6):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg [(3'h4):(1'h0)] reg9 = (1'h0);
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire6,
                 wire5,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = $signed(wire4[(4'h8):(3'h5)]);
  assign wire6 = $signed((^~wire5[(2'h3):(2'h3)]));
  always
    @(posedge clk) begin
      reg7 <= $signed(wire4);
      reg8 <= wire4;
      reg9 <= (~|wire0);
      reg10 <= reg9;
      reg11 <= ((|$unsigned(wire5[(2'h2):(1'h1)])) + $unsigned((((8'had) & reg10) + wire1)));
    end
  assign wire12 = reg11;
  assign wire13 = reg9;
  assign wire14 = $unsigned(($unsigned(reg9) ?
                      reg7 : (reg10 ?
                          $unsigned((reg8 ? wire4 : reg9)) : ((wire5 ?
                                  reg9 : (8'had)) ?
                              reg8 : (wire5 ? wire6 : wire6)))));
  assign wire15 = $unsigned(($signed($unsigned($unsigned((8'hbb)))) - $unsigned(reg9[(3'h4):(2'h2)])));
endmodule
