module top
#(parameter param14 = ((((((8'ha2) || (8'ha1)) <<< (-(8'h9e))) ? (~|(^(8'ha8))) : (+((8'ha0) - (8'ha6)))) <= {(~|{(8'haa), (8'hb2)}), ({(8'hbc)} && ((7'h44) ^~ (8'haa)))}) ? (!{{((8'ha3) ? (8'ha7) : (7'h41))}, (|((8'haa) ? (8'hbf) : (8'ha0)))}) : (+((&(|(8'hb4))) ? (^~{(8'ha1), (8'ha7)}) : (((8'ha6) | (8'hb8)) | ((8'hbc) ? (8'had) : (8'hbe)))))), 
parameter param15 = ((~param14) ? param14 : ((((param14 ^ (8'hb7)) ? {param14} : (~^(8'hb6))) < (-(param14 | param14))) == ((8'ha5) && ((param14 > (8'hbe)) != (!param14))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h69):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire12;
  wire signed [(4'h9):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
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
  assign wire5 = $unsigned(wire3[(4'hb):(4'h8)]);
  assign wire6 = (~^wire1);
  assign wire7 = ((((^~(~&wire3)) >> $unsigned($signed(wire3))) ?
                     {$unsigned($unsigned(wire5)),
                         ({(8'h9f)} ?
                             (&wire1) : wire5)} : wire0[(2'h3):(1'h0)]) || (wire0[(1'h1):(1'h1)] ?
                     (((~&wire0) ?
                         wire1[(4'he):(2'h3)] : wire0) >= $unsigned({wire5})) : wire2));
  assign wire8 = ((8'ha1) ?
                     (wire4 ?
                         (~|wire7[(5'h14):(4'hf)]) : wire0[(2'h2):(1'h1)]) : $signed(($signed((~|wire0)) ?
                         {$signed(wire6), $unsigned(wire3)} : wire4)));
  assign wire9 = (^~wire5[(2'h3):(1'h1)]);
  assign wire10 = wire2;
  assign wire11 = (8'ha9);
  assign wire12 = $signed($unsigned((&{(^~wire11)})));
  assign wire13 = $unsigned($unsigned({($signed((7'h42)) ~^ wire3[(1'h1):(1'h0)]),
                      wire11[(4'h8):(3'h6)]}));
endmodule
