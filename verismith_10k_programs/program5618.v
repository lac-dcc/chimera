module top
#(parameter param8 = ((&(~&(^((8'ha7) ? (8'ha1) : (8'hb4))))) | {(~|{(!(8'hbb)), {(8'haa)}}), (({(8'haa)} << (-(8'ha6))) || (+((7'h41) ? (8'had) : (8'hbf))))}), 
parameter param9 = ((((param8 ^~ (^~(8'ha3))) ? (^~(~|param8)) : (8'hb2)) ? (|{{param8}, param8}) : ({(param8 ? (8'haa) : param8)} >= param8)) || ((8'ha7) && (((+param8) ? (param8 ? param8 : param8) : (param8 ? param8 : param8)) * param8))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire3[(1'h1):(1'h1)];
  assign wire5 = wire0;
  assign wire6 = (!$unsigned(((+wire2[(3'h7):(3'h5)]) >> (&(wire2 ?
                     wire1 : wire5)))));
  assign wire7 = ($signed(wire4) || ($unsigned($signed($signed(wire3))) ?
                     (($signed(wire3) * (~|wire4)) ?
                         ($signed(wire4) <<< wire0) : $unsigned(wire2[(2'h2):(2'h2)])) : (7'h42)));
endmodule
