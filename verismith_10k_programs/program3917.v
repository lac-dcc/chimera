module top
#(parameter param10 = {(((8'ha1) ? (((8'hb8) ? (8'haf) : (8'ha5)) ? (~(8'hae)) : {(8'hb0), (8'haa)}) : (((8'haa) ? (8'hb1) : (8'ha9)) <<< {(7'h40), (8'h9f)})) || (^~(((8'hb9) ? (8'h9d) : (8'hb4)) ? {(7'h44)} : ((8'haf) ~^ (8'hac)))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  assign y = {wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (wire4 || $signed(wire0[(2'h2):(1'h1)]));
  assign wire6 = $unsigned($unsigned(({wire2,
                     (wire4 > wire4)} + $unsigned((wire5 ? wire5 : wire5)))));
  assign wire7 = (8'hb2);
  assign wire8 = wire7;
  assign wire9 = wire8;
endmodule
