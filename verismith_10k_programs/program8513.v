module top
#(parameter param8 = ((7'h40) ? ((|(8'hbd)) ? (((!(8'h9e)) ? ((8'h9c) ? (8'hb9) : (8'hbc)) : ((8'hb2) ? (8'hb0) : (7'h40))) >= (((8'hbb) ^~ (7'h43)) ? (^(8'hac)) : ((8'h9c) ? (8'hae) : (8'hb8)))) : {(((8'hb2) ^~ (8'haa)) | (!(8'ha7)))}) : ((((~(8'hb1)) ? {(8'ha0)} : {(8'hbc)}) > (|((8'h9d) ^ (8'hac)))) ? (((~&(8'ha5)) ? {(8'ha1), (8'hb2)} : (~(7'h42))) ? (((8'h9f) * (7'h40)) ? (-(8'hb5)) : {(8'ha2)}) : ((&(8'hbe)) ~^ ((8'ha0) <= (8'ha1)))) : (((~(8'hab)) ? ((8'hb9) ? (8'ha5) : (8'hbe)) : ((8'h9d) || (8'h9c))) ? ({(8'ha3)} ? (^(8'hac)) : ((8'hb3) ? (8'ha4) : (8'ha6))) : (-((8'hac) ? (8'haf) : (8'hb3)))))), 
parameter param9 = ((|(8'hab)) * ((((param8 ? param8 : param8) != ((7'h43) == param8)) << ((!param8) ? (param8 - param8) : {(8'ha4), param8})) ? ((param8 ? {param8, param8} : (param8 ? param8 : param8)) ? param8 : (~&(~&param8))) : ({(~|param8), (~&param8)} != ((param8 ? param8 : param8) ? (param8 ? param8 : param8) : param8)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h25):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire2[(2'h3):(2'h3)];
  assign wire5 = ((~|$signed($unsigned((wire1 * wire1)))) <<< ($signed((&(wire4 ?
                         wire2 : wire2))) ?
                     wire4[(4'hb):(2'h2)] : {{{wire4, wire1}, wire2},
                         ((~^wire2) - wire2[(2'h3):(1'h0)])}));
  assign wire6 = $signed({($signed($unsigned(wire1)) * (^~(~wire5))),
                     (~|$signed((wire5 <= wire2)))});
  assign wire7 = $signed({wire3, (8'hab)});
endmodule
