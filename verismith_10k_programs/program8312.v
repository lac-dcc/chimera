module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire129;
  wire [(4'hb):(1'h0)] wire128;
  wire signed [(3'h6):(1'h0)] wire126;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  assign y = {wire129, wire128, wire126, wire6, wire5, (1'h0)};
  assign wire5 = ({((8'hab) != (wire3 == wire2)),
                     ($unsigned(wire1) >= ((wire1 ^~ wire0) ?
                         wire4 : (!wire2)))} >= (((^(&wire1)) ?
                         (~^$signed(wire1)) : $signed(wire1)) ?
                     (+wire0) : (8'ha4)));
  assign wire6 = (((~$unsigned(wire0)) || (wire3[(1'h0):(1'h0)] != ((8'hbd) && {wire2,
                         (8'hae)}))) ?
                     ((-($unsigned(wire4) || (|wire5))) ?
                         (wire1 <= wire5[(3'h4):(1'h1)]) : $signed($signed((~&wire5)))) : $signed(wire1[(4'he):(4'ha)]));
  module7 #() modinst127 (wire126, clk, wire0, wire5, wire4, wire6);
  assign wire128 = $unsigned((wire5[(3'h4):(2'h3)] <= $signed(((wire4 ?
                       wire2 : wire5) ^~ wire2[(5'h10):(3'h5)]))));
  assign wire129 = wire0[(5'h11):(5'h10)];
endmodule

module module7  (y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'hdd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire11;
  input wire [(4'h9):(1'h0)] wire10;
  input wire [(5'h10):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire8;
  wire [(4'h8):(1'h0)] wire122;
  wire signed [(4'hb):(1'h0)] wire121;
  wire signed [(5'h10):(1'h0)] wire120;
  wire [(5'h10):(1'h0)] wire119;
  wire [(4'h8):(1'h0)] wire76;
  wire signed [(5'h11):(1'h0)] wire40;
  wire [(5'h11):(1'h0)] wire39;
  wire [(4'hb):(1'h0)] wire38;
  wire [(4'hb):(1'h0)] wire37;
  wire [(4'he):(1'h0)] wire36;
  wire signed [(5'h10):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire78;
  wire [(5'h12):(1'h0)] wire79;
  wire [(2'h3):(1'h0)] wire117;
  reg signed [(4'he):(1'h0)] reg125 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg123 = (1'h0);
  assign y = {wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire76,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire34,
                 wire78,
                 wire79,
                 wire117,
                 reg125,
                 reg124,
                 reg123,
                 (1'h0)};
  module12 #() modinst35 (.wire13(wire8), .clk(clk), .wire14(wire9), .wire16(wire11), .y(wire34), .wire15(wire10));
  assign wire36 = {wire11[(4'h8):(3'h4)],
                      (((~{(8'hac), wire8}) || (+$signed(wire8))) - wire11)};
  assign wire37 = {$unsigned(($unsigned((wire36 ?
                          wire34 : wire11)) ^ ($signed(wire9) ?
                          (~^wire9) : wire10[(3'h7):(2'h3)])))};
  assign wire38 = ((wire36[(2'h3):(1'h0)] <= $unsigned(wire36[(2'h2):(1'h0)])) * $signed((&(|wire36[(4'ha):(4'h8)]))));
  assign wire39 = wire36[(4'hd):(1'h0)];
  assign wire40 = (($unsigned((wire36[(2'h2):(2'h2)] ?
                          (-wire10) : wire36[(4'hb):(3'h7)])) ~^ ($unsigned($unsigned(wire11)) < (~(wire10 ?
                          wire37 : wire10)))) ?
                      ({wire11[(3'h6):(3'h5)],
                              (wire37[(3'h7):(2'h2)] ?
                                  $signed(wire39) : (!wire37))} ?
                          (~wire9[(4'ha):(1'h1)]) : ((&{wire8,
                              wire11}) >>> ($unsigned(wire8) ?
                              $unsigned(wire36) : ((8'ha9) ?
                                  (8'hb6) : wire9)))) : wire36);
  module41 #() modinst77 (.wire42(wire37), .wire43(wire40), .wire45(wire38), .wire44(wire36), .wire46(wire11), .clk(clk), .y(wire76));
  assign wire78 = $signed((+wire36[(4'hc):(2'h3)]));
  assign wire79 = ($signed(wire37) | wire11);
  module80 #() modinst118 (wire117, clk, wire39, wire78, wire8, wire11, wire40);
  assign wire119 = wire37;
  assign wire120 = (((|(~&wire36)) & {(wire119[(4'hc):(4'h8)] <= wire10[(1'h1):(1'h1)])}) ?
                       ({(((8'ha4) << wire40) + (+(8'hbe)))} | ($signed((&wire40)) && (wire40 >> (wire9 || wire39)))) : $unsigned((8'ha2)));
  assign wire121 = wire117;
  assign wire122 = wire78[(4'he):(4'hb)];
  always
    @(posedge clk) begin
      reg123 <= $unsigned(wire79);
      reg124 <= (~^wire37[(3'h4):(2'h2)]);
      reg125 <= $unsigned((wire117[(2'h2):(1'h0)] ? wire120 : wire40));
    end
endmodule

module module80
#(parameter param116 = ((((((8'ha3) ? (8'hb0) : (7'h41)) << ((8'h9c) << (8'ha3))) & (((8'hbf) == (8'h9d)) == (&(8'ha0)))) ? ({(|(8'hbd)), ((8'had) ? (8'ha4) : (8'hac))} ? (((8'hbf) ? (7'h44) : (8'hac)) ? (|(8'ha1)) : ((8'hb5) && (8'hbf))) : (((8'hbe) ? (8'hbd) : (8'hba)) >>> ((7'h40) ? (8'hb6) : (8'hbc)))) : (8'h9d)) ? {((~|((7'h40) | (8'hb6))) + ((!(8'ha6)) ? ((8'hb9) ? (8'ha0) : (7'h40)) : (|(8'h9d)))), ((|{(8'had)}) ? (-((8'hbb) ? (8'hb4) : (8'h9d))) : (8'haf))} : (((((8'hb8) ? (8'hb3) : (8'hb5)) && (|(8'ha0))) > ((-(8'hb0)) ? ((8'haf) >= (8'hbf)) : {(8'ha6), (8'hae)})) ? ({((8'hbe) == (7'h43))} >> ({(8'ha7)} ? ((8'ha6) ? (7'h40) : (8'hab)) : ((8'h9d) & (7'h42)))) : (!(~|((7'h40) ? (8'h9e) : (8'hba)))))))
(y, clk, wire85, wire84, wire83, wire82, wire81);
  output wire [(32'h156):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire85;
  input wire signed [(4'ha):(1'h0)] wire84;
  input wire signed [(4'ha):(1'h0)] wire83;
  input wire signed [(5'h15):(1'h0)] wire82;
  input wire signed [(5'h11):(1'h0)] wire81;
  wire signed [(5'h13):(1'h0)] wire113;
  wire signed [(4'hd):(1'h0)] wire112;
  wire [(4'hf):(1'h0)] wire111;
  wire [(3'h5):(1'h0)] wire110;
  wire [(4'hd):(1'h0)] wire107;
  wire [(4'hb):(1'h0)] wire106;
  wire signed [(5'h13):(1'h0)] wire94;
  wire [(4'ha):(1'h0)] wire93;
  wire signed [(4'h8):(1'h0)] wire90;
  wire [(4'ha):(1'h0)] wire89;
  wire [(3'h4):(1'h0)] wire88;
  wire [(3'h4):(1'h0)] wire87;
  wire signed [(5'h15):(1'h0)] wire86;
  reg signed [(4'h8):(1'h0)] reg115 = (1'h0);
  reg [(3'h6):(1'h0)] reg114 = (1'h0);
  reg [(5'h15):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg108 = (1'h0);
  reg [(4'hd):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg103 = (1'h0);
  reg [(3'h4):(1'h0)] reg102 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg101 = (1'h0);
  reg [(5'h13):(1'h0)] reg100 = (1'h0);
  reg [(5'h10):(1'h0)] reg99 = (1'h0);
  reg [(3'h6):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg97 = (1'h0);
  reg [(5'h11):(1'h0)] reg96 = (1'h0);
  reg [(4'he):(1'h0)] reg95 = (1'h0);
  reg [(3'h7):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg91 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire107,
                 wire106,
                 wire94,
                 wire93,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 reg115,
                 reg114,
                 reg109,
                 reg108,
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
                 reg92,
                 reg91,
                 (1'h0)};
  assign wire86 = $signed(wire83[(2'h3):(2'h2)]);
  assign wire87 = ($unsigned($unsigned((&$signed(wire82)))) ?
                      wire86 : {(wire82[(4'hc):(4'hb)] ?
                              $unsigned({wire82}) : (~&(wire84 ?
                                  wire83 : (8'hb6))))});
  assign wire88 = (wire86 ? {$unsigned(wire85[(2'h2):(1'h0)])} : {(8'hb4)});
  assign wire89 = $signed($signed(({wire81} ?
                      $unsigned($signed(wire85)) : ({wire88,
                          wire81} << (wire81 ? wire87 : wire84)))));
  assign wire90 = (!wire87);
  always
    @(posedge clk) begin
      reg91 <= (($signed(wire81) ?
          (~&((wire86 >>> wire82) ?
              wire85 : $signed((8'hab)))) : (8'ha1)) - $signed({$unsigned({(8'had),
              wire87}),
          wire82}));
      reg92 <= ((|wire83[(4'h8):(2'h2)]) ^~ (^~((8'hba) || ((~&wire85) & $signed(wire83)))));
    end
  assign wire93 = wire86[(4'hd):(4'h9)];
  assign wire94 = wire85;
  always
    @(posedge clk) begin
      reg95 <= reg91[(4'h9):(3'h5)];
      reg96 <= $unsigned(wire90);
      if ($unsigned(reg92))
        begin
          if ($signed($signed((8'hae))))
            begin
              reg97 <= $unsigned(((~|$unsigned(wire83[(2'h2):(2'h2)])) | (~|((-reg96) ^~ ((8'hbd) <= wire84)))));
            end
          else
            begin
              reg97 <= (^{($unsigned(wire93) ?
                      $unsigned((wire86 ? wire86 : wire82)) : (|{wire86,
                          reg92}))});
              reg98 <= $signed(($unsigned($signed((reg92 * wire84))) >>> (~^$unsigned(reg95))));
            end
          if (($unsigned($signed(($unsigned(wire89) | (^(8'hba))))) ?
              $signed((+wire81)) : wire93[(2'h2):(1'h1)]))
            begin
              reg99 <= (wire90 == ($signed(((reg91 ?
                      wire85 : (8'ha6)) ^~ ((8'hb5) ? wire83 : wire82))) ?
                  wire83[(3'h6):(2'h2)] : $signed(((wire88 ?
                      (8'hbd) : wire83) != (wire81 | wire84)))));
              reg100 <= wire87[(2'h2):(1'h1)];
              reg101 <= (wire88 != wire94[(5'h10):(4'hc)]);
              reg102 <= {$signed((~((wire87 >> reg97) ?
                      (wire94 <<< wire84) : (+wire93)))),
                  (~^($unsigned($unsigned(wire94)) ?
                      reg99[(4'hc):(3'h4)] : wire94))};
              reg103 <= wire89;
            end
          else
            begin
              reg99 <= (({((wire89 ^~ wire86) ?
                      $signed(reg103) : $signed(wire84))} - $signed($unsigned((reg96 <= wire86)))) - $unsigned(reg92));
            end
          if ({($signed($signed({wire94})) ?
                  ((+(reg102 < wire90)) ?
                      (!$unsigned(reg92)) : ((reg103 == (8'hb2)) ~^ $unsigned(reg103))) : $unsigned((+(&wire88)))),
              reg101[(4'ha):(2'h2)]})
            begin
              reg104 <= (wire86[(4'hd):(2'h2)] ?
                  reg95 : (^~(reg95[(1'h1):(1'h1)] ?
                      (wire90 ?
                          (-wire81) : (reg96 ? reg92 : (8'haa))) : (wire89 ?
                          $unsigned((8'h9e)) : (reg101 && (8'hbb))))));
              reg105 <= (({wire81[(1'h1):(1'h0)],
                      reg98[(1'h0):(1'h0)]} * $signed(((reg103 ?
                          wire82 : reg100) ?
                      wire89[(4'ha):(3'h5)] : ((8'had) > wire85)))) ?
                  $signed(((+$signed(reg104)) >>> $signed($unsigned(reg92)))) : (~(8'ha3)));
            end
          else
            begin
              reg104 <= {$unsigned(wire85), reg102[(3'h4):(2'h3)]};
            end
        end
      else
        begin
          reg97 <= $unsigned($unsigned($signed(wire86[(1'h0):(1'h0)])));
          reg98 <= reg102;
          reg99 <= wire86;
        end
    end
  assign wire106 = $signed($signed($unsigned(($unsigned((8'h9f)) ?
                       $unsigned(reg96) : (reg97 < wire81)))));
  assign wire107 = wire106;
  always
    @(posedge clk) begin
      reg108 <= (reg97[(3'h7):(2'h3)] ?
          ((^~($signed(wire86) ? (~wire93) : $signed((8'had)))) ?
              reg105[(4'h9):(1'h0)] : reg105[(3'h5):(3'h5)]) : $signed((((|wire86) ?
                  reg102[(1'h0):(1'h0)] : (~&reg92)) ?
              $unsigned(reg102) : (reg96 ^ wire93))));
      reg109 <= (8'hb5);
    end
  assign wire110 = (reg101 ?
                       ((reg91[(3'h4):(1'h1)] << $unsigned((reg105 ?
                           reg100 : reg98))) * ((~|wire94) <= ((|reg92) ?
                           reg102[(2'h2):(2'h2)] : $unsigned(reg91)))) : ((^($unsigned(reg96) <<< $signed((8'ha3)))) ?
                           wire81[(4'hd):(3'h6)] : $signed(((wire83 ?
                                   wire94 : reg91) ?
                               (reg104 ?
                                   reg91 : wire89) : wire106[(4'hb):(3'h4)]))));
  assign wire111 = ((|$signed({(8'had)})) < {$signed((~|$signed((8'h9c)))),
                       wire87[(3'h4):(3'h4)]});
  assign wire112 = wire111[(4'hd):(3'h4)];
  assign wire113 = ($unsigned($signed($unsigned($unsigned((8'hbe))))) ?
                       ($signed(wire110) ?
                           $signed((|(~^(8'h9d)))) : ($signed(((7'h40) ?
                                   reg100 : reg97)) ?
                               $signed((8'hac)) : (~^(reg102 <<< reg92)))) : (wire81[(4'he):(3'h6)] != wire112[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg114 <= (wire89[(1'h1):(1'h1)] ?
          $signed(((wire94[(4'hc):(4'h9)] ^ (wire81 ? wire93 : wire106)) ?
              {wire81} : wire113[(3'h5):(3'h4)])) : $unsigned({$signed((~&wire84)),
              reg97}));
      reg115 <= ((($signed((|reg95)) ?
              {wire112,
                  (wire85 ? wire94 : reg100)} : $signed($unsigned(wire87))) ?
          (wire87 ?
              (reg104 | reg104) : $signed(reg99)) : (+$signed((~&reg97)))) < (&wire87));
    end
endmodule

module module41
#(parameter param74 = (+(^(({(8'hb9)} - (|(8'ha2))) || {((8'hb0) ? (8'haa) : (8'ha7))}))), 
parameter param75 = {(~|{{(param74 ~^ param74), (param74 <= param74)}})})
(y, clk, wire46, wire45, wire44, wire43, wire42);
  output wire [(32'h153):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire46;
  input wire [(4'hb):(1'h0)] wire45;
  input wire [(2'h2):(1'h0)] wire44;
  input wire [(4'hf):(1'h0)] wire43;
  input wire [(4'hb):(1'h0)] wire42;
  wire signed [(5'h10):(1'h0)] wire73;
  wire signed [(5'h11):(1'h0)] wire72;
  wire [(3'h5):(1'h0)] wire71;
  wire [(5'h10):(1'h0)] wire70;
  wire signed [(4'hd):(1'h0)] wire69;
  wire [(4'hd):(1'h0)] wire68;
  wire [(4'hb):(1'h0)] wire67;
  wire signed [(4'hb):(1'h0)] wire66;
  wire [(4'h8):(1'h0)] wire65;
  wire [(4'hf):(1'h0)] wire64;
  wire signed [(3'h6):(1'h0)] wire63;
  wire signed [(5'h12):(1'h0)] wire62;
  wire signed [(4'hf):(1'h0)] wire61;
  wire signed [(5'h14):(1'h0)] wire60;
  wire [(3'h5):(1'h0)] wire59;
  wire [(5'h15):(1'h0)] wire50;
  wire signed [(4'he):(1'h0)] wire49;
  wire [(3'h6):(1'h0)] wire48;
  wire [(3'h6):(1'h0)] wire47;
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg55 = (1'h0);
  reg [(4'hd):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg53 = (1'h0);
  reg [(4'hf):(1'h0)] reg52 = (1'h0);
  reg [(4'hb):(1'h0)] reg51 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  assign wire47 = (+(8'hb6));
  assign wire48 = wire45;
  assign wire49 = $unsigned(($signed({wire46[(2'h2):(1'h1)],
                      wire46}) & $signed((((8'h9e) >>> wire48) == (wire42 <<< wire45)))));
  assign wire50 = (wire43[(3'h7):(3'h7)] & (~^$signed(wire42[(3'h4):(3'h4)])));
  always
    @(posedge clk) begin
      if (wire49)
        begin
          if (wire42[(3'h7):(2'h2)])
            begin
              reg51 <= ($unsigned((-(8'ha7))) ?
                  (($unsigned($signed(wire46)) ?
                      ($signed(wire48) ?
                          wire47 : (wire45 ? wire43 : wire48)) : (wire42 ?
                          $signed(wire43) : (wire42 + wire47))) != wire44[(2'h2):(2'h2)]) : ((8'hbd) ?
                      (-((wire48 ? (8'ha2) : wire49) | {wire48,
                          wire46})) : (~|(~((8'ha3) ? wire42 : wire46)))));
              reg52 <= $unsigned(wire45);
              reg53 <= ((((^~$signed(wire43)) ?
                      (8'ha3) : wire48[(3'h5):(2'h2)]) ?
                  $unsigned((^wire43)) : (((^(8'ha3)) ?
                          (wire50 ? wire44 : reg51) : (wire50 <= wire44)) ?
                      {(~wire49)} : wire48[(2'h3):(1'h1)])) - $unsigned($signed($unsigned((wire46 ^~ wire43)))));
              reg54 <= (+$unsigned((^~(^wire50[(1'h1):(1'h1)]))));
            end
          else
            begin
              reg51 <= (~&({$unsigned(((7'h44) >> wire44))} > $unsigned($unsigned(wire46))));
              reg52 <= $unsigned($unsigned($signed(wire45)));
            end
          reg55 <= reg53;
        end
      else
        begin
          reg51 <= (wire48[(2'h3):(2'h3)] ?
              wire44 : (+({wire42} ?
                  {((8'hac) ? reg51 : reg55),
                      wire49[(1'h1):(1'h0)]} : wire42)));
          reg52 <= (8'h9c);
          reg53 <= wire42;
        end
      if (wire47)
        begin
          reg56 <= (~^$unsigned((({wire43} >>> wire43) ?
              wire43 : $signed($unsigned(wire45)))));
          reg57 <= (8'ha4);
        end
      else
        begin
          reg56 <= $signed(({$signed((reg53 ~^ (8'ha9))),
              wire50[(3'h6):(3'h4)]} - ($signed(reg51) && $unsigned($signed((8'ha9))))));
          reg57 <= $signed((wire49[(3'h7):(3'h4)] & $signed(reg52[(4'hd):(3'h4)])));
        end
      reg58 <= ($signed((reg51 ?
          wire45[(4'hb):(3'h5)] : $unsigned($unsigned((8'hbe))))) | $unsigned($signed((wire42[(4'hb):(4'hb)] >= (^~wire48)))));
    end
  assign wire59 = ($signed(wire48[(3'h4):(1'h0)]) ?
                      ($signed(reg57) ?
                          (wire48 <= reg53) : reg55[(3'h7):(1'h0)]) : (reg51[(4'h9):(3'h5)] ?
                          $signed(($unsigned(wire43) == (wire50 ~^ (8'hb1)))) : (((reg51 ?
                                  wire44 : reg53) ?
                              (reg51 ? reg51 : (8'hbf)) : (wire43 ?
                                  reg54 : wire45)) != (reg54 <<< (reg53 ?
                              wire50 : wire42)))));
  assign wire60 = $signed($unsigned(reg52[(3'h4):(3'h4)]));
  assign wire61 = $unsigned((^reg55));
  assign wire62 = reg52;
  assign wire63 = ($signed((($unsigned(wire42) <= (reg52 ?
                      reg56 : reg52)) + (wire59[(1'h1):(1'h0)] - wire42[(4'ha):(3'h5)]))) ~^ ({({reg53} ?
                          wire48 : wire43[(3'h6):(1'h0)])} <= {$unsigned({wire42,
                          reg57})}));
  assign wire64 = {wire59[(1'h1):(1'h0)], reg57};
  assign wire65 = (wire46[(1'h0):(1'h0)] ?
                      wire62[(4'hd):(4'hc)] : $signed((($unsigned(wire59) ?
                          $unsigned(reg56) : (~(8'ha5))) - $signed($signed(wire42)))));
  assign wire66 = (8'had);
  assign wire67 = reg54[(3'h5):(1'h0)];
  assign wire68 = $unsigned($signed($unsigned(((!wire48) > (~|wire63)))));
  assign wire69 = wire48[(2'h2):(1'h0)];
  assign wire70 = $unsigned($unsigned($unsigned($signed(wire49[(4'h9):(2'h2)]))));
  assign wire71 = $unsigned({reg51[(3'h4):(3'h4)]});
  assign wire72 = (7'h40);
  assign wire73 = ($unsigned((((7'h42) * {wire60, wire71}) ?
                          $unsigned($signed((8'ha0))) : $signed((reg54 ?
                              wire70 : reg55)))) ?
                      {wire61, $unsigned(reg58[(4'ha):(1'h1)])} : wire70);
endmodule

module module12
#(parameter param33 = {({(~|((8'ha2) * (8'hbe))), ((~^(8'hae)) ? {(8'h9e), (8'ha1)} : (~&(8'ha0)))} ? (!(~^(!(8'hbc)))) : (^~(8'ha7))), ({(((8'h9e) ~^ (8'haf)) > ((7'h43) ? (8'hb2) : (8'h9f)))} ? ((!(~(8'hbc))) || (|(^(8'hab)))) : {(((8'hba) ? (8'hbb) : (8'hb2)) * {(8'hb4)}), ((!(8'hbb)) >= ((8'hbe) > (8'h9e)))})})
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire16;
  input wire signed [(3'h6):(1'h0)] wire15;
  input wire [(2'h3):(1'h0)] wire14;
  input wire [(5'h11):(1'h0)] wire13;
  wire signed [(4'h9):(1'h0)] wire32;
  wire [(3'h5):(1'h0)] wire31;
  wire [(4'hc):(1'h0)] wire30;
  wire signed [(5'h10):(1'h0)] wire29;
  wire [(4'h8):(1'h0)] wire28;
  wire [(3'h7):(1'h0)] wire27;
  wire [(3'h4):(1'h0)] wire26;
  wire [(3'h7):(1'h0)] wire25;
  wire [(5'h15):(1'h0)] wire24;
  wire [(4'hd):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire18;
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire19,
                 wire18,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg17,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg17 <= ({wire15, wire16[(5'h13):(5'h11)]} ?
          $unsigned(wire15) : ((~|{(wire13 ?
                  wire15 : wire16)}) > ((wire14 | $unsigned(wire14)) ?
              ((wire13 ^~ wire13) <= wire13[(1'h0):(1'h0)]) : $signed((|wire15)))));
    end
  assign wire18 = $signed(({{(-wire16), (wire14 && (8'hab))},
                      wire16} > (+{(+wire16), $unsigned(wire15)})));
  assign wire19 = (wire16 ?
                      (wire14[(1'h0):(1'h0)] - wire13) : (|$signed((~&wire13))));
  always
    @(posedge clk) begin
      reg20 <= ($unsigned({$unsigned((wire13 ?
              wire15 : (8'hbb)))}) >> {$signed((!$signed(wire15))),
          wire16[(4'hf):(4'he)]});
      reg21 <= ({(^~wire19)} + $signed(wire14));
      reg22 <= ({(wire19 ?
              ((|wire13) ?
                  (-wire18) : $unsigned(reg20)) : $signed($unsigned(reg20))),
          wire14[(2'h2):(2'h2)]} + $signed($signed(wire13)));
      reg23 <= ((reg21[(2'h2):(1'h0)] ? $signed(reg17) : reg17) ?
          wire18[(3'h4):(1'h0)] : $signed(wire14));
    end
  assign wire24 = wire16[(2'h2):(1'h0)];
  assign wire25 = (!((~wire24) < $unsigned(($unsigned((7'h42)) ~^ ((8'hb8) == reg21)))));
  assign wire26 = ((wire24 <<< reg23[(3'h5):(2'h3)]) ?
                      $signed((8'hb5)) : ((+{(^reg23),
                          reg22[(4'he):(2'h3)]}) & (8'hb7)));
  assign wire27 = $unsigned(wire15);
  assign wire28 = wire15;
  assign wire29 = (reg23[(2'h2):(2'h2)] ?
                      $signed(reg21[(2'h2):(2'h2)]) : $unsigned($signed($unsigned($unsigned(wire15)))));
  assign wire30 = ($unsigned(($unsigned($unsigned(wire29)) ?
                      reg22[(2'h3):(1'h0)] : (wire15[(3'h4):(1'h0)] >= $unsigned(reg20)))) || wire13);
  assign wire31 = (wire18 ?
                      $unsigned($unsigned(wire18)) : {$signed((~^(8'ha0)))});
  assign wire32 = wire24[(4'hd):(2'h3)];
endmodule
