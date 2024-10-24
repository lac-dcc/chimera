module top
#(parameter param249 = (~|((({(8'hac), (8'hb6)} | ((8'h9d) || (8'hbb))) >= ((~(8'ha3)) && ((8'haf) - (8'ha0)))) ? {(!((8'ha8) ? (8'hb1) : (8'ha8))), (((8'ha0) * (8'hb6)) ? {(7'h41), (8'hbf)} : ((8'ha0) != (8'hb0)))} : {(((8'ha2) >>> (8'hb2)) < (^(8'hb8)))})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h15e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire236;
  wire [(5'h11):(1'h0)] wire235;
  wire [(4'h9):(1'h0)] wire190;
  wire signed [(5'h15):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire233;
  reg signed [(4'h8):(1'h0)] reg248 = (1'h0);
  reg [(3'h6):(1'h0)] reg247 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg246 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg245 = (1'h0);
  reg [(4'hf):(1'h0)] reg244 = (1'h0);
  reg [(2'h2):(1'h0)] reg243 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg242 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg241 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg240 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg239 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg238 = (1'h0);
  reg [(4'h9):(1'h0)] reg237 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg5 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  assign y = {wire236,
                 wire235,
                 wire190,
                 wire18,
                 wire17,
                 wire233,
                 reg248,
                 reg247,
                 reg246,
                 reg245,
                 reg244,
                 reg243,
                 reg242,
                 reg241,
                 reg240,
                 reg239,
                 reg238,
                 reg237,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (8'ha4);
      reg6 <= wire3;
      if (((((|(wire0 & wire1)) * $signed(wire2)) ?
          ((wire0 != {wire3}) ?
              (!(+wire1)) : ((wire0 >> wire2) && wire3)) : reg6[(4'hc):(3'h4)]) < (~(^reg6[(2'h2):(1'h0)]))))
        begin
          reg7 <= $unsigned($signed(wire0[(3'h7):(1'h0)]));
        end
      else
        begin
          reg7 <= $signed({{wire0}, $unsigned(wire0[(1'h0):(1'h0)])});
          if (((7'h40) ?
              ($signed(($signed((8'hb9)) ? wire1 : reg5)) ?
                  wire4[(3'h7):(3'h5)] : (($signed(wire3) ?
                      wire0[(3'h5):(3'h4)] : ((8'ha7) ^ reg6)) != (~|(reg6 * reg6)))) : reg7[(4'hc):(4'h8)]))
            begin
              reg8 <= ($signed($unsigned(wire1[(1'h0):(1'h0)])) ?
                  ($unsigned(wire0) ?
                      ({(~|(8'hbe))} >= {wire2[(1'h0):(1'h0)],
                          (wire3 ?
                              reg5 : wire0)}) : $signed(((wire0 <<< reg7) & (reg5 ?
                          reg6 : reg5)))) : (wire2[(1'h1):(1'h0)] >>> $signed($unsigned(((8'ha6) + wire4)))));
              reg9 <= wire4[(3'h5):(1'h0)];
              reg10 <= (~|(-wire3));
              reg11 <= wire4;
              reg12 <= (((-($unsigned(wire2) ?
                          $unsigned(wire1) : reg10[(3'h4):(2'h2)])) ?
                      $unsigned($unsigned(reg9)) : (8'ha9)) ?
                  ({((wire2 ? wire3 : (8'hbd)) <<< reg6),
                      ($unsigned(reg9) ~^ wire4[(1'h0):(1'h0)])} ~^ $unsigned(($unsigned(reg8) ?
                      (-reg9) : (~^(8'ha0))))) : $signed($unsigned(((!(8'hb6)) ?
                      wire1 : (8'hb2)))));
            end
          else
            begin
              reg8 <= (wire0 ?
                  (^~(($unsigned(reg7) ?
                      $signed(wire0) : ((8'ha3) << reg9)) - reg12)) : ((~^(+$signed(reg8))) ?
                      $unsigned(reg7) : $signed((~^(reg7 ? reg7 : wire0)))));
              reg9 <= reg9;
              reg10 <= ($signed((-(+reg11[(2'h2):(1'h1)]))) ?
                  (($unsigned(reg7) ?
                          $signed((reg6 ? wire1 : reg5)) : ((reg9 > reg8) ?
                              $unsigned(reg6) : wire4)) ?
                      reg12 : reg9) : reg5[(4'h8):(3'h7)]);
            end
          if (wire4)
            begin
              reg13 <= reg5[(4'h9):(3'h6)];
            end
          else
            begin
              reg13 <= reg11[(1'h1):(1'h1)];
              reg14 <= $signed(reg9[(1'h1):(1'h0)]);
              reg15 <= wire2;
            end
          reg16 <= ($signed(reg7) ?
              $signed({{$unsigned(reg14), (reg9 + reg15)},
                  (-wire2[(3'h4):(3'h4)])}) : $unsigned(wire4));
        end
    end
  assign wire17 = $unsigned((($unsigned((reg5 <= reg15)) << $unsigned(reg5[(2'h3):(2'h2)])) ?
                      reg10[(3'h4):(1'h1)] : $signed(wire2)));
  assign wire18 = reg8;
  module19 #() modinst191 (wire190, clk, wire3, wire2, reg16, wire18);
  module192 #() modinst234 (.wire195(reg5), .wire193(wire0), .clk(clk), .wire196(wire17), .y(wire233), .wire197(wire1), .wire194(reg14));
  assign wire235 = reg12[(4'hf):(3'h7)];
  assign wire236 = {(!(8'hac)), $signed(wire1)};
  always
    @(posedge clk) begin
      if (((~{$signed($unsigned(reg6)),
          $signed($signed(wire190))}) <= $signed((+$signed($signed(reg5))))))
        begin
          reg237 <= wire236;
          if ($signed(((8'hbf) <= ((+wire233[(4'ha):(4'h8)]) ?
              $unsigned((&reg12)) : $signed(reg14)))))
            begin
              reg238 <= $unsigned(((+(+(~&wire3))) | (-$signed((!wire2)))));
              reg239 <= ({wire0[(3'h5):(3'h5)],
                  reg12[(4'h8):(2'h2)]} == $signed(reg14));
              reg240 <= $signed(((+(+(!reg7))) + (~|((8'hb2) * (~wire236)))));
              reg241 <= ($unsigned((^~(8'ha5))) <<< (8'ha5));
            end
          else
            begin
              reg238 <= ($unsigned(wire233[(2'h2):(1'h1)]) ?
                  reg238 : $unsigned($signed((reg7 * (~wire1)))));
              reg239 <= ((wire3 | wire235[(4'hd):(4'h9)]) ?
                  ($unsigned({wire17, wire2[(2'h2):(2'h2)]}) ?
                      reg15[(3'h4):(1'h1)] : {((reg10 ?
                              wire18 : (8'hb0)) | reg9[(4'hd):(1'h1)])}) : {(+$unsigned((reg13 ?
                          (8'had) : wire17)))});
              reg240 <= reg240;
              reg241 <= ($unsigned((|reg13)) <<< $signed({$unsigned((reg14 <= (8'ha4)))}));
            end
          if (({$unsigned(((reg9 ? reg9 : (8'ha1)) ?
                  {reg5, wire17} : wire4[(2'h3):(2'h3)])),
              $unsigned($signed((wire4 != reg15)))} == {(+$unsigned((reg15 >> reg5)))}))
            begin
              reg242 <= ({$unsigned({$unsigned(reg12)})} >> $unsigned(wire2[(1'h1):(1'h0)]));
              reg243 <= $unsigned((8'hb4));
              reg244 <= $unsigned(wire18[(4'h9):(1'h1)]);
            end
          else
            begin
              reg242 <= $signed(reg15[(2'h3):(1'h1)]);
              reg243 <= (~^(&(8'h9d)));
              reg244 <= reg5;
              reg245 <= (-(wire1 && ($unsigned((wire190 ?
                  wire190 : reg5)) << reg7[(4'hf):(4'h8)])));
              reg246 <= ((((wire235[(4'hb):(3'h6)] | (wire17 ?
                          reg239 : reg8)) ^~ (-reg16)) ?
                      ({wire233[(3'h6):(1'h0)]} ?
                          $signed({wire1}) : (|(~^reg15))) : reg242[(1'h1):(1'h1)]) ?
                  $unsigned(wire3) : ((((~^reg6) != reg245[(3'h6):(3'h5)]) ?
                      reg239 : wire235[(3'h4):(2'h3)]) ^ (wire2[(3'h7):(2'h3)] ?
                      reg243[(1'h0):(1'h0)] : wire4[(1'h0):(1'h0)])));
            end
          reg247 <= $signed(({(reg245[(1'h1):(1'h1)] > wire235[(4'hd):(3'h4)]),
              {$signed(reg245), $signed((8'hba))}} >>> ($unsigned(reg8) ?
              reg241[(3'h6):(1'h1)] : {(~^reg242)})));
        end
      else
        begin
          reg237 <= reg5;
          reg238 <= ($unsigned(reg8) == (reg245 ?
              (|(+$signed(reg15))) : {(+wire4[(3'h7):(2'h3)]),
                  $signed((wire3 ? wire18 : reg14))}));
          if ((wire233 ?
              $signed($signed((~&(^~reg243)))) : ($signed($signed((~^reg15))) != $signed(wire18[(4'h9):(1'h1)]))))
            begin
              reg239 <= (reg12 ?
                  $signed((^~(reg15 ?
                      wire0[(4'ha):(4'h8)] : (8'ha3)))) : $signed($signed(reg241)));
            end
          else
            begin
              reg239 <= ((reg14 + $unsigned($signed((wire17 ?
                      reg244 : reg11)))) ?
                  $unsigned($unsigned(((reg242 ? reg238 : reg245) ?
                      (reg5 < wire3) : (~|(7'h40))))) : (reg5[(2'h2):(2'h2)] ?
                      $unsigned(wire233) : (~|$signed(((8'hbd) ?
                          wire233 : reg12)))));
            end
        end
      reg248 <= {$signed(reg5[(3'h6):(1'h1)]),
          (wire17[(4'h9):(2'h2)] ? wire18[(3'h7):(3'h5)] : reg16)};
    end
endmodule

module module192  (y, clk, wire197, wire196, wire195, wire194, wire193);
  output wire [(32'h1ba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire197;
  input wire signed [(3'h6):(1'h0)] wire196;
  input wire signed [(2'h3):(1'h0)] wire195;
  input wire [(2'h2):(1'h0)] wire194;
  input wire [(5'h11):(1'h0)] wire193;
  wire [(5'h15):(1'h0)] wire232;
  wire signed [(4'h8):(1'h0)] wire200;
  wire [(5'h15):(1'h0)] wire199;
  wire signed [(3'h5):(1'h0)] wire198;
  reg signed [(4'he):(1'h0)] reg231 = (1'h0);
  reg [(5'h13):(1'h0)] reg230 = (1'h0);
  reg [(2'h2):(1'h0)] reg229 = (1'h0);
  reg [(4'hd):(1'h0)] reg228 = (1'h0);
  reg [(5'h14):(1'h0)] reg227 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg226 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg225 = (1'h0);
  reg signed [(4'he):(1'h0)] reg224 = (1'h0);
  reg [(5'h14):(1'h0)] reg223 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg222 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg221 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg220 = (1'h0);
  reg [(5'h13):(1'h0)] reg219 = (1'h0);
  reg [(2'h3):(1'h0)] reg218 = (1'h0);
  reg [(4'hc):(1'h0)] reg217 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg216 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg215 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg214 = (1'h0);
  reg [(5'h14):(1'h0)] reg213 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg212 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg211 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg210 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg209 = (1'h0);
  reg [(4'h8):(1'h0)] reg208 = (1'h0);
  reg [(2'h3):(1'h0)] reg207 = (1'h0);
  reg [(4'h8):(1'h0)] reg206 = (1'h0);
  reg [(5'h12):(1'h0)] reg205 = (1'h0);
  reg [(4'ha):(1'h0)] reg204 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg203 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg202 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg201 = (1'h0);
  assign y = {wire232,
                 wire200,
                 wire199,
                 wire198,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
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
                 reg203,
                 reg202,
                 reg201,
                 (1'h0)};
  assign wire198 = ((8'hb2) ^~ ($signed($signed((^~wire194))) ?
                       wire196 : (($unsigned(wire195) >> (wire195 ?
                           (8'had) : wire193)) >= {wire193[(3'h7):(3'h6)],
                           wire193[(2'h2):(2'h2)]})));
  assign wire199 = {wire195[(2'h2):(2'h2)]};
  assign wire200 = ((&$signed((-$signed(wire195)))) ?
                       wire196 : $signed((7'h42)));
  always
    @(posedge clk) begin
      if ((($signed($signed((wire200 ?
          wire199 : wire197))) >= wire198) >>> (wire198 ?
          $signed((!{wire199, wire196})) : (wire197 ?
              (~wire193[(1'h1):(1'h1)]) : $unsigned($unsigned(wire196))))))
        begin
          reg201 <= (wire197 ?
              (|$signed($signed((wire196 || (8'haf))))) : wire199);
          reg202 <= (~&$unsigned((~&$signed($unsigned(reg201)))));
        end
      else
        begin
          reg201 <= wire195[(1'h0):(1'h0)];
          reg202 <= ($unsigned($signed({(wire197 ? wire200 : (8'ha5))})) ?
              wire193 : wire193[(4'h8):(1'h0)]);
        end
      reg203 <= {wire198[(1'h0):(1'h0)]};
      if (reg202[(2'h3):(2'h2)])
        begin
          if ($unsigned((&$signed(($signed(reg203) ^ ((8'h9d) < wire199))))))
            begin
              reg204 <= ((|(reg203[(2'h3):(1'h1)] ?
                      ((wire198 > wire196) + (&(8'haf))) : (!$unsigned(wire200)))) ?
                  wire195[(1'h0):(1'h0)] : (((~&(+reg202)) ?
                          wire195 : {$signed((8'hb3))}) ?
                      (^(^wire193[(3'h6):(2'h2)])) : ({(reg201 - reg201)} ?
                          wire198 : wire198[(1'h0):(1'h0)])));
              reg205 <= {(wire200[(3'h5):(2'h2)] ^~ wire194[(1'h0):(1'h0)]),
                  wire194};
              reg206 <= $signed($signed((reg204[(3'h4):(1'h1)] + reg202)));
              reg207 <= {$unsigned((~|wire200)), wire200};
            end
          else
            begin
              reg204 <= (wire200 * $signed({reg201[(4'hf):(4'ha)],
                  ($unsigned((8'hb5)) + (wire194 ? reg201 : wire195))}));
              reg205 <= wire197[(4'hd):(4'ha)];
              reg206 <= $signed((wire198[(3'h4):(3'h4)] >>> $unsigned(($signed(wire200) & (wire198 ?
                  wire193 : reg202)))));
              reg207 <= reg202[(2'h3):(2'h2)];
              reg208 <= wire194[(2'h2):(1'h0)];
            end
          reg209 <= ((reg206 ?
                  reg203[(4'h8):(3'h6)] : (wire196 ?
                      ((reg202 ? reg204 : reg203) ?
                          (reg201 - wire199) : wire193) : ($unsigned(reg208) ?
                          wire200 : (wire194 ~^ wire197)))) ?
              ((wire196[(3'h6):(1'h0)] ~^ {wire195,
                  $unsigned(reg207)}) ^~ (((~reg201) ?
                  (reg204 & reg207) : (^(8'ha5))) >>> $unsigned((reg204 >>> reg204)))) : reg205);
          reg210 <= {wire197[(4'hb):(4'ha)], reg207};
          reg211 <= wire199;
          reg212 <= wire198[(1'h0):(1'h0)];
        end
      else
        begin
          if ({($signed((wire197 && {reg204})) ?
                  wire198 : $signed($unsigned({reg212, reg212}))),
              (!reg203)})
            begin
              reg204 <= reg211[(2'h2):(2'h2)];
            end
          else
            begin
              reg204 <= ((&($unsigned((^~wire196)) ?
                      reg212 : ((wire200 ?
                          reg206 : wire198) > $unsigned(reg210)))) ?
                  $signed(((&(reg202 + reg202)) && $unsigned($signed(wire199)))) : (~|$unsigned(((wire195 ?
                          (7'h44) : reg212) ?
                      (reg210 && wire193) : (~^reg202)))));
              reg205 <= (|wire198[(3'h4):(3'h4)]);
            end
          reg206 <= wire197;
          if (({$signed($signed(reg212[(4'he):(3'h6)]))} >>> $unsigned($unsigned((7'h42)))))
            begin
              reg207 <= reg203;
              reg208 <= {(~^$unsigned(reg212))};
            end
          else
            begin
              reg207 <= ({wire193,
                  ((!reg204) ?
                      wire193 : ($unsigned(reg212) ~^ (-wire196)))} < (~wire195[(1'h1):(1'h1)]));
            end
          reg209 <= (((+{reg204, {reg210}}) || ($unsigned((+wire194)) ?
              $signed((&wire194)) : {reg203[(3'h5):(3'h4)]})) ~^ $signed($unsigned({$signed(wire194),
              (reg203 < reg202)})));
        end
      reg213 <= (^wire193[(3'h6):(3'h6)]);
      reg214 <= $signed((reg208[(1'h0):(1'h0)] ?
          {$unsigned($signed((8'hb5))),
              ($unsigned((8'ha2)) ? (~^reg205) : {(8'hbe), reg203})} : reg207));
    end
  always
    @(posedge clk) begin
      reg215 <= wire199;
      reg216 <= wire195[(2'h3):(2'h3)];
      if (wire193[(4'ha):(3'h6)])
        begin
          if (reg212[(2'h2):(2'h2)])
            begin
              reg217 <= (8'hb8);
              reg218 <= ((((reg204[(4'h8):(4'h8)] ?
                          {reg203} : $unsigned(wire194)) != (8'hb8)) ?
                      $unsigned((reg214[(5'h10):(4'he)] | ((7'h44) ?
                          reg217 : reg214))) : $unsigned($signed((^reg207)))) ?
                  wire194[(1'h1):(1'h0)] : {$unsigned((reg207 - (reg212 && reg206)))});
              reg219 <= {(~&(~{$signed(reg217), (reg207 ? (8'h9e) : reg202)}))};
              reg220 <= (((((^reg209) ~^ (reg216 ? (8'h9c) : reg215)) ?
                      ((reg219 ?
                          reg206 : reg210) ^~ $signed(wire193)) : (-(^~reg208))) << {(reg208 ?
                          (~^reg217) : $unsigned((8'h9e))),
                      $unsigned($signed(reg212))}) ?
                  (!(reg210 ?
                      $unsigned($unsigned(reg208)) : reg206)) : {reg207});
              reg221 <= {(!{$signed($unsigned(reg202))}),
                  (($signed((^~wire199)) <<< reg202[(4'hb):(3'h4)]) * $signed((reg217[(4'h8):(1'h0)] ?
                      (reg205 + (8'ha5)) : (|reg214))))};
            end
          else
            begin
              reg217 <= reg215[(3'h7):(3'h4)];
              reg218 <= $signed($unsigned((((reg205 ? wire194 : reg219) ?
                      wire193 : (wire199 == reg219)) ?
                  {$signed(reg210), reg216} : (((8'hb8) > reg214) == {reg218,
                      reg215}))));
              reg219 <= ((^(^(7'h41))) & ((&$unsigned(reg203)) <= (($signed(reg206) == $unsigned(wire199)) ?
                  ((|wire198) ?
                      (reg219 ?
                          (8'hab) : reg221) : (~&reg203)) : $signed(wire199[(2'h2):(2'h2)]))));
              reg220 <= $unsigned(wire199[(1'h0):(1'h0)]);
              reg221 <= (~&{(!reg211[(2'h2):(2'h2)])});
            end
          reg222 <= $signed($signed(wire197));
          reg223 <= $signed((~&({(reg206 >= wire196), $unsigned(reg218)} ?
              $signed(reg201) : reg215[(3'h5):(3'h4)])));
          if (reg219[(4'hb):(3'h5)])
            begin
              reg224 <= $signed(((!((^~reg207) || reg223[(4'hd):(4'ha)])) ?
                  ((reg211[(1'h1):(1'h0)] ?
                      (reg204 >> (7'h44)) : (reg206 ?
                          reg220 : reg223)) & ((-reg222) < $signed(reg219))) : (wire196[(3'h4):(1'h1)] >> (-{reg212}))));
              reg225 <= (reg213[(2'h3):(2'h2)] && (~|((~reg207) ?
                  $signed((reg205 ? (8'ha1) : wire200)) : $unsigned((reg223 ?
                      wire194 : (8'haf))))));
            end
          else
            begin
              reg224 <= reg215[(3'h4):(2'h3)];
              reg225 <= wire195;
              reg226 <= reg206;
              reg227 <= reg212;
              reg228 <= ($signed(reg221[(1'h1):(1'h0)]) ?
                  wire199[(4'hf):(2'h3)] : $signed($signed($unsigned((~^(7'h41))))));
            end
          reg229 <= $signed(((|$signed(reg201[(3'h5):(2'h2)])) | (reg210[(4'hb):(4'hb)] == reg210)));
        end
      else
        begin
          if (($unsigned(wire197[(1'h0):(1'h0)]) | reg228[(4'hb):(1'h1)]))
            begin
              reg217 <= $unsigned($unsigned(reg205));
              reg218 <= (+(~^({reg220} || reg214[(3'h7):(3'h4)])));
            end
          else
            begin
              reg217 <= reg203;
              reg218 <= reg211;
            end
        end
      reg230 <= reg224;
      reg231 <= (~&reg221);
    end
  assign wire232 = reg229[(2'h2):(2'h2)];
endmodule

module module19
#(parameter param189 = ((~(({(8'hb5), (7'h42)} >>> (8'ha4)) <<< ({(8'hb9)} <= ((8'hae) ? (8'h9f) : (8'ha3))))) >>> {(^~(8'ha3)), ({((8'h9f) ? (8'hae) : (8'haf))} <= (&((8'hb3) ? (8'hb9) : (8'haa))))}))
(y, clk, wire20, wire21, wire22, wire23);
  output wire [(32'h272):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire20;
  input wire signed [(5'h14):(1'h0)] wire21;
  input wire [(4'hf):(1'h0)] wire22;
  input wire signed [(5'h15):(1'h0)] wire23;
  wire [(5'h10):(1'h0)] wire24;
  wire [(5'h11):(1'h0)] wire25;
  wire [(4'he):(1'h0)] wire26;
  wire [(4'hc):(1'h0)] wire27;
  wire [(4'hb):(1'h0)] wire71;
  wire [(4'he):(1'h0)] wire75;
  wire signed [(4'hc):(1'h0)] wire128;
  wire signed [(5'h11):(1'h0)] wire130;
  wire signed [(4'hc):(1'h0)] wire155;
  wire [(4'hf):(1'h0)] wire156;
  wire signed [(5'h15):(1'h0)] wire162;
  wire signed [(2'h2):(1'h0)] wire163;
  wire [(3'h5):(1'h0)] wire164;
  wire signed [(4'h9):(1'h0)] wire187;
  reg [(5'h15):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg76 = (1'h0);
  reg [(5'h10):(1'h0)] reg77 = (1'h0);
  reg [(3'h4):(1'h0)] reg78 = (1'h0);
  reg signed [(4'he):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg133 = (1'h0);
  reg [(5'h10):(1'h0)] reg134 = (1'h0);
  reg [(5'h15):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg136 = (1'h0);
  reg [(3'h5):(1'h0)] reg137 = (1'h0);
  reg [(3'h5):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg139 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg140 = (1'h0);
  reg [(5'h11):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg142 = (1'h0);
  reg [(2'h3):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg147 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg148 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg151 = (1'h0);
  reg [(4'ha):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg154 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg157 = (1'h0);
  reg [(4'hf):(1'h0)] reg158 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg159 = (1'h0);
  reg [(4'ha):(1'h0)] reg160 = (1'h0);
  reg [(4'hd):(1'h0)] reg161 = (1'h0);
  assign y = {wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire71,
                 wire75,
                 wire128,
                 wire130,
                 wire155,
                 wire156,
                 wire162,
                 wire163,
                 wire164,
                 wire187,
                 reg73,
                 reg74,
                 reg76,
                 reg77,
                 reg78,
                 reg131,
                 reg132,
                 reg133,
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
                 reg144,
                 reg145,
                 reg146,
                 reg147,
                 reg148,
                 reg149,
                 reg150,
                 reg151,
                 reg152,
                 reg153,
                 reg154,
                 reg157,
                 reg158,
                 reg159,
                 reg160,
                 reg161,
                 (1'h0)};
  assign wire24 = wire22[(4'h8):(2'h2)];
  assign wire25 = wire22;
  assign wire26 = wire23;
  assign wire27 = wire22;
  module28 #() modinst72 (wire71, clk, wire26, wire25, wire22, wire27);
  always
    @(posedge clk) begin
      reg73 <= {(wire24[(1'h0):(1'h0)] ?
              wire22 : ((8'ha2) ?
                  $unsigned((wire71 < wire71)) : $signed((~^wire20))))};
      reg74 <= {(wire25 ?
              (wire21[(4'h8):(2'h2)] ?
                  wire24 : (wire20[(1'h0):(1'h0)] * wire25)) : (wire25 ?
                  $signed((~|(7'h44))) : wire22[(2'h2):(2'h2)]))};
    end
  assign wire75 = reg73;
  always
    @(posedge clk) begin
      reg76 <= $unsigned((&(reg74 ?
          $unsigned((^~wire75)) : wire24[(4'he):(1'h1)])));
      reg77 <= $unsigned({($signed((wire25 ?
              reg73 : wire27)) > $unsigned(((8'hb9) ^ wire20))),
          reg73[(5'h14):(3'h7)]});
      reg78 <= (($signed(($signed(wire24) >>> $signed(wire21))) & wire22[(3'h4):(1'h1)]) ~^ ($unsigned($signed((^wire71))) & ((~|wire24) ?
          ((8'ha9) ?
              $unsigned((8'hbd)) : (wire75 >= wire75)) : $unsigned((!wire21)))));
    end
  module79 #() modinst129 (wire128, clk, reg77, wire75, reg76, wire20);
  assign wire130 = ({wire23} & $unsigned($unsigned(wire24)));
  always
    @(posedge clk) begin
      reg131 <= $signed($signed(wire130[(3'h6):(3'h5)]));
      if ((~&(!((&(|wire21)) == reg78[(1'h1):(1'h0)]))))
        begin
          reg132 <= wire21;
          reg133 <= wire25;
          reg134 <= (wire24[(2'h3):(2'h3)] ?
              $signed(reg131) : (+($signed((reg76 << wire23)) << (~&{wire24}))));
          reg135 <= (8'ha4);
        end
      else
        begin
          if ({wire22, wire23})
            begin
              reg132 <= $unsigned($unsigned($unsigned({reg134[(4'ha):(4'ha)],
                  (wire22 ? wire128 : wire130)})));
              reg133 <= (((reg135[(5'h14):(3'h4)] & $signed((reg74 > reg73))) ?
                  reg73 : $unsigned($signed((wire27 <= reg73)))) < $unsigned(wire21[(5'h10):(3'h5)]));
              reg134 <= (|{{wire71, $signed($signed((8'ha5)))}});
            end
          else
            begin
              reg132 <= ({wire75[(2'h3):(1'h1)]} ? {wire27} : reg76);
              reg133 <= {(|$unsigned($unsigned(((8'h9f) ? wire27 : wire25))))};
              reg134 <= $signed($unsigned((!wire71)));
              reg135 <= (~|($signed($unsigned((!(8'hb6)))) ?
                  ($unsigned($signed((8'hb6))) & $signed(wire20)) : wire23));
            end
        end
      if (((($signed((reg131 || wire26)) + {(wire24 ~^ wire128)}) ?
              (($unsigned(reg74) ?
                  (~wire75) : $unsigned((8'ha6))) & (^~$signed(reg132))) : (-(^~(wire23 ?
                  (8'had) : wire24)))) ?
          wire21 : $unsigned((|{reg134[(4'h8):(3'h7)]}))))
        begin
          reg136 <= $unsigned(reg74[(3'h6):(1'h1)]);
          reg137 <= ($unsigned(wire27) < ($signed((|(8'ha7))) ?
              wire22 : $signed(wire20)));
          if (reg73)
            begin
              reg138 <= reg77[(4'h9):(4'h9)];
              reg139 <= (reg77 ?
                  reg132[(1'h0):(1'h0)] : $signed($unsigned(wire25)));
            end
          else
            begin
              reg138 <= $signed(({$unsigned(((8'hb6) ?
                      reg73 : reg77))} == ($unsigned($signed(reg136)) ?
                  ((wire27 ?
                      reg137 : reg135) > ((8'h9c) < reg132)) : $unsigned($signed(reg132)))));
              reg139 <= reg73[(4'h9):(3'h7)];
              reg140 <= (~(!(8'hb7)));
            end
          reg141 <= (+wire24);
        end
      else
        begin
          reg136 <= reg74[(4'hb):(4'ha)];
          if (reg76)
            begin
              reg137 <= (~(+$signed(({wire75, reg133} ?
                  {wire71, reg73} : $unsigned(reg135)))));
            end
          else
            begin
              reg137 <= {reg76, reg137[(1'h1):(1'h0)]};
              reg138 <= (wire22[(4'hc):(4'hb)] ?
                  ((({reg133} ?
                          $unsigned(wire130) : (reg134 != wire24)) || (!$unsigned((8'hae)))) ?
                      $signed(reg131[(2'h2):(2'h2)]) : wire21[(4'he):(4'hb)]) : ((^(wire128[(4'h8):(3'h4)] ?
                          {(8'h9d), (8'hb3)} : reg132[(2'h3):(2'h2)])) ?
                      (^((&wire75) ?
                          (wire21 >>> reg141) : {reg77})) : $signed(((reg138 >>> reg136) || {(8'hb2)}))));
              reg139 <= reg135;
            end
          reg140 <= ((^~(~((reg139 ? (8'hb1) : (8'ha3)) ?
              $signed(reg74) : wire24[(2'h2):(2'h2)]))) >> $unsigned($unsigned(((reg76 - wire20) ?
              reg76[(2'h3):(1'h1)] : {reg74}))));
          reg141 <= wire27[(4'hc):(3'h7)];
          reg142 <= ($signed((~^$signed({wire21, reg138}))) ?
              ((((~|reg78) & (wire71 ? reg76 : wire26)) == (|(~reg132))) ?
                  $unsigned(wire75) : reg74) : (^~reg74));
        end
      if ((reg131[(4'hb):(3'h5)] >> (wire75 ? wire25 : reg140[(3'h6):(3'h4)])))
        begin
          if ($unsigned(((reg137[(1'h0):(1'h0)] == wire25[(3'h7):(3'h4)]) ?
              $unsigned(wire24) : {{wire24[(4'hf):(3'h6)]},
                  ($unsigned(wire21) > (reg78 ? reg136 : (7'h44)))})))
            begin
              reg143 <= reg73;
              reg144 <= $signed($unsigned((($unsigned(reg74) ?
                      $unsigned(reg141) : (wire20 ? wire130 : reg142)) ?
                  (|reg133) : (~|(-reg132)))));
              reg145 <= reg135[(2'h2):(1'h0)];
              reg146 <= reg78;
              reg147 <= wire25[(3'h5):(2'h2)];
            end
          else
            begin
              reg143 <= reg78;
              reg144 <= wire21[(3'h4):(1'h1)];
            end
          reg148 <= reg78[(2'h2):(1'h1)];
          if ((^reg138))
            begin
              reg149 <= $signed($unsigned((!reg138)));
              reg150 <= (&(($signed((&reg134)) ?
                  (&$unsigned(reg148)) : (&(reg148 ^ reg142))) << $signed({$unsigned(reg144)})));
              reg151 <= ((|$signed(wire24[(4'hf):(2'h3)])) >= wire128[(3'h5):(2'h3)]);
            end
          else
            begin
              reg149 <= $signed($unsigned((~^(&wire22[(4'h8):(1'h1)]))));
              reg150 <= $unsigned($unsigned($signed(({(8'hba)} ?
                  reg139[(3'h5):(2'h3)] : wire20[(4'h8):(3'h4)]))));
            end
          reg152 <= {((wire25 ?
                  (8'ha5) : {wire21[(2'h3):(1'h1)]}) <<< $signed((reg148 ?
                  $unsigned((8'ha8)) : (reg151 ? (8'h9c) : wire75)))),
              $signed({(^~(wire71 ? reg144 : reg149)),
                  $unsigned({wire27, reg78})})};
          if ($unsigned(wire130[(1'h0):(1'h0)]))
            begin
              reg153 <= ($signed((~|($signed(reg140) > wire25))) ?
                  $signed($unsigned($signed((~reg135)))) : $unsigned(reg138));
            end
          else
            begin
              reg153 <= (reg139 ? reg77[(4'he):(3'h6)] : reg144[(4'hb):(4'ha)]);
              reg154 <= ($unsigned(wire21[(4'h9):(3'h6)]) >= {reg152[(2'h2):(2'h2)]});
            end
        end
      else
        begin
          if ((wire20 ?
              ((~((reg147 ? wire24 : reg152) ?
                  (&wire20) : (reg74 ?
                      reg140 : reg143))) ^~ ($unsigned(wire130) ?
                  (reg135 >> $signed((8'hb9))) : $signed((|reg77)))) : {$signed(reg139)}))
            begin
              reg143 <= {(+$signed($signed(((8'h9c) ? reg132 : (8'hbf))))),
                  reg133};
              reg144 <= $unsigned((&((8'hb3) ^~ wire22[(1'h1):(1'h0)])));
              reg145 <= $unsigned((reg131[(4'hb):(3'h5)] ~^ reg140));
              reg146 <= $signed(($unsigned($signed(((8'hb0) ?
                  reg144 : (8'haa)))) > {(reg145[(5'h12):(4'hb)] - $unsigned(reg135)),
                  (8'hb0)}));
            end
          else
            begin
              reg143 <= ($signed(((|(|(8'hb9))) > ($signed(wire23) ?
                      $unsigned(reg139) : $unsigned(reg151)))) ?
                  ({(~^(reg78 ? reg136 : wire128)), $unsigned((|reg78))} ?
                      ($signed((+reg147)) ?
                          reg134[(4'h9):(1'h1)] : (&wire24[(3'h6):(3'h5)])) : reg77) : (~{{(reg77 ?
                              (8'ha4) : (7'h43)),
                          (!wire20)},
                      $unsigned($signed(reg145))}));
              reg144 <= wire23[(3'h4):(1'h0)];
              reg145 <= (($unsigned(wire25) ?
                  ((+{reg131,
                      reg154}) * (^(!reg148))) : (wire27 * $unsigned($unsigned(reg136)))) <<< reg133);
            end
        end
    end
  assign wire155 = $signed((&(7'h40)));
  assign wire156 = $signed((|$signed($unsigned(reg132[(2'h2):(1'h0)]))));
  always
    @(posedge clk) begin
      if (($signed({wire130}) >= reg135[(3'h6):(2'h3)]))
        begin
          reg157 <= (({(+(reg142 ? wire75 : reg132)),
                  {wire26, (wire71 && wire156)}} + (^~{wire24[(4'h9):(3'h5)],
                  reg140[(1'h0):(1'h0)]})) ?
              (&wire25[(3'h6):(1'h0)]) : {(reg138[(3'h4):(3'h4)] ?
                      {$unsigned(wire75)} : ((reg76 ?
                          reg78 : reg152) + (wire128 ? reg142 : reg77)))});
          reg158 <= reg138;
        end
      else
        begin
          reg157 <= (!wire23);
          reg158 <= {(reg150[(5'h10):(2'h3)] ?
                  ($unsigned((+(8'hb9))) ?
                      $unsigned((8'haf)) : ($unsigned(reg153) ?
                          (reg135 ?
                              reg76 : (8'hb8)) : (reg74 & wire128))) : wire155[(4'ha):(3'h5)])};
        end
      reg159 <= (^~$unsigned((!wire25[(3'h7):(3'h5)])));
      reg160 <= reg133;
      reg161 <= {reg150[(3'h6):(1'h0)]};
    end
  assign wire162 = reg147[(3'h5):(1'h1)];
  assign wire163 = reg152[(3'h6):(2'h2)];
  assign wire164 = (reg133 ? reg158 : (+reg149[(1'h0):(1'h0)]));
  module165 #() modinst188 (.wire166(reg135), .clk(clk), .wire167(wire130), .y(wire187), .wire168(reg76), .wire169(reg153));
endmodule

module module165
#(parameter param185 = (^({(-(8'hac)), (((8'ha9) || (8'ha8)) ? (&(8'hb5)) : (^~(8'hb6)))} ? {((!(8'h9d)) ^~ ((8'hbe) < (8'ha5)))} : ((~^((8'ha2) > (8'had))) ? ((~&(8'haa)) ? ((8'haf) | (8'hba)) : ((8'ha4) ? (8'hba) : (8'hb4))) : (~^(^~(8'hab)))))), 
parameter param186 = ({({param185, (param185 > param185)} << param185)} ? (8'ha5) : param185))
(y, clk, wire169, wire168, wire167, wire166);
  output wire [(32'h92):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire169;
  input wire [(5'h11):(1'h0)] wire168;
  input wire [(4'hb):(1'h0)] wire167;
  input wire signed [(5'h10):(1'h0)] wire166;
  wire [(4'hb):(1'h0)] wire184;
  wire signed [(3'h6):(1'h0)] wire183;
  wire [(3'h7):(1'h0)] wire182;
  wire signed [(2'h2):(1'h0)] wire181;
  wire signed [(4'h9):(1'h0)] wire170;
  reg [(4'h9):(1'h0)] reg180 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg177 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg176 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg175 = (1'h0);
  reg [(2'h3):(1'h0)] reg174 = (1'h0);
  reg signed [(4'he):(1'h0)] reg173 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg172 = (1'h0);
  reg [(4'he):(1'h0)] reg171 = (1'h0);
  assign y = {wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire170,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 (1'h0)};
  assign wire170 = $unsigned(wire169);
  always
    @(posedge clk) begin
      reg171 <= $signed($unsigned(wire169[(3'h6):(1'h1)]));
      reg172 <= (^$signed(wire170[(3'h4):(3'h4)]));
      if ((8'hb7))
        begin
          if ({wire169[(4'hd):(4'hc)]})
            begin
              reg173 <= wire167[(4'h9):(1'h0)];
            end
          else
            begin
              reg173 <= ((|(($signed(reg172) ~^ $signed(reg173)) ?
                  wire168 : reg172[(2'h2):(1'h1)])) || {(~(-(reg171 <<< (8'ha0)))),
                  ($unsigned($signed(reg173)) ? (+{reg172}) : wire167)});
              reg174 <= (|wire167);
              reg175 <= ({$unsigned((reg173 != {wire167, (8'hbb)})),
                      reg173[(3'h4):(3'h4)]} ?
                  $unsigned(((wire170[(1'h1):(1'h0)] ?
                      (reg174 < reg172) : $signed(wire168)) > ((8'hac) <= (wire167 ?
                      (8'h9f) : wire170)))) : (reg172 ?
                      (~&$signed(wire166[(3'h5):(1'h1)])) : wire168[(5'h11):(1'h1)]));
              reg176 <= $unsigned($unsigned($unsigned((^~reg175[(4'h8):(1'h1)]))));
              reg177 <= $signed($signed($signed($unsigned((wire167 + reg176)))));
            end
        end
      else
        begin
          if (((8'hbb) ?
              ((((reg176 ?
                      wire166 : reg174) <<< {reg171}) >> (!$unsigned(reg174))) ?
                  $unsigned(reg177[(3'h7):(3'h7)]) : (wire169 ?
                      $unsigned(reg176[(1'h1):(1'h1)]) : (+(reg172 >= wire170)))) : (~|$unsigned($unsigned(wire170)))))
            begin
              reg173 <= {wire169[(4'hc):(4'h9)]};
              reg174 <= (~^wire166[(4'h8):(2'h2)]);
              reg175 <= (wire170 ^~ {reg176,
                  ($signed($unsigned(reg172)) ?
                      (-(^wire167)) : (~&((8'had) ? reg177 : reg174)))});
              reg176 <= $unsigned($unsigned(((8'hb3) ?
                  $signed((reg177 ?
                      (8'ha8) : reg176)) : ({wire167} || (|wire168)))));
              reg177 <= {$unsigned(reg176)};
            end
          else
            begin
              reg173 <= reg176[(2'h2):(1'h1)];
              reg174 <= wire169;
              reg175 <= (reg174[(1'h0):(1'h0)] << {$unsigned(($unsigned(reg172) ?
                      {reg171} : wire169))});
            end
          reg178 <= (-$signed(reg173[(1'h1):(1'h1)]));
        end
      reg179 <= ($unsigned({((~reg172) ? $signed(reg171) : $signed(wire170)),
              reg176}) ?
          ((($unsigned(reg175) ? (reg172 < (8'ha0)) : $unsigned(reg171)) ?
                  ($unsigned((8'hba)) && (^~(8'ha3))) : (&wire168)) ?
              wire169 : wire166[(4'hd):(4'h9)]) : reg177);
      reg180 <= {((reg179 + (reg172 << $unsigned((8'ha7)))) ?
              (reg172[(2'h2):(1'h0)] >> reg176) : $unsigned($unsigned((-(8'haf))))),
          $signed({((reg175 ? reg175 : reg173) ~^ wire167), wire169})};
    end
  assign wire181 = $signed(reg175[(2'h3):(2'h3)]);
  assign wire182 = $signed((reg174 ?
                       ((reg171 ?
                           reg178[(3'h5):(1'h1)] : (~^wire169)) <<< (8'h9d)) : {wire169,
                           $unsigned($signed(reg178))}));
  assign wire183 = wire170[(3'h4):(2'h3)];
  assign wire184 = {wire182};
endmodule

module module79
#(parameter param127 = {({(((8'hb4) != (8'ha3)) | (^(7'h40))), (!((8'h9f) >= (8'had)))} >= (~(|((8'ha3) != (8'hab))))), (~^((~^((8'hbd) ~^ (8'hbb))) > (^(8'hb8))))})
(y, clk, wire83, wire82, wire81, wire80);
  output wire [(32'h254):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire83;
  input wire signed [(3'h7):(1'h0)] wire82;
  input wire [(5'h10):(1'h0)] wire81;
  input wire [(4'he):(1'h0)] wire80;
  wire [(5'h15):(1'h0)] wire109;
  wire signed [(5'h12):(1'h0)] wire108;
  wire [(2'h3):(1'h0)] wire107;
  wire signed [(5'h12):(1'h0)] wire95;
  wire signed [(4'hf):(1'h0)] wire94;
  wire signed [(4'ha):(1'h0)] wire93;
  wire [(3'h7):(1'h0)] wire92;
  reg [(5'h10):(1'h0)] reg126 = (1'h0);
  reg [(5'h13):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg122 = (1'h0);
  reg [(4'h8):(1'h0)] reg121 = (1'h0);
  reg [(5'h12):(1'h0)] reg120 = (1'h0);
  reg [(5'h13):(1'h0)] reg119 = (1'h0);
  reg [(5'h14):(1'h0)] reg118 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg115 = (1'h0);
  reg [(4'hb):(1'h0)] reg114 = (1'h0);
  reg signed [(4'he):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg111 = (1'h0);
  reg [(4'h8):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg104 = (1'h0);
  reg [(5'h11):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg99 = (1'h0);
  reg [(3'h4):(1'h0)] reg98 = (1'h0);
  reg [(5'h15):(1'h0)] reg97 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg96 = (1'h0);
  reg [(5'h15):(1'h0)] reg91 = (1'h0);
  reg [(5'h13):(1'h0)] reg90 = (1'h0);
  reg [(4'hc):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg88 = (1'h0);
  reg [(5'h13):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg86 = (1'h0);
  reg [(5'h14):(1'h0)] reg85 = (1'h0);
  reg [(3'h5):(1'h0)] reg84 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire107,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
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
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((^~(({wire83[(3'h6):(1'h0)], (wire80 >> wire82)} ?
              $unsigned((~wire82)) : $signed(wire81)) ?
          (!wire82[(2'h2):(1'h1)]) : $unsigned(((wire80 * wire81) || $unsigned(wire81))))))
        begin
          reg84 <= (wire81[(3'h7):(3'h7)] >> (($signed((8'ha1)) < ((8'h9d) ?
                  (wire83 ? wire80 : wire81) : (wire81 * wire83))) ?
              $unsigned({$unsigned(wire80),
                  $unsigned(wire81)}) : {$signed((~^wire82))}));
          reg85 <= {(wire82 == wire82[(1'h0):(1'h0)]), wire81};
          reg86 <= {{(((~^wire82) ? (~wire83) : (~reg84)) << {(^~wire81),
                      {reg85}})}};
          if (wire82[(1'h1):(1'h1)])
            begin
              reg87 <= $signed({$signed($signed(wire80[(4'hb):(1'h1)]))});
              reg88 <= $unsigned($unsigned((reg87 ?
                  ((~^wire81) >>> $signed((8'hb0))) : (wire80[(4'hd):(2'h3)] ?
                      $unsigned(wire81) : $signed(reg86)))));
            end
          else
            begin
              reg87 <= (~^(((!$signed(wire80)) ? reg85 : reg84[(3'h5):(1'h0)]) ?
                  {($signed(reg88) | wire81), reg88[(5'h14):(4'hf)]} : ((reg84 ?
                          (8'hb2) : ((7'h41) ^~ reg86)) ?
                      (~&(~wire80)) : $unsigned(reg84))));
              reg88 <= ((|((8'ha9) && reg88)) || (($unsigned(wire83) >>> wire83[(3'h6):(1'h0)]) ?
                  ($unsigned((wire83 - wire82)) ?
                      $signed({wire81}) : {{reg88}}) : (reg88 << {$signed(wire80)})));
              reg89 <= $signed((wire80[(3'h7):(1'h1)] - (((wire82 ?
                      reg85 : wire82) != (~(8'ha9))) ?
                  (reg84 ?
                      (~reg86) : $signed(wire83)) : $signed($unsigned((8'hae))))));
            end
          reg90 <= ($unsigned((7'h43)) ?
              $unsigned(({(reg84 - wire83), {wire80, wire83}} ?
                  (-(reg89 ?
                      wire83 : wire80)) : (^~$unsigned(wire82)))) : (-reg88[(5'h12):(4'hd)]));
        end
      else
        begin
          reg84 <= (((-reg84[(2'h2):(1'h0)]) ?
              wire80[(3'h5):(1'h0)] : $signed((|reg90))) + $signed((({wire80} ?
              {reg87, reg85} : $unsigned(wire83)) <= (reg87 ?
              $signed(wire80) : wire81[(5'h10):(3'h7)]))));
          reg85 <= (^reg88);
        end
      reg91 <= ((reg90 ?
          $signed($signed(reg87[(5'h13):(2'h3)])) : $unsigned($unsigned(reg89[(4'hb):(4'ha)]))) ^~ $signed($signed(wire80[(3'h6):(2'h2)])));
    end
  assign wire92 = $signed({$signed(wire83[(4'he):(4'ha)])});
  assign wire93 = (|wire80[(4'hb):(4'hb)]);
  assign wire94 = $signed($unsigned(reg86[(1'h0):(1'h0)]));
  assign wire95 = $signed((reg88[(5'h10):(4'hd)] - $signed(reg91)));
  always
    @(posedge clk) begin
      if ($signed(($unsigned((((8'ha4) ?
          (8'ha6) : reg86) || ((8'hb3) <= (8'hb9)))) <= wire93[(4'h9):(2'h3)])))
        begin
          if ((wire80 ~^ $signed((((wire80 || reg87) ?
                  {reg90, wire80} : (wire92 ~^ reg90)) ?
              (^~wire95[(4'h9):(3'h7)]) : $unsigned($unsigned(wire82))))))
            begin
              reg96 <= ((~$signed(($unsigned(reg88) ?
                      $signed(wire81) : (wire81 > wire81)))) ?
                  (~&wire82) : {wire94[(2'h3):(2'h3)]});
              reg97 <= (($unsigned($signed(wire92[(3'h5):(3'h5)])) ?
                  ((^~wire82[(3'h5):(3'h5)]) >= $signed((wire92 ?
                      wire92 : reg86))) : $unsigned({((8'haa) == reg86),
                      reg90})) >>> ((-$unsigned((~|wire92))) ?
                  ((&(|wire93)) << (8'hb5)) : (~{reg85[(2'h3):(1'h0)]})));
              reg98 <= (wire95 < ((reg91 | $unsigned($unsigned(wire93))) >>> reg89));
            end
          else
            begin
              reg96 <= $signed($unsigned(wire81));
              reg97 <= wire81[(2'h2):(1'h0)];
              reg98 <= (reg98 ?
                  (^~$unsigned(($signed(reg87) + (~|wire95)))) : reg98[(2'h2):(1'h1)]);
              reg99 <= ($signed((~|((wire95 ? (8'hb3) : reg86) ?
                  $signed(reg86) : (wire82 + reg87)))) * wire80);
              reg100 <= wire82[(3'h6):(3'h6)];
            end
          reg101 <= ({(($signed(wire92) ~^ $unsigned(wire94)) == $unsigned((wire94 ?
                      reg89 : reg98))),
                  $signed((~(8'hbc)))} ?
              (reg91[(5'h13):(3'h4)] ?
                  ((|reg88[(3'h6):(2'h2)]) ?
                      (reg97[(5'h15):(5'h14)] ?
                          $signed(reg86) : (reg85 ?
                              (8'hab) : reg87)) : {reg99[(4'h9):(4'h8)]}) : {(wire94[(4'hc):(2'h3)] & (~(8'hbc))),
                      {(wire92 ~^ reg89), wire83[(5'h10):(4'he)]}}) : reg100);
          reg102 <= (((~&{$signed(wire82)}) ? wire92 : (8'h9c)) == reg89);
          reg103 <= {$signed(((|$unsigned((8'ha6))) ?
                  ((reg100 ? wire82 : wire82) ?
                      ((8'hba) ? reg100 : reg99) : (reg98 ?
                          reg89 : reg96)) : $signed($signed(wire92))))};
        end
      else
        begin
          reg96 <= $signed(({reg85[(4'he):(1'h1)]} ^~ $unsigned($signed(reg87[(4'hc):(4'hc)]))));
        end
      reg104 <= $signed((($unsigned((wire82 >= (8'hbd))) && reg90) * (($unsigned((8'hb3)) ?
              $signed(wire82) : (wire94 * wire81)) ?
          reg88 : {(reg96 || (8'hbb)), reg97})));
      reg105 <= ({(reg102[(4'hf):(1'h1)] ^ $unsigned(wire83[(3'h4):(2'h2)])),
              (&wire92[(3'h6):(2'h3)])} ?
          $unsigned(($unsigned(wire94) ?
              wire94 : $unsigned((~|reg101)))) : $signed($signed(wire94)));
      reg106 <= reg91;
    end
  assign wire107 = wire81;
  assign wire108 = {reg102, reg86[(2'h3):(2'h3)]};
  assign wire109 = {$unsigned((^{wire92[(3'h5):(3'h5)]})),
                       $unsigned(((((8'h9c) ? reg96 : reg98) ?
                           $signed(reg84) : $signed(reg106)) | (reg90 ?
                           $signed(reg84) : reg88[(4'he):(2'h3)])))};
  always
    @(posedge clk) begin
      if ((((((wire81 ?
          (8'hbd) : wire82) * wire93[(4'h9):(4'h8)]) < wire81) && $signed(reg103)) == (wire107[(1'h1):(1'h0)] ^~ $signed({{reg89,
              reg99},
          reg89}))))
        begin
          reg110 <= wire107[(1'h1):(1'h1)];
          reg111 <= ((^~({(wire109 & reg84), (+wire108)} <= (reg98 >= (reg88 ?
                  reg89 : wire107)))) ?
              $signed((-((reg88 ^ wire107) & (wire107 <<< reg91)))) : reg110);
        end
      else
        begin
          reg110 <= reg111[(3'h6):(2'h2)];
          if ((reg96 ?
              $signed((($signed((8'hb3)) ? $signed(reg100) : $signed((8'hb5))) ?
                  wire109[(4'hb):(1'h0)] : (8'hbc))) : {$unsigned({wire82[(2'h2):(2'h2)],
                      (~&wire95)}),
                  {(reg91[(3'h6):(3'h6)] | {wire108})}}))
            begin
              reg111 <= (^~{wire82});
              reg112 <= (reg88[(4'h9):(3'h4)] ?
                  $unsigned(($signed((&reg97)) ?
                      wire108 : $signed($signed(reg111)))) : (((~^wire92[(2'h2):(1'h0)]) + ({wire108,
                          reg106} ^~ (reg90 && reg106))) ?
                      reg96[(3'h6):(3'h5)] : (reg97[(5'h10):(5'h10)] ?
                          $signed((~&reg103)) : wire95)));
            end
          else
            begin
              reg111 <= (($signed($unsigned(reg97)) & (^((&wire80) ?
                  $unsigned((8'hbd)) : $signed(reg85)))) || ((reg85[(5'h12):(3'h4)] ~^ ((wire82 == reg102) != reg102[(4'h8):(2'h2)])) ?
                  reg106[(4'h9):(3'h6)] : (reg88 == $signed($unsigned(reg98)))));
              reg112 <= (($signed($unsigned((reg90 ? reg101 : reg98))) ?
                  reg104[(3'h7):(3'h5)] : {reg96,
                      {((8'hb5) != wire80), $unsigned(reg102)}}) && (~reg100));
              reg113 <= (-reg102[(4'hd):(4'hc)]);
              reg114 <= reg110[(1'h1):(1'h1)];
              reg115 <= (+(^~{$signed((reg114 ? reg85 : (8'hbf)))}));
            end
          if ($unsigned(reg98))
            begin
              reg116 <= reg111[(1'h1):(1'h1)];
              reg117 <= (~^wire83[(5'h10):(4'hd)]);
              reg118 <= reg116[(3'h5):(1'h1)];
              reg119 <= (-reg104[(3'h7):(2'h3)]);
              reg120 <= ($unsigned(reg114) ?
                  reg116[(3'h7):(1'h1)] : (reg88 ?
                      reg98[(3'h4):(2'h2)] : (((~|wire95) && wire81[(4'hc):(4'hc)]) ^ {wire81,
                          reg105})));
            end
          else
            begin
              reg116 <= (reg115 ?
                  $unsigned((reg103[(2'h3):(1'h1)] >= (|(reg118 << reg110)))) : (7'h40));
              reg117 <= ((~&reg96) ?
                  reg87[(4'hd):(4'hc)] : (($unsigned($unsigned(wire83)) ?
                          {(~reg85), $unsigned(reg99)} : ($unsigned((8'ha7)) ?
                              $signed((8'hb4)) : wire93)) ?
                      reg96[(1'h1):(1'h1)] : wire107[(1'h0):(1'h0)]));
            end
          if ($signed((&(^~($signed(wire94) ? reg89 : reg87[(4'h8):(1'h0)])))))
            begin
              reg121 <= reg113;
              reg122 <= (~^(+reg97[(5'h14):(5'h13)]));
              reg123 <= ({{reg121, (~|(~^reg87))},
                      (!((^reg98) == $signed(reg99)))} ?
                  (^~(reg88 ?
                      wire108 : ($unsigned(reg90) - $signed(reg122)))) : $signed($unsigned({$signed(reg86)})));
              reg124 <= $signed($unsigned((|(reg99 ?
                  (reg115 * reg119) : reg88))));
            end
          else
            begin
              reg121 <= $unsigned(reg121);
              reg122 <= (({(reg104 ? {reg98} : $unsigned(reg118)),
                  ($signed(reg96) >>> wire93)} ^~ (-(reg86 != (-reg103)))) < (~^(((reg101 ?
                      (8'hbf) : wire83) ?
                  $signed(reg89) : wire94[(2'h3):(1'h0)]) < reg98[(2'h3):(2'h2)])));
            end
          reg125 <= {(~|reg85)};
        end
      reg126 <= reg97;
    end
endmodule

module module28
#(parameter param69 = ({{(~|{(8'hb3), (8'h9c)})}} + (((((8'hbc) || (8'hb5)) ? (^(7'h41)) : (~(8'hac))) >>> (((8'h9e) - (8'hb3)) ? ((8'hb1) ? (8'hae) : (8'hac)) : (+(8'h9e)))) ? (((~^(8'h9e)) ? ((7'h42) == (8'hb3)) : ((8'h9e) ? (8'hb2) : (8'hbf))) ^~ {((8'ha1) ? (8'ha1) : (8'ha4))}) : (((!(8'ha4)) < ((8'h9c) >> (8'hbe))) || (((7'h41) ? (8'hbd) : (8'haa)) <<< ((7'h43) ? (7'h42) : (8'hbe)))))), 
parameter param70 = param69)
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h1ec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire32;
  input wire signed [(5'h11):(1'h0)] wire31;
  input wire [(4'h8):(1'h0)] wire30;
  input wire [(4'hb):(1'h0)] wire29;
  wire [(4'hc):(1'h0)] wire68;
  wire signed [(5'h13):(1'h0)] wire56;
  wire signed [(4'h9):(1'h0)] wire55;
  wire signed [(5'h14):(1'h0)] wire54;
  wire signed [(5'h14):(1'h0)] wire53;
  wire [(3'h6):(1'h0)] wire52;
  wire [(4'hb):(1'h0)] wire51;
  wire [(4'he):(1'h0)] wire46;
  wire [(5'h15):(1'h0)] wire34;
  wire [(4'hd):(1'h0)] wire33;
  reg signed [(5'h14):(1'h0)] reg67 = (1'h0);
  reg [(5'h10):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg65 = (1'h0);
  reg [(4'h8):(1'h0)] reg64 = (1'h0);
  reg [(5'h15):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg [(5'h10):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(5'h12):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg49 = (1'h0);
  reg [(4'he):(1'h0)] reg48 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg43 = (1'h0);
  reg [(4'ha):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  assign y = {wire68,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire46,
                 wire34,
                 wire33,
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
                 reg50,
                 reg49,
                 reg48,
                 reg47,
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
                 (1'h0)};
  assign wire33 = wire29;
  assign wire34 = (((!wire30) ?
                          ((!{wire29}) ?
                              ((wire33 == wire32) <= ((8'hb3) ?
                                  wire33 : wire32)) : wire30) : (7'h42)) ?
                      $unsigned($unsigned({wire29[(3'h4):(2'h3)],
                          $signed(wire29)})) : $unsigned($unsigned((8'ha3))));
  always
    @(posedge clk) begin
      if ($signed($signed((wire31[(4'he):(4'h8)] ~^ $signed((-wire32))))))
        begin
          if (($unsigned(($unsigned(wire32[(1'h1):(1'h0)]) <<< $signed($unsigned(wire34)))) ?
              ((&wire31) == $signed(($signed((8'hb0)) ?
                  (wire30 ?
                      wire30 : wire30) : $unsigned(wire32)))) : $signed(wire29)))
            begin
              reg35 <= wire33[(4'hc):(4'hc)];
              reg36 <= wire34;
              reg37 <= (8'hb8);
              reg38 <= {$unsigned((reg36 ^~ wire34[(5'h15):(5'h12)])),
                  $signed(($signed({(8'ha8), wire33}) ?
                      {$signed(wire30)} : (~^$signed(wire32))))};
            end
          else
            begin
              reg35 <= wire29;
              reg36 <= (~&{$unsigned((|(wire31 <= reg35))), reg35});
              reg37 <= $signed(((({wire34} ?
                  {wire30} : wire31[(4'h9):(2'h3)]) || $signed((wire34 ?
                  reg36 : wire34))) <= reg37[(2'h3):(1'h0)]));
              reg38 <= $unsigned({($unsigned(((8'hbe) ?
                      wire32 : reg35)) >>> reg36)});
            end
          if (($signed((!($signed(reg38) ?
              (reg35 + reg38) : {reg38, reg37}))) != wire30[(3'h4):(2'h2)]))
            begin
              reg39 <= $unsigned({(^~$signed($unsigned(wire33)))});
              reg40 <= ($unsigned((reg35[(5'h11):(5'h11)] != (~|$unsigned((8'h9e))))) >= reg39);
              reg41 <= $signed(wire30[(1'h1):(1'h1)]);
            end
          else
            begin
              reg39 <= ((reg40[(4'h8):(3'h4)] > (^~$signed((wire32 ^ wire34)))) <= $unsigned(({reg37} ?
                  ($signed(reg36) ?
                      (wire34 << wire29) : reg37) : reg35[(5'h12):(3'h7)])));
              reg40 <= (reg40[(3'h4):(1'h0)] ?
                  ((~|wire29[(1'h1):(1'h0)]) ?
                      (+wire32) : {(~&(&wire33)),
                          $signed((wire34 + wire33))}) : $signed(({reg35[(4'h8):(3'h7)]} >> {(wire29 ?
                          reg38 : wire31)})));
              reg41 <= {reg37[(4'hb):(3'h5)]};
            end
        end
      else
        begin
          if ((|(+((~|(!wire33)) ?
              $unsigned($signed((8'ha4))) : ((|reg41) | $signed(reg38))))))
            begin
              reg35 <= (((^reg37) ?
                  reg35[(4'h9):(3'h7)] : reg38) >> $signed((({reg35} ^ $unsigned((8'hac))) << ((wire30 ?
                  (8'ha8) : reg37) <<< (reg41 == reg35)))));
            end
          else
            begin
              reg35 <= ($signed((^(&$signed(wire31)))) * $signed((~&(-((8'hb5) * reg41)))));
              reg36 <= (^wire30);
              reg37 <= (~((~^(^~$signed(reg39))) >> {reg37[(4'ha):(4'h9)],
                  wire29[(2'h3):(2'h3)]}));
            end
          reg38 <= wire30;
          reg39 <= $unsigned($unsigned(wire34));
          if ($unsigned($unsigned((((wire30 != wire31) >>> wire31) ?
              reg40 : (reg41 ? (8'h9f) : ((8'hb1) ? reg35 : wire29))))))
            begin
              reg40 <= $unsigned({reg38,
                  (wire34[(2'h3):(1'h1)] - wire32[(3'h7):(2'h2)])});
              reg41 <= wire31;
              reg42 <= reg40;
            end
          else
            begin
              reg40 <= $unsigned((^$signed($signed(reg36))));
            end
          reg43 <= wire34[(4'hc):(4'h8)];
        end
      reg44 <= reg41;
    end
  always
    @(posedge clk) begin
      reg45 <= $unsigned($signed(($signed($signed((8'h9d))) != {$unsigned(wire29),
          $signed(reg39)})));
    end
  assign wire46 = ({((-(&reg39)) ?
                          (reg36[(1'h0):(1'h0)] || $unsigned(reg37)) : (^~$signed(reg35)))} >> reg37[(4'he):(3'h4)]);
  always
    @(posedge clk) begin
      reg47 <= reg43[(2'h2):(1'h0)];
      reg48 <= ((^~(($unsigned(wire46) ? $unsigned(reg44) : reg43) >> (reg36 ?
              (reg36 ? reg44 : reg39) : reg38[(1'h1):(1'h0)]))) ?
          $signed(reg40) : $unsigned($unsigned((7'h42))));
      reg49 <= reg44;
      reg50 <= ($signed(reg37) != reg48[(4'ha):(2'h2)]);
    end
  assign wire51 = $unsigned((reg49[(2'h2):(1'h1)] << $unsigned(({reg38,
                      (8'hb4)} - reg48))));
  assign wire52 = $signed(reg44[(3'h4):(2'h3)]);
  assign wire53 = reg47[(3'h6):(2'h3)];
  assign wire54 = $unsigned(reg37[(5'h11):(5'h10)]);
  assign wire55 = (reg37 ?
                      (reg49[(1'h0):(1'h0)] ^~ $signed({reg40[(4'ha):(1'h1)],
                          reg48})) : $signed($signed(reg50)));
  assign wire56 = {{$signed(((reg39 && reg43) ? (!reg35) : reg48))},
                      (($signed((~reg41)) ? (8'hba) : wire46) ?
                          ({$signed(reg47), reg47[(3'h4):(2'h2)]} ?
                              reg42[(1'h1):(1'h1)] : (~&{(8'hbe),
                                  wire54})) : (wire31 ?
                              {(wire46 ? wire46 : wire31),
                                  {wire51}} : ($signed(reg41) ~^ (wire29 - reg42))))};
  always
    @(posedge clk) begin
      if (($unsigned(wire52) ? reg36 : wire32[(4'ha):(2'h3)]))
        begin
          reg57 <= (wire30[(3'h7):(1'h1)] > reg45);
          reg58 <= (|(&{(wire52 ? (~(8'had)) : reg48),
              {reg43[(1'h1):(1'h1)]}}));
          reg59 <= $unsigned(({$signed(reg37[(4'ha):(1'h1)])} ?
              $signed($unsigned($signed(reg41))) : $unsigned(wire56[(4'hf):(4'ha)])));
        end
      else
        begin
          if ($unsigned($unsigned((+{reg37}))))
            begin
              reg57 <= $unsigned((wire33 ?
                  wire53[(4'hf):(4'he)] : reg38[(4'hb):(2'h2)]));
              reg58 <= ($signed({(-$signed(wire31))}) & $signed(((reg44 | (~|reg59)) > (|(~wire54)))));
              reg59 <= $signed((~^($unsigned(wire46) > reg42)));
            end
          else
            begin
              reg57 <= ((8'ha7) == wire55);
              reg58 <= wire53[(5'h12):(5'h12)];
            end
        end
      reg60 <= reg36;
      reg61 <= reg50;
      if ($unsigned((wire34 ?
          $unsigned(wire30[(3'h6):(2'h3)]) : ($signed(reg40) ?
              (8'haa) : (-$signed(wire32))))))
        begin
          reg62 <= reg48;
          if ($unsigned(reg40))
            begin
              reg63 <= (~|(($unsigned({reg41, wire29}) ?
                      (+((8'hbc) ? reg61 : wire34)) : (~|reg45)) ?
                  ((!((8'hb4) ?
                      reg62 : (8'hb0))) ^~ $unsigned($unsigned(wire55))) : $unsigned(reg57)));
              reg64 <= $unsigned($signed((~(+reg45[(2'h3):(2'h3)]))));
              reg65 <= (wire30[(3'h7):(3'h5)] ?
                  (($signed($unsigned(reg35)) ?
                          ({reg36, wire51} ?
                              reg49 : reg47[(1'h1):(1'h0)]) : (!(|reg37))) ?
                      (reg48 ?
                          (^~(reg42 == wire51)) : $signed($unsigned(reg59))) : reg47[(3'h5):(3'h4)]) : (~|$signed((reg43[(2'h2):(1'h1)] ?
                      $signed(wire29) : (^(8'hba))))));
            end
          else
            begin
              reg63 <= (reg43[(1'h1):(1'h1)] ?
                  $signed($unsigned($signed(reg58[(1'h0):(1'h0)]))) : ((((wire34 ?
                              wire30 : reg57) == reg64) ?
                          reg36[(1'h0):(1'h0)] : $signed((reg40 ?
                              reg62 : reg63))) ?
                      (|{reg35[(3'h7):(3'h5)]}) : (+reg44[(3'h4):(1'h0)])));
              reg64 <= wire51[(2'h3):(1'h0)];
              reg65 <= (+reg35[(5'h10):(3'h7)]);
              reg66 <= {($signed((~reg45[(4'hb):(2'h3)])) && (~wire33[(3'h7):(2'h3)]))};
            end
          reg67 <= wire30;
        end
      else
        begin
          reg62 <= $signed((8'ha0));
          if ($unsigned($signed($unsigned($unsigned($signed(reg62))))))
            begin
              reg63 <= wire53;
              reg64 <= reg41[(3'h4):(3'h4)];
              reg65 <= (-(reg42[(4'h9):(2'h2)] != (7'h42)));
              reg66 <= (+{$signed(($signed((8'hbf)) ?
                      $signed((8'had)) : wire55)),
                  reg45[(5'h14):(4'hb)]});
            end
          else
            begin
              reg63 <= ($signed({wire55[(1'h0):(1'h0)],
                  reg60[(2'h2):(1'h1)]}) ^~ ((&{(wire51 ? reg64 : reg36),
                      {reg57, wire33}}) ?
                  reg42 : $signed(wire31[(3'h7):(3'h4)])));
              reg64 <= reg41[(2'h2):(1'h1)];
              reg65 <= (~{$signed(reg63), reg48});
              reg66 <= $unsigned((^{reg41}));
              reg67 <= ($signed({{$signed(reg50)},
                  ((8'h9d) ^~ (reg62 ?
                      reg64 : wire34))}) < wire54[(5'h14):(4'hc)]);
            end
        end
    end
  assign wire68 = wire46[(3'h4):(2'h3)];
endmodule
