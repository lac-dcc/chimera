module top
#(parameter param8 = ((~^((^~((8'ha9) ? (8'hae) : (8'hbe))) * (((8'hb5) ? (8'ha6) : (8'h9d)) * {(8'hb0)}))) ? (^~{{(~|(8'ha2)), (~(8'ha7))}, ((-(8'hbb)) < ((8'h9c) + (8'had)))}) : (((+{(8'ha0)}) ^~ (((8'hb1) ? (8'hb4) : (8'hbd)) ? ((8'hb5) ^ (8'ha7)) : (~(8'h9f)))) <<< ((((8'ha9) ^ (8'h9e)) & ((8'hbc) ? (8'hac) : (7'h43))) ? ((-(8'ha0)) >>> (^(8'hae))) : {((8'ha7) || (7'h44))}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (~|wire1);
  assign wire5 = wire3[(2'h3):(2'h3)];
  assign wire6 = (wire0 < wire3[(3'h4):(3'h4)]);
  assign wire7 = wire4[(4'h9):(3'h4)];
endmodule
