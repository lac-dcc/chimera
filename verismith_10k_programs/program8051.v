module top
#(parameter param11 = {(((-((8'hb4) != (8'hb1))) != (((8'ha1) < (8'h9e)) ? ((8'ha2) ? (8'hae) : (8'hb5)) : ((8'hb6) ? (8'hb0) : (8'h9e)))) <= (^((~|(8'h9f)) ? (^~(8'hb8)) : (~^(8'ha2)))))}, 
parameter param12 = (+((((~param11) ? (-param11) : (param11 <= param11)) && param11) < (^((param11 || param11) >= (~^(8'h9e)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = {$signed(wire4[(1'h0):(1'h0)])};
  assign wire6 = wire3[(4'hf):(3'h6)];
  assign wire7 = (^~wire2[(3'h4):(1'h1)]);
  assign wire8 = wire4[(3'h6):(3'h5)];
  assign wire9 = {wire4[(2'h3):(2'h2)], (~(8'had))};
  assign wire10 = $signed($signed((~^$unsigned($signed(wire8)))));
endmodule
