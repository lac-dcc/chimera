module top
#(parameter param300 = {(((((7'h44) >>> (8'h9d)) ? ((8'hb0) ? (7'h41) : (8'hab)) : ((8'hae) ^~ (8'hbf))) ? (((8'h9c) ? (8'hb6) : (8'hbf)) | ((8'h9f) < (7'h42))) : (((8'ha3) << (7'h42)) ? {(8'hb0)} : ((8'hba) ? (8'hb8) : (8'hbb)))) ? ((|((8'hae) != (8'ha9))) ^ (~^((8'haa) ? (8'ha8) : (8'hbe)))) : (+((-(8'ha0)) ? {(8'ha4)} : ((8'ha7) ~^ (8'had)))))}, 
parameter param301 = {param300, (^~(!(param300 + (+param300))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1fd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire277;
  wire signed [(4'hd):(1'h0)] wire276;
  wire signed [(4'hc):(1'h0)] wire275;
  wire signed [(4'h8):(1'h0)] wire274;
  wire [(4'h9):(1'h0)] wire264;
  wire signed [(5'h14):(1'h0)] wire263;
  wire [(5'h12):(1'h0)] wire262;
  wire [(4'hd):(1'h0)] wire260;
  wire [(4'hb):(1'h0)] wire259;
  wire signed [(4'h9):(1'h0)] wire258;
  wire signed [(4'h8):(1'h0)] wire257;
  wire [(5'h14):(1'h0)] wire255;
  wire [(5'h14):(1'h0)] wire4;
  reg signed [(5'h12):(1'h0)] reg299 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg298 = (1'h0);
  reg [(4'hb):(1'h0)] reg297 = (1'h0);
  reg [(4'ha):(1'h0)] reg296 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg295 = (1'h0);
  reg [(3'h6):(1'h0)] reg294 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg293 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg292 = (1'h0);
  reg [(4'hd):(1'h0)] reg291 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg290 = (1'h0);
  reg [(3'h5):(1'h0)] reg289 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg288 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg287 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg286 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg285 = (1'h0);
  reg [(5'h11):(1'h0)] reg284 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg283 = (1'h0);
  reg [(4'hd):(1'h0)] reg282 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg281 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg280 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg279 = (1'h0);
  reg [(4'he):(1'h0)] reg278 = (1'h0);
  reg [(4'h8):(1'h0)] reg273 = (1'h0);
  reg signed [(4'he):(1'h0)] reg272 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg271 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg270 = (1'h0);
  reg [(2'h2):(1'h0)] reg269 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg268 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg267 = (1'h0);
  reg [(5'h12):(1'h0)] reg266 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg265 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg261 = (1'h0);
  assign y = {wire277,
                 wire276,
                 wire275,
                 wire274,
                 wire264,
                 wire263,
                 wire262,
                 wire260,
                 wire259,
                 wire258,
                 wire257,
                 wire255,
                 wire4,
                 reg299,
                 reg298,
                 reg297,
                 reg296,
                 reg295,
                 reg294,
                 reg293,
                 reg292,
                 reg291,
                 reg290,
                 reg289,
                 reg288,
                 reg287,
                 reg286,
                 reg285,
                 reg284,
                 reg283,
                 reg282,
                 reg281,
                 reg280,
                 reg279,
                 reg278,
                 reg273,
                 reg272,
                 reg271,
                 reg270,
                 reg269,
                 reg268,
                 reg267,
                 reg266,
                 reg265,
                 reg261,
                 (1'h0)};
  assign wire4 = ((~&((~(wire2 ? wire3 : (8'haf))) ?
                     $signed(wire0[(5'h11):(1'h1)]) : wire0[(4'hd):(2'h3)])) <= $unsigned(($unsigned(wire3[(1'h0):(1'h0)]) ?
                     (~&wire1[(3'h7):(1'h1)]) : wire1)));
  module5 #() modinst256 (wire255, clk, wire1, wire2, wire4, wire3);
  assign wire257 = (|(({$unsigned(wire255), wire255[(3'h6):(3'h5)]} >= {wire0,
                           {(8'ha4), wire255}}) ?
                       (~^$signed($signed(wire4))) : wire4));
  assign wire258 = ($unsigned($unsigned({$signed(wire255),
                       $unsigned(wire2)})) ~^ ((!$unsigned(wire257[(3'h7):(1'h1)])) ?
                       $signed((|$signed(wire3))) : ($unsigned($signed(wire1)) - wire2)));
  assign wire259 = ($unsigned($unsigned($unsigned($unsigned(wire4)))) ^~ {$unsigned(($unsigned(wire2) & (wire257 << wire2))),
                       $signed(wire4[(5'h14):(4'he)])});
  assign wire260 = $signed(wire0[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg261 <= ((wire260 ?
          ((^wire2[(1'h1):(1'h0)]) != wire255[(4'hf):(4'hb)]) : ({$signed(wire0)} <= $unsigned(wire260))) <<< wire3[(3'h4):(3'h4)]);
    end
  assign wire262 = (&(~^($unsigned(wire258[(3'h4):(2'h2)]) || {wire260[(4'h9):(3'h7)]})));
  assign wire263 = {(~|wire1[(2'h2):(1'h0)])};
  assign wire264 = (|$signed($signed($signed($unsigned(wire4)))));
  always
    @(posedge clk) begin
      if ((!($unsigned($unsigned($signed(wire2))) ?
          (+wire257[(1'h1):(1'h0)]) : $signed(((-reg261) <= (~&wire2))))))
        begin
          reg265 <= wire263;
          if ($unsigned($unsigned(wire262[(4'hd):(1'h0)])))
            begin
              reg266 <= wire1;
              reg267 <= $unsigned(wire264[(1'h0):(1'h0)]);
              reg268 <= ($unsigned((((|wire0) ?
                  (&reg261) : wire259) * ((wire262 * wire2) * (~wire3)))) >= $signed(wire258));
              reg269 <= {(8'h9d), reg268[(2'h3):(1'h0)]};
              reg270 <= ((~&$signed(((8'hb0) <= $signed((7'h44))))) ?
                  {$unsigned({wire4[(5'h10):(2'h3)],
                          ((8'ha2) ? wire263 : reg266)}),
                      $unsigned($unsigned($unsigned(wire258)))} : (~^reg267[(3'h7):(1'h1)]));
            end
          else
            begin
              reg266 <= $unsigned((~|wire255));
            end
          reg271 <= wire1;
        end
      else
        begin
          reg265 <= $signed(wire2[(4'hb):(3'h6)]);
          reg266 <= (+(-$unsigned(((~reg270) & (&wire3)))));
          reg267 <= $signed(($unsigned(wire263) ?
              ({{wire263},
                  $unsigned(reg271)} && $signed($unsigned(wire2))) : wire263[(4'ha):(3'h4)]));
          if (reg269[(2'h2):(2'h2)])
            begin
              reg268 <= reg266[(1'h1):(1'h1)];
              reg269 <= wire260[(1'h0):(1'h0)];
              reg270 <= ($unsigned(wire264) != wire264);
              reg271 <= {wire255[(5'h13):(4'hf)]};
              reg272 <= reg268;
            end
          else
            begin
              reg268 <= $unsigned(wire262[(2'h2):(2'h2)]);
              reg269 <= (~^(reg266 ? wire0 : reg271));
              reg270 <= (&{(((wire260 ^ reg265) || $unsigned((8'ha7))) || ((wire257 ?
                      wire263 : wire255) | (8'hb8)))});
              reg271 <= {(wire263[(4'ha):(2'h3)] | ((8'h9c) ? wire4 : reg266))};
            end
        end
      reg273 <= {$signed((~($unsigned(reg267) <<< $unsigned(reg267)))),
          wire264};
    end
  assign wire274 = ((|$signed({{reg268, (8'h9f)}})) ?
                       reg266 : wire260[(3'h6):(3'h5)]);
  assign wire275 = (($signed(reg267[(1'h1):(1'h0)]) << (!((8'ha9) <= reg267))) >>> $signed(($signed(((8'haa) != wire3)) ?
                       {(wire0 ? wire259 : wire259)} : $unsigned(reg265))));
  assign wire276 = wire0;
  assign wire277 = reg268;
  always
    @(posedge clk) begin
      reg278 <= {$unsigned(((~(reg266 ? (8'ha9) : wire2)) ?
              ($signed(wire260) ?
                  $unsigned(wire257) : wire264) : $unsigned({reg265,
                  reg269})))};
      reg279 <= wire1;
    end
  always
    @(posedge clk) begin
      reg280 <= wire1[(1'h1):(1'h0)];
      reg281 <= {(+wire274)};
      if ((+reg279[(2'h2):(1'h0)]))
        begin
          if ($signed($signed(wire263[(1'h1):(1'h1)])))
            begin
              reg282 <= reg273[(3'h5):(3'h4)];
              reg283 <= $unsigned(reg280);
              reg284 <= wire274;
              reg285 <= {((!$signed(wire255[(5'h14):(4'ha)])) ?
                      $unsigned($unsigned(reg278)) : reg278),
                  (!$unsigned(((wire264 - reg283) && reg261[(1'h0):(1'h0)])))};
            end
          else
            begin
              reg282 <= {wire274};
            end
          if ((reg265[(3'h5):(2'h3)] ?
              reg267[(3'h7):(3'h4)] : $unsigned($signed($unsigned((wire262 ?
                  reg281 : (8'hb3)))))))
            begin
              reg286 <= ($unsigned(wire260) ?
                  ((|(+$unsigned(reg281))) - {reg279,
                      $signed((reg265 ^ (8'ha5)))}) : (reg278 != $signed({$signed(wire262),
                      $unsigned((8'ha3))})));
              reg287 <= ($signed($unsigned(reg261[(3'h7):(1'h0)])) ?
                  wire258 : $unsigned($signed(((reg273 ?
                      reg280 : reg280) << wire277))));
              reg288 <= (~^(($unsigned($signed(wire277)) ?
                      {$unsigned(reg266)} : (~^$unsigned(reg271))) ?
                  $signed(reg265) : {reg286[(2'h3):(1'h0)]}));
            end
          else
            begin
              reg286 <= (|(^~reg261));
            end
          if ($signed(reg267[(4'h8):(3'h6)]))
            begin
              reg289 <= (reg265 ?
                  {((wire277 ?
                          (reg288 ?
                              (8'hb5) : (8'ha7)) : reg272[(3'h5):(3'h5)]) <<< {$unsigned(reg279)})} : (((7'h44) ~^ ((7'h43) ?
                          (wire259 * reg284) : $unsigned(reg267))) ?
                      $signed(wire1[(3'h7):(1'h0)]) : $unsigned(wire274)));
            end
          else
            begin
              reg289 <= (^~wire274);
              reg290 <= ({(($signed((8'h9d)) ?
                          ((8'hbe) ?
                              reg267 : reg279) : $unsigned(reg271)) && ((wire264 ?
                          (8'hbf) : wire3) * {reg283, reg281}))} ?
                  $signed($unsigned({$unsigned(wire275),
                      wire260[(3'h4):(1'h0)]})) : reg270[(2'h2):(1'h0)]);
              reg291 <= ((((reg283[(1'h0):(1'h0)] <<< ((8'hb0) > wire275)) || (wire264[(4'h9):(1'h1)] ?
                      reg278 : wire274)) >= (&(!$unsigned(wire277)))) ?
                  (^reg289) : reg286);
              reg292 <= $unsigned((~$signed($unsigned(wire4[(4'hf):(1'h0)]))));
            end
        end
      else
        begin
          reg282 <= wire274[(4'h8):(2'h2)];
          reg283 <= $unsigned((((((8'hbc) ? (8'h9d) : wire257) ?
                      (reg287 ? wire263 : reg273) : {reg285, reg288}) ?
                  $signed((wire259 << wire262)) : wire263) ?
              {($unsigned(reg269) ?
                      $unsigned(reg273) : $unsigned(reg286))} : $signed(wire3)));
          if (((8'ha1) == $unsigned(((8'hbf) ?
              reg268[(1'h1):(1'h0)] : $signed((+reg289))))))
            begin
              reg284 <= (wire4[(4'h8):(4'h8)] >> $signed($signed(($signed(reg272) >> (|(8'hb0))))));
              reg285 <= (8'had);
              reg286 <= {reg267,
                  $signed($signed((wire1[(2'h3):(2'h3)] ?
                      (reg267 ? reg280 : reg266) : ((8'h9c) ~^ (8'hae)))))};
              reg287 <= wire262;
            end
          else
            begin
              reg284 <= ($signed((wire4 >> reg281)) << ((^{$unsigned((8'hb6)),
                      {wire264}}) ?
                  reg270 : reg270));
            end
          reg288 <= wire3;
          reg289 <= ($signed(wire0[(1'h0):(1'h0)]) ?
              ($signed(wire260) & reg281) : ($signed(reg265) && {$signed(reg279[(1'h1):(1'h0)]),
                  {{reg283}, (reg286 >>> reg267)}}));
        end
      if (((~&($signed((|(8'hbc))) ?
          $signed((~&(8'haf))) : {(reg282 > (8'hb4))})) ^~ reg270[(4'hc):(3'h7)]))
        begin
          if (reg292)
            begin
              reg293 <= reg292;
            end
          else
            begin
              reg293 <= wire4[(1'h0):(1'h0)];
              reg294 <= ($signed($unsigned($signed((^(8'hb5))))) ?
                  (^~reg289[(3'h5):(3'h4)]) : $unsigned(reg286[(3'h5):(1'h1)]));
              reg295 <= (reg291[(1'h1):(1'h0)] ? wire259 : wire2);
              reg296 <= reg267[(1'h0):(1'h0)];
              reg297 <= {$unsigned($unsigned((((8'hb5) ? wire260 : wire0) ?
                      (|reg265) : reg280[(2'h2):(2'h2)]))),
                  $signed((((&reg291) ?
                          ((8'haf) >= reg281) : (reg267 > wire274)) ?
                      wire262[(3'h7):(2'h2)] : (reg265 ^~ reg278)))};
            end
          reg298 <= wire274;
          reg299 <= reg290[(5'h13):(2'h2)];
        end
      else
        begin
          reg293 <= $unsigned(wire4);
          reg294 <= $unsigned((reg280 <= ($unsigned((wire4 >= wire262)) ?
              {(reg271 ? reg294 : reg287),
                  $unsigned((8'hb9))} : ($signed(reg290) == (wire4 ?
                  wire0 : wire4)))));
          reg295 <= ({$signed((wire264[(2'h2):(1'h0)] | (wire263 ?
                  reg299 : reg266)))} == reg295);
        end
    end
endmodule

module module5
#(parameter param253 = {{(+(((8'hbd) ? (8'hab) : (8'hb7)) < ((8'hae) ? (7'h42) : (8'h9f)))), ((&((7'h42) != (8'ha9))) ? ({(8'ha1)} < {(8'ha2)}) : {{(8'h9e)}})}, ((|(|((8'ha0) <= (8'ha1)))) ? (&{(!(7'h43))}) : {(((8'h9d) ? (8'ha4) : (8'hbc)) ? (~^(8'ha3)) : (|(8'ha4)))})}, 
parameter param254 = param253)
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h199):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire6;
  input wire [(5'h12):(1'h0)] wire7;
  input wire [(4'hf):(1'h0)] wire8;
  input wire [(4'hf):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire246;
  wire signed [(4'hb):(1'h0)] wire181;
  wire signed [(2'h2):(1'h0)] wire138;
  wire signed [(5'h10):(1'h0)] wire136;
  wire signed [(4'hd):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire71;
  wire signed [(2'h2):(1'h0)] wire218;
  wire [(4'hc):(1'h0)] wire220;
  wire signed [(4'h8):(1'h0)] wire221;
  wire [(5'h13):(1'h0)] wire244;
  reg [(2'h2):(1'h0)] reg252 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg251 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg250 = (1'h0);
  reg [(3'h7):(1'h0)] reg249 = (1'h0);
  reg [(4'h8):(1'h0)] reg248 = (1'h0);
  reg signed [(4'he):(1'h0)] reg247 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  assign y = {wire246,
                 wire181,
                 wire138,
                 wire136,
                 wire10,
                 wire11,
                 wire26,
                 wire71,
                 wire218,
                 wire220,
                 wire221,
                 wire244,
                 reg252,
                 reg251,
                 reg250,
                 reg249,
                 reg248,
                 reg247,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 (1'h0)};
  assign wire10 = {($unsigned(wire8) ?
                          {(((7'h44) ?
                                  (8'hba) : wire8) * $signed(wire8))} : ((+(wire7 <= wire9)) ?
                              $unsigned((wire7 ? wire8 : wire9)) : ((8'hb8) ?
                                  $signed(wire7) : wire7[(3'h7):(3'h7)]))),
                      {((8'hba) ?
                              ($signed(wire8) < wire8) : (wire6 ?
                                  wire6[(2'h2):(1'h0)] : wire8[(1'h1):(1'h0)])),
                          $signed(wire6)}};
  assign wire11 = (wire7 ?
                      $signed(wire8[(4'h9):(2'h2)]) : (!({wire10} ?
                          (-(wire9 & wire8)) : (|(-wire7)))));
  always
    @(posedge clk) begin
      if ((8'ha9))
        begin
          reg12 <= wire10[(3'h4):(1'h0)];
        end
      else
        begin
          reg12 <= $signed((wire8[(4'h8):(2'h2)] ?
              ($signed(wire11) >>> $signed($unsigned(wire10))) : wire8[(3'h7):(3'h5)]));
          reg13 <= $signed($signed((^~((wire7 ? reg12 : wire11) >>> (wire11 ?
              wire6 : wire10)))));
          reg14 <= $unsigned((({wire9, wire9[(3'h5):(2'h2)]} ?
              $signed((|(8'ha9))) : (-(^reg13))) != wire7[(1'h1):(1'h1)]));
          reg15 <= (-wire7[(3'h5):(2'h3)]);
          reg16 <= (($signed($signed((!reg12))) ?
                  $signed(reg15[(4'hb):(4'h9)]) : (-{(wire11 <<< reg12),
                      $signed(reg12)})) ?
              {$unsigned($signed((wire11 ? (8'h9e) : wire9)))} : (7'h42));
        end
      reg17 <= {{(((|reg12) != $unsigned(wire8)) + reg16),
              ($unsigned(wire7[(2'h2):(1'h1)]) * (7'h42))}};
      reg18 <= $signed(reg14);
      reg19 <= (wire11[(4'hd):(2'h3)] ?
          $unsigned($unsigned((8'hb3))) : (~&((+reg17) + $signed((wire8 ?
              wire7 : wire11)))));
      reg20 <= $unsigned($unsigned($signed((reg19[(4'h9):(3'h6)] ?
          reg16[(1'h0):(1'h0)] : (reg17 ~^ reg16)))));
    end
  always
    @(posedge clk) begin
      reg21 <= {(~|(~reg17))};
      reg22 <= $signed((reg19[(4'ha):(1'h0)] ?
          ((reg20 << ((8'hae) == reg19)) ~^ wire6[(4'h8):(1'h0)]) : (8'hb0)));
      reg23 <= wire10;
      reg24 <= reg18;
      reg25 <= $signed($unsigned($unsigned(((reg17 ?
          wire8 : (8'h9f)) ~^ (reg15 - reg21)))));
    end
  assign wire26 = reg24;
  module27 #() modinst72 (.wire29(reg24), .wire31(wire8), .clk(clk), .y(wire71), .wire28(reg14), .wire30(reg18));
  module73 #() modinst137 (.wire76(reg19), .y(wire136), .wire77(reg12), .clk(clk), .wire78(wire9), .wire75(reg22), .wire74(wire10));
  assign wire138 = reg14[(1'h0):(1'h0)];
  module139 #() modinst182 (.wire143(reg22), .y(wire181), .wire144(wire8), .wire141(wire10), .wire140(reg24), .wire142(wire9), .clk(clk));
  module183 #() modinst219 (wire218, clk, reg12, wire136, wire11, wire7, wire181);
  assign wire220 = reg15;
  assign wire221 = $unsigned(((reg25 ?
                       ((8'hbb) ?
                           (reg13 ?
                               (8'hbc) : reg14) : (reg18 ^~ reg13)) : (~|(reg20 ?
                           wire9 : (8'hb4)))) ~^ ((|((8'hba) ?
                       wire26 : reg24)) * (7'h40))));
  module222 #() modinst245 (wire244, clk, wire136, reg14, reg24, reg15, reg12);
  assign wire246 = (+(~|wire71[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      reg247 <= wire26[(3'h5):(3'h4)];
      reg248 <= (^~reg16[(3'h5):(1'h0)]);
      if (reg247)
        begin
          reg249 <= $unsigned(reg17[(2'h2):(1'h1)]);
          reg250 <= wire138[(1'h0):(1'h0)];
          reg251 <= $unsigned((&(8'haf)));
        end
      else
        begin
          reg249 <= reg24[(4'ha):(4'h8)];
        end
      reg252 <= wire220;
    end
endmodule

module module222
#(parameter param242 = (~^(^~{{{(8'ha2)}, ((8'hb3) ? (7'h40) : (8'ha5))}, ((~(8'h9e)) ? ((8'ha9) ? (8'h9f) : (7'h40)) : ((7'h43) ? (8'ha8) : (8'ha7)))})), 
parameter param243 = ({(param242 ? ((param242 ? param242 : (8'hbb)) ? (param242 > param242) : {param242}) : (~(param242 << (8'hb3)))), ({(&param242)} >> {(^param242)})} ? ((((param242 ? param242 : param242) << (param242 ? param242 : param242)) | ((param242 ^ param242) ? (param242 << param242) : {(8'ha3)})) ? {((param242 ? param242 : param242) == (param242 ? param242 : param242)), (8'hbb)} : (~param242)) : ((param242 || ((&param242) << {param242})) || (~({(7'h42), param242} ? {param242} : (param242 ? param242 : param242))))))
(y, clk, wire227, wire226, wire225, wire224, wire223);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire227;
  input wire signed [(5'h14):(1'h0)] wire226;
  input wire signed [(5'h10):(1'h0)] wire225;
  input wire [(5'h13):(1'h0)] wire224;
  input wire [(5'h14):(1'h0)] wire223;
  wire signed [(4'h9):(1'h0)] wire241;
  wire [(2'h3):(1'h0)] wire240;
  wire signed [(5'h13):(1'h0)] wire237;
  wire signed [(5'h13):(1'h0)] wire236;
  wire [(5'h13):(1'h0)] wire235;
  wire signed [(4'hb):(1'h0)] wire234;
  wire signed [(5'h11):(1'h0)] wire233;
  wire [(2'h2):(1'h0)] wire232;
  wire [(5'h15):(1'h0)] wire231;
  wire [(5'h15):(1'h0)] wire230;
  wire signed [(5'h15):(1'h0)] wire229;
  wire [(5'h14):(1'h0)] wire228;
  reg [(4'hf):(1'h0)] reg239 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg238 = (1'h0);
  assign y = {wire241,
                 wire240,
                 wire237,
                 wire236,
                 wire235,
                 wire234,
                 wire233,
                 wire232,
                 wire231,
                 wire230,
                 wire229,
                 wire228,
                 reg239,
                 reg238,
                 (1'h0)};
  assign wire228 = wire225[(3'h4):(2'h2)];
  assign wire229 = (8'hb3);
  assign wire230 = (wire224 == wire227[(4'hb):(3'h4)]);
  assign wire231 = $signed({$unsigned(((wire230 > wire228) ?
                           (~|(8'hb2)) : (~^wire223)))});
  assign wire232 = wire223[(5'h11):(4'h9)];
  assign wire233 = ($signed($signed(wire223)) ?
                       (-$unsigned(($signed(wire231) <= {(8'ha6)}))) : $signed((($unsigned(wire224) & wire227[(3'h5):(3'h5)]) || wire226)));
  assign wire234 = $signed(wire223);
  assign wire235 = $signed($unsigned($signed(wire233)));
  assign wire236 = $signed((((8'ha0) ?
                       ($unsigned((8'ha6)) ?
                           wire230[(4'h9):(3'h6)] : (wire224 || wire226)) : (~|$unsigned(wire224))) & wire223[(2'h2):(1'h0)]));
  assign wire237 = $signed($signed({((~^wire226) ?
                           $unsigned(wire233) : $signed(wire229))}));
  always
    @(posedge clk) begin
      reg238 <= $unsigned(wire235);
      reg239 <= reg238;
    end
  assign wire240 = $signed(((((wire236 ? wire236 : (8'ha6)) ?
                               (^wire235) : (~^wire234)) ?
                           (|$signed((8'ha8))) : ((wire224 ?
                                   wire229 : wire224) ?
                               wire233 : (-wire227))) ?
                       {{$signed(wire231)},
                           ($unsigned((8'hb8)) >= (wire235 ?
                               wire227 : wire228))} : ($unsigned($unsigned(wire233)) + {(!(8'hb5))})));
  assign wire241 = wire229;
endmodule

module module183
#(parameter param216 = (~{(~&(|((8'hb8) ? (8'hac) : (8'hbc))))}), 
parameter param217 = param216)
(y, clk, wire188, wire187, wire186, wire185, wire184);
  output wire [(32'h173):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire188;
  input wire signed [(4'hb):(1'h0)] wire187;
  input wire [(5'h12):(1'h0)] wire186;
  input wire signed [(5'h12):(1'h0)] wire185;
  input wire [(3'h6):(1'h0)] wire184;
  wire signed [(3'h6):(1'h0)] wire215;
  wire [(5'h13):(1'h0)] wire206;
  wire signed [(3'h7):(1'h0)] wire205;
  wire signed [(4'hb):(1'h0)] wire204;
  wire [(5'h14):(1'h0)] wire199;
  wire [(3'h7):(1'h0)] wire198;
  wire [(4'hf):(1'h0)] wire197;
  wire signed [(2'h3):(1'h0)] wire196;
  wire [(5'h12):(1'h0)] wire195;
  wire signed [(5'h12):(1'h0)] wire192;
  wire [(3'h5):(1'h0)] wire191;
  wire signed [(5'h14):(1'h0)] wire190;
  wire signed [(4'hf):(1'h0)] wire189;
  reg signed [(5'h13):(1'h0)] reg214 = (1'h0);
  reg [(5'h10):(1'h0)] reg213 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg212 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg211 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg210 = (1'h0);
  reg [(5'h11):(1'h0)] reg209 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg208 = (1'h0);
  reg [(5'h12):(1'h0)] reg207 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg203 = (1'h0);
  reg [(4'hf):(1'h0)] reg202 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg201 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg200 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg194 = (1'h0);
  reg [(3'h6):(1'h0)] reg193 = (1'h0);
  assign y = {wire215,
                 wire206,
                 wire205,
                 wire204,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg194,
                 reg193,
                 (1'h0)};
  assign wire189 = $unsigned((~^{$signed(wire187[(4'h8):(3'h5)])}));
  assign wire190 = wire189;
  assign wire191 = wire189;
  assign wire192 = $unsigned(wire184[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      reg193 <= (wire184[(1'h0):(1'h0)] + (~&$signed($unsigned((wire191 ?
          wire184 : wire190)))));
      reg194 <= wire190[(4'hf):(4'hc)];
    end
  assign wire195 = $unsigned($unsigned(wire187[(1'h0):(1'h0)]));
  assign wire196 = wire185;
  assign wire197 = $unsigned(wire190);
  assign wire198 = $unsigned((($unsigned((wire190 * reg194)) ?
                           {$signed(wire197)} : {(wire192 >> wire192)}) ?
                       ((^~wire191[(2'h3):(2'h2)]) <<< wire197) : wire185));
  assign wire199 = wire185[(4'hb):(2'h3)];
  always
    @(posedge clk) begin
      reg200 <= (((wire186[(1'h1):(1'h0)] || $signed(wire198)) + reg194[(2'h3):(2'h3)]) > {{((wire199 ?
                  wire190 : wire195) * (wire186 ? wire189 : wire195))},
          wire192});
      reg201 <= $unsigned({(($unsigned(reg200) ?
                  ((8'hbb) ? wire192 : (8'hb9)) : wire197[(1'h0):(1'h0)]) ?
              {$unsigned(wire190), (8'hb7)} : {((8'h9e) < wire199)}),
          wire184});
      reg202 <= (~|((wire195[(2'h2):(1'h0)] <<< wire192) ?
          (8'hbc) : ({wire198[(2'h2):(2'h2)]} >> (|$unsigned(wire198)))));
      reg203 <= (8'ha1);
    end
  assign wire204 = (!((^($signed(wire189) ?
                       {reg201,
                           wire186} : $signed(wire187))) && $unsigned((wire185 <<< (wire197 || wire185)))));
  assign wire205 = (({(&wire196)} ?
                           $signed({(-wire204),
                               wire189}) : wire189[(4'hf):(2'h3)]) ?
                       wire195 : {$signed((8'hba)),
                           (&(~|(wire192 ^~ wire197)))});
  assign wire206 = ({(({wire196, wire198} ?
                               (^wire185) : reg194) || ($unsigned(wire204) > wire184[(2'h3):(1'h1)])),
                           wire185} ?
                       {((!wire186) ?
                               ($signed(reg194) <= (&reg193)) : {$signed(wire190)})} : reg200[(4'h9):(1'h0)]);
  always
    @(posedge clk) begin
      reg207 <= (($unsigned($unsigned((&wire189))) ^~ $signed($signed((^~wire198)))) ?
          (&wire191[(3'h5):(1'h0)]) : wire189);
      if ((((($unsigned(wire198) ?
          $signed(wire186) : wire190) && $unsigned((~|wire196))) > (-$unsigned((~|reg200)))) <= ({{(^wire199),
              $unsigned((8'h9e))},
          ({wire184} < {(8'hb0)})} > (-wire188[(4'h8):(1'h1)]))))
        begin
          reg208 <= wire192;
        end
      else
        begin
          reg208 <= $unsigned(wire204);
          reg209 <= reg202;
          reg210 <= ($unsigned(wire206) ?
              $signed(wire191) : $signed((^wire205)));
          reg211 <= (+wire184);
          reg212 <= (wire187 ?
              $unsigned(wire198[(1'h0):(1'h0)]) : (wire184[(2'h3):(2'h3)] & (wire206 ?
                  (wire185 ?
                      (reg202 ?
                          wire187 : reg207) : wire189) : reg194[(3'h6):(1'h1)])));
        end
      reg213 <= wire184;
      reg214 <= $unsigned((reg208[(1'h0):(1'h0)] ?
          $unsigned($signed((reg208 == wire186))) : (wire204[(3'h7):(2'h3)] ?
              ((wire190 << wire206) >>> wire186[(5'h12):(3'h4)]) : (~|wire187[(3'h4):(1'h1)]))));
    end
  assign wire215 = (reg207 ~^ (wire197 >= {reg209, $unsigned((+(8'hb6)))}));
endmodule

module module139  (y, clk, wire144, wire143, wire142, wire141, wire140);
  output wire [(32'h1bc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire144;
  input wire [(5'h10):(1'h0)] wire143;
  input wire [(4'hf):(1'h0)] wire142;
  input wire [(4'hd):(1'h0)] wire141;
  input wire signed [(4'he):(1'h0)] wire140;
  wire signed [(3'h4):(1'h0)] wire180;
  wire signed [(2'h3):(1'h0)] wire179;
  wire [(4'hf):(1'h0)] wire178;
  wire signed [(4'he):(1'h0)] wire177;
  wire [(4'h8):(1'h0)] wire176;
  wire [(4'hb):(1'h0)] wire175;
  wire [(5'h12):(1'h0)] wire171;
  wire signed [(3'h4):(1'h0)] wire170;
  wire [(4'hc):(1'h0)] wire169;
  wire signed [(4'h8):(1'h0)] wire168;
  wire [(3'h5):(1'h0)] wire167;
  wire [(5'h12):(1'h0)] wire166;
  wire signed [(4'he):(1'h0)] wire153;
  wire [(3'h5):(1'h0)] wire152;
  wire [(4'ha):(1'h0)] wire151;
  wire [(5'h11):(1'h0)] wire147;
  wire signed [(4'he):(1'h0)] wire146;
  wire [(4'hd):(1'h0)] wire145;
  reg [(3'h6):(1'h0)] reg174 = (1'h0);
  reg signed [(4'he):(1'h0)] reg173 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg172 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg163 = (1'h0);
  reg [(5'h11):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg160 = (1'h0);
  reg [(5'h11):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg158 = (1'h0);
  reg [(3'h4):(1'h0)] reg157 = (1'h0);
  reg [(4'hd):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg155 = (1'h0);
  reg [(5'h15):(1'h0)] reg154 = (1'h0);
  reg [(4'hc):(1'h0)] reg150 = (1'h0);
  reg [(5'h13):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg148 = (1'h0);
  assign y = {wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire153,
                 wire152,
                 wire151,
                 wire147,
                 wire146,
                 wire145,
                 reg174,
                 reg173,
                 reg172,
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
                 reg150,
                 reg149,
                 reg148,
                 (1'h0)};
  assign wire145 = $signed(wire142);
  assign wire146 = wire145;
  assign wire147 = ((^~((~|(^wire140)) >>> (((8'ha3) ^~ wire145) ?
                       $unsigned(wire145) : wire143[(4'hb):(2'h3)]))) >> $signed($signed($unsigned((wire142 >= wire141)))));
  always
    @(posedge clk) begin
      reg148 <= ($unsigned(wire142) <= $signed(wire146));
      reg149 <= $unsigned((8'hbd));
      reg150 <= $unsigned(({(~|(+wire144)),
          $signed((wire140 ?
              wire142 : (8'ha2)))} >> $signed(((~|wire145) <= $unsigned(wire144)))));
    end
  assign wire151 = (({$unsigned((wire147 ? reg149 : wire145)),
                           $unsigned((^~wire142))} ~^ wire140) ?
                       $signed($signed(wire147[(4'he):(4'hd)])) : (8'hba));
  assign wire152 = (+wire143[(4'hb):(2'h2)]);
  assign wire153 = (wire144[(4'hd):(2'h2)] ?
                       ($signed(($signed(wire141) ^~ wire151[(3'h7):(2'h2)])) <<< $unsigned($unsigned(((7'h42) == wire151)))) : wire143[(4'he):(3'h4)]);
  always
    @(posedge clk) begin
      if (wire146)
        begin
          reg154 <= $unsigned(((|(+(+(8'hac)))) ? wire142 : wire151));
          if (((~reg150) ^ $unsigned(({{wire147}, $signed(wire151)} ?
              wire147[(2'h3):(1'h1)] : wire147[(4'h9):(4'h8)]))))
            begin
              reg155 <= (^~({(|{reg154})} ?
                  wire153[(4'ha):(4'h8)] : ($unsigned({reg154, wire144}) ?
                      wire140[(4'h8):(3'h4)] : wire151)));
              reg156 <= ((7'h40) ?
                  $signed(((^~$signed(reg148)) ~^ $signed(reg155[(4'hb):(2'h3)]))) : ((|wire152[(2'h3):(1'h1)]) << wire147));
              reg157 <= wire153[(4'h8):(3'h5)];
              reg158 <= $signed({($unsigned(wire140[(4'ha):(3'h4)]) >= wire151[(1'h1):(1'h1)]),
                  reg157[(3'h4):(2'h3)]});
            end
          else
            begin
              reg155 <= $signed($signed($unsigned(reg156)));
              reg156 <= $unsigned($unsigned((8'hb4)));
              reg157 <= {reg157};
              reg158 <= wire141[(4'hd):(4'hc)];
              reg159 <= wire142;
            end
          reg160 <= reg156[(1'h0):(1'h0)];
          reg161 <= $unsigned(wire142[(4'hb):(4'h8)]);
          if ((^((~^$unsigned($unsigned(reg149))) ^~ {(&(|(8'hbe))),
              {$signed((8'haa))}})))
            begin
              reg162 <= $signed(reg161[(3'h5):(2'h2)]);
              reg163 <= (8'h9c);
              reg164 <= reg162[(5'h10):(1'h1)];
            end
          else
            begin
              reg162 <= (wire141 ?
                  (|($signed((reg161 | wire144)) || (!$signed(reg162)))) : $unsigned((-wire152[(1'h0):(1'h0)])));
            end
        end
      else
        begin
          reg154 <= ((reg159 ^~ $signed(($signed(reg159) ?
                  $signed(wire142) : {wire142, (8'hb8)}))) ?
              (+$signed((^~reg163))) : (~(reg164 ?
                  ((wire143 ? wire146 : wire145) ?
                      {wire141, reg158} : {wire153,
                          wire144}) : $unsigned(reg148))));
          reg155 <= ($signed(((+reg162) > $unsigned((8'h9f)))) ?
              {(~|{$unsigned(reg162)})} : $signed($unsigned(reg164)));
        end
      reg165 <= reg160[(3'h7):(1'h0)];
    end
  assign wire166 = reg156[(3'h7):(2'h2)];
  assign wire167 = reg155;
  assign wire168 = wire147;
  assign wire169 = (!((wire167 ^~ reg156[(2'h3):(2'h2)]) ?
                       $unsigned($unsigned(wire146[(4'hb):(4'ha)])) : $unsigned(((~&reg164) ?
                           reg160 : (wire151 ? reg165 : (8'hb1))))));
  assign wire170 = ($unsigned(({wire144, wire145} ?
                       wire152[(2'h2):(1'h1)] : reg149[(5'h11):(4'h9)])) ^ (&(^$signed((wire169 <<< reg161)))));
  assign wire171 = wire140;
  always
    @(posedge clk) begin
      reg172 <= $unsigned(((~&$signed((|(8'hbd)))) || reg164[(4'hb):(3'h6)]));
      reg173 <= (&({wire168} == (+wire146)));
      reg174 <= wire166[(1'h1):(1'h1)];
    end
  assign wire175 = (((reg163 ?
                           ($unsigned(reg165) ?
                               $signed(reg160) : (~wire168)) : $unsigned(wire144[(4'hd):(3'h6)])) ~^ (reg150[(3'h4):(1'h1)] == ((wire141 & reg160) > {wire167,
                           wire140}))) ?
                       ($signed($signed($unsigned(reg157))) ?
                           wire151 : $unsigned(((reg159 ^ reg174) >>> $unsigned((8'ha6))))) : (wire166[(1'h1):(1'h0)] ?
                           $signed($signed((-reg157))) : ($unsigned((reg162 | wire142)) == ((wire142 ?
                                   reg157 : wire147) ?
                               {reg156, wire167} : wire169[(2'h2):(2'h2)]))));
  assign wire176 = {(&({$signed(reg150), (wire168 ? reg164 : (8'hb5))} ?
                           {$unsigned(wire170),
                               (wire167 ?
                                   reg158 : wire170)} : ($signed(wire167) << reg157))),
                       (reg157 ?
                           wire171 : ($unsigned((wire141 ? reg150 : reg160)) ?
                               (~(^~reg158)) : (reg148[(4'h9):(3'h6)] >> (wire152 ?
                                   wire152 : reg149))))};
  assign wire177 = (wire143 ?
                       (~|$unsigned(wire167)) : ((~reg157[(1'h1):(1'h0)]) ?
                           ($signed({wire175}) <<< $unsigned($unsigned(reg148))) : $unsigned((^wire144[(4'hf):(4'h9)]))));
  assign wire178 = (wire143 >= (reg155 ?
                       wire151 : $signed(((reg159 ?
                           reg157 : reg161) ^~ (wire151 == reg148)))));
  assign wire179 = (({$signed(wire171[(5'h10):(4'he)])} || (-$signed(wire141[(3'h5):(1'h1)]))) ?
                       (~^$signed((wire169[(4'hc):(1'h0)] ?
                           wire147 : (8'hb9)))) : $unsigned((($unsigned(reg162) ^ $signed((8'hb6))) <= $signed($unsigned(wire143)))));
  assign wire180 = ($unsigned(($unsigned((+reg165)) ?
                           {(~&wire141),
                               (~&wire179)} : $signed(reg158[(2'h2):(1'h0)]))) ?
                       (8'hab) : wire166);
endmodule

module module73  (y, clk, wire78, wire77, wire76, wire75, wire74);
  output wire [(32'h299):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire78;
  input wire [(4'he):(1'h0)] wire77;
  input wire signed [(4'he):(1'h0)] wire76;
  input wire signed [(2'h3):(1'h0)] wire75;
  input wire signed [(4'hb):(1'h0)] wire74;
  wire signed [(3'h4):(1'h0)] wire135;
  wire signed [(5'h11):(1'h0)] wire134;
  wire signed [(2'h2):(1'h0)] wire133;
  wire [(2'h2):(1'h0)] wire132;
  wire [(4'he):(1'h0)] wire131;
  wire signed [(5'h11):(1'h0)] wire123;
  wire signed [(4'hf):(1'h0)] wire122;
  wire signed [(4'h9):(1'h0)] wire117;
  wire signed [(4'hd):(1'h0)] wire116;
  wire [(4'hf):(1'h0)] wire111;
  wire signed [(4'h8):(1'h0)] wire110;
  wire [(2'h3):(1'h0)] wire92;
  wire [(4'h8):(1'h0)] wire91;
  wire [(4'hb):(1'h0)] wire90;
  wire [(4'hb):(1'h0)] wire89;
  wire signed [(5'h13):(1'h0)] wire88;
  wire signed [(4'hd):(1'h0)] wire87;
  reg [(3'h7):(1'h0)] reg130 = (1'h0);
  reg [(5'h12):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg127 = (1'h0);
  reg [(5'h15):(1'h0)] reg126 = (1'h0);
  reg [(2'h3):(1'h0)] reg125 = (1'h0);
  reg [(5'h15):(1'h0)] reg124 = (1'h0);
  reg signed [(4'he):(1'h0)] reg121 = (1'h0);
  reg [(5'h11):(1'h0)] reg120 = (1'h0);
  reg [(4'hd):(1'h0)] reg119 = (1'h0);
  reg [(3'h5):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg115 = (1'h0);
  reg [(4'hc):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg113 = (1'h0);
  reg [(5'h13):(1'h0)] reg112 = (1'h0);
  reg [(4'h8):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg108 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg107 = (1'h0);
  reg [(3'h7):(1'h0)] reg106 = (1'h0);
  reg [(4'h9):(1'h0)] reg105 = (1'h0);
  reg [(3'h7):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg101 = (1'h0);
  reg [(3'h4):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg99 = (1'h0);
  reg [(5'h13):(1'h0)] reg98 = (1'h0);
  reg [(3'h7):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg96 = (1'h0);
  reg [(4'hd):(1'h0)] reg95 = (1'h0);
  reg [(4'he):(1'h0)] reg94 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg86 = (1'h0);
  reg [(4'hf):(1'h0)] reg85 = (1'h0);
  reg [(3'h4):(1'h0)] reg84 = (1'h0);
  reg [(4'hb):(1'h0)] reg83 = (1'h0);
  reg [(4'h9):(1'h0)] reg82 = (1'h0);
  reg signed [(4'he):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg80 = (1'h0);
  reg [(4'hc):(1'h0)] reg79 = (1'h0);
  assign y = {wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire123,
                 wire122,
                 wire117,
                 wire116,
                 wire111,
                 wire110,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
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
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg79 <= ((^({$unsigned(wire78)} ? {$unsigned(wire74)} : {wire78})) ?
          wire74 : $unsigned($signed(wire75[(2'h3):(2'h3)])));
      if ((^wire77[(3'h7):(1'h0)]))
        begin
          reg80 <= $unsigned(wire76);
          reg81 <= ({({(reg80 ? wire75 : wire77),
                  $unsigned(wire75)} && $unsigned($unsigned(wire78)))} >= wire76);
        end
      else
        begin
          if ((&((reg81 != reg81) ?
              (8'ha7) : $unsigned((wire75 == $signed(reg81))))))
            begin
              reg80 <= $signed((8'ha7));
              reg81 <= wire74[(3'h5):(3'h4)];
            end
          else
            begin
              reg80 <= $signed($unsigned($unsigned(($signed(wire74) ?
                  $unsigned((8'ha6)) : (reg79 == wire78)))));
              reg81 <= $unsigned((wire77 ?
                  $signed(wire76) : (~^(^$signed(wire75)))));
              reg82 <= (wire76[(3'h5):(2'h2)] ?
                  (&$signed(((wire78 ?
                      wire78 : wire77) ^ (~^(8'haf))))) : ((-reg80[(4'he):(3'h7)]) ?
                      $signed($signed(wire75)) : ((&(|(8'hac))) ?
                          {((8'h9e) ? (7'h44) : wire78),
                              (^~wire76)} : wire75[(2'h3):(2'h2)])));
              reg83 <= (|{wire76[(3'h7):(3'h7)],
                  $signed(((wire77 ? wire78 : (7'h41)) ?
                      reg79 : (wire76 != wire75)))});
              reg84 <= (wire77[(3'h6):(3'h5)] & wire74);
            end
          reg85 <= reg81[(3'h5):(3'h4)];
          reg86 <= reg81[(4'h9):(3'h6)];
        end
    end
  assign wire87 = $unsigned((8'ha9));
  assign wire88 = ((8'hb9) ?
                      $unsigned((reg84 ?
                          reg81 : $signed((reg85 ?
                              wire74 : wire87)))) : (!({(reg81 || wire87)} ^~ $signed(wire87[(4'hc):(4'hc)]))));
  assign wire89 = ((&reg80[(4'ha):(1'h0)]) && reg82[(2'h3):(2'h2)]);
  assign wire90 = wire75[(2'h3):(1'h1)];
  assign wire91 = $unsigned(wire90[(4'ha):(3'h6)]);
  assign wire92 = wire74;
  always
    @(posedge clk) begin
      reg93 <= reg83[(1'h0):(1'h0)];
      if (((wire89 == reg81[(4'hc):(3'h7)]) * ((&$signed((|reg84))) ?
          wire92[(2'h3):(1'h1)] : (^reg83))))
        begin
          reg94 <= reg82[(1'h0):(1'h0)];
          reg95 <= reg94[(3'h6):(1'h0)];
          reg96 <= {(reg83[(3'h5):(1'h1)] ?
                  (reg82[(2'h3):(2'h3)] - (^(|wire74))) : (^~reg80[(5'h14):(2'h2)]))};
          reg97 <= (+$unsigned(reg83));
        end
      else
        begin
          reg94 <= reg84;
          reg95 <= (~|$unsigned({$signed((8'hb5))}));
        end
      reg98 <= reg79;
      if ((~&{$unsigned($unsigned(wire74[(3'h7):(2'h2)])),
          $unsigned($unsigned($unsigned(wire88)))}))
        begin
          reg99 <= {reg93[(2'h2):(1'h0)],
              (((~^{reg97}) ? reg95 : reg98[(1'h0):(1'h0)]) ?
                  {wire74[(4'ha):(3'h7)],
                      $signed(reg80[(2'h3):(1'h0)])} : $unsigned({$signed(wire74)}))};
        end
      else
        begin
          if (wire91)
            begin
              reg99 <= ($signed($signed(wire77[(1'h1):(1'h1)])) ?
                  {wire91} : $unsigned((wire74 ?
                      ((wire75 >= (8'hbd)) ?
                          wire78 : (^reg96)) : {$signed(wire90)})));
              reg100 <= {(&$unsigned(wire74[(3'h7):(1'h0)]))};
            end
          else
            begin
              reg99 <= $signed(reg93[(3'h6):(3'h6)]);
              reg100 <= $unsigned((~|(~^$unsigned(reg84))));
              reg101 <= $unsigned((^~(reg96[(3'h7):(2'h3)] ?
                  ((~&(8'hb6)) ~^ $signed(wire77)) : reg84[(1'h1):(1'h1)])));
            end
          if ({reg99[(5'h11):(4'hb)],
              ((!$signed(wire92)) ^ {$unsigned((reg84 + wire77))})})
            begin
              reg102 <= (+$signed((7'h40)));
              reg103 <= wire74[(1'h1):(1'h1)];
              reg104 <= reg83[(3'h4):(2'h2)];
              reg105 <= ({$signed({(reg86 ^~ (8'hba)),
                      reg82[(4'h8):(1'h1)]})} & wire77[(4'hd):(1'h1)]);
            end
          else
            begin
              reg102 <= $unsigned(((wire87[(2'h2):(1'h0)] && reg104[(1'h1):(1'h0)]) ^ $signed(reg79)));
              reg103 <= reg80[(4'h9):(3'h5)];
              reg104 <= (wire74 ?
                  (^$unsigned(reg79[(4'h8):(1'h1)])) : $unsigned((($signed(wire87) ?
                      $unsigned(reg102) : (reg104 ~^ (8'ha9))) + reg102[(4'he):(3'h5)])));
              reg105 <= reg105[(3'h6):(2'h3)];
              reg106 <= wire77[(4'h8):(2'h2)];
            end
          reg107 <= (!{$signed($signed({reg80, reg80})),
              wire87[(3'h6):(3'h5)]});
          reg108 <= (+reg81);
          reg109 <= $unsigned({((-(reg95 ?
                  reg96 : reg82)) <<< $unsigned($unsigned(wire91)))});
        end
    end
  assign wire110 = ($signed(($unsigned(((7'h40) ?
                       wire78 : (8'hbd))) <<< $signed((reg81 < reg86)))) | ($signed($signed((reg86 ?
                           reg105 : wire78))) ?
                       (8'hac) : $unsigned((8'h9f))));
  assign wire111 = $signed((~&{$signed((reg80 ? wire87 : reg108))}));
  always
    @(posedge clk) begin
      reg112 <= (~reg102[(3'h7):(3'h6)]);
      reg113 <= $unsigned(reg94[(3'h5):(3'h5)]);
      reg114 <= $unsigned($signed($signed(wire111)));
      reg115 <= (~|(!{(&reg93[(3'h4):(1'h0)]), reg93}));
    end
  assign wire116 = $unsigned($signed($signed(((^~wire89) + {reg81, wire111}))));
  assign wire117 = $unsigned(reg93[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg118 <= {$unsigned(wire91),
          (|{reg84[(3'h4):(2'h3)], $unsigned(wire78)})};
      reg119 <= (8'hbe);
      reg120 <= $signed($signed((&$signed(reg107))));
      reg121 <= ($signed(($signed((|reg113)) ?
              $unsigned($unsigned(wire87)) : reg107)) ?
          wire91 : (((wire91 ?
              $signed(reg81) : {wire87,
                  reg105}) > (~^(+wire92))) >>> (wire92[(2'h2):(2'h2)] << {reg85})));
    end
  assign wire122 = reg83;
  assign wire123 = (^reg82);
  always
    @(posedge clk) begin
      if ($unsigned(wire90[(4'h8):(1'h1)]))
        begin
          if (((wire116[(2'h3):(1'h0)] | $unsigned(((reg95 ?
              wire76 : wire74) | (|reg97)))) && ((~($unsigned(reg104) < (wire75 ^ wire89))) ^~ reg112)))
            begin
              reg124 <= $unsigned({reg97});
            end
          else
            begin
              reg124 <= ($unsigned(($signed($signed(reg103)) ?
                      wire87 : $signed($unsigned(reg113)))) ?
                  (&($signed((reg102 ? reg104 : reg93)) ?
                      (~(reg119 ? reg108 : reg109)) : (wire89[(3'h4):(2'h2)] ?
                          $unsigned(reg102) : (wire75 || reg120)))) : $signed($signed($unsigned((&reg114)))));
            end
        end
      else
        begin
          if ((8'hb7))
            begin
              reg124 <= $unsigned($signed(reg119[(4'h8):(3'h6)]));
              reg125 <= reg103[(2'h2):(1'h1)];
            end
          else
            begin
              reg124 <= (~|reg94[(4'hd):(3'h7)]);
            end
          if ((!(~^wire92[(1'h0):(1'h0)])))
            begin
              reg126 <= (reg82[(4'h8):(3'h6)] ? reg95[(3'h5):(2'h3)] : reg81);
            end
          else
            begin
              reg126 <= (8'haf);
              reg127 <= $signed(reg85);
            end
        end
      reg128 <= (~&((&$signed($unsigned(wire78))) >= ((~^(wire88 ?
              wire76 : reg106)) ?
          (wire87 ?
              (reg114 ? reg107 : (8'hb1)) : {(8'ha9),
                  reg82}) : $unsigned((reg120 ? reg114 : reg121)))));
      reg129 <= (reg83[(4'ha):(3'h6)] >> ($signed(((reg119 ?
              reg118 : reg79) ^ $signed(reg119))) ?
          reg112[(1'h0):(1'h0)] : (wire117 | $signed(((8'h9d) ?
              reg85 : (8'ha6))))));
      reg130 <= (($unsigned(reg102) >> $unsigned({$unsigned(reg80), reg128})) ?
          ($unsigned(wire122) ?
              $unsigned({(reg129 ? reg79 : reg82),
                  reg109[(3'h4):(3'h4)]}) : reg127) : ($unsigned((8'haf)) > (((wire116 ?
              reg99 : reg113) || (+wire75)) + ($unsigned((8'hba)) ~^ $signed(reg93)))));
    end
  assign wire131 = reg112[(4'hc):(1'h0)];
  assign wire132 = reg82;
  assign wire133 = wire88;
  assign wire134 = (((^~$unsigned(((8'ha5) ? wire122 : (8'hb1)))) ?
                           (((reg81 * wire90) ?
                               reg128 : (reg105 ?
                                   reg125 : reg81)) - reg109[(1'h0):(1'h0)]) : (~(+$unsigned(reg118)))) ?
                       (({((8'hb5) ? reg115 : wire91)} ?
                           (&$unsigned((8'hbf))) : reg99[(1'h0):(1'h0)]) && (~|(8'ha0))) : $signed((8'hb9)));
  assign wire135 = ((~^{((wire117 ?
                           wire110 : wire87) >= (^~reg100))}) == {($unsigned(wire87) ?
                           reg121[(4'hb):(1'h0)] : reg129),
                       ({(reg100 ? reg93 : reg113)} ?
                           reg81[(4'he):(3'h4)] : ((reg108 ?
                               reg102 : wire75) > (reg101 ? reg94 : wire88)))});
endmodule

module module27  (y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h196):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire31;
  input wire signed [(5'h15):(1'h0)] wire30;
  input wire [(5'h12):(1'h0)] wire29;
  input wire signed [(3'h5):(1'h0)] wire28;
  wire [(5'h10):(1'h0)] wire59;
  wire [(4'he):(1'h0)] wire58;
  wire [(4'h8):(1'h0)] wire57;
  wire signed [(3'h6):(1'h0)] wire50;
  reg signed [(3'h7):(1'h0)] reg70 = (1'h0);
  reg [(3'h5):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg [(4'h9):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg65 = (1'h0);
  reg signed [(4'he):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(2'h3):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg [(4'hf):(1'h0)] reg56 = (1'h0);
  reg [(5'h13):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg54 = (1'h0);
  reg [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg51 = (1'h0);
  reg [(5'h10):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg48 = (1'h0);
  reg [(5'h10):(1'h0)] reg47 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg41 = (1'h0);
  reg [(4'h9):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg39 = (1'h0);
  reg [(4'ha):(1'h0)] reg38 = (1'h0);
  reg [(4'hb):(1'h0)] reg37 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(4'ha):(1'h0)] reg32 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire50,
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
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
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
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg32 <= $unsigned({wire28[(2'h3):(2'h3)],
          $unsigned($signed(wire29[(4'hd):(3'h6)]))});
      reg33 <= reg32[(3'h4):(1'h1)];
      if ($unsigned($signed(((wire30[(4'h9):(3'h6)] < $signed((8'ha7))) ?
          ({wire31,
              reg33} && reg33[(3'h7):(2'h3)]) : (reg32 + $signed(wire31))))))
        begin
          reg34 <= reg33[(1'h0):(1'h0)];
          reg35 <= $signed(wire31);
          reg36 <= wire29[(4'hf):(4'ha)];
          if ($signed(wire31[(2'h2):(1'h1)]))
            begin
              reg37 <= $unsigned(({$unsigned($signed(wire28)),
                      (reg35[(4'h8):(2'h3)] ?
                          $signed(wire30) : (wire29 ? reg33 : wire29))} ?
                  (8'hbb) : ((wire28[(1'h0):(1'h0)] >> reg32) ?
                      (~^wire29) : $unsigned($unsigned((8'ha6))))));
              reg38 <= ({($unsigned((wire28 >= wire29)) + $signed((reg33 ?
                      wire29 : reg37)))} | wire31);
              reg39 <= reg33;
              reg40 <= $unsigned({$signed(reg33[(3'h4):(1'h0)])});
            end
          else
            begin
              reg37 <= reg40;
              reg38 <= ((($unsigned($unsigned(reg37)) ?
                          {reg34} : reg35[(4'hb):(3'h7)]) ?
                      {reg33[(3'h6):(1'h1)]} : (reg34 < (|(~wire29)))) ?
                  (&(($unsigned(reg34) ?
                      $unsigned(reg34) : wire29) ^~ reg35)) : ($unsigned((~|((8'hbc) ?
                          wire31 : (8'ha9)))) ?
                      {$signed($signed(reg40)), (~^reg33)} : (|$signed({reg36,
                          reg34}))));
            end
          reg41 <= $signed(reg37[(4'h9):(1'h0)]);
        end
      else
        begin
          reg34 <= $signed($signed(reg34));
          reg35 <= ($unsigned((reg38 ^ reg33[(1'h0):(1'h0)])) ?
              reg37[(3'h5):(3'h4)] : reg38);
          if ((|({wire31[(1'h1):(1'h0)]} + (+((reg37 && wire29) ?
              wire31 : (reg37 >> wire28))))))
            begin
              reg36 <= $signed(($signed($signed({reg38})) ?
                  (wire30[(4'hd):(1'h0)] && $unsigned($unsigned((8'hbb)))) : (~^$signed((wire29 ?
                      (8'had) : reg39)))));
              reg37 <= reg39;
              reg38 <= ($signed(({(reg41 >= (8'ha3)),
                      reg36[(4'ha):(4'h8)]} + $signed($signed(reg37)))) ?
                  (8'hb0) : ($unsigned({reg33}) ?
                      (~wire29) : wire31[(1'h0):(1'h0)]));
              reg39 <= ((~$signed(wire30)) >>> (!((&wire29) ?
                  ((!(8'ha7)) ?
                      reg39 : (reg41 ? reg39 : wire28)) : (~&wire28))));
              reg40 <= ((reg34 ?
                      wire31[(1'h0):(1'h0)] : (($unsigned(reg38) ?
                              $unsigned(reg41) : reg34[(2'h3):(2'h3)]) ?
                          $signed((^~reg40)) : $unsigned($signed(reg41)))) ?
                  $unsigned(reg33) : wire30);
            end
          else
            begin
              reg36 <= (~&(wire29 ?
                  reg34 : $unsigned($signed(reg32[(2'h3):(1'h0)]))));
            end
        end
      reg42 <= $signed((~(~^$unsigned((reg35 >>> reg39)))));
      if ($unsigned($unsigned($unsigned(((+(8'h9d)) ?
          (reg38 || reg36) : {reg39, reg40})))))
        begin
          reg43 <= reg36;
          reg44 <= $signed((8'hb6));
          reg45 <= reg44;
          if ((((~^$signed($unsigned(wire31))) ?
              (reg34 ^ $unsigned(reg37)) : ((8'hb4) ?
                  $signed((reg45 ^~ reg39)) : $signed((~&wire28)))) << ($unsigned($unsigned({reg38,
                  reg42})) ?
              {reg33} : $signed($unsigned((-reg40))))))
            begin
              reg46 <= reg38[(4'ha):(4'h8)];
              reg47 <= (^reg38);
              reg48 <= $signed({$signed(reg44), $unsigned(wire31)});
              reg49 <= (~(((wire28 ?
                  (-wire28) : ((7'h44) != wire30)) && $unsigned($signed(reg43))) ~^ {$signed({wire29})}));
            end
          else
            begin
              reg46 <= reg35;
              reg47 <= reg43;
            end
        end
      else
        begin
          reg43 <= wire31;
          reg44 <= wire30[(4'he):(2'h3)];
          reg45 <= (((-reg45[(1'h1):(1'h1)]) * $signed(wire30[(5'h10):(2'h2)])) ?
              (|{$signed((-reg33))}) : $unsigned($signed(($signed(reg48) ?
                  (~wire29) : reg44[(3'h5):(2'h2)]))));
          reg46 <= (reg44 ?
              $unsigned($unsigned(((reg47 ? reg48 : reg38) ?
                  $unsigned(reg48) : $unsigned(wire28)))) : ($unsigned(reg37[(3'h4):(2'h3)]) ?
                  reg41[(3'h5):(2'h3)] : ($unsigned(((8'hb8) ?
                          reg44 : (8'hbd))) ?
                      ({(8'hb2)} ?
                          (reg48 ? wire30 : reg39) : (~^wire31)) : ((+reg35) ?
                          (reg47 ? reg32 : (8'hb7)) : {reg36}))));
        end
    end
  assign wire50 = $unsigned($signed(((~|(+reg47)) * ((8'hb6) && {wire28}))));
  always
    @(posedge clk) begin
      if (((&(!(8'hb7))) ^ (~{{reg45[(2'h2):(1'h1)]}})))
        begin
          reg51 <= $unsigned((reg39 >= (!reg40)));
          if ($signed($unsigned((^($unsigned(reg35) * reg37)))))
            begin
              reg52 <= {reg45[(3'h4):(1'h1)], $unsigned($unsigned(wire50))};
            end
          else
            begin
              reg52 <= $unsigned(($signed((((8'hb7) ? wire30 : reg52) & {reg41,
                      reg32})) ?
                  (reg49[(2'h3):(1'h1)] > (~&(+reg33))) : reg41));
              reg53 <= ($signed($signed((~^(reg45 ?
                  wire30 : wire30)))) >= {reg48[(3'h6):(3'h6)]});
            end
          if (reg47)
            begin
              reg54 <= (reg44 ?
                  ($unsigned(($signed((8'hb3)) ?
                      $signed(reg49) : reg36[(1'h1):(1'h0)])) <= reg39[(1'h1):(1'h1)]) : reg33[(3'h6):(1'h1)]);
              reg55 <= {reg54};
            end
          else
            begin
              reg54 <= ($unsigned($signed(((&reg34) >= reg54))) ?
                  ((8'hbd) ^~ (($signed(reg41) ?
                          (reg34 ? (8'h9c) : reg54) : {reg36, reg47}) ?
                      reg55 : $signed($signed(reg41)))) : (~&(((-reg43) >> reg45) ?
                      reg37[(2'h2):(1'h1)] : $signed((reg39 >> reg35)))));
              reg55 <= reg38[(2'h3):(1'h1)];
            end
          reg56 <= (reg37 ?
              $signed(reg34[(3'h7):(2'h3)]) : $unsigned(reg52[(2'h3):(1'h0)]));
        end
      else
        begin
          reg51 <= {$signed(((&reg40[(1'h0):(1'h0)]) - (+(+reg41)))), reg45};
        end
    end
  assign wire57 = (~|$unsigned(reg44[(3'h6):(2'h3)]));
  assign wire58 = wire29[(1'h0):(1'h0)];
  assign wire59 = reg43[(4'h8):(1'h0)];
  always
    @(posedge clk) begin
      reg60 <= ((-({reg41,
              ((8'hbf) ? (7'h44) : reg43)} ^ $signed((wire59 | (8'hbd))))) ?
          ($unsigned($signed(wire30)) ?
              reg48[(4'hb):(2'h3)] : $signed($unsigned($signed(reg34)))) : reg41);
      reg61 <= (8'hac);
      if ($signed((((8'hb8) || $signed(reg56)) ?
          $signed((reg41 ?
              $signed(reg40) : wire50[(1'h0):(1'h0)])) : $unsigned(reg36))))
        begin
          reg62 <= $signed($signed({$unsigned(reg40), (-$unsigned((8'ha6)))}));
          reg63 <= $signed((-(wire30 ?
              (~|(!reg53)) : {(reg54 ? reg62 : reg41)})));
          reg64 <= (8'hb9);
          reg65 <= $unsigned($unsigned($unsigned(($signed(reg64) << $signed(reg56)))));
          if (reg37[(4'h8):(3'h5)])
            begin
              reg66 <= (8'hb5);
              reg67 <= (((8'ha8) ?
                  ($signed({reg64, (8'hba)}) ?
                      (~&(reg48 ^ reg60)) : (((8'hb7) ? wire29 : reg55) ?
                          (wire29 ?
                              reg52 : reg37) : $signed(reg36))) : (($signed(wire58) ~^ reg40[(1'h0):(1'h0)]) - (~^(wire30 ?
                      (8'hb6) : reg37)))) >= $signed(($signed((^~reg45)) ^~ (&reg47[(4'h8):(3'h6)]))));
            end
          else
            begin
              reg66 <= (8'hb4);
              reg67 <= {$signed(reg67)};
              reg68 <= reg38[(4'h9):(1'h1)];
              reg69 <= (8'hb4);
              reg70 <= reg53[(2'h2):(1'h0)];
            end
        end
      else
        begin
          reg62 <= {{(&$signed((reg61 ? reg54 : (8'h9e))))},
              {(^((wire29 ~^ reg52) ? $signed(reg54) : wire57)),
                  $signed((8'hbd))}};
          reg63 <= (+reg42[(1'h0):(1'h0)]);
          reg64 <= (reg52[(2'h3):(1'h1)] <<< (-$signed(({(8'ha7),
              reg60} == $signed(reg65)))));
          reg65 <= reg32;
        end
    end
endmodule
