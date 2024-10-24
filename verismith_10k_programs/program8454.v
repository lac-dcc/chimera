module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire33;
  wire [(4'h8):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire31;
  wire signed [(4'he):(1'h0)] wire30;
  wire [(5'h11):(1'h0)] wire29;
  wire signed [(5'h10):(1'h0)] wire28;
  wire signed [(4'h8):(1'h0)] wire27;
  wire [(5'h12):(1'h0)] wire26;
  wire signed [(5'h13):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire12;
  wire signed [(4'hc):(1'h0)] wire11;
  wire signed [(4'hb):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire24,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = wire3[(3'h4):(3'h4)];
  assign wire6 = wire0[(1'h0):(1'h0)];
  assign wire7 = ({wire4, {{wire2[(1'h1):(1'h0)]}}} ?
                     wire4[(2'h3):(2'h3)] : (!(($unsigned(wire3) ?
                         (wire2 ? wire2 : wire4) : (wire5 ?
                             wire6 : wire6)) >> wire0[(3'h4):(3'h4)])));
  assign wire8 = ((8'ha5) ?
                     {($unsigned($unsigned(wire2)) ?
                             $unsigned($signed(wire3)) : wire2[(1'h1):(1'h0)])} : wire5[(2'h3):(1'h0)]);
  assign wire9 = (^~wire6[(2'h3):(2'h3)]);
  assign wire10 = (^~wire4[(3'h6):(1'h1)]);
  assign wire11 = {$signed(wire0)};
  assign wire12 = $signed($signed(wire10));
  module13 #() modinst25 (.clk(clk), .wire14(wire6), .wire17(wire11), .wire16(wire8), .wire15(wire7), .y(wire24));
  assign wire26 = (~^$signed(wire9));
  assign wire27 = (-wire5[(4'ha):(1'h0)]);
  assign wire28 = $unsigned(wire6);
  assign wire29 = $signed($signed(wire3[(3'h5):(3'h5)]));
  assign wire30 = wire3[(2'h3):(1'h1)];
  assign wire31 = $unsigned($unsigned($unsigned(wire24)));
  assign wire32 = {wire1[(2'h3):(2'h2)]};
  assign wire33 = $signed($signed(wire5));
endmodule

module module13
#(parameter param23 = (+{(-{((8'haa) <<< (8'ha4))})}))
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire17;
  input wire [(5'h12):(1'h0)] wire16;
  input wire [(4'hf):(1'h0)] wire15;
  input wire signed [(4'h9):(1'h0)] wire14;
  wire [(2'h2):(1'h0)] wire22;
  wire [(5'h10):(1'h0)] wire21;
  wire [(5'h11):(1'h0)] wire20;
  wire [(5'h15):(1'h0)] wire19;
  wire signed [(4'ha):(1'h0)] wire18;
  assign y = {wire22, wire21, wire20, wire19, wire18, (1'h0)};
  assign wire18 = {(+(wire15[(4'h9):(1'h0)] || (8'ha6)))};
  assign wire19 = ((~&wire15) || (7'h43));
  assign wire20 = wire18;
  assign wire21 = (!($unsigned(wire16) ? wire20 : {(~|wire19)}));
  assign wire22 = $unsigned($unsigned(wire14));
endmodule
