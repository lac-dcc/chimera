module top
#(parameter param10 = (~|{(((~&(7'h40)) ? (+(8'hbb)) : (~|(8'hbe))) ? ({(8'hbc), (8'hb6)} ? ((8'hb1) ? (8'had) : (8'ha3)) : (8'hb2)) : ((+(8'hbf)) ? {(8'ha5)} : (~|(8'ha4)))), (|{((8'had) ? (8'ha3) : (8'hb4)), ((8'ha7) || (8'ha0))})}), 
parameter param11 = (8'h9e))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire4;
  assign y = {wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned(($signed(wire2) ~^ wire3));
  assign wire5 = (~|wire2);
  assign wire6 = (^~(wire4[(1'h1):(1'h0)] ^~ {wire1[(3'h4):(1'h1)]}));
  assign wire7 = $unsigned($signed(wire6[(2'h2):(1'h0)]));
  assign wire8 = wire0[(2'h3):(1'h1)];
  assign wire9 = {(wire7[(2'h2):(2'h2)] >= $signed(($unsigned(wire2) ?
                         (|wire4) : $unsigned(wire2)))),
                     {(8'haf)}};
endmodule
