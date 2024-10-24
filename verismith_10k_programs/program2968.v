module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (wire1[(3'h4):(1'h0)] ?
                     (+(^~($signed(wire2) ^ (wire2 ~^ wire3)))) : $signed($signed({wire3[(1'h0):(1'h0)],
                         $unsigned(wire1)})));
  assign wire5 = wire1[(3'h7):(3'h7)];
  assign wire6 = wire5[(1'h1):(1'h1)];
  assign wire7 = wire6[(2'h3):(2'h2)];
endmodule
