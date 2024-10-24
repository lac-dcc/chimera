module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h2c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire9;
  wire [(3'h6):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  assign y = {wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (({wire1[(1'h1):(1'h1)]} >>> (((wire4 ? wire1 : wire1) ?
                     $signed(wire2) : $signed(wire0)) && wire2)) ^~ wire0[(2'h2):(1'h1)]);
  assign wire6 = (wire2 ? (8'h9c) : $unsigned({wire4}));
  assign wire7 = $signed((wire3 && (&wire6)));
  assign wire8 = $unsigned(((-wire3) ?
                     {$unsigned($unsigned((8'hae))),
                         ({(8'hbb), wire6} ?
                             wire0[(3'h4):(2'h3)] : $signed(wire7))} : (8'ha9)));
  assign wire9 = ((^$signed(wire4[(3'h7):(3'h7)])) ?
                     $unsigned(wire7) : (wire5[(3'h4):(3'h4)] >>> $signed(wire0[(1'h1):(1'h0)])));
endmodule
