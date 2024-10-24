module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire240;
  wire [(4'hd):(1'h0)] wire239;
  wire signed [(5'h13):(1'h0)] wire238;
  wire signed [(2'h2):(1'h0)] wire236;
  wire [(4'hf):(1'h0)] wire5;
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  assign y = {wire240, wire239, wire238, wire236, wire5, reg7, reg6, (1'h0)};
  assign wire5 = (wire0[(2'h2):(2'h2)] ?
                     $signed(wire2[(4'hf):(2'h3)]) : $signed((~{(wire2 <<< wire2)})));
  always
    @(posedge clk) begin
      reg6 <= $signed($unsigned(((8'hac) < wire2)));
      reg7 <= {({({wire2, reg6} <= $unsigned(wire3)),
              (|(reg6 ?
                  (7'h41) : (8'hb1)))} << ($unsigned(reg6[(4'h8):(3'h7)]) || ((reg6 ?
              (8'h9d) : (8'h9d)) != (-wire0))))};
    end
  module8 #() modinst237 (wire236, clk, wire0, wire3, reg7, reg6);
  assign wire238 = ($signed(wire3[(4'ha):(1'h0)]) ?
                       $signed(wire4) : $signed({(7'h43),
                           {reg6[(2'h3):(1'h0)], wire3[(4'he):(4'hc)]}}));
  assign wire239 = ((^~wire1) ?
                       wire0 : $unsigned(((~^$signed(wire3)) ?
                           $signed(wire0) : wire3)));
  assign wire240 = wire4[(1'h1):(1'h0)];
endmodule

module module8
#(parameter param234 = (8'hbf), 
parameter param235 = (^param234))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h15e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire12;
  input wire signed [(5'h13):(1'h0)] wire11;
  input wire signed [(5'h15):(1'h0)] wire10;
  input wire [(4'hc):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire233;
  wire [(5'h13):(1'h0)] wire232;
  wire signed [(5'h11):(1'h0)] wire231;
  wire [(4'hb):(1'h0)] wire230;
  wire signed [(4'hd):(1'h0)] wire228;
  wire signed [(2'h3):(1'h0)] wire226;
  wire signed [(5'h11):(1'h0)] wire191;
  wire signed [(4'h9):(1'h0)] wire189;
  wire signed [(3'h4):(1'h0)] wire172;
  wire signed [(5'h13):(1'h0)] wire171;
  wire [(4'hf):(1'h0)] wire170;
  wire [(5'h13):(1'h0)] wire168;
  wire signed [(4'h9):(1'h0)] wire112;
  wire signed [(5'h12):(1'h0)] wire111;
  wire [(5'h13):(1'h0)] wire109;
  wire [(5'h13):(1'h0)] wire53;
  wire signed [(4'hd):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire13;
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg113 = (1'h0);
  reg [(3'h6):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg115 = (1'h0);
  reg [(3'h7):(1'h0)] reg116 = (1'h0);
  assign y = {wire233,
                 wire232,
                 wire231,
                 wire230,
                 wire228,
                 wire226,
                 wire191,
                 wire189,
                 wire172,
                 wire171,
                 wire170,
                 wire168,
                 wire112,
                 wire111,
                 wire109,
                 wire53,
                 wire14,
                 wire13,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg113,
                 reg114,
                 reg115,
                 reg116,
                 (1'h0)};
  assign wire13 = $unsigned($unsigned($unsigned($signed((~|wire12)))));
  assign wire14 = ({$signed($signed(wire10[(3'h4):(1'h1)])),
                          (wire9 ?
                              wire11 : ((wire9 ^~ wire9) ?
                                  $unsigned(wire11) : ((8'hb1) ?
                                      wire9 : wire10)))} ?
                      (!($signed(wire10) >> wire9[(4'h8):(4'h8)])) : (wire13 ?
                          (8'hb1) : $signed(((wire13 || (8'haa)) ?
                              wire12[(4'hf):(4'hc)] : (wire12 == wire10)))));
  always
    @(posedge clk) begin
      reg15 <= $unsigned($signed(wire13));
      reg16 <= $unsigned((-(~wire9)));
      reg17 <= (^wire9[(4'h9):(4'h9)]);
      reg18 <= {reg16[(4'hc):(3'h4)]};
      reg19 <= reg18[(4'hf):(3'h7)];
    end
  module20 #() modinst54 (.wire23(reg16), .wire21(reg18), .wire25(wire13), .wire22(reg19), .wire24(wire11), .y(wire53), .clk(clk));
  module55 #() modinst110 (.wire60(wire10), .wire59(wire9), .clk(clk), .wire57(wire12), .wire56(reg17), .wire58(wire13), .y(wire109));
  assign wire111 = (^(|$signed($unsigned((reg15 ? (8'ha9) : wire53)))));
  assign wire112 = ($signed((((8'ha3) ? wire9 : $unsigned((8'hb3))) ?
                           (wire111[(5'h12):(2'h3)] ?
                               reg15[(1'h0):(1'h0)] : $signed(wire53)) : $signed((reg17 + reg16)))) ?
                       ($unsigned(reg19[(2'h2):(1'h1)]) ?
                           $unsigned($signed($unsigned(reg15))) : reg19) : (~^(+reg19)));
  always
    @(posedge clk) begin
      reg113 <= (-reg19[(2'h3):(2'h2)]);
      reg114 <= (((!reg17) ? wire13 : wire112) > (~^(8'hab)));
      reg115 <= wire13[(4'hc):(4'h9)];
      reg116 <= {$unsigned(wire12),
          $signed($unsigned(({wire111, wire9} ?
              $unsigned(reg17) : wire111[(4'h9):(3'h7)])))};
    end
  module117 #() modinst169 (wire168, clk, wire9, wire11, wire14, wire10, reg114);
  assign wire170 = $unsigned($signed($signed(reg17[(4'h9):(4'h9)])));
  assign wire171 = $unsigned(wire112);
  assign wire172 = $unsigned(($unsigned((8'hbd)) <= reg114[(3'h6):(1'h0)]));
  module173 #() modinst190 (.y(wire189), .wire174(reg17), .clk(clk), .wire177(reg19), .wire175(wire9), .wire176(wire12));
  assign wire191 = ((^~$unsigned(((wire171 ? reg18 : wire171) ?
                           $unsigned(wire172) : (^~(8'hba))))) ?
                       $signed(($signed(reg17[(4'h9):(2'h2)]) ?
                           (7'h40) : ($signed(wire10) & (wire170 <<< wire13)))) : $signed({((~&(8'hb3)) ^ (wire12 <= wire170))}));
  module192 #() modinst227 (.wire194(wire171), .wire195(wire12), .y(wire226), .wire197(reg115), .wire196(wire168), .clk(clk), .wire193(wire10));
  module20 #() modinst229 (.wire23(wire170), .wire24(wire11), .wire22(reg115), .wire21(wire14), .wire25(wire171), .y(wire228), .clk(clk));
  assign wire230 = wire171;
  assign wire231 = $unsigned($signed((wire11[(4'hd):(2'h3)] + (^(8'hba)))));
  assign wire232 = ((wire13 * wire13[(3'h4):(2'h3)]) * wire11);
  assign wire233 = (wire53[(4'ha):(3'h7)] ?
                       {reg18} : (wire228 ?
                           (+$unsigned(wire11)) : $signed(($signed(wire10) | $signed(reg16)))));
endmodule

module module192
#(parameter param224 = (8'hb0), 
parameter param225 = ((({(param224 * (8'h9e))} < (|(8'ha8))) ? param224 : param224) ? {{(|(~&param224)), {((7'h44) ? param224 : param224), (param224 ^ param224)}}, (!param224)} : (&(^~(&(&param224))))))
(y, clk, wire197, wire196, wire195, wire194, wire193);
  output wire [(32'h13e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire197;
  input wire [(5'h13):(1'h0)] wire196;
  input wire signed [(5'h10):(1'h0)] wire195;
  input wire [(4'ha):(1'h0)] wire194;
  input wire signed [(4'ha):(1'h0)] wire193;
  wire [(5'h10):(1'h0)] wire223;
  wire signed [(5'h14):(1'h0)] wire222;
  wire [(5'h10):(1'h0)] wire221;
  wire signed [(4'ha):(1'h0)] wire216;
  wire [(5'h15):(1'h0)] wire215;
  wire signed [(4'he):(1'h0)] wire214;
  wire [(5'h13):(1'h0)] wire213;
  wire [(3'h7):(1'h0)] wire212;
  wire signed [(4'h8):(1'h0)] wire211;
  wire signed [(4'h8):(1'h0)] wire210;
  wire [(2'h3):(1'h0)] wire209;
  wire [(5'h12):(1'h0)] wire208;
  wire signed [(3'h6):(1'h0)] wire207;
  wire signed [(4'hd):(1'h0)] wire206;
  wire signed [(4'ha):(1'h0)] wire205;
  wire [(3'h5):(1'h0)] wire204;
  wire signed [(5'h15):(1'h0)] wire203;
  wire [(2'h3):(1'h0)] wire202;
  wire [(3'h6):(1'h0)] wire201;
  wire [(4'he):(1'h0)] wire200;
  wire [(5'h10):(1'h0)] wire199;
  wire [(5'h10):(1'h0)] wire198;
  reg signed [(4'he):(1'h0)] reg220 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg219 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg218 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg217 = (1'h0);
  assign y = {wire223,
                 wire222,
                 wire221,
                 wire216,
                 wire215,
                 wire214,
                 wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 (1'h0)};
  assign wire198 = wire195[(4'ha):(4'h8)];
  assign wire199 = (|{((wire197[(2'h2):(1'h1)] >>> wire198[(2'h3):(2'h3)]) ?
                           $signed((wire198 ? wire197 : wire194)) : wire193),
                       (wire195[(4'h8):(2'h2)] == $signed($unsigned(wire198)))});
  assign wire200 = $signed((8'ha7));
  assign wire201 = ((^$unsigned(wire193[(2'h2):(1'h0)])) ?
                       wire193[(1'h0):(1'h0)] : (8'hbb));
  assign wire202 = wire197;
  assign wire203 = ($unsigned($unsigned($signed((~&wire193)))) <= wire193[(4'h8):(3'h5)]);
  assign wire204 = ((~($signed((wire201 ~^ (8'ha2))) ?
                       wire201 : wire203[(4'hb):(4'h8)])) <= (!wire193[(1'h1):(1'h0)]));
  assign wire205 = $signed($signed($signed((^wire195))));
  assign wire206 = (((wire195 + wire202[(2'h2):(2'h2)]) || {$signed((~&wire197))}) << ($signed(wire204[(3'h5):(3'h4)]) & (+$signed(wire201))));
  assign wire207 = wire205;
  assign wire208 = ($unsigned($unsigned(wire205)) ?
                       ({wire198[(3'h5):(1'h0)]} != $unsigned(wire198[(3'h5):(1'h0)])) : (-(!((~^wire202) < $unsigned(wire202)))));
  assign wire209 = $unsigned($unsigned(((wire197[(1'h0):(1'h0)] ?
                       $signed(wire208) : (wire207 ?
                           wire201 : wire195)) ^~ ((^~wire193) <= (wire195 & wire200)))));
  assign wire210 = (|$signed((((wire196 | wire193) > (wire207 ?
                       wire205 : wire194)) + wire198[(4'h9):(3'h6)])));
  assign wire211 = (wire208 ?
                       wire200[(4'he):(3'h6)] : (wire205 ?
                           wire208 : $signed(($unsigned(wire201) == (wire201 ?
                               wire193 : wire198)))));
  assign wire212 = {$signed($signed($unsigned((wire193 == wire197)))),
                       wire196[(4'ha):(1'h0)]};
  assign wire213 = $signed(($unsigned(wire196) >>> wire204));
  assign wire214 = wire210[(3'h6):(3'h5)];
  assign wire215 = ({{$unsigned((wire202 ? wire207 : wire205))}} ?
                       ((wire198 > wire194[(4'h9):(3'h7)]) ?
                           wire212[(3'h4):(3'h4)] : $signed(wire197[(4'hb):(3'h6)])) : {$unsigned((wire196[(2'h2):(1'h0)] > (8'hab))),
                           {wire212}});
  assign wire216 = wire206;
  always
    @(posedge clk) begin
      if ({$unsigned(wire196), (wire197 ^~ wire196)})
        begin
          reg217 <= (($unsigned(((wire202 >>> wire216) || $unsigned(wire204))) ^ ($unsigned($signed(wire197)) ?
              (-{wire199}) : (!wire211))) < $unsigned($signed(wire214)));
          reg218 <= $unsigned((&wire212[(2'h3):(1'h0)]));
          reg219 <= $signed(($signed((!{wire195})) << $unsigned($signed($unsigned(wire202)))));
        end
      else
        begin
          reg217 <= $signed(($signed((|{wire209,
              wire198})) << $signed(($unsigned(wire210) ?
              (wire203 >= wire205) : {(8'hab), (8'h9d)}))));
          reg218 <= $signed({$unsigned(($unsigned(wire199) >= (^~wire204))),
              ($unsigned((+wire212)) ? {(^reg219)} : (~$signed(wire211)))});
          reg219 <= ($signed((^~(+$signed(reg219)))) + $signed($signed($unsigned(reg219[(4'he):(1'h1)]))));
          reg220 <= {((|(-$unsigned(reg218))) ? wire196 : wire196)};
        end
    end
  assign wire221 = ($unsigned(wire201[(3'h4):(1'h0)]) ?
                       (|wire204[(3'h5):(1'h1)]) : (($unsigned(reg220[(3'h4):(2'h2)]) ?
                           wire201[(3'h6):(1'h0)] : (~|{wire203})) | wire200[(4'he):(3'h5)]));
  assign wire222 = {$unsigned(wire193[(4'ha):(3'h5)]), wire213};
  assign wire223 = wire204[(2'h2):(2'h2)];
endmodule

module module173  (y, clk, wire177, wire176, wire175, wire174);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire177;
  input wire signed [(2'h2):(1'h0)] wire176;
  input wire [(4'hc):(1'h0)] wire175;
  input wire signed [(5'h11):(1'h0)] wire174;
  wire [(3'h6):(1'h0)] wire188;
  wire [(4'h9):(1'h0)] wire187;
  wire signed [(5'h15):(1'h0)] wire186;
  wire [(3'h4):(1'h0)] wire185;
  wire [(4'hb):(1'h0)] wire184;
  wire signed [(3'h4):(1'h0)] wire183;
  wire [(4'ha):(1'h0)] wire182;
  wire [(5'h10):(1'h0)] wire181;
  wire [(5'h13):(1'h0)] wire180;
  wire signed [(2'h2):(1'h0)] wire179;
  wire signed [(4'h8):(1'h0)] wire178;
  assign y = {wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 (1'h0)};
  assign wire178 = ($unsigned(wire175) ?
                       ((&(wire175 || $signed(wire176))) <= $signed(wire175[(4'hb):(4'h9)])) : (($unsigned((~wire175)) - (wire177[(4'h9):(1'h0)] ?
                           (^wire177) : (wire177 ?
                               wire176 : wire177))) << wire174));
  assign wire179 = {wire175};
  assign wire180 = (~|$signed($signed($unsigned($unsigned(wire176)))));
  assign wire181 = $signed($signed(wire179[(1'h1):(1'h0)]));
  assign wire182 = $unsigned((&($unsigned((wire177 || wire176)) ?
                       $signed((!wire175)) : wire177[(3'h7):(3'h7)])));
  assign wire183 = ({($unsigned($unsigned((8'hbc))) >> $unsigned(wire176))} * (($signed({wire175}) ?
                       {(|wire179), (wire178 ? wire178 : (8'ha3))} : ({wire174,
                               wire178} ?
                           (wire178 > wire182) : (wire176 ?
                               wire180 : wire181))) <<< wire180));
  assign wire184 = $unsigned(((~^wire175[(1'h1):(1'h0)]) - ((-(&wire179)) && (~|(wire176 ?
                       wire181 : wire182)))));
  assign wire185 = (^{(+wire174),
                       ($signed(wire174[(4'he):(4'hb)]) <= $signed($unsigned(wire184)))});
  assign wire186 = (((~(!(7'h41))) ?
                           (|(&wire177[(3'h5):(2'h3)])) : (&(wire182[(2'h3):(1'h0)] + (wire179 && wire177)))) ?
                       $unsigned(wire181[(2'h2):(1'h0)]) : (^(|$signed(wire180))));
  assign wire187 = wire181;
  assign wire188 = wire184;
endmodule

module module117  (y, clk, wire122, wire121, wire120, wire119, wire118);
  output wire [(32'h1f0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire122;
  input wire [(2'h3):(1'h0)] wire121;
  input wire signed [(3'h6):(1'h0)] wire120;
  input wire signed [(5'h11):(1'h0)] wire119;
  input wire signed [(3'h5):(1'h0)] wire118;
  wire [(5'h15):(1'h0)] wire167;
  wire [(5'h11):(1'h0)] wire166;
  wire signed [(4'he):(1'h0)] wire165;
  wire [(5'h13):(1'h0)] wire164;
  wire [(5'h12):(1'h0)] wire163;
  wire [(4'he):(1'h0)] wire162;
  wire [(4'h8):(1'h0)] wire161;
  wire signed [(2'h2):(1'h0)] wire151;
  wire [(5'h13):(1'h0)] wire150;
  wire signed [(2'h2):(1'h0)] wire134;
  wire [(4'hf):(1'h0)] wire133;
  wire signed [(4'hb):(1'h0)] wire129;
  wire signed [(3'h6):(1'h0)] wire128;
  wire [(4'hf):(1'h0)] wire127;
  wire signed [(5'h12):(1'h0)] wire126;
  wire [(5'h15):(1'h0)] wire125;
  wire signed [(5'h12):(1'h0)] wire124;
  wire signed [(4'he):(1'h0)] wire123;
  reg signed [(4'h8):(1'h0)] reg160 = (1'h0);
  reg [(5'h11):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg158 = (1'h0);
  reg [(4'hb):(1'h0)] reg157 = (1'h0);
  reg [(4'h8):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg155 = (1'h0);
  reg [(3'h4):(1'h0)] reg154 = (1'h0);
  reg [(3'h5):(1'h0)] reg153 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg149 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg145 = (1'h0);
  reg [(3'h7):(1'h0)] reg144 = (1'h0);
  reg [(3'h4):(1'h0)] reg143 = (1'h0);
  reg [(4'h9):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg140 = (1'h0);
  reg [(3'h7):(1'h0)] reg139 = (1'h0);
  reg [(3'h6):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg137 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg135 = (1'h0);
  reg [(4'h8):(1'h0)] reg132 = (1'h0);
  reg [(4'h9):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg130 = (1'h0);
  assign y = {wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire151,
                 wire150,
                 wire134,
                 wire133,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
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
                 reg132,
                 reg131,
                 reg130,
                 (1'h0)};
  assign wire123 = (+$signed(wire121));
  assign wire124 = $unsigned((($unsigned((wire120 ? wire123 : (8'h9f))) ?
                           $signed($signed((8'h9f))) : $signed({wire120})) ?
                       (~|(~|wire119)) : (wire118[(2'h3):(2'h2)] > $signed((!wire120)))));
  assign wire125 = ($unsigned(wire122) << (&(^~(~$unsigned((8'h9f))))));
  assign wire126 = wire125;
  assign wire127 = (~|{$signed(wire118),
                       $unsigned(($unsigned(wire118) || $signed(wire125)))});
  assign wire128 = ($signed(((((8'haf) >>> wire119) - $signed(wire124)) + wire126[(4'h9):(2'h3)])) ^ {(|($signed(wire118) ^~ ((8'ha2) >>> wire121)))});
  assign wire129 = {((-{(~|wire128), $signed(wire118)}) * ((|{wire119}) ?
                           ((-wire122) << ((8'ha1) - wire123)) : $unsigned(wire118[(1'h1):(1'h1)])))};
  always
    @(posedge clk) begin
      reg130 <= ($signed((wire124[(4'hd):(4'ha)] ?
          wire120[(2'h3):(2'h2)] : {(wire127 ? wire122 : wire125),
              $signed((7'h43))})) >>> (!{$unsigned($unsigned(wire123))}));
      reg131 <= wire120;
      reg132 <= ((((~|$signed(wire127)) & (~^$unsigned(wire126))) ?
              (((wire121 && wire123) < (wire123 << wire124)) * (reg131 ?
                  {wire123} : wire126[(5'h11):(4'hb)])) : (reg131 ?
                  wire125 : (^$signed(wire119)))) ?
          $signed((8'ha4)) : $unsigned(wire129[(4'hb):(2'h2)]));
    end
  assign wire133 = (wire127[(4'hd):(2'h3)] ?
                       (~&($signed((reg131 == (8'ha5))) ?
                           ((-wire124) ?
                               wire124[(3'h7):(2'h3)] : (wire124 ?
                                   wire129 : reg132)) : (&wire121))) : wire129[(1'h0):(1'h0)]);
  assign wire134 = ((wire126 * (-$unsigned($signed(wire127)))) ?
                       (~&(((reg131 ?
                               wire129 : wire121) >= $unsigned(wire118)) ?
                           wire124 : wire127[(4'hc):(3'h4)])) : $signed((~&(wire122[(2'h2):(1'h0)] ^~ (7'h41)))));
  always
    @(posedge clk) begin
      if ({$unsigned($signed(wire120))})
        begin
          reg135 <= wire124;
          reg136 <= (($unsigned(wire127) ?
              (((wire129 == wire133) - (^(8'hbc))) ?
                  ($signed((8'hae)) ?
                      (reg135 ? reg131 : wire127) : ((8'ha1) ?
                          wire133 : wire121)) : (~|(~|wire127))) : ({wire127,
                      {wire127}} ?
                  wire122[(2'h3):(1'h0)] : wire125[(5'h10):(3'h4)])) >>> (-reg131[(3'h7):(1'h1)]));
          reg137 <= wire118;
        end
      else
        begin
          if ($signed($signed($unsigned({wire122,
              (reg135 ? (8'ha8) : wire124)}))))
            begin
              reg135 <= $unsigned(((wire129[(1'h1):(1'h0)] ^~ ((~&wire122) ?
                  wire118 : wire127)) ~^ $unsigned((wire123[(3'h6):(3'h4)] ?
                  $signed(reg136) : $unsigned(wire125)))));
              reg136 <= (~&(~&wire119[(4'he):(4'hc)]));
              reg137 <= $signed($unsigned((+$signed($unsigned(wire121)))));
              reg138 <= $signed(((reg137[(4'hd):(4'ha)] + wire123[(3'h6):(2'h2)]) ^~ $unsigned(wire126)));
            end
          else
            begin
              reg135 <= $unsigned($signed($signed(wire123)));
              reg136 <= $unsigned(($signed(wire120[(1'h0):(1'h0)]) * $signed(wire122)));
              reg137 <= wire125[(3'h6):(3'h5)];
            end
          reg139 <= wire125;
        end
      if ($signed(wire129))
        begin
          reg140 <= ((&($signed(reg135) ~^ $signed((reg139 ?
              reg136 : wire123)))) || $signed($signed($unsigned((wire128 != (8'ha4))))));
          if ($unsigned({{{$unsigned(wire121)}}}))
            begin
              reg141 <= $unsigned($signed(wire129[(4'h8):(4'h8)]));
              reg142 <= $signed((reg132[(3'h4):(2'h2)] >= ((~^$unsigned(wire125)) * ($signed(wire126) ~^ $unsigned(wire133)))));
              reg143 <= (($signed(reg138[(3'h6):(1'h0)]) ?
                      (~&($signed(reg139) ?
                          (wire120 ?
                              wire121 : reg140) : reg141)) : wire119[(4'ha):(3'h4)]) ?
                  (wire125 >= wire120[(3'h5):(1'h0)]) : (~|(($signed(wire124) ?
                      reg138[(3'h6):(1'h0)] : $unsigned(reg131)) <= reg142)));
            end
          else
            begin
              reg141 <= wire123[(3'h7):(3'h6)];
              reg142 <= ($signed($signed((reg135 ?
                      $unsigned(reg142) : wire125[(3'h5):(2'h2)]))) ?
                  $signed((~^(wire124[(3'h4):(3'h4)] ?
                      wire121 : wire124[(5'h11):(5'h10)]))) : $unsigned($signed((wire121[(2'h3):(2'h3)] ?
                      reg136[(2'h3):(1'h1)] : (wire120 && (8'h9c))))));
              reg143 <= wire120;
              reg144 <= (wire120 ?
                  {(wire121 * wire118)} : $signed(($signed(reg140) * {{reg131},
                      $signed(wire121)})));
              reg145 <= (8'ha6);
            end
        end
      else
        begin
          reg140 <= (8'hb6);
          reg141 <= $unsigned(wire127[(2'h3):(1'h1)]);
          reg142 <= reg145;
        end
    end
  always
    @(posedge clk) begin
      reg146 <= $signed((((~$signed((8'hae))) ?
              ((wire120 ?
                  (8'hba) : wire128) >= ((7'h40) < wire134)) : {(8'ha8)}) ?
          (8'ha9) : $signed($signed(wire120[(3'h4):(1'h0)]))));
      reg147 <= wire128[(2'h3):(2'h3)];
      reg148 <= reg141[(2'h3):(2'h3)];
      reg149 <= {wire123,
          {{((wire125 ? wire129 : reg148) > $signed(reg147))},
              (wire125[(5'h10):(5'h10)] || (~&(reg130 ? reg138 : reg136)))}};
    end
  assign wire150 = reg142;
  assign wire151 = reg130;
  always
    @(posedge clk) begin
      if (({$unsigned(($unsigned(reg137) ? (^(7'h41)) : (^(8'hb8)))),
          $signed({(~^wire134), $signed((8'haf))})} <<< (~^reg142)))
        begin
          reg152 <= $unsigned($unsigned($signed($unsigned(((8'h9d) ?
              wire150 : reg147)))));
          reg153 <= reg135[(2'h3):(1'h1)];
          if (($signed((~|((wire129 * (8'ha3)) - (-reg138)))) ?
              (!wire123) : (8'hb8)))
            begin
              reg154 <= $signed((8'hb7));
              reg155 <= (~{$signed($signed(wire151))});
            end
          else
            begin
              reg154 <= $signed($signed((~&reg141)));
              reg155 <= ($unsigned($unsigned((^~$signed(wire133)))) ?
                  (wire134[(1'h0):(1'h0)] || $signed((~|$signed(reg154)))) : (^(((wire125 * reg148) ?
                          (reg139 > (8'had)) : wire150[(4'hd):(4'h8)]) ?
                      (|$signed(reg131)) : wire122[(2'h2):(1'h0)])));
              reg156 <= wire128;
              reg157 <= {wire119[(1'h0):(1'h0)]};
              reg158 <= $unsigned(($signed($unsigned(wire129)) && reg135));
            end
          reg159 <= (^reg143);
          reg160 <= (8'hac);
        end
      else
        begin
          reg152 <= (!(&(~$signed($unsigned(reg136)))));
          reg153 <= (-(8'ha0));
          if (wire134)
            begin
              reg154 <= $unsigned(reg148[(3'h6):(3'h4)]);
              reg155 <= (8'h9f);
              reg156 <= reg140;
            end
          else
            begin
              reg154 <= {({({reg156} ?
                          reg140[(1'h1):(1'h1)] : {(8'hab), reg147}),
                      ((~^wire129) ?
                          (wire128 | wire127) : reg146)} >= (reg146[(3'h6):(2'h2)] ^~ (reg131[(3'h7):(3'h4)] | (reg138 ?
                      reg137 : reg154))))};
              reg155 <= {$unsigned($signed((wire125[(2'h3):(2'h2)] ?
                      {(8'hbb)} : (wire125 ? reg141 : reg160))))};
              reg156 <= (reg138[(1'h0):(1'h0)] <= {wire120[(2'h3):(1'h1)],
                  wire124[(5'h11):(3'h4)]});
            end
          reg157 <= ((reg135[(2'h3):(1'h1)] != ((reg147 & (wire151 || reg147)) ^~ {(&(8'ha3)),
              (~|reg156)})) && {((|(reg160 < wire127)) || $unsigned($unsigned(wire128))),
              (8'had)});
          reg158 <= (&reg147[(1'h0):(1'h0)]);
        end
    end
  assign wire161 = $unsigned((reg156[(3'h7):(3'h6)] ?
                       reg135[(3'h4):(1'h0)] : (+({reg131} ?
                           (reg130 >> reg140) : reg132))));
  assign wire162 = (&$unsigned($unsigned($unsigned((~^wire122)))));
  assign wire163 = ((wire151[(1'h0):(1'h0)] - (8'hbc)) ?
                       $unsigned($unsigned(reg137[(2'h3):(1'h1)])) : ($unsigned(wire129) ?
                           ($unsigned((wire162 < reg146)) <<< reg149[(3'h4):(1'h1)]) : ((reg137 >>> (reg137 ^ reg154)) - wire129)));
  assign wire164 = $signed(reg149[(2'h2):(1'h0)]);
  assign wire165 = (wire122 ? ($signed((7'h40)) > wire118) : (7'h43));
  assign wire166 = (-(8'hba));
  assign wire167 = $unsigned($signed((~^reg157)));
endmodule

module module55
#(parameter param107 = (!(&(|{(&(8'had)), ((8'hb5) ? (8'hbc) : (8'ha0))}))), 
parameter param108 = {((param107 + (param107 * {(8'ha9), param107})) <= (((~&param107) ? (^param107) : (8'haa)) ? (param107 ? (-param107) : (&param107)) : ({param107, (8'hac)} ? (param107 >= param107) : (|(8'hbd))))), ((+(~|(param107 > (8'hb6)))) ? ({(param107 ? param107 : param107), (param107 >= param107)} ? (param107 ? (param107 ? param107 : param107) : {param107, param107}) : ({param107, param107} ? ((8'hb1) ? (8'hbf) : param107) : ((8'hbb) ^ param107))) : {param107})})
(y, clk, wire60, wire59, wire58, wire57, wire56);
  output wire [(32'h227):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire60;
  input wire signed [(2'h3):(1'h0)] wire59;
  input wire [(4'hc):(1'h0)] wire58;
  input wire [(2'h3):(1'h0)] wire57;
  input wire signed [(4'h9):(1'h0)] wire56;
  wire [(4'hb):(1'h0)] wire106;
  wire signed [(5'h15):(1'h0)] wire105;
  wire signed [(5'h13):(1'h0)] wire104;
  wire [(4'ha):(1'h0)] wire103;
  wire [(4'h9):(1'h0)] wire102;
  wire signed [(3'h4):(1'h0)] wire101;
  wire [(4'he):(1'h0)] wire100;
  wire [(5'h12):(1'h0)] wire99;
  wire signed [(3'h4):(1'h0)] wire98;
  wire [(5'h14):(1'h0)] wire97;
  wire [(5'h13):(1'h0)] wire91;
  wire [(4'hf):(1'h0)] wire90;
  wire signed [(4'h8):(1'h0)] wire76;
  wire signed [(4'he):(1'h0)] wire75;
  wire signed [(4'he):(1'h0)] wire74;
  wire [(5'h15):(1'h0)] wire73;
  wire [(4'h8):(1'h0)] wire72;
  wire signed [(4'hf):(1'h0)] wire62;
  wire signed [(5'h15):(1'h0)] wire61;
  reg signed [(3'h6):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg89 = (1'h0);
  reg [(4'hb):(1'h0)] reg88 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg87 = (1'h0);
  reg [(4'h9):(1'h0)] reg86 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg84 = (1'h0);
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg82 = (1'h0);
  reg [(2'h2):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg80 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg79 = (1'h0);
  reg [(3'h6):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg70 = (1'h0);
  reg [(5'h13):(1'h0)] reg69 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg67 = (1'h0);
  reg [(3'h7):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg65 = (1'h0);
  reg [(4'hd):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg63 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire91,
                 wire90,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire62,
                 wire61,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
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
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 (1'h0)};
  assign wire61 = $unsigned(wire56);
  assign wire62 = $signed(wire58[(3'h5):(1'h1)]);
  always
    @(posedge clk) begin
      reg63 <= $unsigned(((wire62[(4'hd):(1'h1)] && (wire62[(1'h0):(1'h0)] ?
              $signed((8'hb1)) : {wire61})) ?
          $unsigned(((7'h43) ? $signed(wire60) : (!wire57))) : wire56));
      if ($unsigned(($unsigned(((!wire60) <= (wire59 ?
          wire56 : wire60))) != wire57)))
        begin
          reg64 <= $unsigned(((reg63[(1'h0):(1'h0)] != wire57) ?
              $unsigned({(wire59 && wire56)}) : $signed(wire56)));
          reg65 <= reg64[(3'h4):(1'h1)];
          reg66 <= {(wire60[(4'h8):(2'h3)] ?
                  (~&{wire56[(3'h6):(1'h0)],
                      $unsigned(wire61)}) : $unsigned($unsigned(((7'h41) ?
                      wire60 : wire61)))),
              (wire56[(2'h3):(1'h1)] ?
                  $signed(wire61[(4'hd):(3'h7)]) : (((~&wire57) ?
                          wire58[(1'h1):(1'h1)] : ((8'hae) - (8'haf))) ?
                      wire58 : wire58))};
        end
      else
        begin
          reg64 <= (($signed(wire61) ^~ $unsigned(wire59)) <= wire62[(4'hb):(3'h4)]);
          reg65 <= reg63;
          if (wire61[(4'h8):(1'h1)])
            begin
              reg66 <= $signed((^$unsigned((|reg66))));
              reg67 <= wire60;
              reg68 <= (($unsigned(wire59) ?
                      (((~&reg64) ?
                          $signed(wire62) : wire60) > (~&(reg67 * wire58))) : ($signed($signed(wire61)) - reg65[(4'hc):(4'h9)])) ?
                  (reg67 * (reg67[(4'he):(4'ha)] ?
                      ($unsigned(reg63) ?
                          $signed(reg64) : wire58) : (+wire59[(2'h2):(2'h2)]))) : ((|$signed(reg63)) ?
                      $unsigned(($signed(reg65) ?
                          $unsigned(reg64) : $unsigned(reg67))) : $signed(wire57)));
              reg69 <= wire59[(2'h3):(1'h0)];
            end
          else
            begin
              reg66 <= $unsigned(($unsigned(wire61) ~^ $signed((reg69[(3'h4):(1'h0)] || (!reg66)))));
              reg67 <= (!reg67);
            end
          reg70 <= (^{($unsigned(reg69[(1'h0):(1'h0)]) ?
                  {{reg68, (7'h43)}} : (~^reg63[(2'h2):(2'h2)])),
              ((-$unsigned(wire61)) || wire62)});
          reg71 <= ({wire60[(4'hb):(1'h0)]} ?
              wire59 : $unsigned(((7'h43) * reg68[(3'h6):(2'h3)])));
        end
    end
  assign wire72 = (wire56 && $signed($signed(((reg67 ?
                      wire61 : wire60) - $signed(reg71)))));
  assign wire73 = (reg66[(1'h1):(1'h1)] > ({{(wire56 == wire56)}} ?
                      $signed((reg68[(2'h3):(1'h0)] >= $signed(wire59))) : $signed(reg67)));
  assign wire74 = {$signed((+(~^wire60[(4'ha):(3'h4)]))), (wire59 >= (8'ha6))};
  assign wire75 = ($unsigned(((~&wire59[(2'h2):(2'h2)]) ?
                          (~wire62[(4'h9):(3'h7)]) : $signed($signed(wire62)))) ?
                      wire74[(4'hc):(3'h5)] : ($unsigned(reg71) ?
                          $unsigned((~(~&reg69))) : $signed((!(wire72 ?
                              (7'h43) : wire57)))));
  assign wire76 = (wire56 ?
                      $signed(reg68[(4'ha):(4'ha)]) : $signed(reg63[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      if (($unsigned(((!$signed(wire75)) ? $unsigned($signed(reg65)) : reg68)) ?
          {$signed($unsigned($signed(wire72)))} : ($unsigned($unsigned(wire61)) ?
              wire60 : reg71[(2'h2):(1'h0)])))
        begin
          reg77 <= (wire73[(4'hb):(1'h0)] ?
              ((((wire59 - wire74) ? (&wire58) : $signed(reg71)) ?
                  wire59[(2'h2):(1'h0)] : (-wire76[(1'h1):(1'h1)])) ^~ wire60[(3'h5):(2'h3)]) : $unsigned((~|((wire60 == wire72) != ((8'h9c) ?
                  wire56 : wire60)))));
          reg78 <= (8'hae);
        end
      else
        begin
          reg77 <= (~({$unsigned((~&wire59))} ?
              (reg69 > $unsigned((reg71 >> wire75))) : reg77));
          reg78 <= wire58;
          reg79 <= (^({((reg67 ^~ wire61) ?
                      {reg68} : (wire73 ? reg64 : wire62))} ?
              {$unsigned(reg70[(4'h8):(1'h1)]), $signed(wire56)} : reg64));
          if ($unsigned($unsigned((^~reg78))))
            begin
              reg80 <= $signed((|(+($signed(wire74) ?
                  (reg71 ? wire57 : wire76) : $signed(wire57)))));
              reg81 <= (($unsigned(reg67[(3'h5):(3'h5)]) == (^$unsigned($signed(wire62)))) <<< $signed(reg63));
            end
          else
            begin
              reg80 <= $unsigned((8'hb3));
            end
          reg82 <= wire60;
        end
      if ($unsigned(($unsigned({((8'ha8) << wire60),
          (^(8'ha4))}) & $unsigned($signed($signed(reg66))))))
        begin
          reg83 <= (8'hb6);
          reg84 <= ($signed($unsigned(reg64[(4'h8):(2'h2)])) || ((&{$signed(reg79)}) ^ ($unsigned($unsigned(reg78)) ^~ $unsigned({reg80}))));
          reg85 <= $signed((wire56 ~^ {$unsigned($signed(wire73)),
              $signed(((8'ha8) ? reg68 : (8'h9d)))}));
        end
      else
        begin
          if ($unsigned(wire58[(1'h0):(1'h0)]))
            begin
              reg83 <= reg80[(2'h3):(1'h0)];
              reg84 <= ((wire74[(4'hc):(4'hc)] ?
                      {(~&$signed(wire75))} : wire59) ?
                  wire59 : $unsigned(((wire74 ?
                      $unsigned(reg69) : (reg65 ?
                          reg69 : reg81)) ~^ (+wire75))));
              reg85 <= reg69[(3'h6):(3'h6)];
            end
          else
            begin
              reg83 <= (reg68[(2'h2):(1'h1)] - (!((~&{(8'hb4)}) ?
                  ($signed(wire62) != reg83[(2'h2):(2'h2)]) : ((8'ha0) ?
                      $unsigned(wire61) : (~^reg85)))));
              reg84 <= wire59;
              reg85 <= ($unsigned((+((reg81 <= wire61) ?
                  (wire75 ?
                      reg67 : wire74) : (~&wire58)))) >>> ({$unsigned((+reg67))} ^~ $signed((+reg69))));
              reg86 <= wire75;
            end
          reg87 <= (reg65[(4'hb):(3'h6)] >>> (^$unsigned(reg70[(4'h9):(4'h8)])));
        end
      reg88 <= ($signed($signed(((wire60 | reg69) ?
          reg63[(1'h0):(1'h0)] : $signed(reg87)))) << (8'ha0));
      reg89 <= (-reg83[(2'h3):(2'h3)]);
    end
  assign wire90 = reg87;
  assign wire91 = (8'hbd);
  always
    @(posedge clk) begin
      reg92 <= wire59[(1'h0):(1'h0)];
      if ({$signed((({reg65,
              wire91} * $signed(wire75)) != ($unsigned((8'hae)) >> (|wire56)))),
          $signed({(wire90[(4'ha):(4'ha)] ?
                  $signed(wire91) : (wire73 | (8'ha1))),
              $signed($signed((8'h9e)))})})
        begin
          if ((^~(wire62 > ((8'hb6) == (+(reg84 ? reg63 : reg86))))))
            begin
              reg93 <= (~|wire74[(4'hb):(3'h7)]);
              reg94 <= wire59[(2'h3):(2'h3)];
            end
          else
            begin
              reg93 <= reg66[(1'h0):(1'h0)];
              reg94 <= {((($signed(wire58) == (reg86 - wire90)) ?
                          wire76 : reg92) ?
                      (-$unsigned(reg65)) : $unsigned(((reg67 - reg83) && ((8'had) ?
                          reg83 : reg85))))};
            end
        end
      else
        begin
          if (({$unsigned($unsigned((wire60 ? reg71 : wire58))),
              reg79[(3'h4):(2'h3)]} > (((wire62[(1'h0):(1'h0)] ?
              $unsigned(reg68) : {(8'ha0),
                  wire61}) | (~^$unsigned(reg71))) - ({reg71, (-reg80)} ?
              $signed(((8'hb4) ? (8'had) : reg83)) : wire59))))
            begin
              reg93 <= (~^wire56);
            end
          else
            begin
              reg93 <= $signed($signed({reg89[(1'h1):(1'h1)],
                  $signed((^~(8'ha0)))}));
              reg94 <= $unsigned($signed((~|wire60[(4'h8):(2'h2)])));
            end
          reg95 <= (reg84[(4'hd):(3'h5)] ?
              ((8'ha1) != {($signed(reg63) ?
                      $unsigned(reg85) : (-reg66))}) : ({wire59[(1'h1):(1'h0)]} ?
                  reg87 : (-(|(|(8'h9c))))));
          reg96 <= $signed(reg81);
        end
    end
  assign wire97 = ((8'ha0) ? $unsigned($signed(wire91)) : reg94);
  assign wire98 = $signed($unsigned((reg77 ?
                      (^$unsigned(reg92)) : $unsigned({reg64}))));
  assign wire99 = wire72[(2'h3):(1'h0)];
  assign wire100 = wire59[(1'h0):(1'h0)];
  assign wire101 = wire73;
  assign wire102 = $signed($signed(reg93));
  assign wire103 = $signed($unsigned(reg80[(3'h4):(1'h0)]));
  assign wire104 = $signed(((&$unsigned(wire101)) ^ ((wire90 ?
                       (+reg84) : wire60[(5'h10):(4'hc)]) <= (~(reg70 && reg88)))));
  assign wire105 = {(~$signed(((~wire98) ?
                           $unsigned(reg92) : $signed(reg93))))};
  assign wire106 = ((~|$signed(wire105)) ? reg88 : reg86[(3'h7):(3'h7)]);
endmodule

module module20
#(parameter param52 = (((|(^(8'hb5))) ~^ ((~&(8'hb3)) ^~ {((7'h43) | (8'ha7))})) ? ((({(8'ha3), (8'ha4)} ? ((7'h43) <= (8'hba)) : ((8'hae) < (7'h41))) <<< ((~^(8'ha6)) > ((8'ha0) ? (8'hbc) : (8'hb1)))) >= (({(7'h44)} ? {(8'hb4), (8'hba)} : (~&(7'h44))) ? {((8'hb1) + (8'h9d))} : {{(8'hba)}})) : (-(({(8'hb4)} & (+(8'ha3))) || (((8'h9d) > (8'hb1)) ? ((8'hbd) ? (8'hb9) : (8'hac)) : ((8'ha8) ? (8'ha0) : (8'hb2)))))))
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h151):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire25;
  input wire signed [(4'h9):(1'h0)] wire24;
  input wire signed [(4'hd):(1'h0)] wire23;
  input wire signed [(4'h8):(1'h0)] wire22;
  input wire [(4'hd):(1'h0)] wire21;
  wire signed [(4'he):(1'h0)] wire49;
  wire [(4'hc):(1'h0)] wire48;
  wire [(4'he):(1'h0)] wire45;
  wire signed [(4'hc):(1'h0)] wire44;
  wire signed [(5'h11):(1'h0)] wire43;
  wire [(4'hb):(1'h0)] wire39;
  wire [(4'hc):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire32;
  wire [(5'h10):(1'h0)] wire31;
  wire signed [(5'h13):(1'h0)] wire30;
  wire [(4'hb):(1'h0)] wire29;
  wire [(3'h6):(1'h0)] wire28;
  wire [(3'h4):(1'h0)] wire27;
  wire signed [(5'h13):(1'h0)] wire26;
  reg [(2'h3):(1'h0)] reg51 = (1'h0);
  reg [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire45,
                 wire44,
                 wire43,
                 wire39,
                 wire38,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 reg51,
                 reg50,
                 reg47,
                 reg46,
                 reg42,
                 reg41,
                 reg40,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire26 = wire21[(4'hb):(3'h6)];
  assign wire27 = {wire21};
  assign wire28 = (($signed((wire23[(4'h8):(3'h4)] >= ((8'ha1) ?
                      wire25 : wire24))) || (!{(wire21 ?
                          (7'h41) : wire23)})) && wire23);
  assign wire29 = {{(^~((wire24 > wire27) ? ((8'ha2) ^ wire21) : wire21)),
                          wire27},
                      wire21};
  assign wire30 = (((wire22 | ($signed(wire22) > wire27[(1'h0):(1'h0)])) && $unsigned(wire24)) + wire25);
  assign wire31 = wire21;
  assign wire32 = (wire29[(3'h7):(3'h5)] ?
                      (^$signed({wire31[(4'hb):(3'h6)]})) : $signed($signed($unsigned($unsigned(wire27)))));
  always
    @(posedge clk) begin
      if (wire23)
        begin
          if (wire24[(4'h8):(3'h6)])
            begin
              reg33 <= (wire27 ?
                  wire32[(3'h7):(2'h3)] : ($signed(wire23) ?
                      ($signed(wire26[(2'h2):(1'h0)]) ?
                          (^(wire29 && wire30)) : $unsigned($unsigned(wire32))) : wire24));
              reg34 <= wire27;
              reg35 <= ((~|$unsigned($unsigned((wire25 ?
                  wire22 : reg34)))) >= (~&$unsigned($signed($unsigned(wire31)))));
              reg36 <= wire32[(4'he):(3'h5)];
            end
          else
            begin
              reg33 <= {wire27, wire31};
              reg34 <= ($signed({((~|reg33) + {wire23,
                      wire30})}) || (~$unsigned((reg36[(3'h6):(1'h0)] << $signed((8'ha0))))));
              reg35 <= $unsigned($signed(($unsigned((wire25 <= wire26)) ?
                  $unsigned((8'ha2)) : (~{wire31, (8'hb8)}))));
              reg36 <= wire26;
              reg37 <= (~^(~&reg33));
            end
        end
      else
        begin
          reg33 <= wire28[(2'h3):(2'h2)];
          reg34 <= wire28[(1'h0):(1'h0)];
          reg35 <= $signed($signed((wire25 != $unsigned($unsigned((8'hae))))));
        end
    end
  assign wire38 = reg33[(1'h1):(1'h1)];
  assign wire39 = wire31;
  always
    @(posedge clk) begin
      reg40 <= (!(wire29[(3'h7):(1'h1)] ?
          (~$signed((wire26 ? reg36 : wire22))) : wire23[(3'h4):(3'h4)]));
    end
  always
    @(posedge clk) begin
      reg41 <= {$unsigned($signed(((^~wire22) < ((8'hba) ^~ reg33)))),
          reg40[(3'h6):(2'h2)]};
      reg42 <= ((wire31[(5'h10):(4'hf)] >>> ({{wire26,
                  (8'ha4)}} <= {$unsigned(wire22), $signed(wire23)})) ?
          ((((wire38 ? wire27 : wire32) ? {reg33} : $signed(reg35)) ?
              wire30 : wire23[(2'h3):(1'h0)]) != (wire24 && (~|reg37))) : ((wire31[(4'he):(4'hb)] ~^ (wire26[(3'h7):(1'h0)] ?
                  ((8'hb8) ? wire30 : wire29) : (~reg37))) ?
              {$signed({reg41}), wire21} : (wire28 >>> $unsigned(wire28))));
    end
  assign wire43 = ($unsigned((~({wire25} ?
                      (!(8'hb7)) : (wire32 ?
                          reg37 : reg40)))) ^~ $unsigned((wire24 ?
                      $signed(wire22) : (-wire39))));
  assign wire44 = wire23;
  assign wire45 = $signed($signed($unsigned({{wire22, wire43}})));
  always
    @(posedge clk) begin
      reg46 <= ($unsigned($signed($signed($unsigned((8'ha3))))) << (($signed(((8'h9d) ?
          wire31 : wire28)) <<< wire44) >= $unsigned(((wire21 ?
          (8'haa) : wire32) <= $unsigned(reg41)))));
      reg47 <= $signed(($unsigned(reg36) ?
          (|{$signed(wire45)}) : ((^~(reg34 + reg34)) ?
              (!{(8'hba), reg36}) : ((wire32 ?
                  wire45 : wire22) ^~ $unsigned(wire27)))));
    end
  assign wire48 = (wire21[(4'hd):(3'h4)] | {wire21, wire25});
  assign wire49 = ((~|reg40[(4'hd):(4'hc)]) ?
                      $signed((($signed(wire21) > {reg33}) ?
                          $signed({(8'haa)}) : (&(~|wire39)))) : wire22);
  always
    @(posedge clk) begin
      reg50 <= ($unsigned(wire43[(4'he):(4'h8)]) >> (wire32 < reg47[(4'hc):(3'h4)]));
      reg51 <= $signed(wire21[(3'h7):(3'h7)]);
    end
endmodule
