module top
#(parameter param22 = (|(~(^(~&(~(8'hb5)))))), 
parameter param23 = param22)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire21;
  wire signed [(5'h10):(1'h0)] wire20;
  wire [(3'h5):(1'h0)] wire19;
  wire [(4'hc):(1'h0)] wire18;
  wire signed [(4'hb):(1'h0)] wire17;
  wire [(4'hf):(1'h0)] wire16;
  wire [(4'hb):(1'h0)] wire15;
  wire signed [(4'h9):(1'h0)] wire14;
  wire signed [(3'h4):(1'h0)] wire13;
  wire signed [(3'h7):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire10;
  wire [(4'h9):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire4;
  assign y = {wire21,
                 wire20,
                 wire19,
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
                 wire4,
                 (1'h0)};
  assign wire4 = $unsigned($signed(wire3));
  assign wire5 = $unsigned($signed((((wire3 * (8'hb8)) | (wire4 >> wire0)) <<< (&$unsigned(wire0)))));
  assign wire6 = $unsigned($unsigned(wire5[(3'h5):(3'h5)]));
  assign wire7 = $signed(((8'hb6) ?
                     (wire4[(2'h3):(1'h0)] ^~ ((wire6 ?
                         wire4 : wire4) == (wire3 ? wire0 : wire3))) : wire3));
  assign wire8 = (wire2[(4'hc):(4'ha)] <<< wire5[(2'h2):(1'h1)]);
  assign wire9 = wire7[(4'h8):(3'h4)];
  assign wire10 = wire4[(1'h1):(1'h0)];
  assign wire11 = (+$signed({($signed(wire6) * (8'hb2)),
                      wire7[(4'he):(4'h8)]}));
  assign wire12 = $unsigned($signed(wire3[(1'h0):(1'h0)]));
  assign wire13 = (~|$unsigned((~&{{wire9}, (wire11 ? wire7 : (8'hbb))})));
  assign wire14 = {$unsigned(((8'hbd) ? wire2 : wire2[(2'h2):(2'h2)]))};
  assign wire15 = (wire9 >> $unsigned((($unsigned(wire13) ?
                      (wire10 > (8'h9c)) : (wire4 ? wire2 : wire1)) ~^ wire6)));
  assign wire16 = $unsigned($signed({((wire7 >= (7'h41)) ?
                          (wire7 ? wire1 : wire8) : $unsigned(wire0))}));
  assign wire17 = {wire14[(2'h2):(2'h2)],
                      ({(wire3 ? (~|(8'hb1)) : $unsigned(wire16)),
                          (((8'hb3) ? wire12 : wire14) ?
                              $unsigned(wire8) : wire3[(3'h7):(3'h4)])} && $signed({(wire2 ?
                              wire1 : wire1)}))};
  assign wire18 = wire16;
  assign wire19 = $signed($unsigned((($unsigned(wire18) ?
                          $unsigned(wire13) : {wire18}) ?
                      wire13[(1'h0):(1'h0)] : (^~(^wire6)))));
  assign wire20 = (((($unsigned(wire10) != $unsigned(wire0)) ?
                          ({wire9, (8'ha7)} ?
                              (wire3 ?
                                  (8'ha4) : wire17) : $unsigned((8'ha9))) : $unsigned(wire3)) == $signed((-(~wire18)))) ?
                      (^~wire15) : $unsigned(wire11[(1'h1):(1'h1)]));
  assign wire21 = ((!wire17[(3'h6):(3'h5)]) | {($unsigned($signed(wire4)) ?
                          ((^wire1) ?
                              $unsigned(wire9) : (wire1 ?
                                  wire5 : wire5)) : wire4)});
endmodule
