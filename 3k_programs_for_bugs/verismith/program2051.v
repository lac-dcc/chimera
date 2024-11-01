module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire227;
  wire signed [(5'h13):(1'h0)] wire221;
  wire [(3'h6):(1'h0)] wire220;
  wire signed [(4'ha):(1'h0)] wire219;
  wire signed [(3'h7):(1'h0)] wire217;
  reg signed [(4'h8):(1'h0)] reg226 = (1'h0);
  reg [(3'h5):(1'h0)] reg225 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg224 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg223 = (1'h0);
  reg signed [(4'he):(1'h0)] reg222 = (1'h0);
  assign y = {wire227,
                 wire221,
                 wire220,
                 wire219,
                 wire217,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 (1'h0)};
  module5 #() modinst218 (.wire6(wire3), .clk(clk), .wire9(wire0), .wire7(wire1), .y(wire217), .wire8(wire4));
  assign wire219 = $unsigned({wire1[(3'h7):(1'h1)]});
  assign wire220 = (7'h40);
  assign wire221 = $unsigned($unsigned((8'ha3)));
  always
    @(posedge clk) begin
      reg222 <= wire3;
      if ({$signed($unsigned($unsigned($signed(wire219)))), wire4})
        begin
          reg223 <= {{((7'h41) ? wire2 : wire1)}, wire1[(4'hc):(1'h1)]};
          reg224 <= {((wire217[(3'h6):(3'h4)] >>> wire4) ?
                  ((~&(~^(8'h9e))) ?
                      $unsigned({reg223, wire221}) : ((^~(8'ha4)) ?
                          wire0 : wire1[(4'h8):(3'h5)])) : reg222)};
        end
      else
        begin
          reg223 <= $signed($signed(reg223));
        end
      reg225 <= {($unsigned(($signed(wire3) ?
                  $signed(wire219) : $unsigned((7'h41)))) ?
              (({wire220} ?
                  (~&(8'h9d)) : reg222[(2'h2):(2'h2)]) << wire219[(2'h2):(1'h0)]) : (8'hbb))};
      reg226 <= (($signed(((^(8'had)) << (wire219 ? wire217 : (7'h40)))) ?
          ((|{wire2}) ?
              ($signed(reg222) << wire221) : (~&{reg222})) : $signed($unsigned($unsigned((8'hbe))))) <<< $signed((wire4[(4'he):(3'h6)] * (~^(^~wire1)))));
    end
  assign wire227 = wire3[(4'h9):(3'h6)];
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h13c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire6;
  input wire signed [(5'h13):(1'h0)] wire7;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire58;
  wire [(4'hd):(1'h0)] wire60;
  wire signed [(4'hb):(1'h0)] wire123;
  wire [(5'h11):(1'h0)] wire126;
  wire signed [(3'h7):(1'h0)] wire127;
  wire [(3'h7):(1'h0)] wire128;
  wire signed [(2'h2):(1'h0)] wire129;
  wire signed [(5'h10):(1'h0)] wire130;
  wire signed [(4'hb):(1'h0)] wire131;
  wire [(5'h10):(1'h0)] wire132;
  wire signed [(4'h8):(1'h0)] wire133;
  wire signed [(4'ha):(1'h0)] wire175;
  wire signed [(4'ha):(1'h0)] wire202;
  reg [(5'h15):(1'h0)] reg216 = (1'h0);
  reg [(3'h4):(1'h0)] reg215 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg214 = (1'h0);
  reg [(5'h11):(1'h0)] reg213 = (1'h0);
  reg [(4'hd):(1'h0)] reg212 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg211 = (1'h0);
  reg [(5'h15):(1'h0)] reg210 = (1'h0);
  reg signed [(4'he):(1'h0)] reg209 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg208 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg207 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg206 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg205 = (1'h0);
  reg signed [(4'he):(1'h0)] reg204 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg125 = (1'h0);
  assign y = {wire58,
                 wire60,
                 wire123,
                 wire126,
                 wire127,
                 wire128,
                 wire129,
                 wire130,
                 wire131,
                 wire132,
                 wire133,
                 wire175,
                 wire202,
                 reg216,
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
                 reg205,
                 reg204,
                 reg125,
                 (1'h0)};
  module10 #() modinst59 (wire58, clk, wire9, wire6, wire7, wire8, (8'hb1));
  assign wire60 = wire6;
  module61 #() modinst124 (wire123, clk, wire60, wire7, wire9, wire8);
  always
    @(posedge clk) begin
      reg125 <= wire123[(4'hb):(3'h5)];
    end
  assign wire126 = wire58;
  assign wire127 = $unsigned($signed((&((reg125 <<< wire123) ^~ $unsigned(wire58)))));
  assign wire128 = $signed((~|{(&wire9[(4'hd):(4'hb)])}));
  assign wire129 = $unsigned(wire8[(5'h13):(1'h1)]);
  assign wire130 = wire127;
  assign wire131 = wire8;
  assign wire132 = $signed({(wire128[(2'h3):(1'h0)] ?
                           (wire60[(3'h4):(3'h4)] ?
                               (wire9 ^ wire131) : (wire7 == wire6)) : (^(wire123 ?
                               wire7 : wire58))),
                       wire126[(5'h11):(3'h7)]});
  assign wire133 = wire131[(4'hb):(3'h4)];
  module134 #() modinst176 (.wire137(wire130), .y(wire175), .wire136(wire131), .clk(clk), .wire138(wire60), .wire135(wire6));
  module177 #() modinst203 (wire202, clk, wire132, wire175, reg125, wire58);
  always
    @(posedge clk) begin
      reg204 <= (&$unsigned($signed($signed($unsigned(wire129)))));
      if (($unsigned((8'hb1)) - $unsigned({$unsigned(wire129),
          (^~wire202[(3'h4):(3'h4)])})))
        begin
          reg205 <= wire202[(3'h7):(2'h3)];
          reg206 <= (~(~&wire6));
          if (wire7[(4'he):(3'h4)])
            begin
              reg207 <= $unsigned($unsigned(($signed(wire132) ?
                  ((reg205 == wire129) ?
                      {wire8, wire132} : (wire126 ?
                          wire8 : wire60)) : $signed(wire58[(3'h4):(2'h3)]))));
              reg208 <= reg204;
            end
          else
            begin
              reg207 <= $signed((~|wire128[(3'h4):(1'h0)]));
              reg208 <= ((wire131[(4'h9):(3'h7)] ?
                  wire130[(3'h5):(1'h1)] : $unsigned((&wire60))) - ($unsigned($unsigned($signed(wire6))) >>> (wire130 * ($unsigned(reg204) ?
                  (wire133 ? reg206 : wire131) : (reg208 ? wire132 : wire8)))));
              reg209 <= ($signed($signed(wire130)) && ($signed(reg208) ?
                  $signed((-$unsigned(reg204))) : wire126));
              reg210 <= wire58;
              reg211 <= wire58;
            end
          if (($unsigned((reg204[(3'h7):(3'h7)] ~^ reg125[(4'ha):(3'h6)])) >= reg208[(3'h5):(1'h1)]))
            begin
              reg212 <= (((-$unsigned(wire131[(4'hb):(3'h7)])) ?
                      (&{$signed(reg204)}) : (wire7[(4'hc):(1'h0)] ?
                          ((reg205 ?
                              (8'had) : (8'h9e)) >> $signed(wire129)) : (^$unsigned((8'hba))))) ?
                  {$signed((wire131 | $signed(wire131)))} : $signed($signed(wire128)));
              reg213 <= $unsigned($unsigned((wire126[(2'h2):(1'h0)] >> ($signed(wire60) ?
                  (^reg208) : (~|wire60)))));
              reg214 <= ($unsigned(((+$signed(reg204)) | $unsigned(wire58[(3'h5):(2'h3)]))) ?
                  $signed(wire7) : (~&(wire133 || $unsigned((&wire123)))));
              reg215 <= ((8'hbe) <= (&(~|wire130[(4'hc):(1'h0)])));
              reg216 <= ($signed(($unsigned(reg212[(1'h0):(1'h0)]) >>> (+wire6[(4'h9):(4'h8)]))) ?
                  ($signed(reg215[(3'h4):(1'h1)]) ?
                      ($signed(wire123) ?
                          $signed(wire6[(2'h2):(2'h2)]) : ($unsigned(reg212) ?
                              $unsigned((8'hb9)) : wire60[(1'h0):(1'h0)])) : wire128) : (!wire60));
            end
          else
            begin
              reg212 <= wire126[(4'ha):(2'h3)];
              reg213 <= (wire60 >>> ((($signed(wire7) || $signed(wire58)) ?
                      $unsigned(((8'haa) ?
                          wire175 : wire129)) : (+$signed(reg209))) ?
                  (^~$signed(reg205[(4'hc):(4'hb)])) : $signed((+wire202[(4'h8):(3'h4)]))));
              reg214 <= (7'h40);
              reg215 <= $unsigned(wire8[(3'h4):(2'h3)]);
            end
        end
      else
        begin
          reg205 <= $signed(wire58[(3'h4):(1'h0)]);
          if (((((!wire133[(3'h7):(2'h3)]) & wire58) || wire130) && $signed(wire126)))
            begin
              reg206 <= (~((({wire8} ?
                      wire129 : $unsigned(reg204)) > ($unsigned(wire128) > (wire130 <= reg208))) ?
                  {(8'hac)} : {reg205}));
              reg207 <= (^$unsigned($signed(({wire123, reg208} ?
                  $signed(reg209) : $unsigned(wire126)))));
              reg208 <= wire6;
              reg209 <= ((8'h9f) ?
                  reg207 : ({wire131} ?
                      $signed(wire131) : (-(^$signed(wire133)))));
              reg210 <= reg209[(4'ha):(3'h4)];
            end
          else
            begin
              reg206 <= ({{$signed((wire128 != reg211)), (~|{reg212})}} ?
                  wire7[(4'hc):(4'h8)] : ((!$signed((!wire130))) ?
                      $unsigned(wire129) : ($unsigned(wire126) ?
                          wire127[(3'h6):(1'h1)] : $signed($signed(reg214)))));
              reg207 <= {reg207[(1'h0):(1'h0)]};
              reg208 <= wire133[(4'h8):(3'h6)];
            end
          reg211 <= reg206[(3'h5):(3'h4)];
        end
    end
endmodule

module module177
#(parameter param200 = {({{(|(8'haa))}, (((8'hb0) ? (8'ha8) : (8'had)) - (!(8'hb7)))} ? ((((8'hb6) ? (8'ha2) : (8'hb3)) ? ((8'ha4) & (8'hbf)) : ((8'hb0) == (8'hb4))) >>> (8'hbc)) : {(((8'hab) >>> (8'ha1)) ? ((8'haf) ? (8'hac) : (8'hbe)) : ((8'hab) & (8'hb3)))}), (((((8'haa) ? (8'hb9) : (7'h44)) ? ((8'hb1) ? (8'haf) : (8'hb8)) : (!(7'h40))) ? ((^(8'hb7)) ? (~^(8'ha8)) : ((8'ha1) > (7'h43))) : (((8'hb2) >>> (8'ha6)) >>> ((8'hbe) ^ (8'ha8)))) && ((((8'hbe) <= (8'hb6)) ? {(8'haf)} : ((8'ha6) ? (8'hbb) : (8'had))) ^ ({(8'hb1)} + {(8'ha5)})))}, 
parameter param201 = (^~(((((8'ha0) ? (7'h41) : param200) ? (&param200) : (~&param200)) ~^ (((7'h43) ? param200 : param200) ? (param200 ? param200 : param200) : {param200})) || (({param200} << ((8'hb8) <= param200)) <<< ((param200 ? param200 : param200) ? param200 : (~(8'hbc)))))))
(y, clk, wire181, wire180, wire179, wire178);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire181;
  input wire [(4'ha):(1'h0)] wire180;
  input wire [(3'h6):(1'h0)] wire179;
  input wire [(3'h6):(1'h0)] wire178;
  wire [(5'h10):(1'h0)] wire199;
  wire signed [(3'h5):(1'h0)] wire198;
  wire [(4'he):(1'h0)] wire197;
  wire signed [(5'h13):(1'h0)] wire196;
  wire [(5'h10):(1'h0)] wire185;
  wire signed [(4'hc):(1'h0)] wire184;
  wire [(5'h11):(1'h0)] wire183;
  wire [(2'h3):(1'h0)] wire182;
  reg [(4'ha):(1'h0)] reg195 = (1'h0);
  reg [(5'h10):(1'h0)] reg194 = (1'h0);
  reg [(3'h7):(1'h0)] reg193 = (1'h0);
  reg [(3'h7):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg190 = (1'h0);
  reg [(2'h3):(1'h0)] reg189 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg188 = (1'h0);
  reg [(3'h7):(1'h0)] reg187 = (1'h0);
  reg [(4'hf):(1'h0)] reg186 = (1'h0);
  assign y = {wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 (1'h0)};
  assign wire182 = (wire178[(2'h2):(1'h1)] * (~$signed({(wire179 & wire181),
                       ((8'hb2) * (8'hac))})));
  assign wire183 = wire181[(4'h9):(3'h5)];
  assign wire184 = $signed((!$signed(wire182)));
  assign wire185 = (^wire179[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg186 <= wire181[(3'h7):(2'h3)];
      reg187 <= (8'h9c);
      if (wire179)
        begin
          reg188 <= ($unsigned((((wire185 ?
                      (8'ha6) : (7'h40)) << $unsigned(wire185)) ?
                  {(wire178 ? reg187 : wire178)} : ((8'ha8) ?
                      (reg186 ? wire183 : (8'ha9)) : (reg186 || reg187)))) ?
              (((wire183[(3'h4):(2'h3)] >= wire180[(3'h4):(2'h2)]) ?
                      wire185 : {wire184[(3'h5):(2'h2)], $signed((8'ha6))}) ?
                  wire180 : (8'had)) : (~|$signed({$signed(wire184)})));
          reg189 <= (wire182[(1'h1):(1'h1)] ?
              (wire179[(3'h4):(3'h4)] - wire185[(4'h8):(3'h7)]) : (wire181[(3'h4):(1'h1)] ?
                  wire180 : wire179[(3'h5):(1'h1)]));
        end
      else
        begin
          reg188 <= (((($unsigned(wire184) ?
                      $signed(reg186) : (reg189 < wire184)) ?
                  wire185[(4'h9):(2'h2)] : wire182) ?
              (^~(&(wire180 ?
                  reg189 : (8'haf)))) : ($signed((7'h44)) >>> ($signed((8'ha9)) ?
                  (reg188 > (8'ha4)) : ((7'h43) ?
                      wire182 : reg189)))) >= ((^$unsigned((-wire185))) ?
              $signed(reg188[(3'h7):(1'h0)]) : $unsigned($signed((^wire179)))));
          if (wire180)
            begin
              reg189 <= ((-reg187[(3'h7):(2'h3)]) ^ wire183[(3'h7):(1'h1)]);
              reg190 <= (&(((wire180[(4'h8):(3'h6)] != (wire185 & reg186)) != $signed((~^wire183))) <<< $signed(reg189)));
            end
          else
            begin
              reg189 <= {wire181};
              reg190 <= (wire178 | (($unsigned((reg186 && wire178)) ?
                      (reg187 ?
                          ((8'hba) == reg187) : $unsigned(wire184)) : $unsigned((!(8'ha7)))) ?
                  reg190 : $signed($unsigned($unsigned(wire184)))));
              reg191 <= {reg188[(3'h6):(3'h4)], $signed(reg186)};
              reg192 <= $signed({$signed({reg190[(5'h14):(5'h10)]}), wire185});
            end
          reg193 <= {{reg187}, (-(8'hba))};
        end
      reg194 <= (8'h9d);
      reg195 <= (wire182 - reg187[(1'h1):(1'h0)]);
    end
  assign wire196 = (wire179[(2'h3):(1'h0)] | {reg186[(2'h2):(1'h0)]});
  assign wire197 = wire179[(2'h3):(2'h3)];
  assign wire198 = wire179;
  assign wire199 = {$signed({(reg195[(3'h7):(2'h3)] >>> (8'hb7))})};
endmodule

module module134
#(parameter param173 = (((8'hb0) >= (!((8'ha5) ? ((8'hba) ? (8'ha9) : (8'had)) : ((8'hb0) ? (8'hb8) : (8'hb9))))) << ({(((8'h9f) ? (8'hb8) : (7'h41)) ? (~^(8'hb9)) : ((8'ha7) * (8'ha7))), ({(8'hb8)} ? ((8'hbf) ? (8'hbe) : (7'h43)) : ((8'hbc) ? (8'ha1) : (8'hb6)))} ? (|(~&((8'ha4) ? (7'h42) : (8'hb3)))) : ((((8'haa) + (8'ha3)) ^ (+(8'ha8))) <<< (((8'haf) ? (8'hae) : (8'hb5)) && (~&(8'hb5)))))), 
parameter param174 = ({param173} ? ((~^{(8'haa), (^param173)}) ? (~(8'haf)) : (^(param173 == (param173 ? param173 : param173)))) : (param173 ? param173 : (((&param173) ? ((7'h41) ~^ param173) : (+(8'ha7))) ? (~^(-param173)) : (8'hbb)))))
(y, clk, wire138, wire137, wire136, wire135);
  output wire [(32'h131):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire138;
  input wire [(5'h10):(1'h0)] wire137;
  input wire signed [(3'h6):(1'h0)] wire136;
  input wire [(4'h9):(1'h0)] wire135;
  wire [(5'h10):(1'h0)] wire172;
  wire [(4'ha):(1'h0)] wire171;
  wire signed [(3'h7):(1'h0)] wire159;
  wire signed [(2'h3):(1'h0)] wire154;
  wire [(2'h2):(1'h0)] wire153;
  reg signed [(2'h3):(1'h0)] reg170 = (1'h0);
  reg [(3'h4):(1'h0)] reg169 = (1'h0);
  reg [(3'h6):(1'h0)] reg168 = (1'h0);
  reg [(4'h8):(1'h0)] reg167 = (1'h0);
  reg [(3'h7):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg165 = (1'h0);
  reg [(5'h15):(1'h0)] reg164 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg163 = (1'h0);
  reg [(4'hc):(1'h0)] reg162 = (1'h0);
  reg [(3'h7):(1'h0)] reg161 = (1'h0);
  reg [(3'h6):(1'h0)] reg160 = (1'h0);
  reg [(2'h3):(1'h0)] reg158 = (1'h0);
  reg [(4'hb):(1'h0)] reg157 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg150 = (1'h0);
  reg [(3'h6):(1'h0)] reg149 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg148 = (1'h0);
  reg [(5'h12):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg146 = (1'h0);
  reg [(3'h5):(1'h0)] reg145 = (1'h0);
  reg [(5'h15):(1'h0)] reg144 = (1'h0);
  reg [(5'h15):(1'h0)] reg143 = (1'h0);
  reg [(3'h6):(1'h0)] reg142 = (1'h0);
  reg [(4'ha):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg140 = (1'h0);
  reg [(4'h8):(1'h0)] reg139 = (1'h0);
  assign y = {wire172,
                 wire171,
                 wire159,
                 wire154,
                 wire153,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg139 <= ((((+wire138[(1'h1):(1'h0)]) == ({wire138, wire137} ?
                  (wire136 ? wire136 : wire135) : (wire138 ?
                      wire138 : wire138))) ?
              wire135 : $unsigned($signed((~wire136)))) ?
          ($unsigned(((wire138 ? wire136 : wire138) ?
                  wire136 : $unsigned(wire136))) ?
              wire137 : $signed((-(8'ha4)))) : $signed(($unsigned(((8'ha3) ?
              (8'hbe) : wire136)) * (((8'hb3) ~^ wire135) ~^ (+wire136)))));
      reg140 <= $signed(wire137[(4'hc):(4'ha)]);
      reg141 <= {wire136,
          (reg140[(2'h2):(1'h1)] <<< (~|($signed(reg139) ?
              wire138[(1'h0):(1'h0)] : (wire136 ? wire138 : wire136))))};
      reg142 <= reg141[(4'h9):(2'h3)];
    end
  always
    @(posedge clk) begin
      reg143 <= (^~(|(reg142 >> $signed((reg142 ? wire138 : reg142)))));
      reg144 <= (-((((reg142 <<< wire138) ?
              reg141 : reg141[(1'h1):(1'h1)]) == (wire136[(3'h4):(1'h0)] & reg143)) ?
          (8'haa) : (~^reg139[(3'h5):(2'h2)])));
      reg145 <= $unsigned(wire135);
      if (wire135)
        begin
          reg146 <= $unsigned(((((wire137 ? wire138 : reg143) ?
              reg141[(3'h7):(1'h1)] : wire138) || ((wire136 ?
              reg144 : reg143) - wire137)) >= $unsigned(wire136[(3'h6):(1'h0)])));
          reg147 <= ((reg144 & wire136[(3'h4):(3'h4)]) > {(reg141[(4'h8):(2'h3)] ?
                  (+(wire136 ? reg145 : reg143)) : (~&(&reg145)))});
          reg148 <= reg141[(2'h3):(2'h3)];
          if ($signed($signed(((reg144[(5'h13):(5'h11)] <= $signed(reg148)) ~^ (wire135[(3'h4):(3'h4)] - ((7'h42) ?
              reg141 : reg147))))))
            begin
              reg149 <= $signed($unsigned(({$unsigned(reg145),
                      {(8'hb0), reg144}} ?
                  {$signed(wire135),
                      $signed(reg148)} : (!reg144[(5'h11):(5'h11)]))));
              reg150 <= ((~&((~&reg141[(4'h9):(4'h9)]) > (wire138[(1'h1):(1'h0)] <<< reg147[(4'h9):(2'h3)]))) >> (8'h9d));
            end
          else
            begin
              reg149 <= wire138;
              reg150 <= reg150[(2'h3):(1'h0)];
              reg151 <= (-reg150[(2'h2):(1'h1)]);
              reg152 <= $unsigned((reg149 ?
                  $unsigned($signed(reg143[(4'hb):(3'h7)])) : $unsigned((reg149[(1'h1):(1'h0)] << $unsigned(reg142)))));
            end
        end
      else
        begin
          if (reg141)
            begin
              reg146 <= ($unsigned((~&reg144[(1'h1):(1'h1)])) ?
                  $unsigned((~$signed(reg151))) : $signed($signed(wire138[(1'h1):(1'h1)])));
              reg147 <= (reg151 >>> reg151);
              reg148 <= {($signed(((-reg145) >= (~|reg142))) ?
                      ({reg142[(1'h0):(1'h0)], (8'ha1)} ?
                          $signed((reg145 ?
                              reg152 : reg145)) : $signed($unsigned(wire135))) : ($unsigned(wire136) ?
                          ((reg146 ? (8'had) : reg149) == (reg143 ?
                              reg147 : reg142)) : (reg140 != wire136)))};
              reg149 <= $unsigned((!reg142));
            end
          else
            begin
              reg146 <= {wire137, $unsigned(reg152)};
              reg147 <= (8'ha0);
              reg148 <= reg139[(1'h0):(1'h0)];
              reg149 <= $signed($signed(wire135));
              reg150 <= ($unsigned((((wire137 && reg146) ?
                      ((8'ha7) > (8'hbb)) : $signed(reg146)) < reg141[(3'h6):(2'h2)])) ?
                  (|reg147[(3'h4):(1'h0)]) : $signed(wire135));
            end
        end
    end
  assign wire153 = (^~(^~(^wire137[(3'h5):(2'h2)])));
  assign wire154 = $signed((reg140[(1'h0):(1'h0)] >= (8'haf)));
  always
    @(posedge clk) begin
      reg155 <= {wire136};
      reg156 <= $unsigned($signed(reg143[(4'ha):(4'h8)]));
      reg157 <= ($signed((~&reg139[(4'h8):(4'h8)])) ^~ (reg144[(4'hc):(2'h2)] >> $unsigned($signed((reg151 >> (8'had))))));
      reg158 <= {((~^reg150[(2'h3):(1'h1)]) ?
              reg156 : {((reg145 ? reg152 : (8'ha5)) != reg148),
                  ($unsigned(reg146) >= (&reg157))})};
    end
  assign wire159 = ((($unsigned((reg155 ?
                           reg155 : reg141)) << $signed(wire137[(4'hd):(4'h9)])) <= reg156) ?
                       ((reg150 && wire135[(3'h7):(3'h4)]) ^~ reg141[(4'ha):(1'h1)]) : (reg141 ?
                           $signed(wire137[(4'hd):(3'h5)]) : (reg147 < ($unsigned((8'hb3)) == (reg139 ?
                               reg139 : reg147)))));
  always
    @(posedge clk) begin
      if ($signed($unsigned(reg148[(2'h2):(1'h1)])))
        begin
          if ((reg140 - $signed(wire159[(1'h0):(1'h0)])))
            begin
              reg160 <= (7'h43);
              reg161 <= $signed(reg157);
              reg162 <= (^wire135[(2'h3):(2'h2)]);
              reg163 <= $unsigned($unsigned($unsigned({(~reg160),
                  reg140[(4'hd):(4'h8)]})));
            end
          else
            begin
              reg160 <= reg162;
            end
          reg164 <= ($unsigned((~|$unsigned(reg149[(1'h0):(1'h0)]))) >= reg155);
          reg165 <= ($unsigned(((7'h40) <<< $unsigned($unsigned(wire154)))) ?
              ((reg158[(1'h1):(1'h1)] ?
                  (reg164 ?
                      wire137[(2'h2):(1'h0)] : (-reg161)) : (&reg147[(4'he):(2'h3)])) + ($signed(reg150[(3'h4):(3'h4)]) <<< $unsigned((wire159 ?
                  (8'ha1) : reg152)))) : reg157);
          if (reg155)
            begin
              reg166 <= ($unsigned({$signed(reg148), (~&(reg143 >= reg140))}) ?
                  $signed(reg149[(2'h3):(2'h3)]) : wire138[(1'h1):(1'h0)]);
              reg167 <= $unsigned(((reg151[(2'h3):(1'h1)] + wire153[(2'h2):(2'h2)]) ?
                  (($signed((8'ha7)) ?
                      (~|reg164) : reg162[(3'h5):(3'h5)]) ^~ (^wire153)) : $unsigned(wire136)));
            end
          else
            begin
              reg166 <= reg165;
              reg167 <= ($signed((+{(8'hbd)})) + {$unsigned((((8'hbf) << reg163) || (~|reg149)))});
              reg168 <= ($unsigned((($signed((8'h9e)) ?
                      (reg140 + (8'hac)) : {reg155}) ?
                  reg160 : $signed(reg141[(4'ha):(4'h9)]))) <<< $signed($signed(({reg141,
                  reg157} * reg139))));
            end
          reg169 <= $signed(reg148[(1'h0):(1'h0)]);
        end
      else
        begin
          if (reg158[(1'h0):(1'h0)])
            begin
              reg160 <= (&reg165[(2'h3):(1'h1)]);
              reg161 <= reg149[(3'h4):(2'h3)];
              reg162 <= {$unsigned(reg155)};
            end
          else
            begin
              reg160 <= reg148;
              reg161 <= (($unsigned(reg167[(3'h6):(1'h1)]) ?
                      {wire138,
                          ((reg163 ? wire136 : reg141) ?
                              reg151 : $unsigned(reg148))} : (|reg169)) ?
                  (^~(reg162[(2'h3):(2'h2)] <= $signed($unsigned(wire135)))) : wire159[(1'h1):(1'h0)]);
              reg162 <= $signed($unsigned((~^reg155[(2'h2):(2'h2)])));
            end
        end
      reg170 <= ({(8'hbe), reg139[(3'h7):(1'h0)]} ?
          (-(!({reg158,
              reg156} + reg150[(1'h1):(1'h0)]))) : $signed(((~&(|reg157)) ~^ reg146)));
    end
  assign wire171 = $signed((!(~^(reg168[(2'h2):(1'h1)] != (^reg170)))));
  assign wire172 = ((reg161 ^ wire137[(4'h8):(2'h3)]) | reg160);
endmodule

module module61
#(parameter param121 = ((((((8'hbb) < (8'hbb)) ? ((8'h9d) ? (8'hbf) : (8'hb5)) : ((8'hbf) & (8'hbe))) != ((8'ha9) ? ((8'ha0) ? (7'h40) : (8'ha4)) : (~^(8'hac)))) ? ({(!(8'hae)), ((8'hb0) ^~ (8'hac))} ? (((8'hb9) | (8'hae)) ? ((8'hbb) ? (8'hb4) : (8'hb9)) : ((8'h9f) ? (8'hb3) : (8'hb7))) : (~&(^~(8'ha8)))) : (8'ha7)) * ((+((~|(8'ha7)) - (8'hbc))) == (!(+((8'hac) ? (8'hb9) : (8'ha3)))))), 
parameter param122 = (8'hb1))
(y, clk, wire65, wire64, wire63, wire62);
  output wire [(32'h297):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire65;
  input wire signed [(5'h13):(1'h0)] wire64;
  input wire [(4'h8):(1'h0)] wire63;
  input wire signed [(5'h12):(1'h0)] wire62;
  wire signed [(2'h2):(1'h0)] wire117;
  wire [(2'h2):(1'h0)] wire116;
  wire [(5'h10):(1'h0)] wire115;
  wire signed [(4'ha):(1'h0)] wire114;
  wire signed [(5'h14):(1'h0)] wire113;
  wire [(2'h2):(1'h0)] wire112;
  wire [(3'h5):(1'h0)] wire85;
  wire signed [(5'h12):(1'h0)] wire82;
  wire [(4'hd):(1'h0)] wire81;
  wire [(4'h9):(1'h0)] wire80;
  wire [(5'h10):(1'h0)] wire79;
  wire [(5'h12):(1'h0)] wire78;
  wire signed [(4'hd):(1'h0)] wire77;
  wire signed [(3'h6):(1'h0)] wire69;
  wire [(4'h9):(1'h0)] wire68;
  wire signed [(5'h11):(1'h0)] wire67;
  wire [(4'hb):(1'h0)] wire66;
  reg signed [(4'he):(1'h0)] reg120 = (1'h0);
  reg [(4'h8):(1'h0)] reg119 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg118 = (1'h0);
  reg signed [(4'he):(1'h0)] reg111 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg110 = (1'h0);
  reg [(4'hb):(1'h0)] reg109 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg108 = (1'h0);
  reg [(4'hb):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg105 = (1'h0);
  reg [(5'h13):(1'h0)] reg104 = (1'h0);
  reg [(2'h3):(1'h0)] reg103 = (1'h0);
  reg [(5'h15):(1'h0)] reg102 = (1'h0);
  reg signed [(4'he):(1'h0)] reg101 = (1'h0);
  reg [(4'ha):(1'h0)] reg100 = (1'h0);
  reg [(5'h12):(1'h0)] reg99 = (1'h0);
  reg signed [(4'he):(1'h0)] reg98 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg97 = (1'h0);
  reg [(3'h5):(1'h0)] reg96 = (1'h0);
  reg [(4'hb):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg94 = (1'h0);
  reg [(4'he):(1'h0)] reg93 = (1'h0);
  reg signed [(4'he):(1'h0)] reg92 = (1'h0);
  reg [(5'h13):(1'h0)] reg91 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg90 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg88 = (1'h0);
  reg [(4'he):(1'h0)] reg87 = (1'h0);
  reg [(5'h12):(1'h0)] reg86 = (1'h0);
  reg [(5'h12):(1'h0)] reg84 = (1'h0);
  reg [(5'h14):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg75 = (1'h0);
  reg [(4'hb):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  reg [(4'he):(1'h0)] reg71 = (1'h0);
  reg [(4'ha):(1'h0)] reg70 = (1'h0);
  assign y = {wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire85,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 reg120,
                 reg119,
                 reg118,
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
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg84,
                 reg83,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 (1'h0)};
  assign wire66 = wire62[(3'h7):(3'h5)];
  assign wire67 = $signed(wire62);
  assign wire68 = (({wire64} ?
                      $signed($unsigned(wire63[(1'h0):(1'h0)])) : $signed($unsigned((^~(8'hb1))))) < ($signed((~^wire64[(2'h3):(2'h2)])) ?
                      wire62[(4'h8):(1'h1)] : wire66));
  assign wire69 = ($unsigned(wire64[(5'h13):(5'h12)]) ?
                      (~|($signed({(8'hbd)}) ?
                          $signed({(8'hbc)}) : ($signed(wire67) ?
                              wire64 : (wire62 ?
                                  wire65 : wire68)))) : $signed((~&($unsigned((8'ha3)) >>> $signed(wire68)))));
  always
    @(posedge clk) begin
      reg70 <= {$signed($signed((8'hbc))),
          (((|(wire69 ? wire67 : (8'ha4))) ?
              (~&wire67[(3'h5):(3'h5)]) : $signed((|wire65))) <<< $unsigned(wire68[(4'h8):(3'h7)]))};
      reg71 <= ($signed((wire66[(3'h6):(2'h2)] << $signed((8'hbe)))) ?
          {$signed((8'hab)), reg70} : ($unsigned($unsigned($signed(wire63))) ?
              (^(wire68[(3'h4):(1'h0)] | $unsigned(wire63))) : wire63));
      reg72 <= ($unsigned(wire69) | $signed({(+wire65),
          (((8'ha8) ? wire67 : reg71) ?
              wire65[(4'hd):(4'hb)] : $unsigned(reg71))}));
      reg73 <= $unsigned((wire65 ?
          wire66[(4'h9):(4'h8)] : $signed($signed((^reg70)))));
    end
  always
    @(posedge clk) begin
      if (wire64)
        begin
          reg74 <= ($unsigned(({(~(8'hb1))} ?
              ($signed(wire69) != (8'ha8)) : wire66)) <= $signed(($signed((wire69 < wire63)) ?
              ($unsigned(wire64) ?
                  $signed(wire69) : (reg73 ? reg73 : wire68)) : wire69)));
          reg75 <= ((wire68 != (((8'hbf) ?
                  ((8'hb9) ^~ wire64) : $unsigned(wire68)) < (reg73 ?
                  $signed(wire66) : (wire66 ? wire62 : wire62)))) ?
              $signed($unsigned($unsigned($unsigned((8'hb9))))) : wire66);
          reg76 <= $signed($unsigned((~reg73)));
        end
      else
        begin
          reg74 <= $unsigned(reg73[(3'h7):(3'h7)]);
        end
    end
  assign wire77 = $signed($signed(wire67));
  assign wire78 = $signed(wire64[(3'h7):(2'h3)]);
  assign wire79 = reg70[(1'h1):(1'h1)];
  assign wire80 = (|(wire68[(1'h1):(1'h1)] || $unsigned(reg72[(5'h11):(2'h2)])));
  assign wire81 = $signed(($unsigned($unsigned($signed(reg75))) || ({wire62[(4'hb):(3'h5)],
                          $unsigned(wire66)} ?
                      (8'hb7) : wire80)));
  assign wire82 = (((wire62 ?
                              reg70 : (((8'hbb) ?
                                  (8'h9d) : wire66) || $unsigned((8'hb1)))) ?
                          $unsigned($unsigned((7'h42))) : wire68) ?
                      (((wire62 ? $unsigned(reg76) : $unsigned(wire65)) ?
                              {(~|wire77)} : $signed((wire77 ?
                                  reg73 : reg70))) ?
                          wire69[(3'h6):(3'h4)] : {$signed($signed((8'ha3)))}) : (($unsigned(wire63[(3'h4):(2'h3)]) ?
                              $signed({wire65, reg75}) : $unsigned((~&reg73))) ?
                          {wire66[(4'ha):(2'h3)]} : (&($unsigned((8'hba)) ?
                              $unsigned(reg73) : {wire65, (8'ha1)}))));
  always
    @(posedge clk) begin
      reg83 <= (8'hb6);
      reg84 <= reg71[(4'hc):(4'h9)];
    end
  assign wire85 = ((wire82 ?
                          ((reg74[(4'h9):(3'h6)] ?
                                  reg74[(1'h0):(1'h0)] : (wire66 <= wire69)) ?
                              wire62[(3'h7):(3'h4)] : ({reg72, wire64} ?
                                  (~|reg71) : (wire66 < wire77))) : wire67[(4'hd):(4'hb)]) ?
                      ($unsigned((~wire81)) && wire68) : $unsigned($unsigned($signed((^~wire77)))));
  always
    @(posedge clk) begin
      reg86 <= (~($unsigned(((reg76 >= reg72) >= (~|wire78))) && (~{((8'hb1) >> wire77)})));
      reg87 <= ((($unsigned({wire65, (8'ha7)}) ?
              wire79[(3'h4):(2'h3)] : (wire77[(4'ha):(4'h9)] != wire80)) || $unsigned(((wire66 ^ reg75) ~^ {wire85,
              wire68}))) ?
          wire63[(4'h8):(1'h1)] : $signed($signed($signed((reg73 >>> (8'ha2))))));
      if ($unsigned($signed(reg84[(5'h12):(4'hc)])))
        begin
          reg88 <= (~|(reg86 ^~ ({$signed(reg86), $signed(wire79)} ?
              $unsigned((wire77 <<< wire66)) : reg87[(3'h5):(1'h1)])));
          reg89 <= (8'hb1);
          reg90 <= (^~($unsigned((^((8'hab) - reg88))) ?
              $unsigned({reg70, $signed(reg73)}) : (((8'hba) <<< (reg73 ?
                      wire82 : wire63)) ?
                  reg70[(1'h1):(1'h0)] : reg73)));
        end
      else
        begin
          reg88 <= reg73;
          reg89 <= $signed({{wire78}});
          reg90 <= (((((wire69 <<< (8'ha8)) <<< (wire68 ^ wire66)) * reg74) ?
                  $signed((^$signed((8'hae)))) : ($unsigned((wire69 + wire82)) & wire82)) ?
              $signed(wire80[(3'h4):(1'h0)]) : ((((reg70 ~^ wire63) >>> $unsigned(reg70)) ^~ $signed(wire62[(3'h5):(1'h1)])) ?
                  wire68 : (+(wire82 > (reg89 << wire66)))));
          if ({($unsigned($unsigned((^~(8'ha6)))) + ((((7'h43) ?
                          (8'hbb) : wire69) ?
                      (~&reg70) : {reg76}) ?
                  reg83 : ((|wire62) * (reg86 <<< wire80))))})
            begin
              reg91 <= $signed({$signed(({wire64, (8'had)} ? reg83 : {reg83})),
                  (~|{reg72[(3'h6):(2'h3)]})});
            end
          else
            begin
              reg91 <= ((^$unsigned($signed(wire80[(4'h8):(4'h8)]))) < reg71[(4'h9):(3'h7)]);
              reg92 <= {(~|($signed((|reg88)) ?
                      wire65 : (!(reg75 ? (8'hb2) : wire64))))};
              reg93 <= (wire68 ? reg76[(2'h2):(1'h0)] : (8'hae));
              reg94 <= reg92[(4'hd):(4'ha)];
            end
        end
      reg95 <= ((reg89 ? $signed(reg90) : reg84[(2'h2):(1'h0)]) ?
          $signed(reg70[(2'h3):(1'h1)]) : (~|({$unsigned(reg71)} ?
              (+(reg88 <= reg74)) : $unsigned($unsigned(wire77)))));
      if (wire79)
        begin
          reg96 <= (|$signed($unsigned($signed($unsigned(wire69)))));
          if ($unsigned($signed(($unsigned(wire78) ?
              (-(~(8'haa))) : ((wire77 ^~ reg86) ?
                  (!reg73) : (wire66 >> reg70))))))
            begin
              reg97 <= reg89[(2'h3):(1'h1)];
              reg98 <= $signed($signed(($unsigned((reg89 + reg70)) >> reg72[(4'h9):(2'h2)])));
              reg99 <= (~$unsigned({(~&(reg75 ? wire64 : wire81)),
                  ((8'ha4) ? wire64[(5'h12):(5'h11)] : (reg97 >= (8'h9c)))}));
            end
          else
            begin
              reg97 <= ($signed(($signed((^~reg97)) <<< (^$unsigned(reg75)))) + ($unsigned(($unsigned(reg92) ?
                      (reg86 > reg95) : wire80)) ?
                  wire67[(4'hc):(3'h6)] : ($unsigned(((8'ha7) ?
                      reg94 : (8'haa))) == reg73)));
              reg98 <= $signed((reg75 ?
                  ($unsigned($unsigned((8'hb2))) - (((8'hbb) ?
                          wire79 : (8'haa)) ?
                      (wire82 << (8'haa)) : $unsigned(reg93))) : {$signed({reg87,
                          reg73})}));
              reg99 <= $signed(reg89);
              reg100 <= $signed(((^reg70[(3'h5):(1'h1)]) ?
                  (($unsigned(wire67) ~^ (wire67 & reg72)) < (~|reg96)) : reg84));
            end
          if ((!reg89))
            begin
              reg101 <= $signed(({wire65[(3'h4):(2'h2)]} ?
                  $unsigned({wire62, (wire85 ? reg72 : wire78)}) : (wire65 ?
                      reg76[(4'h8):(4'h8)] : reg97)));
              reg102 <= reg95;
              reg103 <= reg95;
              reg104 <= reg73[(4'h9):(1'h0)];
              reg105 <= reg87[(4'hc):(1'h1)];
            end
          else
            begin
              reg101 <= (~reg92);
              reg102 <= (!(($signed($signed(reg105)) ?
                      reg97[(3'h7):(2'h2)] : wire77) ?
                  $unsigned((|(wire78 != wire77))) : $signed(reg94)));
            end
          if ($unsigned((^reg88[(2'h2):(1'h1)])))
            begin
              reg106 <= $unsigned((reg84 <= reg87[(4'hb):(4'h9)]));
              reg107 <= (+((8'hb1) ?
                  (!$signed(((8'h9f) >= reg92))) : $unsigned(reg89)));
              reg108 <= ($unsigned($signed(($unsigned(reg92) ?
                      ((8'h9d) & wire64) : $unsigned(wire81)))) ?
                  $signed($unsigned({reg101})) : $unsigned($unsigned(reg74[(3'h5):(2'h2)])));
              reg109 <= reg90;
              reg110 <= $signed(reg88[(1'h0):(1'h0)]);
            end
          else
            begin
              reg106 <= ((($signed(reg71[(4'ha):(1'h0)]) << ($signed(reg107) >> reg91)) >>> reg100) << (^~$signed(wire80)));
              reg107 <= $unsigned(((reg72[(4'h9):(4'h9)] && wire65[(3'h6):(3'h6)]) - ((-reg74[(3'h4):(2'h3)]) | $signed(((8'hac) ?
                  wire79 : reg102)))));
              reg108 <= (reg93 ?
                  {(-$signed(reg100[(2'h3):(1'h0)])),
                      wire77[(2'h3):(2'h3)]} : (8'hbb));
            end
          reg111 <= (~^$unsigned(($signed((~|wire67)) <<< reg70)));
        end
      else
        begin
          reg96 <= (~(8'haa));
          if ($unsigned($unsigned(reg99[(3'h7):(1'h0)])))
            begin
              reg97 <= reg99[(1'h1):(1'h0)];
              reg98 <= (($signed(($unsigned(reg107) == (^~reg74))) ?
                      reg89 : $unsigned($unsigned(reg105[(3'h7):(3'h6)]))) ?
                  ({reg73} ?
                      $unsigned(wire69) : $signed(reg70)) : {wire66[(2'h2):(2'h2)],
                      (~|reg109)});
              reg99 <= {reg97[(4'h8):(3'h5)], (8'h9c)};
              reg100 <= $unsigned({(~&$unsigned(reg103[(2'h2):(1'h0)]))});
            end
          else
            begin
              reg97 <= ($signed((((wire85 ? wire81 : wire80) ?
                      (wire65 ?
                          wire68 : reg103) : (~|reg90)) ^~ $signed((wire62 ?
                      reg95 : wire79)))) ?
                  wire85[(1'h0):(1'h0)] : (8'hac));
              reg98 <= (!(~&$unsigned(reg84)));
              reg99 <= reg101[(4'hc):(4'h8)];
              reg100 <= $unsigned(({reg106} & $unsigned(({reg89, reg84} ?
                  (+wire85) : $unsigned(reg83)))));
            end
          if (wire65[(3'h6):(1'h1)])
            begin
              reg101 <= $signed(wire80);
              reg102 <= (^reg75[(4'h9):(3'h4)]);
              reg103 <= (-((8'hb3) + {reg111[(1'h1):(1'h1)]}));
              reg104 <= ((|((!(|(8'h9e))) ?
                      $unsigned((8'hb0)) : $unsigned(reg97))) ?
                  (~&$unsigned(((+reg98) ?
                      (^~reg88) : (reg109 << reg97)))) : reg87);
            end
          else
            begin
              reg101 <= $signed((!wire78));
              reg102 <= $unsigned(((8'ha2) & (~&$signed($unsigned(wire67)))));
              reg103 <= reg76[(3'h5):(2'h3)];
              reg104 <= reg90;
              reg105 <= reg95[(3'h5):(1'h1)];
            end
          reg106 <= $unsigned((-$unsigned({reg108})));
          reg107 <= (^(reg75[(1'h0):(1'h0)] >>> $signed(reg107[(4'hb):(4'hb)])));
        end
    end
  assign wire112 = $signed($unsigned(reg96));
  assign wire113 = wire66;
  assign wire114 = $signed($unsigned($signed(reg105)));
  assign wire115 = (~&$unsigned((reg70[(2'h2):(1'h0)] < wire77[(3'h7):(3'h5)])));
  assign wire116 = (reg97[(2'h2):(1'h0)] ?
                       wire77[(2'h3):(1'h1)] : ((8'ha6) ?
                           reg75[(4'h8):(3'h6)] : (7'h40)));
  assign wire117 = $signed((8'hab));
  always
    @(posedge clk) begin
      reg118 <= $signed($unsigned((-wire81[(1'h0):(1'h0)])));
      reg119 <= ((~&(!(~^(~(8'hb5))))) ?
          (reg88[(2'h3):(2'h2)] * reg88) : $unsigned(reg104));
      reg120 <= (&($signed((wire114[(2'h2):(2'h2)] ?
          $unsigned(wire79) : wire68[(3'h5):(3'h5)])) || $signed(wire79)));
    end
endmodule

module module10
#(parameter param57 = ({((((8'hb9) ? (8'ha8) : (8'hbe)) ^~ ((8'hbf) ? (8'h9f) : (7'h44))) < ((^~(8'hab)) - ((8'haf) ? (8'ha5) : (8'ha4))))} << ((^~((|(8'hac)) < (-(8'ha4)))) ~^ (-(((8'hbf) ? (8'hb2) : (8'had)) ? {(8'hae)} : (^~(8'ha0)))))))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h1d7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire15;
  input wire signed [(5'h15):(1'h0)] wire14;
  input wire signed [(4'hb):(1'h0)] wire13;
  input wire signed [(5'h14):(1'h0)] wire12;
  input wire [(2'h2):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire56;
  wire [(5'h13):(1'h0)] wire55;
  wire signed [(4'hf):(1'h0)] wire54;
  wire signed [(3'h4):(1'h0)] wire53;
  wire [(5'h12):(1'h0)] wire52;
  wire signed [(4'hd):(1'h0)] wire51;
  wire [(3'h7):(1'h0)] wire50;
  wire [(2'h3):(1'h0)] wire46;
  wire [(3'h6):(1'h0)] wire45;
  wire [(4'he):(1'h0)] wire35;
  wire signed [(5'h11):(1'h0)] wire34;
  wire [(5'h15):(1'h0)] wire31;
  wire signed [(5'h12):(1'h0)] wire30;
  wire [(4'ha):(1'h0)] wire26;
  wire signed [(4'h9):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire16;
  reg [(5'h14):(1'h0)] reg49 = (1'h0);
  reg [(3'h5):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  reg [(3'h4):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg [(4'hc):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire46,
                 wire45,
                 wire35,
                 wire34,
                 wire31,
                 wire30,
                 wire26,
                 wire25,
                 wire16,
                 reg49,
                 reg48,
                 reg47,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg33,
                 reg32,
                 reg29,
                 reg28,
                 reg27,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire16 = ($signed({$unsigned($unsigned(wire13)),
                      (~^(wire14 ?
                          wire11 : wire14))}) && $signed($unsigned(((~&(8'hbf)) ?
                      $signed((7'h44)) : wire12[(4'ha):(3'h6)]))));
  always
    @(posedge clk) begin
      if ((wire16 ?
          {(|$unsigned((wire11 ? (8'hab) : wire13)))} : $unsigned((8'ha0))))
        begin
          reg17 <= $unsigned((wire15 < ($signed($signed(wire14)) & ((wire12 * (8'hb3)) ?
              ((8'hb1) ~^ wire13) : {(7'h41), wire16}))));
          reg18 <= (8'hb2);
          reg19 <= wire15[(4'hb):(4'hb)];
          if ($unsigned(($unsigned($unsigned($signed(wire16))) >> (reg18[(1'h0):(1'h0)] >= wire12))))
            begin
              reg20 <= {(^wire15)};
            end
          else
            begin
              reg20 <= $signed((&wire14));
            end
        end
      else
        begin
          reg17 <= ((wire15[(4'hb):(4'hb)] ?
                  $unsigned(wire14[(3'h6):(3'h6)]) : $signed($unsigned({wire16}))) ?
              ((-((^~reg20) ~^ wire16[(3'h4):(3'h4)])) <<< (wire11 ?
                  ((wire15 <= reg19) >>> (^~wire16)) : ((wire11 <= wire15) ?
                      $unsigned(wire15) : $signed(reg19)))) : $unsigned({((+reg20) || $signed(wire15))}));
          if (wire15[(5'h14):(4'hb)])
            begin
              reg18 <= (~&($unsigned((!(reg18 != wire12))) > {{(reg20 < (8'ha9)),
                      (reg19 ? wire15 : reg17)},
                  $signed((wire13 > wire13))}));
              reg19 <= (((reg17[(5'h12):(1'h1)] ?
                      (&wire12[(2'h3):(1'h0)]) : $unsigned(wire12)) ?
                  ($unsigned($signed((7'h43))) | wire15[(4'hc):(3'h5)]) : (reg20[(4'ha):(4'h9)] ?
                      (+(wire15 >= wire12)) : ((&(8'hbe)) - (reg17 <= reg19)))) <<< (reg17[(2'h2):(2'h2)] ?
                  $signed((~&(reg19 ? reg17 : (8'hb1)))) : reg19));
              reg20 <= (~$signed(($unsigned($signed(wire11)) ?
                  (~&reg17[(5'h13):(4'h9)]) : $signed(reg18))));
              reg21 <= (({(~wire13[(2'h2):(1'h1)])} ?
                      ($unsigned(reg19[(4'hc):(4'h9)]) ^ (~&((8'hb1) ?
                          (8'hb7) : wire15))) : ((&$signed(reg20)) ?
                          wire11[(2'h2):(2'h2)] : wire16)) ?
                  $unsigned(reg18[(1'h1):(1'h0)]) : (reg18[(3'h4):(3'h4)] ?
                      {($unsigned(reg17) ? wire15 : wire13[(2'h2):(1'h1)]),
                          wire13[(4'ha):(1'h1)]} : (~^$signed((reg20 ?
                          reg17 : reg18)))));
              reg22 <= reg21;
            end
          else
            begin
              reg18 <= (^reg18[(1'h1):(1'h1)]);
              reg19 <= ({$unsigned(((reg22 >>> wire14) ^~ {reg20})),
                  {reg19[(4'hd):(4'h8)]}} * reg20[(4'he):(4'hc)]);
              reg20 <= reg21[(3'h4):(3'h4)];
              reg21 <= reg21;
              reg22 <= (&reg22);
            end
          reg23 <= $unsigned(reg17[(3'h4):(3'h4)]);
          reg24 <= ($signed($unsigned(reg17)) ~^ (~^wire12));
        end
    end
  assign wire25 = (~&reg21);
  assign wire26 = (wire12 <<< $signed((^~reg23)));
  always
    @(posedge clk) begin
      reg27 <= ({(~&((reg23 ? reg20 : wire14) | (wire25 < reg20)))} ?
          $unsigned((^~$unsigned({(8'hb6)}))) : (+reg21));
      reg28 <= $signed($signed(wire11[(2'h2):(1'h0)]));
      reg29 <= $unsigned((wire12[(3'h5):(2'h3)] < $unsigned(reg22[(3'h4):(1'h1)])));
    end
  assign wire30 = ((reg19[(4'hc):(4'h9)] ^ ($unsigned((+wire11)) <= ((reg18 ?
                          reg21 : reg27) < wire25))) ?
                      $signed(((reg22 ? wire13[(4'hb):(3'h6)] : wire12) ?
                          wire15 : $unsigned(reg20[(1'h1):(1'h1)]))) : reg20[(2'h2):(1'h0)]);
  assign wire31 = (-{(&wire11),
                      ($signed((reg22 <= (8'hb7))) < (-$signed(reg24)))});
  always
    @(posedge clk) begin
      reg32 <= $unsigned($signed(reg20[(4'h8):(3'h7)]));
      reg33 <= {$unsigned(((reg17 || (&reg21)) ?
              $signed($signed(reg19)) : reg27)),
          (~(+($signed(wire30) == wire26)))};
    end
  assign wire34 = wire25[(3'h6):(1'h1)];
  assign wire35 = ((^reg24[(1'h1):(1'h1)]) ?
                      ($signed(reg20[(3'h4):(1'h1)]) ?
                          (reg18[(2'h2):(1'h1)] + wire30) : $signed(wire15[(3'h6):(2'h2)])) : $unsigned((-(reg17 * (reg20 << wire15)))));
  always
    @(posedge clk) begin
      if (reg32[(3'h6):(3'h5)])
        begin
          reg36 <= ($signed($signed((~|(reg17 ? reg29 : (8'hbd))))) ?
              $unsigned($unsigned(((reg33 ?
                  wire30 : reg22) != (~|wire31)))) : wire34[(4'hc):(3'h5)]);
          reg37 <= wire13;
          reg38 <= $signed(wire35[(4'hc):(3'h4)]);
          reg39 <= reg37;
          reg40 <= $signed(reg18[(2'h3):(2'h2)]);
        end
      else
        begin
          if ((+($signed(reg18) == $unsigned(wire26[(4'h8):(3'h5)]))))
            begin
              reg36 <= $unsigned($unsigned((wire34 && $unsigned((^reg33)))));
            end
          else
            begin
              reg36 <= $unsigned(reg20);
              reg37 <= $signed({$signed($signed((wire25 << wire35))),
                  ($unsigned((!wire14)) ?
                      (~&$signed(reg29)) : (&$unsigned(wire15)))});
            end
          reg38 <= (^~{((^(^(8'had))) || reg28[(4'ha):(3'h7)])});
          reg39 <= reg37;
          reg40 <= ((~&($unsigned($signed(reg19)) ?
                  (|reg36[(3'h7):(3'h5)]) : reg40[(3'h5):(1'h1)])) ?
              $unsigned((($unsigned(reg23) >> (~reg28)) ?
                  ((~reg28) ?
                      $unsigned((8'ha0)) : reg21[(2'h3):(2'h2)]) : reg19[(4'hb):(3'h6)])) : $unsigned(($unsigned({reg20}) ?
                  $signed(wire31) : $unsigned((wire11 <<< (8'ha7))))));
        end
      reg41 <= reg21[(1'h0):(1'h0)];
      reg42 <= (~&$signed(reg22));
    end
  always
    @(posedge clk) begin
      reg43 <= reg32;
      reg44 <= (&$signed($signed($unsigned((&reg32)))));
    end
  assign wire45 = $signed((^~(($signed(wire26) ?
                          {(8'hbd), reg41} : $unsigned(wire15)) ?
                      $unsigned(reg17[(3'h5):(2'h3)]) : wire12)));
  assign wire46 = $unsigned((((reg42[(2'h3):(1'h0)] ?
                      $unsigned(reg17) : $signed(reg37)) ~^ reg21) >= reg37));
  always
    @(posedge clk) begin
      reg47 <= wire13[(4'hb):(3'h6)];
      reg48 <= (wire15[(4'hd):(4'h8)] == reg47[(1'h0):(1'h0)]);
      reg49 <= wire26;
    end
  assign wire50 = reg23;
  assign wire51 = (&$unsigned(wire13[(2'h2):(2'h2)]));
  assign wire52 = ((~&(8'hb2)) | $unsigned($signed(((reg47 ?
                      reg19 : (8'hb4)) > (~|(8'h9e))))));
  assign wire53 = ((~(wire14[(4'hb):(1'h0)] ? (~^$signed(reg27)) : wire13)) ?
                      {(wire11[(1'h1):(1'h1)] ?
                              (wire16[(3'h5):(2'h2)] ?
                                  $unsigned(wire45) : (wire11 ?
                                      wire51 : reg23)) : reg49[(4'hc):(4'hc)])} : ((($signed(wire13) == ((8'ha0) ^~ reg22)) <<< ((reg22 ?
                              reg23 : (8'had)) && $unsigned(reg39))) ?
                          $signed($unsigned((~reg22))) : ((wire15 ?
                              $unsigned(reg43) : (reg37 ?
                                  wire25 : (7'h42))) ~^ ($unsigned(reg33) ?
                              $unsigned(reg48) : $unsigned(reg48)))));
  assign wire54 = (($unsigned(reg20[(5'h10):(4'hf)]) != (~|$signed(wire16[(2'h2):(2'h2)]))) ?
                      (~^$unsigned(wire46[(1'h0):(1'h0)])) : $unsigned((-((~|reg33) && (reg36 ?
                          wire16 : wire52)))));
  assign wire55 = (|((-reg32[(2'h2):(1'h1)]) ?
                      (wire11[(1'h0):(1'h0)] || (reg49[(3'h4):(1'h0)] ?
                          (^~reg29) : (~&wire26))) : reg42));
  assign wire56 = (&reg29[(2'h3):(1'h1)]);
endmodule
