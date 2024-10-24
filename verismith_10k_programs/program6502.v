module top
#(parameter param9 = ((((((7'h40) >= (8'hb2)) ^ ((8'ha1) == (7'h42))) ? (-((8'ha9) ^ (7'h43))) : (((8'ha1) ? (8'hb5) : (8'hbc)) ? ((8'hbf) ? (8'hab) : (8'h9c)) : {(8'hbb), (8'hb6)})) > (+((8'hb3) & {(8'hbf)}))) ? (((((8'haa) ? (8'ha0) : (8'hb8)) ? ((8'ha0) ? (8'ha8) : (8'hbf)) : (|(8'ha8))) ? (((8'hb5) * (8'ha3)) ? {(8'haa), (7'h44)} : ((8'hb8) ? (8'h9c) : (8'hb5))) : ((&(8'h9c)) - ((8'haf) > (8'ha1)))) ? ({((8'ha8) || (8'hbc))} & (8'hb8)) : ((((8'ha2) ? (8'hb1) : (8'hbd)) ? ((8'hbf) <<< (8'ha9)) : (8'ha1)) ? {((8'haa) <<< (8'hae))} : (8'h9e))) : {(({(8'hbe), (8'hbb)} ? ((8'ha2) | (8'hb8)) : ((8'hb9) ? (8'hab) : (8'hb0))) ? (((8'hb3) + (8'hb4)) ? ((8'haa) ? (8'ha3) : (8'hb5)) : ((8'hb1) ? (7'h41) : (7'h41))) : (!(^~(8'hae))))}), 
parameter param10 = {((param9 ? param9 : ((param9 ? param9 : param9) ? (param9 ? param9 : param9) : (~^param9))) ? (8'hb4) : ((param9 ? {param9, param9} : (param9 == param9)) == (8'h9d))), param9})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire4[(2'h2):(1'h0)];
  assign wire6 = (~$unsigned($signed(((wire4 ^ wire1) > {wire3, wire0}))));
  assign wire7 = {(|wire2)};
  assign wire8 = $signed($unsigned((wire0[(4'hb):(3'h6)] ^~ ($unsigned(wire5) || (wire4 <= wire5)))));
endmodule
