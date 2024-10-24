module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire2[(5'h10):(4'hf)];
  assign wire6 = $unsigned($signed((&wire5)));
  assign wire7 = $unsigned((8'had));
  assign wire8 = {$signed(wire0[(4'hb):(2'h3)]),
                     (wire6[(2'h3):(2'h3)] >>> ($unsigned((-(7'h40))) ?
                         (wire3[(4'h9):(4'h8)] ?
                             $signed(wire3) : (wire6 ?
                                 wire4 : wire2)) : wire2))};
  assign wire9 = $unsigned(wire1);
  assign wire10 = ((-(~|(-$signed(wire8)))) == {(wire0 ?
                          ((~wire3) ?
                              $signed((7'h44)) : (~^(8'h9d))) : {$unsigned(wire8),
                              (wire8 ^~ wire8)})});
endmodule
