module top
#(parameter param9 = (((~^((!(7'h44)) ^ (8'hb0))) ? (+({(8'ha0)} <= ((8'h9c) ? (8'h9d) : (8'haa)))) : ((~^((8'hb1) ? (8'ha9) : (8'had))) == {((8'hae) ? (8'ha2) : (8'hba)), (~(7'h43))})) * (((8'had) && ({(7'h40), (8'ha4)} ? (+(8'h9f)) : ((8'ha2) & (8'h9f)))) ~^ ((-((8'hb2) & (8'hbf))) ? (8'haa) : ({(8'hb2), (8'hbc)} == {(8'haa)})))), 
parameter param10 = ((((-(param9 < param9)) > ({param9, param9} ? param9 : param9)) & (|((^~param9) + (param9 && param9)))) ^~ (((~&(param9 ? param9 : param9)) ? param9 : ((param9 ? param9 : param9) ? (8'ha3) : ((8'hb9) ? (7'h42) : param9))) && param9)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h2f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire1[(1'h0):(1'h0)];
  assign wire6 = $signed($signed(((8'ha4) >> ($signed((8'hbc)) ?
                     wire2[(3'h5):(1'h1)] : (+wire5)))));
  assign wire7 = wire6;
  assign wire8 = wire5[(4'h9):(3'h7)];
endmodule
