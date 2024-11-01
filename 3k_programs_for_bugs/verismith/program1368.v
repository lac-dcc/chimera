module top
#(parameter param24 = ((8'ha4) || {((~|((8'hbd) | (8'haa))) >> {(|(8'ha8))})}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire3;
  wire [(3'h6):(1'h0)] wire23;
  wire [(3'h5):(1'h0)] wire4;
  wire signed [(4'hd):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire21;
  assign y = {wire23, wire4, wire5, wire6, wire7, wire21, (1'h0)};
  assign wire4 = wire2[(2'h2):(1'h1)];
  assign wire5 = wire3;
  assign wire6 = wire1;
  assign wire7 = ((|(wire4 | wire4)) ?
                     ({$signed((wire2 ? wire6 : wire5)),
                         wire2} - wire6) : wire0[(3'h6):(3'h4)]);
  module8 #() modinst22 (.clk(clk), .wire12(wire5), .wire11(wire0), .wire9(wire3), .y(wire21), .wire10(wire2), .wire13(wire4));
  assign wire23 = $unsigned((wire5 ?
                      ($unsigned($signed(wire3)) <<< wire3[(3'h4):(1'h0)]) : ((wire4 ?
                          (wire1 ?
                              wire5 : wire4) : $signed(wire7)) ~^ ((!wire7) <<< (wire5 <= (8'ha1))))));
endmodule

module module8
#(parameter param20 = (((+(((8'ha7) ? (7'h41) : (8'hb9)) * (8'h9c))) * (&(((8'ha6) <= (7'h43)) ? ((7'h43) || (8'hb6)) : ((8'ha2) ~^ (8'hb4))))) < {(~|(((8'ha1) >>> (8'hbe)) ? {(8'ha9)} : (^~(8'ha2))))}))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire13;
  input wire signed [(4'hd):(1'h0)] wire12;
  input wire [(5'h13):(1'h0)] wire11;
  input wire [(5'h10):(1'h0)] wire10;
  input wire [(4'ha):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire18;
  wire [(3'h7):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire14;
  assign y = {wire19, wire18, wire17, wire16, wire15, wire14, (1'h0)};
  assign wire14 = {$unsigned(wire11[(2'h2):(1'h1)])};
  assign wire15 = ($signed(wire10[(4'hc):(3'h5)]) ?
                      ((|wire9[(3'h4):(3'h4)]) ?
                          (((-(8'hbb)) ?
                                  {wire9, wire11} : (wire14 >>> wire10)) ?
                              (wire14 ?
                                  (wire11 ? wire14 : wire12) : (wire10 ?
                                      wire14 : (7'h44))) : {$unsigned(wire9),
                                  (8'ha3)}) : (~^wire10[(5'h10):(3'h4)])) : (-(wire9 ?
                          $signed((^(7'h43))) : $unsigned({(8'hb7)}))));
  assign wire16 = $signed((wire13 ?
                      wire11[(1'h0):(1'h0)] : (($signed(wire14) >> $signed(wire10)) ?
                          wire11[(4'hb):(3'h5)] : $signed((^wire9)))));
  assign wire17 = ((^wire9) | $unsigned(wire16[(4'he):(4'he)]));
  assign wire18 = wire15[(4'hd):(3'h6)];
  assign wire19 = $signed(((+$signed(wire12)) ?
                      $signed(({wire13, (8'ha2)} ?
                          wire13[(2'h3):(2'h3)] : wire17[(3'h4):(3'h4)])) : $unsigned($unsigned((wire11 >= wire10)))));
endmodule
