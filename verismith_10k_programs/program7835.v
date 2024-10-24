module top
#(parameter param12 = (~^(+(8'hbc))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h60):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire10;
  wire signed [(5'h10):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire8;
  wire signed [(2'h3):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire4;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned($signed((((wire2 ^ wire0) ?
                         wire0[(1'h1):(1'h0)] : (wire0 | wire3)) ?
                     wire2 : {$signed(wire0)})));
  assign wire5 = ((^~(~|$signed(wire1[(3'h4):(2'h3)]))) ?
                     wire3 : $signed((((&wire0) ?
                             wire0[(1'h0):(1'h0)] : (8'hbe)) ?
                         ((wire0 > (8'haa)) ~^ (wire4 & wire0)) : {wire0[(2'h2):(2'h2)]})));
  assign wire6 = wire0;
  assign wire7 = ($unsigned(wire4[(3'h7):(1'h1)]) ?
                     ((wire5[(2'h3):(2'h2)] ?
                             (&$unsigned(wire3)) : {wire5, $signed(wire3)}) ?
                         wire2[(3'h6):(3'h6)] : $unsigned($unsigned($signed(wire1)))) : wire6);
  assign wire8 = wire2[(3'h7):(2'h2)];
  assign wire9 = (|wire5[(4'h9):(1'h1)]);
  assign wire10 = $signed(wire8);
  assign wire11 = {($signed((8'ha2)) ~^ $signed({((8'ha3) != wire6)})),
                      $signed($signed($signed($unsigned(wire1))))};
endmodule
