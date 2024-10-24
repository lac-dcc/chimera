module top
#(parameter param12 = (8'ha4))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire11;
  wire [(4'ha):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire9;
  wire signed [(4'h8):(1'h0)] wire8;
  wire signed [(2'h3):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $signed((($unsigned((wire2 << wire3)) ?
                         (wire4[(3'h6):(1'h1)] ?
                             (wire4 ? wire3 : (8'hb9)) : (wire0 ?
                                 wire3 : wire1)) : {(wire0 >> wire4), wire0}) ?
                     {wire4,
                         ((wire3 ? wire3 : wire2) ?
                             (wire4 ?
                                 wire1 : wire1) : (!(8'hb4)))} : $unsigned(({wire0,
                         wire4} >> $unsigned(wire1)))));
  assign wire6 = (wire3[(4'h8):(3'h5)] ?
                     (|(((wire5 > wire0) != (wire4 < (8'ha6))) ?
                         (((8'ha2) || wire2) ?
                             (8'hb4) : $unsigned(wire5)) : $signed($signed(wire3)))) : ({(&wire3)} ?
                         $signed(wire4[(2'h2):(2'h2)]) : $signed(wire5[(1'h1):(1'h0)])));
  assign wire7 = wire6[(2'h2):(2'h2)];
  assign wire8 = wire3;
  assign wire9 = wire0;
  assign wire10 = wire8;
  assign wire11 = ($signed($unsigned(((~|wire4) ?
                      {wire9,
                          (8'hac)} : wire8[(2'h3):(1'h1)]))) ^~ (($signed((wire4 ?
                          wire4 : wire7)) ?
                      (wire1 ^ (^~wire3)) : ($unsigned((8'ha3)) < (wire6 ?
                          wire1 : wire6))) ~^ (((wire4 <= (7'h41)) == (~^wire2)) ?
                      (|$signed(wire8)) : (-(wire8 ? wire9 : wire8)))));
endmodule
