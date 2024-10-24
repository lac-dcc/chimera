module top
#(parameter param11 = {({((|(8'hb5)) && {(8'ha6), (8'hb5)})} ^ (7'h40))}, 
parameter param12 = (param11 - ((((8'hba) ^~ {param11, param11}) || param11) ? ({{param11}} << ((param11 ? (8'hb6) : param11) ? (param11 >= param11) : (param11 ? (8'haa) : param11))) : ((~^(~^(8'hb4))) ? param11 : (param11 < (param11 ? param11 : param11))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (|$unsigned(($unsigned($signed(wire0)) || wire1[(2'h2):(2'h2)])));
  assign wire6 = $signed($unsigned((^~($signed(wire0) + {wire3}))));
  assign wire7 = (^($signed(wire5[(4'hb):(3'h5)]) ?
                     wire1[(4'he):(4'hd)] : $unsigned((wire0 * (wire0 == wire0)))));
  assign wire8 = $unsigned((~^wire0[(3'h5):(2'h3)]));
  assign wire9 = ($unsigned(wire8) ?
                     (wire8[(1'h1):(1'h1)] ~^ wire4) : wire7[(3'h7):(3'h5)]);
  assign wire10 = (-{$unsigned($signed($signed(wire8)))});
endmodule
