module top
#(parameter param9 = (~&(((((8'hb2) || (8'hae)) && ((8'hba) ? (8'h9d) : (8'hb0))) <= {{(8'ha0), (8'hb1)}}) == (+(-((8'hb8) ? (8'ha1) : (8'hae)))))), 
parameter param10 = param9)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h32):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire0;
  assign wire6 = ((wire4[(3'h7):(3'h6)] && $signed(wire1)) ?
                     (wire2 <<< $unsigned(wire2)) : (wire0[(1'h0):(1'h0)] & $unsigned(($signed(wire1) < (wire2 >= wire2)))));
  assign wire7 = (~{{(wire3[(3'h4):(2'h2)] ? {(8'ha5), (8'had)} : wire0)}});
  assign wire8 = (!wire3);
endmodule
