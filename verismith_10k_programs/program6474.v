module top
#(parameter param9 = (~&{{(((8'hbc) > (8'ha2)) > (-(8'ha3))), (~|((8'hb8) * (8'hb6)))}}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (wire1[(4'ha):(3'h6)] ?
                     wire1[(3'h7):(2'h3)] : {(+(((8'hbf) ?
                             (8'hb8) : wire2) - $signed(wire1)))});
  assign wire6 = (wire1 ?
                     $unsigned((~^$unsigned($signed(wire2)))) : (({$signed(wire2)} ?
                         {(wire1 ? wire0 : wire5),
                             $signed(wire4)} : wire5[(1'h0):(1'h0)]) | (~&wire3)));
  assign wire7 = (~&wire5);
  assign wire8 = $unsigned($signed({$unsigned($signed(wire7)),
                     $unsigned($unsigned(wire4))}));
endmodule
