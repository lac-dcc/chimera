module top
#(parameter param11 = {(^({(!(7'h41))} ? (((8'hb3) <= (8'haa)) ~^ {(8'hbf), (7'h41)}) : (((8'hbd) + (8'hab)) ? (8'hb6) : ((8'haf) ? (8'hb6) : (8'hb6)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire4;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = {$unsigned(((wire1 & (wire3 || wire1)) << (((8'ha2) ?
                         wire0 : wire0) >> wire1[(4'h9):(3'h6)])))};
  assign wire5 = $signed($signed(((wire1 + ((8'hb4) ?
                     (8'hb4) : wire2)) - $signed((wire4 == wire1)))));
  assign wire6 = (~|wire5);
  assign wire7 = wire2;
  assign wire8 = wire3[(3'h6):(3'h4)];
  assign wire9 = ($signed(wire1[(5'h10):(2'h2)]) >= $signed(($unsigned({(8'hab)}) >>> {wire6})));
  assign wire10 = wire2[(4'h9):(2'h2)];
endmodule
