module top
#(parameter param9 = (((|(((8'hbf) ~^ (8'hae)) == ((8'hb8) <<< (8'haf)))) ? ((|{(8'ha8), (8'hba)}) >= ((~(8'hb4)) ~^ ((8'hb0) <<< (8'hbe)))) : ((!{(8'h9d)}) ? (^{(7'h40)}) : (8'hba))) ? (~^(({(8'h9d)} - (~^(8'hb0))) != (8'hbb))) : {(~|(((7'h40) >= (8'hac)) ? {(8'hb5)} : (8'hbe)))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire8;
  wire signed [(3'h5):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (wire0 != $signed(($signed($unsigned(wire1)) << (~(wire1 ?
                     wire0 : wire2)))));
  assign wire5 = wire1;
  assign wire6 = wire3[(4'h8):(4'h8)];
  assign wire7 = (+wire5[(4'he):(4'h9)]);
  assign wire8 = $signed({$signed(((wire6 ? wire1 : wire2) ?
                         (wire7 ? wire1 : wire0) : $unsigned(wire2)))});
endmodule
