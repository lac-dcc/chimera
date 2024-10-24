module top
#(parameter param13 = ((((|((8'h9d) & (7'h43))) ? ({(8'hba), (8'hae)} || ((8'ha2) ? (8'hab) : (8'h9e))) : (&((8'hb7) ^ (8'ha8)))) ? ((((8'hbc) * (8'h9f)) >> (8'h9e)) * ((-(8'hb7)) ? ((8'hb2) ? (8'hb8) : (8'h9c)) : ((8'ha8) ? (8'hbf) : (8'ha1)))) : ({(-(8'hab))} ? (7'h42) : ({(8'hb6), (8'ha5)} > {(8'hb0), (7'h40)}))) != ({(~^((8'hac) ? (8'hbe) : (8'had))), (8'h9e)} ? ((|((8'hbf) || (8'hac))) | (|(~^(8'hba)))) : (((^(8'haa)) ? ((8'hb5) ? (8'hb6) : (8'h9d)) : (&(7'h41))) ? (^~((8'h9c) ? (8'hbf) : (8'hb1))) : (((8'hae) && (8'ha6)) ? ((8'hac) - (8'had)) : ((7'h42) > (7'h40)))))), 
parameter param14 = {(param13 ? (~&((param13 * param13) || param13)) : (({param13, param13} ? {param13} : (param13 < param13)) ? param13 : (8'h9c))), (8'hbb)})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = $signed($unsigned(((wire3 <<< (~&wire0)) || wire4[(4'h8):(3'h5)])));
  assign wire6 = $signed(((&(!$signed(wire0))) ?
                     $unsigned($signed({wire3, wire3})) : {($unsigned(wire4) ?
                             wire0 : $signed(wire1))}));
  assign wire7 = wire3[(4'hc):(4'ha)];
  assign wire8 = (^$signed($signed(($signed(wire7) <= (wire1 >>> wire5)))));
  assign wire9 = wire1;
  assign wire10 = {$unsigned($signed(($unsigned((8'ha5)) ?
                          wire2[(3'h5):(2'h2)] : (wire8 ^ wire3)))),
                      ((((wire5 | wire1) ?
                          (~wire6) : $unsigned(wire9)) <= $unsigned((~wire2))) >= (!$signed((|wire2))))};
  assign wire11 = $unsigned({$unsigned({wire0[(4'h9):(2'h3)], (~|wire5)})});
  assign wire12 = (wire7[(4'he):(4'h9)] ?
                      wire9[(5'h11):(3'h5)] : ((8'hb3) >>> $signed($unsigned($unsigned((8'hbe))))));
endmodule
