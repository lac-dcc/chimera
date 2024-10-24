module top
#(parameter param8 = ((8'hac) == (+(({(7'h41), (8'hb2)} ~^ (|(8'hae))) >= ((!(8'hb8)) <<< ((8'had) << (8'haa)))))), 
parameter param9 = ({((((8'hb0) ? param8 : (7'h44)) ? (param8 >>> param8) : (param8 ^~ param8)) == (((8'hae) ~^ param8) != param8))} != ((|((param8 && param8) >>> (~|param8))) & (8'hbb))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire3[(4'ha):(4'h8)];
  assign wire5 = $signed($signed(wire3[(2'h3):(1'h0)]));
  assign wire6 = $signed((~&wire0));
  assign wire7 = {(!wire1), $signed(wire2[(4'ha):(4'h8)])};
endmodule
