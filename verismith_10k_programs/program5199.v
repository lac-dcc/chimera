module top
#(parameter param9 = ((8'hb3) ? (((&(&(8'hb0))) ? (((8'hb4) >>> (8'ha2)) ? ((8'hb0) ? (8'hb0) : (8'hae)) : ((7'h44) - (8'h9d))) : (|((8'hb5) * (7'h40)))) ? (8'ha2) : {({(7'h40)} ? ((8'ha0) ? (8'hb2) : (8'hb0)) : ((8'hbe) <= (8'ha5)))}) : ((&(((8'hbe) >= (8'ha2)) ? (^(8'had)) : (|(8'hba)))) * (|(((8'hba) ? (8'haa) : (8'h9f)) ? ((8'ha3) ? (7'h44) : (8'ha4)) : ((8'haf) ? (8'had) : (8'hb1)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (wire0 <<< (wire4[(3'h4):(1'h0)] * wire2[(3'h4):(1'h1)]));
  assign wire6 = $unsigned((7'h44));
  assign wire7 = (~|wire1);
  assign wire8 = $unsigned(wire3);
endmodule
