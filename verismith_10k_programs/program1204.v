module top
#(parameter param8 = (~|(|((7'h43) > (!((8'hb2) ? (8'hab) : (8'hbe)))))), 
parameter param9 = (param8 ? param8 : (^(~param8))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned(wire2[(4'hf):(1'h1)]);
  assign wire5 = ((((wire1 >= wire3) ?
                             $signed((wire2 ?
                                 wire3 : wire3)) : (wire4[(4'h9):(4'h8)] < (wire3 ?
                                 wire1 : wire2))) ?
                         {{{wire1, wire3}, $unsigned(wire2)}} : (~&((wire4 ?
                                 wire1 : wire2) ?
                             $unsigned(wire3) : $unsigned(wire3)))) ?
                     wire4 : $signed(((~|(wire2 <<< wire4)) ?
                         {(wire2 << wire4)} : wire2)));
  assign wire6 = $signed(wire4);
  assign wire7 = $unsigned(((wire4[(4'hc):(4'h8)] ^~ {wire3[(1'h0):(1'h0)],
                     (~^wire0)}) & (+(|(wire6 ? (7'h43) : wire3)))));
endmodule
