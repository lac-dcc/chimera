module top
#(parameter param376 = ((|{(8'ha3)}) >> (((((7'h43) - (8'haf)) < ((8'hbc) ? (8'hbb) : (7'h41))) >> ((~(8'ha4)) >> (7'h41))) ? (-(~&((8'hba) ? (8'hab) : (8'ha0)))) : (8'had))), 
parameter param377 = param376)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h215):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  wire signed [(2'h2):(1'h0)] wire375;
  wire [(4'h8):(1'h0)] wire346;
  wire [(4'h9):(1'h0)] wire345;
  wire [(4'hc):(1'h0)] wire160;
  wire signed [(5'h12):(1'h0)] wire4;
  wire [(4'h9):(1'h0)] wire42;
  wire [(3'h5):(1'h0)] wire165;
  wire signed [(3'h4):(1'h0)] wire166;
  wire signed [(4'ha):(1'h0)] wire167;
  wire [(4'hb):(1'h0)] wire168;
  wire [(2'h2):(1'h0)] wire169;
  wire [(5'h15):(1'h0)] wire170;
  wire [(4'ha):(1'h0)] wire171;
  wire [(5'h15):(1'h0)] wire172;
  wire [(3'h7):(1'h0)] wire343;
  wire [(5'h12):(1'h0)] wire348;
  wire [(4'hb):(1'h0)] wire349;
  wire [(3'h4):(1'h0)] wire373;
  reg signed [(4'hd):(1'h0)] reg372 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg371 = (1'h0);
  reg [(4'hf):(1'h0)] reg370 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg369 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg368 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg367 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg366 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg365 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg364 = (1'h0);
  reg [(5'h14):(1'h0)] reg363 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg362 = (1'h0);
  reg [(5'h14):(1'h0)] reg361 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg360 = (1'h0);
  reg [(4'hf):(1'h0)] reg359 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg358 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg357 = (1'h0);
  reg signed [(4'he):(1'h0)] reg356 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg355 = (1'h0);
  reg [(5'h14):(1'h0)] reg354 = (1'h0);
  reg [(5'h12):(1'h0)] reg353 = (1'h0);
  reg [(5'h11):(1'h0)] reg352 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg351 = (1'h0);
  reg signed [(4'he):(1'h0)] reg350 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg164 = (1'h0);
  reg [(4'hf):(1'h0)] reg163 = (1'h0);
  reg signed [(4'he):(1'h0)] reg162 = (1'h0);
  assign y = {wire375,
                 wire346,
                 wire345,
                 wire160,
                 wire4,
                 wire42,
                 wire165,
                 wire166,
                 wire167,
                 wire168,
                 wire169,
                 wire170,
                 wire171,
                 wire172,
                 wire343,
                 wire348,
                 wire349,
                 wire373,
                 reg372,
                 reg371,
                 reg370,
                 reg369,
                 reg368,
                 reg367,
                 reg366,
                 reg365,
                 reg364,
                 reg363,
                 reg362,
                 reg361,
                 reg360,
                 reg359,
                 reg358,
                 reg357,
                 reg356,
                 reg355,
                 reg354,
                 reg353,
                 reg352,
                 reg351,
                 reg350,
                 reg164,
                 reg163,
                 reg162,
                 (1'h0)};
  assign wire4 = wire1[(4'hc):(4'h8)];
  module5 #() modinst43 (wire42, clk, wire2, wire1, wire3, wire0, wire4);
  module44 #() modinst161 (wire160, clk, wire4, wire2, wire1, wire3, wire42);
  always
    @(posedge clk) begin
      reg162 <= (~^(((^~wire42) >= $signed((|wire4))) ?
          ((~|(wire0 ?
              (8'ha6) : wire4)) >> $signed(((8'hb9) & (7'h43)))) : $unsigned(({wire3,
                  (8'hb3)} ?
              $signed((8'hb3)) : $signed(wire0)))));
      reg163 <= {wire2[(4'h9):(1'h1)],
          $signed($signed($signed(((8'hbe) < (8'hbb)))))};
      reg164 <= (~|$signed($signed((-(&(8'ha5))))));
    end
  assign wire165 = (reg164 ? $signed((8'hb0)) : wire160[(3'h5):(1'h0)]);
  assign wire166 = $unsigned((^~($unsigned((wire1 <<< wire160)) ?
                       $unsigned((reg163 ?
                           wire160 : reg162)) : $signed($unsigned(reg164)))));
  assign wire167 = $unsigned((~&((8'hb6) || (reg162[(3'h7):(3'h7)] == $unsigned(wire42)))));
  assign wire168 = (reg162[(1'h1):(1'h0)] ?
                       $signed((~|$signed((wire0 ?
                           reg162 : reg164)))) : (wire166 ?
                           (7'h44) : $unsigned(({wire165,
                               wire167} - (wire3 << wire42)))));
  assign wire169 = wire3;
  assign wire170 = ((~&($unsigned($unsigned(wire1)) ?
                           (|{wire165, wire160}) : (wire1[(4'hf):(3'h5)] ?
                               wire168[(3'h4):(1'h0)] : $unsigned(wire2)))) ?
                       (8'ha9) : $unsigned(reg164[(3'h6):(3'h6)]));
  assign wire171 = $signed((~|reg163));
  assign wire172 = wire166[(2'h2):(1'h1)];
  module173 #() modinst344 (.y(wire343), .wire176(wire4), .wire174(wire2), .clk(clk), .wire175(wire1), .wire178(wire172), .wire177(wire170));
  assign wire345 = wire42[(4'h9):(1'h0)];
  module44 #() modinst347 (.wire45(wire4), .wire49(reg163), .wire46(wire42), .wire48(wire172), .wire47(reg162), .clk(clk), .y(wire346));
  assign wire348 = {(|wire42[(4'h8):(1'h1)])};
  assign wire349 = wire0[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ({$unsigned({$signed({wire167, wire160})})})
        begin
          if ((((($signed(wire346) >> (-reg164)) ?
                  wire166[(1'h0):(1'h0)] : wire42[(3'h7):(3'h5)]) | $unsigned((~(~^wire4)))) ?
              wire0 : $signed(wire1)))
            begin
              reg350 <= $signed(wire167);
            end
          else
            begin
              reg350 <= $unsigned(wire166[(1'h1):(1'h0)]);
              reg351 <= $unsigned(wire349);
            end
          reg352 <= wire345[(1'h1):(1'h1)];
          if ((8'hb3))
            begin
              reg353 <= ((wire170[(4'hd):(4'hd)] && wire165[(2'h3):(1'h0)]) ?
                  (7'h44) : $signed(wire171));
              reg354 <= $signed((~^wire166[(2'h3):(2'h3)]));
              reg355 <= $signed(wire348[(4'hb):(4'ha)]);
              reg356 <= (8'h9d);
              reg357 <= $signed((~$unsigned(((wire343 ? wire160 : wire160) ?
                  (^~wire0) : $signed(wire348)))));
            end
          else
            begin
              reg353 <= wire168[(4'ha):(4'h8)];
              reg354 <= $unsigned($unsigned((reg351[(3'h6):(2'h2)] ?
                  (wire348 & (wire167 ?
                      reg164 : wire4)) : (((8'hbf) - wire346) ?
                      $unsigned((8'ha9)) : (-wire169)))));
              reg355 <= (^~wire4);
              reg356 <= ($unsigned(reg356) ?
                  (reg163 ?
                      ((+$signed(reg353)) || (((8'h9f) ? reg162 : wire171) ?
                          {wire2, reg352} : {wire169,
                              reg163})) : $unsigned((^~((8'hbe) >>> wire346)))) : (({(reg352 ?
                              (8'hbb) : reg352),
                          (&wire0)} || (((7'h44) != wire42) ?
                          (!reg351) : reg350)) ?
                      {(+$unsigned(wire160)),
                          (8'hbd)} : $signed((wire166[(3'h4):(1'h0)] + wire346[(2'h2):(1'h0)]))));
            end
          if ((!({$signed(wire160[(3'h6):(1'h0)]),
              reg353} > $unsigned(wire160))))
            begin
              reg358 <= (!$signed((~&wire171)));
            end
          else
            begin
              reg358 <= $signed($unsigned(wire160));
              reg359 <= (((+wire343) ?
                  $signed(((wire4 ? reg351 : wire2) ?
                      {(8'hab)} : $signed(wire42))) : wire348) >> {reg350[(2'h2):(1'h0)],
                  reg354[(3'h5):(1'h0)]});
              reg360 <= $unsigned(reg357[(4'ha):(2'h2)]);
              reg361 <= (reg351[(3'h4):(2'h3)] ^~ $signed(wire165));
            end
        end
      else
        begin
          if (wire160[(3'h5):(2'h3)])
            begin
              reg350 <= $unsigned(reg359);
              reg351 <= $unsigned(reg357[(4'ha):(1'h1)]);
              reg352 <= $signed(wire345[(1'h0):(1'h0)]);
              reg353 <= $unsigned((((~&(wire170 ? wire349 : (8'ha4))) ?
                  {{wire349, wire345},
                      ((8'hbf) | wire168)} : (~wire4)) & (|$signed(wire42[(3'h5):(1'h1)]))));
              reg354 <= {wire0};
            end
          else
            begin
              reg350 <= $unsigned($unsigned({$signed(wire3),
                  wire2[(3'h7):(2'h3)]}));
              reg351 <= wire4[(3'h6):(1'h1)];
              reg352 <= (&(!wire167));
              reg353 <= ($signed(wire0[(3'h4):(2'h3)]) ?
                  reg162 : (wire4 ?
                      (+wire345[(1'h0):(1'h0)]) : $unsigned($signed($signed(reg353)))));
            end
          if (wire2)
            begin
              reg355 <= ((!((~&(~(8'hbe))) ?
                      ($signed(wire172) <<< (wire349 < wire1)) : $unsigned(reg355[(2'h2):(2'h2)]))) ?
                  (^~wire42[(1'h0):(1'h0)]) : $signed((!($signed(reg361) > (^~wire169)))));
              reg356 <= (reg358[(2'h3):(2'h2)] << ((wire171[(3'h5):(3'h5)] ?
                      $signed(reg358[(2'h3):(2'h2)]) : (~$signed(reg352))) ?
                  reg351 : (({reg351,
                      reg163} == $unsigned(wire160)) >> ((wire166 | reg354) >> reg359[(4'hc):(3'h6)]))));
              reg357 <= (wire0[(4'hf):(4'h9)] & (~^{(^~$unsigned((8'ha0))),
                  (~$unsigned((8'hac)))}));
            end
          else
            begin
              reg355 <= {($unsigned((~|(reg357 ? (8'hba) : (7'h43)))) ?
                      wire345[(2'h2):(1'h0)] : {$signed((reg357 ~^ (8'ha3))),
                          (((8'hb3) ? wire172 : reg353) ?
                              (wire166 ?
                                  reg162 : wire0) : ((8'haa) ^ wire346))}),
                  (~&reg162)};
              reg356 <= $unsigned(((wire165 ~^ ($unsigned(wire349) - $signed(wire3))) ?
                  $signed($signed({wire166})) : reg358));
            end
          reg358 <= (^~$signed($unsigned(wire346)));
        end
      reg362 <= ($signed((((wire42 ? reg164 : reg351) ?
              (!wire172) : reg361[(3'h7):(3'h6)]) ?
          wire169[(1'h1):(1'h0)] : (reg351 ?
              $unsigned(wire2) : wire160))) & $signed($signed($unsigned((reg354 <<< wire160)))));
      reg363 <= ((+reg163[(4'h9):(2'h2)]) ?
          reg361[(5'h14):(1'h0)] : ({($signed((8'hbd)) ?
                      $signed(wire349) : $signed((8'ha7))),
                  (wire349[(1'h0):(1'h0)] == (8'haf))} ?
              reg350[(3'h6):(3'h4)] : reg353[(4'h8):(4'h8)]));
      reg364 <= $signed($signed((8'haf)));
      if ($signed(reg351[(4'hc):(4'ha)]))
        begin
          reg365 <= (wire170[(2'h3):(2'h2)] > (wire348 ~^ $signed(((wire4 << wire170) ?
              wire172 : $signed(reg356)))));
        end
      else
        begin
          if (reg359)
            begin
              reg365 <= {{($signed((~^reg364)) + $signed($signed(reg355)))},
                  (reg353[(5'h10):(4'hc)] > (^$unsigned(((8'h9d) ?
                      (8'ha8) : reg360))))};
              reg366 <= reg356;
              reg367 <= (reg361[(4'ha):(4'ha)] ? (wire171 ^ reg350) : reg363);
              reg368 <= $unsigned((8'hb5));
            end
          else
            begin
              reg365 <= $unsigned(({(7'h44)} >>> wire346[(1'h1):(1'h0)]));
            end
          if ((8'h9f))
            begin
              reg369 <= $signed(((wire160 << $unsigned((-wire349))) << (wire3 == (reg352 * wire345[(2'h3):(1'h0)]))));
            end
          else
            begin
              reg369 <= ({wire2, $unsigned(({wire1} ^ {reg362}))} ~^ wire167);
              reg370 <= ((8'h9c) ?
                  reg162 : ($signed(reg365) * $unsigned(($unsigned(reg364) ?
                      (|reg356) : reg357))));
              reg371 <= (wire165 * $signed($signed((((7'h42) || (8'ha4)) - $unsigned(wire171)))));
              reg372 <= ($unsigned($unsigned($signed($signed(wire345)))) || (&(($signed(wire3) ?
                  wire167[(3'h6):(3'h6)] : (^(8'hb9))) >= $unsigned($unsigned((7'h41))))));
            end
        end
    end
  module234 #() modinst374 (wire373, clk, reg361, reg358, reg364, wire346, reg360);
  assign wire375 = $signed(reg354[(4'h9):(2'h3)]);
endmodule

module module173
#(parameter param341 = (((^~(((8'hb7) ? (8'hae) : (7'h43)) ? ((8'hb4) >> (8'hae)) : (~(8'h9f)))) ? (((~|(8'hbd)) ? ((8'ha3) << (8'haa)) : ((8'h9d) > (8'ha2))) << (|((8'hb5) != (8'hbd)))) : ((((8'ha7) ? (7'h40) : (8'ha0)) ? ((8'hb3) ? (7'h42) : (7'h44)) : {(7'h43), (8'hbc)}) ? (-((8'h9d) ? (8'h9c) : (8'hbc))) : {((7'h41) ? (8'hbf) : (8'hbf)), (~(8'ha9))})) ? {(((~|(8'h9c)) & ((8'hb6) && (7'h41))) < ((~|(8'ha7)) ? (8'ha7) : (^(8'ha1)))), (8'hb3)} : ((((8'haf) & (^(8'ha1))) - {((8'hbe) ? (8'hbf) : (8'hbc)), ((8'h9c) ? (8'hb4) : (8'ha2))}) ? (^(((8'ha3) ? (8'hb8) : (8'ha6)) | ((8'ha7) && (8'hbc)))) : (8'hb7))), 
parameter param342 = (~|((^{(param341 != param341), (~^param341)}) == param341)))
(y, clk, wire174, wire175, wire176, wire177, wire178);
  output wire [(32'h205):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire174;
  input wire signed [(4'ha):(1'h0)] wire175;
  input wire signed [(4'h8):(1'h0)] wire176;
  input wire signed [(5'h13):(1'h0)] wire177;
  input wire signed [(5'h15):(1'h0)] wire178;
  wire [(4'ha):(1'h0)] wire340;
  wire [(4'he):(1'h0)] wire269;
  wire [(5'h11):(1'h0)] wire233;
  wire [(5'h14):(1'h0)] wire179;
  wire signed [(5'h15):(1'h0)] wire180;
  wire signed [(4'hc):(1'h0)] wire196;
  wire [(5'h11):(1'h0)] wire202;
  wire [(5'h15):(1'h0)] wire231;
  wire [(5'h13):(1'h0)] wire271;
  wire [(3'h5):(1'h0)] wire272;
  wire [(4'hb):(1'h0)] wire279;
  wire [(2'h2):(1'h0)] wire320;
  wire [(5'h10):(1'h0)] wire322;
  wire [(3'h4):(1'h0)] wire323;
  wire [(3'h5):(1'h0)] wire324;
  wire [(2'h2):(1'h0)] wire326;
  wire signed [(3'h4):(1'h0)] wire338;
  reg signed [(3'h5):(1'h0)] reg278 = (1'h0);
  reg [(2'h2):(1'h0)] reg277 = (1'h0);
  reg [(4'h8):(1'h0)] reg276 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg275 = (1'h0);
  reg [(3'h6):(1'h0)] reg274 = (1'h0);
  reg [(3'h4):(1'h0)] reg273 = (1'h0);
  reg [(4'he):(1'h0)] reg181 = (1'h0);
  reg [(4'ha):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg183 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg184 = (1'h0);
  reg [(4'h9):(1'h0)] reg185 = (1'h0);
  reg [(5'h10):(1'h0)] reg186 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg187 = (1'h0);
  reg [(5'h15):(1'h0)] reg188 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg189 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg191 = (1'h0);
  reg [(5'h15):(1'h0)] reg192 = (1'h0);
  reg [(4'hf):(1'h0)] reg193 = (1'h0);
  reg [(4'h8):(1'h0)] reg194 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg195 = (1'h0);
  reg [(4'hb):(1'h0)] reg197 = (1'h0);
  reg [(4'ha):(1'h0)] reg198 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg199 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg200 = (1'h0);
  reg [(4'he):(1'h0)] reg201 = (1'h0);
  reg [(3'h7):(1'h0)] reg325 = (1'h0);
  assign y = {wire340,
                 wire269,
                 wire233,
                 wire179,
                 wire180,
                 wire196,
                 wire202,
                 wire231,
                 wire271,
                 wire272,
                 wire279,
                 wire320,
                 wire322,
                 wire323,
                 wire324,
                 wire326,
                 wire338,
                 reg278,
                 reg277,
                 reg276,
                 reg275,
                 reg274,
                 reg273,
                 reg181,
                 reg182,
                 reg183,
                 reg184,
                 reg185,
                 reg186,
                 reg187,
                 reg188,
                 reg189,
                 reg190,
                 reg191,
                 reg192,
                 reg193,
                 reg194,
                 reg195,
                 reg197,
                 reg198,
                 reg199,
                 reg200,
                 reg201,
                 reg325,
                 (1'h0)};
  assign wire179 = {wire174[(3'h4):(3'h4)]};
  assign wire180 = ((((wire177 - (!wire176)) - wire179[(4'h8):(4'h8)]) ?
                       $signed({(8'hb7)}) : wire174[(2'h3):(1'h1)]) == $signed($unsigned(wire177[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      if (wire180)
        begin
          reg181 <= wire179;
          reg182 <= $signed(wire178[(4'hb):(4'h9)]);
          reg183 <= (reg181[(3'h6):(3'h4)] ?
              ($signed((wire175 ?
                  (^~wire180) : (wire174 ?
                      wire174 : (8'hb0)))) * ((-$signed(wire180)) != wire180[(5'h11):(2'h2)])) : (reg182 ?
                  $unsigned((((7'h43) && wire176) ?
                      $unsigned(wire180) : (wire180 ?
                          reg181 : (8'ha1)))) : (7'h44)));
          if ($signed($signed(($signed((wire176 & reg181)) == {(~&(8'h9c)),
              (-reg183)}))))
            begin
              reg184 <= wire179;
            end
          else
            begin
              reg184 <= ((~$unsigned($unsigned(((8'ha1) ?
                  wire174 : (7'h42))))) ^ (wire175 * wire178[(1'h1):(1'h1)]));
              reg185 <= {(wire174[(1'h0):(1'h0)] ?
                      (($unsigned((8'hb9)) ^ wire177[(5'h13):(3'h4)]) ?
                          ((reg181 != reg183) ^ wire174) : ($unsigned(reg183) < {wire180})) : (8'hbf))};
              reg186 <= (reg181 ?
                  ((~&wire176) ?
                      wire180 : $signed($unsigned($signed(reg185)))) : $signed($signed(($unsigned(reg183) ?
                      ((8'ha5) ? reg185 : (8'ha7)) : reg185))));
              reg187 <= (8'ha1);
            end
          if ($unsigned(wire180[(4'h8):(2'h3)]))
            begin
              reg188 <= {reg182};
              reg189 <= wire176;
              reg190 <= reg182;
              reg191 <= reg186;
              reg192 <= {(-$unsigned((~|(wire174 ? wire180 : wire175)))),
                  ($signed(((reg185 && wire175) && (reg188 >> wire174))) <<< $unsigned($unsigned(wire174[(2'h3):(1'h0)])))};
            end
          else
            begin
              reg188 <= ($unsigned(($unsigned({reg182,
                      reg189}) || ((wire179 && wire179) ^ (reg191 == reg187)))) ?
                  (~^(!wire174[(2'h2):(2'h2)])) : wire180[(5'h15):(3'h6)]);
            end
        end
      else
        begin
          reg181 <= $signed(wire175);
          if ((wire177[(4'hd):(4'hb)] ?
              $unsigned(((wire179[(2'h2):(1'h0)] ^ (reg190 ?
                      (8'hb7) : reg189)) ?
                  wire177 : wire175)) : wire174[(3'h4):(3'h4)]))
            begin
              reg182 <= reg187[(2'h2):(1'h0)];
              reg183 <= $signed(reg188);
              reg184 <= $signed(((8'h9e) ?
                  ($unsigned($unsigned(wire179)) << wire174[(3'h4):(3'h4)]) : reg188));
            end
          else
            begin
              reg182 <= ($signed(reg192) != wire180[(4'h8):(3'h4)]);
              reg183 <= reg182;
              reg184 <= ($unsigned($unsigned(((wire176 ? (8'ha4) : (8'haa)) ?
                      (^~reg187) : (~&reg190)))) ?
                  $unsigned($unsigned($unsigned($signed(reg184)))) : $unsigned($signed((((8'h9e) ?
                      reg187 : reg188) >> {(8'hb3), reg192}))));
              reg185 <= $signed(((+reg188) >>> (wire177 ?
                  ($signed(reg184) | reg183[(3'h4):(1'h1)]) : (8'ha6))));
            end
          reg186 <= $signed($signed(wire175[(4'h9):(3'h5)]));
          if ((~^($signed(((reg181 | wire180) < (wire180 < reg190))) ^ {((reg192 ?
                      reg185 : reg188) ?
                  $signed(reg183) : $unsigned(reg189))})))
            begin
              reg187 <= wire177[(2'h3):(2'h2)];
              reg188 <= $unsigned((wire175[(3'h6):(2'h2)] ?
                  {$signed(wire177[(4'ha):(3'h4)]),
                      $signed(reg190[(2'h2):(1'h1)])} : reg183));
              reg189 <= $signed(wire174);
              reg190 <= $unsigned(wire180[(3'h6):(3'h5)]);
            end
          else
            begin
              reg187 <= ($unsigned(reg192) || $unsigned((((!(8'h9d)) ?
                  wire176[(2'h3):(1'h1)] : (reg181 ?
                      reg190 : reg186)) <<< reg188[(5'h12):(2'h3)])));
              reg188 <= (reg185 * (+$unsigned(((^reg185) ?
                  $unsigned(reg181) : reg186))));
              reg189 <= ($signed((~^((^reg191) < (wire179 ?
                  wire176 : wire177)))) || (reg182[(2'h3):(1'h1)] | ((8'h9f) + (+$unsigned((8'hae))))));
              reg190 <= {(-$unsigned({(&reg186)})),
                  ($unsigned(wire180) ?
                      reg192 : $unsigned($signed((wire180 * reg182))))};
              reg191 <= (reg188[(4'he):(4'ha)] ?
                  (reg182 ?
                      reg183 : reg186[(3'h7):(3'h4)]) : ((^~((8'ha5) != wire176[(3'h7):(3'h7)])) >> ((reg184 ?
                          (reg183 ? (8'ha5) : reg187) : {reg190, wire178}) ?
                      wire174[(1'h0):(1'h0)] : $signed((wire176 ?
                          reg190 : (8'ha4))))));
            end
          reg192 <= (($unsigned((-(&reg186))) >= reg188) <= {((~|$signed(reg192)) | (8'h9c)),
              ($unsigned((reg182 ? wire179 : reg190)) & (+$signed(wire179)))});
        end
      reg193 <= (($unsigned($signed((reg184 <<< reg190))) ?
              wire175[(4'ha):(1'h1)] : (wire180[(2'h2):(1'h1)] != reg182)) ?
          (~reg187) : (~((~(reg187 - (8'hb9))) ?
              $signed((reg188 ? wire179 : reg185)) : $signed({(8'hb4),
                  (7'h42)}))));
      reg194 <= (^(8'hb4));
      reg195 <= reg185[(2'h2):(1'h0)];
    end
  assign wire196 = $signed(($unsigned(reg191) | $unsigned((reg188 ?
                       $signed(reg189) : (reg195 || reg188)))));
  always
    @(posedge clk) begin
      reg197 <= {($unsigned((&wire180)) == (reg188 || ($signed(reg181) < $unsigned(reg193)))),
          reg184};
      reg198 <= (|reg191);
      reg199 <= reg195;
      reg200 <= reg183[(2'h3):(1'h1)];
      reg201 <= reg198[(3'h7):(2'h3)];
    end
  assign wire202 = (reg181[(2'h2):(2'h2)] + $unsigned((+(reg182 != (reg188 ^ reg194)))));
  module203 #() modinst232 (wire231, clk, reg195, wire202, reg188, reg197);
  assign wire233 = {((wire177 ?
                               ((wire174 <= reg182) >>> $unsigned(reg190)) : wire202[(3'h5):(2'h2)]) ?
                           (((wire174 <<< reg201) ?
                                   $unsigned(reg197) : (-wire180)) ?
                               wire174 : (!wire178)) : {$signed((reg193 << wire179)),
                               {$unsigned(reg182)}}),
                       reg182};
  module234 #() modinst270 (wire269, clk, reg184, reg191, reg199, reg188, wire179);
  assign wire271 = wire174[(1'h1):(1'h1)];
  assign wire272 = ($unsigned($signed($signed(wire202[(4'he):(3'h4)]))) ?
                       reg183[(5'h10):(4'hf)] : {reg183[(3'h4):(2'h2)],
                           $signed((8'haa))});
  always
    @(posedge clk) begin
      reg273 <= $unsigned(wire177);
      reg274 <= $unsigned($unsigned({(~|(reg201 >> reg183)),
          ($signed((8'hbf)) ? (wire175 >> reg194) : $unsigned(wire231))}));
      reg275 <= $unsigned(($unsigned($unsigned((reg186 ? reg188 : reg199))) ?
          {wire180, (^((8'ha0) << wire271))} : (~reg194)));
    end
  always
    @(posedge clk) begin
      if (({($unsigned(reg188[(5'h11):(3'h6)]) ?
              $signed((-wire176)) : ((-reg185) * (&wire175))),
          ($unsigned($signed(reg189)) ?
              $signed(((8'hb2) ?
                  reg188 : reg188)) : (~{wire269}))} && {(reg275[(4'hd):(3'h4)] << $unsigned(reg191)),
          $unsigned(($signed(reg185) != reg188[(5'h13):(4'hf)]))}))
        begin
          if (reg195)
            begin
              reg276 <= (&reg186);
            end
          else
            begin
              reg276 <= reg201[(3'h4):(3'h4)];
              reg277 <= reg183[(1'h1):(1'h0)];
            end
          reg278 <= reg192[(2'h3):(1'h1)];
        end
      else
        begin
          reg276 <= ({(&$signed($unsigned(wire175)))} ^ wire177);
          reg277 <= ($unsigned(wire269[(3'h7):(2'h2)]) <<< (~wire176[(2'h3):(1'h0)]));
        end
    end
  assign wire279 = (reg198 <<< {(reg184 ?
                           ($unsigned(wire271) >= (reg198 ?
                               (8'ha4) : reg189)) : reg274[(3'h6):(3'h4)])});
  module280 #() modinst321 (wire320, clk, wire271, reg181, reg190, wire269, reg192);
  assign wire322 = reg188[(1'h1):(1'h0)];
  assign wire323 = (reg197 ^~ ((($signed(wire271) <<< {reg187,
                           wire176}) & ($signed(reg198) ?
                           (8'hb1) : $signed(wire177))) ?
                       $unsigned((^~reg274[(3'h6):(1'h0)])) : {$unsigned(wire231),
                           ($unsigned(reg278) != wire175)}));
  assign wire324 = $unsigned(((($unsigned(reg198) != $signed(wire231)) ?
                           reg273 : $unsigned((wire196 == reg183))) ?
                       wire279[(2'h2):(1'h1)] : $signed($unsigned((&reg278)))));
  always
    @(posedge clk) begin
      reg325 <= (|$signed(reg195[(1'h0):(1'h0)]));
    end
  assign wire326 = (wire180 ?
                       $unsigned((wire176[(1'h0):(1'h0)] ?
                           $unsigned(reg194[(4'h8):(3'h4)]) : (!(~|wire177)))) : $signed((~|$unsigned(reg187[(2'h2):(2'h2)]))));
  module327 #() modinst339 (.wire330(reg200), .wire328(wire323), .wire329(wire322), .y(wire338), .wire331(wire176), .clk(clk));
  assign wire340 = (!$signed(((~$signed(reg189)) <<< $unsigned((&wire323)))));
endmodule

module module44
#(parameter param159 = ({(8'ha3)} ? (~&((((8'ha5) * (8'had)) << (~|(8'h9d))) * ((~^(8'ha8)) == (8'haf)))) : (((!(~^(8'ha0))) ~^ {(^~(8'hb6)), (~|(8'ha9))}) ? ((8'ha5) * (((8'ha6) >>> (8'hbe)) ? (|(8'hb9)) : ((8'ha9) ? (7'h44) : (8'h9d)))) : ((((8'hbc) - (8'hbf)) ^~ {(8'had), (8'h9c)}) ? (((8'hb1) | (8'hb1)) ~^ (8'hbb)) : (((8'hbf) ~^ (8'hb3)) - (^(8'hb7)))))))
(y, clk, wire45, wire46, wire47, wire48, wire49);
  output wire [(32'h18f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire45;
  input wire [(4'h9):(1'h0)] wire46;
  input wire signed [(4'he):(1'h0)] wire47;
  input wire [(4'hf):(1'h0)] wire48;
  input wire signed [(4'h9):(1'h0)] wire49;
  wire signed [(5'h15):(1'h0)] wire146;
  wire [(3'h4):(1'h0)] wire145;
  wire signed [(3'h6):(1'h0)] wire144;
  wire signed [(5'h15):(1'h0)] wire50;
  wire signed [(5'h13):(1'h0)] wire51;
  wire [(4'h8):(1'h0)] wire52;
  wire [(4'h8):(1'h0)] wire64;
  wire [(2'h2):(1'h0)] wire142;
  reg [(5'h12):(1'h0)] reg158 = (1'h0);
  reg [(2'h3):(1'h0)] reg157 = (1'h0);
  reg [(4'h9):(1'h0)] reg156 = (1'h0);
  reg [(3'h7):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg153 = (1'h0);
  reg [(4'hc):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg151 = (1'h0);
  reg [(5'h12):(1'h0)] reg150 = (1'h0);
  reg [(4'hb):(1'h0)] reg149 = (1'h0);
  reg [(5'h14):(1'h0)] reg148 = (1'h0);
  reg [(5'h14):(1'h0)] reg147 = (1'h0);
  reg [(4'hb):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(4'he):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg60 = (1'h0);
  reg [(3'h4):(1'h0)] reg61 = (1'h0);
  reg [(4'hc):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg63 = (1'h0);
  assign y = {wire146,
                 wire145,
                 wire144,
                 wire50,
                 wire51,
                 wire52,
                 wire64,
                 wire142,
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
                 (1'h0)};
  assign wire50 = $unsigned(wire49);
  assign wire51 = wire48;
  assign wire52 = wire46;
  always
    @(posedge clk) begin
      reg53 <= (wire51[(5'h13):(2'h2)] * (8'hae));
    end
  always
    @(posedge clk) begin
      if ($signed(wire50))
        begin
          reg54 <= ((wire45 ? wire48 : wire47[(1'h1):(1'h0)]) ?
              $unsigned($unsigned($signed($unsigned(wire48)))) : (-$signed((~^wire50[(5'h11):(3'h4)]))));
        end
      else
        begin
          reg54 <= wire49[(2'h3):(1'h0)];
          reg55 <= (~((!((~reg53) >= {wire52, wire45})) ^~ reg53));
          reg56 <= {((|(~$unsigned(wire46))) ?
                  {{$signed(wire48)}} : (wire45[(4'h8):(1'h1)] ?
                      $unsigned(reg54) : {wire46})),
              (((|$signed(wire51)) ^ ($unsigned(wire48) + wire49)) >> wire48[(2'h3):(1'h0)])};
          if (wire48[(4'he):(4'he)])
            begin
              reg57 <= (8'h9f);
            end
          else
            begin
              reg57 <= reg57[(2'h2):(2'h2)];
              reg58 <= (((reg56 ?
                      ($unsigned(wire48) - $unsigned((8'hb0))) : reg56) ?
                  wire47 : (+wire49[(3'h6):(3'h5)])) < $unsigned((8'hb5)));
              reg59 <= (wire46 & reg54);
              reg60 <= (8'hbb);
              reg61 <= ($unsigned(wire47) >>> (^(|$signed($unsigned(reg57)))));
            end
          reg62 <= (($unsigned($unsigned({reg53})) & (~&$unsigned($signed(wire45)))) ~^ $unsigned({wire46[(3'h6):(1'h1)]}));
        end
      reg63 <= (8'hb5);
    end
  assign wire64 = (&((&{(wire45 != wire48), (8'ha5)}) == wire47));
  module65 #() modinst143 (.clk(clk), .wire68(wire52), .wire66(reg60), .y(wire142), .wire69(wire47), .wire67(wire50));
  assign wire144 = reg53;
  assign wire145 = $signed((^(^wire46)));
  assign wire146 = ($unsigned((8'hb8)) ? reg54[(3'h6):(1'h0)] : reg58);
  always
    @(posedge clk) begin
      if (wire51)
        begin
          reg147 <= $signed(((|$signed((~wire49))) ?
              wire142[(1'h0):(1'h0)] : $unsigned($unsigned((reg62 << wire145)))));
          reg148 <= (^~((((wire144 ? reg147 : wire51) & (8'ha0)) ?
              (reg62[(1'h1):(1'h1)] >= $signed(reg147)) : reg147[(3'h5):(1'h1)]) != wire46));
          reg149 <= {reg57, reg62[(2'h2):(1'h0)]};
          reg150 <= reg147;
          reg151 <= (((|wire64[(2'h3):(2'h3)]) && ({wire47[(3'h4):(2'h2)]} * (+(~wire45)))) ?
              ({(^$unsigned(reg61)),
                  (wire64 != (reg149 ?
                      wire47 : (8'hbe)))} - $signed(reg61[(3'h4):(2'h2)])) : (^~$signed((|(^~(8'hbb))))));
        end
      else
        begin
          reg147 <= reg148;
          reg148 <= wire50;
        end
      if (($unsigned(reg53) << ({(~reg56), reg56[(4'he):(3'h6)]} > wire48)))
        begin
          reg152 <= $unsigned((wire46[(3'h6):(1'h0)] != reg63[(3'h5):(1'h0)]));
          if ((!$signed((~|$unsigned((reg148 ? reg150 : (8'hbd)))))))
            begin
              reg153 <= wire46[(2'h3):(2'h2)];
              reg154 <= reg63[(4'ha):(4'h8)];
              reg155 <= wire48[(4'he):(1'h1)];
              reg156 <= $signed((reg152[(1'h1):(1'h0)] >> $unsigned(({reg57,
                  reg62} ^~ (reg153 ? wire51 : wire50)))));
            end
          else
            begin
              reg153 <= reg58;
              reg154 <= $signed(wire142);
              reg155 <= {reg56, {$signed(reg154[(2'h2):(2'h2)])}};
              reg156 <= (^($signed((|(reg62 ?
                  wire48 : reg149))) <<< ($signed((~reg149)) ?
                  reg147 : ((reg62 ? reg59 : wire146) ?
                      (^(8'h9c)) : (~&wire144)))));
            end
        end
      else
        begin
          reg152 <= $signed($signed(reg148[(1'h1):(1'h0)]));
          reg153 <= (&wire45);
          reg154 <= (|($signed(((8'ha3) ?
              $unsigned(reg153) : $signed(wire50))) + {$unsigned($signed(wire47))}));
          reg155 <= ((8'hb5) && reg57);
          reg156 <= {$signed((~|{$signed(wire47), $signed(wire144)})),
              reg57[(2'h2):(1'h1)]};
        end
      reg157 <= wire48[(4'ha):(1'h0)];
      reg158 <= ($unsigned(({wire49,
          wire46[(1'h1):(1'h1)]} <<< reg53)) >>> wire50);
    end
endmodule

module module5
#(parameter param40 = (^~{(+(((8'ha5) ? (8'haf) : (8'hb7)) && ((8'had) ? (8'hb2) : (8'hb3)))), ((((8'ha6) ? (8'hab) : (8'h9d)) <= (8'hbd)) ? (^~((8'hb2) ^~ (8'haf))) : ((~(8'hba)) <= (~&(8'hb3))))}), 
parameter param41 = param40)
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h4f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire6;
  input wire signed [(4'hb):(1'h0)] wire7;
  input wire signed [(5'h10):(1'h0)] wire8;
  input wire [(4'hf):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire39;
  wire signed [(5'h10):(1'h0)] wire38;
  wire signed [(2'h3):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire12;
  wire signed [(4'ha):(1'h0)] wire13;
  wire signed [(5'h13):(1'h0)] wire36;
  assign y = {wire39, wire38, wire11, wire12, wire13, wire36, (1'h0)};
  assign wire11 = ((!$signed(wire8)) == ({wire10[(4'hc):(4'h9)], (!(-wire9))} ?
                      ($unsigned((wire10 >>> wire10)) ?
                          wire8 : {wire6[(3'h4):(3'h4)],
                              (wire8 ?
                                  wire9 : wire9)}) : wire10[(4'h9):(1'h1)]));
  assign wire12 = wire10;
  assign wire13 = (wire12 | wire11);
  module14 #() modinst37 (wire36, clk, wire10, wire9, wire13, wire12, wire8);
  assign wire38 = (wire8 | {($unsigned(((8'ha9) ?
                          wire11 : wire36)) & $unsigned(wire6[(2'h3):(2'h3)])),
                      wire8});
  assign wire39 = (^~$unsigned(({(8'hb2),
                      $unsigned(wire9)} != $signed({wire7}))));
endmodule

module module14
#(parameter param34 = (~&{((((8'hbc) ? (8'ha2) : (8'hab)) ? ((8'ha2) ~^ (8'ha8)) : ((8'hb8) >> (8'hb5))) << (-(+(8'had)))), (({(7'h42)} ? ((8'hb4) || (8'hb8)) : ((7'h42) >> (7'h40))) == (&((8'had) == (8'ha4))))}), 
parameter param35 = ((~&({(~^param34)} ? ((param34 - param34) ? (-param34) : {param34}) : {param34})) ? param34 : (~^(~{(param34 ~^ param34)}))))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire19;
  input wire [(4'hf):(1'h0)] wire18;
  input wire [(4'ha):(1'h0)] wire17;
  input wire [(3'h4):(1'h0)] wire16;
  input wire signed [(3'h6):(1'h0)] wire15;
  wire [(4'hb):(1'h0)] wire33;
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg22 = (1'h0);
  reg [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  assign y = {wire33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg20 <= (($signed((wire18[(3'h4):(2'h2)] ~^ $signed(wire16))) ?
          $unsigned((~(&wire19))) : (8'ha1)) >>> wire16);
      reg21 <= $signed({{wire17[(1'h1):(1'h1)],
              (((8'hb4) ? wire17 : (8'hb1)) ? (+wire17) : $unsigned(wire16))},
          ({wire16[(1'h1):(1'h0)]} + wire16[(1'h1):(1'h0)])});
      reg22 <= $signed(({((wire18 < wire17) ?
                  (wire18 ? wire17 : wire16) : (wire17 ? wire16 : wire18)),
              {reg21, reg20[(3'h6):(2'h2)]}} ?
          $signed(((~(8'hb1)) != (wire16 << wire15))) : ((-$signed(wire19)) ?
              (~&wire19[(3'h7):(2'h2)]) : {(reg20 >= wire19),
                  wire18[(4'hc):(4'h8)]})));
      reg23 <= $unsigned(reg21);
    end
  always
    @(posedge clk) begin
      reg24 <= (^~(~&(wire15 ?
          {wire17, (wire19 == wire18)} : $unsigned((+(8'hb2))))));
      reg25 <= ((reg24 || wire19[(3'h6):(3'h5)]) >> $signed($unsigned((7'h40))));
      reg26 <= (8'h9c);
      reg27 <= ($unsigned($signed($unsigned((+reg26)))) ?
          reg23 : (($unsigned(wire16[(1'h0):(1'h0)]) ?
              $signed((~^reg22)) : $signed($unsigned((8'hb4)))) >= reg23));
      reg28 <= (^({((!wire19) > reg21[(5'h10):(4'h8)])} & reg23[(3'h6):(1'h1)]));
    end
  always
    @(posedge clk) begin
      reg29 <= $signed(wire18);
      reg30 <= $unsigned((7'h41));
      reg31 <= reg30;
      reg32 <= $signed($unsigned({({wire18} ~^ (reg21 ? reg23 : wire16)),
          $unsigned({wire19})}));
    end
  assign wire33 = $unsigned($unsigned((-reg25)));
endmodule

module module65
#(parameter param141 = (!{(+((^~(8'haa)) ? ((8'hb5) ? (8'ha6) : (7'h44)) : {(8'hab), (7'h42)})), {((~(8'ha5)) ? ((8'ha6) ^~ (8'hb0)) : {(7'h41), (8'hba)}), (((8'hbf) ? (8'ha8) : (8'hb2)) >> ((8'hab) & (8'hbf)))}}))
(y, clk, wire69, wire68, wire67, wire66);
  output wire [(32'h2d1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire69;
  input wire signed [(2'h2):(1'h0)] wire68;
  input wire [(3'h5):(1'h0)] wire67;
  input wire [(4'hd):(1'h0)] wire66;
  wire [(4'h9):(1'h0)] wire140;
  wire signed [(3'h6):(1'h0)] wire139;
  wire signed [(2'h3):(1'h0)] wire138;
  wire [(5'h10):(1'h0)] wire128;
  wire signed [(4'h9):(1'h0)] wire127;
  wire signed [(2'h3):(1'h0)] wire126;
  wire signed [(5'h14):(1'h0)] wire125;
  wire signed [(4'h9):(1'h0)] wire124;
  wire [(5'h11):(1'h0)] wire123;
  wire signed [(4'hf):(1'h0)] wire122;
  wire [(5'h14):(1'h0)] wire103;
  wire [(3'h4):(1'h0)] wire86;
  wire signed [(4'h9):(1'h0)] wire85;
  wire signed [(4'ha):(1'h0)] wire72;
  wire [(2'h3):(1'h0)] wire71;
  wire signed [(4'hb):(1'h0)] wire70;
  reg [(3'h5):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg136 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg135 = (1'h0);
  reg signed [(4'he):(1'h0)] reg134 = (1'h0);
  reg [(5'h13):(1'h0)] reg133 = (1'h0);
  reg [(3'h6):(1'h0)] reg132 = (1'h0);
  reg [(2'h3):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg130 = (1'h0);
  reg [(5'h14):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg120 = (1'h0);
  reg [(5'h14):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg118 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg115 = (1'h0);
  reg [(4'hb):(1'h0)] reg114 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg112 = (1'h0);
  reg [(4'hb):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg110 = (1'h0);
  reg [(5'h14):(1'h0)] reg109 = (1'h0);
  reg [(3'h5):(1'h0)] reg108 = (1'h0);
  reg [(2'h3):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg105 = (1'h0);
  reg [(2'h3):(1'h0)] reg104 = (1'h0);
  reg [(5'h15):(1'h0)] reg102 = (1'h0);
  reg [(4'ha):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg100 = (1'h0);
  reg [(4'hc):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg98 = (1'h0);
  reg [(5'h12):(1'h0)] reg97 = (1'h0);
  reg [(2'h3):(1'h0)] reg96 = (1'h0);
  reg [(4'h8):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg93 = (1'h0);
  reg [(3'h4):(1'h0)] reg92 = (1'h0);
  reg [(2'h2):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg89 = (1'h0);
  reg [(3'h4):(1'h0)] reg88 = (1'h0);
  reg [(5'h11):(1'h0)] reg87 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg76 = (1'h0);
  reg signed [(4'he):(1'h0)] reg75 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg74 = (1'h0);
  reg [(5'h13):(1'h0)] reg73 = (1'h0);
  assign y = {wire140,
                 wire139,
                 wire138,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire103,
                 wire86,
                 wire85,
                 wire72,
                 wire71,
                 wire70,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
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
                 reg87,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 (1'h0)};
  assign wire70 = (~^wire68);
  assign wire71 = (-(wire70[(2'h2):(1'h0)] & {$unsigned(wire68[(1'h0):(1'h0)])}));
  assign wire72 = (~(wire67 >= $unsigned((^~(wire70 ? (8'ha5) : wire71)))));
  always
    @(posedge clk) begin
      if (wire67)
        begin
          if ((^~(~^($signed((&(8'hb9))) || (+(wire70 ? wire72 : wire70))))))
            begin
              reg73 <= wire69;
              reg74 <= $unsigned((wire67[(3'h4):(1'h1)] < (8'ha7)));
              reg75 <= (reg73 * $unsigned(($signed(reg73) <= $unsigned(wire71))));
              reg76 <= ($unsigned(wire71[(1'h0):(1'h0)]) ?
                  (!wire68[(1'h0):(1'h0)]) : ((&$signed((wire72 ?
                          reg73 : reg75))) ?
                      $unsigned(wire71) : (~wire70)));
              reg77 <= ((~|$unsigned(reg75)) | ({$signed($signed(wire71))} ?
                  (~{wire69[(4'h8):(3'h7)]}) : $unsigned($signed($signed(wire69)))));
            end
          else
            begin
              reg73 <= $signed(wire70[(4'hb):(3'h4)]);
              reg74 <= (8'ha5);
            end
        end
      else
        begin
          reg73 <= wire72[(4'h9):(3'h7)];
          reg74 <= $unsigned((wire68 || $unsigned($unsigned(reg76[(4'ha):(4'h8)]))));
        end
      if ((|wire69))
        begin
          reg78 <= wire69;
          reg79 <= wire68;
          reg80 <= $signed((~|(8'hba)));
          reg81 <= reg76;
        end
      else
        begin
          reg78 <= ((reg74[(2'h3):(2'h3)] ^~ wire71[(2'h2):(1'h0)]) > ({(|((8'hb0) ?
                  wire72 : reg81))} | (reg81 ?
              $unsigned({wire72, (8'hbd)}) : $signed(reg77[(3'h4):(2'h3)]))));
          reg79 <= $unsigned(reg78);
          reg80 <= ($signed({reg81}) ?
              reg76[(4'ha):(4'ha)] : reg76[(3'h5):(1'h1)]);
          reg81 <= reg79;
          reg82 <= wire67[(3'h5):(3'h5)];
        end
      reg83 <= reg76;
      reg84 <= ((~^reg75) ~^ {{wire67, reg78[(3'h6):(3'h6)]},
          $signed($signed((!wire70)))});
    end
  assign wire85 = {(~reg74[(1'h1):(1'h1)])};
  assign wire86 = reg76;
  always
    @(posedge clk) begin
      reg87 <= ((^$signed($signed(reg81))) ? (8'hb9) : (^(-reg78)));
      if (wire66[(2'h3):(1'h0)])
        begin
          reg88 <= wire71[(1'h1):(1'h0)];
          reg89 <= (+(reg75 || wire85[(4'h9):(3'h7)]));
          if ({reg78[(2'h3):(2'h3)],
              (~|(reg87 ?
                  (reg74[(2'h2):(1'h1)] ?
                      {reg84, reg79} : {wire86,
                          (8'hab)}) : $unsigned({reg80})))})
            begin
              reg90 <= ($unsigned({{(reg80 ? reg76 : wire70),
                          ((8'hba) | reg84)}}) ?
                  reg81 : $unsigned((|reg89[(1'h1):(1'h0)])));
              reg91 <= reg80;
            end
          else
            begin
              reg90 <= $signed((reg78[(1'h0):(1'h0)] ?
                  {(~&{reg84})} : {({reg73} ?
                          (8'ha9) : (reg78 ? (8'hba) : wire86)),
                      $unsigned((^~(8'ha4)))}));
            end
        end
      else
        begin
          reg88 <= (reg79[(3'h7):(2'h3)] ?
              ((((~&reg90) ? $unsigned(reg80) : (reg78 ^ reg73)) << reg76) ?
                  wire85 : (~^(-(reg90 - reg75)))) : wire85[(3'h6):(3'h6)]);
          reg89 <= {({{reg89[(1'h0):(1'h0)], reg77}, {$unsigned((8'hb1))}} ?
                  $signed(($signed(reg76) ?
                      {reg83,
                          (8'h9d)} : (^reg91))) : $signed(wire70[(2'h3):(1'h1)]))};
        end
      if ({$signed((~^reg84[(2'h2):(2'h2)]))})
        begin
          reg92 <= reg78[(3'h5):(2'h2)];
          if ((reg84 && reg76))
            begin
              reg93 <= reg92;
              reg94 <= $unsigned(($unsigned($signed((8'ha2))) != {wire67,
                  $unsigned((reg87 ? (8'hb7) : (8'ha3)))}));
            end
          else
            begin
              reg93 <= (8'hba);
              reg94 <= {{$signed($unsigned((wire69 ? reg94 : reg82))),
                      (-{(reg80 ? reg81 : reg90)})}};
              reg95 <= $unsigned((8'haa));
            end
          if (($signed(reg75) ?
              $unsigned(((8'hac) << wire72)) : $signed((|(^$signed((8'hbc)))))))
            begin
              reg96 <= $signed((((^reg77[(1'h1):(1'h0)]) ?
                      (+(wire67 < wire66)) : reg93) ?
                  (!{(~|reg75)}) : $unsigned(((8'hb3) <= reg89))));
              reg97 <= $unsigned(wire70[(2'h3):(2'h3)]);
              reg98 <= reg83[(1'h0):(1'h0)];
              reg99 <= (|$signed($signed((8'hb8))));
            end
          else
            begin
              reg96 <= (&(^($unsigned(wire86) & {(~&reg77)})));
              reg97 <= $unsigned(reg97[(4'hd):(3'h5)]);
              reg98 <= (-reg91);
            end
          reg100 <= ((|wire70[(3'h5):(1'h1)]) ?
              (!$signed((8'ha2))) : (((reg97[(3'h4):(2'h2)] & reg98[(1'h1):(1'h0)]) == (8'hbf)) ?
                  wire68[(1'h1):(1'h0)] : ($unsigned((-reg84)) ?
                      reg94 : ((~|reg97) || ((8'h9e) + (8'ha6))))));
        end
      else
        begin
          reg92 <= (~&$signed(((reg84 ~^ (-reg77)) ~^ ($unsigned(wire68) >> $signed(reg91)))));
          if ({reg75[(4'hc):(3'h7)]})
            begin
              reg93 <= (($signed(((reg78 + reg82) >= wire69)) != {{((7'h40) - reg76),
                          reg81},
                      $signed($signed(reg88))}) ?
                  $signed($unsigned(reg92[(1'h1):(1'h0)])) : reg99[(1'h0):(1'h0)]);
              reg94 <= reg97;
              reg95 <= $unsigned(reg77[(2'h3):(2'h2)]);
            end
          else
            begin
              reg93 <= (8'ha3);
              reg94 <= wire86[(1'h1):(1'h0)];
              reg95 <= $signed($unsigned((reg99 ?
                  wire71[(1'h1):(1'h0)] : $signed(reg75[(4'hc):(4'hc)]))));
            end
          reg96 <= ((|wire72[(3'h6):(2'h3)]) ?
              $signed(({$unsigned((7'h40)), (reg74 > reg73)} ?
                  $signed((&reg78)) : wire67[(3'h5):(2'h3)])) : (reg78[(2'h3):(1'h0)] - (reg82 >= reg74)));
        end
      reg101 <= {(reg80 ?
              $unsigned({(+wire72), {wire86, wire69}}) : (reg81 ?
                  ($signed(wire85) ?
                      reg84 : (reg74 ? reg82 : (8'hae))) : (((7'h41) ?
                      (7'h43) : reg83) | (8'hab))))};
      reg102 <= (($unsigned({(reg89 ? reg81 : reg99)}) ?
              (+(|(!reg73))) : (~^(wire66 ^ $signed(reg88)))) ?
          {$signed((wire69[(4'he):(4'h9)] ?
                  reg94[(1'h1):(1'h0)] : reg77))} : $signed($signed(reg98)));
    end
  assign wire103 = reg87;
  always
    @(posedge clk) begin
      if (($unsigned((reg80[(2'h3):(1'h1)] - $unsigned((reg80 <<< wire70)))) ?
          {(((~^reg83) << (+reg73)) ?
                  reg82[(3'h4):(3'h4)] : $unsigned(reg84[(1'h1):(1'h0)]))} : $signed($signed(((&reg74) ?
              (8'hab) : reg80[(1'h0):(1'h0)])))))
        begin
          if ($unsigned((reg73 ?
              $signed(reg102) : (wire68[(2'h2):(2'h2)] ?
                  wire85[(2'h2):(1'h0)] : (reg74[(2'h3):(1'h1)] != (-reg73))))))
            begin
              reg104 <= $signed((~|reg97[(1'h0):(1'h0)]));
              reg105 <= {$unsigned($unsigned(($unsigned((8'hb4)) * $unsigned(reg101)))),
                  ((reg102[(5'h15):(4'he)] ?
                          ((~&wire103) ?
                              (reg78 ?
                                  reg80 : wire71) : reg84[(1'h0):(1'h0)]) : reg95[(3'h7):(1'h0)]) ?
                      ($signed((reg82 + reg101)) < (8'ha8)) : ($unsigned((~|reg97)) >>> reg75[(1'h1):(1'h0)]))};
              reg106 <= (!{(^$unsigned($signed(wire67))),
                  $unsigned($signed((wire70 + reg96)))});
              reg107 <= $unsigned((~|(reg76 ?
                  ((8'haf) ?
                      reg79[(4'hd):(4'h8)] : $unsigned(reg91)) : ($unsigned(reg81) > (reg105 ?
                      reg97 : wire67)))));
            end
          else
            begin
              reg104 <= {{reg105[(1'h0):(1'h0)], {$unsigned($signed(reg101))}}};
              reg105 <= {$unsigned((reg77[(3'h4):(3'h4)] ?
                      $unsigned(reg81[(1'h1):(1'h1)]) : {$signed((8'hb7))})),
                  (+$unsigned($signed((reg91 ? wire103 : reg102))))};
              reg106 <= (8'hb4);
              reg107 <= $signed((reg102 <<< $signed($unsigned($signed(wire72)))));
            end
        end
      else
        begin
          if (wire85[(3'h5):(3'h4)])
            begin
              reg104 <= {{(8'ha6)}};
              reg105 <= ($signed((reg78[(2'h2):(1'h0)] >>> wire70)) ?
                  reg99 : $signed({(8'hbb)}));
            end
          else
            begin
              reg104 <= (wire67 ?
                  ($signed(($unsigned(reg87) ?
                      $unsigned(reg92) : $unsigned(reg96))) * wire71) : {(8'haf)});
              reg105 <= (reg87[(4'hb):(4'h8)] | $unsigned((({reg76, reg75} ?
                  $signed(reg98) : {reg100, reg76}) + reg83[(2'h3):(1'h1)])));
              reg106 <= ((({((8'ha6) ? (7'h42) : (8'hbb))} || reg104) ?
                  $unsigned((-$unsigned(reg99))) : (|(8'ha4))) * reg97[(4'hf):(4'hc)]);
              reg107 <= $unsigned($signed(reg88[(1'h0):(1'h0)]));
            end
        end
      reg108 <= $unsigned((&$unsigned($signed($signed(wire86)))));
      if ($unsigned({(^~reg79[(3'h6):(3'h5)])}))
        begin
          if ((reg101 ?
              (~|reg93[(1'h0):(1'h0)]) : (($signed(reg81) == $unsigned((reg97 << reg99))) ?
                  (reg76[(3'h5):(1'h1)] ?
                      reg83[(2'h3):(1'h1)] : (~reg92)) : ((reg100[(4'h9):(1'h1)] ^ {wire68}) < reg106[(4'hd):(1'h0)]))))
            begin
              reg109 <= (8'hbf);
              reg110 <= $signed(($unsigned(reg94[(1'h0):(1'h0)]) ?
                  reg74[(2'h3):(2'h3)] : ((-$unsigned(wire71)) ?
                      ((!reg100) <<< $signed(reg94)) : reg108[(3'h4):(3'h4)])));
              reg111 <= (((~^wire68) ? (|(~&(~|(8'haa)))) : wire69) ?
                  (8'had) : ({(reg87[(4'hf):(1'h0)] ?
                              reg106[(3'h6):(1'h0)] : reg89[(1'h1):(1'h1)]),
                          (~|{(8'hb6)})} ?
                      (((&reg94) >>> reg80[(4'hc):(2'h3)]) <<< $signed({(8'haa)})) : $unsigned((+(-reg77)))));
              reg112 <= wire66;
              reg113 <= $unsigned((^~reg93[(1'h0):(1'h0)]));
            end
          else
            begin
              reg109 <= $unsigned(reg87[(4'h8):(1'h1)]);
            end
          if ($signed($unsigned(reg96[(1'h0):(1'h0)])))
            begin
              reg114 <= $signed((8'hba));
              reg115 <= reg91;
              reg116 <= reg107[(1'h1):(1'h1)];
              reg117 <= (reg97[(4'ha):(4'ha)] ?
                  (+$signed($unsigned((reg108 ? reg112 : reg105)))) : reg75);
              reg118 <= $unsigned($unsigned($unsigned(($signed(reg113) ?
                  {reg106, reg84} : (reg113 <= (8'hb5))))));
            end
          else
            begin
              reg114 <= (~&$signed({((wire72 != reg112) ?
                      (^~reg81) : $signed(wire67)),
                  $unsigned($signed(wire70))}));
              reg115 <= reg109[(5'h11):(3'h6)];
            end
          reg119 <= wire69[(3'h4):(2'h3)];
        end
      else
        begin
          reg109 <= reg96[(1'h1):(1'h1)];
        end
      reg120 <= ($signed(((|(~&reg81)) * $unsigned((reg99 ? wire69 : reg97)))) ?
          (^~(($unsigned(reg98) ? reg83[(1'h1):(1'h1)] : reg88[(2'h2):(2'h2)]) ?
              reg108[(3'h4):(2'h2)] : $signed((8'hb9)))) : $unsigned((|(reg95 ?
              $unsigned(reg114) : (wire85 ? reg95 : (8'hae))))));
      reg121 <= reg91;
    end
  assign wire122 = $unsigned($unsigned(reg80));
  assign wire123 = $unsigned(($signed((reg112[(3'h5):(2'h2)] ?
                           $unsigned((7'h40)) : (reg112 & reg115))) ?
                       ($signed((8'hb2)) | (reg84 || (~reg75))) : (reg120 ?
                           (8'haf) : (wire69 ? $unsigned(reg81) : wire69))));
  assign wire124 = (reg111 ?
                       {$signed(((~^(7'h43)) <= reg105))} : $unsigned(reg74));
  assign wire125 = reg115[(3'h4):(2'h2)];
  assign wire126 = reg117;
  assign wire127 = $unsigned(reg87[(4'h9):(1'h1)]);
  assign wire128 = ((~|((|$signed(reg76)) ^~ reg89[(2'h3):(1'h1)])) ?
                       (reg110 ?
                           reg107[(2'h3):(2'h2)] : ((-reg79[(4'hc):(2'h3)]) ~^ $signed(((8'h9d) ?
                               reg98 : reg115)))) : $signed((^($signed(reg74) - $unsigned(reg94)))));
  always
    @(posedge clk) begin
      if ((($unsigned(((reg89 ? reg93 : reg101) ?
                  $signed(wire124) : (wire124 ? wire69 : wire123))) ?
              (8'hac) : reg89[(2'h2):(1'h0)]) ?
          reg105 : (($unsigned(reg77) < $unsigned(reg92)) ?
              $unsigned(((reg91 > reg76) & (~wire68))) : $unsigned($unsigned($unsigned(wire86))))))
        begin
          reg129 <= (+$unsigned((($unsigned((8'hb8)) ?
              $signed(reg98) : (~&reg107)) > (|reg90))));
        end
      else
        begin
          reg129 <= reg113;
          reg130 <= $unsigned((~|reg99));
          reg131 <= {(8'hbc), (8'h9f)};
          reg132 <= (~$unsigned($signed(reg96[(2'h3):(1'h0)])));
          if (reg77[(1'h1):(1'h0)])
            begin
              reg133 <= $unsigned((+(reg110 >= ($signed(wire67) << {reg106}))));
            end
          else
            begin
              reg133 <= (+(($unsigned(reg91) & (~reg92)) ?
                  ({reg91, $signed(reg87)} ?
                      wire85 : (8'haa)) : reg121[(5'h10):(2'h2)]));
              reg134 <= $signed(reg75);
              reg135 <= (((((&wire125) ?
                          (reg111 ? reg109 : (7'h40)) : $signed(wire125)) ?
                      $unsigned($unsigned(reg82)) : (|(&reg73))) ?
                  (reg130 ?
                      $signed((reg116 ?
                          reg130 : reg117)) : (^$signed((7'h43)))) : (-$unsigned(reg99))) <<< $signed((~|$signed((-wire128)))));
              reg136 <= reg121;
              reg137 <= reg95;
            end
        end
    end
  assign wire138 = {((-((reg78 == reg129) >> reg132[(1'h0):(1'h0)])) >= (reg92[(2'h2):(2'h2)] > {$unsigned(wire66)})),
                       reg109[(3'h6):(1'h1)]};
  assign wire139 = $unsigned($signed(((wire103 ^~ (~^reg93)) << reg91)));
  assign wire140 = (($signed($signed((!wire67))) ?
                           $signed(($signed((7'h43)) & (wire138 * reg88))) : $unsigned(reg133[(2'h3):(2'h2)])) ?
                       (+$unsigned(((reg93 <= wire125) ?
                           wire128 : (reg74 >= reg108)))) : ((wire139[(3'h4):(1'h0)] ?
                               (~|{wire66,
                                   (8'ha6)}) : (^wire72[(2'h2):(2'h2)])) ?
                           ($unsigned({(8'hba)}) ?
                               ((-reg107) ?
                                   reg111[(2'h3):(1'h0)] : {(8'h9f)}) : wire67) : {((reg100 ?
                                   wire122 : wire69) >= $signed(reg134))}));
endmodule

module module327
#(parameter param337 = (((+(~&((8'hbe) ? (8'haf) : (8'hba)))) ? {(((8'ha6) ? (8'hb4) : (8'hb2)) ? ((8'h9f) >>> (8'ha0)) : ((8'haa) >> (8'h9d))), ((7'h41) ? ((8'hb7) ? (8'h9e) : (7'h41)) : ((7'h42) & (8'h9e)))} : (|((-(8'hab)) ? ((8'haf) * (8'ha9)) : (8'hab)))) ^ (~^((!((8'hb4) == (8'hb9))) != (^((7'h40) ? (8'h9c) : (8'hbd)))))))
(y, clk, wire331, wire330, wire329, wire328);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire331;
  input wire signed [(5'h14):(1'h0)] wire330;
  input wire [(4'h8):(1'h0)] wire329;
  input wire signed [(3'h4):(1'h0)] wire328;
  wire [(5'h11):(1'h0)] wire336;
  wire signed [(5'h10):(1'h0)] wire335;
  wire signed [(5'h11):(1'h0)] wire334;
  wire [(3'h7):(1'h0)] wire333;
  wire signed [(4'he):(1'h0)] wire332;
  assign y = {wire336, wire335, wire334, wire333, wire332, (1'h0)};
  assign wire332 = (wire330[(4'h8):(3'h4)] ?
                       wire329[(1'h0):(1'h0)] : ((~&((&wire331) == (wire331 ?
                           wire331 : wire330))) == (wire331[(2'h2):(1'h0)] != (~^$signed(wire329)))));
  assign wire333 = ((~|((8'hb1) ? wire330 : wire329)) <= ((~^$signed((wire331 ?
                           wire329 : wire328))) ?
                       wire331 : ({$signed(wire332),
                           wire331[(3'h5):(2'h2)]} << ({wire332} ?
                           (wire329 ? wire330 : (8'hb6)) : {(8'hb1)}))));
  assign wire334 = ({wire330[(5'h13):(4'h8)], wire331} ?
                       (8'ha0) : wire331[(3'h4):(3'h4)]);
  assign wire335 = $signed(wire333[(2'h3):(1'h0)]);
  assign wire336 = $unsigned((~^{((|wire333) ?
                           $unsigned((8'ha8)) : $unsigned(wire332)),
                       $signed($unsigned(wire332))}));
endmodule

module module280  (y, clk, wire285, wire284, wire283, wire282, wire281);
  output wire [(32'h148):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire285;
  input wire [(3'h7):(1'h0)] wire284;
  input wire [(3'h6):(1'h0)] wire283;
  input wire signed [(4'he):(1'h0)] wire282;
  input wire [(4'he):(1'h0)] wire281;
  wire signed [(2'h3):(1'h0)] wire319;
  wire signed [(3'h6):(1'h0)] wire318;
  wire [(2'h2):(1'h0)] wire317;
  wire signed [(5'h10):(1'h0)] wire314;
  wire signed [(4'hc):(1'h0)] wire313;
  wire [(3'h7):(1'h0)] wire311;
  wire [(4'hb):(1'h0)] wire305;
  wire [(3'h7):(1'h0)] wire288;
  wire [(5'h12):(1'h0)] wire287;
  wire signed [(2'h3):(1'h0)] wire286;
  reg signed [(4'hb):(1'h0)] reg316 = (1'h0);
  reg [(4'ha):(1'h0)] reg315 = (1'h0);
  reg [(4'hc):(1'h0)] reg312 = (1'h0);
  reg [(3'h5):(1'h0)] reg310 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg309 = (1'h0);
  reg [(3'h7):(1'h0)] reg308 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg307 = (1'h0);
  reg [(4'ha):(1'h0)] reg306 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg304 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg303 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg302 = (1'h0);
  reg [(4'h8):(1'h0)] reg301 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg300 = (1'h0);
  reg [(3'h7):(1'h0)] reg299 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg298 = (1'h0);
  reg [(3'h4):(1'h0)] reg297 = (1'h0);
  reg [(4'h9):(1'h0)] reg296 = (1'h0);
  reg [(5'h15):(1'h0)] reg295 = (1'h0);
  reg [(4'hc):(1'h0)] reg294 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg293 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg292 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg291 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg290 = (1'h0);
  reg [(4'ha):(1'h0)] reg289 = (1'h0);
  assign y = {wire319,
                 wire318,
                 wire317,
                 wire314,
                 wire313,
                 wire311,
                 wire305,
                 wire288,
                 wire287,
                 wire286,
                 reg316,
                 reg315,
                 reg312,
                 reg310,
                 reg309,
                 reg308,
                 reg307,
                 reg306,
                 reg304,
                 reg303,
                 reg302,
                 reg301,
                 reg300,
                 reg299,
                 reg298,
                 reg297,
                 reg296,
                 reg295,
                 reg294,
                 reg293,
                 reg292,
                 reg291,
                 reg290,
                 reg289,
                 (1'h0)};
  assign wire286 = wire285[(3'h6):(3'h6)];
  assign wire287 = $unsigned($unsigned({wire286[(1'h1):(1'h1)]}));
  assign wire288 = wire284;
  always
    @(posedge clk) begin
      reg289 <= (~(-$unsigned(wire283)));
      reg290 <= wire287;
      reg291 <= $unsigned((((8'ha6) <= $unsigned({wire283})) ?
          wire281[(3'h6):(3'h6)] : wire286));
      if ({$unsigned(($unsigned((~reg290)) == $unsigned(reg291[(5'h12):(4'hb)])))})
        begin
          if ({(-(($signed(wire284) ?
                  wire282 : $unsigned(wire286)) << {(wire282 != (8'hac))})),
              ($signed((wire285 ? (~|reg291) : (~^wire285))) ?
                  $signed((wire284[(1'h0):(1'h0)] ?
                      wire288[(3'h5):(1'h1)] : wire284[(3'h7):(1'h1)])) : $unsigned((((8'hae) ^ wire283) ?
                      $unsigned(wire283) : (~&reg291))))})
            begin
              reg292 <= (&(8'hba));
              reg293 <= (wire287 ?
                  {($unsigned(wire283) == (^~reg290))} : $unsigned(wire287[(1'h1):(1'h0)]));
              reg294 <= (($signed($signed(wire282[(1'h0):(1'h0)])) ?
                      {{(reg290 ? (8'hab) : wire284),
                              (reg293 <= wire285)}} : (~^((^~(8'hbf)) || wire286))) ?
                  {($unsigned(reg290) != wire287[(5'h10):(4'ha)]),
                      $signed((!(reg291 ~^ wire285)))} : reg290);
            end
          else
            begin
              reg292 <= $signed(({{(wire284 ?
                          (8'hbf) : wire284)}} < $signed(reg294)));
              reg293 <= $unsigned($signed(($unsigned(wire284[(2'h3):(1'h1)]) ?
                  wire282[(4'h9):(4'h9)] : reg291[(1'h0):(1'h0)])));
              reg294 <= {(~|$signed((8'hb7)))};
              reg295 <= (8'ha6);
              reg296 <= $unsigned(reg289[(4'ha):(1'h1)]);
            end
          reg297 <= reg289;
          if (reg295[(4'hf):(2'h2)])
            begin
              reg298 <= reg293;
            end
          else
            begin
              reg298 <= (($unsigned((^$signed(wire288))) ^~ (~^({reg289} | reg297))) >= $unsigned((reg292[(5'h12):(4'hc)] ?
                  ({reg296} ?
                      $unsigned(reg293) : (wire282 ?
                          (8'ha7) : reg296)) : $unsigned((~|reg297)))));
              reg299 <= $signed(wire285);
              reg300 <= $unsigned($unsigned((^(reg289[(3'h4):(1'h1)] >> (8'ha4)))));
              reg301 <= $unsigned(($signed(wire286[(2'h3):(1'h0)]) == reg290[(1'h1):(1'h1)]));
              reg302 <= ({($signed(wire284) <= $signed((^wire285)))} * reg294[(2'h2):(1'h1)]);
            end
          reg303 <= (^{reg295[(5'h15):(5'h13)]});
        end
      else
        begin
          reg292 <= {{wire284, $unsigned((&(^~reg292)))}};
          reg293 <= ((reg293 >= reg297[(2'h2):(1'h1)]) ?
              (&reg302[(3'h5):(3'h5)]) : (|((reg291[(2'h2):(2'h2)] ?
                      (reg301 && (8'hbc)) : (^wire288)) ?
                  $unsigned($unsigned(reg299)) : ($unsigned(wire286) ?
                      wire287[(3'h6):(3'h4)] : (reg298 ? wire287 : reg292)))));
          reg294 <= (reg299[(2'h3):(2'h3)] ?
              $unsigned((($signed((8'hb6)) ?
                      ((8'hbb) ? reg301 : reg303) : reg295[(5'h12):(4'hd)]) ?
                  $signed($unsigned((8'had))) : (reg299 | $signed(wire285)))) : {$unsigned(((reg297 + wire282) ?
                      (|reg296) : (reg299 ? reg302 : (8'hae)))),
                  ({$unsigned(reg300)} ?
                      {$unsigned(reg303),
                          reg292[(5'h12):(4'hf)]} : $unsigned((reg295 ?
                          wire286 : wire282)))});
          reg295 <= reg289[(4'h9):(1'h1)];
          reg296 <= (+reg292);
        end
      reg304 <= (~&{({(wire284 ? reg303 : reg298),
              $signed(reg296)} >> ($signed(wire288) <<< $unsigned(wire287)))});
    end
  assign wire305 = reg294[(3'h6):(3'h6)];
  always
    @(posedge clk) begin
      reg306 <= $signed(($unsigned((reg291 ? {reg303} : (~|reg295))) ?
          reg292[(5'h11):(4'he)] : ({reg295[(4'hc):(4'hb)],
                  wire287[(1'h0):(1'h0)]} ?
              ($unsigned(wire285) && (reg299 ?
                  (8'hbd) : reg304)) : $signed(wire288))));
      reg307 <= reg292;
      reg308 <= (&reg307);
      reg309 <= wire281;
      reg310 <= (|(~&reg308[(2'h3):(1'h0)]));
    end
  assign wire311 = $signed(reg310);
  always
    @(posedge clk) begin
      reg312 <= $signed($unsigned($signed($unsigned(((8'hbc) << reg290)))));
    end
  assign wire313 = (((reg297[(1'h0):(1'h0)] ?
                           $signed($unsigned(wire286)) : ((reg297 >= reg306) ?
                               (8'h9c) : $unsigned(reg295))) < wire281[(4'hd):(4'hd)]) ?
                       (wire281 ?
                           $signed((reg290[(3'h5):(2'h3)] ?
                               reg294[(1'h1):(1'h0)] : (&(8'hae)))) : ($signed($signed((8'ha7))) ^ $signed($unsigned((8'h9d))))) : $unsigned(($unsigned((!wire311)) ?
                           $signed(((8'hbc) <= (8'haa))) : $unsigned({wire286}))));
  assign wire314 = {$unsigned((^((reg298 ? reg295 : wire305) ?
                           $unsigned(wire283) : (8'ha4)))),
                       (-reg295)};
  always
    @(posedge clk) begin
      reg315 <= (!$signed(($signed((wire283 ^ reg298)) >>> ($unsigned(reg296) ?
          reg303[(4'hc):(3'h7)] : ((8'hab) ? wire311 : wire313)))));
      reg316 <= reg300[(2'h2):(2'h2)];
    end
  assign wire317 = reg298[(2'h2):(1'h1)];
  assign wire318 = (^(^({reg316, reg299[(2'h3):(2'h2)]} >>> reg303)));
  assign wire319 = (&(($unsigned((reg290 + wire311)) ?
                           (^~((8'ha2) > reg296)) : $signed($signed(reg316))) ?
                       $signed((8'h9f)) : $unsigned((+(wire285 ?
                           reg299 : wire285)))));
endmodule

module module234
#(parameter param268 = ((!(((~^(8'hb0)) && (~|(8'had))) ? (((8'hb4) >> (8'haf)) ? (!(8'ha9)) : ((8'hbd) ? (7'h42) : (8'hb5))) : (~^((8'hb9) >> (8'ha6))))) ? (8'haa) : (^~(^({(7'h40), (8'h9c)} < ((7'h43) - (8'hbf)))))))
(y, clk, wire239, wire238, wire237, wire236, wire235);
  output wire [(32'h12d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire239;
  input wire signed [(5'h12):(1'h0)] wire238;
  input wire signed [(4'hf):(1'h0)] wire237;
  input wire signed [(4'h8):(1'h0)] wire236;
  input wire signed [(5'h14):(1'h0)] wire235;
  wire [(5'h12):(1'h0)] wire267;
  wire [(4'hb):(1'h0)] wire266;
  wire [(5'h12):(1'h0)] wire265;
  wire signed [(2'h2):(1'h0)] wire253;
  wire [(2'h2):(1'h0)] wire252;
  wire signed [(4'ha):(1'h0)] wire251;
  wire [(4'h9):(1'h0)] wire250;
  reg signed [(5'h14):(1'h0)] reg264 = (1'h0);
  reg [(3'h6):(1'h0)] reg263 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg262 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg261 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg260 = (1'h0);
  reg [(4'hb):(1'h0)] reg259 = (1'h0);
  reg [(4'hf):(1'h0)] reg258 = (1'h0);
  reg [(5'h13):(1'h0)] reg257 = (1'h0);
  reg [(4'hd):(1'h0)] reg256 = (1'h0);
  reg [(3'h6):(1'h0)] reg255 = (1'h0);
  reg [(2'h3):(1'h0)] reg254 = (1'h0);
  reg signed [(4'he):(1'h0)] reg249 = (1'h0);
  reg [(2'h2):(1'h0)] reg248 = (1'h0);
  reg [(5'h15):(1'h0)] reg247 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg246 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg245 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg244 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg243 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg242 = (1'h0);
  reg [(2'h2):(1'h0)] reg241 = (1'h0);
  reg [(4'h9):(1'h0)] reg240 = (1'h0);
  assign y = {wire267,
                 wire266,
                 wire265,
                 wire253,
                 wire252,
                 wire251,
                 wire250,
                 reg264,
                 reg263,
                 reg262,
                 reg261,
                 reg260,
                 reg259,
                 reg258,
                 reg257,
                 reg256,
                 reg255,
                 reg254,
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
  always
    @(posedge clk) begin
      reg240 <= wire236;
      reg241 <= $unsigned({{$unsigned({wire237}),
              (wire238[(4'ha):(3'h6)] ? $unsigned(wire239) : $signed(wire237))},
          (wire235[(2'h2):(1'h0)] < (7'h42))});
      reg242 <= (~|reg240);
      if (wire236[(1'h0):(1'h0)])
        begin
          reg243 <= wire236[(2'h3):(1'h1)];
          reg244 <= ($signed((({reg241} + (~&reg242)) ^ (((8'ha0) ?
                      wire239 : wire239) ?
                  (^reg243) : (wire236 ? reg240 : wire237)))) ?
              wire239[(3'h4):(2'h2)] : ({(~$unsigned((8'hab)))} & reg241[(1'h1):(1'h0)]));
          reg245 <= {$signed((($signed(reg240) << (reg243 << wire238)) >> ({reg244} <<< reg243)))};
          if ($signed((8'h9c)))
            begin
              reg246 <= wire237;
              reg247 <= {(reg243 > ($signed($signed(wire237)) || $signed(wire236)))};
              reg248 <= reg243[(4'he):(4'h9)];
              reg249 <= (reg244 ?
                  $signed((reg248[(1'h1):(1'h1)] ?
                      ($unsigned((8'hbe)) ?
                          $signed(reg242) : $signed(wire235)) : ((|wire236) ?
                          (!(8'hbe)) : (-wire235)))) : ((!(reg244[(3'h4):(2'h3)] || $unsigned((8'haf)))) & (reg242[(1'h0):(1'h0)] ?
                      (reg242[(1'h0):(1'h0)] && (|reg247)) : (+reg242))));
            end
          else
            begin
              reg246 <= (8'h9d);
              reg247 <= $unsigned(((~^$signed($unsigned((8'hba)))) >= $signed({$signed(reg246)})));
              reg248 <= $signed($unsigned($unsigned((~|(reg246 ?
                  reg244 : reg240)))));
            end
        end
      else
        begin
          reg243 <= $signed($signed({$signed(((7'h42) ? (8'hb2) : (8'h9d))),
              reg241[(1'h1):(1'h1)]}));
        end
    end
  assign wire250 = reg240;
  assign wire251 = wire237[(4'hf):(3'h7)];
  assign wire252 = (&(^~reg241));
  assign wire253 = ($unsigned(reg244[(3'h5):(3'h5)]) && {$unsigned(reg240[(1'h0):(1'h0)]),
                       wire250[(1'h0):(1'h0)]});
  always
    @(posedge clk) begin
      reg254 <= reg249;
      if ($unsigned(reg246))
        begin
          reg255 <= ((~((reg240 ? $unsigned(wire250) : reg240) ?
              $signed(wire236[(2'h3):(1'h0)]) : wire250)) << (!((wire235 ^ reg240[(3'h5):(1'h1)]) == reg249)));
          if (($signed($signed(wire238[(1'h0):(1'h0)])) >= ((~|({(8'hb9),
                  wire239} ?
              reg246[(4'h8):(3'h5)] : (wire238 ?
                  (8'haf) : wire238))) + {$unsigned((reg249 < (8'ha7)))})))
            begin
              reg256 <= $signed(((8'hba) ? (8'h9c) : (8'ha9)));
              reg257 <= reg248[(1'h0):(1'h0)];
              reg258 <= ($signed($signed(($unsigned(reg257) ?
                      $signed(reg246) : ((8'hb5) ? (8'ha8) : reg244)))) ?
                  $signed($signed((~$signed(reg249)))) : ((reg240[(4'h8):(2'h2)] ?
                      ($unsigned(reg249) ?
                          reg246 : $signed((8'hb4))) : ($unsigned((7'h40)) << $unsigned(reg245))) >>> wire252[(1'h1):(1'h0)]));
            end
          else
            begin
              reg256 <= ((((&reg243) ?
                  (wire250[(1'h1):(1'h1)] == $unsigned((8'haf))) : reg258[(4'h8):(3'h6)]) < {(~^{wire239,
                      reg255})}) ^ $signed($unsigned((reg244[(1'h1):(1'h1)] ?
                  {(8'hab)} : reg241))));
              reg257 <= ({{reg254},
                      $signed(($unsigned(wire236) ~^ (reg244 ?
                          wire235 : wire235)))} ?
                  $unsigned((&wire251[(2'h3):(1'h0)])) : {reg257,
                      $unsigned(reg257[(4'he):(4'h8)])});
            end
          reg259 <= ($signed($signed(wire252[(1'h1):(1'h0)])) ?
              (wire252 ?
                  {(~^wire250[(3'h5):(2'h3)]),
                      $signed((7'h41))} : reg256[(4'hd):(3'h5)]) : reg258);
          reg260 <= ($signed($unsigned($signed($signed(reg245)))) ?
              reg243 : $signed($signed(((~wire239) <<< reg241))));
          if ($unsigned(((((reg260 ? wire250 : wire239) ?
                  ((7'h42) >= wire237) : (wire250 ? wire238 : wire251)) ?
              $signed((reg246 >= (8'hbe))) : $signed($signed(wire237))) >> reg257)))
            begin
              reg261 <= $signed({$unsigned((~&(8'ha1))),
                  wire250[(4'h8):(1'h1)]});
              reg262 <= (8'hb0);
            end
          else
            begin
              reg261 <= reg258;
              reg262 <= $unsigned((+({((8'ha0) ?
                      wire251 : reg258)} + (!$signed(wire252)))));
              reg263 <= wire239;
              reg264 <= ((reg245[(1'h0):(1'h0)] ^~ $unsigned({reg243})) ?
                  reg247 : wire250);
            end
        end
      else
        begin
          reg255 <= ((~&((reg264[(5'h14):(4'he)] ?
                  (wire250 <<< wire252) : $signed(reg263)) ?
              ((~&wire238) ?
                  (wire238 + reg244) : wire237) : wire238)) ^~ reg247);
          reg256 <= $unsigned({(8'hab)});
        end
    end
  assign wire265 = $unsigned((-reg241));
  assign wire266 = reg243;
  assign wire267 = (&(((8'hb9) ?
                       ($unsigned((8'ha5)) ?
                           (&(8'hbf)) : reg243) : (~|$signed(reg249))) > (reg256[(4'hb):(4'hb)] >>> ($unsigned(reg261) << $unsigned(reg261)))));
endmodule

module module203
#(parameter param230 = (7'h42))
(y, clk, wire207, wire206, wire205, wire204);
  output wire [(32'h114):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire207;
  input wire signed [(3'h6):(1'h0)] wire206;
  input wire [(5'h15):(1'h0)] wire205;
  input wire [(4'h8):(1'h0)] wire204;
  wire signed [(5'h15):(1'h0)] wire229;
  wire [(4'h8):(1'h0)] wire228;
  wire signed [(3'h5):(1'h0)] wire227;
  wire signed [(3'h5):(1'h0)] wire221;
  wire [(4'hf):(1'h0)] wire220;
  wire signed [(5'h12):(1'h0)] wire219;
  wire signed [(5'h13):(1'h0)] wire210;
  wire signed [(4'hd):(1'h0)] wire209;
  wire signed [(5'h11):(1'h0)] wire208;
  reg signed [(5'h15):(1'h0)] reg226 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg225 = (1'h0);
  reg [(4'ha):(1'h0)] reg224 = (1'h0);
  reg [(4'hf):(1'h0)] reg223 = (1'h0);
  reg [(5'h14):(1'h0)] reg222 = (1'h0);
  reg [(3'h7):(1'h0)] reg218 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg217 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg216 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg215 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg214 = (1'h0);
  reg [(4'hc):(1'h0)] reg213 = (1'h0);
  reg [(3'h6):(1'h0)] reg212 = (1'h0);
  reg [(4'he):(1'h0)] reg211 = (1'h0);
  assign y = {wire229,
                 wire228,
                 wire227,
                 wire221,
                 wire220,
                 wire219,
                 wire210,
                 wire209,
                 wire208,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 (1'h0)};
  assign wire208 = $signed(wire204[(1'h1):(1'h1)]);
  assign wire209 = ((~^(^$signed((~|wire205)))) ?
                       wire205 : {wire204[(4'h8):(3'h5)]});
  assign wire210 = $unsigned(((~|$unsigned((wire206 && wire205))) || $signed($unsigned((wire207 ?
                       wire206 : wire207)))));
  always
    @(posedge clk) begin
      reg211 <= (wire210[(4'ha):(4'h9)] ? $unsigned(wire209) : (~|(+wire209)));
      reg212 <= (reg211 ? reg211[(4'hd):(3'h5)] : {reg211});
      if (wire204[(1'h0):(1'h0)])
        begin
          reg213 <= ($signed((wire206 ~^ wire204)) ?
              (+wire210) : (&((~|(wire209 > wire208)) + wire209[(2'h3):(2'h2)])));
        end
      else
        begin
          if ((wire205[(1'h0):(1'h0)] ?
              $signed(({(reg213 ? wire204 : wire210),
                  $signed((8'hbb))} >> reg211)) : ((wire210 ?
                      $unsigned({reg212}) : (reg212 ?
                          $signed((8'hb3)) : $unsigned(wire207))) ?
                  (|wire207) : wire210[(2'h3):(2'h2)])))
            begin
              reg213 <= (wire207 ?
                  (~&(wire209[(3'h4):(1'h0)] ?
                      ({wire209} <= wire209[(4'ha):(3'h6)]) : wire210)) : wire205);
              reg214 <= (($unsigned((+{wire209})) ?
                  $unsigned(((reg213 && (8'ha8)) ^~ wire206)) : wire204[(3'h4):(1'h0)]) ^~ reg212[(3'h4):(1'h0)]);
              reg215 <= (~(8'hb1));
              reg216 <= wire205;
            end
          else
            begin
              reg213 <= reg211;
              reg214 <= wire209[(4'hd):(4'ha)];
              reg215 <= reg211;
            end
        end
      if (($unsigned((8'hb7)) != (8'ha0)))
        begin
          reg217 <= $unsigned((wire210 >>> ((~^{wire210, wire207}) >> ({reg213,
              reg211} && wire209[(2'h2):(2'h2)]))));
        end
      else
        begin
          reg217 <= (&(wire206[(1'h1):(1'h1)] ?
              $signed(((wire209 <= reg211) ?
                  reg217[(1'h1):(1'h0)] : (wire208 || wire209))) : reg211));
          reg218 <= wire205[(5'h10):(1'h0)];
        end
    end
  assign wire219 = {$signed($unsigned($signed((8'h9e)))), reg212};
  assign wire220 = wire209[(3'h6):(1'h0)];
  assign wire221 = $signed(reg213[(3'h5):(3'h5)]);
  always
    @(posedge clk) begin
      reg222 <= reg213[(3'h4):(1'h1)];
      reg223 <= (~^(8'hb5));
      reg224 <= ({($unsigned($signed(reg223)) ?
                  ((wire207 >>> wire205) >> (~^(8'haa))) : $signed((reg214 <= reg218))),
              reg214} ?
          (($unsigned((wire205 > reg215)) ?
                  ({wire206, reg211} == (~wire210)) : ($signed(wire207) ?
                      (reg223 * wire221) : $signed(wire204))) ?
              ((8'hb4) || $signed($signed(wire209))) : $signed(reg222)) : (+(wire210 ?
              wire205[(3'h4):(2'h3)] : reg216[(3'h7):(1'h1)])));
      reg225 <= $signed($signed(wire209[(4'h8):(3'h6)]));
      reg226 <= $unsigned(wire209);
    end
  assign wire227 = (!(!$unsigned(((~&(8'hb1)) ? (-(8'ha0)) : wire204))));
  assign wire228 = (-({((&wire204) ^~ reg215[(2'h2):(1'h1)]),
                           $unsigned({wire206, reg216})} ?
                       (($unsigned(wire206) << (reg226 ?
                           reg212 : reg217)) > $unsigned(reg226)) : (((8'ha4) ?
                           (wire221 ?
                               reg226 : reg214) : reg212) + $unsigned((reg226 != reg218)))));
  assign wire229 = {reg215[(3'h7):(3'h4)]};
endmodule
