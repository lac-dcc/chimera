module top
#(parameter param10 = (8'ha0), 
parameter param11 = (~&(param10 ? ((8'ha8) ? ({param10} ? (~^param10) : (&param10)) : param10) : (((8'h9e) ? param10 : {param10, param10}) ? (-(~&(8'ha9))) : param10))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire5;
  assign y = {wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $signed(wire2[(3'h5):(1'h0)]);
  assign wire6 = wire1;
  assign wire7 = $unsigned((wire3 >= wire4[(5'h13):(5'h10)]));
  assign wire8 = $unsigned(wire4[(4'hf):(4'hc)]);
  assign wire9 = wire4;
endmodule
