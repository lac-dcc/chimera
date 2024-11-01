module top
#(parameter param11 = (~|(({(-(8'hac)), {(8'ha3), (8'had)}} ? ((8'ha4) && (-(8'ha5))) : (&((8'hb9) ? (8'ha3) : (8'hac)))) > {(~&{(8'ha8), (8'hb4)})})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire10;
  wire signed [(3'h4):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  wire [(4'h8):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire4;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire1[(4'hb):(2'h2)];
  assign wire5 = wire0[(4'h8):(3'h6)];
  assign wire6 = wire1[(3'h7):(1'h0)];
  assign wire7 = $unsigned({wire1[(4'hb):(4'h9)],
                     (((8'hae) <= $signed(wire5)) ?
                         (((8'hbf) && wire4) != ((7'h43) ?
                             (8'haa) : (8'ha3))) : $unsigned((wire2 ?
                             (8'hb7) : wire1)))});
  assign wire8 = (wire7 * wire6[(1'h1):(1'h1)]);
  assign wire9 = {(~(-{$signed(wire3), (wire5 ? wire2 : (8'h9d))})),
                     $unsigned($unsigned($signed(wire0)))};
  assign wire10 = {(!(7'h41)),
                      $signed(($unsigned(wire5) ?
                          (~|$unsigned((8'ha2))) : ({wire4} ?
                              (wire4 ? wire9 : wire4) : $signed(wire4))))};
endmodule
