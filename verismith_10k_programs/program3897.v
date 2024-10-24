module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (wire2[(2'h3):(2'h2)] * wire2);
  assign wire5 = {(~|$unsigned((~|(wire2 <<< wire2)))),
                     $signed($unsigned($unsigned($signed(wire0))))};
  assign wire6 = ($signed($signed($unsigned((wire3 > wire0)))) << wire3);
  assign wire7 = $unsigned(($signed($unsigned((~^wire1))) + (~^{(~^wire4)})));
  assign wire8 = $unsigned({wire2[(3'h5):(2'h3)]});
endmodule
