module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire15;
  wire signed [(3'h7):(1'h0)] wire14;
  wire [(4'hc):(1'h0)] wire13;
  wire signed [(4'hd):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire4;
  assign y = {wire15,
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
                 wire4,
                 (1'h0)};
  assign wire4 = $unsigned((8'h9c));
  assign wire5 = ($unsigned($signed((8'hbc))) <= (8'hb4));
  assign wire6 = wire4;
  assign wire7 = wire1;
  assign wire8 = {wire6[(4'ha):(2'h3)],
                     ({wire4} >= ((8'ha9) ?
                         ($signed(wire2) ? wire0 : ((8'ha0) + wire6)) : {wire4,
                             wire5[(1'h0):(1'h0)]}))};
  assign wire9 = $signed(wire8);
  assign wire10 = wire0;
  assign wire11 = wire9;
  assign wire12 = wire4;
  assign wire13 = $unsigned({wire0[(4'hd):(4'h9)]});
  assign wire14 = (8'ha3);
  assign wire15 = $signed((^wire8[(1'h1):(1'h1)]));
endmodule
