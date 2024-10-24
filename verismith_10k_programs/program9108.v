module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire0;
  assign wire5 = wire3[(4'h8):(3'h7)];
  assign wire6 = $signed(((!wire3[(4'hc):(4'hc)]) ~^ wire1));
  assign wire7 = (((~^($signed(wire4) ?
                         (&wire6) : $unsigned(wire5))) < {(^~{wire3})}) ?
                     wire3[(3'h4):(3'h4)] : wire0);
endmodule
