module top
#(parameter param9 = (+{(~^((+(8'hac)) ? ((8'h9c) + (8'hab)) : {(8'ha2)}))}), 
parameter param10 = (({param9} ? (param9 ? (param9 ? (param9 ? param9 : param9) : (+(8'haa))) : ({param9} ? (^~param9) : {param9, param9})) : {(^((8'hb5) ? param9 : param9))}) ? {param9, {((~param9) ? param9 : {param9}), ((param9 < (8'hb0)) <= {param9})}} : (8'hb5)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire3[(1'h1):(1'h0)];
  assign wire5 = $signed((8'ha7));
  assign wire6 = wire1;
  assign wire7 = (($signed({{wire6},
                     wire6}) >= (^~(~^$signed(wire2)))) <= (&wire6));
  assign wire8 = $unsigned(wire5[(3'h7):(2'h2)]);
endmodule
