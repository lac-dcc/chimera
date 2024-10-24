module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire22;
  wire signed [(5'h10):(1'h0)] wire20;
  wire signed [(4'hd):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  assign y = {wire22, wire20, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $unsigned($signed($unsigned(($signed((8'hae)) ?
                     wire2 : $unsigned(wire4)))));
  assign wire6 = wire5[(4'he):(4'h9)];
  assign wire7 = (wire2 >= ({($unsigned(wire0) + (wire4 << wire3)),
                         $signed((wire4 ? wire1 : wire5))} ?
                     ({{wire4, wire2}, $unsigned(wire5)} ?
                         $unsigned(wire4[(1'h0):(1'h0)]) : wire5) : wire5[(4'h9):(3'h6)]));
  assign wire8 = {(~^(8'ha9))};
  module9 #() modinst21 (.wire10(wire3), .wire11(wire5), .clk(clk), .wire12(wire1), .y(wire20), .wire13(wire7));
  assign wire22 = wire5[(4'hd):(4'hc)];
endmodule

module module9
#(parameter param19 = {(^~(({(8'ha7), (8'hb1)} > {(8'haf), (8'h9c)}) ? ((~|(8'hb5)) ? ((8'hb5) - (8'hb7)) : ((8'h9c) ? (8'hb4) : (7'h44))) : ({(8'ha0), (8'h9e)} >= ((8'ha9) == (8'hb7)))))})
(y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'h33):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire13;
  input wire signed [(4'hb):(1'h0)] wire12;
  input wire [(4'hc):(1'h0)] wire11;
  input wire [(4'hb):(1'h0)] wire10;
  wire [(4'hd):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire17;
  wire signed [(3'h4):(1'h0)] wire16;
  wire [(5'h13):(1'h0)] wire15;
  wire signed [(3'h5):(1'h0)] wire14;
  assign y = {wire18, wire17, wire16, wire15, wire14, (1'h0)};
  assign wire14 = wire11;
  assign wire15 = wire13[(3'h4):(2'h2)];
  assign wire16 = wire14;
  assign wire17 = (^~$signed(($unsigned(((8'hb1) ?
                      wire13 : wire14)) != ((wire16 & wire16) ?
                      (wire16 != wire16) : {(8'hab)}))));
  assign wire18 = wire11[(1'h1):(1'h1)];
endmodule
