module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire5;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $unsigned(($signed($signed($signed(wire2))) | wire3));
  assign wire6 = $unsigned(((((8'hb9) ?
                         (8'ha6) : (wire4 <= wire4)) > $unsigned($signed(wire3))) ?
                     $signed(wire1) : wire4[(3'h4):(2'h2)]));
  assign wire7 = wire4[(1'h0):(1'h0)];
  assign wire8 = wire1;
  assign wire9 = $signed(wire4);
  assign wire10 = (wire8[(3'h4):(1'h1)] > (($unsigned($unsigned(wire7)) == $signed($unsigned(wire2))) + (^$signed($signed(wire8)))));
endmodule
