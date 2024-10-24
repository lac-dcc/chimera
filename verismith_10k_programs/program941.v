module top
#(parameter param11 = ((({(7'h42), ((8'ha6) ? (8'ha0) : (8'ha3))} ? ((~^(8'hbc)) ? ((8'h9e) > (8'h9e)) : ((8'ha7) >>> (8'h9e))) : (((8'ha6) ? (8'hb6) : (8'ha2)) ? ((8'hb4) ? (8'ha6) : (7'h43)) : (~|(8'ha2)))) ? (~|((8'ha1) ? ((7'h41) ? (8'hae) : (8'hb6)) : ((8'ha8) ? (7'h43) : (8'ha4)))) : (((8'hb8) ? ((8'hb5) ? (7'h43) : (8'hb4)) : ((8'h9f) && (8'ha4))) ? (+((8'h9e) ? (7'h41) : (7'h42))) : (8'hb7))) ? {((((8'ha3) ? (8'ha4) : (8'ha1)) ^~ ((8'ha9) << (7'h41))) ~^ (((8'ha8) ? (8'hbc) : (7'h41)) ? ((8'hb0) ? (8'hbf) : (8'h9d)) : (|(8'hb5))))} : (^((((8'haf) ? (8'hb7) : (8'ha1)) > {(8'ha2)}) ? ({(7'h41), (8'hb2)} ? ((8'h9f) && (8'hb0)) : ((8'hb0) - (8'ha5))) : (((8'hbf) ^ (8'ha7)) ? {(8'hba)} : {(8'hb4)})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire10;
  wire [(4'hd):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire5;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = ($signed(($signed({(8'hb4),
                     wire0}) > wire4[(4'h8):(3'h7)])) | $signed($signed((wire4[(4'hb):(3'h4)] < wire1))));
  assign wire6 = (7'h41);
  assign wire7 = wire5[(3'h5):(3'h4)];
  assign wire8 = wire3[(3'h5):(2'h3)];
  assign wire9 = wire7[(1'h1):(1'h1)];
  assign wire10 = $signed($unsigned(wire1[(1'h1):(1'h1)]));
endmodule
