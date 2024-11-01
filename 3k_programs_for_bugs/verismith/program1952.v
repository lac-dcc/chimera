module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned(((~wire2[(3'h4):(1'h0)]) != (((~&wire3) || {wire3}) != ($signed(wire3) <<< wire2[(2'h3):(2'h3)]))));
  assign wire5 = {((wire1 ^~ $signed({wire3})) ~^ wire1[(2'h2):(1'h1)])};
  assign wire6 = $unsigned(({(wire4 ? (8'ha3) : $unsigned(wire4)),
                     (&(wire1 == wire3))} * wire1[(4'ha):(3'h5)]));
  assign wire7 = (~&{$signed(($signed(wire2) ?
                         (wire0 <= wire6) : wire4[(1'h1):(1'h1)])),
                     (+(wire5[(3'h7):(2'h2)] >> $unsigned(wire2)))});
endmodule
