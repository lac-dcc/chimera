module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h94):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire120;
  wire signed [(4'hf):(1'h0)] wire119;
  wire signed [(3'h4):(1'h0)] wire118;
  wire signed [(5'h14):(1'h0)] wire117;
  wire [(4'hc):(1'h0)] wire116;
  wire signed [(2'h2):(1'h0)] wire115;
  wire [(2'h2):(1'h0)] wire114;
  wire signed [(5'h14):(1'h0)] wire113;
  wire [(5'h13):(1'h0)] wire112;
  wire signed [(4'he):(1'h0)] wire111;
  wire [(3'h6):(1'h0)] wire109;
  wire signed [(4'hf):(1'h0)] wire5;
  assign y = {wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire109,
                 wire5,
                 (1'h0)};
  assign wire5 = wire0;
  module6 #() modinst110 (.clk(clk), .wire8(wire1), .wire9(wire2), .y(wire109), .wire10(wire4), .wire7(wire5));
  assign wire111 = (~^$unsigned({(((8'hb8) ? (8'ha8) : wire3) << ((8'hb7) ?
                           wire109 : wire3)),
                       wire3}));
  assign wire112 = $signed($signed(wire1[(5'h12):(4'hc)]));
  assign wire113 = ($signed(((wire0[(3'h5):(2'h2)] ?
                           wire3[(4'h8):(3'h6)] : $signed((8'hb7))) == {$signed(wire111)})) ?
                       wire4[(3'h7):(1'h1)] : wire0);
  assign wire114 = ($unsigned({{(8'hb4), {(8'ha1)}},
                       $signed(wire1)}) * {$signed(($signed(wire1) << (8'hb4))),
                       ($unsigned($unsigned((8'ha0))) ?
                           ($signed((8'hbb)) || ((8'hae) ?
                               wire111 : wire5)) : (wire0 >> (8'ha6)))});
  assign wire115 = $unsigned((~|(|$unsigned((wire1 ? wire2 : wire2)))));
  assign wire116 = $unsigned((~($unsigned((wire114 | wire1)) ?
                       ($signed(wire5) ? $unsigned(wire5) : wire5) : ((wire109 ?
                               wire112 : wire1) ?
                           (wire115 == (8'h9d)) : wire113[(4'ha):(3'h4)]))));
  assign wire117 = (+(~|$signed(((wire114 + wire109) ^~ wire112[(3'h6):(2'h2)]))));
  assign wire118 = wire113;
  assign wire119 = $signed((~&wire109[(3'h4):(2'h2)]));
  assign wire120 = {(8'h9d)};
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h1d4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire7;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire signed [(4'ha):(1'h0)] wire9;
  input wire [(4'he):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire91;
  wire [(4'hf):(1'h0)] wire90;
  wire signed [(5'h15):(1'h0)] wire89;
  wire [(3'h4):(1'h0)] wire88;
  wire [(5'h11):(1'h0)] wire87;
  wire signed [(4'hc):(1'h0)] wire83;
  wire signed [(3'h7):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire17;
  wire [(4'hf):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire19;
  wire [(4'he):(1'h0)] wire20;
  wire [(4'hb):(1'h0)] wire21;
  wire signed [(5'h12):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire23;
  wire signed [(3'h5):(1'h0)] wire24;
  wire [(2'h2):(1'h0)] wire81;
  reg [(4'hd):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg106 = (1'h0);
  reg [(5'h10):(1'h0)] reg105 = (1'h0);
  reg [(4'ha):(1'h0)] reg104 = (1'h0);
  reg [(2'h3):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg101 = (1'h0);
  reg [(3'h5):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg98 = (1'h0);
  reg [(3'h4):(1'h0)] reg97 = (1'h0);
  reg [(5'h12):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg95 = (1'h0);
  reg [(5'h10):(1'h0)] reg94 = (1'h0);
  reg [(4'he):(1'h0)] reg93 = (1'h0);
  reg [(4'h8):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg85 = (1'h0);
  reg [(2'h3):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire83,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire81,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg86,
                 reg85,
                 reg84,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= $signed(((wire8[(3'h5):(1'h0)] <= (+(!wire9))) ?
          (|$unsigned((wire8 ? wire9 : wire10))) : wire8[(4'hf):(4'hf)]));
      reg12 <= wire9[(3'h4):(2'h2)];
      reg13 <= $signed({(~&($unsigned((8'haa)) ?
              $unsigned((7'h41)) : (^~wire7))),
          (|reg12[(2'h2):(2'h2)])});
      reg14 <= (reg11 ?
          $signed($signed($signed((wire7 ? reg13 : reg11)))) : reg13);
      reg15 <= reg12[(3'h6):(2'h2)];
    end
  assign wire16 = $signed($unsigned({{(~&reg15)}}));
  assign wire17 = {{{wire8[(4'hd):(1'h0)]}},
                      $unsigned({reg13[(3'h6):(2'h2)], wire10[(4'hc):(4'ha)]})};
  assign wire18 = ((wire9 ^ reg15) == $unsigned((^~((reg14 ? reg13 : wire7) ?
                      $unsigned(reg14) : (&wire9)))));
  assign wire19 = reg11;
  assign wire20 = $signed((wire8 >> {$unsigned((8'hb8)),
                      wire17[(2'h2):(1'h0)]}));
  assign wire21 = wire10[(4'he):(2'h2)];
  assign wire22 = {(&($signed((wire20 ?
                          wire19 : wire9)) && ((wire17 & wire21) != $unsigned((8'hbe))))),
                      ((&((wire18 ? wire18 : (8'h9f)) <<< (reg15 ?
                          (8'haf) : (8'hae)))) | $signed($unsigned((wire18 << (8'ha7)))))};
  assign wire23 = ($unsigned($signed((!wire21[(4'ha):(4'h9)]))) && reg11);
  assign wire24 = ($signed($unsigned(($unsigned(wire23) ?
                      wire19 : (!wire20)))) & {{wire23[(3'h7):(1'h0)],
                          (((8'hae) ^~ (8'hb2)) ~^ reg11[(3'h5):(3'h5)])}});
  module25 #() modinst82 (wire81, clk, reg15, wire21, wire19, wire23);
  assign wire83 = ($unsigned(wire9[(4'h8):(3'h4)]) ?
                      wire10[(4'h9):(4'h9)] : {$signed({(&wire18)}),
                          ($unsigned($signed(wire22)) && {{wire22, reg12}})});
  always
    @(posedge clk) begin
      reg84 <= (8'hb3);
      reg85 <= wire20[(1'h1):(1'h0)];
      reg86 <= $unsigned((~&(~|(8'haa))));
    end
  assign wire87 = reg86[(3'h7):(1'h1)];
  assign wire88 = {wire81[(2'h2):(1'h1)], wire20[(3'h5):(2'h2)]};
  assign wire89 = wire21;
  assign wire90 = ($unsigned(wire20) ?
                      ($unsigned($signed((|reg86))) ?
                          {wire18, {$signed(reg84), wire20}} : {(|(wire20 ?
                                  reg14 : wire7)),
                              {$signed(wire10), (wire81 ^~ wire9)}}) : wire23);
  assign wire91 = wire90[(4'ha):(4'ha)];
  always
    @(posedge clk) begin
      if (({((+(wire91 < wire83)) - reg15[(3'h5):(2'h3)])} ?
          ((wire22[(3'h7):(1'h1)] ?
                  reg13[(4'hd):(4'hc)] : ($signed(reg84) >= wire24)) ?
              ($signed({wire20}) == ((~wire24) ?
                  {(7'h43)} : $unsigned((8'hb1)))) : (!$unsigned($unsigned(wire17)))) : {wire24[(2'h2):(1'h0)]}))
        begin
          reg92 <= $signed(wire24[(3'h5):(1'h1)]);
          reg93 <= (|(wire89 + {wire91[(5'h11):(4'h8)]}));
        end
      else
        begin
          reg92 <= $unsigned((~{($signed(reg14) ?
                  $unsigned(wire89) : $unsigned(wire19)),
              wire81[(2'h2):(1'h1)]}));
          if ($unsigned(wire7[(1'h1):(1'h0)]))
            begin
              reg93 <= $unsigned(((($signed(reg11) >> wire23[(4'h9):(1'h0)]) == $signed((wire24 ?
                  wire21 : wire90))) >> reg84));
              reg94 <= wire17;
              reg95 <= reg11;
              reg96 <= (($signed(wire87) == (wire17 >> ($signed(wire18) <<< (~wire88)))) ?
                  $unsigned(($signed((~|wire18)) ?
                      $unsigned($unsigned(reg14)) : ((wire88 - wire17) ?
                          wire83 : (~wire18)))) : wire9);
            end
          else
            begin
              reg93 <= ($unsigned((~&(|$unsigned(wire88)))) ?
                  wire17[(5'h10):(4'h9)] : (~|(wire91[(4'h8):(2'h2)] ?
                      reg11[(3'h5):(1'h1)] : wire88)));
              reg94 <= ($signed((+$unsigned($signed(wire24)))) ?
                  (-($unsigned((&wire21)) ?
                      ((wire90 & wire91) * $signed(reg13)) : wire90[(4'h9):(2'h2)])) : ((^~($unsigned(reg85) ?
                      (^(8'hb8)) : (reg93 ? wire23 : (7'h42)))) <= wire18));
              reg95 <= (wire89[(4'hd):(2'h3)] >>> (reg93[(2'h3):(1'h1)] ?
                  (~^(8'hb7)) : ({$signed(wire88),
                      reg84[(2'h2):(2'h2)]} * {$unsigned(wire18), (^wire22)})));
              reg96 <= (8'hb4);
            end
        end
      if ($signed(wire90))
        begin
          reg97 <= ($signed($unsigned($signed($signed(wire16)))) > wire10);
          reg98 <= $unsigned(($signed($unsigned($signed(reg96))) > reg86[(4'h8):(3'h5)]));
          if (reg85)
            begin
              reg99 <= ((~wire89[(1'h0):(1'h0)]) == reg96);
              reg100 <= (reg93[(4'h9):(3'h6)] ?
                  reg93[(3'h6):(2'h2)] : ((wire88[(3'h4):(1'h0)] ~^ $unsigned({(8'ha9)})) == reg99[(4'hd):(2'h2)]));
              reg101 <= (wire83 == $signed((($unsigned(wire18) ?
                  ((8'hba) ?
                      wire88 : reg96) : $signed(wire89)) ^ $signed(((8'ha5) && reg100)))));
              reg102 <= $signed(wire17[(4'hf):(1'h0)]);
            end
          else
            begin
              reg99 <= (+reg101);
              reg100 <= $unsigned((~^(($signed((8'hb7)) ?
                  (reg94 != wire10) : (~|(8'hb6))) < {wire10[(2'h2):(1'h0)]})));
              reg101 <= $signed((+(~^((reg85 < wire17) ?
                  $unsigned(reg98) : $unsigned(wire18)))));
              reg102 <= ((-(8'h9d)) >> reg86);
            end
          reg103 <= reg12;
        end
      else
        begin
          reg97 <= $unsigned((reg97 ?
              reg95 : ((^~wire24[(3'h4):(1'h0)]) ?
                  $unsigned($unsigned(reg97)) : reg103[(1'h0):(1'h0)])));
          reg98 <= reg93[(2'h2):(1'h0)];
          if ((wire16[(3'h6):(1'h1)] ?
              (~&$unsigned(reg13[(1'h1):(1'h1)])) : $signed((|wire8))))
            begin
              reg99 <= $signed((+(~|$signed($unsigned(reg93)))));
              reg100 <= reg95;
              reg101 <= (wire90 + (wire9[(1'h0):(1'h0)] ?
                  (^$signed(reg101)) : $signed((~|wire17))));
              reg102 <= reg85[(4'hc):(1'h0)];
              reg103 <= reg94[(4'he):(1'h0)];
            end
          else
            begin
              reg99 <= $signed(wire10);
            end
          reg104 <= {(+(reg84 * $unsigned($unsigned((8'hb7))))),
              (wire20 - (+wire7))};
          reg105 <= $unsigned($signed((((~wire90) ?
                  (wire24 >>> wire87) : $unsigned((8'hba))) ?
              (reg85[(1'h0):(1'h0)] || (+reg84)) : (-{wire88, reg94}))));
        end
      reg106 <= wire22[(3'h7):(3'h5)];
      reg107 <= reg98[(1'h1):(1'h0)];
      reg108 <= ((8'hb3) ? $unsigned($signed(reg105)) : $signed((8'ha5)));
    end
endmodule

module module25
#(parameter param79 = (({{{(8'hac), (8'h9f)}}, (~((8'hbc) ~^ (7'h42)))} ? (!(((8'h9e) ? (8'hb6) : (8'ha5)) ? (8'hb5) : {(8'h9c), (8'h9e)})) : {({(8'hb3), (8'had)} ? ((8'hb0) > (8'hb7)) : ((8'ha9) ? (8'hb9) : (8'hb8)))}) ? ((~(~^{(8'hb6), (8'h9c)})) ? (7'h41) : ((((8'hae) ^~ (8'hbb)) ? ((8'hbe) || (8'ha6)) : ((8'h9c) ? (8'h9c) : (8'hb0))) <= (((7'h41) | (8'hb9)) ? (^~(8'hb7)) : (^~(8'had))))) : (8'hb6)), 
parameter param80 = (8'hb5))
(y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h218):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire29;
  input wire signed [(4'ha):(1'h0)] wire28;
  input wire signed [(3'h4):(1'h0)] wire27;
  input wire [(4'ha):(1'h0)] wire26;
  wire signed [(3'h7):(1'h0)] wire78;
  wire [(4'hb):(1'h0)] wire77;
  wire signed [(4'h9):(1'h0)] wire70;
  wire signed [(3'h6):(1'h0)] wire69;
  wire [(4'hc):(1'h0)] wire68;
  wire signed [(5'h13):(1'h0)] wire67;
  wire [(3'h5):(1'h0)] wire66;
  wire signed [(4'hb):(1'h0)] wire65;
  wire [(3'h7):(1'h0)] wire63;
  wire signed [(4'hf):(1'h0)] wire62;
  wire signed [(3'h6):(1'h0)] wire60;
  wire signed [(3'h6):(1'h0)] wire59;
  wire [(4'he):(1'h0)] wire58;
  wire [(4'h9):(1'h0)] wire32;
  wire signed [(5'h15):(1'h0)] wire31;
  wire [(2'h2):(1'h0)] wire30;
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg [(3'h5):(1'h0)] reg73 = (1'h0);
  reg [(5'h10):(1'h0)] reg72 = (1'h0);
  reg [(5'h13):(1'h0)] reg71 = (1'h0);
  reg [(4'h9):(1'h0)] reg64 = (1'h0);
  reg [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(4'hd):(1'h0)] reg57 = (1'h0);
  reg [(5'h12):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  reg [(4'he):(1'h0)] reg54 = (1'h0);
  reg [(4'hb):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg52 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(5'h10):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg40 = (1'h0);
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire63,
                 wire62,
                 wire60,
                 wire59,
                 wire58,
                 wire32,
                 wire31,
                 wire30,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg64,
                 reg61,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire30 = $signed(wire26[(4'ha):(4'h9)]);
  assign wire31 = wire27;
  assign wire32 = $unsigned($signed((wire29 ?
                      ($signed(wire27) ?
                          $unsigned((8'ha4)) : (wire29 ?
                              (8'hb2) : wire28)) : $signed({wire28}))));
  always
    @(posedge clk) begin
      if (wire31)
        begin
          reg33 <= ($signed(($signed((wire29 && wire31)) ?
              (wire30 >>> wire31[(5'h10):(4'h8)]) : (8'hba))) == ($signed($signed((!wire32))) ~^ wire32[(3'h5):(1'h1)]));
          reg34 <= $signed((-(wire32[(4'h9):(1'h0)] ?
              (wire29[(3'h4):(2'h2)] ~^ $unsigned(wire27)) : {(wire29 || wire31)})));
          reg35 <= {$signed(wire30[(2'h2):(2'h2)]), (~^wire28[(1'h1):(1'h0)])};
        end
      else
        begin
          reg33 <= wire31[(2'h3):(1'h0)];
          reg34 <= ((!(~^((~|reg33) > $unsigned(reg33)))) ^ {(reg35[(2'h2):(2'h2)] ?
                  wire31[(3'h6):(3'h6)] : ((reg33 ^ reg34) ?
                      (wire31 - wire26) : $signed(reg33)))});
          if ((~reg34[(3'h4):(1'h0)]))
            begin
              reg35 <= (wire26[(4'h8):(1'h0)] ?
                  wire29[(5'h12):(4'hb)] : (8'ha6));
              reg36 <= ((reg35 ?
                      ((wire27[(1'h0):(1'h0)] < (~&wire30)) - reg35) : (!(!((8'hb1) ?
                          reg34 : wire30)))) ?
                  $unsigned($signed(wire27)) : wire28);
              reg37 <= $unsigned($unsigned($unsigned(((|reg35) > reg33[(2'h2):(2'h2)]))));
              reg38 <= (8'hbc);
              reg39 <= ((~^$signed(wire28)) ?
                  $signed(wire32) : ({(reg35 ^~ (wire30 ? (8'ha1) : wire31))} ?
                      {{(wire29 + wire32)},
                          $unsigned($signed(wire32))} : (7'h41)));
            end
          else
            begin
              reg35 <= ((^wire26) ?
                  ((~^wire32[(2'h2):(1'h0)]) ?
                      reg33[(2'h3):(1'h0)] : $signed(reg35)) : ((($unsigned((8'hb6)) ?
                          reg38[(1'h0):(1'h0)] : {reg38,
                              wire27}) != {$signed(wire30)}) ?
                      wire32 : ($signed((wire31 >>> wire26)) ~^ ((reg39 ?
                              wire31 : wire31) ?
                          reg34[(4'ha):(1'h0)] : $signed(reg34)))));
              reg36 <= reg36;
              reg37 <= (-(~|(((reg37 ? wire28 : reg34) ?
                  reg37 : wire31) >= ((reg39 ? wire26 : wire27) ?
                  (!reg38) : $unsigned(wire28)))));
            end
          reg40 <= $unsigned(({reg34[(4'h9):(1'h0)]} > $unsigned(wire26)));
        end
      reg41 <= ((reg34 ? $signed((8'ha2)) : reg35[(2'h2):(1'h0)]) ?
          $signed((($signed(reg34) ? $signed(wire26) : {(8'ha7), reg37}) ?
              reg36[(1'h1):(1'h0)] : wire31[(5'h10):(4'hc)])) : $signed(reg40));
      if ({reg36[(2'h3):(1'h1)]})
        begin
          reg42 <= $signed($signed((&wire28[(3'h5):(1'h1)])));
          if (($unsigned($unsigned(wire27[(2'h3):(1'h1)])) ?
              $signed(((reg40 ? $unsigned(reg33) : $unsigned(reg33)) ?
                  $unsigned($signed(wire29)) : wire30)) : wire27[(1'h0):(1'h0)]))
            begin
              reg43 <= $signed($signed((8'hba)));
            end
          else
            begin
              reg43 <= reg40;
              reg44 <= $signed(wire29);
              reg45 <= (((-$unsigned(((8'hb1) ? reg34 : reg44))) ?
                      ($unsigned({(8'h9f)}) ?
                          ($signed(wire32) + $signed((8'ha4))) : $signed(reg43[(4'h8):(3'h4)])) : (~(reg33 ?
                          $signed((8'h9c)) : (reg38 <<< (8'ha0))))) ?
                  $unsigned((wire26 ^ {(^(8'had))})) : wire31);
            end
          reg46 <= wire32;
        end
      else
        begin
          reg42 <= wire26;
          if ($unsigned($unsigned($signed($signed(reg38)))))
            begin
              reg43 <= reg46;
              reg44 <= reg33[(2'h3):(1'h0)];
              reg45 <= (!$unsigned($unsigned({$unsigned(reg44)})));
              reg46 <= wire31[(5'h15):(3'h7)];
              reg47 <= reg38;
            end
          else
            begin
              reg43 <= reg47[(4'ha):(4'h8)];
              reg44 <= (|$unsigned($unsigned($unsigned($signed(reg34)))));
              reg45 <= $unsigned((~((~&(reg33 | reg41)) ?
                  $signed((reg36 ? reg34 : reg43)) : (^(reg34 & (8'haf))))));
            end
          reg48 <= (($unsigned((+{wire26})) ? reg43[(3'h6):(2'h3)] : reg39) ?
              (~&reg44) : reg40);
        end
      if ((!{$unsigned(reg41[(2'h2):(1'h0)])}))
        begin
          reg49 <= wire26;
          reg50 <= reg49;
          if ((reg39 ?
              $signed($signed((^~(reg45 ^~ reg34)))) : ($unsigned($unsigned($signed(wire30))) >> (8'ha6))))
            begin
              reg51 <= (-wire29);
              reg52 <= $signed($signed(reg42[(2'h2):(1'h1)]));
              reg53 <= reg36;
              reg54 <= ($unsigned(wire28) | $signed(({(8'ha4),
                      (reg36 > reg34)} ?
                  reg50[(5'h12):(4'hf)] : (8'ha5))));
            end
          else
            begin
              reg51 <= $unsigned((!($signed((~^wire26)) <= (((8'ha8) >>> wire32) & ((8'hac) ?
                  reg49 : (8'ha6))))));
              reg52 <= wire27[(1'h1):(1'h0)];
            end
          reg55 <= $unsigned($signed((~|(^~{reg35}))));
          reg56 <= ((reg49 < $signed(((&wire31) + $unsigned(wire31)))) >>> ({(reg37[(4'hc):(4'hc)] * $unsigned(reg51)),
              ((^~wire27) ?
                  $unsigned((8'ha3)) : $signed(reg33))} + (+reg45[(4'hc):(4'hc)])));
        end
      else
        begin
          reg49 <= (8'ha8);
          reg50 <= (~|reg52[(1'h0):(1'h0)]);
          reg51 <= $signed(reg41[(4'hb):(4'ha)]);
          reg52 <= reg47;
        end
      reg57 <= (&(^(^~({reg47} ? $unsigned(reg55) : (reg39 ^ reg53)))));
    end
  assign wire58 = reg44[(3'h4):(1'h1)];
  assign wire59 = $signed(($signed($unsigned((reg41 ^~ reg48))) + reg51));
  assign wire60 = $signed(((|(~(~^reg38))) ?
                      reg44 : ({$signed(reg47)} ?
                          (reg51 ? reg52 : $unsigned((8'ha9))) : {(~^reg38),
                              reg33[(2'h3):(1'h0)]})));
  always
    @(posedge clk) begin
      reg61 <= reg47;
    end
  assign wire62 = reg49[(3'h6):(2'h3)];
  assign wire63 = $signed(((({reg54, wire26} ?
                          (~^reg44) : $unsigned(reg47)) ~^ ({reg45, reg43} ?
                          (&wire26) : {reg53})) ?
                      (~^reg43) : reg46));
  always
    @(posedge clk) begin
      reg64 <= $signed((!wire27[(1'h0):(1'h0)]));
    end
  assign wire65 = $signed($signed(($unsigned(((8'hae) | (8'hb6))) ~^ reg47)));
  assign wire66 = $signed({$unsigned($signed(wire27[(2'h3):(2'h2)])),
                      reg42[(1'h1):(1'h1)]});
  assign wire67 = $signed($unsigned(wire28[(3'h7):(2'h2)]));
  assign wire68 = ({(reg42[(4'hd):(4'h8)] ?
                          reg37[(1'h0):(1'h0)] : reg43[(4'h8):(3'h7)]),
                      (reg44 ?
                          (|reg55[(2'h2):(2'h2)]) : (wire27[(2'h2):(1'h1)] ^~ $signed((8'hbb))))} | reg50[(3'h7):(3'h5)]);
  assign wire69 = $signed({reg38});
  assign wire70 = $unsigned((&((^~$signed(reg49)) < (^(+reg38)))));
  always
    @(posedge clk) begin
      if ({({reg41[(1'h0):(1'h0)], $unsigned((reg47 ^ wire31))} ?
              $unsigned((+$signed(wire28))) : ((^~(wire67 ? wire58 : wire60)) ?
                  ($unsigned((8'ha9)) ?
                      wire63 : $unsigned(reg48)) : reg56[(3'h4):(2'h3)]))})
        begin
          if ((|$signed(((~&(reg53 ^ reg44)) ?
              (reg51[(3'h7):(2'h3)] ?
                  (reg51 * wire29) : wire66) : $signed($unsigned(reg48))))))
            begin
              reg71 <= $signed((8'ha5));
              reg72 <= (~^wire31[(5'h11):(2'h3)]);
              reg73 <= reg41;
            end
          else
            begin
              reg71 <= ($signed(reg40) | (^reg38[(2'h3):(2'h2)]));
              reg72 <= $signed(($signed((^(reg46 ~^ reg52))) > reg47));
              reg73 <= wire30;
              reg74 <= reg39[(3'h6):(1'h1)];
              reg75 <= reg56;
            end
        end
      else
        begin
          reg71 <= $signed(reg56[(4'he):(4'h9)]);
        end
      reg76 <= $signed((8'haf));
    end
  assign wire77 = $unsigned($signed($signed($unsigned((wire60 << reg52)))));
  assign wire78 = $unsigned({wire66, (-$signed($unsigned(reg34)))});
endmodule
