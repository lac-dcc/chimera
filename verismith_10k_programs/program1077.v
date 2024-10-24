module top
#(parameter param11 = ((|{((~^(8'haf)) < ((7'h40) ? (7'h43) : (7'h42)))}) ^~ (^(({(8'had)} & ((8'h9c) >> (8'hab))) - (((8'ha7) ^ (8'hae)) ? ((8'h9f) ? (8'ha5) : (8'h9f)) : ((8'ha2) ~^ (8'hbe)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire8;
  wire signed [(2'h3):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $unsigned(wire2[(3'h4):(2'h2)]);
  assign wire6 = ((+{(wire4 ? wire0[(4'h9):(2'h2)] : wire2[(3'h6):(3'h6)])}) ?
                     wire3[(1'h1):(1'h1)] : wire2);
  assign wire7 = {$unsigned($signed(wire2))};
  assign wire8 = ((({$signed(wire3),
                     (-wire2)} <<< (!((8'hb5) << (8'haf)))) ^~ wire5[(1'h0):(1'h0)]) > $signed($signed(wire5)));
  assign wire9 = {wire1[(4'h8):(3'h5)],
                     $unsigned($signed((-$unsigned(wire4))))};
  assign wire10 = $signed(wire8);
endmodule
