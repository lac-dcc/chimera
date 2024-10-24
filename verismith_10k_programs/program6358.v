module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h25):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $signed((wire0[(2'h2):(1'h1)] | ((wire3[(5'h10):(4'he)] ?
                         (wire2 < wire1) : wire0[(1'h0):(1'h0)]) ?
                     $unsigned($signed(wire3)) : $signed({wire1, wire0}))));
  assign wire5 = ((wire2 << $signed((8'hb6))) ?
                     {{((wire0 << wire2) ? wire3 : wire1[(4'hc):(2'h2)]),
                             (~|wire3)},
                         ((wire2[(3'h7):(3'h5)] ?
                             {wire1} : wire2[(4'h9):(3'h5)]) && ($unsigned(wire4) || (wire2 << wire4)))} : (wire1[(4'hc):(4'ha)] ?
                         $unsigned(((wire1 ^ (8'hb6)) != {wire2,
                             (7'h42)})) : (|$signed(wire4))));
  assign wire6 = (^~wire3[(4'h8):(2'h3)]);
  assign wire7 = wire2[(3'h4):(2'h2)];
endmodule
