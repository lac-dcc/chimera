module top
#(parameter param217 = {{((((8'ha0) != (8'ha4)) >= ((8'hbf) ? (7'h42) : (8'ha7))) ? (^((8'hb1) ? (8'ha1) : (7'h40))) : (!((8'hbb) << (8'hab)))), (^~(((8'ha1) >> (8'hbb)) >> ((8'ha3) ? (7'h41) : (8'hbc))))}})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire215;
  assign y = {wire5, wire6, wire7, wire8, wire9, wire215, (1'h0)};
  assign wire5 = wire0;
  assign wire6 = (^(wire1 ?
                     (~&$signed((wire0 == wire3))) : $signed($signed(wire1[(2'h2):(2'h2)]))));
  assign wire7 = wire1;
  assign wire8 = wire7[(2'h3):(2'h2)];
  assign wire9 = (wire0[(1'h1):(1'h0)] >>> (+wire4));
  module10 #() modinst216 (wire215, clk, wire4, wire9, wire5, wire0, wire2);
endmodule

module module10
#(parameter param213 = (+(-(((!(8'hbc)) & {(8'hae), (8'hb1)}) == ((~|(8'hb5)) ? ((8'haf) ? (8'ha8) : (8'ha1)) : {(8'ha9)})))), 
parameter param214 = param213)
(y, clk, wire11, wire12, wire13, wire14, wire15);
  output wire [(32'h145):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire11;
  input wire signed [(5'h15):(1'h0)] wire12;
  input wire signed [(5'h12):(1'h0)] wire13;
  input wire signed [(5'h15):(1'h0)] wire14;
  input wire [(4'hd):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire212;
  wire [(4'hc):(1'h0)] wire210;
  wire [(3'h4):(1'h0)] wire209;
  wire signed [(5'h14):(1'h0)] wire208;
  wire [(4'hc):(1'h0)] wire152;
  wire signed [(5'h15):(1'h0)] wire106;
  wire signed [(5'h13):(1'h0)] wire104;
  wire signed [(3'h6):(1'h0)] wire59;
  wire signed [(5'h11):(1'h0)] wire58;
  wire signed [(4'he):(1'h0)] wire16;
  wire [(4'ha):(1'h0)] wire56;
  wire [(4'h9):(1'h0)] wire154;
  wire [(5'h13):(1'h0)] wire176;
  wire signed [(4'h8):(1'h0)] wire206;
  reg [(4'ha):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg63 = (1'h0);
  assign y = {wire212,
                 wire210,
                 wire209,
                 wire208,
                 wire152,
                 wire106,
                 wire104,
                 wire59,
                 wire58,
                 wire16,
                 wire56,
                 wire154,
                 wire176,
                 wire206,
                 reg155,
                 reg17,
                 reg18,
                 reg19,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 (1'h0)};
  assign wire16 = ((~(|$signed($unsigned(wire12)))) ?
                      $unsigned($signed(wire12[(5'h12):(1'h0)])) : (|wire15));
  always
    @(posedge clk) begin
      reg17 <= $signed($unsigned($unsigned(wire13)));
      reg18 <= wire13;
      reg19 <= $signed((-(~^(+(~^wire12)))));
    end
  module20 #() modinst57 (wire56, clk, reg17, wire12, wire16, reg18, wire13);
  assign wire58 = wire16[(4'h8):(2'h3)];
  assign wire59 = ({wire13[(4'hd):(1'h1)], wire13} ?
                      wire11[(4'hc):(3'h4)] : ((wire56 <<< ({reg19} && (reg18 ?
                          wire12 : reg17))) >> (&wire14)));
  always
    @(posedge clk) begin
      reg60 <= {((!wire58[(3'h5):(1'h0)]) >>> ({(^reg18),
              (wire11 & wire59)} < wire13[(4'hd):(3'h6)])),
          wire16[(3'h7):(1'h1)]};
      reg61 <= ($signed(($signed((reg18 ?
          (8'ha8) : wire13)) && wire59[(2'h2):(2'h2)])) && (~|reg19[(3'h7):(1'h0)]));
      reg62 <= ($unsigned((~wire59[(3'h5):(2'h2)])) >> $unsigned(wire15));
      reg63 <= ($unsigned($unsigned($signed((reg19 ? wire15 : wire59)))) ?
          $signed(wire13) : ((|(^~wire11[(4'h8):(1'h0)])) == reg19[(2'h2):(2'h2)]));
    end
  module64 #() modinst105 (wire104, clk, wire16, wire14, reg62, reg61);
  assign wire106 = ((-($unsigned((reg17 & wire104)) << wire15)) ~^ $unsigned(reg60));
  module107 #() modinst153 (wire152, clk, reg61, wire58, wire15, wire12);
  assign wire154 = ((wire56[(2'h2):(1'h1)] ?
                       (reg19 ?
                           {(wire16 ~^ wire11)} : (!(reg19 >>> wire104))) : $unsigned((reg17[(2'h3):(2'h3)] ?
                           reg19 : wire106))) && ($unsigned(({wire14} >>> (wire104 ?
                       reg18 : (8'haf)))) << ($signed({reg62,
                       wire104}) >>> $signed($unsigned(wire15)))));
  always
    @(posedge clk) begin
      reg155 <= reg17[(4'hf):(4'he)];
    end
  module156 #() modinst177 (wire176, clk, wire104, wire56, wire106, wire15, reg19);
  module178 #() modinst207 (.wire179(reg62), .wire180(wire12), .wire182(wire104), .wire181(wire14), .y(wire206), .wire183(reg60), .clk(clk));
  assign wire208 = wire11[(4'he):(2'h2)];
  assign wire209 = $signed((($unsigned((wire176 ?
                       wire12 : wire58)) && (~|reg60[(1'h1):(1'h0)])) - reg62));
  module156 #() modinst211 (.wire160(reg155), .clk(clk), .wire161(reg17), .wire159(wire16), .wire158(reg61), .wire157(wire208), .y(wire210));
  assign wire212 = $signed(wire210);
endmodule

module module178  (y, clk, wire183, wire182, wire181, wire180, wire179);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire183;
  input wire [(4'hf):(1'h0)] wire182;
  input wire [(5'h10):(1'h0)] wire181;
  input wire [(5'h15):(1'h0)] wire180;
  input wire [(3'h4):(1'h0)] wire179;
  wire signed [(3'h6):(1'h0)] wire205;
  wire [(4'he):(1'h0)] wire199;
  wire signed [(5'h11):(1'h0)] wire198;
  wire [(4'h8):(1'h0)] wire197;
  wire [(5'h10):(1'h0)] wire196;
  wire [(4'hf):(1'h0)] wire195;
  wire signed [(5'h15):(1'h0)] wire194;
  wire [(3'h6):(1'h0)] wire192;
  wire signed [(5'h12):(1'h0)] wire191;
  wire [(2'h2):(1'h0)] wire190;
  wire signed [(2'h3):(1'h0)] wire189;
  wire [(3'h4):(1'h0)] wire188;
  wire [(3'h5):(1'h0)] wire187;
  wire [(2'h3):(1'h0)] wire186;
  wire signed [(5'h10):(1'h0)] wire185;
  wire signed [(4'hb):(1'h0)] wire184;
  reg [(4'ha):(1'h0)] reg204 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg203 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg202 = (1'h0);
  reg [(3'h4):(1'h0)] reg201 = (1'h0);
  reg [(5'h10):(1'h0)] reg200 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg193 = (1'h0);
  assign y = {wire205,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire194,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg193,
                 (1'h0)};
  assign wire184 = wire182[(4'he):(2'h2)];
  assign wire185 = $signed((^$signed(wire182)));
  assign wire186 = (&wire183);
  assign wire187 = wire184[(2'h3):(1'h0)];
  assign wire188 = $unsigned(($signed(wire181) ?
                       $signed({{wire183, wire185}}) : wire186[(1'h1):(1'h0)]));
  assign wire189 = ((~^($unsigned((+(8'hba))) ?
                           (8'hb1) : $signed((wire187 > wire184)))) ?
                       (8'hbc) : $unsigned((~($signed(wire181) ?
                           (~^wire188) : $signed((8'hb7))))));
  assign wire190 = {$unsigned(wire187)};
  assign wire191 = {$unsigned(((wire189 ?
                           wire189 : wire179) | ($signed(wire181) ?
                           {(8'hba), wire190} : (wire185 >= wire185)))),
                       (wire185 || (|((wire179 << wire186) ?
                           wire189 : (8'ha2))))};
  assign wire192 = $unsigned(($unsigned($unsigned((wire189 < wire184))) & $signed((^~wire191))));
  always
    @(posedge clk) begin
      reg193 <= (|$unsigned(wire186[(2'h2):(2'h2)]));
    end
  assign wire194 = (wire187[(2'h3):(2'h3)] + (wire185[(4'hb):(4'h9)] << (^((wire185 ?
                           wire180 : wire184) ?
                       wire187[(3'h4):(3'h4)] : wire184))));
  assign wire195 = wire181[(1'h0):(1'h0)];
  assign wire196 = ((wire188 & $signed(($signed(wire184) ?
                       (~^reg193) : wire191))) | (wire191 <<< (8'h9f)));
  assign wire197 = $signed({$signed($unsigned((wire194 ? wire195 : wire191))),
                       (^~wire192[(1'h0):(1'h0)])});
  assign wire198 = $unsigned($signed((~(&$unsigned(wire192)))));
  assign wire199 = (((8'hb4) ^~ wire184) ?
                       (8'hbf) : {wire187,
                           $signed(($signed(wire196) ?
                               {wire181} : wire191[(3'h7):(3'h4)]))});
  always
    @(posedge clk) begin
      if ({wire183[(1'h0):(1'h0)]})
        begin
          reg200 <= wire197;
        end
      else
        begin
          if ({(wire186 == wire181)})
            begin
              reg200 <= ({$signed($unsigned((wire190 >= wire185))),
                  $unsigned($signed(wire188))} >>> ((!$signed(wire196)) ?
                  {($signed(wire181) - (&wire186)),
                      $signed(wire199[(1'h1):(1'h0)])} : (((wire181 ^~ wire179) && (wire184 <<< wire183)) ?
                      (~(~^wire197)) : (~&(wire186 ? wire182 : wire181)))));
              reg201 <= $signed($unsigned(wire192));
              reg202 <= (|(^~$unsigned(($signed(wire185) ?
                  $unsigned(wire198) : (wire179 ? wire195 : wire183)))));
            end
          else
            begin
              reg200 <= $unsigned($signed(wire198[(4'ha):(4'h9)]));
              reg201 <= (~&wire195[(2'h3):(1'h0)]);
            end
          reg203 <= $unsigned(({wire196} <= $signed(($signed((8'hb9)) ?
              (wire181 * wire185) : (wire180 ? wire182 : wire181)))));
          reg204 <= wire181;
        end
    end
  assign wire205 = wire185;
endmodule

module module156  (y, clk, wire161, wire160, wire159, wire158, wire157);
  output wire [(32'h97):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire161;
  input wire signed [(4'ha):(1'h0)] wire160;
  input wire signed [(4'hc):(1'h0)] wire159;
  input wire signed [(4'hd):(1'h0)] wire158;
  input wire signed [(5'h14):(1'h0)] wire157;
  wire signed [(3'h7):(1'h0)] wire175;
  wire signed [(5'h14):(1'h0)] wire174;
  wire [(4'hf):(1'h0)] wire173;
  wire signed [(3'h5):(1'h0)] wire172;
  wire signed [(4'he):(1'h0)] wire171;
  wire [(2'h3):(1'h0)] wire170;
  wire [(2'h2):(1'h0)] wire169;
  wire signed [(4'ha):(1'h0)] wire168;
  wire signed [(4'hb):(1'h0)] wire167;
  wire [(4'hc):(1'h0)] wire166;
  wire signed [(3'h7):(1'h0)] wire165;
  wire signed [(5'h11):(1'h0)] wire164;
  wire [(4'hb):(1'h0)] wire163;
  wire [(5'h10):(1'h0)] wire162;
  assign y = {wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 (1'h0)};
  assign wire162 = ((&wire160) | ($unsigned($signed((wire160 ?
                           wire157 : wire161))) ?
                       (-($unsigned(wire158) ?
                           (wire161 ? (8'ha9) : wire158) : (wire159 ?
                               wire160 : wire161))) : (^$signed($signed(wire161)))));
  assign wire163 = $signed((~&wire157));
  assign wire164 = ($unsigned(wire163) ?
                       wire160 : (wire162 ?
                           wire161[(4'hf):(3'h4)] : $signed($signed((wire161 ^ wire160)))));
  assign wire165 = wire160[(3'h4):(2'h2)];
  assign wire166 = ((!wire165) >>> (wire157 ?
                       $unsigned((~&$signed(wire159))) : ($signed(wire161) ?
                           (wire160 ?
                               (wire160 ?
                                   (8'hbe) : wire165) : $unsigned((8'hb8))) : ({wire161,
                                   wire161} ?
                               $signed((8'ha1)) : {wire159}))));
  assign wire167 = $signed(wire160[(4'h8):(1'h0)]);
  assign wire168 = wire162;
  assign wire169 = $signed(wire163[(3'h6):(1'h0)]);
  assign wire170 = (-((wire169 ?
                           (~|$unsigned(wire157)) : ($signed(wire159) ?
                               wire168 : ((8'ha0) ? (8'ha3) : wire161))) ?
                       (wire158 ^ wire168) : {$signed((wire163 ?
                               wire157 : wire157)),
                           (~^wire165)}));
  assign wire171 = (wire166 >>> wire169);
  assign wire172 = $signed($signed($unsigned((wire157[(4'hd):(1'h1)] ?
                       wire157 : {wire166, wire166}))));
  assign wire173 = $signed(((8'hb2) > wire169));
  assign wire174 = $unsigned($signed(wire172));
  assign wire175 = (+(&($unsigned((!wire173)) != ({wire173,
                       wire173} && $unsigned(wire165)))));
endmodule

module module107
#(parameter param150 = (|(^~((((8'hbc) ? (8'ha5) : (8'hb8)) >= ((8'ha1) <<< (8'h9d))) < (((7'h43) ~^ (8'hbf)) ~^ ((8'haa) ? (8'h9d) : (8'ha7)))))), 
parameter param151 = (^{(((param150 ? param150 : (8'hb5)) < (param150 >>> param150)) ? {param150} : (8'hb8))}))
(y, clk, wire111, wire110, wire109, wire108);
  output wire [(32'h1df):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire111;
  input wire signed [(5'h11):(1'h0)] wire110;
  input wire [(2'h3):(1'h0)] wire109;
  input wire [(4'hd):(1'h0)] wire108;
  wire [(3'h7):(1'h0)] wire149;
  wire [(3'h5):(1'h0)] wire148;
  wire [(5'h13):(1'h0)] wire147;
  wire signed [(4'hc):(1'h0)] wire136;
  wire signed [(4'hb):(1'h0)] wire135;
  wire signed [(5'h15):(1'h0)] wire123;
  wire [(4'hb):(1'h0)] wire122;
  wire signed [(4'hf):(1'h0)] wire117;
  wire signed [(5'h15):(1'h0)] wire116;
  wire signed [(3'h6):(1'h0)] wire115;
  wire [(4'hd):(1'h0)] wire114;
  wire signed [(4'hc):(1'h0)] wire113;
  wire [(4'ha):(1'h0)] wire112;
  reg signed [(5'h14):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg145 = (1'h0);
  reg [(2'h2):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg143 = (1'h0);
  reg [(3'h6):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg141 = (1'h0);
  reg [(4'hb):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg139 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg138 = (1'h0);
  reg [(5'h14):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg134 = (1'h0);
  reg [(4'ha):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg132 = (1'h0);
  reg [(2'h3):(1'h0)] reg131 = (1'h0);
  reg [(5'h12):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg129 = (1'h0);
  reg [(4'hf):(1'h0)] reg128 = (1'h0);
  reg [(4'h9):(1'h0)] reg127 = (1'h0);
  reg [(4'hc):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg121 = (1'h0);
  reg [(4'hc):(1'h0)] reg120 = (1'h0);
  reg [(4'h9):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg118 = (1'h0);
  assign y = {wire149,
                 wire148,
                 wire147,
                 wire136,
                 wire135,
                 wire123,
                 wire122,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
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
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 (1'h0)};
  assign wire112 = ((~|{(8'ha3)}) ^~ (wire110 ?
                       {(-$unsigned(wire111)),
                           $signed(wire110)} : wire111[(4'h9):(2'h3)]));
  assign wire113 = $signed(wire111);
  assign wire114 = (8'ha7);
  assign wire115 = wire113[(3'h4):(2'h2)];
  assign wire116 = (!{wire113,
                       ((^$unsigned(wire108)) ?
                           {$unsigned(wire115)} : wire115[(2'h2):(2'h2)])});
  assign wire117 = ((($signed((wire113 << wire112)) > $unsigned(((8'hbc) ?
                           wire110 : wire116))) >> ($signed((wire112 >= wire108)) ?
                           wire112 : $unsigned(wire109[(1'h1):(1'h1)]))) ?
                       ((wire110[(4'hd):(3'h5)] ?
                               wire111[(4'ha):(2'h3)] : $unsigned((wire114 >>> wire111))) ?
                           $unsigned((~&$signed(wire112))) : wire109) : $unsigned(((^~$signed(wire115)) ^~ wire116[(5'h15):(3'h5)])));
  always
    @(posedge clk) begin
      reg118 <= wire116;
      reg119 <= (wire117[(2'h3):(2'h2)] ?
          (wire112 && (^wire111[(4'hd):(4'h8)])) : (wire111[(3'h7):(3'h5)] <<< $signed(($unsigned(wire114) * (wire111 ?
              wire109 : (7'h43))))));
      reg120 <= (8'had);
      reg121 <= {(^~$signed(((~^(7'h43)) <= {wire114})))};
    end
  assign wire122 = wire114;
  assign wire123 = $unsigned(wire111);
  always
    @(posedge clk) begin
      if ((|{(((wire122 * wire115) & (~&wire110)) ?
              ((wire112 ? wire113 : wire117) ~^ (wire110 ?
                  (8'hb3) : wire109)) : ((reg120 ? wire114 : (7'h42)) ?
                  $signed(wire114) : reg121[(3'h7):(3'h7)])),
          wire113}))
        begin
          if ((&reg118))
            begin
              reg124 <= $signed($unsigned(((^~reg119) > ($signed(wire117) ?
                  $signed(reg118) : (wire111 ? wire113 : wire116)))));
            end
          else
            begin
              reg124 <= wire111[(5'h12):(4'he)];
            end
          reg125 <= ($unsigned((((wire116 ? reg119 : reg121) * (~reg120)) ?
                  (^(wire123 ? (8'hb0) : reg121)) : ((^~reg120) ?
                      (wire123 ? wire114 : wire109) : reg121))) ?
              (((~&(8'hbf)) << reg124[(3'h7):(3'h6)]) ?
                  reg124[(4'h8):(4'h8)] : ((8'had) - (~|{reg121,
                      wire115}))) : $signed((-((wire115 == wire109) <<< reg119[(1'h0):(1'h0)]))));
          if ((~|(^(+(~^$signed(wire116))))))
            begin
              reg126 <= (reg119 >>> $unsigned({$signed((reg118 && (8'hbc))),
                  $unsigned(wire122[(1'h0):(1'h0)])}));
              reg127 <= wire123;
              reg128 <= wire116;
            end
          else
            begin
              reg126 <= reg127[(3'h5):(1'h0)];
              reg127 <= $signed(reg120[(4'h8):(3'h4)]);
              reg128 <= {($signed(((wire111 >= wire115) ?
                      reg125 : $signed(wire116))) ~^ (($unsigned(wire110) || $signed((8'hb1))) ?
                      $signed((&wire115)) : {$unsigned(reg127), (+reg124)})),
                  ((reg118 ?
                      ((reg125 >> wire115) ?
                          wire110 : (wire109 ?
                              reg125 : reg126)) : wire109[(2'h2):(1'h1)]) ^~ (^~$signed({reg126,
                      reg125})))};
            end
          reg129 <= reg121;
          reg130 <= $signed({{$signed((reg127 ? wire109 : (8'ha3))),
                  reg118[(1'h0):(1'h0)]},
              $unsigned($signed((reg121 < wire112)))});
        end
      else
        begin
          reg124 <= (({{$signed(wire116)}, wire123} ?
                  {(7'h41)} : $signed($unsigned((wire108 | reg119)))) ?
              ($unsigned({(wire110 ? (7'h41) : reg129),
                  (wire122 ?
                      reg126 : wire122)}) < (($unsigned(wire117) + (wire112 >= (8'ha4))) ?
                  reg120 : (8'hbf))) : ($signed(((+reg127) ?
                  wire123[(2'h2):(1'h1)] : {(8'h9f), reg126})) * wire108));
          reg125 <= ($unsigned((wire116 ?
                  reg118[(3'h4):(1'h1)] : (^~wire123[(2'h3):(2'h2)]))) ?
              $signed(reg129[(3'h5):(3'h4)]) : (~|(reg121 >>> $unsigned(reg120[(4'h9):(3'h4)]))));
          reg126 <= (!(&$unsigned($unsigned(wire108[(2'h3):(2'h2)]))));
          reg127 <= ((wire115[(2'h3):(2'h3)] <<< wire111[(3'h6):(3'h5)]) ?
              {$unsigned((!(!wire123)))} : wire108[(4'h9):(3'h4)]);
        end
      reg131 <= reg129;
      reg132 <= ((+reg118) ?
          $signed((~$signed(wire112[(1'h1):(1'h0)]))) : $unsigned($signed($unsigned(reg128[(3'h6):(3'h5)]))));
      reg133 <= reg125[(3'h6):(1'h0)];
      reg134 <= ((~&wire109) ?
          ($signed($unsigned($signed(reg132))) ?
              (~reg119) : wire122) : reg127[(3'h6):(3'h4)]);
    end
  assign wire135 = (|((((wire123 == wire108) ?
                           (^~(8'hb5)) : (^~wire116)) <= $unsigned($unsigned(reg124))) ?
                       $unsigned($signed((!reg124))) : wire116));
  assign wire136 = (8'hb8);
  always
    @(posedge clk) begin
      reg137 <= (8'ha6);
      reg138 <= (reg134[(4'h8):(3'h4)] >= {reg125[(3'h4):(2'h2)]});
      if ($signed($signed(reg131[(2'h2):(1'h0)])))
        begin
          reg139 <= reg134[(4'he):(4'ha)];
          reg140 <= $unsigned(({(wire115[(3'h5):(1'h0)] ^ ((8'ha0) && (8'ha1)))} <= $unsigned((wire114 ?
              (^(8'ha6)) : (wire136 ? reg120 : reg121)))));
          reg141 <= $signed(reg139[(1'h1):(1'h0)]);
          if ($signed($signed(($unsigned($signed(reg140)) ^ reg138[(4'h8):(1'h0)]))))
            begin
              reg142 <= (~^{reg132[(2'h2):(1'h0)]});
              reg143 <= wire115[(2'h2):(1'h1)];
              reg144 <= $signed($unsigned($signed({(wire108 != wire116),
                  {reg119}})));
              reg145 <= $signed((reg129 | ($unsigned((wire109 >>> reg131)) ?
                  $signed($unsigned((8'ha0))) : (8'ha3))));
            end
          else
            begin
              reg142 <= reg142;
              reg143 <= (reg137 ?
                  $signed(reg144[(2'h2):(1'h1)]) : (wire115 ?
                      $signed($signed($unsigned(reg129))) : wire108));
              reg144 <= (reg133 >> (reg129[(3'h4):(1'h1)] + $signed($signed((~reg140)))));
            end
          reg146 <= (~{($signed(wire117) & wire110[(4'hc):(4'hc)]), wire112});
        end
      else
        begin
          reg139 <= $unsigned(({reg134} ?
              (wire135 ?
                  (|{(8'hb4)}) : {(reg128 && wire123)}) : (((wire115 - wire123) - (reg142 ?
                      reg143 : (8'ha4))) ?
                  $unsigned(reg146[(1'h1):(1'h1)]) : (7'h41))));
        end
    end
  assign wire147 = reg146;
  assign wire148 = (({$unsigned({wire109})} < (wire112[(4'h8):(3'h7)] ~^ $unsigned({(8'hb9),
                       reg119}))) ^~ (^reg138[(3'h6):(3'h6)]));
  assign wire149 = (~$signed(reg118));
endmodule

module module64  (y, clk, wire68, wire67, wire66, wire65);
  output wire [(32'h171):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire68;
  input wire signed [(4'h9):(1'h0)] wire67;
  input wire signed [(5'h14):(1'h0)] wire66;
  input wire signed [(4'h8):(1'h0)] wire65;
  wire [(2'h2):(1'h0)] wire103;
  wire signed [(4'hb):(1'h0)] wire102;
  wire signed [(4'h9):(1'h0)] wire101;
  wire signed [(3'h6):(1'h0)] wire100;
  wire signed [(3'h5):(1'h0)] wire99;
  wire signed [(5'h13):(1'h0)] wire89;
  wire signed [(2'h2):(1'h0)] wire88;
  wire signed [(4'hf):(1'h0)] wire87;
  wire signed [(5'h13):(1'h0)] wire86;
  wire signed [(4'h8):(1'h0)] wire80;
  wire signed [(3'h6):(1'h0)] wire79;
  wire signed [(4'h8):(1'h0)] wire78;
  wire signed [(5'h12):(1'h0)] wire77;
  wire signed [(3'h4):(1'h0)] wire76;
  wire [(5'h15):(1'h0)] wire75;
  wire signed [(4'hc):(1'h0)] wire74;
  wire signed [(4'hf):(1'h0)] wire70;
  wire signed [(5'h13):(1'h0)] wire69;
  reg [(4'hb):(1'h0)] reg98 = (1'h0);
  reg [(3'h5):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg95 = (1'h0);
  reg [(4'h8):(1'h0)] reg94 = (1'h0);
  reg [(2'h3):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg92 = (1'h0);
  reg [(4'h9):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg90 = (1'h0);
  reg [(4'h8):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg84 = (1'h0);
  reg [(4'ha):(1'h0)] reg83 = (1'h0);
  reg signed [(4'he):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg81 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg73 = (1'h0);
  reg [(2'h3):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg71 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire70,
                 wire69,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg73,
                 reg72,
                 reg71,
                 (1'h0)};
  assign wire69 = ($unsigned($unsigned({$signed(wire68),
                      $signed(wire68)})) * $unsigned($unsigned(wire65[(1'h0):(1'h0)])));
  assign wire70 = wire67;
  always
    @(posedge clk) begin
      reg71 <= $unsigned({$signed(((wire70 ? (8'hbd) : wire69) <<< {wire67}))});
      reg72 <= $unsigned($signed($signed(wire65)));
      reg73 <= $unsigned(((({wire67, reg71} - (~|wire69)) ?
              $unsigned($unsigned((8'ha2))) : $unsigned($signed(wire70))) ?
          wire69[(4'h8):(2'h3)] : {(8'ha3), $unsigned($signed(wire69))}));
    end
  assign wire74 = ((~^wire67) | $unsigned(reg73));
  assign wire75 = wire70[(4'h8):(2'h3)];
  assign wire76 = (^~wire67[(2'h3):(2'h2)]);
  assign wire77 = wire75[(4'hc):(1'h0)];
  assign wire78 = reg71;
  assign wire79 = $unsigned($unsigned($unsigned({$unsigned(wire67)})));
  assign wire80 = (|((~&(^~(wire66 <<< reg73))) ?
                      $unsigned(wire67) : {(~^wire76)}));
  always
    @(posedge clk) begin
      reg81 <= $unsigned(reg71[(4'he):(4'hb)]);
      reg82 <= reg71;
      if (reg82)
        begin
          reg83 <= wire79;
        end
      else
        begin
          reg83 <= $signed({{({wire75} >= (^wire78))},
              $signed((wire67 ? $unsigned(reg83) : wire79[(3'h4):(2'h2)]))});
          reg84 <= $signed(((~|reg82) ?
              ($signed(((8'hb8) > reg82)) ?
                  (~&$signed(wire79)) : {reg72[(2'h2):(1'h0)],
                      reg82}) : ({(wire77 > reg81), reg81[(4'he):(4'hb)]} ?
                  wire67[(3'h4):(2'h2)] : {(wire65 <= (8'had))})));
        end
      reg85 <= wire74[(4'h8):(1'h0)];
    end
  assign wire86 = $unsigned(reg83);
  assign wire87 = $signed($signed((((reg81 <= wire80) ?
                      (8'hb0) : wire74[(4'ha):(3'h6)]) ^ reg83)));
  assign wire88 = ({(^$signed(wire78)),
                      wire70[(3'h4):(2'h2)]} >> $signed(wire76[(2'h2):(2'h2)]));
  assign wire89 = $signed($signed((!((!wire75) <= (reg71 ^~ reg85)))));
  always
    @(posedge clk) begin
      if (wire70)
        begin
          if ($signed(wire80[(3'h5):(3'h4)]))
            begin
              reg90 <= reg73[(3'h5):(3'h4)];
            end
          else
            begin
              reg90 <= ({(!(~&reg90)),
                  $signed(({wire66, reg73} + {wire77}))} <<< reg84);
              reg91 <= (+($signed({wire68, reg90}) ?
                  $signed(($signed((8'hac)) + $unsigned(wire67))) : $unsigned($unsigned((wire79 ?
                      wire88 : wire66)))));
            end
          reg92 <= wire79;
          reg93 <= (~&(|$unsigned($signed(wire75))));
          reg94 <= (7'h42);
        end
      else
        begin
          if ((~&{(wire74 < ($unsigned(reg91) + ((8'hbb) << reg72)))}))
            begin
              reg90 <= reg92[(1'h0):(1'h0)];
              reg91 <= (wire80 * ({{wire80, $signed(wire87)},
                  (8'hb8)} >>> (|reg81)));
              reg92 <= (($signed(wire67[(3'h6):(3'h4)]) && $unsigned(wire79[(3'h6):(3'h4)])) > (~&{((8'hb9) < reg81)}));
            end
          else
            begin
              reg90 <= {(^~wire86)};
              reg91 <= wire78;
              reg92 <= (((^(!(wire75 <<< wire86))) ?
                  {($signed(wire78) ?
                          (wire74 | (7'h40)) : $unsigned(wire80))} : (^~(|{reg73,
                      (8'hb5)}))) & {$unsigned((reg73 ?
                      (reg91 ? reg92 : wire88) : $signed(wire66))),
                  (~^$unsigned($signed(reg90)))});
            end
        end
      reg95 <= wire68[(4'h8):(3'h6)];
      reg96 <= $unsigned((wire74[(4'ha):(2'h2)] ? (~^wire79) : reg82));
      reg97 <= $unsigned($unsigned(wire70));
      reg98 <= {$unsigned(wire86[(4'h9):(1'h1)])};
    end
  assign wire99 = $signed((^~($unsigned((wire88 >> reg82)) != $signed(((8'h9c) + (8'h9f))))));
  assign wire100 = reg94[(3'h4):(1'h1)];
  assign wire101 = $signed(reg81[(3'h7):(2'h3)]);
  assign wire102 = (&$signed((|reg84[(3'h5):(2'h2)])));
  assign wire103 = $signed(((8'ha6) ?
                       reg72[(1'h1):(1'h1)] : ((^~{reg94, wire88}) ?
                           (-wire69) : ((wire75 || reg85) ?
                               $unsigned(reg91) : {wire79}))));
endmodule

module module20  (y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h136):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire25;
  input wire [(4'hb):(1'h0)] wire24;
  input wire signed [(4'hd):(1'h0)] wire23;
  input wire [(5'h10):(1'h0)] wire22;
  input wire signed [(4'h9):(1'h0)] wire21;
  wire signed [(4'hf):(1'h0)] wire55;
  wire signed [(4'ha):(1'h0)] wire54;
  wire [(5'h15):(1'h0)] wire45;
  wire [(3'h7):(1'h0)] wire44;
  wire [(3'h7):(1'h0)] wire43;
  wire signed [(4'hb):(1'h0)] wire42;
  wire signed [(5'h10):(1'h0)] wire36;
  wire signed [(2'h3):(1'h0)] wire35;
  wire signed [(4'he):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire32;
  wire [(3'h4):(1'h0)] wire31;
  wire [(3'h6):(1'h0)] wire30;
  wire signed [(4'hc):(1'h0)] wire29;
  wire [(4'ha):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire27;
  wire signed [(3'h5):(1'h0)] wire26;
  reg signed [(5'h13):(1'h0)] reg53 = (1'h0);
  reg [(4'h8):(1'h0)] reg52 = (1'h0);
  reg [(5'h14):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg50 = (1'h0);
  reg [(5'h15):(1'h0)] reg49 = (1'h0);
  reg [(2'h2):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg [(4'hb):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire26 = (wire21 ?
                      ($unsigned(((wire23 && wire24) - ((8'hb2) != (7'h41)))) != ((wire22 <= {wire25,
                              wire24}) ?
                          wire22 : wire22[(3'h7):(2'h3)])) : {wire24[(4'ha):(4'h9)],
                          (wire24[(3'h4):(1'h1)] ?
                              wire22[(5'h10):(1'h1)] : (wire21 && (|wire23)))});
  assign wire27 = ((!$signed(wire24[(4'h9):(1'h1)])) & {$signed($signed(wire26))});
  assign wire28 = $signed((~&$unsigned($unsigned($signed(wire23)))));
  assign wire29 = (^~wire22[(4'hf):(4'h9)]);
  assign wire30 = ($unsigned((~&((8'hb4) < {wire26, wire26}))) ?
                      (8'hb6) : $signed(wire28[(3'h7):(2'h2)]));
  assign wire31 = ({(wire21 ?
                              ({wire30, wire26} == (wire23 ?
                                  wire28 : (8'ha7))) : (8'ha8))} ?
                      {((8'hb2) & $unsigned((!wire29))),
                          (!wire24)} : wire30[(3'h4):(3'h4)]);
  assign wire32 = ($signed(wire21[(1'h0):(1'h0)]) ?
                      ($unsigned({(wire22 ^~ wire24),
                          (wire27 + (8'haf))}) <<< wire30[(1'h0):(1'h0)]) : ($signed({wire22[(3'h6):(3'h5)],
                          wire30}) >= (+({wire27, wire28} ^~ (8'ha6)))));
  assign wire33 = (+((~^wire31[(1'h1):(1'h1)]) ?
                      wire24 : {{$unsigned(wire32),
                              ((8'ha5) ? wire24 : wire27)},
                          (~^wire21[(2'h2):(2'h2)])}));
  assign wire34 = wire24[(1'h1):(1'h1)];
  assign wire35 = wire33;
  assign wire36 = ((~|$signed(((+(8'hb8)) ?
                      ((7'h43) * wire29) : $unsigned(wire29)))) < $unsigned($signed($unsigned(wire33[(3'h5):(3'h5)]))));
  always
    @(posedge clk) begin
      reg37 <= wire27[(4'h9):(1'h0)];
      reg38 <= wire34;
      reg39 <= wire35;
      reg40 <= ((~|(8'ha8)) - wire21[(3'h6):(1'h1)]);
      reg41 <= (-wire27[(1'h0):(1'h0)]);
    end
  assign wire42 = ($signed(wire31[(2'h2):(1'h0)]) ^~ (reg37[(2'h3):(1'h0)] & (((~^(8'h9e)) ?
                      $signed(wire23) : (wire21 > wire21)) >> $signed((~^wire22)))));
  assign wire43 = wire35;
  assign wire44 = (&wire42[(1'h1):(1'h1)]);
  assign wire45 = (wire21 <<< wire32[(3'h4):(1'h0)]);
  always
    @(posedge clk) begin
      if ({(wire29 ~^ $unsigned(wire43)),
          {($unsigned((&wire34)) ^ $signed((~&wire36))),
              {({wire35, wire45} - {wire33, wire42})}}})
        begin
          reg46 <= ((^~wire21[(3'h6):(2'h2)]) ?
              ((|(wire27[(2'h3):(2'h2)] ~^ wire28)) ?
                  (wire34[(4'hc):(1'h0)] ?
                      (~^(reg39 ?
                          wire31 : wire21)) : wire32) : $signed((~^((8'hae) ?
                      (8'ha1) : wire24)))) : {wire31[(3'h4):(1'h0)]});
          reg47 <= $signed((({$signed(wire45),
                  $signed(wire42)} != {$unsigned((8'ha4)), $signed(wire23)}) ?
              (~&wire30) : (($signed(wire28) != $signed(wire42)) <= $unsigned((wire43 >> wire45)))));
          if ((($unsigned((~^(reg41 ?
              wire24 : wire35))) ^~ wire24[(4'h8):(3'h7)]) > (-(~|wire42))))
            begin
              reg48 <= $unsigned((8'ha8));
              reg49 <= wire24;
              reg50 <= wire30;
              reg51 <= (~^$signed(wire31[(1'h1):(1'h0)]));
              reg52 <= wire43[(2'h2):(1'h0)];
            end
          else
            begin
              reg48 <= (({($unsigned(wire36) < (wire27 <= wire36)),
                      $signed(((8'hb3) || wire23))} ?
                  $signed($unsigned(reg47)) : (|($signed(reg40) ^ wire28))) ^ ({$unsigned(wire26)} - $signed($unsigned(wire25[(1'h0):(1'h0)]))));
              reg49 <= (~&$signed(reg49));
            end
        end
      else
        begin
          reg46 <= $signed($signed(($unsigned($signed(wire26)) * ((wire29 < (8'hab)) >> (wire23 ^~ (8'hbb))))));
        end
      reg53 <= (~&$signed($unsigned((reg40 ? {(8'hab)} : {wire34, wire45}))));
    end
  assign wire54 = $signed($signed($unsigned((|$unsigned(reg39)))));
  assign wire55 = (reg52 * $signed(($unsigned((wire25 & (8'h9e))) ?
                      (wire22 ?
                          (reg52 ?
                              wire29 : reg50) : wire22) : ($signed(wire33) ?
                          wire21[(4'h9):(2'h2)] : ((8'hb2) ?
                              reg52 : wire31)))));
endmodule
