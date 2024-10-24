module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (+({($unsigned(wire0) ?
                             (wire2 ? wire0 : wire0) : wire1[(1'h0):(1'h0)])} ?
                     {wire1[(3'h4):(2'h3)]} : $signed($signed(wire3))));
  assign wire5 = (7'h40);
  assign wire6 = wire5[(4'ha):(4'h9)];
  assign wire7 = wire1;
endmodule
