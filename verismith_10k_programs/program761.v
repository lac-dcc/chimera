module top
#(parameter param298 = ((^~({((8'hb6) - (8'h9c)), (~|(8'hbc))} ~^ {(~(8'hbc))})) || {((((8'haa) ? (8'ha8) : (8'h9c)) < ((8'ha2) > (7'h43))) ? ({(8'h9e), (7'h41)} ? ((8'ha7) ? (7'h42) : (8'ha9)) : (^~(8'hb7))) : (^((7'h44) ? (7'h41) : (8'hbc)))), ((~&(~^(8'h9c))) ? (((8'ha6) ? (8'hbb) : (8'ha7)) - (!(8'hac))) : {((7'h41) >> (8'hb5)), ((7'h41) - (8'hae))})}), 
parameter param299 = ((8'ha4) ? (^param298) : (param298 ? ((((8'hb1) ? param298 : (8'ha1)) ? param298 : (&param298)) ~^ ((|param298) == param298)) : (^(^(+param298))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h281):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  wire [(4'hc):(1'h0)] wire297;
  wire signed [(5'h10):(1'h0)] wire97;
  wire [(4'h9):(1'h0)] wire99;
  wire [(5'h14):(1'h0)] wire100;
  wire signed [(3'h7):(1'h0)] wire109;
  wire signed [(3'h5):(1'h0)] wire122;
  wire [(5'h10):(1'h0)] wire127;
  wire [(5'h14):(1'h0)] wire128;
  wire [(4'ha):(1'h0)] wire129;
  wire signed [(3'h7):(1'h0)] wire130;
  wire [(5'h13):(1'h0)] wire139;
  wire signed [(4'ha):(1'h0)] wire140;
  wire signed [(4'he):(1'h0)] wire141;
  wire signed [(3'h6):(1'h0)] wire144;
  wire signed [(4'he):(1'h0)] wire145;
  wire [(4'he):(1'h0)] wire146;
  wire signed [(2'h2):(1'h0)] wire295;
  reg signed [(5'h12):(1'h0)] reg101 = (1'h0);
  reg [(4'hb):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg103 = (1'h0);
  reg [(5'h10):(1'h0)] reg104 = (1'h0);
  reg [(5'h11):(1'h0)] reg105 = (1'h0);
  reg [(4'hc):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg107 = (1'h0);
  reg [(5'h13):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg110 = (1'h0);
  reg [(4'hc):(1'h0)] reg111 = (1'h0);
  reg [(2'h3):(1'h0)] reg112 = (1'h0);
  reg [(5'h15):(1'h0)] reg113 = (1'h0);
  reg [(5'h10):(1'h0)] reg114 = (1'h0);
  reg [(2'h3):(1'h0)] reg115 = (1'h0);
  reg [(4'h9):(1'h0)] reg116 = (1'h0);
  reg [(4'hf):(1'h0)] reg117 = (1'h0);
  reg [(4'he):(1'h0)] reg118 = (1'h0);
  reg [(5'h14):(1'h0)] reg119 = (1'h0);
  reg [(2'h3):(1'h0)] reg120 = (1'h0);
  reg [(3'h4):(1'h0)] reg121 = (1'h0);
  reg [(4'h9):(1'h0)] reg123 = (1'h0);
  reg signed [(4'he):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg126 = (1'h0);
  reg [(5'h13):(1'h0)] reg131 = (1'h0);
  reg signed [(4'he):(1'h0)] reg132 = (1'h0);
  reg [(2'h3):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg134 = (1'h0);
  reg [(5'h10):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg137 = (1'h0);
  reg [(4'hf):(1'h0)] reg138 = (1'h0);
  reg [(5'h13):(1'h0)] reg142 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg143 = (1'h0);
  assign y = {wire297,
                 wire97,
                 wire99,
                 wire100,
                 wire109,
                 wire122,
                 wire127,
                 wire128,
                 wire129,
                 wire130,
                 wire139,
                 wire140,
                 wire141,
                 wire144,
                 wire145,
                 wire146,
                 wire295,
                 reg101,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 reg106,
                 reg107,
                 reg108,
                 reg110,
                 reg111,
                 reg112,
                 reg113,
                 reg114,
                 reg115,
                 reg116,
                 reg117,
                 reg118,
                 reg119,
                 reg120,
                 reg121,
                 reg123,
                 reg124,
                 reg125,
                 reg126,
                 reg131,
                 reg132,
                 reg133,
                 reg134,
                 reg135,
                 reg136,
                 reg137,
                 reg138,
                 reg142,
                 reg143,
                 (1'h0)};
  module4 #() modinst98 (wire97, clk, wire3, wire0, wire2, wire1, (8'haf));
  assign wire99 = $unsigned((!wire2));
  assign wire100 = (wire97[(4'hc):(3'h4)] ? wire2 : ({wire1} != (8'hbf)));
  always
    @(posedge clk) begin
      if ((wire3 ^ wire2[(4'ha):(4'ha)]))
        begin
          reg101 <= $unsigned((wire100[(5'h13):(5'h10)] ?
              wire1[(4'hb):(3'h6)] : wire3[(5'h14):(4'ha)]));
          reg102 <= wire1[(1'h0):(1'h0)];
        end
      else
        begin
          reg101 <= $signed(wire99);
          reg102 <= (+$signed($unsigned((8'hb1))));
          if ({((+{$signed(wire97), (~^wire97)}) ?
                  (|$unsigned($unsigned(wire97))) : wire100[(4'hc):(4'hb)]),
              (8'haf)})
            begin
              reg103 <= reg101;
              reg104 <= wire97[(4'hf):(3'h7)];
              reg105 <= $signed($signed($unsigned((8'hba))));
            end
          else
            begin
              reg103 <= ((^~(8'hab)) ?
                  reg105 : {(($unsigned(reg101) - (~&reg103)) < {reg101[(3'h5):(3'h4)],
                          wire97[(2'h2):(2'h2)]}),
                      reg104[(4'he):(2'h2)]});
              reg104 <= reg103;
            end
          reg106 <= wire0;
        end
    end
  always
    @(posedge clk) begin
      reg107 <= $signed(reg106);
      reg108 <= $signed((wire0[(4'h9):(3'h7)] >> wire100));
    end
  assign wire109 = ((~$signed(($signed((8'ha5)) >= ((8'haf) + wire99)))) - $unsigned(reg107));
  always
    @(posedge clk) begin
      reg110 <= $signed((reg101[(5'h10):(3'h4)] ?
          ($signed((reg108 + reg102)) >>> $unsigned(reg102)) : (($unsigned(wire100) ?
                  {(8'hab)} : reg107) ?
              wire1 : wire1)));
      reg111 <= $signed(wire109);
      if ($signed(((((^reg102) ?
          {reg111} : wire2[(3'h6):(3'h4)]) >> $unsigned((reg108 <= wire0))) >= $signed((~|(!reg111))))))
        begin
          reg112 <= wire99;
          reg113 <= (~^reg112);
          reg114 <= ($signed({$signed((~^wire100)),
                  ((^(8'h9f)) ? (~|reg104) : (~&reg111))}) ?
              $unsigned($signed((^(reg107 ^~ wire97)))) : reg110[(4'h9):(1'h1)]);
        end
      else
        begin
          if ($signed($signed(($unsigned((&wire100)) > (~$unsigned(wire3))))))
            begin
              reg112 <= $unsigned((wire0 ?
                  reg107 : (^~((wire99 ~^ reg112) ?
                      reg107 : $unsigned(wire0)))));
              reg113 <= ($unsigned(($signed(reg112[(2'h2):(2'h2)]) ?
                  (+$signed((8'h9c))) : ((~^reg108) ?
                      (^reg105) : reg104))) >= (~($unsigned({reg110, reg103}) ?
                  (reg110[(4'he):(4'h8)] ?
                      (reg108 ?
                          wire97 : reg103) : (reg110 == reg114)) : ($unsigned(wire109) ?
                      reg108[(5'h10):(3'h7)] : (reg113 ? reg110 : reg104)))));
              reg114 <= wire97;
              reg115 <= reg104[(2'h2):(1'h0)];
            end
          else
            begin
              reg112 <= $unsigned(reg112[(2'h3):(1'h0)]);
            end
          reg116 <= {(({reg110[(4'he):(4'hd)]} ?
                      (~&(8'ha5)) : (^~reg114[(4'he):(1'h0)])) ?
                  (reg101 - reg103) : reg114[(3'h7):(1'h0)])};
          reg117 <= reg104[(4'ha):(3'h7)];
          if ((-($signed((((8'h9c) ? wire100 : reg117) >> (wire0 ?
              wire0 : reg104))) << ($unsigned((wire97 ?
              wire99 : reg108)) >= $unsigned(reg107[(1'h0):(1'h0)])))))
            begin
              reg118 <= reg107[(2'h3):(2'h3)];
              reg119 <= (wire3[(2'h3):(1'h1)] > ($unsigned(reg110[(3'h5):(2'h2)]) | (!({reg116} ~^ (|reg105)))));
              reg120 <= reg107;
              reg121 <= reg117;
            end
          else
            begin
              reg118 <= (reg116[(1'h0):(1'h0)] | (-$unsigned((reg115 ?
                  $unsigned(reg118) : (reg108 ? wire3 : reg113)))));
            end
        end
    end
  assign wire122 = reg121[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg123 <= (wire1[(3'h4):(1'h0)] ?
          (($unsigned(reg101) < wire122) ?
              $unsigned(wire2[(3'h4):(3'h4)]) : (~&((~|reg115) <= wire0))) : (~&(-$signed(reg116))));
      reg124 <= $unsigned((~^$signed({reg106, (^~wire109)})));
      reg125 <= $unsigned(wire122[(2'h2):(2'h2)]);
      reg126 <= $signed((wire97[(2'h3):(1'h0)] ?
          reg115[(2'h2):(2'h2)] : (~|wire3)));
    end
  assign wire127 = wire2;
  assign wire128 = wire122[(2'h3):(1'h0)];
  assign wire129 = ((7'h41) >= $unsigned((~^$signed(reg106[(1'h1):(1'h0)]))));
  assign wire130 = wire0;
  always
    @(posedge clk) begin
      reg131 <= $unsigned(wire3[(5'h14):(4'he)]);
      if ($signed(reg110))
        begin
          reg132 <= ({(^$signed((8'hb7))), reg118} ?
              reg106[(3'h7):(2'h3)] : reg110[(1'h0):(1'h0)]);
          reg133 <= $signed($unsigned($unsigned(reg118[(2'h2):(1'h0)])));
          reg134 <= ($signed({({reg123} ?
                      (reg108 != wire100) : {wire127, reg106}),
                  wire109[(3'h5):(2'h2)]}) ?
              (({wire127[(2'h2):(2'h2)]} > reg126[(5'h11):(5'h11)]) - ((wire2[(2'h2):(2'h2)] || reg123[(4'h8):(1'h0)]) ?
                  wire122 : {((8'ha3) >> reg113),
                      {reg108, wire130}})) : reg121);
          if (reg112[(1'h1):(1'h0)])
            begin
              reg135 <= wire2;
              reg136 <= ($unsigned(reg105) <= (8'hbc));
              reg137 <= reg107;
            end
          else
            begin
              reg135 <= ((wire128 ?
                      $signed($signed((wire122 ? reg136 : reg125))) : reg110) ?
                  reg104[(3'h5):(2'h2)] : ((!(~&{reg102, reg137})) ?
                      reg132 : $signed((~&(reg104 - reg111)))));
              reg136 <= ($signed(wire97) && $signed(reg108));
            end
          reg138 <= (|$unsigned((-((|reg131) == (wire3 - wire97)))));
        end
      else
        begin
          reg132 <= (&reg124);
          reg133 <= (~&wire3);
          reg134 <= ($unsigned(($signed(wire99) ?
                  wire130[(3'h7):(1'h1)] : (~^(reg116 ? reg124 : reg134)))) ?
              $unsigned($unsigned($unsigned((wire130 ?
                  (8'hb7) : reg101)))) : wire99);
          reg135 <= $unsigned(reg118[(4'hd):(4'h8)]);
        end
    end
  assign wire139 = $signed((~$unsigned($unsigned(reg113))));
  assign wire140 = (({(8'hbb)} ?
                           reg138 : ($unsigned($signed(reg114)) ?
                               $unsigned($signed(wire109)) : (-$unsigned((8'hb1))))) ?
                       $signed($unsigned((~reg101))) : $unsigned(reg116));
  assign wire141 = reg107[(3'h4):(2'h2)];
  always
    @(posedge clk) begin
      reg142 <= wire0[(2'h2):(2'h2)];
      reg143 <= $signed($signed(reg110[(4'hb):(4'h9)]));
    end
  assign wire144 = (reg103[(4'ha):(1'h0)] ?
                       wire3 : ((~($signed((8'hbb)) != (-wire140))) ?
                           reg110[(4'he):(3'h5)] : $unsigned(($signed(reg138) ?
                               (reg134 ? wire130 : (7'h44)) : reg137))));
  assign wire145 = $signed(((wire122 ?
                       {wire97[(4'ha):(1'h1)]} : (wire141 ?
                           reg123[(3'h6):(2'h3)] : reg142)) | $unsigned(($unsigned(reg110) & reg132[(4'hb):(4'hb)]))));
  assign wire146 = (~|{(reg111[(3'h7):(2'h3)] * $signed(reg101[(4'h9):(3'h6)]))});
  module147 #() modinst296 (wire295, clk, reg136, reg104, wire2, reg106);
  assign wire297 = (wire127[(2'h3):(2'h3)] ?
                       $signed($signed($unsigned((reg137 || wire130)))) : reg121[(2'h2):(1'h1)]);
endmodule

module module147
#(parameter param294 = ((&({((8'hb5) ? (8'hae) : (8'hbb)), (~^(8'had))} < ((!(8'hae)) | (&(7'h44))))) ? (|(&(8'hb3))) : ((8'hbf) & {(~|((7'h41) ? (8'hb2) : (8'ha8))), (((8'hb0) > (8'hb2)) * ((8'hbd) ? (8'hb6) : (8'ha2)))})))
(y, clk, wire148, wire149, wire150, wire151);
  output wire [(32'h2f0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire148;
  input wire signed [(3'h4):(1'h0)] wire149;
  input wire [(5'h11):(1'h0)] wire150;
  input wire signed [(4'hc):(1'h0)] wire151;
  wire [(2'h2):(1'h0)] wire293;
  wire signed [(4'hf):(1'h0)] wire287;
  wire [(3'h7):(1'h0)] wire286;
  wire signed [(5'h11):(1'h0)] wire265;
  wire signed [(4'h9):(1'h0)] wire264;
  wire signed [(4'ha):(1'h0)] wire243;
  wire signed [(4'hf):(1'h0)] wire237;
  wire [(3'h7):(1'h0)] wire236;
  wire signed [(4'ha):(1'h0)] wire235;
  wire [(2'h3):(1'h0)] wire234;
  wire [(4'hc):(1'h0)] wire233;
  wire signed [(4'hf):(1'h0)] wire152;
  wire [(5'h12):(1'h0)] wire153;
  wire signed [(5'h13):(1'h0)] wire191;
  wire [(3'h4):(1'h0)] wire193;
  wire [(5'h10):(1'h0)] wire231;
  reg signed [(5'h15):(1'h0)] reg292 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg291 = (1'h0);
  reg [(5'h14):(1'h0)] reg290 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg289 = (1'h0);
  reg [(5'h15):(1'h0)] reg288 = (1'h0);
  reg [(4'he):(1'h0)] reg285 = (1'h0);
  reg [(5'h12):(1'h0)] reg284 = (1'h0);
  reg [(3'h5):(1'h0)] reg283 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg282 = (1'h0);
  reg [(3'h7):(1'h0)] reg281 = (1'h0);
  reg [(4'hc):(1'h0)] reg280 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg279 = (1'h0);
  reg [(4'h9):(1'h0)] reg278 = (1'h0);
  reg [(4'ha):(1'h0)] reg277 = (1'h0);
  reg [(4'hb):(1'h0)] reg276 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg275 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg274 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg273 = (1'h0);
  reg [(5'h14):(1'h0)] reg272 = (1'h0);
  reg [(4'h9):(1'h0)] reg271 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg270 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg269 = (1'h0);
  reg [(3'h5):(1'h0)] reg268 = (1'h0);
  reg [(4'h9):(1'h0)] reg267 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg266 = (1'h0);
  reg [(2'h3):(1'h0)] reg263 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg262 = (1'h0);
  reg [(5'h12):(1'h0)] reg261 = (1'h0);
  reg [(3'h5):(1'h0)] reg260 = (1'h0);
  reg [(3'h5):(1'h0)] reg259 = (1'h0);
  reg [(2'h2):(1'h0)] reg258 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg257 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg256 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg255 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg254 = (1'h0);
  reg [(4'hf):(1'h0)] reg253 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg252 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg251 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg250 = (1'h0);
  reg [(5'h11):(1'h0)] reg249 = (1'h0);
  reg [(4'hd):(1'h0)] reg248 = (1'h0);
  reg [(5'h15):(1'h0)] reg247 = (1'h0);
  reg [(4'hf):(1'h0)] reg246 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg245 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg244 = (1'h0);
  reg [(2'h2):(1'h0)] reg242 = (1'h0);
  reg [(5'h13):(1'h0)] reg241 = (1'h0);
  reg [(4'ha):(1'h0)] reg240 = (1'h0);
  reg signed [(4'he):(1'h0)] reg239 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg238 = (1'h0);
  assign y = {wire293,
                 wire287,
                 wire286,
                 wire265,
                 wire264,
                 wire243,
                 wire237,
                 wire236,
                 wire235,
                 wire234,
                 wire233,
                 wire152,
                 wire153,
                 wire191,
                 wire193,
                 wire231,
                 reg292,
                 reg291,
                 reg290,
                 reg289,
                 reg288,
                 reg285,
                 reg284,
                 reg283,
                 reg282,
                 reg281,
                 reg280,
                 reg279,
                 reg278,
                 reg277,
                 reg276,
                 reg275,
                 reg274,
                 reg273,
                 reg272,
                 reg271,
                 reg270,
                 reg269,
                 reg268,
                 reg267,
                 reg266,
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
                 reg242,
                 reg241,
                 reg240,
                 reg239,
                 reg238,
                 (1'h0)};
  assign wire152 = wire149[(2'h2):(2'h2)];
  assign wire153 = ($unsigned($signed(wire148)) ?
                       (wire148[(3'h5):(2'h2)] ?
                           ($signed((^wire151)) ?
                               ($signed(wire151) ?
                                   wire151[(3'h5):(3'h4)] : wire148) : (~(-wire152))) : wire150) : wire150);
  module154 #() modinst192 (wire191, clk, wire148, wire153, wire151, wire152);
  assign wire193 = $unsigned($signed($signed((8'ha5))));
  module194 #() modinst232 (.wire195(wire150), .wire196(wire152), .wire198(wire153), .wire197(wire151), .clk(clk), .wire199(wire148), .y(wire231));
  assign wire233 = (~|$signed($unsigned($signed((8'hb7)))));
  assign wire234 = (($signed(((wire193 ^ wire149) <<< {wire193})) <<< $signed({wire153[(3'h6):(3'h5)]})) ?
                       ({($signed(wire233) <<< $unsigned(wire231)),
                               wire191[(4'ha):(3'h6)]} ?
                           wire148 : $signed((^~((8'ha4) > wire191)))) : wire151);
  assign wire235 = $signed($signed((~^wire234[(1'h1):(1'h0)])));
  assign wire236 = ($unsigned($unsigned(($signed(wire149) ?
                       (wire231 < wire148) : {wire235,
                           wire234}))) - ($unsigned({$unsigned(wire152)}) ?
                       (|($unsigned(wire234) == (~^wire148))) : wire151));
  assign wire237 = ($signed($signed($signed($signed(wire150)))) ?
                       wire150 : wire148);
  always
    @(posedge clk) begin
      reg238 <= wire234;
      reg239 <= {((8'ha1) >= wire191[(5'h13):(4'he)]),
          ($unsigned($unsigned(((7'h41) ? wire235 : wire234))) ?
              $unsigned($signed(wire236)) : ($unsigned((reg238 ?
                      wire235 : wire233)) ?
                  wire148[(4'he):(3'h4)] : ((wire153 ?
                      wire231 : (8'hbb)) ^ (wire153 ? wire231 : wire231))))};
      reg240 <= $signed(wire234);
      reg241 <= {(((wire151 != (wire150 != reg240)) ?
                  (^~(reg239 >> (8'hb3))) : (!$signed(wire148))) ?
              {((&reg240) + $unsigned(wire234))} : wire233[(1'h0):(1'h0)]),
          wire153};
      reg242 <= $unsigned(reg238[(4'he):(3'h5)]);
    end
  assign wire243 = (&((8'hbb) ?
                       $unsigned((~&$unsigned(wire148))) : (reg239 ^~ ((wire193 ?
                               (8'hb4) : wire234) ?
                           wire235 : {reg242}))));
  always
    @(posedge clk) begin
      if ($signed(($signed($unsigned($signed(reg242))) ?
          $signed($unsigned({reg242})) : {(8'had)})))
        begin
          reg244 <= wire153[(4'hd):(4'h9)];
        end
      else
        begin
          reg244 <= (8'ha8);
          reg245 <= wire235;
          if ($unsigned({wire243[(2'h3):(2'h3)]}))
            begin
              reg246 <= $unsigned(wire152[(1'h1):(1'h1)]);
              reg247 <= reg245[(3'h5):(1'h0)];
              reg248 <= $signed($signed(reg247[(3'h7):(1'h0)]));
              reg249 <= ((-(reg248 ?
                  {reg242,
                      {reg242,
                          wire150}} : ($signed(wire236) - $unsigned(wire234)))) * ($signed(reg247) - $signed((^~$unsigned((8'ha9))))));
            end
          else
            begin
              reg246 <= $unsigned(wire149);
              reg247 <= (8'ha1);
              reg248 <= wire236[(3'h5):(2'h2)];
            end
        end
      if (wire233[(3'h5):(3'h5)])
        begin
          if ($signed({$signed((+{reg248})),
              (($signed((8'hb8)) ?
                      reg241[(5'h10):(1'h0)] : (reg244 == wire149)) ?
                  $signed((-wire233)) : $unsigned(wire149[(2'h2):(1'h1)]))}))
            begin
              reg250 <= (~^(wire151[(3'h4):(3'h4)] ?
                  (wire149[(3'h4):(1'h0)] ?
                      (~|((8'hba) >>> reg246)) : (8'ha8)) : ((wire234[(1'h0):(1'h0)] >= (reg239 ?
                          wire234 : reg239)) ?
                      $signed($signed(wire237)) : (wire237[(3'h4):(1'h0)] ?
                          $unsigned(reg242) : $unsigned(wire237)))));
              reg251 <= $signed((^reg247));
              reg252 <= wire234[(1'h0):(1'h0)];
              reg253 <= wire236[(1'h1):(1'h1)];
            end
          else
            begin
              reg250 <= (reg249[(3'h6):(2'h3)] ?
                  ($unsigned(wire231[(4'ha):(4'h9)]) ?
                      wire149 : ($signed($signed(reg247)) == reg240)) : reg250);
              reg251 <= (8'hb8);
              reg252 <= ($unsigned((wire243[(3'h7):(1'h1)] ?
                      (8'hb4) : (~|$unsigned(reg247)))) ?
                  $signed(({$signed((8'ha1)),
                      $signed(wire233)} & wire191)) : (^~(((wire237 * reg249) != {wire231,
                          reg253}) ?
                      $unsigned((reg249 || reg250)) : wire152[(4'hf):(3'h6)])));
            end
          if ((($unsigned($signed(wire148[(3'h7):(3'h5)])) ?
                  ($signed((+(8'haa))) <= reg239[(3'h5):(1'h1)]) : $unsigned((wire149 ?
                      {wire237} : wire231[(4'hb):(4'ha)]))) ?
              (((~reg244[(3'h7):(2'h3)]) ?
                  wire148 : reg241[(5'h10):(3'h5)]) < ($unsigned((&wire233)) ?
                  $unsigned({reg246,
                      wire234}) : wire152[(4'ha):(4'ha)])) : ((~((+wire152) && reg253[(4'ha):(1'h0)])) ?
                  {($signed(reg251) || reg247[(2'h3):(1'h1)])} : ((wire152[(2'h3):(1'h1)] ?
                          $signed(wire152) : (^reg245)) ?
                      $signed((8'hb3)) : $signed($signed(reg247))))))
            begin
              reg254 <= wire237;
              reg255 <= wire151;
              reg256 <= (^(wire152[(2'h2):(1'h0)] > ($unsigned(wire149) <= ($signed(wire152) <<< {(8'hb3)}))));
            end
          else
            begin
              reg254 <= $signed($signed($signed(wire151)));
              reg255 <= $signed((^~wire151[(3'h4):(2'h2)]));
            end
          reg257 <= (($signed($signed((8'hb5))) >= reg246) && $unsigned({wire151[(4'hc):(2'h3)]}));
          reg258 <= $unsigned(reg249);
          if (reg257[(4'h8):(4'h8)])
            begin
              reg259 <= $unsigned({$unsigned($unsigned($signed(reg246))),
                  $signed({(!reg258), (~&wire148)})});
            end
          else
            begin
              reg259 <= $unsigned(reg256);
              reg260 <= (~|reg258[(1'h1):(1'h0)]);
              reg261 <= reg241[(3'h5):(3'h5)];
            end
        end
      else
        begin
          reg250 <= wire193[(2'h3):(1'h0)];
          if ($signed(wire231))
            begin
              reg251 <= ($signed((-($signed(reg248) ^~ (^~reg246)))) == ((&$signed((~&wire243))) <= reg257[(2'h2):(2'h2)]));
              reg252 <= $unsigned($unsigned({{wire148[(4'hc):(3'h5)]}}));
              reg253 <= (((|reg258) ?
                      ((~&$signed(reg253)) != (&wire191)) : $signed(reg250[(4'ha):(1'h0)])) ?
                  wire149 : $unsigned(((wire151[(1'h1):(1'h0)] ?
                          $signed(reg257) : reg245[(3'h7):(3'h6)]) ?
                      reg249[(4'hf):(3'h4)] : reg245[(4'hf):(3'h5)])));
              reg254 <= $unsigned($unsigned(($unsigned((+reg252)) ?
                  ((reg242 ^ reg250) ?
                      (&reg250) : ((8'ha1) ? reg238 : wire193)) : ({wire235} ?
                      reg247[(4'hd):(2'h3)] : reg239))));
              reg255 <= (-{wire193, (~|{reg240, $unsigned((7'h42))})});
            end
          else
            begin
              reg251 <= $signed(wire231);
              reg252 <= ($unsigned(($unsigned($unsigned(reg239)) ?
                  $signed((wire231 == wire152)) : wire153[(4'hc):(1'h0)])) >> $unsigned(wire193[(1'h1):(1'h1)]));
              reg253 <= reg238;
            end
          reg256 <= reg245[(3'h5):(1'h0)];
          if (reg244[(2'h3):(1'h0)])
            begin
              reg257 <= ($unsigned($unsigned((wire149 != (wire152 > reg253)))) ?
                  wire150[(4'h9):(1'h0)] : $signed(($unsigned(wire150) ?
                      ((reg254 ?
                          wire150 : reg244) ^ wire231[(3'h7):(1'h1)]) : wire243[(3'h4):(1'h1)])));
              reg258 <= ($unsigned((reg252 ?
                      ((reg246 ? wire151 : (8'hbb)) ?
                          $signed(wire193) : (reg250 > (8'hb9))) : ((^wire234) * (reg251 ?
                          reg250 : (8'ha8))))) ?
                  {reg244[(2'h3):(1'h1)],
                      $signed((-$unsigned(reg241)))} : $unsigned(reg252));
              reg259 <= (|{wire237[(3'h7):(1'h0)]});
            end
          else
            begin
              reg257 <= (~^(wire233 ?
                  $unsigned(($signed(reg241) ?
                      (wire236 << reg252) : (wire231 ?
                          wire231 : reg256))) : wire191[(5'h11):(2'h2)]));
              reg258 <= $unsigned(($signed((-(reg251 ?
                  reg245 : reg261))) | $signed(($unsigned(reg244) == wire243))));
            end
        end
      reg262 <= $unsigned(((reg258[(1'h1):(1'h0)] ?
          reg259 : $unsigned($signed(wire152))) * $signed((wire191 ~^ $unsigned(reg253)))));
      reg263 <= (^{reg247});
    end
  assign wire264 = wire150[(4'ha):(2'h3)];
  assign wire265 = $signed($signed(($unsigned($signed(reg254)) != ((8'hb0) >= $unsigned((8'h9f))))));
  always
    @(posedge clk) begin
      if (reg238)
        begin
          if ($signed(wire243[(2'h3):(2'h3)]))
            begin
              reg266 <= (reg251[(2'h2):(1'h1)] && wire193[(3'h4):(1'h0)]);
              reg267 <= $signed(reg258[(1'h0):(1'h0)]);
              reg268 <= wire236[(1'h1):(1'h1)];
              reg269 <= {$unsigned(reg241[(3'h7):(2'h3)])};
              reg270 <= $signed($signed(wire231));
            end
          else
            begin
              reg266 <= wire149[(2'h3):(2'h3)];
              reg267 <= $signed(reg245);
            end
        end
      else
        begin
          if ((^~{reg242[(2'h2):(1'h1)], $signed(reg255[(2'h2):(1'h1)])}))
            begin
              reg266 <= (~^wire152[(4'hb):(2'h2)]);
              reg267 <= $unsigned((wire233 ?
                  $unsigned(wire149) : ($unsigned({reg246,
                      reg249}) - $signed((reg252 ? reg257 : reg257)))));
              reg268 <= $unsigned({wire264[(3'h4):(1'h1)],
                  (((-wire151) << {wire153}) ?
                      $signed(reg247[(5'h15):(1'h0)]) : $unsigned($signed(reg269)))});
              reg269 <= $unsigned(((wire152 ?
                  wire233[(3'h4):(1'h1)] : $unsigned({reg248,
                      wire152})) != reg247[(3'h5):(3'h5)]));
            end
          else
            begin
              reg266 <= (-(((wire243[(3'h7):(2'h3)] >>> $unsigned(wire265)) ?
                  $signed((wire191 ?
                      wire151 : (8'hb9))) : ((|reg242) < (&reg268))) << wire235[(3'h7):(1'h1)]));
              reg267 <= ($unsigned((((reg263 ? reg263 : wire237) ?
                      $signed(reg263) : (reg262 * reg249)) != {(wire150 ~^ wire235)})) ?
                  (|{$unsigned($signed(reg268)),
                      wire264}) : $signed({(-$signed(reg259)),
                      reg242[(1'h0):(1'h0)]}));
            end
          reg270 <= reg254;
          if (reg241)
            begin
              reg271 <= (((reg245[(2'h3):(1'h1)] && wire231) < ((8'hb1) >> $signed($signed(reg257)))) && ((^~{(reg248 ?
                          reg247 : reg266)}) ?
                  $signed((^wire153[(2'h2):(1'h0)])) : reg262));
              reg272 <= ((!(reg268 * ($signed(reg269) ?
                      wire243 : (!wire234)))) ?
                  reg247 : reg247[(5'h14):(4'hf)]);
              reg273 <= $signed(reg238);
            end
          else
            begin
              reg271 <= $signed(($unsigned(reg273[(3'h4):(2'h2)]) <<< wire148));
              reg272 <= (8'hb5);
              reg273 <= $unsigned(((($signed(reg244) || $signed(wire231)) ^~ ($unsigned((8'hba)) * reg266[(2'h3):(2'h2)])) ?
                  ((!(reg249 >> reg245)) * ((reg253 ?
                      reg262 : (8'ha8)) ^ $unsigned((8'hb0)))) : (&reg271)));
            end
          if ($unsigned((8'hac)))
            begin
              reg274 <= reg247[(3'h6):(2'h2)];
              reg275 <= wire191[(3'h7):(2'h3)];
              reg276 <= ((wire191 ?
                      reg252 : ($unsigned($unsigned((8'hb9))) ?
                          (-$signed(wire150)) : $unsigned((reg268 ?
                              wire191 : reg254)))) ?
                  $unsigned(((~^(wire231 << wire153)) ?
                      $signed($unsigned(reg245)) : reg261)) : reg247);
              reg277 <= $unsigned($unsigned(reg252[(2'h3):(1'h0)]));
            end
          else
            begin
              reg274 <= ($signed((+reg250[(4'hb):(4'hb)])) ^~ (~|reg254));
              reg275 <= wire233[(3'h6):(3'h4)];
              reg276 <= (!reg247);
              reg277 <= ({({(reg259 == reg260)} ^~ (~(reg259 ?
                      reg246 : reg254))),
                  reg277[(3'h4):(2'h3)]} ^ {$signed((&wire243))});
              reg278 <= $signed(reg277);
            end
          if ((8'ha9))
            begin
              reg279 <= reg276[(3'h4):(1'h1)];
              reg280 <= $signed(wire193);
              reg281 <= reg273;
              reg282 <= (reg277[(4'h8):(4'h8)] | wire150);
            end
          else
            begin
              reg279 <= reg254[(3'h7):(3'h4)];
              reg280 <= (8'hb0);
              reg281 <= reg254;
              reg282 <= reg239[(4'hd):(3'h4)];
              reg283 <= (^~($signed($unsigned(reg251[(4'h9):(3'h7)])) << {(reg252 ?
                      (reg250 ? wire264 : wire231) : ((8'haf) ?
                          reg259 : reg275))}));
            end
        end
      reg284 <= (8'hbe);
      reg285 <= (($unsigned({reg262[(4'ha):(2'h3)]}) ?
              reg242[(1'h0):(1'h0)] : $unsigned(reg272)) ?
          $unsigned(reg272[(5'h10):(2'h3)]) : (^reg245));
    end
  assign wire286 = ($unsigned($signed($unsigned(((8'hb5) ?
                           reg253 : wire235)))) ?
                       $unsigned($unsigned(($signed(reg271) ?
                           (reg258 ?
                               reg280 : reg257) : $unsigned((8'h9d))))) : $unsigned((wire264[(3'h6):(2'h3)] >= {$unsigned(wire150)})));
  assign wire287 = $unsigned((!reg276));
  always
    @(posedge clk) begin
      reg288 <= reg244[(4'h8):(4'h8)];
      reg289 <= $unsigned(reg250[(3'h7):(1'h0)]);
      reg290 <= reg244;
      reg291 <= $unsigned({$unsigned($unsigned(reg268))});
      reg292 <= ($unsigned(reg239[(3'h7):(1'h0)]) ?
          (~|$signed($unsigned(wire287[(4'hf):(4'hc)]))) : wire191[(4'ha):(4'ha)]);
    end
  assign wire293 = (wire286[(3'h4):(1'h0)] <= $unsigned({$unsigned((8'ha7))}));
endmodule

module module4
#(parameter param95 = (~&(((+(~^(8'hb6))) == (!(^(8'ha3)))) ? ((~(^~(8'ha5))) > (((8'hb1) <= (8'hb3)) ? (+(8'hb4)) : ((7'h44) + (8'hbc)))) : (((^(8'ha8)) && {(8'ha8)}) ? ((+(8'hb8)) ? (|(8'ha1)) : {(8'hae)}) : (((8'hb3) | (8'ha8)) + ((8'hae) ? (8'h9e) : (8'h9f)))))), 
parameter param96 = (((({param95} ? {param95, param95} : (param95 ? param95 : param95)) == ((^param95) ? (param95 < param95) : (param95 || param95))) <<< (!(~^param95))) ? (param95 ~^ (({param95, param95} ? (~|param95) : (-param95)) ? (+param95) : param95)) : (8'hb4)))
(y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h156):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire5;
  input wire signed [(4'hc):(1'h0)] wire6;
  input wire [(4'he):(1'h0)] wire7;
  input wire signed [(4'ha):(1'h0)] wire8;
  input wire signed [(4'h9):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire94;
  wire [(4'hf):(1'h0)] wire93;
  wire signed [(5'h10):(1'h0)] wire92;
  wire [(5'h15):(1'h0)] wire91;
  wire signed [(3'h4):(1'h0)] wire90;
  wire [(4'h8):(1'h0)] wire89;
  wire signed [(4'ha):(1'h0)] wire10;
  wire [(4'hf):(1'h0)] wire25;
  wire signed [(5'h11):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire27;
  wire [(4'he):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire29;
  wire [(4'h8):(1'h0)] wire30;
  wire signed [(4'ha):(1'h0)] wire31;
  wire [(4'ha):(1'h0)] wire87;
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire10,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire87,
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
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire10 = $signed((wire6[(3'h4):(1'h0)] ?
                      wire8[(1'h1):(1'h1)] : $signed($unsigned((wire9 ?
                          wire8 : (8'hb8))))));
  always
    @(posedge clk) begin
      if ($unsigned({$unsigned($signed((wire5 > wire7)))}))
        begin
          reg11 <= wire5[(1'h1):(1'h0)];
          reg12 <= wire7;
          reg13 <= wire8[(4'h9):(1'h0)];
          reg14 <= $unsigned($signed($signed($signed(((8'hbb) << wire6)))));
        end
      else
        begin
          if ({wire5[(4'hf):(1'h0)], $unsigned((7'h41))})
            begin
              reg11 <= wire9[(2'h3):(1'h1)];
              reg12 <= (($signed((wire5 == (wire10 || (8'h9d)))) ?
                      $unsigned(wire6) : {(((8'had) | reg14) == ((8'hb1) ?
                              wire8 : (8'ha7)))}) ?
                  $unsigned(wire10) : (^{{(^wire8), ((8'ha1) ? reg11 : reg11)},
                      {(wire7 ? (8'hb3) : reg14)}}));
            end
          else
            begin
              reg11 <= {wire8[(1'h0):(1'h0)], wire7[(4'h9):(3'h6)]};
              reg12 <= $unsigned((!$signed(wire10)));
              reg13 <= ((reg12 << $unsigned({(reg14 - wire10),
                      (reg12 << reg11)})) ?
                  ((+(8'hbd)) ?
                      ($signed($signed(wire5)) >> $unsigned(wire5[(5'h10):(4'h8)])) : reg12) : {reg11});
              reg14 <= wire9;
              reg15 <= reg12[(5'h11):(1'h0)];
            end
          reg16 <= (((~|({reg15} - $unsigned(wire5))) ?
                  reg14 : ($signed((~|(8'hac))) + (~^{reg12, wire7}))) ?
              (($unsigned((-reg15)) ?
                      reg15[(2'h3):(2'h2)] : $signed((reg11 ?
                          (8'ha3) : reg11))) ?
                  $unsigned(((^~wire5) ?
                      ((8'hbe) - wire8) : $unsigned(wire10))) : $unsigned((&(reg15 != reg12)))) : wire7);
          reg17 <= wire9[(1'h0):(1'h0)];
          reg18 <= wire6;
          if (wire10[(2'h3):(1'h0)])
            begin
              reg19 <= $unsigned((($unsigned({reg15,
                      reg12}) < reg11[(2'h2):(1'h0)]) ?
                  $unsigned(reg11) : reg12));
              reg20 <= ($signed((($unsigned(wire7) & reg19[(3'h4):(1'h0)]) != reg13[(2'h2):(1'h0)])) >>> $unsigned({$unsigned((reg19 ^ wire10)),
                  wire8[(4'ha):(4'h8)]}));
              reg21 <= reg17[(2'h2):(1'h1)];
              reg22 <= $unsigned((($unsigned(reg16[(3'h7):(1'h1)]) ~^ ($signed(reg16) ?
                  reg19 : (~&reg13))) != reg11[(2'h3):(1'h0)]));
              reg23 <= $unsigned($unsigned((wire9 ?
                  (reg19 ^ $signed(wire8)) : (~(reg19 ? (8'hb6) : wire9)))));
            end
          else
            begin
              reg19 <= $signed((-(reg11[(3'h7):(1'h1)] <= ((~^(8'h9c)) >> (reg16 | wire10)))));
              reg20 <= (&{reg17});
            end
        end
      reg24 <= $signed(wire10[(4'h9):(3'h6)]);
    end
  assign wire25 = (~^((8'hbd) ?
                      $unsigned((reg11 ~^ (~&(7'h43)))) : ($signed($signed(reg15)) ^ wire5[(3'h4):(2'h3)])));
  assign wire26 = $signed((^reg11));
  assign wire27 = (reg22[(3'h5):(1'h0)] * (~(^~reg14[(1'h0):(1'h0)])));
  assign wire28 = ((~(^~reg20)) > wire26);
  assign wire29 = $unsigned(wire8);
  assign wire30 = $unsigned($unsigned(($signed(reg15[(2'h3):(1'h0)]) >= {reg21[(1'h0):(1'h0)],
                      (reg15 <= reg18)})));
  assign wire31 = $signed(reg12[(1'h1):(1'h1)]);
  module32 #() modinst88 (.clk(clk), .y(wire87), .wire37(wire6), .wire35(wire29), .wire33(wire5), .wire34(reg14), .wire36(reg18));
  assign wire89 = wire30[(2'h2):(1'h1)];
  assign wire90 = ((8'h9e) <= (reg23[(1'h1):(1'h1)] != wire6));
  assign wire91 = (reg14[(5'h10):(3'h5)] ?
                      (~&(^(^~((8'ha2) <= (8'hbb))))) : ((7'h44) || $unsigned(reg15)));
  assign wire92 = (|reg19[(1'h0):(1'h0)]);
  assign wire93 = $signed({(((^wire28) | (wire25 || wire5)) ^~ ((reg21 || reg23) <= (wire27 ?
                          wire30 : reg21))),
                      wire5[(5'h14):(5'h10)]});
  assign wire94 = wire6;
endmodule

module module32
#(parameter param86 = {((-(((8'hab) < (8'hb5)) ~^ ((8'hb6) <<< (8'ha4)))) ? (|(((8'ha7) >>> (8'hb1)) ^ ((8'ha7) ? (8'hbe) : (8'hba)))) : {(((8'h9f) ? (8'ha6) : (8'ha6)) ? ((8'h9c) ^ (8'h9e)) : (~^(7'h41)))})})
(y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'h22a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire37;
  input wire signed [(2'h2):(1'h0)] wire36;
  input wire signed [(2'h2):(1'h0)] wire35;
  input wire [(5'h14):(1'h0)] wire34;
  input wire [(4'h9):(1'h0)] wire33;
  wire signed [(3'h4):(1'h0)] wire85;
  wire signed [(4'hb):(1'h0)] wire74;
  wire signed [(4'hf):(1'h0)] wire72;
  wire [(5'h10):(1'h0)] wire71;
  wire signed [(2'h3):(1'h0)] wire70;
  wire [(4'hc):(1'h0)] wire69;
  wire [(4'hd):(1'h0)] wire68;
  wire [(4'h8):(1'h0)] wire66;
  wire signed [(5'h10):(1'h0)] wire65;
  wire signed [(3'h5):(1'h0)] wire64;
  wire signed [(3'h5):(1'h0)] wire63;
  wire [(4'h9):(1'h0)] wire40;
  wire signed [(4'hb):(1'h0)] wire39;
  wire [(5'h15):(1'h0)] wire38;
  reg signed [(4'he):(1'h0)] reg84 = (1'h0);
  reg [(5'h10):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg82 = (1'h0);
  reg [(5'h14):(1'h0)] reg81 = (1'h0);
  reg signed [(4'he):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg79 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg77 = (1'h0);
  reg signed [(4'he):(1'h0)] reg76 = (1'h0);
  reg [(5'h12):(1'h0)] reg75 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg62 = (1'h0);
  reg [(2'h2):(1'h0)] reg61 = (1'h0);
  reg [(4'he):(1'h0)] reg60 = (1'h0);
  reg [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg58 = (1'h0);
  reg [(4'hd):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg56 = (1'h0);
  reg [(5'h11):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg54 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg52 = (1'h0);
  reg signed [(4'he):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg50 = (1'h0);
  reg [(4'hf):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg48 = (1'h0);
  reg [(4'hf):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  assign y = {wire85,
                 wire74,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire40,
                 wire39,
                 wire38,
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
                 reg73,
                 reg67,
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
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  assign wire38 = $signed(wire36);
  assign wire39 = $signed(wire34[(4'h8):(4'h8)]);
  assign wire40 = $unsigned(wire34);
  always
    @(posedge clk) begin
      if ({(&$unsigned(wire35)),
          {$unsigned(((wire37 ? wire39 : wire35) >> {wire37, wire38}))}})
        begin
          if (((($signed((wire37 ? wire38 : (7'h40))) || {(~&wire37),
                      (^~wire36)}) ?
                  ({(wire35 ? wire35 : (8'ha9))} ?
                      {(wire36 + (8'hbc)), (~&wire33)} : ($unsigned((8'hb6)) ?
                          $signed(wire34) : (|wire36))) : wire36[(1'h0):(1'h0)]) ?
              wire34[(5'h11):(5'h11)] : wire34[(4'hd):(3'h4)]))
            begin
              reg41 <= ($unsigned($signed(wire33[(1'h1):(1'h1)])) | wire34[(5'h14):(5'h14)]);
              reg42 <= ((($signed((wire35 + reg41)) ?
                      (wire37 ? (~^wire38) : wire35) : $signed({reg41,
                          (8'ha3)})) ?
                  (8'hab) : wire36[(1'h0):(1'h0)]) * wire33);
              reg43 <= (^reg41);
              reg44 <= (($unsigned((&wire40)) ~^ $signed((|(~^wire38)))) | wire34);
            end
          else
            begin
              reg41 <= $signed((((wire35 >>> (!wire33)) >>> ($signed(reg41) || wire37[(2'h3):(2'h3)])) > ((^$signed(wire35)) ?
                  ((-reg42) && wire39) : wire39[(3'h4):(2'h3)])));
              reg42 <= ((&{$unsigned(wire38)}) ?
                  wire35 : (wire34 != (-wire33)));
              reg43 <= wire40;
              reg44 <= {wire35[(1'h1):(1'h0)]};
            end
        end
      else
        begin
          reg41 <= {$unsigned(wire34[(4'h8):(1'h0)]),
              $signed({(wire35[(1'h1):(1'h1)] < (~wire35))})};
        end
      if ($signed(wire37[(1'h0):(1'h0)]))
        begin
          reg45 <= (wire38 <<< wire34[(4'ha):(2'h2)]);
        end
      else
        begin
          reg45 <= $unsigned((!($signed((reg43 ^ wire35)) + wire37)));
          reg46 <= (((~|$unsigned($unsigned(wire40))) ?
                  wire39 : $signed(((wire33 ? reg43 : (8'h9e)) ?
                      reg41[(5'h12):(3'h4)] : wire38[(4'h8):(2'h3)]))) ?
              (((reg45[(2'h3):(1'h1)] >>> $signed((8'ha7))) ?
                  ($unsigned((8'hb5)) ?
                      (~^wire40) : $unsigned(reg43)) : wire33) ~^ (~&$unsigned((wire34 == (8'hbd))))) : $signed((($unsigned(wire38) ?
                  wire35 : reg42[(4'ha):(1'h1)]) * $unsigned(wire40))));
          reg47 <= (wire34[(3'h7):(3'h7)] ?
              $signed($signed(((wire40 ?
                  reg42 : reg41) || {wire33}))) : $unsigned(wire35));
        end
      reg48 <= (^~(reg46[(3'h6):(3'h5)] + ($signed($signed(reg45)) ?
          $unsigned((wire38 | reg46)) : ($signed(wire36) ^~ ((8'h9f) > reg44)))));
      if (({(reg42[(3'h6):(2'h2)] ?
              $unsigned(wire38[(4'hc):(4'hc)]) : wire39)} && {wire39[(3'h4):(2'h3)]}))
        begin
          if ({reg47[(4'hf):(3'h6)]})
            begin
              reg49 <= reg47;
              reg50 <= wire37;
            end
          else
            begin
              reg49 <= (reg49[(2'h3):(1'h0)] ? reg43 : wire37);
              reg50 <= wire36;
              reg51 <= wire39[(1'h0):(1'h0)];
              reg52 <= {(8'ha2), (reg49[(4'h9):(3'h5)] == reg48)};
            end
          reg53 <= reg46;
          reg54 <= {((~|$signed($unsigned(wire35))) | (({(8'hbb)} ?
                      (&reg53) : (&reg42)) ?
                  ($unsigned(reg49) ?
                      wire34[(3'h6):(1'h1)] : (wire38 - wire40)) : $signed((wire37 > reg42))))};
          reg55 <= $unsigned(((((reg44 ?
              wire40 : reg44) == $unsigned(reg49)) * $signed((!reg41))) <= $signed((^wire40))));
        end
      else
        begin
          reg49 <= (wire35[(1'h1):(1'h1)] ^~ (wire35 ^~ reg47[(2'h3):(2'h3)]));
          reg50 <= ((($signed($unsigned(wire37)) - (~^(reg44 ?
                  (8'ha2) : reg41))) ^~ $signed(({wire36, reg45} && (reg47 ?
                  reg44 : wire40)))) ?
              wire33 : $signed((-(~|reg52[(3'h4):(1'h1)]))));
          reg51 <= reg43;
          reg52 <= ($unsigned((reg47 ?
              (&{reg52}) : $unsigned((~^reg55)))) <<< (!{$signed($signed(wire38)),
              (wire33 ? $signed(reg55) : (|reg51))}));
          reg53 <= wire37;
        end
      if (({$signed($signed(reg50[(1'h1):(1'h1)]))} < $signed((wire34 ?
          $unsigned(reg42[(4'hb):(3'h6)]) : ((wire34 ?
              wire34 : (8'ha6)) + $signed(reg54))))))
        begin
          reg56 <= ((8'hb9) ?
              {$signed($signed((reg49 ? reg48 : reg55))),
                  reg54[(4'h8):(2'h2)]} : {$signed(reg47[(4'hb):(3'h4)]),
                  (({wire39, wire33} ?
                      (!reg45) : {reg52,
                          reg55}) || $unsigned(reg43[(2'h3):(1'h1)]))});
        end
      else
        begin
          reg56 <= $unsigned(((|{reg51}) ~^ wire35));
          reg57 <= reg48;
          if ((($unsigned($signed((^~reg42))) ?
                  $signed(reg41[(1'h1):(1'h1)]) : $unsigned((((8'ha3) ?
                          wire40 : reg48) ?
                      (~reg57) : $unsigned(reg55)))) ?
              ((8'hb2) >> reg48) : reg43[(3'h4):(1'h1)]))
            begin
              reg58 <= (~^(~$signed(reg54)));
              reg59 <= reg54;
              reg60 <= {((^wire35) ? $signed((^~reg56)) : reg53)};
              reg61 <= wire34;
            end
          else
            begin
              reg58 <= wire35[(2'h2):(2'h2)];
              reg59 <= reg55;
              reg60 <= $signed($unsigned(($unsigned(reg58[(1'h1):(1'h1)]) ?
                  reg47 : wire37[(3'h6):(3'h5)])));
              reg61 <= (&reg57[(2'h2):(2'h2)]);
              reg62 <= (reg53[(4'ha):(4'h9)] ^ (-(reg51 * $unsigned((reg52 ?
                  reg57 : reg53)))));
            end
        end
    end
  assign wire63 = reg57;
  assign wire64 = (~&$unsigned((~($unsigned(reg41) ?
                      {wire35} : $unsigned(wire34)))));
  assign wire65 = (+reg51);
  assign wire66 = {((~^((~|reg46) <= wire37)) ?
                          $signed($unsigned((^~reg60))) : ((reg43[(2'h3):(2'h2)] ?
                                  (!reg46) : (reg46 - reg41)) ?
                              {reg51} : (|(8'ha9))))};
  always
    @(posedge clk) begin
      reg67 <= reg61;
    end
  assign wire68 = $unsigned((&{$unsigned($signed(wire34))}));
  assign wire69 = (~|{($signed((wire35 + reg44)) ~^ $signed((wire40 ?
                          reg61 : reg61))),
                      (((wire40 ? reg45 : (8'h9d)) ?
                              wire36[(2'h2):(1'h1)] : (reg51 ?
                                  wire64 : wire68)) ?
                          $unsigned($signed(wire64)) : (8'hab))});
  assign wire70 = $signed($signed($unsigned($signed((reg46 ^ (8'hbd))))));
  assign wire71 = (($signed(reg54) ?
                      ($unsigned($signed(reg52)) ?
                          (~$unsigned(reg54)) : wire70) : (&(~$signed((8'h9e))))) > (($signed(wire40[(1'h1):(1'h1)]) ?
                      ((|(8'hab)) ?
                          {wire70, wire64} : (reg57 ?
                              reg42 : wire35)) : (~(wire39 ?
                          (7'h42) : reg48))) <<< wire40));
  assign wire72 = (wire68[(4'h9):(3'h5)] ?
                      (reg52[(1'h0):(1'h0)] ?
                          ({(reg41 & (8'ha5))} && reg55[(3'h7):(2'h3)]) : $unsigned((+(reg43 - (7'h42))))) : reg55[(4'he):(3'h7)]);
  always
    @(posedge clk) begin
      reg73 <= (7'h44);
    end
  assign wire74 = $signed(reg59);
  always
    @(posedge clk) begin
      reg75 <= wire64;
      if (reg53)
        begin
          reg76 <= $signed(((+reg47[(4'hb):(4'h9)]) | $unsigned($signed((reg46 - wire69)))));
          if (reg75)
            begin
              reg77 <= ($unsigned(((+reg45[(4'hd):(4'hb)]) ?
                  wire40 : (~^reg49[(2'h3):(2'h3)]))) + wire66);
              reg78 <= ((!($signed(reg50[(3'h4):(2'h2)]) + $unsigned(wire68))) - {($unsigned((&reg47)) ?
                      reg50 : $signed({wire40})),
                  $signed(($unsigned((8'ha3)) != (^~reg53)))});
            end
          else
            begin
              reg77 <= $unsigned(wire65[(4'hc):(2'h2)]);
              reg78 <= (wire64 <= ($unsigned((8'hb8)) ?
                  reg76[(4'hb):(2'h2)] : (&{reg49})));
              reg79 <= ((($signed((reg51 ? reg52 : wire33)) && {(~|reg57),
                  wire66[(4'h8):(3'h4)]}) - $unsigned(((wire37 ?
                      reg51 : reg73) ?
                  (wire68 && wire71) : reg45))) || (reg47[(2'h3):(2'h2)] < $unsigned($signed(reg55[(1'h0):(1'h0)]))));
              reg80 <= {($signed($unsigned({wire37})) <= $unsigned(reg61))};
              reg81 <= reg76[(4'hd):(4'hb)];
            end
          reg82 <= $unsigned($signed(reg80[(4'h8):(3'h6)]));
          reg83 <= wire72;
        end
      else
        begin
          reg76 <= {(8'ha9), wire64};
          if ((((reg59[(1'h0):(1'h0)] ?
              (reg56[(4'hc):(4'ha)] ?
                  reg67 : (wire70 ?
                      reg53 : reg58)) : wire66[(2'h3):(2'h2)]) > ({(~^reg61),
              (reg61 ? wire69 : reg77)} > (|(!reg56)))) > reg41))
            begin
              reg77 <= (($signed($unsigned(wire69)) ?
                  $unsigned(($unsigned(reg55) ?
                      (reg73 ? reg62 : wire66) : (reg43 != wire69))) : (wire71 ?
                      reg41[(3'h7):(1'h0)] : $signed(reg83))) <<< $unsigned((|$signed(wire40))));
            end
          else
            begin
              reg77 <= $unsigned((+$signed(reg42)));
              reg78 <= ({(!$unsigned(reg83)), reg60[(4'hd):(4'hd)]} <= reg76);
              reg79 <= $unsigned(wire38[(4'hf):(1'h1)]);
              reg80 <= wire70;
              reg81 <= wire63[(2'h3):(1'h1)];
            end
          reg82 <= $signed($signed($signed($signed(reg55[(1'h0):(1'h0)]))));
        end
      reg84 <= (+((((~reg78) ? wire65 : $unsigned((8'hb8))) ?
          reg50[(2'h3):(1'h1)] : reg51[(4'he):(3'h7)]) - $signed(($signed(reg48) ?
          wire69 : wire63[(1'h0):(1'h0)]))));
    end
  assign wire85 = $unsigned(reg75[(4'hb):(3'h4)]);
endmodule

module module194  (y, clk, wire199, wire198, wire197, wire196, wire195);
  output wire [(32'h144):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire199;
  input wire [(3'h6):(1'h0)] wire198;
  input wire [(4'hc):(1'h0)] wire197;
  input wire signed [(4'hf):(1'h0)] wire196;
  input wire signed [(5'h11):(1'h0)] wire195;
  wire [(3'h7):(1'h0)] wire230;
  wire [(4'hf):(1'h0)] wire229;
  wire signed [(4'hc):(1'h0)] wire228;
  wire signed [(2'h3):(1'h0)] wire227;
  wire signed [(5'h15):(1'h0)] wire226;
  wire signed [(5'h12):(1'h0)] wire222;
  wire [(3'h4):(1'h0)] wire221;
  wire [(2'h2):(1'h0)] wire220;
  wire [(5'h10):(1'h0)] wire213;
  wire signed [(3'h7):(1'h0)] wire212;
  reg signed [(2'h3):(1'h0)] reg225 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg224 = (1'h0);
  reg [(5'h13):(1'h0)] reg223 = (1'h0);
  reg [(2'h2):(1'h0)] reg219 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg218 = (1'h0);
  reg [(3'h7):(1'h0)] reg217 = (1'h0);
  reg [(4'he):(1'h0)] reg216 = (1'h0);
  reg [(5'h14):(1'h0)] reg215 = (1'h0);
  reg [(4'h8):(1'h0)] reg214 = (1'h0);
  reg [(2'h2):(1'h0)] reg211 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg210 = (1'h0);
  reg [(3'h4):(1'h0)] reg209 = (1'h0);
  reg [(5'h11):(1'h0)] reg208 = (1'h0);
  reg [(5'h13):(1'h0)] reg207 = (1'h0);
  reg [(4'hd):(1'h0)] reg206 = (1'h0);
  reg [(3'h6):(1'h0)] reg205 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg204 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg203 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg202 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg201 = (1'h0);
  reg [(4'hb):(1'h0)] reg200 = (1'h0);
  assign y = {wire230,
                 wire229,
                 wire228,
                 wire227,
                 wire226,
                 wire222,
                 wire221,
                 wire220,
                 wire213,
                 wire212,
                 reg225,
                 reg224,
                 reg223,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed($unsigned(wire199)))
        begin
          if ($signed((((wire198 ? $signed(wire198) : wire197[(4'h8):(1'h0)]) ?
                  wire198 : $signed({wire199, wire199})) ?
              {$signed(wire199)} : ({wire195[(4'hb):(1'h1)]} ~^ (~^wire199)))))
            begin
              reg200 <= {$signed(wire199),
                  $signed(((~&{wire199}) & ((~wire195) ?
                      wire199[(2'h2):(2'h2)] : $unsigned(wire196))))};
              reg201 <= (+$signed(wire198));
              reg202 <= ((wire195 ?
                  (reg200[(2'h2):(2'h2)] ?
                      wire196 : reg201) : {$unsigned((8'hac)),
                      $unsigned({(8'h9c)})}) * $unsigned(wire195[(5'h10):(2'h2)]));
              reg203 <= reg201[(3'h6):(2'h2)];
            end
          else
            begin
              reg200 <= $signed((($signed($signed(wire196)) - reg200) || (($signed(reg200) ?
                  reg202 : reg201[(3'h7):(1'h1)]) ~^ $signed((wire199 ?
                  wire198 : (8'hb2))))));
              reg201 <= reg203[(1'h0):(1'h0)];
              reg202 <= wire197;
            end
          reg204 <= reg201;
          reg205 <= {$signed(reg201),
              ($signed(((wire196 ^ wire195) ? reg201 : $signed(wire199))) ?
                  ({(reg202 > reg202), (!wire198)} >= $unsigned({wire198,
                      wire196})) : reg201[(3'h6):(3'h6)])};
          reg206 <= (8'ha3);
          reg207 <= reg201[(4'h8):(4'h8)];
        end
      else
        begin
          if ($unsigned((~&$unsigned((!$unsigned(reg203))))))
            begin
              reg200 <= wire198;
            end
          else
            begin
              reg200 <= $unsigned((~^$unsigned(wire196[(3'h5):(1'h1)])));
            end
          if ($signed($signed((wire199 - ((~wire198) <<< (reg204 ?
              wire198 : reg207))))))
            begin
              reg201 <= {$unsigned(($signed(wire197) ?
                      reg206[(4'ha):(2'h3)] : $signed((reg202 ~^ reg207))))};
              reg202 <= (8'h9f);
              reg203 <= {($signed(wire197) >> reg205)};
              reg204 <= $signed($unsigned(wire195[(4'hd):(4'hc)]));
              reg205 <= reg201;
            end
          else
            begin
              reg201 <= ($unsigned({($signed(reg205) < reg206)}) >= {(((reg203 != wire196) ?
                      (8'hb1) : ((8'ha7) ? reg202 : wire199)) >> (|reg204)),
                  reg204[(4'ha):(3'h6)]});
              reg202 <= $signed($signed((wire196[(3'h5):(3'h5)] ?
                  (-$signed((8'hb0))) : $unsigned($signed((7'h40))))));
              reg203 <= ($unsigned($signed($unsigned((^~reg207)))) ?
                  ((8'hb8) ?
                      {$signed((~&(8'hb4))),
                          ((reg207 ? wire197 : (7'h43)) ?
                              (reg205 < wire198) : (^~wire195))} : reg202) : $signed($signed(((reg204 ?
                      wire198 : reg200) * (reg205 | (8'ha7))))));
              reg204 <= wire198;
              reg205 <= ({reg204} > ({wire198} >= wire196[(4'h8):(1'h0)]));
            end
        end
      reg208 <= (-($signed($unsigned(wire195[(5'h10):(2'h2)])) ~^ reg204));
      reg209 <= reg206;
      reg210 <= {$signed($signed((~(reg208 != reg205)))),
          ($unsigned((wire199 ?
              {reg205,
                  wire198} : (wire195 >= reg205))) > (!($unsigned(wire195) ?
              (reg206 ? reg200 : reg201) : (~|reg209))))};
      reg211 <= {$unsigned(reg204[(1'h0):(1'h0)])};
    end
  assign wire212 = ({(-wire196[(4'h9):(3'h5)]),
                       ($signed(reg208[(3'h7):(3'h4)]) ?
                           (|(!wire195)) : $unsigned($signed(reg204)))} + wire196[(4'ha):(1'h1)]);
  assign wire213 = (8'hb7);
  always
    @(posedge clk) begin
      if (($signed(reg200) == ($unsigned((wire199[(5'h14):(4'h8)] > $signed(reg200))) ?
          (|$unsigned((reg209 ?
              (7'h42) : reg206))) : (wire212 > $signed($signed(wire213))))))
        begin
          reg214 <= (reg203[(2'h3):(2'h3)] > $signed(reg201[(3'h7):(3'h6)]));
          reg215 <= (reg208 & ((!reg214[(1'h1):(1'h0)]) == $unsigned($signed((reg206 ?
              reg210 : reg207)))));
          reg216 <= (~|(~&(({reg201} != (|reg209)) ~^ $unsigned((~&reg205)))));
          reg217 <= (wire197 > ($unsigned({wire196[(4'hf):(4'hb)],
                  wire213[(4'hf):(2'h2)]}) ?
              $unsigned((((7'h44) ?
                  wire195 : reg202) && (reg216 ^ wire196))) : (7'h44)));
        end
      else
        begin
          if (wire196)
            begin
              reg214 <= ($unsigned(wire213[(1'h0):(1'h0)]) <= ($unsigned(($unsigned(reg216) ?
                  (wire213 ? wire212 : wire196) : (reg208 ?
                      reg200 : (8'h9f)))) >> (^~{(!reg210),
                  wire213[(3'h7):(1'h0)]})));
              reg215 <= $signed(((~&(8'haa)) | (({(8'h9e),
                  reg204} - {reg209}) ^~ reg204[(2'h2):(1'h0)])));
              reg216 <= $unsigned((reg217 < $signed(reg203)));
              reg217 <= (({{{reg215, (8'ha0)}, $unsigned(wire212)},
                      (wire212 | $signed(wire199))} ?
                  ((!(reg201 ?
                      reg211 : (8'hb6))) && (reg214[(3'h6):(3'h6)] - wire213)) : reg204) << {wire213[(4'h9):(2'h2)]});
            end
          else
            begin
              reg214 <= {$unsigned({((^reg208) > wire213[(3'h5):(3'h5)]),
                      {((8'ha9) ? reg217 : (8'h9e))}}),
                  $signed((!(~&{wire213})))};
              reg215 <= wire197;
              reg216 <= {reg203};
            end
          reg218 <= ($unsigned(reg214[(3'h7):(1'h0)]) ?
              reg209[(1'h1):(1'h0)] : wire199);
        end
      reg219 <= ({$unsigned(reg218),
          (&(~&(wire195 ? reg207 : (8'hae))))} ^~ ((|($unsigned((8'haf)) ?
              $unsigned(wire195) : wire197[(1'h0):(1'h0)])) ?
          reg208[(4'ha):(4'h9)] : wire197[(3'h7):(1'h0)]));
    end
  assign wire220 = $unsigned(reg218[(1'h1):(1'h0)]);
  assign wire221 = reg216;
  assign wire222 = $signed($unsigned(wire220));
  always
    @(posedge clk) begin
      reg223 <= reg210[(5'h11):(5'h11)];
    end
  always
    @(posedge clk) begin
      reg224 <= $signed((|(reg203[(1'h0):(1'h0)] > $unsigned({wire213,
          reg202}))));
      reg225 <= (7'h40);
    end
  assign wire226 = ($unsigned(reg210[(3'h6):(1'h1)]) - reg211[(1'h0):(1'h0)]);
  assign wire227 = (~^((-reg202[(4'hf):(4'ha)]) ?
                       ((((8'h9d) * reg205) ?
                               $signed(reg224) : (reg218 << reg209)) ?
                           reg200[(2'h2):(1'h1)] : $signed(reg218[(1'h0):(1'h0)])) : $signed(wire195[(1'h0):(1'h0)])));
  assign wire228 = reg219[(2'h2):(1'h1)];
  assign wire229 = (((~|{$signed(wire226),
                       (~&wire195)}) != reg210[(3'h6):(2'h2)]) == reg223[(4'he):(2'h2)]);
  assign wire230 = (8'ha1);
endmodule

module module154
#(parameter param190 = (^({{{(8'hab), (8'ha7)}}, (((8'ha6) <<< (8'hbd)) == ((8'hbd) ? (7'h43) : (8'hac)))} ? {({(7'h42), (8'h9d)} ? ((8'hb8) >>> (8'ha6)) : (+(8'ha9)))} : {({(8'h9c)} ? ((8'hb6) > (8'ha8)) : ((8'ha7) ? (8'ha2) : (8'hae))), (~&((8'h9e) & (8'h9d)))})))
(y, clk, wire158, wire157, wire156, wire155);
  output wire [(32'h142):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire158;
  input wire signed [(5'h12):(1'h0)] wire157;
  input wire [(3'h5):(1'h0)] wire156;
  input wire signed [(4'ha):(1'h0)] wire155;
  wire [(5'h10):(1'h0)] wire189;
  wire [(4'ha):(1'h0)] wire188;
  wire signed [(4'hc):(1'h0)] wire187;
  wire [(5'h15):(1'h0)] wire186;
  wire signed [(5'h15):(1'h0)] wire185;
  wire [(3'h4):(1'h0)] wire184;
  wire signed [(4'hd):(1'h0)] wire183;
  wire [(4'hf):(1'h0)] wire182;
  wire signed [(2'h3):(1'h0)] wire181;
  wire [(4'h8):(1'h0)] wire180;
  wire signed [(5'h13):(1'h0)] wire179;
  wire [(3'h7):(1'h0)] wire178;
  wire [(3'h4):(1'h0)] wire177;
  wire signed [(3'h5):(1'h0)] wire176;
  wire signed [(3'h5):(1'h0)] wire166;
  wire signed [(4'hb):(1'h0)] wire165;
  wire signed [(2'h2):(1'h0)] wire164;
  wire [(5'h14):(1'h0)] wire163;
  reg [(4'h8):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg174 = (1'h0);
  reg signed [(4'he):(1'h0)] reg173 = (1'h0);
  reg [(2'h3):(1'h0)] reg172 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg171 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg170 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg169 = (1'h0);
  reg [(3'h4):(1'h0)] reg168 = (1'h0);
  reg [(4'hf):(1'h0)] reg167 = (1'h0);
  reg [(3'h5):(1'h0)] reg162 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg161 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg160 = (1'h0);
  reg [(5'h15):(1'h0)] reg159 = (1'h0);
  assign y = {wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg159 <= $signed({wire157[(1'h1):(1'h0)], wire158});
      reg160 <= $signed(($signed(($signed(reg159) ?
          wire156[(2'h2):(1'h1)] : (^~wire155))) >> (wire157 >= $unsigned(wire156))));
      reg161 <= $signed(reg159);
      reg162 <= wire158[(1'h1):(1'h0)];
    end
  assign wire163 = (wire156 ? wire155[(3'h4):(3'h4)] : reg159[(3'h4):(1'h1)]);
  assign wire164 = ({(7'h41)} * (~^(~&$unsigned($unsigned(wire155)))));
  assign wire165 = (~^{(^$unsigned((reg162 < (8'hb6))))});
  assign wire166 = (((reg160[(3'h5):(3'h4)] + ($signed(wire158) ?
                           (reg161 ?
                               wire164 : (8'h9f)) : reg160[(4'h8):(2'h3)])) ?
                       $signed($signed({(8'hbd),
                           wire163})) : (8'ha3)) == (wire157[(3'h6):(1'h1)] ?
                       ((~(~|wire164)) && wire156) : (wire157 > $signed($signed(wire164)))));
  always
    @(posedge clk) begin
      reg167 <= (wire158[(3'h4):(1'h1)] ^~ ((|wire166) ?
          (reg160[(2'h2):(1'h1)] ?
              wire163 : wire155) : wire155[(3'h4):(2'h3)]));
      reg168 <= $unsigned($signed($unsigned((^~(^~(8'hb3))))));
      reg169 <= wire156[(1'h1):(1'h1)];
      if (wire163[(4'h9):(2'h3)])
        begin
          reg170 <= wire157;
        end
      else
        begin
          reg170 <= (reg159 ?
              ($signed(wire165) ?
                  ($unsigned($unsigned(wire156)) ?
                      ((wire157 ?
                          wire165 : reg160) - (^wire156)) : {wire157[(4'h9):(4'h8)],
                          reg167}) : $signed($unsigned(reg167))) : $signed((^~$signed((!wire164)))));
          if ((((wire155 <= $unsigned($signed(reg161))) != {($signed(wire166) >> wire157),
              $signed((reg170 ? reg159 : wire155))}) || wire157))
            begin
              reg171 <= $unsigned((~|(reg162[(3'h5):(2'h3)] ?
                  wire164[(1'h1):(1'h0)] : wire165)));
            end
          else
            begin
              reg171 <= $unsigned(reg162);
              reg172 <= $signed(reg170);
              reg173 <= ((~^wire157) || (wire158[(2'h2):(1'h0)] ?
                  (&reg168[(1'h1):(1'h1)]) : ((~&(~&(8'hb5))) ?
                      $unsigned((wire164 ?
                          (7'h43) : (8'hb0))) : (^~$signed(reg162)))));
              reg174 <= ($unsigned(((wire166[(3'h5):(3'h4)] >>> {wire158}) - {(&(8'ha2))})) >>> (wire166 >>> reg161[(1'h1):(1'h0)]));
            end
        end
      reg175 <= wire164[(2'h2):(1'h1)];
    end
  assign wire176 = $signed((~^(7'h44)));
  assign wire177 = reg162;
  assign wire178 = ((reg169 ^ ($signed((reg170 ?
                           wire176 : wire163)) - ($signed(reg171) <<< reg171[(3'h4):(2'h2)]))) ?
                       reg175 : reg159[(4'ha):(3'h5)]);
  assign wire179 = (~$unsigned((~^reg171[(2'h2):(1'h1)])));
  assign wire180 = $signed($unsigned($unsigned((wire166[(1'h1):(1'h0)] ~^ reg160))));
  assign wire181 = $signed((^~{wire179}));
  assign wire182 = ({(|($unsigned(wire156) ? (!wire181) : wire166)),
                       $unsigned(wire176[(2'h2):(1'h0)])} >>> (~&(~|$signed((wire165 + wire158)))));
  assign wire183 = (~$unsigned({wire165[(3'h5):(1'h0)]}));
  assign wire184 = (((!(wire164[(2'h2):(1'h1)] && (8'hbc))) ?
                           ($unsigned((reg171 ?
                               wire155 : wire177)) <= wire181) : (((reg174 & (8'ha1)) ~^ (reg160 ?
                               (7'h41) : wire157)) < (~(8'hbc)))) ?
                       (($signed((|reg161)) ?
                           wire164[(1'h0):(1'h0)] : (&(8'haf))) && (8'ha2)) : $signed(($unsigned(wire180[(1'h1):(1'h1)]) ?
                           (reg173[(3'h6):(2'h3)] & (8'ha2)) : $signed($signed((8'ha3))))));
  assign wire185 = (~(8'hb3));
  assign wire186 = (reg175 ?
                       (reg162 ?
                           (~^((~wire163) != reg168)) : (((8'ha6) && (wire176 ^~ wire155)) ?
                               $signed((~|reg170)) : $unsigned(wire177[(1'h0):(1'h0)]))) : ({wire165[(2'h3):(2'h3)]} ?
                           $signed($unsigned((reg171 ?
                               wire185 : reg167))) : wire180));
  assign wire187 = $signed($unsigned(wire177[(1'h1):(1'h1)]));
  assign wire188 = reg172[(2'h2):(1'h0)];
  assign wire189 = reg175;
endmodule
