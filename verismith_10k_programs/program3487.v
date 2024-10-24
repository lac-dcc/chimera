module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = ((8'hb9) ^ $signed(($unsigned({wire1}) ?
                     wire1[(2'h3):(2'h3)] : ($unsigned(wire1) == $signed(wire0)))));
  assign wire5 = $unsigned($signed(wire4[(3'h6):(2'h2)]));
  assign wire6 = (wire0 ^~ wire1[(2'h3):(2'h3)]);
  assign wire7 = $signed((!$unsigned($signed($signed(wire0)))));
endmodule
