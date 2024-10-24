module top
#(parameter param9 = (((({(8'haf)} ? (~&(7'h40)) : ((8'hab) ? (7'h40) : (8'ha1))) | {(~|(8'hae)), ((8'ha2) * (8'haf))}) ? (8'ha5) : (~(((8'ha7) ? (8'ha5) : (8'hbf)) * ((8'ha3) * (8'hb1))))) ? ((+(((8'hbd) * (8'h9e)) + {(8'ha2)})) == ((~|{(7'h40)}) ? ((~&(8'hae)) ? ((8'ha7) ? (7'h42) : (8'ha8)) : {(7'h41)}) : (((8'h9c) ? (8'haa) : (8'hb1)) ~^ ((8'h9c) + (7'h40))))) : ((|(((7'h40) ? (8'h9d) : (8'ha9)) ? {(8'ha7), (7'h41)} : ((8'ha2) ? (8'hbd) : (8'hb6)))) ? (((+(8'hb7)) < ((8'hbe) ? (8'hab) : (8'hb6))) == ((8'ha7) != (8'hb9))) : (((~^(8'ha8)) ? (~(8'hb8)) : {(8'hb9)}) ? (((8'ha3) ? (8'hb7) : (8'hb3)) ? ((8'ha6) & (8'hb2)) : (8'ha9)) : (((8'hb2) ? (8'h9c) : (8'ha5)) ^ ((8'ha1) || (8'hb2)))))), 
parameter param10 = ((~|(((8'h9c) <<< (8'hae)) ^~ ((^param9) ^ (^~param9)))) << (&param9)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = {((~&(|(wire0 ? wire0 : (8'ha6)))) - ((^~{(7'h40),
                         wire3}) != ({wire0, wire0} <= $signed(wire1)))),
                     (($unsigned(wire2) <= wire0) ?
                         $signed($signed((&wire3))) : wire3)};
  assign wire5 = ($signed($unsigned($signed((wire2 ?
                     wire2 : wire2)))) >= $unsigned($unsigned(((^~wire1) ?
                     $unsigned(wire2) : $signed(wire2)))));
  assign wire6 = wire5[(2'h2):(1'h1)];
  assign wire7 = (wire2[(2'h2):(1'h0)] >> wire1[(3'h4):(3'h4)]);
  assign wire8 = wire3[(1'h1):(1'h1)];
endmodule
