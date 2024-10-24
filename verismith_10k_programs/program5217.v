module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire22;
  wire signed [(5'h12):(1'h0)] wire21;
  wire signed [(3'h5):(1'h0)] wire20;
  wire signed [(4'hc):(1'h0)] wire19;
  wire signed [(3'h5):(1'h0)] wire17;
  assign y = {wire22, wire21, wire20, wire19, wire17, (1'h0)};
  module4 #() modinst18 (wire17, clk, wire3, wire1, wire0, wire2, (8'hb6));
  assign wire19 = {$signed($unsigned(((wire0 <<< wire2) <= wire1)))};
  assign wire20 = (+$signed(wire1[(4'hb):(3'h4)]));
  assign wire21 = $signed((~&$unsigned(wire20[(1'h1):(1'h0)])));
  assign wire22 = (!($signed((8'ha0)) >> wire20));
endmodule

module module4
#(parameter param15 = ((((&((8'had) ? (8'h9e) : (8'ha3))) & (((8'haf) << (8'ha2)) << (~|(7'h43)))) | ((~&(8'hb6)) - (^((8'hbb) ? (8'hb8) : (8'hb8))))) ? (-(^~((~^(7'h43)) >>> ((8'hb9) != (8'ha1))))) : {(!({(8'ha2)} || ((8'hbf) ? (8'had) : (8'hae)))), ((~|((8'ha9) ? (8'ha2) : (8'hb1))) ? (&(8'ha3)) : ((!(8'hab)) ? ((8'had) ? (8'h9d) : (8'hb3)) : ((8'hb8) ? (8'haf) : (8'hb4))))}), 
parameter param16 = (param15 ? (param15 + param15) : param15))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire9;
  input wire [(4'hc):(1'h0)] wire8;
  input wire [(3'h5):(1'h0)] wire7;
  input wire signed [(3'h4):(1'h0)] wire6;
  input wire [(4'hf):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire14;
  wire signed [(5'h14):(1'h0)] wire13;
  wire signed [(4'h9):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire10;
  assign y = {wire14, wire13, wire12, wire11, wire10, (1'h0)};
  assign wire10 = (8'ha2);
  assign wire11 = (((wire8 ?
                      $unsigned($unsigned(wire7)) : ($unsigned(wire9) ?
                          $unsigned(wire10) : ((8'hb6) ?
                              wire7 : (8'hba)))) >>> wire8) < wire8);
  assign wire12 = (~wire6);
  assign wire13 = (({(wire6 ? wire5[(4'hb):(1'h1)] : (^wire11)),
                          ((^wire7) ? wire12 : $unsigned(wire10))} ?
                      (wire9[(4'h8):(2'h2)] >>> $signed((wire6 | wire8))) : ($signed($unsigned(wire12)) ?
                          ($unsigned(wire8) ?
                              wire11 : (~wire6)) : (&(wire6 || wire8)))) != ((($unsigned((8'had)) >>> $signed(wire12)) >>> (+$unsigned(wire8))) | wire7));
  assign wire14 = wire10;
endmodule
