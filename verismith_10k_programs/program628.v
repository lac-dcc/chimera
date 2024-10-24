module top
#(parameter param10 = (({(~(!(8'hbb)))} >= {(((8'ha1) ? (8'hb7) : (7'h40)) && (~(8'ha6))), (((8'hb0) ? (8'h9c) : (8'hbe)) || {(7'h43)})}) || ((~&(+((8'ha6) ^~ (8'hbb)))) == {(((8'ha4) ? (8'hb8) : (8'hbb)) * ((8'hbf) ? (7'h42) : (8'h9c))), {(!(8'haf))}})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h2b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire4;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  assign y = {wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire2[(5'h10):(4'hf)];
  assign wire6 = $signed(wire2);
  assign wire7 = {(~&{$signed((wire4 ? wire2 : wire5))})};
  assign wire8 = wire6[(3'h4):(1'h0)];
  assign wire9 = $unsigned((wire6[(3'h4):(3'h4)] ^~ ($unsigned(wire2[(5'h11):(4'hc)]) <<< $signed((+(8'hb4))))));
endmodule
