module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2ac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire294;
  wire [(4'h9):(1'h0)] wire293;
  wire signed [(4'h8):(1'h0)] wire290;
  wire signed [(4'hb):(1'h0)] wire288;
  wire signed [(3'h5):(1'h0)] wire241;
  wire [(4'hc):(1'h0)] wire240;
  wire [(4'h9):(1'h0)] wire239;
  wire signed [(5'h13):(1'h0)] wire191;
  wire signed [(5'h11):(1'h0)] wire34;
  wire [(4'hf):(1'h0)] wire193;
  wire [(5'h13):(1'h0)] wire194;
  wire signed [(4'hf):(1'h0)] wire237;
  wire [(4'he):(1'h0)] wire243;
  wire signed [(4'hf):(1'h0)] wire280;
  wire [(2'h2):(1'h0)] wire282;
  wire [(5'h14):(1'h0)] wire283;
  wire [(4'hd):(1'h0)] wire284;
  wire signed [(4'h9):(1'h0)] wire285;
  wire [(5'h11):(1'h0)] wire286;
  reg signed [(3'h6):(1'h0)] reg292 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg291 = (1'h0);
  reg [(2'h3):(1'h0)] reg244 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg245 = (1'h0);
  reg [(4'he):(1'h0)] reg246 = (1'h0);
  reg [(3'h5):(1'h0)] reg247 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg248 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg249 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg250 = (1'h0);
  reg [(5'h14):(1'h0)] reg251 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg252 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg253 = (1'h0);
  reg [(5'h11):(1'h0)] reg254 = (1'h0);
  reg [(4'hf):(1'h0)] reg255 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg256 = (1'h0);
  reg [(5'h14):(1'h0)] reg257 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg258 = (1'h0);
  reg [(5'h13):(1'h0)] reg259 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg260 = (1'h0);
  reg [(5'h11):(1'h0)] reg261 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg262 = (1'h0);
  reg [(4'ha):(1'h0)] reg263 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg264 = (1'h0);
  reg [(4'hd):(1'h0)] reg265 = (1'h0);
  reg [(3'h7):(1'h0)] reg266 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg267 = (1'h0);
  reg [(4'hd):(1'h0)] reg268 = (1'h0);
  reg signed [(4'he):(1'h0)] reg269 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg270 = (1'h0);
  reg [(5'h14):(1'h0)] reg271 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg272 = (1'h0);
  reg [(5'h14):(1'h0)] reg273 = (1'h0);
  reg [(4'hc):(1'h0)] reg274 = (1'h0);
  reg [(3'h4):(1'h0)] reg275 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg276 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg277 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg278 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg279 = (1'h0);
  assign y = {wire294,
                 wire293,
                 wire290,
                 wire288,
                 wire241,
                 wire240,
                 wire239,
                 wire191,
                 wire34,
                 wire193,
                 wire194,
                 wire237,
                 wire243,
                 wire280,
                 wire282,
                 wire283,
                 wire284,
                 wire285,
                 wire286,
                 reg292,
                 reg291,
                 reg244,
                 reg245,
                 reg246,
                 reg247,
                 reg248,
                 reg249,
                 reg250,
                 reg251,
                 reg252,
                 reg253,
                 reg254,
                 reg255,
                 reg256,
                 reg257,
                 reg258,
                 reg259,
                 reg260,
                 reg261,
                 reg262,
                 reg263,
                 reg264,
                 reg265,
                 reg266,
                 reg267,
                 reg268,
                 reg269,
                 reg270,
                 reg271,
                 reg272,
                 reg273,
                 reg274,
                 reg275,
                 reg276,
                 reg277,
                 reg278,
                 reg279,
                 (1'h0)};
  module4 #() modinst35 (.wire5((7'h41)), .wire9(wire3), .wire6(wire1), .wire7(wire0), .y(wire34), .clk(clk), .wire8(wire2));
  module36 #() modinst192 (wire191, clk, wire1, wire0, wire2, wire3, wire34);
  assign wire193 = $signed(wire34[(4'h9):(4'h9)]);
  assign wire194 = ($signed(wire3[(3'h4):(2'h3)]) >>> (wire34[(2'h2):(1'h1)] ?
                       wire2[(4'he):(3'h7)] : (+{wire1, $signed(wire1)})));
  module195 #() modinst238 (wire237, clk, wire193, wire1, wire0, wire2, wire194);
  assign wire239 = (8'had);
  assign wire240 = (&wire3);
  module126 #() modinst242 (wire241, clk, wire1, wire3, wire194, wire239, wire193);
  assign wire243 = {(^~wire239[(2'h3):(2'h2)])};
  always
    @(posedge clk) begin
      if ($unsigned((+{$unsigned(wire34[(3'h7):(2'h3)])})))
        begin
          reg244 <= (|(8'hb8));
          reg245 <= wire34[(3'h5):(3'h5)];
          if ($unsigned(wire0))
            begin
              reg246 <= {(~&$unsigned($signed((wire0 > wire194))))};
              reg247 <= (+($unsigned(($unsigned(reg244) ?
                      ((7'h42) + wire241) : $signed((8'h9e)))) ?
                  $signed((&(~reg246))) : ($unsigned((|wire0)) ?
                      $unsigned((reg246 ?
                          wire191 : wire240)) : $unsigned((+wire243)))));
            end
          else
            begin
              reg246 <= reg247[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg244 <= $unsigned(wire237[(3'h5):(2'h2)]);
          if ($signed({(wire237[(2'h3):(1'h0)] ?
                  (8'hbf) : ($unsigned((8'hb1)) * $unsigned((8'ha3)))),
              $unsigned({wire3[(4'hd):(4'hc)]})}))
            begin
              reg245 <= (reg244 ?
                  (wire240 || (-(|(wire240 ?
                      wire191 : wire240)))) : wire194[(1'h1):(1'h1)]);
              reg246 <= (!$signed($signed(wire241[(1'h0):(1'h0)])));
              reg247 <= ((((wire194 ?
                      $unsigned(wire240) : (wire0 >>> (8'h9e))) ^~ wire237) ?
                  (&$signed(((8'ha2) ?
                      reg245 : (8'hb9)))) : $unsigned(reg244[(1'h0):(1'h0)])) <<< wire194[(5'h12):(2'h3)]);
              reg248 <= wire3[(4'he):(4'he)];
              reg249 <= wire2[(3'h4):(2'h3)];
            end
          else
            begin
              reg245 <= (((+((wire243 > reg247) ?
                          (wire191 - reg248) : reg248)) ?
                      reg247[(1'h1):(1'h0)] : (reg249 ^ (&$unsigned(wire243)))) ?
                  wire243 : ({((wire241 ^ reg244) * (reg247 == reg244)),
                      wire240[(4'h8):(2'h2)]} >>> wire240));
              reg246 <= (|$signed((((reg248 ?
                  wire3 : wire2) >> (-reg247)) - ($signed((8'h9f)) ?
                  $signed(wire34) : (8'hbd)))));
              reg247 <= $unsigned(wire2[(2'h2):(2'h2)]);
              reg248 <= (((&reg249[(2'h2):(1'h1)]) ?
                      wire193[(2'h3):(2'h2)] : $signed((reg245 - (wire241 ?
                          wire0 : reg246)))) ?
                  (~^(+reg247[(1'h0):(1'h0)])) : ((((reg246 ? wire3 : wire194) ?
                          wire243[(1'h1):(1'h1)] : (-wire191)) == wire1) ?
                      wire0[(1'h0):(1'h0)] : ({$unsigned(wire3),
                          $signed(wire193)} ^~ (~|(reg244 + reg245)))));
            end
          if ($signed(wire34[(3'h7):(2'h3)]))
            begin
              reg250 <= {($unsigned(wire34[(2'h2):(1'h0)]) ?
                      (wire241 <<< (wire191[(1'h1):(1'h0)] ?
                          $unsigned(wire1) : (wire239 ?
                              wire240 : reg249))) : wire237[(4'hc):(2'h3)]),
                  (wire193 ?
                      ({wire237, (wire241 || reg244)} ?
                          $unsigned(wire0) : wire193) : $unsigned(reg245))};
              reg251 <= (((reg247[(3'h5):(1'h1)] ?
                  {reg246} : (reg247 ?
                      (&(8'h9e)) : (reg245 + reg250))) | (8'hb8)) == (wire241[(2'h2):(2'h2)] >>> ($signed($signed(reg246)) ?
                  $signed((~|wire191)) : wire241)));
              reg252 <= $unsigned($signed((^($unsigned(reg246) ?
                  ((8'hba) ? wire240 : (8'hb5)) : ((8'ha7) ?
                      reg247 : wire243)))));
              reg253 <= (8'ha7);
              reg254 <= (&(8'ha6));
            end
          else
            begin
              reg250 <= (~reg246);
            end
          reg255 <= (((8'hb9) ?
                  (!wire240) : (wire194[(4'h9):(1'h1)] ?
                      (~&wire191) : $unsigned($unsigned(wire191)))) ?
              reg244[(2'h3):(2'h2)] : (((~|$signed(wire1)) > reg244) ?
                  {{(^~reg249)}, $signed($signed(wire2))} : $signed(wire241)));
        end
      reg256 <= $signed($unsigned($unsigned((|$signed(reg252)))));
      if (wire243[(3'h4):(1'h0)])
        begin
          if ($unsigned($signed((8'hb5))))
            begin
              reg257 <= wire191[(4'h9):(4'h9)];
              reg258 <= $unsigned(wire1);
              reg259 <= reg248;
              reg260 <= ({$unsigned((((8'hbb) ? reg246 : reg256) ?
                          wire2 : {(8'h9f)}))} ?
                  (8'ha4) : ({$unsigned($signed(reg259)),
                          ((^reg247) ? (wire0 <= reg255) : {wire191, wire1})} ?
                      reg246 : (wire237[(3'h5):(1'h0)] ?
                          (((8'ha6) ?
                              reg244 : wire241) || $unsigned((8'hb0))) : wire191[(1'h0):(1'h0)])));
              reg261 <= (($unsigned(({wire237} ?
                          (~(8'hbf)) : (reg244 ? (8'hb8) : wire237))) ?
                      wire239[(3'h6):(3'h5)] : reg246) ?
                  wire1 : (!(&wire193)));
            end
          else
            begin
              reg257 <= ((~|reg259[(5'h11):(4'he)]) ?
                  wire34[(3'h7):(2'h3)] : wire1[(5'h13):(3'h6)]);
              reg258 <= reg261[(3'h6):(3'h6)];
              reg259 <= ((^~reg244[(2'h3):(2'h3)]) * $signed((reg258[(2'h2):(2'h2)] ?
                  (-wire0) : wire0)));
              reg260 <= reg259[(4'hb):(4'h8)];
            end
          if (($signed(($unsigned($signed(reg255)) ?
                  reg257 : ($unsigned((8'haa)) ?
                      wire241[(2'h3):(2'h2)] : wire194[(5'h11):(4'h9)]))) ?
              reg259[(5'h13):(4'hf)] : ($signed($signed((|wire194))) || $unsigned($signed((wire240 + (8'hb7)))))))
            begin
              reg262 <= wire194;
              reg263 <= $unsigned(reg254[(1'h0):(1'h0)]);
              reg264 <= reg244;
            end
          else
            begin
              reg262 <= {{reg250, wire1[(3'h4):(2'h3)]}};
              reg263 <= ((~((reg259[(4'h9):(3'h4)] ?
                      $signed(reg253) : (-wire240)) > reg255[(4'hc):(3'h6)])) ?
                  wire194[(4'hb):(1'h1)] : {{((+wire194) && wire2[(3'h6):(1'h0)])}});
            end
          if ((^~$unsigned(wire241[(2'h3):(2'h3)])))
            begin
              reg265 <= ($unsigned($unsigned((wire240[(3'h4):(2'h3)] * reg261[(4'he):(4'hb)]))) ^~ $signed($unsigned($signed((^~reg245)))));
              reg266 <= (reg249[(2'h2):(1'h1)] >>> {{((reg256 ?
                              wire240 : reg250) ?
                          (reg248 ?
                              reg248 : (8'haf)) : reg258[(1'h1):(1'h1)])}});
            end
          else
            begin
              reg265 <= $signed(reg260);
              reg266 <= (&(wire193 & {((+reg257) ?
                      (reg261 ? reg247 : reg247) : wire2[(5'h12):(1'h0)]),
                  $unsigned($unsigned(wire191))}));
              reg267 <= reg266;
              reg268 <= (wire194 ?
                  ($unsigned($unsigned((wire193 <= reg246))) ?
                      $signed(wire239[(1'h0):(1'h0)]) : reg265) : $unsigned(($signed({(8'hb1),
                      wire2}) != wire1)));
              reg269 <= ({$signed($unsigned($unsigned(reg252)))} ?
                  (!{(wire0[(4'ha):(1'h0)] ?
                          reg244[(2'h2):(1'h1)] : reg266)}) : reg247[(2'h2):(1'h1)]);
            end
          reg270 <= (^$unsigned({(wire194[(4'h9):(4'h9)] ? (8'hb4) : (|reg246)),
              $signed((&reg268))}));
        end
      else
        begin
          if ((~($signed(({reg259} ?
                  {wire34, wire191} : (reg249 ? reg248 : reg256))) ?
              $unsigned(((reg247 <= (8'h9f)) ?
                  $signed((8'hb9)) : (reg263 ? wire243 : (8'hb4)))) : wire2)))
            begin
              reg257 <= $unsigned($signed(reg256));
              reg258 <= ((((8'haf) ?
                          ($signed(wire0) ?
                              $unsigned((8'hb4)) : (^wire191)) : reg250) ?
                      reg260[(1'h0):(1'h0)] : (&reg270[(3'h7):(1'h1)])) ?
                  ($signed($signed(reg260[(1'h0):(1'h0)])) ?
                      wire239[(4'h9):(2'h2)] : reg252) : wire237);
            end
          else
            begin
              reg257 <= reg259[(4'hd):(4'h9)];
              reg258 <= ($signed((~^wire241)) ?
                  reg250 : $signed($signed(($unsigned((8'h9d)) ?
                      reg257[(3'h6):(2'h2)] : (~&reg252)))));
              reg259 <= wire241;
              reg260 <= (($signed((~^(reg250 | wire193))) ?
                      ((8'ha1) | wire34) : {{{wire237, reg266},
                              ((8'hb2) ? reg262 : wire243)},
                          $unsigned($unsigned(reg256))}) ?
                  wire240[(3'h7):(3'h4)] : {(-(!wire239))});
              reg261 <= reg261;
            end
        end
      if ((reg252 ?
          $signed((reg260[(1'h0):(1'h0)] & $signed(reg255))) : $unsigned($signed(reg266))))
        begin
          reg271 <= $unsigned({($signed(reg270) ?
                  $signed($signed(reg268)) : wire240)});
        end
      else
        begin
          if ((~&reg257[(4'h8):(1'h0)]))
            begin
              reg271 <= reg258[(1'h1):(1'h1)];
              reg272 <= (wire243[(1'h0):(1'h0)] + wire191);
              reg273 <= ($signed(({(wire193 ? (8'ha0) : (7'h42)),
                          reg266[(1'h0):(1'h0)]} ?
                      reg262 : (wire194 - $unsigned(reg271)))) ?
                  $signed(((8'ha6) ?
                      ((~reg261) << (wire243 ?
                          reg267 : reg248)) : ((reg267 > reg255) <= reg258[(1'h1):(1'h0)]))) : (~&$unsigned(((|(8'h9e)) ?
                      {reg263, (8'hb9)} : ((8'haf) | reg262)))));
              reg274 <= reg262;
              reg275 <= $unsigned(((^~((reg258 ? wire2 : wire240) ?
                      ((8'hbe) ? wire193 : wire241) : (reg269 <<< (8'ha8)))) ?
                  (!reg246[(3'h4):(1'h1)]) : ((((8'hb1) <= wire243) ?
                      {reg260,
                          reg248} : reg254[(4'ha):(3'h4)]) && $unsigned((~&reg257)))));
            end
          else
            begin
              reg271 <= wire194[(4'hc):(4'ha)];
              reg272 <= wire34[(4'ha):(2'h2)];
              reg273 <= $signed($unsigned({$unsigned($signed((8'h9f)))}));
            end
          if ((~((reg271[(3'h7):(2'h2)] ?
              $unsigned((reg250 ?
                  (8'hb2) : reg249)) : (8'hbc)) * reg249[(2'h3):(1'h0)])))
            begin
              reg276 <= ((reg273 ?
                  (^~$signed(reg257[(4'h8):(3'h6)])) : reg254) || $unsigned((~|$unsigned((8'hb7)))));
              reg277 <= ((wire34 ?
                      $signed($signed((reg263 ?
                          reg250 : reg261))) : wire3[(5'h13):(4'ha)]) ?
                  ($signed($signed((reg266 ? reg269 : reg272))) ?
                      reg258[(1'h0):(1'h0)] : reg247) : (wire0 ?
                      reg260[(1'h0):(1'h0)] : $unsigned(reg258[(1'h0):(1'h0)])));
              reg278 <= $unsigned($unsigned($unsigned(((reg254 & reg246) + (reg273 ?
                  wire34 : wire191)))));
            end
          else
            begin
              reg276 <= {(+$unsigned($signed((~^reg247)))),
                  ((^~(((8'hae) <<< reg257) >> (wire34 || wire194))) >= (~|{wire237[(3'h6):(3'h5)]}))};
              reg277 <= ($unsigned({{$signed(reg271), $unsigned((8'ha3))},
                      (^wire0)}) ?
                  (~&$unsigned(($unsigned(reg261) ~^ $signed(reg266)))) : (wire240[(3'h4):(2'h3)] ?
                      ({$unsigned(reg272),
                          (wire239 ?
                              reg244 : reg246)} <<< (reg264[(4'he):(3'h6)] - (reg274 <= wire194))) : reg266));
            end
        end
      reg279 <= {($signed(reg271) != $signed(reg259[(4'hd):(4'h9)]))};
    end
  module4 #() modinst281 (wire280, clk, wire243, reg272, reg250, reg276, wire193);
  assign wire282 = $signed((^~({$unsigned(reg254)} ?
                       $signed((|wire241)) : {(!reg271)})));
  assign wire283 = wire194[(1'h1):(1'h0)];
  assign wire284 = reg250;
  assign wire285 = {(|reg255[(4'hd):(4'hc)]), $signed(reg255[(4'hd):(1'h0)])};
  module195 #() modinst287 (.wire197(reg271), .clk(clk), .wire200(wire34), .y(wire286), .wire198(wire241), .wire199(reg278), .wire196(wire0));
  module46 #() modinst289 (.y(wire288), .wire48(reg271), .wire49(wire285), .wire47(wire1), .wire50(reg254), .clk(clk));
  assign wire290 = (7'h42);
  always
    @(posedge clk) begin
      reg291 <= ({reg258} ^~ wire34[(3'h5):(1'h1)]);
      reg292 <= ((wire283[(5'h14):(3'h6)] <<< (reg256 ?
              (!(+reg277)) : wire2[(3'h5):(1'h1)])) ?
          reg248[(3'h6):(2'h3)] : reg244[(2'h2):(1'h1)]);
    end
  assign wire293 = (($unsigned(reg256[(2'h2):(1'h1)]) <= (~$unsigned((^~reg250)))) << $unsigned($signed((!$unsigned(reg277)))));
  assign wire294 = $signed(wire0);
endmodule

module module195
#(parameter param235 = ((8'hb7) ? (8'hb8) : ((({(8'hb0)} ? ((8'h9c) && (8'hb0)) : ((8'ha5) + (8'haa))) ^~ {{(8'hba), (7'h44)}}) ? (((~&(8'ha1)) ? ((7'h40) >>> (8'hbf)) : ((8'hb4) ? (8'hb4) : (8'hbf))) ? ((~&(8'hac)) ? ((8'hac) - (8'ha8)) : ((8'hb2) ? (8'ha5) : (8'hbb))) : (((8'ha2) ? (8'h9c) : (8'hb3)) >>> (~|(8'h9d)))) : ((+((8'hbe) ? (8'haf) : (7'h43))) ? (((8'ha7) || (8'hb0)) ? ((8'had) >= (8'hb6)) : (~&(8'hb3))) : (8'hbe)))), 
parameter param236 = (((8'hb5) ? (param235 ? param235 : {(param235 == param235), (param235 ? (8'hb6) : param235)}) : (|param235)) ^~ {(({param235, param235} ? {param235, param235} : (+param235)) ? (~&(param235 ^ (8'ha8))) : ((param235 <= param235) ? param235 : (param235 ? param235 : param235))), (((~param235) && param235) ? {{param235}} : {param235, (param235 ? (8'hbb) : param235)})}))
(y, clk, wire200, wire199, wire198, wire197, wire196);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire200;
  input wire [(4'hc):(1'h0)] wire199;
  input wire [(2'h3):(1'h0)] wire198;
  input wire signed [(3'h6):(1'h0)] wire197;
  input wire [(5'h13):(1'h0)] wire196;
  wire [(4'ha):(1'h0)] wire234;
  wire signed [(3'h4):(1'h0)] wire233;
  wire [(4'ha):(1'h0)] wire231;
  wire signed [(4'hd):(1'h0)] wire213;
  wire signed [(5'h10):(1'h0)] wire212;
  wire [(4'hf):(1'h0)] wire211;
  wire [(5'h13):(1'h0)] wire210;
  wire signed [(5'h12):(1'h0)] wire209;
  wire [(4'hb):(1'h0)] wire208;
  wire [(5'h13):(1'h0)] wire207;
  wire signed [(5'h13):(1'h0)] wire206;
  wire signed [(4'h8):(1'h0)] wire205;
  wire [(5'h11):(1'h0)] wire204;
  wire signed [(4'he):(1'h0)] wire203;
  wire [(5'h10):(1'h0)] wire202;
  wire [(3'h6):(1'h0)] wire201;
  assign y = {wire234,
                 wire233,
                 wire231,
                 wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 (1'h0)};
  assign wire201 = wire198[(1'h1):(1'h0)];
  assign wire202 = wire196;
  assign wire203 = $signed(wire202[(3'h6):(3'h4)]);
  assign wire204 = $signed($signed(wire200));
  assign wire205 = ((&wire202[(4'h8):(4'h8)]) << wire204[(4'hf):(1'h1)]);
  assign wire206 = ({$signed($signed((wire204 ? wire204 : (8'ha6)))),
                       $unsigned($signed($unsigned(wire201)))} >= $signed(wire200));
  assign wire207 = wire197[(2'h2):(1'h1)];
  assign wire208 = (~|$signed($signed((8'hb9))));
  assign wire209 = wire206[(1'h1):(1'h0)];
  assign wire210 = ((((+wire201) ^ (^~{wire198})) ?
                       (~|($signed(wire198) <= (+wire206))) : $unsigned(((wire199 ?
                               wire196 : (8'ha1)) ?
                           $signed(wire198) : (wire209 ?
                               wire203 : wire209)))) < wire203);
  assign wire211 = $unsigned($signed($unsigned(((wire207 ? wire203 : wire203) ?
                       (wire202 ? wire198 : wire196) : {wire206}))));
  assign wire212 = (((|$signed($unsigned(wire202))) > wire198[(1'h0):(1'h0)]) + $signed(({{wire211},
                       wire198} <= $signed($unsigned(wire206)))));
  assign wire213 = ($unsigned($signed(((&wire199) << (wire205 ?
                           wire200 : (8'hb3))))) ?
                       (($unsigned(wire196[(5'h11):(4'h9)]) ^ wire208) ?
                           wire199 : $signed((^(|wire210)))) : $unsigned(wire209[(4'he):(3'h4)]));
  module214 #() modinst232 (wire231, clk, wire211, wire208, wire204, wire196);
  assign wire233 = (($signed(((^~wire202) ?
                               (^~wire213) : (wire202 ? wire213 : wire206))) ?
                           $signed((|$signed(wire196))) : wire196) ?
                       (wire204[(1'h0):(1'h0)] ?
                           $signed(wire197) : (wire205[(2'h3):(2'h3)] << (^~(wire212 ?
                               (8'hb4) : (8'ha7))))) : (wire199[(3'h5):(1'h1)] ?
                           wire211 : {wire209[(4'h8):(3'h5)]}));
  assign wire234 = wire213[(1'h0):(1'h0)];
endmodule

module module36
#(parameter param189 = (-(((8'ha2) ? (8'h9f) : {(8'h9e)}) << {(+((8'hbd) ~^ (8'hba))), (((8'ha9) ? (8'ha4) : (8'hb7)) ? (-(8'hb0)) : ((8'hb8) ^ (8'ha0)))})), 
parameter param190 = ((~|{((^~param189) ? (~param189) : {param189, param189}), (param189 + (param189 + param189))}) | (8'ha4)))
(y, clk, wire37, wire38, wire39, wire40, wire41);
  output wire [(32'h12c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire37;
  input wire [(5'h13):(1'h0)] wire38;
  input wire signed [(4'he):(1'h0)] wire39;
  input wire [(5'h11):(1'h0)] wire40;
  input wire signed [(3'h5):(1'h0)] wire41;
  wire signed [(3'h5):(1'h0)] wire186;
  wire [(3'h6):(1'h0)] wire185;
  wire [(4'he):(1'h0)] wire184;
  wire [(5'h14):(1'h0)] wire183;
  wire [(3'h7):(1'h0)] wire182;
  wire [(5'h15):(1'h0)] wire181;
  wire [(4'hd):(1'h0)] wire180;
  wire [(5'h15):(1'h0)] wire179;
  wire signed [(4'ha):(1'h0)] wire178;
  wire signed [(4'ha):(1'h0)] wire177;
  wire signed [(5'h13):(1'h0)] wire42;
  wire [(5'h13):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire44;
  wire signed [(4'ha):(1'h0)] wire45;
  wire [(4'h8):(1'h0)] wire121;
  wire [(3'h6):(1'h0)] wire123;
  wire [(5'h12):(1'h0)] wire124;
  wire signed [(5'h14):(1'h0)] wire125;
  wire [(5'h12):(1'h0)] wire175;
  reg [(5'h11):(1'h0)] reg188 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg187 = (1'h0);
  assign y = {wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire42,
                 wire43,
                 wire44,
                 wire45,
                 wire121,
                 wire123,
                 wire124,
                 wire125,
                 wire175,
                 reg188,
                 reg187,
                 (1'h0)};
  assign wire42 = wire41[(1'h0):(1'h0)];
  assign wire43 = (^(-$unsigned($signed(wire39))));
  assign wire44 = ((|$signed(wire41[(3'h4):(1'h1)])) ^ ((8'h9d) | ($unsigned($signed(wire43)) ~^ wire38)));
  assign wire45 = wire44[(3'h7):(3'h4)];
  module46 #() modinst122 (.y(wire121), .clk(clk), .wire48(wire37), .wire47(wire45), .wire50(wire40), .wire49(wire38));
  assign wire123 = wire40;
  assign wire124 = {$unsigned(wire43[(4'he):(1'h1)]), wire42[(3'h4):(2'h2)]};
  assign wire125 = wire44;
  module126 #() modinst176 (.wire127(wire44), .wire130(wire42), .wire128(wire38), .y(wire175), .wire131(wire125), .clk(clk), .wire129(wire39));
  assign wire177 = (&$signed($unsigned({{wire42, wire39}})));
  assign wire178 = $unsigned((8'haa));
  assign wire179 = wire39[(4'h9):(4'h8)];
  assign wire180 = ((^~(wire41 ?
                       ({(7'h44),
                           wire125} * {wire38}) : wire121[(2'h2):(1'h0)])) << $signed(($unsigned(wire124[(4'hd):(4'h9)]) ?
                       $unsigned(((8'hbb) != (8'hbc))) : $unsigned((-(8'hbb))))));
  assign wire181 = (~|wire43);
  assign wire182 = (($unsigned($unsigned((wire44 && wire43))) ?
                           (wire37 ?
                               ((wire42 ? wire177 : (8'hb5)) ?
                                   wire37 : wire38[(5'h12):(1'h1)]) : ((^~wire42) == {wire39})) : $unsigned(($unsigned(wire179) - wire39[(4'h9):(3'h5)]))) ?
                       wire41 : $signed(({(wire40 ?
                               wire177 : wire179)} & $signed(wire121))));
  assign wire183 = (|$signed($unsigned(((^wire178) ? wire181 : (~^wire124)))));
  assign wire184 = $unsigned(wire38);
  assign wire185 = wire40[(4'hc):(1'h0)];
  assign wire186 = ($signed(($signed(wire175[(4'hb):(3'h6)]) * (8'haa))) || (wire177[(2'h3):(1'h0)] ^~ ({{wire123,
                               (8'hac)}} ?
                       wire37 : $signed((~|wire44)))));
  always
    @(posedge clk) begin
      reg187 <= wire43[(3'h7):(3'h5)];
      reg188 <= wire123;
    end
endmodule

module module4
#(parameter param33 = (+(((~(8'hb1)) ? (|((8'ha9) >>> (8'hbf))) : (+(8'had))) || ((((8'had) ? (8'ha1) : (8'h9c)) ~^ ((8'ha5) != (8'hb9))) ? (((8'ha4) ? (8'ha2) : (8'haf)) <= ((8'h9d) ~^ (8'ha5))) : (((7'h42) != (8'hbe)) ? (~^(8'hb9)) : ((8'had) * (8'hb7)))))))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'hfb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire7;
  input wire signed [(3'h7):(1'h0)] wire6;
  input wire signed [(4'hb):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire32;
  wire [(4'hf):(1'h0)] wire31;
  wire signed [(5'h15):(1'h0)] wire30;
  wire signed [(4'he):(1'h0)] wire29;
  wire [(2'h2):(1'h0)] wire28;
  wire signed [(3'h5):(1'h0)] wire27;
  wire [(3'h6):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire15;
  wire signed [(3'h6):(1'h0)] wire14;
  wire [(4'hd):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire10;
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  assign wire10 = ((((8'hb7) - $signed($signed(wire8))) > wire9) == $unsigned(wire7));
  assign wire11 = wire8[(5'h12):(5'h11)];
  assign wire12 = (wire8 ?
                      $signed((((wire7 ? wire8 : wire11) ?
                          ((8'hb0) ?
                              wire9 : wire10) : wire10[(2'h3):(1'h1)]) < wire8[(4'h9):(3'h6)])) : $unsigned($unsigned({wire9[(1'h1):(1'h0)]})));
  assign wire13 = $signed((+(wire11[(3'h7):(2'h3)] | $signed($unsigned(wire12)))));
  assign wire14 = {wire9, wire9};
  assign wire15 = $unsigned(wire9[(3'h6):(1'h0)]);
  assign wire16 = wire9[(3'h6):(2'h2)];
  assign wire17 = (wire13 ?
                      (7'h43) : (((~&$unsigned(wire16)) - {(+wire8),
                          {wire7}}) >>> wire11));
  always
    @(posedge clk) begin
      if ((^~wire8[(2'h3):(1'h0)]))
        begin
          reg18 <= (!((8'hbd) ?
              (&(wire5[(3'h7):(1'h0)] ^~ (wire6 ?
                  wire9 : wire9))) : ($signed($unsigned(wire15)) <<< ({wire8} ~^ wire16[(1'h0):(1'h0)]))));
          reg19 <= wire13[(2'h3):(1'h0)];
        end
      else
        begin
          reg18 <= (8'hbf);
          if ({($signed($unsigned((wire9 ?
                  wire11 : (8'hab)))) ^~ wire8[(5'h10):(3'h5)])})
            begin
              reg19 <= $signed(($signed($signed(wire9)) ?
                  (((reg18 ? wire9 : wire13) > {(8'hbe), (8'ha2)}) ?
                      wire10[(1'h0):(1'h0)] : $unsigned((wire14 ?
                          (7'h44) : wire6))) : (~|$signed((wire16 << (8'h9d))))));
            end
          else
            begin
              reg19 <= $signed({(~^$unsigned(reg19)),
                  (wire9[(3'h7):(3'h7)] ?
                      ({wire5, wire17} || (&reg18)) : wire6[(3'h7):(2'h3)])});
              reg20 <= $unsigned((~&($unsigned({(8'ha8),
                  wire5}) ^ $unsigned((wire11 ? (8'haa) : wire17)))));
              reg21 <= ($unsigned(wire9[(4'hb):(4'hb)]) != ($unsigned(wire11) == $signed(((~^wire15) || $unsigned(wire12)))));
            end
          reg22 <= $unsigned(($signed((((8'ha1) + wire17) >= wire14[(1'h1):(1'h1)])) || $signed(((~^reg20) ?
              $signed((8'hb9)) : (8'ha8)))));
          reg23 <= (8'ha6);
          reg24 <= $unsigned($signed({($unsigned(wire7) ?
                  $unsigned(reg18) : $signed(reg19))}));
        end
      reg25 <= wire11[(4'h9):(3'h6)];
      reg26 <= wire14;
    end
  assign wire27 = {wire6};
  assign wire28 = $signed((~|$unsigned($unsigned((reg24 * wire27)))));
  assign wire29 = wire9[(3'h6):(3'h6)];
  assign wire30 = (!wire6[(1'h0):(1'h0)]);
  assign wire31 = (~^(wire29 ?
                      $unsigned($signed($signed(wire6))) : $unsigned(($unsigned(wire12) >> (reg23 > reg18)))));
  assign wire32 = wire30;
endmodule

module module126
#(parameter param173 = {(8'hba)}, 
parameter param174 = ((~&((param173 | param173) & {param173, (param173 ? param173 : param173)})) ? {(param173 << (param173 <<< (~&param173)))} : (8'hae)))
(y, clk, wire131, wire130, wire129, wire128, wire127);
  output wire [(32'h1e1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire131;
  input wire [(5'h13):(1'h0)] wire130;
  input wire [(4'he):(1'h0)] wire129;
  input wire signed [(3'h7):(1'h0)] wire128;
  input wire signed [(3'h4):(1'h0)] wire127;
  wire signed [(4'hd):(1'h0)] wire162;
  wire [(5'h15):(1'h0)] wire161;
  wire [(5'h15):(1'h0)] wire160;
  wire [(2'h2):(1'h0)] wire151;
  wire signed [(3'h6):(1'h0)] wire150;
  wire [(5'h14):(1'h0)] wire149;
  wire [(5'h10):(1'h0)] wire147;
  wire signed [(5'h10):(1'h0)] wire146;
  wire signed [(2'h2):(1'h0)] wire144;
  wire signed [(4'he):(1'h0)] wire143;
  wire signed [(5'h11):(1'h0)] wire142;
  wire signed [(5'h14):(1'h0)] wire141;
  wire signed [(5'h10):(1'h0)] wire140;
  wire signed [(2'h3):(1'h0)] wire132;
  reg [(4'hb):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg171 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg170 = (1'h0);
  reg [(3'h4):(1'h0)] reg169 = (1'h0);
  reg [(2'h3):(1'h0)] reg168 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg167 = (1'h0);
  reg [(3'h6):(1'h0)] reg166 = (1'h0);
  reg [(4'h8):(1'h0)] reg165 = (1'h0);
  reg [(2'h2):(1'h0)] reg164 = (1'h0);
  reg [(3'h4):(1'h0)] reg163 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg159 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg158 = (1'h0);
  reg [(4'hf):(1'h0)] reg157 = (1'h0);
  reg [(5'h13):(1'h0)] reg156 = (1'h0);
  reg [(5'h15):(1'h0)] reg155 = (1'h0);
  reg [(5'h13):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg153 = (1'h0);
  reg [(4'ha):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg148 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg145 = (1'h0);
  reg [(2'h2):(1'h0)] reg139 = (1'h0);
  reg [(4'hb):(1'h0)] reg138 = (1'h0);
  reg [(5'h12):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg135 = (1'h0);
  reg [(3'h6):(1'h0)] reg134 = (1'h0);
  reg [(4'he):(1'h0)] reg133 = (1'h0);
  assign y = {wire162,
                 wire161,
                 wire160,
                 wire151,
                 wire150,
                 wire149,
                 wire147,
                 wire146,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire132,
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
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg148,
                 reg145,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 (1'h0)};
  assign wire132 = wire127;
  always
    @(posedge clk) begin
      reg133 <= $signed(wire130[(5'h13):(4'he)]);
      if ((~|$unsigned(($unsigned({wire132, wire131}) ^~ wire129))))
        begin
          reg134 <= ((^$unsigned(wire127)) > (wire128 * {$unsigned($unsigned(wire131))}));
          reg135 <= (wire128[(3'h7):(1'h0)] ?
              $unsigned((((wire132 ? wire127 : wire127) ?
                  $signed(wire127) : (wire129 + (7'h41))) == $unsigned(reg133))) : $unsigned(((+$unsigned(wire131)) ?
                  ((!wire127) && (~|wire130)) : (reg133 ?
                      $signed(reg133) : $signed(wire131)))));
        end
      else
        begin
          reg134 <= $unsigned($unsigned(reg133[(4'hb):(1'h1)]));
          reg135 <= reg133[(1'h0):(1'h0)];
          if ($signed((($signed({(7'h40)}) ?
              wire128 : $unsigned(((8'hbf) ^ wire131))) > $signed($unsigned((reg133 ^~ wire127))))))
            begin
              reg136 <= (wire131[(2'h2):(2'h2)] != ((^$signed(wire127)) >> {{wire132[(2'h2):(2'h2)],
                      ((8'hab) & (8'hb6))}}));
              reg137 <= ((reg136[(4'h8):(3'h5)] < reg133) ?
                  (~^(&$signed($signed((8'hb5))))) : (^$signed($signed($unsigned(wire128)))));
            end
          else
            begin
              reg136 <= $unsigned((~|(|((reg137 && wire129) * {reg133}))));
              reg137 <= ($unsigned(reg135[(4'h9):(1'h0)]) ?
                  reg133 : ($unsigned($signed((reg135 != reg134))) ?
                      $signed(wire127) : reg137));
              reg138 <= $signed((~^$unsigned($unsigned((^reg135)))));
              reg139 <= {({$signed((^reg136))} >= ((&wire132[(1'h1):(1'h1)]) <<< $unsigned(reg135[(4'h8):(2'h3)]))),
                  reg136};
            end
        end
    end
  assign wire140 = wire130[(3'h7):(3'h4)];
  assign wire141 = wire132;
  assign wire142 = wire129;
  assign wire143 = ($signed((((~&wire141) ?
                           (reg139 && wire142) : reg137[(1'h1):(1'h1)]) ^ {wire127,
                           (reg134 + reg136)})) ?
                       $unsigned(wire142[(4'he):(4'h9)]) : wire140);
  assign wire144 = {wire128,
                       $unsigned((({wire127, wire140} >> ((8'hab) | reg135)) ?
                           {reg135} : (wire131[(2'h2):(1'h0)] | $signed((8'ha8)))))};
  always
    @(posedge clk) begin
      reg145 <= $signed($unsigned({$unsigned(reg139[(1'h0):(1'h0)]),
          (~|(reg133 || wire142))}));
    end
  assign wire146 = (wire142[(3'h4):(2'h2)] ?
                       (^~(~^$unsigned($signed(wire142)))) : $unsigned($signed($signed((reg134 ?
                           reg137 : wire144)))));
  assign wire147 = {wire130, wire140};
  always
    @(posedge clk) begin
      reg148 <= (~$unsigned(wire140[(4'he):(4'hc)]));
    end
  assign wire149 = $unsigned(((~^{reg139, reg139[(1'h0):(1'h0)]}) ?
                       {(((8'hbf) ? wire142 : wire130) ?
                               $unsigned(reg134) : (reg139 ?
                                   (8'hb9) : (8'hb9))),
                           $unsigned({wire144})} : (wire131 == ($unsigned(wire147) ?
                           $unsigned(reg135) : (^wire147)))));
  assign wire150 = (~&$signed($unsigned((7'h40))));
  assign wire151 = $unsigned((~wire131));
  always
    @(posedge clk) begin
      if ((&$signed(((wire142 && (^~wire144)) < (|wire129)))))
        begin
          reg152 <= ($signed(reg138[(1'h0):(1'h0)]) >= reg148);
          reg153 <= ($unsigned(wire141[(4'hd):(4'ha)]) * $unsigned($signed(wire141)));
          reg154 <= wire132;
          reg155 <= reg134;
          reg156 <= $unsigned(($unsigned($signed(wire142[(1'h1):(1'h1)])) | {$unsigned($unsigned(wire147))}));
        end
      else
        begin
          if ((8'hb5))
            begin
              reg152 <= $unsigned($signed($signed($unsigned({wire128}))));
              reg153 <= {(~|$unsigned((reg145 > ((8'hb9) ?
                      wire144 : wire127)))),
                  (((^~(~^wire140)) ?
                      (wire151 >= {wire141}) : ($signed(reg154) ?
                          (|reg133) : (wire131 != reg134))) << (|{(~|reg154)}))};
              reg154 <= ($unsigned(($signed({wire144, wire127}) ?
                  $signed(reg155) : $unsigned((&reg155)))) ~^ $signed(wire141[(3'h5):(3'h4)]));
              reg155 <= ({$signed(reg148),
                  $unsigned((8'ha4))} >> ($unsigned({wire142}) ?
                  reg137 : (^($unsigned(reg139) ?
                      (~reg138) : $signed(reg155)))));
              reg156 <= (&wire128);
            end
          else
            begin
              reg152 <= $signed($unsigned($signed(((reg136 ?
                  wire140 : wire150) >>> $signed(wire131)))));
              reg153 <= ($unsigned(wire149[(4'hc):(4'hc)]) ?
                  (($signed($signed((8'ha4))) ?
                      (8'hb8) : (^wire151)) || wire141[(4'hd):(1'h0)]) : {(|wire149[(3'h4):(1'h0)])});
              reg154 <= ($unsigned(wire127) || (|((~|(~^reg136)) & ($unsigned(wire144) && (wire132 ?
                  wire130 : wire149)))));
              reg155 <= (^reg137);
            end
          reg157 <= wire128;
        end
      reg158 <= (reg138[(1'h1):(1'h0)] >> (reg137[(3'h6):(1'h0)] ?
          $signed(reg134) : {((+reg134) ?
                  (reg148 ? reg157 : reg139) : (wire144 ? wire149 : wire140)),
              $unsigned(wire144[(1'h0):(1'h0)])}));
      reg159 <= reg156;
    end
  assign wire160 = (8'hb0);
  assign wire161 = $unsigned($unsigned((|((wire132 ? reg145 : (8'ha3)) ?
                       $signed(reg134) : (8'hac)))));
  assign wire162 = (8'hbc);
  always
    @(posedge clk) begin
      if ($signed($signed($unsigned($unsigned(reg137)))))
        begin
          reg163 <= $unsigned($unsigned(wire147[(3'h6):(2'h3)]));
          reg164 <= $signed((({wire128[(3'h5):(3'h5)]} ?
                  {((8'ha6) ? (8'ha6) : wire144),
                      (wire131 ? reg155 : wire127)} : wire162) ?
              wire142 : (8'ha8)));
          reg165 <= reg157;
        end
      else
        begin
          if (($signed($signed(reg148)) ~^ (((((8'hb5) != (8'hbe)) ?
              wire149 : ((8'hab) - (7'h44))) >>> wire144) + (-((reg165 ?
                  reg133 : reg136) ?
              $unsigned((8'hb8)) : ((8'ha6) ? reg139 : wire162))))))
            begin
              reg163 <= ($signed((reg138[(4'ha):(3'h7)] ?
                  ($signed(wire141) ~^ ((8'h9e) ?
                      (8'hbd) : wire146)) : $unsigned((wire149 ?
                      reg159 : (8'hb1))))) >>> (-$signed(((wire150 ?
                  reg136 : wire161) & ((8'ha9) != (8'ha8))))));
              reg164 <= ({{((wire149 >>> wire149) >> (+wire131)),
                      $unsigned($unsigned(reg154))}} ^ {$unsigned(reg148)});
            end
          else
            begin
              reg163 <= ({(wire143[(4'hb):(1'h0)] ?
                          ($unsigned(wire140) ?
                              (wire129 ~^ wire144) : (reg136 ^~ (8'h9c))) : {reg165[(3'h6):(1'h1)],
                              (&wire151)}),
                      $unsigned(((^~reg134) ?
                          (+wire143) : $unsigned(reg139)))} ?
                  {$signed(($signed(reg155) ?
                          {wire142, reg155} : $unsigned(wire160))),
                      (($signed(reg139) ?
                          (wire131 != wire161) : (^wire150)) ^~ $signed((wire127 ?
                          reg164 : reg152)))} : ($unsigned(($unsigned((8'hb6)) ?
                          (~^reg163) : {wire141})) ?
                      $signed((~wire140[(3'h5):(3'h5)])) : {(8'hb0),
                          wire132[(1'h1):(1'h0)]}));
              reg164 <= $unsigned(wire161);
            end
          if ((reg164[(1'h1):(1'h0)] ?
              ($signed(((wire130 != wire147) ?
                  $unsigned(reg135) : wire150[(3'h4):(3'h4)])) > (({reg156} ?
                  $signed(reg153) : ((8'h9c) ?
                      wire142 : wire160)) >>> (!$unsigned(reg135)))) : wire127[(1'h1):(1'h1)]))
            begin
              reg165 <= $signed(wire162);
              reg166 <= $signed(reg155);
              reg167 <= reg156[(1'h1):(1'h0)];
              reg168 <= (!$unsigned(((reg139[(1'h1):(1'h1)] - ((8'hb2) ?
                  reg136 : wire140)) <= (((7'h44) * wire129) != wire161[(4'h9):(1'h1)]))));
            end
          else
            begin
              reg165 <= ((($signed((wire143 & wire128)) >>> wire144[(2'h2):(1'h0)]) ?
                      (-wire127[(3'h4):(3'h4)]) : (^((-reg145) ?
                          (!wire162) : (wire147 ? wire151 : reg156)))) ?
                  ({$signed($signed(wire147)), (!wire140)} + (&{(reg164 ?
                          reg167 : (8'hb7))})) : (+({$signed(reg165)} ?
                      $signed((&wire149)) : reg138)));
            end
          reg169 <= wire142;
          reg170 <= (^wire132);
        end
      reg171 <= ({{$signed((reg136 && wire149))}} >> $signed(reg139[(1'h0):(1'h0)]));
      reg172 <= (^~(wire146[(3'h5):(3'h5)] ? $unsigned(reg167) : wire130));
    end
endmodule

module module46
#(parameter param119 = (&{((((8'hb6) ? (8'hb3) : (8'hbb)) < ((8'hbb) ? (8'hae) : (8'hbc))) <= {(|(8'h9e)), ((8'ha5) << (8'hbf))})}), 
parameter param120 = param119)
(y, clk, wire50, wire49, wire48, wire47);
  output wire [(32'h2c7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire50;
  input wire [(4'h8):(1'h0)] wire49;
  input wire signed [(5'h14):(1'h0)] wire48;
  input wire [(3'h6):(1'h0)] wire47;
  wire [(3'h6):(1'h0)] wire118;
  wire [(4'h9):(1'h0)] wire117;
  wire [(4'hd):(1'h0)] wire116;
  wire [(4'hd):(1'h0)] wire104;
  wire [(2'h3):(1'h0)] wire84;
  wire [(3'h6):(1'h0)] wire83;
  wire signed [(3'h5):(1'h0)] wire82;
  wire [(4'h8):(1'h0)] wire81;
  wire [(3'h4):(1'h0)] wire80;
  wire signed [(5'h13):(1'h0)] wire73;
  wire signed [(3'h7):(1'h0)] wire59;
  wire signed [(4'hd):(1'h0)] wire58;
  wire [(3'h6):(1'h0)] wire57;
  wire signed [(5'h12):(1'h0)] wire56;
  wire signed [(4'h9):(1'h0)] wire55;
  wire [(3'h6):(1'h0)] wire54;
  wire [(5'h13):(1'h0)] wire53;
  wire signed [(5'h12):(1'h0)] wire52;
  wire [(4'h9):(1'h0)] wire51;
  reg [(4'hf):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg114 = (1'h0);
  reg [(3'h7):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg112 = (1'h0);
  reg [(4'h9):(1'h0)] reg111 = (1'h0);
  reg [(4'h8):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg109 = (1'h0);
  reg [(2'h3):(1'h0)] reg108 = (1'h0);
  reg [(4'hc):(1'h0)] reg107 = (1'h0);
  reg [(5'h14):(1'h0)] reg106 = (1'h0);
  reg [(2'h2):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg102 = (1'h0);
  reg [(4'he):(1'h0)] reg101 = (1'h0);
  reg [(3'h5):(1'h0)] reg100 = (1'h0);
  reg [(5'h12):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg96 = (1'h0);
  reg [(3'h7):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg93 = (1'h0);
  reg [(4'hd):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg90 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg89 = (1'h0);
  reg [(4'h9):(1'h0)] reg88 = (1'h0);
  reg signed [(4'he):(1'h0)] reg87 = (1'h0);
  reg [(4'h8):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg77 = (1'h0);
  reg [(2'h3):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  reg [(3'h4):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg70 = (1'h0);
  reg [(4'ha):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg68 = (1'h0);
  reg [(4'hd):(1'h0)] reg67 = (1'h0);
  reg [(3'h6):(1'h0)] reg66 = (1'h0);
  reg [(5'h10):(1'h0)] reg65 = (1'h0);
  reg [(2'h2):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg60 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire104,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire73,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
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
                 reg87,
                 reg86,
                 reg85,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
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
                 (1'h0)};
  assign wire51 = $unsigned(($signed((~&wire48)) <<< wire48[(5'h11):(4'he)]));
  assign wire52 = (~|(|wire50));
  assign wire53 = wire49;
  assign wire54 = wire53;
  assign wire55 = (8'hb5);
  assign wire56 = $unsigned(wire48[(4'hb):(2'h2)]);
  assign wire57 = wire54;
  assign wire58 = wire54[(1'h1):(1'h0)];
  assign wire59 = $signed($unsigned($signed($signed((wire49 >= wire53)))));
  always
    @(posedge clk) begin
      if ((^~$signed(wire50)))
        begin
          if (wire51)
            begin
              reg60 <= ($signed({($unsigned(wire57) & (wire48 ?
                      wire56 : wire57)),
                  wire51[(4'h9):(3'h4)]}) && wire52[(3'h4):(3'h4)]);
              reg61 <= {((((~|(8'hb3)) <= $signed(wire57)) ?
                      wire48[(1'h1):(1'h1)] : (((8'hb2) ?
                          wire54 : wire54) & reg60)) <<< (($unsigned(wire49) + (^~wire50)) > (8'hba)))};
              reg62 <= ((^~((|(wire47 ?
                      wire51 : wire52)) | $unsigned(wire48))) ?
                  $unsigned(wire59[(3'h7):(3'h4)]) : {(reg61[(4'hd):(4'hb)] >= wire54),
                      (!($unsigned(wire47) ?
                          ((8'hb9) ? (8'ha8) : wire56) : ((8'ha9) ?
                              wire54 : wire48)))});
              reg63 <= reg61;
            end
          else
            begin
              reg60 <= wire58[(3'h5):(2'h3)];
            end
          reg64 <= wire47[(1'h0):(1'h0)];
          reg65 <= $unsigned(wire50[(4'h9):(4'h9)]);
          if (reg60[(2'h2):(1'h0)])
            begin
              reg66 <= (((wire56 > {wire48}) ?
                      (!((~^reg60) ?
                          $signed(reg61) : $unsigned(wire51))) : $unsigned(reg60[(2'h2):(1'h1)])) ?
                  $signed(reg64) : wire52[(5'h10):(3'h7)]);
              reg67 <= ($signed((((~|wire49) ?
                      (wire51 && wire51) : (wire58 << wire53)) >> wire57[(3'h6):(1'h1)])) ?
                  {reg65} : reg61);
              reg68 <= (wire53[(5'h12):(5'h11)] && wire55);
              reg69 <= reg67[(4'hb):(3'h4)];
            end
          else
            begin
              reg66 <= (~^wire55[(4'h8):(1'h0)]);
              reg67 <= ((($unsigned({wire48}) ?
                  $signed((wire54 + reg63)) : $signed({reg69,
                      wire51})) == ($signed((~reg60)) <<< $signed(wire52[(3'h6):(2'h2)]))) >>> $unsigned((^~((wire58 ?
                  wire50 : reg64) + ((8'ha9) ? wire52 : (8'hab))))));
              reg68 <= ($unsigned((~&wire48)) ?
                  wire54[(1'h0):(1'h0)] : $signed($signed($unsigned(reg65))));
            end
        end
      else
        begin
          reg60 <= $signed((^~(wire53 - wire58[(3'h4):(3'h4)])));
          reg61 <= ((&(|((|(8'hbb)) ? {wire57, reg66} : $signed(reg67)))) ?
              wire54[(2'h3):(1'h0)] : reg66[(1'h0):(1'h0)]);
          reg62 <= reg66[(3'h5):(3'h4)];
          if ({{wire51[(3'h5):(1'h0)], $unsigned(($signed(wire48) && wire48))},
              $unsigned($signed($signed((wire59 ? reg64 : (8'haa)))))})
            begin
              reg63 <= wire50[(1'h1):(1'h0)];
              reg64 <= ($signed(((wire57 * $signed((7'h41))) ~^ $unsigned((reg65 ^ wire59)))) + wire54[(3'h5):(3'h4)]);
              reg65 <= reg69;
              reg66 <= ({(($signed(wire55) ?
                              $signed(wire54) : $unsigned(reg65)) ?
                          (^~reg69) : $signed(reg62[(1'h0):(1'h0)]))} ?
                  (8'h9c) : reg68[(4'hd):(3'h4)]);
            end
          else
            begin
              reg63 <= (~^(7'h41));
              reg64 <= reg65;
              reg65 <= wire52;
            end
        end
      reg70 <= reg61;
      reg71 <= (~$unsigned(reg61[(1'h1):(1'h0)]));
      if (((&$signed((8'hbe))) <<< ((!$signed($unsigned(wire50))) ?
          (8'ha5) : reg63)))
        begin
          reg72 <= $signed(wire57);
        end
      else
        begin
          reg72 <= $signed($signed((~^$signed($unsigned((8'ha7))))));
        end
    end
  assign wire73 = ((wire58[(2'h3):(1'h0)] ?
                      $unsigned(wire53) : reg72[(4'h9):(1'h1)]) >>> reg61);
  always
    @(posedge clk) begin
      if (wire58)
        begin
          reg74 <= wire56[(4'hf):(4'hf)];
          reg75 <= $signed((((+(reg65 << wire55)) > $unsigned(wire54)) | {(+(^~(8'hb7)))}));
          reg76 <= (($signed({(wire58 ?
                  reg69 : wire59)}) && (~($unsigned(reg75) ?
              {wire51,
                  reg66} : wire51[(3'h5):(1'h0)]))) && reg65[(4'h9):(1'h0)]);
          reg77 <= (($unsigned((reg67[(3'h5):(3'h4)] ?
                  (wire56 ^~ reg64) : (8'ha0))) ?
              (~$signed((wire52 ?
                  reg60 : wire57))) : $unsigned(wire53[(3'h7):(3'h4)])) <= reg65);
        end
      else
        begin
          reg74 <= $signed((~|$signed(wire51[(4'h8):(1'h0)])));
          reg75 <= $signed((!($unsigned({reg77}) >>> ((wire48 ?
              (8'ha4) : reg65) != (-reg68)))));
          reg76 <= $signed($unsigned($unsigned(wire47)));
          reg77 <= (+($unsigned(reg77[(3'h4):(2'h3)]) ^~ reg68));
        end
      reg78 <= $unsigned(wire57[(2'h3):(1'h0)]);
      reg79 <= (wire52 ?
          $signed((reg77 ?
              wire52[(4'hd):(2'h3)] : wire52)) : $unsigned((wire53[(4'he):(4'h9)] ?
              $unsigned(wire73[(3'h7):(2'h3)]) : (7'h41))));
    end
  assign wire80 = reg79;
  assign wire81 = $signed($unsigned(($signed({wire51, reg69}) ?
                      reg72 : $unsigned(wire54[(1'h0):(1'h0)]))));
  assign wire82 = (^~(&(($unsigned(wire80) && (wire73 == reg69)) ?
                      (8'hb2) : $unsigned((+wire50)))));
  assign wire83 = ((^~$signed(((&wire49) & $signed(wire53)))) * $signed(wire82[(2'h2):(1'h1)]));
  assign wire84 = wire83;
  always
    @(posedge clk) begin
      reg85 <= (+$unsigned((!(wire82 || (reg71 || reg78)))));
      reg86 <= $unsigned({wire55[(1'h1):(1'h1)]});
      if (((!wire83[(3'h4):(2'h3)]) ?
          (({wire50, (reg77 + wire49)} ?
                  {wire81[(3'h5):(2'h3)]} : {reg67[(4'h9):(3'h7)]}) ?
              reg70 : wire58[(3'h5):(1'h1)]) : ($unsigned($signed((wire47 ?
              reg69 : wire48))) ^ (^~$unsigned((+reg63))))))
        begin
          reg87 <= ((+wire80[(2'h3):(2'h3)]) << (^$unsigned(wire55)));
        end
      else
        begin
          if (reg60)
            begin
              reg87 <= {($unsigned({reg75}) ?
                      (reg68[(3'h5):(2'h2)] ?
                          ((8'hb5) >> wire59[(1'h1):(1'h0)]) : wire56) : ($signed($signed(wire83)) > (reg67[(1'h1):(1'h1)] << reg68))),
                  reg70};
              reg88 <= $unsigned($unsigned($unsigned(reg68[(3'h7):(1'h0)])));
              reg89 <= (~^($signed((reg60 ?
                  ((8'hb7) ?
                      (8'haf) : reg63) : reg61[(3'h5):(3'h4)])) ^~ (8'hba)));
              reg90 <= $unsigned($signed($unsigned(reg86)));
              reg91 <= reg78;
            end
          else
            begin
              reg87 <= (reg90 == ($signed($unsigned(reg79[(3'h6):(2'h2)])) || (!{(wire47 - reg60),
                  reg85})));
              reg88 <= reg69;
              reg89 <= (((((|reg75) ? $unsigned(reg61) : {(8'h9c)}) ?
                  $unsigned({reg89}) : wire47[(3'h6):(1'h1)]) ^~ (!($signed(reg75) ?
                  (~&reg89) : (&wire47)))) < {wire58,
                  $signed(($signed(reg64) || (reg63 ? reg79 : wire55)))});
            end
          reg92 <= ($unsigned(($unsigned({wire51}) ?
                  wire54[(3'h6):(1'h0)] : (wire47 ?
                      reg91[(4'h9):(4'h8)] : (^(8'hb7))))) ?
              {(~&((8'hab) || $unsigned(reg69))),
                  (+((reg78 ? wire54 : wire84) ?
                      (8'hb7) : ((8'haa) + (7'h42))))} : (~&wire80));
          reg93 <= (^(~^{reg85}));
          reg94 <= reg67;
        end
      if (wire57)
        begin
          reg95 <= wire56[(4'h8):(3'h7)];
          if (reg75)
            begin
              reg96 <= $signed(((((reg62 >>> wire84) + (8'hbd)) | ((~|reg67) ?
                  (8'h9f) : (~&reg74))) >> (&(~((8'h9e) ^ reg94)))));
              reg97 <= reg78;
            end
          else
            begin
              reg96 <= wire59[(3'h7):(1'h0)];
              reg97 <= (|(^~wire57));
              reg98 <= ($signed((~$signed((wire82 >>> reg97)))) ?
                  reg67[(3'h7):(3'h4)] : {(~$unsigned(wire73))});
              reg99 <= reg86[(4'h8):(3'h5)];
            end
          reg100 <= ((8'hab) ?
              $unsigned($unsigned(reg68[(4'hc):(4'hc)])) : ({reg61[(5'h12):(4'h8)]} & (reg77 ^ reg99[(4'he):(3'h7)])));
          reg101 <= {(~|$signed($signed($signed(reg96)))), (|(wire84 * reg67))};
          reg102 <= $unsigned(((($signed(wire47) ?
                      reg71 : (wire47 ? reg100 : reg77)) ?
                  $signed($unsigned(reg98)) : $signed($signed(reg79))) ?
              {$unsigned($unsigned(reg98))} : ($signed((reg98 ?
                  wire48 : reg99)) << wire58[(4'hd):(4'h9)])));
        end
      else
        begin
          reg95 <= ((!$signed((reg90[(3'h4):(2'h3)] >>> (~^(8'hb4))))) ?
              reg87 : $unsigned(reg60));
          reg96 <= (reg90 | (~&(((~^wire47) ?
                  $unsigned(reg90) : ((8'ha2) < reg74)) ?
              (reg71[(2'h3):(1'h1)] <= $signed(wire57)) : wire56[(1'h0):(1'h0)])));
          reg97 <= (({({wire73, reg85} ? (-reg93) : reg74),
                  ($signed(reg64) ? (wire73 - wire55) : {reg95})} ?
              (wire81[(3'h6):(3'h6)] == (~&reg79)) : {$unsigned((wire73 <<< reg62)),
                  ($unsigned(reg87) ?
                      (|reg87) : wire58[(1'h0):(1'h0)])}) != reg99);
        end
      reg103 <= (reg76 < (+({$unsigned(wire48), (wire47 ? wire51 : wire55)} ?
          $signed((reg97 >> reg71)) : ($unsigned((8'hb1)) << reg97))));
    end
  assign wire104 = ($unsigned(((~(wire55 ? (8'ha6) : reg92)) ?
                       (~$signed(wire48)) : (wire80[(1'h1):(1'h0)] ?
                           reg85 : reg78[(4'hf):(4'hb)]))) >= reg78);
  always
    @(posedge clk) begin
      reg105 <= wire56[(5'h11):(4'h8)];
      reg106 <= (~$signed((!reg60[(1'h1):(1'h0)])));
      if (reg72)
        begin
          if ((8'hbc))
            begin
              reg107 <= $unsigned((!reg62[(1'h0):(1'h0)]));
              reg108 <= $signed((-wire59));
            end
          else
            begin
              reg107 <= {reg106};
              reg108 <= (^$unsigned(reg99[(4'hf):(3'h5)]));
              reg109 <= reg100;
              reg110 <= (($unsigned({(wire104 > reg103)}) == ($signed(reg76) << reg69)) <<< ((((~^reg101) & $unsigned(reg95)) ?
                  (~|$unsigned(reg78)) : (reg67 ?
                      (reg72 ?
                          reg88 : reg79) : $signed((8'hb6)))) - $signed(reg88[(1'h1):(1'h0)])));
              reg111 <= {((wire58 ? wire83 : $unsigned($signed(wire73))) ?
                      wire57 : ($signed((reg101 ? reg78 : reg92)) ?
                          ($unsigned(reg91) < (^~reg90)) : ((8'hb5) >>> reg94[(4'hc):(3'h7)])))};
            end
          reg112 <= (($unsigned((^~wire55)) ?
                  $signed(reg105[(2'h2):(1'h1)]) : reg98) ?
              ($signed((|{reg91, reg95})) ?
                  {(reg65 ? (8'hb1) : $unsigned(reg88)),
                      {{reg69, wire82}, (reg87 + reg107)}} : (reg85 ?
                      (wire83[(3'h5):(1'h1)] >= $signed((8'hb7))) : reg99[(5'h10):(1'h1)])) : wire49);
          reg113 <= $unsigned(reg75[(3'h4):(2'h3)]);
          reg114 <= reg108;
        end
      else
        begin
          reg107 <= {(^{{reg69, $unsigned(reg65)},
                  (reg106[(5'h14):(4'hb)] <= reg101[(4'ha):(2'h3)])}),
              (!($signed({reg97}) ?
                  ((wire73 ? reg74 : reg97) >> (reg106 ?
                      reg77 : reg114)) : {$unsigned(reg99),
                      (reg60 ? reg74 : reg86)}))};
        end
      reg115 <= (-reg105[(1'h1):(1'h0)]);
    end
  assign wire116 = reg60;
  assign wire117 = reg103[(5'h12):(4'he)];
  assign wire118 = (~&$unsigned($unsigned(wire81[(3'h6):(3'h5)])));
endmodule

module module214
#(parameter param229 = (-(~|(8'ha8))), 
parameter param230 = (param229 ? param229 : ((((param229 ? (8'hb8) : param229) ^ (param229 <= param229)) ~^ ((|param229) ? (param229 ^ (8'hb8)) : {(8'hbc), param229})) && (param229 ? param229 : param229))))
(y, clk, wire218, wire217, wire216, wire215);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire218;
  input wire signed [(4'h9):(1'h0)] wire217;
  input wire signed [(3'h6):(1'h0)] wire216;
  input wire [(4'h9):(1'h0)] wire215;
  wire signed [(5'h13):(1'h0)] wire228;
  wire [(4'h8):(1'h0)] wire227;
  wire signed [(4'hb):(1'h0)] wire223;
  wire [(2'h3):(1'h0)] wire222;
  wire [(3'h7):(1'h0)] wire221;
  wire [(4'ha):(1'h0)] wire220;
  wire signed [(5'h15):(1'h0)] wire219;
  reg [(5'h14):(1'h0)] reg226 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg225 = (1'h0);
  reg [(2'h3):(1'h0)] reg224 = (1'h0);
  assign y = {wire228,
                 wire227,
                 wire223,
                 wire222,
                 wire221,
                 wire220,
                 wire219,
                 reg226,
                 reg225,
                 reg224,
                 (1'h0)};
  assign wire219 = (7'h42);
  assign wire220 = {{wire218[(2'h3):(2'h3)]}};
  assign wire221 = wire218[(3'h4):(2'h3)];
  assign wire222 = wire219;
  assign wire223 = $unsigned(((((wire216 ?
                           wire220 : wire221) >>> $signed(wire221)) * wire218) ?
                       (^(~(wire217 ?
                           wire217 : wire218))) : ((~^(~^wire215)) + ($unsigned(wire221) ?
                           (+wire215) : (wire220 ? wire218 : (8'hbb))))));
  always
    @(posedge clk) begin
      reg224 <= (wire218[(3'h5):(2'h2)] ?
          $signed((^~$signed((wire222 & wire218)))) : $unsigned((7'h40)));
      reg225 <= (|$signed((7'h42)));
      reg226 <= (~&wire217[(1'h1):(1'h1)]);
    end
  assign wire227 = $unsigned({wire218[(2'h3):(1'h0)]});
  assign wire228 = ($unsigned(reg224) ?
                       wire215 : {(~$signed($signed((8'hb2)))),
                           (wire220 <<< $signed($signed((8'hb6))))});
endmodule
