module top
#(parameter param8 = ((^~{(((8'hae) & (8'ha4)) ? ((7'h42) ? (8'ha3) : (7'h43)) : ((8'hac) ? (8'haa) : (8'had)))}) ? ((&(((8'h9e) ? (8'hb7) : (8'hac)) ^~ (!(8'hb5)))) ^ {{(~|(8'hb4))}}) : ((~((~^(8'hba)) ? (-(8'ha6)) : {(8'had)})) & (~(~((8'hbe) ? (8'hb2) : (8'ha1)))))), 
parameter param9 = ((param8 ? param8 : param8) + param8))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (((8'hbf) ?
                         ((~&wire2) ?
                             (~^(wire3 | wire2)) : {wire1}) : (~&wire0[(3'h5):(2'h3)])) ?
                     (($signed($unsigned((8'ha9))) != wire3[(3'h5):(1'h1)]) ?
                         ((8'hac) < (wire2[(1'h1):(1'h1)] ?
                             (^~wire3) : $signed(wire1))) : (wire0[(2'h2):(2'h2)] && $signed($signed(wire1)))) : (((~&wire0[(3'h5):(3'h5)]) ?
                         wire2[(1'h1):(1'h1)] : $unsigned(wire1[(3'h5):(1'h0)])) & wire3));
  assign wire5 = (wire2 ?
                     ($signed({{(8'haa),
                             wire1}}) ^~ (-$unsigned((~wire1)))) : wire0[(3'h6):(3'h4)]);
  assign wire6 = $unsigned(wire0[(3'h6):(1'h1)]);
  assign wire7 = wire0[(3'h5):(1'h1)];
endmodule
