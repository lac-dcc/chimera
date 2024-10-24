module top
#(parameter param8 = ((({(^~(8'hb2))} <<< (((8'ha4) ? (8'had) : (8'ha8)) <<< {(8'hbe)})) <<< (({(8'ha3)} ? ((8'hb0) ? (8'hb5) : (8'ha0)) : (8'hbb)) ? ((&(8'ha8)) > (~&(8'ha1))) : (~((8'hb8) <= (8'hb4))))) ? {((~|(~^(8'hab))) & ((8'haa) >> ((8'hbe) ? (8'hb9) : (8'hb7)))), (7'h42)} : {({((8'ha7) <= (8'hbb))} ? (((8'hb9) ^~ (8'hbe)) ? {(7'h44)} : {(8'ha9), (8'ha7)}) : ((&(7'h40)) < ((8'hb0) | (8'hbc)))), (!{((8'hb8) ? (8'ha4) : (8'ha0))})}), 
parameter param9 = (param8 ~^ {(7'h43)}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h12):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned({wire0[(1'h0):(1'h0)]});
  assign wire5 = wire0;
  assign wire6 = $signed((~|$unsigned($unsigned($signed(wire4)))));
  assign wire7 = ($unsigned((wire1 ?
                         (+((7'h43) ~^ wire3)) : (wire6[(2'h2):(2'h2)] ?
                             ((8'ha0) ? wire6 : wire4) : $signed(wire0)))) ?
                     wire2 : wire3[(2'h2):(1'h0)]);
endmodule
