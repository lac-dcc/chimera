module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h13a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire216;
  wire [(5'h14):(1'h0)] wire22;
  wire [(5'h15):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire111;
  wire [(5'h15):(1'h0)] wire113;
  wire [(5'h11):(1'h0)] wire114;
  wire signed [(3'h5):(1'h0)] wire115;
  wire signed [(5'h13):(1'h0)] wire116;
  wire signed [(4'he):(1'h0)] wire117;
  wire [(4'hb):(1'h0)] wire118;
  wire [(5'h15):(1'h0)] wire119;
  wire [(5'h11):(1'h0)] wire120;
  wire [(2'h3):(1'h0)] wire121;
  wire [(4'h8):(1'h0)] wire214;
  reg [(4'hc):(1'h0)] reg220 = (1'h0);
  reg [(5'h15):(1'h0)] reg219 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg218 = (1'h0);
  reg [(5'h11):(1'h0)] reg217 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg122 = (1'h0);
  reg [(4'he):(1'h0)] reg5 = (1'h0);
  assign y = {wire216,
                 wire22,
                 wire8,
                 wire7,
                 wire6,
                 wire111,
                 wire113,
                 wire114,
                 wire115,
                 wire116,
                 wire117,
                 wire118,
                 wire119,
                 wire120,
                 wire121,
                 wire214,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg122,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire1;
    end
  assign wire6 = (-wire3);
  assign wire7 = (({wire0[(3'h6):(2'h2)],
                             ($unsigned(wire1) ~^ wire2[(4'ha):(4'h8)])} ?
                         ({reg5} ?
                             wire6[(3'h7):(3'h7)] : ({wire3,
                                 wire0} - wire2)) : (((wire6 ~^ wire4) ?
                             reg5 : ((8'ha7) ?
                                 wire6 : wire0)) * $signed($signed(wire0)))) ?
                     $unsigned((~wire4[(3'h6):(2'h3)])) : (~|($signed($unsigned(wire0)) ?
                         wire4[(4'hd):(4'hd)] : ((wire6 == reg5) ?
                             (wire3 - reg5) : (7'h41)))));
  assign wire8 = $signed((!$unsigned(((reg5 >= (7'h44)) << (~&wire2)))));
  module9 #() modinst23 (wire22, clk, wire6, wire4, wire8, wire1, wire2);
  module24 #() modinst112 (.wire25(wire8), .clk(clk), .wire28(reg5), .wire29(wire0), .wire27(wire3), .y(wire111), .wire26(wire1));
  assign wire113 = {(^{wire2, wire7[(4'hf):(4'hd)]}), (8'hb5)};
  assign wire114 = $unsigned(wire7[(5'h11):(3'h4)]);
  assign wire115 = $unsigned(((wire6[(4'hb):(1'h1)] ^~ ((wire111 == (8'hbd)) ?
                       wire6 : {wire6, reg5})) <= {wire8[(4'h8):(3'h7)],
                       {$unsigned(wire7), {wire22, wire0}}}));
  assign wire116 = (-(7'h40));
  assign wire117 = $signed(wire7);
  assign wire118 = $signed((&$unsigned((~^(+wire114)))));
  assign wire119 = ($unsigned((&wire1)) ?
                       (wire8[(4'h8):(1'h0)] ?
                           ($signed((&wire118)) ?
                               $signed($signed(wire22)) : ((7'h40) ?
                                   wire2 : {(8'hb8),
                                       wire1})) : wire3[(5'h14):(5'h10)]) : (8'hb0));
  assign wire120 = wire117;
  assign wire121 = $unsigned((!(wire3 ?
                       wire119[(3'h4):(3'h4)] : wire2[(4'he):(4'he)])));
  always
    @(posedge clk) begin
      reg122 <= (wire6[(1'h0):(1'h0)] ?
          wire117 : $signed($signed($signed({wire121, (8'h9e)}))));
    end
  module123 #() modinst215 (wire214, clk, wire114, wire8, wire119, wire3, wire22);
  assign wire216 = $signed($signed($unsigned((wire115[(3'h5):(2'h3)] ?
                       $unsigned(wire114) : wire111[(2'h2):(2'h2)]))));
  always
    @(posedge clk) begin
      reg217 <= $unsigned($signed(wire216[(4'hc):(2'h3)]));
      reg218 <= $signed({$signed((^(8'hb0)))});
      reg219 <= (8'haf);
      reg220 <= wire121;
    end
endmodule

module module123
#(parameter param213 = ((~&(~&(8'h9d))) ? ({(((8'hbf) <= (8'ha6)) ? ((8'hbb) * (8'hac)) : ((8'hbd) ? (8'hb7) : (8'hb5))), (((8'h9f) < (8'ha1)) ? (8'hb7) : {(8'h9f)})} ? (!(~&((8'hb8) ? (8'hba) : (8'hb1)))) : ((((8'h9c) ^ (7'h44)) >>> ((8'h9f) & (8'had))) && (((8'hb5) - (8'ha1)) ? (~(8'hbe)) : (~(8'hb3))))) : (|(&(((8'hbb) > (8'hbc)) ? ((8'ha5) ? (8'ha6) : (7'h42)) : ((7'h40) >= (8'h9c)))))))
(y, clk, wire128, wire127, wire126, wire125, wire124);
  output wire [(32'h13c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire128;
  input wire [(4'he):(1'h0)] wire127;
  input wire signed [(5'h15):(1'h0)] wire126;
  input wire [(5'h10):(1'h0)] wire125;
  input wire [(5'h14):(1'h0)] wire124;
  wire signed [(4'hb):(1'h0)] wire212;
  wire signed [(3'h6):(1'h0)] wire211;
  wire signed [(5'h12):(1'h0)] wire207;
  wire signed [(4'hd):(1'h0)] wire206;
  wire [(5'h12):(1'h0)] wire205;
  wire [(4'hc):(1'h0)] wire196;
  wire [(3'h6):(1'h0)] wire162;
  wire signed [(4'hd):(1'h0)] wire161;
  wire [(4'he):(1'h0)] wire160;
  wire [(5'h13):(1'h0)] wire159;
  wire [(2'h2):(1'h0)] wire158;
  wire signed [(5'h15):(1'h0)] wire157;
  wire [(4'hf):(1'h0)] wire155;
  wire [(4'ha):(1'h0)] wire132;
  wire [(5'h11):(1'h0)] wire131;
  wire [(5'h14):(1'h0)] wire130;
  wire [(4'hd):(1'h0)] wire129;
  reg signed [(3'h5):(1'h0)] reg210 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg209 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg208 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg204 = (1'h0);
  reg [(2'h3):(1'h0)] reg203 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg202 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg201 = (1'h0);
  reg [(5'h14):(1'h0)] reg200 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg199 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg198 = (1'h0);
  assign y = {wire212,
                 wire211,
                 wire207,
                 wire206,
                 wire205,
                 wire196,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire155,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 reg210,
                 reg209,
                 reg208,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 (1'h0)};
  assign wire129 = ((!(+(wire127 ?
                       wire124[(5'h12):(5'h11)] : ((8'ha0) >> wire125)))) ^~ ((wire125[(4'ha):(2'h2)] ?
                           $signed($signed(wire128)) : $unsigned((wire128 ^~ wire127))) ?
                       wire125[(4'he):(4'hc)] : wire126));
  assign wire130 = $signed($unsigned($signed(wire124[(4'hf):(2'h3)])));
  assign wire131 = wire130;
  assign wire132 = wire127[(1'h0):(1'h0)];
  module133 #() modinst156 (wire155, clk, wire130, wire124, wire128, wire132);
  assign wire157 = {({(~|$unsigned(wire155))} ^ $signed(wire126))};
  assign wire158 = (wire130[(4'he):(4'he)] ~^ $unsigned({((wire128 >> (8'hbd)) ^~ (|wire130)),
                       ((wire131 ? wire132 : wire130) ?
                           wire131[(3'h5):(2'h3)] : (wire126 ?
                               wire132 : wire126))}));
  assign wire159 = wire158;
  assign wire160 = (!$signed(wire131[(4'he):(1'h1)]));
  assign wire161 = (wire155[(3'h4):(1'h1)] ?
                       ((wire157[(3'h5):(3'h4)] ?
                               $signed($signed(wire155)) : wire130[(3'h4):(3'h4)]) ?
                           {(wire124[(4'hb):(3'h4)] * (wire128 ~^ wire131))} : ({$signed(wire130),
                                   {(8'haf)}} ?
                               $signed($unsigned(wire125)) : $unsigned($unsigned(wire160)))) : {{(!$signed(wire159))}});
  assign wire162 = (((|((wire130 > wire129) * wire129)) ?
                           wire124[(5'h11):(2'h3)] : (+(wire130[(4'hc):(4'h9)] && {wire131}))) ?
                       {$unsigned(((wire129 && wire131) && wire131[(2'h3):(2'h3)])),
                           (|(wire161 + (wire155 < wire131)))} : (($signed($signed((8'hbb))) ?
                               ($unsigned(wire127) ^ (wire127 ^~ wire159)) : (wire128 >>> wire157)) ?
                           {$unsigned(wire157[(1'h1):(1'h1)])} : ((((8'hb1) ?
                                   (8'hb9) : wire131) != (-wire159)) ?
                               (!$signed(wire158)) : (8'hb5))));
  module163 #() modinst197 (wire196, clk, wire130, wire161, wire157, wire129);
  always
    @(posedge clk) begin
      if (wire155[(2'h2):(1'h1)])
        begin
          if ({wire130[(2'h2):(1'h1)]})
            begin
              reg198 <= (8'hba);
              reg199 <= {(8'had)};
              reg200 <= reg199;
              reg201 <= wire130[(4'hc):(4'ha)];
              reg202 <= $signed(({$unsigned($unsigned(wire157))} ?
                  $signed($signed(((8'ha0) >> reg199))) : $unsigned((~wire129[(2'h3):(2'h3)]))));
            end
          else
            begin
              reg198 <= $unsigned({(^$signed(wire132))});
              reg199 <= {$signed((((!wire196) >= wire155[(4'hb):(2'h3)]) < wire129))};
              reg200 <= $signed((((!(wire159 ? wire157 : wire159)) ?
                  $unsigned((reg201 ?
                      wire130 : wire161)) : wire124) >= $signed((wire131 == $unsigned((8'hbd))))));
            end
          reg203 <= $unsigned(reg201);
          reg204 <= wire161;
        end
      else
        begin
          reg198 <= wire155[(2'h2):(2'h2)];
        end
    end
  assign wire205 = (7'h40);
  assign wire206 = reg201;
  assign wire207 = (|reg199[(2'h3):(2'h3)]);
  always
    @(posedge clk) begin
      reg208 <= (^~((~|{(^~wire155), {(8'ha9)}}) ?
          {wire162[(2'h2):(1'h1)],
              wire127[(4'h8):(3'h7)]} : $unsigned($signed(wire127[(2'h3):(2'h2)]))));
      if (wire127[(3'h6):(1'h1)])
        begin
          reg209 <= (|((8'hbd) ?
              (~^$unsigned({wire158})) : ($unsigned($unsigned(wire205)) ?
                  {(reg199 <= wire160)} : $unsigned(reg199[(3'h7):(1'h0)]))));
        end
      else
        begin
          reg209 <= $unsigned(({($unsigned(reg201) ?
                  wire127[(4'he):(3'h7)] : $signed(reg198))} || ({wire161,
              (&wire162)} >>> wire205[(4'h9):(1'h1)])));
          reg210 <= {((~&($signed(reg201) == (wire132 ?
                  wire125 : wire129))) << (8'ha3))};
        end
    end
  assign wire211 = reg198[(2'h2):(2'h2)];
  assign wire212 = (wire158 < (~|(+{{wire157}, (~&wire158)})));
endmodule

module module24  (y, clk, wire29, wire28, wire27, wire26, wire25);
  output wire [(32'h25f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire29;
  input wire [(4'he):(1'h0)] wire28;
  input wire signed [(2'h3):(1'h0)] wire27;
  input wire [(5'h13):(1'h0)] wire26;
  input wire [(5'h15):(1'h0)] wire25;
  wire signed [(4'he):(1'h0)] wire110;
  wire [(4'hc):(1'h0)] wire109;
  wire [(4'he):(1'h0)] wire108;
  wire [(4'hd):(1'h0)] wire107;
  wire [(4'he):(1'h0)] wire105;
  wire [(4'ha):(1'h0)] wire79;
  wire [(4'hc):(1'h0)] wire78;
  wire signed [(4'ha):(1'h0)] wire77;
  wire signed [(4'h8):(1'h0)] wire70;
  wire signed [(3'h7):(1'h0)] wire42;
  wire [(2'h2):(1'h0)] wire41;
  wire signed [(2'h2):(1'h0)] wire40;
  wire signed [(4'hc):(1'h0)] wire39;
  wire [(4'hd):(1'h0)] wire38;
  wire signed [(4'hc):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire36;
  wire signed [(5'h11):(1'h0)] wire35;
  wire signed [(2'h3):(1'h0)] wire34;
  wire signed [(4'he):(1'h0)] wire30;
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg32 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(4'he):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg50 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg53 = (1'h0);
  reg signed [(4'he):(1'h0)] reg54 = (1'h0);
  reg signed [(4'he):(1'h0)] reg55 = (1'h0);
  reg [(3'h7):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg57 = (1'h0);
  reg [(3'h7):(1'h0)] reg58 = (1'h0);
  reg [(2'h2):(1'h0)] reg59 = (1'h0);
  reg [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg61 = (1'h0);
  reg [(5'h15):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg63 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(4'he):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg66 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg72 = (1'h0);
  reg [(2'h2):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg76 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire105,
                 wire79,
                 wire78,
                 wire77,
                 wire70,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire30,
                 reg31,
                 reg32,
                 reg33,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
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
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 (1'h0)};
  assign wire30 = wire28;
  always
    @(posedge clk) begin
      reg31 <= ((-(~^$signed((wire28 << wire27)))) >>> $signed($unsigned((wire25[(1'h1):(1'h1)] <= (~|wire27)))));
      reg32 <= {(($unsigned((wire25 ~^ wire25)) <= $unsigned($signed(wire25))) ?
              wire25 : ($signed((!wire30)) ?
                  (~&$unsigned(wire29)) : {(wire29 || wire27), (!wire28)})),
          wire29[(3'h4):(3'h4)]};
      reg33 <= $signed($unsigned(({(reg31 ? (8'h9c) : reg31)} <<< wire30)));
    end
  assign wire34 = $signed((!$signed($unsigned((~&wire28)))));
  assign wire35 = ({{(reg31[(2'h3):(2'h3)] ?
                                  (wire30 ? wire34 : reg32) : (wire30 ?
                                      (8'had) : reg32)),
                              $unsigned($signed(reg31))}} ?
                      reg31[(1'h1):(1'h0)] : $unsigned(reg33[(5'h10):(4'hb)]));
  assign wire36 = wire28;
  assign wire37 = $signed((($unsigned((^wire36)) ?
                      {(&wire29), $unsigned(wire34)} : wire25) <= wire34));
  assign wire38 = (8'hb1);
  assign wire39 = (-(~(~^$unsigned({wire28}))));
  assign wire40 = {wire28,
                      (wire39[(4'h8):(3'h7)] ?
                          (~^($unsigned(wire37) ?
                              wire37[(4'h9):(4'h8)] : (-wire27))) : $signed($unsigned((wire36 ?
                              wire27 : wire28))))};
  assign wire41 = wire36;
  assign wire42 = ((~|wire41[(2'h2):(1'h1)]) ?
                      $signed((&$unsigned(reg32[(2'h2):(1'h0)]))) : ($unsigned(wire27) ?
                          {$signed({(7'h41), wire36}),
                              (7'h41)} : (+$unsigned(wire27[(2'h3):(1'h1)]))));
  always
    @(posedge clk) begin
      if ((~|((reg32[(1'h1):(1'h0)] | {$signed(wire29),
          (wire42 > (7'h42))}) <<< {wire38})))
        begin
          reg43 <= $signed((|wire36[(3'h4):(1'h0)]));
          if ((($signed(wire39) ?
              ((wire26 || (reg33 ^ reg33)) ^~ wire28[(1'h1):(1'h0)]) : wire42[(3'h4):(2'h2)]) && (8'haf)))
            begin
              reg44 <= {$signed((^$signed({wire35}))),
                  (~^wire40[(2'h2):(1'h0)])};
              reg45 <= (8'hb2);
            end
          else
            begin
              reg44 <= ($unsigned((!(reg43 >= wire25))) << wire41[(2'h2):(2'h2)]);
              reg45 <= reg33;
              reg46 <= {(8'ha0), (^~(+(~|(wire28 ? wire26 : reg31))))};
              reg47 <= {$signed(wire30[(4'ha):(4'h8)])};
              reg48 <= $unsigned(($unsigned($signed((wire40 ?
                  wire39 : reg45))) + {(~&{(7'h41), (8'had)}),
                  $unsigned($unsigned(wire30))}));
            end
          if ({wire29[(4'hd):(4'hb)], {wire29[(3'h5):(1'h1)]}})
            begin
              reg49 <= (($signed((~wire42)) ?
                  (|((wire34 ? reg47 : (8'hb0)) ?
                      $signed(wire28) : {wire38,
                          wire26})) : (!(~wire28))) * ((reg45 - (+wire28[(3'h7):(1'h0)])) ?
                  $signed((~$unsigned(reg32))) : (!({wire26} ?
                      $signed((8'hb8)) : (reg44 ? wire34 : wire37)))));
              reg50 <= ({$unsigned($unsigned(wire25[(4'h9):(3'h4)]))} ?
                  {(reg31 ? wire26 : wire41),
                      (((~^wire41) ?
                          (^~wire40) : $signed(reg43)) | wire28[(4'h8):(2'h3)])} : $signed($signed(wire30[(4'hb):(3'h7)])));
              reg51 <= $signed(wire35);
              reg52 <= wire35[(3'h4):(3'h4)];
              reg53 <= (~^$signed((($signed(wire26) * (8'hb4)) & (reg43[(3'h4):(2'h2)] ?
                  (~^reg49) : (wire34 && reg44)))));
            end
          else
            begin
              reg49 <= reg43[(4'h9):(3'h5)];
              reg50 <= reg51[(3'h5):(1'h0)];
              reg51 <= reg53;
              reg52 <= ($signed((+$signed((wire34 <<< reg45)))) < ((((reg32 ?
                          wire36 : wire42) == (!wire39)) ?
                      {$signed(reg52),
                          wire41[(1'h0):(1'h0)]} : $unsigned({reg46})) ?
                  (~&($signed((7'h40)) ?
                      (reg46 >> (8'hbb)) : {wire34,
                          (7'h42)})) : {(!(^~wire29))}));
              reg53 <= (&($signed(wire26) <<< reg53[(2'h2):(1'h0)]));
            end
          reg54 <= (wire41[(1'h1):(1'h1)] ?
              (-$unsigned((!(8'ha6)))) : $unsigned((-(-{wire38}))));
          reg55 <= reg54[(1'h0):(1'h0)];
        end
      else
        begin
          if ($unsigned(wire30))
            begin
              reg43 <= wire26[(4'he):(4'hb)];
              reg44 <= wire36;
            end
          else
            begin
              reg43 <= reg50;
              reg44 <= $signed(((reg44 ?
                  $signed(wire29) : reg52) >= $unsigned($signed(((8'hbb) > reg54)))));
              reg45 <= reg55;
              reg46 <= ((~&(!(8'ha2))) ^~ wire42[(2'h2):(2'h2)]);
              reg47 <= (($signed(wire35) ?
                  (^$unsigned(((8'hb0) ? wire25 : reg53))) : reg32) & (wire25 ?
                  reg52[(3'h7):(2'h2)] : $signed({$unsigned(wire42),
                      $unsigned(reg51)})));
            end
          reg48 <= ({$signed($unsigned(reg51[(3'h4):(1'h1)]))} ?
              {({$signed(wire26), $unsigned(reg49)} ?
                      wire27 : (~^(wire42 & wire42))),
                  $signed(reg51[(3'h5):(3'h5)])} : {$unsigned(reg49)});
          reg49 <= $unsigned(((8'ha0) <<< (^(reg51 + ((7'h40) ?
              (8'ha0) : (8'ha3))))));
        end
      if ({(wire27[(2'h2):(1'h0)] ?
              $unsigned(((reg53 ? wire41 : reg53) & wire25)) : wire41),
          $signed((^(|reg55[(2'h2):(2'h2)])))})
        begin
          if ((8'ha8))
            begin
              reg56 <= {$unsigned($signed((wire29[(4'h9):(3'h6)] ?
                      reg54 : reg53[(3'h5):(3'h5)])))};
            end
          else
            begin
              reg56 <= {(reg44[(4'hb):(1'h1)] ^~ reg52[(2'h2):(1'h0)])};
              reg57 <= reg54;
              reg58 <= ($signed((+{(+wire26), reg48})) ?
                  ((($signed(reg46) | (|reg44)) ?
                      reg55[(4'h9):(2'h3)] : (~reg32[(4'hc):(1'h0)])) == $unsigned(reg52[(3'h5):(1'h1)])) : {$signed($unsigned(wire37[(1'h0):(1'h0)])),
                      ($signed((reg52 < reg48)) ?
                          $unsigned(wire27[(2'h3):(2'h3)]) : $unsigned({wire39,
                              wire27}))});
            end
          if ((((&$signed((~^wire35))) << $signed($signed({wire38}))) <= reg49[(1'h0):(1'h0)]))
            begin
              reg59 <= $signed({(^~(reg45 ~^ reg57))});
              reg60 <= (^wire38);
            end
          else
            begin
              reg59 <= (8'hbe);
            end
        end
      else
        begin
          reg56 <= $unsigned(((|(~&{reg54})) >>> ((wire30[(4'ha):(1'h0)] ?
                  reg56 : {reg52}) ?
              ($unsigned(reg32) ? (8'hb1) : (~^reg50)) : ((reg46 ?
                  reg46 : (8'ha5)) - $unsigned(wire39)))));
          if ((wire38[(2'h3):(1'h1)] >>> (($signed($signed(wire42)) << {(-wire36),
              ((8'hbc) ^ reg59)}) != $unsigned(((wire35 ? reg53 : wire35) ?
              reg58[(2'h3):(1'h0)] : (~wire26))))))
            begin
              reg57 <= (&(wire25 ? (8'hb2) : wire35));
              reg58 <= $signed(reg48[(4'hd):(4'hc)]);
              reg59 <= $signed((($signed($signed(reg55)) ?
                  $signed(reg46) : reg56[(1'h1):(1'h1)]) > ($unsigned((wire28 ?
                      wire40 : wire25)) ?
                  $unsigned(wire30) : wire41)));
            end
          else
            begin
              reg57 <= wire27;
              reg58 <= $unsigned(({(~^reg53[(4'ha):(4'h8)]),
                      (&(wire38 ? reg58 : reg47))} ?
                  $unsigned($signed((wire26 ? wire28 : reg52))) : reg60));
              reg59 <= wire34;
            end
          reg60 <= reg53;
          reg61 <= ((~&(+$signed({(8'hb4)}))) ? $signed(wire41) : reg48);
          if ($unsigned((((-(8'h9e)) >>> $unsigned(reg31)) ?
              (($signed((8'ha8)) <= {reg55}) | ($unsigned((8'ha1)) ?
                  reg33[(5'h11):(2'h2)] : $signed((8'hae)))) : (~|$signed((8'hba))))))
            begin
              reg62 <= {((~&(wire28 ?
                      (+reg49) : $signed(reg57))) != (wire36[(2'h3):(1'h0)] | reg61)),
                  $unsigned(reg50[(2'h3):(2'h2)])};
              reg63 <= (wire28[(1'h0):(1'h0)] + ((((reg58 ?
                      wire25 : (8'ha0)) ^~ $signed(reg50)) ?
                  reg62 : reg51[(3'h4):(3'h4)]) == {wire36,
                  (+((8'hbf) <= wire35))}));
              reg64 <= $unsigned(($signed((-(reg57 != reg55))) <= reg32));
              reg65 <= ((~&($unsigned((reg64 || wire25)) ?
                  ($signed(wire27) ?
                      wire30 : reg54) : $signed(wire35[(4'h8):(4'h8)]))) ^ $unsigned((~(8'ha4))));
              reg66 <= wire39;
            end
          else
            begin
              reg62 <= $signed(($unsigned($unsigned($unsigned(reg31))) && reg33));
              reg63 <= (^~(!wire42));
            end
        end
      reg67 <= {((^~{{reg48, reg59}, (&reg61)}) ?
              (~((-reg58) ?
                  reg60 : $unsigned(wire35))) : ((reg43 && (~&reg46)) ?
                  (&(reg54 & reg46)) : $unsigned((^wire29))))};
      reg68 <= (reg58[(2'h2):(2'h2)] >>> (reg46[(2'h2):(1'h0)] ?
          ((-(&reg51)) >>> {$signed(wire25)}) : reg59));
      reg69 <= wire36[(2'h2):(1'h1)];
    end
  assign wire70 = $signed(reg52[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if (reg52)
        begin
          reg71 <= (&(~&(|$unsigned($signed(reg43)))));
          reg72 <= (^reg55);
          reg73 <= $unsigned(reg53[(5'h11):(3'h7)]);
          reg74 <= reg72;
          reg75 <= $unsigned(wire26);
        end
      else
        begin
          reg71 <= $signed($signed($unsigned($signed((&reg57)))));
          reg72 <= (&reg47);
          reg73 <= $signed((((8'ha0) ?
              $signed($unsigned(reg52)) : $signed((~|reg64))) ~^ $signed($signed($signed((8'hbc))))));
        end
      reg76 <= reg33[(5'h11):(3'h5)];
    end
  assign wire77 = reg57[(2'h2):(1'h0)];
  assign wire78 = ($signed((wire37[(4'hc):(4'h9)] ?
                          $signed((~reg54)) : reg62)) ?
                      wire35[(2'h3):(2'h3)] : $unsigned((wire36 ?
                          reg61 : (!{reg58}))));
  assign wire79 = ($signed(reg52[(4'ha):(1'h0)]) - (~^(~wire37)));
  module80 #() modinst106 (.clk(clk), .wire85(wire25), .wire84(wire35), .wire82(reg57), .wire83(reg52), .wire81(reg65), .y(wire105));
  assign wire107 = ({(wire39[(2'h3):(2'h3)] < {wire30[(2'h3):(2'h2)],
                           $signed(wire27)}),
                       ($unsigned(reg48) ?
                           $signed($signed(reg33)) : (reg72 ?
                               (reg43 ?
                                   wire78 : wire27) : $signed((8'hb3))))} + reg63[(1'h0):(1'h0)]);
  assign wire108 = ((-$signed(wire107[(3'h5):(1'h0)])) ?
                       $unsigned($unsigned(reg33[(1'h1):(1'h0)])) : (($signed(reg54) ?
                               reg76 : {$unsigned(wire78)}) ?
                           ((reg53[(5'h12):(1'h1)] ?
                               (wire30 > wire39) : {wire70, reg50}) > (|{reg47,
                               reg76})) : {reg55[(3'h4):(3'h4)]}));
  assign wire109 = (-($signed($unsigned((reg64 ? reg59 : reg32))) ^~ reg69));
  assign wire110 = reg62;
endmodule

module module9
#(parameter param21 = ((((8'hb4) ? (((8'ha6) + (8'hbe)) < (~^(8'hbe))) : (~&((8'h9c) <<< (8'ha5)))) ? (+({(8'hbc)} ? {(8'ha9)} : (~&(8'had)))) : {((&(8'h9d)) == {(8'hae), (7'h42)}), ((8'hbc) || ((8'ha6) ? (8'hb9) : (8'hbb)))}) ? (^~(~({(8'hb2)} ? {(8'h9f), (8'hbc)} : ((7'h43) ? (7'h43) : (8'hab))))) : ((~(~((8'hbb) ? (8'hb6) : (7'h44)))) != ({((8'hab) ? (7'h42) : (8'haf))} * (((8'ha6) ? (8'ha3) : (8'hbf)) ? (~|(8'ha4)) : ((8'ha3) ? (8'haa) : (7'h43)))))))
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire14;
  input wire [(4'hf):(1'h0)] wire13;
  input wire signed [(5'h11):(1'h0)] wire12;
  input wire [(4'he):(1'h0)] wire11;
  input wire [(5'h14):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire20;
  wire signed [(4'ha):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire18;
  wire [(5'h12):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire16;
  wire [(3'h4):(1'h0)] wire15;
  assign y = {wire20, wire19, wire18, wire17, wire16, wire15, (1'h0)};
  assign wire15 = (~({(^wire14)} & (($signed(wire13) ?
                          wire13[(4'hf):(4'ha)] : (wire10 != (8'hb2))) ?
                      $unsigned($unsigned(wire14)) : {{wire10},
                          (wire11 ? (8'hb2) : wire12)})));
  assign wire16 = wire14;
  assign wire17 = {wire13};
  assign wire18 = (&$unsigned((^~wire12)));
  assign wire19 = $unsigned({{wire16}});
  assign wire20 = (wire12[(4'hb):(2'h3)] ?
                      $unsigned((^~{(~&wire10)})) : $signed((wire12[(4'hd):(1'h1)] ?
                          ((+wire11) ~^ $signed(wire12)) : (8'ha7))));
endmodule

module module80
#(parameter param104 = (!{(~&{(-(8'hbd)), {(7'h42)}})}))
(y, clk, wire85, wire84, wire83, wire82, wire81);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire85;
  input wire signed [(4'he):(1'h0)] wire84;
  input wire [(5'h15):(1'h0)] wire83;
  input wire [(5'h10):(1'h0)] wire82;
  input wire signed [(4'h9):(1'h0)] wire81;
  wire signed [(5'h14):(1'h0)] wire103;
  wire [(4'h9):(1'h0)] wire102;
  wire signed [(3'h4):(1'h0)] wire101;
  wire [(3'h7):(1'h0)] wire100;
  wire [(3'h7):(1'h0)] wire99;
  wire signed [(4'hf):(1'h0)] wire98;
  reg signed [(2'h2):(1'h0)] reg97 = (1'h0);
  reg [(4'hb):(1'h0)] reg96 = (1'h0);
  reg [(4'h9):(1'h0)] reg95 = (1'h0);
  reg [(5'h14):(1'h0)] reg94 = (1'h0);
  reg [(5'h14):(1'h0)] reg93 = (1'h0);
  reg [(4'h9):(1'h0)] reg92 = (1'h0);
  reg [(4'ha):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg90 = (1'h0);
  reg [(5'h10):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg87 = (1'h0);
  reg [(3'h6):(1'h0)] reg86 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg86 <= wire82;
      if ({(wire85 ?
              (^~(reg86 == $unsigned(reg86))) : (^~{(|(8'hb3)),
                  (wire85 == (8'ha4))})),
          $signed($signed(($unsigned(wire83) ?
              (wire85 ? reg86 : wire82) : (wire81 <= wire82))))})
        begin
          reg87 <= $unsigned($unsigned($signed(wire84[(4'ha):(4'h9)])));
          reg88 <= $signed(wire82);
        end
      else
        begin
          if ($unsigned(reg87))
            begin
              reg87 <= (~|$unsigned(wire85));
              reg88 <= wire81[(3'h7):(3'h6)];
              reg89 <= (($unsigned(reg87) <= ((^$signed(reg86)) < (~&{wire82}))) ?
                  $unsigned(((~|wire82) ?
                      ((&(8'haa)) ?
                          (reg86 >= reg87) : reg86[(3'h4):(1'h0)]) : $signed(reg87[(3'h4):(1'h1)]))) : (wire85 != ($unsigned((wire84 && reg87)) + ($unsigned(wire83) ?
                      $unsigned(wire81) : (wire82 ? wire83 : (8'hb2))))));
              reg90 <= ($unsigned($signed($signed(wire84))) | ($signed((&reg87)) != $signed(wire83)));
              reg91 <= ($unsigned($signed(($unsigned(reg88) >= (wire81 >> (8'hbb))))) ~^ $unsigned(($signed((reg87 && wire83)) ?
                  reg87[(3'h4):(1'h1)] : (&(reg86 && (8'hb8))))));
            end
          else
            begin
              reg87 <= (&$unsigned(wire82[(3'h5):(1'h1)]));
            end
          if (($signed(($unsigned((reg88 < (8'haf))) ?
              (!wire81) : $signed($unsigned(reg89)))) ~^ $unsigned((&wire82[(2'h3):(1'h0)]))))
            begin
              reg92 <= ($unsigned(reg90[(3'h4):(1'h1)]) && reg86[(2'h2):(1'h0)]);
              reg93 <= (-(8'hb2));
              reg94 <= (!reg90);
            end
          else
            begin
              reg92 <= reg93;
            end
        end
      reg95 <= wire82[(3'h7):(3'h7)];
      reg96 <= (({reg87} >> (+reg93[(3'h5):(3'h5)])) ?
          $signed((reg93[(4'h8):(3'h5)] + (^reg92))) : $signed($unsigned(wire85)));
      reg97 <= (wire84 ?
          ((~{$signed(reg90),
              (reg91 ?
                  reg93 : reg91)}) == wire81[(3'h7):(3'h6)]) : ((reg91[(3'h4):(2'h3)] & ((wire84 != wire84) ?
              (wire84 ^ reg96) : $unsigned(reg91))) ~^ wire81));
    end
  assign wire98 = (~|reg89);
  assign wire99 = {$signed((8'ha1))};
  assign wire100 = (8'ha8);
  assign wire101 = ($signed($unsigned(reg90)) * ({$unsigned(((8'hb0) == reg97))} >= (reg97[(2'h2):(2'h2)] != $unsigned(wire99))));
  assign wire102 = wire85[(2'h2):(2'h2)];
  assign wire103 = ((~|$unsigned(((wire85 & reg92) == $signed(reg89)))) & $unsigned({wire100[(2'h2):(1'h1)],
                       reg89[(5'h10):(4'h9)]}));
endmodule

module module163
#(parameter param195 = {(({{(8'hb6), (8'ha9)}} ? (+(~|(8'hba))) : (~&((7'h42) * (8'ha4)))) ? (({(8'hbd), (8'hbd)} ? ((8'ha8) ? (8'h9f) : (8'h9e)) : ((8'hab) ? (8'hbf) : (8'hae))) ? {((8'hab) ? (8'hae) : (8'h9c))} : (((8'hb6) ? (7'h44) : (8'ha8)) && ((8'hb6) && (8'h9d)))) : (^~((~&(8'h9d)) ? ((8'hb2) >> (8'ha9)) : ((8'hab) ? (8'hb8) : (8'hb1))))), (({(&(8'hab)), (~|(8'hab))} ? {((8'hab) ? (7'h43) : (8'hbd)), ((8'h9e) ? (8'h9c) : (8'hb5))} : (((8'ha1) ? (8'hba) : (8'had)) ? {(8'hb1), (8'haf)} : ((8'hab) ? (8'ha0) : (8'hb7)))) + ((((8'h9d) ? (8'ha8) : (8'hba)) >>> ((8'hb5) * (8'hb7))) ? (((8'hb5) ~^ (8'ha8)) ^~ ((8'hbd) ? (8'hb0) : (8'hb3))) : (((8'hae) <<< (8'ha5)) | ((7'h42) ? (8'haf) : (8'hb6)))))})
(y, clk, wire167, wire166, wire165, wire164);
  output wire [(32'h13b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire167;
  input wire signed [(4'hd):(1'h0)] wire166;
  input wire [(4'ha):(1'h0)] wire165;
  input wire signed [(4'hd):(1'h0)] wire164;
  wire [(4'hf):(1'h0)] wire194;
  wire [(5'h13):(1'h0)] wire193;
  wire [(5'h15):(1'h0)] wire192;
  wire signed [(2'h2):(1'h0)] wire191;
  wire signed [(5'h15):(1'h0)] wire190;
  wire [(5'h10):(1'h0)] wire189;
  wire [(3'h5):(1'h0)] wire188;
  wire [(5'h14):(1'h0)] wire187;
  wire [(4'hb):(1'h0)] wire186;
  wire signed [(4'ha):(1'h0)] wire185;
  wire signed [(4'hb):(1'h0)] wire181;
  wire [(3'h4):(1'h0)] wire180;
  wire signed [(4'h9):(1'h0)] wire169;
  wire [(2'h2):(1'h0)] wire168;
  reg signed [(5'h10):(1'h0)] reg184 = (1'h0);
  reg [(4'h8):(1'h0)] reg183 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg182 = (1'h0);
  reg [(3'h7):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg178 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg177 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg176 = (1'h0);
  reg [(5'h10):(1'h0)] reg175 = (1'h0);
  reg [(3'h6):(1'h0)] reg174 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg173 = (1'h0);
  reg [(4'h9):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg171 = (1'h0);
  reg [(5'h11):(1'h0)] reg170 = (1'h0);
  assign y = {wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire181,
                 wire180,
                 wire169,
                 wire168,
                 reg184,
                 reg183,
                 reg182,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 (1'h0)};
  assign wire168 = $unsigned((($signed(wire166) | wire164[(2'h3):(2'h3)]) ?
                       wire167 : wire164[(3'h5):(2'h3)]));
  assign wire169 = wire166[(4'hb):(4'h8)];
  always
    @(posedge clk) begin
      if (({$signed(wire165[(2'h2):(1'h0)]),
          {wire165[(4'ha):(3'h6)]}} + wire167[(2'h2):(1'h0)]))
        begin
          reg170 <= ((wire168 == $unsigned((wire164 * wire167))) ?
              wire167[(5'h11):(4'ha)] : (8'had));
          reg171 <= $unsigned(wire169);
          if (((~|$signed((8'hba))) >>> $signed(((+wire164[(1'h1):(1'h0)]) ?
              $unsigned($signed((8'h9f))) : ((wire167 ? wire168 : wire169) ?
                  (&wire166) : (8'hbe))))))
            begin
              reg172 <= $signed(($unsigned((reg171[(4'ha):(2'h3)] ?
                      wire166 : ((8'ha5) ? wire169 : reg170))) ?
                  (~&reg171[(4'h9):(4'h9)]) : $signed(((!(8'hb5)) && wire167[(5'h11):(4'h9)]))));
              reg173 <= ($signed((^((^~reg172) ?
                      wire166 : wire164[(2'h3):(1'h1)]))) ?
                  ((((&reg170) != (-wire165)) ^ (!$unsigned(reg170))) ?
                      $unsigned(wire167) : reg172[(3'h5):(3'h4)]) : $signed($signed((^(8'ha0)))));
            end
          else
            begin
              reg172 <= wire164[(4'hb):(2'h3)];
            end
          reg174 <= $unsigned({reg173, wire169});
        end
      else
        begin
          reg170 <= $unsigned(reg171[(3'h7):(2'h2)]);
          reg171 <= ($signed(reg173) ~^ (reg171[(5'h13):(5'h12)] ?
              reg172[(3'h4):(1'h0)] : wire168));
          reg172 <= (|$signed({$signed((~|reg171))}));
          reg173 <= wire164;
          if ((|wire169))
            begin
              reg174 <= ({$unsigned($signed($signed(reg170)))} ?
                  (+({(reg173 ? wire167 : reg172)} ?
                      ((wire169 ? reg172 : wire169) ?
                          reg174[(3'h4):(3'h4)] : reg172) : (&wire167))) : reg170);
              reg175 <= (7'h40);
              reg176 <= ($signed($unsigned(wire167[(4'he):(3'h6)])) ^ ((|(wire164[(4'hd):(4'hb)] ~^ wire164)) | {($signed(reg171) ?
                      $signed(reg175) : (~|(8'ha8)))}));
              reg177 <= reg172[(2'h2):(1'h0)];
            end
          else
            begin
              reg174 <= (+($signed({reg173, (!(8'hb8))}) && (((reg176 ?
                      wire168 : reg176) ?
                  (reg171 && wire166) : (wire164 ^~ wire164)) > reg176)));
              reg175 <= {wire165[(2'h3):(2'h2)]};
              reg176 <= wire168;
            end
        end
      reg178 <= (&((8'hb2) ?
          (((reg176 ? wire164 : reg170) ?
                  $unsigned(reg170) : (wire165 ? wire165 : (8'ha8))) ?
              $unsigned(wire168) : reg173) : ({$unsigned(reg172),
              (reg173 ? wire164 : (8'hb2))} << (+$signed(wire164)))));
      reg179 <= (|$signed($unsigned(wire169)));
    end
  assign wire180 = (^~(reg171 ~^ ($unsigned((!wire164)) > $signed((~(7'h40))))));
  assign wire181 = (+$unsigned(wire168));
  always
    @(posedge clk) begin
      if ({wire181[(2'h3):(2'h2)],
          ((~{wire180}) ? (!wire180) : (!$unsigned($signed(reg175))))})
        begin
          reg182 <= (wire168 ?
              $signed($signed(((~|(8'hb4)) == reg173[(1'h1):(1'h0)]))) : ((wire165 < wire166) ?
                  $signed($unsigned((8'hb2))) : $unsigned(($unsigned(reg172) & $unsigned((8'ha2))))));
        end
      else
        begin
          reg182 <= $signed(wire164);
        end
      reg183 <= (wire180 + (({$signed((8'hb3)),
          $signed(wire165)} * ((|reg174) * $unsigned((7'h41)))) + reg178[(5'h10):(4'ha)]));
      reg184 <= $unsigned($unsigned($unsigned({$unsigned(wire181),
          $signed(wire165)})));
    end
  assign wire185 = reg172;
  assign wire186 = {reg175, wire164};
  assign wire187 = reg178[(5'h12):(4'ha)];
  assign wire188 = $signed($unsigned(reg176));
  assign wire189 = (+(wire187 * (+(reg179 ?
                       $unsigned(reg179) : ((8'ha2) ? reg179 : wire168)))));
  assign wire190 = reg179[(3'h5):(1'h1)];
  assign wire191 = (!(+(|(-$signed(reg172)))));
  assign wire192 = (&(((|{wire166}) ^~ ((wire164 ? wire166 : (8'hb9)) ?
                       (wire186 ?
                           reg176 : wire166) : wire181)) >> $unsigned((~^$unsigned(wire188)))));
  assign wire193 = (^(+wire168[(1'h1):(1'h1)]));
  assign wire194 = (wire190 ?
                       $signed($signed((-{wire186}))) : ((^{wire192}) >>> $unsigned(reg171[(4'hb):(4'h8)])));
endmodule

module module133
#(parameter param153 = ((((((8'had) >>> (8'h9e)) ? ((8'hb5) ? (8'hac) : (8'hb1)) : (8'ha9)) != ((~|(8'hba)) >= (8'ha7))) | (^(((8'hb1) ^~ (8'haa)) ? ((8'h9f) ? (7'h44) : (8'haf)) : (~&(8'hb5))))) ? ((+(((8'ha0) ? (8'ha6) : (8'hb9)) ? (&(8'hb9)) : ((8'hb2) ? (8'ha5) : (7'h44)))) <<< {((^(8'hbe)) > (~^(7'h44))), ((~|(8'h9c)) ? {(7'h40), (8'hb9)} : {(7'h40), (8'hb3)})}) : ((((-(8'hb9)) ? ((8'ha0) && (8'ha0)) : (~^(8'hb4))) | (^~(|(8'hb0)))) ? (!(^~(8'hb8))) : {{((8'ha3) ? (8'ha1) : (8'h9d)), (-(8'hb8))}})), 
parameter param154 = (~^(param153 - (~^param153))))
(y, clk, wire137, wire136, wire135, wire134);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire137;
  input wire signed [(5'h14):(1'h0)] wire136;
  input wire signed [(4'h9):(1'h0)] wire135;
  input wire signed [(3'h4):(1'h0)] wire134;
  wire signed [(4'h9):(1'h0)] wire152;
  wire [(4'h8):(1'h0)] wire151;
  wire signed [(4'hd):(1'h0)] wire150;
  wire [(4'h8):(1'h0)] wire149;
  wire signed [(5'h12):(1'h0)] wire148;
  wire [(4'h8):(1'h0)] wire147;
  wire signed [(5'h15):(1'h0)] wire146;
  reg signed [(5'h12):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg144 = (1'h0);
  reg [(4'h9):(1'h0)] reg143 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg142 = (1'h0);
  reg [(2'h2):(1'h0)] reg141 = (1'h0);
  reg [(4'h8):(1'h0)] reg140 = (1'h0);
  reg [(5'h12):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg138 = (1'h0);
  assign y = {wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg138 <= $signed($signed($unsigned($unsigned($signed(wire135)))));
      if ({$unsigned((~|(reg138[(3'h5):(2'h2)] >= (|wire136)))),
          (~&({$unsigned(wire134),
              $unsigned(wire135)} < $signed(wire136[(3'h7):(2'h3)])))})
        begin
          if (reg138)
            begin
              reg139 <= ($signed((+($signed(wire135) >>> $signed(wire136)))) ?
                  {(wire134 * {(~|wire134), wire135[(1'h0):(1'h0)]}),
                      $signed(wire135)} : (&(~reg138)));
            end
          else
            begin
              reg139 <= (reg139 > ($unsigned(wire136) ?
                  wire134 : (wire137 >>> (~^$unsigned(wire137)))));
            end
          if (((|($signed(wire135[(2'h2):(2'h2)]) ?
              {$signed(wire137)} : (^$unsigned(wire136)))) == reg138[(3'h5):(1'h1)]))
            begin
              reg140 <= (wire136 ?
                  (($signed($signed(wire137)) * $signed((wire135 ?
                          reg138 : wire134))) ?
                      (wire137[(1'h0):(1'h0)] >> $unsigned($unsigned(wire135))) : {$unsigned((wire135 ?
                              reg138 : wire135))}) : ({(8'hb6)} == ({(wire136 - wire137)} ?
                      reg138 : wire134[(2'h2):(1'h0)])));
              reg141 <= (|{(((reg140 >> wire136) || reg139[(4'ha):(1'h0)]) ?
                      ($signed(reg140) <<< wire136) : reg140)});
              reg142 <= ((wire135[(1'h0):(1'h0)] ^~ ($signed($unsigned((8'haa))) ?
                      $signed(((8'ha5) ? reg141 : (8'h9e))) : reg139)) ?
                  ($unsigned((&{(8'hac)})) - reg141[(1'h0):(1'h0)]) : (wire137 - (8'ha1)));
              reg143 <= $signed($unsigned(reg139[(4'hb):(3'h6)]));
            end
          else
            begin
              reg140 <= wire137;
              reg141 <= ($signed($signed((-$signed(reg142)))) || $unsigned(((wire136 << wire134) ?
                  reg139 : reg143[(3'h7):(1'h0)])));
              reg142 <= ((^~(-{$unsigned(wire134), ((8'haf) >>> (8'hb3))})) ?
                  ((!$unsigned($signed(reg139))) <= $signed((!reg138[(1'h0):(1'h0)]))) : $unsigned(reg138[(3'h5):(2'h2)]));
            end
        end
      else
        begin
          if ($unsigned($unsigned($unsigned(reg140[(2'h3):(1'h1)]))))
            begin
              reg139 <= (reg143[(3'h6):(3'h6)] && $signed(reg141[(2'h2):(1'h1)]));
              reg140 <= (~&$unsigned((!wire137[(1'h1):(1'h1)])));
              reg141 <= reg141;
            end
          else
            begin
              reg139 <= ((!reg140[(3'h5):(1'h1)]) ?
                  ((reg141[(2'h2):(1'h0)] ?
                      (&wire136[(4'he):(4'h8)]) : wire135[(2'h2):(2'h2)]) > (reg143 ^~ $signed($signed(wire136)))) : (reg143[(4'h8):(3'h7)] ?
                      ($signed((~&reg142)) && (~&(reg140 <= wire136))) : $unsigned(((8'hb1) ?
                          wire134 : wire136[(5'h11):(3'h5)]))));
              reg140 <= (8'hbc);
            end
          reg142 <= $unsigned((~|reg138[(2'h3):(2'h3)]));
        end
      reg144 <= $unsigned($signed($signed((reg143 ?
          wire137[(4'ha):(2'h2)] : $unsigned(reg140)))));
      reg145 <= ((-((~reg140[(2'h3):(1'h1)]) ^ reg140)) > ((-(|$unsigned(reg141))) ?
          reg142[(4'h8):(3'h4)] : $signed(((reg144 ? reg141 : reg143) ?
              (reg144 - wire135) : (+reg143)))));
    end
  assign wire146 = {(!$unsigned((8'had))),
                       ($signed((~|reg140)) < reg141[(1'h1):(1'h1)])};
  assign wire147 = (8'hbb);
  assign wire148 = (($signed(reg139) ?
                           ((|(reg142 ? wire137 : wire136)) <= ({reg138} ?
                               (reg140 & reg144) : (reg140 ?
                                   wire135 : wire137))) : (((wire146 && wire146) ?
                                   (wire137 ?
                                       wire136 : reg139) : $signed(wire147)) ?
                               (8'ha0) : (8'ha2))) ?
                       (8'h9c) : $unsigned(($unsigned($signed(reg144)) ?
                           wire147 : ((7'h41) ?
                               $unsigned(reg143) : wire146[(5'h12):(4'he)]))));
  assign wire149 = ({(~&wire146[(3'h5):(3'h5)]), reg142} ?
                       reg143[(3'h4):(2'h3)] : $signed($unsigned($unsigned((8'ha8)))));
  assign wire150 = $unsigned(wire135);
  assign wire151 = (+wire149);
  assign wire152 = $signed(reg144);
endmodule
