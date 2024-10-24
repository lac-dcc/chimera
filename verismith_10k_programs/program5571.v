module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h33):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire8;
  wire signed [(2'h3):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = ($signed(wire1[(1'h1):(1'h0)]) ~^ $signed($signed({wire3[(1'h1):(1'h0)],
                     $unsigned(wire2)})));
  assign wire5 = wire0[(3'h4):(1'h0)];
  assign wire6 = (8'had);
  assign wire7 = {(wire3 << (wire0[(4'hb):(1'h1)] && $signed(wire5))), wire3};
  assign wire8 = wire6[(3'h4):(2'h2)];
endmodule
