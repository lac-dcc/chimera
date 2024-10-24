module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire12;
  wire [(5'h12):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire9;
  wire signed [(3'h5):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = wire2;
  assign wire6 = (&(!((~(wire5 << wire2)) & ((-wire1) ?
                     wire5[(2'h3):(2'h2)] : (8'haf)))));
  assign wire7 = (($signed(((wire2 & (8'ha2)) & (wire1 ?
                         wire4 : wire2))) - (|$unsigned((wire2 >>> wire2)))) ?
                     (~&wire3) : $unsigned(({(8'hb4)} < $signed(wire3))));
  assign wire8 = (&(({wire6, wire4} ?
                     {wire6[(2'h3):(2'h2)]} : {$unsigned(wire7),
                         $unsigned(wire4)}) || $signed((~^$signed(wire2)))));
  assign wire9 = wire1[(4'he):(4'hb)];
  assign wire10 = (wire9 && (~^wire2[(3'h7):(3'h6)]));
  assign wire11 = $signed((~&(((wire4 ? wire0 : wire7) ?
                      {wire6} : (wire9 ?
                          wire7 : wire3)) >= (+$signed(wire1)))));
  assign wire12 = (((({wire9, wire1} ? (wire10 != wire5) : $unsigned(wire11)) ?
                          (wire2 ?
                              wire0 : {wire1}) : wire6[(4'ha):(4'ha)]) ~^ $unsigned((|$unsigned(wire2)))) ?
                      wire5 : wire11[(1'h1):(1'h0)]);
  assign wire13 = wire11[(5'h11):(3'h4)];
endmodule
