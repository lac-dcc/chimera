module top
#(parameter param16 = (^(^~(-((~(8'hb3)) ? ((8'haf) <= (8'hbe)) : {(7'h40), (8'hb3)})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire11;
  wire [(3'h6):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
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
                 (1'h0)};
  assign wire5 = wire1[(4'hc):(4'h9)];
  assign wire6 = wire4[(5'h10):(4'h9)];
  assign wire7 = wire0[(4'hc):(4'hc)];
  assign wire8 = (wire4[(4'he):(4'h9)] <= $signed((($unsigned(wire0) & $signed(wire0)) ?
                     $unsigned($unsigned(wire2)) : ($unsigned(wire2) <= wire4))));
  assign wire9 = {wire3[(3'h4):(1'h1)]};
  assign wire10 = (wire2[(2'h2):(1'h1)] ?
                      wire6[(2'h2):(2'h2)] : ($unsigned($signed($signed(wire8))) ~^ wire4[(3'h5):(2'h2)]));
  assign wire11 = ((((8'haa) | $unsigned((wire1 || wire9))) < wire0[(4'hc):(4'h8)]) ?
                      $unsigned(wire9) : ({wire5[(3'h5):(3'h4)]} ?
                          ($unsigned(wire10[(2'h3):(2'h3)]) ?
                              $signed(wire0[(3'h7):(3'h4)]) : $signed($signed(wire8))) : wire2));
  assign wire12 = wire9;
  assign wire13 = wire11;
  assign wire14 = wire7;
  assign wire15 = wire3[(1'h0):(1'h0)];
endmodule
