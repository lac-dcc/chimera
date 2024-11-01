module top
#(parameter param310 = (8'ha6))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h202):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire4;
  wire [(3'h4):(1'h0)] wire308;
  wire signed [(4'hd):(1'h0)] wire304;
  wire signed [(5'h12):(1'h0)] wire302;
  wire [(2'h3):(1'h0)] wire301;
  wire signed [(5'h13):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire83;
  wire signed [(5'h13):(1'h0)] wire270;
  wire [(3'h4):(1'h0)] wire272;
  wire [(4'hb):(1'h0)] wire273;
  wire [(4'h9):(1'h0)] wire274;
  wire [(4'hb):(1'h0)] wire275;
  wire signed [(5'h11):(1'h0)] wire276;
  wire signed [(4'hc):(1'h0)] wire299;
  reg signed [(5'h10):(1'h0)] reg307 = (1'h0);
  reg [(3'h6):(1'h0)] reg306 = (1'h0);
  reg [(4'ha):(1'h0)] reg305 = (1'h0);
  reg [(5'h11):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg86 = (1'h0);
  reg [(3'h4):(1'h0)] reg277 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg278 = (1'h0);
  reg [(5'h11):(1'h0)] reg279 = (1'h0);
  reg [(5'h14):(1'h0)] reg280 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg281 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg282 = (1'h0);
  reg [(4'ha):(1'h0)] reg283 = (1'h0);
  reg [(5'h10):(1'h0)] reg284 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg285 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg286 = (1'h0);
  reg [(5'h13):(1'h0)] reg287 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg288 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg289 = (1'h0);
  reg [(4'hf):(1'h0)] reg290 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg291 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg292 = (1'h0);
  reg [(5'h11):(1'h0)] reg293 = (1'h0);
  reg [(4'hb):(1'h0)] reg294 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg295 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg296 = (1'h0);
  reg [(4'hb):(1'h0)] reg297 = (1'h0);
  reg [(5'h13):(1'h0)] reg298 = (1'h0);
  assign y = {wire308,
                 wire304,
                 wire302,
                 wire301,
                 wire5,
                 wire6,
                 wire7,
                 wire83,
                 wire270,
                 wire272,
                 wire273,
                 wire274,
                 wire275,
                 wire276,
                 wire299,
                 reg307,
                 reg306,
                 reg305,
                 reg85,
                 reg86,
                 reg277,
                 reg278,
                 reg279,
                 reg280,
                 reg281,
                 reg282,
                 reg283,
                 reg284,
                 reg285,
                 reg286,
                 reg287,
                 reg288,
                 reg289,
                 reg290,
                 reg291,
                 reg292,
                 reg293,
                 reg294,
                 reg295,
                 reg296,
                 reg297,
                 reg298,
                 (1'h0)};
  assign wire5 = wire2[(1'h1):(1'h0)];
  assign wire6 = $signed((wire2[(3'h6):(1'h1)] >= wire4[(1'h0):(1'h0)]));
  assign wire7 = (wire0[(4'hb):(4'h8)] ?
                     (^~(|$unsigned(wire2))) : $signed(($unsigned((|(8'hb9))) ?
                         (((8'hb6) << wire2) ~^ $unsigned(wire5)) : $unsigned($unsigned((8'hab))))));
  module8 #() modinst84 (.wire9(wire2), .wire10(wire6), .clk(clk), .y(wire83), .wire11(wire5), .wire12(wire7));
  always
    @(posedge clk) begin
      reg85 <= wire5[(4'ha):(3'h7)];
      reg86 <= (~^$unsigned(wire7));
    end
  module87 #() modinst271 (wire270, clk, reg85, reg86, wire4, wire1);
  assign wire272 = ($unsigned(wire6[(5'h10):(4'hc)]) ?
                       $signed(wire1[(1'h1):(1'h0)]) : (($unsigned((wire7 ?
                               reg85 : wire1)) ?
                           (7'h40) : ($signed(reg86) ?
                               reg86[(4'hd):(3'h6)] : (~wire4))) ^ {wire2[(3'h5):(2'h3)],
                           $unsigned(wire3[(3'h4):(2'h3)])}));
  assign wire273 = wire2;
  assign wire274 = $unsigned({({$unsigned((8'ha4))} * $unsigned(wire7[(3'h5):(1'h1)])),
                       wire270});
  assign wire275 = wire4;
  assign wire276 = $signed(wire83[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      if (((!(((wire3 ^ wire6) ^ (wire273 == reg86)) ?
          {(8'hbd), $signed(wire274)} : ($unsigned(wire270) ?
              {wire4, (8'hb1)} : (wire270 ? wire275 : wire274)))) != wire83))
        begin
          reg277 <= (|(((reg86 * (~^(8'hbd))) ?
              wire274[(2'h2):(1'h1)] : ({wire276, wire1} ?
                  $signed(wire4) : (~|wire1))) >= wire2[(3'h5):(1'h1)]));
        end
      else
        begin
          reg277 <= wire6[(5'h10):(4'he)];
          if ((^(($unsigned((^(8'hbb))) ?
              $signed($signed((8'hbf))) : (wire273 ?
                  wire83[(3'h6):(1'h0)] : wire276[(1'h0):(1'h0)])) && wire270[(4'h9):(1'h1)])))
            begin
              reg278 <= ((^~{$signed($unsigned(wire5))}) > ({$signed(((8'hac) <= wire276)),
                      (^~(8'hbd))} ?
                  {($signed(wire5) ? wire274 : (+wire3))} : (((wire5 ?
                          wire275 : wire5) ?
                      (!reg277) : wire0) > ((8'hae) ?
                      wire270[(5'h13):(5'h11)] : (wire0 ?
                          (8'hb4) : wire270)))));
              reg279 <= ((~^wire1[(2'h2):(2'h2)]) >>> wire6);
              reg280 <= wire270;
              reg281 <= (8'hbf);
            end
          else
            begin
              reg278 <= $signed(wire272);
              reg279 <= $unsigned(((((wire2 | wire1) ?
                  (reg279 ? wire275 : wire0) : {wire4,
                      reg281}) >= $signed(reg278[(3'h4):(1'h1)])) == $unsigned((wire0 <= wire273))));
              reg280 <= {wire275[(3'h6):(1'h0)],
                  (~&$signed($unsigned({wire1, reg278})))};
            end
          if ((^~(reg86 + (wire5 <<< wire270[(4'ha):(4'h9)]))))
            begin
              reg282 <= wire274[(2'h2):(1'h0)];
            end
          else
            begin
              reg282 <= wire6[(2'h3):(1'h1)];
              reg283 <= wire273[(1'h1):(1'h1)];
              reg284 <= ({reg281,
                  (^~(reg281 && (!wire270)))} << $unsigned((wire272[(1'h1):(1'h1)] != reg277[(2'h2):(1'h0)])));
            end
          if (wire5[(3'h5):(1'h0)])
            begin
              reg285 <= (~^$signed($signed((^((8'hbd) | (8'hb8))))));
              reg286 <= (~|$unsigned(reg280[(4'ha):(2'h2)]));
              reg287 <= ({((8'ha1) ? wire272 : wire270[(1'h1):(1'h0)]),
                      ($unsigned(reg86) != reg280[(4'hc):(2'h3)])} ?
                  wire275 : (&($signed({wire1}) >>> (reg286[(3'h5):(3'h5)] ?
                      (7'h43) : $signed((8'hb8))))));
              reg288 <= {(reg286[(3'h7):(1'h0)] ?
                      $unsigned((reg285 ?
                          (-wire7) : wire3)) : (+wire3[(3'h5):(2'h3)])),
                  (($unsigned($signed((8'ha2))) < ($signed(wire270) ?
                          (reg283 ? reg277 : wire4) : reg279[(4'he):(4'h8)])) ?
                      $unsigned(reg284) : $signed($signed($unsigned(wire2))))};
            end
          else
            begin
              reg285 <= reg285;
            end
        end
      reg289 <= ($unsigned((~|$signed(reg280))) ?
          $unsigned($unsigned(((8'ha0) != ((8'ha7) ?
              reg285 : wire276)))) : (((wire7[(3'h7):(3'h4)] ?
                  $signed(reg285) : wire270) <<< ($signed(wire0) * {reg285,
                  wire273})) ?
              (+$signed((!(8'ha5)))) : reg285));
      reg290 <= reg281;
      if ($unsigned(reg277[(2'h3):(1'h0)]))
        begin
          reg291 <= ($unsigned($unsigned(((wire83 ?
              reg281 : wire272) ^ $signed(wire7)))) + wire2);
        end
      else
        begin
          if ((wire0 == $signed($unsigned(reg289[(4'hf):(4'hb)]))))
            begin
              reg291 <= $unsigned($unsigned(wire275[(4'h8):(3'h4)]));
            end
          else
            begin
              reg291 <= reg280;
              reg292 <= (wire273 ?
                  $signed((reg86 < {(^reg284)})) : wire0[(1'h0):(1'h0)]);
              reg293 <= $unsigned($signed((((wire273 ?
                      reg86 : reg278) * {reg285}) ?
                  (~^(8'hbe)) : $signed(reg283[(2'h2):(1'h0)]))));
              reg294 <= $signed($signed($unsigned({{(7'h44), wire274}})));
            end
          if (({((reg280[(4'hb):(1'h1)] ?
                      (reg282 * reg286) : (reg283 != reg289)) ?
                  ($signed(reg286) ? (!wire2) : $signed(wire274)) : ((|reg289) ?
                      (-wire6) : wire6[(3'h7):(3'h4)]))} ^ reg286))
            begin
              reg295 <= reg280[(5'h13):(4'hf)];
            end
          else
            begin
              reg295 <= (reg85[(3'h5):(3'h5)] || ($unsigned(reg282[(1'h0):(1'h0)]) ?
                  (&((7'h41) - $unsigned(reg288))) : $signed(($unsigned(wire270) ?
                      (wire1 ^~ reg285) : $signed((8'hab))))));
              reg296 <= {wire275[(2'h2):(1'h0)]};
            end
          reg297 <= $signed(wire273[(3'h6):(3'h4)]);
        end
      reg298 <= {(wire4 ?
              (-$signed(reg289[(4'hd):(4'ha)])) : $signed(wire270))};
    end
  module46 #() modinst300 (wire299, clk, wire274, wire1, wire0, reg287);
  assign wire301 = (($signed(((wire1 < (8'haf)) <= {reg295})) ~^ ({(wire5 <<< reg286),
                               (-wire6)} ?
                           $signed(wire6) : $unsigned($signed(wire0)))) ?
                       (wire3 ?
                           {reg295[(1'h0):(1'h0)],
                               reg279[(1'h1):(1'h0)]} : reg294[(2'h3):(1'h0)]) : reg278);
  module139 #() modinst303 (wire302, clk, reg279, wire270, reg298, wire4);
  assign wire304 = wire7[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      reg305 <= (~^($unsigned((!(reg289 + wire3))) ?
          (^~$signed((reg294 ?
              reg277 : reg86))) : $signed($signed($signed(reg279)))));
    end
  always
    @(posedge clk) begin
      reg306 <= $signed($unsigned($unsigned((~|(reg86 >> reg281)))));
      reg307 <= $signed((~(&$unsigned(wire274[(3'h6):(3'h4)]))));
    end
  module139 #() modinst309 (.wire141(wire83), .wire143(wire2), .wire140(reg297), .wire142(reg295), .y(wire308), .clk(clk));
endmodule

module module87  (y, clk, wire88, wire89, wire90, wire91);
  output wire [(32'h561):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire88;
  input wire signed [(4'hd):(1'h0)] wire89;
  input wire signed [(3'h7):(1'h0)] wire90;
  input wire signed [(3'h5):(1'h0)] wire91;
  wire signed [(2'h3):(1'h0)] wire264;
  wire [(3'h4):(1'h0)] wire263;
  wire [(5'h10):(1'h0)] wire241;
  wire signed [(5'h14):(1'h0)] wire224;
  wire signed [(5'h14):(1'h0)] wire176;
  wire signed [(2'h2):(1'h0)] wire158;
  wire [(5'h15):(1'h0)] wire157;
  wire signed [(5'h13):(1'h0)] wire156;
  wire [(5'h15):(1'h0)] wire101;
  wire [(3'h6):(1'h0)] wire114;
  wire [(4'h9):(1'h0)] wire115;
  wire [(4'hc):(1'h0)] wire154;
  wire [(3'h7):(1'h0)] wire190;
  wire [(4'h9):(1'h0)] wire222;
  reg signed [(4'h9):(1'h0)] reg269 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg268 = (1'h0);
  reg [(3'h5):(1'h0)] reg267 = (1'h0);
  reg [(4'h8):(1'h0)] reg266 = (1'h0);
  reg [(3'h5):(1'h0)] reg265 = (1'h0);
  reg [(5'h11):(1'h0)] reg262 = (1'h0);
  reg [(4'hd):(1'h0)] reg261 = (1'h0);
  reg [(3'h6):(1'h0)] reg260 = (1'h0);
  reg [(3'h5):(1'h0)] reg259 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg258 = (1'h0);
  reg [(4'hb):(1'h0)] reg257 = (1'h0);
  reg [(3'h4):(1'h0)] reg256 = (1'h0);
  reg [(4'ha):(1'h0)] reg255 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg254 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg253 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg252 = (1'h0);
  reg [(4'he):(1'h0)] reg251 = (1'h0);
  reg [(5'h13):(1'h0)] reg250 = (1'h0);
  reg [(4'hc):(1'h0)] reg249 = (1'h0);
  reg [(5'h13):(1'h0)] reg248 = (1'h0);
  reg [(4'hc):(1'h0)] reg247 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg246 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg245 = (1'h0);
  reg [(4'hc):(1'h0)] reg244 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg243 = (1'h0);
  reg [(5'h14):(1'h0)] reg242 = (1'h0);
  reg [(5'h10):(1'h0)] reg240 = (1'h0);
  reg [(5'h12):(1'h0)] reg239 = (1'h0);
  reg [(3'h5):(1'h0)] reg238 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg237 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg236 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg235 = (1'h0);
  reg [(5'h15):(1'h0)] reg234 = (1'h0);
  reg [(3'h6):(1'h0)] reg233 = (1'h0);
  reg [(5'h14):(1'h0)] reg232 = (1'h0);
  reg [(4'hc):(1'h0)] reg231 = (1'h0);
  reg [(4'he):(1'h0)] reg230 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg229 = (1'h0);
  reg signed [(4'he):(1'h0)] reg228 = (1'h0);
  reg [(4'h8):(1'h0)] reg227 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg226 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg225 = (1'h0);
  reg [(5'h10):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg93 = (1'h0);
  reg [(4'h9):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg97 = (1'h0);
  reg [(5'h10):(1'h0)] reg98 = (1'h0);
  reg [(5'h14):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg100 = (1'h0);
  reg [(3'h7):(1'h0)] reg102 = (1'h0);
  reg signed [(4'he):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg104 = (1'h0);
  reg [(5'h15):(1'h0)] reg105 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg106 = (1'h0);
  reg [(3'h7):(1'h0)] reg107 = (1'h0);
  reg [(5'h15):(1'h0)] reg108 = (1'h0);
  reg [(5'h15):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg113 = (1'h0);
  reg [(3'h5):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg120 = (1'h0);
  reg [(3'h6):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg124 = (1'h0);
  reg [(5'h12):(1'h0)] reg125 = (1'h0);
  reg [(5'h12):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg128 = (1'h0);
  reg [(4'hf):(1'h0)] reg129 = (1'h0);
  reg [(5'h13):(1'h0)] reg130 = (1'h0);
  reg [(2'h2):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg132 = (1'h0);
  reg [(4'he):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg134 = (1'h0);
  reg [(4'hb):(1'h0)] reg135 = (1'h0);
  reg [(5'h12):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg137 = (1'h0);
  reg [(3'h5):(1'h0)] reg138 = (1'h0);
  reg [(4'he):(1'h0)] reg178 = (1'h0);
  reg [(5'h10):(1'h0)] reg179 = (1'h0);
  reg [(4'he):(1'h0)] reg180 = (1'h0);
  reg [(4'hb):(1'h0)] reg181 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg182 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg184 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg185 = (1'h0);
  reg [(3'h7):(1'h0)] reg186 = (1'h0);
  reg [(5'h10):(1'h0)] reg187 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg188 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg189 = (1'h0);
  assign y = {wire264,
                 wire263,
                 wire241,
                 wire224,
                 wire176,
                 wire158,
                 wire157,
                 wire156,
                 wire101,
                 wire114,
                 wire115,
                 wire154,
                 wire190,
                 wire222,
                 reg269,
                 reg268,
                 reg267,
                 reg266,
                 reg265,
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
                 reg240,
                 reg239,
                 reg238,
                 reg237,
                 reg236,
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
                 reg92,
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 reg99,
                 reg100,
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
                 reg112,
                 reg113,
                 reg116,
                 reg117,
                 reg118,
                 reg119,
                 reg120,
                 reg121,
                 reg122,
                 reg123,
                 reg124,
                 reg125,
                 reg126,
                 reg127,
                 reg128,
                 reg129,
                 reg130,
                 reg131,
                 reg132,
                 reg133,
                 reg134,
                 reg135,
                 reg136,
                 reg137,
                 reg138,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire91[(3'h5):(1'h1)])
        begin
          reg92 <= ($signed(wire91[(2'h2):(1'h1)]) <= (wire91[(2'h2):(1'h0)] ~^ (wire88[(3'h7):(1'h0)] != (~(wire90 ^ wire91)))));
          reg93 <= $signed((|($unsigned($unsigned(wire89)) ? wire90 : wire88)));
          reg94 <= ((8'hb8) || $signed(wire89[(2'h3):(1'h0)]));
        end
      else
        begin
          reg92 <= wire90;
          if ($signed($signed(wire88[(1'h0):(1'h0)])))
            begin
              reg93 <= $signed(wire90);
              reg94 <= reg92;
              reg95 <= reg94[(4'h9):(2'h3)];
              reg96 <= $unsigned($signed((&(|reg93))));
            end
          else
            begin
              reg93 <= wire90;
            end
          reg97 <= $unsigned(reg94[(2'h3):(2'h3)]);
          reg98 <= ((!reg94) ?
              ($unsigned({wire90, $signed(reg95)}) == {$signed((reg97 ?
                      wire91 : wire89))}) : (&reg95));
        end
      reg99 <= $unsigned($signed((8'ha9)));
      reg100 <= {{{$signed({reg99, (8'hac)}), reg94[(2'h2):(1'h1)]},
              (wire89 <= $unsigned((wire88 ? reg95 : reg95)))},
          reg93[(2'h2):(2'h2)]};
    end
  assign wire101 = {(((!wire91) ? (~|{reg99, reg93}) : reg95[(1'h0):(1'h0)]) ?
                           {(|reg94)} : $signed(((^~reg98) <= (reg95 < (8'hbb))))),
                       ($signed(($signed((8'ha2)) ?
                           $signed(wire88) : $unsigned((8'ha1)))) | ($unsigned((reg100 <= (8'hbe))) ?
                           (reg100[(1'h1):(1'h1)] ?
                               reg93[(1'h0):(1'h0)] : {reg92,
                                   reg93}) : reg99[(4'hb):(2'h2)]))};
  always
    @(posedge clk) begin
      if (reg97)
        begin
          reg102 <= ((&(~&{(-reg95)})) << wire88);
        end
      else
        begin
          reg102 <= (~^$signed((reg93 - $signed({wire90}))));
          if (($unsigned((((wire90 ? wire90 : wire90) ? wire88 : (8'hbf)) ?
                  ((~&reg100) >>> reg96) : (wire88[(4'ha):(3'h6)] ?
                      (8'h9c) : (wire101 | reg94)))) ?
              reg99 : ((wire88[(3'h7):(3'h4)] <= {reg96,
                  (+wire88)}) >>> (wire88 ?
                  $unsigned((wire91 ? reg100 : reg99)) : reg102))))
            begin
              reg103 <= (($unsigned(reg96) + (^((wire89 <= reg93) ?
                      {(8'hab)} : reg92[(3'h5):(2'h2)]))) ?
                  reg102[(3'h5):(3'h4)] : $signed({($unsigned(reg92) ?
                          $unsigned(reg96) : reg94[(4'h8):(2'h2)]),
                      (wire101 ? (reg98 ^ reg102) : $signed(reg94))}));
              reg104 <= (&$signed(($unsigned(reg98[(3'h5):(3'h5)]) ?
                  reg103[(4'he):(4'ha)] : ((reg95 ? reg99 : (8'hb2)) ?
                      $signed((7'h44)) : reg102))));
              reg105 <= wire90[(3'h7):(3'h7)];
              reg106 <= $signed(reg102[(1'h1):(1'h1)]);
              reg107 <= reg106[(1'h0):(1'h0)];
            end
          else
            begin
              reg103 <= (|(8'hb4));
              reg104 <= reg104[(1'h0):(1'h0)];
              reg105 <= (reg93 == (&(+reg102)));
              reg106 <= $signed(wire101);
            end
          reg108 <= ((8'ha1) > {(+$signed(wire101))});
          reg109 <= (~|reg107[(3'h4):(3'h4)]);
          if ((reg95[(3'h5):(3'h4)] & (wire91[(1'h1):(1'h0)] >> ((reg104 ~^ (reg98 || (7'h41))) <= (7'h40)))))
            begin
              reg110 <= {(reg102 ?
                      (^~(|$unsigned(reg94))) : reg97[(3'h5):(1'h1)]),
                  reg93};
              reg111 <= (wire101[(3'h7):(2'h2)] ?
                  (reg110 ^ $unsigned(reg107)) : reg105[(5'h11):(3'h7)]);
            end
          else
            begin
              reg110 <= $signed($signed(reg106));
              reg111 <= ((reg99[(3'h6):(2'h3)] || $unsigned((wire91[(1'h1):(1'h1)] > reg103[(1'h0):(1'h0)]))) ?
                  (+{{{(8'hb0), wire90}, (^wire91)},
                      $unsigned($signed((8'hab)))}) : $unsigned($signed(({reg111} ?
                      $signed(reg106) : $unsigned(reg97)))));
              reg112 <= ((reg94 ?
                      ({wire89[(3'h4):(2'h2)], reg97[(3'h5):(3'h5)]} ?
                          wire90 : ((~^wire101) == reg110[(3'h5):(1'h1)])) : (reg103 >> ((reg99 ^ reg103) ?
                          (&reg108) : reg93))) ?
                  wire91 : (((reg102[(2'h3):(1'h1)] & reg98) ^ $unsigned($unsigned(reg94))) ?
                      ($unsigned(reg104) <= reg103[(1'h1):(1'h0)]) : reg110[(1'h0):(1'h0)]));
              reg113 <= (^~(reg95 ?
                  $unsigned({(reg92 ? reg95 : (8'hbe))}) : ($unsigned((reg98 ?
                      reg103 : wire89)) & ((reg97 * reg96) ?
                      {wire88, wire101} : $signed(reg109)))));
            end
        end
    end
  assign wire114 = wire90;
  assign wire115 = $unsigned((($signed($unsigned(reg96)) ?
                           reg97[(4'he):(1'h1)] : $unsigned((&(8'hb4)))) ?
                       wire114 : {$unsigned(((8'h9c) & reg103))}));
  always
    @(posedge clk) begin
      reg116 <= ({$signed((^~(reg97 >= reg107))),
              ($unsigned((reg107 ? reg103 : (8'h9e))) ?
                  ((wire101 ^~ reg94) ?
                      reg113[(1'h1):(1'h1)] : $unsigned(reg95)) : wire101)} ?
          (reg99 ?
              $signed($signed(reg99)) : reg105) : $unsigned(reg110[(2'h2):(1'h1)]));
      if (reg106[(1'h0):(1'h0)])
        begin
          reg117 <= ($signed($signed(reg112)) ?
              ({((reg105 ? reg99 : wire115) ?
                          (wire114 ? wire101 : (8'h9e)) : (wire115 & wire90)),
                      $unsigned(reg93[(1'h0):(1'h0)])} ?
                  $unsigned($unsigned(wire89[(4'h9):(1'h1)])) : $signed($signed($signed(wire89)))) : {{reg108[(4'h8):(3'h6)],
                      reg111},
                  (wire114 ? $unsigned($signed(reg109)) : (+{(7'h43)}))});
          reg118 <= ($unsigned($signed($signed((reg95 >>> (8'ha0))))) ?
              ((reg104 ?
                      $unsigned((reg93 ?
                          reg105 : reg97)) : (~^$signed(reg99))) ?
                  (((wire101 ?
                      (8'ha6) : reg96) < (|reg94)) && (+$unsigned(reg102))) : reg100[(3'h5):(2'h3)]) : (|({$signed(reg102)} >> $signed((reg110 * reg109)))));
        end
      else
        begin
          reg117 <= (reg102 >> $unsigned($signed(((+wire115) <<< (wire88 < reg102)))));
          reg118 <= ((({$unsigned(wire114),
              $signed(reg116)} + (reg96[(1'h1):(1'h1)] ?
              reg117[(3'h4):(3'h4)] : reg112)) <<< reg102[(2'h3):(1'h0)]) <= ($unsigned(reg112[(2'h3):(1'h1)]) ?
              wire114[(3'h5):(3'h5)] : (8'ha7)));
          reg119 <= (reg104 ? reg103 : reg103[(2'h3):(1'h0)]);
          reg120 <= ((reg112 ?
              (~|{$signed(reg102),
                  {reg106}}) : (-$signed($unsigned((8'ha2))))) < {$unsigned(reg108[(3'h6):(3'h6)])});
          if ((~|({$unsigned((^reg112)), $signed((reg106 <<< reg99))} ?
              reg120[(4'h8):(3'h4)] : (reg97[(2'h2):(2'h2)] - reg104[(4'h9):(2'h2)]))))
            begin
              reg121 <= {wire89[(3'h4):(2'h3)]};
              reg122 <= (8'hbc);
              reg123 <= (((!(reg105 ^~ $unsigned(reg103))) >= $unsigned((reg103[(3'h5):(2'h3)] ?
                      $unsigned(reg121) : (8'h9e)))) ?
                  {wire114} : (^~((reg93 >> (^reg113)) ?
                      ((reg121 || reg119) <<< {reg109,
                          reg92}) : $unsigned($signed(reg104)))));
            end
          else
            begin
              reg121 <= $signed(wire101[(4'he):(3'h4)]);
              reg122 <= $unsigned((-($signed((reg123 ?
                  wire101 : reg119)) != (8'hbb))));
              reg123 <= (-wire114);
              reg124 <= $unsigned($unsigned(wire90[(3'h4):(1'h1)]));
            end
        end
      if ((^(^~(wire115[(2'h2):(1'h0)] <= ({wire115, (7'h42)} ?
          $unsigned(reg107) : $signed(reg103))))))
        begin
          reg125 <= ({(reg112 ?
                      reg116[(3'h5):(1'h0)] : ((reg113 | wire114) >= (reg117 <<< reg92))),
                  $unsigned((reg92[(3'h5):(1'h0)] ?
                      $unsigned(wire88) : $unsigned(wire90)))} ?
              ((!$signed($unsigned(reg95))) ?
                  (($unsigned(reg97) ^~ ((7'h40) ? reg102 : (8'haa))) ?
                      (^~(reg97 ?
                          reg97 : reg108)) : reg113) : ((&$signed(reg107)) << (^~{reg102,
                      reg122}))) : (reg112[(2'h2):(2'h2)] ^ ($signed((!reg96)) ?
                  (&(reg120 <= reg117)) : $signed($unsigned((8'h9d))))));
          reg126 <= reg109;
          reg127 <= $signed((+reg113));
          reg128 <= {$unsigned((~^reg112)),
              (($unsigned(reg118[(4'h8):(4'h8)]) ?
                      ($signed((8'ha2)) ?
                          (wire90 ?
                              reg109 : wire88) : (reg124 && reg127)) : (reg116 ?
                          wire114 : (~&reg118))) ?
                  {(+(reg122 ? reg102 : reg111))} : (+($signed(reg116) ?
                      {reg98, reg104} : reg106[(1'h1):(1'h0)])))};
          if (($signed(((~|$unsigned(reg128)) ^~ $signed(((8'ha5) ?
              reg108 : reg121)))) || {$unsigned($signed($signed(wire101)))}))
            begin
              reg129 <= reg107[(1'h1):(1'h0)];
              reg130 <= (-$unsigned(($signed((reg123 <= (8'hb1))) == ($signed(reg120) < $unsigned(reg117)))));
              reg131 <= (reg130[(4'he):(4'hc)] <<< reg125);
              reg132 <= $unsigned({wire91, (7'h41)});
            end
          else
            begin
              reg129 <= (!reg97);
              reg130 <= (8'ha3);
              reg131 <= (~$unsigned(reg131[(2'h2):(2'h2)]));
              reg132 <= (reg132 >> $unsigned($unsigned(((8'hac) ?
                  (reg130 - reg118) : (&reg120)))));
              reg133 <= ((($signed($unsigned(wire88)) ?
                          (8'ha0) : (~$signed(reg100))) ?
                      $unsigned(($signed(wire91) ?
                          (reg106 * reg102) : (reg94 ?
                              reg96 : reg118))) : (reg108 ?
                          ((reg129 >= reg96) ?
                              reg118 : (reg126 <= reg129)) : $unsigned(reg125[(2'h3):(2'h2)]))) ?
                  (~&$signed(reg104)) : reg103);
            end
        end
      else
        begin
          reg125 <= ((reg126 & (reg92[(2'h2):(1'h1)] != $signed((~&reg121)))) << (|(((reg130 ?
              reg112 : reg99) >>> $signed((7'h42))) >= $unsigned(reg126))));
          reg126 <= reg100;
        end
      if (reg104)
        begin
          reg134 <= $signed(((~&$unsigned($signed(reg110))) && $unsigned(reg122[(4'h9):(3'h5)])));
        end
      else
        begin
          if (($signed({$unsigned(reg126[(4'ha):(2'h2)]),
                  $unsigned((~^reg119))}) ?
              reg127 : $signed((~(wire115 ? reg121 : $signed(reg134))))))
            begin
              reg134 <= {$unsigned((((reg131 ? reg116 : reg104) ?
                          reg132 : reg129) ?
                      $unsigned($signed(reg98)) : (reg104[(4'h8):(1'h0)] ?
                          reg133[(4'hb):(1'h0)] : $signed(reg113)))),
                  (~|(^(~^(~^reg132))))};
              reg135 <= (~&(8'hba));
              reg136 <= reg121[(3'h6):(2'h2)];
              reg137 <= reg127;
            end
          else
            begin
              reg134 <= $signed(((~&$signed(reg108[(5'h10):(3'h4)])) ?
                  $unsigned(reg120[(4'hf):(1'h0)]) : $unsigned(wire114)));
              reg135 <= $unsigned((((~|(reg105 || reg125)) ?
                      reg95[(5'h10):(3'h4)] : {$signed(reg105), reg134}) ?
                  {reg92[(1'h0):(1'h0)],
                      (8'ha1)} : $unsigned($unsigned($signed((8'hb9))))));
              reg136 <= (|$signed(($signed((&reg92)) ?
                  ((8'hb6) ?
                      $signed(wire90) : $signed(reg121)) : $unsigned(((8'hb3) ~^ wire89)))));
              reg137 <= (({($unsigned(reg122) ? $unsigned(reg132) : (8'ha5)),
                      $unsigned(wire90[(3'h6):(1'h1)])} & reg97) ?
                  (&(($signed((8'hb8)) & {reg111,
                      reg99}) > $signed((~&reg129)))) : (reg112 && wire89));
              reg138 <= $signed(reg102);
            end
        end
    end
  module139 #() modinst155 (.wire142(reg127), .wire140(reg110), .wire143(reg119), .clk(clk), .wire141(wire90), .y(wire154));
  assign wire156 = ({reg111[(2'h2):(1'h0)],
                           ($unsigned($unsigned(reg97)) << reg105[(1'h0):(1'h0)])} ?
                       reg116[(1'h1):(1'h1)] : (^~reg104[(2'h3):(1'h1)]));
  assign wire157 = ((reg104[(4'h9):(1'h1)] ^~ reg124[(3'h4):(1'h1)]) ?
                       {(^~reg134[(1'h1):(1'h1)]),
                           reg137[(3'h5):(1'h0)]} : $signed(($unsigned({wire91}) ^ ($signed(reg110) ?
                           reg123[(4'hd):(1'h0)] : (reg108 && reg100)))));
  assign wire158 = $unsigned(($signed($unsigned(wire114)) ?
                       reg127 : (|{(~reg94)})));
  module159 #() modinst177 (.wire163(wire88), .y(wire176), .wire161(reg98), .wire160(reg128), .clk(clk), .wire162(reg108));
  always
    @(posedge clk) begin
      reg178 <= $signed({$unsigned((~^(reg97 & reg116))),
          $unsigned($signed(reg100))});
      reg179 <= (8'h9d);
      reg180 <= (-wire88);
      if (reg137[(4'hf):(3'h7)])
        begin
          if (reg92)
            begin
              reg181 <= ($unsigned($signed((8'hab))) < reg112);
              reg182 <= reg124[(3'h4):(2'h3)];
              reg183 <= (|(8'haf));
              reg184 <= {reg132[(3'h4):(1'h0)],
                  $unsigned($unsigned(((reg121 >>> reg95) ?
                      ((8'hb3) ? reg117 : wire154) : (reg178 >= wire176))))};
              reg185 <= ((~|(7'h43)) <= {(!{(8'had), ((8'hb8) ^ reg178)}),
                  (reg127 ?
                      (|(reg118 ? (8'ha2) : wire158)) : ($unsigned(reg118) ?
                          (~|reg106) : (reg112 >>> reg133)))});
            end
          else
            begin
              reg181 <= $unsigned(wire157);
            end
          reg186 <= ($signed(reg134[(2'h2):(1'h1)]) ?
              $signed($unsigned((8'hb5))) : $unsigned({$unsigned((reg135 > reg135)),
                  (~|(reg133 && reg136))}));
          reg187 <= (^~$signed((8'hb5)));
          reg188 <= reg128;
          reg189 <= reg96[(2'h2):(1'h0)];
        end
      else
        begin
          reg181 <= reg129;
          if ((~(|reg129)))
            begin
              reg182 <= {($signed(reg94) == ((8'hbe) <<< $signed(wire89))),
                  (!(-$signed(reg113[(1'h1):(1'h1)])))};
            end
          else
            begin
              reg182 <= reg125[(4'hd):(4'h8)];
            end
        end
    end
  assign wire190 = reg121;
  module191 #() modinst223 (wire222, clk, reg135, wire89, reg181, reg98);
  assign wire224 = reg133[(3'h5):(2'h2)];
  always
    @(posedge clk) begin
      reg225 <= $signed((~&(~(reg99 << (reg183 ? wire88 : reg118)))));
      reg226 <= {wire91[(3'h5):(2'h3)], (-wire158)};
      reg227 <= $unsigned(reg118[(4'hc):(4'hb)]);
      reg228 <= reg121[(1'h1):(1'h1)];
      if ((~reg225))
        begin
          reg229 <= {reg183};
          if ($unsigned((8'hb7)))
            begin
              reg230 <= $unsigned($signed(((~&$unsigned(reg186)) ?
                  $unsigned((~&reg137)) : {(reg137 ? reg120 : reg113),
                      (reg102 ? reg188 : reg119)})));
              reg231 <= $signed({({(!reg230), (reg104 != wire89)} ?
                      (reg133[(4'h8):(3'h7)] ^ (reg136 ?
                          reg100 : wire176)) : $signed(reg96[(2'h2):(1'h0)]))});
              reg232 <= $signed((!reg182[(1'h1):(1'h0)]));
            end
          else
            begin
              reg230 <= ($signed((reg129 == {(reg185 ? (8'hb5) : reg183),
                  wire114[(3'h6):(3'h5)]})) >= wire156);
              reg231 <= reg137[(4'he):(3'h4)];
              reg232 <= ((^~($signed($unsigned(reg228)) ?
                      ($signed(reg232) ?
                          {(8'ha3), reg188} : (|reg118)) : reg230)) ?
                  $unsigned($unsigned(($unsigned(reg182) ?
                      reg105 : reg116[(3'h5):(1'h1)]))) : (+$unsigned({(!wire88),
                      (reg120 * wire90)})));
            end
          reg233 <= $unsigned($signed($signed(reg133)));
          if (reg122[(4'hc):(4'hb)])
            begin
              reg234 <= (+(-$signed($unsigned(wire157[(3'h4):(3'h4)]))));
              reg235 <= ($signed($unsigned(reg99)) != $unsigned((~(((8'hbb) != (8'ha5)) << {reg92}))));
              reg236 <= (({((~reg107) ^ (|reg125)),
                      $unsigned($unsigned(reg120))} ?
                  (reg188 ?
                      reg189 : wire88) : (!wire90[(2'h3):(1'h0)])) >> reg100);
            end
          else
            begin
              reg234 <= (wire158 ?
                  reg108[(2'h2):(1'h0)] : wire114[(3'h6):(2'h2)]);
              reg235 <= $signed((|reg104));
              reg236 <= (&(|(wire154 ?
                  $signed(reg189) : reg138[(1'h1):(1'h1)])));
              reg237 <= ((($unsigned($unsigned(reg109)) + (8'h9c)) || $unsigned(($signed(reg230) ?
                      (7'h44) : ((8'ha4) ? (8'ha2) : reg232)))) ?
                  $unsigned($signed($signed((~|reg95)))) : {(!((reg130 >> reg137) ?
                          reg112[(1'h1):(1'h0)] : (~|reg226)))});
            end
        end
      else
        begin
          reg229 <= reg103[(4'h8):(3'h4)];
          reg230 <= reg124;
          reg231 <= ({((reg230 == (wire158 ? reg93 : (8'ha7))) <= (!reg234))} ?
              reg129 : (~^wire89));
          if (((~|{reg116, (^~(-(8'had)))}) ^~ reg135[(4'hb):(2'h2)]))
            begin
              reg232 <= reg111;
            end
          else
            begin
              reg232 <= reg186;
              reg233 <= (~|((reg116 >= reg232) ?
                  (-$signed((^~reg188))) : reg129[(3'h5):(1'h1)]));
              reg234 <= wire156;
              reg235 <= $unsigned($signed({(-(wire114 ? reg93 : reg135)),
                  ((^~(8'haf)) <<< ((7'h44) <<< reg124))}));
              reg236 <= {(^$unsigned($signed((reg109 && reg230))))};
            end
          if ($unsigned(reg237[(2'h2):(2'h2)]))
            begin
              reg237 <= (!(($unsigned(reg116[(3'h5):(3'h5)]) || (8'hb4)) || $unsigned($signed($signed(reg108)))));
              reg238 <= reg108[(2'h2):(1'h0)];
              reg239 <= ((^{((~^(7'h43)) < (&(7'h44)))}) ?
                  (^~($unsigned((reg134 + reg96)) >>> ($unsigned(wire156) ?
                      (!reg120) : {reg102}))) : ($unsigned($signed(reg113)) ?
                      (((!(8'hb1)) ? reg121[(2'h2):(2'h2)] : {reg123, reg104}) ?
                          $unsigned(reg179) : $unsigned((reg110 ?
                              reg133 : reg131))) : $signed((reg238 + ((8'ha8) ?
                          reg131 : wire154)))));
              reg240 <= reg137[(5'h10):(5'h10)];
            end
          else
            begin
              reg237 <= $signed(wire115);
              reg238 <= (~|reg186);
              reg239 <= (&(reg188[(3'h7):(2'h2)] ?
                  $signed((~^(+wire222))) : reg105));
              reg240 <= reg186[(3'h6):(1'h0)];
            end
        end
    end
  assign wire241 = ((^$unsigned(reg93)) <<< (^~reg226[(3'h7):(3'h4)]));
  always
    @(posedge clk) begin
      reg242 <= $signed($unsigned($unsigned(reg120[(4'h8):(3'h4)])));
      if ((reg123[(4'hb):(4'hb)] << (^reg189)))
        begin
          if (($signed(reg232[(4'hc):(2'h2)]) ?
              $signed((($unsigned(reg234) ? (~^reg98) : reg107[(3'h5):(1'h0)]) ?
                  reg92[(5'h10):(1'h1)] : (&(reg242 ?
                      (8'hba) : wire101)))) : (^~({$unsigned(reg97)} & reg122[(3'h6):(2'h3)]))))
            begin
              reg243 <= $unsigned((($unsigned($signed((8'hbb))) ?
                      $unsigned($unsigned(wire241)) : (8'hb4)) ?
                  reg229 : $signed(wire176[(4'he):(1'h1)])));
              reg244 <= $unsigned(reg98);
              reg245 <= ($signed(wire90[(3'h5):(1'h1)]) ^ reg226);
              reg246 <= reg189;
              reg247 <= reg242[(1'h0):(1'h0)];
            end
          else
            begin
              reg243 <= (!(!reg186));
              reg244 <= $signed(((&(reg98[(3'h5):(1'h0)] ?
                      {reg109} : (&(8'h9e)))) ?
                  $signed($unsigned({reg124})) : (^$signed($unsigned((7'h40))))));
            end
          reg248 <= reg138[(2'h2):(1'h0)];
          reg249 <= reg110[(2'h3):(2'h2)];
          if ($unsigned(reg225))
            begin
              reg250 <= (~reg237);
              reg251 <= $signed((~^reg235[(3'h7):(3'h7)]));
              reg252 <= (-{$signed(reg98[(2'h2):(1'h0)])});
              reg253 <= ({(reg229[(2'h2):(1'h0)] ?
                          (^~((8'hbd) ?
                              wire115 : (8'hb4))) : (reg250 >= reg104)),
                      ({reg232[(1'h0):(1'h0)]} ?
                          reg242[(5'h11):(3'h6)] : (reg235 >= $unsigned(reg187)))} ?
                  $signed($signed(reg107)) : ($unsigned((^(reg133 && wire88))) ?
                      reg126[(4'h8):(1'h1)] : {(^(~&reg118)),
                          ((~(7'h42)) ? (~reg185) : (reg94 && reg100))}));
            end
          else
            begin
              reg250 <= reg112[(1'h1):(1'h1)];
              reg251 <= reg109;
              reg252 <= (^~({reg110, reg120[(5'h10):(3'h7)]} ?
                  reg111[(2'h2):(1'h1)] : reg232));
              reg253 <= (|$signed(reg182));
            end
          if ({$signed(($signed($signed((8'hb0))) & ($unsigned(reg94) - (^reg135)))),
              (8'hb8)})
            begin
              reg254 <= wire90[(3'h4):(3'h4)];
              reg255 <= wire158;
              reg256 <= $signed((~|($signed($unsigned(reg94)) & $signed((8'ha6)))));
              reg257 <= (^reg234);
            end
          else
            begin
              reg254 <= $signed(((({reg245} < $unsigned(wire114)) - ((8'haa) <= (8'hb4))) ?
                  (~|(8'ha1)) : ($unsigned(reg189) ?
                      $signed((reg118 ? reg234 : reg135)) : $signed((reg135 ?
                          reg180 : (7'h43))))));
            end
        end
      else
        begin
          reg243 <= reg234[(2'h2):(2'h2)];
          reg244 <= (-reg116[(3'h4):(1'h0)]);
          reg245 <= reg98[(4'hb):(3'h7)];
          reg246 <= reg107;
        end
      if (((&reg255[(4'ha):(4'ha)]) ?
          (wire91 ?
              reg93[(3'h4):(2'h2)] : ($signed((reg233 & (7'h40))) ?
                  $unsigned((reg247 ? reg100 : reg233)) : $unsigned((reg231 ?
                      reg110 : reg94)))) : (((!reg181) ?
              (^~(-(8'hba))) : (reg244 ?
                  reg113 : $unsigned(reg248))) ^~ (reg113 == reg98[(4'hb):(4'hb)]))))
        begin
          reg258 <= $unsigned({$signed($signed((reg250 * wire157))),
              wire90[(3'h7):(2'h3)]});
        end
      else
        begin
          reg258 <= reg121[(2'h2):(2'h2)];
          reg259 <= ((reg108[(5'h11):(4'hf)] ?
                  {$signed(reg179)} : $unsigned(((reg121 ?
                      reg243 : reg252) <= reg128[(4'hc):(1'h0)]))) ?
              $signed((~|reg128)) : (!reg93));
          reg260 <= reg95;
          reg261 <= $unsigned(((-(&(reg99 - reg94))) << $unsigned($unsigned((reg103 ?
              reg226 : (8'ha9))))));
        end
      reg262 <= reg181;
    end
  assign wire263 = {$signed({$unsigned(wire91[(2'h2):(2'h2)])})};
  assign wire264 = (+(+$unsigned($signed((reg108 >> reg258)))));
  always
    @(posedge clk) begin
      reg265 <= {reg105,
          $unsigned((reg258[(1'h0):(1'h0)] <= $signed({reg116})))};
      reg266 <= (^reg107);
      reg267 <= (~{(+((-(8'h9e)) > (reg225 | reg265)))});
      reg268 <= $unsigned($signed(reg225));
      reg269 <= (wire222[(3'h6):(2'h3)] ?
          (({$unsigned((8'hbe))} == ((reg240 ?
              (8'hb8) : (8'hb7)) <<< reg240[(4'he):(3'h6)])) - reg118) : (reg235 ?
              $unsigned($signed({reg187})) : (-reg259)));
    end
endmodule

module module8
#(parameter param81 = ((((!((8'hbc) ? (8'hbf) : (8'haa))) || ((-(8'ha8)) ? ((8'hae) ? (8'hb7) : (8'hb9)) : ((8'hb3) ? (8'ha1) : (8'haa)))) + (8'hbd)) + (+(8'hb9))), 
parameter param82 = ((param81 + (((~|(8'hbf)) ? (param81 | param81) : (param81 ~^ (8'hbc))) ? ((param81 - param81) & (param81 >> (8'hb6))) : ((param81 ? param81 : param81) ? param81 : (param81 ^ (8'h9c))))) ? ({((~&param81) ? param81 : (param81 ? (8'ha1) : param81)), (param81 ? (param81 ? param81 : param81) : param81)} > {(~&(param81 < param81))}) : {(param81 ? (~&(~&param81)) : ({(8'ha9)} <= (param81 ? param81 : (8'hb7))))}))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h9a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire12;
  input wire [(5'h13):(1'h0)] wire11;
  input wire signed [(5'h11):(1'h0)] wire10;
  input wire [(2'h3):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire80;
  wire signed [(5'h14):(1'h0)] wire78;
  wire [(2'h3):(1'h0)] wire45;
  wire signed [(4'h9):(1'h0)] wire43;
  wire [(5'h11):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire17;
  wire signed [(5'h12):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire15;
  wire signed [(5'h13):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire13;
  assign y = {wire80,
                 wire78,
                 wire45,
                 wire43,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 (1'h0)};
  assign wire13 = {(^~wire9),
                      $signed(({(~|wire9), (wire12 && wire9)} ?
                          wire12[(1'h0):(1'h0)] : $signed($unsigned(wire10))))};
  assign wire14 = (wire13[(4'he):(3'h7)] ?
                      (~$unsigned($unsigned((wire11 == wire11)))) : ((^~$signed({wire13})) >= wire13[(2'h2):(1'h0)]));
  assign wire15 = ((wire12 | (((wire13 || wire11) >> $signed(wire11)) ?
                          ($unsigned(wire13) ?
                              (wire13 < wire13) : (wire10 ?
                                  wire9 : wire12)) : (wire9 | (wire14 ^ wire14)))) ?
                      ($signed(($signed((8'hae)) >> (wire11 ^~ wire13))) + $signed(wire12)) : $unsigned($signed($signed(wire12[(2'h3):(2'h2)]))));
  assign wire16 = ($signed($signed($unsigned(wire11))) - (({wire11,
                          $unsigned(wire11)} <= wire10) ?
                      (~(~&(^~wire12))) : $unsigned((wire11 || (wire11 ?
                          wire9 : wire11)))));
  assign wire17 = $unsigned($unsigned((~(~wire15))));
  assign wire18 = (~$unsigned(wire15));
  assign wire19 = wire16;
  module20 #() modinst44 (.wire22(wire19), .wire23(wire13), .wire21(wire11), .clk(clk), .wire24(wire16), .y(wire43));
  assign wire45 = wire11;
  module46 #() modinst79 (wire78, clk, wire43, wire17, wire15, wire14);
  assign wire80 = wire17;
endmodule

module module46
#(parameter param77 = ((((((8'hb5) ? (8'hb3) : (8'haa)) ? {(8'hb3), (8'ha0)} : (~&(8'ha3))) < {{(8'ha1)}, ((8'hb2) <= (8'ha7))}) ^ ({((7'h41) ? (8'hbe) : (8'ha9))} ? {((8'ha6) ? (8'hae) : (7'h41))} : (((8'ha7) <<< (8'hac)) + ((8'h9e) ? (8'hae) : (8'hae))))) <<< (({{(8'hb7)}} - {(^~(8'hbf))}) ? (8'hbc) : ((~((8'hac) <= (7'h43))) < (!((8'hbb) < (7'h41)))))))
(y, clk, wire50, wire49, wire48, wire47);
  output wire [(32'h131):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire50;
  input wire signed [(2'h2):(1'h0)] wire49;
  input wire signed [(4'ha):(1'h0)] wire48;
  input wire [(5'h13):(1'h0)] wire47;
  wire [(4'hf):(1'h0)] wire76;
  wire signed [(4'he):(1'h0)] wire75;
  wire signed [(4'hb):(1'h0)] wire74;
  wire [(4'he):(1'h0)] wire73;
  wire signed [(4'hd):(1'h0)] wire72;
  wire [(5'h13):(1'h0)] wire71;
  wire signed [(4'hf):(1'h0)] wire70;
  wire signed [(2'h3):(1'h0)] wire69;
  wire signed [(4'hd):(1'h0)] wire68;
  wire signed [(3'h4):(1'h0)] wire62;
  wire signed [(4'h9):(1'h0)] wire61;
  wire signed [(3'h4):(1'h0)] wire60;
  wire signed [(4'hc):(1'h0)] wire59;
  wire [(5'h11):(1'h0)] wire58;
  wire [(5'h11):(1'h0)] wire57;
  wire signed [(4'hf):(1'h0)] wire56;
  reg signed [(3'h5):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg65 = (1'h0);
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  reg [(3'h4):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg55 = (1'h0);
  reg [(5'h10):(1'h0)] reg54 = (1'h0);
  reg [(3'h7):(1'h0)] reg53 = (1'h0);
  reg [(5'h15):(1'h0)] reg52 = (1'h0);
  reg [(5'h12):(1'h0)] reg51 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg51 <= {(8'hba),
          ({($unsigned(wire50) ? (~&wire48) : (wire49 ? wire47 : wire47))} ?
              $signed(((-wire48) << (wire47 ^~ wire50))) : wire50[(3'h5):(1'h0)])};
      reg52 <= wire48;
      reg53 <= ({((wire48 && (^wire49)) ? (+(8'h9f)) : reg52[(5'h10):(4'hb)]),
          $signed((~^$unsigned(wire50)))} <<< (wire50 ?
          ($unsigned(wire49) ?
              reg51 : ((^reg52) | wire50)) : wire48[(3'h6):(3'h5)]));
      reg54 <= wire47[(2'h3):(2'h3)];
      reg55 <= (8'ha1);
    end
  assign wire56 = wire47[(4'hd):(2'h2)];
  assign wire57 = reg51[(4'h9):(1'h0)];
  assign wire58 = wire50;
  assign wire59 = reg53[(3'h4):(1'h0)];
  assign wire60 = ($signed((reg51[(4'ha):(3'h4)] - wire48[(3'h4):(1'h1)])) > ((({reg53} || reg53[(1'h1):(1'h0)]) ?
                          reg51[(4'h9):(4'h9)] : $signed((reg51 ?
                              wire58 : wire50))) ?
                      $unsigned((-(wire49 ?
                          wire47 : wire49))) : $unsigned($signed(reg51))));
  assign wire61 = $signed(reg51[(2'h2):(1'h0)]);
  assign wire62 = reg54;
  always
    @(posedge clk) begin
      reg63 <= $signed($unsigned((($unsigned((8'hb3)) ?
          $signed((8'hb4)) : $signed(wire56)) >>> (-$signed(wire48)))));
      reg64 <= (+(wire61 > wire60[(2'h2):(1'h0)]));
      reg65 <= wire58[(5'h11):(3'h5)];
      reg66 <= {(+(($signed(reg65) >> ((7'h40) & reg63)) ?
              reg55 : reg51[(4'h8):(1'h0)])),
          (((((8'h9d) >>> (8'hae)) || reg54) ^~ reg54[(1'h1):(1'h0)]) ?
              (~|reg54) : (reg55[(3'h7):(3'h6)] - ((wire50 ?
                  reg64 : reg64) > $unsigned(wire58))))};
      reg67 <= $signed(((~&$unsigned($unsigned(reg66))) ?
          ((~^$signed(reg54)) > (reg51[(1'h0):(1'h0)] != $signed(wire62))) : (((^reg63) ^~ wire62[(1'h1):(1'h1)]) ?
              reg63 : (reg54 ? reg66[(3'h5):(1'h0)] : {wire58}))));
    end
  assign wire68 = {(($signed(reg63) && $unsigned($unsigned(wire61))) != ({{(8'hb5),
                                  reg67},
                              $unsigned(reg66)} ?
                          $signed($unsigned(wire62)) : (^~(~wire47))))};
  assign wire69 = (^{(-((+wire57) & $signed(reg64)))});
  assign wire70 = (((wire48 ?
                          {(8'h9e),
                              $unsigned(wire47)} : $unsigned($signed(wire48))) & ((wire47[(1'h1):(1'h0)] >= (reg51 || reg54)) + (((8'hb6) > wire68) >>> $unsigned(reg64)))) ?
                      ((!$signed(wire56[(4'hb):(3'h5)])) ?
                          reg55[(3'h5):(1'h0)] : wire68) : wire48[(2'h2):(1'h0)]);
  assign wire71 = (($unsigned(reg51) ?
                          (~^((-wire58) == wire47[(4'h8):(3'h6)])) : reg67) ?
                      ($unsigned((8'hb6)) | reg63[(2'h2):(2'h2)]) : ({((reg52 ?
                                      wire49 : wire59) ?
                                  {reg54} : wire59),
                              (wire70 <= wire59[(4'hb):(3'h7)])} ?
                          wire57[(4'hd):(2'h2)] : $signed($unsigned($signed(reg66)))));
  assign wire72 = wire56;
  assign wire73 = reg51[(5'h11):(4'hd)];
  assign wire74 = (((!wire60) ?
                          ((-{wire70}) ?
                              $unsigned((wire58 ?
                                  (8'ha7) : wire59)) : (wire71 << $unsigned(reg65))) : (((!wire48) ?
                                  ((8'hb8) ~^ reg64) : reg52[(4'hb):(3'h6)]) ?
                              reg66[(1'h1):(1'h0)] : wire59[(4'hc):(4'h9)])) ?
                      $unsigned($signed($unsigned(wire49))) : ((~($signed(wire69) ?
                              (reg51 < wire61) : wire59)) ?
                          wire72 : ($unsigned((wire70 << (7'h41))) >= reg65)));
  assign wire75 = (reg67 >>> reg51[(4'hc):(3'h4)]);
  assign wire76 = $signed((8'hb0));
endmodule

module module20
#(parameter param41 = ((^(8'hbd)) ? (|((((8'hbb) ? (8'ha1) : (8'hb1)) ^ ((8'ha4) | (8'h9e))) ? {((7'h44) ? (8'h9f) : (8'hb1)), (8'hbc)} : (((8'hb9) ^ (8'had)) && ((8'hb6) <<< (8'hb7))))) : (~^(|(((8'ha0) ? (8'hb6) : (8'ha0)) + ((7'h42) + (8'hb8)))))), 
parameter param42 = (7'h41))
(y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'haa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire24;
  input wire [(5'h10):(1'h0)] wire23;
  input wire [(5'h11):(1'h0)] wire22;
  input wire signed [(5'h13):(1'h0)] wire21;
  wire signed [(4'h9):(1'h0)] wire34;
  wire signed [(4'he):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire32;
  wire signed [(5'h11):(1'h0)] wire31;
  wire signed [(4'hd):(1'h0)] wire29;
  wire signed [(4'ha):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire27;
  wire [(3'h5):(1'h0)] wire25;
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg [(5'h12):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire29,
                 wire28,
                 wire27,
                 wire25,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg30,
                 reg26,
                 (1'h0)};
  assign wire25 = $unsigned(wire22);
  always
    @(posedge clk) begin
      reg26 <= (wire22 ~^ $signed($unsigned((-wire22))));
    end
  assign wire27 = wire25[(2'h2):(1'h0)];
  assign wire28 = (wire21 ?
                      ($signed(wire22) ?
                          (&(((8'ha4) - (8'haf)) ?
                              (!reg26) : (wire23 * wire22))) : (^(~|((8'ha6) ?
                              wire25 : wire24)))) : (|($unsigned((~wire21)) ^ (~&{wire27,
                          (8'ha7)}))));
  assign wire29 = (^~(~wire28));
  always
    @(posedge clk) begin
      reg30 <= (wire29[(3'h5):(1'h0)] ?
          (((&wire23[(4'he):(3'h7)]) ?
              ($unsigned(wire27) & ((8'had) >>> wire22)) : $signed($signed((8'hb5)))) > $signed({{wire24}})) : (((!reg26) & reg26[(2'h3):(2'h3)]) < (+wire28[(4'h8):(3'h6)])));
    end
  assign wire31 = $signed((^wire21[(4'hc):(3'h5)]));
  assign wire32 = $unsigned($unsigned((^~$unsigned((wire21 == wire21)))));
  assign wire33 = wire27[(4'h9):(2'h3)];
  assign wire34 = $signed(((wire28[(1'h1):(1'h0)] >>> wire23) ?
                      {(^wire29[(2'h3):(2'h2)])} : ({(wire31 ? wire33 : reg26),
                          $unsigned((8'hbe))} >= $signed($signed(wire27)))));
  always
    @(posedge clk) begin
      reg35 <= (wire22[(5'h10):(3'h7)] ?
          (~^wire32) : ((~$unsigned(wire21)) ?
              wire25[(1'h0):(1'h0)] : ($unsigned($signed(wire29)) ?
                  $unsigned(wire25) : ($unsigned(wire31) ?
                      $signed(wire33) : ((8'hb5) <= reg26)))));
      reg36 <= $unsigned(wire25);
      reg37 <= $unsigned((&{(~^$unsigned(wire27))}));
      if ((^~reg30[(4'ha):(1'h1)]))
        begin
          reg38 <= (8'h9c);
        end
      else
        begin
          reg38 <= $unsigned((7'h41));
          reg39 <= ((~((wire24 && ((7'h41) ?
              wire21 : wire27)) >>> (8'hb6))) + ($unsigned($unsigned((wire25 ^ wire21))) == {wire23,
              reg35}));
          reg40 <= ($signed($signed($unsigned((wire23 > wire29)))) ?
              reg37[(4'h8):(3'h6)] : wire28);
        end
    end
endmodule

module module191
#(parameter param220 = (^~(((((8'ha7) == (8'ha7)) ? ((8'h9d) ^~ (8'ha0)) : (+(8'ha2))) ^~ {((8'hac) ? (8'hb2) : (8'hb5))}) + ((((7'h41) != (8'hb5)) <= ((8'hbf) ? (8'ha1) : (8'hab))) ? (~((8'hba) * (8'h9d))) : (((8'h9e) ? (8'hb2) : (8'ha1)) ? (~(8'h9d)) : ((8'hbe) ? (8'hb3) : (7'h44)))))), 
parameter param221 = (~^param220))
(y, clk, wire195, wire194, wire193, wire192);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire195;
  input wire [(4'hb):(1'h0)] wire194;
  input wire signed [(4'hb):(1'h0)] wire193;
  input wire signed [(4'hd):(1'h0)] wire192;
  wire [(4'hf):(1'h0)] wire219;
  wire signed [(4'hb):(1'h0)] wire218;
  wire [(4'hc):(1'h0)] wire217;
  wire signed [(4'hd):(1'h0)] wire216;
  wire [(4'h8):(1'h0)] wire215;
  wire signed [(3'h4):(1'h0)] wire214;
  wire signed [(4'h8):(1'h0)] wire213;
  wire signed [(5'h15):(1'h0)] wire200;
  wire signed [(4'hd):(1'h0)] wire199;
  wire [(5'h14):(1'h0)] wire198;
  wire signed [(5'h15):(1'h0)] wire197;
  wire signed [(4'hd):(1'h0)] wire196;
  reg signed [(4'hb):(1'h0)] reg212 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg211 = (1'h0);
  reg signed [(4'he):(1'h0)] reg210 = (1'h0);
  reg [(2'h2):(1'h0)] reg209 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg208 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg207 = (1'h0);
  reg [(5'h15):(1'h0)] reg206 = (1'h0);
  reg [(4'h8):(1'h0)] reg205 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg204 = (1'h0);
  reg [(3'h7):(1'h0)] reg203 = (1'h0);
  reg [(4'hd):(1'h0)] reg202 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg201 = (1'h0);
  assign y = {wire219,
                 wire218,
                 wire217,
                 wire216,
                 wire215,
                 wire214,
                 wire213,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
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
                 (1'h0)};
  assign wire196 = (!wire195);
  assign wire197 = {wire194, wire194};
  assign wire198 = $signed(wire196[(2'h3):(1'h1)]);
  assign wire199 = $signed((~&(((|wire195) ?
                       {wire195} : $unsigned((8'ha8))) && {(wire194 != (8'hbb))})));
  assign wire200 = wire192;
  always
    @(posedge clk) begin
      reg201 <= $unsigned(($unsigned($unsigned($signed(wire193))) * {($signed(wire195) - wire200),
          $unsigned((wire199 ^ wire196))}));
      if ((|(((+(wire200 && wire198)) <<< $unsigned((-(8'hb8)))) | wire199)))
        begin
          reg202 <= wire200[(5'h13):(3'h7)];
        end
      else
        begin
          if ({wire198})
            begin
              reg202 <= (^~(wire194 ?
                  (!wire199) : $signed(({wire199, wire195} ?
                      $signed(wire196) : $signed(wire200)))));
            end
          else
            begin
              reg202 <= wire198[(4'h9):(3'h7)];
              reg203 <= (~&($unsigned(wire198) ?
                  $unsigned(wire198) : ((wire192[(1'h1):(1'h0)] << (8'had)) ?
                      wire200 : ((|wire199) > (wire200 ? (8'hba) : wire197)))));
              reg204 <= $signed($signed(reg202[(3'h6):(3'h6)]));
              reg205 <= wire197[(4'ha):(1'h1)];
            end
          reg206 <= ($signed(reg201) ? wire194 : wire200[(1'h0):(1'h0)]);
          if ((|{$signed(reg203)}))
            begin
              reg207 <= wire199[(3'h4):(2'h3)];
              reg208 <= (reg204 ? (7'h40) : reg203);
              reg209 <= ((wire200[(4'hd):(4'h8)] == reg204[(2'h2):(2'h2)]) ?
                  wire198[(5'h10):(5'h10)] : reg204[(1'h1):(1'h1)]);
              reg210 <= {($unsigned(wire198[(3'h7):(1'h0)]) ~^ {$unsigned($unsigned(wire197)),
                      $signed((~|reg201))})};
              reg211 <= ($unsigned($unsigned($signed((reg207 ?
                  reg206 : wire194)))) <= reg201);
            end
          else
            begin
              reg207 <= wire195[(2'h2):(1'h0)];
            end
          reg212 <= $unsigned(($unsigned(wire197[(3'h6):(2'h2)]) ?
              $unsigned($unsigned((-reg210))) : (!{$unsigned(reg208),
                  wire200})));
        end
    end
  assign wire213 = ($unsigned((($unsigned(wire199) ?
                           reg207[(1'h1):(1'h1)] : $unsigned(reg208)) >> $unsigned(reg210))) ?
                       reg210 : ({wire199, wire199} ?
                           {(reg202 <<< (^~wire193)),
                               $signed(reg206)} : $unsigned(wire197[(2'h3):(1'h0)])));
  assign wire214 = $unsigned(reg205);
  assign wire215 = reg204;
  assign wire216 = $signed(($signed($signed((reg205 ?
                       (8'haa) : wire193))) > {(wire200 ?
                           (^~reg202) : $signed(reg206))}));
  assign wire217 = reg210[(4'hb):(4'ha)];
  assign wire218 = (8'had);
  assign wire219 = (~^(($signed($signed((8'hb8))) ?
                       reg205[(3'h7):(3'h7)] : $signed($signed(wire215))) != wire216[(4'h8):(1'h1)]));
endmodule

module module159
#(parameter param174 = (~^(8'h9f)), 
parameter param175 = (+((~&(+(^~param174))) & {{(~^param174)}, (param174 ? (param174 ? param174 : param174) : (param174 >= param174))})))
(y, clk, wire163, wire162, wire161, wire160);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire163;
  input wire signed [(5'h15):(1'h0)] wire162;
  input wire [(4'hd):(1'h0)] wire161;
  input wire signed [(3'h5):(1'h0)] wire160;
  wire [(2'h3):(1'h0)] wire173;
  wire signed [(5'h14):(1'h0)] wire167;
  wire [(4'hb):(1'h0)] wire166;
  wire [(4'hc):(1'h0)] wire165;
  wire signed [(2'h3):(1'h0)] wire164;
  reg signed [(3'h4):(1'h0)] reg172 = (1'h0);
  reg [(5'h14):(1'h0)] reg171 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg170 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg168 = (1'h0);
  assign y = {wire173,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 (1'h0)};
  assign wire164 = (~$unsigned($signed($unsigned($unsigned(wire161)))));
  assign wire165 = $unsigned((wire160[(3'h5):(2'h3)] ?
                       ((wire164[(1'h0):(1'h0)] <<< wire160[(1'h0):(1'h0)]) - $signed($signed(wire163))) : {wire163[(4'h9):(2'h3)],
                           (wire164 ? (^(8'hb8)) : wire164)}));
  assign wire166 = wire161;
  assign wire167 = $unsigned($signed((8'ha8)));
  always
    @(posedge clk) begin
      reg168 <= $unsigned(wire166);
      reg169 <= wire164[(1'h1):(1'h0)];
      reg170 <= reg168;
      reg171 <= $signed((&(~$signed((-wire160)))));
      reg172 <= ($signed(reg169[(2'h2):(1'h0)]) ?
          reg168[(5'h13):(5'h10)] : (reg170[(3'h4):(2'h3)] && (~|((&wire161) ?
              {wire161, reg169} : wire165))));
    end
  assign wire173 = reg172;
endmodule

module module139
#(parameter param153 = (({(|{(8'ha6), (8'ha7)}), (8'ha2)} ? ({(~|(7'h43))} << (((8'hb7) ? (7'h40) : (8'hb8)) ~^ (8'hbd))) : (^~((~|(8'hba)) ? ((8'hac) >= (8'hbe)) : ((8'hbe) ? (8'hbe) : (8'hbf))))) & {{(~&(~^(8'ha9))), ({(8'hb9)} >>> ((8'hbd) ? (8'ha9) : (8'hb5)))}, ((^~(~(8'hb6))) ~^ ((~(7'h41)) ? (^~(8'h9c)) : ((8'hb8) <= (8'hb7))))}))
(y, clk, wire143, wire142, wire141, wire140);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire143;
  input wire [(5'h10):(1'h0)] wire142;
  input wire [(3'h5):(1'h0)] wire141;
  input wire signed [(4'hb):(1'h0)] wire140;
  wire signed [(4'hc):(1'h0)] wire151;
  wire [(4'h9):(1'h0)] wire150;
  wire signed [(2'h2):(1'h0)] wire148;
  wire [(3'h7):(1'h0)] wire147;
  wire signed [(4'hf):(1'h0)] wire146;
  wire [(2'h2):(1'h0)] wire145;
  wire signed [(3'h6):(1'h0)] wire144;
  reg signed [(3'h7):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg149 = (1'h0);
  assign y = {wire151,
                 wire150,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 reg152,
                 reg149,
                 (1'h0)};
  assign wire144 = (^~$unsigned(wire141[(1'h1):(1'h0)]));
  assign wire145 = $signed($signed((($unsigned(wire142) ?
                       (wire141 <= (8'ha1)) : (wire140 * wire142)) || $unsigned($signed(wire141)))));
  assign wire146 = wire144[(3'h5):(3'h4)];
  assign wire147 = $signed({$unsigned((^(-wire146)))});
  assign wire148 = {wire141[(2'h3):(1'h0)],
                       {((^$signed(wire140)) ?
                               $signed((wire143 + wire143)) : {{wire141,
                                       wire142}}),
                           (((|(8'hbf)) << ((8'hba) ? wire145 : wire142)) ?
                               wire142[(5'h10):(4'h8)] : (^wire142))}};
  always
    @(posedge clk) begin
      reg149 <= (8'h9c);
    end
  assign wire150 = ($signed($signed((~&wire141[(1'h1):(1'h1)]))) + $signed(wire140[(1'h1):(1'h1)]));
  assign wire151 = wire142[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg152 <= wire140;
    end
endmodule
