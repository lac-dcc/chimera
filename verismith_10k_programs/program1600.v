module top
#(parameter param10 = {((&(7'h42)) ? (({(8'ha3)} <= (~(8'h9f))) ? ((^(8'hb2)) ? ((7'h43) ? (8'hb9) : (8'haf)) : {(8'haf)}) : (((7'h42) ? (8'ha1) : (8'hb9)) ? (|(8'hb9)) : {(8'h9c)})) : ((((8'ha9) & (8'hb4)) ? ((8'ha8) ? (8'hab) : (8'had)) : ((8'hb0) ? (8'hae) : (8'hb1))) ? {((8'hbd) ^~ (8'hb3))} : (-((8'haa) >= (7'h41)))))}, 
parameter param11 = (~|(8'hbe)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  assign y = {wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (+$unsigned({$signed(wire1),
                     ((wire3 ? wire3 : wire2) ?
                         (wire3 << wire2) : $signed(wire1))}));
  assign wire6 = (^((|((|(8'h9d)) ? ((8'hb2) ? (8'hb4) : (8'hbc)) : wire2)) ?
                     wire0 : (wire2[(3'h6):(3'h6)] ?
                         $signed($unsigned(wire0)) : ($unsigned(wire3) && wire1))));
  assign wire7 = (wire4 | (!{wire2, (^wire5[(4'h9):(4'h9)])}));
  assign wire8 = wire4;
  assign wire9 = $unsigned(wire6);
endmodule
