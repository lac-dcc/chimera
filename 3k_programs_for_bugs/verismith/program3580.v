module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire3;
  assign wire5 = ($unsigned($signed((&(!wire2)))) ?
                     ($signed((~&wire3[(4'h8):(3'h7)])) >> ((wire3 ?
                         wire4[(1'h0):(1'h0)] : {wire4}) >>> {(8'hae),
                         ((8'hbe) ?
                             wire2 : wire0)})) : $unsigned(((^~(^~wire3)) << $unsigned((~^wire0)))));
  assign wire6 = (+wire3);
  assign wire7 = (wire0 ? wire3 : $unsigned(wire4));
endmodule
