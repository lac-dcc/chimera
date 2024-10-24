module top
#(parameter param8 = {(~^((((8'h9e) >> (8'ha2)) < (|(7'h42))) ? (^((8'hbc) - (8'hac))) : (-((8'ha7) ? (7'h41) : (8'ha9))))), {{(|((8'h9f) <= (8'hb3))), ({(8'hbc)} ? (8'hab) : ((8'hb6) ? (8'h9f) : (8'h9e)))}}})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $signed(wire3);
  assign wire5 = ($unsigned(($unsigned($signed(wire3)) ?
                         (wire2 ^~ $unsigned(wire0)) : ({wire4} != (^wire2)))) ?
                     {(^~wire2[(3'h6):(1'h0)]),
                         (~&wire1[(2'h3):(2'h3)])} : wire4[(3'h5):(2'h3)]);
  assign wire6 = {$signed(((-$unsigned(wire0)) ?
                         (-(~wire5)) : $signed((!wire0))))};
  assign wire7 = wire5[(3'h6):(1'h1)];
endmodule
