module top
#(parameter param11 = ((!((8'hb1) ? {((8'h9c) ? (8'hbc) : (8'hbf)), (~(7'h43))} : (((8'ha9) >= (8'ha4)) ? ((8'hba) <= (8'hab)) : ((8'ha7) - (8'ha9))))) - {((&(8'hbe)) < (8'h9f)), ((~&((8'ha9) ? (8'ha6) : (8'hab))) <= {{(8'hb9)}})}), 
parameter param12 = {param11, ({(^param11), ((8'ha7) ? (param11 ? param11 : (8'hb1)) : (param11 && param11))} ? ({(^~param11)} ^ (~|(-param11))) : (|param11))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire4;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned((|(((&(7'h40)) >= $unsigned((8'hae))) ?
                     ((wire1 ? wire1 : wire1) ?
                         (8'hb2) : $unsigned(wire2)) : wire2[(2'h3):(1'h0)])));
  assign wire5 = wire0[(1'h1):(1'h0)];
  assign wire6 = (&$unsigned(wire5[(1'h1):(1'h0)]));
  assign wire7 = wire1;
  assign wire8 = $signed(wire6);
  assign wire9 = (^((wire8[(2'h3):(2'h3)] ?
                     ($unsigned(wire5) ?
                         (^~(7'h42)) : (wire0 ?
                             wire8 : (8'h9c))) : $signed((wire8 >>> wire4))) != {(wire2 > (wire5 ?
                         wire5 : wire1)),
                     (wire3 & (7'h43))}));
  assign wire10 = ($unsigned(wire9) ?
                      (^~wire9) : $signed(((+$unsigned(wire8)) ?
                          $unsigned((-wire5)) : $signed((&wire1)))));
endmodule
