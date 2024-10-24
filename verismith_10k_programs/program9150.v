module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h2f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire4;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  assign y = {wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire4[(1'h0):(1'h0)];
  assign wire6 = (wire5[(2'h2):(2'h2)] ?
                     ({wire5[(1'h1):(1'h0)]} | ($unsigned((wire4 && wire5)) ~^ (wire0[(2'h3):(1'h0)] ?
                         wire0[(2'h3):(1'h1)] : (wire5 ?
                             wire1 : (8'hb5))))) : (~wire3));
  assign wire7 = (wire1 == (-wire0[(4'h8):(2'h3)]));
  assign wire8 = wire6[(3'h6):(3'h4)];
  assign wire9 = wire6;
endmodule
