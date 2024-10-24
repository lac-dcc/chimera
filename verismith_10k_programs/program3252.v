module top
#(parameter param11 = (~(^~(((-(8'hae)) * ((8'hb7) & (8'hb6))) ? {{(8'hb0)}} : (((7'h42) <= (8'hbb)) << {(8'hb4)})))), 
parameter param12 = ((param11 <= (+(~^(8'ha2)))) ^ param11))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire10;
  wire [(4'hd):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire5;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire4[(4'h9):(3'h5)];
  assign wire6 = ($unsigned((^~(-$signed(wire3)))) < $signed((wire1 ?
                     ((wire2 >> wire2) >>> (~&(8'hb3))) : wire0)));
  assign wire7 = (-$unsigned((|($unsigned(wire0) * (wire1 == wire4)))));
  assign wire8 = $unsigned(wire1[(1'h0):(1'h0)]);
  assign wire9 = wire8;
  assign wire10 = ((|$signed(wire9[(2'h2):(2'h2)])) >> $signed($signed(({wire0,
                      wire8} > (wire8 ? wire5 : wire7)))));
endmodule
