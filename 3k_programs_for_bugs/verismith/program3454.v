module top
#(parameter param9 = ({((((7'h40) + (8'hbf)) ? {(8'hb2), (8'hb5)} : {(8'hae)}) ^~ {((8'hb1) * (8'hbe)), (-(8'ha3))})} ? (({((8'ha5) >>> (7'h40)), {(8'hb6), (8'hb5)}} > (|{(8'hb7)})) || (((~(8'hac)) >>> (+(7'h40))) <<< (~^((7'h44) << (8'hbe))))) : (((~&((8'hbe) ? (8'hac) : (8'hba))) ? ((&(8'hb3)) ? ((8'hb4) ? (8'hb1) : (8'hab)) : (-(8'hb9))) : (((8'haa) ? (8'ha9) : (8'ha2)) - (-(8'hba)))) ? {{(|(8'haa)), (~(7'h44))}, (((8'hb8) < (7'h41)) != ((7'h41) != (8'hb3)))} : {(|((8'hae) < (8'hba))), (((8'hb7) ? (8'hb2) : (8'hb8)) ? {(8'hbe), (8'hbd)} : (^(8'hb4)))})), 
parameter param10 = param9)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h24):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire [(3'h4):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = {(!wire1[(1'h0):(1'h0)]), wire2};
  assign wire6 = (-$signed($signed((8'hac))));
  assign wire7 = wire2[(3'h4):(2'h2)];
  assign wire8 = wire5[(4'ha):(4'h8)];
endmodule
