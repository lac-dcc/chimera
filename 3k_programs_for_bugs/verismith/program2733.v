module top
#(parameter param11 = (-(((((8'ha9) ? (8'hb4) : (8'hb5)) ? {(8'ha8)} : (-(8'ha6))) ? (((8'h9e) ^~ (8'ha3)) ^ (~|(8'ha6))) : {{(7'h41)}}) ? ({((8'ha4) | (8'ha9)), ((8'h9d) ? (8'ha9) : (7'h41))} ? {((8'h9f) << (8'hbe)), (7'h44)} : ((+(8'ha0)) <= ((8'hb8) >> (8'ha0)))) : ((8'hab) & (((7'h40) ? (8'h9e) : (8'had)) >>> ((7'h42) ? (8'h9f) : (8'ha9)))))), 
parameter param12 = (((({param11} >= (param11 ? param11 : param11)) ? (!(~&param11)) : param11) ? (8'hbd) : param11) ? (((~^((8'hba) ? (8'hb0) : param11)) << ((param11 ? param11 : param11) ? (param11 ? param11 : (8'hab)) : (+param11))) >>> (~|param11)) : (^~(((^~param11) ? (param11 ? param11 : param11) : ((8'ha3) ? param11 : param11)) ? ((~|param11) && {param11, param11}) : param11))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $unsigned($unsigned(({(wire0 | wire3),
                     (wire4 << (8'hbf))} << (((8'h9e) ?
                     wire1 : wire1) & wire0[(1'h1):(1'h0)]))));
  assign wire6 = (wire4[(2'h3):(1'h1)] < (8'hbc));
  assign wire7 = $unsigned($signed(((8'hb7) ?
                     ((wire5 < (8'hba)) ?
                         ((8'hb8) ?
                             wire3 : wire0) : $unsigned(wire3)) : (8'ha0))));
  assign wire8 = wire2;
  assign wire9 = wire8[(3'h4):(2'h3)];
  assign wire10 = (~|wire4[(3'h5):(1'h0)]);
endmodule
