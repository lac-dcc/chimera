module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire4;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = ((8'hae) ?
                     $unsigned(wire2) : ({({wire1} * (8'ha6))} >> (^$unsigned($signed(wire0)))));
  assign wire6 = wire3[(2'h2):(1'h0)];
  assign wire7 = ($unsigned({$signed($signed(wire1))}) | (-(wire5[(2'h3):(1'h0)] ?
                     $signed($signed(wire6)) : ($signed(wire1) <<< wire3[(1'h0):(1'h0)]))));
  assign wire8 = ($signed($signed((~^(wire1 * wire2)))) ?
                     (~(~&wire1[(4'ha):(1'h1)])) : $unsigned(wire4));
  assign wire9 = {(&(^$unsigned((~^wire6))))};
  assign wire10 = {(+wire3[(1'h0):(1'h0)])};
  assign wire11 = ($signed({{(wire8 ? wire9 : wire7)}}) & wire6);
endmodule
