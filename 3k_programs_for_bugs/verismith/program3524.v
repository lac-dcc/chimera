module top
#(parameter param12 = (((&(^{(8'hbf), (8'hb1)})) <= {(((8'hac) ? (8'ha1) : (8'h9d)) ? ((8'hbe) > (8'hb6)) : {(8'hae)})}) ? ((8'hba) >= (|(8'hae))) : (((|((7'h43) == (8'hb0))) ? (+(&(8'ha2))) : (((8'hb3) >> (8'hb4)) ? ((8'hbb) ? (8'hb6) : (7'h43)) : (-(8'h9c)))) ? ((((8'hbf) == (8'hb1)) || ((8'hb7) != (8'hb5))) <= (!((8'hbd) == (8'ha4)))) : {((~^(8'hba)) & ((8'hb7) ? (8'h9f) : (8'hab)))})), 
parameter param13 = (~&(|((8'hb5) * ((param12 ^~ param12) ? (param12 << param12) : ((8'hbe) ? param12 : param12))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire11;
  wire signed [(2'h3):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire4;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $signed($unsigned((wire0 ?
                     wire0[(3'h6):(2'h2)] : {(wire3 ? wire0 : (8'hb7)),
                         (8'hbd)})));
  assign wire5 = $signed((^(wire4[(1'h0):(1'h0)] == wire4)));
  assign wire6 = $unsigned((((8'ha8) ?
                     ($signed(wire3) ^~ $unsigned(wire0)) : (wire3[(5'h11):(4'hb)] ?
                         wire4 : ((8'hb2) << wire3))) ^ wire5));
  assign wire7 = (wire5 ?
                     ($unsigned($signed((wire2 ? (8'h9d) : (8'ha0)))) ?
                         wire2 : (~|wire3)) : $unsigned(wire4));
  assign wire8 = $unsigned($unsigned(wire3));
  assign wire9 = wire6[(4'h9):(2'h3)];
  assign wire10 = {(-(~|$signed({wire5}))), (~&wire1)};
  assign wire11 = (|($unsigned(wire8) ?
                      (wire0 != wire6[(3'h6):(3'h5)]) : {((+wire0) ?
                              wire6 : $signed(wire5)),
                          $signed($signed(wire7))}));
endmodule
