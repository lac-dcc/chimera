module top
#(parameter param8 = (+(|((^((8'ha0) & (8'ha0))) >> ((8'hb2) ? ((8'had) ~^ (8'hb1)) : (~|(8'hb7)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned($signed((-wire2)));
  assign wire5 = ({($signed($unsigned(wire3)) < $unsigned((-(8'hb7))))} ^~ (wire3 ~^ $signed($signed(wire4))));
  assign wire6 = (8'h9e);
  assign wire7 = wire2[(1'h0):(1'h0)];
endmodule
