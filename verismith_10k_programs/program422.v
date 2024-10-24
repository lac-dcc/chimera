module top
#(parameter param220 = {{{(~&((8'hbd) ? (8'hba) : (8'hb9)))}, (~|(((8'haa) - (8'ha9)) ? ((8'hbf) > (8'ha8)) : ((8'haa) >> (7'h44))))}}, 
parameter param221 = {(param220 ? ({param220} != ((param220 ? (8'hab) : param220) ? param220 : ((8'hb1) ? param220 : (8'ha1)))) : ((param220 >>> (param220 && param220)) << param220))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire219;
  wire signed [(5'h10):(1'h0)] wire218;
  wire [(4'ha):(1'h0)] wire217;
  wire signed [(4'h9):(1'h0)] wire216;
  wire [(3'h6):(1'h0)] wire215;
  wire signed [(5'h11):(1'h0)] wire213;
  wire signed [(5'h11):(1'h0)] wire165;
  wire signed [(4'hc):(1'h0)] wire124;
  wire signed [(5'h12):(1'h0)] wire123;
  wire [(3'h7):(1'h0)] wire121;
  wire [(5'h13):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire4;
  assign y = {wire219,
                 wire218,
                 wire217,
                 wire216,
                 wire215,
                 wire213,
                 wire165,
                 wire124,
                 wire123,
                 wire121,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = $signed($signed((((|wire2) ?
                         $signed(wire1) : (wire2 ? wire2 : wire1)) ?
                     ($signed(wire0) <= $signed(wire2)) : $signed($signed(wire1)))));
  assign wire5 = $unsigned((wire0[(4'h8):(3'h5)] ?
                     $signed($signed($signed(wire0))) : {({wire4} ?
                             $unsigned(wire0) : $signed(wire0)),
                         wire4}));
  assign wire6 = {$unsigned(wire4)};
  assign wire7 = wire0;
  module8 #() modinst122 (.clk(clk), .wire9(wire6), .wire10(wire2), .wire11(wire1), .y(wire121), .wire12(wire7));
  assign wire123 = ($signed(wire0) || (&(~|(~(^wire4)))));
  assign wire124 = $signed({((~(~|wire7)) ?
                           wire121[(3'h6):(3'h4)] : ($signed(wire5) >= wire5[(1'h1):(1'h0)])),
                       ((~^$signed(wire6)) ?
                           ((&wire6) ?
                               (wire2 ?
                                   wire3 : wire6) : ((8'ha1) >>> wire4)) : {(wire4 >>> wire3),
                               (&wire0)})});
  module125 #() modinst166 (wire165, clk, wire123, wire0, wire5, wire2);
  module167 #() modinst214 (.wire168(wire123), .clk(clk), .wire171(wire2), .wire169(wire0), .y(wire213), .wire170(wire6));
  assign wire215 = ((wire1[(3'h5):(1'h0)] || wire3) ?
                       {(!(+$signed(wire5))),
                           {(8'hb6),
                               $signed((~wire5))}} : $unsigned(wire165[(1'h1):(1'h0)]));
  assign wire216 = wire3[(2'h3):(1'h0)];
  assign wire217 = $unsigned(($unsigned($unsigned((wire165 == wire3))) ?
                       (~^$unsigned((+wire4))) : (~^(((8'ha8) ?
                           (8'hb2) : wire1) - wire1))));
  assign wire218 = (~&((~$signed(wire165)) ?
                       $signed(wire124[(1'h0):(1'h0)]) : (!wire4)));
  assign wire219 = $signed(((wire213[(1'h0):(1'h0)] >>> (((8'h9e) ?
                           wire215 : wire123) <<< $signed(wire5))) ?
                       (-((wire216 == wire217) & (wire213 ?
                           wire215 : wire2))) : wire0));
endmodule

module module167
#(parameter param212 = (!(8'hab)))
(y, clk, wire168, wire169, wire170, wire171);
  output wire [(32'h12c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire168;
  input wire [(4'he):(1'h0)] wire169;
  input wire signed [(5'h14):(1'h0)] wire170;
  input wire [(5'h12):(1'h0)] wire171;
  wire signed [(3'h7):(1'h0)] wire210;
  wire signed [(4'hc):(1'h0)] wire172;
  wire signed [(5'h10):(1'h0)] wire173;
  wire [(4'h9):(1'h0)] wire174;
  wire signed [(3'h7):(1'h0)] wire176;
  wire signed [(4'he):(1'h0)] wire181;
  wire signed [(5'h15):(1'h0)] wire198;
  reg [(5'h14):(1'h0)] reg211 = (1'h0);
  reg [(5'h11):(1'h0)] reg209 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg208 = (1'h0);
  reg [(4'he):(1'h0)] reg207 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg206 = (1'h0);
  reg [(4'he):(1'h0)] reg205 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg204 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg203 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg202 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg201 = (1'h0);
  reg [(3'h6):(1'h0)] reg200 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg175 = (1'h0);
  reg [(5'h10):(1'h0)] reg177 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg178 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg179 = (1'h0);
  reg [(3'h6):(1'h0)] reg180 = (1'h0);
  assign y = {wire210,
                 wire172,
                 wire173,
                 wire174,
                 wire176,
                 wire181,
                 wire198,
                 reg211,
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
                 reg175,
                 reg177,
                 reg178,
                 reg179,
                 reg180,
                 (1'h0)};
  assign wire172 = wire168[(5'h12):(4'h8)];
  assign wire173 = (wire172[(1'h0):(1'h0)] ^ (!$signed(((wire169 ?
                       wire169 : wire168) << (wire168 >= wire172)))));
  assign wire174 = $signed((~&(~|wire169[(4'hb):(4'h8)])));
  always
    @(posedge clk) begin
      reg175 <= $signed($unsigned($unsigned(((~wire173) ?
          (!wire174) : wire171))));
    end
  assign wire176 = wire170[(5'h10):(1'h0)];
  always
    @(posedge clk) begin
      reg177 <= (8'hae);
      reg178 <= ((wire176 ? (-{wire170}) : (+$signed((wire168 < (8'hb7))))) ?
          $signed(wire169[(2'h2):(1'h1)]) : reg177[(3'h7):(3'h7)]);
      reg179 <= (8'h9e);
      reg180 <= $signed({$unsigned(($signed(reg175) || $unsigned(reg179))),
          {wire169[(4'hd):(4'hb)]}});
    end
  assign wire181 = ($signed($unsigned($signed($signed(reg175)))) ?
                       reg175 : reg175);
  module182 #() modinst199 (wire198, clk, wire168, wire171, wire181, reg178);
  always
    @(posedge clk) begin
      reg200 <= (reg175[(2'h2):(2'h2)] >>> wire171);
      if (((~|wire174[(3'h6):(3'h5)]) || {$unsigned(({reg175,
              reg178} | $signed(reg179)))}))
        begin
          reg201 <= $unsigned(((8'hb0) > wire168[(2'h2):(1'h1)]));
          reg202 <= $signed((8'hbc));
          reg203 <= ((wire176 ?
              {($signed(wire198) >> $signed((7'h40))),
                  wire172[(4'h8):(3'h5)]} : (~($signed(reg200) ?
                  (wire176 ?
                      wire168 : (8'ha6)) : (!reg201)))) || (wire198[(4'h8):(2'h2)] << {$unsigned((wire174 ?
                  reg179 : wire181))}));
          if ($signed((~^(reg200[(2'h3):(1'h1)] ?
              (wire169[(2'h3):(2'h3)] || (^reg179)) : $unsigned(reg177[(3'h4):(1'h1)])))))
            begin
              reg204 <= $signed($signed($unsigned($unsigned($signed(wire198)))));
              reg205 <= reg178;
            end
          else
            begin
              reg204 <= ($unsigned((reg179[(4'ha):(4'h8)] ?
                  ((+reg203) ?
                      (^reg202) : {reg177,
                          (8'hb1)}) : ((|wire174) >> (reg175 & (8'hbe))))) >>> wire198[(4'h8):(3'h5)]);
              reg205 <= wire168;
              reg206 <= (~^$unsigned((~reg205[(3'h4):(3'h4)])));
            end
          reg207 <= (($unsigned(wire176[(3'h6):(1'h0)]) ^~ $signed($unsigned((wire198 ?
                  wire181 : reg180)))) ?
              (!reg177[(4'h9):(3'h7)]) : {wire181});
        end
      else
        begin
          reg201 <= wire170[(4'hc):(3'h6)];
          reg202 <= $signed($signed(reg180[(2'h2):(2'h2)]));
          reg203 <= ($unsigned(reg202[(2'h2):(2'h2)]) ?
              $signed((&reg206)) : (^$unsigned(reg207)));
        end
      reg208 <= $unsigned(reg203[(3'h7):(2'h2)]);
      reg209 <= $signed(wire173);
    end
  assign wire210 = {(~&(^reg207))};
  always
    @(posedge clk) begin
      reg211 <= $signed(reg177);
    end
endmodule

module module125
#(parameter param163 = (+({{{(7'h41), (8'haf)}, ((8'haf) >= (8'haf))}, (!((7'h43) ? (8'hb7) : (8'hbb)))} < (((^~(8'hbe)) ? (~|(8'ha1)) : (^~(8'hbd))) - (8'had)))), 
parameter param164 = ((~^{((param163 * (8'hb9)) > (~|param163))}) & (({param163, (param163 >>> param163)} ~^ ((param163 ? param163 : param163) ? param163 : ((8'hac) <<< param163))) + ((((8'ha7) && param163) ? (param163 < param163) : (param163 ? param163 : param163)) ? {param163, param163} : (8'hbd)))))
(y, clk, wire129, wire128, wire127, wire126);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire129;
  input wire signed [(5'h13):(1'h0)] wire128;
  input wire [(5'h14):(1'h0)] wire127;
  input wire [(5'h12):(1'h0)] wire126;
  wire signed [(5'h10):(1'h0)] wire162;
  wire signed [(5'h15):(1'h0)] wire161;
  wire signed [(4'hb):(1'h0)] wire160;
  wire signed [(4'he):(1'h0)] wire158;
  wire signed [(4'he):(1'h0)] wire136;
  wire [(3'h6):(1'h0)] wire135;
  wire signed [(5'h12):(1'h0)] wire134;
  wire [(5'h12):(1'h0)] wire133;
  wire signed [(4'hd):(1'h0)] wire130;
  reg [(3'h4):(1'h0)] reg132 = (1'h0);
  reg [(5'h15):(1'h0)] reg131 = (1'h0);
  assign y = {wire162,
                 wire161,
                 wire160,
                 wire158,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire130,
                 reg132,
                 reg131,
                 (1'h0)};
  assign wire130 = (~^$signed((wire126 ?
                       wire128 : ((~&(8'hba)) ?
                           ((8'hb7) == wire127) : wire127[(5'h14):(2'h2)]))));
  always
    @(posedge clk) begin
      reg131 <= ((~wire126) | ((wire127[(3'h7):(2'h2)] != {(wire127 ?
              (8'had) : wire129),
          {wire126, wire130}}) && (((wire128 ? (8'hbc) : wire130) ?
              wire127[(4'he):(4'hb)] : $signed(wire126)) ?
          ((wire130 ?
              wire130 : (8'hb5)) ~^ wire128) : $unsigned($unsigned((8'hb3))))));
      reg132 <= $unsigned(wire129[(1'h1):(1'h1)]);
    end
  assign wire133 = ((~&$signed($unsigned({reg132}))) <= wire128[(2'h3):(1'h0)]);
  assign wire134 = ({(+($unsigned(reg131) ?
                           wire130[(2'h2):(1'h0)] : {wire128})),
                       {wire126[(1'h1):(1'h1)]}} & $signed(wire128[(3'h6):(2'h2)]));
  assign wire135 = (~(reg132[(1'h0):(1'h0)] >> {($signed(wire133) ?
                           (wire133 ? (8'ha3) : (8'h9c)) : wire127),
                       {(wire128 ? wire129 : wire129)}}));
  assign wire136 = $signed($unsigned((reg131 ?
                       wire129[(1'h0):(1'h0)] : wire135[(2'h3):(1'h1)])));
  module137 #() modinst159 (.wire140(wire129), .clk(clk), .wire139(wire134), .y(wire158), .wire141(wire126), .wire138(wire135));
  assign wire160 = $signed($unsigned(wire133));
  assign wire161 = wire127[(4'hf):(2'h3)];
  assign wire162 = ((-wire130[(4'h8):(3'h5)]) > {({{wire133, wire126}} ?
                           {wire134, wire136} : $unsigned({wire133,
                               wire158}))});
endmodule

module module8
#(parameter param119 = (((&(~&(~&(8'ha9)))) == ((|(8'hb3)) | ({(8'hb2)} >>> {(8'hbf), (8'hb5)}))) ? {(8'ha8), (-(((8'hb9) ? (8'hb7) : (7'h44)) ? {(8'h9d), (8'ha5)} : (+(8'ha5))))} : (~(({(8'hbf)} * {(8'hba), (8'ha9)}) ? (~&((8'hb5) ? (8'hb9) : (7'h44))) : ((+(8'hbe)) >> {(8'ha1), (7'h43)})))), 
parameter param120 = param119)
(y, clk, wire9, wire10, wire11, wire12);
  output wire [(32'h190):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire9;
  input wire signed [(5'h13):(1'h0)] wire10;
  input wire signed [(5'h12):(1'h0)] wire11;
  input wire [(5'h13):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire118;
  wire [(4'h8):(1'h0)] wire117;
  wire signed [(4'hf):(1'h0)] wire116;
  wire [(4'hd):(1'h0)] wire115;
  wire signed [(5'h15):(1'h0)] wire114;
  wire [(3'h5):(1'h0)] wire113;
  wire signed [(5'h10):(1'h0)] wire91;
  wire [(5'h10):(1'h0)] wire90;
  wire signed [(4'hb):(1'h0)] wire13;
  wire signed [(3'h7):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire16;
  wire signed [(2'h3):(1'h0)] wire88;
  reg signed [(4'hf):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg110 = (1'h0);
  reg [(5'h11):(1'h0)] reg109 = (1'h0);
  reg [(4'h9):(1'h0)] reg108 = (1'h0);
  reg [(5'h12):(1'h0)] reg107 = (1'h0);
  reg [(5'h14):(1'h0)] reg106 = (1'h0);
  reg [(2'h3):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg104 = (1'h0);
  reg [(3'h4):(1'h0)] reg103 = (1'h0);
  reg [(4'h8):(1'h0)] reg102 = (1'h0);
  reg [(4'hc):(1'h0)] reg101 = (1'h0);
  reg [(5'h10):(1'h0)] reg100 = (1'h0);
  reg [(5'h14):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg98 = (1'h0);
  reg [(4'h8):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg96 = (1'h0);
  reg [(5'h13):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg92 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire91,
                 wire90,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire88,
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
                 (1'h0)};
  assign wire13 = wire10;
  assign wire14 = ($signed(wire10) ?
                      $signed($unsigned($unsigned((wire11 ?
                          wire13 : (8'hbf))))) : (~^$unsigned(($unsigned(wire11) ?
                          ((8'ha3) != wire9) : $unsigned((8'hb8))))));
  assign wire15 = ($unsigned($unsigned((~(&wire12)))) ?
                      (wire9 ?
                          $signed($signed($unsigned(wire12))) : $unsigned(wire9)) : (($unsigned($unsigned(wire14)) ?
                              wire12[(4'ha):(2'h2)] : $signed($unsigned(wire13))) ?
                          $unsigned(wire12[(2'h3):(1'h1)]) : wire13));
  assign wire16 = $unsigned((8'haf));
  module17 #() modinst89 (.wire18(wire11), .clk(clk), .wire20(wire14), .wire19(wire9), .wire21(wire10), .y(wire88), .wire22(wire12));
  assign wire90 = (!wire12[(4'hb):(4'h9)]);
  assign wire91 = $unsigned(wire16);
  always
    @(posedge clk) begin
      if (wire91)
        begin
          reg92 <= ({wire10[(1'h0):(1'h0)], (!$signed(wire10[(3'h5):(2'h3)]))} ?
              {wire91, wire15} : (wire14[(3'h6):(3'h4)] ?
                  wire13[(1'h1):(1'h0)] : (((wire11 ?
                          wire91 : wire91) != (&(8'hb3))) ?
                      (~$unsigned(wire13)) : wire12)));
          reg93 <= $unsigned((|wire91));
          if ((|({($signed(wire14) > (&wire10)),
              wire16[(4'hc):(2'h2)]} ~^ (^$unsigned(reg93[(1'h0):(1'h0)])))))
            begin
              reg94 <= wire91;
              reg95 <= $unsigned(reg94[(1'h1):(1'h1)]);
              reg96 <= (+reg94[(1'h0):(1'h0)]);
              reg97 <= reg95;
            end
          else
            begin
              reg94 <= (~|$unsigned({reg96[(4'h8):(3'h7)]}));
              reg95 <= $unsigned({$unsigned((8'hb3))});
              reg96 <= $signed($unsigned(({(&reg97),
                      (wire12 ? (8'hb3) : wire16)} ?
                  $signed($unsigned((8'hae))) : $unsigned($signed(reg92)))));
            end
        end
      else
        begin
          reg92 <= (^~wire12);
          reg93 <= wire91[(4'hb):(3'h4)];
          reg94 <= $unsigned(wire88);
        end
      if (wire91)
        begin
          reg98 <= ($signed((($signed(wire16) > (reg92 ?
                  reg93 : wire9)) == (reg96[(2'h3):(2'h3)] ~^ $signed(wire10)))) ?
              $unsigned(reg97) : $unsigned(((wire91[(5'h10):(1'h0)] > (wire9 == wire90)) + wire15)));
          reg99 <= $signed(wire10);
        end
      else
        begin
          reg98 <= $unsigned((|(wire91[(2'h2):(2'h2)] ?
              (&{reg95}) : $signed(wire9))));
          if ((|($signed((^~reg95[(1'h0):(1'h0)])) ?
              {(~&$unsigned(wire88)),
                  (&(wire11 ?
                      reg95 : wire88))} : $signed($signed((wire13 >= reg98))))))
            begin
              reg99 <= wire9;
              reg100 <= (+$signed(wire10));
              reg101 <= ((((^~reg96) ?
                          ((~&(8'had)) <<< ((7'h41) ?
                              reg98 : wire15)) : $unsigned(wire12[(4'h8):(3'h7)])) ?
                      {$signed((reg98 <= reg92)),
                          (wire15[(5'h11):(4'hc)] | (|reg97))} : (8'h9e)) ?
                  $signed($unsigned(reg95)) : {{(8'hae)}, (8'ha6)});
              reg102 <= ((wire9 > wire91) ?
                  {$unsigned((8'haf))} : ({$unsigned((^~wire10)),
                          reg101[(1'h1):(1'h1)]} ?
                      ((~|wire13) + $unsigned(wire14)) : $signed(($unsigned(reg99) == (wire9 ?
                          reg96 : wire14)))));
            end
          else
            begin
              reg99 <= (8'hb9);
              reg100 <= $unsigned($signed($unsigned((reg92[(2'h2):(2'h2)] ?
                  (reg93 != wire90) : wire11))));
              reg101 <= $signed((~|(reg92 & (~|reg99[(4'he):(2'h2)]))));
            end
          reg103 <= ($signed(wire90[(2'h2):(2'h2)]) ?
              $unsigned($signed(reg96)) : (~&$signed((~&(reg100 ?
                  wire9 : reg92)))));
          if ($unsigned(($signed((reg101[(3'h4):(2'h2)] ?
                  (|wire9) : wire14[(1'h1):(1'h0)])) ?
              ($signed((wire15 ? reg94 : wire12)) >= {$signed(wire91),
                  reg92}) : {(reg97 ? reg99 : (reg96 == reg101))})))
            begin
              reg104 <= $unsigned($unsigned(reg101));
              reg105 <= (($unsigned($signed(((7'h41) + reg103))) || (~&(reg92[(1'h0):(1'h0)] ?
                      reg100[(3'h4):(2'h3)] : wire9[(4'ha):(3'h6)]))) ?
                  (^~wire12[(5'h12):(3'h5)]) : $signed(wire11[(4'hb):(3'h6)]));
              reg106 <= wire90[(5'h10):(4'hc)];
            end
          else
            begin
              reg104 <= $signed(reg92);
              reg105 <= $unsigned((~|$unsigned(wire11)));
              reg106 <= wire88;
              reg107 <= (($signed($unsigned(wire90[(4'hc):(1'h0)])) >> (7'h41)) - $unsigned({{(reg98 ?
                          wire10 : wire14)},
                  wire16}));
              reg108 <= {$unsigned((((~&(8'ha4)) <<< ((8'h9e) << reg107)) ?
                      $unsigned($unsigned(wire14)) : (wire14[(3'h6):(3'h6)] ?
                          reg107[(3'h7):(3'h7)] : wire16[(3'h4):(1'h0)]))),
                  {(wire13[(3'h6):(3'h6)] || reg95[(3'h5):(1'h1)]),
                      reg106[(3'h4):(2'h2)]}};
            end
          reg109 <= (wire9 | (((reg106 ?
              wire14 : $unsigned((8'hb8))) || wire11[(4'hb):(3'h6)]) >> $signed((~&(~|reg106)))));
        end
      reg110 <= wire90;
      reg111 <= (&$signed((~^wire91[(4'hd):(4'h9)])));
      reg112 <= $unsigned($unsigned(reg92));
    end
  assign wire113 = (8'hb2);
  assign wire114 = (wire10[(5'h10):(3'h7)] > $signed((!$unsigned((~&wire12)))));
  assign wire115 = ($signed((~|$signed($signed(wire14)))) ?
                       (~^(wire9[(1'h0):(1'h0)] | wire12)) : (reg109 || ((reg101[(3'h6):(2'h3)] ?
                           $signed(wire90) : (^~reg103)) | $unsigned(reg98[(2'h3):(2'h2)]))));
  assign wire116 = $signed(reg98);
  assign wire117 = (wire13[(3'h7):(3'h6)] ?
                       ((wire15[(3'h6):(3'h6)] ?
                               (~|(reg96 && wire15)) : $unsigned(wire116)) ?
                           ((~&(wire15 + reg93)) ?
                               $unsigned(wire11[(3'h7):(3'h7)]) : (reg101[(4'hc):(4'h8)] ?
                                   (reg112 ?
                                       wire10 : reg103) : reg94)) : (wire15[(4'hd):(2'h2)] ?
                               (^(reg99 ?
                                   wire10 : reg110)) : $unsigned((!wire115)))) : $signed(wire88));
  assign wire118 = {$unsigned($unsigned($unsigned((8'hb6)))),
                       (wire88[(1'h0):(1'h0)] >> {wire90[(4'h9):(3'h7)],
                           $signed((wire10 ? reg105 : reg97))})};
endmodule

module module17
#(parameter param87 = (|(^({{(8'ha4), (8'h9d)}, ((8'hb4) - (8'hbd))} ? (&(~|(8'hbb))) : ((8'h9f) ? (|(8'hb3)) : ((8'ha5) ? (8'hb3) : (8'hb6)))))))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h2c7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire22;
  input wire [(5'h13):(1'h0)] wire21;
  input wire [(3'h7):(1'h0)] wire20;
  input wire [(4'hb):(1'h0)] wire19;
  input wire [(3'h4):(1'h0)] wire18;
  wire signed [(4'hf):(1'h0)] wire86;
  wire signed [(2'h3):(1'h0)] wire85;
  wire signed [(2'h3):(1'h0)] wire84;
  wire signed [(2'h2):(1'h0)] wire83;
  wire [(4'ha):(1'h0)] wire82;
  wire [(4'hd):(1'h0)] wire81;
  wire [(2'h3):(1'h0)] wire66;
  wire [(2'h2):(1'h0)] wire65;
  wire [(4'hc):(1'h0)] wire64;
  wire [(4'hc):(1'h0)] wire63;
  wire [(4'he):(1'h0)] wire62;
  wire [(3'h6):(1'h0)] wire61;
  wire [(4'hc):(1'h0)] wire57;
  wire signed [(3'h5):(1'h0)] wire56;
  wire signed [(4'hc):(1'h0)] wire55;
  wire [(5'h13):(1'h0)] wire54;
  wire signed [(4'h9):(1'h0)] wire50;
  wire [(5'h10):(1'h0)] wire24;
  wire signed [(2'h2):(1'h0)] wire23;
  reg signed [(2'h2):(1'h0)] reg80 = (1'h0);
  reg [(2'h3):(1'h0)] reg79 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg74 = (1'h0);
  reg [(4'h9):(1'h0)] reg73 = (1'h0);
  reg [(3'h5):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg71 = (1'h0);
  reg [(2'h2):(1'h0)] reg70 = (1'h0);
  reg [(3'h6):(1'h0)] reg69 = (1'h0);
  reg [(2'h3):(1'h0)] reg68 = (1'h0);
  reg [(5'h10):(1'h0)] reg67 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg59 = (1'h0);
  reg signed [(4'he):(1'h0)] reg58 = (1'h0);
  reg [(4'ha):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(4'hc):(1'h0)] reg49 = (1'h0);
  reg [(5'h13):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg [(3'h4):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(4'hd):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  reg [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(3'h5):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire50,
                 wire24,
                 wire23,
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
                 reg69,
                 reg68,
                 reg67,
                 reg60,
                 reg59,
                 reg58,
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
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire23 = ({wire22} && wire22[(1'h1):(1'h1)]);
  assign wire24 = (~^(~($unsigned($signed(wire18)) * {$unsigned(wire18),
                      $unsigned(wire21)})));
  always
    @(posedge clk) begin
      reg25 <= wire22[(5'h13):(5'h11)];
      if ($unsigned(((wire23[(1'h1):(1'h1)] != (reg25[(1'h1):(1'h0)] ?
          $unsigned(wire18) : reg25)) <= (wire18 ?
          ((wire23 + wire22) <<< (wire23 | wire21)) : ((wire24 <= wire20) + $signed(wire24))))))
        begin
          reg26 <= (wire24[(4'h9):(4'h8)] ? wire22[(4'h9):(3'h5)] : (~(8'h9f)));
          if ((((wire22[(3'h6):(1'h1)] ?
              $signed(wire19[(1'h0):(1'h0)]) : reg26) <= (-$signed((wire18 >= wire20)))) - wire20))
            begin
              reg27 <= (~|$unsigned($signed(reg25)));
            end
          else
            begin
              reg27 <= wire20[(2'h2):(2'h2)];
              reg28 <= ({(wire19 | wire20), wire19[(3'h6):(1'h1)]} ?
                  (reg27[(4'h8):(3'h7)] == ((^{wire21,
                      wire20}) ^~ (&(|wire23)))) : ((~^{$unsigned(reg27),
                      (wire21 & wire23)}) >>> (-{wire24[(4'he):(2'h3)]})));
            end
          reg29 <= {($unsigned(($signed(reg27) ^ (8'hbd))) >= ({$unsigned(reg28)} ?
                  wire20[(2'h2):(2'h2)] : $unsigned(reg28[(4'hc):(2'h3)])))};
        end
      else
        begin
          reg26 <= ($signed(wire20[(3'h4):(3'h4)]) ~^ wire21[(4'he):(3'h4)]);
          reg27 <= $unsigned(reg28[(3'h5):(1'h0)]);
          reg28 <= reg29;
          reg29 <= ((^{((&reg26) < (wire24 ?
                  (8'h9d) : wire21))}) & ($signed((reg29[(4'ha):(4'h8)] ?
                  ((8'ha2) & reg27) : reg27[(4'h9):(2'h3)])) ?
              (^reg26[(1'h1):(1'h1)]) : (wire21 > (~^(8'hb8)))));
          if ((((~&reg25[(4'hd):(4'hd)]) | wire24[(4'hb):(2'h2)]) * (reg27 ?
              {wire19} : (reg25[(4'hc):(2'h2)] ?
                  reg29[(1'h0):(1'h0)] : $unsigned(((8'h9d) ?
                      reg26 : wire24))))))
            begin
              reg30 <= (^~((($unsigned(wire20) & $unsigned((8'ha6))) ~^ (&(-reg28))) != {((wire22 ?
                          wire18 : wire21) ?
                      (wire21 ? wire21 : reg26) : $unsigned(reg26)),
                  (reg26 ? {wire19, reg29} : wire18)}));
            end
          else
            begin
              reg30 <= (~&((wire22[(5'h13):(5'h11)] ?
                  reg29[(5'h12):(4'hc)] : reg30[(1'h0):(1'h0)]) >>> reg27[(3'h6):(2'h3)]));
            end
        end
      reg31 <= $unsigned((8'h9f));
      if ($unsigned((~{reg25[(3'h7):(1'h0)]})))
        begin
          reg32 <= $unsigned(((((reg29 ? wire20 : wire24) || (|wire21)) ?
                  $unsigned((reg27 ? wire19 : wire21)) : (^~{wire20, wire18})) ?
              $unsigned({wire21}) : (($signed(reg30) ?
                  wire22 : reg25) - (~|reg29[(1'h0):(1'h0)]))));
          reg33 <= reg30[(3'h4):(2'h2)];
          if ($signed($unsigned(((wire21[(1'h1):(1'h1)] ?
              reg32 : ((7'h41) ? reg32 : wire19)) * {{wire23, wire21}}))))
            begin
              reg34 <= (((((wire24 != wire21) ^ {reg27,
                      reg33}) ^~ $unsigned((+reg28))) ?
                  ({(8'h9c), (~^reg26)} && ((reg31 >= reg33) ?
                      $unsigned(wire23) : $unsigned(reg28))) : $unsigned((reg30 ?
                      $signed(wire19) : $signed(reg25)))) <= (($unsigned((reg25 ?
                  reg31 : reg31)) ^~ ((wire20 < reg28) ?
                  (wire20 ?
                      wire24 : wire23) : $signed((8'hb5)))) ^ (!$signed(((7'h42) ?
                  (8'hb5) : wire23)))));
              reg35 <= $signed(((((wire24 ?
                      (8'ha2) : wire22) & (reg26 ~^ reg25)) > (((8'h9e) ?
                          reg34 : wire18) ?
                      wire18 : (8'hb1))) ?
                  ($signed($unsigned(reg26)) ?
                      $unsigned(reg28[(4'he):(4'h9)]) : $signed(reg25[(4'ha):(3'h6)])) : (reg26 ?
                      ((wire22 >>> reg31) >> (reg32 ^~ wire22)) : (~^(~|(7'h44))))));
              reg36 <= (-reg29);
              reg37 <= (reg29 ?
                  ($unsigned(reg33) ?
                      (&$signed(reg36)) : $unsigned({{reg36}})) : (~|reg25));
              reg38 <= (+((~^($unsigned(reg33) != (reg32 || wire19))) ?
                  reg37[(4'h8):(3'h4)] : (~|$signed($signed(reg30)))));
            end
          else
            begin
              reg34 <= wire19[(3'h6):(3'h5)];
              reg35 <= (|reg32[(4'h8):(1'h1)]);
              reg36 <= (~^$unsigned({{reg30, $unsigned(reg32)},
                  (~wire23[(2'h2):(1'h0)])}));
            end
        end
      else
        begin
          if (($signed(((-(!reg36)) ?
                  $signed(wire24[(1'h1):(1'h1)]) : $unsigned((&wire20)))) ?
              ((reg36[(3'h4):(2'h2)] ?
                  (8'hb1) : reg33) ^~ $unsigned($signed(wire23))) : {$signed(reg31),
                  (^{(reg26 | reg34), reg26[(3'h5):(2'h2)]})}))
            begin
              reg32 <= wire23[(1'h0):(1'h0)];
              reg33 <= $signed(wire19[(4'hb):(3'h6)]);
              reg34 <= $signed(reg31);
              reg35 <= ((-wire22[(2'h3):(2'h3)]) ?
                  wire21 : $signed(reg35[(3'h7):(3'h7)]));
            end
          else
            begin
              reg32 <= reg35[(5'h13):(4'he)];
              reg33 <= ((~wire19) ?
                  $unsigned($signed($unsigned((+reg29)))) : wire19);
              reg34 <= wire19;
              reg35 <= (~^({(~^(reg38 ? wire21 : (8'ha3)))} ?
                  $signed(((wire19 || reg38) ?
                      (wire24 || reg29) : (+reg28))) : ($unsigned(reg26[(4'he):(2'h3)]) ?
                      {reg27, (8'h9d)} : {$signed(reg34), (reg36 * reg36)})));
              reg36 <= ($unsigned(reg36[(1'h1):(1'h1)]) ?
                  reg31 : (wire23[(2'h2):(1'h0)] ?
                      reg26[(4'hd):(2'h2)] : ({$signed(reg31), reg25} ?
                          reg27 : (&{(8'ha0), reg30}))));
            end
          if ({$signed((({reg28} ?
                  (wire19 ?
                      reg30 : reg38) : reg31[(3'h5):(2'h2)]) << $signed(reg35))),
              $signed((!((-reg34) ? $unsigned(reg27) : $signed(reg29))))})
            begin
              reg37 <= {$signed((+$signed((8'hb9)))),
                  (($unsigned(reg34[(3'h6):(1'h0)]) > (~|(wire22 ~^ reg28))) != wire20)};
              reg38 <= ((|reg26[(4'hf):(3'h6)]) >>> (8'haa));
              reg39 <= $unsigned((~&reg36));
              reg40 <= $signed((($signed($signed(reg35)) - ((8'hbe) > $signed(reg32))) > reg37));
              reg41 <= reg38[(4'h8):(1'h0)];
            end
          else
            begin
              reg37 <= reg33[(3'h4):(2'h3)];
              reg38 <= $signed((8'hbb));
            end
          reg42 <= $unsigned($signed(reg38));
        end
      if ((reg30[(2'h3):(2'h3)] ?
          $signed($unsigned($unsigned({reg41,
              wire18}))) : ((($unsigned(reg41) * $unsigned(reg32)) ?
                  {(^~reg26), (wire24 == wire24)} : wire23[(1'h0):(1'h0)]) ?
              (reg42 > (~reg42)) : wire21)))
        begin
          reg43 <= wire19[(3'h4):(2'h3)];
          if ($signed(reg32))
            begin
              reg44 <= reg42[(3'h4):(1'h0)];
              reg45 <= (($unsigned({$unsigned(reg29)}) ^~ reg29) ?
                  (^~reg33[(3'h5):(2'h3)]) : wire18);
              reg46 <= $unsigned($signed(($unsigned((8'ha4)) + {(wire20 ?
                      wire23 : reg36)})));
              reg47 <= $unsigned($unsigned(reg25[(1'h1):(1'h1)]));
              reg48 <= reg45[(3'h6):(2'h3)];
            end
          else
            begin
              reg44 <= wire24;
            end
        end
      else
        begin
          if ((reg43[(4'h8):(1'h1)] > reg35[(1'h0):(1'h0)]))
            begin
              reg43 <= {($unsigned(((+reg45) ? reg28[(3'h5):(2'h3)] : reg48)) ?
                      $signed((~(~^reg33))) : ({reg26} ?
                          ($unsigned((8'hbe)) ?
                              (reg33 << reg42) : $signed(reg29)) : $signed($unsigned(reg36)))),
                  $signed({reg48[(4'ha):(1'h0)]})};
              reg44 <= $signed(reg28[(4'hd):(4'hc)]);
              reg45 <= reg30;
              reg46 <= reg42;
            end
          else
            begin
              reg43 <= (8'ha9);
              reg44 <= (!(!$signed($unsigned(((8'ha8) ? reg46 : reg25)))));
              reg45 <= (($unsigned(wire23) ?
                  reg48[(3'h5):(2'h2)] : reg47[(1'h0):(1'h0)]) >> wire23);
              reg46 <= reg26[(4'hc):(2'h3)];
            end
          if ((|(((((8'hb3) <= reg29) ?
              $unsigned(wire18) : (|reg32)) > {reg46}) - $signed(reg42))))
            begin
              reg47 <= (^~$signed($signed(wire22[(5'h12):(4'hc)])));
              reg48 <= $signed({(~|$signed($unsigned(reg48))),
                  $signed($signed($signed(reg45)))});
              reg49 <= $unsigned($unsigned($unsigned((wire23 ?
                  (8'hb6) : reg45[(3'h4):(1'h0)]))));
            end
          else
            begin
              reg47 <= $signed(reg49);
              reg48 <= $signed($unsigned($unsigned((wire22[(3'h6):(2'h3)] - (reg40 ~^ reg48)))));
            end
        end
    end
  assign wire50 = (wire19[(4'hb):(4'ha)] ?
                      (8'hbc) : {((reg36[(4'ha):(2'h2)] & (8'hb1)) >>> reg25),
                          wire18});
  always
    @(posedge clk) begin
      reg51 <= $signed($signed((({reg46} ? (~reg44) : wire24) ?
          ((reg30 ? reg42 : (8'hb2)) <<< (~^reg42)) : ((reg27 > reg29) ?
              $unsigned(wire18) : reg39[(3'h7):(3'h7)]))));
      if (reg39)
        begin
          reg52 <= reg43;
          reg53 <= {{reg36[(2'h3):(1'h1)], wire23[(2'h2):(1'h0)]}};
        end
      else
        begin
          reg52 <= ($unsigned($unsigned($unsigned(wire21))) ?
              ({(^~(reg37 ? reg37 : reg34))} ?
                  ({(reg43 ? wire50 : reg40)} ?
                      reg27 : $unsigned(reg32)) : (8'hbe)) : $signed((wire20 ~^ $unsigned($unsigned(wire18)))));
          reg53 <= (~&($signed($unsigned((+reg27))) ?
              (-{reg44, (reg34 ? reg29 : (7'h41))}) : reg44));
        end
    end
  assign wire54 = (reg28[(2'h3):(2'h2)] ?
                      $unsigned($unsigned(wire19[(2'h2):(2'h2)])) : (($unsigned((~reg26)) & ((reg33 - reg33) - $signed(wire20))) ?
                          wire22[(4'h9):(3'h5)] : reg36[(3'h4):(1'h0)]));
  assign wire55 = reg34;
  assign wire56 = (~^$signed((+$unsigned($unsigned(reg30)))));
  assign wire57 = reg35;
  always
    @(posedge clk) begin
      reg58 <= (wire55 ? $unsigned(reg33) : wire57[(2'h2):(2'h2)]);
      reg59 <= reg25;
      reg60 <= (wire22 ?
          $unsigned(wire20) : ((+reg29[(3'h4):(1'h0)]) ?
              reg37 : (($signed(reg33) & $signed(wire54)) ?
                  ((reg53 ? reg36 : reg29) ?
                      wire18 : reg37) : $signed($unsigned(reg28)))));
    end
  assign wire61 = $signed((reg52[(5'h10):(3'h5)] + ($signed((~|wire56)) ?
                      (reg48 * $signed(reg26)) : {reg47[(1'h0):(1'h0)],
                          reg25[(4'h8):(3'h6)]})));
  assign wire62 = $signed((^$signed(reg60)));
  assign wire63 = ($signed(((wire24 ? $signed((8'ha6)) : $unsigned(reg48)) ?
                      wire21[(4'hd):(1'h1)] : $signed(wire56[(1'h1):(1'h0)]))) << ((reg42 ?
                          $unsigned({wire62}) : $signed((wire18 >= (8'hb8)))) ?
                      reg46 : reg48));
  assign wire64 = reg29;
  assign wire65 = (|wire57);
  assign wire66 = (({reg47} ?
                      (wire57[(4'h8):(1'h0)] ?
                          ($signed(wire57) ?
                              wire56[(2'h2):(2'h2)] : $unsigned(wire61)) : $unsigned(reg48)) : (&($unsigned(wire24) ?
                          (reg31 >> reg40) : $unsigned(reg43)))) | $unsigned(((^wire63[(3'h4):(2'h2)]) * reg44)));
  always
    @(posedge clk) begin
      if ({wire62[(2'h3):(2'h2)],
          (^~((-(reg41 ?
              (7'h42) : (8'ha1))) <= $unsigned(reg42[(3'h4):(3'h4)])))})
        begin
          reg67 <= $unsigned(((~$unsigned((-reg40))) ?
              wire50[(3'h6):(2'h2)] : (wire18[(2'h3):(2'h3)] | $unsigned((|reg26)))));
          if ($signed({$signed(((reg47 ?
                  wire65 : reg36) > $unsigned(wire64)))}))
            begin
              reg68 <= ((~|$unsigned({(!reg60)})) ?
                  $signed(reg39[(3'h7):(2'h2)]) : $unsigned(((reg53 ?
                      reg67[(1'h1):(1'h1)] : (^~reg44)) || $signed(((8'hb4) ?
                      (8'ha6) : reg45)))));
              reg69 <= (8'hae);
            end
          else
            begin
              reg68 <= (({reg29[(4'h9):(1'h0)], reg60[(3'h5):(2'h2)]} ?
                      ({(reg34 <<< reg47)} ~^ $unsigned((^reg42))) : $unsigned(wire55)) ?
                  ($signed((&wire57)) ?
                      (($signed(wire64) * (reg41 > reg27)) ?
                          {$unsigned(reg40)} : (reg28 ?
                              wire57[(2'h2):(1'h0)] : (reg25 ?
                                  wire56 : reg35))) : (^((-reg40) ?
                          reg30 : reg26[(3'h6):(2'h2)]))) : ({reg28[(1'h1):(1'h1)],
                          (+reg30[(2'h3):(2'h3)])} ?
                      {($signed(reg26) ? $signed(reg68) : $signed((8'hbe))),
                          $signed((~|(8'hae)))} : $signed((reg51 ?
                          ((8'h9e) ^~ reg59) : wire23[(1'h0):(1'h0)]))));
              reg69 <= (!{{$unsigned(wire50[(4'h9):(3'h7)]),
                      $unsigned($unsigned(reg27))},
                  (^$signed($unsigned(reg49)))});
              reg70 <= {reg32[(1'h0):(1'h0)], (+$signed(wire50))};
              reg71 <= reg29[(4'hd):(1'h1)];
            end
          reg72 <= {($signed(((8'ha5) ?
                      reg70[(1'h1):(1'h0)] : wire20[(2'h2):(1'h1)])) ?
                  ((~&$signed(reg36)) >> ((~|reg52) ^~ (wire50 || reg32))) : wire55),
              $signed({{reg40[(1'h0):(1'h0)], (wire57 - reg46)}})};
          reg73 <= $unsigned(($unsigned((&(!reg40))) ?
              (8'hab) : (&reg42[(2'h2):(1'h0)])));
          if ((reg52[(3'h6):(1'h0)] | $unsigned((wire50[(3'h7):(3'h5)] ?
              reg38 : ((reg39 ^ wire56) ? $signed(wire66) : reg70)))))
            begin
              reg74 <= reg44[(4'hc):(3'h7)];
              reg75 <= ((~(($signed(wire57) ? $signed(reg41) : {reg48, reg40}) ?
                      $unsigned({wire63}) : ((~|wire21) ?
                          reg58 : (reg67 ? reg74 : reg28)))) ?
                  ($signed((!(reg37 ?
                      reg48 : reg44))) == $unsigned({(wire62 ^ (8'hb4)),
                      (!(7'h44))})) : $unsigned(reg30));
              reg76 <= (^$unsigned($signed(reg28[(4'ha):(2'h2)])));
              reg77 <= (wire19 + reg75);
            end
          else
            begin
              reg74 <= $signed({($unsigned(reg25[(3'h7):(2'h2)]) ?
                      reg49 : reg38[(4'hb):(2'h3)])});
              reg75 <= ((~wire65) ^~ ((^$unsigned((wire63 > reg26))) || (~|$unsigned($unsigned(reg58)))));
              reg76 <= (reg67[(4'h8):(3'h5)] * $unsigned($signed(((8'hb9) ?
                  (wire24 ? reg58 : (8'hac)) : {wire66, wire62}))));
              reg77 <= reg75[(1'h1):(1'h0)];
              reg78 <= (reg29[(3'h5):(3'h5)] & $unsigned(($signed(reg73) ?
                  $signed($signed(reg43)) : reg68[(2'h3):(2'h3)])));
            end
        end
      else
        begin
          reg67 <= $unsigned((+$unsigned(reg26)));
          reg68 <= reg30[(1'h1):(1'h1)];
        end
      reg79 <= (reg68[(2'h2):(2'h2)] ?
          (!(($unsigned(wire50) ? $unsigned(reg49) : {reg41}) ?
              (((8'ha0) == reg53) ?
                  $signed(wire65) : wire55[(1'h1):(1'h1)]) : (~$signed((8'hbc))))) : wire22);
      reg80 <= (reg43 ?
          (8'hba) : $signed(($signed(reg49[(4'hc):(4'hc)]) <<< $unsigned(wire61[(1'h0):(1'h0)]))));
    end
  assign wire81 = $signed(reg77);
  assign wire82 = $signed((({$signed(reg40)} == ((reg42 ?
                      (8'ha3) : (8'h9e)) + ((7'h42) ?
                      (7'h40) : (8'hb4)))) < $signed(wire20[(2'h2):(1'h1)])));
  assign wire83 = (^~reg34[(4'he):(4'h8)]);
  assign wire84 = (wire63 * {reg53, wire63});
  assign wire85 = reg74[(2'h3):(1'h1)];
  assign wire86 = ((^~($signed(reg35) ^ (8'ha3))) << wire50);
endmodule

module module137
#(parameter param156 = {((|(~((8'ha6) ? (8'hb9) : (8'hbf)))) | (({(8'haf), (8'hae)} >>> ((8'hbe) != (8'hb6))) ? ((!(8'h9d)) ? (^(8'hbf)) : {(7'h43), (8'ha7)}) : ((^~(8'hbb)) ? (!(8'hb7)) : ((8'h9e) ? (8'h9e) : (8'hb7))))), (((((8'ha5) * (8'ha9)) ~^ ((8'hb1) ? (8'h9d) : (8'ha7))) ? (^((8'hb3) ? (8'haf) : (8'had))) : ((~|(8'ha8)) == ((8'haf) & (8'hab)))) >>> ({{(8'ha2), (8'ha1)}, {(8'ha0), (8'ha5)}} ? (((8'hb8) <<< (8'ha2)) || ((8'h9f) ? (8'haa) : (8'ha4))) : ({(8'hb4)} ^ (&(8'ha2)))))}, 
parameter param157 = (+(param156 ? (((param156 + param156) ? param156 : (~&param156)) ? (&param156) : param156) : (+((param156 ? param156 : param156) ? (-param156) : (param156 ? (8'hbc) : param156))))))
(y, clk, wire141, wire140, wire139, wire138);
  output wire [(32'h9a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire141;
  input wire [(5'h10):(1'h0)] wire140;
  input wire [(5'h12):(1'h0)] wire139;
  input wire signed [(2'h2):(1'h0)] wire138;
  wire signed [(5'h12):(1'h0)] wire155;
  wire signed [(3'h5):(1'h0)] wire154;
  wire signed [(2'h2):(1'h0)] wire153;
  wire [(4'hf):(1'h0)] wire152;
  wire signed [(3'h6):(1'h0)] wire151;
  wire signed [(5'h12):(1'h0)] wire150;
  wire [(3'h4):(1'h0)] wire149;
  wire signed [(4'hd):(1'h0)] wire148;
  wire signed [(3'h7):(1'h0)] wire147;
  wire signed [(5'h10):(1'h0)] wire144;
  wire signed [(3'h6):(1'h0)] wire143;
  wire [(4'hc):(1'h0)] wire142;
  reg [(4'hd):(1'h0)] reg146 = (1'h0);
  reg [(5'h12):(1'h0)] reg145 = (1'h0);
  assign y = {wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire144,
                 wire143,
                 wire142,
                 reg146,
                 reg145,
                 (1'h0)};
  assign wire142 = ($signed($signed($signed($unsigned(wire141)))) ?
                       ({$unsigned((wire139 ~^ (7'h44))),
                               $unsigned({wire141, wire138})} ?
                           (~^$unsigned($unsigned(wire138))) : {wire140,
                               ($unsigned(wire138) ?
                                   (wire139 >= wire139) : $unsigned(wire139))}) : {$signed($signed((~&wire139))),
                           wire140[(4'h8):(2'h3)]});
  assign wire143 = (~&(-wire138));
  assign wire144 = (wire141[(4'hd):(4'h9)] >= wire138);
  always
    @(posedge clk) begin
      reg145 <= wire144[(4'hd):(3'h6)];
      reg146 <= ((~^(wire144 ?
          (reg145 | (wire139 <= wire139)) : ($signed(wire143) ?
              ((8'hbe) ?
                  wire141 : wire139) : wire140))) >> $signed((((-wire140) ?
              $unsigned((8'ha6)) : (reg145 ? (8'ha8) : wire144)) ?
          ((wire141 ? wire144 : wire141) ?
              (~&wire139) : (wire141 ?
                  wire139 : wire143)) : (wire139[(4'hf):(3'h5)] ?
              {wire138, reg145} : {wire140}))));
    end
  assign wire147 = (~&wire139[(3'h5):(3'h5)]);
  assign wire148 = wire140;
  assign wire149 = $signed(((wire139[(3'h6):(3'h4)] ?
                           (~|$signed(wire143)) : {(wire139 == wire141)}) ?
                       (~$unsigned((reg145 ?
                           wire138 : reg145))) : ($unsigned((~&wire142)) ^~ $unsigned((wire139 <= wire148)))));
  assign wire150 = ($signed(($signed($signed(wire147)) ?
                           (-$signed((8'h9f))) : (!wire140[(3'h6):(1'h0)]))) ?
                       wire138[(1'h1):(1'h0)] : (reg146[(4'hc):(3'h4)] + ($signed((reg146 ?
                               wire149 : wire147)) ?
                           $unsigned((wire148 ?
                               wire149 : wire144)) : wire147[(3'h5):(1'h0)])));
  assign wire151 = $unsigned(wire147[(3'h5):(3'h5)]);
  assign wire152 = $unsigned(wire140);
  assign wire153 = ($unsigned((^~((wire139 >= wire143) + (wire139 ?
                           reg146 : wire148)))) ?
                       wire141 : (8'ha6));
  assign wire154 = $unsigned(wire144[(4'h8):(1'h1)]);
  assign wire155 = $signed($signed(($signed($unsigned(wire140)) <= (wire140 ?
                       (8'hbd) : $unsigned(wire150)))));
endmodule

module module182  (y, clk, wire186, wire185, wire184, wire183);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire186;
  input wire [(4'hf):(1'h0)] wire185;
  input wire [(4'he):(1'h0)] wire184;
  input wire [(4'hc):(1'h0)] wire183;
  wire signed [(2'h2):(1'h0)] wire197;
  wire [(4'hf):(1'h0)] wire196;
  wire [(4'hd):(1'h0)] wire191;
  wire signed [(4'ha):(1'h0)] wire190;
  wire signed [(2'h2):(1'h0)] wire189;
  wire [(3'h5):(1'h0)] wire188;
  wire signed [(4'he):(1'h0)] wire187;
  reg [(5'h15):(1'h0)] reg195 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg194 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg193 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg192 = (1'h0);
  assign y = {wire197,
                 wire196,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 (1'h0)};
  assign wire187 = (|$unsigned(($signed({wire183}) ?
                       wire183 : $signed(wire184))));
  assign wire188 = wire185;
  assign wire189 = {({(^~wire188[(3'h4):(1'h1)]),
                           wire188[(3'h4):(1'h0)]} > {((+wire188) ?
                               $unsigned(wire187) : (wire185 ?
                                   wire185 : wire188)),
                           ($unsigned(wire187) ?
                               wire183 : (wire184 ~^ wire185))}),
                       (-(((wire185 | (8'ha6)) ?
                               $signed(wire183) : (wire184 ?
                                   wire185 : wire184)) ?
                           {(!(8'h9f))} : $unsigned($unsigned(wire184))))};
  assign wire190 = (((wire189[(2'h2):(1'h1)] ~^ (~|$signed(wire185))) ?
                           (((&wire183) ?
                               $unsigned(wire189) : (wire185 ?
                                   (7'h41) : wire186)) + $unsigned((wire189 | wire187))) : wire189) ?
                       ((({(8'hb2)} | (wire188 ?
                           (8'ha0) : wire185)) * $unsigned((wire183 ?
                           (8'hbb) : wire183))) ^~ wire188[(1'h1):(1'h1)]) : (^((!{wire185}) | {(~wire186)})));
  assign wire191 = $signed(wire184[(4'hd):(2'h3)]);
  always
    @(posedge clk) begin
      reg192 <= (wire190[(1'h0):(1'h0)] ?
          wire186 : $signed(((wire187[(4'hc):(4'h8)] >= (&wire190)) + $unsigned((8'had)))));
      reg193 <= reg192[(4'hc):(2'h2)];
      reg194 <= $signed({(wire186[(2'h2):(1'h1)] - wire188),
          $unsigned(wire190)});
      reg195 <= (~^$signed((-({(8'hbd), reg193} ?
          (wire189 < wire187) : (wire187 ? wire184 : wire186)))));
    end
  assign wire196 = wire188;
  assign wire197 = (8'hab);
endmodule
