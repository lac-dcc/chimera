module top
#(parameter param11 = (~&(((((8'hb3) && (8'ha6)) ? ((8'hb0) ? (7'h41) : (7'h40)) : ((8'hb6) ? (7'h43) : (8'h9f))) ? (&{(8'hb7)}) : (~&((8'hb7) < (8'had)))) ? {(((8'hae) >> (7'h43)) ? {(7'h40), (7'h40)} : ((8'hb9) ? (7'h43) : (8'hbd)))} : ((~|((8'hbd) && (7'h42))) ~^ (^((8'ha3) ? (8'hb8) : (8'hb5)))))), 
parameter param12 = ((&{param11, param11}) > (param11 ? (|{(^param11)}) : (({param11, param11} ? (param11 > param11) : (^~(8'ha1))) ? ((param11 & param11) ? (^~(8'hb7)) : ((8'ha4) >> param11)) : (param11 ? (param11 * param11) : (param11 ? param11 : param11))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = ((wire2[(1'h1):(1'h1)] ?
                     ((wire3 ? {wire1} : (wire4 ^ wire2)) ?
                         ((~|wire2) - wire2[(3'h4):(2'h2)]) : $signed((^~wire2))) : $unsigned($signed((!wire4)))) ^ {wire2,
                     (($unsigned(wire1) ^ (&wire0)) ?
                         {(wire1 ? wire1 : wire3),
                             $signed(wire1)} : $unsigned((wire1 ^~ wire0)))});
  assign wire6 = (&wire4[(4'h8):(3'h5)]);
  assign wire7 = (~&wire0);
  assign wire8 = (~wire1[(3'h5):(2'h2)]);
  assign wire9 = wire8;
  assign wire10 = $signed(((^wire3) ?
                      wire0[(2'h2):(1'h1)] : (wire0[(3'h4):(3'h4)] ?
                          $signed(wire3[(4'ha):(3'h5)]) : ((|wire9) ?
                              (-wire9) : wire3[(3'h5):(2'h2)]))));
endmodule
