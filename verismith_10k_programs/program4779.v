module top
#(parameter param9 = (-{(^~(((8'hb5) - (8'hb8)) - (^(8'hb7)))), {{{(8'had), (8'ha8)}, ((7'h41) * (8'ha9))}, (~^((8'hbf) ^ (8'ha6)))}}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h29):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $unsigned((wire1[(4'hb):(3'h7)] ?
                     $unsigned((wire1 ?
                         (wire4 & wire3) : $signed(wire1))) : (($unsigned(wire2) ?
                         wire3[(3'h7):(3'h6)] : (~^(8'hb6))) ^ wire3[(4'h8):(3'h6)])));
  assign wire6 = (^(($signed((|wire4)) ?
                         wire4[(4'he):(2'h3)] : ($signed(wire3) <= wire3[(3'h7):(3'h7)])) ?
                     (~&wire5) : $signed(((wire2 ? wire1 : wire5) ?
                         wire5[(4'hb):(1'h1)] : (wire3 ? (8'ha1) : wire4)))));
  assign wire7 = wire5[(3'h5):(1'h0)];
  assign wire8 = $signed((~&(wire0[(2'h3):(2'h3)] ?
                     $signed(wire6[(2'h3):(1'h0)]) : $unsigned((~^wire4)))));
endmodule
