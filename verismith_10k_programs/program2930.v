module top
#(parameter param8 = (({{{(8'had), (8'haa)}}, (-(+(8'had)))} >= (|((~&(8'haf)) >>> (|(8'hb0))))) ? ((((^(8'hbe)) ? ((8'hb8) ? (8'hbf) : (8'had)) : ((8'hab) | (8'hb4))) ? (((8'ha8) ~^ (8'hb0)) ? (~&(8'ha5)) : ((7'h40) ? (8'ha9) : (8'hbb))) : (((8'hb0) ? (8'h9e) : (8'hb7)) ~^ {(8'ha4)})) ? (~(((8'ha2) ? (8'ha6) : (8'h9f)) + (+(8'h9e)))) : (|(((8'hae) ? (8'haf) : (8'hbf)) & {(8'hb6)}))) : (&(({(7'h42), (8'hac)} & ((8'had) >> (8'hbe))) ? ((|(7'h43)) ? ((8'hb5) ? (8'hb5) : (8'ha4)) : ((8'hb3) * (8'hb1))) : {((8'ha7) > (8'hb1))}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h24):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (^($signed((wire0[(4'he):(1'h0)] ? wire0 : $unsigned(wire1))) ?
                     (~$unsigned(wire0)) : {(!{wire2}),
                         ((wire3 - wire0) > {wire0})}));
  assign wire5 = (($signed(wire2) << $signed($signed((wire3 + (8'hae))))) && ((8'ha5) ?
                     wire1[(2'h3):(1'h0)] : wire2));
  assign wire6 = (wire0[(1'h1):(1'h0)] + ($unsigned($unsigned(wire3)) - ((wire2 >= (wire5 ?
                     wire4 : wire1)) >= ($signed(wire2) ?
                     wire1[(4'ha):(4'h9)] : $signed(wire4)))));
  assign wire7 = $unsigned($unsigned((~&wire3)));
endmodule
