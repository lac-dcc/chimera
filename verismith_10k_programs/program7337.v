module top
#(parameter param14 = (-(((8'ha3) < {{(8'hba), (8'hb0)}, {(8'hb5)}}) ^ ({(^~(8'hb4)), ((8'ha7) ~^ (8'hb2))} && (((8'ha7) ? (8'haa) : (8'hb2)) ? (-(8'ha4)) : ((8'ha5) ^ (8'hbd)))))), 
parameter param15 = ((^~(((param14 ? param14 : param14) ? (param14 ? (8'ha4) : param14) : (param14 ? param14 : param14)) ? param14 : ((param14 ? param14 : param14) ? (param14 * param14) : ((8'hb1) & param14)))) & param14))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire13;
  wire [(4'h9):(1'h0)] wire12;
  wire [(3'h6):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire10;
  wire [(2'h3):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire5;
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = ((((wire3[(4'h8):(3'h5)] ?
                             (wire2 <<< wire1) : wire3) <<< wire1) ?
                         wire2[(4'hc):(2'h2)] : $unsigned(wire0)) ?
                     $unsigned(((wire0 ?
                             $signed(wire0) : wire3[(4'hd):(3'h6)]) ?
                         $unsigned({wire3,
                             (8'hb6)}) : $unsigned(wire2))) : {$unsigned(((wire2 != (8'hb6)) < {wire0}))});
  assign wire6 = (wire1 ? wire4 : wire5);
  assign wire7 = wire2;
  assign wire8 = wire4;
  assign wire9 = wire8;
  assign wire10 = (-(8'hbb));
  assign wire11 = $unsigned(wire4[(3'h5):(2'h3)]);
  assign wire12 = wire6[(2'h3):(2'h2)];
  assign wire13 = wire3;
endmodule
