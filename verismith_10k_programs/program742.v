module top
#(parameter param134 = ((((7'h44) ? (((8'hb1) ? (8'hbc) : (8'hb4)) <<< ((8'ha7) ? (8'hbc) : (8'h9d))) : (&((8'hbc) ^ (8'ha3)))) ? (~(((8'ha8) > (8'hbd)) * (^(8'hb1)))) : (((-(8'had)) + ((8'hb9) ? (8'hb1) : (8'ha7))) < (~(~^(7'h40))))) >> {({((8'h9e) ? (8'haa) : (8'hac)), ((8'haa) < (8'ha7))} && (-(|(8'hbe)))), (&(~&((8'ha8) ? (8'ha0) : (7'h44))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire133;
  wire [(3'h6):(1'h0)] wire132;
  wire [(5'h13):(1'h0)] wire130;
  wire signed [(4'hf):(1'h0)] wire58;
  wire [(5'h13):(1'h0)] wire5;
  assign y = {wire133, wire132, wire130, wire58, wire5, (1'h0)};
  assign wire5 = $signed((wire1[(1'h1):(1'h1)] ?
                     ($unsigned((wire4 && wire2)) ?
                         (&(!wire3)) : wire0) : ({$unsigned(wire2)} <= wire1[(3'h5):(3'h5)])));
  module6 #() modinst59 (.wire7(wire2), .wire9(wire5), .y(wire58), .wire10(wire1), .clk(clk), .wire8(wire4));
  module60 #() modinst131 (.clk(clk), .wire62(wire3), .wire64(wire5), .wire63(wire4), .wire61(wire1), .y(wire130));
  assign wire132 = {$unsigned({((wire3 ? wire130 : wire2) >> $unsigned(wire4)),
                           $signed((wire0 & wire1))})};
  assign wire133 = wire58;
endmodule

module module60  (y, clk, wire64, wire63, wire62, wire61);
  output wire [(32'h8b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire64;
  input wire [(4'h8):(1'h0)] wire63;
  input wire signed [(4'hd):(1'h0)] wire62;
  input wire [(5'h11):(1'h0)] wire61;
  wire signed [(4'hf):(1'h0)] wire129;
  wire signed [(5'h14):(1'h0)] wire128;
  wire [(2'h3):(1'h0)] wire127;
  wire signed [(3'h5):(1'h0)] wire126;
  wire [(4'hd):(1'h0)] wire124;
  wire signed [(5'h13):(1'h0)] wire91;
  wire [(4'he):(1'h0)] wire65;
  reg signed [(5'h14):(1'h0)] reg95 = (1'h0);
  reg [(5'h12):(1'h0)] reg94 = (1'h0);
  reg [(4'hb):(1'h0)] reg93 = (1'h0);
  assign y = {wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire124,
                 wire91,
                 wire65,
                 reg95,
                 reg94,
                 reg93,
                 (1'h0)};
  assign wire65 = wire61[(1'h0):(1'h0)];
  module66 #() modinst92 (wire91, clk, wire61, wire63, wire62, wire65);
  always
    @(posedge clk) begin
      reg93 <= wire65[(3'h5):(2'h3)];
      reg94 <= $signed((&wire63[(3'h6):(1'h1)]));
      reg95 <= wire61;
    end
  module96 #() modinst125 (.wire99(reg94), .y(wire124), .wire97(wire64), .wire100(reg95), .clk(clk), .wire98(wire63));
  assign wire126 = (~^wire65);
  assign wire127 = (((~&$unsigned(wire65)) ?
                           (wire124 ?
                               $unsigned((8'hb4)) : wire63) : ({{wire124},
                               {reg95}} | (&(8'hbf)))) ?
                       ((~|((&(8'hac)) * {wire126,
                           reg93})) & ($unsigned($unsigned(reg93)) ?
                           wire63[(1'h1):(1'h1)] : {(wire124 ? reg94 : wire91),
                               (|(8'hae))})) : (~|$unsigned($unsigned((~(8'ha1))))));
  assign wire128 = wire64[(3'h5):(1'h0)];
  assign wire129 = wire91[(4'hc):(3'h5)];
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire10;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire [(5'h11):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire57;
  wire [(5'h14):(1'h0)] wire56;
  wire [(5'h10):(1'h0)] wire31;
  wire signed [(4'h9):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire13;
  wire signed [(3'h6):(1'h0)] wire33;
  wire [(5'h15):(1'h0)] wire54;
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire31,
                 wire14,
                 wire13,
                 wire33,
                 wire54,
                 reg12,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= $unsigned($unsigned(($signed($unsigned(wire8)) ?
          wire9[(4'hc):(2'h2)] : wire9[(4'h8):(2'h3)])));
      reg12 <= $signed(wire9[(3'h4):(1'h1)]);
    end
  assign wire13 = reg12;
  assign wire14 = ((~^(wire7[(3'h5):(2'h2)] - (8'hbc))) ?
                      ($unsigned($signed((wire13 - reg11))) ?
                          $unsigned($signed((wire13 < wire9))) : ($unsigned((wire8 ?
                                  reg12 : wire10)) ?
                              (wire13 * (wire10 ?
                                  wire8 : wire13)) : wire10)) : wire7[(4'ha):(3'h6)]);
  module15 #() modinst32 (.clk(clk), .wire18(wire10), .wire16(wire7), .wire17(wire14), .wire20(wire13), .y(wire31), .wire19(wire8));
  assign wire33 = (|(|{reg11[(4'ha):(4'ha)]}));
  module34 #() modinst55 (.y(wire54), .wire39(wire7), .wire36(reg11), .wire38(wire10), .wire37(reg12), .clk(clk), .wire35(wire9));
  assign wire56 = wire14;
  assign wire57 = wire10[(5'h14):(4'he)];
endmodule

module module34
#(parameter param53 = {({(((8'ha4) ? (7'h44) : (8'ha7)) ^ ((8'h9f) ? (8'ha8) : (8'hb5)))} <= ({{(8'ha3)}} ? (((8'ha3) ? (8'hb1) : (8'ha7)) ? (~(8'h9c)) : {(8'ha4)}) : (~&(-(8'hb6))))), (((((7'h41) ? (7'h42) : (8'hab)) ? (~^(8'haf)) : ((8'ha2) < (8'hb5))) & (8'h9d)) ? (((~&(8'hb7)) ? ((8'hba) + (8'hb0)) : (~^(8'haf))) <<< ({(8'hab), (8'hba)} - {(7'h40)})) : (((!(8'hac)) <<< ((8'hb6) >= (8'ha2))) >>> (8'hba)))})
(y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'h98):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire39;
  input wire [(5'h12):(1'h0)] wire38;
  input wire signed [(2'h2):(1'h0)] wire37;
  input wire [(3'h5):(1'h0)] wire36;
  input wire [(3'h7):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire46;
  wire signed [(5'h10):(1'h0)] wire45;
  wire signed [(4'hb):(1'h0)] wire44;
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  reg [(5'h10):(1'h0)] reg51 = (1'h0);
  reg [(3'h7):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg49 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(4'ha):(1'h0)] reg42 = (1'h0);
  reg [(4'hc):(1'h0)] reg41 = (1'h0);
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg40 <= {$signed($unsigned($unsigned({wire35, wire37})))};
      reg41 <= $unsigned($signed(((^reg40) ?
          $unsigned(reg40) : $unsigned((wire37 ? wire36 : reg40)))));
      reg42 <= reg41[(4'hc):(4'hb)];
      reg43 <= $signed((+reg41[(2'h2):(2'h2)]));
    end
  assign wire44 = $signed($unsigned((~(~^((8'ha4) ? wire38 : wire36)))));
  assign wire45 = $unsigned((($signed((!wire44)) < {((8'ha7) ^ reg43),
                          (~wire37)}) ?
                      $unsigned(($signed(wire39) ?
                          (wire37 * wire35) : {reg43})) : reg40));
  assign wire46 = wire45[(4'hb):(4'ha)];
  always
    @(posedge clk) begin
      if (reg42[(3'h7):(3'h4)])
        begin
          reg47 <= $signed((reg42[(2'h2):(2'h2)] <= ((&$unsigned(wire36)) && $unsigned((~^reg40)))));
          reg48 <= ({$signed(wire44),
              wire37[(2'h2):(2'h2)]} <= wire37[(1'h0):(1'h0)]);
        end
      else
        begin
          reg47 <= $signed(reg47);
          reg48 <= {(&$unsigned($unsigned((-wire38)))), wire37};
          reg49 <= {reg40[(1'h0):(1'h0)],
              $signed((reg43 ?
                  (reg42[(3'h7):(2'h2)] - (wire36 ?
                      reg42 : reg42)) : $unsigned((wire39 * wire44))))};
          reg50 <= reg43;
        end
      reg51 <= $unsigned((wire46[(5'h10):(4'hb)] ?
          reg40[(3'h7):(1'h0)] : wire45[(5'h10):(4'hf)]));
      reg52 <= ({reg51} < (-($signed($unsigned(reg43)) >>> {(^~reg43)})));
    end
endmodule

module module15
#(parameter param29 = {(((((8'hac) ? (8'hbe) : (8'ha2)) ? {(8'hb2)} : {(7'h44), (8'haf)}) || ({(8'ha8)} <= ((8'ha4) == (8'ha3)))) ? ((8'h9f) ? (~((7'h41) != (8'hb3))) : ({(8'h9d)} ~^ ((8'hb0) ? (7'h41) : (8'hb3)))) : {(~&((8'hbd) * (7'h41)))}), ((((~|(8'hb6)) ? ((8'ha5) != (8'hb1)) : (-(8'ha5))) ? ({(8'haa)} ? ((8'ha3) ~^ (8'h9c)) : ((8'ha5) * (8'h9c))) : (((8'ha7) ? (8'hb5) : (8'h9f)) > (-(8'hae)))) + ({((8'hb9) ? (8'hab) : (8'ha1))} ~^ ((~(8'ha7)) ? (~^(8'hb3)) : ((7'h44) ? (8'h9c) : (8'hb4)))))}, 
parameter param30 = ((^({{param29}} >>> ({(8'ha5), param29} ? {param29} : param29))) ? param29 : param29))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h45):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire20;
  input wire [(5'h12):(1'h0)] wire19;
  input wire signed [(4'he):(1'h0)] wire18;
  input wire signed [(4'h9):(1'h0)] wire17;
  input wire signed [(4'h8):(1'h0)] wire16;
  wire [(4'h8):(1'h0)] wire28;
  wire signed [(3'h4):(1'h0)] wire27;
  wire signed [(3'h6):(1'h0)] wire26;
  wire [(2'h2):(1'h0)] wire25;
  wire signed [(4'hb):(1'h0)] wire24;
  wire signed [(4'hd):(1'h0)] wire23;
  wire [(2'h3):(1'h0)] wire22;
  wire [(5'h15):(1'h0)] wire21;
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 (1'h0)};
  assign wire21 = $unsigned(wire17[(4'h8):(1'h0)]);
  assign wire22 = (((wire17 ?
                          ($signed(wire18) ?
                              (^wire16) : wire20) : wire17[(2'h2):(2'h2)]) ?
                      $signed(wire17) : (wire17[(4'h9):(4'h8)] + {(wire19 >= wire20),
                          wire17[(2'h3):(1'h1)]})) | {wire18[(4'he):(3'h7)]});
  assign wire23 = wire17;
  assign wire24 = wire19[(4'h9):(3'h4)];
  assign wire25 = (($signed(($signed((8'ha1)) ?
                          wire17[(4'h8):(4'h8)] : (&wire22))) ?
                      $signed(wire19) : ((~&{wire20}) ?
                          (+wire21) : $unsigned({wire18,
                              wire21}))) < wire24[(4'h9):(3'h7)]);
  assign wire26 = wire16;
  assign wire27 = wire23[(3'h4):(2'h2)];
  assign wire28 = ((((8'ha1) ?
                              ((^~wire25) ?
                                  wire17 : wire22[(2'h3):(1'h1)]) : $signed(wire25)) ?
                          (~^$signed(wire25[(1'h0):(1'h0)])) : ($signed((~|(8'ha6))) ?
                              wire18 : ((8'haa) <= (wire25 ?
                                  wire16 : wire22)))) ?
                      (((^wire19) | $unsigned($signed((8'hbb)))) ^ (8'ha7)) : $signed($signed($signed(wire18))));
endmodule

module module96  (y, clk, wire100, wire99, wire98, wire97);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire100;
  input wire [(2'h3):(1'h0)] wire99;
  input wire signed [(4'h8):(1'h0)] wire98;
  input wire [(4'ha):(1'h0)] wire97;
  wire signed [(3'h5):(1'h0)] wire121;
  wire [(2'h3):(1'h0)] wire120;
  wire [(4'hc):(1'h0)] wire119;
  wire signed [(4'h8):(1'h0)] wire118;
  wire signed [(5'h15):(1'h0)] wire117;
  wire [(4'h8):(1'h0)] wire116;
  wire signed [(3'h5):(1'h0)] wire115;
  wire [(4'hf):(1'h0)] wire114;
  wire signed [(5'h11):(1'h0)] wire113;
  wire signed [(4'h8):(1'h0)] wire112;
  wire [(3'h6):(1'h0)] wire111;
  wire [(4'hd):(1'h0)] wire110;
  wire signed [(4'hd):(1'h0)] wire109;
  wire signed [(4'hc):(1'h0)] wire108;
  wire [(4'hd):(1'h0)] wire107;
  wire signed [(4'he):(1'h0)] wire106;
  wire [(2'h2):(1'h0)] wire105;
  wire [(5'h10):(1'h0)] wire104;
  wire signed [(2'h3):(1'h0)] wire103;
  wire signed [(2'h2):(1'h0)] wire102;
  wire [(3'h5):(1'h0)] wire101;
  reg signed [(5'h13):(1'h0)] reg123 = (1'h0);
  reg [(2'h2):(1'h0)] reg122 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
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
                 wire101,
                 reg123,
                 reg122,
                 (1'h0)};
  assign wire101 = ($signed(($unsigned((wire100 ?
                       (8'ha4) : (8'h9c))) >> $signed(((8'hbb) ?
                       wire100 : wire100)))) == $signed(wire97[(3'h5):(2'h2)]));
  assign wire102 = wire98[(2'h2):(2'h2)];
  assign wire103 = ($signed(((((8'hb5) ? wire100 : wire102) ?
                       (wire99 ? wire101 : wire99) : (wire100 ?
                           (8'had) : wire101)) <= wire99)) < ((~&wire97[(3'h4):(2'h3)]) && wire99[(1'h1):(1'h1)]));
  assign wire104 = (~&((wire100[(4'he):(2'h2)] * (wire102 ?
                       (wire97 ?
                           wire99 : wire101) : (wire102 < wire101))) == (-wire99[(2'h3):(2'h3)])));
  assign wire105 = wire100[(1'h1):(1'h1)];
  assign wire106 = (^~wire105[(1'h0):(1'h0)]);
  assign wire107 = ((wire101[(2'h2):(1'h0)] ^~ (^((wire104 ? (8'hb7) : wire99) ?
                       $unsigned(wire101) : wire101))) <<< (^$signed(wire104)));
  assign wire108 = ((|$unsigned(((wire107 ? (8'hb2) : wire100) ?
                           wire100[(5'h11):(4'h8)] : (wire104 ~^ wire102)))) ?
                       wire99 : $signed((~^$signed($signed(wire99)))));
  assign wire109 = (!$unsigned((|({(8'h9c), (8'ha8)} | {wire103, (8'hb5)}))));
  assign wire110 = (wire101 ^~ $signed(wire109));
  assign wire111 = ((!$signed((~(^wire97)))) || (~wire107[(4'hb):(3'h7)]));
  assign wire112 = ({wire104} ? wire107 : $unsigned(wire101[(3'h5):(2'h3)]));
  assign wire113 = (-(~&{wire112[(2'h2):(2'h2)],
                       $unsigned($unsigned(wire108))}));
  assign wire114 = $unsigned(wire98[(3'h7):(3'h5)]);
  assign wire115 = wire107[(3'h5):(1'h0)];
  assign wire116 = wire111[(3'h5):(2'h2)];
  assign wire117 = {(~^(!(wire107[(3'h7):(3'h4)] ?
                           (wire108 * wire108) : wire111[(1'h0):(1'h0)]))),
                       wire110[(4'h8):(2'h2)]};
  assign wire118 = $unsigned($signed(wire101[(3'h5):(1'h1)]));
  assign wire119 = (~$unsigned($signed(wire100)));
  assign wire120 = wire105;
  assign wire121 = wire108[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg122 <= wire119;
      reg123 <= wire118[(4'h8):(1'h1)];
    end
endmodule

module module66  (y, clk, wire70, wire69, wire68, wire67);
  output wire [(32'hd5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire70;
  input wire signed [(3'h4):(1'h0)] wire69;
  input wire [(4'hd):(1'h0)] wire68;
  input wire [(4'he):(1'h0)] wire67;
  wire [(3'h4):(1'h0)] wire90;
  wire [(5'h15):(1'h0)] wire89;
  wire signed [(5'h10):(1'h0)] wire88;
  wire [(5'h15):(1'h0)] wire75;
  wire [(4'h9):(1'h0)] wire74;
  wire signed [(3'h5):(1'h0)] wire73;
  wire [(4'h8):(1'h0)] wire72;
  wire signed [(4'hf):(1'h0)] wire71;
  reg signed [(4'h9):(1'h0)] reg87 = (1'h0);
  reg [(3'h5):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg85 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg81 = (1'h0);
  reg [(4'hb):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg77 = (1'h0);
  reg [(2'h3):(1'h0)] reg76 = (1'h0);
  assign y = {wire90,
                 wire89,
                 wire88,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 (1'h0)};
  assign wire71 = $signed($signed((wire67[(3'h7):(3'h5)] >>> $signed(((8'ha2) < wire67)))));
  assign wire72 = (8'hbf);
  assign wire73 = wire69[(1'h1):(1'h0)];
  assign wire74 = (wire71[(4'hd):(2'h2)] ?
                      ({wire68} ?
                          $unsigned(wire73[(1'h1):(1'h0)]) : $unsigned({{wire70},
                              (wire67 || wire70)})) : wire70);
  assign wire75 = $signed($unsigned(wire68[(4'hc):(4'ha)]));
  always
    @(posedge clk) begin
      if ($signed($signed((wire72 || ((wire74 ? wire67 : wire72) ?
          $signed(wire71) : $signed(wire69))))))
        begin
          if ((!((+wire75[(4'h8):(2'h2)]) ?
              ($unsigned(wire70[(4'hf):(3'h6)]) && $signed((+wire72))) : (+((wire71 ?
                      wire68 : (8'hab)) ?
                  ((8'hb2) ? wire72 : wire73) : (wire73 ? wire69 : (8'hb9)))))))
            begin
              reg76 <= $unsigned(wire68);
            end
          else
            begin
              reg76 <= ((!(($signed(wire72) == wire69[(1'h1):(1'h1)]) ?
                  $signed((reg76 ?
                      wire73 : wire67)) : (|wire74[(4'h9):(2'h3)]))) >> ($unsigned($signed(wire71)) || wire72));
              reg77 <= wire69[(1'h0):(1'h0)];
              reg78 <= (^reg77);
              reg79 <= (8'h9f);
              reg80 <= (($signed(reg78) ?
                  $signed({reg79, (~&wire75)}) : ({reg77} ?
                      ((reg79 ?
                          reg79 : wire73) != $unsigned(wire68)) : {wire71[(4'h9):(3'h7)],
                          (wire72 * wire75)})) <<< $signed($signed({(7'h42),
                  (wire70 ? wire71 : (7'h40))})));
            end
        end
      else
        begin
          reg76 <= (reg79[(3'h6):(3'h5)] <<< (($signed({reg77, (8'h9d)}) ?
              $unsigned($unsigned(wire72)) : (wire69 ?
                  $signed(wire67) : wire72[(2'h2):(1'h1)])) << $unsigned(wire73)));
          if ((((^~wire73) >>> $signed((reg77 <<< $signed(wire71)))) ?
              (wire73[(3'h5):(1'h0)] ?
                  (~(wire73 + (reg80 ?
                      wire67 : wire73))) : (&$signed($signed(wire72)))) : (($unsigned($unsigned(wire71)) ?
                  (~&{(8'hac)}) : (wire71 ?
                      (+wire75) : $signed(wire74))) > (wire69[(2'h2):(1'h0)] ?
                  wire74 : ($signed((8'h9f)) ? wire73 : $signed(reg77))))))
            begin
              reg77 <= {(((~(~&wire70)) ?
                          (-wire67[(3'h6):(1'h1)]) : $signed((wire67 * wire75))) ?
                      wire71 : (({reg80} + wire73[(1'h0):(1'h0)]) ?
                          (8'ha3) : wire74)),
                  (+reg80)};
              reg78 <= $signed($signed(($unsigned(reg76) + (~|$unsigned(reg77)))));
              reg79 <= ($unsigned((7'h44)) + $signed((wire69 >= {wire67[(2'h3):(2'h3)]})));
            end
          else
            begin
              reg77 <= (8'hbf);
              reg78 <= (^($signed((8'hb4)) ?
                  (($unsigned(wire73) ?
                      (wire67 * reg79) : ((8'ha0) ?
                          (8'ha9) : wire69)) > reg78[(2'h3):(1'h1)]) : {{(&wire69),
                          $unsigned((8'hbb))},
                      (~&(reg80 ? wire74 : wire74))}));
              reg79 <= ($signed((($unsigned(reg79) <= $signed((8'h9d))) | $signed($unsigned(reg77)))) ?
                  $unsigned(($unsigned(reg80[(1'h1):(1'h0)]) ?
                      $unsigned((wire67 ~^ reg79)) : reg79)) : wire67[(4'ha):(4'h9)]);
              reg80 <= (!reg77[(3'h4):(1'h0)]);
            end
          reg81 <= {reg76, (-wire69[(2'h3):(2'h3)])};
          reg82 <= (wire73 | {(~&{$signed(wire70)})});
          reg83 <= (~|(reg77 ?
              (($signed((8'hb4)) >= {wire74, wire69}) ?
                  (8'ha1) : {{reg76},
                      ((8'hb0) <= wire70)}) : wire68[(3'h7):(3'h7)]));
        end
    end
  always
    @(posedge clk) begin
      reg84 <= (^~reg79[(4'h9):(3'h6)]);
      reg85 <= (+(~wire67));
      reg86 <= $signed($unsigned($signed(reg82)));
    end
  always
    @(posedge clk) begin
      reg87 <= wire71[(1'h1):(1'h1)];
    end
  assign wire88 = {({reg80, (~$unsigned(reg77))} ?
                          wire71[(4'ha):(4'ha)] : $unsigned(reg84)),
                      wire68};
  assign wire89 = $unsigned(reg76[(2'h3):(1'h0)]);
  assign wire90 = ((~({((8'hbd) >> (8'hbe)),
                      wire88[(3'h4):(1'h1)]} << $signed((!reg83)))) != ((&$unsigned(((8'hbd) != reg83))) ^~ (wire71[(4'hc):(3'h6)] ?
                      ((!reg83) && (wire70 <= wire74)) : (!reg80[(4'h9):(3'h4)]))));
endmodule
