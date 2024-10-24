module top
#(parameter param10 = ((+({((8'ha1) != (8'h9e)), (~(8'ha9))} < ((8'hb1) ~^ (&(8'h9f))))) != {{({(8'hb1)} ? (+(8'hba)) : {(8'hbc), (8'hbc)})}}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h26):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire9;
  wire signed [(4'h8):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  assign y = {wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $signed(((|$signed((~^wire2))) & wire0));
  assign wire6 = (~|wire1[(2'h2):(1'h1)]);
  assign wire7 = $unsigned({(~^$signed($unsigned(wire6))), (~|(^(7'h41)))});
  assign wire8 = $unsigned(wire7[(1'h0):(1'h0)]);
  assign wire9 = wire0[(3'h6):(1'h0)];
endmodule
