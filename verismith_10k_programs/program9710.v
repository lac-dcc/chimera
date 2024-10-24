module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire234;
  wire signed [(5'h14):(1'h0)] wire232;
  wire signed [(5'h14):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  assign y = {wire234, wire232, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire4[(1'h1):(1'h1)];
  assign wire6 = (wire3 ~^ wire0[(3'h5):(3'h4)]);
  assign wire7 = wire3;
  assign wire8 = $unsigned((~(~|wire4[(1'h0):(1'h0)])));
  assign wire9 = {$signed(((~|{(8'hbb),
                         wire2}) >>> $signed(wire3[(2'h3):(1'h1)]))),
                     $unsigned((~$signed((wire0 && wire6))))};
  module10 #() modinst233 (wire232, clk, wire4, wire1, wire9, wire2);
  assign wire234 = $signed(wire7);
endmodule

module module10
#(parameter param230 = (((~|(~((8'hb7) ? (8'ha5) : (7'h41)))) ? (!({(8'hb3)} ? (+(7'h43)) : ((7'h40) ^ (8'hbc)))) : ((8'ha7) ? {{(7'h44)}, (~|(8'hbd))} : (((8'hb0) >= (7'h40)) ^ (~^(8'hb2))))) >>> {(({(8'hbd)} ? ((8'hb5) > (8'h9e)) : ((8'hb5) || (8'hb9))) ? ((8'ha7) * ((8'hae) && (8'hb1))) : (((8'ha8) - (8'hbb)) ? {(7'h41)} : (+(8'hac)))), (^(!((8'hbc) < (8'hbd))))}), 
parameter param231 = (-(({(8'hbf), param230} & {(+param230)}) != param230)))
(y, clk, wire11, wire12, wire13, wire14);
  output wire [(32'h1da):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire11;
  input wire [(5'h15):(1'h0)] wire12;
  input wire signed [(5'h13):(1'h0)] wire13;
  input wire signed [(5'h14):(1'h0)] wire14;
  wire [(4'ha):(1'h0)] wire229;
  wire signed [(5'h11):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire40;
  wire signed [(5'h13):(1'h0)] wire47;
  wire [(4'ha):(1'h0)] wire58;
  wire signed [(3'h6):(1'h0)] wire60;
  wire signed [(5'h15):(1'h0)] wire61;
  wire [(5'h10):(1'h0)] wire62;
  wire signed [(4'hf):(1'h0)] wire63;
  wire signed [(4'hc):(1'h0)] wire152;
  wire [(3'h6):(1'h0)] wire154;
  wire [(5'h11):(1'h0)] wire155;
  wire signed [(4'hd):(1'h0)] wire200;
  wire [(5'h12):(1'h0)] wire227;
  reg [(5'h13):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg45 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg [(4'ha):(1'h0)] reg43 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(5'h14):(1'h0)] reg156 = (1'h0);
  reg [(3'h7):(1'h0)] reg157 = (1'h0);
  reg [(3'h5):(1'h0)] reg158 = (1'h0);
  reg [(5'h11):(1'h0)] reg159 = (1'h0);
  reg [(5'h13):(1'h0)] reg160 = (1'h0);
  reg [(4'he):(1'h0)] reg161 = (1'h0);
  reg [(4'hb):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg164 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg165 = (1'h0);
  reg [(4'hd):(1'h0)] reg166 = (1'h0);
  reg [(3'h4):(1'h0)] reg167 = (1'h0);
  reg [(4'hd):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg169 = (1'h0);
  assign y = {wire229,
                 wire38,
                 wire40,
                 wire47,
                 wire58,
                 wire60,
                 wire61,
                 wire62,
                 wire63,
                 wire152,
                 wire154,
                 wire155,
                 wire200,
                 wire227,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
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
                 (1'h0)};
  module15 #() modinst39 (.wire19(wire13), .y(wire38), .wire17(wire14), .wire18(wire12), .clk(clk), .wire16(wire11));
  assign wire40 = $unsigned({{wire12, ($signed(wire14) ? wire11 : wire12)},
                      (|($unsigned(wire13) + (|wire38)))});
  always
    @(posedge clk) begin
      if (((($unsigned((8'ha2)) < ((wire40 == wire13) <<< (^~wire13))) ?
              (($signed(wire14) ? $signed(wire14) : (+wire13)) ?
                  wire12 : $unsigned((^~wire13))) : $unsigned(wire12)) ?
          (wire12 ?
              wire11[(4'h8):(3'h5)] : wire11[(3'h4):(2'h3)]) : $unsigned(((|(wire38 == wire11)) ?
              wire38 : (wire14[(3'h7):(3'h7)] >>> (wire13 < wire11))))))
        begin
          reg41 <= (^{wire11[(4'h8):(2'h2)],
              ($signed((&wire38)) == wire11[(3'h5):(1'h1)])});
          reg42 <= (!(-(&$signed(wire38[(4'hc):(4'hb)]))));
          reg43 <= (wire12 * reg42);
        end
      else
        begin
          reg41 <= $unsigned($unsigned(reg41));
          reg42 <= $signed($signed((((wire38 * reg43) > wire14) ?
              $signed(reg43) : $unsigned((~^reg42)))));
        end
      reg44 <= (&{((reg43[(2'h3):(2'h2)] <<< reg42) < $unsigned((8'ha6))),
          $signed((reg43[(4'h8):(3'h7)] ? (~|(8'hb5)) : $signed(wire40)))});
      reg45 <= reg43;
      reg46 <= (^~$signed((((~|wire40) > {reg42}) ?
          {$unsigned(reg45)} : reg43[(3'h7):(3'h6)])));
    end
  assign wire47 = reg41[(3'h5):(2'h2)];
  module48 #() modinst59 (wire58, clk, wire14, wire11, wire47, reg45, wire12);
  assign wire60 = reg44;
  assign wire61 = $unsigned($unsigned($signed($unsigned($unsigned((8'hab))))));
  assign wire62 = {wire11[(4'hb):(4'h8)],
                      (({(wire61 <<< reg44)} + $signed((wire13 ?
                              wire11 : wire61))) ?
                          (~&reg41[(3'h7):(1'h1)]) : wire61)};
  assign wire63 = $unsigned($signed($unsigned((reg45 > $unsigned(wire13)))));
  module64 #() modinst153 (wire152, clk, wire61, reg42, reg46, wire12);
  assign wire154 = (^(^~wire11));
  assign wire155 = $signed($unsigned(wire11));
  always
    @(posedge clk) begin
      reg156 <= $unsigned((~&{($unsigned(wire155) ?
              (reg42 ? (8'ha8) : reg44) : $unsigned(wire11))}));
      if ($unsigned(reg42))
        begin
          reg157 <= (~^((~|$signed((8'hb3))) ?
              wire60 : (-(reg44 ?
                  (reg45 ? reg46 : reg156) : reg42[(4'h9):(1'h0)]))));
          reg158 <= $unsigned({{{(reg45 ? reg46 : wire47)}}});
        end
      else
        begin
          reg157 <= $signed({wire40[(3'h4):(2'h2)], (8'had)});
          reg158 <= wire13;
          reg159 <= $signed($unsigned($signed((((8'hb2) ? wire40 : reg156) ?
              reg45[(5'h14):(4'hb)] : (+wire47)))));
        end
      reg160 <= $signed($unsigned({$signed({reg45}), {{wire40, wire11}}}));
      if ((~&$unsigned(($signed((~reg41)) << ((wire11 <= (8'ha3)) | $signed(wire11))))))
        begin
          reg161 <= {{$unsigned({(reg43 > (8'hb4)), wire62}),
                  ($signed(reg156[(3'h6):(3'h4)]) ?
                      (wire40[(4'h8):(3'h5)] ?
                          (wire63 << wire47) : (^~reg46)) : ($signed(wire61) || {wire38}))},
              {$unsigned($signed($signed(wire40)))}};
          reg162 <= ({reg158} & (8'hba));
          reg163 <= (^~(+wire11[(4'ha):(4'h9)]));
        end
      else
        begin
          if (reg41[(4'h9):(3'h7)])
            begin
              reg161 <= wire152[(2'h3):(2'h2)];
              reg162 <= {wire14, wire60};
              reg163 <= (({($unsigned(wire14) && {wire38})} <= (({(8'hab)} ?
                      (wire63 << reg46) : wire47) ?
                  $unsigned(reg156) : wire38[(3'h5):(2'h3)])) - wire47);
              reg164 <= $signed($unsigned((^wire63[(1'h0):(1'h0)])));
              reg165 <= wire14;
            end
          else
            begin
              reg161 <= $unsigned(($signed((~&(reg162 ? reg46 : wire58))) ?
                  (~|{$unsigned(wire13), wire62[(2'h2):(2'h2)]}) : ((~|(reg163 ?
                          reg161 : wire154)) ?
                      $unsigned(wire12) : wire63)));
              reg162 <= reg44[(4'h8):(3'h6)];
              reg163 <= $signed((wire14[(4'h8):(1'h1)] || wire38));
              reg164 <= reg159;
            end
          reg166 <= (~&$unsigned(wire154[(3'h6):(3'h6)]));
          if (($unsigned({reg43,
              (reg44[(3'h5):(1'h1)] ?
                  reg44 : $signed(reg161))}) == ((^{((8'hbe) & (7'h41))}) ?
              (8'ha3) : $unsigned(((reg161 + reg44) ?
                  {(7'h44), reg164} : (wire11 >= (8'hae)))))))
            begin
              reg167 <= reg166;
              reg168 <= ((($signed((!reg43)) ?
                  {$signed((8'had)), {wire38}} : {(~^wire58),
                      $signed(reg44)}) < $signed((~^(reg45 - (8'ha8))))) == reg159);
            end
          else
            begin
              reg167 <= $signed((8'hbd));
              reg168 <= $signed((reg160 ?
                  $unsigned(($signed((8'ha4)) << wire63[(4'ha):(1'h1)])) : (^$signed(reg44))));
            end
        end
      reg169 <= $signed(reg44[(3'h5):(2'h2)]);
    end
  module170 #() modinst201 (wire200, clk, reg168, wire47, wire62, reg42, reg167);
  module202 #() modinst228 (.y(wire227), .wire205(reg162), .wire203(wire14), .wire206(reg43), .wire207(reg169), .clk(clk), .wire204(reg44));
  assign wire229 = {reg156[(5'h14):(1'h1)],
                       (^$unsigned($unsigned(((8'hb7) != wire152))))};
endmodule

module module202  (y, clk, wire207, wire206, wire205, wire204, wire203);
  output wire [(32'hfc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire207;
  input wire [(3'h7):(1'h0)] wire206;
  input wire signed [(4'ha):(1'h0)] wire205;
  input wire signed [(4'hf):(1'h0)] wire204;
  input wire signed [(5'h14):(1'h0)] wire203;
  wire [(2'h3):(1'h0)] wire226;
  wire [(3'h5):(1'h0)] wire225;
  wire [(5'h10):(1'h0)] wire224;
  wire [(5'h14):(1'h0)] wire212;
  wire [(4'h8):(1'h0)] wire211;
  wire [(5'h10):(1'h0)] wire210;
  wire signed [(3'h5):(1'h0)] wire209;
  wire [(4'hd):(1'h0)] wire208;
  reg [(5'h12):(1'h0)] reg223 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg222 = (1'h0);
  reg [(5'h13):(1'h0)] reg221 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg220 = (1'h0);
  reg [(4'hb):(1'h0)] reg219 = (1'h0);
  reg [(4'he):(1'h0)] reg218 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg217 = (1'h0);
  reg [(4'he):(1'h0)] reg216 = (1'h0);
  reg [(5'h10):(1'h0)] reg215 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg214 = (1'h0);
  reg [(4'he):(1'h0)] reg213 = (1'h0);
  assign y = {wire226,
                 wire225,
                 wire224,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 (1'h0)};
  assign wire208 = $unsigned(wire205);
  assign wire209 = ((wire208[(3'h7):(3'h5)] ?
                           $signed(((wire203 ?
                               wire203 : wire204) * $unsigned(wire203))) : $unsigned(wire204[(2'h2):(2'h2)])) ?
                       ($unsigned(wire208) > $unsigned(wire204[(4'hf):(3'h5)])) : (^~{(~(wire208 ?
                               wire203 : wire207))}));
  assign wire210 = $signed({wire209,
                       ({(~|wire209)} == wire206[(3'h4):(2'h2)])});
  assign wire211 = ((~|(!wire204[(4'hf):(4'hc)])) ?
                       $unsigned($signed((8'hbe))) : (|($signed($signed(wire208)) ^ (wire204 ?
                           {wire204, wire206} : (8'hb7)))));
  assign wire212 = $signed($unsigned(wire205[(2'h3):(1'h0)]));
  always
    @(posedge clk) begin
      if ((($signed(($unsigned(wire207) & (~^wire211))) ?
          (|(+$unsigned((8'hb2)))) : (^~$unsigned($signed(wire207)))) >>> $unsigned(wire204[(2'h2):(1'h0)])))
        begin
          reg213 <= wire211[(3'h7):(3'h5)];
          reg214 <= ($signed((~|$unsigned((wire203 ? wire207 : reg213)))) ?
              wire208 : (wire203 && wire212[(5'h11):(3'h7)]));
          reg215 <= $unsigned(wire208[(1'h1):(1'h1)]);
        end
      else
        begin
          reg213 <= $unsigned(($signed(wire212) != (wire203[(4'h9):(3'h4)] > ((wire206 ^ (8'ha9)) ?
              (&reg213) : (wire204 > wire211)))));
          if ($signed((wire205[(4'ha):(4'h9)] >>> $signed($signed((wire209 ?
              (8'h9e) : reg214))))))
            begin
              reg214 <= $signed(wire204);
              reg215 <= wire210[(4'hd):(2'h2)];
            end
          else
            begin
              reg214 <= wire204;
              reg215 <= $unsigned(wire205);
            end
          reg216 <= $unsigned($signed((~((^wire210) == $signed(wire203)))));
          reg217 <= $signed($unsigned($signed(reg214[(4'hb):(2'h2)])));
        end
      if ($unsigned(($signed(wire203[(4'hf):(1'h1)]) | {{$signed(wire210)},
          {{reg213}, (wire203 <<< wire209)}})))
        begin
          reg218 <= $unsigned((reg217[(3'h5):(2'h3)] + {(~^wire204[(4'ha):(4'h9)]),
              $unsigned($unsigned((8'hb8)))}));
          reg219 <= (wire203[(4'ha):(2'h3)] - (8'hb4));
          reg220 <= ((wire204 ?
              (^($signed(reg216) ?
                  $signed(reg218) : {wire203})) : (~^($signed(wire208) * wire209))) * $unsigned($signed(reg214)));
          reg221 <= (~$unsigned($signed($signed(reg215[(3'h5):(2'h2)]))));
        end
      else
        begin
          reg218 <= $unsigned(wire206[(3'h6):(1'h1)]);
          reg219 <= (((wire203[(5'h14):(4'hd)] ?
                      {wire204,
                          (wire205 << wire212)} : $signed($unsigned(wire210))) ?
                  $signed(((wire207 && wire206) != (wire208 ?
                      (8'ha9) : wire210))) : wire208) ?
              ((8'h9d) ? reg215 : wire204) : $unsigned(wire203));
          reg220 <= $signed($signed(($unsigned(wire210[(4'hd):(4'hb)]) ^ $signed((|reg215)))));
          reg221 <= (~$signed($unsigned($unsigned((-(8'h9f))))));
        end
      reg222 <= reg217[(3'h5):(3'h5)];
      reg223 <= (wire207[(4'hc):(2'h3)] <= $unsigned((~&wire207)));
    end
  assign wire224 = $unsigned((wire211 ?
                       (reg216 <= ((reg213 >= reg219) ?
                           wire212[(2'h2):(2'h2)] : wire206)) : $unsigned((wire211 < $unsigned(reg216)))));
  assign wire225 = $signed($unsigned({(reg223[(4'hb):(4'h9)] ?
                           (~wire203) : reg222)}));
  assign wire226 = $unsigned((($unsigned($signed(wire208)) >> reg220[(4'h9):(1'h1)]) ?
                       {{(reg222 >> wire211)},
                           ((wire207 ? reg214 : (8'hb4)) ?
                               $unsigned((8'hb6)) : wire209[(2'h2):(1'h1)])} : ($unsigned((~wire207)) ?
                           $signed(wire208) : reg223[(5'h11):(4'ha)])));
endmodule

module module170
#(parameter param199 = (~^(~((8'ha3) == {((8'haa) + (8'ha6))}))))
(y, clk, wire175, wire174, wire173, wire172, wire171);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire175;
  input wire [(4'h8):(1'h0)] wire174;
  input wire [(5'h10):(1'h0)] wire173;
  input wire signed [(5'h11):(1'h0)] wire172;
  input wire [(3'h4):(1'h0)] wire171;
  wire [(5'h13):(1'h0)] wire198;
  wire signed [(4'he):(1'h0)] wire197;
  wire [(2'h3):(1'h0)] wire196;
  wire signed [(2'h2):(1'h0)] wire176;
  reg signed [(4'hf):(1'h0)] reg195 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg194 = (1'h0);
  reg [(2'h2):(1'h0)] reg193 = (1'h0);
  reg [(3'h6):(1'h0)] reg192 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg191 = (1'h0);
  reg signed [(4'he):(1'h0)] reg190 = (1'h0);
  reg [(4'h9):(1'h0)] reg189 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg188 = (1'h0);
  reg [(2'h3):(1'h0)] reg187 = (1'h0);
  reg [(3'h6):(1'h0)] reg186 = (1'h0);
  reg [(4'hc):(1'h0)] reg185 = (1'h0);
  reg [(3'h6):(1'h0)] reg184 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg183 = (1'h0);
  reg [(3'h4):(1'h0)] reg182 = (1'h0);
  reg signed [(4'he):(1'h0)] reg181 = (1'h0);
  reg [(5'h14):(1'h0)] reg180 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg179 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg178 = (1'h0);
  reg [(4'hd):(1'h0)] reg177 = (1'h0);
  assign y = {wire198,
                 wire197,
                 wire196,
                 wire176,
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
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 (1'h0)};
  assign wire176 = wire172[(4'h9):(2'h3)];
  always
    @(posedge clk) begin
      reg177 <= wire173[(1'h1):(1'h0)];
      reg178 <= wire171;
      reg179 <= {wire174[(3'h7):(1'h0)],
          ((+(wire175 ? wire173 : {reg177})) - wire174[(2'h3):(2'h2)])};
      if (wire174[(1'h0):(1'h0)])
        begin
          reg180 <= $unsigned((~(!$signed((8'haf)))));
          if ({(($signed($signed(wire174)) & wire175) > {$unsigned((~&wire171)),
                  ((|(8'had)) ?
                      wire171[(2'h3):(2'h2)] : ((8'hbf) ? reg180 : wire173))}),
              ((($unsigned(reg179) ?
                      $unsigned(reg180) : $unsigned(reg178)) ~^ (^~$signed((8'h9c)))) ?
                  $signed(((reg178 ?
                      wire176 : (8'hae)) * $signed(wire171))) : wire175[(1'h1):(1'h0)])})
            begin
              reg181 <= $unsigned(($signed((|(reg178 << wire171))) < $unsigned((~&{(8'h9f),
                  wire174}))));
              reg182 <= $signed(((reg179[(4'h8):(1'h1)] <= (&(wire171 || wire174))) > $unsigned(reg178)));
              reg183 <= reg178;
              reg184 <= reg179[(4'h8):(3'h7)];
            end
          else
            begin
              reg181 <= {(((((8'haf) ? wire171 : wire174) ?
                              $unsigned(wire174) : (~^(8'hb0))) ?
                          reg181[(4'hb):(3'h4)] : $signed((reg177 ?
                              wire172 : reg178))) ?
                      (+reg184[(2'h3):(1'h0)]) : wire172[(4'hc):(4'ha)]),
                  $signed(reg177[(2'h3):(2'h3)])};
              reg182 <= (($unsigned(reg178[(1'h1):(1'h1)]) <= wire172) != reg184);
              reg183 <= (~&$unsigned(({$unsigned(reg182)} << (|{reg183,
                  wire172}))));
              reg184 <= wire172;
              reg185 <= (-$unsigned(((!$unsigned(reg181)) ?
                  {$signed(wire176)} : reg180[(2'h3):(1'h1)])));
            end
        end
      else
        begin
          reg180 <= wire173[(4'he):(4'hd)];
          if ({(8'hb4)})
            begin
              reg181 <= (!(wire171[(2'h3):(1'h0)] >> $signed(reg178[(3'h5):(3'h5)])));
              reg182 <= $unsigned(wire172);
            end
          else
            begin
              reg181 <= $signed($unsigned(reg181[(3'h7):(2'h2)]));
              reg182 <= ((wire174[(1'h1):(1'h0)] & $signed((8'hb4))) ?
                  reg183[(2'h2):(1'h0)] : ($unsigned(reg181) ?
                      $unsigned(wire173[(4'hc):(3'h6)]) : (+(reg178 == {wire171}))));
              reg183 <= (~((&reg178[(3'h5):(1'h0)]) ?
                  (-$signed(wire175[(3'h6):(3'h4)])) : (wire174[(3'h6):(2'h2)] ?
                      ((~|reg185) ?
                          (~|reg182) : (wire176 ?
                              reg182 : wire173)) : (~$unsigned(wire176)))));
              reg184 <= (^reg179[(1'h1):(1'h1)]);
              reg185 <= {$signed((wire175[(4'hc):(4'h9)] ?
                      reg179 : ($signed(reg181) ? wire173 : $signed(reg179)))),
                  (reg184[(3'h6):(1'h1)] > (wire176 || (|$signed(wire174))))};
            end
          reg186 <= $unsigned($signed((($unsigned(reg181) >= wire175[(4'ha):(3'h7)]) == ((~|wire175) ?
              $unsigned(wire176) : $signed(reg183)))));
          reg187 <= (!$unsigned((~|reg183)));
          reg188 <= ((reg178[(3'h5):(1'h0)] << reg179[(4'hc):(3'h4)]) && $unsigned(wire176));
        end
      reg189 <= $signed({(-((+reg188) > (^~reg183)))});
    end
  always
    @(posedge clk) begin
      reg190 <= (reg181[(4'he):(3'h6)] < $unsigned((($signed((8'ha9)) ?
          (-reg179) : $unsigned(wire173)) >= wire173)));
      reg191 <= $signed($signed((((~wire174) ^~ (7'h41)) >>> wire173[(3'h4):(2'h3)])));
    end
  always
    @(posedge clk) begin
      reg192 <= $signed((((8'ha9) ?
          (~&$signed(reg179)) : reg189[(2'h3):(1'h1)]) && (reg188[(2'h2):(2'h2)] ?
          (!(reg179 ^ reg178)) : (^reg183[(4'h8):(2'h3)]))));
      reg193 <= $unsigned(reg185);
      reg194 <= (^~$signed($signed(((|(8'hb1)) >> (~&reg189)))));
      reg195 <= wire172[(4'h9):(3'h4)];
    end
  assign wire196 = wire175;
  assign wire197 = {$unsigned((~$signed((-reg193)))),
                       ($signed((|{reg192, (8'hbb)})) ?
                           reg190 : ({{reg190,
                                   (8'hb3)}} >>> wire176[(1'h1):(1'h0)]))};
  assign wire198 = (^$unsigned((8'ha0)));
endmodule

module module64
#(parameter param151 = (^~(((((8'h9f) ? (8'hbd) : (7'h44)) ? (7'h42) : ((8'ha5) ? (7'h43) : (8'hb7))) ? (!{(8'hbb), (7'h42)}) : (((8'ha1) ? (8'hbd) : (8'ha3)) ? ((8'hbd) >= (8'hb6)) : ((8'hac) ? (8'hbb) : (7'h44)))) ? (8'ha6) : (((-(8'hbc)) ~^ {(8'ha8), (7'h43)}) ? {((8'hb4) ? (8'haf) : (8'h9e)), ((8'ha3) ? (8'hb9) : (8'h9d))} : (^~{(8'hb0)})))))
(y, clk, wire68, wire67, wire66, wire65);
  output wire [(32'h39d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire68;
  input wire signed [(4'hd):(1'h0)] wire67;
  input wire signed [(2'h2):(1'h0)] wire66;
  input wire [(5'h15):(1'h0)] wire65;
  wire signed [(2'h3):(1'h0)] wire123;
  wire signed [(4'ha):(1'h0)] wire122;
  wire [(5'h14):(1'h0)] wire121;
  wire signed [(4'hd):(1'h0)] wire120;
  wire [(2'h2):(1'h0)] wire113;
  wire signed [(4'h9):(1'h0)] wire112;
  wire signed [(3'h4):(1'h0)] wire91;
  wire signed [(5'h14):(1'h0)] wire90;
  wire signed [(3'h4):(1'h0)] wire70;
  wire signed [(4'hf):(1'h0)] wire69;
  reg signed [(3'h7):(1'h0)] reg150 = (1'h0);
  reg [(2'h3):(1'h0)] reg149 = (1'h0);
  reg [(5'h13):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg147 = (1'h0);
  reg [(3'h4):(1'h0)] reg146 = (1'h0);
  reg [(4'ha):(1'h0)] reg145 = (1'h0);
  reg [(2'h2):(1'h0)] reg144 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg142 = (1'h0);
  reg [(4'hd):(1'h0)] reg141 = (1'h0);
  reg [(5'h12):(1'h0)] reg140 = (1'h0);
  reg [(4'hf):(1'h0)] reg139 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg138 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg137 = (1'h0);
  reg [(2'h3):(1'h0)] reg136 = (1'h0);
  reg signed [(4'he):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg134 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg132 = (1'h0);
  reg [(4'hb):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg130 = (1'h0);
  reg [(3'h4):(1'h0)] reg129 = (1'h0);
  reg [(5'h10):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg127 = (1'h0);
  reg [(4'ha):(1'h0)] reg126 = (1'h0);
  reg [(5'h11):(1'h0)] reg125 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg118 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg116 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg114 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg111 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg104 = (1'h0);
  reg [(3'h5):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg101 = (1'h0);
  reg [(3'h5):(1'h0)] reg100 = (1'h0);
  reg [(4'h9):(1'h0)] reg99 = (1'h0);
  reg [(5'h10):(1'h0)] reg98 = (1'h0);
  reg [(5'h15):(1'h0)] reg97 = (1'h0);
  reg [(3'h6):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg95 = (1'h0);
  reg [(2'h2):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg92 = (1'h0);
  reg [(5'h12):(1'h0)] reg89 = (1'h0);
  reg [(5'h12):(1'h0)] reg88 = (1'h0);
  reg [(5'h11):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg86 = (1'h0);
  reg [(5'h15):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg82 = (1'h0);
  reg [(4'he):(1'h0)] reg81 = (1'h0);
  reg [(5'h12):(1'h0)] reg80 = (1'h0);
  reg [(4'he):(1'h0)] reg79 = (1'h0);
  reg [(2'h3):(1'h0)] reg78 = (1'h0);
  reg [(5'h13):(1'h0)] reg77 = (1'h0);
  reg [(5'h15):(1'h0)] reg76 = (1'h0);
  reg [(4'h9):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg [(4'he):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg72 = (1'h0);
  reg [(4'hc):(1'h0)] reg71 = (1'h0);
  assign y = {wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire113,
                 wire112,
                 wire91,
                 wire90,
                 wire70,
                 wire69,
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
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
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
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 (1'h0)};
  assign wire69 = wire68[(2'h2):(1'h1)];
  assign wire70 = (|$unsigned($signed({$signed(wire66)})));
  always
    @(posedge clk) begin
      if ($signed((~&(^~$signed((^~wire70))))))
        begin
          if ((!((7'h44) + {{(wire69 ? wire67 : wire67), (wire68 <= wire66)}})))
            begin
              reg71 <= $unsigned($unsigned($signed((7'h44))));
              reg72 <= wire69;
              reg73 <= reg71[(4'hb):(4'h8)];
            end
          else
            begin
              reg71 <= $signed({{$unsigned(wire67), $unsigned(wire67)},
                  ((|$signed(reg72)) ?
                      wire66[(1'h1):(1'h1)] : $signed(wire69))});
            end
          reg74 <= $signed(wire69[(1'h0):(1'h0)]);
          reg75 <= $signed((wire70 ?
              ((|(reg74 ? reg71 : wire67)) >>> {(-reg71),
                  {reg71}}) : wire66[(2'h2):(2'h2)]));
          reg76 <= (^~wire68);
          if ((reg75 ?
              ((8'hbc) >>> $signed(wire65)) : $signed($unsigned(wire66[(1'h1):(1'h0)]))))
            begin
              reg77 <= $signed($unsigned(wire65[(3'h4):(3'h4)]));
            end
          else
            begin
              reg77 <= (($signed($signed((reg71 ?
                  reg72 : wire69))) > {wire66[(1'h0):(1'h0)]}) ^~ $signed(reg75[(2'h3):(2'h2)]));
              reg78 <= wire65;
              reg79 <= wire69;
              reg80 <= (^reg78);
              reg81 <= (reg71 ?
                  (8'hbf) : (wire70[(1'h1):(1'h0)] ?
                      (~&$unsigned({(8'h9d),
                          wire66})) : $unsigned(wire68[(1'h1):(1'h0)])));
            end
        end
      else
        begin
          if (reg74[(1'h1):(1'h0)])
            begin
              reg71 <= $signed((~(reg78[(2'h2):(1'h0)] ?
                  $signed((wire69 & (8'hb0))) : ((wire70 | reg78) ?
                      ((8'hb9) <<< reg75) : $signed(reg74)))));
              reg72 <= $unsigned({$unsigned(reg78[(2'h2):(1'h0)])});
              reg73 <= {reg77};
              reg74 <= reg81[(3'h6):(1'h1)];
            end
          else
            begin
              reg71 <= $unsigned($unsigned(reg76));
              reg72 <= (~&(wire69 ?
                  {$unsigned((wire70 <= wire68)),
                      (~|wire65)} : $signed((8'hb3))));
              reg73 <= (&(reg79[(3'h4):(2'h3)] ?
                  $unsigned($signed({reg80, reg74})) : {(-reg78)}));
              reg74 <= reg80;
              reg75 <= wire65;
            end
          reg76 <= $signed((~(-{wire67[(3'h4):(2'h2)]})));
          if ($signed((^~{((reg80 >>> reg80) > $signed(reg81))})))
            begin
              reg77 <= {$unsigned((^~(((8'hb8) != (8'h9e)) ?
                      $unsigned(reg81) : wire70[(1'h1):(1'h0)])))};
              reg78 <= $signed($unsigned((8'h9f)));
            end
          else
            begin
              reg77 <= (~&($signed(($signed(reg78) ^ (reg75 ? reg78 : reg81))) ?
                  wire68[(1'h0):(1'h0)] : ((-{reg71}) & (8'hb0))));
              reg78 <= (^(8'hab));
              reg79 <= $unsigned((8'hb8));
              reg80 <= ($unsigned($signed(((8'ha1) <<< (reg79 ?
                      reg80 : reg79)))) ?
                  $signed(((reg75 ~^ $unsigned(reg74)) ?
                      $unsigned(reg76[(3'h4):(1'h0)]) : wire70)) : (~&reg72[(1'h1):(1'h1)]));
              reg81 <= (~^(~(8'ha0)));
            end
        end
      reg82 <= (~&(((^(reg80 ? (8'hba) : (8'ha1))) + (!$unsigned(reg81))) ?
          reg76 : $unsigned(reg78[(1'h0):(1'h0)])));
      if ((^~reg72))
        begin
          reg83 <= (^reg73);
          if ($signed(((^reg82) | $unsigned((^$signed((8'ha1)))))))
            begin
              reg84 <= reg79[(3'h5):(1'h0)];
            end
          else
            begin
              reg84 <= (reg81[(1'h0):(1'h0)] ?
                  reg73[(4'h8):(3'h4)] : (+$unsigned($unsigned($signed(reg82)))));
              reg85 <= $unsigned(reg72);
              reg86 <= reg74[(5'h11):(2'h3)];
              reg87 <= ($unsigned(reg81) ?
                  (reg74[(5'h11):(4'hc)] >> reg82) : ((reg83 ?
                          {$signed((7'h43))} : (-(reg80 ? reg73 : reg86))) ?
                      (^{reg81}) : $signed($signed({reg71, reg79}))));
              reg88 <= $unsigned((^~$signed(reg86[(4'he):(4'h8)])));
            end
          reg89 <= reg80[(4'hb):(1'h0)];
        end
      else
        begin
          reg83 <= ($signed(($unsigned((wire66 ^ (8'hae))) <<< $unsigned({(8'ha2)}))) != reg76);
          reg84 <= reg77;
          reg85 <= (reg81 - reg84[(5'h10):(2'h3)]);
          if ({(-((-$unsigned(reg84)) ?
                  {{reg76, reg81}, (!(8'haf))} : (reg73 ?
                      {(8'hb4), reg85} : $signed((7'h41))))),
              $unsigned({(&(~|(8'haa)))})})
            begin
              reg86 <= $unsigned((^$unsigned($signed((wire68 ?
                  wire68 : reg86)))));
              reg87 <= $signed($signed(wire70[(3'h4):(1'h0)]));
            end
          else
            begin
              reg86 <= $unsigned((|(reg72[(3'h4):(1'h0)] ?
                  (reg80 <= reg82) : (^(8'h9f)))));
              reg87 <= $signed((reg85[(4'h8):(3'h5)] ~^ $unsigned(reg75)));
            end
        end
    end
  assign wire90 = (^~(&reg85));
  assign wire91 = wire70;
  always
    @(posedge clk) begin
      if ({($signed(wire66[(1'h1):(1'h0)]) ?
              $signed(reg88[(5'h12):(4'h8)]) : $signed($signed(wire70))),
          reg83[(4'hb):(4'h9)]})
        begin
          reg92 <= wire67[(3'h6):(1'h1)];
          if ($signed(reg83[(4'h8):(3'h7)]))
            begin
              reg93 <= reg92;
              reg94 <= ((|(!$signed($unsigned(reg92)))) >= ((((wire67 >> reg78) ?
                          $signed(reg92) : wire91) ?
                      $signed((reg71 ? wire65 : reg89)) : $signed((8'ha6))) ?
                  $unsigned((^{(8'h9d)})) : wire91));
              reg95 <= $unsigned((($signed((reg82 <= (8'ha9))) ?
                  $unsigned((+wire69)) : reg87[(4'hc):(4'hc)]) | (-{(^~reg73),
                  reg75})));
              reg96 <= ($unsigned(reg95[(4'hd):(4'h8)]) >>> reg78);
              reg97 <= reg88;
            end
          else
            begin
              reg93 <= ($signed(((+(wire90 ^~ reg74)) ^ (~&$signed(reg84)))) ?
                  {(($signed(reg79) ? (^~wire68) : $signed(reg74)) <= reg85),
                      (|reg83[(4'he):(3'h6)])} : reg89[(2'h3):(1'h0)]);
              reg94 <= ($signed($unsigned(($unsigned(wire68) | (~|(8'h9f))))) <= $signed(wire91[(1'h1):(1'h1)]));
              reg95 <= (^(8'hb1));
            end
          if ($unsigned($signed(reg75[(3'h7):(2'h3)])))
            begin
              reg98 <= ((+wire65[(5'h12):(3'h4)]) <<< ({$signed(reg71[(2'h3):(2'h3)]),
                  {reg82[(4'h8):(1'h0)]}} == reg88[(3'h4):(2'h3)]));
              reg99 <= ($unsigned((reg72[(2'h2):(1'h1)] >> reg89[(5'h12):(1'h0)])) ?
                  $signed($unsigned((!reg88[(2'h3):(1'h0)]))) : wire68);
              reg100 <= reg87;
            end
          else
            begin
              reg98 <= reg79;
              reg99 <= reg84[(1'h0):(1'h0)];
              reg100 <= {reg99[(3'h6):(1'h0)]};
            end
        end
      else
        begin
          reg92 <= (&$signed(reg95[(2'h3):(1'h1)]));
          if ($signed(reg98))
            begin
              reg93 <= $signed($signed((($unsigned(reg95) ^~ reg75) >= $unsigned((-(8'had))))));
              reg94 <= (8'hb0);
              reg95 <= $signed(reg97[(3'h6):(1'h0)]);
              reg96 <= ({($signed((reg74 ~^ wire70)) ?
                      ((reg74 + wire67) >>> ((8'h9f) ?
                          reg77 : reg85)) : wire68[(2'h2):(1'h1)])} * (-{$unsigned((reg82 >> reg71))}));
            end
          else
            begin
              reg93 <= ((wire68 || {reg95,
                  ($signed(wire90) ?
                      $unsigned(wire90) : reg84[(5'h10):(4'he)])}) >>> (reg71 + (^~(((8'haa) ?
                  reg82 : reg99) & reg87))));
              reg94 <= (~&($unsigned(reg80) - $signed(reg79[(4'hb):(4'hb)])));
              reg95 <= $unsigned($unsigned(reg89));
              reg96 <= reg85;
            end
          if (((^reg96) ? $unsigned($unsigned(reg100[(2'h2):(2'h2)])) : reg76))
            begin
              reg97 <= reg87[(1'h1):(1'h0)];
              reg98 <= reg99[(1'h0):(1'h0)];
              reg99 <= reg85[(4'h8):(1'h0)];
            end
          else
            begin
              reg97 <= reg96;
              reg98 <= (-reg77[(1'h0):(1'h0)]);
              reg99 <= ((reg89[(5'h10):(4'hd)] ?
                  wire65[(5'h15):(4'h8)] : (^$unsigned($unsigned((8'hb6))))) & {reg79[(4'h9):(1'h0)]});
            end
        end
      if ({$unsigned($signed((&{reg87}))),
          ($signed(($signed((8'haf)) < (reg82 ?
              reg85 : reg89))) > (reg71[(1'h0):(1'h0)] ?
              $unsigned((reg92 ? wire91 : reg80)) : reg98))})
        begin
          reg101 <= (reg88 ?
              ((|wire90) < $unsigned(((reg87 && wire65) ?
                  (+wire90) : (reg99 ?
                      reg78 : reg93)))) : $signed((^~$unsigned((7'h43)))));
          if ($unsigned({$unsigned($unsigned({reg76})), reg77[(3'h5):(1'h1)]}))
            begin
              reg102 <= reg100[(2'h2):(1'h0)];
            end
          else
            begin
              reg102 <= $signed({reg86[(5'h12):(4'hf)],
                  $signed($signed(reg73))});
              reg103 <= reg74[(3'h5):(1'h1)];
              reg104 <= reg99[(2'h3):(1'h0)];
            end
          reg105 <= $unsigned(($signed({reg80}) >= reg71));
        end
      else
        begin
          if ($unsigned((reg73 && ($unsigned($unsigned(reg73)) && (((8'ha1) >> (8'hb0)) >= reg83[(4'h8):(2'h2)])))))
            begin
              reg101 <= (!reg96[(2'h2):(2'h2)]);
              reg102 <= $unsigned(reg82[(1'h0):(1'h0)]);
              reg103 <= (^reg96[(2'h3):(1'h1)]);
              reg104 <= $unsigned(reg96[(1'h0):(1'h0)]);
              reg105 <= wire91;
            end
          else
            begin
              reg101 <= $signed(($unsigned((-$unsigned(reg82))) | reg96));
              reg102 <= (reg88 == {{$unsigned((reg82 >> reg83)),
                      $unsigned($unsigned(wire91))},
                  reg78[(2'h3):(2'h3)]});
            end
          reg106 <= ((!reg102[(2'h3):(1'h1)]) || ($unsigned((reg74[(3'h7):(1'h1)] ?
                  wire66 : (wire90 ? reg100 : reg81))) ?
              ({(~^(8'hb9))} ?
                  (reg85 & reg82[(1'h1):(1'h0)]) : $signed((~&reg74))) : (($unsigned(wire67) ?
                  (reg72 & reg77) : wire67[(1'h1):(1'h0)]) >= {{reg88}})));
          reg107 <= reg87;
          reg108 <= (~^($signed($unsigned((-reg71))) ^~ (&(reg78 ?
              $unsigned(reg94) : wire90[(4'he):(1'h1)]))));
        end
      reg109 <= $unsigned((($unsigned((reg88 ? reg102 : (8'ha9))) ?
              wire91[(3'h4):(3'h4)] : {{reg85}}) ?
          reg93[(1'h1):(1'h0)] : reg102));
      reg110 <= (reg89 ?
          (((wire69 ? {reg73, reg84} : (reg105 >> reg85)) ?
              (+(wire66 ?
                  reg86 : reg99)) : (~|(-reg105))) >>> (reg96[(2'h3):(2'h2)] ?
              reg74[(3'h6):(3'h4)] : (~|reg104))) : $signed(reg92));
      reg111 <= (+reg82[(1'h1):(1'h1)]);
    end
  assign wire112 = (wire65[(2'h3):(1'h1)] ^ {($unsigned((~^(8'ha6))) >>> (reg100 ?
                           (&wire69) : $unsigned(reg71))),
                       ($signed((~wire69)) + $signed((reg75 > (8'hb3))))});
  assign wire113 = (~|(8'haf));
  always
    @(posedge clk) begin
      reg114 <= $signed({(~&(^~$signed(wire66)))});
      if (($unsigned($signed((+reg94))) <= {(wire113[(2'h2):(1'h1)] + $unsigned($signed(reg85))),
          ((~$signed(wire70)) ?
              ($unsigned(reg100) ? reg85 : reg109) : reg77[(2'h2):(2'h2)])}))
        begin
          reg115 <= reg92[(2'h2):(2'h2)];
          reg116 <= (^{$signed(reg78[(2'h3):(1'h1)])});
          reg117 <= (~reg95[(4'h8):(3'h4)]);
          reg118 <= $unsigned(reg115);
          reg119 <= (reg108[(4'hd):(4'hd)] ?
              (~$signed(((reg98 << reg110) ?
                  {reg74} : (+(8'hb1))))) : ((reg80[(3'h5):(1'h1)] | ({reg71,
                          reg97} ?
                      reg99[(3'h5):(3'h5)] : $signed(reg115))) ?
                  $signed(reg92) : (^reg86)));
        end
      else
        begin
          reg115 <= ({$unsigned($unsigned((reg94 || reg86))),
                  ((reg97[(2'h3):(2'h3)] == (reg102 + reg71)) ?
                      ({reg95, (8'hb6)} ? (&reg105) : reg86) : wire69)} ?
              ($signed(wire113) - $signed(reg104[(3'h7):(3'h6)])) : (+reg77));
          reg116 <= $signed(($signed(($unsigned(reg74) <= $unsigned(reg82))) && (8'hb3)));
          reg117 <= {(!(|(!(!(8'h9e))))), wire70[(2'h2):(2'h2)]};
        end
    end
  assign wire120 = $unsigned(((reg94 ?
                       reg96[(2'h3):(2'h2)] : ((wire68 ?
                           reg77 : wire70) + reg119[(2'h3):(1'h1)])) || (~&({wire113} > {reg76}))));
  assign wire121 = $unsigned($signed($unsigned((reg96[(1'h1):(1'h1)] ?
                       $unsigned(reg72) : $unsigned(reg84)))));
  assign wire122 = ($signed(wire121[(3'h6):(2'h3)]) ?
                       (~^reg101[(2'h2):(1'h1)]) : $signed($signed(reg108)));
  assign wire123 = wire69;
  always
    @(posedge clk) begin
      if (((~reg118) > reg97))
        begin
          reg124 <= (reg114[(4'hb):(2'h3)] ?
              ((+reg103) ?
                  wire91[(2'h3):(1'h0)] : $signed(wire90)) : $unsigned(wire123));
          reg125 <= ((|wire113) ?
              ($signed({$unsigned(reg88)}) ?
                  reg76 : ($signed(reg96[(1'h1):(1'h0)]) >>> $signed(reg95[(4'hf):(4'h9)]))) : $unsigned(reg76[(5'h11):(1'h1)]));
          if (($unsigned($unsigned($unsigned($unsigned(reg124)))) >= $signed($unsigned(reg111[(4'h8):(1'h0)]))))
            begin
              reg126 <= (~($unsigned(reg96) >> $signed(reg115[(1'h0):(1'h0)])));
              reg127 <= reg71;
            end
          else
            begin
              reg126 <= (|$unsigned((reg101 ^~ $signed(reg102))));
            end
          reg128 <= $unsigned(wire120[(1'h0):(1'h0)]);
          reg129 <= ((reg111[(3'h5):(1'h0)] ?
              reg71[(1'h1):(1'h0)] : (&{$unsigned(reg109)})) != $signed(((~&((8'ha2) >= reg71)) ?
              reg82[(1'h0):(1'h0)] : $unsigned((reg72 ? reg89 : reg126)))));
        end
      else
        begin
          reg124 <= $unsigned({($signed((reg118 ? reg124 : reg114)) ?
                  ($signed(reg126) ?
                      reg82 : $unsigned(reg118)) : {$signed((8'hbd))})});
        end
      if ({$unsigned((reg128[(4'hd):(4'h9)] & (reg80 ?
              (&reg118) : $unsigned(reg116)))),
          (reg102[(3'h7):(3'h4)] <= (($signed(reg88) < wire112[(4'h8):(2'h3)]) && ({wire122,
                  (8'ha7)} ?
              $unsigned(reg71) : reg111[(3'h7):(3'h4)])))})
        begin
          reg130 <= {{((^$unsigned(wire120)) ?
                      reg105[(5'h10):(4'h9)] : $signed($signed(wire112)))},
              $signed(reg101)};
          reg131 <= $unsigned((8'hb6));
          reg132 <= {(^wire90[(5'h11):(1'h1)]), reg80[(3'h5):(1'h0)]};
          if (reg84[(1'h1):(1'h0)])
            begin
              reg133 <= {($signed($unsigned($unsigned(wire112))) ?
                      (&((8'ha8) << (reg118 != reg128))) : $signed((~(|reg77))))};
              reg134 <= $signed((($signed(wire120) <<< (~&{reg79})) * reg78[(2'h2):(1'h0)]));
              reg135 <= (((8'h9f) < ($signed(((8'hbc) ^~ reg130)) <<< $unsigned((reg77 >> reg127)))) >> reg109);
              reg136 <= $signed((8'had));
              reg137 <= (~^$unsigned((8'ha1)));
            end
          else
            begin
              reg133 <= (|reg135[(3'h6):(3'h4)]);
              reg134 <= reg136;
              reg135 <= (~&(-reg134));
            end
        end
      else
        begin
          reg130 <= reg99[(2'h3):(2'h2)];
          reg131 <= reg129[(1'h0):(1'h0)];
          if (wire65)
            begin
              reg132 <= $signed((!{((+reg74) == (reg89 ? reg117 : reg74)),
                  (^(8'hb6))}));
              reg133 <= $signed(((((reg80 ~^ wire90) ?
                  (reg135 ?
                      reg125 : reg77) : $unsigned(reg114)) * reg131[(2'h3):(1'h0)]) >> (reg101[(2'h2):(1'h0)] ?
                  $signed((reg98 > reg74)) : wire70[(1'h1):(1'h0)])));
              reg134 <= $signed($unsigned($unsigned($unsigned((reg124 >>> reg109)))));
            end
          else
            begin
              reg132 <= $signed(reg104);
              reg133 <= reg78[(1'h1):(1'h1)];
              reg134 <= (reg102 & $unsigned(reg80));
            end
          reg135 <= (~&reg133[(1'h0):(1'h0)]);
          reg136 <= (^~$signed(reg92));
        end
      if (reg105[(2'h3):(1'h1)])
        begin
          reg138 <= reg117;
          reg139 <= $signed(($signed(((~|reg106) ?
              reg125 : (reg104 ?
                  reg86 : reg128))) >>> (^~reg109[(2'h3):(2'h3)])));
          if (((reg97 ?
              (reg81[(3'h6):(1'h0)] ?
                  $unsigned($signed((8'hbb))) : (wire69[(4'ha):(2'h2)] ?
                      reg80 : reg106)) : reg97) <= (reg129 ^ $unsigned($unsigned((^reg105))))))
            begin
              reg140 <= (~$unsigned($unsigned((reg78[(2'h3):(2'h3)] ?
                  (~(8'ha9)) : (^~wire67)))));
              reg141 <= reg127[(4'hd):(4'hd)];
              reg142 <= $unsigned($unsigned($unsigned(reg73[(4'ha):(2'h3)])));
              reg143 <= (8'ha1);
              reg144 <= (reg133[(2'h2):(1'h0)] <<< reg110);
            end
          else
            begin
              reg140 <= reg107;
              reg141 <= wire69;
              reg142 <= reg89;
              reg143 <= $unsigned($signed($unsigned((+reg75[(3'h6):(2'h3)]))));
              reg144 <= ($signed($unsigned($unsigned(reg84[(2'h3):(2'h2)]))) - $signed(reg101[(1'h1):(1'h1)]));
            end
          if (reg75)
            begin
              reg145 <= (~(~(reg80 ?
                  ((^reg95) ?
                      $unsigned(reg79) : ((8'ha0) < reg127)) : $unsigned($signed(reg83)))));
              reg146 <= (|reg136);
              reg147 <= (8'hb0);
              reg148 <= (|reg81[(4'h8):(3'h6)]);
              reg149 <= (-$signed((((wire68 ? (8'ha1) : reg130) ?
                  reg93[(2'h2):(1'h1)] : (wire66 ?
                      reg146 : reg85)) <= ((reg147 ? reg101 : wire70) ?
                  reg85 : (+wire112)))));
            end
          else
            begin
              reg145 <= reg133[(1'h0):(1'h0)];
            end
        end
      else
        begin
          if (((8'hbe) ?
              $unsigned($signed((~&$unsigned(reg145)))) : $unsigned((^reg137[(2'h3):(2'h2)]))))
            begin
              reg138 <= ((~&reg141[(1'h0):(1'h0)]) ?
                  (~^wire66) : (({(wire68 ^~ reg85)} - (~&{reg110, reg81})) ?
                      ((^~((8'ha3) - reg124)) - (+(~reg116))) : $unsigned({((8'hb0) + reg142),
                          (~|reg77)})));
              reg139 <= (((~|wire123) ?
                  (wire70[(2'h3):(2'h2)] == $unsigned($signed((8'hbf)))) : (8'h9e)) > $unsigned($unsigned((((8'ha3) ?
                      (8'ha6) : reg127) ?
                  $signed(reg115) : reg114[(1'h1):(1'h1)]))));
            end
          else
            begin
              reg138 <= $signed($unsigned({reg86}));
              reg139 <= reg85;
              reg140 <= {(~|$signed(($signed(reg148) ?
                      (reg77 ? reg93 : reg88) : (reg95 >>> reg101)))),
                  ($unsigned($signed($unsigned(reg71))) ?
                      $unsigned(reg75) : $signed((~|(reg141 > (8'hbe)))))};
              reg141 <= (($signed(({reg88, (8'h9c)} + {reg75,
                      reg133})) * ((reg92[(1'h0):(1'h0)] << $unsigned(reg139)) ?
                      {reg126} : ((reg83 <= reg115) << (reg76 ?
                          wire69 : reg114)))) ?
                  (wire66[(1'h0):(1'h0)] ?
                      (!$signed(reg134)) : (~^$unsigned($signed(reg108)))) : (wire70 ?
                      $unsigned($unsigned((~(8'ha0)))) : reg110[(2'h2):(2'h2)]));
              reg142 <= (8'ha4);
            end
          reg143 <= ((^{(+reg79[(2'h3):(1'h0)])}) ? reg79 : reg131);
          if ($unsigned(($signed(((+(8'ha3)) ?
              reg80[(2'h2):(1'h0)] : (~^wire65))) >= reg117[(2'h2):(1'h1)])))
            begin
              reg144 <= ({($unsigned({reg125, reg87}) ?
                          reg81[(1'h0):(1'h0)] : reg135)} ?
                  ((~|reg73) > (((&reg117) >= $unsigned(reg140)) ^ ($unsigned(wire90) ?
                      (-reg114) : (reg147 ~^ (8'hb0))))) : $signed((8'hac)));
            end
          else
            begin
              reg144 <= (8'ha5);
              reg145 <= $signed(($signed(wire66) * $signed(reg127[(4'hc):(1'h1)])));
            end
          reg146 <= reg79[(4'h9):(3'h7)];
          if ((reg144[(1'h0):(1'h0)] <<< reg128[(4'hf):(3'h4)]))
            begin
              reg147 <= $unsigned((reg101[(1'h1):(1'h1)] ?
                  (wire122[(4'h9):(4'h9)] || wire122[(4'ha):(2'h3)]) : (|(+(~|reg107)))));
            end
          else
            begin
              reg147 <= (($signed($unsigned({reg76,
                      wire113})) ^~ (($signed(reg140) ?
                          (reg89 > reg82) : (reg109 ? reg89 : reg119)) ?
                      $unsigned((!wire70)) : $signed($unsigned(reg99)))) ?
                  (~^(({reg125, reg129} < reg111) < (((8'hbd) <<< wire70) ?
                      reg118 : {reg92,
                          reg77}))) : ({(^~$signed(wire69))} < {{reg108[(3'h6):(3'h4)]},
                      reg145}));
              reg148 <= (+$unsigned(reg83[(4'hf):(2'h3)]));
            end
        end
      reg150 <= $signed(wire91[(3'h4):(2'h2)]);
    end
endmodule

module module48  (y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'h24):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire53;
  input wire signed [(4'hd):(1'h0)] wire52;
  input wire [(3'h5):(1'h0)] wire51;
  input wire [(4'hf):(1'h0)] wire50;
  input wire signed [(4'he):(1'h0)] wire49;
  wire [(4'h8):(1'h0)] wire57;
  wire signed [(4'he):(1'h0)] wire56;
  wire signed [(4'ha):(1'h0)] wire55;
  wire signed [(2'h3):(1'h0)] wire54;
  assign y = {wire57, wire56, wire55, wire54, (1'h0)};
  assign wire54 = {(~^wire52[(1'h1):(1'h1)]), wire50};
  assign wire55 = wire54[(2'h2):(1'h0)];
  assign wire56 = wire51;
  assign wire57 = $unsigned((8'hab));
endmodule

module module15
#(parameter param37 = (+(&((~&{(8'hac), (8'had)}) << ((~^(8'hbc)) ? ((8'hac) ? (8'ha5) : (8'h9c)) : ((8'hb8) ^ (8'hbb)))))))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'hd3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire19;
  input wire signed [(5'h10):(1'h0)] wire18;
  input wire [(5'h12):(1'h0)] wire17;
  input wire [(2'h2):(1'h0)] wire16;
  wire [(3'h6):(1'h0)] wire36;
  wire signed [(4'hd):(1'h0)] wire35;
  wire signed [(5'h13):(1'h0)] wire34;
  wire signed [(4'h8):(1'h0)] wire33;
  wire [(4'h8):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire31;
  wire [(5'h13):(1'h0)] wire30;
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg20 <= $unsigned($unsigned(wire16));
      reg21 <= (+$unsigned((^$signed(reg20[(4'h9):(3'h6)]))));
      reg22 <= {reg20};
      if ($signed({wire18}))
        begin
          if ((!reg22))
            begin
              reg23 <= wire17;
            end
          else
            begin
              reg23 <= ({$unsigned((8'hbb))} ?
                  $unsigned(reg20) : (-$unsigned(wire18[(4'hd):(1'h0)])));
              reg24 <= $unsigned(($unsigned((8'hb6)) ^ $signed(($signed((8'hb9)) ?
                  (wire17 - reg22) : $unsigned(reg21)))));
              reg25 <= $unsigned(($signed((wire19 ^ $signed(reg23))) ?
                  ($unsigned((~(8'hb7))) ^~ {(~reg23)}) : $unsigned(wire18[(4'hd):(4'hc)])));
            end
          reg26 <= ($signed((&$signed(((7'h40) ?
              reg22 : reg20)))) && (~|$unsigned(reg22)));
          reg27 <= $unsigned({((|(!(8'h9c))) ? (8'ha3) : reg25),
              $unsigned(wire16[(1'h1):(1'h0)])});
          reg28 <= (~^($signed($signed(((8'hac) ? reg27 : reg20))) ?
              reg24 : wire18[(4'he):(4'hd)]));
          reg29 <= wire18;
        end
      else
        begin
          reg23 <= (8'hb5);
          reg24 <= $signed($signed($unsigned(((reg23 > (8'ha0)) ?
              $unsigned((7'h41)) : $signed(reg29)))));
          reg25 <= $unsigned($signed(((~|(reg22 ? wire19 : reg20)) ?
              $signed(wire16) : $unsigned((reg29 ^ reg24)))));
          reg26 <= $unsigned((~&wire17[(4'ha):(3'h5)]));
          reg27 <= $signed(reg29);
        end
    end
  assign wire30 = ((^$signed({((7'h44) || (8'hbd)), $unsigned(reg23)})) ?
                      (!($signed($signed(wire19)) ?
                          (^~(reg20 ? wire18 : reg28)) : {(-reg26),
                              (-reg27)})) : $signed(($signed(reg25[(1'h0):(1'h0)]) ?
                          reg25 : reg25)));
  assign wire31 = $signed((reg22 ?
                      reg28[(4'hc):(4'hc)] : (~{$signed(wire16),
                          {wire30, (8'had)}})));
  assign wire32 = (~^({((~wire30) ? wire17 : (reg25 ? reg20 : wire16)),
                      reg27} <= $unsigned(reg27[(2'h2):(2'h2)])));
  assign wire33 = ($unsigned({{(reg29 | wire19),
                          $signed((8'hb7))}}) < (reg27[(1'h0):(1'h0)] ?
                      $unsigned($unsigned(reg25)) : wire17));
  assign wire34 = (-$unsigned(reg26));
  assign wire35 = $signed(reg28[(4'he):(4'ha)]);
  assign wire36 = $signed($signed(((-{wire31}) <= (8'hbe))));
endmodule
