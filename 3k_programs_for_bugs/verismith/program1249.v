module top
#(parameter param9 = ((((((8'h9d) ^~ (8'hb1)) & ((8'hba) != (8'hab))) ? (((7'h44) ? (8'ha6) : (8'hb6)) && ((8'hb7) ? (8'haa) : (7'h41))) : ({(8'hb8)} || ((8'ha3) ? (8'ha4) : (7'h43)))) ? {(~^((8'hba) >> (8'hbc)))} : ({(-(7'h44))} ? (&((8'hae) - (8'ha1))) : ((~^(8'had)) || (^~(8'hb7))))) || ({(((8'hb3) ~^ (8'hbe)) ^ (~&(8'hb7)))} ? (!(((8'hbf) ? (8'hb1) : (8'hb2)) ? ((8'hbb) ? (7'h41) : (8'hb0)) : (!(8'h9f)))) : {{(|(8'haa))}, (-{(8'hb8)})})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h26):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire3[(4'h8):(2'h3)];
  assign wire6 = ((8'hb2) <= {wire5});
  assign wire7 = {wire5};
  assign wire8 = wire2;
endmodule
