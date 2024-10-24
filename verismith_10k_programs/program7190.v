module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  assign y = {wire6, wire5, wire4, reg9, reg8, reg7, (1'h0)};
  assign wire4 = wire0[(1'h1):(1'h0)];
  assign wire5 = {$unsigned((8'hac))};
  assign wire6 = wire2;
  always
    @(posedge clk) begin
      reg7 <= wire3;
      reg8 <= wire6[(1'h1):(1'h0)];
      reg9 <= wire1[(3'h6):(3'h5)];
    end
endmodule
