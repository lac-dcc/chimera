module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire4;
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg6 = (1'h0);
  assign y = {wire9, wire5, wire4, reg8, reg7, reg6, (1'h0)};
  assign wire4 = wire3[(4'ha):(3'h5)];
  assign wire5 = wire1;
  always
    @(posedge clk) begin
      reg6 <= wire4;
      reg7 <= wire0;
      reg8 <= reg6;
    end
  assign wire9 = $signed((-wire3[(3'h5):(2'h3)]));
endmodule
