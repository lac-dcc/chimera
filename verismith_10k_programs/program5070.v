module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h2d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $signed((wire4 ?
                     ($unsigned(wire0[(4'he):(3'h4)]) ?
                         ((wire1 ? wire1 : wire1) ?
                             $signed(wire1) : (wire4 ?
                                 wire1 : wire4)) : ($signed(wire2) << wire4[(3'h4):(2'h3)])) : $signed(((^~wire1) * wire2[(2'h3):(2'h2)]))));
  assign wire6 = $unsigned(wire4);
  assign wire7 = (&wire4);
  assign wire8 = $signed((wire7 <<< $signed($unsigned((8'ha3)))));
  assign wire9 = $unsigned({(+(|(~wire4))), wire4});
  assign wire10 = $unsigned(((($signed(wire8) ?
                              {wire8} : ((8'hbf) ? wire7 : wire2)) ?
                          ($unsigned(wire7) + (~wire5)) : {((8'hb0) ?
                                  (7'h44) : wire7),
                              (wire1 < wire6)}) ?
                      wire0[(3'h7):(3'h7)] : $unsigned($unsigned(wire7[(3'h4):(2'h3)]))));
endmodule
