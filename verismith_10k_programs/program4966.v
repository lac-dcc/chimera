module top
#(parameter param126 = (~&(-(!({(8'hbb), (8'h9d)} < ((8'hbd) ? (8'hbb) : (8'ha7)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire125;
  wire signed [(3'h7):(1'h0)] wire121;
  wire signed [(3'h5):(1'h0)] wire63;
  wire [(4'ha):(1'h0)] wire62;
  wire signed [(5'h13):(1'h0)] wire60;
  wire [(2'h3):(1'h0)] wire123;
  assign y = {wire125, wire121, wire63, wire62, wire60, wire123, (1'h0)};
  module5 #() modinst61 (.y(wire60), .wire8(wire1), .clk(clk), .wire6(wire3), .wire10(wire2), .wire9(wire0), .wire7(wire4));
  assign wire62 = $signed($signed({(8'hbb)}));
  assign wire63 = wire3;
  module64 #() modinst122 (.wire67(wire60), .y(wire121), .wire66(wire1), .wire68(wire3), .clk(clk), .wire65(wire0), .wire69(wire63));
  module12 #() modinst124 (.clk(clk), .wire13(wire1), .y(wire123), .wire14(wire3), .wire17(wire2), .wire16(wire62), .wire15(wire63));
  assign wire125 = ({(((wire1 == (8'ha0)) ? $signed(wire2) : {(8'hb7)}) ?
                           (8'hb4) : wire0[(1'h0):(1'h0)]),
                       (wire63[(3'h4):(3'h4)] <<< (wire4[(5'h11):(3'h5)] ?
                           (~|wire62) : (+(8'ha7))))} ^~ wire63[(3'h5):(1'h0)]);
endmodule

module module64
#(parameter param119 = ((((|((8'ha8) ? (8'ha3) : (8'hb6))) ? ((~|(8'hb0)) ? (+(7'h43)) : (~(8'ha0))) : (((8'haf) << (8'haf)) ? ((8'hb1) ? (8'hac) : (8'ha1)) : ((8'hb1) <<< (8'hbc)))) != (|((|(8'hb2)) ? (!(8'hb5)) : ((8'ha8) ? (8'ha0) : (8'ha1))))) ? (((((7'h43) ? (8'hb6) : (8'hbe)) ? ((8'ha6) ? (8'haf) : (8'ha8)) : (^(8'hbd))) ? ({(7'h40)} ? (~|(8'ha3)) : ((8'h9d) > (7'h42))) : (~^{(8'h9c), (8'hb6)})) ? (+{((8'hb1) ? (8'h9f) : (7'h43))}) : ((((8'hb6) ? (8'hab) : (8'hb9)) > (^~(7'h42))) + ((&(8'hba)) != ((8'hb4) ? (8'hbc) : (8'ha6))))) : {(((~&(8'hb1)) >> ((8'hb2) ? (8'ha7) : (8'hb1))) ? (((8'ha0) ? (7'h40) : (8'hb1)) ? ((8'h9e) ? (8'hb8) : (8'hba)) : {(8'hb8)}) : (8'ha6)), {(((8'hae) < (8'ha6)) && ((8'hbd) ? (7'h44) : (8'h9f)))}}), 
parameter param120 = (+param119))
(y, clk, wire65, wire66, wire67, wire68, wire69);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire65;
  input wire signed [(5'h10):(1'h0)] wire66;
  input wire signed [(5'h13):(1'h0)] wire67;
  input wire signed [(4'hd):(1'h0)] wire68;
  input wire [(3'h5):(1'h0)] wire69;
  wire signed [(4'ha):(1'h0)] wire118;
  wire [(4'hb):(1'h0)] wire117;
  wire signed [(5'h12):(1'h0)] wire116;
  wire signed [(4'h8):(1'h0)] wire115;
  wire [(4'ha):(1'h0)] wire113;
  wire [(4'hf):(1'h0)] wire112;
  wire [(2'h2):(1'h0)] wire111;
  wire [(5'h13):(1'h0)] wire110;
  wire [(2'h3):(1'h0)] wire109;
  wire signed [(4'hf):(1'h0)] wire108;
  wire [(4'hd):(1'h0)] wire107;
  wire signed [(4'ha):(1'h0)] wire106;
  wire [(5'h12):(1'h0)] wire70;
  wire signed [(3'h7):(1'h0)] wire101;
  reg signed [(2'h2):(1'h0)] reg114 = (1'h0);
  reg [(5'h12):(1'h0)] reg105 = (1'h0);
  reg [(4'h9):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg103 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire70,
                 wire101,
                 reg114,
                 reg105,
                 reg104,
                 reg103,
                 (1'h0)};
  assign wire70 = wire69[(1'h0):(1'h0)];
  module71 #() modinst102 (.y(wire101), .wire74(wire68), .wire73(wire67), .wire75(wire66), .wire76(wire65), .clk(clk), .wire72(wire69));
  always
    @(posedge clk) begin
      reg103 <= $signed(($signed(({wire101, wire66} ?
              (wire65 ? wire69 : (8'hab)) : (wire67 ? wire70 : wire69))) ?
          $signed((((8'hbf) | wire101) ~^ (^wire68))) : (8'ha5)));
      reg104 <= ((((-$signed((8'hb0))) + wire69) ?
          (wire70 ?
              (^$signed(wire69)) : $unsigned((~wire66))) : $unsigned(wire101[(1'h0):(1'h0)])) >= (wire66 ?
          ({(^(8'h9d))} ?
              wire65[(1'h0):(1'h0)] : ((wire68 == wire68) > (wire67 || wire69))) : $unsigned((~^wire101))));
      reg105 <= (wire67[(5'h12):(3'h7)] ?
          wire66[(1'h1):(1'h1)] : (wire70 ^~ $unsigned(($signed(wire70) <= wire67[(5'h12):(5'h10)]))));
    end
  assign wire106 = $signed({$unsigned((^(+reg105))),
                       $unsigned(wire65[(2'h3):(1'h1)])});
  assign wire107 = wire65[(3'h7):(2'h2)];
  assign wire108 = reg103[(4'ha):(4'h8)];
  assign wire109 = wire66[(5'h10):(3'h7)];
  assign wire110 = ($signed((~(~|(wire108 ? wire67 : wire66)))) ?
                       wire68[(4'hc):(4'hc)] : wire69[(1'h1):(1'h0)]);
  assign wire111 = wire66[(4'hb):(3'h5)];
  assign wire112 = ((wire111 ?
                       $signed($signed(wire109)) : wire108[(4'hd):(2'h2)]) >= $unsigned((wire68[(4'h8):(2'h2)] - ($unsigned(wire106) <<< (8'ha8)))));
  assign wire113 = ((-($unsigned((wire110 ? wire110 : (8'ha8))) ?
                           $unsigned(wire107[(2'h2):(1'h0)]) : wire110[(5'h12):(4'ha)])) ?
                       ({$signed($unsigned(reg104)), wire112[(1'h0):(1'h0)]} ?
                           reg103[(3'h4):(2'h2)] : (~$unsigned((reg104 ?
                               wire109 : wire101)))) : ((wire67 << wire67[(4'hc):(4'h8)]) ?
                           $unsigned(($unsigned(reg105) + $signed(wire65))) : ($unsigned(wire101[(3'h4):(2'h3)]) ?
                               (((8'ha7) != reg105) - $unsigned((8'hbb))) : (^~wire68))));
  always
    @(posedge clk) begin
      reg114 <= (reg104 > wire111);
    end
  assign wire115 = $unsigned((&wire113[(3'h5):(3'h5)]));
  assign wire116 = wire112;
  assign wire117 = $unsigned(reg103[(4'hb):(3'h4)]);
  assign wire118 = (^wire70);
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire10;
  input wire [(5'h15):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire8;
  input wire signed [(4'h9):(1'h0)] wire7;
  input wire [(3'h5):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire36;
  wire [(3'h7):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire38;
  wire signed [(4'hb):(1'h0)] wire39;
  wire [(3'h5):(1'h0)] wire58;
  assign y = {wire36, wire11, wire38, wire39, wire58, (1'h0)};
  assign wire11 = ($unsigned($unsigned($signed((wire6 ? (8'ha6) : wire7)))) ?
                      (({wire9} >> {(^wire7)}) ?
                          {$signed(((8'hb9) ? wire9 : (8'haa))),
                              ((|wire9) ?
                                  $signed(wire6) : $signed((8'hb2)))} : (wire8 ?
                              $signed((wire7 ?
                                  wire6 : wire6)) : $signed(wire10[(4'hf):(3'h4)]))) : wire10[(2'h3):(1'h1)]);
  module12 #() modinst37 (wire36, clk, wire7, wire10, wire6, wire8, wire9);
  assign wire38 = wire6;
  assign wire39 = $signed((~|$signed(wire11)));
  module40 #() modinst59 (wire58, clk, wire36, wire11, wire8, wire10, wire7);
endmodule

module module40
#(parameter param56 = {{((((8'hb0) & (8'hb1)) ? ((8'ha4) ? (8'h9e) : (8'ha1)) : ((8'ha3) > (7'h41))) - ((~|(7'h42)) ? (~|(8'hbc)) : ((8'hbb) ? (8'hbe) : (8'ha5)))), ({((8'ha6) ? (7'h40) : (7'h42)), (~(8'ha7))} & (((8'hb4) <= (8'hb7)) * (+(8'haa))))}}, 
parameter param57 = {(8'h9c), param56})
(y, clk, wire45, wire44, wire43, wire42, wire41);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire45;
  input wire [(3'h4):(1'h0)] wire44;
  input wire [(5'h11):(1'h0)] wire43;
  input wire signed [(4'ha):(1'h0)] wire42;
  input wire signed [(3'h4):(1'h0)] wire41;
  wire signed [(4'he):(1'h0)] wire55;
  wire [(3'h7):(1'h0)] wire54;
  wire signed [(2'h2):(1'h0)] wire53;
  wire [(5'h10):(1'h0)] wire47;
  wire signed [(4'hf):(1'h0)] wire46;
  reg signed [(5'h14):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg50 = (1'h0);
  reg [(5'h14):(1'h0)] reg49 = (1'h0);
  reg [(4'h8):(1'h0)] reg48 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire47,
                 wire46,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire46 = (wire43[(2'h2):(2'h2)] != ((~^(~&$signed(wire45))) >= ((~(~&wire45)) - (wire42 & $signed(wire41)))));
  assign wire47 = wire41;
  always
    @(posedge clk) begin
      reg48 <= ($signed((^~(~|(8'hbc)))) >= $unsigned((~{(wire43 + wire41),
          (8'hbb)})));
      reg49 <= (($signed($unsigned({reg48})) ?
              (wire45[(3'h5):(2'h2)] ~^ wire41[(1'h1):(1'h1)]) : (|((-wire43) == (reg48 && wire43)))) ?
          $unsigned($unsigned($signed($unsigned(wire46)))) : (8'ha1));
      reg50 <= ({(-(wire45 ? (wire42 >= wire47) : (~|reg49)))} ~^ (-wire43));
      reg51 <= (|((^$signed(wire44[(2'h2):(2'h2)])) <<< (reg50[(4'hc):(3'h4)] + (reg50[(4'h8):(3'h6)] ?
          reg48[(3'h7):(1'h0)] : $unsigned(wire43)))));
      reg52 <= ($unsigned((($signed(reg48) && {wire45}) >>> reg49[(3'h4):(3'h4)])) < reg50);
    end
  assign wire53 = reg51[(3'h6):(3'h4)];
  assign wire54 = $unsigned((wire43 <= (({wire43} ~^ wire41) ?
                      {(+wire45), {reg48, wire45}} : (wire41 ?
                          $signed(reg50) : $unsigned(wire42)))));
  assign wire55 = {$signed(((!$signed((8'h9e))) ?
                          reg49 : $unsigned((reg48 ? (7'h43) : wire46))))};
endmodule

module module12
#(parameter param34 = ((^~{((~^(7'h44)) ? (~&(8'hb3)) : ((8'hb4) << (8'hb4)))}) >> ((-(+{(8'ha6), (8'haa)})) && (^~(8'hb1)))), 
parameter param35 = (^~(|((param34 ? (param34 ? param34 : param34) : param34) ? (8'had) : ((param34 && param34) ? param34 : (-(7'h44)))))))
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire17;
  input wire signed [(3'h7):(1'h0)] wire16;
  input wire [(3'h5):(1'h0)] wire15;
  input wire signed [(4'h8):(1'h0)] wire14;
  input wire signed [(5'h15):(1'h0)] wire13;
  wire signed [(4'ha):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire24;
  wire signed [(2'h3):(1'h0)] wire23;
  wire [(3'h7):(1'h0)] wire22;
  wire [(2'h2):(1'h0)] wire21;
  wire [(3'h4):(1'h0)] wire20;
  wire signed [(5'h12):(1'h0)] wire19;
  wire signed [(5'h12):(1'h0)] wire18;
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire18 = $unsigned((^~{(8'haf)}));
  assign wire19 = $signed((!$signed(wire13[(4'hf):(3'h6)])));
  assign wire20 = (-wire19[(2'h2):(1'h1)]);
  assign wire21 = ($unsigned(wire17) >> (!({wire18[(4'h8):(2'h2)],
                          $signed(wire19)} ?
                      ($signed(wire17) || $unsigned(wire13)) : $signed((wire15 & (8'hb0))))));
  assign wire22 = $signed($signed((wire15[(3'h4):(1'h1)] ~^ wire18)));
  assign wire23 = {{wire15[(3'h4):(3'h4)], wire14[(3'h5):(3'h4)]},
                      $unsigned((($unsigned(wire15) || wire22[(3'h6):(3'h6)]) ^~ ((wire17 > (8'ha3)) - (wire13 > wire14))))};
  assign wire24 = ($unsigned($unsigned(wire23)) || $signed((|wire14[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg25 <= wire15[(3'h4):(2'h2)];
      reg26 <= (8'hab);
    end
  assign wire27 = $signed($unsigned($unsigned($unsigned((!wire22)))));
  assign wire28 = $signed($signed(((((8'ha9) ?
                      wire16 : wire22) * (~^wire22)) <<< $unsigned(wire13))));
  assign wire29 = wire16;
  always
    @(posedge clk) begin
      reg30 <= wire27;
    end
  always
    @(posedge clk) begin
      reg31 <= $signed($unsigned((({wire17} ?
          $signed(wire18) : reg25[(3'h6):(2'h2)]) | (|((7'h40) ?
          wire19 : wire27)))));
      reg32 <= ((|wire17[(2'h3):(2'h2)]) ?
          (!$unsigned(((wire14 + wire27) ?
              {wire23} : $unsigned(reg30)))) : {(({wire16, reg31} < (-wire13)) ?
                  (wire14[(2'h3):(1'h0)] ?
                      {wire24,
                          wire17} : (wire14 >> (8'hb3))) : wire27[(4'hd):(2'h2)])});
      reg33 <= $signed($signed((-(8'hb2))));
    end
endmodule

module module71  (y, clk, wire76, wire75, wire74, wire73, wire72);
  output wire [(32'h11f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire76;
  input wire [(5'h10):(1'h0)] wire75;
  input wire signed [(4'hd):(1'h0)] wire74;
  input wire [(5'h13):(1'h0)] wire73;
  input wire [(3'h5):(1'h0)] wire72;
  wire signed [(5'h13):(1'h0)] wire100;
  wire signed [(3'h6):(1'h0)] wire99;
  wire signed [(3'h6):(1'h0)] wire95;
  wire [(5'h10):(1'h0)] wire94;
  wire signed [(3'h6):(1'h0)] wire93;
  wire signed [(4'hf):(1'h0)] wire92;
  wire signed [(4'ha):(1'h0)] wire91;
  wire signed [(5'h14):(1'h0)] wire90;
  wire [(4'hf):(1'h0)] wire89;
  wire signed [(5'h12):(1'h0)] wire88;
  wire signed [(3'h6):(1'h0)] wire87;
  wire signed [(4'hd):(1'h0)] wire86;
  wire signed [(4'ha):(1'h0)] wire85;
  wire [(4'hc):(1'h0)] wire84;
  wire [(4'h8):(1'h0)] wire83;
  wire signed [(5'h11):(1'h0)] wire82;
  wire signed [(5'h11):(1'h0)] wire81;
  wire [(3'h5):(1'h0)] wire80;
  wire [(2'h3):(1'h0)] wire79;
  wire [(5'h12):(1'h0)] wire78;
  wire signed [(5'h12):(1'h0)] wire77;
  reg [(5'h11):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg96 = (1'h0);
  assign y = {wire100,
                 wire99,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
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
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 reg98,
                 reg97,
                 reg96,
                 (1'h0)};
  assign wire77 = (+($signed(wire75) ? wire74[(3'h4):(2'h3)] : wire73));
  assign wire78 = (^~$unsigned($unsigned($signed($signed((8'hbc))))));
  assign wire79 = wire75[(4'hb):(4'h9)];
  assign wire80 = (^(~&wire74));
  assign wire81 = $signed((8'ha6));
  assign wire82 = ($signed((^~(wire78 ?
                      wire78 : ((8'ha4) << wire77)))) == ((~^$unsigned(wire81[(3'h4):(3'h4)])) ?
                      (((wire80 > wire80) <= $unsigned(wire81)) ^ $signed($signed(wire74))) : $signed($signed((wire81 > (8'ha7))))));
  assign wire83 = (&wire82[(2'h3):(1'h1)]);
  assign wire84 = (($signed({(wire79 ?
                              (8'hb2) : wire80)}) | ($unsigned((wire83 ?
                          (8'hb6) : wire80)) | $signed($unsigned(wire79)))) ?
                      ({wire77,
                          ((wire74 > (8'hac)) ?
                              (&wire79) : (wire73 ?
                                  wire80 : wire77))} && (8'ha9)) : {$signed($signed($unsigned(wire75)))});
  assign wire85 = (~&$signed(($unsigned((^~wire75)) == $unsigned((wire72 <<< wire78)))));
  assign wire86 = {wire75[(4'hd):(4'hc)]};
  assign wire87 = wire73[(4'h9):(3'h6)];
  assign wire88 = (~(~(&(~(7'h43)))));
  assign wire89 = $unsigned(((~{(^~wire74)}) << (wire80[(1'h1):(1'h0)] ?
                      $unsigned((wire80 << (8'haf))) : $unsigned((wire83 ?
                          wire78 : wire80)))));
  assign wire90 = (^~$signed((~&(7'h43))));
  assign wire91 = (wire85[(3'h4):(2'h3)] ?
                      ((!wire78) ?
                          wire90[(5'h11):(3'h4)] : (-(~^wire77))) : wire82[(4'hc):(1'h0)]);
  assign wire92 = wire79;
  assign wire93 = $unsigned(({((wire86 | wire83) ?
                              wire76 : (wire72 ? wire87 : wire72)),
                          ($unsigned(wire89) ?
                              ((8'ha2) ? wire77 : wire72) : (|wire76))} ?
                      (~&wire90) : (!$unsigned((wire72 ? (8'hb9) : wire73)))));
  assign wire94 = $unsigned($signed(wire77[(3'h4):(2'h2)]));
  assign wire95 = {(wire93 ? wire75[(4'h9):(3'h7)] : wire80), (7'h41)};
  always
    @(posedge clk) begin
      reg96 <= (!($unsigned(wire92[(3'h4):(2'h3)]) ?
          ($unsigned((wire72 ? wire84 : wire77)) ?
              ((wire95 ? wire80 : wire88) >= (^wire90)) : wire91) : (8'h9f)));
      reg97 <= wire77[(3'h5):(1'h0)];
      reg98 <= $unsigned({wire89});
    end
  assign wire99 = $signed($signed(wire89));
  assign wire100 = (((!wire76[(3'h4):(1'h1)]) && ((wire88 ?
                               (|(8'ha8)) : (wire80 ? (8'hbf) : reg98)) ?
                           ((wire80 && reg97) ?
                               {(8'hb7), wire94} : (wire85 ?
                                   wire90 : wire99)) : ($signed(wire76) ?
                               wire83[(3'h6):(1'h0)] : (wire85 ?
                                   wire99 : (8'h9d))))) ?
                       ((~&(reg97 >> wire72)) ?
                           ((&wire80) == ($signed(wire75) | $unsigned(wire92))) : (^(~&(wire81 ?
                               wire84 : wire95)))) : (^~$unsigned(wire95)));
endmodule
