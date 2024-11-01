module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $signed(wire2[(2'h2):(2'h2)]);
  assign wire5 = $unsigned(((+{(wire0 * wire2),
                     wire3[(4'hd):(3'h4)]}) << wire3));
  assign wire6 = $unsigned(wire1);
  assign wire7 = wire3;
endmodule
