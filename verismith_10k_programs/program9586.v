module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (&(-((wire0[(3'h6):(3'h4)] << (wire1 <<< wire0)) ?
                     $unsigned(wire2[(3'h6):(1'h0)]) : (|(wire4 ?
                         wire2 : wire4)))));
  assign wire6 = (^~{wire5});
  assign wire7 = {$unsigned(($unsigned($unsigned(wire0)) ?
                         $unsigned($unsigned(wire5)) : {(wire5 ? wire1 : wire5),
                             (8'hbf)})),
                     ((~&($signed(wire2) ? wire3[(4'he):(1'h1)] : (&wire3))) ?
                         (~|$signed(wire0[(3'h4):(1'h1)])) : wire6)};
  assign wire8 = wire6[(3'h4):(1'h0)];
  assign wire9 = $unsigned(wire2);
  assign wire10 = wire6[(2'h2):(2'h2)];
endmodule
