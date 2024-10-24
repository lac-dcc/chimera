module top
#(parameter param12 = ((((((7'h40) ? (8'hbd) : (8'h9f)) ? (8'ha0) : ((8'h9d) ? (8'hb6) : (8'hb8))) ? (~&(!(8'h9e))) : ((^(8'ha1)) | {(8'hb2)})) ? ((8'hb4) ? ((~^(8'ha5)) + (~(8'h9d))) : ((8'h9f) ? ((8'h9f) && (7'h42)) : ((8'h9d) ^ (8'ha3)))) : ((((7'h44) * (8'hab)) ? ((8'hb6) ? (8'ha6) : (8'hbe)) : ((8'hb6) ? (8'haf) : (8'had))) & ((^~(8'ha7)) != ((8'hbf) * (8'hb9))))) ? ((~|(~^(~^(8'hae)))) ? (7'h43) : (((-(8'ha8)) ? (^(8'h9d)) : {(7'h43), (8'haa)}) ? (((8'ha3) ? (8'ha6) : (8'hab)) ? ((8'hbd) ? (8'h9d) : (8'hb9)) : ((8'h9c) ? (8'h9f) : (8'hbc))) : (~((8'ha2) ? (8'hbe) : (8'ha9))))) : {(+(~^{(8'hac)})), (((^~(8'ha0)) ? (~(8'h9d)) : ((8'ha7) ? (8'hba) : (8'hbd))) >= (~|((7'h43) >>> (8'h9c))))}), 
parameter param13 = ((((~^{param12}) ^ {(param12 ? (8'hbf) : param12), {param12}}) ? ((param12 <= param12) ? (~^(param12 ? param12 : param12)) : (~|(~param12))) : {({param12, param12} && (param12 ? param12 : param12)), (-(param12 | param12))}) * {({(8'hb3)} ? param12 : ((8'hbe) < param12))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire11;
  wire [(3'h7):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire4;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (~$signed(wire2));
  assign wire5 = wire3[(2'h3):(2'h2)];
  assign wire6 = ((-({(8'h9d)} ?
                         (|wire0[(2'h3):(1'h0)]) : (((8'hb0) & wire1) ?
                             ((8'h9d) ? wire3 : (8'ha7)) : (wire5 ?
                                 wire5 : wire0)))) ?
                     {$unsigned(($signed(wire4) ?
                             $signed(wire4) : $signed((8'hb0)))),
                         wire4} : ((~^(&wire4[(3'h5):(2'h2)])) ?
                         ({(~&wire1),
                             wire3} | (~&(~&(7'h42)))) : (wire4 ~^ $unsigned(wire4))));
  assign wire7 = wire2[(3'h7):(3'h4)];
  assign wire8 = wire3[(1'h1):(1'h0)];
  assign wire9 = $unsigned((wire0[(3'h4):(2'h2)] ^ (|((wire4 <= wire6) ?
                     wire4[(2'h2):(1'h0)] : $signed(wire6)))));
  assign wire10 = (wire0[(1'h1):(1'h0)] != wire6);
  assign wire11 = (~|($unsigned((~|(wire4 ?
                      wire9 : wire7))) != ((~&$signed(wire7)) <= $unsigned(wire3))));
endmodule
