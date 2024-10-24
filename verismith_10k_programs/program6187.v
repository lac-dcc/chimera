module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2fe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire263;
  wire signed [(5'h12):(1'h0)] wire250;
  wire signed [(5'h14):(1'h0)] wire249;
  wire signed [(3'h5):(1'h0)] wire247;
  wire signed [(4'hf):(1'h0)] wire189;
  wire signed [(5'h11):(1'h0)] wire188;
  wire [(4'hc):(1'h0)] wire187;
  wire signed [(4'h9):(1'h0)] wire186;
  wire [(4'hb):(1'h0)] wire185;
  wire [(4'ha):(1'h0)] wire184;
  wire signed [(5'h11):(1'h0)] wire183;
  wire [(4'ha):(1'h0)] wire157;
  wire [(4'hf):(1'h0)] wire252;
  wire [(4'hd):(1'h0)] wire254;
  wire [(3'h7):(1'h0)] wire261;
  reg [(5'h11):(1'h0)] reg203 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg202 = (1'h0);
  reg [(3'h5):(1'h0)] reg201 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg200 = (1'h0);
  reg [(4'he):(1'h0)] reg199 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg198 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg197 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg196 = (1'h0);
  reg [(5'h10):(1'h0)] reg195 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg194 = (1'h0);
  reg signed [(4'he):(1'h0)] reg193 = (1'h0);
  reg [(5'h10):(1'h0)] reg192 = (1'h0);
  reg [(4'h9):(1'h0)] reg191 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg190 = (1'h0);
  reg [(3'h7):(1'h0)] reg182 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg180 = (1'h0);
  reg [(5'h13):(1'h0)] reg179 = (1'h0);
  reg [(5'h14):(1'h0)] reg178 = (1'h0);
  reg [(4'hb):(1'h0)] reg177 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg176 = (1'h0);
  reg [(5'h15):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg174 = (1'h0);
  reg [(3'h4):(1'h0)] reg173 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg172 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg171 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg169 = (1'h0);
  reg [(4'hf):(1'h0)] reg168 = (1'h0);
  reg [(4'hb):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg165 = (1'h0);
  reg [(4'h9):(1'h0)] reg164 = (1'h0);
  reg [(4'hd):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg162 = (1'h0);
  reg [(5'h11):(1'h0)] reg161 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg159 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg255 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg256 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg257 = (1'h0);
  reg [(5'h15):(1'h0)] reg258 = (1'h0);
  reg signed [(4'he):(1'h0)] reg259 = (1'h0);
  reg [(5'h11):(1'h0)] reg260 = (1'h0);
  assign y = {wire263,
                 wire250,
                 wire249,
                 wire247,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire157,
                 wire252,
                 wire254,
                 wire261,
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
                 reg182,
                 reg181,
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
                 reg255,
                 reg256,
                 reg257,
                 reg258,
                 reg259,
                 reg260,
                 (1'h0)};
  module4 #() modinst158 (wire157, clk, wire1, wire0, wire3, wire2, (8'h9e));
  always
    @(posedge clk) begin
      reg159 <= ($signed($signed($signed((&(8'hbe))))) << {(!wire1[(4'h8):(2'h2)])});
      reg160 <= $signed((((&(wire1 ?
              wire157 : wire3)) >> (^~((8'haa) << reg159))) ?
          (8'h9d) : $unsigned($signed((^(8'haa))))));
      if ($unsigned($signed({wire3[(3'h5):(3'h4)]})))
        begin
          reg161 <= wire3;
          reg162 <= ($signed((7'h44)) << wire2[(3'h4):(3'h4)]);
          reg163 <= wire157[(2'h2):(1'h0)];
        end
      else
        begin
          reg161 <= (^~($signed($unsigned($signed(reg160))) > reg159));
        end
      if (($signed(wire2[(1'h0):(1'h0)]) ?
          ((reg159 + $unsigned($unsigned(reg161))) ?
              reg162 : reg160[(1'h1):(1'h0)]) : (-((reg161[(4'ha):(2'h3)] ?
              $signed(wire1) : wire1) <<< $unsigned((~&(8'hbf)))))))
        begin
          reg164 <= ((reg160 ?
              $unsigned(wire3) : $unsigned((^$signed(wire2)))) ^ reg161[(4'hc):(3'h7)]);
          reg165 <= (~|reg163);
          reg166 <= (wire1 ^~ {$unsigned(wire2)});
        end
      else
        begin
          reg164 <= wire1[(2'h2):(1'h1)];
          reg165 <= reg159[(4'hc):(1'h0)];
          reg166 <= ($unsigned(({$unsigned(wire1), (-reg161)} ?
                  $unsigned($unsigned(wire0)) : ((reg165 ?
                      reg165 : wire0) < reg161))) ?
              $unsigned(($signed((&(8'hbe))) ^~ $signed((reg165 ?
                  (8'hac) : wire157)))) : $signed((-$unsigned((~|wire2)))));
        end
      reg167 <= $signed((((8'ha2) | (-$unsigned(reg165))) ?
          (((8'hb7) && (reg160 ?
              reg161 : reg165)) | wire0[(4'ha):(2'h2)]) : wire0[(4'h8):(4'h8)]));
    end
  always
    @(posedge clk) begin
      reg168 <= ((({reg163, {reg160, wire1}} ^~ wire157) ?
              reg166[(4'h9):(1'h1)] : $unsigned(wire157)) ?
          $unsigned(((^(reg167 ?
              reg162 : reg160)) & reg167[(2'h2):(1'h0)])) : (&reg167[(4'h8):(2'h2)]));
      if ((&{reg161[(4'hc):(4'ha)]}))
        begin
          reg169 <= (wire3[(3'h4):(3'h4)] ~^ (wire0 ?
              {$unsigned((wire0 ? reg167 : wire157))} : reg166[(4'hc):(1'h0)]));
          if ($unsigned(wire3))
            begin
              reg170 <= ($unsigned({(wire3[(4'he):(3'h6)] ?
                      (reg161 | (8'hbb)) : reg169[(3'h7):(3'h4)])}) || {$signed(($signed((8'hab)) ?
                      reg168[(4'he):(3'h5)] : (reg167 >= reg168))),
                  {$unsigned((reg164 < reg165)),
                      (reg168[(3'h5):(2'h2)] ?
                          {reg166, reg167} : (wire157 || reg162))}});
              reg171 <= reg160[(3'h4):(2'h2)];
              reg172 <= $signed((~^$signed(($signed(reg168) ?
                  (reg161 ? wire2 : (7'h41)) : (~^reg164)))));
            end
          else
            begin
              reg170 <= ({reg165} ?
                  $signed((^(reg170[(3'h6):(1'h1)] ?
                      reg169[(4'h8):(2'h3)] : reg161[(1'h1):(1'h0)]))) : $signed(reg163));
              reg171 <= $unsigned((|((reg169[(1'h0):(1'h0)] ?
                      (reg164 ? reg162 : (8'hb9)) : wire1[(3'h4):(1'h0)]) ?
                  wire0[(1'h1):(1'h0)] : ((|(8'hb6)) >>> {reg166, (8'hbb)}))));
            end
          reg173 <= ($signed((((reg164 | reg165) ? reg166 : (-reg167)) ?
              {$signed(reg161)} : {reg169})) >>> wire0[(4'hc):(4'ha)]);
        end
      else
        begin
          reg169 <= ({$signed(($unsigned(wire0) * wire157)),
                  (reg165 - wire157)} ?
              (($unsigned((~&reg165)) | reg163) ^ $signed(((^reg169) ?
                  reg163[(4'hc):(3'h6)] : {wire0}))) : reg169);
        end
      reg174 <= reg166[(4'he):(3'h5)];
      if ((~($unsigned(reg159) ~^ $signed(reg173[(1'h1):(1'h0)]))))
        begin
          if ($unsigned(reg163))
            begin
              reg175 <= ($signed(reg164) >>> ($unsigned($unsigned(reg164)) ?
                  wire0[(5'h10):(2'h2)] : (((|reg173) <= {reg173}) ?
                      ((~|reg174) <<< (reg170 ? wire0 : reg159)) : wire157)));
            end
          else
            begin
              reg175 <= reg167;
              reg176 <= $unsigned((!wire3));
              reg177 <= (+$signed(reg161[(1'h0):(1'h0)]));
              reg178 <= $unsigned((((&$signed(reg163)) ?
                      (^~(8'hb9)) : ($signed(reg174) ^ (wire157 ?
                          reg173 : wire2))) ?
                  $signed(reg164) : $unsigned(wire0[(2'h2):(1'h1)])));
            end
        end
      else
        begin
          if ($signed(reg171[(1'h0):(1'h0)]))
            begin
              reg175 <= {$signed({{(!wire0), reg170}})};
              reg176 <= (reg174 - (!(wire2[(3'h7):(3'h6)] ?
                  {(reg166 ? reg163 : wire0), {wire3}} : $signed((wire1 ?
                      reg160 : (8'had))))));
            end
          else
            begin
              reg175 <= reg169;
              reg176 <= $signed((~reg167));
              reg177 <= reg172;
              reg178 <= {reg175[(4'he):(3'h5)], $signed(reg160)};
              reg179 <= ($unsigned($signed(((&reg162) <<< ((8'hb1) ^~ (8'hbe))))) ?
                  $unsigned(reg174[(2'h3):(1'h1)]) : reg162[(1'h1):(1'h0)]);
            end
          reg180 <= $unsigned(reg173[(1'h0):(1'h0)]);
          reg181 <= $unsigned({(8'hb1)});
        end
      reg182 <= wire3[(4'hc):(3'h6)];
    end
  assign wire183 = (reg171[(1'h0):(1'h0)] > $unsigned(reg164[(2'h2):(1'h1)]));
  assign wire184 = reg174;
  assign wire185 = reg160;
  assign wire186 = $unsigned(reg160[(4'h8):(3'h6)]);
  assign wire187 = ({reg182[(2'h3):(1'h0)], $unsigned(wire2)} ?
                       $signed($unsigned(reg176)) : (8'hbe));
  assign wire188 = (~(!((^~(!wire3)) | (8'hb5))));
  assign wire189 = (~|(^~reg161));
  always
    @(posedge clk) begin
      if (reg176[(2'h2):(1'h0)])
        begin
          reg190 <= (reg163 ?
              reg169[(4'hf):(1'h1)] : ($unsigned(($unsigned(reg177) && ((8'hbb) && reg166))) ?
                  {{$signed(wire185)}} : ($unsigned({wire187,
                      wire2}) < {$signed(reg179), reg165})));
          reg191 <= (reg165 ?
              (+((^(~&wire1)) ?
                  ($unsigned(reg162) ?
                      reg178 : reg182[(3'h6):(2'h3)]) : $signed((reg170 ?
                      reg164 : reg163)))) : ((-wire186) >= ((!wire157) ?
                  (-(reg162 ? reg175 : (8'h9c))) : wire187[(2'h2):(1'h1)])));
        end
      else
        begin
          reg190 <= ($signed(reg191) ?
              reg167 : ((reg191 >= $unsigned(((8'hb3) < reg174))) != $signed((|$signed((8'ha8))))));
          reg191 <= wire188;
          reg192 <= wire1[(2'h2):(2'h2)];
        end
      if (reg181[(4'hb):(3'h4)])
        begin
          if ({$unsigned(reg181)})
            begin
              reg193 <= ((^{wire3, wire187[(4'h8):(3'h7)]}) ?
                  (~|$signed(({reg168,
                      (8'h9d)} >= (8'hbf)))) : (~|$unsigned($signed((reg178 | reg177)))));
              reg194 <= $unsigned((reg163 + ($unsigned((reg174 >>> reg164)) ?
                  ((^~(8'hac)) ?
                      (reg181 * reg173) : (reg178 ?
                          reg174 : reg164)) : (~^$signed(reg166)))));
              reg195 <= $signed((8'hbd));
              reg196 <= reg175[(4'he):(4'h8)];
              reg197 <= $signed($signed((~&$signed((&reg182)))));
            end
          else
            begin
              reg193 <= $unsigned((reg162[(3'h5):(3'h5)] ~^ reg163[(2'h3):(2'h3)]));
            end
          if ({reg180})
            begin
              reg198 <= (~&($signed($unsigned((reg170 ?
                  reg164 : reg172))) >>> $signed(reg167)));
              reg199 <= (reg181 && ($unsigned($signed(reg164)) ?
                  reg182 : (((wire1 >> reg191) ?
                          {(7'h44)} : (reg160 & reg182)) ?
                      wire185[(4'hb):(3'h7)] : ((reg177 ? (8'hbb) : reg174) ?
                          wire2 : {(8'h9d)}))));
            end
          else
            begin
              reg198 <= $unsigned(reg191[(1'h1):(1'h0)]);
              reg199 <= (8'hb1);
              reg200 <= wire2;
              reg201 <= (reg162[(3'h4):(1'h0)] * (reg177[(4'ha):(3'h5)] ?
                  {$signed((^reg169)),
                      wire189[(1'h1):(1'h1)]} : ($signed($signed(reg196)) ?
                      reg173 : ((~&reg178) ?
                          (reg171 ?
                              wire188 : reg200) : wire188[(4'hf):(4'hc)]))));
            end
        end
      else
        begin
          reg193 <= (!((reg200[(3'h5):(2'h2)] ? $unsigned((8'hbf)) : wire2) ?
              (+$unsigned((^~reg164))) : reg177[(4'hb):(4'h9)]));
          reg194 <= (reg173[(2'h2):(1'h0)] ?
              ($unsigned((~|(^(8'hb1)))) ?
                  wire185[(4'ha):(3'h7)] : ($signed($signed(reg176)) <= reg171)) : $unsigned((reg182 ?
                  (-((8'ha0) != (8'had))) : ($unsigned(reg176) && ((8'ha7) ?
                      wire189 : (8'hbb))))));
          reg195 <= $unsigned($unsigned($unsigned($signed((reg175 >> reg162)))));
          reg196 <= reg180;
          reg197 <= {reg165[(5'h11):(3'h5)],
              ((^(!((8'hbb) >>> reg198))) ?
                  ($unsigned((reg174 ^ reg196)) ?
                      $unsigned((^~wire3)) : ({wire184, reg201} ?
                          $signed(wire185) : wire185)) : reg192[(2'h2):(1'h1)])};
        end
      reg202 <= (($signed(((8'ha1) ~^ $unsigned(reg175))) & reg195[(1'h1):(1'h1)]) <<< ($signed({$signed(reg174)}) & $unsigned($signed(reg199))));
      reg203 <= reg193[(1'h1):(1'h0)];
    end
  module204 #() modinst248 (wire247, clk, reg200, reg193, reg161, reg174);
  assign wire249 = ($signed((reg202 ?
                       wire186 : {(~^reg164)})) <<< ((8'haa) * $unsigned($signed((reg178 ?
                       (7'h40) : wire185)))));
  module204 #() modinst251 (wire250, clk, reg201, reg195, wire189, reg165);
  module118 #() modinst253 (wire252, clk, reg198, reg178, reg163, reg170);
  assign wire254 = reg180[(5'h10):(4'h9)];
  always
    @(posedge clk) begin
      reg255 <= reg194;
      reg256 <= (reg161[(3'h6):(3'h6)] ?
          {(~&((reg162 ? reg197 : reg160) ?
                  $unsigned(wire254) : $signed(reg177))),
              reg195} : (8'ha0));
      reg257 <= ($unsigned(reg167) | ({$signed(reg175[(4'ha):(4'h8)]),
              wire185[(3'h4):(2'h2)]} ?
          (($signed(wire189) ?
              $signed(reg173) : $signed((8'ha9))) > $signed(reg201)) : ((~&(reg193 ?
                  reg164 : wire185)) ?
              $signed($unsigned(reg174)) : $signed($unsigned(reg193)))));
      if (((8'ha3) >>> {reg202[(4'hf):(3'h7)],
          (^$unsigned((wire3 ? (8'hab) : reg256)))}))
        begin
          reg258 <= wire3;
        end
      else
        begin
          reg258 <= {(!{$unsigned((reg180 >= reg177))})};
          reg259 <= ($unsigned((^$signed((+wire2)))) ?
              reg160[(3'h4):(1'h1)] : wire2[(1'h0):(1'h0)]);
          reg260 <= (8'ha7);
        end
    end
  module60 #() modinst262 (wire261, clk, reg195, reg162, wire1, reg197);
  assign wire263 = reg196[(2'h3):(2'h3)];
endmodule

module module204  (y, clk, wire208, wire207, wire206, wire205);
  output wire [(32'h19c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire208;
  input wire [(4'he):(1'h0)] wire207;
  input wire signed [(4'hf):(1'h0)] wire206;
  input wire [(3'h6):(1'h0)] wire205;
  wire signed [(4'h8):(1'h0)] wire246;
  wire signed [(5'h13):(1'h0)] wire245;
  wire [(2'h3):(1'h0)] wire239;
  wire signed [(5'h10):(1'h0)] wire238;
  wire [(2'h3):(1'h0)] wire237;
  wire signed [(4'hd):(1'h0)] wire236;
  wire signed [(4'h9):(1'h0)] wire235;
  wire signed [(4'hd):(1'h0)] wire234;
  wire [(4'h9):(1'h0)] wire215;
  wire signed [(3'h7):(1'h0)] wire214;
  wire [(5'h14):(1'h0)] wire213;
  wire [(5'h11):(1'h0)] wire212;
  wire [(5'h13):(1'h0)] wire209;
  reg [(3'h7):(1'h0)] reg244 = (1'h0);
  reg [(3'h5):(1'h0)] reg243 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg242 = (1'h0);
  reg [(3'h4):(1'h0)] reg241 = (1'h0);
  reg signed [(4'he):(1'h0)] reg240 = (1'h0);
  reg [(3'h4):(1'h0)] reg233 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg232 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg231 = (1'h0);
  reg [(4'hc):(1'h0)] reg230 = (1'h0);
  reg [(3'h4):(1'h0)] reg229 = (1'h0);
  reg [(2'h3):(1'h0)] reg228 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg227 = (1'h0);
  reg [(4'hb):(1'h0)] reg226 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg225 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg224 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg223 = (1'h0);
  reg [(4'ha):(1'h0)] reg222 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg221 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg220 = (1'h0);
  reg [(4'hd):(1'h0)] reg219 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg218 = (1'h0);
  reg [(3'h4):(1'h0)] reg217 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg216 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg211 = (1'h0);
  reg [(4'hc):(1'h0)] reg210 = (1'h0);
  assign y = {wire246,
                 wire245,
                 wire239,
                 wire238,
                 wire237,
                 wire236,
                 wire235,
                 wire234,
                 wire215,
                 wire214,
                 wire213,
                 wire212,
                 wire209,
                 reg244,
                 reg243,
                 reg242,
                 reg241,
                 reg240,
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
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg211,
                 reg210,
                 (1'h0)};
  assign wire209 = (+(wire206 ?
                       (wire206 >> $signed((~&(8'hb7)))) : $signed({wire205,
                           wire205})));
  always
    @(posedge clk) begin
      reg210 <= $signed((($signed($unsigned(wire209)) & $unsigned(wire207[(4'ha):(2'h3)])) ?
          wire208[(3'h5):(1'h0)] : $unsigned((wire206[(1'h0):(1'h0)] <= wire207))));
      reg211 <= wire208;
    end
  assign wire212 = $unsigned({wire208[(3'h5):(3'h5)]});
  assign wire213 = (wire208 && $signed((((wire212 && (7'h42)) <= (wire205 ~^ (8'ha0))) == $signed((wire209 >= reg211)))));
  assign wire214 = (wire206 < ($signed(((~|wire206) * {wire209, wire208})) ?
                       (wire209[(5'h13):(4'he)] | reg210) : wire209));
  assign wire215 = $unsigned(((wire209[(5'h10):(1'h1)] ?
                           $signed($unsigned((8'ha0))) : (&{reg211, wire212})) ?
                       $signed(wire208) : $unsigned($unsigned(((8'hb4) ?
                           reg210 : (8'ha6))))));
  always
    @(posedge clk) begin
      if (wire209)
        begin
          reg216 <= wire209[(4'h8):(1'h1)];
          reg217 <= ($unsigned({((~|wire213) >>> $signed(wire212))}) ?
              (wire215 ?
                  ((~(wire207 ? wire207 : wire206)) ?
                      wire205 : $signed(reg216[(3'h4):(3'h4)])) : (($unsigned(wire214) != $unsigned(wire213)) ?
                      $unsigned((~&wire209)) : $signed((~&reg210)))) : ($unsigned(((&reg216) ?
                      reg210[(3'h4):(1'h0)] : $signed(wire208))) ?
                  (~^((|reg210) ?
                      wire213[(3'h7):(2'h2)] : {wire208})) : $unsigned(reg210[(3'h5):(2'h2)])));
        end
      else
        begin
          reg216 <= wire208[(1'h1):(1'h0)];
          reg217 <= wire206;
          if ((((reg216[(4'h9):(3'h7)] ?
                  (~$signed((8'hb4))) : {(~|wire206)}) ^~ $unsigned(wire212)) ?
              ($signed((8'ha6)) ?
                  ($unsigned($unsigned(wire212)) ?
                      ($signed(wire207) ?
                          (wire208 ?
                              (8'hac) : reg210) : reg211[(4'h8):(4'h8)]) : wire205[(2'h3):(2'h3)]) : reg211) : ($signed(reg210) ~^ reg210)))
            begin
              reg218 <= (reg210[(2'h2):(1'h0)] ?
                  {reg211[(2'h3):(1'h1)],
                      $unsigned((^$signed(wire214)))} : $signed(({$unsigned(wire214),
                          {wire214}} ?
                      (8'hb5) : (+(wire212 <<< reg217)))));
              reg219 <= wire213;
              reg220 <= {($unsigned(((wire208 ^ wire209) ?
                          wire209 : ((8'hb8) ? wire209 : wire212))) ?
                      ($signed(wire208) ?
                          (~((8'hbc) ?
                              wire207 : (8'h9c))) : (reg211 | {wire215})) : ((^~(wire212 ^~ reg217)) ?
                          $signed((wire213 || wire209)) : wire209[(4'hd):(4'hb)])),
                  (|{$unsigned(wire208[(3'h4):(1'h0)]),
                      {(wire205 ? reg218 : wire207), $unsigned((8'hb4))}})};
            end
          else
            begin
              reg218 <= $unsigned($signed((((wire206 <= wire214) ~^ reg210) ?
                  wire214 : (reg211 < (reg210 ? (8'hbf) : wire207)))));
              reg219 <= (+$unsigned({$unsigned(wire214[(3'h5):(3'h4)])}));
              reg220 <= $signed((7'h41));
              reg221 <= ($unsigned($signed(reg216[(4'hf):(1'h1)])) ?
                  ((($unsigned(wire212) ?
                          $signed(wire213) : (wire205 != wire214)) ?
                      (7'h43) : (reg211[(3'h7):(1'h1)] ^~ $unsigned(wire205))) & (wire208 >>> $unsigned(reg210[(4'h8):(3'h5)]))) : (|wire209));
              reg222 <= (-wire205);
            end
          reg223 <= (+reg220[(2'h2):(2'h2)]);
        end
      reg224 <= wire207[(3'h6):(2'h2)];
      if ((($signed(($signed(reg220) | (~^wire206))) && wire209) ?
          reg211[(1'h1):(1'h0)] : $unsigned(reg216)))
        begin
          reg225 <= $signed(reg216);
          if (($unsigned($unsigned((^~reg219[(4'ha):(1'h1)]))) < reg217[(1'h1):(1'h1)]))
            begin
              reg226 <= ((~&(($unsigned(wire207) == (wire207 * wire212)) ?
                  {(!reg224),
                      (wire206 <<< (8'hb4))} : ((~&reg216) > (8'hb3)))) ^ (~&$signed($signed($unsigned(wire208)))));
              reg227 <= ((8'h9f) ? (~wire208[(2'h2):(2'h2)]) : reg216);
            end
          else
            begin
              reg226 <= (wire205 == wire213[(4'hc):(4'h8)]);
              reg227 <= $signed(((8'haf) ?
                  (~reg218[(1'h0):(1'h0)]) : (wire213[(4'h9):(3'h4)] ?
                      $unsigned($signed(wire207)) : $signed({wire209,
                          (8'ha2)}))));
              reg228 <= (&wire208[(1'h1):(1'h1)]);
              reg229 <= ((wire208 ?
                      reg228[(1'h0):(1'h0)] : $unsigned(($unsigned((8'ha8)) ?
                          (|(8'hbf)) : wire215[(4'h9):(3'h7)]))) ?
                  (((7'h43) ?
                      {$unsigned(reg217),
                          (|wire207)} : $signed({reg226})) || {reg211[(2'h3):(2'h2)]}) : reg221);
              reg230 <= (^~($signed({(reg218 ? reg227 : reg216),
                  {reg218}}) == {wire207[(4'he):(3'h6)]}));
            end
          reg231 <= $signed($signed((|wire215)));
          reg232 <= $unsigned({(~|((wire214 <<< reg211) > reg227))});
        end
      else
        begin
          reg225 <= wire205[(2'h3):(2'h3)];
        end
      reg233 <= reg216;
    end
  assign wire234 = ($unsigned((-((~|reg231) < (+wire209)))) - $signed($unsigned((~$unsigned(wire212)))));
  assign wire235 = {reg229[(2'h2):(1'h0)]};
  assign wire236 = $signed($unsigned(wire212));
  assign wire237 = reg232[(1'h0):(1'h0)];
  assign wire238 = {wire205};
  assign wire239 = ($signed($unsigned((8'hb6))) ?
                       (~^(reg221[(4'hb):(1'h1)] || ($unsigned(wire235) << {reg229,
                           reg231}))) : (+(^~wire237[(2'h3):(2'h2)])));
  always
    @(posedge clk) begin
      if ({$unsigned((!(~^(~|wire214)))),
          $signed((reg224 & (reg216[(4'hd):(1'h0)] < $unsigned((7'h43)))))})
        begin
          if (($signed($unsigned((8'hbf))) * ($unsigned(wire235[(3'h5):(1'h0)]) ?
              reg219[(3'h4):(2'h3)] : (reg228 > reg230[(3'h5):(3'h5)]))))
            begin
              reg240 <= reg230[(3'h4):(2'h3)];
              reg241 <= (((8'hb1) ?
                  $signed(reg223[(1'h0):(1'h0)]) : ((~|reg226[(2'h3):(1'h0)]) <= reg225)) + (wire214[(3'h7):(2'h3)] ?
                  $unsigned((8'hb9)) : {($unsigned(reg227) * reg231[(3'h4):(3'h4)]),
                      wire239[(1'h0):(1'h0)]}));
            end
          else
            begin
              reg240 <= $signed(reg227);
              reg241 <= reg221[(4'h8):(3'h4)];
            end
          reg242 <= reg228[(1'h0):(1'h0)];
          reg243 <= $signed((-(wire235[(4'h8):(1'h1)] ?
              $signed((reg229 << reg217)) : reg223[(1'h0):(1'h0)])));
          reg244 <= wire215[(3'h7):(1'h0)];
        end
      else
        begin
          reg240 <= $signed(wire205);
        end
    end
  assign wire245 = (^~(&(($unsigned(wire237) ?
                           wire238 : reg243[(2'h2):(1'h0)]) ?
                       $unsigned($signed(reg223)) : $unsigned($signed(reg218)))));
  assign wire246 = $signed($unsigned((+{reg221})));
endmodule

module module4  (y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h164):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire9;
  input wire [(4'hc):(1'h0)] wire8;
  input wire [(3'h7):(1'h0)] wire7;
  input wire [(2'h2):(1'h0)] wire6;
  input wire signed [(3'h6):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire156;
  wire signed [(3'h6):(1'h0)] wire155;
  wire signed [(5'h10):(1'h0)] wire154;
  wire [(2'h2):(1'h0)] wire153;
  wire [(5'h10):(1'h0)] wire58;
  wire [(4'hb):(1'h0)] wire32;
  wire signed [(2'h3):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire22;
  wire signed [(4'hb):(1'h0)] wire21;
  wire [(4'ha):(1'h0)] wire20;
  wire signed [(2'h3):(1'h0)] wire19;
  wire [(4'hb):(1'h0)] wire17;
  wire [(5'h10):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire10;
  wire signed [(4'hf):(1'h0)] wire116;
  wire [(3'h5):(1'h0)] wire151;
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  assign y = {wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire58,
                 wire32,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire17,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire116,
                 wire151,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg18,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire10 = (wire9 || (-((8'haf) ?
                      wire7[(1'h0):(1'h0)] : wire6[(2'h2):(1'h0)])));
  assign wire11 = $signed(((wire8 ?
                          ((-wire9) ? (~wire6) : $signed((8'ha3))) : wire5) ?
                      $signed(wire6) : wire10[(1'h0):(1'h0)]));
  assign wire12 = wire10[(1'h0):(1'h0)];
  assign wire13 = $unsigned($signed($signed(((wire6 ? wire5 : wire9) ?
                      $unsigned(wire8) : (wire7 ? wire7 : wire6)))));
  assign wire14 = $signed(wire9[(3'h7):(3'h6)]);
  always
    @(posedge clk) begin
      reg15 <= {wire9[(2'h3):(2'h3)]};
      reg16 <= (((($signed(wire9) ^ (reg15 ? wire8 : (7'h40))) << (reg15 ?
              (wire10 - wire11) : (wire7 ? wire5 : (7'h43)))) ?
          $unsigned($signed((wire13 || wire5))) : $unsigned((wire7[(1'h0):(1'h0)] <<< {(8'hae),
              wire12}))) << wire5);
    end
  assign wire17 = $signed(wire9[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg18 <= $signed(wire10[(1'h1):(1'h0)]);
    end
  assign wire19 = (wire12 >= {(wire12 ? $unsigned((~&wire17)) : wire8),
                      $unsigned((wire14[(4'ha):(2'h3)] ? wire14 : wire10))});
  assign wire20 = (+$signed(wire6[(2'h2):(1'h0)]));
  assign wire21 = (((8'h9f) != ({$unsigned(wire13)} >>> (wire6 >= (wire19 ?
                      reg15 : wire14)))) <= $unsigned($signed(wire13)));
  assign wire22 = (wire6 ?
                      ((^$unsigned($unsigned(wire14))) ?
                          {{wire21}} : $signed({(wire20 != reg15)})) : $signed($unsigned(($unsigned(wire8) && wire5))));
  assign wire23 = ({($signed(wire17) & $unsigned({wire17, wire13}))} * wire11);
  always
    @(posedge clk) begin
      if (((+(((7'h42) == wire7[(3'h7):(3'h7)]) >= ($signed((8'ha2)) ?
          $unsigned(wire20) : wire13))) ^~ ((~|(wire14 && wire11)) ?
          {$signed((-(8'ha6)))} : (^(+(reg18 ? wire23 : wire17))))))
        begin
          if (wire17[(3'h6):(3'h4)])
            begin
              reg24 <= wire5[(3'h6):(2'h3)];
              reg25 <= {$unsigned(($unsigned((^~wire13)) & wire17))};
            end
          else
            begin
              reg24 <= $signed($unsigned(({$unsigned(wire6)} >> ((~^reg16) > wire9))));
              reg25 <= ((((~^$unsigned(wire8)) ?
                  (wire13[(1'h0):(1'h0)] ?
                      wire20 : $unsigned(reg24)) : $unsigned($unsigned(wire13))) < ((~|{wire6}) - (+((7'h43) ?
                  wire12 : (8'hae))))) * $unsigned(wire8[(2'h3):(2'h2)]));
              reg26 <= wire20[(2'h3):(2'h2)];
            end
          reg27 <= ((wire23[(1'h1):(1'h1)] == wire17) || wire20[(2'h3):(1'h1)]);
        end
      else
        begin
          reg24 <= $signed($unsigned(($unsigned((~|wire8)) ?
              $signed({wire21}) : wire9[(2'h3):(2'h3)])));
          reg25 <= wire14;
          reg26 <= wire20;
          if ((!$signed((8'ha4))))
            begin
              reg27 <= wire6;
              reg28 <= $unsigned((~|reg26[(5'h13):(4'ha)]));
              reg29 <= (((~(wire14 == wire23[(2'h2):(2'h2)])) - wire13[(4'h9):(2'h2)]) ?
                  (~^$unsigned($unsigned($unsigned(wire17)))) : $signed((~&wire23[(2'h2):(1'h0)])));
              reg30 <= $signed(($unsigned($signed(((8'hb3) ^~ wire7))) > ($unsigned($signed(wire22)) ?
                  reg29 : $unsigned(wire10[(2'h2):(2'h2)]))));
            end
          else
            begin
              reg27 <= (reg30 & ((reg18 && ((+(8'h9f)) ? wire9 : wire8)) ?
                  {$unsigned((8'ha4))} : wire14[(2'h2):(1'h0)]));
              reg28 <= ((8'ha3) ?
                  ($signed($signed(reg24)) ?
                      ({{reg24}} >>> {(-reg18),
                          (-wire23)}) : $unsigned($signed($unsigned((8'ha1))))) : reg29);
              reg29 <= wire19[(1'h1):(1'h1)];
              reg30 <= (wire8 ?
                  $unsigned(((reg15[(2'h2):(1'h1)] ?
                          (wire22 != wire6) : wire10) ?
                      (^~(wire17 ?
                          reg29 : wire5)) : wire5[(2'h3):(1'h0)])) : wire12);
            end
          reg31 <= ($signed((^(((8'ha8) ^~ wire5) || reg25[(4'hd):(3'h4)]))) ^ (~^(+wire21)));
        end
    end
  assign wire32 = $unsigned((-reg26[(4'hd):(3'h6)]));
  module33 #() modinst59 (.y(wire58), .wire37(reg28), .wire35(wire20), .wire34(wire11), .wire36(wire12), .clk(clk));
  module60 #() modinst117 (wire116, clk, reg29, reg31, wire58, wire21);
  module118 #() modinst152 (wire151, clk, reg29, wire12, wire20, wire7);
  assign wire153 = wire22;
  assign wire154 = ({wire10, wire22[(4'ha):(1'h1)]} ?
                       (~^$unsigned({reg26, $unsigned((8'hb5))})) : reg15);
  assign wire155 = $signed(reg30);
  assign wire156 = wire14;
endmodule

module module118  (y, clk, wire122, wire121, wire120, wire119);
  output wire [(32'h125):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire122;
  input wire [(5'h12):(1'h0)] wire121;
  input wire signed [(4'h8):(1'h0)] wire120;
  input wire signed [(3'h5):(1'h0)] wire119;
  wire signed [(3'h7):(1'h0)] wire150;
  wire [(3'h4):(1'h0)] wire128;
  wire signed [(4'h8):(1'h0)] wire127;
  wire [(4'hc):(1'h0)] wire126;
  wire signed [(4'hb):(1'h0)] wire125;
  wire signed [(5'h15):(1'h0)] wire124;
  wire [(4'hf):(1'h0)] wire123;
  reg signed [(4'hd):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg148 = (1'h0);
  reg [(2'h3):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg146 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg144 = (1'h0);
  reg [(2'h2):(1'h0)] reg143 = (1'h0);
  reg [(5'h13):(1'h0)] reg142 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg140 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg139 = (1'h0);
  reg [(3'h6):(1'h0)] reg138 = (1'h0);
  reg [(4'hd):(1'h0)] reg137 = (1'h0);
  reg [(5'h14):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg135 = (1'h0);
  reg [(4'h9):(1'h0)] reg134 = (1'h0);
  reg [(3'h5):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg132 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg131 = (1'h0);
  reg [(4'h9):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg129 = (1'h0);
  assign y = {wire150,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
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
                 (1'h0)};
  assign wire123 = wire122;
  assign wire124 = wire119[(1'h0):(1'h0)];
  assign wire125 = $unsigned($unsigned($unsigned($unsigned(wire120))));
  assign wire126 = $unsigned(({({wire123} ?
                           (wire121 ^~ wire124) : {wire125,
                               wire119})} | wire120));
  assign wire127 = (wire119[(1'h0):(1'h0)] ?
                       $signed(wire119[(1'h0):(1'h0)]) : $signed((wire122 & $unsigned(wire121))));
  assign wire128 = wire124;
  always
    @(posedge clk) begin
      reg129 <= {wire126[(3'h6):(3'h5)]};
    end
  always
    @(posedge clk) begin
      if ($signed((~^wire122[(3'h5):(2'h2)])))
        begin
          reg130 <= $unsigned(($unsigned(($signed(reg129) | $signed((8'ha5)))) ?
              $unsigned(({wire127, wire128} ?
                  wire128[(3'h4):(1'h0)] : $unsigned(wire122))) : (8'hb6)));
        end
      else
        begin
          reg130 <= $unsigned((8'hbe));
          if ((|$signed((8'hba))))
            begin
              reg131 <= (wire124 - wire127);
              reg132 <= $signed($unsigned($unsigned((8'hb4))));
            end
          else
            begin
              reg131 <= wire126;
              reg132 <= $signed($signed((|(-wire120[(3'h4):(3'h4)]))));
            end
          reg133 <= ($unsigned($unsigned((^~reg131[(2'h2):(1'h0)]))) <<< (8'hb8));
        end
      reg134 <= $unsigned($unsigned(((+$signed(wire119)) ?
          ((wire123 ?
              wire127 : reg130) << $unsigned(reg132)) : reg131[(3'h5):(2'h3)])));
    end
  always
    @(posedge clk) begin
      reg135 <= (+wire128[(3'h4):(2'h2)]);
      if ((&(|(|wire126[(4'ha):(2'h2)]))))
        begin
          if (wire127[(2'h3):(1'h1)])
            begin
              reg136 <= $signed((~|(~^($signed((8'hbf)) || wire120[(4'h8):(3'h7)]))));
              reg137 <= ($unsigned((reg130 ?
                  wire124[(5'h12):(4'hf)] : (((8'hb0) >> wire128) ?
                      $signed(wire127) : wire128[(2'h3):(1'h1)]))) + wire121);
              reg138 <= (wire124 != (!reg130[(3'h6):(3'h6)]));
            end
          else
            begin
              reg136 <= reg136;
              reg137 <= $signed({((!(reg137 ? (8'hb6) : (8'hb4))) ?
                      $unsigned((reg131 <<< reg130)) : $signed($signed(wire126))),
                  $unsigned(reg135[(1'h0):(1'h0)])});
              reg138 <= (reg133[(3'h4):(1'h0)] ?
                  reg129[(2'h3):(2'h2)] : reg132[(1'h1):(1'h1)]);
              reg139 <= $signed($unsigned({reg130[(4'h8):(3'h5)],
                  wire119[(3'h5):(3'h5)]}));
            end
          if (($unsigned(reg139) ? wire122 : wire128))
            begin
              reg140 <= reg135[(4'hc):(4'h9)];
              reg141 <= ((-(~&$unsigned(reg132[(2'h3):(1'h0)]))) ?
                  ($unsigned(reg129[(1'h1):(1'h1)]) ~^ (~^reg140)) : (((wire126[(4'hb):(4'hb)] || {reg132}) ?
                          wire126[(4'h9):(2'h3)] : $signed((wire123 > reg140))) ?
                      wire120[(3'h5):(1'h1)] : $signed($signed($unsigned(reg131)))));
              reg142 <= {$signed((((8'hae) && (reg141 ? reg134 : wire120)) ?
                      (wire128[(2'h2):(1'h1)] ?
                          {wire123} : reg138[(3'h5):(2'h3)]) : $signed((reg136 * reg134))))};
            end
          else
            begin
              reg140 <= reg141;
            end
          reg143 <= {((((reg129 > (7'h41)) < $signed((8'hbc))) ?
                      ($signed(reg140) ?
                          wire124[(5'h14):(4'hd)] : {reg137,
                              (8'ha1)}) : wire120) ?
                  reg135 : wire123),
              $signed((|wire122))};
          reg144 <= $signed($signed((^(-(reg130 != wire119)))));
          if ((7'h43))
            begin
              reg145 <= $signed(reg135);
              reg146 <= (reg134[(4'h8):(1'h0)] ^ reg143);
              reg147 <= (((wire125 << $unsigned($signed(reg136))) < wire125) || (reg139[(3'h6):(3'h6)] ?
                  wire126 : (reg130[(3'h5):(2'h3)] == $unsigned($unsigned(reg140)))));
            end
          else
            begin
              reg145 <= (&$unsigned(wire124[(4'hd):(3'h5)]));
              reg146 <= reg129;
              reg147 <= (($signed(reg132[(3'h6):(2'h3)]) ?
                  (reg146[(3'h6):(1'h1)] ?
                      $unsigned(wire126) : reg131[(1'h1):(1'h0)]) : reg147) - $unsigned(reg137[(4'hd):(1'h0)]));
            end
        end
      else
        begin
          if (({reg139[(2'h3):(1'h0)]} | wire125))
            begin
              reg136 <= ((reg135[(4'hb):(1'h1)] ?
                  wire121[(4'ha):(4'h9)] : wire124) != $signed($unsigned(((reg140 ?
                      reg147 : (7'h44)) ?
                  reg134[(4'h9):(3'h7)] : reg144[(2'h3):(1'h0)]))));
              reg137 <= reg142[(4'h8):(1'h1)];
            end
          else
            begin
              reg136 <= reg136[(2'h2):(1'h0)];
              reg137 <= reg141[(3'h6):(1'h0)];
              reg138 <= reg142[(5'h11):(4'h9)];
              reg139 <= $signed((|$unsigned($unsigned($signed(reg137)))));
            end
          reg140 <= ($unsigned(reg139[(3'h6):(3'h6)]) ?
              (~&(reg130[(4'h8):(1'h0)] || $unsigned(wire125[(4'h8):(4'h8)]))) : (&(+reg141[(3'h4):(2'h3)])));
          reg141 <= $signed($unsigned((~&(7'h41))));
          reg142 <= ((-(!wire125)) ?
              {$unsigned($signed(reg134)), (reg138 < reg142)} : (8'hb3));
          reg143 <= {{reg139,
                  $signed(((reg141 ? wire126 : (8'hbf)) >= wire121))},
              reg131};
        end
      reg148 <= wire123[(3'h5):(3'h5)];
      reg149 <= ($signed(wire126) ?
          (reg133[(2'h3):(2'h2)] ? reg135 : reg132) : (^{reg146,
              wire126[(4'h9):(3'h5)]}));
    end
  assign wire150 = (8'ha4);
endmodule

module module60
#(parameter param114 = ((((~^(~|(8'hab))) ? ((8'hb4) ? ((8'had) + (8'hba)) : ((7'h41) ? (8'h9e) : (8'hab))) : ((8'haa) - ((8'hb9) ? (8'ha2) : (8'ha6)))) ^ ((((8'hbc) * (8'ha8)) >>> (7'h42)) < (~^(+(8'ha5))))) ? (((((7'h42) ? (7'h42) : (8'haa)) < {(8'ha5)}) != (~^((8'hbc) != (8'ha8)))) ? (|(((8'hae) ? (8'hb9) : (8'hbc)) * (-(7'h41)))) : {({(8'hab), (8'ha0)} - ((8'ha1) + (8'hbe)))}) : ((({(8'ha4)} <= ((8'hae) >> (8'hb1))) ? (((8'ha7) ? (8'hbc) : (8'haa)) && ((8'ha1) ? (8'haa) : (8'hb2))) : (((8'hba) ? (8'ha0) : (8'hb7)) ? (!(8'haa)) : ((7'h42) ? (8'had) : (8'hb8)))) && ((~&{(7'h44)}) >> ((-(8'hbd)) < ((8'ha6) << (8'hb7)))))), 
parameter param115 = {(((+param114) | param114) << ((param114 || (param114 ? param114 : (7'h41))) >> (!(8'ha3)))), ((+(8'ha2)) <= (param114 ? ({param114, param114} ? (param114 < (8'hb8)) : ((8'ha7) | param114)) : (~&(param114 <<< param114))))})
(y, clk, wire64, wire63, wire62, wire61);
  output wire [(32'h27c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire64;
  input wire signed [(4'hd):(1'h0)] wire63;
  input wire [(5'h10):(1'h0)] wire62;
  input wire signed [(4'hb):(1'h0)] wire61;
  wire [(3'h4):(1'h0)] wire113;
  wire signed [(5'h14):(1'h0)] wire111;
  wire signed [(4'ha):(1'h0)] wire110;
  wire [(4'he):(1'h0)] wire98;
  wire signed [(5'h14):(1'h0)] wire94;
  wire signed [(5'h12):(1'h0)] wire93;
  wire [(5'h13):(1'h0)] wire92;
  wire [(3'h5):(1'h0)] wire91;
  wire signed [(5'h14):(1'h0)] wire90;
  wire signed [(4'he):(1'h0)] wire89;
  wire [(4'ha):(1'h0)] wire76;
  wire signed [(3'h5):(1'h0)] wire69;
  wire signed [(3'h6):(1'h0)] wire68;
  wire signed [(4'h9):(1'h0)] wire67;
  wire signed [(5'h13):(1'h0)] wire66;
  wire signed [(3'h6):(1'h0)] wire65;
  reg [(5'h12):(1'h0)] reg112 = (1'h0);
  reg [(4'hc):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg108 = (1'h0);
  reg [(4'hc):(1'h0)] reg107 = (1'h0);
  reg [(5'h12):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg103 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg102 = (1'h0);
  reg [(5'h13):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg100 = (1'h0);
  reg [(5'h11):(1'h0)] reg99 = (1'h0);
  reg [(5'h14):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg87 = (1'h0);
  reg [(5'h15):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg85 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg83 = (1'h0);
  reg [(4'hf):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg81 = (1'h0);
  reg [(4'he):(1'h0)] reg80 = (1'h0);
  reg signed [(4'he):(1'h0)] reg79 = (1'h0);
  reg [(4'ha):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg77 = (1'h0);
  reg [(4'hb):(1'h0)] reg75 = (1'h0);
  reg [(4'hc):(1'h0)] reg74 = (1'h0);
  reg [(4'ha):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg72 = (1'h0);
  reg [(4'h8):(1'h0)] reg71 = (1'h0);
  reg [(2'h2):(1'h0)] reg70 = (1'h0);
  assign y = {wire113,
                 wire111,
                 wire110,
                 wire98,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire76,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
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
                 reg97,
                 reg96,
                 reg95,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 (1'h0)};
  assign wire65 = ($unsigned(wire63[(4'hd):(1'h1)]) * $unsigned($signed((wire63[(3'h7):(3'h6)] <<< wire61[(3'h6):(3'h5)]))));
  assign wire66 = (~(7'h43));
  assign wire67 = $unsigned(wire64[(4'hf):(3'h6)]);
  assign wire68 = (((!($unsigned((8'hb6)) + $unsigned(wire64))) & wire62[(1'h1):(1'h1)]) ?
                      wire63[(4'h8):(1'h0)] : wire64);
  assign wire69 = $signed(wire66[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg70 <= wire64[(3'h6):(3'h5)];
    end
  always
    @(posedge clk) begin
      reg71 <= (wire69 ?
          reg70 : $unsigned($unsigned((&((8'hba) ? wire68 : wire69)))));
      reg72 <= $unsigned($signed({(((8'ha0) ~^ wire69) | (~|wire68)),
          ((wire61 ^ wire67) ? {wire63} : (wire66 - (8'hae)))}));
      reg73 <= wire61;
      reg74 <= wire67[(3'h6):(1'h1)];
      reg75 <= ($signed({wire62[(3'h7):(1'h0)],
              ($unsigned(wire65) > (reg72 ^~ (8'hab)))}) ?
          (($unsigned(reg74) ? $unsigned(wire61) : reg72[(3'h6):(1'h0)]) ?
              wire63 : (reg70 <= {$unsigned(wire62)})) : wire61[(4'ha):(4'ha)]);
    end
  assign wire76 = wire65[(3'h6):(1'h0)];
  always
    @(posedge clk) begin
      if ({{$signed($unsigned($signed((8'h9e)))),
              (wire64 <= ((wire67 >= wire67) <= ((8'hba) >= reg71)))}})
        begin
          if ((8'ha6))
            begin
              reg77 <= $unsigned(($unsigned(({wire66, reg72} <<< wire62)) ?
                  wire76 : (+wire67)));
              reg78 <= (+((((wire61 ? wire63 : wire66) ? {(7'h41)} : reg71) ?
                  wire67[(3'h6):(3'h6)] : ($unsigned(reg74) ?
                      reg73 : reg73[(4'h9):(3'h4)])) ^~ reg77));
              reg79 <= wire61;
              reg80 <= {{({(reg71 ? wire69 : reg78)} ?
                          $unsigned(reg75[(1'h1):(1'h0)]) : {$signed(wire61)}),
                      ((~^(|reg77)) ?
                          (reg74 == {reg78, (8'hb7)}) : (~^{reg70, wire65}))},
                  (reg75[(1'h1):(1'h1)] ?
                      {(!reg77[(3'h4):(2'h2)])} : $signed({wire61,
                          (~|wire61)}))};
              reg81 <= (~&$unsigned(wire64));
            end
          else
            begin
              reg77 <= $signed(($unsigned((^reg81)) || ({$signed(reg72)} ?
                  reg74 : (~reg80[(4'h9):(3'h5)]))));
              reg78 <= {$signed(reg80)};
              reg79 <= ($signed((wire67[(2'h3):(2'h3)] ?
                  ($signed(wire65) ?
                      wire65[(1'h1):(1'h0)] : (wire69 <= reg78)) : (|reg74[(3'h7):(1'h1)]))) >> (wire62 >>> (+(wire61 ?
                  {wire68} : $unsigned(wire63)))));
              reg80 <= (&(+$unsigned((~|(wire69 == reg75)))));
              reg81 <= $signed($unsigned({wire63,
                  ($signed(wire68) ? (^~reg81) : (reg75 + reg70))}));
            end
        end
      else
        begin
          if (((($unsigned((8'h9f)) ~^ reg75[(3'h5):(1'h1)]) > (~|((reg70 ?
                  (8'hba) : reg71) <= wire62[(1'h0):(1'h0)]))) ?
              (^~(reg72 + ($signed(wire66) ?
                  (~&wire67) : (reg75 + wire63)))) : (~^$unsigned(($unsigned(wire68) ?
                  reg77 : ((7'h42) ? (8'ha0) : reg73))))))
            begin
              reg77 <= $unsigned({(($signed(reg78) >>> (~&wire64)) ?
                      $unsigned(((8'h9c) ~^ reg77)) : (reg78 ?
                          $signed(reg70) : wire62[(3'h7):(2'h3)])),
                  $signed(((~|wire69) << {(8'ha8), wire62}))});
              reg78 <= (+$signed($signed(reg75)));
              reg79 <= $signed($unsigned(reg70));
              reg80 <= (~^(&reg71[(2'h2):(2'h2)]));
              reg81 <= ($unsigned((~|((reg74 == wire76) ~^ reg74[(4'hc):(4'h8)]))) ~^ ((wire65[(1'h1):(1'h0)] ?
                      ((wire64 ?
                          (8'hb8) : reg80) > ((8'had) >>> wire67)) : reg80) ?
                  $signed((~(wire67 ? (7'h44) : reg73))) : (^~(~|{reg72,
                      reg70}))));
            end
          else
            begin
              reg77 <= wire64;
              reg78 <= {(reg79 ? (~reg73) : (reg79 > reg73[(4'ha):(4'h8)])),
                  (~$unsigned((wire62[(4'hb):(4'h8)] | (reg81 ?
                      (8'ha7) : wire69))))};
            end
          reg82 <= ((wire66[(2'h2):(2'h2)] ?
              $unsigned(((reg80 > wire64) ?
                  (~reg81) : $signed(wire66))) : (!(+((8'hae) << reg75)))) + (($signed($unsigned(reg74)) >= $signed({reg81})) ?
              wire69 : $unsigned(((+reg73) <<< (!reg81)))));
          reg83 <= $unsigned(($signed({(8'hb8)}) ?
              $signed(((+reg81) ? (8'hab) : reg72[(4'hb):(4'hb)])) : (reg80 ?
                  $signed($signed(wire66)) : (-(wire68 < wire76)))));
          if ({$signed(($signed(reg71) ? wire65 : (~^(7'h43)))),
              (^~$unsigned($signed($unsigned(reg77))))})
            begin
              reg84 <= wire76;
              reg85 <= $unsigned(((reg73 << $signed((wire62 * reg71))) + $unsigned({wire67})));
              reg86 <= (8'haf);
              reg87 <= reg79[(4'he):(3'h4)];
              reg88 <= $unsigned((wire61 ?
                  reg72[(4'hf):(4'h8)] : $signed((wire63[(4'hd):(4'hb)] && (reg72 + reg80)))));
            end
          else
            begin
              reg84 <= (^(+$unsigned(reg72[(4'hf):(4'hc)])));
            end
        end
    end
  assign wire89 = wire76[(2'h2):(1'h0)];
  assign wire90 = $unsigned($signed($unsigned({(reg75 ? reg75 : reg80)})));
  assign wire91 = reg81;
  assign wire92 = $unsigned(reg87[(5'h12):(4'hc)]);
  assign wire93 = $unsigned((^~(reg85 ?
                      $signed(((8'hba) ?
                          wire69 : (8'ha3))) : reg81[(4'hd):(4'hb)])));
  assign wire94 = $signed((8'h9f));
  always
    @(posedge clk) begin
      if ((wire64[(3'h4):(1'h1)] << wire61[(1'h0):(1'h0)]))
        begin
          reg95 <= ($signed($signed(reg81[(4'h8):(2'h2)])) ?
              $signed(reg84) : ($signed(wire64) ?
                  (reg86 - $signed((^wire67))) : $signed({(wire62 ^ (8'h9e)),
                      (&reg78)})));
          reg96 <= (-reg71);
          reg97 <= reg74[(1'h1):(1'h1)];
        end
      else
        begin
          reg95 <= $signed(reg75[(3'h7):(2'h2)]);
          reg96 <= $signed(wire76);
        end
    end
  assign wire98 = $signed($unsigned(wire69[(3'h5):(3'h5)]));
  always
    @(posedge clk) begin
      reg99 <= ((~&$signed(((7'h41) + (reg71 >>> wire90)))) ?
          (((!$signed(wire65)) && ($signed(wire65) ^~ $signed(reg72))) - wire67[(4'h8):(4'h8)]) : (8'hb9));
      reg100 <= reg80;
      reg101 <= wire91[(3'h5):(3'h4)];
      reg102 <= ((8'ha0) != $unsigned((~^(|reg78[(3'h4):(1'h0)]))));
      if (({reg81,
              ((-(reg99 != reg79)) ?
                  {(wire94 ? reg87 : reg75),
                      (reg75 ? wire89 : wire92)} : {reg85[(1'h0):(1'h0)]})} ?
          $unsigned(reg84[(1'h0):(1'h0)]) : ((8'hb3) ~^ wire91[(1'h0):(1'h0)])))
        begin
          if ((+reg84))
            begin
              reg103 <= $signed(wire94);
              reg104 <= (~^reg83[(3'h5):(3'h4)]);
            end
          else
            begin
              reg103 <= ({$unsigned((8'h9f)),
                  $signed((|{wire90}))} <<< $signed(((~wire94[(3'h5):(3'h4)]) >= $unsigned($unsigned(wire62)))));
              reg104 <= (((reg70[(1'h0):(1'h0)] ^~ {reg95[(4'ha):(2'h3)],
                  $signed(wire90)}) <<< $signed((((8'ha7) ? reg88 : reg101) ?
                  (&reg81) : wire62[(1'h0):(1'h0)]))) ^ $signed(($signed($unsigned(reg83)) <= (~|{reg95}))));
              reg105 <= {($unsigned(reg95) - $signed((~^(reg79 & wire93)))),
                  (~|$signed(reg72[(4'ha):(3'h6)]))};
              reg106 <= (!(~&(wire61 ?
                  $unsigned($unsigned(reg99)) : (&(reg82 ? reg97 : wire69)))));
            end
          reg107 <= (($signed(($signed(reg77) ?
                  $unsigned(wire66) : (|reg95))) + $unsigned((!(reg104 * (8'h9e))))) ?
              wire65[(1'h1):(1'h1)] : reg83);
          reg108 <= ((~^reg74[(3'h7):(3'h4)]) + $unsigned((((-reg99) > $unsigned(reg80)) ?
              (8'ha4) : ((reg70 < reg79) > wire92))));
          reg109 <= reg106[(4'hd):(4'ha)];
        end
      else
        begin
          reg103 <= (~|$unsigned((8'hbc)));
          reg104 <= reg95;
        end
    end
  assign wire110 = (^~(reg84 < ((^$signed(reg71)) ?
                       $unsigned($signed((8'had))) : (^~{reg105, wire93}))));
  assign wire111 = ({(~&((8'hb9) <= wire98))} ?
                       ($signed(wire90) ?
                           (reg95[(4'ha):(4'ha)] ?
                               wire69 : (reg86 || {wire90})) : ((reg96 == reg82) == (^$signed(reg87)))) : ((^~(!reg106)) ?
                           reg107 : $signed(wire92)));
  always
    @(posedge clk) begin
      reg112 <= reg77;
    end
  assign wire113 = reg73[(1'h0):(1'h0)];
endmodule

module module33
#(parameter param56 = ((8'h9c) ? ((((7'h41) || ((8'hb2) ~^ (8'hbb))) ? ((|(8'hba)) >= {(8'had), (8'hb5)}) : (((8'hb4) ? (8'hae) : (8'h9c)) && ((8'hab) & (8'hb6)))) < ((^(&(8'ha9))) >>> (~&((8'had) >> (8'haa))))) : ((|{((8'ha4) <<< (8'haf))}) ? ((~&((8'ha7) ? (8'ha3) : (8'haf))) && ((~(8'hb6)) ? ((8'haf) <= (8'haa)) : ((8'hb0) ? (8'hb1) : (8'hb4)))) : {(~|{(8'ha4)}), (((8'hae) ? (8'had) : (7'h43)) ? ((8'ha8) >>> (8'ha5)) : {(8'hb3), (8'ha7)})})), 
parameter param57 = (&param56))
(y, clk, wire37, wire36, wire35, wire34);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire37;
  input wire [(5'h11):(1'h0)] wire36;
  input wire signed [(4'ha):(1'h0)] wire35;
  input wire [(4'hb):(1'h0)] wire34;
  wire [(4'hf):(1'h0)] wire55;
  wire [(4'ha):(1'h0)] wire54;
  wire [(4'h9):(1'h0)] wire53;
  wire signed [(4'hd):(1'h0)] wire52;
  wire [(4'hf):(1'h0)] wire51;
  wire [(2'h3):(1'h0)] wire50;
  wire signed [(5'h12):(1'h0)] wire48;
  wire signed [(2'h3):(1'h0)] wire47;
  wire signed [(5'h12):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire43;
  wire [(5'h12):(1'h0)] wire42;
  wire [(3'h7):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire40;
  wire [(3'h6):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire38;
  reg signed [(4'hb):(1'h0)] reg49 = (1'h0);
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg45 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire48,
                 wire47,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 reg49,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire38 = ({$unsigned($unsigned($signed(wire37))),
                      $signed(wire37[(1'h0):(1'h0)])} - $unsigned($signed(((!(8'ha1)) ?
                      $signed(wire34) : wire36))));
  assign wire39 = {(!$signed((wire36 | wire38)))};
  assign wire40 = $signed((^(^wire34[(1'h1):(1'h0)])));
  assign wire41 = {$unsigned($signed($unsigned((wire36 ^ wire37)))),
                      (^~(^~$signed($unsigned(wire36))))};
  assign wire42 = wire34[(4'ha):(1'h1)];
  assign wire43 = (+(+($unsigned((wire34 ? wire41 : wire34)) ?
                      (-(+wire41)) : $unsigned((wire35 ? (8'hb8) : wire42)))));
  assign wire44 = (~^{(((&wire34) ? wire40[(2'h2):(1'h0)] : wire36) ?
                          {$signed(wire41),
                              wire36} : $signed($unsigned(wire41))),
                      wire37});
  always
    @(posedge clk) begin
      reg45 <= (wire34 ?
          (($signed(wire44[(3'h4):(1'h1)]) > (!wire44[(4'hd):(2'h2)])) << $signed((!(!wire37)))) : (~^($signed(wire35) != ((8'h9e) | {wire43,
              wire40}))));
      reg46 <= reg45;
    end
  assign wire47 = $signed((~&($unsigned((wire39 ?
                      wire43 : wire43)) != $signed({wire42}))));
  assign wire48 = wire40[(3'h5):(1'h1)];
  always
    @(posedge clk) begin
      reg49 <= wire47;
    end
  assign wire50 = $signed({wire48, (^$signed({reg45}))});
  assign wire51 = $unsigned((^(~^({wire44, reg45} ?
                      reg49 : (wire50 ? (8'hae) : wire36)))));
  assign wire52 = $signed(reg46);
  assign wire53 = (+({(8'ha3), wire39[(3'h4):(2'h2)]} ? wire50 : wire41));
  assign wire54 = {{wire40[(4'he):(4'hc)]},
                      (reg45[(2'h3):(2'h2)] << $signed($unsigned(wire43[(3'h7):(2'h2)])))};
  assign wire55 = $signed((~&{wire48}));
endmodule
