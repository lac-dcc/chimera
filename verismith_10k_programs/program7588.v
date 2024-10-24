module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = {wire1[(2'h2):(1'h0)]};
  assign wire5 = (wire3[(3'h5):(3'h4)] ?
                     $signed($signed((wire2[(1'h0):(1'h0)] * (+wire0)))) : wire2);
  assign wire6 = wire2[(2'h2):(1'h1)];
  assign wire7 = ((+($signed((8'hb2)) << ((wire5 >>> wire4) & wire1))) ?
                     (((-$signed(wire0)) - wire0[(2'h2):(1'h1)]) ?
                         (8'h9e) : wire6[(5'h10):(4'h9)]) : wire4[(2'h2):(1'h0)]);
endmodule
