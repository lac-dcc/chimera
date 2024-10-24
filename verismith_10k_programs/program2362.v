module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h28b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire297;
  wire signed [(4'h9):(1'h0)] wire276;
  wire [(4'hf):(1'h0)] wire268;
  wire [(4'h9):(1'h0)] wire250;
  wire signed [(4'h8):(1'h0)] wire249;
  wire [(5'h15):(1'h0)] wire247;
  wire [(5'h12):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire245;
  wire signed [(3'h5):(1'h0)] wire270;
  wire [(5'h14):(1'h0)] wire271;
  wire signed [(5'h14):(1'h0)] wire272;
  wire [(5'h13):(1'h0)] wire273;
  wire signed [(2'h2):(1'h0)] wire274;
  wire [(5'h13):(1'h0)] wire278;
  wire signed [(3'h6):(1'h0)] wire294;
  wire signed [(4'hb):(1'h0)] wire295;
  reg signed [(2'h3):(1'h0)] reg293 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg292 = (1'h0);
  reg [(5'h12):(1'h0)] reg291 = (1'h0);
  reg [(5'h12):(1'h0)] reg290 = (1'h0);
  reg [(5'h14):(1'h0)] reg289 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg288 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg287 = (1'h0);
  reg [(4'h8):(1'h0)] reg286 = (1'h0);
  reg [(5'h12):(1'h0)] reg285 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg284 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg283 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg282 = (1'h0);
  reg [(3'h7):(1'h0)] reg281 = (1'h0);
  reg [(4'hf):(1'h0)] reg280 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg279 = (1'h0);
  reg [(5'h10):(1'h0)] reg267 = (1'h0);
  reg [(4'h9):(1'h0)] reg266 = (1'h0);
  reg [(5'h12):(1'h0)] reg265 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg264 = (1'h0);
  reg [(4'hb):(1'h0)] reg263 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg262 = (1'h0);
  reg signed [(4'he):(1'h0)] reg261 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg260 = (1'h0);
  reg [(5'h14):(1'h0)] reg259 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg258 = (1'h0);
  reg [(3'h7):(1'h0)] reg257 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg256 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg255 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg254 = (1'h0);
  reg [(2'h2):(1'h0)] reg253 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg252 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg251 = (1'h0);
  assign y = {wire297,
                 wire276,
                 wire268,
                 wire250,
                 wire249,
                 wire247,
                 wire5,
                 wire6,
                 wire245,
                 wire270,
                 wire271,
                 wire272,
                 wire273,
                 wire274,
                 wire278,
                 wire294,
                 wire295,
                 reg293,
                 reg292,
                 reg291,
                 reg290,
                 reg289,
                 reg288,
                 reg287,
                 reg286,
                 reg285,
                 reg284,
                 reg283,
                 reg282,
                 reg281,
                 reg280,
                 reg279,
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
                 (1'h0)};
  assign wire5 = wire3;
  assign wire6 = (($signed(((-wire1) ? (wire1 ? wire1 : (8'hae)) : (~^wire2))) ?
                     {{{wire2, wire3}},
                         $signed($signed(wire5))} : ((wire5 == wire4) ?
                         {(~&wire4)} : wire4[(1'h1):(1'h1)])) ^~ (wire5 ^ (wire1 ?
                     ((wire5 & wire5) ?
                         {wire4,
                             wire2} : $unsigned(wire2)) : (wire0[(4'ha):(2'h3)] | $unsigned(wire1)))));
  module7 #() modinst246 (.wire10(wire3), .wire8(wire4), .clk(clk), .wire11(wire6), .y(wire245), .wire9(wire1), .wire12(wire5));
  module16 #() modinst248 (.wire20(wire4), .wire17(wire2), .wire19(wire3), .clk(clk), .y(wire247), .wire18(wire0));
  assign wire249 = wire4[(3'h6):(3'h4)];
  assign wire250 = $signed($signed(wire5));
  always
    @(posedge clk) begin
      reg251 <= ($signed($signed($signed((+wire1)))) < (wire2 ?
          $unsigned((-wire3[(3'h6):(3'h6)])) : (+(wire3[(3'h7):(3'h6)] ?
              wire250 : {wire5}))));
      if ($signed((((-wire4) ?
              $signed({(8'hae), wire1}) : ((~^(8'hbf)) ?
                  reg251 : wire245[(3'h5):(1'h0)])) ?
          $signed(($unsigned(wire250) && wire247[(4'h9):(3'h5)])) : (~&{(!(8'had))}))))
        begin
          reg252 <= $unsigned($signed({{(^wire4), $unsigned(wire3)},
              (wire249[(2'h3):(1'h0)] <<< wire245[(3'h6):(1'h0)])}));
        end
      else
        begin
          if ($signed((~&reg251)))
            begin
              reg252 <= ((wire247[(1'h0):(1'h0)] == $unsigned((+$unsigned((8'hba))))) ?
                  (reg251[(3'h6):(3'h4)] ?
                      (((wire4 ? wire1 : (8'h9f)) <= (wire1 ^ wire3)) ?
                          ({(8'hab), wire2} >= (wire4 ?
                              reg252 : wire6)) : {(wire5 ? wire2 : wire4),
                              wire4}) : (!{wire250[(4'h8):(2'h3)],
                          {wire250}})) : (8'h9d));
              reg253 <= $unsigned(wire245[(4'hb):(2'h3)]);
              reg254 <= ($signed({(+wire247[(3'h4):(3'h4)]), reg252}) ?
                  $unsigned($signed((-((8'hbd) ?
                      reg253 : wire249)))) : ({(8'hbf),
                          ((reg253 ? (8'hac) : wire247) >= $signed(wire6))} ?
                      $signed($signed((reg251 ? wire0 : (8'hae)))) : wire250));
            end
          else
            begin
              reg252 <= wire245;
              reg253 <= wire1[(5'h13):(1'h0)];
              reg254 <= ((wire6 <<< (($signed(wire245) || ((8'hb3) != wire245)) ?
                  wire5 : $unsigned({reg253, (8'hb7)}))) || ((({(8'haa)} ?
                          (~reg253) : wire1[(3'h7):(1'h0)]) ?
                      wire6[(3'h7):(2'h3)] : ($unsigned((8'hb2)) ?
                          (reg251 >> wire6) : wire6)) ?
                  $signed((((8'hae) ? wire245 : wire6) ?
                      {wire2,
                          (8'h9f)} : $unsigned(wire2))) : (reg254 ^~ wire245[(2'h3):(1'h0)])));
              reg255 <= $signed(wire0[(2'h3):(1'h1)]);
              reg256 <= $signed($signed((wire0 >>> $signed($signed(reg254)))));
            end
          if ({$unsigned((+wire6[(5'h15):(4'h9)]))})
            begin
              reg257 <= {$unsigned((|((wire2 ? reg256 : wire245) ?
                      $unsigned(wire6) : {reg251}))),
                  (((~^wire1[(3'h5):(1'h0)]) ?
                      wire2 : {$unsigned((8'hb1)),
                          (~&reg256)}) ^~ (((~&reg253) ?
                          (reg255 || wire5) : (~|reg256)) ?
                      $signed(wire4) : {(wire6 ? wire249 : wire0)}))};
              reg258 <= $signed({reg251[(4'hc):(3'h7)], wire247});
              reg259 <= $signed((~|($unsigned(wire247[(4'he):(4'hb)]) >= reg258[(1'h0):(1'h0)])));
              reg260 <= (+(wire1[(4'h9):(2'h3)] < ({(wire2 & (8'h9c))} < reg251)));
            end
          else
            begin
              reg257 <= (-(($unsigned($signed((8'hba))) & reg254[(2'h3):(1'h0)]) ?
                  (reg257[(2'h3):(2'h2)] ?
                      (~$signed(reg252)) : (~wire5[(4'he):(4'hc)])) : reg256[(2'h3):(2'h3)]));
              reg258 <= $signed(reg252[(1'h1):(1'h0)]);
              reg259 <= (wire245 <<< $signed((~|wire4)));
            end
          if (wire3[(2'h2):(1'h1)])
            begin
              reg261 <= ($signed(({(7'h43), $unsigned((8'hb1))} ?
                  $unsigned(reg252) : (~&(reg259 >> reg251)))) <<< $unsigned(({wire247} ?
                  reg255 : reg253[(2'h2):(2'h2)])));
              reg262 <= ((~&wire3) ?
                  ({$unsigned($unsigned(reg260)),
                      $unsigned((reg256 | reg255))} >= (-(reg259 + $signed(reg251)))) : $unsigned(((wire247 ?
                          wire245 : wire247) ?
                      ((~|reg259) ~^ reg259) : reg261[(3'h6):(2'h3)])));
              reg263 <= ((wire6 ?
                  reg255 : (((~reg258) ? wire6 : reg252[(3'h4):(2'h2)]) ?
                      $signed((&(8'hb2))) : wire6)) || {reg261});
              reg264 <= $signed(((^{((8'ha1) ? wire2 : reg254)}) ?
                  wire247[(1'h1):(1'h0)] : wire2[(3'h5):(2'h2)]));
            end
          else
            begin
              reg261 <= $signed((^~(!wire1)));
              reg262 <= reg259[(2'h2):(1'h0)];
            end
        end
      if ($unsigned(wire0))
        begin
          reg265 <= reg255[(2'h2):(1'h0)];
          reg266 <= ((|(reg263 ^ (reg252 <= (8'hbd)))) ?
              wire2[(3'h4):(2'h3)] : $signed((8'haa)));
        end
      else
        begin
          reg265 <= (-(^~(8'hb0)));
          reg266 <= (wire4 - ($signed(((reg259 ?
                  (8'hb3) : (8'hba)) == (^reg260))) ?
              (|(+(reg264 ? reg260 : reg254))) : reg260));
          reg267 <= reg261[(4'hd):(4'hc)];
        end
    end
  module198 #() modinst269 (.wire199(wire247), .wire201(reg255), .wire200(wire245), .wire202(wire4), .y(wire268), .clk(clk));
  assign wire270 = ((-reg267[(1'h0):(1'h0)]) & ((((reg258 ?
                           reg260 : wire5) > (reg259 ^~ reg263)) == reg262) ?
                       reg252[(3'h7):(2'h2)] : ((8'hbf) ?
                           (~|(wire5 ? wire5 : (8'haf))) : $unsigned((reg266 ?
                               reg262 : reg256)))));
  assign wire271 = $signed(wire4);
  assign wire272 = {$signed(wire250[(4'h9):(4'h8)]),
                       $signed({$signed($unsigned(reg258)), wire2})};
  assign wire273 = $unsigned(($unsigned(wire3[(1'h1):(1'h1)]) ?
                       ($signed($unsigned((8'ha8))) ~^ $signed(((8'hb0) ?
                           wire0 : (8'h9c)))) : $signed((^$unsigned((8'hac))))));
  module7 #() modinst275 (.y(wire274), .wire12(wire3), .wire9(wire271), .wire11(wire247), .wire8(reg264), .clk(clk), .wire10(reg267));
  module198 #() modinst277 (wire276, clk, wire245, reg252, reg255, reg257);
  assign wire278 = wire6[(4'he):(3'h5)];
  always
    @(posedge clk) begin
      if ((8'hbd))
        begin
          reg279 <= ({wire250[(3'h5):(2'h2)]} << wire2);
        end
      else
        begin
          reg279 <= ($signed(($unsigned(((7'h42) ? wire270 : wire249)) ?
                  ((~&wire273) | ((8'ha8) ~^ wire274)) : reg253[(2'h2):(2'h2)])) ?
              reg257[(2'h2):(1'h1)] : (wire5[(3'h4):(3'h4)] ?
                  $unsigned(wire250) : (reg258 ?
                      ((wire4 << reg261) ?
                          (reg252 ?
                              wire250 : reg279) : $unsigned(wire276)) : {(^reg257),
                          $unsigned(reg260)})));
          reg280 <= ((!((((8'hac) <<< (8'h9c)) ?
              reg263 : $signed(wire247)) ^~ {(reg260 ?
                  (8'hae) : wire1)})) < $signed($unsigned(wire245[(1'h1):(1'h1)])));
          reg281 <= {(8'hb6), $unsigned($unsigned({$unsigned(wire272)}))};
          reg282 <= $unsigned($unsigned((~&reg256[(1'h0):(1'h0)])));
          reg283 <= wire250;
        end
      if (reg252[(2'h2):(1'h0)])
        begin
          if (($signed({(~^(^~(8'hae))),
                  ($signed(wire2) ^~ $unsigned(reg280))}) ?
              (reg253[(2'h2):(1'h1)] - (&($unsigned(wire250) ?
                  (wire273 ? reg279 : wire249) : (reg282 ?
                      reg279 : wire270)))) : ($signed(wire0) && reg283[(3'h4):(1'h0)])))
            begin
              reg284 <= (wire274[(2'h2):(2'h2)] ?
                  ($signed($unsigned($signed(wire274))) ?
                      wire4 : $unsigned(wire272)) : reg279[(1'h0):(1'h0)]);
              reg285 <= wire3;
            end
          else
            begin
              reg284 <= reg258[(1'h1):(1'h0)];
              reg285 <= $unsigned((~|reg256[(2'h3):(2'h3)]));
            end
          if (($unsigned($unsigned((8'hb5))) + reg254[(3'h5):(3'h5)]))
            begin
              reg286 <= $unsigned((~&(~($unsigned(wire247) && (wire272 ^ reg262)))));
              reg287 <= $signed(((^~reg260[(5'h12):(5'h11)]) ^ ($signed(reg284) < ({(8'hb1),
                      reg253} ?
                  (8'h9c) : (wire5 ? reg281 : reg261)))));
              reg288 <= wire245[(3'h7):(3'h4)];
            end
          else
            begin
              reg286 <= $unsigned(reg255[(3'h4):(1'h0)]);
              reg287 <= (+{reg255[(3'h5):(3'h5)]});
            end
        end
      else
        begin
          reg284 <= (~|(reg279[(4'hb):(4'ha)] | ({$signed(reg288)} ?
              $unsigned($unsigned((8'hb0))) : ((-reg260) != wire6))));
          reg285 <= (reg257[(3'h7):(1'h1)] ?
              reg281[(3'h6):(1'h1)] : $signed($signed(reg261)));
          reg286 <= (~^reg286);
          reg287 <= reg263[(3'h4):(2'h2)];
          reg288 <= (^~(({wire273} ?
                  reg251[(3'h5):(1'h0)] : {wire247[(4'h9):(3'h6)]}) ?
              $unsigned($unsigned({wire278, wire271})) : reg259));
        end
      reg289 <= reg254[(1'h1):(1'h1)];
      reg290 <= ((($unsigned($signed(reg255)) > $signed(reg265[(2'h3):(1'h1)])) ?
          reg251 : wire278) & $unsigned((wire249[(3'h4):(1'h1)] ?
          $unsigned(reg265) : ((~^(8'hbe)) + (reg288 + reg283)))));
      if ((wire5[(3'h7):(3'h4)] ?
          reg263 : ($unsigned((wire245 && (reg251 >>> reg259))) ?
              $signed(((reg288 ? wire276 : wire4) ?
                  (reg289 ? wire3 : (8'ha1)) : (~&wire5))) : wire0)))
        begin
          reg291 <= $signed($unsigned((~&(~|(reg252 ? reg251 : wire268)))));
        end
      else
        begin
          reg291 <= (((({reg257} < (wire1 ? wire274 : wire274)) ?
                      (&$unsigned(reg287)) : ({(8'ha4),
                          (8'ha0)} < (~|(8'hb1)))) ?
                  $signed(($unsigned(reg261) ?
                      wire4 : $unsigned(wire2))) : $unsigned(reg285)) ?
              (|$unsigned(($signed(reg283) ?
                  (reg265 ?
                      (8'hb0) : (8'hb5)) : (reg262 >> reg289)))) : reg284);
          reg292 <= {{($signed(reg254[(2'h3):(1'h1)]) ?
                      ((8'hac) << $signed(reg290)) : $signed((reg265 ?
                          reg280 : wire278))),
                  (wire0[(4'hd):(4'hc)] >= {(~(8'haa))})}};
          reg293 <= (($unsigned($unsigned(reg266[(3'h5):(1'h0)])) <<< reg257) ?
              ($signed($signed((reg258 * (8'h9f)))) ?
                  {$unsigned(((8'hbc) ? reg261 : wire276)),
                      (!$unsigned(wire268))} : {($signed(wire276) ?
                          $signed(wire0) : $unsigned(reg253)),
                      reg291[(4'hd):(3'h4)]}) : (reg256[(3'h6):(3'h6)] ?
                  {$unsigned((&reg287)),
                      $signed((reg254 <= reg262))} : $signed(((wire272 ?
                          wire0 : wire247) ?
                      $unsigned(reg262) : (8'h9e)))));
        end
    end
  assign wire294 = $unsigned($signed(($signed(reg259[(3'h5):(1'h1)]) ^~ (reg255 ?
                       $unsigned((8'hb9)) : (^~reg264)))));
  module100 #() modinst296 (.wire101(reg292), .wire105(reg254), .wire102(reg262), .wire103(reg279), .clk(clk), .wire104(wire245), .y(wire295));
  assign wire297 = {wire271[(4'he):(3'h7)]};
endmodule

module module7
#(parameter param244 = (!(^((~|((7'h43) > (8'hb5))) <= ({(8'hac)} ? ((8'hb5) * (8'hbf)) : ((7'h41) ? (8'ha0) : (8'h9c)))))))
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h37d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire12;
  input wire [(5'h15):(1'h0)] wire11;
  input wire [(3'h7):(1'h0)] wire10;
  input wire signed [(5'h14):(1'h0)] wire9;
  input wire [(4'hc):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire243;
  wire signed [(5'h12):(1'h0)] wire241;
  wire [(4'ha):(1'h0)] wire216;
  wire [(5'h13):(1'h0)] wire213;
  wire [(4'hd):(1'h0)] wire197;
  wire [(4'hb):(1'h0)] wire174;
  wire signed [(5'h15):(1'h0)] wire173;
  wire signed [(3'h5):(1'h0)] wire86;
  wire signed [(5'h13):(1'h0)] wire70;
  wire signed [(2'h2):(1'h0)] wire51;
  wire [(4'hf):(1'h0)] wire50;
  wire signed [(4'hb):(1'h0)] wire48;
  wire [(4'hb):(1'h0)] wire15;
  wire signed [(5'h13):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire88;
  wire signed [(4'hc):(1'h0)] wire171;
  reg signed [(3'h5):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg68 = (1'h0);
  reg [(4'he):(1'h0)] reg67 = (1'h0);
  reg [(5'h10):(1'h0)] reg66 = (1'h0);
  reg [(4'h8):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg64 = (1'h0);
  reg [(3'h6):(1'h0)] reg63 = (1'h0);
  reg [(3'h6):(1'h0)] reg62 = (1'h0);
  reg [(4'he):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg [(4'hc):(1'h0)] reg59 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(5'h14):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  reg [(4'hf):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(4'hf):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg90 = (1'h0);
  reg [(3'h7):(1'h0)] reg91 = (1'h0);
  reg [(5'h14):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg93 = (1'h0);
  reg [(4'hf):(1'h0)] reg94 = (1'h0);
  reg [(4'h9):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg97 = (1'h0);
  reg [(4'hc):(1'h0)] reg98 = (1'h0);
  reg [(5'h11):(1'h0)] reg99 = (1'h0);
  reg [(4'ha):(1'h0)] reg175 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg176 = (1'h0);
  reg [(5'h13):(1'h0)] reg177 = (1'h0);
  reg [(5'h15):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg179 = (1'h0);
  reg [(4'ha):(1'h0)] reg180 = (1'h0);
  reg [(5'h14):(1'h0)] reg181 = (1'h0);
  reg [(3'h7):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg183 = (1'h0);
  reg [(3'h4):(1'h0)] reg184 = (1'h0);
  reg [(5'h10):(1'h0)] reg185 = (1'h0);
  reg [(5'h15):(1'h0)] reg186 = (1'h0);
  reg [(2'h2):(1'h0)] reg187 = (1'h0);
  reg signed [(4'he):(1'h0)] reg188 = (1'h0);
  reg [(3'h7):(1'h0)] reg189 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg190 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg191 = (1'h0);
  reg [(2'h2):(1'h0)] reg192 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg193 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg194 = (1'h0);
  reg [(5'h10):(1'h0)] reg195 = (1'h0);
  reg [(5'h10):(1'h0)] reg196 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg215 = (1'h0);
  assign y = {wire243,
                 wire241,
                 wire216,
                 wire213,
                 wire197,
                 wire174,
                 wire173,
                 wire86,
                 wire70,
                 wire51,
                 wire50,
                 wire48,
                 wire15,
                 wire14,
                 wire13,
                 wire88,
                 wire171,
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
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 reg99,
                 reg175,
                 reg176,
                 reg177,
                 reg178,
                 reg179,
                 reg180,
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
                 reg196,
                 reg215,
                 (1'h0)};
  assign wire13 = ((~|wire8) ?
                      wire9[(4'hd):(1'h0)] : (wire8[(3'h5):(1'h0)] ?
                          ($signed((wire9 ?
                              wire12 : wire12)) - (^~$unsigned(wire9))) : $unsigned($unsigned((^wire9)))));
  assign wire14 = (($unsigned($signed({wire10,
                          wire9})) == $unsigned($unsigned($unsigned((8'haf))))) ?
                      {{$signed(wire12[(3'h6):(3'h6)])}} : wire9);
  assign wire15 = wire8;
  module16 #() modinst49 (wire48, clk, wire14, wire12, wire13, wire9);
  assign wire50 = ((wire13 >> $signed($signed({wire15, wire8}))) ?
                      wire13 : (wire15[(3'h4):(1'h0)] ?
                          ((^wire13[(1'h0):(1'h0)]) <= wire14[(4'hc):(3'h7)]) : $unsigned({$unsigned(wire48)})));
  assign wire51 = ((wire9[(4'h8):(3'h6)] & (~(^~(^wire8)))) >= wire48[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      if ($unsigned(wire48[(4'hb):(3'h6)]))
        begin
          reg52 <= ((7'h41) != wire50);
        end
      else
        begin
          reg52 <= wire14;
          if (wire11[(5'h15):(2'h3)])
            begin
              reg53 <= (8'haf);
              reg54 <= wire50[(4'hc):(2'h3)];
              reg55 <= ($unsigned(wire8[(1'h1):(1'h1)]) && ($unsigned($unsigned((wire9 + (8'ha3)))) ^~ (((+reg53) ?
                      $signed(wire50) : ((8'h9d) | reg54)) ?
                  reg54[(2'h2):(2'h2)] : $unsigned($signed(wire12)))));
              reg56 <= ($signed(({$unsigned(reg55)} ?
                  (~|$signed(wire50)) : reg52)) - (wire13 & ($signed($unsigned(wire9)) ?
                  $signed($unsigned((8'ha5))) : ((~|reg54) ?
                      $signed((8'hae)) : (wire11 ? wire10 : (8'ha0))))));
              reg57 <= ((^~$signed(wire15)) | wire50);
            end
          else
            begin
              reg53 <= (~&reg53);
              reg54 <= ((wire51[(2'h2):(2'h2)] && $signed(($signed(wire14) ?
                  ((8'hb4) | reg52) : (~wire9)))) >> {(&(^~wire14[(5'h11):(4'he)]))});
              reg55 <= reg56;
              reg56 <= reg53[(4'he):(1'h0)];
              reg57 <= $signed(wire9[(3'h6):(1'h0)]);
            end
          reg58 <= $unsigned((^((~^(reg55 && reg52)) ?
              $unsigned($signed(wire10)) : wire9[(2'h2):(1'h0)])));
          if ((~&(reg53 ^ ($signed((~reg56)) != (wire14 * (reg55 ?
              reg56 : reg57))))))
            begin
              reg59 <= {(reg57 >= (wire51[(1'h1):(1'h0)] ?
                      $signed(wire48) : (^$unsigned(reg58)))),
                  ((wire51 > $signed((8'hbf))) != wire51)};
            end
          else
            begin
              reg59 <= wire8[(1'h1):(1'h0)];
              reg60 <= {reg56[(4'hb):(3'h7)], wire11[(5'h14):(4'h8)]};
            end
          if ((+(wire12 << reg60)))
            begin
              reg61 <= $signed(wire15[(3'h5):(3'h4)]);
              reg62 <= ({{(~&(wire8 * reg60))}} == $unsigned($signed(($unsigned(wire9) == reg55[(2'h2):(1'h1)]))));
              reg63 <= $signed(wire8[(2'h2):(2'h2)]);
              reg64 <= (reg53 >> (~^reg55));
              reg65 <= (wire11 >= reg62);
            end
          else
            begin
              reg61 <= (~&(!$unsigned(((reg54 ? reg59 : wire8) ?
                  (reg60 ? reg61 : (7'h44)) : (reg65 ? (8'hb6) : (7'h42))))));
              reg62 <= $signed(reg64[(3'h6):(3'h5)]);
              reg63 <= (({(^~{wire51, reg55}),
                  ($signed(reg65) >>> (+wire48))} > (!wire11)) + $unsigned(reg63));
              reg64 <= (8'ha3);
              reg65 <= (reg52 ?
                  (~($signed(reg63) && wire15)) : ((((reg62 ^ reg52) ?
                          $unsigned(wire11) : reg52) ?
                      reg62[(3'h6):(3'h4)] : wire9) << wire12));
            end
        end
    end
  always
    @(posedge clk) begin
      reg66 <= ($signed(reg55[(1'h1):(1'h0)]) >= $signed((~|(|$signed(reg61)))));
      reg67 <= $unsigned($signed((reg56[(5'h13):(3'h7)] ?
          reg60 : $signed(reg62[(2'h3):(1'h0)]))));
      reg68 <= reg54;
      reg69 <= (~|(~&($signed($signed((7'h43))) << reg64[(2'h2):(1'h1)])));
    end
  assign wire70 = (~|((wire12[(1'h1):(1'h1)] == wire48) ?
                      {wire15} : ($unsigned(reg64[(3'h7):(3'h7)]) >= reg68[(3'h6):(3'h6)])));
  module71 #() modinst87 (wire86, clk, wire70, reg65, reg62, reg56);
  assign wire88 = $unsigned((&$signed(($signed((8'ha8)) ?
                      reg53[(3'h6):(2'h3)] : $unsigned((8'ha1))))));
  always
    @(posedge clk) begin
      reg89 <= wire51[(1'h0):(1'h0)];
      reg90 <= (~^$signed($unsigned((~|$signed(wire15)))));
      if ($signed($unsigned(wire14)))
        begin
          reg91 <= reg52;
          reg92 <= $unsigned((~$signed(($unsigned(reg53) ?
              reg57 : $signed(wire8)))));
          if (($unsigned($unsigned(reg59)) <= (-$unsigned((!(reg91 >> reg65))))))
            begin
              reg93 <= ($unsigned(wire8[(3'h5):(3'h5)]) + (reg55[(2'h3):(2'h3)] && $signed(wire48)));
              reg94 <= (8'ha1);
              reg95 <= wire14;
              reg96 <= (~reg66[(3'h6):(3'h5)]);
              reg97 <= wire14;
            end
          else
            begin
              reg93 <= reg53[(4'hd):(2'h2)];
              reg94 <= wire8[(1'h0):(1'h0)];
              reg95 <= ((wire11[(4'he):(1'h0)] ?
                  (wire48 > reg56) : ($unsigned((-(8'hb0))) ?
                      wire86[(1'h1):(1'h0)] : (&$signed(reg94)))) ^~ (((reg61 >= $signed(reg90)) ?
                      $unsigned($signed((8'hbc))) : wire14) ?
                  {((reg56 | (7'h43)) ?
                          $unsigned(reg65) : reg89[(1'h1):(1'h1)])} : reg54[(3'h7):(2'h3)]));
              reg96 <= $unsigned((($unsigned(wire11[(2'h3):(2'h2)]) ?
                      $unsigned({reg62}) : $signed((~reg91))) ?
                  (~&(~&(wire51 + reg56))) : (reg62[(1'h0):(1'h0)] ?
                      reg52 : ((wire14 ? reg93 : reg56) ?
                          (wire48 == wire48) : reg66))));
            end
          if ((8'hb8))
            begin
              reg98 <= wire86[(3'h5):(3'h5)];
              reg99 <= reg54;
            end
          else
            begin
              reg98 <= ((^{((8'ha8) ? reg89[(3'h4):(2'h3)] : reg96),
                      $unsigned({reg66})}) ?
                  ($signed($unsigned(wire8[(4'h8):(3'h7)])) >> reg54) : ({$unsigned((|wire14)),
                          (reg92[(4'hd):(1'h0)] ?
                              {wire14} : wire14[(4'he):(4'ha)])} ?
                      $signed(wire51[(1'h0):(1'h0)]) : reg66));
            end
        end
      else
        begin
          if ({reg97[(3'h4):(3'h4)],
              {((+(reg91 ? reg99 : (8'ha5))) ?
                      reg59[(2'h3):(2'h3)] : ((&wire9) ?
                          (reg63 & (8'hab)) : $unsigned(wire13))),
                  wire14}})
            begin
              reg91 <= $unsigned(reg64[(4'h8):(3'h4)]);
              reg92 <= reg98[(2'h3):(2'h3)];
              reg93 <= reg64[(3'h5):(3'h4)];
              reg94 <= ((((8'haa) ? $signed($unsigned(wire10)) : (8'hb3)) ?
                  {reg68} : $unsigned(((reg98 * reg68) <<< $unsigned(wire88)))) << (wire51[(2'h2):(1'h1)] | wire9[(5'h13):(3'h5)]));
            end
          else
            begin
              reg91 <= ($signed(((~^wire12[(4'he):(2'h3)]) >> reg63[(1'h1):(1'h1)])) ~^ (|(!(+reg90))));
              reg92 <= (((~^({(8'hb4)} ?
                          ((8'ha4) && wire51) : (reg98 ^~ wire51))) ?
                      (reg56 ?
                          ($signed(reg55) >> reg97[(3'h7):(3'h4)]) : {wire86[(3'h4):(1'h0)],
                              (~reg57)}) : reg54[(2'h2):(2'h2)]) ?
                  $signed((8'hab)) : (~&reg89[(1'h1):(1'h1)]));
              reg93 <= $signed($unsigned(((^$signed(wire11)) ?
                  {(reg65 ? reg95 : (8'hb1)),
                      $unsigned(wire70)} : {$signed(reg61),
                      wire70[(4'hc):(1'h1)]})));
            end
          reg95 <= reg90;
          reg96 <= (-({(reg66[(3'h5):(2'h3)] ?
                      reg68[(5'h12):(1'h1)] : {reg55, wire8})} ?
              $signed((8'ha7)) : $signed($signed((reg94 << reg93)))));
        end
    end
  module100 #() modinst172 (.clk(clk), .y(wire171), .wire101(reg54), .wire105(reg66), .wire102(wire13), .wire104(reg61), .wire103(reg89));
  assign wire173 = (reg69 ?
                       ((!{{reg63, reg64}}) == ($signed(((8'hb4) ?
                               (7'h41) : wire15)) ?
                           ((~|wire12) * wire86) : wire88[(5'h12):(5'h10)])) : {reg56});
  assign wire174 = ((reg60[(4'hf):(4'he)] > {($signed((7'h40)) ?
                           (wire11 ?
                               reg99 : reg56) : $unsigned(wire50))}) - reg64);
  always
    @(posedge clk) begin
      reg175 <= reg92;
      if ({$signed($signed(($unsigned(reg57) ^ reg92[(4'hf):(3'h6)])))})
        begin
          reg176 <= (wire14 >= $signed(reg68));
          reg177 <= reg67;
          reg178 <= $signed(({((reg93 ^ wire70) ^ (-wire15)),
                  wire48[(4'hb):(3'h4)]} ?
              wire11[(4'ha):(2'h3)] : (($signed(reg63) != (reg65 ?
                      wire48 : (8'hb7))) ?
                  {(wire14 >> wire51), {reg52, (8'hb8)}} : reg94)));
          if (wire11[(5'h10):(3'h7)])
            begin
              reg179 <= $unsigned($unsigned(($unsigned($unsigned(reg93)) >>> reg56[(1'h1):(1'h1)])));
              reg180 <= reg96[(1'h1):(1'h1)];
            end
          else
            begin
              reg179 <= (!{(+wire50[(4'h8):(4'h8)])});
              reg180 <= $signed((|$signed(((reg57 <= wire86) ?
                  {reg66} : $signed(wire86)))));
              reg181 <= ($signed(reg177) ^ reg56[(3'h7):(1'h0)]);
              reg182 <= (-$unsigned((($unsigned((7'h41)) - (reg54 ^ (7'h42))) && (reg58 ^~ (^reg98)))));
            end
        end
      else
        begin
          reg176 <= $unsigned(((|(wire8[(3'h6):(2'h3)] ?
              reg64 : ((8'hbd) <<< reg182))) < reg182));
          reg177 <= $signed($unsigned((reg95 ~^ $signed(((8'ha9) ?
              reg60 : reg63)))));
          reg178 <= $unsigned($unsigned(wire13[(4'h8):(3'h7)]));
        end
      reg183 <= $signed((wire174 && (reg55 - ($unsigned(reg56) ?
          $signed((8'hae)) : (~|wire51)))));
      reg184 <= (reg179 <= (reg182 ?
          (8'h9c) : ((~&$unsigned(wire86)) >= reg61[(3'h5):(2'h3)])));
      if (reg178)
        begin
          if ((~$unsigned(reg56[(4'h9):(4'h9)])))
            begin
              reg185 <= $unsigned({$unsigned($signed((reg66 ?
                      (8'hb9) : reg68))),
                  $unsigned($signed((~|reg184)))});
              reg186 <= (~^((wire11[(5'h12):(4'hd)] ?
                      (8'ha6) : wire8[(2'h3):(2'h3)]) ?
                  {reg69[(1'h0):(1'h0)]} : reg182[(3'h5):(3'h4)]));
            end
          else
            begin
              reg185 <= reg98;
              reg186 <= ($signed(reg175[(3'h7):(3'h7)]) >= (8'hab));
            end
          reg187 <= $unsigned(((!$signed((reg182 >>> (8'hb5)))) * $signed($signed((^reg97)))));
          if ({reg62})
            begin
              reg188 <= $signed(($unsigned($unsigned((reg68 ?
                  reg66 : reg184))) != (~|$signed($unsigned(wire86)))));
            end
          else
            begin
              reg188 <= ({($unsigned(reg54[(1'h0):(1'h0)]) ?
                      $signed(wire88[(1'h1):(1'h0)]) : reg186)} && wire50);
              reg189 <= $unsigned($signed($signed($unsigned({reg186,
                  reg177}))));
              reg190 <= (((reg177 ?
                      ((8'hb7) ?
                          ((8'hb8) ?
                              reg67 : reg175) : reg92) : (&$signed((7'h40)))) | ($signed($unsigned(reg68)) ?
                      reg96[(1'h1):(1'h1)] : wire173)) ?
                  (+wire13[(1'h0):(1'h0)]) : wire48[(1'h0):(1'h0)]);
            end
          reg191 <= (wire48[(1'h0):(1'h0)] && {({$signed(wire48),
                  reg64[(2'h3):(2'h3)]} < $unsigned(reg98[(3'h4):(1'h1)])),
              reg62[(3'h4):(1'h0)]});
        end
      else
        begin
          reg185 <= reg189[(1'h0):(1'h0)];
          reg186 <= reg52;
        end
    end
  always
    @(posedge clk) begin
      reg192 <= reg63;
      reg193 <= ((^$unsigned({(reg59 < reg181)})) ?
          reg90[(3'h7):(1'h0)] : $signed($signed($unsigned((reg62 ~^ wire171)))));
      if (($unsigned($unsigned($unsigned(((8'ha6) ? wire13 : wire86)))) ?
          reg91 : $unsigned((-$signed(((8'haa) | reg175))))))
        begin
          reg194 <= (~(-(&$signed(reg63))));
          reg195 <= (-($signed((-reg94)) ? reg55 : $unsigned(reg187)));
          reg196 <= ($unsigned(wire173) * $signed((^(-{reg59, reg189}))));
        end
      else
        begin
          reg194 <= wire15;
          reg195 <= $signed($unsigned($unsigned($unsigned(reg89[(4'he):(3'h5)]))));
        end
    end
  assign wire197 = $signed((reg62 ?
                       reg93 : (~&(reg59 - reg96[(3'h5):(3'h5)]))));
  module198 #() modinst214 (.wire200(reg57), .wire199(reg179), .wire201(reg185), .clk(clk), .y(wire213), .wire202(reg186));
  always
    @(posedge clk) begin
      reg215 <= ({{((reg186 < reg188) && (reg188 >= reg60)), ((8'ha0) | reg58)},
              ({wire174[(4'ha):(3'h7)], (wire8 ^~ reg183)} ?
                  ($unsigned((8'hbc)) + reg194[(2'h2):(1'h0)]) : $unsigned($signed(wire14)))} ?
          (!$unsigned((~&$signed((8'h9d))))) : wire14);
    end
  assign wire216 = wire10[(2'h3):(2'h2)];
  module217 #() modinst242 (.wire218(reg177), .wire221(reg180), .wire219(reg185), .clk(clk), .wire222(reg179), .wire220(reg52), .y(wire241));
  assign wire243 = wire213[(1'h1):(1'h1)];
endmodule

module module217
#(parameter param239 = ({(8'ha1), {(((8'haa) - (8'hbc)) ? ((8'hb6) || (8'ha9)) : (^(8'ha9))), (((7'h40) ? (8'hb7) : (8'hba)) >>> ((8'hb5) ? (8'hb2) : (8'haf)))}} ~^ {((~^((8'hac) ? (8'hb3) : (8'ha5))) ? (((8'ha3) && (8'ha4)) >= ((8'hb8) ? (8'hae) : (7'h44))) : (!(^(8'hb6)))), ((|(+(8'hb5))) ? ({(8'hbe), (8'hbc)} ? ((8'hab) ~^ (8'hbd)) : (~&(8'hac))) : (~|(^~(8'hba))))}), 
parameter param240 = ((({{param239, param239}, {param239}} ? param239 : {(param239 ? param239 : param239)}) > (((~^param239) ? param239 : ((7'h40) ? param239 : param239)) ? ((8'h9d) ? (param239 >>> param239) : (~param239)) : param239)) ? (+{param239}) : param239))
(y, clk, wire222, wire221, wire220, wire219, wire218);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire222;
  input wire signed [(4'ha):(1'h0)] wire221;
  input wire signed [(4'hd):(1'h0)] wire220;
  input wire signed [(5'h10):(1'h0)] wire219;
  input wire signed [(4'h9):(1'h0)] wire218;
  wire [(4'hb):(1'h0)] wire238;
  wire signed [(4'he):(1'h0)] wire237;
  wire signed [(3'h5):(1'h0)] wire236;
  wire signed [(4'hd):(1'h0)] wire235;
  wire signed [(5'h10):(1'h0)] wire234;
  wire signed [(3'h7):(1'h0)] wire233;
  wire [(4'hb):(1'h0)] wire232;
  wire signed [(3'h5):(1'h0)] wire231;
  wire [(4'h9):(1'h0)] wire230;
  wire [(5'h11):(1'h0)] wire229;
  wire signed [(3'h7):(1'h0)] wire228;
  wire [(4'hd):(1'h0)] wire224;
  wire [(5'h10):(1'h0)] wire223;
  reg [(4'hc):(1'h0)] reg227 = (1'h0);
  reg [(3'h7):(1'h0)] reg226 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg225 = (1'h0);
  assign y = {wire238,
                 wire237,
                 wire236,
                 wire235,
                 wire234,
                 wire233,
                 wire232,
                 wire231,
                 wire230,
                 wire229,
                 wire228,
                 wire224,
                 wire223,
                 reg227,
                 reg226,
                 reg225,
                 (1'h0)};
  assign wire223 = wire221[(3'h5):(1'h0)];
  assign wire224 = (8'haf);
  always
    @(posedge clk) begin
      reg225 <= ($unsigned($signed($unsigned((wire223 ?
          wire222 : wire222)))) && ((wire218[(3'h7):(3'h7)] + wire222) <<< $unsigned(wire224[(3'h7):(3'h5)])));
      reg226 <= (!(8'hac));
      reg227 <= $unsigned(wire220);
    end
  assign wire228 = reg225;
  assign wire229 = ((8'ha1) ?
                       $signed({(|reg227[(1'h1):(1'h0)])}) : ((~|({wire222,
                               wire219} ?
                           $signed(wire219) : {wire222})) | wire218));
  assign wire230 = $unsigned((~^($signed(((8'ha9) <= wire224)) ^~ wire224)));
  assign wire231 = wire218[(3'h4):(3'h4)];
  assign wire232 = (({{(wire228 ? (7'h44) : reg225)}, wire230[(2'h2):(2'h2)]} ?
                           (wire222 ?
                               ($unsigned(wire224) ?
                                   {(8'hb0),
                                       wire224} : wire231[(3'h5):(2'h3)]) : wire218[(4'h9):(2'h3)]) : ($signed(((8'h9d) * wire229)) ?
                               (wire228 ?
                                   $unsigned(wire219) : wire220[(1'h0):(1'h0)]) : $unsigned($signed(wire230)))) ?
                       wire231 : wire231);
  assign wire233 = wire220[(4'h9):(3'h5)];
  assign wire234 = ((~(|{$signed(wire232)})) ?
                       {((^$signed(wire221)) ?
                               $signed($signed(reg226)) : {(wire219 << wire219),
                                   wire231[(3'h4):(1'h0)]}),
                           (wire221 >> reg226[(1'h0):(1'h0)])} : (wire229[(3'h7):(3'h7)] | wire224[(3'h4):(1'h1)]));
  assign wire235 = ({$signed(wire218[(3'h5):(1'h0)]), (^(8'hb6))} ?
                       ({((^wire220) ? $unsigned(reg226) : (^wire232)),
                               wire220[(4'hd):(3'h6)]} ?
                           wire223[(4'hf):(4'hd)] : ((8'ha8) ?
                               (wire223[(2'h2):(2'h2)] ?
                                   wire233[(2'h2):(1'h1)] : $signed((8'hbd))) : $unsigned((~(8'hae))))) : (^wire234));
  assign wire236 = {wire222[(2'h3):(2'h2)]};
  assign wire237 = (^($unsigned($unsigned((reg227 ? wire229 : wire233))) ?
                       ($unsigned(reg227[(1'h1):(1'h1)]) ?
                           (+wire218) : wire228) : (~&wire230)));
  assign wire238 = $unsigned(wire220[(1'h0):(1'h0)]);
endmodule

module module198
#(parameter param211 = {(8'hae)}, 
parameter param212 = (^param211))
(y, clk, wire202, wire201, wire200, wire199);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire202;
  input wire signed [(2'h3):(1'h0)] wire201;
  input wire signed [(3'h5):(1'h0)] wire200;
  input wire signed [(2'h3):(1'h0)] wire199;
  wire signed [(3'h4):(1'h0)] wire210;
  wire [(2'h2):(1'h0)] wire209;
  wire [(5'h10):(1'h0)] wire208;
  wire signed [(4'hf):(1'h0)] wire207;
  reg signed [(4'he):(1'h0)] reg206 = (1'h0);
  reg [(2'h2):(1'h0)] reg205 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg204 = (1'h0);
  reg [(5'h14):(1'h0)] reg203 = (1'h0);
  assign y = {wire210,
                 wire209,
                 wire208,
                 wire207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg203 <= ((^wire200) * (!wire202));
      reg204 <= ({(8'ha6),
          ({wire199[(1'h0):(1'h0)],
              ((8'hb8) ? wire199 : (8'ha5))} * $unsigned(((8'ha4) ?
              wire201 : wire199)))} >>> reg203[(4'hc):(3'h4)]);
      reg205 <= $signed((~wire199[(2'h3):(2'h2)]));
      reg206 <= wire202;
    end
  assign wire207 = ((8'hb8) ?
                       $unsigned({(8'haf),
                           $unsigned((reg206 || wire201))}) : reg203[(4'ha):(3'h7)]);
  assign wire208 = (8'hb9);
  assign wire209 = $unsigned($unsigned(wire200));
  assign wire210 = $signed({$signed($signed(reg205[(2'h2):(1'h1)]))});
endmodule

module module100
#(parameter param170 = (~&(((-((8'hb5) ? (8'h9f) : (8'hb5))) & ((+(8'hbe)) <<< ((8'hb2) ? (7'h43) : (8'ha5)))) ^~ ((-((8'ha1) <= (8'ha4))) ? {((8'hb3) ? (8'hb7) : (8'hbc))} : (~&(^(8'hbd)))))))
(y, clk, wire105, wire104, wire103, wire102, wire101);
  output wire [(32'h350):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire105;
  input wire [(4'he):(1'h0)] wire104;
  input wire [(4'hf):(1'h0)] wire103;
  input wire signed [(3'h7):(1'h0)] wire102;
  input wire signed [(4'hf):(1'h0)] wire101;
  wire signed [(4'hb):(1'h0)] wire169;
  wire signed [(5'h12):(1'h0)] wire168;
  wire [(5'h15):(1'h0)] wire167;
  wire [(4'hf):(1'h0)] wire151;
  wire [(5'h13):(1'h0)] wire150;
  wire signed [(4'hf):(1'h0)] wire149;
  wire [(3'h5):(1'h0)] wire148;
  wire [(5'h14):(1'h0)] wire147;
  wire [(4'hc):(1'h0)] wire123;
  wire [(4'hb):(1'h0)] wire122;
  wire signed [(4'ha):(1'h0)] wire121;
  wire [(4'ha):(1'h0)] wire109;
  wire signed [(4'h9):(1'h0)] wire108;
  wire signed [(5'h11):(1'h0)] wire107;
  wire signed [(5'h12):(1'h0)] wire106;
  reg [(4'ha):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg165 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg164 = (1'h0);
  reg [(4'h8):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg162 = (1'h0);
  reg [(3'h6):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg159 = (1'h0);
  reg [(5'h12):(1'h0)] reg158 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg155 = (1'h0);
  reg [(4'h9):(1'h0)] reg154 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg152 = (1'h0);
  reg [(4'ha):(1'h0)] reg146 = (1'h0);
  reg [(5'h14):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg144 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg142 = (1'h0);
  reg [(4'h9):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg139 = (1'h0);
  reg [(2'h2):(1'h0)] reg138 = (1'h0);
  reg [(3'h4):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg134 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg131 = (1'h0);
  reg [(4'h9):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg129 = (1'h0);
  reg [(4'hc):(1'h0)] reg128 = (1'h0);
  reg [(5'h12):(1'h0)] reg127 = (1'h0);
  reg [(4'hf):(1'h0)] reg126 = (1'h0);
  reg [(4'he):(1'h0)] reg125 = (1'h0);
  reg [(5'h14):(1'h0)] reg124 = (1'h0);
  reg [(4'hd):(1'h0)] reg120 = (1'h0);
  reg [(4'he):(1'h0)] reg119 = (1'h0);
  reg [(5'h12):(1'h0)] reg118 = (1'h0);
  reg [(5'h15):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg116 = (1'h0);
  reg [(4'he):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg113 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg112 = (1'h0);
  reg [(2'h2):(1'h0)] reg111 = (1'h0);
  reg [(5'h13):(1'h0)] reg110 = (1'h0);
  assign y = {wire169,
                 wire168,
                 wire167,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire123,
                 wire122,
                 wire121,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
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
                 reg136,
                 reg135,
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
                 reg124,
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
                 (1'h0)};
  assign wire106 = wire103[(1'h1):(1'h0)];
  assign wire107 = (wire106 ? wire106[(4'hf):(1'h1)] : wire106);
  assign wire108 = wire102[(1'h0):(1'h0)];
  assign wire109 = wire107[(4'hc):(3'h4)];
  always
    @(posedge clk) begin
      reg110 <= ((8'hb2) ?
          wire108[(4'h8):(3'h6)] : {(^~wire109[(3'h6):(2'h2)])});
      if ((|{(&$signed(wire101))}))
        begin
          if (((($signed((wire102 > (8'ha9))) || {reg110[(4'h8):(3'h4)]}) < $signed(wire108)) & $unsigned(reg110[(3'h6):(3'h4)])))
            begin
              reg111 <= $unsigned(({wire107,
                  $unsigned(wire109[(3'h7):(3'h4)])} <= $signed((^(wire102 != wire108)))));
            end
          else
            begin
              reg111 <= wire107;
              reg112 <= wire102;
              reg113 <= (({wire106} ?
                      $signed((|wire101[(1'h0):(1'h0)])) : reg111[(2'h2):(2'h2)]) ?
                  (&wire103[(2'h2):(1'h1)]) : $signed(wire109));
            end
          reg114 <= $unsigned((+wire103));
          if ($unsigned($signed((($unsigned(wire106) >= wire102) ?
              wire101[(3'h4):(1'h1)] : reg114[(3'h6):(2'h2)]))))
            begin
              reg115 <= $unsigned(($signed(reg110[(4'h8):(3'h6)]) + reg110[(1'h1):(1'h1)]));
              reg116 <= (&({$signed({wire104, wire101})} ?
                  (({wire103,
                      reg112} >= reg113) ~^ wire105) : $unsigned((8'hb3))));
              reg117 <= reg112[(2'h3):(1'h1)];
            end
          else
            begin
              reg115 <= {reg115[(3'h6):(2'h3)], reg112};
              reg116 <= ((($unsigned(((8'hba) & reg114)) ?
                          $signed(reg113[(4'ha):(4'h8)]) : wire107[(4'he):(1'h0)]) ?
                      (($unsigned(wire102) ?
                          (reg114 >> (8'ha0)) : (~^wire106)) && reg110[(3'h5):(2'h3)]) : wire105) ?
                  {(~wire109[(1'h1):(1'h1)])} : $signed(wire107));
              reg117 <= reg112[(4'h9):(4'h9)];
            end
          reg118 <= reg114;
        end
      else
        begin
          reg111 <= (($signed($unsigned(wire103)) ?
                  $signed(reg113) : {$signed((wire107 == (8'ha6))),
                      (reg111[(2'h2):(1'h0)] <= wire104)}) ?
              reg116[(4'hf):(2'h3)] : $unsigned((|($signed(reg118) & wire103[(4'hd):(2'h2)]))));
          reg112 <= $unsigned(reg118);
          reg113 <= (^((~|$unsigned(((8'hbb) ?
              (8'hb2) : reg116))) >>> ($signed(reg113[(1'h0):(1'h0)]) ?
              $signed((reg115 ?
                  reg116 : (8'hbb))) : $unsigned((wire109 && reg115)))));
          reg114 <= ((8'ha8) ?
              $unsigned((&$signed((reg111 ?
                  (8'hac) : wire106)))) : reg118[(5'h12):(4'hb)]);
          reg115 <= (wire109[(2'h2):(1'h1)] ^~ ($unsigned((8'ha8)) ?
              $signed(wire108[(2'h3):(1'h1)]) : ($signed(reg117[(4'hc):(3'h7)]) ?
                  (!(8'ha8)) : $unsigned($signed(reg110)))));
        end
      reg119 <= reg117;
      reg120 <= reg116;
    end
  assign wire121 = ((^~wire107) ?
                       wire108 : (wire106[(4'hb):(1'h1)] << $signed(($unsigned(wire107) ?
                           $signed(reg114) : {wire102, wire108}))));
  assign wire122 = reg119;
  assign wire123 = (|{wire108[(2'h2):(1'h1)]});
  always
    @(posedge clk) begin
      if ({$unsigned($signed($signed($unsigned(reg110)))),
          $signed((|(^~(~|(8'ha1)))))})
        begin
          reg124 <= (+$signed((8'ha5)));
        end
      else
        begin
          reg124 <= (-reg112[(2'h3):(2'h3)]);
        end
      if (wire109)
        begin
          reg125 <= (($signed(((reg124 & reg115) | $unsigned(reg114))) ?
                  $signed($signed(reg117)) : ((8'ha7) != (|wire106[(4'hd):(4'hd)]))) ?
              wire121 : {({reg111} ?
                      (reg117 >> $signed(wire106)) : $signed(wire106[(4'hb):(3'h6)]))});
        end
      else
        begin
          reg125 <= ((($signed({wire101, wire108}) != ({reg117, wire105} ?
                  (reg115 ?
                      reg114 : wire109) : (^wire107))) < (wire121 <<< wire107[(3'h7):(3'h6)])) ?
              $unsigned(((wire101[(4'hc):(3'h7)] ?
                      {wire102} : {reg110, reg125}) ?
                  $unsigned({reg114,
                      wire107}) : reg116[(4'h8):(3'h7)])) : ((((^~(8'ha6)) ?
                  wire109 : $signed(reg116)) || $unsigned((wire104 | wire106))) >= ($unsigned(((8'hbc) ?
                  reg115 : (8'hbe))) >= wire109)));
          reg126 <= wire102[(3'h5):(3'h4)];
        end
      if ($signed((^~(((^~(8'ha3)) - (reg120 ? reg113 : reg110)) ?
          $signed($unsigned(reg120)) : wire123))))
        begin
          reg127 <= wire108[(4'h8):(3'h5)];
          reg128 <= ((~$unsigned(reg126[(4'hc):(4'hb)])) ?
              ((+$signed($signed(wire108))) ?
                  ({(reg111 ? (8'ha8) : reg120), {reg115}} ?
                      (7'h43) : (~&((8'ha7) >= wire122))) : $signed($signed(wire123))) : (^~wire121[(1'h1):(1'h0)]));
          if ({{((wire108 * reg118[(5'h12):(4'hb)]) >>> (~^(~&reg119)))}})
            begin
              reg129 <= $signed((|wire108[(3'h4):(3'h4)]));
              reg130 <= wire121;
              reg131 <= (~^(!(~|(~&$signed(wire107)))));
            end
          else
            begin
              reg129 <= ($signed((wire106 ?
                      (!{reg120}) : $unsigned($signed(reg131)))) ?
                  {(~^(reg126 ?
                          reg117[(4'hb):(4'hb)] : ((8'hb5) ?
                              wire101 : (8'hb0)))),
                      wire107[(4'ha):(4'h8)]} : $unsigned({$unsigned((8'h9f)),
                      ($signed(reg125) ?
                          (wire107 < (8'hb3)) : (reg115 ? reg119 : reg117))}));
              reg130 <= $signed((^~reg129[(4'h8):(1'h1)]));
              reg131 <= (wire108 ^ reg110[(4'hc):(3'h4)]);
              reg132 <= reg116;
              reg133 <= {$unsigned($signed(reg113[(1'h1):(1'h0)])),
                  ($signed($unsigned($signed(reg124))) < ((8'hb8) ?
                      (reg125 ?
                          $signed(wire121) : $signed(wire106)) : reg112[(3'h6):(3'h5)]))};
            end
          reg134 <= $signed({(!($unsigned(reg111) ?
                  reg120[(4'ha):(2'h2)] : {reg127})),
              reg133[(3'h4):(2'h3)]});
        end
      else
        begin
          reg127 <= $unsigned($signed($signed($signed($signed((8'had))))));
          if (((reg120[(4'ha):(4'ha)] ?
                  ((reg129[(3'h7):(3'h5)] >>> wire104) > $unsigned({reg134})) : ((&(~^reg115)) ^~ ($signed(reg132) ?
                      $signed(reg132) : $signed(reg131)))) ?
              ((-($signed((8'ha8)) >>> reg132)) ?
                  reg124 : $unsigned(((!wire103) ?
                      (reg126 ^~ reg114) : wire101[(1'h1):(1'h0)]))) : wire122))
            begin
              reg128 <= {(^~$unsigned(wire103[(4'hf):(2'h2)])),
                  $unsigned(({(wire105 >>> wire109), reg134[(3'h5):(3'h5)]} ?
                      wire101 : $unsigned(reg115)))};
              reg129 <= (~^$signed(reg114));
            end
          else
            begin
              reg128 <= (reg110[(4'hf):(4'hd)] ?
                  (((&$unsigned(reg132)) ?
                          $signed($signed((8'hbb))) : $unsigned(reg130[(3'h4):(2'h3)])) ?
                      reg112 : $signed(reg120)) : wire109);
              reg129 <= (reg126 >>> (~({(wire103 * (8'ha3)), $signed((8'ha7))} ?
                  ($unsigned(reg129) ?
                      wire123[(4'ha):(4'h8)] : (wire103 < reg120)) : $signed({wire104}))));
            end
          reg130 <= reg110;
        end
      if (reg134)
        begin
          reg135 <= $unsigned((($unsigned(reg113[(3'h7):(2'h3)]) ?
                  (~&{wire122}) : ($signed(reg116) ?
                      reg132[(4'h8):(3'h6)] : (wire108 ? reg120 : reg118))) ?
              (|(~^reg116[(5'h12):(4'h9)])) : ($signed((reg112 >> wire104)) ?
                  (~^(reg133 ? reg129 : wire103)) : reg111)));
          reg136 <= $signed($unsigned(wire107[(5'h11):(1'h1)]));
        end
      else
        begin
          if (($signed(wire104[(3'h6):(3'h6)]) >= $signed((~|$signed($signed(wire107))))))
            begin
              reg135 <= reg116[(5'h10):(1'h0)];
              reg136 <= {$unsigned(wire123[(3'h5):(2'h3)])};
              reg137 <= reg128;
              reg138 <= (wire107[(3'h6):(2'h3)] ?
                  ({(~^(wire105 <= wire101)),
                      reg120} <<< ($unsigned((!(8'ha1))) ?
                      (7'h44) : (8'hbe))) : (reg117[(4'hf):(4'h9)] ?
                      (-(|(~^reg126))) : ((reg127[(3'h7):(3'h4)] ?
                          (wire101 >>> reg125) : (reg136 ?
                              reg137 : reg135)) ~^ wire104[(3'h5):(2'h2)])));
            end
          else
            begin
              reg135 <= ((({(8'hbe)} ?
                  (~^reg137) : ({reg130,
                      reg116} - (!(8'hb0)))) ^~ ($signed(reg111) ?
                  (~&{(7'h40)}) : ($unsigned(reg110) >> (wire101 ?
                      (8'hb2) : reg133)))) >>> (reg124 ?
                  $unsigned($signed(wire108[(3'h4):(3'h4)])) : reg116[(1'h1):(1'h0)]));
              reg136 <= $unsigned($signed($unsigned($signed((^reg113)))));
            end
          if (reg124)
            begin
              reg139 <= $signed((8'h9f));
              reg140 <= $signed(wire107[(4'hb):(3'h4)]);
              reg141 <= ($unsigned((reg112 ? $unsigned((-reg131)) : reg113)) ?
                  $signed(reg118[(5'h12):(5'h10)]) : reg110[(2'h2):(1'h1)]);
              reg142 <= (!reg114);
            end
          else
            begin
              reg139 <= reg132;
              reg140 <= (+($signed($unsigned(reg140)) ?
                  $signed(reg111[(1'h0):(1'h0)]) : $unsigned(reg124[(4'h9):(2'h2)])));
              reg141 <= reg139;
              reg142 <= ({$signed((~^$signed(reg112)))} ?
                  wire121 : $unsigned(($signed(reg124) & (((8'hac) ?
                      reg124 : reg119) > reg127[(2'h2):(1'h1)]))));
              reg143 <= wire121;
            end
          reg144 <= reg116;
          reg145 <= $signed((^(!(8'hba))));
          reg146 <= reg118;
        end
    end
  assign wire147 = $unsigned($signed((wire105 ?
                       {$unsigned(reg127), (!(8'ha8))} : {(reg136 ?
                               reg116 : reg125),
                           reg131})));
  assign wire148 = reg128[(3'h4):(1'h0)];
  assign wire149 = $unsigned($signed($unsigned($signed((reg139 ?
                       wire109 : reg143)))));
  assign wire150 = $unsigned(reg144[(1'h1):(1'h1)]);
  assign wire151 = wire149[(4'hd):(4'ha)];
  always
    @(posedge clk) begin
      reg152 <= reg137;
      if (wire147)
        begin
          reg153 <= reg116;
          reg154 <= ((reg127 ?
              (((&reg138) ^~ $signed((8'ha8))) < wire103) : reg113) <<< {(^~$unsigned((8'hba))),
              $unsigned((|reg110[(5'h10):(4'h9)]))});
          if (reg115)
            begin
              reg155 <= reg114;
            end
          else
            begin
              reg155 <= (($unsigned((^~wire121)) ?
                  $unsigned($signed((reg144 ?
                      wire150 : reg132))) : $signed(reg113)) && reg129[(2'h3):(2'h3)]);
            end
        end
      else
        begin
          if ($signed(wire121[(4'h9):(3'h7)]))
            begin
              reg153 <= wire109;
              reg154 <= (reg139[(3'h6):(2'h2)] >= {$signed({reg133,
                      reg146[(3'h7):(1'h1)]}),
                  reg116[(4'hc):(4'hb)]});
            end
          else
            begin
              reg153 <= $unsigned(({$unsigned((-reg131)),
                      $signed((reg135 ? (8'ha5) : reg126))} ?
                  $signed($unsigned($signed(reg143))) : reg132));
              reg154 <= wire104[(3'h7):(3'h5)];
            end
        end
      reg156 <= reg152;
      if ((reg137 - (|{reg130})))
        begin
          reg157 <= (({$signed(reg120)} + $signed(((7'h44) & $signed(reg116)))) ?
              (^(reg127[(4'h8):(3'h4)] << ((8'hac) == ((8'ha2) ?
                  (8'hb1) : reg143)))) : reg117);
          if (wire104[(4'hd):(1'h1)])
            begin
              reg158 <= {reg154[(1'h1):(1'h1)], reg117[(4'hf):(4'h8)]};
              reg159 <= (reg138 ?
                  {$signed({$signed(reg138),
                          $unsigned((8'haf))})} : ((~(^$unsigned(reg119))) <<< $signed(($unsigned(reg143) || (reg134 ?
                      wire121 : reg130)))));
              reg160 <= reg113;
              reg161 <= reg120[(4'ha):(1'h1)];
            end
          else
            begin
              reg158 <= (8'hac);
              reg159 <= reg127[(4'hb):(1'h0)];
              reg160 <= reg115;
              reg161 <= reg141;
              reg162 <= $signed($unsigned($unsigned($unsigned((reg133 ?
                  (8'ha6) : wire148)))));
            end
          reg163 <= (reg139[(3'h5):(2'h3)] && (~^$signed({$unsigned(reg125)})));
        end
      else
        begin
          reg157 <= $signed(reg115[(1'h1):(1'h1)]);
          reg158 <= ((reg134 && $signed(wire148[(3'h5):(3'h5)])) + (~reg135));
          if ((~&wire151))
            begin
              reg159 <= (8'haa);
              reg160 <= wire106;
            end
          else
            begin
              reg159 <= ((({(reg130 ? (8'hb6) : reg145)} ?
                          {wire149[(4'h8):(1'h1)],
                              (reg127 ? reg155 : reg131)} : (+(reg131 ?
                              reg158 : reg163))) ?
                      reg138[(2'h2):(1'h0)] : reg140) ?
                  wire147 : wire151[(4'hd):(3'h5)]);
            end
          reg161 <= (~&reg138);
        end
      if ((({$signed(wire105),
          reg143[(1'h1):(1'h1)]} >= (~&(~&(~reg155)))) >= wire123[(1'h0):(1'h0)]))
        begin
          reg164 <= reg163;
          reg165 <= reg146[(4'h9):(3'h7)];
        end
      else
        begin
          reg164 <= wire109[(2'h2):(1'h1)];
          reg165 <= (^$unsigned((~{(~^reg137), $unsigned((8'hb2))})));
          reg166 <= (reg146[(3'h5):(3'h4)] & reg138);
        end
    end
  assign wire167 = wire103;
  assign wire168 = {(~^$signed($unsigned((~|reg146)))),
                       ($unsigned(reg127[(4'ha):(3'h7)]) > {(|wire103)})};
  assign wire169 = (({reg163, reg140} ?
                           {($unsigned(reg138) ?
                                   $signed((8'hbf)) : (!(8'ha5)))} : $signed(((8'ha5) ?
                               $unsigned(reg114) : (^reg140)))) ?
                       wire102[(3'h4):(2'h3)] : (reg132[(4'ha):(2'h2)] ?
                           {$unsigned((reg113 >= wire108))} : ((~&$unsigned(reg138)) ?
                               $signed((+wire106)) : (&wire151[(4'h9):(3'h6)]))));
endmodule

module module71  (y, clk, wire75, wire74, wire73, wire72);
  output wire [(32'h75):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire75;
  input wire [(4'h8):(1'h0)] wire74;
  input wire signed [(3'h6):(1'h0)] wire73;
  input wire signed [(4'hb):(1'h0)] wire72;
  wire signed [(5'h10):(1'h0)] wire85;
  wire signed [(3'h7):(1'h0)] wire84;
  wire [(2'h2):(1'h0)] wire83;
  wire [(4'hf):(1'h0)] wire82;
  wire [(5'h11):(1'h0)] wire81;
  wire [(4'hf):(1'h0)] wire80;
  wire signed [(5'h12):(1'h0)] wire78;
  wire signed [(4'h9):(1'h0)] wire77;
  wire [(4'he):(1'h0)] wire76;
  reg signed [(2'h3):(1'h0)] reg79 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire78,
                 wire77,
                 wire76,
                 reg79,
                 (1'h0)};
  assign wire76 = wire75[(4'hd):(4'hd)];
  assign wire77 = (-$unsigned(wire73));
  assign wire78 = (wire74 ?
                      $signed((!$signed(wire72))) : $signed(((^wire73) ?
                          (|(wire73 >> wire75)) : {wire76, (^wire72)})));
  always
    @(posedge clk) begin
      reg79 <= $unsigned(((wire72[(2'h2):(2'h2)] - $unsigned({wire77})) ?
          ($signed((wire78 + wire73)) >= ((wire73 <<< wire73) ~^ (8'had))) : $unsigned(($unsigned(wire78) ?
              wire76[(4'h8):(3'h4)] : (-wire74)))));
    end
  assign wire80 = {wire73};
  assign wire81 = wire80;
  assign wire82 = wire77[(4'h8):(3'h6)];
  assign wire83 = $signed(wire76);
  assign wire84 = $unsigned((~&wire77[(3'h5):(1'h0)]));
  assign wire85 = ((wire76[(4'h9):(2'h3)] ?
                      {wire83[(1'h0):(1'h0)]} : (!wire78)) ~^ reg79[(2'h3):(2'h2)]);
endmodule

module module16
#(parameter param46 = ((((8'hb6) ^ (&((8'haf) ? (8'hb5) : (8'ha9)))) ? ((8'ha6) >> ({(8'had)} ? (^(8'hb1)) : ((8'hb5) & (8'hb3)))) : (-(^~((8'haa) | (8'hb2))))) ? ((((8'hba) ? ((8'hb2) ? (8'hb2) : (8'hab)) : (&(8'h9d))) ? (~|{(8'ha3), (8'hbc)}) : {(~|(7'h40))}) ? (({(8'hbd), (8'ha2)} ? ((8'hbe) ? (8'ha0) : (8'haa)) : (8'ha3)) - {((8'hb1) ? (8'hba) : (8'ha3)), {(8'h9e), (8'ha8)}}) : (((~^(8'ha1)) <<< {(8'hbb)}) ? (((8'ha3) != (8'haa)) ? {(8'hb7)} : (8'hb2)) : (((7'h42) & (8'hae)) ? (|(7'h43)) : ((8'hb5) | (8'haf))))) : (7'h40)), 
parameter param47 = (|(param46 ? (param46 ? (^~(param46 >> param46)) : param46) : ({param46, (param46 > param46)} > ({param46, param46} ? param46 : (param46 ? param46 : param46))))))
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h130):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire20;
  input wire [(4'hd):(1'h0)] wire19;
  input wire [(4'hf):(1'h0)] wire18;
  input wire signed [(4'h8):(1'h0)] wire17;
  wire [(4'h8):(1'h0)] wire45;
  wire [(4'hf):(1'h0)] wire44;
  wire [(5'h14):(1'h0)] wire43;
  wire signed [(3'h7):(1'h0)] wire37;
  wire [(3'h7):(1'h0)] wire36;
  wire signed [(4'hb):(1'h0)] wire35;
  wire signed [(4'hd):(1'h0)] wire34;
  wire [(2'h3):(1'h0)] wire33;
  wire [(4'ha):(1'h0)] wire32;
  wire [(4'he):(1'h0)] wire31;
  wire signed [(5'h12):(1'h0)] wire30;
  wire signed [(3'h6):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire28;
  wire [(5'h10):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire26;
  wire [(2'h3):(1'h0)] wire25;
  wire signed [(5'h13):(1'h0)] wire24;
  wire signed [(5'h11):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire22;
  wire signed [(2'h3):(1'h0)] wire21;
  reg [(4'hb):(1'h0)] reg42 = (1'h0);
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(5'h13):(1'h0)] reg40 = (1'h0);
  reg [(5'h12):(1'h0)] reg39 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 (1'h0)};
  assign wire21 = (~|$unsigned(wire18[(4'hf):(3'h4)]));
  assign wire22 = $signed(wire17);
  assign wire23 = (wire21[(1'h0):(1'h0)] ? (^wire21) : wire21);
  assign wire24 = {(wire17 ? $signed(wire18) : {(8'hae)})};
  assign wire25 = $signed(($signed(wire22[(3'h5):(2'h3)]) ?
                      {wire22[(1'h1):(1'h1)]} : wire17[(3'h5):(2'h2)]));
  assign wire26 = (~^$unsigned(((~&$signed(wire21)) && ((wire20 ?
                      wire21 : wire23) <= $signed(wire20)))));
  assign wire27 = ((wire19 >= $unsigned((^wire19))) ?
                      {(($signed(wire26) >> {wire23,
                              (8'h9d)}) * wire17)} : $signed({(+(^wire19)),
                          (wire25 > ((8'ha2) + wire21))}));
  assign wire28 = $signed((wire18 ? $signed($signed(wire27)) : wire26));
  assign wire29 = ((&(((&wire23) <= (+wire25)) ?
                      {wire18,
                          wire27[(3'h7):(3'h5)]} : (wire18[(2'h2):(2'h2)] >>> (~wire27)))) + $signed(wire18[(4'he):(3'h7)]));
  assign wire30 = $unsigned((((~|wire25[(1'h0):(1'h0)]) ?
                          ((wire17 ? wire24 : wire23) ?
                              $unsigned(wire21) : wire22) : (^wire26[(1'h1):(1'h1)])) ?
                      $unsigned((wire18[(4'hb):(3'h4)] && $signed(wire17))) : (wire19 ?
                          (|$unsigned(wire27)) : $signed($unsigned(wire18)))));
  assign wire31 = wire28;
  assign wire32 = wire24[(3'h5):(3'h5)];
  assign wire33 = {wire31, (wire23 ^~ $signed(wire25[(1'h0):(1'h0)]))};
  assign wire34 = (8'hb7);
  assign wire35 = ($unsigned((wire28[(3'h6):(2'h2)] & (~&$unsigned(wire31)))) < wire18[(3'h7):(3'h6)]);
  assign wire36 = {$signed((+((wire32 + wire17) ?
                          $signed(wire20) : (wire34 ? (8'hbf) : wire34))))};
  assign wire37 = ($unsigned(($signed(wire25[(2'h2):(1'h0)]) ?
                          (~|wire36) : $signed($signed(wire19)))) ?
                      {(wire25 <<< wire25)} : ((~|wire28[(5'h11):(4'hf)]) <<< (((~|wire36) && (^~wire27)) && {$signed(wire18)})));
  always
    @(posedge clk) begin
      reg38 <= wire17[(4'h8):(3'h4)];
    end
  always
    @(posedge clk) begin
      reg39 <= (wire29 <<< $unsigned(wire25));
      reg40 <= ($unsigned((^~(8'ha4))) - reg39);
      reg41 <= wire23;
      reg42 <= $signed($unsigned({((~wire32) >> $signed(wire20))}));
    end
  assign wire43 = wire32[(4'ha):(3'h5)];
  assign wire44 = $unsigned($signed((($unsigned((8'h9c)) ?
                      (~^wire34) : (~|wire30)) >= wire23[(1'h1):(1'h0)])));
  assign wire45 = (((wire18[(4'h9):(3'h7)] ? (^~$unsigned(reg38)) : {wire25}) ?
                          {$unsigned((wire18 ?
                                  wire37 : wire31))} : {$signed((^~(8'had))),
                              wire33[(1'h0):(1'h0)]}) ?
                      $signed((~^$unsigned($signed(wire37)))) : ((wire20[(4'h9):(1'h0)] ?
                          (wire23[(4'he):(4'hd)] <<< (wire28 ?
                              reg42 : wire35)) : (wire25[(2'h3):(2'h2)] | $unsigned(wire29))) | ({wire28[(5'h13):(1'h1)],
                          {reg42}} & {wire17[(1'h1):(1'h1)],
                          (wire18 || reg39)})));
endmodule
