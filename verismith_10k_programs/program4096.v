module top
#(parameter param9 = (^(8'ha6)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $signed($unsigned(wire2));
  assign wire6 = (((~^((wire4 ? wire5 : wire5) + $unsigned(wire2))) ?
                         ((-wire0[(4'he):(4'hc)]) ^ (wire4[(3'h4):(1'h0)] ^~ $unsigned(wire3))) : (|(^~wire1))) ?
                     wire5 : ($signed(((^wire4) <<< $unsigned((8'ha6)))) ?
                         (wire0[(2'h3):(2'h3)] == wire5[(4'hb):(1'h1)]) : ((wire0[(3'h5):(1'h0)] ^ $unsigned(wire0)) >>> $signed(wire1))));
  assign wire7 = ($signed(wire0) >>> ((wire2 ^~ wire5) ?
                     ($signed({wire2, wire6}) ?
                         (~&$signed(wire0)) : wire1[(4'h9):(4'h8)]) : (8'h9d)));
  assign wire8 = wire6;
endmodule
