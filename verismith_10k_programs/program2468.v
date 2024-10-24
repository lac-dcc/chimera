module top
#(parameter param12 = (((((~|(8'h9f)) ? {(8'hbb), (7'h40)} : {(8'h9e), (8'hb9)}) ? (((8'hbf) ? (7'h41) : (8'h9f)) ? {(8'hb0), (8'hbc)} : (~|(8'ha3))) : (((8'ha6) ? (8'ha1) : (8'had)) ? ((8'ha0) >> (8'h9e)) : (~^(8'hbc)))) ? (&(~&(&(8'hbc)))) : {((+(8'had)) ? ((8'ha5) ~^ (8'hba)) : {(8'h9f)})}) <<< (((((8'h9c) || (8'hb6)) + (~|(8'hb3))) == (|{(8'hb5), (8'hac)})) ? {(&((8'ha3) ? (8'hbe) : (8'hba))), {((8'hb1) ? (7'h40) : (8'hab))}} : {((+(8'hba)) ? {(8'hbf)} : ((8'ha3) ? (8'h9c) : (7'h44))), ((|(8'hb6)) ? (~|(8'hbc)) : (~^(8'hbc)))})), 
parameter param13 = ((!(~|param12)) && ((^{{(8'ha0), param12}}) && (^~param12))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire4;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire10;
  wire signed [(4'hf):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire4[(1'h1):(1'h0)];
  assign wire6 = $unsigned($unsigned(wire0));
  assign wire7 = $signed(((~&wire2[(4'h8):(4'h8)]) - (-(~|$unsigned(wire6)))));
  assign wire8 = wire1[(3'h4):(1'h0)];
  assign wire9 = {wire6[(4'hd):(1'h0)], wire0[(2'h3):(2'h2)]};
  assign wire10 = wire4;
  assign wire11 = {$unsigned($signed(wire9[(3'h5):(2'h3)])),
                      wire5[(2'h2):(2'h2)]};
endmodule
