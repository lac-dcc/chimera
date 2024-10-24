module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h150):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire273;
  wire signed [(3'h4):(1'h0)] wire272;
  wire signed [(4'ha):(1'h0)] wire271;
  wire signed [(4'ha):(1'h0)] wire270;
  wire signed [(3'h6):(1'h0)] wire259;
  wire [(4'hf):(1'h0)] wire21;
  wire [(4'h9):(1'h0)] wire18;
  wire signed [(5'h11):(1'h0)] wire17;
  wire signed [(3'h4):(1'h0)] wire261;
  wire signed [(5'h11):(1'h0)] wire262;
  wire signed [(3'h5):(1'h0)] wire263;
  wire [(4'he):(1'h0)] wire264;
  wire signed [(3'h4):(1'h0)] wire265;
  wire signed [(2'h2):(1'h0)] wire266;
  wire signed [(4'hd):(1'h0)] wire267;
  wire signed [(4'ha):(1'h0)] wire268;
  reg [(4'hd):(1'h0)] reg5 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  assign y = {wire273,
                 wire272,
                 wire271,
                 wire270,
                 wire259,
                 wire21,
                 wire18,
                 wire17,
                 wire261,
                 wire262,
                 wire263,
                 wire264,
                 wire265,
                 wire266,
                 wire267,
                 wire268,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg19,
                 reg20,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (&({wire3[(4'hf):(2'h3)],
          $unsigned($unsigned(wire2))} ~^ $signed(((wire3 <<< wire1) >>> $unsigned(wire2)))));
      reg6 <= $signed($unsigned((({(8'ha7)} & {wire0}) & {$unsigned((8'hb5))})));
      if (wire3)
        begin
          reg7 <= ((^~(((reg6 >> reg6) + (wire1 >> reg5)) + $signed($signed(reg5)))) >= (+$unsigned(wire1[(4'h8):(3'h7)])));
          if ({($unsigned(wire0[(2'h3):(2'h3)]) & reg6)})
            begin
              reg8 <= reg7;
              reg9 <= (~(-reg7));
              reg10 <= wire1[(4'h8):(3'h6)];
              reg11 <= {wire0, reg8[(3'h4):(1'h0)]};
            end
          else
            begin
              reg8 <= ($signed((($signed((8'ha6)) - {reg8, (7'h43)}) ?
                  reg8 : ($signed(wire0) ?
                      (reg7 - reg8) : reg6))) >>> ($signed(reg6) + reg11));
              reg9 <= ((&{(!(reg5 ~^ reg6)), (8'hba)}) ?
                  reg5[(1'h1):(1'h0)] : {reg11[(4'he):(2'h3)],
                      $unsigned($signed((+(8'hb3))))});
            end
          reg12 <= ((&(8'ha5)) * (8'ha8));
        end
      else
        begin
          reg7 <= reg9;
          reg8 <= $signed(reg10[(1'h1):(1'h0)]);
          reg9 <= $unsigned((($signed($signed(wire0)) ?
                  (|wire3[(4'hf):(4'hc)]) : $unsigned((reg11 & wire1))) ?
              reg7 : (~$unsigned(((8'h9d) ? wire0 : wire3)))));
          reg10 <= reg12[(2'h2):(1'h1)];
        end
      if ($signed($signed($signed(wire4))))
        begin
          reg13 <= {reg8[(2'h3):(2'h2)], {reg8[(4'hb):(3'h4)]}};
          reg14 <= ($unsigned($signed($signed({reg9,
              reg10}))) * $unsigned(wire0));
          reg15 <= {wire4, (reg9 | (!({reg7} ? {(8'ha9)} : $signed(reg12))))};
          reg16 <= $unsigned($signed(reg14[(3'h5):(3'h5)]));
        end
      else
        begin
          reg13 <= (8'ha4);
          reg14 <= (+(+$signed((reg6[(1'h0):(1'h0)] != (~|reg5)))));
          reg15 <= {($unsigned(reg15) ?
                  $signed($signed($unsigned(reg11))) : ($signed((wire4 > wire0)) >= $unsigned($signed(reg8))))};
          reg16 <= {$signed($unsigned(((~&reg12) ? $signed(reg14) : (8'ha9)))),
              ($unsigned(reg7) ?
                  (~^reg7[(1'h1):(1'h1)]) : (~((reg8 > (8'ha8)) >> (reg8 ?
                      reg12 : reg13))))};
        end
    end
  assign wire17 = {wire0[(2'h2):(1'h0)],
                      ($signed((~&$unsigned((8'hb6)))) < wire3)};
  assign wire18 = reg5;
  always
    @(posedge clk) begin
      reg19 <= (~^{{reg9[(2'h3):(2'h3)]}, (!(~|{(8'had), (8'h9d)}))});
      reg20 <= ($unsigned((reg5 || {(wire4 && wire4)})) > $unsigned((-{(8'ha5)})));
    end
  assign wire21 = reg10;
  module22 #() modinst260 (wire259, clk, reg9, reg6, reg5, wire0);
  assign wire261 = $signed(((-(^~$unsigned(reg15))) == wire21));
  assign wire262 = wire261;
  assign wire263 = wire259[(3'h5):(2'h2)];
  assign wire264 = (~&reg20[(2'h3):(2'h3)]);
  assign wire265 = $signed((+($signed(wire264) ? wire18 : $unsigned((!reg7)))));
  assign wire266 = {((((!(8'hb6)) ? $unsigned(reg6) : $signed(reg16)) ?
                               ($signed(reg16) ?
                                   (reg13 ?
                                       (8'hba) : wire21) : $unsigned((8'h9f))) : ($signed(wire263) | $signed(reg9))) ?
                           {wire17, reg6} : reg16)};
  assign wire267 = (-(reg11 ?
                       {(wire262 ? (reg6 && reg11) : reg19[(4'h9):(1'h1)]),
                           ((wire263 ? wire0 : reg15) ?
                               (~|(8'hb2)) : $unsigned(wire1))} : $unsigned(({reg20} < wire262))));
  module30 #() modinst269 (wire268, clk, reg7, wire18, reg20, reg15, reg9);
  assign wire270 = wire4[(4'ha):(3'h4)];
  assign wire271 = ((~|reg16) ?
                       $unsigned(({wire266[(2'h2):(1'h1)]} ^~ (reg8[(2'h2):(1'h0)] > $signed(reg16)))) : reg10[(3'h4):(1'h1)]);
  assign wire272 = $unsigned(reg7);
  assign wire273 = $signed(((~&((reg5 || wire263) - $signed(reg14))) > ($signed((~&reg10)) != $signed(reg9))));
endmodule

module module22  (y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h1b1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire26;
  input wire [(4'h8):(1'h0)] wire25;
  input wire signed [(4'hd):(1'h0)] wire24;
  input wire signed [(5'h15):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire258;
  wire signed [(5'h11):(1'h0)] wire256;
  wire signed [(4'hf):(1'h0)] wire255;
  wire [(3'h5):(1'h0)] wire254;
  wire [(5'h13):(1'h0)] wire253;
  wire signed [(5'h14):(1'h0)] wire251;
  wire signed [(5'h12):(1'h0)] wire124;
  wire [(3'h6):(1'h0)] wire88;
  wire [(4'he):(1'h0)] wire42;
  wire signed [(4'hc):(1'h0)] wire29;
  wire signed [(4'h9):(1'h0)] wire28;
  wire signed [(5'h14):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire44;
  wire signed [(3'h6):(1'h0)] wire45;
  wire signed [(3'h7):(1'h0)] wire86;
  wire signed [(3'h4):(1'h0)] wire126;
  wire [(3'h7):(1'h0)] wire174;
  reg signed [(5'h11):(1'h0)] reg46 = (1'h0);
  reg [(5'h15):(1'h0)] reg47 = (1'h0);
  reg [(3'h7):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  reg [(5'h12):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg54 = (1'h0);
  reg [(2'h3):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg57 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg59 = (1'h0);
  reg [(4'hd):(1'h0)] reg60 = (1'h0);
  assign y = {wire258,
                 wire256,
                 wire255,
                 wire254,
                 wire253,
                 wire251,
                 wire124,
                 wire88,
                 wire42,
                 wire29,
                 wire28,
                 wire27,
                 wire44,
                 wire45,
                 wire86,
                 wire126,
                 wire174,
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
                 (1'h0)};
  assign wire27 = $signed($unsigned(wire26));
  assign wire28 = {$unsigned(wire25[(2'h3):(2'h2)])};
  assign wire29 = {($signed((7'h44)) <<< $unsigned($unsigned({wire24,
                          wire23}))),
                      ((~(~wire25)) ?
                          $unsigned($signed((~^wire23))) : $signed((~^$signed(wire27))))};
  module30 #() modinst43 (wire42, clk, wire25, wire27, wire23, wire26, wire24);
  assign wire44 = ($signed(((wire26 + ((7'h42) && wire27)) <= $signed((wire29 ?
                          wire25 : wire23)))) ?
                      $unsigned((wire42 * (~&((8'ha5) ?
                          wire26 : wire24)))) : ((8'hb9) ?
                          wire27[(3'h7):(3'h5)] : (~^wire42[(4'h9):(3'h4)])));
  assign wire45 = wire29;
  always
    @(posedge clk) begin
      reg46 <= wire25[(2'h2):(2'h2)];
      reg47 <= wire29;
      reg48 <= (wire42 & reg47[(3'h6):(3'h5)]);
      reg49 <= $unsigned((wire29 <= {$unsigned($unsigned(wire24)), wire29}));
    end
  always
    @(posedge clk) begin
      reg50 <= reg49;
      reg51 <= $unsigned(reg47[(3'h4):(1'h0)]);
      if ($signed($signed($signed(((wire26 >= reg49) ^~ reg51[(5'h10):(4'h9)])))))
        begin
          reg52 <= (&wire27[(4'hb):(3'h6)]);
          reg53 <= wire26;
          reg54 <= ((wire23 >= (~wire28[(4'h9):(4'h8)])) ?
              (($signed((reg52 ? wire25 : reg49)) ?
                      (wire28[(1'h0):(1'h0)] ?
                          $unsigned(wire26) : $signed(reg52)) : wire25[(1'h0):(1'h0)]) ?
                  $unsigned($signed((reg52 ?
                      (8'h9d) : reg48))) : wire24) : $unsigned({(|$signed(wire28))}));
          reg55 <= ($unsigned((wire45[(2'h2):(1'h1)] ?
                  $unsigned(reg49) : wire27[(5'h12):(2'h3)])) ?
              (reg54[(5'h10):(4'he)] ?
                  ($signed($signed(reg46)) ?
                      $signed(reg47) : wire24) : reg47) : $signed({(~&$signed(wire28)),
                  wire24}));
          reg56 <= $unsigned((|(|$signed((wire28 && reg49)))));
        end
      else
        begin
          reg52 <= (wire27 ? wire23[(1'h1):(1'h1)] : wire45[(3'h5):(1'h0)]);
          if (reg48)
            begin
              reg53 <= $unsigned($unsigned((~^((!wire23) ?
                  reg51[(2'h3):(1'h1)] : (reg51 ? wire27 : wire23)))));
              reg54 <= (reg54[(3'h5):(2'h2)] | ($signed((~wire44[(4'h9):(3'h6)])) | (~|(reg53 ~^ $unsigned((8'hac))))));
            end
          else
            begin
              reg53 <= reg49;
              reg54 <= {(reg54[(4'h8):(2'h3)] ?
                      ({$signed(reg50),
                          reg48[(2'h3):(2'h3)]} ^ wire27[(5'h10):(3'h5)]) : reg54),
                  {($signed($unsigned(wire42)) ?
                          reg56 : ($unsigned(reg56) >>> {wire23, wire28}))}};
              reg55 <= ($signed(({$signed(wire23),
                  reg50[(2'h3):(2'h3)]} ~^ reg50[(1'h1):(1'h1)])) || $signed(reg47));
              reg56 <= $unsigned((!(reg52 && reg51)));
            end
          reg57 <= reg46;
          reg58 <= wire24;
        end
      reg59 <= ({$signed((wire29 ? {wire42, reg53} : $unsigned(wire24)))} ?
          ((-($unsigned(reg46) ~^ (wire42 ?
              reg47 : reg48))) + ($signed((!reg58)) < ($signed(reg51) ?
              (^~wire27) : (wire44 ~^ reg52)))) : $signed((~^($unsigned(reg49) ?
              (reg53 >> reg58) : reg54))));
      reg60 <= wire42;
    end
  module61 #() modinst87 (wire86, clk, reg51, reg59, reg47, wire27);
  assign wire88 = $unsigned(wire28[(3'h6):(3'h6)]);
  module89 #() modinst125 (wire124, clk, reg54, reg47, reg52, wire23);
  assign wire126 = (~|(reg59[(3'h5):(1'h1)] ?
                       ((wire42[(3'h6):(2'h2)] ?
                           (reg59 - reg49) : $unsigned(reg56)) | {(reg48 ?
                               reg47 : reg47),
                           reg54[(3'h7):(2'h2)]}) : reg55));
  module127 #() modinst175 (.wire131(wire28), .clk(clk), .wire129(reg58), .wire130(reg59), .wire128(reg46), .y(wire174));
  module176 #() modinst252 (.wire180(wire27), .clk(clk), .wire178(reg46), .y(wire251), .wire179(reg54), .wire177(wire25));
  assign wire253 = (reg50 ? wire126 : reg57[(4'hd):(4'h9)]);
  assign wire254 = {(+$unsigned($unsigned((wire27 == wire42)))),
                       $signed(({(reg49 >> wire253),
                           wire27} >>> (wire253[(4'ha):(2'h3)] <= $signed(wire174))))};
  assign wire255 = {$signed(reg47[(5'h15):(4'hc)])};
  module176 #() modinst257 (wire256, clk, reg46, wire44, reg52, wire26);
  assign wire258 = reg59;
endmodule

module module176  (y, clk, wire180, wire179, wire178, wire177);
  output wire [(32'h31b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire180;
  input wire signed [(4'hb):(1'h0)] wire179;
  input wire [(4'hd):(1'h0)] wire178;
  input wire signed [(4'h8):(1'h0)] wire177;
  wire [(5'h15):(1'h0)] wire250;
  wire [(4'h9):(1'h0)] wire249;
  wire [(2'h3):(1'h0)] wire248;
  wire signed [(4'hc):(1'h0)] wire238;
  wire signed [(4'ha):(1'h0)] wire237;
  wire signed [(2'h2):(1'h0)] wire236;
  wire [(3'h7):(1'h0)] wire235;
  wire [(5'h10):(1'h0)] wire234;
  wire signed [(4'hc):(1'h0)] wire233;
  wire signed [(5'h13):(1'h0)] wire232;
  wire [(3'h7):(1'h0)] wire215;
  wire [(2'h2):(1'h0)] wire214;
  wire signed [(5'h11):(1'h0)] wire213;
  wire [(2'h2):(1'h0)] wire212;
  wire [(5'h10):(1'h0)] wire207;
  wire signed [(4'ha):(1'h0)] wire183;
  wire [(3'h4):(1'h0)] wire182;
  wire signed [(4'hb):(1'h0)] wire181;
  reg signed [(4'hc):(1'h0)] reg247 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg246 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg245 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg244 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg243 = (1'h0);
  reg [(4'hc):(1'h0)] reg242 = (1'h0);
  reg [(4'hb):(1'h0)] reg241 = (1'h0);
  reg [(4'he):(1'h0)] reg240 = (1'h0);
  reg [(4'hd):(1'h0)] reg239 = (1'h0);
  reg [(4'h9):(1'h0)] reg231 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg230 = (1'h0);
  reg [(4'he):(1'h0)] reg229 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg228 = (1'h0);
  reg [(2'h3):(1'h0)] reg227 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg226 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg225 = (1'h0);
  reg [(5'h11):(1'h0)] reg224 = (1'h0);
  reg [(4'hd):(1'h0)] reg223 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg222 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg221 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg220 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg219 = (1'h0);
  reg [(3'h4):(1'h0)] reg218 = (1'h0);
  reg [(3'h6):(1'h0)] reg217 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg216 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg211 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg210 = (1'h0);
  reg [(4'hb):(1'h0)] reg209 = (1'h0);
  reg [(3'h6):(1'h0)] reg208 = (1'h0);
  reg [(3'h4):(1'h0)] reg206 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg205 = (1'h0);
  reg [(4'h9):(1'h0)] reg204 = (1'h0);
  reg [(4'hb):(1'h0)] reg203 = (1'h0);
  reg [(5'h15):(1'h0)] reg202 = (1'h0);
  reg [(3'h6):(1'h0)] reg201 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg200 = (1'h0);
  reg [(3'h5):(1'h0)] reg199 = (1'h0);
  reg [(4'h8):(1'h0)] reg198 = (1'h0);
  reg [(4'hc):(1'h0)] reg197 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg196 = (1'h0);
  reg [(4'h8):(1'h0)] reg195 = (1'h0);
  reg [(3'h4):(1'h0)] reg194 = (1'h0);
  reg [(5'h10):(1'h0)] reg193 = (1'h0);
  reg [(5'h12):(1'h0)] reg192 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg191 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg190 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg189 = (1'h0);
  reg signed [(4'he):(1'h0)] reg188 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg187 = (1'h0);
  reg [(5'h14):(1'h0)] reg186 = (1'h0);
  reg [(5'h13):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg184 = (1'h0);
  assign y = {wire250,
                 wire249,
                 wire248,
                 wire238,
                 wire237,
                 wire236,
                 wire235,
                 wire234,
                 wire233,
                 wire232,
                 wire215,
                 wire214,
                 wire213,
                 wire212,
                 wire207,
                 wire183,
                 wire182,
                 wire181,
                 reg247,
                 reg246,
                 reg245,
                 reg244,
                 reg243,
                 reg242,
                 reg241,
                 reg240,
                 reg239,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 (1'h0)};
  assign wire181 = ({wire177} << $signed(wire180));
  assign wire182 = wire178;
  assign wire183 = $signed({wire181[(3'h6):(2'h3)]});
  always
    @(posedge clk) begin
      reg184 <= ($unsigned(wire182) ?
          $signed((^wire179[(3'h4):(2'h2)])) : wire182[(2'h2):(1'h1)]);
      reg185 <= (~reg184);
      if ({wire182[(3'h4):(3'h4)]})
        begin
          if (($unsigned({$signed(wire177),
              (wire182 ?
                  $unsigned(wire178) : (wire178 ?
                      wire183 : wire180))}) >>> ((wire182[(1'h0):(1'h0)] > reg184) ?
              wire177[(2'h3):(1'h1)] : (wire180[(2'h3):(2'h3)] ?
                  wire178[(3'h4):(2'h3)] : reg185))))
            begin
              reg186 <= ((!{((&wire183) ?
                      {(8'h9d)} : reg184)}) > (wire183[(3'h4):(3'h4)] ?
                  {({(8'ha1)} >> ((8'ha4) ? wire177 : wire177)),
                      ((wire181 > wire177) ?
                          wire182 : {wire181,
                              (7'h42)})} : {{wire183[(1'h1):(1'h1)]}}));
            end
          else
            begin
              reg186 <= $signed($unsigned(($signed(reg184[(5'h14):(4'ha)]) ?
                  $unsigned({reg186}) : ($signed((8'hb8)) - ((8'hb2) ^~ reg185)))));
              reg187 <= wire181[(4'h8):(4'h8)];
              reg188 <= {((~|(~^reg185[(2'h2):(1'h0)])) ?
                      $signed(reg184) : (reg186[(5'h10):(2'h2)] + ({reg184} < (-reg185))))};
              reg189 <= wire183;
            end
          if ((~&$unsigned({$signed((reg187 & reg187))})))
            begin
              reg190 <= $unsigned({$unsigned($signed((wire178 ?
                      reg186 : wire178))),
                  {((8'had) ? wire177[(3'h6):(2'h3)] : $unsigned(wire183)),
                      (wire179 ? wire183 : $unsigned((7'h43)))}});
              reg191 <= $signed($unsigned(($unsigned(reg185[(5'h11):(4'hd)]) ?
                  reg184 : wire177)));
              reg192 <= {reg191, reg188};
              reg193 <= reg191;
              reg194 <= (8'hb9);
            end
          else
            begin
              reg190 <= (^$unsigned((8'hb8)));
              reg191 <= (^$signed($signed($unsigned($unsigned(wire177)))));
            end
          reg195 <= $unsigned((^(wire179[(4'h9):(1'h0)] ?
              (+(reg187 ? reg194 : wire179)) : ($signed(reg194) ?
                  $signed(wire178) : (wire179 <<< wire177)))));
          if ((~^(({$unsigned((8'hb3)),
                  reg194[(1'h1):(1'h1)]} && reg189[(3'h6):(1'h1)]) ?
              $signed({reg189, (~&reg192)}) : reg191)))
            begin
              reg196 <= ((-{$unsigned((reg184 ^ (8'ha6)))}) >>> $signed(wire179[(2'h3):(2'h3)]));
              reg197 <= reg193;
              reg198 <= $unsigned((^(((^reg188) ?
                  reg192 : wire183) <= ($unsigned(wire183) ?
                  wire179[(3'h5):(2'h2)] : (^wire177)))));
              reg199 <= (reg190[(3'h5):(3'h5)] ?
                  ((8'h9c) ?
                      ((-(8'hb5)) ?
                          (8'hb3) : (~&$unsigned(reg195))) : ((|(reg197 ?
                              wire180 : (8'ha5))) ?
                          reg192 : (+reg198))) : reg194[(3'h4):(1'h0)]);
            end
          else
            begin
              reg196 <= $signed((reg199[(2'h2):(1'h1)] || $unsigned((reg190 ?
                  wire180 : (wire183 ? reg199 : reg191)))));
              reg197 <= {$signed($signed(wire182)), wire182[(3'h4):(1'h0)]};
              reg198 <= reg199;
              reg199 <= reg189;
            end
        end
      else
        begin
          reg186 <= (~^$unsigned($signed((-(wire179 & wire181)))));
          if (($signed((~|reg186)) == $signed((reg187 && (&(reg193 <<< reg194))))))
            begin
              reg187 <= reg193;
            end
          else
            begin
              reg187 <= $unsigned((^reg196));
              reg188 <= (-(8'hac));
              reg189 <= $signed($unsigned(wire178[(3'h6):(2'h2)]));
              reg190 <= $unsigned((~|reg190[(1'h1):(1'h0)]));
              reg191 <= $unsigned(reg193);
            end
          reg192 <= reg190;
          reg193 <= $signed(wire180[(1'h0):(1'h0)]);
          reg194 <= $signed(reg193[(4'ha):(3'h7)]);
        end
      if ({wire178, ((~|(^~(+reg188))) + $signed(reg184))})
        begin
          reg200 <= (^~reg195);
        end
      else
        begin
          reg200 <= ($signed(($unsigned((~&wire182)) <<< wire183[(4'h8):(3'h5)])) != $signed({({wire180,
                  wire181} != (wire177 ~^ reg195))}));
          if (reg190)
            begin
              reg201 <= (reg200 & (^~$unsigned($unsigned((reg189 <<< reg194)))));
              reg202 <= reg193[(4'hb):(4'hb)];
              reg203 <= ({$unsigned({$signed(reg187), wire179}),
                  (reg192 ?
                      ((reg201 ? reg197 : reg187) ?
                          {reg202} : reg201) : reg189)} < $unsigned($signed(($unsigned(reg202) ?
                  (~^reg195) : $unsigned(reg196)))));
              reg204 <= (((reg201 < $unsigned(reg198[(2'h2):(1'h0)])) << (|$unsigned($signed((8'had))))) ?
                  wire181[(2'h2):(1'h1)] : (8'h9e));
            end
          else
            begin
              reg201 <= (reg196 ?
                  (reg197[(2'h3):(2'h3)] == $unsigned((reg198 ?
                      reg190[(2'h2):(2'h2)] : $signed(reg185)))) : (reg189 ?
                      wire182 : $unsigned($unsigned((+wire177)))));
            end
          reg205 <= ($unsigned((-$unsigned(((8'hb2) * (8'haf))))) - $unsigned($signed($signed((wire177 ?
              reg187 : wire178)))));
        end
      reg206 <= ($unsigned(wire179) >= $signed($signed({(reg184 ?
              reg196 : reg184)})));
    end
  assign wire207 = reg196;
  always
    @(posedge clk) begin
      reg208 <= $unsigned($signed($unsigned($signed((^~reg194)))));
      reg209 <= ($signed(wire207) >>> reg199);
      reg210 <= reg188[(3'h4):(1'h1)];
      reg211 <= reg205[(4'hc):(1'h1)];
    end
  assign wire212 = reg203;
  assign wire213 = wire207[(5'h10):(4'hd)];
  assign wire214 = (8'hae);
  assign wire215 = reg191[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      reg216 <= wire213;
      if ($unsigned(($unsigned($unsigned((reg190 ? reg186 : (8'ha9)))) ?
          (-((wire213 ? reg211 : wire178) ?
              $signed(wire182) : reg190[(2'h3):(1'h0)])) : reg199[(3'h5):(2'h3)])))
        begin
          reg217 <= (({$signed(reg196[(4'hd):(4'hb)])} > reg198[(3'h7):(3'h6)]) ?
              reg200 : ((!{(^~reg190)}) == (^~wire180)));
          reg218 <= reg203;
          if ($signed((+reg209[(2'h2):(2'h2)])))
            begin
              reg219 <= $unsigned(($signed($signed((+wire215))) < $signed(($unsigned(reg204) != (reg210 ?
                  reg205 : reg196)))));
              reg220 <= (|(^{{(!reg190), $unsigned(wire215)}}));
              reg221 <= (reg219 & reg198);
              reg222 <= $signed((|reg211));
              reg223 <= $unsigned(((|($signed(wire180) ?
                      (8'ha9) : $unsigned(reg204))) ?
                  reg220 : reg201));
            end
          else
            begin
              reg219 <= $unsigned((reg203[(4'h9):(2'h3)] ^ {(((8'hb3) >> reg203) > wire215),
                  ((reg202 - reg194) & reg199)}));
            end
          reg224 <= $signed($unsigned(($unsigned($unsigned(reg202)) ?
              reg191[(2'h3):(2'h2)] : (wire207[(2'h2):(1'h1)] ?
                  (~reg187) : (&reg202)))));
          if (($unsigned(({(wire212 << reg199)} ?
              reg219 : $unsigned(reg186[(3'h4):(1'h0)]))) + reg211[(4'ha):(3'h5)]))
            begin
              reg225 <= $unsigned($signed(wire181[(4'hb):(4'h9)]));
            end
          else
            begin
              reg225 <= reg195;
              reg226 <= {$signed(reg205)};
              reg227 <= (~^$signed($signed(wire215)));
              reg228 <= reg195;
              reg229 <= $signed(reg187[(4'hf):(4'h8)]);
            end
        end
      else
        begin
          reg217 <= $signed($unsigned($unsigned(($unsigned((8'h9e)) ?
              (reg185 || reg185) : $unsigned(wire181)))));
          if (reg187[(4'ha):(4'h9)])
            begin
              reg218 <= reg190[(4'h8):(4'h8)];
              reg219 <= reg221[(5'h13):(2'h2)];
              reg220 <= (reg189 >> wire212[(1'h0):(1'h0)]);
              reg221 <= ({(wire179 ?
                      ({reg184,
                          (7'h44)} <= reg198) : $unsigned(reg229))} >>> $unsigned({wire212[(1'h1):(1'h0)]}));
              reg222 <= reg196[(1'h1):(1'h1)];
            end
          else
            begin
              reg218 <= $unsigned((|(|((reg192 ?
                  reg217 : (8'h9c)) << {(8'ha3)}))));
              reg219 <= $unsigned((~&($unsigned((^~reg187)) || $signed((+reg217)))));
              reg220 <= (($unsigned({(^reg193), $unsigned(reg210)}) ?
                      reg203[(4'hb):(2'h2)] : reg227) ?
                  (~|wire214[(1'h0):(1'h0)]) : reg216[(4'ha):(1'h1)]);
              reg221 <= reg199;
            end
          reg223 <= $unsigned((reg216 ?
              ($signed($signed(reg191)) || $unsigned((8'hb2))) : {(~|reg220[(3'h5):(2'h3)])}));
        end
      reg230 <= ((reg189[(1'h0):(1'h0)] ?
              $signed(wire213[(5'h11):(4'hc)]) : reg208[(1'h1):(1'h1)]) ?
          $unsigned((&(|$unsigned(reg196)))) : $signed(($unsigned(wire182[(1'h0):(1'h0)]) <= (~^(+(8'hb6))))));
      reg231 <= (($unsigned($unsigned($signed(reg188))) ?
          {((reg193 ? reg220 : reg230) ^ (~|(8'ha8))),
              {reg210}} : wire215[(1'h0):(1'h0)]) & $signed($unsigned($signed((~reg217)))));
    end
  assign wire232 = {($unsigned($signed({reg216,
                           reg192})) >>> ($unsigned((^reg201)) ?
                           $signed($unsigned(reg230)) : ({(8'h9f),
                               reg197} >> reg220[(2'h2):(2'h2)]))),
                       {wire182[(2'h2):(1'h0)],
                           $unsigned($unsigned((^reg230)))}};
  assign wire233 = reg196;
  assign wire234 = wire179[(2'h3):(2'h3)];
  assign wire235 = (^~$unsigned($signed(wire177)));
  assign wire236 = $signed($signed(reg185[(5'h11):(4'hd)]));
  assign wire237 = reg188;
  assign wire238 = {$unsigned(reg189[(2'h3):(2'h2)]), reg216};
  always
    @(posedge clk) begin
      reg239 <= (({reg211} ?
          {(~&reg210[(1'h1):(1'h0)])} : {reg226,
              ($unsigned(wire207) != (8'ha1))}) >> (reg208 * reg185));
      if (((~$unsigned($unsigned((&wire232)))) << reg196[(4'he):(4'he)]))
        begin
          reg240 <= wire235[(2'h3):(1'h1)];
        end
      else
        begin
          reg240 <= $unsigned($unsigned($unsigned((8'hb2))));
          reg241 <= wire179;
          reg242 <= (8'h9f);
          if (reg193[(3'h6):(3'h6)])
            begin
              reg243 <= reg224[(5'h10):(3'h4)];
              reg244 <= (~^reg242[(3'h7):(1'h1)]);
            end
          else
            begin
              reg243 <= $unsigned((reg222 | reg227));
              reg244 <= wire235;
            end
          reg245 <= $signed(wire212);
        end
      reg246 <= (((+(^~(reg219 ? reg203 : wire180))) ?
          $unsigned($unsigned((~^(7'h42)))) : $signed((reg222[(2'h2):(2'h2)] != (~^reg209)))) ^ (~((8'h9e) ?
          ((reg193 - reg198) <= reg231[(4'h8):(2'h3)]) : $signed((reg201 ?
              wire232 : wire181)))));
      reg247 <= (~&(~(^((reg205 ? reg243 : wire234) ? (^wire179) : wire214))));
    end
  assign wire248 = {reg200,
                       (reg193[(4'hf):(4'h8)] ?
                           (((reg201 >>> wire233) * $unsigned(reg204)) ?
                               $unsigned((^~reg190)) : $unsigned((~|reg218))) : (~^((^reg193) ^ reg227)))};
  assign wire249 = $signed((~|wire212[(1'h0):(1'h0)]));
  assign wire250 = {reg198};
endmodule

module module127
#(parameter param172 = ((({(8'hba), ((8'ha1) << (8'hbe))} ? (((8'hbd) ? (8'had) : (8'hbb)) | (!(8'ha7))) : (((8'hbc) ? (8'hb2) : (8'ha4)) ? {(8'hb9), (8'hb0)} : {(8'hba), (8'ha6)})) ? {{((8'hab) + (8'hbc)), (^~(8'had))}} : (7'h41)) > (((~^(&(8'hb9))) != ({(8'hb4), (8'ha8)} - (~&(8'hae)))) - {(((8'ha4) * (8'ha2)) ? {(7'h43), (7'h43)} : ((7'h42) ? (8'h9f) : (8'hbf)))})), 
parameter param173 = (((({param172, param172} & {param172}) != ((param172 ? param172 : (8'hb8)) ? (param172 ? param172 : param172) : (param172 - param172))) < (param172 || {(param172 ? param172 : param172), ((8'hb5) ? param172 : (8'hb7))})) ? ((({param172} << (param172 ? param172 : param172)) + (param172 ? param172 : {(8'hbb), param172})) * (((param172 + param172) ? (param172 ? param172 : param172) : (param172 ~^ param172)) ? (param172 ? (param172 << param172) : (7'h41)) : (param172 ? {param172} : (param172 || param172)))) : param172))
(y, clk, wire131, wire130, wire129, wire128);
  output wire [(32'h1bb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire131;
  input wire [(4'ha):(1'h0)] wire130;
  input wire signed [(4'hb):(1'h0)] wire129;
  input wire signed [(5'h11):(1'h0)] wire128;
  wire [(5'h12):(1'h0)] wire169;
  wire signed [(5'h13):(1'h0)] wire145;
  wire [(3'h5):(1'h0)] wire144;
  wire signed [(5'h15):(1'h0)] wire139;
  wire [(3'h4):(1'h0)] wire138;
  wire [(4'hb):(1'h0)] wire137;
  wire [(5'h15):(1'h0)] wire136;
  wire signed [(4'ha):(1'h0)] wire135;
  wire [(5'h15):(1'h0)] wire134;
  wire signed [(4'h9):(1'h0)] wire133;
  wire signed [(5'h12):(1'h0)] wire132;
  reg [(4'hf):(1'h0)] reg171 = (1'h0);
  reg [(4'hb):(1'h0)] reg170 = (1'h0);
  reg [(4'ha):(1'h0)] reg168 = (1'h0);
  reg [(4'hd):(1'h0)] reg167 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg166 = (1'h0);
  reg [(4'hd):(1'h0)] reg165 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg164 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg163 = (1'h0);
  reg [(3'h4):(1'h0)] reg162 = (1'h0);
  reg [(4'he):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg160 = (1'h0);
  reg [(4'he):(1'h0)] reg159 = (1'h0);
  reg [(3'h7):(1'h0)] reg158 = (1'h0);
  reg [(4'hd):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg156 = (1'h0);
  reg [(4'hb):(1'h0)] reg155 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg153 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg152 = (1'h0);
  reg [(4'h9):(1'h0)] reg151 = (1'h0);
  reg [(4'h9):(1'h0)] reg150 = (1'h0);
  reg [(4'ha):(1'h0)] reg149 = (1'h0);
  reg [(2'h2):(1'h0)] reg148 = (1'h0);
  reg [(5'h11):(1'h0)] reg147 = (1'h0);
  reg [(2'h3):(1'h0)] reg146 = (1'h0);
  reg [(3'h6):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg142 = (1'h0);
  reg [(4'hd):(1'h0)] reg141 = (1'h0);
  reg [(4'ha):(1'h0)] reg140 = (1'h0);
  assign y = {wire169,
                 wire145,
                 wire144,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 reg171,
                 reg170,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 (1'h0)};
  assign wire132 = $unsigned(wire129[(1'h1):(1'h0)]);
  assign wire133 = ($unsigned($signed(wire131[(3'h4):(3'h4)])) <= {wire130,
                       $signed(wire131)});
  assign wire134 = $signed($signed(((+wire131[(1'h0):(1'h0)]) ^~ wire129[(2'h2):(2'h2)])));
  assign wire135 = $signed((&(((^~(8'hbc)) ? wire130[(3'h5):(2'h2)] : (8'hba)) ?
                       ($unsigned(wire133) ?
                           {wire134, wire131} : wire134) : (8'hbf))));
  assign wire136 = $signed((-(wire132[(4'hd):(3'h7)] ?
                       {wire135} : (wire131 ? $unsigned(wire132) : wire134))));
  assign wire137 = (~&wire132[(5'h12):(4'hf)]);
  assign wire138 = $signed({wire129});
  assign wire139 = (~wire137);
  always
    @(posedge clk) begin
      reg140 <= wire138[(1'h0):(1'h0)];
      reg141 <= $signed((&wire131[(3'h5):(2'h2)]));
      reg142 <= $signed((($signed(wire135) ?
          {(~^wire132)} : (reg141 >> (wire136 >>> wire132))) + $signed($signed($signed(wire130)))));
      reg143 <= (wire131[(3'h5):(2'h2)] ?
          reg140[(2'h3):(2'h2)] : {wire130,
              ($signed(wire138) ?
                  (reg140 != (wire131 ?
                      wire134 : wire135)) : wire130[(3'h7):(3'h7)])});
    end
  assign wire144 = reg140;
  assign wire145 = (+reg140[(3'h4):(3'h4)]);
  always
    @(posedge clk) begin
      reg146 <= {wire136,
          (wire134[(4'hf):(4'hf)] ?
              (8'hb8) : ((wire136 != (wire134 ?
                  wire128 : wire129)) ^ wire135[(2'h3):(1'h1)]))};
      if ((reg141 ?
          reg142 : (~(({wire144} - (wire139 == wire130)) + ({wire135} << (wire144 != wire145))))))
        begin
          if ({(~^reg142), $signed(wire130)})
            begin
              reg147 <= (wire139 || $unsigned((({wire134,
                      wire129} >= wire130[(4'ha):(1'h0)]) ?
                  ($signed(wire138) << wire139) : wire131[(1'h1):(1'h1)])));
              reg148 <= (&reg147[(4'h8):(3'h4)]);
              reg149 <= (-$unsigned(wire144[(3'h5):(3'h5)]));
              reg150 <= ($unsigned({$unsigned(wire145[(5'h12):(5'h11)])}) ?
                  reg140 : (+$signed((~&(reg147 ? reg149 : wire130)))));
              reg151 <= $signed((wire139[(1'h0):(1'h0)] - $signed($signed((wire135 * (8'hbe))))));
            end
          else
            begin
              reg147 <= $unsigned(wire137[(3'h4):(1'h0)]);
            end
          if ($unsigned($signed($signed(((reg147 ? (8'hae) : wire134) ?
              reg146 : $unsigned(reg151))))))
            begin
              reg152 <= {(!($signed(reg147[(4'hd):(4'hd)]) ?
                      ((reg141 <<< reg140) ?
                          {(8'h9c)} : $unsigned(wire132)) : $signed(wire129)))};
            end
          else
            begin
              reg152 <= $unsigned({reg152[(1'h1):(1'h0)]});
              reg153 <= $unsigned((reg148 ^ ({$signed(wire128), wire138} ?
                  (~reg143[(3'h4):(3'h4)]) : wire130)));
              reg154 <= (~&((~|$unsigned((wire128 * reg149))) >> (($signed((8'hae)) * wire130) ?
                  (reg151[(2'h3):(1'h0)] <= (wire137 ?
                      wire145 : wire135)) : (wire133[(3'h4):(3'h4)] || (^wire139)))));
              reg155 <= wire132;
            end
          reg156 <= (+reg149[(4'ha):(4'h9)]);
          reg157 <= {$signed((($signed((8'hb1)) ?
                  (+wire145) : (-wire135)) * {wire135[(3'h5):(2'h2)],
                  (reg141 != wire131)}))};
          reg158 <= (~&wire133[(3'h7):(1'h1)]);
        end
      else
        begin
          reg147 <= reg148[(1'h0):(1'h0)];
          reg148 <= (~$unsigned((reg153 == $unsigned($signed(reg147)))));
          reg149 <= wire131[(3'h4):(1'h1)];
          if ({reg142[(1'h1):(1'h1)]})
            begin
              reg150 <= ((~(&$signed(reg149))) <<< (~&($signed((reg151 ?
                      reg156 : reg147)) ?
                  ($signed(wire130) * {reg158,
                      reg149}) : (-(reg146 - reg146)))));
              reg151 <= $signed($unsigned(reg151[(1'h1):(1'h1)]));
            end
          else
            begin
              reg150 <= reg151[(3'h4):(2'h3)];
              reg151 <= ($signed(wire131) ?
                  $unsigned($unsigned(({reg149} ?
                      (reg157 > wire137) : (reg143 ?
                          wire130 : wire136)))) : $signed(reg151));
            end
        end
      if (reg152[(1'h0):(1'h0)])
        begin
          if ((!(({$signed(wire133),
                  wire134[(5'h14):(2'h3)]} > wire132[(4'h8):(4'h8)]) ?
              $unsigned(wire130[(3'h4):(2'h3)]) : $unsigned($signed(wire138[(1'h1):(1'h1)])))))
            begin
              reg159 <= {$signed(wire138), (8'hb1)};
              reg160 <= reg151[(4'h8):(2'h3)];
              reg161 <= (^~$signed($signed({(reg140 ^ (8'haa))})));
            end
          else
            begin
              reg159 <= $signed($signed((((-wire129) >= (~|reg151)) ?
                  wire129[(4'h8):(2'h2)] : reg159[(1'h1):(1'h1)])));
              reg160 <= reg155;
            end
          reg162 <= reg142;
          if (reg160[(5'h12):(5'h12)])
            begin
              reg163 <= ($signed(({(&reg152)} || (~&{wire144,
                  wire136}))) + $unsigned($unsigned($unsigned((~|wire139)))));
              reg164 <= ((!(($unsigned(reg151) ^ (8'h9e)) ?
                      $unsigned((wire145 ?
                          wire131 : wire132)) : ((reg149 >= reg163) ~^ reg140[(4'h9):(3'h5)]))) ?
                  ({$unsigned((reg162 ?
                          wire139 : reg162))} && (~^(~|(&wire130)))) : (^$unsigned(((wire134 | wire129) > $unsigned(reg158)))));
              reg165 <= $signed($signed(((-(wire129 <= reg158)) ?
                  ($signed((8'haa)) ?
                      $unsigned(reg141) : reg154[(3'h6):(2'h3)]) : (wire139[(5'h10):(5'h10)] ^ wire144))));
              reg166 <= (reg161 ?
                  {$unsigned(((~reg149) ?
                          reg165[(4'ha):(3'h7)] : $signed(wire144))),
                      $unsigned((~&{(8'h9e), wire135}))} : reg143);
            end
          else
            begin
              reg163 <= (reg164 ?
                  $signed($unsigned(($unsigned(wire133) - $signed(reg163)))) : reg155);
              reg164 <= {(-(({wire128, reg143} >> {reg163,
                      wire137}) >>> (~&{wire139, reg143}))),
                  (&$unsigned((~|$unsigned(reg158))))};
              reg165 <= reg150[(3'h7):(2'h3)];
              reg166 <= ($unsigned(reg149[(3'h4):(2'h2)]) ?
                  wire139[(4'h8):(1'h0)] : ({(((7'h44) >>> wire139) | $unsigned(wire128))} * {reg163}));
              reg167 <= $unsigned((($unsigned((+reg162)) && $unsigned($unsigned(reg143))) ^~ (((reg155 ?
                  reg149 : wire137) + reg158) || (~|((8'ha6) ^ wire144)))));
            end
        end
      else
        begin
          reg159 <= (+$signed($unsigned($unsigned((reg166 ?
              reg155 : reg140)))));
          reg160 <= ($signed(wire135[(3'h5):(3'h5)]) == reg154[(4'h8):(2'h2)]);
          reg161 <= reg148[(2'h2):(1'h1)];
          reg162 <= (8'hba);
        end
      reg168 <= (~|wire130[(3'h7):(2'h3)]);
    end
  assign wire169 = $unsigned($unsigned($unsigned({(reg157 ?
                           reg141 : wire129)})));
  always
    @(posedge clk) begin
      reg170 <= $signed((($signed($signed((8'hb8))) ?
          (+(reg154 && reg158)) : reg164[(2'h3):(2'h2)]) + $unsigned((~|$signed((8'ha7))))));
      reg171 <= (~^reg140[(4'h8):(3'h5)]);
    end
endmodule

module module89  (y, clk, wire93, wire92, wire91, wire90);
  output wire [(32'h12d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire93;
  input wire signed [(4'he):(1'h0)] wire92;
  input wire [(3'h4):(1'h0)] wire91;
  input wire signed [(5'h15):(1'h0)] wire90;
  wire signed [(4'ha):(1'h0)] wire123;
  wire signed [(3'h7):(1'h0)] wire122;
  wire signed [(4'ha):(1'h0)] wire121;
  wire signed [(4'hc):(1'h0)] wire120;
  wire [(4'hd):(1'h0)] wire119;
  wire [(4'hb):(1'h0)] wire118;
  wire [(3'h5):(1'h0)] wire117;
  wire signed [(3'h7):(1'h0)] wire116;
  wire [(4'he):(1'h0)] wire115;
  wire [(3'h6):(1'h0)] wire114;
  wire [(4'hf):(1'h0)] wire113;
  wire signed [(4'ha):(1'h0)] wire94;
  reg signed [(3'h5):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg111 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg106 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg101 = (1'h0);
  reg [(5'h10):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg99 = (1'h0);
  reg [(3'h6):(1'h0)] reg98 = (1'h0);
  reg [(4'hc):(1'h0)] reg97 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg95 = (1'h0);
  assign y = {wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire94,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
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
                 (1'h0)};
  assign wire94 = ((~$signed($unsigned($unsigned(wire92)))) + $unsigned($unsigned($unsigned((wire92 ?
                      wire91 : wire90)))));
  always
    @(posedge clk) begin
      if (($unsigned($signed($signed(wire92[(2'h3):(2'h2)]))) + $signed((wire90 & ($unsigned(wire94) ^~ (wire90 ?
          wire93 : wire92))))))
        begin
          if ($unsigned((~^wire94[(1'h0):(1'h0)])))
            begin
              reg95 <= wire93;
              reg96 <= ((~|$signed((|(|reg95)))) ?
                  {(reg95[(2'h2):(1'h0)] || (~^(wire94 ?
                          wire93 : wire92)))} : {(|$signed($signed(reg95))),
                      $signed((((8'ha0) ? reg95 : wire92) && (^wire91)))});
              reg97 <= (({((wire92 > wire91) >> ((8'ha5) << wire92))} ?
                  $unsigned({$signed(wire93)}) : (((reg96 ?
                          wire92 : (8'hbf)) * $signed(wire91)) ?
                      (~&{reg95}) : $unsigned(wire93))) + ((^~$signed((wire90 ?
                      (8'hb0) : wire93))) ?
                  ({$signed(wire92), wire94[(2'h3):(1'h1)]} ?
                      wire91 : (-$signed(reg95))) : (wire94[(1'h1):(1'h1)] <<< reg95)));
              reg98 <= (8'hb5);
            end
          else
            begin
              reg95 <= wire91;
              reg96 <= ((7'h41) ?
                  reg95 : $unsigned(((reg95[(1'h0):(1'h0)] ~^ $unsigned(reg98)) ?
                      $unsigned({wire90, wire92}) : (^~reg96))));
              reg97 <= ((~^(+$unsigned((!reg97)))) ?
                  wire91[(1'h1):(1'h1)] : ((({wire92} ?
                          $unsigned(wire93) : $signed(wire91)) << (&reg98[(3'h5):(1'h0)])) ?
                      wire92 : $signed(reg96)));
              reg98 <= $unsigned((($unsigned(reg98[(3'h5):(1'h0)]) ?
                  ((wire91 ?
                      wire91 : wire94) << $unsigned((8'h9e))) : (wire93[(3'h6):(1'h0)] != (wire93 != wire90))) ~^ $signed(reg96[(2'h3):(1'h1)])));
            end
          if ((wire93[(2'h3):(1'h1)] ?
              {(reg95 >>> $signed($signed(reg96)))} : {$signed(wire93),
                  (~&$unsigned((8'hbb)))}))
            begin
              reg99 <= reg97[(4'h8):(2'h2)];
              reg100 <= $unsigned({$signed(reg98[(3'h6):(3'h6)]),
                  $signed((~|wire91[(1'h0):(1'h0)]))});
            end
          else
            begin
              reg99 <= reg95[(4'hd):(3'h5)];
              reg100 <= wire90[(4'ha):(4'h9)];
            end
        end
      else
        begin
          reg95 <= wire94[(3'h6):(3'h6)];
          reg96 <= {$signed($unsigned(reg97))};
          reg97 <= reg99;
          reg98 <= wire92;
        end
      reg101 <= $signed($signed((^$unsigned(wire93))));
      reg102 <= ((reg101[(3'h6):(3'h6)] ? (8'hb0) : reg96) ~^ $unsigned(reg98));
      if ((7'h42))
        begin
          reg103 <= wire90;
        end
      else
        begin
          reg103 <= wire91;
          reg104 <= ((+wire94[(4'h9):(2'h2)]) ?
              $signed(($unsigned($signed(reg97)) ?
                  $unsigned($unsigned(reg98)) : $unsigned(reg98[(3'h4):(1'h0)]))) : (^~$signed($signed((-(8'ha2))))));
          reg105 <= ((({(reg100 == reg99)} ?
                  {reg95, (reg99 ? (8'hbf) : wire91)} : $unsigned((wire93 ?
                      reg103 : wire94))) ?
              (((~wire92) ? $signed(wire92) : (reg98 ? wire93 : wire92)) ?
                  wire90 : ($signed(reg96) | reg97)) : $signed(($signed(reg99) ?
                  (wire93 ?
                      reg103 : wire94) : (wire92 >> wire93)))) & $signed((^reg99)));
          if ((+reg101))
            begin
              reg106 <= (-$unsigned(reg103));
              reg107 <= (reg104[(3'h7):(2'h2)] <= ($signed(wire90[(4'h8):(2'h3)]) ?
                  (((wire90 + reg95) ? (+wire93) : {reg101, (7'h43)}) ?
                      wire90[(4'ha):(3'h6)] : ((8'ha9) || (reg102 ?
                          reg104 : wire90))) : $signed(wire91[(2'h3):(1'h1)])));
            end
          else
            begin
              reg106 <= ($signed((!$signed($unsigned(reg95)))) ?
                  (^~(-wire90[(4'hb):(2'h2)])) : (|{($signed(reg104) ^~ {wire91,
                          reg103}),
                      reg101}));
              reg107 <= ((~^wire91) ^~ {(8'ha9),
                  $unsigned($unsigned((wire91 ? reg105 : wire90)))});
              reg108 <= {(^reg100), reg105[(2'h2):(1'h0)]};
            end
          if (wire94)
            begin
              reg109 <= wire92[(4'ha):(2'h3)];
              reg110 <= {reg105[(4'h8):(2'h2)],
                  (reg105 ? ((8'hae) == ((~^reg103) >>> (^wire92))) : (7'h42))};
              reg111 <= ((({(8'hb0),
                      reg98[(3'h4):(1'h1)]} <= ((reg108 << reg105) == reg103[(4'ha):(3'h6)])) * $unsigned(reg109)) ?
                  (8'hbd) : ((^$unsigned($unsigned(reg107))) ?
                      reg110 : $signed($signed(((7'h42) ? reg107 : (8'ha7))))));
              reg112 <= ((reg110[(1'h0):(1'h0)] ^ (reg102 ?
                      {(^reg105)} : $signed(((8'h9e) || reg107)))) ?
                  (^((reg97[(4'hc):(1'h0)] == (&wire94)) >> (8'hbc))) : (($signed($signed(reg108)) && $signed((|reg105))) ?
                      ((((7'h41) ? reg110 : reg106) | {reg108, wire93}) ?
                          reg95[(3'h7):(2'h2)] : reg103[(4'ha):(2'h2)]) : $signed(((^wire93) ^~ (reg103 <<< wire94)))));
            end
          else
            begin
              reg109 <= $unsigned((~&$signed((((8'hbe) ?
                  reg102 : (7'h42)) || reg102[(1'h0):(1'h0)]))));
              reg110 <= $signed(((-reg102) | reg101[(2'h2):(1'h1)]));
              reg111 <= $signed((~|$unsigned($signed((wire90 ^~ (8'hbb))))));
            end
        end
    end
  assign wire113 = reg109[(3'h6):(1'h1)];
  assign wire114 = (reg100[(2'h2):(2'h2)] < ((|wire113) ^ $unsigned(reg107)));
  assign wire115 = (reg106[(3'h7):(3'h5)] ?
                       ((!reg103[(4'ha):(3'h4)]) ?
                           (~(~|(reg96 ?
                               reg104 : reg97))) : {reg110}) : (($signed((7'h41)) || $signed((&reg95))) <= (!((reg103 < (7'h41)) ?
                           {reg106} : (reg102 == reg105)))));
  assign wire116 = wire113[(2'h3):(1'h1)];
  assign wire117 = $unsigned($signed({$unsigned($signed(reg103)),
                       reg110[(2'h2):(1'h1)]}));
  assign wire118 = (+(reg95 ? (~wire92[(4'h8):(1'h0)]) : (8'hb6)));
  assign wire119 = $unsigned(($signed(((!wire114) ?
                       (reg99 ^~ reg100) : {wire117})) >= $unsigned((~&wire94))));
  assign wire120 = reg106[(3'h6):(2'h3)];
  assign wire121 = $signed(wire120[(3'h7):(3'h4)]);
  assign wire122 = wire90;
  assign wire123 = (((~&wire90) && (+$unsigned(reg97))) != wire118[(4'ha):(3'h4)]);
endmodule

module module61
#(parameter param85 = {((-(8'hbd)) < (((~&(8'had)) && {(8'h9e)}) != (((8'hb6) <<< (8'haa)) <= ((7'h42) && (7'h40)))))})
(y, clk, wire65, wire64, wire63, wire62);
  output wire [(32'hb2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire65;
  input wire [(4'h9):(1'h0)] wire64;
  input wire signed [(5'h15):(1'h0)] wire63;
  input wire [(5'h12):(1'h0)] wire62;
  wire signed [(3'h7):(1'h0)] wire84;
  wire [(4'h8):(1'h0)] wire81;
  wire [(3'h5):(1'h0)] wire80;
  wire [(4'hb):(1'h0)] wire79;
  wire [(3'h4):(1'h0)] wire66;
  reg signed [(3'h7):(1'h0)] reg83 = (1'h0);
  reg [(3'h5):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg78 = (1'h0);
  reg [(2'h3):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(4'h8):(1'h0)] reg75 = (1'h0);
  reg [(5'h13):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg71 = (1'h0);
  reg [(5'h11):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg67 = (1'h0);
  assign y = {wire84,
                 wire81,
                 wire80,
                 wire79,
                 wire66,
                 reg83,
                 reg82,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 (1'h0)};
  assign wire66 = wire62;
  always
    @(posedge clk) begin
      if (wire65)
        begin
          reg67 <= ({wire66[(2'h3):(2'h3)], wire66} ?
              ($unsigned($unsigned(wire66)) < wire64) : {wire65[(3'h6):(3'h5)],
                  $unsigned(wire66)});
        end
      else
        begin
          reg67 <= $signed($signed(($unsigned(reg67[(3'h7):(3'h6)]) ^ (~&(wire66 ?
              wire65 : (8'haf))))));
          if (wire62[(5'h11):(4'hf)])
            begin
              reg68 <= (|$signed(reg67[(1'h0):(1'h0)]));
              reg69 <= ((^$unsigned(wire66[(1'h0):(1'h0)])) ?
                  wire65 : ((+({(8'ha0)} && (^reg68))) ?
                      ($unsigned((reg67 ?
                          wire63 : reg67)) >> (8'hba)) : $signed($signed($signed(reg68)))));
            end
          else
            begin
              reg68 <= reg69;
              reg69 <= $unsigned((reg69[(1'h0):(1'h0)] == (-((^~wire66) - $signed(wire62)))));
            end
          reg70 <= $signed($signed(((~&(wire62 ? reg67 : reg69)) > ((reg69 ?
              wire62 : wire63) <= $unsigned((8'ha7))))));
          reg71 <= wire63[(1'h1):(1'h1)];
        end
      if (reg69[(2'h3):(1'h0)])
        begin
          reg72 <= ($signed(($unsigned({wire64}) ?
                  reg71[(4'hb):(4'h9)] : (^~wire65))) ?
              $unsigned($signed(wire65[(4'h8):(3'h6)])) : (wire63[(2'h3):(2'h2)] ?
                  (reg71 - wire66[(1'h1):(1'h0)]) : wire63));
        end
      else
        begin
          reg72 <= $unsigned(reg69);
          reg73 <= {(reg69[(1'h1):(1'h0)] <<< (^wire62)), $unsigned(wire65)};
          if (reg68)
            begin
              reg74 <= reg70;
              reg75 <= $unsigned($signed($unsigned({(reg72 + (7'h40)),
                  $unsigned(reg70)})));
            end
          else
            begin
              reg74 <= $unsigned($unsigned($signed(reg68)));
              reg75 <= $unsigned((^~(-reg73[(1'h1):(1'h0)])));
              reg76 <= wire62[(4'he):(4'hd)];
            end
          reg77 <= ($unsigned(($unsigned($unsigned(wire64)) ?
              reg75 : ($unsigned(reg72) < (+reg69)))) ^~ {(+({wire62,
                  (8'hb2)} <= (wire64 - wire66)))});
          reg78 <= (wire65 + (reg76[(2'h2):(2'h2)] ?
              (wire64[(2'h2):(1'h0)] != {(-reg76),
                  ((8'hb3) ?
                      reg73 : reg76)}) : (~&$unsigned((reg73 < reg70)))));
        end
    end
  assign wire79 = $unsigned($signed(wire66));
  assign wire80 = $unsigned($unsigned((((reg69 >>> (8'hbe)) << (reg72 >= wire63)) != reg72)));
  assign wire81 = reg69[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg82 <= $signed({$signed($signed($unsigned(reg69)))});
      reg83 <= $signed(wire79);
    end
  assign wire84 = {$signed((+$signed((reg74 ? reg78 : wire81))))};
endmodule

module module30  (y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire35;
  input wire signed [(4'h9):(1'h0)] wire34;
  input wire signed [(5'h14):(1'h0)] wire33;
  input wire signed [(4'hb):(1'h0)] wire32;
  input wire [(4'hd):(1'h0)] wire31;
  wire signed [(2'h3):(1'h0)] wire41;
  wire [(5'h11):(1'h0)] wire40;
  wire signed [(4'hf):(1'h0)] wire39;
  wire [(5'h11):(1'h0)] wire38;
  wire signed [(2'h2):(1'h0)] wire37;
  wire [(2'h2):(1'h0)] wire36;
  assign y = {wire41, wire40, wire39, wire38, wire37, wire36, (1'h0)};
  assign wire36 = $signed((|$signed(((wire35 ? wire34 : wire35) == {wire31,
                      (8'h9d)}))));
  assign wire37 = wire32;
  assign wire38 = $signed($signed((-$signed(wire31))));
  assign wire39 = (&(-wire38[(3'h5):(1'h0)]));
  assign wire40 = wire32[(3'h4):(2'h3)];
  assign wire41 = $unsigned(wire40);
endmodule
