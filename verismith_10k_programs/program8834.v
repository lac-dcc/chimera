module top
#(parameter param14 = (((({(8'ha0)} ? (+(8'hac)) : {(7'h41), (8'hb7)}) < ({(8'hb1)} == ((8'hb6) ? (8'ha4) : (8'hba)))) ? {(-((8'hb2) ? (8'h9c) : (8'ha1)))} : (|(((8'hbe) * (7'h42)) << ((8'hae) ? (8'hbe) : (8'hb5))))) ? (((-((8'hb7) >> (8'hb5))) ? ((8'hab) ? (-(8'hb1)) : (^(8'hb2))) : (((8'hb6) || (7'h42)) + ((8'hba) ? (7'h44) : (8'hbe)))) >> (~^({(8'h9c)} ? ((8'hb1) ~^ (8'h9e)) : (8'ha8)))) : (&(8'ha3))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire13;
  wire signed [(3'h6):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire11;
  wire [(4'ha):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = (wire0[(2'h2):(2'h2)] ?
                     ($unsigned((^~wire2)) ^~ $signed(wire2[(3'h6):(3'h4)])) : (-{wire2[(1'h1):(1'h0)],
                         ((wire1 >>> wire0) ?
                             $unsigned(wire3) : ((8'hb2) ? wire2 : wire1))}));
  assign wire5 = {wire4};
  assign wire6 = $unsigned((-$signed($signed($signed(wire3)))));
  assign wire7 = (~wire5);
  assign wire8 = wire5;
  assign wire9 = (-wire1);
  assign wire10 = (~|$signed(wire8));
  assign wire11 = $signed((wire9[(2'h3):(2'h3)] ~^ (^$unsigned((&(8'hbd))))));
  assign wire12 = ((~|(8'hb3)) - {(wire7[(1'h1):(1'h1)] ?
                          $signed(wire2) : (wire9[(5'h11):(1'h0)] ?
                              {wire1, wire10} : (+wire4))),
                      wire6[(3'h7):(2'h2)]});
  assign wire13 = wire12[(2'h3):(1'h0)];
endmodule
