module top
#(parameter param9 = {({({(8'ha9)} ? ((8'hbf) >>> (8'haa)) : ((8'hb6) ? (8'hbb) : (8'ha7)))} ? (8'hb3) : ((&((8'hb7) ? (8'hbd) : (8'hb3))) != {((7'h41) ? (8'h9f) : (7'h40)), ((8'ha2) ? (8'ha9) : (8'hb7))})), {(~&(((8'ha6) || (8'ha2)) >>> {(8'ha4), (7'h40)}))}})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (-wire0[(1'h0):(1'h0)]);
  assign wire5 = ($signed({(8'haf)}) ^~ $unsigned(wire4[(3'h6):(2'h3)]));
  assign wire6 = $signed((!$unsigned($unsigned($unsigned((8'ha7))))));
  assign wire7 = wire4[(3'h6):(3'h6)];
  assign wire8 = wire0;
endmodule
