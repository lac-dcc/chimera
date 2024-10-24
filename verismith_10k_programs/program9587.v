module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire10;
  wire [(3'h4):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire5;
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = (wire0[(1'h0):(1'h0)] ?
                     (($unsigned($unsigned(wire2)) || wire0[(3'h5):(2'h3)]) ?
                         (wire2 ?
                             $signed(wire2[(1'h1):(1'h0)]) : (wire2[(1'h0):(1'h0)] || (wire1 ?
                                 wire0 : wire2))) : (|(7'h44))) : $unsigned({wire4[(4'h9):(4'h8)]}));
  assign wire6 = wire2[(1'h0):(1'h0)];
  assign wire7 = wire5[(1'h1):(1'h0)];
  assign wire8 = $unsigned((8'ha0));
  assign wire9 = wire0[(1'h1):(1'h0)];
  assign wire10 = (~wire8);
  assign wire11 = (((~&$signed((wire2 ?
                      wire6 : wire2))) + (+wire2[(1'h1):(1'h0)])) & $signed(($signed($unsigned((8'hb5))) != ((-wire3) == $unsigned((8'ha5))))));
  assign wire12 = wire0[(4'hb):(3'h6)];
endmodule
