module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (~^{$unsigned($unsigned((wire0 & wire0)))});
  assign wire5 = $unsigned($signed((({wire2} ?
                     wire1 : $unsigned(wire3)) + $signed((wire2 ?
                     wire4 : wire0)))));
  assign wire6 = ((+wire4) + wire1);
  assign wire7 = $signed($signed((~&$unsigned($unsigned(wire5)))));
  assign wire8 = ($signed((!wire6[(1'h0):(1'h0)])) ?
                     $unsigned((8'ha9)) : wire4);
endmodule
