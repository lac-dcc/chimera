module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h2a6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire [(3'h7):(1'h0)] wire251;
  wire signed [(5'h14):(1'h0)] wire250;
  wire signed [(5'h14):(1'h0)] wire248;
  wire [(4'ha):(1'h0)] wire247;
  wire [(5'h13):(1'h0)] wire246;
  wire [(3'h6):(1'h0)] wire245;
  wire [(4'hf):(1'h0)] wire244;
  wire [(4'he):(1'h0)] wire243;
  wire signed [(4'hf):(1'h0)] wire242;
  wire signed [(5'h15):(1'h0)] wire241;
  wire [(4'ha):(1'h0)] wire222;
  wire signed [(4'hd):(1'h0)] wire221;
  wire [(5'h13):(1'h0)] wire220;
  wire signed [(4'hd):(1'h0)] wire219;
  wire [(5'h10):(1'h0)] wire218;
  wire [(4'hd):(1'h0)] wire217;
  wire [(5'h15):(1'h0)] wire216;
  wire [(3'h6):(1'h0)] wire198;
  wire signed [(3'h4):(1'h0)] wire196;
  wire [(5'h10):(1'h0)] wire54;
  reg signed [(5'h13):(1'h0)] reg199 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg200 = (1'h0);
  reg [(3'h7):(1'h0)] reg201 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg202 = (1'h0);
  reg [(3'h6):(1'h0)] reg203 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg204 = (1'h0);
  reg [(4'ha):(1'h0)] reg205 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg206 = (1'h0);
  reg [(5'h15):(1'h0)] reg207 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg208 = (1'h0);
  reg [(2'h3):(1'h0)] reg209 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg210 = (1'h0);
  reg [(4'he):(1'h0)] reg211 = (1'h0);
  reg [(2'h2):(1'h0)] reg212 = (1'h0);
  reg signed [(4'he):(1'h0)] reg213 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg214 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg215 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg223 = (1'h0);
  reg [(2'h2):(1'h0)] reg224 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg225 = (1'h0);
  reg [(4'hb):(1'h0)] reg226 = (1'h0);
  reg [(3'h7):(1'h0)] reg227 = (1'h0);
  reg [(4'he):(1'h0)] reg228 = (1'h0);
  reg [(4'h8):(1'h0)] reg229 = (1'h0);
  reg [(5'h15):(1'h0)] reg230 = (1'h0);
  reg [(4'h8):(1'h0)] reg231 = (1'h0);
  reg [(3'h4):(1'h0)] reg232 = (1'h0);
  reg [(5'h12):(1'h0)] reg233 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg234 = (1'h0);
  reg [(5'h13):(1'h0)] reg235 = (1'h0);
  reg signed [(4'he):(1'h0)] reg236 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg237 = (1'h0);
  reg [(4'ha):(1'h0)] reg238 = (1'h0);
  reg [(4'h9):(1'h0)] reg239 = (1'h0);
  reg [(5'h11):(1'h0)] reg240 = (1'h0);
  assign y = {wire251,
                 wire250,
                 wire248,
                 wire247,
                 wire246,
                 wire245,
                 wire244,
                 wire243,
                 wire242,
                 wire241,
                 wire222,
                 wire221,
                 wire220,
                 wire219,
                 wire218,
                 wire217,
                 wire216,
                 wire198,
                 wire196,
                 wire54,
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
                 reg223,
                 reg224,
                 reg225,
                 reg226,
                 reg227,
                 reg228,
                 reg229,
                 reg230,
                 reg231,
                 reg232,
                 reg233,
                 reg234,
                 reg235,
                 reg236,
                 reg237,
                 reg238,
                 reg239,
                 reg240,
                 (1'h0)};
  module5 #() modinst55 (.wire7(wire1), .wire6(wire2), .wire8(wire4), .wire10(wire3), .y(wire54), .wire9(wire0), .clk(clk));
  module56 #() modinst197 (wire196, clk, wire1, wire4, wire0, wire2);
  assign wire198 = wire54[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg199 <= (wire3 | wire3[(2'h2):(1'h0)]);
      if (($unsigned(wire3[(4'ha):(2'h2)]) <= wire4))
        begin
          if ((reg199[(1'h1):(1'h0)] <<< wire1[(4'h9):(3'h7)]))
            begin
              reg200 <= {wire0[(3'h6):(3'h6)]};
              reg201 <= ((!(!{$unsigned((8'hbc))})) ?
                  (+$signed($unsigned((reg200 <= reg199)))) : (|$unsigned(wire1)));
            end
          else
            begin
              reg200 <= (wire0[(4'h9):(2'h2)] ?
                  ($unsigned($signed((!wire0))) && $signed(wire1[(3'h7):(1'h1)])) : (^~$signed({(8'hac),
                      reg200})));
            end
        end
      else
        begin
          reg200 <= wire1;
          reg201 <= $signed(wire54[(4'he):(1'h1)]);
          reg202 <= $signed({(reg200[(3'h5):(3'h5)] ? wire0 : (^~wire0)),
              reg201[(3'h4):(1'h1)]});
          reg203 <= {(~^(~wire3[(3'h6):(3'h5)]))};
          reg204 <= {$unsigned(wire3),
              ((^~(~|(reg202 > wire1))) ?
                  $signed($signed($signed((7'h44)))) : (!reg199[(5'h11):(5'h11)]))};
        end
      if (wire54[(3'h5):(2'h2)])
        begin
          reg205 <= ($signed(reg202) ? (8'hae) : reg200[(4'h9):(4'h8)]);
          reg206 <= wire4;
          reg207 <= reg201[(3'h5):(3'h4)];
          reg208 <= $signed(($signed((!$signed((8'h9c)))) & ({$unsigned(reg204)} + (~(reg206 ^~ reg205)))));
        end
      else
        begin
          reg205 <= $unsigned(({$signed($unsigned(wire3)),
                  (-reg204[(3'h4):(2'h2)])} ?
              {reg205} : (8'ha3)));
          if (reg200[(3'h7):(1'h0)])
            begin
              reg206 <= ($unsigned($signed($signed(((8'h9d) >> wire4)))) ?
                  ((|wire4) ?
                      (reg203 ?
                          $signed((wire3 ?
                              reg203 : (8'ha5))) : reg206) : ((wire2[(4'h8):(3'h5)] ^~ reg205) < $signed($unsigned(wire196)))) : $unsigned(($signed($signed(reg207)) >> reg200[(5'h10):(3'h6)])));
              reg207 <= ((+{((!(8'hbc)) ^ ((8'hb5) ? reg202 : reg205)),
                      $signed($unsigned(wire198))}) ?
                  (reg206 ?
                      {(wire1 & (reg208 ^ wire0))} : {$unsigned(wire1)}) : wire4);
              reg208 <= $unsigned(reg199[(4'hf):(4'h9)]);
              reg209 <= ($unsigned((~|$signed($unsigned(wire196)))) < ((((wire3 ?
                              reg206 : wire2) ?
                          reg200[(3'h5):(3'h5)] : (reg199 ? reg203 : reg199)) ?
                      reg199[(5'h10):(1'h1)] : $unsigned(((8'h9e) && (7'h41)))) ?
                  reg203[(1'h1):(1'h1)] : reg203));
              reg210 <= ($signed(reg208[(4'h8):(1'h1)]) | (8'hb2));
            end
          else
            begin
              reg206 <= reg205;
              reg207 <= (reg204[(4'h9):(2'h2)] >= $unsigned(($signed(((8'h9d) >> wire198)) ?
                  $unsigned(reg199) : (!reg201[(1'h0):(1'h0)]))));
            end
          reg211 <= reg202;
        end
      reg212 <= (7'h44);
      reg213 <= $signed((^~(~^((&reg206) ?
          (wire1 < wire4) : $signed(reg201)))));
    end
  always
    @(posedge clk) begin
      reg214 <= (~^reg207[(4'ha):(2'h2)]);
      reg215 <= $signed($signed(reg211[(2'h2):(2'h2)]));
    end
  assign wire216 = ((&$signed(reg202)) ?
                       $unsigned((wire2[(3'h4):(2'h2)] ?
                           wire3 : $unsigned($signed(reg203)))) : wire54[(4'h8):(3'h7)]);
  assign wire217 = ($signed($signed((reg205 ~^ {(7'h42),
                       wire0}))) & $signed(((reg206[(1'h0):(1'h0)] && $signed(reg205)) ?
                       (~(wire2 >>> reg204)) : reg207[(3'h4):(1'h1)])));
  assign wire218 = ({$signed($unsigned($unsigned(reg208))),
                       (^~(wire198[(1'h0):(1'h0)] ^~ reg210))} == $unsigned((((~&(8'h9e)) | $signed(reg215)) >= wire198[(3'h4):(1'h1)])));
  assign wire219 = wire198;
  assign wire220 = reg214[(3'h4):(2'h3)];
  assign wire221 = (reg207 ?
                       ($unsigned(($unsigned((7'h41)) ?
                               reg202[(1'h0):(1'h0)] : (^wire217))) ?
                           (|(!reg215)) : $unsigned($signed($unsigned(reg210)))) : (reg209[(2'h3):(1'h1)] ?
                           (wire1 ?
                               ($unsigned(wire1) <= (~^wire196)) : ($signed((7'h40)) | ((7'h43) ?
                                   reg209 : reg201))) : reg203[(3'h5):(3'h5)]));
  assign wire222 = $unsigned($signed((!$signed($unsigned(reg212)))));
  always
    @(posedge clk) begin
      if ($unsigned(((~^{wire1}) ?
          ((reg215[(4'h9):(2'h2)] | (reg205 ? wire2 : reg213)) ?
              reg200[(4'hf):(2'h3)] : {((7'h42) || wire1),
                  (reg213 <= reg202)}) : wire216[(2'h2):(1'h0)])))
        begin
          reg223 <= (8'ha1);
          reg224 <= reg206[(1'h0):(1'h0)];
          reg225 <= wire219[(2'h3):(1'h1)];
          reg226 <= {reg205[(3'h6):(3'h6)],
              (wire220 ^ (wire4[(4'ha):(2'h3)] - (|wire0[(3'h7):(3'h5)])))};
        end
      else
        begin
          reg223 <= $unsigned(((8'hba) ?
              $unsigned(((reg213 ? wire221 : wire221) ?
                  (^(8'hab)) : (reg211 + reg203))) : reg225[(2'h2):(1'h0)]));
          reg224 <= wire3;
          reg225 <= (reg206 ?
              (~^$unsigned((^{(8'had), reg214}))) : reg208[(4'h8):(3'h7)]);
          reg226 <= (^reg225);
        end
      reg227 <= $unsigned($unsigned($unsigned(({reg214, reg225} ?
          reg203 : {(7'h41), reg199}))));
      reg228 <= (!{($unsigned((wire220 <= reg202)) ?
              wire3[(4'hc):(2'h2)] : ($signed((8'h9c)) + (wire220 ^ wire220)))});
      reg229 <= $signed(((8'ha7) ?
          (&$unsigned({wire196, wire198})) : (~$signed($signed(wire219)))));
      if (wire218)
        begin
          if ($unsigned(wire196))
            begin
              reg230 <= ((~^($signed($unsigned(reg203)) ?
                  {reg223,
                      (reg206 ~^ (8'had))} : wire4)) <<< reg207[(5'h10):(2'h2)]);
              reg231 <= $signed($unsigned(reg208));
              reg232 <= $signed(wire0);
              reg233 <= ($unsigned(reg205[(4'h9):(3'h4)]) ?
                  {reg226[(1'h0):(1'h0)], $signed(reg203)} : ((~^{reg227,
                      $signed(wire218)}) ~^ ((+$signed((7'h40))) ?
                      $unsigned(reg223[(2'h3):(2'h2)]) : (|(^~reg212)))));
              reg234 <= (8'ha7);
            end
          else
            begin
              reg230 <= ($signed((&$unsigned((reg215 ?
                  (8'hb1) : (8'ha3))))) <= {(!$signed(wire221))});
              reg231 <= reg205;
            end
          reg235 <= (!(&(~^(+$unsigned(reg213)))));
          if ((!$signed(wire54[(4'hc):(4'ha)])))
            begin
              reg236 <= (reg211 > (reg201 ?
                  reg201 : (^$signed((reg215 ? reg229 : (7'h41))))));
              reg237 <= ($signed($unsigned((~&$signed(reg231)))) ^ wire54[(4'hb):(4'h9)]);
              reg238 <= (((reg202[(3'h4):(2'h3)] || (-(wire217 ?
                          (8'h9d) : reg208))) ?
                      wire220[(2'h2):(2'h2)] : ({$unsigned(wire0),
                          $signed(reg201)} | $unsigned((wire0 >>> wire3)))) ?
                  $signed({reg205[(1'h0):(1'h0)],
                      $signed((wire54 ?
                          (7'h41) : reg228))}) : reg212[(1'h1):(1'h1)]);
              reg239 <= (~{$unsigned({(8'ha7)})});
            end
          else
            begin
              reg236 <= reg205;
              reg237 <= reg206[(1'h0):(1'h0)];
            end
          reg240 <= (($signed(((8'ha0) ? wire221 : (!wire219))) ?
              $unsigned((7'h40)) : (^(wire222 ?
                  reg213 : $signed(wire2)))) == {($signed((~&(8'hab))) ?
                  $unsigned({wire0}) : ((-reg203) < $unsigned(reg211))),
              {$unsigned($unsigned(reg208))}});
        end
      else
        begin
          reg230 <= $signed((~^($unsigned(reg207[(3'h7):(3'h4)]) && ({reg227} ?
              reg209[(1'h0):(1'h0)] : (~|reg202)))));
          reg231 <= (~($unsigned(reg215[(4'hb):(4'hb)]) ?
              wire4[(1'h1):(1'h1)] : ((~{wire0}) && ((~&reg224) || (&reg233)))));
        end
    end
  assign wire241 = reg226[(3'h7):(2'h2)];
  assign wire242 = (^(^reg214));
  assign wire243 = (~|((~(|$unsigned(reg235))) <= $signed(wire1)));
  assign wire244 = wire219[(3'h5):(3'h5)];
  assign wire245 = {{$unsigned(reg236[(2'h3):(1'h1)])},
                       ({wire198[(1'h1):(1'h1)], {$unsigned(wire221)}} ?
                           reg213[(4'h9):(4'h9)] : $unsigned((wire1[(4'hd):(3'h6)] - $unsigned(reg226))))};
  assign wire246 = $signed(({((reg239 == reg204) ?
                           $unsigned(reg229) : reg210)} >>> $signed(wire1)));
  assign wire247 = ((wire246 || $unsigned(((wire198 != reg230) - (~&wire245)))) != ($signed(reg213) | $signed(((reg215 > wire198) ?
                       $signed(wire222) : (|reg205)))));
  module22 #() modinst249 (wire248, clk, wire221, wire218, wire1, reg200, wire219);
  assign wire250 = reg214;
  assign wire251 = $signed((~&{(~^$signed(wire250)),
                       $unsigned({(8'hb7), wire241})}));
endmodule

module module56
#(parameter param195 = (({(((7'h43) ? (8'hae) : (8'had)) ? (~|(8'ha6)) : ((7'h44) ? (7'h43) : (8'ha0))), (~^((8'hac) != (8'hba)))} * (^~((~|(7'h44)) != ((8'haf) || (8'hb7))))) ? (^(|(((8'hb3) ^ (7'h42)) < ((8'ha0) ^~ (8'h9d))))) : (|((!((8'hbe) ? (8'hba) : (8'hb8))) << (~^((7'h40) ? (7'h44) : (8'hb7)))))))
(y, clk, wire60, wire59, wire58, wire57);
  output wire [(32'h1a6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire60;
  input wire signed [(4'hd):(1'h0)] wire59;
  input wire signed [(4'hc):(1'h0)] wire58;
  input wire signed [(5'h10):(1'h0)] wire57;
  wire signed [(3'h4):(1'h0)] wire194;
  wire [(5'h15):(1'h0)] wire193;
  wire [(5'h15):(1'h0)] wire189;
  wire signed [(4'h8):(1'h0)] wire188;
  wire signed [(5'h11):(1'h0)] wire123;
  wire [(5'h12):(1'h0)] wire96;
  wire [(5'h14):(1'h0)] wire94;
  wire [(5'h15):(1'h0)] wire64;
  wire [(3'h5):(1'h0)] wire63;
  wire [(4'hd):(1'h0)] wire62;
  wire signed [(5'h14):(1'h0)] wire61;
  wire signed [(4'hb):(1'h0)] wire125;
  wire [(3'h6):(1'h0)] wire174;
  reg [(4'he):(1'h0)] reg192 = (1'h0);
  reg [(4'he):(1'h0)] reg191 = (1'h0);
  reg [(4'hc):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg187 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg186 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg185 = (1'h0);
  reg [(5'h12):(1'h0)] reg184 = (1'h0);
  reg [(5'h12):(1'h0)] reg183 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg182 = (1'h0);
  reg [(4'he):(1'h0)] reg181 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg180 = (1'h0);
  reg [(4'hb):(1'h0)] reg179 = (1'h0);
  reg [(5'h14):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg177 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg176 = (1'h0);
  reg [(5'h14):(1'h0)] reg127 = (1'h0);
  reg [(4'hf):(1'h0)] reg126 = (1'h0);
  assign y = {wire194,
                 wire193,
                 wire189,
                 wire188,
                 wire123,
                 wire96,
                 wire94,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire125,
                 wire174,
                 reg192,
                 reg191,
                 reg190,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg127,
                 reg126,
                 (1'h0)};
  assign wire61 = (~^wire59[(3'h5):(2'h3)]);
  assign wire62 = $unsigned(wire58);
  assign wire63 = (((wire59 ?
                          $unsigned(wire62) : ((wire62 ?
                              wire61 : wire62) ~^ (wire62 > (8'ha2)))) * (~|(wire60 - wire59[(4'hc):(4'hb)]))) ?
                      (8'ha1) : $signed((!(~|wire62[(2'h3):(2'h2)]))));
  assign wire64 = (wire61 <= wire60[(3'h5):(1'h0)]);
  module65 #() modinst95 (.wire66(wire57), .y(wire94), .clk(clk), .wire69(wire60), .wire67(wire61), .wire68(wire64));
  assign wire96 = {$signed($signed((^~((8'hbc) ? wire60 : wire94))))};
  module97 #() modinst124 (wire123, clk, wire58, wire94, wire59, wire96, wire63);
  assign wire125 = (((wire63 ? $unsigned((&wire61)) : {$unsigned(wire58)}) ?
                       (wire94[(5'h12):(5'h10)] >= wire59) : wire59) >>> wire94[(4'h9):(3'h7)]);
  always
    @(posedge clk) begin
      reg126 <= (|$signed((($unsigned(wire59) ?
          {wire64,
              wire125} : $unsigned((8'ha2))) == $unsigned($signed(wire63)))));
      reg127 <= ($signed({((8'hbf) ?
              (wire60 ?
                  reg126 : wire61) : $unsigned(wire57))}) != ((~{((8'haf) || wire96),
          $unsigned(wire123)}) || wire58));
    end
  module128 #() modinst175 (.y(wire174), .wire132(wire61), .wire129(wire123), .wire131(wire62), .clk(clk), .wire130(wire60), .wire133(wire57));
  always
    @(posedge clk) begin
      reg176 <= (^~(^~$signed((~&$signed(wire174)))));
      reg177 <= $unsigned($unsigned($signed(($unsigned(reg176) & (wire57 & reg126)))));
      reg178 <= wire123;
    end
  always
    @(posedge clk) begin
      if ({{wire59[(4'ha):(2'h2)], $unsigned($signed(reg126))},
          $unsigned(wire94)})
        begin
          reg179 <= (&wire94[(3'h6):(1'h0)]);
          if (wire125)
            begin
              reg180 <= ((((reg178 & $signed(wire63)) ?
                  (wire96 <= ((8'ha7) * wire62)) : {reg179}) || $signed($signed((~|reg179)))) && $signed(wire58));
              reg181 <= reg178;
              reg182 <= {$signed((&wire96)), (!reg179)};
            end
          else
            begin
              reg180 <= (~wire58);
              reg181 <= (wire58[(4'hb):(2'h2)] ?
                  wire63[(3'h5):(1'h0)] : (~^wire59));
              reg182 <= (reg176[(1'h0):(1'h0)] ?
                  (!$signed($unsigned($unsigned(wire58)))) : ($signed(((7'h40) ?
                      ((8'hae) ? wire57 : reg181) : (&reg176))) <= reg178));
              reg183 <= wire64[(4'h8):(2'h3)];
              reg184 <= wire125[(2'h2):(2'h2)];
            end
          reg185 <= reg127;
          reg186 <= $unsigned((&($signed($unsigned(reg179)) <<< $unsigned(((8'hbb) ^ wire58)))));
        end
      else
        begin
          if ($signed(wire61[(3'h5):(2'h2)]))
            begin
              reg179 <= ($signed($signed(((reg176 ? wire63 : (8'h9c)) ?
                  wire96 : ((8'hb3) ?
                      (8'hbb) : wire58)))) - reg176[(3'h6):(3'h4)]);
              reg180 <= reg182;
            end
          else
            begin
              reg179 <= $unsigned($unsigned($signed((^wire59))));
              reg180 <= wire59;
              reg181 <= (~^reg186);
            end
          reg182 <= wire57;
        end
      reg187 <= (($unsigned((wire174[(2'h3):(1'h0)] && $unsigned(reg181))) + wire57) == (((reg176 <<< (wire61 ?
          wire57 : reg182)) && {wire123}) << (^~((reg186 * wire58) ?
          ((8'ha6) >>> reg178) : $signed(wire61)))));
    end
  assign wire188 = (~|(|reg186[(2'h3):(1'h1)]));
  assign wire189 = ($unsigned(({(-reg181)} ?
                           (|(wire96 <<< (8'hb0))) : ({wire125,
                               reg187} | reg185))) ?
                       ((~wire123) ?
                           (~($unsigned(reg186) >> (reg183 ?
                               wire59 : (8'ha7)))) : $unsigned(($signed(reg182) >>> reg178[(4'hc):(4'hb)]))) : $unsigned((~&reg126)));
  always
    @(posedge clk) begin
      reg190 <= ((!wire189) || $signed($signed((~&wire61[(4'he):(2'h3)]))));
      reg191 <= reg187[(4'hf):(4'hd)];
    end
  always
    @(posedge clk) begin
      reg192 <= ($unsigned($signed({((8'ha0) ? reg176 : reg187), reg126})) ?
          reg126 : (reg183[(1'h0):(1'h0)] << $unsigned(reg126[(4'he):(3'h4)])));
    end
  assign wire193 = wire174;
  assign wire194 = $signed(((reg126[(1'h1):(1'h0)] - ((wire193 << wire63) ^~ wire174[(1'h1):(1'h0)])) && reg182[(3'h7):(3'h7)]));
endmodule

module module5
#(parameter param53 = {((&{(~|(8'ha1)), (+(8'ha5))}) ? ((~&(+(8'hb9))) ? {(~|(8'hbc)), ((8'ha0) ? (8'haa) : (8'hb5))} : ((+(8'hab)) | (~|(8'ha1)))) : (~(((7'h43) ? (8'ha5) : (7'h40)) != ((8'ha0) >= (8'hb1))))), (|((((8'hb3) ? (8'hae) : (8'h9c)) >= ((8'hb2) ? (8'hbd) : (8'h9c))) ? (((8'ha2) ? (8'hbb) : (8'ha1)) - {(7'h43), (8'haa)}) : (^~((8'ha4) ? (8'hb7) : (8'ha3)))))})
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h94):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire6;
  input wire signed [(4'ha):(1'h0)] wire7;
  input wire [(3'h6):(1'h0)] wire8;
  input wire signed [(5'h10):(1'h0)] wire9;
  input wire [(2'h2):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire52;
  wire signed [(4'h9):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire21;
  wire signed [(4'he):(1'h0)] wire50;
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  assign y = {wire52,
                 wire11,
                 wire12,
                 wire14,
                 wire15,
                 wire21,
                 wire50,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg13,
                 (1'h0)};
  assign wire11 = {wire8[(1'h0):(1'h0)]};
  assign wire12 = wire6;
  always
    @(posedge clk) begin
      reg13 <= $signed({(+(!(8'hb0))), (+wire12)});
    end
  assign wire14 = (^~($unsigned((wire8[(1'h0):(1'h0)] ?
                          (wire8 ? wire8 : wire10) : $signed(wire11))) ?
                      (+($unsigned((8'hbb)) >= wire10[(1'h1):(1'h0)])) : $unsigned(reg13[(3'h7):(3'h6)])));
  assign wire15 = wire10;
  always
    @(posedge clk) begin
      reg16 <= wire6[(1'h1):(1'h0)];
      reg17 <= $signed((8'hbf));
      reg18 <= (^wire12);
      reg19 <= wire6;
      reg20 <= ($unsigned((+(((8'hae) ? reg17 : wire9) ?
              (^~reg16) : $unsigned((7'h41))))) ?
          ($signed(((wire7 < reg17) << (wire14 ~^ reg17))) ?
              wire15 : (^reg18[(2'h2):(1'h0)])) : reg17);
    end
  assign wire21 = (|(|(^({wire12, wire7} | (|(8'ha0))))));
  module22 #() modinst51 (.y(wire50), .wire23(reg19), .wire25(wire6), .wire27(wire14), .clk(clk), .wire24(wire15), .wire26(reg18));
  assign wire52 = reg18;
endmodule

module module22
#(parameter param48 = ({{((~|(8'h9c)) ? {(7'h42), (8'hac)} : ((8'ha3) ? (8'hb3) : (8'had))), (((8'h9d) >> (8'hb6)) || (&(8'h9e)))}} ? {(~&((!(8'ha1)) ? ((8'hb1) ? (8'h9c) : (8'h9d)) : (8'hb3)))} : (~^((|((8'hb3) << (8'hb3))) ? (8'hb3) : {(|(8'h9f))}))), 
parameter param49 = (-(({{param48}} >>> param48) ? param48 : param48)))
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire27;
  input wire [(5'h10):(1'h0)] wire26;
  input wire [(4'hf):(1'h0)] wire25;
  input wire [(2'h3):(1'h0)] wire24;
  input wire [(2'h2):(1'h0)] wire23;
  wire signed [(5'h10):(1'h0)] wire47;
  wire [(4'ha):(1'h0)] wire46;
  wire [(2'h2):(1'h0)] wire45;
  wire [(4'he):(1'h0)] wire44;
  wire [(5'h10):(1'h0)] wire43;
  wire [(2'h2):(1'h0)] wire33;
  wire [(5'h15):(1'h0)] wire32;
  wire signed [(3'h5):(1'h0)] wire31;
  wire signed [(4'hf):(1'h0)] wire30;
  wire signed [(4'hc):(1'h0)] wire29;
  wire signed [(4'ha):(1'h0)] wire28;
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  reg [(5'h14):(1'h0)] reg41 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  reg [(2'h2):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire28 = ($signed(wire25) ?
                      {((wire26 ? wire26 : $signed(wire26)) ?
                              ($unsigned(wire26) >> (wire24 + wire27)) : $unsigned((wire24 ?
                                  (8'haa) : wire25)))} : $unsigned(wire26[(3'h6):(1'h1)]));
  assign wire29 = wire28[(3'h7):(2'h2)];
  assign wire30 = $unsigned($signed($unsigned({{wire29}})));
  assign wire31 = wire27[(3'h4):(1'h0)];
  assign wire32 = (~|(!$unsigned((^~$signed(wire30)))));
  assign wire33 = wire29[(3'h4):(2'h2)];
  always
    @(posedge clk) begin
      if (wire32)
        begin
          reg34 <= $signed((wire30[(4'he):(4'hb)] || $signed($signed({wire27}))));
          reg35 <= wire31;
          reg36 <= $signed((^wire30[(4'he):(2'h3)]));
        end
      else
        begin
          reg34 <= $unsigned((~&((reg34 ?
              {(8'ha4), wire31} : (~|wire28)) || $signed($signed(wire26)))));
          reg35 <= ((^~$unsigned((~|$signed(wire26)))) ?
              (^~$unsigned($signed(wire27[(1'h0):(1'h0)]))) : (wire25 ?
                  $unsigned(($signed(wire32) ?
                      $unsigned((8'hab)) : $unsigned(wire25))) : (wire32[(5'h12):(4'hd)] != ((^wire29) ?
                      (&wire31) : (~&wire26)))));
          if (wire26[(4'hd):(1'h1)])
            begin
              reg36 <= (8'hb9);
              reg37 <= ((~^$unsigned((-(!wire27)))) + (~$signed(wire28[(1'h1):(1'h0)])));
              reg38 <= wire28[(2'h3):(2'h3)];
            end
          else
            begin
              reg36 <= $signed($signed($unsigned($signed((wire29 >> reg36)))));
              reg37 <= (!$signed(((((8'ha2) <<< wire33) == (wire31 ?
                  wire23 : (8'ha5))) * $signed((|reg34)))));
              reg38 <= $unsigned((&(((wire29 >> wire24) ?
                  ((8'hac) == wire33) : {wire33, wire30}) <= ((+wire31) ?
                  (wire31 <<< (8'ha5)) : $signed(wire27)))));
            end
          reg39 <= ((8'ha0) == reg36[(4'ha):(3'h4)]);
        end
      reg40 <= wire24;
      reg41 <= (^~(^wire31));
      if ((&$signed((wire27 <<< (wire28[(3'h6):(3'h4)] >= wire25[(4'hd):(2'h2)])))))
        begin
          reg42 <= (!((($unsigned(reg40) ?
                  {wire28} : (reg41 ? wire25 : reg37)) >>> {(8'h9f)}) ?
              (reg37 >= reg38[(2'h2):(1'h0)]) : wire25[(4'hc):(3'h5)]));
        end
      else
        begin
          reg42 <= (~$signed($signed($signed({(8'ha0), (8'hb5)}))));
        end
    end
  assign wire43 = $signed(wire26[(4'hd):(4'hb)]);
  assign wire44 = (8'h9e);
  assign wire45 = reg39[(1'h0):(1'h0)];
  assign wire46 = $unsigned((wire29[(3'h7):(1'h1)] ^ wire23));
  assign wire47 = wire45;
endmodule

module module128  (y, clk, wire133, wire132, wire131, wire130, wire129);
  output wire [(32'h1bb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire133;
  input wire signed [(4'hb):(1'h0)] wire132;
  input wire [(4'hd):(1'h0)] wire131;
  input wire [(5'h11):(1'h0)] wire130;
  input wire signed [(5'h11):(1'h0)] wire129;
  wire signed [(3'h5):(1'h0)] wire173;
  wire [(2'h2):(1'h0)] wire172;
  wire [(3'h5):(1'h0)] wire171;
  wire signed [(3'h4):(1'h0)] wire170;
  wire [(5'h11):(1'h0)] wire169;
  wire signed [(4'hd):(1'h0)] wire168;
  wire signed [(5'h10):(1'h0)] wire167;
  wire signed [(4'hb):(1'h0)] wire164;
  wire [(5'h14):(1'h0)] wire163;
  wire [(5'h12):(1'h0)] wire162;
  wire signed [(5'h13):(1'h0)] wire161;
  wire signed [(5'h13):(1'h0)] wire160;
  wire [(4'hb):(1'h0)] wire159;
  wire signed [(5'h14):(1'h0)] wire154;
  wire signed [(5'h15):(1'h0)] wire153;
  wire signed [(4'ha):(1'h0)] wire134;
  reg [(3'h5):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg165 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg157 = (1'h0);
  reg [(2'h3):(1'h0)] reg156 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg155 = (1'h0);
  reg [(4'hc):(1'h0)] reg152 = (1'h0);
  reg [(4'hc):(1'h0)] reg151 = (1'h0);
  reg [(5'h10):(1'h0)] reg150 = (1'h0);
  reg [(3'h5):(1'h0)] reg149 = (1'h0);
  reg [(4'h9):(1'h0)] reg148 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg145 = (1'h0);
  reg [(3'h5):(1'h0)] reg144 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg143 = (1'h0);
  reg [(2'h3):(1'h0)] reg142 = (1'h0);
  reg [(4'hf):(1'h0)] reg141 = (1'h0);
  reg [(2'h2):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg137 = (1'h0);
  reg [(2'h2):(1'h0)] reg136 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg135 = (1'h0);
  assign y = {wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire154,
                 wire153,
                 wire134,
                 reg166,
                 reg165,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg152,
                 reg151,
                 reg150,
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
                 (1'h0)};
  assign wire134 = ({wire133} == wire130);
  always
    @(posedge clk) begin
      reg135 <= $signed($signed((wire133 + {(&wire134),
          wire132[(1'h1):(1'h1)]})));
      if ((($signed($unsigned($unsigned((8'ha9)))) ?
          (~({wire134} & wire130[(1'h1):(1'h1)])) : (wire132[(2'h2):(1'h0)] ?
              ((wire134 & wire130) ^ $signed(wire131)) : $signed($signed((8'ha5))))) ~^ $signed((((wire129 ?
              wire134 : wire130) ?
          (wire131 <<< wire134) : $signed(wire132)) * wire132))))
        begin
          if ((wire134 ?
              $signed(($unsigned(wire133) ?
                  $signed($signed(wire133)) : $signed((wire133 && wire134)))) : $signed((-(|(7'h41))))))
            begin
              reg136 <= wire130[(1'h0):(1'h0)];
              reg137 <= ($signed((&(~&(wire133 <<< wire134)))) ?
                  (8'h9e) : (wire131 ?
                      ((~(|wire130)) ?
                          (~^(wire130 << reg136)) : {wire129}) : wire130[(1'h1):(1'h1)]));
              reg138 <= ((!$signed($signed({wire132,
                  (7'h43)}))) ^~ (!(($unsigned(wire133) - (wire129 ?
                      wire130 : wire130)) ?
                  wire131[(3'h4):(2'h2)] : $signed((wire133 ?
                      wire133 : reg137)))));
              reg139 <= reg136[(1'h1):(1'h1)];
            end
          else
            begin
              reg136 <= (reg135 - wire130);
              reg137 <= reg138;
            end
          if ((&wire129))
            begin
              reg140 <= $signed(wire134[(3'h4):(1'h1)]);
              reg141 <= $signed($unsigned((~&reg138[(2'h2):(1'h0)])));
              reg142 <= $signed((~|($signed((reg137 || reg140)) << {(wire133 ?
                      reg137 : wire134),
                  {wire133, wire132}})));
              reg143 <= reg137[(4'hb):(3'h4)];
            end
          else
            begin
              reg140 <= reg135;
              reg141 <= $signed({reg136});
              reg142 <= $signed(wire132);
              reg143 <= reg141[(3'h5):(1'h0)];
              reg144 <= $unsigned(reg136);
            end
          reg145 <= {(reg136 <= reg138)};
          if ((8'hb9))
            begin
              reg146 <= (+$signed(wire129[(4'hd):(4'h9)]));
              reg147 <= wire130[(5'h10):(3'h4)];
            end
          else
            begin
              reg146 <= reg135;
              reg147 <= ((~{((reg139 ? reg137 : wire131) >>> (wire129 ?
                          (8'hb9) : reg145)),
                      $signed(reg144[(1'h1):(1'h0)])}) ?
                  (^$unsigned(reg143[(1'h0):(1'h0)])) : (wire130[(2'h3):(1'h0)] ?
                      wire131 : reg145));
              reg148 <= (-($unsigned({{wire134, (7'h43)},
                  (reg138 ? reg137 : (8'hae))}) <= wire132[(2'h2):(1'h0)]));
              reg149 <= (reg144 ?
                  (-{$signed(wire134),
                      ((reg148 + wire130) ?
                          wire133[(3'h5):(1'h0)] : reg142[(1'h1):(1'h1)])}) : reg141[(4'ha):(4'h8)]);
              reg150 <= $unsigned(reg145);
            end
        end
      else
        begin
          reg136 <= reg139[(1'h0):(1'h0)];
          reg137 <= reg141[(4'h9):(2'h3)];
        end
      reg151 <= wire132[(1'h0):(1'h0)];
      reg152 <= ($signed(wire132) ^~ $signed((+(-(^(8'hb4))))));
    end
  assign wire153 = $unsigned(((!$unsigned(reg152[(4'hc):(4'h9)])) + $signed((reg144[(1'h0):(1'h0)] ?
                       $signed(reg138) : (wire131 ? wire134 : reg150)))));
  assign wire154 = (((8'h9e) ? (8'h9d) : $signed(reg149)) ? (7'h43) : (8'hb1));
  always
    @(posedge clk) begin
      reg155 <= ({$signed(((reg137 <= reg152) ?
                  (reg137 ? wire134 : reg145) : reg146))} ?
          (~^{$signed({reg135})}) : $unsigned((&(~&wire131))));
      reg156 <= wire153;
      reg157 <= (~|(wire154 + $signed(((wire133 << wire130) != (wire131 || (8'ha4))))));
      reg158 <= (((&({reg143} == $signed(reg151))) >= reg145) ?
          (reg141[(4'hf):(3'h4)] ?
              ($signed((wire134 || (8'hbb))) ?
                  {$unsigned(reg150), wire132} : ({reg143, wire130} ?
                      reg141 : reg152[(4'h9):(2'h3)])) : (((8'hb7) + reg151[(1'h0):(1'h0)]) < reg139)) : reg139);
    end
  assign wire159 = (~|wire132[(3'h5):(2'h3)]);
  assign wire160 = reg150;
  assign wire161 = wire131[(3'h4):(2'h2)];
  assign wire162 = {(($unsigned((reg136 >= reg140)) ?
                               (8'hbc) : $unsigned((wire129 ~^ reg155))) ?
                           wire130 : $signed(wire159[(3'h7):(1'h1)]))};
  assign wire163 = (8'hac);
  assign wire164 = wire160;
  always
    @(posedge clk) begin
      reg165 <= wire159[(3'h4):(3'h4)];
      reg166 <= $unsigned((^~wire159));
    end
  assign wire167 = wire131;
  assign wire168 = (reg143 | wire167);
  assign wire169 = $unsigned({wire168,
                       {$signed({wire163, wire167}),
                           ($unsigned((8'ha6)) ? (8'hae) : (~|(7'h44)))}});
  assign wire170 = (!({$signed({reg140, wire154})} * (^~{(^wire154)})));
  assign wire171 = $signed(($signed((reg143 << (|reg141))) ?
                       $unsigned($unsigned(reg137)) : ($signed(reg145[(1'h1):(1'h0)]) ?
                           (wire169 ?
                               $signed((8'hb1)) : {(8'h9f)}) : {$signed((8'ha8))})));
  assign wire172 = {($signed((reg138 ?
                           $unsigned(reg149) : $unsigned((8'ha3)))) || (~|$unsigned(reg142))),
                       reg138[(1'h0):(1'h0)]};
  assign wire173 = (~&(!{$signed((~&wire132))}));
endmodule

module module97
#(parameter param122 = (~|((!((8'hbf) < (^~(8'hb3)))) | ((((8'h9c) ? (7'h43) : (8'ha3)) || {(8'hb8), (7'h40)}) | {((8'ha3) && (8'hbd))}))))
(y, clk, wire102, wire101, wire100, wire99, wire98);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire102;
  input wire [(3'h4):(1'h0)] wire101;
  input wire [(4'h8):(1'h0)] wire100;
  input wire [(4'hd):(1'h0)] wire99;
  input wire signed [(2'h2):(1'h0)] wire98;
  wire [(3'h4):(1'h0)] wire121;
  wire signed [(4'hc):(1'h0)] wire120;
  wire [(2'h3):(1'h0)] wire119;
  wire [(5'h14):(1'h0)] wire118;
  wire signed [(3'h4):(1'h0)] wire117;
  wire [(4'hd):(1'h0)] wire111;
  wire signed [(4'hb):(1'h0)] wire110;
  wire [(4'h8):(1'h0)] wire109;
  wire signed [(2'h2):(1'h0)] wire108;
  wire [(4'hf):(1'h0)] wire107;
  wire signed [(2'h3):(1'h0)] wire106;
  wire [(4'h9):(1'h0)] wire105;
  wire signed [(3'h6):(1'h0)] wire104;
  wire signed [(5'h15):(1'h0)] wire103;
  reg signed [(2'h3):(1'h0)] reg116 = (1'h0);
  reg [(3'h5):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg113 = (1'h0);
  reg [(4'hf):(1'h0)] reg112 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 (1'h0)};
  assign wire103 = $signed((~&$unsigned($signed((wire99 ?
                       (7'h43) : (8'hb3))))));
  assign wire104 = wire99;
  assign wire105 = ($unsigned(wire100[(3'h7):(3'h6)]) ?
                       (7'h42) : ({$unsigned((~^wire98))} ?
                           (wire104 << $signed($unsigned(wire99))) : wire98[(2'h2):(2'h2)]));
  assign wire106 = (($signed(({wire102, wire105} ?
                               $unsigned(wire103) : wire101[(2'h3):(2'h3)])) ?
                           $unsigned($signed($signed(wire100))) : wire100[(2'h3):(2'h2)]) ?
                       wire99[(4'hb):(2'h3)] : $unsigned((^(wire102[(3'h7):(2'h3)] ?
                           (wire101 <= wire99) : ((8'hbc) ?
                               wire103 : wire100)))));
  assign wire107 = ((wire99 ^~ wire102[(4'hb):(1'h1)]) ^~ (~|(wire102[(4'h8):(3'h7)] ?
                       $unsigned(((7'h44) ? wire99 : wire98)) : wire103)));
  assign wire108 = $unsigned($unsigned(((~|$signed(wire103)) ?
                       (wire107[(4'ha):(1'h1)] ^ wire106) : {(+wire99)})));
  assign wire109 = wire105[(2'h3):(1'h1)];
  assign wire110 = $unsigned(wire107[(4'hc):(3'h7)]);
  assign wire111 = (+(wire106[(2'h3):(1'h0)] ?
                       wire107[(4'h9):(1'h1)] : $unsigned(wire106)));
  always
    @(posedge clk) begin
      if (wire107[(4'ha):(2'h2)])
        begin
          reg112 <= ((~^wire111) ?
              $unsigned((|(7'h43))) : (($unsigned((wire104 >>> wire111)) < (-(wire101 == wire107))) >> $signed($signed((wire111 > wire111)))));
          reg113 <= (8'hbc);
        end
      else
        begin
          reg112 <= {(&($unsigned(wire107[(4'hc):(2'h2)]) + $unsigned({wire104})))};
          reg113 <= {((^$signed(wire106)) ?
                  ((wire107[(4'h9):(2'h2)] ^~ (wire110 & reg113)) >>> {wire107,
                      (wire100 == wire98)}) : (reg113[(3'h6):(3'h6)] >> ({wire103} ?
                      {(8'h9e), (8'hba)} : wire107)))};
          reg114 <= ((8'hae) != ((wire104[(1'h1):(1'h0)] - (((7'h43) >> wire98) & wire111[(4'h8):(1'h0)])) | reg112[(4'h9):(4'h8)]));
          reg115 <= (!$signed((wire105 || (((8'hab) >= wire105) ?
              $unsigned(wire98) : wire109))));
        end
      reg116 <= (wire107[(1'h1):(1'h0)] ~^ (~|$signed(wire110[(4'ha):(4'h9)])));
    end
  assign wire117 = $unsigned((~|wire102));
  assign wire118 = (((|wire107[(4'hf):(4'h8)]) ?
                           $unsigned((-wire102)) : reg116[(1'h0):(1'h0)]) ?
                       $unsigned(reg115) : (&{$signed($unsigned(wire101))}));
  assign wire119 = $unsigned(wire98);
  assign wire120 = ({$signed({(wire111 ? wire111 : wire104),
                               (wire117 ? wire102 : wire100)}),
                           wire109[(1'h1):(1'h0)]} ?
                       {(^~wire98),
                           ((8'hb1) ?
                               wire119 : (wire102 ^~ (reg114 ?
                                   reg112 : wire99)))} : wire108);
  assign wire121 = wire118[(2'h3):(2'h2)];
endmodule

module module65
#(parameter param92 = ((((((8'ha1) ? (8'haf) : (8'ha1)) ? ((8'hb4) ? (8'hb9) : (8'hb3)) : (~(8'ha1))) < (((8'hb1) ? (8'ha4) : (8'hb3)) ^~ (^~(8'hb8)))) ? (~^(((8'hb4) ? (8'hba) : (8'ha2)) ? ((8'ha8) << (8'h9c)) : ((8'h9c) ? (8'hb0) : (8'hb4)))) : (-(((8'hb6) ? (8'hbd) : (8'ha1)) ? ((8'h9f) + (8'haf)) : (&(8'hb9))))) & {((^((8'hbc) || (8'hae))) | (((8'hb8) ? (8'ha4) : (8'ha2)) ? ((8'ha6) || (8'hb7)) : {(8'ha1), (8'hb1)})), ((((8'h9d) ? (8'hb0) : (8'ha6)) <<< {(8'hb6), (8'hb4)}) <= (~^(-(8'hbc))))}), 
parameter param93 = ((~^(!{param92, (8'hb9)})) ? {(8'hb3)} : ((8'ha5) - ((~^(param92 ^~ (8'hb5))) ? param92 : ((param92 ? (7'h43) : param92) != ((8'h9f) ? (8'hb8) : param92))))))
(y, clk, wire69, wire68, wire67, wire66);
  output wire [(32'h108):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire69;
  input wire [(4'hc):(1'h0)] wire68;
  input wire signed [(5'h14):(1'h0)] wire67;
  input wire signed [(4'h8):(1'h0)] wire66;
  wire [(5'h13):(1'h0)] wire91;
  wire signed [(4'he):(1'h0)] wire75;
  wire signed [(5'h11):(1'h0)] wire74;
  wire signed [(3'h4):(1'h0)] wire73;
  wire signed [(3'h7):(1'h0)] wire72;
  wire signed [(4'hd):(1'h0)] wire71;
  wire signed [(2'h2):(1'h0)] wire70;
  reg signed [(5'h15):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg89 = (1'h0);
  reg [(5'h10):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg87 = (1'h0);
  reg [(4'h8):(1'h0)] reg86 = (1'h0);
  reg [(4'hd):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg83 = (1'h0);
  reg [(4'hb):(1'h0)] reg82 = (1'h0);
  reg [(4'h9):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg80 = (1'h0);
  reg [(3'h4):(1'h0)] reg79 = (1'h0);
  reg [(5'h12):(1'h0)] reg78 = (1'h0);
  reg [(3'h6):(1'h0)] reg77 = (1'h0);
  reg [(5'h12):(1'h0)] reg76 = (1'h0);
  assign y = {wire91,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 reg90,
                 reg89,
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
                 reg76,
                 (1'h0)};
  assign wire70 = ((8'ha0) ?
                      $unsigned($signed((^~{wire66}))) : $signed($signed(wire67[(5'h13):(1'h0)])));
  assign wire71 = (7'h44);
  assign wire72 = wire69[(3'h6):(2'h2)];
  assign wire73 = $unsigned(wire69[(3'h5):(1'h1)]);
  assign wire74 = $signed($signed($signed(wire66)));
  assign wire75 = wire67;
  always
    @(posedge clk) begin
      if ($unsigned((wire67 ?
          wire67[(5'h12):(4'hb)] : $unsigned($signed($signed(wire75))))))
        begin
          reg76 <= $unsigned((($unsigned((wire74 >> wire66)) ?
              ((wire67 ~^ wire68) ?
                  (+wire75) : (!(8'ha5))) : {wire70[(1'h0):(1'h0)]}) <= $signed($signed((wire68 << wire74)))));
          reg77 <= (wire69[(3'h7):(1'h0)] ?
              (((wire69[(4'h8):(3'h5)] ?
                          ((8'hb3) && (8'hae)) : wire68[(1'h1):(1'h1)]) ?
                      $signed((~&wire68)) : ($unsigned(wire75) ~^ (+wire73))) ?
                  $signed(wire68[(4'ha):(4'h8)]) : (+$unsigned(((7'h42) < (8'hb0))))) : {{{((8'ha7) || wire71)},
                      $signed($unsigned(wire73))},
                  {$unsigned(wire70[(1'h1):(1'h1)]), wire69}});
        end
      else
        begin
          if (((~^($signed((wire69 ? wire70 : wire74)) ?
              wire71[(1'h0):(1'h0)] : wire74[(4'ha):(2'h2)])) + {($signed(wire75[(3'h7):(3'h7)]) & $signed({wire71})),
              $unsigned($signed((reg76 ? wire74 : reg76)))}))
            begin
              reg76 <= (7'h44);
            end
          else
            begin
              reg76 <= (+$unsigned(($unsigned($signed(wire69)) ?
                  ($signed(wire72) ? (wire71 >>> wire74) : {wire68}) : reg77)));
              reg77 <= $unsigned(((wire69[(4'hf):(4'h9)] << ($unsigned(wire68) ?
                  (wire66 ?
                      wire67 : wire67) : (wire71 > (8'had)))) >= wire71[(1'h1):(1'h0)]));
              reg78 <= (wire75 ?
                  (8'h9d) : {(($signed((8'hb7)) != (8'haf)) ?
                          wire70 : wire70)});
              reg79 <= {wire69[(3'h5):(3'h4)],
                  (-(~|$unsigned($signed(reg77))))};
              reg80 <= (wire74 ?
                  {wire72} : {($unsigned($unsigned(reg79)) ?
                          $unsigned((!wire67)) : $signed((reg77 ^~ wire70)))});
            end
          reg81 <= (^{{reg79, {$signed(wire72)}},
              ($unsigned(reg76) > reg77[(2'h2):(2'h2)])});
          if (((|(wire66[(3'h4):(1'h0)] + reg76)) ?
              ($unsigned((+reg79)) ?
                  $unsigned(((reg81 ? (7'h42) : wire66) ?
                      (reg81 ~^ wire66) : (wire74 << (8'hbb)))) : $signed($signed((^wire74)))) : {$signed((~$unsigned(reg76)))}))
            begin
              reg82 <= reg77[(2'h3):(2'h2)];
              reg83 <= {reg79[(3'h4):(1'h0)]};
              reg84 <= {$signed((~^wire66[(4'h8):(2'h2)]))};
              reg85 <= {reg76,
                  (wire66[(3'h7):(3'h5)] ?
                      reg80[(3'h6):(3'h4)] : ((&$unsigned(reg84)) >> ((wire73 ?
                              wire67 : reg76) ?
                          reg83[(4'he):(1'h1)] : (reg79 ? wire69 : wire67))))};
            end
          else
            begin
              reg82 <= ({$signed((reg82 | $signed(wire73)))} * (^((wire72[(1'h1):(1'h1)] ?
                      (~reg85) : wire67[(4'h9):(3'h4)]) ?
                  {$unsigned(wire71), (^~reg80)} : wire71[(2'h2):(2'h2)])));
              reg83 <= $unsigned(reg84[(2'h2):(1'h0)]);
            end
          if ((~|(^~({(^~(8'hbf)), $signed(wire75)} ?
              (reg82[(3'h4):(1'h0)] >>> (~^wire69)) : wire75))))
            begin
              reg86 <= reg85;
            end
          else
            begin
              reg86 <= {wire67};
              reg87 <= reg82[(4'h8):(3'h7)];
              reg88 <= ({((wire74[(4'hc):(2'h2)] != (wire75 ?
                              wire69 : (8'hbd))) ?
                          $unsigned((reg85 ? (8'haf) : reg82)) : wire67)} ?
                  (~^reg76) : ({((reg80 ? reg83 : reg81) ?
                              reg86[(3'h5):(3'h5)] : $unsigned(wire69))} ?
                      wire73[(2'h3):(1'h1)] : wire75[(3'h7):(2'h2)]));
            end
        end
      reg89 <= ($unsigned($signed(reg76[(4'ha):(4'h9)])) ^~ (|(+(&reg80))));
      reg90 <= $signed((8'ha4));
    end
  assign wire91 = {$unsigned(reg84[(2'h2):(1'h0)])};
endmodule
