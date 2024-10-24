module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1ae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire3;
  wire [(5'h15):(1'h0)] wire244;
  wire signed [(4'hc):(1'h0)] wire243;
  wire [(4'he):(1'h0)] wire242;
  wire [(2'h3):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire22;
  wire signed [(5'h15):(1'h0)] wire23;
  wire [(3'h4):(1'h0)] wire24;
  wire signed [(4'hb):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire26;
  wire [(4'hc):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire183;
  wire signed [(5'h15):(1'h0)] wire185;
  wire [(3'h4):(1'h0)] wire186;
  wire signed [(5'h10):(1'h0)] wire238;
  wire [(5'h11):(1'h0)] wire240;
  reg [(2'h2):(1'h0)] reg245 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg21 = (1'h0);
  assign y = {wire244,
                 wire243,
                 wire242,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire19,
                 wire20,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire183,
                 wire185,
                 wire186,
                 wire238,
                 wire240,
                 reg245,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg21,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = (wire1 >>> $signed({$signed((wire2 ? (8'h9d) : (8'haa))),
                     ((wire3 + wire1) ?
                         $unsigned(wire4) : wire4[(2'h2):(2'h2)])}));
  assign wire6 = $signed(wire5[(1'h1):(1'h1)]);
  assign wire7 = $signed(wire6[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      reg8 <= (^~$unsigned((wire7 ~^ (^$signed((8'ha7))))));
      if ((~$unsigned(wire3)))
        begin
          reg9 <= wire0;
        end
      else
        begin
          reg9 <= wire4[(2'h3):(2'h3)];
          reg10 <= {{{$unsigned((~|reg9)), $unsigned(wire4[(2'h2):(1'h0)])}},
              ({(!wire6[(3'h5):(2'h3)]), (^(wire0 ? reg9 : wire2))} ?
                  wire3 : ($unsigned((wire6 ? wire1 : wire5)) ?
                      ((~|wire4) <<< $signed(reg8)) : {wire3, wire5}))};
          reg11 <= wire5;
          if ($unsigned($signed(($signed(wire0[(4'h9):(3'h5)]) * (!((7'h40) || reg8))))))
            begin
              reg12 <= (!$signed(wire7[(4'ha):(3'h4)]));
              reg13 <= ((!((-{reg8}) ?
                      ((8'hae) ?
                          (reg11 ^ wire6) : $signed((8'ha3))) : {reg11})) ?
                  $signed((wire0[(4'h9):(1'h0)] ?
                      $signed($signed(reg11)) : (8'ha9))) : $unsigned(wire0[(4'he):(3'h4)]));
              reg14 <= $signed(wire2);
              reg15 <= (-$unsigned($signed(reg14)));
              reg16 <= ((~|wire4[(2'h3):(1'h1)]) ?
                  wire5 : {wire6[(3'h5):(3'h5)]});
            end
          else
            begin
              reg12 <= wire0[(3'h5):(1'h1)];
              reg13 <= ({(reg8[(5'h11):(4'ha)] ?
                      reg13 : ((reg11 ? wire6 : (7'h44)) < reg13)),
                  (!({reg16} ? {wire1} : reg16))} <<< (8'hb1));
              reg14 <= {((|(~&reg10[(4'he):(2'h3)])) || $unsigned(reg9)),
                  wire6[(3'h6):(3'h4)]};
              reg15 <= (!(&wire1[(4'h9):(1'h0)]));
            end
          reg17 <= reg16[(3'h5):(3'h4)];
        end
      reg18 <= (|($signed(wire3[(2'h2):(1'h1)]) >= (($signed(reg17) ?
          $unsigned(reg11) : {(7'h42)}) && (-reg16))));
    end
  assign wire19 = {{$signed({(wire0 > wire3), (reg8 ? (8'h9d) : reg17)}),
                          reg16[(1'h1):(1'h1)]},
                      wire2[(1'h1):(1'h0)]};
  assign wire20 = $unsigned(reg11);
  always
    @(posedge clk) begin
      reg21 <= reg18[(2'h3):(1'h1)];
    end
  assign wire22 = (((!$signed($signed(wire19))) ?
                          ((reg16 == $unsigned(reg9)) ?
                              {reg12[(2'h2):(2'h2)]} : (^wire20)) : reg16) ?
                      $signed({wire3}) : (8'hb7));
  assign wire23 = $signed(((!wire19) || wire5[(3'h5):(2'h3)]));
  assign wire24 = (reg11[(3'h5):(3'h4)] ?
                      ($unsigned($signed((wire0 ? reg15 : wire3))) ?
                          (reg18 ^ wire7[(4'he):(3'h5)]) : ({(8'ha4)} ?
                              (~^reg14[(1'h1):(1'h0)]) : ({wire19} ?
                                  {reg17,
                                      (8'hb2)} : $unsigned(wire5)))) : $signed(((reg14[(2'h3):(1'h1)] ?
                              (wire19 - reg16) : (!wire7)) ?
                          $signed($signed(wire5)) : ($signed((8'hbc)) ^ ((8'haf) + reg21)))));
  assign wire25 = ($unsigned((($unsigned(wire3) >>> (wire7 && reg14)) ?
                      {$signed(wire24)} : $unsigned(wire3))) ^ {(($signed(reg9) ^~ $unsigned(reg9)) >= wire20),
                      wire5[(2'h3):(2'h2)]});
  assign wire26 = $unsigned(wire22);
  assign wire27 = ((~^($unsigned(reg21) ?
                      (8'hbd) : $signed($signed(wire25)))) >= wire20[(4'hc):(3'h6)]);
  module28 #() modinst184 (wire183, clk, wire25, wire7, reg13, wire26, wire23);
  assign wire185 = reg18[(1'h0):(1'h0)];
  assign wire186 = ($unsigned((reg15[(2'h3):(1'h1)] >= (7'h44))) ~^ (^(($signed(wire25) <<< wire27) ?
                       (|wire22) : wire26[(4'h9):(3'h4)])));
  module187 #() modinst239 (.wire189(wire183), .wire188(wire3), .wire191(wire22), .y(wire238), .clk(clk), .wire190(wire26));
  module28 #() modinst241 (.wire32(reg9), .wire30(wire1), .wire29(wire26), .clk(clk), .wire33(reg8), .wire31(wire6), .y(wire240));
  assign wire242 = $signed($unsigned(wire19));
  assign wire243 = wire22;
  assign wire244 = ((-wire25[(4'h9):(3'h6)]) <<< (|reg15[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      reg245 <= reg12[(1'h1):(1'h1)];
    end
endmodule

module module187  (y, clk, wire191, wire190, wire189, wire188);
  output wire [(32'h205):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire191;
  input wire [(5'h11):(1'h0)] wire190;
  input wire signed [(3'h4):(1'h0)] wire189;
  input wire signed [(4'h9):(1'h0)] wire188;
  wire [(3'h4):(1'h0)] wire237;
  wire signed [(2'h3):(1'h0)] wire236;
  wire signed [(4'ha):(1'h0)] wire235;
  wire [(4'h8):(1'h0)] wire234;
  wire [(4'hd):(1'h0)] wire233;
  wire [(3'h7):(1'h0)] wire232;
  wire [(2'h3):(1'h0)] wire228;
  wire signed [(3'h6):(1'h0)] wire227;
  wire signed [(5'h15):(1'h0)] wire226;
  wire [(5'h12):(1'h0)] wire225;
  wire [(4'he):(1'h0)] wire224;
  wire signed [(4'hf):(1'h0)] wire223;
  wire signed [(2'h3):(1'h0)] wire222;
  wire signed [(4'hf):(1'h0)] wire193;
  wire signed [(3'h4):(1'h0)] wire192;
  reg signed [(4'hf):(1'h0)] reg231 = (1'h0);
  reg [(4'h9):(1'h0)] reg230 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg229 = (1'h0);
  reg [(4'h8):(1'h0)] reg221 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg220 = (1'h0);
  reg [(4'hf):(1'h0)] reg219 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg218 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg217 = (1'h0);
  reg [(5'h14):(1'h0)] reg216 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg215 = (1'h0);
  reg [(3'h4):(1'h0)] reg214 = (1'h0);
  reg [(3'h7):(1'h0)] reg213 = (1'h0);
  reg [(3'h6):(1'h0)] reg212 = (1'h0);
  reg [(4'hc):(1'h0)] reg211 = (1'h0);
  reg [(5'h10):(1'h0)] reg210 = (1'h0);
  reg [(4'hd):(1'h0)] reg209 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg208 = (1'h0);
  reg [(5'h11):(1'h0)] reg207 = (1'h0);
  reg signed [(4'he):(1'h0)] reg206 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg205 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg204 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg203 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg202 = (1'h0);
  reg [(5'h12):(1'h0)] reg201 = (1'h0);
  reg [(4'hf):(1'h0)] reg200 = (1'h0);
  reg signed [(4'he):(1'h0)] reg199 = (1'h0);
  reg [(5'h15):(1'h0)] reg198 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg197 = (1'h0);
  reg [(3'h7):(1'h0)] reg196 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg195 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg194 = (1'h0);
  assign y = {wire237,
                 wire236,
                 wire235,
                 wire234,
                 wire233,
                 wire232,
                 wire228,
                 wire227,
                 wire226,
                 wire225,
                 wire224,
                 wire223,
                 wire222,
                 wire193,
                 wire192,
                 reg231,
                 reg230,
                 reg229,
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
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 (1'h0)};
  assign wire192 = (wire189[(3'h4):(1'h0)] ?
                       $signed($signed(($unsigned(wire188) > (~&wire188)))) : $signed((-wire188)));
  assign wire193 = $unsigned((^~wire190[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg194 <= wire192;
      reg195 <= ((~&$signed($unsigned(wire191))) ?
          ((&wire192[(2'h3):(2'h3)]) | $signed(wire189[(1'h1):(1'h1)])) : ((&$unsigned(wire190[(3'h4):(2'h2)])) ?
              $signed(wire192[(3'h4):(1'h0)]) : ($signed($signed(wire191)) ?
                  wire193[(3'h7):(3'h4)] : $signed((wire189 * wire188)))));
      if ($signed((~^$unsigned(($unsigned(wire192) && $unsigned(wire193))))))
        begin
          if ((&wire191[(3'h6):(1'h0)]))
            begin
              reg196 <= $unsigned(wire191[(3'h4):(1'h1)]);
              reg197 <= wire190[(4'h9):(1'h1)];
              reg198 <= (reg195[(3'h6):(3'h5)] ?
                  wire188[(3'h4):(1'h0)] : (8'ha4));
              reg199 <= $unsigned($unsigned(wire190[(4'he):(4'ha)]));
              reg200 <= wire191;
            end
          else
            begin
              reg196 <= {({(8'hb6),
                      $unsigned(wire190)} == $unsigned(($signed(reg194) ^~ wire192[(2'h3):(1'h1)])))};
              reg197 <= $unsigned($unsigned((8'hae)));
              reg198 <= ($unsigned((^~($signed(reg199) ^~ $signed(wire188)))) >= reg200[(4'hf):(4'hf)]);
              reg199 <= {reg196[(3'h6):(2'h3)],
                  ((~$unsigned((~^wire191))) - $signed(wire192))};
              reg200 <= $unsigned((8'ha2));
            end
        end
      else
        begin
          reg196 <= {(wire188[(3'h6):(2'h2)] ?
                  (wire191 & wire188[(3'h5):(1'h0)]) : (((wire190 ?
                          wire191 : wire190) ?
                      reg199[(4'he):(3'h7)] : (wire189 ?
                          (8'h9f) : reg199)) ^ wire192)),
              wire190};
          reg197 <= $unsigned(wire193[(4'he):(4'h9)]);
          if ($unsigned((reg200 <= reg195[(2'h2):(1'h1)])))
            begin
              reg198 <= wire193;
            end
          else
            begin
              reg198 <= (^~reg196);
              reg199 <= ((|$signed((~{reg198,
                  wire190}))) || {{((-wire193) * reg195[(1'h1):(1'h1)])}});
              reg200 <= $signed($signed((wire193[(4'hb):(3'h5)] ?
                  reg199 : (-wire189[(2'h3):(2'h2)]))));
              reg201 <= wire188;
              reg202 <= reg201;
            end
          if (wire193[(3'h7):(3'h6)])
            begin
              reg203 <= (wire188[(4'h8):(3'h5)] && $unsigned($signed(((reg202 < reg198) ?
                  reg198[(4'h8):(2'h2)] : reg194[(4'hf):(4'hc)]))));
              reg204 <= $signed((wire190[(4'hd):(4'hb)] >= wire192));
              reg205 <= (({(~|$unsigned(reg203))} ?
                  (-$unsigned((reg199 ^~ reg204))) : $unsigned({{(8'hbd),
                          reg197}})) >> reg200[(4'he):(3'h7)]);
              reg206 <= ($signed(((~(wire191 ^~ wire191)) ?
                  $signed((^~wire192)) : (8'ha7))) || ($signed(((wire192 >>> (7'h43)) > reg201[(4'hb):(3'h6)])) ?
                  (8'ha3) : {$unsigned($signed(reg195))}));
            end
          else
            begin
              reg203 <= $signed(({reg199,
                  (~|(|reg194))} && $unsigned(((wire193 * (8'haf)) ?
                  (reg205 ? (8'hac) : reg195) : ((8'hb4) ? reg197 : reg199)))));
              reg204 <= $unsigned(reg201);
            end
          reg207 <= $unsigned(($signed((wire191 ?
                  (8'hb1) : (reg206 + reg206))) ?
              (~|reg200[(1'h0):(1'h0)]) : $signed((&(~reg202)))));
        end
      if ({(&(~&$signed((8'hbd))))})
        begin
          reg208 <= reg194;
          reg209 <= ((wire192[(2'h3):(2'h3)] & reg203[(2'h2):(1'h0)]) ?
              reg203 : $signed((({reg205} ?
                      (wire190 ? (8'hb3) : wire191) : ((8'ha2) ?
                          reg195 : reg199)) ?
                  $unsigned($signed(reg195)) : $unsigned((~reg200)))));
          reg210 <= (!reg205);
        end
      else
        begin
          reg208 <= $signed((reg208[(4'h8):(3'h6)] ?
              $unsigned(({wire191} <<< reg204[(4'he):(2'h2)])) : $signed({reg196[(3'h7):(2'h3)],
                  reg204})));
          if ((~(~$unsigned(($unsigned((8'h9f)) ?
              (reg196 ? wire188 : reg197) : {(8'hb3)})))))
            begin
              reg209 <= reg196[(1'h1):(1'h0)];
              reg210 <= (8'hac);
              reg211 <= wire190[(5'h10):(4'ha)];
              reg212 <= $unsigned($signed($signed($signed(wire191))));
              reg213 <= {{$unsigned($unsigned((reg204 ? wire192 : reg202)))},
                  (~&reg196[(3'h6):(3'h6)])};
            end
          else
            begin
              reg209 <= ($signed((^~$signed($unsigned(reg201)))) < $unsigned((|reg199)));
            end
          reg214 <= $signed(wire192);
          if (reg198)
            begin
              reg215 <= (reg213[(1'h1):(1'h1)] ?
                  (|(~reg206)) : reg195[(1'h0):(1'h0)]);
              reg216 <= ($signed((!((reg194 >> (8'h9f)) > reg195[(2'h3):(2'h3)]))) <= $unsigned(((reg214 < (reg212 || reg200)) ^~ $unsigned((wire191 | wire192)))));
              reg217 <= $signed(reg208[(1'h0):(1'h0)]);
            end
          else
            begin
              reg215 <= $signed((-reg211));
              reg216 <= reg208;
              reg217 <= reg209;
              reg218 <= $signed(reg208);
              reg219 <= $unsigned((~{{(8'h9d)}}));
            end
          reg220 <= {(reg214[(2'h2):(1'h0)] ?
                  ((8'ha3) + $unsigned((reg207 ?
                      (8'hbd) : (8'ha5)))) : (reg210 ?
                      $unsigned($signed(wire191)) : reg203)),
              (^~$signed({reg196[(3'h7):(3'h5)], reg204[(2'h2):(1'h1)]}))};
        end
      reg221 <= ($signed($unsigned(reg215[(2'h2):(2'h2)])) ?
          ((~|$unsigned(((8'ha8) >> reg218))) ^~ $signed(reg203)) : ($signed({((8'h9e) <<< reg212)}) != {(-$signed(reg219))}));
    end
  assign wire222 = $unsigned(reg220[(3'h4):(2'h2)]);
  assign wire223 = ($unsigned($unsigned($unsigned(reg212))) ?
                       {reg210[(4'he):(4'h9)]} : (!{(~wire192[(3'h4):(1'h1)])}));
  assign wire224 = $signed((!reg208));
  assign wire225 = $unsigned(reg209[(4'hc):(2'h2)]);
  assign wire226 = (((({reg215, wire193} <<< (reg211 ? (7'h41) : reg194)) ?
                           reg219[(3'h4):(1'h1)] : (8'hb1)) >> (8'hb5)) ?
                       $unsigned(wire222) : (~^reg211));
  assign wire227 = (((^~wire193[(3'h7):(3'h6)]) >> ($unsigned((8'hb5)) <<< ($signed(reg214) & (~wire189)))) | reg216);
  assign wire228 = (|$signed($signed(($unsigned(reg200) ?
                       $unsigned(reg210) : (|reg221)))));
  always
    @(posedge clk) begin
      reg229 <= (^~$signed($unsigned(reg204)));
      reg230 <= $unsigned(($unsigned(wire228[(1'h1):(1'h1)]) == (wire189 ^ wire226)));
      reg231 <= (({(reg208 ? (-reg201) : ((7'h43) ? (8'hb0) : (8'ha7)))} ?
          ($signed($unsigned((8'hb2))) || ((&(8'ha2)) ?
              (wire191 >= wire225) : {reg207, reg213})) : (|((reg195 ?
                  (8'h9f) : (7'h42)) ?
              $unsigned(wire222) : reg203))) | {$unsigned((((8'ha5) ?
                  wire222 : reg212) ?
              (reg221 * wire188) : reg205[(2'h2):(1'h1)]))});
    end
  assign wire232 = (((&((~reg221) ? $unsigned(wire225) : $unsigned(reg229))) ?
                           (8'hba) : reg204[(5'h10):(3'h6)]) ?
                       ((8'hb2) ?
                           $unsigned(($signed(reg212) <<< $signed((8'hb8)))) : $unsigned((!(7'h44)))) : reg209);
  assign wire233 = $unsigned((8'ha7));
  assign wire234 = reg210;
  assign wire235 = $unsigned(reg209);
  assign wire236 = $signed(reg202);
  assign wire237 = (~$signed($unsigned(wire235)));
endmodule

module module28
#(parameter param182 = (~&(|(!((~|(8'ha5)) - {(8'haf)})))))
(y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'h1e5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire33;
  input wire signed [(5'h13):(1'h0)] wire32;
  input wire signed [(5'h10):(1'h0)] wire31;
  input wire signed [(5'h10):(1'h0)] wire30;
  input wire [(4'hb):(1'h0)] wire29;
  wire [(4'h9):(1'h0)] wire180;
  wire [(2'h3):(1'h0)] wire147;
  wire [(4'hb):(1'h0)] wire146;
  wire [(4'hd):(1'h0)] wire144;
  wire signed [(5'h12):(1'h0)] wire143;
  wire [(5'h15):(1'h0)] wire142;
  wire signed [(4'hf):(1'h0)] wire118;
  wire signed [(4'hc):(1'h0)] wire117;
  wire [(5'h14):(1'h0)] wire116;
  wire [(3'h6):(1'h0)] wire115;
  wire signed [(4'hf):(1'h0)] wire113;
  wire signed [(3'h5):(1'h0)] wire90;
  wire signed [(5'h13):(1'h0)] wire88;
  reg [(4'h9):(1'h0)] reg145 = (1'h0);
  reg [(4'hb):(1'h0)] reg141 = (1'h0);
  reg [(4'ha):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg139 = (1'h0);
  reg [(5'h14):(1'h0)] reg138 = (1'h0);
  reg [(5'h10):(1'h0)] reg137 = (1'h0);
  reg [(3'h6):(1'h0)] reg136 = (1'h0);
  reg [(5'h12):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg134 = (1'h0);
  reg signed [(4'he):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg132 = (1'h0);
  reg [(5'h10):(1'h0)] reg131 = (1'h0);
  reg [(5'h12):(1'h0)] reg130 = (1'h0);
  reg [(5'h10):(1'h0)] reg129 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg124 = (1'h0);
  reg [(4'h9):(1'h0)] reg123 = (1'h0);
  reg [(5'h13):(1'h0)] reg122 = (1'h0);
  reg [(4'ha):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg119 = (1'h0);
  assign y = {wire180,
                 wire147,
                 wire146,
                 wire144,
                 wire143,
                 wire142,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire113,
                 wire90,
                 wire88,
                 reg145,
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
                 (1'h0)};
  module34 #() modinst89 (.wire36(wire33), .clk(clk), .wire38(wire30), .wire35(wire31), .y(wire88), .wire37(wire32));
  assign wire90 = wire32;
  module91 #() modinst114 (wire113, clk, wire33, wire88, wire29, wire31);
  assign wire115 = $signed($unsigned((wire32[(2'h3):(1'h1)] ~^ wire33)));
  assign wire116 = wire113[(3'h4):(1'h0)];
  assign wire117 = $signed(wire90[(2'h2):(1'h1)]);
  assign wire118 = (wire33 ? wire33 : wire29[(4'ha):(3'h4)]);
  always
    @(posedge clk) begin
      if (wire88)
        begin
          reg119 <= (wire88[(4'h9):(1'h1)] <= {$signed(($unsigned(wire116) == (wire118 == wire32))),
              $signed($unsigned((wire88 ? (8'haf) : wire118)))});
          reg120 <= (|wire90[(3'h4):(3'h4)]);
          reg121 <= {wire113};
        end
      else
        begin
          reg119 <= wire30;
          reg120 <= ((^$signed((~|wire118))) ?
              ((+reg120) ?
                  (~&wire117) : ((&wire32[(2'h3):(1'h0)]) > reg119[(5'h10):(4'he)])) : (~^wire118[(4'hd):(1'h1)]));
          if (wire115)
            begin
              reg121 <= wire118[(4'ha):(3'h4)];
              reg122 <= $signed(($signed(($signed(reg119) ?
                      wire117[(4'h8):(3'h5)] : (&wire90))) ?
                  ((^reg119) ?
                      $unsigned($unsigned(wire90)) : (wire32 + {wire88})) : {$unsigned((wire90 ?
                          wire31 : wire33))}));
              reg123 <= reg120[(4'h8):(3'h5)];
              reg124 <= (wire88[(4'he):(4'h8)] ?
                  wire113[(2'h2):(1'h0)] : reg122);
            end
          else
            begin
              reg121 <= (($unsigned(reg120[(3'h7):(1'h0)]) ?
                      (~|({reg120} ?
                          (|wire29) : (-reg122))) : ($unsigned({reg122,
                          (8'h9d)}) ~^ ((-reg120) != wire113))) ?
                  $signed(reg120) : reg123);
              reg122 <= reg123;
              reg123 <= $signed(wire33);
              reg124 <= (~&$signed(($unsigned($signed(reg121)) ?
                  reg120[(1'h0):(1'h0)] : reg123[(3'h6):(3'h4)])));
              reg125 <= (~|(((reg123[(3'h6):(2'h2)] ?
                  $unsigned(wire113) : $signed(wire33)) << {(reg119 < reg120)}) > (((+reg119) <= $signed(wire31)) * (~^wire117[(3'h6):(3'h6)]))));
            end
          reg126 <= wire30;
          reg127 <= $signed($signed($unsigned((8'hb0))));
        end
      reg128 <= {(^~$signed((+wire29[(3'h5):(1'h1)]))),
          (($unsigned($unsigned(reg126)) ?
                  wire29[(4'ha):(1'h1)] : (&$unsigned((8'h9e)))) ?
              reg122[(5'h13):(5'h11)] : $unsigned(wire31))};
      if ($unsigned(reg125))
        begin
          reg129 <= ((wire33 ~^ ($unsigned($signed(reg122)) <= ({reg126,
                  wire30} ?
              wire115 : $unsigned((8'hac))))) >> wire29[(4'hb):(3'h7)]);
          reg130 <= {(~^($unsigned({reg129, wire115}) ?
                  wire115 : wire32[(4'hc):(3'h4)])),
              reg122[(4'h8):(2'h2)]};
          if ($signed({reg130[(4'he):(3'h4)],
              (-(wire32[(5'h10):(4'hb)] || (wire32 ? wire116 : reg127)))}))
            begin
              reg131 <= $unsigned((8'hac));
              reg132 <= (8'hb7);
              reg133 <= ($signed(wire113[(4'hc):(3'h6)]) < reg119);
            end
          else
            begin
              reg131 <= $signed((-reg124[(4'hb):(4'h9)]));
              reg132 <= (^wire31[(2'h3):(2'h3)]);
              reg133 <= (reg125 || $unsigned($signed(reg121[(2'h3):(2'h2)])));
              reg134 <= ((8'ha0) && $unsigned(((~|(~&wire117)) ?
                  {(+reg128)} : reg129)));
            end
        end
      else
        begin
          if (reg128[(1'h1):(1'h1)])
            begin
              reg129 <= wire31;
              reg130 <= wire116[(2'h3):(2'h2)];
              reg131 <= ((wire90[(1'h1):(1'h1)] ?
                      ($signed({wire116, wire116}) ?
                          $unsigned(wire118[(3'h5):(1'h0)]) : (~^wire116[(4'h8):(3'h7)])) : ((8'hb9) ?
                          ({reg132, wire116} >= (|reg133)) : reg133)) ?
                  (8'h9e) : ((wire118[(3'h7):(3'h7)] >> (^(reg124 ~^ wire118))) ?
                      {reg129[(4'ha):(2'h3)],
                          (+$unsigned(wire33))} : (&$unsigned((wire88 <= reg125)))));
              reg132 <= (^wire31);
              reg133 <= (&(&reg134));
            end
          else
            begin
              reg129 <= {(reg127[(1'h0):(1'h0)] ?
                      {((reg122 ? reg134 : wire88) ?
                              (8'ha6) : (wire115 ? (8'hb1) : reg125)),
                          reg128[(2'h2):(2'h2)]} : (reg132 << wire32[(4'h9):(1'h0)]))};
            end
          reg134 <= (|(~^reg121));
          reg135 <= (wire118[(1'h1):(1'h1)] ?
              wire32[(4'h8):(1'h1)] : $unsigned(($unsigned((+wire113)) - ((wire115 | wire31) ?
                  (wire31 > wire117) : (&reg119)))));
        end
      if (($unsigned(((wire117[(2'h3):(2'h3)] >= (&wire118)) == $signed($signed((8'ha4))))) ?
          (^~({(8'hb8), (reg129 < reg122)} <<< wire115)) : wire33))
        begin
          reg136 <= reg127[(2'h2):(1'h0)];
          if ((!reg123[(2'h2):(2'h2)]))
            begin
              reg137 <= (&(&reg127));
            end
          else
            begin
              reg137 <= reg137[(2'h3):(2'h3)];
              reg138 <= reg121;
              reg139 <= (|$unsigned((((reg123 - reg121) == $unsigned(reg128)) ?
                  {reg129} : (!(~|wire90)))));
              reg140 <= reg125[(3'h4):(3'h4)];
              reg141 <= reg137;
            end
        end
      else
        begin
          if (reg124)
            begin
              reg136 <= reg135[(4'hc):(2'h3)];
              reg137 <= $unsigned(((reg133 <<< (~^(reg124 - reg124))) ?
                  $unsigned($unsigned($unsigned(reg133))) : $unsigned({reg124[(4'h8):(4'h8)]})));
              reg138 <= (!(wire90 - reg138));
              reg139 <= wire88[(3'h6):(1'h1)];
              reg140 <= $signed(reg136);
            end
          else
            begin
              reg136 <= (~^$signed($signed({wire113[(3'h5):(2'h2)],
                  wire115[(3'h6):(1'h0)]})));
              reg137 <= reg125;
            end
          reg141 <= wire116;
        end
    end
  assign wire142 = ($signed({{(wire88 ? wire32 : wire90), (~wire116)},
                       wire115}) * reg126);
  assign wire143 = ($unsigned(({$unsigned(reg138), $unsigned(reg135)} ?
                           ((reg128 == reg138) == (reg126 == (8'hb2))) : ($signed(wire32) ?
                               wire116 : (reg125 <= reg135)))) ?
                       (~&$signed($unsigned($signed((8'hb5))))) : $unsigned(($signed((reg126 ?
                           (8'hb9) : reg126)) * (|reg139[(1'h1):(1'h1)]))));
  assign wire144 = ((8'hb2) ?
                       ((~&(|$unsigned(reg126))) ?
                           reg138 : ($signed($signed((7'h44))) ?
                               reg127 : wire115)) : (~|$unsigned($signed($signed(reg133)))));
  always
    @(posedge clk) begin
      reg145 <= $signed($signed(reg137[(2'h3):(2'h3)]));
    end
  assign wire146 = reg128;
  assign wire147 = $signed($signed(reg138));
  module148 #() modinst181 (.wire149(wire113), .y(wire180), .wire152(reg137), .wire150(wire32), .clk(clk), .wire151(reg127));
endmodule

module module148
#(parameter param179 = ((((((8'hb1) ? (8'ha2) : (8'haf)) | ((8'hb0) <<< (8'hb3))) ? {{(8'hb1), (8'ha3)}, (~(7'h43))} : (~&{(8'hbf), (8'haf)})) & ((&(8'ha4)) <= {((8'h9d) ? (8'h9e) : (8'hb4))})) ? (8'hb5) : (((~^(-(8'ha2))) ? (((8'ha3) < (8'hb8)) <<< ((8'haa) ? (8'ha9) : (8'hab))) : (+{(8'ha6), (8'hb7)})) ? (((~^(8'hbb)) ? {(8'ha9), (8'hb7)} : {(8'ha4), (8'hb5)}) ? (((8'hb0) ? (8'hbf) : (8'ha2)) ? ((8'hae) ? (8'hb1) : (7'h40)) : (-(8'hb0))) : (((8'h9d) ? (8'hb5) : (8'hbc)) ^ ((8'hbc) * (8'hba)))) : (|(~((8'h9d) & (8'ha0)))))))
(y, clk, wire152, wire151, wire150, wire149);
  output wire [(32'h13d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire152;
  input wire signed [(5'h14):(1'h0)] wire151;
  input wire [(4'ha):(1'h0)] wire150;
  input wire [(4'hd):(1'h0)] wire149;
  wire signed [(5'h12):(1'h0)] wire178;
  wire [(5'h12):(1'h0)] wire177;
  wire [(4'hc):(1'h0)] wire171;
  wire [(2'h3):(1'h0)] wire155;
  wire signed [(5'h15):(1'h0)] wire154;
  wire [(3'h5):(1'h0)] wire153;
  reg [(5'h15):(1'h0)] reg176 = (1'h0);
  reg [(2'h2):(1'h0)] reg175 = (1'h0);
  reg [(5'h14):(1'h0)] reg174 = (1'h0);
  reg [(2'h2):(1'h0)] reg173 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg172 = (1'h0);
  reg [(4'h8):(1'h0)] reg170 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg169 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg168 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg167 = (1'h0);
  reg [(4'hc):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg165 = (1'h0);
  reg [(4'hd):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg163 = (1'h0);
  reg [(5'h10):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg161 = (1'h0);
  reg [(5'h12):(1'h0)] reg160 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg159 = (1'h0);
  reg [(5'h15):(1'h0)] reg158 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg156 = (1'h0);
  assign y = {wire178,
                 wire177,
                 wire171,
                 wire155,
                 wire154,
                 wire153,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
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
                 (1'h0)};
  assign wire153 = (8'hb8);
  assign wire154 = wire151[(3'h5):(2'h2)];
  assign wire155 = (&wire149);
  always
    @(posedge clk) begin
      reg156 <= (+(($unsigned($unsigned((8'hb1))) ?
              wire149 : wire153[(1'h1):(1'h1)]) ?
          wire151 : wire155[(1'h0):(1'h0)]));
      reg157 <= $unsigned($unsigned(wire150));
      if ($unsigned($signed($signed((~&((8'ha8) ^~ wire153))))))
        begin
          if (((reg157 && $unsigned(($signed(wire153) == (8'hb7)))) ?
              $signed(wire153) : (~^wire152[(4'hf):(3'h5)])))
            begin
              reg158 <= (+wire153);
              reg159 <= (~((~^(wire155 ^~ $unsigned((8'h9e)))) ?
                  reg156[(3'h4):(1'h1)] : $signed($unsigned((wire149 && wire152)))));
              reg160 <= (wire152 <<< reg157[(3'h5):(3'h5)]);
            end
          else
            begin
              reg158 <= reg157;
              reg159 <= {wire155[(1'h1):(1'h1)]};
              reg160 <= $unsigned($unsigned((~|($signed(reg158) ?
                  wire154[(3'h4):(3'h4)] : wire150))));
            end
          if (((~|$unsigned(wire154[(5'h15):(3'h7)])) ?
              ((^wire154) ?
                  {$unsigned({wire150}),
                      wire151[(5'h10):(4'h9)]} : (^wire149)) : ({(-(reg159 == wire155))} <<< ((!(wire152 ?
                      reg157 : wire150)) ?
                  $signed($unsigned(wire152)) : (wire155 ?
                      reg157[(1'h1):(1'h1)] : (reg159 < reg156))))))
            begin
              reg161 <= wire151[(4'hd):(4'hb)];
              reg162 <= $signed((wire154[(2'h2):(1'h0)] ?
                  (&(-(reg159 == wire152))) : (|(wire154 ?
                      (wire154 ? wire150 : wire153) : (reg158 ?
                          wire150 : wire153)))));
              reg163 <= $signed(wire153[(1'h1):(1'h0)]);
              reg164 <= wire155[(2'h2):(1'h1)];
              reg165 <= (&$unsigned(wire153[(1'h0):(1'h0)]));
            end
          else
            begin
              reg161 <= reg156;
              reg162 <= ((~&reg157) >> $unsigned(reg163));
              reg163 <= wire150;
              reg164 <= $signed($unsigned($signed(($unsigned(wire149) ?
                  (wire149 ? reg156 : reg160) : reg159))));
            end
          if (reg158[(3'h5):(3'h5)])
            begin
              reg166 <= (-({reg157[(1'h1):(1'h1)]} && ($unsigned((reg160 ?
                  (8'ha5) : reg160)) == {reg163})));
              reg167 <= wire154[(3'h4):(1'h1)];
            end
          else
            begin
              reg166 <= reg164;
            end
          reg168 <= (-(((reg163[(5'h12):(4'ha)] ?
                  wire152[(4'hf):(4'ha)] : reg160[(5'h12):(4'hd)]) <= (((7'h41) ?
                      wire151 : (7'h41)) ?
                  reg160 : (reg163 ? reg159 : wire153))) ?
              (!$signed((reg158 ? (8'ha9) : wire152))) : wire149));
        end
      else
        begin
          reg158 <= {reg163};
          reg159 <= {reg165};
          reg160 <= (~&reg157);
          reg161 <= (reg157[(3'h4):(1'h1)] != (~&reg159));
        end
      reg169 <= ((reg160[(4'h8):(1'h0)] ^~ {{wire150[(3'h7):(3'h4)]},
          wire152}) || $unsigned($unsigned(wire155)));
      reg170 <= ({$unsigned((~(reg161 ? reg165 : wire153)))} >>> {reg166,
          ($unsigned($unsigned(reg168)) == wire151[(4'h9):(3'h7)])});
    end
  assign wire171 = $signed(((wire155[(1'h1):(1'h0)] <<< (-$signed(reg167))) ?
                       (~&wire153[(3'h4):(2'h3)]) : reg165[(3'h7):(3'h5)]));
  always
    @(posedge clk) begin
      if ((($unsigned((!(8'ha0))) ?
          $unsigned($signed((^wire150))) : reg161[(1'h0):(1'h0)]) << $signed(wire150[(4'h8):(3'h5)])))
        begin
          reg172 <= $unsigned(reg165[(4'hc):(1'h0)]);
        end
      else
        begin
          if (wire171[(4'hb):(4'hb)])
            begin
              reg172 <= reg163;
              reg173 <= $unsigned((reg169 ?
                  ((~^$unsigned(wire155)) ?
                      reg170 : {wire155[(1'h0):(1'h0)]}) : (reg158 ^ ((reg170 ?
                          wire154 : reg169) ?
                      reg164 : reg165[(4'hb):(3'h5)]))));
              reg174 <= reg172;
              reg175 <= reg167;
              reg176 <= $unsigned($signed(((-reg161) - ((~&reg170) & (reg156 ?
                  reg174 : reg159)))));
            end
          else
            begin
              reg172 <= $unsigned($signed((reg165 ?
                  ((reg160 == reg168) || (reg159 - wire171)) : $unsigned((wire171 ?
                      wire152 : reg167)))));
              reg173 <= $signed($unsigned(reg159[(4'he):(2'h3)]));
              reg174 <= {reg162[(3'h7):(3'h6)], reg169[(3'h7):(2'h3)]};
              reg175 <= reg160[(4'h8):(3'h6)];
            end
        end
    end
  assign wire177 = reg173;
  assign wire178 = reg162;
endmodule

module module91  (y, clk, wire95, wire94, wire93, wire92);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire95;
  input wire [(5'h13):(1'h0)] wire94;
  input wire [(2'h2):(1'h0)] wire93;
  input wire [(5'h10):(1'h0)] wire92;
  wire signed [(4'hb):(1'h0)] wire112;
  wire signed [(4'hf):(1'h0)] wire111;
  wire [(5'h10):(1'h0)] wire110;
  wire signed [(4'he):(1'h0)] wire106;
  wire [(4'hd):(1'h0)] wire105;
  wire [(5'h15):(1'h0)] wire104;
  wire [(5'h10):(1'h0)] wire96;
  reg [(5'h10):(1'h0)] reg109 = (1'h0);
  reg [(4'h9):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg103 = (1'h0);
  reg [(4'hb):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg101 = (1'h0);
  reg [(2'h3):(1'h0)] reg100 = (1'h0);
  reg [(4'hb):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg98 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg97 = (1'h0);
  assign y = {wire112,
                 wire111,
                 wire110,
                 wire106,
                 wire105,
                 wire104,
                 wire96,
                 reg109,
                 reg108,
                 reg107,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 (1'h0)};
  assign wire96 = wire92[(4'hf):(4'hb)];
  always
    @(posedge clk) begin
      reg97 <= $unsigned($unsigned(wire93[(1'h0):(1'h0)]));
      reg98 <= wire95;
      if ($unsigned((!reg97[(2'h2):(1'h0)])))
        begin
          reg99 <= (reg97[(4'h9):(4'h9)] ?
              (^(&(8'hbc))) : (reg98 <<< (|$signed(reg98[(3'h4):(2'h3)]))));
          reg100 <= $signed((~|wire95));
          reg101 <= ((^~wire96[(4'ha):(3'h7)]) ?
              (~|(|wire96[(3'h4):(1'h1)])) : $unsigned((~^$signed((wire93 ?
                  (8'hb8) : reg98)))));
          reg102 <= (8'ha5);
          reg103 <= (8'ha9);
        end
      else
        begin
          if ($signed((!($signed((reg102 ? (7'h43) : (8'hbe))) ?
              wire93 : ($unsigned(reg98) ?
                  (wire93 ? reg101 : reg99) : (-wire95))))))
            begin
              reg99 <= {((((wire93 ? wire93 : wire96) ?
                              (8'haa) : reg98[(1'h1):(1'h0)]) ?
                          (wire93 ^ (reg97 ?
                              wire93 : wire92)) : (+wire95[(1'h0):(1'h0)])) ?
                      (8'hbf) : {((reg101 >>> reg100) ?
                              {reg98, reg100} : (~|reg97))}),
                  $unsigned(((|$unsigned(reg100)) - reg99[(4'h9):(1'h1)]))};
              reg100 <= (~|$signed(((((8'ha6) ?
                  reg97 : wire92) >>> reg98[(4'hb):(3'h5)]) << {wire93[(1'h1):(1'h1)],
                  ((8'ha0) ? wire95 : reg102)})));
              reg101 <= (~|(-(+$unsigned(wire93[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg99 <= $signed(wire94);
              reg100 <= reg103;
            end
          reg102 <= $unsigned(((^(&((8'hb0) ?
              reg103 : reg100))) && (+$unsigned((^reg101)))));
        end
    end
  assign wire104 = wire93;
  assign wire105 = ((wire104 ?
                       (((wire104 ? wire93 : (8'hab)) ?
                           (8'hb8) : reg102[(3'h7):(2'h2)]) << {(&wire94),
                           (wire93 ?
                               reg102 : wire92)}) : (((wire96 || wire95) | reg103) ?
                           ($unsigned((8'hb7)) ?
                               (reg101 < wire104) : (reg97 ?
                                   wire93 : reg99)) : (^(wire96 ?
                               reg97 : wire96)))) || {(((reg102 >> reg97) & $signed(reg100)) ^ ({reg103} ?
                           {wire94, (8'haf)} : wire95[(3'h4):(3'h4)])),
                       reg102});
  assign wire106 = wire96;
  always
    @(posedge clk) begin
      reg107 <= wire96;
      reg108 <= (~|$unsigned(reg102));
      reg109 <= (({$signed($unsigned(wire92))} ?
              $signed(((wire106 <<< wire94) ?
                  wire96 : reg98[(4'h8):(1'h1)])) : (((~&reg102) ?
                      $unsigned(reg107) : (reg98 ? wire94 : reg97)) ?
                  (((8'hb1) <<< reg99) ?
                      reg100 : (wire94 ?
                          (8'hbc) : (8'ha1))) : $signed($unsigned(wire105)))) ?
          reg101 : {{(7'h44), (~&$unsigned(wire106))}});
    end
  assign wire110 = (~^(wire94[(4'h8):(1'h0)] || reg100));
  assign wire111 = ((+$unsigned({$unsigned(wire105)})) > $unsigned(($signed({wire106,
                       reg107}) - reg99[(3'h6):(2'h2)])));
  assign wire112 = reg103[(1'h0):(1'h0)];
endmodule

module module34
#(parameter param87 = ((~({((8'hb6) ? (8'hae) : (8'haa)), ((7'h41) != (8'hb4))} >> {((8'hbf) > (7'h44))})) ? (8'hb2) : (((!(|(8'had))) ? ((~|(8'ha6)) ~^ ((8'h9e) | (8'ha7))) : (8'hb3)) ? ((((8'ha5) ? (8'ha5) : (8'h9d)) ? ((8'hb0) ? (8'hb3) : (8'h9d)) : {(8'ha1), (8'ha2)}) ? (8'ha2) : {((8'hb4) <<< (8'hb1)), (|(8'hb6))}) : (((~(7'h41)) <<< (8'h9c)) ? (((7'h42) ? (8'ha3) : (8'ha9)) && ((8'hb4) | (8'h9c))) : ((^(8'ha8)) >= (+(7'h40)))))))
(y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'h250):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire38;
  input wire signed [(4'he):(1'h0)] wire37;
  input wire signed [(3'h6):(1'h0)] wire36;
  input wire signed [(5'h10):(1'h0)] wire35;
  wire [(2'h2):(1'h0)] wire86;
  wire [(5'h13):(1'h0)] wire69;
  wire [(3'h5):(1'h0)] wire68;
  wire signed [(4'ha):(1'h0)] wire67;
  wire signed [(4'he):(1'h0)] wire66;
  wire [(4'he):(1'h0)] wire65;
  wire [(4'hf):(1'h0)] wire55;
  wire [(4'h8):(1'h0)] wire54;
  wire signed [(4'hc):(1'h0)] wire53;
  wire signed [(4'hd):(1'h0)] wire52;
  wire signed [(3'h4):(1'h0)] wire51;
  wire signed [(4'ha):(1'h0)] wire50;
  wire [(4'ha):(1'h0)] wire49;
  wire signed [(5'h11):(1'h0)] wire48;
  wire signed [(4'hd):(1'h0)] wire47;
  wire signed [(3'h6):(1'h0)] wire46;
  wire [(4'h9):(1'h0)] wire45;
  wire [(3'h6):(1'h0)] wire44;
  wire [(3'h6):(1'h0)] wire43;
  wire signed [(5'h15):(1'h0)] wire42;
  reg signed [(4'hd):(1'h0)] reg85 = (1'h0);
  reg [(5'h14):(1'h0)] reg84 = (1'h0);
  reg [(5'h10):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg82 = (1'h0);
  reg signed [(4'he):(1'h0)] reg81 = (1'h0);
  reg [(3'h6):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg76 = (1'h0);
  reg [(5'h10):(1'h0)] reg75 = (1'h0);
  reg [(5'h11):(1'h0)] reg74 = (1'h0);
  reg [(4'ha):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg72 = (1'h0);
  reg [(4'hc):(1'h0)] reg71 = (1'h0);
  reg [(4'he):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg [(4'hb):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg56 = (1'h0);
  reg [(5'h13):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg40 = (1'h0);
  reg [(5'h15):(1'h0)] reg39 = (1'h0);
  assign y = {wire86,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 reg85,
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
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg39 <= wire36[(1'h0):(1'h0)];
      reg40 <= ($signed((reg39 >> $signed((wire37 ^ wire36)))) ?
          ((((reg39 ?
                  wire36 : wire36) | $signed(wire36)) ^ $unsigned($signed(reg39))) ?
              (((wire35 <<< reg39) ^ (reg39 <= (8'ha6))) << $signed(wire36)) : (reg39[(5'h11):(5'h11)] ?
                  ((8'hb3) ?
                      $unsigned(wire35) : (reg39 >> (7'h40))) : (wire35 ^ reg39[(4'h8):(2'h3)]))) : (-{wire36[(3'h6):(1'h0)],
              reg39}));
      reg41 <= (8'hb6);
    end
  assign wire42 = (wire36 ?
                      (($unsigned({(7'h43)}) ^~ (8'hb0)) == $signed((~^$unsigned(wire37)))) : reg40);
  assign wire43 = $signed($unsigned(reg39[(4'hd):(4'h8)]));
  assign wire44 = (wire35[(3'h5):(1'h1)] ?
                      (reg39[(3'h5):(3'h5)] ?
                          (&reg40) : $signed($unsigned(reg40[(1'h0):(1'h0)]))) : wire37);
  assign wire45 = $signed($unsigned((~^((wire42 && (8'h9f)) ?
                      (+(8'haa)) : $unsigned((8'hae))))));
  assign wire46 = (-($unsigned($signed(wire35[(3'h5):(1'h0)])) >>> {(~^{reg39,
                          wire44}),
                      $signed(wire44)}));
  assign wire47 = ($unsigned($signed((^(wire43 ?
                      (8'hac) : reg40)))) == $unsigned(wire45[(2'h3):(2'h2)]));
  assign wire48 = {$unsigned($signed(($signed(wire36) ?
                          ((8'hb4) ? reg41 : wire43) : (wire46 ?
                              wire43 : wire46)))),
                      reg41};
  assign wire49 = ($signed($unsigned(((wire42 ?
                      (8'ha7) : wire48) == wire44[(1'h0):(1'h0)]))) + ($signed($signed(wire38[(2'h2):(2'h2)])) ?
                      (wire46 ~^ reg40) : wire48));
  assign wire50 = $unsigned((+$signed((reg39[(3'h7):(3'h4)] ?
                      $unsigned((8'ha7)) : $unsigned(reg41)))));
  assign wire51 = $signed($signed({$signed(wire49)}));
  assign wire52 = (8'hbd);
  assign wire53 = (~|$unsigned($unsigned($signed(wire37))));
  assign wire54 = (wire46 - wire51[(1'h0):(1'h0)]);
  assign wire55 = $unsigned((+$unsigned(wire36)));
  always
    @(posedge clk) begin
      reg56 <= wire36[(2'h2):(1'h1)];
      reg57 <= (!($signed(wire36[(1'h0):(1'h0)]) ?
          wire38 : $signed($signed(wire42))));
      if (((($signed($signed(wire45)) >> $unsigned((wire51 <<< wire53))) ?
          wire44[(3'h5):(3'h5)] : wire54) - (~&(((wire55 ? wire42 : wire47) ?
          (wire50 <= wire48) : $unsigned(wire37)) & wire51[(2'h3):(2'h3)]))))
        begin
          reg58 <= {((&wire53[(4'h9):(3'h5)]) ?
                  ((wire52 ~^ {reg39,
                      wire44}) ~^ wire44) : $unsigned({(8'hbc)})),
              wire38[(3'h6):(3'h5)]};
          if (wire43[(2'h3):(1'h0)])
            begin
              reg59 <= {$unsigned(wire43)};
              reg60 <= $signed(($signed(reg56) == (~$unsigned({(8'ha5),
                  wire42}))));
            end
          else
            begin
              reg59 <= (8'h9f);
            end
        end
      else
        begin
          if ((&reg59))
            begin
              reg58 <= $unsigned(wire42);
              reg59 <= ((8'hac) ?
                  $signed((reg58 ?
                      $signed((reg58 ?
                          wire51 : wire38)) : $signed(reg59))) : wire45[(4'h9):(1'h1)]);
              reg60 <= (wire53 ?
                  {({(|wire37),
                          ((8'ha2) ?
                              wire38 : wire44)} <<< reg39[(4'h9):(2'h2)])} : (wire55[(4'hb):(2'h3)] & $signed(reg40[(3'h4):(1'h1)])));
            end
          else
            begin
              reg58 <= {wire42[(4'h9):(3'h7)],
                  ((~|(reg41 ?
                      (^(8'h9d)) : wire53[(3'h4):(1'h1)])) ~^ reg58[(3'h4):(3'h4)])};
              reg59 <= $signed(wire54);
              reg60 <= $signed(wire51[(2'h3):(2'h2)]);
              reg61 <= (!wire36[(2'h3):(2'h3)]);
            end
          reg62 <= ($unsigned(($unsigned(wire37[(3'h6):(1'h1)]) ?
              (wire43 - wire37[(2'h2):(1'h0)]) : $signed((^reg58)))) ~^ (~^$unsigned((-$signed(wire45)))));
        end
      reg63 <= $signed(($signed($unsigned(reg56[(2'h3):(1'h0)])) ?
          $unsigned(($unsigned(wire43) ?
              (^reg56) : (wire44 ? wire52 : wire37))) : wire53));
      reg64 <= ($signed($signed($unsigned($unsigned(reg58)))) != reg61);
    end
  assign wire65 = (reg58[(1'h0):(1'h0)] < (wire47 ?
                      (((^wire53) ?
                          $unsigned(wire35) : $unsigned(wire48)) & wire42[(4'he):(3'h5)]) : $unsigned($unsigned((reg56 ^ reg59)))));
  assign wire66 = wire46[(1'h0):(1'h0)];
  assign wire67 = (8'h9e);
  assign wire68 = $unsigned((^{$unsigned((^~wire37)),
                      $unsigned(wire55[(4'hd):(3'h5)])}));
  assign wire69 = (^wire66);
  always
    @(posedge clk) begin
      if ($signed($signed($signed(wire42))))
        begin
          if (reg62[(2'h2):(1'h0)])
            begin
              reg70 <= wire50;
              reg71 <= wire43[(2'h3):(2'h3)];
              reg72 <= reg70[(4'hc):(4'h9)];
            end
          else
            begin
              reg70 <= (~$signed(((~^(reg41 >= (8'hbc))) >>> wire53[(4'ha):(1'h1)])));
              reg71 <= $unsigned({({(reg63 ~^ reg70), ((8'h9c) + wire42)} ?
                      $signed(reg70[(4'hb):(3'h4)]) : reg39[(5'h15):(1'h0)])});
            end
          if (({(^wire53), (reg59 - (wire35 <= wire44))} ?
              $signed($unsigned({(8'hae),
                  ((8'hb1) ? wire68 : reg60)})) : ({{$signed(reg71),
                      wire65}} || $unsigned((reg61 ?
                  (wire48 ^~ wire47) : $signed(reg70))))))
            begin
              reg73 <= wire68;
              reg74 <= (((~&(reg56 ? $unsigned(wire65) : $unsigned(wire45))) ?
                      (7'h40) : (~^($unsigned(wire65) ?
                          $unsigned(reg58) : $signed(wire44)))) ?
                  $signed((~|(!{wire65, reg59}))) : wire42);
              reg75 <= (reg41[(4'hd):(2'h2)] && (wire48[(2'h2):(1'h0)] != wire48));
              reg76 <= wire47;
            end
          else
            begin
              reg73 <= $unsigned((^$signed((wire67 ?
                  ((8'h9e) ? reg58 : wire51) : {reg57, reg41}))));
              reg74 <= $unsigned(reg73[(1'h0):(1'h0)]);
              reg75 <= $unsigned($signed(reg76[(3'h4):(1'h0)]));
              reg76 <= $signed((($signed((8'hbb)) ?
                  (|(wire53 ? wire65 : wire48)) : ((7'h43) ?
                      (~&wire45) : (wire36 <<< reg74))) || wire44));
              reg77 <= $unsigned($signed(reg76[(4'hc):(2'h2)]));
            end
          reg78 <= reg71[(3'h5):(1'h0)];
          if ((wire38 ?
              ({reg57, $signed(wire37)} ?
                  ({$signed(wire69), $unsigned(reg78)} ?
                      (&$signed(reg72)) : wire49[(1'h0):(1'h0)]) : (reg40[(3'h4):(2'h3)] ?
                      reg76 : $unsigned(wire35))) : ({$signed($signed(reg64))} | $signed(($unsigned(reg74) != reg74[(4'hd):(3'h5)])))))
            begin
              reg79 <= {(&reg71),
                  (~($signed($signed((8'hb4))) <= (^~(reg57 <<< reg40))))};
            end
          else
            begin
              reg79 <= $unsigned({($signed((~|(8'ha2))) ?
                      wire47[(2'h2):(2'h2)] : $unsigned({wire53})),
                  {$unsigned($signed(wire37))}});
              reg80 <= (|((((~&reg56) * $unsigned(wire68)) ?
                  wire45 : ((8'h9f) <= $signed(wire54))) | (wire51 ?
                  $signed(wire65[(4'ha):(2'h3)]) : {$signed(wire47),
                      (wire47 == (8'hb9))})));
              reg81 <= (({$unsigned(wire46[(3'h4):(2'h2)])} << wire50[(3'h4):(1'h0)]) >>> ((((8'ha0) * reg57) ?
                  (^((8'hb1) * reg60)) : $signed((reg39 & reg80))) > (reg62 ?
                  wire48[(4'hc):(4'h8)] : (&$unsigned(wire55)))));
            end
          if (($signed(reg73) >= ($unsigned(wire38[(2'h2):(1'h0)]) | $unsigned(($unsigned(reg71) ?
              (wire38 ? wire38 : wire36) : {wire50})))))
            begin
              reg82 <= ((reg60[(3'h4):(1'h1)] & ({(wire53 > wire46)} * $signed($signed(wire46)))) ?
                  (+(reg59 != ((7'h44) ?
                      $unsigned(reg63) : (reg41 >>> reg40)))) : ((&wire36) ?
                      (wire54[(3'h5):(3'h4)] != $unsigned(wire69)) : wire66));
              reg83 <= {{(+reg40[(4'h9):(4'h8)])},
                  $unsigned({$signed((-wire66)), $signed($unsigned(wire45))})};
            end
          else
            begin
              reg82 <= (~wire54[(2'h2):(1'h1)]);
              reg83 <= $signed(((((reg60 ?
                      reg58 : (7'h42)) <<< $signed(reg70)) == $signed({reg83,
                      reg64})) ?
                  wire42 : ((+{reg56, (8'hbb)}) - $signed($signed(wire50)))));
              reg84 <= wire54[(2'h2):(2'h2)];
              reg85 <= $signed(reg80[(3'h5):(3'h4)]);
            end
        end
      else
        begin
          reg70 <= {$unsigned(($signed((wire54 ? (8'h9e) : reg77)) ?
                  $signed((wire37 ? wire50 : wire44)) : (^$signed(reg82))))};
          reg71 <= $unsigned(wire47);
        end
    end
  assign wire86 = ($signed(wire69) ? reg85 : (~|reg58));
endmodule
