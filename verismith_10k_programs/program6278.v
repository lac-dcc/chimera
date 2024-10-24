module top
#(parameter param314 = (((~&(((7'h44) ? (8'ha0) : (8'hbe)) ? ((8'hbd) ? (8'ha9) : (8'hab)) : (~^(8'hb0)))) >> {{(!(8'ha8))}, (((8'hb4) ? (8'hbb) : (8'ha6)) * (&(8'hbd)))}) ? (~&((^~((8'hbf) + (7'h43))) >>> ({(8'ha2), (8'hbd)} ? ((7'h41) ? (8'hb8) : (8'haa)) : (|(8'ha7))))) : {((((7'h43) ? (8'ha6) : (8'h9f)) & ((8'hb4) | (7'h42))) | ((8'hb4) < ((8'ha0) ^~ (8'h9c))))}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h143):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire0;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  wire signed [(3'h6):(1'h0)] wire293;
  wire signed [(4'hc):(1'h0)] wire86;
  wire [(5'h13):(1'h0)] wire85;
  wire [(4'h8):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire83;
  wire signed [(4'h8):(1'h0)] wire295;
  wire [(2'h3):(1'h0)] wire302;
  wire signed [(4'hc):(1'h0)] wire303;
  wire signed [(2'h2):(1'h0)] wire304;
  wire signed [(4'h9):(1'h0)] wire312;
  reg [(5'h12):(1'h0)] reg296 = (1'h0);
  reg [(4'h8):(1'h0)] reg297 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg298 = (1'h0);
  reg [(4'hc):(1'h0)] reg299 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg300 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg301 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg305 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg306 = (1'h0);
  reg [(4'he):(1'h0)] reg307 = (1'h0);
  reg [(2'h3):(1'h0)] reg308 = (1'h0);
  reg [(4'hd):(1'h0)] reg309 = (1'h0);
  reg [(3'h6):(1'h0)] reg310 = (1'h0);
  reg [(2'h2):(1'h0)] reg311 = (1'h0);
  assign y = {wire293,
                 wire86,
                 wire85,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire83,
                 wire295,
                 wire302,
                 wire303,
                 wire304,
                 wire312,
                 reg296,
                 reg297,
                 reg298,
                 reg299,
                 reg300,
                 reg301,
                 reg305,
                 reg306,
                 reg307,
                 reg308,
                 reg309,
                 reg310,
                 reg311,
                 (1'h0)};
  assign wire4 = ($unsigned($signed((^(7'h41)))) ?
                     ({$unsigned((~^wire1)),
                         {$signed(wire3)}} || wire1) : (-wire2));
  assign wire5 = (wire4[(3'h4):(2'h2)] ?
                     $signed($signed((~&wire3[(1'h0):(1'h0)]))) : wire2);
  assign wire6 = wire4[(3'h5):(3'h5)];
  assign wire7 = (~|wire6);
  assign wire8 = ((($signed((wire3 ? wire2 : wire5)) ?
                         {$unsigned((8'hbb))} : wire2[(3'h6):(1'h1)]) >>> (wire0[(1'h0):(1'h0)] ?
                         wire6[(4'hb):(3'h7)] : $unsigned((&(8'ha0))))) ?
                     ((~wire0[(4'h9):(3'h7)]) < wire5) : wire2[(1'h1):(1'h1)]);
  assign wire9 = (^~{(($signed((8'ha4)) ?
                         $signed(wire1) : $unsigned((8'hb0))) <= wire2[(3'h5):(1'h0)]),
                     (!{((8'h9e) ? wire7 : (8'h9c))})});
  assign wire10 = (($signed(($unsigned(wire7) <<< $unsigned(wire8))) | wire8) ^ (~&((|wire6[(3'h5):(1'h0)]) ?
                      $unsigned(wire9[(4'ha):(4'ha)]) : ($unsigned(wire6) ?
                          wire8[(1'h0):(1'h0)] : (wire5 ? wire4 : wire5)))));
  module11 #() modinst84 (wire83, clk, wire3, wire5, wire8, wire10, wire2);
  assign wire85 = wire5;
  assign wire86 = ((!(wire2 != wire8)) & {$unsigned({wire5, (^(8'ha3))})});
  module87 #() modinst294 (.clk(clk), .wire91(wire85), .wire88(wire10), .wire92(wire3), .wire89(wire0), .y(wire293), .wire90(wire83));
  assign wire295 = (wire5[(3'h5):(3'h4)] > $signed((&$signed($signed(wire8)))));
  always
    @(posedge clk) begin
      reg296 <= $signed((wire83[(3'h4):(2'h3)] + $signed(({wire10} ?
          (wire293 ? wire4 : wire7) : $unsigned(wire10)))));
      reg297 <= $unsigned(wire5);
      if (((&(wire85 >> $unsigned($signed(wire85)))) ?
          ((~|{(wire9 >> reg297),
              $signed(wire4)}) < $signed((wire2[(5'h10):(3'h4)] < wire7))) : $unsigned($unsigned(wire9[(4'ha):(3'h6)]))))
        begin
          if ((($unsigned(wire86) ?
              {(8'hb6), (!$unsigned(wire85))} : $signed((-{wire295,
                  wire8}))) << wire1))
            begin
              reg298 <= (~wire6[(3'h7):(1'h1)]);
              reg299 <= ($signed((wire7 ?
                      ((wire7 <= wire83) ?
                          ((8'h9c) >> wire8) : (wire86 | reg297)) : (!(wire4 + wire7)))) ?
                  (reg296[(4'h8):(3'h5)] ?
                      reg298[(2'h3):(1'h1)] : wire6[(4'h9):(3'h7)]) : (wire1[(3'h7):(3'h6)] ?
                      (wire0[(4'h8):(3'h6)] != ({wire83} > reg297[(1'h0):(1'h0)])) : wire0));
              reg300 <= (&(8'hb7));
              reg301 <= (-$unsigned($unsigned($unsigned($unsigned(wire295)))));
            end
          else
            begin
              reg298 <= reg297[(1'h0):(1'h0)];
              reg299 <= $signed(reg296);
            end
        end
      else
        begin
          reg298 <= (^~(8'haf));
          reg299 <= $signed($unsigned((|(&(wire2 || reg296)))));
          reg300 <= $signed((((^~$unsigned(reg299)) & wire6) < $unsigned((8'h9c))));
        end
    end
  assign wire302 = wire9;
  assign wire303 = $unsigned(wire5[(2'h3):(1'h0)]);
  assign wire304 = (({reg297} ?
                           ((^(reg301 ?
                               reg298 : wire83)) <<< (reg300[(3'h7):(3'h4)] ?
                               ((7'h43) ?
                                   wire0 : wire302) : ((8'hae) << reg301))) : $signed(wire7[(3'h6):(1'h0)])) ?
                       wire302[(2'h3):(2'h2)] : reg297);
  always
    @(posedge clk) begin
      reg305 <= (wire85[(5'h11):(1'h1)] - reg298[(3'h7):(1'h0)]);
      reg306 <= (reg300[(5'h11):(4'ha)] & (~wire3[(4'hd):(4'ha)]));
      if (wire7)
        begin
          reg307 <= wire302[(2'h2):(1'h1)];
          if ((^$signed($signed(($signed(reg299) >>> (wire4 & wire302))))))
            begin
              reg308 <= $signed(wire6);
              reg309 <= $unsigned(wire304);
            end
          else
            begin
              reg308 <= (^(-(wire4 ?
                  ($signed(wire3) ?
                      (wire4 && reg297) : ((8'ha4) || wire302)) : $signed((reg301 ?
                      reg305 : wire10)))));
            end
        end
      else
        begin
          reg307 <= (wire293 ?
              ($unsigned(wire7[(3'h6):(1'h1)]) ?
                  $unsigned(reg300) : $signed($unsigned(reg296))) : wire0[(4'hb):(2'h2)]);
          reg308 <= $unsigned($unsigned(((~|{wire7}) ^ (~|$unsigned(reg300)))));
        end
      reg310 <= (~^{reg307[(2'h2):(2'h2)], (&$unsigned($signed(reg296)))});
      reg311 <= ({(reg309[(1'h1):(1'h0)] ? (-wire0) : (-$signed(reg307)))} ?
          $unsigned((((~|reg305) - (wire10 || wire2)) ?
              ((wire8 * reg305) + (!(8'hb0))) : ((reg306 ~^ wire10) > $signed((8'haf))))) : $signed($signed((wire1 | {wire9}))));
    end
  module32 #() modinst313 (.wire36(reg305), .wire34(reg306), .wire35(wire2), .y(wire312), .clk(clk), .wire33(reg307));
endmodule

module module87
#(parameter param291 = (~{((((8'hb2) << (8'ha3)) ? (~&(8'hbb)) : (-(8'ha5))) ? {(+(8'hae)), ((8'hb9) <<< (8'ha8))} : (~(^(8'ha1))))}), 
parameter param292 = param291)
(y, clk, wire92, wire91, wire90, wire89, wire88);
  output wire [(32'h3a4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire92;
  input wire signed [(5'h13):(1'h0)] wire91;
  input wire signed [(4'hc):(1'h0)] wire90;
  input wire signed [(4'hb):(1'h0)] wire89;
  input wire signed [(5'h13):(1'h0)] wire88;
  wire [(3'h6):(1'h0)] wire283;
  wire signed [(4'ha):(1'h0)] wire282;
  wire signed [(3'h4):(1'h0)] wire281;
  wire [(3'h4):(1'h0)] wire280;
  wire [(4'hc):(1'h0)] wire258;
  wire [(4'hc):(1'h0)] wire241;
  wire [(3'h5):(1'h0)] wire132;
  wire signed [(3'h7):(1'h0)] wire112;
  wire [(5'h11):(1'h0)] wire111;
  wire [(5'h14):(1'h0)] wire94;
  wire [(3'h6):(1'h0)] wire93;
  wire signed [(5'h10):(1'h0)] wire189;
  reg [(5'h10):(1'h0)] reg290 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg289 = (1'h0);
  reg [(5'h12):(1'h0)] reg288 = (1'h0);
  reg [(2'h2):(1'h0)] reg287 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg286 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg285 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg284 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg279 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg278 = (1'h0);
  reg [(5'h10):(1'h0)] reg277 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg276 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg275 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg274 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg273 = (1'h0);
  reg [(4'he):(1'h0)] reg272 = (1'h0);
  reg signed [(4'he):(1'h0)] reg271 = (1'h0);
  reg [(4'hf):(1'h0)] reg270 = (1'h0);
  reg [(5'h12):(1'h0)] reg269 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg268 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg267 = (1'h0);
  reg [(4'hf):(1'h0)] reg266 = (1'h0);
  reg [(4'he):(1'h0)] reg265 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg264 = (1'h0);
  reg [(4'hd):(1'h0)] reg263 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg262 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg261 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg260 = (1'h0);
  reg [(2'h2):(1'h0)] reg259 = (1'h0);
  reg [(4'he):(1'h0)] reg257 = (1'h0);
  reg [(4'ha):(1'h0)] reg256 = (1'h0);
  reg [(3'h4):(1'h0)] reg255 = (1'h0);
  reg [(2'h3):(1'h0)] reg254 = (1'h0);
  reg [(5'h15):(1'h0)] reg253 = (1'h0);
  reg [(5'h14):(1'h0)] reg252 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg251 = (1'h0);
  reg [(4'hd):(1'h0)] reg250 = (1'h0);
  reg signed [(4'he):(1'h0)] reg249 = (1'h0);
  reg [(5'h13):(1'h0)] reg248 = (1'h0);
  reg [(5'h10):(1'h0)] reg247 = (1'h0);
  reg [(3'h7):(1'h0)] reg246 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg245 = (1'h0);
  reg [(4'he):(1'h0)] reg244 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg243 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg109 = (1'h0);
  reg [(5'h11):(1'h0)] reg108 = (1'h0);
  reg [(4'ha):(1'h0)] reg107 = (1'h0);
  reg [(5'h14):(1'h0)] reg106 = (1'h0);
  reg [(5'h10):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg103 = (1'h0);
  reg [(3'h4):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg100 = (1'h0);
  reg [(5'h14):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg98 = (1'h0);
  reg [(4'hb):(1'h0)] reg97 = (1'h0);
  reg [(4'hd):(1'h0)] reg96 = (1'h0);
  reg [(3'h4):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg135 = (1'h0);
  reg [(4'ha):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg138 = (1'h0);
  reg [(4'hc):(1'h0)] reg139 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg141 = (1'h0);
  reg [(4'hd):(1'h0)] reg142 = (1'h0);
  reg [(3'h6):(1'h0)] reg143 = (1'h0);
  assign y = {wire283,
                 wire282,
                 wire281,
                 wire280,
                 wire258,
                 wire241,
                 wire132,
                 wire112,
                 wire111,
                 wire94,
                 wire93,
                 wire189,
                 reg290,
                 reg289,
                 reg288,
                 reg287,
                 reg286,
                 reg285,
                 reg284,
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
                 reg265,
                 reg264,
                 reg263,
                 reg262,
                 reg261,
                 reg260,
                 reg259,
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
                 reg134,
                 reg135,
                 reg136,
                 reg137,
                 reg138,
                 reg139,
                 reg140,
                 reg141,
                 reg142,
                 reg143,
                 (1'h0)};
  assign wire93 = $unsigned((+$unsigned((8'ha9))));
  assign wire94 = (&({$signed($unsigned((8'h9f))),
                      $unsigned(wire88[(3'h6):(3'h6)])} >= (((wire91 <= wire91) ^~ {(8'hbe),
                          wire92}) ?
                      (8'h9f) : {(^~wire89), (wire89 <<< wire91)})));
  always
    @(posedge clk) begin
      if ((($unsigned((-(wire91 >>> wire93))) ?
          $signed($unsigned(wire92)) : {wire93[(3'h6):(2'h2)]}) | wire92[(2'h3):(1'h0)]))
        begin
          reg95 <= ((wire92[(2'h2):(2'h2)] ?
                  wire92[(2'h2):(1'h1)] : ($unsigned(wire92) ?
                      $unsigned(((8'hac) ~^ wire90)) : wire94[(3'h5):(3'h5)])) ?
              wire92[(1'h1):(1'h0)] : ({$unsigned(wire94[(1'h0):(1'h0)]),
                      ($signed(wire93) >>> (wire93 + wire88))} ?
                  {((^wire93) ~^ (wire94 ? wire90 : wire88)),
                      $unsigned($unsigned(wire89))} : {({wire91} ?
                          (8'h9d) : $unsigned(wire90))}));
          reg96 <= $signed(wire91);
          reg97 <= reg95[(2'h2):(2'h2)];
        end
      else
        begin
          reg95 <= wire91;
          reg96 <= (((((reg97 ?
                  (8'hb8) : wire91) && $unsigned(wire88)) || (^~(^wire93))) ?
              ((+$unsigned(reg95)) ?
                  ((8'hb9) ? {reg95} : {(8'ha6)}) : (((8'hb2) <= (8'hb1)) ?
                      wire94 : wire90)) : $signed($unsigned((~wire94)))) <<< ((8'haa) ?
              wire92 : $signed($signed(((7'h42) ? wire93 : wire93)))));
          reg97 <= $unsigned((^~(wire89[(3'h5):(1'h0)] && $unsigned($signed(wire90)))));
          reg98 <= (^~$signed(((-(8'hbd)) >= ((^~(8'h9e)) <= (8'hb3)))));
        end
      reg99 <= reg95[(1'h0):(1'h0)];
      if (({$unsigned((8'h9d)),
          $signed(((^~reg95) ?
              (~&wire89) : $signed(wire91)))} && $signed(((!(wire88 > wire93)) ?
          (^~$signed(wire90)) : $unsigned((wire90 >>> reg99))))))
        begin
          reg100 <= ($unsigned(($unsigned((reg96 + reg99)) ?
                  (wire91 ?
                      (wire92 ?
                          (8'ha9) : (8'hbf)) : (reg95 | wire88)) : $unsigned((wire89 ?
                      wire92 : reg96)))) ?
              reg96 : $unsigned(($unsigned($unsigned((8'ha3))) < reg95[(3'h4):(2'h2)])));
        end
      else
        begin
          reg100 <= (^~wire91);
          if ((^~({$signed(reg99[(2'h2):(2'h2)])} || reg97[(3'h4):(2'h3)])))
            begin
              reg101 <= {$unsigned((&$signed($unsigned(reg100))))};
              reg102 <= (8'hbf);
              reg103 <= reg102;
              reg104 <= $unsigned($signed($unsigned($unsigned($signed(reg101)))));
              reg105 <= $unsigned(wire88);
            end
          else
            begin
              reg101 <= (($signed($signed($unsigned(wire88))) && ($unsigned(((8'haa) & wire89)) ?
                  reg105[(4'h9):(2'h2)] : $signed({reg99}))) == ((~$unsigned(wire91[(4'hc):(4'ha)])) > (+(reg104 >>> (reg104 ~^ (8'ha9))))));
            end
          reg106 <= $unsigned(reg102[(2'h3):(1'h0)]);
          if ($signed($unsigned(({$unsigned(reg95)} ~^ wire94[(4'hd):(4'hd)]))))
            begin
              reg107 <= reg96;
              reg108 <= (~$unsigned({($signed(wire93) >= $unsigned(reg95)),
                  ($unsigned(wire94) == wire92[(2'h3):(1'h1)])}));
            end
          else
            begin
              reg107 <= reg107;
              reg108 <= $unsigned(reg102[(1'h1):(1'h0)]);
              reg109 <= (((($unsigned(wire92) ?
                          $signed(wire92) : (~|reg106)) - reg106[(4'h8):(3'h6)]) ?
                      (wire94 || (+{(8'hb9),
                          reg102})) : $signed(($unsigned(reg95) ?
                          ((8'hac) ?
                              wire89 : reg98) : reg104[(1'h0):(1'h0)]))) ?
                  $signed(reg99) : (((8'hbd) ?
                      ((reg103 ?
                          reg107 : reg101) | $signed(reg106)) : (~&(reg97 || reg101))) ^~ ($signed($unsigned(reg100)) ?
                      $unsigned({reg100}) : $unsigned(wire94))));
              reg110 <= (8'hb6);
            end
        end
    end
  assign wire111 = wire94[(4'hf):(4'hd)];
  assign wire112 = (8'h9d);
  module113 #() modinst133 (.wire116(reg101), .wire115(wire112), .wire117(wire91), .y(wire132), .wire114(wire94), .clk(clk));
  always
    @(posedge clk) begin
      reg134 <= reg110[(1'h1):(1'h1)];
      reg135 <= ((8'hb8) > reg102[(1'h0):(1'h0)]);
      reg136 <= $signed((wire94[(4'ha):(4'ha)] + wire111[(2'h3):(2'h2)]));
    end
  always
    @(posedge clk) begin
      reg137 <= wire88;
      reg138 <= wire132[(1'h0):(1'h0)];
      reg139 <= $signed($signed($signed((~|(~|reg135)))));
      if (wire94)
        begin
          reg140 <= {reg137[(4'he):(3'h5)]};
        end
      else
        begin
          reg140 <= reg106[(1'h0):(1'h0)];
          reg141 <= {($signed($signed((wire91 ? wire88 : reg109))) ?
                  (((^~reg98) * reg107) <= $signed({reg137})) : reg138[(2'h2):(1'h0)])};
          reg142 <= (~|(wire91 && reg99));
          reg143 <= $signed(reg135[(2'h3):(2'h3)]);
        end
    end
  module144 #() modinst190 (wire189, clk, reg138, reg135, reg105, wire111, reg106);
  module191 #() modinst242 (wire241, clk, reg106, reg108, reg103, reg104, reg134);
  always
    @(posedge clk) begin
      reg243 <= $unsigned((($unsigned($signed(reg96)) > reg106[(4'h9):(4'h8)]) << (|$signed($unsigned(wire111)))));
      reg244 <= (((((reg101 ? wire91 : wire88) ? (^reg135) : reg141) ?
                  (+reg96) : reg102) ?
              ((~|reg106[(4'hd):(3'h4)]) ?
                  $unsigned($signed(reg138)) : reg141) : reg140) ?
          (($unsigned((!reg110)) & (reg143[(3'h4):(1'h0)] >= {reg110,
              (8'haa)})) >>> reg96) : reg140);
      reg245 <= (reg105[(4'hd):(3'h7)] ?
          (^~($unsigned({reg95, reg97}) >>> (8'hac))) : wire90);
      reg246 <= $unsigned((|$signed($unsigned(reg135))));
    end
  always
    @(posedge clk) begin
      reg247 <= $signed(wire89[(4'hb):(4'hb)]);
      if (((($unsigned(reg96[(4'ha):(3'h5)]) ?
              reg135[(2'h2):(1'h0)] : (reg134[(2'h2):(2'h2)] >>> $unsigned(wire91))) == {$signed(wire94[(4'he):(4'hd)]),
              ((wire112 >> reg109) > {wire111})}) ?
          ($unsigned(reg243) && ((8'hb0) ?
              (8'hb4) : $signed((!reg134)))) : (~&reg110[(1'h1):(1'h1)])))
        begin
          reg248 <= {{$signed($unsigned($unsigned(reg142))),
                  $signed(((reg137 ? reg106 : reg105) ^ (reg243 ?
                      reg97 : wire241)))},
              $signed(reg143[(1'h1):(1'h1)])};
          reg249 <= reg102;
          if ((8'hac))
            begin
              reg250 <= {reg248,
                  (($unsigned((~reg134)) >>> reg104) ?
                      (($signed(reg140) ?
                          $signed(reg99) : $unsigned(reg95)) < reg139[(1'h0):(1'h0)]) : wire93[(1'h0):(1'h0)])};
              reg251 <= reg110[(2'h3):(1'h1)];
              reg252 <= {reg139[(3'h6):(3'h4)]};
              reg253 <= {{reg137[(3'h7):(3'h7)],
                      ((-(~&wire92)) || (reg247 ?
                          $signed(reg142) : (reg108 ? (8'h9e) : reg108)))}};
              reg254 <= {reg248};
            end
          else
            begin
              reg250 <= $unsigned($signed($unsigned({(7'h44),
                  $unsigned((8'ha0))})));
              reg251 <= (reg251 - ({(!reg104), $unsigned($unsigned((8'hb0)))} ?
                  wire90 : $signed(($unsigned(wire112) << reg243))));
              reg252 <= ($unsigned(wire189) ? $signed((^~(|(7'h42)))) : wire90);
            end
          if (((~&reg253) ?
              $signed($unsigned(wire93[(2'h3):(2'h3)])) : $unsigned(((((7'h42) ?
                          reg104 : wire92) ?
                      (~&reg97) : reg109) ?
                  $signed($signed(reg106)) : $unsigned((reg143 < reg95))))))
            begin
              reg255 <= {{(~^reg101[(4'hd):(3'h7)]),
                      (((wire189 ? reg250 : reg100) ?
                          $signed(wire132) : reg139) ^ (8'hae))},
                  $signed((reg249 ?
                      wire88[(3'h5):(1'h0)] : reg136[(2'h3):(2'h2)]))};
              reg256 <= $signed((reg254[(1'h1):(1'h0)] ?
                  reg136[(2'h3):(2'h3)] : ((+wire241[(4'h9):(2'h2)]) ?
                      $unsigned($signed(reg139)) : reg251)));
              reg257 <= $signed($signed($signed(wire88)));
            end
          else
            begin
              reg255 <= $unsigned(reg140[(2'h2):(2'h2)]);
              reg256 <= wire92;
            end
        end
      else
        begin
          reg248 <= (~|($unsigned($signed(reg141[(2'h3):(1'h0)])) < reg141[(4'h8):(3'h7)]));
          reg249 <= reg98;
          reg250 <= (|(~^{(((8'hae) ~^ reg253) ?
                  $unsigned(reg104) : (~^reg110))}));
          reg251 <= reg137[(3'h4):(2'h3)];
        end
    end
  assign wire258 = $signed($unsigned(wire241));
  always
    @(posedge clk) begin
      reg259 <= $signed((({{reg142, (8'hb4)}, (reg140 > reg245)} ?
          ($unsigned(reg102) || ((8'ha7) ?
              reg256 : wire189)) : $unsigned({reg104})) ~^ reg243[(1'h1):(1'h1)]));
      if ((reg101 & wire93[(3'h4):(1'h1)]))
        begin
          if ({({{(7'h40), $signed(wire92)}} <<< ({reg102[(2'h2):(1'h1)]} ?
                  (!(reg109 ^~ reg96)) : $unsigned(reg140[(2'h2):(2'h2)])))})
            begin
              reg260 <= (reg106[(1'h1):(1'h1)] ?
                  (~^($signed((wire90 >= reg107)) ?
                      $signed(wire241[(4'ha):(4'h8)]) : wire92[(2'h2):(2'h2)])) : {(reg109 > $signed((-reg105)))});
              reg261 <= (reg255 >>> reg257);
              reg262 <= $signed($signed($signed((wire93 * {reg142}))));
            end
          else
            begin
              reg260 <= (~&reg95);
              reg261 <= {(reg138[(4'ha):(3'h5)] ?
                      reg246 : $unsigned($unsigned((7'h40))))};
              reg262 <= ((~&(($unsigned(wire132) & $unsigned(reg110)) >> {(reg246 ?
                      reg139 : (8'ha6))})) >> $unsigned($signed(reg107[(1'h0):(1'h0)])));
              reg263 <= $unsigned($signed((reg259 ?
                  ((!reg260) < (reg96 && reg105)) : $unsigned(wire92))));
            end
          reg264 <= $signed({(~^({wire89, reg250} ?
                  (reg103 ? reg245 : wire112) : ((8'hb5) ? wire90 : wire92)))});
        end
      else
        begin
          if ($signed(reg255))
            begin
              reg260 <= ($unsigned(reg104) ?
                  reg103 : $signed((~|{$signed(reg244)})));
            end
          else
            begin
              reg260 <= ($signed($unsigned(reg105)) < $signed($unsigned($signed(reg256))));
              reg261 <= reg108;
              reg262 <= $unsigned(($signed((wire89[(1'h1):(1'h1)] <= (reg252 != reg96))) ?
                  ((~(+wire111)) >= (&(reg259 < wire89))) : (wire88 < reg104[(3'h6):(3'h6)])));
            end
          reg263 <= {reg138[(1'h1):(1'h0)]};
          if (reg250[(3'h5):(2'h3)])
            begin
              reg264 <= $signed((wire132[(1'h1):(1'h1)] << $signed((+{reg140}))));
              reg265 <= (reg109[(1'h0):(1'h0)] ~^ (wire94 <= $unsigned(reg140)));
            end
          else
            begin
              reg264 <= (!((-(8'hbe)) ?
                  wire90[(3'h7):(2'h3)] : reg110[(3'h4):(3'h4)]));
            end
          if ((reg108 ?
              ($unsigned((+(wire92 < reg256))) << (($signed(reg249) + (reg245 ?
                      (8'ha7) : reg249)) ?
                  (~|$signed(wire91)) : $signed($unsigned((8'hb8))))) : $unsigned($signed(wire89))))
            begin
              reg266 <= $signed(($unsigned({{(8'hb0)},
                  (reg139 ? wire132 : wire258)}) || (({reg103,
                      reg106} + (reg139 ? wire88 : (8'hb2))) ?
                  $signed((reg254 ^~ reg244)) : $unsigned(wire258[(4'h8):(4'h8)]))));
              reg267 <= (!reg245[(3'h4):(1'h1)]);
              reg268 <= (^~{reg138});
            end
          else
            begin
              reg266 <= {$unsigned(($unsigned($signed(reg101)) ?
                      $unsigned(reg95[(2'h2):(1'h0)]) : $signed((&reg137)))),
                  $signed(reg106)};
              reg267 <= (~$signed($signed(wire92)));
              reg268 <= (^~(~$unsigned($unsigned($signed(wire93)))));
            end
        end
      if (((^(($signed(reg99) == $unsigned((8'had))) ? reg255 : reg103)) ?
          $unsigned($unsigned((reg139[(1'h1):(1'h0)] ?
              (&reg107) : $signed(wire189)))) : (~&(reg109[(4'h9):(1'h1)] >= (^(reg142 & reg247))))))
        begin
          reg269 <= $unsigned((reg104 ?
              (wire91[(2'h3):(1'h0)] && $unsigned($unsigned(reg141))) : (-$unsigned((reg244 ?
                  reg255 : reg134)))));
          if ((wire89 ?
              ($signed($unsigned(reg245)) << {{{reg244}},
                  {(reg141 ^ reg100)}}) : ($signed((&$unsigned(reg245))) ^~ wire88)))
            begin
              reg270 <= reg103;
              reg271 <= {reg253[(4'he):(1'h1)], wire132[(2'h2):(1'h0)]};
              reg272 <= $unsigned((^~{{(wire132 < reg100), reg105}}));
            end
          else
            begin
              reg270 <= reg104;
              reg271 <= (8'ha5);
              reg272 <= ({($signed((wire91 >> reg101)) + {reg103[(2'h2):(2'h2)]})} || (~($unsigned((reg244 ?
                  reg267 : (8'h9f))) | wire132[(3'h4):(3'h4)])));
              reg273 <= $unsigned(wire90);
            end
        end
      else
        begin
          if ({(-reg107[(4'h9):(4'h9)]), wire89})
            begin
              reg269 <= (~reg268[(3'h4):(1'h0)]);
              reg270 <= reg108[(4'hc):(3'h7)];
            end
          else
            begin
              reg269 <= reg262;
              reg270 <= $signed(($unsigned($unsigned((reg136 <<< wire90))) ?
                  reg254[(2'h2):(2'h2)] : (($signed(reg271) ?
                          (reg134 ? wire189 : reg250) : reg272) ?
                      reg135 : {(reg143 ? reg261 : reg257)})));
              reg271 <= (($unsigned((+(reg255 <= (8'hb0)))) ?
                  (7'h42) : wire91) ^~ (({$unsigned(reg248)} ?
                  (wire89[(1'h0):(1'h0)] ?
                      {wire92} : wire90[(2'h2):(1'h1)]) : (~^(wire258 ?
                      reg245 : reg272))) * $signed((8'h9f))));
              reg272 <= reg249;
              reg273 <= $unsigned({$signed(({reg249, reg139} ?
                      reg139 : $signed(reg249))),
                  reg108[(3'h5):(1'h1)]});
            end
          reg274 <= (+reg271[(4'he):(1'h0)]);
          reg275 <= $signed((((|$signed(reg103)) ?
                  reg266[(4'hc):(2'h2)] : $signed(wire258[(1'h1):(1'h0)])) ?
              reg134 : (~&(!(^(8'h9d))))));
        end
      if (reg268)
        begin
          reg276 <= ($signed(reg272[(4'he):(2'h3)]) - (!reg249[(1'h0):(1'h0)]));
        end
      else
        begin
          reg276 <= {reg261, reg273[(4'hb):(2'h2)]};
        end
    end
  always
    @(posedge clk) begin
      reg277 <= (((wire91 >> (~|$unsigned(reg250))) ?
          ($unsigned(reg246) || (!((7'h41) ?
              (8'hbe) : (7'h44)))) : ($unsigned((reg134 ?
              reg135 : (8'hb6))) < (~&(wire93 ? reg99 : (7'h41))))) < (8'haf));
    end
  always
    @(posedge clk) begin
      reg278 <= ($unsigned(($signed((reg273 ? reg266 : reg248)) ?
          {wire94[(5'h14):(5'h14)]} : ($unsigned((8'hbd)) <= {reg277}))) + {(reg249 != ({(8'hb6),
              reg256} ^ $unsigned((8'ha6))))});
      reg279 <= ((~$unsigned($unsigned({reg265,
          wire94}))) || ((8'h9c) >>> ($signed(reg96[(2'h2):(2'h2)]) || ($signed((8'haf)) ?
          reg140[(1'h1):(1'h1)] : (~&reg269)))));
    end
  assign wire280 = $unsigned($unsigned((reg274 == reg270)));
  assign wire281 = $signed((+({((8'ha1) & reg278)} ? wire132 : wire92)));
  assign wire282 = reg267[(5'h10):(4'hd)];
  assign wire283 = $signed(reg262[(3'h6):(1'h0)]);
  always
    @(posedge clk) begin
      if (((~|{{reg143, $unsigned(reg142)},
          ((reg259 ? reg95 : wire91) ?
              (wire189 || reg250) : $signed(reg279))}) + (wire282[(1'h1):(1'h0)] || reg278)))
        begin
          reg284 <= (((+($signed(reg103) ?
              (8'ha6) : ((8'hb2) ?
                  reg278 : wire88))) < (reg138[(5'h12):(4'hc)] > $signed({reg105}))) ^~ reg142);
        end
      else
        begin
          reg284 <= (+wire111);
          reg285 <= (8'haf);
          if ((+(8'had)))
            begin
              reg286 <= (((~^$signed($unsigned(reg139))) ?
                      reg245[(2'h2):(1'h1)] : $unsigned((reg100 ?
                          (reg279 ? (8'hb8) : reg99) : reg254))) ?
                  reg139 : $signed(($unsigned((!(8'h9c))) ?
                      $unsigned(reg107[(2'h2):(1'h0)]) : $unsigned($signed(wire88)))));
              reg287 <= $signed(({{wire93[(1'h1):(1'h0)]}} >> (~&(reg140[(1'h0):(1'h0)] > reg276))));
              reg288 <= ($unsigned(reg253) >>> (($unsigned((-reg286)) ?
                  (^reg97[(2'h3):(2'h3)]) : {reg284[(3'h5):(1'h1)],
                      (reg110 | (8'had))}) ^ {{wire88, reg285},
                  ((wire88 ~^ reg268) ? reg253 : $unsigned((8'hbc)))}));
            end
          else
            begin
              reg286 <= ({(reg108 > (reg274[(1'h1):(1'h1)] * {wire111})),
                  ({reg257,
                      $signed(reg246)} >= $unsigned(wire90[(4'hc):(4'h8)]))} == ($signed((reg271 ?
                      {reg277, wire91} : $unsigned(wire189))) ?
                  reg262[(4'he):(2'h2)] : {reg271}));
              reg287 <= reg107;
              reg288 <= (7'h44);
              reg289 <= reg288;
              reg290 <= (($signed((~&$unsigned(reg273))) - (wire112 ?
                      (|(+reg105)) : wire280)) ?
                  $signed(((wire241 ? (~(8'hac)) : ((7'h42) >>> wire283)) ?
                      $signed(wire92[(2'h2):(2'h2)]) : ((~^reg267) >>> reg99[(4'hb):(4'h8)]))) : ($signed({(~&reg139)}) ?
                      reg106 : $unsigned(reg260[(3'h7):(3'h5)])));
            end
        end
    end
endmodule

module module11  (y, clk, wire12, wire13, wire14, wire15, wire16);
  output wire [(32'h146):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire12;
  input wire signed [(3'h5):(1'h0)] wire13;
  input wire signed [(5'h14):(1'h0)] wire14;
  input wire signed [(2'h3):(1'h0)] wire15;
  input wire [(5'h11):(1'h0)] wire16;
  wire signed [(5'h11):(1'h0)] wire73;
  wire signed [(5'h10):(1'h0)] wire72;
  wire [(5'h12):(1'h0)] wire17;
  wire [(4'hd):(1'h0)] wire18;
  wire signed [(5'h11):(1'h0)] wire20;
  wire [(5'h15):(1'h0)] wire21;
  wire signed [(2'h2):(1'h0)] wire26;
  wire [(5'h11):(1'h0)] wire27;
  wire [(4'hc):(1'h0)] wire30;
  wire [(5'h11):(1'h0)] wire31;
  wire [(4'hf):(1'h0)] wire70;
  reg signed [(4'hf):(1'h0)] reg82 = (1'h0);
  reg [(2'h2):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg80 = (1'h0);
  reg [(5'h10):(1'h0)] reg79 = (1'h0);
  reg [(5'h10):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg77 = (1'h0);
  reg [(4'h8):(1'h0)] reg76 = (1'h0);
  reg [(4'hf):(1'h0)] reg75 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg74 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire17,
                 wire18,
                 wire20,
                 wire21,
                 wire26,
                 wire27,
                 wire30,
                 wire31,
                 wire70,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg19,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg28,
                 reg29,
                 (1'h0)};
  assign wire17 = ($unsigned((~$unsigned((&wire16)))) | $unsigned((((+wire13) ?
                      (wire12 ?
                          wire16 : (8'hb3)) : wire12[(5'h13):(4'h9)]) == (-$unsigned(wire12)))));
  assign wire18 = ((~&wire15) ?
                      (wire15[(2'h2):(1'h0)] ?
                          wire17 : wire16) : (&(~^wire17)));
  always
    @(posedge clk) begin
      reg19 <= $unsigned($signed((wire14 <<< (wire18[(4'h8):(3'h7)] ?
          $unsigned(wire17) : ((8'ha1) ? (8'hab) : wire15)))));
    end
  assign wire20 = (-$signed(((8'hb3) ?
                      ((wire16 ? (8'ha7) : wire17) < (-wire18)) : ({wire15,
                          reg19} && (wire15 | wire14)))));
  assign wire21 = wire13;
  always
    @(posedge clk) begin
      reg22 <= ($signed($signed($signed({wire13, (8'hb8)}))) ^~ wire15);
      reg23 <= (^wire12);
      reg24 <= {(-(^$unsigned((8'hbc))))};
      reg25 <= (^$signed(((|wire20[(1'h1):(1'h1)]) ?
          wire20[(4'h8):(3'h5)] : wire14)));
    end
  assign wire26 = (^~{((~&$signed(wire13)) ?
                          ((~|wire17) - (reg19 ?
                              wire17 : wire14)) : wire21[(1'h1):(1'h1)]),
                      reg19[(1'h1):(1'h0)]});
  assign wire27 = (^~(wire17 <= ((^(wire17 != wire26)) ?
                      $unsigned($signed(wire21)) : wire21)));
  always
    @(posedge clk) begin
      reg28 <= (8'ha3);
      reg29 <= reg25;
    end
  assign wire30 = (8'ha2);
  assign wire31 = wire17;
  module32 #() modinst71 (wire70, clk, wire30, wire27, wire31, reg28);
  assign wire72 = $signed($signed(({(wire12 ? (8'hbc) : wire14)} ?
                      wire31 : wire12[(2'h3):(1'h1)])));
  assign wire73 = wire72;
  always
    @(posedge clk) begin
      reg74 <= $unsigned(((7'h40) ?
          $signed(wire73) : $signed(reg22[(1'h0):(1'h0)])));
      reg75 <= wire21;
      reg76 <= (wire30 ? reg23 : wire30);
      reg77 <= ((~$signed((~&(wire73 ?
          (8'ha9) : reg19)))) * $unsigned(reg24[(1'h0):(1'h0)]));
      if (((~reg76) ?
          ({((8'ha1) - (-(8'hbe)))} * (~{$signed(wire16),
              (~|(8'had))})) : ((((wire12 <<< (7'h43)) ?
                      (reg24 >= reg23) : wire73) ?
                  reg74[(1'h1):(1'h1)] : (-reg25)) ?
              (wire73[(4'hb):(3'h4)] ?
                  ((reg76 ?
                      wire17 : reg74) <= (wire30 <= (8'hb4))) : {(~^(7'h40)),
                      (8'haa)}) : $unsigned(wire12))))
        begin
          reg78 <= (({reg76, reg22[(1'h1):(1'h0)]} >= ($signed({(8'hbe)}) ?
                  (8'hbf) : $signed($unsigned((8'ha7))))) ?
              (~^(+wire20)) : $unsigned((^reg29[(2'h2):(1'h0)])));
        end
      else
        begin
          reg78 <= (+$signed((reg22[(2'h2):(1'h0)] >> (|(~&reg22)))));
          if ((&(~^$signed($unsigned({(8'ha9), reg25})))))
            begin
              reg79 <= $signed((7'h40));
              reg80 <= (($signed($unsigned(reg28)) && $unsigned($signed((8'hb4)))) ?
                  (~&($unsigned($unsigned(wire20)) ?
                      (wire15 >>> ((8'ha3) ?
                          wire72 : reg79)) : $signed(wire13))) : $signed(($unsigned((7'h42)) ?
                      wire30[(4'ha):(3'h6)] : reg28[(2'h3):(1'h1)])));
              reg81 <= (~|$signed(($unsigned($unsigned((8'hb6))) == {(~(8'hba)),
                  reg80})));
            end
          else
            begin
              reg79 <= wire13[(2'h3):(2'h3)];
            end
          reg82 <= reg78;
        end
    end
endmodule

module module32
#(parameter param69 = ((8'haf) ? ((|(-(8'hb0))) <= (+(((8'hb1) ? (8'ha2) : (7'h40)) ? ((8'hb2) >>> (8'ha9)) : (~|(8'haf))))) : ((({(7'h41)} ? ((8'hb5) ? (8'ha0) : (8'hbc)) : ((8'ha7) ? (8'hb0) : (7'h42))) != ((&(8'hbb)) ? ((8'ha4) | (8'hb2)) : {(8'hab), (8'ha9)})) ? {(!{(7'h40), (8'hab)}), (8'hae)} : ((+(~^(8'hb2))) - {(~&(8'hbd))}))))
(y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'h17b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire36;
  input wire signed [(4'hd):(1'h0)] wire35;
  input wire [(5'h11):(1'h0)] wire34;
  input wire [(4'he):(1'h0)] wire33;
  wire [(4'h9):(1'h0)] wire68;
  wire signed [(5'h15):(1'h0)] wire67;
  wire signed [(4'ha):(1'h0)] wire66;
  wire [(5'h12):(1'h0)] wire65;
  wire [(5'h10):(1'h0)] wire64;
  wire [(4'hd):(1'h0)] wire63;
  wire [(5'h10):(1'h0)] wire62;
  wire [(4'hb):(1'h0)] wire61;
  wire signed [(4'hc):(1'h0)] wire60;
  wire [(3'h4):(1'h0)] wire59;
  wire [(4'hb):(1'h0)] wire58;
  wire signed [(2'h2):(1'h0)] wire57;
  wire [(4'h9):(1'h0)] wire56;
  wire [(2'h3):(1'h0)] wire39;
  wire signed [(4'hc):(1'h0)] wire38;
  wire signed [(4'hb):(1'h0)] wire37;
  reg [(4'hc):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(4'he):(1'h0)] reg52 = (1'h0);
  reg signed [(4'he):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg50 = (1'h0);
  reg [(5'h10):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg47 = (1'h0);
  reg [(4'h8):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(4'h8):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(2'h3):(1'h0)] reg40 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire39,
                 wire38,
                 wire37,
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
                 reg40,
                 (1'h0)};
  assign wire37 = wire33[(3'h6):(2'h2)];
  assign wire38 = ((((~|(!(8'hbc))) <= wire36) << (wire36[(4'ha):(2'h3)] || ((&wire37) * wire34[(5'h10):(1'h0)]))) ?
                      wire37 : (|$unsigned((8'ha9))));
  assign wire39 = $unsigned((|(~$signed(wire36))));
  always
    @(posedge clk) begin
      if ((8'hb7))
        begin
          reg40 <= $signed($unsigned(({$unsigned((8'ha7))} ?
              $unsigned((-wire36)) : (wire34[(5'h11):(4'hc)] ?
                  $unsigned(wire36) : (^~wire34)))));
          if (wire36[(1'h1):(1'h1)])
            begin
              reg41 <= $signed($signed(({$unsigned(wire38),
                  wire39[(1'h0):(1'h0)]} >>> wire35[(3'h5):(2'h2)])));
            end
          else
            begin
              reg41 <= ((wire33 >= reg40[(2'h2):(1'h1)]) ?
                  {(((!wire34) ? (reg40 << (8'hbf)) : (~&wire38)) ?
                          wire34 : (^(~wire34))),
                      (reg41[(5'h14):(2'h3)] * ((wire35 ? wire34 : (8'had)) ?
                          (~wire36) : $unsigned(wire34)))} : {(($unsigned(wire36) >= (wire35 ?
                          wire36 : wire34)) >= $signed((wire34 <<< wire35))),
                      wire35[(1'h1):(1'h0)]});
              reg42 <= ($signed((reg40 ?
                  wire39[(1'h1):(1'h1)] : reg41)) || {($unsigned(wire39[(2'h3):(2'h3)]) <= reg40)});
              reg43 <= $signed(((wire39[(1'h0):(1'h0)] ^ $signed($unsigned((8'hb1)))) ?
                  $unsigned(reg42) : ($signed((reg42 ? wire33 : wire35)) ?
                      ((-wire34) + wire33[(3'h5):(2'h2)]) : (wire35[(4'hd):(3'h5)] != wire38[(4'ha):(3'h6)]))));
              reg44 <= (-(~|wire35));
              reg45 <= $signed((^~wire37));
            end
          if ($signed(wire37))
            begin
              reg46 <= $signed((~|((reg40 == ((8'h9e) || wire37)) * {wire39})));
              reg47 <= {wire38, {(^(8'hab)), reg41}};
            end
          else
            begin
              reg46 <= (~^($unsigned($signed(reg41[(3'h6):(2'h2)])) - (~{wire34[(1'h0):(1'h0)]})));
              reg47 <= (~&($unsigned(($unsigned(reg43) ?
                  $unsigned(reg44) : wire33[(4'hb):(4'hb)])) != $signed(({(8'h9f),
                  reg45} == (!reg46)))));
              reg48 <= reg43[(3'h7):(3'h6)];
              reg49 <= $signed(wire36[(3'h4):(2'h3)]);
              reg50 <= $signed($unsigned(wire35[(4'hb):(3'h4)]));
            end
          if ((8'hae))
            begin
              reg51 <= reg49;
              reg52 <= {(reg46 != (|(((8'hb6) && (8'hb5)) >= (^~reg48))))};
              reg53 <= (reg42 ?
                  (reg50[(4'he):(4'ha)] ?
                      reg42[(3'h4):(2'h2)] : {$unsigned($unsigned(reg44)),
                          (-reg47)}) : {((-{(8'hb9), reg46}) ?
                          $unsigned((reg48 ?
                              reg45 : (8'haa))) : $unsigned($unsigned(reg44)))});
              reg54 <= $unsigned((^reg49[(4'hf):(4'hf)]));
              reg55 <= $unsigned((8'hae));
            end
          else
            begin
              reg51 <= (~|wire39);
              reg52 <= ((reg44 << (+reg52[(4'hb):(3'h7)])) + (~^(~^reg48[(1'h0):(1'h0)])));
              reg53 <= reg41;
              reg54 <= ((~&(wire33[(4'h8):(1'h1)] + reg49)) ?
                  $unsigned((-wire37[(1'h0):(1'h0)])) : wire37[(4'ha):(2'h2)]);
              reg55 <= ($unsigned({($unsigned(wire39) ?
                      reg53[(2'h3):(1'h0)] : ((7'h42) && reg47)),
                  $unsigned({wire35})}) >= (^~(~|((wire38 ?
                  reg42 : reg42) ^~ (reg44 ^ reg53)))));
            end
        end
      else
        begin
          reg40 <= (reg47 >>> (((&$signed(reg42)) ?
              $signed(reg46) : $signed($unsigned((8'hb5)))) <<< reg55[(1'h1):(1'h0)]));
          reg41 <= {((!(+{(8'ha0)})) <= (+$unsigned(reg47)))};
          reg42 <= ($signed($signed(reg50[(4'hd):(4'h8)])) << $unsigned(wire33[(1'h1):(1'h1)]));
        end
    end
  assign wire56 = (^$signed((^{$unsigned(wire36)})));
  assign wire57 = (-((-$unsigned($signed(reg45))) ?
                      reg52 : ((+(reg43 ?
                          reg49 : reg41)) - {reg43[(1'h1):(1'h0)]})));
  assign wire58 = {reg45[(1'h0):(1'h0)]};
  assign wire59 = {$signed(($unsigned((8'hbd)) << {(^~reg40),
                          reg52[(2'h3):(1'h1)]}))};
  assign wire60 = $signed(wire37);
  assign wire61 = $signed($unsigned(wire38[(2'h3):(1'h0)]));
  assign wire62 = (!(^{reg43}));
  assign wire63 = wire58[(4'h8):(2'h2)];
  assign wire64 = wire60[(4'h8):(3'h7)];
  assign wire65 = (((wire58 >= reg40[(1'h1):(1'h0)]) ?
                          (^$signed(reg44[(3'h5):(3'h4)])) : (|$signed(((8'hbe) ?
                              wire64 : reg50)))) ?
                      reg50[(3'h7):(2'h3)] : (($signed(wire63[(3'h5):(2'h2)]) ?
                              {{wire56, (8'ha4)},
                                  (~&wire34)} : $unsigned(reg52[(4'h8):(3'h6)])) ?
                          $unsigned($unsigned(reg46)) : (!reg45[(2'h2):(1'h0)])));
  assign wire66 = wire57;
  assign wire67 = $signed(reg43);
  assign wire68 = ($unsigned((~|(wire66[(2'h3):(1'h1)] ?
                      (wire67 != wire38) : wire36))) <<< $signed($signed(wire64)));
endmodule

module module191  (y, clk, wire196, wire195, wire194, wire193, wire192);
  output wire [(32'h1fa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire196;
  input wire signed [(2'h2):(1'h0)] wire195;
  input wire [(4'hc):(1'h0)] wire194;
  input wire signed [(5'h13):(1'h0)] wire193;
  input wire [(5'h10):(1'h0)] wire192;
  wire [(4'h9):(1'h0)] wire240;
  wire [(5'h11):(1'h0)] wire239;
  wire signed [(5'h13):(1'h0)] wire228;
  wire [(5'h15):(1'h0)] wire223;
  wire signed [(4'h8):(1'h0)] wire222;
  wire signed [(5'h10):(1'h0)] wire221;
  wire signed [(4'ha):(1'h0)] wire206;
  wire signed [(4'h9):(1'h0)] wire205;
  wire [(5'h12):(1'h0)] wire204;
  wire [(4'h9):(1'h0)] wire203;
  wire signed [(5'h12):(1'h0)] wire202;
  wire [(3'h6):(1'h0)] wire201;
  wire signed [(5'h13):(1'h0)] wire200;
  wire [(4'hd):(1'h0)] wire199;
  wire [(4'hb):(1'h0)] wire198;
  wire [(4'hb):(1'h0)] wire197;
  reg signed [(3'h5):(1'h0)] reg238 = (1'h0);
  reg [(3'h5):(1'h0)] reg237 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg236 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg235 = (1'h0);
  reg [(4'h9):(1'h0)] reg234 = (1'h0);
  reg [(5'h12):(1'h0)] reg233 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg232 = (1'h0);
  reg [(5'h12):(1'h0)] reg231 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg230 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg229 = (1'h0);
  reg [(3'h5):(1'h0)] reg227 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg226 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg225 = (1'h0);
  reg [(3'h6):(1'h0)] reg224 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg220 = (1'h0);
  reg [(3'h5):(1'h0)] reg219 = (1'h0);
  reg [(4'hb):(1'h0)] reg218 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg217 = (1'h0);
  reg [(3'h7):(1'h0)] reg216 = (1'h0);
  reg [(5'h10):(1'h0)] reg215 = (1'h0);
  reg [(5'h10):(1'h0)] reg214 = (1'h0);
  reg signed [(4'he):(1'h0)] reg213 = (1'h0);
  reg [(4'hd):(1'h0)] reg212 = (1'h0);
  reg [(4'h9):(1'h0)] reg211 = (1'h0);
  reg [(4'he):(1'h0)] reg210 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg209 = (1'h0);
  reg [(5'h13):(1'h0)] reg208 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg207 = (1'h0);
  assign y = {wire240,
                 wire239,
                 wire228,
                 wire223,
                 wire222,
                 wire221,
                 wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
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
                 reg227,
                 reg226,
                 reg225,
                 reg224,
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
                 (1'h0)};
  assign wire197 = (~&({$unsigned($unsigned(wire192)),
                       $unsigned((&wire195))} >>> $signed($signed({wire194}))));
  assign wire198 = (~&($signed(wire197[(1'h1):(1'h1)]) && $signed(wire196)));
  assign wire199 = ((~^(+(wire198[(4'hb):(1'h0)] + {wire195}))) ?
                       wire192[(5'h10):(5'h10)] : (($signed({wire195,
                               wire198}) >>> $signed($signed((8'hb0)))) ?
                           $signed((wire193[(1'h0):(1'h0)] >> $signed(wire196))) : {($signed(wire194) + {wire195,
                                   wire192}),
                               wire192}));
  assign wire200 = $unsigned(wire193[(4'h8):(1'h1)]);
  assign wire201 = wire197[(4'h8):(3'h4)];
  assign wire202 = $unsigned($unsigned((8'ha7)));
  assign wire203 = $unsigned($signed($signed((8'ha4))));
  assign wire204 = ((wire196 ?
                       $signed($signed((~&wire199))) : {(&wire198)}) ^~ wire201);
  assign wire205 = wire194[(4'hb):(3'h5)];
  assign wire206 = ((~|wire197[(4'h8):(2'h2)]) ?
                       wire194[(4'hc):(3'h6)] : wire198[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      reg207 <= $signed($unsigned(wire202[(4'hb):(3'h5)]));
      reg208 <= wire195[(2'h2):(1'h0)];
      reg209 <= wire199;
    end
  always
    @(posedge clk) begin
      reg210 <= wire204[(4'he):(4'h8)];
      reg211 <= $signed({reg207[(4'h9):(1'h0)]});
      if ($unsigned((!$signed(((^~(8'hac)) <<< wire199)))))
        begin
          reg212 <= $signed((((wire206[(1'h0):(1'h0)] | $signed(wire198)) >>> ($signed(reg211) ?
              (reg208 > reg210) : $signed(wire205))) ^~ (&(^wire196))));
          if (wire205[(2'h2):(1'h1)])
            begin
              reg213 <= wire202;
              reg214 <= ((!(wire195 ?
                  {(wire193 && reg211)} : $signed((-reg213)))) ^~ reg212[(4'hb):(1'h0)]);
            end
          else
            begin
              reg213 <= {($unsigned(((-reg213) | {(8'ha0), wire199})) ?
                      $signed($unsigned(((7'h41) & wire205))) : {({reg210} ?
                              (~&wire198) : $unsigned(wire201)),
                          (wire197 ? $unsigned(wire198) : $unsigned(wire202))}),
                  (8'h9e)};
              reg214 <= $unsigned(wire193[(3'h6):(3'h5)]);
              reg215 <= wire196;
            end
          if ({$unsigned(wire202)})
            begin
              reg216 <= (({$signed((wire205 >= reg208)),
                  (wire193 >> $signed(reg208))} >>> ((8'ha9) | $unsigned(reg207[(4'he):(1'h0)]))) <= reg210[(2'h2):(2'h2)]);
              reg217 <= {$unsigned(wire193[(3'h4):(3'h4)])};
            end
          else
            begin
              reg216 <= (reg210 + reg213);
              reg217 <= (((!(~$signed(reg212))) ?
                      (8'h9e) : (((wire192 != wire192) ~^ (8'ha3)) ?
                          $unsigned($unsigned(reg215)) : $unsigned(((8'hbb) ?
                              wire201 : reg215)))) ?
                  {($unsigned($signed(wire197)) ?
                          reg216 : ($unsigned(wire201) - $unsigned(wire200)))} : ({($signed((8'ha8)) ?
                          (reg210 ?
                              wire193 : reg217) : (reg213 - wire198))} >>> ($signed((wire203 <= wire193)) ?
                      (wire199 ?
                          wire198[(4'hb):(1'h1)] : $unsigned((8'ha2))) : ((8'hb3) >>> (|wire205)))));
            end
          reg218 <= wire197;
          reg219 <= $unsigned((~reg215[(4'hf):(4'h9)]));
        end
      else
        begin
          reg212 <= $signed({(~&$signed($signed(reg209))), $signed(reg217)});
          reg213 <= ((!((reg207[(4'h8):(4'h8)] && (wire193 <<< wire196)) < (wire204 ?
                  reg217[(1'h1):(1'h1)] : $signed(wire200)))) ?
              $signed((wire192[(3'h5):(1'h1)] + ((8'hb9) ?
                  {reg208, reg215} : wire205))) : $unsigned($signed((reg217 ?
                  {reg211} : (wire202 & (7'h40))))));
          reg214 <= wire195[(1'h1):(1'h1)];
        end
      reg220 <= $unsigned((~&reg219[(3'h4):(1'h1)]));
    end
  assign wire221 = (((|(^~$signed(wire194))) ~^ $signed(({(8'haa)} || wire198[(3'h7):(1'h1)]))) ^ (~|$unsigned($signed($unsigned((8'ha0))))));
  assign wire222 = reg214[(4'h8):(3'h4)];
  assign wire223 = $unsigned((^(~^({wire200} > {wire200}))));
  always
    @(posedge clk) begin
      reg224 <= reg208[(5'h12):(4'he)];
      reg225 <= wire193;
      reg226 <= ($unsigned((~$signed((8'h9c)))) ?
          $unsigned((~reg210[(2'h3):(1'h0)])) : $signed(reg225));
      reg227 <= $signed($signed($unsigned(wire194[(3'h6):(1'h1)])));
    end
  assign wire228 = reg225[(3'h7):(2'h2)];
  always
    @(posedge clk) begin
      if (reg218[(4'ha):(1'h1)])
        begin
          reg229 <= reg218[(4'h9):(3'h6)];
        end
      else
        begin
          reg229 <= {$signed(wire199)};
          reg230 <= (8'hb4);
          if ($unsigned($signed((^$unsigned(reg226[(3'h4):(2'h2)])))))
            begin
              reg231 <= (~&$signed({(-wire196[(5'h10):(3'h4)])}));
              reg232 <= wire195[(1'h0):(1'h0)];
              reg233 <= wire228[(4'hb):(3'h7)];
              reg234 <= $signed(reg229);
            end
          else
            begin
              reg231 <= $unsigned(wire206[(4'h9):(3'h7)]);
              reg232 <= (reg229 << $unsigned(((wire200 > {reg229}) ?
                  (~((8'hbf) ^~ reg218)) : $unsigned(wire200))));
            end
          if (((~&(((8'hbe) ?
                  wire195 : $signed(reg214)) ^~ reg214[(4'h8):(3'h7)])) ?
              (wire192 ?
                  reg230 : ($unsigned(wire192[(5'h10):(4'he)]) < wire204)) : ($signed(reg213[(3'h7):(3'h6)]) ?
                  (((~&reg207) ? {wire223} : reg229[(3'h5):(1'h0)]) ?
                      wire200[(4'hc):(3'h5)] : wire201) : $unsigned($signed((8'hbf))))))
            begin
              reg235 <= wire192[(3'h4):(2'h2)];
              reg236 <= $unsigned(reg213);
              reg237 <= (~(^~{$signed(reg216[(2'h2):(2'h2)]),
                  ((reg236 && wire221) ?
                      $signed(wire196) : (wire195 > reg207))}));
              reg238 <= ($unsigned((^$signed(reg219[(3'h5):(1'h0)]))) && $unsigned($signed(((wire193 ?
                      reg230 : wire198) ?
                  (wire228 ? reg218 : wire204) : (wire205 && reg235)))));
            end
          else
            begin
              reg235 <= ($signed(wire222[(3'h6):(3'h6)]) ?
                  $unsigned((~(reg220[(4'h8):(3'h5)] < $signed(reg219)))) : ((!(reg231 >= reg236)) ?
                      (!(!((8'hae) ? reg229 : reg215))) : (~^((reg210 ?
                              reg238 : wire196) ?
                          reg231[(5'h11):(4'hb)] : (+reg225)))));
            end
        end
    end
  assign wire239 = (8'hbc);
  assign wire240 = reg220[(2'h2):(1'h0)];
endmodule

module module144
#(parameter param187 = (|(((+(^(8'haa))) - {((8'h9d) ? (8'hbf) : (8'ha0)), {(8'hb3)}}) || ({((8'hb9) | (8'h9e)), (~(8'ha0))} ? (((8'hbc) ? (8'hbb) : (7'h41)) ^~ ((8'h9f) ? (8'ha6) : (8'ha4))) : (((8'hbc) >= (8'hbb)) ? ((8'hbd) ? (8'h9e) : (8'ha9)) : ((7'h40) > (8'had)))))), 
parameter param188 = ((^({(param187 ? param187 : param187)} < ((param187 >>> param187) ? param187 : (param187 ? param187 : param187)))) || {((-(-(8'hb0))) ? ((~|param187) && param187) : ((param187 ? (8'hba) : param187) != (+(7'h40))))}))
(y, clk, wire149, wire148, wire147, wire146, wire145);
  output wire [(32'h1dd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire149;
  input wire signed [(3'h6):(1'h0)] wire148;
  input wire signed [(5'h10):(1'h0)] wire147;
  input wire signed [(5'h11):(1'h0)] wire146;
  input wire signed [(3'h5):(1'h0)] wire145;
  wire signed [(5'h12):(1'h0)] wire186;
  wire signed [(4'hb):(1'h0)] wire185;
  wire [(5'h14):(1'h0)] wire184;
  wire [(4'hc):(1'h0)] wire181;
  wire signed [(5'h15):(1'h0)] wire180;
  wire [(5'h10):(1'h0)] wire179;
  wire [(3'h5):(1'h0)] wire178;
  wire [(3'h4):(1'h0)] wire177;
  wire [(4'h9):(1'h0)] wire176;
  wire [(4'h8):(1'h0)] wire175;
  wire [(5'h11):(1'h0)] wire174;
  wire [(3'h7):(1'h0)] wire173;
  wire [(4'he):(1'h0)] wire167;
  wire signed [(4'h9):(1'h0)] wire152;
  wire [(5'h13):(1'h0)] wire151;
  wire signed [(2'h2):(1'h0)] wire150;
  reg [(5'h11):(1'h0)] reg183 = (1'h0);
  reg [(5'h15):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg172 = (1'h0);
  reg [(5'h13):(1'h0)] reg171 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg170 = (1'h0);
  reg [(4'he):(1'h0)] reg169 = (1'h0);
  reg [(2'h3):(1'h0)] reg168 = (1'h0);
  reg [(5'h15):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg165 = (1'h0);
  reg [(4'hc):(1'h0)] reg164 = (1'h0);
  reg [(5'h14):(1'h0)] reg163 = (1'h0);
  reg [(4'h9):(1'h0)] reg162 = (1'h0);
  reg [(2'h3):(1'h0)] reg161 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg160 = (1'h0);
  reg [(5'h13):(1'h0)] reg159 = (1'h0);
  reg [(5'h13):(1'h0)] reg158 = (1'h0);
  reg [(5'h13):(1'h0)] reg157 = (1'h0);
  reg [(4'h8):(1'h0)] reg156 = (1'h0);
  reg [(5'h10):(1'h0)] reg155 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg154 = (1'h0);
  reg [(4'hf):(1'h0)] reg153 = (1'h0);
  assign y = {wire186,
                 wire185,
                 wire184,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire167,
                 wire152,
                 wire151,
                 wire150,
                 reg183,
                 reg182,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
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
                 (1'h0)};
  assign wire150 = $signed(wire146);
  assign wire151 = $unsigned(($signed((wire147[(2'h3):(1'h0)] << (wire146 ?
                           wire150 : wire149))) ?
                       (wire148[(2'h3):(1'h1)] && ((-wire148) | wire149)) : (((wire145 ^~ wire146) ?
                               {wire145, wire150} : (wire146 ?
                                   wire149 : wire149)) ?
                           ($unsigned(wire147) >= wire149) : wire148[(3'h4):(2'h2)])));
  assign wire152 = $signed(wire145[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if ({(8'ha3)})
        begin
          reg153 <= wire148[(3'h4):(1'h0)];
          if (($unsigned($signed($signed(wire152[(3'h4):(2'h3)]))) ?
              (&(^~(wire150 ? $signed(wire149) : wire148))) : wire151))
            begin
              reg154 <= reg153[(4'hf):(1'h1)];
            end
          else
            begin
              reg154 <= wire145;
            end
          reg155 <= $unsigned($signed((reg153[(4'hd):(3'h6)] - $unsigned((wire146 ^ reg153)))));
          reg156 <= ((+(((wire150 ? wire147 : (8'h9d)) ?
              (reg153 ? reg154 : wire152) : wire147) || (reg153 ?
              (wire149 & wire146) : $signed(wire149)))) <= (8'hb7));
        end
      else
        begin
          reg153 <= ((&wire149[(1'h1):(1'h1)]) ?
              (^~{$signed($unsigned(reg154))}) : $signed((reg153 ?
                  reg153[(4'hb):(3'h7)] : reg154[(1'h0):(1'h0)])));
          reg154 <= $signed($signed(wire151));
          reg155 <= (8'haa);
          if ((~(reg154 <<< (-wire150[(1'h1):(1'h1)]))))
            begin
              reg156 <= ((&reg155[(1'h1):(1'h0)]) | ((((reg153 >> wire147) < wire150[(2'h2):(1'h0)]) || $unsigned((wire149 ?
                      wire145 : (8'hb4)))) ?
                  reg154[(2'h2):(1'h0)] : (wire145 && $unsigned(reg154))));
              reg157 <= wire145;
            end
          else
            begin
              reg156 <= reg156;
            end
          reg158 <= {wire149[(4'hd):(4'hd)], reg157};
        end
      reg159 <= reg154;
      reg160 <= wire146;
      if ((8'ha9))
        begin
          reg161 <= ((wire151[(5'h10):(3'h5)] ?
              $unsigned(((reg157 == reg153) ^~ (wire152 ^~ wire151))) : (reg159 >>> reg158[(5'h10):(4'h9)])) != (wire149[(4'h8):(2'h3)] == ($unsigned($signed(reg154)) ?
              reg157 : wire148[(1'h1):(1'h0)])));
          reg162 <= (($unsigned(reg160[(1'h1):(1'h0)]) == $unsigned(wire145[(2'h3):(1'h0)])) ?
              {$unsigned($unsigned(reg160)),
                  ((!$unsigned(wire149)) <<< $signed(reg158))} : ($unsigned((~^reg160)) ?
                  $signed(wire149) : ((reg158 ?
                      reg154 : ((8'ha7) <= wire152)) & {(!wire150), reg155})));
          reg163 <= {$signed(wire145[(2'h2):(1'h1)]),
              (-$signed((((8'hb4) << (8'hb2)) | wire147)))};
          reg164 <= (wire150 ?
              $unsigned((~$signed($signed((8'hb3))))) : (~^wire147[(4'hf):(1'h0)]));
          reg165 <= $signed((&$signed($signed(((7'h40) | reg161)))));
        end
      else
        begin
          reg161 <= ($unsigned($unsigned(reg162)) * {reg156[(2'h3):(1'h1)]});
          reg162 <= wire145[(3'h5):(2'h2)];
          reg163 <= {{$signed($unsigned((|(8'had)))),
                  ($signed(wire149) * $unsigned($unsigned(wire151)))},
              ({(^(wire147 << reg160)),
                  ({wire148} ^ wire150)} >>> ($signed(wire148) ^ $signed((~|wire151))))};
        end
      reg166 <= ($signed(wire149[(3'h5):(1'h1)]) ?
          wire149 : $unsigned(reg163[(3'h6):(3'h4)]));
    end
  assign wire167 = $unsigned((reg165[(4'h9):(3'h6)] >>> wire152));
  always
    @(posedge clk) begin
      reg168 <= wire149[(5'h12):(4'ha)];
      reg169 <= wire146[(4'he):(4'h8)];
      reg170 <= $signed({(-($unsigned((7'h44)) && wire145[(2'h2):(1'h0)])),
          (((reg161 >>> reg169) ?
              (reg163 ? reg169 : reg169) : $signed((8'ha4))) >>> {(!wire150),
              {reg154}})});
      reg171 <= reg169;
      reg172 <= $unsigned(($signed(reg168) & reg159));
    end
  assign wire173 = reg166;
  assign wire174 = (wire148 ^ ((reg168[(1'h0):(1'h0)] << (8'ha4)) ?
                       (((wire167 ?
                           reg169 : (8'hae)) ^ $signed(wire148)) << reg162[(1'h0):(1'h0)]) : {reg168[(2'h3):(1'h0)],
                           (-reg166[(4'he):(4'h9)])}));
  assign wire175 = $signed((+(|($unsigned(reg153) ?
                       reg170[(1'h0):(1'h0)] : (-reg157)))));
  assign wire176 = (~($signed((reg165 ?
                           ((8'h9c) ? (8'hab) : reg166) : (reg159 ?
                               reg162 : reg157))) ?
                       {$unsigned(wire147[(2'h3):(1'h1)]),
                           ((~wire149) ?
                               (-(8'ha2)) : $unsigned((8'haf)))} : ((^~(reg156 ?
                               reg166 : wire150)) ?
                           $unsigned((reg161 ^ reg156)) : reg158[(3'h5):(2'h3)])));
  assign wire177 = $unsigned(wire176[(4'h9):(3'h6)]);
  assign wire178 = {(8'h9c)};
  assign wire179 = (({$signed((wire145 ? reg165 : reg171)),
                               $unsigned((~reg162))} ?
                           reg170[(2'h3):(2'h3)] : $signed(($signed((8'haa)) ?
                               $signed(wire151) : reg156))) ?
                       $unsigned($signed((wire150 && (8'hb0)))) : reg169[(4'hc):(3'h7)]);
  assign wire180 = (~|$unsigned(reg157));
  assign wire181 = $signed($unsigned($signed({reg165, {reg164, reg162}})));
  always
    @(posedge clk) begin
      reg182 <= ((wire181[(4'hc):(4'hc)] ?
          ((reg162[(3'h7):(3'h7)] || wire151[(4'hd):(3'h4)]) ?
              reg157 : {(wire178 >>> reg164),
                  ((8'hb3) ?
                      reg161 : (8'hb2))}) : (^~(!$signed(reg160)))) >= {reg159[(5'h11):(1'h1)],
          (-$signed((wire173 || reg154)))});
      reg183 <= reg182[(1'h0):(1'h0)];
    end
  assign wire184 = ((7'h43) < $signed((~^((reg161 == wire176) ?
                       $signed(wire148) : wire178))));
  assign wire185 = (($unsigned(((wire177 | wire146) ?
                           {wire180, wire173} : $signed(reg156))) ?
                       (((reg159 << reg156) <<< wire184) * wire151) : {reg154,
                           (~wire146[(1'h0):(1'h0)])}) ^ {(&wire148[(3'h6):(3'h4)]),
                       (({(8'h9e), wire184} ? reg160[(2'h3):(2'h2)] : (8'hae)) ?
                           reg155 : ((wire175 ?
                               (8'hb5) : wire167) <<< $signed(wire147)))});
  assign wire186 = wire179[(2'h2):(1'h1)];
endmodule

module module113  (y, clk, wire117, wire116, wire115, wire114);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire117;
  input wire [(3'h5):(1'h0)] wire116;
  input wire signed [(3'h6):(1'h0)] wire115;
  input wire signed [(5'h14):(1'h0)] wire114;
  wire signed [(4'hf):(1'h0)] wire131;
  wire [(2'h2):(1'h0)] wire130;
  wire signed [(4'h9):(1'h0)] wire129;
  wire [(2'h2):(1'h0)] wire128;
  wire signed [(5'h13):(1'h0)] wire126;
  wire [(5'h10):(1'h0)] wire125;
  wire [(5'h11):(1'h0)] wire124;
  wire signed [(2'h3):(1'h0)] wire123;
  wire signed [(2'h2):(1'h0)] wire122;
  wire signed [(5'h10):(1'h0)] wire121;
  wire [(4'he):(1'h0)] wire120;
  wire [(4'h8):(1'h0)] wire119;
  wire [(4'h9):(1'h0)] wire118;
  reg [(4'he):(1'h0)] reg127 = (1'h0);
  assign y = {wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 reg127,
                 (1'h0)};
  assign wire118 = $signed(wire114);
  assign wire119 = $unsigned(wire114[(2'h2):(1'h1)]);
  assign wire120 = $unsigned((-(($signed(wire117) ?
                           (wire118 ? (7'h42) : wire114) : (wire118 ?
                               (8'haa) : wire115)) ?
                       wire115[(2'h2):(1'h0)] : $signed($signed(wire115)))));
  assign wire121 = $signed(((8'ha2) ? wire118 : wire117));
  assign wire122 = $unsigned($signed($signed(wire116[(3'h4):(1'h1)])));
  assign wire123 = $signed(wire116[(1'h1):(1'h1)]);
  assign wire124 = wire122;
  assign wire125 = ($unsigned((((~|wire122) ^~ ((7'h43) ^~ wire121)) || (~|$unsigned(wire121)))) <= (8'h9d));
  assign wire126 = $signed((wire123 << ((((8'hb1) ?
                           wire116 : wire115) ^ (wire118 ^~ wire114)) ?
                       ($signed(wire125) ?
                           (^(8'hb3)) : {wire116,
                               wire117}) : ($signed(wire120) ?
                           (wire114 | wire118) : (wire124 ?
                               wire122 : wire121)))));
  always
    @(posedge clk) begin
      reg127 <= $signed(wire117);
    end
  assign wire128 = ((&$signed($signed((wire126 ?
                       wire126 : wire125)))) >> $signed($signed((|(|(8'hb6))))));
  assign wire129 = reg127[(3'h5):(2'h2)];
  assign wire130 = ((~|($unsigned(wire124) + $signed((^~wire114)))) ?
                       (((&$signed(wire122)) ?
                               wire126 : (-(wire116 >> wire129))) ?
                           wire114[(5'h12):(4'hc)] : {$unsigned({wire116,
                                   (7'h43)})}) : {$signed(wire128[(1'h1):(1'h0)])});
  assign wire131 = $signed(($signed({{wire118, wire129}, $signed(wire129)}) ?
                       wire124[(4'ha):(3'h5)] : wire114));
endmodule
