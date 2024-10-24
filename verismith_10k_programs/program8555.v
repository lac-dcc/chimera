module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire0[(2'h3):(1'h1)];
  assign wire6 = (&(8'hba));
  assign wire7 = $unsigned((8'hbd));
  assign wire8 = wire0;
endmodule
