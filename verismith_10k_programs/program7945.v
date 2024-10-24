module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h45):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  assign y = {wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $signed($signed((~&wire2)));
  assign wire5 = $unsigned((!(&wire0[(3'h4):(2'h3)])));
  assign wire6 = ((~^{wire0[(4'h9):(3'h4)],
                     $unsigned(wire3[(4'ha):(3'h4)])}) * (^~wire2[(4'ha):(2'h3)]));
  assign wire7 = {wire5};
  assign wire8 = (wire2[(4'h8):(2'h3)] ?
                     $signed(wire0[(3'h6):(3'h5)]) : (!$unsigned($signed($unsigned(wire2)))));
  assign wire9 = (~&wire3[(4'ha):(4'h9)]);
endmodule
