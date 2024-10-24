module top
#(parameter param9 = (~&(((((8'hbe) || (8'ha9)) ? {(8'hbb)} : ((8'haf) * (8'ha9))) & ((^~(7'h44)) == (+(8'ha5)))) << {(((8'haa) <<< (8'ha5)) ? ((8'ha1) <= (8'ha0)) : (~|(8'hbe)))})), 
parameter param10 = (((-{(&(8'had))}) | param9) ? ({((!param9) < (param9 >= param9)), param9} * ((!(8'hbf)) ? {(^param9), (param9 ^ param9)} : param9)) : ({param9} ? (8'hb6) : param9)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (^$signed(wire3[(2'h3):(2'h3)]));
  assign wire5 = wire3[(2'h2):(1'h0)];
  assign wire6 = $unsigned(($unsigned(wire2) == (~|$unsigned(wire3))));
  assign wire7 = wire5[(1'h0):(1'h0)];
  assign wire8 = $unsigned((|(wire2 >>> ($unsigned(wire6) ^ {wire2, wire7}))));
endmodule
