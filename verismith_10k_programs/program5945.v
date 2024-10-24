module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire16;
  wire [(3'h5):(1'h0)] wire15;
  wire [(4'he):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  assign y = {wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = (8'h9d);
  assign wire6 = ($unsigned($signed(wire4[(2'h2):(1'h1)])) ?
                     (~$unsigned($signed($signed(wire0)))) : $signed($unsigned((8'h9d))));
  assign wire7 = wire6;
  assign wire8 = (wire7 >>> $signed(((wire5[(3'h6):(2'h3)] ?
                         {(8'ha2)} : wire2[(3'h5):(2'h3)]) ?
                     (wire0[(4'ha):(3'h7)] ?
                         ((8'ha4) + (8'hb8)) : wire5[(3'h7):(3'h4)]) : $signed(wire7[(1'h0):(1'h0)]))));
  assign wire9 = (wire3 ? $unsigned((8'ha1)) : (&wire5));
  assign wire10 = (-(wire6 * (|({wire4} * (wire6 ? wire7 : wire6)))));
  assign wire11 = (~|(~|$unsigned(wire2[(2'h3):(2'h3)])));
  assign wire12 = ($unsigned(wire9) & $signed((~^$signed(wire9))));
  assign wire13 = {((~|wire6) || ($signed(wire12) ? (+(8'hb9)) : (~|wire7)))};
  assign wire14 = ((($signed($unsigned((8'ha9))) ?
                          wire8 : wire8) < wire13[(3'h7):(1'h1)]) ?
                      {(wire2 + wire5),
                          (wire3[(3'h4):(2'h2)] ?
                              wire12[(3'h6):(2'h2)] : $signed(wire10))} : (8'hb6));
  assign wire15 = $unsigned(((((|wire11) == wire13) ?
                          ($signed(wire12) ?
                              (+wire3) : wire11) : ($signed(wire7) ?
                              (wire5 ?
                                  (8'h9f) : (8'h9f)) : (wire10 | (8'ha8)))) ?
                      wire9[(5'h12):(2'h2)] : $unsigned($signed($unsigned(wire8)))));
  assign wire16 = $unsigned($signed((~&(wire1 ?
                      $unsigned((8'haa)) : wire8[(5'h14):(4'hd)]))));
endmodule
