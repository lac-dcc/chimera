module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  wire signed [(4'hd):(1'h0)] wire185;
  wire [(3'h5):(1'h0)] wire184;
  wire signed [(3'h6):(1'h0)] wire182;
  wire [(4'hf):(1'h0)] wire181;
  wire signed [(5'h14):(1'h0)] wire180;
  wire signed [(4'h9):(1'h0)] wire179;
  wire signed [(4'hb):(1'h0)] wire178;
  wire signed [(4'h9):(1'h0)] wire174;
  wire [(4'hf):(1'h0)] wire89;
  wire [(5'h13):(1'h0)] wire88;
  wire signed [(5'h14):(1'h0)] wire87;
  wire signed [(4'hf):(1'h0)] wire83;
  wire signed [(4'hf):(1'h0)] wire4;
  wire [(4'hf):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire81;
  wire [(2'h2):(1'h0)] wire176;
  reg [(5'h15):(1'h0)] reg86 = (1'h0);
  reg [(4'hd):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg84 = (1'h0);
  assign y = {wire185,
                 wire184,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire174,
                 wire89,
                 wire88,
                 wire87,
                 wire83,
                 wire4,
                 wire5,
                 wire81,
                 wire176,
                 reg86,
                 reg85,
                 reg84,
                 (1'h0)};
  assign wire4 = {wire1[(3'h6):(2'h3)]};
  assign wire5 = wire2[(5'h10):(5'h10)];
  module6 #() modinst82 (.wire11(wire5), .wire9(wire1), .y(wire81), .wire7(wire0), .wire8(wire2), .clk(clk), .wire10(wire3));
  assign wire83 = $signed($signed((({wire0, wire2} ?
                          (wire2 ? wire5 : wire2) : $signed(wire1)) ?
                      {((8'had) ? (7'h42) : wire0),
                          (wire4 != wire3)} : $unsigned($signed(wire4)))));
  always
    @(posedge clk) begin
      reg84 <= $unsigned($unsigned(wire2));
      reg85 <= ((~(8'hb0)) <= $unsigned(($unsigned($signed(reg84)) << reg84[(3'h5):(3'h4)])));
      reg86 <= wire3;
    end
  assign wire87 = $unsigned(((($unsigned((8'h9d)) ? (-reg85) : $signed(wire5)) ?
                          wire2 : reg86) ?
                      $unsigned({$unsigned(wire83)}) : (-wire81[(4'he):(4'hc)])));
  assign wire88 = wire4[(1'h1):(1'h0)];
  assign wire89 = $unsigned(wire2[(3'h6):(3'h4)]);
  module90 #() modinst175 (.wire94(reg86), .clk(clk), .y(wire174), .wire91(wire87), .wire93(wire89), .wire92(wire1));
  module137 #() modinst177 (.wire140(reg84), .wire142(wire3), .wire141(reg86), .y(wire176), .clk(clk), .wire139(wire0), .wire138(wire88));
  assign wire178 = $signed($signed(wire88[(1'h1):(1'h1)]));
  assign wire179 = ((wire89[(2'h3):(1'h0)] >>> (!(~^$signed(reg86)))) ?
                       $signed(wire174[(3'h5):(2'h3)]) : $unsigned(wire83));
  assign wire180 = ((^~wire178[(4'hb):(1'h1)]) + $unsigned($signed(reg84)));
  assign wire181 = (~({wire3[(3'h7):(3'h6)]} ? reg84[(4'h8):(2'h2)] : wire178));
  module13 #() modinst183 (.wire16(wire4), .wire18(wire0), .wire15(wire3), .y(wire182), .wire17(wire5), .clk(clk), .wire14(reg84));
  assign wire184 = ($signed(wire176[(1'h1):(1'h1)]) || $unsigned($unsigned((~&(~wire83)))));
  assign wire185 = wire0;
endmodule

module module90
#(parameter param172 = ((8'ha4) << ((((^(7'h40)) ? ((8'haf) >= (8'hae)) : ((8'ha4) <= (8'hb1))) ? (((8'hbf) ? (8'hb8) : (8'hbf)) ? ((8'hb7) ? (7'h40) : (7'h40)) : ((8'h9e) ^~ (8'h9f))) : (((8'hb6) == (7'h43)) ? ((8'ha6) ^ (8'ha3)) : (+(8'haa)))) ? ((((8'ha5) ? (7'h40) : (7'h44)) + (^~(8'ha0))) ? (((7'h42) ? (8'hb4) : (8'hba)) != {(8'hb4), (8'hb1)}) : (~&(~^(8'hbe)))) : ((^((8'hbe) != (8'haf))) ? {((8'h9c) << (8'h9f)), {(8'hbe)}} : {{(8'hb1)}}))), 
parameter param173 = (param172 ? ({((^~param172) + (|param172))} && (^((param172 ? (8'ha4) : param172) ? param172 : (^param172)))) : (+{({(8'hb9), param172} ? {param172} : param172), (param172 ~^ (param172 ? (8'hb7) : param172))})))
(y, clk, wire91, wire92, wire93, wire94);
  output wire [(32'hbe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire91;
  input wire signed [(2'h3):(1'h0)] wire92;
  input wire [(4'hf):(1'h0)] wire93;
  input wire signed [(4'hd):(1'h0)] wire94;
  wire [(3'h6):(1'h0)] wire171;
  wire signed [(5'h15):(1'h0)] wire169;
  wire [(5'h14):(1'h0)] wire136;
  wire signed [(4'h9):(1'h0)] wire135;
  wire [(3'h5):(1'h0)] wire134;
  wire [(4'hb):(1'h0)] wire133;
  wire signed [(4'hd):(1'h0)] wire132;
  wire [(4'hf):(1'h0)] wire131;
  wire [(4'h9):(1'h0)] wire130;
  wire signed [(3'h5):(1'h0)] wire95;
  wire [(4'h9):(1'h0)] wire128;
  reg signed [(2'h2):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg97 = (1'h0);
  reg [(5'h14):(1'h0)] reg96 = (1'h0);
  assign y = {wire171,
                 wire169,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire95,
                 wire128,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 (1'h0)};
  assign wire95 = wire93[(4'hd):(1'h0)];
  always
    @(posedge clk) begin
      reg96 <= wire94;
      reg97 <= ((&$unsigned(((wire92 <<< wire92) ?
          (wire92 ? reg96 : (8'ha1)) : (wire93 ?
              reg96 : reg96)))) << $signed(($unsigned((~wire94)) * (&(~&wire93)))));
      reg98 <= (reg97 ?
          (8'ha8) : (~&$signed(((wire95 & wire94) | $unsigned(wire95)))));
      reg99 <= ({$unsigned($unsigned($unsigned(reg96)))} ?
          ((((wire95 ? (8'hba) : wire94) || (^reg96)) ^ {wire95[(3'h4):(1'h1)],
              reg96[(1'h1):(1'h1)]}) >> (((~reg98) ?
              wire91[(5'h10):(1'h1)] : wire94[(4'h8):(1'h0)]) < $unsigned((reg97 ?
              wire93 : wire92)))) : $unsigned((~|(-((8'hb9) <<< wire92)))));
      reg100 <= ((8'hbf) ?
          $signed({$unsigned(wire92), (-wire92)}) : {wire91[(3'h7):(3'h7)]});
    end
  module101 #() modinst129 (.wire105(reg98), .wire103(reg99), .wire102(wire94), .y(wire128), .clk(clk), .wire104(reg97));
  assign wire130 = $unsigned($unsigned($signed((^~((8'ha5) ?
                       wire95 : reg98)))));
  assign wire131 = (({$unsigned($signed(wire130))} ?
                       wire94 : $unsigned((wire130[(3'h4):(1'h0)] ?
                           (-reg98) : $signed(wire92)))) & (^reg97));
  assign wire132 = $unsigned(((~wire91[(4'ha):(1'h0)]) & $unsigned({(wire130 + wire94)})));
  assign wire133 = wire92[(1'h1):(1'h1)];
  assign wire134 = ({wire92,
                       (!$signed(reg98[(5'h11):(5'h11)]))} && ($unsigned(wire131[(4'ha):(2'h3)]) ?
                       reg99[(3'h6):(1'h1)] : $unsigned(wire128)));
  assign wire135 = wire128[(3'h7):(2'h3)];
  assign wire136 = wire130[(1'h1):(1'h0)];
  module137 #() modinst170 (wire169, clk, wire132, reg96, wire133, reg98, reg97);
  assign wire171 = reg100[(1'h1):(1'h0)];
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h9e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire11;
  input wire signed [(5'h10):(1'h0)] wire10;
  input wire signed [(5'h11):(1'h0)] wire9;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire80;
  wire [(5'h15):(1'h0)] wire79;
  wire signed [(3'h5):(1'h0)] wire78;
  wire [(5'h11):(1'h0)] wire77;
  wire [(5'h14):(1'h0)] wire76;
  wire signed [(5'h10):(1'h0)] wire75;
  wire [(5'h13):(1'h0)] wire74;
  wire [(4'he):(1'h0)] wire73;
  wire signed [(4'hb):(1'h0)] wire44;
  wire signed [(4'he):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire71;
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire44,
                 wire12,
                 wire71,
                 (1'h0)};
  assign wire12 = $signed($signed($unsigned($unsigned((&wire7)))));
  module13 #() modinst45 (.wire15(wire12), .y(wire44), .wire16(wire8), .wire18(wire7), .wire14(wire11), .wire17(wire10), .clk(clk));
  module46 #() modinst72 (.wire48(wire12), .clk(clk), .wire50(wire10), .wire51(wire44), .y(wire71), .wire49(wire9), .wire47(wire7));
  assign wire73 = (|({$signed(wire71),
                      $signed(wire9[(5'h10):(1'h1)])} + $signed($unsigned((8'hb1)))));
  assign wire74 = wire44;
  assign wire75 = (|$signed((8'ha2)));
  assign wire76 = $signed(wire71);
  assign wire77 = (wire8[(1'h0):(1'h0)] ?
                      $unsigned($unsigned($unsigned((~|wire76)))) : {$unsigned(wire7[(1'h1):(1'h0)])});
  assign wire78 = wire44[(2'h2):(1'h1)];
  assign wire79 = (8'h9e);
  assign wire80 = $signed(wire76[(2'h3):(2'h3)]);
endmodule

module module46  (y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'hf1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire51;
  input wire signed [(5'h10):(1'h0)] wire50;
  input wire signed [(5'h11):(1'h0)] wire49;
  input wire signed [(4'ha):(1'h0)] wire48;
  input wire [(4'hd):(1'h0)] wire47;
  wire [(3'h7):(1'h0)] wire70;
  wire signed [(2'h3):(1'h0)] wire69;
  wire [(4'hd):(1'h0)] wire68;
  wire [(5'h14):(1'h0)] wire67;
  reg signed [(4'hd):(1'h0)] reg66 = (1'h0);
  reg [(5'h13):(1'h0)] reg65 = (1'h0);
  reg [(4'hb):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg63 = (1'h0);
  reg [(4'hd):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg60 = (1'h0);
  reg [(2'h3):(1'h0)] reg59 = (1'h0);
  reg [(5'h12):(1'h0)] reg58 = (1'h0);
  reg [(5'h13):(1'h0)] reg57 = (1'h0);
  reg [(4'hc):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  reg [(3'h5):(1'h0)] reg52 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((&$signed((~|wire49))))
        begin
          if ((wire47 ?
              (wire49 | $signed(((|(8'ha6)) ?
                  $signed(wire49) : (wire51 ?
                      (8'ha7) : (8'hb7))))) : ($signed({(!wire50)}) + (~&$unsigned($unsigned(wire50))))))
            begin
              reg52 <= wire49[(4'hc):(4'hb)];
            end
          else
            begin
              reg52 <= $unsigned($signed($unsigned({(wire48 == wire48),
                  $signed((8'hb2))})));
              reg53 <= {(~|((+(wire51 ? wire51 : wire49)) & (~^reg52))), reg52};
              reg54 <= (-({$unsigned((wire50 ? wire49 : reg52)),
                  (+(wire51 ?
                      wire50 : wire47))} ~^ $unsigned($unsigned(reg53))));
              reg55 <= (~&$unsigned($signed(({wire50,
                  wire48} > $signed(wire48)))));
              reg56 <= ($unsigned($unsigned((!reg54[(1'h0):(1'h0)]))) ?
                  $signed(($unsigned(reg54[(4'h8):(1'h1)]) && $unsigned($unsigned((7'h42))))) : (wire50 ?
                      ($unsigned((reg54 ?
                          reg55 : reg54)) <<< $signed(reg53)) : {(wire48[(4'h9):(1'h1)] ?
                              $signed(wire47) : (reg52 ? reg53 : reg52))}));
            end
          reg57 <= $unsigned(($unsigned(((wire51 <= reg52) ?
                  ((8'hb1) == reg56) : $unsigned(wire50))) ?
              {(wire51 ?
                      (wire48 ? (8'h9c) : reg52) : (wire49 ?
                          reg52 : reg53))} : (~|((reg53 - reg53) ?
                  $signed((8'h9e)) : (reg54 >> wire51)))));
          if ($signed(reg55))
            begin
              reg58 <= reg56[(3'h4):(3'h4)];
              reg59 <= (((reg58[(4'h8):(1'h1)] ?
                          (((8'hbb) ?
                              reg56 : (8'ha6)) & reg58[(4'ha):(4'h9)]) : ((~(8'hbc)) ?
                              wire47 : (reg53 ? wire48 : wire47))) ?
                      ($signed($signed(wire50)) >> ($signed((8'ha0)) ?
                          reg52 : (reg57 & reg53))) : ((-wire48[(4'h8):(4'h8)]) ?
                          wire48[(3'h7):(1'h0)] : $signed((~wire51)))) ?
                  (!$unsigned({reg55[(1'h0):(1'h0)]})) : wire47);
              reg60 <= {$unsigned((&$unsigned(wire50[(3'h7):(3'h6)])))};
            end
          else
            begin
              reg58 <= {$signed({$signed(((8'h9e) ? reg60 : wire51)), wire51}),
                  ($signed(((reg58 > (8'ha0)) ?
                          (7'h40) : wire51[(2'h2):(2'h2)])) ?
                      $signed(((~wire48) && reg60[(4'ha):(4'h9)])) : reg60[(3'h6):(1'h1)])};
              reg59 <= (-(!reg52));
              reg60 <= (^~$unsigned((((!(8'ha4)) ?
                  {reg59, wire50} : $signed(reg58)) > ($unsigned((8'hb8)) ?
                  $unsigned(wire49) : (reg58 ^ wire49)))));
              reg61 <= ((^$signed((~^reg59))) ?
                  $unsigned((~reg55)) : {({$signed(reg55)} >= wire49), wire51});
            end
          reg62 <= $unsigned(reg52[(1'h1):(1'h1)]);
          reg63 <= wire51[(1'h1):(1'h0)];
        end
      else
        begin
          if ((^~((wire51[(1'h0):(1'h0)] ?
                  reg52[(2'h3):(1'h0)] : {(~&reg55), reg57}) ?
              (8'h9e) : $unsigned((~(^~reg57))))))
            begin
              reg52 <= reg63[(1'h1):(1'h1)];
            end
          else
            begin
              reg52 <= ((((8'had) ?
                  $unsigned((!reg52)) : (reg60 ?
                      (~reg61) : wire49[(2'h2):(2'h2)])) == $signed(wire49[(4'ha):(3'h5)])) <<< (~^({reg56[(4'hc):(2'h2)]} ?
                  (|reg55[(3'h7):(2'h3)]) : $unsigned(((8'haa) ?
                      reg58 : wire48)))));
              reg53 <= ((((8'ha6) ?
                          (wire51 >>> (8'hb0)) : ($signed(reg56) == reg63[(3'h6):(2'h3)])) ?
                      $signed(reg53) : (wire51 ?
                          ((&reg61) ?
                              {(8'ha7),
                                  reg63} : $unsigned((8'hb5))) : $unsigned({reg63}))) ?
                  (~&wire50) : $signed($unsigned($unsigned((8'ha6)))));
              reg54 <= ({reg61,
                      ({reg58, (reg62 ? reg63 : reg63)} ?
                          (~|wire49) : wire49)} ?
                  $signed(($signed(wire49) <= (wire50 ?
                      $signed(reg54) : $unsigned((8'h9e))))) : reg63);
              reg55 <= wire50[(2'h2):(1'h0)];
            end
        end
      reg64 <= $unsigned(reg56[(4'hc):(3'h6)]);
      reg65 <= ({$unsigned($signed($signed(reg64))),
          $unsigned({(~|(8'hb9)),
              $signed(reg53)})} ^~ $unsigned((|$signed(reg57))));
      reg66 <= wire51[(1'h0):(1'h0)];
    end
  assign wire67 = ($unsigned(reg54) ?
                      ($signed({((8'hba) ? reg55 : reg64)}) == wire50) : reg65);
  assign wire68 = reg56[(4'ha):(4'h9)];
  assign wire69 = wire47[(4'h9):(4'h9)];
  assign wire70 = ((^~((-$unsigned(reg59)) > ((reg63 ?
                          (7'h41) : wire50) ~^ reg59[(2'h3):(2'h3)]))) ?
                      wire51 : reg63);
endmodule

module module13
#(parameter param42 = (^({(((8'ha0) ? (8'hba) : (8'ha4)) ? ((8'hb2) ? (8'hb7) : (8'ha1)) : ((8'h9d) ^ (8'had))), ((+(7'h42)) ? ((8'hb5) | (8'ha8)) : (&(8'ha8)))} - (+(-{(8'hb8)})))), 
parameter param43 = ((|(~|((param42 ? param42 : param42) == (-(8'hb2))))) ? ((~param42) > ((|(param42 ? param42 : param42)) ? ((param42 >> param42) >= param42) : ((param42 ? param42 : param42) ? (param42 ? param42 : param42) : (param42 <= param42)))) : {({(param42 < param42), (param42 ? param42 : param42)} ? ((param42 ? param42 : (8'ha6)) ? (param42 && param42) : {param42}) : (7'h41))}))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h11d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire18;
  input wire signed [(4'hf):(1'h0)] wire17;
  input wire [(4'hf):(1'h0)] wire16;
  input wire [(4'he):(1'h0)] wire15;
  input wire [(3'h6):(1'h0)] wire14;
  wire signed [(4'h8):(1'h0)] wire31;
  wire signed [(4'he):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire24;
  wire [(2'h2):(1'h0)] wire19;
  reg signed [(4'he):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg40 = (1'h0);
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg37 = (1'h0);
  reg [(5'h13):(1'h0)] reg36 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire24,
                 wire19,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire19 = wire16[(3'h6):(2'h2)];
  always
    @(posedge clk) begin
      reg20 <= $unsigned($signed((wire18[(4'ha):(2'h3)] << (wire15[(4'h9):(2'h2)] || wire17))));
      reg21 <= $unsigned(wire16);
      reg22 <= $signed(($unsigned(reg20[(4'h8):(1'h0)]) * (($unsigned(wire19) <<< (wire19 ?
          wire18 : wire19)) + $signed((|(8'ha4))))));
      reg23 <= reg21;
    end
  assign wire24 = (reg23 >> $signed($signed($unsigned($signed(wire17)))));
  always
    @(posedge clk) begin
      reg25 <= wire24[(1'h0):(1'h0)];
      reg26 <= (wire24 <<< wire24[(2'h3):(2'h3)]);
      reg27 <= $signed($signed($signed((|wire24))));
      reg28 <= ({{(-(~|wire15))}} < (&((|(reg21 << wire14)) <<< reg21)));
    end
  assign wire29 = $unsigned(reg21);
  assign wire30 = (~|$signed((((wire29 ^ reg22) ?
                      (wire29 ?
                          reg28 : reg28) : (reg21 ^~ wire14)) == reg28[(4'hb):(3'h6)])));
  assign wire31 = $signed((7'h42));
  always
    @(posedge clk) begin
      reg32 <= $signed($unsigned(($unsigned($unsigned(reg26)) + {(~|reg20)})));
      if (($unsigned(($signed(reg28[(1'h1):(1'h0)]) ^~ {((8'ha0) ?
              wire14 : reg21),
          $unsigned(wire19)})) || ($signed(($signed(reg32) + (wire31 ?
              reg27 : reg20))) ?
          ({(~reg28)} >> reg26) : (reg20 - ((reg23 ? reg27 : (8'hb4)) ?
              wire29 : $unsigned(wire17))))))
        begin
          reg33 <= ((reg27[(2'h3):(2'h2)] ?
                  (wire18[(3'h7):(3'h4)] ?
                      $signed($unsigned((8'hb7))) : wire30) : $unsigned(wire31[(3'h4):(1'h0)])) ?
              ($unsigned(($signed(wire31) | (~&reg21))) ?
                  ($signed(((8'h9e) && reg25)) ?
                      wire31[(2'h2):(1'h0)] : wire29[(5'h12):(4'h8)]) : (&($unsigned(wire15) > (7'h40)))) : wire18);
        end
      else
        begin
          if (($unsigned($signed(wire17)) ?
              {(($unsigned(reg23) > (reg32 ?
                      reg23 : reg26)) <<< (&reg23[(4'ha):(3'h5)])),
                  (reg32[(1'h0):(1'h0)] - reg21[(2'h3):(1'h1)])} : $signed(reg27[(2'h2):(2'h2)])))
            begin
              reg33 <= reg27[(1'h0):(1'h0)];
              reg34 <= {reg27, (-$unsigned((~&reg32[(1'h0):(1'h0)])))};
              reg35 <= (-{(($signed(wire17) >> wire14) ?
                      (8'had) : (wire29[(2'h2):(1'h1)] == $unsigned(wire18))),
                  ((~|(^wire17)) ? (^~reg22[(1'h0):(1'h0)]) : (!(^wire24)))});
              reg36 <= ((wire18 + reg32[(1'h0):(1'h0)]) <<< reg22);
              reg37 <= reg34;
            end
          else
            begin
              reg33 <= ((($unsigned((~&reg22)) ?
                      ($unsigned(reg27) - $unsigned((8'haa))) : $unsigned((wire15 ~^ reg34))) ~^ ({(reg27 ?
                              (8'had) : reg26)} ?
                      ((reg36 <<< (8'ha8)) >= (wire24 ?
                          wire19 : (8'ha2))) : ($signed(wire16) >> reg37))) ?
                  $signed((8'hbb)) : reg25);
              reg34 <= reg28[(4'ha):(4'ha)];
              reg35 <= ($signed(({{wire24}} && $signed(((8'h9d) ?
                      wire15 : (8'h9d))))) ?
                  $unsigned((reg33 && (reg33[(2'h3):(1'h0)] ?
                      $signed(reg21) : $unsigned(reg33)))) : $unsigned($signed((~|wire15))));
              reg36 <= reg27;
            end
          reg38 <= reg33[(5'h10):(2'h3)];
        end
      reg39 <= {(~$signed((~|(~|(8'had)))))};
      reg40 <= reg23;
      reg41 <= reg23;
    end
endmodule

module module137
#(parameter param167 = (((({(8'hb3), (8'hac)} ? ((8'hb4) ? (8'haa) : (8'ha4)) : ((8'hb6) ? (8'hbc) : (7'h42))) ? (^{(8'hb9)}) : (~|{(8'hb3), (8'h9f)})) ? {(-(~^(7'h44))), (((8'ha7) <= (7'h41)) ? (^(8'hb9)) : ((8'had) ^~ (8'hb4)))} : {({(8'hae)} ? (8'h9d) : ((7'h44) - (8'hae))), {((8'hbe) >>> (8'had))}}) ? (~{({(8'ha4)} ? ((8'h9e) < (8'ha3)) : ((8'ha6) >> (8'ha2)))}) : ((({(8'ha6), (8'h9e)} ? ((8'hbc) ~^ (7'h43)) : ((8'hba) >> (8'hbf))) ^ (7'h43)) ? (~^(~((7'h44) != (7'h41)))) : {(~|(!(8'haf)))})), 
parameter param168 = ((((^param167) ? (!(~param167)) : param167) + ((~&param167) < {param167, ((7'h41) ? param167 : param167)})) ? ((((param167 ? param167 : param167) < {(8'hae)}) != (param167 ? param167 : param167)) ? {param167} : ({(-param167)} + ((param167 ? param167 : param167) ? param167 : {param167, param167}))) : (8'ha6)))
(y, clk, wire142, wire141, wire140, wire139, wire138);
  output wire [(32'h10c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire142;
  input wire signed [(5'h14):(1'h0)] wire141;
  input wire signed [(4'hb):(1'h0)] wire140;
  input wire signed [(3'h5):(1'h0)] wire139;
  input wire [(5'h13):(1'h0)] wire138;
  wire signed [(4'hc):(1'h0)] wire166;
  wire signed [(3'h6):(1'h0)] wire165;
  wire [(3'h6):(1'h0)] wire164;
  wire signed [(4'ha):(1'h0)] wire161;
  wire signed [(2'h2):(1'h0)] wire152;
  wire [(2'h2):(1'h0)] wire151;
  wire [(4'h8):(1'h0)] wire150;
  wire [(4'hc):(1'h0)] wire147;
  wire signed [(3'h6):(1'h0)] wire143;
  reg [(5'h10):(1'h0)] reg163 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg162 = (1'h0);
  reg [(5'h11):(1'h0)] reg160 = (1'h0);
  reg [(5'h12):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg158 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg156 = (1'h0);
  reg [(3'h6):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg153 = (1'h0);
  reg [(3'h5):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg148 = (1'h0);
  reg signed [(4'he):(1'h0)] reg146 = (1'h0);
  reg [(5'h10):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg144 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire161,
                 wire152,
                 wire151,
                 wire150,
                 wire147,
                 wire143,
                 reg163,
                 reg162,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg149,
                 reg148,
                 reg146,
                 reg145,
                 reg144,
                 (1'h0)};
  assign wire143 = wire142;
  always
    @(posedge clk) begin
      reg144 <= wire139[(3'h5):(3'h4)];
      reg145 <= ((wire142 >> wire140) ?
          (wire142 + $unsigned(wire142[(4'ha):(3'h6)])) : ($signed(((wire143 * (8'hb5)) ?
              $unsigned((8'ha6)) : $signed(reg144))) - wire143));
      reg146 <= wire138;
    end
  assign wire147 = reg144;
  always
    @(posedge clk) begin
      reg148 <= ({$unsigned($signed($unsigned(reg146)))} ?
          {$unsigned((+{wire147, wire142})),
              (((reg144 < wire143) ?
                      (wire142 | wire140) : wire139[(1'h0):(1'h0)]) ?
                  $signed((wire142 ?
                      reg145 : reg145)) : wire143)} : wire139[(3'h4):(2'h2)]);
      reg149 <= ({(((wire143 + wire142) ?
                  wire141 : (reg144 ? reg145 : reg144)) ?
              $signed(wire147) : $unsigned((&reg146))),
          $unsigned(wire140)} < (~^wire138[(2'h3):(1'h0)]));
    end
  assign wire150 = wire143[(2'h3):(2'h2)];
  assign wire151 = $signed(reg146[(4'hc):(2'h3)]);
  assign wire152 = (wire141 ?
                       wire141 : $unsigned($signed($signed((~|reg146)))));
  always
    @(posedge clk) begin
      reg153 <= $unsigned(wire141);
      if ((($signed($signed((wire143 ?
              wire141 : (8'ha2)))) ~^ $unsigned((!(reg149 ?
              wire139 : reg146)))) ?
          ((((|wire151) + $signed(wire143)) ?
                  ($unsigned(wire142) ?
                      ((8'ha7) ? wire143 : wire143) : (wire138 ?
                          wire147 : reg148)) : (~|((8'hbf) ?
                      wire143 : wire143))) ?
              $signed(((-(8'ha4)) ?
                  ((8'hb4) ?
                      wire142 : wire147) : (&reg149))) : (wire141[(4'h8):(3'h5)] ?
                  ((wire142 <<< reg149) ?
                      (reg144 ?
                          reg153 : wire141) : $unsigned((8'h9e))) : $signed(reg149[(2'h2):(2'h2)]))) : wire140[(3'h7):(1'h0)]))
        begin
          reg154 <= reg148[(3'h5):(1'h1)];
        end
      else
        begin
          reg154 <= ((~^($unsigned(reg146) ~^ {$signed(wire152)})) ?
              $signed({(!$unsigned(wire143)),
                  ($signed((8'haf)) ?
                      $signed(reg154) : $unsigned(reg154))}) : wire143);
          if ($signed($unsigned(wire151[(1'h1):(1'h0)])))
            begin
              reg155 <= $unsigned({(-(-(wire150 ? reg154 : reg146))),
                  {($signed(wire147) >>> $signed(reg144))}});
              reg156 <= $signed(reg155[(2'h2):(1'h1)]);
              reg157 <= reg154[(4'h9):(3'h6)];
              reg158 <= wire143[(2'h2):(1'h0)];
            end
          else
            begin
              reg155 <= $unsigned({reg156,
                  (^{(reg149 ? (7'h41) : reg148), {wire147}})});
              reg156 <= wire151[(1'h0):(1'h0)];
              reg157 <= (~^$unsigned($signed(wire151)));
              reg158 <= $unsigned((-$unsigned($signed(reg158))));
            end
        end
      reg159 <= reg158[(2'h3):(2'h2)];
      reg160 <= $unsigned(((~^($unsigned(wire140) != $signed((8'ha7)))) ?
          {(reg153[(3'h5):(1'h0)] ? {wire139, (8'h9f)} : reg159),
              $unsigned((reg149 ? (8'hbe) : (8'hb3)))} : (wire138 ?
              (wire140 ?
                  reg156[(3'h5):(3'h4)] : $signed(reg144)) : $signed((reg154 ?
                  wire139 : (8'h9e))))));
    end
  assign wire161 = $signed($unsigned(reg153));
  always
    @(posedge clk) begin
      reg162 <= wire150;
      reg163 <= (8'hb4);
    end
  assign wire164 = $signed({({(wire143 ? wire139 : (8'hb7)),
                               (reg146 && wire151)} ?
                           $signed((7'h40)) : reg145[(4'h9):(3'h6)])});
  assign wire165 = {(reg154 ? reg149 : reg145)};
  assign wire166 = $unsigned(wire139[(1'h1):(1'h0)]);
endmodule

module module101
#(parameter param126 = (({(!((8'ha5) <= (8'hac))), (((8'h9d) ? (8'ha0) : (8'h9f)) != {(8'ha3), (8'hbb)})} ? (^~{((8'h9e) + (8'hac)), (~&(8'ha3))}) : (&((-(8'haf)) ? {(8'ha4)} : {(8'hae), (8'hb2)}))) ^ (((|{(7'h41), (8'ha4)}) ? {((8'h9e) ? (8'hbc) : (8'hb0)), ((8'ha3) ? (8'hb4) : (8'hb1))} : {((8'ha9) | (8'ha0)), ((8'hb6) >= (8'hba))}) ? ((^((8'ha4) | (8'ha5))) ? {(8'hb5)} : ((&(8'hab)) ~^ ((8'h9f) ? (8'hba) : (8'hb1)))) : ({(8'ha0)} ? (((8'hb2) != (8'hb6)) >> ((8'hb6) + (7'h41))) : (((8'haa) * (8'hb4)) <= {(8'hb0), (8'hb0)})))), 
parameter param127 = (~|param126))
(y, clk, wire105, wire104, wire103, wire102);
  output wire [(32'hee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire105;
  input wire signed [(3'h4):(1'h0)] wire104;
  input wire signed [(3'h7):(1'h0)] wire103;
  input wire signed [(3'h6):(1'h0)] wire102;
  wire signed [(4'hd):(1'h0)] wire119;
  wire signed [(5'h13):(1'h0)] wire118;
  wire [(5'h14):(1'h0)] wire117;
  wire [(4'hc):(1'h0)] wire115;
  wire [(3'h6):(1'h0)] wire114;
  wire [(4'h8):(1'h0)] wire113;
  wire signed [(4'hc):(1'h0)] wire112;
  wire [(5'h12):(1'h0)] wire111;
  wire signed [(2'h3):(1'h0)] wire110;
  wire signed [(4'hb):(1'h0)] wire109;
  wire [(4'hf):(1'h0)] wire108;
  wire [(5'h14):(1'h0)] wire107;
  wire signed [(4'h9):(1'h0)] wire106;
  reg [(3'h4):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg123 = (1'h0);
  reg [(4'h8):(1'h0)] reg122 = (1'h0);
  reg [(3'h4):(1'h0)] reg121 = (1'h0);
  reg [(4'hd):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg116 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire117,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg116,
                 (1'h0)};
  assign wire106 = (wire103[(3'h7):(3'h7)] || ($unsigned($unsigned(wire105[(3'h7):(3'h6)])) >> (!({wire103} ?
                       $signed(wire105) : wire102))));
  assign wire107 = wire105[(4'h9):(3'h5)];
  assign wire108 = $unsigned($signed({(wire102[(1'h1):(1'h1)] ?
                           (|wire105) : {wire102, (8'haa)})}));
  assign wire109 = (wire104 ?
                       (((8'ha1) ?
                           $signed((|wire105)) : $signed((wire102 ?
                               wire107 : wire105))) && $signed(wire106[(3'h6):(3'h4)])) : $unsigned(wire102));
  assign wire110 = ($signed($unsigned(({wire103} << (wire106 ?
                       wire109 : (8'ha3))))) << $unsigned($unsigned(({wire108} ?
                       $signed(wire107) : (&(8'ha2))))));
  assign wire111 = $signed(((~^{wire110[(2'h2):(2'h2)]}) >>> $signed(wire106[(1'h0):(1'h0)])));
  assign wire112 = $unsigned($signed((+{$signed(wire109),
                       (wire102 ? wire109 : wire106)})));
  assign wire113 = ($unsigned($unsigned((wire104[(1'h0):(1'h0)] << $unsigned((8'hb4))))) ?
                       $unsigned(wire112) : wire111);
  assign wire114 = (|(wire107 ^ wire105[(2'h2):(2'h2)]));
  assign wire115 = ((((8'hb8) ? wire107[(4'hb):(4'ha)] : wire111) ?
                       $unsigned(wire111) : (wire113 ?
                           $unsigned((-wire110)) : ({wire106} ?
                               (wire103 && wire110) : {wire103}))) ^~ $unsigned(wire102));
  always
    @(posedge clk) begin
      reg116 <= ((wire103 ?
              $unsigned((wire110[(1'h1):(1'h0)] <= wire112[(3'h7):(3'h4)])) : (wire110 >= (&wire103[(3'h5):(3'h4)]))) ?
          wire109[(3'h7):(3'h6)] : ($signed({wire107[(4'ha):(4'h8)]}) && ($signed((wire108 != wire110)) ?
              wire114[(2'h2):(1'h0)] : (~^(wire109 & wire109)))));
    end
  assign wire117 = (^~wire114[(2'h2):(2'h2)]);
  assign wire118 = ($signed(wire108[(4'h8):(1'h0)]) && {$signed(wire113)});
  assign wire119 = wire107[(3'h5):(3'h5)];
  always
    @(posedge clk) begin
      if ((wire105 * (8'hb5)))
        begin
          reg120 <= (&($unsigned(wire114[(2'h3):(1'h1)]) ~^ wire108));
          if ($unsigned(wire118[(4'ha):(3'h5)]))
            begin
              reg121 <= (wire114 ? wire114 : wire113[(1'h1):(1'h0)]);
              reg122 <= wire102;
            end
          else
            begin
              reg121 <= ((wire108 ?
                  ((!(wire108 < reg120)) ?
                      ($unsigned((8'haf)) ?
                          wire112 : wire104) : $unsigned(((8'hb8) >> wire104))) : wire104[(2'h2):(2'h2)]) ^ (8'hbf));
              reg122 <= ((wire113 >= (wire110 >= $signed((~|wire111)))) ?
                  ($unsigned($unsigned(wire102[(1'h0):(1'h0)])) >> $unsigned((8'haa))) : (&wire110));
              reg123 <= ($unsigned(({{(8'h9f)}} ?
                  wire107 : wire118[(3'h7):(3'h4)])) ^ ($signed($unsigned((8'hb2))) ?
                  wire110 : wire112[(3'h6):(1'h0)]));
              reg124 <= wire112[(3'h7):(3'h5)];
            end
        end
      else
        begin
          reg120 <= wire108;
          if ((^~(wire117 ?
              $signed($signed(reg123[(4'h9):(3'h6)])) : reg122[(2'h2):(2'h2)])))
            begin
              reg121 <= (^~$unsigned(({$signed(wire102),
                  (wire113 << (8'hbb))} >>> (wire118[(2'h3):(1'h0)] ?
                  wire102[(2'h3):(2'h3)] : {(8'hbb), wire102}))));
              reg122 <= wire117[(4'he):(4'h8)];
            end
          else
            begin
              reg121 <= (^~reg116);
            end
          if (wire107)
            begin
              reg123 <= (^($signed(wire106) - ((wire114[(1'h1):(1'h1)] >> $signed(wire108)) ?
                  (~|(7'h42)) : {reg123, reg123})));
              reg124 <= wire114;
              reg125 <= {wire113,
                  {((wire107[(4'hd):(2'h2)] - (~&wire106)) ?
                          (^$unsigned((8'hbf))) : ((reg122 ?
                              reg120 : wire105) || wire114)),
                      (|(wire117[(3'h4):(1'h0)] ^~ (^wire119)))}};
            end
          else
            begin
              reg123 <= (^~(^wire102));
              reg124 <= $unsigned($signed({wire111[(1'h1):(1'h1)]}));
              reg125 <= $signed((~&(^~$signed(wire109[(4'hb):(3'h5)]))));
            end
        end
    end
endmodule
