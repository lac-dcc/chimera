module top
#(parameter param151 = {(~^(((+(8'ha2)) ^~ {(8'ha8), (8'hb9)}) <<< ({(8'hae)} ? {(8'ha3)} : ((8'hae) ~^ (8'hb8))))), (((((8'hb6) ~^ (8'hb3)) ? (-(8'ha3)) : {(8'hbb), (8'ha8)}) ^~ {(^(8'hb9))}) | ({((8'hb1) ? (7'h40) : (8'hbb)), {(8'hbf), (8'haa)}} ? (&(~^(8'hbc))) : ((8'h9e) < ((8'had) - (8'haf)))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h150):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire150;
  wire [(4'hd):(1'h0)] wire149;
  wire [(3'h7):(1'h0)] wire148;
  wire [(5'h12):(1'h0)] wire147;
  wire signed [(3'h5):(1'h0)] wire146;
  wire signed [(3'h6):(1'h0)] wire145;
  wire [(3'h5):(1'h0)] wire143;
  wire [(5'h13):(1'h0)] wire142;
  wire signed [(4'hc):(1'h0)] wire131;
  wire signed [(4'h9):(1'h0)] wire130;
  wire [(5'h15):(1'h0)] wire128;
  wire [(5'h15):(1'h0)] wire9;
  wire signed [(5'h15):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire133;
  wire signed [(5'h11):(1'h0)] wire134;
  wire [(4'hf):(1'h0)] wire135;
  wire [(5'h15):(1'h0)] wire137;
  wire [(5'h10):(1'h0)] wire138;
  wire [(5'h10):(1'h0)] wire139;
  reg [(5'h13):(1'h0)] reg141 = (1'h0);
  assign y = {wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire143,
                 wire142,
                 wire131,
                 wire130,
                 wire128,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire133,
                 wire134,
                 wire135,
                 wire137,
                 wire138,
                 wire139,
                 reg141,
                 (1'h0)};
  assign wire5 = wire2;
  assign wire6 = ($signed((+wire1[(3'h4):(1'h0)])) ? wire1 : wire3);
  assign wire7 = (wire4[(1'h1):(1'h1)] ?
                     (!(~&((wire6 ?
                         wire2 : wire3) != $signed((8'ha3))))) : ($signed((+(wire3 ^ wire6))) ?
                         $unsigned((wire3[(1'h0):(1'h0)] * wire0)) : (wire0 && (~^((8'hb1) ?
                             wire3 : wire1)))));
  assign wire8 = $signed((~|wire0[(3'h7):(1'h0)]));
  assign wire9 = ({wire6[(3'h5):(3'h5)]} ?
                     $signed(($unsigned($signed(wire8)) ?
                         wire4 : ($signed(wire5) ^~ (!wire0)))) : (($unsigned((8'hba)) ?
                             $signed(((8'ha0) ?
                                 wire8 : wire7)) : wire8[(1'h1):(1'h0)]) ?
                         $unsigned(wire0[(2'h3):(1'h1)]) : $unsigned($unsigned(wire3[(4'h9):(3'h6)]))));
  module10 #() modinst129 (.y(wire128), .wire11(wire8), .wire14(wire7), .clk(clk), .wire13(wire5), .wire12(wire0));
  assign wire130 = wire1[(1'h0):(1'h0)];
  module89 #() modinst132 (wire131, clk, wire1, wire7, wire0, wire5, wire8);
  assign wire133 = $signed((wire128[(3'h5):(3'h5)] >= wire130[(2'h2):(1'h0)]));
  assign wire134 = wire128[(5'h10):(4'hb)];
  module10 #() modinst136 (wire135, clk, wire3, wire128, wire131, wire133);
  assign wire137 = (($signed(wire131[(3'h5):(1'h0)]) ?
                       wire128 : ($unsigned((wire7 << wire7)) || (wire1 ^~ wire0))) == $signed(wire7));
  assign wire138 = wire130;
  module89 #() modinst140 (wire139, clk, wire0, wire138, wire4, wire137, wire135);
  always
    @(posedge clk) begin
      reg141 <= $signed($signed(wire5));
    end
  assign wire142 = wire3[(5'h12):(3'h6)];
  module10 #() modinst144 (.wire13(wire4), .clk(clk), .wire12(wire6), .wire14(wire139), .y(wire143), .wire11(wire128));
  assign wire145 = {($unsigned((wire138 ?
                               (&(8'hba)) : (wire139 ? reg141 : wire139))) ?
                           (-wire6) : (({(8'hbc)} | $unsigned(wire3)) ^ ($signed((8'hbc)) >> $unsigned((8'ha2)))))};
  assign wire146 = $unsigned($unsigned((wire131[(4'ha):(1'h1)] ?
                       $signed($unsigned(wire130)) : (~^(wire143 ?
                           wire138 : wire139)))));
  assign wire147 = wire130;
  assign wire148 = ($signed((($unsigned(wire5) ?
                               (wire7 < wire128) : {wire139}) ?
                           (wire3 ?
                               (wire8 ?
                                   wire138 : (8'hab)) : wire9) : wire128[(2'h2):(1'h0)])) ?
                       wire133 : wire4);
  assign wire149 = (wire1[(3'h6):(3'h5)] ?
                       (~(~{wire137})) : (wire128 ?
                           $unsigned((~|$unsigned(wire142))) : (7'h40)));
  assign wire150 = wire131[(4'h9):(3'h6)];
endmodule

module module10  (y, clk, wire11, wire12, wire13, wire14);
  output wire [(32'h151):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire11;
  input wire [(4'h8):(1'h0)] wire12;
  input wire [(4'hc):(1'h0)] wire13;
  input wire [(4'hd):(1'h0)] wire14;
  wire signed [(3'h4):(1'h0)] wire126;
  wire [(5'h15):(1'h0)] wire15;
  wire signed [(5'h11):(1'h0)] wire16;
  wire [(4'hb):(1'h0)] wire17;
  wire [(5'h12):(1'h0)] wire18;
  wire [(3'h7):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire21;
  wire signed [(4'he):(1'h0)] wire22;
  wire [(4'h9):(1'h0)] wire23;
  wire signed [(4'hb):(1'h0)] wire24;
  wire [(5'h11):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire29;
  wire signed [(5'h10):(1'h0)] wire51;
  wire signed [(5'h15):(1'h0)] wire53;
  wire [(5'h11):(1'h0)] wire54;
  wire [(3'h6):(1'h0)] wire55;
  wire [(5'h15):(1'h0)] wire86;
  wire signed [(4'hf):(1'h0)] wire88;
  wire [(4'hf):(1'h0)] wire113;
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  assign y = {wire126,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire29,
                 wire51,
                 wire53,
                 wire54,
                 wire55,
                 wire86,
                 wire88,
                 wire113,
                 reg28,
                 reg19,
                 (1'h0)};
  assign wire15 = wire14[(3'h6):(2'h3)];
  assign wire16 = ($signed((($signed(wire12) >> $signed(wire13)) << (wire15 ^ (wire11 ?
                      wire13 : wire11)))) >>> $unsigned(wire11));
  assign wire17 = wire14[(4'hc):(4'h8)];
  assign wire18 = (({$unsigned((-wire15))} ? wire16 : wire11) ?
                      wire15 : (!(~^wire14)));
  always
    @(posedge clk) begin
      reg19 <= {{(^$unsigned((+wire12)))}};
    end
  assign wire20 = wire17;
  assign wire21 = (~|(!wire17[(4'h8):(3'h6)]));
  assign wire22 = $unsigned((+(wire16[(3'h7):(3'h7)] | wire17[(3'h7):(3'h4)])));
  assign wire23 = wire16[(4'hd):(4'hc)];
  assign wire24 = (wire20 ? wire17[(3'h7):(2'h3)] : $unsigned(reg19));
  assign wire25 = $unsigned($unsigned(wire11[(4'h9):(1'h0)]));
  assign wire26 = ((!$unsigned($unsigned((~&reg19)))) ^~ (wire21 >> wire21[(3'h5):(3'h4)]));
  assign wire27 = wire21[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg28 <= (~&$signed((wire27 ?
          $signed((reg19 ? wire22 : wire11)) : wire16[(3'h7):(3'h4)])));
    end
  assign wire29 = $signed(($unsigned($signed($signed(wire18))) != (wire24 >= wire22)));
  module30 #() modinst52 (wire51, clk, wire29, wire15, wire23, wire16);
  assign wire53 = wire13;
  assign wire54 = (((wire12[(1'h1):(1'h0)] | $unsigned(wire16)) >>> $signed(wire14)) ?
                      $unsigned({((wire18 ? wire27 : wire18) | (wire13 ?
                              wire16 : wire17)),
                          wire26[(2'h3):(2'h2)]}) : wire27);
  assign wire55 = {wire24[(4'h8):(3'h7)]};
  module56 #() modinst87 (.wire60(reg19), .wire58(wire14), .wire57(wire22), .wire59(wire15), .y(wire86), .wire61(wire27), .clk(clk));
  assign wire88 = (^~$signed((!({(8'ha3), wire18} ^~ ((8'h9d) ?
                      wire15 : wire14)))));
  module89 #() modinst114 (.wire93(wire12), .wire92(wire53), .wire91(wire18), .clk(clk), .wire94(wire51), .y(wire113), .wire90(wire88));
  module115 #() modinst127 (wire126, clk, reg28, wire18, wire21, wire51, wire25);
endmodule

module module115  (y, clk, wire120, wire119, wire118, wire117, wire116);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire120;
  input wire signed [(4'hf):(1'h0)] wire119;
  input wire [(5'h12):(1'h0)] wire118;
  input wire signed [(5'h10):(1'h0)] wire117;
  input wire signed [(5'h11):(1'h0)] wire116;
  wire signed [(5'h11):(1'h0)] wire125;
  wire [(4'hc):(1'h0)] wire124;
  wire signed [(3'h4):(1'h0)] wire123;
  wire [(4'ha):(1'h0)] wire122;
  wire [(5'h10):(1'h0)] wire121;
  assign y = {wire125, wire124, wire123, wire122, wire121, (1'h0)};
  assign wire121 = (!(wire117 >>> {((^~wire119) ? (~&(8'ha4)) : (~&wire116))}));
  assign wire122 = (^~(($signed((wire118 > (8'ha0))) == {(8'haa)}) ?
                       wire119 : (8'hb5)));
  assign wire123 = wire116;
  assign wire124 = $unsigned(wire120);
  assign wire125 = $signed((wire117[(3'h5):(3'h5)] < wire123));
endmodule

module module89
#(parameter param111 = ((({(&(8'ha0))} ? (((8'hb4) >> (8'hb7)) == (~|(8'h9e))) : ((~^(8'hb6)) - ((8'hb7) ? (8'ha9) : (8'had)))) || (({(8'h9e)} != ((8'hb9) << (8'h9e))) == (~(-(8'ha9))))) ? (^~((~^(-(8'ha0))) >>> {((8'hbd) ? (8'ha5) : (8'hb7)), ((8'ha4) < (8'ha1))})) : ((&((!(8'had)) ? ((8'h9d) < (8'hb1)) : ((8'haa) ^ (7'h41)))) << {(((8'hae) == (8'hba)) <<< (~&(8'ha6)))})), 
parameter param112 = {((8'hb4) ? param111 : {(param111 ? param111 : (^param111))}), {(|(param111 & (~&param111))), (!{((8'hb1) || param111)})}})
(y, clk, wire94, wire93, wire92, wire91, wire90);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire94;
  input wire signed [(4'h8):(1'h0)] wire93;
  input wire signed [(5'h15):(1'h0)] wire92;
  input wire signed [(5'h12):(1'h0)] wire91;
  input wire signed [(4'hf):(1'h0)] wire90;
  wire signed [(5'h10):(1'h0)] wire110;
  wire signed [(4'hc):(1'h0)] wire109;
  wire signed [(5'h13):(1'h0)] wire108;
  wire [(4'h8):(1'h0)] wire107;
  wire [(4'hd):(1'h0)] wire106;
  wire signed [(4'ha):(1'h0)] wire105;
  reg [(2'h3):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg103 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg102 = (1'h0);
  reg [(5'h15):(1'h0)] reg101 = (1'h0);
  reg [(3'h7):(1'h0)] reg100 = (1'h0);
  reg [(5'h15):(1'h0)] reg99 = (1'h0);
  reg [(5'h15):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg96 = (1'h0);
  reg [(3'h5):(1'h0)] reg95 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed(({wire92[(2'h3):(1'h0)]} - ({(wire92 ?
              wire94 : wire90)} + wire94))))
        begin
          if ($signed(($signed({$unsigned(wire94)}) ?
              ({wire94[(2'h2):(1'h0)]} ?
                  $unsigned(wire92) : wire92[(5'h13):(4'hc)]) : $signed({(wire92 ?
                      wire91 : wire93),
                  $signed(wire94)}))))
            begin
              reg95 <= $signed(($unsigned(((+wire94) >= {wire90, wire91})) ?
                  (!wire94[(2'h3):(1'h1)]) : wire93[(4'h8):(3'h6)]));
              reg96 <= (~|$unsigned(wire92[(3'h6):(1'h1)]));
              reg97 <= (8'hbf);
            end
          else
            begin
              reg95 <= (~&((~|{(reg97 + (8'hae))}) << $unsigned(reg95[(1'h1):(1'h1)])));
              reg96 <= (reg97 ?
                  $unsigned((!{reg97[(4'h8):(2'h2)],
                      $signed(wire93)})) : (8'hab));
              reg97 <= $signed((({(wire93 ? wire92 : wire94), (!wire93)} ?
                      ({reg96} + (^(8'hb6))) : (~(reg95 > wire91))) ?
                  (~|wire92) : ({$signed(wire90),
                      $signed(wire92)} || $signed({wire94}))));
            end
        end
      else
        begin
          reg95 <= (reg97[(2'h3):(1'h0)] ?
              (wire92[(5'h11):(3'h5)] ?
                  (($signed(wire94) ?
                          wire92[(5'h11):(3'h4)] : wire92[(1'h0):(1'h0)]) ?
                      (8'h9d) : ((wire93 & reg95) ?
                          reg97[(1'h1):(1'h1)] : $signed(reg96))) : $unsigned($signed(((8'hae) ~^ (8'hb1))))) : $unsigned((~^reg95[(2'h3):(2'h3)])));
          if ((~&(^$unsigned((7'h42)))))
            begin
              reg96 <= ($unsigned(wire92[(3'h5):(1'h0)]) >> $unsigned(reg96[(2'h3):(2'h2)]));
              reg97 <= {$unsigned(((|(~|wire90)) <= (^(~&(8'hb7))))),
                  (~$signed(wire91[(4'he):(1'h0)]))};
              reg98 <= reg95;
              reg99 <= {((((wire92 ^~ reg97) < reg95) == $unsigned((8'hbb))) != (-{{reg96},
                      (^~wire92)})),
                  (+reg95[(2'h2):(1'h0)])};
            end
          else
            begin
              reg96 <= ((~&(reg99[(3'h4):(3'h4)] || ($signed(wire92) ~^ wire92[(4'hd):(4'hb)]))) ^~ (wire92 ?
                  wire92 : (~|wire91)));
              reg97 <= ($unsigned($signed(wire91)) ?
                  $signed($unsigned(reg98[(4'he):(1'h1)])) : wire93[(1'h1):(1'h0)]);
            end
          reg100 <= $unsigned((((wire92 != (7'h42)) ~^ ($unsigned(wire91) - $signed(reg99))) < {(8'hbf),
              $unsigned((reg99 < (8'hbf)))}));
          reg101 <= (((8'hba) + $signed(((8'hb4) > $unsigned(reg98)))) ?
              $signed(reg100) : reg96);
          reg102 <= ($signed($unsigned(((reg95 ? reg99 : reg99) ?
              $signed((8'hae)) : reg96[(5'h13):(4'hd)]))) & (8'hbd));
        end
      if (reg102[(2'h2):(1'h1)])
        begin
          reg103 <= ({reg101[(3'h6):(3'h5)]} <<< ($signed($signed(((8'h9c) << (8'ha3)))) || (((~&reg102) <<< (wire91 ?
                  wire93 : (8'ha6))) ?
              ($signed(reg99) ?
                  {wire92} : (reg98 > reg101)) : (+(reg96 || wire92)))));
        end
      else
        begin
          reg103 <= ((((~^(reg102 ? (8'hb5) : reg98)) ?
                  ((+reg96) ?
                      reg96[(2'h3):(1'h0)] : (~|wire94)) : (reg102[(2'h3):(1'h0)] ^ (wire94 <<< wire92))) >>> (8'hb9)) ?
              {$signed($signed((reg95 ?
                      reg96 : (8'ha0))))} : wire92[(4'ha):(2'h3)]);
        end
      reg104 <= $unsigned($signed(($unsigned(wire94[(2'h3):(2'h3)]) ?
          {(reg97 ? reg97 : (8'hb9)),
              (~(8'hb8))} : ($signed(reg101) >> (~reg99)))));
    end
  assign wire105 = wire93[(1'h0):(1'h0)];
  assign wire106 = $signed((wire92 ?
                       $signed(((reg97 & reg104) ?
                           (wire92 ? wire94 : reg101) : (reg100 ?
                               reg102 : reg97))) : reg96[(5'h10):(3'h7)]));
  assign wire107 = ($signed($signed(reg95[(2'h2):(2'h2)])) ? reg101 : {reg95});
  assign wire108 = $signed((~(reg101 << (((8'hab) | wire91) ?
                       ((8'had) ? wire107 : reg95) : (8'hbd)))));
  assign wire109 = ($signed((!(reg98 ^ reg95[(3'h5):(2'h2)]))) << reg104);
  assign wire110 = ((wire107[(3'h5):(3'h4)] ?
                       {wire106[(4'h9):(1'h1)],
                           (reg97[(4'h9):(3'h4)] < $unsigned(wire91))} : $unsigned((8'ha1))) < reg99[(3'h7):(3'h7)]);
endmodule

module module56
#(parameter param85 = ((8'hb1) - (7'h41)))
(y, clk, wire61, wire60, wire59, wire58, wire57);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire61;
  input wire signed [(3'h6):(1'h0)] wire60;
  input wire signed [(4'hd):(1'h0)] wire59;
  input wire [(4'ha):(1'h0)] wire58;
  input wire [(4'he):(1'h0)] wire57;
  wire signed [(3'h7):(1'h0)] wire84;
  wire [(5'h11):(1'h0)] wire83;
  wire [(3'h5):(1'h0)] wire82;
  wire [(5'h11):(1'h0)] wire81;
  wire [(3'h6):(1'h0)] wire80;
  wire [(3'h5):(1'h0)] wire79;
  wire signed [(4'hd):(1'h0)] wire78;
  wire signed [(5'h10):(1'h0)] wire77;
  wire signed [(3'h7):(1'h0)] wire76;
  wire signed [(2'h3):(1'h0)] wire75;
  wire [(4'hd):(1'h0)] wire74;
  wire signed [(3'h7):(1'h0)] wire73;
  wire signed [(2'h2):(1'h0)] wire72;
  wire [(4'he):(1'h0)] wire71;
  wire [(2'h2):(1'h0)] wire70;
  wire [(2'h2):(1'h0)] wire69;
  wire [(3'h4):(1'h0)] wire68;
  wire [(4'hf):(1'h0)] wire67;
  wire signed [(5'h12):(1'h0)] wire66;
  wire signed [(5'h10):(1'h0)] wire65;
  wire [(4'h8):(1'h0)] wire64;
  wire signed [(5'h14):(1'h0)] wire63;
  wire signed [(3'h6):(1'h0)] wire62;
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
                 wire73,
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
                 (1'h0)};
  assign wire62 = wire58;
  assign wire63 = $signed(((&{wire61[(3'h5):(1'h0)], $unsigned(wire60)}) ?
                      (wire57 + (wire59 ?
                          (wire57 < wire61) : $signed(wire58))) : (~$unsigned($signed(wire59)))));
  assign wire64 = $unsigned($signed((wire59 ?
                      wire59[(4'ha):(3'h5)] : ((+(8'ha1)) ?
                          (wire62 ? wire62 : wire62) : (wire61 >> wire59)))));
  assign wire65 = wire57;
  assign wire66 = (+$unsigned(($unsigned($signed(wire60)) ?
                      {$signed(wire65)} : $signed(wire57))));
  assign wire67 = ({$signed(wire63[(3'h4):(1'h1)])} & wire59[(2'h3):(1'h0)]);
  assign wire68 = $signed((&wire58));
  assign wire69 = $unsigned((((8'hb1) ?
                          ({wire57, wire57} >>> $signed(wire68)) : ((wire58 ?
                              wire67 : wire58) >>> wire67)) ?
                      (~^$signed((~^wire66))) : $signed(wire68)));
  assign wire70 = (|((&{wire61[(5'h10):(1'h1)]}) ?
                      $unsigned($signed($signed(wire69))) : ($signed(wire65[(4'hc):(1'h0)]) ?
                          ((wire58 * wire57) || {(8'hb4)}) : ($unsigned((8'hb3)) >>> (~|wire62)))));
  assign wire71 = wire61[(4'hf):(3'h4)];
  assign wire72 = $unsigned((wire61 ?
                      (wire69 & ((wire58 ~^ (8'had)) ?
                          {(8'hb7),
                              wire64} : (wire63 < wire67))) : $unsigned($signed(wire66))));
  assign wire73 = ((((((8'hb5) ? wire66 : wire66) ?
                          $signed(wire58) : wire72) || (wire66[(4'hd):(4'h8)] ?
                          wire62[(3'h4):(3'h4)] : (~wire66))) ?
                      wire65 : wire70[(1'h0):(1'h0)]) - (wire67[(4'h8):(3'h7)] ?
                      (!((|wire59) ?
                          (wire70 ?
                              wire64 : (8'hb4)) : wire66[(3'h5):(2'h2)])) : ((wire66 * {wire69}) ?
                          wire59[(4'ha):(2'h2)] : (|$signed(wire71)))));
  assign wire74 = ({wire57} ?
                      {(wire60 >> {$signed(wire62)}),
                          (wire60 == ($unsigned(wire63) ?
                              $signed(wire60) : $signed(wire71)))} : (~|($signed((wire61 > (8'hb3))) ?
                          ((wire69 >= wire67) ?
                              $signed(wire69) : (wire70 < wire65)) : $unsigned((wire67 ?
                              wire73 : wire63)))));
  assign wire75 = (~&((8'hbe) ?
                      (7'h41) : (($unsigned(wire73) == (^wire74)) ?
                          $unsigned($unsigned(wire71)) : $unsigned((wire65 ?
                              wire67 : wire67)))));
  assign wire76 = wire72[(1'h1):(1'h0)];
  assign wire77 = ((wire75[(1'h1):(1'h0)] ?
                          $unsigned(((wire70 ? wire62 : wire61) ?
                              $signed(wire68) : (^~wire68))) : ($unsigned(wire59) ?
                              wire64 : $signed($signed((8'haf))))) ?
                      (($unsigned(wire75) ?
                          wire76[(3'h6):(3'h5)] : ($signed(wire70) ?
                              $signed(wire63) : (|(8'hb1)))) != $unsigned((wire68 > $unsigned(wire70)))) : ($unsigned(wire60[(3'h5):(1'h0)]) ?
                          ($unsigned((wire57 == wire57)) * ({wire69,
                              wire65} >= (wire74 <<< wire66))) : {$signed($unsigned(wire73)),
                              ((!wire69) ? $signed(wire69) : {wire72})}));
  assign wire78 = wire63;
  assign wire79 = {{(~^wire67)}, $signed(wire72)};
  assign wire80 = $signed(wire72);
  assign wire81 = $unsigned($unsigned(wire68[(3'h4):(2'h3)]));
  assign wire82 = ($signed(wire66[(3'h4):(3'h4)]) >= $signed((8'hb4)));
  assign wire83 = (&(wire63 > (8'h9d)));
  assign wire84 = ((wire63 ^~ wire74[(3'h7):(3'h7)]) + $signed($signed($unsigned((^~(8'hb8))))));
endmodule

module module30
#(parameter param49 = ((((((8'hac) ^~ (8'ha6)) || ((8'hae) ? (8'hbe) : (8'ha5))) ? (((8'ha3) || (8'haa)) >= (!(8'ha0))) : (^~(-(8'hb2)))) ? ({((7'h44) ? (7'h42) : (8'ha1))} ^ (((8'ha4) && (7'h41)) <= (^(8'h9d)))) : (8'h9d)) <= {(((~&(8'hb4)) ? (8'hb5) : ((8'hb8) ^ (8'ha9))) ? (((8'h9f) ? (8'hae) : (8'hb0)) ^~ (~&(8'haf))) : ((&(7'h41)) ? ((8'hae) ? (8'ha7) : (7'h43)) : ((8'ha5) ? (8'ha8) : (7'h43))))}), 
parameter param50 = (~^(+((!(+param49)) && (param49 ? (param49 ? (7'h42) : param49) : (param49 ? param49 : param49))))))
(y, clk, wire34, wire33, wire32, wire31);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire34;
  input wire [(5'h15):(1'h0)] wire33;
  input wire [(2'h2):(1'h0)] wire32;
  input wire signed [(3'h5):(1'h0)] wire31;
  wire signed [(5'h14):(1'h0)] wire48;
  wire signed [(5'h14):(1'h0)] wire47;
  wire [(5'h15):(1'h0)] wire46;
  wire signed [(4'he):(1'h0)] wire45;
  wire signed [(4'h8):(1'h0)] wire44;
  wire [(5'h14):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire42;
  wire signed [(4'hb):(1'h0)] wire41;
  wire [(4'ha):(1'h0)] wire40;
  wire signed [(4'hc):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire37;
  wire signed [(4'hb):(1'h0)] wire36;
  wire signed [(3'h7):(1'h0)] wire35;
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 (1'h0)};
  assign wire35 = (~&wire34[(1'h1):(1'h0)]);
  assign wire36 = $unsigned($unsigned({(wire35[(2'h2):(1'h1)] ?
                          $signed(wire32) : {(8'had), wire31}),
                      wire31}));
  assign wire37 = (8'ha9);
  assign wire38 = $unsigned(({wire33[(4'hf):(4'hc)],
                          ($unsigned(wire37) << {wire36, wire35})} ?
                      {$signed(((8'hbd) ?
                              (7'h40) : wire31))} : wire37[(5'h10):(4'h9)]));
  assign wire39 = ((~^{$unsigned(((8'h9d) ? wire32 : wire31)),
                          $unsigned((wire38 ? (8'hb4) : wire37))}) ?
                      ((wire38 ?
                              $signed((wire31 ? wire31 : wire33)) : ((wire31 ?
                                      wire31 : (8'ha2)) ?
                                  (~|wire32) : (^~wire32))) ?
                          $unsigned(wire35) : $signed(wire35)) : (|$unsigned(wire34)));
  assign wire40 = (~{(^~($unsigned(wire34) ?
                          wire31[(3'h5):(2'h3)] : ((8'hbb) + wire39))),
                      $unsigned((wire38 ? $signed(wire35) : (8'hb9)))});
  assign wire41 = (~|wire40[(3'h4):(1'h1)]);
  assign wire42 = $signed(({$signed({wire31}),
                          (wire33[(4'h8):(4'h8)] ^ $signed(wire33))} ?
                      (~^(-wire38)) : (8'haf)));
  assign wire43 = (+(^~(wire40 ?
                      {$signed((7'h41))} : ((wire42 && wire33) ?
                          $signed((8'haf)) : (|wire39)))));
  assign wire44 = $unsigned((-(((wire42 ? wire43 : wire39) ?
                          (~|wire32) : (wire35 - wire39)) ?
                      $unsigned(((8'hba) >>> wire42)) : $unsigned((+wire33)))));
  assign wire45 = $unsigned(wire34);
  assign wire46 = wire38[(3'h5):(2'h3)];
  assign wire47 = $unsigned($unsigned($signed(wire46)));
  assign wire48 = ($signed(wire39[(4'h9):(3'h4)]) <<< wire47);
endmodule
