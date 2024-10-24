module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  assign y = {wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $signed(wire1[(3'h4):(3'h4)]);
  assign wire5 = wire1;
  assign wire6 = ($unsigned(wire2) ?
                     $unsigned((((wire2 ? wire3 : wire3) ?
                         {(8'hae),
                             wire5} : $unsigned((8'hb0))) < wire5)) : wire3[(2'h3):(1'h0)]);
  assign wire7 = {$signed(($unsigned(wire2[(2'h3):(2'h3)]) ?
                         $signed((wire2 & wire5)) : {wire2}))};
  assign wire8 = (((wire3 ? $signed($unsigned(wire3)) : wire2[(1'h1):(1'h0)]) ?
                         (^wire1) : wire5) ?
                     wire2[(1'h1):(1'h1)] : {$unsigned((wire1[(3'h4):(1'h1)] <<< (^wire0)))});
  assign wire9 = $unsigned((&wire0));
endmodule
