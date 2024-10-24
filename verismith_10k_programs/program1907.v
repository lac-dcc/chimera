module top
#(parameter param11 = ((((((8'hb6) ? (8'had) : (8'hb6)) * ((8'ha1) >>> (8'hb9))) < {((8'hab) ? (8'hbc) : (8'hbf))}) << (((^~(8'hae)) ? {(8'ha8), (8'h9e)} : ((8'ha5) == (8'hb9))) ? ((&(8'ha0)) ? (~|(8'hb1)) : ((8'hab) * (8'hb8))) : ({(8'hb4)} ? ((8'hbb) ^~ (8'hbb)) : ((7'h42) ? (8'ha9) : (7'h42))))) || ({({(8'hbe)} << ((8'haa) ? (8'hb3) : (8'ha1)))} != {{(&(8'had)), ((7'h40) ? (8'hb1) : (7'h41))}, ((|(8'hb7)) ? ((8'hb2) ~^ (8'ha7)) : ((8'hb6) | (8'haf)))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire10;
  wire [(4'hf):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire8;
  wire signed [(2'h3):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire1[(2'h3):(2'h3)];
  assign wire5 = $signed((($signed(wire4[(4'hc):(3'h4)]) >= $signed($unsigned(wire1))) ?
                     $signed(((wire4 < (8'had)) ?
                         (!wire0) : $unsigned(wire2))) : wire4));
  assign wire6 = $signed((~&{((wire5 ? wire5 : wire4) ?
                         (8'h9d) : $signed(wire4)),
                     $unsigned(wire4)}));
  assign wire7 = wire3;
  assign wire8 = wire6;
  assign wire9 = $signed((({(wire3 < (8'ha1))} | wire1) ^ ($unsigned((wire3 ?
                         wire1 : (8'ha2))) ?
                     $unsigned($unsigned(wire7)) : ((~&wire1) <<< wire0[(3'h5):(1'h0)]))));
  assign wire10 = $signed((((-wire6) >> (^{(7'h40), wire0})) ?
                      $signed($unsigned(((8'ha4) ?
                          (8'hb5) : (7'h44)))) : (8'ha2)));
endmodule
