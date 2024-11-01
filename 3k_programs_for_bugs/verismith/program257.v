module top
#(parameter param22 = {(|({(8'hab)} ? (((8'ha9) & (8'ha4)) >> {(8'had), (8'hb8)}) : ((~(7'h43)) ? {(8'hac), (8'h9d)} : ((8'hbf) & (8'hbf))))), {(({(8'hb4)} ? ((7'h40) >= (8'hbe)) : (8'hb5)) ? (|((8'ha6) ^ (8'h9e))) : (((8'haa) >> (8'hb5)) << (8'hb5)))}})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h26):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire21;
  wire signed [(3'h6):(1'h0)] wire20;
  wire signed [(4'h8):(1'h0)] wire19;
  wire [(2'h3):(1'h0)] wire17;
  assign y = {wire21, wire20, wire19, wire17, (1'h0)};
  module5 #() modinst18 (.wire8(wire1), .clk(clk), .wire10(wire3), .wire6(wire2), .wire9(wire4), .y(wire17), .wire7(wire0));
  assign wire19 = (~&($unsigned($unsigned({wire3,
                      wire17})) || ($signed($unsigned(wire2)) ?
                      wire2[(4'he):(4'ha)] : {(wire17 > wire3), wire4})));
  assign wire20 = (~$unsigned(wire4[(4'h8):(3'h5)]));
  assign wire21 = {(~|((wire4 <<< wire17) < (wire17 ?
                          {wire17} : $unsigned(wire1))))};
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire10;
  input wire signed [(4'hc):(1'h0)] wire9;
  input wire signed [(4'he):(1'h0)] wire8;
  input wire signed [(2'h3):(1'h0)] wire7;
  input wire signed [(4'hf):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire16;
  wire signed [(2'h2):(1'h0)] wire15;
  wire signed [(5'h15):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire13;
  wire [(2'h3):(1'h0)] wire12;
  wire [(3'h5):(1'h0)] wire11;
  assign y = {wire16, wire15, wire14, wire13, wire12, wire11, (1'h0)};
  assign wire11 = {(wire8 ^ $signed(wire8[(2'h3):(2'h2)])),
                      wire8[(4'hd):(3'h7)]};
  assign wire12 = wire8[(4'h9):(3'h7)];
  assign wire13 = $unsigned({{((wire12 ? wire7 : wire8) ?
                              wire9 : wire10[(5'h11):(3'h7)]),
                          $unsigned(wire11)},
                      $signed(((wire8 ? wire7 : wire10) ?
                          (wire7 ? wire10 : wire12) : $signed(wire10)))});
  assign wire14 = wire8;
  assign wire15 = (~|(8'hb5));
  assign wire16 = (~|wire6);
endmodule
