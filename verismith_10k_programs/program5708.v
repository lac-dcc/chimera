module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned($unsigned(wire3));
  assign wire5 = wire1;
  assign wire6 = wire2[(2'h3):(2'h3)];
  assign wire7 = {{(8'hae),
                         (($unsigned(wire6) ?
                                 ((8'hb6) << (8'ha4)) : {wire3, wire4}) ?
                             $signed((~(8'hb0))) : (-wire5))},
                     (wire4 ? wire6 : $unsigned($signed((wire0 || wire3))))};
endmodule
