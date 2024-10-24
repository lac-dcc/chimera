module top
#(parameter param8 = (({{((8'hae) >> (8'ha6))}} || (!(!((8'h9f) ? (8'ha3) : (8'hb4))))) - (((((8'hac) ? (8'had) : (7'h41)) ? ((7'h42) & (8'hb6)) : ((8'hac) | (8'hb3))) ? (8'hb9) : (8'hbc)) ? (8'ha4) : (({(8'ha5), (8'hba)} + (|(8'h9d))) ? (+((7'h43) ? (8'hb9) : (8'ha5))) : {((8'h9d) ~^ (8'ha2)), (!(8'hbf))}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire1;
  assign wire5 = (wire1[(3'h7):(3'h4)] && $unsigned(((wire2 <<< (wire1 ?
                     (8'ha9) : wire4)) << wire2)));
  assign wire6 = $unsigned($unsigned(wire2[(1'h0):(1'h0)]));
  assign wire7 = (~|wire2[(2'h2):(1'h0)]);
endmodule
