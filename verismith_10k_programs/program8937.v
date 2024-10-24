module top
#(parameter param13 = {(-(~((^(8'hbb)) >>> (^~(8'ha7))))), ((^~({(8'h9f), (7'h40)} ? ((8'hbd) + (7'h44)) : ((8'ha1) != (8'ha1)))) ? (((-(7'h44)) ? ((8'ha8) ? (8'ha9) : (8'had)) : ((8'hbd) >> (8'ha0))) ? (((8'h9c) > (8'ha8)) ~^ {(8'hb3), (8'hac)}) : ({(8'hb9)} ? ((8'hbf) ? (8'hbf) : (8'hb2)) : (!(8'hb6)))) : {(~|(|(8'hae)))})})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = $unsigned(wire4[(4'hd):(3'h4)]);
  assign wire6 = wire0[(3'h6):(2'h2)];
  assign wire7 = (-$unsigned((~&$signed((wire5 ? (8'h9e) : wire4)))));
  assign wire8 = $unsigned(wire3);
  assign wire9 = (^~wire2);
  assign wire10 = (^~(|(~&(&(~wire3)))));
  assign wire11 = wire4;
  assign wire12 = (&wire4);
endmodule
