module top
#(parameter param8 = ((((((8'hae) ^ (8'haf)) >= ((8'hb1) ? (8'ha9) : (8'ha1))) >> (^~((7'h42) && (8'hbb)))) ? (&(((8'h9d) ^~ (8'hb5)) ^~ ((8'ha3) ? (8'ha9) : (8'hbe)))) : (!((~&(8'hb3)) | ((7'h41) ? (8'ha9) : (7'h42))))) + (&(!{((8'ha8) ^ (8'hae))}))), 
parameter param9 = ((((~param8) - ((param8 ? param8 : param8) ^~ param8)) + (param8 | (param8 <<< (8'hb1)))) == param8))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h33):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(2'h3):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $signed(wire3);
  assign wire5 = $signed((wire0[(2'h3):(2'h2)] >> (8'ha4)));
  assign wire6 = wire2[(3'h4):(2'h3)];
  assign wire7 = $signed(wire5[(4'h9):(3'h7)]);
endmodule
