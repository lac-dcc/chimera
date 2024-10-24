module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (({(wire2[(3'h6):(1'h1)] ?
                                 wire3[(1'h1):(1'h0)] : $unsigned((8'haa)))} ?
                         (~&$signed(wire3)) : $signed((&(+wire4)))) ?
                     wire1 : {$unsigned((wire2[(4'h9):(3'h7)] ?
                             $signed(wire1) : (&wire4)))});
  assign wire6 = $unsigned((-{$unsigned((wire5 >>> wire1)),
                     $unsigned((wire5 > wire2))}));
  assign wire7 = $unsigned($unsigned(((+(wire3 | wire5)) + $unsigned((wire4 <= wire3)))));
  assign wire8 = $signed(wire0[(2'h3):(1'h1)]);
endmodule
