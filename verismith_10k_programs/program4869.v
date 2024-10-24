module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  wire signed [(4'h9):(1'h0)] wire222;
  wire signed [(3'h6):(1'h0)] wire221;
  wire [(5'h13):(1'h0)] wire219;
  wire signed [(5'h15):(1'h0)] wire218;
  wire [(4'hd):(1'h0)] wire210;
  wire signed [(5'h15):(1'h0)] wire212;
  wire signed [(5'h11):(1'h0)] wire213;
  wire signed [(5'h10):(1'h0)] wire214;
  wire signed [(4'hf):(1'h0)] wire215;
  wire signed [(5'h11):(1'h0)] wire216;
  assign y = {wire222,
                 wire221,
                 wire219,
                 wire218,
                 wire210,
                 wire212,
                 wire213,
                 wire214,
                 wire215,
                 wire216,
                 (1'h0)};
  module4 #() modinst211 (.wire5(wire1), .wire9((8'h9d)), .y(wire210), .wire8(wire2), .clk(clk), .wire7(wire3), .wire6(wire0));
  assign wire212 = $unsigned($unsigned($signed((((8'hb4) ? wire3 : (8'hbe)) ?
                       $unsigned(wire3) : wire1[(5'h10):(4'he)]))));
  assign wire213 = $unsigned($unsigned($unsigned((~&(~|wire1)))));
  assign wire214 = $unsigned($unsigned($signed(($signed(wire212) ?
                       $signed(wire210) : (wire3 ? wire1 : wire3)))));
  assign wire215 = wire212;
  module4 #() modinst217 (.y(wire216), .wire7(wire3), .wire5(wire0), .clk(clk), .wire6(wire1), .wire8(wire213), .wire9(wire212));
  assign wire218 = $signed($unsigned(((wire213[(3'h7):(3'h4)] > (wire0 ?
                       wire215 : wire0)) == {(wire214 ? wire216 : wire0)})));
  module10 #() modinst220 (.y(wire219), .wire12(wire215), .wire11(wire1), .wire14(wire216), .wire13(wire2), .clk(clk));
  assign wire221 = wire218[(4'ha):(1'h0)];
  assign wire222 = (wire216[(3'h7):(1'h0)] && wire1);
endmodule

module module4
#(parameter param208 = ({({((8'ha8) ^ (7'h44)), {(8'ha5), (8'hb2)}} <= (((8'hac) ? (7'h44) : (8'hb6)) != ((8'hbf) ? (8'ha5) : (8'h9d))))} ~^ (8'hbf)), 
parameter param209 = (param208 ? {(param208 <<< (param208 ? (param208 ? param208 : (7'h42)) : (param208 ? param208 : param208))), (((param208 ? param208 : param208) ? (param208 == param208) : (^param208)) != {(param208 || param208), {param208}})} : {(^~param208)}))
(y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h1ac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire5;
  input wire signed [(5'h13):(1'h0)] wire6;
  input wire signed [(5'h11):(1'h0)] wire7;
  input wire [(5'h11):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire9;
  wire [(4'hb):(1'h0)] wire192;
  wire [(5'h12):(1'h0)] wire191;
  wire [(5'h14):(1'h0)] wire186;
  wire [(5'h11):(1'h0)] wire185;
  wire signed [(4'he):(1'h0)] wire179;
  wire [(5'h13):(1'h0)] wire178;
  wire signed [(5'h13):(1'h0)] wire177;
  wire [(2'h3):(1'h0)] wire176;
  wire [(5'h10):(1'h0)] wire172;
  wire signed [(4'he):(1'h0)] wire152;
  wire signed [(5'h10):(1'h0)] wire58;
  wire [(4'hc):(1'h0)] wire75;
  wire signed [(5'h15):(1'h0)] wire138;
  wire [(5'h11):(1'h0)] wire170;
  wire [(5'h15):(1'h0)] wire174;
  wire signed [(3'h6):(1'h0)] wire181;
  wire signed [(5'h11):(1'h0)] wire183;
  reg [(3'h6):(1'h0)] reg207 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg206 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg205 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg204 = (1'h0);
  reg [(4'h8):(1'h0)] reg203 = (1'h0);
  reg [(4'h8):(1'h0)] reg202 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg201 = (1'h0);
  reg [(3'h7):(1'h0)] reg200 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg199 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg198 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg197 = (1'h0);
  reg [(3'h5):(1'h0)] reg196 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg195 = (1'h0);
  reg [(4'h9):(1'h0)] reg194 = (1'h0);
  reg [(4'ha):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg189 = (1'h0);
  reg [(2'h2):(1'h0)] reg188 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg187 = (1'h0);
  assign y = {wire192,
                 wire191,
                 wire186,
                 wire185,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire172,
                 wire152,
                 wire58,
                 wire75,
                 wire138,
                 wire170,
                 wire174,
                 wire181,
                 wire183,
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
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 (1'h0)};
  module10 #() modinst59 (.wire12(wire8), .y(wire58), .wire14(wire7), .wire13(wire9), .wire11(wire5), .clk(clk));
  module60 #() modinst76 (wire75, clk, wire6, wire5, wire7, wire58);
  module77 #() modinst139 (.y(wire138), .wire81(wire58), .wire79(wire6), .wire78(wire5), .wire80(wire7), .wire82(wire9), .clk(clk));
  module140 #() modinst153 (.clk(clk), .wire143(wire9), .wire145(wire58), .y(wire152), .wire142(wire5), .wire144(wire75), .wire141(wire8));
  module154 #() modinst171 (wire170, clk, wire152, wire58, wire5, wire75, wire9);
  module77 #() modinst173 (wire172, clk, wire170, wire152, wire75, wire6, wire5);
  module140 #() modinst175 (.clk(clk), .y(wire174), .wire144(wire170), .wire145(wire172), .wire141(wire9), .wire142(wire5), .wire143(wire58));
  assign wire176 = wire5[(1'h0):(1'h0)];
  assign wire177 = $unsigned($signed($signed((^(-wire176)))));
  assign wire178 = wire6[(3'h6):(3'h6)];
  module77 #() modinst180 (.wire82(wire152), .wire80(wire75), .wire78(wire177), .wire79(wire6), .y(wire179), .clk(clk), .wire81(wire7));
  module60 #() modinst182 (.y(wire181), .wire64(wire170), .wire63(wire8), .clk(clk), .wire61(wire178), .wire62(wire152));
  module140 #() modinst184 (wire183, clk, wire5, wire179, wire6, wire178, wire174);
  assign wire185 = ((~|wire176[(2'h3):(2'h2)]) >> ($unsigned(wire75[(4'h8):(3'h5)]) ?
                       wire176 : (($unsigned(wire5) ?
                               wire172[(4'he):(4'h9)] : (wire174 != wire172)) ?
                           wire5[(3'h6):(3'h6)] : ($signed(wire176) ^ wire75))));
  assign wire186 = ({((8'hbf) ^~ $unsigned(wire170[(5'h11):(4'he)])),
                       wire170} != wire170);
  always
    @(posedge clk) begin
      reg187 <= $signed((!wire177));
      reg188 <= wire183[(4'hb):(4'h8)];
      reg189 <= $signed((wire185[(4'hf):(3'h7)] ?
          {($unsigned((8'haa)) ?
                  $signed((7'h42)) : $signed(wire174))} : ($signed((wire170 ?
              wire9 : (8'hbb))) > $signed((wire183 ? wire6 : wire177)))));
      reg190 <= {$signed(wire75),
          (wire58[(4'hc):(4'h8)] ?
              (((-wire185) * $signed(wire176)) > {((8'hb8) ? wire176 : wire185),
                  (^~reg187)}) : (&(~^(-wire58))))};
    end
  assign wire191 = wire185[(4'he):(1'h0)];
  module10 #() modinst193 (wire192, clk, wire183, wire6, wire138, wire186);
  always
    @(posedge clk) begin
      if (($unsigned($signed(wire181[(2'h2):(1'h0)])) ?
          ($signed(($unsigned(wire179) && (~&wire176))) ?
              wire5 : (8'ha1)) : ((wire5 <<< (wire176[(2'h2):(2'h2)] <= $unsigned(wire58))) ?
              $signed(reg190[(4'ha):(3'h5)]) : $signed((8'hb1)))))
        begin
          if ((wire8[(4'hd):(4'hd)] || $unsigned((~^wire58[(2'h3):(1'h0)]))))
            begin
              reg194 <= $unsigned(((~wire176) ?
                  ($unsigned((wire5 ? wire183 : wire5)) ?
                      $signed($unsigned((8'ha4))) : (wire178 & wire192[(4'h8):(3'h5)])) : ((+wire192) ?
                      $unsigned((-wire138)) : ((wire191 ?
                          wire178 : wire179) <= $signed(wire183)))));
              reg195 <= $signed(($signed(wire192) ?
                  wire178[(4'hd):(4'hb)] : $unsigned(wire181[(1'h0):(1'h0)])));
              reg196 <= wire172[(3'h4):(3'h4)];
            end
          else
            begin
              reg194 <= wire186[(4'hc):(2'h2)];
              reg195 <= $signed((~^(wire183 ^~ (~(wire58 ?
                  wire75 : wire185)))));
              reg196 <= ($unsigned(wire178) ?
                  wire176[(2'h2):(1'h1)] : ($signed(wire75[(3'h6):(2'h2)]) ?
                      ((^~wire6) + ((reg188 ? wire185 : (8'hb7)) ?
                          reg187 : (reg190 ?
                              wire176 : wire174))) : $signed($signed((wire177 ?
                          (8'ha3) : (8'ha2))))));
              reg197 <= (($signed(((wire9 >= wire174) <<< wire178[(4'hc):(2'h2)])) ?
                      wire138 : ($signed((wire192 ? wire191 : wire179)) ?
                          (~^$signed(wire174)) : {$unsigned(wire7)})) ?
                  {wire75, $unsigned((7'h42))} : (|(((wire186 ?
                          wire186 : wire170) ?
                      wire5[(1'h1):(1'h1)] : wire152) <<< wire191)));
              reg198 <= $signed(($unsigned((reg197[(4'hc):(4'ha)] <= (wire138 ?
                  wire178 : wire138))) || $signed(wire176[(2'h2):(1'h0)])));
            end
          reg199 <= $signed(($signed($signed($signed(wire9))) <<< wire179));
          reg200 <= ($signed((+$unsigned(((8'haa) >> wire176)))) <<< $signed(($unsigned($unsigned(wire152)) ?
              reg198 : $signed((wire5 << reg199)))));
          if (((~$signed($signed({wire152}))) >= ($signed((!(|wire5))) | (8'hbe))))
            begin
              reg201 <= wire181[(1'h1):(1'h0)];
              reg202 <= ((8'h9f) ? (~{{(-reg197), $signed(wire172)}}) : reg198);
              reg203 <= ($unsigned($signed((~&(reg190 ? reg196 : reg196)))) ?
                  wire192 : ((~$signed($signed(wire138))) ~^ wire177[(2'h3):(1'h0)]));
              reg204 <= wire138[(4'h9):(4'h9)];
            end
          else
            begin
              reg201 <= (~|($unsigned(($signed((7'h43)) ?
                      (reg187 + reg195) : wire183)) ?
                  (($unsigned((7'h43)) <<< wire9[(4'hf):(4'hc)]) << $signed((reg189 ?
                      wire174 : reg197))) : wire174));
              reg202 <= (($signed((wire152 ? $unsigned((7'h42)) : wire176)) ?
                      {reg200[(3'h7):(3'h6)]} : (8'ha2)) ?
                  (^{$unsigned({wire178,
                          (8'ha0)})}) : (-wire192[(3'h4):(2'h3)]));
              reg203 <= (|(~&(~|(|$unsigned(reg199)))));
              reg204 <= reg188[(1'h0):(1'h0)];
            end
          if (wire8[(4'hd):(3'h5)])
            begin
              reg205 <= ($unsigned($signed($unsigned(wire5))) ?
                  $signed(($unsigned((!reg189)) <<< (wire172 + (wire58 ?
                      reg200 : (8'ha7))))) : (^~wire176));
              reg206 <= (~(^reg202));
              reg207 <= $unsigned(wire75[(1'h0):(1'h0)]);
            end
          else
            begin
              reg205 <= (|reg202);
              reg206 <= ($signed($unsigned(((8'hb8) ?
                  $signed((7'h44)) : (-reg197)))) < $signed((((reg189 ?
                      wire192 : wire8) ?
                  $signed((8'had)) : reg202) < reg202)));
            end
        end
      else
        begin
          reg194 <= $unsigned(reg196[(3'h5):(2'h2)]);
          reg195 <= wire176;
        end
    end
endmodule

module module154  (y, clk, wire159, wire158, wire157, wire156, wire155);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire159;
  input wire signed [(4'hd):(1'h0)] wire158;
  input wire [(3'h7):(1'h0)] wire157;
  input wire signed [(3'h7):(1'h0)] wire156;
  input wire signed [(2'h2):(1'h0)] wire155;
  wire [(4'hc):(1'h0)] wire169;
  wire [(4'ha):(1'h0)] wire168;
  wire [(5'h14):(1'h0)] wire167;
  wire [(3'h5):(1'h0)] wire166;
  wire [(4'hb):(1'h0)] wire165;
  wire signed [(2'h3):(1'h0)] wire164;
  wire signed [(4'hc):(1'h0)] wire163;
  wire [(3'h4):(1'h0)] wire162;
  wire signed [(3'h6):(1'h0)] wire161;
  wire [(5'h12):(1'h0)] wire160;
  assign y = {wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 (1'h0)};
  assign wire160 = (-{((!$signed(wire156)) ?
                           $unsigned(wire157) : ((+wire158) ?
                               $unsigned((8'hbf)) : (wire157 ?
                                   wire159 : wire156)))});
  assign wire161 = ((8'h9d) ?
                       wire157 : (wire159 ?
                           wire158[(2'h2):(2'h2)] : $signed($signed((~|wire158)))));
  assign wire162 = $signed({($unsigned((8'hb0)) ?
                           $unsigned($signed(wire160)) : wire155)});
  assign wire163 = $unsigned($unsigned($signed((wire162[(3'h4):(1'h1)] * (+wire158)))));
  assign wire164 = (&wire158);
  assign wire165 = (wire164 + $signed(wire156));
  assign wire166 = $signed({wire159});
  assign wire167 = $signed((($unsigned((8'hbf)) ?
                       $unsigned((wire163 < wire158)) : $unsigned(wire162[(1'h0):(1'h0)])) + ($unsigned(wire164) * wire160)));
  assign wire168 = (wire157[(1'h0):(1'h0)] ?
                       {(8'hac),
                           (^wire167[(3'h5):(2'h3)])} : $unsigned((+$signed(wire163))));
  assign wire169 = $unsigned(wire160[(2'h3):(2'h3)]);
endmodule

module module140  (y, clk, wire145, wire144, wire143, wire142, wire141);
  output wire [(32'h5b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire145;
  input wire [(4'ha):(1'h0)] wire144;
  input wire [(4'hf):(1'h0)] wire143;
  input wire [(4'hf):(1'h0)] wire142;
  input wire signed [(2'h3):(1'h0)] wire141;
  wire [(5'h13):(1'h0)] wire151;
  wire [(4'hc):(1'h0)] wire150;
  wire signed [(5'h12):(1'h0)] wire149;
  wire [(4'hc):(1'h0)] wire148;
  wire [(4'hd):(1'h0)] wire147;
  wire signed [(5'h10):(1'h0)] wire146;
  assign y = {wire151, wire150, wire149, wire148, wire147, wire146, (1'h0)};
  assign wire146 = $unsigned({(wire143[(4'hf):(3'h4)] ?
                           $unsigned((wire141 || wire143)) : wire142)});
  assign wire147 = wire143;
  assign wire148 = $unsigned((+$signed((^~$signed((8'ha5))))));
  assign wire149 = ($signed($unsigned((&wire148[(2'h3):(2'h2)]))) ?
                       $signed((~|$signed(((8'hae) >= wire147)))) : $signed($unsigned($unsigned({wire147}))));
  assign wire150 = $unsigned((~|$signed({{wire141}})));
  assign wire151 = (+wire143);
endmodule

module module77
#(parameter param137 = ((~|((8'hb5) >= (8'haa))) > ((8'haa) ? (~(((8'ha1) ? (8'ha3) : (8'hb2)) ? ((8'ha2) << (8'h9d)) : (!(8'hae)))) : ((8'hac) & (!((8'hbd) | (8'hbd)))))))
(y, clk, wire82, wire81, wire80, wire79, wire78);
  output wire [(32'h252):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire82;
  input wire signed [(4'hd):(1'h0)] wire81;
  input wire [(4'hc):(1'h0)] wire80;
  input wire [(2'h2):(1'h0)] wire79;
  input wire [(5'h13):(1'h0)] wire78;
  wire signed [(3'h7):(1'h0)] wire136;
  wire signed [(4'h9):(1'h0)] wire135;
  wire signed [(3'h7):(1'h0)] wire134;
  wire signed [(4'hf):(1'h0)] wire133;
  wire [(4'he):(1'h0)] wire116;
  wire [(4'ha):(1'h0)] wire108;
  wire signed [(4'h8):(1'h0)] wire107;
  wire [(2'h2):(1'h0)] wire89;
  wire signed [(4'h9):(1'h0)] wire88;
  wire signed [(3'h7):(1'h0)] wire87;
  wire [(3'h4):(1'h0)] wire86;
  wire [(5'h11):(1'h0)] wire85;
  wire signed [(4'hf):(1'h0)] wire84;
  reg [(3'h5):(1'h0)] reg132 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg131 = (1'h0);
  reg [(4'hd):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg129 = (1'h0);
  reg [(4'h9):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg127 = (1'h0);
  reg signed [(4'he):(1'h0)] reg126 = (1'h0);
  reg [(4'h9):(1'h0)] reg125 = (1'h0);
  reg [(4'hd):(1'h0)] reg124 = (1'h0);
  reg [(4'he):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg121 = (1'h0);
  reg [(3'h4):(1'h0)] reg120 = (1'h0);
  reg [(2'h2):(1'h0)] reg119 = (1'h0);
  reg [(5'h13):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg115 = (1'h0);
  reg [(4'h9):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg110 = (1'h0);
  reg [(4'hb):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg106 = (1'h0);
  reg [(5'h11):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg104 = (1'h0);
  reg [(5'h10):(1'h0)] reg103 = (1'h0);
  reg signed [(4'he):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg101 = (1'h0);
  reg [(2'h2):(1'h0)] reg100 = (1'h0);
  reg [(5'h15):(1'h0)] reg99 = (1'h0);
  reg [(3'h5):(1'h0)] reg98 = (1'h0);
  reg [(2'h2):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg95 = (1'h0);
  reg [(4'hd):(1'h0)] reg94 = (1'h0);
  reg [(4'ha):(1'h0)] reg93 = (1'h0);
  reg [(4'h8):(1'h0)] reg92 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg83 = (1'h0);
  assign y = {wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire116,
                 wire108,
                 wire107,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
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
                 reg118,
                 reg117,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
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
                 reg83,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg83 <= $unsigned($signed((^~(((8'ha9) ?
          (8'ha0) : (7'h42)) == wire80[(3'h5):(2'h3)]))));
    end
  assign wire84 = ((reg83[(1'h0):(1'h0)] ?
                      wire79 : wire82) ^ (!($signed((wire82 ?
                          wire79 : wire81)) ?
                      $unsigned(wire79[(2'h2):(2'h2)]) : ((wire81 ?
                              wire79 : wire80) ?
                          $signed(reg83) : (8'hab)))));
  assign wire85 = $signed(wire80[(3'h6):(2'h3)]);
  assign wire86 = (wire79 ? (8'ha2) : (^$signed(wire78)));
  assign wire87 = (^~(|($unsigned(wire84[(4'ha):(4'ha)]) != ((8'hb3) ?
                      wire80 : wire81[(3'h6):(3'h6)]))));
  assign wire88 = (!wire85);
  assign wire89 = (wire79[(1'h1):(1'h1)] == ($unsigned((-$signed((8'h9d)))) ?
                      (~(8'hb2)) : ($signed((reg83 >>> (8'ha0))) ^~ ((wire82 == wire78) ?
                          $unsigned((8'hbf)) : wire81[(3'h7):(3'h4)]))));
  always
    @(posedge clk) begin
      reg90 <= (($unsigned($signed(wire81)) ?
          wire82 : ((~{wire86, wire81}) ?
              (wire78[(2'h2):(1'h1)] > {wire84}) : wire89)) >>> ((|wire84) == wire81[(2'h2):(2'h2)]));
      if ((wire78 && $signed($unsigned($signed($signed((8'hbb)))))))
        begin
          if (wire81[(3'h7):(3'h6)])
            begin
              reg91 <= ({((wire85 ?
                      (wire80 >> wire88) : (8'ha5)) >> wire86)} ~^ (wire80 || $signed(wire88)));
              reg92 <= ((wire79 ?
                      $unsigned($signed(reg83[(5'h10):(4'h8)])) : wire79) ?
                  wire85[(4'hc):(4'ha)] : $unsigned($signed(wire80[(4'hb):(4'h8)])));
              reg93 <= reg83[(3'h7):(3'h7)];
              reg94 <= $signed((+(~&(+wire84))));
              reg95 <= $signed({reg83[(4'he):(1'h0)],
                  ((wire79[(1'h1):(1'h0)] ?
                      wire89[(1'h0):(1'h0)] : wire79) | (!wire86[(2'h2):(2'h2)]))});
            end
          else
            begin
              reg91 <= wire89[(1'h1):(1'h1)];
            end
          if ($unsigned(wire78))
            begin
              reg96 <= wire82[(3'h6):(3'h5)];
              reg97 <= ((reg83[(3'h7):(1'h0)] ?
                      wire89 : ($unsigned($signed((8'hba))) ?
                          wire89[(2'h2):(1'h0)] : wire79[(2'h2):(1'h1)])) ?
                  ((+$signed(wire78[(2'h3):(1'h1)])) <<< wire78[(1'h1):(1'h0)]) : {(~wire85),
                      wire79[(2'h2):(2'h2)]});
              reg98 <= $unsigned($signed($unsigned(wire78[(3'h6):(1'h0)])));
              reg99 <= wire82[(2'h3):(1'h0)];
            end
          else
            begin
              reg96 <= $signed((($unsigned((reg90 <<< reg99)) ? reg83 : reg96) ?
                  $signed($signed($unsigned(wire79))) : reg96[(1'h0):(1'h0)]));
              reg97 <= reg93[(1'h0):(1'h0)];
              reg98 <= ((~&$signed($signed(wire79[(2'h2):(1'h1)]))) ?
                  wire79 : reg99);
              reg99 <= (((((^wire79) != (wire88 ? reg93 : reg99)) ?
                  ({wire86, wire78} ?
                      reg91[(2'h3):(1'h1)] : ((8'ha8) ?
                          wire89 : wire78)) : $unsigned(((8'haa) >>> wire88))) << reg91) != wire78);
              reg100 <= wire86[(3'h4):(2'h3)];
            end
          reg101 <= ({$signed($unsigned((reg100 ~^ reg97))),
              wire79[(1'h0):(1'h0)]} > {reg97[(2'h2):(2'h2)], reg91});
          if (reg90[(4'h8):(4'h8)])
            begin
              reg102 <= (wire86 & (~&wire88));
              reg103 <= wire82[(2'h2):(2'h2)];
              reg104 <= reg95;
            end
          else
            begin
              reg102 <= (|wire82);
              reg103 <= wire87[(1'h0):(1'h0)];
            end
        end
      else
        begin
          if ((reg93[(4'h8):(4'h8)] ?
              ((^~($signed(reg95) >= (8'hb3))) ~^ ((~&reg99) >>> wire84[(2'h2):(1'h1)])) : {(reg98 ?
                      $unsigned((reg95 ?
                          wire79 : (7'h42))) : wire80[(3'h4):(2'h2)])}))
            begin
              reg91 <= ((|(!reg103)) < $signed(((|wire88[(4'h9):(3'h5)]) > reg102[(4'hc):(4'hb)])));
              reg92 <= $unsigned($signed(wire78));
              reg93 <= $unsigned(reg104);
            end
          else
            begin
              reg91 <= (((!($unsigned(reg104) ? (reg98 > reg94) : {wire82})) ?
                      $signed((|$unsigned(reg91))) : (+$unsigned($signed(wire88)))) ?
                  (8'ha9) : $signed(reg101[(4'h9):(3'h4)]));
              reg92 <= reg83[(1'h1):(1'h0)];
              reg93 <= (-{$unsigned($unsigned(wire82[(3'h5):(3'h5)]))});
              reg94 <= $unsigned((8'ha7));
            end
        end
      reg105 <= $unsigned((wire79[(2'h2):(1'h0)] << $unsigned(wire80)));
      reg106 <= $signed($signed(({$unsigned(wire81)} ?
          $unsigned($unsigned(wire82)) : (^(-reg96)))));
    end
  assign wire107 = reg83[(2'h3):(1'h1)];
  assign wire108 = ($signed($signed(wire87[(1'h1):(1'h0)])) + reg83);
  always
    @(posedge clk) begin
      reg109 <= $unsigned(wire108);
      reg110 <= wire79[(2'h2):(1'h0)];
      reg111 <= (reg101[(3'h7):(1'h1)] ?
          reg92 : {reg102[(4'h9):(2'h3)], $unsigned(reg97)});
      if ((~((&reg106) < ((reg90[(2'h3):(2'h3)] == reg109[(3'h4):(2'h2)]) * reg100[(1'h1):(1'h0)]))))
        begin
          reg112 <= {$signed(({(+(8'hbd)),
                  (reg105 <<< reg98)} <<< (wire88[(2'h2):(1'h1)] > wire108))),
              ((($unsigned(reg92) && reg97[(1'h0):(1'h0)]) ?
                      {(reg95 * reg109)} : (reg96 ^ (&wire78))) ?
                  $unsigned(reg94) : ((|reg91) ?
                      (!(~reg93)) : ({wire89} ?
                          $unsigned(wire85) : (~^reg110))))};
          reg113 <= $unsigned((8'ha0));
          reg114 <= $unsigned(reg98[(2'h2):(1'h0)]);
          reg115 <= $unsigned($unsigned({((reg96 ?
                  (8'hb1) : wire88) >>> $signed(reg105)),
              {$signed((7'h40))}}));
        end
      else
        begin
          reg112 <= ($unsigned(($unsigned(wire80[(3'h5):(1'h0)]) ~^ (~^$signed(reg114)))) || reg102);
          reg113 <= $signed($signed($unsigned($unsigned((wire89 ?
              reg92 : (8'ha5))))));
        end
    end
  assign wire116 = wire89;
  always
    @(posedge clk) begin
      reg117 <= $signed($unsigned($unsigned(reg83[(4'hb):(4'h9)])));
      reg118 <= $unsigned((~reg115));
      if ((~|reg109))
        begin
          reg119 <= (-reg94);
          if ({$signed($signed(reg90[(3'h5):(2'h3)]))})
            begin
              reg120 <= (!(&(^reg91)));
              reg121 <= (^reg90);
              reg122 <= {{(!($unsigned(wire108) ? (reg94 <<< wire82) : wire86)),
                      ($signed(reg94) ?
                          reg120[(1'h0):(1'h0)] : $unsigned($unsigned(wire81)))},
                  wire116[(2'h3):(1'h0)]};
              reg123 <= $unsigned({$signed($unsigned($unsigned(reg114)))});
              reg124 <= wire89[(1'h0):(1'h0)];
            end
          else
            begin
              reg120 <= reg94;
            end
          reg125 <= (wire84[(3'h7):(3'h7)] - $unsigned($signed((~^$signed(reg92)))));
        end
      else
        begin
          reg119 <= {$signed((8'haa)), {reg118[(1'h1):(1'h0)], wire81}};
          if ((&$unsigned((^~reg102[(1'h1):(1'h1)]))))
            begin
              reg120 <= $signed(((+wire88[(1'h1):(1'h1)]) ^ $unsigned($signed($signed(reg124)))));
            end
          else
            begin
              reg120 <= (&$unsigned((-(reg122 ?
                  $signed(reg90) : reg96[(4'he):(3'h4)]))));
            end
        end
      if (reg96[(4'he):(4'h9)])
        begin
          reg126 <= (!$unsigned($signed(reg113)));
          reg127 <= wire84;
          reg128 <= (reg91 ^~ (~^reg121[(1'h0):(1'h0)]));
          reg129 <= (reg123[(3'h4):(1'h0)] <= $signed((((reg114 ?
                  reg97 : reg91) < (8'hb9)) ?
              reg114[(1'h0):(1'h0)] : (8'h9d))));
        end
      else
        begin
          if (($unsigned(wire80) == wire79))
            begin
              reg126 <= (wire84[(4'hf):(2'h3)] ?
                  ($unsigned((reg112[(1'h0):(1'h0)] && reg93[(2'h3):(1'h1)])) >> (!((!wire88) ?
                      (&wire88) : reg98[(1'h1):(1'h0)]))) : $unsigned({(~^((8'had) <= (8'haf)))}));
              reg127 <= reg83[(5'h10):(4'hf)];
              reg128 <= {$signed(reg124[(3'h6):(1'h0)])};
              reg129 <= (($signed(wire85) ^~ reg122) ?
                  wire85[(3'h7):(3'h6)] : (&reg115));
              reg130 <= (((((reg118 >> (8'hb1)) ?
                  (-reg97) : reg103[(4'h9):(3'h7)]) + {(wire108 ?
                      wire108 : reg93)}) * wire81) >= (+reg129[(4'h8):(3'h4)]));
            end
          else
            begin
              reg126 <= $signed($signed(((~&(wire116 ?
                  reg105 : (7'h41))) << $unsigned(reg83))));
              reg127 <= $signed($unsigned(($unsigned((8'ha6)) & reg93)));
              reg128 <= $unsigned($signed(($signed($unsigned(reg118)) ?
                  wire80 : (^{reg83, wire78}))));
              reg129 <= (^~reg113);
            end
          reg131 <= {($signed(((reg120 & reg98) ?
                  wire88 : wire86[(1'h0):(1'h0)])) >= reg120),
              reg129[(2'h2):(1'h0)]};
          reg132 <= $unsigned($signed(((^{wire89}) ?
              reg102[(3'h6):(3'h5)] : ((wire108 || reg131) ?
                  $unsigned(reg127) : reg121[(2'h2):(1'h0)]))));
        end
    end
  assign wire133 = {reg112};
  assign wire134 = ((wire108 ? wire87[(3'h7):(3'h4)] : reg99[(2'h3):(2'h2)]) ?
                       ($unsigned(((^reg99) ?
                           ((8'hb4) ?
                               reg94 : wire107) : (~|reg91))) <<< reg123[(1'h1):(1'h1)]) : reg83);
  assign wire135 = (8'hb8);
  assign wire136 = ($unsigned({reg104,
                       $signed(reg113)}) ~^ (~|reg123[(3'h4):(3'h4)]));
endmodule

module module60
#(parameter param74 = ((^((((7'h44) ? (8'ha0) : (7'h43)) < {(8'hb8)}) ? (!((8'hb7) <= (8'hba))) : ((~(7'h43)) <= (|(8'hb1))))) << {((+((8'ha5) - (8'hba))) ? ((^(8'ha3)) >= ((8'h9c) > (8'ha3))) : (((8'hbe) ? (8'h9d) : (8'hb7)) != (~|(8'hb5))))}))
(y, clk, wire64, wire63, wire62, wire61);
  output wire [(32'h7a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire64;
  input wire signed [(5'h11):(1'h0)] wire63;
  input wire signed [(3'h5):(1'h0)] wire62;
  input wire signed [(5'h10):(1'h0)] wire61;
  wire [(4'he):(1'h0)] wire73;
  wire [(3'h5):(1'h0)] wire72;
  wire signed [(5'h14):(1'h0)] wire71;
  wire [(2'h2):(1'h0)] wire70;
  wire [(4'hb):(1'h0)] wire69;
  wire [(5'h11):(1'h0)] wire68;
  wire [(5'h15):(1'h0)] wire67;
  wire signed [(4'hd):(1'h0)] wire66;
  wire [(5'h12):(1'h0)] wire65;
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 (1'h0)};
  assign wire65 = $unsigned((^$signed($unsigned({(8'ha3)}))));
  assign wire66 = wire62[(1'h1):(1'h1)];
  assign wire67 = {(wire65 > {({wire62, wire61} ?
                              (~wire65) : $unsigned(wire61))})};
  assign wire68 = {$signed((($unsigned(wire61) ?
                          (+wire67) : $signed(wire61)) + (~|(|wire67)))),
                      $unsigned((!((~^wire61) == (^~wire65))))};
  assign wire69 = $unsigned($unsigned($unsigned((wire68 ?
                      (|wire62) : (~wire61)))));
  assign wire70 = $signed({(wire66 ?
                          $signed($unsigned(wire69)) : (^wire61[(4'hb):(4'hb)])),
                      wire62});
  assign wire71 = $signed($signed(((wire70 + (+wire65)) & wire65[(2'h2):(1'h1)])));
  assign wire72 = $unsigned((wire67[(4'ha):(3'h4)] >>> ((((8'haa) & wire71) ?
                          $unsigned(wire62) : $signed(wire65)) ?
                      wire62[(2'h3):(1'h0)] : ((wire69 ? wire66 : wire69) ?
                          $signed(wire67) : (wire62 ? wire65 : wire61)))));
  assign wire73 = wire70;
endmodule

module module10  (y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h210):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire14;
  input wire [(5'h13):(1'h0)] wire13;
  input wire [(2'h3):(1'h0)] wire12;
  input wire [(4'ha):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire57;
  wire [(5'h10):(1'h0)] wire56;
  wire [(2'h2):(1'h0)] wire51;
  wire [(5'h15):(1'h0)] wire50;
  wire signed [(4'hf):(1'h0)] wire30;
  wire signed [(5'h15):(1'h0)] wire29;
  wire [(4'hc):(1'h0)] wire28;
  wire [(4'h9):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire26;
  wire [(4'hb):(1'h0)] wire25;
  wire [(3'h6):(1'h0)] wire23;
  wire [(3'h5):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire16;
  wire [(4'hc):(1'h0)] wire15;
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  reg [(4'h9):(1'h0)] reg48 = (1'h0);
  reg [(2'h2):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(4'hf):(1'h0)] reg41 = (1'h0);
  reg [(2'h2):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire51,
                 wire50,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire23,
                 wire22,
                 wire21,
                 wire16,
                 wire15,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
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
                 reg24,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire15 = wire14[(1'h0):(1'h0)];
  assign wire16 = $signed($unsigned($signed(wire11[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg17 <= $unsigned((~^{(-(wire12 ? (8'ha4) : wire16)),
          {(8'hbc), wire12[(2'h3):(1'h1)]}}));
      reg18 <= $signed($unsigned(($unsigned((~|(8'hb0))) - $signed($signed(wire11)))));
      reg19 <= wire14;
      reg20 <= ((((~&(|wire15)) <<< {reg17, wire16}) ?
              (wire14 ?
                  (-{(8'hbb),
                      (8'hbe)}) : (~&(wire15 ~^ reg17))) : ($unsigned(reg18) || (8'hb2))) ?
          wire15 : wire12[(1'h0):(1'h0)]);
    end
  assign wire21 = wire16[(3'h6):(1'h0)];
  assign wire22 = ({$signed(((+wire13) != (wire12 ? reg17 : wire16))),
                      (-(~^reg17))} * $unsigned(($unsigned($signed(wire15)) ?
                      ($unsigned(wire15) << $unsigned(wire15)) : reg19[(4'ha):(2'h2)])));
  assign wire23 = $unsigned(wire14[(3'h5):(1'h1)]);
  always
    @(posedge clk) begin
      reg24 <= $unsigned($unsigned($signed(reg19)));
    end
  assign wire25 = ($signed((^(~^(reg24 ? wire14 : wire11)))) ?
                      wire12 : $unsigned(((!reg17[(5'h14):(5'h12)]) ?
                          $signed(wire12[(2'h2):(2'h2)]) : $unsigned({wire14}))));
  assign wire26 = $unsigned($unsigned({(&{reg20})}));
  assign wire27 = $unsigned($signed((-(!(wire26 && wire22)))));
  assign wire28 = $signed($signed((wire13[(5'h11):(2'h3)] >>> $signed(((8'hac) ?
                      wire15 : wire25)))));
  assign wire29 = wire11[(3'h6):(3'h4)];
  assign wire30 = wire13[(3'h5):(3'h4)];
  always
    @(posedge clk) begin
      reg31 <= (8'hb5);
      reg32 <= (wire16 && wire28);
      reg33 <= wire25;
      reg34 <= (~wire21[(3'h6):(3'h6)]);
      if (($unsigned((&reg18[(2'h2):(1'h1)])) != $signed(($unsigned(((8'h9d) < (8'hae))) <= (((8'hb5) ?
          wire11 : reg20) ~^ (wire15 == wire25))))))
        begin
          if ($signed(({(8'had)} ? $signed((&$unsigned(reg17))) : (~^(8'hb8)))))
            begin
              reg35 <= $unsigned(wire13);
            end
          else
            begin
              reg35 <= wire14;
              reg36 <= $signed(wire25);
              reg37 <= $unsigned($unsigned($unsigned($signed((~wire29)))));
              reg38 <= $unsigned(reg32);
              reg39 <= $signed(wire25[(3'h6):(2'h3)]);
            end
        end
      else
        begin
          if ((($unsigned($signed($unsigned(wire22))) ?
                  (|reg18) : (|wire14[(4'h9):(3'h6)])) ?
              reg39 : ((-$signed(reg38)) ?
                  $unsigned(wire22) : reg35[(3'h4):(2'h2)])))
            begin
              reg35 <= (|(((((8'ha3) ? reg18 : wire30) ^ $unsigned(reg33)) ?
                  $signed(reg37) : $signed((wire26 ?
                      (8'ha1) : reg39))) <= $signed(wire15[(4'h8):(2'h3)])));
              reg36 <= $unsigned(wire23[(3'h5):(3'h5)]);
              reg37 <= $unsigned({$unsigned(((reg24 == (7'h40)) ?
                      (reg18 ? reg36 : wire16) : $signed((8'haa))))});
              reg38 <= $signed((!{$unsigned((reg20 >> wire28))}));
              reg39 <= $signed(reg32);
            end
          else
            begin
              reg35 <= ((^~(^reg17)) <= ({{$signed((7'h40))},
                  (((8'hbc) ? reg36 : wire25) ?
                      {wire21,
                          reg38} : reg17[(5'h10):(3'h7)])} + (($signed(reg20) + wire22) ?
                  (~^wire21) : (reg37 ? (&(7'h40)) : (7'h44)))));
              reg36 <= $signed(wire13[(4'h8):(2'h2)]);
              reg37 <= (reg36 >= $unsigned((reg17 + $signed((wire26 ?
                  reg24 : reg19)))));
              reg38 <= $signed((wire13 ?
                  (wire28 ?
                      wire12[(2'h2):(1'h0)] : ((&reg38) + $signed(reg37))) : wire28[(4'h9):(3'h6)]));
              reg39 <= $unsigned((wire16[(3'h7):(3'h6)] ?
                  reg39 : (^~((&wire15) * $unsigned(wire29)))));
            end
          if ({reg37[(4'hc):(4'hb)]})
            begin
              reg40 <= (({{reg36[(4'ha):(2'h2)]}} == ($signed((wire15 != reg20)) * ((reg36 ?
                      wire11 : (8'ha1)) ?
                  (~^reg38) : reg34[(4'h8):(3'h7)]))) <<< $unsigned({wire23,
                  ($unsigned(wire22) != (~&reg35))}));
            end
          else
            begin
              reg40 <= (($signed($signed($signed(wire12))) ^ wire23[(1'h0):(1'h0)]) ?
                  $signed($signed((~(reg18 >>> reg20)))) : (({$unsigned(reg24)} ?
                          (&{reg33}) : ((reg24 && (8'hb3)) ?
                              {wire27, reg34} : wire21)) ?
                      {wire30,
                          reg36} : $signed((((8'ha4) <<< (8'ha8)) != $signed(wire11)))));
              reg41 <= reg35[(3'h6):(3'h4)];
              reg42 <= (reg39 == reg33);
            end
          reg43 <= (reg42[(3'h6):(2'h2)] ?
              wire25 : ((+($unsigned((8'hb0)) | $unsigned(reg38))) ?
                  wire25 : (reg32 >> wire14[(3'h7):(2'h3)])));
          if (reg18)
            begin
              reg44 <= (|reg42);
              reg45 <= reg31[(4'he):(4'hc)];
            end
          else
            begin
              reg44 <= wire14;
              reg45 <= ((^wire15) <= $signed(reg18));
              reg46 <= ((reg18 * $signed(reg44)) ^~ $unsigned((&(wire22[(3'h5):(3'h4)] ?
                  (~|reg39) : $unsigned((8'hb2))))));
              reg47 <= (8'hb5);
              reg48 <= ((~$unsigned(((wire27 ?
                      reg24 : reg46) == $unsigned(wire30)))) ?
                  {reg35[(4'hf):(2'h3)],
                      reg17} : ((|$signed({wire26})) | ((!wire21) ?
                      reg31[(3'h7):(3'h6)] : wire16[(3'h6):(1'h1)])));
            end
          reg49 <= $unsigned($signed(({{(8'hbb)}, $signed(reg36)} ?
              {reg40, wire30} : ((reg39 | wire29) + wire22[(1'h0):(1'h0)]))));
        end
    end
  assign wire50 = $signed((reg18[(1'h0):(1'h0)] ?
                      ((!$signed(wire12)) ?
                          (reg34[(4'hc):(2'h3)] & $signed(wire12)) : ((&(8'ha3)) ?
                              wire26 : {reg38,
                                  reg20})) : ($signed($signed(reg34)) ?
                          ((reg39 ? reg34 : wire15) ^ {wire12}) : reg42)));
  assign wire51 = ($signed(wire50) > reg42[(5'h10):(4'he)]);
  always
    @(posedge clk) begin
      reg52 <= wire26[(4'he):(4'h9)];
      if ($signed($signed(($unsigned(reg47) ?
          {(!reg39)} : $signed((wire29 ? (8'hab) : reg48))))))
        begin
          reg53 <= (wire51[(1'h0):(1'h0)] ?
              (|$signed(($signed(reg34) ?
                  (wire25 * wire25) : (-reg45)))) : (~&(-($signed(reg39) <<< $signed(reg38)))));
        end
      else
        begin
          reg53 <= wire11;
          reg54 <= (($signed((-(reg53 ?
                  reg39 : reg48))) << $signed(($signed(wire25) ?
                  {reg35, wire16} : $unsigned(wire11)))) ?
              wire27[(2'h2):(1'h1)] : ((reg42 < $unsigned((wire27 != wire22))) ?
                  (((|wire13) ?
                      (wire26 + reg40) : ((8'hbc) >>> reg24)) ^ ((reg38 & wire28) >> (reg45 || reg24))) : $signed($unsigned({reg46}))));
          reg55 <= wire22;
        end
    end
  assign wire56 = ((($signed(wire30[(4'he):(4'h8)]) ^~ ((wire16 >> reg32) ?
                          wire28 : $unsigned(wire22))) <<< (8'ha1)) ?
                      (~&reg18[(2'h3):(1'h0)]) : ($signed((wire16[(2'h3):(1'h0)] ?
                          (+(8'hb1)) : (8'ha5))) & ((7'h43) ?
                          ((reg36 ? wire28 : reg39) >= (wire16 ?
                              wire22 : reg46)) : (wire27 >= (reg52 >= (8'ha7))))));
  assign wire57 = $unsigned(reg55[(3'h4):(2'h3)]);
endmodule
