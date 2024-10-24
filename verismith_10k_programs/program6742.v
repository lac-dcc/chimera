module top
#(parameter param284 = (|(~(8'hb0))), 
parameter param285 = (+param284))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h2c5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  wire [(4'hb):(1'h0)] wire283;
  wire signed [(4'hb):(1'h0)] wire282;
  wire signed [(4'he):(1'h0)] wire281;
  wire signed [(5'h15):(1'h0)] wire280;
  wire signed [(5'h14):(1'h0)] wire279;
  wire [(3'h5):(1'h0)] wire278;
  wire signed [(5'h12):(1'h0)] wire277;
  wire [(3'h6):(1'h0)] wire242;
  wire [(5'h13):(1'h0)] wire39;
  wire [(3'h5):(1'h0)] wire41;
  wire signed [(5'h14):(1'h0)] wire42;
  wire [(5'h14):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire44;
  wire signed [(5'h13):(1'h0)] wire98;
  wire [(5'h14):(1'h0)] wire236;
  wire signed [(5'h11):(1'h0)] wire238;
  wire signed [(5'h14):(1'h0)] wire239;
  wire signed [(5'h12):(1'h0)] wire240;
  reg signed [(5'h11):(1'h0)] reg276 = (1'h0);
  reg [(4'hf):(1'h0)] reg275 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg274 = (1'h0);
  reg [(4'hd):(1'h0)] reg273 = (1'h0);
  reg [(4'hc):(1'h0)] reg272 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg271 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg270 = (1'h0);
  reg [(5'h14):(1'h0)] reg269 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg268 = (1'h0);
  reg [(4'hf):(1'h0)] reg267 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg266 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg265 = (1'h0);
  reg [(5'h14):(1'h0)] reg264 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg263 = (1'h0);
  reg [(3'h5):(1'h0)] reg262 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg261 = (1'h0);
  reg [(3'h7):(1'h0)] reg260 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg259 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg258 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg257 = (1'h0);
  reg [(4'h9):(1'h0)] reg256 = (1'h0);
  reg [(4'h9):(1'h0)] reg255 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg254 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg253 = (1'h0);
  reg [(4'he):(1'h0)] reg252 = (1'h0);
  reg [(4'h8):(1'h0)] reg251 = (1'h0);
  reg [(4'hc):(1'h0)] reg250 = (1'h0);
  reg [(5'h13):(1'h0)] reg249 = (1'h0);
  reg [(5'h10):(1'h0)] reg248 = (1'h0);
  reg [(5'h15):(1'h0)] reg247 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg246 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg245 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg244 = (1'h0);
  reg [(2'h3):(1'h0)] reg243 = (1'h0);
  assign y = {wire283,
                 wire282,
                 wire281,
                 wire280,
                 wire279,
                 wire278,
                 wire277,
                 wire242,
                 wire39,
                 wire41,
                 wire42,
                 wire43,
                 wire44,
                 wire98,
                 wire236,
                 wire238,
                 wire239,
                 wire240,
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
                 (1'h0)};
  module4 #() modinst40 (wire39, clk, wire1, wire0, wire3, wire2, (8'ha0));
  assign wire41 = wire1;
  assign wire42 = (wire1[(3'h6):(3'h6)] ?
                      (wire2 ?
                          ($unsigned((wire2 ? wire3 : wire39)) ?
                              ($unsigned(wire0) | wire41) : ((wire0 <= wire3) ?
                                  (wire0 ?
                                      wire2 : wire39) : $unsigned(wire2))) : (wire3 ?
                              ((~(8'hb3)) - wire39) : wire1)) : $unsigned(((wire2 ?
                              (wire41 ? wire41 : wire0) : wire0) ?
                          wire3 : (~^wire0))));
  assign wire43 = $unsigned({(-(~|$unsigned(wire0)))});
  assign wire44 = wire2;
  module45 #() modinst99 (wire98, clk, wire44, wire1, wire39, wire0);
  module100 #() modinst237 (.y(wire236), .wire102(wire3), .wire104(wire43), .wire103(wire39), .wire101(wire98), .clk(clk));
  assign wire238 = {wire1};
  assign wire239 = $signed((wire236[(4'hb):(3'h5)] >= (|$signed($unsigned(wire2)))));
  module217 #() modinst241 (.wire222(wire44), .clk(clk), .wire221(wire43), .wire219(wire0), .y(wire240), .wire218(wire239), .wire220(wire42));
  assign wire242 = (wire42 - $unsigned($unsigned(wire42[(4'h9):(3'h4)])));
  always
    @(posedge clk) begin
      reg243 <= $signed(wire3);
      if ($signed((wire43 ? $unsigned({$signed(wire42)}) : wire1)))
        begin
          reg244 <= wire0;
          reg245 <= $unsigned(((8'hba) ?
              (+$unsigned(reg244)) : $signed((((8'hac) ?
                  reg244 : wire242) >> $signed(wire98)))));
        end
      else
        begin
          reg244 <= wire242[(1'h0):(1'h0)];
          reg245 <= (|$unsigned((~^$signed((^~reg243)))));
          if ({wire98[(5'h10):(4'h8)], $signed($signed(wire3[(5'h12):(2'h2)]))})
            begin
              reg246 <= reg245[(1'h1):(1'h0)];
              reg247 <= $signed({(($unsigned(wire43) <<< $signed(wire0)) << ((-wire98) ?
                      (wire3 <= reg244) : (wire238 ? wire1 : reg245)))});
              reg248 <= (8'ha4);
            end
          else
            begin
              reg246 <= $unsigned($signed(((8'ha3) >> $signed($unsigned(reg244)))));
              reg247 <= $signed(wire236);
            end
          reg249 <= (wire44 ?
              {wire3[(1'h1):(1'h0)],
                  (reg245 ?
                      ((&wire236) < $unsigned(wire41)) : (-(wire239 ?
                          wire242 : reg247)))} : wire0[(1'h1):(1'h0)]);
          if ($signed($signed($signed({((8'h9d) + wire240)}))))
            begin
              reg250 <= wire39;
              reg251 <= $unsigned((wire42[(4'hf):(3'h6)] ?
                  {$unsigned((wire242 * reg243)),
                      ($unsigned(wire238) ?
                          (wire238 ? wire238 : wire242) : reg245)} : (((reg246 ?
                      (8'hb6) : (8'hb0)) ~^ (&reg249)) + (~|$signed((8'hba))))));
              reg252 <= wire1;
            end
          else
            begin
              reg250 <= reg247[(1'h0):(1'h0)];
            end
        end
      if (wire238)
        begin
          reg253 <= $signed($unsigned({reg245[(3'h4):(2'h3)],
              wire242[(3'h4):(2'h3)]}));
          reg254 <= $signed(($signed((~reg250)) ?
              (wire242[(2'h2):(2'h2)] != $signed($unsigned(reg250))) : reg250[(2'h2):(1'h1)]));
        end
      else
        begin
          reg253 <= (~^(~&(($unsigned(reg254) ?
              (^(8'hba)) : (wire3 ?
                  reg248 : wire3)) <= wire242[(2'h3):(2'h2)])));
        end
      reg255 <= (~((!$signed(wire39[(4'h9):(4'h8)])) ?
          $unsigned(wire2) : $unsigned($signed((wire242 ^ reg247)))));
      reg256 <= ($signed($signed(reg243[(1'h0):(1'h0)])) ?
          ({reg252[(3'h5):(2'h3)]} ?
              $unsigned((^(wire239 ?
                  reg245 : wire238))) : reg249) : ((^{$signed(reg254)}) ?
              wire42 : reg255));
    end
  always
    @(posedge clk) begin
      reg257 <= $signed((8'ha7));
      reg258 <= (($signed((reg249[(2'h2):(1'h0)] <<< reg257[(1'h1):(1'h1)])) ?
              (reg256[(4'h9):(1'h1)] ?
                  wire42 : wire1) : ((&(8'hbc)) ~^ ($signed(wire238) ?
                  (8'hb0) : wire236[(5'h11):(5'h10)]))) ?
          (|(^reg245[(1'h1):(1'h0)])) : $unsigned(($signed(reg247[(4'ha):(4'h8)]) ?
              reg248 : reg253)));
      if (((reg252 && $signed($signed((wire2 && wire242)))) ?
          (~reg248) : {$signed($unsigned((reg247 <<< reg248))),
              (+$signed(wire41))}))
        begin
          reg259 <= (reg257[(2'h3):(1'h1)] | $signed((8'hbc)));
          reg260 <= wire39[(4'h8):(1'h0)];
          if (wire1)
            begin
              reg261 <= ((^reg257) ?
                  $signed(wire98) : (~|(+$signed($unsigned(wire98)))));
            end
          else
            begin
              reg261 <= $unsigned((wire0 <<< $signed((wire240 < reg260))));
              reg262 <= ($signed(wire44[(4'hd):(4'h9)]) ?
                  wire39 : $unsigned(reg246[(1'h0):(1'h0)]));
            end
          reg263 <= (~^$signed($unsigned((&{reg251, (8'hb8)}))));
        end
      else
        begin
          reg259 <= wire42;
          reg260 <= (($signed((8'ha3)) ?
              $unsigned((reg257[(2'h3):(1'h0)] ?
                  ((8'hb0) <= reg247) : wire242[(2'h2):(2'h2)])) : (~|((wire238 <= reg262) > $unsigned(reg250)))) <= (reg252[(4'h9):(3'h6)] ?
              (+{(reg257 ?
                      (8'ha9) : reg245)}) : $unsigned(wire239[(4'h8):(3'h6)])));
          reg261 <= $signed(reg253);
          reg262 <= wire3[(1'h0):(1'h0)];
          reg263 <= (|reg249[(1'h1):(1'h0)]);
        end
    end
  always
    @(posedge clk) begin
      if ((wire44 ? wire242 : (|reg256)))
        begin
          reg264 <= $signed(wire2);
        end
      else
        begin
          reg264 <= $unsigned(((+($signed(wire44) ?
              wire41[(3'h5):(2'h2)] : $unsigned(reg248))) & {{(reg259 <<< reg260)},
              $signed($unsigned(reg249))}));
        end
      reg265 <= $unsigned((~^reg247[(1'h0):(1'h0)]));
      if ($unsigned($unsigned(wire0)))
        begin
          reg266 <= ($unsigned((8'hb7)) <= reg258[(2'h3):(2'h2)]);
        end
      else
        begin
          reg266 <= (reg262[(2'h2):(1'h1)] | ($unsigned($signed({reg250,
                  reg254})) ?
              (~|wire0[(2'h2):(2'h2)]) : (8'hb5)));
          if ((!wire3))
            begin
              reg267 <= $unsigned(((wire41 ^ wire39) ?
                  $signed((reg243 <<< (8'h9c))) : $signed({((8'ha2) & reg252),
                      (8'ha7)})));
              reg268 <= (^~((^~wire98) ? reg265 : $signed(wire240)));
              reg269 <= (&$signed((wire236[(3'h6):(3'h6)] <= (((8'ha2) * reg266) ?
                  $signed(wire239) : (reg257 ^~ wire2)))));
              reg270 <= (&{(((reg266 > reg247) ?
                      $signed((8'hb7)) : $signed(wire240)) <= ((reg249 < reg255) ?
                      wire98 : $unsigned(wire44))),
                  ((!$unsigned(reg244)) ?
                      ((wire39 ?
                          wire3 : reg266) <= (~&(7'h41))) : (~$signed((8'ha7))))});
            end
          else
            begin
              reg267 <= reg247;
            end
          if ((^~{wire98}))
            begin
              reg271 <= reg244;
              reg272 <= $signed(reg245);
              reg273 <= ($unsigned(reg254[(4'h9):(1'h0)]) | reg263);
              reg274 <= $unsigned((!(reg245[(3'h4):(1'h1)] ?
                  wire239[(3'h6):(3'h5)] : $signed({reg272, reg257}))));
              reg275 <= $signed((!$unsigned($unsigned((reg245 ?
                  reg272 : reg265)))));
            end
          else
            begin
              reg271 <= $signed((reg246[(1'h1):(1'h0)] + reg255));
              reg272 <= $signed({wire238[(4'he):(4'he)]});
            end
          reg276 <= (reg253 ?
              ($unsigned(((reg268 >= reg273) & (wire236 >> reg254))) ?
                  (reg249[(4'hb):(1'h1)] || $signed($unsigned(wire43))) : $unsigned((8'h9f))) : ((wire2[(4'hd):(3'h4)] <<< reg265[(4'hf):(4'hb)]) || $signed($signed($unsigned(reg261)))));
        end
    end
  assign wire277 = reg247[(5'h15):(4'h8)];
  assign wire278 = (+$unsigned($signed(($signed(reg250) ?
                       (reg274 ^ wire41) : $signed(wire98)))));
  assign wire279 = $unsigned($unsigned(reg253[(3'h7):(3'h7)]));
  assign wire280 = $unsigned((~(((+reg269) ? $signed(reg274) : (~|reg259)) ?
                       reg257[(1'h1):(1'h1)] : ($unsigned(reg254) <= (reg274 ?
                           (8'ha4) : (8'h9e))))));
  assign wire281 = $unsigned(($unsigned($signed($unsigned(reg253))) & {(8'hbe),
                       (~^((8'hb3) ? reg274 : reg243))}));
  assign wire282 = wire39;
  assign wire283 = $signed(($signed((&wire279)) >> (wire277 & (reg262 ?
                       reg245[(3'h5):(2'h3)] : $signed(reg252)))));
endmodule

module module100
#(parameter param235 = ((8'hba) ? (^(!{((8'had) ? (8'hbb) : (8'hb8)), ((8'ha3) >= (8'ha0))})) : (8'haf)))
(y, clk, wire101, wire102, wire103, wire104);
  output wire [(32'h14d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire101;
  input wire [(5'h13):(1'h0)] wire102;
  input wire [(5'h13):(1'h0)] wire103;
  input wire [(5'h14):(1'h0)] wire104;
  wire [(5'h15):(1'h0)] wire233;
  wire [(5'h15):(1'h0)] wire216;
  wire [(4'hd):(1'h0)] wire215;
  wire signed [(5'h11):(1'h0)] wire214;
  wire signed [(3'h4):(1'h0)] wire210;
  wire [(5'h14):(1'h0)] wire209;
  wire signed [(5'h12):(1'h0)] wire208;
  wire signed [(5'h11):(1'h0)] wire202;
  wire [(2'h3):(1'h0)] wire200;
  wire signed [(5'h10):(1'h0)] wire188;
  wire signed [(5'h13):(1'h0)] wire187;
  wire [(5'h11):(1'h0)] wire105;
  wire [(5'h14):(1'h0)] wire147;
  wire signed [(4'h9):(1'h0)] wire184;
  reg [(4'he):(1'h0)] reg186 = (1'h0);
  reg [(3'h4):(1'h0)] reg203 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg204 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg205 = (1'h0);
  reg signed [(4'he):(1'h0)] reg206 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg207 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg211 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg212 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg213 = (1'h0);
  assign y = {wire233,
                 wire216,
                 wire215,
                 wire214,
                 wire210,
                 wire209,
                 wire208,
                 wire202,
                 wire200,
                 wire188,
                 wire187,
                 wire105,
                 wire147,
                 wire184,
                 reg186,
                 reg203,
                 reg204,
                 reg205,
                 reg206,
                 reg207,
                 reg211,
                 reg212,
                 reg213,
                 (1'h0)};
  assign wire105 = {(+$signed(wire101[(2'h2):(1'h1)]))};
  module106 #() modinst148 (wire147, clk, wire104, wire101, wire103, wire105);
  module149 #() modinst185 (wire184, clk, wire105, wire102, wire104, wire147, wire101);
  always
    @(posedge clk) begin
      reg186 <= (&$unsigned(((wire104 + wire147) > $signed(wire101))));
    end
  assign wire187 = ((~|wire105) ?
                       (wire147[(5'h14):(4'hf)] ?
                           wire103 : (($unsigned(wire101) ?
                                   $signed(wire104) : {wire105}) ?
                               $signed(wire104[(4'h9):(3'h5)]) : ((8'hbc) ?
                                   (wire147 < reg186) : (!wire102)))) : $unsigned($unsigned($unsigned(wire147))));
  assign wire188 = $signed(($signed((((8'ha2) ?
                           wire105 : reg186) ^ (|wire104))) ?
                       (wire187[(3'h7):(3'h5)] <= (~&(reg186 & wire184))) : wire147[(1'h0):(1'h0)]));
  module189 #() modinst201 (.clk(clk), .wire192(wire147), .wire190(wire101), .y(wire200), .wire194(reg186), .wire193(wire104), .wire191(wire187));
  assign wire202 = $unsigned(wire147[(5'h13):(4'ha)]);
  always
    @(posedge clk) begin
      if ($signed({((-wire102) ?
              (wire188[(5'h10):(3'h5)] != (wire188 ?
                  wire202 : wire104)) : $signed($signed(wire101)))}))
        begin
          reg203 <= ((~|{((+wire102) >> $unsigned(wire188)),
              (wire101 ?
                  {(8'hb5), wire184} : wire202[(3'h5):(2'h2)])}) || wire102);
        end
      else
        begin
          reg203 <= (wire102 ?
              (((~reg203[(3'h4):(1'h1)]) != (~^$signed(reg203))) * wire147) : wire184[(1'h0):(1'h0)]);
        end
      reg204 <= $unsigned((|$unsigned(wire105)));
      reg205 <= ($signed($signed($unsigned((reg204 << wire105)))) == wire101[(4'hd):(3'h5)]);
      reg206 <= $signed(((($signed((8'hba)) * wire187[(4'ha):(4'ha)]) >= (^$signed((8'ha4)))) ?
          (((wire187 ? wire103 : wire187) <= (wire202 ? wire104 : wire103)) ?
              $unsigned({wire200}) : (^(wire202 ?
                  wire101 : wire102))) : wire101));
      reg207 <= (7'h43);
    end
  assign wire208 = wire105[(4'hf):(4'he)];
  assign wire209 = $signed({wire147[(1'h0):(1'h0)],
                       $unsigned($signed(wire184[(1'h1):(1'h0)]))});
  assign wire210 = reg206[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg211 <= ($unsigned(($signed($unsigned((8'h9d))) ?
          $unsigned($signed(wire188)) : wire200)) - $unsigned(wire208));
      reg212 <= wire208[(5'h12):(4'h8)];
      reg213 <= $signed(reg204);
    end
  assign wire214 = (^~((~&$unsigned(((8'hb5) ?
                       wire187 : reg205))) + (!($signed(reg186) ?
                       (wire200 ^ (7'h44)) : $signed(wire105)))));
  assign wire215 = wire208;
  assign wire216 = (wire202 ?
                       wire202[(3'h7):(1'h0)] : ({(wire210[(3'h4):(1'h1)] ?
                               {(8'hbf),
                                   (8'hb2)} : $unsigned(wire188))} - $unsigned(wire184[(3'h5):(2'h2)])));
  module217 #() modinst234 (.y(wire233), .wire218(wire215), .wire220(wire209), .wire222(wire105), .clk(clk), .wire221(reg205), .wire219(wire214));
endmodule

module module45
#(parameter param96 = (((~|(~&((8'hb4) >>> (8'hb8)))) ? ((((8'h9f) ? (8'hb0) : (8'hbe)) <= (~^(8'hb9))) >> (8'ha3)) : (({(8'h9f)} ? ((8'hb8) != (8'ha1)) : (8'haf)) ? ((~&(8'hbb)) >>> (^(8'ha4))) : {((7'h44) << (8'h9f)), (~^(8'h9c))})) ? ((8'hbd) ? (~{((8'hb9) ? (8'h9d) : (8'ha1)), (-(8'hbf))}) : (^(!(^(8'hb7))))) : {(!(7'h44))}), 
parameter param97 = {param96})
(y, clk, wire49, wire48, wire47, wire46);
  output wire [(32'h143):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire49;
  input wire [(5'h12):(1'h0)] wire48;
  input wire signed [(5'h10):(1'h0)] wire47;
  input wire [(5'h14):(1'h0)] wire46;
  wire [(3'h6):(1'h0)] wire95;
  wire signed [(4'hc):(1'h0)] wire93;
  wire [(2'h3):(1'h0)] wire76;
  wire [(5'h11):(1'h0)] wire75;
  wire [(4'hc):(1'h0)] wire74;
  wire signed [(4'hc):(1'h0)] wire73;
  wire signed [(3'h7):(1'h0)] wire72;
  wire signed [(4'hd):(1'h0)] wire50;
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg [(3'h7):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg53 = (1'h0);
  reg [(4'he):(1'h0)] reg54 = (1'h0);
  reg [(4'h9):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg57 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg [(4'ha):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg60 = (1'h0);
  reg [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(4'hc):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg69 = (1'h0);
  reg [(4'hc):(1'h0)] reg70 = (1'h0);
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  assign y = {wire95,
                 wire93,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire50,
                 reg51,
                 reg52,
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
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 (1'h0)};
  assign wire50 = $signed($signed($unsigned(((wire49 << (8'ha9)) <<< (~|wire46)))));
  always
    @(posedge clk) begin
      if (((!(8'ha9)) != (((+$signed(wire46)) ? wire49 : $unsigned(wire47)) ?
          (8'h9e) : $signed((7'h40)))))
        begin
          reg51 <= $unsigned(($unsigned((7'h44)) ?
              ((!(!wire48)) ?
                  (wire48[(3'h5):(3'h4)] <= {wire46,
                      wire49}) : wire46) : (^$signed((wire49 ?
                  wire50 : (8'ha3))))));
          if (($unsigned($signed((|(reg51 ^ wire48)))) ?
              (^reg51[(3'h5):(2'h3)]) : $unsigned((8'h9c))))
            begin
              reg52 <= wire48[(1'h0):(1'h0)];
              reg53 <= (~^$signed(wire48[(1'h1):(1'h1)]));
              reg54 <= $unsigned(reg51[(2'h2):(2'h2)]);
            end
          else
            begin
              reg52 <= (reg52 ?
                  ((-(wire49 ?
                      (reg52 <= reg52) : (+wire49))) >>> (~&$unsigned($unsigned(wire48)))) : reg51[(1'h1):(1'h1)]);
              reg53 <= reg51[(1'h1):(1'h0)];
              reg54 <= reg54;
            end
          reg55 <= reg52[(1'h0):(1'h0)];
          reg56 <= wire47;
          reg57 <= (|reg53[(4'h8):(1'h0)]);
        end
      else
        begin
          reg51 <= $unsigned($signed((reg54 ?
              ((reg56 ? wire50 : (8'ha8)) << (wire46 * (7'h42))) : ({reg57,
                  reg55} || ((7'h42) || wire48)))));
          if ($signed($signed({($signed(reg57) ? wire49 : $signed(wire50)),
              ($unsigned((8'hb2)) <<< reg54[(4'h8):(1'h0)])})))
            begin
              reg52 <= ({(reg51 ?
                      $signed((wire49 ?
                          reg55 : wire50)) : $unsigned($unsigned(reg53))),
                  {(~^$signed(wire48)),
                      wire50[(4'h8):(1'h0)]}} >> {((~|$signed(wire48)) + (+(wire49 >= reg52))),
                  reg55[(3'h5):(2'h3)]});
              reg53 <= (^(&reg56));
              reg54 <= ((7'h40) ~^ (^(reg57 ?
                  reg51[(2'h3):(1'h1)] : {$signed(reg51),
                      (wire49 ? wire47 : (8'hb7))})));
              reg55 <= $unsigned($signed($unsigned(((reg55 < wire49) && wire48))));
            end
          else
            begin
              reg52 <= reg53[(3'h6):(2'h2)];
              reg53 <= (^~(8'hb3));
              reg54 <= ({reg55[(3'h5):(3'h4)]} ?
                  ((((reg57 > reg54) ^~ reg51[(3'h5):(3'h5)]) | ($signed((8'hae)) | reg54)) << $unsigned({(wire50 <<< reg57)})) : reg56[(2'h3):(1'h0)]);
            end
          reg56 <= {($unsigned({(7'h44),
                  (reg57 & reg53)}) || $unsigned($unsigned($unsigned(wire48)))),
              reg51[(2'h3):(2'h3)]};
        end
      reg58 <= reg57;
      reg59 <= {wire48[(3'h4):(1'h0)], wire46};
      reg60 <= (~{({$signed(wire48)} == (-{(8'hb8)})), wire50});
      if (((8'ha4) >> (reg52 == $unsigned($signed((+wire50))))))
        begin
          reg61 <= (^~wire49);
          if (reg61)
            begin
              reg62 <= (reg56 >= $unsigned(wire50));
            end
          else
            begin
              reg62 <= (~|reg56[(1'h1):(1'h0)]);
              reg63 <= (({$unsigned($signed((8'hb3)))} ?
                  (($signed(reg58) ? $unsigned(reg61) : $signed(reg59)) ?
                      $unsigned((reg56 ? (8'hbc) : wire46)) : (-{wire47,
                          wire48})) : $unsigned((|(reg54 > reg56)))) || ((reg56[(2'h2):(2'h2)] ?
                      ($signed(reg54) ?
                          (~^reg52) : reg62) : reg55[(2'h3):(1'h1)]) ?
                  (~&wire47[(4'hc):(1'h1)]) : (^$signed((~&(8'h9d))))));
              reg64 <= (((^~((reg57 ? reg63 : reg53) ?
                  {reg61,
                      reg51} : (wire48 ~^ reg56))) >> (-($unsigned(reg58) <= {reg53}))) ~^ reg59);
              reg65 <= (((reg55 & (reg64[(3'h7):(3'h5)] == $unsigned(reg58))) <= (~&{wire49,
                  reg56})) < reg61);
            end
          reg66 <= $signed(reg59);
          if ($unsigned($unsigned($signed((8'hb5)))))
            begin
              reg67 <= (^~(reg59 ?
                  reg61[(4'he):(2'h2)] : reg64[(3'h5):(1'h0)]));
              reg68 <= reg63[(2'h3):(1'h1)];
              reg69 <= $unsigned(($signed((~^wire49[(5'h10):(1'h1)])) ^ ($signed((wire49 ?
                  reg54 : (8'hab))) >>> wire48)));
              reg70 <= (wire50[(4'h8):(1'h1)] ?
                  ($unsigned($unsigned((-reg55))) && (7'h40)) : (8'ha9));
            end
          else
            begin
              reg67 <= (-reg51[(1'h0):(1'h0)]);
              reg68 <= ($unsigned($unsigned($signed($signed(reg69)))) ?
                  ((~reg51) + (8'ha8)) : $signed($signed($signed((~reg58)))));
              reg69 <= (~reg58);
              reg70 <= ((&(reg65[(1'h0):(1'h0)] ?
                      ((reg69 >>> reg69) ?
                          {reg65,
                              reg53} : $unsigned((8'haf))) : ($signed(wire49) && wire48))) ?
                  (~&(~|(~reg58))) : ($unsigned((^reg51[(2'h3):(1'h1)])) == reg63[(2'h3):(1'h1)]));
            end
          reg71 <= ({$unsigned((reg51[(2'h2):(2'h2)] << (^~wire50)))} << (!(^(~wire47))));
        end
      else
        begin
          reg61 <= (reg60 ?
              ({((wire46 < reg56) ?
                          (reg53 ? reg70 : reg60) : reg63[(1'h0):(1'h0)]),
                      (8'haf)} ?
                  (!(-(^~reg56))) : $unsigned((!$unsigned(reg62)))) : $signed({reg67[(3'h6):(2'h2)]}));
        end
    end
  assign wire72 = $signed($unsigned(wire49[(4'hf):(2'h3)]));
  assign wire73 = reg58[(1'h0):(1'h0)];
  assign wire74 = reg54;
  assign wire75 = $unsigned(($signed(((reg51 ?
                      (8'haf) : reg69) >= (8'hb9))) >= $signed(wire49)));
  assign wire76 = reg55;
  module77 #() modinst94 (.wire82(wire75), .wire81(reg65), .wire78(reg61), .clk(clk), .wire79(wire48), .y(wire93), .wire80(reg69));
  assign wire95 = (wire46 >>> reg66);
endmodule

module module4  (y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire9;
  input wire [(4'h8):(1'h0)] wire8;
  input wire [(5'h10):(1'h0)] wire7;
  input wire signed [(4'he):(1'h0)] wire6;
  input wire [(4'hf):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire38;
  wire signed [(2'h3):(1'h0)] wire37;
  wire [(5'h13):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire33;
  wire [(3'h7):(1'h0)] wire10;
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  assign y = {wire38, wire37, wire36, wire33, wire10, reg35, (1'h0)};
  assign wire10 = ($signed((8'hb9)) ? (+(!wire7[(1'h0):(1'h0)])) : wire5);
  module11 #() modinst34 (.wire15(wire5), .wire13(wire9), .clk(clk), .wire14(wire10), .wire12(wire7), .y(wire33));
  always
    @(posedge clk) begin
      reg35 <= (wire10 << wire10[(2'h2):(1'h1)]);
    end
  assign wire36 = ($signed($unsigned($signed((wire9 ?
                      wire7 : wire5)))) >> (($signed((-wire6)) ?
                          wire6 : $signed((wire10 == reg35))) ?
                      $unsigned($signed({wire33})) : wire10));
  assign wire37 = $unsigned(((+{((8'ha5) ? wire10 : wire7),
                          wire33[(3'h6):(3'h5)]}) ?
                      wire9 : wire7[(1'h1):(1'h1)]));
  assign wire38 = wire36;
endmodule

module module11
#(parameter param31 = (^~((-(((8'h9d) & (8'had)) << {(8'hb0), (8'h9f)})) ? (8'hbc) : {(((8'h9e) ? (8'ha4) : (8'hb1)) ? (&(8'ha9)) : ((8'ha0) ? (8'hb6) : (8'hb7))), (((8'hb1) | (7'h44)) ? ((7'h40) | (8'hb5)) : (8'hbc))})), 
parameter param32 = ((|(~(~|(~|param31)))) ? ((((param31 ? param31 : param31) ? (&(8'ha6)) : (param31 ? (8'hbb) : param31)) > (+(~param31))) ? param31 : ((param31 == (param31 >= param31)) << (param31 ^ param31))) : ((^~param31) ? (param31 ? (|(param31 ~^ param31)) : param31) : (param31 > ((param31 ? param31 : param31) ? (param31 ? param31 : param31) : param31)))))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h89):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire15;
  input wire [(3'h7):(1'h0)] wire14;
  input wire signed [(4'hb):(1'h0)] wire13;
  input wire signed [(5'h10):(1'h0)] wire12;
  wire signed [(4'hc):(1'h0)] wire30;
  wire [(5'h14):(1'h0)] wire29;
  wire signed [(4'h8):(1'h0)] wire28;
  wire [(2'h3):(1'h0)] wire24;
  wire signed [(4'h8):(1'h0)] wire23;
  wire signed [(4'hd):(1'h0)] wire22;
  wire signed [(3'h5):(1'h0)] wire21;
  wire [(4'ha):(1'h0)] wire20;
  wire [(4'hc):(1'h0)] wire19;
  wire [(4'h9):(1'h0)] wire18;
  wire [(2'h2):(1'h0)] wire17;
  wire [(3'h7):(1'h0)] wire16;
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire16 = {($signed(wire13) ?
                          wire13 : (((!wire15) >> $signed((8'h9d))) ?
                              {(&wire13), (~wire14)} : ((wire14 ?
                                      wire13 : wire12) ?
                                  {wire14, wire15} : (^~(8'hb6))))),
                      wire15[(1'h0):(1'h0)]};
  assign wire17 = (&wire12[(4'hb):(3'h7)]);
  assign wire18 = wire17;
  assign wire19 = wire14[(3'h6):(3'h5)];
  assign wire20 = wire12[(4'hc):(2'h3)];
  assign wire21 = ($signed(($unsigned((wire18 ? wire17 : wire18)) ?
                      $unsigned($unsigned(wire14)) : wire17[(2'h2):(1'h1)])) - wire16[(2'h2):(1'h1)]);
  assign wire22 = $unsigned(wire12[(3'h5):(3'h5)]);
  assign wire23 = wire12[(3'h7):(2'h3)];
  assign wire24 = wire16;
  always
    @(posedge clk) begin
      reg25 <= wire21;
      reg26 <= $unsigned(wire19);
      reg27 <= (!$signed(wire14));
    end
  assign wire28 = $signed($unsigned(($signed((8'ha9)) + ($unsigned(wire21) ?
                      (reg25 >> (8'ha0)) : (-wire20)))));
  assign wire29 = (8'ha7);
  assign wire30 = (((^~$signed(((8'hb4) > wire12))) * (~|(+wire14[(3'h5):(3'h4)]))) ?
                      ((wire12 >> {(wire18 ? wire18 : wire19),
                              (reg26 == wire23)}) ?
                          (($signed((8'hb9)) ?
                              $signed(wire21) : $unsigned(wire28)) - ($unsigned(reg25) ?
                              wire16[(3'h6):(1'h0)] : (wire28 <<< wire12))) : wire24[(1'h0):(1'h0)]) : (~|wire29[(3'h7):(3'h6)]));
endmodule

module module77  (y, clk, wire82, wire81, wire80, wire79, wire78);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire82;
  input wire [(5'h12):(1'h0)] wire81;
  input wire [(5'h13):(1'h0)] wire80;
  input wire signed [(5'h12):(1'h0)] wire79;
  input wire [(5'h14):(1'h0)] wire78;
  wire [(2'h3):(1'h0)] wire92;
  wire [(4'hc):(1'h0)] wire91;
  wire signed [(3'h7):(1'h0)] wire88;
  wire signed [(4'ha):(1'h0)] wire87;
  wire signed [(3'h4):(1'h0)] wire86;
  wire signed [(5'h15):(1'h0)] wire85;
  wire [(4'h9):(1'h0)] wire84;
  wire [(4'ha):(1'h0)] wire83;
  reg [(3'h7):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg89 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 reg90,
                 reg89,
                 (1'h0)};
  assign wire83 = wire82;
  assign wire84 = $unsigned(wire79);
  assign wire85 = {(wire80[(4'h8):(3'h7)] ?
                          wire82 : (|$unsigned(wire83[(4'ha):(3'h5)])))};
  assign wire86 = $unsigned($signed(wire82[(2'h2):(1'h0)]));
  assign wire87 = wire82;
  assign wire88 = $unsigned($unsigned(((!wire87[(4'h9):(2'h2)]) + $signed((wire81 >= wire81)))));
  always
    @(posedge clk) begin
      reg89 <= {wire85};
      reg90 <= $unsigned(wire79);
    end
  assign wire91 = ($unsigned(((~&wire80[(4'hc):(2'h3)]) - {$unsigned((8'hbf)),
                      $signed((8'ha1))})) >= (|wire82));
  assign wire92 = $unsigned((~({$signed(wire83)} ?
                      {(wire85 ? wire81 : wire84)} : wire86)));
endmodule

module module217
#(parameter param232 = ({((((8'ha9) << (8'hb0)) ? ((8'h9e) ? (8'ha7) : (8'hbc)) : (-(8'ha9))) ~^ ({(8'hb5), (8'ha1)} <<< ((8'hbe) == (8'hb7))))} ? (8'hbb) : (((((8'hb6) || (8'hbf)) ? ((8'hb8) >>> (8'ha8)) : {(8'ha7), (8'h9f)}) ? ((+(8'h9f)) <<< (~|(8'hbc))) : (^~((8'hbe) + (8'had)))) ? ((((8'ha9) ~^ (8'hb0)) ? ((8'h9c) ? (8'hba) : (8'hac)) : ((7'h41) ? (8'ha4) : (8'had))) ? ((&(8'ha3)) ? (~|(8'hb1)) : {(8'hb8)}) : (+((8'hba) >>> (8'haa)))) : ((((7'h42) - (8'hbe)) + (^(8'hb3))) ? ({(8'hb1)} < ((8'h9d) ? (8'hb4) : (8'hb2))) : (!(!(8'hbf)))))))
(y, clk, wire222, wire221, wire220, wire219, wire218);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire222;
  input wire [(5'h10):(1'h0)] wire221;
  input wire [(5'h14):(1'h0)] wire220;
  input wire [(5'h10):(1'h0)] wire219;
  input wire signed [(4'hc):(1'h0)] wire218;
  wire [(5'h13):(1'h0)] wire231;
  wire signed [(5'h15):(1'h0)] wire230;
  wire signed [(3'h6):(1'h0)] wire229;
  wire [(5'h15):(1'h0)] wire228;
  wire [(4'h9):(1'h0)] wire225;
  wire [(4'he):(1'h0)] wire224;
  wire signed [(3'h5):(1'h0)] wire223;
  reg [(5'h11):(1'h0)] reg227 = (1'h0);
  reg [(5'h15):(1'h0)] reg226 = (1'h0);
  assign y = {wire231,
                 wire230,
                 wire229,
                 wire228,
                 wire225,
                 wire224,
                 wire223,
                 reg227,
                 reg226,
                 (1'h0)};
  assign wire223 = wire219;
  assign wire224 = {$signed({$signed($signed(wire222)),
                           $unsigned($unsigned((8'hb4)))}),
                       $unsigned(wire223[(3'h4):(2'h2)])};
  assign wire225 = $unsigned((wire224 + ((wire221[(4'hf):(4'hc)] ?
                           $signed(wire220) : ((8'ha6) * wire221)) ?
                       wire218 : $signed(wire219[(4'ha):(1'h1)]))));
  always
    @(posedge clk) begin
      reg226 <= wire219;
      reg227 <= (-{(8'haa),
          $signed((wire224 ?
              $unsigned((8'hab)) : (reg226 ? wire219 : wire218)))});
    end
  assign wire228 = $signed($unsigned((8'hb4)));
  assign wire229 = {{wire224},
                       $signed((($unsigned(wire224) <<< (wire220 & wire223)) || $unsigned($signed(wire221))))};
  assign wire230 = $signed(wire224);
  assign wire231 = {wire230[(4'h8):(3'h6)]};
endmodule

module module189
#(parameter param199 = (~|(((((8'hb1) ? (8'hb0) : (8'hba)) <= {(8'ha6), (8'ha9)}) ? (-((8'hbb) ? (8'hb6) : (8'hbc))) : (((7'h40) ? (8'ha5) : (8'ha1)) ? ((8'hbc) || (8'hac)) : ((8'ha9) ? (8'hb7) : (8'hb2)))) ? (~^(((8'hb5) ? (8'hac) : (8'hb6)) <<< (~|(8'ha7)))) : {(|(!(8'hb3)))})))
(y, clk, wire194, wire193, wire192, wire191, wire190);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire194;
  input wire [(5'h14):(1'h0)] wire193;
  input wire [(4'hd):(1'h0)] wire192;
  input wire [(4'hc):(1'h0)] wire191;
  input wire [(2'h3):(1'h0)] wire190;
  wire [(3'h7):(1'h0)] wire198;
  wire [(4'ha):(1'h0)] wire197;
  wire signed [(5'h13):(1'h0)] wire196;
  wire [(5'h15):(1'h0)] wire195;
  assign y = {wire198, wire197, wire196, wire195, (1'h0)};
  assign wire195 = (!(^~($unsigned((wire192 <= wire191)) < ((7'h40) ?
                       (~^wire194) : (wire193 ^~ wire194)))));
  assign wire196 = ((wire195 ? (8'hae) : (~^wire191[(1'h1):(1'h0)])) ?
                       wire190 : {(wire190[(1'h1):(1'h0)] > $unsigned($unsigned(wire193)))});
  assign wire197 = {$signed(((wire195[(4'hb):(4'h8)] ?
                               wire196 : $unsigned(wire193)) ?
                           wire196[(4'ha):(1'h1)] : ($unsigned(wire190) ?
                               wire192[(3'h7):(3'h5)] : wire196))),
                       $unsigned($unsigned(wire193[(4'he):(3'h6)]))};
  assign wire198 = wire196;
endmodule

module module149
#(parameter param182 = (&((((~(8'hb7)) <= ((8'hb6) ? (8'h9c) : (8'hab))) ? (8'ha2) : (((8'ha9) ? (8'hae) : (8'hb7)) && {(8'hab), (8'hab)})) ? (({(8'h9d)} ^~ ((8'hba) ? (7'h40) : (8'h9c))) ? {((8'hbe) >= (8'ha9)), {(8'ha9), (8'haf)}} : (((8'haf) ? (8'hb4) : (8'ha8)) ? ((8'h9c) ? (8'hb4) : (8'haf)) : {(8'hb5)})) : (|(!(^~(8'ha8)))))), 
parameter param183 = param182)
(y, clk, wire154, wire153, wire152, wire151, wire150);
  output wire [(32'h130):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire154;
  input wire signed [(5'h13):(1'h0)] wire153;
  input wire signed [(3'h5):(1'h0)] wire152;
  input wire signed [(5'h14):(1'h0)] wire151;
  input wire [(2'h2):(1'h0)] wire150;
  wire signed [(2'h3):(1'h0)] wire181;
  wire signed [(3'h6):(1'h0)] wire180;
  wire [(3'h6):(1'h0)] wire179;
  wire [(5'h13):(1'h0)] wire176;
  wire [(3'h7):(1'h0)] wire175;
  wire signed [(5'h10):(1'h0)] wire174;
  wire signed [(4'h8):(1'h0)] wire173;
  wire signed [(5'h11):(1'h0)] wire162;
  wire signed [(5'h13):(1'h0)] wire161;
  wire [(2'h3):(1'h0)] wire160;
  wire [(5'h13):(1'h0)] wire159;
  wire signed [(4'hf):(1'h0)] wire158;
  wire signed [(4'hb):(1'h0)] wire157;
  wire signed [(4'hc):(1'h0)] wire156;
  wire [(4'he):(1'h0)] wire155;
  reg [(2'h2):(1'h0)] reg178 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg172 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg171 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg169 = (1'h0);
  reg [(5'h10):(1'h0)] reg168 = (1'h0);
  reg [(3'h7):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg166 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg165 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg164 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg163 = (1'h0);
  assign y = {wire181,
                 wire180,
                 wire179,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 reg178,
                 reg177,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 (1'h0)};
  assign wire155 = $signed((8'hbb));
  assign wire156 = $signed((wire153 ?
                       ($unsigned($signed(wire150)) == (7'h43)) : $signed({(wire154 ?
                               wire150 : wire150)})));
  assign wire157 = (|(^(({wire156} ? (~&(8'hbe)) : wire152[(1'h1):(1'h0)]) ?
                       wire156 : ((wire151 - wire155) ?
                           $signed(wire155) : (-wire153)))));
  assign wire158 = (wire155[(1'h1):(1'h1)] ?
                       {(^$unsigned($unsigned(wire151)))} : ((8'hb4) || $unsigned(wire150)));
  assign wire159 = wire152[(2'h3):(1'h1)];
  assign wire160 = {(+(((wire153 ^~ wire150) ?
                               $signed(wire156) : ((7'h44) | wire159)) ?
                           wire151 : $signed({wire156}))),
                       ({($unsigned(wire158) || (^wire152))} ~^ wire153)};
  assign wire161 = ($unsigned((($signed(wire160) + (wire153 >= wire154)) ?
                       ($unsigned(wire156) ?
                           {wire160,
                               wire150} : $signed(wire151)) : wire152[(3'h5):(3'h5)])) >>> (wire150 && $signed(((wire156 ~^ wire155) ^ wire159[(3'h6):(1'h1)]))));
  assign wire162 = wire159;
  always
    @(posedge clk) begin
      if ((^$unsigned((!wire154))))
        begin
          if ($signed($unsigned(wire152)))
            begin
              reg163 <= {wire154[(1'h1):(1'h0)],
                  $signed(({(wire154 ~^ wire152),
                      (wire153 ?
                          wire152 : wire156)} + $unsigned($signed(wire159))))};
              reg164 <= wire154[(1'h0):(1'h0)];
            end
          else
            begin
              reg163 <= {$unsigned((7'h44)), $signed(wire153[(4'he):(3'h7)])};
              reg164 <= $unsigned(wire154[(2'h2):(2'h2)]);
              reg165 <= ((-wire161[(5'h10):(3'h5)]) ^ $signed($signed((-$unsigned(wire156)))));
              reg166 <= wire160[(2'h3):(1'h1)];
              reg167 <= wire158[(2'h3):(2'h3)];
            end
          reg168 <= wire152[(2'h3):(2'h2)];
          reg169 <= $signed((&$signed($unsigned((-(8'hb8))))));
          if ((((wire153[(3'h4):(2'h3)] - $unsigned((+(8'had)))) | (wire159 + reg167[(3'h4):(2'h2)])) ^ wire161[(5'h10):(2'h3)]))
            begin
              reg170 <= wire162;
            end
          else
            begin
              reg170 <= (wire152[(3'h5):(3'h4)] >= wire159[(4'h8):(1'h0)]);
              reg171 <= wire150[(1'h1):(1'h0)];
            end
          reg172 <= wire154;
        end
      else
        begin
          if ({$unsigned(reg168[(4'hb):(3'h6)])})
            begin
              reg163 <= $unsigned(wire151[(4'h8):(3'h6)]);
            end
          else
            begin
              reg163 <= (~$signed((((reg171 ? wire161 : reg170) ?
                  $unsigned((8'haf)) : (!reg170)) <<< (~&reg164[(3'h6):(3'h6)]))));
              reg164 <= (~&(~&($signed((8'hb8)) >= $signed((+(8'hae))))));
            end
          reg165 <= ($signed((~^$signed(reg167[(3'h6):(2'h2)]))) ?
              {$signed((((8'ha7) & reg163) >= (-wire153)))} : (~&reg166));
          reg166 <= (wire156[(3'h4):(3'h4)] ?
              (+reg172) : $unsigned($signed((-$unsigned(wire160)))));
          reg167 <= wire154[(1'h0):(1'h0)];
        end
    end
  assign wire173 = wire159;
  assign wire174 = (8'hb9);
  assign wire175 = $unsigned(($signed(wire150) - ({reg170[(1'h0):(1'h0)]} ?
                       ($unsigned(reg172) <<< $unsigned((8'ha3))) : ($signed(wire153) * wire154[(1'h1):(1'h1)]))));
  assign wire176 = ((((~^(wire150 ?
                           wire150 : wire154)) ^~ ($signed(wire159) & (~&(8'haa)))) ?
                       reg168[(4'he):(4'hc)] : (wire174 ?
                           (!wire173[(3'h7):(3'h7)]) : ((reg172 ?
                               wire159 : wire150) != wire157[(3'h7):(3'h5)]))) ^ $unsigned(({wire150[(2'h2):(1'h1)]} || $unsigned((reg164 ^ (8'hb1))))));
  always
    @(posedge clk) begin
      reg177 <= ((((wire161[(3'h5):(1'h1)] ?
              wire175 : (reg168 ? wire150 : reg170)) ^~ ((-wire155) ?
              $unsigned(wire153) : $signed(reg163))) ?
          (reg165[(3'h4):(3'h4)] ?
              (|reg164) : wire160) : wire176[(5'h12):(4'he)]) != (&$signed(reg164)));
    end
  always
    @(posedge clk) begin
      reg178 <= (+(((8'hae) >= reg177[(3'h6):(3'h5)]) ?
          (-$signed(wire159)) : (wire155[(1'h0):(1'h0)] != (&((8'h9d) | wire152)))));
    end
  assign wire179 = (8'hbb);
  assign wire180 = $signed((~|({reg172[(2'h3):(1'h1)]} + {((8'hb8) ?
                           wire174 : reg165),
                       $unsigned((8'hb5))})));
  assign wire181 = $unsigned($unsigned(reg171[(3'h4):(1'h0)]));
endmodule

module module106  (y, clk, wire110, wire109, wire108, wire107);
  output wire [(32'h178):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire110;
  input wire [(5'h13):(1'h0)] wire109;
  input wire [(4'h8):(1'h0)] wire108;
  input wire [(5'h11):(1'h0)] wire107;
  wire signed [(4'hc):(1'h0)] wire146;
  wire [(2'h2):(1'h0)] wire145;
  wire signed [(5'h15):(1'h0)] wire144;
  wire [(3'h6):(1'h0)] wire143;
  wire signed [(4'hd):(1'h0)] wire142;
  wire signed [(3'h6):(1'h0)] wire141;
  wire signed [(4'hc):(1'h0)] wire140;
  wire signed [(3'h5):(1'h0)] wire139;
  wire signed [(4'ha):(1'h0)] wire138;
  wire [(5'h13):(1'h0)] wire136;
  wire signed [(5'h12):(1'h0)] wire135;
  wire signed [(4'he):(1'h0)] wire134;
  wire signed [(2'h3):(1'h0)] wire133;
  wire [(2'h2):(1'h0)] wire128;
  wire signed [(4'h9):(1'h0)] wire112;
  wire [(4'hb):(1'h0)] wire111;
  reg [(4'hd):(1'h0)] reg137 = (1'h0);
  reg [(4'h8):(1'h0)] reg132 = (1'h0);
  reg signed [(4'he):(1'h0)] reg131 = (1'h0);
  reg [(4'hc):(1'h0)] reg130 = (1'h0);
  reg [(5'h15):(1'h0)] reg129 = (1'h0);
  reg [(2'h3):(1'h0)] reg127 = (1'h0);
  reg [(5'h12):(1'h0)] reg126 = (1'h0);
  reg [(3'h5):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg124 = (1'h0);
  reg [(2'h2):(1'h0)] reg123 = (1'h0);
  reg [(4'hf):(1'h0)] reg122 = (1'h0);
  reg [(4'h9):(1'h0)] reg121 = (1'h0);
  reg [(2'h3):(1'h0)] reg120 = (1'h0);
  reg [(2'h2):(1'h0)] reg119 = (1'h0);
  reg [(2'h2):(1'h0)] reg118 = (1'h0);
  reg [(4'he):(1'h0)] reg117 = (1'h0);
  reg [(4'hd):(1'h0)] reg116 = (1'h0);
  reg [(5'h15):(1'h0)] reg115 = (1'h0);
  reg [(3'h4):(1'h0)] reg114 = (1'h0);
  reg [(4'hd):(1'h0)] reg113 = (1'h0);
  assign y = {wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire128,
                 wire112,
                 wire111,
                 reg137,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 (1'h0)};
  assign wire111 = $unsigned((~^((wire109 << (-wire110)) ?
                       wire108 : $unsigned((wire110 ? wire109 : wire109)))));
  assign wire112 = ($signed(wire109[(4'hf):(3'h6)]) ?
                       $signed((wire111[(1'h1):(1'h1)] ?
                           wire109[(4'ha):(2'h3)] : ((wire109 ?
                               wire109 : wire111) * (~^wire111)))) : $unsigned($unsigned(wire111[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      if ($signed($signed({((wire111 ? wire109 : wire111) ?
              wire111 : (wire107 >>> wire108)),
          wire110[(1'h1):(1'h1)]})))
        begin
          reg113 <= $unsigned((wire109[(1'h1):(1'h0)] <= {((wire107 | wire109) < {wire111,
                  (8'hbc)}),
              wire110[(3'h4):(1'h0)]}));
        end
      else
        begin
          reg113 <= (~^$signed((wire107[(3'h4):(2'h3)] ?
              ((wire109 >> (8'ha2)) * wire108[(2'h3):(2'h2)]) : $signed($unsigned((8'hb0))))));
          reg114 <= $unsigned(wire108[(3'h4):(2'h3)]);
          reg115 <= ((reg113 << (^$unsigned((-reg113)))) == wire110);
        end
      reg116 <= (8'hb5);
      if ($unsigned(wire107))
        begin
          if (wire110[(2'h3):(1'h1)])
            begin
              reg117 <= (~|wire112);
              reg118 <= $signed($unsigned({reg117[(4'hb):(3'h6)]}));
              reg119 <= wire109[(4'ha):(3'h6)];
              reg120 <= (~^(wire109[(5'h13):(4'he)] ?
                  $unsigned(reg119) : $unsigned((8'hae))));
              reg121 <= {$signed($unsigned(((!reg113) >> wire112)))};
            end
          else
            begin
              reg117 <= reg114;
              reg118 <= (($signed(($unsigned(reg115) ?
                      (reg121 ? reg118 : reg118) : (wire109 ^ (8'hae)))) ?
                  $signed($unsigned(reg116[(1'h0):(1'h0)])) : wire107) && ({wire110[(1'h1):(1'h0)],
                  (8'ha5)} << $signed(((-reg116) ?
                  (wire109 + (8'ha8)) : $unsigned(reg117)))));
              reg119 <= (^~(-(((&reg117) ?
                      $signed(reg121) : (reg121 ? reg116 : wire107)) ?
                  ((~&(8'ha8)) ? (8'h9f) : reg121[(3'h5):(3'h5)]) : reg117)));
              reg120 <= reg121;
              reg121 <= reg117;
            end
          if ($unsigned(($unsigned((reg113[(2'h3):(1'h1)] ^~ wire109)) > (-((8'hbd) ?
              $unsigned(wire111) : $unsigned(reg114))))))
            begin
              reg122 <= $unsigned($unsigned({(reg120[(1'h1):(1'h1)] ?
                      (reg121 ? reg119 : wire110) : $unsigned(wire111))}));
              reg123 <= ((reg116[(4'hc):(2'h2)] ?
                      $signed($unsigned($unsigned(reg121))) : reg119) ?
                  ({((^~reg118) & reg121)} != $signed({(wire107 && (8'h9c)),
                      (reg121 == reg118)})) : $signed($unsigned((~&reg113[(3'h5):(1'h1)]))));
              reg124 <= $signed(reg115);
            end
          else
            begin
              reg122 <= {reg124[(3'h7):(2'h3)], wire108};
            end
          reg125 <= ((|$unsigned(((reg113 ? reg116 : (8'h9d)) || wire110))) ?
              reg121[(2'h3):(2'h3)] : $signed((+wire109)));
          reg126 <= (+reg118);
          reg127 <= $unsigned($signed($unsigned(wire110)));
        end
      else
        begin
          reg117 <= ({$signed((|reg123)), wire112[(1'h1):(1'h0)]} ?
              (|$unsigned($unsigned(reg117[(3'h7):(1'h1)]))) : (8'ha7));
          reg118 <= $unsigned(wire107[(4'h9):(4'h9)]);
        end
    end
  assign wire128 = (&(&reg124[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg129 <= {wire107, (!wire110)};
      reg130 <= $unsigned($signed(reg118));
      reg131 <= ((reg120[(1'h1):(1'h1)] && (wire108 ?
              $signed((reg113 ?
                  reg123 : (8'ha5))) : $signed(reg122[(4'hc):(1'h0)]))) ?
          (!{(~&wire112[(3'h5):(1'h0)]),
              (~^(8'ha5))}) : (!($unsigned((^reg127)) ?
              reg125[(2'h2):(1'h1)] : reg126)));
      reg132 <= reg115[(1'h1):(1'h0)];
    end
  assign wire133 = (^~($signed($signed((~wire111))) ?
                       reg117[(4'ha):(4'ha)] : {($signed(wire128) & (wire110 ?
                               wire128 : reg124))}));
  assign wire134 = (8'hae);
  assign wire135 = $unsigned(wire134);
  assign wire136 = reg131[(4'h8):(3'h6)];
  always
    @(posedge clk) begin
      reg137 <= wire134;
    end
  assign wire138 = {(reg116[(3'h4):(1'h0)] ?
                           $unsigned((^~reg131[(4'ha):(4'h9)])) : $signed(((^~reg130) ?
                               (reg119 ~^ reg121) : wire128)))};
  assign wire139 = wire108;
  assign wire140 = (((($signed((8'hb9)) | (~^wire136)) & ((reg124 | reg121) ?
                       wire139 : (wire135 ?
                           reg129 : wire109))) * reg130) < $signed({reg130}));
  assign wire141 = (reg126 != ((wire112 <= ($unsigned(wire139) ?
                           (reg114 + reg113) : (reg132 ? reg113 : reg115))) ?
                       reg117 : $signed(reg117)));
  assign wire142 = (~|{(8'had)});
  assign wire143 = (({(^~$unsigned(reg117))} ?
                       $unsigned((wire139[(1'h0):(1'h0)] && (wire107 ?
                           reg118 : reg131))) : wire133[(2'h2):(1'h0)]) + {$unsigned({(reg120 & (8'hab)),
                           (reg121 ? (7'h44) : reg117)})});
  assign wire144 = reg129[(1'h0):(1'h0)];
  assign wire145 = (-{($unsigned(reg114[(1'h0):(1'h0)]) ?
                           (^~$unsigned(reg118)) : $unsigned($unsigned(reg129))),
                       reg118[(2'h2):(1'h0)]});
  assign wire146 = $unsigned(wire133);
endmodule
