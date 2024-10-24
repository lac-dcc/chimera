module top
#(parameter param55 = {((((~|(8'hbd)) << {(8'haa), (8'hae)}) >>> (&(-(8'ha5)))) ? ({(!(8'hac)), (8'hb3)} ? (~|((8'ha7) ? (7'h44) : (8'hbc))) : (((8'hb3) && (8'ha4)) ? ((8'h9c) ? (8'hbf) : (8'had)) : (&(8'hb0)))) : ((((8'ha9) <= (8'hac)) & ((8'h9d) <= (8'haa))) ? {((8'ha7) ? (7'h44) : (8'hb0))} : (~^(~|(8'hb0)))))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire0;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire4;
  wire [(4'hf):(1'h0)] wire54;
  wire signed [(4'hf):(1'h0)] wire52;
  wire [(4'hf):(1'h0)] wire51;
  wire signed [(5'h12):(1'h0)] wire50;
  wire signed [(4'he):(1'h0)] wire49;
  wire signed [(5'h13):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire47;
  reg signed [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  assign y = {wire54,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire5,
                 wire8,
                 wire47,
                 reg53,
                 reg6,
                 reg7,
                 (1'h0)};
  assign wire5 = (^{wire0});
  always
    @(posedge clk) begin
      reg6 <= (&wire1);
      reg7 <= wire5[(2'h2):(1'h1)];
    end
  assign wire8 = reg6;
  module9 #() modinst48 (.wire12(reg6), .clk(clk), .wire11(wire2), .wire13(wire8), .y(wire47), .wire10(wire1));
  assign wire49 = ((!$unsigned($unsigned({wire1}))) == wire8);
  assign wire50 = $unsigned((wire3[(1'h1):(1'h0)] ?
                      wire8 : $signed({$signed(wire4), $unsigned(wire3)})));
  assign wire51 = (wire4[(3'h6):(2'h2)] ?
                      ($signed(wire8[(1'h1):(1'h0)]) <= {((wire47 == (8'h9d)) ?
                              reg6 : wire3[(2'h2):(2'h2)])}) : {(wire5 ?
                              {(reg6 ?
                                      (8'hb5) : wire2)} : $signed($signed(reg7)))});
  assign wire52 = {$unsigned($signed((-$unsigned(wire49)))), reg7};
  always
    @(posedge clk) begin
      reg53 <= ((|((8'ha6) & ({(8'hae)} <<< wire1))) ?
          reg7[(3'h6):(3'h5)] : (+wire47[(4'ha):(4'h8)]));
    end
  assign wire54 = (^(~^$signed(wire5[(1'h0):(1'h0)])));
endmodule

module module9
#(parameter param46 = ((~(~&(^~((8'ha9) <= (8'ha2))))) ? (^(8'hb2)) : ((({(8'hb0), (8'hbc)} ? ((7'h43) ? (7'h42) : (8'hb3)) : ((8'hb1) ~^ (8'hbf))) != ((8'hb0) && (8'hb3))) || (^~(((8'haf) ? (8'ha3) : (7'h40)) << ((8'hbb) ? (8'ha5) : (8'h9c)))))))
(y, clk, wire10, wire11, wire12, wire13);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire10;
  input wire [(3'h7):(1'h0)] wire11;
  input wire signed [(4'hb):(1'h0)] wire12;
  input wire [(5'h10):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire45;
  wire [(5'h13):(1'h0)] wire44;
  wire [(3'h7):(1'h0)] wire43;
  wire signed [(4'hb):(1'h0)] wire42;
  wire signed [(3'h6):(1'h0)] wire41;
  wire [(2'h3):(1'h0)] wire40;
  wire [(3'h4):(1'h0)] wire39;
  wire signed [(4'ha):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire16;
  wire signed [(5'h11):(1'h0)] wire17;
  wire signed [(4'h9):(1'h0)] wire18;
  wire [(5'h10):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire32;
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(2'h3):(1'h0)] reg36 = (1'h0);
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(4'hf):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire14,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire32,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg15,
                 (1'h0)};
  assign wire14 = ($unsigned(wire10) || (-(((wire11 ? wire10 : wire13) ?
                      $unsigned(wire11) : $unsigned(wire12)) - wire11[(3'h4):(1'h0)])));
  always
    @(posedge clk) begin
      reg15 <= ({wire13} ?
          ($unsigned($signed((8'h9c))) >= ($unsigned($unsigned(wire10)) ?
              (~$unsigned((8'h9e))) : ($unsigned(wire13) << (wire12 ?
                  wire13 : wire12)))) : (((~|(wire14 && wire11)) != $signed($unsigned(wire14))) ?
              wire11[(3'h6):(2'h2)] : {($unsigned(wire13) | $unsigned(wire12))}));
    end
  assign wire16 = wire11[(3'h7):(3'h7)];
  assign wire17 = ({wire11[(1'h1):(1'h1)]} ?
                      ($unsigned(($signed(wire13) >= $unsigned(wire13))) | $signed((&wire16[(2'h2):(2'h2)]))) : $unsigned(((~|wire14[(1'h1):(1'h0)]) <<< $unsigned({wire13,
                          wire13}))));
  assign wire18 = (($signed(reg15) <<< reg15) ? wire12 : wire11[(3'h7):(2'h2)]);
  assign wire19 = (wire11 ?
                      (wire16[(1'h1):(1'h1)] ?
                          (wire10[(2'h2):(1'h0)] ?
                              $signed((wire11 >> (8'h9c))) : wire13) : $signed((((7'h44) & wire16) ?
                              (wire12 ?
                                  (8'ha3) : wire13) : $unsigned(wire14)))) : ({$signed((wire14 ?
                                  wire18 : reg15))} ?
                          (~^(reg15[(2'h3):(1'h1)] * (wire14 ?
                              wire17 : wire16))) : wire11[(1'h0):(1'h0)]));
  module20 #() modinst33 (wire32, clk, wire18, wire11, wire12, wire14, wire16);
  always
    @(posedge clk) begin
      if ($unsigned((8'ha5)))
        begin
          reg34 <= {wire19, wire12[(2'h3):(2'h3)]};
          reg35 <= ((-(-(~|$signed(reg15)))) ?
              (wire10[(1'h0):(1'h0)] ?
                  (~^(^~wire19)) : (^{(reg15 & wire10),
                      (wire32 > (8'h9c))})) : ({$signed((-wire19))} ?
                  reg34[(3'h5):(2'h2)] : wire10));
        end
      else
        begin
          reg34 <= ((8'ha1) && wire12);
          reg35 <= (&wire32[(2'h2):(1'h0)]);
        end
      reg36 <= ({$unsigned(($signed(wire18) << (wire16 ?
              wire12 : reg15)))} < $signed(({(8'h9f), (!reg15)} ?
          $unsigned($unsigned(wire11)) : ((wire19 ?
              wire18 : wire16) ^~ (~|wire16)))));
      reg37 <= {wire13[(4'h9):(4'h8)]};
      reg38 <= $unsigned((~|reg15));
    end
  assign wire39 = wire19;
  assign wire40 = {{{wire12[(3'h7):(2'h2)]}},
                      ($signed(($signed(reg38) < {(8'hb2), wire18})) ^ wire19)};
  assign wire41 = $signed(((~|wire40[(2'h3):(2'h3)]) ^~ $unsigned((~wire40))));
  assign wire42 = reg38;
  assign wire43 = ($signed(wire39[(1'h1):(1'h0)]) ?
                      (wire14[(3'h5):(2'h2)] ?
                          (($unsigned(wire39) <= wire16) <<< (^~reg37[(4'h9):(2'h2)])) : wire14) : ($unsigned(wire40[(1'h1):(1'h1)]) ?
                          reg15[(1'h0):(1'h0)] : $signed(reg34[(4'ha):(1'h0)])));
  assign wire44 = ({$unsigned({(wire43 ? reg36 : reg36), $unsigned(wire16)}),
                          wire10[(3'h4):(2'h3)]} ?
                      (~^(^(^~(reg34 * wire14)))) : ((reg35 - (^~(!reg34))) ?
                          (wire43 > {(wire32 ~^ wire41),
                              (+(8'hb6))}) : ((reg35 ?
                              {(8'h9e)} : {wire17}) < $unsigned(wire13[(4'hc):(2'h3)]))));
  assign wire45 = $signed((((wire17 * $signed(wire14)) ?
                      $signed($signed(wire42)) : $signed($signed(reg35))) ^ ((~&wire39[(2'h3):(1'h1)]) ?
                      wire10[(3'h4):(3'h4)] : wire10)));
endmodule

module module20
#(parameter param31 = (((({(8'hbb), (8'hbb)} ? (+(8'hbd)) : (+(7'h40))) >>> (((8'hab) ? (8'hae) : (8'haf)) < ((8'hbf) ? (8'hbd) : (8'hae)))) ? ((((8'hbd) ? (8'ha0) : (8'h9d)) || ((8'haf) ? (8'haa) : (7'h42))) ? (~(+(8'hb8))) : (!((8'h9c) ? (8'hb7) : (8'hb4)))) : ((!{(8'ha0)}) >= (((8'hbf) << (7'h40)) >> ((7'h44) ? (8'hab) : (8'hb8))))) ? (((((8'hb2) ? (8'hb9) : (8'hb3)) ? ((8'hbc) ? (8'hbc) : (8'ha8)) : (!(8'hb2))) <<< ((~&(8'h9e)) ? ((8'ha2) ? (8'h9c) : (8'hae)) : ((8'ha3) ? (8'hb8) : (8'ha2)))) ? ((~((8'hbd) ? (8'ha4) : (8'hac))) ? (((8'h9c) ? (8'hb5) : (8'h9f)) + (^(8'hae))) : (~|((8'hb6) > (8'hb5)))) : ((&(|(8'h9e))) ? (((7'h44) ? (8'hac) : (8'haa)) && ((8'hba) ^ (8'h9f))) : ((^~(8'hab)) ? {(8'hae), (8'haa)} : ((8'hb1) ? (7'h44) : (8'ha9))))) : (((((8'hb4) ^~ (8'hac)) ? ((8'hbb) ? (7'h43) : (8'hba)) : ((8'hbf) ? (8'ha4) : (8'ha2))) ? (|(^~(8'h9c))) : ((|(8'ha7)) ? ((8'h9d) & (8'hb4)) : ((8'hb9) ? (8'hbb) : (8'hbe)))) | (+{(^~(8'hac)), (+(7'h40))}))))
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire25;
  input wire signed [(3'h6):(1'h0)] wire24;
  input wire signed [(3'h7):(1'h0)] wire23;
  input wire signed [(4'ha):(1'h0)] wire22;
  input wire [(5'h12):(1'h0)] wire21;
  wire [(5'h12):(1'h0)] wire30;
  wire [(3'h4):(1'h0)] wire29;
  wire signed [(5'h13):(1'h0)] wire28;
  wire [(3'h6):(1'h0)] wire27;
  wire signed [(5'h13):(1'h0)] wire26;
  assign y = {wire30, wire29, wire28, wire27, wire26, (1'h0)};
  assign wire26 = wire25[(1'h1):(1'h1)];
  assign wire27 = (wire24 <= $signed($signed((wire22 << (wire23 < (8'ha7))))));
  assign wire28 = wire24;
  assign wire29 = ($signed(wire24) <= {(~(wire21[(4'hc):(2'h2)] <<< {wire21}))});
  assign wire30 = ((wire23[(1'h1):(1'h0)] ?
                          (($unsigned(wire26) >= wire21) ?
                              wire21 : (-wire24)) : $signed((wire27 * (|wire26)))) ?
                      ({wire26[(2'h3):(2'h2)],
                          (wire23[(2'h3):(2'h2)] + $unsigned(wire24))} ^ (wire24[(2'h3):(1'h1)] >> ({wire23,
                          wire25} | wire24))) : (+((wire21 ?
                              (wire29 * wire27) : $unsigned(wire28)) ?
                          {{wire29}} : wire27[(2'h3):(2'h2)])));
endmodule
