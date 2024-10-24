module top
#(parameter param10 = (~(8'hb4)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire9;
  wire signed [(4'ha):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  assign y = {wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = ((~^$unsigned(((wire2 >= wire0) ?
                     (wire1 ? (7'h44) : wire2) : (-wire0)))) ^ (&wire1));
  assign wire6 = wire5;
  assign wire7 = $unsigned($unsigned($unsigned((wire3[(1'h0):(1'h0)] ?
                     $signed(wire1) : $signed(wire4)))));
  assign wire8 = (!((^((wire5 ? wire4 : wire4) ?
                     (wire6 >> (7'h42)) : wire7[(4'h8):(2'h3)])) + wire6[(2'h3):(1'h1)]));
  assign wire9 = $signed((8'ha8));
endmodule
