module top
#(parameter param14 = (~&(((((7'h40) ? (8'hb7) : (8'ha1)) ? (!(8'hb7)) : {(8'hb5), (8'hbe)}) != (((8'hbf) + (8'ha6)) ? ((8'had) << (8'hbf)) : ((8'ha0) ~^ (8'hb2)))) & (^~(|((8'hbb) == (8'ha1)))))), 
parameter param15 = (^~((param14 ? param14 : param14) - {param14})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire12;
  wire [(3'h7):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire9;
  wire [(4'hd):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire4;
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = wire3[(4'hc):(2'h2)];
  assign wire5 = wire1;
  assign wire6 = (|wire3);
  assign wire7 = (&(((((8'hbf) * wire3) ?
                     (|(7'h43)) : $signed(wire5)) || $signed((8'ha2))) & wire1));
  assign wire8 = (($signed((+wire3)) || wire4) ?
                     ((&wire7) ~^ $signed((wire5 || $signed(wire4)))) : wire3[(5'h13):(4'h9)]);
  assign wire9 = $signed(wire6);
  assign wire10 = ((~^{$signed((8'ha9)),
                          ((wire6 ? (8'hab) : wire8) > (!wire8))}) ?
                      wire8 : $signed(wire3));
  assign wire11 = wire10;
  assign wire12 = (wire10[(4'hf):(4'hd)] ?
                      (+(&$signed(wire10[(1'h0):(1'h0)]))) : $signed(((wire3[(5'h11):(4'hc)] << (wire8 ?
                              (8'hbf) : wire7)) ?
                          (8'h9e) : $unsigned($signed((8'ha4))))));
  assign wire13 = {wire4[(1'h1):(1'h1)], wire3[(2'h2):(1'h1)]};
endmodule
