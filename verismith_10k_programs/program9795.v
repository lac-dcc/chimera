module top
#(parameter param10 = (+{((((8'hbd) ? (8'h9e) : (8'hbe)) + (&(8'ha4))) && ((|(7'h42)) < ((8'haa) ? (8'hab) : (8'hb8)))), (+((~&(7'h41)) >> ((8'hb8) + (8'hbe))))}), 
parameter param11 = (~param10))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h2c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire [(4'h8):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire8;
  wire signed [(4'h8):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire5;
  assign y = {wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $signed($signed(wire3));
  assign wire6 = (wire2 - wire2[(3'h7):(3'h7)]);
  assign wire7 = {{({(wire2 || wire3)} & $unsigned((wire3 ? wire2 : wire0))),
                         {(-((8'ha7) ? wire6 : wire1)), wire5}}};
  assign wire8 = wire2[(1'h1):(1'h1)];
  assign wire9 = $signed($unsigned(wire5[(2'h2):(2'h2)]));
endmodule
