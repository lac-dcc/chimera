module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire4;
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  assign y = {wire6, wire5, wire4, reg7, (1'h0)};
  assign wire4 = (8'hb2);
  assign wire5 = $unsigned(wire2[(4'hb):(3'h6)]);
  assign wire6 = wire3;
  always
    @(posedge clk) begin
      reg7 <= $signed((wire5 ? {$unsigned((|wire2))} : wire0[(1'h1):(1'h0)]));
    end
endmodule
