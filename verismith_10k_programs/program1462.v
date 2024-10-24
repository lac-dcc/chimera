module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h305):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire200;
  wire signed [(4'he):(1'h0)] wire177;
  wire signed [(4'h9):(1'h0)] wire176;
  wire [(2'h3):(1'h0)] wire175;
  wire [(3'h4):(1'h0)] wire173;
  wire signed [(4'hb):(1'h0)] wire172;
  wire [(4'hc):(1'h0)] wire170;
  wire [(4'hc):(1'h0)] wire119;
  wire [(5'h13):(1'h0)] wire106;
  wire [(5'h15):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire4;
  reg [(3'h7):(1'h0)] reg220 = (1'h0);
  reg [(4'h9):(1'h0)] reg219 = (1'h0);
  reg signed [(4'he):(1'h0)] reg218 = (1'h0);
  reg [(5'h12):(1'h0)] reg217 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg216 = (1'h0);
  reg [(4'he):(1'h0)] reg215 = (1'h0);
  reg [(4'hc):(1'h0)] reg214 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg213 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg212 = (1'h0);
  reg [(4'h9):(1'h0)] reg211 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg210 = (1'h0);
  reg [(5'h15):(1'h0)] reg209 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg208 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg207 = (1'h0);
  reg [(3'h4):(1'h0)] reg206 = (1'h0);
  reg [(4'hf):(1'h0)] reg205 = (1'h0);
  reg [(3'h4):(1'h0)] reg204 = (1'h0);
  reg [(4'hf):(1'h0)] reg203 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg202 = (1'h0);
  reg [(5'h13):(1'h0)] reg201 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg199 = (1'h0);
  reg [(3'h6):(1'h0)] reg198 = (1'h0);
  reg [(5'h11):(1'h0)] reg197 = (1'h0);
  reg [(4'h8):(1'h0)] reg196 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg195 = (1'h0);
  reg signed [(4'he):(1'h0)] reg194 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg193 = (1'h0);
  reg [(3'h6):(1'h0)] reg192 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg189 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg188 = (1'h0);
  reg [(5'h10):(1'h0)] reg187 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg185 = (1'h0);
  reg [(3'h5):(1'h0)] reg184 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg183 = (1'h0);
  reg [(4'hd):(1'h0)] reg182 = (1'h0);
  reg [(4'hf):(1'h0)] reg181 = (1'h0);
  reg [(4'hf):(1'h0)] reg180 = (1'h0);
  reg [(5'h13):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg178 = (1'h0);
  reg [(2'h2):(1'h0)] reg108 = (1'h0);
  reg [(4'h9):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg110 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg111 = (1'h0);
  reg [(4'hd):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg114 = (1'h0);
  reg [(5'h13):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg116 = (1'h0);
  reg [(4'hd):(1'h0)] reg117 = (1'h0);
  reg [(5'h14):(1'h0)] reg118 = (1'h0);
  assign y = {wire200,
                 wire177,
                 wire176,
                 wire175,
                 wire173,
                 wire172,
                 wire170,
                 wire119,
                 wire106,
                 wire5,
                 wire4,
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
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 reg112,
                 reg113,
                 reg114,
                 reg115,
                 reg116,
                 reg117,
                 reg118,
                 (1'h0)};
  assign wire4 = (~&wire1[(4'hc):(1'h1)]);
  assign wire5 = wire3[(4'hc):(3'h7)];
  module6 #() modinst107 (.wire8(wire3), .y(wire106), .wire7(wire5), .clk(clk), .wire9(wire1), .wire10(wire4));
  always
    @(posedge clk) begin
      if ({(~|{wire5[(1'h1):(1'h1)]})})
        begin
          reg108 <= $signed(wire1);
          reg109 <= {wire106[(1'h0):(1'h0)], reg108[(2'h2):(1'h0)]};
          reg110 <= $signed({$signed($unsigned((wire1 ? reg108 : wire0))),
              {(~|wire0)}});
          if ($signed($unsigned($signed(wire106))))
            begin
              reg111 <= (-wire2);
              reg112 <= wire4[(4'he):(2'h3)];
              reg113 <= (((~(!wire4)) < wire3[(4'ha):(4'h8)]) ^ $unsigned($signed((8'hb1))));
              reg114 <= ((~&reg111[(2'h3):(2'h2)]) ?
                  ($unsigned(reg109) <= wire0) : $unsigned({$unsigned($unsigned(reg111)),
                      $unsigned({reg112, (8'hbe)})}));
            end
          else
            begin
              reg111 <= ((+wire3[(3'h5):(1'h0)]) ?
                  (($signed({wire3}) ?
                      reg113 : $signed($unsigned(wire0))) <= ($signed((&wire5)) >= ((reg109 ?
                      wire2 : reg111) + $unsigned((7'h40))))) : $unsigned(reg113));
            end
          reg115 <= (reg111 >>> {$signed((~{wire3})), wire0[(3'h4):(2'h2)]});
        end
      else
        begin
          if ({wire1[(3'h4):(1'h1)], (~$unsigned(wire106[(1'h1):(1'h1)]))})
            begin
              reg108 <= (-$unsigned(($signed((~|wire2)) ?
                  $signed(wire2[(3'h5):(1'h1)]) : reg111)));
            end
          else
            begin
              reg108 <= $signed(reg113);
              reg109 <= $unsigned(reg111);
            end
        end
      reg116 <= ((wire0[(4'hb):(4'h9)] ? {reg108} : reg113) ?
          (!((~(reg112 ^ reg115)) >> ((reg112 < reg109) || $unsigned(wire2)))) : ((8'ha5) ^ reg115[(3'h6):(2'h2)]));
      reg117 <= {(wire2 * $signed($unsigned({wire106, reg108}))),
          $unsigned((-$signed((wire4 ? reg114 : wire3))))};
      reg118 <= (wire106[(2'h2):(1'h1)] != reg114);
    end
  assign wire119 = reg113[(3'h5):(2'h3)];
  module120 #() modinst171 (wire170, clk, reg118, wire2, wire106, wire3, wire5);
  assign wire172 = reg117;
  module22 #() modinst174 (wire173, clk, reg110, wire5, wire170, reg111);
  assign wire175 = {$signed(reg113), $unsigned(wire172[(4'h9):(3'h7)])};
  assign wire176 = ((~((((8'ha8) ? reg117 : (8'ha6)) && ((8'haa) ?
                               wire172 : reg108)) ?
                           wire170 : (8'hb3))) ?
                       (wire0[(3'h7):(3'h5)] != $unsigned($signed($signed((8'hb8))))) : wire119[(1'h0):(1'h0)]);
  assign wire177 = reg111[(4'ha):(4'h8)];
  always
    @(posedge clk) begin
      if (wire119)
        begin
          reg178 <= $unsigned($unsigned((($signed(reg116) ?
              (wire175 ? reg113 : reg114) : (reg109 ?
                  wire170 : (7'h40))) ~^ wire3[(4'hc):(2'h3)])));
          if ({(~|((|((8'ha2) <= wire173)) ^~ {(^~reg113)}))})
            begin
              reg179 <= reg116;
              reg180 <= $unsigned(wire0[(4'h9):(3'h4)]);
              reg181 <= $unsigned($unsigned({$signed(reg116)}));
              reg182 <= reg117[(4'hb):(3'h5)];
              reg183 <= (reg178 ?
                  ((~($unsigned(reg112) ?
                      reg179[(4'hb):(4'h9)] : (~&wire0))) | {wire172,
                      reg112[(3'h7):(3'h4)]}) : reg111);
            end
          else
            begin
              reg179 <= $signed(reg116[(4'h9):(1'h1)]);
            end
          reg184 <= reg109;
          reg185 <= $signed($signed(reg112));
          reg186 <= ($signed($unsigned((~(reg178 ~^ wire177)))) ?
              (reg180[(1'h1):(1'h1)] + (^{(~reg114),
                  reg114[(4'hd):(4'hd)]})) : (($unsigned({(8'hab)}) > (reg180[(3'h6):(2'h3)] ?
                      (reg116 || reg116) : {(8'had)})) ?
                  $unsigned(wire175) : $unsigned((~|$signed(wire5)))));
        end
      else
        begin
          if ($signed(reg112))
            begin
              reg178 <= $signed($signed($signed(wire0[(4'ha):(4'h8)])));
              reg179 <= ({((!(wire2 ?
                      reg113 : wire173)) >= (reg118[(2'h2):(1'h1)] ?
                      $signed(reg181) : (wire2 >= reg182))),
                  reg182} & wire175);
              reg180 <= {(wire4 <= $signed($unsigned($unsigned((8'hb1)))))};
              reg181 <= (~&wire0[(2'h3):(2'h3)]);
              reg182 <= $signed((|(~|$unsigned((~&wire0)))));
            end
          else
            begin
              reg178 <= (+wire173[(1'h0):(1'h0)]);
              reg179 <= $unsigned(reg180[(1'h0):(1'h0)]);
              reg180 <= $signed(wire106);
            end
        end
      if ((wire175 | (~|reg108)))
        begin
          reg187 <= $signed((~(reg180 ?
              wire119[(4'h9):(2'h3)] : wire176[(3'h4):(2'h3)])));
        end
      else
        begin
          reg187 <= ((~|(~|$unsigned((wire173 ?
              (8'hae) : reg111)))) * ((wire5[(3'h6):(3'h5)] ?
              $unsigned(reg115) : wire2[(2'h3):(1'h1)]) >= $unsigned($unsigned({(8'hb0),
              reg110}))));
          reg188 <= $unsigned($signed(reg114));
          reg189 <= $unsigned($unsigned(wire3));
          reg190 <= (reg118[(5'h12):(3'h7)] ?
              (^~$unsigned($unsigned(((8'hb3) ?
                  wire177 : wire173)))) : (~^wire177[(1'h1):(1'h0)]));
        end
      if ((wire175 ~^ (reg115[(4'hb):(3'h7)] <= $signed(reg109[(3'h4):(3'h4)]))))
        begin
          reg191 <= reg190;
          reg192 <= (8'hbc);
          reg193 <= $unsigned(wire170[(2'h2):(2'h2)]);
        end
      else
        begin
          if (wire1)
            begin
              reg191 <= reg185;
              reg192 <= reg178[(3'h5):(2'h2)];
              reg193 <= reg116;
              reg194 <= wire170[(4'h8):(3'h7)];
              reg195 <= wire119[(2'h2):(1'h1)];
            end
          else
            begin
              reg191 <= $unsigned((~|reg108[(1'h1):(1'h0)]));
              reg192 <= $signed((~|reg112));
              reg193 <= (wire106 + $signed((~(8'hbc))));
              reg194 <= ((~$unsigned($signed(reg182[(1'h0):(1'h0)]))) ?
                  ((~^reg194[(3'h5):(2'h3)]) ?
                      (wire4[(3'h6):(1'h1)] ?
                          reg186[(3'h4):(3'h4)] : (8'h9d)) : $unsigned(((~^(7'h40)) << ((8'hb8) ?
                          reg116 : reg109)))) : (~reg181[(3'h7):(3'h4)]));
            end
          reg196 <= (reg191[(2'h2):(1'h0)] ^ reg185);
          reg197 <= ((~^(((wire3 ? reg180 : wire177) ?
                  wire4[(4'hd):(4'hc)] : (reg184 ? reg113 : reg185)) ?
              ({reg190} ~^ reg193) : reg108)) * ({reg116[(4'hc):(1'h0)],
                  ((reg189 ~^ reg114) >>> wire175[(1'h1):(1'h0)])} ?
              $signed({(reg187 > wire106),
                  (reg115 ? wire5 : wire119)}) : {($unsigned(reg108) ?
                      reg118[(3'h6):(2'h2)] : {reg185}),
                  $unsigned({reg108, reg113})}));
          if (wire106)
            begin
              reg198 <= $signed($unsigned($signed($unsigned({reg197}))));
            end
          else
            begin
              reg198 <= reg185;
            end
        end
      reg199 <= (($unsigned($unsigned(reg116[(1'h1):(1'h0)])) << ({$unsigned(reg192)} > $unsigned(wire1))) > reg111[(1'h0):(1'h0)]);
    end
  assign wire200 = ((-$unsigned($signed((reg197 & reg118)))) || $unsigned(($unsigned(reg190) << {$signed(reg113),
                       $unsigned((8'ha5))})));
  always
    @(posedge clk) begin
      reg201 <= ((-($signed((+wire119)) ?
              ($unsigned(reg181) > $unsigned(reg186)) : $signed((~wire173)))) ?
          $signed($signed(((reg114 ?
              wire170 : reg187) * wire176[(3'h6):(1'h0)]))) : $signed((~&reg188[(3'h4):(3'h4)])));
      if ((wire1[(4'hc):(3'h5)] * ((((wire5 | reg190) * $signed((8'ha7))) ~^ (wire3[(3'h6):(1'h1)] ?
          $signed(reg109) : (reg195 ?
              reg185 : reg188))) == (($unsigned((8'hba)) < wire200) | {{reg116},
          (8'hbf)}))))
        begin
          reg202 <= ({(reg108[(1'h1):(1'h0)] ?
                      ((reg195 >= (8'ha9)) ?
                          wire175 : (|(8'hb6))) : $unsigned(reg188[(3'h5):(3'h4)]))} ?
              reg186[(1'h0):(1'h0)] : $signed(reg182));
          reg203 <= $signed(((|wire175) == $signed($unsigned((reg189 ?
              reg201 : wire172)))));
          reg204 <= wire172;
          reg205 <= (~&$unsigned(({reg179} ^ {$signed(wire170)})));
        end
      else
        begin
          reg202 <= ((($signed($unsigned(reg185)) ?
                  $signed((|wire3)) : ((~|reg182) ?
                      (wire176 <= reg181) : $unsigned(reg188))) ?
              reg115 : ($signed($signed(wire170)) >= (+(reg193 ^ reg191)))) ^~ $unsigned(reg201));
          if (reg185[(3'h7):(2'h3)])
            begin
              reg203 <= (wire4[(1'h1):(1'h0)] - wire176[(3'h7):(3'h4)]);
              reg204 <= wire170;
            end
          else
            begin
              reg203 <= ($signed(reg205) ~^ $unsigned(((+$signed(reg203)) ?
                  (wire2 ?
                      $signed(reg204) : ((8'h9e) ?
                          (8'ha8) : reg205)) : reg109)));
            end
        end
      if ((~^$signed((|$unsigned((|(8'hb1)))))))
        begin
          reg206 <= $unsigned(((!wire170) <<< $unsigned(wire177)));
        end
      else
        begin
          reg206 <= $signed((reg113 ?
              (^~(reg183[(1'h1):(1'h0)] ?
                  reg116[(4'hc):(3'h4)] : (reg190 ?
                      (8'haf) : wire1))) : (!$unsigned($signed(reg116)))));
          reg207 <= reg203[(1'h1):(1'h0)];
        end
      if (reg186[(3'h4):(1'h0)])
        begin
          if (reg116[(1'h0):(1'h0)])
            begin
              reg208 <= (~|$signed(({wire172} ?
                  reg186[(2'h2):(1'h0)] : reg198)));
              reg209 <= reg201;
              reg210 <= (~|(&($unsigned(reg190[(5'h12):(4'hd)]) <<< ($signed(wire2) - reg195))));
              reg211 <= (|(-reg198[(3'h6):(1'h1)]));
            end
          else
            begin
              reg208 <= (&{($signed(reg187[(3'h6):(1'h1)]) * ((8'ha4) >= wire4[(4'h9):(2'h3)])),
                  (~|reg192)});
              reg209 <= ($signed((|(&(reg191 >>> reg209)))) & (wire200[(2'h2):(1'h0)] ?
                  {(wire3[(4'h8):(3'h6)] ?
                          $signed(reg201) : reg198[(3'h4):(2'h2)])} : reg184[(3'h5):(3'h5)]));
              reg210 <= (($unsigned(reg201[(5'h13):(4'h9)]) ?
                  (wire1 <= (wire172[(3'h7):(3'h7)] ?
                      $unsigned(reg202) : $unsigned(reg193))) : ($unsigned(reg210) && wire2[(2'h3):(1'h1)])) == (wire0[(4'hd):(4'h9)] ?
                  (~|(((8'hac) ? (7'h40) : reg210) ?
                      wire106 : (reg116 == reg204))) : reg209[(4'hb):(4'h8)]));
              reg211 <= (~reg110);
            end
          if (reg182[(3'h4):(2'h3)])
            begin
              reg212 <= $unsigned(wire173[(1'h1):(1'h1)]);
              reg213 <= $unsigned(wire1);
              reg214 <= $signed(($unsigned(reg199) ?
                  $signed(reg211[(3'h4):(3'h4)]) : ({(!reg211),
                      reg112} < wire2)));
              reg215 <= $unsigned($signed(reg116[(1'h0):(1'h0)]));
            end
          else
            begin
              reg212 <= {(8'hbf),
                  ($unsigned(((reg186 >>> wire1) ?
                      (-reg208) : ((8'hb3) | (8'haa)))) | reg196[(3'h6):(3'h5)])};
              reg213 <= wire1;
              reg214 <= (reg109[(1'h1):(1'h0)] - $unsigned(wire172[(3'h5):(1'h1)]));
            end
          reg216 <= ((reg179[(5'h13):(5'h13)] ^~ reg108[(1'h1):(1'h1)]) ?
              (($unsigned(reg118) ?
                      $unsigned((reg208 ?
                          reg181 : wire1)) : {$unsigned(wire173),
                          (reg214 <= (7'h41))}) ?
                  {$signed((^~(8'ha1)))} : $signed($signed(reg194[(4'h8):(3'h7)]))) : (+((~|(reg109 ?
                  reg109 : reg203)) & reg187)));
        end
      else
        begin
          if ((-{(!(reg205 >>> (wire2 * reg211))), reg211[(3'h5):(2'h2)]}))
            begin
              reg208 <= (~^(~|wire119[(4'h8):(3'h7)]));
              reg209 <= ((!(^({reg118} && $signed(reg207)))) <<< (($signed((~^reg201)) >> $signed(reg208[(4'hf):(2'h2)])) >>> ((reg180[(4'hc):(2'h3)] ?
                  $unsigned((7'h41)) : $unsigned(reg216)) && $signed(((8'ha7) ?
                  (8'hb4) : reg185)))));
              reg210 <= reg191[(3'h6):(3'h4)];
              reg211 <= $unsigned((^$signed($unsigned((reg109 == wire106)))));
            end
          else
            begin
              reg208 <= (~^reg188[(4'h8):(3'h7)]);
              reg209 <= ((wire177[(3'h7):(3'h5)] * $signed({reg192[(2'h2):(2'h2)],
                  reg207[(1'h1):(1'h1)]})) == wire2[(3'h7):(3'h6)]);
              reg210 <= (~reg180);
              reg211 <= (($unsigned((^~(~wire200))) > reg198) << $unsigned(reg112));
            end
          reg212 <= (!$unsigned(wire106));
          reg213 <= $signed(((&(reg191 ^ (^~wire170))) ?
              ($unsigned(reg115[(5'h10):(1'h1)]) ?
                  reg108[(2'h2):(2'h2)] : ((reg111 ? reg118 : reg190) ?
                      (wire106 ?
                          reg215 : wire3) : reg203)) : $signed($signed(reg211[(2'h2):(1'h1)]))));
          reg214 <= (~|(((8'ha5) || wire5) <= $unsigned((reg216 ?
              (^~reg192) : (^~reg207)))));
        end
      if (wire1)
        begin
          reg217 <= wire173[(3'h4):(1'h1)];
          reg218 <= (((8'ha7) ?
                  ((~&(-reg184)) ?
                      $signed((reg209 || reg109)) : wire1) : $signed(($unsigned(wire172) && $signed(reg208)))) ?
              reg213[(5'h11):(4'ha)] : (($signed({(8'hbe)}) - $signed($signed((7'h40)))) != reg118[(3'h4):(3'h4)]));
          reg219 <= wire172;
          reg220 <= (-(wire5 || {(^~(reg209 ? wire4 : (8'ha7)))}));
        end
      else
        begin
          reg217 <= $signed((!reg220));
          reg218 <= ($unsigned(reg203[(1'h0):(1'h0)]) * ({((reg187 * reg115) << (reg199 >= reg201))} > (reg112[(3'h4):(2'h2)] ?
              ($unsigned((8'hb8)) ?
                  {(8'hb3)} : (reg112 ?
                      reg188 : (8'ha0))) : {$signed(reg197)})));
          if (reg116)
            begin
              reg219 <= reg214[(4'hc):(3'h5)];
              reg220 <= reg210[(4'hc):(4'ha)];
            end
          else
            begin
              reg219 <= (!reg220[(3'h4):(1'h0)]);
            end
        end
    end
endmodule

module module120
#(parameter param169 = ((+((^~((8'ha1) ^~ (7'h43))) <= (^~((8'haf) + (7'h41))))) * (((~^((7'h43) ? (8'hba) : (8'ha1))) != (&{(8'ha7)})) == ((((8'hae) ? (8'ha4) : (7'h41)) * ((8'ha5) > (7'h41))) ? (~(!(8'ha8))) : ((~(8'hbe)) ? (-(8'hb7)) : ((8'haa) & (8'haf)))))))
(y, clk, wire121, wire122, wire123, wire124, wire125);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire121;
  input wire [(4'hd):(1'h0)] wire122;
  input wire signed [(5'h13):(1'h0)] wire123;
  input wire signed [(4'h8):(1'h0)] wire124;
  input wire signed [(5'h15):(1'h0)] wire125;
  wire signed [(4'h8):(1'h0)] wire131;
  wire signed [(5'h12):(1'h0)] wire132;
  wire signed [(4'hd):(1'h0)] wire133;
  wire signed [(4'h8):(1'h0)] wire134;
  wire signed [(4'hc):(1'h0)] wire167;
  reg [(5'h12):(1'h0)] reg130 = (1'h0);
  reg [(4'hb):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg128 = (1'h0);
  reg [(4'hd):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg126 = (1'h0);
  assign y = {wire131,
                 wire132,
                 wire133,
                 wire134,
                 wire167,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg126 <= $signed($unsigned(wire122));
      reg127 <= wire125[(3'h7):(2'h2)];
      reg128 <= wire122[(4'hb):(3'h7)];
      reg129 <= (^(!(^~{wire123[(3'h4):(2'h2)], (8'hb4)})));
      reg130 <= wire124[(3'h7):(2'h2)];
    end
  assign wire131 = (reg127[(4'hd):(4'h9)] ?
                       {(-wire124[(3'h7):(3'h6)]),
                           reg128} : (wire121[(3'h6):(2'h2)] ?
                           (((~wire123) ?
                               reg126[(5'h11):(3'h7)] : ((8'ha4) ?
                                   wire121 : wire125)) >> $signed(reg130)) : $signed((~^$unsigned(reg127)))));
  assign wire132 = ((8'hae) ?
                       ($signed((~&(wire124 && wire124))) == $signed(reg130)) : (wire122[(1'h1):(1'h0)] ?
                           ($unsigned(((8'hb4) ? reg126 : reg128)) ?
                               reg127 : {(reg127 ?
                                       wire122 : reg126)}) : $signed(wire121)));
  assign wire133 = $unsigned(reg130);
  assign wire134 = (reg130 <<< {$unsigned($signed(wire124[(3'h6):(1'h1)])),
                       (reg129[(2'h3):(1'h0)] ?
                           ($signed(wire133) + wire121) : {$unsigned(wire133)})});
  module135 #() modinst168 (wire167, clk, wire125, wire133, wire122, reg126, reg129);
endmodule

module module6
#(parameter param104 = (((^~((~|(8'hba)) | ((8'hb5) ? (8'h9d) : (7'h44)))) != (8'hba)) ? ((((8'hb3) || ((8'hb3) ~^ (8'ha2))) ? ({(8'h9c)} ? (&(7'h40)) : ((8'hab) ? (8'h9c) : (8'hac))) : (~^{(8'ha9), (8'ha5)})) & ((^((7'h40) <<< (7'h42))) + (((8'hae) >= (8'ha7)) >> (~(7'h43))))) : (|(&(((8'hb8) <= (8'h9e)) | {(8'ha4)})))), 
parameter param105 = ((&(!(^~(param104 && param104)))) ? param104 : {param104, (param104 + param104)}))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h15a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire signed [(4'hb):(1'h0)] wire8;
  input wire signed [(4'hc):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire103;
  wire [(5'h10):(1'h0)] wire102;
  wire signed [(4'hc):(1'h0)] wire101;
  wire signed [(4'hf):(1'h0)] wire100;
  wire signed [(4'hb):(1'h0)] wire99;
  wire [(3'h6):(1'h0)] wire98;
  wire signed [(3'h5):(1'h0)] wire39;
  wire [(2'h2):(1'h0)] wire21;
  wire [(2'h2):(1'h0)] wire45;
  wire [(2'h3):(1'h0)] wire49;
  wire signed [(4'h9):(1'h0)] wire50;
  wire signed [(4'h9):(1'h0)] wire51;
  wire signed [(3'h6):(1'h0)] wire52;
  wire signed [(4'hd):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire54;
  wire [(5'h11):(1'h0)] wire96;
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg47 = (1'h0);
  reg [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(3'h6):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire39,
                 wire21,
                 wire45,
                 wire49,
                 wire50,
                 wire51,
                 wire52,
                 wire53,
                 wire54,
                 wire96,
                 reg48,
                 reg47,
                 reg46,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= $signed(((~|$unsigned((!(8'ha4)))) > (~$unsigned((|wire7)))));
      if (wire8[(4'ha):(4'h8)])
        begin
          if ($unsigned(({(((8'hba) > wire9) <= (wire9 ? (8'hac) : wire10))} ?
              wire8 : wire10[(4'hb):(3'h7)])))
            begin
              reg12 <= (($unsigned(wire10) >> (&wire8)) >> $signed($signed(reg11)));
              reg13 <= $unsigned(wire8[(1'h0):(1'h0)]);
              reg14 <= $signed(reg11[(5'h11):(3'h5)]);
              reg15 <= wire9[(4'h9):(2'h2)];
            end
          else
            begin
              reg12 <= (^reg15);
              reg13 <= reg15[(3'h5):(1'h1)];
            end
          reg16 <= (!((~|reg13) ?
              $unsigned($signed((wire7 - (8'hb2)))) : reg11[(3'h6):(3'h6)]));
          reg17 <= wire7;
          if ($unsigned((reg17[(1'h1):(1'h1)] ?
              $signed(($unsigned((8'h9e)) | reg15)) : $unsigned($signed((reg11 != reg16))))))
            begin
              reg18 <= $unsigned(((^(wire7 ?
                  wire10[(1'h0):(1'h0)] : (8'ha1))) | (&((~reg12) ?
                  $unsigned(reg14) : $signed(wire8)))));
              reg19 <= {{({reg16, $signed(wire10)} ?
                          {(reg12 >>> (8'haf))} : $signed(reg15[(4'hb):(1'h0)]))}};
              reg20 <= $signed(($signed({wire7[(1'h1):(1'h1)],
                      (reg19 || reg14)}) ?
                  (((^wire7) || (wire8 ?
                      (8'haa) : reg16)) ^ reg14[(1'h0):(1'h0)]) : (-reg18)));
            end
          else
            begin
              reg18 <= ((|$signed($signed({reg18, (8'haa)}))) ?
                  $unsigned((^~(^(8'h9f)))) : (~^reg20));
            end
        end
      else
        begin
          if (($unsigned((reg20[(1'h0):(1'h0)] ~^ {$unsigned((8'hbf))})) ?
              $unsigned({($unsigned(wire10) ? (|wire7) : wire10),
                  $signed((wire10 ? wire7 : reg19))}) : wire8))
            begin
              reg12 <= $signed(reg12);
            end
          else
            begin
              reg12 <= (|reg17);
            end
          reg13 <= (reg14 ?
              (!(+wire10[(4'hd):(4'hb)])) : $unsigned(((!(wire9 <= wire10)) ^~ ((wire10 ?
                      (8'hb5) : reg20) ?
                  (reg15 || wire8) : reg17))));
          if ((reg14 == (wire10 >>> $unsigned((7'h41)))))
            begin
              reg14 <= $unsigned(reg18);
              reg15 <= $unsigned((8'ha6));
              reg16 <= (^~$unsigned((|reg20)));
              reg17 <= ($signed(reg18[(3'h4):(1'h0)]) ?
                  $unsigned((wire7[(2'h2):(2'h2)] * (~^(reg17 | reg14)))) : ($unsigned($unsigned(reg18[(3'h7):(2'h3)])) & (reg16 & reg11)));
              reg18 <= $signed(reg11[(3'h7):(3'h5)]);
            end
          else
            begin
              reg14 <= $signed(wire7[(3'h4):(2'h2)]);
              reg15 <= (~$signed($unsigned({(reg18 ? reg16 : reg16),
                  $signed((8'h9f))})));
            end
          reg19 <= ($unsigned($unsigned(($unsigned(reg16) >= $signed(wire10)))) + reg18[(3'h5):(1'h0)]);
          reg20 <= $unsigned($unsigned((+$signed(reg18))));
        end
    end
  assign wire21 = $signed(((~^$signed((8'had))) ?
                      $signed(((wire9 != (7'h43)) * $unsigned(reg12))) : reg19));
  module22 #() modinst40 (wire39, clk, reg14, reg13, wire7, reg15);
  always
    @(posedge clk) begin
      reg41 <= wire10[(3'h5):(3'h4)];
      reg42 <= $signed(reg20[(4'h8):(3'h7)]);
      reg43 <= reg14;
      reg44 <= (~{$signed((!((8'h9f) >> reg19)))});
    end
  assign wire45 = reg11[(4'hb):(2'h2)];
  always
    @(posedge clk) begin
      reg46 <= {({((reg17 ? reg41 : wire45) > reg44)} ?
              (reg42 * $unsigned((wire10 || reg42))) : (8'ha1)),
          wire21[(2'h2):(1'h0)]};
      if ((($signed(({reg13, reg42} & reg17[(1'h1):(1'h1)])) + (reg42 ?
          reg19 : wire9[(4'h8):(3'h4)])) ^ wire39))
        begin
          reg47 <= $signed((reg42 ?
              (~&$signed($unsigned(reg18))) : ((8'hb7) << reg42[(3'h6):(1'h0)])));
        end
      else
        begin
          reg47 <= reg19[(4'h8):(3'h5)];
        end
      reg48 <= (reg44 ^ ($signed(($unsigned(wire10) > (reg13 | reg14))) == $signed(({reg15,
              wire45} ?
          $unsigned(wire7) : (wire8 << wire7)))));
    end
  assign wire49 = $signed((reg44 != (reg19 ?
                      (~wire21) : $unsigned((wire45 && reg20)))));
  assign wire50 = (+(~^(~^$unsigned(reg17[(2'h2):(1'h1)]))));
  assign wire51 = reg48[(1'h0):(1'h0)];
  assign wire52 = (reg19 + wire7[(4'h9):(4'h8)]);
  assign wire53 = $unsigned((wire50[(2'h3):(1'h0)] | (((wire49 || wire50) <<< $signed(reg18)) ?
                      reg48[(4'hd):(4'h9)] : {(wire7 ? reg12 : wire50),
                          (wire9 ? wire51 : reg48)})));
  assign wire54 = {(reg42 ~^ $unsigned(wire9))};
  module55 #() modinst97 (wire96, clk, wire54, reg18, reg42, reg15, reg14);
  assign wire98 = {(!$unsigned($unsigned(((8'ha6) ? wire21 : (8'hb8))))),
                      wire39};
  assign wire99 = {$signed(reg43)};
  assign wire100 = $signed((^~(((wire52 == (8'had)) ?
                       $signed(reg14) : reg46) ^~ $unsigned(reg44))));
  assign wire101 = (wire49[(2'h3):(1'h0)] ?
                       (8'h9c) : $unsigned(({reg43} | $unsigned(reg11))));
  assign wire102 = ((&(~&(~|(wire100 >> wire51)))) ?
                       (reg18[(4'h9):(4'h9)] ?
                           $unsigned((((8'had) & reg17) ?
                               ((8'ha3) << reg11) : (reg14 > (8'ha2)))) : (+((&reg20) <= wire50[(3'h4):(1'h1)]))) : ((($signed(wire45) ?
                                   $unsigned(reg46) : (^~(8'hab))) ?
                               reg19[(4'h9):(1'h1)] : $unsigned((wire9 - reg19))) ?
                           reg11[(2'h2):(1'h0)] : {(~|(reg43 ?
                                   reg13 : (8'ha0)))}));
  assign wire103 = $unsigned(wire52[(3'h5):(1'h0)]);
endmodule

module module55
#(parameter param94 = ({(~&(((8'hb4) - (7'h42)) ? (|(8'hb7)) : ((8'hbe) ? (8'hb7) : (8'h9c)))), ((~|(~(8'ha7))) > (((8'ha8) ? (8'hb6) : (8'hb7)) <= ((8'hb5) != (7'h42))))} & ((7'h44) << ((((8'hbb) == (8'hb4)) ? (&(8'ha3)) : {(8'h9e)}) ? (((8'ha8) == (8'hbb)) ~^ ((8'ha5) ? (7'h43) : (8'ha4))) : (~&{(8'hae)})))), 
parameter param95 = ((param94 << (&param94)) | param94))
(y, clk, wire60, wire59, wire58, wire57, wire56);
  output wire [(32'h181):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire60;
  input wire signed [(5'h12):(1'h0)] wire59;
  input wire [(2'h3):(1'h0)] wire58;
  input wire [(5'h12):(1'h0)] wire57;
  input wire signed [(3'h7):(1'h0)] wire56;
  wire [(5'h13):(1'h0)] wire93;
  wire [(4'hd):(1'h0)] wire92;
  wire signed [(2'h3):(1'h0)] wire91;
  wire [(4'he):(1'h0)] wire90;
  wire [(5'h11):(1'h0)] wire82;
  wire [(4'he):(1'h0)] wire81;
  wire [(4'h9):(1'h0)] wire73;
  wire [(3'h5):(1'h0)] wire70;
  wire signed [(4'hc):(1'h0)] wire69;
  wire signed [(4'he):(1'h0)] wire68;
  reg signed [(3'h7):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg88 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg87 = (1'h0);
  reg [(5'h13):(1'h0)] reg86 = (1'h0);
  reg [(4'ha):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg83 = (1'h0);
  reg [(4'hf):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg79 = (1'h0);
  reg [(4'hc):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg77 = (1'h0);
  reg [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg75 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg71 = (1'h0);
  reg [(5'h11):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg64 = (1'h0);
  reg [(4'hb):(1'h0)] reg63 = (1'h0);
  reg [(5'h12):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg61 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire82,
                 wire81,
                 wire73,
                 wire70,
                 wire69,
                 wire68,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg72,
                 reg71,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg61 <= wire56[(3'h5):(1'h0)];
      reg62 <= $unsigned(wire59);
      reg63 <= (|wire58);
      if (wire60)
        begin
          if ($signed($unsigned(wire60[(3'h4):(1'h1)])))
            begin
              reg64 <= $signed({$unsigned(wire57), wire60});
              reg65 <= reg61[(4'ha):(4'h8)];
              reg66 <= (^(~|(wire59[(4'hc):(3'h6)] + reg65)));
            end
          else
            begin
              reg64 <= (~&$unsigned((^reg65)));
              reg65 <= (8'ha5);
              reg66 <= reg63[(4'h8):(2'h3)];
            end
          reg67 <= ($unsigned($unsigned({$signed(reg65)})) >= ($unsigned({$unsigned((8'hb9)),
                  wire57}) ?
              (8'hb2) : (|wire58)));
        end
      else
        begin
          if ($unsigned((-(wire58[(2'h3):(1'h1)] ^ $unsigned(wire56)))))
            begin
              reg64 <= (~^($unsigned(wire59[(4'h8):(2'h2)]) ?
                  ($signed((reg64 >= (8'hb1))) ?
                      $signed($signed(wire59)) : ((^~reg67) ?
                          reg62[(4'h8):(3'h5)] : reg67)) : ({(8'h9d),
                      {(7'h40)}} + reg65)));
            end
          else
            begin
              reg64 <= $signed(reg63);
              reg65 <= wire56;
            end
        end
    end
  assign wire68 = ((($signed($unsigned(reg63)) ?
                              ((&reg62) ?
                                  $unsigned(reg67) : $signed(reg66)) : $signed((8'hb8))) ?
                          reg66[(1'h1):(1'h0)] : reg67[(3'h5):(3'h4)]) ?
                      reg63 : {$unsigned((-wire57[(1'h1):(1'h0)]))});
  assign wire69 = reg61;
  assign wire70 = $signed(wire56);
  always
    @(posedge clk) begin
      reg71 <= $unsigned($signed($signed(wire60[(3'h5):(3'h5)])));
      reg72 <= wire69;
    end
  assign wire73 = $unsigned(wire68[(4'hc):(4'ha)]);
  always
    @(posedge clk) begin
      if (reg62[(4'hd):(4'ha)])
        begin
          reg74 <= wire68;
          if ((((wire58 ?
                  ($unsigned(reg62) ?
                      $signed(wire69) : $signed(reg65)) : ({wire68, reg74} ?
                      ((8'hb6) ? (7'h42) : reg72) : {reg61})) ?
              (wire69 == reg66) : (wire70 ?
                  reg62[(3'h4):(1'h1)] : (~&(wire58 ?
                      reg67 : (8'haa))))) ~^ ($unsigned(reg61[(3'h7):(3'h7)]) ?
              reg71 : reg65)))
            begin
              reg75 <= $unsigned(reg74);
              reg76 <= $signed($signed($unsigned(((8'ha8) == (wire58 < wire59)))));
              reg77 <= reg74[(1'h0):(1'h0)];
            end
          else
            begin
              reg75 <= $unsigned($signed(((reg76[(4'hd):(2'h3)] >>> reg66) && (reg67 ?
                  $signed(reg76) : (~^(8'ha8))))));
              reg76 <= $signed(($unsigned({(8'h9c)}) ?
                  $unsigned(((~reg67) ?
                      wire57[(3'h6):(2'h3)] : $signed(reg67))) : $signed(($unsigned(reg71) ?
                      {wire69, reg66} : {reg67, reg67}))));
              reg77 <= $unsigned(reg77);
            end
          reg78 <= (8'had);
          reg79 <= ((($unsigned((^wire57)) * $signed($signed(reg61))) <<< $unsigned(wire60)) ?
              $unsigned($signed(wire73[(2'h3):(2'h2)])) : (&$signed(wire69[(3'h7):(3'h7)])));
          reg80 <= ((reg67 ?
                  (($signed(reg78) ? (reg62 << reg75) : (wire58 < reg77)) ?
                      wire57 : ((reg72 < reg78) != $unsigned(wire73))) : ((8'hba) <= ({reg65} ?
                      (wire69 ? wire56 : reg75) : reg76[(4'h8):(2'h3)]))) ?
              (^$unsigned($unsigned(reg71[(3'h4):(2'h3)]))) : reg74);
        end
      else
        begin
          if (reg64)
            begin
              reg74 <= (((|$unsigned(wire59)) || $unsigned(($signed(reg72) == {reg62,
                  reg65}))) >= $signed(wire57));
            end
          else
            begin
              reg74 <= wire73;
              reg75 <= (&((~|$signed(wire70[(1'h1):(1'h0)])) <= (^~({wire69} ?
                  $unsigned(wire59) : $unsigned(wire60)))));
            end
        end
    end
  assign wire81 = $unsigned((~^reg78[(3'h4):(2'h2)]));
  assign wire82 = reg75;
  always
    @(posedge clk) begin
      reg83 <= wire56;
      reg84 <= {(($signed($unsigned(reg75)) != reg75) >> wire73[(4'h8):(3'h5)]),
          {(reg74[(1'h1):(1'h1)] || (8'h9e))}};
      reg85 <= wire69[(3'h7):(2'h3)];
    end
  always
    @(posedge clk) begin
      reg86 <= ((~&(($signed(wire81) ?
              reg62[(5'h12):(4'hc)] : (&(7'h44))) || ((wire68 != reg77) ?
              reg72 : (wire59 ? reg75 : wire59)))) ?
          $signed({$unsigned($unsigned(reg66))}) : reg75[(2'h3):(1'h1)]);
      reg87 <= wire68[(4'hb):(4'h8)];
      reg88 <= $unsigned($unsigned({reg71[(1'h1):(1'h0)],
          reg71[(2'h2):(2'h2)]}));
      reg89 <= (^~$unsigned($signed({reg76, wire60})));
    end
  assign wire90 = $signed(reg86);
  assign wire91 = (reg78 ? reg86[(3'h7):(3'h7)] : (^wire82[(5'h10):(4'hd)]));
  assign wire92 = ((reg79 != (~$unsigned(((8'ha6) ^ (8'ha7))))) ~^ reg83[(1'h0):(1'h0)]);
  assign wire93 = {$signed(reg83[(4'hd):(1'h0)])};
endmodule

module module22  (y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire26;
  input wire signed [(5'h15):(1'h0)] wire25;
  input wire [(4'hc):(1'h0)] wire24;
  input wire signed [(4'ha):(1'h0)] wire23;
  wire signed [(4'h9):(1'h0)] wire38;
  wire signed [(5'h15):(1'h0)] wire37;
  wire [(4'h9):(1'h0)] wire36;
  wire signed [(5'h12):(1'h0)] wire30;
  wire signed [(4'he):(1'h0)] wire29;
  wire [(4'ha):(1'h0)] wire28;
  wire [(5'h10):(1'h0)] wire27;
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg signed [(4'he):(1'h0)] reg31 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire27 = $unsigned($signed(wire25[(4'hc):(2'h3)]));
  assign wire28 = wire25;
  assign wire29 = {(+((wire28[(1'h0):(1'h0)] ?
                          (wire23 ?
                              wire23 : wire24) : (!(8'ha9))) - (wire25[(2'h2):(2'h2)] != (wire28 * (8'hae))))),
                      ($signed($unsigned((^~wire26))) ?
                          (+wire28) : (wire26 ?
                              wire23[(2'h3):(1'h1)] : $unsigned((wire23 || wire23))))};
  assign wire30 = $unsigned((~$signed((+wire26[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      reg31 <= $unsigned($unsigned($signed(wire25)));
      if ((~^(((^~$signed(wire28)) ?
              {$unsigned(wire30)} : (-(wire29 ? (8'h9d) : wire26))) ?
          ($signed($unsigned(wire28)) || $signed((wire25 ?
              wire28 : wire28))) : reg31[(4'hc):(3'h4)])))
        begin
          reg32 <= (wire30[(4'h8):(3'h6)] * wire30);
          reg33 <= wire28[(3'h4):(1'h0)];
          reg34 <= wire27;
        end
      else
        begin
          reg32 <= (reg34 ?
              $unsigned($unsigned(((wire29 ^~ wire29) ?
                  $unsigned((8'had)) : (8'hb8)))) : reg33[(1'h1):(1'h0)]);
          reg33 <= ($unsigned(((^~wire25) ?
              $signed((-(8'ha3))) : reg31[(3'h5):(1'h1)])) < $unsigned((~|(wire27[(3'h5):(2'h2)] ?
              {reg34} : (wire23 ? reg34 : wire26)))));
          reg34 <= $unsigned(($unsigned((!$signed(wire27))) ?
              (((wire26 + reg34) && (reg34 != (8'hb8))) ?
                  $unsigned(wire23) : $signed((8'hbc))) : wire24[(3'h5):(1'h0)]));
        end
      reg35 <= $signed((~^({wire26} <= reg31)));
    end
  assign wire36 = wire30[(4'h8):(3'h4)];
  assign wire37 = (~&((($unsigned(reg32) ?
                          $unsigned(wire26) : wire24) <= (8'haf)) ?
                      ((^(^~wire26)) | (~|wire23[(4'h9):(3'h5)])) : wire23));
  assign wire38 = wire36;
endmodule

module module135
#(parameter param166 = ((((|((8'hba) ? (7'h40) : (8'h9f))) != (&((8'hac) << (8'ha7)))) | ((~^((8'hb2) ~^ (8'hae))) ? (^(!(8'hb6))) : {((8'hae) ? (8'ha9) : (8'ha5)), ((8'haf) - (8'had))})) - (-(~(8'h9d)))))
(y, clk, wire140, wire139, wire138, wire137, wire136);
  output wire [(32'h126):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire140;
  input wire signed [(3'h6):(1'h0)] wire139;
  input wire signed [(4'hd):(1'h0)] wire138;
  input wire signed [(5'h12):(1'h0)] wire137;
  input wire signed [(4'hb):(1'h0)] wire136;
  wire [(5'h10):(1'h0)] wire165;
  wire [(3'h6):(1'h0)] wire154;
  wire [(3'h7):(1'h0)] wire153;
  wire [(3'h6):(1'h0)] wire152;
  wire signed [(5'h11):(1'h0)] wire151;
  wire signed [(4'hd):(1'h0)] wire150;
  wire [(3'h4):(1'h0)] wire149;
  wire [(5'h12):(1'h0)] wire148;
  wire [(3'h6):(1'h0)] wire146;
  wire signed [(5'h11):(1'h0)] wire145;
  wire signed [(5'h11):(1'h0)] wire144;
  wire signed [(2'h2):(1'h0)] wire143;
  wire signed [(5'h14):(1'h0)] wire142;
  wire signed [(4'hf):(1'h0)] wire141;
  reg [(3'h4):(1'h0)] reg164 = (1'h0);
  reg [(5'h14):(1'h0)] reg163 = (1'h0);
  reg [(4'he):(1'h0)] reg162 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg161 = (1'h0);
  reg [(3'h5):(1'h0)] reg160 = (1'h0);
  reg [(5'h15):(1'h0)] reg159 = (1'h0);
  reg [(4'ha):(1'h0)] reg158 = (1'h0);
  reg [(5'h10):(1'h0)] reg157 = (1'h0);
  reg [(4'hc):(1'h0)] reg156 = (1'h0);
  reg [(3'h4):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg147 = (1'h0);
  assign y = {wire165,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
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
                 reg147,
                 (1'h0)};
  assign wire141 = wire136;
  assign wire142 = (~^(8'h9e));
  assign wire143 = (wire137[(1'h0):(1'h0)] != $unsigned((!$signed((&wire136)))));
  assign wire144 = {$unsigned($unsigned({(+(8'hb2)), (wire138 * wire136)})),
                       (~^((wire138[(3'h5):(1'h1)] ? (^~wire140) : wire139) ?
                           $unsigned((wire141 && wire136)) : (|wire136[(3'h6):(3'h6)])))};
  assign wire145 = (8'hbe);
  assign wire146 = {(~^wire138)};
  always
    @(posedge clk) begin
      reg147 <= (~((~&($unsigned(wire145) >> (wire136 ?
          wire146 : wire137))) && {((wire143 ?
              wire141 : wire138) - (+wire140))}));
    end
  assign wire148 = wire146[(3'h5):(1'h0)];
  assign wire149 = (!wire148);
  assign wire150 = reg147[(4'hb):(3'h7)];
  assign wire151 = $unsigned($signed(reg147[(3'h5):(1'h0)]));
  assign wire152 = (wire146[(3'h5):(1'h1)] <<< $unsigned((((wire146 * wire150) ?
                           wire136 : $signed(wire150)) ?
                       wire143 : (^~(^~wire148)))));
  assign wire153 = wire143[(1'h0):(1'h0)];
  assign wire154 = wire136[(4'h9):(1'h0)];
  always
    @(posedge clk) begin
      reg155 <= (~^$signed({(|(+wire142)),
          (wire138[(4'hc):(3'h5)] ? ((8'hbd) < wire146) : {wire137})}));
      reg156 <= ($signed((wire143[(2'h2):(2'h2)] > wire152)) + $unsigned({wire154,
          (~reg155)}));
      if ((((|($signed(reg155) ? $signed(wire150) : (wire150 ~^ wire145))) ?
              ({wire153, wire148[(3'h4):(3'h4)]} & {$signed(wire152),
                  (-(8'h9f))}) : $signed(($unsigned((8'h9c)) <= $signed(wire138)))) ?
          wire148[(4'ha):(3'h5)] : ($unsigned($unsigned(wire139)) >> (($signed(reg156) || wire145) | ($unsigned(wire150) ^~ (~^wire139))))))
        begin
          reg157 <= (-(($unsigned($unsigned(wire144)) ^ wire137[(2'h2):(1'h1)]) ?
              $unsigned((wire149 >> (wire139 || reg147))) : (reg155[(2'h2):(1'h1)] ?
                  wire146 : $unsigned((8'hb2)))));
          if ((~{($signed($unsigned(wire151)) ?
                  $signed((wire136 <<< wire140)) : reg155[(1'h0):(1'h0)])}))
            begin
              reg158 <= $signed(wire154[(1'h1):(1'h1)]);
            end
          else
            begin
              reg158 <= $unsigned($signed($unsigned((~&(wire140 > wire145)))));
              reg159 <= {((wire141 << ((~&reg158) * (reg158 ?
                      wire136 : wire142))) | $unsigned($signed((wire154 && reg147))))};
              reg160 <= ($signed($signed(wire139)) || wire137);
              reg161 <= (($unsigned($unsigned(reg158)) >= (~|$unsigned((reg157 | reg156)))) ?
                  (($unsigned($unsigned(wire142)) << (^(&wire142))) ?
                      ($unsigned((|wire142)) ?
                          (&(wire142 ~^ wire141)) : ({wire150,
                              reg160} == (~^wire151))) : wire142[(3'h5):(2'h3)]) : wire143);
            end
          reg162 <= {(reg157 >= $unsigned($signed($unsigned(wire154))))};
          reg163 <= reg157[(2'h3):(1'h1)];
        end
      else
        begin
          reg157 <= reg158[(2'h3):(2'h2)];
          reg158 <= ($signed({((reg162 ? wire142 : reg157) ?
                      (wire150 | reg162) : $unsigned(reg147)),
                  wire145}) ?
              $unsigned((wire145 > (-(wire136 ?
                  reg160 : wire144)))) : (reg159[(4'hd):(3'h5)] ?
                  (8'ha9) : reg162));
          reg159 <= ($unsigned((7'h43)) - ($signed($unsigned($signed(wire151))) ^~ (wire148 + reg159[(4'hd):(1'h0)])));
        end
      reg164 <= wire149;
    end
  assign wire165 = $signed(((($unsigned(reg155) * (wire137 >> reg159)) ?
                       $signed($signed(wire144)) : {(wire142 | wire151),
                           (wire146 ?
                               wire140 : reg162)}) >> $signed((!$signed(reg155)))));
endmodule
