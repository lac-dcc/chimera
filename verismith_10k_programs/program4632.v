module top
#(parameter param267 = {{(({(8'hab)} ? ((8'h9e) != (8'hb3)) : (~(8'hb5))) == (((8'had) ? (8'hb8) : (8'ha4)) ^~ ((8'hba) << (8'hbe)))), (&{{(8'hb2), (7'h44)}})}})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h131):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire266;
  wire [(4'h9):(1'h0)] wire265;
  wire [(3'h7):(1'h0)] wire264;
  wire signed [(4'hc):(1'h0)] wire263;
  wire signed [(2'h2):(1'h0)] wire240;
  wire signed [(4'hb):(1'h0)] wire238;
  reg [(3'h7):(1'h0)] reg262 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg261 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg260 = (1'h0);
  reg [(5'h12):(1'h0)] reg259 = (1'h0);
  reg [(3'h5):(1'h0)] reg258 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg257 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg256 = (1'h0);
  reg [(5'h15):(1'h0)] reg255 = (1'h0);
  reg [(4'h9):(1'h0)] reg254 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg253 = (1'h0);
  reg [(4'hc):(1'h0)] reg252 = (1'h0);
  reg [(3'h6):(1'h0)] reg251 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg250 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg249 = (1'h0);
  reg [(5'h10):(1'h0)] reg248 = (1'h0);
  reg [(5'h10):(1'h0)] reg247 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg246 = (1'h0);
  reg [(5'h11):(1'h0)] reg245 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg244 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg243 = (1'h0);
  reg [(2'h3):(1'h0)] reg242 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg241 = (1'h0);
  assign y = {wire266,
                 wire265,
                 wire264,
                 wire263,
                 wire240,
                 wire238,
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
                 (1'h0)};
  module4 #() modinst239 (.clk(clk), .wire7(wire2), .wire8(wire0), .y(wire238), .wire6(wire1), .wire5(wire3), .wire9((8'h9f)));
  assign wire240 = (!(^~(wire0[(5'h10):(2'h3)] >>> $unsigned((~^wire238)))));
  always
    @(posedge clk) begin
      if ($unsigned({(8'hbf), wire240[(1'h0):(1'h0)]}))
        begin
          reg241 <= $signed((!wire3));
          if ((wire2[(3'h7):(2'h2)] ?
              (($unsigned((~(8'ha6))) ?
                  wire238[(2'h3):(2'h3)] : $unsigned((wire240 ?
                      (8'hb8) : reg241))) & $signed(wire2[(2'h3):(1'h1)])) : {$unsigned(((reg241 ?
                      wire3 : wire1) << (~^wire1))),
                  ($unsigned((reg241 * wire238)) ?
                      ({wire240, wire2} >= (wire3 << (8'hac))) : wire2)}))
            begin
              reg242 <= ({(reg241 ? (&(!wire1)) : {wire1})} << (!wire0));
            end
          else
            begin
              reg242 <= ($signed(wire238) ?
                  $signed(reg241) : {($unsigned(((8'hb7) | reg242)) << wire240)});
              reg243 <= (({reg241} ?
                  wire0 : $unsigned((wire3[(4'h8):(3'h4)] ^~ {reg242,
                      wire0}))) >>> reg242[(1'h1):(1'h0)]);
              reg244 <= wire1[(1'h0):(1'h0)];
              reg245 <= (^~$unsigned(reg241[(4'hd):(2'h2)]));
              reg246 <= wire240[(1'h1):(1'h0)];
            end
          reg247 <= (+({reg246[(2'h2):(2'h2)]} ?
              reg246 : $unsigned((~^$signed((8'ha1))))));
          reg248 <= (^$unsigned(reg247));
        end
      else
        begin
          if (wire2[(1'h0):(1'h0)])
            begin
              reg241 <= ({(8'hb6),
                      {$unsigned(wire2[(2'h2):(1'h0)]), (+(8'h9f))}} ?
                  wire2[(3'h4):(1'h1)] : {wire3[(3'h6):(3'h4)]});
              reg242 <= reg244[(1'h1):(1'h0)];
              reg243 <= wire0;
              reg244 <= $signed(reg241[(1'h1):(1'h1)]);
              reg245 <= ($unsigned((~|{(reg248 ? wire0 : wire1)})) ?
                  ($unsigned(wire240) ?
                      (wire2[(2'h2):(1'h1)] ?
                          ({wire2} ?
                              $signed(wire0) : {wire0,
                                  wire240}) : reg245) : $signed({(8'hb1),
                          (wire240 ?
                              wire238 : wire0)})) : (($signed((^reg243)) ?
                      (~|(reg247 ? wire238 : reg241)) : (reg242 ?
                          $signed(wire0) : (reg244 >> reg244))) + (-$unsigned(((8'h9f) ?
                      wire238 : wire1)))));
            end
          else
            begin
              reg241 <= ($signed(wire238) && $signed($unsigned($unsigned(reg244))));
              reg242 <= ($signed((~|reg242)) ?
                  $signed((!((reg247 ? (8'ha1) : wire238) ?
                      $signed((8'ha3)) : reg245))) : $signed($unsigned(reg244[(2'h2):(1'h0)])));
              reg243 <= ($signed((reg241[(3'h4):(3'h4)] ?
                  ((+reg247) ~^ (8'hac)) : $signed($signed((8'haa))))) ^ reg241[(4'hb):(3'h6)]);
            end
        end
      reg249 <= reg241[(5'h13):(4'hf)];
      if ((reg248 ^ ($unsigned(((wire3 ?
              (8'hbd) : reg242) | reg246[(1'h1):(1'h0)])) ?
          ((~^(~(8'hb4))) ? wire0 : wire2[(3'h4):(1'h0)]) : {{$signed(reg243)},
              $signed(reg246[(1'h1):(1'h1)])})))
        begin
          reg250 <= $signed(reg241);
          reg251 <= $unsigned(wire3);
          reg252 <= (+($signed($signed((reg242 ? wire1 : reg241))) <= wire240));
          reg253 <= reg252;
        end
      else
        begin
          reg250 <= (^(reg253[(4'h8):(1'h1)] ?
              {({wire1} * (reg246 <<< reg245))} : (((~&reg251) ?
                      (reg251 ? reg252 : reg251) : $unsigned(reg253)) ?
                  reg243[(1'h0):(1'h0)] : {(reg248 - reg248)})));
          if ({reg247[(4'h8):(1'h1)], wire238})
            begin
              reg251 <= reg244;
              reg252 <= (reg253 - ((|($unsigned(wire2) || {(8'hb3), wire238})) ?
                  (!($signed((8'hae)) ?
                      (reg252 ^~ (8'h9d)) : reg249[(4'hb):(4'h9)])) : (wire2 ?
                      ({reg252, wire1} >> {reg247,
                          (8'haf)}) : (reg241[(3'h7):(2'h3)] < (~|wire1)))));
              reg253 <= ({{($unsigned(reg250) ? reg253 : {wire240, reg244})},
                  {((reg248 - reg253) ?
                          (reg248 + reg251) : (reg251 >>> (8'ha6))),
                      (!(reg241 >> reg250))}} * (((-reg241) ?
                      wire1[(1'h0):(1'h0)] : reg241[(5'h10):(3'h4)]) ?
                  {reg241} : $signed(reg250[(3'h5):(2'h2)])));
              reg254 <= wire238[(4'ha):(4'h8)];
            end
          else
            begin
              reg251 <= $signed($unsigned({reg243[(3'h5):(2'h3)]}));
              reg252 <= (reg251 & (8'haf));
              reg253 <= reg254;
              reg254 <= (|reg244[(2'h2):(2'h2)]);
            end
          reg255 <= wire3[(1'h1):(1'h0)];
          if ($signed(reg254[(1'h0):(1'h0)]))
            begin
              reg256 <= (~^((~|(((8'ha0) ?
                      wire240 : reg244) ^~ $signed(reg255))) ?
                  (~^((reg246 ?
                      wire2 : reg251) < $unsigned(reg243))) : {(^~(wire240 ?
                          (8'hbc) : (7'h41)))}));
              reg257 <= {{$signed(((reg250 ? wire238 : reg252) >> reg248)),
                      (|(wire238 ? reg249 : wire1[(3'h7):(2'h3)]))}};
              reg258 <= $unsigned($unsigned($unsigned({wire238})));
              reg259 <= reg248;
              reg260 <= $unsigned({$unsigned(wire2[(2'h3):(2'h3)]),
                  {(!$signed((8'hbc))), wire240[(1'h0):(1'h0)]}});
            end
          else
            begin
              reg256 <= $unsigned(reg252[(2'h2):(2'h2)]);
              reg257 <= reg254;
              reg258 <= $unsigned({(-(^~(~^reg247)))});
              reg259 <= (reg259[(1'h1):(1'h1)] ^ reg246);
            end
        end
      reg261 <= (~&$unsigned({wire2}));
      reg262 <= $unsigned((((~|(^~wire240)) ?
              $signed(reg244) : $unsigned($signed((8'hbe)))) ?
          {$signed($signed(reg260)),
              $signed($unsigned(reg243))} : reg261[(4'hb):(4'ha)]));
    end
  assign wire263 = $signed($signed(wire1[(4'hc):(4'hb)]));
  assign wire264 = (^~reg253[(1'h0):(1'h0)]);
  assign wire265 = {$unsigned($unsigned(reg258))};
  assign wire266 = ((&(^~(^~((7'h41) ?
                       reg247 : reg254)))) + {wire265[(3'h7):(2'h3)]});
endmodule

module module4  (y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h12e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire5;
  input wire [(4'hc):(1'h0)] wire6;
  input wire [(4'h8):(1'h0)] wire7;
  input wire [(5'h11):(1'h0)] wire8;
  input wire [(4'ha):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire236;
  wire signed [(4'he):(1'h0)] wire235;
  wire [(4'hf):(1'h0)] wire233;
  wire [(5'h12):(1'h0)] wire168;
  wire signed [(4'h9):(1'h0)] wire83;
  wire [(4'ha):(1'h0)] wire82;
  wire signed [(5'h11):(1'h0)] wire81;
  wire [(5'h11):(1'h0)] wire10;
  wire signed [(3'h7):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire12;
  wire [(2'h3):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire16;
  wire signed [(2'h3):(1'h0)] wire46;
  wire signed [(5'h15):(1'h0)] wire48;
  wire [(5'h13):(1'h0)] wire74;
  reg signed [(4'hf):(1'h0)] reg237 = (1'h0);
  reg [(3'h6):(1'h0)] reg76 = (1'h0);
  reg [(5'h12):(1'h0)] reg77 = (1'h0);
  reg [(4'he):(1'h0)] reg78 = (1'h0);
  reg [(3'h5):(1'h0)] reg79 = (1'h0);
  reg [(4'he):(1'h0)] reg80 = (1'h0);
  assign y = {wire236,
                 wire235,
                 wire233,
                 wire168,
                 wire83,
                 wire82,
                 wire81,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire46,
                 wire48,
                 wire74,
                 reg237,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 (1'h0)};
  assign wire10 = ($signed((wire9 ? (~^(wire7 ? wire6 : wire8)) : wire5)) ?
                      ($signed(((!wire5) ?
                              $signed((8'ha0)) : (wire8 ? (7'h41) : wire9))) ?
                          $signed(($signed(wire8) || (wire6 ?
                              wire5 : wire8))) : wire8[(3'h4):(2'h3)]) : ((wire5 ~^ (wire9[(2'h2):(1'h0)] ?
                              (8'hb8) : wire5[(1'h1):(1'h0)])) ?
                          $signed(wire8) : $signed($unsigned((wire7 ~^ wire8)))));
  assign wire11 = wire7;
  assign wire12 = wire7;
  assign wire13 = $signed(($unsigned(((+wire5) < $unsigned(wire7))) ?
                      $unsigned($unsigned($signed(wire9))) : (~&wire11)));
  assign wire14 = $unsigned($signed(({((8'ha1) && wire13),
                          wire5[(1'h1):(1'h1)]} ?
                      wire8 : $signed((8'haf)))));
  assign wire15 = $signed((($signed(((8'haf) ~^ wire6)) ?
                      wire13 : ((-wire6) ?
                          $unsigned(wire5) : $signed(wire7))) >>> wire7));
  assign wire16 = $signed($signed((8'hae)));
  module17 #() modinst47 (wire46, clk, wire7, wire11, wire10, wire12);
  assign wire48 = wire14[(2'h3):(2'h2)];
  module49 #() modinst75 (wire74, clk, wire14, wire8, wire10, wire11, wire7);
  always
    @(posedge clk) begin
      reg76 <= ((wire6[(4'hc):(2'h2)] ?
          wire7[(1'h1):(1'h1)] : $unsigned($signed((wire16 ?
              wire74 : (8'hbd))))) <<< $unsigned((((wire16 ? wire12 : wire48) ?
              {(8'ha1), wire7} : ((8'hbb) ? wire9 : wire46)) ?
          wire15 : wire11[(3'h5):(2'h2)])));
      reg77 <= wire48;
      reg78 <= wire8[(4'hf):(4'hd)];
      reg79 <= ((&$unsigned($unsigned({(8'hb2),
          (8'hbb)}))) - (~&($signed($signed(reg77)) >= (wire7 ?
          (+wire15) : {wire6}))));
      reg80 <= (+$signed($signed((reg77 ? $signed(wire16) : (^wire46)))));
    end
  assign wire81 = (~^wire7[(2'h3):(2'h2)]);
  assign wire82 = $signed($signed(wire8));
  assign wire83 = {(+(((~|wire15) == (reg78 >= wire14)) >>> reg76))};
  module84 #() modinst169 (.wire85(wire10), .clk(clk), .y(wire168), .wire87(wire83), .wire88(wire8), .wire86(wire74));
  module170 #() modinst234 (wire233, clk, wire81, reg77, wire16, wire15, wire48);
  assign wire235 = ({$unsigned(($unsigned(reg79) && wire74[(5'h13):(4'h9)])),
                           wire8[(4'h9):(3'h5)]} ?
                       $signed({wire168}) : $signed(wire11));
  assign wire236 = ({wire12[(4'hc):(1'h1)]} << $signed($unsigned($unsigned(wire168[(4'he):(4'h9)]))));
  always
    @(posedge clk) begin
      reg237 <= ($unsigned((~|(reg79 ?
          (wire5 == wire82) : (!wire7)))) >= $unsigned((^~$signed((~(8'hb4))))));
    end
endmodule

module module170
#(parameter param232 = (((8'hb5) ~^ (+(((8'had) - (8'hae)) ? (~&(7'h41)) : (+(8'ha2))))) >> (({((7'h40) ? (8'hb9) : (8'ha5)), ((8'hb2) * (8'ha7))} ? {((8'hb9) <<< (8'hb8)), {(8'ha0), (8'hb1)}} : (8'h9c)) ? (&(^~((8'hbc) ? (8'hb3) : (8'hb0)))) : (((^~(8'hbb)) ? ((8'hae) ? (8'hbf) : (8'hae)) : (8'hbb)) >> (((8'h9c) < (7'h44)) ? (+(8'h9d)) : (^~(8'ha6)))))))
(y, clk, wire175, wire174, wire173, wire172, wire171);
  output wire [(32'h26e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire175;
  input wire [(4'hc):(1'h0)] wire174;
  input wire signed [(3'h4):(1'h0)] wire173;
  input wire signed [(5'h12):(1'h0)] wire172;
  input wire signed [(3'h6):(1'h0)] wire171;
  wire [(4'hc):(1'h0)] wire231;
  wire signed [(5'h14):(1'h0)] wire230;
  wire signed [(4'he):(1'h0)] wire229;
  wire [(2'h3):(1'h0)] wire225;
  wire signed [(3'h5):(1'h0)] wire224;
  wire signed [(3'h5):(1'h0)] wire223;
  wire [(2'h3):(1'h0)] wire222;
  wire signed [(3'h5):(1'h0)] wire211;
  wire [(4'he):(1'h0)] wire210;
  wire [(4'he):(1'h0)] wire209;
  wire signed [(4'hb):(1'h0)] wire208;
  wire [(5'h14):(1'h0)] wire196;
  wire signed [(5'h11):(1'h0)] wire195;
  wire [(4'hd):(1'h0)] wire194;
  wire signed [(2'h3):(1'h0)] wire176;
  reg signed [(5'h13):(1'h0)] reg228 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg227 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg226 = (1'h0);
  reg [(4'hd):(1'h0)] reg221 = (1'h0);
  reg [(4'he):(1'h0)] reg220 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg219 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg218 = (1'h0);
  reg signed [(4'he):(1'h0)] reg217 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg216 = (1'h0);
  reg [(5'h12):(1'h0)] reg215 = (1'h0);
  reg [(4'h8):(1'h0)] reg214 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg213 = (1'h0);
  reg [(4'hd):(1'h0)] reg212 = (1'h0);
  reg [(4'h8):(1'h0)] reg207 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg206 = (1'h0);
  reg [(5'h13):(1'h0)] reg205 = (1'h0);
  reg [(3'h4):(1'h0)] reg204 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg203 = (1'h0);
  reg [(5'h12):(1'h0)] reg202 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg201 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg200 = (1'h0);
  reg [(3'h5):(1'h0)] reg199 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg198 = (1'h0);
  reg [(5'h13):(1'h0)] reg197 = (1'h0);
  reg [(4'he):(1'h0)] reg193 = (1'h0);
  reg [(2'h3):(1'h0)] reg192 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg191 = (1'h0);
  reg [(3'h4):(1'h0)] reg190 = (1'h0);
  reg [(5'h11):(1'h0)] reg189 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg188 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg187 = (1'h0);
  reg [(2'h2):(1'h0)] reg186 = (1'h0);
  reg [(3'h7):(1'h0)] reg185 = (1'h0);
  reg [(5'h11):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg183 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg182 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg181 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg180 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg179 = (1'h0);
  reg [(4'hf):(1'h0)] reg178 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg177 = (1'h0);
  assign y = {wire231,
                 wire230,
                 wire229,
                 wire225,
                 wire224,
                 wire223,
                 wire222,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire196,
                 wire195,
                 wire194,
                 wire176,
                 reg228,
                 reg227,
                 reg226,
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
                 reg177,
                 (1'h0)};
  assign wire176 = wire173;
  always
    @(posedge clk) begin
      reg177 <= (8'ha4);
      if ($unsigned($unsigned($unsigned(wire174))))
        begin
          reg178 <= (((({wire175} ? $signed((8'haf)) : (~^wire171)) ?
                      $signed($unsigned(wire171)) : ((wire172 > wire171) ?
                          $signed(wire172) : $unsigned(wire175))) ?
                  $signed((^~$unsigned((7'h43)))) : wire171[(3'h6):(1'h0)]) ?
              wire175[(2'h2):(2'h2)] : wire172[(3'h5):(1'h0)]);
          reg179 <= reg177[(1'h0):(1'h0)];
          reg180 <= reg177[(3'h5):(1'h1)];
        end
      else
        begin
          if (({$signed((8'hb3)),
                  ((((8'hb9) ? (8'hba) : wire172) ?
                      $signed(reg177) : ((8'ha5) ?
                          wire174 : (8'hb1))) != $unsigned((^~wire172)))} ?
              $unsigned(((7'h44) * reg177[(2'h3):(2'h3)])) : ((~|$unsigned($unsigned(reg179))) || $signed(((wire172 >> reg177) ?
                  reg177 : (^~wire171))))))
            begin
              reg178 <= (8'h9e);
            end
          else
            begin
              reg178 <= ((&$unsigned(reg180)) != reg180[(3'h5):(3'h4)]);
              reg179 <= wire174;
              reg180 <= ($signed(wire173) ^~ (^(((+wire172) != $unsigned(reg177)) | $signed($signed(wire173)))));
              reg181 <= ((|$unsigned(((wire176 == wire173) ?
                      $unsigned(wire175) : (8'hb3)))) ?
                  {($unsigned($signed(wire173)) <<< wire171)} : {((8'haa) ^ (^(~&reg177)))});
              reg182 <= ($unsigned((~&(!(reg181 ? wire173 : (8'ha4))))) ?
                  ((reg177 >= {wire175,
                      $unsigned(wire175)}) >> $signed(((wire174 ?
                      wire174 : reg180) ~^ reg177[(1'h1):(1'h0)]))) : (($unsigned({wire175,
                          reg181}) ?
                      ((reg180 ?
                          (8'ha5) : reg180) <<< $unsigned(wire174)) : wire175[(3'h6):(3'h6)]) < (wire171[(3'h6):(2'h3)] ?
                      (((8'hbf) ? reg177 : (8'ha0)) ?
                          $signed((8'hb8)) : ((8'h9c) >= reg179)) : $signed({(8'hba),
                          reg181}))));
            end
          reg183 <= reg178;
          reg184 <= (reg177 ?
              wire175[(1'h0):(1'h0)] : (&({wire172} | $signed(wire171[(3'h6):(1'h1)]))));
        end
      reg185 <= (reg181[(1'h1):(1'h1)] ?
          ((|((reg184 ~^ (8'ha7)) ?
              reg182[(2'h2):(1'h1)] : {wire173})) > (&$unsigned({reg181}))) : $signed(({$signed(reg183),
              ((8'hbe) <<< wire175)} | wire174)));
      reg186 <= (8'hb2);
      reg187 <= (wire172[(4'hd):(4'hc)] ^~ ((-(~|$signed(reg179))) + (^~reg178[(2'h3):(1'h1)])));
    end
  always
    @(posedge clk) begin
      if (($signed(($unsigned((reg181 | reg185)) ?
              reg180[(3'h6):(2'h3)] : (8'hab))) ?
          (~&{$signed((reg181 & reg177)), $signed(reg177)}) : reg184))
        begin
          if ($signed((!(-reg178))))
            begin
              reg188 <= reg179;
              reg189 <= ((7'h41) ?
                  wire175 : (reg185[(3'h7):(3'h7)] ^~ $signed(wire171)));
            end
          else
            begin
              reg188 <= reg185[(1'h1):(1'h0)];
              reg189 <= reg177[(1'h1):(1'h1)];
            end
          reg190 <= reg188[(2'h3):(1'h1)];
          reg191 <= ({$signed(((reg177 ^ reg180) > {wire173, reg187})),
                  ($signed($unsigned((8'hb5))) - reg185)} ?
              (~^$unsigned((!(reg179 >> reg188)))) : reg181);
        end
      else
        begin
          reg188 <= wire171;
          reg189 <= ($unsigned(reg189[(1'h0):(1'h0)]) ?
              wire174 : $signed((reg185[(3'h5):(1'h0)] <= ((wire173 ?
                  (8'h9d) : wire173) + wire172))));
        end
      reg192 <= $signed((({(reg191 ? (8'ha1) : (8'ha4))} ?
              (reg181 <<< {(8'hb3)}) : (~|(reg185 ? reg185 : reg181))) ?
          (reg188 ?
              ({reg189,
                  wire176} * $unsigned(wire176)) : (reg190[(3'h4):(1'h1)] != (reg182 ?
                  reg188 : (8'ha1)))) : (|$unsigned((reg185 ?
              reg181 : wire175)))));
      reg193 <= $signed(reg187);
    end
  assign wire194 = ($unsigned($signed(reg187[(2'h2):(1'h1)])) ?
                       {(8'h9f)} : $signed((reg180 >> (wire171[(3'h4):(1'h0)] & (reg189 ?
                           reg188 : reg192)))));
  assign wire195 = $signed(($signed(reg189[(4'hc):(1'h0)]) ?
                       (reg179 ?
                           reg187[(1'h0):(1'h0)] : $unsigned(((8'ha5) >> (8'hb3)))) : $signed($unsigned((reg189 ?
                           reg192 : reg192)))));
  assign wire196 = reg191[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg197 <= (&wire171[(3'h6):(2'h3)]);
      reg198 <= reg187[(1'h0):(1'h0)];
      if (((!(((reg186 ? reg185 : reg181) >>> ((8'ha2) + (8'hb4))) ?
          ({reg198} ?
              $unsigned(wire175) : (^wire174)) : wire173[(1'h0):(1'h0)])) & wire175))
        begin
          reg199 <= wire194[(4'h9):(4'h9)];
        end
      else
        begin
          if (((!(~^(^(reg181 ? reg179 : wire173)))) ?
              {(reg193[(3'h7):(2'h3)] ~^ reg183)} : ($unsigned(wire174[(1'h1):(1'h0)]) != {(~&wire194),
                  {$unsigned(reg187)}})))
            begin
              reg199 <= $unsigned($unsigned($signed((reg184 >>> $signed(reg179)))));
            end
          else
            begin
              reg199 <= $unsigned(($signed(({reg193} == $signed((8'hbe)))) ?
                  (&$unsigned(wire176)) : {reg192[(1'h0):(1'h0)]}));
              reg200 <= wire195[(1'h1):(1'h0)];
              reg201 <= (!(wire174[(1'h0):(1'h0)] ^~ wire195));
              reg202 <= (&{($signed(reg191) ~^ $unsigned($signed(reg184)))});
            end
          reg203 <= (wire175 > $signed(($unsigned(reg201) ?
              $signed({wire173, (8'ha8)}) : $signed((+reg181)))));
          reg204 <= (8'ha0);
        end
    end
  always
    @(posedge clk) begin
      if ($signed((+(wire194 < ($signed(reg190) ? $signed(wire171) : reg187)))))
        begin
          reg205 <= {({{reg180, reg204},
                  ((~(8'ha0)) ?
                      reg199[(3'h5):(2'h2)] : (reg187 <<< reg193))} ~^ $signed({{wire194}}))};
          reg206 <= ((|{((!reg184) & reg182), {$unsigned(reg184), reg177}}) ?
              $signed($signed($signed(reg205[(4'ha):(3'h7)]))) : reg204);
          reg207 <= (8'hac);
        end
      else
        begin
          reg205 <= $unsigned(wire171[(3'h5):(1'h0)]);
        end
    end
  assign wire208 = $signed(($signed(($unsigned(reg187) - reg181)) << {$unsigned(reg181),
                       reg190[(1'h0):(1'h0)]}));
  assign wire209 = ((~^{((reg200 && wire208) - ((8'hb6) <= (8'h9e))),
                           ($signed(reg178) ? (^~reg197) : reg179)}) ?
                       reg188[(2'h3):(2'h3)] : (-$unsigned(($unsigned(wire195) + (!wire174)))));
  assign wire210 = $signed((!(|$signed((reg184 ? reg198 : (8'hae))))));
  assign wire211 = reg198[(4'h8):(3'h4)];
  always
    @(posedge clk) begin
      if ($signed((~&($signed($unsigned(wire210)) ?
          ($signed(reg186) == $signed(wire176)) : reg202[(4'hf):(4'h9)]))))
        begin
          if (((~^(-((reg207 ? (8'h9f) : reg206) ?
                  $unsigned((7'h42)) : $unsigned(reg206)))) ?
              $signed($unsigned($unsigned((reg189 >> reg190)))) : $signed(((reg198[(3'h7):(1'h0)] <= (reg200 ?
                  reg201 : reg192)) ~^ reg201[(1'h0):(1'h0)]))))
            begin
              reg212 <= $unsigned((((!reg197) >= ((reg201 ? reg200 : reg205) ?
                  ((8'hae) < (7'h44)) : $unsigned(reg193))) >= ({$unsigned(reg182)} + reg190)));
              reg213 <= (reg184[(4'hf):(3'h7)] > {(^~$signed(((7'h41) == reg190)))});
            end
          else
            begin
              reg212 <= reg213[(2'h3):(1'h0)];
              reg213 <= (^($signed(($signed(wire175) && $unsigned((7'h43)))) ?
                  $unsigned($unsigned($unsigned(reg213))) : $signed((wire171[(1'h0):(1'h0)] || $signed(reg180)))));
            end
          if (wire173[(3'h4):(2'h2)])
            begin
              reg214 <= reg179;
              reg215 <= ((~(^~(reg188 >= $unsigned(reg191)))) >> (^$signed(reg205)));
              reg216 <= reg180;
              reg217 <= wire211[(2'h2):(1'h1)];
            end
          else
            begin
              reg214 <= $unsigned((^{$signed(wire208[(4'ha):(2'h2)]),
                  reg216[(2'h3):(2'h3)]}));
              reg215 <= reg212[(1'h1):(1'h1)];
              reg216 <= ((^$signed((+(reg201 ~^ reg216)))) != $signed($signed(($unsigned(reg178) ?
                  $unsigned(reg189) : $signed(reg189)))));
            end
          reg218 <= (~|reg189[(4'hb):(4'ha)]);
          reg219 <= (&(^(((!reg218) ? $signed(reg204) : $unsigned(reg187)) ?
              $signed($unsigned(wire174)) : (reg205 ?
                  reg199[(2'h2):(2'h2)] : wire194[(2'h3):(2'h2)]))));
        end
      else
        begin
          if ($signed(wire211))
            begin
              reg212 <= $unsigned(($signed(($unsigned(reg216) ~^ $unsigned(reg200))) & reg206));
              reg213 <= $signed(reg181[(2'h2):(1'h0)]);
              reg214 <= ($unsigned((((reg213 <= reg190) ^~ reg204) <<< ((wire194 & (8'hb7)) || reg207))) ~^ (reg186[(1'h1):(1'h0)] ?
                  wire210[(3'h5):(3'h4)] : $unsigned({((8'hba) || reg189),
                      reg183[(5'h12):(4'h9)]})));
              reg215 <= reg180[(1'h1):(1'h1)];
            end
          else
            begin
              reg212 <= (($unsigned($unsigned(reg206[(1'h0):(1'h0)])) - (-reg181)) != reg190);
              reg213 <= (wire194 && wire195[(4'he):(3'h7)]);
              reg214 <= {$signed((^~$signed((~^wire208)))),
                  $unsigned($signed(wire211[(2'h2):(2'h2)]))};
            end
          reg216 <= $signed(wire171[(1'h0):(1'h0)]);
          reg217 <= (reg213 || wire194);
          if (reg201[(1'h1):(1'h0)])
            begin
              reg218 <= (^~(wire175 ^~ reg193));
              reg219 <= $unsigned($unsigned(reg189[(4'he):(2'h3)]));
              reg220 <= reg192;
              reg221 <= ((+reg198) ? reg199 : wire194);
            end
          else
            begin
              reg218 <= $unsigned(((((reg193 ? reg178 : reg215) ?
                      $unsigned(reg213) : (^~reg214)) ?
                  $unsigned(reg214) : $unsigned(reg190[(1'h1):(1'h0)])) != ($signed($signed(reg198)) ?
                  ({wire195} <<< $unsigned(reg178)) : reg179[(2'h3):(2'h2)])));
            end
        end
    end
  assign wire222 = ((&wire195) ?
                       $signed((8'ha0)) : (reg179 ? {wire208} : reg192));
  assign wire223 = reg183;
  assign wire224 = $signed((reg204 ?
                       ((reg187 ?
                           reg206 : (~^reg207)) >= ($unsigned(wire195) + (reg221 ?
                           wire195 : reg214))) : (+reg190[(1'h0):(1'h0)])));
  assign wire225 = ({reg177} ?
                       wire174 : {$signed((reg217[(2'h2):(2'h2)] ?
                               reg187 : reg206[(4'h9):(3'h7)]))});
  always
    @(posedge clk) begin
      reg226 <= $signed((($unsigned($unsigned(reg178)) - reg185) * wire175));
      reg227 <= ({reg218, $signed((reg193 ^ {reg193}))} ?
          $signed($unsigned((!$signed(reg200)))) : {reg190[(1'h1):(1'h1)],
              (+$signed((reg204 ? wire211 : reg204)))});
      reg228 <= (!reg186[(2'h2):(1'h0)]);
    end
  assign wire229 = $unsigned((~^((reg207[(4'h8):(1'h1)] + (!reg191)) ?
                       $unsigned((~reg192)) : reg207[(3'h7):(3'h6)])));
  assign wire230 = (reg199 | $unsigned(reg186));
  assign wire231 = reg181;
endmodule

module module84
#(parameter param167 = {(((+(8'hb5)) + (~&(-(8'hbc)))) ? (^~{{(8'ha3)}}) : (((^(7'h41)) >> (-(8'hbd))) ? (+(-(8'ha2))) : ((^~(8'ha7)) == {(8'ha6)}))), ((({(8'hb6), (8'ha0)} >>> (^~(8'ha0))) | (~^((8'ha3) >>> (8'h9d)))) ? {({(8'hbc), (8'hbf)} <= ((8'hb9) ? (8'hb9) : (7'h40))), (^~((8'h9c) > (8'hb7)))} : (+(~^(~^(8'ha9)))))})
(y, clk, wire88, wire87, wire86, wire85);
  output wire [(32'h32f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire88;
  input wire [(4'h8):(1'h0)] wire87;
  input wire signed [(4'h9):(1'h0)] wire86;
  input wire signed [(4'ha):(1'h0)] wire85;
  wire [(3'h6):(1'h0)] wire166;
  wire [(5'h13):(1'h0)] wire165;
  wire signed [(4'hc):(1'h0)] wire107;
  wire signed [(3'h4):(1'h0)] wire106;
  wire [(5'h11):(1'h0)] wire105;
  wire [(5'h14):(1'h0)] wire104;
  wire signed [(5'h10):(1'h0)] wire103;
  wire signed [(3'h4):(1'h0)] wire102;
  wire [(4'hc):(1'h0)] wire101;
  wire [(3'h7):(1'h0)] wire91;
  wire signed [(5'h13):(1'h0)] wire90;
  wire [(4'hf):(1'h0)] wire89;
  reg signed [(3'h4):(1'h0)] reg164 = (1'h0);
  reg [(4'hb):(1'h0)] reg163 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg161 = (1'h0);
  reg [(5'h15):(1'h0)] reg160 = (1'h0);
  reg [(3'h4):(1'h0)] reg159 = (1'h0);
  reg [(3'h5):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg157 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg156 = (1'h0);
  reg [(3'h6):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg154 = (1'h0);
  reg [(4'hc):(1'h0)] reg153 = (1'h0);
  reg [(4'he):(1'h0)] reg152 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg151 = (1'h0);
  reg [(3'h6):(1'h0)] reg150 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg148 = (1'h0);
  reg [(3'h4):(1'h0)] reg147 = (1'h0);
  reg [(4'hd):(1'h0)] reg146 = (1'h0);
  reg [(2'h2):(1'h0)] reg145 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg144 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg143 = (1'h0);
  reg [(4'hf):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg139 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg138 = (1'h0);
  reg signed [(4'he):(1'h0)] reg137 = (1'h0);
  reg [(4'hf):(1'h0)] reg136 = (1'h0);
  reg [(4'hc):(1'h0)] reg135 = (1'h0);
  reg [(4'h9):(1'h0)] reg134 = (1'h0);
  reg [(3'h6):(1'h0)] reg133 = (1'h0);
  reg [(3'h6):(1'h0)] reg132 = (1'h0);
  reg [(4'hf):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg129 = (1'h0);
  reg [(3'h6):(1'h0)] reg128 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg126 = (1'h0);
  reg [(4'he):(1'h0)] reg125 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg124 = (1'h0);
  reg [(3'h5):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg121 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg120 = (1'h0);
  reg [(5'h12):(1'h0)] reg119 = (1'h0);
  reg [(2'h3):(1'h0)] reg118 = (1'h0);
  reg [(4'he):(1'h0)] reg117 = (1'h0);
  reg [(2'h3):(1'h0)] reg116 = (1'h0);
  reg signed [(4'he):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg112 = (1'h0);
  reg [(4'he):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg99 = (1'h0);
  reg [(5'h11):(1'h0)] reg98 = (1'h0);
  reg [(5'h10):(1'h0)] reg97 = (1'h0);
  reg [(4'ha):(1'h0)] reg96 = (1'h0);
  reg [(4'ha):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg94 = (1'h0);
  reg [(5'h10):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg92 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire91,
                 wire90,
                 wire89,
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
                 reg131,
                 reg130,
                 reg129,
                 reg128,
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
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  assign wire89 = $unsigned((|({$unsigned(wire87)} <<< wire87[(3'h4):(3'h4)])));
  assign wire90 = {$signed($unsigned((+wire87[(3'h4):(1'h1)]))),
                      $signed($unsigned($unsigned((^~wire88))))};
  assign wire91 = wire89;
  always
    @(posedge clk) begin
      reg92 <= $unsigned(($signed(($unsigned(wire86) ?
              {wire91, (7'h42)} : (~|(7'h40)))) ?
          $signed((~&(wire86 || wire91))) : (~$signed(wire91[(1'h0):(1'h0)]))));
      if (($signed($signed($unsigned(wire89[(4'hf):(4'hc)]))) ?
          (|({wire88, (wire90 | wire91)} ?
              ($signed((7'h41)) << wire85[(4'h8):(4'h8)]) : wire86[(4'h9):(3'h5)])) : wire85))
        begin
          reg93 <= ((-$unsigned({{wire88}})) ? reg92 : (~|wire89));
          if ((wire90[(5'h10):(2'h2)] ?
              (wire87[(2'h3):(2'h2)] + $unsigned((!$signed((8'h9f))))) : $signed((^~(wire87[(3'h5):(1'h0)] < wire88)))))
            begin
              reg94 <= (($unsigned({wire90}) + $signed((&(wire89 ?
                  (8'hb1) : (7'h44))))) & $signed((^~((reg92 >> wire88) != wire89))));
              reg95 <= reg92;
              reg96 <= (|reg93);
              reg97 <= {$signed((&(reg94 & {reg96}))),
                  ({$signed({reg92, wire88}),
                          ($signed((8'hac)) ^~ $unsigned(wire89))} ?
                      (~&((wire89 ?
                          wire88 : reg93) | $signed((8'h9c)))) : (-$unsigned((7'h44))))};
            end
          else
            begin
              reg94 <= $signed(wire88);
              reg95 <= {(!{reg95,
                      ((+wire90) ? {reg94, reg95} : $signed(wire88))}),
                  ({$unsigned($signed(reg94))} >= (wire88[(3'h4):(1'h0)] ^ $signed((reg95 >> reg97))))};
              reg96 <= reg95[(1'h0):(1'h0)];
              reg97 <= reg97[(3'h7):(1'h1)];
              reg98 <= wire85[(4'h8):(3'h6)];
            end
        end
      else
        begin
          reg93 <= $unsigned({(reg95[(2'h2):(1'h0)] ?
                  $signed((reg98 != reg97)) : (-reg92))});
          reg94 <= reg93[(2'h3):(2'h3)];
          reg95 <= (~^(-wire88[(4'hd):(1'h1)]));
          reg96 <= ((($signed($unsigned(reg95)) <= $unsigned($unsigned(wire91))) * $unsigned((~^$unsigned(wire90)))) ?
              (reg93[(2'h2):(1'h1)] * (^$unsigned($unsigned(reg97)))) : (~^(8'had)));
        end
      reg99 <= {(wire90[(4'hc):(1'h0)] ?
              ((~^(!reg96)) ?
                  ((|reg96) ?
                      $signed(reg98) : (8'h9d)) : wire90[(3'h5):(2'h2)]) : $signed(($signed((8'hac)) ?
                  reg98 : wire90)))};
      reg100 <= (~|(~&(!$signed($signed(wire86)))));
    end
  assign wire101 = (~(~(|(wire87 ? reg97[(1'h0):(1'h0)] : (+reg99)))));
  assign wire102 = $signed($signed(wire85[(4'h9):(4'h8)]));
  assign wire103 = reg94[(4'hb):(1'h0)];
  assign wire104 = wire101;
  assign wire105 = wire104;
  assign wire106 = $signed(($unsigned(((reg100 ? wire86 : (8'h9d)) ?
                       $unsigned(wire102) : $unsigned(reg93))) + reg99));
  assign wire107 = {{$unsigned((~|((8'hb7) ? wire85 : (8'h9d))))}, (8'ha1)};
  always
    @(posedge clk) begin
      if (reg96)
        begin
          reg108 <= (wire106 ? $unsigned(reg100) : (8'haa));
        end
      else
        begin
          if ($signed((!{(&(+reg99)), $unsigned((reg93 || reg99))})))
            begin
              reg108 <= {{reg92[(1'h0):(1'h0)],
                      ($unsigned(reg94) >>> ((wire103 | wire89) ?
                          (^reg93) : (~&reg98)))}};
            end
          else
            begin
              reg108 <= $signed((^{wire89, wire107}));
              reg109 <= wire87[(1'h0):(1'h0)];
              reg110 <= (-(&((wire88 ^ ((8'hab) ? wire102 : wire101)) ?
                  wire88[(4'h8):(3'h7)] : (+{wire104, wire101}))));
              reg111 <= $unsigned((!($unsigned(wire107) >= (((8'hb7) * wire104) ?
                  reg99 : $unsigned(wire88)))));
              reg112 <= (($signed(($unsigned(reg94) ?
                      $unsigned(wire85) : (reg93 ^ wire103))) >>> wire87[(3'h5):(1'h0)]) ?
                  ($unsigned(wire106[(2'h2):(1'h1)]) ?
                      (wire102 ?
                          {(reg94 ^~ wire86),
                              ((8'ha2) ?
                                  wire104 : wire101)} : {reg92[(1'h0):(1'h0)]}) : wire103) : $unsigned((|(|(reg97 < reg108)))));
            end
        end
      reg113 <= reg98;
      reg114 <= ($signed(reg108) == $unsigned(reg94));
      if ($unsigned({wire86}))
        begin
          reg115 <= wire91[(3'h5):(1'h1)];
          if (wire104)
            begin
              reg116 <= (^$unsigned({((&(7'h44)) ~^ $unsigned(wire101))}));
              reg117 <= $unsigned(reg93);
              reg118 <= reg92[(2'h2):(1'h0)];
              reg119 <= reg95;
              reg120 <= $unsigned((wire105[(4'h8):(1'h0)] >>> wire91[(2'h2):(1'h1)]));
            end
          else
            begin
              reg116 <= (&reg116[(1'h1):(1'h1)]);
              reg117 <= ($unsigned(reg111[(3'h4):(1'h1)]) > wire106[(1'h0):(1'h0)]);
              reg118 <= ($signed(($signed({wire103}) ?
                      reg98[(3'h6):(2'h2)] : reg98[(5'h10):(2'h3)])) ?
                  wire86 : (8'hb6));
            end
          if ($signed((^(wire107 ?
              (wire90 <<< (!reg109)) : ((^~reg119) ?
                  $signed(reg108) : $signed(wire107))))))
            begin
              reg121 <= reg98;
              reg122 <= reg110[(3'h5):(1'h0)];
            end
          else
            begin
              reg121 <= ($signed(wire86[(3'h6):(1'h0)]) ? wire85 : reg116);
              reg122 <= $signed((+{{wire107, $signed(reg99)}, $signed(reg93)}));
              reg123 <= (reg97[(1'h0):(1'h0)] ^ $signed((((wire101 | reg114) ?
                      $unsigned(reg121) : ((8'ha5) ~^ reg109)) ?
                  reg110 : (wire104[(4'hd):(4'h8)] << ((8'hae) ?
                      reg118 : wire86)))));
              reg124 <= $unsigned((^~wire91[(3'h6):(3'h6)]));
            end
          reg125 <= wire104[(3'h5):(2'h3)];
        end
      else
        begin
          reg115 <= $signed($signed($signed(($unsigned(reg118) ?
              wire101[(4'h9):(4'h8)] : {wire90}))));
          reg116 <= ((wire87[(2'h2):(2'h2)] | reg114[(3'h4):(2'h2)]) ?
              $unsigned((~(~reg122[(2'h2):(2'h2)]))) : (~|reg114));
        end
      reg126 <= {reg114, (^~$unsigned(reg123))};
    end
  always
    @(posedge clk) begin
      reg127 <= wire89[(3'h7):(3'h5)];
    end
  always
    @(posedge clk) begin
      reg128 <= $unsigned(wire91);
      if ((wire89[(3'h7):(2'h2)] ?
          (((^~$unsigned((7'h42))) >>> reg108[(3'h6):(3'h4)]) ?
              ((reg125 ? $unsigned(wire85) : (reg114 ? reg120 : (8'hab))) ?
                  ($signed(reg113) ?
                      (reg122 ?
                          wire105 : reg97) : $unsigned(wire87)) : (~|(reg113 ?
                      reg123 : wire104))) : wire87) : ((wire105[(5'h10):(4'hc)] ?
                  (reg99 ? (!reg121) : reg110[(2'h3):(2'h2)]) : wire101) ?
              ((((8'ha2) << reg124) ? $signed(wire107) : (reg112 > reg97)) ?
                  (~^(|reg128)) : $unsigned(wire102[(3'h4):(3'h4)])) : $signed(reg116))))
        begin
          if ((7'h42))
            begin
              reg129 <= ((wire88[(4'hd):(1'h0)] <= $signed(reg95)) ?
                  (!((~^{reg93, reg122}) ?
                      (^((8'haa) ?
                          reg110 : reg97)) : ($signed(reg97) * (reg119 ?
                          reg108 : reg110)))) : $signed(($signed(reg118) ?
                      (&$unsigned(reg118)) : ((8'h9c) ^~ $signed(reg128)))));
              reg130 <= {{$signed($unsigned($unsigned(reg110))),
                      ((wire107 <<< $unsigned(reg119)) ?
                          reg113 : $unsigned($unsigned(wire88)))}};
            end
          else
            begin
              reg129 <= reg109;
            end
        end
      else
        begin
          reg129 <= (~&$signed({reg93, (~&(reg94 ? (8'ha1) : wire101))}));
          reg130 <= $signed($unsigned(wire106[(2'h2):(1'h0)]));
          reg131 <= (~^reg126[(1'h1):(1'h0)]);
          reg132 <= {(~&wire85[(1'h1):(1'h0)]),
              (($signed($unsigned(reg110)) ? {(reg122 | (8'hb2))} : (8'haa)) ?
                  reg97[(4'he):(3'h7)] : reg97)};
        end
      reg133 <= reg132;
      reg134 <= ({{reg109[(4'h8):(1'h1)],
                  $unsigned((wire101 ? (8'haf) : reg96))}} ?
          ($unsigned((wire86 >= $unsigned(wire91))) ?
              ((^~reg114[(4'hb):(4'ha)]) | (^reg120)) : reg117[(3'h5):(2'h3)]) : $unsigned($signed($signed((reg119 > reg127)))));
      reg135 <= reg113[(5'h12):(4'he)];
    end
  always
    @(posedge clk) begin
      if ($signed(reg99))
        begin
          if ($signed($signed($signed(reg112))))
            begin
              reg136 <= reg98[(4'h9):(3'h6)];
            end
          else
            begin
              reg136 <= $unsigned(reg121[(3'h5):(2'h3)]);
            end
          reg137 <= {wire91[(2'h2):(1'h0)],
              $signed((!(reg98[(2'h3):(1'h0)] ~^ $signed(reg117))))};
        end
      else
        begin
          reg136 <= wire107[(1'h0):(1'h0)];
          reg137 <= (~|$signed(((((8'hbe) ?
              wire86 : wire104) >> (~^wire91)) && wire85)));
          reg138 <= ((wire91 ?
              reg131[(4'hb):(2'h3)] : $signed({{reg115}})) << $signed(wire106));
          if (((~&reg121[(3'h6):(3'h4)]) ?
              ($signed((reg100[(4'hd):(3'h4)] ?
                      $unsigned(reg134) : reg128[(2'h2):(1'h1)])) ?
                  reg116[(2'h2):(1'h0)] : {($signed(reg97) ?
                          (^reg129) : (reg132 >= wire105))}) : ((wire85[(2'h2):(2'h2)] ?
                  (reg118[(2'h2):(1'h0)] != (reg116 ?
                      reg121 : reg114)) : $signed($signed(reg92))) & $signed((~&$unsigned(reg110))))))
            begin
              reg139 <= wire107;
              reg140 <= ($signed((reg109[(3'h5):(1'h0)] <= $signed($signed(reg111)))) ?
                  wire106[(2'h2):(1'h1)] : reg123);
              reg141 <= (reg138 ?
                  ((wire106 || $unsigned($unsigned(reg127))) >> (wire88 ?
                      reg127[(1'h0):(1'h0)] : {reg121[(3'h4):(2'h3)],
                          (reg139 ?
                              reg109 : reg123)})) : $unsigned(wire87[(4'h8):(3'h4)]));
              reg142 <= reg120[(2'h3):(1'h0)];
              reg143 <= ((~^(reg132[(3'h6):(3'h5)] >= $unsigned(reg127[(1'h0):(1'h0)]))) >= wire107[(3'h6):(2'h3)]);
            end
          else
            begin
              reg139 <= $signed($unsigned(($signed((+reg134)) >>> $unsigned($unsigned(reg95)))));
              reg140 <= (~^wire88[(3'h7):(2'h3)]);
              reg141 <= (reg135[(3'h6):(3'h5)] ?
                  (~(&reg95)) : (reg133 ?
                      ($unsigned(wire106) ~^ reg134) : wire102[(3'h4):(1'h1)]));
              reg142 <= ((&($signed((^~reg136)) << wire86)) ?
                  reg116[(1'h1):(1'h1)] : ($signed(wire104) < reg128[(3'h5):(1'h0)]));
              reg143 <= {$unsigned(wire104)};
            end
          if ((reg126 ? (^~((~{reg114}) && (+$signed((8'ha9))))) : reg123))
            begin
              reg144 <= $unsigned($signed(reg137[(4'hd):(4'hb)]));
              reg145 <= $signed(reg111);
              reg146 <= $unsigned((~&$signed(reg97)));
              reg147 <= $unsigned((~|((^~reg139[(4'h8):(1'h1)]) ?
                  ($signed(reg119) & (reg113 ?
                      reg117 : wire87)) : (~^(wire86 || wire103)))));
            end
          else
            begin
              reg144 <= ($signed(reg147) ?
                  $signed((|$unsigned(wire90[(4'he):(4'hc)]))) : (^~reg119[(4'h9):(4'h9)]));
              reg145 <= (^($signed(reg117[(1'h0):(1'h0)]) ?
                  (reg109 ^~ (reg130[(2'h3):(2'h3)] ?
                      (reg93 ? (8'hb5) : (8'hb0)) : (reg111 ?
                          reg128 : reg120))) : (|reg143[(1'h1):(1'h0)])));
              reg146 <= reg123[(1'h1):(1'h1)];
            end
        end
      if (reg118[(1'h0):(1'h0)])
        begin
          reg148 <= wire89;
          reg149 <= (&{{$signed((reg127 && reg114)), reg148}});
          reg150 <= reg142[(1'h0):(1'h0)];
          if ($signed(reg111[(4'hc):(3'h7)]))
            begin
              reg151 <= ($signed(reg94) >>> (^$unsigned(wire85[(4'ha):(2'h3)])));
              reg152 <= (8'h9f);
              reg153 <= $unsigned(($unsigned(((reg145 & reg142) ?
                  $signed(reg119) : $unsigned((8'h9e)))) + reg140[(3'h7):(1'h0)]));
              reg154 <= ((~^$signed(reg126[(3'h6):(1'h1)])) ?
                  ($signed({$unsigned(reg145)}) ^ wire88) : {(reg94 && (~^$unsigned(reg123)))});
              reg155 <= $unsigned((wire86[(3'h6):(2'h2)] ?
                  $signed(reg95[(2'h2):(1'h0)]) : (reg131 * (~&$signed((8'haa))))));
            end
          else
            begin
              reg151 <= (~^{$signed($unsigned(reg140))});
              reg152 <= reg125[(4'h8):(4'h8)];
              reg153 <= reg94[(4'hb):(3'h5)];
              reg154 <= $unsigned(($signed({$unsigned(reg137),
                  (wire104 <= reg111)}) | ((((8'hae) == wire88) ?
                  reg153[(2'h2):(1'h1)] : (+reg155)) <= $unsigned(reg108[(1'h0):(1'h0)]))));
              reg155 <= (~&(~^reg117[(3'h6):(2'h2)]));
            end
          reg156 <= (((((wire89 > reg130) >= {reg109}) ?
                      $unsigned((~^reg133)) : reg141) ?
                  ((7'h41) ?
                      reg125[(2'h3):(2'h3)] : $signed($signed(reg154))) : ({$unsigned(reg122)} * ($signed(reg144) ?
                      {wire87} : {reg126}))) ?
              reg142 : ((~(reg121[(3'h4):(1'h1)] ^ reg113[(4'h8):(2'h2)])) << {$signed(reg147)}));
        end
      else
        begin
          reg148 <= ($unsigned(reg98[(4'hf):(2'h3)]) ?
              ({reg152[(4'ha):(4'h9)]} ~^ ($signed({reg149}) ?
                  $signed((reg156 && reg118)) : $signed({reg99}))) : $signed(reg156[(4'h8):(3'h5)]));
          reg149 <= $unsigned((-reg146));
          reg150 <= $unsigned($signed((reg139[(2'h2):(1'h1)] - (8'hbb))));
        end
      if ((reg96 == reg131))
        begin
          reg157 <= wire103;
          reg158 <= ($unsigned(wire105[(3'h7):(3'h4)]) ?
              {$signed((reg124 | reg119[(3'h4):(3'h4)])),
                  reg93} : reg135[(1'h1):(1'h1)]);
        end
      else
        begin
          reg157 <= (({{(^~reg98), (-wire90)},
              (~^reg96)} || (~|wire88)) == $unsigned(reg137));
          reg158 <= (($signed((reg133 ? ((8'hb4) ? reg121 : reg109) : reg149)) ?
              wire102 : ($signed($signed(reg152)) ?
                  (wire103 ?
                      reg143 : (reg126 == reg149)) : $unsigned($signed(reg117)))) >> $unsigned($signed(($unsigned(wire89) ?
              (reg92 ? wire101 : reg137) : {reg111}))));
          reg159 <= ($signed((&$unsigned($unsigned(wire85)))) ?
              wire107[(2'h3):(2'h2)] : $signed(reg136));
          if ({reg120})
            begin
              reg160 <= (reg93 ?
                  (wire103[(4'hb):(4'hb)] >= reg152) : reg136[(4'hc):(4'hc)]);
              reg161 <= {reg155[(1'h0):(1'h0)],
                  $signed($signed((!(^wire104))))};
            end
          else
            begin
              reg160 <= $unsigned(reg140[(4'h8):(3'h4)]);
              reg161 <= (reg127 + $signed(wire107[(3'h7):(3'h4)]));
              reg162 <= reg130;
              reg163 <= (($unsigned(wire101[(2'h3):(2'h3)]) != ($signed({(7'h41),
                      (8'haa)}) ?
                  reg109 : {reg125})) | (~($unsigned(reg114) ^ $unsigned((-reg117)))));
              reg164 <= reg116[(1'h0):(1'h0)];
            end
        end
    end
  assign wire165 = (8'hb2);
  assign wire166 = {(($signed((reg153 <= reg95)) ^~ $signed(reg117[(2'h2):(1'h0)])) >>> $unsigned($unsigned((reg100 && reg161))))};
endmodule

module module49
#(parameter param72 = ((((((8'hb9) ^ (8'ha9)) ? (^(8'hb9)) : ((8'hb1) && (7'h43))) ~^ (&((8'had) >> (7'h40)))) ? ((((8'hae) * (8'hb5)) || (-(8'ha0))) ? (~&{(7'h40), (8'hb5)}) : ((8'hb0) << {(8'hbe), (8'hb5)})) : (((!(8'hb0)) ? (~(8'ha8)) : ((8'haa) ? (8'hb8) : (8'ha2))) ? ((~|(8'hbe)) << {(8'ha0), (8'h9d)}) : ((~&(8'hb5)) ? ((8'hb3) ? (8'hb5) : (7'h41)) : {(8'ha1)}))) ? ((^~{((8'haf) ? (8'hb3) : (8'h9c))}) ? (~^(((7'h42) ? (8'ha9) : (8'hbc)) ? (+(8'ha3)) : ((8'ha7) ? (8'hbc) : (8'hb2)))) : (~^{((8'hb9) && (8'h9d)), (~|(8'ha5))})) : ({((+(8'hbf)) <<< ((8'ha1) <<< (8'hb0)))} & (-((-(8'hbb)) ~^ (8'haa))))), 
parameter param73 = ({(param72 * param72), param72} < {{((param72 & (8'ha9)) ? param72 : (param72 > param72))}}))
(y, clk, wire54, wire53, wire52, wire51, wire50);
  output wire [(32'hcf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire54;
  input wire [(4'h8):(1'h0)] wire53;
  input wire signed [(5'h11):(1'h0)] wire52;
  input wire [(2'h2):(1'h0)] wire51;
  input wire signed [(2'h2):(1'h0)] wire50;
  wire signed [(4'h9):(1'h0)] wire59;
  wire [(5'h12):(1'h0)] wire58;
  wire signed [(4'h8):(1'h0)] wire57;
  wire [(5'h14):(1'h0)] wire56;
  wire [(4'h8):(1'h0)] wire55;
  reg [(4'hc):(1'h0)] reg71 = (1'h0);
  reg [(5'h14):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg68 = (1'h0);
  reg [(2'h2):(1'h0)] reg67 = (1'h0);
  reg [(4'hd):(1'h0)] reg66 = (1'h0);
  reg [(4'hd):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg64 = (1'h0);
  reg signed [(4'he):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg62 = (1'h0);
  reg [(4'ha):(1'h0)] reg61 = (1'h0);
  reg [(4'hc):(1'h0)] reg60 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
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
                 (1'h0)};
  assign wire55 = wire51;
  assign wire56 = wire53[(1'h1):(1'h1)];
  assign wire57 = wire51[(2'h2):(1'h0)];
  assign wire58 = $signed((!{{(wire53 ? wire54 : wire56),
                          ((8'hbb) ? (8'h9e) : wire50)}}));
  assign wire59 = (^~(wire50[(1'h0):(1'h0)] ?
                      (8'h9d) : {({(8'hbe), wire52} & wire57)}));
  always
    @(posedge clk) begin
      reg60 <= ({$signed($signed((~^(8'hab))))} << ((8'hbc) ?
          $signed(wire59) : $unsigned(($signed(wire57) > wire50[(1'h0):(1'h0)]))));
      if (((wire52[(4'hd):(4'hc)] ?
          wire53[(3'h4):(2'h2)] : (wire52 ?
              $unsigned(wire52) : (wire56 ?
                  (!wire53) : (~^reg60)))) <<< ((~|(&$signed(wire51))) < wire51)))
        begin
          reg61 <= (wire53[(2'h3):(2'h3)] & ((((wire51 ? wire57 : wire50) ?
              $unsigned(wire55) : {wire57, wire50}) >> ((~^wire50) ?
              (wire54 ?
                  reg60 : wire59) : $signed(wire55))) | ($unsigned((reg60 ?
              wire57 : (8'h9d))) + wire57)));
          if (wire59[(3'h4):(1'h1)])
            begin
              reg62 <= reg60[(4'hb):(4'hb)];
              reg63 <= reg60[(4'hb):(2'h2)];
              reg64 <= ((({wire50[(1'h1):(1'h1)]} & $signed($unsigned((7'h41)))) ?
                  ({wire58[(1'h1):(1'h0)],
                      wire50[(2'h2):(2'h2)]} != ((~^(8'hba)) ?
                      $signed((8'ha1)) : wire56[(4'hf):(4'hf)])) : (^~wire56[(4'ha):(3'h6)])) >= $signed({((wire51 + reg60) ?
                      (-wire58) : (wire55 - wire58)),
                  ($unsigned(wire58) ?
                      wire51[(1'h0):(1'h0)] : $signed(wire56))}));
            end
          else
            begin
              reg62 <= $signed(reg62);
              reg63 <= {(~&(8'had))};
              reg64 <= (($signed($signed(reg64)) < $signed(reg62[(4'h8):(1'h0)])) ?
                  (-{$signed((wire51 ?
                          wire56 : wire59))}) : wire53[(3'h7):(3'h4)]);
              reg65 <= wire55[(3'h7):(2'h2)];
            end
          reg66 <= ({reg62} ?
              $unsigned((8'hb8)) : ({$unsigned(reg62[(4'he):(1'h0)]),
                      ((reg60 <= wire54) ? (&(8'hae)) : reg60[(4'ha):(2'h3)])} ?
                  (&wire56) : (reg60[(4'hc):(1'h0)] << ({(8'ha9),
                      wire55} <= ((8'ha7) ? reg63 : (8'ha0))))));
          reg67 <= $unsigned({wire51[(1'h0):(1'h0)],
              {$unsigned({(8'ha5), reg64}), reg63}});
          reg68 <= (~^{wire59[(2'h2):(1'h1)]});
        end
      else
        begin
          if (reg66)
            begin
              reg61 <= wire51[(1'h0):(1'h0)];
              reg62 <= $unsigned((wire52[(4'hd):(1'h0)] ?
                  $unsigned($signed((|wire53))) : wire58));
              reg63 <= $unsigned(((!((-reg64) ?
                      (^wire51) : $unsigned((8'hb1)))) ?
                  $unsigned(({wire57} | {wire55})) : $signed(reg63[(4'h9):(1'h1)])));
            end
          else
            begin
              reg61 <= $unsigned(((($unsigned(reg63) - (wire58 <<< (8'hb8))) ?
                  $signed($signed(reg63)) : {reg63[(4'he):(3'h7)]}) | ((+(reg60 | wire56)) ?
                  (reg66[(3'h6):(3'h6)] ?
                      $signed((8'ha3)) : wire54[(5'h12):(3'h5)]) : reg65[(4'h9):(4'h9)])));
              reg62 <= reg63[(4'ha):(3'h7)];
            end
        end
      reg69 <= $unsigned($signed($unsigned((~|$signed(wire57)))));
      reg70 <= wire50[(1'h1):(1'h0)];
      reg71 <= {{$signed((~|{wire56, reg67}))}, reg70};
    end
endmodule

module module17
#(parameter param45 = {{(|{(-(8'hbc))})}})
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire21;
  input wire signed [(3'h7):(1'h0)] wire20;
  input wire [(3'h5):(1'h0)] wire19;
  input wire [(5'h10):(1'h0)] wire18;
  wire [(4'hf):(1'h0)] wire44;
  wire signed [(4'hf):(1'h0)] wire38;
  wire [(5'h13):(1'h0)] wire37;
  wire [(5'h13):(1'h0)] wire36;
  wire [(5'h12):(1'h0)] wire35;
  wire [(2'h3):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire32;
  wire [(5'h14):(1'h0)] wire31;
  wire signed [(4'hc):(1'h0)] wire30;
  wire [(5'h14):(1'h0)] wire26;
  wire signed [(4'hf):(1'h0)] wire25;
  wire [(4'h9):(1'h0)] wire24;
  wire [(3'h5):(1'h0)] wire23;
  wire [(5'h12):(1'h0)] wire22;
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg [(3'h4):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  assign y = {wire44,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg34,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire22 = ((8'ha0) >>> ((~{$unsigned(wire18)}) + (~^($signed(wire18) ?
                      wire19[(1'h0):(1'h0)] : wire21))));
  assign wire23 = wire18;
  assign wire24 = (8'hbc);
  assign wire25 = wire24[(4'h8):(2'h2)];
  assign wire26 = wire18;
  always
    @(posedge clk) begin
      reg27 <= ((+wire23) ?
          $signed($unsigned(((wire23 ? wire21 : wire26) ?
              (+wire25) : (wire23 ? wire24 : wire21)))) : wire20);
      reg28 <= (wire18[(2'h3):(2'h3)] ?
          (^~$signed($unsigned((wire19 & wire18)))) : $signed($signed(wire26[(3'h5):(1'h1)])));
      reg29 <= wire26[(4'hc):(4'h9)];
    end
  assign wire30 = ((wire18[(3'h5):(1'h0)] || $unsigned($signed((wire20 ?
                          reg29 : wire19)))) ?
                      $signed($unsigned($unsigned($unsigned(wire20)))) : ((~&reg28) < (^~($signed(wire22) ?
                          $signed(reg29) : ((8'h9e) ? wire23 : wire21)))));
  assign wire31 = ((8'hb6) ?
                      ({$signed((~^reg28)), wire24[(3'h5):(2'h3)]} ?
                          $unsigned(wire30[(4'hb):(2'h2)]) : (~|wire26)) : {(wire18 >> $unsigned($unsigned(wire30))),
                          $signed(wire30)});
  assign wire32 = $unsigned((~wire22));
  assign wire33 = (((wire30 ?
                              wire24[(2'h2):(1'h0)] : $signed({wire30,
                                  (8'hae)})) ?
                          wire24 : wire32) ?
                      wire30[(3'h6):(2'h2)] : $signed($signed(($unsigned(reg28) >> $signed((8'hbc))))));
  always
    @(posedge clk) begin
      reg34 <= {$unsigned($signed(wire24[(3'h4):(1'h1)])), wire24};
    end
  assign wire35 = wire26;
  assign wire36 = wire32;
  assign wire37 = wire22[(3'h4):(1'h0)];
  assign wire38 = wire24[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg39 <= {wire37, (~&$signed($signed(((8'hbe) | wire22))))};
      reg40 <= reg29[(4'hf):(4'hc)];
      reg41 <= {$unsigned(wire25[(4'hc):(4'ha)]),
          {((wire20 ? reg29 : $unsigned((7'h42))) & ((wire31 >= wire38) ?
                  (reg29 ? reg28 : reg40) : wire22[(3'h6):(2'h3)])),
              (+{wire37[(4'hf):(2'h2)]})}};
      reg42 <= $signed(({(~|$unsigned(wire37)),
              $unsigned((wire38 ? wire25 : wire32))} ?
          (~^wire36) : reg34[(1'h1):(1'h0)]));
      reg43 <= wire36;
    end
  assign wire44 = $unsigned(wire24[(3'h7):(3'h6)]);
endmodule
