module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire236;
  wire signed [(3'h6):(1'h0)] wire235;
  wire signed [(4'hf):(1'h0)] wire228;
  wire signed [(5'h10):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire230;
  wire signed [(5'h12):(1'h0)] wire231;
  wire [(4'ha):(1'h0)] wire232;
  wire signed [(4'hc):(1'h0)] wire233;
  assign y = {wire236,
                 wire235,
                 wire228,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 wire230,
                 wire231,
                 wire232,
                 wire233,
                 (1'h0)};
  assign wire4 = ($signed((($unsigned(wire0) ?
                     (wire0 << wire0) : {wire2,
                         wire3}) * (-$signed(wire3)))) + (+(wire3[(3'h4):(3'h4)] ?
                     (8'hbd) : (8'hab))));
  assign wire5 = $signed($unsigned(($signed($unsigned(wire2)) || $signed((wire2 && wire2)))));
  assign wire6 = $unsigned((+({(wire0 ? wire4 : wire0), wire4[(3'h7):(1'h0)]} ?
                     wire3 : ((|wire4) ? (wire4 ? wire2 : wire5) : (+wire3)))));
  assign wire7 = (((+wire0[(4'ha):(2'h3)]) ^~ wire0[(3'h5):(1'h0)]) ?
                     $signed(wire6[(4'h8):(3'h5)]) : $signed(($signed($unsigned(wire6)) ^~ wire0[(2'h3):(2'h2)])));
  assign wire8 = $unsigned(wire1);
  assign wire9 = $signed((((-$signed(wire7)) ?
                     $unsigned((wire7 ? wire2 : wire4)) : ((-wire5) ~^ (wire0 ?
                         wire0 : wire5))) << {wire6[(4'he):(2'h3)],
                     wire8[(3'h5):(1'h1)]}));
  assign wire10 = wire3;
  module11 #() modinst229 (wire228, clk, wire10, wire9, wire1, wire6, wire0);
  assign wire230 = $unsigned(({wire9[(4'hb):(1'h0)]} ?
                       $signed(wire1) : (({wire3} >= (wire0 ?
                               (8'had) : (8'hbd))) ?
                           $signed(((8'hb7) ?
                               wire3 : (8'ha3))) : (((8'hab) | wire6) ?
                               $signed(wire1) : (+wire3)))));
  assign wire231 = (~^$unsigned($unsigned((+$signed(wire0)))));
  assign wire232 = wire231;
  module21 #() modinst234 (wire233, clk, wire10, wire0, wire228, wire2, wire5);
  assign wire235 = $signed((+$signed(wire232[(4'h8):(4'h8)])));
  assign wire236 = $unsigned({wire8});
endmodule

module module11
#(parameter param227 = ({(((+(8'hbb)) ? ((8'hae) * (8'ha2)) : ((8'haa) <= (8'ha2))) ? (((7'h44) ? (8'ha4) : (8'hb0)) ? {(7'h41), (8'hae)} : ((7'h41) ? (8'hab) : (8'ha6))) : (^~((8'hbe) ? (8'hb8) : (8'hbd))))} >= (^((((8'ha7) ? (7'h44) : (8'h9d)) ? ((8'h9e) ? (8'ha6) : (8'ha5)) : ((8'ha4) ? (8'ha8) : (7'h41))) ? (^((8'hbc) ? (8'hb0) : (7'h42))) : (&((8'haf) ? (8'h9f) : (7'h43)))))))
(y, clk, wire12, wire13, wire14, wire15, wire16);
  output wire [(32'h337):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire12;
  input wire signed [(5'h12):(1'h0)] wire13;
  input wire [(5'h15):(1'h0)] wire14;
  input wire signed [(4'hc):(1'h0)] wire15;
  input wire [(5'h10):(1'h0)] wire16;
  wire signed [(3'h7):(1'h0)] wire91;
  wire signed [(4'hf):(1'h0)] wire54;
  wire signed [(4'hc):(1'h0)] wire93;
  wire [(5'h11):(1'h0)] wire94;
  wire [(4'hf):(1'h0)] wire148;
  wire signed [(2'h2):(1'h0)] wire199;
  wire signed [(3'h7):(1'h0)] wire200;
  wire signed [(5'h14):(1'h0)] wire201;
  wire [(5'h14):(1'h0)] wire205;
  wire signed [(3'h6):(1'h0)] wire225;
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg150 = (1'h0);
  reg [(5'h14):(1'h0)] reg151 = (1'h0);
  reg [(2'h3):(1'h0)] reg152 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg154 = (1'h0);
  reg [(3'h6):(1'h0)] reg155 = (1'h0);
  reg [(4'hb):(1'h0)] reg156 = (1'h0);
  reg [(4'hf):(1'h0)] reg157 = (1'h0);
  reg [(3'h5):(1'h0)] reg158 = (1'h0);
  reg [(5'h15):(1'h0)] reg159 = (1'h0);
  reg [(3'h7):(1'h0)] reg160 = (1'h0);
  reg [(5'h14):(1'h0)] reg161 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg162 = (1'h0);
  reg [(4'he):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg164 = (1'h0);
  reg [(4'h9):(1'h0)] reg165 = (1'h0);
  reg [(5'h15):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg167 = (1'h0);
  reg [(3'h5):(1'h0)] reg168 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg169 = (1'h0);
  reg [(5'h11):(1'h0)] reg170 = (1'h0);
  reg [(5'h11):(1'h0)] reg171 = (1'h0);
  reg [(5'h15):(1'h0)] reg172 = (1'h0);
  reg [(2'h3):(1'h0)] reg173 = (1'h0);
  reg [(5'h10):(1'h0)] reg174 = (1'h0);
  reg [(2'h3):(1'h0)] reg175 = (1'h0);
  reg [(4'h8):(1'h0)] reg176 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg177 = (1'h0);
  reg [(4'hc):(1'h0)] reg178 = (1'h0);
  reg signed [(4'he):(1'h0)] reg179 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg180 = (1'h0);
  reg [(2'h2):(1'h0)] reg181 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg182 = (1'h0);
  reg [(3'h7):(1'h0)] reg183 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg184 = (1'h0);
  reg [(4'hb):(1'h0)] reg185 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg186 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg187 = (1'h0);
  reg [(4'ha):(1'h0)] reg188 = (1'h0);
  reg [(2'h3):(1'h0)] reg189 = (1'h0);
  reg [(4'hc):(1'h0)] reg190 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg191 = (1'h0);
  reg [(4'h9):(1'h0)] reg192 = (1'h0);
  reg [(2'h3):(1'h0)] reg193 = (1'h0);
  reg [(3'h5):(1'h0)] reg194 = (1'h0);
  reg [(3'h4):(1'h0)] reg195 = (1'h0);
  reg [(4'h8):(1'h0)] reg196 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg197 = (1'h0);
  reg [(5'h14):(1'h0)] reg198 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg202 = (1'h0);
  reg [(5'h10):(1'h0)] reg203 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg204 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg206 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg207 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg208 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg209 = (1'h0);
  reg [(3'h4):(1'h0)] reg210 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg211 = (1'h0);
  reg [(4'hc):(1'h0)] reg212 = (1'h0);
  reg [(4'h9):(1'h0)] reg213 = (1'h0);
  assign y = {wire91,
                 wire54,
                 wire93,
                 wire94,
                 wire148,
                 wire199,
                 wire200,
                 wire201,
                 wire205,
                 wire225,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg150,
                 reg151,
                 reg152,
                 reg153,
                 reg154,
                 reg155,
                 reg156,
                 reg157,
                 reg158,
                 reg159,
                 reg160,
                 reg161,
                 reg162,
                 reg163,
                 reg164,
                 reg165,
                 reg166,
                 reg167,
                 reg168,
                 reg169,
                 reg170,
                 reg171,
                 reg172,
                 reg173,
                 reg174,
                 reg175,
                 reg176,
                 reg177,
                 reg178,
                 reg179,
                 reg180,
                 reg181,
                 reg182,
                 reg183,
                 reg184,
                 reg185,
                 reg186,
                 reg187,
                 reg188,
                 reg189,
                 reg190,
                 reg191,
                 reg192,
                 reg193,
                 reg194,
                 reg195,
                 reg196,
                 reg197,
                 reg198,
                 reg202,
                 reg203,
                 reg204,
                 reg206,
                 reg207,
                 reg208,
                 reg209,
                 reg210,
                 reg211,
                 reg212,
                 reg213,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg17 <= $signed(wire12);
      reg18 <= wire13[(2'h2):(1'h0)];
      reg19 <= wire12;
      reg20 <= $signed(($unsigned((+$signed(wire12))) ?
          (((wire12 * reg17) * (wire15 ? (8'ha5) : wire15)) < (wire12 ?
              $signed(wire12) : {reg18})) : $unsigned((wire16[(5'h10):(4'he)] >>> (^reg19)))));
    end
  module21 #() modinst55 (.y(wire54), .clk(clk), .wire23(reg18), .wire24(wire16), .wire26(wire15), .wire25(wire12), .wire22(reg17));
  module56 #() modinst92 (.wire58(reg17), .wire60(wire16), .wire59(reg20), .wire57(wire12), .clk(clk), .wire61(wire54), .y(wire91));
  assign wire93 = wire14;
  assign wire94 = (~$signed((($unsigned(wire15) ^ $unsigned(reg20)) > reg17[(4'he):(2'h3)])));
  module95 #() modinst149 (wire148, clk, reg17, wire13, wire12, reg18, reg19);
  always
    @(posedge clk) begin
      reg150 <= wire54[(4'he):(4'hd)];
      reg151 <= $signed((wire148[(4'hc):(4'h9)] <= {$unsigned($unsigned(reg150)),
          wire91}));
    end
  always
    @(posedge clk) begin
      if ($signed((($unsigned((-wire13)) - $unsigned($signed(wire148))) ?
          (~|$unsigned((reg19 & reg151))) : wire16[(1'h0):(1'h0)])))
        begin
          reg152 <= wire54;
          reg153 <= $unsigned(wire15);
          reg154 <= reg153;
          reg155 <= reg17;
          if ((8'h9d))
            begin
              reg156 <= ({$signed(wire54[(3'h5):(3'h4)]),
                      reg155[(1'h1):(1'h0)]} ?
                  ($unsigned(wire91[(3'h5):(2'h2)]) ?
                      (~^((reg153 ~^ wire14) || $unsigned(reg18))) : $unsigned((-(^~(8'ha5))))) : (~$unsigned((wire16 >> reg152))));
              reg157 <= (reg150[(3'h4):(1'h0)] - (wire14[(1'h1):(1'h1)] <= wire14));
              reg158 <= ({(&((|(8'hac)) ?
                      (reg150 ?
                          reg151 : wire13) : reg157[(1'h0):(1'h0)]))} ~^ reg19);
            end
          else
            begin
              reg156 <= $unsigned({$signed($unsigned((wire93 * wire16)))});
              reg157 <= wire148[(4'hc):(3'h4)];
              reg158 <= ($signed($signed(wire148[(4'hf):(2'h2)])) > (+{((wire91 ?
                          reg156 : reg18) ?
                      $unsigned(wire15) : ((8'hbe) << wire12))}));
              reg159 <= (+reg150);
              reg160 <= (!($unsigned($signed((wire13 < reg19))) == reg20[(1'h1):(1'h1)]));
            end
        end
      else
        begin
          reg152 <= $unsigned($signed($unsigned((8'ha3))));
          reg153 <= ({(~|wire91[(3'h4):(3'h4)]),
              reg17} ^~ (($unsigned($unsigned(wire16)) ?
                  wire14[(1'h1):(1'h1)] : $unsigned((reg159 ?
                      reg154 : reg150))) ?
              $unsigned($signed($unsigned(wire91))) : $unsigned($signed($signed((8'haa))))));
          reg154 <= (^(!reg150[(5'h10):(4'h8)]));
          reg155 <= (^wire91[(1'h1):(1'h1)]);
          reg156 <= wire94[(3'h4):(3'h4)];
        end
      reg161 <= wire91[(3'h7):(3'h5)];
      if ((reg19 ?
          $unsigned({$signed($signed(reg156)),
              $signed((+reg159))}) : (reg150[(3'h7):(1'h1)] ?
              {reg154[(1'h0):(1'h0)], (8'ha8)} : wire93)))
        begin
          reg162 <= wire16;
          reg163 <= {$signed((reg159[(2'h3):(2'h2)] ?
                  $signed(wire12) : $signed($signed(wire15)))),
              (^~$signed((|(reg154 ? wire93 : reg155))))};
        end
      else
        begin
          if ((~|$signed($unsigned($signed((wire93 ? wire12 : reg152))))))
            begin
              reg162 <= (8'h9e);
              reg163 <= ((((&$unsigned(reg158)) || ($signed(reg160) ?
                  wire16 : {wire148})) != (|(~$unsigned(reg158)))) ~^ reg151[(1'h1):(1'h1)]);
            end
          else
            begin
              reg162 <= (!(!(wire15 << $signed(wire54))));
              reg163 <= (+(8'hae));
              reg164 <= $signed({(-((wire94 ^~ reg161) ?
                      (wire91 ^~ wire94) : reg19[(3'h6):(2'h2)]))});
            end
          if ($signed($signed(reg163)))
            begin
              reg165 <= (reg155 ?
                  (reg163 ?
                      {$signed(((8'ha7) - wire94)),
                          reg17[(3'h5):(1'h0)]} : $unsigned(((reg18 - reg152) ?
                          (reg161 || wire54) : (reg161 ?
                              (7'h44) : (8'h9e))))) : ($signed(wire15) ?
                      reg18 : $signed(($signed(reg152) ?
                          {(8'ha8), (7'h40)} : $unsigned(reg151)))));
              reg166 <= {({wire91[(3'h7):(1'h0)],
                          ((reg158 ? reg163 : wire54) ?
                              (reg164 && wire91) : $unsigned(wire93))} ?
                      $signed($unsigned($signed(wire148))) : reg161),
                  {$unsigned($signed((+wire13)))}};
              reg167 <= reg164[(2'h3):(2'h3)];
              reg168 <= $signed({(reg156[(4'h8):(2'h2)] != (wire148 | $unsigned((8'hb4)))),
                  (reg159 ? reg153[(1'h0):(1'h0)] : wire13)});
              reg169 <= (wire16[(2'h2):(1'h1)] ?
                  reg158[(1'h0):(1'h0)] : $unsigned(reg162[(3'h4):(1'h1)]));
            end
          else
            begin
              reg165 <= wire16;
              reg166 <= $signed($signed(reg169[(3'h5):(1'h1)]));
              reg167 <= reg160[(3'h5):(3'h5)];
            end
          if ($signed((^~reg165[(4'h9):(3'h5)])))
            begin
              reg170 <= ($signed($signed(((reg17 | reg18) ?
                  reg154[(4'h9):(3'h6)] : {reg153}))) > $unsigned($unsigned(wire14)));
            end
          else
            begin
              reg170 <= reg153;
              reg171 <= (((~&reg153[(3'h7):(3'h4)]) << reg17) ?
                  {reg154[(4'hc):(1'h0)],
                      $unsigned($unsigned((wire148 - (7'h40))))} : $unsigned(($unsigned(reg159) ?
                      ((!reg153) >> $signed(reg19)) : $unsigned((^reg154)))));
              reg172 <= reg162;
              reg173 <= $unsigned((!{{$unsigned(reg169)},
                  (~|$unsigned(reg151))}));
              reg174 <= {$signed((wire16[(2'h3):(2'h3)] ?
                      ({reg165, reg157} ?
                          $unsigned((7'h40)) : (^reg166)) : $unsigned((~reg167))))};
            end
        end
    end
  always
    @(posedge clk) begin
      if (wire12)
        begin
          reg175 <= wire13;
          reg176 <= (reg173[(2'h2):(2'h2)] > ($signed(reg166) ~^ ({$signed(reg150)} <= $unsigned($unsigned(reg170)))));
          reg177 <= ({(((wire148 ? reg176 : reg20) ?
                      (|reg17) : (^~(8'hb0))) || (~&$signed(wire94))),
                  $unsigned(($signed(reg165) ?
                      ((8'ha3) != reg153) : wire14[(1'h0):(1'h0)]))} ?
              (^~$unsigned(reg170)) : $signed(($signed($unsigned(wire13)) + $unsigned((reg161 ?
                  (8'ha4) : (8'hbd))))));
          reg178 <= $signed((reg160 == reg167[(2'h3):(2'h3)]));
          reg179 <= ((|{reg155}) * reg174[(4'hd):(3'h5)]);
        end
      else
        begin
          reg175 <= ($signed(reg156) ?
              $unsigned((reg165 ?
                  (7'h43) : $signed($unsigned(reg20)))) : (reg178 * reg164));
          reg176 <= $signed(reg162);
          if (reg151[(5'h11):(2'h2)])
            begin
              reg177 <= ($signed($unsigned(($signed(wire15) < $signed(reg163)))) || wire13);
              reg178 <= $unsigned(((((|reg159) ? (-(8'hb5)) : (8'hab)) ?
                      (^wire15) : $unsigned((reg171 ? reg158 : reg171))) ?
                  ($unsigned(reg165[(3'h6):(1'h1)]) ?
                      $signed($unsigned((8'ha8))) : (&(8'haa))) : {($unsigned(wire148) || $signed((8'hba))),
                      (~&(wire16 ^ wire94))}));
              reg179 <= $unsigned(((~^wire91[(3'h7):(3'h6)]) && (((8'ha6) >>> (reg18 ?
                      reg18 : reg166)) ?
                  wire13 : $signed((~^wire93)))));
              reg180 <= {(~wire14)};
              reg181 <= $signed($signed({reg165}));
            end
          else
            begin
              reg177 <= reg179[(4'hc):(3'h7)];
              reg178 <= $signed($unsigned((!{reg171})));
            end
          if ((^($unsigned($signed($unsigned(wire148))) == reg171[(3'h4):(1'h0)])))
            begin
              reg182 <= {reg163,
                  ({reg156[(2'h3):(1'h1)]} ?
                      {$unsigned($unsigned(wire15))} : (~wire12))};
              reg183 <= reg19;
              reg184 <= $signed(reg18);
            end
          else
            begin
              reg182 <= reg164;
              reg183 <= ((+reg166) ?
                  (($unsigned(reg161[(2'h2):(1'h1)]) ?
                          ({reg171} || $unsigned(reg153)) : wire15[(3'h7):(1'h0)]) ?
                      reg172 : $unsigned($signed((reg164 ~^ reg18)))) : ($signed(((~(8'hba)) || reg172[(5'h13):(1'h0)])) ?
                      (wire93[(4'hc):(4'ha)] ?
                          $unsigned($unsigned(reg180)) : $unsigned(((8'hb6) ?
                              reg164 : reg19))) : ({$unsigned(reg161)} ?
                          reg181 : wire93[(3'h7):(2'h2)])));
              reg184 <= wire13;
            end
        end
      if ({(~|reg170)})
        begin
          if (wire13[(4'ha):(3'h5)])
            begin
              reg185 <= ((($signed($unsigned(reg154)) << reg172) >>> (reg153 <<< (reg162[(2'h3):(1'h1)] < $signed(reg183)))) ?
                  $signed({reg177,
                      $unsigned(reg181[(1'h1):(1'h0)])}) : $signed((($signed(reg155) ?
                      reg172 : (reg184 ?
                          reg165 : reg184)) >>> $unsigned($unsigned(wire54)))));
            end
          else
            begin
              reg185 <= (~($signed((+wire13)) ?
                  reg181[(1'h1):(1'h0)] : (~|{$signed((8'hb9))})));
              reg186 <= reg160;
              reg187 <= ((-(^~($signed(reg175) ?
                  reg158 : $signed((8'hb9))))) != reg151[(4'hb):(3'h6)]);
              reg188 <= (reg20 || (({{(8'hb3), reg172}} ?
                      reg186[(3'h4):(3'h4)] : ($signed(reg172) ?
                          reg171[(4'ha):(4'h9)] : $unsigned((8'hb6)))) ?
                  (+reg159) : {($signed(reg162) >> $signed(reg166)),
                      $unsigned((&(8'hb7)))}));
            end
          reg189 <= reg155;
          reg190 <= reg17;
          reg191 <= (~$unsigned(reg163[(2'h2):(1'h1)]));
          if (reg156)
            begin
              reg192 <= ({((8'h9e) ?
                      ((reg168 ?
                          reg171 : (7'h44)) >> reg179[(4'ha):(3'h4)]) : reg178[(4'ha):(3'h7)]),
                  (!((reg186 >>> (8'h9c)) ^~ (wire148 ?
                      reg188 : (8'ha7))))} != reg163[(4'ha):(2'h3)]);
              reg193 <= $unsigned((reg158[(2'h2):(1'h1)] ~^ $signed(reg170)));
              reg194 <= $signed({(wire54[(3'h6):(3'h5)] & wire54[(2'h3):(1'h1)])});
              reg195 <= (8'ha4);
            end
          else
            begin
              reg192 <= reg186[(1'h1):(1'h0)];
              reg193 <= (8'h9f);
              reg194 <= (~&(~&reg194[(1'h0):(1'h0)]));
              reg195 <= ((8'ha3) ?
                  ($unsigned((~^{reg194})) || (reg162 >= {$unsigned(reg18),
                      wire91[(2'h2):(2'h2)]})) : (reg189 * (&{(-reg188),
                      (wire148 ? wire15 : reg195)})));
            end
        end
      else
        begin
          reg185 <= {reg164, (!reg194)};
          reg186 <= $signed(reg185[(1'h0):(1'h0)]);
          reg187 <= reg195[(1'h1):(1'h1)];
          reg188 <= $unsigned(reg171);
          reg189 <= wire15[(4'hb):(1'h1)];
        end
      reg196 <= (reg179 >> ((($signed(reg155) ? (~^reg186) : $signed(reg189)) ?
              reg170[(4'ha):(2'h2)] : ((reg160 ? reg165 : reg195) ?
                  $unsigned(reg177) : reg185[(1'h1):(1'h1)])) ?
          (~|$unsigned(reg164)) : $signed($signed((reg180 != (8'ha4))))));
      reg197 <= (!$signed((&((reg17 ? reg171 : (8'ha7)) ?
          (reg180 ? reg169 : (8'hbc)) : wire54[(4'hc):(1'h0)]))));
      reg198 <= wire12;
    end
  assign wire199 = wire91;
  assign wire200 = $signed($signed((|((reg178 ?
                       wire15 : reg151) > (+(7'h42))))));
  assign wire201 = (({$unsigned(reg158[(1'h1):(1'h1)])} ^~ $signed((-(-reg154)))) ^ $unsigned((reg153 > ((~|reg17) >> $unsigned(reg172)))));
  always
    @(posedge clk) begin
      reg202 <= (wire201[(4'he):(4'he)] ? reg197 : $signed((8'ha8)));
      reg203 <= ($unsigned(((~|(reg185 > reg190)) && (~$unsigned(wire201)))) != reg150);
      reg204 <= reg188[(1'h1):(1'h0)];
    end
  assign wire205 = reg195;
  always
    @(posedge clk) begin
      if ((reg181 | $unsigned(reg159)))
        begin
          reg206 <= (~&wire54[(1'h1):(1'h1)]);
          reg207 <= (~&reg203);
        end
      else
        begin
          if (((|(wire201 + $unsigned((reg202 ? reg158 : reg162)))) ?
              (wire12[(3'h4):(2'h3)] < $unsigned(((reg192 << reg186) + $signed(reg150)))) : $signed($unsigned((~^(~(8'hb2)))))))
            begin
              reg206 <= {$signed((|$unsigned((reg181 - reg190)))),
                  $signed(reg202)};
            end
          else
            begin
              reg206 <= {$unsigned((^{(8'hba), (~^(8'ha8))}))};
            end
          if ({reg172[(5'h13):(4'hb)],
              (~^(($signed(reg150) ?
                  {reg19,
                      (8'hbb)} : (reg198 <<< reg195)) ^~ $unsigned($signed(wire94))))})
            begin
              reg207 <= (reg192 && ((&reg174[(3'h5):(3'h4)]) + $signed((^~{wire148,
                  reg153}))));
            end
          else
            begin
              reg207 <= $signed(reg163);
              reg208 <= wire16[(4'he):(4'h9)];
              reg209 <= $unsigned((~((^~(reg194 ? reg156 : reg191)) ?
                  $signed($signed(reg180)) : {$unsigned(reg159),
                      (reg158 ? reg196 : reg155)})));
              reg210 <= reg206;
              reg211 <= $signed(reg161[(4'hc):(1'h0)]);
            end
          reg212 <= reg173[(1'h1):(1'h1)];
          reg213 <= $signed((^~{(^{reg176, reg166})}));
        end
    end
  module214 #() modinst226 (wire225, clk, reg213, reg186, wire14, reg206);
endmodule

module module214
#(parameter param224 = ({{{(-(8'ha8))}, (((7'h41) ? (8'hbb) : (8'haf)) * ((8'had) ? (8'ha8) : (8'h9f)))}} >> (((((8'hb2) ? (8'hb1) : (8'h9f)) < {(8'hbf), (8'h9f)}) ? (^~{(8'had), (8'hb5)}) : (~^{(8'ha7), (8'hbb)})) ? ({((8'hb2) ? (8'hb7) : (8'ha9))} ? (~{(8'hb1), (8'hbc)}) : (~((8'ha2) ? (7'h44) : (8'hbe)))) : (((^~(8'hb4)) ? {(8'hb2)} : ((8'h9f) * (7'h41))) >= (((8'hb2) ? (7'h41) : (8'hb1)) ? {(8'hb2), (7'h40)} : ((8'ha3) ^ (8'ha6)))))))
(y, clk, wire218, wire217, wire216, wire215);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire218;
  input wire [(4'ha):(1'h0)] wire217;
  input wire [(5'h15):(1'h0)] wire216;
  input wire signed [(4'ha):(1'h0)] wire215;
  wire [(5'h10):(1'h0)] wire223;
  wire signed [(4'hc):(1'h0)] wire222;
  wire signed [(4'ha):(1'h0)] wire221;
  wire [(4'h8):(1'h0)] wire220;
  wire [(4'hc):(1'h0)] wire219;
  assign y = {wire223, wire222, wire221, wire220, wire219, (1'h0)};
  assign wire219 = (((8'hb2) > $signed($unsigned((~&wire216)))) ?
                       wire218[(1'h1):(1'h1)] : wire217);
  assign wire220 = wire215[(4'h8):(3'h7)];
  assign wire221 = ({(|((wire219 ? wire215 : wire218) ^~ $signed(wire215))),
                       (8'ha3)} < $unsigned(wire215));
  assign wire222 = {(((wire219 && wire216[(1'h0):(1'h0)]) ?
                           ($signed(wire220) ?
                               $signed(wire221) : $unsigned(wire217)) : wire218[(1'h1):(1'h1)]) > wire217[(4'ha):(3'h5)]),
                       (wire215 ?
                           ((8'h9d) - ((wire215 ?
                               wire217 : wire217) >> wire219[(1'h1):(1'h1)])) : $signed(($unsigned(wire220) ?
                               ((7'h41) ?
                                   wire221 : wire218) : (wire219 ^~ wire221))))};
  assign wire223 = wire216;
endmodule

module module95  (y, clk, wire100, wire99, wire98, wire97, wire96);
  output wire [(32'h1f1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire100;
  input wire [(5'h12):(1'h0)] wire99;
  input wire signed [(3'h5):(1'h0)] wire98;
  input wire signed [(5'h11):(1'h0)] wire97;
  input wire [(4'h8):(1'h0)] wire96;
  wire signed [(2'h2):(1'h0)] wire144;
  wire [(5'h15):(1'h0)] wire143;
  wire signed [(2'h2):(1'h0)] wire142;
  wire [(5'h12):(1'h0)] wire141;
  wire [(5'h10):(1'h0)] wire120;
  wire [(5'h13):(1'h0)] wire119;
  wire [(4'hd):(1'h0)] wire118;
  wire [(5'h10):(1'h0)] wire117;
  wire signed [(4'hf):(1'h0)] wire116;
  wire signed [(4'h8):(1'h0)] wire115;
  wire [(4'ha):(1'h0)] wire114;
  wire signed [(5'h11):(1'h0)] wire113;
  wire signed [(5'h12):(1'h0)] wire112;
  wire signed [(3'h4):(1'h0)] wire111;
  wire [(4'h9):(1'h0)] wire110;
  wire [(4'hd):(1'h0)] wire106;
  wire signed [(4'he):(1'h0)] wire105;
  wire signed [(2'h2):(1'h0)] wire104;
  reg [(4'hd):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg140 = (1'h0);
  reg [(4'hb):(1'h0)] reg139 = (1'h0);
  reg [(4'hc):(1'h0)] reg138 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg137 = (1'h0);
  reg [(4'hf):(1'h0)] reg136 = (1'h0);
  reg [(3'h4):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg134 = (1'h0);
  reg [(4'hc):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg132 = (1'h0);
  reg [(3'h5):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg130 = (1'h0);
  reg [(3'h5):(1'h0)] reg129 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg128 = (1'h0);
  reg [(3'h6):(1'h0)] reg127 = (1'h0);
  reg [(5'h11):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg125 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg109 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg107 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg103 = (1'h0);
  reg [(3'h5):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg101 = (1'h0);
  assign y = {wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire106,
                 wire105,
                 wire104,
                 reg147,
                 reg146,
                 reg145,
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
                 reg109,
                 reg108,
                 reg107,
                 reg103,
                 reg102,
                 reg101,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg101 <= (^((((wire96 ? wire100 : wire98) ?
              (!wire96) : (^wire99)) < $signed($unsigned(wire98))) ?
          $unsigned(wire99[(4'hf):(3'h6)]) : $unsigned({(8'hb1)})));
      reg102 <= ({(|((&(8'ha7)) ^~ (wire100 ? (8'hb3) : reg101))),
              $unsigned(wire99)} ?
          (-$unsigned($signed((wire100 ?
              wire100 : wire99)))) : {wire99[(1'h1):(1'h0)]});
      reg103 <= $signed($unsigned((^$signed(((8'hb7) ? (8'ha2) : (8'hb6))))));
    end
  assign wire104 = ($unsigned((-(-(reg102 > (8'hb2))))) ?
                       $unsigned((~^$signed((reg102 ~^ (8'hb3))))) : (~&$unsigned($signed((reg101 != (8'ha2))))));
  assign wire105 = (8'hb7);
  assign wire106 = ($signed((((wire98 ? reg101 : wire100) ?
                       wire96[(3'h7):(3'h7)] : $unsigned((8'ha8))) >= $signed((!reg102)))) >= {(wire104[(1'h0):(1'h0)] ?
                           (8'hb5) : wire99),
                       wire97[(4'hc):(4'h8)]});
  always
    @(posedge clk) begin
      if ((~&($signed(wire105) * (!($unsigned(wire100) ?
          wire105 : $unsigned(wire106))))))
        begin
          reg107 <= (~|(8'hb4));
          reg108 <= $unsigned((-(-wire105)));
        end
      else
        begin
          reg107 <= $signed(($unsigned((8'hb2)) ? (-reg103) : {reg103}));
          reg108 <= wire96;
        end
      reg109 <= $signed(reg107[(4'h8):(3'h4)]);
    end
  assign wire110 = (reg103 ^ wire98);
  assign wire111 = ((+(wire99[(1'h1):(1'h1)] ? reg107 : reg107)) ?
                       (({(reg109 >>> (7'h41))} ? reg103 : wire100) ?
                           reg109 : {$unsigned((~^reg108)),
                               $unsigned(((7'h41) <<< wire105))}) : $signed(reg107[(3'h6):(1'h1)]));
  assign wire112 = (^wire110);
  assign wire113 = (8'ha6);
  assign wire114 = (reg107[(1'h1):(1'h1)] > wire106[(2'h3):(2'h3)]);
  assign wire115 = (!wire113[(4'ha):(2'h2)]);
  assign wire116 = $signed({wire112[(2'h2):(1'h1)]});
  assign wire117 = {reg108, (|reg109)};
  assign wire118 = wire114;
  assign wire119 = {(wire106 <= $signed((+wire117[(3'h7):(3'h5)]))),
                       {$signed(reg102[(1'h0):(1'h0)]),
                           $signed((|$signed(wire115)))}};
  assign wire120 = wire117;
  always
    @(posedge clk) begin
      if ($unsigned(wire105[(3'h4):(2'h2)]))
        begin
          reg121 <= $signed((wire105 ?
              ($unsigned((wire120 & reg101)) ?
                  $unsigned((reg107 == wire105)) : $signed((reg108 ?
                      wire115 : wire100))) : (-{wire119, (7'h41)})));
          reg122 <= (~^($unsigned((|$signed(reg102))) && (~|wire116[(4'hf):(2'h3)])));
          reg123 <= {(8'ha1)};
        end
      else
        begin
          if (wire120)
            begin
              reg121 <= (-wire115[(4'h8):(1'h0)]);
              reg122 <= $unsigned(({wire120,
                  reg107} < $unsigned((^~wire104[(2'h2):(2'h2)]))));
              reg123 <= wire99;
              reg124 <= (((($signed(wire114) != (-reg108)) >= $unsigned((~|wire112))) >= $unsigned($signed((-reg123)))) ?
                  $unsigned(wire113) : (^($signed(reg102[(2'h3):(1'h1)]) ?
                      $unsigned((wire115 ?
                          wire106 : (8'hbf))) : $unsigned($unsigned(reg121)))));
              reg125 <= wire116;
            end
          else
            begin
              reg121 <= ($signed(($signed((!wire111)) ?
                      ({wire98} < wire110) : ((8'hb5) ?
                          wire97 : (wire115 >> wire118)))) ?
                  $unsigned($unsigned(reg125[(4'hb):(3'h7)])) : ($unsigned({(!wire112)}) >= $signed($unsigned((wire112 ?
                      wire99 : reg121)))));
              reg122 <= ($unsigned({wire113[(2'h2):(1'h0)],
                  $unsigned(reg121[(2'h2):(1'h1)])}) | wire110);
              reg123 <= ((reg101[(3'h5):(2'h3)] ?
                  {$unsigned((^~wire105)),
                      {reg125[(5'h12):(3'h6)]}} : (~&$unsigned((reg121 ?
                      wire111 : reg108)))) >>> wire104[(2'h2):(2'h2)]);
              reg124 <= (~(^~$unsigned(($unsigned(reg107) | ((8'ha2) ?
                  wire100 : reg123)))));
            end
          reg126 <= $unsigned((wire111[(1'h0):(1'h0)] ?
              $unsigned(wire116[(4'he):(4'hb)]) : ((&(^wire100)) ?
                  wire114 : {$unsigned(wire105)})));
          if ((~&reg126))
            begin
              reg127 <= $unsigned(reg125[(3'h6):(3'h4)]);
              reg128 <= $unsigned(($signed((8'ha8)) ?
                  (|reg103[(1'h1):(1'h0)]) : ({(wire114 == wire117)} ?
                      ((reg108 ? wire104 : wire106) ?
                          (reg107 - wire105) : ((8'h9e) ?
                              (8'hb5) : reg103)) : ({(8'hab), wire112} ?
                          (reg101 ^ wire105) : wire119))));
              reg129 <= ((&(((wire117 ? reg108 : (8'hb9)) ?
                      {wire116} : (+reg123)) - ($signed((8'hb4)) + (~^wire100)))) ?
                  (~|($signed(((8'hb4) ? wire104 : reg122)) - ((wire117 ?
                          reg125 : (8'hb5)) ?
                      wire120[(4'hb):(1'h1)] : $unsigned(reg108)))) : wire112);
            end
          else
            begin
              reg127 <= (~&$unsigned({(!reg127[(3'h4):(1'h0)])}));
              reg128 <= (&{$unsigned({(!reg101), wire110}),
                  reg122[(3'h5):(1'h0)]});
              reg129 <= wire111;
              reg130 <= $signed($unsigned(reg124[(1'h0):(1'h0)]));
            end
          reg131 <= ($unsigned($signed($unsigned(reg121))) ?
              {({$unsigned(wire97),
                      reg128} ^~ (~^$unsigned(wire115)))} : (|(((7'h41) ?
                      $unsigned(reg124) : wire119[(4'hc):(4'h9)]) ?
                  ($unsigned(wire112) ^ wire111[(2'h3):(1'h0)]) : (wire105[(3'h6):(1'h1)] & {reg109}))));
          if ((({$signed((reg109 ? (8'hbb) : wire98))} ^~ ($unsigned({reg130,
                  wire99}) & $unsigned((~^wire96)))) ?
              (((~^((8'ha2) || wire116)) ?
                      $signed(reg108) : $signed((reg124 ^~ reg126))) ?
                  $signed({reg103,
                      (wire112 ?
                          reg124 : reg121)}) : $unsigned($unsigned($unsigned(reg101)))) : $signed((~&{(^wire114),
                  wire119[(5'h13):(2'h3)]}))))
            begin
              reg132 <= $unsigned($unsigned(($unsigned(wire98) > (~|(~wire114)))));
              reg133 <= (8'hba);
              reg134 <= reg132[(4'h9):(2'h3)];
              reg135 <= ((((~&(~(8'hb1))) ?
                          ($unsigned(reg123) << $signed(wire120)) : {$signed(reg131)}) ?
                      (|$unsigned(wire96)) : (^~((8'h9c) ?
                          wire104 : (reg124 ? wire113 : wire100)))) ?
                  (~(((wire100 & wire119) >= $unsigned(wire96)) >= ((reg133 ?
                      wire119 : wire110) ^~ (+wire105)))) : $unsigned(wire104));
              reg136 <= $signed(($signed(reg126[(4'hc):(3'h5)]) ?
                  wire106 : (($signed(reg132) >> (reg129 ?
                      wire111 : (8'hab))) <<< ($unsigned(wire111) ?
                      (reg131 ? wire98 : reg108) : (+(8'hb2))))));
            end
          else
            begin
              reg132 <= reg123[(3'h4):(2'h3)];
              reg133 <= (&(~&$signed((wire110 ?
                  (+wire118) : wire112[(4'he):(2'h3)]))));
            end
        end
      if ($unsigned($signed(reg132)))
        begin
          reg137 <= $signed(reg136[(3'h4):(1'h0)]);
          reg138 <= $signed(wire96);
        end
      else
        begin
          reg137 <= (reg137[(1'h1):(1'h0)] ?
              $signed({wire117, reg101[(3'h4):(2'h3)]}) : reg133);
          reg138 <= wire111;
          reg139 <= ($unsigned($signed($unsigned(reg124))) ?
              ((+((reg129 ? reg126 : wire118) ?
                  {reg125} : wire98)) >> reg135[(2'h3):(2'h3)]) : ($unsigned(reg134) != ((|$unsigned(reg130)) | (((8'hb4) - wire111) << wire111))));
          reg140 <= {wire97};
        end
    end
  assign wire141 = (wire98[(1'h1):(1'h0)] ?
                       $unsigned($unsigned((((8'hac) ? reg138 : reg132) ?
                           reg132[(3'h7):(3'h6)] : (^~(8'ha6))))) : ((reg123 ?
                           ($signed(wire120) ?
                               wire112 : (reg122 ?
                                   wire118 : (8'ha2))) : (+(reg133 * wire115))) > ($unsigned($signed(wire99)) ?
                           $unsigned((wire117 ? reg138 : wire119)) : ({wire99,
                               reg140} < reg123[(2'h2):(2'h2)]))));
  assign wire142 = $unsigned(wire112);
  assign wire143 = ($signed(reg128[(4'ha):(1'h0)]) ^~ ($signed({(reg124 && reg125),
                           $unsigned(wire105)}) ?
                       wire116 : {($unsigned(wire118) >>> wire118),
                           $signed($unsigned(reg102))}));
  assign wire144 = (((wire110 ?
                           reg129[(1'h0):(1'h0)] : ($signed(wire112) ~^ (reg121 ?
                               wire141 : wire115))) & $unsigned((wire110 ?
                           wire106[(4'hc):(3'h7)] : $unsigned(reg139)))) ?
                       reg127[(2'h3):(2'h3)] : $unsigned(((7'h44) <= $signed((&(7'h42))))));
  always
    @(posedge clk) begin
      reg145 <= $signed($unsigned(reg132));
      reg146 <= reg127[(3'h6):(1'h1)];
      reg147 <= $unsigned(wire106[(2'h2):(1'h1)]);
    end
endmodule

module module56
#(parameter param89 = (({(((8'ha4) ? (7'h41) : (8'ha6)) ? ((8'h9d) ? (8'h9d) : (8'haa)) : ((8'h9f) ? (8'hb5) : (8'hba)))} > (-({(7'h40)} ? ((8'hab) ^ (8'hbf)) : {(8'haf), (8'hbd)}))) ~^ (((+(~|(8'h9e))) ? (8'hbf) : {((8'hac) ? (8'ha6) : (7'h41))}) != ((~((7'h43) ? (7'h43) : (8'ha7))) ? {((8'hb5) + (8'h9f)), {(7'h44)}} : ({(8'hbb)} ? ((8'hb7) <= (8'h9e)) : ((8'hb5) ^~ (8'ha9)))))), 
parameter param90 = (param89 & {(~&(~&{param89, param89}))}))
(y, clk, wire61, wire60, wire59, wire58, wire57);
  output wire [(32'h145):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire61;
  input wire [(4'hd):(1'h0)] wire60;
  input wire signed [(5'h14):(1'h0)] wire59;
  input wire [(5'h12):(1'h0)] wire58;
  input wire [(5'h10):(1'h0)] wire57;
  wire signed [(2'h3):(1'h0)] wire88;
  wire [(2'h3):(1'h0)] wire87;
  wire signed [(4'hd):(1'h0)] wire86;
  wire signed [(2'h3):(1'h0)] wire85;
  wire signed [(5'h12):(1'h0)] wire84;
  wire [(4'he):(1'h0)] wire83;
  wire signed [(5'h14):(1'h0)] wire72;
  wire signed [(4'hb):(1'h0)] wire71;
  wire [(4'h8):(1'h0)] wire70;
  wire [(5'h10):(1'h0)] wire69;
  wire [(5'h12):(1'h0)] wire68;
  wire [(5'h10):(1'h0)] wire67;
  wire signed [(3'h4):(1'h0)] wire66;
  wire [(4'ha):(1'h0)] wire65;
  wire [(4'hb):(1'h0)] wire64;
  wire signed [(4'hf):(1'h0)] wire63;
  wire [(5'h10):(1'h0)] wire62;
  reg signed [(4'he):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg79 = (1'h0);
  reg [(4'h8):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg76 = (1'h0);
  reg [(4'he):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg73 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
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
                 (1'h0)};
  assign wire62 = ($signed({(wire57[(2'h3):(1'h1)] ?
                          $signed(wire60) : wire57[(3'h6):(3'h5)])}) >= (wire60 ?
                      $signed({wire57[(4'he):(3'h7)], wire61}) : (wire58 ?
                          (+$signed((8'ha5))) : ((wire61 ? wire58 : wire58) ?
                              (8'ha1) : (wire61 < wire59)))));
  assign wire63 = ((($signed($unsigned((7'h42))) > $unsigned($unsigned(wire62))) ?
                      (((!wire62) > $signed(wire61)) ?
                          wire60 : (8'h9f)) : ((wire58 ?
                              $signed(wire59) : (8'h9c)) ?
                          (~&(wire57 ~^ (7'h40))) : ($signed(wire57) >= $unsigned((8'h9c))))) << wire58);
  assign wire64 = (8'hb9);
  assign wire65 = wire60;
  assign wire66 = (^$signed({((&(8'hbb)) ?
                          $signed(wire65) : $unsigned(wire59))}));
  assign wire67 = wire65[(2'h2):(1'h1)];
  assign wire68 = (({(+(wire57 << wire64)), wire65[(1'h1):(1'h0)]} ?
                          (^{wire66[(2'h3):(2'h3)],
                              (wire60 << wire62)}) : wire65[(4'h8):(3'h6)]) ?
                      $unsigned(wire58) : wire57);
  assign wire69 = wire65;
  assign wire70 = $unsigned(wire60);
  assign wire71 = (~^($unsigned($unsigned(wire59)) ?
                      $signed($signed($unsigned(wire68))) : {$unsigned(((8'had) ?
                              (8'hb6) : wire67))}));
  assign wire72 = wire58[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg73 <= (wire60 ?
          $unsigned($unsigned($signed((wire69 ? wire64 : wire62)))) : wire68);
      reg74 <= wire67;
      if (wire68[(4'hc):(4'h8)])
        begin
          if ($signed(wire70))
            begin
              reg75 <= (wire72[(2'h3):(1'h1)] ?
                  wire72[(4'ha):(3'h7)] : $unsigned($signed($unsigned($unsigned(wire64)))));
              reg76 <= wire71[(4'h8):(2'h2)];
            end
          else
            begin
              reg75 <= (-wire64[(2'h3):(2'h2)]);
              reg76 <= (~(+reg75[(3'h4):(3'h4)]));
              reg77 <= {$signed(((~^wire72) >>> ($signed(wire69) ?
                      wire72 : ((8'hb8) ? wire60 : wire57)))),
                  wire59[(1'h0):(1'h0)]};
              reg78 <= wire60[(3'h5):(2'h2)];
            end
          reg79 <= (^$unsigned(((~(+wire69)) ?
              (wire58 ?
                  $unsigned(wire71) : wire70[(3'h6):(1'h1)]) : $signed((wire59 ?
                  wire69 : wire58)))));
          reg80 <= wire70;
          reg81 <= ($signed((^$unsigned({wire60, reg79}))) ?
              (($unsigned($signed(wire59)) ?
                  ((|wire69) >= (wire63 << wire61)) : (wire59 ?
                      $unsigned(reg73) : {(8'haa)})) ^ reg75[(3'h4):(1'h0)]) : $unsigned((~|wire62[(2'h2):(1'h0)])));
        end
      else
        begin
          reg75 <= wire65;
          reg76 <= reg81;
          if (wire62[(2'h3):(1'h0)])
            begin
              reg77 <= $unsigned(($signed($signed(reg74[(2'h2):(1'h0)])) ?
                  (reg75[(2'h2):(1'h1)] ?
                      (~(reg74 == wire63)) : {(wire63 > reg75),
                          wire71}) : reg74[(5'h11):(4'ha)]));
              reg78 <= (^wire57[(2'h3):(2'h3)]);
              reg79 <= reg79[(2'h2):(1'h1)];
            end
          else
            begin
              reg77 <= (~^wire60);
              reg78 <= (~^(8'hab));
            end
        end
      reg82 <= (wire61[(3'h6):(2'h3)] ?
          $unsigned(wire67[(5'h10):(4'he)]) : ((+(|$unsigned(wire69))) ?
              (8'hb7) : $unsigned($signed((wire63 ^ reg75)))));
    end
  assign wire83 = (8'h9e);
  assign wire84 = (!$unsigned($signed((|(!reg81)))));
  assign wire85 = ((reg76 <= $unsigned({{(8'hb5), wire68},
                      {wire63}})) >> (^~(~|wire72[(5'h14):(4'hf)])));
  assign wire86 = (reg76 ?
                      $unsigned((wire63[(3'h7):(3'h4)] < wire84[(4'hb):(2'h3)])) : $unsigned($unsigned({(reg77 == wire62)})));
  assign wire87 = (+wire85);
  assign wire88 = $unsigned($unsigned($signed($unsigned($unsigned(wire86)))));
endmodule

module module21  (y, clk, wire26, wire25, wire24, wire23, wire22);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire26;
  input wire signed [(3'h5):(1'h0)] wire25;
  input wire [(2'h3):(1'h0)] wire24;
  input wire signed [(3'h7):(1'h0)] wire23;
  input wire [(2'h2):(1'h0)] wire22;
  wire signed [(5'h13):(1'h0)] wire53;
  wire [(3'h5):(1'h0)] wire52;
  wire signed [(5'h11):(1'h0)] wire51;
  wire [(5'h15):(1'h0)] wire50;
  wire signed [(3'h5):(1'h0)] wire45;
  wire [(4'hb):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire43;
  wire [(2'h2):(1'h0)] wire42;
  wire signed [(5'h14):(1'h0)] wire40;
  wire [(2'h3):(1'h0)] wire38;
  wire [(4'h8):(1'h0)] wire37;
  wire signed [(2'h3):(1'h0)] wire36;
  wire signed [(4'h8):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire31;
  wire signed [(5'h14):(1'h0)] wire30;
  wire [(4'hb):(1'h0)] wire29;
  wire [(4'h9):(1'h0)] wire28;
  wire [(4'ha):(1'h0)] wire27;
  reg signed [(3'h6):(1'h0)] reg49 = (1'h0);
  reg [(4'hb):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg46 = (1'h0);
  reg [(4'hf):(1'h0)] reg41 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire40,
                 wire38,
                 wire37,
                 wire36,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg41,
                 reg39,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire27 = ((((|(wire25 | wire23)) ?
                              ($signed(wire23) > wire22[(1'h0):(1'h0)]) : wire22) ?
                          wire24[(1'h0):(1'h0)] : wire22[(2'h2):(1'h0)]) ?
                      ((wire25[(3'h5):(3'h5)] ?
                          wire22[(1'h0):(1'h0)] : ((wire24 ? wire23 : wire24) ?
                              (wire26 ?
                                  wire25 : wire26) : (8'hbe))) == ((+(wire25 + wire25)) <= $unsigned((wire24 ?
                          wire26 : wire23)))) : $unsigned(wire23));
  assign wire28 = ($unsigned($signed(wire23[(1'h0):(1'h0)])) != ((wire22 & wire26[(4'ha):(2'h2)]) ?
                      wire22 : wire25));
  assign wire29 = (wire26[(2'h3):(1'h0)] ?
                      {((wire24 ?
                              (wire28 ?
                                  wire23 : wire24) : wire22) && {wire28[(3'h5):(1'h0)]})} : $signed($unsigned(wire25)));
  assign wire30 = ($signed(wire28) ?
                      ((~|($unsigned(wire25) ? wire28 : (!wire22))) ?
                          (!(~(wire26 << wire29))) : (&$unsigned((+(8'haf))))) : $unsigned((+(!(wire26 >> wire28)))));
  assign wire31 = (($signed($signed((~wire22))) * (&($signed(wire26) ?
                          wire30 : (!(8'haa))))) ?
                      $unsigned($unsigned(wire27)) : (($unsigned((~&(8'hac))) >>> (!(^wire27))) & $signed(($signed(wire27) ^~ {wire29,
                          wire22}))));
  assign wire32 = (8'hb5);
  always
    @(posedge clk) begin
      reg33 <= ($unsigned(($signed(wire22[(1'h0):(1'h0)]) - $unsigned($unsigned((8'hab))))) & (|wire23));
      reg34 <= $unsigned(wire30[(5'h10):(4'hb)]);
      reg35 <= $unsigned((~{$unsigned(wire32[(1'h0):(1'h0)])}));
    end
  assign wire36 = (~^{$signed(wire26[(2'h3):(1'h1)]),
                      {$signed(((8'hbd) ? (7'h41) : wire30)),
                          (wire30[(5'h10):(2'h3)] || $unsigned(wire30))}});
  assign wire37 = $unsigned(($unsigned(wire32) ?
                      $unsigned(wire27[(2'h2):(2'h2)]) : (wire23[(1'h0):(1'h0)] < $signed((!reg34)))));
  assign wire38 = (wire32 * $signed(reg33[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      reg39 <= wire22;
    end
  assign wire40 = ({wire38, {wire30[(1'h1):(1'h1)]}} ?
                      $signed(wire26) : ($unsigned((^$signed(wire22))) ?
                          $unsigned((wire32[(3'h4):(1'h0)] <= wire38[(1'h0):(1'h0)])) : $unsigned(((!reg33) ?
                              (wire27 ? reg35 : (8'hb8)) : $signed(wire22)))));
  always
    @(posedge clk) begin
      reg41 <= {($signed(wire25) ?
              $signed($signed((8'ha7))) : $signed($unsigned($unsigned(wire23)))),
          ($unsigned($unsigned($unsigned((8'hae)))) ?
              (~^wire40) : $signed($signed(wire29[(4'h9):(4'h8)])))};
    end
  assign wire42 = (~^$signed(wire40[(1'h0):(1'h0)]));
  assign wire43 = (+wire37);
  assign wire44 = $unsigned((^$unsigned((8'hb6))));
  assign wire45 = wire26[(4'hb):(4'hb)];
  always
    @(posedge clk) begin
      reg46 <= $unsigned(($signed((~&(-wire26))) ?
          $signed({reg33[(2'h2):(1'h1)]}) : wire42[(1'h1):(1'h0)]));
      if (wire32[(2'h2):(1'h0)])
        begin
          reg47 <= (|wire22[(1'h0):(1'h0)]);
          reg48 <= wire37;
        end
      else
        begin
          reg47 <= ((~&$signed($signed($signed(wire42)))) ?
              wire30[(3'h7):(1'h0)] : wire43[(1'h1):(1'h0)]);
          reg48 <= $unsigned($unsigned({({reg39, reg34} - $signed(reg33)),
              $unsigned(wire23[(3'h6):(3'h5)])}));
        end
      reg49 <= {wire37,
          (&{((^reg39) ? reg41[(2'h2):(2'h2)] : $unsigned(wire37))})};
    end
  assign wire50 = reg48;
  assign wire51 = $unsigned({(-wire42[(2'h2):(1'h0)])});
  assign wire52 = $unsigned((~$signed({(8'ha6), $unsigned((8'hbf))})));
  assign wire53 = (!wire27);
endmodule
