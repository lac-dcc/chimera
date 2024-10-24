module top
#(parameter param10 = ((8'hab) ? {((((7'h44) ? (8'hb8) : (7'h44)) ? ((8'hab) & (8'hb7)) : ((8'hb4) ? (8'hb9) : (8'haa))) ? (+(-(8'ha6))) : (~&(|(8'hb2))))} : (!(8'ha9))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire4;
  assign y = {wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire0;
  assign wire5 = wire1[(1'h0):(1'h0)];
  assign wire6 = $signed(($signed(wire4[(2'h3):(1'h0)]) ~^ {$signed((~|wire3)),
                     (^~$unsigned(wire0))}));
  assign wire7 = {$signed(wire6[(4'hc):(3'h7)])};
  assign wire8 = ((8'hb3) ^~ {wire5[(2'h2):(1'h1)],
                     (wire3[(3'h6):(1'h0)] > ((wire1 ?
                         wire7 : wire6) - $unsigned(wire6)))});
  assign wire9 = wire7;
endmodule
