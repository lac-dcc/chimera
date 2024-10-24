module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire10;
  wire signed [(3'h7):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $signed(wire0);
  assign wire6 = {wire3[(4'hc):(2'h2)]};
  assign wire7 = {(wire3[(3'h7):(3'h7)] ?
                         (~&wire5) : $signed(wire3[(2'h2):(1'h0)]))};
  assign wire8 = $signed($signed(wire2[(3'h5):(3'h5)]));
  assign wire9 = (^~$unsigned($unsigned((~^(wire5 ^~ wire6)))));
  assign wire10 = ($signed((((&wire1) ?
                      (wire4 ? wire7 : (8'h9e)) : wire2) * $signed({wire0,
                      wire6}))) ^~ (wire0[(1'h1):(1'h1)] >>> (~|wire2[(1'h0):(1'h0)])));
  assign wire11 = ((!$unsigned(($signed((8'hbd)) ?
                          ((8'hb0) ? (8'hb3) : wire9) : $unsigned(wire8)))) ?
                      (~|wire2[(4'h9):(4'h9)]) : $signed(wire0[(2'h3):(1'h1)]));
endmodule
