module top
#(parameter param378 = ({(~|(^{(7'h43)})), ((-((8'haa) ? (8'ha1) : (8'ha7))) <<< (((8'hbb) >> (8'hbc)) ? (8'ha1) : ((8'ha5) * (8'ha1))))} * (8'ha5)))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1a7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire signed [(4'hb):(1'h0)] wire343;
  wire signed [(5'h11):(1'h0)] wire178;
  wire signed [(5'h11):(1'h0)] wire75;
  wire [(5'h15):(1'h0)] wire180;
  wire signed [(3'h7):(1'h0)] wire341;
  wire [(3'h7):(1'h0)] wire346;
  wire signed [(4'ha):(1'h0)] wire347;
  wire signed [(4'h8):(1'h0)] wire348;
  wire signed [(5'h14):(1'h0)] wire376;
  reg signed [(5'h11):(1'h0)] reg345 = (1'h0);
  reg [(5'h11):(1'h0)] reg349 = (1'h0);
  reg signed [(4'he):(1'h0)] reg350 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg351 = (1'h0);
  reg signed [(4'he):(1'h0)] reg352 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg353 = (1'h0);
  reg signed [(4'he):(1'h0)] reg354 = (1'h0);
  reg [(2'h3):(1'h0)] reg355 = (1'h0);
  reg [(4'hc):(1'h0)] reg356 = (1'h0);
  reg [(4'hc):(1'h0)] reg357 = (1'h0);
  reg [(4'h8):(1'h0)] reg358 = (1'h0);
  reg [(5'h12):(1'h0)] reg359 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg360 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg361 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg362 = (1'h0);
  reg [(4'he):(1'h0)] reg363 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg364 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg365 = (1'h0);
  reg [(2'h2):(1'h0)] reg366 = (1'h0);
  reg [(5'h13):(1'h0)] reg367 = (1'h0);
  reg [(4'hd):(1'h0)] reg368 = (1'h0);
  reg [(3'h6):(1'h0)] reg369 = (1'h0);
  reg [(4'h9):(1'h0)] reg370 = (1'h0);
  reg [(3'h6):(1'h0)] reg371 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg372 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg373 = (1'h0);
  reg [(4'h8):(1'h0)] reg374 = (1'h0);
  reg [(4'h8):(1'h0)] reg375 = (1'h0);
  assign y = {wire343,
                 wire178,
                 wire75,
                 wire180,
                 wire341,
                 wire346,
                 wire347,
                 wire348,
                 wire376,
                 reg345,
                 reg349,
                 reg350,
                 reg351,
                 reg352,
                 reg353,
                 reg354,
                 reg355,
                 reg356,
                 reg357,
                 reg358,
                 reg359,
                 reg360,
                 reg361,
                 reg362,
                 reg363,
                 reg364,
                 reg365,
                 reg366,
                 reg367,
                 reg368,
                 reg369,
                 reg370,
                 reg371,
                 reg372,
                 reg373,
                 reg374,
                 reg375,
                 (1'h0)};
  module5 #() modinst76 (wire75, clk, wire1, wire2, wire0, wire3, wire4);
  module77 #() modinst179 (.clk(clk), .wire82(wire2), .wire81(wire1), .wire78(wire4), .wire80(wire0), .wire79(wire3), .y(wire178));
  assign wire180 = {wire178[(3'h7):(3'h5)]};
  module181 #() modinst342 (wire341, clk, wire75, wire180, wire1, wire2, wire178);
  module77 #() modinst344 (.wire81(wire1), .y(wire343), .wire78(wire180), .wire79(wire341), .wire80(wire3), .wire82(wire4), .clk(clk));
  always
    @(posedge clk) begin
      reg345 <= (~^$signed(($unsigned(wire3[(2'h3):(1'h1)]) ?
          (wire343[(4'hb):(3'h4)] ?
              (wire75 <<< wire0) : $signed(wire1)) : wire178[(4'ha):(2'h3)])));
    end
  assign wire346 = ($signed((($signed(reg345) >>> (~^wire178)) && {(wire341 ?
                               (8'ha4) : wire178),
                           (wire75 << wire341)})) ?
                       (8'ha4) : (reg345[(3'h5):(1'h0)] < $unsigned(($unsigned(wire1) ?
                           $unsigned(wire0) : (&wire2)))));
  assign wire347 = (!(wire180[(4'h8):(2'h2)] ?
                       $signed($signed($signed(wire2))) : wire180));
  assign wire348 = $signed((wire0 ? (^~wire0) : wire0));
  always
    @(posedge clk) begin
      if ((~|$unsigned(({$unsigned(wire75), $unsigned(wire2)} ?
          ($unsigned(wire178) ?
              wire75 : $unsigned(wire346)) : $unsigned(wire3[(4'hc):(1'h1)])))))
        begin
          if (((~&wire348[(2'h3):(1'h0)]) ?
              (wire4[(2'h2):(1'h1)] ?
                  wire347[(3'h5):(1'h1)] : wire348) : (wire2 ?
                  ({(~|wire343), $signed(wire348)} ?
                      (wire180 | (reg345 ?
                          wire346 : wire2)) : reg345) : {(^~(wire341 ?
                          wire347 : wire1))})))
            begin
              reg349 <= wire347;
              reg350 <= (^~{{{$signed((8'hb1))}, wire180[(3'h6):(2'h3)]},
                  (!wire347[(2'h2):(1'h1)])});
            end
          else
            begin
              reg349 <= $signed(wire0[(4'hc):(4'h8)]);
            end
          reg351 <= (wire341[(3'h7):(2'h3)] ?
              ((&{(-wire178)}) == (~|{(+wire348)})) : ((|$unsigned($unsigned((8'haa)))) ?
                  (((wire346 + wire346) & reg349[(1'h0):(1'h0)]) ?
                      (^~$signed(wire346)) : ((reg349 ?
                          wire75 : reg349) != wire75[(3'h7):(1'h0)])) : (((|reg345) ?
                          (reg350 ^ wire2) : $signed(reg349)) ?
                      wire343[(4'h9):(4'h9)] : (+((7'h43) ^~ reg345)))));
        end
      else
        begin
          if (reg349[(4'hb):(4'ha)])
            begin
              reg349 <= reg345[(5'h10):(3'h7)];
            end
          else
            begin
              reg349 <= $unsigned($signed((~^$signed((^~reg345)))));
              reg350 <= $unsigned(wire341);
              reg351 <= $signed(((^~$signed($unsigned((8'ha8)))) ?
                  (^(~(~wire348))) : $signed(reg349)));
              reg352 <= $unsigned(($signed(($unsigned(reg351) ?
                      $unsigned(wire1) : $unsigned(wire343))) ?
                  ($unsigned(wire346) | ((wire2 ? reg345 : wire178) ?
                      wire341[(1'h0):(1'h0)] : ((8'hba) ?
                          reg351 : (8'hbb)))) : (((7'h41) ?
                          (reg349 ? wire0 : wire178) : (reg349 >> reg351)) ?
                      ($unsigned(wire1) ?
                          (!wire2) : $signed(wire348)) : reg349)));
              reg353 <= ($signed($unsigned(reg349[(3'h5):(1'h0)])) & {($signed((wire75 - (8'had))) ?
                      wire3 : wire3)});
            end
          reg354 <= {(((((8'hb2) ?
                  (7'h41) : reg351) == wire0) - reg352[(3'h5):(2'h3)]) != wire347[(3'h4):(3'h4)]),
              wire347[(1'h1):(1'h0)]};
          reg355 <= {({wire3[(4'h9):(3'h5)]} + $unsigned((~^(-wire348)))),
              (+reg354[(4'h9):(3'h4)])};
        end
    end
  always
    @(posedge clk) begin
      reg356 <= {(wire75 ?
              $unsigned((&$unsigned(wire75))) : ($signed((reg349 <<< reg345)) ?
                  ((wire346 ?
                      reg349 : wire3) > $signed(wire3)) : $signed(wire3)))};
      reg357 <= (^~((((reg356 >= (8'hbf)) ?
                  wire180[(4'h8):(4'h8)] : (wire343 ? reg353 : wire346)) ?
              ((-wire341) ? $signed(wire4) : (~^reg354)) : wire347) ?
          $signed(reg356[(2'h3):(1'h1)]) : ($unsigned($unsigned(wire75)) ?
              (8'hb1) : (|$signed(wire3)))));
      if ($signed($unsigned($unsigned($unsigned((reg349 ? wire0 : (8'ha7)))))))
        begin
          if (((~^$signed((^(+(8'ha9))))) >> ((^~(wire3 << $unsigned(wire341))) ^ (+($signed(wire1) < $signed(reg353))))))
            begin
              reg358 <= ($unsigned(wire178[(3'h5):(2'h2)]) ?
                  $signed({$unsigned({wire75}),
                      {$unsigned(wire178)}}) : $unsigned({wire4}));
              reg359 <= ((^reg357[(4'hb):(4'h9)]) * (reg349 ?
                  ((^~reg353[(2'h2):(2'h2)]) ?
                      ($signed(wire4) ?
                          (~^reg357) : (wire347 ?
                              reg352 : wire180)) : $unsigned((reg356 < (8'h9d)))) : {((wire180 & reg358) >> {wire348,
                          wire341})}));
              reg360 <= reg354[(3'h7):(1'h0)];
              reg361 <= (&($unsigned($signed($signed(reg345))) <<< ($signed({(8'hb8)}) ?
                  $unsigned($unsigned((8'ha7))) : $unsigned($unsigned(reg356)))));
              reg362 <= (((~|{$signed(reg355),
                  (reg345 || reg357)}) + (((reg352 > wire75) ?
                  (wire1 ?
                      wire3 : reg352) : reg355) & ($unsigned(reg357) | (-wire346)))) <= (8'hac));
            end
          else
            begin
              reg358 <= $signed(($unsigned($unsigned($unsigned(reg354))) ?
                  $signed($signed(wire341[(1'h0):(1'h0)])) : wire3));
              reg359 <= reg354[(3'h7):(2'h3)];
              reg360 <= ($signed(({(reg353 - wire1)} ?
                  ($signed(reg361) != (reg361 - wire178)) : $unsigned(wire346[(3'h7):(3'h5)]))) || (reg355 ?
                  (wire2[(4'hc):(4'h8)] - ((reg358 ? wire0 : reg354) ?
                      wire4[(4'ha):(3'h4)] : $signed(reg355))) : (~^({reg359,
                          reg350} ?
                      (reg345 ? reg361 : reg351) : {wire75, reg357}))));
              reg361 <= (8'ha1);
              reg362 <= $unsigned(wire346);
            end
          if ($unsigned($signed((reg353[(3'h5):(1'h0)] ?
              (~((8'hb0) * reg360)) : {(^~wire180), wire178}))))
            begin
              reg363 <= (($signed(wire347[(3'h6):(2'h2)]) & wire346) * $unsigned((^((reg352 ?
                  wire4 : wire75) <= (wire348 || reg359)))));
              reg364 <= reg352;
              reg365 <= {($unsigned((8'hb1)) & ((8'hb4) ?
                      $unsigned($signed(reg351)) : $signed({(8'ha9),
                          reg355})))};
              reg366 <= $unsigned(reg360[(3'h5):(2'h3)]);
              reg367 <= ((reg360[(1'h1):(1'h1)] ?
                  ($unsigned($signed((8'ha6))) ?
                      reg345 : ((wire75 ? (8'hbc) : reg351) ?
                          $signed(wire343) : wire343[(4'hb):(4'h9)])) : $signed((reg350[(3'h7):(2'h3)] ?
                      (wire348 << (8'ha7)) : (+(8'hb1))))) > (8'hb9));
            end
          else
            begin
              reg363 <= $signed($unsigned(($unsigned((wire348 ?
                      wire180 : wire4)) ?
                  (((8'h9c) ^~ reg353) && $signed(reg356)) : ((wire2 ?
                      wire4 : wire75) >= $unsigned(reg350)))));
              reg364 <= $unsigned(($signed(({reg355} ?
                  (!wire180) : $signed(reg349))) >> $signed(($unsigned(reg350) < (wire341 ?
                  wire1 : reg353)))));
              reg365 <= $unsigned(reg353);
            end
          reg368 <= ((!((!(reg358 * reg367)) >> (8'hbc))) ?
              {(((^reg357) ? {reg354} : (wire343 && reg366)) & (^(|wire3))),
                  ((^~$signed(wire347)) ?
                      reg353[(2'h3):(2'h3)] : reg363[(3'h4):(2'h3)])} : $signed($signed($signed((reg355 ?
                  reg358 : wire0)))));
          reg369 <= (~|(($unsigned((~&(8'ha9))) ?
                  reg349[(3'h7):(2'h2)] : reg354[(4'he):(3'h4)]) ?
              ((wire4 ? wire180[(4'hd):(1'h0)] : (reg354 == wire343)) ?
                  $signed($signed(wire2)) : (!reg357)) : reg360[(2'h2):(2'h2)]));
        end
      else
        begin
          reg358 <= reg364;
          reg359 <= {reg355};
          reg360 <= (8'ha9);
          reg361 <= ({$signed($unsigned(((8'had) && reg366)))} ?
              $unsigned(wire178[(5'h11):(5'h10)]) : ((reg357[(3'h4):(2'h2)] <= wire341[(1'h0):(1'h0)]) | reg350));
        end
      if (($signed(($unsigned(reg349) * (wire343[(3'h5):(1'h1)] ?
          wire75[(3'h7):(1'h0)] : $signed(reg354)))) ~^ reg352))
        begin
          if (((reg362[(2'h2):(2'h2)] ?
              wire0 : (&$signed($unsigned(reg366)))) != (reg368[(2'h3):(1'h1)] ?
              reg366 : (~$signed({reg360})))))
            begin
              reg370 <= wire4[(3'h4):(2'h3)];
            end
          else
            begin
              reg370 <= (&$signed($unsigned(((!wire178) - {reg358}))));
              reg371 <= $signed(((($unsigned((8'hb4)) ?
                          $signed(reg369) : (reg354 ? reg353 : wire347)) ?
                      wire346[(1'h0):(1'h0)] : (wire178[(1'h1):(1'h0)] ?
                          $unsigned(reg364) : $unsigned((8'hbe)))) ?
                  {{(+(8'ha5))},
                      ((reg352 ? wire343 : reg361) ?
                          {reg352} : reg358[(1'h1):(1'h0)])} : ((reg364 ?
                      (reg356 != reg352) : (reg351 << wire180)) != ((reg345 ~^ reg353) ?
                      reg360[(3'h4):(1'h1)] : (reg355 * reg352)))));
              reg372 <= reg351[(4'hc):(4'ha)];
              reg373 <= ($signed(({(reg359 * (8'ha3))} ?
                  wire3 : reg350)) || ($signed($unsigned({reg353})) << (reg353[(2'h3):(2'h2)] ?
                  {reg369[(2'h3):(2'h3)], {wire1, reg351}} : wire3)));
            end
          reg374 <= $unsigned({reg351});
          reg375 <= $unsigned((|(-wire0[(3'h4):(3'h4)])));
        end
      else
        begin
          reg370 <= (reg368 ?
              ($signed((reg375 ? (wire341 > reg366) : $unsigned(reg372))) ?
                  wire180 : (~&(reg363 & reg349))) : ($signed((reg357[(4'ha):(4'h8)] ?
                      reg372[(1'h1):(1'h0)] : (wire341 ? wire2 : wire180))) ?
                  (~&$signed((wire75 & reg367))) : $unsigned($signed(((8'hab) > wire0)))));
        end
    end
  module115 #() modinst377 (wire376, clk, reg349, reg352, reg365, wire1);
endmodule

module module181
#(parameter param340 = ((~((((8'hb6) << (8'hb5)) ? ((8'h9c) ? (8'haa) : (8'hb1)) : {(8'h9c), (8'hb1)}) == (-(~(7'h41))))) ? (~&(8'ha6)) : (&((~&((8'hb4) || (8'hbb))) >= (8'ha8)))))
(y, clk, wire186, wire185, wire184, wire183, wire182);
  output wire [(32'h366):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire186;
  input wire signed [(3'h4):(1'h0)] wire185;
  input wire [(5'h10):(1'h0)] wire184;
  input wire [(4'h9):(1'h0)] wire183;
  input wire [(4'h9):(1'h0)] wire182;
  wire signed [(4'he):(1'h0)] wire339;
  wire signed [(4'hf):(1'h0)] wire338;
  wire [(4'hf):(1'h0)] wire300;
  wire [(4'h8):(1'h0)] wire237;
  wire [(4'hf):(1'h0)] wire236;
  wire signed [(4'h9):(1'h0)] wire222;
  wire signed [(4'h9):(1'h0)] wire221;
  wire signed [(4'h8):(1'h0)] wire220;
  wire [(5'h13):(1'h0)] wire219;
  wire signed [(3'h7):(1'h0)] wire218;
  wire [(5'h14):(1'h0)] wire217;
  wire signed [(2'h3):(1'h0)] wire216;
  wire [(2'h3):(1'h0)] wire215;
  wire [(4'ha):(1'h0)] wire302;
  wire signed [(5'h15):(1'h0)] wire313;
  wire signed [(3'h5):(1'h0)] wire336;
  reg [(4'hb):(1'h0)] reg235 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg234 = (1'h0);
  reg [(4'hd):(1'h0)] reg233 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg232 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg231 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg230 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg229 = (1'h0);
  reg [(5'h13):(1'h0)] reg228 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg227 = (1'h0);
  reg [(5'h12):(1'h0)] reg226 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg225 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg224 = (1'h0);
  reg [(5'h13):(1'h0)] reg223 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg214 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg213 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg212 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg211 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg210 = (1'h0);
  reg [(5'h15):(1'h0)] reg209 = (1'h0);
  reg [(4'h8):(1'h0)] reg208 = (1'h0);
  reg [(5'h13):(1'h0)] reg207 = (1'h0);
  reg [(5'h14):(1'h0)] reg206 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg205 = (1'h0);
  reg [(4'he):(1'h0)] reg204 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg203 = (1'h0);
  reg [(3'h4):(1'h0)] reg202 = (1'h0);
  reg [(3'h7):(1'h0)] reg201 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg200 = (1'h0);
  reg [(4'h9):(1'h0)] reg199 = (1'h0);
  reg [(4'hd):(1'h0)] reg198 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg197 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg196 = (1'h0);
  reg [(2'h2):(1'h0)] reg195 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg193 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg190 = (1'h0);
  reg [(5'h10):(1'h0)] reg189 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg188 = (1'h0);
  reg [(4'h8):(1'h0)] reg187 = (1'h0);
  reg [(3'h6):(1'h0)] reg303 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg304 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg305 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg306 = (1'h0);
  reg [(3'h4):(1'h0)] reg307 = (1'h0);
  reg [(4'hd):(1'h0)] reg308 = (1'h0);
  reg [(4'ha):(1'h0)] reg309 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg310 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg311 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg312 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg314 = (1'h0);
  reg [(5'h14):(1'h0)] reg315 = (1'h0);
  reg [(4'hd):(1'h0)] reg316 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg317 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg318 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg319 = (1'h0);
  reg signed [(4'he):(1'h0)] reg320 = (1'h0);
  assign y = {wire339,
                 wire338,
                 wire300,
                 wire237,
                 wire236,
                 wire222,
                 wire221,
                 wire220,
                 wire219,
                 wire218,
                 wire217,
                 wire216,
                 wire215,
                 wire302,
                 wire313,
                 wire336,
                 reg235,
                 reg234,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
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
                 reg303,
                 reg304,
                 reg305,
                 reg306,
                 reg307,
                 reg308,
                 reg309,
                 reg310,
                 reg311,
                 reg312,
                 reg314,
                 reg315,
                 reg316,
                 reg317,
                 reg318,
                 reg319,
                 reg320,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg187 <= (wire183[(4'h9):(3'h4)] ?
          ($unsigned(((wire184 * (7'h40)) << $signed(wire184))) ?
              wire183[(3'h7):(1'h0)] : wire183[(3'h7):(3'h7)]) : {(~&(^(wire183 && wire182))),
              $signed((+wire184))});
      if ((^(~($signed($unsigned(wire182)) - wire182))))
        begin
          if (wire186)
            begin
              reg188 <= wire185[(3'h4):(1'h0)];
            end
          else
            begin
              reg188 <= $signed(reg187[(3'h7):(3'h6)]);
              reg189 <= (((~$signed((+wire183))) ?
                  $signed((((8'hb7) ? reg187 : wire186) ?
                      $unsigned(wire186) : (~|reg188))) : (reg188[(4'he):(3'h5)] ?
                      (reg187[(1'h1):(1'h0)] & ((8'had) <<< reg188)) : ($unsigned(reg188) ?
                          $unsigned(wire183) : (wire185 ?
                              wire182 : wire186)))) == (|(({wire186} ?
                  $unsigned((8'ha2)) : wire184) || ($signed(reg188) >>> ((8'h9c) ?
                  (8'hae) : reg188)))));
              reg190 <= wire185[(2'h3):(2'h2)];
            end
          reg191 <= $unsigned((8'hbb));
          reg192 <= $unsigned(reg189[(3'h6):(3'h5)]);
          reg193 <= $signed(($signed({(^wire185), $signed(reg192)}) ?
              (8'hb4) : (&wire186[(1'h0):(1'h0)])));
          reg194 <= $unsigned(($unsigned(reg191[(5'h11):(1'h1)]) ?
              (~|$unsigned((wire183 ?
                  reg191 : wire186))) : (wire184[(3'h7):(1'h1)] ?
                  reg187 : reg190[(4'h8):(3'h5)])));
        end
      else
        begin
          reg188 <= {$signed(reg189[(4'hf):(2'h3)])};
          if (($signed(reg189) == {$signed(((wire183 ? (8'ha5) : (8'hbc)) ?
                  {wire184} : $unsigned(wire184))),
              {(reg187[(2'h2):(1'h0)] * $signed(wire184)),
                  ((reg190 ? reg189 : wire182) ^ (reg194 << reg193))}}))
            begin
              reg189 <= reg192;
              reg190 <= reg189[(1'h0):(1'h0)];
            end
          else
            begin
              reg189 <= (reg192 | reg192);
              reg190 <= reg191[(3'h4):(2'h3)];
              reg191 <= $unsigned({($signed((~wire186)) <= ($signed(reg194) ?
                      $signed(wire183) : {wire185, reg194})),
                  $signed(((8'hb0) ? (^~reg191) : (reg190 ^ (8'h9e))))});
            end
          reg192 <= ($unsigned($unsigned(($unsigned((8'haf)) >>> (~&reg187)))) >> (reg194[(2'h2):(1'h0)] ?
              reg190[(1'h1):(1'h1)] : $signed(wire184)));
          if ({(wire185 + $unsigned(reg191[(1'h0):(1'h0)]))})
            begin
              reg193 <= wire185[(2'h3):(1'h1)];
              reg194 <= ($signed(((!$signed(wire185)) + (|$unsigned((8'hbc))))) ^ (reg190[(5'h14):(3'h5)] <<< {($signed(reg192) >= wire183),
                  reg187[(3'h5):(3'h4)]}));
            end
          else
            begin
              reg193 <= $unsigned((reg193[(4'hb):(4'h8)] ?
                  ((wire183 == $signed(reg192)) ?
                      (8'hb2) : ((reg189 ? reg187 : wire186) ?
                          $signed(wire184) : (~&(8'hac)))) : (~$signed(wire182[(2'h2):(1'h0)]))));
              reg194 <= $signed(reg191);
              reg195 <= $unsigned($signed($signed(wire184[(2'h2):(1'h1)])));
            end
          if (({wire184, (~^(8'haf))} ?
              $unsigned(reg193) : ($signed({(reg193 ?
                      wire184 : reg190)}) - {wire186,
                  {(~|reg192), (wire186 ? reg190 : (8'h9e))}})))
            begin
              reg196 <= (~&$unsigned(reg190));
              reg197 <= (($signed(((~|reg188) ?
                      reg189[(4'hd):(3'h7)] : reg195)) != (~$signed(reg195))) ?
                  wire186[(3'h7):(3'h4)] : $unsigned((reg196[(3'h7):(3'h6)] ?
                      $signed((^reg189)) : ((|(8'ha1)) ?
                          (~&reg187) : wire182))));
              reg198 <= (+(^wire184));
              reg199 <= $unsigned((-((8'ha6) ~^ (~|(reg193 - reg191)))));
              reg200 <= ((^~reg197[(4'hc):(3'h6)]) ?
                  reg193 : $unsigned(($unsigned((^reg189)) ?
                      (~|$unsigned(reg191)) : (8'hba))));
            end
          else
            begin
              reg196 <= ({(!$unsigned({(8'ha7)})),
                  ((wire184 ?
                      (wire185 ?
                          reg195 : reg199) : (~&reg189)) == reg189[(3'h6):(3'h4)])} <= reg187[(4'h8):(3'h4)]);
            end
        end
      if ((|(reg189 ? wire186 : (^~$unsigned((~(8'hb8)))))))
        begin
          reg201 <= {reg198[(3'h5):(1'h1)]};
          reg202 <= $unsigned((reg198[(4'hc):(1'h0)] ?
              (~&$signed(wire186[(1'h1):(1'h1)])) : (({reg191} + $signed(reg192)) ?
                  $signed((reg188 ? reg192 : wire184)) : ((reg189 * wire185) ?
                      (reg194 != (8'haf)) : (wire182 <<< reg195)))));
        end
      else
        begin
          reg201 <= reg187;
          reg202 <= wire186[(3'h6):(1'h1)];
          if (reg200[(3'h4):(2'h2)])
            begin
              reg203 <= wire183[(1'h1):(1'h0)];
              reg204 <= wire183;
            end
          else
            begin
              reg203 <= (reg194 ?
                  $signed({{$signed((8'hb6)), $unsigned(reg190)},
                      {reg190[(5'h14):(4'hc)],
                          {(8'hb3)}}}) : ($signed({$signed(reg196),
                          $unsigned((8'ha4))}) ?
                      $signed(((~|wire184) * $signed(reg204))) : $unsigned(($signed(reg192) ?
                          $signed((8'hae)) : wire182[(3'h4):(1'h0)]))));
              reg204 <= (|reg201[(1'h1):(1'h1)]);
              reg205 <= ((~^wire186) ?
                  wire183[(2'h2):(2'h2)] : (((~&(reg200 ?
                      (8'h9d) : reg203)) >>> ((-reg197) ?
                      reg198 : {(8'haf), reg187})) + $signed(reg201)));
            end
          if (reg188[(2'h2):(2'h2)])
            begin
              reg206 <= (8'ha0);
              reg207 <= $unsigned(reg194[(4'hc):(1'h1)]);
              reg208 <= ($signed($signed((reg187[(3'h7):(1'h0)] < {reg207}))) * ((^reg197) != $unsigned(reg197)));
              reg209 <= reg192;
              reg210 <= reg190[(4'h9):(3'h5)];
            end
          else
            begin
              reg206 <= ((reg197[(4'hb):(4'ha)] ?
                  (!reg193) : (~&reg206)) | (8'hb7));
              reg207 <= $signed(reg197[(4'hd):(1'h0)]);
            end
          if ((|($signed((~|$signed((7'h43)))) ?
              $unsigned(reg187) : (((&(7'h41)) ^ (reg187 ? reg202 : wire185)) ?
                  (wire186 >> $unsigned(reg190)) : ((reg204 ?
                          wire182 : reg198) ?
                      reg195[(1'h1):(1'h0)] : $unsigned(reg203))))))
            begin
              reg211 <= $signed(((+(^reg189)) ?
                  $signed(reg202) : $signed($signed($unsigned(reg192)))));
              reg212 <= {{wire183, {$unsigned((reg203 ? reg189 : (7'h40)))}}};
              reg213 <= {$signed(wire183),
                  (reg209[(5'h11):(3'h5)] ?
                      reg206[(4'ha):(1'h0)] : ((+((8'ha0) >>> reg206)) == $unsigned(wire182[(4'h8):(4'h8)])))};
              reg214 <= (($signed((~^(reg213 ?
                  (8'hba) : wire186))) + reg210) + reg208);
            end
          else
            begin
              reg211 <= ($unsigned((wire182 ?
                      reg197 : $signed(reg199[(3'h5):(1'h1)]))) ?
                  $signed($unsigned(reg206[(4'h9):(3'h4)])) : reg188);
              reg212 <= $signed($unsigned((reg189 >>> reg202[(2'h3):(1'h0)])));
            end
        end
    end
  assign wire215 = (~&(^(+$unsigned(wire183))));
  assign wire216 = reg211;
  assign wire217 = (!{reg203[(3'h7):(3'h7)], $unsigned($signed((8'hb7)))});
  assign wire218 = $unsigned((+((~&(reg201 < reg207)) ~^ reg192)));
  assign wire219 = ((reg213 ?
                       (8'ha3) : (reg210 <= (~&(wire217 ?
                           reg208 : (8'hba))))) || reg196[(3'h7):(2'h2)]);
  assign wire220 = $unsigned($unsigned(((^~((8'hb3) ^~ (8'hac))) + ($signed((7'h41)) >> reg187))));
  assign wire221 = $signed(wire218[(1'h1):(1'h0)]);
  assign wire222 = $unsigned(($signed(({reg200,
                           wire218} == (wire218 ~^ reg211))) ?
                       {($unsigned(wire219) == (~wire219))} : $signed($signed(reg190[(4'ha):(4'h8)]))));
  always
    @(posedge clk) begin
      if (reg200[(3'h5):(1'h1)])
        begin
          reg223 <= (reg202[(1'h1):(1'h1)] ?
              reg205[(1'h0):(1'h0)] : ((((reg213 ?
                  reg214 : reg204) ~^ $signed((8'hb9))) & {(wire220 * wire183)}) - wire220));
          if (wire218)
            begin
              reg224 <= $signed(reg210);
              reg225 <= reg198;
            end
          else
            begin
              reg224 <= reg196[(1'h0):(1'h0)];
              reg225 <= wire221;
              reg226 <= (($unsigned(((8'hb8) >> wire185[(1'h1):(1'h1)])) << $signed(reg213)) + reg224[(2'h2):(2'h2)]);
            end
          if (wire218)
            begin
              reg227 <= (($signed(($signed(wire186) ?
                      ((8'ha4) != reg209) : (reg205 ?
                          reg201 : wire219))) >>> (~reg191)) ?
                  ((((reg209 ? wire183 : wire222) ?
                              wire217 : (reg200 >>> reg195)) ?
                          $unsigned({reg188}) : ($unsigned(wire216) ?
                              reg226 : (reg191 ? reg199 : (8'hbb)))) ?
                      ({$signed(reg213),
                          (reg188 ?
                              wire216 : reg225)} && $signed($unsigned(reg187))) : (reg190 ?
                          (~reg193) : wire219[(3'h4):(3'h4)])) : ($unsigned($unsigned($signed(reg188))) ?
                      $signed(wire183) : $signed(($signed(reg187) ?
                          (~wire186) : ((8'hae) - reg192)))));
              reg228 <= (({(~&$signed((8'haa)))} ?
                  wire183[(4'h8):(2'h2)] : ((~|reg212) ?
                      $unsigned(reg212) : reg208)) + reg200);
              reg229 <= ($unsigned((8'hb7)) > wire186);
            end
          else
            begin
              reg227 <= (({(reg188 ? (reg194 >> reg207) : (wire221 && reg228)),
                  ({reg193} >> reg188[(2'h3):(2'h2)])} <= reg227[(1'h1):(1'h1)]) >= ((~&{(~^reg225),
                  (^~reg191)}) ^~ wire218[(3'h7):(3'h4)]));
              reg228 <= (wire215[(2'h2):(2'h2)] ?
                  (((~^(wire219 ~^ reg206)) ?
                      reg210[(1'h0):(1'h0)] : (reg200 == wire186)) <<< $unsigned($unsigned(reg225))) : {reg198[(4'hc):(4'hb)],
                      (~reg212)});
              reg229 <= reg203;
              reg230 <= (reg202 ?
                  $signed((wire217[(4'hc):(3'h4)] ~^ ((!reg209) ?
                      (wire222 ?
                          reg204 : reg194) : reg198))) : (wire184[(2'h3):(2'h2)] | reg223[(3'h6):(1'h1)]));
              reg231 <= (($unsigned(reg210) > ((!(~^reg211)) * ((reg193 ?
                          reg225 : wire215) ?
                      reg193[(2'h3):(1'h0)] : $unsigned(reg206)))) ?
                  (reg201[(2'h2):(2'h2)] ?
                      (!reg194[(4'ha):(3'h7)]) : (reg187 & $signed((^wire222)))) : {(|reg226[(3'h4):(1'h0)])});
            end
          reg232 <= $signed({reg188[(2'h2):(1'h1)], reg226});
          reg233 <= (reg195[(1'h1):(1'h0)] ?
              (((reg188 ? (wire222 != wire220) : wire222) ?
                  ($signed((8'hae)) ?
                      (^reg198) : (reg209 || reg231)) : $signed($unsigned(reg200))) ^~ $unsigned((|(reg205 ?
                  reg193 : (7'h43))))) : {wire184[(3'h7):(2'h2)], (~(8'h9e))});
        end
      else
        begin
          reg223 <= (reg203 ?
              reg209[(2'h3):(2'h3)] : ({reg224,
                  (reg231 ?
                      (wire216 ? reg213 : wire221) : (-(8'ha0)))} & (wire219 ?
                  wire219 : $signed((reg206 << (8'hb4))))));
          reg224 <= $signed($unsigned(wire217));
          reg225 <= reg230;
        end
      reg234 <= {reg207,
          (~&($signed($unsigned(wire216)) >>> (reg227 ?
              (wire215 <= reg224) : reg192)))};
      reg235 <= reg204[(3'h4):(1'h1)];
    end
  assign wire236 = wire185;
  assign wire237 = ({($unsigned((7'h41)) ?
                               $signed((~|wire218)) : (^~$unsigned((7'h44))))} ?
                       $signed(reg197[(3'h6):(2'h2)]) : (&reg188[(3'h5):(3'h4)]));
  module238 #() modinst301 (.wire241(reg234), .clk(clk), .y(wire300), .wire239(wire184), .wire242(reg232), .wire240(reg194));
  assign wire302 = (wire183[(4'h9):(3'h4)] && (wire217[(5'h13):(4'hf)] << reg202));
  always
    @(posedge clk) begin
      if ($unsigned({{(^((8'had) <<< wire220)),
              ($unsigned(reg226) && (reg213 || wire300))},
          (((reg187 ? reg201 : reg187) >>> (|reg223)) - reg229)}))
        begin
          if (($unsigned(wire220[(1'h0):(1'h0)]) ?
              (-reg203[(3'h7):(2'h2)]) : (!((~|(~&reg213)) | {$signed(wire182)}))))
            begin
              reg303 <= (!{reg198, wire302[(4'h8):(2'h2)]});
              reg304 <= $unsigned((^~($signed(reg203[(3'h6):(3'h6)]) ?
                  $signed((reg190 != wire219)) : ((reg197 - reg224) ?
                      $signed(reg226) : $unsigned(reg195)))));
            end
          else
            begin
              reg303 <= wire216;
              reg304 <= (({($signed(reg206) ^~ (wire216 >>> reg192)),
                          ((wire184 ^~ reg188) <= $signed(reg235))} ?
                      $unsigned(({wire215} ?
                          (reg194 ? reg189 : reg211) : (reg232 ?
                              reg232 : reg229))) : $signed((wire218[(2'h3):(2'h2)] ?
                          wire217 : (reg235 ^ (8'hab))))) ?
                  (wire217 ?
                      ((&(|(8'hbe))) << wire186) : reg197[(1'h0):(1'h0)]) : $unsigned((reg199[(4'h8):(3'h4)] || reg194)));
              reg305 <= ({($signed((reg194 != reg190)) ?
                      wire222 : $signed((wire186 ?
                          (7'h44) : wire185)))} | reg202[(2'h2):(1'h1)]);
            end
          if ((^~((($unsigned(reg196) >>> (~^reg194)) & $unsigned($unsigned(reg197))) > {reg188})))
            begin
              reg306 <= $signed(reg213);
              reg307 <= wire300;
              reg308 <= (~(~reg204[(3'h7):(3'h6)]));
              reg309 <= {$signed(reg303)};
              reg310 <= $signed((reg212[(3'h5):(2'h2)] ?
                  (~^$signed({reg192,
                      reg206})) : (reg210[(2'h3):(2'h2)] || (reg197[(3'h6):(3'h6)] ?
                      (8'ha2) : (reg202 ? reg309 : reg197)))));
            end
          else
            begin
              reg306 <= {$signed(reg234), (8'hbe)};
              reg307 <= wire185;
              reg308 <= $signed(((reg204 ~^ (|(reg199 * reg230))) ~^ reg198[(3'h5):(2'h3)]));
              reg309 <= reg214;
              reg310 <= ((($signed((~reg223)) <<< {(reg223 > (8'ha7)),
                  (wire185 ? reg202 : reg303)}) >>> ({$signed(wire184),
                      wire184} ?
                  (&reg202[(2'h2):(1'h0)]) : ((wire184 ? (8'ha7) : reg310) ?
                      (8'ha2) : (-reg234)))) + $signed((~|reg304[(3'h7):(2'h3)])));
            end
        end
      else
        begin
          reg303 <= reg208;
          reg304 <= ($signed($unsigned(reg225)) && $signed((~|(8'hab))));
          reg305 <= ((reg206[(2'h2):(1'h0)] ?
              (wire236 ?
                  (^reg195[(1'h1):(1'h1)]) : (^~((8'hb6) ?
                      reg233 : reg307))) : wire302) * ((|(reg203 ?
                  $unsigned(reg306) : reg225[(4'hb):(2'h3)])) ?
              (^((reg212 ? reg192 : wire237) ?
                  (reg187 <<< wire300) : (reg187 ?
                      reg231 : reg307))) : (~$unsigned($unsigned(wire236)))));
          reg306 <= (^reg229[(2'h3):(1'h0)]);
          if ($signed($unsigned((reg304[(2'h3):(1'h0)] ?
              (&(reg206 ? reg197 : reg187)) : reg206))))
            begin
              reg307 <= $unsigned($unsigned($signed(reg307)));
              reg308 <= (+(reg202[(1'h1):(1'h1)] ^ (^(8'ha5))));
            end
          else
            begin
              reg307 <= $signed(reg193);
            end
        end
      reg311 <= reg190[(5'h12):(4'hb)];
      reg312 <= (reg224[(2'h2):(2'h2)] ?
          (^reg306) : $unsigned((reg309 && reg205[(1'h1):(1'h1)])));
    end
  assign wire313 = (($unsigned($signed(reg194[(4'ha):(3'h6)])) || (((+reg203) <<< $unsigned((8'haf))) ?
                       (reg213[(3'h7):(1'h0)] < {(8'h9c)}) : ((wire220 <= wire221) ?
                           reg214 : reg233[(4'h9):(1'h1)]))) >> {(+{wire300,
                           {reg193, (7'h41)}})});
  always
    @(posedge clk) begin
      if (({reg197} ^ $unsigned(wire186[(2'h3):(1'h0)])))
        begin
          reg314 <= reg226[(3'h4):(3'h4)];
          reg315 <= $signed($signed((^~(!reg231))));
          if ((8'h9d))
            begin
              reg316 <= reg188;
              reg317 <= reg198;
              reg318 <= reg307[(2'h3):(2'h2)];
              reg319 <= $signed((($unsigned((reg201 | reg203)) ?
                      $unsigned((reg195 ?
                          wire222 : reg199)) : $signed((|reg314))) ?
                  reg212[(2'h2):(1'h1)] : ($unsigned((reg202 ?
                          (8'hbc) : wire219)) ?
                      (8'ha9) : $signed(((8'hb9) <<< reg191)))));
            end
          else
            begin
              reg316 <= $unsigned(($signed((reg207 <<< $signed(wire221))) >> wire218));
              reg317 <= wire300[(4'hd):(4'ha)];
            end
        end
      else
        begin
          reg314 <= $signed($signed((~^$unsigned(wire216[(2'h2):(1'h1)]))));
          if (reg311)
            begin
              reg315 <= ($signed($unsigned({reg213,
                  wire183[(3'h6):(1'h0)]})) - ($unsigned((reg214 * (wire184 ?
                      reg317 : reg192))) ?
                  $unsigned({(8'hab),
                      $signed(reg204)}) : $unsigned($unsigned($unsigned(reg226)))));
              reg316 <= $signed(((((~&reg200) ?
                  (&reg194) : reg212[(1'h1):(1'h0)]) != wire237[(2'h2):(1'h0)]) << $signed((reg200[(3'h4):(2'h3)] * (~(7'h40))))));
              reg317 <= (!{$signed((~^(wire222 ? wire236 : reg203)))});
              reg318 <= ((!wire313[(1'h0):(1'h0)]) < $unsigned(((-$signed(reg207)) < wire183)));
            end
          else
            begin
              reg315 <= $unsigned(($signed(($unsigned((8'hb4)) >> (reg192 ~^ (8'had)))) == $unsigned(((8'ha0) ^~ wire184[(4'ha):(3'h5)]))));
              reg316 <= ((^$signed($unsigned((reg206 + wire220)))) ?
                  (~|{$signed(reg224)}) : (reg200[(2'h2):(1'h0)] ?
                      wire221 : ($unsigned($signed(reg229)) == (|$signed(reg232)))));
              reg317 <= reg190;
              reg318 <= ((reg204 ?
                  $unsigned(reg231) : reg307[(2'h3):(1'h0)]) ^~ ({wire221} ^ reg234));
            end
          reg319 <= (reg193 <<< ((((wire237 * wire222) ?
                  (reg312 || (8'hbf)) : ((8'h9e) ? reg204 : reg208)) ?
              (wire183[(3'h6):(1'h1)] ?
                  reg305 : reg204) : reg191[(2'h3):(2'h3)]) < (8'hbb)));
          reg320 <= (wire184[(3'h6):(3'h6)] >>> (8'ha7));
        end
    end
  module321 #() modinst337 (wire336, clk, reg226, reg234, wire221, reg235);
  assign wire338 = $signed((~|(wire182[(2'h3):(1'h0)] + reg312)));
  assign wire339 = ((((~$unsigned(reg306)) ?
                           reg198[(3'h7):(3'h4)] : $signed({reg310})) & wire184) ?
                       $signed({(~&$unsigned(wire184)),
                           (8'h9c)}) : ($signed($signed((reg196 ?
                           wire222 : (8'hb5)))) == ($signed($unsigned(wire338)) || $signed((+reg227)))));
endmodule

module module77
#(parameter param177 = ({(^(((8'hbc) ? (8'had) : (8'ha7)) ? {(8'ha4), (8'hac)} : ((8'ha2) ? (7'h43) : (8'ha3)))), ((^~((8'hb2) ? (8'h9e) : (8'hb0))) ? (-((8'ha0) << (8'hb0))) : (((8'ha8) == (8'hbf)) ? ((7'h43) >>> (8'hba)) : ((8'ha0) > (8'hbe))))} ^~ ((^~(^~((8'hb5) <<< (7'h42)))) << (~|{(^(8'hbd)), ((8'ha3) ? (8'hb2) : (8'hab))}))))
(y, clk, wire78, wire79, wire80, wire81, wire82);
  output wire [(32'h162):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire78;
  input wire signed [(3'h6):(1'h0)] wire79;
  input wire signed [(5'h11):(1'h0)] wire80;
  input wire [(4'h8):(1'h0)] wire81;
  input wire [(4'hd):(1'h0)] wire82;
  wire signed [(3'h5):(1'h0)] wire176;
  wire signed [(3'h7):(1'h0)] wire83;
  wire [(5'h14):(1'h0)] wire84;
  wire signed [(5'h15):(1'h0)] wire85;
  wire [(4'h9):(1'h0)] wire86;
  wire signed [(3'h6):(1'h0)] wire88;
  wire signed [(4'ha):(1'h0)] wire89;
  wire signed [(4'hc):(1'h0)] wire90;
  wire [(4'hd):(1'h0)] wire91;
  wire [(4'hd):(1'h0)] wire92;
  wire [(2'h3):(1'h0)] wire93;
  wire [(5'h10):(1'h0)] wire94;
  wire [(4'hf):(1'h0)] wire95;
  wire [(2'h3):(1'h0)] wire96;
  wire [(4'hf):(1'h0)] wire97;
  wire [(5'h12):(1'h0)] wire98;
  wire [(3'h6):(1'h0)] wire99;
  wire [(4'h8):(1'h0)] wire112;
  wire [(4'ha):(1'h0)] wire113;
  wire signed [(3'h4):(1'h0)] wire174;
  reg signed [(5'h12):(1'h0)] reg87 = (1'h0);
  reg [(5'h12):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg102 = (1'h0);
  reg [(3'h4):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg104 = (1'h0);
  reg [(5'h14):(1'h0)] reg105 = (1'h0);
  reg [(2'h3):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg107 = (1'h0);
  reg [(4'h8):(1'h0)] reg108 = (1'h0);
  reg [(5'h10):(1'h0)] reg109 = (1'h0);
  reg [(3'h7):(1'h0)] reg110 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg111 = (1'h0);
  reg [(5'h10):(1'h0)] reg114 = (1'h0);
  assign y = {wire176,
                 wire83,
                 wire84,
                 wire85,
                 wire86,
                 wire88,
                 wire89,
                 wire90,
                 wire91,
                 wire92,
                 wire93,
                 wire94,
                 wire95,
                 wire96,
                 wire97,
                 wire98,
                 wire99,
                 wire112,
                 wire113,
                 wire174,
                 reg87,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 reg106,
                 reg107,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 reg114,
                 (1'h0)};
  assign wire83 = $signed(wire80);
  assign wire84 = {($unsigned((wire79 * (|wire81))) ?
                          wire78 : $signed({{wire81}, $signed(wire79)}))};
  assign wire85 = $unsigned(wire81[(1'h0):(1'h0)]);
  assign wire86 = (((~^(wire78[(4'hf):(1'h1)] | (wire81 * wire85))) ?
                      wire82 : ($signed((wire79 >>> wire83)) ?
                          wire82[(4'hd):(4'h8)] : wire82[(1'h1):(1'h1)])) | $unsigned(wire81[(3'h6):(3'h4)]));
  always
    @(posedge clk) begin
      reg87 <= $unsigned($unsigned($unsigned(wire82)));
    end
  assign wire88 = (wire80[(3'h5):(3'h5)] ?
                      (($unsigned((^~wire79)) | wire81[(3'h5):(2'h2)]) ?
                          (8'hb6) : (~&(wire80 ?
                              $signed(wire78) : wire84))) : (wire80[(2'h3):(1'h0)] * (((wire81 << wire80) ?
                              $unsigned(wire79) : wire84) ?
                          $signed(wire81) : wire82[(1'h1):(1'h1)])));
  assign wire89 = (wire78[(4'hb):(3'h4)] ?
                      $unsigned($unsigned($unsigned(wire78[(5'h12):(4'hc)]))) : ((|$signed((wire80 << (8'hb9)))) && (^~(8'ha2))));
  assign wire90 = (^$unsigned($unsigned(wire83[(3'h4):(1'h1)])));
  assign wire91 = ((wire79[(3'h5):(2'h2)] != reg87[(4'hc):(4'hb)]) ^~ wire89);
  assign wire92 = ((~^((~^(~&wire79)) ? $signed($unsigned(wire82)) : (8'ha6))) ?
                      $unsigned({$unsigned(wire89),
                          $signed(((8'ha9) ? wire83 : wire90))}) : wire89);
  assign wire93 = $unsigned((wire89 | wire78[(3'h7):(2'h2)]));
  assign wire94 = wire82[(3'h7):(3'h5)];
  assign wire95 = $unsigned($unsigned((!(wire82 ?
                      (wire83 ? wire93 : wire90) : $unsigned(wire94)))));
  assign wire96 = (wire85 >>> (~^(wire79 ^ (+(~|wire85)))));
  assign wire97 = ($unsigned($signed(reg87[(5'h12):(3'h4)])) ?
                      $signed((wire93 == $signed(wire86[(1'h1):(1'h1)]))) : reg87);
  assign wire98 = ($unsigned(wire93[(2'h2):(2'h2)]) ?
                      wire95[(4'hf):(3'h6)] : (wire85 < (~&$signed($unsigned(wire83)))));
  assign wire99 = wire83;
  always
    @(posedge clk) begin
      reg100 <= $unsigned((wire99[(3'h4):(1'h1)] ?
          wire97 : wire86[(2'h3):(2'h2)]));
      if (reg100)
        begin
          reg101 <= wire93[(1'h1):(1'h1)];
          reg102 <= (+($signed({{wire96}}) ?
              wire78 : {{$unsigned(wire83), reg100},
                  ((wire95 << wire95) ? (wire90 != (8'h9c)) : {wire93})}));
          if ((wire81[(3'h4):(1'h1)] ?
              ($signed(($unsigned(wire92) << (wire79 ?
                  wire97 : wire95))) - (({wire79} + (&wire92)) || $unsigned($signed(wire88)))) : wire79[(2'h3):(1'h0)]))
            begin
              reg103 <= (~&reg102);
              reg104 <= wire78[(4'hb):(1'h0)];
              reg105 <= ($signed((reg87 ?
                  (~&$unsigned(reg101)) : (8'hab))) >= $signed((8'hb1)));
              reg106 <= $signed({(-$signed($signed((8'ha0)))),
                  (wire86 ?
                      $signed($signed(wire89)) : (wire82[(4'h8):(4'h8)] >>> (wire78 ~^ wire90)))});
            end
          else
            begin
              reg103 <= $unsigned($signed((8'hb3)));
              reg104 <= $unsigned($signed(reg103[(1'h1):(1'h0)]));
              reg105 <= (8'hbd);
              reg106 <= (~&($unsigned(((+wire93) & $unsigned(reg104))) ?
                  $signed($signed($signed(reg87))) : ((reg100 ?
                      reg106 : (reg100 ? wire96 : (8'haa))) == wire81)));
            end
          if ($signed($unsigned(wire84)))
            begin
              reg107 <= ((8'hb5) ^ (~^$unsigned((reg103 ?
                  $signed(reg102) : wire81[(4'h8):(2'h3)]))));
              reg108 <= (wire85 ?
                  ($signed($unsigned($unsigned(reg100))) ^~ reg101[(1'h1):(1'h1)]) : wire82[(2'h2):(2'h2)]);
              reg109 <= wire84;
              reg110 <= reg100[(4'h8):(1'h1)];
            end
          else
            begin
              reg107 <= wire80[(4'h8):(3'h7)];
              reg108 <= $signed({wire79[(1'h1):(1'h0)], wire81});
              reg109 <= wire83;
              reg110 <= $signed(reg102);
              reg111 <= ($unsigned(wire83[(2'h3):(1'h0)]) ?
                  $signed(($unsigned(wire81[(4'h8):(2'h3)]) ?
                      $signed((reg109 << reg105)) : $unsigned(reg101))) : $unsigned(wire89));
            end
        end
      else
        begin
          reg101 <= reg110[(3'h7):(2'h2)];
          reg102 <= $signed($unsigned(({(8'hac)} >> $unsigned($unsigned(wire86)))));
          if ((8'ha8))
            begin
              reg103 <= $unsigned($unsigned(wire83[(2'h3):(1'h1)]));
            end
          else
            begin
              reg103 <= {(8'hb4), $unsigned(reg110)};
              reg104 <= wire94[(4'hf):(1'h0)];
              reg105 <= $unsigned($unsigned((7'h40)));
              reg106 <= (^($unsigned(wire83[(1'h0):(1'h0)]) | ({(reg102 ?
                          wire85 : reg102)} ?
                  $unsigned($unsigned(reg103)) : $signed({reg109, wire93}))));
              reg107 <= {((~|reg106) ?
                      wire88[(2'h2):(1'h1)] : $signed((wire99[(1'h0):(1'h0)] ?
                          (reg101 & wire95) : $unsigned(wire94))))};
            end
          reg108 <= (($unsigned($signed(((8'hbd) ?
              wire85 : (8'ha0)))) || wire78) <<< ({$signed(wire97)} || (!$unsigned((reg103 - reg102)))));
        end
    end
  assign wire112 = (wire95 ?
                       (|(~^($signed(wire83) != $unsigned((8'hb3))))) : reg109[(3'h4):(3'h4)]);
  assign wire113 = (wire79[(3'h6):(2'h3)] ?
                       wire82[(2'h3):(1'h1)] : reg87[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      reg114 <= ($unsigned((^~$signed($signed(reg87)))) ?
          reg101 : (((~wire88[(1'h1):(1'h1)]) == wire88[(2'h3):(1'h0)]) ?
              $unsigned(((wire99 == wire96) && (wire112 >>> wire83))) : $unsigned($unsigned((wire82 - wire90)))));
    end
  module115 #() modinst175 (wire174, clk, wire80, wire113, reg114, wire84);
  assign wire176 = ((|(((wire96 ?
                       reg101 : wire91) < $signed(wire93)) >>> (wire82 ?
                       (-wire89) : (wire85 > wire95)))) >> {(~&wire113[(2'h2):(2'h2)]),
                       ({$unsigned(wire80), (8'hb3)} ?
                           ((wire95 ? wire90 : wire85) ?
                               (reg108 > reg100) : $signed((8'hac))) : (wire90[(4'ha):(2'h2)] ?
                               ((8'ha7) ?
                                   wire85 : (8'hb1)) : $signed(wire89)))});
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h161):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire6;
  input wire signed [(3'h7):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire8;
  input wire [(2'h3):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire50;
  wire [(3'h7):(1'h0)] wire49;
  wire signed [(4'hb):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire47;
  reg [(4'h9):(1'h0)] reg74 = (1'h0);
  reg [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(4'h9):(1'h0)] reg72 = (1'h0);
  reg [(2'h2):(1'h0)] reg71 = (1'h0);
  reg [(5'h12):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg69 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg68 = (1'h0);
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg63 = (1'h0);
  reg [(3'h7):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg61 = (1'h0);
  reg [(2'h2):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg [(4'hd):(1'h0)] reg58 = (1'h0);
  reg [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg56 = (1'h0);
  reg [(5'h13):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg [(5'h10):(1'h0)] reg51 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire47,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  assign wire11 = $unsigned($signed((-(wire7 && $unsigned(wire7)))));
  assign wire12 = (-wire8);
  assign wire13 = $unsigned($unsigned((8'h9f)));
  assign wire14 = (({$signed({wire10, wire13}), (7'h41)} ?
                          $signed(((wire6 * wire12) ?
                              (wire11 + wire8) : (wire6 >= (8'hb1)))) : (wire7 ?
                              ((wire7 != wire8) ^ $unsigned(wire12)) : ({wire13,
                                      wire6} ?
                                  (!wire9) : (&wire9)))) ?
                      wire9 : $unsigned((&({wire10} ?
                          $unsigned(wire8) : (wire11 ? wire12 : wire12)))));
  module15 #() modinst48 (.wire19(wire11), .wire16(wire10), .y(wire47), .wire17(wire13), .wire18(wire8), .clk(clk), .wire20(wire14));
  assign wire49 = (wire7 ?
                      $unsigned(wire13) : $unsigned((~&($unsigned(wire13) ?
                          $unsigned(wire11) : (wire7 ? wire13 : wire6)))));
  assign wire50 = (8'ha5);
  always
    @(posedge clk) begin
      if ((((^~((~wire10) ? $signed(wire13) : (wire49 ? (7'h44) : wire11))) ?
              ($signed(wire14) ?
                  $signed($signed(wire9)) : $signed(wire14[(1'h0):(1'h0)])) : ($unsigned({wire9}) ?
                  wire47 : wire10[(3'h7):(2'h2)])) ?
          ({wire6, wire50[(5'h12):(4'hf)]} ^~ (wire50 || ((wire10 | wire14) ?
              $signed((8'ha2)) : (wire7 ?
                  (8'hb3) : wire9)))) : (&((wire49[(3'h5):(2'h2)] && (wire11 ?
              wire14 : wire10)) == $signed((wire11 ? wire12 : wire11))))))
        begin
          reg51 <= ($unsigned(wire50) ?
              wire8[(1'h1):(1'h1)] : $unsigned(($signed($unsigned((8'h9d))) & $unsigned(wire9[(1'h1):(1'h1)]))));
          if ((~{$unsigned(wire14)}))
            begin
              reg52 <= (($unsigned((~|$signed((8'hb4)))) & ((((8'hae) ?
                          wire6 : wire6) <<< wire11[(2'h3):(2'h3)]) ?
                      ($unsigned((7'h42)) ?
                          (~|wire12) : $unsigned((8'hb6))) : {(~&wire9),
                          (wire8 < wire47)})) ?
                  $signed(((~wire12) ?
                      $unsigned({wire50, wire8}) : (wire8[(4'hf):(4'h9)] ?
                          (wire14 ?
                              wire47 : wire8) : (wire7 >>> wire10)))) : wire8[(4'ha):(3'h5)]);
              reg53 <= (!$unsigned(wire10[(2'h2):(1'h0)]));
            end
          else
            begin
              reg52 <= wire12;
              reg53 <= reg51[(1'h1):(1'h1)];
              reg54 <= ($unsigned((-{(reg53 || (7'h44))})) ?
                  $signed((8'hac)) : ((wire13[(2'h2):(1'h0)] ? wire9 : reg53) ?
                      (^reg51) : ($signed($signed(wire47)) ?
                          wire47 : $unsigned((~|(8'hac))))));
              reg55 <= (|reg53[(3'h6):(2'h3)]);
            end
          reg56 <= wire11;
          reg57 <= ((^((8'ha3) ? $signed($unsigned((8'h9d))) : (7'h44))) ?
              ((&wire50[(1'h0):(1'h0)]) ?
                  $unsigned((reg54[(1'h0):(1'h0)] >> wire11[(4'ha):(2'h2)])) : {(wire12[(4'hd):(4'h9)] ?
                          wire14 : (wire12 & wire8))}) : reg56[(3'h7):(3'h6)]);
          reg58 <= $unsigned((((reg53 >>> wire12[(4'h8):(3'h4)]) ?
                  $signed((reg53 != reg55)) : wire49) ?
              (((wire7 ? wire12 : wire50) && (&wire9)) ?
                  $signed((reg55 ? wire9 : wire6)) : ((wire12 ?
                      wire49 : (8'ha2)) < wire7)) : (^(!$signed(reg57)))));
        end
      else
        begin
          reg51 <= ((+((|reg56[(3'h6):(1'h0)]) << (8'hbd))) ?
              ((((reg56 > wire9) * (~|wire13)) || ($unsigned(reg54) ?
                  (^wire8) : $unsigned((8'h9d)))) == (reg51[(4'hb):(4'hb)] ?
                  wire49 : {(reg58 ? reg57 : (8'hae))})) : {(|wire9)});
          if (($signed((~&$unsigned((^~(8'hb7))))) ?
              $unsigned(((8'hb9) ?
                  $signed((wire8 ?
                      wire8 : (8'haf))) : $signed((reg53 | reg53)))) : {{((wire13 << wire49) << $unsigned(wire12))}}))
            begin
              reg52 <= (reg55[(5'h10):(5'h10)] & $unsigned(wire12[(3'h4):(2'h3)]));
              reg53 <= wire13[(4'h9):(4'h8)];
              reg54 <= (wire11[(2'h3):(2'h3)] ?
                  reg52 : ((wire49[(3'h4):(1'h1)] <<< ((wire6 ?
                      (8'hac) : wire47) >> wire10)) << ((~&$unsigned(wire11)) ?
                      wire14 : $unsigned($signed(wire50)))));
              reg55 <= $signed((({(8'hb0)} ^ reg58) > $signed($signed({wire12}))));
              reg56 <= $unsigned(((wire8 ?
                  (~^reg51) : reg52) * (!((8'hac) || $signed(wire14)))));
            end
          else
            begin
              reg52 <= reg58[(4'h9):(1'h0)];
              reg53 <= (^(~&(8'hb1)));
              reg54 <= $signed($unsigned($signed({$unsigned((8'hbd)),
                  wire7[(3'h4):(1'h1)]})));
              reg55 <= $unsigned($signed(wire7[(1'h1):(1'h1)]));
              reg56 <= $signed(((~|wire13) == reg53[(2'h2):(1'h0)]));
            end
          reg57 <= ((reg56[(3'h7):(1'h0)] ?
                  $signed((wire47 ? {wire13} : wire10)) : reg54) ?
              ((|reg52[(3'h6):(3'h5)]) ?
                  (~^((wire13 ~^ reg57) >>> {reg51})) : ($unsigned({wire14,
                          (7'h44)}) ?
                      ({(8'haf)} ^ {reg54}) : $signed(reg52))) : ($signed(wire12[(3'h7):(3'h6)]) * $unsigned(wire12[(3'h4):(3'h4)])));
          if ($unsigned((~&reg54[(4'hb):(2'h3)])))
            begin
              reg58 <= (((reg56 ?
                      (wire11[(2'h3):(1'h1)] ?
                          (wire10 == wire8) : (^~wire13)) : (&(wire8 * reg52))) ?
                  $unsigned($signed(wire10)) : {$unsigned(reg52[(1'h1):(1'h1)])}) * $unsigned($signed($unsigned(wire9))));
              reg59 <= wire10[(3'h4):(1'h0)];
              reg60 <= wire6[(4'h9):(3'h5)];
              reg61 <= (|($unsigned($signed(((8'ha5) ? wire50 : reg55))) ?
                  reg55 : $signed((!reg55))));
            end
          else
            begin
              reg58 <= $signed((reg52[(3'h6):(2'h3)] ?
                  {$unsigned(wire10)} : $unsigned((~|$unsigned(reg52)))));
              reg59 <= (~|$unsigned({((wire14 ? reg57 : wire10) << reg51),
                  {wire11[(2'h2):(2'h2)], (wire8 ? wire13 : wire8)}}));
            end
          reg62 <= ({reg61} >= (^~wire50));
        end
      if ((reg62 ^ reg60[(1'h1):(1'h0)]))
        begin
          reg63 <= (~^$signed(wire49));
          if ((wire9 + $unsigned(reg61[(3'h5):(1'h0)])))
            begin
              reg64 <= ((~|reg62) ?
                  reg55[(4'h9):(3'h6)] : {$signed((!(wire12 ?
                          reg58 : reg56)))});
              reg65 <= reg62;
              reg66 <= (reg61[(2'h2):(1'h0)] >= $signed($signed(($signed(reg57) ?
                  $signed(wire49) : (~|wire12)))));
              reg67 <= (+reg61);
            end
          else
            begin
              reg64 <= ((($unsigned(reg54) != $unsigned((~^reg54))) ?
                  (^$unsigned(((8'hb6) & wire14))) : (wire50[(3'h4):(1'h0)] ?
                      $unsigned((&reg54)) : wire10[(3'h4):(3'h4)])) ^ wire12);
              reg65 <= {($signed(((~&(8'hb8)) <<< $unsigned(wire10))) ?
                      (8'h9f) : (!{(reg60 ? reg60 : reg57)})),
                  (^wire8)};
              reg66 <= $signed((wire49 <= $signed((8'ha3))));
            end
          if (({reg59[(4'he):(4'hd)]} ^~ reg66))
            begin
              reg68 <= (-((reg60 ?
                  (&$unsigned((8'hba))) : $signed($unsigned((8'hb0)))) * $signed($unsigned((8'hb6)))));
              reg69 <= ($unsigned(reg66) - wire13[(4'ha):(1'h1)]);
            end
          else
            begin
              reg68 <= (^~((|$signed($signed(reg67))) <= $signed((-$signed(wire8)))));
              reg69 <= reg67[(3'h6):(2'h3)];
              reg70 <= ({(((!reg69) | {reg59, reg58}) << ($unsigned((8'ha8)) ?
                      ((8'h9c) ? reg64 : wire13) : (^(7'h44)))),
                  reg54[(3'h5):(3'h5)]} <= $signed($unsigned(reg63)));
            end
          reg71 <= reg58[(1'h1):(1'h0)];
          reg72 <= reg60;
        end
      else
        begin
          reg63 <= (reg72[(4'h8):(3'h7)] ?
              wire8 : ($unsigned($unsigned($unsigned(reg68))) < (~reg57[(3'h5):(1'h1)])));
          reg64 <= (wire11[(3'h7):(2'h3)] && $signed($unsigned(({reg68, reg63} ?
              (reg55 ? reg69 : reg72) : ((8'hb7) ^ reg70)))));
        end
      reg73 <= wire47;
      reg74 <= reg73;
    end
endmodule

module module15
#(parameter param46 = (~|(!((((8'hb4) ? (8'ha9) : (8'hb9)) ? (~&(8'hb1)) : (&(8'h9f))) ? ((~(8'hb1)) ? ((8'hb2) <= (8'haf)) : ((8'hb5) < (8'had))) : (8'ha3)))))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h12b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire20;
  input wire [(3'h7):(1'h0)] wire19;
  input wire [(2'h2):(1'h0)] wire18;
  input wire [(4'he):(1'h0)] wire17;
  input wire [(2'h3):(1'h0)] wire16;
  wire signed [(4'hf):(1'h0)] wire45;
  wire signed [(2'h2):(1'h0)] wire44;
  wire [(3'h6):(1'h0)] wire43;
  wire [(4'hc):(1'h0)] wire42;
  wire signed [(3'h7):(1'h0)] wire41;
  wire signed [(5'h12):(1'h0)] wire21;
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire21,
                 reg40,
                 reg39,
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
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire21 = ({($unsigned(wire19[(1'h0):(1'h0)]) >>> ($signed(wire20) == $signed(wire17))),
                      $signed((wire19 < (wire16 ?
                          wire18 : (8'haa))))} <= (8'hb7));
  always
    @(posedge clk) begin
      if (((|$unsigned(wire19)) > $unsigned(($unsigned($unsigned(wire17)) ?
          (^~(wire19 ? (8'hbb) : wire16)) : $unsigned($signed(wire21))))))
        begin
          if ({(&$unsigned(wire18[(1'h0):(1'h0)])), wire18[(2'h2):(1'h0)]})
            begin
              reg22 <= (^$unsigned(wire18[(1'h1):(1'h0)]));
              reg23 <= wire18[(2'h2):(1'h0)];
              reg24 <= $unsigned((~$signed({(&wire18)})));
              reg25 <= $signed(reg23[(4'ha):(1'h0)]);
            end
          else
            begin
              reg22 <= reg23;
              reg23 <= ((|((wire21 | reg24[(3'h7):(2'h2)]) ^~ {$signed(reg24),
                  $signed(reg24)})) << $signed(wire17));
              reg24 <= (^wire21);
            end
          reg26 <= wire19[(1'h0):(1'h0)];
        end
      else
        begin
          reg22 <= (reg25[(3'h7):(1'h0)] ? wire16 : wire21);
          reg23 <= $signed({reg22, (~|reg23[(1'h0):(1'h0)])});
        end
      reg27 <= wire19[(2'h2):(1'h1)];
      if (($unsigned($signed(wire19[(3'h7):(3'h4)])) ?
          reg26[(3'h6):(2'h2)] : $signed(((-(wire18 >= reg24)) ?
              ($unsigned(wire18) | $unsigned(reg22)) : (8'hba)))))
        begin
          reg28 <= (^~$signed((((&wire16) ?
              wire21 : wire18[(2'h2):(1'h0)]) ^ reg23)));
          reg29 <= ((((wire18 ^~ (wire20 ? wire21 : (8'ha1))) ?
                  ((wire17 ?
                      wire20 : reg28) < wire19[(1'h1):(1'h1)]) : $unsigned((^~wire17))) - wire17[(4'h9):(2'h2)]) ?
              (~&{wire21[(5'h12):(2'h2)],
                  $signed((-wire19))}) : ($unsigned((^(reg25 ?
                      (8'hb8) : (8'hbf)))) ?
                  wire19 : reg22[(2'h3):(2'h3)]));
          if ({(wire19[(2'h2):(1'h1)] >= $signed(reg22[(2'h3):(2'h3)]))})
            begin
              reg30 <= (^~$unsigned(({(+reg22), $unsigned(reg25)} ?
                  $unsigned((reg26 - reg29)) : (~^reg29))));
            end
          else
            begin
              reg30 <= $unsigned($signed((^reg26)));
            end
          reg31 <= $unsigned((~^$unsigned(((&wire19) ?
              $unsigned((8'hb1)) : {wire18, wire21}))));
        end
      else
        begin
          reg28 <= reg30;
          if ($unsigned(($signed(((reg28 + reg24) ? wire21 : wire21)) ?
              $signed((reg26[(4'h9):(1'h0)] ?
                  $signed(wire19) : (reg28 * reg22))) : (reg31 ?
                  ($unsigned(wire16) ?
                      (reg25 ? wire20 : reg31) : (wire18 ?
                          wire16 : wire16)) : reg23))))
            begin
              reg29 <= reg22[(1'h1):(1'h1)];
            end
          else
            begin
              reg29 <= reg25;
              reg30 <= reg22;
              reg31 <= ((^wire17) ? wire16 : (8'ha5));
            end
          if (reg25[(4'h8):(4'h8)])
            begin
              reg32 <= (~|$signed({(-{wire16}), reg28[(5'h11):(4'ha)]}));
            end
          else
            begin
              reg32 <= $signed(($signed(reg22) <= wire18));
              reg33 <= reg30[(1'h1):(1'h0)];
              reg34 <= reg32[(4'hd):(4'ha)];
              reg35 <= (($unsigned({wire18, reg33}) ?
                      (reg28[(5'h14):(3'h4)] ?
                          $unsigned((8'ha4)) : $signed((8'ha9))) : $unsigned(((reg27 ?
                              reg24 : reg25) ?
                          wire17 : ((8'ha6) ? reg25 : reg27)))) ?
                  {($signed((reg33 ?
                          (8'hbf) : (8'hbe))) + reg33[(4'hd):(3'h7)])} : $signed((8'hb4)));
            end
          if (reg29)
            begin
              reg36 <= (+$unsigned(reg30));
            end
          else
            begin
              reg36 <= (((+{(reg34 ? wire18 : reg24), reg23}) ?
                      (8'h9e) : (wire18 ?
                          ((-reg31) <<< reg28[(5'h14):(1'h1)]) : ((~&reg34) ?
                              reg26 : wire21))) ?
                  (|($signed($signed(reg29)) ?
                      $signed(reg27) : $signed(reg34[(1'h1):(1'h0)]))) : reg36);
              reg37 <= ({reg30[(4'h8):(3'h4)]} && ((8'hb8) ?
                  $signed($signed((~|reg25))) : (($unsigned(reg27) ?
                      reg30[(4'hc):(1'h1)] : reg27) < (~^(^reg29)))));
            end
          reg38 <= ($signed(((&wire21) < wire21)) ?
              $signed($unsigned(((~(8'ha8)) == (reg29 ?
                  wire20 : (8'hb9))))) : $unsigned(((~^(reg24 ?
                  reg37 : (8'hbd))) & $unsigned($signed((8'ha2))))));
        end
    end
  always
    @(posedge clk) begin
      reg39 <= $unsigned((~|(wire20[(1'h1):(1'h1)] ?
          $unsigned(reg37) : (|{reg23, reg22}))));
      reg40 <= $signed(reg29);
    end
  assign wire41 = $unsigned((&reg26));
  assign wire42 = {$signed(wire41[(2'h3):(2'h2)]),
                      ((((^~wire16) <= (|reg25)) <= $signed((reg25 ?
                              reg31 : reg29))) ?
                          reg22 : $signed({reg22, reg33[(1'h1):(1'h0)]}))};
  assign wire43 = $unsigned((reg31[(2'h2):(1'h0)] ?
                      $unsigned($signed((reg28 ? reg40 : reg36))) : {(wire20 ?
                              reg40 : (~|reg31)),
                          ($signed(reg23) ? $unsigned(wire20) : reg25)}));
  assign wire44 = reg35;
  assign wire45 = (reg36[(4'hb):(2'h3)] ?
                      {(((reg25 ?
                              (8'hb5) : (8'hac)) + (~^wire42)) * $unsigned((+wire18)))} : reg30[(4'ha):(3'h6)]);
endmodule

module module115
#(parameter param172 = {{(-(~|{(8'ha1)})), ((~^((8'hab) ? (8'haa) : (8'hba))) | (~|(~^(8'hbe))))}}, 
parameter param173 = param172)
(y, clk, wire119, wire118, wire117, wire116);
  output wire [(32'h240):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire119;
  input wire [(3'h6):(1'h0)] wire118;
  input wire [(3'h5):(1'h0)] wire117;
  input wire signed [(5'h14):(1'h0)] wire116;
  wire signed [(5'h15):(1'h0)] wire171;
  wire signed [(2'h2):(1'h0)] wire170;
  wire [(2'h2):(1'h0)] wire168;
  wire [(4'hc):(1'h0)] wire167;
  wire [(4'h8):(1'h0)] wire153;
  wire signed [(3'h6):(1'h0)] wire152;
  wire signed [(4'he):(1'h0)] wire151;
  wire signed [(4'h8):(1'h0)] wire150;
  wire signed [(4'hc):(1'h0)] wire138;
  wire [(5'h14):(1'h0)] wire137;
  wire signed [(4'ha):(1'h0)] wire136;
  wire signed [(3'h6):(1'h0)] wire135;
  wire signed [(4'hd):(1'h0)] wire124;
  wire signed [(4'hc):(1'h0)] wire123;
  wire signed [(4'h8):(1'h0)] wire122;
  wire [(3'h4):(1'h0)] wire121;
  wire [(5'h10):(1'h0)] wire120;
  reg signed [(3'h4):(1'h0)] reg169 = (1'h0);
  reg [(4'hc):(1'h0)] reg166 = (1'h0);
  reg [(4'h9):(1'h0)] reg165 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg164 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg163 = (1'h0);
  reg [(4'hd):(1'h0)] reg162 = (1'h0);
  reg [(4'hf):(1'h0)] reg161 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg160 = (1'h0);
  reg [(5'h13):(1'h0)] reg159 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg157 = (1'h0);
  reg [(5'h11):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg148 = (1'h0);
  reg [(4'he):(1'h0)] reg147 = (1'h0);
  reg [(4'he):(1'h0)] reg146 = (1'h0);
  reg [(5'h12):(1'h0)] reg145 = (1'h0);
  reg [(3'h6):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg141 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg140 = (1'h0);
  reg [(4'h8):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg132 = (1'h0);
  reg [(2'h3):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg130 = (1'h0);
  reg [(5'h12):(1'h0)] reg129 = (1'h0);
  reg [(5'h12):(1'h0)] reg128 = (1'h0);
  reg [(4'hc):(1'h0)] reg127 = (1'h0);
  reg [(4'he):(1'h0)] reg126 = (1'h0);
  reg [(5'h11):(1'h0)] reg125 = (1'h0);
  assign y = {wire171,
                 wire170,
                 wire168,
                 wire167,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 reg169,
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
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 (1'h0)};
  assign wire120 = (wire116 ?
                       (8'hbf) : $signed(($unsigned({(7'h40),
                           wire118}) ^~ (+(wire118 ^ wire118)))));
  assign wire121 = {(-(&$unsigned(wire117))),
                       {$signed((|$signed(wire119))),
                           {$unsigned(wire118[(1'h1):(1'h1)]),
                               (^~wire117[(2'h2):(1'h1)])}}};
  assign wire122 = wire121[(1'h0):(1'h0)];
  assign wire123 = ((~^wire120[(4'ha):(4'h8)]) ?
                       $unsigned($signed((wire121 ?
                           (wire116 - wire121) : $signed(wire122)))) : (-$unsigned(($unsigned(wire122) ?
                           (~|wire122) : wire122[(3'h5):(2'h3)]))));
  assign wire124 = wire117;
  always
    @(posedge clk) begin
      reg125 <= wire123[(2'h3):(2'h3)];
      reg126 <= (wire123[(2'h2):(1'h1)] ^~ wire119[(2'h3):(1'h1)]);
      if ((({(~^(~&(8'hb3)))} && wire121) ?
          wire119[(5'h11):(3'h7)] : (wire117 ?
              wire121 : $signed($signed((|(7'h41)))))))
        begin
          reg127 <= ((8'hb7) || $unsigned({((wire123 ? (8'hb1) : wire116) ?
                  (+(8'haf)) : (~^wire117))}));
          reg128 <= $unsigned({reg125});
          if ((wire118[(3'h4):(1'h1)] - reg125))
            begin
              reg129 <= $unsigned(((|(wire124[(2'h2):(1'h0)] ?
                      (^~wire119) : $unsigned(wire117))) ?
                  $signed($unsigned(wire122[(3'h5):(3'h5)])) : wire123[(4'hb):(1'h1)]));
              reg130 <= (~&{$signed(((&(7'h44)) ?
                      (wire122 + wire117) : reg125[(4'hb):(3'h5)])),
                  $signed(wire117)});
              reg131 <= (-$signed(($unsigned(wire122[(3'h7):(2'h3)]) ^ $unsigned(wire123[(4'h9):(3'h7)]))));
              reg132 <= wire117;
              reg133 <= (reg131[(2'h3):(1'h0)] ?
                  (+(~&reg132)) : {{(&{reg128, wire119}), reg132}, (^(8'hbd))});
            end
          else
            begin
              reg129 <= (($signed(reg125) | reg133) ?
                  ((&$signed(reg128)) < $signed(({reg130, wire116} ?
                      (~|wire123) : $signed(wire124)))) : $signed((^~$signed(((8'ha1) ?
                      wire121 : wire118)))));
            end
          if ({({$unsigned((wire119 ? wire117 : wire120)),
                  (+(wire118 ? reg132 : (8'h9e)))} << wire116[(1'h1):(1'h0)]),
              (wire120[(2'h2):(1'h0)] | $signed({((8'ha9) ? reg126 : reg127),
                  $unsigned(wire122)}))})
            begin
              reg134 <= $signed(wire122[(3'h5):(2'h2)]);
            end
          else
            begin
              reg134 <= wire121[(3'h4):(2'h2)];
            end
        end
      else
        begin
          reg127 <= $signed($unsigned(reg134[(4'hc):(2'h3)]));
          reg128 <= $signed((wire117 >> ((wire122[(3'h4):(3'h4)] ?
              (+wire119) : {wire117,
                  reg129}) > $unsigned(wire120[(2'h3):(1'h1)]))));
          if (reg130[(3'h6):(3'h5)])
            begin
              reg129 <= ({reg127,
                  (^$unsigned(reg127))} || ((^~reg133) == (((reg134 >>> reg130) & (reg130 ?
                  reg129 : (7'h43))) & ($signed(reg128) <= reg132[(3'h4):(1'h1)]))));
              reg130 <= wire120;
            end
          else
            begin
              reg129 <= reg132[(2'h3):(2'h2)];
            end
        end
    end
  assign wire135 = $signed($unsigned($signed(reg132)));
  assign wire136 = $signed(wire118[(3'h4):(1'h1)]);
  assign wire137 = wire135[(3'h5):(1'h1)];
  assign wire138 = {(reg134[(3'h6):(3'h5)] << ($unsigned(wire136) ?
                           (reg126[(3'h4):(2'h2)] ?
                               (reg127 ?
                                   wire122 : wire135) : $unsigned(reg125)) : $unsigned(((8'had) != wire116)))),
                       {(&$signed(reg134))}};
  always
    @(posedge clk) begin
      if (((wire122[(3'h7):(3'h6)] <= (8'hbf)) ?
          (wire123[(2'h2):(2'h2)] >= (wire138[(2'h2):(2'h2)] ?
              $signed((wire117 < wire137)) : ($signed(wire121) ?
                  $signed(reg133) : $unsigned((8'hb1))))) : $unsigned({$unsigned((wire119 ?
                  wire117 : reg130)),
              reg132[(4'hb):(2'h3)]})))
        begin
          if (reg127[(4'hc):(3'h6)])
            begin
              reg139 <= (wire118 - (&(8'h9e)));
              reg140 <= ((8'h9c) < ($signed($unsigned($signed(wire119))) ?
                  ({reg139[(1'h1):(1'h0)], wire117} ?
                      wire137[(3'h7):(3'h6)] : (|(!wire116))) : reg126));
              reg141 <= (((8'hb5) << (~&(((8'hb6) ?
                      (8'ha7) : wire119) && reg128))) ?
                  wire137 : ((wire116[(3'h4):(1'h1)] ?
                      (~^{wire121}) : (wire121[(1'h1):(1'h1)] >= {(8'ha1)})) * $signed($signed((wire117 * reg132)))));
            end
          else
            begin
              reg139 <= $signed($signed($signed((~(wire118 ~^ (7'h41))))));
              reg140 <= (({{(8'h9f)}} ?
                  ($signed((wire119 ?
                      reg131 : reg129)) + (wire137[(5'h14):(5'h12)] ?
                      (wire136 ?
                          (8'h9e) : wire135) : wire117[(2'h3):(1'h1)])) : $signed((~|reg128[(2'h3):(2'h2)]))) ^~ $signed(((((8'ha4) ^ reg129) && (reg127 == (7'h40))) ^~ (reg134 ?
                  (~|reg126) : (wire137 - wire138)))));
              reg141 <= {$signed(wire123)};
              reg142 <= $signed(($unsigned($unsigned((reg130 * wire119))) < (|(~(wire119 | reg141)))));
              reg143 <= $signed((|($unsigned(wire136[(1'h0):(1'h0)]) ?
                  (^~(wire135 ? (8'hb8) : reg131)) : {reg125[(2'h3):(2'h2)]})));
            end
          if (wire123)
            begin
              reg144 <= ({(~^wire120), reg143} >= (!wire124));
            end
          else
            begin
              reg144 <= $signed((reg125 && (reg133[(4'h9):(3'h5)] ?
                  $unsigned($signed(reg143)) : ($unsigned(wire120) ?
                      $signed(reg141) : (wire124 ^~ (8'ha6))))));
              reg145 <= $unsigned($signed($unsigned((((8'hbc) ?
                  wire135 : wire117) || wire117[(1'h1):(1'h0)]))));
              reg146 <= wire116;
              reg147 <= wire124[(4'hb):(4'h9)];
            end
        end
      else
        begin
          if (((8'hbd) ? reg126 : wire118[(3'h5):(3'h5)]))
            begin
              reg139 <= (wire116[(4'hb):(3'h7)] ?
                  (&wire137) : {$unsigned((8'hbe))});
              reg140 <= (wire122 ?
                  $unsigned((((~&wire123) ? (reg140 != wire124) : {wire121}) ?
                      (^~(&reg147)) : wire121[(2'h3):(2'h2)])) : ((wire138[(3'h7):(3'h5)] ?
                      ($unsigned(reg144) ^ reg130) : wire120) - ({(~^wire138)} == reg145[(4'he):(1'h0)])));
              reg141 <= (~$unsigned(((8'hb8) < wire123[(1'h0):(1'h0)])));
              reg142 <= $unsigned($unsigned($signed(wire122[(3'h6):(2'h2)])));
              reg143 <= ((8'hbf) ? {(~^wire138)} : reg145[(4'hb):(3'h6)]);
            end
          else
            begin
              reg139 <= reg134[(4'ha):(2'h2)];
              reg140 <= (reg139[(1'h1):(1'h0)] - $signed($signed(reg147)));
              reg141 <= reg129;
              reg142 <= (8'hbc);
              reg143 <= ($unsigned({(~((8'ha7) ?
                      (8'had) : reg130))}) >>> (((|{reg131,
                      (8'h9f)}) != (-((8'ha9) ? reg126 : wire121))) ?
                  (reg146 <= {$signed((8'h9c)),
                      reg141}) : reg133[(4'hd):(4'hd)]));
            end
          if ((^(7'h40)))
            begin
              reg144 <= $signed((((!reg126) != $unsigned(((8'hb5) + wire137))) ?
                  $signed($unsigned((wire120 ?
                      reg133 : (8'hb4)))) : ($signed($signed(reg127)) ?
                      ((reg142 <<< reg130) || $signed(wire122)) : ($unsigned(reg133) ?
                          $unsigned(wire120) : (+wire137)))));
              reg145 <= reg133[(3'h6):(3'h6)];
            end
          else
            begin
              reg144 <= ({(({reg132} ?
                              (wire120 ?
                                  reg128 : reg126) : (reg131 * (8'ha3))) ?
                          (~&reg132[(4'hc):(1'h1)]) : reg130[(2'h2):(1'h0)])} ?
                  (wire119[(4'he):(4'hb)] < reg142[(4'hb):(3'h4)]) : $signed({{(reg145 ?
                              reg147 : (8'hab))},
                      (reg129 >= reg134)}));
              reg145 <= ((^~{($signed((8'h9e)) ?
                      reg133[(3'h4):(1'h0)] : (8'ha9))}) & $signed($unsigned(reg129)));
            end
        end
      reg148 <= {$unsigned(($signed((wire135 ? reg132 : reg143)) ?
              (((8'ha1) & (8'hb8)) < (reg141 ?
                  reg127 : reg128)) : $signed((reg129 <<< reg132))))};
      reg149 <= {((($signed(wire123) & $unsigned((8'ha5))) != wire138) < (~&$signed({reg131})))};
    end
  assign wire150 = $unsigned({reg142, reg145});
  assign wire151 = (+(7'h43));
  assign wire152 = wire136;
  assign wire153 = (~^wire136[(3'h7):(1'h1)]);
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(wire123[(1'h0):(1'h0)])))
        begin
          reg154 <= (($unsigned((~((8'hb9) ? reg149 : wire138))) ?
                  ($signed($unsigned(reg141)) << (wire119 ?
                      (^~reg132) : ((8'hba) ?
                          reg125 : (8'hbe)))) : $signed(wire116[(1'h0):(1'h0)])) ?
              wire116[(3'h7):(1'h1)] : $unsigned((~(^~(~reg126)))));
          if (reg126[(4'hb):(3'h6)])
            begin
              reg155 <= ((reg141[(2'h3):(1'h1)] ?
                  $unsigned((reg142[(4'ha):(3'h6)] ?
                      (-reg128) : wire136[(4'h8):(3'h4)])) : reg140[(4'ha):(3'h6)]) >> reg128[(3'h5):(3'h5)]);
              reg156 <= {$signed(reg140[(3'h4):(2'h2)])};
              reg157 <= reg129;
            end
          else
            begin
              reg155 <= wire122;
              reg156 <= (~&(&($unsigned((wire116 ?
                  reg141 : wire121)) ^~ {(8'hab)})));
            end
          reg158 <= reg157;
          reg159 <= $signed(reg149[(1'h0):(1'h0)]);
        end
      else
        begin
          reg154 <= (~($signed(reg143) ?
              $signed($unsigned(((8'hb2) < reg154))) : $signed($unsigned(reg158))));
          if ((~reg126))
            begin
              reg155 <= (^$signed((($signed(reg128) ?
                  reg147[(4'h9):(3'h5)] : reg142[(4'hc):(1'h1)]) <<< (reg154 || reg127[(4'h8):(3'h6)]))));
              reg156 <= (reg127[(1'h1):(1'h0)] ?
                  reg146[(4'hc):(3'h7)] : $signed(wire118[(3'h5):(1'h0)]));
              reg157 <= ($signed(reg158[(2'h2):(1'h1)]) >> (~|(((reg125 ?
                      (8'had) : wire123) ?
                  (reg155 >>> (8'ha7)) : (|reg125)) ^~ {((8'hb0) && reg129),
                  reg154})));
              reg158 <= $unsigned(reg146[(3'h7):(2'h3)]);
              reg159 <= reg133[(4'hb):(3'h7)];
            end
          else
            begin
              reg155 <= (^~(&(reg156[(4'hf):(3'h7)] ^~ reg148)));
              reg156 <= {(~&(((8'hbe) >> $unsigned(reg131)) ?
                      (^~(reg145 < wire124)) : ((reg130 ? reg145 : (8'hb3)) ?
                          $signed(wire136) : $unsigned(wire150))))};
              reg157 <= (wire135[(1'h1):(1'h0)] ?
                  ((~&$signed({(8'hb6), wire135})) & $signed(((wire135 ?
                      wire153 : wire118) ^~ wire117[(3'h5):(1'h0)]))) : $unsigned(reg139));
            end
          reg160 <= (^~((((~(8'ha4)) ?
                  (~^reg139) : {reg134, wire118}) != $unsigned(wire117)) ?
              (~|(reg128 ? reg130 : (reg144 ? (7'h42) : wire150))) : (8'hac)));
        end
      reg161 <= wire120[(4'h8):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg162 <= reg128;
      reg163 <= ((({reg144[(1'h0):(1'h0)], {reg139, (8'hb8)}} ?
              reg142 : reg158[(1'h0):(1'h0)]) ?
          ((((8'hae) > reg161) - {reg160}) < ((reg132 >> reg139) ?
              {wire124,
                  reg128} : $signed(wire122))) : $signed(($signed(reg132) * reg131[(1'h1):(1'h1)]))) > reg139);
      reg164 <= ((reg159[(5'h12):(4'h9)] != reg163) << ((~^(^~{reg161})) ?
          {{$unsigned(wire121)}} : $unsigned({reg132})));
      if (({($signed((reg156 < reg157)) >= ({reg133} & wire116)),
              $unsigned((reg142[(4'h9):(3'h6)] || (~|reg126)))} ?
          ($unsigned(((wire136 < reg125) >>> ((8'hbd) + reg148))) || (($unsigned(wire150) ?
              (reg162 << reg161) : wire121[(1'h1):(1'h1)]) - (8'h9c))) : reg156[(3'h6):(1'h0)]))
        begin
          reg165 <= (^(~&{(&$unsigned(reg154)), reg144}));
          reg166 <= $unsigned($unsigned((8'ha9)));
        end
      else
        begin
          reg165 <= $unsigned(wire124);
          reg166 <= wire136;
        end
    end
  assign wire167 = {$signed($unsigned(((wire138 & wire123) < wire135))),
                       {$unsigned(wire138[(2'h3):(1'h1)])}};
  assign wire168 = reg160[(3'h6):(2'h3)];
  always
    @(posedge clk) begin
      reg169 <= ((~(!$signed(reg128))) >= $unsigned(((&(reg146 ?
          (8'hac) : reg131)) == (wire152[(3'h5):(2'h2)] || reg158[(1'h0):(1'h0)]))));
    end
  assign wire170 = reg128[(5'h12):(1'h0)];
  assign wire171 = (reg128 ^~ ({$unsigned(wire168[(2'h2):(2'h2)]),
                       (&$unsigned(wire123))} | {$signed($unsigned(reg163))}));
endmodule

module module321  (y, clk, wire325, wire324, wire323, wire322);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire325;
  input wire [(4'h9):(1'h0)] wire324;
  input wire [(4'h9):(1'h0)] wire323;
  input wire signed [(4'hb):(1'h0)] wire322;
  wire signed [(4'hb):(1'h0)] wire334;
  wire [(4'hf):(1'h0)] wire333;
  wire signed [(2'h3):(1'h0)] wire332;
  wire [(5'h11):(1'h0)] wire331;
  wire [(4'hc):(1'h0)] wire330;
  wire signed [(2'h2):(1'h0)] wire329;
  wire [(5'h15):(1'h0)] wire328;
  wire [(2'h3):(1'h0)] wire327;
  wire [(5'h12):(1'h0)] wire326;
  reg signed [(4'hc):(1'h0)] reg335 = (1'h0);
  assign y = {wire334,
                 wire333,
                 wire332,
                 wire331,
                 wire330,
                 wire329,
                 wire328,
                 wire327,
                 wire326,
                 reg335,
                 (1'h0)};
  assign wire326 = ((($unsigned({wire324, (8'ha6)}) && ((wire325 ?
                           wire322 : wire325) ?
                       {wire325} : {wire325})) <<< wire322[(4'h9):(4'h8)]) > $unsigned(wire325));
  assign wire327 = $unsigned(wire325[(4'h9):(3'h5)]);
  assign wire328 = wire325[(4'h9):(4'h8)];
  assign wire329 = {$signed(({(!wire328),
                           (wire327 ? (8'hbc) : wire326)} > wire328)),
                       {wire325}};
  assign wire330 = $signed(((wire329 == wire325[(3'h4):(3'h4)]) ?
                       wire327 : wire324[(3'h4):(1'h0)]));
  assign wire331 = (!wire322[(1'h0):(1'h0)]);
  assign wire332 = $signed({wire326,
                       ((-$signed(wire327)) < wire325[(2'h2):(1'h0)])});
  assign wire333 = $signed({{wire327[(1'h1):(1'h1)], wire327[(1'h1):(1'h0)]},
                       {{wire330}}});
  assign wire334 = ((8'hbb) ? wire331 : (~&wire333));
  always
    @(posedge clk) begin
      reg335 <= wire327[(2'h3):(2'h2)];
    end
endmodule

module module238  (y, clk, wire242, wire241, wire240, wire239);
  output wire [(32'h2ce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire242;
  input wire signed [(3'h6):(1'h0)] wire241;
  input wire signed [(5'h10):(1'h0)] wire240;
  input wire [(3'h4):(1'h0)] wire239;
  wire signed [(4'h8):(1'h0)] wire299;
  wire signed [(4'hc):(1'h0)] wire298;
  wire signed [(3'h6):(1'h0)] wire297;
  wire [(5'h14):(1'h0)] wire296;
  wire [(4'hc):(1'h0)] wire295;
  wire [(4'h8):(1'h0)] wire294;
  wire [(5'h13):(1'h0)] wire293;
  wire signed [(3'h7):(1'h0)] wire292;
  wire signed [(5'h13):(1'h0)] wire291;
  wire signed [(4'h9):(1'h0)] wire286;
  wire [(2'h2):(1'h0)] wire285;
  wire [(5'h15):(1'h0)] wire284;
  wire signed [(5'h11):(1'h0)] wire283;
  wire signed [(3'h7):(1'h0)] wire282;
  wire signed [(5'h12):(1'h0)] wire281;
  wire [(2'h3):(1'h0)] wire271;
  wire [(5'h11):(1'h0)] wire246;
  wire signed [(4'hb):(1'h0)] wire245;
  reg [(4'hc):(1'h0)] reg290 = (1'h0);
  reg [(3'h4):(1'h0)] reg289 = (1'h0);
  reg [(4'hc):(1'h0)] reg288 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg287 = (1'h0);
  reg [(4'hc):(1'h0)] reg280 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg279 = (1'h0);
  reg [(3'h7):(1'h0)] reg278 = (1'h0);
  reg [(5'h13):(1'h0)] reg277 = (1'h0);
  reg [(4'hb):(1'h0)] reg276 = (1'h0);
  reg signed [(4'he):(1'h0)] reg275 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg274 = (1'h0);
  reg [(4'he):(1'h0)] reg273 = (1'h0);
  reg [(3'h6):(1'h0)] reg272 = (1'h0);
  reg [(3'h6):(1'h0)] reg270 = (1'h0);
  reg [(4'hc):(1'h0)] reg269 = (1'h0);
  reg [(4'h8):(1'h0)] reg268 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg267 = (1'h0);
  reg [(4'hb):(1'h0)] reg266 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg265 = (1'h0);
  reg [(5'h12):(1'h0)] reg264 = (1'h0);
  reg [(4'hd):(1'h0)] reg263 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg262 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg261 = (1'h0);
  reg [(5'h14):(1'h0)] reg260 = (1'h0);
  reg [(5'h13):(1'h0)] reg259 = (1'h0);
  reg [(5'h13):(1'h0)] reg258 = (1'h0);
  reg [(4'hd):(1'h0)] reg257 = (1'h0);
  reg [(5'h12):(1'h0)] reg256 = (1'h0);
  reg [(4'h8):(1'h0)] reg255 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg254 = (1'h0);
  reg [(4'h8):(1'h0)] reg253 = (1'h0);
  reg [(4'ha):(1'h0)] reg252 = (1'h0);
  reg [(4'he):(1'h0)] reg251 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg250 = (1'h0);
  reg [(4'hf):(1'h0)] reg249 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg248 = (1'h0);
  reg [(2'h3):(1'h0)] reg247 = (1'h0);
  reg [(4'he):(1'h0)] reg244 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg243 = (1'h0);
  assign y = {wire299,
                 wire298,
                 wire297,
                 wire296,
                 wire295,
                 wire294,
                 wire293,
                 wire292,
                 wire291,
                 wire286,
                 wire285,
                 wire284,
                 wire283,
                 wire282,
                 wire281,
                 wire271,
                 wire246,
                 wire245,
                 reg290,
                 reg289,
                 reg288,
                 reg287,
                 reg280,
                 reg279,
                 reg278,
                 reg277,
                 reg276,
                 reg275,
                 reg274,
                 reg273,
                 reg272,
                 reg270,
                 reg269,
                 reg268,
                 reg267,
                 reg266,
                 reg265,
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
                 reg253,
                 reg252,
                 reg251,
                 reg250,
                 reg249,
                 reg248,
                 reg247,
                 reg244,
                 reg243,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg243 <= {$signed(wire242)};
      reg244 <= wire239[(3'h4):(1'h1)];
    end
  assign wire245 = wire241;
  assign wire246 = $signed(($unsigned(wire240[(2'h2):(1'h1)]) ?
                       {$unsigned((wire239 ? wire241 : wire245)),
                           wire242[(2'h3):(1'h0)]} : (({(8'hb9),
                           (8'ha4)} == (reg243 ^~ reg243)) >>> reg244)));
  always
    @(posedge clk) begin
      if ((~&(((wire245[(3'h5):(3'h5)] <<< (~(8'hb3))) | (reg244[(4'h8):(3'h6)] ?
              (~|(8'hac)) : (reg243 || (8'had)))) ?
          $unsigned(wire246[(1'h1):(1'h1)]) : wire241[(1'h1):(1'h0)])))
        begin
          reg247 <= wire240[(3'h6):(1'h1)];
          reg248 <= $unsigned((reg243[(1'h0):(1'h0)] ? {wire241} : (7'h40)));
          if ((~&$signed(($unsigned((~^reg247)) + (^wire241[(3'h5):(2'h2)])))))
            begin
              reg249 <= (~&$unsigned(wire246));
              reg250 <= $unsigned(((reg243 || (~$signed(reg249))) && wire245[(4'ha):(1'h0)]));
              reg251 <= wire240[(4'h8):(2'h3)];
              reg252 <= (wire241[(2'h2):(1'h0)] ?
                  ((-($unsigned(reg250) == {wire242})) ?
                      $signed($unsigned((|reg250))) : $unsigned({(reg251 ?
                              reg243 : (8'h9f)),
                          (wire241 & reg249)})) : $unsigned(reg244[(1'h1):(1'h1)]));
              reg253 <= {(~|wire239[(1'h1):(1'h0)]),
                  (reg250[(1'h0):(1'h0)] ?
                      (reg248[(4'he):(3'h7)] ?
                          (~|(reg250 ?
                              reg250 : reg248)) : ($unsigned((8'h9d)) <<< reg244)) : reg247[(1'h0):(1'h0)])};
            end
          else
            begin
              reg249 <= (|(-wire240[(3'h6):(1'h1)]));
              reg250 <= $unsigned(wire245[(4'h9):(1'h1)]);
              reg251 <= $unsigned(reg248);
              reg252 <= $unsigned((^((~&(~^wire240)) ?
                  reg253 : (|$unsigned(reg243)))));
            end
          reg254 <= ((8'had) ?
              ((reg244[(4'ha):(1'h0)] ?
                      (~((8'ha0) ?
                          reg251 : wire246)) : reg248[(5'h14):(5'h10)]) ?
                  (8'hbb) : (|$signed((reg248 << wire239)))) : ((reg247 ?
                  ({reg247} + (~|(7'h43))) : $signed((8'hb3))) <= reg251[(4'h9):(3'h6)]));
        end
      else
        begin
          reg247 <= (-((wire239 ?
              (|$signed(wire242)) : $signed(wire246)) << ($signed({reg250,
              reg252}) > $signed($unsigned(reg243)))));
          if (wire246[(1'h1):(1'h1)])
            begin
              reg248 <= ((|$signed(wire241)) > $signed({((reg250 >> wire242) ?
                      $signed(reg251) : $signed(reg243)),
                  ((reg243 ^ reg251) ? wire245 : $signed(wire245))}));
              reg249 <= $signed(reg252);
              reg250 <= ($unsigned(((!wire246) >>> (-(&reg244)))) || reg254[(3'h5):(2'h3)]);
              reg251 <= ($signed((reg253[(3'h6):(1'h0)] ?
                  ($signed(reg248) ?
                      (+reg252) : $unsigned(wire239)) : (wire246[(3'h7):(3'h7)] & wire245[(4'h9):(1'h1)]))) && $signed(wire245));
              reg252 <= $signed($unsigned(reg254[(1'h1):(1'h1)]));
            end
          else
            begin
              reg248 <= ($signed(($unsigned((8'hb9)) ?
                  $signed(wire242) : wire241)) & (wire241[(1'h1):(1'h1)] ?
                  $signed($unsigned((wire246 ? (8'hb1) : reg250))) : {reg253,
                      $signed(reg254[(2'h2):(1'h0)])}));
            end
          reg253 <= ((~({{wire245}, reg252} ?
                  $unsigned(reg249[(4'h8):(1'h1)]) : $unsigned(reg248))) ?
              (^(|(~&(wire246 * reg253)))) : ((^~$signed((|wire245))) + $unsigned($signed(reg254))));
          reg254 <= ((((wire242 ?
                      ((8'hb3) ? wire239 : (8'h9e)) : $unsigned(wire240)) ?
                  {$unsigned((8'ha5))} : $unsigned((wire246 || reg251))) - $unsigned({reg250})) ?
              ($signed((&(reg254 < reg247))) > reg251[(3'h4):(2'h3)]) : reg249);
          reg255 <= (8'ha2);
        end
      reg256 <= (reg252 ?
          (^(reg253 ?
              $signed($signed(reg255)) : $signed((reg255 == wire239)))) : (^~reg248[(1'h1):(1'h0)]));
      reg257 <= $signed((8'hb9));
      if (((^$signed(reg252[(2'h2):(1'h1)])) || (reg249[(3'h4):(1'h0)] ?
          $signed(wire242[(2'h2):(1'h0)]) : (~&$unsigned({reg244, wire242})))))
        begin
          reg258 <= $signed((~(((wire246 ? (8'haa) : reg257) ?
              $unsigned(wire245) : reg253[(2'h2):(1'h1)]) != $signed(((8'hba) ?
              (8'had) : wire240)))));
          if ((&$signed((wire239[(2'h3):(1'h1)] <<< reg253[(1'h1):(1'h0)]))))
            begin
              reg259 <= {$signed($unsigned({reg255})),
                  $signed($unsigned(reg258))};
              reg260 <= reg254[(4'h8):(2'h2)];
              reg261 <= reg244[(3'h7):(3'h5)];
              reg262 <= (wire239[(3'h4):(1'h1)] ?
                  reg256 : $signed($unsigned({(~&reg251)})));
              reg263 <= reg250;
            end
          else
            begin
              reg259 <= (~&reg256[(1'h0):(1'h0)]);
              reg260 <= reg259;
              reg261 <= reg256[(4'h8):(3'h5)];
              reg262 <= ($signed({$unsigned({(8'ha0)})}) ?
                  wire239[(2'h2):(1'h0)] : reg258[(4'h8):(3'h7)]);
            end
          reg264 <= ($unsigned($unsigned(($signed(wire246) & reg243[(4'h8):(3'h6)]))) ?
              wire241 : ($signed($signed((reg257 ?
                  reg254 : reg255))) - $unsigned((reg254[(3'h6):(3'h5)] ?
                  (reg253 <= reg243) : ((8'ha9) ? reg248 : (8'ha8))))));
          if (wire239[(2'h2):(1'h0)])
            begin
              reg265 <= reg264[(4'ha):(2'h3)];
              reg266 <= (($unsigned((^~reg244)) > $signed((|reg261[(1'h0):(1'h0)]))) >>> $unsigned(((^~(wire241 < reg243)) ?
                  (&$unsigned(reg247)) : $unsigned($unsigned(wire242)))));
              reg267 <= $unsigned(wire239);
              reg268 <= reg266[(1'h1):(1'h1)];
            end
          else
            begin
              reg265 <= wire239;
              reg266 <= (^~{$signed(reg261[(1'h0):(1'h0)]), $unsigned(reg251)});
              reg267 <= reg248;
              reg268 <= (8'hbb);
              reg269 <= (~|((|$signed($unsigned(reg257))) ?
                  ($signed((reg260 | reg257)) ?
                      ({reg257} >= (8'hb0)) : reg253[(3'h6):(1'h0)]) : ((wire245 == $signed(reg255)) ?
                      (!reg253) : $unsigned($unsigned(wire239)))));
            end
          reg270 <= reg250;
        end
      else
        begin
          if ($unsigned((&{({wire240, wire245} ?
                  reg253[(2'h3):(1'h0)] : reg254[(4'hd):(4'hd)])})))
            begin
              reg258 <= (reg251[(2'h3):(1'h0)] ?
                  $unsigned($unsigned($unsigned((reg249 << reg260)))) : ($signed(reg249) * (8'hb1)));
              reg259 <= ((reg256 ?
                  ($signed((~^reg260)) ?
                      {(reg248 ? wire246 : reg264)} : (|(wire246 ?
                          reg248 : reg263))) : $unsigned($unsigned($signed(reg253)))) + $signed($unsigned(reg259[(3'h5):(1'h1)])));
              reg260 <= (reg269[(1'h1):(1'h1)] ?
                  reg251[(1'h1):(1'h0)] : wire241);
              reg261 <= $signed($unsigned($unsigned(wire242)));
            end
          else
            begin
              reg258 <= (({((reg264 ? reg262 : (7'h40)) && (reg267 ?
                          reg261 : wire240)),
                      reg248[(4'h8):(3'h6)]} >> reg259) ?
                  ($unsigned($unsigned((!wire241))) ?
                      $signed({$signed(reg258),
                          (reg270 ? (8'h9c) : reg263)}) : {($signed(reg250) ?
                              (reg267 ^~ reg247) : (8'hb3)),
                          ((reg261 ^~ reg256) ?
                              (-(8'ha0)) : reg263[(4'h8):(3'h6)])}) : ($unsigned(wire245) - reg262[(1'h1):(1'h1)]));
              reg259 <= reg267;
              reg260 <= reg264;
              reg261 <= $unsigned(($unsigned($signed(wire239[(3'h4):(1'h0)])) | $unsigned($unsigned((-reg257)))));
              reg262 <= $signed(reg256);
            end
          reg263 <= $unsigned($signed(reg259));
          reg264 <= $unsigned($unsigned((reg266 * $signed((reg252 | reg265)))));
        end
    end
  assign wire271 = $unsigned(((^$unsigned($unsigned(reg249))) ^~ (!reg266)));
  always
    @(posedge clk) begin
      reg272 <= (reg258 * (8'ha1));
      reg273 <= reg260[(3'h6):(3'h4)];
      if ({reg263,
          (~|($signed(wire245[(1'h0):(1'h0)]) ?
              $unsigned((reg267 ^~ reg269)) : $signed((!wire240))))})
        begin
          reg274 <= $unsigned(((((reg250 & reg243) ?
                      (8'h9d) : reg253[(4'h8):(3'h4)]) ?
                  ((reg252 >>> reg253) >> $unsigned(wire241)) : ({reg270} ?
                      $unsigned(reg256) : (reg273 < reg256))) ?
              ($signed((reg253 ? reg253 : wire241)) ?
                  $unsigned(reg248) : reg249[(4'ha):(1'h1)]) : reg247));
          reg275 <= (wire239[(2'h3):(1'h1)] ?
              {((-{(7'h42)}) ^ reg261)} : ((reg244[(4'hc):(2'h3)] ?
                      $signed({reg269, (8'ha7)}) : (+wire242)) ?
                  reg247 : $unsigned(((reg252 ? (8'h9e) : reg274) ?
                      reg257 : {wire239, (7'h42)}))));
          reg276 <= ($signed((^(reg273[(4'h8):(1'h1)] * $signed((8'hb6))))) ?
              reg263[(4'hb):(4'h8)] : (^$unsigned($signed(reg268))));
        end
      else
        begin
          reg274 <= reg275;
          reg275 <= (~^(~^(~&(((8'ha8) > wire241) ?
              reg248 : (reg256 ? reg254 : reg269)))));
          if ($unsigned($unsigned((|(((8'hb7) ? reg276 : reg261) == ((8'had) ?
              reg262 : (8'h9f)))))))
            begin
              reg276 <= ($signed({reg264[(3'h5):(3'h5)]}) ?
                  (+reg263) : ((reg248[(3'h6):(2'h3)] || (~&reg269)) < (~{wire241})));
              reg277 <= reg266;
              reg278 <= $unsigned(reg247[(2'h3):(2'h2)]);
              reg279 <= {($unsigned(((reg252 ?
                      reg267 : reg263) | $unsigned(reg265))) << reg257[(3'h6):(3'h5)]),
                  reg267[(1'h1):(1'h0)]};
            end
          else
            begin
              reg276 <= $unsigned((reg248[(4'ha):(3'h4)] <= $signed($unsigned($unsigned(reg263)))));
              reg277 <= reg276;
              reg278 <= reg243;
            end
        end
      reg280 <= (~|((^((reg261 ?
          reg248 : reg249) & wire271[(2'h3):(1'h0)])) ^~ $unsigned($signed(reg243))));
    end
  assign wire281 = (^$unsigned(reg274));
  assign wire282 = (reg263 << {((|(-reg261)) ?
                           $signed($signed((8'hab))) : $unsigned($signed(reg267)))});
  assign wire283 = $signed(reg269[(4'h9):(3'h7)]);
  assign wire284 = $signed(reg278[(3'h7):(3'h4)]);
  assign wire285 = reg253;
  assign wire286 = ($unsigned({$unsigned($signed(reg268)),
                           reg274[(4'hf):(1'h0)]}) ?
                       (($unsigned(reg268) >>> ((wire271 ? wire245 : reg253) ?
                               wire281[(2'h2):(2'h2)] : (reg278 ~^ reg253))) ?
                           (8'hbe) : wire242) : (|(($unsigned((7'h40)) - reg261) >= reg244[(4'hc):(2'h2)])));
  always
    @(posedge clk) begin
      if ($signed((8'hb0)))
        begin
          reg287 <= (8'hb6);
        end
      else
        begin
          reg287 <= {((reg265 ?
                  reg269[(1'h1):(1'h0)] : ((reg252 + wire284) * (^~reg243))) != (reg273 - (wire285 <= {reg266}))),
              (($unsigned($signed(reg256)) & reg274[(1'h0):(1'h0)]) >= wire239[(1'h1):(1'h0)])};
          reg288 <= ($signed($signed(reg255[(3'h7):(2'h2)])) || $unsigned(wire246));
          reg289 <= (+(+$unsigned(((reg243 ?
              reg272 : reg258) >> $unsigned(wire283)))));
        end
      reg290 <= (!($unsigned(reg250[(2'h2):(1'h0)]) ?
          $signed($unsigned(wire246)) : $unsigned(reg255[(3'h5):(1'h0)])));
    end
  assign wire291 = ((wire246 ?
                       (~|(^~(~&(8'ha6)))) : (^$signed((^reg259)))) * $signed(($unsigned(reg289) ?
                       (+wire284) : ((wire282 ? wire284 : (7'h42)) ?
                           (8'hb3) : {wire283, wire246}))));
  assign wire292 = wire291[(4'hc):(1'h0)];
  assign wire293 = reg287;
  assign wire294 = wire291;
  assign wire295 = reg269[(4'hb):(4'ha)];
  assign wire296 = $signed($signed($signed($unsigned((^~wire293)))));
  assign wire297 = wire295[(2'h2):(1'h0)];
  assign wire298 = ($unsigned({{wire282[(2'h2):(1'h1)],
                               reg267[(4'hb):(4'ha)]}}) ?
                       reg248 : wire293[(2'h2):(2'h2)]);
  assign wire299 = $unsigned((((!(~|wire285)) == $unsigned((reg277 << wire298))) <<< (reg270 >> $signed(wire271))));
endmodule
