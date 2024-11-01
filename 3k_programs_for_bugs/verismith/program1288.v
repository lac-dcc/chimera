module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h23d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire [(3'h7):(1'h0)] wire238;
  wire [(2'h2):(1'h0)] wire219;
  wire signed [(5'h11):(1'h0)] wire218;
  wire [(3'h6):(1'h0)] wire216;
  wire signed [(5'h11):(1'h0)] wire215;
  wire signed [(5'h10):(1'h0)] wire214;
  wire [(3'h4):(1'h0)] wire197;
  wire signed [(5'h11):(1'h0)] wire195;
  wire [(5'h12):(1'h0)] wire194;
  wire signed [(2'h2):(1'h0)] wire193;
  wire signed [(5'h15):(1'h0)] wire191;
  wire signed [(4'hc):(1'h0)] wire49;
  wire [(5'h14):(1'h0)] wire47;
  wire signed [(4'ha):(1'h0)] wire221;
  wire [(5'h10):(1'h0)] wire222;
  wire signed [(3'h5):(1'h0)] wire234;
  wire signed [(5'h15):(1'h0)] wire235;
  wire signed [(5'h13):(1'h0)] wire236;
  reg [(5'h10):(1'h0)] reg233 = (1'h0);
  reg [(4'ha):(1'h0)] reg232 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg231 = (1'h0);
  reg [(3'h4):(1'h0)] reg230 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg229 = (1'h0);
  reg [(5'h12):(1'h0)] reg228 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg227 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg226 = (1'h0);
  reg [(5'h15):(1'h0)] reg225 = (1'h0);
  reg [(3'h5):(1'h0)] reg224 = (1'h0);
  reg [(2'h2):(1'h0)] reg223 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg198 = (1'h0);
  reg [(5'h13):(1'h0)] reg199 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg200 = (1'h0);
  reg [(4'he):(1'h0)] reg201 = (1'h0);
  reg [(4'hb):(1'h0)] reg202 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg203 = (1'h0);
  reg [(4'h9):(1'h0)] reg204 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg205 = (1'h0);
  reg [(4'h9):(1'h0)] reg206 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg207 = (1'h0);
  reg [(4'h8):(1'h0)] reg208 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg209 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg210 = (1'h0);
  reg [(5'h13):(1'h0)] reg211 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg212 = (1'h0);
  reg [(5'h15):(1'h0)] reg213 = (1'h0);
  assign y = {wire238,
                 wire219,
                 wire218,
                 wire216,
                 wire215,
                 wire214,
                 wire197,
                 wire195,
                 wire194,
                 wire193,
                 wire191,
                 wire49,
                 wire47,
                 wire221,
                 wire222,
                 wire234,
                 wire235,
                 wire236,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
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
                 (1'h0)};
  module5 #() modinst48 (wire47, clk, wire0, wire3, wire2, wire1, wire4);
  assign wire49 = (wire0[(3'h5):(2'h2)] | $signed((8'hb4)));
  module50 #() modinst192 (wire191, clk, wire4, wire1, wire2, wire47);
  assign wire193 = wire4;
  assign wire194 = ((((wire47[(4'hf):(1'h0)] ?
                               $signed(wire0) : $signed(wire1)) >>> (wire1[(4'he):(3'h4)] == (~&wire0))) ?
                           (^(~|(wire47 ?
                               wire193 : wire193))) : (-$unsigned({wire47}))) ?
                       ((8'hb3) == ($unsigned((wire4 ?
                           wire47 : wire2)) + ((wire47 || wire3) ?
                           $unsigned(wire193) : (wire4 ^ (7'h40))))) : $signed(wire2));
  module96 #() modinst196 (wire195, clk, wire47, wire3, wire191, wire4);
  assign wire197 = ({wire0, (8'ha1)} ?
                       ((|($unsigned(wire193) ?
                               (wire195 ? wire0 : (8'h9d)) : {wire1,
                                   (8'hb6)})) ?
                           wire0[(3'h7):(3'h6)] : $signed({(wire3 ?
                                   wire191 : wire195)})) : wire193[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      if (wire195[(4'hb):(1'h1)])
        begin
          reg198 <= ({(-($unsigned((8'hbd)) >> {wire3, wire195})),
                  (-$signed({wire4}))} ?
              wire3[(3'h5):(2'h3)] : wire49[(4'hc):(2'h2)]);
          reg199 <= wire197[(2'h2):(1'h1)];
          reg200 <= (!(~^wire4));
          reg201 <= wire47;
        end
      else
        begin
          if ($signed($signed(wire1)))
            begin
              reg198 <= (((((wire194 ? wire1 : (8'hb8)) ?
                      $unsigned(reg198) : $signed((8'haa))) != (reg199[(3'h4):(1'h1)] >> reg201[(3'h4):(1'h1)])) ?
                  {$signed((!reg200))} : (wire3[(4'ha):(3'h7)] ?
                      $signed((-(8'hb6))) : (wire1 ?
                          (wire49 | wire0) : $unsigned(wire195)))) >= {wire191[(5'h13):(4'hb)],
                  wire49[(2'h3):(2'h2)]});
              reg199 <= ($unsigned(((^~wire49) ?
                      (~|wire4) : ((wire47 * wire0) ?
                          $unsigned((8'ha9)) : $unsigned(reg198)))) ?
                  (((|wire191[(1'h1):(1'h1)]) ?
                      (reg199 ?
                          $signed((8'hbf)) : {(8'hb3), (8'ha9)}) : ((wire3 ?
                              wire0 : wire195) ?
                          wire194[(4'hf):(1'h0)] : wire1)) || (|(((8'hb2) ?
                          wire194 : wire195) ?
                      $signed(wire3) : $signed(wire193)))) : (wire4[(5'h11):(3'h5)] ?
                      (($signed(wire0) ?
                              $unsigned(wire49) : (reg199 <= wire197)) ?
                          ($unsigned(wire197) - wire47) : $signed((wire194 ?
                              wire193 : wire191))) : wire47));
            end
          else
            begin
              reg198 <= reg200[(1'h1):(1'h0)];
              reg199 <= $signed(($signed($unsigned((&wire194))) ?
                  ($signed({wire2, reg198}) ?
                      {reg198[(4'h9):(1'h1)]} : (wire195[(4'ha):(4'h8)] == $unsigned(wire4))) : $signed(wire49[(3'h6):(3'h5)])));
              reg200 <= (wire47[(4'hd):(4'h9)] & ($signed(wire2[(1'h1):(1'h1)]) ?
                  (+wire193) : reg199[(3'h6):(3'h4)]));
              reg201 <= $unsigned(reg200[(4'h8):(3'h5)]);
              reg202 <= $signed((~($unsigned(reg198[(4'hb):(1'h1)]) != $signed((wire195 ?
                  reg198 : wire3)))));
            end
        end
      reg203 <= wire0;
      reg204 <= ($unsigned(reg199) > wire1[(4'ha):(3'h5)]);
      if ((-reg202[(3'h7):(1'h1)]))
        begin
          if (wire193)
            begin
              reg205 <= (&$signed(reg200[(5'h11):(4'hf)]));
              reg206 <= $signed(reg202);
              reg207 <= $signed($signed((((reg205 ? wire2 : reg202) ?
                  (reg202 ^~ reg203) : (reg205 == reg206)) | wire193)));
              reg208 <= ($signed((8'hbc)) <<< ({{{reg199}}} ?
                  (wire4[(5'h10):(4'hd)] == reg200) : ($signed(wire195[(4'h9):(3'h7)]) ?
                      (^reg199[(3'h7):(2'h3)]) : ({reg202, wire194} ?
                          reg199[(4'he):(1'h1)] : (8'hbf)))));
            end
          else
            begin
              reg205 <= $signed((wire2 ? wire1 : $unsigned({wire191})));
            end
          if ((~^(^(^wire197))))
            begin
              reg209 <= wire195[(4'hb):(1'h0)];
              reg210 <= (wire3[(4'hb):(3'h7)] ?
                  $signed(((reg209[(4'ha):(3'h5)] ? {(8'hbc)} : reg198) ?
                      $unsigned($signed(reg199)) : (!(reg204 & reg205)))) : reg201);
              reg211 <= wire49[(3'h4):(1'h1)];
            end
          else
            begin
              reg209 <= ((($unsigned(wire2[(5'h11):(5'h10)]) == $signed((wire194 * reg200))) ?
                  reg207[(5'h12):(4'hc)] : (reg206 || {$unsigned(wire1)})) | $unsigned((^((reg210 ?
                      wire2 : wire49) ?
                  $unsigned(reg208) : reg208))));
              reg210 <= ((((8'ha8) << $signed((~&reg206))) ?
                  (8'hb3) : (reg200 <= $signed((wire197 ?
                      reg208 : wire193)))) ~^ reg205);
              reg211 <= $unsigned(reg209[(1'h1):(1'h0)]);
              reg212 <= reg206[(3'h4):(3'h4)];
            end
        end
      else
        begin
          if (($unsigned($signed(reg203)) ?
              (^$signed({(wire0 << wire194)})) : reg200[(4'h8):(3'h4)]))
            begin
              reg205 <= ({(~^{$unsigned((7'h44))}),
                      ($signed(wire2) ?
                          reg203[(1'h1):(1'h0)] : $unsigned($unsigned(reg198)))} ?
                  $signed((((wire2 != wire195) ? {reg206} : $unsigned(reg202)) ?
                      $unsigned(((7'h41) ?
                          reg201 : (8'ha1))) : $unsigned($unsigned(wire194)))) : wire0[(5'h15):(5'h14)]);
              reg206 <= {(reg198 ?
                      (reg205 | $unsigned(reg212[(2'h3):(1'h1)])) : $unsigned(reg209)),
                  (-(wire193 || $unsigned(reg208[(4'h8):(1'h0)])))};
            end
          else
            begin
              reg205 <= reg200;
              reg206 <= (wire4 ? $signed(wire49) : reg200[(4'hf):(2'h2)]);
              reg207 <= {wire197, reg212};
              reg208 <= (wire195[(2'h3):(1'h1)] & wire0[(2'h2):(1'h1)]);
              reg209 <= wire4;
            end
          reg210 <= (&$unsigned({reg211, $signed((+(8'h9c)))}));
        end
      reg213 <= reg206[(1'h1):(1'h0)];
    end
  assign wire214 = ((((+(reg211 ? (8'hbb) : reg203)) ?
                           (!((8'hb5) ?
                               reg199 : wire1)) : reg204[(3'h4):(3'h4)]) ?
                       ($unsigned(reg199[(4'hf):(3'h7)]) > $unsigned(reg204[(4'h8):(2'h2)])) : $signed($unsigned(reg200))) - $signed((+{reg212[(4'h9):(3'h5)]})));
  assign wire215 = wire47[(4'ha):(1'h0)];
  module5 #() modinst217 (.wire6(reg200), .wire9(reg207), .y(wire216), .wire10(reg209), .clk(clk), .wire8(reg213), .wire7(reg211));
  assign wire218 = $unsigned((~|$signed(reg201[(2'h3):(1'h0)])));
  module113 #() modinst220 (wire219, clk, wire195, reg211, reg201, reg200, reg206);
  assign wire221 = (8'h9d);
  assign wire222 = reg205[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg223 <= wire195[(2'h2):(1'h1)];
      reg224 <= ($unsigned((~|$unsigned((wire2 + wire3)))) * $unsigned((~|((reg199 >= wire221) && {wire191,
          reg210}))));
      if (wire193)
        begin
          if ((~|wire218[(4'h9):(3'h4)]))
            begin
              reg225 <= $unsigned(reg210);
              reg226 <= reg212;
              reg227 <= reg210[(4'hd):(1'h1)];
            end
          else
            begin
              reg225 <= (reg227 ?
                  $signed((reg211[(1'h0):(1'h0)] ?
                      reg205 : (reg210[(5'h15):(4'hd)] ?
                          $signed((8'ha3)) : (-wire216)))) : wire3);
              reg226 <= $unsigned({reg211, wire49[(2'h2):(1'h1)]});
              reg227 <= {$unsigned($unsigned((reg202[(4'ha):(1'h0)] ?
                      $unsigned(wire215) : (~|wire4))))};
              reg228 <= $signed((~reg227));
            end
          reg229 <= $unsigned((+$unsigned(reg207)));
          reg230 <= reg204;
          reg231 <= {$unsigned(({(8'hab)} & ($unsigned(reg200) ?
                  {reg228, (8'haf)} : $signed(wire194))))};
        end
      else
        begin
          reg225 <= reg230;
        end
      reg232 <= (~^$signed((~|$signed($signed(wire3)))));
      reg233 <= ({reg232} ?
          wire222[(1'h0):(1'h0)] : $unsigned(($signed(reg206) ?
              ($unsigned(wire2) <= $unsigned(reg213)) : {wire219[(1'h0):(1'h0)]})));
    end
  assign wire234 = (~^reg201);
  assign wire235 = wire215[(3'h5):(1'h1)];
  module5 #() modinst237 (.wire9(reg199), .wire8(wire235), .wire10(wire222), .y(wire236), .clk(clk), .wire6(reg212), .wire7(wire218));
  assign wire238 = $unsigned((reg227[(4'hc):(1'h0)] ?
                       wire47[(5'h14):(3'h6)] : (8'haf)));
endmodule

module module50  (y, clk, wire54, wire53, wire52, wire51);
  output wire [(32'h1ce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire54;
  input wire [(4'hf):(1'h0)] wire53;
  input wire [(5'h15):(1'h0)] wire52;
  input wire [(5'h13):(1'h0)] wire51;
  wire [(4'h9):(1'h0)] wire190;
  wire [(5'h14):(1'h0)] wire189;
  wire signed [(4'h9):(1'h0)] wire188;
  wire [(4'hb):(1'h0)] wire187;
  wire [(4'hc):(1'h0)] wire186;
  wire signed [(4'hc):(1'h0)] wire184;
  wire [(3'h6):(1'h0)] wire163;
  wire signed [(2'h3):(1'h0)] wire162;
  wire [(2'h2):(1'h0)] wire161;
  wire signed [(4'hb):(1'h0)] wire160;
  wire signed [(3'h5):(1'h0)] wire159;
  wire signed [(3'h7):(1'h0)] wire149;
  wire signed [(5'h11):(1'h0)] wire92;
  wire [(5'h12):(1'h0)] wire55;
  wire [(5'h14):(1'h0)] wire94;
  wire [(5'h10):(1'h0)] wire95;
  wire signed [(5'h15):(1'h0)] wire110;
  wire [(5'h11):(1'h0)] wire112;
  wire [(2'h3):(1'h0)] wire147;
  reg signed [(5'h14):(1'h0)] reg150 = (1'h0);
  reg [(5'h15):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg156 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg157 = (1'h0);
  reg [(4'hc):(1'h0)] reg158 = (1'h0);
  reg [(4'hd):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg165 = (1'h0);
  reg [(5'h11):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg168 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg171 = (1'h0);
  assign y = {wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire184,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire149,
                 wire92,
                 wire55,
                 wire94,
                 wire95,
                 wire110,
                 wire112,
                 wire147,
                 reg150,
                 reg151,
                 reg152,
                 reg153,
                 reg154,
                 reg155,
                 reg156,
                 reg157,
                 reg158,
                 reg164,
                 reg165,
                 reg166,
                 reg167,
                 reg168,
                 reg169,
                 reg170,
                 reg171,
                 (1'h0)};
  assign wire55 = ({($signed({wire53}) ?
                              $unsigned($unsigned(wire52)) : ((-wire53) & {wire53})),
                          (8'hb7)} ?
                      {wire51[(3'h7):(3'h7)]} : $signed((((^wire54) ?
                              (8'hb6) : {wire54, wire53}) ?
                          $unsigned(((8'hbc) ?
                              wire54 : wire52)) : $signed($unsigned(wire51)))));
  module56 #() modinst93 (wire92, clk, wire54, wire51, wire55, wire52, wire53);
  assign wire94 = wire92;
  assign wire95 = (^($unsigned(((wire92 ?
                      (8'hb2) : wire51) && $unsigned(wire53))) ^ (-$signed((wire53 < (8'hb9))))));
  module96 #() modinst111 (.wire98(wire54), .wire100(wire52), .y(wire110), .wire99(wire94), .clk(clk), .wire97(wire92));
  assign wire112 = (wire110 >>> wire92);
  module113 #() modinst148 (.wire117(wire110), .wire114(wire51), .clk(clk), .wire116(wire94), .wire115(wire92), .y(wire147), .wire118(wire95));
  assign wire149 = wire53[(4'ha):(3'h6)];
  always
    @(posedge clk) begin
      reg150 <= $signed({((|wire94[(4'h8):(2'h3)]) ?
              ((wire54 <<< wire54) || ((8'had) ? wire92 : wire55)) : (8'ha3))});
      reg151 <= wire54;
      if (wire53[(4'hc):(3'h4)])
        begin
          if ((wire54 ?
              $unsigned(wire54[(4'hd):(1'h1)]) : $unsigned((wire55[(1'h1):(1'h0)] <<< wire54[(3'h5):(2'h2)]))))
            begin
              reg152 <= wire149;
              reg153 <= $signed(({$signed((~|reg150)),
                      $signed($signed(wire147))} ?
                  $signed($unsigned($signed(wire110))) : {(8'hb3),
                      reg151[(5'h13):(3'h6)]}));
              reg154 <= (reg150 ~^ $unsigned(((-((8'hbf) <= wire53)) || ((reg152 ~^ reg152) ?
                  $signed(wire55) : wire51[(3'h4):(2'h2)]))));
            end
          else
            begin
              reg152 <= ($signed({(wire149 ^ (^~reg151)),
                  (reg151[(5'h10):(3'h4)] == (~|reg154))}) << (!{(~|$unsigned(reg152))}));
              reg153 <= wire149[(3'h6):(2'h3)];
              reg154 <= ($signed(reg150) ?
                  wire92 : {$unsigned(($unsigned(wire52) ?
                          ((8'h9d) ~^ wire52) : (~wire54))),
                      reg151[(3'h4):(2'h2)]});
              reg155 <= wire55[(2'h2):(1'h1)];
            end
          reg156 <= $unsigned((-(!(+wire52))));
        end
      else
        begin
          reg152 <= reg152;
          if ((wire94[(4'he):(3'h7)] ?
              $unsigned($signed(((wire112 >>> wire55) > (~reg154)))) : $signed(($unsigned(reg155[(1'h0):(1'h0)]) >= $unsigned(wire94)))))
            begin
              reg153 <= (((8'ha2) ?
                  $unsigned($signed(wire53[(1'h1):(1'h1)])) : reg150[(4'hd):(4'h9)]) >> reg152);
              reg154 <= (($unsigned(($signed(wire52) || wire147[(2'h3):(2'h2)])) ?
                      $unsigned({wire147}) : $unsigned(($signed(wire51) ?
                          $signed(wire112) : ((7'h43) << wire92)))) ?
                  (($unsigned(reg154) | $signed(wire51)) ?
                      (!wire110[(4'h9):(4'h9)]) : $unsigned({$signed((8'had)),
                          $signed(reg151)})) : wire52);
            end
          else
            begin
              reg153 <= $signed((^reg151[(4'hd):(4'hc)]));
            end
          if ($unsigned({wire55[(3'h6):(3'h5)],
              ((&$signed(wire94)) ?
                  wire52[(4'hf):(2'h3)] : $signed((&reg152)))}))
            begin
              reg155 <= $unsigned($unsigned({$signed((^wire53))}));
            end
          else
            begin
              reg155 <= (reg154 ? wire112[(4'h8):(3'h5)] : wire52);
            end
          reg156 <= wire92[(1'h1):(1'h0)];
          reg157 <= (($unsigned($unsigned(reg153[(4'h9):(3'h5)])) >>> wire110) == (~&(~|(8'ha3))));
        end
      reg158 <= (($signed((wire147[(1'h1):(1'h1)] ?
          wire149 : $signed(wire54))) == $unsigned($unsigned($signed((8'h9d))))) > ((~&reg156) ?
          ({((8'hb1) - reg150)} ?
              $signed((!reg151)) : $signed((^reg152))) : ($unsigned({reg155,
              wire53}) >= (reg150 ?
              $unsigned(wire52) : wire51[(4'hd):(4'hd)]))));
    end
  assign wire159 = ($unsigned((({reg152} * (reg155 * (8'ha7))) ?
                       (7'h43) : {(wire92 <= reg155)})) >= $signed(($signed((wire110 >= wire94)) ?
                       $signed($signed(wire51)) : wire149)));
  assign wire160 = $unsigned(wire95);
  assign wire161 = (^({reg150} * ((8'ha5) == $signed({wire54}))));
  assign wire162 = $signed((wire160 ?
                       {wire160[(3'h7):(3'h4)],
                           wire94[(5'h14):(1'h0)]} : ($signed($signed(reg156)) >>> ((^reg150) && (wire112 ?
                           reg157 : (7'h44))))));
  assign wire163 = wire51;
  always
    @(posedge clk) begin
      reg164 <= wire149;
      reg165 <= wire160;
      reg166 <= wire112;
      reg167 <= reg165;
      if ((8'haf))
        begin
          if (wire160)
            begin
              reg168 <= $signed(($signed(($signed(wire52) ?
                  reg166 : ((8'ha6) << wire95))) ~^ (~&($unsigned(reg158) ?
                  $signed(reg167) : {reg166, wire147}))));
              reg169 <= $signed(wire112);
              reg170 <= (wire163 + $signed(wire54));
            end
          else
            begin
              reg168 <= $unsigned($signed((|wire94[(4'hd):(4'h8)])));
            end
          reg171 <= (~|($signed(((7'h43) && (wire54 ^ (8'hbf)))) ?
              {{{wire149}, reg153}} : reg168));
        end
      else
        begin
          reg168 <= reg152[(1'h0):(1'h0)];
        end
    end
  module172 #() modinst185 (.wire173(reg152), .y(wire184), .wire174(wire54), .wire177(wire163), .wire175(reg171), .wire176(reg154), .clk(clk));
  assign wire186 = (-wire112);
  assign wire187 = reg165[(1'h1):(1'h0)];
  assign wire188 = ((~|($signed($signed(reg166)) ?
                       ((7'h40) ?
                           (reg156 ?
                               wire162 : reg158) : $unsigned(reg168)) : wire162[(1'h0):(1'h0)])) == wire184);
  assign wire189 = $signed(wire54);
  assign wire190 = $unsigned((8'hb7));
endmodule

module module5
#(parameter param45 = ((({((8'hbe) << (8'hb6))} ? (((8'ha3) ^ (8'hb2)) ? ((8'ha2) >>> (8'hac)) : ((8'hb3) ? (7'h44) : (8'ha2))) : (~|((7'h43) ? (8'ha9) : (8'hb1)))) | (^({(8'ha4)} ~^ ((8'hab) << (8'hae))))) & (~|((~&(8'ha3)) ? (|(&(7'h43))) : ((^~(8'h9e)) ? ((7'h40) << (8'h9f)) : ((8'hbd) << (8'hb0)))))), 
parameter param46 = (({{((8'hbc) - (8'hb9)), (8'hbd)}} ? param45 : (|(((8'hbf) ? param45 : param45) * param45))) ? (+(param45 ? param45 : (param45 ? (param45 + param45) : (~^param45)))) : ({(~(+param45))} ? param45 : {(-(param45 >>> param45)), param45})))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire6;
  input wire signed [(5'h11):(1'h0)] wire7;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire signed [(4'he):(1'h0)] wire9;
  input wire signed [(5'h10):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire44;
  wire [(4'h8):(1'h0)] wire43;
  wire signed [(3'h5):(1'h0)] wire11;
  wire [(3'h7):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire13;
  wire [(4'hc):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire41;
  assign y = {wire44, wire43, wire11, wire12, wire13, wire14, wire41, (1'h0)};
  assign wire11 = wire10;
  assign wire12 = $signed((((8'ha2) != wire6[(3'h4):(3'h4)]) ?
                      wire8[(5'h13):(4'hc)] : wire9));
  assign wire13 = (wire9[(1'h0):(1'h0)] ? $signed(wire7) : wire8);
  assign wire14 = $signed({{(|$unsigned(wire6))}});
  module15 #() modinst42 (wire41, clk, wire14, wire7, wire8, wire6, wire10);
  assign wire43 = wire14[(3'h4):(1'h0)];
  assign wire44 = $unsigned(($signed((~^wire14)) && (+$signed((wire9 ^ wire14)))));
endmodule

module module15
#(parameter param40 = {((~|(&((8'hbf) + (8'hae)))) != (((+(7'h40)) ? ((8'hb3) << (8'hb4)) : ((8'hb6) ? (8'ha8) : (8'haf))) ? ((&(8'h9d)) ? {(8'had), (8'hb2)} : {(8'hb1), (8'ha0)}) : {(|(7'h44)), (!(8'hb5))})), (^~(&(~|((8'ha2) >= (7'h41)))))})
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'hf1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire20;
  input wire signed [(4'hf):(1'h0)] wire19;
  input wire signed [(3'h6):(1'h0)] wire18;
  input wire signed [(5'h10):(1'h0)] wire17;
  input wire signed [(2'h2):(1'h0)] wire16;
  wire [(2'h2):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire38;
  wire signed [(5'h11):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire26;
  wire signed [(5'h13):(1'h0)] wire25;
  wire signed [(4'ha):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire23;
  wire [(2'h2):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire21;
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(5'h15):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 (1'h0)};
  assign wire21 = ((&wire20[(2'h3):(2'h3)]) && wire19);
  assign wire22 = $unsigned({((~|$unsigned(wire20)) <<< wire20[(2'h3):(1'h0)])});
  assign wire23 = $signed(wire17[(3'h5):(3'h4)]);
  assign wire24 = (((|(-((8'hae) || wire16))) <= $signed((wire17[(4'h8):(3'h6)] ?
                          (&wire20) : (-wire18)))) ?
                      wire20[(1'h0):(1'h0)] : (~&wire18));
  assign wire25 = (8'haa);
  assign wire26 = wire18[(1'h1):(1'h0)];
  assign wire27 = (wire17 >> (wire25 ?
                      (wire25 ?
                          (+$signed(wire16)) : (wire17[(4'he):(3'h5)] ?
                              {wire20,
                                  wire16} : (7'h41))) : (^wire17[(4'he):(3'h4)])));
  assign wire28 = wire17;
  always
    @(posedge clk) begin
      if ((8'haa))
        begin
          reg29 <= (-wire22);
        end
      else
        begin
          reg29 <= (~|wire23[(1'h1):(1'h0)]);
          if (($signed($signed(wire19[(4'hb):(3'h5)])) >> $signed((~|((~^reg29) & $signed(wire18))))))
            begin
              reg30 <= $unsigned(wire17);
            end
          else
            begin
              reg30 <= (!$unsigned($signed(($unsigned(wire25) ?
                  (reg30 ? wire16 : reg29) : (~|wire19)))));
              reg31 <= (({$unsigned(((8'ha1) ? reg30 : wire17)),
                      ($unsigned(wire22) ? wire20[(1'h0):(1'h0)] : {wire24})} ?
                  ((wire23[(1'h1):(1'h0)] * $unsigned(wire23)) <<< (^~$unsigned(reg29))) : (^~wire20)) || {wire25});
              reg32 <= $unsigned((&wire21));
              reg33 <= (!$unsigned($signed($signed($signed(wire26)))));
              reg34 <= {{wire18[(2'h2):(1'h1)]}, wire23};
            end
          reg35 <= wire28;
          reg36 <= $unsigned((~|({wire28,
              (wire20 & wire18)} <= $signed($signed(reg34)))));
          reg37 <= (reg29 ? reg29 : (wire25 | $unsigned($unsigned(wire27))));
        end
    end
  assign wire38 = $signed((^~{$unsigned((wire16 ? wire25 : wire19)),
                      reg30[(1'h1):(1'h0)]}));
  assign wire39 = ((wire16 & (-(~|(^reg36)))) ?
                      (~|wire20[(1'h1):(1'h1)]) : (~^$unsigned($signed((^(8'hbc))))));
endmodule

module module172
#(parameter param182 = ((~((((8'hac) ? (8'hac) : (8'hba)) ? (~(8'hb1)) : (&(7'h41))) * ({(8'ha4), (8'haa)} >>> (^(8'ha6))))) ? (^(|(((8'hb2) & (8'ha2)) > ((8'hb1) | (8'hb6))))) : ((((+(7'h44)) == (7'h42)) <= (((8'hb6) == (8'hbb)) ? ((8'ha8) + (8'hbd)) : (!(8'ha9)))) + ((((7'h43) ? (8'hb0) : (8'haf)) ? (8'hb3) : ((8'hbb) ? (8'hbb) : (8'ha4))) | (8'hab)))), 
parameter param183 = (~&(({param182} ? (param182 <<< (param182 | param182)) : ((^(7'h43)) ? (param182 && (8'hb4)) : (~param182))) != ((param182 * (param182 ? param182 : param182)) > param182))))
(y, clk, wire177, wire176, wire175, wire174, wire173);
  output wire [(32'h20):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire177;
  input wire signed [(4'hd):(1'h0)] wire176;
  input wire [(5'h12):(1'h0)] wire175;
  input wire [(5'h14):(1'h0)] wire174;
  input wire signed [(2'h2):(1'h0)] wire173;
  wire [(3'h5):(1'h0)] wire181;
  wire signed [(3'h7):(1'h0)] wire180;
  wire signed [(3'h7):(1'h0)] wire179;
  wire [(4'hc):(1'h0)] wire178;
  assign y = {wire181, wire180, wire179, wire178, (1'h0)};
  assign wire178 = $unsigned((wire173 ?
                       $unsigned((((8'ha0) >>> wire175) ?
                           $signed(wire175) : (~^wire177))) : wire174[(2'h2):(1'h0)]));
  assign wire179 = {wire173[(1'h0):(1'h0)],
                       {{((wire175 >= wire176) | wire174[(5'h11):(4'hf)]),
                               $signed(wire174[(1'h1):(1'h1)])}}};
  assign wire180 = wire174[(4'h9):(3'h5)];
  assign wire181 = wire179;
endmodule

module module113
#(parameter param146 = ((({(&(8'hb8)), (~|(8'hba))} <= {(+(8'hb6))}) ? ((((7'h42) + (8'haf)) ? (~(8'hbf)) : {(8'h9e), (7'h41)}) ? (((8'hb8) ? (8'hae) : (8'hb7)) == (~(7'h42))) : (((8'h9c) ? (8'hae) : (8'hb4)) ? ((8'hb8) && (8'hbd)) : (-(8'hb6)))) : ((((8'hbf) ? (7'h44) : (8'ha6)) >> ((8'hb5) == (8'hb2))) ? (~&(-(8'ha4))) : (&((8'ha4) << (8'ha5))))) || ({(!(~|(8'hb3)))} >= ({{(8'hb1)}} && (((8'ha1) && (8'h9d)) ? ((7'h40) ? (7'h43) : (8'hba)) : ((8'hb9) ? (8'h9c) : (8'hb1)))))))
(y, clk, wire118, wire117, wire116, wire115, wire114);
  output wire [(32'h122):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire118;
  input wire signed [(5'h13):(1'h0)] wire117;
  input wire [(4'he):(1'h0)] wire116;
  input wire [(2'h3):(1'h0)] wire115;
  input wire [(4'h9):(1'h0)] wire114;
  wire [(3'h5):(1'h0)] wire139;
  wire [(4'ha):(1'h0)] wire138;
  wire [(4'hb):(1'h0)] wire137;
  wire signed [(4'hf):(1'h0)] wire136;
  wire [(3'h4):(1'h0)] wire135;
  wire signed [(4'hf):(1'h0)] wire134;
  wire [(3'h4):(1'h0)] wire133;
  wire [(4'ha):(1'h0)] wire131;
  wire [(5'h13):(1'h0)] wire130;
  wire [(3'h4):(1'h0)] wire126;
  wire signed [(5'h14):(1'h0)] wire125;
  wire signed [(2'h3):(1'h0)] wire121;
  wire signed [(4'h8):(1'h0)] wire120;
  wire signed [(4'he):(1'h0)] wire119;
  reg [(4'he):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg144 = (1'h0);
  reg signed [(4'he):(1'h0)] reg143 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg141 = (1'h0);
  reg [(5'h10):(1'h0)] reg140 = (1'h0);
  reg [(5'h11):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg127 = (1'h0);
  reg [(3'h4):(1'h0)] reg124 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg122 = (1'h0);
  assign y = {wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire131,
                 wire130,
                 wire126,
                 wire125,
                 wire121,
                 wire120,
                 wire119,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg132,
                 reg129,
                 reg128,
                 reg127,
                 reg124,
                 reg123,
                 reg122,
                 (1'h0)};
  assign wire119 = ((&($signed((wire118 ? wire118 : wire114)) ?
                           wire114 : $unsigned({wire116, wire115}))) ?
                       ({(~$signed(wire116))} <= wire117[(1'h0):(1'h0)]) : $signed((^wire116)));
  assign wire120 = wire119[(3'h7):(3'h4)];
  assign wire121 = wire115;
  always
    @(posedge clk) begin
      reg122 <= $unsigned((8'hb3));
      reg123 <= ((wire121[(1'h1):(1'h1)] && $unsigned(((~|wire118) ?
              wire114 : wire114))) ?
          wire116[(4'hb):(1'h1)] : (reg122[(1'h0):(1'h0)] ~^ $unsigned((8'h9d))));
      reg124 <= wire114[(3'h4):(1'h1)];
    end
  assign wire125 = {wire120, wire119[(4'hc):(4'hc)]};
  assign wire126 = ((&$signed(wire119)) ?
                       (8'h9d) : (wire119[(4'h9):(2'h3)] ?
                           (wire117[(4'h9):(2'h2)] <= (~^wire115)) : wire121[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      if ($signed((!$unsigned(wire117[(4'hd):(4'hc)]))))
        begin
          reg127 <= wire115;
        end
      else
        begin
          if ($signed($unsigned($unsigned((^~wire118[(4'hb):(2'h3)])))))
            begin
              reg127 <= wire119[(3'h4):(1'h0)];
              reg128 <= {reg122, $signed($signed(reg122))};
            end
          else
            begin
              reg127 <= reg122;
            end
          reg129 <= ($unsigned(wire126) >> ((({wire120} >>> $signed(wire121)) ^ {wire117}) ?
              wire117[(3'h4):(1'h1)] : $unsigned(wire125[(4'hb):(2'h2)])));
        end
    end
  assign wire130 = ({($signed(reg129[(4'he):(1'h0)]) <<< (wire114 == wire120[(3'h7):(3'h5)]))} <<< wire126);
  assign wire131 = (~$unsigned((wire119 ^~ ($unsigned(reg127) ?
                       ((8'hb3) ^ reg129) : $unsigned(wire114)))));
  always
    @(posedge clk) begin
      reg132 <= (+(^~(!(^(~|(8'hb7))))));
    end
  assign wire133 = (^($unsigned(((wire115 ? reg122 : reg124) ?
                           wire125[(4'hf):(4'hf)] : $signed(wire115))) ?
                       (^(^wire117)) : (wire114 ?
                           $signed((reg124 != wire125)) : ($signed(wire131) ?
                               $unsigned(wire114) : reg128))));
  assign wire134 = $signed((wire119[(4'hb):(2'h3)] ?
                       $unsigned($signed((wire117 > wire118))) : $unsigned(($unsigned(wire115) | wire117))));
  assign wire135 = {{reg128[(4'h8):(3'h7)]},
                       ({reg122} ~^ $signed((((8'hbe) & wire114) ?
                           {reg123, reg127} : reg122)))};
  assign wire136 = (~|($signed($signed(reg129)) ?
                       wire130[(4'hb):(3'h7)] : wire115));
  assign wire137 = ($unsigned($signed(wire114)) || $signed($signed((+wire117))));
  assign wire138 = ({($unsigned((^~wire136)) ^ ($unsigned((8'hb1)) | (~wire130))),
                           $signed($unsigned(wire121))} ?
                       (~&wire120) : $signed(wire130[(4'ha):(4'h9)]));
  assign wire139 = (((($signed(wire117) ?
                               (wire115 ? reg128 : reg132) : (wire116 ?
                                   wire117 : reg129)) > wire135[(1'h0):(1'h0)]) ?
                           (7'h40) : (-(wire125[(5'h10):(5'h10)] ?
                               reg129[(2'h3):(2'h2)] : {wire138, (8'had)}))) ?
                       {$signed(wire131),
                           ((8'h9e) < $signed($signed(wire125)))} : $unsigned((wire126[(1'h1):(1'h1)] <<< ({reg129,
                           wire133} != (~^wire126)))));
  always
    @(posedge clk) begin
      reg140 <= $unsigned((-(wire137[(4'hb):(3'h4)] ?
          (+wire116) : $unsigned((~^reg128)))));
      reg141 <= $unsigned(wire138);
      if (((8'ha7) > reg141[(1'h1):(1'h1)]))
        begin
          if ($unsigned($unsigned(reg132[(4'h8):(1'h0)])))
            begin
              reg142 <= reg123;
            end
          else
            begin
              reg142 <= wire133[(1'h1):(1'h0)];
              reg143 <= wire130;
              reg144 <= $unsigned((wire120[(4'h8):(4'h8)] ^~ $unsigned(reg143[(3'h6):(3'h6)])));
            end
        end
      else
        begin
          reg142 <= (^~(($unsigned({wire116, wire134}) ^ ((reg142 ?
                      reg122 : (8'hbb)) ?
                  (8'ha8) : ((8'had) <<< wire135))) ?
              ((8'hb6) == (8'ha2)) : reg143));
        end
      reg145 <= (wire118[(3'h5):(3'h5)] ?
          (~&$signed((~&(reg141 ?
              wire115 : reg129)))) : $unsigned((reg140[(4'hd):(4'h9)] ?
              (&$signed(reg124)) : ((reg122 ? wire120 : wire125) ?
                  (wire115 ? reg143 : reg128) : $signed(reg122)))));
    end
endmodule

module module96  (y, clk, wire100, wire99, wire98, wire97);
  output wire [(32'h77):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire100;
  input wire signed [(5'h10):(1'h0)] wire99;
  input wire [(5'h15):(1'h0)] wire98;
  input wire signed [(5'h11):(1'h0)] wire97;
  wire [(5'h14):(1'h0)] wire109;
  wire signed [(5'h14):(1'h0)] wire108;
  wire signed [(4'hf):(1'h0)] wire107;
  wire signed [(3'h5):(1'h0)] wire106;
  wire signed [(5'h14):(1'h0)] wire105;
  wire signed [(4'hf):(1'h0)] wire104;
  wire [(4'hb):(1'h0)] wire103;
  wire signed [(2'h2):(1'h0)] wire102;
  wire [(4'ha):(1'h0)] wire101;
  assign y = {wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 (1'h0)};
  assign wire101 = $signed((wire100[(5'h10):(5'h10)] ^ (-$unsigned(((8'hbf) ~^ wire97)))));
  assign wire102 = wire99;
  assign wire103 = $unsigned({wire100[(2'h2):(2'h2)],
                       {(~&(&wire99)), $unsigned((~&wire97))}});
  assign wire104 = {wire101};
  assign wire105 = $signed((wire99 ^ wire103[(1'h1):(1'h0)]));
  assign wire106 = (+$unsigned($signed($signed(wire98[(1'h1):(1'h1)]))));
  assign wire107 = (((+wire101) ?
                           ($signed((~^wire105)) <<< wire104[(4'h8):(2'h2)]) : wire103[(3'h5):(2'h2)]) ?
                       (8'hb4) : $unsigned(($unsigned((~^(8'h9e))) ~^ ((8'hbc) ?
                           (wire101 || wire98) : (!wire103)))));
  assign wire108 = $unsigned(($unsigned(wire106) ~^ wire99[(3'h7):(1'h1)]));
  assign wire109 = wire99[(4'hb):(4'hb)];
endmodule

module module56
#(parameter param90 = {((((~(8'ha8)) ? (~^(8'had)) : (8'ha5)) ? {((8'hb4) || (8'haf))} : (((8'hb0) ? (8'hb5) : (8'ha6)) ? ((8'hb9) ? (8'h9f) : (7'h41)) : (~&(8'haa)))) ? ((((8'ha6) ? (7'h43) : (8'haf)) ? {(8'hae)} : ((8'hb3) != (8'hbd))) >= (((8'hac) & (8'hb4)) ? ((8'ha2) ? (8'h9e) : (8'ha1)) : ((8'hbc) ? (8'ha9) : (8'ha2)))) : ((&(&(8'hb4))) ? (-{(8'hbf)}) : (((8'hb3) ? (8'hac) : (8'h9f)) ? ((8'ha0) >> (8'haf)) : ((8'hbd) || (8'ha8)))))}, 
parameter param91 = ({(param90 > ((param90 || (8'hbf)) || {param90, param90}))} ~^ param90))
(y, clk, wire61, wire60, wire59, wire58, wire57);
  output wire [(32'h12e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire61;
  input wire signed [(5'h13):(1'h0)] wire60;
  input wire [(5'h12):(1'h0)] wire59;
  input wire [(5'h15):(1'h0)] wire58;
  input wire signed [(4'he):(1'h0)] wire57;
  wire signed [(3'h4):(1'h0)] wire89;
  wire [(4'h8):(1'h0)] wire88;
  wire signed [(4'hf):(1'h0)] wire87;
  wire [(4'hc):(1'h0)] wire86;
  wire signed [(2'h3):(1'h0)] wire85;
  wire [(4'hb):(1'h0)] wire74;
  wire [(4'hf):(1'h0)] wire73;
  wire [(5'h15):(1'h0)] wire72;
  wire signed [(3'h4):(1'h0)] wire71;
  wire [(5'h13):(1'h0)] wire70;
  wire signed [(3'h6):(1'h0)] wire69;
  wire signed [(4'hd):(1'h0)] wire68;
  wire [(3'h4):(1'h0)] wire67;
  wire [(3'h5):(1'h0)] wire66;
  wire [(4'he):(1'h0)] wire65;
  wire [(4'h8):(1'h0)] wire64;
  wire [(5'h15):(1'h0)] wire63;
  wire signed [(3'h4):(1'h0)] wire62;
  reg [(4'hc):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg82 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg80 = (1'h0);
  reg [(4'hc):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg77 = (1'h0);
  reg [(4'h9):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg75 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
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
                 (1'h0)};
  assign wire62 = $signed(((($unsigned(wire61) ?
                          (wire61 ? wire58 : wire58) : (wire58 ?
                              (8'hb5) : wire58)) == wire57) ?
                      (($unsigned(wire61) >>> (wire59 ? wire58 : (8'ha5))) ?
                          $signed($signed(wire60)) : (~|wire61[(4'he):(1'h1)])) : (wire57 > $unsigned(wire59))));
  assign wire63 = wire57;
  assign wire64 = ((!$unsigned((~^$unsigned(wire58)))) <<< (wire60 + (((wire59 ?
                          wire63 : wire60) ?
                      (wire60 ~^ (8'ha4)) : {wire62,
                          wire59}) >>> $signed((wire57 ? wire57 : wire62)))));
  assign wire65 = $signed((~&$unsigned(wire60[(4'ha):(3'h4)])));
  assign wire66 = wire60[(2'h3):(2'h3)];
  assign wire67 = $signed(($signed(({wire65} & wire61[(3'h6):(1'h1)])) + (($signed(wire63) ?
                          (wire66 ? wire61 : wire65) : wire66[(1'h0):(1'h0)]) ?
                      wire66[(2'h3):(1'h0)] : $signed(wire65))));
  assign wire68 = {$signed(wire59), wire66};
  assign wire69 = wire60;
  assign wire70 = wire68[(4'ha):(3'h5)];
  assign wire71 = $signed(($signed($unsigned({(8'hbd)})) ?
                      $signed((~^{wire60})) : (($unsigned(wire70) ?
                          wire58 : (wire69 + wire57)) != $signed((8'h9e)))));
  assign wire72 = wire58[(4'ha):(2'h3)];
  assign wire73 = {wire59, wire64[(1'h0):(1'h0)]};
  assign wire74 = wire57;
  always
    @(posedge clk) begin
      reg75 <= (~^($signed(wire69) - $signed(wire66)));
      reg76 <= {wire73};
      reg77 <= wire68;
      if ({(~&$signed(((wire70 & wire64) + (~&wire67))))})
        begin
          reg78 <= ((+(~&({(8'h9f)} >>> wire72[(4'h9):(2'h2)]))) ?
              wire73 : (&$unsigned($signed($signed((8'hbd))))));
          reg79 <= wire62[(1'h0):(1'h0)];
          reg80 <= wire57[(2'h2):(2'h2)];
          reg81 <= ($signed($signed({wire70[(4'hb):(4'ha)],
                  $unsigned(wire57)})) ?
              (($signed((8'ha0)) ?
                      {(wire61 ? reg75 : wire65),
                          $signed((8'ha8))} : $unsigned(reg79)) ?
                  (8'hb2) : ({reg78} <<< ({wire68} | (+(7'h44))))) : wire74);
          reg82 <= wire65;
        end
      else
        begin
          reg78 <= (^~$signed(wire64));
          reg79 <= reg76[(4'h9):(4'h8)];
          reg80 <= wire65;
          reg81 <= $unsigned($unsigned(($signed(((8'ha6) & wire57)) ?
              $signed($unsigned(wire68)) : wire64)));
        end
      reg83 <= wire71[(3'h4):(3'h4)];
    end
  always
    @(posedge clk) begin
      reg84 <= (wire74 << (8'h9d));
    end
  assign wire85 = {$unsigned(wire73)};
  assign wire86 = reg78[(1'h0):(1'h0)];
  assign wire87 = {((|(^~$unsigned(reg84))) ?
                          {$unsigned(reg80[(2'h3):(1'h1)]),
                              reg79} : reg82[(4'hb):(2'h2)]),
                      {(wire57[(4'hc):(3'h5)] ?
                              (^~((8'ha4) <= wire57)) : (^(wire69 * wire59))),
                          (^~{wire67[(3'h4):(2'h2)]})}};
  assign wire88 = ((~wire62[(2'h3):(2'h2)]) ?
                      wire71 : $unsigned(({(~|wire59)} ^ {$signed(reg79)})));
  assign wire89 = (~&$unsigned((|($signed(wire63) ?
                      (wire57 == reg75) : wire61[(4'ha):(2'h2)]))));
endmodule
