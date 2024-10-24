module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire10;
  wire signed [(2'h2):(1'h0)] wire9;
  wire [(2'h3):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = {(wire4 ? wire3[(5'h10):(4'h9)] : $unsigned(wire2)),
                     wire4[(4'he):(2'h2)]};
  assign wire6 = {(((wire4 ? wire0 : $unsigned(wire1)) ?
                         ($signed(wire1) ?
                             $signed(wire1) : $signed(wire3)) : wire5) != (^$signed(((8'h9f) >> wire5)))),
                     (|(^~wire5[(4'h8):(3'h7)]))};
  assign wire7 = $signed({$signed({wire2}), (7'h42)});
  assign wire8 = $unsigned(($signed($signed($signed((8'ha1)))) + wire0[(2'h2):(1'h0)]));
  assign wire9 = wire7;
  assign wire10 = wire4;
  assign wire11 = $unsigned($signed((($signed(wire2) + wire5[(4'ha):(4'h8)]) - ($unsigned(wire5) ?
                      (~|wire5) : ((8'hb5) ? wire5 : wire7)))));
endmodule
