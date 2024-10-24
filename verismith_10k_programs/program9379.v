module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire10;
  wire [(4'hd):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire4;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire3;
  assign wire5 = wire3;
  assign wire6 = (^~wire5[(2'h2):(1'h1)]);
  assign wire7 = wire2[(3'h7):(3'h6)];
  assign wire8 = $unsigned(((((wire2 ? wire3 : wire4) | $unsigned(wire1)) ?
                     (8'ha0) : $unsigned((|wire7))) > {$unsigned((&wire1))}));
  assign wire9 = (8'hba);
  assign wire10 = wire1[(1'h1):(1'h1)];
endmodule
