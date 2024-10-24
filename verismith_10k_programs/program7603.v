module top
#(parameter param295 = (((+(!{(8'ha7), (8'hb0)})) ? (^((7'h43) ? ((8'hb7) ^~ (8'h9e)) : (~(8'ha6)))) : ({((8'hb9) - (8'ha3)), ((8'hb2) ? (8'hbf) : (8'ha7))} & (((8'haf) ^~ (8'ha2)) ? {(8'ha5)} : ((8'ha2) ? (8'ha3) : (7'h40))))) ~^ (8'h9d)))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1f6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire294;
  wire signed [(5'h10):(1'h0)] wire291;
  wire [(5'h15):(1'h0)] wire290;
  wire [(4'h8):(1'h0)] wire289;
  wire signed [(5'h14):(1'h0)] wire288;
  wire [(5'h10):(1'h0)] wire287;
  wire [(5'h13):(1'h0)] wire286;
  wire signed [(3'h4):(1'h0)] wire285;
  wire [(5'h10):(1'h0)] wire283;
  wire [(3'h5):(1'h0)] wire281;
  wire signed [(5'h15):(1'h0)] wire280;
  wire signed [(5'h13):(1'h0)] wire279;
  wire [(3'h7):(1'h0)] wire278;
  wire signed [(5'h13):(1'h0)] wire277;
  wire signed [(4'hc):(1'h0)] wire276;
  wire signed [(4'hf):(1'h0)] wire275;
  wire signed [(2'h2):(1'h0)] wire274;
  wire signed [(5'h13):(1'h0)] wire272;
  wire [(5'h14):(1'h0)] wire271;
  wire [(5'h15):(1'h0)] wire254;
  reg [(5'h14):(1'h0)] reg293 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg292 = (1'h0);
  reg [(3'h7):(1'h0)] reg256 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg257 = (1'h0);
  reg [(4'he):(1'h0)] reg258 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg259 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg260 = (1'h0);
  reg [(5'h11):(1'h0)] reg261 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg262 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg263 = (1'h0);
  reg [(5'h11):(1'h0)] reg264 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg265 = (1'h0);
  reg [(4'hc):(1'h0)] reg266 = (1'h0);
  reg [(5'h12):(1'h0)] reg267 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg268 = (1'h0);
  reg [(2'h3):(1'h0)] reg269 = (1'h0);
  reg [(3'h4):(1'h0)] reg270 = (1'h0);
  assign y = {wire294,
                 wire291,
                 wire290,
                 wire289,
                 wire288,
                 wire287,
                 wire286,
                 wire285,
                 wire283,
                 wire281,
                 wire280,
                 wire279,
                 wire278,
                 wire277,
                 wire276,
                 wire275,
                 wire274,
                 wire272,
                 wire271,
                 wire254,
                 reg293,
                 reg292,
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
                 (1'h0)};
  module5 #() modinst255 (wire254, clk, wire1, wire4, wire0, wire3, wire2);
  always
    @(posedge clk) begin
      reg256 <= wire254[(2'h3):(2'h2)];
      reg257 <= (&(&((&(wire4 ? wire0 : wire254)) << reg256[(3'h7):(3'h4)])));
      reg258 <= reg257;
      if ((|(reg258[(3'h6):(2'h2)] ? reg256 : wire3[(5'h11):(4'ha)])))
        begin
          if ($unsigned(wire0))
            begin
              reg259 <= $signed((!(((^wire0) ?
                  $unsigned(wire3) : $unsigned(wire0)) ^ wire4)));
              reg260 <= reg257;
            end
          else
            begin
              reg259 <= (($unsigned(reg259[(3'h7):(2'h3)]) ?
                  reg256 : (~(reg259[(3'h7):(3'h5)] <= $unsigned(wire1)))) << {$signed($unsigned(reg256))});
              reg260 <= (({wire3} * wire3[(5'h10):(1'h1)]) < $unsigned((~^wire4)));
              reg261 <= ((reg257 ?
                  (($unsigned((8'ha8)) ^ $unsigned(reg256)) ^~ $unsigned({wire0,
                      (8'hb8)})) : $unsigned((^~(wire1 ?
                      reg256 : wire3)))) >= $signed((-((reg257 ?
                      wire1 : wire2) ?
                  reg257[(3'h4):(1'h0)] : reg257))));
              reg262 <= ($unsigned($signed(((wire3 ?
                      wire0 : wire1) ^ ((8'ha4) ~^ wire1)))) ?
                  (^reg261[(5'h10):(4'h8)]) : $signed(((+$signed((8'h9f))) ?
                      reg260[(3'h6):(1'h0)] : $signed((&wire1)))));
              reg263 <= $unsigned($unsigned((reg260 <<< reg259)));
            end
          reg264 <= $signed($signed({(wire3 ?
                  ((8'ha8) ~^ reg256) : {(8'hb8)})}));
          reg265 <= (wire0[(1'h0):(1'h0)] ~^ ($unsigned({(^wire3)}) ?
              reg263 : (^~$unsigned($unsigned(reg260)))));
          if (reg265)
            begin
              reg266 <= (((reg264 || $signed((-reg260))) <<< reg262) ?
                  $signed(reg265[(2'h3):(1'h0)]) : (|wire4));
              reg267 <= ($signed(wire1[(3'h5):(3'h4)]) || ((((wire3 ?
                          wire0 : reg263) * (+wire4)) ?
                      reg259 : {$signed(reg264)}) ?
                  reg258 : wire0));
              reg268 <= ($unsigned({{reg260, reg258[(3'h5):(1'h1)]}}) ?
                  wire2 : (-(reg261 ?
                      {reg257[(3'h7):(2'h2)]} : $signed(reg261))));
              reg269 <= (reg259 ?
                  ({wire1, wire3} ?
                      (((reg256 > reg265) < {reg260}) >> (reg258[(1'h1):(1'h1)] != (^~reg268))) : {((reg265 ?
                                  reg266 : (8'hba)) ?
                              $unsigned(wire3) : wire4[(3'h4):(1'h1)])}) : wire0[(5'h12):(5'h11)]);
              reg270 <= $unsigned(reg265);
            end
          else
            begin
              reg266 <= reg264[(4'h9):(3'h7)];
              reg267 <= (&(|$unsigned($unsigned(((8'hbb) ? reg270 : reg260)))));
              reg268 <= $signed((8'hbe));
              reg269 <= ((($signed($signed(wire4)) == ({(8'haa)} ?
                  (wire0 ?
                      reg259 : reg261) : $signed(wire254))) & (reg257[(3'h7):(1'h1)] >>> $unsigned((!reg269)))) == $signed(wire4));
              reg270 <= $signed($unsigned($unsigned(reg256)));
            end
        end
      else
        begin
          reg259 <= ($signed((8'hb4)) ^ (|(8'ha4)));
          reg260 <= (((wire3[(4'hc):(3'h4)] ~^ $unsigned($unsigned(wire0))) ?
              {$unsigned(wire254)} : ((reg265 << (reg259 >>> wire2)) ^~ (+(~^reg261)))) ~^ (((^(wire0 ?
              wire3 : reg264)) >= reg261) < (8'ha5)));
        end
    end
  assign wire271 = {(wire254 && ($signed(reg257) ? reg269 : reg269))};
  module5 #() modinst273 (wire272, clk, reg258, reg267, reg261, wire254, wire271);
  assign wire274 = wire272;
  assign wire275 = $signed(reg268[(2'h3):(1'h0)]);
  assign wire276 = ((|(^$unsigned((|wire272)))) | reg268);
  assign wire277 = $unsigned(wire1[(4'h9):(3'h4)]);
  assign wire278 = reg259;
  assign wire279 = reg256[(3'h7):(2'h2)];
  assign wire280 = reg256[(1'h0):(1'h0)];
  module198 #() modinst282 (.wire202(reg266), .wire199(reg257), .clk(clk), .y(wire281), .wire200(wire3), .wire201(wire279));
  module77 #() modinst284 (wire283, clk, wire0, wire1, wire280, wire3);
  assign wire285 = $unsigned(reg257[(3'h6):(2'h3)]);
  assign wire286 = $unsigned(($signed(reg262) ?
                       wire283 : ($signed({reg267,
                           reg269}) & ($signed(reg261) ~^ {reg265}))));
  assign wire287 = ((((-wire278) > wire278) <= (wire0 && $unsigned($unsigned(reg259)))) || reg263);
  assign wire288 = {$unsigned($signed($signed(((8'hbf) ~^ wire278)))),
                       (!(((wire278 ? (8'ha8) : wire276) ?
                               {wire0} : $signed(reg266)) ?
                           (^~(~|reg266)) : reg256))};
  assign wire289 = {(^wire4[(3'h4):(1'h0)])};
  assign wire290 = (($signed($signed($unsigned(wire272))) == ((-(wire4 ?
                           reg267 : reg262)) ?
                       ((reg270 ? reg256 : wire286) ?
                           ((8'hb3) | wire278) : (^wire4)) : (|(reg258 ?
                           wire1 : reg264)))) != {$unsigned($unsigned((wire276 ?
                           wire3 : wire283))),
                       $unsigned(((wire288 ? (8'hb8) : wire1) < (wire254 ?
                           reg268 : reg267)))});
  assign wire291 = $unsigned(($signed((~|$signed((8'hb9)))) ?
                       (($unsigned(wire1) >> (wire289 ^ wire281)) - ((~^wire288) ^~ {wire276,
                           wire278})) : $unsigned($unsigned({wire4,
                           wire281}))));
  always
    @(posedge clk) begin
      reg292 <= reg259[(3'h4):(1'h0)];
      reg293 <= ($signed(($signed(reg260[(3'h4):(1'h0)]) ^ $unsigned({reg260,
          reg257}))) + $signed((reg269[(2'h3):(2'h2)] ?
          wire274[(1'h1):(1'h0)] : $unsigned(reg259))));
    end
  assign wire294 = (+($signed(reg268[(2'h3):(2'h2)]) ^~ reg260));
endmodule

module module5
#(parameter param252 = ((|{(&((8'hac) > (8'hbd))), (|(7'h41))}) ? ((~((|(8'ha3)) ^ ((8'hb0) ? (8'hb0) : (8'hb3)))) ? {((!(8'ha4)) ? ((7'h40) ? (8'ha5) : (8'haf)) : ((8'hbf) != (8'hbe))), ((8'h9c) ? {(8'ha5)} : (^~(8'hbd)))} : {(((8'hac) <<< (8'ha5)) << ((8'hb1) ? (8'hb2) : (8'h9e)))}) : (((((7'h42) ? (8'ha4) : (7'h42)) ? ((8'hbd) < (8'h9c)) : ((8'hb6) >>> (8'ha7))) ? (^~{(8'ha3)}) : (((8'hb4) ? (8'hab) : (8'hb6)) > ((8'ha2) << (8'hb2)))) ? (({(7'h40)} ? ((8'haf) != (8'haf)) : (!(8'ha0))) ? ((~&(7'h42)) >= ((8'hb5) ? (8'hb5) : (7'h41))) : ({(8'hba), (8'hbc)} ? {(8'ha9)} : ((8'ha5) ? (8'hb9) : (8'h9c)))) : (~|{{(8'hb3), (8'haf)}, (+(8'hba))}))), 
parameter param253 = (param252 >>> (|param252)))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire6;
  input wire [(5'h12):(1'h0)] wire7;
  input wire signed [(3'h5):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire251;
  wire [(5'h15):(1'h0)] wire146;
  wire [(5'h14):(1'h0)] wire76;
  wire [(5'h15):(1'h0)] wire74;
  wire signed [(4'he):(1'h0)] wire46;
  wire [(4'ha):(1'h0)] wire45;
  wire [(5'h14):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire43;
  wire signed [(4'h8):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire41;
  wire signed [(5'h12):(1'h0)] wire40;
  wire [(4'hc):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire195;
  wire signed [(4'hd):(1'h0)] wire197;
  wire signed [(2'h3):(1'h0)] wire249;
  reg signed [(5'h12):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg151 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg150 = (1'h0);
  reg [(5'h10):(1'h0)] reg149 = (1'h0);
  reg [(3'h7):(1'h0)] reg148 = (1'h0);
  reg [(5'h14):(1'h0)] reg47 = (1'h0);
  assign y = {wire251,
                 wire146,
                 wire76,
                 wire74,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire38,
                 wire195,
                 wire197,
                 wire249,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg47,
                 (1'h0)};
  module11 #() modinst39 (wire38, clk, wire10, wire7, wire6, wire8, wire9);
  assign wire40 = wire10;
  assign wire41 = wire6[(4'h9):(2'h2)];
  assign wire42 = ({wire6} ? {wire41} : wire7);
  assign wire43 = $signed((($signed((8'ha7)) | ((wire7 == wire6) ?
                          wire7 : $unsigned(wire8))) ?
                      ((~$unsigned(wire7)) < ($signed(wire6) ~^ wire10)) : (wire10[(5'h13):(4'hd)] ?
                          wire41 : ($signed(wire9) || $signed(wire7)))));
  assign wire44 = ((8'hbe) ?
                      wire7[(4'hf):(2'h3)] : (wire43 ?
                          ({(wire9 ?
                                  (8'hbf) : (8'hab))} | $signed(wire38)) : $signed($unsigned($signed(wire9)))));
  assign wire45 = ($unsigned($unsigned($unsigned(wire7[(4'he):(1'h1)]))) ?
                      (8'had) : wire7[(5'h12):(3'h5)]);
  assign wire46 = wire9[(3'h6):(1'h1)];
  always
    @(posedge clk) begin
      reg47 <= ((wire7 && $unsigned(wire6)) + wire43[(2'h3):(2'h2)]);
    end
  module48 #() modinst75 (wire74, clk, reg47, wire41, wire10, wire44, wire42);
  assign wire76 = ((7'h40) ? wire38 : wire43);
  module77 #() modinst147 (.wire79(wire45), .y(wire146), .wire78(reg47), .clk(clk), .wire80(wire41), .wire81(wire38));
  always
    @(posedge clk) begin
      reg148 <= {(!($signed(wire40) ?
              (wire7[(4'hd):(2'h3)] ?
                  ((8'hb4) ? (8'hb1) : wire42) : $unsigned(wire146)) : wire9))};
    end
  always
    @(posedge clk) begin
      reg149 <= wire76;
      reg150 <= wire8[(3'h4):(1'h1)];
      reg151 <= {(-$signed($signed((wire44 ? reg47 : wire74)))),
          (wire44[(4'hd):(3'h6)] ?
              (-$signed((wire9 ? wire7 : wire10))) : ((wire74 ?
                  $signed(wire43) : ((8'h9f) ?
                      wire41 : wire76)) + ((^wire6) < (wire9 ^ wire43))))};
      reg152 <= (^~((wire43[(3'h7):(3'h6)] ?
              wire146[(4'h9):(3'h7)] : $unsigned((^~wire42))) ?
          wire6 : reg149[(2'h3):(1'h0)]));
      reg153 <= (8'hbb);
    end
  module154 #() modinst196 (.y(wire195), .wire156(reg152), .wire157(reg153), .wire158(wire45), .wire159(wire44), .clk(clk), .wire155(reg150));
  assign wire197 = $unsigned($signed((+(^$signed(wire44)))));
  module198 #() modinst250 (.wire199(reg150), .clk(clk), .wire202(wire6), .wire200(wire46), .wire201(wire74), .y(wire249));
  assign wire251 = ($signed($unsigned(((wire8 && wire42) > wire42))) ?
                       $unsigned($signed(wire8)) : $unsigned($unsigned($signed($signed(wire40)))));
endmodule

module module198
#(parameter param248 = {((((8'ha2) ? ((8'hb6) ? (8'ha7) : (8'ha5)) : (!(8'ha6))) ? (((8'hae) ? (8'hba) : (8'h9d)) ? ((8'hb0) != (8'hb0)) : ((8'h9d) >> (8'hb0))) : (!(~^(8'hb2)))) + (|(~&(~^(8'h9e)))))})
(y, clk, wire202, wire201, wire200, wire199);
  output wire [(32'h1e2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire202;
  input wire signed [(3'h5):(1'h0)] wire201;
  input wire signed [(4'he):(1'h0)] wire200;
  input wire [(3'h7):(1'h0)] wire199;
  wire [(5'h12):(1'h0)] wire245;
  wire signed [(5'h15):(1'h0)] wire244;
  wire [(2'h2):(1'h0)] wire230;
  wire [(4'hb):(1'h0)] wire225;
  wire [(3'h5):(1'h0)] wire224;
  wire signed [(3'h7):(1'h0)] wire203;
  reg [(4'hb):(1'h0)] reg247 = (1'h0);
  reg [(3'h4):(1'h0)] reg246 = (1'h0);
  reg [(3'h6):(1'h0)] reg243 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg242 = (1'h0);
  reg [(3'h6):(1'h0)] reg241 = (1'h0);
  reg [(3'h7):(1'h0)] reg240 = (1'h0);
  reg [(4'hb):(1'h0)] reg239 = (1'h0);
  reg [(4'h9):(1'h0)] reg238 = (1'h0);
  reg [(4'hd):(1'h0)] reg237 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg236 = (1'h0);
  reg [(4'hb):(1'h0)] reg235 = (1'h0);
  reg [(4'hb):(1'h0)] reg234 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg233 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg232 = (1'h0);
  reg [(4'h9):(1'h0)] reg231 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg229 = (1'h0);
  reg [(5'h12):(1'h0)] reg228 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg227 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg226 = (1'h0);
  reg [(5'h11):(1'h0)] reg223 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg222 = (1'h0);
  reg [(4'hf):(1'h0)] reg221 = (1'h0);
  reg [(4'ha):(1'h0)] reg220 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg219 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg218 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg217 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg216 = (1'h0);
  reg signed [(4'he):(1'h0)] reg215 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg214 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg213 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg212 = (1'h0);
  reg [(4'hf):(1'h0)] reg211 = (1'h0);
  reg [(3'h7):(1'h0)] reg210 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg209 = (1'h0);
  reg [(2'h3):(1'h0)] reg208 = (1'h0);
  reg [(3'h5):(1'h0)] reg207 = (1'h0);
  reg [(3'h7):(1'h0)] reg206 = (1'h0);
  reg [(5'h11):(1'h0)] reg205 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg204 = (1'h0);
  assign y = {wire245,
                 wire244,
                 wire230,
                 wire225,
                 wire224,
                 wire203,
                 reg247,
                 reg246,
                 reg243,
                 reg242,
                 reg241,
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
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg223,
                 reg222,
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
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 (1'h0)};
  assign wire203 = ((wire200[(4'hd):(2'h2)] | (({(8'ha8), wire202} ?
                               (!(8'h9c)) : (wire200 ? wire200 : wire199)) ?
                           wire201 : $unsigned($unsigned(wire199)))) ?
                       {(wire199[(2'h3):(2'h3)] && wire202[(3'h6):(3'h4)])} : ((wire202[(4'h9):(1'h1)] * {wire201[(3'h5):(2'h2)],
                           $signed(wire199)}) + wire199));
  always
    @(posedge clk) begin
      if ((-wire202))
        begin
          reg204 <= (!wire199);
          reg205 <= {{$unsigned(wire203), reg204[(1'h0):(1'h0)]}};
          if ($unsigned(((wire203[(3'h7):(3'h7)] ?
              wire200 : $unsigned((~^reg204))) >>> wire200[(4'hb):(2'h2)])))
            begin
              reg206 <= wire202;
              reg207 <= wire201;
              reg208 <= (wire203[(1'h1):(1'h0)] << (~|wire202[(3'h6):(3'h6)]));
              reg209 <= $unsigned(((7'h43) < reg207[(1'h1):(1'h0)]));
              reg210 <= (~$unsigned(($unsigned((-(8'hb7))) | $unsigned((wire203 ?
                  wire201 : reg208)))));
            end
          else
            begin
              reg206 <= {reg208[(2'h2):(1'h0)]};
              reg207 <= $unsigned((~|$unsigned(((wire201 ?
                  reg205 : (8'hba)) <= (wire203 ? reg207 : reg209)))));
              reg208 <= ((8'hbd) || reg208[(1'h0):(1'h0)]);
              reg209 <= $signed(wire199);
              reg210 <= wire201;
            end
          reg211 <= (reg206[(3'h6):(3'h5)] - (((8'hb0) ?
                  $signed((&reg207)) : wire199) ?
              (((wire201 && reg205) != (~&(7'h40))) ?
                  reg209[(2'h2):(1'h0)] : (^~reg205)) : (^~(^~(reg205 ?
                  reg209 : reg209)))));
          reg212 <= reg208[(1'h0):(1'h0)];
        end
      else
        begin
          if ((~&reg205[(4'ha):(2'h3)]))
            begin
              reg204 <= $signed(reg208[(2'h3):(2'h3)]);
              reg205 <= (~^(+($signed((reg209 != reg212)) * ($unsigned(wire200) ?
                  wire199[(3'h4):(2'h2)] : reg210[(3'h6):(3'h6)]))));
              reg206 <= {reg211[(4'hd):(3'h7)],
                  ((^~wire199[(3'h4):(2'h2)]) < reg210[(3'h4):(2'h2)])};
              reg207 <= $signed((!$unsigned(wire201[(1'h0):(1'h0)])));
              reg208 <= (-wire202);
            end
          else
            begin
              reg204 <= (($unsigned($unsigned($signed(wire199))) >= reg206[(2'h2):(2'h2)]) ?
                  wire199 : ((~|$signed(reg204[(2'h3):(1'h0)])) ?
                      wire203 : $signed(reg205[(2'h2):(1'h1)])));
              reg205 <= ({($signed({reg204}) == ((reg206 | (8'h9f)) | {reg208})),
                      $unsigned(reg208[(1'h1):(1'h0)])} ?
                  ((reg210[(1'h1):(1'h1)] ?
                          reg211[(4'hf):(4'hd)] : reg206[(3'h6):(1'h1)]) ?
                      wire199[(3'h4):(2'h2)] : $signed($signed($unsigned(reg211)))) : (({$signed(reg210),
                      (reg210 <<< wire203)} || $unsigned((wire202 ?
                      reg212 : reg209))) != $unsigned((~wire199))));
            end
          reg209 <= ($unsigned((+wire199)) ? reg204[(4'he):(2'h3)] : reg205);
        end
      reg213 <= ((8'ha0) == (reg212[(4'h9):(4'h9)] >> ($unsigned({reg211}) - $signed(wire202))));
      reg214 <= $unsigned((8'ha5));
      reg215 <= $unsigned((+$signed($unsigned((wire199 ? wire202 : reg211)))));
      reg216 <= (($signed($signed((reg209 == wire199))) || ($unsigned(reg208) ?
              (wire203 ? (reg209 < (8'hba)) : {reg207}) : {(~|reg205),
                  (reg208 ? reg215 : reg214)})) ?
          ((((!reg209) < ((8'h9e) ? reg211 : reg215)) ?
                  reg206 : ($unsigned(reg211) >> $signed(wire203))) ?
              $unsigned($unsigned(reg209[(1'h0):(1'h0)])) : (8'hbd)) : reg212);
    end
  always
    @(posedge clk) begin
      if ((^$unsigned(($signed($signed(reg206)) >= reg216[(4'hb):(4'h8)]))))
        begin
          reg217 <= ($signed(reg214) == wire199);
          reg218 <= $signed((wire200[(3'h6):(2'h2)] ?
              {($unsigned(reg216) && reg215),
                  ((!wire200) ?
                      (reg217 ?
                          wire203 : reg207) : (+reg215))} : reg206[(3'h7):(3'h7)]));
          reg219 <= $unsigned((($unsigned($signed(reg210)) ?
                  (((8'hb2) ?
                      (8'haa) : reg206) >= $unsigned(reg215)) : $unsigned((wire200 ?
                      wire202 : reg206))) ?
              {$unsigned(reg205), reg206[(1'h1):(1'h0)]} : $signed(((wire203 ?
                  reg218 : reg217) || reg210[(1'h1):(1'h1)]))));
          if ({wire200})
            begin
              reg220 <= reg215[(3'h7):(1'h0)];
              reg221 <= reg213[(2'h2):(1'h1)];
            end
          else
            begin
              reg220 <= $unsigned(((^~((~^reg214) ?
                      ((8'h9f) ? (8'hbf) : wire201) : ((8'hb3) >> reg217))) ?
                  (wire201 ?
                      $signed({wire202, reg207}) : {(|wire201)}) : (reg216 ?
                      $signed((~&reg221)) : (^~(wire199 - reg215)))));
              reg221 <= $unsigned($signed((~&($signed(reg219) ?
                  ((8'ha1) ? reg216 : (8'ha4)) : $unsigned((8'hb0))))));
              reg222 <= $unsigned((-$unsigned(((~|reg221) ~^ (~^reg209)))));
              reg223 <= (reg214[(3'h4):(3'h4)] < ((((reg207 ?
                          reg209 : wire202) ?
                      reg222 : reg212[(5'h13):(4'hd)]) | (~$unsigned(reg215))) ?
                  reg216[(1'h0):(1'h0)] : $signed(((reg209 ?
                      wire202 : (8'hb2)) ~^ (|(8'h9f))))));
            end
        end
      else
        begin
          if (((~reg206) || ({$signed(reg221[(4'hf):(2'h2)]),
              reg206} + (((wire203 ?
              reg218 : (8'hbe)) <= {reg221}) ^~ $signed($signed(wire202))))))
            begin
              reg217 <= {reg208,
                  ($unsigned($signed($signed(reg205))) | $signed(((wire202 >= wire201) == (!reg210))))};
              reg218 <= {{$signed(((reg210 || wire200) >> $unsigned(wire202))),
                      ((^(reg212 ?
                          (8'hab) : reg211)) >> reg218[(4'h8):(3'h4)])},
                  ((&((wire201 ? wire201 : reg216) ?
                      (reg218 ?
                          reg221 : reg208) : (7'h44))) <<< $unsigned($signed(reg205)))};
            end
          else
            begin
              reg217 <= reg207;
              reg218 <= $unsigned($signed(((&(8'h9e)) >= reg213)));
              reg219 <= $unsigned($signed({(~|reg223[(3'h7):(2'h2)])}));
            end
          reg220 <= ($signed((|reg223[(1'h1):(1'h0)])) ?
              reg222 : $signed(reg216[(3'h7):(1'h1)]));
          reg221 <= reg219;
        end
    end
  assign wire224 = {(~reg216[(4'h8):(3'h5)]),
                       $signed((reg208 ?
                           (^(~|wire201)) : (reg206[(2'h2):(1'h0)] ?
                               (reg204 == wire201) : wire199)))};
  assign wire225 = $signed(reg218[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg226 <= wire225[(2'h2):(1'h0)];
      reg227 <= $signed($unsigned($unsigned(($signed(wire202) ?
          {reg218, reg216} : $signed((8'hbc))))));
      reg228 <= (reg213[(4'hb):(3'h7)] > $signed((($unsigned(wire200) ?
          $signed(reg223) : $unsigned(reg210)) - reg221[(3'h4):(2'h2)])));
      reg229 <= wire201[(1'h0):(1'h0)];
    end
  assign wire230 = (((($signed((8'hb3)) << (wire201 ^ (8'ha2))) >>> {(reg205 ?
                           reg205 : reg215),
                       wire200[(4'hb):(4'ha)]}) > (-$unsigned(reg222))) * $unsigned((8'ha0)));
  always
    @(posedge clk) begin
      if ((^~reg210[(3'h5):(1'h1)]))
        begin
          reg231 <= $unsigned(((wire199[(3'h4):(3'h4)] ?
              reg216[(2'h3):(1'h0)] : wire199) | (wire199[(3'h4):(3'h4)] >> $signed(wire201[(2'h2):(1'h0)]))));
          if ((8'hbc))
            begin
              reg232 <= ({reg228[(1'h0):(1'h0)]} ?
                  $unsigned((^reg207[(2'h3):(2'h3)])) : (7'h42));
              reg233 <= (~&(8'hbb));
              reg234 <= (reg220 ?
                  (^reg207) : $signed($unsigned((~|(|reg204)))));
              reg235 <= $unsigned($unsigned($signed(reg222[(4'hb):(2'h3)])));
            end
          else
            begin
              reg232 <= reg226[(2'h2):(2'h2)];
            end
          reg236 <= (|$unsigned($unsigned($signed(reg215[(4'ha):(4'h9)]))));
          if (($unsigned((+$unsigned((reg234 >> reg226)))) ?
              (|wire230[(2'h2):(2'h2)]) : $signed((~$unsigned((reg228 ?
                  reg221 : reg212))))))
            begin
              reg237 <= $signed((~reg229[(1'h1):(1'h0)]));
            end
          else
            begin
              reg237 <= (((+(reg220 ?
                      $unsigned(reg206) : (reg205 >> reg218))) ^ reg213[(4'ha):(4'h9)]) ?
                  (wire200[(2'h2):(2'h2)] > $signed(((reg214 ?
                          reg227 : wire199) ?
                      reg233[(4'h8):(1'h0)] : $signed(reg228)))) : (8'ha1));
              reg238 <= $signed((($unsigned((+wire225)) ?
                      (reg208[(1'h1):(1'h0)] ?
                          reg234 : $unsigned(reg214)) : ((8'hb7) ?
                          reg213[(1'h0):(1'h0)] : (reg216 ? reg229 : reg226))) ?
                  ((8'haa) & (8'hb6)) : $signed(($unsigned(wire225) >> $signed(wire224)))));
              reg239 <= $unsigned(wire199);
              reg240 <= {(^~$signed({{reg226}})),
                  {({wire201[(1'h0):(1'h0)], reg235[(1'h0):(1'h0)]} ?
                          $signed(wire199) : reg210)}};
              reg241 <= ($unsigned(reg221[(4'ha):(2'h3)]) | (~{reg216[(3'h6):(2'h3)]}));
            end
        end
      else
        begin
          reg231 <= ((((~&(reg220 > reg228)) >= $unsigned((~&reg222))) < reg229[(2'h3):(1'h1)]) ?
              (~^$unsigned($unsigned((wire199 >= reg228)))) : reg220);
          reg232 <= (reg214[(2'h2):(1'h1)] ?
              (+reg207[(1'h0):(1'h0)]) : (reg223 ?
                  $signed(((reg220 ^ reg211) >= reg228)) : (^~wire203)));
        end
      reg242 <= (reg217[(4'hb):(4'h9)] ?
          ((^~wire224) ?
              reg214[(2'h2):(2'h2)] : ($signed($signed(reg241)) ?
                  $signed($signed(reg217)) : {{reg217},
                      {reg234}})) : reg216[(3'h4):(3'h4)]);
      reg243 <= ((reg206 ? wire203 : $unsigned((&(reg242 ? reg221 : reg234)))) ?
          $unsigned($unsigned({reg215[(4'h8):(3'h5)]})) : reg235[(3'h7):(3'h4)]);
    end
  assign wire244 = reg209;
  assign wire245 = reg235[(3'h7):(2'h3)];
  always
    @(posedge clk) begin
      reg246 <= $signed(($unsigned(reg205) ~^ reg226));
      reg247 <= reg217;
    end
endmodule

module module154  (y, clk, wire159, wire158, wire157, wire156, wire155);
  output wire [(32'h188):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire159;
  input wire [(4'ha):(1'h0)] wire158;
  input wire signed [(5'h12):(1'h0)] wire157;
  input wire [(2'h3):(1'h0)] wire156;
  input wire [(3'h5):(1'h0)] wire155;
  wire [(3'h5):(1'h0)] wire194;
  wire [(5'h15):(1'h0)] wire193;
  wire [(4'hc):(1'h0)] wire192;
  wire [(4'hb):(1'h0)] wire191;
  wire signed [(3'h5):(1'h0)] wire190;
  wire [(4'ha):(1'h0)] wire189;
  wire [(5'h15):(1'h0)] wire188;
  wire signed [(3'h5):(1'h0)] wire187;
  wire [(4'hd):(1'h0)] wire186;
  wire [(3'h7):(1'h0)] wire185;
  wire signed [(4'hb):(1'h0)] wire184;
  wire signed [(4'h8):(1'h0)] wire174;
  wire [(4'hd):(1'h0)] wire164;
  wire signed [(5'h14):(1'h0)] wire163;
  wire signed [(4'h8):(1'h0)] wire162;
  wire signed [(5'h10):(1'h0)] wire161;
  wire signed [(4'hf):(1'h0)] wire160;
  reg signed [(4'hb):(1'h0)] reg183 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg182 = (1'h0);
  reg [(4'hc):(1'h0)] reg181 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg180 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg179 = (1'h0);
  reg [(3'h4):(1'h0)] reg178 = (1'h0);
  reg [(4'hd):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg176 = (1'h0);
  reg [(4'he):(1'h0)] reg175 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg173 = (1'h0);
  reg [(2'h3):(1'h0)] reg172 = (1'h0);
  reg [(4'hd):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg170 = (1'h0);
  reg [(5'h13):(1'h0)] reg169 = (1'h0);
  reg [(3'h7):(1'h0)] reg168 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg165 = (1'h0);
  assign y = {wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire174,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 (1'h0)};
  assign wire160 = (($signed({(^wire157)}) || ({((8'hb4) == wire156),
                               (wire159 ? (8'hb8) : wire158)} ?
                           wire159[(2'h2):(1'h0)] : ((wire157 + wire157) > wire158))) ?
                       ($signed($unsigned({wire157})) ?
                           (!{(wire159 & wire156),
                               (wire155 ?
                                   wire157 : wire157)}) : (8'ha2)) : ({wire155[(2'h3):(2'h2)]} ?
                           wire155 : ($signed($unsigned((8'ha4))) > (~^(wire157 ?
                               wire155 : (7'h42))))));
  assign wire161 = (wire159[(4'h8):(2'h2)] != wire157);
  assign wire162 = $signed((wire159 ?
                       wire155[(2'h3):(2'h3)] : (((^wire158) ?
                           {wire160} : $unsigned(wire159)) > ((!wire158) ?
                           ((8'ha4) <= wire156) : (wire158 ?
                               wire160 : wire161)))));
  assign wire163 = {wire155[(3'h4):(2'h2)]};
  assign wire164 = wire159[(5'h12):(4'ha)];
  always
    @(posedge clk) begin
      reg165 <= (8'h9d);
      reg166 <= ((-wire164) ?
          (|wire164) : $unsigned(($unsigned((~|wire156)) < $unsigned($signed(wire164)))));
      reg167 <= $unsigned($unsigned($signed((-{wire157, wire162}))));
      if ($signed($signed($unsigned(((reg167 ? reg165 : wire164) ?
          (wire159 && (8'haa)) : wire156[(2'h2):(1'h0)])))))
        begin
          if ((~^$unsigned((((wire161 >> wire164) ?
                  wire164[(3'h7):(2'h3)] : {wire156, (8'hb6)}) ?
              (+$unsigned(wire155)) : (~|(wire155 ? wire162 : reg165))))))
            begin
              reg168 <= ($unsigned((^~(8'hb5))) ?
                  ($unsigned(($unsigned(wire158) ?
                          wire161[(1'h1):(1'h1)] : {(8'ha9)})) ?
                      $signed((wire158[(3'h6):(3'h5)] ?
                          reg167 : (wire164 | reg165))) : {$signed($unsigned((8'ha8)))}) : wire156[(2'h3):(1'h0)]);
              reg169 <= (+wire162[(1'h0):(1'h0)]);
              reg170 <= wire161;
              reg171 <= reg168;
              reg172 <= ($unsigned({wire163[(5'h10):(3'h6)]}) != wire160);
            end
          else
            begin
              reg168 <= {(~wire163[(3'h5):(1'h1)])};
              reg169 <= wire159;
              reg170 <= (^~$unsigned($unsigned($unsigned(wire159))));
            end
        end
      else
        begin
          reg168 <= {($unsigned($unsigned($signed(wire155))) ?
                  (((|reg165) ^ ((8'hae) - wire160)) ?
                      wire161[(3'h4):(2'h2)] : $signed($unsigned(wire155))) : (-((reg169 ?
                      reg168 : reg165) < $signed(wire158))))};
        end
      reg173 <= ($unsigned((wire155 ?
              $signed($unsigned((8'hb1))) : {(8'ha6), $unsigned(wire159)})) ?
          {wire164[(4'hc):(3'h4)],
              (8'hb7)} : ((~|wire161) + (&($signed(wire157) ?
              $unsigned((8'ha4)) : (wire160 | (8'hb7))))));
    end
  assign wire174 = reg171[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      if ((($signed($signed(wire162[(4'h8):(3'h7)])) - {$unsigned(reg166[(1'h0):(1'h0)])}) >>> (($unsigned(wire156[(2'h2):(1'h1)]) ^~ wire163) ?
          ($unsigned((reg170 ? reg172 : reg173)) ?
              $signed($signed(reg166)) : $unsigned($unsigned(reg166))) : (~|$unsigned((reg165 ?
              (8'hac) : wire163))))))
        begin
          reg175 <= wire174[(3'h4):(1'h0)];
          reg176 <= wire155[(3'h5):(3'h4)];
          reg177 <= (wire155[(3'h4):(3'h4)] <<< $unsigned(wire156[(1'h1):(1'h1)]));
        end
      else
        begin
          reg175 <= ({(8'haa),
              (^$unsigned($signed(wire157)))} + (~$signed((reg176[(4'hb):(3'h6)] ?
              (wire161 == wire155) : $unsigned((8'ha3))))));
          reg176 <= $signed(($unsigned((wire157[(3'h5):(1'h0)] ~^ (reg167 ?
              wire163 : reg175))) && ((wire159 < {(8'hbb), reg172}) ?
              ((reg166 || wire158) == (+wire155)) : (!reg171[(1'h0):(1'h0)]))));
          reg177 <= wire157;
          reg178 <= (|(&$unsigned(($unsigned(wire158) >>> reg170[(2'h3):(2'h3)]))));
          reg179 <= wire159[(4'ha):(1'h1)];
        end
      reg180 <= $signed(reg172);
      reg181 <= ($signed(reg168[(3'h5):(3'h5)]) != (+wire174[(3'h4):(2'h3)]));
      reg182 <= {reg178[(1'h1):(1'h0)]};
      reg183 <= reg173[(1'h1):(1'h1)];
    end
  assign wire184 = reg165;
  assign wire185 = {(reg175[(3'h5):(3'h4)] != ((8'haf) >= reg176[(1'h0):(1'h0)]))};
  assign wire186 = {reg168,
                       (reg181[(4'hc):(4'hb)] ?
                           reg180[(2'h3):(1'h1)] : $unsigned((reg180 ~^ reg179[(3'h6):(3'h4)])))};
  assign wire187 = $unsigned((reg171[(3'h6):(2'h3)] && reg179[(2'h2):(1'h0)]));
  assign wire188 = (($signed(wire174) ? wire155 : {(^~(8'ha2))}) ?
                       {$unsigned(($unsigned(reg176) ?
                               $unsigned(reg183) : (reg178 * wire184))),
                           wire174} : {(^~wire163),
                           (((wire163 || (8'haa)) ?
                                   (reg180 ~^ reg175) : (wire162 ?
                                       reg171 : wire156)) ?
                               (wire164 ?
                                   (wire161 >= reg175) : $signed(wire163)) : reg167[(2'h3):(1'h1)])});
  assign wire189 = wire185[(3'h5):(2'h2)];
  assign wire190 = (((((wire163 ^ reg175) & $unsigned((8'h9e))) << ((~^wire189) & $unsigned(reg183))) ^ reg169) && $signed((($signed((8'haa)) ?
                           (!wire159) : ((8'ha1) & (8'ha7))) ?
                       wire163[(4'hd):(4'hc)] : {(8'ha6)})));
  assign wire191 = $unsigned((^$signed(reg176)));
  assign wire192 = reg178;
  assign wire193 = (^~$unsigned($signed(reg170)));
  assign wire194 = ($unsigned($unsigned(((wire155 ^ (8'hbf)) >= (8'hb1)))) ?
                       reg179 : (~$unsigned(($signed((8'ha6)) ?
                           $unsigned((8'ha0)) : reg173))));
endmodule

module module77
#(parameter param144 = ((~|(~(~((8'h9c) | (8'hb5))))) | (&((((8'hb3) ? (8'ha7) : (8'ha1)) ? (^(8'hbf)) : ((7'h42) ? (8'h9f) : (8'hb8))) & (!{(8'ha4)})))), 
parameter param145 = ((|param144) >= ((~^((8'hb0) ? param144 : (param144 ? param144 : (8'ha9)))) ? (&((|param144) ~^ (param144 ^ param144))) : param144)))
(y, clk, wire81, wire80, wire79, wire78);
  output wire [(32'h2da):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire81;
  input wire [(3'h6):(1'h0)] wire80;
  input wire signed [(4'ha):(1'h0)] wire79;
  input wire [(5'h14):(1'h0)] wire78;
  wire [(2'h2):(1'h0)] wire115;
  wire [(4'ha):(1'h0)] wire111;
  wire [(5'h15):(1'h0)] wire110;
  wire [(3'h7):(1'h0)] wire109;
  wire signed [(4'h9):(1'h0)] wire108;
  wire signed [(5'h11):(1'h0)] wire107;
  wire signed [(5'h11):(1'h0)] wire106;
  wire [(2'h2):(1'h0)] wire105;
  wire [(3'h6):(1'h0)] wire104;
  wire [(4'h8):(1'h0)] wire103;
  wire [(4'ha):(1'h0)] wire102;
  wire [(4'hc):(1'h0)] wire101;
  wire signed [(3'h5):(1'h0)] wire100;
  wire signed [(3'h6):(1'h0)] wire99;
  reg [(2'h2):(1'h0)] reg143 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg142 = (1'h0);
  reg [(4'hb):(1'h0)] reg141 = (1'h0);
  reg [(2'h3):(1'h0)] reg140 = (1'h0);
  reg [(2'h3):(1'h0)] reg139 = (1'h0);
  reg [(4'ha):(1'h0)] reg138 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg136 = (1'h0);
  reg [(4'he):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg134 = (1'h0);
  reg [(4'h9):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg132 = (1'h0);
  reg [(4'h9):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg129 = (1'h0);
  reg [(5'h13):(1'h0)] reg128 = (1'h0);
  reg [(5'h10):(1'h0)] reg127 = (1'h0);
  reg [(3'h7):(1'h0)] reg126 = (1'h0);
  reg [(4'hf):(1'h0)] reg125 = (1'h0);
  reg [(4'hf):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg122 = (1'h0);
  reg [(5'h14):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg120 = (1'h0);
  reg [(4'h9):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg118 = (1'h0);
  reg [(4'h9):(1'h0)] reg117 = (1'h0);
  reg [(4'ha):(1'h0)] reg116 = (1'h0);
  reg [(2'h2):(1'h0)] reg114 = (1'h0);
  reg [(4'h9):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg112 = (1'h0);
  reg [(5'h13):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg94 = (1'h0);
  reg [(4'hf):(1'h0)] reg93 = (1'h0);
  reg [(4'he):(1'h0)] reg92 = (1'h0);
  reg [(5'h15):(1'h0)] reg91 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg90 = (1'h0);
  reg [(5'h15):(1'h0)] reg89 = (1'h0);
  reg [(4'hf):(1'h0)] reg88 = (1'h0);
  reg [(4'h8):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg86 = (1'h0);
  reg [(4'h9):(1'h0)] reg85 = (1'h0);
  reg [(5'h13):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg82 = (1'h0);
  assign y = {wire115,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
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
                 reg114,
                 reg113,
                 reg112,
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
                 reg84,
                 reg83,
                 reg82,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg82 <= {{(!$unsigned((~wire78)))}};
      if (wire80)
        begin
          reg83 <= $signed((wire78[(3'h4):(2'h2)] || ($unsigned($unsigned(wire80)) ?
              (~^(8'hb7)) : {wire81, reg82[(3'h4):(2'h3)]})));
          reg84 <= wire78[(4'h9):(2'h3)];
          reg85 <= (~(~&wire80));
          if ((^((reg85[(1'h1):(1'h1)] ?
              ((reg84 ^ wire79) - wire79) : $signed((+(8'haf)))) || (~^reg84[(4'ha):(1'h0)]))))
            begin
              reg86 <= (($signed((8'ha0)) - (($unsigned(reg83) ?
                          $signed(reg83) : reg83[(4'h8):(3'h6)]) ?
                      wire79 : $unsigned(reg84[(2'h2):(1'h1)]))) ?
                  reg84 : wire81);
              reg87 <= wire80[(2'h3):(1'h1)];
              reg88 <= (wire78 ?
                  ((^~{((8'hb9) ? reg84 : reg87)}) ?
                      {reg84[(3'h6):(3'h5)]} : (reg82[(3'h4):(2'h2)] && {{reg83,
                              reg82}})) : (!((!reg87[(3'h7):(3'h7)]) ^ $signed((wire81 >>> reg87)))));
            end
          else
            begin
              reg86 <= $signed((8'hbc));
            end
          reg89 <= reg83;
        end
      else
        begin
          if (reg86)
            begin
              reg83 <= $signed(wire80);
              reg84 <= wire81[(3'h5):(3'h4)];
              reg85 <= reg89[(4'hc):(3'h5)];
              reg86 <= reg87;
            end
          else
            begin
              reg83 <= ((+reg84) ?
                  reg82 : (~^$signed($signed((reg84 ? (8'ha8) : reg85)))));
            end
          reg87 <= $unsigned($unsigned((~^reg89)));
          reg88 <= reg88[(4'hd):(4'hd)];
          reg89 <= (reg83 ? $signed(reg89) : {wire78});
        end
      reg90 <= reg86[(4'hd):(3'h7)];
      reg91 <= (((($signed(reg90) ? {reg86} : wire78[(4'hb):(3'h6)]) ?
                  ($signed(reg88) >>> {reg89,
                      (7'h43)}) : (^$unsigned(wire79))) ?
              reg84 : (-reg90)) ?
          (|$unsigned(((~(8'ha0)) ?
              wire79 : {reg84}))) : ({$signed(wire78[(3'h5):(1'h1)]),
              reg83[(3'h6):(2'h2)]} || $signed(reg89)));
    end
  always
    @(posedge clk) begin
      if (reg87)
        begin
          reg92 <= wire80[(3'h6):(2'h3)];
        end
      else
        begin
          reg92 <= $signed($unsigned((((reg92 ? reg88 : reg88) == reg90) ?
              $signed((reg83 ? (8'hba) : reg82)) : (^~$unsigned(reg86)))));
          reg93 <= {({$unsigned((wire78 ?
                      (8'hb1) : reg83))} > reg84[(3'h4):(2'h3)])};
          reg94 <= (|$signed(((!{reg89, reg89}) - $signed(reg93))));
        end
      reg95 <= (8'hb4);
    end
  always
    @(posedge clk) begin
      reg96 <= $signed($unsigned($signed($signed(wire78))));
      reg97 <= ((^(+(8'ha1))) ? (8'ha3) : (8'ha0));
      reg98 <= (reg85[(3'h6):(2'h3)] ?
          ((reg88[(3'h7):(2'h2)] >>> $signed((reg83 >>> reg90))) ?
              reg93[(4'hb):(4'ha)] : $unsigned(($unsigned(reg94) - (wire79 ?
                  reg92 : reg85)))) : $signed((&{(reg84 ? wire78 : reg82)})));
    end
  assign wire99 = {(($unsigned($signed(wire79)) ^ (((8'ha2) ?
                          reg94 : reg89) + reg83[(3'h4):(1'h0)])) ^ reg95[(3'h7):(1'h0)])};
  assign wire100 = reg87[(3'h7):(1'h1)];
  assign wire101 = wire79[(3'h6):(3'h5)];
  assign wire102 = {(^$signed(reg83[(4'hf):(4'he)]))};
  assign wire103 = ({(~^(&reg84))} ?
                       {(~&(^reg97)),
                           (wire101 - $signed(reg82[(3'h4):(1'h1)]))} : {reg97[(4'h8):(3'h5)],
                           (reg87[(1'h1):(1'h0)] ?
                               (^reg89) : $signed((&reg97)))});
  assign wire104 = $unsigned(({{(reg92 <= reg86)}} > (&$signed($unsigned(reg88)))));
  assign wire105 = reg91;
  assign wire106 = (+reg84);
  assign wire107 = ({reg96,
                           (~&($unsigned(reg84) ?
                               (^reg91) : (reg95 != (8'h9d))))} ?
                       reg97 : ((((~&reg97) ^~ (wire106 ? reg92 : reg93)) ?
                               (&wire106[(1'h1):(1'h0)]) : reg88) ?
                           ($signed((&reg83)) ?
                               (~&$unsigned(wire81)) : {{reg83},
                                   wire81[(4'hc):(2'h3)]}) : (reg90 ?
                               $unsigned(reg82[(1'h1):(1'h1)]) : $signed($signed(wire102)))));
  assign wire108 = wire107;
  assign wire109 = $signed(wire100);
  assign wire110 = $signed({reg96});
  assign wire111 = wire106[(4'hc):(1'h1)];
  always
    @(posedge clk) begin
      reg112 <= reg96[(4'hb):(4'h8)];
      reg113 <= (!$unsigned({(|$signed(reg88))}));
      reg114 <= (reg91[(2'h3):(1'h1)] ?
          reg95 : $unsigned($unsigned({{(8'hb7), wire108}})));
    end
  assign wire115 = wire99[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ((reg97 ~^ $signed((((wire111 || wire78) < reg83[(3'h5):(2'h2)]) + $unsigned((+reg90))))))
        begin
          reg116 <= ($unsigned(((8'hb4) ?
              (^$signed(wire79)) : (~^(reg85 ? wire103 : reg93)))) & (reg83 ?
              $unsigned(wire107[(4'hf):(3'h6)]) : {reg113[(1'h1):(1'h1)]}));
          if ((~reg92[(1'h1):(1'h1)]))
            begin
              reg117 <= (wire78 ?
                  ((wire108 - reg96) != $signed({reg112})) : $signed((+{$unsigned(reg112),
                      (-reg94)})));
              reg118 <= $unsigned(((wire110[(4'ha):(4'h8)] <<< {(reg83 || reg112),
                      (reg117 ? (8'hb2) : reg89)}) ?
                  reg90 : reg91));
              reg119 <= wire110;
              reg120 <= {($signed(((8'ha1) ? wire101 : reg92)) ?
                      ({(wire106 >>> wire107)} >= {$unsigned(reg83),
                          (reg97 != reg119)}) : {($unsigned(reg84) ?
                              (wire111 | reg95) : (~|reg95))}),
                  reg88[(1'h0):(1'h0)]};
            end
          else
            begin
              reg117 <= (wire80 >>> wire99[(3'h4):(1'h1)]);
              reg118 <= $signed($unsigned((~&(+wire111))));
            end
          if (((8'hb2) ?
              ((reg85 - reg82[(3'h4):(3'h4)]) >> $unsigned(wire80)) : $unsigned(({$signed(reg91)} ?
                  $unsigned(reg83[(4'hb):(3'h7)]) : $unsigned((reg85 ?
                      wire101 : reg86))))))
            begin
              reg121 <= reg116;
              reg122 <= ((((^~(wire106 < reg113)) ?
                  ((wire103 <<< (8'ha5)) ~^ reg118) : $unsigned($signed(reg114))) >= $unsigned((~|wire99[(2'h3):(2'h2)]))) >= ((|(reg94 ?
                  (reg114 ?
                      (8'hbc) : wire104) : (+reg89))) && $signed(((-wire99) && $unsigned((8'hb0))))));
              reg123 <= $signed(reg97);
            end
          else
            begin
              reg121 <= (&$signed({$signed(wire104[(3'h6):(3'h4)])}));
              reg122 <= (wire107 ^~ $signed(((^$signed((8'hb6))) ?
                  ($signed(wire109) ?
                      $unsigned(reg88) : wire105[(1'h0):(1'h0)]) : {{wire102},
                      wire104})));
              reg123 <= $signed({reg121});
              reg124 <= reg116[(2'h2):(1'h1)];
            end
          reg125 <= $signed(($unsigned(reg82) ?
              (reg98 ?
                  wire104[(1'h1):(1'h0)] : {(~|wire108)}) : {{$unsigned(reg113)}}));
          reg126 <= reg96[(3'h4):(1'h1)];
        end
      else
        begin
          if ((+$unsigned($unsigned(($signed(wire108) > $unsigned(reg123))))))
            begin
              reg116 <= reg94;
            end
          else
            begin
              reg116 <= $signed({wire81});
              reg117 <= (((wire103[(3'h4):(1'h1)] ^ (&(wire106 ?
                  reg113 : wire111))) ^ ((&reg98[(3'h5):(3'h4)]) || $unsigned((wire103 & wire104)))) >= ($unsigned($unsigned((reg112 ?
                  reg94 : reg118))) == ($signed(reg125) | (wire104 ~^ (wire81 ?
                  reg89 : reg112)))));
              reg118 <= (reg93[(3'h6):(3'h5)] >= reg121[(5'h11):(3'h6)]);
              reg119 <= (((!$signed($unsigned(wire108))) ?
                  $unsigned(((reg113 + reg92) ?
                      (reg85 ~^ wire81) : $unsigned(reg124))) : ($signed((reg116 >> reg87)) >> (+reg90[(4'h9):(3'h7)]))) << $signed((($unsigned(reg85) <<< (reg126 > reg85)) ?
                  $signed((^~(8'hbe))) : (8'hb5))));
            end
          reg120 <= $signed($signed($unsigned(reg112)));
          reg121 <= $unsigned((8'ha3));
          reg122 <= ((reg114[(1'h1):(1'h0)] + reg84) ^~ $signed($unsigned(reg125)));
        end
      if (reg86)
        begin
          reg127 <= $unsigned($signed($unsigned(($signed((8'haf)) + $unsigned(reg86)))));
        end
      else
        begin
          reg127 <= ($unsigned(({wire115[(1'h1):(1'h0)]} << reg126)) && (~|wire102[(3'h4):(1'h0)]));
          reg128 <= {(((~(&wire104)) ? reg87 : (~^$unsigned(reg95))) ?
                  $signed((&{(8'h9f),
                      (8'haa)})) : (reg97[(2'h3):(1'h1)] < wire101)),
              reg119[(3'h7):(2'h3)]};
        end
      reg129 <= ({(reg119[(3'h5):(3'h4)] ?
                  reg87 : $signed(reg121[(3'h4):(2'h3)])),
              ($unsigned(((7'h41) ^ reg120)) + $unsigned((reg113 > wire104)))} ?
          reg84[(1'h0):(1'h0)] : ($signed(reg116) ?
              $signed(reg91) : {wire103}));
      reg130 <= {wire99[(1'h0):(1'h0)], (8'hb0)};
      if ((($unsigned($unsigned({wire81})) ?
          reg119 : $signed(((reg90 ? (8'h9c) : reg85) ?
              $unsigned(reg121) : {wire81,
                  reg119}))) << (($signed($unsigned(wire105)) ?
          (wire99 << reg82[(2'h3):(1'h0)]) : ((reg117 - reg88) ~^ $signed((8'ha0)))) - (($signed(reg126) ?
          reg125[(4'hb):(4'h9)] : wire108) & $signed((wire101 ?
          reg98 : reg87))))))
        begin
          reg131 <= $signed(reg86);
          if ($unsigned($unsigned(wire80)))
            begin
              reg132 <= $signed((^~{$signed(wire79[(4'h8):(3'h6)]), (8'h9d)}));
              reg133 <= reg120;
              reg134 <= $unsigned($unsigned(reg114[(1'h0):(1'h0)]));
            end
          else
            begin
              reg132 <= wire81;
            end
          if ($signed(wire109))
            begin
              reg135 <= $unsigned(({$signed(((8'hb5) <<< reg124)),
                      wire111[(2'h3):(2'h2)]} ?
                  {((reg82 <<< wire80) ?
                          ((7'h42) >>> reg92) : $unsigned(wire108)),
                      $unsigned($unsigned(reg112))} : {(reg127[(4'hc):(4'ha)] != $unsigned(reg123)),
                      reg112}));
            end
          else
            begin
              reg135 <= $unsigned($unsigned((+{$unsigned((8'hb4)),
                  $signed(reg132)})));
              reg136 <= (8'ha5);
              reg137 <= (($signed(reg84) ? reg97 : $signed((!$signed(reg95)))) ?
                  wire115[(2'h2):(1'h1)] : $unsigned((wire101[(2'h2):(1'h1)] & reg118)));
              reg138 <= reg87[(2'h2):(1'h1)];
            end
          reg139 <= reg138;
          if ((~|$signed(reg85)))
            begin
              reg140 <= (-reg118);
              reg141 <= ({$signed((reg132 ? (8'hb4) : $unsigned(reg139))),
                      reg94} ?
                  (reg139 ?
                      (|({wire107, (8'ha6)} ?
                          $unsigned(reg133) : {(8'had)})) : ((reg86 | reg83[(4'hf):(3'h6)]) != ((+reg137) ?
                          (reg82 ?
                              reg139 : reg131) : (reg140 << reg84)))) : ((({wire80,
                              reg98} ?
                          (reg122 ? reg125 : reg119) : wire78[(3'h5):(3'h4)]) ?
                      $unsigned((~|(8'hb2))) : reg127) <= $signed(wire107)));
              reg142 <= ((reg87 && wire107[(3'h7):(1'h1)]) ?
                  ($signed($unsigned({reg125})) ?
                      $unsigned(reg140[(1'h0):(1'h0)]) : (~^$signed((reg91 ?
                          wire81 : reg139)))) : {$signed($unsigned($signed((8'ha6))))});
              reg143 <= wire103;
            end
          else
            begin
              reg140 <= (wire81 ?
                  ((reg130 <= $unsigned((reg140 ^ wire111))) >> (((~^wire103) ?
                      {reg119} : {reg95}) <= (+(wire107 ?
                      reg98 : wire103)))) : (8'ha4));
              reg141 <= {reg134};
              reg142 <= reg118[(4'h8):(3'h7)];
              reg143 <= ($unsigned($signed(reg92)) ?
                  $unsigned($unsigned(((reg117 ? reg118 : (7'h40)) ?
                      (reg122 ? (8'haf) : reg94) : (reg83 ?
                          wire79 : wire115)))) : {wire101});
            end
        end
      else
        begin
          reg131 <= $unsigned((~{(+(reg113 <<< wire81))}));
        end
    end
endmodule

module module48  (y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire53;
  input wire signed [(5'h10):(1'h0)] wire52;
  input wire [(5'h10):(1'h0)] wire51;
  input wire signed [(4'hf):(1'h0)] wire50;
  input wire [(4'h8):(1'h0)] wire49;
  wire signed [(5'h13):(1'h0)] wire73;
  wire [(5'h14):(1'h0)] wire72;
  wire [(4'h9):(1'h0)] wire71;
  wire signed [(4'h9):(1'h0)] wire70;
  wire [(4'h8):(1'h0)] wire69;
  wire signed [(5'h13):(1'h0)] wire68;
  wire [(4'hf):(1'h0)] wire55;
  reg [(4'hb):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(4'hf):(1'h0)] reg63 = (1'h0);
  reg [(4'hf):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg61 = (1'h0);
  reg [(4'ha):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg58 = (1'h0);
  reg [(4'h8):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg56 = (1'h0);
  reg [(4'ha):(1'h0)] reg54 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire55,
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
                 reg54,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg54 <= (^$signed((~({wire53} ?
          (wire52 ? wire53 : wire52) : (wire50 || wire51)))));
    end
  assign wire55 = (({wire50} >> ($signed($unsigned(reg54)) >>> wire53)) & (~^$signed((wire50 | reg54))));
  always
    @(posedge clk) begin
      if (($signed(($signed((!wire52)) ?
          wire53 : (~&$unsigned(wire55)))) == ($signed(($signed(reg54) ?
          (wire55 ? wire52 : (8'hbc)) : (wire55 ?
              wire51 : wire53))) && wire52[(1'h0):(1'h0)])))
        begin
          reg56 <= wire50[(3'h5):(2'h3)];
          if ((wire51 ? reg54 : $unsigned((|$signed((8'hb1))))))
            begin
              reg57 <= ($signed((8'h9f)) ?
                  (wire52 | $unsigned((~|wire49))) : (wire52[(4'he):(4'h9)] + {$signed(wire50)}));
              reg58 <= (wire53 ?
                  (~&reg56[(1'h0):(1'h0)]) : (~|(((wire52 | wire52) == (reg57 | wire52)) ?
                      ($unsigned(wire53) ?
                          reg54 : (reg56 ?
                              wire55 : wire50)) : $signed((~|(8'hb7))))));
            end
          else
            begin
              reg57 <= $unsigned((reg57 ?
                  (wire50 ?
                      ($unsigned((8'hb3)) ~^ $signed(wire52)) : $signed(wire50[(3'h7):(3'h4)])) : (^wire51[(3'h4):(1'h0)])));
              reg58 <= wire52;
              reg59 <= wire51[(4'h9):(2'h2)];
              reg60 <= $signed($signed((8'haf)));
            end
        end
      else
        begin
          if (reg59)
            begin
              reg56 <= {(8'hbb)};
            end
          else
            begin
              reg56 <= $unsigned($signed(wire51[(4'ha):(3'h7)]));
              reg57 <= reg59[(1'h0):(1'h0)];
            end
          reg58 <= (&wire49);
          reg59 <= (^(reg58 & wire49[(3'h7):(2'h3)]));
          reg60 <= wire49;
        end
      reg61 <= (-{{$signed((reg57 ? reg54 : wire49)),
              ((~&(8'hb9)) ? wire51 : (^(8'ha3)))},
          (reg60 ?
              $unsigned({reg59}) : ($signed(wire50) ~^ ((8'ha2) + (8'haf))))});
      reg62 <= (~$signed((~&(!$signed((7'h40))))));
      reg63 <= reg57[(3'h4):(1'h1)];
      reg64 <= $signed({$signed(wire53[(3'h4):(3'h4)])});
    end
  always
    @(posedge clk) begin
      reg65 <= $signed(reg63[(1'h1):(1'h1)]);
      reg66 <= (|((+$unsigned((-reg64))) ?
          (reg58 ^~ wire52[(4'hd):(1'h0)]) : {$unsigned($unsigned(reg65))}));
    end
  always
    @(posedge clk) begin
      reg67 <= (($signed(((reg57 != wire51) ^ $unsigned(reg59))) != reg61[(3'h4):(2'h3)]) ?
          {wire53, $unsigned((-wire52))} : reg58);
    end
  assign wire68 = $signed(({reg58[(3'h5):(3'h4)],
                      $unsigned($unsigned(wire52))} ~^ $unsigned(reg54[(2'h2):(2'h2)])));
  assign wire69 = (~^((+{(~^wire49),
                      $unsigned((8'haa))}) ^~ $unsigned($unsigned($unsigned((8'ha7))))));
  assign wire70 = {$unsigned(reg62[(1'h0):(1'h0)]), reg62};
  assign wire71 = wire55;
  assign wire72 = $unsigned((+(reg60[(4'ha):(3'h6)] ?
                      $unsigned((|reg65)) : wire53)));
  assign wire73 = wire52;
endmodule

module module11
#(parameter param36 = (((7'h44) >> {((~^(8'haf)) <<< (~|(7'h41)))}) ? (|((-(^~(8'ha2))) ? (^(~|(8'hae))) : (((8'hbf) >= (8'h9d)) ? {(7'h42), (8'hb1)} : ((8'ha3) ? (8'hb5) : (8'hae))))) : (|(~^(|(~(8'h9f)))))), 
parameter param37 = (~(((param36 || (~param36)) != param36) >= (param36 ? (((7'h40) <= param36) ? (~param36) : (~|param36)) : (((8'ha9) >= param36) != (^param36))))))
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire16;
  input wire [(5'h12):(1'h0)] wire15;
  input wire signed [(4'he):(1'h0)] wire14;
  input wire [(2'h2):(1'h0)] wire13;
  input wire signed [(4'hd):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire35;
  wire signed [(4'ha):(1'h0)] wire34;
  wire signed [(4'ha):(1'h0)] wire33;
  wire signed [(4'ha):(1'h0)] wire32;
  wire signed [(4'hc):(1'h0)] wire29;
  wire signed [(4'he):(1'h0)] wire28;
  wire [(4'hd):(1'h0)] wire27;
  wire [(4'hb):(1'h0)] wire26;
  wire [(4'h9):(1'h0)] wire25;
  wire [(2'h2):(1'h0)] wire24;
  wire [(4'hd):(1'h0)] wire23;
  wire [(2'h2):(1'h0)] wire22;
  wire [(4'hb):(1'h0)] wire21;
  wire [(5'h12):(1'h0)] wire17;
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire17,
                 reg31,
                 reg30,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  assign wire17 = $signed((-$signed({(wire13 ? wire12 : wire13),
                      wire13[(1'h0):(1'h0)]})));
  always
    @(posedge clk) begin
      reg18 <= ({$unsigned(($unsigned(wire15) | $signed(wire15)))} <<< $unsigned((~^($unsigned(wire14) ?
          wire14[(1'h1):(1'h0)] : (wire17 ? wire13 : wire13)))));
      reg19 <= wire14;
      reg20 <= $unsigned(((wire13[(1'h0):(1'h0)] + (reg18[(3'h4):(1'h0)] ?
              (wire13 ? wire17 : wire12) : (^wire17))) ?
          (wire14[(1'h0):(1'h0)] > (reg18 ?
              $unsigned(wire12) : wire17)) : $unsigned(wire15)));
    end
  assign wire21 = {{$unsigned({((8'haf) ? reg18 : wire16)})}, wire17};
  assign wire22 = $signed((~|((~&$unsigned(wire21)) < wire13)));
  assign wire23 = ({(&($unsigned(wire14) ?
                          $unsigned(wire12) : $unsigned(wire15))),
                      wire17} << wire15[(3'h7):(2'h3)]);
  assign wire24 = (^~wire13);
  assign wire25 = (|wire14[(4'hd):(3'h7)]);
  assign wire26 = $unsigned($unsigned((8'ha6)));
  assign wire27 = (!wire24[(1'h0):(1'h0)]);
  assign wire28 = (8'hb7);
  assign wire29 = wire26[(4'h8):(2'h2)];
  always
    @(posedge clk) begin
      reg30 <= $unsigned({wire23, wire25[(3'h7):(3'h7)]});
      reg31 <= wire25[(1'h0):(1'h0)];
    end
  assign wire32 = (($unsigned(wire25[(2'h3):(2'h2)]) ?
                      ($unsigned(reg30[(2'h2):(1'h0)]) ?
                          $unsigned(wire16[(3'h6):(1'h1)]) : {(wire12 + wire26),
                              (wire25 ?
                                  wire23 : wire12)}) : (~^$unsigned((wire22 ?
                          reg30 : wire13)))) + wire21[(1'h0):(1'h0)]);
  assign wire33 = {($signed(($unsigned(wire15) ?
                          wire27 : (reg20 << wire32))) > {wire13})};
  assign wire34 = (8'ha9);
  assign wire35 = {(~^$signed($signed({wire16, wire34})))};
endmodule
