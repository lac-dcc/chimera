module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h82):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire152;
  wire [(5'h10):(1'h0)] wire151;
  wire signed [(3'h6):(1'h0)] wire150;
  wire [(5'h15):(1'h0)] wire148;
  wire signed [(5'h14):(1'h0)] wire110;
  wire signed [(5'h15):(1'h0)] wire109;
  wire [(5'h14):(1'h0)] wire108;
  wire [(3'h6):(1'h0)] wire106;
  assign y = {wire152,
                 wire151,
                 wire150,
                 wire148,
                 wire110,
                 wire109,
                 wire108,
                 wire106,
                 (1'h0)};
  module5 #() modinst107 (wire106, clk, wire3, wire2, wire0, wire4, wire1);
  assign wire108 = (($signed(wire3) ?
                           ((~|{wire2}) ?
                               ({wire3} ?
                                   $unsigned(wire2) : $signed(wire106)) : $unsigned($unsigned(wire3))) : ($signed($unsigned(wire0)) <<< wire3)) ?
                       ({(wire1[(1'h0):(1'h0)] <<< $unsigned(wire0))} ?
                           (wire1 ?
                               $signed({wire0,
                                   wire0}) : wire3) : wire3) : ((!wire0[(2'h3):(1'h0)]) * wire4));
  assign wire109 = $unsigned($unsigned(wire108));
  assign wire110 = $unsigned($unsigned(($unsigned((wire4 < wire0)) >>> $unsigned($signed((7'h43))))));
  module111 #() modinst149 (wire148, clk, wire108, wire110, wire109, wire3);
  assign wire150 = wire148[(5'h13):(4'ha)];
  assign wire151 = (-(~&((+wire2[(4'hb):(3'h4)]) != wire2[(3'h7):(3'h6)])));
  assign wire152 = (((^~wire106[(3'h6):(3'h6)]) < $signed(((wire150 ?
                               wire150 : wire150) ?
                           wire109 : (wire0 ? wire0 : wire0)))) ?
                       {wire110,
                           wire1[(5'h12):(2'h3)]} : (^$signed($signed($unsigned(wire148)))));
endmodule

module module111
#(parameter param146 = ((((~|((7'h42) ^ (8'hab))) + (((8'hb6) ? (8'hb3) : (8'had)) ? {(8'hb6), (8'hab)} : {(8'haa), (8'hbe)})) ^ (((~(8'hb2)) ^ ((8'hbf) ? (8'ha4) : (8'hba))) << (+((8'hb6) ? (8'hbd) : (8'hb3))))) || ((((8'h9e) ? (8'hba) : ((8'h9f) >>> (8'hb7))) ^ ((~^(8'haf)) ? {(8'hbf)} : (~^(8'hb6)))) << ((7'h41) != (((7'h41) && (8'ha3)) <= ((7'h43) ? (8'h9f) : (8'ha4)))))), 
parameter param147 = ((+{{param146, (param146 ? (8'hba) : param146)}, (((8'haf) ? param146 : param146) ? ((8'h9f) >= param146) : (param146 && param146))}) - {(8'hbb), param146}))
(y, clk, wire115, wire114, wire113, wire112);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire115;
  input wire signed [(5'h14):(1'h0)] wire114;
  input wire signed [(5'h15):(1'h0)] wire113;
  input wire [(4'hd):(1'h0)] wire112;
  wire signed [(4'hb):(1'h0)] wire145;
  wire [(4'hc):(1'h0)] wire144;
  wire signed [(4'h9):(1'h0)] wire143;
  wire [(2'h3):(1'h0)] wire141;
  wire signed [(4'ha):(1'h0)] wire120;
  wire [(5'h11):(1'h0)] wire119;
  wire [(5'h13):(1'h0)] wire118;
  wire [(4'ha):(1'h0)] wire117;
  wire [(5'h10):(1'h0)] wire116;
  assign y = {wire145,
                 wire144,
                 wire143,
                 wire141,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 (1'h0)};
  assign wire116 = ($signed((($unsigned(wire115) ^ ((7'h40) ?
                       wire113 : wire114)) & wire115)) & (!wire113[(2'h2):(2'h2)]));
  assign wire117 = $unsigned(wire112[(1'h0):(1'h0)]);
  assign wire118 = wire116[(3'h6):(3'h6)];
  assign wire119 = wire118[(3'h5):(1'h1)];
  assign wire120 = $signed((8'hb6));
  module121 #() modinst142 (wire141, clk, wire118, wire113, wire112, wire115);
  assign wire143 = wire119;
  assign wire144 = ($signed(($signed(wire120[(3'h5):(3'h5)]) << (7'h40))) << ((^$signed({wire117,
                       wire119})) >>> wire115));
  assign wire145 = $signed($unsigned((8'hba)));
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h102):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire10;
  input wire signed [(4'he):(1'h0)] wire9;
  input wire [(5'h14):(1'h0)] wire8;
  input wire signed [(4'hc):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire101;
  wire [(2'h3):(1'h0)] wire100;
  wire signed [(4'he):(1'h0)] wire99;
  wire [(4'he):(1'h0)] wire98;
  wire signed [(5'h13):(1'h0)] wire97;
  wire signed [(3'h6):(1'h0)] wire96;
  wire [(3'h6):(1'h0)] wire95;
  wire signed [(4'hd):(1'h0)] wire94;
  wire [(5'h12):(1'h0)] wire93;
  wire [(4'hc):(1'h0)] wire92;
  wire signed [(4'he):(1'h0)] wire91;
  wire [(3'h6):(1'h0)] wire90;
  wire [(5'h14):(1'h0)] wire89;
  wire signed [(3'h7):(1'h0)] wire87;
  wire signed [(4'hb):(1'h0)] wire59;
  wire signed [(4'ha):(1'h0)] wire58;
  wire signed [(4'hf):(1'h0)] wire56;
  reg [(2'h3):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg103 = (1'h0);
  reg [(5'h15):(1'h0)] reg102 = (1'h0);
  assign y = {wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire87,
                 wire59,
                 wire58,
                 wire56,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 (1'h0)};
  module11 #() modinst57 (wire56, clk, wire10, wire8, wire9, wire7);
  assign wire58 = wire6;
  assign wire59 = $unsigned(wire10[(3'h4):(1'h1)]);
  module60 #() modinst88 (wire87, clk, wire7, wire58, wire8, wire9);
  assign wire89 = wire7[(3'h6):(1'h1)];
  assign wire90 = (($unsigned(wire10[(4'h9):(2'h3)]) ?
                      (wire87 != $unsigned(wire58)) : (~|$unsigned(wire8))) && wire56[(1'h0):(1'h0)]);
  assign wire91 = wire56[(2'h2):(1'h0)];
  assign wire92 = (+$signed($signed((+$signed(wire91)))));
  assign wire93 = wire92;
  assign wire94 = ($signed({($unsigned(wire91) < $unsigned(wire91)),
                      (&wire91[(4'hb):(4'h8)])}) >= wire91[(4'hd):(1'h0)]);
  assign wire95 = (wire87 ?
                      (wire92 ?
                          {((^wire58) * {wire7}),
                              (^$signed(wire91))} : $unsigned(($signed(wire87) ?
                              $signed(wire58) : (^wire89)))) : wire87);
  assign wire96 = (((wire91 ?
                              $signed($signed(wire93)) : ((wire92 ?
                                      wire7 : wire10) ?
                                  wire56[(3'h5):(1'h1)] : wire89)) ?
                          {wire58[(3'h6):(1'h1)],
                              ((~^wire87) ?
                                  (~&wire8) : $signed(wire90))} : wire56[(4'hc):(3'h7)]) ?
                      $signed($unsigned((8'haf))) : ((~^(-$unsigned((8'hb4)))) ^~ $signed(((~&wire92) ?
                          (8'hb8) : wire10))));
  assign wire97 = $signed((({(wire10 ? (7'h40) : wire91), $signed(wire95)} ?
                          $signed($signed(wire92)) : ((wire96 ?
                              (8'hb4) : wire8) >> {(8'ha4)})) ?
                      ($unsigned((wire8 != wire59)) ?
                          ($unsigned((8'ha9)) && wire90[(2'h3):(1'h1)]) : ($signed(wire58) || wire91[(2'h2):(1'h1)])) : wire87));
  assign wire98 = (-(wire92 >= $signed($unsigned($unsigned(wire9)))));
  assign wire99 = {{(!(((8'hb6) < wire90) ?
                              (wire7 <<< wire92) : $unsigned((8'hac)))),
                          $unsigned((wire59[(3'h7):(3'h4)] ?
                              wire8 : (wire89 ? wire90 : wire92)))}};
  assign wire100 = {{wire96[(1'h0):(1'h0)], $unsigned((^(wire97 > wire98)))}};
  assign wire101 = (wire56[(1'h1):(1'h1)] << wire59[(3'h4):(2'h3)]);
  always
    @(posedge clk) begin
      if (wire56)
        begin
          reg102 <= (^(wire7[(4'h8):(3'h6)] ? wire9[(3'h5):(3'h5)] : wire94));
          reg103 <= $unsigned(wire95[(2'h3):(2'h2)]);
        end
      else
        begin
          reg102 <= (({(~$signed(wire97))} ?
              wire89 : (8'ha7)) != (^(($signed(wire87) + (reg103 >= wire101)) ?
              wire99[(4'hc):(2'h3)] : reg102[(5'h15):(3'h7)])));
        end
      reg104 <= (8'hb9);
      reg105 <= $unsigned($unsigned($unsigned(wire8)));
    end
endmodule

module module60  (y, clk, wire64, wire63, wire62, wire61);
  output wire [(32'h106):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire64;
  input wire [(4'ha):(1'h0)] wire63;
  input wire signed [(5'h14):(1'h0)] wire62;
  input wire signed [(4'he):(1'h0)] wire61;
  wire signed [(4'h9):(1'h0)] wire86;
  wire signed [(4'he):(1'h0)] wire85;
  wire signed [(4'hd):(1'h0)] wire83;
  wire [(4'hd):(1'h0)] wire82;
  wire [(4'hb):(1'h0)] wire81;
  wire [(5'h15):(1'h0)] wire80;
  wire signed [(3'h5):(1'h0)] wire79;
  wire [(4'h9):(1'h0)] wire78;
  wire signed [(4'hf):(1'h0)] wire77;
  wire [(2'h3):(1'h0)] wire76;
  wire [(5'h11):(1'h0)] wire75;
  wire [(3'h4):(1'h0)] wire74;
  wire [(5'h13):(1'h0)] wire73;
  wire [(5'h10):(1'h0)] wire71;
  wire [(4'h9):(1'h0)] wire70;
  wire [(5'h13):(1'h0)] wire69;
  wire [(4'hb):(1'h0)] wire68;
  wire [(3'h5):(1'h0)] wire67;
  wire [(5'h11):(1'h0)] wire66;
  wire signed [(5'h14):(1'h0)] wire65;
  reg signed [(4'h9):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg72 = (1'h0);
  assign y = {wire86,
                 wire85,
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
                 wire73,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 reg84,
                 reg72,
                 (1'h0)};
  assign wire65 = (({wire61[(4'hc):(4'h8)],
                          (wire61[(3'h4):(2'h3)] * (wire61 == (8'hb5)))} ?
                      (!wire62[(4'he):(1'h0)]) : (wire64 ?
                          (wire62 ^~ $signed(wire63)) : $unsigned(wire63[(1'h1):(1'h1)]))) <= $signed(wire64));
  assign wire66 = (!({((wire61 ? wire65 : wire64) != $unsigned((8'h9e)))} ?
                      (wire65[(5'h12):(2'h3)] >> wire61[(4'hd):(4'hd)]) : $signed(wire63[(3'h6):(3'h6)])));
  assign wire67 = wire65;
  assign wire68 = (((wire65[(1'h0):(1'h0)] ?
                              wire67 : $signed(((8'haa) ? wire64 : wire65))) ?
                          $unsigned(((8'hb1) ?
                              $signed(wire66) : ((7'h43) ~^ wire65))) : wire67[(3'h5):(3'h4)]) ?
                      wire63 : (-$unsigned((~^((8'hac) ? wire64 : wire62)))));
  assign wire69 = $signed($unsigned(wire68[(3'h6):(3'h6)]));
  assign wire70 = (~^{$signed($signed($unsigned(wire64))), wire68});
  assign wire71 = $unsigned(wire64);
  always
    @(posedge clk) begin
      reg72 <= (~^$unsigned((wire66 ?
          (-(wire67 ? wire64 : wire67)) : (!{(8'had)}))));
    end
  assign wire73 = {$unsigned((($unsigned((8'hbf)) ?
                          (wire65 ?
                              wire64 : (8'hab)) : $unsigned(wire64)) ^~ $signed((~&wire67))))};
  assign wire74 = (-(8'hb0));
  assign wire75 = {(($signed((+wire73)) ?
                          wire65[(4'he):(4'h9)] : (~^(wire73 | wire64))) + wire63),
                      ($signed(wire67[(3'h5):(1'h1)]) ?
                          $signed($unsigned(wire73)) : ({wire67[(3'h4):(2'h2)],
                                  $unsigned(wire63)} ?
                              {$unsigned(wire62)} : (~{wire73})))};
  assign wire76 = wire66[(3'h4):(1'h0)];
  assign wire77 = wire70;
  assign wire78 = (wire61[(4'hc):(3'h5)] ? wire69[(3'h5):(1'h0)] : {wire69});
  assign wire79 = wire73;
  assign wire80 = $signed(wire76[(1'h1):(1'h1)]);
  assign wire81 = $signed((~&$unsigned($unsigned((!(8'haf))))));
  assign wire82 = wire81;
  assign wire83 = (wire73[(4'ha):(4'ha)] - $signed((((wire69 ?
                              wire74 : wire69) ?
                          $signed(wire73) : wire81) ?
                      {wire77[(4'h9):(3'h5)]} : (8'hac))));
  always
    @(posedge clk) begin
      reg84 <= $signed($signed(((wire82[(3'h4):(1'h0)] >> (wire82 != wire65)) * $signed(wire63[(4'h8):(4'h8)]))));
    end
  assign wire85 = wire66[(3'h4):(3'h4)];
  assign wire86 = $unsigned($signed(wire68[(1'h0):(1'h0)]));
endmodule

module module11  (y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h1ed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire15;
  input wire [(4'hb):(1'h0)] wire14;
  input wire signed [(4'h9):(1'h0)] wire13;
  input wire [(4'h9):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire45;
  wire signed [(5'h12):(1'h0)] wire44;
  wire signed [(4'hc):(1'h0)] wire43;
  wire [(3'h5):(1'h0)] wire42;
  wire [(4'hf):(1'h0)] wire41;
  wire signed [(5'h13):(1'h0)] wire37;
  wire signed [(4'hb):(1'h0)] wire36;
  wire [(4'ha):(1'h0)] wire35;
  wire [(2'h3):(1'h0)] wire34;
  wire signed [(4'ha):(1'h0)] wire24;
  wire signed [(4'he):(1'h0)] wire23;
  wire signed [(4'hd):(1'h0)] wire22;
  wire [(5'h15):(1'h0)] wire21;
  wire [(2'h2):(1'h0)] wire20;
  wire [(3'h4):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire16;
  reg [(4'hd):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg52 = (1'h0);
  reg [(3'h5):(1'h0)] reg51 = (1'h0);
  reg [(4'hb):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg46 = (1'h0);
  reg [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg38 = (1'h0);
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
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
                 reg40,
                 reg39,
                 reg38,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire16 = (wire14 ? wire14 : $unsigned(wire14[(4'hb):(2'h3)]));
  assign wire17 = $unsigned(wire16[(5'h12):(3'h5)]);
  assign wire18 = ((~&$signed(((^wire13) ?
                      $signed(wire15) : (wire13 <= (7'h43))))) || (8'hb1));
  assign wire19 = (8'hbc);
  assign wire20 = ($signed(wire19[(2'h2):(1'h1)]) && (&$signed($unsigned((wire14 ?
                      wire17 : (8'hae))))));
  assign wire21 = wire16[(4'h9):(2'h2)];
  assign wire22 = $signed($unsigned((~^((^wire16) ^~ $unsigned(wire14)))));
  assign wire23 = ($unsigned(wire22) - wire13);
  assign wire24 = (wire12 ? (~(-(wire12 <= $signed(wire18)))) : (+(!wire13)));
  always
    @(posedge clk) begin
      if (wire20)
        begin
          reg25 <= wire17;
          if ((((($signed(wire15) ?
                  (+wire23) : (wire17 ?
                      wire22 : wire22)) ^ (wire13[(4'h9):(4'h9)] ?
                  $unsigned(wire15) : (^wire16))) ?
              ($unsigned((wire23 >>> wire18)) ~^ (+wire22[(3'h7):(1'h1)])) : wire20) <<< $unsigned({$signed((!(8'h9d))),
              (wire15 < $signed(wire22))})))
            begin
              reg26 <= wire20;
              reg27 <= wire15[(3'h5):(2'h2)];
              reg28 <= ((^~{$unsigned({wire12})}) + wire15[(3'h4):(1'h0)]);
              reg29 <= wire21;
              reg30 <= wire23[(4'ha):(1'h0)];
            end
          else
            begin
              reg26 <= $unsigned((~(($signed(reg27) ?
                      ((8'ha0) <<< reg27) : wire19[(1'h0):(1'h0)]) ?
                  $unsigned(wire18[(3'h4):(3'h4)]) : wire21)));
              reg27 <= ($unsigned((^~reg30)) ?
                  ((wire16[(1'h0):(1'h0)] ?
                          (^~(wire22 ? reg26 : reg28)) : (8'h9f)) ?
                      ($unsigned($unsigned(wire18)) | $signed({(8'hb0),
                          wire20})) : (((^~wire14) ?
                          (wire15 ?
                              wire23 : reg25) : wire12[(2'h3):(1'h1)]) >>> (~&$signed(wire21)))) : $unsigned((({wire24} ?
                          $unsigned(reg27) : (~wire16)) ?
                      ((reg29 + reg30) ?
                          (&reg27) : $unsigned(wire19)) : {wire18[(4'hf):(3'h6)]})));
              reg28 <= {((8'hbb) ?
                      (|(!((8'ha2) == reg25))) : $signed(wire24[(1'h0):(1'h0)])),
                  ($signed($signed((reg30 ?
                      reg25 : (8'hac)))) >>> reg26[(1'h0):(1'h0)])};
            end
          reg31 <= (^$signed({({reg28} == ((7'h43) >> wire13))}));
        end
      else
        begin
          reg25 <= reg26[(1'h0):(1'h0)];
          if ((8'ha9))
            begin
              reg26 <= (wire13[(3'h5):(2'h2)] ?
                  $signed((({reg28} | (wire17 && reg30)) ?
                      (+wire13[(1'h1):(1'h1)]) : ($unsigned(reg27) ?
                          wire19[(1'h1):(1'h1)] : (reg27 ?
                              wire23 : (8'ha8))))) : (^($unsigned(reg29) ?
                      wire18 : wire20)));
              reg27 <= (&($signed($unsigned((wire21 | (7'h43)))) ?
                  $signed(reg25) : ($signed($unsigned(reg28)) ?
                      {$unsigned(wire17)} : wire12)));
              reg28 <= ({wire16[(5'h13):(3'h4)],
                  wire20[(1'h1):(1'h1)]} != $unsigned(((~(wire14 ^~ (8'hb9))) ?
                  $unsigned((8'hb6)) : (wire22[(1'h0):(1'h0)] ?
                      (^wire22) : reg30))));
              reg29 <= $signed($unsigned(({(^(8'hb5))} ?
                  $unsigned(wire15) : (!(reg28 ? (8'hb0) : reg27)))));
            end
          else
            begin
              reg26 <= (~^{$unsigned(wire24[(2'h3):(2'h3)])});
              reg27 <= $unsigned($signed(wire12[(4'h8):(2'h3)]));
            end
          if ((wire13 ? $signed((+(-$signed((8'hac))))) : (8'ha9)))
            begin
              reg30 <= $unsigned((+$signed(($unsigned(wire22) * wire20))));
              reg31 <= wire16;
              reg32 <= ((+(8'hb5)) ?
                  $signed(((^~(reg31 >= wire24)) ?
                      $unsigned((&wire14)) : {wire24[(1'h1):(1'h1)],
                          (~wire17)})) : {$signed((~$signed(reg30)))});
            end
          else
            begin
              reg30 <= wire20[(1'h0):(1'h0)];
              reg31 <= wire17;
            end
          reg33 <= (&(!$signed(wire19[(3'h4):(1'h0)])));
        end
    end
  assign wire34 = $signed($signed($unsigned(wire20[(1'h0):(1'h0)])));
  assign wire35 = wire19[(2'h3):(2'h2)];
  assign wire36 = wire24[(4'h9):(3'h6)];
  assign wire37 = (+$unsigned({($unsigned(reg33) >> reg28)}));
  always
    @(posedge clk) begin
      reg38 <= ($unsigned($unsigned($signed(reg30))) ?
          $unsigned((+wire23[(2'h3):(2'h3)])) : wire37[(5'h13):(5'h11)]);
      reg39 <= {(((~&wire21) ^~ {(|reg31)}) & $unsigned($unsigned(wire22[(2'h3):(1'h1)])))};
      reg40 <= (~^wire21[(1'h1):(1'h1)]);
    end
  assign wire41 = (-(($unsigned((|wire13)) <<< ((wire34 ?
                      wire18 : reg38) >= (wire37 ?
                      wire22 : reg39))) | (((&wire34) ?
                          (~|reg30) : {reg38, (8'hab)}) ?
                      wire21[(1'h0):(1'h0)] : reg31)));
  assign wire42 = $unsigned($unsigned($unsigned(wire18)));
  assign wire43 = (((|{{wire14, wire17}, (7'h42)}) ?
                          wire36[(3'h4):(3'h4)] : ((~&(~reg29)) ?
                              (^$unsigned(wire36)) : wire23[(4'h8):(2'h3)])) ?
                      wire42[(1'h1):(1'h0)] : $unsigned(((^{wire21}) ~^ ($signed(wire35) ?
                          $unsigned(wire24) : wire13))));
  assign wire44 = $signed({$signed(wire18),
                      (wire13[(3'h7):(1'h1)] <<< {reg25})});
  assign wire45 = $unsigned({(&((reg31 ?
                          (8'ha8) : wire18) <= $unsigned(reg32)))});
  always
    @(posedge clk) begin
      reg46 <= wire12;
      reg47 <= ($signed(($unsigned({wire17}) ?
              wire15 : $signed(wire22[(4'h8):(3'h7)]))) ?
          (!$unsigned((+reg46))) : (reg40[(3'h6):(2'h2)] <<< (((wire21 ?
                  wire44 : reg29) ?
              (reg40 ? reg46 : reg25) : reg29) < (|reg26[(2'h2):(1'h1)]))));
      if ($unsigned((wire44 & {{(reg25 ? wire22 : wire22), {wire21, wire19}},
          wire36[(4'hb):(3'h7)]})))
        begin
          reg48 <= $unsigned({{($signed(reg27) || ((8'hb5) ? wire45 : reg32)),
                  $unsigned($signed(reg38))},
              wire44[(4'hd):(3'h6)]});
        end
      else
        begin
          reg48 <= $unsigned((~&((~^(^~wire21)) | wire13)));
          reg49 <= (&$signed((~^((wire36 ? (8'hb6) : reg26) ?
              $unsigned(wire41) : (reg38 | (8'haa))))));
          if ($unsigned(($unsigned({(~|wire24),
              $unsigned(wire45)}) && $unsigned(wire42[(3'h5):(3'h4)]))))
            begin
              reg50 <= reg48[(5'h11):(3'h5)];
              reg51 <= reg29;
              reg52 <= wire22[(1'h0):(1'h0)];
              reg53 <= wire17[(4'h8):(1'h1)];
            end
          else
            begin
              reg50 <= $signed((7'h41));
              reg51 <= wire13;
              reg52 <= (~&reg33);
              reg53 <= (!wire16);
            end
        end
      reg54 <= (wire34[(2'h2):(1'h0)] ?
          (wire22[(4'h9):(3'h5)] || (~|(8'ha8))) : ((~|reg27) - wire43));
      reg55 <= $unsigned(reg54);
    end
endmodule

module module121
#(parameter param140 = {(({{(8'hbb), (8'hbb)}} || (~&((8'hbf) ? (8'hac) : (8'h9f)))) ? ((~&{(7'h44), (8'hb0)}) ? (7'h42) : {(~|(8'hb9))}) : (&((8'hb0) << {(8'h9f)})))})
(y, clk, wire125, wire124, wire123, wire122);
  output wire [(32'hbe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire125;
  input wire [(5'h15):(1'h0)] wire124;
  input wire signed [(4'hd):(1'h0)] wire123;
  input wire [(5'h14):(1'h0)] wire122;
  wire [(5'h11):(1'h0)] wire139;
  wire signed [(5'h11):(1'h0)] wire137;
  wire [(4'ha):(1'h0)] wire134;
  wire signed [(3'h6):(1'h0)] wire133;
  wire signed [(4'hb):(1'h0)] wire132;
  wire signed [(4'h8):(1'h0)] wire131;
  wire signed [(3'h6):(1'h0)] wire130;
  wire signed [(5'h10):(1'h0)] wire129;
  wire signed [(5'h14):(1'h0)] wire128;
  wire signed [(5'h14):(1'h0)] wire127;
  wire [(5'h12):(1'h0)] wire126;
  reg [(5'h12):(1'h0)] reg138 = (1'h0);
  reg [(4'h8):(1'h0)] reg136 = (1'h0);
  reg [(4'he):(1'h0)] reg135 = (1'h0);
  assign y = {wire139,
                 wire137,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 reg138,
                 reg136,
                 reg135,
                 (1'h0)};
  assign wire126 = (^~($signed(((^wire125) <= wire125[(3'h7):(2'h3)])) >= (wire123 | ((wire125 - wire124) || wire124))));
  assign wire127 = ((!wire122[(5'h14):(4'ha)]) ?
                       $unsigned($signed(wire122)) : wire124);
  assign wire128 = ($signed(wire125) ?
                       wire122[(4'hd):(3'h6)] : wire122[(3'h7):(2'h2)]);
  assign wire129 = (~|((8'hae) >= (-wire125)));
  assign wire130 = ($signed((!(|$unsigned(wire129)))) ?
                       $signed(wire123) : wire126[(4'h8):(2'h2)]);
  assign wire131 = ($signed((-{$signed(wire122)})) ^~ {{$signed(wire129[(3'h7):(3'h5)])},
                       ({(wire130 >= wire130),
                           {wire126, wire124}} >>> wire127)});
  assign wire132 = wire123[(1'h1):(1'h0)];
  assign wire133 = $unsigned(wire123);
  assign wire134 = $signed((&{$signed($unsigned(wire133))}));
  always
    @(posedge clk) begin
      reg135 <= (8'h9c);
      reg136 <= $unsigned($unsigned(wire126[(3'h5):(3'h5)]));
    end
  assign wire137 = wire132;
  always
    @(posedge clk) begin
      reg138 <= $unsigned(reg135[(4'hb):(2'h3)]);
    end
  assign wire139 = $unsigned(reg136);
endmodule
