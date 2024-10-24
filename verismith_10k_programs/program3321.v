module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h29):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  assign y = {wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $unsigned(wire2[(3'h7):(3'h7)]);
  assign wire6 = (~^{($signed($signed(wire0)) && $unsigned({wire5, wire3})),
                     (-((wire2 > wire2) ~^ (wire0 ? wire4 : wire2)))});
  assign wire7 = $signed((&$signed(wire2)));
  assign wire8 = {{$unsigned(((wire3 ? wire7 : wire4) ?
                             $unsigned(wire1) : $signed(wire3))),
                         wire0[(1'h1):(1'h0)]}};
  assign wire9 = (wire5[(4'hc):(2'h3)] ^~ (wire2[(4'h8):(2'h2)] + $unsigned((wire1[(2'h2):(1'h0)] + wire8[(3'h4):(1'h0)]))));
endmodule
