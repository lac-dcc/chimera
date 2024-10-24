module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned($unsigned($signed(((&wire1) >>> $signed(wire3)))));
  assign wire5 = (($unsigned(wire4) ^ (-($unsigned(wire3) < wire4[(1'h0):(1'h0)]))) ?
                     wire3[(1'h0):(1'h0)] : $signed($signed(((wire4 ?
                             wire3 : wire0) ?
                         wire0 : wire1))));
  assign wire6 = ((~(~((^wire1) ?
                         wire1[(1'h0):(1'h0)] : wire3[(3'h7):(1'h0)]))) ?
                     $signed(wire2[(1'h0):(1'h0)]) : (~&(8'hbc)));
  assign wire7 = (wire3[(3'h4):(3'h4)] ?
                     (&(~^(&(wire5 * wire0)))) : (^($signed(wire1[(1'h0):(1'h0)]) ?
                         ($unsigned(wire3) ?
                             $unsigned(wire4) : (wire3 >>> wire6)) : (8'hb5))));
endmodule
