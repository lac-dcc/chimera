module top
#(parameter param11 = {((|(^{(8'hba), (7'h40)})) << (+(^~((8'hb3) != (8'ha8))))), (|({{(8'ha1), (8'hab)}} ? ({(8'h9f), (8'hb2)} ? {(8'hb1)} : ((8'ha2) ? (8'h9f) : (8'hac))) : (8'ha1)))}, 
parameter param12 = (7'h41))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire5;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire2[(3'h5):(3'h5)];
  assign wire6 = $unsigned(($unsigned((wire0 ? (wire0 >>> wire0) : (8'hb9))) ?
                     $unsigned($unsigned((&wire3))) : wire5[(2'h3):(1'h0)]));
  assign wire7 = (~^$unsigned(((wire6 * {wire6, wire0}) ?
                     $signed($unsigned(wire3)) : {wire0[(2'h2):(1'h0)],
                         {(8'ha3), wire5}})));
  assign wire8 = (wire0 ? wire7 : (+(wire4 & {$unsigned(wire5), (8'h9f)})));
  assign wire9 = (-(&(wire8[(3'h4):(2'h3)] || $unsigned(wire6))));
  assign wire10 = wire5;
endmodule
