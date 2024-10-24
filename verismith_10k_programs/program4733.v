module top
#(parameter param8 = ((((~(+(8'hab))) ? ((8'hac) ? (&(8'ha7)) : {(7'h44), (8'hb7)}) : (((8'hb0) ? (8'ha1) : (8'hb8)) * {(8'had)})) ? ((~((8'hb7) ? (8'hbb) : (8'ha4))) | ({(8'hbc)} - {(8'hab)})) : (((-(8'hb1)) ? ((8'hb7) ? (8'hbd) : (8'hb5)) : (^(8'hae))) ? (+((8'hb8) ^ (8'ha1))) : ((+(7'h43)) ? {(8'h9d)} : {(8'hbb), (8'had)}))) - (|((((8'ha8) ? (8'hb0) : (8'had)) ? {(8'ha7)} : ((8'hab) ? (8'haf) : (8'ha0))) ? (((8'hbe) ? (8'h9f) : (7'h41)) + ((8'hae) ? (8'hb0) : (8'hb8))) : (~|(^~(8'hbc)))))), 
parameter param9 = ((8'hbd) ^ param8))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (wire3 ?
                     wire1[(1'h0):(1'h0)] : (|({((8'hbc) ?
                             wire2 : wire0)} >> {$unsigned(wire0),
                         (!(8'hb3))})));
  assign wire5 = (~|wire3);
  assign wire6 = wire1[(2'h2):(1'h1)];
  assign wire7 = ((($signed($unsigned(wire5)) ? (&wire0) : wire6) ?
                     wire0[(1'h1):(1'h0)] : wire5) * $unsigned(wire4[(4'h9):(3'h4)]));
endmodule
