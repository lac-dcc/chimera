module top
#(parameter param9 = (^(8'ha6)), 
parameter param10 = (param9 ? (-param9) : param9))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = ({({wire2[(3'h4):(2'h3)],
                         (~|wire1)} == $signed(wire1[(2'h2):(1'h1)]))} ^~ {wire4[(4'ha):(4'h8)]});
  assign wire6 = $unsigned((~wire2));
  assign wire7 = ((&(8'hbe)) + (wire4[(4'ha):(2'h2)] < $signed(wire1)));
  assign wire8 = $unsigned($signed(wire0));
endmodule
