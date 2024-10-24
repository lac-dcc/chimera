module top
#(parameter param11 = (((({(8'hb9)} ? ((8'ha7) ? (8'ha0) : (8'hb3)) : {(8'hab)}) ? (^~((8'hb8) ? (7'h42) : (8'h9f))) : {{(7'h44)}}) ? {(((7'h43) ? (8'ha2) : (8'ha6)) ? (~|(8'hb1)) : ((8'haf) ? (8'h9d) : (8'hbc)))} : ((((8'hb3) ? (8'ha7) : (8'hb9)) != ((8'hb1) ? (8'hbf) : (8'ha8))) ? (((8'hba) ? (8'hb4) : (8'hb1)) < (~|(8'hb7))) : {(~^(8'hb1)), (~&(8'h9f))})) ? (({((8'ha2) ? (7'h43) : (8'hb5))} ^ ((8'ha3) ? ((8'hbb) > (8'hbe)) : (-(8'ha5)))) ? (~&((&(8'hb7)) ~^ ((8'h9f) ? (8'hbf) : (8'hb7)))) : ({((7'h42) * (8'h9e)), ((8'ha1) ? (8'ha1) : (8'hab))} ^ (((8'ha7) && (8'ha3)) ? (+(8'hb3)) : ((8'ha9) != (8'haf))))) : ((({(8'h9f)} == ((8'hab) >> (8'ha6))) ? (((8'hbd) << (8'hba)) || ((8'hb1) ? (8'ha9) : (7'h43))) : {(~|(7'h40)), ((8'ha7) == (8'h9c))}) ? (|(((8'had) ? (8'ha2) : (8'hbf)) == (^~(8'ha9)))) : {((~(8'ha6)) ? (-(8'hb3)) : (^(8'hbf))), ((~|(8'h9f)) ? (~(8'hb7)) : (~(8'hbd)))})), 
parameter param12 = {(!((-param11) ? (^(param11 ? param11 : param11)) : ({param11} ? {(7'h40), param11} : ((8'hab) > param11)))), (param11 * (+param11))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire10;
  wire signed [(4'h9):(1'h0)] wire9;
  wire [(2'h3):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire1;
  assign wire5 = (~&$unsigned(wire2[(2'h2):(1'h0)]));
  assign wire6 = (((wire0 && {$signed((8'ha7))}) ?
                     {$unsigned((wire3 ? wire0 : wire1)),
                         $signed((wire1 * wire3))} : (!wire3[(3'h4):(3'h4)])) >> (~|wire3));
  assign wire7 = (((($signed(wire6) ? (wire5 == wire4) : wire5) ?
                             {(+wire0),
                                 $signed(wire5)} : $unsigned((wire3 > wire5))) ?
                         wire6 : {wire0}) ?
                     $unsigned($signed((((8'hae) ? (8'h9e) : wire2) ^ (wire4 ?
                         wire6 : (8'hae))))) : (({(8'ha7),
                         wire0[(3'h5):(2'h2)]} <= $unsigned((!wire5))) >>> $unsigned((~&(-wire4)))));
  assign wire8 = wire2[(1'h0):(1'h0)];
  assign wire9 = (wire4 ?
                     $signed((~$unsigned(wire3))) : {$unsigned(($unsigned(wire7) > $unsigned((8'hab)))),
                         wire5[(2'h3):(2'h2)]});
  assign wire10 = wire7;
endmodule
