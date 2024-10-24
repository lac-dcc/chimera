module top
#(parameter param121 = ((!(({(8'hb4)} == ((8'hb7) ? (8'hbe) : (8'h9f))) ? (((8'hbe) || (8'haa)) ? ((8'haa) && (8'ha5)) : {(8'ha5)}) : ({(8'hb4), (8'ha7)} ^~ ((7'h43) <= (8'hb5))))) ? ((~&(|(8'ha0))) ? (~|(((8'h9f) == (8'hb5)) >>> ((8'ha8) | (8'ha4)))) : ((^((8'ha6) ? (8'ha1) : (7'h43))) <= (8'ha3))) : (^~((((8'hab) > (8'hbd)) ? (~(8'haa)) : (~|(8'hb3))) ? ({(8'ha3), (8'hba)} ? (&(8'ha2)) : ((8'ha3) ? (8'ha7) : (8'h9e))) : (((8'hba) <<< (8'ha5)) ? {(8'haa), (7'h41)} : (|(8'hba)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(4'ha):(1'h0)] wire118;
  wire [(4'hd):(1'h0)] wire117;
  wire [(4'he):(1'h0)] wire116;
  wire [(2'h2):(1'h0)] wire115;
  wire [(5'h13):(1'h0)] wire114;
  wire signed [(5'h15):(1'h0)] wire113;
  wire [(5'h10):(1'h0)] wire112;
  wire [(4'hb):(1'h0)] wire111;
  wire signed [(4'hc):(1'h0)] wire110;
  wire signed [(5'h12):(1'h0)] wire47;
  wire [(5'h13):(1'h0)] wire49;
  wire [(2'h2):(1'h0)] wire50;
  wire signed [(5'h12):(1'h0)] wire51;
  wire signed [(3'h6):(1'h0)] wire52;
  wire [(5'h14):(1'h0)] wire53;
  wire signed [(5'h14):(1'h0)] wire54;
  wire signed [(4'hc):(1'h0)] wire55;
  wire [(5'h10):(1'h0)] wire56;
  wire [(3'h6):(1'h0)] wire108;
  reg [(5'h13):(1'h0)] reg120 = (1'h0);
  reg [(3'h4):(1'h0)] reg119 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire47,
                 wire49,
                 wire50,
                 wire51,
                 wire52,
                 wire53,
                 wire54,
                 wire55,
                 wire56,
                 wire108,
                 reg120,
                 reg119,
                 (1'h0)};
  module5 #() modinst48 (wire47, clk, wire4, wire2, wire0, wire3);
  assign wire49 = {$unsigned((^~(!wire3[(5'h11):(4'ha)])))};
  assign wire50 = ({$unsigned({(8'hb2)}),
                      (((wire47 ? wire0 : wire1) ?
                          $unsigned((8'hbc)) : (wire0 & wire0)) && wire3[(3'h5):(3'h4)])} | ($signed({$signed(wire1)}) ?
                      {{(!(7'h41)), $signed(wire47)}} : $signed(wire0)));
  assign wire51 = (8'ha9);
  assign wire52 = $unsigned((((wire4[(5'h12):(4'ha)] ?
                          (^~(7'h43)) : $signed(wire3)) ?
                      wire47 : ($unsigned(wire50) ?
                          (wire47 ^ wire3) : (wire0 | wire50))) >>> wire50));
  assign wire53 = ((!$unsigned(wire49)) < (wire49 ~^ $signed(($unsigned(wire51) * (wire2 ?
                      wire50 : wire51)))));
  assign wire54 = (($signed(wire3[(5'h10):(1'h0)]) ?
                          (^~((wire4 ?
                              wire47 : (8'haf)) | wire2[(4'hf):(3'h5)])) : wire0) ?
                      wire52 : ($signed(wire1) ?
                          wire2[(3'h7):(1'h1)] : $signed((wire52[(1'h0):(1'h0)] - $unsigned((8'hb5))))));
  assign wire55 = ($signed((~|(wire52[(2'h2):(2'h2)] >>> $signed(wire2)))) << wire53);
  assign wire56 = $signed($signed((((^~wire51) == (wire0 ?
                      wire4 : wire55)) <= wire51)));
  module57 #() modinst109 (wire108, clk, wire51, wire4, wire56, wire47, wire49);
  assign wire110 = wire2[(2'h3):(1'h0)];
  assign wire111 = $unsigned({((wire52[(3'h4):(2'h3)] < $unsigned(wire108)) ?
                           wire3[(3'h5):(2'h2)] : wire53)});
  assign wire112 = wire108;
  assign wire113 = (($unsigned(((!(7'h41)) != (wire3 << (8'hbd)))) >>> $signed(wire49[(5'h12):(5'h12)])) < wire47[(4'hb):(3'h7)]);
  assign wire114 = $unsigned((wire4[(5'h15):(5'h10)] ?
                       (~^((-wire112) ?
                           (wire47 ?
                               wire49 : wire113) : $unsigned(wire52))) : $signed(wire55)));
  assign wire115 = wire111;
  assign wire116 = {(+wire52)};
  assign wire117 = (~|{{(wire54[(4'hb):(3'h7)] ?
                               (wire114 ^~ wire54) : $signed(wire56)),
                           wire56}});
  assign wire118 = (wire115[(1'h1):(1'h1)] ?
                       (wire108 ?
                           (wire47[(2'h2):(1'h1)] * (^wire116[(4'h8):(3'h5)])) : wire116[(4'hc):(4'h8)]) : wire112);
  always
    @(posedge clk) begin
      reg119 <= $signed($signed(wire116));
      reg120 <= ($signed(wire56) >= wire51[(3'h4):(2'h2)]);
    end
endmodule

module module57  (y, clk, wire62, wire61, wire60, wire59, wire58);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire62;
  input wire signed [(4'hf):(1'h0)] wire61;
  input wire signed [(2'h2):(1'h0)] wire60;
  input wire signed [(4'h8):(1'h0)] wire59;
  input wire signed [(3'h7):(1'h0)] wire58;
  wire signed [(4'he):(1'h0)] wire102;
  wire signed [(3'h6):(1'h0)] wire100;
  wire signed [(4'h9):(1'h0)] wire67;
  wire signed [(2'h2):(1'h0)] wire66;
  wire [(5'h13):(1'h0)] wire65;
  wire [(4'hf):(1'h0)] wire64;
  wire [(2'h2):(1'h0)] wire63;
  reg [(5'h11):(1'h0)] reg107 = (1'h0);
  reg [(2'h3):(1'h0)] reg106 = (1'h0);
  reg signed [(4'he):(1'h0)] reg105 = (1'h0);
  reg [(3'h4):(1'h0)] reg104 = (1'h0);
  reg signed [(4'he):(1'h0)] reg103 = (1'h0);
  assign y = {wire102,
                 wire100,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 (1'h0)};
  assign wire63 = wire62[(2'h2):(1'h1)];
  assign wire64 = wire59[(1'h0):(1'h0)];
  assign wire65 = wire64[(4'ha):(3'h4)];
  assign wire66 = wire58[(2'h2):(2'h2)];
  assign wire67 = wire59;
  module68 #() modinst101 (wire100, clk, wire58, wire61, wire59, wire64);
  assign wire102 = $signed(($signed((wire63 ? $signed(wire58) : (^~wire65))) ?
                       (wire62 ? wire65 : wire58) : (+((wire59 ?
                           wire66 : wire60) - wire65))));
  always
    @(posedge clk) begin
      reg103 <= (wire62[(4'hb):(2'h2)] ? wire58[(3'h6):(3'h4)] : (-(8'hac)));
      reg104 <= wire102[(2'h3):(2'h2)];
      reg105 <= $signed({((wire65[(4'hb):(4'ha)] ?
              $signed(wire65) : (wire60 || wire66)) && (+wire67)),
          ($unsigned(((8'hb2) - wire59)) * (7'h44))});
      reg106 <= $signed((($unsigned(reg105) ?
          ({wire102} && (8'ha9)) : (&(wire60 ?
              wire62 : reg105))) ^~ $unsigned((((8'hae) == (8'haf)) ?
          (wire66 ? wire61 : wire61) : (reg103 & (7'h43))))));
      reg107 <= wire62;
    end
endmodule

module module5
#(parameter param45 = ((&(((~(8'ha3)) & (~|(8'ha8))) & ({(8'hbc), (7'h40)} | {(8'h9c), (8'ha4)}))) ? (+(|((7'h40) * (|(8'hac))))) : ({({(8'hbc)} <<< (+(8'had))), {((8'hb4) * (8'hac))}} && {(7'h43)})), 
parameter param46 = ((&{({param45, (8'hb3)} && (param45 ? param45 : param45)), (|(param45 >> param45))}) > ({{param45}, param45} ? (~(8'hae)) : ((^(param45 <= (8'hb5))) ? param45 : (+(7'h40))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h142):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire [(2'h3):(1'h0)] wire8;
  input wire [(4'hc):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire41;
  wire [(4'hc):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire31;
  wire [(4'hf):(1'h0)] wire25;
  wire signed [(4'hc):(1'h0)] wire23;
  wire signed [(4'hc):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire10;
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(5'h13):(1'h0)] reg39 = (1'h0);
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(3'h4):(1'h0)] reg35 = (1'h0);
  reg [(5'h10):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  assign y = {wire41,
                 wire32,
                 wire31,
                 wire25,
                 wire23,
                 wire12,
                 wire11,
                 wire10,
                 reg44,
                 reg43,
                 reg42,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire10 = $signed($signed((7'h42)));
  assign wire11 = $signed(wire10);
  assign wire12 = (8'hac);
  module13 #() modinst24 (.wire17(wire8), .wire15(wire10), .wire14(wire7), .y(wire23), .wire16(wire9), .clk(clk));
  assign wire25 = wire9[(4'h8):(3'h4)];
  always
    @(posedge clk) begin
      reg26 <= (wire7 >> wire7);
      reg27 <= $signed(wire7[(4'h9):(2'h2)]);
      reg28 <= ((-$signed($signed(wire9[(4'he):(4'he)]))) ?
          (+{$signed($unsigned((8'ha1))),
              ($unsigned(wire6) != ((7'h40) ^ reg26))}) : $signed((((wire8 ^ reg27) <= (wire7 ?
              wire12 : wire23)) ~^ wire6)));
      reg29 <= wire6[(5'h11):(2'h3)];
      reg30 <= (~^$signed($signed($unsigned((&wire12)))));
    end
  assign wire31 = $unsigned(((|wire7) ? wire6 : wire23));
  assign wire32 = (|wire23);
  always
    @(posedge clk) begin
      reg33 <= {$unsigned((8'hbf))};
      reg34 <= $unsigned({(^{$unsigned(wire12), reg33}), (^~wire31)});
      reg35 <= $signed(wire12);
    end
  always
    @(posedge clk) begin
      reg36 <= ($unsigned((!{$unsigned(reg33), reg33[(4'ha):(1'h1)]})) ?
          wire25[(2'h3):(2'h3)] : (!reg34[(4'hb):(3'h7)]));
      reg37 <= wire11[(4'hc):(2'h2)];
      reg38 <= $unsigned((~|wire9));
      reg39 <= {reg27};
      reg40 <= ($unsigned((-((reg33 < wire32) ?
          ((8'hbe) && reg37) : (~&reg39)))) + (~&$signed({(8'h9f),
          (~&reg37)})));
    end
  assign wire41 = $signed(wire10);
  always
    @(posedge clk) begin
      reg42 <= ($unsigned(wire31[(2'h3):(1'h1)]) ?
          $signed((reg28[(3'h7):(2'h3)] + wire31)) : ($unsigned({(wire11 ?
                      wire8 : wire31)}) ?
              (~|$signed((reg28 ? reg33 : (8'hb7)))) : (wire8[(1'h0):(1'h0)] ?
                  reg26[(3'h6):(3'h5)] : ($signed((8'ha7)) ?
                      reg38[(3'h6):(2'h3)] : (reg29 == reg37)))));
      reg43 <= $signed(reg27[(4'hd):(4'hc)]);
      reg44 <= (|(~wire23[(3'h4):(2'h3)]));
    end
endmodule

module module13  (y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire17;
  input wire signed [(3'h6):(1'h0)] wire16;
  input wire [(4'h9):(1'h0)] wire15;
  input wire [(4'hc):(1'h0)] wire14;
  wire [(2'h2):(1'h0)] wire22;
  wire signed [(3'h7):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire20;
  wire signed [(4'hb):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire18;
  assign y = {wire22, wire21, wire20, wire19, wire18, (1'h0)};
  assign wire18 = (-$signed(wire14[(4'ha):(3'h4)]));
  assign wire19 = wire17[(2'h2):(1'h0)];
  assign wire20 = ((~^((^(wire17 > wire19)) ? wire14[(1'h1):(1'h1)] : wire19)) ?
                      $unsigned((($unsigned(wire17) ?
                          (wire14 ? wire18 : wire15) : ((8'hb9) ?
                              wire16 : wire19)) && ((^wire17) ?
                          wire16[(2'h3):(1'h1)] : (wire17 ?
                              wire14 : wire17)))) : $unsigned($unsigned(wire18)));
  assign wire21 = ($signed($unsigned(((!wire18) != (wire17 == wire15)))) ?
                      $unsigned(wire19[(3'h4):(1'h0)]) : $unsigned((((wire16 ?
                              wire20 : wire14) ?
                          wire15[(3'h6):(3'h4)] : (~^wire18)) >= $unsigned((~wire19)))));
  assign wire22 = (wire20[(5'h14):(3'h4)] >= $signed(wire18[(2'h2):(2'h2)]));
endmodule

module module68  (y, clk, wire72, wire71, wire70, wire69);
  output wire [(32'h141):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire72;
  input wire signed [(4'he):(1'h0)] wire71;
  input wire [(4'h8):(1'h0)] wire70;
  input wire signed [(4'hf):(1'h0)] wire69;
  wire signed [(5'h13):(1'h0)] wire99;
  wire signed [(5'h15):(1'h0)] wire98;
  wire [(5'h14):(1'h0)] wire97;
  wire signed [(4'hc):(1'h0)] wire96;
  wire [(3'h5):(1'h0)] wire95;
  wire [(4'hc):(1'h0)] wire79;
  wire signed [(2'h3):(1'h0)] wire78;
  wire signed [(5'h15):(1'h0)] wire77;
  wire [(3'h4):(1'h0)] wire76;
  wire signed [(4'hd):(1'h0)] wire75;
  wire signed [(4'hc):(1'h0)] wire74;
  wire signed [(5'h10):(1'h0)] wire73;
  reg signed [(4'h8):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg93 = (1'h0);
  reg [(4'ha):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg90 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg89 = (1'h0);
  reg [(5'h13):(1'h0)] reg88 = (1'h0);
  reg [(2'h3):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg86 = (1'h0);
  reg [(4'h8):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg84 = (1'h0);
  reg [(5'h11):(1'h0)] reg83 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(4'hd):(1'h0)] reg81 = (1'h0);
  reg [(2'h2):(1'h0)] reg80 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 reg94,
                 reg93,
                 reg92,
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
                 reg80,
                 (1'h0)};
  assign wire73 = $unsigned((~($unsigned(wire71[(4'hc):(3'h5)]) ?
                      {$signed(wire71)} : (8'ha4))));
  assign wire74 = $signed(($unsigned(wire70) ?
                      (wire69 ?
                          wire70[(3'h7):(3'h4)] : (wire73[(4'hd):(3'h7)] != (wire72 ~^ wire73))) : wire70));
  assign wire75 = wire74[(3'h7):(3'h7)];
  assign wire76 = wire74[(1'h0):(1'h0)];
  assign wire77 = (($unsigned((!{wire70})) ?
                          ($unsigned((wire76 ? (8'ha7) : wire76)) ?
                              $signed(wire76[(3'h4):(1'h0)]) : (((8'ha9) ^~ wire69) ?
                                  wire75 : wire73)) : $signed(wire76[(2'h3):(1'h0)])) ?
                      wire69[(4'h9):(3'h5)] : {({$unsigned(wire72),
                              $signed(wire74)} <<< (-(wire72 && (8'hae)))),
                          $signed($signed($signed(wire72)))});
  assign wire78 = (wire71[(3'h4):(2'h2)] != wire74[(3'h4):(3'h4)]);
  assign wire79 = wire69;
  always
    @(posedge clk) begin
      reg80 <= wire71;
      if ($signed($unsigned($unsigned(wire75))))
        begin
          if (($unsigned($unsigned($signed(wire71[(3'h7):(3'h4)]))) ?
              ({(~^wire69)} << {wire71,
                  $signed((~^wire74))}) : ((~^((wire71 ^~ reg80) ?
                  (!wire77) : $unsigned((8'h9d)))) ^~ $signed(wire73[(3'h5):(1'h1)]))))
            begin
              reg81 <= wire79[(2'h2):(1'h1)];
            end
          else
            begin
              reg81 <= (8'hb8);
              reg82 <= wire74[(4'ha):(4'h9)];
              reg83 <= reg80;
            end
          reg84 <= ($unsigned(wire72) + wire74);
          if (wire76)
            begin
              reg85 <= wire75;
              reg86 <= ((reg85 ^ ({$signed(wire72),
                  {(8'h9d), wire73}} == ($unsigned(reg84) ?
                  wire73 : (~|reg80)))) < (+$signed(((|wire75) - {wire78}))));
              reg87 <= (((reg80 >>> ((wire71 ~^ wire77) == $signed(wire76))) ?
                      reg83[(3'h7):(2'h2)] : wire75) ?
                  $unsigned(reg83) : $unsigned(reg84[(2'h3):(1'h1)]));
              reg88 <= wire77[(4'ha):(3'h6)];
            end
          else
            begin
              reg85 <= $signed($unsigned($unsigned($unsigned($signed((8'hb5))))));
              reg86 <= reg83[(4'hc):(3'h6)];
              reg87 <= ($signed((($signed(wire70) ?
                      (+wire73) : (reg80 + wire73)) < (wire72 ?
                      reg87 : (!wire74)))) ?
                  ((^~({reg88} ? wire77 : $signed(wire73))) && {((~|wire74) ?
                          $signed((8'hbf)) : $signed(wire73))}) : $unsigned((wire72[(2'h3):(2'h2)] ?
                      wire76[(3'h4):(2'h3)] : (8'hb7))));
            end
          reg89 <= {((-$unsigned(wire77[(4'hf):(4'he)])) ?
                  ($unsigned($signed(wire70)) | {(wire72 ? wire79 : reg87),
                      (^reg86)}) : $unsigned((reg87[(2'h2):(2'h2)] ?
                      (&(7'h40)) : $unsigned(reg86))))};
          if ((~&$signed((reg87[(2'h3):(1'h1)] ?
              (~|{wire69}) : ((reg84 ? reg84 : wire73) - ((8'haf) ?
                  reg89 : reg85))))))
            begin
              reg90 <= (({(-(wire78 ? (8'ha1) : wire77)), wire70} ?
                  reg85 : $signed(reg89)) - reg86[(4'hd):(3'h4)]);
              reg91 <= (((reg90 ?
                      (reg89[(4'h8):(3'h4)] ?
                          $signed(wire72) : (|reg85)) : $unsigned($unsigned(reg83))) ?
                  ((&(reg86 != (8'hb8))) ?
                      (!wire71[(4'ha):(3'h5)]) : ($unsigned(wire76) ?
                          wire76[(1'h0):(1'h0)] : wire73)) : $unsigned({reg88[(4'he):(4'hb)]})) == ((^{$signed(reg84)}) ?
                  $signed(wire74[(4'h9):(3'h7)]) : (~&((wire79 != wire69) >= reg80[(1'h1):(1'h0)]))));
            end
          else
            begin
              reg90 <= reg83;
              reg91 <= reg86;
              reg92 <= ((^~(reg87[(2'h2):(1'h1)] ?
                  wire69 : (reg81[(3'h7):(3'h5)] <= $unsigned(reg87)))) * ($signed($signed((~reg90))) ?
                  ($unsigned($unsigned(wire79)) ?
                      $unsigned(wire73) : ((wire69 ? reg85 : (8'hb1)) ?
                          (wire70 >> wire69) : $unsigned(reg80))) : reg84));
              reg93 <= $unsigned(reg85);
              reg94 <= {{wire79[(2'h3):(2'h3)], (8'hbe)}, reg90[(4'hf):(3'h5)]};
            end
        end
      else
        begin
          if (((^~($signed((wire78 ?
              wire72 : reg92)) > wire75[(3'h4):(2'h2)])) == wire71[(4'h8):(3'h7)]))
            begin
              reg81 <= (!$signed(({reg87[(1'h1):(1'h0)]} > (8'ha1))));
              reg82 <= ($signed($unsigned(((wire76 ? (7'h41) : wire74) ?
                      wire75[(3'h6):(2'h2)] : {wire74}))) ?
                  {$signed((^$signed((8'hb1))))} : ((~|(reg88 ?
                          $signed(reg90) : $signed(wire79))) ?
                      (&$signed($signed(reg85))) : ((~|(reg90 < wire71)) ?
                          {wire76} : (reg88 ?
                              (|reg83) : reg86[(4'h9):(4'h8)]))));
              reg83 <= ($signed($unsigned(((reg82 & (7'h40)) ?
                  (^~reg91) : (reg83 == wire76)))) <= (~^$signed(wire76[(3'h4):(1'h0)])));
            end
          else
            begin
              reg81 <= $signed((^reg85));
              reg82 <= (~&{(&$signed($unsigned(wire76)))});
              reg83 <= $signed((wire72[(2'h3):(2'h2)] | reg86));
              reg84 <= $signed(wire69[(1'h1):(1'h1)]);
            end
          reg85 <= wire75[(4'h9):(3'h5)];
          if ((((({(8'ha0)} ?
                  {reg80, (8'ha1)} : (!wire73)) == reg91) | wire70) ?
              wire75 : ((+$signed(wire74)) ~^ (|$unsigned((wire71 <= reg84))))))
            begin
              reg86 <= (wire74 == reg80[(1'h1):(1'h0)]);
              reg87 <= (~&$unsigned(reg89[(2'h3):(2'h3)]));
            end
          else
            begin
              reg86 <= {$signed((reg85 ?
                      ($signed(wire70) ?
                          reg85[(4'h8):(2'h3)] : {reg83, reg81}) : ({wire69,
                              reg92} ?
                          $signed(reg81) : (reg91 ? wire73 : wire77))))};
              reg87 <= ({reg83, reg94} ?
                  $signed(reg88) : $unsigned((reg91 ?
                      (^~$signed(reg81)) : wire70)));
            end
          reg88 <= {reg82, reg90};
          reg89 <= {reg84[(2'h2):(1'h0)]};
        end
    end
  assign wire95 = (~^$signed(((!(reg86 ^ (8'hbe))) ?
                      wire73[(3'h4):(1'h0)] : {$signed(wire70)})));
  assign wire96 = reg91[(1'h0):(1'h0)];
  assign wire97 = $signed((8'h9e));
  assign wire98 = {((wire69[(3'h6):(3'h5)] ?
                          (-(wire72 ? wire97 : wire96)) : {reg83,
                              (+wire72)}) != (wire70[(3'h4):(1'h0)] != $signed($signed(wire71))))};
  assign wire99 = {((^~$unsigned({reg89})) + $unsigned(reg83[(4'hd):(4'ha)]))};
endmodule
