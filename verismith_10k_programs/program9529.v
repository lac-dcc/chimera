module top
#(parameter param8 = ((((((8'ha8) ? (8'ha3) : (8'ha3)) ? ((8'hbd) & (8'hab)) : {(8'hac)}) + (~((8'ha8) > (8'hb1)))) ^ {((-(8'hbc)) == (|(8'hbe))), {((8'hb6) >> (7'h44))}}) != (!((~|((8'h9e) ? (8'h9e) : (8'hb4))) > ({(8'hb7)} ? ((8'h9d) <<< (8'hb1)) : ((7'h41) || (8'hba)))))), 
parameter param9 = (~|(^(((~^(8'hb5)) ? (param8 > param8) : (-param8)) >> ((!param8) ? (&param8) : {param8, (7'h44)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h24):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire3[(4'h8):(1'h0)];
  assign wire5 = (wire0 && $signed((~{{wire2, wire2}})));
  assign wire6 = $unsigned(wire0[(3'h5):(2'h2)]);
  assign wire7 = (wire0[(2'h2):(2'h2)] ?
                     $signed(($signed(wire1) << wire3[(1'h1):(1'h0)])) : (wire5 == $signed((wire4 - (wire6 <<< wire3)))));
endmodule
