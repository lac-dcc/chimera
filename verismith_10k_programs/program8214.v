module top
#(parameter param297 = (^{((8'ha4) ? (!(!(7'h41))) : {((7'h44) ? (8'hb0) : (8'hae)), (+(8'hbd))}), (+((8'ha6) <<< ((8'hbc) < (8'hb7))))}), 
parameter param298 = (8'hb4))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1b4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire [(5'h13):(1'h0)] wire296;
  wire [(5'h15):(1'h0)] wire290;
  wire signed [(4'h8):(1'h0)] wire289;
  wire [(4'ha):(1'h0)] wire271;
  wire signed [(5'h15):(1'h0)] wire270;
  wire [(5'h11):(1'h0)] wire268;
  wire signed [(4'h9):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire167;
  wire [(2'h2):(1'h0)] wire292;
  wire signed [(5'h11):(1'h0)] wire293;
  wire signed [(5'h10):(1'h0)] wire294;
  reg [(2'h2):(1'h0)] reg272 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg273 = (1'h0);
  reg [(5'h11):(1'h0)] reg274 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg275 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg276 = (1'h0);
  reg [(5'h14):(1'h0)] reg277 = (1'h0);
  reg [(4'hc):(1'h0)] reg278 = (1'h0);
  reg [(5'h10):(1'h0)] reg279 = (1'h0);
  reg [(5'h14):(1'h0)] reg280 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg281 = (1'h0);
  reg [(5'h10):(1'h0)] reg282 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg283 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg284 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg285 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg286 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg287 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg288 = (1'h0);
  assign y = {wire296,
                 wire290,
                 wire289,
                 wire271,
                 wire270,
                 wire268,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire167,
                 wire292,
                 wire293,
                 wire294,
                 reg272,
                 reg273,
                 reg274,
                 reg275,
                 reg276,
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
                 (1'h0)};
  assign wire4 = (!wire2);
  assign wire5 = (wire1[(4'hd):(1'h1)] ?
                     (|{((8'hac) || wire3),
                         $unsigned((~&wire1))}) : $signed(wire1[(3'h4):(2'h3)]));
  assign wire6 = $unsigned(wire1[(4'hd):(3'h5)]);
  assign wire7 = (wire1 ? (8'ha9) : wire1[(4'hb):(3'h7)]);
  module8 #() modinst168 (wire167, clk, wire3, wire6, wire5, wire0, wire2);
  module169 #() modinst269 (wire268, clk, wire5, wire167, wire3, wire1);
  assign wire270 = $unsigned({(~|$unsigned($signed(wire2)))});
  assign wire271 = $signed(wire270);
  always
    @(posedge clk) begin
      reg272 <= wire2[(1'h1):(1'h0)];
      reg273 <= ({{wire271}, $signed(wire6[(3'h4):(1'h1)])} ~^ wire1);
      if (wire3)
        begin
          reg274 <= (8'hb2);
          reg275 <= (wire2[(5'h12):(3'h4)] ?
              $unsigned(wire270[(3'h4):(1'h0)]) : {reg273[(3'h7):(3'h7)],
                  $unsigned(reg274)});
          if (((wire2[(4'hf):(1'h0)] >= wire6[(3'h7):(1'h1)]) ?
              ($signed(($signed(reg272) ~^ $unsigned(wire7))) ?
                  reg273 : (($signed((8'ha7)) ^ wire270[(1'h1):(1'h1)]) == $unsigned(reg275[(1'h0):(1'h0)]))) : wire2[(5'h12):(4'h8)]))
            begin
              reg276 <= {wire4};
            end
          else
            begin
              reg276 <= $unsigned(wire2);
            end
          reg277 <= ((~^wire5) ~^ $unsigned({$unsigned(reg276[(3'h5):(2'h2)])}));
          if (reg273)
            begin
              reg278 <= {(wire2[(5'h12):(5'h10)] ^ ($signed((wire268 ?
                      reg273 : wire0)) < $unsigned((reg272 <<< wire0)))),
                  $signed($signed((wire3[(4'h9):(2'h2)] ?
                      $signed((8'h9e)) : (wire1 >>> (8'hb6)))))};
              reg279 <= wire271;
              reg280 <= $unsigned($unsigned({((wire271 ? reg274 : wire270) ?
                      (reg276 ? reg273 : wire7) : $unsigned(reg274)),
                  {{wire4}}}));
              reg281 <= {reg274};
            end
          else
            begin
              reg278 <= $unsigned(reg272);
              reg279 <= wire2;
              reg280 <= (wire1 ?
                  ($unsigned((reg277 ? $unsigned(reg277) : $signed((8'hbd)))) ?
                      wire268[(4'hc):(2'h2)] : ((-(wire1 ?
                          wire0 : reg272)) && wire6)) : ((~&(+$unsigned(wire0))) < (~&$unsigned(reg272))));
              reg281 <= reg275[(3'h4):(1'h0)];
              reg282 <= {wire270[(4'h8):(3'h5)], wire268};
            end
        end
      else
        begin
          reg274 <= {{{$unsigned(((8'hbb) ? (8'hb8) : reg282))}}};
          reg275 <= (8'ha1);
          reg276 <= (({(~^{wire270, reg279})} ?
              {({wire5} & reg279)} : ((8'ha4) ^~ ($unsigned(wire2) ?
                  (~^reg282) : {wire6,
                      reg275}))) >= $unsigned($unsigned($signed(((7'h44) ?
              wire268 : wire2)))));
        end
      if ((-$signed((reg279 ? $signed((~|reg282)) : reg274[(2'h3):(2'h2)]))))
        begin
          if ($unsigned($signed(($unsigned((wire6 ? reg282 : (8'hbb))) ?
              $signed((|wire270)) : $unsigned($unsigned(wire3))))))
            begin
              reg283 <= (~((+wire7) >>> $unsigned(reg273[(2'h2):(2'h2)])));
              reg284 <= wire5[(5'h13):(2'h3)];
              reg285 <= (-(-{(~|(wire167 >= wire271)), (8'hbc)}));
              reg286 <= {(wire2[(4'h9):(4'h9)] ?
                      (($signed(reg279) * $signed(wire6)) ?
                          {wire2[(5'h11):(4'hd)]} : {$unsigned(wire2)}) : ($unsigned((~&reg283)) ?
                          ($unsigned(wire167) >= (reg283 ?
                              reg275 : (8'h9c))) : wire1))};
              reg287 <= reg272[(1'h0):(1'h0)];
            end
          else
            begin
              reg283 <= reg284;
              reg284 <= $unsigned($unsigned(($unsigned(reg278) - ($unsigned(wire6) ?
                  (^(8'hb2)) : $signed(reg287)))));
              reg285 <= {(!(+reg284))};
            end
        end
      else
        begin
          reg283 <= reg273;
          reg284 <= $unsigned(({(-wire167[(4'ha):(4'h9)])} ?
              ((reg276[(3'h5):(2'h2)] ^ (~^reg275)) ?
                  reg285[(1'h0):(1'h0)] : (wire6 ?
                      (reg286 == reg282) : (reg283 ?
                          (7'h43) : wire6))) : $signed($unsigned($unsigned(reg286)))));
          if (wire270[(4'he):(4'hd)])
            begin
              reg285 <= wire6[(3'h5):(1'h1)];
              reg286 <= reg287[(1'h0):(1'h0)];
            end
          else
            begin
              reg285 <= (8'had);
              reg286 <= reg273[(4'h8):(1'h0)];
              reg287 <= ({(reg277[(4'he):(3'h6)] <= $signed((^reg277)))} != (~|(reg276[(4'h9):(2'h3)] != $unsigned(reg273))));
              reg288 <= $unsigned($signed(wire4));
            end
        end
    end
  assign wire289 = {wire7, (~{(|(reg285 ? wire271 : (8'hb9))), {(|reg286)}})};
  module8 #() modinst291 (.y(wire290), .wire9(wire167), .wire10(reg278), .clk(clk), .wire11(wire2), .wire13(wire268), .wire12(reg283));
  assign wire292 = wire268[(4'ha):(4'ha)];
  assign wire293 = reg280;
  module169 #() modinst295 (.clk(clk), .wire172(reg277), .wire170(reg275), .wire171(wire271), .y(wire294), .wire173(reg285));
  assign wire296 = (^$signed($unsigned(reg285)));
endmodule

module module169  (y, clk, wire170, wire171, wire172, wire173);
  output wire [(32'h1cf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire170;
  input wire [(4'ha):(1'h0)] wire171;
  input wire signed [(2'h2):(1'h0)] wire172;
  input wire signed [(4'h9):(1'h0)] wire173;
  wire [(4'hc):(1'h0)] wire267;
  wire [(3'h5):(1'h0)] wire240;
  wire [(2'h3):(1'h0)] wire239;
  wire [(4'ha):(1'h0)] wire177;
  wire [(4'he):(1'h0)] wire183;
  wire [(4'hf):(1'h0)] wire237;
  reg [(3'h7):(1'h0)] reg266 = (1'h0);
  reg [(4'hf):(1'h0)] reg265 = (1'h0);
  reg [(5'h11):(1'h0)] reg264 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg263 = (1'h0);
  reg [(5'h10):(1'h0)] reg262 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg261 = (1'h0);
  reg [(2'h3):(1'h0)] reg260 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg259 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg258 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg257 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg256 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg255 = (1'h0);
  reg [(4'ha):(1'h0)] reg254 = (1'h0);
  reg [(5'h11):(1'h0)] reg253 = (1'h0);
  reg [(3'h7):(1'h0)] reg252 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg251 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg250 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg249 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg248 = (1'h0);
  reg [(3'h5):(1'h0)] reg247 = (1'h0);
  reg [(5'h14):(1'h0)] reg246 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg245 = (1'h0);
  reg [(2'h3):(1'h0)] reg244 = (1'h0);
  reg [(3'h6):(1'h0)] reg243 = (1'h0);
  reg [(4'h9):(1'h0)] reg242 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg241 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg175 = (1'h0);
  reg [(3'h5):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg178 = (1'h0);
  reg [(3'h6):(1'h0)] reg179 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg180 = (1'h0);
  reg [(5'h15):(1'h0)] reg181 = (1'h0);
  reg [(5'h13):(1'h0)] reg182 = (1'h0);
  assign y = {wire267,
                 wire240,
                 wire239,
                 wire177,
                 wire183,
                 wire237,
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
                 reg174,
                 reg175,
                 reg176,
                 reg178,
                 reg179,
                 reg180,
                 reg181,
                 reg182,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg174 <= $unsigned(wire171);
      reg175 <= (8'hba);
      reg176 <= {$unsigned($unsigned(wire170[(4'h8):(2'h2)]))};
    end
  assign wire177 = $unsigned(wire171[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg178 <= ($unsigned(((reg174[(4'hf):(4'h8)] ? reg175 : $signed(reg174)) ?
              ($signed(wire173) * $signed(reg175)) : reg175[(4'hd):(4'h9)])) ?
          $signed(((-$signed((8'haa))) != wire173)) : reg174[(2'h3):(1'h1)]);
      reg179 <= reg176[(2'h2):(1'h0)];
      reg180 <= $unsigned($unsigned((wire173[(3'h7):(1'h1)] ?
          wire172 : ((reg176 ? wire177 : reg179) + (reg175 >= (8'hb0))))));
      reg181 <= $signed(({wire177[(2'h3):(1'h1)]} >>> (+(^~reg180[(1'h0):(1'h0)]))));
      reg182 <= (wire173[(1'h0):(1'h0)] <= (~^((-wire173) ?
          ($unsigned(reg174) ?
              reg174[(5'h11):(4'hc)] : (wire173 == wire172)) : $unsigned(((8'hbc) ?
              reg178 : (8'hb8))))));
    end
  assign wire183 = $signed(wire172);
  module184 #() modinst238 (.clk(clk), .wire187(reg182), .wire185(wire173), .wire186(reg174), .wire188(reg175), .y(wire237));
  assign wire239 = (reg178[(4'h8):(1'h1)] ~^ $signed($signed((reg175 < wire170[(3'h4):(2'h2)]))));
  assign wire240 = (~&(reg174 ?
                       wire171[(1'h1):(1'h1)] : reg182[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      if ((8'hae))
        begin
          if ((^~(($unsigned({wire183, wire240}) < ($signed(reg178) ?
              $signed(wire170) : (wire239 > (7'h41)))) || {({wire183,
                  reg180} || (wire171 ? wire172 : wire170))})))
            begin
              reg241 <= wire237;
            end
          else
            begin
              reg241 <= {$unsigned({((-(8'hb3)) ?
                          wire183[(4'ha):(4'h9)] : wire172[(1'h1):(1'h1)])})};
            end
          reg242 <= (8'hb7);
        end
      else
        begin
          if (($signed((8'hab)) ?
              reg176 : $signed((wire172[(1'h1):(1'h0)] <<< $signed({reg241})))))
            begin
              reg241 <= wire170;
            end
          else
            begin
              reg241 <= (^~reg242[(3'h6):(1'h0)]);
              reg242 <= (-$unsigned($unsigned((wire177 ?
                  $unsigned((8'h9c)) : {reg174, wire170}))));
              reg243 <= $signed((($unsigned((wire183 ?
                      wire170 : wire172)) <= wire239[(2'h2):(2'h2)]) ?
                  wire172[(1'h0):(1'h0)] : (8'h9c)));
              reg244 <= ({wire183,
                      (((~wire240) != $signed((8'hbb))) * wire173[(3'h4):(1'h0)])} ?
                  $unsigned(reg241[(4'he):(4'h9)]) : (wire173 || {wire183,
                      {wire173[(1'h1):(1'h0)]}}));
              reg245 <= $signed(reg178);
            end
          reg246 <= ((|reg244) | $signed($unsigned(wire240[(1'h1):(1'h0)])));
          reg247 <= $signed((+$unsigned(reg174)));
          reg248 <= $signed((~&{($unsigned(wire172) ?
                  (reg182 < reg178) : $unsigned(reg182))}));
          if ($signed(reg248))
            begin
              reg249 <= (8'haa);
              reg250 <= reg242[(4'h8):(4'h8)];
              reg251 <= $signed((^~(8'ha4)));
              reg252 <= $signed($signed(reg182));
            end
          else
            begin
              reg249 <= $signed($signed({reg175[(5'h13):(4'h9)],
                  (+$unsigned((8'hab)))}));
              reg250 <= reg250;
            end
        end
      if ($unsigned($signed($unsigned(wire172[(2'h2):(1'h1)]))))
        begin
          if ({(~^((&(&reg243)) ? reg246 : reg174[(4'he):(3'h4)]))})
            begin
              reg253 <= (+reg243);
              reg254 <= $signed({{((reg245 ? reg176 : reg242) ?
                          (~&reg174) : (-(8'ha8))),
                      wire171[(2'h3):(1'h1)]}});
              reg255 <= wire177;
              reg256 <= $unsigned((-(^~reg174)));
              reg257 <= {(7'h43),
                  ((~^wire237) >> ((wire183[(4'h8):(3'h5)] * (reg245 ?
                      reg246 : reg246)) < ((reg254 ?
                      reg244 : wire237) << wire170)))};
            end
          else
            begin
              reg253 <= $unsigned((+$signed((^~reg251[(3'h7):(1'h1)]))));
              reg254 <= ((+($unsigned(reg252[(3'h4):(2'h3)]) ^ reg253[(4'h8):(3'h5)])) >= (~$signed((&(reg241 <<< wire171)))));
              reg255 <= (reg245 ?
                  reg176[(1'h1):(1'h1)] : $signed($signed($signed((8'hae)))));
              reg256 <= reg178;
            end
          reg258 <= ($signed($unsigned($signed(reg250))) ?
              (+(7'h42)) : $signed(wire240));
          if ((reg182 ?
              (~&($unsigned(wire183[(3'h4):(1'h1)]) ?
                  (reg178[(3'h4):(3'h4)] >= $signed(reg176)) : (~$signed(reg257)))) : $unsigned(({(^~reg179),
                      reg244} ?
                  (!(reg251 ? (8'hbf) : reg182)) : (+(wire239 ?
                      reg246 : (8'ha9)))))))
            begin
              reg259 <= (~$signed(reg243));
              reg260 <= $unsigned($unsigned(reg178[(3'h6):(1'h0)]));
              reg261 <= $signed({(reg255[(3'h6):(3'h5)] ?
                      $unsigned($signed(reg258)) : reg251),
                  $signed(($signed(reg256) ?
                      $unsigned(reg178) : wire237[(3'h4):(1'h1)]))});
            end
          else
            begin
              reg259 <= (&{(reg252[(3'h6):(1'h1)] ?
                      reg182[(2'h3):(2'h2)] : $unsigned((reg244 && reg241))),
                  $signed((reg241[(4'hf):(2'h3)] ?
                      reg250 : $unsigned((8'hbd))))});
              reg260 <= $unsigned($unsigned(reg251));
              reg261 <= wire170[(3'h4):(1'h1)];
              reg262 <= (-(7'h42));
              reg263 <= $unsigned({(~^{((8'h9d) ? wire171 : wire183)}),
                  $signed((reg247 ?
                      reg260[(1'h0):(1'h0)] : (reg246 ? reg261 : reg252)))});
            end
          reg264 <= (reg180 ?
              (|($signed($signed(wire240)) ?
                  {$unsigned(reg261)} : {(^reg245),
                      $signed(reg261)})) : $unsigned(($unsigned($unsigned(reg254)) ?
                  (~|(-reg258)) : (reg241 ?
                      $unsigned(reg251) : wire183[(4'he):(4'h9)]))));
          reg265 <= (~&(wire240[(1'h1):(1'h0)] >>> (({wire170} + (reg245 ?
                  reg262 : reg175)) ?
              wire240 : $unsigned($signed((8'haa))))));
        end
      else
        begin
          reg253 <= (!(&(((wire171 ? reg182 : wire172) ?
                  (7'h42) : (reg259 ^ wire172)) ?
              reg178[(2'h3):(2'h2)] : $unsigned($unsigned(reg176)))));
          reg254 <= (reg257[(1'h1):(1'h1)] <<< reg242);
        end
      reg266 <= ($unsigned(($unsigned(reg257[(1'h1):(1'h1)]) ?
              wire171 : {(wire240 || reg176), (reg262 ? (8'h9c) : reg260)})) ?
          ($signed(wire177) ?
              reg256[(2'h3):(2'h2)] : ($signed((reg255 ?
                  reg247 : reg253)) - reg258[(1'h0):(1'h0)])) : ($signed($unsigned((8'hbe))) ?
              {($unsigned(reg259) >> (|(8'h9e))),
                  (~reg265)} : $unsigned(reg180)));
    end
  assign wire267 = $signed(reg249[(4'h8):(3'h5)]);
endmodule

module module8  (y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h2b2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire9;
  input wire [(4'hc):(1'h0)] wire10;
  input wire signed [(5'h15):(1'h0)] wire11;
  input wire [(5'h15):(1'h0)] wire12;
  input wire signed [(4'ha):(1'h0)] wire13;
  wire signed [(4'ha):(1'h0)] wire166;
  wire signed [(4'hd):(1'h0)] wire162;
  wire signed [(5'h13):(1'h0)] wire161;
  wire [(4'hb):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire27;
  wire [(3'h4):(1'h0)] wire75;
  wire signed [(4'hd):(1'h0)] wire77;
  wire [(5'h12):(1'h0)] wire78;
  wire [(4'h9):(1'h0)] wire92;
  wire signed [(5'h13):(1'h0)] wire106;
  wire signed [(4'hd):(1'h0)] wire159;
  reg [(3'h6):(1'h0)] reg165 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg164 = (1'h0);
  reg [(2'h3):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg79 = (1'h0);
  reg [(4'hf):(1'h0)] reg80 = (1'h0);
  reg [(3'h4):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg82 = (1'h0);
  reg [(5'h12):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg84 = (1'h0);
  reg signed [(4'he):(1'h0)] reg85 = (1'h0);
  reg [(5'h12):(1'h0)] reg86 = (1'h0);
  reg [(4'he):(1'h0)] reg87 = (1'h0);
  reg signed [(4'he):(1'h0)] reg88 = (1'h0);
  reg [(5'h14):(1'h0)] reg89 = (1'h0);
  reg [(4'h8):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg91 = (1'h0);
  reg [(4'hf):(1'h0)] reg93 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg94 = (1'h0);
  reg [(5'h13):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg97 = (1'h0);
  reg [(4'h9):(1'h0)] reg98 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg99 = (1'h0);
  reg [(4'he):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg101 = (1'h0);
  reg [(5'h10):(1'h0)] reg102 = (1'h0);
  reg [(4'hb):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg105 = (1'h0);
  reg [(2'h3):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg111 = (1'h0);
  assign y = {wire166,
                 wire162,
                 wire161,
                 wire14,
                 wire26,
                 wire27,
                 wire75,
                 wire77,
                 wire78,
                 wire92,
                 wire106,
                 wire159,
                 reg165,
                 reg164,
                 reg163,
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
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg93,
                 reg94,
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
                 reg107,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 (1'h0)};
  assign wire14 = $unsigned(wire12);
  always
    @(posedge clk) begin
      reg15 <= $signed(((($signed(wire10) >> wire10[(2'h2):(1'h1)]) ?
          ((~wire9) ?
              $unsigned((8'hb8)) : (~^wire12)) : (wire13 ^~ {wire9})) + wire11));
      if ((wire14 ?
          (({(wire12 ? reg15 : wire10)} ?
              ($signed(wire9) ?
                  $unsigned(wire14) : $unsigned(reg15)) : $signed((~|wire10))) | (|(^(!wire11)))) : $signed((|wire13))))
        begin
          reg16 <= (((($signed(wire12) ? $signed(wire14) : (!reg15)) ?
                      (|wire11) : ({reg15, (8'hb7)} ?
                          (reg15 >= wire14) : (^wire12))) ?
                  (+$unsigned(wire9)) : (wire14 ?
                      wire13[(1'h0):(1'h0)] : (~(wire11 >= wire13)))) ?
              wire14 : (^~{$unsigned(wire10[(4'hc):(3'h7)]),
                  $unsigned($signed(wire11))}));
          reg17 <= (wire11 ? (~&wire13[(1'h1):(1'h1)]) : wire9);
          reg18 <= (~^(!($signed((^~wire12)) << wire10)));
          reg19 <= (wire14[(4'h8):(1'h1)] > wire10[(4'ha):(4'h9)]);
        end
      else
        begin
          if ($signed({(|(|wire13)), wire10[(4'hc):(3'h6)]}))
            begin
              reg16 <= (&((|reg18) ?
                  wire12[(4'ha):(3'h4)] : (((~|wire10) >= wire10) >= ((7'h42) & ((8'hba) ?
                      wire14 : wire14)))));
              reg17 <= wire12[(3'h6):(2'h3)];
              reg18 <= (~^(wire14 | wire14[(1'h1):(1'h0)]));
              reg19 <= (reg17 ~^ (~|reg15[(2'h3):(1'h0)]));
              reg20 <= ($signed((~|wire12[(4'ha):(2'h3)])) ?
                  (^~$unsigned($signed((reg19 * wire10)))) : (^~{($signed((7'h40)) == (7'h42))}));
            end
          else
            begin
              reg16 <= $unsigned($signed((wire11[(5'h15):(2'h3)] ?
                  (!(reg18 ^~ wire10)) : wire10)));
            end
          reg21 <= $signed(wire14[(3'h6):(3'h6)]);
          reg22 <= (8'ha9);
        end
      reg23 <= $unsigned(wire10[(1'h1):(1'h0)]);
      reg24 <= $signed({$signed((^(reg17 + reg19)))});
      reg25 <= (+$unsigned((|((~wire13) < (wire10 >= wire14)))));
    end
  assign wire26 = reg16;
  assign wire27 = $signed($unsigned(wire14));
  module28 #() modinst76 (wire75, clk, wire12, reg15, reg16, reg17, wire9);
  assign wire77 = ((|$unsigned($signed(wire12))) ? {(7'h44)} : wire10);
  assign wire78 = {{(~|$signed(((8'ha0) && reg15)))},
                      $unsigned($unsigned(reg23))};
  always
    @(posedge clk) begin
      reg79 <= $signed(wire75);
      reg80 <= ($signed($unsigned((wire77[(4'hd):(3'h6)] >> ((8'hb6) ?
              reg16 : reg25)))) ?
          (|{$signed((wire11 ?
                  (8'ha3) : wire27))}) : $unsigned((|($signed(wire27) ?
              {wire78, wire78} : (wire77 ? wire27 : wire26)))));
      if ((&(~^$signed(($signed(wire11) ? (~^wire9) : $signed(reg19))))))
        begin
          if ($unsigned((~|wire77)))
            begin
              reg81 <= {wire11};
              reg82 <= reg17[(3'h5):(3'h4)];
            end
          else
            begin
              reg81 <= ($signed($signed((&(reg81 << wire13)))) && wire9);
            end
        end
      else
        begin
          reg81 <= $unsigned((|reg19[(2'h2):(1'h1)]));
          if (reg80[(3'h4):(2'h3)])
            begin
              reg82 <= (~&$signed(wire26[(1'h0):(1'h0)]));
              reg83 <= $unsigned($signed(reg15[(2'h3):(2'h3)]));
              reg84 <= $unsigned({$signed((~^$signed((8'ha6))))});
            end
          else
            begin
              reg82 <= $unsigned((~reg21));
              reg83 <= (-$unsigned(($unsigned(wire27) && ((wire26 ?
                  reg83 : reg22) == (~&wire9)))));
              reg84 <= ($signed((8'hb0)) ?
                  $signed($signed(((~&reg22) && $unsigned(wire13)))) : ((~^((wire11 ?
                              wire14 : reg20) ?
                          $signed(reg17) : reg16)) ?
                      (^$signed((8'h9e))) : (reg21[(1'h0):(1'h0)] ?
                          reg22[(2'h3):(2'h2)] : ((8'ha8) | $signed(wire10)))));
              reg85 <= {$unsigned({$signed({reg21, reg15}),
                      $unsigned($unsigned(reg17))})};
            end
        end
      if ((wire12 & (reg16[(3'h5):(1'h1)] ?
          (($unsigned(reg20) ? (wire10 ? wire27 : reg18) : reg17) ?
              ($signed(reg79) <<< (wire11 <<< wire78)) : $signed($signed((8'hbf)))) : {((reg80 ?
                      reg80 : wire13) ?
                  wire27 : (reg23 ~^ reg20))})))
        begin
          if (wire77)
            begin
              reg86 <= (wire75 ? reg16 : (~wire13[(2'h3):(2'h2)]));
              reg87 <= (~^$signed((-reg84)));
            end
          else
            begin
              reg86 <= (^(wire10 >> $unsigned(reg83[(3'h7):(3'h4)])));
              reg87 <= ($unsigned($signed($unsigned({wire77}))) > (~|wire9[(4'hf):(3'h5)]));
            end
          reg88 <= ((|wire78[(4'hc):(1'h0)]) && ((|$unsigned({reg25})) - $signed((8'ha1))));
          reg89 <= $unsigned($signed((~&$unsigned(reg24))));
          reg90 <= $signed($unsigned(reg89[(2'h2):(2'h2)]));
          reg91 <= (|(+(~^$signed({reg16, (8'h9d)}))));
        end
      else
        begin
          reg86 <= $signed($signed(wire10));
          reg87 <= reg90[(2'h2):(2'h2)];
          reg88 <= $unsigned($unsigned(((|reg84[(3'h4):(3'h4)]) << (reg15[(4'h9):(1'h1)] * ((8'hba) ?
              reg25 : reg17)))));
        end
    end
  assign wire92 = $signed((reg89[(5'h14):(3'h4)] ?
                      $signed($unsigned($signed(reg84))) : (reg85[(3'h6):(2'h2)] ?
                          wire14[(3'h4):(1'h1)] : (!$unsigned(reg79)))));
  always
    @(posedge clk) begin
      if (reg81[(1'h0):(1'h0)])
        begin
          reg93 <= {$unsigned((((reg15 && wire77) & (wire77 == reg23)) >= (~&reg84))),
              (~&reg87[(1'h1):(1'h0)])};
          reg94 <= ($unsigned(($unsigned(((8'hb2) < wire78)) | $signed($signed(reg81)))) ^ {$unsigned(reg24),
              (~reg89[(1'h0):(1'h0)])});
          reg95 <= ($signed((&((wire75 ? reg22 : wire9) ?
              $signed(wire75) : reg88[(3'h7):(2'h2)]))) * reg93[(4'ha):(3'h5)]);
          reg96 <= wire92;
          reg97 <= $unsigned($unsigned({$signed($unsigned(wire11)), wire9}));
        end
      else
        begin
          if ($signed((reg22 <= (((reg84 <= reg80) ?
                  wire78[(5'h11):(2'h3)] : (+reg97)) ?
              $signed($unsigned(wire78)) : $signed($unsigned(reg91))))))
            begin
              reg93 <= (8'hb6);
            end
          else
            begin
              reg93 <= ($signed(wire13) <<< ((($unsigned(reg88) ?
                      ((8'hb3) ? reg90 : reg94) : (reg15 < wire77)) ?
                  reg19 : reg17[(4'ha):(4'h9)]) == (wire11 && $signed(wire75))));
              reg94 <= (8'hb2);
            end
          reg95 <= {wire14[(2'h3):(2'h3)]};
          reg96 <= $signed($unsigned($unsigned({(~&reg22)})));
          if (wire12)
            begin
              reg97 <= reg22[(1'h1):(1'h0)];
              reg98 <= reg25;
              reg99 <= reg93[(1'h0):(1'h0)];
            end
          else
            begin
              reg97 <= ((~^$signed($signed(reg86))) - reg99[(1'h1):(1'h0)]);
              reg98 <= reg95;
              reg99 <= (8'h9f);
              reg100 <= (wire12[(4'he):(4'hd)] ^~ (+$signed({{(8'ha7),
                      reg83}})));
              reg101 <= reg95[(3'h5):(3'h4)];
            end
        end
      reg102 <= ((~|reg20) >> ((^~(reg24 ?
              $unsigned(wire75) : ((8'hac) != (8'ha9)))) ?
          reg100 : ((&$unsigned(wire26)) ?
              $signed({reg19}) : wire77[(4'hd):(4'hd)])));
      reg103 <= ({reg81[(3'h4):(2'h3)],
              (reg20 * (+(reg22 ? (8'hb4) : reg80)))} ?
          $unsigned(((~^(^reg88)) ?
              (|{wire77, reg21}) : $signed(reg81))) : ({wire14[(2'h2):(1'h0)],
              wire10} | (~|$signed(reg25))));
      reg104 <= (reg88 ^~ wire12[(4'hc):(4'ha)]);
      reg105 <= (($unsigned($unsigned(reg97[(3'h6):(2'h3)])) + reg95) <= $signed((~&(reg24[(2'h3):(1'h1)] ?
          {(8'h9f), reg21} : (reg79 ? reg81 : wire26)))));
    end
  assign wire106 = ($signed(wire75) ? (~&reg20) : reg99[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      reg107 <= ((~|$unsigned((+(^~reg18)))) >= $signed(reg101[(2'h3):(1'h0)]));
      reg108 <= (^~(reg20[(3'h5):(3'h4)] | ($signed(reg25) ?
          $unsigned($signed((8'h9e))) : reg89[(3'h4):(2'h2)])));
      reg109 <= {($signed(wire14[(1'h0):(1'h0)]) ?
              reg94[(3'h7):(1'h1)] : {$signed($unsigned(reg89)), (8'ha9)})};
      reg110 <= $signed(reg83[(1'h0):(1'h0)]);
      reg111 <= (wire13[(4'h9):(3'h5)] != (reg85[(1'h1):(1'h1)] ?
          reg91[(1'h1):(1'h1)] : reg81[(1'h1):(1'h0)]));
    end
  module112 #() modinst160 (wire159, clk, reg100, reg19, reg79, wire27);
  assign wire161 = reg81[(3'h4):(1'h1)];
  assign wire162 = (^($unsigned(wire27) ? $signed(reg85) : wire161));
  always
    @(posedge clk) begin
      reg163 <= $signed($unsigned(({{reg17, reg111}, reg80} ?
          {(~|(8'hbb))} : (8'haa))));
      reg164 <= $signed($signed(reg86[(3'h4):(2'h3)]));
      reg165 <= (+reg83);
    end
  assign wire166 = reg16[(1'h1):(1'h0)];
endmodule

module module112
#(parameter param158 = ((+(~^{((8'h9c) ? (8'had) : (8'hba)), (^~(8'hb7))})) ? (-(8'hbe)) : (!(~|(^~{(8'ha0), (8'hb9)})))))
(y, clk, wire116, wire115, wire114, wire113);
  output wire [(32'h1c4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire116;
  input wire signed [(4'hd):(1'h0)] wire115;
  input wire [(2'h3):(1'h0)] wire114;
  input wire [(4'h9):(1'h0)] wire113;
  wire [(5'h11):(1'h0)] wire157;
  wire signed [(5'h13):(1'h0)] wire156;
  wire [(3'h6):(1'h0)] wire155;
  wire [(3'h4):(1'h0)] wire154;
  wire signed [(5'h10):(1'h0)] wire153;
  wire signed [(2'h3):(1'h0)] wire152;
  wire signed [(4'h9):(1'h0)] wire151;
  wire signed [(4'hb):(1'h0)] wire150;
  wire signed [(3'h6):(1'h0)] wire149;
  wire signed [(5'h10):(1'h0)] wire148;
  wire [(4'hf):(1'h0)] wire147;
  wire [(4'hb):(1'h0)] wire146;
  wire signed [(4'he):(1'h0)] wire145;
  wire signed [(3'h5):(1'h0)] wire144;
  wire signed [(4'hf):(1'h0)] wire143;
  wire [(5'h14):(1'h0)] wire121;
  wire signed [(2'h3):(1'h0)] wire120;
  wire signed [(3'h4):(1'h0)] wire119;
  wire [(4'hd):(1'h0)] wire118;
  wire signed [(3'h6):(1'h0)] wire117;
  reg [(4'h9):(1'h0)] reg142 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg141 = (1'h0);
  reg [(4'h9):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg139 = (1'h0);
  reg [(5'h10):(1'h0)] reg138 = (1'h0);
  reg [(2'h2):(1'h0)] reg137 = (1'h0);
  reg signed [(4'he):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg134 = (1'h0);
  reg [(4'he):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg132 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg131 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg130 = (1'h0);
  reg [(4'hd):(1'h0)] reg129 = (1'h0);
  reg [(4'h8):(1'h0)] reg128 = (1'h0);
  reg [(2'h3):(1'h0)] reg127 = (1'h0);
  reg [(5'h13):(1'h0)] reg126 = (1'h0);
  reg [(3'h7):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg124 = (1'h0);
  reg [(3'h7):(1'h0)] reg123 = (1'h0);
  reg [(4'hc):(1'h0)] reg122 = (1'h0);
  assign y = {wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
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
                 (1'h0)};
  assign wire117 = (wire114[(2'h3):(1'h0)] >>> (~^wire114[(2'h3):(2'h2)]));
  assign wire118 = wire114[(2'h3):(2'h2)];
  assign wire119 = (wire113[(4'h8):(4'h8)] ?
                       wire115[(4'hb):(3'h4)] : ((~|$unsigned($signed(wire116))) ?
                           (!wire116[(2'h3):(2'h3)]) : wire116[(2'h3):(2'h3)]));
  assign wire120 = (!($unsigned((-(~&wire119))) ?
                       ((&(~|wire115)) ?
                           wire119 : ((wire116 ?
                               wire114 : wire114) || (+wire115))) : ($signed(wire115[(3'h4):(3'h4)]) ?
                           $unsigned((wire116 && wire116)) : (|$unsigned(wire113)))));
  assign wire121 = $signed(((~^wire117) <= (^wire118[(3'h6):(2'h3)])));
  always
    @(posedge clk) begin
      if (wire113[(4'h8):(2'h3)])
        begin
          reg122 <= wire120[(1'h0):(1'h0)];
          reg123 <= {(^(+$unsigned(wire118[(3'h4):(1'h0)]))), $signed((8'hb8))};
          reg124 <= ($unsigned($unsigned(((wire113 ^~ (8'hb7)) >> (~wire118)))) ?
              $signed((~|(^~wire113[(2'h2):(2'h2)]))) : reg122[(4'ha):(4'ha)]);
        end
      else
        begin
          reg122 <= reg122;
          reg123 <= wire120;
          reg124 <= (!(((8'haa) ?
                  ($signed(reg122) ?
                      {wire116, (7'h41)} : (~|(8'hbe))) : ($signed((8'hb2)) ?
                      $signed(wire116) : $unsigned(wire114))) ?
              wire117 : ((!(wire121 ? reg123 : wire116)) ?
                  $signed(wire113[(4'h9):(1'h1)]) : (-{wire119}))));
          reg125 <= $unsigned(wire120);
          reg126 <= reg124;
        end
      reg127 <= $signed($signed({(8'hbd), wire119}));
      reg128 <= ($unsigned((({reg126} ? {reg122} : (8'hbb)) ?
          ({reg122} || wire117[(1'h1):(1'h1)]) : wire116)) & {reg126[(4'hc):(4'ha)],
          $signed(wire117)});
      if ($signed(reg122[(2'h2):(2'h2)]))
        begin
          if ($unsigned((reg125 ? wire114[(2'h2):(1'h0)] : reg125)))
            begin
              reg129 <= (~|{{wire121}});
              reg130 <= ((^~$signed($signed((~|reg124)))) ?
                  ($unsigned(wire118[(3'h6):(2'h3)]) <= (8'ha3)) : ((wire113 >>> reg129[(3'h7):(2'h3)]) ?
                      wire113 : (|wire118)));
              reg131 <= $signed(reg130[(2'h3):(1'h1)]);
              reg132 <= reg123;
              reg133 <= wire119;
            end
          else
            begin
              reg129 <= reg126[(4'ha):(3'h5)];
              reg130 <= wire113;
              reg131 <= (($signed(($unsigned(wire116) * $unsigned(reg122))) <= {wire117}) ?
                  wire114 : ($signed({reg130[(3'h6):(2'h2)]}) ?
                      $unsigned((&(&reg127))) : $unsigned($signed((7'h41)))));
            end
          reg134 <= reg124[(3'h7):(1'h0)];
        end
      else
        begin
          reg129 <= (&wire119);
        end
      if (((&(reg130[(3'h7):(1'h0)] ?
          $signed(((8'hbb) ? wire114 : wire113)) : (!((7'h40) ?
              reg124 : reg129)))) & wire118[(3'h5):(1'h1)]))
        begin
          if ((8'ha5))
            begin
              reg135 <= (!(wire119 ?
                  wire120 : ($unsigned(reg127[(2'h2):(1'h0)]) ?
                      reg130 : wire118[(3'h7):(3'h5)])));
            end
          else
            begin
              reg135 <= wire120[(2'h2):(1'h1)];
              reg136 <= (~^$signed(({reg131} ? (~|$signed((8'hbc))) : reg135)));
              reg137 <= {reg134[(1'h1):(1'h1)],
                  (-(((8'hb2) ? $unsigned(reg129) : {reg134}) ?
                      ((wire118 ^ (8'ha8)) ?
                          $unsigned(reg136) : $unsigned(reg136)) : $unsigned((reg128 && reg127))))};
              reg138 <= reg130[(2'h3):(2'h3)];
              reg139 <= (~^((~|reg125) > (((^~reg124) ?
                  (~^(8'hb9)) : (reg136 ?
                      reg129 : (8'h9f))) + $unsigned(((8'hbc) ?
                  (8'hbd) : wire121)))));
            end
          reg140 <= $unsigned($signed((|reg124)));
          reg141 <= ((~^($signed(reg138[(4'h8):(3'h4)]) ^~ $signed((~^(7'h42))))) ?
              (8'haf) : wire119[(1'h1):(1'h1)]);
          reg142 <= $unsigned((^~{$signed($signed(wire115))}));
        end
      else
        begin
          reg135 <= reg141;
          if (reg139[(3'h6):(2'h2)])
            begin
              reg136 <= reg135[(1'h0):(1'h0)];
            end
          else
            begin
              reg136 <= reg126[(4'h9):(4'h8)];
            end
          reg137 <= {(8'hbe), (8'hab)};
        end
    end
  assign wire143 = (-(-{($unsigned((8'ha7)) != wire115[(4'ha):(4'ha)]),
                       reg129}));
  assign wire144 = ((!wire120) * $unsigned({($unsigned(reg128) - $unsigned(wire119)),
                       (-$unsigned((8'had)))}));
  assign wire145 = wire117;
  assign wire146 = ($unsigned((((~^reg141) < (reg124 ?
                       reg135 : reg128)) || ($signed(reg129) | (wire120 & (8'haf))))) > $signed(({(^reg123),
                       $unsigned((7'h43))} + wire121[(2'h2):(2'h2)])));
  assign wire147 = ((^((&(~^reg133)) ?
                           $unsigned((reg127 ?
                               reg123 : reg137)) : (~$signed((8'hbd))))) ?
                       reg129 : $signed($unsigned((wire146[(3'h5):(2'h3)] ?
                           (reg138 * reg131) : (wire143 * reg122)))));
  assign wire148 = reg132;
  assign wire149 = (8'hb4);
  assign wire150 = reg123[(1'h0):(1'h0)];
  assign wire151 = reg140;
  assign wire152 = $unsigned((~((~|$unsigned(wire143)) * (8'had))));
  assign wire153 = $unsigned(wire149[(1'h1):(1'h0)]);
  assign wire154 = ((&(~&$signed((&reg122)))) <<< (|wire113));
  assign wire155 = (($signed((^~wire145)) <= $unsigned(wire113[(4'h8):(2'h2)])) ?
                       (~&((~wire147) ?
                           $unsigned({wire143,
                               reg132}) : reg125[(3'h7):(3'h7)])) : reg138[(5'h10):(4'hd)]);
  assign wire156 = $unsigned(($signed({$unsigned(wire146),
                       wire120[(1'h0):(1'h0)]}) && ({((8'hab) ?
                           reg138 : reg128),
                       reg130[(1'h0):(1'h0)]} & $unsigned(reg130[(1'h0):(1'h0)]))));
  assign wire157 = ({wire113[(1'h1):(1'h1)],
                       {(^~(|(8'hb1)))}} | (~((-reg136[(3'h4):(3'h4)]) ?
                       (~&wire120[(1'h0):(1'h0)]) : (wire113 ?
                           $signed(reg133) : wire152[(1'h0):(1'h0)]))));
endmodule

module module28
#(parameter param73 = {{((((8'ha6) ^~ (8'hb3)) >>> (~|(8'hb6))) ? ({(8'had)} ? {(8'h9f)} : (8'hb1)) : (~^((8'h9f) < (8'ha9)))), {(~|{(7'h44), (8'ha0)})}}}, 
parameter param74 = param73)
(y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'h1a2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire33;
  input wire [(4'hb):(1'h0)] wire32;
  input wire signed [(3'h5):(1'h0)] wire31;
  input wire signed [(4'h9):(1'h0)] wire30;
  input wire signed [(5'h15):(1'h0)] wire29;
  wire signed [(5'h12):(1'h0)] wire69;
  wire [(4'hb):(1'h0)] wire68;
  wire [(5'h14):(1'h0)] wire67;
  wire signed [(3'h6):(1'h0)] wire66;
  wire [(5'h15):(1'h0)] wire65;
  wire signed [(4'hb):(1'h0)] wire64;
  wire [(4'hc):(1'h0)] wire63;
  wire [(4'hc):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire42;
  wire [(4'h9):(1'h0)] wire41;
  wire [(4'hd):(1'h0)] wire40;
  wire [(4'hb):(1'h0)] wire39;
  wire [(2'h2):(1'h0)] wire37;
  wire [(4'ha):(1'h0)] wire36;
  wire [(4'h8):(1'h0)] wire35;
  wire signed [(4'he):(1'h0)] wire34;
  reg signed [(5'h13):(1'h0)] reg72 = (1'h0);
  reg [(4'he):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg70 = (1'h0);
  reg [(2'h3):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg58 = (1'h0);
  reg [(2'h3):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg [(4'ha):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg51 = (1'h0);
  reg [(5'h13):(1'h0)] reg50 = (1'h0);
  reg [(3'h4):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(5'h13):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg38 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 reg72,
                 reg71,
                 reg70,
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
                 reg38,
                 (1'h0)};
  assign wire34 = $signed($signed(wire33));
  assign wire35 = (8'hac);
  assign wire36 = (($unsigned((&$signed(wire33))) ?
                      {((&wire32) == $signed(wire30)),
                          $signed(wire34)} : ($signed($signed(wire30)) ?
                          {(!(8'hbf))} : $signed($unsigned(wire30)))) && $unsigned((wire33[(2'h2):(1'h0)] ?
                      $signed((!wire31)) : (~wire35))));
  assign wire37 = wire30[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg38 <= $signed({(-{(~^wire35), wire32[(3'h6):(1'h0)]}),
          $signed(($signed(wire37) ? wire32 : ((8'ha6) == wire32)))});
    end
  assign wire39 = {wire30[(4'h8):(3'h4)]};
  assign wire40 = wire32[(4'h8):(3'h7)];
  assign wire41 = $unsigned($signed($signed(($signed(wire34) ?
                      (-wire32) : $unsigned(wire37)))));
  assign wire42 = wire31[(3'h5):(3'h5)];
  assign wire43 = ($unsigned(wire30[(2'h3):(1'h0)]) >> (~&wire29[(4'h9):(3'h6)]));
  always
    @(posedge clk) begin
      reg44 <= reg38;
      if (wire41[(3'h4):(2'h2)])
        begin
          reg45 <= wire32[(1'h0):(1'h0)];
          reg46 <= (wire41 ?
              (reg44[(3'h7):(1'h0)] - $signed($signed({wire41}))) : ((~wire31) ^ reg45[(3'h7):(1'h1)]));
          if ($signed($unsigned(wire40[(2'h3):(2'h3)])))
            begin
              reg47 <= (~|($unsigned((~^$signed(reg45))) == reg44[(3'h6):(3'h4)]));
              reg48 <= reg44[(1'h1):(1'h0)];
              reg49 <= $signed((!(~|$unsigned($unsigned(reg44)))));
              reg50 <= {(^wire30[(4'h8):(2'h2)])};
            end
          else
            begin
              reg47 <= (((~&({reg48, wire39} >= reg47[(2'h2):(1'h0)])) ?
                  (8'hb7) : $signed(wire43[(4'h8):(3'h6)])) ^ $unsigned(reg44));
              reg48 <= $unsigned(wire42[(3'h7):(3'h7)]);
              reg49 <= $signed($signed(wire37[(2'h2):(1'h1)]));
            end
          if (((|(~^((8'h9e) >> (~^(8'hb0))))) <<< wire36[(1'h0):(1'h0)]))
            begin
              reg51 <= {(wire34 ?
                      {(reg44[(3'h7):(3'h5)] ?
                              ((8'h9f) ?
                                  wire42 : wire34) : $unsigned((8'hb9)))} : (($unsigned(wire31) * wire33[(4'hf):(4'hd)]) || $signed(reg46)))};
              reg52 <= $unsigned({$signed(reg44[(3'h4):(3'h4)])});
              reg53 <= $signed((reg49[(2'h2):(1'h0)] ?
                  $signed((8'hb0)) : reg45));
              reg54 <= wire33[(3'h4):(3'h4)];
              reg55 <= {($unsigned(reg48) ?
                      $signed($unsigned(((8'ha2) ?
                          wire29 : reg54))) : ($unsigned((wire31 ?
                              reg54 : (8'h9e))) ?
                          wire42 : $unsigned($signed(wire41))))};
            end
          else
            begin
              reg51 <= wire35;
            end
          reg56 <= ({(~{(8'hb6)})} >> $unsigned(reg51[(2'h3):(1'h1)]));
        end
      else
        begin
          reg45 <= ((reg51[(2'h2):(1'h0)] ?
                  (~&$unsigned((wire31 ? reg47 : reg48))) : wire40) ?
              $signed((!(|$unsigned(reg50)))) : (~&$unsigned((8'hae))));
          reg46 <= wire36[(2'h3):(1'h1)];
        end
      reg57 <= (((~$unsigned({wire29, reg44})) ?
              $unsigned({{(8'ha5)}, (~^wire32)}) : reg45) ?
          $unsigned((reg50[(3'h5):(1'h0)] ?
              {(reg49 * reg46)} : (&((8'ha7) <= wire37)))) : $unsigned(wire29));
      reg58 <= reg52;
      if ((&wire36))
        begin
          reg59 <= $unsigned((^wire39));
          reg60 <= (8'hb4);
          reg61 <= (reg49[(2'h3):(2'h3)] ?
              wire36[(1'h1):(1'h0)] : (wire39[(4'h8):(3'h7)] ?
                  $signed(((wire31 ? wire31 : reg46) ?
                      {wire35,
                          wire40} : wire34[(4'h9):(1'h0)])) : (~((~wire33) ?
                      (wire30 ? reg49 : (8'ha5)) : (reg58 * wire34)))));
          reg62 <= (8'h9d);
        end
      else
        begin
          reg59 <= $unsigned($signed(($unsigned({reg57}) ? wire39 : {wire31})));
        end
    end
  assign wire63 = ((~|{((8'ha2) ?
                          $signed(reg51) : {reg58, wire31})}) <<< reg55);
  assign wire64 = $signed(((~|(~^$signed(wire63))) << $signed(reg60)));
  assign wire65 = (+reg38);
  assign wire66 = reg52[(1'h0):(1'h0)];
  assign wire67 = {reg55};
  assign wire68 = (~|($unsigned((&$unsigned(reg50))) ?
                      wire35[(2'h2):(1'h1)] : (wire67[(4'hc):(1'h0)] ~^ reg60)));
  assign wire69 = $signed((({(reg60 >>> reg60),
                      (wire32 >>> (8'ha9))} <<< (reg45[(4'hc):(2'h2)] ^ reg57[(2'h3):(1'h1)])) >>> $unsigned($signed(reg51))));
  always
    @(posedge clk) begin
      reg70 <= {reg38, reg52[(3'h7):(1'h1)]};
      reg71 <= (wire63 ?
          (|{({wire43, wire34} << (+wire65))}) : wire37[(1'h0):(1'h0)]);
      reg72 <= (8'ha7);
    end
endmodule

module module184
#(parameter param235 = ((~^(8'h9e)) ? (|{(((8'had) < (8'haa)) * (~|(8'hbe)))}) : ({(+{(8'hb1), (7'h42)})} & ((~&(~&(8'hae))) | {((8'hbd) <<< (8'hba)), ((8'ha9) >>> (8'ha8))}))), 
parameter param236 = param235)
(y, clk, wire188, wire187, wire186, wire185);
  output wire [(32'h1d9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire188;
  input wire [(5'h13):(1'h0)] wire187;
  input wire [(4'ha):(1'h0)] wire186;
  input wire [(4'h9):(1'h0)] wire185;
  wire signed [(4'hb):(1'h0)] wire234;
  wire [(4'hb):(1'h0)] wire233;
  wire [(3'h4):(1'h0)] wire232;
  wire [(5'h12):(1'h0)] wire231;
  wire signed [(3'h5):(1'h0)] wire230;
  wire [(3'h7):(1'h0)] wire229;
  wire [(3'h7):(1'h0)] wire228;
  wire [(4'hc):(1'h0)] wire227;
  wire signed [(3'h7):(1'h0)] wire220;
  wire [(4'hb):(1'h0)] wire219;
  wire [(3'h5):(1'h0)] wire218;
  reg [(4'h9):(1'h0)] reg226 = (1'h0);
  reg [(2'h3):(1'h0)] reg225 = (1'h0);
  reg [(5'h15):(1'h0)] reg224 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg223 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg222 = (1'h0);
  reg [(4'h8):(1'h0)] reg221 = (1'h0);
  reg [(5'h14):(1'h0)] reg217 = (1'h0);
  reg [(4'hc):(1'h0)] reg216 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg215 = (1'h0);
  reg [(3'h6):(1'h0)] reg214 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg213 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg212 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg211 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg210 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg209 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg208 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg207 = (1'h0);
  reg [(5'h14):(1'h0)] reg206 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg205 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg204 = (1'h0);
  reg [(4'h8):(1'h0)] reg203 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg202 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg201 = (1'h0);
  reg [(3'h5):(1'h0)] reg200 = (1'h0);
  reg [(5'h12):(1'h0)] reg199 = (1'h0);
  reg [(3'h7):(1'h0)] reg198 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg197 = (1'h0);
  reg [(3'h5):(1'h0)] reg196 = (1'h0);
  reg [(4'hb):(1'h0)] reg195 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg194 = (1'h0);
  reg [(4'he):(1'h0)] reg193 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg192 = (1'h0);
  reg [(3'h5):(1'h0)] reg191 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg190 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg189 = (1'h0);
  assign y = {wire234,
                 wire233,
                 wire232,
                 wire231,
                 wire230,
                 wire229,
                 wire228,
                 wire227,
                 wire220,
                 wire219,
                 wire218,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg189 <= ((^~$unsigned((((8'ha2) ? wire186 : wire187) ?
              (|(8'hb6)) : (|wire188)))) ?
          (^wire185) : $signed((((wire186 ? (8'h9f) : wire187) ?
                  wire188 : $signed(wire185)) ?
              wire186 : (~|(&wire186)))));
      if ($signed((~^$unsigned(((wire186 ~^ (8'h9e)) + wire187)))))
        begin
          if ($signed(reg189))
            begin
              reg190 <= ($signed((({(8'ha0), reg189} | (wire185 ?
                      wire187 : (8'ha9))) < (wire188[(2'h3):(2'h3)] ?
                      {wire185, wire187} : (wire185 ? wire187 : reg189)))) ?
                  $unsigned(($signed($unsigned(wire187)) > $unsigned($unsigned(wire186)))) : $signed((((wire186 + wire187) ~^ $unsigned(wire187)) & {wire185})));
              reg191 <= (^(~&$unsigned(reg189)));
            end
          else
            begin
              reg190 <= wire185[(1'h0):(1'h0)];
              reg191 <= ((reg190[(2'h3):(1'h0)] * wire188) ?
                  (((~^wire185[(1'h1):(1'h0)]) << ((~reg191) | reg191)) ?
                      ((&{reg191,
                          reg191}) ^~ ($signed(wire185) >> $unsigned(reg190))) : $signed((+(~(8'haa))))) : $signed(((~&(7'h42)) ?
                      ((wire185 ? (8'h9d) : wire188) ?
                          wire188[(3'h6):(3'h6)] : (reg190 ?
                              wire188 : wire187)) : wire185)));
              reg192 <= $unsigned((~&($unsigned(((8'hb3) ?
                  wire186 : wire186)) && reg189[(4'hc):(4'h9)])));
              reg193 <= $unsigned({{(8'h9f),
                      ((reg189 >> wire188) << reg189[(4'ha):(2'h2)])},
                  $signed($signed((wire188 || wire185)))});
              reg194 <= $signed(reg189);
            end
          reg195 <= $signed($unsigned(((8'hbe) ^ (&reg194[(2'h3):(1'h1)]))));
          reg196 <= wire185[(3'h4):(2'h2)];
        end
      else
        begin
          reg190 <= $signed($signed((|reg191)));
          reg191 <= ($signed(((((8'haa) ? wire186 : reg192) ?
                  reg191[(1'h0):(1'h0)] : $signed(wire186)) * reg195[(1'h1):(1'h0)])) ?
              reg191 : ((+{(reg189 && wire187)}) != wire187[(3'h6):(1'h1)]));
        end
      if ($unsigned((($signed((wire185 ?
          (8'hae) : reg195)) << reg196[(3'h4):(3'h4)]) ^~ reg196[(3'h4):(2'h3)])))
        begin
          if ($signed((-wire185)))
            begin
              reg197 <= $unsigned({wire188});
              reg198 <= $signed($signed($unsigned(((reg190 >= reg192) ?
                  $signed(wire185) : (wire187 & (8'h9f))))));
              reg199 <= ({(~&{$signed(reg194)})} - reg196[(2'h2):(1'h0)]);
              reg200 <= reg190;
            end
          else
            begin
              reg197 <= $unsigned((wire187[(4'h8):(1'h0)] ~^ reg199[(4'hc):(2'h2)]));
              reg198 <= wire186[(4'ha):(4'h8)];
              reg199 <= $signed($signed($signed($signed(reg189[(4'hd):(4'hd)]))));
              reg200 <= reg192[(3'h7):(1'h1)];
              reg201 <= $unsigned((~|$unsigned(wire186[(3'h7):(1'h0)])));
            end
          reg202 <= $signed(($unsigned($signed({wire188,
              reg198})) >= reg201[(4'h8):(3'h5)]));
          if ($signed(($unsigned($unsigned((reg190 ^~ (8'haf)))) >> $unsigned((+reg196[(1'h0):(1'h0)])))))
            begin
              reg203 <= $unsigned(wire186);
            end
          else
            begin
              reg203 <= (~|$signed({$unsigned((reg203 ~^ reg194))}));
            end
          if ($signed({$unsigned((&{reg192})), (~reg198)}))
            begin
              reg204 <= ((8'hbd) ?
                  $signed((($unsigned(reg191) | (reg193 >>> reg196)) * ($signed(reg193) ?
                      ((8'h9d) && reg189) : reg194[(1'h1):(1'h0)]))) : (8'hae));
              reg205 <= wire185;
              reg206 <= ((|$signed({(reg199 ? (8'ha0) : reg196),
                  (8'hbc)})) > $unsigned(reg189));
              reg207 <= {wire188[(4'hb):(4'h8)]};
              reg208 <= wire185[(1'h1):(1'h0)];
            end
          else
            begin
              reg204 <= $signed({reg194});
              reg205 <= reg205[(1'h1):(1'h0)];
              reg206 <= ($unsigned(($unsigned($signed(reg196)) ?
                  (&{reg194,
                      wire185}) : reg208)) << $signed((reg205[(3'h5):(2'h3)] != ((wire188 < reg197) <= reg202[(3'h6):(3'h5)]))));
            end
        end
      else
        begin
          reg197 <= $unsigned(reg203);
        end
      reg209 <= {((~{(reg203 ? reg204 : (8'hb1))}) ?
              $unsigned(((~|(7'h41)) ?
                  $unsigned(reg204) : {reg205})) : reg189)};
      if ($unsigned($unsigned(($signed((wire188 ? reg198 : (7'h42))) ?
          {{reg200, wire186}, (wire185 || reg202)} : (reg191[(1'h1):(1'h0)] ?
              $signed(reg193) : $signed((7'h44)))))))
        begin
          reg210 <= $signed((^reg191));
          reg211 <= reg196;
          reg212 <= (~&(($unsigned((reg193 < wire186)) ?
              $unsigned(reg211) : reg206[(4'ha):(1'h1)]) != wire188[(4'hd):(1'h1)]));
          if (wire187)
            begin
              reg213 <= reg208;
            end
          else
            begin
              reg213 <= ((reg195 == reg205[(3'h5):(1'h0)]) > {(-reg201)});
              reg214 <= ($signed(($unsigned((-(8'ha1))) * ((reg193 <= reg208) > ((8'hb0) ?
                      reg204 : (8'hb0))))) ?
                  ((reg192[(3'h6):(3'h6)] >= (reg198 ?
                      reg212 : $unsigned(reg198))) > (reg207 | reg207)) : ((^~wire187) ~^ reg211[(1'h1):(1'h1)]));
              reg215 <= (wire186 ^ $signed((+({reg199, reg199} ?
                  $signed(reg192) : $signed((8'h9d))))));
              reg216 <= reg212;
            end
          reg217 <= reg189[(4'h9):(3'h5)];
        end
      else
        begin
          reg210 <= $unsigned({reg194});
          reg211 <= $unsigned(reg191[(1'h0):(1'h0)]);
          if (reg208)
            begin
              reg212 <= ((8'hbf) ?
                  ((reg197[(2'h2):(1'h1)] ?
                      {((8'ha3) >> reg208),
                          (~^reg214)} : reg192) <= reg209) : wire187[(5'h12):(4'h9)]);
              reg213 <= (&reg193);
            end
          else
            begin
              reg212 <= $unsigned(reg197[(2'h3):(1'h1)]);
              reg213 <= $signed({$signed($unsigned((reg212 ?
                      wire188 : reg197)))});
              reg214 <= (($unsigned($signed(wire187)) ?
                      (reg211 ?
                          $signed($unsigned(wire186)) : ((wire185 + reg217) ?
                              (~&reg202) : (~(8'hb6)))) : ($unsigned(reg208[(5'h15):(4'hc)]) ?
                          $signed((reg215 ? reg215 : reg211)) : (~^reg214))) ?
                  $unsigned({reg191[(1'h1):(1'h1)], reg195}) : (reg206 ?
                      $signed($signed((!reg199))) : (~&$signed((reg204 ?
                          reg214 : reg214)))));
              reg215 <= {$signed($unsigned({$unsigned((7'h41)),
                      reg189[(4'hb):(4'hb)]}))};
            end
          reg216 <= ((8'ha1) ?
              ($unsigned($unsigned((reg204 ^ wire185))) > $unsigned($unsigned($unsigned((8'h9e))))) : reg214);
        end
    end
  assign wire218 = (~|reg215);
  assign wire219 = (^~reg189[(3'h4):(2'h3)]);
  assign wire220 = reg209[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg221 <= {(reg192 >> (($unsigned(wire220) ^ (&reg208)) << ((reg213 | reg197) || reg206[(4'hf):(4'h9)]))),
          {$unsigned({{(8'ha2), reg215}}),
              $signed(($unsigned(reg213) ?
                  wire220[(3'h4):(2'h3)] : (|reg216)))}};
      reg222 <= (((8'haf) ?
              wire188[(4'hb):(4'hb)] : {{$signed(reg213), (~(8'hb8))}}) ?
          ({$unsigned({reg208}), $signed((+wire219))} ?
              (~^reg209) : {($unsigned(reg198) ?
                      (reg198 ~^ reg217) : $unsigned(reg200)),
                  ($unsigned(reg211) >> $signed(reg190))}) : (+reg194));
      reg223 <= ($signed((reg197[(1'h0):(1'h0)] < (reg195 ?
          $unsigned(reg208) : {reg222, reg215}))) != $unsigned({reg212,
          ((reg208 ? wire187 : reg193) >>> (reg192 ? reg197 : reg206))}));
      reg224 <= reg200;
      reg225 <= $unsigned($signed(reg196[(2'h2):(1'h0)]));
    end
  always
    @(posedge clk) begin
      reg226 <= $signed(reg222);
    end
  assign wire227 = ($signed(((!{reg222, reg216}) ?
                       (~|$signed(reg212)) : $signed((reg193 & reg223)))) - reg197[(1'h0):(1'h0)]);
  assign wire228 = (|($unsigned(reg197[(2'h2):(1'h0)]) >= ($unsigned($signed(reg207)) >> {$unsigned(reg215)})));
  assign wire229 = {$unsigned({reg206[(3'h7):(3'h4)]})};
  assign wire230 = (^$unsigned((~&$unsigned($signed(wire229)))));
  assign wire231 = (($signed($signed($unsigned(reg223))) >>> {$signed(reg197[(2'h3):(1'h0)]),
                       {{reg204}}}) << (reg195[(1'h0):(1'h0)] ?
                       (^reg225) : $unsigned($signed($unsigned((8'hb4))))));
  assign wire232 = $unsigned(((-wire187[(4'h8):(3'h7)]) ?
                       (reg213 || wire187[(5'h10):(2'h3)]) : (reg200[(3'h5):(3'h5)] * ((8'h9d) ?
                           wire230[(2'h3):(1'h1)] : {(8'h9f)}))));
  assign wire233 = wire185;
  assign wire234 = reg192[(5'h11):(4'h9)];
endmodule
