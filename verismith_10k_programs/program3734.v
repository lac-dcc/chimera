module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (!($unsigned((~|wire2)) != (^~$unsigned($signed(wire3)))));
  assign wire5 = wire2[(3'h4):(2'h3)];
  assign wire6 = (|$signed($unsigned((^~wire0))));
  assign wire7 = wire2[(3'h4):(2'h3)];
  assign wire8 = $signed($signed($unsigned((8'hbc))));
  assign wire9 = {wire5};
  assign wire10 = $signed($signed($unsigned(wire5[(3'h7):(1'h0)])));
endmodule
