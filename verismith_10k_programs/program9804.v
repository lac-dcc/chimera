module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire8;
  wire signed [(3'h5):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (-(~^(wire0[(3'h6):(1'h1)] ?
                     (wire0 ?
                         $signed(wire2) : wire3[(3'h7):(1'h0)]) : $signed((~(8'h9e))))));
  assign wire5 = (~^wire1);
  assign wire6 = $unsigned({(8'hb0), (8'haf)});
  assign wire7 = ((wire6 ^ $signed({(wire6 ? wire1 : wire2)})) ?
                     $unsigned(($signed(wire4[(4'ha):(1'h1)]) ?
                         (wire0[(4'hf):(4'he)] ^~ {wire4,
                             wire6}) : $unsigned((~^wire3)))) : $signed(wire0[(2'h2):(1'h0)]));
  assign wire8 = $unsigned(wire1[(1'h1):(1'h0)]);
endmodule
