module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h23):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (8'h9c);
  assign wire5 = wire0[(2'h2):(2'h2)];
  assign wire6 = wire1;
  assign wire7 = (^~{wire2});
endmodule
