module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (wire2[(4'ha):(1'h1)] != {wire3});
  assign wire5 = ($unsigned({{(wire1 ? wire0 : wire0), {(8'hbd)}}}) ?
                     (~|$unsigned(wire0[(1'h0):(1'h0)])) : (|$unsigned(((wire1 * wire2) ?
                         (&(8'ha4)) : $signed(wire1)))));
  assign wire6 = wire3;
  assign wire7 = $signed($unsigned($signed(((wire0 || wire4) ?
                     wire1 : (+(8'hb3))))));
endmodule
