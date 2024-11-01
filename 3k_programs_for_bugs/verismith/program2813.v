module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h2d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  wire [(4'hd):(1'h0)] wire120;
  wire [(4'h8):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire118;
  assign y = {wire120, wire4, wire5, wire118, (1'h0)};
  assign wire4 = (8'hb2);
  assign wire5 = ({{(~wire1[(3'h7):(3'h5)])},
                     $signed(((7'h43) ?
                         (~|wire3) : (wire0 ?
                             (7'h42) : (8'haa))))} > $signed($signed(wire1[(3'h6):(2'h2)])));
  module6 #() modinst119 (.y(wire118), .wire7(wire0), .clk(clk), .wire10(wire1), .wire9(wire5), .wire11(wire2), .wire8(wire4));
  assign wire120 = wire4[(3'h7):(1'h1)];
endmodule

module module6
#(parameter param116 = ((((~^((8'haa) << (7'h43))) && (((8'h9f) ? (8'hb7) : (8'ha8)) << ((8'had) ? (8'ha0) : (8'hb0)))) ? {(-((8'ha9) ? (8'ha0) : (8'hbc))), ((8'hbd) ^ ((8'hb4) ? (8'hb3) : (7'h43)))} : ((((8'hac) ? (7'h43) : (8'ha1)) ? ((8'hb8) >> (8'ha8)) : ((8'hbb) << (8'hab))) * {(^(8'hb5)), ((8'ha0) ? (8'had) : (7'h41))})) - (-(+((8'ha0) ? (-(8'h9d)) : (^(7'h41)))))), 
parameter param117 = (((8'hb8) ^ ((~&(param116 ? param116 : param116)) ? ((param116 == param116) <<< param116) : (((8'ha6) ? param116 : (8'hbc)) ? {param116, param116} : param116))) >= ((param116 > ((param116 && param116) ? (-param116) : (param116 ? param116 : (8'hb0)))) != (-param116))))
(y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h26):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire7;
  input wire signed [(4'h8):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire [(5'h13):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire26;
  wire [(3'h7):(1'h0)] wire71;
  wire signed [(4'hc):(1'h0)] wire73;
  wire signed [(3'h4):(1'h0)] wire114;
  assign y = {wire26, wire71, wire73, wire114, (1'h0)};
  module12 #() modinst27 (.wire15(wire9), .y(wire26), .wire14(wire11), .wire13(wire8), .wire16(wire10), .clk(clk));
  module28 #() modinst72 (.wire29(wire11), .clk(clk), .wire30(wire8), .wire32(wire9), .y(wire71), .wire31(wire10));
  assign wire73 = $unsigned(($unsigned({wire10,
                      (wire7 ?
                          (8'ha3) : (8'ha2))}) != $signed({$unsigned(wire11)})));
  module74 #() modinst115 (.wire77(wire10), .y(wire114), .wire75(wire9), .clk(clk), .wire76(wire73), .wire78(wire26), .wire79(wire7));
endmodule

module module74
#(parameter param113 = ((~((((8'hae) ? (8'hb3) : (8'h9f)) && ((8'hae) ? (8'hb2) : (8'hae))) <= {((7'h42) >= (7'h43))})) ? (8'hbd) : (((((8'hab) ? (8'ha6) : (7'h41)) * (&(8'hbf))) == ({(8'hab), (8'hbd)} ? ((7'h40) >> (8'h9e)) : ((8'haf) ^ (8'hb7)))) ? (~&{(!(8'hbc)), ((8'hb3) ^~ (8'h9f))}) : {(8'hb6), (&(~|(8'ha0)))})))
(y, clk, wire79, wire78, wire77, wire76, wire75);
  output wire [(32'h154):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire79;
  input wire [(4'he):(1'h0)] wire78;
  input wire [(4'ha):(1'h0)] wire77;
  input wire [(4'hc):(1'h0)] wire76;
  input wire signed [(4'ha):(1'h0)] wire75;
  wire [(5'h14):(1'h0)] wire112;
  wire signed [(4'hc):(1'h0)] wire111;
  wire signed [(2'h3):(1'h0)] wire110;
  wire [(3'h6):(1'h0)] wire109;
  wire [(3'h5):(1'h0)] wire108;
  wire [(4'h9):(1'h0)] wire107;
  wire signed [(3'h7):(1'h0)] wire106;
  wire signed [(5'h12):(1'h0)] wire97;
  wire signed [(4'ha):(1'h0)] wire96;
  wire [(4'h8):(1'h0)] wire95;
  wire signed [(5'h14):(1'h0)] wire94;
  wire [(5'h12):(1'h0)] wire93;
  wire signed [(4'hf):(1'h0)] wire87;
  wire [(5'h14):(1'h0)] wire86;
  wire signed [(4'hb):(1'h0)] wire85;
  wire [(2'h2):(1'h0)] wire84;
  wire signed [(2'h2):(1'h0)] wire81;
  wire signed [(4'hf):(1'h0)] wire80;
  reg signed [(4'h9):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg104 = (1'h0);
  reg [(5'h15):(1'h0)] reg103 = (1'h0);
  reg [(3'h7):(1'h0)] reg102 = (1'h0);
  reg [(4'hf):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg100 = (1'h0);
  reg [(2'h2):(1'h0)] reg99 = (1'h0);
  reg [(3'h4):(1'h0)] reg98 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg90 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg89 = (1'h0);
  reg [(5'h11):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg82 = (1'h0);
  assign y = {wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire81,
                 wire80,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg83,
                 reg82,
                 (1'h0)};
  assign wire80 = (wire75[(2'h3):(2'h3)] ?
                      $signed($unsigned(wire75[(3'h5):(2'h2)])) : wire75);
  assign wire81 = (($signed({(~&wire80), {wire78}}) <= ((8'hb1) != (((7'h44) ?
                          (8'h9d) : wire76) >> (-wire80)))) ?
                      (~|$unsigned(wire78[(1'h1):(1'h1)])) : (((8'h9d) ?
                              wire75 : (wire75[(4'h8):(3'h5)] ?
                                  (wire76 < wire76) : $signed(wire80))) ?
                          ((~(^wire75)) - ((~|wire76) ?
                              (wire78 || wire80) : {(8'h9e),
                                  wire80})) : $unsigned($signed($unsigned(wire77)))));
  always
    @(posedge clk) begin
      reg82 <= ((-(^wire75[(3'h4):(2'h3)])) ? wire80 : wire75[(3'h4):(2'h2)]);
      reg83 <= (wire79[(2'h3):(2'h2)] ?
          wire78[(3'h7):(3'h5)] : $signed(wire80[(3'h6):(3'h4)]));
    end
  assign wire84 = $signed(wire78[(4'hc):(2'h2)]);
  assign wire85 = (8'ha8);
  assign wire86 = (wire80 * wire84);
  assign wire87 = $signed(wire75[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      if (((~(^~$unsigned(wire76))) | (7'h43)))
        begin
          reg88 <= (&(((wire77[(4'h9):(1'h1)] == $signed(wire76)) ?
              $signed((8'hbf)) : ((8'hba) ?
                  wire86 : ((8'hbd) ?
                      reg82 : wire75))) << $unsigned((wire76[(4'h8):(3'h4)] ?
              (~wire85) : (wire81 ? wire79 : wire76)))));
          reg89 <= (-(|$signed((!$unsigned(wire84)))));
          reg90 <= (|wire86);
        end
      else
        begin
          reg88 <= (wire76 ?
              (|((wire77[(2'h3):(1'h1)] ?
                      (wire78 != (8'hbe)) : (wire87 ? wire75 : wire81)) ?
                  $signed((wire87 ?
                      reg88 : wire84)) : wire76[(4'h8):(2'h2)])) : {wire80});
        end
      reg91 <= (+(wire80 - wire78));
      reg92 <= ((~^$unsigned((reg88 ?
          (^~reg89) : (reg90 ? reg83 : reg83)))) | $signed({$unsigned((wire87 ?
              reg91 : wire80)),
          wire80}));
    end
  assign wire93 = $unsigned({reg88, wire78});
  assign wire94 = reg88[(3'h6):(2'h2)];
  assign wire95 = wire93;
  assign wire96 = ((8'hb6) ?
                      (~&(-$unsigned($unsigned(wire87)))) : $signed(($signed(((8'ha0) ?
                              reg91 : reg89)) ?
                          $unsigned(wire80) : ($signed(reg89) < $signed(wire87)))));
  assign wire97 = wire77;
  always
    @(posedge clk) begin
      reg98 <= $unsigned(wire80);
      reg99 <= wire87[(3'h6):(3'h4)];
      reg100 <= (reg88[(2'h2):(1'h1)] <= (8'hb4));
      if (wire79[(4'hc):(1'h0)])
        begin
          reg101 <= wire95[(2'h2):(1'h1)];
          reg102 <= reg100;
          reg103 <= $unsigned(wire93);
          reg104 <= (wire84[(1'h0):(1'h0)] <<< wire94);
        end
      else
        begin
          reg101 <= (($signed($unsigned((!reg89))) & reg90[(1'h1):(1'h1)]) != $signed($signed(reg104)));
          reg102 <= $signed((reg103[(4'h9):(2'h2)] ?
              reg89[(1'h1):(1'h0)] : reg92[(1'h1):(1'h0)]));
          reg103 <= reg102;
        end
      reg105 <= {reg90};
    end
  assign wire106 = $signed(wire78[(2'h3):(1'h0)]);
  assign wire107 = ({(|((|wire85) ? wire79 : {wire77})),
                       wire85} == (!(!$signed({wire87}))));
  assign wire108 = (reg102[(3'h4):(1'h0)] ?
                       ({wire86[(4'h8):(3'h7)],
                               ($signed((8'hac)) ?
                                   (reg82 > wire94) : wire78[(3'h4):(1'h0)])} ?
                           $signed((((8'ha7) ?
                               (8'hb3) : wire96) ^~ wire93)) : reg83) : {wire78[(3'h7):(3'h5)],
                           {(+reg100[(3'h6):(2'h3)]), $signed((~(8'ha8)))}});
  assign wire109 = wire76;
  assign wire110 = $signed(wire87[(3'h7):(3'h6)]);
  assign wire111 = ((($signed((reg101 ? wire106 : wire95)) ?
                               (reg102[(2'h3):(1'h0)] ?
                                   (wire93 && wire78) : ((8'h9f) ?
                                       wire75 : (8'hb6))) : $signed(wire80[(2'h3):(1'h1)])) ?
                           $unsigned((reg88 <<< $unsigned(reg101))) : $signed($signed(wire110[(1'h1):(1'h1)]))) ?
                       $unsigned((reg91 ?
                           wire79[(5'h11):(3'h7)] : $signed((&wire110)))) : (+reg89[(2'h2):(1'h0)]));
  assign wire112 = ($signed({((wire78 || wire80) < wire109),
                           ($signed(reg88) ?
                               wire76[(1'h1):(1'h0)] : $unsigned(wire87))}) ?
                       {(~^$signed(reg102[(2'h2):(1'h0)])),
                           $signed($signed(reg91[(4'h9):(3'h4)]))} : ($unsigned({(|reg102),
                               reg83[(3'h6):(1'h0)]}) ?
                           $signed((8'hae)) : wire80[(4'hc):(2'h3)]));
endmodule

module module28  (y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h1e0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire32;
  input wire [(4'h9):(1'h0)] wire31;
  input wire signed [(3'h7):(1'h0)] wire30;
  input wire [(3'h7):(1'h0)] wire29;
  wire [(4'ha):(1'h0)] wire65;
  wire [(4'hd):(1'h0)] wire43;
  wire [(4'hf):(1'h0)] wire42;
  wire signed [(4'hf):(1'h0)] wire41;
  wire [(5'h12):(1'h0)] wire40;
  wire signed [(4'hd):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire38;
  wire [(4'h9):(1'h0)] wire37;
  wire [(5'h14):(1'h0)] wire36;
  wire signed [(4'hc):(1'h0)] wire35;
  reg [(4'ha):(1'h0)] reg70 = (1'h0);
  reg [(5'h12):(1'h0)] reg69 = (1'h0);
  reg [(4'h8):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg67 = (1'h0);
  reg [(3'h5):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg62 = (1'h0);
  reg [(4'h9):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(5'h15):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg [(5'h15):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg47 = (1'h0);
  reg [(4'hd):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg45 = (1'h0);
  reg [(5'h11):(1'h0)] reg44 = (1'h0);
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  reg [(5'h11):(1'h0)] reg33 = (1'h0);
  assign y = {wire65,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
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
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg34,
                 reg33,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg33 <= wire32[(1'h0):(1'h0)];
      reg34 <= wire30;
    end
  assign wire35 = (&wire31[(1'h1):(1'h0)]);
  assign wire36 = {wire32};
  assign wire37 = ((!(~{(reg34 && wire36), reg34[(2'h2):(1'h0)]})) ?
                      ($signed(wire35[(4'hb):(4'h9)]) ?
                          wire29 : {wire32[(3'h4):(2'h3)]}) : (^~wire30[(3'h5):(3'h4)]));
  assign wire38 = $unsigned($unsigned((((reg33 < wire32) ?
                      $unsigned(reg34) : wire36) << $signed(reg33))));
  assign wire39 = wire35[(4'ha):(4'ha)];
  assign wire40 = (wire30[(2'h2):(1'h0)] ?
                      $signed({$unsigned(wire30[(3'h4):(3'h4)])}) : (^wire32));
  assign wire41 = wire40;
  assign wire42 = {wire30[(2'h3):(1'h1)]};
  assign wire43 = (&$signed(wire30));
  always
    @(posedge clk) begin
      if ((-wire32))
        begin
          reg44 <= wire29;
          reg45 <= (~&((~^$unsigned({wire30})) ?
              wire40[(4'hd):(3'h6)] : (~&(!reg44[(5'h11):(5'h10)]))));
        end
      else
        begin
          reg44 <= wire31;
          reg45 <= {((7'h41) > (&(!wire43)))};
          reg46 <= ($signed(wire30) ?
              wire36[(1'h0):(1'h0)] : ($unsigned((((8'ha3) || (8'hb8)) < (wire37 | wire43))) ?
                  ((|(wire38 | wire35)) ?
                      wire35 : ($signed((8'hba)) ?
                          $unsigned(wire31) : wire32)) : (wire35[(3'h5):(1'h1)] ?
                      $unsigned(wire42[(2'h2):(1'h0)]) : reg44[(3'h7):(2'h2)])));
        end
      reg47 <= (8'ha6);
    end
  always
    @(posedge clk) begin
      reg48 <= (wire36 << wire40);
      if ((-$unsigned($unsigned(reg48[(4'hc):(1'h1)]))))
        begin
          reg49 <= {$unsigned(reg34[(4'ha):(2'h3)]), $unsigned(wire35)};
        end
      else
        begin
          reg49 <= (reg48 ?
              wire41[(4'ha):(1'h0)] : (wire37 ?
                  {$signed((reg47 != reg33))} : (+(wire37 ?
                      (wire35 ? wire36 : wire32) : (8'hb8)))));
          reg50 <= wire30;
          reg51 <= (&wire43[(4'h8):(2'h2)]);
          reg52 <= {(reg51 ^ ((wire41[(4'h9):(4'h9)] ?
                  wire32 : (^~(8'ha9))) & (&$unsigned((8'h9e))))),
              wire40};
          if ((((7'h43) ?
              (!wire38) : {$signed(reg45[(1'h1):(1'h1)]),
                  $unsigned($signed(wire43))}) - $unsigned($unsigned((~|wire42[(2'h2):(1'h0)])))))
            begin
              reg53 <= ($unsigned($signed((reg44[(3'h6):(1'h0)] ~^ (~&reg44)))) << $signed($unsigned($unsigned((~&(8'haf))))));
              reg54 <= ((8'h9f) - (-$signed($signed(wire37[(1'h1):(1'h1)]))));
              reg55 <= $unsigned(($unsigned(reg48[(3'h6):(3'h6)]) ?
                  (^($signed(wire40) <= (~|wire43))) : $unsigned(wire43[(1'h1):(1'h0)])));
              reg56 <= {$unsigned($unsigned((+reg46[(4'h9):(1'h0)]))),
                  $signed((^~($signed(reg53) ? {wire38} : (8'ha1))))};
              reg57 <= ((((8'hb2) ?
                      reg54[(1'h0):(1'h0)] : ((reg47 <= reg53) - (reg45 ~^ reg45))) ?
                  $signed({(wire37 << wire30),
                      $signed(wire36)}) : $signed(reg54)) + ((($unsigned(reg34) ?
                      wire31[(3'h7):(3'h5)] : (-reg46)) ?
                  $signed((~&wire39)) : (+wire35)) != (reg54[(2'h2):(1'h1)] ?
                  wire29 : $signed($unsigned(wire37)))));
            end
          else
            begin
              reg53 <= ({reg55[(1'h0):(1'h0)], wire39[(3'h4):(2'h3)]} ?
                  $signed({$unsigned(reg55[(1'h1):(1'h1)])}) : wire41);
            end
        end
      if (reg50[(4'h8):(2'h3)])
        begin
          if ($signed({(-$unsigned({reg33, wire39}))}))
            begin
              reg58 <= ((~&wire35) ^ wire29);
            end
          else
            begin
              reg58 <= (-(~^$signed(((wire43 & reg49) ?
                  (reg45 ? reg46 : (8'ha6)) : reg52))));
              reg59 <= ({reg44, (^(~^$unsigned(wire36)))} && $signed(wire29));
              reg60 <= (wire29[(3'h4):(2'h2)] ?
                  $unsigned(wire41[(3'h6):(3'h4)]) : {reg52,
                      ({(wire32 ? reg50 : (8'hab)),
                          (wire35 ? reg47 : wire40)} ^ ($signed(wire31) ?
                          (~|wire37) : (-(8'hb4))))});
              reg61 <= $signed(reg48);
              reg62 <= $signed(reg54);
            end
          reg63 <= {((~(((8'hb5) ? reg53 : reg45) ?
                      $signed(wire43) : ((7'h41) ? reg34 : (8'hb1)))) ?
                  (^reg34) : $signed(reg33[(2'h2):(2'h2)]))};
        end
      else
        begin
          reg58 <= $unsigned((8'ha4));
          reg59 <= {(reg33[(1'h0):(1'h0)] <= $signed($unsigned((wire43 ?
                  reg61 : (8'hbc)))))};
          reg60 <= (8'hbc);
          reg61 <= $unsigned(((+reg63[(4'h8):(3'h4)]) ?
              $unsigned({wire39[(2'h3):(2'h3)],
                  (reg61 >>> wire41)}) : {reg33}));
        end
      reg64 <= $unsigned((-($unsigned((^~wire39)) ~^ (~^(wire32 ?
          reg61 : reg55)))));
    end
  assign wire65 = wire39;
  always
    @(posedge clk) begin
      reg66 <= ((8'haa) ^ (reg44 ?
          $unsigned(((wire32 ? reg61 : wire41) ?
              $unsigned((7'h44)) : $signed(wire30))) : $unsigned(wire30[(1'h0):(1'h0)])));
      if (wire30[(1'h1):(1'h1)])
        begin
          reg67 <= reg52;
          reg68 <= reg56;
          if ((8'hb2))
            begin
              reg69 <= reg46;
              reg70 <= $unsigned(wire41);
            end
          else
            begin
              reg69 <= $unsigned($unsigned($signed($unsigned((wire38 ?
                  reg61 : wire30)))));
            end
        end
      else
        begin
          if (($signed((8'h9f)) ?
              $signed($signed((-(reg58 << reg45)))) : $unsigned($unsigned(reg60))))
            begin
              reg67 <= {$signed({reg62[(1'h1):(1'h0)],
                      ((reg55 ? wire65 : wire35) ?
                          reg60[(3'h7):(2'h3)] : $signed((7'h42)))}),
                  (~^({$signed(reg64)} ~^ reg63[(2'h3):(1'h0)]))};
              reg68 <= ({{$unsigned($unsigned(wire37))}} ?
                  ((-wire32) ^ {wire35[(1'h1):(1'h0)],
                      wire31[(3'h5):(2'h2)]}) : (-$signed(($signed(reg44) + (8'hb4)))));
            end
          else
            begin
              reg67 <= {(&(reg56 < reg52)),
                  $unsigned((reg52 | (~^((8'hb0) > reg54))))};
            end
          reg69 <= (({reg66} & $signed((|(~wire35)))) ? (8'ha0) : wire40);
          reg70 <= $signed($unsigned(((~^(reg58 ?
              wire36 : (8'hae))) < wire37)));
        end
    end
endmodule

module module12
#(parameter param25 = ({(~|{{(8'ha9), (8'hae)}}), (((8'ha6) * ((8'hbd) << (8'hba))) >>> (((8'ha1) ? (8'hb7) : (8'hbe)) ? ((7'h44) ? (7'h44) : (8'h9c)) : ((8'haf) ~^ (7'h43))))} ? ({(&((8'ha5) + (8'ha4)))} ? ({((8'hae) && (8'h9e))} ? (((8'hac) | (8'haf)) != (&(8'hab))) : (-(~|(8'hb2)))) : ((^((8'ha3) ? (8'hb3) : (8'h9d))) >> (((7'h40) ? (8'hb9) : (8'hbb)) ? ((8'hb3) ? (7'h44) : (7'h43)) : (~&(8'hb3))))) : (((8'hb3) ? ((-(8'h9f)) >= (|(8'hac))) : ({(8'hb0)} ? ((8'hb3) ? (8'hbe) : (8'ha2)) : (8'had))) ? (({(8'hab)} ? ((8'hbc) ? (8'ha9) : (8'hbd)) : ((7'h43) - (8'hb4))) || {((7'h43) ? (8'hb4) : (7'h44))}) : ((~^((8'h9e) <<< (8'ha3))) <<< (&(~|(8'hbb)))))))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire16;
  input wire signed [(5'h15):(1'h0)] wire15;
  input wire [(4'hf):(1'h0)] wire14;
  input wire [(4'h8):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire24;
  wire signed [(4'hf):(1'h0)] wire23;
  wire [(4'hc):(1'h0)] wire22;
  wire [(2'h2):(1'h0)] wire18;
  wire [(5'h13):(1'h0)] wire17;
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire22,
                 wire18,
                 wire17,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire17 = (8'hb9);
  assign wire18 = (~((~&wire16) >= wire15));
  always
    @(posedge clk) begin
      reg19 <= ($signed({(8'ha3), (-$unsigned(wire18))}) ?
          ((({wire18, wire16} ? (8'hac) : (-(8'ha0))) ?
              (wire13 <= wire17) : $unsigned({(7'h41),
                  (8'hb9)})) >= $unsigned(wire14)) : (wire14 + (~^$signed((8'hb1)))));
      reg20 <= ((+wire18) ?
          ($unsigned((-(8'hb2))) ^ $signed((wire16 <<< $signed(wire17)))) : ((&($unsigned(wire18) < wire14[(2'h3):(1'h1)])) < {$signed((wire15 <= wire13))}));
      reg21 <= $signed(((wire14[(4'hf):(4'h9)] ?
              {wire17, (+wire14)} : (|{(8'h9c), wire14})) ?
          reg19 : {$unsigned((wire16 ? (8'hb5) : wire16)),
              ($signed(wire15) ? reg19[(4'hc):(2'h3)] : wire15)}));
    end
  assign wire22 = (-(+($unsigned(wire14) ?
                      $unsigned((wire16 ?
                          reg21 : wire18)) : ($unsigned(wire15) ?
                          reg19[(3'h5):(1'h0)] : $unsigned(wire14)))));
  assign wire23 = reg21;
  assign wire24 = reg21;
endmodule
