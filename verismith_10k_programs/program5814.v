module top
#(parameter param8 = (8'hbe), 
parameter param9 = ((param8 ? ((~^(param8 ? param8 : param8)) >= (param8 ? {param8, (7'h44)} : (param8 ^ param8))) : param8) ~^ {{(~|((8'h9e) ? param8 : param8))}, (&(param8 << ((8'hba) + param8)))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = {(wire3 << (^~($unsigned(wire3) ?
                         (wire2 ~^ wire3) : $unsigned(wire3))))};
  assign wire5 = (|$unsigned((^{$signed(wire1)})));
  assign wire6 = (wire1[(2'h2):(2'h2)] ?
                     $signed(wire4) : $unsigned(((wire4 != $signed(wire4)) >> wire2)));
  assign wire7 = (-((wire4[(5'h10):(3'h6)] ~^ {wire2[(3'h4):(1'h0)]}) ?
                     (((wire6 ? (8'hb6) : (8'h9e)) | wire6) ?
                         (wire5[(1'h0):(1'h0)] ?
                             (8'ha2) : $unsigned(wire6)) : $signed((|wire4))) : (8'hae)));
endmodule
