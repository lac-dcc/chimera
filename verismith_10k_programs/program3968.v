module top
#(parameter param12 = (((~&(&{(8'hbc)})) ^ ((((8'hb8) <<< (8'hb0)) ? ((7'h40) ? (8'h9e) : (8'ha7)) : ((8'h9f) ~^ (8'ha2))) ? {((8'hab) * (8'hb7)), {(8'hab), (8'hbc)}} : ((&(8'hbf)) && ((8'hb9) ^~ (8'hb2))))) ? (|((!(+(8'hb1))) && ((~&(8'ha3)) ? ((8'hb6) ? (8'h9f) : (8'hac)) : {(8'hbd), (8'ha3)}))) : ((((-(7'h43)) ? ((8'hb7) ? (8'h9e) : (8'hb8)) : ((8'h9f) <= (8'ha5))) && (^(8'hac))) * ((((7'h41) ? (8'ha6) : (8'hac)) && ((8'ha6) * (7'h44))) ? (^~((8'hba) ^ (8'hb0))) : ((-(8'hbb)) ? {(8'hab)} : ((8'ha3) ? (8'hb4) : (7'h42)))))), 
parameter param13 = (param12 ? ((|(param12 ? (!param12) : (param12 <<< param12))) ? (param12 <<< param12) : param12) : param12))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire4;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned(wire2);
  assign wire5 = wire3[(1'h0):(1'h0)];
  assign wire6 = (((wire5 <<< (7'h42)) <= $unsigned(($unsigned(wire5) ^~ (~wire2)))) > (wire2[(3'h4):(3'h4)] * {$signed(((8'hae) <<< wire3))}));
  assign wire7 = (wire6 ?
                     {wire2[(3'h5):(2'h3)],
                         ((wire3[(2'h3):(2'h3)] > $unsigned(wire3)) || $unsigned(wire4[(1'h0):(1'h0)]))} : wire4[(1'h0):(1'h0)]);
  assign wire8 = $signed((wire0[(4'hb):(4'hb)] ~^ ((&(wire7 ^ wire6)) ?
                     ((wire1 ~^ wire6) & wire7) : $unsigned($unsigned(wire3)))));
  assign wire9 = wire6[(4'ha):(4'h9)];
  assign wire10 = (~&$signed(((wire7[(3'h4):(2'h3)] ?
                      wire3[(1'h0):(1'h0)] : $signed(wire3)) <= ((wire5 ?
                      wire2 : (8'ha3)) <= (wire7 ? wire9 : wire9)))));
  assign wire11 = $signed(wire6);
endmodule
