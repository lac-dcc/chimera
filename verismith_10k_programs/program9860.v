module top
#(parameter param12 = (-((-({(8'hab)} - ((8'ha2) ? (8'had) : (8'hb2)))) ? ((+((8'hb2) ? (7'h44) : (8'ha2))) << {((8'h9d) * (8'h9d)), (8'ha1)}) : ({{(8'hb4)}} == (&(|(8'hb4)))))), 
parameter param13 = (7'h44))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h58):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire4;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire9;
  wire signed [(4'ha):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire5;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $unsigned((((wire3 ?
                     (-(8'ha7)) : (^~wire4)) <= wire1[(4'h8):(2'h2)]) >= ($signed((wire1 ?
                         wire4 : wire1)) ?
                     $signed((wire2 ?
                         wire0 : wire1)) : ($signed(wire3) << (wire2 ?
                         wire1 : (7'h40))))));
  assign wire6 = (wire1[(1'h0):(1'h0)] ?
                     wire0 : $unsigned(wire4[(1'h0):(1'h0)]));
  assign wire7 = {$signed((|({wire4} & wire3)))};
  assign wire8 = $unsigned(((wire1 * {(wire7 > wire6)}) & wire3));
  assign wire9 = (~&(wire2[(4'hf):(3'h5)] ?
                     wire4[(2'h3):(2'h2)] : {wire2[(4'hc):(4'h9)]}));
  assign wire10 = (wire9[(4'hc):(4'hc)] ?
                      ($unsigned(((wire1 ?
                          wire0 : wire1) >>> $unsigned(wire2))) >>> ((~^$unsigned(wire4)) ?
                          (wire3[(3'h6):(1'h1)] ?
                              {wire9} : $unsigned(wire8)) : (8'hac))) : (((wire6 || $unsigned(wire6)) ?
                              (8'ha6) : ((wire8 ? wire8 : wire5) ~^ {wire7,
                                  wire5})) ?
                          ($unsigned((8'hb9)) ?
                              ((wire3 ? wire0 : wire8) ?
                                  $signed(wire1) : wire1[(4'h9):(2'h2)]) : wire3) : $signed(((wire3 ?
                                  wire5 : wire3) ?
                              wire6 : (wire6 ? (7'h44) : wire5)))));
  assign wire11 = $unsigned({wire9});
endmodule
