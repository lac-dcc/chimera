module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire11;
  wire signed [(4'hb):(1'h0)] wire10;
  wire [(2'h3):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = (wire0[(4'hb):(3'h7)] & {(^$signed(wire0))});
  assign wire6 = $unsigned(($unsigned(((wire0 ? wire5 : wire4) ?
                         (~&wire5) : ((8'hb8) ? (8'haf) : wire5))) ?
                     (~&$unsigned($signed(wire0))) : $unsigned((+(wire3 == wire3)))));
  assign wire7 = ((7'h43) <<< wire1);
  assign wire8 = $signed(wire5[(3'h4):(1'h0)]);
  assign wire9 = wire6[(2'h2):(2'h2)];
  assign wire10 = (^($unsigned(((-wire1) > (wire3 || wire7))) && {((wire9 ?
                          wire5 : wire2) > $unsigned(wire3)),
                      (~|((8'hac) >>> wire9))}));
  assign wire11 = $signed($signed($signed(wire10[(4'h9):(3'h7)])));
  assign wire12 = (~&((-(((8'haf) >= wire6) ? $signed(wire7) : (-wire9))) ?
                      (((wire6 ? wire8 : wire7) ?
                          wire2 : $signed(wire2)) >>> (-{(8'ha6)})) : $unsigned($unsigned(wire0))));
endmodule
