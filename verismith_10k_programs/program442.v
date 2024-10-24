module top
#(parameter param8 = (&(|({{(8'ha6), (8'haa)}, (&(8'hbf))} ? (!((8'hac) * (7'h41))) : {((8'ha4) ? (8'hb1) : (8'had)), {(8'hb2), (8'ha3)}}))), 
parameter param9 = (~|(param8 ? (~|param8) : (((&param8) < param8) * (((8'ha0) ? param8 : param8) < param8)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h32):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (^wire0);
  assign wire5 = wire1;
  assign wire6 = $signed(wire1[(1'h0):(1'h0)]);
  assign wire7 = $unsigned($signed($signed(((wire5 ? (8'ha4) : wire5) ?
                     (~|wire0) : wire5))));
endmodule
