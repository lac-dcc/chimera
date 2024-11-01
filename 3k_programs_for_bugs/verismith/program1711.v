module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (wire3 ?
                     (~&wire0) : ($signed(wire0[(3'h7):(2'h3)]) <= ((+(~(8'ha9))) ?
                         (~wire3) : wire2[(3'h7):(3'h7)])));
  assign wire5 = $signed($unsigned((8'hbe)));
  assign wire6 = ((^~(~(wire4[(1'h1):(1'h1)] ^~ (|wire3)))) * $unsigned($unsigned(wire2[(2'h3):(2'h3)])));
  assign wire7 = (-$unsigned(({(wire3 ? wire6 : wire2)} ?
                     (7'h40) : $unsigned(wire2))));
  assign wire8 = $unsigned(((+wire7[(2'h2):(1'h0)]) > $unsigned(wire5)));
endmodule
