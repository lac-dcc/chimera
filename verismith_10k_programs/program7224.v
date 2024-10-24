module top
#(parameter param9 = ((((((7'h44) - (8'hb8)) >>> ((8'ha7) ? (8'hb6) : (8'hb5))) - ({(8'hb7)} == ((8'hb7) ? (8'hb6) : (8'hb1)))) ? {((!(8'hb7)) != ((8'hbd) > (7'h43))), (&((8'h9f) != (8'hb4)))} : (!((&(8'hbe)) ? ((8'hb7) << (8'hbc)) : ((8'ha3) ? (8'hb4) : (8'haa))))) ? (((+(8'hbd)) - (8'hbb)) < ((~(^(8'had))) ? ({(8'hb0)} ? (~&(8'ha2)) : (~^(8'ha9))) : (((8'ha5) * (7'h40)) * ((8'hb4) ? (8'hbe) : (8'hb4))))) : (^~((8'h9f) < (^((7'h42) ~^ (8'h9f)))))), 
parameter param10 = ((-param9) - (~^(8'hb8))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire8;
  wire signed [(3'h5):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire5;
  wire signed [(3'h5):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (+wire0[(2'h2):(1'h0)]);
  assign wire5 = (-$signed(wire1));
  assign wire6 = (~|wire1);
  assign wire7 = (~wire3);
  assign wire8 = {(~|wire2), wire5[(3'h5):(1'h0)]};
endmodule
