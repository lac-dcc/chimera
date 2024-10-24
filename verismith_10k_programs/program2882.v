module top
#(parameter param22 = ((8'hba) ^ ((~^(((7'h43) >= (8'ha7)) ? ((8'h9f) || (7'h41)) : (-(8'haf)))) | ({(~(8'hb5))} <= (((8'h9f) ? (8'hb0) : (8'h9c)) & {(8'hb5), (8'haf)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire21;
  wire [(4'hd):(1'h0)] wire19;
  wire signed [(3'h6):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire4;
  assign y = {wire21, wire19, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned(wire2);
  assign wire5 = (+wire4[(1'h1):(1'h0)]);
  assign wire6 = ((wire2 ?
                     ((wire4 ^ $unsigned(wire1)) ?
                         ((~&(8'hbd)) && (~^(8'hb9))) : ($unsigned(wire0) ?
                             (wire2 ?
                                 wire4 : wire2) : wire1[(2'h3):(2'h2)])) : wire3[(4'h9):(4'h8)]) >> wire5[(1'h0):(1'h0)]);
  assign wire7 = $signed(((&$signed($unsigned(wire6))) ?
                     (wire4 && {(|wire3)}) : $signed($signed((8'hb9)))));
  module8 #() modinst20 (.clk(clk), .y(wire19), .wire9(wire3), .wire10(wire5), .wire12(wire7), .wire11(wire2));
  assign wire21 = $signed(wire4);
endmodule

module module8
#(parameter param17 = (^(((~|((7'h44) * (8'ha5))) ? ((+(8'hac)) ? ((8'ha5) ? (7'h40) : (8'hb9)) : ((8'had) ? (8'ha9) : (8'ha9))) : (!(+(8'hbb)))) ? ((|(!(8'hbd))) ? ((~^(8'hb1)) == ((8'hbb) << (8'ha7))) : (((8'ha5) ? (8'hbf) : (8'ha9)) ? {(8'hb4), (7'h43)} : {(8'ha3), (8'hac)})) : (+(!{(8'hb5)})))), 
parameter param18 = {(~(8'ha6))})
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h25):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire12;
  input wire signed [(3'h5):(1'h0)] wire11;
  input wire [(5'h11):(1'h0)] wire10;
  input wire signed [(4'hb):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire16;
  wire [(4'h9):(1'h0)] wire15;
  wire [(3'h4):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire13;
  assign y = {wire16, wire15, wire14, wire13, (1'h0)};
  assign wire13 = (wire11[(2'h2):(1'h0)] != (wire10 ?
                      $unsigned(wire11[(3'h5):(3'h4)]) : $signed(wire9[(3'h6):(3'h5)])));
  assign wire14 = wire10[(1'h0):(1'h0)];
  assign wire15 = $signed($signed(wire11));
  assign wire16 = ($signed($unsigned($signed($signed(wire12)))) >> ((~|(^(~wire12))) ?
                      (^~(!(wire10 >> wire13))) : $unsigned(($unsigned((8'hb2)) ?
                          (wire15 ? wire10 : wire11) : wire13))));
endmodule
