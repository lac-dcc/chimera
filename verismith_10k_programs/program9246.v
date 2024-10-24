module top
#(parameter param9 = (-(({((8'hb4) ~^ (8'h9c)), ((8'hb4) ? (8'ha0) : (7'h41))} > (~&((8'ha6) ^~ (7'h40)))) ? ((-((8'ha9) || (7'h42))) ? (((8'h9d) ~^ (7'h43)) - {(8'ha3), (8'h9d)}) : (-(8'hb3))) : ({((8'haa) ? (8'h9f) : (8'hb7)), ((8'ha4) >> (7'h42))} ? ((8'hb2) | ((8'hb1) || (8'ha8))) : (~&((8'hab) ? (8'ha0) : (8'hac)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h25):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire4[(2'h3):(1'h0)];
  assign wire6 = $unsigned((~(+(-(wire3 ^~ wire2)))));
  assign wire7 = (8'ha0);
  assign wire8 = (wire4 ? (^~$signed(wire4)) : wire3);
endmodule
