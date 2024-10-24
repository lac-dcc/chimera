module top
#(parameter param136 = (^((~|{(!(8'h9d))}) * ((((8'hb5) ? (8'hb1) : (8'hbe)) ? (-(7'h43)) : ((8'hbe) ? (8'had) : (8'h9f))) ? (!(+(8'ha5))) : (8'hb2)))), 
parameter param137 = ({(~|{param136}), (~|(|(^~(8'ha8))))} ? ((param136 ^~ (~|(8'ha3))) == (-(+(param136 ? param136 : param136)))) : ({(param136 ? (param136 ? param136 : param136) : (^~(7'h42))), (~(~&(7'h41)))} ~^ param136)))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire135;
  wire signed [(4'he):(1'h0)] wire130;
  wire signed [(5'h11):(1'h0)] wire27;
  wire signed [(4'hc):(1'h0)] wire23;
  wire signed [(4'he):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire21;
  wire signed [(4'he):(1'h0)] wire132;
  wire [(4'ha):(1'h0)] wire133;
  reg signed [(4'he):(1'h0)] reg5 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  assign y = {wire135,
                 wire130,
                 wire27,
                 wire23,
                 wire6,
                 wire7,
                 wire8,
                 wire21,
                 wire132,
                 wire133,
                 reg5,
                 reg24,
                 reg25,
                 reg26,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $signed((8'hac));
    end
  assign wire6 = (((wire4[(2'h3):(1'h1)] ?
                         $unsigned({(8'hb9), wire4}) : $signed((wire4 ?
                             (8'haa) : (8'h9f)))) ?
                     (($unsigned((7'h44)) ?
                             $signed(wire1) : (wire3 ? wire2 : wire4)) ?
                         {reg5[(1'h0):(1'h0)],
                             wire0[(2'h3):(1'h1)]} : wire2) : {((wire3 ?
                             wire1 : wire1) ^~ $unsigned(wire3))}) - ((8'h9f) ?
                     $unsigned((!$signed(wire1))) : ($signed(wire4) || (^~$unsigned(wire2)))));
  assign wire7 = (|$signed(wire0[(4'h9):(2'h3)]));
  assign wire8 = $unsigned(($unsigned($unsigned((wire0 + wire1))) ?
                     ($unsigned(reg5) >= ((8'ha3) ?
                         $unsigned(wire2) : (wire4 * wire2))) : {reg5[(3'h5):(1'h1)],
                         {$signed(wire1), (wire7 ? wire6 : reg5)}}));
  module9 #() modinst22 (.wire10(wire8), .clk(clk), .wire13(wire1), .wire12(wire4), .wire11(wire7), .y(wire21), .wire14(wire0));
  assign wire23 = (wire6 ?
                      (wire0 ?
                          (~&((wire0 ? wire7 : wire8) ?
                              (^~wire7) : (~wire21))) : {wire3[(4'h8):(2'h2)]}) : (wire7 ^ $unsigned({{wire2,
                              wire21},
                          (~wire3)})));
  always
    @(posedge clk) begin
      reg24 <= {$unsigned((((wire4 - wire2) <= (wire4 <<< wire6)) ?
              wire23[(1'h1):(1'h1)] : (&((8'ha6) + wire1)))),
          (~|(wire21 & wire3))};
      reg25 <= $signed((~^((&(-wire0)) ?
          (-(wire3 && reg24)) : $signed((reg24 ? wire6 : wire2)))));
      reg26 <= wire7;
    end
  assign wire27 = reg24[(1'h0):(1'h0)];
  module28 #() modinst131 (wire130, clk, wire1, wire27, wire2, reg5);
  assign wire132 = ((wire21[(2'h2):(1'h1)] <= ((~(wire7 >= wire23)) ?
                       {wire130} : reg24)) <<< $signed((8'ha6)));
  module66 #() modinst134 (.wire67(wire21), .wire71(wire6), .wire68(wire23), .wire70(wire1), .clk(clk), .y(wire133), .wire69(wire2));
  assign wire135 = $signed((~($signed($unsigned(reg5)) ?
                       wire7[(4'h9):(2'h2)] : (~^(wire130 ? reg5 : (8'ha2))))));
endmodule

module module28
#(parameter param129 = (~^((((7'h41) ? ((7'h43) ? (8'hba) : (8'hb5)) : ((8'hae) ? (8'hb6) : (8'hb2))) ? (^~((8'hbd) ? (8'hbb) : (8'ha6))) : (((8'ha0) ^ (8'ha0)) << {(8'h9f), (8'h9c)})) ? {{((8'ha5) ^ (8'hb5))}} : (((~&(8'hb3)) ? (+(8'hbc)) : (^(7'h40))) > (^((8'hb7) ? (8'h9c) : (8'h9c)))))))
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'hdd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire32;
  input wire [(4'hf):(1'h0)] wire31;
  input wire signed [(5'h15):(1'h0)] wire30;
  input wire [(4'he):(1'h0)] wire29;
  wire signed [(4'hf):(1'h0)] wire126;
  wire signed [(5'h13):(1'h0)] wire125;
  wire signed [(5'h11):(1'h0)] wire124;
  wire signed [(3'h4):(1'h0)] wire123;
  wire [(4'he):(1'h0)] wire122;
  wire signed [(4'he):(1'h0)] wire121;
  wire signed [(3'h6):(1'h0)] wire120;
  wire [(4'h9):(1'h0)] wire119;
  wire signed [(5'h15):(1'h0)] wire118;
  wire [(4'hb):(1'h0)] wire116;
  wire signed [(4'he):(1'h0)] wire64;
  wire [(5'h10):(1'h0)] wire34;
  wire signed [(5'h15):(1'h0)] wire33;
  wire signed [(4'he):(1'h0)] wire89;
  reg [(4'hc):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg127 = (1'h0);
  assign y = {wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire116,
                 wire64,
                 wire34,
                 wire33,
                 wire89,
                 reg128,
                 reg127,
                 (1'h0)};
  assign wire33 = {($signed({(|wire30)}) * wire32),
                      $signed((&wire29[(2'h3):(1'h1)]))};
  assign wire34 = (~|$unsigned(wire33));
  module35 #() modinst65 (.wire36(wire34), .clk(clk), .y(wire64), .wire38(wire32), .wire39(wire29), .wire37(wire33), .wire40(wire30));
  module66 #() modinst90 (.wire71(wire64), .clk(clk), .wire70(wire33), .y(wire89), .wire67(wire34), .wire68(wire32), .wire69(wire30));
  module91 #() modinst117 (wire116, clk, wire89, wire31, wire32, wire64);
  assign wire118 = $signed((^~wire31[(2'h2):(1'h0)]));
  assign wire119 = (($signed((wire89[(4'h9):(2'h3)] ?
                           (~^(8'haf)) : (~wire32))) ?
                       (wire34 ?
                           wire34 : $unsigned(wire29)) : (+$unsigned((wire31 ~^ (7'h44))))) >> wire34);
  assign wire120 = $unsigned({(+$unsigned($signed(wire64)))});
  assign wire121 = wire119[(3'h5):(3'h4)];
  assign wire122 = ($signed($signed((wire119[(2'h3):(1'h1)] & wire29[(4'hb):(1'h1)]))) ?
                       wire89[(2'h2):(1'h1)] : {(~(-(wire64 ?
                               wire116 : (8'hbe))))});
  assign wire123 = (wire30[(5'h14):(4'h9)] << $unsigned((8'hba)));
  assign wire124 = wire122[(4'hc):(4'h9)];
  assign wire125 = $signed($unsigned(($signed(wire29) != (~|wire124[(5'h10):(4'hf)]))));
  assign wire126 = (&$signed(($signed(wire33[(4'hf):(4'hc)]) ?
                       $unsigned($unsigned(wire122)) : $unsigned((wire122 ?
                           wire123 : (8'hbe))))));
  always
    @(posedge clk) begin
      reg127 <= ($unsigned((~&(8'ha6))) ?
          wire124 : $signed($signed($unsigned($unsigned((8'h9c))))));
      reg128 <= $signed((wire31 ?
          {((~&wire30) & $signed(wire64))} : $signed((wire30[(2'h2):(2'h2)] >> {wire124}))));
    end
endmodule

module module9
#(parameter param20 = ((~|((&(+(8'h9d))) || (~&(~^(8'hb1))))) ~^ ((~((~^(8'hbc)) ? {(8'hbe)} : ((8'hb0) - (8'ha0)))) ? ((^~((8'hae) ? (8'hb9) : (8'hbb))) ? (!((8'haa) < (8'ha0))) : {{(7'h43), (8'ha0)}}) : (({(8'hb4), (8'hab)} ? ((7'h41) ? (8'ha6) : (8'haa)) : ((7'h43) ? (7'h43) : (8'ha9))) ? (^~{(8'ha7)}) : ((-(7'h41)) != ((8'ha1) ? (8'hbc) : (8'ha0)))))))
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire14;
  input wire [(4'hd):(1'h0)] wire13;
  input wire signed [(4'he):(1'h0)] wire12;
  input wire signed [(4'ha):(1'h0)] wire11;
  input wire [(4'hd):(1'h0)] wire10;
  wire [(3'h4):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire18;
  wire [(4'ha):(1'h0)] wire17;
  wire [(4'hb):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire15;
  assign y = {wire19, wire18, wire17, wire16, wire15, (1'h0)};
  assign wire15 = {{wire12},
                      ($unsigned((8'ha1)) ?
                          ((wire14[(1'h0):(1'h0)] ~^ (wire11 - wire11)) + ((7'h44) ?
                              (~|wire10) : ((8'haa) ^ wire10))) : $signed(wire10))};
  assign wire16 = wire14[(4'hf):(4'ha)];
  assign wire17 = $signed(wire13[(3'h7):(1'h1)]);
  assign wire18 = (^$unsigned((((8'ha3) ?
                      (wire14 <= wire13) : (wire14 ?
                          wire11 : wire15)) >>> (&(|wire14)))));
  assign wire19 = wire17[(3'h7):(2'h3)];
endmodule

module module91
#(parameter param115 = (((+((|(8'hb8)) ? ((8'h9d) > (8'haf)) : ((7'h44) == (8'ha4)))) ? ((~&(~&(8'hb7))) ? (((7'h43) <<< (8'h9e)) ^ ((8'hb7) ? (8'hb5) : (8'ha9))) : {((8'hb6) ^ (8'ha3))}) : (~&((8'hbf) ? ((8'hbf) + (8'ha1)) : (^~(8'hae))))) | ((((!(8'had)) ? ((7'h41) ? (8'hb8) : (8'hac)) : ((8'h9c) ? (8'haa) : (8'had))) ? (((7'h43) ? (8'ha9) : (8'ha4)) ^~ ((8'ha8) - (8'hac))) : {(~(8'ha4)), {(8'ha5)}}) && (~&{{(8'h9c)}, ((8'hb3) <<< (8'hb0))}))))
(y, clk, wire95, wire94, wire93, wire92);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire95;
  input wire signed [(4'hf):(1'h0)] wire94;
  input wire [(4'hb):(1'h0)] wire93;
  input wire [(4'h9):(1'h0)] wire92;
  wire [(5'h13):(1'h0)] wire114;
  wire signed [(5'h10):(1'h0)] wire113;
  wire signed [(3'h5):(1'h0)] wire112;
  wire [(3'h7):(1'h0)] wire111;
  wire signed [(4'h9):(1'h0)] wire110;
  wire signed [(3'h6):(1'h0)] wire109;
  wire signed [(4'he):(1'h0)] wire108;
  wire [(5'h10):(1'h0)] wire107;
  wire signed [(3'h4):(1'h0)] wire106;
  wire signed [(3'h4):(1'h0)] wire105;
  wire [(5'h15):(1'h0)] wire104;
  wire signed [(4'he):(1'h0)] wire103;
  wire signed [(4'ha):(1'h0)] wire102;
  wire signed [(4'hf):(1'h0)] wire99;
  wire signed [(2'h2):(1'h0)] wire98;
  wire [(4'hc):(1'h0)] wire97;
  wire signed [(3'h4):(1'h0)] wire96;
  reg signed [(4'hf):(1'h0)] reg101 = (1'h0);
  reg [(3'h7):(1'h0)] reg100 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 reg101,
                 reg100,
                 (1'h0)};
  assign wire96 = $unsigned(($signed(((wire95 ? wire93 : (8'hbe)) ?
                          $signed(wire94) : (~^wire92))) ?
                      wire93[(3'h6):(2'h3)] : $signed($signed((~&wire94)))));
  assign wire97 = (~&((^~(8'h9f)) || ($signed(((7'h40) > wire95)) ?
                      $signed(((8'hbb) || wire96)) : ($unsigned(wire94) || (~(8'hac))))));
  assign wire98 = (wire92[(3'h4):(1'h1)] ~^ $signed(wire96));
  assign wire99 = wire96[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg100 <= (~wire97[(2'h3):(2'h2)]);
      reg101 <= {$unsigned((~((wire94 ? wire94 : wire95) ?
              $signed((8'ha0)) : (~(8'hab))))),
          wire96[(1'h0):(1'h0)]};
    end
  assign wire102 = (^wire97[(2'h2):(2'h2)]);
  assign wire103 = $signed(((((wire97 && wire102) ? $signed(wire99) : wire95) ?
                       wire102 : (+reg101)) ^~ wire102));
  assign wire104 = $unsigned(reg101);
  assign wire105 = (-wire92);
  assign wire106 = (+($signed(wire92[(1'h0):(1'h0)]) * $unsigned($unsigned(wire92))));
  assign wire107 = ({wire106,
                       (($signed(wire105) | {wire106, wire99}) ?
                           wire97 : (~^(wire106 ?
                               wire106 : wire99)))} != wire92[(3'h4):(2'h3)]);
  assign wire108 = $signed({(^~$unsigned((wire97 >= wire103))),
                       wire95[(1'h1):(1'h0)]});
  assign wire109 = $signed(wire97[(4'ha):(4'ha)]);
  assign wire110 = (8'ha0);
  assign wire111 = (reg101[(4'h8):(3'h4)] ?
                       ($unsigned(((wire108 ? reg101 : (8'ha6)) ?
                               {wire94} : $unsigned(wire97))) ?
                           (wire92 ?
                               (~^wire93[(3'h5):(1'h0)]) : $unsigned(wire96)) : wire106[(2'h3):(1'h0)]) : ($signed((~&$signed(wire108))) >> wire103[(4'hb):(4'h9)]));
  assign wire112 = ((-$signed($unsigned(wire110[(2'h3):(1'h1)]))) >= $unsigned($signed(wire107[(1'h1):(1'h0)])));
  assign wire113 = wire111;
  assign wire114 = $signed($signed({((wire111 ?
                           wire97 : wire105) ~^ (reg101 == wire108)),
                       ((~wire113) ? (!(8'hbf)) : (8'hbe))}));
endmodule

module module66
#(parameter param88 = ({(((-(8'ha4)) >= (8'ha0)) > (((8'ha5) >= (8'ha9)) ? ((8'h9f) - (7'h44)) : ((7'h40) <<< (8'ha9))))} ? ({(((8'h9f) ? (8'hbf) : (8'h9c)) >> ((8'hb4) ? (8'hbd) : (7'h44))), (^(~|(8'h9c)))} ? {(8'hbd)} : (7'h41)) : (-((-((8'hb2) ? (8'ha7) : (8'hb0))) ? (((8'hb5) >= (8'haa)) ? ((8'h9e) | (8'hbf)) : ((8'hab) ? (7'h44) : (8'hb6))) : {((8'had) != (8'ha4)), ((8'hb2) || (8'hab))}))))
(y, clk, wire71, wire70, wire69, wire68, wire67);
  output wire [(32'hcb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire71;
  input wire signed [(5'h15):(1'h0)] wire70;
  input wire [(3'h7):(1'h0)] wire69;
  input wire [(4'ha):(1'h0)] wire68;
  input wire [(5'h10):(1'h0)] wire67;
  wire signed [(5'h10):(1'h0)] wire87;
  wire [(5'h13):(1'h0)] wire86;
  wire signed [(5'h10):(1'h0)] wire85;
  wire [(4'hc):(1'h0)] wire84;
  wire [(3'h5):(1'h0)] wire83;
  wire [(4'h8):(1'h0)] wire82;
  wire signed [(5'h14):(1'h0)] wire81;
  wire [(4'h8):(1'h0)] wire80;
  wire [(3'h6):(1'h0)] wire74;
  wire [(4'hd):(1'h0)] wire73;
  wire [(5'h13):(1'h0)] wire72;
  reg [(4'hb):(1'h0)] reg79 = (1'h0);
  reg [(3'h6):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire74,
                 wire73,
                 wire72,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 (1'h0)};
  assign wire72 = (|{((-wire68[(3'h4):(2'h3)]) ?
                          $signed(wire67) : (~$unsigned(wire70))),
                      wire71});
  assign wire73 = (~$signed($signed($unsigned(wire71[(1'h0):(1'h0)]))));
  assign wire74 = $unsigned($unsigned((~&wire68[(3'h4):(1'h1)])));
  always
    @(posedge clk) begin
      reg75 <= (^~$unsigned((($signed((8'h9c)) ?
          (!wire74) : wire69) ^~ {wire67[(4'hf):(4'hf)]})));
      reg76 <= wire73;
      reg77 <= $unsigned(((8'ha3) == $signed(wire69[(2'h3):(2'h3)])));
    end
  always
    @(posedge clk) begin
      reg78 <= ($signed((~$signed($unsigned(wire72)))) ?
          ((($unsigned(wire74) ?
                  $unsigned(wire70) : (wire73 ? wire68 : (8'ha1))) ?
              reg77 : {{wire71},
                  $signed(wire74)}) | (($unsigned(wire74) <<< {wire74}) != (8'hb3))) : $signed((wire73[(4'hc):(4'hb)] != (!((8'hbb) >>> wire73)))));
      reg79 <= (!((^$unsigned($unsigned(wire69))) - reg76[(4'hc):(3'h5)]));
    end
  assign wire80 = {{$unsigned(wire70[(3'h5):(1'h1)]),
                          (!({wire68} ^ $unsigned(reg78)))}};
  assign wire81 = wire71[(4'he):(4'ha)];
  assign wire82 = wire70;
  assign wire83 = (~|(reg79[(4'hb):(1'h0)] ^ ($unsigned((!reg76)) >>> $signed(reg79[(3'h5):(1'h1)]))));
  assign wire84 = (~^($signed(((~wire72) ?
                      wire83 : (~&wire81))) >>> $unsigned((!wire80))));
  assign wire85 = reg77;
  assign wire86 = $signed($signed((($unsigned(wire85) ?
                          (wire81 >= wire73) : (reg75 ? wire73 : wire71)) ?
                      (!wire85) : ($signed(reg77) != $signed(wire84)))));
  assign wire87 = wire70;
endmodule

module module35
#(parameter param62 = ((~|((((8'had) ? (8'hb4) : (8'hbd)) ^~ ((8'hbb) > (8'hb6))) < ((~|(7'h43)) ? ((8'had) << (8'ha9)) : (~|(8'ha0))))) ? (~^(({(8'ha2)} >> (!(8'ha3))) ? (((8'hb8) << (7'h41)) ^~ (~|(8'ha0))) : (8'hb4))) : (+(8'ha2))), 
parameter param63 = (+({(~{(7'h40), param62}), (~|((8'hb8) < param62))} || (^~({param62} ? {param62} : param62)))))
(y, clk, wire40, wire39, wire38, wire37, wire36);
  output wire [(32'h101):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire40;
  input wire [(4'he):(1'h0)] wire39;
  input wire signed [(4'hc):(1'h0)] wire38;
  input wire [(4'h8):(1'h0)] wire37;
  input wire signed [(4'h8):(1'h0)] wire36;
  wire signed [(2'h2):(1'h0)] wire61;
  wire [(4'hd):(1'h0)] wire60;
  wire signed [(4'h8):(1'h0)] wire59;
  wire [(4'he):(1'h0)] wire58;
  wire signed [(4'hf):(1'h0)] wire57;
  wire signed [(4'h9):(1'h0)] wire56;
  wire [(4'h9):(1'h0)] wire55;
  wire [(5'h11):(1'h0)] wire54;
  wire signed [(5'h11):(1'h0)] wire53;
  wire signed [(5'h15):(1'h0)] wire51;
  wire signed [(4'he):(1'h0)] wire50;
  wire signed [(2'h2):(1'h0)] wire49;
  wire [(5'h12):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire47;
  wire signed [(4'h9):(1'h0)] wire46;
  wire signed [(5'h15):(1'h0)] wire45;
  wire [(4'hf):(1'h0)] wire44;
  wire [(5'h11):(1'h0)] wire43;
  wire signed [(2'h2):(1'h0)] wire42;
  wire [(3'h6):(1'h0)] wire41;
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 reg52,
                 (1'h0)};
  assign wire41 = wire36[(4'h8):(3'h4)];
  assign wire42 = ({(^$signed((^wire39)))} >>> (^~wire39));
  assign wire43 = wire40[(1'h0):(1'h0)];
  assign wire44 = (wire38[(3'h7):(3'h6)] * $unsigned({wire42[(1'h1):(1'h1)],
                      wire38}));
  assign wire45 = ($signed(wire43) ?
                      wire38[(4'h9):(3'h6)] : (&$unsigned(wire44)));
  assign wire46 = (-(wire36 ? wire36[(1'h0):(1'h0)] : wire44[(1'h0):(1'h0)]));
  assign wire47 = $unsigned((~^$unsigned((~&wire39))));
  assign wire48 = ((wire37 <= wire36) ^ wire45[(5'h11):(2'h3)]);
  assign wire49 = $signed(wire45[(1'h1):(1'h0)]);
  assign wire50 = wire37;
  assign wire51 = (~^{(($unsigned(wire48) ?
                              {wire45, wire41} : wire42[(2'h2):(2'h2)]) ?
                          $unsigned(wire46[(1'h0):(1'h0)]) : ((~(7'h42)) ?
                              (wire42 ? wire39 : wire45) : {wire39})),
                      (!wire40[(5'h13):(3'h4)])});
  always
    @(posedge clk) begin
      reg52 <= (^~{$signed(wire43[(5'h10):(3'h5)])});
    end
  assign wire53 = $signed($unsigned($unsigned((wire43[(5'h11):(4'hf)] | wire42))));
  assign wire54 = $signed((^(^~((+wire39) ? {wire37} : $signed(wire51)))));
  assign wire55 = {wire54, $signed(wire44[(4'hd):(3'h4)])};
  assign wire56 = $signed((((-(^(8'hb0))) ?
                      (((8'hb9) <<< wire48) ^~ wire46[(4'h8):(3'h5)]) : reg52) == (wire46 <= (~^{(7'h42)}))));
  assign wire57 = ((wire51 ?
                      $signed($unsigned(wire49[(1'h1):(1'h0)])) : reg52) + wire53[(3'h4):(1'h0)]);
  assign wire58 = ({((|wire36[(2'h2):(2'h2)]) || (~|$unsigned(wire57)))} != wire50[(4'h8):(2'h3)]);
  assign wire59 = ((|$unsigned($signed((~^wire38)))) << $unsigned({wire50[(1'h1):(1'h1)]}));
  assign wire60 = wire38;
  assign wire61 = (wire37[(4'h8):(4'h8)] || wire37);
endmodule
