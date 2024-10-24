module top
#(parameter param27 = (^~{((((8'hb8) && (8'hbc)) <<< (^~(8'hac))) >> (~|(8'ha9)))}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire26;
  wire signed [(2'h2):(1'h0)] wire25;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire23;
  assign y = {wire26, wire25, wire5, wire23, (1'h0)};
  assign wire5 = ($unsigned((wire4[(1'h0):(1'h0)] ~^ $unsigned((wire2 ?
                         wire3 : wire4)))) ?
                     (wire2[(5'h11):(2'h2)] ?
                         {wire3[(1'h0):(1'h0)]} : $unsigned(wire4[(4'h9):(3'h6)])) : ({(-((8'hb8) >> wire2))} ?
                         (({wire2} == $signed(wire4)) ?
                             ((-wire2) || (wire1 ?
                                 wire4 : wire4)) : $signed({wire3,
                                 wire3})) : $signed(wire4[(1'h0):(1'h0)])));
  module6 #() modinst24 (.y(wire23), .wire7(wire0), .clk(clk), .wire8(wire4), .wire11(wire2), .wire9(wire3), .wire10(wire1));
  assign wire25 = $signed(wire5[(3'h7):(3'h4)]);
  assign wire26 = (wire3 ?
                      (^~({$unsigned(wire2)} ?
                          ({wire0} == (!wire4)) : {$unsigned(wire25),
                              (wire2 ?
                                  (8'hae) : wire2)})) : $unsigned($unsigned(wire3)));
endmodule

module module6
#(parameter param22 = (((((~&(8'hbc)) ? (~(8'ha2)) : (&(8'h9d))) + (((8'ha6) ? (7'h40) : (8'hbb)) <<< {(7'h43)})) & (({(8'ha0)} ? (^~(8'ha0)) : (-(8'hae))) ~^ ((-(8'ha3)) ? {(8'ha4), (8'hba)} : ((7'h42) ? (8'hb8) : (8'hbb))))) >= ({({(8'h9f), (8'ha6)} ? (~(8'ha9)) : ((8'hbb) <= (8'hba)))} || (~^((^(8'hb9)) << (+(8'ha3)))))))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h71):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire11;
  input wire signed [(4'h9):(1'h0)] wire10;
  input wire [(4'hb):(1'h0)] wire9;
  input wire signed [(4'h8):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire21;
  wire signed [(4'he):(1'h0)] wire20;
  wire signed [(4'hb):(1'h0)] wire19;
  wire [(3'h6):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire17;
  wire signed [(3'h5):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire12;
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 (1'h0)};
  assign wire12 = wire10;
  assign wire13 = ($unsigned($signed(((wire10 ? (8'hab) : wire8) ?
                      (wire12 >= wire11) : $unsigned(wire8)))) < (~&wire12[(1'h1):(1'h1)]));
  assign wire14 = (((^~$unsigned(((8'ha2) ^ wire11))) + (wire11[(1'h1):(1'h0)] | wire10[(1'h1):(1'h1)])) ?
                      $signed({((wire8 - wire7) ? (8'hb9) : $signed(wire13)),
                          (-$signed(wire8))}) : $signed(wire7[(4'ha):(2'h3)]));
  assign wire15 = $signed(((wire8 ? (~$signed(wire9)) : (^(wire9 <<< wire9))) ?
                      $unsigned($signed((wire12 > wire8))) : wire9[(3'h6):(2'h2)]));
  assign wire16 = wire9;
  assign wire17 = $unsigned((!(+$signed((wire11 ? wire16 : (7'h43))))));
  assign wire18 = (wire13[(1'h1):(1'h1)] ?
                      $unsigned($unsigned($signed((wire13 * wire16)))) : ($signed(((wire12 ?
                              wire10 : wire17) ?
                          (8'hbe) : wire7[(3'h4):(3'h4)])) >>> wire11));
  assign wire19 = wire9[(4'h9):(3'h6)];
  assign wire20 = $signed(wire19);
  assign wire21 = (+wire13[(2'h2):(2'h2)]);
endmodule
