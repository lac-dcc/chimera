module top
#(parameter param9 = {((((~(8'hb9)) ~^ ((7'h40) >>> (8'ha4))) || {{(8'h9c), (8'hab)}}) <<< (&(((7'h41) ? (8'hb8) : (8'hbf)) ? (~&(8'haf)) : ((8'hb6) ? (7'h42) : (8'ha1)))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $signed(($unsigned(wire2[(4'h9):(2'h2)]) != ($signed(wire3) || $unsigned(wire2))));
  assign wire6 = (&(+wire4[(2'h2):(1'h0)]));
  assign wire7 = wire5[(4'hd):(4'hc)];
  assign wire8 = $unsigned((!wire7[(1'h1):(1'h0)]));
endmodule
