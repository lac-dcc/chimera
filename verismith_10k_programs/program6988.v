module top
#(parameter param24 = (~^((((!(8'hb4)) ? (8'hb0) : {(8'hba)}) ? (((8'had) ? (8'hac) : (8'hb3)) != ((7'h44) ? (8'haa) : (8'hab))) : {((7'h43) || (8'hbe))}) >> ((&((7'h40) & (8'hab))) ? ((^(8'hb2)) < {(7'h42), (8'hae)}) : ({(8'hb8)} < ((8'hb5) >>> (8'h9e)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire22;
  wire signed [(5'h15):(1'h0)] wire21;
  wire signed [(5'h12):(1'h0)] wire20;
  wire signed [(2'h2):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire18;
  wire [(5'h14):(1'h0)] wire17;
  wire signed [(3'h5):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire15;
  wire signed [(4'he):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire13;
  wire [(4'h9):(1'h0)] wire12;
  wire signed [(4'hc):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire5;
  assign y = {wire23,
                 wire22,
                 wire21,
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
                 (1'h0)};
  assign wire5 = wire1[(2'h3):(1'h1)];
  assign wire6 = ((((&((8'ha3) >= wire1)) < (wire1[(4'h9):(3'h6)] ?
                             wire3 : (wire3 != wire2))) ?
                         {$unsigned($unsigned(wire1)),
                             {(wire2 <= wire1),
                                 $signed(wire2)}} : {{(wire0 << wire4)}}) ?
                     $signed((!(|(^wire0)))) : ((~&((wire3 ?
                         wire4 : (8'h9e)) | $unsigned(wire3))) << (((~wire3) >= $signed(wire1)) || wire2)));
  assign wire7 = {(~wire5),
                     ((-$unsigned($unsigned(wire3))) ?
                         $signed($signed((8'hb9))) : (+$unsigned({wire4,
                             wire5})))};
  assign wire8 = wire4[(4'h9):(2'h2)];
  assign wire9 = wire6;
  assign wire10 = $unsigned(($unsigned({$signed(wire7),
                      $signed(wire5)}) <= $signed((((8'ha6) - wire2) ?
                      (8'hab) : $signed(wire1)))));
  assign wire11 = ((^~wire5) ~^ ({wire8[(1'h1):(1'h0)],
                      $unsigned($signed(wire7))} >> (^~{$signed(wire0),
                      wire3[(4'h9):(2'h2)]})));
  assign wire12 = $signed(wire11);
  assign wire13 = (&$signed({$signed(wire0)}));
  assign wire14 = wire5[(2'h3):(1'h1)];
  assign wire15 = $unsigned($unsigned(wire4[(1'h1):(1'h1)]));
  assign wire16 = $unsigned({(~^($signed(wire6) ~^ ((8'ha3) ?
                          wire2 : wire10)))});
  assign wire17 = $unsigned($unsigned(((|$signed(wire16)) > (~|$signed(wire13)))));
  assign wire18 = ({wire12[(4'h9):(2'h3)]} ?
                      (~|(wire1[(5'h14):(4'ha)] << ((~wire11) ?
                          (wire4 ?
                              wire0 : wire8) : $unsigned(wire8)))) : ({wire5[(3'h4):(3'h4)]} ?
                          (|{$unsigned(wire5), (wire0 * (8'had))}) : wire14));
  assign wire19 = ($unsigned(((8'ha0) ?
                          (8'ha8) : $signed(wire3[(4'hb):(3'h6)]))) ?
                      $unsigned((!$signed((wire2 ?
                          wire0 : wire1)))) : $unsigned($signed($signed($signed(wire3)))));
  assign wire20 = wire19[(1'h1):(1'h0)];
  assign wire21 = {wire7[(4'h8):(1'h1)]};
  assign wire22 = wire1;
  assign wire23 = ((&wire3) ? wire20 : wire5);
endmodule
