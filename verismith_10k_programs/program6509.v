module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = ((~^$unsigned(wire4)) ?
                     (|wire2[(1'h0):(1'h0)]) : $unsigned((($signed(wire3) >= wire0[(4'hb):(3'h6)]) ?
                         wire4[(1'h0):(1'h0)] : ((wire0 && wire2) ~^ ((8'hb5) >= wire4)))));
  assign wire6 = (8'hbc);
  assign wire7 = wire4;
  assign wire8 = wire3;
endmodule
