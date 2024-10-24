module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire10;
  wire [(4'ha):(1'h0)] wire9;
  wire [(4'hd):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (wire2 >> $signed($signed((wire1 ~^ $signed(wire1)))));
  assign wire5 = ($unsigned(wire4) + (~&{$unsigned((wire4 ? wire0 : wire4)),
                     $signed(wire2[(1'h1):(1'h1)])}));
  assign wire6 = $signed(wire2[(1'h0):(1'h0)]);
  assign wire7 = $unsigned(wire5);
  assign wire8 = wire3;
  assign wire9 = (~&wire2);
  assign wire10 = wire3;
endmodule
