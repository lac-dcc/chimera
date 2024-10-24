module top
#(parameter param8 = (^((|{{(7'h42)}, ((7'h42) ? (7'h43) : (8'hb4))}) ~^ (+(((8'haa) ? (8'ha2) : (8'ha5)) << (+(8'haa)))))), 
parameter param9 = (^~param8))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned(wire1);
  assign wire5 = {wire4[(4'he):(4'he)]};
  assign wire6 = {$signed(($signed(wire2[(4'hd):(4'ha)]) <= wire1)),
                     ((wire5 ?
                         (wire2 >> {wire4}) : $signed(wire0)) ~^ (wire1[(2'h2):(1'h1)] > wire0[(3'h4):(3'h4)]))};
  assign wire7 = $unsigned((-wire3));
endmodule
