module top
#(parameter param8 = (~((^~(~((8'ha2) || (8'h9c)))) ? {(((7'h43) < (7'h40)) * ((8'hb8) - (8'hb4)))} : ((((8'ha9) ^ (8'hb8)) && ((7'h44) ? (8'hac) : (8'hb9))) ? (((8'hb4) ^ (8'ha4)) + (&(8'ha0))) : (((8'ha1) ^ (8'hbd)) ? (|(7'h42)) : (~&(8'hb3)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h29):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire0[(3'h6):(1'h0)];
  assign wire5 = $unsigned(wire4);
  assign wire6 = $unsigned(($unsigned((~(+wire4))) || ($unsigned(((8'hbc) ?
                         wire2 : wire0)) ?
                     $signed($unsigned(wire3)) : $signed((-wire5)))));
  assign wire7 = {$unsigned(wire4[(1'h0):(1'h0)])};
endmodule
