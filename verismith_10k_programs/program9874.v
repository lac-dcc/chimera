module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h2f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire4;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire9;
  wire [(4'hd):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  assign y = {wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = ($unsigned($unsigned(($unsigned(wire3) == (wire1 ?
                     wire2 : wire3)))) + $signed((+$unsigned($signed(wire1)))));
  assign wire6 = (({wire0[(2'h3):(2'h3)], {(wire2 ? wire1 : wire5)}} ?
                     $signed((~|{wire1})) : (^~(((8'hb6) ?
                         (7'h44) : wire0) - {wire5}))) < $unsigned($unsigned(({wire4,
                         wire0} ?
                     $unsigned(wire1) : wire4[(1'h1):(1'h0)]))));
  assign wire7 = {wire6[(4'hd):(4'hc)]};
  assign wire8 = $signed(((~&wire0[(2'h2):(1'h1)]) <= {(!((8'hae) ?
                         wire3 : wire6)),
                     {(wire3 ? wire5 : wire6)}}));
  assign wire9 = (|wire4);
endmodule
