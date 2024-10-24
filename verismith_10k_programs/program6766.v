module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  wire [(5'h13):(1'h0)] wire234;
  wire signed [(4'h9):(1'h0)] wire233;
  wire [(4'ha):(1'h0)] wire232;
  wire [(3'h5):(1'h0)] wire4;
  wire [(4'hb):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire181;
  wire [(2'h3):(1'h0)] wire183;
  wire [(5'h14):(1'h0)] wire184;
  wire [(5'h12):(1'h0)] wire185;
  wire [(4'hb):(1'h0)] wire186;
  wire signed [(3'h7):(1'h0)] wire187;
  wire signed [(4'ha):(1'h0)] wire188;
  wire [(5'h12):(1'h0)] wire189;
  wire signed [(5'h12):(1'h0)] wire230;
  reg [(4'h9):(1'h0)] reg8 = (1'h0);
  assign y = {wire234,
                 wire233,
                 wire232,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire9,
                 wire181,
                 wire183,
                 wire184,
                 wire185,
                 wire186,
                 wire187,
                 wire188,
                 wire189,
                 wire230,
                 reg8,
                 (1'h0)};
  assign wire4 = ((wire2 > wire2[(3'h4):(1'h1)]) ?
                     $unsigned($unsigned((wire3[(4'he):(4'hd)] ?
                         $unsigned((7'h43)) : (-wire2)))) : (^(((~^wire1) <<< {wire1}) <= $unsigned((wire1 > (8'hb4))))));
  assign wire5 = $unsigned(wire0);
  assign wire6 = ((8'hbc) ^ $signed($signed((wire3 << (|wire5)))));
  assign wire7 = $signed((wire5[(4'h8):(3'h5)] <<< (((^wire6) <<< (wire0 & wire5)) ?
                     $unsigned($signed(wire0)) : $unsigned((wire2 && (8'haf))))));
  always
    @(posedge clk) begin
      reg8 <= $unsigned(wire4[(1'h0):(1'h0)]);
    end
  assign wire9 = wire3[(4'hd):(3'h6)];
  module10 #() modinst182 (.wire14(wire6), .clk(clk), .wire11(wire2), .wire13(wire9), .wire12(wire0), .y(wire181));
  assign wire183 = (wire9[(3'h4):(3'h4)] ? wire3 : (8'hbd));
  assign wire184 = $signed(({wire183} ?
                       (^~wire4[(2'h2):(1'h1)]) : $signed($signed((wire1 ?
                           wire183 : wire181)))));
  assign wire185 = wire4[(1'h1):(1'h0)];
  assign wire186 = wire185[(5'h10):(4'hc)];
  assign wire187 = (~{(wire6[(4'hc):(1'h1)] >>> (wire9 ? wire0 : wire186)),
                       wire2});
  assign wire188 = $signed({wire3});
  assign wire189 = $signed($unsigned(wire181[(4'hb):(4'hb)]));
  module190 #() modinst231 (.clk(clk), .wire194(wire3), .wire192(wire4), .wire193(wire9), .wire195(wire7), .y(wire230), .wire191(wire1));
  assign wire232 = wire9[(1'h0):(1'h0)];
  assign wire233 = wire185;
  assign wire234 = wire230;
endmodule

module module190  (y, clk, wire195, wire194, wire193, wire192, wire191);
  output wire [(32'h17f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire195;
  input wire [(3'h4):(1'h0)] wire194;
  input wire [(5'h12):(1'h0)] wire193;
  input wire signed [(3'h5):(1'h0)] wire192;
  input wire [(4'hd):(1'h0)] wire191;
  wire signed [(3'h7):(1'h0)] wire229;
  wire [(4'h9):(1'h0)] wire228;
  wire [(5'h10):(1'h0)] wire227;
  wire signed [(3'h5):(1'h0)] wire226;
  wire [(3'h4):(1'h0)] wire225;
  wire [(4'hc):(1'h0)] wire224;
  wire signed [(5'h13):(1'h0)] wire223;
  wire [(4'ha):(1'h0)] wire222;
  wire signed [(4'h9):(1'h0)] wire197;
  wire signed [(4'hb):(1'h0)] wire196;
  reg [(5'h11):(1'h0)] reg221 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg220 = (1'h0);
  reg signed [(4'he):(1'h0)] reg219 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg218 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg217 = (1'h0);
  reg [(4'ha):(1'h0)] reg216 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg215 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg214 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg213 = (1'h0);
  reg signed [(4'he):(1'h0)] reg212 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg211 = (1'h0);
  reg [(3'h7):(1'h0)] reg210 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg209 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg208 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg207 = (1'h0);
  reg [(4'hd):(1'h0)] reg206 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg205 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg204 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg203 = (1'h0);
  reg [(3'h6):(1'h0)] reg202 = (1'h0);
  reg signed [(4'he):(1'h0)] reg201 = (1'h0);
  reg [(4'hc):(1'h0)] reg200 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg199 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg198 = (1'h0);
  assign y = {wire229,
                 wire228,
                 wire227,
                 wire226,
                 wire225,
                 wire224,
                 wire223,
                 wire222,
                 wire197,
                 wire196,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
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
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 (1'h0)};
  assign wire196 = wire195[(4'hb):(1'h0)];
  assign wire197 = ((wire192 >> ($unsigned((wire191 != (8'hbd))) | $unsigned((7'h43)))) & $unsigned($unsigned({wire196[(3'h4):(2'h3)],
                       (wire191 < (8'h9c))})));
  always
    @(posedge clk) begin
      reg198 <= $unsigned(((($signed(wire196) == (wire193 == wire194)) >> wire194[(3'h4):(2'h3)]) >> wire193[(4'hf):(3'h6)]));
      if (((wire191[(3'h7):(3'h6)] ?
          (8'ha6) : (~^($unsigned(wire194) - (wire192 * wire195)))) == wire191[(4'h9):(1'h1)]))
        begin
          if (($signed($signed(wire193)) && (wire196 || (~^(~wire195)))))
            begin
              reg199 <= (wire197[(1'h0):(1'h0)] ?
                  ((8'hb4) ?
                      {($signed(wire192) ?
                              $unsigned(wire193) : (wire192 ?
                                  wire194 : wire194)),
                          ($signed(wire196) || $unsigned((8'h9d)))} : $unsigned(((wire196 ?
                          wire195 : reg198) << $unsigned(wire192)))) : wire197[(3'h4):(1'h1)]);
              reg200 <= ((+$unsigned($signed((^wire197)))) || (8'h9e));
            end
          else
            begin
              reg199 <= (^~wire195[(4'h9):(3'h4)]);
              reg200 <= (~wire193);
              reg201 <= wire194;
              reg202 <= (wire196 << {($unsigned(reg198[(3'h6):(3'h4)]) * ($signed(wire193) == $signed(reg201)))});
              reg203 <= $unsigned(wire195[(4'h8):(4'h8)]);
            end
          reg204 <= reg202[(1'h0):(1'h0)];
          if (($signed(((reg203[(2'h3):(2'h3)] ?
                  reg202 : (wire197 ? reg199 : reg199)) ?
              ((~wire192) ?
                  (wire192 ?
                      reg203 : reg199) : (wire195 << wire192)) : $unsigned(reg198))) ~^ {(~|wire192),
              ($signed((wire194 ^ (8'hbc))) ?
                  (((8'ha1) > (8'ha6)) ?
                      reg201[(4'h8):(1'h0)] : (wire197 ?
                          reg200 : wire194)) : wire195)}))
            begin
              reg205 <= (wire193[(3'h6):(2'h3)] ?
                  $unsigned(wire192) : wire194[(1'h1):(1'h0)]);
            end
          else
            begin
              reg205 <= {(({(wire193 ? wire191 : reg199)} | ($unsigned(reg202) ?
                          $unsigned((8'hb6)) : {wire193, reg198})) ?
                      $signed(((~&reg198) ?
                          {wire192} : (~^wire196))) : {$signed(reg203[(3'h5):(3'h4)])}),
                  reg201};
              reg206 <= (~^(($unsigned(reg198[(3'h4):(2'h2)]) * $signed($unsigned(wire196))) ?
                  $signed(reg201[(4'hc):(3'h5)]) : $signed((reg202 ?
                      (+wire193) : $signed(reg200)))));
              reg207 <= reg205[(3'h7):(1'h1)];
              reg208 <= wire192;
              reg209 <= $unsigned(reg207[(3'h5):(3'h5)]);
            end
          reg210 <= ($unsigned((+(^(wire197 ? reg205 : wire194)))) ?
              reg208[(1'h1):(1'h0)] : (reg199[(4'ha):(1'h0)] && ((^~$signed(reg202)) ^ reg198)));
        end
      else
        begin
          reg199 <= $signed((reg205[(4'ha):(4'h9)] >> wire197));
        end
      reg211 <= (8'hb1);
    end
  always
    @(posedge clk) begin
      if ($unsigned($unsigned((8'ha7))))
        begin
          if ($unsigned(reg207))
            begin
              reg212 <= (~(~(^~$unsigned((~&wire193)))));
              reg213 <= {(wire195 ?
                      (reg204 ?
                          wire195[(4'h8):(2'h3)] : reg201[(3'h7):(3'h4)]) : wire197)};
              reg214 <= reg207[(3'h5):(2'h2)];
              reg215 <= $signed((~((8'hb8) << reg208)));
            end
          else
            begin
              reg212 <= $signed($signed((-reg213[(2'h2):(1'h0)])));
            end
          reg216 <= $signed(((wire195[(4'hd):(4'h8)] ?
              reg200[(1'h0):(1'h0)] : wire194) >= $signed((reg214 | $unsigned(reg214)))));
          reg217 <= $signed(reg207);
          reg218 <= reg203[(5'h13):(4'hb)];
          reg219 <= (&$unsigned((-((~&(8'hb3)) - $unsigned(reg203)))));
        end
      else
        begin
          reg212 <= $unsigned($unsigned($signed(((^~reg209) ?
              (&reg203) : (-wire196)))));
        end
      reg220 <= ($signed(reg206[(4'ha):(4'h9)]) ?
          $unsigned({{(8'hbc), reg218}}) : (^reg199));
      reg221 <= ((reg198 ?
              {$signed((reg211 ? reg202 : reg205))} : wire195[(4'hb):(3'h5)]) ?
          (((~|reg199[(3'h5):(2'h2)]) ?
              $signed(wire191[(2'h2):(1'h0)]) : $unsigned(reg216)) >>> reg218) : (~&(|$unsigned((~&wire193)))));
    end
  assign wire222 = $signed(reg214);
  assign wire223 = reg215;
  assign wire224 = wire197[(3'h5):(2'h2)];
  assign wire225 = {$signed((~&{(reg203 ? (8'hbe) : wire223),
                           (wire222 ? reg217 : reg215)})),
                       (~^(~(~{reg212})))};
  assign wire226 = (8'hb9);
  assign wire227 = $signed(reg216);
  assign wire228 = ((((reg215 << (-reg209)) ?
                           $unsigned(((8'hae) ?
                               wire196 : (8'ha9))) : (^~wire195)) ?
                       $unsigned((-{reg215,
                           reg206})) : $unsigned($signed($signed((8'h9e))))) >> (wire225 ?
                       $unsigned($unsigned(((8'ha8) * reg216))) : {$unsigned($unsigned(reg206)),
                           $unsigned((+(8'ha4)))}));
  assign wire229 = (-(8'hba));
endmodule

module module10
#(parameter param180 = (8'hb8))
(y, clk, wire11, wire12, wire13, wire14);
  output wire [(32'h2b2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire11;
  input wire signed [(5'h15):(1'h0)] wire12;
  input wire [(3'h4):(1'h0)] wire13;
  input wire signed [(5'h11):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire162;
  wire signed [(2'h2):(1'h0)] wire161;
  wire [(4'h9):(1'h0)] wire155;
  wire [(4'h9):(1'h0)] wire138;
  wire [(4'he):(1'h0)] wire137;
  wire [(4'hc):(1'h0)] wire15;
  wire [(4'h8):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire60;
  wire signed [(5'h14):(1'h0)] wire62;
  wire [(5'h11):(1'h0)] wire63;
  wire signed [(4'hf):(1'h0)] wire64;
  wire [(3'h4):(1'h0)] wire65;
  wire [(5'h13):(1'h0)] wire66;
  wire [(4'hc):(1'h0)] wire135;
  reg [(4'h9):(1'h0)] reg179 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg178 = (1'h0);
  reg [(5'h13):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg176 = (1'h0);
  reg [(5'h13):(1'h0)] reg175 = (1'h0);
  reg [(5'h10):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg173 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg172 = (1'h0);
  reg [(5'h11):(1'h0)] reg171 = (1'h0);
  reg [(4'ha):(1'h0)] reg170 = (1'h0);
  reg [(3'h5):(1'h0)] reg169 = (1'h0);
  reg [(5'h15):(1'h0)] reg168 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg167 = (1'h0);
  reg [(5'h14):(1'h0)] reg166 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg165 = (1'h0);
  reg [(5'h14):(1'h0)] reg164 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg159 = (1'h0);
  reg [(4'h8):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg156 = (1'h0);
  reg [(5'h12):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg153 = (1'h0);
  reg [(5'h12):(1'h0)] reg152 = (1'h0);
  reg [(5'h15):(1'h0)] reg151 = (1'h0);
  reg [(5'h13):(1'h0)] reg150 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg149 = (1'h0);
  reg [(5'h13):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg146 = (1'h0);
  reg [(5'h14):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg143 = (1'h0);
  reg [(4'hd):(1'h0)] reg142 = (1'h0);
  reg [(4'he):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg139 = (1'h0);
  assign y = {wire162,
                 wire161,
                 wire155,
                 wire138,
                 wire137,
                 wire15,
                 wire16,
                 wire60,
                 wire62,
                 wire63,
                 wire64,
                 wire65,
                 wire66,
                 wire135,
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
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg154,
                 reg153,
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
  assign wire15 = $signed($unsigned(({$signed(wire11), (|wire12)} ?
                      wire13[(1'h0):(1'h0)] : wire13[(2'h3):(2'h2)])));
  assign wire16 = (!$unsigned($unsigned(((!wire14) >> wire11[(2'h2):(2'h2)]))));
  module17 #() modinst61 (.wire21(wire15), .wire20(wire11), .clk(clk), .wire19(wire12), .y(wire60), .wire18(wire13));
  assign wire62 = (wire14 ? wire16 : wire16);
  assign wire63 = $signed((wire13 || $signed(wire14)));
  assign wire64 = ($unsigned(($signed((|wire13)) ?
                          ($signed(wire16) * (~|(8'ha0))) : (&(wire14 ?
                              (8'hb6) : wire11)))) ?
                      wire12 : $unsigned((wire63[(2'h2):(1'h0)] ?
                          ($unsigned(wire11) ?
                              $unsigned(wire63) : {wire60,
                                  wire60}) : wire11[(4'ha):(1'h0)])));
  assign wire65 = {(7'h44), wire64};
  assign wire66 = $unsigned(((8'haf) ? wire13 : (+{{wire60, wire62}, wire14})));
  module67 #() modinst136 (.wire68(wire11), .clk(clk), .wire71(wire66), .y(wire135), .wire69(wire14), .wire70(wire60), .wire72(wire63));
  assign wire137 = {$signed(((wire12[(5'h13):(4'ha)] ?
                           $unsigned(wire64) : wire66[(4'hc):(4'h9)]) || $unsigned({wire11,
                           wire16})))};
  assign wire138 = ($signed($signed(wire135[(1'h0):(1'h0)])) ?
                       wire64[(1'h0):(1'h0)] : ($signed(($unsigned(wire135) * (wire63 ?
                           (8'had) : wire16))) & $unsigned((((8'hae) ?
                           wire62 : wire137) <= wire135))));
  always
    @(posedge clk) begin
      reg139 <= {(8'hb2)};
      if ($signed($signed(($unsigned((wire135 ^~ wire16)) ?
          wire11[(2'h2):(1'h0)] : (&wire11[(5'h10):(3'h5)])))))
        begin
          reg140 <= (+($unsigned($signed($signed(wire65))) ?
              reg139[(4'ha):(3'h4)] : wire12));
        end
      else
        begin
          reg140 <= wire137;
          reg141 <= (($signed((^wire13)) || $signed((wire12 >= (reg139 ?
                  wire64 : wire15)))) ?
              reg140 : (((-(-(8'hbb))) ?
                      reg140[(3'h5):(3'h4)] : $unsigned(wire65[(1'h1):(1'h1)])) ?
                  wire13[(1'h1):(1'h1)] : $unsigned(wire14)));
          reg142 <= $unsigned((+$unsigned($signed($unsigned((8'hbb))))));
          if (reg142)
            begin
              reg143 <= ((!$signed($unsigned((&wire62)))) == $unsigned(wire14[(1'h0):(1'h0)]));
              reg144 <= (~$signed(($unsigned($unsigned(wire13)) ?
                  (~|$unsigned(wire135)) : wire63)));
              reg145 <= $unsigned($unsigned(wire11[(4'hf):(4'hd)]));
            end
          else
            begin
              reg143 <= $signed((wire12[(4'hb):(4'ha)] ?
                  (&wire15[(3'h7):(1'h0)]) : ($unsigned(wire138) >>> (|$unsigned(wire135)))));
            end
        end
      reg146 <= wire14;
      if ((8'ha5))
        begin
          reg147 <= (($unsigned(({reg142,
                  (8'hbb)} < $unsigned(wire62))) - wire15) ?
              reg139 : reg141);
          reg148 <= $unsigned($unsigned((wire60[(5'h11):(1'h1)] ?
              (reg144 ?
                  $signed(wire138) : (8'ha2)) : $unsigned((reg140 > wire12)))));
          reg149 <= {(^~(8'hb5)), (8'hbb)};
          reg150 <= (^$signed({$signed((^(8'ha2)))}));
        end
      else
        begin
          reg147 <= wire16[(3'h6):(3'h5)];
          reg148 <= $signed({wire66[(4'h8):(2'h3)],
              $unsigned(($signed(wire15) + reg147))});
          reg149 <= $signed($unsigned(((^~wire60[(4'hb):(4'hb)]) | (^~reg143))));
          reg150 <= (($signed(reg148) ~^ (reg143 ?
                  $unsigned($unsigned(wire14)) : wire137)) ?
              ((-((+wire65) ? (wire62 * wire13) : (^wire12))) ?
                  $unsigned(((&wire135) ?
                      (7'h41) : (wire65 && (8'h9c)))) : ((8'hbf) != ($signed(wire135) && $unsigned(reg142)))) : (|{(~reg140[(3'h7):(3'h5)]),
                  (~&((8'hae) && wire11))}));
        end
      if ((({$signed(reg141[(3'h4):(1'h1)]), ({reg139} != (^~wire14))} ?
          {wire64[(3'h6):(3'h5)]} : ($unsigned((wire137 != reg142)) <= reg146[(2'h3):(1'h0)])) ^~ ((reg142 ?
          $signed($unsigned(wire15)) : ($signed(wire66) << wire12)) & $unsigned(wire135))))
        begin
          reg151 <= (wire62 ?
              (-{$unsigned(reg149)}) : ((~(wire60[(4'hd):(4'h9)] ?
                      (reg144 <= reg142) : wire62[(4'hd):(4'ha)])) ?
                  $signed($signed((reg144 && wire15))) : reg150[(3'h5):(2'h3)]));
          reg152 <= $unsigned($signed(wire14[(1'h0):(1'h0)]));
        end
      else
        begin
          reg151 <= wire11[(2'h2):(2'h2)];
          reg152 <= $unsigned((($signed((reg146 ?
              wire60 : wire63)) > ((~&wire64) << (wire12 ?
              wire66 : wire62))) >= {(8'hb4), $signed($signed(wire138))}));
          reg153 <= $unsigned($signed(((~|wire16[(3'h6):(3'h6)]) != reg150)));
          reg154 <= ($unsigned((~&(wire16[(2'h3):(1'h1)] ?
              (wire137 | (8'hb8)) : (reg148 ?
                  wire12 : wire13)))) ^ {reg151[(4'hf):(3'h4)],
              $signed(((wire62 ? wire66 : (8'hb3)) > wire65))});
        end
    end
  assign wire155 = reg143;
  always
    @(posedge clk) begin
      reg156 <= ((7'h42) << (($unsigned((8'hb0)) ?
          (reg150[(2'h2):(2'h2)] ?
              reg151[(5'h15):(1'h1)] : wire63[(2'h3):(1'h0)]) : {$unsigned(reg147),
              wire60}) && (!(~^(wire62 ? wire15 : wire135)))));
      reg157 <= wire155[(2'h3):(1'h1)];
      reg158 <= (^~{$unsigned($unsigned(wire16))});
      reg159 <= wire14[(4'he):(4'ha)];
      reg160 <= reg147[(4'hb):(3'h6)];
    end
  assign wire161 = reg146;
  assign wire162 = (+((!((reg146 ?
                       reg145 : reg146) - $unsigned(reg143))) & wire161[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      if ((^reg152[(3'h6):(1'h0)]))
        begin
          if (($unsigned($signed($signed({reg139,
              (8'ha6)}))) >= reg147[(4'hd):(4'h9)]))
            begin
              reg163 <= wire16[(3'h4):(1'h0)];
              reg164 <= (wire63[(4'hb):(4'h9)] > wire62);
              reg165 <= ((((~reg149) ?
                      reg160[(2'h3):(2'h2)] : {$unsigned(reg156)}) ?
                  wire63 : ((^~$signed(reg146)) ?
                      (~&{wire16}) : wire60[(3'h4):(1'h0)])) >>> $unsigned($signed((((8'hb4) ?
                      (8'hba) : reg159) ?
                  $unsigned(wire63) : (reg150 ? reg144 : reg146)))));
              reg166 <= $signed(($signed((8'haf)) + $signed((+wire161))));
            end
          else
            begin
              reg163 <= (($unsigned(($unsigned(reg151) ?
                          reg141 : $unsigned(wire65))) ?
                      (8'hae) : (^(wire138[(2'h3):(2'h2)] >> (^reg166)))) ?
                  ((($unsigned(reg146) >= wire65) ?
                          $unsigned($signed(wire62)) : reg151[(2'h3):(1'h1)]) ?
                      wire162 : wire62[(4'he):(4'he)]) : $unsigned($signed(wire63)));
              reg164 <= reg165[(2'h2):(2'h2)];
              reg165 <= wire16[(3'h7):(1'h1)];
              reg166 <= (7'h42);
            end
          reg167 <= $signed(reg166[(4'h8):(2'h2)]);
          reg168 <= wire155[(3'h6):(2'h3)];
          reg169 <= wire155[(3'h5):(1'h1)];
          if (wire14[(5'h11):(4'hc)])
            begin
              reg170 <= reg147[(3'h6):(3'h6)];
              reg171 <= $signed($unsigned($signed((8'hbf))));
              reg172 <= reg146;
              reg173 <= $unsigned(((({reg142} - (reg139 != reg146)) ^ reg152) != reg150));
            end
          else
            begin
              reg170 <= reg148[(5'h10):(4'hd)];
              reg171 <= wire137;
              reg172 <= (reg173 ?
                  $unsigned({$signed($unsigned(wire12))}) : (~(~$signed($unsigned(reg152)))));
              reg173 <= $unsigned(reg142[(4'h8):(2'h3)]);
              reg174 <= $signed((+((wire137 << $unsigned(reg171)) ?
                  (~$unsigned(reg148)) : (^~reg144[(2'h2):(2'h2)]))));
            end
        end
      else
        begin
          reg163 <= $unsigned({(~^reg166), (^~wire137[(2'h2):(2'h2)])});
        end
      if ($unsigned($unsigned(($unsigned($signed(reg171)) > reg147))))
        begin
          reg175 <= ($signed($signed($unsigned(reg153))) ?
              reg151[(5'h13):(3'h7)] : (+(reg153 & ((^~reg167) * $unsigned(wire60)))));
          reg176 <= wire162[(4'h9):(4'h9)];
        end
      else
        begin
          if ($signed(wire138[(3'h4):(1'h0)]))
            begin
              reg175 <= wire64[(4'hb):(4'hb)];
              reg176 <= $signed((((~|{wire62}) * $signed($signed((8'ha3)))) <= ($signed((reg145 ^~ reg147)) || (^$signed(reg152)))));
            end
          else
            begin
              reg175 <= reg152;
              reg176 <= $unsigned(wire155);
              reg177 <= reg164[(1'h0):(1'h0)];
            end
          reg178 <= $unsigned($unsigned($unsigned({wire15[(2'h3):(1'h0)]})));
        end
      reg179 <= wire13[(1'h0):(1'h0)];
    end
endmodule

module module67
#(parameter param134 = (~&(|((((8'hb6) && (8'hbf)) ? {(8'h9d)} : ((8'hbb) * (8'hb3))) >>> (((8'hb7) ? (8'hac) : (7'h40)) ? ((8'hb9) >> (7'h42)) : ((8'hb7) ? (7'h41) : (8'hb2)))))))
(y, clk, wire72, wire71, wire70, wire69, wire68);
  output wire [(32'h29e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire72;
  input wire signed [(5'h10):(1'h0)] wire71;
  input wire [(5'h14):(1'h0)] wire70;
  input wire [(5'h11):(1'h0)] wire69;
  input wire signed [(3'h4):(1'h0)] wire68;
  wire [(4'h8):(1'h0)] wire133;
  wire signed [(4'h9):(1'h0)] wire132;
  wire signed [(3'h4):(1'h0)] wire126;
  wire [(5'h13):(1'h0)] wire116;
  wire signed [(3'h5):(1'h0)] wire115;
  wire [(3'h7):(1'h0)] wire95;
  wire [(3'h7):(1'h0)] wire93;
  wire signed [(4'hb):(1'h0)] wire92;
  wire [(4'ha):(1'h0)] wire91;
  wire signed [(3'h5):(1'h0)] wire90;
  wire [(4'hb):(1'h0)] wire75;
  wire [(4'hd):(1'h0)] wire74;
  wire signed [(3'h7):(1'h0)] wire73;
  reg [(5'h13):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg130 = (1'h0);
  reg [(3'h6):(1'h0)] reg129 = (1'h0);
  reg [(3'h6):(1'h0)] reg128 = (1'h0);
  reg [(5'h11):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg125 = (1'h0);
  reg [(4'he):(1'h0)] reg124 = (1'h0);
  reg [(4'hb):(1'h0)] reg123 = (1'h0);
  reg [(4'hc):(1'h0)] reg122 = (1'h0);
  reg [(3'h4):(1'h0)] reg121 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg119 = (1'h0);
  reg [(5'h12):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg110 = (1'h0);
  reg [(4'ha):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg108 = (1'h0);
  reg [(4'h8):(1'h0)] reg107 = (1'h0);
  reg [(2'h3):(1'h0)] reg106 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg105 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg104 = (1'h0);
  reg [(4'ha):(1'h0)] reg103 = (1'h0);
  reg [(5'h13):(1'h0)] reg102 = (1'h0);
  reg [(3'h6):(1'h0)] reg101 = (1'h0);
  reg [(2'h3):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg98 = (1'h0);
  reg [(4'he):(1'h0)] reg97 = (1'h0);
  reg [(4'h9):(1'h0)] reg96 = (1'h0);
  reg [(2'h2):(1'h0)] reg94 = (1'h0);
  reg [(3'h4):(1'h0)] reg89 = (1'h0);
  reg [(5'h13):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg85 = (1'h0);
  reg [(4'hc):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg80 = (1'h0);
  reg [(5'h15):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg78 = (1'h0);
  reg [(4'ha):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg76 = (1'h0);
  assign y = {wire133,
                 wire132,
                 wire126,
                 wire116,
                 wire115,
                 wire95,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire75,
                 wire74,
                 wire73,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg114,
                 reg113,
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
                 reg94,
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
  assign wire73 = ((($signed(wire71[(2'h2):(1'h1)]) ?
                              (wire69[(1'h1):(1'h1)] ?
                                  ((8'ha8) >= wire70) : wire69) : $signed((-wire72))) ?
                          ((-{wire68}) ?
                              {wire72} : wire68[(3'h4):(2'h2)]) : $signed((8'ha8))) ?
                      wire68 : (($unsigned($signed(wire70)) ?
                          $unsigned((wire70 ?
                              wire68 : wire70)) : (~^{(8'ha5)})) ^~ $unsigned(wire68[(3'h4):(3'h4)])));
  assign wire74 = wire70;
  assign wire75 = (^~(^$signed((~{wire73}))));
  always
    @(posedge clk) begin
      reg76 <= wire72[(4'hc):(3'h7)];
      reg77 <= (~|$unsigned((^wire73[(2'h2):(1'h0)])));
      if (wire72[(1'h1):(1'h1)])
        begin
          reg78 <= (^wire73);
          reg79 <= $unsigned(($signed((wire71 ?
                  $unsigned(wire69) : $signed(wire68))) ?
              reg77[(1'h0):(1'h0)] : ((^(wire72 ?
                  reg76 : wire69)) & ($signed(reg78) ?
                  wire73 : {wire70, reg78}))));
          reg80 <= ($unsigned((~^$signed(((8'hb6) * reg77)))) && $unsigned((((+wire75) | (wire73 >> reg79)) || (wire71 ?
              wire70 : wire68))));
          reg81 <= (reg79[(5'h13):(4'ha)] ^ ((((wire74 <= (8'hbc)) ?
                  $signed(wire73) : $signed(wire68)) ?
              wire70[(3'h5):(3'h5)] : (8'haa)) & $signed($signed($signed((8'h9c))))));
          reg82 <= wire68[(3'h4):(2'h2)];
        end
      else
        begin
          if ($unsigned((-$unsigned(((-(8'hbd)) ?
              (reg82 < (7'h44)) : (wire74 ? wire74 : wire68))))))
            begin
              reg78 <= ($unsigned((&reg81)) ?
                  {(reg82[(1'h0):(1'h0)] & reg77[(4'h8):(2'h2)]),
                      {reg76,
                          $signed((^~reg77))}} : ($signed($unsigned((8'h9e))) * ((^(^~reg79)) || ($signed(reg80) && {(8'ha2),
                      reg78}))));
              reg79 <= reg81[(3'h7):(3'h4)];
              reg80 <= wire69;
              reg81 <= ((-$unsigned($signed((reg76 ? (8'hbe) : wire68)))) ?
                  wire70 : wire75[(3'h4):(2'h2)]);
              reg82 <= $unsigned(((|$unsigned((wire73 ?
                  reg76 : (8'hb8)))) >= ($signed((reg78 >= wire69)) * (~^$signed(reg82)))));
            end
          else
            begin
              reg78 <= ({$signed(wire69[(2'h2):(2'h2)]),
                  wire73[(3'h5):(2'h3)]} != ((~|(~^{(8'hb5)})) ?
                  $unsigned(wire68[(1'h0):(1'h0)]) : $signed(wire70[(5'h13):(1'h0)])));
              reg79 <= {(reg82[(2'h2):(1'h0)] << $unsigned(($signed(reg77) * (^~reg77)))),
                  $signed(wire72)};
              reg80 <= (^(reg82[(3'h6):(1'h0)] ^~ wire68[(3'h4):(1'h0)]));
              reg81 <= reg76[(3'h5):(3'h5)];
            end
          if ((wire72[(4'hb):(1'h0)] ?
              reg77 : {{$signed(reg77)}, {{$signed((8'ha6))}, {(!reg76)}}}))
            begin
              reg83 <= {wire75[(4'h9):(2'h3)], reg79};
            end
          else
            begin
              reg83 <= (^~$unsigned($signed($signed((~|(8'hb2))))));
              reg84 <= wire71[(1'h1):(1'h0)];
              reg85 <= wire73[(1'h0):(1'h0)];
            end
          reg86 <= reg85[(5'h12):(3'h4)];
          reg87 <= $unsigned((-{((~|reg86) ?
                  $unsigned(reg83) : wire72[(2'h3):(2'h3)]),
              reg80}));
          if ($unsigned($signed((~|($unsigned((8'hac)) < $unsigned(wire73))))))
            begin
              reg88 <= ((+(^wire70)) ?
                  reg76 : {$signed((^(reg83 ? reg78 : reg83))),
                      (~&$signed((+reg87)))});
            end
          else
            begin
              reg88 <= $signed(((^~wire75) >> {reg83}));
            end
        end
      reg89 <= $unsigned($signed($signed((wire73[(2'h2):(1'h1)] | $signed(reg87)))));
    end
  assign wire90 = ((8'ha9) ?
                      (($signed($unsigned(wire74)) ?
                          (-(-reg86)) : $signed($unsigned(reg78))) * ((8'haf) ?
                          $signed(reg89[(1'h1):(1'h1)]) : $signed({wire68,
                              reg86}))) : $signed($unsigned(reg87[(3'h6):(3'h5)])));
  assign wire91 = ($unsigned((reg81[(4'hd):(3'h5)] <<< wire71[(4'h9):(4'h9)])) && $unsigned(((~&$signed(wire72)) ?
                      $signed({wire68, reg82}) : wire73[(2'h2):(1'h0)])));
  assign wire92 = ($unsigned($signed(wire73[(2'h3):(1'h1)])) ~^ ({(((8'h9f) | reg83) ?
                          reg86[(4'hc):(3'h4)] : $unsigned(reg84))} | ((8'hab) >>> (~|$unsigned(reg76)))));
  assign wire93 = reg82[(3'h7):(3'h4)];
  always
    @(posedge clk) begin
      reg94 <= ($signed($unsigned($signed((+wire92)))) ?
          {$signed((~&(&reg76)))} : (^~({$unsigned(reg76),
              $unsigned(reg78)} != ((reg83 ? reg87 : wire75) ?
              wire71[(4'hc):(4'h8)] : (reg77 && reg83)))));
    end
  assign wire95 = $signed(((~|reg82[(2'h3):(1'h1)]) >>> $unsigned(((~^wire68) <<< (~^reg86)))));
  always
    @(posedge clk) begin
      if (($signed($unsigned((wire69 ? $unsigned(wire73) : (&wire92)))) ?
          (~(((~reg94) ?
              $signed(wire90) : $signed(wire90)) & $signed((8'hab)))) : ((wire75[(4'h8):(3'h7)] ?
                  wire92 : $signed((!wire91))) ?
              reg88 : $unsigned($signed((reg94 ? (8'haf) : reg94))))))
        begin
          reg96 <= {(~&$unsigned(({reg76} ^~ $unsigned(wire72)))),
              reg83[(1'h1):(1'h0)]};
          reg97 <= wire92[(2'h2):(2'h2)];
          reg98 <= reg80[(3'h4):(3'h4)];
          if ((!(wire90[(2'h2):(2'h2)] + $unsigned($unsigned(reg82[(3'h6):(2'h2)])))))
            begin
              reg99 <= (8'hbb);
            end
          else
            begin
              reg99 <= reg84[(4'hc):(3'h5)];
            end
          reg100 <= (|(((reg81[(5'h11):(4'hc)] ^ (wire75 ?
                  reg97 : reg94)) && reg82[(1'h0):(1'h0)]) ?
              wire92[(4'h8):(1'h0)] : $signed(wire70[(4'h9):(1'h0)])));
        end
      else
        begin
          reg96 <= $signed({wire74,
              ((~&wire90[(2'h3):(2'h3)]) ?
                  ((wire90 ?
                      wire75 : reg88) >> {wire92}) : ($unsigned(reg80) && (wire93 != reg83)))});
          reg97 <= (wire69 ^~ (~&((reg80 ? (8'ha6) : (8'hbc)) ?
              (8'hb9) : {(~|(8'hbf))})));
          reg98 <= ({(($unsigned(reg98) ?
                          (reg85 ? reg96 : (7'h41)) : ((7'h42) << reg76)) ?
                      {(reg94 <= wire90)} : {(reg86 < reg85),
                          wire68[(1'h0):(1'h0)]})} ?
              reg88 : reg94[(2'h2):(1'h1)]);
          reg99 <= reg94[(2'h2):(1'h1)];
        end
      reg101 <= $unsigned($signed(reg80));
      reg102 <= $unsigned((wire92[(3'h6):(3'h5)] ?
          (~(reg98[(3'h7):(2'h3)] ?
              $unsigned((8'ha1)) : (wire70 ? reg88 : reg89))) : {reg85}));
      if (reg99)
        begin
          if ($unsigned((~^(~^$signed(wire73)))))
            begin
              reg103 <= reg84[(3'h7):(3'h7)];
              reg104 <= wire68;
              reg105 <= {(wire72[(4'hb):(4'h8)] | $signed({(reg85 | reg101)})),
                  {$signed(reg103[(4'h9):(4'h8)]), wire68[(2'h2):(1'h1)]}};
              reg106 <= (~^$signed((($unsigned((7'h43)) ^~ reg88[(2'h3):(2'h3)]) > reg88)));
              reg107 <= reg87;
            end
          else
            begin
              reg103 <= reg79;
              reg104 <= wire93[(1'h0):(1'h0)];
            end
          reg108 <= reg85[(2'h3):(2'h3)];
          if (wire70[(4'h8):(2'h3)])
            begin
              reg109 <= $unsigned({(((^~wire93) ^ (+wire75)) - (+(|reg76)))});
              reg110 <= $signed({$unsigned(reg77[(3'h4):(1'h1)])});
              reg111 <= $signed(reg101);
            end
          else
            begin
              reg109 <= reg99;
              reg110 <= $signed((~^(((reg81 << wire90) <<< wire71[(4'h9):(1'h0)]) ^~ {reg78[(4'hf):(2'h2)],
                  (reg86 ? (8'hb4) : (7'h40))})));
              reg111 <= {wire72[(4'ha):(3'h6)]};
              reg112 <= reg83;
              reg113 <= reg80;
            end
          reg114 <= (({$signed((~(8'hba)))} ?
              {$signed(reg101[(3'h6):(2'h2)]),
                  ($signed(reg96) ^~ $unsigned(wire69))} : $signed($unsigned((reg85 == reg84)))) << $signed(reg79));
        end
      else
        begin
          reg103 <= wire95;
        end
    end
  assign wire115 = (($signed((~^$signed(reg76))) >> (|(8'hb4))) >> ((|{$unsigned(wire68)}) ?
                       (|((reg78 ?
                           (7'h42) : reg108) & $signed(reg89))) : (reg84[(4'h9):(1'h0)] ?
                           reg99[(2'h2):(1'h0)] : $signed(reg97))));
  assign wire116 = reg87[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      if ((|((((&wire70) ? (8'hba) : $signed(reg112)) ?
          $signed((reg85 ? reg112 : reg85)) : ($signed(wire92) ?
              $unsigned((8'ha9)) : reg97[(1'h1):(1'h0)])) & {(~(8'hb8)),
          {(reg97 ? wire92 : (8'hbb)), (-reg103)}})))
        begin
          if (($unsigned(({(-reg89)} <= $unsigned(reg84[(4'hc):(1'h1)]))) ?
              $unsigned(reg105) : ((^~reg80[(1'h1):(1'h0)]) < (8'hb2))))
            begin
              reg117 <= {reg113, {wire116[(5'h10):(3'h4)]}};
              reg118 <= ((($unsigned(reg84) ^~ (reg94[(1'h0):(1'h0)] <<< (reg102 ^~ reg88))) ^~ (^~{{wire68,
                      (8'h9d)}})) || {($unsigned((reg109 ?
                      reg106 : reg86)) >= wire71)});
            end
          else
            begin
              reg117 <= reg89;
              reg118 <= reg80[(3'h4):(2'h3)];
              reg119 <= (($unsigned(($unsigned(wire69) + (^reg84))) >= ($signed((reg112 ?
                      (7'h41) : (8'hb4))) && ((7'h41) == wire91))) ?
                  (8'hab) : $unsigned((((wire93 ?
                          reg111 : wire91) ^~ (wire115 << (8'hb8))) ?
                      $signed((wire71 ?
                          reg105 : reg96)) : $unsigned((wire95 ~^ (7'h44))))));
            end
        end
      else
        begin
          reg117 <= (~reg98[(4'hc):(4'h9)]);
          reg118 <= {reg94[(1'h0):(1'h0)]};
          reg119 <= (~&$signed(wire93[(3'h6):(1'h0)]));
          if (reg96[(2'h3):(2'h3)])
            begin
              reg120 <= reg97;
            end
          else
            begin
              reg120 <= (^~reg118);
              reg121 <= ({$unsigned((-(reg113 >>> reg105)))} ?
                  $signed((!$unsigned((|wire75)))) : {$signed(((8'hbb) ?
                          $unsigned((8'hb1)) : (reg108 ^~ wire115))),
                      (+((~&reg120) > reg77[(3'h7):(2'h2)]))});
            end
        end
      reg122 <= (+reg107);
      reg123 <= (reg85 >= ((~|((8'hb7) ?
          reg81[(5'h10):(3'h4)] : (reg94 ?
              reg87 : reg108))) & reg109[(1'h0):(1'h0)]));
    end
  always
    @(posedge clk) begin
      reg124 <= $unsigned(wire92);
      reg125 <= {((-($unsigned(wire69) ~^ wire115)) ?
              (reg79 && (~&$signed(reg122))) : (+$unsigned((reg119 ?
                  reg104 : reg87)))),
          $signed(($signed((reg83 ? (7'h40) : reg85)) ?
              $unsigned({(8'haf), wire72}) : (~&(reg104 ? reg121 : wire73))))};
    end
  assign wire126 = $unsigned($unsigned((reg107 == $signed((^wire92)))));
  always
    @(posedge clk) begin
      reg127 <= $unsigned($unsigned($unsigned((-reg99[(3'h6):(3'h6)]))));
      reg128 <= {$signed((~^reg83[(1'h1):(1'h0)]))};
      reg129 <= {(!(~&$unsigned($signed((8'hb3)))))};
      reg130 <= reg85[(4'ha):(2'h3)];
      reg131 <= ((wire93 * $unsigned(reg105[(4'h8):(3'h6)])) ?
          $signed($unsigned((~^(wire116 ^ reg79)))) : $signed($unsigned(wire73)));
    end
  assign wire132 = (-reg103[(3'h5):(2'h2)]);
  assign wire133 = (+($signed(($signed(wire72) ?
                           $unsigned(reg94) : (reg82 ? reg78 : reg120))) ?
                       (^$unsigned($signed(wire75))) : (+reg100)));
endmodule

module module17  (y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h19d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire21;
  input wire signed [(5'h14):(1'h0)] wire20;
  input wire [(4'h8):(1'h0)] wire19;
  input wire [(2'h3):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire54;
  wire [(4'hc):(1'h0)] wire53;
  wire [(3'h4):(1'h0)] wire47;
  wire [(4'h8):(1'h0)] wire46;
  wire signed [(3'h7):(1'h0)] wire45;
  wire signed [(4'hc):(1'h0)] wire44;
  wire signed [(5'h14):(1'h0)] wire43;
  wire [(5'h11):(1'h0)] wire42;
  wire [(4'ha):(1'h0)] wire41;
  wire [(5'h11):(1'h0)] wire40;
  wire signed [(4'h9):(1'h0)] wire39;
  wire signed [(3'h6):(1'h0)] wire22;
  reg signed [(4'h8):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg56 = (1'h0);
  reg [(3'h5):(1'h0)] reg55 = (1'h0);
  reg [(5'h12):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(5'h10):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(4'h8):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire22,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
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
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire22 = ((((~&(wire21 ? wire20 : wire19)) ?
                      $signed($signed(wire19)) : $unsigned($signed((7'h40)))) + (7'h43)) != $signed(({$signed((8'had))} << wire19[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg23 <= $signed(wire21[(4'hb):(4'h9)]);
      if (({($unsigned((wire22 ? (8'hb7) : wire20)) ?
              ((reg23 ? wire21 : wire18) ?
                  $unsigned(wire18) : (wire21 ?
                      wire21 : wire22)) : wire22[(1'h1):(1'h1)]),
          ((wire19 ?
              (~wire19) : (wire20 ?
                  wire20 : reg23)) <<< reg23[(3'h5):(3'h4)])} ~^ {$signed($signed((reg23 ?
              wire18 : wire22))),
          ($signed({wire20, wire19}) ?
              ({reg23, wire22} ^~ (~wire19)) : wire22[(1'h1):(1'h1)])}))
        begin
          reg24 <= (8'h9e);
          reg25 <= $signed(((~|$unsigned($unsigned(reg23))) <= $unsigned(reg23)));
          reg26 <= {($unsigned((^$signed(wire22))) ?
                  wire21 : $unsigned($unsigned((wire20 != wire20))))};
        end
      else
        begin
          reg24 <= ((reg26 ? $signed($signed({wire21, wire20})) : (&reg25)) ?
              $signed(($signed((^(8'hb3))) ?
                  ($unsigned(reg24) ?
                      wire18[(1'h0):(1'h0)] : $signed(wire21)) : (wire22[(3'h5):(2'h3)] ?
                      (reg24 >>> wire21) : $signed(wire22)))) : $signed(reg23));
          reg25 <= ({(^(wire20[(3'h4):(1'h1)] <= reg25)),
              (~&$signed((|(7'h41))))} ^ $unsigned((!$signed($signed(reg25)))));
          reg26 <= $unsigned(wire22);
          reg27 <= reg25[(4'h8):(4'h8)];
          reg28 <= $signed(((~&reg27[(1'h1):(1'h1)]) ?
              wire19[(3'h5):(1'h0)] : $signed(reg25[(4'ha):(1'h1)])));
        end
      reg29 <= (reg25 ^~ (8'hb2));
      if (({wire19[(2'h2):(1'h1)]} >= $signed(wire21)))
        begin
          reg30 <= $signed(reg24[(3'h5):(2'h3)]);
          reg31 <= (~|(((+{reg25, reg23}) ? reg24 : (~^{(8'hb3), reg29})) ?
              ($unsigned((wire21 - reg29)) ?
                  (|(8'hb7)) : $signed((reg27 >= reg23))) : $unsigned($unsigned(wire18))));
          reg32 <= (($signed(wire18[(1'h0):(1'h0)]) > reg23[(3'h7):(3'h5)]) ~^ $signed(($signed((8'hba)) && ($signed(wire21) ?
              (reg26 ? (8'hbb) : wire18) : reg23[(4'h9):(1'h0)]))));
          if ((~(8'ha9)))
            begin
              reg33 <= reg27;
              reg34 <= $signed(wire20);
            end
          else
            begin
              reg33 <= ($unsigned((($signed(reg27) < $signed(reg26)) <= $unsigned(reg30))) ?
                  $unsigned($signed(reg32[(3'h5):(3'h5)])) : $unsigned({({(8'hbf),
                              reg32} ?
                          wire18[(1'h0):(1'h0)] : (reg32 + wire20)),
                      ((wire22 << wire19) ~^ (reg31 ^~ wire18))}));
              reg34 <= ($unsigned((((wire18 ? wire22 : wire18) ?
                      $signed((8'hb6)) : $unsigned(reg24)) ?
                  $unsigned((+reg29)) : (~wire20))) - wire21[(2'h3):(1'h0)]);
              reg35 <= $signed((wire22 | wire22));
              reg36 <= (wire21 <= $signed(($signed(reg33[(3'h4):(2'h3)]) ?
                  reg34[(2'h2):(2'h2)] : wire22)));
              reg37 <= reg23[(4'he):(2'h3)];
            end
          reg38 <= $signed($unsigned(wire18));
        end
      else
        begin
          reg30 <= $signed(reg26);
        end
    end
  assign wire39 = {(|({$signed(reg32), reg23} + wire21[(4'hc):(3'h5)]))};
  assign wire40 = $signed(reg37);
  assign wire41 = reg30[(3'h5):(2'h3)];
  assign wire42 = $signed((~|reg35));
  assign wire43 = $unsigned(reg38);
  assign wire44 = (reg38 ?
                      $unsigned(($signed(reg35[(3'h7):(1'h1)]) ?
                          reg31 : reg23)) : wire40);
  assign wire45 = $unsigned(wire22[(3'h5):(3'h5)]);
  assign wire46 = (|reg26);
  assign wire47 = reg23[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg48 <= (8'hba);
      reg49 <= (~^$unsigned(($unsigned({reg30, reg31}) ?
          (+wire21) : (~&wire47[(2'h3):(1'h1)]))));
      reg50 <= wire21[(1'h0):(1'h0)];
      reg51 <= reg34[(3'h6):(3'h5)];
      reg52 <= ($signed((&(-$unsigned(reg26)))) - reg34);
    end
  assign wire53 = (reg37[(4'he):(3'h6)] ?
                      $unsigned((^~$signed((+wire47)))) : $signed($signed(reg28[(1'h1):(1'h1)])));
  assign wire54 = reg33[(4'hf):(4'h9)];
  always
    @(posedge clk) begin
      reg55 <= reg37;
      reg56 <= $signed((~($signed(wire54) ?
          (8'ha1) : {$unsigned(wire44), {wire39, reg24}})));
      reg57 <= $unsigned($signed(wire44[(4'hc):(1'h0)]));
      reg58 <= ((&({$signed(reg50)} + reg36)) ?
          reg30[(2'h2):(2'h2)] : reg25[(3'h4):(2'h3)]);
      reg59 <= (reg36[(1'h0):(1'h0)] ?
          $signed($signed(((~&reg31) ?
              $unsigned(wire39) : $signed(reg56)))) : (~&{{{reg24, reg56}},
              (!(~&reg29))}));
    end
endmodule
