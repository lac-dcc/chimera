module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h107):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire134;
  wire signed [(5'h14):(1'h0)] wire133;
  wire [(3'h5):(1'h0)] wire132;
  wire [(4'hd):(1'h0)] wire120;
  wire signed [(5'h15):(1'h0)] wire119;
  wire [(4'h9):(1'h0)] wire118;
  wire signed [(5'h12):(1'h0)] wire116;
  wire [(4'hf):(1'h0)] wire5;
  reg [(3'h6):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg129 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg128 = (1'h0);
  reg [(4'h9):(1'h0)] reg127 = (1'h0);
  reg [(5'h13):(1'h0)] reg126 = (1'h0);
  reg [(4'hb):(1'h0)] reg125 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg123 = (1'h0);
  reg [(4'h8):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg4 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire120,
                 wire119,
                 wire118,
                 wire116,
                 wire5,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed($signed({wire3, wire2}));
    end
  assign wire5 = $signed($signed({wire0[(4'hb):(1'h1)]}));
  module6 #() modinst117 (wire116, clk, wire5, wire3, wire0, wire2, reg4);
  assign wire118 = (-{$signed(((reg4 ? wire3 : wire0) * $unsigned(wire1)))});
  assign wire119 = ($signed((((^~wire0) >> wire2) >= {$signed(wire2),
                           {wire3}})) ?
                       $unsigned({((wire1 ?
                               wire1 : wire116) || wire1)}) : wire5);
  assign wire120 = reg4;
  always
    @(posedge clk) begin
      if ((~{(7'h41)}))
        begin
          reg121 <= $signed((~|$signed($unsigned($unsigned(wire118)))));
        end
      else
        begin
          if (((^~$signed(wire3)) | ($signed({$unsigned(wire5),
                  (wire3 < wire119)}) ?
              (reg4 ^ ($unsigned(wire5) ~^ (|wire120))) : $unsigned((!$unsigned(wire3))))))
            begin
              reg121 <= $unsigned($unsigned(($unsigned(wire2[(3'h7):(3'h4)]) ?
                  $unsigned(reg4) : ((wire5 + wire118) > {reg121}))));
              reg122 <= $unsigned((wire0[(4'hb):(4'ha)] * wire5));
              reg123 <= $signed(($signed((8'ha5)) ?
                  (+reg121) : wire5[(1'h1):(1'h1)]));
              reg124 <= wire5;
              reg125 <= (~^(+wire0));
            end
          else
            begin
              reg121 <= ((&(((&(8'ha5)) <= (7'h42)) ~^ (^~(8'hba)))) ?
                  wire119[(4'hf):(1'h0)] : (^~wire116));
              reg122 <= reg121[(5'h11):(3'h5)];
              reg123 <= wire2[(4'h9):(2'h2)];
              reg124 <= $signed(wire1[(1'h1):(1'h1)]);
            end
          reg126 <= (~&$signed((~($signed(wire1) ?
              {wire120, wire120} : $unsigned(wire5)))));
          reg127 <= wire1;
          reg128 <= wire1;
          reg129 <= $unsigned($signed((reg126 ?
              wire2 : wire120[(4'h8):(4'h8)])));
        end
      reg130 <= $signed(wire3[(1'h1):(1'h0)]);
      reg131 <= {($signed(reg127) ?
              $unsigned($signed(reg126)) : $unsigned(wire2[(3'h7):(1'h1)]))};
    end
  assign wire132 = reg123;
  assign wire133 = ($unsigned($signed($signed($unsigned(wire1)))) ?
                       wire132[(1'h1):(1'h1)] : ($signed((reg4 <<< wire2[(3'h7):(1'h0)])) || wire118[(3'h5):(2'h2)]));
  assign wire134 = $unsigned(reg124);
endmodule

module module6
#(parameter param115 = ((^~(~^{((8'hb7) ? (8'hb7) : (8'hbc)), ((8'hb4) ? (8'hbc) : (8'had))})) ? {({((8'hae) ~^ (8'ha8)), ((8'ha6) && (7'h42))} ~^ ((&(8'hbf)) ~^ ((8'hbb) && (8'hb6))))} : {({((8'ha2) ? (8'hb4) : (8'hbb)), (~^(8'hae))} || (-((8'hba) - (8'ha8))))}))
(y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'he8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire7;
  input wire [(5'h11):(1'h0)] wire8;
  input wire signed [(5'h14):(1'h0)] wire9;
  input wire signed [(4'h8):(1'h0)] wire10;
  input wire [(5'h15):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire114;
  wire [(3'h7):(1'h0)] wire113;
  wire signed [(5'h10):(1'h0)] wire106;
  wire [(2'h2):(1'h0)] wire104;
  wire signed [(3'h5):(1'h0)] wire75;
  wire signed [(5'h15):(1'h0)] wire74;
  wire [(4'hd):(1'h0)] wire73;
  wire [(5'h14):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire45;
  wire signed [(4'h9):(1'h0)] wire71;
  reg signed [(3'h4):(1'h0)] reg112 = (1'h0);
  reg [(5'h12):(1'h0)] reg111 = (1'h0);
  reg [(4'hb):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg108 = (1'h0);
  reg [(4'hc):(1'h0)] reg107 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire106,
                 wire104,
                 wire75,
                 wire74,
                 wire73,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire45,
                 wire71,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 (1'h0)};
  assign wire12 = {($unsigned((((8'hbd) ? wire10 : (8'hb4)) <= (wire10 ?
                          wire11 : (8'hb3)))) <= wire11[(4'h9):(3'h4)])};
  assign wire13 = (wire9 ?
                      $signed((($signed(wire10) ?
                          $unsigned(wire10) : $signed(wire9)) || (~^wire7))) : ((({(8'hb3),
                              wire9} >> $unsigned((8'hbc))) ?
                          wire7 : ($signed(wire10) ?
                              $signed((8'ha6)) : (wire8 ?
                                  wire7 : (8'hb3)))) != (wire8 ?
                          ($unsigned((7'h43)) & {wire7, wire8}) : {(wire12 ?
                                  wire8 : wire12)})));
  assign wire14 = ($signed((^~$unsigned($signed(wire11)))) ^ wire8[(1'h1):(1'h0)]);
  assign wire15 = (({wire7[(4'hc):(4'h9)]} ?
                      ($signed(wire10[(2'h3):(2'h2)]) ?
                          wire10 : $signed($signed(wire14))) : wire9[(2'h2):(1'h1)]) | ((~^wire9[(3'h6):(3'h5)]) || (wire11 ^~ $unsigned((wire12 >> wire7)))));
  module16 #() modinst46 (.wire20(wire9), .wire18(wire15), .wire19(wire14), .clk(clk), .y(wire45), .wire17(wire12));
  module47 #() modinst72 (wire71, clk, wire12, wire14, wire13, wire15, wire11);
  assign wire73 = wire12;
  assign wire74 = (wire9 & (~wire45[(1'h1):(1'h1)]));
  assign wire75 = wire9;
  module76 #() modinst105 (.clk(clk), .wire78(wire9), .wire79(wire7), .wire80(wire12), .wire77(wire11), .y(wire104));
  assign wire106 = ($unsigned(({wire7, (wire104 - wire7)} ?
                       wire9 : (wire45 ?
                           (~wire10) : $unsigned(wire75)))) << {$signed(wire13)});
  always
    @(posedge clk) begin
      reg107 <= wire10;
      if ($unsigned((wire8 && $unsigned({wire13[(4'he):(3'h4)], (8'hbc)}))))
        begin
          reg108 <= (+((~&wire45) << $signed(({wire10} > $signed(wire71)))));
          reg109 <= wire71[(4'h8):(3'h7)];
        end
      else
        begin
          reg108 <= (|(+$signed((^~(wire71 ? wire7 : wire75)))));
        end
      reg110 <= wire12;
      if (reg107)
        begin
          reg111 <= wire45;
          reg112 <= (~|($signed($unsigned((^reg108))) | ((wire104[(1'h0):(1'h0)] ?
                  {wire71, wire74} : (wire13 ? wire9 : (8'hab))) ?
              (|reg107) : wire104)));
        end
      else
        begin
          reg111 <= ({(!wire104), reg109[(4'hb):(3'h4)]} * wire73);
          reg112 <= $unsigned(reg108);
        end
    end
  assign wire113 = $unsigned($signed(($signed(wire11) ?
                       (&$unsigned(wire73)) : ((reg109 ?
                           (8'hbd) : reg111) | $signed(reg107)))));
  assign wire114 = wire74[(1'h0):(1'h0)];
endmodule

module module76
#(parameter param103 = ({(~(!{(8'hb7), (8'hb9)})), (({(8'hbc), (8'ha4)} ? ((8'ha1) ? (8'hb8) : (8'hb1)) : ((8'ha1) ? (8'hbe) : (8'h9d))) ? {(&(8'haf))} : (~^{(7'h41), (8'ha1)}))} ? (~({(^(8'haa))} - (((8'hbe) ? (7'h41) : (8'hbb)) >= ((8'haf) ? (8'ha4) : (8'haa))))) : (~^(+(^~((8'hb0) >>> (8'hbf)))))))
(y, clk, wire80, wire79, wire78, wire77);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire80;
  input wire signed [(4'hf):(1'h0)] wire79;
  input wire [(5'h14):(1'h0)] wire78;
  input wire [(4'hf):(1'h0)] wire77;
  wire [(3'h4):(1'h0)] wire91;
  wire [(3'h7):(1'h0)] wire90;
  wire [(4'hc):(1'h0)] wire89;
  wire [(4'h9):(1'h0)] wire88;
  wire [(4'ha):(1'h0)] wire87;
  wire signed [(4'he):(1'h0)] wire86;
  wire [(2'h3):(1'h0)] wire85;
  wire signed [(2'h3):(1'h0)] wire84;
  wire [(5'h13):(1'h0)] wire83;
  wire signed [(4'h9):(1'h0)] wire82;
  wire [(5'h11):(1'h0)] wire81;
  reg signed [(4'hc):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg100 = (1'h0);
  reg [(3'h7):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg98 = (1'h0);
  reg [(4'ha):(1'h0)] reg97 = (1'h0);
  reg [(4'hd):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg95 = (1'h0);
  reg [(2'h2):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg93 = (1'h0);
  reg [(4'hb):(1'h0)] reg92 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
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
                 (1'h0)};
  assign wire81 = $unsigned((wire77[(4'ha):(4'ha)] + (^wire80[(1'h0):(1'h0)])));
  assign wire82 = {((((!wire77) == wire79) * ((wire79 ? wire78 : wire77) ?
                          wire79[(4'hd):(4'ha)] : $signed(wire79))) >>> ($unsigned((wire78 ^ wire81)) ?
                          $signed($signed((8'h9f))) : (((8'hbe) ?
                                  wire78 : (8'ha0)) ?
                              $unsigned(wire79) : (8'hba)))),
                      wire77};
  assign wire83 = (((8'hb4) < $unsigned($signed(wire81[(5'h11):(4'hb)]))) << $signed((-$signed($unsigned(wire82)))));
  assign wire84 = $signed({(8'ha0)});
  assign wire85 = wire84[(2'h2):(1'h1)];
  assign wire86 = {$signed((wire82[(4'h9):(4'h9)] ~^ (|wire78)))};
  assign wire87 = ((($signed($signed(wire79)) < wire85) ?
                      (((wire80 >> wire83) ? (~&wire83) : wire86) ?
                          ((|wire81) != wire81) : (wire86[(4'hc):(3'h7)] ^~ $signed(wire82))) : wire83[(5'h12):(4'hf)]) & (|$unsigned((^wire78))));
  assign wire88 = (7'h40);
  assign wire89 = $signed($unsigned((wire77[(3'h7):(1'h1)] ?
                      ((wire80 << wire88) != {wire85}) : ((wire85 | wire84) * $signed((8'ha5))))));
  assign wire90 = wire89[(4'h8):(3'h7)];
  assign wire91 = $signed($unsigned(wire88[(4'h9):(1'h0)]));
  always
    @(posedge clk) begin
      if ((8'hb5))
        begin
          reg92 <= {({($unsigned(wire77) ? (!wire81) : wire85[(1'h0):(1'h0)]),
                  $signed(wire81)} || {wire90[(2'h3):(2'h3)],
                  $unsigned((-(8'ha1)))}),
              $signed({(~|$unsigned(wire78)),
                  ($unsigned(wire91) ? wire81 : $unsigned(wire78))})};
          reg93 <= wire91[(2'h2):(1'h1)];
          reg94 <= $unsigned(wire81);
          if ($unsigned((~&(($signed(wire84) ? wire80 : $signed(wire81)) ?
              $unsigned((+reg94)) : $unsigned(reg93[(3'h6):(3'h6)])))))
            begin
              reg95 <= reg94;
            end
          else
            begin
              reg95 <= (+$signed((reg93[(4'hd):(3'h5)] + $unsigned(wire80))));
              reg96 <= $unsigned((~(|wire88)));
              reg97 <= ((reg94[(1'h0):(1'h0)] ?
                  $signed(reg94) : reg92[(4'h9):(4'h8)]) <<< (wire81[(4'hf):(4'he)] || (~|(wire79 ?
                  $unsigned(wire91) : $unsigned(wire78)))));
              reg98 <= wire86;
            end
          if (wire84[(2'h2):(1'h0)])
            begin
              reg99 <= ((^~{reg93}) ?
                  $signed($signed(({reg93} ?
                      $unsigned(reg92) : wire81))) : $signed((+((wire89 || (8'hb8)) || (7'h40)))));
              reg100 <= ($signed(wire84) <= ((wire80[(3'h4):(3'h4)] << $unsigned((~wire77))) ?
                  (~^{$unsigned(wire79)}) : $signed(reg99)));
            end
          else
            begin
              reg99 <= reg93;
              reg100 <= $signed(wire82[(2'h3):(1'h0)]);
              reg101 <= $signed($signed(($unsigned((wire80 ^ wire79)) ?
                  $signed((wire83 ? wire84 : wire78)) : $unsigned(wire91))));
            end
        end
      else
        begin
          reg92 <= $unsigned($signed(wire79[(4'hb):(1'h0)]));
        end
      reg102 <= {$signed((-wire88))};
    end
endmodule

module module47
#(parameter param69 = (((-{(|(8'h9f))}) || ((~|((8'had) ^~ (8'hab))) ? (((8'ha6) ? (7'h42) : (8'hac)) << (^(8'had))) : (&((8'h9f) - (8'ha5))))) == (~&((((8'haf) ? (7'h42) : (8'hbe)) ? ((8'ha7) ? (8'hbd) : (8'ha4)) : {(8'haa)}) ? {(8'hb1)} : ({(8'ha3)} ? ((8'hbe) ? (8'ha1) : (7'h40)) : ((8'hae) ? (7'h44) : (8'ha4)))))), 
parameter param70 = (((&((&param69) ? (^~param69) : (|param69))) ? ((+(param69 ? (7'h43) : param69)) >> (+(param69 & param69))) : param69) ? param69 : ((^~param69) ? param69 : param69)))
(y, clk, wire52, wire51, wire50, wire49, wire48);
  output wire [(32'hc5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire52;
  input wire signed [(5'h15):(1'h0)] wire51;
  input wire [(4'he):(1'h0)] wire50;
  input wire [(5'h12):(1'h0)] wire49;
  input wire signed [(5'h15):(1'h0)] wire48;
  wire signed [(3'h6):(1'h0)] wire68;
  wire [(4'h8):(1'h0)] wire67;
  wire [(4'he):(1'h0)] wire66;
  wire [(4'he):(1'h0)] wire65;
  wire signed [(4'h9):(1'h0)] wire64;
  wire [(4'hb):(1'h0)] wire63;
  wire signed [(4'he):(1'h0)] wire62;
  wire signed [(4'h9):(1'h0)] wire61;
  wire signed [(4'hc):(1'h0)] wire60;
  wire [(4'ha):(1'h0)] wire59;
  wire signed [(4'he):(1'h0)] wire58;
  wire [(5'h12):(1'h0)] wire57;
  wire signed [(4'hc):(1'h0)] wire56;
  reg signed [(5'h11):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg [(3'h7):(1'h0)] reg53 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 reg55,
                 reg54,
                 reg53,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg53 <= ($unsigned({$signed($unsigned(wire48))}) > $unsigned({$unsigned((wire50 ^~ wire50)),
          $signed((8'h9e))}));
      reg54 <= (^~$signed(wire48[(4'hb):(1'h0)]));
      reg55 <= (({(wire51 == wire52)} <= $unsigned(($unsigned((7'h42)) ?
          (+wire51) : ((8'ha7) == wire48)))) >= wire50[(2'h3):(2'h2)]);
    end
  assign wire56 = ($unsigned($signed(reg55)) ?
                      ((&$signed($unsigned(wire49))) > $signed({(wire51 | (8'hbd)),
                          $signed(reg53)})) : ($unsigned((~^$signed((7'h43)))) >> (8'hb5)));
  assign wire57 = {(!(wire48 ?
                          ($unsigned(wire51) & {wire49}) : wire56[(4'hc):(4'hb)])),
                      reg55};
  assign wire58 = wire50[(3'h5):(3'h5)];
  assign wire59 = (^~$unsigned({(~(reg55 < wire58)),
                      $signed(wire50[(4'he):(3'h6)])}));
  assign wire60 = wire57[(1'h0):(1'h0)];
  assign wire61 = $unsigned($signed(((~$signed(wire59)) ?
                      wire51[(1'h0):(1'h0)] : (^wire51))));
  assign wire62 = {($signed($signed(reg53[(1'h0):(1'h0)])) + $unsigned($unsigned(wire61))),
                      $unsigned(wire52[(2'h2):(1'h0)])};
  assign wire63 = (-$signed({wire62}));
  assign wire64 = $unsigned(({reg55[(1'h0):(1'h0)]} == ((-(wire59 ?
                          wire52 : wire61)) ?
                      $unsigned($unsigned(wire49)) : $signed($unsigned((7'h44))))));
  assign wire65 = reg55;
  assign wire66 = wire58;
  assign wire67 = wire48[(4'hb):(2'h2)];
  assign wire68 = {($unsigned((wire58[(4'hd):(3'h6)] >> {wire62,
                          wire51})) >>> ($signed({(8'ha6), reg55}) ?
                          (^~(wire61 ?
                              wire57 : reg54)) : (wire61[(3'h6):(1'h1)] ?
                              (~^wire66) : (wire48 ? wire66 : wire64)))),
                      wire64[(3'h5):(1'h0)]};
endmodule

module module16
#(parameter param43 = (({(~&((8'hbb) ? (8'ha3) : (8'hbd))), (((8'ha9) ? (8'hbd) : (8'hbf)) ? ((8'hba) | (8'hab)) : (!(8'haa)))} ? ((((8'haf) ^ (8'hb9)) ? ((7'h43) ? (8'ha2) : (8'ha6)) : ((8'ha6) - (8'hbe))) != ((~|(8'h9d)) ? ((8'hae) ? (8'hbf) : (8'hbe)) : ((7'h44) ? (8'hbe) : (8'ha8)))) : {(((8'ha6) <<< (8'had)) != ((8'haf) ? (8'haa) : (8'h9f)))}) ? ((-((&(8'ha3)) || (|(8'hb6)))) ? {(8'ha7), ({(8'hba), (8'hb8)} ? ((8'hb0) ? (8'h9c) : (8'ha3)) : ((8'hb4) ? (8'hb9) : (8'hbb)))} : (8'hbe)) : {{{(&(8'ha7)), (|(7'h44))}}, ((((7'h43) ? (8'hb1) : (8'ha6)) ? (~&(8'hba)) : {(8'hbe)}) >>> {((7'h40) ? (8'ha1) : (8'ha8))})}), 
parameter param44 = (param43 ? (((~^((8'had) != param43)) ? ((^~(7'h44)) ? param43 : (param43 >> (8'hb3))) : ((param43 < param43) ? {param43} : (param43 ? param43 : param43))) & (param43 ? param43 : ((!param43) >>> (|param43)))) : {(param43 ? (!param43) : (~(param43 ? (8'hb0) : param43))), ((8'hb2) && ((+param43) ? param43 : (&param43)))}))
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h100):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire20;
  input wire signed [(4'hc):(1'h0)] wire19;
  input wire signed [(5'h15):(1'h0)] wire18;
  input wire [(5'h13):(1'h0)] wire17;
  wire [(5'h11):(1'h0)] wire42;
  wire signed [(4'hd):(1'h0)] wire39;
  wire [(3'h4):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire37;
  wire signed [(5'h11):(1'h0)] wire36;
  wire signed [(4'hb):(1'h0)] wire35;
  wire [(2'h3):(1'h0)] wire34;
  wire [(3'h6):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire26;
  wire [(3'h6):(1'h0)] wire25;
  wire [(5'h12):(1'h0)] wire24;
  wire [(2'h2):(1'h0)] wire23;
  wire [(5'h14):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire21;
  reg signed [(4'hd):(1'h0)] reg41 = (1'h0);
  reg [(4'hb):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg [(2'h3):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg signed [(4'he):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  assign y = {wire42,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg41,
                 reg40,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire21 = ((8'ha4) >= ((7'h44) >= wire17[(4'he):(4'ha)]));
  assign wire22 = ($signed(wire17) << wire17[(5'h12):(5'h12)]);
  assign wire23 = wire19[(4'ha):(4'h8)];
  assign wire24 = wire17;
  assign wire25 = $unsigned((wire18[(1'h1):(1'h0)] ?
                      wire17 : (($unsigned(wire19) <= {wire19}) == $signed((wire24 >= wire24)))));
  assign wire26 = $unsigned(wire25[(2'h2):(1'h1)]);
  assign wire27 = wire20[(4'h8):(2'h3)];
  always
    @(posedge clk) begin
      reg28 <= (!$unsigned((wire24 ?
          $unsigned(wire26[(2'h3):(2'h2)]) : ({wire20} ?
              ((8'hb4) ? wire25 : wire23) : wire26))));
      reg29 <= reg28[(3'h4):(1'h0)];
      if ($signed((&wire23)))
        begin
          reg30 <= {wire24};
        end
      else
        begin
          reg30 <= (($signed({$signed(reg29), (wire25 ? wire27 : reg29)}) ?
                  {$signed($signed(reg30)),
                      (!((8'hb2) <<< wire17))} : reg29[(3'h5):(3'h5)]) ?
              (wire21 * (8'hb1)) : reg28[(1'h1):(1'h1)]);
          reg31 <= ($unsigned(($signed($unsigned(wire17)) ?
                  ($signed((8'ha7)) ?
                      {wire20} : $unsigned((8'ha4))) : ($unsigned(wire21) ?
                      wire23[(1'h0):(1'h0)] : (-(8'ha1))))) ?
              (!wire18[(3'h7):(3'h6)]) : (wire22[(4'hc):(2'h3)] >= ($signed((wire24 != wire22)) * (wire18[(3'h7):(1'h0)] & $signed(reg30)))));
        end
      reg32 <= (!$unsigned((wire25[(2'h2):(1'h0)] ^ ($unsigned(wire20) ?
          $unsigned(wire23) : $signed(wire27)))));
      reg33 <= wire26;
    end
  assign wire34 = wire22;
  assign wire35 = wire22;
  assign wire36 = reg29;
  assign wire37 = ((($signed((wire18 | reg31)) ?
                      wire19 : $unsigned($unsigned(reg31))) & wire18) >= $signed(wire17[(3'h6):(3'h6)]));
  assign wire38 = wire18[(3'h7):(3'h7)];
  assign wire39 = ((!{($signed(wire20) | {wire25}),
                      $unsigned((wire21 * (8'hb8)))}) & $unsigned($signed(((wire36 ?
                          wire35 : wire17) ?
                      $signed((7'h43)) : ((8'ha9) <= reg31)))));
  always
    @(posedge clk) begin
      reg40 <= wire34[(2'h2):(1'h0)];
      reg41 <= ($signed(($signed($signed(reg33)) ?
              wire21[(4'hb):(3'h5)] : wire19)) ?
          (~reg33) : ($unsigned((~^(~|wire37))) || (&($signed(reg28) ?
              {wire22} : $signed(reg32)))));
    end
  assign wire42 = $signed((~&(wire35 > wire27)));
endmodule
