module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire269;
  wire [(3'h5):(1'h0)] wire268;
  wire [(5'h15):(1'h0)] wire267;
  wire signed [(2'h2):(1'h0)] wire264;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  reg signed [(2'h3):(1'h0)] reg266 = (1'h0);
  assign y = {wire269, wire268, wire267, wire264, wire5, wire4, reg266, (1'h0)};
  assign wire4 = wire0;
  assign wire5 = wire4[(3'h7):(3'h5)];
  module6 #() modinst265 (wire264, clk, wire1, wire5, wire2, wire4);
  always
    @(posedge clk) begin
      reg266 <= {wire5[(4'h8):(1'h0)],
          ($signed(($signed(wire4) ?
                  $unsigned(wire2) : wire264[(2'h2):(1'h0)])) ?
              ((~|$unsigned(wire5)) != wire2) : {{(~|wire0)}})};
    end
  assign wire267 = wire3[(3'h4):(3'h4)];
  assign wire268 = wire2[(3'h6):(2'h3)];
  assign wire269 = reg266[(1'h1):(1'h1)];
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h130):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire7;
  input wire [(5'h12):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire10;
  wire [(4'ha):(1'h0)] wire263;
  wire [(3'h7):(1'h0)] wire262;
  wire signed [(5'h11):(1'h0)] wire261;
  wire [(4'h8):(1'h0)] wire260;
  wire signed [(4'hc):(1'h0)] wire257;
  wire signed [(5'h13):(1'h0)] wire171;
  wire [(3'h4):(1'h0)] wire170;
  wire signed [(4'he):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire41;
  wire [(5'h14):(1'h0)] wire43;
  wire signed [(5'h10):(1'h0)] wire65;
  wire signed [(4'h8):(1'h0)] wire67;
  wire [(2'h3):(1'h0)] wire120;
  wire [(4'h8):(1'h0)] wire122;
  wire [(5'h10):(1'h0)] wire123;
  wire [(4'h9):(1'h0)] wire124;
  wire [(5'h15):(1'h0)] wire125;
  wire [(3'h6):(1'h0)] wire126;
  wire [(3'h4):(1'h0)] wire127;
  wire signed [(5'h10):(1'h0)] wire168;
  reg [(3'h4):(1'h0)] reg259 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  assign y = {wire263,
                 wire262,
                 wire261,
                 wire260,
                 wire257,
                 wire171,
                 wire170,
                 wire14,
                 wire15,
                 wire41,
                 wire43,
                 wire65,
                 wire67,
                 wire120,
                 wire122,
                 wire123,
                 wire124,
                 wire125,
                 wire126,
                 wire127,
                 wire168,
                 reg259,
                 reg11,
                 reg12,
                 reg13,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= {(|(({(8'haa), wire9} ? {wire7} : (^~wire9)) ?
              $signed($signed(wire7)) : (+(wire7 ? (8'hba) : wire10)))),
          wire8};
      reg12 <= ((((7'h41) <<< {wire10[(4'hf):(1'h1)],
          (wire7 ? reg11 : reg11)}) != (($unsigned(wire10) ?
              $unsigned(wire8) : (!reg11)) ?
          ((wire7 ?
              (8'ha0) : wire10) || wire9) : $unsigned($unsigned(reg11)))) | ($signed($signed($signed(wire9))) ?
          $signed(wire10[(5'h10):(4'hf)]) : ($signed(wire8) ?
              ($signed(wire9) ?
                  $unsigned(reg11) : (wire8 ?
                      wire10 : wire9)) : $signed((+wire8)))));
      reg13 <= ({(8'hbc)} > (~|$signed(wire9)));
    end
  assign wire14 = $unsigned(wire9);
  assign wire15 = wire14;
  module16 #() modinst42 (wire41, clk, wire15, wire10, wire9, wire8);
  assign wire43 = reg11;
  module44 #() modinst66 (wire65, clk, wire43, wire14, wire15, wire41);
  assign wire67 = $unsigned(reg11[(1'h1):(1'h1)]);
  module68 #() modinst121 (wire120, clk, reg13, wire65, reg12, wire8);
  assign wire122 = {(^reg13), (^~wire15)};
  assign wire123 = (|$signed($signed(reg12[(4'ha):(3'h6)])));
  assign wire124 = reg13[(1'h1):(1'h1)];
  assign wire125 = $unsigned($unsigned((~^wire65)));
  assign wire126 = (wire65 ?
                       $signed(((~&$signed(wire120)) ~^ (8'hb2))) : wire8);
  assign wire127 = $unsigned($unsigned(((^wire10) - (!wire15))));
  module128 #() modinst169 (wire168, clk, wire10, wire126, wire120, wire7, wire65);
  assign wire170 = (~|$unsigned({{$signed(wire120), ((7'h41) ^~ wire122)},
                       (wire126 ? (~|wire126) : {(7'h41), wire125})}));
  assign wire171 = (~|wire8);
  module172 #() modinst258 (.wire177(wire67), .wire174(reg12), .wire176(wire15), .clk(clk), .wire175(wire123), .y(wire257), .wire173(wire171));
  always
    @(posedge clk) begin
      reg259 <= wire7[(4'ha):(3'h5)];
    end
  assign wire260 = (&wire15);
  assign wire261 = wire41[(5'h10):(4'hb)];
  assign wire262 = wire120[(2'h3):(2'h2)];
  assign wire263 = ($signed((reg13 ?
                       (wire43 <<< (wire257 | wire123)) : (^~(wire125 ?
                           wire126 : wire10)))) < wire168);
endmodule

module module172
#(parameter param256 = (~&{((-(|(8'hb6))) ? {(^(8'hb0)), ((8'hb7) ? (7'h44) : (8'ha7))} : (~&((7'h42) ~^ (8'hb9))))}))
(y, clk, wire177, wire176, wire175, wire174, wire173);
  output wire [(32'h34a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire177;
  input wire [(4'h8):(1'h0)] wire176;
  input wire [(4'h9):(1'h0)] wire175;
  input wire [(5'h12):(1'h0)] wire174;
  input wire signed [(4'h9):(1'h0)] wire173;
  wire signed [(2'h3):(1'h0)] wire255;
  wire [(4'hf):(1'h0)] wire254;
  wire [(4'hf):(1'h0)] wire243;
  wire signed [(4'hb):(1'h0)] wire242;
  wire signed [(2'h2):(1'h0)] wire238;
  wire signed [(4'hf):(1'h0)] wire237;
  wire [(3'h5):(1'h0)] wire236;
  wire [(4'h8):(1'h0)] wire230;
  wire [(4'ha):(1'h0)] wire207;
  wire [(5'h12):(1'h0)] wire206;
  wire [(5'h10):(1'h0)] wire205;
  wire [(3'h4):(1'h0)] wire204;
  wire signed [(4'hb):(1'h0)] wire183;
  wire signed [(4'hb):(1'h0)] wire182;
  wire signed [(4'hf):(1'h0)] wire181;
  wire signed [(2'h2):(1'h0)] wire180;
  wire [(4'hc):(1'h0)] wire179;
  wire [(5'h11):(1'h0)] wire178;
  reg signed [(3'h4):(1'h0)] reg253 = (1'h0);
  reg [(3'h5):(1'h0)] reg252 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg251 = (1'h0);
  reg [(5'h15):(1'h0)] reg250 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg249 = (1'h0);
  reg [(4'ha):(1'h0)] reg248 = (1'h0);
  reg [(3'h4):(1'h0)] reg247 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg246 = (1'h0);
  reg [(4'hd):(1'h0)] reg245 = (1'h0);
  reg [(2'h2):(1'h0)] reg244 = (1'h0);
  reg [(2'h3):(1'h0)] reg241 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg240 = (1'h0);
  reg [(4'hc):(1'h0)] reg239 = (1'h0);
  reg [(4'hf):(1'h0)] reg235 = (1'h0);
  reg [(2'h2):(1'h0)] reg234 = (1'h0);
  reg [(5'h14):(1'h0)] reg233 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg232 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg231 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg229 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg228 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg227 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg226 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg225 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg224 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg223 = (1'h0);
  reg [(4'ha):(1'h0)] reg222 = (1'h0);
  reg [(4'hd):(1'h0)] reg221 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg220 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg219 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg218 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg217 = (1'h0);
  reg [(5'h11):(1'h0)] reg216 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg215 = (1'h0);
  reg [(3'h5):(1'h0)] reg214 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg213 = (1'h0);
  reg [(5'h12):(1'h0)] reg212 = (1'h0);
  reg [(3'h4):(1'h0)] reg211 = (1'h0);
  reg [(4'h8):(1'h0)] reg210 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg209 = (1'h0);
  reg [(5'h12):(1'h0)] reg208 = (1'h0);
  reg [(5'h13):(1'h0)] reg203 = (1'h0);
  reg [(4'h8):(1'h0)] reg202 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg201 = (1'h0);
  reg [(2'h3):(1'h0)] reg200 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg199 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg198 = (1'h0);
  reg [(5'h11):(1'h0)] reg197 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg196 = (1'h0);
  reg [(5'h14):(1'h0)] reg195 = (1'h0);
  reg [(4'he):(1'h0)] reg194 = (1'h0);
  reg [(3'h6):(1'h0)] reg193 = (1'h0);
  reg [(4'hd):(1'h0)] reg192 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg191 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg189 = (1'h0);
  reg [(4'h8):(1'h0)] reg188 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg187 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg186 = (1'h0);
  reg [(4'ha):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg184 = (1'h0);
  assign y = {wire255,
                 wire254,
                 wire243,
                 wire242,
                 wire238,
                 wire237,
                 wire236,
                 wire230,
                 wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
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
                 reg241,
                 reg240,
                 reg239,
                 reg235,
                 reg234,
                 reg233,
                 reg232,
                 reg231,
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
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
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
  assign wire178 = (({wire173[(4'h8):(3'h7)],
                           $unsigned((wire173 ? (8'hbf) : wire174))} ?
                       wire175[(2'h3):(2'h2)] : (((wire175 >> (8'h9f)) ~^ $unsigned(wire174)) ?
                           wire176 : wire176)) * wire175);
  assign wire179 = $signed($signed((($signed(wire177) * (8'hb4)) ?
                       ($signed(wire177) || wire177[(1'h0):(1'h0)]) : ($unsigned((8'ha9)) ?
                           (wire177 ? wire174 : wire176) : {wire173}))));
  assign wire180 = (&$signed(wire176[(4'h8):(3'h6)]));
  assign wire181 = (^wire173[(4'h8):(3'h6)]);
  assign wire182 = (8'ha9);
  assign wire183 = ($unsigned($signed($signed((-wire179)))) != (~$signed(((wire173 > wire177) ?
                       wire176 : {wire176}))));
  always
    @(posedge clk) begin
      if ($unsigned((((wire183 ~^ (+wire182)) ?
              ((|wire173) ?
                  (wire181 ^ wire173) : (wire173 + wire182)) : wire177) ?
          (8'had) : wire179)))
        begin
          reg184 <= ($signed(wire176) && wire174[(4'h9):(3'h4)]);
          if ((!{(~&wire179[(3'h5):(3'h4)]),
              $unsigned($signed(wire173[(1'h1):(1'h0)]))}))
            begin
              reg185 <= ({$signed((~&wire183)),
                      (&(wire180[(1'h1):(1'h1)] & $signed(wire177)))} ?
                  ($signed(wire175[(4'h9):(1'h0)]) - $unsigned(((wire173 ?
                      wire175 : (8'h9d)) & (~(8'ha7))))) : (~{$unsigned($unsigned(wire177)),
                      (~wire179)}));
              reg186 <= $signed(($unsigned(($unsigned(wire178) == wire179)) <<< (((wire183 <= wire181) == {wire175}) ?
                  (7'h43) : (~^(~|wire174)))));
              reg187 <= $unsigned(wire177);
            end
          else
            begin
              reg185 <= wire183[(3'h5):(3'h4)];
              reg186 <= wire174;
              reg187 <= $signed(wire177[(2'h2):(1'h0)]);
              reg188 <= ($unsigned((($unsigned((8'ha2)) ?
                  reg185[(3'h4):(1'h1)] : $unsigned(reg187)) + ($unsigned(wire173) == wire176))) >> wire183);
            end
          if ($unsigned(reg187))
            begin
              reg189 <= $unsigned($unsigned((!reg186)));
              reg190 <= {$signed(reg187[(3'h7):(3'h4)])};
            end
          else
            begin
              reg189 <= ((reg188[(2'h2):(1'h0)] ?
                      (reg190 ?
                          ($signed(reg188) ?
                              $signed(wire183) : wire180) : (reg188 > (&wire182))) : (^~($signed(wire182) >>> (wire177 >> wire178)))) ?
                  ((^((wire181 >= reg190) ?
                          (wire175 ? (8'ha0) : reg184) : reg185)) ?
                      ({(wire183 < wire173)} ?
                          ((~^wire173) != {wire180,
                              reg186}) : $unsigned($signed((7'h44)))) : $unsigned($unsigned($unsigned(wire177)))) : wire179[(4'h8):(3'h5)]);
              reg190 <= wire180[(2'h2):(1'h1)];
              reg191 <= (((|($unsigned((8'hba)) ?
                      reg186 : $unsigned(wire178))) ?
                  reg186[(2'h3):(2'h3)] : wire178[(2'h2):(1'h1)]) | $signed($unsigned((8'hbc))));
            end
          if (((8'hbf) ? reg186[(2'h2):(1'h0)] : (7'h41)))
            begin
              reg192 <= reg188;
              reg193 <= $unsigned(wire175);
              reg194 <= reg190[(1'h0):(1'h0)];
              reg195 <= $unsigned(reg187);
              reg196 <= reg186;
            end
          else
            begin
              reg192 <= ((+((+$unsigned(reg193)) ?
                      $signed($unsigned(reg184)) : {reg184[(4'hb):(3'h6)]})) ?
                  reg193 : ((8'ha2) == {$signed((^reg193))}));
              reg193 <= ($unsigned($unsigned(($signed(reg184) >= $unsigned(reg187)))) ?
                  wire178[(4'h8):(2'h3)] : (wire177 ?
                      ($unsigned({reg193}) ?
                          $signed((wire174 ?
                              wire175 : reg188)) : (&(wire182 && wire183))) : (|((wire173 > wire174) ?
                          $signed((8'hb5)) : (!(8'hbc))))));
            end
          reg197 <= wire176;
        end
      else
        begin
          if ((^~reg194))
            begin
              reg184 <= reg190[(3'h4):(1'h1)];
              reg185 <= (&reg192);
              reg186 <= $signed(($unsigned(((reg187 ?
                      reg187 : wire174) >>> wire181[(4'h8):(2'h2)])) ?
                  ($unsigned(reg186[(2'h2):(1'h1)]) | wire176) : wire176[(1'h1):(1'h0)]));
            end
          else
            begin
              reg184 <= wire176[(3'h4):(2'h2)];
              reg185 <= (reg190 > {(!({reg186} << $unsigned((8'hb7))))});
              reg186 <= $signed({(~&(|reg192[(4'h8):(3'h5)]))});
              reg187 <= (({reg190} ?
                  ($signed($unsigned(wire183)) ?
                      reg186[(2'h3):(2'h2)] : reg188[(4'h8):(3'h4)]) : reg189) + ({wire176[(2'h2):(1'h1)],
                      reg190} ?
                  (8'haa) : $unsigned(wire179[(3'h4):(3'h4)])));
            end
          reg188 <= ((8'hb3) < (^wire183[(3'h5):(2'h2)]));
          reg189 <= $signed($signed($unsigned($unsigned({reg195}))));
          reg190 <= (^~$unsigned(reg196));
          if ((^$unsigned($unsigned(($unsigned(reg185) ^ reg196)))))
            begin
              reg191 <= $unsigned((wire176 ?
                  ($unsigned($unsigned(reg189)) != (^~(^wire183))) : {(^(reg196 ?
                          wire183 : (8'hb0)))}));
              reg192 <= reg196;
              reg193 <= $signed(((((wire183 ? reg184 : (8'h9c)) + (&wire182)) ?
                      (&(reg196 ?
                          reg197 : wire173)) : $signed($signed(reg196))) ?
                  (8'hae) : $signed($unsigned((8'h9d)))));
              reg194 <= (reg192[(1'h0):(1'h0)] < (~^$signed(wire174)));
              reg195 <= $signed({(~&wire183),
                  $unsigned($unsigned($signed(wire182)))});
            end
          else
            begin
              reg191 <= $signed(reg186);
            end
        end
      if ($signed((((reg193[(2'h3):(1'h1)] ?
              (reg187 != reg192) : {wire174}) << $signed($unsigned(reg196))) ?
          wire180 : $signed(reg190))))
        begin
          reg198 <= (|{wire175, ($unsigned((8'hb9)) && (8'ha1))});
          reg199 <= $unsigned(wire175);
        end
      else
        begin
          reg198 <= $unsigned((|(({reg185, wire173} > wire175) + (-((8'h9e) ?
              wire173 : reg194)))));
          if (($signed($signed({(8'haa)})) ?
              (~^(^~$signed((~^wire175)))) : ((($signed(wire181) < reg198[(2'h3):(2'h2)]) ^~ wire173[(4'h8):(2'h2)]) || wire183[(2'h2):(2'h2)])))
            begin
              reg199 <= wire174[(3'h5):(2'h3)];
              reg200 <= (|reg194[(3'h4):(1'h1)]);
              reg201 <= (wire174 ?
                  (-{$signed(reg184)}) : wire181[(3'h7):(2'h3)]);
            end
          else
            begin
              reg199 <= $unsigned((^~$unsigned($signed((~^wire180)))));
              reg200 <= (^~(reg185 ?
                  $unsigned(({(8'hb5),
                      reg194} <= $unsigned((8'hb7)))) : {reg189[(1'h1):(1'h0)]}));
              reg201 <= reg186[(2'h2):(2'h2)];
            end
          reg202 <= reg188;
        end
      reg203 <= $signed((!wire179));
    end
  assign wire204 = wire181;
  assign wire205 = $unsigned((reg187 + $signed(wire181)));
  assign wire206 = (((reg190 + (~^reg202[(1'h0):(1'h0)])) ?
                       $unsigned(wire175[(3'h4):(2'h3)]) : ($unsigned({wire177}) >= reg191[(1'h1):(1'h0)])) ^ $unsigned(reg187));
  assign wire207 = (reg200[(2'h2):(2'h2)] ?
                       reg191 : ((-reg203[(4'hc):(4'h8)]) | reg192[(4'h9):(4'h9)]));
  always
    @(posedge clk) begin
      if ((reg191 | wire207[(4'h9):(2'h2)]))
        begin
          reg208 <= $unsigned($unsigned($unsigned($unsigned(reg198[(2'h2):(2'h2)]))));
          reg209 <= ((reg202 < wire206) ^ $signed((|(reg201[(1'h1):(1'h0)] ?
              (^~reg189) : (&wire204)))));
          reg210 <= reg189;
          if ((~|(reg186[(1'h0):(1'h0)] ?
              (8'haf) : ({(reg210 == reg189), (reg209 + wire176)} ?
                  (|{reg210, wire183}) : wire177[(3'h5):(2'h2)]))))
            begin
              reg211 <= (&$unsigned({(~^$unsigned(wire173))}));
              reg212 <= ({{(^~reg202[(4'h8):(4'h8)])},
                      (reg201 * $signed(reg202))} ?
                  ((7'h40) ? reg192 : $unsigned((8'hb3))) : {(reg193 ?
                          reg194 : reg197)});
              reg213 <= $unsigned((^(reg210[(3'h4):(1'h0)] == $unsigned($signed(wire179)))));
            end
          else
            begin
              reg211 <= (((^((reg192 <<< reg202) ?
                  reg197[(4'he):(3'h7)] : $unsigned(reg210))) ^ reg211) < ((8'hab) ?
                  (&reg209[(3'h4):(2'h2)]) : wire204[(3'h4):(1'h0)]));
              reg212 <= ($unsigned($signed(wire173)) ?
                  wire207[(2'h3):(2'h3)] : wire183[(4'ha):(4'h9)]);
              reg213 <= reg198;
            end
          if (($signed((-$unsigned($signed(reg191)))) - ($unsigned({{reg202,
                  reg202}}) - (((reg213 > wire182) ?
              $signed(reg202) : $unsigned((8'hb0))) <<< $unsigned($signed(wire177))))))
            begin
              reg214 <= $unsigned((^(|{(reg187 <= (8'h9f))})));
              reg215 <= wire177;
              reg216 <= reg188[(2'h2):(1'h1)];
              reg217 <= $unsigned($unsigned($unsigned(((reg200 ~^ reg188) ?
                  (8'h9d) : wire174))));
            end
          else
            begin
              reg214 <= reg200[(1'h0):(1'h0)];
              reg215 <= reg186;
              reg216 <= $signed((~^reg198[(2'h3):(1'h0)]));
              reg217 <= $signed({$signed(((+(8'ha5)) ^ wire183[(2'h3):(2'h2)])),
                  wire177});
            end
        end
      else
        begin
          reg208 <= $unsigned(reg209[(3'h4):(1'h1)]);
          reg209 <= {{$signed(reg214[(3'h5):(2'h3)])},
              $signed(((!{reg195}) ?
                  ({reg185, reg186} ?
                      reg215[(2'h2):(1'h1)] : $unsigned(reg186)) : reg213))};
          if ($unsigned($unsigned({{reg184}})))
            begin
              reg210 <= (~|reg190[(2'h3):(1'h0)]);
              reg211 <= $unsigned($signed($signed($unsigned($signed(reg213)))));
            end
          else
            begin
              reg210 <= $unsigned(wire173);
              reg211 <= $signed(reg200);
              reg212 <= (reg198[(2'h3):(2'h3)] ^ $signed($signed((reg216[(1'h1):(1'h1)] ?
                  (&wire175) : reg187[(1'h0):(1'h0)]))));
              reg213 <= reg196;
              reg214 <= reg214[(1'h0):(1'h0)];
            end
        end
      if ((8'hbf))
        begin
          reg218 <= (~&(~(wire175 >> ((+reg209) >> wire204[(1'h0):(1'h0)]))));
          reg219 <= $unsigned((reg200[(2'h3):(1'h1)] ?
              $unsigned((+(reg191 ?
                  reg212 : reg212))) : ((reg209 + $unsigned(reg191)) >= ((reg195 ?
                      reg209 : reg187) ?
                  {wire176} : reg201))));
        end
      else
        begin
          reg218 <= $signed((|(reg188 ?
              ($signed(wire205) < $unsigned(wire181)) : ($signed(reg195) ?
                  (reg218 != (8'hb5)) : (wire182 >> reg217)))));
          if ($unsigned(reg215[(4'h9):(4'h9)]))
            begin
              reg219 <= ({(($signed((8'hbf)) ? (&reg201) : $signed(reg196)) ?
                      {reg195} : ((reg218 ? reg210 : reg218) ?
                          reg202[(2'h2):(1'h1)] : $unsigned(reg188))),
                  {($signed((8'hac)) ? (&(8'ha0)) : (8'h9d)),
                      (~&(&(8'hb2)))}} | $unsigned({(^reg217[(1'h1):(1'h1)]),
                  reg214}));
              reg220 <= $signed(reg199[(1'h0):(1'h0)]);
              reg221 <= (($signed((~|(reg189 ^ reg188))) ^ (reg202[(2'h3):(1'h1)] ^~ wire206[(4'ha):(3'h4)])) - (!(~^(!(8'hbe)))));
              reg222 <= reg202;
            end
          else
            begin
              reg219 <= $unsigned(wire174[(1'h0):(1'h0)]);
              reg220 <= $unsigned(($signed((~&reg208)) ?
                  wire180 : $unsigned(wire174[(2'h3):(1'h1)])));
              reg221 <= reg189[(4'hd):(4'h9)];
              reg222 <= $signed($signed({({(8'ha4)} ?
                      reg217[(1'h0):(1'h0)] : reg198)}));
              reg223 <= $unsigned((((|(|reg217)) ?
                      (!$unsigned(wire183)) : ($signed(reg186) ?
                          (reg222 ?
                              wire175 : reg210) : wire183[(1'h0):(1'h0)])) ?
                  reg219[(1'h0):(1'h0)] : wire178[(3'h6):(3'h5)]));
            end
          reg224 <= $signed(((($unsigned(reg190) >> {reg217}) ?
              ($signed(reg197) ?
                  (wire204 < (7'h44)) : reg217[(2'h2):(2'h2)]) : ($unsigned(reg218) | $signed(reg202))) + (~|reg193[(2'h3):(2'h2)])));
          reg225 <= (^{({reg188[(2'h2):(1'h0)]} ?
                  (8'haf) : $signed($unsigned(reg209)))});
          if (wire179)
            begin
              reg226 <= {(~^$signed($unsigned((reg222 ? reg217 : wire179))))};
              reg227 <= $signed(((!reg193[(2'h2):(1'h1)]) && {(~^reg219[(1'h1):(1'h0)])}));
              reg228 <= reg224[(1'h0):(1'h0)];
            end
          else
            begin
              reg226 <= ($signed({{wire174[(3'h5):(3'h5)], wire206},
                      {(~^reg227), (reg218 << reg228)}}) ?
                  ($signed(($signed(reg185) & {reg198})) ?
                      (((-reg196) - reg220) <= wire179[(4'ha):(3'h7)]) : {$signed($unsigned(reg193)),
                          ($unsigned(reg201) * wire182[(2'h2):(1'h1)])}) : (($signed((|reg221)) << $signed((reg213 ?
                      reg195 : wire207))) <<< $unsigned(wire183)));
              reg227 <= ((reg192[(3'h4):(1'h0)] ?
                      $unsigned((wire205[(4'hf):(4'hf)] | $signed(wire182))) : ((((8'had) ?
                              reg211 : (8'hbd)) + {reg224}) ?
                          (&$signed(reg223)) : $signed((8'ha3)))) ?
                  ($unsigned(wire204) ^ {(-(reg211 > reg195))}) : reg227[(3'h6):(3'h6)]);
            end
        end
      reg229 <= reg200[(1'h1):(1'h0)];
    end
  assign wire230 = wire179;
  always
    @(posedge clk) begin
      reg231 <= $unsigned($unsigned($unsigned((7'h44))));
      if ((((($signed(wire180) & (^wire205)) ~^ reg208[(4'h9):(2'h2)]) ?
          {wire204,
              wire175[(3'h5):(2'h2)]} : wire207[(3'h7):(2'h3)]) > $unsigned($unsigned(wire181))))
        begin
          reg232 <= ({wire176,
              (|($unsigned(reg189) ?
                  $unsigned((8'ha3)) : (~|reg196)))} <= ({reg209} ~^ ((&$signed(wire204)) ?
              $signed(reg223) : reg208[(2'h2):(2'h2)])));
          reg233 <= reg218[(4'ha):(4'h9)];
          reg234 <= $unsigned(((wire178 ?
                  {(reg228 ? reg232 : (8'hb8)),
                      (reg185 ? reg218 : reg221)} : wire181) ?
              ((|{wire183, reg203}) ?
                  $unsigned(wire182[(4'h8):(3'h5)]) : {$signed(wire177)}) : $signed((reg211[(2'h2):(1'h1)] == (&(8'haf))))));
          reg235 <= (&(wire182 <= reg216));
        end
      else
        begin
          if (((((reg190 ?
                  (wire180 ? wire175 : reg194) : (reg224 ?
                      reg192 : wire230)) ^ (8'ha3)) ?
              {((reg232 ^~ reg224) > $unsigned(reg200))} : $unsigned($signed((reg202 ?
                  (8'h9e) : reg223)))) | $unsigned((($unsigned((8'haf)) ?
                  reg187[(4'ha):(4'h9)] : (~&(8'haf))) ?
              $signed($signed((8'hb0))) : (+(reg198 ? reg184 : (8'hac)))))))
            begin
              reg232 <= (({$signed(((8'hb6) != reg185)),
                      {$unsigned(reg191)}} < ($unsigned((wire178 ?
                          wire173 : reg194)) ?
                      (wire207[(4'ha):(2'h2)] >>> (reg228 ^~ reg215)) : ((^~reg228) ~^ reg214))) ?
                  ({((reg211 ? wire176 : reg218) ~^ $signed(reg192)),
                      (7'h41)} && $signed($signed((-reg184)))) : reg227[(3'h7):(2'h3)]);
              reg233 <= (+(~&reg198[(3'h4):(1'h0)]));
            end
          else
            begin
              reg232 <= reg186[(2'h3):(2'h3)];
            end
        end
    end
  assign wire236 = $signed(($signed((~&reg222)) ?
                       $signed($unsigned($signed(reg228))) : ((reg217[(2'h2):(2'h2)] ?
                           {(8'ha3)} : reg209) << $signed($unsigned(reg233)))));
  assign wire237 = (&(~|reg187[(3'h6):(1'h1)]));
  assign wire238 = $signed(reg218[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg239 <= $unsigned($unsigned(($signed($unsigned(reg217)) - (^~$signed(wire179)))));
      reg240 <= $signed($unsigned(reg202));
      reg241 <= wire179[(1'h0):(1'h0)];
    end
  assign wire242 = wire182[(4'hb):(4'ha)];
  assign wire243 = wire176;
  always
    @(posedge clk) begin
      if (reg222)
        begin
          reg244 <= $unsigned((-(^((+reg189) ? wire207 : reg210))));
          if ((~reg218[(4'hc):(4'h8)]))
            begin
              reg245 <= (~&((((reg219 ? (8'hbb) : reg186) ?
                  $signed(reg196) : (reg240 ?
                      reg241 : reg231)) <= $signed(reg228[(4'he):(4'h9)])) & $unsigned(({(8'ha4),
                      reg214} ?
                  {wire173} : (reg222 + (8'hba))))));
            end
          else
            begin
              reg245 <= ($signed(reg217) ?
                  ((~^{(reg223 ? reg209 : reg211)}) ?
                      {$signed((!reg239)),
                          (~^wire237[(3'h4):(3'h4)])} : $signed(((reg201 ?
                          (8'hbd) : reg193) < $unsigned(reg226)))) : reg200[(1'h1):(1'h0)]);
            end
          if ((reg221[(2'h2):(1'h0)] ?
              ((reg209[(1'h1):(1'h1)] > (^reg233[(4'hf):(3'h7)])) && $unsigned({(+(8'ha5)),
                  (reg202 == reg225)})) : (!wire175)))
            begin
              reg246 <= reg212[(2'h3):(1'h1)];
            end
          else
            begin
              reg246 <= (+$unsigned({((reg197 ? wire242 : wire175) ?
                      (^~reg232) : (~|reg227)),
                  $signed(reg235)}));
              reg247 <= $signed(wire179[(4'hc):(2'h3)]);
              reg248 <= $unsigned(($unsigned((|$unsigned((8'hbb)))) ?
                  $signed((((8'hb9) * reg216) >>> reg195)) : (7'h44)));
              reg249 <= wire238[(1'h0):(1'h0)];
            end
          reg250 <= ($signed((reg229[(2'h3):(1'h1)] ?
              (8'ha7) : reg244)) >> {{{(reg190 ? reg219 : (8'hb3)),
                      (reg234 ? (7'h41) : (8'haa))}}});
          reg251 <= $unsigned($unsigned(reg227[(2'h3):(2'h2)]));
        end
      else
        begin
          reg244 <= $signed($signed({wire230}));
        end
      reg252 <= wire173[(3'h6):(3'h5)];
      reg253 <= (wire238[(1'h0):(1'h0)] ?
          $signed(wire207) : reg219[(2'h3):(1'h0)]);
    end
  assign wire254 = ((7'h42) ?
                       ({$unsigned({wire183, wire180}),
                               (~^wire238[(2'h2):(1'h0)])} ?
                           (&reg221) : ({(wire174 <<< (8'haa)),
                                   (reg234 ? reg223 : reg251)} ?
                               ((-reg197) ?
                                   $unsigned((7'h42)) : $unsigned(reg201)) : $unsigned(wire177[(3'h4):(3'h4)]))) : wire238);
  assign wire255 = $signed((reg248 ?
                       reg247[(2'h3):(1'h1)] : reg203[(4'hf):(4'hf)]));
endmodule

module module128
#(parameter param167 = {((((^(8'hb5)) ? (~^(8'ha6)) : (|(7'h43))) ? ((8'ha8) & ((8'ha9) >= (8'hb3))) : {(~(8'had)), {(8'h9e)}}) ? ((((7'h42) ? (8'h9f) : (8'hb2)) ? ((8'hb5) || (7'h40)) : {(8'ha6), (8'hab)}) ? {((8'hbd) ? (8'hb6) : (8'had)), ((7'h44) >> (8'h9f))} : (~((8'h9e) <= (8'hac)))) : ({{(8'had), (7'h43)}, (!(8'h9f))} * (!(^~(8'hb5))))), (((+(!(8'hb1))) ? (((8'hb9) ? (7'h43) : (8'ha6)) ? ((8'hb7) <= (8'had)) : ((8'hac) ? (8'hbd) : (8'hb8))) : {((7'h44) ? (8'hbb) : (8'hac))}) << (~(((8'h9d) && (8'ha1)) ? (8'hb1) : (~&(8'hb5)))))})
(y, clk, wire133, wire132, wire131, wire130, wire129);
  output wire [(32'h17b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire133;
  input wire signed [(3'h6):(1'h0)] wire132;
  input wire [(2'h2):(1'h0)] wire131;
  input wire [(4'ha):(1'h0)] wire130;
  input wire signed [(3'h5):(1'h0)] wire129;
  wire [(5'h13):(1'h0)] wire165;
  wire [(5'h12):(1'h0)] wire164;
  wire [(5'h13):(1'h0)] wire163;
  wire signed [(5'h10):(1'h0)] wire160;
  wire [(5'h13):(1'h0)] wire159;
  wire signed [(3'h5):(1'h0)] wire158;
  wire signed [(5'h15):(1'h0)] wire157;
  wire [(5'h12):(1'h0)] wire156;
  wire signed [(4'h8):(1'h0)] wire155;
  wire [(4'ha):(1'h0)] wire154;
  wire [(3'h5):(1'h0)] wire153;
  wire signed [(3'h6):(1'h0)] wire152;
  wire signed [(2'h3):(1'h0)] wire151;
  wire [(3'h5):(1'h0)] wire150;
  wire signed [(3'h4):(1'h0)] wire149;
  wire [(5'h15):(1'h0)] wire148;
  wire [(5'h12):(1'h0)] wire136;
  wire [(5'h13):(1'h0)] wire135;
  wire [(2'h2):(1'h0)] wire134;
  reg signed [(5'h14):(1'h0)] reg166 = (1'h0);
  reg [(4'hb):(1'h0)] reg162 = (1'h0);
  reg [(4'h8):(1'h0)] reg161 = (1'h0);
  reg [(4'hf):(1'h0)] reg147 = (1'h0);
  reg [(5'h13):(1'h0)] reg146 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg143 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg142 = (1'h0);
  reg [(4'hf):(1'h0)] reg141 = (1'h0);
  reg [(4'h8):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg139 = (1'h0);
  reg [(2'h2):(1'h0)] reg138 = (1'h0);
  reg [(4'ha):(1'h0)] reg137 = (1'h0);
  assign y = {wire165,
                 wire164,
                 wire163,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire136,
                 wire135,
                 wire134,
                 reg166,
                 reg162,
                 reg161,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 (1'h0)};
  assign wire134 = wire131;
  assign wire135 = wire129[(3'h4):(1'h0)];
  assign wire136 = ((^~(^~$unsigned((wire129 >>> wire132)))) <<< (-(~|$unsigned({(8'h9d)}))));
  always
    @(posedge clk) begin
      if ({wire130[(3'h5):(1'h1)]})
        begin
          if ($unsigned(((wire129 - ((-(8'hb6)) - (wire131 ?
              wire135 : wire135))) < (($signed((8'hb0)) ?
              wire129[(3'h4):(2'h3)] : $unsigned((8'ha3))) ^~ ({wire132} || wire135[(4'ha):(2'h3)])))))
            begin
              reg137 <= $unsigned(($signed((&(wire129 | (8'h9d)))) != (-{wire130})));
              reg138 <= $unsigned((((wire131 ?
                          wire132[(3'h5):(3'h4)] : (wire130 ~^ wire133)) ?
                      ($unsigned(wire129) >>> wire133[(3'h7):(3'h7)]) : reg137) ?
                  wire136[(5'h12):(1'h1)] : $unsigned(wire129[(1'h0):(1'h0)])));
            end
          else
            begin
              reg137 <= reg138;
              reg138 <= (^$signed(({(|wire131), $signed(wire131)} ?
                  wire129 : ((~|reg138) ?
                      $signed(wire135) : $signed(wire135)))));
              reg139 <= {$unsigned(((~(~|wire135)) > wire130))};
              reg140 <= $signed((|(-((wire135 ? reg139 : wire136) ?
                  $unsigned(wire132) : (-wire130)))));
            end
          reg141 <= (^{{(~|{reg139})}});
          reg142 <= reg139[(3'h4):(3'h4)];
        end
      else
        begin
          if (wire132)
            begin
              reg137 <= (~wire131[(2'h2):(1'h0)]);
            end
          else
            begin
              reg137 <= $signed(((!$unsigned({wire136, reg142})) ^ reg137));
              reg138 <= (({wire133} < (~&$signed($signed(reg137)))) | {(reg139[(3'h7):(2'h3)] | (~|reg139[(2'h2):(2'h2)]))});
              reg139 <= (reg142[(1'h0):(1'h0)] | $signed(reg137));
              reg140 <= (&$unsigned(($signed($unsigned(reg139)) ?
                  (wire129[(3'h5):(1'h0)] << $signed(reg141)) : wire130[(4'ha):(4'h8)])));
              reg141 <= (^~(-((((8'ha5) && wire134) ?
                      (reg137 ? reg138 : reg140) : wire136) ?
                  (8'haa) : (&(reg142 << (8'ha2))))));
            end
          reg142 <= wire132;
          reg143 <= reg141;
        end
      reg144 <= wire129[(2'h2):(1'h1)];
      if ((-{$signed((7'h42)), $unsigned((+(reg143 ? wire135 : wire134)))}))
        begin
          reg145 <= ($signed(({(reg139 ?
                  wire135 : wire131)} << $signed($signed(reg144)))) == (reg137 ?
              $unsigned(reg143) : $unsigned((~^reg143[(4'h8):(1'h0)]))));
          if (wire130)
            begin
              reg146 <= $unsigned(wire135[(4'hb):(1'h1)]);
              reg147 <= $unsigned(((^reg140) & ($signed((reg145 <<< reg139)) <<< (wire134[(2'h2):(1'h1)] << (8'haa)))));
            end
          else
            begin
              reg146 <= (!((-$unsigned($signed(reg138))) >> {$unsigned(wire134)}));
              reg147 <= (~&reg147[(4'he):(4'hb)]);
            end
        end
      else
        begin
          reg145 <= (($signed($signed($signed(wire131))) ?
                  $signed(((wire134 == wire134) & $signed(wire129))) : $signed({(|wire133)})) ?
              (^(reg147 ?
                  $signed($unsigned((8'haf))) : (wire130 <= wire133[(3'h7):(3'h7)]))) : reg138);
        end
    end
  assign wire148 = wire135[(4'hf):(1'h0)];
  assign wire149 = wire130;
  assign wire150 = (!$unsigned((8'hbd)));
  assign wire151 = (~^(~^reg137));
  assign wire152 = (wire130 ?
                       (($unsigned($signed(wire135)) ?
                           (~|(wire149 == wire151)) : wire130[(2'h3):(2'h2)]) << $unsigned(((^~wire133) ?
                           (wire130 ?
                               (8'ha4) : wire149) : $signed((8'had))))) : wire134[(2'h2):(1'h0)]);
  assign wire153 = (-wire132);
  assign wire154 = ($unsigned(reg146[(2'h3):(1'h1)]) ~^ reg138[(2'h2):(1'h1)]);
  assign wire155 = $signed(($unsigned(wire135) ?
                       reg147[(3'h4):(1'h1)] : {reg145[(3'h7):(3'h5)]}));
  assign wire156 = wire129;
  assign wire157 = $unsigned($unsigned($unsigned(((reg143 ?
                       wire151 : wire134) >>> $unsigned(wire135)))));
  assign wire158 = {reg140,
                       ((&(7'h44)) ?
                           {$unsigned($signed(wire150))} : ({(reg147 >>> wire133)} ?
                               $signed($signed((8'ha4))) : (((8'ha4) ?
                                   (8'hbf) : reg140) | {wire135, wire156})))};
  assign wire159 = (reg141 ^ $signed((~|$signed((-(8'had))))));
  assign wire160 = (wire134[(2'h2):(1'h0)] | $signed({$unsigned((+wire129)),
                       ((wire157 ? wire148 : wire130) ?
                           (wire129 - reg146) : (8'h9e))}));
  always
    @(posedge clk) begin
      reg161 <= $signed((reg139[(3'h4):(3'h4)] <<< (~^($signed((8'hac)) <= $unsigned(wire152)))));
      reg162 <= $unsigned(reg139[(3'h6):(3'h5)]);
    end
  assign wire163 = wire133;
  assign wire164 = wire129[(2'h2):(1'h0)];
  assign wire165 = (($unsigned((^~(wire158 << wire155))) ?
                       $unsigned((reg162 && (wire157 ?
                           reg147 : wire159))) : ((~^(wire150 ?
                               (8'ha3) : reg145)) ?
                           $signed(reg139) : (~^$signed(wire132)))) != ((-(8'h9d)) ?
                       (+((wire130 && reg144) ?
                           reg142 : $unsigned(reg146))) : ($unsigned($unsigned((8'ha6))) ?
                           (wire152 ?
                               $signed(reg162) : wire129) : $unsigned($unsigned(reg139)))));
  always
    @(posedge clk) begin
      reg166 <= ((^(^~(!reg144))) ?
          {$signed(wire150[(2'h2):(1'h1)])} : wire135);
    end
endmodule

module module68
#(parameter param119 = {(((((8'hb8) ? (8'h9c) : (8'haa)) ? ((8'ha0) ? (8'ha3) : (8'hb3)) : ((8'ha2) - (8'hab))) ? ((~(8'hbc)) ? {(8'hb8)} : (|(8'ha0))) : (~^((7'h41) ? (8'ha9) : (8'ha3)))) == ({((8'h9e) ^ (8'ha1)), ((8'hbe) < (8'ha5))} && (~|((7'h41) ~^ (8'hb5))))), ({(((8'haa) && (8'ha5)) ~^ ((8'ha1) ? (8'ha0) : (8'h9c))), ((~^(8'haa)) ^~ (8'hae))} ~^ {(((8'hb5) ^~ (8'h9e)) ? (!(8'ha4)) : ((8'ha0) || (8'ha2))), (((8'hbf) || (8'ha3)) ? {(8'ha5)} : (!(7'h42)))})})
(y, clk, wire72, wire71, wire70, wire69);
  output wire [(32'h219):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire72;
  input wire signed [(4'hc):(1'h0)] wire71;
  input wire [(4'ha):(1'h0)] wire70;
  input wire [(5'h12):(1'h0)] wire69;
  wire [(5'h11):(1'h0)] wire118;
  wire [(3'h5):(1'h0)] wire117;
  wire [(4'ha):(1'h0)] wire116;
  wire [(3'h7):(1'h0)] wire115;
  wire [(4'h9):(1'h0)] wire87;
  wire [(5'h10):(1'h0)] wire86;
  wire signed [(4'h9):(1'h0)] wire85;
  wire [(4'h8):(1'h0)] wire84;
  wire signed [(4'ha):(1'h0)] wire83;
  wire signed [(5'h12):(1'h0)] wire82;
  wire [(5'h15):(1'h0)] wire76;
  wire [(4'ha):(1'h0)] wire75;
  wire [(4'hb):(1'h0)] wire74;
  wire signed [(2'h3):(1'h0)] wire73;
  reg [(5'h11):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg113 = (1'h0);
  reg [(4'hb):(1'h0)] reg112 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg111 = (1'h0);
  reg [(2'h2):(1'h0)] reg110 = (1'h0);
  reg [(5'h14):(1'h0)] reg109 = (1'h0);
  reg [(2'h3):(1'h0)] reg108 = (1'h0);
  reg signed [(4'he):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg106 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg105 = (1'h0);
  reg [(5'h14):(1'h0)] reg104 = (1'h0);
  reg [(5'h12):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg102 = (1'h0);
  reg [(4'hc):(1'h0)] reg101 = (1'h0);
  reg [(5'h13):(1'h0)] reg100 = (1'h0);
  reg [(5'h15):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg98 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg97 = (1'h0);
  reg [(4'hb):(1'h0)] reg96 = (1'h0);
  reg [(4'h9):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg93 = (1'h0);
  reg [(4'h8):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg91 = (1'h0);
  reg [(3'h6):(1'h0)] reg90 = (1'h0);
  reg [(4'hb):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg88 = (1'h0);
  reg [(5'h11):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg80 = (1'h0);
  reg [(4'he):(1'h0)] reg79 = (1'h0);
  reg [(3'h7):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg77 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 reg114,
                 reg113,
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
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 (1'h0)};
  assign wire73 = $unsigned(wire70[(3'h4):(2'h3)]);
  assign wire74 = $signed(($unsigned($unsigned(wire70)) ?
                      $unsigned(wire72[(4'h8):(3'h6)]) : wire71));
  assign wire75 = (^$signed(((wire72[(4'hc):(2'h3)] ?
                          (wire72 ? wire71 : wire74) : (wire73 ?
                              wire74 : wire72)) ?
                      ((wire72 ? wire74 : wire70) ?
                          wire70 : $signed(wire70)) : (&$signed(wire70)))));
  assign wire76 = {$unsigned(($unsigned(wire73[(1'h1):(1'h1)]) || wire71[(3'h4):(2'h3)]))};
  always
    @(posedge clk) begin
      reg77 <= $unsigned(wire75[(3'h7):(1'h0)]);
      if (($signed((^{wire69[(2'h2):(2'h2)],
          (7'h43)})) && {(~$signed(wire69[(5'h12):(4'h9)]))}))
        begin
          reg78 <= (^wire70);
          reg79 <= wire73;
        end
      else
        begin
          reg78 <= wire75;
        end
      reg80 <= wire76[(3'h6):(1'h1)];
      reg81 <= (8'hba);
    end
  assign wire82 = $signed($unsigned($signed({(~wire69), reg77})));
  assign wire83 = (((($signed((8'ha4)) || (8'ha8)) < {wire76}) || wire71[(4'hc):(4'h9)]) - reg80[(2'h2):(1'h0)]);
  assign wire84 = wire82[(3'h4):(2'h2)];
  assign wire85 = (~&(($unsigned((^~reg77)) ?
                          wire69[(2'h3):(2'h3)] : wire74[(4'h9):(3'h4)]) ?
                      $unsigned((~|(reg81 >= (8'hb0)))) : $unsigned(reg77)));
  assign wire86 = ($unsigned((~$unsigned(wire71))) || $unsigned((((wire74 != wire70) >>> $signed(wire83)) ?
                      ($signed(wire72) ~^ {reg79, wire73}) : reg80)));
  assign wire87 = ((8'had) || wire73[(2'h3):(1'h0)]);
  always
    @(posedge clk) begin
      if (wire76)
        begin
          reg88 <= wire73;
          reg89 <= {(((((8'hb7) ?
                      wire70 : wire84) >>> (reg79 ^ wire86)) - $unsigned($unsigned(reg88))) ?
                  wire71[(4'ha):(4'ha)] : $signed((^((8'h9d) + (8'hbb))))),
              wire72[(2'h3):(2'h3)]};
        end
      else
        begin
          reg88 <= (+wire73);
        end
      if (wire87[(4'h8):(4'h8)])
        begin
          reg90 <= wire70;
          reg91 <= (wire70[(4'h9):(2'h3)] <<< $unsigned(((&wire87) ?
              (reg89 ? $signed(wire74) : (reg77 + (8'hb1))) : ({wire72} ?
                  (reg90 && wire69) : ((8'haa) < wire84)))));
          if ({(wire72[(2'h2):(2'h2)] ? reg78[(2'h2):(1'h0)] : $signed(reg91))})
            begin
              reg92 <= reg78[(1'h0):(1'h0)];
            end
          else
            begin
              reg92 <= (8'hb4);
              reg93 <= $unsigned((^~$unsigned(wire72[(2'h3):(2'h3)])));
              reg94 <= reg80;
            end
          if ({(^~reg93),
              $signed((((^~wire69) ?
                  (reg90 ? (8'h9c) : reg78) : (wire72 > reg89)) < (^~(wire83 ?
                  reg93 : (8'hbb)))))})
            begin
              reg95 <= (((+reg90) ?
                  reg88 : (((wire83 ? wire87 : reg91) ?
                      (reg88 - (8'ha2)) : $signed(wire83)) && wire75)) + ($unsigned(wire87) ?
                  wire87[(1'h0):(1'h0)] : $signed($signed((&wire72)))));
              reg96 <= wire84;
              reg97 <= (^(^~$unsigned({reg94})));
              reg98 <= reg88[(2'h3):(1'h1)];
            end
          else
            begin
              reg95 <= (((($unsigned(wire86) ?
                              reg97[(2'h2):(1'h0)] : {wire73, reg78}) ?
                          (8'hb3) : (((8'hb7) | reg81) ^~ (&reg91))) ?
                      wire75[(2'h2):(1'h0)] : (!$signed((reg90 + reg94)))) ?
                  {(~&wire85)} : (($unsigned(wire84) ?
                      {$signed(reg80)} : (^((8'had) | wire83))) < wire75[(3'h6):(1'h0)]));
              reg96 <= reg97;
              reg97 <= reg78;
              reg98 <= $unsigned(wire72[(2'h3):(1'h0)]);
            end
          reg99 <= reg95;
        end
      else
        begin
          reg90 <= (!$signed((7'h43)));
          if ($signed((+(~(reg94 >= (+reg81))))))
            begin
              reg91 <= (($unsigned($unsigned(wire71)) | $signed(((wire85 ?
                  wire73 : reg99) << {reg88,
                  wire82}))) <= wire74[(3'h6):(3'h4)]);
              reg92 <= (reg98 >> reg97[(2'h2):(1'h0)]);
              reg93 <= (|(&wire83[(1'h0):(1'h0)]));
              reg94 <= {((8'hae) ? reg94[(1'h1):(1'h0)] : reg94[(1'h1):(1'h0)]),
                  (((~^(reg78 > reg79)) ?
                      reg79[(3'h5):(2'h3)] : reg94) & ((8'ha2) ?
                      {(reg81 == (7'h40))} : reg81[(1'h0):(1'h0)]))};
            end
          else
            begin
              reg91 <= reg91[(3'h4):(1'h1)];
              reg92 <= ((~^$signed(($signed(wire74) ?
                      $unsigned(reg89) : (reg99 ? reg93 : reg88)))) ?
                  wire85 : wire82[(3'h6):(2'h3)]);
            end
          if (wire76[(3'h4):(2'h2)])
            begin
              reg95 <= (^~(reg96 ?
                  {{(-wire85), reg97}, reg94[(1'h1):(1'h0)]} : reg96));
              reg96 <= ((reg81 - (($unsigned((7'h44)) ? (~|wire83) : reg94) ?
                      reg96[(4'ha):(1'h1)] : $signed(reg78))) ?
                  ($unsigned(((wire84 >> wire83) >= (wire76 ? reg99 : reg81))) ?
                      (~((wire84 == reg88) ?
                          (wire74 ?
                              reg95 : reg98) : reg89[(4'hb):(3'h4)])) : reg77) : (~&$signed((~|reg94))));
              reg97 <= ((reg94[(1'h1):(1'h0)] > (reg99 >= reg77)) + {{$unsigned(wire70),
                      $signed(reg99[(1'h1):(1'h1)])}});
            end
          else
            begin
              reg95 <= ({$signed($signed((wire75 ?
                      wire69 : (8'hb7))))} > {{$unsigned((wire82 ?
                          wire82 : reg88))},
                  $unsigned(reg79)});
              reg96 <= wire87;
              reg97 <= (reg79[(2'h3):(1'h0)] ?
                  $signed(reg80) : $signed((~|((-reg91) == $unsigned(wire84)))));
              reg98 <= reg94[(1'h1):(1'h0)];
              reg99 <= (!{(($unsigned(reg88) | {reg90}) ~^ reg78[(3'h6):(2'h3)]),
                  reg80});
            end
          if (reg91)
            begin
              reg100 <= wire72;
              reg101 <= wire69[(5'h12):(3'h6)];
              reg102 <= (({$signed(((8'hb9) ?
                      (8'hb6) : reg77))} >>> (+(|(reg78 * reg81)))) == $signed((reg77[(4'hc):(1'h1)] ?
                  $unsigned((wire71 ?
                      wire85 : reg91)) : $unsigned((wire71 - reg91)))));
            end
          else
            begin
              reg100 <= reg80;
              reg101 <= reg92[(3'h4):(1'h1)];
              reg102 <= wire73;
            end
        end
      reg103 <= reg101[(1'h0):(1'h0)];
      if ((reg92 ? reg77 : wire84[(1'h0):(1'h0)]))
        begin
          if ((((((reg99 == wire85) * $signed(wire87)) ?
                  ({wire76,
                      (8'had)} <= (reg89 - reg102)) : reg89[(2'h2):(1'h0)]) != $unsigned(((8'hbf) ?
                  (reg92 * wire84) : $unsigned((7'h42))))) ?
              wire87 : $unsigned((~(^((8'haa) < reg90))))))
            begin
              reg104 <= reg79[(1'h0):(1'h0)];
              reg105 <= $unsigned(($signed(wire83) ?
                  (($signed((8'ha3)) ?
                      {wire73, reg96} : (~&wire86)) != (^(reg81 ?
                      wire84 : reg88))) : $unsigned($unsigned($unsigned(reg96)))));
              reg106 <= $unsigned(reg100[(5'h11):(4'hb)]);
              reg107 <= wire86[(4'hd):(1'h1)];
            end
          else
            begin
              reg104 <= wire87;
              reg105 <= (~&$signed((8'h9f)));
              reg106 <= (({((reg102 ? wire82 : wire85) && $unsigned(reg89)),
                          ({reg99} ? {(8'had)} : (8'hb4))} ?
                      (~reg95[(1'h1):(1'h0)]) : (!($signed(reg100) ?
                          reg105[(3'h4):(1'h0)] : (wire85 + reg99)))) ?
                  wire75[(4'h8):(4'h8)] : (+reg89[(2'h3):(2'h3)]));
              reg107 <= (reg92[(2'h3):(2'h3)] + {$signed($signed((reg103 || reg93))),
                  $signed((&$unsigned(wire70)))});
            end
          if (reg99[(4'ha):(3'h5)])
            begin
              reg108 <= (((&$unsigned($unsigned(reg95))) ?
                      wire70 : ($signed((~wire84)) >>> ({wire73, wire73} ?
                          {reg100, (8'hb7)} : reg77[(3'h7):(2'h2)]))) ?
                  {wire76[(5'h15):(4'hf)]} : reg78[(3'h6):(3'h4)]);
              reg109 <= ($unsigned(($unsigned($signed(reg78)) | reg80)) == $unsigned(wire86[(3'h7):(3'h7)]));
              reg110 <= (~^$signed($unsigned(({wire72} ?
                  $unsigned(reg109) : (wire75 ? wire71 : (8'hb4))))));
            end
          else
            begin
              reg108 <= reg78;
              reg109 <= ($signed(reg96) * (~reg102[(4'ha):(4'h9)]));
              reg110 <= (~&reg107);
              reg111 <= reg103[(4'ha):(3'h7)];
            end
          reg112 <= $unsigned($signed((($unsigned(wire70) > ((8'hae) ?
              wire69 : (7'h43))) ^ (reg91[(4'h8):(2'h3)] <= wire71))));
          reg113 <= (~{($signed(reg95) | (reg92[(2'h2):(1'h1)] <= $unsigned((8'hb2))))});
        end
      else
        begin
          reg104 <= (reg90[(1'h1):(1'h0)] <<< ($unsigned(reg80) ?
              {reg110, reg105[(3'h7):(1'h0)]} : (~&reg100)));
          reg105 <= ($unsigned($unsigned($signed(reg81))) > wire75);
          reg106 <= $unsigned(($signed(reg91[(4'h8):(4'h8)]) ?
              reg103[(4'h9):(3'h5)] : $unsigned(((reg94 ? (7'h43) : wire75) ?
                  (wire74 ? reg112 : reg113) : (~|reg79)))));
          reg107 <= ($signed(reg110[(2'h2):(2'h2)]) ?
              (^~((~|$unsigned((7'h41))) ?
                  $signed((wire85 - reg107)) : reg104)) : {$unsigned((8'hac)),
                  $unsigned($signed(reg79))});
        end
      reg114 <= ($signed(reg99[(4'ha):(3'h6)]) ?
          $unsigned((reg107[(3'h7):(3'h6)] ?
              {((8'h9c) ^~ reg100)} : (8'haf))) : $signed((~|wire70[(3'h4):(2'h3)])));
    end
  assign wire115 = (reg92[(2'h3):(1'h0)] - (!(reg114 ?
                       $signed(reg106) : $signed($signed(reg96)))));
  assign wire116 = (~^$signed(((((8'ha5) - reg97) ?
                       {reg88, wire86} : reg81) <= $signed((reg112 ?
                       reg111 : wire82)))));
  assign wire117 = {$signed($signed({(reg110 ? (8'hbe) : reg104),
                           reg110[(1'h0):(1'h0)]})),
                       reg103};
  assign wire118 = $signed($signed((-(|wire85))));
endmodule

module module44  (y, clk, wire48, wire47, wire46, wire45);
  output wire [(32'hcf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire48;
  input wire [(3'h7):(1'h0)] wire47;
  input wire [(4'h9):(1'h0)] wire46;
  input wire signed [(5'h14):(1'h0)] wire45;
  wire [(5'h14):(1'h0)] wire64;
  wire signed [(4'he):(1'h0)] wire63;
  wire [(5'h11):(1'h0)] wire62;
  wire [(5'h15):(1'h0)] wire61;
  wire signed [(5'h15):(1'h0)] wire60;
  wire signed [(3'h4):(1'h0)] wire59;
  wire signed [(2'h2):(1'h0)] wire58;
  wire signed [(4'he):(1'h0)] wire57;
  wire [(4'ha):(1'h0)] wire56;
  wire signed [(4'hd):(1'h0)] wire55;
  wire signed [(5'h10):(1'h0)] wire54;
  wire signed [(5'h11):(1'h0)] wire53;
  wire [(4'hf):(1'h0)] wire52;
  wire signed [(2'h2):(1'h0)] wire51;
  wire [(3'h6):(1'h0)] wire50;
  wire [(4'he):(1'h0)] wire49;
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 (1'h0)};
  assign wire49 = wire45;
  assign wire50 = wire46;
  assign wire51 = (($signed((wire49[(3'h4):(3'h4)] ?
                          {wire49} : (wire48 ?
                              wire45 : wire49))) > ($signed($signed(wire48)) ?
                          wire47[(2'h3):(1'h1)] : wire47)) ?
                      wire48[(4'hc):(3'h5)] : wire50[(2'h2):(2'h2)]);
  assign wire52 = wire45[(5'h14):(5'h10)];
  assign wire53 = $unsigned((wire51[(2'h2):(1'h1)] < wire45));
  assign wire54 = ((({wire49, (^wire48)} >> $signed(wire47[(3'h4):(1'h1)])) ?
                          wire50[(3'h4):(3'h4)] : $signed(wire53[(2'h3):(2'h3)])) ?
                      $signed(wire48[(4'hd):(1'h0)]) : wire52[(3'h5):(2'h2)]);
  assign wire55 = (~^((^~(+(wire48 || wire51))) ?
                      ($signed(wire53) ?
                          ((|wire51) > (~^wire48)) : $signed($unsigned(wire53))) : wire51));
  assign wire56 = (~^$unsigned($signed(($unsigned(wire53) >= $signed(wire50)))));
  assign wire57 = wire56;
  assign wire58 = wire54;
  assign wire59 = (^{wire52});
  assign wire60 = $unsigned($signed(wire57));
  assign wire61 = wire50;
  assign wire62 = ((-((|$unsigned((8'hb9))) ?
                          $unsigned((|wire55)) : $unsigned($unsigned(wire60)))) ?
                      $unsigned({wire48}) : $signed(((-$signed(wire47)) ?
                          $unsigned($signed(wire55)) : (wire58 ?
                              {wire61} : (wire58 ? wire50 : wire58)))));
  assign wire63 = (~&($unsigned((wire58 ^~ (wire46 ? wire54 : wire47))) ?
                      (((~wire47) ? $signed(wire59) : {(8'ha8), wire55}) ?
                          {(wire59 ^ wire45)} : (wire53 ?
                              $unsigned(wire46) : (~wire52))) : $unsigned({(wire52 ?
                              wire60 : wire58)})));
  assign wire64 = (~&$unsigned($signed($signed({wire60, wire60}))));
endmodule

module module16  (y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire20;
  input wire [(5'h10):(1'h0)] wire19;
  input wire signed [(4'hd):(1'h0)] wire18;
  input wire [(4'h9):(1'h0)] wire17;
  wire signed [(4'hd):(1'h0)] wire40;
  wire signed [(3'h4):(1'h0)] wire39;
  wire [(4'hc):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire27;
  wire signed [(3'h5):(1'h0)] wire26;
  wire [(3'h5):(1'h0)] wire23;
  wire [(2'h3):(1'h0)] wire22;
  wire [(3'h4):(1'h0)] wire21;
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire28,
                 wire27,
                 wire26,
                 wire23,
                 wire22,
                 wire21,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire21 = (^~wire17[(3'h6):(3'h5)]);
  assign wire22 = wire21[(1'h1):(1'h1)];
  assign wire23 = wire17;
  always
    @(posedge clk) begin
      reg24 <= wire18[(1'h1):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg25 <= $unsigned(((^$unsigned(((7'h41) < (8'had)))) ?
          wire19[(3'h7):(1'h0)] : $signed(($signed(wire22) * $signed(wire23)))));
    end
  assign wire26 = ((&$unsigned(wire21)) != (~^wire20[(3'h4):(1'h1)]));
  assign wire27 = $signed(reg25[(2'h2):(2'h2)]);
  assign wire28 = wire17;
  always
    @(posedge clk) begin
      reg29 <= reg24;
      if ($signed((wire27 << (~reg29[(3'h4):(1'h0)]))))
        begin
          reg30 <= wire19[(2'h3):(1'h1)];
          reg31 <= (~$unsigned((+(~(wire26 ? (8'ha2) : wire26)))));
          reg32 <= ((+($signed((wire28 & wire21)) == (~|(wire28 ?
                  wire22 : reg29)))) ?
              {((~&(wire27 ? wire28 : reg25)) >= (8'h9c)),
                  ($unsigned($unsigned(wire26)) ?
                      $unsigned($signed(reg30)) : ((wire28 ^ (8'ha3)) != wire23))} : reg24);
          reg33 <= $signed(wire21[(2'h2):(1'h0)]);
          reg34 <= (({wire27, (wire20 + (wire28 * wire21))} ?
              (wire17 <<< (|reg31)) : wire20[(1'h1):(1'h0)]) ^~ {(((reg25 & reg24) ?
                      $unsigned(wire28) : (wire28 & wire27)) ?
                  (7'h41) : (+{(7'h43), reg32})),
              ($signed(reg31) ?
                  ((reg24 ? reg25 : wire22) ?
                      (reg29 << wire20) : (wire23 ?
                          wire27 : reg33)) : wire19)});
        end
      else
        begin
          reg30 <= $signed(($signed(reg29[(4'hf):(4'hf)]) ?
              wire18[(4'h8):(1'h0)] : $signed($signed((~^reg34)))));
          reg31 <= ((reg33 || reg24) ^ $signed({reg31[(3'h5):(1'h1)]}));
          reg32 <= (({$signed(reg30[(4'h8):(3'h7)]),
              {wire21,
                  reg25}} ^~ ($unsigned($signed(wire23)) | wire22)) | $unsigned(reg25));
          reg33 <= wire23[(3'h4):(1'h1)];
          if ((reg33 ?
              $unsigned(($signed(wire20[(4'ha):(3'h4)]) < $signed((8'h9f)))) : $unsigned(wire28[(4'h8):(3'h7)])))
            begin
              reg34 <= ($unsigned(reg25) ?
                  (wire21[(1'h0):(1'h0)] ?
                      $unsigned(reg34) : (^~wire28)) : (reg29 ?
                      reg24 : wire27[(2'h3):(2'h2)]));
              reg35 <= ((~$unsigned((wire27 ?
                      wire27[(4'hb):(3'h6)] : wire22[(1'h0):(1'h0)]))) ?
                  (&(-(+(reg24 || (8'hb2))))) : wire28[(3'h4):(2'h3)]);
              reg36 <= reg30[(4'h9):(1'h0)];
              reg37 <= {wire27[(4'h9):(1'h1)],
                  {(wire18[(1'h1):(1'h0)] ? ((+reg24) - (&reg30)) : (8'ha9))}};
            end
          else
            begin
              reg34 <= $signed(reg37[(3'h7):(1'h1)]);
              reg35 <= (wire20[(4'h9):(3'h6)] ^~ reg35[(4'he):(4'hd)]);
              reg36 <= wire19;
              reg37 <= {(($unsigned((wire22 ? reg32 : reg34)) ?
                          ((~reg35) && (^wire23)) : reg25) ?
                      {$signed((reg36 ? wire22 : reg33)),
                          reg30[(4'h9):(3'h4)]} : $signed((reg36[(2'h3):(2'h3)] ~^ $signed(wire17))))};
            end
        end
      reg38 <= $signed($signed(((-wire23[(3'h4):(1'h0)]) & wire18[(3'h5):(1'h1)])));
    end
  assign wire39 = $unsigned($unsigned({$signed((reg35 >>> wire28))}));
  assign wire40 = $signed(wire18[(4'ha):(3'h6)]);
endmodule
