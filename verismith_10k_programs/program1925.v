module top
#(parameter param12 = (^((8'ha0) | (((|(8'ha5)) + ((8'ha5) ? (8'hb1) : (8'hbf))) != (+(~(7'h40)))))), 
parameter param13 = (param12 < (((8'hac) < (param12 > (~&param12))) ? param12 : (!(+param12)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h2d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire11;
  wire signed [(2'h2):(1'h0)] wire10;
  wire signed [(3'h4):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire8;
  wire signed [(3'h5):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (&$signed(wire2[(1'h0):(1'h0)]));
  assign wire6 = ((($unsigned($signed(wire5)) && {wire1[(3'h6):(2'h2)],
                             $unsigned(wire5)}) ?
                         wire4 : $unsigned(($signed(wire3) ?
                             (wire3 ? (8'hae) : wire0) : $unsigned(wire3)))) ?
                     wire2 : (wire0[(2'h3):(1'h0)] ?
                         ((wire4[(5'h12):(5'h11)] ?
                                 (wire0 <<< wire1) : (wire0 >= wire2)) ?
                             $signed($signed((8'hac))) : wire1[(3'h4):(3'h4)]) : $signed(wire5)));
  assign wire7 = $unsigned(wire4[(5'h12):(1'h1)]);
  assign wire8 = $signed(($unsigned(wire6[(1'h0):(1'h0)]) ?
                     $signed(({(7'h40)} ?
                         $unsigned(wire2) : (&wire0))) : $signed((8'haa))));
  assign wire9 = (~|wire6[(1'h0):(1'h0)]);
  assign wire10 = $unsigned((((^~{wire9}) - wire5) ~^ wire4));
  assign wire11 = $unsigned(wire10);
endmodule
