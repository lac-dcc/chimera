module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire4;
  assign y = {wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (-$unsigned($unsigned($unsigned((~(8'ha5))))));
  assign wire5 = wire0;
  assign wire6 = ($unsigned((^~$unsigned(wire2))) ?
                     $signed($unsigned(wire5)) : ($unsigned((|$unsigned(wire4))) ?
                         (($unsigned((8'h9c)) ? wire1[(5'h14):(1'h0)] : wire2) ?
                             $signed((wire2 ? wire1 : wire2)) : (-(wire4 ?
                                 wire3 : wire4))) : (^~wire1)));
  assign wire7 = wire3;
  assign wire8 = {{(((&wire4) ? $signed(wire1) : (~|wire0)) <<< wire4)}};
  assign wire9 = $signed($signed($unsigned({$unsigned(wire5)})));
endmodule
