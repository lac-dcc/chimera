module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire9;
  wire signed [(4'ha):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  reg [(3'h5):(1'h0)] reg7 = (1'h0);
  assign y = {wire10, wire9, wire6, wire5, reg8, reg7, (1'h0)};
  assign wire5 = (~$signed((wire2[(3'h5):(2'h2)] <= wire0)));
  assign wire6 = wire1[(4'h9):(2'h2)];
  always
    @(posedge clk) begin
      reg7 <= (^~wire5);
      reg8 <= reg7;
    end
  assign wire9 = wire5;
  assign wire10 = (wire1 >> (7'h42));
endmodule
