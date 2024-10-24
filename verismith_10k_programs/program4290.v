module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  assign y = {wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $unsigned(((wire1[(3'h6):(3'h5)] >> ($unsigned(wire1) ?
                         (^~wire0) : ((8'ha1) - wire1))) ?
                     (wire1 & wire1[(1'h1):(1'h0)]) : $signed($signed((wire0 != (8'hba))))));
  assign wire6 = wire0[(3'h6):(3'h5)];
  assign wire7 = wire1[(1'h0):(1'h0)];
  assign wire8 = wire5;
  assign wire9 = $signed(((-$signed((^(8'hb5)))) ?
                     wire0[(3'h4):(2'h2)] : (((^wire8) ?
                             $unsigned(wire8) : (wire4 ? wire4 : (8'ha7))) ?
                         (wire6[(3'h7):(2'h2)] >> (wire0 ?
                             wire8 : (8'hb1))) : wire5[(2'h2):(2'h2)])));
endmodule
