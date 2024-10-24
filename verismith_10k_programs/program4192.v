module top
#(parameter param12 = {((8'hb7) - (8'hbe)), ((8'hb4) < (8'hb6))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (+$unsigned((($unsigned(wire4) > (wire2 - wire0)) ?
                     wire2[(1'h0):(1'h0)] : wire2[(2'h2):(1'h0)])));
  assign wire6 = wire4[(3'h6):(1'h1)];
  assign wire7 = (~^$signed(((8'hbd) ?
                     ((8'h9f) >>> $signed(wire3)) : wire0[(4'h9):(2'h3)])));
  assign wire8 = wire7;
  assign wire9 = (((~({wire2, wire3} ?
                         (wire7 * wire6) : $signed((8'ha6)))) < wire6) ?
                     (!$unsigned(wire2)) : (~^wire5[(4'h8):(1'h0)]));
  assign wire10 = (wire9 ?
                      ((8'h9f) ?
                          ($signed((~&wire9)) >= $signed((wire8 ?
                              wire1 : wire1))) : $signed((^~(~^wire3)))) : ((!wire4) ^ (~$signed(wire5))));
  assign wire11 = $signed({(wire3[(2'h3):(2'h2)] >= $signed((-wire9)))});
endmodule
