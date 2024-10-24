module top
#(parameter param8 = (-(^{(((8'hb7) && (8'hab)) ? ((8'hbe) ? (8'ha6) : (8'ha9)) : {(8'ha3), (8'ha3)})})), 
parameter param9 = (param8 ? (7'h42) : (^~param8)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h23):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = ($unsigned((((^~wire3) ?
                         (wire0 ?
                             wire2 : wire2) : $signed(wire3)) ~^ {$unsigned((8'hbe))})) ?
                     ((&($unsigned(wire0) | $unsigned(wire0))) ?
                         wire0[(2'h2):(1'h1)] : wire3) : $unsigned(wire3));
  assign wire5 = (|(wire2[(3'h5):(1'h0)] <<< wire3));
  assign wire6 = wire4[(2'h2):(1'h1)];
  assign wire7 = $signed($signed(wire2));
endmodule
