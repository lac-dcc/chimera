module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire4;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $unsigned({wire4[(3'h5):(2'h3)],
                     ({wire1[(3'h5):(2'h3)], wire0[(1'h1):(1'h1)]} ?
                         (-$signed(wire4)) : wire0[(1'h1):(1'h0)])});
  assign wire6 = ((wire3 ?
                         $signed($signed($signed((7'h44)))) : ($signed({wire2,
                             wire2}) | wire2[(4'h9):(2'h3)])) ?
                     (^(~|wire1)) : (~^wire3));
  assign wire7 = $signed({($unsigned(wire6) - wire3), $signed((~^(^wire6)))});
  assign wire8 = wire3;
endmodule
