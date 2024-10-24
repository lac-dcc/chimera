module top
#(parameter param9 = (-({(!{(8'hbe), (8'hb8)}), (&((8'haa) ? (8'h9d) : (8'haf)))} ? (({(8'hb9), (8'hb0)} ? ((8'ha5) ? (7'h41) : (8'hac)) : ((8'hb0) ^ (8'hb7))) | ((8'hbb) ? (-(8'ha7)) : (|(8'hae)))) : (^((8'hb6) >>> ((8'hbe) ? (8'ha9) : (8'ha5)))))), 
parameter param10 = ((^~(({param9} ^~ (param9 <= param9)) ? ((param9 + param9) ? {param9, param9} : (~^param9)) : param9)) == (((+(param9 ? param9 : param9)) ? param9 : ((param9 >= param9) ? (~&param9) : ((8'haf) ? param9 : param9))) + param9)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire1[(2'h2):(2'h2)];
  assign wire6 = $unsigned(((&$unsigned((wire2 ? wire4 : wire2))) >= wire4));
  assign wire7 = (~^wire0[(2'h2):(1'h1)]);
  assign wire8 = wire2[(4'h9):(3'h7)];
endmodule
