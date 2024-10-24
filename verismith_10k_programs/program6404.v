module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = ((((wire1[(2'h2):(1'h1)] ?
                         $signed((8'hae)) : wire4[(3'h7):(3'h6)]) ?
                     ($unsigned(wire4) >>> wire0[(5'h12):(2'h3)]) : ($signed(wire3) ^ $unsigned(wire3))) == $signed(wire2)) < (~wire2));
  assign wire6 = ($unsigned({{(wire3 ? wire1 : wire1), wire0[(5'h15):(3'h4)]},
                     wire0[(5'h15):(5'h11)]}) ~^ wire5[(1'h0):(1'h0)]);
  assign wire7 = {(~&($signed($unsigned(wire3)) ?
                         {{(8'hbf), wire5}, (8'h9f)} : $signed(wire5)))};
  assign wire8 = $signed({wire5, $unsigned(wire4[(3'h5):(2'h2)])});
endmodule
