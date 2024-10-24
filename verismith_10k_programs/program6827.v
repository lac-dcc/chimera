module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire4;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $signed(wire0);
  assign wire6 = wire0;
  assign wire7 = wire1[(4'hb):(4'h9)];
  assign wire8 = (wire4 ?
                     (wire4 ?
                         (8'hb0) : (((wire7 == wire1) ?
                             wire5[(4'hc):(3'h6)] : (~wire2)) != (+wire2[(4'h8):(3'h7)]))) : $unsigned({wire7[(1'h0):(1'h0)],
                         $unsigned((wire0 ? wire6 : wire2))}));
endmodule
