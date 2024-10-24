module top
#(parameter param9 = ((~^(+(~&((8'hb8) & (8'ha3))))) ? (({((8'hb8) * (7'h41))} >= (((8'ha9) != (8'hb6)) ? (~(8'h9f)) : (8'hb0))) ? (-(((8'h9f) - (8'hb4)) - ((7'h42) >= (7'h40)))) : {({(8'ha7), (7'h40)} ? ((8'h9f) >= (8'hbf)) : {(8'had)})}) : (((((8'h9d) ? (8'haf) : (8'h9c)) ^ {(8'ha3), (8'hac)}) <= ({(8'hbb)} ? (|(8'hb0)) : ((8'h9f) <= (8'hb6)))) || {{((8'hb9) && (8'h9f)), (8'hae)}})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = {(!(-(^(8'ha2))))};
  assign wire5 = {wire2[(3'h4):(3'h4)]};
  assign wire6 = $signed((8'hbf));
  assign wire7 = $unsigned(wire1);
  assign wire8 = ((&(^$signed($unsigned(wire6)))) | ((^$signed((wire1 == wire1))) || $signed(((wire2 <= wire2) < {wire7}))));
endmodule
