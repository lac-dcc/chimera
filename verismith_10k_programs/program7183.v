module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire3[(2'h3):(2'h3)];
  assign wire5 = wire0[(2'h3):(2'h2)];
  assign wire6 = wire2[(3'h7):(2'h3)];
  assign wire7 = ((wire2 ? wire6 : $unsigned(wire3[(2'h3):(2'h2)])) ?
                     {(8'hb9)} : $unsigned($signed($signed(((8'hac) ?
                         (8'hbd) : wire4)))));
endmodule
