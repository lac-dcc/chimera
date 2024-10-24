module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire4;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire2;
  assign wire5 = {(wire1[(2'h3):(2'h3)] ?
                         {(7'h42)} : ((~^wire1[(1'h1):(1'h1)]) != ((wire2 ?
                                 wire1 : (8'ha6)) ?
                             (wire1 ? wire2 : wire1) : $unsigned(wire0)))),
                     (^$signed($unsigned(((8'hbf) ? wire3 : wire3))))};
  assign wire6 = wire4[(4'hb):(4'ha)];
  assign wire7 = {wire6, (8'h9f)};
  assign wire8 = ((+$signed($signed((~^wire2)))) ?
                     ($signed(wire6) ?
                         {wire7,
                             (~(~|wire5))} : wire0[(2'h2):(2'h2)]) : (!wire7[(3'h4):(1'h1)]));
  assign wire9 = {$signed((({(7'h42),
                         wire0} <<< (~(8'hb2))) - $signed((^wire4)))),
                     (wire3[(2'h2):(1'h1)] ?
                         ((wire3[(1'h0):(1'h0)] ?
                             wire1[(2'h2):(2'h2)] : wire7) << wire8[(2'h3):(2'h3)]) : wire1[(4'h9):(3'h7)])};
  assign wire10 = {{$signed(((wire0 < (8'hb2)) ?
                              (8'haf) : (wire7 ? wire6 : wire1)))},
                      $unsigned($unsigned($unsigned(wire2)))};
endmodule
