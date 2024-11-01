module top
#(parameter param246 = {({((-(8'ha9)) << {(8'ha9), (8'had)}), ((~|(8'hb2)) ? ((8'ha0) || (8'ha2)) : ((7'h41) ^ (8'hb4)))} ? ((8'ha7) ? (((8'ha7) ? (8'hb5) : (8'hb5)) ? ((8'hbd) ? (8'h9e) : (8'hbf)) : ((8'hb3) - (8'hb0))) : (((7'h42) ? (7'h42) : (8'hb1)) ? ((8'ha1) ? (8'hb0) : (7'h43)) : (^~(8'ha8)))) : (8'ha4)), {(^(((8'ha2) > (8'ha3)) && (~|(7'h43))))}}, 
parameter param247 = ((+{(~^(8'hb0))}) >> (((&param246) > ((~^param246) ? (param246 < param246) : param246)) ? (~&(8'had)) : param246)))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h20b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  wire [(4'hb):(1'h0)] wire238;
  wire [(3'h6):(1'h0)] wire237;
  wire [(3'h6):(1'h0)] wire236;
  wire signed [(3'h5):(1'h0)] wire235;
  wire signed [(2'h2):(1'h0)] wire234;
  wire [(3'h4):(1'h0)] wire229;
  wire [(5'h12):(1'h0)] wire220;
  wire signed [(4'h9):(1'h0)] wire219;
  wire signed [(3'h5):(1'h0)] wire82;
  wire [(5'h11):(1'h0)] wire84;
  wire [(5'h11):(1'h0)] wire85;
  wire signed [(4'hd):(1'h0)] wire86;
  wire signed [(5'h12):(1'h0)] wire87;
  wire [(4'ha):(1'h0)] wire204;
  wire signed [(4'h9):(1'h0)] wire216;
  wire signed [(5'h10):(1'h0)] wire217;
  reg [(3'h7):(1'h0)] reg245 = (1'h0);
  reg [(5'h10):(1'h0)] reg244 = (1'h0);
  reg [(5'h11):(1'h0)] reg243 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg242 = (1'h0);
  reg signed [(4'he):(1'h0)] reg241 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg240 = (1'h0);
  reg [(3'h6):(1'h0)] reg239 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg233 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg232 = (1'h0);
  reg [(5'h14):(1'h0)] reg231 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg230 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg228 = (1'h0);
  reg [(5'h10):(1'h0)] reg227 = (1'h0);
  reg [(4'ha):(1'h0)] reg226 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg225 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg224 = (1'h0);
  reg [(5'h13):(1'h0)] reg223 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg222 = (1'h0);
  reg [(4'hf):(1'h0)] reg221 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg215 = (1'h0);
  reg [(4'hc):(1'h0)] reg214 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg213 = (1'h0);
  reg [(3'h7):(1'h0)] reg212 = (1'h0);
  reg [(2'h2):(1'h0)] reg211 = (1'h0);
  reg [(4'h9):(1'h0)] reg210 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg209 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg208 = (1'h0);
  reg [(5'h10):(1'h0)] reg207 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg206 = (1'h0);
  assign y = {wire238,
                 wire237,
                 wire236,
                 wire235,
                 wire234,
                 wire229,
                 wire220,
                 wire219,
                 wire82,
                 wire84,
                 wire85,
                 wire86,
                 wire87,
                 wire204,
                 wire216,
                 wire217,
                 reg245,
                 reg244,
                 reg243,
                 reg242,
                 reg241,
                 reg240,
                 reg239,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
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
                 (1'h0)};
  module4 #() modinst83 (wire82, clk, wire0, wire1, wire3, wire2, (8'ha8));
  assign wire84 = $signed(($signed(((~^wire3) && wire0)) ?
                      ({(wire2 ? wire1 : wire2), (+wire82)} ?
                          {wire3,
                              $signed(wire82)} : (8'hb2)) : ($signed(wire82) & ((wire3 & wire82) ?
                          (wire3 ^ wire1) : (8'hb9)))));
  assign wire85 = wire84[(2'h3):(2'h3)];
  assign wire86 = $signed((~wire0[(4'h8):(1'h1)]));
  assign wire87 = (wire84[(1'h0):(1'h0)] == $unsigned($unsigned((&$unsigned(wire85)))));
  module88 #() modinst205 (wire204, clk, wire1, wire85, wire84, wire3);
  always
    @(posedge clk) begin
      reg206 <= ({(8'hb4), $signed(wire1[(5'h12):(3'h6)])} ?
          $signed((($unsigned(wire2) || wire204) ?
              wire86[(4'ha):(2'h2)] : (!{wire85}))) : (^{(((8'haa) ^~ wire85) ?
                  $unsigned(wire3) : wire204[(3'h7):(2'h2)])}));
      reg207 <= wire0;
      reg208 <= $signed($unsigned(reg207[(3'h7):(1'h1)]));
      if ($unsigned($signed($signed({$signed(wire82), {wire1}}))))
        begin
          if ((8'hac))
            begin
              reg209 <= wire2;
              reg210 <= (wire3 <= reg209);
              reg211 <= $signed(wire2[(4'hf):(1'h0)]);
              reg212 <= $unsigned(wire85[(4'hd):(3'h4)]);
              reg213 <= ((~($signed(wire86) ?
                  (&wire2[(3'h7):(1'h0)]) : ((&wire85) ^~ wire3))) >= {{{((8'haa) ?
                              reg211 : (8'ha5)),
                          $unsigned(wire2)}},
                  ((!wire87[(2'h3):(2'h3)]) ?
                      {$unsigned(wire1)} : ($signed(reg211) >>> $unsigned(reg212)))});
            end
          else
            begin
              reg209 <= $unsigned({(!reg210), wire84});
              reg210 <= ({((wire0 + (~&wire0)) ?
                          $unsigned((reg213 ? wire85 : wire1)) : {(reg207 ?
                                  reg213 : reg207)}),
                      reg207} ?
                  (wire3 ^ (wire84 ?
                      (|(reg210 <= wire85)) : $unsigned((~&reg213)))) : reg212);
              reg211 <= ($unsigned(reg212) > $signed($unsigned({(reg211 >> wire82)})));
              reg212 <= (wire2 ?
                  {(wire85 ? {$signed((8'ha1))} : (8'ha0)),
                      reg206[(3'h4):(3'h4)]} : (-reg207));
              reg213 <= $unsigned(($signed(wire0) ?
                  ({((8'had) <<< wire85)} == {reg207[(2'h3):(2'h3)],
                      (~reg213)}) : $signed(((reg212 ^~ (8'hba)) ?
                      wire3[(4'h8):(3'h6)] : wire85[(2'h3):(1'h1)]))));
            end
          reg214 <= reg208;
          reg215 <= reg207;
        end
      else
        begin
          if (wire2)
            begin
              reg209 <= reg214[(4'hb):(4'hb)];
              reg210 <= (-wire87[(4'he):(4'hb)]);
              reg211 <= {$unsigned((~^{wire84[(4'h8):(3'h4)]})),
                  {(reg209[(2'h2):(2'h2)] ?
                          wire85[(4'h9):(3'h6)] : ((~&wire204) ?
                              (8'hac) : $signed(reg213))),
                      wire2[(4'hb):(4'h9)]}};
              reg212 <= wire0;
            end
          else
            begin
              reg209 <= $unsigned(($unsigned(reg213) << (!wire3[(3'h4):(2'h2)])));
              reg210 <= (+$signed($unsigned((~|wire0))));
              reg211 <= (~|wire87[(3'h6):(2'h3)]);
            end
        end
    end
  assign wire216 = wire3;
  module150 #() modinst218 (.wire153(reg206), .wire151(wire85), .clk(clk), .wire154(reg213), .wire155(wire84), .wire152(wire0), .y(wire217));
  assign wire219 = ($signed((({reg206} << ((8'ha1) ?
                       (8'h9f) : reg212)) >>> (((7'h41) ? reg207 : wire86) ?
                       $signed(reg211) : $signed(wire82)))) << $signed((reg212[(1'h1):(1'h0)] ^~ $signed($unsigned(wire84)))));
  assign wire220 = wire1;
  always
    @(posedge clk) begin
      reg221 <= ((~&(($unsigned(reg212) + wire1) ^~ ((reg214 ?
              wire217 : wire1) ?
          (wire87 <= reg210) : reg212))) < {reg209});
      reg222 <= wire87;
      reg223 <= $unsigned(($unsigned($signed($signed(reg215))) ?
          ($unsigned((7'h42)) ?
              wire86[(1'h0):(1'h0)] : $signed($unsigned(reg214))) : (^(reg215 * {reg211}))));
      if ({(8'hb9)})
        begin
          reg224 <= wire87;
        end
      else
        begin
          reg224 <= (~|wire216[(4'h9):(1'h1)]);
          reg225 <= reg215;
          reg226 <= (|($unsigned(wire86) ?
              $unsigned((reg222[(3'h4):(1'h0)] | (reg211 ?
                  reg212 : reg214))) : wire216[(1'h0):(1'h0)]));
          reg227 <= $unsigned({{wire0, (!(reg222 > wire1))},
              $unsigned($signed($unsigned(reg206)))});
          reg228 <= reg221[(4'hc):(1'h1)];
        end
    end
  assign wire229 = reg212[(3'h7):(3'h6)];
  always
    @(posedge clk) begin
      reg230 <= {$unsigned((~((wire87 > reg213) == (^~wire0)))), reg211};
      reg231 <= reg221[(2'h3):(1'h0)];
      reg232 <= ($signed(reg209) ?
          (7'h42) : $signed($unsigned((|$signed(wire86)))));
      reg233 <= wire87;
    end
  assign wire234 = wire87[(5'h11):(2'h2)];
  assign wire235 = (wire220[(4'hb):(3'h7)] == {$unsigned(($unsigned(reg223) ^~ ((8'h9c) ?
                           wire1 : reg206))),
                       $unsigned(reg215[(4'hc):(3'h5)])});
  assign wire236 = (wire82[(3'h5):(1'h0)] >= $unsigned((~$signed({(8'h9c),
                       reg208}))));
  assign wire237 = wire234[(1'h1):(1'h0)];
  assign wire238 = {wire217[(3'h4):(1'h1)], (-reg222[(3'h7):(2'h3)])};
  always
    @(posedge clk) begin
      reg239 <= $signed($signed($signed((reg221[(3'h5):(3'h5)] ?
          (reg206 && reg207) : (^reg221)))));
      if ((&$unsigned({((~&reg221) ?
              reg215[(5'h13):(1'h1)] : (wire1 ? wire217 : wire234)),
          (reg208 ^ {reg231})})))
        begin
          reg240 <= $signed(((~&(^~(reg214 ^~ reg226))) ?
              ((|$signed((8'hab))) - reg231) : (~(~&(reg228 && reg210)))));
          reg241 <= {reg210, (8'h9f)};
          reg242 <= $signed((({wire219[(1'h0):(1'h0)],
              (7'h43)} + ((reg240 ~^ (8'ha1)) ?
              ((8'h9f) ? reg223 : wire82) : reg209[(2'h3):(2'h3)])) == reg208));
          reg243 <= $signed(reg210);
        end
      else
        begin
          reg240 <= wire82;
          if ((reg243[(3'h4):(2'h2)] & reg225[(1'h0):(1'h0)]))
            begin
              reg241 <= reg227[(4'he):(2'h2)];
              reg242 <= reg231[(4'h9):(1'h1)];
              reg243 <= wire236;
            end
          else
            begin
              reg241 <= (reg223[(4'h8):(3'h4)] ^ wire85);
              reg242 <= reg221[(1'h0):(1'h0)];
              reg243 <= reg226;
            end
          reg244 <= ($unsigned((~($unsigned(wire1) ?
              (reg225 != wire220) : {wire204}))) || wire3[(4'h8):(1'h0)]);
          reg245 <= (reg214[(4'h9):(3'h7)] ? {reg207} : reg230[(4'hc):(3'h5)]);
        end
    end
endmodule

module module88
#(parameter param203 = (|((((~^(8'ha9)) && ((7'h42) ? (7'h44) : (8'hb7))) ? (|((7'h43) ? (8'ha9) : (8'ha4))) : ({(8'hbd), (8'ha4)} ? {(8'hb7)} : {(8'hb5), (8'ha6)})) != (((8'hba) ? {(8'ha5), (8'hb2)} : ((8'hb0) + (8'hbe))) ~^ ((~^(8'h9c)) - (~(8'h9d)))))))
(y, clk, wire89, wire90, wire91, wire92);
  output wire [(32'h12d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire89;
  input wire signed [(5'h11):(1'h0)] wire90;
  input wire signed [(5'h11):(1'h0)] wire91;
  input wire signed [(5'h13):(1'h0)] wire92;
  wire signed [(3'h7):(1'h0)] wire202;
  wire [(4'hf):(1'h0)] wire201;
  wire signed [(4'ha):(1'h0)] wire200;
  wire [(5'h11):(1'h0)] wire199;
  wire [(3'h4):(1'h0)] wire195;
  wire signed [(5'h10):(1'h0)] wire193;
  wire signed [(2'h3):(1'h0)] wire145;
  wire signed [(5'h13):(1'h0)] wire144;
  wire [(3'h4):(1'h0)] wire143;
  wire signed [(4'hc):(1'h0)] wire140;
  wire signed [(5'h10):(1'h0)] wire139;
  wire [(5'h15):(1'h0)] wire112;
  wire signed [(5'h13):(1'h0)] wire114;
  wire signed [(4'hb):(1'h0)] wire115;
  wire [(2'h2):(1'h0)] wire116;
  wire signed [(4'hf):(1'h0)] wire137;
  reg [(2'h2):(1'h0)] reg198 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg197 = (1'h0);
  reg [(5'h13):(1'h0)] reg196 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg141 = (1'h0);
  reg [(4'hc):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg146 = (1'h0);
  reg [(4'h9):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg148 = (1'h0);
  reg [(4'he):(1'h0)] reg149 = (1'h0);
  assign y = {wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire195,
                 wire193,
                 wire145,
                 wire144,
                 wire143,
                 wire140,
                 wire139,
                 wire112,
                 wire114,
                 wire115,
                 wire116,
                 wire137,
                 reg198,
                 reg197,
                 reg196,
                 reg141,
                 reg142,
                 reg146,
                 reg147,
                 reg148,
                 reg149,
                 (1'h0)};
  module93 #() modinst113 (.clk(clk), .y(wire112), .wire96(wire91), .wire98(wire89), .wire95(wire90), .wire97(wire92), .wire94((7'h44)));
  assign wire114 = (!($signed((|(wire89 | wire90))) ? wire90 : (^wire91)));
  assign wire115 = wire90;
  assign wire116 = ((wire115 ? wire90 : $signed($unsigned($signed(wire92)))) ?
                       $unsigned($signed((wire112[(5'h11):(4'hc)] ?
                           ((8'hae) ?
                               wire115 : wire115) : wire89[(4'hb):(3'h6)]))) : (~&wire90[(4'he):(4'hd)]));
  module117 #() modinst138 (.y(wire137), .wire118(wire116), .wire119(wire112), .clk(clk), .wire122(wire89), .wire120(wire91), .wire121(wire114));
  assign wire139 = (wire89[(4'ha):(4'h9)] ?
                       wire89[(2'h2):(2'h2)] : wire115[(2'h2):(2'h2)]);
  assign wire140 = $signed((wire92 ?
                       (^~$unsigned(wire116)) : $signed((+(!wire137)))));
  always
    @(posedge clk) begin
      reg141 <= wire91;
      reg142 <= wire114;
    end
  assign wire143 = (~&($signed((wire115[(3'h4):(1'h1)] ~^ (~(8'hb7)))) ?
                       {reg142} : (&($unsigned(wire112) << (wire92 || wire112)))));
  assign wire144 = (~&(wire114[(2'h3):(2'h2)] ~^ ($signed($unsigned(wire114)) | $signed($signed(wire140)))));
  assign wire145 = wire144;
  always
    @(posedge clk) begin
      reg146 <= ($unsigned($signed((8'hbe))) ?
          $unsigned($signed((-{wire116}))) : $signed($signed(wire137[(1'h1):(1'h1)])));
      reg147 <= wire91;
      reg148 <= wire114[(4'hd):(4'h8)];
      reg149 <= ($signed($unsigned(((wire112 == wire115) ?
          $signed(wire91) : $unsigned((7'h43))))) ~^ wire89);
    end
  module150 #() modinst194 (wire193, clk, wire91, wire89, wire137, reg149, wire112);
  assign wire195 = $unsigned(wire115);
  always
    @(posedge clk) begin
      if ((~|wire92))
        begin
          reg196 <= $signed(wire92[(4'h9):(3'h4)]);
          reg197 <= wire92[(4'h8):(3'h7)];
          reg198 <= $unsigned((^wire139));
        end
      else
        begin
          reg196 <= ((!{((|wire195) ~^ (+wire91))}) * (+$signed(((8'h9c) <= $signed(wire114)))));
          reg197 <= reg197;
        end
    end
  assign wire199 = reg146;
  assign wire200 = ((reg197 > wire114) < (reg198[(2'h2):(2'h2)] ?
                       wire140 : ($unsigned(wire112[(5'h13):(4'hd)]) ~^ ((wire139 ~^ wire195) && (|wire116)))));
  assign wire201 = ($signed((wire145[(1'h1):(1'h0)] ?
                       wire145[(2'h3):(2'h2)] : wire139)) < $signed(({(wire195 ?
                           (8'hb9) : wire145)} ~^ $unsigned($unsigned(wire144)))));
  assign wire202 = {(8'haa),
                       (wire90[(5'h11):(4'ha)] ?
                           reg142[(4'h8):(2'h3)] : reg147)};
endmodule

module module4  (y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h167):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire9;
  input wire [(4'ha):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire7;
  input wire [(5'h10):(1'h0)] wire6;
  input wire [(5'h12):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire81;
  wire [(5'h14):(1'h0)] wire80;
  wire [(3'h7):(1'h0)] wire79;
  wire signed [(5'h13):(1'h0)] wire68;
  wire signed [(2'h2):(1'h0)] wire67;
  wire signed [(4'hd):(1'h0)] wire66;
  wire signed [(4'h8):(1'h0)] wire65;
  wire [(4'hd):(1'h0)] wire64;
  wire signed [(4'hd):(1'h0)] wire63;
  wire signed [(3'h4):(1'h0)] wire61;
  wire [(4'he):(1'h0)] wire10;
  reg signed [(3'h7):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg75 = (1'h0);
  reg [(4'hc):(1'h0)] reg74 = (1'h0);
  reg [(4'he):(1'h0)] reg73 = (1'h0);
  reg signed [(4'he):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg71 = (1'h0);
  reg [(5'h15):(1'h0)] reg70 = (1'h0);
  reg [(3'h6):(1'h0)] reg69 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire61,
                 wire10,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg11,
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
                 (1'h0)};
  assign wire10 = $unsigned((((~&$unsigned(wire6)) ?
                          (wire6 ?
                              {wire8} : (wire7 ?
                                  wire7 : wire8)) : (~&$unsigned(wire8))) ?
                      (8'hae) : wire6));
  always
    @(posedge clk) begin
      reg11 <= $signed((({wire5[(4'h9):(3'h5)]} >>> {{wire10, wire9},
          (|wire8)}) | ((~|$unsigned(wire7)) ?
          (wire7[(3'h7):(3'h6)] >> $unsigned((8'hac))) : {(wire9 || (8'hbb)),
              wire9})));
      reg12 <= wire6;
      if ((&$signed(wire9[(2'h3):(1'h1)])))
        begin
          reg13 <= (~$unsigned(wire5[(4'he):(4'hc)]));
          if ($unsigned({((~&(wire8 ^~ reg13)) ?
                  wire9[(5'h11):(4'ha)] : $unsigned((^wire5)))}))
            begin
              reg14 <= (($signed($unsigned($unsigned(wire9))) ?
                      $signed({wire9[(2'h3):(1'h0)]}) : (|$unsigned($signed((8'ha9))))) ?
                  (~^reg13[(4'ha):(1'h1)]) : (^$signed($unsigned((8'ha4)))));
              reg15 <= (wire10[(4'hd):(4'hb)] ?
                  reg12 : $unsigned(wire5[(5'h12):(2'h2)]));
              reg16 <= (~|wire10);
              reg17 <= (&{(reg16 ~^ reg15[(2'h2):(2'h2)]),
                  (^{$signed(reg11)})});
            end
          else
            begin
              reg14 <= $unsigned(wire5[(4'hf):(4'hd)]);
              reg15 <= (^~$signed($unsigned(wire5)));
              reg16 <= (reg14 & (~|$signed($signed((+wire7)))));
              reg17 <= (wire9 ?
                  wire10[(4'he):(4'h8)] : (^~(($signed((8'hb3)) <<< (reg16 ?
                      wire10 : wire5)) - ((wire10 <= reg15) ^~ (wire6 & wire6)))));
              reg18 <= wire5[(4'hd):(3'h7)];
            end
          if ((|(!wire10)))
            begin
              reg19 <= ((~^(wire8 ? wire5 : reg15)) ^~ reg14[(1'h0):(1'h0)]);
            end
          else
            begin
              reg19 <= $unsigned($signed($signed({(~reg11), (~wire8)})));
              reg20 <= (-((8'hbe) ?
                  $signed(reg17[(1'h1):(1'h0)]) : reg15[(2'h2):(2'h2)]));
              reg21 <= $unsigned(((~($signed(reg12) ~^ ((8'hac) ?
                      reg13 : wire5))) ?
                  $signed({(~wire5)}) : wire9));
            end
        end
      else
        begin
          reg13 <= ({reg19} ?
              $signed((~|(reg19[(2'h2):(2'h2)] * ((8'hbd) ?
                  wire5 : reg16)))) : ($unsigned(reg15) ?
                  reg11 : (&($signed(reg11) >> $unsigned(reg11)))));
          reg14 <= reg11;
          reg15 <= (~|(reg18 ? reg18 : wire9[(3'h4):(1'h1)]));
          reg16 <= reg19[(2'h2):(1'h0)];
          reg17 <= ($unsigned(((~^(-wire10)) ^ reg20)) ^~ $signed($unsigned($signed($unsigned(wire8)))));
        end
    end
  module22 #() modinst62 (wire61, clk, wire9, wire6, reg11, reg13, reg12);
  assign wire63 = $signed((reg15 ?
                      $unsigned((wire7[(4'hf):(1'h0)] >= (wire10 ?
                          reg15 : reg12))) : $signed($signed(reg21))));
  assign wire64 = (!reg12);
  assign wire65 = $signed(((~&(^~(wire10 ? wire8 : wire7))) ?
                      (8'hba) : (reg17[(2'h2):(1'h0)] ?
                          $unsigned(wire64[(4'hc):(1'h0)]) : reg17)));
  assign wire66 = (~&$unsigned((-(~wire65))));
  assign wire67 = (+(^~(($signed(reg13) ~^ {wire9}) || ($signed((7'h44)) ?
                      reg17 : (wire61 ? reg12 : wire8)))));
  assign wire68 = $signed((8'hb5));
  always
    @(posedge clk) begin
      reg69 <= reg18[(3'h7):(2'h3)];
    end
  always
    @(posedge clk) begin
      reg70 <= ($unsigned($signed($unsigned({reg13, wire68}))) ?
          (({reg18, $unsigned(wire67)} < wire65[(3'h5):(3'h4)]) ?
              $unsigned(((reg17 ? wire67 : reg15) ?
                  $signed(reg17) : ((7'h41) ?
                      wire7 : (8'hb3)))) : (($unsigned(wire10) ?
                  (8'ha8) : (^~wire66)) + $unsigned((wire10 >> wire65)))) : $unsigned($unsigned((|(reg16 ^~ reg13)))));
      reg71 <= {reg21[(3'h5):(3'h4)]};
      if ((wire65[(1'h1):(1'h1)] | reg18[(4'ha):(1'h0)]))
        begin
          reg72 <= ($unsigned(((((8'hba) ? wire63 : reg69) ?
                  $signed(wire65) : (wire10 || wire7)) <= reg20)) ?
              $signed($unsigned(wire8[(3'h5):(1'h0)])) : wire6);
          if ({((^(!(wire65 * reg15))) ?
                  {$unsigned(wire61[(2'h2):(2'h2)])} : wire5[(3'h7):(1'h0)])})
            begin
              reg73 <= $signed((+(({reg12} ?
                  reg19[(1'h0):(1'h0)] : wire8) & (wire61 < reg15))));
              reg74 <= $unsigned(((wire64[(1'h0):(1'h0)] >> reg16) || (8'h9c)));
            end
          else
            begin
              reg73 <= ((reg12[(4'hc):(3'h6)] ^~ reg14[(3'h7):(2'h2)]) ^~ $unsigned({$unsigned({reg71,
                      reg20}),
                  reg71}));
              reg74 <= wire8;
              reg75 <= $unsigned(reg71[(4'ha):(4'h8)]);
              reg76 <= (^~$unsigned($unsigned($signed({reg16}))));
              reg77 <= reg16;
            end
          reg78 <= {{(reg11 ^~ reg14[(3'h6):(1'h1)]), (-(!$unsigned(reg69)))},
              reg76[(2'h3):(2'h2)]};
        end
      else
        begin
          if ((!$signed((wire61 ? reg71[(4'hc):(3'h7)] : (~(!wire9))))))
            begin
              reg72 <= $signed((((reg72 > $unsigned(wire65)) ?
                      $signed(reg20) : ($unsigned((7'h42)) ?
                          $signed(wire7) : $unsigned((8'ha7)))) ?
                  reg72[(4'h8):(3'h6)] : {reg17}));
              reg73 <= reg21[(3'h7):(1'h1)];
              reg74 <= reg16;
              reg75 <= $signed(reg77[(2'h3):(2'h3)]);
            end
          else
            begin
              reg72 <= (8'h9c);
            end
        end
    end
  assign wire79 = ((-(&(8'hb1))) ^ reg20);
  assign wire80 = reg71[(4'he):(3'h7)];
  assign wire81 = $unsigned($signed((-$signed((wire7 | wire5)))));
endmodule

module module22
#(parameter param59 = {(~&({((8'had) ? (8'hbe) : (8'hb0)), ((8'h9f) == (8'h9c))} - (|((8'ha9) ? (8'hb4) : (8'had))))), (~&(^~(((8'hbd) ? (8'hbb) : (8'ha2)) <<< ((8'haa) ? (8'ha2) : (8'hb1)))))}, 
parameter param60 = (&{{(^(8'h9e)), ((param59 ? param59 : (8'hb2)) ? param59 : param59)}, (8'h9e)}))
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'h15e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire27;
  input wire signed [(5'h10):(1'h0)] wire26;
  input wire [(4'h9):(1'h0)] wire25;
  input wire [(4'ha):(1'h0)] wire24;
  input wire [(5'h11):(1'h0)] wire23;
  wire signed [(4'hd):(1'h0)] wire58;
  wire [(5'h13):(1'h0)] wire57;
  wire [(4'hc):(1'h0)] wire42;
  wire [(4'hc):(1'h0)] wire41;
  wire signed [(5'h14):(1'h0)] wire36;
  wire signed [(2'h3):(1'h0)] wire35;
  wire [(4'hc):(1'h0)] wire34;
  wire [(2'h3):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire31;
  wire [(4'hc):(1'h0)] wire30;
  wire [(5'h11):(1'h0)] wire29;
  wire signed [(2'h3):(1'h0)] wire28;
  reg [(2'h3):(1'h0)] reg56 = (1'h0);
  reg signed [(4'he):(1'h0)] reg55 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg53 = (1'h0);
  reg [(5'h15):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg48 = (1'h0);
  reg [(5'h10):(1'h0)] reg47 = (1'h0);
  reg [(3'h7):(1'h0)] reg46 = (1'h0);
  reg [(3'h7):(1'h0)] reg45 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire42,
                 wire41,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
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
                 reg43,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire28 = (~^$signed(({(wire24 && wire23)} < (+$signed(wire25)))));
  assign wire29 = wire28[(1'h1):(1'h0)];
  assign wire30 = (((8'hb0) >= wire26[(1'h1):(1'h1)]) & (($unsigned($signed(wire25)) ^ $signed(wire29[(2'h2):(1'h0)])) ?
                      $signed($unsigned($unsigned(wire23))) : (($unsigned(wire29) ?
                          (!wire28) : wire23) <<< $unsigned((~wire26)))));
  assign wire31 = wire27[(3'h6):(3'h6)];
  assign wire32 = (&($unsigned({$signed((8'h9c))}) ?
                      ((wire29 ? $unsigned((7'h41)) : (-wire31)) ?
                          {((8'hbc) <<< wire31),
                              $signed(wire23)} : $unsigned((~|wire23))) : wire26[(2'h2):(1'h1)]));
  assign wire33 = {wire25[(4'h9):(3'h4)]};
  assign wire34 = ($signed(wire32[(2'h2):(1'h0)]) != $unsigned({{$unsigned((8'hbb))},
                      ((!wire26) ^~ (wire33 >>> wire33))}));
  assign wire35 = $unsigned((($unsigned(wire30) ?
                          (wire30 <<< (wire33 ? wire27 : wire30)) : wire31) ?
                      {(wire33[(1'h1):(1'h0)] - {wire33,
                              wire23})} : (!$unsigned($unsigned(wire25)))));
  assign wire36 = ((($signed(wire31[(3'h4):(2'h2)]) * wire32[(3'h4):(2'h2)]) ?
                          (({wire30} ?
                              wire31[(2'h3):(2'h3)] : ((8'hbb) * wire29)) << $signed(wire26)) : {({wire25} ?
                                  (wire33 ^ wire29) : $unsigned(wire28)),
                              wire28}) ?
                      $unsigned($unsigned(wire23)) : $signed(wire31));
  always
    @(posedge clk) begin
      reg37 <= $unsigned(wire30[(4'ha):(4'h9)]);
      reg38 <= wire26[(3'h5):(2'h3)];
      reg39 <= ({(((wire34 ?
                  wire36 : wire26) | $unsigned(wire28)) && $unsigned((!wire30)))} ?
          ((($signed(wire34) ? wire28 : (^~(8'hb1))) ?
              wire31[(3'h5):(3'h5)] : wire32[(3'h7):(3'h6)]) - wire29[(4'he):(4'h8)]) : ($signed($signed($signed((8'h9f)))) << (8'hb0)));
      reg40 <= {(~&(((8'hbe) >>> (wire32 && (8'hbb))) ?
              wire27[(4'ha):(3'h6)] : $signed($signed(wire35))))};
    end
  assign wire41 = $unsigned($signed(wire25));
  assign wire42 = ($unsigned(($signed({wire34,
                          wire31}) || $unsigned((8'ha6)))) ?
                      wire36[(1'h1):(1'h0)] : (($signed((wire33 - wire36)) ?
                          {reg40, {wire33}} : wire36) ~^ wire34));
  always
    @(posedge clk) begin
      reg43 <= (((reg38[(1'h1):(1'h0)] << $signed(wire29)) ?
          $signed(reg37) : $signed({(wire33 == reg37)})) && $unsigned(({$signed(reg38),
          wire25} > ((wire26 ? wire36 : wire24) >= $signed(wire23)))));
      reg44 <= $signed(($signed(wire30) ?
          (reg38[(3'h4):(1'h0)] ?
              ($signed((8'hb5)) << (-wire30)) : $signed((~&reg37))) : {wire24}));
      if (({$signed((~^((8'haf) ?
              (8'ha4) : (8'ha9))))} * (+$unsigned(wire34[(3'h6):(3'h6)]))))
        begin
          reg45 <= $unsigned(wire36[(5'h13):(5'h12)]);
          reg46 <= wire34;
          if (($unsigned((~|{$unsigned(wire30), reg45[(3'h5):(1'h0)]})) ?
              wire41[(3'h5):(1'h1)] : $signed($signed($signed((8'ha8))))))
            begin
              reg47 <= wire23;
              reg48 <= ($unsigned(reg40[(1'h0):(1'h0)]) ?
                  reg43 : $signed(wire24));
            end
          else
            begin
              reg47 <= $signed(($signed(((reg47 ? reg37 : wire32) ?
                      (!reg43) : reg39[(3'h6):(2'h3)])) ?
                  (wire29 ?
                      $unsigned(wire23) : reg40[(2'h3):(2'h3)]) : (($unsigned(wire34) ?
                      (wire24 | (8'ha2)) : wire34) | $unsigned($unsigned(wire28)))));
              reg48 <= ($unsigned((8'hbf)) >> (8'hb6));
              reg49 <= $unsigned($signed((-(wire34[(3'h5):(3'h4)] ?
                  $unsigned(reg47) : $unsigned(wire36)))));
              reg50 <= ($unsigned({$signed(wire34[(4'hc):(2'h3)])}) - {(($unsigned(wire42) ?
                      (wire30 * reg48) : (wire31 <<< wire34)) ~^ ((wire29 && reg49) * reg40))});
              reg51 <= (($signed((~&(wire27 >= wire30))) ?
                      reg49[(5'h10):(1'h1)] : {$unsigned(reg47),
                          reg44[(1'h1):(1'h1)]}) ?
                  ($signed($unsigned($signed(wire32))) << {$signed($unsigned(wire26)),
                      $signed($unsigned(wire41))}) : reg44);
            end
          reg52 <= reg38[(3'h5):(3'h4)];
        end
      else
        begin
          reg45 <= wire30[(1'h0):(1'h0)];
        end
      reg53 <= ($signed(reg46[(3'h4):(3'h4)]) ? reg39[(2'h2):(1'h1)] : (8'hb7));
    end
  always
    @(posedge clk) begin
      reg54 <= $unsigned(((((8'ha8) ?
                  (wire24 ? (8'h9e) : wire25) : (wire24 ? wire25 : (7'h40))) ?
              ($signed(wire30) & (|reg51)) : wire35[(2'h3):(2'h2)]) ?
          $unsigned($unsigned((wire26 >= reg44))) : (-(~&(8'ha5)))));
      reg55 <= $unsigned($signed(wire31));
      reg56 <= (reg51[(2'h3):(1'h1)] <<< $unsigned(($signed($signed(reg39)) & $signed((~&reg43)))));
    end
  assign wire57 = (~reg44);
  assign wire58 = (~^($unsigned(wire36) + {wire34[(4'hc):(3'h6)],
                      reg56[(1'h0):(1'h0)]}));
endmodule

module module150  (y, clk, wire155, wire154, wire153, wire152, wire151);
  output wire [(32'h1b0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire155;
  input wire [(4'hd):(1'h0)] wire154;
  input wire [(4'hf):(1'h0)] wire153;
  input wire signed [(4'h8):(1'h0)] wire152;
  input wire signed [(4'h8):(1'h0)] wire151;
  wire [(5'h11):(1'h0)] wire192;
  wire [(5'h14):(1'h0)] wire191;
  wire [(3'h4):(1'h0)] wire190;
  wire signed [(3'h4):(1'h0)] wire189;
  wire signed [(4'he):(1'h0)] wire188;
  wire [(5'h14):(1'h0)] wire187;
  wire [(5'h14):(1'h0)] wire186;
  wire signed [(2'h3):(1'h0)] wire185;
  wire signed [(5'h10):(1'h0)] wire184;
  wire [(5'h14):(1'h0)] wire180;
  wire [(5'h12):(1'h0)] wire179;
  wire [(4'h8):(1'h0)] wire167;
  wire [(4'hf):(1'h0)] wire166;
  wire signed [(3'h6):(1'h0)] wire165;
  wire signed [(2'h3):(1'h0)] wire164;
  wire [(4'hf):(1'h0)] wire160;
  wire [(4'hd):(1'h0)] wire159;
  wire signed [(4'h8):(1'h0)] wire156;
  reg [(2'h3):(1'h0)] reg183 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg178 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg177 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg176 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg175 = (1'h0);
  reg [(5'h10):(1'h0)] reg174 = (1'h0);
  reg [(5'h14):(1'h0)] reg173 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg172 = (1'h0);
  reg [(4'he):(1'h0)] reg171 = (1'h0);
  reg [(4'he):(1'h0)] reg170 = (1'h0);
  reg [(4'ha):(1'h0)] reg169 = (1'h0);
  reg [(3'h4):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg163 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg161 = (1'h0);
  reg [(5'h14):(1'h0)] reg158 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg157 = (1'h0);
  assign y = {wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire180,
                 wire179,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire160,
                 wire159,
                 wire156,
                 reg183,
                 reg182,
                 reg181,
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
                 reg163,
                 reg162,
                 reg161,
                 reg158,
                 reg157,
                 (1'h0)};
  assign wire156 = $unsigned(($unsigned(wire151) ^~ $unsigned((wire152 ?
                       $unsigned(wire151) : (wire153 + wire154)))));
  always
    @(posedge clk) begin
      reg157 <= ((wire154 ?
              (wire153[(4'h9):(3'h7)] ?
                  wire156[(3'h4):(2'h2)] : $unsigned((wire154 <= (8'ha6)))) : (8'h9e)) ?
          {(~^wire155)} : ($unsigned($unsigned($signed(wire156))) == $unsigned(wire155)));
      reg158 <= (-(((8'hbc) ?
          reg157[(3'h7):(3'h4)] : (wire154 ?
              (+wire154) : (!reg157))) - reg157));
    end
  assign wire159 = $unsigned($signed($signed(({wire151} ?
                       {reg158} : wire153))));
  assign wire160 = ({wire151[(2'h2):(1'h1)]} == {(+((8'hb9) ?
                           $signed((8'hb2)) : (+reg157))),
                       ($signed((~&wire152)) ?
                           (wire159 ^~ wire152) : wire154[(2'h2):(1'h1)])});
  always
    @(posedge clk) begin
      if ((reg158[(4'h9):(2'h3)] ?
          {wire155} : ($signed((!$unsigned(reg158))) ?
              $signed($signed(wire151[(2'h2):(1'h0)])) : wire160[(1'h1):(1'h0)])))
        begin
          reg161 <= (~|(|{wire155[(3'h5):(2'h2)],
              {wire160[(4'h8):(3'h5)], (|wire160)}}));
        end
      else
        begin
          reg161 <= ({wire159} ?
              $unsigned({($signed(wire152) > $signed(reg158))}) : (($unsigned((wire156 ^~ wire151)) < ({wire152} ?
                      $signed((8'hbe)) : (|wire151))) ?
                  ($signed($signed(wire155)) ?
                      (~^(wire159 ~^ wire160)) : (~&{reg161,
                          wire160})) : (wire153[(1'h0):(1'h0)] ?
                      wire160 : $signed($signed(wire153)))));
          reg162 <= wire153;
        end
      reg163 <= ((7'h42) ?
          $signed($signed($signed((!(8'h9e))))) : wire160[(4'h9):(1'h1)]);
    end
  assign wire164 = ($signed((~^$signed((wire156 ? wire160 : (8'haa))))) ?
                       (reg163[(4'h9):(4'h9)] ?
                           (^~wire156[(2'h2):(1'h0)]) : wire151) : (wire151 > wire156[(2'h2):(2'h2)]));
  assign wire165 = (~{$signed($signed(reg163[(4'hb):(2'h3)])), reg163});
  assign wire166 = wire165[(1'h1):(1'h1)];
  assign wire167 = $signed({(((wire151 ? reg161 : (8'ha8)) ?
                               wire151[(2'h2):(1'h1)] : {reg162, (8'h9f)}) ?
                           ((~wire154) ?
                               (&reg163) : reg163[(3'h5):(1'h0)]) : ($unsigned(wire154) ?
                               wire154 : wire153))});
  always
    @(posedge clk) begin
      reg168 <= ({(~$unsigned((|wire151))), wire152[(4'h8):(2'h2)]} ?
          (^reg157) : (8'ha1));
      reg169 <= reg157[(3'h4):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg170 <= ($unsigned((7'h40)) ?
          (wire165[(2'h2):(1'h0)] <= (wire159[(2'h2):(1'h0)] < wire153)) : ((-($unsigned(wire154) ?
                  (wire160 <<< (8'ha2)) : reg158)) ?
              {(8'hb7),
                  {reg157[(1'h1):(1'h0)]}} : $signed($signed((+reg157)))));
      reg171 <= wire154[(1'h1):(1'h0)];
      reg172 <= (&{reg162,
          $signed(({wire154} ? wire155 : (wire165 ? reg170 : wire152)))});
      if ((($signed((8'ha4)) ? reg158 : reg172[(4'h8):(2'h2)]) <= reg172))
        begin
          reg173 <= reg161;
          if (wire160)
            begin
              reg174 <= (^reg173);
              reg175 <= $signed($signed((!$unsigned({reg162}))));
              reg176 <= $unsigned((~|reg170[(4'hc):(3'h4)]));
              reg177 <= $unsigned((((&(reg169 - wire166)) ?
                      wire165 : ({(8'hb9)} ? (~reg158) : (8'hb6))) ?
                  reg161 : (wire166 ?
                      ((wire155 ? reg171 : reg158) >= (wire154 ?
                          reg174 : wire166)) : wire167)));
            end
          else
            begin
              reg174 <= (reg163 >= (+reg168[(2'h3):(1'h1)]));
              reg175 <= ((reg175 ?
                      ($signed($unsigned(wire155)) ^~ reg176[(3'h7):(2'h3)]) : reg175[(2'h2):(1'h0)]) ?
                  $unsigned((wire167 ?
                      (((8'ha3) >> wire159) ?
                          (!reg174) : reg173) : $signed(wire156[(1'h1):(1'h1)]))) : (~($signed($unsigned(reg174)) ?
                      {reg171[(3'h5):(2'h2)], wire155} : (~&(~&reg163)))));
              reg176 <= (($unsigned(reg169) ?
                      (wire164[(2'h3):(2'h2)] ?
                          reg174 : wire152[(2'h3):(1'h1)]) : $signed($unsigned(((8'h9d) | reg174)))) ?
                  (~|$signed((&$unsigned(reg170)))) : (reg157 ?
                      ($signed(wire155[(1'h1):(1'h0)]) ?
                          ((~^wire151) <<< reg173) : (reg163[(3'h4):(1'h1)] ?
                              (reg172 ?
                                  wire164 : wire151) : wire160)) : ((8'hb7) > reg171)));
              reg177 <= $signed($signed(reg172[(1'h0):(1'h0)]));
              reg178 <= ((reg174[(2'h3):(2'h3)] < $unsigned(($signed(reg162) - (8'ha3)))) ?
                  wire159[(1'h1):(1'h0)] : (8'ha1));
            end
        end
      else
        begin
          reg173 <= reg157[(3'h7):(3'h5)];
        end
    end
  assign wire179 = reg177[(2'h3):(1'h0)];
  assign wire180 = $unsigned(wire151);
  always
    @(posedge clk) begin
      reg181 <= (~|$unsigned(wire155[(1'h1):(1'h0)]));
      reg182 <= ($signed(reg162[(2'h2):(2'h2)]) ?
          ($unsigned(((wire179 - wire165) ?
              (&reg178) : $signed(reg173))) + ((8'hb5) ?
              (^wire151) : $signed((reg178 ^ reg178)))) : (~^wire154));
      reg183 <= wire179[(3'h6):(3'h6)];
    end
  assign wire184 = reg162;
  assign wire185 = {((|(~|(+(7'h44)))) ^ (~^reg157[(3'h6):(2'h3)])), reg163};
  assign wire186 = wire153[(4'h9):(1'h1)];
  assign wire187 = (wire160 ?
                       (+(wire167 ? (-(reg175 < wire179)) : reg157)) : reg176);
  assign wire188 = reg171;
  assign wire189 = (($signed($unsigned((-reg183))) * (|$unsigned($unsigned(reg178)))) ?
                       reg161 : $unsigned($signed({$unsigned(reg172),
                           wire186[(4'hc):(3'h7)]})));
  assign wire190 = wire159[(4'hb):(4'hb)];
  assign wire191 = (~|((reg163 ?
                       reg168[(2'h3):(2'h3)] : reg174[(1'h1):(1'h1)]) << (+$unsigned((reg181 ?
                       wire188 : wire154)))));
  assign wire192 = wire186[(4'hb):(3'h6)];
endmodule

module module117
#(parameter param135 = {((8'hb9) > ({{(8'hb6), (8'h9c)}} >>> (~^(&(8'hb3))))), (!((8'h9e) ? (((8'hac) | (8'hb1)) ^ {(8'hbe)}) : ((~(8'h9e)) ? ((8'ha1) ? (8'ha3) : (8'h9d)) : {(8'ha1), (7'h42)})))}, 
parameter param136 = (+{param135}))
(y, clk, wire122, wire121, wire120, wire119, wire118);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire122;
  input wire [(4'hf):(1'h0)] wire121;
  input wire [(5'h10):(1'h0)] wire120;
  input wire [(3'h6):(1'h0)] wire119;
  input wire [(2'h2):(1'h0)] wire118;
  wire signed [(5'h14):(1'h0)] wire134;
  wire signed [(3'h7):(1'h0)] wire133;
  wire [(4'ha):(1'h0)] wire132;
  wire signed [(4'hc):(1'h0)] wire131;
  wire signed [(4'ha):(1'h0)] wire130;
  wire [(4'hb):(1'h0)] wire129;
  wire [(4'h9):(1'h0)] wire128;
  wire [(4'h9):(1'h0)] wire127;
  wire [(5'h11):(1'h0)] wire126;
  wire signed [(5'h12):(1'h0)] wire125;
  wire [(4'he):(1'h0)] wire124;
  wire signed [(5'h12):(1'h0)] wire123;
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 (1'h0)};
  assign wire123 = $signed(wire118);
  assign wire124 = $signed($unsigned(({{wire118},
                       $signed(wire120)} + ($signed((8'hb0)) <= (wire123 != wire123)))));
  assign wire125 = ((^~((+wire121) >= {$unsigned(wire118)})) ?
                       $unsigned(wire120) : wire120);
  assign wire126 = (~($unsigned($unsigned(wire121)) < $unsigned((-(8'hab)))));
  assign wire127 = (^wire119);
  assign wire128 = (wire122[(5'h11):(3'h5)] < wire123);
  assign wire129 = $signed((wire121[(4'hd):(4'hd)] < ($unsigned($unsigned(wire128)) ?
                       {wire124[(2'h3):(2'h2)],
                           wire118} : $signed($signed(wire118)))));
  assign wire130 = {$signed((({(8'hb3)} >= {wire120, wire118}) - wire119))};
  assign wire131 = (+((wire120[(2'h2):(2'h2)] ?
                           $unsigned($unsigned(wire119)) : (~&wire129[(2'h3):(1'h1)])) ?
                       wire118 : {{$unsigned(wire127),
                               wire127[(3'h4):(1'h0)]}}));
  assign wire132 = (wire129[(4'hb):(3'h6)] - $unsigned((~|wire128)));
  assign wire133 = $unsigned(wire123[(4'hf):(3'h5)]);
  assign wire134 = (wire131[(4'ha):(2'h2)] ?
                       wire120 : ((-{wire131[(1'h0):(1'h0)]}) - wire120));
endmodule

module module93  (y, clk, wire98, wire97, wire96, wire95, wire94);
  output wire [(32'h7c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire98;
  input wire signed [(4'hb):(1'h0)] wire97;
  input wire signed [(5'h11):(1'h0)] wire96;
  input wire signed [(5'h11):(1'h0)] wire95;
  input wire signed [(3'h4):(1'h0)] wire94;
  wire signed [(4'h8):(1'h0)] wire111;
  wire [(5'h10):(1'h0)] wire110;
  wire [(3'h4):(1'h0)] wire109;
  wire signed [(5'h10):(1'h0)] wire108;
  wire signed [(3'h5):(1'h0)] wire105;
  wire signed [(4'hb):(1'h0)] wire104;
  reg [(5'h15):(1'h0)] reg107 = (1'h0);
  reg [(4'ha):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg103 = (1'h0);
  reg [(2'h3):(1'h0)] reg102 = (1'h0);
  reg [(4'ha):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg100 = (1'h0);
  reg [(2'h3):(1'h0)] reg99 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire105,
                 wire104,
                 reg107,
                 reg106,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg99 <= wire97;
      reg100 <= wire97;
      reg101 <= wire98;
      reg102 <= reg99;
      reg103 <= $signed((|wire97));
    end
  assign wire104 = reg101;
  assign wire105 = (^~reg101);
  always
    @(posedge clk) begin
      reg106 <= $unsigned((^~wire96));
      reg107 <= $signed((~^(((~^wire94) & $signed(reg101)) ?
          (reg103 >> wire97[(2'h3):(2'h2)]) : $unsigned((^wire94)))));
    end
  assign wire108 = (($unsigned(wire96[(4'hf):(3'h6)]) ?
                       ($unsigned(reg103[(2'h3):(2'h2)]) & ((wire105 ?
                           wire105 : wire98) ~^ $unsigned(wire95))) : {(8'hb6),
                           ($unsigned(wire105) ?
                               $unsigned(reg100) : $signed(wire95))}) ^ wire95);
  assign wire109 = reg106;
  assign wire110 = $signed((^~$signed($signed(((8'hbe) ? (8'haa) : wire104)))));
  assign wire111 = ({(~&$signed((8'h9c)))} * (|(|(wire94 >= (~&reg102)))));
endmodule
