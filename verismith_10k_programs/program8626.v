module top
#(parameter param131 = (^(((((8'ha5) ? (8'ha3) : (8'ha7)) ? (!(8'had)) : (8'hb0)) == ((-(8'hbf)) > (~(8'had)))) ? ((^((8'haa) || (8'h9e))) ? (-((8'ha4) != (8'hb9))) : ((&(8'ha0)) || ((8'hb6) >= (8'hae)))) : ((8'haf) ? {(&(8'had)), (^~(8'haf))} : ((&(8'ha2)) < {(8'hb2)})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h13e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire130;
  wire [(4'hd):(1'h0)] wire129;
  wire signed [(4'ha):(1'h0)] wire128;
  wire [(4'ha):(1'h0)] wire127;
  wire [(4'ha):(1'h0)] wire121;
  wire signed [(3'h5):(1'h0)] wire27;
  wire [(5'h15):(1'h0)] wire25;
  wire signed [(5'h15):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire9;
  wire [(3'h5):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire5;
  reg signed [(5'h10):(1'h0)] reg126 = (1'h0);
  reg signed [(4'he):(1'h0)] reg125 = (1'h0);
  reg [(5'h13):(1'h0)] reg124 = (1'h0);
  reg [(5'h12):(1'h0)] reg123 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  assign y = {wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire121,
                 wire27,
                 wire25,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire5,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg6,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 (1'h0)};
  assign wire5 = ($unsigned(({$unsigned(wire4),
                     ((8'hab) ? wire0 : wire0)} < ((&wire0) ?
                     ((8'hb5) ?
                         wire4 : (8'hbb)) : wire1))) ~^ (+$signed(({wire3} + (wire2 ?
                     wire0 : wire3)))));
  always
    @(posedge clk) begin
      reg6 <= ({wire2[(1'h0):(1'h0)],
          wire4} - $unsigned($unsigned($unsigned((~^wire1)))));
    end
  assign wire7 = (~|(8'ha4));
  assign wire8 = $unsigned((wire1[(1'h1):(1'h1)] * (~|($unsigned((8'ha7)) <<< wire7))));
  assign wire9 = wire2;
  assign wire10 = wire1[(2'h3):(1'h0)];
  assign wire11 = $signed(wire7);
  always
    @(posedge clk) begin
      reg12 <= $signed($unsigned((~^wire0)));
      reg13 <= (!(($signed((wire9 ~^ (8'ha3))) - $signed((!wire8))) << reg12[(4'hc):(2'h2)]));
      reg14 <= wire8[(2'h2):(2'h2)];
      reg15 <= $unsigned($unsigned(wire2[(3'h4):(3'h4)]));
    end
  module16 #() modinst26 (.wire17(wire9), .wire19(wire3), .wire18(wire2), .y(wire25), .clk(clk), .wire20(wire7));
  assign wire27 = $signed($unsigned({($unsigned((8'ha1)) >>> wire9)}));
  module28 #() modinst122 (.wire29(wire2), .wire32(wire0), .wire31(reg13), .clk(clk), .y(wire121), .wire33(wire11), .wire30(wire25));
  always
    @(posedge clk) begin
      reg123 <= $signed({(wire121[(3'h5):(1'h1)] ?
              reg15[(1'h0):(1'h0)] : $signed($unsigned(reg14)))});
      reg124 <= {((wire5[(4'h9):(4'h9)] ?
                  (8'hb6) : ($unsigned(wire121) ?
                      (wire10 >= reg6) : (reg12 >>> wire2))) ?
              (wire25 ?
                  wire7[(3'h5):(2'h2)] : ($unsigned(wire7) ?
                      $signed(wire10) : $signed(reg15))) : {{(reg6 & reg13),
                      $unsigned(reg14)},
                  $unsigned((wire121 ? reg123 : reg14))})};
      reg125 <= $unsigned(reg123[(4'h8):(3'h4)]);
      reg126 <= $signed(($unsigned(wire1[(5'h10):(4'ha)]) ?
          (!(reg12[(2'h2):(1'h1)] <<< {(8'hac),
              (8'hb5)})) : (+$signed($unsigned(reg123)))));
    end
  assign wire127 = $unsigned((wire11 < (8'hba)));
  assign wire128 = $signed({(-{$unsigned(reg123)})});
  assign wire129 = wire27[(3'h5):(3'h4)];
  assign wire130 = (({(wire3[(4'he):(1'h0)] != $signed((8'h9d)))} ~^ (reg125[(4'hc):(2'h3)] ?
                       wire11[(5'h12):(5'h10)] : $signed(((8'hac) ?
                           (8'ha3) : wire4)))) >> (+wire129[(3'h6):(1'h1)]));
endmodule

module module28
#(parameter param120 = {((|(((7'h44) * (8'haa)) ? ((8'haf) <= (8'h9d)) : {(7'h43)})) ? (8'hb6) : (((+(8'ha1)) ? ((8'hbf) ? (8'ha9) : (8'ha7)) : ((7'h42) == (8'h9f))) << (((8'haa) ? (8'hab) : (8'hb1)) >> (^~(7'h44)))))})
(y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'he2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire33;
  input wire signed [(5'h14):(1'h0)] wire32;
  input wire signed [(4'he):(1'h0)] wire31;
  input wire signed [(5'h14):(1'h0)] wire30;
  input wire [(5'h13):(1'h0)] wire29;
  wire signed [(4'hd):(1'h0)] wire118;
  wire signed [(3'h4):(1'h0)] wire66;
  wire [(4'h8):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire50;
  reg signed [(5'h14):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg59 = (1'h0);
  reg [(4'hd):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg61 = (1'h0);
  reg signed [(4'he):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  assign y = {wire118,
                 wire66,
                 wire52,
                 wire50,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 (1'h0)};
  module34 #() modinst51 (.wire36(wire33), .y(wire50), .wire37(wire32), .wire38(wire31), .clk(clk), .wire35(wire30));
  assign wire52 = (((~^wire31) ?
                          $unsigned(wire30) : (($signed(wire50) >= (wire50 ?
                              wire31 : wire32)) != (~(^~wire32)))) ?
                      $unsigned($unsigned((~^(wire31 & wire33)))) : wire29);
  always
    @(posedge clk) begin
      reg53 <= $signed(((($unsigned(wire50) ?
          $unsigned(wire31) : $signed(wire52)) == wire52[(2'h3):(2'h3)]) ~^ wire31[(3'h6):(2'h3)]));
      reg54 <= {{$unsigned((|$unsigned(wire52)))},
          $unsigned($unsigned(wire32[(2'h2):(1'h1)]))};
      reg55 <= ((wire33 ~^ reg53) ?
          {($signed((wire30 << (8'hac))) << $signed(((8'hb4) <= wire30))),
              (|wire50[(2'h3):(2'h3)])} : ($unsigned((reg54 ?
                  {wire29, wire32} : (~^(8'hb9)))) ?
              ({(wire33 ? reg54 : wire50)} ?
                  wire30[(5'h14):(4'hc)] : (wire30 ?
                      (8'hb4) : (wire33 ~^ wire30))) : (~|wire32)));
      reg56 <= $signed(wire30[(1'h0):(1'h0)]);
      if ($unsigned(wire30[(4'he):(3'h4)]))
        begin
          reg57 <= reg54[(3'h4):(1'h1)];
          if ($unsigned((($signed($signed((8'hbd))) ?
                  $signed($unsigned(wire30)) : ($unsigned(reg56) >>> (^~wire33))) ?
              reg54 : (&$unsigned($signed(wire30))))))
            begin
              reg58 <= ($unsigned($unsigned(((reg53 ? wire32 : wire30) ?
                      wire33[(1'h1):(1'h0)] : (wire31 == reg56)))) ?
                  reg57[(1'h0):(1'h0)] : {$unsigned($unsigned($unsigned(reg53))),
                      wire32});
              reg59 <= ((~|wire29) ? reg55[(2'h3):(2'h2)] : reg58);
            end
          else
            begin
              reg58 <= $unsigned(wire50);
              reg59 <= {(wire29[(4'he):(4'h9)] && reg56[(3'h6):(1'h0)])};
            end
          if ({{$unsigned(((wire29 ? reg55 : reg57) ?
                      $unsigned((8'ha0)) : reg57[(1'h1):(1'h0)])),
                  $signed($unsigned({wire32}))},
              ((^$signed((8'hbb))) ?
                  {({reg55} ? wire32[(5'h10):(4'h8)] : $unsigned(wire52)),
                      ($signed(wire52) ?
                          (reg56 ?
                              reg55 : wire30) : $signed(wire33))} : wire50[(4'h8):(1'h1)])})
            begin
              reg60 <= $unsigned(wire33[(1'h1):(1'h1)]);
              reg61 <= (^$signed(reg56));
              reg62 <= $unsigned($signed((~&$unsigned({(8'hb1)}))));
            end
          else
            begin
              reg60 <= reg58;
              reg61 <= (((($signed(reg54) < (reg57 ?
                  reg53 : wire32)) ~^ ({wire52} ^~ ((8'haa) ?
                  wire50 : reg59))) >> (reg54 - reg61)) | $unsigned($signed($signed((reg62 && reg53)))));
              reg62 <= reg56[(3'h6):(2'h2)];
              reg63 <= $signed($signed(reg61[(3'h7):(2'h3)]));
            end
          reg64 <= $unsigned(reg62);
          reg65 <= $signed((~^(reg57[(1'h0):(1'h0)] ?
              $unsigned($unsigned(reg64)) : (^~$unsigned(wire30)))));
        end
      else
        begin
          reg57 <= (-($unsigned(((reg61 != reg65) < $unsigned(reg61))) ?
              wire32 : ($signed((reg56 ?
                  (8'h9c) : wire29)) && ($signed(wire30) ?
                  (reg60 ? reg62 : wire50) : (8'h9d)))));
          reg58 <= ($unsigned((((wire33 == wire31) >= $signed(reg63)) << $unsigned($unsigned((8'hb5))))) + wire29);
        end
    end
  assign wire66 = (reg63[(2'h3):(1'h1)] <<< ((reg55[(4'h8):(2'h3)] <= $unsigned(reg57)) ?
                      $unsigned(((reg65 ^~ wire30) ?
                          $unsigned(wire32) : {(8'ha4)})) : (|{(reg59 ?
                              reg58 : reg63)})));
  module67 #() modinst119 (.wire72(reg55), .wire70(reg64), .wire69(reg61), .clk(clk), .wire71(reg65), .y(wire118), .wire68(reg62));
endmodule

module module16  (y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h13):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire20;
  input wire signed [(4'hf):(1'h0)] wire19;
  input wire [(5'h12):(1'h0)] wire18;
  input wire [(4'hb):(1'h0)] wire17;
  wire signed [(2'h2):(1'h0)] wire24;
  wire [(4'ha):(1'h0)] wire23;
  wire [(3'h4):(1'h0)] wire22;
  wire [(2'h2):(1'h0)] wire21;
  assign y = {wire24, wire23, wire22, wire21, (1'h0)};
  assign wire21 = (~wire18);
  assign wire22 = $signed((~(~&wire20[(1'h0):(1'h0)])));
  assign wire23 = $signed((7'h43));
  assign wire24 = $signed(wire20);
endmodule

module module67
#(parameter param117 = (7'h42))
(y, clk, wire72, wire71, wire70, wire69, wire68);
  output wire [(32'h1ec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire72;
  input wire signed [(5'h15):(1'h0)] wire71;
  input wire [(4'he):(1'h0)] wire70;
  input wire [(4'hf):(1'h0)] wire69;
  input wire signed [(4'he):(1'h0)] wire68;
  wire signed [(2'h2):(1'h0)] wire116;
  wire signed [(4'hd):(1'h0)] wire115;
  wire signed [(4'he):(1'h0)] wire101;
  wire signed [(3'h6):(1'h0)] wire100;
  wire [(4'h8):(1'h0)] wire99;
  wire [(5'h11):(1'h0)] wire98;
  wire signed [(4'hf):(1'h0)] wire97;
  wire [(4'hc):(1'h0)] wire96;
  wire signed [(5'h12):(1'h0)] wire86;
  wire signed [(4'h8):(1'h0)] wire85;
  wire [(2'h3):(1'h0)] wire84;
  wire [(3'h5):(1'h0)] wire83;
  wire [(3'h6):(1'h0)] wire82;
  wire [(4'h9):(1'h0)] wire81;
  wire [(5'h11):(1'h0)] wire80;
  wire [(3'h6):(1'h0)] wire79;
  wire [(4'h9):(1'h0)] wire76;
  wire [(4'hf):(1'h0)] wire75;
  wire signed [(5'h12):(1'h0)] wire74;
  wire [(3'h5):(1'h0)] wire73;
  reg signed [(5'h15):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg113 = (1'h0);
  reg [(3'h6):(1'h0)] reg112 = (1'h0);
  reg [(4'hf):(1'h0)] reg111 = (1'h0);
  reg [(4'hb):(1'h0)] reg110 = (1'h0);
  reg [(2'h2):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg108 = (1'h0);
  reg [(4'ha):(1'h0)] reg107 = (1'h0);
  reg [(4'hf):(1'h0)] reg106 = (1'h0);
  reg [(4'ha):(1'h0)] reg105 = (1'h0);
  reg [(4'he):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg102 = (1'h0);
  reg [(5'h11):(1'h0)] reg95 = (1'h0);
  reg [(4'he):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg91 = (1'h0);
  reg [(5'h11):(1'h0)] reg90 = (1'h0);
  reg [(4'hb):(1'h0)] reg89 = (1'h0);
  reg [(4'hc):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg77 = (1'h0);
  assign y = {wire116,
                 wire115,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg78,
                 reg77,
                 (1'h0)};
  assign wire73 = (^~(((wire72[(5'h13):(1'h1)] ?
                              wire72[(5'h10):(4'ha)] : wire70) ?
                          {$signed(wire72)} : ($signed((8'ha6)) ?
                              wire72[(4'h8):(1'h1)] : $signed((8'had)))) ?
                      wire71 : ($unsigned($signed(wire71)) ?
                          ((~wire70) << {(8'hbe)}) : (wire72 < wire68))));
  assign wire74 = $signed(wire69[(2'h2):(1'h1)]);
  assign wire75 = $signed(wire73[(3'h5):(1'h0)]);
  assign wire76 = (({(+(~(7'h44)))} + $signed({{wire73, wire74}})) == wire72);
  always
    @(posedge clk) begin
      reg77 <= wire76[(1'h1):(1'h0)];
      reg78 <= wire76;
    end
  assign wire79 = (((+wire76[(2'h3):(2'h2)]) ?
                          $signed($signed(wire76[(3'h7):(3'h7)])) : (($signed(wire74) > (reg78 <<< wire73)) ?
                              ((wire74 ?
                                  reg77 : wire68) ~^ (wire73 ~^ reg78)) : ($unsigned((8'ha4)) ?
                                  (reg77 && wire74) : wire75))) ?
                      ((wire69[(2'h2):(1'h0)] ?
                          wire72 : wire72[(5'h14):(4'hb)]) && wire73) : $signed($signed((&(wire76 > wire75)))));
  assign wire80 = reg78;
  assign wire81 = {(^~(~&wire80))};
  assign wire82 = $unsigned(((wire72[(3'h7):(3'h6)] >>> $signed((wire79 ?
                      reg77 : wire79))) - ($unsigned($signed(wire71)) ?
                      wire71 : wire74)));
  assign wire83 = $unsigned({((!$unsigned(wire79)) == $unsigned((wire70 ?
                          wire69 : wire79)))});
  assign wire84 = (8'ha6);
  assign wire85 = (^($unsigned($unsigned((|wire83))) >> {(wire69 ?
                          {(8'hb9)} : wire80)}));
  assign wire86 = $unsigned($signed($signed(wire73[(3'h4):(1'h1)])));
  always
    @(posedge clk) begin
      reg87 <= (((((wire68 * wire73) ? wire76[(2'h3):(1'h1)] : (~&wire69)) ?
          (^~(reg77 < wire73)) : $signed((!wire85))) >= {$signed(wire84),
          $signed((wire73 || wire84))}) | (+{wire85[(2'h2):(1'h0)],
          {(^~wire85), $unsigned(wire85)}}));
      if ((((({wire80} != (reg87 || wire81)) ?
              ((wire75 ? wire86 : wire81) ?
                  (reg78 ?
                      wire80 : wire85) : $unsigned(wire79)) : (-wire84)) + $unsigned($signed(wire73[(2'h2):(1'h1)]))) ?
          $signed(($signed((!(8'haf))) ?
              wire84[(2'h3):(1'h0)] : ((wire86 << wire84) ?
                  (wire80 ?
                      wire83 : wire83) : (~reg77)))) : {wire71[(3'h4):(1'h0)]}))
        begin
          reg88 <= (|wire85);
        end
      else
        begin
          reg88 <= {(reg88[(3'h6):(3'h6)] != $signed({wire83,
                  (wire71 > wire84)})),
              (^~{(+(^~reg88)), $unsigned({reg78, wire82})})};
          if (({{reg78[(1'h1):(1'h0)], wire86}} ?
              {wire79[(1'h1):(1'h1)], $unsigned(reg77)} : ((^~($signed(wire70) ?
                      (~^wire72) : (^~wire81))) ?
                  $signed((wire69[(4'he):(4'ha)] != $signed((8'had)))) : wire80[(4'hc):(2'h3)])))
            begin
              reg89 <= ($unsigned({(&(&wire82))}) ?
                  (^~($signed($signed(reg77)) ?
                      wire70[(4'h9):(3'h5)] : ((wire71 ?
                          reg88 : wire81) && (wire68 ?
                          wire86 : wire72)))) : wire81);
              reg90 <= (($unsigned(wire71[(4'he):(4'he)]) ?
                  ($unsigned($unsigned(wire74)) ?
                      (~|(wire68 ?
                          wire86 : wire83)) : reg78[(2'h3):(1'h0)]) : wire75) | ((~^(!wire69)) <= (~(-$unsigned(wire72)))));
              reg91 <= wire71;
              reg92 <= (8'ha4);
              reg93 <= $unsigned((~^wire70));
            end
          else
            begin
              reg89 <= wire83;
            end
          reg94 <= $signed($unsigned((8'ha2)));
          reg95 <= ($signed(reg78) + wire85[(2'h3):(1'h0)]);
        end
    end
  assign wire96 = wire84;
  assign wire97 = (8'h9e);
  assign wire98 = {($signed((&(|reg88))) ?
                          $unsigned((~^(reg88 != reg88))) : $unsigned({$signed((8'h9e))}))};
  assign wire99 = $signed(wire80[(4'hc):(4'hc)]);
  assign wire100 = wire85[(3'h7):(3'h4)];
  assign wire101 = wire71;
  always
    @(posedge clk) begin
      reg102 <= wire73[(3'h4):(2'h3)];
      reg103 <= (^((wire98 ^~ $unsigned(wire80)) + (reg78[(3'h4):(1'h1)] > (((8'ha5) ?
          reg89 : wire73) * reg93))));
      reg104 <= ((-{$unsigned((reg92 || wire80))}) ?
          $signed((wire73[(3'h5):(2'h3)] ?
              {wire97} : (~&(-wire75)))) : $signed((-$signed($unsigned((8'hb5))))));
      if (($unsigned({((wire101 - (8'hac)) == reg88[(2'h3):(2'h2)]),
          ((reg93 ~^ wire68) <<< (&reg93))}) + (reg90[(3'h6):(2'h2)] ^~ (~&$unsigned($unsigned((8'hab)))))))
        begin
          reg105 <= ($signed({((~wire84) - $signed((8'hb4))),
              {(wire100 ? wire69 : wire83),
                  (wire85 == wire79)}}) ~^ ($unsigned((|wire85[(1'h1):(1'h0)])) ?
              ($unsigned((wire83 ? wire74 : reg88)) ?
                  $unsigned({reg91,
                      reg104}) : $signed($signed(wire80))) : $unsigned((8'hac))));
          if ($signed(reg91))
            begin
              reg106 <= ({$unsigned($signed((~|reg90))),
                  reg94} && (reg95[(1'h1):(1'h1)] ?
                  $signed($signed((!(8'h9e)))) : $unsigned($signed($signed(reg89)))));
              reg107 <= (~&wire81[(3'h4):(1'h1)]);
            end
          else
            begin
              reg106 <= {(+$unsigned((+reg87[(2'h2):(1'h1)]))),
                  $signed(((^(reg78 > (8'h9d))) ? reg105 : {{wire82}}))};
              reg107 <= (-(({reg92, $signed(reg107)} ~^ wire84) ?
                  wire75 : {reg106}));
              reg108 <= $unsigned($signed(($signed($unsigned((8'ha5))) ?
                  ((wire69 ? (8'hba) : wire79) ?
                      $signed(wire82) : $signed(wire74)) : $signed($signed(reg88)))));
            end
          reg109 <= {wire72[(3'h4):(2'h3)]};
          reg110 <= (|reg107);
          if ((~|reg77))
            begin
              reg111 <= wire99;
              reg112 <= (((+$signed(reg111[(1'h1):(1'h0)])) || (+wire68)) >> $unsigned($signed({(reg91 < wire80)})));
              reg113 <= (-reg108[(1'h0):(1'h0)]);
            end
          else
            begin
              reg111 <= {($unsigned($unsigned(wire82)) * $signed(wire84)),
                  reg111};
              reg112 <= $unsigned($unsigned(wire69));
              reg113 <= (~^((-((~|wire86) ?
                  $signed((8'ha1)) : (&reg112))) != ((reg92[(4'h9):(4'h9)] ?
                  wire75 : {wire71}) && wire76)));
            end
        end
      else
        begin
          reg105 <= (~&$signed((({reg78} ?
              $unsigned(wire79) : reg90) == ((+wire76) >>> wire69))));
          reg106 <= $unsigned(((wire82 ?
                  $unsigned((wire73 ? wire75 : wire69)) : $unsigned((wire80 ?
                      reg103 : wire73))) ?
              ((wire73[(1'h0):(1'h0)] ? (~&wire97) : wire79) ?
                  $signed(wire81) : $unsigned($signed(reg95))) : (wire96[(4'hc):(4'hb)] ?
                  ((reg88 ^~ reg90) || ((7'h42) | (8'hb3))) : wire97[(2'h2):(1'h0)])));
          reg107 <= reg111[(4'hb):(2'h2)];
        end
      reg114 <= $unsigned((reg110[(3'h5):(1'h1)] <= {(+$unsigned(reg110))}));
    end
  assign wire115 = $unsigned(wire72[(4'h9):(3'h6)]);
  assign wire116 = (wire99 ^~ {(wire115 ?
                           ($unsigned(reg106) || wire68) : $unsigned((wire68 ?
                               wire73 : reg77)))});
endmodule

module module34
#(parameter param49 = (!(&((8'hb6) ? {((7'h43) ? (8'had) : (8'had))} : (8'ha6)))))
(y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'h89):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire38;
  input wire signed [(5'h10):(1'h0)] wire37;
  input wire [(5'h15):(1'h0)] wire36;
  input wire signed [(5'h14):(1'h0)] wire35;
  wire signed [(3'h5):(1'h0)] wire48;
  wire [(5'h14):(1'h0)] wire47;
  wire signed [(4'he):(1'h0)] wire39;
  reg signed [(4'hd):(1'h0)] reg46 = (1'h0);
  reg [(4'hf):(1'h0)] reg45 = (1'h0);
  reg [(4'hb):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg [(4'hc):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire39,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 (1'h0)};
  assign wire39 = (~&wire36[(4'he):(3'h4)]);
  always
    @(posedge clk) begin
      reg40 <= $unsigned((($unsigned(wire36[(4'he):(4'h9)]) >= $unsigned($unsigned(wire39))) > $signed(((~^wire36) ?
          (wire39 ? wire37 : wire36) : wire38[(3'h5):(1'h1)]))));
      reg41 <= reg40[(4'hb):(3'h6)];
      reg42 <= {$signed(wire38), wire35};
      if ($signed((8'hb5)))
        begin
          reg43 <= ((wire38 && (reg40 ?
                  $signed(wire36[(4'hb):(2'h3)]) : wire35[(3'h5):(3'h5)])) ?
              reg42[(2'h2):(1'h1)] : {$unsigned((wire35[(4'hc):(3'h6)] ?
                      wire35 : $unsigned(reg42))),
                  reg40});
          reg44 <= (($unsigned($unsigned((wire38 <<< reg42))) ?
              (((&wire37) ? reg40 : (&wire39)) ?
                  $signed(((8'h9f) >>> (8'ha2))) : $signed(wire39[(2'h2):(1'h1)])) : wire35) > ($unsigned((wire38[(2'h2):(2'h2)] ?
              wire36 : {(8'hbd)})) >>> (({wire39} >> $signed((8'h9e))) > $unsigned(reg40))));
          reg45 <= reg42[(3'h4):(2'h2)];
        end
      else
        begin
          reg43 <= (reg42 ?
              (reg42[(2'h3):(1'h1)] ?
                  $signed($unsigned((~reg41))) : ((~^wire36) << $signed($signed(reg44)))) : {($unsigned(wire37[(3'h7):(1'h1)]) < reg45[(4'hc):(4'hc)])});
        end
    end
  always
    @(posedge clk) begin
      reg46 <= $signed((reg44[(4'h9):(4'h9)] ?
          ({(8'ha2)} ?
              reg41 : wire36[(4'he):(1'h1)]) : ($unsigned($unsigned(reg42)) + (reg41 * $unsigned(wire37)))));
    end
  assign wire47 = wire39;
  assign wire48 = $signed($unsigned({$signed({reg42, reg43}),
                      (^~{reg46, (8'h9d)})}));
endmodule
