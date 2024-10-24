module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire10;
  wire [(4'h9):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire4;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = {(wire1[(2'h3):(2'h3)] >= wire2)};
  assign wire5 = $unsigned($unsigned(($unsigned((wire3 + wire1)) ^ $signed((wire1 | wire1)))));
  assign wire6 = $unsigned((wire0[(3'h6):(1'h0)] >= $signed(((wire4 ?
                         wire2 : wire5) ?
                     (wire3 | wire2) : wire4))));
  assign wire7 = wire0;
  assign wire8 = $unsigned(wire7[(5'h11):(4'hc)]);
  assign wire9 = wire6;
  assign wire10 = (8'ha6);
  assign wire11 = (((wire3 >>> $signed($unsigned(wire8))) ?
                          $unsigned(((&wire3) ?
                              (8'hbf) : $unsigned(wire7))) : $unsigned(wire10[(2'h2):(1'h1)])) ?
                      wire3 : $signed(wire8[(2'h2):(1'h0)]));
endmodule
