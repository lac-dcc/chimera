module top
#(parameter param20 = ({((7'h40) ? ({(8'ha5), (8'ha5)} + ((8'hb7) ? (8'hba) : (8'ha0))) : {((8'ha5) | (7'h40))}), (({(8'hbf)} > ((8'h9d) ? (7'h43) : (8'had))) ? ((8'had) && ((8'hbb) ? (8'hb3) : (8'hae))) : ((+(8'hb8)) ? {(8'ha0)} : ((8'hae) || (8'ha8))))} ? {(({(8'hbf), (8'had)} * (7'h40)) <<< ((~(8'hbb)) ? ((7'h42) ? (8'ha4) : (8'hb3)) : ((8'h9c) ? (8'ha5) : (8'hb4)))), ((((8'ha7) ? (8'ha4) : (8'hb7)) ? ((8'h9e) ? (8'hb4) : (8'ha3)) : (^(8'haa))) ~^ (((8'hb3) ? (7'h42) : (8'ha7)) ? {(8'hb3), (8'hb1)} : (|(8'ha8))))} : ((8'ha7) ? ((|((8'hb6) ? (8'hbd) : (7'h44))) ? (((8'hb3) | (8'h9d)) ? {(8'hbc)} : (^~(7'h41))) : {((8'hbc) ^ (8'hb1))}) : (^{(^(8'hb7))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire19;
  wire [(4'hf):(1'h0)] wire18;
  wire [(4'he):(1'h0)] wire17;
  wire [(5'h12):(1'h0)] wire16;
  wire [(4'he):(1'h0)] wire15;
  wire signed [(5'h13):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire12;
  wire signed [(4'hc):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = $signed((8'hb1));
  assign wire6 = (|(|$unsigned(wire4[(3'h5):(3'h4)])));
  assign wire7 = (+(~(^~($unsigned(wire6) - {wire4}))));
  assign wire8 = (wire6[(1'h0):(1'h0)] <= wire4);
  assign wire9 = $unsigned(wire1);
  assign wire10 = ((|(((wire4 - (8'hb0)) <= (~^(8'hbf))) >>> {(~&(8'hb9)),
                      (wire6 & wire9)})) ^~ wire1[(1'h1):(1'h1)]);
  assign wire11 = (~|((~^wire3[(4'h8):(4'h8)]) ?
                      {$unsigned({wire10}), wire3[(3'h5):(3'h5)]} : wire4));
  assign wire12 = ((!(wire0 ? wire4 : (^~(wire8 || wire8)))) ?
                      {{wire3[(3'h7):(1'h0)],
                              ((wire9 | wire11) ~^ wire9)}} : ($signed(wire9) >> {(~|(wire1 && wire3)),
                          (~&wire9[(2'h2):(1'h0)])}));
  assign wire13 = (({((wire0 ? wire7 : wire8) ?
                              (wire5 && wire1) : (-wire9))} | {$unsigned((~(8'hb2)))}) ?
                      wire10[(4'hd):(1'h0)] : wire12);
  assign wire14 = $unsigned(wire5[(1'h0):(1'h0)]);
  assign wire15 = $unsigned(wire14[(4'h9):(2'h3)]);
  assign wire16 = $signed($unsigned(wire12));
  assign wire17 = wire8[(3'h4):(1'h1)];
  assign wire18 = (wire16[(4'h9):(2'h3)] ^~ $signed({{(wire17 ?
                              wire3 : wire9)}}));
  assign wire19 = wire14;
endmodule
