module top
#(parameter param227 = ((~&(^~(+((8'hb6) > (8'hb1))))) >> ({{((7'h42) ~^ (8'h9e))}, (|((7'h43) == (8'ha3)))} ? (!(~(~|(8'hb7)))) : {((^(8'h9c)) - ((7'h41) || (8'ha5)))})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h153):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire226;
  wire [(5'h10):(1'h0)] wire224;
  wire [(5'h15):(1'h0)] wire223;
  wire [(4'hc):(1'h0)] wire222;
  wire signed [(4'he):(1'h0)] wire221;
  wire signed [(3'h7):(1'h0)] wire220;
  wire [(2'h2):(1'h0)] wire219;
  wire [(5'h14):(1'h0)] wire218;
  wire [(5'h12):(1'h0)] wire216;
  wire [(4'hb):(1'h0)] wire209;
  wire [(5'h10):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire10;
  wire signed [(5'h10):(1'h0)] wire11;
  wire signed [(2'h3):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire207;
  reg signed [(2'h2):(1'h0)] reg210 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg211 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg212 = (1'h0);
  reg [(5'h13):(1'h0)] reg213 = (1'h0);
  reg [(5'h11):(1'h0)] reg214 = (1'h0);
  reg [(4'hc):(1'h0)] reg215 = (1'h0);
  assign y = {wire226,
                 wire224,
                 wire223,
                 wire222,
                 wire221,
                 wire220,
                 wire219,
                 wire218,
                 wire216,
                 wire209,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire207,
                 reg210,
                 reg211,
                 reg212,
                 reg213,
                 reg214,
                 reg215,
                 (1'h0)};
  assign wire5 = wire3;
  assign wire6 = wire2[(1'h1):(1'h0)];
  assign wire7 = {wire0[(2'h2):(1'h1)], $unsigned(wire0[(1'h0):(1'h0)])};
  assign wire8 = (8'hb0);
  assign wire9 = (wire5[(4'hb):(4'hb)] ? wire2[(4'hd):(2'h2)] : wire8);
  assign wire10 = wire4;
  assign wire11 = $unsigned((wire7[(1'h1):(1'h1)] & {$unsigned(wire10[(1'h0):(1'h0)])}));
  assign wire12 = wire9;
  assign wire13 = $unsigned($signed(($unsigned($signed(wire4)) ?
                      (wire1 ?
                          wire12 : $signed(wire11)) : $signed(wire11[(4'hc):(1'h0)]))));
  assign wire14 = $signed((+((wire1[(3'h5):(3'h4)] | (~&wire13)) <<< (-$unsigned(wire11)))));
  module15 #() modinst208 (.wire18(wire14), .wire20(wire0), .wire19(wire11), .wire17(wire8), .wire16(wire9), .clk(clk), .y(wire207));
  assign wire209 = ({($unsigned((wire8 != wire0)) < ((~&wire7) ?
                           wire2 : $unsigned(wire6)))} & (wire4 || $unsigned(wire1[(4'hc):(1'h0)])));
  always
    @(posedge clk) begin
      reg210 <= (((!((!wire2) + wire6)) ?
          {((wire11 >>> (8'hae)) + wire14)} : (^wire209)) == wire14[(3'h7):(2'h3)]);
      reg211 <= (~|($signed(wire8[(3'h7):(3'h7)]) >>> (~^wire14[(4'hf):(4'hc)])));
    end
  always
    @(posedge clk) begin
      if ((&wire6))
        begin
          reg212 <= $signed(($unsigned(wire9[(4'h9):(3'h6)]) + wire9));
          reg213 <= reg212;
        end
      else
        begin
          reg212 <= reg213[(1'h0):(1'h0)];
          reg213 <= {wire13[(2'h2):(1'h1)]};
          reg214 <= $unsigned(((&(wire209[(1'h1):(1'h1)] ?
              (~&wire13) : (reg210 >> reg210))) >= reg213[(3'h4):(1'h0)]));
          reg215 <= wire11;
        end
    end
  module159 #() modinst217 (wire216, clk, wire2, reg214, wire6, wire9, wire11);
  assign wire218 = (wire216 ?
                       wire0 : (wire5[(4'h8):(3'h7)] ?
                           (~(reg215 < (wire9 ?
                               reg212 : wire6))) : {$signed((!wire209)),
                               $unsigned((~|wire216))}));
  assign wire219 = (reg211 >> (~(wire209[(1'h1):(1'h0)] <<< $signed((reg213 ?
                       wire8 : wire6)))));
  assign wire220 = (($signed($signed(wire9)) && wire8) ^~ (!wire3[(1'h1):(1'h0)]));
  assign wire221 = ($signed(wire12[(2'h2):(2'h2)]) ?
                       $signed($signed(($unsigned(wire6) <= (wire7 >>> reg213)))) : $signed($signed($unsigned($unsigned(wire2)))));
  assign wire222 = (($signed((|wire218[(4'hb):(4'ha)])) == (8'hbb)) && (~|wire0));
  assign wire223 = (wire219 & $signed((~^wire8[(4'hc):(4'ha)])));
  module115 #() modinst225 (.wire118(wire2), .y(wire224), .clk(clk), .wire116(wire216), .wire117(wire6), .wire119(wire219));
  assign wire226 = $signed(((($unsigned((8'hb7)) - (~&(8'hb0))) - {(~wire224)}) <<< $unsigned($signed((wire12 != reg212)))));
endmodule

module module15
#(parameter param206 = (-((8'hb1) || ({(&(8'hb7))} ? (((8'haf) >>> (8'ha8)) || (8'hb2)) : (7'h42)))))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h101):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire20;
  input wire signed [(5'h10):(1'h0)] wire19;
  input wire [(5'h15):(1'h0)] wire18;
  input wire signed [(4'hd):(1'h0)] wire17;
  input wire signed [(4'he):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire205;
  wire [(4'hb):(1'h0)] wire204;
  wire [(4'hd):(1'h0)] wire203;
  wire signed [(3'h5):(1'h0)] wire202;
  wire signed [(4'ha):(1'h0)] wire201;
  wire signed [(2'h3):(1'h0)] wire200;
  wire signed [(5'h14):(1'h0)] wire199;
  wire signed [(5'h14):(1'h0)] wire198;
  wire [(5'h15):(1'h0)] wire197;
  wire [(2'h3):(1'h0)] wire196;
  wire [(5'h14):(1'h0)] wire180;
  wire signed [(5'h12):(1'h0)] wire158;
  wire signed [(4'h8):(1'h0)] wire156;
  wire [(4'hf):(1'h0)] wire114;
  wire [(5'h11):(1'h0)] wire112;
  wire signed [(5'h12):(1'h0)] wire70;
  wire [(4'hd):(1'h0)] wire69;
  wire [(5'h10):(1'h0)] wire67;
  wire [(3'h5):(1'h0)] wire194;
  assign y = {wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire180,
                 wire158,
                 wire156,
                 wire114,
                 wire112,
                 wire70,
                 wire69,
                 wire67,
                 wire194,
                 (1'h0)};
  module21 #() modinst68 (wire67, clk, wire18, wire19, wire20, wire17);
  assign wire69 = ((~&$unsigned(((7'h41) >= {wire19,
                      wire67}))) && wire16[(3'h4):(3'h4)]);
  assign wire70 = wire67[(2'h3):(1'h1)];
  module71 #() modinst113 (.wire74(wire20), .wire72(wire69), .wire75(wire67), .clk(clk), .y(wire112), .wire73(wire19));
  assign wire114 = $signed((~|wire69));
  module115 #() modinst157 (.wire119(wire67), .y(wire156), .wire117(wire114), .clk(clk), .wire118(wire18), .wire116(wire70));
  assign wire158 = ((($signed($signed((8'hbe))) ?
                               $unsigned($signed((8'hbd))) : (~^(&wire18))) ?
                           {(wire70 <= (8'hb3))} : ((-(wire70 ?
                               wire156 : (7'h41))) > wire16)) ?
                       ($unsigned({((7'h44) || wire17)}) ?
                           wire20 : wire67) : $signed({wire67[(3'h4):(1'h1)],
                           (~^{(8'ha4)})}));
  module159 #() modinst181 (wire180, clk, wire19, wire112, wire16, wire69, wire20);
  module182 #() modinst195 (.wire186(wire20), .wire184(wire180), .y(wire194), .wire183(wire158), .wire187(wire16), .wire185(wire18), .clk(clk));
  assign wire196 = $unsigned((-$signed((wire18 & wire16))));
  assign wire197 = $unsigned((+wire19));
  assign wire198 = (~wire17);
  assign wire199 = $signed((wire69[(4'hb):(2'h2)] ?
                       (^~(^$unsigned(wire67))) : $signed(($unsigned(wire17) ?
                           wire20[(3'h7):(1'h0)] : wire17[(3'h6):(1'h1)]))));
  assign wire200 = wire156;
  assign wire201 = $unsigned($unsigned(wire69));
  assign wire202 = ($unsigned((&(wire198 ? wire67 : $signed(wire18)))) ?
                       ($unsigned(((wire20 * wire69) < (-wire114))) ?
                           $signed((~&wire16[(2'h3):(2'h3)])) : wire158[(1'h1):(1'h1)]) : (((&$unsigned(wire197)) < wire70) ?
                           wire200[(1'h0):(1'h0)] : $unsigned({$signed(wire156),
                               wire158[(3'h5):(3'h4)]})));
  assign wire203 = wire158;
  assign wire204 = wire17;
  assign wire205 = ((wire16 ?
                           wire158[(3'h7):(3'h5)] : (&$unsigned((~^wire199)))) ?
                       ({wire200[(1'h0):(1'h0)],
                               ((wire158 ^~ wire196) ?
                                   (^wire18) : $signed(wire156))} ?
                           $unsigned((+$signed(wire196))) : ((8'had) ^~ wire20[(2'h2):(2'h2)])) : $unsigned(wire200));
endmodule

module module182
#(parameter param193 = ((^~(((!(8'h9c)) ? ((8'ha8) - (8'hac)) : ((8'h9e) ? (8'hbf) : (8'hab))) + (~{(8'hab), (7'h42)}))) >>> ((7'h40) ^ (-{{(8'ha7), (8'ha7)}}))))
(y, clk, wire187, wire186, wire185, wire184, wire183);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire187;
  input wire signed [(5'h12):(1'h0)] wire186;
  input wire [(5'h15):(1'h0)] wire185;
  input wire [(3'h4):(1'h0)] wire184;
  input wire signed [(2'h3):(1'h0)] wire183;
  wire [(3'h6):(1'h0)] wire192;
  wire [(4'ha):(1'h0)] wire191;
  wire signed [(5'h10):(1'h0)] wire189;
  wire signed [(4'hb):(1'h0)] wire188;
  reg signed [(4'h9):(1'h0)] reg190 = (1'h0);
  assign y = {wire192, wire191, wire189, wire188, reg190, (1'h0)};
  assign wire188 = wire186[(4'hf):(3'h6)];
  assign wire189 = {wire188};
  always
    @(posedge clk) begin
      reg190 <= (((wire188 ?
              wire188[(1'h0):(1'h0)] : wire188[(4'ha):(3'h5)]) >> wire188[(2'h3):(1'h0)]) ?
          (((wire188 + $unsigned(wire186)) && (~|$signed(wire184))) == ((~&{wire184,
                  (8'haa)}) ?
              ($signed((8'hbd)) ?
                  (wire188 || wire186) : ((8'h9f) + wire184)) : (|wire188[(1'h0):(1'h0)]))) : (~&{(^~wire185)}));
    end
  assign wire191 = $unsigned(($signed(($signed((8'hb6)) << $signed(wire189))) ?
                       reg190[(3'h4):(1'h0)] : wire184[(2'h2):(1'h1)]));
  assign wire192 = ((((wire187 ? $signed(wire189) : wire188) ?
                               reg190 : wire186[(4'ha):(4'h8)]) ?
                           (~&(7'h40)) : ((wire186[(1'h1):(1'h1)] != $unsigned(wire191)) > (wire183[(1'h0):(1'h0)] ?
                               wire183 : wire184[(3'h4):(2'h3)]))) ?
                       (~(~^wire185)) : $signed((+$signed(reg190))));
endmodule

module module159
#(parameter param178 = (&(8'h9c)), 
parameter param179 = (param178 * ((param178 & ((!param178) ? (|param178) : ((8'hac) ? param178 : (8'hb6)))) ? (!(param178 ~^ ((8'ha9) ? param178 : (8'ha6)))) : ((~^{param178, param178}) ? (|(+param178)) : (((8'hbe) != (8'hb8)) ? (param178 ? (8'ha1) : param178) : param178)))))
(y, clk, wire164, wire163, wire162, wire161, wire160);
  output wire [(32'ha5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire164;
  input wire [(5'h11):(1'h0)] wire163;
  input wire [(4'he):(1'h0)] wire162;
  input wire signed [(3'h7):(1'h0)] wire161;
  input wire [(2'h2):(1'h0)] wire160;
  wire signed [(2'h2):(1'h0)] wire177;
  wire [(5'h14):(1'h0)] wire176;
  wire signed [(4'hf):(1'h0)] wire172;
  wire [(5'h14):(1'h0)] wire171;
  wire signed [(4'hf):(1'h0)] wire170;
  wire [(5'h10):(1'h0)] wire169;
  wire signed [(4'hb):(1'h0)] wire168;
  wire [(4'hd):(1'h0)] wire167;
  wire [(4'h9):(1'h0)] wire166;
  wire [(4'h8):(1'h0)] wire165;
  reg signed [(4'ha):(1'h0)] reg175 = (1'h0);
  reg [(5'h10):(1'h0)] reg174 = (1'h0);
  reg [(4'h9):(1'h0)] reg173 = (1'h0);
  assign y = {wire177,
                 wire176,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 reg175,
                 reg174,
                 reg173,
                 (1'h0)};
  assign wire165 = ($unsigned((8'hac)) ?
                       $unsigned(({wire164[(5'h10):(4'hf)], (~wire160)} ?
                           wire163[(3'h5):(3'h4)] : {(wire160 != wire164),
                               (wire164 ?
                                   wire161 : wire164)})) : wire160[(1'h1):(1'h0)]);
  assign wire166 = ($signed($unsigned(wire165[(3'h4):(2'h2)])) | {($unsigned({wire163}) >> (~|wire163)),
                       $signed({wire160, (~|wire160)})});
  assign wire167 = wire161;
  assign wire168 = ((!(wire163[(3'h7):(1'h0)] ?
                           $unsigned((~^(7'h42))) : ($signed(wire164) <= wire160))) ?
                       wire161[(2'h2):(2'h2)] : ((^((wire163 ?
                                   wire166 : wire166) ?
                               {wire162} : {wire161, wire162})) ?
                           (~^{{wire163}}) : wire160));
  assign wire169 = (~|$unsigned($unsigned((8'ha9))));
  assign wire170 = (&wire164[(3'h6):(1'h1)]);
  assign wire171 = wire169[(4'h8):(2'h2)];
  assign wire172 = {wire171[(3'h4):(2'h3)]};
  always
    @(posedge clk) begin
      reg173 <= wire166;
      reg174 <= wire163;
      reg175 <= wire166[(1'h1):(1'h1)];
    end
  assign wire176 = wire165[(3'h4):(1'h1)];
  assign wire177 = wire163;
endmodule

module module115  (y, clk, wire119, wire118, wire117, wire116);
  output wire [(32'h171):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire119;
  input wire [(4'he):(1'h0)] wire118;
  input wire signed [(4'hf):(1'h0)] wire117;
  input wire [(5'h12):(1'h0)] wire116;
  wire signed [(5'h12):(1'h0)] wire155;
  wire [(4'h9):(1'h0)] wire154;
  wire [(3'h4):(1'h0)] wire153;
  wire [(5'h12):(1'h0)] wire152;
  wire [(5'h12):(1'h0)] wire140;
  wire signed [(4'hd):(1'h0)] wire139;
  wire signed [(5'h10):(1'h0)] wire138;
  wire signed [(4'h8):(1'h0)] wire137;
  wire [(5'h15):(1'h0)] wire136;
  wire signed [(3'h4):(1'h0)] wire133;
  wire [(2'h3):(1'h0)] wire132;
  wire signed [(2'h2):(1'h0)] wire131;
  wire [(3'h4):(1'h0)] wire130;
  wire [(3'h7):(1'h0)] wire129;
  wire [(2'h2):(1'h0)] wire128;
  wire [(4'hf):(1'h0)] wire127;
  wire signed [(3'h4):(1'h0)] wire121;
  wire signed [(4'hc):(1'h0)] wire120;
  reg [(4'h9):(1'h0)] reg151 = (1'h0);
  reg [(3'h5):(1'h0)] reg150 = (1'h0);
  reg [(3'h5):(1'h0)] reg149 = (1'h0);
  reg [(3'h4):(1'h0)] reg148 = (1'h0);
  reg [(3'h7):(1'h0)] reg147 = (1'h0);
  reg [(5'h13):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg145 = (1'h0);
  reg [(4'hd):(1'h0)] reg144 = (1'h0);
  reg [(5'h14):(1'h0)] reg143 = (1'h0);
  reg [(3'h7):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg141 = (1'h0);
  reg [(3'h7):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg134 = (1'h0);
  reg [(5'h14):(1'h0)] reg126 = (1'h0);
  reg [(4'ha):(1'h0)] reg125 = (1'h0);
  reg [(3'h7):(1'h0)] reg124 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg122 = (1'h0);
  assign y = {wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire121,
                 wire120,
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
                 reg135,
                 reg134,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 (1'h0)};
  assign wire120 = $signed((!$unsigned($unsigned((-wire116)))));
  assign wire121 = wire117[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg122 <= $signed((-$signed((-wire116))));
      if ((wire121 == (+{wire116, wire119})))
        begin
          reg123 <= $signed(((+wire116) || $signed(wire118[(4'hc):(3'h6)])));
          reg124 <= wire116[(3'h4):(1'h0)];
        end
      else
        begin
          reg123 <= wire119;
          reg124 <= $signed($signed(reg124));
          reg125 <= wire121[(2'h2):(2'h2)];
        end
      reg126 <= ($signed((^~(+(reg122 | wire118)))) ?
          (wire116[(3'h5):(1'h1)] <= (|($signed((7'h41)) ?
              (reg124 ?
                  (8'had) : reg124) : $unsigned(reg122)))) : $unsigned(($unsigned((reg125 & reg124)) ^~ ((!wire121) ?
              reg122[(2'h3):(2'h3)] : (wire118 < reg123)))));
    end
  assign wire127 = (wire117[(4'h9):(2'h3)] < $signed(((~&reg126[(4'hc):(2'h3)]) ?
                       (!reg123[(3'h4):(1'h0)]) : $signed(reg126))));
  assign wire128 = (8'haf);
  assign wire129 = ($signed(reg125) ?
                       (+({reg122[(3'h4):(2'h3)]} ?
                           wire117 : wire119[(1'h0):(1'h0)])) : ($signed(wire120) == reg123));
  assign wire130 = {{$unsigned((^(wire127 ? (8'hbf) : wire128))),
                           ($signed((^wire116)) ?
                               ($signed(reg125) ^ (reg122 >= wire117)) : $unsigned({wire127,
                                   wire118}))}};
  assign wire131 = wire120[(3'h7):(2'h2)];
  assign wire132 = wire131;
  assign wire133 = {(($signed((wire117 ? wire128 : reg126)) ?
                           ((wire127 ?
                               wire120 : wire118) & reg122) : ((8'hb9) >> reg125[(4'h8):(4'h8)])) - (($signed(wire127) <<< $signed(reg124)) ^~ wire127))};
  always
    @(posedge clk) begin
      reg134 <= $unsigned(wire132);
      reg135 <= reg134[(3'h7):(3'h7)];
    end
  assign wire136 = (^~$unsigned((~|wire127[(3'h7):(1'h1)])));
  assign wire137 = wire117[(3'h4):(1'h0)];
  assign wire138 = wire117;
  assign wire139 = wire129[(3'h4):(3'h4)];
  assign wire140 = $signed(wire117[(4'hb):(4'h9)]);
  always
    @(posedge clk) begin
      reg141 <= $signed(reg126[(4'he):(4'h8)]);
      reg142 <= $unsigned({wire116, wire140[(5'h11):(5'h10)]});
      if (($unsigned((~^(~&(~^reg124)))) ?
          ((wire120 ?
              (~$signed(reg123)) : ((~&wire129) & {wire140})) >>> (wire127[(2'h2):(2'h2)] ^ (wire120 >= wire127[(4'h8):(1'h0)]))) : (~^reg122)))
        begin
          reg143 <= $unsigned(wire119);
          if ((^((~^(~^wire129[(3'h6):(3'h4)])) * wire132[(1'h0):(1'h0)])))
            begin
              reg144 <= $unsigned($signed((($unsigned(wire128) ?
                      reg143 : reg126) ?
                  reg141[(3'h5):(1'h1)] : wire116[(1'h1):(1'h0)])));
            end
          else
            begin
              reg144 <= $signed(wire139);
            end
        end
      else
        begin
          reg143 <= $signed($unsigned((wire132[(2'h2):(1'h1)] ?
              (~^(reg144 < reg125)) : $signed($signed((8'ha6))))));
          reg144 <= wire127;
          reg145 <= ((wire131 ?
              (^~$unsigned(wire136[(4'hf):(4'h9)])) : ((((8'h9f) > reg142) ?
                      (~^reg123) : {reg142}) ?
                  $unsigned((|wire137)) : wire137)) - $signed({(~&(^~reg135)),
              (wire118[(1'h1):(1'h1)] >> (reg141 < (8'hb7)))}));
          reg146 <= (~&(~((^$unsigned(wire136)) != ($unsigned(wire120) ~^ $signed((8'h9f))))));
          if (wire117)
            begin
              reg147 <= $signed($unsigned((({wire130, wire116} & {wire131}) ?
                  wire138 : ($signed(wire139) ^~ {reg141, reg123}))));
              reg148 <= wire131[(1'h0):(1'h0)];
              reg149 <= (&wire132[(1'h0):(1'h0)]);
              reg150 <= {({(reg125 | $signed(reg143)),
                          ((reg144 >= reg147) == $signed(wire130))} ?
                      {wire137} : wire138[(1'h0):(1'h0)]),
                  $signed((wire131[(1'h0):(1'h0)] <<< ($unsigned((8'hab)) || {wire133,
                      reg135})))};
            end
          else
            begin
              reg147 <= wire117[(4'hd):(3'h4)];
            end
        end
      reg151 <= (wire128 ?
          ($signed($signed((-wire117))) >>> (wire130[(2'h3):(2'h2)] || ($unsigned(reg146) || (reg149 ^~ reg150)))) : $signed((~|((reg124 ?
                  reg126 : wire116) ?
              (wire139 > wire116) : ((8'hab) <= reg141)))));
    end
  assign wire152 = reg125;
  assign wire153 = $signed(reg148[(2'h2):(1'h1)]);
  assign wire154 = $unsigned((!$unsigned((8'h9d))));
  assign wire155 = $unsigned((~|($unsigned(wire121[(3'h4):(3'h4)]) >= wire117)));
endmodule

module module71
#(parameter param110 = {(~({(~&(8'ha5)), ((8'h9f) && (7'h42))} ? (^((8'hb6) ? (8'hb4) : (8'hb5))) : (^(+(8'hb3)))))}, 
parameter param111 = {((|(~param110)) ? {(((8'hbf) <<< (7'h41)) ? (~param110) : (param110 ? param110 : param110))} : ({(8'hab), {param110, param110}} ? (((8'ha8) ? param110 : param110) * {param110, param110}) : ((^param110) & {param110, param110}))), ({(-{param110, param110}), ((-param110) ? (~&param110) : (param110 + param110))} ? param110 : ((~|(param110 ? param110 : param110)) || (~&param110)))})
(y, clk, wire75, wire74, wire73, wire72);
  output wire [(32'h1f1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire75;
  input wire signed [(5'h10):(1'h0)] wire74;
  input wire signed [(4'hd):(1'h0)] wire73;
  input wire signed [(4'hd):(1'h0)] wire72;
  wire [(4'hf):(1'h0)] wire109;
  wire signed [(4'ha):(1'h0)] wire108;
  wire signed [(5'h11):(1'h0)] wire107;
  wire signed [(3'h4):(1'h0)] wire106;
  wire [(4'hf):(1'h0)] wire105;
  wire signed [(4'ha):(1'h0)] wire101;
  wire signed [(3'h4):(1'h0)] wire100;
  wire signed [(4'hf):(1'h0)] wire99;
  wire signed [(5'h12):(1'h0)] wire98;
  wire [(5'h14):(1'h0)] wire97;
  wire [(5'h11):(1'h0)] wire96;
  wire [(5'h11):(1'h0)] wire95;
  wire [(4'hf):(1'h0)] wire94;
  wire signed [(4'he):(1'h0)] wire93;
  wire signed [(4'hf):(1'h0)] wire92;
  wire [(5'h12):(1'h0)] wire91;
  wire [(5'h11):(1'h0)] wire79;
  wire [(4'hb):(1'h0)] wire78;
  wire signed [(4'he):(1'h0)] wire77;
  wire [(5'h11):(1'h0)] wire76;
  reg [(4'he):(1'h0)] reg104 = (1'h0);
  reg [(5'h12):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg102 = (1'h0);
  reg [(4'he):(1'h0)] reg90 = (1'h0);
  reg [(5'h14):(1'h0)] reg89 = (1'h0);
  reg [(4'he):(1'h0)] reg88 = (1'h0);
  reg [(3'h6):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg86 = (1'h0);
  reg [(5'h11):(1'h0)] reg85 = (1'h0);
  reg [(4'ha):(1'h0)] reg84 = (1'h0);
  reg [(4'hd):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg80 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 reg104,
                 reg103,
                 reg102,
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
                 (1'h0)};
  assign wire76 = wire74;
  assign wire77 = wire72;
  assign wire78 = ((($signed((wire72 > wire77)) ^ ((wire74 & wire74) ?
                          $unsigned(wire73) : wire72)) != $signed((|(&wire75)))) ?
                      (-((|{(8'had)}) ?
                          ($unsigned(wire75) ?
                              (wire72 ?
                                  wire75 : (8'ha6)) : $unsigned(wire72)) : wire74)) : ((-((wire77 ?
                                  wire74 : wire72) ?
                              (~&wire74) : (wire76 ? wire75 : wire77))) ?
                          $signed($signed(wire74[(4'hf):(4'ha)])) : wire74));
  assign wire79 = ((!$unsigned($unsigned(wire72[(3'h4):(2'h2)]))) ?
                      {$unsigned((-wire78[(3'h7):(3'h7)]))} : ((wire73[(4'ha):(4'h9)] >> ($signed(wire73) ?
                              (wire77 | (8'ha1)) : (!(8'hb0)))) ?
                          (wire76[(1'h1):(1'h1)] ?
                              wire78 : wire77[(4'he):(2'h3)]) : $unsigned(wire72)));
  always
    @(posedge clk) begin
      if ($unsigned((~(($unsigned(wire79) >>> ((8'haf) ?
          wire76 : wire75)) ^ {$unsigned((8'ha8))}))))
        begin
          reg80 <= (~&(!({wire73[(2'h2):(1'h1)]} ?
              $signed((^wire77)) : $unsigned((~|wire74)))));
          reg81 <= (wire73 ?
              {(~($unsigned(wire72) << (-wire73)))} : (({wire72[(3'h7):(1'h0)],
                          {(8'hae)}} ?
                      wire79 : $unsigned((wire79 ? wire72 : wire75))) ?
                  ((wire77 ? $unsigned(reg80) : $signed(wire74)) ?
                      {reg80[(4'hc):(3'h4)],
                          ((8'hbe) ?
                              wire72 : wire72)} : (8'ha6)) : $unsigned(((!wire78) < (~(8'ha0))))));
          reg82 <= $unsigned(wire77);
          if ($unsigned((((~^(~^(8'ha7))) ?
                  $unsigned((wire73 ? wire72 : wire72)) : ({reg80} & (wire77 ?
                      wire79 : wire73))) ?
              $unsigned(reg80) : reg80[(4'hb):(3'h4)])))
            begin
              reg83 <= wire76;
            end
          else
            begin
              reg83 <= (($signed($signed(reg81)) + wire76) ?
                  $signed((wire77[(4'h8):(3'h5)] ?
                      reg81 : {(-wire73),
                          (!reg80)})) : $unsigned(wire78[(2'h2):(2'h2)]));
            end
          if (($signed($unsigned(reg82[(1'h0):(1'h0)])) ^ (wire72[(4'hb):(4'ha)] ?
              $signed(($signed((8'hbc)) | (wire74 ?
                  reg82 : reg80))) : (wire73[(3'h7):(1'h1)] <<< ((wire73 ?
                  reg83 : (8'hb4)) > $signed(wire78))))))
            begin
              reg84 <= wire77[(4'hc):(4'ha)];
              reg85 <= wire78[(2'h2):(1'h1)];
              reg86 <= ((^$signed(wire74[(4'he):(4'he)])) << $unsigned((~^($unsigned((8'hb9)) ?
                  (wire73 | wire78) : (^reg83)))));
              reg87 <= ($signed((+(reg80[(2'h3):(2'h2)] ?
                      reg86 : (reg85 << reg81)))) ?
                  (|(wire77[(1'h1):(1'h1)] ?
                      {$signed(reg84)} : $unsigned((^(8'hbd))))) : reg83[(3'h4):(2'h3)]);
              reg88 <= $signed($signed((~^($unsigned(wire75) ?
                  reg80 : (wire78 - wire73)))));
            end
          else
            begin
              reg84 <= wire76[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg80 <= ($signed({reg81, ((~^wire79) >>> (wire77 * reg86))}) ?
              (({$signed(reg87),
                  reg81[(4'hb):(2'h3)]} | reg80[(4'hc):(4'ha)]) == wire79) : $signed(({reg84,
                      (reg82 <= reg85)} ?
                  ((!reg81) ^ $signed(wire76)) : wire78[(1'h1):(1'h1)])));
          if (reg85)
            begin
              reg81 <= ($unsigned(reg83) << $signed(wire74));
              reg82 <= (reg83 > $unsigned($signed(wire79[(4'h8):(1'h1)])));
              reg83 <= reg86[(3'h4):(2'h2)];
            end
          else
            begin
              reg81 <= $unsigned(($unsigned(wire77) ? (~^(&{reg85})) : reg82));
              reg82 <= (($signed(wire79) & reg84[(3'h4):(2'h2)]) != (($signed($signed(reg83)) ?
                      $signed($signed(reg86)) : {wire79[(4'hb):(3'h7)],
                          (reg85 ? reg85 : wire75)}) ?
                  {$signed($unsigned(reg85)),
                      reg87[(3'h4):(1'h0)]} : {($unsigned(reg81) ?
                          $unsigned(wire76) : {reg87, wire75})}));
              reg83 <= $signed(({{(wire76 ?
                          reg87 : wire75)}} == wire72[(4'hb):(2'h2)]));
              reg84 <= $signed((8'hac));
              reg85 <= (~|((|reg80) ?
                  reg88[(3'h4):(1'h1)] : $signed($signed((wire75 && wire74)))));
            end
        end
      reg89 <= (8'ha7);
      reg90 <= wire77[(3'h4):(2'h2)];
    end
  assign wire91 = wire73[(3'h7):(1'h1)];
  assign wire92 = $unsigned(reg81);
  assign wire93 = ($signed(reg88) ? (^~$signed((!reg87))) : wire73);
  assign wire94 = wire75[(1'h0):(1'h0)];
  assign wire95 = wire94;
  assign wire96 = {(^(($unsigned(wire93) != $signed(wire75)) ?
                          wire92 : $signed((8'hbf))))};
  assign wire97 = wire93;
  assign wire98 = (-($signed(($signed(reg85) ?
                      wire72[(2'h2):(1'h1)] : $unsigned(wire79))) << $signed(($signed(wire93) ?
                      $signed(wire94) : (wire91 + (8'hba))))));
  assign wire99 = ((({((8'hb8) < reg90), {reg81}} ?
                          ((wire76 <<< reg85) > ((8'hba) ?
                              reg88 : reg85)) : $signed($signed(wire95))) ?
                      $unsigned((wire92 << (wire96 ^ wire98))) : {$signed($signed(wire94))}) ^~ wire79);
  assign wire100 = $unsigned(reg84[(3'h7):(1'h1)]);
  assign wire101 = {wire95};
  always
    @(posedge clk) begin
      reg102 <= (~&($signed((7'h44)) && (wire72 ?
          reg82 : {$unsigned(wire99)})));
      reg103 <= {reg86[(5'h14):(5'h11)], (8'hb3)};
      reg104 <= reg85;
    end
  assign wire105 = $signed((^~(8'hb7)));
  assign wire106 = (~&(({(&reg88)} ?
                       $unsigned(wire91[(3'h4):(1'h0)]) : (|$unsigned(wire79))) ^ reg102[(4'h8):(2'h2)]));
  assign wire107 = (((reg88 ?
                           ($unsigned((8'hb1)) ?
                               (reg90 ?
                                   reg83 : wire106) : wire96) : reg88[(4'hc):(4'h9)]) ?
                       $unsigned((!wire100[(2'h2):(1'h0)])) : $signed($signed((wire105 * (8'ha0))))) <= (+wire72));
  assign wire108 = $unsigned((({wire101[(4'ha):(4'h8)],
                           (reg80 ? reg83 : wire75)} && {$signed(wire101)}) ?
                       reg85 : wire92));
  assign wire109 = (~((+$signed((wire100 ^ reg104))) ? (~|reg87) : wire106));
endmodule

module module21  (y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'h1ed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire25;
  input wire signed [(4'hd):(1'h0)] wire24;
  input wire signed [(4'hd):(1'h0)] wire23;
  input wire [(4'hd):(1'h0)] wire22;
  wire signed [(5'h14):(1'h0)] wire45;
  wire [(4'hf):(1'h0)] wire44;
  wire signed [(4'ha):(1'h0)] wire29;
  wire [(3'h6):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire27;
  wire [(5'h10):(1'h0)] wire26;
  reg signed [(4'hc):(1'h0)] reg66 = (1'h0);
  reg [(4'hd):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg64 = (1'h0);
  reg [(5'h14):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg60 = (1'h0);
  reg [(4'hb):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg56 = (1'h0);
  reg [(5'h12):(1'h0)] reg55 = (1'h0);
  reg [(3'h6):(1'h0)] reg54 = (1'h0);
  reg [(5'h10):(1'h0)] reg53 = (1'h0);
  reg [(4'h9):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg51 = (1'h0);
  reg [(4'ha):(1'h0)] reg50 = (1'h0);
  reg [(4'ha):(1'h0)] reg49 = (1'h0);
  reg [(5'h10):(1'h0)] reg48 = (1'h0);
  reg [(5'h15):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  reg signed [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg [(4'hd):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(4'h8):(1'h0)] reg30 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
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
                 (1'h0)};
  assign wire26 = ($signed($signed($signed(wire23))) * wire23[(3'h4):(1'h1)]);
  assign wire27 = $unsigned((wire26 ?
                      $unsigned(wire22) : (!$signed($signed(wire24)))));
  assign wire28 = (~^(^wire22));
  assign wire29 = wire26[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg30 <= ({($unsigned((!wire27)) ?
              $signed(wire24) : $unsigned((wire28 <<< (8'ha7)))),
          (!((8'ha7) ?
              (wire27 ?
                  wire28 : wire23) : $unsigned((8'ha3))))} && $signed((({wire25,
              wire27} > (!(8'hbd))) ?
          ((wire25 ? wire26 : wire23) && $unsigned(wire22)) : (8'hb0))));
      if ({(!($signed({(8'hb6)}) ?
              ((^wire26) ^ $unsigned(wire25)) : ($unsigned(wire24) << wire29)))})
        begin
          reg31 <= (wire24 < $unsigned((^reg30[(3'h6):(1'h0)])));
          reg32 <= (~|wire25[(2'h2):(1'h0)]);
          if ((~&(8'hab)))
            begin
              reg33 <= (wire27[(3'h5):(2'h3)] - ((($signed(reg32) ?
                      (wire25 >> reg31) : (wire23 ? wire22 : reg32)) ?
                  wire26 : ($unsigned(wire25) ?
                      $unsigned(wire23) : ((8'hae) ?
                          wire22 : reg30))) < (wire29 ~^ wire23[(1'h1):(1'h0)])));
              reg34 <= ((8'ha4) >= (reg31[(3'h4):(1'h1)] > reg30));
            end
          else
            begin
              reg33 <= wire28[(3'h4):(1'h0)];
              reg34 <= reg31[(2'h3):(1'h1)];
              reg35 <= wire22[(4'ha):(3'h4)];
              reg36 <= wire24[(4'ha):(4'h9)];
              reg37 <= $unsigned((8'h9d));
            end
          if ($unsigned({({reg36[(1'h1):(1'h1)]} ?
                  ((reg35 ? reg36 : reg36) ?
                      (&(8'haa)) : reg32) : $unsigned((wire25 ^~ wire25))),
              wire24[(1'h0):(1'h0)]}))
            begin
              reg38 <= reg37[(2'h3):(1'h1)];
              reg39 <= reg31[(4'hc):(4'hc)];
            end
          else
            begin
              reg38 <= ((|(+(reg33 && {wire25, wire23}))) ?
                  ($signed(((~|reg37) ?
                          {reg31, wire24} : (reg31 ? wire22 : (7'h43)))) ?
                      reg31 : (~&$signed(wire22[(4'ha):(1'h1)]))) : (&(reg33[(2'h3):(2'h2)] > wire28)));
              reg39 <= $signed(wire22);
              reg40 <= {$signed($unsigned((~^{wire23}))),
                  $signed(reg38[(3'h7):(1'h0)])};
              reg41 <= (~|(~$signed({(wire28 == reg40),
                  reg31[(4'h8):(3'h7)]})));
              reg42 <= $unsigned((~|($unsigned((wire23 + reg36)) ?
                  $signed(reg37[(4'hf):(3'h4)]) : (~^$unsigned(reg40)))));
            end
        end
      else
        begin
          reg31 <= ({$signed($unsigned({reg39,
                  wire28}))} << $unsigned({{(^(8'hb8))},
              ((^~wire26) <= (wire22 ? reg32 : (8'hb8)))}));
        end
      reg43 <= {(~&reg37)};
    end
  assign wire44 = (^~wire29[(3'h6):(2'h3)]);
  assign wire45 = wire24;
  always
    @(posedge clk) begin
      reg46 <= (reg42 ?
          {(reg32 ?
                  (~(reg42 ^ reg34)) : $unsigned(wire24[(1'h1):(1'h1)]))} : ({wire24[(3'h5):(1'h0)],
              wire28} && (wire44[(4'he):(3'h4)] >>> (((8'ha2) ? reg31 : reg41) ?
              $unsigned(reg43) : $unsigned(reg30)))));
      reg47 <= reg31;
      reg48 <= reg40[(3'h6):(3'h4)];
      reg49 <= reg41;
      if (($unsigned((((~^reg34) + $unsigned(reg33)) ?
          wire28[(2'h2):(1'h0)] : reg42[(2'h2):(2'h2)])) - (&(~&$unsigned((+(8'hb7)))))))
        begin
          reg50 <= reg39;
        end
      else
        begin
          reg50 <= {{($unsigned((reg39 ? (7'h41) : reg46)) ?
                      $unsigned(wire45) : (^wire24))},
              wire26};
          if ((^$signed((^wire22))))
            begin
              reg51 <= (^~wire23);
            end
          else
            begin
              reg51 <= (reg42[(2'h2):(1'h1)] ^~ (({((8'haf) & (8'hb0))} > $unsigned($signed(reg38))) ?
                  wire29 : $unsigned(reg41)));
              reg52 <= reg33;
            end
          reg53 <= {(~$unsigned((-$unsigned(reg35)))), (8'h9c)};
          reg54 <= $signed((!((^~(reg35 || wire24)) ?
              (~^{reg37, reg47}) : (8'hbe))));
        end
    end
  always
    @(posedge clk) begin
      if ($signed(reg33))
        begin
          reg55 <= reg46[(4'h9):(3'h7)];
        end
      else
        begin
          reg55 <= (($unsigned($signed(reg41[(2'h2):(1'h1)])) ?
              (|(8'hb7)) : reg40) && (~&(-wire27)));
          reg56 <= wire44;
          reg57 <= $unsigned(($unsigned($unsigned((wire24 ~^ wire28))) ?
              wire45 : $signed($unsigned({reg43}))));
        end
      if ($signed((^~$signed(reg52[(4'h8):(2'h2)]))))
        begin
          if ((&reg53[(1'h0):(1'h0)]))
            begin
              reg58 <= reg51[(4'hc):(3'h7)];
              reg59 <= ($unsigned(((8'ha9) ?
                  reg50[(3'h7):(3'h6)] : $unsigned(reg33[(4'h8):(3'h6)]))) >> (^~($unsigned((reg58 ?
                      (8'hb1) : wire26)) ?
                  ($unsigned(reg33) ?
                      reg34[(4'ha):(1'h1)] : (reg56 ?
                          (8'hac) : reg31)) : wire23)));
              reg60 <= (({$signed((^~reg34))} ?
                  (($signed(reg40) ? $unsigned((8'ha6)) : reg40) ?
                      ((reg57 + wire29) ~^ (^reg46)) : $unsigned($signed(reg37))) : $signed(reg59[(3'h6):(3'h5)])) & $unsigned($signed((-(&(8'hae))))));
              reg61 <= $unsigned(reg57);
            end
          else
            begin
              reg58 <= reg59[(1'h0):(1'h0)];
              reg59 <= reg30;
              reg60 <= {(reg61[(2'h3):(2'h3)] ?
                      (~^reg50[(3'h7):(3'h6)]) : $signed($unsigned((reg51 ?
                          reg61 : reg59)))),
                  reg49[(2'h2):(1'h1)]};
              reg61 <= reg43;
            end
          reg62 <= ((-$signed(((-reg54) < {reg32, reg34}))) ?
              $unsigned($unsigned({$signed(reg56), (|reg55)})) : (8'ha7));
          reg63 <= $signed(reg31[(4'hc):(3'h6)]);
          reg64 <= $unsigned((8'h9d));
          reg65 <= (~|(((^wire44[(2'h2):(2'h2)]) <= {(reg52 < reg41),
                  $signed(reg37)}) ?
              (|$unsigned(((8'ha7) + reg58))) : (8'ha8)));
        end
      else
        begin
          if (reg55[(4'he):(4'h8)])
            begin
              reg58 <= $signed($unsigned(((wire26 >= reg47[(5'h15):(3'h6)]) || (~(reg64 & wire27)))));
            end
          else
            begin
              reg58 <= $signed(reg34);
              reg59 <= (&$signed((((+wire27) == reg31[(3'h6):(3'h4)]) ?
                  {(8'hb7)} : (+$signed(reg49)))));
            end
          reg60 <= (^~$unsigned($unsigned($unsigned(((8'hbd) == wire45)))));
          reg61 <= ((8'hbd) ?
              {({{reg50}, wire44[(2'h3):(2'h3)]} ^~ reg63[(5'h12):(5'h10)]),
                  (^~$signed({(8'hbd), wire25}))} : reg53);
          reg62 <= $unsigned($unsigned(($unsigned(reg63) ~^ (!(^~reg61)))));
        end
      reg66 <= ((reg51[(4'he):(1'h1)] ?
          $unsigned((wire27[(2'h2):(1'h1)] ?
              (-reg32) : (reg33 ? (8'ha0) : (8'hac)))) : (~$unsigned(((7'h43) ?
              wire45 : reg37)))) & (&(^~reg62)));
    end
endmodule
