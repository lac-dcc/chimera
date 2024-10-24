module top
#(parameter param25 = (8'h9d))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire9;
  wire [(3'h6):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire23;
  assign y = {wire5, wire6, wire7, wire8, wire9, wire10, wire23, (1'h0)};
  assign wire5 = (~((8'ha7) ?
                     $signed(wire1[(2'h2):(1'h0)]) : (^{(wire0 < wire3)})));
  assign wire6 = (((8'hb1) >>> {wire3, $unsigned($signed(wire1))}) ?
                     {$signed($unsigned(wire5))} : ($unsigned((wire0 ?
                         $signed(wire2) : $unsigned(wire1))) - wire4[(2'h3):(2'h2)]));
  assign wire7 = $unsigned($signed(($signed(wire2[(4'h8):(1'h0)]) ?
                     (7'h44) : (wire6 | {wire4}))));
  assign wire8 = wire0[(2'h3):(1'h0)];
  assign wire9 = $signed($signed($unsigned($unsigned((wire8 << (7'h43))))));
  assign wire10 = wire2;
  module11 #() modinst24 (.clk(clk), .wire16(wire8), .y(wire23), .wire12(wire7), .wire13(wire0), .wire14(wire1), .wire15(wire9));
endmodule

module module11  (y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire16;
  input wire [(4'hd):(1'h0)] wire15;
  input wire signed [(2'h2):(1'h0)] wire14;
  input wire [(4'hf):(1'h0)] wire13;
  input wire signed [(5'h11):(1'h0)] wire12;
  wire signed [(4'hc):(1'h0)] wire22;
  wire [(3'h7):(1'h0)] wire21;
  wire [(3'h4):(1'h0)] wire20;
  wire [(2'h3):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire17;
  assign y = {wire22, wire21, wire20, wire19, wire18, wire17, (1'h0)};
  assign wire17 = wire12[(5'h11):(4'ha)];
  assign wire18 = $signed($unsigned((~&(!(wire17 ? (8'ha2) : (8'ha6))))));
  assign wire19 = $unsigned($unsigned({(wire15 && (wire16 || wire13))}));
  assign wire20 = wire19;
  assign wire21 = $unsigned($unsigned(wire14));
  assign wire22 = wire20[(1'h0):(1'h0)];
endmodule
