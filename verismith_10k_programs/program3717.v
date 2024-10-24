module top
#(parameter param16 = ((((|((8'hac) & (8'hbb))) ? (^~(-(8'hae))) : (((8'ha3) ? (8'ha7) : (8'hb7)) + ((7'h40) > (8'hbe)))) - {(((7'h43) ^ (8'ha9)) ? (~&(8'hb0)) : ((8'ha3) != (8'hb2))), (~^((8'hb0) >> (8'hbf)))}) ? (+((+((8'hbe) ? (7'h44) : (8'h9f))) == ({(8'hbc), (7'h40)} ? ((8'hbc) != (8'hbb)) : (+(8'hab))))) : (^~{(^~(+(8'hbb)))})), 
parameter param17 = ((~&((param16 <= param16) << {(param16 ? param16 : (8'hb3)), (^param16)})) == ((({(8'ha2), param16} ? (param16 ? param16 : param16) : (-param16)) >= param16) ^ (param16 ? (&(param16 << (8'hac))) : (~(8'hb7))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire14;
  wire signed [(3'h4):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire10;
  wire [(4'ha):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  assign y = {wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = $unsigned(($signed((|(~^wire0))) ?
                     $signed(wire1[(3'h4):(1'h1)]) : $signed({(wire0 ?
                             wire4 : (8'hae))})));
  assign wire6 = ($signed((-({wire0, wire1} && ((8'ha9) >= wire3)))) ?
                     {{wire5[(4'he):(4'hb)]}} : (~((+$signed((8'ha7))) ?
                         wire3[(1'h1):(1'h1)] : wire2[(3'h7):(3'h5)])));
  assign wire7 = ($unsigned((($unsigned(wire0) && wire1) ?
                     (~&$signed((7'h41))) : ((&wire0) ?
                         ((8'hac) ~^ wire5) : (wire5 * (8'hae))))) + $unsigned(wire0));
  assign wire8 = wire7;
  assign wire9 = $unsigned(((wire4 ?
                     wire7 : $unsigned(wire7[(1'h1):(1'h1)])) + $unsigned($signed(wire4[(2'h2):(2'h2)]))));
  assign wire10 = ((wire1 & ((~|$signed(wire2)) + wire9[(3'h7):(1'h0)])) == wire3[(4'h8):(3'h7)]);
  assign wire11 = $unsigned((wire4 >>> ($signed($signed((8'hbe))) ?
                      (wire8[(1'h1):(1'h0)] ?
                          wire6[(4'h8):(3'h6)] : wire9) : (wire4[(1'h0):(1'h0)] | (|wire8)))));
  assign wire12 = $signed(wire0);
  assign wire13 = (~|wire0);
  assign wire14 = $signed(wire10[(3'h6):(2'h3)]);
  assign wire15 = wire0;
endmodule
