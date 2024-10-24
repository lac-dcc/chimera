module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (|wire4[(2'h2):(2'h2)]);
  assign wire6 = wire2;
  assign wire7 = $unsigned(($signed($signed((|wire1))) ?
                     ((~&(wire5 ? wire6 : wire2)) ?
                         wire2 : (~(wire0 ?
                             wire2 : wire0))) : ((-(&wire3)) > wire0)));
  assign wire8 = {$signed((&wire6[(1'h0):(1'h0)])), wire4[(1'h1):(1'h1)]};
  assign wire9 = $unsigned($unsigned({(^~wire2[(1'h0):(1'h0)])}));
  assign wire10 = wire4;
endmodule
