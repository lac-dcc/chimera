module top
#(parameter param10 = (8'ha8), 
parameter param11 = (param10 ? (|(~|(param10 <<< param10))) : {(~(param10 ? {param10} : (^~param10)))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire4;
  assign y = {wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire0[(4'h9):(2'h2)];
  assign wire5 = ((wire2[(3'h7):(1'h0)] ^~ $unsigned((~^$signed(wire2)))) ?
                     ((~^wire0[(3'h4):(1'h0)]) << wire3[(3'h7):(3'h7)]) : wire1[(2'h3):(2'h3)]);
  assign wire6 = $unsigned(wire2[(2'h2):(1'h0)]);
  assign wire7 = (({$signed(((8'hb3) <<< wire5)),
                     {$unsigned((8'h9c))}} < (($signed(wire4) ?
                         $signed(wire0) : wire5) ?
                     $unsigned($unsigned(wire2)) : (~^wire3[(1'h1):(1'h1)]))) >> wire4[(2'h2):(1'h0)]);
  assign wire8 = wire2;
  assign wire9 = {$unsigned(wire5[(1'h0):(1'h0)])};
endmodule
