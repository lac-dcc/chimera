module top
#(parameter param14 = (-(-{(((8'hb5) <<< (8'hbf)) ? ((8'hb9) <<< (8'hb4)) : (-(8'hb3))), (((8'ha2) ? (7'h42) : (8'hbf)) >= (7'h44))})), 
parameter param15 = param14)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire12;
  wire signed [(3'h6):(1'h0)] wire11;
  wire signed [(2'h2):(1'h0)] wire10;
  wire signed [(2'h3):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire4;
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
  assign wire4 = ((^$signed(($unsigned(wire2) ?
                     (wire2 ? wire3 : (7'h43)) : (wire0 ?
                         (8'hb9) : wire2)))) && $signed({wire0[(4'hf):(4'ha)]}));
  assign wire5 = {(!(-((~|wire3) ? (wire4 != wire3) : wire1[(4'ha):(3'h5)]))),
                     ((|wire1) ?
                         $unsigned($signed(wire3)) : wire4[(1'h1):(1'h1)])};
  assign wire6 = ($signed(wire4) < (($unsigned(wire0) ?
                         $unsigned(wire3[(4'h8):(3'h4)]) : (~&(wire4 ?
                             wire3 : wire2))) ?
                     (((wire4 ? wire3 : wire1) > wire5) ?
                         wire0[(3'h4):(1'h0)] : wire5) : wire0));
  assign wire7 = wire6;
  assign wire8 = $unsigned($unsigned($signed($signed((wire6 << wire1)))));
  assign wire9 = (wire3 <= wire4[(2'h3):(2'h2)]);
  assign wire10 = $signed(wire1[(3'h5):(1'h1)]);
  assign wire11 = wire8[(4'h8):(4'h8)];
  assign wire12 = {wire0,
                      ({(wire11 ? $unsigned(wire3) : (+wire2)), wire4} ?
                          wire11 : wire11[(3'h6):(3'h4)])};
  assign wire13 = ($signed(wire2[(3'h5):(1'h0)]) ?
                      wire2 : {((wire2 ? {wire9} : wire12[(2'h3):(1'h0)]) ?
                              (wire1 ?
                                  {wire4,
                                      wire2} : $unsigned(wire4)) : ($signed(wire12) > $signed(wire7))),
                          ({wire12[(3'h7):(1'h0)], (wire2 >>> (8'hbb))} ?
                              (wire2[(1'h1):(1'h1)] >= (wire8 + wire10)) : $unsigned(wire4))});
endmodule
