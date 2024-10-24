module top
#(parameter param8 = {{(-{((8'hb8) ^ (7'h42))})}}, 
parameter param9 = {(param8 ? (param8 >= ((8'hb1) ^ param8)) : {(^~(param8 ? param8 : param8)), {{param8, (8'hb4)}}}), (param8 ? param8 : param8)})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h23):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire2;
  assign wire5 = (wire3[(1'h0):(1'h0)] ?
                     (wire4 < wire2[(2'h2):(2'h2)]) : (^~(8'ha3)));
  assign wire6 = $unsigned((^(wire4[(4'he):(2'h2)] ?
                     ((^~wire2) ? wire5 : $unsigned((8'hbd))) : ((wire3 ?
                             wire5 : wire4) ?
                         $signed((8'hbc)) : (8'hab)))));
  assign wire7 = (|((((!wire3) <= wire6) ?
                     (~|wire2[(1'h1):(1'h0)]) : (wire1[(1'h1):(1'h1)] ?
                         (wire6 < wire0) : wire5)) <<< wire1[(3'h4):(2'h3)]));
endmodule
