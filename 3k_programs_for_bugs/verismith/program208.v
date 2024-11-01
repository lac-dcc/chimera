module top
#(parameter param135 = (|{(({(7'h40), (7'h42)} * ((8'hba) ? (8'hb3) : (8'haf))) ? (((8'hb1) ? (8'hb1) : (8'hb4)) ? ((8'hb4) ? (8'ha1) : (8'h9d)) : ((7'h43) ? (8'ha9) : (8'h9d))) : (&((8'hb5) || (8'had)))), ((((8'ha4) != (8'hba)) ? ((8'hb2) >> (8'ha7)) : (-(8'ha8))) ^ ({(7'h43), (7'h43)} - ((8'ha0) + (8'had))))}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  wire [(4'he):(1'h0)] wire134;
  wire [(2'h2):(1'h0)] wire133;
  wire [(5'h12):(1'h0)] wire132;
  wire [(3'h7):(1'h0)] wire131;
  wire signed [(5'h14):(1'h0)] wire130;
  wire [(5'h12):(1'h0)] wire129;
  wire [(4'he):(1'h0)] wire128;
  wire signed [(4'he):(1'h0)] wire126;
  wire [(5'h12):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire36;
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire126,
                 wire38,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire36,
                 (1'h0)};
  assign wire4 = wire1[(3'h5):(1'h0)];
  assign wire5 = wire2[(1'h1):(1'h1)];
  assign wire6 = (~|$signed(wire3[(2'h2):(2'h2)]));
  assign wire7 = $unsigned((&$unsigned((wire3[(5'h12):(3'h7)] ?
                     {wire6} : (wire5 ^ wire0)))));
  assign wire8 = wire2;
  assign wire9 = $signed(($signed(((wire2 >>> (8'ha1)) + (wire3 >> wire6))) & $signed({{(8'h9d),
                         (8'hba)}})));
  assign wire10 = ((~&(~|$unsigned(wire4[(5'h10):(3'h4)]))) != wire7[(2'h2):(1'h1)]);
  module11 #() modinst37 (wire36, clk, wire5, wire3, wire10, wire8, wire1);
  assign wire38 = wire7[(1'h1):(1'h0)];
  module39 #() modinst127 (wire126, clk, wire1, wire38, wire9, wire4);
  assign wire128 = ($unsigned((!wire5[(4'h8):(3'h5)])) == (wire126[(4'he):(3'h7)] ?
                       (~|wire7[(1'h0):(1'h0)]) : wire3[(2'h3):(1'h1)]));
  assign wire129 = {(~&$unsigned({((8'hb9) == wire9)}))};
  assign wire130 = $unsigned($unsigned($unsigned({((8'ha6) ? wire9 : wire9)})));
  assign wire131 = (!wire10);
  assign wire132 = ({(^~$signed((wire5 >>> wire2))),
                       ((wire36[(2'h3):(1'h1)] < (wire5 ?
                           wire130 : wire129)) ^~ $unsigned((^~wire10)))} <= wire5);
  assign wire133 = $unsigned(wire1);
  assign wire134 = wire132;
endmodule

module module39
#(parameter param125 = ((~&(((~^(8'hae)) ? ((8'hbb) - (8'haf)) : (~^(8'h9e))) ~^ (((8'hb1) < (8'had)) < ((8'ha6) ? (8'h9f) : (8'hab))))) ? (~^((!((8'ha6) & (8'ha6))) || (((8'hbf) <= (8'hbd)) > {(8'haa)}))) : (~^((~|{(8'hb8), (8'hb2)}) ? (((8'hb2) ? (8'hbb) : (8'ha8)) * (8'hb3)) : (~|{(8'h9f)})))))
(y, clk, wire40, wire41, wire42, wire43);
  output wire [(32'h247):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire40;
  input wire [(5'h12):(1'h0)] wire41;
  input wire signed [(4'hd):(1'h0)] wire42;
  input wire [(5'h14):(1'h0)] wire43;
  wire signed [(3'h4):(1'h0)] wire124;
  wire [(3'h7):(1'h0)] wire123;
  wire [(5'h13):(1'h0)] wire122;
  wire signed [(5'h12):(1'h0)] wire113;
  wire [(5'h10):(1'h0)] wire112;
  wire signed [(5'h14):(1'h0)] wire111;
  wire [(5'h11):(1'h0)] wire110;
  wire [(5'h13):(1'h0)] wire109;
  wire signed [(4'hd):(1'h0)] wire108;
  wire signed [(4'ha):(1'h0)] wire107;
  wire signed [(4'ha):(1'h0)] wire92;
  wire [(4'he):(1'h0)] wire44;
  wire [(5'h11):(1'h0)] wire45;
  wire [(2'h3):(1'h0)] wire46;
  wire signed [(5'h12):(1'h0)] wire79;
  reg [(4'hf):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg118 = (1'h0);
  reg [(5'h10):(1'h0)] reg117 = (1'h0);
  reg [(5'h10):(1'h0)] reg116 = (1'h0);
  reg [(3'h4):(1'h0)] reg115 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg105 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg102 = (1'h0);
  reg signed [(4'he):(1'h0)] reg101 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg100 = (1'h0);
  reg [(4'hd):(1'h0)] reg99 = (1'h0);
  reg [(4'he):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg97 = (1'h0);
  reg [(2'h3):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg95 = (1'h0);
  reg [(4'hd):(1'h0)] reg94 = (1'h0);
  reg [(3'h4):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg91 = (1'h0);
  reg [(4'hf):(1'h0)] reg90 = (1'h0);
  reg [(3'h6):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg87 = (1'h0);
  reg [(5'h11):(1'h0)] reg86 = (1'h0);
  reg [(4'ha):(1'h0)] reg85 = (1'h0);
  reg [(4'hf):(1'h0)] reg84 = (1'h0);
  reg [(2'h2):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg82 = (1'h0);
  reg [(4'hf):(1'h0)] reg81 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire122,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire92,
                 wire44,
                 wire45,
                 wire46,
                 wire79,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
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
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 (1'h0)};
  assign wire44 = (wire42 ? wire41[(3'h5):(2'h3)] : $unsigned((7'h41)));
  assign wire45 = $signed((wire44 ?
                      wire43[(1'h1):(1'h0)] : ($signed($unsigned(wire40)) ?
                          (wire42 - ((8'hbd) && wire43)) : (^$signed(wire40)))));
  assign wire46 = {((((wire42 ?
                          wire43 : wire44) + (+(8'hb3))) > (-(wire43 != wire43))) >>> wire42),
                      {$unsigned(($unsigned((8'ha4)) ?
                              $signed(wire44) : $signed(wire40)))}};
  module47 #() modinst80 (.wire50(wire43), .wire52(wire40), .wire48(wire45), .clk(clk), .wire49(wire44), .y(wire79), .wire51(wire42));
  always
    @(posedge clk) begin
      reg81 <= (wire41 << wire41[(2'h3):(2'h3)]);
      reg82 <= (wire41 ?
          ((wire79[(2'h2):(1'h0)] || ($signed(wire41) ?
              (wire42 ?
                  wire42 : (8'hb7)) : wire43[(3'h6):(3'h5)])) * (&wire43)) : $signed($unsigned(($signed(reg81) ?
              $unsigned((7'h41)) : $signed(wire40)))));
      reg83 <= ({$signed(wire45[(1'h0):(1'h0)])} ?
          ((~^wire45) >= (~((wire79 > wire46) ?
              wire40 : $unsigned(wire43)))) : {wire45, wire46});
      if ((-((wire44[(1'h0):(1'h0)] ?
              $unsigned((wire44 ? wire44 : wire40)) : {(+wire42),
                  $signed(wire46)}) ?
          wire46[(2'h3):(2'h3)] : ((8'ha9) >>> ((~&wire46) ?
              (~wire45) : wire43)))))
        begin
          reg84 <= wire43;
        end
      else
        begin
          reg84 <= (^$unsigned($unsigned({$signed((8'hab)), (!wire42)})));
          reg85 <= reg81;
          reg86 <= (wire44 ?
              (8'ha2) : (({(reg82 > (8'hb8)), $unsigned(wire45)} <<< ({wire43,
                  reg84} + (wire41 > reg84))) >>> $signed(wire43)));
          reg87 <= (~&((+(^$unsigned(wire79))) ?
              reg86 : $signed(($signed(wire79) ?
                  reg81[(1'h1):(1'h0)] : $signed(wire44)))));
          if ($unsigned({$signed($unsigned({reg87}))}))
            begin
              reg88 <= {((+(8'ha3)) || wire40[(3'h6):(3'h6)]),
                  $signed(((+((8'hac) <= reg86)) || ($signed(reg83) | reg85[(4'h8):(2'h2)])))};
              reg89 <= reg86;
            end
          else
            begin
              reg88 <= $unsigned($unsigned((reg88[(3'h4):(1'h1)] <= reg88)));
              reg89 <= {$signed(($signed($signed(wire79)) < {$unsigned(wire45)}))};
              reg90 <= (+wire46);
            end
        end
      reg91 <= $unsigned(((-(^~(reg87 ~^ wire44))) <= wire40[(3'h6):(3'h6)]));
    end
  assign wire92 = ({((8'hb9) | (wire45 ? (8'h9f) : (reg84 - reg81))),
                          (reg83[(2'h2):(2'h2)] ?
                              $signed(reg85[(3'h5):(2'h3)]) : $signed((reg90 ?
                                  reg82 : wire44)))} ?
                      $unsigned(wire79[(5'h12):(5'h10)]) : $unsigned(($unsigned($signed(reg90)) ?
                          {{wire42, (7'h43)},
                              (reg88 ? reg89 : wire41)} : ({reg86, wire42} ?
                              (~^reg81) : reg81))));
  always
    @(posedge clk) begin
      if (reg89)
        begin
          if ($unsigned({((&reg82[(5'h10):(4'hd)]) ?
                  {reg86, reg88} : ((wire40 <= reg81) & {reg83})),
              (^((reg85 > reg87) - {reg84}))}))
            begin
              reg93 <= reg85[(3'h4):(1'h1)];
            end
          else
            begin
              reg93 <= ((|(!((reg82 & reg87) ?
                  reg85 : {(8'ha8),
                      wire46}))) ~^ $unsigned(reg91[(1'h1):(1'h0)]));
              reg94 <= ({$signed((!$unsigned(wire40))), reg87[(3'h7):(2'h3)]} ?
                  $unsigned((|(~((7'h42) ~^ wire40)))) : (7'h44));
              reg95 <= ((-$signed(wire42)) ?
                  ((~|$unsigned({reg81})) ?
                      ($unsigned((wire42 & (7'h42))) ?
                          $unsigned((~|reg86)) : (^~{reg85})) : $signed($signed((+wire79)))) : $signed(reg86));
              reg96 <= $unsigned($unsigned({reg88[(4'h8):(3'h4)],
                  reg82[(4'h9):(4'h9)]}));
            end
          reg97 <= ({{$signed((reg94 ? (8'h9f) : wire40))},
              reg84} > $unsigned((8'hb3)));
          reg98 <= (($unsigned((reg93[(2'h3):(2'h2)] ?
              $unsigned(reg88) : (8'hbb))) < ($unsigned((wire45 <= reg87)) ?
              wire45[(4'he):(3'h6)] : (((7'h40) ?
                  (8'hb3) : (8'hbe)) * $signed(wire46)))) < (8'hba));
          reg99 <= $unsigned($signed(((reg95 ?
                  wire92[(3'h7):(2'h2)] : (^~reg89)) ?
              (~(reg81 ? reg88 : reg83)) : reg88[(1'h1):(1'h1)])));
        end
      else
        begin
          reg93 <= $unsigned($unsigned(($signed($unsigned(reg98)) ?
              $signed({reg90}) : $unsigned($signed(wire42)))));
          reg94 <= reg96;
          reg95 <= ($signed((+reg88)) == $signed(wire42[(1'h1):(1'h1)]));
          reg96 <= $unsigned(wire40[(4'hc):(4'ha)]);
        end
      if (({{(^~$signed(reg91)), $unsigned(((8'hbb) - wire44))},
              (reg98[(1'h1):(1'h1)] <<< ((wire92 >>> reg94) ?
                  wire42[(4'ha):(2'h3)] : (^~(8'ha0))))} ?
          (~&$unsigned(reg83[(1'h1):(1'h0)])) : (($unsigned(reg97[(2'h3):(2'h3)]) ?
                  $unsigned($unsigned((8'hb2))) : ((wire42 ? reg87 : wire79) ?
                      {reg82} : (reg85 ? reg83 : (8'hac)))) ?
              $unsigned(({reg85, reg89} ?
                  (reg81 >>> reg97) : $unsigned(wire79))) : $unsigned(((~^(8'ha5)) | $signed(wire40))))))
        begin
          reg100 <= reg93[(1'h1):(1'h1)];
        end
      else
        begin
          reg100 <= ((wire46 ?
              $unsigned((~|(reg96 ?
                  reg88 : reg100))) : ((~(wire92 >= (8'ha2))) > wire41)) << $signed({reg89,
              (!$unsigned(reg95))}));
          reg101 <= (reg98[(4'hc):(4'ha)] + reg99[(4'hb):(4'hb)]);
          reg102 <= reg87;
          reg103 <= (~&reg95);
        end
      reg104 <= reg103[(2'h2):(1'h1)];
      reg105 <= ((!$signed($signed($unsigned(wire43)))) ~^ reg97);
      reg106 <= (({((&reg105) ? reg84 : wire40), (^~reg104[(1'h0):(1'h0)])} ?
          (^~(+((8'ha3) ?
              reg102 : wire40))) : {wire79}) | $signed((wire92 >= {wire44,
          $unsigned(reg105)})));
    end
  assign wire107 = (~|reg97);
  assign wire108 = (reg84 > (~^(!$signed((~|reg90)))));
  assign wire109 = ((!(^~reg98[(1'h1):(1'h1)])) ~^ $signed({$unsigned((reg93 >= wire46))}));
  assign wire110 = reg90[(3'h4):(1'h1)];
  assign wire111 = (reg104[(1'h1):(1'h1)] ^~ wire92[(2'h3):(1'h1)]);
  assign wire112 = $unsigned(reg94);
  assign wire113 = $signed({reg94});
  always
    @(posedge clk) begin
      reg114 <= $signed({((~&$unsigned((8'h9e))) ?
              wire92 : wire113[(4'h8):(2'h3)]),
          reg87[(4'he):(4'ha)]});
      if ((((~^reg114[(2'h2):(2'h2)]) ?
          (~|(wire42[(4'hd):(3'h6)] ?
              {reg103} : $signed(wire41))) : $unsigned((+reg91))) | $signed((reg95[(4'hc):(3'h7)] || ((-wire112) ?
          {reg97} : (-wire41))))))
        begin
          reg115 <= (8'hac);
        end
      else
        begin
          reg115 <= reg87[(5'h10):(1'h0)];
          reg116 <= (($signed((8'h9c)) ? reg97 : (!$signed({reg93}))) ?
              (-(reg101[(4'ha):(3'h4)] ?
                  ($signed(wire111) ?
                      reg91[(1'h1):(1'h1)] : (wire109 ?
                          wire44 : reg97)) : (^$unsigned(reg88)))) : (8'hbf));
          reg117 <= $unsigned(($unsigned($unsigned(reg103)) ?
              (!(!(~^wire92))) : (^~{reg87[(5'h10):(4'hd)]})));
          reg118 <= reg105[(3'h5):(2'h3)];
          if ((($unsigned((~(~|reg87))) | ((8'ha7) ?
                  (wire46 ?
                      (reg87 ? (8'hbc) : wire79) : ((8'hbe) ?
                          (8'hbe) : reg91)) : $signed((~|wire43)))) ?
              ((8'hac) | $unsigned(($signed(reg117) ?
                  {reg105,
                      reg116} : $unsigned(wire42)))) : $signed((((|reg101) >> (8'hbe)) == ($signed(reg90) >> reg86)))))
            begin
              reg119 <= $signed(reg118);
              reg120 <= $signed((+$unsigned($signed($signed((8'hb9))))));
            end
          else
            begin
              reg119 <= $unsigned(($unsigned((reg119[(3'h6):(2'h2)] ~^ $signed(wire112))) < (wire79[(4'he):(3'h4)] ?
                  ($unsigned(reg105) >>> $unsigned(reg99)) : ($unsigned(reg118) << (~|reg115)))));
              reg120 <= wire40;
              reg121 <= ($signed($unsigned(($signed(wire44) | $signed(wire41)))) >>> wire112[(4'hd):(4'hd)]);
            end
        end
    end
  assign wire122 = {reg87[(4'hb):(4'h9)],
                       {({{reg84}} ? reg118[(1'h0):(1'h0)] : reg121)}};
  assign wire123 = (($unsigned({$signed(reg104),
                       reg97[(3'h4):(3'h4)]}) == ((reg120 ~^ reg106[(1'h0):(1'h0)]) ?
                       $signed((+wire112)) : {$unsigned(wire44),
                           reg105[(3'h4):(2'h2)]})) == {wire44,
                       reg97[(2'h2):(1'h1)]});
  assign wire124 = $signed({(reg99 <<< reg120[(5'h13):(4'hb)]),
                       $signed((|(reg99 ? reg121 : wire46)))});
endmodule

module module11
#(parameter param34 = (-({(-(~^(8'hb9))), (((8'hac) >> (8'hb4)) ? ((8'hbb) ^ (8'haf)) : ((8'h9f) ? (7'h44) : (7'h44)))} ? (~(^(^~(7'h43)))) : (((8'hae) + ((8'ha0) ? (8'hb0) : (7'h40))) ? (!((7'h40) * (7'h43))) : (!((8'hbb) ? (8'ha5) : (8'ha6)))))), 
parameter param35 = ((param34 && (-param34)) ? param34 : (^((!((7'h40) ? param34 : param34)) << (((8'hbf) << (8'hbe)) - param34)))))
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire16;
  input wire signed [(2'h3):(1'h0)] wire15;
  input wire [(4'h8):(1'h0)] wire14;
  input wire [(3'h5):(1'h0)] wire13;
  input wire signed [(5'h12):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire33;
  wire signed [(4'hd):(1'h0)] wire18;
  wire [(5'h11):(1'h0)] wire17;
  reg [(5'h10):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  assign y = {wire33,
                 wire18,
                 wire17,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire17 = (((wire14 ?
                          $unsigned((~|(8'hbf))) : $unsigned(wire14[(3'h6):(3'h5)])) == $unsigned((~|wire14))) ?
                      (|(+(^~{(8'hae)}))) : (wire16 ?
                          {wire12[(3'h6):(1'h0)],
                              (-{wire14, wire12})} : wire12));
  assign wire18 = (wire15[(2'h2):(1'h1)] & (~&wire17[(3'h5):(3'h4)]));
  always
    @(posedge clk) begin
      reg19 <= ((~|(|(((8'hb6) ^~ (8'hb7)) >>> wire13))) ?
          ({(^~$signed((8'hb0)))} && wire12) : (^wire18));
      reg20 <= wire18[(3'h4):(2'h2)];
      reg21 <= (~^wire12[(5'h10):(4'hc)]);
      if ((^~$unsigned({{(wire15 >>> wire17)},
          (((8'ha4) >> wire16) ? wire13[(1'h1):(1'h1)] : (8'haa))})))
        begin
          if ($unsigned((($signed(wire15) ^ (^~$unsigned(reg19))) ?
              $signed($unsigned((-reg21))) : {((wire12 | reg21) ?
                      (-(7'h43)) : reg19[(1'h0):(1'h0)]),
                  reg19[(5'h12):(1'h0)]})))
            begin
              reg22 <= (($signed((+((8'h9e) | wire12))) >= (8'ha6)) ?
                  $unsigned($signed(($signed(wire13) > reg20))) : (reg20 ?
                      (^~$signed($unsigned(wire18))) : $unsigned(wire15)));
              reg23 <= reg20;
              reg24 <= wire14[(4'h8):(1'h1)];
              reg25 <= wire13;
              reg26 <= {(((+{reg22, reg22}) ?
                          wire14[(1'h0):(1'h0)] : $signed(wire13[(2'h2):(1'h1)])) ?
                      reg21[(4'h9):(1'h1)] : ($unsigned((wire15 && reg20)) < reg23[(2'h3):(2'h2)]))};
            end
          else
            begin
              reg22 <= reg24;
              reg23 <= $unsigned(reg23[(2'h2):(1'h0)]);
              reg24 <= wire14;
              reg25 <= $signed((((!{wire14, wire15}) & $unsigned({wire14,
                      reg20})) ?
                  $unsigned(reg24) : {($unsigned(reg26) ?
                          reg20[(2'h2):(2'h2)] : $signed((8'ha3))),
                      $signed((wire15 ? wire17 : (8'hb5)))}));
              reg26 <= wire18;
            end
          if (wire16[(3'h7):(3'h5)])
            begin
              reg27 <= $signed(({(|$unsigned((8'hb3))), wire15} ?
                  reg19[(3'h4):(2'h2)] : wire17));
              reg28 <= (^~wire18[(4'ha):(3'h6)]);
              reg29 <= $signed(reg27);
              reg30 <= $unsigned(reg29);
            end
          else
            begin
              reg27 <= reg22[(4'hb):(4'ha)];
              reg28 <= $signed($unsigned(wire15[(2'h3):(2'h2)]));
            end
          reg31 <= reg26;
          reg32 <= (+wire15[(2'h3):(1'h0)]);
        end
      else
        begin
          reg22 <= ($unsigned((wire16 ? reg31 : $signed((reg32 << wire12)))) ?
              reg28 : $unsigned(((reg27[(1'h1):(1'h0)] ?
                      reg30 : wire16[(3'h4):(1'h1)]) ?
                  $unsigned(reg24) : $unsigned((~^reg29)))));
        end
    end
  assign wire33 = $unsigned($unsigned(reg31[(4'ha):(4'ha)]));
endmodule

module module47
#(parameter param78 = {{{({(8'hac)} ? ((7'h44) ? (8'hbe) : (8'hae)) : (^~(8'hb4)))}, (+(^~{(8'ha0), (8'ha2)}))}})
(y, clk, wire52, wire51, wire50, wire49, wire48);
  output wire [(32'h106):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire52;
  input wire signed [(4'hd):(1'h0)] wire51;
  input wire [(5'h14):(1'h0)] wire50;
  input wire [(4'he):(1'h0)] wire49;
  input wire [(4'ha):(1'h0)] wire48;
  wire signed [(2'h3):(1'h0)] wire77;
  wire signed [(2'h2):(1'h0)] wire76;
  wire signed [(4'hc):(1'h0)] wire75;
  wire [(4'h8):(1'h0)] wire74;
  wire signed [(2'h3):(1'h0)] wire73;
  wire [(5'h13):(1'h0)] wire72;
  wire [(3'h7):(1'h0)] wire66;
  wire signed [(3'h4):(1'h0)] wire65;
  wire signed [(2'h3):(1'h0)] wire64;
  wire [(3'h7):(1'h0)] wire55;
  wire signed [(5'h10):(1'h0)] wire54;
  wire [(4'h9):(1'h0)] wire53;
  reg signed [(2'h3):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg62 = (1'h0);
  reg [(4'ha):(1'h0)] reg61 = (1'h0);
  reg [(5'h11):(1'h0)] reg60 = (1'h0);
  reg [(4'h8):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(4'hb):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg56 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire66,
                 wire65,
                 wire64,
                 wire55,
                 wire54,
                 wire53,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  assign wire53 = wire50;
  assign wire54 = wire51;
  assign wire55 = $signed((($signed((wire48 << (8'hba))) * wire49[(4'hb):(3'h4)]) >> (8'ha1)));
  always
    @(posedge clk) begin
      reg56 <= $unsigned($unsigned(($unsigned({(8'h9f), wire48}) ?
          wire53 : wire55[(1'h1):(1'h0)])));
      reg57 <= $unsigned({wire50[(4'hf):(2'h2)], reg56[(3'h5):(1'h1)]});
      reg58 <= $unsigned(wire49[(3'h5):(1'h1)]);
      reg59 <= $signed((~^(($unsigned((8'hb3)) >>> $signed(wire49)) ?
          wire53[(4'h8):(1'h0)] : (~&reg56))));
      if ($unsigned(($unsigned(({reg57} ? (+(8'hab)) : wire49)) ?
          (wire48[(2'h2):(1'h0)] ^~ ((wire55 ? wire55 : reg56) ?
              $signed(reg56) : wire51[(3'h5):(3'h4)])) : reg57[(4'h8):(2'h2)])))
        begin
          reg60 <= ($unsigned({$unsigned(wire49[(4'hd):(3'h7)]),
                  {$unsigned(wire50), reg56}}) ?
              $signed($signed($unsigned(wire49))) : ((8'ha3) ^ $unsigned((8'hb1))));
          reg61 <= (($unsigned(($unsigned(wire52) >>> (wire53 + wire50))) - ($unsigned((wire52 & wire52)) ?
              $signed(wire55[(3'h7):(2'h2)]) : wire48[(2'h2):(1'h1)])) >= $signed((+reg58[(2'h2):(1'h1)])));
        end
      else
        begin
          reg60 <= $unsigned($signed($signed((~(wire51 ? wire51 : wire48)))));
          reg61 <= wire51[(3'h7):(3'h7)];
          reg62 <= wire53;
          reg63 <= reg56[(1'h1):(1'h0)];
        end
    end
  assign wire64 = {(8'hae)};
  assign wire65 = $signed(wire54);
  assign wire66 = wire54;
  always
    @(posedge clk) begin
      reg67 <= $unsigned($signed({(~^(wire49 & (8'hb2))),
          (-$unsigned(reg61))}));
      reg68 <= $signed((-reg57[(4'ha):(4'ha)]));
      reg69 <= $unsigned({(reg62[(4'hc):(1'h1)] ?
              (wire50[(4'ha):(3'h6)] ? (wire65 & reg62) : wire52) : reg63)});
      reg70 <= $unsigned((wire65 << {$signed($unsigned(reg57))}));
      reg71 <= ((8'ha8) == $unsigned((+{((8'hb2) ^~ wire48)})));
    end
  assign wire72 = ((((reg57 | $unsigned(wire49)) ?
                              ((8'hac) ?
                                  $signed((8'hbf)) : (^~wire64)) : wire64) ?
                          reg70 : ((^~((8'hb6) ^~ reg57)) ~^ {((8'ha3) ?
                                  wire64 : reg62),
                              (~&reg67)})) ?
                      ((reg58[(4'h9):(3'h6)] & $unsigned((&reg71))) > (($signed(reg59) ?
                          $signed((7'h44)) : (!reg58)) > reg62[(5'h13):(4'hf)])) : reg58[(4'hd):(4'ha)]);
  assign wire73 = (wire53 ?
                      ($signed((^~(^wire64))) ?
                          reg68 : $signed((7'h44))) : ($unsigned(wire48[(1'h1):(1'h1)]) ?
                          reg57[(3'h7):(2'h2)] : (8'hb4)));
  assign wire74 = (^~$unsigned(reg63));
  assign wire75 = {$unsigned(wire73[(2'h3):(1'h0)])};
  assign wire76 = $unsigned($signed(reg57[(2'h3):(1'h0)]));
  assign wire77 = wire73;
endmodule
