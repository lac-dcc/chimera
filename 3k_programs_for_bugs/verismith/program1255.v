module top
#(parameter param9 = (((^~(!(^(8'ha1)))) ? (-(8'ha8)) : (8'haa)) ? (({{(8'had)}, (~(8'ha2))} ? (((8'hae) ? (8'hbf) : (8'had)) ? (&(8'h9e)) : {(8'ha9), (8'ha0)}) : ((!(8'hb7)) ? ((8'h9c) ? (8'had) : (8'hb1)) : ((8'ha9) ? (8'ha0) : (8'ha4)))) ? (^({(8'hab)} >>> (-(8'hbd)))) : ((((8'h9d) == (8'hbc)) ? (^~(8'ha9)) : ((8'hba) ? (8'h9f) : (8'ha7))) || (~^{(8'hb4), (8'h9f)}))) : (|(^(((8'ha4) ? (8'ha5) : (8'haf)) >> (^(8'hbb)))))), 
parameter param10 = (({(8'hb3), ((-(8'ha1)) ? param9 : (~^param9))} ? param9 : (&(^~{param9}))) < ((((~^param9) ? (+param9) : (~^param9)) ? ((param9 ? param9 : param9) ^~ {param9, (7'h44)}) : param9) ? (~&(^~(param9 < param9))) : param9)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire2;
  assign wire5 = $signed(({wire3} ?
                     (^($signed(wire0) ?
                         wire3 : (wire2 <<< wire1))) : (((wire1 ?
                             wire2 : wire4) ?
                         (8'h9f) : (~&(8'h9d))) >= (8'hb6))));
  assign wire6 = (wire1 ? wire5 : wire3);
  assign wire7 = wire3[(2'h3):(2'h3)];
  assign wire8 = {$signed(wire0[(4'hb):(4'hb)])};
endmodule
