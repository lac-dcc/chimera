module top
#(parameter param12 = ((((-(-(8'ha9))) > (^~((8'hab) || (8'hb8)))) ^ (~^({(7'h43)} >>> (^~(8'h9f))))) + ((^~(~{(8'hbc), (8'hb3)})) ? ((^(-(7'h41))) ? (((8'hab) + (7'h40)) && ((8'h9e) ? (8'ha5) : (7'h42))) : (((8'hbf) == (8'haf)) ? (~(8'ha5)) : (+(8'ha9)))) : ((+(8'hbd)) ? ((|(8'had)) <<< {(8'ha7)}) : ({(7'h40)} ? ((8'ha5) ? (8'h9c) : (8'ha9)) : (!(7'h41)))))), 
parameter param13 = param12)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (wire3 ?
                     $signed($unsigned(wire3)) : (wire3[(3'h5):(2'h3)] ?
                         wire3 : wire1));
  assign wire5 = $signed({(wire1 ?
                         $signed((wire1 ? (8'ha8) : wire0)) : (wire4 ?
                             wire1[(1'h1):(1'h1)] : (wire3 ? wire0 : wire0))),
                     wire4});
  assign wire6 = wire3[(4'hb):(2'h3)];
  assign wire7 = wire0[(4'ha):(3'h5)];
  assign wire8 = $signed($unsigned(wire2[(4'hb):(4'h9)]));
  assign wire9 = wire7;
  assign wire10 = ($unsigned($unsigned(((!wire5) ?
                      (~|wire6) : wire9))) >>> ((wire3 > ((!(7'h43)) <= (wire4 ?
                          wire7 : (8'ha0)))) ?
                      (|(wire9 ? (!wire3) : (8'ha1))) : wire5[(3'h4):(1'h0)]));
  assign wire11 = (~|$unsigned(wire5[(4'he):(4'h9)]));
endmodule
