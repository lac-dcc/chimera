module top
#(parameter param12 = ((((((8'had) ^ (7'h44)) ? (~&(8'hac)) : (+(8'hb4))) ? {{(8'hb7)}, ((8'hbd) ? (8'h9f) : (8'h9e))} : {((8'hb6) <= (8'haf)), {(8'ha9), (8'h9c)}}) & ((~|(!(8'had))) ? ((!(8'hbe)) ? ((8'hb1) >> (8'ha8)) : ((8'hb0) + (7'h41))) : (((8'ha1) ? (8'hb8) : (8'hbe)) ? ((8'hb6) ? (8'had) : (8'ha3)) : ((8'hb0) ~^ (8'hbf))))) ? ({(^~(-(8'hb6))), (&((8'ha9) ~^ (8'hb8)))} == (((~(8'hb1)) ? {(8'hbe), (8'haa)} : ((8'hbe) ? (8'hb0) : (8'hb1))) ? (^~((8'hb2) ? (8'ha5) : (8'h9f))) : {((8'ha0) ? (8'haf) : (7'h42)), ((8'hb5) << (8'h9d))})) : (~|((((8'hbe) ? (8'hb2) : (8'had)) ? {(8'haa)} : ((8'hbc) ? (8'hb3) : (8'hbe))) ? ({(8'haf), (8'hae)} ? {(8'h9f)} : ((7'h40) ? (8'hb8) : (8'hac))) : (((8'ha4) + (8'hb5)) ? ((8'h9e) ? (8'hb0) : (8'ha3)) : (~(7'h40)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire4;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (8'hb1);
  assign wire5 = wire1[(3'h4):(1'h1)];
  assign wire6 = ((~$unsigned(wire3[(3'h6):(2'h2)])) << (~wire3));
  assign wire7 = wire0[(3'h7):(3'h7)];
  assign wire8 = (^~(^(((8'ha4) && wire3[(1'h0):(1'h0)]) ?
                     $signed(wire7) : wire4[(3'h6):(2'h3)])));
  assign wire9 = ((^(!(&(wire2 ? wire1 : wire4)))) ?
                     (8'ha6) : wire7[(4'h8):(4'h8)]);
  assign wire10 = ((wire2 ? wire8[(3'h5):(1'h1)] : wire7[(3'h4):(3'h4)]) ?
                      (!($unsigned(wire3) | wire8[(3'h5):(1'h1)])) : (+(^$unsigned($signed(wire8)))));
  assign wire11 = wire4;
endmodule
