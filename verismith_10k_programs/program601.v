module top #(parameter param12 = (8'hb2)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire4;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (~&(~wire1));
  assign wire5 = $unsigned(wire4[(1'h1):(1'h0)]);
  assign wire6 = (+$unsigned(($unsigned({wire2}) ?
                     wire2[(5'h10):(4'hb)] : ((wire0 ?
                         wire2 : wire3) ~^ $unsigned(wire3)))));
  assign wire7 = (~wire4[(4'hf):(4'hb)]);
  assign wire8 = ($unsigned(wire5[(3'h5):(1'h1)]) & wire0[(2'h3):(1'h1)]);
  assign wire9 = (8'ha4);
  assign wire10 = $unsigned((~&$unsigned((wire4 ?
                      $unsigned(wire1) : wire4[(1'h0):(1'h0)]))));
  assign wire11 = wire5;
endmodule
