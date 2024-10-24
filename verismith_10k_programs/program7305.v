module top
#(parameter param14 = ((~|(!((^~(8'h9d)) ? {(8'h9f), (8'hbe)} : (~|(8'hb2))))) ? ((^~(((8'hbd) ? (7'h42) : (8'had)) ? ((8'ha5) ? (8'haf) : (8'hb6)) : {(8'hb3), (8'hb1)})) ? (&(8'haf)) : (!((~^(8'hb9)) ? ((8'had) - (7'h43)) : {(8'hb3)}))) : ((!((~&(7'h43)) ? ((8'hae) + (8'ha0)) : ((8'hb9) ? (8'ha7) : (8'had)))) ? {(((8'ha4) ? (8'ha9) : (8'hb7)) | ((7'h44) ? (8'ha2) : (8'hbc))), (((8'ha1) ^~ (8'hb0)) ? ((8'hb5) ? (7'h42) : (8'hae)) : {(7'h42), (8'had)})} : ((^~((8'hb3) + (8'hbc))) >= {((8'hb6) * (8'hab))}))), 
parameter param15 = ((&param14) + (~^(^((param14 ? param14 : param14) * (param14 ? param14 : param14))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire11;
  wire [(4'hb):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = (({(&wire4), ((~^wire0) ^~ $signed((7'h40)))} ?
                     (((7'h44) != wire3) ?
                         ((|wire2) ?
                             wire2[(4'hd):(2'h3)] : wire2[(5'h11):(5'h11)]) : wire4[(2'h3):(1'h0)]) : wire3[(3'h7):(1'h0)]) + $signed(wire4));
  assign wire6 = wire5;
  assign wire7 = {{($signed($signed(wire4)) >>> wire5[(2'h2):(1'h1)]),
                         ({((8'hac) ? wire4 : wire1)} ?
                             $unsigned($signed(wire4)) : $unsigned((wire2 >= wire3)))}};
  assign wire8 = wire5;
  assign wire9 = (8'ha3);
  assign wire10 = (({$unsigned((wire4 ~^ wire8))} >>> wire7[(4'ha):(2'h3)]) ?
                      $unsigned(wire3[(1'h1):(1'h1)]) : wire8[(3'h4):(2'h2)]);
  assign wire11 = ((wire8[(3'h6):(3'h5)] ?
                          (~^wire6[(1'h1):(1'h1)]) : wire6[(2'h3):(2'h2)]) ?
                      wire7 : $signed({((wire6 >> (8'hb1)) + $signed((8'hb8))),
                          wire3[(2'h3):(2'h2)]}));
  assign wire12 = wire8;
  assign wire13 = $signed((8'ha3));
endmodule
