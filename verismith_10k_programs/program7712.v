module top
#(parameter param9 = {{({(~&(8'hb1)), (8'hb6)} ? ((!(7'h42)) ? ((8'hb0) ? (8'ha7) : (8'ha1)) : (~|(8'hb9))) : ((7'h40) >>> ((8'hbf) >>> (8'hb4))))}})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h2f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire4;
  assign wire6 = wire3;
  assign wire7 = (-({$unsigned((!wire4))} < wire5));
  assign wire8 = wire7[(2'h2):(1'h1)];
endmodule
