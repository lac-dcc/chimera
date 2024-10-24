module top
#(parameter param287 = (&(8'haf)))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h13a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire0;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire286;
  wire [(4'hd):(1'h0)] wire159;
  wire [(4'hd):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire35;
  wire [(2'h2):(1'h0)] wire276;
  wire [(2'h2):(1'h0)] wire278;
  wire signed [(2'h3):(1'h0)] wire279;
  wire signed [(2'h2):(1'h0)] wire280;
  wire [(4'he):(1'h0)] wire281;
  wire [(4'h9):(1'h0)] wire282;
  wire signed [(5'h15):(1'h0)] wire283;
  reg [(3'h5):(1'h0)] reg285 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg [(5'h14):(1'h0)] reg43 = (1'h0);
  reg [(4'hb):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg45 = (1'h0);
  reg [(3'h4):(1'h0)] reg46 = (1'h0);
  assign y = {wire286,
                 wire159,
                 wire5,
                 wire6,
                 wire35,
                 wire276,
                 wire278,
                 wire279,
                 wire280,
                 wire281,
                 wire282,
                 wire283,
                 reg285,
                 reg8,
                 reg7,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 (1'h0)};
  assign wire5 = wire2;
  assign wire6 = $unsigned($signed(wire0));
  always
    @(posedge clk) begin
      reg7 <= wire0;
      reg8 <= $signed({$unsigned(((reg7 ? wire5 : wire5) ?
              $signed(wire1) : {wire3, wire0})),
          (8'haa)});
    end
  module9 #() modinst36 (wire35, clk, wire6, reg8, wire1, wire2);
  always
    @(posedge clk) begin
      reg37 <= wire3[(3'h6):(1'h0)];
      reg38 <= $signed(($unsigned((wire35[(2'h3):(1'h1)] ?
              $signed(wire0) : wire1)) ?
          (^~(~&wire0)) : (wire3[(3'h7):(2'h2)] ?
              {reg7[(3'h4):(2'h3)],
                  ((8'hbd) ? wire1 : reg7)} : wire4[(1'h1):(1'h0)])));
      if (wire5[(3'h5):(3'h4)])
        begin
          reg39 <= (&reg38);
        end
      else
        begin
          reg39 <= $signed(wire3[(4'hc):(4'hc)]);
          if ($signed($signed($signed($unsigned($unsigned(wire5))))))
            begin
              reg40 <= reg8[(4'h9):(2'h3)];
              reg41 <= {$signed(wire3[(1'h0):(1'h0)])};
            end
          else
            begin
              reg40 <= wire1[(1'h1):(1'h1)];
              reg41 <= (($signed((-wire35[(1'h0):(1'h0)])) > ($unsigned((!wire6)) && ((reg8 >> wire4) < wire4[(1'h0):(1'h0)]))) + (^~wire3));
              reg42 <= {$signed((wire0[(2'h2):(1'h1)] ?
                      reg8[(4'hb):(2'h2)] : {$unsigned((8'ha2))})),
                  $unsigned((((wire5 + (7'h40)) ? wire35 : $unsigned(wire35)) ?
                      wire1[(2'h2):(1'h1)] : wire2[(2'h2):(1'h0)]))};
              reg43 <= reg7;
              reg44 <= ($unsigned((wire35 << {(wire2 ^~ reg8),
                      {reg7, reg38}})) ?
                  reg40[(3'h6):(3'h4)] : (^~(((wire35 ? wire35 : wire2) ?
                      reg42 : (reg41 ?
                          reg7 : (8'ha1))) && (((8'hac) ~^ wire35) ?
                      $signed(reg38) : reg42[(1'h0):(1'h0)]))));
            end
        end
      reg45 <= (reg37 <= (((-$signed(wire5)) >= $unsigned(reg41)) ?
          $unsigned(reg37[(3'h7):(3'h6)]) : reg7));
      reg46 <= {wire35[(4'h8):(4'h8)]};
    end
  module47 #() modinst160 (.wire48(reg39), .y(wire159), .wire52(wire4), .clk(clk), .wire49(wire6), .wire50(reg40), .wire51(wire35));
  module161 #() modinst277 (wire276, clk, wire4, wire35, reg43, reg42);
  assign wire278 = $signed($signed($signed($unsigned($unsigned(wire1)))));
  assign wire279 = (reg46 ?
                       (|reg46) : ($signed(($unsigned(reg39) > (^~reg46))) ?
                           ($unsigned(reg39[(3'h7):(3'h6)]) ?
                               {$unsigned(wire35),
                                   $signed(reg42)} : {$unsigned(reg45)}) : (($signed((8'hb6)) & (reg44 ?
                               (8'hb8) : wire4)) | $unsigned(reg43[(3'h6):(2'h3)]))));
  assign wire280 = $signed(reg43[(5'h12):(5'h10)]);
  assign wire281 = $unsigned(((^~$signed(wire5[(3'h4):(1'h1)])) ?
                       $signed(($signed(wire2) >> $signed(reg40))) : (-{reg46,
                           reg38[(1'h1):(1'h1)]})));
  assign wire282 = reg43;
  module9 #() modinst284 (wire283, clk, reg40, wire2, reg37, reg7);
  always
    @(posedge clk) begin
      reg285 <= reg41[(4'hc):(4'h9)];
    end
  assign wire286 = reg42;
endmodule

module module161  (y, clk, wire165, wire164, wire163, wire162);
  output wire [(32'h27a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire165;
  input wire [(5'h11):(1'h0)] wire164;
  input wire [(5'h14):(1'h0)] wire163;
  input wire [(5'h11):(1'h0)] wire162;
  wire signed [(4'hf):(1'h0)] wire275;
  wire signed [(4'hc):(1'h0)] wire274;
  wire signed [(2'h2):(1'h0)] wire273;
  wire [(4'hf):(1'h0)] wire272;
  wire signed [(3'h4):(1'h0)] wire271;
  wire [(4'he):(1'h0)] wire238;
  wire [(5'h11):(1'h0)] wire237;
  wire [(5'h11):(1'h0)] wire236;
  wire signed [(5'h12):(1'h0)] wire234;
  wire signed [(4'ha):(1'h0)] wire222;
  wire signed [(3'h7):(1'h0)] wire221;
  wire signed [(5'h10):(1'h0)] wire220;
  wire [(5'h15):(1'h0)] wire190;
  wire [(5'h10):(1'h0)] wire166;
  wire signed [(5'h11):(1'h0)] wire199;
  wire [(4'ha):(1'h0)] wire200;
  wire [(5'h15):(1'h0)] wire201;
  wire signed [(5'h15):(1'h0)] wire218;
  reg [(5'h11):(1'h0)] reg270 = (1'h0);
  reg [(4'h8):(1'h0)] reg269 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg268 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg267 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg266 = (1'h0);
  reg [(3'h6):(1'h0)] reg265 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg264 = (1'h0);
  reg [(3'h4):(1'h0)] reg263 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg262 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg261 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg260 = (1'h0);
  reg [(4'ha):(1'h0)] reg259 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg258 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg257 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg256 = (1'h0);
  reg [(5'h14):(1'h0)] reg255 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg254 = (1'h0);
  reg [(3'h6):(1'h0)] reg253 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg252 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg251 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg250 = (1'h0);
  reg [(2'h3):(1'h0)] reg249 = (1'h0);
  reg [(3'h4):(1'h0)] reg248 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg247 = (1'h0);
  reg [(3'h7):(1'h0)] reg246 = (1'h0);
  reg [(3'h4):(1'h0)] reg245 = (1'h0);
  reg [(4'hc):(1'h0)] reg244 = (1'h0);
  reg [(3'h5):(1'h0)] reg243 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg242 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg241 = (1'h0);
  reg [(3'h4):(1'h0)] reg240 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg239 = (1'h0);
  reg [(5'h14):(1'h0)] reg192 = (1'h0);
  reg [(3'h4):(1'h0)] reg193 = (1'h0);
  reg [(5'h12):(1'h0)] reg194 = (1'h0);
  reg [(4'he):(1'h0)] reg195 = (1'h0);
  reg [(4'hd):(1'h0)] reg196 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg197 = (1'h0);
  reg signed [(4'he):(1'h0)] reg198 = (1'h0);
  assign y = {wire275,
                 wire274,
                 wire273,
                 wire272,
                 wire271,
                 wire238,
                 wire237,
                 wire236,
                 wire234,
                 wire222,
                 wire221,
                 wire220,
                 wire190,
                 wire166,
                 wire199,
                 wire200,
                 wire201,
                 wire218,
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
                 reg246,
                 reg245,
                 reg244,
                 reg243,
                 reg242,
                 reg241,
                 reg240,
                 reg239,
                 reg192,
                 reg193,
                 reg194,
                 reg195,
                 reg196,
                 reg197,
                 reg198,
                 (1'h0)};
  assign wire166 = $unsigned(wire163);
  module167 #() modinst191 (wire190, clk, wire166, wire165, wire164, wire163, wire162);
  always
    @(posedge clk) begin
      reg192 <= ($signed($unsigned({(8'hb8)})) != {($unsigned((+wire164)) ?
              (wire166[(3'h7):(2'h3)] ?
                  (wire164 << wire164) : (wire163 & wire165)) : (&{wire166,
                  wire166}))});
      if (((((~^$unsigned(wire163)) ?
              ($unsigned((8'ha2)) ?
                  {(8'hb3),
                      wire166} : $signed(reg192)) : {(!wire164)}) ^~ (~|wire190)) ?
          (($signed({wire165, reg192}) && {(wire162 <= wire190),
                  wire164[(4'he):(3'h6)]}) ?
              ((&(^reg192)) ?
                  $signed($signed(wire165)) : wire164[(3'h4):(3'h4)]) : (wire163 ?
                  ((wire164 ? wire165 : wire163) ?
                      (wire166 >= wire165) : wire162) : wire162)) : wire166))
        begin
          reg193 <= ($unsigned(wire166[(3'h4):(1'h1)]) * $unsigned(wire165));
          reg194 <= $signed($signed((((wire164 && wire165) ?
              (~|(8'hac)) : (wire165 << wire166)) ~^ {$unsigned(wire165)})));
        end
      else
        begin
          if ((^~{((^(~(7'h43))) | wire190[(1'h1):(1'h0)])}))
            begin
              reg193 <= reg192;
              reg194 <= {(((~((7'h40) ?
                      wire163 : wire164)) * wire162) < reg194[(4'h9):(3'h7)]),
                  reg194};
              reg195 <= wire190;
              reg196 <= {(-{(~^{(8'hb5), reg195}),
                      $signed({wire165, wire165})})};
            end
          else
            begin
              reg193 <= {reg195, $signed({wire166})};
            end
          reg197 <= reg194[(3'h6):(2'h3)];
          reg198 <= wire164[(4'hc):(2'h3)];
        end
    end
  assign wire199 = $signed((|(reg198[(4'h8):(1'h1)] <<< (((8'ha4) ?
                           (7'h40) : (8'ha1)) ?
                       (^~reg198) : $signed((8'ha2))))));
  assign wire200 = reg197[(2'h2):(1'h1)];
  assign wire201 = ((wire163 == wire163[(5'h13):(4'h9)]) ?
                       (((wire166[(1'h1):(1'h1)] >> (reg193 ?
                               wire163 : wire166)) + $unsigned(reg195)) ?
                           $signed((+(^wire164))) : (reg195[(3'h7):(3'h4)] >= {(!reg194)})) : $signed($signed($signed({wire164,
                           reg196}))));
  module202 #() modinst219 (.wire206(wire201), .clk(clk), .y(wire218), .wire203(reg197), .wire204(reg192), .wire205(reg198));
  assign wire220 = ((~|$signed({wire163})) && $signed(wire190[(2'h2):(1'h0)]));
  assign wire221 = (((!{reg196}) && {($unsigned(reg196) ?
                           (^~reg197) : (reg192 ?
                               reg194 : wire201))}) > {{($unsigned(reg195) ?
                               ((8'hb2) ^~ (8'hbd)) : ((8'hb6) >> wire201))}});
  assign wire222 = $signed((wire220[(3'h5):(1'h1)] ?
                       ((~|(~&wire166)) ?
                           (^$signed((8'hb4))) : {(wire220 ?
                                   wire221 : wire165)}) : (7'h43)));
  module223 #() modinst235 (wire234, clk, wire218, reg194, wire162, reg195);
  assign wire236 = $unsigned($unsigned(wire165[(1'h0):(1'h0)]));
  assign wire237 = reg192[(3'h5):(1'h0)];
  assign wire238 = (($signed(reg195) ?
                           wire199[(4'hf):(2'h3)] : $unsigned($signed(reg193[(2'h3):(1'h1)]))) ?
                       $signed({reg197,
                           $signed((wire201 + reg192))}) : (+wire220[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      if (((wire165[(3'h5):(3'h4)] ?
          reg192[(5'h13):(4'h8)] : (!wire234[(4'hb):(1'h0)])) >> (wire234[(4'hc):(3'h5)] + $signed($unsigned(wire166[(4'ha):(3'h4)])))))
        begin
          reg239 <= {wire221};
        end
      else
        begin
          reg239 <= ((reg239 ?
                  $signed({wire199[(4'h8):(3'h7)]}) : $unsigned(wire234)) ?
              $unsigned($signed($unsigned(wire199))) : (!wire221));
          if (($unsigned((wire162[(3'h5):(1'h1)] <<< (8'hbd))) ?
              wire199 : reg239[(4'h9):(4'h9)]))
            begin
              reg240 <= wire234;
              reg241 <= wire237[(4'hc):(1'h1)];
              reg242 <= $unsigned(wire238[(4'ha):(3'h6)]);
              reg243 <= wire164[(4'he):(1'h1)];
            end
          else
            begin
              reg240 <= ((8'ha2) ? {(7'h44)} : reg192);
            end
          reg244 <= (wire164[(3'h5):(2'h3)] <<< ($unsigned((!$signed(wire190))) == ($unsigned((reg193 >>> wire199)) ?
              $unsigned(wire220[(3'h6):(1'h1)]) : $signed($unsigned((8'had))))));
          if (reg243[(2'h2):(1'h1)])
            begin
              reg245 <= (reg243[(3'h5):(1'h0)] ?
                  (-(((wire165 ? reg243 : wire220) ?
                          (8'ha0) : $signed(reg240)) ?
                      reg242[(2'h2):(1'h0)] : wire163)) : $signed($unsigned((reg194[(4'ha):(2'h3)] ?
                      reg241 : (wire236 ? wire200 : wire234)))));
              reg246 <= $unsigned((~($signed((~&(8'had))) ?
                  $unsigned((wire165 ?
                      reg192 : wire162)) : $signed($unsigned(wire201)))));
            end
          else
            begin
              reg245 <= {(^(^(&{(8'ha8), wire164}))), reg198};
            end
        end
      reg247 <= $signed((8'hbb));
      if ((~$signed((wire236 ~^ (wire164[(2'h3):(2'h3)] || (&wire200))))))
        begin
          reg248 <= $unsigned((&$unsigned(((wire236 ?
              wire163 : reg242) > $unsigned(wire220)))));
          reg249 <= (wire166[(4'h8):(3'h7)] && $unsigned(($signed((wire190 + wire163)) == $unsigned($unsigned(reg243)))));
          reg250 <= (~^$signed($unsigned(reg241[(1'h1):(1'h1)])));
          reg251 <= $unsigned((wire234 ?
              (~(-$signed(reg194))) : $unsigned(reg248[(1'h1):(1'h1)])));
          reg252 <= (^~wire236);
        end
      else
        begin
          if (({reg197} ?
              (wire221[(3'h6):(3'h5)] ?
                  {(&$unsigned(reg244))} : (wire190[(2'h3):(1'h0)] ?
                      $unsigned(wire218[(4'hc):(4'hc)]) : ((reg194 ?
                              reg192 : reg252) ?
                          (8'ha9) : (wire165 ~^ (8'hb4))))) : (~^({wire218[(3'h5):(2'h3)]} ?
                  wire238 : (reg240 ?
                      $signed(reg247) : (reg194 ? reg241 : reg240))))))
            begin
              reg248 <= wire220;
              reg249 <= $unsigned((($unsigned((-wire190)) ?
                      ((^~reg240) ?
                          (reg249 ?
                              reg243 : reg247) : reg193[(2'h2):(1'h1)]) : wire163[(4'ha):(2'h3)]) ?
                  $signed(((~|reg245) ?
                      (^~reg249) : $unsigned(reg249))) : reg243));
              reg250 <= wire221;
              reg251 <= ({reg247,
                      $unsigned(((reg242 & wire221) >> wire220[(3'h5):(3'h5)]))} ?
                  (~|(^~(8'hbf))) : $unsigned((({reg240} < reg198[(2'h2):(1'h1)]) || (reg248 >>> wire162))));
            end
          else
            begin
              reg248 <= $unsigned($signed(((reg196[(1'h1):(1'h1)] ?
                  reg196 : reg198) != $unsigned($signed(reg243)))));
              reg249 <= (~|(8'hb2));
              reg250 <= $signed($signed($signed(wire238)));
              reg251 <= reg241[(2'h2):(1'h1)];
              reg252 <= wire190;
            end
          reg253 <= reg192[(1'h1):(1'h1)];
          if (((wire222[(4'ha):(1'h1)] ? wire221 : wire220[(3'h5):(2'h2)]) ?
              ($unsigned((~{wire166, wire200})) | (wire220[(4'hf):(4'hc)] ?
                  reg251[(2'h3):(2'h3)] : wire221)) : reg245[(2'h3):(2'h3)]))
            begin
              reg254 <= reg198;
              reg255 <= reg196[(3'h6):(1'h0)];
              reg256 <= $unsigned((reg195 ?
                  (-(reg198 + wire234[(3'h5):(3'h4)])) : reg240));
            end
          else
            begin
              reg254 <= (reg256[(1'h0):(1'h0)] ~^ wire164);
              reg255 <= wire164;
              reg256 <= ({(-{reg239}),
                      ($signed((wire222 == reg245)) ~^ $unsigned((8'hb9)))} ?
                  (({reg251[(3'h5):(3'h5)],
                      (~reg194)} & reg240) | $unsigned({$signed(wire163)})) : $signed($signed((^~(~^reg243)))));
              reg257 <= (wire166 ?
                  $unsigned($unsigned((+(wire222 | wire238)))) : reg250);
            end
          reg258 <= (($signed($unsigned((wire237 < wire234))) ?
              $unsigned($signed($signed((8'hbf)))) : reg197[(2'h3):(1'h0)]) ^ ($unsigned(reg256) ?
              (~|wire201) : $unsigned($signed(((8'hb4) ? reg240 : wire163)))));
          if (($unsigned(wire164[(4'hb):(4'h8)]) ?
              {$unsigned({$signed(reg249)}),
                  $signed($unsigned(((8'hb4) ? reg258 : reg198)))} : ((8'ha4) ?
                  ((reg244[(3'h7):(1'h0)] || wire199) ?
                      $signed((reg245 ^ reg248)) : {wire201,
                          (wire165 ?
                              reg194 : wire221)}) : reg255[(2'h2):(2'h2)])))
            begin
              reg259 <= {$unsigned(($unsigned((&(7'h44))) == ((reg198 <<< (8'hbf)) ?
                      $unsigned(reg258) : (~|wire238)))),
                  reg249};
              reg260 <= $signed($signed((reg196 ?
                  $signed(reg243) : (&(reg254 > wire220)))));
            end
          else
            begin
              reg259 <= (|$unsigned(wire199[(4'hf):(4'h9)]));
            end
        end
      if (wire164)
        begin
          reg261 <= wire199[(1'h1):(1'h1)];
          reg262 <= reg258;
        end
      else
        begin
          if ((~$unsigned(reg259)))
            begin
              reg261 <= ((~^$unsigned(($unsigned((8'ha4)) && (~|reg247)))) ?
                  reg194 : ({{reg244[(3'h7):(1'h1)]}} ?
                      (reg254 <<< ((reg196 != wire201) <<< $unsigned(reg248))) : $signed(wire201)));
            end
          else
            begin
              reg261 <= ($unsigned($unsigned($signed((reg248 || wire234)))) ?
                  $signed($signed($unsigned((wire220 << (8'h9d))))) : ((8'hbf) ?
                      $unsigned((!(^reg240))) : $signed(reg192[(3'h6):(3'h5)])));
              reg262 <= wire190[(4'ha):(3'h5)];
              reg263 <= (^~{wire220[(3'h4):(3'h4)],
                  {(wire201[(3'h5):(1'h1)] ?
                          (reg249 ? reg196 : reg195) : wire238)}});
              reg264 <= {((~$unsigned(((8'ha1) <= (8'hb1)))) ?
                      (-($unsigned(wire236) ?
                          wire190 : (wire201 < reg239))) : (-reg244[(4'h9):(3'h4)])),
                  ({(+$unsigned(wire166))} ?
                      (&((wire220 ? wire201 : wire238) ?
                          $signed(reg252) : $signed((8'h9f)))) : reg193)};
            end
          reg265 <= reg262;
          if (reg246)
            begin
              reg266 <= (reg249 ?
                  reg247 : ((reg197[(1'h0):(1'h0)] - reg265) ~^ $signed(wire166[(4'hc):(4'hc)])));
            end
          else
            begin
              reg266 <= {wire162};
              reg267 <= ($signed(reg265[(2'h3):(1'h1)]) ?
                  {$signed((!{reg262, reg194}))} : reg265[(2'h2):(1'h0)]);
              reg268 <= ((~&reg247) >= (!{reg262[(4'he):(2'h3)]}));
            end
          reg269 <= wire199[(3'h4):(1'h0)];
        end
      reg270 <= wire238;
    end
  assign wire271 = $unsigned({$signed(((8'hbe) >> (8'hbf)))});
  assign wire272 = (((~reg260[(4'h8):(4'h8)]) ^~ ($signed(wire218) ?
                           reg239[(3'h4):(3'h4)] : (!reg240[(1'h0):(1'h0)]))) ?
                       (|(!(reg192[(3'h5):(3'h4)] ?
                           (-wire200) : $signed((8'hb9))))) : ($unsigned(reg247[(3'h6):(2'h2)]) > ({(reg247 > reg246)} ?
                           $signed((reg250 <= reg262)) : reg254[(2'h2):(1'h1)])));
  assign wire273 = ((^~wire164) ? reg251 : reg267[(3'h5):(2'h2)]);
  assign wire274 = $signed(({(wire272[(1'h0):(1'h0)] << (~^wire222))} ?
                       $signed(reg250[(2'h2):(1'h0)]) : $signed((wire273 ~^ $unsigned(wire218)))));
  assign wire275 = $signed($signed(($signed(wire199) == ((reg259 + wire274) ?
                       {reg259} : wire162[(4'h8):(3'h5)]))));
endmodule

module module47
#(parameter param158 = ((({((8'hb0) != (8'hba))} ? (~((7'h41) << (8'hbe))) : (|{(8'hb5), (8'hba)})) <= (8'hbf)) ? {((((8'hb5) ? (8'hb6) : (8'ha4)) ? ((8'hb6) ? (8'ha9) : (7'h44)) : ((8'hb9) ? (7'h41) : (8'hb8))) ^~ ((8'hae) ? ((8'ha4) ? (8'ha3) : (8'ha4)) : ((8'hb5) < (8'ha2))))} : (~^((~(~|(7'h42))) - (((8'ha7) ? (7'h43) : (8'hba)) ? (~(8'hb0)) : ((8'hac) == (7'h40)))))))
(y, clk, wire48, wire49, wire50, wire51, wire52);
  output wire [(32'h2db):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire48;
  input wire signed [(4'hb):(1'h0)] wire49;
  input wire signed [(3'h6):(1'h0)] wire50;
  input wire signed [(4'ha):(1'h0)] wire51;
  input wire signed [(4'h8):(1'h0)] wire52;
  wire [(5'h15):(1'h0)] wire53;
  wire signed [(5'h13):(1'h0)] wire54;
  wire [(5'h10):(1'h0)] wire78;
  wire signed [(4'ha):(1'h0)] wire79;
  wire signed [(4'hf):(1'h0)] wire80;
  wire [(3'h5):(1'h0)] wire81;
  wire signed [(5'h11):(1'h0)] wire83;
  wire [(4'h9):(1'h0)] wire84;
  wire signed [(4'h8):(1'h0)] wire85;
  wire signed [(5'h15):(1'h0)] wire93;
  wire signed [(5'h12):(1'h0)] wire94;
  wire [(4'hc):(1'h0)] wire108;
  wire signed [(2'h2):(1'h0)] wire109;
  wire [(2'h3):(1'h0)] wire156;
  reg signed [(2'h3):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg [(5'h11):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg61 = (1'h0);
  reg [(5'h14):(1'h0)] reg62 = (1'h0);
  reg [(5'h14):(1'h0)] reg63 = (1'h0);
  reg [(3'h6):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg65 = (1'h0);
  reg signed [(4'he):(1'h0)] reg66 = (1'h0);
  reg [(4'h9):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg72 = (1'h0);
  reg [(4'h8):(1'h0)] reg73 = (1'h0);
  reg [(5'h10):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  reg [(5'h13):(1'h0)] reg76 = (1'h0);
  reg [(5'h14):(1'h0)] reg77 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg82 = (1'h0);
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  reg [(5'h13):(1'h0)] reg87 = (1'h0);
  reg [(3'h5):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg89 = (1'h0);
  reg [(4'he):(1'h0)] reg90 = (1'h0);
  reg [(4'hd):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg95 = (1'h0);
  reg [(5'h13):(1'h0)] reg96 = (1'h0);
  reg [(4'h8):(1'h0)] reg97 = (1'h0);
  reg signed [(4'he):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg99 = (1'h0);
  reg [(5'h10):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg102 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg103 = (1'h0);
  reg [(3'h7):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg106 = (1'h0);
  reg [(3'h5):(1'h0)] reg107 = (1'h0);
  assign y = {wire53,
                 wire54,
                 wire78,
                 wire79,
                 wire80,
                 wire81,
                 wire83,
                 wire84,
                 wire85,
                 wire93,
                 wire94,
                 wire108,
                 wire109,
                 wire156,
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
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg82,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 reg99,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 reg106,
                 reg107,
                 (1'h0)};
  assign wire53 = wire49;
  assign wire54 = $unsigned(wire48[(2'h3):(2'h3)]);
  always
    @(posedge clk) begin
      reg55 <= (wire53[(4'hc):(4'hc)] <<< (wire53 ?
          {$unsigned((~wire53)), wire52} : $unsigned((8'h9e))));
      if (($unsigned($signed(wire52)) == (wire54 ?
          wire52 : $unsigned({(8'ha2)}))))
        begin
          reg56 <= wire48;
          if (wire51)
            begin
              reg57 <= ((({(wire52 ^ (8'h9d)),
                      (wire48 << wire48)} + (^~((8'ha5) || (8'haf)))) ?
                  (~|(wire48 > (&wire49))) : ({(|reg55),
                      $unsigned(wire48)} != (|(wire48 >>> wire52)))) == $unsigned((wire54[(4'hc):(1'h1)] ?
                  (-(wire52 ? reg56 : reg55)) : (~(-reg55)))));
              reg58 <= {wire48[(4'h9):(3'h7)], wire48[(4'hb):(3'h6)]};
              reg59 <= (&(reg55[(2'h3):(1'h0)] ?
                  $unsigned(wire53[(5'h15):(3'h5)]) : wire50[(2'h3):(2'h2)]));
              reg60 <= wire51[(3'h7):(3'h6)];
              reg61 <= wire51[(3'h4):(2'h2)];
            end
          else
            begin
              reg57 <= reg56;
            end
          reg62 <= (~reg57[(2'h3):(2'h3)]);
          if ($signed((~&($signed(reg59[(4'hd):(4'hd)]) ?
              (~|$unsigned(wire49)) : (&(~wire51))))))
            begin
              reg63 <= reg56[(1'h1):(1'h1)];
              reg64 <= $signed(wire48[(2'h2):(1'h0)]);
              reg65 <= $unsigned((reg59[(3'h6):(1'h1)] * $unsigned(reg56[(1'h1):(1'h1)])));
            end
          else
            begin
              reg63 <= (8'ha9);
              reg64 <= (wire52 ?
                  ($unsigned($unsigned((reg56 <<< wire50))) != (-{wire49,
                      $signed(wire51)})) : ((~&{{reg63},
                      $signed((8'hb0))}) >> reg56[(4'hd):(3'h4)]));
            end
          if ((($unsigned((&(reg59 | wire51))) != {wire52,
              ({reg60} - wire54)}) + wire48[(1'h0):(1'h0)]))
            begin
              reg66 <= $unsigned($signed($unsigned({{reg58, wire49},
                  ((8'ha7) ? reg61 : wire54)})));
              reg67 <= reg58;
              reg68 <= {(((8'ha8) << $unsigned($unsigned(wire54))) ?
                      $signed((7'h41)) : $signed((|(-wire54)))),
                  $unsigned((~|(^(~^reg60))))};
              reg69 <= reg60;
              reg70 <= reg59[(1'h0):(1'h0)];
            end
          else
            begin
              reg66 <= $signed($signed(reg66));
              reg67 <= {$unsigned(reg57[(4'hf):(3'h5)])};
              reg68 <= reg68;
              reg69 <= $signed($signed($unsigned($signed($signed(wire53)))));
              reg70 <= ((~|(($unsigned(wire52) ?
                          reg67[(3'h4):(3'h4)] : wire51) ?
                      ($signed(reg64) - ((8'ha4) ? reg61 : reg57)) : reg57)) ?
                  {(~$signed(((8'ha9) > reg55)))} : wire50[(3'h4):(3'h4)]);
            end
        end
      else
        begin
          reg56 <= ((!{(8'hbd)}) ? $unsigned(reg65) : reg65[(3'h6):(3'h5)]);
          reg57 <= $signed({({(&wire52), reg69} ^ (&(|reg57)))});
        end
      if (((^reg62) ?
          $signed($unsigned((((8'ha2) ? reg70 : (8'ha7)) | reg68))) : wire50))
        begin
          reg71 <= reg55[(1'h1):(1'h0)];
          reg72 <= (-(wire49 >= $signed((~|reg68[(3'h5):(2'h2)]))));
        end
      else
        begin
          reg71 <= reg70[(1'h1):(1'h0)];
          if ($signed((8'ha4)))
            begin
              reg72 <= $unsigned($signed(reg66[(4'hd):(4'hd)]));
            end
          else
            begin
              reg72 <= (~|wire51);
              reg73 <= $signed(reg64);
              reg74 <= $unsigned(wire54);
              reg75 <= (reg58 ?
                  (((^~(-reg65)) < $signed($signed((8'hb1)))) >> (((reg72 ?
                              (7'h41) : reg55) ?
                          $unsigned(reg68) : $unsigned(reg73)) ?
                      $unsigned(((7'h41) ?
                          wire54 : reg62)) : $unsigned((~|reg72)))) : (($signed($signed((8'hb8))) >>> reg68) + reg68));
            end
          reg76 <= reg70;
        end
      reg77 <= $signed(reg70[(2'h2):(1'h1)]);
    end
  assign wire78 = $signed($unsigned(reg57));
  assign wire79 = wire78;
  assign wire80 = $signed(wire51);
  assign wire81 = $signed(((~&$signed((wire49 ?
                      reg62 : reg58))) || (reg70[(3'h4):(2'h3)] ?
                      $unsigned($unsigned((8'hb2))) : ($signed(reg70) ?
                          (reg70 ? wire51 : reg71) : reg68[(3'h7):(1'h0)]))));
  always
    @(posedge clk) begin
      reg82 <= (reg58 || ($unsigned($signed((wire53 >>> (7'h44)))) ?
          wire48 : (($signed(reg63) ?
              $unsigned(reg69) : wire50[(3'h4):(2'h2)]) + (~^(~^reg64)))));
    end
  assign wire83 = $unsigned((wire49 > (-$signed(reg55))));
  assign wire84 = ((~(reg60[(3'h4):(2'h2)] ?
                      $unsigned($unsigned(wire83)) : reg57)) == (~|reg57[(2'h3):(1'h1)]));
  assign wire85 = (~&reg68);
  always
    @(posedge clk) begin
      reg86 <= $signed($signed($unsigned(reg59)));
      if ({$signed((((reg66 ? reg75 : wire53) ^ $unsigned((8'ha5))) + reg64))})
        begin
          reg87 <= $signed($unsigned((8'hb0)));
          reg88 <= $unsigned((|(~$unsigned($unsigned(reg68)))));
          reg89 <= ((reg73 ? (8'ha3) : $unsigned((|(~&reg65)))) ?
              reg87 : wire83[(4'hc):(4'h8)]);
        end
      else
        begin
          reg87 <= $unsigned($unsigned(wire78[(5'h10):(4'hd)]));
          if ($unsigned({(&{{reg62}})}))
            begin
              reg88 <= ($unsigned({reg68[(4'hb):(3'h6)]}) != ((7'h40) ?
                  $unsigned(reg72) : (((reg67 ? wire78 : wire79) ?
                      wire84[(3'h5):(3'h5)] : (&(8'hb4))) == {wire78})));
              reg89 <= (|wire54[(4'he):(2'h3)]);
            end
          else
            begin
              reg88 <= wire81;
            end
          reg90 <= (reg74 ?
              (($unsigned(reg71) ?
                  $unsigned(reg70[(1'h0):(1'h0)]) : $signed(wire48[(4'hc):(4'ha)])) >> ($signed($unsigned(reg65)) ?
                  {(reg86 ? (8'hbe) : reg82)} : (wire83 < (reg62 ?
                      wire79 : reg89)))) : ($signed(reg72) || $unsigned($unsigned(reg76[(3'h4):(1'h0)]))));
        end
      reg91 <= (($unsigned((reg63[(3'h4):(1'h0)] ?
          {reg82} : (wire48 << reg75))) ^~ $signed(($unsigned(reg82) ?
          {reg73} : $signed(wire50)))) ~^ ($signed(($signed(wire52) >> (reg76 == (8'hb5)))) ?
          ($unsigned((-(8'haa))) - (8'hbd)) : (wire81[(1'h0):(1'h0)] < reg68)));
      reg92 <= $unsigned((({{reg73}, (~&reg66)} ?
              (8'hae) : ((8'hb6) & $unsigned(reg56))) ?
          wire53 : (8'hb4)));
    end
  assign wire93 = (+(wire50 ?
                      $unsigned({reg88[(3'h4):(1'h0)],
                          $unsigned(reg56)}) : (+(-reg72[(2'h2):(1'h1)]))));
  assign wire94 = ($unsigned(((reg69[(3'h4):(1'h0)] <<< $signed(reg55)) > $unsigned({reg58}))) ?
                      $unsigned(((reg67 & ((8'hbf) && reg87)) ?
                          $signed(reg73[(3'h6):(1'h1)]) : ({reg59, (8'hbf)} ?
                              (reg71 ?
                                  reg75 : reg62) : reg62))) : ($signed((8'hb9)) ~^ (!{wire93[(4'he):(3'h6)]})));
  always
    @(posedge clk) begin
      if (($signed(((8'hb7) != $signed((^(8'had))))) ^~ $unsigned((-(|$unsigned(reg91))))))
        begin
          reg95 <= ({$signed(reg69), wire51} ?
              reg82[(1'h0):(1'h0)] : (reg88 ?
                  $signed($signed((wire93 ~^ (8'hb9)))) : reg87));
        end
      else
        begin
          reg95 <= ((wire80[(4'hf):(4'h8)] ?
              (-$unsigned(reg60[(5'h12):(5'h11)])) : reg55) > {$signed(wire49)});
          reg96 <= $unsigned($unsigned((^$signed(((7'h40) ?
              wire49 : wire79)))));
          if ((!($signed(($unsigned(wire93) * (reg75 ? (8'ha4) : reg73))) ?
              reg65[(2'h2):(1'h1)] : (reg56 ? (~$signed(wire48)) : reg63))))
            begin
              reg97 <= wire94[(4'hf):(4'h9)];
              reg98 <= $signed(wire93);
              reg99 <= wire53[(3'h4):(2'h2)];
              reg100 <= (~|$signed(reg97));
            end
          else
            begin
              reg97 <= (~^reg63);
            end
          if (wire51[(3'h7):(3'h7)])
            begin
              reg101 <= {($signed(({reg98} >>> (reg67 & wire81))) ?
                      ((wire48[(4'he):(1'h1)] > {wire78}) ?
                          $signed(((8'ha1) & reg92)) : $unsigned($unsigned(reg90))) : (wire81[(3'h4):(2'h3)] ?
                          $signed(reg89[(4'ha):(4'h8)]) : reg76)),
                  (+(((reg67 < wire78) ?
                      reg69 : $unsigned(wire80)) < $unsigned((^~(8'ha3)))))};
              reg102 <= $signed((8'haf));
              reg103 <= ($unsigned((reg86 ?
                  reg99 : {(!(8'hbe))})) > reg66[(4'hd):(4'ha)]);
              reg104 <= $signed($unsigned((+(wire93[(5'h10):(4'he)] ?
                  (~&reg59) : reg66))));
              reg105 <= $signed((-($signed($signed(reg60)) == $signed(reg69))));
            end
          else
            begin
              reg101 <= (^wire50);
              reg102 <= (&($unsigned((reg100 ?
                  {reg67} : reg72)) == (~&$signed((wire49 >= reg90)))));
            end
        end
      reg106 <= (wire81 ? reg101[(1'h0):(1'h0)] : reg90);
      reg107 <= (reg58 ?
          (!{(8'hae), $signed($signed(wire81))}) : reg89[(4'h8):(1'h1)]);
    end
  assign wire108 = $unsigned((~reg96));
  assign wire109 = (^~$signed(($signed((-reg89)) | reg58[(1'h0):(1'h0)])));
  module110 #() modinst157 (wire156, clk, reg105, wire52, reg106, reg74);
endmodule

module module9
#(parameter param34 = ((&(((+(8'hba)) | ((8'ha4) && (8'haf))) | (~|{(8'hb6), (8'h9d)}))) << ((~^{{(8'ha6), (7'h43)}, (8'ha9)}) ~^ (~{((8'haa) | (8'hb0)), (&(8'ha9))}))))
(y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire13;
  input wire [(5'h15):(1'h0)] wire12;
  input wire signed [(2'h2):(1'h0)] wire11;
  input wire signed [(4'hb):(1'h0)] wire10;
  wire [(2'h3):(1'h0)] wire33;
  wire signed [(4'h9):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire31;
  wire [(4'he):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire14;
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(4'he):(1'h0)] reg28 = (1'h0);
  reg [(4'hd):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire14,
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
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire14 = $unsigned(wire12);
  always
    @(posedge clk) begin
      if ({{$signed(((wire13 && wire11) == $signed(wire11))),
              (&(wire10 ? $signed(wire13) : wire13[(4'h9):(3'h7)]))},
          $unsigned((!$signed((&wire12))))})
        begin
          if ($unsigned({(-((~(8'hbf)) ?
                  ((8'h9d) ? wire13 : (8'hac)) : (8'haf)))}))
            begin
              reg15 <= (($unsigned((^~(wire13 && wire10))) | wire13[(2'h3):(1'h1)]) | (&($signed({wire10,
                  (8'h9d)}) == $unsigned((|wire12)))));
              reg16 <= wire11;
              reg17 <= reg15[(4'h8):(3'h7)];
            end
          else
            begin
              reg15 <= $unsigned($signed($signed(((^~wire10) || reg15))));
              reg16 <= ((({(^~wire12)} ?
                          (wire13 == (reg17 ?
                              wire14 : wire10)) : $signed(reg17)) ?
                      ((~|$unsigned(wire14)) >> $unsigned($signed((8'ha9)))) : ($signed($signed((8'had))) >> ({reg17,
                          (8'ha7)} + (reg17 ? reg16 : wire12)))) ?
                  $signed(reg16[(3'h4):(1'h1)]) : reg15);
              reg17 <= wire11[(1'h0):(1'h0)];
            end
          reg18 <= (8'h9d);
          reg19 <= $unsigned($unsigned(wire11[(1'h1):(1'h1)]));
          reg20 <= reg19[(2'h2):(1'h1)];
        end
      else
        begin
          reg15 <= ({reg15,
              wire13[(4'hc):(4'ha)]} <<< (reg15[(2'h3):(1'h0)] > reg19));
          if ((&$unsigned(($unsigned({(8'hb4), wire10}) * ((reg19 ?
              reg16 : (7'h42)) >> $unsigned(wire14))))))
            begin
              reg16 <= $unsigned(($unsigned($unsigned((wire10 ?
                  reg19 : wire12))) || {wire11[(1'h1):(1'h1)]}));
              reg17 <= $unsigned(({(&wire11[(2'h2):(2'h2)])} ?
                  ($signed($unsigned(reg20)) && ($signed(wire10) >> $unsigned(reg15))) : ((+(-wire13)) ?
                      reg16 : (reg19[(3'h6):(1'h0)] ?
                          {wire11, reg19} : $signed(wire11)))));
            end
          else
            begin
              reg16 <= ($signed(wire13[(3'h4):(2'h3)]) - ({$signed($unsigned(wire14))} ?
                  reg19 : $unsigned((reg20[(3'h7):(3'h4)] ?
                      $signed(wire11) : (reg20 ^ reg18)))));
              reg17 <= $signed($signed((&{$unsigned(wire14)})));
              reg18 <= wire14;
              reg19 <= ((reg18[(3'h5):(2'h3)] - reg16[(4'h8):(2'h3)]) ?
                  $signed(({(~|reg18)} ?
                      (~wire14) : $unsigned(((8'hb6) <= reg17)))) : ($signed($unsigned((8'h9e))) ?
                      reg20[(4'hd):(3'h6)] : (+wire13[(3'h7):(2'h2)])));
            end
          if (reg16[(3'h5):(1'h1)])
            begin
              reg20 <= (((|({wire12} ? (+reg19) : (wire12 * reg20))) ?
                      wire13 : $signed(((~&wire10) + (~^reg15)))) ?
                  reg15[(4'hb):(4'ha)] : $signed($unsigned($signed($signed(wire10)))));
              reg21 <= {(&((~|(^wire10)) ?
                      ((^~reg18) <<< $signed((8'hb9))) : (~^$signed((8'hb9)))))};
            end
          else
            begin
              reg20 <= ((&reg15[(4'hb):(3'h7)]) < wire14[(4'h8):(4'h8)]);
              reg21 <= wire10;
              reg22 <= (&reg20);
              reg23 <= ((~&$signed($signed((reg20 ?
                  reg16 : reg18)))) + (wire13 != $unsigned(({reg19} << wire10))));
              reg24 <= ($unsigned(reg21) + reg16[(2'h3):(1'h1)]);
            end
          reg25 <= (&((reg24[(1'h1):(1'h0)] ?
              (^(reg22 ?
                  wire12 : (8'ha8))) : $signed(wire11[(1'h0):(1'h0)])) >= $unsigned(reg18[(3'h7):(1'h1)])));
        end
      reg26 <= (~^reg17);
      reg27 <= ($unsigned($unsigned(reg22[(5'h14):(1'h0)])) || $unsigned($unsigned(((~reg24) ?
          (wire14 && reg19) : reg16[(3'h5):(3'h4)]))));
      reg28 <= wire10;
      reg29 <= wire13[(2'h3):(2'h2)];
    end
  assign wire30 = $signed((8'h9e));
  assign wire31 = (&(($signed((reg26 >= wire12)) - reg20[(3'h4):(1'h0)]) ?
                      $unsigned(reg15[(4'hb):(1'h0)]) : (reg26[(3'h4):(3'h4)] ?
                          $signed((-(8'hb4))) : (wire13[(3'h5):(2'h2)] ?
                              $signed(reg22) : (reg24 ? wire12 : wire12)))));
  assign wire32 = {reg26};
  assign wire33 = $signed(reg29);
endmodule

module module110
#(parameter param154 = {((|({(8'haf)} ? {(7'h42), (8'hae)} : ((8'ha3) >>> (8'hb0)))) ? ((((7'h40) - (7'h43)) + (|(8'hab))) ? ((7'h43) ? ((7'h44) ? (8'hb1) : (8'h9c)) : (|(8'hb6))) : (((8'ha2) ? (8'ha6) : (8'hb7)) ? ((8'ha8) ? (8'hb0) : (8'hb9)) : (!(8'hbf)))) : ({(&(8'h9d))} - (8'hbd))), (((((8'h9f) <= (8'hbc)) && ((8'ha0) ? (8'hb9) : (8'hb8))) >= (+((8'hac) ? (7'h43) : (8'hba)))) ? (((+(8'hb6)) ? (~(8'h9d)) : ((8'ha4) ^~ (8'hbe))) ? {((8'ha0) >>> (8'ha1))} : (8'hac)) : (8'hb3))}, 
parameter param155 = param154)
(y, clk, wire114, wire113, wire112, wire111);
  output wire [(32'h16c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire114;
  input wire signed [(2'h3):(1'h0)] wire113;
  input wire signed [(5'h12):(1'h0)] wire112;
  input wire signed [(4'he):(1'h0)] wire111;
  wire signed [(5'h10):(1'h0)] wire153;
  wire [(4'he):(1'h0)] wire131;
  wire signed [(2'h3):(1'h0)] wire130;
  wire signed [(3'h5):(1'h0)] wire125;
  wire [(3'h6):(1'h0)] wire124;
  wire signed [(4'hc):(1'h0)] wire120;
  wire [(4'ha):(1'h0)] wire117;
  wire signed [(4'hc):(1'h0)] wire116;
  wire signed [(2'h2):(1'h0)] wire115;
  reg signed [(3'h5):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg150 = (1'h0);
  reg [(4'h9):(1'h0)] reg149 = (1'h0);
  reg [(4'h8):(1'h0)] reg148 = (1'h0);
  reg [(4'he):(1'h0)] reg147 = (1'h0);
  reg signed [(4'he):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg143 = (1'h0);
  reg [(2'h3):(1'h0)] reg142 = (1'h0);
  reg [(4'he):(1'h0)] reg141 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg140 = (1'h0);
  reg [(2'h3):(1'h0)] reg139 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg136 = (1'h0);
  reg [(5'h13):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg134 = (1'h0);
  reg [(4'he):(1'h0)] reg133 = (1'h0);
  reg [(4'he):(1'h0)] reg132 = (1'h0);
  reg [(2'h2):(1'h0)] reg129 = (1'h0);
  reg signed [(4'he):(1'h0)] reg128 = (1'h0);
  reg [(3'h7):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg126 = (1'h0);
  reg [(4'ha):(1'h0)] reg123 = (1'h0);
  reg [(4'ha):(1'h0)] reg122 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg121 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg119 = (1'h0);
  reg [(3'h4):(1'h0)] reg118 = (1'h0);
  assign y = {wire153,
                 wire131,
                 wire130,
                 wire125,
                 wire124,
                 wire120,
                 wire117,
                 wire116,
                 wire115,
                 reg152,
                 reg151,
                 reg150,
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
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg123,
                 reg122,
                 reg121,
                 reg119,
                 reg118,
                 (1'h0)};
  assign wire115 = $signed(wire111);
  assign wire116 = $unsigned(wire112);
  assign wire117 = $unsigned(wire111[(4'hc):(4'h8)]);
  always
    @(posedge clk) begin
      reg118 <= wire111[(4'hd):(3'h6)];
      reg119 <= $signed((~$signed((wire116 <<< wire117[(3'h4):(2'h3)]))));
    end
  assign wire120 = (((~((wire113 ? wire111 : wire116) ?
                           (8'hbe) : (wire111 ? wire114 : wire111))) ?
                       ({(~^wire117)} & ($signed(wire115) || (~^(7'h42)))) : $unsigned(wire116)) >= wire115[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg121 <= (~^($signed((8'hb2)) ? wire120 : (~&reg119)));
      reg122 <= ($unsigned(((wire113[(1'h1):(1'h1)] ?
              {reg119, reg119} : (wire117 ? wire117 : wire117)) & ((wire111 ?
                  (8'h9c) : reg119) ?
              $unsigned(reg118) : {(8'h9f), reg118}))) ?
          ($unsigned($signed($signed(wire116))) * $signed((((8'hb3) && wire111) != $signed(wire115)))) : $signed($signed((wire116[(2'h3):(2'h3)] || $signed(wire120)))));
      reg123 <= (~^wire112[(3'h6):(3'h5)]);
    end
  assign wire124 = $signed((wire116[(1'h1):(1'h1)] ?
                       wire111[(1'h0):(1'h0)] : (({wire117} ?
                           $signed(wire114) : (~wire113)) > (!$signed(reg123)))));
  assign wire125 = $signed(wire115[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      if (reg118[(1'h0):(1'h0)])
        begin
          reg126 <= $signed((({reg119[(1'h1):(1'h1)]} != $signed((7'h43))) ?
              {reg119[(1'h0):(1'h0)], {reg122[(1'h0):(1'h0)]}} : reg118));
          reg127 <= {(-reg122[(4'ha):(2'h3)]),
              (($unsigned($signed(reg119)) ?
                      (!{(8'hb0)}) : ({reg121} <= wire124[(3'h5):(3'h5)])) ?
                  $signed(reg119) : $unsigned($unsigned(wire117[(3'h7):(3'h7)])))};
          reg128 <= wire111;
        end
      else
        begin
          reg126 <= wire114;
          reg127 <= reg123;
          reg128 <= $signed($signed(wire125[(1'h1):(1'h0)]));
          reg129 <= (|$unsigned((wire120 + reg126[(3'h4):(2'h3)])));
        end
    end
  assign wire130 = $signed($signed({(~&(wire117 ? wire117 : (8'hbe))),
                       ((wire124 ? reg119 : (8'ha0)) ?
                           wire114[(4'ha):(4'h8)] : $signed(wire120))}));
  assign wire131 = ({wire115[(1'h0):(1'h0)], {wire113[(2'h3):(2'h3)]}} ?
                       $unsigned((8'hb2)) : $signed(reg119[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      if (($signed(($signed((wire116 ? reg129 : wire120)) ?
              reg129[(1'h0):(1'h0)] : ($unsigned(reg118) ?
                  (~reg118) : $unsigned(wire117)))) ?
          ($signed({wire112}) ?
              (|((+wire130) == reg119[(1'h1):(1'h0)])) : wire112[(2'h2):(2'h2)]) : wire111))
        begin
          reg132 <= wire124;
        end
      else
        begin
          if ($unsigned(wire115[(1'h1):(1'h0)]))
            begin
              reg132 <= {(^~wire113),
                  ((wire124 && wire125) ^~ {$unsigned(wire120[(4'hb):(2'h2)])})};
              reg133 <= ((8'h9d) && (reg123[(4'ha):(3'h4)] ?
                  (wire130[(2'h3):(2'h2)] <= ((wire115 << wire116) ?
                      $unsigned(reg118) : $unsigned(wire117))) : wire113));
              reg134 <= $unsigned(reg133[(4'hc):(4'hb)]);
              reg135 <= $signed($signed((|(~^(+wire117)))));
              reg136 <= wire116;
            end
          else
            begin
              reg132 <= $signed(($unsigned($unsigned(reg135[(5'h11):(4'h8)])) ?
                  wire111 : $signed((!(reg123 ? wire111 : (8'hb6))))));
            end
          reg137 <= $unsigned({reg133, reg119[(1'h1):(1'h0)]});
          reg138 <= reg119;
        end
      reg139 <= $signed($unsigned($signed((~reg118[(1'h0):(1'h0)]))));
      reg140 <= {$signed($unsigned($unsigned(reg127[(3'h5):(3'h4)]))), wire125};
      reg141 <= (($signed({$unsigned(wire113)}) <<< reg137[(2'h2):(1'h1)]) + wire117[(2'h3):(2'h2)]);
      if (reg135)
        begin
          if ((&{reg118[(2'h3):(2'h3)], $signed($signed($signed(wire112)))}))
            begin
              reg142 <= (((8'had) == reg138[(2'h2):(2'h2)]) >>> $unsigned(($unsigned($unsigned(reg134)) | (8'h9d))));
              reg143 <= reg127[(3'h4):(3'h4)];
              reg144 <= {((+{reg135}) ?
                      reg141[(2'h2):(1'h0)] : (~|((8'ha3) * reg138[(2'h3):(2'h3)])))};
              reg145 <= {wire130[(2'h3):(1'h1)], wire130};
              reg146 <= (((wire113[(2'h3):(1'h1)] ^~ wire125) ?
                      $signed($unsigned((reg118 || wire117))) : $unsigned($unsigned((reg138 < reg121)))) ?
                  $signed(((8'hb2) ?
                      reg127[(3'h7):(2'h2)] : $signed($signed(wire112)))) : $unsigned(wire113[(1'h0):(1'h0)]));
            end
          else
            begin
              reg142 <= (((7'h40) | ((((8'hb6) ?
                          reg133 : reg136) >> (reg136 << reg123)) ?
                      (|{(8'h9e)}) : ($unsigned(reg127) ?
                          (reg144 ?
                              wire116 : wire124) : wire120[(4'ha):(3'h4)]))) ?
                  reg143 : (~|wire111));
            end
          if (((|wire114[(3'h5):(1'h0)]) + $unsigned((((-reg140) > reg122[(3'h5):(1'h1)]) ?
              $unsigned({(8'ha7)}) : $unsigned((reg133 ? reg139 : (8'haf)))))))
            begin
              reg147 <= reg128;
              reg148 <= (((^~reg123[(3'h7):(3'h4)]) ?
                      reg135[(3'h4):(1'h0)] : {(reg128[(4'h9):(3'h6)] ?
                              $unsigned((8'hb0)) : (reg121 ? reg147 : reg122)),
                          reg138[(2'h3):(1'h1)]}) ?
                  (~^(-(~wire114))) : (|(((wire113 ?
                      reg138 : reg128) == $signed(wire130)) < $signed({(8'hbd),
                      reg123}))));
              reg149 <= wire111[(4'hb):(4'h9)];
            end
          else
            begin
              reg147 <= wire113[(2'h2):(1'h0)];
              reg148 <= reg134;
              reg149 <= (!reg121);
              reg150 <= reg126[(1'h1):(1'h1)];
              reg151 <= {$signed(wire114[(4'h8):(4'h8)])};
            end
          reg152 <= {reg122[(1'h1):(1'h0)],
              $unsigned((~&reg141[(4'hd):(3'h6)]))};
        end
      else
        begin
          reg142 <= (($unsigned(reg128[(2'h2):(1'h1)]) ?
              reg146 : (reg139 == (8'h9c))) < (~|(wire130[(1'h1):(1'h1)] | ($unsigned((7'h43)) ?
              (wire113 ? reg146 : reg149) : (7'h42)))));
          reg143 <= (({(reg150 ? (reg138 + (8'hb9)) : reg128[(3'h7):(1'h0)]),
                  $signed(reg123[(1'h1):(1'h1)])} ?
              (reg122 ?
                  reg135[(1'h1):(1'h1)] : ((|reg122) ?
                      {wire125} : (|reg122))) : (7'h43)) != {$unsigned(wire120[(4'hc):(1'h0)])});
        end
    end
  assign wire153 = $unsigned($signed($unsigned($unsigned($unsigned(wire116)))));
endmodule

module module223
#(parameter param232 = ((~&{(-((8'ha1) && (8'ha4)))}) - (({{(8'ha1)}, (-(7'h43))} ? (~^((8'ha6) & (8'haa))) : {(~^(8'hab)), ((8'hae) ? (8'hb0) : (8'hb7))}) ~^ ((((8'hb2) - (8'hac)) ? (^(8'hb2)) : {(8'hb3), (8'hbc)}) != (((8'hb1) || (7'h44)) != ((8'ha1) ? (8'hbc) : (8'hb0)))))), 
parameter param233 = (({(!(param232 ? param232 : param232)), ((param232 ? param232 : param232) >>> (+param232))} ? (+((param232 ? (8'ha5) : param232) - (param232 + param232))) : (((param232 ^~ param232) >= param232) ? (param232 ? (param232 || param232) : {param232, param232}) : param232)) ? param232 : param232))
(y, clk, wire227, wire226, wire225, wire224);
  output wire [(32'h30):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire227;
  input wire [(3'h7):(1'h0)] wire226;
  input wire [(4'h8):(1'h0)] wire225;
  input wire [(3'h5):(1'h0)] wire224;
  wire signed [(4'hd):(1'h0)] wire231;
  wire signed [(4'hd):(1'h0)] wire230;
  wire signed [(3'h5):(1'h0)] wire229;
  wire [(5'h10):(1'h0)] wire228;
  assign y = {wire231, wire230, wire229, wire228, (1'h0)};
  assign wire228 = (8'hb0);
  assign wire229 = (8'ha8);
  assign wire230 = (((-(!$signed((8'hb1)))) ?
                       ((((8'hbb) ~^ wire229) ?
                           wire226[(2'h3):(1'h0)] : (~&wire225)) + wire227[(3'h6):(1'h1)]) : wire226) + (-(+$unsigned((wire224 ?
                       wire228 : wire224)))));
  assign wire231 = wire226;
endmodule

module module202
#(parameter param217 = {{(&(((8'hb2) ? (7'h44) : (8'ha6)) ? (8'hb6) : ((8'hb7) ? (8'h9f) : (8'ha9))))}, ((^{((8'hb0) ? (8'ha1) : (8'ha9)), (~|(8'haf))}) ? ((((8'hbc) ? (7'h44) : (8'hb0)) && (|(8'hb1))) >> (((8'hbf) ? (8'hac) : (8'hbf)) == (!(8'hb9)))) : (~|(+(|(8'hac)))))})
(y, clk, wire206, wire205, wire204, wire203);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire206;
  input wire signed [(4'he):(1'h0)] wire205;
  input wire [(4'hb):(1'h0)] wire204;
  input wire [(2'h3):(1'h0)] wire203;
  wire [(4'h9):(1'h0)] wire216;
  wire [(2'h2):(1'h0)] wire215;
  wire [(3'h5):(1'h0)] wire214;
  wire [(5'h10):(1'h0)] wire213;
  wire signed [(2'h2):(1'h0)] wire212;
  wire [(3'h5):(1'h0)] wire211;
  wire [(2'h2):(1'h0)] wire210;
  wire signed [(5'h15):(1'h0)] wire209;
  wire [(3'h5):(1'h0)] wire208;
  wire signed [(5'h12):(1'h0)] wire207;
  assign y = {wire216,
                 wire215,
                 wire214,
                 wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire207,
                 (1'h0)};
  assign wire207 = ($signed({wire206[(4'he):(3'h4)]}) > {$signed($signed((8'ha1)))});
  assign wire208 = (^~wire206[(5'h15):(4'h8)]);
  assign wire209 = {(8'hb8)};
  assign wire210 = ($unsigned(((-$signed(wire203)) ?
                       {(wire209 ^~ wire208), $unsigned((8'haa))} : ((wire203 ?
                               wire209 : wire205) ?
                           $signed(wire208) : $signed(wire209)))) == $unsigned(wire209));
  assign wire211 = wire205;
  assign wire212 = $unsigned(wire208);
  assign wire213 = ((wire212[(1'h0):(1'h0)] > $unsigned((^{wire208}))) ?
                       wire210[(1'h0):(1'h0)] : (+((wire203 ?
                           $unsigned(wire206) : (~&wire208)) - wire203)));
  assign wire214 = (&wire207);
  assign wire215 = ((((wire211[(3'h5):(3'h5)] ?
                           {wire212} : (~|wire208)) | $unsigned($unsigned(wire210))) ?
                       wire204[(4'h8):(4'h8)] : wire210[(1'h0):(1'h0)]) + (^($unsigned(wire212) >= $signed($unsigned(wire203)))));
  assign wire216 = (8'hb1);
endmodule

module module167
#(parameter param189 = ({(~^(&((8'hb3) ? (8'ha9) : (8'hb3)))), ({((8'ha6) || (8'hbd)), {(8'hb3)}} >= (^~(-(8'hbb))))} ? (!((!((8'ha9) ? (8'hb4) : (8'hb6))) - ((^~(8'hab)) >= (8'had)))) : ((~&((^(8'ha5)) >> ((7'h41) + (8'haf)))) > {(^{(8'ha1)}), (((8'hb6) ? (8'hb7) : (8'h9c)) ^ (^~(8'hbf)))})))
(y, clk, wire172, wire171, wire170, wire169, wire168);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire172;
  input wire signed [(3'h6):(1'h0)] wire171;
  input wire [(4'hf):(1'h0)] wire170;
  input wire [(5'h14):(1'h0)] wire169;
  input wire signed [(5'h11):(1'h0)] wire168;
  wire [(3'h4):(1'h0)] wire188;
  wire [(4'h8):(1'h0)] wire187;
  wire signed [(3'h6):(1'h0)] wire186;
  wire [(4'hc):(1'h0)] wire185;
  wire signed [(3'h5):(1'h0)] wire175;
  wire signed [(5'h13):(1'h0)] wire174;
  wire signed [(5'h11):(1'h0)] wire173;
  reg signed [(4'he):(1'h0)] reg184 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg183 = (1'h0);
  reg [(5'h12):(1'h0)] reg182 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg181 = (1'h0);
  reg [(3'h6):(1'h0)] reg180 = (1'h0);
  reg [(2'h2):(1'h0)] reg179 = (1'h0);
  reg [(5'h14):(1'h0)] reg178 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg177 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg176 = (1'h0);
  assign y = {wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire175,
                 wire174,
                 wire173,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 (1'h0)};
  assign wire173 = $signed(((wire169[(4'h9):(2'h3)] ?
                       ((&wire168) + wire169[(4'hc):(4'ha)]) : wire172[(4'h9):(3'h4)]) == $signed((wire168 >= wire169[(4'he):(2'h2)]))));
  assign wire174 = ({(wire172[(4'hb):(4'ha)] < wire172[(4'hc):(2'h3)]),
                           $unsigned((^$signed(wire173)))} ?
                       wire168 : (wire169[(2'h3):(1'h0)] | {wire168[(5'h10):(4'hc)]}));
  assign wire175 = $unsigned($signed(wire172[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg176 <= (!wire174);
      reg177 <= wire173;
      reg178 <= wire174;
    end
  always
    @(posedge clk) begin
      if ((wire168 >= wire174))
        begin
          if (reg177)
            begin
              reg179 <= (wire171 && (8'haf));
              reg180 <= $signed($unsigned((+((~|wire171) ?
                  $unsigned(wire175) : (wire168 + wire169)))));
            end
          else
            begin
              reg179 <= $signed(({((wire171 ?
                      wire170 : wire169) != (~^reg178))} & reg180[(3'h6):(2'h2)]));
              reg180 <= {(((wire168[(4'h9):(4'h9)] ?
                      (8'ha6) : (wire169 ?
                          (8'h9f) : reg178)) != ($unsigned((8'hbc)) << (wire172 ?
                      wire168 : wire173))) <<< (8'hbb)),
                  $unsigned((|(-(wire168 == (8'ha9)))))};
            end
          reg181 <= wire170[(4'h8):(2'h3)];
          reg182 <= $unsigned(reg180[(2'h2):(1'h0)]);
          reg183 <= reg177[(4'h9):(3'h5)];
        end
      else
        begin
          reg179 <= ((|$unsigned($signed((reg183 <<< reg180)))) ?
              ((!reg179[(2'h2):(2'h2)]) ?
                  wire170[(4'hc):(1'h0)] : (^~reg177[(1'h1):(1'h1)])) : reg183);
          reg180 <= ((~&$unsigned($signed((wire174 == reg177)))) * {{$signed($unsigned(wire174))},
              (~$unsigned($signed((8'hbe))))});
          reg181 <= $signed(reg177);
          reg182 <= $signed((wire170 >> (~$signed(wire170[(1'h0):(1'h0)]))));
        end
      reg184 <= $unsigned(reg176);
    end
  assign wire185 = ((~^wire169) ?
                       ($unsigned(({reg176, reg182} ?
                               (reg182 * reg178) : $unsigned(wire169))) ?
                           reg177 : $signed($unsigned($signed(reg183)))) : $signed((~^$unsigned($unsigned(reg177)))));
  assign wire186 = wire173;
  assign wire187 = reg183[(3'h4):(3'h4)];
  assign wire188 = reg179;
endmodule
