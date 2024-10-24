module top
#(parameter param9 = ((((((7'h43) ? (8'hbd) : (7'h41)) ? ((8'h9f) ? (8'haa) : (8'ha7)) : ((8'h9c) ? (7'h43) : (8'hb5))) ? {((8'hbb) ? (8'h9f) : (8'hb5))} : ((~^(8'ha5)) > ((8'h9d) >>> (8'ha7)))) > (~(((8'hbd) > (8'ha8)) + ((8'h9f) ? (8'hb3) : (8'had))))) & ((-(((8'hb1) << (8'hbc)) ? ((7'h44) * (8'had)) : ((7'h43) == (8'ha5)))) ? {(+((8'ha2) << (8'h9f))), {{(8'hb3)}}} : ((((8'hb3) < (8'h9f)) + {(8'hab), (8'haa)}) < {((8'hb4) < (8'ha3))}))), 
parameter param10 = (param9 <= (((+{param9}) >= {(|param9)}) ? (param9 == (-{param9})) : (param9 ? (8'hb6) : ((param9 * param9) && (param9 >>> param9))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h2f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $signed(wire1);
  assign wire6 = wire0;
  assign wire7 = $unsigned((wire3 ?
                     ($unsigned((wire5 == wire2)) < wire5) : wire1[(2'h3):(1'h0)]));
  assign wire8 = (!wire1[(4'ha):(3'h7)]);
endmodule
