module top
#(parameter param9 = (~|((|{((8'hb1) < (8'hb8))}) ? (+(((8'ha0) | (7'h44)) && (&(8'ha0)))) : {(8'hbe)})), 
parameter param10 = (~(((8'ha2) ? ((~|param9) >>> (param9 ? param9 : param9)) : {(param9 ? param9 : param9), (param9 ? param9 : param9)}) ? param9 : (8'ha3))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (~($unsigned(((^(8'hb8)) ?
                     (wire4 <<< wire4) : $signed((8'h9c)))) ^ $signed(wire0)));
  assign wire6 = {(~&(+((~^wire5) << (wire3 >>> wire1)))),
                     $signed($signed(wire1))};
  assign wire7 = wire1[(4'ha):(1'h1)];
  assign wire8 = $signed({wire0[(3'h6):(3'h6)], wire4});
endmodule
