module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (wire1[(2'h2):(1'h1)] > $signed((+(-wire3[(4'h8):(3'h5)]))));
  assign wire5 = ((^(~|$signed(wire2[(3'h7):(1'h0)]))) || {wire0[(1'h1):(1'h1)],
                     wire1});
  assign wire6 = $signed(wire3);
  assign wire7 = (~^$signed(wire5[(1'h0):(1'h0)]));
endmodule
