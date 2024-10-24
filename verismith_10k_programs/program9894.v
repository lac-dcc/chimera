module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h77):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire12;
  wire [(3'h5):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire9;
  wire signed [(4'h8):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = ({(($unsigned(wire0) <= $unsigned(wire1)) << $unsigned(wire0))} ?
                     ($unsigned((~^wire3)) ?
                         wire2 : $unsigned(((~wire0) ?
                             $signed(wire2) : wire2))) : ($signed(((wire1 ?
                         wire3 : wire1) + ((8'h9d) ?
                         wire2 : wire0))) + $unsigned($signed($signed(wire0)))));
  assign wire5 = (!(^wire0[(3'h4):(3'h4)]));
  assign wire6 = ($unsigned(({(wire3 || (7'h44))} ^~ (8'hbb))) ?
                     (|$signed({(8'hae),
                         ((8'h9d) != wire4)})) : $signed(wire1));
  assign wire7 = (^~(^(((wire2 ? wire4 : wire0) != {wire6, wire6}) ^~ ((wire4 ?
                         wire4 : wire4) ?
                     (+(8'hae)) : wire3))));
  assign wire8 = wire4[(4'hb):(4'hb)];
  assign wire9 = ({wire5} >>> ({{$signed(wire6), (wire8 * (8'hbe))},
                     wire6} != wire5));
  assign wire10 = (~(wire3[(1'h1):(1'h0)] ?
                      {wire0} : {wire8[(3'h6):(3'h5)],
                          ($signed((8'hb7)) > $unsigned(wire8))}));
  assign wire11 = (8'hbb);
  assign wire12 = $unsigned($signed({(wire10[(4'hb):(4'ha)] ?
                          wire5 : $unsigned((8'hbc)))}));
endmodule
