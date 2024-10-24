module top
#(parameter param9 = (({(8'ha3)} ? ((+(^(8'ha3))) ? (&((8'hae) ? (8'hac) : (8'h9c))) : (((8'had) ~^ (8'hb3)) * ((8'hb3) ^ (8'hb0)))) : ((+(^~(7'h40))) ? {((8'h9c) || (7'h43))} : ((^(8'had)) ? {(8'ha9)} : {(8'hba)}))) | (8'ha7)), 
parameter param10 = (((~^{(8'h9f)}) ? ((param9 ? (+param9) : (param9 ? (8'hab) : param9)) ? ((-param9) ? (param9 ? param9 : param9) : ((7'h44) ^ param9)) : (((8'ha2) ? param9 : param9) ~^ param9)) : param9) ? param9 : ((~^((param9 ^~ param9) < {param9, param9})) ? (8'ha9) : ((~&param9) | param9))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned($unsigned(((^(wire1 << wire3)) == (wire1[(4'ha):(4'h8)] ?
                     (!wire2) : (wire0 ? wire0 : wire0)))));
  assign wire5 = wire4;
  assign wire6 = ($unsigned(wire0[(4'ha):(2'h2)]) * (~&$signed((wire1[(2'h2):(2'h2)] * (8'hb2)))));
  assign wire7 = (~wire2);
  assign wire8 = $unsigned($unsigned($unsigned(((|(8'h9e)) ?
                     {wire0, wire0} : wire2[(3'h5):(1'h0)]))));
endmodule
