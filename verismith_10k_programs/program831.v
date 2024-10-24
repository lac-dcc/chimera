module top #(parameter param34 = (7'h42)) (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  wire signed [(4'he):(1'h0)] wire33;
  wire signed [(4'he):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire31;
  wire signed [(3'h4):(1'h0)] wire30;
  wire [(4'ha):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire28;
  wire [(3'h6):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire26;
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire4,
                 wire5,
                 wire6,
                 wire12,
                 wire26,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = wire2[(3'h6):(1'h1)];
  assign wire5 = (~^(((wire1[(4'hc):(1'h1)] ?
                     $unsigned((8'hb9)) : wire4[(2'h3):(1'h1)]) >= (8'hb8)) ^ wire4[(2'h3):(1'h0)]));
  assign wire6 = $unsigned(wire1[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg7 <= $signed(($signed($signed(wire1[(4'h8):(3'h5)])) ?
          wire5[(5'h11):(4'ha)] : wire0));
      reg8 <= $unsigned((wire6[(4'h8):(3'h4)] ?
          ((~^wire3) ^ ($signed(wire5) * wire1)) : ({(wire4 ? wire2 : wire1),
              (wire0 ~^ wire6)} | ({wire4} * reg7[(5'h11):(4'ha)]))));
      reg9 <= wire2[(2'h3):(2'h3)];
      reg10 <= (wire1 << ((|({reg7} ? {(8'had), wire0} : (wire3 >= wire0))) ?
          $unsigned(((^reg9) || (reg8 ?
              wire5 : wire1))) : ($signed({wire4}) ^~ wire6[(1'h1):(1'h0)])));
      reg11 <= (wire1 ?
          ({(&reg9[(3'h4):(3'h4)])} | (((wire6 + (8'h9e)) ?
                  (wire3 <= wire1) : wire3[(3'h5):(2'h2)]) ?
              wire0 : wire1[(3'h5):(2'h3)])) : ($signed(({reg9} ?
              (~|(8'hb9)) : reg7)) < {$signed($unsigned(wire3)),
              (wire6 <<< (reg9 ? wire6 : wire2))}));
    end
  assign wire12 = (+wire1[(3'h7):(2'h3)]);
  module13 #() modinst27 (.wire17(reg11), .wire14(wire6), .wire16(wire3), .clk(clk), .wire15(wire1), .wire18(reg9), .y(wire26));
  assign wire28 = ($signed($unsigned({(^~wire12), (+(8'hb3))})) ?
                      $signed(reg8[(2'h2):(1'h0)]) : $signed((8'hbe)));
  assign wire29 = wire4;
  assign wire30 = $signed(((((reg7 ?
                          wire12 : wire12) ^ $signed(wire0)) <<< $unsigned($signed(wire1))) ?
                      (~|{wire12}) : (~($signed(wire26) >= $signed(wire12)))));
  assign wire31 = $unsigned($unsigned(($unsigned((8'hb4)) ?
                      (wire28[(2'h2):(2'h2)] != $unsigned(wire5)) : $unsigned($signed(wire3)))));
  assign wire32 = (^$signed($unsigned($unsigned(((8'hbe) << reg8)))));
  assign wire33 = $signed(wire26[(5'h11):(5'h10)]);
endmodule

module module13
#(parameter param25 = (+(((&((8'hbf) ? (8'h9d) : (8'hbe))) == ({(8'hac)} && ((8'ha1) ? (8'hbb) : (8'h9c)))) ? {(-{(8'hbf), (8'hae)})} : ((+((8'hbe) ? (8'hb8) : (8'ha8))) * {(8'ha9), (|(8'h9f))}))))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire18;
  input wire [(4'hc):(1'h0)] wire17;
  input wire signed [(5'h11):(1'h0)] wire16;
  input wire signed [(4'he):(1'h0)] wire15;
  input wire [(3'h7):(1'h0)] wire14;
  wire [(4'h9):(1'h0)] wire24;
  wire signed [(3'h7):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire19;
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  assign y = {wire24, wire20, wire19, reg23, reg22, reg21, (1'h0)};
  assign wire19 = {wire16};
  assign wire20 = (($unsigned($unsigned((wire18 > wire16))) ?
                      ((((8'hb1) ? wire19 : wire18) ?
                          wire17[(4'h9):(3'h6)] : wire18[(4'hb):(4'h9)]) ^~ (((8'hb6) <<< wire15) == {(8'ha7)})) : (wire15[(2'h3):(1'h0)] ?
                          ({wire18} ?
                              $signed(wire16) : (wire15 >> wire16)) : ((wire18 ?
                                  wire19 : wire15) ?
                              wire17 : wire14[(1'h0):(1'h0)]))) && ((~|(+(~&wire17))) ?
                      ($signed((wire14 ? wire19 : wire15)) ~^ {{wire17, wire18},
                          $unsigned(wire19)}) : (^wire15[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg21 <= ($unsigned($signed(($unsigned(wire17) | {wire18}))) > ({$unsigned((wire17 ?
              wire17 : wire15))} >= {(8'ha6)}));
      reg22 <= (~^(reg21 ?
          $signed(wire15[(4'hc):(3'h5)]) : wire18[(3'h6):(3'h5)]));
      reg23 <= $signed($signed((8'ha1)));
    end
  assign wire24 = (((~^$unsigned($unsigned(reg21))) || $unsigned(((~&wire20) <= (wire16 ?
                      (8'hb2) : wire18)))) >= ($unsigned($unsigned($unsigned(reg22))) + wire19[(3'h4):(2'h2)]));
endmodule
