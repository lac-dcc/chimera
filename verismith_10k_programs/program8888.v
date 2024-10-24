module top
#(parameter param165 = ((8'hb8) ? ((((&(8'ha1)) ? ((7'h43) ? (8'hac) : (8'hbc)) : ((8'ha5) <<< (8'hbc))) ? (|((8'had) ? (8'hb1) : (7'h43))) : (((8'hae) ? (8'h9f) : (8'hb0)) > ((8'ha9) ? (8'ha6) : (8'hb4)))) ? (-(+((8'hb0) != (8'ha0)))) : ((&((8'hb1) ? (7'h44) : (8'hbd))) ? {(^~(8'hbe)), (!(8'ha0))} : {(^(8'hb4))})) : (((~|((8'h9f) < (7'h40))) ^~ (((8'h9c) >>> (8'h9f)) ? ((8'hbe) ? (8'haf) : (8'hbe)) : (~(8'h9c)))) - {(((7'h44) ? (8'hb9) : (8'ha2)) ? ((8'hb3) ? (7'h40) : (8'ha3)) : ((8'ha6) ? (8'hb2) : (8'hb3))), (((8'hb3) ? (8'hb3) : (8'hb2)) >> (~(8'h9e)))})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hb3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire163;
  wire [(4'hf):(1'h0)] wire162;
  wire [(4'h8):(1'h0)] wire161;
  wire signed [(4'he):(1'h0)] wire158;
  wire signed [(5'h10):(1'h0)] wire88;
  wire signed [(5'h11):(1'h0)] wire87;
  wire [(5'h13):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire85;
  reg signed [(5'h13):(1'h0)] reg160 = (1'h0);
  reg [(5'h15):(1'h0)] reg89 = (1'h0);
  assign y = {wire163,
                 wire162,
                 wire161,
                 wire158,
                 wire88,
                 wire87,
                 wire5,
                 wire6,
                 wire85,
                 reg160,
                 reg89,
                 (1'h0)};
  assign wire5 = $unsigned($signed((wire1 ?
                     $signed($unsigned(wire0)) : (-$signed(wire4)))));
  assign wire6 = (-(~^wire0));
  module7 #() modinst86 (.y(wire85), .clk(clk), .wire8(wire1), .wire12(wire2), .wire10(wire6), .wire11(wire5), .wire9(wire4));
  assign wire87 = wire0;
  assign wire88 = ((wire5[(5'h13):(5'h11)] ?
                          $signed((wire3[(1'h0):(1'h0)] ?
                              (wire85 ?
                                  wire87 : wire87) : (^wire3))) : wire2[(3'h7):(2'h3)]) ?
                      $signed(wire5) : wire4);
  always
    @(posedge clk) begin
      reg89 <= wire88[(3'h7):(3'h5)];
    end
  module90 #() modinst159 (wire158, clk, wire1, wire87, wire6, wire0);
  always
    @(posedge clk) begin
      reg160 <= wire6[(4'h8):(4'h8)];
    end
  assign wire161 = (&((^~$unsigned((wire88 * wire1))) ?
                       wire85 : $signed((7'h42))));
  assign wire162 = $signed($signed(wire161[(1'h1):(1'h0)]));
  module13 #() modinst164 (wire163, clk, wire4, wire6, wire0, wire158);
endmodule

module module90
#(parameter param157 = {(~^({((8'ha2) ? (8'hac) : (8'had))} >= (~&((8'haf) < (8'hb0)))))})
(y, clk, wire91, wire92, wire93, wire94);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire91;
  input wire [(5'h11):(1'h0)] wire92;
  input wire signed [(4'ha):(1'h0)] wire93;
  input wire signed [(5'h11):(1'h0)] wire94;
  wire signed [(3'h5):(1'h0)] wire95;
  wire [(4'hb):(1'h0)] wire96;
  wire [(5'h13):(1'h0)] wire100;
  wire signed [(4'h9):(1'h0)] wire101;
  wire signed [(3'h4):(1'h0)] wire102;
  wire signed [(4'hb):(1'h0)] wire104;
  wire signed [(4'he):(1'h0)] wire105;
  wire [(3'h5):(1'h0)] wire106;
  wire signed [(2'h2):(1'h0)] wire107;
  wire signed [(5'h11):(1'h0)] wire108;
  wire [(4'hd):(1'h0)] wire109;
  wire [(5'h12):(1'h0)] wire110;
  wire signed [(4'hc):(1'h0)] wire111;
  wire [(2'h2):(1'h0)] wire155;
  reg signed [(2'h3):(1'h0)] reg103 = (1'h0);
  reg [(4'hf):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg97 = (1'h0);
  assign y = {wire95,
                 wire96,
                 wire100,
                 wire101,
                 wire102,
                 wire104,
                 wire105,
                 wire106,
                 wire107,
                 wire108,
                 wire109,
                 wire110,
                 wire111,
                 wire155,
                 reg103,
                 reg99,
                 reg98,
                 reg97,
                 (1'h0)};
  assign wire95 = (!($signed((wire91[(4'he):(4'hb)] < $signed(wire93))) ?
                      ({(wire93 > wire93)} ?
                          $unsigned(wire93[(4'h8):(3'h6)]) : (wire91 >= wire93)) : wire91[(3'h7):(3'h5)]));
  assign wire96 = (wire95 ?
                      (|((~|(~&wire91)) ?
                          (wire91[(4'hb):(3'h6)] ?
                              $unsigned(wire93) : wire93) : (8'hbf))) : ((|wire93) << $signed({$unsigned(wire93)})));
  always
    @(posedge clk) begin
      reg97 <= wire92[(3'h6):(1'h0)];
      reg98 <= $unsigned((~&(!$signed($signed(reg97)))));
      reg99 <= $signed($signed(((|wire95) & reg97[(1'h0):(1'h0)])));
    end
  assign wire100 = reg98;
  assign wire101 = (wire100 < ($signed(wire92[(3'h5):(2'h2)]) ?
                       ((~&wire96[(2'h3):(2'h3)]) ?
                           reg98 : {wire91[(3'h5):(1'h0)],
                               (~|reg99)}) : reg99));
  assign wire102 = {wire91[(2'h2):(1'h0)],
                       (&($signed($signed(reg97)) && ($signed(wire95) ~^ wire94)))};
  always
    @(posedge clk) begin
      reg103 <= ({(({reg98, reg97} ? (wire100 << reg98) : reg97) ?
              $signed((~&wire101)) : (wire101 ? (~wire93) : reg99)),
          {({reg97} - (wire101 ^~ wire100)), wire95}} ~^ ($signed((!{wire93,
              reg97})) ?
          (({wire93} ?
              (~wire102) : (+wire91)) >>> (-wire96)) : $signed({wire96[(2'h3):(1'h1)],
              wire92})));
    end
  assign wire104 = {$signed(wire94[(3'h4):(1'h1)]),
                       $unsigned(((-(~wire91)) ?
                           wire94 : reg97[(3'h7):(2'h3)]))};
  assign wire105 = (reg97[(3'h4):(1'h0)] ?
                       wire94[(2'h3):(2'h3)] : $signed({reg99}));
  assign wire106 = ($unsigned((($signed((8'hbf)) && (~wire91)) ?
                       (~&(wire105 ?
                           wire96 : wire102)) : wire95[(3'h4):(1'h1)])) <<< wire105);
  assign wire107 = ({reg98} ?
                       (~((&$signed(wire101)) ~^ wire92[(3'h4):(1'h1)])) : $unsigned(($signed((reg99 > (7'h42))) ?
                           ((wire92 ?
                               wire105 : reg98) << $unsigned(wire94)) : ((wire100 ?
                                   reg99 : wire96) ?
                               (wire106 ?
                                   (8'h9f) : wire94) : (wire94 >>> reg97)))));
  assign wire108 = reg97;
  assign wire109 = $signed(($signed($unsigned({wire106, (8'hbf)})) ?
                       ((~$signed(wire102)) ?
                           wire108 : $signed((wire104 * wire101))) : (~^wire101[(4'h8):(3'h7)])));
  assign wire110 = $unsigned(($signed((^(!wire100))) == $unsigned(wire104)));
  assign wire111 = wire95[(3'h5):(1'h0)];
  module112 #() modinst156 (wire155, clk, wire91, wire110, wire105, wire94, wire92);
endmodule

module module7  (y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'h74):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire [(3'h7):(1'h0)] wire9;
  input wire signed [(5'h13):(1'h0)] wire10;
  input wire [(5'h13):(1'h0)] wire11;
  input wire [(5'h11):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire84;
  wire signed [(3'h4):(1'h0)] wire83;
  wire signed [(4'hc):(1'h0)] wire82;
  wire signed [(2'h2):(1'h0)] wire81;
  wire [(3'h7):(1'h0)] wire80;
  wire [(4'hb):(1'h0)] wire79;
  wire [(2'h2):(1'h0)] wire78;
  wire signed [(5'h10):(1'h0)] wire77;
  wire [(3'h5):(1'h0)] wire76;
  wire [(4'hf):(1'h0)] wire75;
  wire signed [(2'h2):(1'h0)] wire74;
  wire [(3'h7):(1'h0)] wire57;
  wire signed [(5'h12):(1'h0)] wire72;
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire57,
                 wire72,
                 (1'h0)};
  module13 #() modinst58 (.wire14(wire9), .wire15(wire11), .wire17(wire12), .clk(clk), .y(wire57), .wire16(wire8));
  module59 #() modinst73 (.clk(clk), .wire62(wire12), .wire61(wire10), .y(wire72), .wire63(wire57), .wire64(wire9), .wire60(wire11));
  assign wire74 = ((^(~|(^wire10[(2'h2):(1'h0)]))) ?
                      wire8 : (-$signed((-wire9[(3'h6):(3'h5)]))));
  assign wire75 = {((~^(+(~&wire57))) != $signed((wire57 != $unsigned(wire9)))),
                      wire10};
  assign wire76 = wire72[(4'hd):(3'h6)];
  assign wire77 = {(~|(~$unsigned($signed(wire11))))};
  assign wire78 = (^~(wire72 * (8'hbd)));
  assign wire79 = wire11;
  assign wire80 = wire76[(2'h3):(1'h1)];
  assign wire81 = (wire79[(4'h8):(3'h6)] ?
                      (($signed(wire8) ?
                              $unsigned({wire12}) : $unsigned($unsigned(wire72))) ?
                          wire77[(5'h10):(5'h10)] : ((7'h43) ?
                              wire80 : ($signed(wire77) < wire74[(1'h0):(1'h0)]))) : wire75[(3'h7):(3'h7)]);
  assign wire82 = ($unsigned((8'hbc)) <= ({wire81, (-wire10[(4'h8):(3'h5)])} ?
                      $signed({$signed(wire12)}) : $unsigned(wire74[(1'h0):(1'h0)])));
  assign wire83 = $signed(wire9[(3'h5):(3'h5)]);
  assign wire84 = (~wire75[(4'h9):(2'h2)]);
endmodule

module module59  (y, clk, wire64, wire63, wire62, wire61, wire60);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire64;
  input wire signed [(3'h7):(1'h0)] wire63;
  input wire signed [(4'ha):(1'h0)] wire62;
  input wire [(5'h12):(1'h0)] wire61;
  input wire signed [(3'h7):(1'h0)] wire60;
  wire signed [(4'h9):(1'h0)] wire71;
  wire [(5'h12):(1'h0)] wire70;
  wire signed [(3'h6):(1'h0)] wire69;
  wire signed [(4'hd):(1'h0)] wire68;
  wire signed [(4'hb):(1'h0)] wire67;
  wire [(5'h13):(1'h0)] wire66;
  wire [(4'hd):(1'h0)] wire65;
  assign y = {wire71, wire70, wire69, wire68, wire67, wire66, wire65, (1'h0)};
  assign wire65 = ($signed($signed(wire63[(3'h6):(3'h4)])) ?
                      wire60[(1'h1):(1'h1)] : wire61);
  assign wire66 = $signed(((!wire63) ?
                      (({(8'ha1)} && wire65[(4'hc):(2'h2)]) >>> $signed($signed(wire62))) : wire63[(1'h0):(1'h0)]));
  assign wire67 = wire60;
  assign wire68 = ($signed($unsigned(wire65[(2'h2):(2'h2)])) ?
                      $signed(($signed(wire66[(5'h13):(5'h12)]) >= (&$signed(wire62)))) : {$unsigned(($unsigned(wire66) + (wire63 ?
                              wire60 : wire66))),
                          {($unsigned(wire63) ?
                                  wire60[(3'h5):(2'h3)] : (wire61 <<< wire62))}});
  assign wire69 = ($unsigned(($unsigned(wire65[(2'h2):(1'h0)]) - wire68)) ~^ (+($unsigned({wire68}) >> {(wire66 ?
                          (8'hb6) : wire63),
                      (wire68 - wire61)})));
  assign wire70 = (($unsigned(wire67[(4'hb):(4'ha)]) ?
                      wire69 : $unsigned($signed((wire63 >> wire69)))) << $unsigned({(!{wire68,
                          wire65}),
                      {wire63[(3'h7):(3'h4)]}}));
  assign wire71 = (~&$signed(wire67[(3'h4):(3'h4)]));
endmodule

module module13
#(parameter param56 = {(((((8'h9d) < (8'ha8)) | (~&(8'h9e))) > (((8'hbb) ? (8'hbe) : (8'ha3)) <<< ((8'h9c) ? (8'hbb) : (8'hbb)))) + ((!((8'hb3) - (8'hbd))) ? ((~|(8'hbd)) || ((7'h43) ? (8'hba) : (8'hab))) : (((8'hb8) ? (8'h9e) : (8'hbe)) <= (8'haf))))})
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h1bf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire17;
  input wire [(5'h11):(1'h0)] wire16;
  input wire signed [(5'h13):(1'h0)] wire15;
  input wire signed [(3'h6):(1'h0)] wire14;
  wire signed [(4'h8):(1'h0)] wire55;
  wire [(5'h14):(1'h0)] wire54;
  wire [(5'h10):(1'h0)] wire53;
  wire [(2'h2):(1'h0)] wire52;
  wire [(3'h6):(1'h0)] wire51;
  wire [(4'h9):(1'h0)] wire50;
  wire signed [(4'hf):(1'h0)] wire49;
  wire signed [(4'h8):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire47;
  wire signed [(3'h7):(1'h0)] wire46;
  wire signed [(3'h7):(1'h0)] wire31;
  wire signed [(4'h8):(1'h0)] wire30;
  wire signed [(4'hc):(1'h0)] wire29;
  wire signed [(5'h11):(1'h0)] wire23;
  wire [(4'he):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire20;
  wire signed [(3'h6):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire18;
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(4'h9):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire31,
                 wire30,
                 wire29,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
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
                 reg32,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire18 = (7'h40);
  assign wire19 = wire17[(3'h4):(3'h4)];
  assign wire20 = ((~&((((8'hbb) ? wire18 : wire17) ?
                          $unsigned(wire18) : (wire19 == wire16)) > ((^~(8'ha6)) ?
                          $unsigned(wire14) : $signed(wire16)))) ?
                      wire19 : ($unsigned($unsigned(wire16[(4'he):(4'hb)])) ?
                          (((wire16 || wire18) ?
                                  $unsigned(wire18) : wire14[(3'h4):(2'h3)]) ?
                              wire19[(1'h1):(1'h0)] : $signed(((8'hb5) ?
                                  wire17 : wire15))) : wire17));
  assign wire21 = ($signed((wire20[(4'hb):(3'h5)] ?
                          wire20[(2'h2):(1'h0)] : (wire14[(1'h1):(1'h0)] ?
                              wire20 : (wire17 ? wire19 : wire17)))) ?
                      ((-$unsigned(wire20[(1'h1):(1'h0)])) ?
                          $unsigned($signed($signed(wire15))) : {(wire20[(4'ha):(2'h3)] & wire19[(2'h2):(1'h1)]),
                              (wire20 ?
                                  $unsigned(wire20) : wire17)}) : ((&$signed((8'hb6))) ?
                          wire20[(2'h2):(1'h0)] : (-$signed(wire15[(5'h11):(1'h1)]))));
  assign wire22 = wire14[(3'h5):(1'h1)];
  assign wire23 = $signed($signed(((^$signed(wire15)) | wire20[(4'hc):(1'h1)])));
  always
    @(posedge clk) begin
      reg24 <= {{wire20}};
      reg25 <= (~|wire22);
    end
  always
    @(posedge clk) begin
      reg26 <= $signed($signed((~^(+(~&wire21)))));
    end
  always
    @(posedge clk) begin
      reg27 <= $signed(wire15);
      reg28 <= reg27;
    end
  assign wire29 = (~|($signed(reg25[(4'hc):(1'h0)]) >>> ((wire15 << (reg26 > wire21)) ?
                      $signed(((8'hbc) ?
                          (8'ha4) : wire20)) : wire21[(4'hb):(2'h2)])));
  assign wire30 = (~|((^~(wire17 ?
                      {wire15} : reg24)) ^ $unsigned($signed({wire15,
                      reg27}))));
  assign wire31 = $signed({((|(-wire18)) ?
                          $unsigned((^~(8'hb9))) : $unsigned(reg25)),
                      reg28[(1'h1):(1'h1)]});
  always
    @(posedge clk) begin
      if (wire23[(4'ha):(4'h8)])
        begin
          reg32 <= (^~$signed($unsigned((+(~|wire29)))));
          reg33 <= (8'h9d);
          reg34 <= $unsigned((reg27[(1'h0):(1'h0)] ?
              wire14[(3'h5):(3'h5)] : wire23[(5'h11):(4'hd)]));
        end
      else
        begin
          reg32 <= ($unsigned($unsigned(($signed((8'hbf)) << $unsigned((7'h40))))) | wire22[(4'hd):(3'h4)]);
        end
      reg35 <= $signed({reg33});
      if ((reg26 | $signed(wire23[(1'h0):(1'h0)])))
        begin
          reg36 <= ((wire17 ? wire23[(2'h3):(1'h1)] : $unsigned(wire21)) ?
              (($unsigned((^reg24)) >> {$signed(wire22)}) < (~&{$signed(wire19),
                  wire29[(4'hb):(4'hb)]})) : ((reg33[(1'h0):(1'h0)] ?
                      (&((8'hb2) ? reg28 : (8'hb1))) : reg32[(3'h7):(2'h2)]) ?
                  ((~&(reg26 ? reg24 : wire18)) ?
                      $unsigned($signed(reg25)) : wire23) : wire17[(3'h4):(3'h4)]));
        end
      else
        begin
          if (((($unsigned(reg27) <= {(wire16 & wire22),
                  (wire20 ? reg28 : wire15)}) ^ wire15[(4'hb):(4'h8)]) ?
              ($signed(((reg35 >= reg24) ^~ $signed((8'hb8)))) * (7'h44)) : ((^~$signed($unsigned((8'ha9)))) ?
                  {($unsigned(reg27) >> $unsigned(wire29)),
                      $signed((&reg27))} : {$signed($signed(wire30))})))
            begin
              reg36 <= $unsigned((^(~reg35[(3'h5):(1'h0)])));
              reg37 <= ($signed({((8'ha8) ?
                          wire22[(4'h8):(3'h6)] : $signed(wire16))}) ?
                  $unsigned($unsigned($unsigned((wire15 ?
                      (8'hbc) : wire29)))) : $signed((&{reg36[(1'h0):(1'h0)],
                      $unsigned(wire29)})));
            end
          else
            begin
              reg36 <= $signed(((!$unsigned($unsigned(reg36))) ?
                  $signed(wire30[(2'h3):(2'h2)]) : $unsigned({((8'hb6) ?
                          wire29 : reg27)})));
              reg37 <= ((|$signed((~(reg32 + wire22)))) ?
                  (~&$signed((((8'ha0) ?
                      wire17 : (8'h9e)) || {wire20}))) : (&(8'hbe)));
              reg38 <= $signed(((~&({wire19} ?
                  {wire29} : $signed(wire17))) ^ reg25[(3'h6):(2'h2)]));
              reg39 <= (reg36[(2'h3):(2'h3)] ?
                  {$signed(({(8'hb0)} ? (wire22 ? wire16 : reg38) : (-wire14))),
                      (wire31[(1'h0):(1'h0)] ?
                          {$signed(wire30),
                              $unsigned(wire14)} : {$signed(reg33)})} : $signed(wire31[(2'h3):(2'h2)]));
            end
          reg40 <= wire15[(5'h12):(2'h2)];
          reg41 <= wire29;
          if ((($signed(wire29) ?
              ({$unsigned(wire19), (wire18 != reg33)} ?
                  $unsigned(reg24[(2'h2):(1'h1)]) : $unsigned(reg40)) : $signed((wire30 ?
                  (wire17 ?
                      wire22 : reg28) : reg37[(4'hb):(4'h9)]))) < (!$signed(reg39[(1'h1):(1'h1)]))))
            begin
              reg42 <= (~|$signed($unsigned(reg26[(3'h6):(2'h3)])));
            end
          else
            begin
              reg42 <= ((~&{(~^(reg39 + (8'hb4)))}) << $unsigned(reg39[(2'h3):(1'h0)]));
              reg43 <= $signed(((((wire17 & wire31) ^ (wire31 && wire29)) >> (~reg42)) ?
                  (({reg38} ?
                      wire19 : (+(8'haf))) == (|(+(8'hab)))) : ($signed(((8'haa) || wire21)) >>> (8'haa))));
              reg44 <= {reg25, (-wire19[(3'h6):(3'h6)])};
            end
          reg45 <= $unsigned(($signed($unsigned((wire23 ? wire15 : wire14))) ?
              $unsigned({(~^wire23)}) : $unsigned({reg28[(1'h0):(1'h0)],
                  {reg40}})));
        end
    end
  assign wire46 = {($signed((wire16 ?
                          (~(8'h9d)) : reg26[(4'h8):(3'h5)])) > {reg42})};
  assign wire47 = $signed(({((!(7'h41)) ?
                          wire21[(3'h7):(1'h0)] : $signed(wire17)),
                      {$signed((8'hb3))}} != (((reg27 <= wire14) ?
                      $signed(reg40) : {wire29}) <= wire21)));
  assign wire48 = $signed(wire16[(2'h3):(2'h3)]);
  assign wire49 = reg34;
  assign wire50 = (^(~|(-(^(!wire18)))));
  assign wire51 = $signed((~|$unsigned($unsigned((!wire14)))));
  assign wire52 = ($unsigned(wire23[(4'ha):(4'h9)]) ?
                      $signed((((!reg44) ?
                          $signed(reg25) : {reg43,
                              wire14}) <<< ($signed((8'hb7)) ?
                          reg26[(1'h0):(1'h0)] : reg45[(3'h7):(3'h6)]))) : $unsigned($signed(reg42)));
  assign wire53 = (wire49[(4'hc):(1'h0)] ?
                      $unsigned({reg43[(4'hc):(4'h9)],
                          reg27}) : wire23[(1'h1):(1'h0)]);
  assign wire54 = (!(^~$unsigned((wire53[(4'hb):(3'h6)] | reg43))));
  assign wire55 = (~^{$unsigned(({(8'hbb)} << reg41)), wire20});
endmodule

module module112
#(parameter param154 = (+{(8'hb3)}))
(y, clk, wire117, wire116, wire115, wire114, wire113);
  output wire [(32'h164):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire117;
  input wire [(5'h12):(1'h0)] wire116;
  input wire [(4'he):(1'h0)] wire115;
  input wire [(5'h11):(1'h0)] wire114;
  input wire signed [(5'h11):(1'h0)] wire113;
  wire [(5'h13):(1'h0)] wire153;
  wire signed [(5'h12):(1'h0)] wire152;
  wire [(4'hd):(1'h0)] wire151;
  wire [(4'h9):(1'h0)] wire142;
  wire [(4'h9):(1'h0)] wire141;
  wire signed [(3'h6):(1'h0)] wire140;
  wire signed [(4'h9):(1'h0)] wire130;
  wire [(3'h7):(1'h0)] wire121;
  wire [(4'ha):(1'h0)] wire120;
  wire signed [(4'hb):(1'h0)] wire119;
  wire [(4'h9):(1'h0)] wire118;
  reg signed [(3'h5):(1'h0)] reg150 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg147 = (1'h0);
  reg [(3'h5):(1'h0)] reg146 = (1'h0);
  reg [(4'h8):(1'h0)] reg145 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg144 = (1'h0);
  reg [(4'he):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg139 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg138 = (1'h0);
  reg [(2'h2):(1'h0)] reg137 = (1'h0);
  reg [(5'h10):(1'h0)] reg136 = (1'h0);
  reg [(4'ha):(1'h0)] reg135 = (1'h0);
  reg [(4'hb):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg131 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg126 = (1'h0);
  reg [(4'h8):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg124 = (1'h0);
  reg [(3'h6):(1'h0)] reg123 = (1'h0);
  reg [(3'h7):(1'h0)] reg122 = (1'h0);
  assign y = {wire153,
                 wire152,
                 wire151,
                 wire142,
                 wire141,
                 wire140,
                 wire130,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 (1'h0)};
  assign wire118 = ((~^{(((8'ha5) ? wire117 : wire116) ?
                               (~|wire117) : (wire114 ? wire113 : wire115))}) ?
                       ((wire115[(1'h1):(1'h1)] ?
                               wire117 : $signed($signed((8'ha3)))) ?
                           (~$unsigned(wire114)) : (((wire117 * wire116) != $signed(wire117)) | {$unsigned(wire113),
                               $unsigned(wire117)})) : wire113);
  assign wire119 = (&$unsigned(wire118[(1'h1):(1'h1)]));
  assign wire120 = (-$unsigned(({((7'h43) ? wire114 : wire114),
                       wire116} < wire113)));
  assign wire121 = $signed(wire119[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      reg122 <= wire113;
      if ($signed(wire116[(3'h5):(2'h3)]))
        begin
          reg123 <= $signed((^wire117));
          reg124 <= wire113;
        end
      else
        begin
          if ($unsigned($signed(wire117[(1'h0):(1'h0)])))
            begin
              reg123 <= reg124[(4'h8):(3'h6)];
              reg124 <= (~(((8'ha1) == (~|wire117[(3'h4):(1'h0)])) ?
                  $unsigned($unsigned($signed((8'hbc)))) : $unsigned(wire120)));
              reg125 <= {wire121,
                  (((wire121[(3'h7):(2'h2)] | $signed(wire116)) ?
                          wire113[(4'h8):(3'h4)] : wire115[(3'h6):(3'h6)]) ?
                      wire121 : (~($unsigned(reg124) && (reg123 ?
                          (8'h9f) : (8'ha7)))))};
              reg126 <= wire118[(4'h8):(3'h7)];
            end
          else
            begin
              reg123 <= wire117;
              reg124 <= (((!{(reg124 ? reg122 : reg122),
                      (wire117 && wire115)}) <= $signed(((wire119 ?
                      wire118 : wire119) ~^ {wire116}))) ?
                  (8'hb1) : $signed(wire120[(1'h1):(1'h0)]));
              reg125 <= $unsigned($signed(reg122));
              reg126 <= wire119;
              reg127 <= $signed(reg124);
            end
          reg128 <= (+((wire118[(1'h0):(1'h0)] << wire116[(1'h1):(1'h1)]) ?
              $signed($signed((^reg125))) : (^((wire116 > wire117) && reg124[(4'hb):(1'h0)]))));
          reg129 <= wire114[(4'hb):(4'h8)];
        end
    end
  assign wire130 = $signed((^~reg123));
  always
    @(posedge clk) begin
      if (reg129)
        begin
          reg131 <= {reg125};
          reg132 <= ((~&$unsigned(($unsigned(wire116) ?
                  $unsigned(wire117) : {reg122}))) ?
              wire113[(4'hf):(4'ha)] : $unsigned((((reg125 > wire114) >>> $signed(reg128)) <<< (reg122[(2'h3):(2'h2)] ?
                  $signed(wire119) : (reg129 == (8'ha1))))));
          if ((($unsigned((8'haf)) ?
              $unsigned(((^wire121) & (+wire121))) : reg132[(1'h1):(1'h0)]) ^ ($signed((|reg124[(3'h5):(3'h4)])) ^~ $signed((((8'ha4) + wire118) <= {reg126})))))
            begin
              reg133 <= {$unsigned({($unsigned(reg126) ?
                          (wire114 | wire121) : (!reg123)),
                      (wire117[(1'h1):(1'h1)] + $signed((8'haa)))})};
              reg134 <= (~^({reg132[(3'h4):(3'h4)],
                      (~|wire120[(3'h6):(2'h2)])} ?
                  wire120 : (wire118 ?
                      (wire130[(3'h7):(3'h7)] && wire121[(3'h4):(3'h4)]) : $signed($unsigned(wire114)))));
              reg135 <= $unsigned(wire117);
              reg136 <= ($unsigned(((reg135 >= {reg125}) | {(-reg129),
                  wire117})) + $signed(reg133));
            end
          else
            begin
              reg133 <= ($unsigned(((7'h44) << wire113)) ?
                  ((wire120 & $signed((reg134 << reg124))) ?
                      $signed(reg126[(5'h10):(4'hc)]) : ($unsigned(reg122[(3'h7):(2'h2)]) <= ($unsigned(reg127) ?
                          $signed(wire116) : (reg124 - reg129)))) : {((~&$unsigned(reg122)) <= (7'h40)),
                      (^(&(reg133 ? wire121 : wire119)))});
              reg134 <= reg133;
              reg135 <= reg123[(2'h3):(2'h2)];
              reg136 <= reg131;
              reg137 <= wire118[(4'h9):(4'h8)];
            end
          reg138 <= $signed($unsigned((~(~|wire118[(3'h5):(1'h1)]))));
        end
      else
        begin
          reg131 <= wire113[(4'hf):(4'hd)];
          reg132 <= (~reg136[(3'h7):(1'h1)]);
        end
      reg139 <= reg127;
    end
  assign wire140 = wire115[(4'hb):(4'hb)];
  assign wire141 = ((8'ha5) ?
                       wire130[(1'h0):(1'h0)] : ($signed(((wire140 ?
                               wire115 : (7'h42)) ?
                           reg122[(2'h3):(2'h2)] : reg129[(3'h5):(1'h0)])) && ({$signed((8'ha7))} << wire120)));
  assign wire142 = reg138[(3'h5):(2'h3)];
  always
    @(posedge clk) begin
      reg143 <= (&$signed((reg124[(3'h6):(2'h3)] ?
          (^~$unsigned(reg131)) : (+reg123[(2'h3):(1'h0)]))));
      reg144 <= (($unsigned((((8'ha3) ?
              wire118 : reg137) + $signed(reg128))) >> reg139) ?
          $unsigned({(reg138 < (reg124 > wire116))}) : wire120);
      reg145 <= reg131[(3'h7):(3'h4)];
      reg146 <= $unsigned($signed({$unsigned((wire130 ? reg136 : reg134))}));
      reg147 <= (reg128[(2'h3):(2'h2)] != (reg131 ?
          ({(wire130 <<< (8'had))} ?
              wire113[(3'h5):(1'h0)] : ($signed(reg127) ?
                  ((8'hb9) == reg132) : (!reg126))) : $unsigned((-(~reg132)))));
    end
  always
    @(posedge clk) begin
      reg148 <= (^{$signed($signed({reg139})), wire116[(1'h0):(1'h0)]});
      reg149 <= ({{($unsigned(wire113) ? (!reg137) : reg136)},
              $unsigned(reg125)} ?
          wire121[(3'h4):(2'h3)] : wire142[(1'h1):(1'h1)]);
      reg150 <= (reg127 ?
          reg125[(3'h7):(3'h7)] : $unsigned(reg143[(3'h4):(3'h4)]));
    end
  assign wire151 = (~$unsigned((($unsigned(wire120) ?
                           {(8'ha0), reg139} : wire120[(3'h4):(2'h3)]) ?
                       $signed($signed(wire140)) : (reg128 ~^ $unsigned((8'h9e))))));
  assign wire152 = (8'ha2);
  assign wire153 = (reg133 <<< (-$signed(wire114[(4'h9):(3'h7)])));
endmodule
