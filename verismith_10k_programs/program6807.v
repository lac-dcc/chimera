module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h2c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire0[(2'h2):(1'h0)];
  assign wire6 = {wire1,
                     {($signed(wire3) ?
                             $unsigned((wire0 ? wire1 : wire5)) : wire2)}};
  assign wire7 = ($signed($signed((wire2 > (wire2 ? wire2 : wire5)))) ?
                     $unsigned({wire4[(2'h2):(2'h2)],
                         ($unsigned((8'ha8)) << (wire2 | wire5))}) : (&($signed((~|wire0)) ?
                         {(wire0 & wire5)} : (((7'h41) ? wire1 : wire4) ?
                             wire2 : (wire2 ? wire6 : wire3)))));
  assign wire8 = wire1;
endmodule
