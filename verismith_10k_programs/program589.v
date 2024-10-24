module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h27):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $signed(wire2[(1'h1):(1'h1)]);
  assign wire5 = ($unsigned($unsigned(($signed((8'hb6)) ? wire3 : wire2))) ?
                     (&wire4[(2'h3):(2'h2)]) : $signed(((wire3 < (wire2 | wire4)) ?
                         (wire2[(1'h0):(1'h0)] * (^~wire0)) : (8'ha0))));
  assign wire6 = (^~(|(wire4[(1'h1):(1'h0)] >> (7'h42))));
  assign wire7 = (~|((^((wire6 * wire2) ~^ wire4)) ?
                     ({$signed(wire0), (wire6 <= (8'ha3))} ?
                         $unsigned((wire2 && (8'hb9))) : (~$signed(wire4))) : $unsigned((((8'h9f) ^ wire6) != {wire3,
                         (7'h40)}))));
endmodule
