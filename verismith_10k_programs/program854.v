module top
#(parameter param14 = (^(8'ha5)), 
parameter param15 = (~(8'hae)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire13;
  wire [(4'ha):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
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
  assign wire5 = $unsigned($unsigned($unsigned(wire4[(1'h1):(1'h1)])));
  assign wire6 = wire3[(4'he):(3'h6)];
  assign wire7 = $signed(wire0[(1'h0):(1'h0)]);
  assign wire8 = $signed(wire2);
  assign wire9 = (-(!$unsigned({(wire2 & wire1), wire1[(4'hb):(2'h2)]})));
  assign wire10 = ((^~wire2[(5'h12):(2'h2)]) ? wire2[(4'he):(3'h5)] : (8'hb0));
  assign wire11 = wire1;
  assign wire12 = $unsigned($unsigned(wire9));
  assign wire13 = ((^$unsigned((wire10 ^ {wire0,
                      wire4}))) && $unsigned(((wire5[(4'hb):(4'ha)] ?
                      $unsigned(wire10) : wire10) ^ (((7'h42) << wire11) << wire11))));
endmodule
