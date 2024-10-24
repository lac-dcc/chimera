module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h30):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire9;
  wire [(4'hd):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire5;
  assign y = {wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (&$unsigned(((7'h43) <<< wire0[(4'hf):(1'h1)])));
  assign wire6 = (~&$signed(wire1));
  assign wire7 = wire5;
  assign wire8 = (^~($signed((7'h43)) ?
                     $unsigned(wire4) : {((wire1 <= wire6) ?
                             $unsigned((7'h42)) : $unsigned(wire1)),
                         ((~|wire2) >= wire3)}));
  assign wire9 = wire0[(4'ha):(2'h2)];
endmodule
