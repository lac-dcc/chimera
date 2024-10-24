module top
#(parameter param261 = (!(((+(^~(7'h40))) > ((~(8'hb2)) ^ (^(8'hbf)))) ? (&(|(!(8'hbb)))) : (&(((8'ha7) - (8'had)) ? ((8'ha5) ? (8'ha5) : (8'had)) : ((8'hb6) ? (8'hbe) : (8'ha0)))))), 
parameter param262 = (((!(8'hb8)) ? (((param261 < param261) ~^ (8'hbf)) ~^ ((^~param261) <= (param261 ? param261 : param261))) : (&({param261, param261} ? param261 : (param261 * param261)))) << {{{(param261 ? param261 : param261)}, (-(param261 ? param261 : (7'h43)))}}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h233):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire signed [(4'h9):(1'h0)] wire260;
  wire [(5'h13):(1'h0)] wire259;
  wire [(5'h15):(1'h0)] wire239;
  wire signed [(5'h14):(1'h0)] wire238;
  wire [(5'h14):(1'h0)] wire237;
  wire [(4'hf):(1'h0)] wire236;
  wire [(5'h14):(1'h0)] wire235;
  wire [(5'h12):(1'h0)] wire230;
  wire [(5'h10):(1'h0)] wire229;
  wire signed [(5'h13):(1'h0)] wire228;
  wire signed [(5'h14):(1'h0)] wire152;
  wire [(5'h12):(1'h0)] wire74;
  wire signed [(5'h12):(1'h0)] wire73;
  wire signed [(5'h12):(1'h0)] wire72;
  wire [(5'h14):(1'h0)] wire71;
  wire signed [(3'h4):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire69;
  wire [(4'hc):(1'h0)] wire226;
  wire [(5'h11):(1'h0)] wire232;
  wire signed [(3'h4):(1'h0)] wire233;
  reg [(4'hf):(1'h0)] reg258 = (1'h0);
  reg [(4'h8):(1'h0)] reg257 = (1'h0);
  reg [(5'h13):(1'h0)] reg256 = (1'h0);
  reg [(5'h12):(1'h0)] reg255 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg254 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg253 = (1'h0);
  reg [(5'h11):(1'h0)] reg252 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg251 = (1'h0);
  reg [(3'h4):(1'h0)] reg250 = (1'h0);
  reg [(5'h11):(1'h0)] reg249 = (1'h0);
  reg [(3'h6):(1'h0)] reg248 = (1'h0);
  reg [(5'h15):(1'h0)] reg247 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg246 = (1'h0);
  reg [(3'h7):(1'h0)] reg245 = (1'h0);
  reg [(5'h12):(1'h0)] reg244 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg243 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg242 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg241 = (1'h0);
  reg signed [(4'he):(1'h0)] reg240 = (1'h0);
  assign y = {wire260,
                 wire259,
                 wire239,
                 wire238,
                 wire237,
                 wire236,
                 wire235,
                 wire230,
                 wire229,
                 wire228,
                 wire152,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire5,
                 wire69,
                 wire226,
                 wire232,
                 wire233,
                 reg258,
                 reg257,
                 reg256,
                 reg255,
                 reg254,
                 reg253,
                 reg252,
                 reg251,
                 reg250,
                 reg249,
                 reg248,
                 reg247,
                 reg246,
                 reg245,
                 reg244,
                 reg243,
                 reg242,
                 reg241,
                 reg240,
                 (1'h0)};
  assign wire5 = {$unsigned(((((8'hb4) ? wire1 : wire2) ?
                         (wire4 ? wire0 : wire4) : ((8'ha8) ?
                             wire4 : wire1)) <<< $signed(wire2[(4'h8):(3'h7)]))),
                     $signed(wire0[(3'h6):(1'h1)])};
  module6 #() modinst70 (wire69, clk, wire1, wire4, wire3, wire2, wire0);
  assign wire71 = (|$signed(wire5[(1'h1):(1'h1)]));
  assign wire72 = (($unsigned((&(!(8'ha7)))) || ((~&wire5) == $signed((wire4 ?
                      wire0 : wire1)))) - $unsigned(wire69[(3'h4):(2'h2)]));
  assign wire73 = wire3;
  assign wire74 = wire69[(4'hd):(4'hc)];
  module75 #() modinst153 (wire152, clk, wire5, wire1, wire73, wire4, wire74);
  module154 #() modinst227 (.y(wire226), .wire159(wire4), .wire156(wire69), .clk(clk), .wire158(wire5), .wire155(wire74), .wire157(wire73));
  assign wire228 = wire4[(4'hb):(2'h2)];
  assign wire229 = $signed(((((~|wire71) && wire71) * $unsigned($unsigned(wire3))) != (8'haa)));
  module102 #() modinst231 (wire230, clk, wire3, wire229, wire152, wire2, wire73);
  assign wire232 = $unsigned(wire0);
  module75 #() modinst234 (wire233, clk, wire2, wire228, wire226, wire71, wire72);
  assign wire235 = (~|(7'h41));
  assign wire236 = ($unsigned($unsigned($signed(wire3))) ~^ wire226);
  assign wire237 = wire3[(4'h8):(4'h8)];
  assign wire238 = wire232;
  assign wire239 = $unsigned((wire69[(2'h2):(2'h2)] ?
                       (((^(8'ha5)) ?
                               wire232[(4'hd):(4'ha)] : (wire235 >= wire233)) ?
                           wire4[(3'h4):(2'h2)] : $unsigned($signed(wire228))) : {($unsigned(wire5) == (wire238 || wire1)),
                           (|$signed(wire235))}));
  always
    @(posedge clk) begin
      if ((~(($signed((~wire230)) < wire5[(1'h0):(1'h0)]) ?
          {$unsigned(wire2), wire2} : ((~&(wire3 >= (8'had))) ?
              wire237[(4'ha):(2'h2)] : wire233[(1'h0):(1'h0)]))))
        begin
          reg240 <= ((8'haf) | ((wire237[(2'h3):(2'h2)] ?
                  (|wire228[(1'h0):(1'h0)]) : (|(~|wire238))) ?
              $unsigned((^(|wire1))) : $signed((wire74 ?
                  (wire228 | (8'hac)) : (wire1 ^~ (8'ha3))))));
          reg241 <= (&wire237);
          reg242 <= (($signed({(reg240 ? wire236 : wire0)}) ?
              wire232[(2'h2):(1'h1)] : reg241[(3'h5):(3'h5)]) ^~ (|(wire1 >= (wire228 && wire1[(5'h13):(4'ha)]))));
          reg243 <= (wire4[(3'h6):(1'h1)] ?
              (reg242 <= wire152[(5'h10):(2'h3)]) : $signed((($signed(wire0) ?
                      ((8'hbf) ? wire0 : wire0) : (wire230 >>> reg242)) ?
                  wire230 : wire232[(4'hd):(1'h0)])));
        end
      else
        begin
          if (($unsigned(($unsigned({wire0,
                  wire5}) ^ $signed($unsigned(wire232)))) ?
              $unsigned($signed($signed((!wire232)))) : $signed(($signed($signed(wire74)) < ({reg242} ?
                  (wire236 ? wire3 : wire239) : wire2)))))
            begin
              reg240 <= {((&((&wire226) <<< reg241)) ~^ (+{$unsigned(reg242),
                      (~wire4)})),
                  $signed((8'h9c))};
              reg241 <= {(-{wire5, $unsigned({(8'ha2)})})};
              reg242 <= (-wire235[(5'h13):(2'h3)]);
              reg243 <= wire229;
              reg244 <= (-wire72);
            end
          else
            begin
              reg240 <= (($signed(((wire235 == (8'ha5)) ?
                      wire1 : (|wire230))) && $unsigned(wire71)) ?
                  $unsigned(wire74) : $signed(wire5));
            end
          reg245 <= ((~|($signed(wire69) < wire236)) && (~reg240[(1'h0):(1'h0)]));
        end
      reg246 <= wire226;
      reg247 <= wire3[(4'hc):(2'h3)];
      if ($signed($signed($signed($signed(wire239[(3'h4):(3'h4)])))))
        begin
          reg248 <= (wire235 ?
              $signed((^wire2[(4'h8):(3'h5)])) : wire4[(3'h6):(1'h1)]);
          reg249 <= (reg242[(3'h4):(1'h0)] ?
              wire5 : {($signed(reg244[(3'h4):(1'h0)]) ?
                      $unsigned(wire0) : (~&wire69[(3'h6):(3'h4)]))});
        end
      else
        begin
          if ({{wire0[(1'h1):(1'h1)]}, (|reg249)})
            begin
              reg248 <= (((8'hbf) << $signed($unsigned(((7'h43) <= wire5)))) ?
                  $unsigned((^~{(^~reg246),
                      ((8'haa) ?
                          wire72 : wire74)})) : (reg241 != $signed(($unsigned(reg247) + (~^(8'h9d))))));
              reg249 <= {(8'ha8), (reg244[(4'hf):(4'he)] >= (8'hb5))};
            end
          else
            begin
              reg248 <= $signed({reg242[(2'h2):(1'h0)]});
              reg249 <= {((&($signed(reg243) ?
                      (^wire237) : $signed(reg247))) | (^{wire74[(4'h8):(3'h6)]}))};
              reg250 <= $unsigned($unsigned($signed(({wire232, (8'h9e)} ?
                  (wire152 ? wire238 : wire230) : (&wire230)))));
            end
          if ({($unsigned(reg248[(1'h0):(1'h0)]) >>> reg245)})
            begin
              reg251 <= $unsigned(wire1);
              reg252 <= $unsigned($unsigned($signed(((reg250 | wire0) ?
                  $signed(wire72) : reg247[(5'h12):(4'h8)]))));
              reg253 <= {(~(~&$unsigned($unsigned(reg250))))};
              reg254 <= {$unsigned(((reg248 & {(8'h9f), (8'hbe)}) ?
                      wire5[(1'h0):(1'h0)] : ((reg252 ? reg243 : reg240) ?
                          $unsigned(reg245) : $unsigned(wire73)))),
                  $signed($signed((~^{(8'hbd), wire229})))};
              reg255 <= $unsigned($signed((wire233 ?
                  wire71[(4'hd):(4'hd)] : $signed(reg243))));
            end
          else
            begin
              reg251 <= reg241[(4'h8):(3'h6)];
              reg252 <= wire72[(1'h1):(1'h1)];
              reg253 <= {reg252, $unsigned(reg244[(1'h1):(1'h0)])};
            end
          reg256 <= (((~|$signed(((8'hb9) ?
              reg250 : reg244))) <<< (reg245[(3'h4):(3'h4)] != ($unsigned(wire232) ?
              (reg250 >>> reg252) : (wire237 + wire69)))) + (((~(reg243 > reg243)) << reg243[(3'h4):(1'h0)]) < (~^$unsigned((~|wire230)))));
          reg257 <= reg246;
          reg258 <= {$signed(reg252)};
        end
    end
  assign wire259 = $signed($signed({$unsigned({(8'hae)}),
                       ((reg255 ? wire228 : wire4) ?
                           $signed(reg247) : reg255)}));
  assign wire260 = wire5[(3'h4):(1'h0)];
endmodule

module module154  (y, clk, wire159, wire158, wire157, wire156, wire155);
  output wire [(32'h34e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire159;
  input wire signed [(3'h4):(1'h0)] wire158;
  input wire signed [(5'h12):(1'h0)] wire157;
  input wire signed [(4'he):(1'h0)] wire156;
  input wire signed [(4'hd):(1'h0)] wire155;
  wire [(3'h6):(1'h0)] wire225;
  wire [(4'hf):(1'h0)] wire224;
  wire [(5'h13):(1'h0)] wire223;
  wire signed [(2'h2):(1'h0)] wire222;
  wire [(5'h10):(1'h0)] wire221;
  wire signed [(4'hc):(1'h0)] wire171;
  wire signed [(5'h10):(1'h0)] wire168;
  wire [(2'h2):(1'h0)] wire166;
  wire [(4'ha):(1'h0)] wire165;
  wire [(4'h8):(1'h0)] wire164;
  wire [(5'h14):(1'h0)] wire163;
  wire [(5'h11):(1'h0)] wire162;
  wire signed [(5'h15):(1'h0)] wire161;
  wire signed [(5'h14):(1'h0)] wire160;
  reg [(4'h8):(1'h0)] reg220 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg219 = (1'h0);
  reg [(5'h15):(1'h0)] reg218 = (1'h0);
  reg [(4'h9):(1'h0)] reg217 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg216 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg215 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg214 = (1'h0);
  reg [(3'h5):(1'h0)] reg213 = (1'h0);
  reg [(4'h8):(1'h0)] reg212 = (1'h0);
  reg [(4'hf):(1'h0)] reg211 = (1'h0);
  reg [(5'h13):(1'h0)] reg210 = (1'h0);
  reg [(5'h11):(1'h0)] reg209 = (1'h0);
  reg [(4'he):(1'h0)] reg208 = (1'h0);
  reg [(4'ha):(1'h0)] reg207 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg206 = (1'h0);
  reg [(5'h13):(1'h0)] reg205 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg204 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg203 = (1'h0);
  reg [(4'hd):(1'h0)] reg202 = (1'h0);
  reg [(4'hf):(1'h0)] reg201 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg200 = (1'h0);
  reg [(3'h6):(1'h0)] reg199 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg198 = (1'h0);
  reg [(5'h15):(1'h0)] reg197 = (1'h0);
  reg [(5'h12):(1'h0)] reg196 = (1'h0);
  reg [(3'h4):(1'h0)] reg195 = (1'h0);
  reg [(2'h3):(1'h0)] reg194 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg193 = (1'h0);
  reg [(5'h11):(1'h0)] reg192 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg190 = (1'h0);
  reg [(5'h15):(1'h0)] reg189 = (1'h0);
  reg [(5'h13):(1'h0)] reg188 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg186 = (1'h0);
  reg [(4'hd):(1'h0)] reg185 = (1'h0);
  reg [(4'hf):(1'h0)] reg184 = (1'h0);
  reg [(4'h8):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg182 = (1'h0);
  reg [(3'h4):(1'h0)] reg181 = (1'h0);
  reg [(4'hc):(1'h0)] reg180 = (1'h0);
  reg [(3'h4):(1'h0)] reg179 = (1'h0);
  reg [(5'h11):(1'h0)] reg178 = (1'h0);
  reg signed [(4'he):(1'h0)] reg177 = (1'h0);
  reg [(4'hf):(1'h0)] reg176 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg175 = (1'h0);
  reg [(4'hf):(1'h0)] reg174 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg173 = (1'h0);
  reg [(4'hc):(1'h0)] reg172 = (1'h0);
  reg [(3'h6):(1'h0)] reg170 = (1'h0);
  reg [(5'h15):(1'h0)] reg169 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg167 = (1'h0);
  assign y = {wire225,
                 wire224,
                 wire223,
                 wire222,
                 wire221,
                 wire171,
                 wire168,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
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
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg170,
                 reg169,
                 reg167,
                 (1'h0)};
  assign wire160 = $signed(wire157[(4'hd):(4'hb)]);
  assign wire161 = $unsigned((wire159[(5'h10):(4'hd)] ?
                       $unsigned(((8'ha6) < $signed(wire159))) : (wire156[(1'h0):(1'h0)] ?
                           $signed(wire157) : $unsigned(wire159[(3'h7):(3'h4)]))));
  assign wire162 = $unsigned($signed((wire155[(4'hb):(4'h9)] | wire157[(5'h12):(4'hf)])));
  assign wire163 = {(-($signed($signed(wire157)) ?
                           (~^wire159[(1'h0):(1'h0)]) : (|{(7'h40)})))};
  assign wire164 = $unsigned((!$signed(((wire156 >> wire156) <<< $signed(wire161)))));
  assign wire165 = $signed(wire155[(3'h4):(2'h2)]);
  assign wire166 = (~|((~|$signed($signed(wire157))) & wire161));
  always
    @(posedge clk) begin
      reg167 <= {wire159, wire163};
    end
  assign wire168 = wire162;
  always
    @(posedge clk) begin
      reg169 <= ((~^wire166[(2'h2):(2'h2)]) ?
          $signed(wire159) : wire166[(2'h2):(1'h1)]);
      reg170 <= (($unsigned(((reg169 <= wire158) ?
          $signed(wire159) : (wire156 ?
              wire158 : wire156))) ~^ (($signed(wire155) || wire168) ?
          wire159[(5'h12):(4'hf)] : $unsigned((-wire157)))) ~^ (wire159 ?
          reg169[(1'h0):(1'h0)] : (~^reg167)));
    end
  assign wire171 = wire164;
  always
    @(posedge clk) begin
      if (($unsigned($signed({wire156[(3'h5):(1'h0)]})) ?
          $signed(wire161) : wire161))
        begin
          if ({{($signed($signed(wire161)) < (^wire155))}})
            begin
              reg172 <= wire161;
              reg173 <= {$signed($unsigned($signed($unsigned((8'hb3))))),
                  $signed(reg167)};
              reg174 <= ((wire156[(4'hd):(1'h1)] ^ (|{(-wire164)})) ?
                  $unsigned($unsigned((((8'hbd) ? wire164 : wire164) ?
                      $signed(wire168) : {wire159}))) : (~$unsigned((((8'h9c) + (8'haa)) ^~ (~wire156)))));
              reg175 <= $signed({$unsigned((~&{wire161, reg172}))});
            end
          else
            begin
              reg172 <= $signed({$signed(wire168[(4'ha):(2'h2)])});
            end
          reg176 <= $unsigned((reg169 ?
              (+wire171) : {(wire165 ?
                      (reg169 ? wire171 : wire162) : $unsigned(wire160))}));
          reg177 <= ({(~^$unsigned((wire160 && reg173))),
              wire164[(3'h4):(1'h0)]} == $unsigned($unsigned(wire166[(1'h1):(1'h1)])));
        end
      else
        begin
          reg172 <= (8'ha7);
          if ({reg172, $signed((wire158 + $signed((!wire156))))})
            begin
              reg173 <= (!{(~&wire159[(2'h2):(2'h2)]), reg170});
              reg174 <= wire162;
              reg175 <= $signed((((&$signed(reg173)) + (^~(wire171 ?
                  (8'hbb) : wire171))) >= (($unsigned(wire155) ?
                  {reg170,
                      reg172} : (^wire163)) & $signed(wire168[(3'h5):(2'h3)]))));
              reg176 <= {($unsigned(reg177) ?
                      (wire160[(4'hc):(4'h8)] | ((~wire156) ^ {reg170,
                          wire171})) : ($unsigned($signed(wire156)) ?
                          $signed((^~(7'h43))) : ($unsigned(reg167) <= (8'h9d))))};
              reg177 <= reg169[(4'hb):(2'h2)];
            end
          else
            begin
              reg173 <= $unsigned({($unsigned($signed((8'h9e))) ?
                      (+reg172) : $unsigned((&reg167))),
                  $unsigned({(reg174 ? (7'h41) : wire168)})});
              reg174 <= reg169;
              reg175 <= $unsigned($signed(($signed((~|(8'hbf))) ?
                  wire157 : {wire157[(4'h9):(3'h7)]})));
              reg176 <= (~|$signed($unsigned(reg174[(4'he):(3'h6)])));
            end
        end
      if ($unsigned($unsigned($signed((!(reg175 ? wire161 : wire155))))))
        begin
          reg178 <= (wire160[(1'h0):(1'h0)] | $unsigned($unsigned($unsigned(reg173))));
          reg179 <= $unsigned($signed($unsigned((((7'h43) ?
              (8'hb9) : wire157) != {wire168}))));
          reg180 <= $signed((wire155[(4'hc):(3'h5)] >= (reg170[(1'h1):(1'h0)] >= reg173)));
          if (reg173)
            begin
              reg181 <= $signed(((($unsigned((8'h9c)) == {wire162, reg167}) ?
                      ($signed(reg173) < {reg173,
                          reg178}) : reg178[(5'h10):(4'h9)]) ?
                  $unsigned(($signed(wire163) ?
                      ((8'hbb) ?
                          wire163 : wire165) : ((8'hba) >= reg174))) : wire165[(2'h2):(2'h2)]));
              reg182 <= $signed(wire158[(2'h3):(1'h1)]);
              reg183 <= wire159;
              reg184 <= (wire171 | reg174[(3'h4):(2'h2)]);
              reg185 <= reg172;
            end
          else
            begin
              reg181 <= ((reg184 >> reg182) ?
                  wire161 : ((+($signed(wire165) << wire166)) ?
                      ($unsigned(wire157[(4'he):(3'h4)]) ?
                          reg179 : (&(|reg172))) : $unsigned($unsigned($unsigned(reg180)))));
              reg182 <= (((&((wire156 ?
                          wire164 : wire165) <<< wire160[(3'h7):(2'h2)])) ?
                      wire163 : ({wire164[(2'h2):(1'h1)]} ?
                          $unsigned((reg174 ? reg176 : reg177)) : reg170)) ?
                  {({reg172} <= $signed(wire156[(3'h5):(1'h1)])),
                      $unsigned((&wire158))} : (wire161[(4'ha):(1'h1)] ?
                      $signed((((7'h42) ?
                          reg169 : (8'ha8)) >= (8'hbd))) : wire156[(4'h8):(3'h4)]));
              reg183 <= $unsigned(($signed((reg174 ?
                  {reg175,
                      wire168} : (|(8'ha9)))) <<< (~(!reg176[(4'hc):(2'h2)]))));
              reg184 <= reg178[(4'h8):(4'h8)];
            end
          reg186 <= $unsigned($unsigned($unsigned(((reg169 >> wire160) ?
              (reg174 ? wire159 : wire165) : (~^reg175)))));
        end
      else
        begin
          reg178 <= ((~|reg169) ?
              reg183 : {((7'h42) || $signed((wire164 ? wire165 : (8'hac)))),
                  $signed($signed(reg174))});
          reg179 <= (8'hac);
        end
      reg187 <= reg179[(1'h0):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg188 <= reg183;
      reg189 <= (($signed($unsigned((wire155 >> wire161))) ?
              $signed((((7'h43) ? (7'h40) : reg182) == (reg169 ?
                  reg177 : wire163))) : (-(wire163[(2'h3):(2'h3)] ^~ ((8'ha6) ?
                  (8'hbd) : reg170)))) ?
          reg187[(1'h0):(1'h0)] : reg172[(3'h6):(2'h3)]);
      reg190 <= (^reg183);
      if ($unsigned((~|({(wire155 <<< wire161),
          $unsigned(reg181)} <<< $unsigned({wire160, reg181})))))
        begin
          reg191 <= $signed((($unsigned($signed(reg170)) ?
              (~|wire166) : reg190) - $signed($signed(reg172[(4'hc):(4'hc)]))));
        end
      else
        begin
          reg191 <= wire160[(2'h3):(2'h3)];
          if (($signed(($signed((reg172 <= reg181)) > wire166)) ?
              ($signed($signed({reg191})) <= (&($unsigned(wire162) ?
                  $signed(reg175) : (~reg187)))) : reg183[(4'h8):(3'h5)]))
            begin
              reg192 <= $unsigned(($unsigned(($unsigned((8'hbd)) >= reg178[(4'he):(4'h8)])) >= (7'h40)));
            end
          else
            begin
              reg192 <= (&(wire171 ?
                  $unsigned(({(8'hab)} ?
                      (~wire163) : reg181)) : ({reg169[(3'h7):(3'h5)]} ?
                      {$unsigned(wire156),
                          (reg178 + reg173)} : $unsigned((~^reg167)))));
              reg193 <= wire158[(2'h3):(1'h0)];
              reg194 <= reg189[(2'h2):(1'h1)];
              reg195 <= (!$unsigned({wire161[(5'h12):(3'h7)]}));
              reg196 <= $unsigned({($unsigned(wire160) < $unsigned($signed(reg170)))});
            end
        end
      reg197 <= wire163[(3'h5):(2'h2)];
    end
  always
    @(posedge clk) begin
      if ($unsigned($signed((reg192 <= $signed(wire164[(4'h8):(4'h8)])))))
        begin
          reg198 <= ($unsigned(((wire166 <= wire160) <<< $signed(((8'hbe) ?
              reg185 : reg187)))) && {({$unsigned(wire155), $unsigned(reg170)} ?
                  $unsigned(((8'hbe) >= wire163)) : (((8'h9c) ?
                      reg181 : reg178) && (reg175 ? wire163 : reg187)))});
          reg199 <= (-reg188[(3'h4):(3'h4)]);
        end
      else
        begin
          reg198 <= reg196[(4'he):(1'h1)];
          if ((~|(((wire161 ~^ reg180) ?
              $unsigned((reg186 >> reg177)) : (^(&reg198))) ^ (!$signed((-reg186))))))
            begin
              reg199 <= ({$signed(wire157),
                  $signed($signed({wire155}))} == reg177[(3'h7):(3'h4)]);
              reg200 <= $signed($unsigned((+wire171)));
              reg201 <= reg169[(5'h12):(4'hf)];
              reg202 <= (reg194[(1'h0):(1'h0)] ?
                  (-(8'hab)) : $unsigned(reg194));
            end
          else
            begin
              reg199 <= reg198[(1'h0):(1'h0)];
              reg200 <= (reg176[(3'h7):(3'h5)] ?
                  (~$signed(((wire155 ~^ (8'ha9)) - wire164[(3'h7):(3'h4)]))) : (~(&$unsigned(reg172))));
              reg201 <= wire156[(3'h4):(1'h0)];
            end
          if (((~|reg194[(2'h3):(1'h0)]) ?
              (|$signed(reg181[(3'h4):(3'h4)])) : $unsigned((($unsigned((8'hb9)) ^ reg180) - reg196[(4'hf):(4'hb)]))))
            begin
              reg203 <= reg188;
            end
          else
            begin
              reg203 <= (((~(-$signed((7'h44)))) & $signed(reg189[(4'h9):(1'h1)])) ?
                  ((^~wire161) ?
                      (8'h9e) : (^~reg176[(2'h3):(1'h0)])) : reg192[(3'h4):(3'h4)]);
              reg204 <= {$unsigned({((wire158 ? reg170 : reg201) ?
                          (&(8'hae)) : (+wire157))}),
                  (8'had)};
              reg205 <= $signed((reg198[(1'h1):(1'h0)] ^ reg170[(3'h6):(2'h2)]));
              reg206 <= $unsigned(reg205[(5'h13):(4'ha)]);
            end
        end
      if ($signed((^reg169)))
        begin
          reg207 <= ((~|$signed((&reg184))) ?
              wire155[(1'h0):(1'h0)] : $signed($signed({$unsigned(reg186),
                  (|reg191)})));
          reg208 <= (reg169[(3'h5):(3'h5)] ? reg180[(2'h2):(1'h0)] : reg194);
          reg209 <= $unsigned(wire156[(4'hd):(3'h7)]);
          if ({reg184})
            begin
              reg210 <= reg199;
              reg211 <= $unsigned((reg178 ?
                  $signed((reg208[(4'he):(3'h6)] ?
                      wire171 : (~^reg178))) : reg203));
              reg212 <= reg180[(3'h5):(3'h4)];
              reg213 <= $signed($signed(wire165[(4'h8):(2'h2)]));
              reg214 <= $signed(reg193[(2'h3):(1'h1)]);
            end
          else
            begin
              reg210 <= $signed($unsigned({$unsigned(reg189)}));
              reg211 <= reg209[(3'h7):(2'h3)];
              reg212 <= reg201[(4'h9):(3'h7)];
            end
        end
      else
        begin
          if (reg174)
            begin
              reg207 <= ((~^$unsigned($signed($unsigned((8'hb3))))) ?
                  wire162 : $signed((^~$unsigned((7'h42)))));
            end
          else
            begin
              reg207 <= ($unsigned((reg189 ?
                      ($unsigned(reg193) ?
                          $signed((8'ha8)) : $unsigned(reg212)) : reg204[(3'h5):(2'h3)])) ?
                  reg192[(4'h9):(3'h4)] : (^wire163[(5'h11):(2'h3)]));
              reg208 <= $signed($signed((8'hb3)));
              reg209 <= {(8'ha2),
                  (((wire168 && (^~reg195)) - reg189[(3'h5):(3'h5)]) ?
                      $unsigned((|wire156[(3'h7):(1'h0)])) : $unsigned($signed((^reg206))))};
              reg210 <= (~reg206);
              reg211 <= {(reg184 ^~ (^~$signed(reg192[(4'ha):(3'h5)])))};
            end
          reg212 <= reg177[(4'h8):(2'h3)];
          if ((((~|reg211[(4'hc):(4'h8)]) | reg187[(4'hb):(2'h3)]) ?
              reg202 : $unsigned($signed($signed(reg190[(4'hf):(3'h7)])))))
            begin
              reg213 <= $unsigned((|($signed((reg173 ? reg174 : reg196)) ?
                  (&$unsigned(wire165)) : reg207[(3'h5):(3'h4)])));
            end
          else
            begin
              reg213 <= (~|reg200[(4'hc):(2'h3)]);
              reg214 <= $signed(($signed((&$signed(wire160))) ?
                  $signed(reg187[(3'h7):(2'h2)]) : $signed({(reg205 && wire171)})));
              reg215 <= ((reg195 - wire171[(1'h0):(1'h0)]) ?
                  wire157 : (($signed({reg181}) != $signed((reg210 ?
                          reg186 : reg206))) ?
                      (($signed((8'ha4)) ? wire155 : $unsigned(reg190)) ?
                          $signed((wire171 << reg180)) : $signed({wire159,
                              reg176})) : ($signed((reg170 & (7'h44))) > reg196)));
              reg216 <= reg177[(3'h6):(2'h3)];
              reg217 <= (wire161 * ($signed((~(~|reg186))) ?
                  $signed(((reg173 >= wire163) > wire168[(1'h0):(1'h0)])) : $unsigned(reg180[(4'h8):(2'h2)])));
            end
          reg218 <= $signed((8'hba));
          reg219 <= (((reg210 ?
              $signed((wire163 ?
                  reg206 : reg180)) : $signed((reg172 + reg212))) >> (((~&reg196) ?
                  (reg192 > (8'hb0)) : (reg209 << wire168)) ?
              {$unsigned(wire159)} : reg198)) <= reg203[(5'h10):(4'h8)]);
        end
    end
  always
    @(posedge clk) begin
      reg220 <= (|((reg215[(4'he):(4'hc)] <<< $unsigned($unsigned((8'ha2)))) ?
          {wire161} : reg189[(1'h1):(1'h1)]));
    end
  assign wire221 = (reg188[(3'h6):(2'h3)] ^ $signed((|(reg182[(4'h9):(3'h4)] ^~ (&(8'ha3))))));
  assign wire222 = wire161;
  assign wire223 = wire168[(4'hc):(4'h9)];
  assign wire224 = reg213[(2'h3):(2'h2)];
  assign wire225 = $signed($unsigned(wire168[(4'h8):(3'h5)]));
endmodule

module module75
#(parameter param150 = (((|(((8'hbb) & (8'hab)) && ((7'h40) ? (8'hbd) : (8'ha9)))) ? ((-{(8'ha5)}) < ({(7'h42), (8'hb9)} ? ((8'hbf) ? (8'hbe) : (8'h9c)) : ((8'ha7) ^~ (8'hb1)))) : (~{((8'hab) ? (8'ha0) : (8'hae)), ((8'ha1) ? (8'haf) : (8'hb3))})) > ((((^~(8'ha1)) ? {(8'ha1), (8'hac)} : (8'hb8)) ? ((^~(8'hb4)) ? ((8'haf) != (8'hba)) : {(8'haf), (8'hb1)}) : (((8'hb7) >>> (8'hbe)) ? {(8'hbd), (8'hb3)} : {(8'hb2), (8'ha4)})) ? ((((8'hbd) > (8'h9e)) ? ((8'hb3) ? (8'ha0) : (8'ha6)) : {(8'ha3)}) ? (((8'ha4) ? (7'h42) : (8'ha8)) ? (!(7'h43)) : ((8'haf) >>> (8'hbb))) : (^(~|(8'h9d)))) : ((((8'hb2) ? (8'hbe) : (8'hae)) ? ((8'hab) ? (8'ha0) : (8'hbe)) : {(8'h9d)}) ? (((8'hba) + (8'ha8)) | {(7'h42), (8'hbf)}) : (~^{(8'ha3)})))), 
parameter param151 = ((({(param150 >= param150)} + (param150 ? (7'h44) : {param150})) ? (((+param150) ? {param150, param150} : {param150, (8'hb9)}) - (~|{(8'h9f), param150})) : (+(((8'hb5) << (8'hab)) ? param150 : ((8'had) ? param150 : param150)))) | (~&param150)))
(y, clk, wire80, wire79, wire78, wire77, wire76);
  output wire [(32'h138):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire80;
  input wire signed [(5'h13):(1'h0)] wire79;
  input wire signed [(4'hc):(1'h0)] wire78;
  input wire signed [(5'h14):(1'h0)] wire77;
  input wire signed [(5'h12):(1'h0)] wire76;
  wire [(5'h14):(1'h0)] wire149;
  wire [(5'h11):(1'h0)] wire148;
  wire [(4'hc):(1'h0)] wire147;
  wire signed [(2'h3):(1'h0)] wire145;
  wire signed [(5'h14):(1'h0)] wire101;
  wire [(4'hf):(1'h0)] wire100;
  wire signed [(3'h7):(1'h0)] wire99;
  wire [(5'h12):(1'h0)] wire98;
  wire [(3'h5):(1'h0)] wire97;
  wire [(5'h15):(1'h0)] wire96;
  wire signed [(4'hf):(1'h0)] wire95;
  wire [(4'hd):(1'h0)] wire84;
  wire signed [(5'h10):(1'h0)] wire83;
  wire [(2'h2):(1'h0)] wire82;
  wire [(5'h10):(1'h0)] wire81;
  reg signed [(3'h4):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg88 = (1'h0);
  reg [(4'hf):(1'h0)] reg89 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg91 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg93 = (1'h0);
  reg [(4'hd):(1'h0)] reg94 = (1'h0);
  assign y = {wire149,
                 wire148,
                 wire147,
                 wire145,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 (1'h0)};
  assign wire81 = (((-$unsigned(wire77[(2'h2):(2'h2)])) ?
                      ($unsigned((wire80 ? wire78 : wire78)) ?
                          {{wire76, (8'ha3)}, (!wire80)} : wire77) : (((wire76 ?
                              wire77 : wire76) ?
                          {wire76} : (^~wire78)) >= (8'h9c))) && (8'h9f));
  assign wire82 = wire81;
  assign wire83 = (~$unsigned(((wire78[(4'ha):(3'h4)] ?
                          (wire77 < wire81) : $unsigned((7'h41))) ?
                      wire77 : (wire79 ? wire79 : {wire78}))));
  assign wire84 = wire78;
  always
    @(posedge clk) begin
      reg85 <= wire84;
      reg86 <= ($signed(wire80[(1'h1):(1'h0)]) || wire81[(4'hf):(1'h0)]);
      reg87 <= (wire78 ?
          (wire83 ?
              (((wire76 | wire84) ?
                      (wire77 ? wire78 : wire82) : $signed((8'ha1))) ?
                  wire84 : ((reg85 >>> (8'hb3)) ?
                      wire84[(3'h4):(2'h3)] : (wire82 ?
                          (8'hbe) : wire77))) : ($signed((reg86 || wire79)) ?
                  $unsigned(reg85[(1'h0):(1'h0)]) : ((~wire77) || (wire76 << wire81)))) : $unsigned((+$unsigned((8'hb1)))));
      if (($signed($signed(wire80)) <= $signed(((+$unsigned(wire82)) + ((wire77 ?
          wire79 : wire83) >>> (wire79 ? (7'h42) : wire82))))))
        begin
          reg88 <= wire78;
        end
      else
        begin
          reg88 <= wire82[(1'h1):(1'h0)];
          if (wire82)
            begin
              reg89 <= (~|((((reg87 ?
                      wire76 : (8'hac)) != wire79[(1'h1):(1'h0)]) + {$unsigned(wire76)}) ?
                  $unsigned(reg86) : $unsigned(((wire80 ? (8'ha5) : reg87) ?
                      $unsigned(wire80) : (wire84 < wire81)))));
              reg90 <= ($signed(wire77) - wire80);
              reg91 <= $unsigned(wire79[(5'h11):(4'ha)]);
            end
          else
            begin
              reg89 <= ($unsigned(wire81[(1'h0):(1'h0)]) ?
                  (!(-(8'haa))) : (wire77[(3'h6):(2'h2)] ? (8'hbf) : wire79));
              reg90 <= reg90[(1'h0):(1'h0)];
              reg91 <= ({$unsigned($signed((+reg87))),
                  (^~(~^reg88[(4'hc):(2'h3)]))} <= ((wire76 && (^wire83)) ?
                  wire81[(4'h8):(2'h2)] : {(8'hba)}));
            end
          reg92 <= (8'hbd);
          reg93 <= $signed(reg91);
          reg94 <= $unsigned($signed(reg91[(1'h1):(1'h1)]));
        end
    end
  assign wire95 = {reg91[(4'he):(1'h1)]};
  assign wire96 = $unsigned((reg93[(2'h2):(1'h0)] ^ wire79[(4'hc):(3'h6)]));
  assign wire97 = (($signed((8'ha0)) ?
                      reg86[(4'h8):(2'h2)] : ($signed($signed(wire77)) ?
                          ($signed(wire79) | wire77[(4'h8):(3'h7)]) : $signed(wire96[(3'h7):(1'h1)]))) >> $unsigned($signed({(^wire78)})));
  assign wire98 = $unsigned(wire82[(1'h0):(1'h0)]);
  assign wire99 = wire95;
  assign wire100 = reg91[(4'hd):(3'h6)];
  assign wire101 = wire83[(4'hc):(3'h5)];
  module102 #() modinst146 (.wire106(wire83), .clk(clk), .wire105(wire96), .wire104(reg90), .wire103(wire99), .y(wire145), .wire107(wire81));
  assign wire147 = (~|(~$unsigned($signed($unsigned((8'ha5))))));
  assign wire148 = reg89;
  assign wire149 = ($unsigned(($unsigned((reg92 - (8'ha5))) ?
                       (wire80[(1'h0):(1'h0)] ?
                           (reg92 != (8'h9d)) : $signed(wire80)) : ($signed((8'h9c)) == (&(8'ha6))))) << wire99);
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h107):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire11;
  input wire signed [(5'h13):(1'h0)] wire10;
  input wire signed [(4'ha):(1'h0)] wire9;
  input wire signed [(4'ha):(1'h0)] wire8;
  input wire signed [(2'h3):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire67;
  wire signed [(5'h11):(1'h0)] wire66;
  wire [(3'h7):(1'h0)] wire65;
  wire [(5'h13):(1'h0)] wire64;
  wire [(3'h6):(1'h0)] wire62;
  wire [(5'h15):(1'h0)] wire26;
  wire signed [(4'h9):(1'h0)] wire25;
  reg [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire62,
                 wire26,
                 wire25,
                 reg68,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg12 <= wire11;
      reg13 <= ($unsigned($signed(($signed(wire10) < {(8'h9e), wire7}))) ?
          ((~^$signed(wire9[(1'h1):(1'h0)])) ?
              $signed({(wire8 ? wire7 : wire11),
                  wire9}) : $signed((wire7[(1'h0):(1'h0)] ?
                  (wire10 ?
                      (8'hac) : (8'hb8)) : wire9[(3'h7):(1'h1)]))) : {wire10[(3'h6):(2'h2)],
              $unsigned($signed((wire7 ? reg12 : reg12)))});
      if ({(wire11[(2'h3):(1'h0)] ?
              wire11[(3'h6):(1'h0)] : ((wire8[(3'h5):(1'h0)] ?
                      (wire9 == wire8) : (!(8'h9f))) ?
                  (!{wire8}) : reg13))})
        begin
          reg14 <= $unsigned((|$signed({(-wire11)})));
          reg15 <= wire7;
          reg16 <= wire8;
          if ((((wire9 ^ $unsigned($unsigned(wire8))) ?
              wire9 : ((-(reg13 ^~ reg14)) ?
                  reg12[(4'ha):(4'h8)] : reg12)) >> reg12[(3'h6):(3'h5)]))
            begin
              reg17 <= $unsigned({$unsigned(wire9),
                  (|$unsigned((reg16 ? wire8 : reg12)))});
              reg18 <= reg16;
              reg19 <= (wire11 >= ((((8'ha0) | $signed(reg12)) ?
                  reg13[(4'h9):(3'h6)] : ((wire8 ?
                      (7'h44) : (8'had)) ~^ ((8'had) ?
                      reg13 : reg12))) < $unsigned(wire11[(3'h5):(2'h2)])));
              reg20 <= $unsigned({((~|(reg15 ? reg15 : reg14)) ~^ (~&(&reg17))),
                  ((8'hb3) == (!$signed((8'hbf))))});
              reg21 <= ($unsigned(wire8) ~^ {reg17});
            end
          else
            begin
              reg17 <= $signed((wire8 ?
                  {(~^$signed(reg12))} : ($unsigned($unsigned(wire8)) ?
                      reg14 : $signed((reg14 ? reg17 : (8'hae))))));
              reg18 <= ((reg12 | (reg15[(3'h6):(1'h0)] != ($unsigned(reg15) ?
                  (+wire8) : reg19[(1'h0):(1'h0)]))) >>> $signed($unsigned(wire11)));
            end
          reg22 <= reg21;
        end
      else
        begin
          reg14 <= (^$signed(reg19));
          reg15 <= $signed(({($signed(reg15) > $signed(reg16))} ?
              (~|$signed({wire9, reg12})) : (-(~$unsigned(reg14)))));
          reg16 <= ({{$unsigned(wire7),
                  ($signed(reg12) ?
                      reg18[(3'h6):(1'h0)] : (wire8 ~^ reg13))}} ~^ (((^~wire10[(2'h3):(1'h0)]) ?
              reg21 : (7'h43)) + $signed(wire11)));
          reg17 <= ({({(reg19 ? reg17 : wire7),
                  (reg22 ? wire11 : (7'h43))} & (((8'ha3) ? reg12 : reg13) ?
                  (~|reg13) : (reg17 ?
                      wire11 : reg12)))} | reg19[(2'h2):(1'h1)]);
          reg18 <= $unsigned((~&(^~(-reg22))));
        end
      reg23 <= wire10[(1'h1):(1'h1)];
      reg24 <= reg22[(1'h0):(1'h0)];
    end
  assign wire25 = $signed((^wire9));
  assign wire26 = $unsigned({reg14, {reg18, wire11[(2'h2):(1'h1)]}});
  module27 #() modinst63 (.wire32(wire26), .wire28(reg15), .wire31(wire10), .wire29(reg14), .wire30(reg18), .clk(clk), .y(wire62));
  assign wire64 = (~&$unsigned($unsigned({reg20[(3'h5):(2'h3)],
                      wire11[(3'h6):(3'h4)]})));
  assign wire65 = $unsigned(({$unsigned((wire64 ? reg17 : wire62)),
                          ((reg21 >> reg15) ? reg18 : ((7'h40) && wire26))} ?
                      $signed((+$unsigned(reg12))) : (($signed((8'hb1)) ?
                              (+wire11) : $unsigned(wire7)) ?
                          $unsigned($unsigned(reg19)) : (+(-(8'hac))))));
  assign wire66 = $signed($unsigned((~|$signed({reg20, reg16}))));
  assign wire67 = $signed(($unsigned((~|wire25)) >> $unsigned(reg16)));
  always
    @(posedge clk) begin
      reg68 <= (-(reg16 ?
          (~wire26[(1'h1):(1'h0)]) : $signed(((^~reg15) ?
              (reg23 ? (8'ha6) : reg13) : wire66[(4'h8):(3'h4)]))));
    end
endmodule

module module27
#(parameter param60 = {(+((&(~^(8'hbd))) != (|(!(8'hbe))))), (({{(7'h44)}} ? ((~^(8'ha4)) + (+(8'ha7))) : (((7'h43) ? (8'hb8) : (8'hac)) & (-(8'ha0)))) ? {((8'hb2) ? ((8'ha0) ? (8'hae) : (8'hbd)) : ((8'ha6) > (8'hb6)))} : (((^(8'had)) ? ((8'ha7) & (8'ha5)) : (8'hb4)) ? (!(&(8'ha9))) : (^(-(8'h9f)))))}, 
parameter param61 = ((param60 * (((param60 ? param60 : param60) ? (param60 ? param60 : param60) : param60) ? (param60 ? param60 : (param60 && param60)) : ((param60 ? param60 : param60) ? param60 : (param60 ? param60 : param60)))) <= (({(param60 ~^ param60)} ? param60 : (~|((8'hb0) ? param60 : param60))) ? {param60} : (~({param60} ? {param60, param60} : {param60, param60})))))
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h152):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire32;
  input wire signed [(5'h13):(1'h0)] wire31;
  input wire signed [(4'hc):(1'h0)] wire30;
  input wire [(3'h6):(1'h0)] wire29;
  input wire signed [(5'h15):(1'h0)] wire28;
  wire [(4'hc):(1'h0)] wire59;
  wire signed [(5'h10):(1'h0)] wire58;
  wire signed [(5'h11):(1'h0)] wire57;
  wire signed [(4'hd):(1'h0)] wire56;
  wire [(4'hd):(1'h0)] wire55;
  wire [(5'h15):(1'h0)] wire54;
  wire signed [(5'h13):(1'h0)] wire53;
  wire signed [(4'hb):(1'h0)] wire51;
  wire signed [(3'h7):(1'h0)] wire50;
  wire [(5'h12):(1'h0)] wire49;
  wire signed [(3'h4):(1'h0)] wire48;
  wire [(2'h3):(1'h0)] wire47;
  wire [(4'hb):(1'h0)] wire46;
  wire signed [(5'h13):(1'h0)] wire40;
  wire [(3'h7):(1'h0)] wire39;
  wire signed [(3'h6):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire35;
  wire [(3'h6):(1'h0)] wire34;
  wire [(4'h9):(1'h0)] wire33;
  reg [(5'h14):(1'h0)] reg52 = (1'h0);
  reg [(3'h7):(1'h0)] reg45 = (1'h0);
  reg signed [(4'he):(1'h0)] reg44 = (1'h0);
  reg [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  reg [(5'h14):(1'h0)] reg41 = (1'h0);
  reg [(5'h13):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  assign y = {wire59,
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
                 wire40,
                 wire39,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg52,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire33 = (($signed($unsigned((wire29 ?
                      wire31 : wire31))) == $unsigned(((wire31 ?
                      wire32 : wire30) && ((8'ha1) >= (8'hab))))) && ({{(wire28 ?
                                  wire30 : wire28),
                              {(8'ha3), wire29}},
                          (wire29 >= wire32)} ?
                      $unsigned(wire32) : ($unsigned((+wire31)) || wire30)));
  assign wire34 = wire29[(2'h3):(2'h2)];
  assign wire35 = (wire34[(3'h6):(3'h4)] <= $unsigned(($unsigned(((8'hae) ?
                          wire30 : wire34)) ?
                      (|wire32[(5'h12):(2'h3)]) : {(wire28 * wire33)})));
  assign wire36 = wire31[(3'h7):(2'h3)];
  always
    @(posedge clk) begin
      reg37 <= wire36[(3'h4):(2'h3)];
      reg38 <= (((~|wire32[(4'h9):(4'h9)]) ?
              $unsigned($unsigned($unsigned(wire35))) : (~^(((7'h40) < wire35) || reg37[(1'h0):(1'h0)]))) ?
          wire29 : wire29[(2'h2):(2'h2)]);
    end
  assign wire39 = $signed({reg38});
  assign wire40 = wire31[(5'h10):(3'h5)];
  always
    @(posedge clk) begin
      reg41 <= ((wire40[(3'h7):(3'h6)] * reg37[(3'h4):(1'h1)]) ?
          $unsigned(($unsigned((^wire33)) + {(~&wire28),
              wire34[(2'h3):(2'h2)]})) : (8'ha5));
      reg42 <= {wire29};
      reg43 <= wire33[(4'h9):(4'h8)];
      reg44 <= (wire29[(3'h5):(3'h4)] + wire32[(1'h0):(1'h0)]);
      reg45 <= (^~((reg41[(2'h3):(1'h1)] ?
          ($signed(reg41) - wire29[(1'h1):(1'h0)]) : wire29[(1'h1):(1'h0)]) >> $unsigned((!$signed(wire30)))));
    end
  assign wire46 = (^wire28[(2'h3):(2'h2)]);
  assign wire47 = wire34[(2'h3):(2'h2)];
  assign wire48 = {(-(reg38 + ($signed(wire35) && $unsigned(reg44))))};
  assign wire49 = wire33[(4'h8):(4'h8)];
  assign wire50 = (((~|((wire31 ? reg43 : (8'hb0)) ?
                          $signed((8'hb6)) : (~|reg43))) ?
                      $signed(reg38) : wire39[(3'h6):(1'h0)]) <<< {{wire28[(4'hb):(2'h2)]}});
  assign wire51 = ({wire36, $signed((8'hab))} ?
                      $signed((((~reg38) ? reg38 : $signed(wire47)) ?
                          $unsigned(wire47) : $signed($unsigned(reg44)))) : (8'hb7));
  always
    @(posedge clk) begin
      reg52 <= $unsigned((8'hae));
    end
  assign wire53 = wire40;
  assign wire54 = (^~(reg38 >= {$signed($signed((8'h9f)))}));
  assign wire55 = wire54;
  assign wire56 = {$signed($unsigned((~|{wire29, wire48}))),
                      ((($unsigned(wire49) >= {wire33, reg42}) && {(^(8'hb6)),
                          {reg37, wire28}}) << wire49)};
  assign wire57 = $signed(((8'hb2) != ($signed(wire55) ?
                      ($unsigned(wire40) >= (reg42 ?
                          wire40 : reg44)) : $signed($signed(wire33)))));
  assign wire58 = wire29[(3'h4):(1'h1)];
  assign wire59 = ({$signed(wire30[(3'h6):(2'h2)])} <= $signed($signed((((8'h9d) ?
                      wire29 : (8'hb5)) + (^~wire34)))));
endmodule

module module102  (y, clk, wire107, wire106, wire105, wire104, wire103);
  output wire [(32'h1d5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire107;
  input wire signed [(5'h10):(1'h0)] wire106;
  input wire signed [(4'hf):(1'h0)] wire105;
  input wire signed [(2'h2):(1'h0)] wire104;
  input wire signed [(3'h7):(1'h0)] wire103;
  wire signed [(4'hc):(1'h0)] wire144;
  wire signed [(4'hd):(1'h0)] wire143;
  wire signed [(5'h14):(1'h0)] wire142;
  wire [(4'h9):(1'h0)] wire141;
  wire signed [(5'h14):(1'h0)] wire140;
  wire [(5'h11):(1'h0)] wire139;
  wire signed [(3'h5):(1'h0)] wire138;
  wire signed [(4'hc):(1'h0)] wire127;
  wire signed [(4'he):(1'h0)] wire126;
  wire [(4'ha):(1'h0)] wire125;
  wire [(3'h4):(1'h0)] wire121;
  wire [(4'ha):(1'h0)] wire111;
  wire [(5'h14):(1'h0)] wire110;
  wire [(5'h14):(1'h0)] wire109;
  wire [(4'he):(1'h0)] wire108;
  reg [(5'h12):(1'h0)] reg137 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg135 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg132 = (1'h0);
  reg [(4'hd):(1'h0)] reg131 = (1'h0);
  reg [(4'h8):(1'h0)] reg130 = (1'h0);
  reg signed [(4'he):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg128 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg123 = (1'h0);
  reg [(5'h11):(1'h0)] reg122 = (1'h0);
  reg [(4'hd):(1'h0)] reg120 = (1'h0);
  reg [(4'h9):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg117 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg115 = (1'h0);
  reg [(4'hf):(1'h0)] reg114 = (1'h0);
  reg [(2'h3):(1'h0)] reg113 = (1'h0);
  reg [(5'h12):(1'h0)] reg112 = (1'h0);
  assign y = {wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire127,
                 wire126,
                 wire125,
                 wire121,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg124,
                 reg123,
                 reg122,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 (1'h0)};
  assign wire108 = ($signed(wire107[(4'hb):(1'h1)]) ?
                       {$signed(wire106[(3'h6):(3'h6)]),
                           (($unsigned(wire105) <= (wire103 >>> wire107)) ?
                               $signed(wire103) : (wire105 - wire105[(4'hb):(1'h0)]))} : (^wire103[(3'h4):(2'h2)]));
  assign wire109 = $signed(wire106[(4'he):(4'hd)]);
  assign wire110 = (~^$unsigned(wire106[(3'h4):(2'h3)]));
  assign wire111 = $unsigned(wire105);
  always
    @(posedge clk) begin
      reg112 <= ((wire106[(4'h9):(2'h2)] == (($signed((7'h44)) >= $signed(wire108)) ?
              (8'h9d) : {(wire111 ^~ wire105)})) ?
          ($unsigned(wire104[(2'h2):(1'h0)]) - $unsigned({(&wire106),
              (wire110 ?
                  wire106 : wire110)})) : $unsigned(((^~(wire104 ~^ wire109)) >>> $unsigned($signed(wire107)))));
      reg113 <= (wire104[(1'h0):(1'h0)] ?
          (wire105[(4'ha):(3'h5)] ?
              wire107[(2'h2):(1'h0)] : $unsigned($signed(wire107[(4'h8):(1'h1)]))) : (^$unsigned(((wire107 + wire111) ?
              {wire108, wire103} : (wire108 == wire111)))));
      reg114 <= ((8'ha7) ? wire110 : wire108);
      reg115 <= wire103;
      if ((|{reg113}))
        begin
          reg116 <= $signed(wire105[(4'h8):(2'h3)]);
          reg117 <= $signed((~(((reg112 ? (8'hac) : wire111) ?
                  ((8'hb0) * wire104) : {reg112}) ?
              $signed(reg112) : wire111)));
          reg118 <= $signed(((^~reg117) > ($unsigned({(8'hbc), wire110}) ?
              (reg116[(4'h8):(4'h8)] ^~ reg112) : $signed(((7'h44) >>> reg112)))));
          reg119 <= wire107;
          reg120 <= $signed((-reg113));
        end
      else
        begin
          reg116 <= ({{$unsigned(((8'ha6) << reg118)),
                      (&(reg114 ? wire110 : wire109))},
                  $signed((~^wire108))} ?
              reg116 : (~$unsigned($unsigned({reg119}))));
        end
    end
  assign wire121 = (~&(~^$unsigned((^~wire110[(4'h9):(1'h1)]))));
  always
    @(posedge clk) begin
      reg122 <= $unsigned(reg113);
      reg123 <= reg112;
      reg124 <= $unsigned(((^~$unsigned($unsigned(reg118))) ?
          $unsigned(($signed(wire107) >> $unsigned(reg113))) : $unsigned(((reg122 ?
                  reg118 : reg119) ?
              (wire103 ^~ wire110) : (reg113 ~^ reg115)))));
    end
  assign wire125 = {(~^$signed((wire105 ?
                           reg117 : (reg115 ? wire108 : reg124)))),
                       (~&$unsigned(({wire121, wire109} ^~ (wire109 ?
                           wire109 : wire103))))};
  assign wire126 = $unsigned(reg116);
  assign wire127 = $unsigned($unsigned({(wire121 ~^ (wire103 * wire111))}));
  always
    @(posedge clk) begin
      reg128 <= ({{{(reg114 <= reg116)}, (^reg120[(4'ha):(1'h0)])},
          ((^{reg114, wire125}) ?
              $unsigned((^wire127)) : $unsigned($unsigned(reg116)))} >>> wire107);
      reg129 <= reg114[(3'h7):(1'h0)];
      reg130 <= reg117;
      if ({$unsigned(wire106[(3'h7):(1'h1)])})
        begin
          reg131 <= ($unsigned($unsigned(($unsigned(reg120) <<< (reg115 >>> wire121)))) ?
              {($signed($unsigned(wire104)) ?
                      ($unsigned(wire105) ?
                          $unsigned(reg119) : (wire106 ?
                              wire110 : reg128)) : $unsigned({reg118}))} : ((~&((wire106 ^ reg115) >>> (reg128 < wire125))) ^~ (^~$unsigned(((7'h41) ?
                  (8'hb1) : (8'hba))))));
          reg132 <= (7'h43);
          reg133 <= ({(~^wire111[(2'h3):(2'h3)])} ?
              {((wire110 ? $signed(wire121) : reg114) ?
                      (~^reg114) : ($signed(wire103) - (reg118 ?
                          wire106 : wire121)))} : $signed($unsigned({(~&reg123)})));
        end
      else
        begin
          reg131 <= reg112[(4'h8):(1'h0)];
          if ((((wire111 + {wire127[(3'h7):(3'h5)]}) ?
                  reg123[(5'h13):(4'hf)] : reg116[(4'h8):(4'h8)]) ?
              {((8'hb6) >>> $unsigned((wire127 && reg123))),
                  reg124} : $unsigned((wire105 ?
                  $signed($signed((8'ha6))) : reg117))))
            begin
              reg132 <= (~$signed(wire125));
              reg133 <= ((~|$signed((reg117 ?
                  wire107 : $signed(reg113)))) | (reg133[(4'hc):(3'h7)] < reg131));
            end
          else
            begin
              reg132 <= reg118;
              reg133 <= $signed($signed($signed($signed((reg123 ^~ reg116)))));
              reg134 <= (-$unsigned((reg115[(3'h4):(3'h4)] ?
                  ($unsigned(wire103) ?
                      (~|reg119) : (wire125 ?
                          reg131 : reg128)) : wire104[(2'h2):(1'h1)])));
              reg135 <= wire109;
              reg136 <= reg112[(5'h12):(1'h1)];
            end
        end
      reg137 <= $unsigned($signed($unsigned((-(wire103 ? (8'h9e) : reg120)))));
    end
  assign wire138 = $signed((^wire103));
  assign wire139 = (7'h41);
  assign wire140 = $signed({wire125[(3'h5):(3'h4)]});
  assign wire141 = ($unsigned(reg129) && ($unsigned(((^~reg137) ?
                           reg134[(4'h8):(2'h3)] : (reg123 ?
                               reg130 : reg115))) ?
                       ((~&reg129) < reg128[(4'he):(4'hb)]) : (~^$unsigned(wire121))));
  assign wire142 = (wire106[(4'hb):(3'h5)] != ($signed(wire125) ?
                       (wire103[(3'h6):(3'h4)] ?
                           reg133 : $signed($signed(reg131))) : $signed(((~&reg118) ?
                           (wire109 ? wire121 : (8'h9c)) : (8'h9c)))));
  assign wire143 = $unsigned($unsigned($signed((~$unsigned((7'h41))))));
  assign wire144 = (~^wire142[(4'ha):(2'h2)]);
endmodule
