module top #(parameter param189 = (8'h9f)) (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hcf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  wire [(5'h12):(1'h0)] wire182;
  wire [(5'h13):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire9;
  wire [(4'hd):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire11;
  wire [(2'h3):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire13;
  wire [(4'hb):(1'h0)] wire155;
  wire signed [(4'h9):(1'h0)] wire184;
  wire [(4'hc):(1'h0)] wire185;
  wire [(4'hd):(1'h0)] wire186;
  wire [(5'h10):(1'h0)] wire187;
  assign y = {wire182,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire155,
                 wire184,
                 wire185,
                 wire186,
                 wire187,
                 (1'h0)};
  assign wire4 = wire3;
  assign wire5 = wire2[(4'he):(3'h4)];
  assign wire6 = $signed(wire2);
  assign wire7 = $unsigned({{wire5, $unsigned((!(8'ha8)))}});
  assign wire8 = wire6[(1'h1):(1'h1)];
  assign wire9 = wire1;
  assign wire10 = $unsigned(($signed(wire4[(5'h13):(1'h1)]) ?
                      $signed({(wire9 ? wire7 : (8'had)),
                          {wire5,
                              (8'hba)}}) : ($signed((~^wire7)) >= wire2[(5'h12):(3'h7)])));
  assign wire11 = wire4;
  assign wire12 = (!wire0);
  assign wire13 = $signed((8'hb7));
  module14 #() modinst156 (wire155, clk, wire3, wire10, wire11, wire1, wire2);
  module157 #() modinst183 (wire182, clk, wire8, wire0, wire6, wire4, wire10);
  assign wire184 = ($signed((&($signed(wire4) | wire12[(2'h2):(1'h0)]))) ?
                       (+(((|(8'haa)) || $unsigned((8'hbc))) <<< {(^wire13),
                           (-wire7)})) : $unsigned(wire7));
  assign wire185 = wire12;
  assign wire186 = (|$unsigned(wire3[(3'h6):(3'h5)]));
  module57 #() modinst188 (wire187, clk, wire2, wire1, wire184, wire182, wire5);
endmodule

module module157  (y, clk, wire162, wire161, wire160, wire159, wire158);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire162;
  input wire [(4'ha):(1'h0)] wire161;
  input wire [(3'h4):(1'h0)] wire160;
  input wire signed [(4'ha):(1'h0)] wire159;
  input wire [(4'hd):(1'h0)] wire158;
  wire signed [(5'h12):(1'h0)] wire181;
  wire [(4'he):(1'h0)] wire180;
  wire [(5'h14):(1'h0)] wire179;
  wire signed [(4'hb):(1'h0)] wire178;
  wire [(5'h11):(1'h0)] wire177;
  wire signed [(4'hc):(1'h0)] wire176;
  wire signed [(3'h4):(1'h0)] wire175;
  wire signed [(4'hf):(1'h0)] wire174;
  wire signed [(3'h5):(1'h0)] wire173;
  wire [(4'h9):(1'h0)] wire172;
  wire [(5'h15):(1'h0)] wire171;
  wire [(4'hc):(1'h0)] wire170;
  wire [(2'h3):(1'h0)] wire169;
  wire signed [(4'hb):(1'h0)] wire168;
  wire signed [(4'hb):(1'h0)] wire167;
  reg signed [(5'h14):(1'h0)] reg166 = (1'h0);
  reg [(3'h4):(1'h0)] reg165 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg164 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg163 = (1'h0);
  assign y = {wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg163 <= $unsigned($unsigned((wire161 ?
          $unsigned($unsigned(wire160)) : ($unsigned((8'h9d)) ?
              (wire161 && (7'h42)) : wire159[(1'h0):(1'h0)]))));
      reg164 <= wire159;
      reg165 <= (^~(((|(wire161 ?
          wire160 : wire160)) << $unsigned((8'hba))) << (8'ha7)));
      reg166 <= $unsigned((~&($signed((wire162 ? wire159 : reg165)) ?
          (wire162[(1'h1):(1'h0)] ?
              (^wire159) : $signed(wire161)) : (|$signed(wire158)))));
    end
  assign wire167 = $signed((wire162[(2'h3):(1'h0)] ?
                       wire158[(2'h3):(1'h1)] : ($signed($unsigned(reg165)) ?
                           wire160[(1'h1):(1'h1)] : $unsigned({wire159}))));
  assign wire168 = ($signed($signed($signed((reg164 ? (8'hb1) : wire159)))) ?
                       $unsigned(wire158) : (((!{wire159}) ?
                           ($signed(reg163) != (wire161 ?
                               (7'h43) : reg165)) : (+(wire161 ?
                               (8'hab) : reg164))) - wire167));
  assign wire169 = $unsigned(reg165);
  assign wire170 = reg163[(3'h4):(2'h3)];
  assign wire171 = (!(^~$unsigned((wire167 <= $unsigned(wire168)))));
  assign wire172 = (wire171[(5'h12):(4'hc)] ?
                       (wire168[(3'h5):(1'h0)] ^ $unsigned((8'hb9))) : {(((reg164 - wire162) * wire160[(3'h4):(3'h4)]) <<< $signed({(8'ha2)})),
                           $signed(($unsigned((8'haf)) ?
                               $unsigned(reg166) : (wire158 ?
                                   wire170 : reg165)))});
  assign wire173 = {(|(!((8'hb1) ? (~|reg165) : reg166[(4'h8):(1'h1)]))),
                       reg165[(2'h3):(1'h1)]};
  assign wire174 = $unsigned((~^({(!wire171),
                       ((8'hb7) <= reg166)} > $signed((-wire159)))));
  assign wire175 = ((((~^wire171) - wire168) == (wire172 << ({wire158} ?
                           $unsigned((8'hae)) : $unsigned(wire169)))) ?
                       (^(8'h9f)) : wire169);
  assign wire176 = $unsigned($unsigned(reg163));
  assign wire177 = wire160;
  assign wire178 = (wire173 ^~ (wire158 - $unsigned(((wire162 > wire176) ~^ (8'h9d)))));
  assign wire179 = wire158[(4'h9):(1'h0)];
  assign wire180 = $signed((~^wire158[(2'h2):(1'h1)]));
  assign wire181 = $unsigned($unsigned(($signed((wire178 ?
                       reg166 : reg165)) == $signed(reg163[(1'h0):(1'h0)]))));
endmodule

module module14
#(parameter param154 = (((&{(8'hb4)}) <= {(((8'hab) >= (8'ha6)) ? ((8'hac) ? (8'hae) : (8'hb1)) : (~(8'hb1)))}) ? (!((((7'h41) ? (8'hb3) : (8'ha4)) + ((8'ha2) <= (8'ha2))) > (&((8'hb3) | (7'h40))))) : ((((|(8'h9d)) ? {(8'haf), (8'hbf)} : (8'hb7)) ? (((8'h9d) ? (8'ha3) : (8'hb7)) ? {(8'hb2), (8'hac)} : (~&(8'ha7))) : (&((8'haf) ? (8'hbe) : (8'h9f)))) * ((~^(!(8'hb1))) ? {((8'hbb) ^ (8'hbb))} : (((8'hb6) ? (8'hbb) : (8'h9f)) > ((8'hbc) >= (8'ha3)))))))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'h171):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire19;
  input wire signed [(4'hc):(1'h0)] wire18;
  input wire [(5'h14):(1'h0)] wire17;
  input wire signed [(4'hd):(1'h0)] wire16;
  input wire [(5'h14):(1'h0)] wire15;
  wire signed [(5'h10):(1'h0)] wire153;
  wire signed [(4'he):(1'h0)] wire152;
  wire signed [(3'h6):(1'h0)] wire151;
  wire [(5'h13):(1'h0)] wire150;
  wire [(5'h15):(1'h0)] wire149;
  wire signed [(4'h8):(1'h0)] wire148;
  wire signed [(3'h6):(1'h0)] wire147;
  wire signed [(4'ha):(1'h0)] wire146;
  wire signed [(2'h2):(1'h0)] wire145;
  wire signed [(4'hd):(1'h0)] wire144;
  wire [(4'hf):(1'h0)] wire143;
  wire [(4'hf):(1'h0)] wire95;
  wire [(4'hd):(1'h0)] wire56;
  wire [(4'he):(1'h0)] wire55;
  wire [(2'h2):(1'h0)] wire54;
  wire signed [(5'h15):(1'h0)] wire52;
  wire [(4'h9):(1'h0)] wire97;
  wire [(3'h7):(1'h0)] wire103;
  wire signed [(4'hf):(1'h0)] wire109;
  wire [(3'h7):(1'h0)] wire110;
  wire [(3'h6):(1'h0)] wire141;
  reg signed [(3'h7):(1'h0)] reg98 = (1'h0);
  reg [(4'he):(1'h0)] reg99 = (1'h0);
  reg [(4'hd):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg102 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg105 = (1'h0);
  reg [(5'h15):(1'h0)] reg106 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg107 = (1'h0);
  reg [(4'hb):(1'h0)] reg108 = (1'h0);
  assign y = {wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire95,
                 wire56,
                 wire55,
                 wire54,
                 wire52,
                 wire97,
                 wire103,
                 wire109,
                 wire110,
                 wire141,
                 reg98,
                 reg99,
                 reg100,
                 reg101,
                 reg102,
                 reg104,
                 reg105,
                 reg106,
                 reg107,
                 reg108,
                 (1'h0)};
  module20 #() modinst53 (.clk(clk), .wire23(wire18), .wire21(wire15), .wire22(wire17), .y(wire52), .wire24(wire16));
  assign wire54 = wire19;
  assign wire55 = ($unsigned((wire19 <= $signed(wire18))) ?
                      (+($unsigned(wire18[(2'h3):(2'h3)]) ?
                          (~|$unsigned(wire15)) : (8'hac))) : wire15[(4'hf):(4'ha)]);
  assign wire56 = $unsigned((wire55 || ((|wire19[(2'h2):(1'h0)]) || wire54)));
  module57 #() modinst96 (.wire62(wire55), .clk(clk), .wire59(wire52), .wire61(wire19), .wire60(wire15), .wire58(wire16), .y(wire95));
  assign wire97 = $signed($signed($unsigned($unsigned((-wire52)))));
  always
    @(posedge clk) begin
      reg98 <= (~^$signed((wire15 | (|$signed(wire95)))));
      reg99 <= $unsigned($signed(($unsigned($unsigned(wire16)) <<< wire19)));
      reg100 <= (({$signed((+wire52)),
          (wire55 ? wire16[(4'hb):(1'h1)] : (~&wire19))} | (wire16 ?
          ((wire18 ?
              wire56 : wire52) + (+(8'ha5))) : reg98[(2'h2):(2'h2)])) >> (|reg99));
      reg101 <= ($unsigned($unsigned((+((8'hbd) ?
          wire16 : wire55)))) >> reg99[(4'hb):(2'h2)]);
      reg102 <= {(reg98[(2'h3):(1'h0)] <= ((((8'ha4) ~^ wire95) && (~^wire55)) | $unsigned((wire16 ?
              wire16 : reg98)))),
          {((wire56[(3'h7):(3'h6)] ?
                  (~(8'hbb)) : ((8'hb3) ? wire19 : wire56)) > {wire95,
                  $unsigned(reg98)})}};
    end
  assign wire103 = wire95;
  always
    @(posedge clk) begin
      reg104 <= wire16;
      reg105 <= (wire55 >= ((~^(~&wire16[(4'h9):(3'h7)])) ?
          {wire52} : (~|wire55)));
      reg106 <= {((|((wire97 + reg98) + (wire18 ?
              reg98 : reg104))) || reg100[(4'hc):(3'h4)])};
      reg107 <= $unsigned((-wire18[(1'h0):(1'h0)]));
      reg108 <= wire15[(3'h5):(1'h1)];
    end
  assign wire109 = wire19;
  assign wire110 = (reg98[(1'h0):(1'h0)] <= $signed((wire19[(4'ha):(3'h7)] ?
                       ($unsigned((8'hb8)) & {reg107}) : $signed(reg105[(2'h3):(2'h3)]))));
  module111 #() modinst142 (wire141, clk, reg99, wire19, wire109, wire55);
  assign wire143 = reg99[(3'h7):(3'h4)];
  assign wire144 = $signed(wire97);
  assign wire145 = (reg100[(4'h8):(3'h4)] >> (~$signed($signed((wire15 == wire52)))));
  assign wire146 = $signed($signed((wire18[(2'h2):(1'h1)] ?
                       (reg98[(2'h2):(1'h1)] ?
                           reg100 : $signed(wire145)) : wire54)));
  assign wire147 = wire103[(1'h1):(1'h1)];
  assign wire148 = {reg98};
  assign wire149 = ($signed((8'hbd)) < wire54);
  assign wire150 = ($signed(((8'hb5) ? reg100 : (~&(~^(8'ha4))))) & reg104);
  assign wire151 = reg98[(1'h0):(1'h0)];
  assign wire152 = reg98;
  assign wire153 = (wire145 && wire17);
endmodule

module module111  (y, clk, wire115, wire114, wire113, wire112);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire115;
  input wire signed [(4'hc):(1'h0)] wire114;
  input wire [(4'hf):(1'h0)] wire113;
  input wire [(4'hb):(1'h0)] wire112;
  wire signed [(4'hb):(1'h0)] wire140;
  wire [(4'hc):(1'h0)] wire136;
  wire [(4'h8):(1'h0)] wire135;
  wire signed [(2'h2):(1'h0)] wire134;
  wire [(5'h10):(1'h0)] wire133;
  wire signed [(4'hc):(1'h0)] wire132;
  wire [(4'ha):(1'h0)] wire131;
  wire signed [(4'hb):(1'h0)] wire130;
  wire signed [(4'h9):(1'h0)] wire129;
  wire [(3'h7):(1'h0)] wire128;
  wire signed [(2'h3):(1'h0)] wire127;
  reg [(4'hd):(1'h0)] reg139 = (1'h0);
  reg signed [(4'he):(1'h0)] reg138 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg137 = (1'h0);
  reg [(5'h11):(1'h0)] reg126 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg124 = (1'h0);
  reg [(4'hc):(1'h0)] reg123 = (1'h0);
  reg [(4'hf):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg121 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg120 = (1'h0);
  reg [(4'he):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg118 = (1'h0);
  reg [(5'h14):(1'h0)] reg117 = (1'h0);
  reg [(2'h2):(1'h0)] reg116 = (1'h0);
  assign y = {wire140,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 reg139,
                 reg138,
                 reg137,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire112[(4'ha):(2'h2)])
        begin
          reg116 <= ((wire114[(3'h6):(3'h6)] ~^ ($signed((wire113 ~^ wire113)) ?
              (+$unsigned(wire112)) : $signed(wire115[(1'h1):(1'h0)]))) > wire112[(3'h5):(2'h2)]);
        end
      else
        begin
          reg116 <= $signed(wire112);
          reg117 <= $unsigned(wire114);
        end
      reg118 <= reg116;
      reg119 <= $unsigned((wire112[(4'hb):(4'hb)] ^ reg118));
      if ((~|wire113))
        begin
          if ((~^reg118))
            begin
              reg120 <= ({{((~&reg117) >>> {reg117}), wire114[(3'h6):(3'h5)]},
                  {$unsigned((~&reg117))}} <<< $signed(($signed(reg119) ?
                  $signed($unsigned(reg119)) : reg118[(1'h1):(1'h1)])));
            end
          else
            begin
              reg120 <= (wire113[(4'h9):(2'h3)] ?
                  $signed(reg116[(1'h0):(1'h0)]) : reg118[(1'h1):(1'h1)]);
              reg121 <= $signed(wire112);
              reg122 <= (^~($signed({(reg117 > reg119)}) != wire112[(1'h1):(1'h0)]));
              reg123 <= (($signed({$unsigned(reg122), reg116[(2'h2):(1'h1)]}) ?
                      wire115 : $signed(reg116[(2'h2):(2'h2)])) ?
                  wire115 : $unsigned((((&wire112) ?
                      reg122 : (~|(8'h9d))) - wire112)));
            end
          if ($signed((wire112 ? wire112 : reg122)))
            begin
              reg124 <= wire112[(4'h8):(1'h0)];
            end
          else
            begin
              reg124 <= {((({reg117, reg119} ?
                          $signed(reg124) : $unsigned(reg123)) != {(!wire114),
                          (reg117 ~^ wire115)}) ?
                      ((reg121 ?
                          ((8'ha6) ?
                              reg116 : wire115) : (&reg124)) >= (-reg120)) : wire114[(3'h6):(1'h0)]),
                  $signed({reg120, reg119[(3'h7):(3'h5)]})};
              reg125 <= wire113;
              reg126 <= (8'hb2);
            end
        end
      else
        begin
          reg120 <= wire115[(2'h2):(1'h1)];
        end
    end
  assign wire127 = ((^((((8'hbd) ?
                           wire115 : reg123) + $unsigned(wire113)) >= $signed((reg117 ?
                           wire113 : wire114)))) ?
                       (~(reg119[(4'hb):(3'h6)] ?
                           (!(wire112 ?
                               reg123 : reg118)) : (^reg123[(4'h9):(3'h6)]))) : reg121[(3'h7):(3'h7)]);
  assign wire128 = reg117;
  assign wire129 = (((8'h9d) ?
                           (^wire114[(2'h3):(1'h0)]) : ($unsigned((reg123 ?
                               reg121 : reg123)) ^ $signed($unsigned(wire114)))) ?
                       reg121[(3'h5):(2'h2)] : {(((&wire115) ?
                                   (&(8'hac)) : $signed(wire127)) ?
                               ({wire115} + (!reg121)) : ((8'hba) ?
                                   (reg120 ? reg119 : reg122) : (~&reg116)))});
  assign wire130 = reg124;
  assign wire131 = (reg125[(2'h2):(2'h2)] ? (~reg124[(4'hc):(3'h5)]) : wire114);
  assign wire132 = reg125;
  assign wire133 = (wire129[(2'h3):(1'h0)] <= reg118[(4'he):(4'h8)]);
  assign wire134 = (wire112[(4'ha):(1'h0)] ?
                       ((!wire128) == $unsigned((!wire132))) : (reg117 == ($signed({wire115}) * $signed((8'hba)))));
  assign wire135 = $unsigned($unsigned($unsigned(((wire134 ? reg116 : reg119) ?
                       $unsigned(wire113) : wire128))));
  assign wire136 = (($unsigned(wire115[(1'h1):(1'h0)]) ?
                           wire127[(2'h3):(2'h3)] : wire129[(3'h5):(3'h5)]) ?
                       reg124[(1'h0):(1'h0)] : (~|reg120[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg137 <= (~|$signed($signed($signed($signed(wire115)))));
      reg138 <= wire112;
      reg139 <= reg124[(1'h0):(1'h0)];
    end
  assign wire140 = reg118;
endmodule

module module57
#(parameter param94 = ((-(^(!((8'hb3) & (8'ha9))))) != (&((~|(~^(8'hb6))) ? (8'hac) : (8'ha9)))))
(y, clk, wire62, wire61, wire60, wire59, wire58);
  output wire [(32'h144):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire62;
  input wire [(3'h5):(1'h0)] wire61;
  input wire signed [(3'h4):(1'h0)] wire60;
  input wire signed [(4'he):(1'h0)] wire59;
  input wire signed [(3'h7):(1'h0)] wire58;
  wire [(3'h5):(1'h0)] wire93;
  wire signed [(4'h9):(1'h0)] wire92;
  wire [(4'h9):(1'h0)] wire91;
  wire [(2'h2):(1'h0)] wire90;
  wire signed [(4'hf):(1'h0)] wire89;
  wire signed [(3'h7):(1'h0)] wire87;
  wire [(4'h9):(1'h0)] wire86;
  wire signed [(3'h6):(1'h0)] wire85;
  wire signed [(5'h14):(1'h0)] wire84;
  wire [(4'ha):(1'h0)] wire83;
  wire signed [(2'h3):(1'h0)] wire82;
  wire [(3'h7):(1'h0)] wire69;
  wire signed [(5'h11):(1'h0)] wire68;
  wire [(4'h8):(1'h0)] wire67;
  wire signed [(3'h4):(1'h0)] wire65;
  wire signed [(4'hb):(1'h0)] wire64;
  wire [(4'hd):(1'h0)] wire63;
  reg [(4'he):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg78 = (1'h0);
  reg [(5'h11):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg76 = (1'h0);
  reg [(5'h13):(1'h0)] reg75 = (1'h0);
  reg [(4'hf):(1'h0)] reg74 = (1'h0);
  reg [(3'h5):(1'h0)] reg73 = (1'h0);
  reg [(3'h4):(1'h0)] reg72 = (1'h0);
  reg [(5'h14):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg70 = (1'h0);
  reg signed [(4'he):(1'h0)] reg66 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire69,
                 wire68,
                 wire67,
                 wire65,
                 wire64,
                 wire63,
                 reg88,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg66,
                 (1'h0)};
  assign wire63 = ((|(8'had)) >= wire59);
  assign wire64 = ({(wire63[(3'h6):(3'h5)] ?
                              wire60 : ((wire61 > wire58) * wire59))} ?
                      (!(~&wire63)) : $signed((wire62[(3'h7):(1'h0)] ?
                          wire63[(4'hc):(2'h3)] : {$unsigned(wire59)})));
  assign wire65 = wire63[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg66 <= $signed(((-((~&wire58) ? wire65 : $unsigned((8'hbe)))) ?
          wire62 : (~^$unsigned((wire61 ? wire60 : (7'h44))))));
    end
  assign wire67 = $signed($unsigned($signed(reg66[(4'hc):(4'ha)])));
  assign wire68 = wire61;
  assign wire69 = wire63[(3'h6):(1'h1)];
  always
    @(posedge clk) begin
      if ((wire67 ? (8'hb5) : $signed($signed($unsigned({wire62, reg66})))))
        begin
          if (wire65)
            begin
              reg70 <= ((wire60 ?
                  wire65[(2'h3):(1'h1)] : ($unsigned($unsigned((8'ha7))) ?
                      $unsigned(wire64) : (wire63[(3'h6):(3'h6)] || $unsigned(wire64)))) < wire59);
              reg71 <= $unsigned($unsigned($signed((8'hbb))));
              reg72 <= $unsigned({((!wire63) ? $signed(wire68) : wire59),
                  $unsigned($signed($signed(wire65)))});
              reg73 <= wire64[(2'h3):(2'h2)];
            end
          else
            begin
              reg70 <= {$unsigned({(+(~wire63))}),
                  ((^$unsigned($unsigned(wire62))) ?
                      $signed(wire68[(4'h8):(3'h7)]) : (^~wire58))};
              reg71 <= {$signed(((~|reg72) ^ (reg70 ?
                      (wire60 ? wire62 : reg71) : $unsigned(reg72)))),
                  {$unsigned($unsigned((-(8'ha5))))}};
              reg72 <= (8'hbb);
            end
        end
      else
        begin
          reg70 <= $signed(((wire61[(2'h3):(2'h2)] ^~ (^wire62[(4'ha):(2'h2)])) ?
              (!$signed(wire65)) : ($unsigned($signed(reg66)) ?
                  wire60[(1'h1):(1'h0)] : $unsigned($unsigned((8'ha2))))));
        end
      reg74 <= wire64;
      reg75 <= ({(wire58 ?
                  {wire60, reg71[(4'hc):(3'h7)]} : ($unsigned(wire59) ?
                      wire68[(5'h10):(3'h6)] : (reg71 > wire62))),
              ($signed((wire68 >= reg71)) * reg71)} ?
          $unsigned({(wire60[(3'h4):(1'h0)] ^~ reg72[(2'h3):(1'h1)])}) : ({(wire68 ?
                      reg70[(2'h2):(1'h1)] : (wire58 ~^ reg70)),
                  {$unsigned(reg73)}} ?
              $unsigned((~|{wire68,
                  reg71})) : $unsigned($signed($unsigned((8'hb2))))));
      if ($signed((wire63[(3'h4):(2'h2)] ?
          (~&(8'ha0)) : $unsigned(wire68[(1'h0):(1'h0)]))))
        begin
          reg76 <= ({($signed(wire69[(3'h6):(1'h0)]) ^~ (^~(reg70 ?
                      (8'h9e) : wire62))),
                  $unsigned((^~{wire67}))} ?
              ({((wire63 * wire63) >>> $signed(wire58)),
                  {wire60[(1'h0):(1'h0)],
                      wire59}} <<< $signed(((reg73 <= wire62) << reg74[(4'hf):(4'hd)]))) : $signed((wire58[(2'h3):(1'h0)] != (~|{reg66,
                  reg71}))));
          reg77 <= {$unsigned((~^(~^(wire62 ? reg75 : wire64)))),
              $signed((($unsigned(wire69) ^ $unsigned(wire65)) ?
                  $unsigned((~^(8'ha7))) : ((&wire69) << wire69[(2'h3):(1'h0)])))};
          if (wire61[(2'h3):(1'h0)])
            begin
              reg78 <= (reg77[(1'h1):(1'h1)] ? reg72[(2'h3):(1'h0)] : wire64);
              reg79 <= reg66[(4'h9):(3'h5)];
            end
          else
            begin
              reg78 <= $signed((wire69 ?
                  ({wire67[(3'h7):(1'h0)],
                      ((8'ha3) ?
                          (8'h9d) : reg70)} <= $signed(reg77[(1'h1):(1'h0)])) : $unsigned($signed((-reg75)))));
              reg79 <= {$unsigned((^~(^~(7'h44))))};
            end
          reg80 <= wire60[(2'h2):(1'h1)];
        end
      else
        begin
          if ({$signed(($unsigned(wire65[(2'h3):(2'h3)]) ?
                  $unsigned((~^wire63)) : reg75))})
            begin
              reg76 <= ($signed(($signed(reg74[(4'hc):(3'h4)]) <<< wire65)) ?
                  wire64 : reg80);
              reg77 <= $signed(wire63[(3'h5):(2'h3)]);
              reg78 <= wire59;
            end
          else
            begin
              reg76 <= wire60[(2'h2):(1'h0)];
              reg77 <= $signed($unsigned((+((wire68 >= reg78) <= $signed(reg76)))));
              reg78 <= $unsigned(wire69[(3'h5):(3'h4)]);
              reg79 <= wire62;
            end
          reg80 <= {(~((~&((8'haf) + reg71)) + (((8'ha2) ?
                  reg73 : wire68) == $signed(reg78))))};
          reg81 <= wire64;
        end
    end
  assign wire82 = wire58;
  assign wire83 = reg77[(4'h8):(3'h6)];
  assign wire84 = (~(!reg73));
  assign wire85 = (reg78[(3'h4):(3'h4)] ?
                      $unsigned((reg75[(4'hc):(4'ha)] >> ((wire59 * reg79) ?
                          wire84 : $unsigned(wire60)))) : (|$signed($signed((reg80 ?
                          reg78 : wire82)))));
  assign wire86 = reg81[(3'h4):(2'h3)];
  assign wire87 = ({{$unsigned(((8'ha6) ? (8'hb0) : wire58))}, wire69} ?
                      ((reg75 && (wire61 ?
                          (-reg66) : $signed(reg75))) < {$unsigned(wire68[(4'hb):(2'h2)]),
                          $unsigned({(8'hbc),
                              wire61})}) : $unsigned(reg79[(3'h7):(1'h1)]));
  always
    @(posedge clk) begin
      reg88 <= ((+$signed((wire69[(3'h6):(3'h6)] - (wire58 ?
          reg79 : reg79)))) >> wire85[(2'h3):(1'h0)]);
    end
  assign wire89 = {($signed($signed((wire59 ? reg77 : (8'hb8)))) ?
                          $signed($signed(((8'ha6) ?
                              wire83 : wire65))) : {reg81[(2'h2):(1'h1)]}),
                      (^~wire67)};
  assign wire90 = {(~&$signed({reg78, reg76}))};
  assign wire91 = {($signed(((wire86 ? reg81 : wire84) ?
                              $signed(reg73) : (~(8'h9e)))) ?
                          $signed($signed(((8'hb2) ?
                              wire85 : wire58))) : wire60)};
  assign wire92 = $unsigned((((~{wire58, wire86}) >> $signed($signed(wire84))) ?
                      wire84 : {(-reg66[(1'h0):(1'h0)]),
                          reg74[(4'hc):(2'h2)]}));
  assign wire93 = {$unsigned($signed({{reg76, reg81}})), $unsigned(wire82)};
endmodule

module module20
#(parameter param50 = ({(&(!(&(8'ha9)))), (^~(~^((8'hb8) < (8'hb9))))} ? {((~^((7'h40) ? (8'hb1) : (8'hb4))) ? {(~(8'hb3))} : (((8'hb8) == (8'ha8)) ? (!(8'hbf)) : ((8'hae) ^ (8'ha5))))} : (!(((~^(8'h9e)) ? ((8'h9f) ? (8'ha5) : (8'ha1)) : {(8'ha7), (7'h43)}) ? (((8'hb6) ? (8'ha3) : (8'hab)) * (|(8'hb7))) : (((8'h9c) ? (8'ha4) : (8'hac)) <<< {(8'hae), (8'hb4)})))), 
parameter param51 = param50)
(y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'h118):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire24;
  input wire [(4'ha):(1'h0)] wire23;
  input wire signed [(5'h14):(1'h0)] wire22;
  input wire signed [(4'he):(1'h0)] wire21;
  wire [(5'h12):(1'h0)] wire49;
  wire [(3'h5):(1'h0)] wire48;
  wire signed [(3'h5):(1'h0)] wire47;
  wire signed [(4'hd):(1'h0)] wire46;
  wire [(4'h8):(1'h0)] wire45;
  wire [(4'h8):(1'h0)] wire44;
  wire signed [(3'h6):(1'h0)] wire43;
  wire signed [(4'hc):(1'h0)] wire42;
  wire signed [(5'h11):(1'h0)] wire41;
  wire signed [(4'hc):(1'h0)] wire40;
  wire [(2'h3):(1'h0)] wire39;
  wire signed [(2'h2):(1'h0)] wire38;
  wire [(4'hf):(1'h0)] wire37;
  wire signed [(2'h2):(1'h0)] wire36;
  wire signed [(3'h5):(1'h0)] wire35;
  wire signed [(5'h11):(1'h0)] wire34;
  wire signed [(3'h5):(1'h0)] wire33;
  wire signed [(4'hc):(1'h0)] wire28;
  wire signed [(5'h11):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire26;
  wire [(5'h14):(1'h0)] wire25;
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  assign y = {wire49,
                 wire48,
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
                 wire34,
                 wire33,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 (1'h0)};
  assign wire25 = $signed($unsigned((-((~|(8'ha2)) << wire21))));
  assign wire26 = (~&$unsigned(wire21));
  assign wire27 = (~wire22);
  assign wire28 = {$signed($unsigned(wire26[(5'h12):(4'hf)]))};
  always
    @(posedge clk) begin
      reg29 <= wire25[(4'he):(4'h9)];
      reg30 <= ($unsigned($unsigned({(wire27 ? wire24 : wire23), (8'hb0)})) ?
          $unsigned({$signed(((8'hb6) ? wire27 : wire21)),
              (wire27[(5'h10):(4'hc)] <= $signed(wire23))}) : $signed((((wire28 ?
                  wire27 : reg29) > (~wire24)) ?
              (|$unsigned(wire24)) : wire22[(4'hf):(4'h9)])));
      reg31 <= $unsigned({$unsigned({$signed(wire27), (wire22 + wire22)}),
          (+((wire21 ? wire27 : wire24) + (~|(8'hbb))))});
      reg32 <= $unsigned($unsigned(wire28[(3'h4):(3'h4)]));
    end
  assign wire33 = (wire26[(1'h1):(1'h0)] ?
                      $unsigned((~^reg31)) : ((!(^{wire26})) ?
                          (wire22 <= $unsigned(wire23[(3'h5):(2'h2)])) : {$unsigned($unsigned(reg32)),
                              reg31[(4'h9):(2'h2)]}));
  assign wire34 = (wire27 >>> (^wire25));
  assign wire35 = (wire33 || (^($signed($unsigned(wire25)) ?
                      wire34[(4'hf):(3'h4)] : wire34)));
  assign wire36 = $unsigned(((+(^~(wire27 - reg31))) ?
                      $unsigned(wire27[(4'h9):(1'h0)]) : $unsigned($signed((wire23 + wire34)))));
  assign wire37 = wire33[(2'h3):(2'h3)];
  assign wire38 = (wire37 ?
                      (((wire36[(2'h2):(1'h0)] && (wire36 ^ reg29)) != (&wire24)) ?
                          $unsigned(wire36) : $unsigned((!(wire21 ?
                              wire28 : (8'hb4))))) : $unsigned(($unsigned(wire27) ?
                          $signed((8'ha6)) : ($signed(wire35) >>> $unsigned(wire36)))));
  assign wire39 = $signed(wire22[(4'he):(3'h5)]);
  assign wire40 = (reg29 < wire34[(3'h5):(2'h2)]);
  assign wire41 = wire39[(2'h3):(1'h1)];
  assign wire42 = wire35[(1'h1):(1'h0)];
  assign wire43 = reg30[(4'hb):(3'h4)];
  assign wire44 = $unsigned(({wire28,
                      $signed($unsigned((8'ha0)))} > ($unsigned(wire25[(3'h6):(3'h5)]) == wire21[(4'hd):(2'h3)])));
  assign wire45 = (~($signed((!reg30)) < $signed($signed($signed(wire44)))));
  assign wire46 = (~reg31);
  assign wire47 = (({$unsigned(wire21),
                      (&{wire26})} + (8'hbe)) ^~ (wire27 ^ $unsigned(wire22[(5'h11):(3'h7)])));
  assign wire48 = $signed((8'hb1));
  assign wire49 = wire28;
endmodule
