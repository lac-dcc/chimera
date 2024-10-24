module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (!$signed($unsigned(wire0)));
  assign wire5 = wire1[(4'hc):(4'h8)];
  assign wire6 = wire5[(3'h4):(3'h4)];
  assign wire7 = (wire5[(4'ha):(3'h6)] > wire0);
endmodule
