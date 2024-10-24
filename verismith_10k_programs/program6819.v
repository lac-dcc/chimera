module top
#(parameter param296 = (({({(7'h42)} ? (~&(8'hb9)) : ((8'hae) < (8'ha5)))} ? (({(8'had), (8'hac)} ? ((8'hb8) | (8'hb0)) : ((8'ha7) ? (8'ha9) : (8'h9f))) ? (+((8'hbf) + (8'hb8))) : (~((7'h42) ? (8'hac) : (7'h43)))) : (~&(!(+(8'ha4))))) ? (((|((8'hba) ? (8'haa) : (8'hbc))) ? (~((8'hb8) ? (8'ha5) : (8'h9d))) : (((8'haf) >> (8'haf)) ? ((8'hb0) << (8'hab)) : (!(8'hb3)))) ? (&{(~(8'hac))}) : (^{{(8'hb1), (8'hb3)}, ((8'ha0) <= (8'ha6))})) : {{(~&((8'ha7) * (8'hab))), {((8'h9c) | (7'h41))}}}), 
parameter param297 = {((~param296) >> {((param296 * param296) | param296), (param296 ? (|param296) : param296)})})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire295;
  wire [(5'h14):(1'h0)] wire294;
  wire [(3'h4):(1'h0)] wire293;
  wire signed [(4'hb):(1'h0)] wire286;
  wire [(4'hb):(1'h0)] wire154;
  wire signed [(5'h13):(1'h0)] wire138;
  wire [(5'h15):(1'h0)] wire137;
  wire signed [(4'hc):(1'h0)] wire135;
  wire signed [(4'hf):(1'h0)] wire288;
  wire signed [(4'ha):(1'h0)] wire289;
  wire signed [(5'h14):(1'h0)] wire290;
  wire [(5'h11):(1'h0)] wire291;
  assign y = {wire295,
                 wire294,
                 wire293,
                 wire286,
                 wire154,
                 wire138,
                 wire137,
                 wire135,
                 wire288,
                 wire289,
                 wire290,
                 wire291,
                 (1'h0)};
  module5 #() modinst136 (.clk(clk), .wire6(wire3), .y(wire135), .wire8(wire0), .wire7(wire1), .wire9(wire4));
  assign wire137 = wire1;
  assign wire138 = ((wire137[(2'h3):(1'h1)] ?
                       $unsigned(wire137[(4'h9):(1'h1)]) : ((wire0 ?
                               $signed(wire4) : (wire135 < wire0)) ?
                           $unsigned({wire2,
                               wire0}) : (wire4[(3'h5):(3'h5)] - wire135[(2'h2):(1'h0)]))) > {wire137});
  module139 #() modinst155 (.wire141(wire138), .wire142(wire135), .clk(clk), .wire143(wire1), .y(wire154), .wire140(wire4));
  module156 #() modinst287 (.wire161(wire138), .wire158(wire0), .y(wire286), .wire160(wire137), .clk(clk), .wire159(wire1), .wire157(wire3));
  assign wire288 = $unsigned({($signed(((8'hb2) ?
                           (7'h42) : wire4)) || $unsigned($signed(wire2))),
                       wire4});
  assign wire289 = (^~$unsigned($unsigned(((wire3 ?
                       (8'hb4) : wire138) > (~^wire154)))));
  assign wire290 = (|$signed(({((8'h9c) ^~ wire2)} ^ wire138[(4'he):(4'he)])));
  module156 #() modinst292 (wire291, clk, wire288, wire2, wire290, wire138, wire1);
  assign wire293 = $unsigned({((~^$unsigned(wire135)) ?
                           (&$signed(wire3)) : ((wire4 >>> (8'hbc)) ?
                               (8'ha5) : $unsigned(wire286)))});
  assign wire294 = {(wire290 ?
                           (($signed(wire0) & (wire289 ?
                               wire293 : wire288)) ^~ ({(8'h9c),
                               wire154} >>> $signed(wire1))) : ((wire291[(3'h7):(3'h5)] ?
                               ((7'h40) > wire288) : (^~wire154)) | wire3))};
  assign wire295 = $signed({wire293[(2'h3):(2'h2)]});
endmodule

module module156
#(parameter param284 = (~|((8'hab) ? {(^~(~|(8'hb9))), (^~((8'h9f) ? (8'hb4) : (8'h9c)))} : ((((8'hb5) <<< (8'hae)) ? ((8'ha0) ? (8'haf) : (8'hbd)) : ((8'hb7) <<< (8'ha8))) ^ (((8'hbf) || (8'hbf)) << ((8'h9e) ? (8'hae) : (8'hbe)))))), 
parameter param285 = (param284 >> ((((!param284) >= param284) ^ (8'hac)) | param284)))
(y, clk, wire157, wire158, wire159, wire160, wire161);
  output wire [(32'h277):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire157;
  input wire [(4'ha):(1'h0)] wire158;
  input wire [(5'h14):(1'h0)] wire159;
  input wire [(4'hf):(1'h0)] wire160;
  input wire signed [(5'h13):(1'h0)] wire161;
  wire [(4'h8):(1'h0)] wire283;
  wire [(5'h12):(1'h0)] wire282;
  wire [(4'hb):(1'h0)] wire162;
  wire signed [(4'ha):(1'h0)] wire166;
  wire signed [(5'h15):(1'h0)] wire167;
  wire signed [(4'hd):(1'h0)] wire189;
  wire [(3'h5):(1'h0)] wire219;
  wire signed [(3'h5):(1'h0)] wire223;
  wire signed [(5'h13):(1'h0)] wire224;
  wire signed [(3'h4):(1'h0)] wire225;
  wire [(5'h13):(1'h0)] wire226;
  wire signed [(4'hf):(1'h0)] wire241;
  wire signed [(5'h11):(1'h0)] wire251;
  wire [(4'hc):(1'h0)] wire252;
  wire [(4'ha):(1'h0)] wire253;
  wire signed [(4'hc):(1'h0)] wire280;
  reg signed [(5'h14):(1'h0)] reg165 = (1'h0);
  reg [(5'h13):(1'h0)] reg164 = (1'h0);
  reg signed [(4'he):(1'h0)] reg163 = (1'h0);
  reg [(4'he):(1'h0)] reg191 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg192 = (1'h0);
  reg [(5'h10):(1'h0)] reg193 = (1'h0);
  reg [(3'h7):(1'h0)] reg194 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg195 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg196 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg197 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg198 = (1'h0);
  reg [(4'hc):(1'h0)] reg199 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg200 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg201 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg202 = (1'h0);
  reg [(2'h3):(1'h0)] reg203 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg204 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg205 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg206 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg207 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg208 = (1'h0);
  reg [(4'hd):(1'h0)] reg209 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg210 = (1'h0);
  reg [(2'h2):(1'h0)] reg211 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg212 = (1'h0);
  reg [(3'h6):(1'h0)] reg213 = (1'h0);
  reg [(4'hf):(1'h0)] reg214 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg215 = (1'h0);
  reg [(3'h4):(1'h0)] reg216 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg217 = (1'h0);
  reg [(5'h13):(1'h0)] reg218 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg220 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg221 = (1'h0);
  reg [(2'h3):(1'h0)] reg222 = (1'h0);
  reg [(4'he):(1'h0)] reg243 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg244 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg245 = (1'h0);
  reg [(3'h5):(1'h0)] reg246 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg247 = (1'h0);
  reg [(4'ha):(1'h0)] reg248 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg249 = (1'h0);
  reg [(5'h11):(1'h0)] reg250 = (1'h0);
  assign y = {wire283,
                 wire282,
                 wire162,
                 wire166,
                 wire167,
                 wire189,
                 wire219,
                 wire223,
                 wire224,
                 wire225,
                 wire226,
                 wire241,
                 wire251,
                 wire252,
                 wire253,
                 wire280,
                 reg165,
                 reg164,
                 reg163,
                 reg191,
                 reg192,
                 reg193,
                 reg194,
                 reg195,
                 reg196,
                 reg197,
                 reg198,
                 reg199,
                 reg200,
                 reg201,
                 reg202,
                 reg203,
                 reg204,
                 reg205,
                 reg206,
                 reg207,
                 reg208,
                 reg209,
                 reg210,
                 reg211,
                 reg212,
                 reg213,
                 reg214,
                 reg215,
                 reg216,
                 reg217,
                 reg218,
                 reg220,
                 reg221,
                 reg222,
                 reg243,
                 reg244,
                 reg245,
                 reg246,
                 reg247,
                 reg248,
                 reg249,
                 reg250,
                 (1'h0)};
  assign wire162 = $unsigned((~wire159[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      reg163 <= ($unsigned($unsigned((7'h41))) ?
          $unsigned($unsigned(wire162[(3'h5):(2'h3)])) : $unsigned(wire160));
    end
  always
    @(posedge clk) begin
      reg164 <= ($signed((wire160[(1'h0):(1'h0)] || $unsigned((reg163 - wire158)))) >> reg163[(3'h4):(1'h0)]);
      reg165 <= wire158;
    end
  assign wire166 = (-wire158);
  assign wire167 = $signed(($unsigned(reg163[(2'h3):(2'h2)]) ?
                       ({(wire157 ? (8'h9c) : wire157),
                           $signed(wire166)} | reg163[(4'hb):(4'ha)]) : {reg163,
                           {{wire157}}}));
  module168 #() modinst190 (wire189, clk, wire161, wire167, reg164, wire160, wire166);
  always
    @(posedge clk) begin
      reg191 <= $signed(reg163);
      reg192 <= {{(8'hbf),
              (reg163[(3'h7):(3'h6)] ? wire159[(3'h5):(3'h5)] : wire162)},
          ({((&reg165) ? (-wire158) : (wire162 & (8'h9f))),
                  ((wire162 ? reg165 : (8'ha3)) ?
                      $unsigned(wire158) : (^wire160))} ?
              $unsigned(wire158[(4'ha):(3'h6)]) : wire166[(4'ha):(3'h5)])};
      if (((&wire167) <= {$signed(($unsigned((7'h42)) ?
              (~reg165) : $signed(wire160)))}))
        begin
          reg193 <= (|(wire161 == wire157[(3'h6):(3'h5)]));
          reg194 <= ((-$signed((~|$unsigned(wire189)))) >> (+({$unsigned(reg163)} != (^~(~^reg163)))));
          if ($unsigned(wire162[(1'h0):(1'h0)]))
            begin
              reg195 <= $unsigned({$unsigned(wire161),
                  (((wire158 >> wire161) < wire157[(2'h3):(1'h1)]) - wire158[(3'h5):(2'h2)])});
            end
          else
            begin
              reg195 <= ((wire162 >> wire157) >> (~&wire160[(2'h3):(1'h1)]));
              reg196 <= $signed($unsigned(({(wire167 + reg194),
                      {wire161, wire157}} ?
                  wire157[(4'he):(4'hb)] : {(reg193 ? (8'ha7) : wire160),
                      ((8'hb0) & wire189)})));
              reg197 <= (~^$unsigned({(8'hbe)}));
            end
          reg198 <= $unsigned(($unsigned(((wire167 == reg191) ?
              $signed(wire160) : (+wire159))) << (8'ha5)));
        end
      else
        begin
          reg193 <= reg163;
          reg194 <= (8'hb4);
          reg195 <= $unsigned(wire161);
          reg196 <= reg194[(3'h4):(2'h2)];
          reg197 <= $unsigned($signed($unsigned(reg198)));
        end
      if (wire157[(1'h1):(1'h0)])
        begin
          reg199 <= reg198[(2'h2):(2'h2)];
        end
      else
        begin
          if (reg196)
            begin
              reg199 <= $signed((-wire167));
              reg200 <= reg164;
              reg201 <= $signed((^~$unsigned(wire159[(3'h4):(1'h1)])));
            end
          else
            begin
              reg199 <= (~&$signed((~^((wire160 ?
                  wire159 : (8'ha1)) - $signed(reg195)))));
            end
          reg202 <= (~($signed({(reg164 ? (8'hb2) : wire161)}) << reg165));
          if ({(((~&(reg197 ^~ reg192)) ?
                      (~^(reg195 >>> wire160)) : $signed((wire162 ?
                          wire167 : wire158))) ?
                  {(((8'ha0) ? reg202 : reg198) ?
                          (8'hb3) : (wire167 & reg192))} : reg202[(2'h3):(2'h3)])})
            begin
              reg203 <= $unsigned(($unsigned(reg165[(5'h11):(3'h4)]) ?
                  ((8'hac) ?
                      (&$unsigned(reg165)) : (((8'hbc) ?
                          reg163 : wire189) == reg192[(3'h4):(1'h0)])) : (|$signed($signed(reg200)))));
            end
          else
            begin
              reg203 <= ((reg192 * $signed((-(^reg196)))) ?
                  (reg203[(1'h0):(1'h0)] ~^ (|reg202)) : (wire161 >>> {{$signed((7'h41))},
                      (8'hbd)}));
              reg204 <= (((~|reg198) ?
                  reg197[(4'h8):(3'h5)] : (reg164[(1'h1):(1'h1)] ?
                      wire167 : (8'hab))) <<< {$unsigned(($signed(reg195) ?
                      {wire166, reg163} : reg194)),
                  {(reg165[(4'hc):(2'h3)] ? reg198 : $signed(reg202))}});
              reg205 <= (reg200[(3'h7):(3'h4)] ?
                  $signed((~({wire160} <<< (reg198 <<< reg197)))) : reg163);
              reg206 <= $signed((((reg199 ?
                  ((8'hab) ^~ reg205) : (wire166 - reg194)) >> (wire161[(4'hd):(4'ha)] || (wire189 == reg198))) < (((reg200 >> wire162) == $signed(reg191)) - $signed((reg195 >= reg193)))));
              reg207 <= ($unsigned($signed((8'h9d))) ?
                  reg204[(4'h8):(2'h3)] : reg165[(3'h5):(3'h5)]);
            end
          reg208 <= ({{$unsigned(wire160), (reg198 <= (wire189 ^~ reg199))},
              (8'h9f)} | reg207);
          reg209 <= $signed((!$unsigned(wire189[(4'h9):(2'h3)])));
        end
      if ($signed({(((wire166 != (7'h40)) ^~ (wire159 >= (8'hb2))) > (reg193[(4'h8):(3'h5)] ^ reg193[(4'h9):(2'h2)])),
          ((reg207 ^~ (reg163 <= reg208)) >>> reg192[(1'h0):(1'h0)])}))
        begin
          reg210 <= wire189[(1'h0):(1'h0)];
        end
      else
        begin
          if (reg205[(2'h3):(1'h0)])
            begin
              reg210 <= wire167;
              reg211 <= reg165;
            end
          else
            begin
              reg210 <= ({reg205, reg210} ?
                  ($signed(((wire159 ~^ reg210) > reg191[(4'h9):(3'h7)])) ?
                      (^~((-reg192) + {reg192,
                          reg193})) : $signed((reg210[(4'ha):(4'h8)] == (reg199 ?
                          (8'hb4) : reg200)))) : $unsigned(wire162));
              reg211 <= wire160;
              reg212 <= reg195[(1'h0):(1'h0)];
            end
        end
    end
  always
    @(posedge clk) begin
      reg213 <= (!reg209[(3'h5):(2'h2)]);
      reg214 <= (-(({(~^reg208), (reg209 & wire158)} ?
              (reg204[(3'h4):(1'h0)] ?
                  $signed(reg194) : (8'hb0)) : reg198[(2'h2):(1'h1)]) ?
          $signed(($unsigned(reg195) ^~ reg204)) : {reg212,
              {(8'ha3), $signed(reg211)}}));
      if (($unsigned((7'h44)) <<< ($unsigned($unsigned($signed(reg192))) & {({(8'haf),
              reg192} * reg194)})))
        begin
          reg215 <= $unsigned(((($signed((8'hac)) < (reg212 ?
                  reg206 : (8'ha2))) ?
              $signed(((8'ha3) ?
                  reg205 : (8'hac))) : reg212) ~^ $signed((wire189[(3'h5):(3'h5)] && $signed(reg208)))));
          reg216 <= reg205;
        end
      else
        begin
          reg215 <= $signed($signed($unsigned(reg165[(5'h13):(4'ha)])));
          reg216 <= wire160[(4'hf):(2'h2)];
        end
      reg217 <= (8'hae);
      reg218 <= (wire167 > reg191);
    end
  assign wire219 = reg199;
  always
    @(posedge clk) begin
      reg220 <= $signed(((($signed(reg196) ~^ {(8'h9f)}) <= reg207) ?
          wire158[(1'h1):(1'h0)] : (((reg206 <= reg195) ?
              reg213 : wire167[(5'h13):(3'h4)]) >= (reg194 ?
              (^reg206) : $signed(reg192)))));
      reg221 <= reg193;
      reg222 <= $signed($signed($signed((8'ha5))));
    end
  assign wire223 = reg191;
  assign wire224 = ((reg200[(3'h6):(2'h3)] ?
                       ((reg213[(3'h4):(3'h4)] ?
                               wire159[(3'h6):(3'h6)] : (&reg165)) ?
                           (wire166[(1'h0):(1'h0)] ?
                               $signed(reg209) : $unsigned((8'hb6))) : $unsigned(reg205)) : ((reg191[(3'h5):(2'h3)] && (reg215 ?
                               reg199 : reg211)) ?
                           (reg210[(4'hb):(3'h7)] ?
                               (+reg216) : $signed(reg200)) : wire157)) < $unsigned(($signed($unsigned(reg200)) ?
                       reg206 : {$unsigned(reg163)})));
  assign wire225 = $signed({(($signed(reg197) ? wire158 : $unsigned(reg202)) ?
                           wire158 : $unsigned(wire160)),
                       wire219});
  assign wire226 = (-$signed(wire162[(2'h3):(2'h3)]));
  module227 #() modinst242 (wire241, clk, wire159, wire157, reg202, reg206);
  always
    @(posedge clk) begin
      if ($unsigned({reg215[(3'h6):(3'h5)], (+$unsigned(wire166))}))
        begin
          reg243 <= (^~reg200[(2'h3):(1'h0)]);
        end
      else
        begin
          if ({reg164})
            begin
              reg243 <= ($unsigned(($signed(reg217[(1'h1):(1'h1)]) <= ((reg209 ?
                      wire241 : wire241) ^ wire160))) ?
                  (+((wire223[(1'h0):(1'h0)] ?
                      (reg201 ^ (8'ha5)) : (wire223 >>> reg212)) <<< $signed($signed(wire159)))) : $unsigned((+((|reg214) ?
                      (reg191 < reg208) : reg205[(2'h2):(2'h2)]))));
              reg244 <= $signed($unsigned(reg220));
            end
          else
            begin
              reg243 <= reg222;
              reg244 <= (($unsigned((~&$unsigned(reg205))) ?
                      reg193 : wire162[(3'h4):(1'h0)]) ?
                  reg207 : ((reg209[(4'h9):(3'h5)] ?
                          wire226 : ((|reg192) <= (wire226 ?
                              reg220 : reg196))) ?
                      (~^reg214) : (({reg200} ?
                          (8'h9c) : $unsigned(reg243)) ^~ (reg209[(3'h4):(2'h3)] ?
                          (&reg200) : reg204[(4'h9):(3'h4)]))));
              reg245 <= $unsigned($unsigned(($signed((8'hb5)) > $unsigned((reg163 ?
                  reg212 : reg213)))));
              reg246 <= (((+{(+reg243)}) ^~ reg212) != $unsigned(wire241[(4'hf):(2'h2)]));
            end
          reg247 <= $unsigned((((wire219 && (reg213 ~^ wire157)) ?
              ($signed((8'hb5)) == (^reg192)) : (~&$unsigned((8'ha8)))) >>> {$unsigned((-(8'h9e))),
              wire162[(3'h7):(3'h7)]}));
          reg248 <= {$unsigned((reg214[(1'h1):(1'h0)] << $signed((reg215 > (8'hb4)))))};
          reg249 <= $unsigned((&({{reg215}} & reg200[(4'h9):(1'h1)])));
          reg250 <= ($signed($signed((~reg164[(5'h12):(4'hc)]))) ?
              $signed(((^~$signed(reg214)) << ((!reg163) ^ ((8'hbd) ?
                  reg194 : reg217)))) : $signed($unsigned(($signed(wire159) ?
                  $unsigned(wire189) : wire226))));
        end
    end
  assign wire251 = ({reg198} | $signed(reg222[(2'h2):(1'h1)]));
  assign wire252 = {$unsigned(reg216[(3'h4):(1'h0)])};
  assign wire253 = ($unsigned((($signed(reg194) ?
                       (reg214 <= (7'h41)) : reg218[(4'h8):(3'h7)]) == $unsigned(reg207))) < $signed($unsigned((7'h40))));
  module254 #() modinst281 (.wire256(reg205), .wire258(reg218), .y(wire280), .clk(clk), .wire255(reg210), .wire257(wire161));
  assign wire282 = {$unsigned(($signed($signed(reg210)) | ((reg197 ?
                           reg164 : reg206) || $unsigned(reg195))))};
  assign wire283 = $unsigned($signed((8'hb4)));
endmodule

module module139
#(parameter param153 = (((!(~|{(8'hb1), (8'hbb)})) ? {(8'hb3)} : ((((8'hb4) + (8'h9f)) ? (~&(8'hae)) : (^(8'ha6))) ? ({(8'hbd)} ? ((8'hb7) ? (8'had) : (8'hae)) : ((8'ha5) ~^ (8'hb3))) : {(8'hb1)})) ? (^~{(~^{(8'ha5)}), (8'hb1)}) : ((~^((~(8'ha9)) < {(8'ha0), (8'haf)})) >> (((&(7'h41)) ? {(7'h43), (7'h40)} : (!(7'h42))) >> (((8'ha4) ? (8'hab) : (8'hbd)) + ((8'had) ? (8'hbb) : (8'hb5)))))))
(y, clk, wire143, wire142, wire141, wire140);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire143;
  input wire [(4'hc):(1'h0)] wire142;
  input wire [(2'h3):(1'h0)] wire141;
  input wire [(3'h6):(1'h0)] wire140;
  wire signed [(4'hd):(1'h0)] wire152;
  wire signed [(4'hb):(1'h0)] wire151;
  wire signed [(5'h15):(1'h0)] wire150;
  wire [(4'hf):(1'h0)] wire149;
  wire [(5'h12):(1'h0)] wire148;
  wire signed [(5'h13):(1'h0)] wire147;
  wire signed [(4'h8):(1'h0)] wire146;
  wire [(5'h11):(1'h0)] wire145;
  wire signed [(5'h11):(1'h0)] wire144;
  assign y = {wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 (1'h0)};
  assign wire144 = $signed((|wire143[(3'h7):(3'h4)]));
  assign wire145 = (~&(($unsigned(wire141) ?
                       $signed($signed(wire142)) : $unsigned(wire143)) > wire144));
  assign wire146 = ($unsigned(wire145[(3'h6):(3'h6)]) ?
                       $unsigned($unsigned(wire140[(2'h3):(1'h0)])) : ((8'hb7) ^ (8'ha3)));
  assign wire147 = wire141;
  assign wire148 = $signed(wire143);
  assign wire149 = wire146[(1'h1):(1'h0)];
  assign wire150 = $unsigned(wire148[(4'hc):(3'h5)]);
  assign wire151 = wire150[(4'hb):(2'h2)];
  assign wire152 = $signed(wire143);
endmodule

module module5
#(parameter param134 = {(^((~(8'ha5)) ? ({(8'h9e)} ? ((7'h43) ~^ (7'h40)) : ((8'hb9) != (8'h9c))) : (^~((8'hb3) ? (7'h42) : (8'ha4))))), (((((8'hb0) ? (8'h9c) : (8'hbc)) <<< (~(8'hb6))) <<< (~&((8'ha5) ? (8'hb2) : (7'h42)))) != {({(8'hac)} << ((8'hae) != (8'ha1)))})})
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h320):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire9;
  input wire signed [(3'h7):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire7;
  input wire signed [(5'h15):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire121;
  wire signed [(4'hb):(1'h0)] wire120;
  wire [(5'h15):(1'h0)] wire119;
  wire [(5'h10):(1'h0)] wire118;
  wire signed [(4'hb):(1'h0)] wire117;
  wire [(5'h15):(1'h0)] wire116;
  wire [(3'h7):(1'h0)] wire115;
  wire signed [(4'h9):(1'h0)] wire88;
  wire signed [(5'h14):(1'h0)] wire79;
  wire signed [(2'h3):(1'h0)] wire77;
  wire signed [(4'hf):(1'h0)] wire42;
  wire [(4'hc):(1'h0)] wire41;
  wire signed [(4'hb):(1'h0)] wire39;
  wire [(5'h10):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire11;
  wire [(4'hd):(1'h0)] wire10;
  reg [(4'ha):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg132 = (1'h0);
  reg [(5'h12):(1'h0)] reg131 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg128 = (1'h0);
  reg [(4'ha):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg125 = (1'h0);
  reg [(4'hc):(1'h0)] reg124 = (1'h0);
  reg [(4'h8):(1'h0)] reg123 = (1'h0);
  reg [(3'h5):(1'h0)] reg122 = (1'h0);
  reg [(5'h10):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg113 = (1'h0);
  reg [(4'hf):(1'h0)] reg112 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg110 = (1'h0);
  reg [(3'h6):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg108 = (1'h0);
  reg [(4'h9):(1'h0)] reg107 = (1'h0);
  reg [(2'h2):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg105 = (1'h0);
  reg [(4'hb):(1'h0)] reg104 = (1'h0);
  reg [(5'h13):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg101 = (1'h0);
  reg signed [(4'he):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg99 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg96 = (1'h0);
  reg [(4'hc):(1'h0)] reg95 = (1'h0);
  reg [(5'h15):(1'h0)] reg94 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg91 = (1'h0);
  reg signed [(4'he):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg89 = (1'h0);
  reg signed [(4'he):(1'h0)] reg87 = (1'h0);
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  reg [(4'hc):(1'h0)] reg85 = (1'h0);
  reg [(5'h15):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg83 = (1'h0);
  reg [(4'hb):(1'h0)] reg82 = (1'h0);
  reg [(3'h4):(1'h0)] reg81 = (1'h0);
  reg [(4'ha):(1'h0)] reg80 = (1'h0);
  reg [(4'ha):(1'h0)] reg43 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire88,
                 wire79,
                 wire77,
                 wire42,
                 wire41,
                 wire39,
                 wire12,
                 wire11,
                 wire10,
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
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg43,
                 (1'h0)};
  assign wire10 = {wire8, wire9};
  assign wire11 = (((!wire10) ?
                      (~|(wire8 + $unsigned(wire6))) : wire8[(2'h3):(2'h2)]) + ($unsigned(({wire10} ?
                      {wire6, wire7} : {wire6})) >= (({wire6,
                      (8'haa)} == (~&wire7)) > $signed(wire6[(1'h1):(1'h1)]))));
  assign wire12 = (8'ha7);
  module13 #() modinst40 (wire39, clk, wire6, wire10, wire9, wire11);
  assign wire41 = {{$signed($signed((|wire8))),
                          $signed(wire11[(5'h10):(4'ha)])}};
  assign wire42 = (wire11 ?
                      $signed($signed((^{wire12,
                          wire9}))) : (^~$unsigned(wire11)));
  always
    @(posedge clk) begin
      reg43 <= (+(wire12 != (($signed(wire10) ?
          $signed(wire11) : (&(8'ha1))) ^~ $unsigned((wire12 ?
          wire39 : wire11)))));
    end
  module44 #() modinst78 (wire77, clk, wire7, wire12, wire9, wire39);
  assign wire79 = $unsigned($unsigned(wire39));
  always
    @(posedge clk) begin
      if ($unsigned({$signed(wire6)}))
        begin
          reg80 <= $unsigned(wire8[(3'h4):(2'h3)]);
          if ($signed($signed(wire7)))
            begin
              reg81 <= wire42[(3'h7):(1'h0)];
              reg82 <= wire39;
              reg83 <= ((~^$unsigned($signed((wire39 && wire7)))) ?
                  ($signed($signed($signed((8'h9d)))) != $unsigned(($signed(reg81) ?
                      $signed(wire11) : $unsigned((8'ha0))))) : $unsigned(reg82));
              reg84 <= (-reg80[(2'h3):(2'h3)]);
            end
          else
            begin
              reg81 <= (wire41 ?
                  (((8'haf) & reg82[(4'h8):(4'h8)]) < (wire41 ?
                      wire12[(3'h4):(1'h1)] : (8'had))) : ($unsigned(wire11) ?
                      wire8 : ($unsigned($unsigned(wire41)) < {wire41})));
              reg82 <= wire77[(1'h0):(1'h0)];
              reg83 <= wire8;
            end
          reg85 <= $signed(($signed((~|$signed((7'h41)))) != $unsigned($signed(((8'hb0) ?
              wire9 : wire79)))));
        end
      else
        begin
          reg80 <= (wire10[(4'hc):(1'h0)] ? wire39 : (8'hbc));
          if ((~|$unsigned({(+$signed(wire77))})))
            begin
              reg81 <= {$unsigned(($unsigned((wire12 == reg43)) ^~ $signed(reg80)))};
            end
          else
            begin
              reg81 <= wire7;
            end
        end
      reg86 <= $signed(reg43);
      reg87 <= wire41;
    end
  assign wire88 = (!(&reg85));
  always
    @(posedge clk) begin
      reg89 <= $signed(((-$signed($unsigned(wire10))) * $unsigned(({(8'hae),
              wire39} ?
          (~|reg85) : (wire8 - wire77)))));
      reg90 <= (8'hbc);
      if (wire7)
        begin
          reg91 <= wire8;
          if (reg87[(1'h1):(1'h0)])
            begin
              reg92 <= wire42;
              reg93 <= $signed(wire10[(1'h1):(1'h0)]);
            end
          else
            begin
              reg92 <= reg90;
              reg93 <= $signed($signed((((wire6 < reg81) >= $unsigned(wire77)) ?
                  $unsigned($signed(wire10)) : {(reg83 < wire42),
                      $signed(reg92)})));
              reg94 <= {(&{$unsigned((wire10 ? wire6 : wire77)),
                      ({(8'h9f)} * {reg81, reg92})}),
                  (reg92 - reg87[(4'hc):(4'hc)])};
              reg95 <= {(~^reg83[(3'h5):(3'h4)])};
              reg96 <= ((-reg93) >> {$signed(reg86),
                  $unsigned({$signed((7'h44)), wire41[(3'h7):(3'h4)]})});
            end
          reg97 <= ({(wire10[(3'h6):(3'h4)] ?
                      (-{reg87, wire39}) : ((reg95 ?
                          (8'h9d) : (8'ha7)) < ((8'hbe) < wire10)))} ?
              $unsigned($unsigned((~wire7[(4'hb):(1'h1)]))) : wire39[(3'h6):(3'h4)]);
          reg98 <= (~^($unsigned($unsigned($unsigned(reg95))) - $unsigned((-wire10[(1'h0):(1'h0)]))));
        end
      else
        begin
          reg91 <= ($signed(wire12) | $unsigned((^$signed((reg85 ~^ wire9)))));
          if ($signed((~^($signed((wire7 == wire11)) ?
              {(wire42 && reg92), (&reg86)} : reg89))))
            begin
              reg92 <= $unsigned(reg89[(3'h7):(1'h1)]);
              reg93 <= reg89[(3'h7):(3'h7)];
            end
          else
            begin
              reg92 <= $signed(({reg86,
                  $unsigned({reg81})} << $unsigned($signed(reg82[(3'h6):(1'h1)]))));
            end
          reg94 <= (^~((reg94 ? (^~wire7) : $unsigned((^wire11))) ?
              (^~((reg90 ?
                  reg80 : (8'ha5)) != $signed(wire11))) : (~&$unsigned((8'ha6)))));
        end
      if ($signed(reg81[(3'h4):(2'h3)]))
        begin
          if ($unsigned((^{$unsigned((-reg87)), wire39[(3'h4):(2'h3)]})))
            begin
              reg99 <= ($unsigned(($unsigned($unsigned((8'h9c))) ?
                      (8'hbd) : $unsigned(reg86))) ?
                  $unsigned(({wire6, (~&wire6)} ?
                      wire8 : $unsigned((wire7 ?
                          wire9 : wire10)))) : {$unsigned($signed((~^reg94)))});
              reg100 <= $unsigned((reg43 ?
                  $signed((reg98[(3'h5):(1'h0)] ?
                      wire88[(1'h1):(1'h0)] : reg96)) : reg98));
              reg101 <= $signed($signed(wire42[(3'h4):(2'h2)]));
              reg102 <= wire6[(5'h11):(2'h3)];
              reg103 <= $unsigned(reg99[(4'ha):(1'h0)]);
            end
          else
            begin
              reg99 <= wire12;
            end
        end
      else
        begin
          reg99 <= reg102;
          reg100 <= $signed((~(~reg103)));
          if (($signed((+({reg94} ?
              (~|reg97) : reg100[(4'hd):(1'h0)]))) * $signed(reg86[(3'h5):(2'h2)])))
            begin
              reg101 <= $signed($unsigned({reg96}));
              reg102 <= reg82;
              reg103 <= (reg94 >>> reg82);
              reg104 <= (^~(wire8 ?
                  $signed(reg43) : $signed({$signed(wire6)})));
              reg105 <= (((~|$unsigned({(8'ha0)})) >= (wire10[(4'hd):(4'h8)] << reg82)) << $unsigned(wire12));
            end
          else
            begin
              reg101 <= $signed((~^reg101[(4'he):(4'he)]));
              reg102 <= reg80[(4'ha):(3'h5)];
              reg103 <= (($unsigned((7'h43)) > (wire8[(3'h7):(1'h1)] * ((reg93 ?
                      reg99 : reg99) ?
                  (wire7 ~^ (8'hb1)) : (^~(8'hb5))))) << reg100[(2'h2):(2'h2)]);
            end
        end
      if ((-reg94[(4'ha):(3'h7)]))
        begin
          reg106 <= $signed({$signed((~&(&reg105))),
              (reg86 ? $unsigned((reg87 || (8'hb6))) : {$signed(reg90)})});
          reg107 <= reg90;
          reg108 <= $unsigned((^~$unsigned({wire41, wire8})));
          if ((-$signed({reg104[(4'h8):(4'h8)],
              ((~^reg101) ? (^reg95) : $unsigned(reg99))})))
            begin
              reg109 <= $unsigned(($unsigned(reg81[(1'h1):(1'h1)]) + $signed((!reg101))));
              reg110 <= reg96[(3'h7):(3'h7)];
              reg111 <= reg81;
            end
          else
            begin
              reg109 <= reg101[(2'h2):(2'h2)];
              reg110 <= $signed((wire9 ?
                  {$signed(reg94[(4'ha):(4'h9)]),
                      $signed(reg97)} : {(&wire8[(1'h0):(1'h0)]),
                      ((reg92 | wire10) ?
                          (reg92 ? reg107 : reg99) : (reg111 ?
                              wire42 : reg100))}));
              reg111 <= $unsigned(((-$unsigned(reg103)) ?
                  (reg94 >= $unsigned($unsigned(reg81))) : ((reg82[(1'h0):(1'h0)] <<< (^~wire6)) == (wire8 >>> reg90))));
              reg112 <= reg81[(1'h0):(1'h0)];
              reg113 <= (~$unsigned(reg96[(4'hd):(4'hc)]));
            end
          reg114 <= reg43;
        end
      else
        begin
          reg106 <= ((&reg105) ?
              $unsigned((~^reg106)) : $signed((~($signed(reg83) ^ reg104[(1'h0):(1'h0)]))));
          if ((8'hbd))
            begin
              reg107 <= $signed(reg103);
            end
          else
            begin
              reg107 <= $unsigned($signed($signed((~|wire11))));
              reg108 <= (reg106 > (~^wire12[(2'h3):(2'h2)]));
              reg109 <= (~$unsigned(wire11[(5'h15):(4'hc)]));
              reg110 <= wire9;
              reg111 <= (reg89 ? (~&(~|($signed(wire79) << reg87))) : (&wire6));
            end
          reg112 <= $signed((($signed((reg92 & reg101)) - reg89) ?
              $signed($signed({(8'h9e), (8'ha3)})) : reg86));
        end
    end
  assign wire115 = (!reg83[(3'h4):(3'h4)]);
  assign wire116 = (({reg93} ?
                           $signed((wire88[(1'h0):(1'h0)] && (wire88 >= wire6))) : {(reg98[(2'h3):(2'h3)] == $signed(wire79)),
                               ($signed(reg83) ?
                                   ((7'h40) - wire8) : {reg112, (8'ha9)})}) ?
                       (reg90[(4'hb):(3'h6)] ?
                           $unsigned($signed({wire88})) : wire88[(4'h9):(4'h8)]) : ($unsigned({(^reg81),
                               reg110[(1'h0):(1'h0)]}) ?
                           (|reg43[(3'h6):(3'h4)]) : (8'hb1)));
  assign wire117 = wire79;
  assign wire118 = reg85[(4'h8):(2'h2)];
  assign wire119 = (($signed({reg93[(3'h4):(1'h0)], $signed((8'hbe))}) ?
                       reg43[(3'h6):(2'h2)] : ($signed((reg107 ?
                               wire39 : (8'ha7))) ?
                           $unsigned($signed((8'hb8))) : ($unsigned(reg92) ?
                               (+(8'h9c)) : (&(8'ha9))))) - (8'hb8));
  assign wire120 = $unsigned($unsigned(reg90[(1'h1):(1'h1)]));
  assign wire121 = (((-((reg114 ~^ reg97) || (reg110 ~^ wire118))) || wire115[(3'h7):(3'h4)]) ?
                       wire116[(5'h15):(4'hc)] : reg99[(5'h11):(5'h10)]);
  always
    @(posedge clk) begin
      reg122 <= wire12;
      if ($signed(reg100))
        begin
          reg123 <= $signed($unsigned(wire10));
          if (((reg102 ?
                  ($signed({reg98, wire115}) ?
                      $signed($signed(wire77)) : (~&(wire88 >> reg109))) : $unsigned((wire88[(4'h8):(3'h5)] ?
                      $signed(reg87) : $unsigned((8'hb5))))) ?
              $signed((8'hac)) : (^(~|wire6))))
            begin
              reg124 <= (8'hab);
              reg125 <= reg100;
            end
          else
            begin
              reg124 <= reg109[(3'h5):(2'h3)];
              reg125 <= $signed(reg93);
              reg126 <= $unsigned($unsigned(({reg108[(2'h2):(1'h0)]} * {(!wire120)})));
            end
          reg127 <= (~((&{{wire10}, $unsigned(wire10)}) ?
              {(~|wire118[(2'h3):(2'h3)])} : $signed(reg125)));
          reg128 <= reg82;
          if ({(~(|(^~(~^reg94))))})
            begin
              reg129 <= wire117;
              reg130 <= (-(-$signed({(wire8 || reg126)})));
              reg131 <= {wire6[(4'h9):(1'h1)]};
              reg132 <= reg106[(1'h1):(1'h0)];
              reg133 <= {$unsigned((($signed(wire11) ?
                          $signed((8'hac)) : wire9[(1'h1):(1'h1)]) ?
                      reg108 : reg98)),
                  (|(wire10 <<< $signed(reg108[(5'h12):(3'h7)])))};
            end
          else
            begin
              reg129 <= reg110;
              reg130 <= reg91;
              reg131 <= wire39;
              reg132 <= ((wire115 >>> (reg98 == $unsigned((reg80 | reg99)))) ^ (~^$signed($unsigned((wire8 || (7'h41))))));
              reg133 <= ($unsigned((~$unsigned(reg95[(4'h9):(1'h0)]))) ?
                  $unsigned(((!(reg126 <= reg109)) ?
                      {$unsigned(reg43)} : $signed((|wire9)))) : reg126);
            end
        end
      else
        begin
          reg123 <= $unsigned(reg86[(2'h3):(1'h1)]);
          reg124 <= {(!((~(reg101 >>> reg94)) == {reg43[(1'h0):(1'h0)]})),
              ((($unsigned(reg132) ?
                      reg101 : (~wire77)) * $signed($unsigned(reg130))) ?
                  reg104 : {$signed({wire119}),
                      $unsigned(((8'hbf) < (8'hb7)))})};
          reg125 <= (8'hb8);
          reg126 <= ((($signed((|reg131)) ?
                  $unsigned((reg85 ? reg126 : reg92)) : ((~reg92) ?
                      $signed(reg126) : (reg126 ? reg126 : wire88))) ?
              reg129 : $unsigned((!wire41[(3'h7):(1'h0)]))) << (8'h9d));
        end
    end
endmodule

module module44
#(parameter param75 = {(~&{({(8'ha8)} | ((8'hb1) * (8'ha8)))})}, 
parameter param76 = param75)
(y, clk, wire48, wire47, wire46, wire45);
  output wire [(32'h11e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire48;
  input wire signed [(5'h10):(1'h0)] wire47;
  input wire [(4'hb):(1'h0)] wire46;
  input wire signed [(4'hb):(1'h0)] wire45;
  wire [(3'h6):(1'h0)] wire74;
  wire signed [(4'hb):(1'h0)] wire73;
  wire signed [(2'h3):(1'h0)] wire72;
  wire [(4'hb):(1'h0)] wire71;
  wire [(4'hb):(1'h0)] wire62;
  wire signed [(3'h6):(1'h0)] wire49;
  reg signed [(5'h11):(1'h0)] reg70 = (1'h0);
  reg [(5'h10):(1'h0)] reg69 = (1'h0);
  reg [(4'hc):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg67 = (1'h0);
  reg [(4'ha):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(4'ha):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  reg [(4'hf):(1'h0)] reg58 = (1'h0);
  reg [(5'h13):(1'h0)] reg57 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg [(3'h6):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg51 = (1'h0);
  reg [(5'h11):(1'h0)] reg50 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire62,
                 wire49,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
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
                 (1'h0)};
  assign wire49 = {(8'hbb)};
  always
    @(posedge clk) begin
      reg50 <= (($signed(wire46[(4'h8):(4'h8)]) ?
              wire47[(4'hb):(3'h6)] : (^(|$unsigned(wire49)))) ?
          (~|wire47) : {wire48});
      reg51 <= (&(-(-((wire45 ? wire45 : wire47) ?
          $signed(wire48) : reg50[(3'h4):(1'h0)]))));
      if ({wire45})
        begin
          reg52 <= reg50[(1'h1):(1'h1)];
          if ((8'hb6))
            begin
              reg53 <= ((8'ha3) > (~|({(reg51 - reg51)} == reg52)));
              reg54 <= {($unsigned(reg53) < (8'ha2))};
              reg55 <= (wire47 ?
                  (reg50 ? (8'hbc) : wire45[(3'h4):(2'h2)]) : {({(wire47 ?
                                  reg54 : wire48),
                              (^wire47)} ?
                          $signed(wire49) : $unsigned((reg52 ?
                              (8'ha0) : wire46))),
                      reg53});
              reg56 <= {wire47[(4'ha):(2'h2)],
                  ((-{reg53[(3'h5):(2'h2)]}) ?
                      (wire45[(3'h5):(3'h5)] ?
                          $unsigned(reg50) : {(reg53 ? reg50 : reg55),
                              (^~(8'hb3))}) : reg50)};
            end
          else
            begin
              reg53 <= (-wire45[(3'h7):(2'h3)]);
              reg54 <= $signed({$unsigned(($signed(wire45) & reg54))});
            end
          reg57 <= $signed((reg55[(2'h3):(2'h2)] <= (^(8'ha8))));
          reg58 <= (+wire46[(1'h0):(1'h0)]);
          reg59 <= reg51;
        end
      else
        begin
          if ($unsigned((($unsigned((wire49 ? wire47 : reg55)) ?
              reg50 : reg56[(4'h8):(3'h7)]) & reg53)))
            begin
              reg52 <= $signed(reg53[(4'h9):(2'h2)]);
              reg53 <= reg53[(1'h1):(1'h1)];
              reg54 <= reg53[(5'h12):(4'ha)];
              reg55 <= {(($unsigned(reg59[(3'h7):(3'h7)]) ?
                          (|(reg51 ^~ wire45)) : ((wire46 > reg57) ?
                              {(8'hba), (7'h44)} : {reg54})) ?
                      $signed(reg58) : ($unsigned((reg50 ?
                          reg52 : reg58)) - (reg54[(2'h3):(1'h0)] >>> (^~reg57))))};
            end
          else
            begin
              reg52 <= $signed((-(($signed(wire47) ?
                  (~&reg57) : reg52) <= (reg59[(2'h2):(1'h0)] ?
                  (wire46 ? wire48 : reg50) : (-wire45)))));
              reg53 <= ($unsigned((wire49[(1'h0):(1'h0)] ?
                  (reg58 == (-reg52)) : ($unsigned((8'ha3)) == (wire45 ?
                      reg50 : reg56)))) ^~ ((reg50[(4'hf):(4'h8)] + ($unsigned(reg56) == reg51[(4'h8):(2'h2)])) <= $signed((~&(~|(8'hb8))))));
              reg54 <= wire49;
            end
          reg56 <= reg59;
        end
      reg60 <= $unsigned($unsigned(reg58));
      reg61 <= ((~&(((~|wire47) != $signed(reg55)) >> $unsigned($signed(wire47)))) ^ wire45);
    end
  assign wire62 = $signed((~|((&(reg54 + reg55)) ? wire46 : reg54)));
  always
    @(posedge clk) begin
      reg63 <= (8'h9c);
      reg64 <= (wire62[(3'h5):(3'h5)] >>> ((reg52[(4'h8):(3'h7)] ?
          (-$signed(wire45)) : ($unsigned(wire49) == (wire46 ^~ wire47))) >= {{((8'ha5) ?
                  (8'ha2) : reg58)},
          ($signed(wire62) ? {reg58} : (reg50 | reg53))}));
      reg65 <= (reg64[(1'h0):(1'h0)] ?
          $unsigned(wire46[(3'h4):(3'h4)]) : ((-$signed((+(8'hb4)))) ^~ wire62));
      reg66 <= (((reg54 << reg60) ?
          $signed((^(reg65 ? reg55 : (7'h40)))) : (($signed(reg56) ?
              (&reg59) : (+wire47)) <= (~(+reg57)))) & ((reg53 >> ((|reg64) ?
              (reg64 ? reg58 : wire48) : ((7'h42) ^ (8'hbf)))) ?
          {($unsigned(reg53) ? (reg52 <<< reg65) : (wire62 >> reg50)),
              (!{wire47})} : (reg53[(1'h0):(1'h0)] >>> reg59[(1'h0):(1'h0)])));
      if ((reg64 | $unsigned(((|$unsigned(reg58)) ?
          $signed($signed(wire45)) : wire47))))
        begin
          reg67 <= ((wire45[(3'h7):(3'h5)] ?
                  (^~reg56) : {(8'hbc), $unsigned({wire47, (8'had)})}) ?
              (8'hbe) : reg59[(3'h4):(3'h4)]);
          reg68 <= ((~^$unsigned(((reg61 ? reg57 : (8'hae)) ?
                  ((8'haf) > (8'hb6)) : (&wire45)))) ?
              ($signed($unsigned((^~reg58))) ^ reg56[(4'hd):(1'h1)]) : (($unsigned(((8'hbf) == reg61)) << ((|wire46) ?
                      {reg54, (8'hac)} : ((8'hba) ? (8'hb8) : (8'h9d)))) ?
                  ({$unsigned(reg61),
                      (reg60 ?
                          (8'h9f) : wire47)} == reg66[(4'h9):(3'h6)]) : (~|({reg66} ?
                      reg53[(5'h10):(4'h8)] : (wire48 ? (8'ha3) : reg50)))));
          reg69 <= ($unsigned($signed((8'h9d))) || $unsigned((~^{$signed(reg57)})));
          reg70 <= ($unsigned($signed(wire45)) ?
              ((((reg65 ? (8'haa) : (8'hb5)) ~^ {reg51,
                      (8'hb2)}) ~^ $unsigned($signed(wire48))) ?
                  reg65 : {$unsigned((reg67 ? wire48 : wire47))}) : (8'ha1));
        end
      else
        begin
          reg67 <= reg69;
          reg68 <= ({(8'hba)} ? $signed(wire47[(3'h6):(3'h6)]) : reg58);
          reg69 <= (reg66[(2'h3):(1'h0)] | $unsigned(reg66));
          reg70 <= reg61;
        end
    end
  assign wire71 = $signed((reg57 >= reg64[(5'h10):(4'hf)]));
  assign wire72 = reg68[(4'hc):(4'ha)];
  assign wire73 = reg60[(4'h9):(3'h5)];
  assign wire74 = reg63;
endmodule

module module13
#(parameter param37 = ((((^~((7'h41) ? (8'ha4) : (8'ha7))) <= {{(8'hbe), (8'ha5)}, ((8'hbc) ? (8'ha9) : (8'ha9))}) ? ((8'ha5) >> {(8'ha6)}) : ((((8'ha7) ? (8'hb9) : (8'ha2)) ~^ (~|(8'ha7))) ? ((8'hb6) ~^ (~^(8'hb1))) : {{(7'h43)}, {(8'ha2)}})) ? ((({(8'ha9), (8'h9d)} > (~|(8'ha9))) && ({(7'h42), (8'hb7)} <<< (|(8'hb5)))) | ((((8'h9f) < (8'hae)) ? (~(8'ha5)) : ((8'ha7) && (8'ha3))) == (((8'hb3) >>> (8'hb2)) - {(8'h9f)}))) : ((&(-((8'had) ? (8'hb2) : (8'hae)))) ? ((~&(~&(8'hab))) ? (!(~(8'haa))) : {((7'h40) ? (8'hbb) : (8'hac)), ((8'hba) ? (8'hb0) : (8'hb8))}) : ((~^(~^(7'h42))) ? ((|(8'hb7)) > ((8'ha8) > (8'h9d))) : ({(8'ha5)} ? {(8'hac)} : {(8'hab), (8'hb0)})))), 
parameter param38 = ((~|(param37 || (!(param37 ? param37 : (8'haa))))) * (param37 ? (8'ha1) : (-param37))))
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire17;
  input wire [(3'h4):(1'h0)] wire16;
  input wire [(5'h12):(1'h0)] wire15;
  input wire [(5'h15):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire36;
  wire [(4'h9):(1'h0)] wire35;
  wire signed [(3'h6):(1'h0)] wire34;
  wire signed [(3'h7):(1'h0)] wire33;
  wire [(4'hb):(1'h0)] wire32;
  wire signed [(3'h4):(1'h0)] wire31;
  wire signed [(5'h14):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire29;
  wire signed [(4'he):(1'h0)] wire28;
  wire [(5'h15):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire26;
  wire signed [(3'h5):(1'h0)] wire25;
  wire [(3'h4):(1'h0)] wire24;
  wire signed [(4'he):(1'h0)] wire23;
  wire signed [(4'h9):(1'h0)] wire21;
  wire [(5'h11):(1'h0)] wire20;
  wire signed [(3'h7):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire18;
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  assign y = {wire36,
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
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 reg22,
                 (1'h0)};
  assign wire18 = (&wire14);
  assign wire19 = {(^wire16),
                      ((&($signed(wire15) < {wire17, wire16})) ?
                          wire17[(3'h4):(1'h0)] : wire18)};
  assign wire20 = {(~&((|(|(8'hb4))) ?
                          (wire18[(3'h7):(3'h7)] >= $unsigned(wire18)) : $unsigned((wire19 != wire19))))};
  assign wire21 = $unsigned(((wire14 ?
                          $unsigned((~&(7'h41))) : $signed((7'h41))) ?
                      wire15[(4'hb):(4'h9)] : (~|(^~wire18))));
  always
    @(posedge clk) begin
      reg22 <= wire14;
    end
  assign wire23 = wire19;
  assign wire24 = $unsigned($signed((reg22 ? wire17 : wire18)));
  assign wire25 = wire14[(1'h1):(1'h1)];
  assign wire26 = wire20;
  assign wire27 = wire20[(5'h10):(4'he)];
  assign wire28 = (reg22[(4'hd):(4'ha)] && wire27[(4'h9):(4'h9)]);
  assign wire29 = ({reg22} ?
                      ((wire16 ? $unsigned((&wire27)) : {(wire26 != wire27)}) ?
                          (((reg22 << (8'haf)) ?
                              $unsigned(wire14) : (wire21 | (8'ha2))) + wire21) : ($signed(wire23[(3'h4):(3'h4)]) ?
                              ($signed(wire21) & ((8'hb8) <= (8'ha7))) : wire25[(3'h5):(3'h5)])) : (((!(wire19 + wire24)) <<< (wire25[(1'h0):(1'h0)] <= (wire27 ?
                              wire24 : wire18))) ?
                          wire19[(3'h6):(3'h6)] : ($unsigned(wire24) ?
                              $signed((^~wire18)) : $unsigned($signed((8'ha4))))));
  assign wire30 = wire26[(3'h5):(1'h0)];
  assign wire31 = wire29[(4'hb):(3'h5)];
  assign wire32 = wire29;
  assign wire33 = wire16;
  assign wire34 = wire14;
  assign wire35 = wire30;
  assign wire36 = wire15[(5'h11):(4'hb)];
endmodule

module module254
#(parameter param278 = ({(({(8'hbd), (8'hbb)} ? ((8'hb1) != (8'hb0)) : (|(8'had))) << (((8'hae) ? (8'h9f) : (8'had)) || ((8'ha7) <= (7'h42)))), (^(((8'haf) ? (7'h43) : (8'had)) ? (~^(8'ha5)) : ((7'h44) || (8'ha4))))} ? (8'ha0) : ((|(-(^~(8'ha7)))) ? ({(8'ha0), ((8'ha3) ? (7'h41) : (8'ha3))} ? (((8'hbe) < (7'h42)) <<< ((8'h9d) >= (8'had))) : {(~&(8'hbc))}) : ({((8'hab) ? (8'ha1) : (8'hbd)), ((8'haf) & (8'hbe))} <= ((&(8'ha8)) ? ((8'hb2) <<< (8'ha4)) : ((7'h41) ^ (8'h9c)))))), 
parameter param279 = param278)
(y, clk, wire258, wire257, wire256, wire255);
  output wire [(32'hc5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire258;
  input wire [(3'h7):(1'h0)] wire257;
  input wire [(4'hf):(1'h0)] wire256;
  input wire [(5'h15):(1'h0)] wire255;
  wire [(3'h5):(1'h0)] wire277;
  wire [(2'h2):(1'h0)] wire276;
  wire [(2'h3):(1'h0)] wire275;
  wire signed [(4'h8):(1'h0)] wire274;
  wire [(5'h10):(1'h0)] wire273;
  wire signed [(4'h9):(1'h0)] wire272;
  reg [(5'h13):(1'h0)] reg271 = (1'h0);
  reg [(5'h12):(1'h0)] reg270 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg269 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg268 = (1'h0);
  reg [(4'h9):(1'h0)] reg267 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg266 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg265 = (1'h0);
  reg [(5'h14):(1'h0)] reg264 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg263 = (1'h0);
  reg [(3'h6):(1'h0)] reg262 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg261 = (1'h0);
  reg [(5'h13):(1'h0)] reg260 = (1'h0);
  reg [(5'h13):(1'h0)] reg259 = (1'h0);
  assign y = {wire277,
                 wire276,
                 wire275,
                 wire274,
                 wire273,
                 wire272,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg259 <= (wire256 ? wire255[(4'he):(1'h0)] : $unsigned(wire257));
      if ($signed(($signed((wire255 ? $unsigned(wire256) : $signed(reg259))) ?
          (~&$unsigned($signed(wire258))) : (wire255[(5'h14):(4'he)] > ($signed(wire257) << wire255)))))
        begin
          if (wire255[(4'hb):(2'h3)])
            begin
              reg260 <= (wire255 ?
                  ($unsigned($signed($signed(wire256))) ^~ ((^~$unsigned(wire258)) ?
                      {$signed(wire256)} : wire255[(5'h13):(4'hb)])) : (($signed($unsigned(reg259)) ?
                      $signed($unsigned(wire257)) : $unsigned(wire257)) >>> ({(!wire256),
                          (~wire255)} ?
                      $signed($unsigned(wire255)) : wire255[(4'ha):(1'h0)])));
              reg261 <= ($signed((~|$unsigned((-wire255)))) ?
                  ((reg260[(1'h0):(1'h0)] ?
                      {$signed(wire257)} : reg259) ^ (^{(|(8'ha3)),
                      (&wire256)})) : wire255);
            end
          else
            begin
              reg260 <= (~$signed((reg261[(5'h10):(4'he)] ?
                  $unsigned((wire257 ? wire256 : (7'h43))) : ({wire255} ?
                      reg260 : {reg261}))));
              reg261 <= reg260[(4'hf):(4'ha)];
              reg262 <= ($unsigned($unsigned({(wire255 ?
                      wire257 : (8'ha8))})) ~^ wire258[(4'h8):(2'h3)]);
              reg263 <= {{((~&{wire257, reg262}) >>> reg261[(5'h11):(4'hd)]),
                      $unsigned(((reg259 <= (8'hb5)) ?
                          ((8'ha2) == wire258) : wire258))},
                  wire257[(2'h2):(2'h2)]};
              reg264 <= wire255[(5'h11):(4'hb)];
            end
          reg265 <= {(^reg262[(3'h6):(2'h3)]),
              ((((reg260 >> (8'hb3)) ^~ reg259[(3'h4):(3'h4)]) ?
                  ((~^(8'hb2)) | (~&wire255)) : reg261[(3'h7):(1'h0)]) & (8'ha1))};
          reg266 <= (8'hb0);
        end
      else
        begin
          reg260 <= reg261;
          if (($signed(reg262) ? wire257 : {reg260[(4'h8):(3'h7)]}))
            begin
              reg261 <= (~(reg265 >> $unsigned(reg261[(4'h8):(1'h1)])));
              reg262 <= (reg262[(3'h4):(2'h2)] ^ ($signed(((wire255 ^~ wire256) ?
                      reg264 : $signed(reg266))) ?
                  (reg260[(4'he):(3'h5)] ?
                      (-$unsigned((8'haf))) : $unsigned((|reg265))) : reg260[(5'h11):(3'h7)]));
              reg263 <= wire257;
              reg264 <= reg263[(2'h2):(1'h1)];
              reg265 <= $unsigned((|reg261));
            end
          else
            begin
              reg261 <= (-$unsigned($signed(((-reg265) ?
                  (~^reg260) : {reg263}))));
              reg262 <= wire257[(3'h5):(2'h2)];
            end
          reg266 <= reg266;
          reg267 <= ({((|reg265[(2'h2):(1'h1)]) == {reg262[(3'h4):(1'h0)]}),
                  $unsigned($unsigned(((8'hb8) ? reg260 : reg260)))} ?
              (|$unsigned(wire257[(2'h2):(2'h2)])) : {(8'hae),
                  $signed(reg266)});
          reg268 <= reg266;
        end
    end
  always
    @(posedge clk) begin
      reg269 <= $unsigned($unsigned({wire255, reg266}));
      reg270 <= (reg269 == $signed((^~$signed($unsigned(reg259)))));
      reg271 <= wire256;
    end
  assign wire272 = (&$signed({($signed(wire255) || {reg262, reg267}),
                       ($signed(reg268) ? reg265 : reg268)}));
  assign wire273 = wire256[(2'h2):(2'h2)];
  assign wire274 = {reg259[(4'ha):(1'h0)]};
  assign wire275 = $signed(reg264);
  assign wire276 = $signed($unsigned($unsigned($signed((-(8'hbc))))));
  assign wire277 = $unsigned($signed(wire257));
endmodule

module module227
#(parameter param240 = (-({(-((8'hb8) ? (8'hbd) : (8'hb7))), (((8'hab) ? (8'ha5) : (8'hb5)) || (~|(8'h9d)))} ^ (({(7'h42), (8'ha1)} + (~&(8'had))) ? (((8'hb1) ? (8'hbe) : (7'h41)) ? (7'h42) : ((8'ha5) ? (8'h9d) : (8'h9f))) : (~^((8'h9c) < (8'hb8)))))))
(y, clk, wire231, wire230, wire229, wire228);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire231;
  input wire signed [(2'h3):(1'h0)] wire230;
  input wire signed [(3'h6):(1'h0)] wire229;
  input wire signed [(4'hc):(1'h0)] wire228;
  wire signed [(4'hb):(1'h0)] wire239;
  wire [(4'hf):(1'h0)] wire238;
  wire [(2'h3):(1'h0)] wire237;
  wire signed [(2'h2):(1'h0)] wire235;
  reg [(4'hd):(1'h0)] reg236 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg234 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg233 = (1'h0);
  reg [(4'hd):(1'h0)] reg232 = (1'h0);
  assign y = {wire239,
                 wire238,
                 wire237,
                 wire235,
                 reg236,
                 reg234,
                 reg233,
                 reg232,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg232 <= wire231;
      reg233 <= wire231;
      reg234 <= ((|{(8'h9e), (8'hb3)}) >> (|$signed((-$unsigned(wire230)))));
    end
  assign wire235 = {({$signed(((7'h42) + reg234)), (8'hb6)} ?
                           (reg234[(4'hd):(1'h1)] ?
                               (~$signed((8'ha6))) : (!$signed(reg234))) : $signed((|$unsigned(reg234))))};
  always
    @(posedge clk) begin
      reg236 <= {($signed((wire230 ?
              (|wire229) : reg232[(4'h8):(1'h0)])) & ($unsigned((wire235 | wire231)) <= (+(~reg234)))),
          reg234};
    end
  assign wire237 = (!$signed($signed($unsigned((reg236 ? wire231 : reg233)))));
  assign wire238 = $signed($unsigned(($signed((wire230 | wire229)) > $signed(wire230[(1'h0):(1'h0)]))));
  assign wire239 = $unsigned((reg233[(3'h5):(2'h2)] > {(-$unsigned(wire237)),
                       (^~reg233)}));
endmodule

module module168
#(parameter param187 = (+((+(((8'ha1) ? (7'h41) : (8'hb5)) ? {(8'ha1), (8'ha2)} : {(8'had)})) <<< {(~((8'hbb) ? (8'hbf) : (8'ha2)))})), 
parameter param188 = (param187 * ((((param187 ? param187 : param187) ? param187 : (param187 * param187)) ? (param187 ? (!(8'ha9)) : (param187 == param187)) : (param187 ? param187 : ((8'hb9) ? param187 : param187))) >= (^(-{param187})))))
(y, clk, wire173, wire172, wire171, wire170, wire169);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire173;
  input wire [(5'h15):(1'h0)] wire172;
  input wire signed [(5'h13):(1'h0)] wire171;
  input wire signed [(4'h9):(1'h0)] wire170;
  input wire signed [(3'h6):(1'h0)] wire169;
  wire [(2'h3):(1'h0)] wire186;
  wire signed [(5'h14):(1'h0)] wire185;
  wire [(2'h2):(1'h0)] wire184;
  wire signed [(2'h3):(1'h0)] wire183;
  wire signed [(3'h4):(1'h0)] wire182;
  wire [(4'he):(1'h0)] wire181;
  wire signed [(4'ha):(1'h0)] wire180;
  wire [(5'h15):(1'h0)] wire179;
  wire [(4'ha):(1'h0)] wire178;
  wire signed [(4'h8):(1'h0)] wire177;
  wire signed [(3'h5):(1'h0)] wire176;
  wire signed [(2'h3):(1'h0)] wire175;
  wire [(4'h8):(1'h0)] wire174;
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
                 wire176,
                 wire175,
                 wire174,
                 (1'h0)};
  assign wire174 = wire170;
  assign wire175 = wire170[(3'h7):(2'h3)];
  assign wire176 = (|(~$signed($unsigned($signed(wire175)))));
  assign wire177 = (wire170 > $unsigned($signed(((wire174 <<< wire172) > wire173[(3'h4):(1'h1)]))));
  assign wire178 = (wire170[(3'h7):(3'h7)] ?
                       (+(7'h42)) : $signed($unsigned(wire172)));
  assign wire179 = wire176;
  assign wire180 = wire179;
  assign wire181 = ((8'h9d) || ($signed($signed($signed(wire178))) ?
                       ($unsigned({wire169, wire179}) ?
                           ($signed(wire177) ?
                               wire174[(2'h2):(1'h1)] : (~^wire177)) : {(8'hba)}) : ((!(wire175 ?
                           wire169 : wire170)) > (((7'h40) ?
                           wire179 : wire173) <<< wire170[(3'h4):(2'h2)]))));
  assign wire182 = ((~&$signed(wire172)) ?
                       (~|(+{wire173[(1'h0):(1'h0)]})) : ((^~(8'hbb)) ?
                           (-$signed((wire178 >> wire178))) : {$signed($signed(wire170)),
                               {(wire169 ^~ wire176)}}));
  assign wire183 = wire172[(4'h8):(3'h6)];
  assign wire184 = (&$signed($signed(wire180)));
  assign wire185 = $signed(wire183[(2'h2):(1'h1)]);
  assign wire186 = ($signed($signed(wire176)) ?
                       $unsigned(wire173[(3'h5):(1'h1)]) : wire174[(2'h3):(1'h1)]);
endmodule
