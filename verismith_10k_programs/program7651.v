module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire4;
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(4'ha):(1'h0)] reg6 = (1'h0);
  assign y = {wire11,
                 wire10,
                 wire9,
                 wire5,
                 wire4,
                 reg14,
                 reg13,
                 reg12,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = {wire0};
  assign wire5 = (wire0 ^ {(wire4 & ((wire0 - wire0) ?
                         $signed(wire3) : (wire3 ? wire3 : wire3)))});
  always
    @(posedge clk) begin
      reg6 <= $signed((8'hb4));
      reg7 <= wire1[(3'h4):(2'h2)];
      reg8 <= $signed(reg6[(2'h2):(1'h0)]);
    end
  assign wire9 = $unsigned(wire3[(2'h3):(2'h3)]);
  assign wire10 = $signed(wire2);
  assign wire11 = (8'hb6);
  always
    @(posedge clk) begin
      reg12 <= {reg6[(4'h9):(3'h7)],
          ((8'hbc) ?
              (($signed(wire9) && $signed(reg6)) ?
                  wire10 : (-(~reg8))) : $unsigned(wire9[(5'h15):(4'ha)]))};
      reg13 <= wire5[(3'h4):(1'h0)];
      reg14 <= wire3[(1'h0):(1'h0)];
    end
endmodule
