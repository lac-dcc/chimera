module top
#(parameter param14 = ((+(&{((8'hb2) <<< (8'hbc))})) ? (8'ha1) : (8'h9f)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire8;
  wire signed [(4'h8):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
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
  assign wire5 = wire4[(5'h15):(4'h8)];
  assign wire6 = $signed($unsigned((8'hb5)));
  assign wire7 = $signed(wire4[(5'h10):(3'h7)]);
  assign wire8 = wire7[(2'h2):(1'h1)];
  assign wire9 = wire0[(3'h7):(2'h2)];
  assign wire10 = wire2;
  assign wire11 = ((^~$unsigned($signed((^~wire3)))) ?
                      ((($signed(wire9) || (wire10 * wire8)) ?
                          $signed((wire7 * wire10)) : wire3[(2'h3):(2'h3)]) || $unsigned($signed((+wire2)))) : $signed(((wire0[(1'h1):(1'h1)] >>> wire4) >> {(wire7 ~^ wire7),
                          (wire4 + wire3)})));
  assign wire12 = {wire10};
  assign wire13 = $unsigned(wire7);
endmodule
