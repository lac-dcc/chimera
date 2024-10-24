module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h15b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire230;
  wire signed [(4'he):(1'h0)] wire220;
  wire [(5'h13):(1'h0)] wire16;
  wire [(5'h13):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire28;
  wire [(4'hd):(1'h0)] wire30;
  wire signed [(4'hc):(1'h0)] wire31;
  wire signed [(5'h15):(1'h0)] wire32;
  wire signed [(4'hb):(1'h0)] wire38;
  wire signed [(5'h13):(1'h0)] wire39;
  wire signed [(5'h13):(1'h0)] wire41;
  wire [(3'h7):(1'h0)] wire218;
  wire [(4'ha):(1'h0)] wire222;
  wire signed [(4'ha):(1'h0)] wire224;
  wire [(5'h13):(1'h0)] wire225;
  wire [(5'h10):(1'h0)] wire226;
  wire [(3'h7):(1'h0)] wire227;
  wire signed [(5'h14):(1'h0)] wire228;
  reg signed [(5'h11):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(5'h11):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  assign y = {wire230,
                 wire220,
                 wire16,
                 wire4,
                 wire28,
                 wire30,
                 wire31,
                 wire32,
                 wire38,
                 wire39,
                 wire41,
                 wire218,
                 wire222,
                 wire224,
                 wire225,
                 wire226,
                 wire227,
                 wire228,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg40,
                 (1'h0)};
  assign wire4 = (^~{(((^~wire0) || (~|wire0)) ?
                         (wire2[(1'h1):(1'h1)] ?
                             $signed(wire2) : wire1[(1'h1):(1'h0)]) : ((wire1 >= (8'ha8)) <<< wire2))});
  module5 #() modinst17 (.clk(clk), .wire9(wire2), .y(wire16), .wire10(wire3), .wire8(wire0), .wire7(wire1), .wire6(wire4));
  module18 #() modinst29 (.wire21(wire0), .wire19(wire2), .wire22(wire3), .clk(clk), .y(wire28), .wire20(wire4));
  assign wire30 = {({(((8'haa) ? wire1 : wire4) >>> wire4[(1'h0):(1'h0)]),
                              {wire16[(1'h1):(1'h1)], (wire2 != wire1)}} ?
                          (~^(wire1[(2'h2):(2'h2)] <= (^wire1))) : wire3[(4'h9):(1'h1)]),
                      (+$unsigned((^wire0[(3'h5):(2'h2)])))};
  assign wire31 = wire30;
  assign wire32 = $unsigned($signed($unsigned((wire16[(5'h13):(4'ha)] ?
                      $unsigned(wire0) : (8'hbb)))));
  always
    @(posedge clk) begin
      reg33 <= $signed(wire30);
      reg34 <= (|(8'hbe));
      reg35 <= {($signed((wire30[(4'hc):(4'h9)] ?
                  $unsigned(wire0) : (-wire2))) ?
              $signed({$signed(wire1),
                  (wire4 ? wire32 : wire16)}) : ((~^{wire31}) * ((wire31 ?
                  wire3 : wire2) != {wire30, wire4})))};
      reg36 <= ($unsigned((~&(^wire2[(4'hc):(3'h7)]))) ?
          {(8'had), wire28[(3'h5):(2'h3)]} : reg34);
      reg37 <= wire28;
    end
  assign wire38 = $signed($signed($signed(wire1)));
  assign wire39 = ((8'hb9) && reg34);
  always
    @(posedge clk) begin
      reg40 <= wire32;
    end
  assign wire41 = $signed($signed((8'hbd)));
  module42 #() modinst219 (.clk(clk), .wire43(wire4), .y(wire218), .wire46(wire3), .wire45(wire39), .wire44(reg34));
  module56 #() modinst221 (.clk(clk), .wire57(reg35), .y(wire220), .wire61(wire39), .wire59(wire1), .wire60(reg33), .wire58(wire32));
  module42 #() modinst223 (.clk(clk), .y(wire222), .wire45(wire30), .wire43(wire220), .wire46(wire41), .wire44(wire1));
  assign wire224 = (&reg33);
  assign wire225 = $unsigned(wire220);
  assign wire226 = $signed((+reg33));
  assign wire227 = (((8'hba) ^ $unsigned(wire2)) ^~ $unsigned((reg37 ?
                       (~wire2) : (~^$signed(reg35)))));
  module5 #() modinst229 (wire228, clk, wire16, wire32, reg33, reg34, wire225);
  assign wire230 = ((wire38 ? (|$unsigned({reg35, wire41})) : (^reg35)) ?
                       wire220[(4'hc):(4'ha)] : (~&wire3[(5'h11):(1'h1)]));
endmodule

module module42
#(parameter param217 = (~&((+(~(+(8'h9e)))) << (-{(~&(8'ha1))}))))
(y, clk, wire43, wire44, wire45, wire46);
  output wire [(32'h1ea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire43;
  input wire signed [(4'he):(1'h0)] wire44;
  input wire signed [(3'h5):(1'h0)] wire45;
  input wire signed [(5'h13):(1'h0)] wire46;
  wire [(4'hb):(1'h0)] wire216;
  wire [(4'hb):(1'h0)] wire215;
  wire [(4'hd):(1'h0)] wire204;
  wire signed [(4'he):(1'h0)] wire203;
  wire signed [(4'hb):(1'h0)] wire202;
  wire [(4'ha):(1'h0)] wire201;
  wire [(5'h10):(1'h0)] wire200;
  wire signed [(3'h6):(1'h0)] wire136;
  wire [(5'h14):(1'h0)] wire48;
  wire [(5'h11):(1'h0)] wire49;
  wire signed [(4'h9):(1'h0)] wire82;
  wire [(4'hb):(1'h0)] wire165;
  wire [(4'he):(1'h0)] wire198;
  reg [(5'h13):(1'h0)] reg214 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg213 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg212 = (1'h0);
  reg [(5'h13):(1'h0)] reg211 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg210 = (1'h0);
  reg [(5'h11):(1'h0)] reg209 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg208 = (1'h0);
  reg [(5'h10):(1'h0)] reg207 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg206 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg205 = (1'h0);
  reg [(4'ha):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg143 = (1'h0);
  reg [(3'h6):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg141 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg140 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg139 = (1'h0);
  reg [(5'h13):(1'h0)] reg138 = (1'h0);
  reg [(5'h15):(1'h0)] reg47 = (1'h0);
  reg [(5'h13):(1'h0)] reg50 = (1'h0);
  reg [(5'h14):(1'h0)] reg51 = (1'h0);
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg53 = (1'h0);
  reg [(4'he):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  assign y = {wire216,
                 wire215,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire136,
                 wire48,
                 wire49,
                 wire82,
                 wire165,
                 wire198,
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
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg47,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg47 <= wire44;
    end
  assign wire48 = {wire44};
  assign wire49 = $unsigned(wire46[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg50 <= wire45[(3'h4):(3'h4)];
    end
  always
    @(posedge clk) begin
      reg51 <= wire43;
      reg52 <= (~|(-$unsigned($signed((reg51 >= wire46)))));
      reg53 <= (({$unsigned($unsigned((8'hab)))} | (7'h40)) <= $signed($signed($signed((~wire49)))));
      reg54 <= wire48;
      reg55 <= (($signed((!(&wire44))) * $unsigned(($signed(reg47) ?
              $unsigned(wire46) : (reg50 >>> reg54)))) ?
          (wire44 ?
              {reg51} : ((+(~&wire43)) ?
                  ($unsigned(reg54) << {wire48}) : $signed((reg54 ?
                      (8'hba) : reg53)))) : {wire49});
    end
  module56 #() modinst83 (wire82, clk, reg51, reg50, reg55, reg54, wire49);
  module84 #() modinst137 (.y(wire136), .wire86(reg50), .wire87(reg52), .wire85(wire46), .clk(clk), .wire88(reg47));
  always
    @(posedge clk) begin
      if ({$signed(reg51[(4'hc):(3'h7)]),
          {$signed(($signed(wire43) ? ((7'h41) ? reg54 : wire46) : wire48))}})
        begin
          reg138 <= $signed(((|$unsigned((^~wire48))) ~^ $signed(reg53)));
          reg139 <= (reg54[(1'h0):(1'h0)] | ($unsigned(wire46) ^~ (^~(!wire46[(3'h5):(3'h4)]))));
        end
      else
        begin
          if ({($signed((+(wire136 ? (7'h44) : reg54))) ?
                  (reg55 >> ($unsigned(wire45) + wire44)) : (8'hb5))})
            begin
              reg138 <= ((~&($unsigned($unsigned(reg55)) ?
                  ((!reg54) & wire136[(1'h1):(1'h1)]) : (&(wire48 | (7'h43))))) + (wire82[(3'h7):(3'h7)] + $unsigned(((8'hb1) | {reg138}))));
              reg139 <= reg50;
              reg140 <= (((!reg51) ?
                      ((((8'ha2) <<< reg54) >> wire45[(2'h3):(1'h1)]) ?
                          reg54[(1'h1):(1'h0)] : $unsigned((wire45 - wire45))) : reg138[(4'hd):(4'h9)]) ?
                  {({wire44[(4'hd):(3'h4)]} != ((|reg55) ~^ (reg54 ^~ wire49))),
                      ((wire43[(3'h4):(1'h0)] ?
                          (~|wire48) : (&reg52)) || reg51[(1'h0):(1'h0)])} : reg138[(3'h4):(2'h2)]);
              reg141 <= reg53;
              reg142 <= (-$unsigned(reg141));
            end
          else
            begin
              reg138 <= wire45;
              reg139 <= ($signed(($signed((8'hb1)) & ({(8'ha1), reg47} ?
                      (&reg50) : (reg47 + reg53)))) ?
                  (^reg55) : (({(!(7'h40))} <= $signed(((8'hb2) >= reg47))) & (-{((8'ha9) ?
                          reg55 : wire46)})));
            end
          reg143 <= (7'h43);
        end
      reg144 <= (wire49 ?
          {(reg55 <<< ((~reg139) ?
                  ((8'hbd) ?
                      reg52 : reg53) : wire49[(1'h1):(1'h1)]))} : $signed($unsigned(reg50)));
    end
  module145 #() modinst166 (wire165, clk, reg52, wire43, reg140, wire46);
  module167 #() modinst199 (wire198, clk, reg51, reg139, reg52, wire49, reg141);
  assign wire200 = (wire44[(2'h2):(1'h0)] <<< $signed($unsigned($signed(wire44))));
  assign wire201 = wire136[(1'h0):(1'h0)];
  assign wire202 = reg140;
  assign wire203 = $unsigned(reg54[(3'h5):(1'h0)]);
  assign wire204 = ($unsigned($unsigned((((8'hae) ? wire201 : wire201) ?
                           (!reg53) : (8'hb1)))) ?
                       (reg143 ?
                           $unsigned((wire45[(1'h1):(1'h0)] + reg52)) : $unsigned(($signed(wire45) < $signed(reg142)))) : $signed((reg141[(2'h3):(1'h1)] ?
                           (~^(+reg143)) : (~&(7'h40)))));
  always
    @(posedge clk) begin
      reg205 <= (^~wire82[(4'h9):(1'h1)]);
      if ($unsigned({$unsigned(wire45)}))
        begin
          if ({(reg51 >= (~^wire43[(1'h1):(1'h1)]))})
            begin
              reg206 <= reg142;
              reg207 <= {((^$unsigned({wire82,
                      reg206})) >> wire200[(4'he):(4'he)])};
            end
          else
            begin
              reg206 <= {(reg47 ?
                      (wire46 ^ (+wire44[(3'h4):(2'h2)])) : ((((8'h9d) ?
                                  wire202 : reg205) ?
                              (~&reg47) : (~&reg47)) ?
                          ((wire82 ? wire204 : reg142) ?
                              (reg47 == (8'hbd)) : wire82[(4'h9):(3'h7)]) : (~^(|reg144))))};
              reg207 <= {(($unsigned((|wire48)) ?
                          {((8'haa) ? reg141 : reg55),
                              reg141} : (wire203 <<< (~(7'h44)))) ?
                      reg205[(2'h3):(2'h2)] : ((~^$unsigned((7'h40))) ^~ reg54)),
                  ((8'ha9) <= $signed(wire201[(4'ha):(2'h2)]))};
              reg208 <= $signed(($unsigned(($unsigned(reg50) <<< (+reg143))) * (~|reg142)));
            end
          reg209 <= $signed((wire136[(1'h0):(1'h0)] & reg139[(1'h0):(1'h0)]));
          reg210 <= wire200[(1'h0):(1'h0)];
          reg211 <= wire43[(4'ha):(4'h9)];
        end
      else
        begin
          reg206 <= {(+$signed({(reg141 ? wire44 : wire201), (8'ha1)}))};
        end
      reg212 <= wire43[(4'ha):(4'ha)];
      reg213 <= wire165[(2'h3):(2'h3)];
      reg214 <= ((!wire45) ?
          (+(~((|wire136) || reg207))) : reg205[(2'h3):(1'h1)]);
    end
  assign wire215 = (reg141[(3'h4):(2'h3)] & $unsigned(reg141));
  assign wire216 = ((wire82 ? $signed((+(8'hb0))) : wire215) ?
                       {{((^~(8'h9f)) ? (~|reg139) : reg207)},
                           ((|{reg47}) ?
                               reg213 : $unsigned($signed(reg54)))} : {$signed((reg213[(1'h0):(1'h0)] ?
                               {reg209, reg213} : $unsigned((8'h9f))))});
endmodule

module module18
#(parameter param27 = {(((((8'hbd) == (8'h9c)) ? {(8'ha8)} : ((8'ha9) ? (8'hb1) : (8'hbe))) && ((~(8'h9e)) ? ((8'h9d) ? (8'ha6) : (8'hb8)) : ((8'hb7) < (8'hb0)))) || ((((8'hbb) ? (8'ha0) : (8'hae)) ? ((8'ha1) ? (8'h9e) : (8'hae)) : {(8'h9c)}) ? (!((8'h9c) ? (8'hba) : (7'h44))) : ({(7'h40), (8'haa)} < (|(7'h41)))))})
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire22;
  input wire signed [(5'h11):(1'h0)] wire21;
  input wire [(4'ha):(1'h0)] wire20;
  input wire [(2'h3):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire26;
  wire [(5'h10):(1'h0)] wire25;
  wire signed [(4'he):(1'h0)] wire24;
  wire [(5'h12):(1'h0)] wire23;
  assign y = {wire26, wire25, wire24, wire23, (1'h0)};
  assign wire23 = wire20[(4'h8):(3'h7)];
  assign wire24 = {(7'h44)};
  assign wire25 = wire19;
  assign wire26 = {wire23[(5'h12):(2'h3)],
                      $unsigned(((~|$unsigned(wire22)) * wire23[(3'h4):(1'h0)]))};
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h29):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire10;
  input wire [(5'h11):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire signed [(4'h9):(1'h0)] wire7;
  input wire [(5'h13):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire14;
  wire [(4'hb):(1'h0)] wire13;
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  assign y = {wire15, wire14, wire13, reg12, reg11, (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= (-$unsigned((((7'h41) ? wire8 : $signed(wire10)) ?
          $signed(wire10[(1'h0):(1'h0)]) : $signed(wire8))));
      reg12 <= reg11;
    end
  assign wire13 = ({($unsigned((~&wire8)) && wire8),
                      {(^~((7'h43) < reg11))}} <= (~^{$unsigned($unsigned(reg12)),
                      ((wire7 <= wire7) ? reg11 : wire6)}));
  assign wire14 = ($unsigned((-((wire13 ^ wire10) ?
                      (wire10 ?
                          wire10 : wire8) : (~reg12)))) - (-(~&wire7[(3'h4):(3'h4)])));
  assign wire15 = (wire6 < ({(8'hb6),
                      wire9[(5'h11):(4'h9)]} ^ {$unsigned((^wire9)),
                      {$unsigned(reg11), $unsigned(reg11)}}));
endmodule

module module167
#(parameter param197 = (({(((8'hb6) ? (8'hbb) : (8'hae)) <<< (!(8'hbe))), (~((8'hbd) ? (8'hbf) : (8'ha4)))} ? {(8'ha5), ((^(8'hbf)) ^~ ((8'ha2) < (8'h9e)))} : (({(8'h9c), (8'hbe)} <= (8'hb2)) == (^((8'hac) ? (8'hb1) : (8'ha7))))) << {((((8'hac) | (8'h9d)) <= ((8'ha5) ? (8'hba) : (7'h43))) || (~^((8'hb3) - (8'hae))))}))
(y, clk, wire172, wire171, wire170, wire169, wire168);
  output wire [(32'he6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire172;
  input wire [(3'h7):(1'h0)] wire171;
  input wire signed [(4'hb):(1'h0)] wire170;
  input wire signed [(4'hb):(1'h0)] wire169;
  input wire signed [(3'h6):(1'h0)] wire168;
  wire signed [(3'h4):(1'h0)] wire196;
  wire [(2'h2):(1'h0)] wire195;
  wire signed [(3'h7):(1'h0)] wire194;
  wire signed [(5'h13):(1'h0)] wire193;
  wire signed [(4'ha):(1'h0)] wire192;
  wire [(4'hf):(1'h0)] wire191;
  wire signed [(2'h2):(1'h0)] wire190;
  wire signed [(4'h9):(1'h0)] wire189;
  wire [(5'h14):(1'h0)] wire188;
  wire signed [(3'h7):(1'h0)] wire187;
  wire signed [(4'hc):(1'h0)] wire186;
  wire signed [(3'h4):(1'h0)] wire184;
  wire [(3'h5):(1'h0)] wire183;
  wire signed [(3'h6):(1'h0)] wire182;
  wire signed [(4'hf):(1'h0)] wire181;
  wire [(5'h10):(1'h0)] wire180;
  reg [(5'h11):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg179 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg178 = (1'h0);
  reg [(3'h7):(1'h0)] reg177 = (1'h0);
  reg [(3'h4):(1'h0)] reg176 = (1'h0);
  reg [(4'hc):(1'h0)] reg175 = (1'h0);
  reg [(3'h5):(1'h0)] reg174 = (1'h0);
  reg [(4'ha):(1'h0)] reg173 = (1'h0);
  assign y = {wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 reg185,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned({(8'ha6),
          $signed(($signed((8'hb6)) ? (8'ha6) : (wire169 * (8'ha2))))}))
        begin
          if ((wire169[(3'h7):(3'h6)] << {wire168[(3'h4):(2'h2)],
              wire170[(3'h5):(1'h1)]}))
            begin
              reg173 <= ($signed((((wire170 ?
                          wire172 : wire171) && (wire171 & wire169)) ?
                      ((~wire172) ?
                          wire169[(4'h9):(2'h3)] : (8'haa)) : $unsigned(wire172[(4'h9):(4'h8)]))) ?
                  ((8'hbc) <<< wire169) : ((~($unsigned(wire170) ?
                          wire168[(3'h5):(3'h4)] : (wire170 ?
                              wire172 : wire169))) ?
                      wire168 : ($signed($unsigned((8'hb2))) ?
                          $signed(wire168[(3'h5):(3'h4)]) : (~|((8'ha9) ?
                              wire171 : wire172)))));
            end
          else
            begin
              reg173 <= ({wire169[(4'h8):(3'h4)],
                  (+(|{reg173}))} ~^ $unsigned({wire171[(3'h6):(2'h2)],
                  (-wire169)}));
              reg174 <= (+(^{$unsigned(wire172[(5'h12):(4'hd)])}));
            end
          reg175 <= wire171[(1'h0):(1'h0)];
          reg176 <= wire170[(2'h3):(1'h1)];
          reg177 <= {(^~(reg174[(3'h5):(2'h2)] ~^ reg173[(1'h0):(1'h0)])),
              $unsigned({(+(reg176 ? (7'h43) : reg175)),
                  {reg176, (^~wire172)}})};
          reg178 <= $unsigned((^~($signed(reg176[(1'h0):(1'h0)]) ?
              (^~(reg173 >>> reg174)) : {wire172, (wire172 ^~ (7'h41))})));
        end
      else
        begin
          reg173 <= (~^({$signed({reg176})} <<< reg173));
          reg174 <= $signed(($unsigned(wire169) ?
              (8'hba) : reg176[(2'h3):(2'h3)]));
          reg175 <= (7'h41);
          reg176 <= $unsigned((8'hb4));
          if ($signed(wire170[(3'h7):(2'h3)]))
            begin
              reg177 <= reg175[(4'ha):(4'h8)];
            end
          else
            begin
              reg177 <= reg173[(4'ha):(4'h9)];
              reg178 <= (8'h9e);
              reg179 <= reg177;
            end
        end
    end
  assign wire180 = $signed((~^reg174));
  assign wire181 = ((wire168[(3'h4):(2'h2)] ?
                       {(|{reg173})} : $signed(($signed((8'ha5)) ?
                           wire171 : (reg178 ? (8'had) : wire171)))) ~^ reg179);
  assign wire182 = $unsigned((~^(wire168 && $unsigned((+wire168)))));
  assign wire183 = (~^(reg176 ?
                       reg173[(3'h7):(1'h1)] : {($unsigned(wire182) ?
                               (!wire180) : $unsigned(reg176)),
                           wire181}));
  assign wire184 = wire182[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg185 <= $signed((|$unsigned(((~|reg175) != ((7'h44) << wire181)))));
    end
  assign wire186 = wire181;
  assign wire187 = (($signed((+wire182[(1'h1):(1'h1)])) ?
                           {$unsigned(((8'hb1) ?
                                   (8'ha2) : reg175))} : wire171[(3'h6):(2'h2)]) ?
                       (+wire171[(2'h2):(1'h0)]) : (8'h9e));
  assign wire188 = (~|$signed(({reg178} > wire181[(4'h8):(2'h3)])));
  assign wire189 = $unsigned(wire188[(3'h7):(3'h7)]);
  assign wire190 = (($unsigned(wire171) ?
                           reg173 : (({reg175} ? reg173 : (!wire180)) ?
                               (~&wire181) : (8'ha1))) ?
                       $signed($signed(wire189)) : $unsigned($signed($unsigned((wire169 ?
                           (8'ha3) : (8'hb3))))));
  assign wire191 = reg173;
  assign wire192 = reg174;
  assign wire193 = reg174;
  assign wire194 = {wire193};
  assign wire195 = (+{(-(~|(wire172 ? reg185 : wire184)))});
  assign wire196 = (+(^(~|{{wire193, wire170}, (wire184 & wire187)})));
endmodule

module module145
#(parameter param163 = (((((^(8'hb8)) ? {(8'hb0), (8'hbe)} : (~(8'ha3))) || (((8'hab) > (8'h9e)) != ((8'ha6) ? (8'hba) : (8'hb4)))) ? (^(-(8'haa))) : {((~^(8'ha9)) && (8'had))}) ^~ {((|(~&(8'ha5))) ? (((8'ha1) + (8'had)) ? (^(8'ha4)) : ((8'ha3) + (8'hbc))) : (~&(~|(8'ha5))))}), 
parameter param164 = {(^~(|{param163, (param163 ? (7'h42) : (8'hb8))}))})
(y, clk, wire149, wire148, wire147, wire146);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire149;
  input wire [(4'hc):(1'h0)] wire148;
  input wire [(3'h6):(1'h0)] wire147;
  input wire [(5'h13):(1'h0)] wire146;
  wire [(3'h7):(1'h0)] wire162;
  wire signed [(3'h4):(1'h0)] wire161;
  wire [(4'hb):(1'h0)] wire160;
  wire signed [(3'h4):(1'h0)] wire159;
  wire signed [(2'h2):(1'h0)] wire158;
  wire signed [(4'h8):(1'h0)] wire152;
  reg [(3'h7):(1'h0)] reg157 = (1'h0);
  reg [(3'h7):(1'h0)] reg156 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg155 = (1'h0);
  reg [(5'h12):(1'h0)] reg154 = (1'h0);
  reg [(5'h14):(1'h0)] reg153 = (1'h0);
  reg [(5'h10):(1'h0)] reg151 = (1'h0);
  reg signed [(4'he):(1'h0)] reg150 = (1'h0);
  assign y = {wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire152,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg151,
                 reg150,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg150 <= $signed((-$unsigned(wire148[(4'h8):(1'h0)])));
      reg151 <= ({$signed($unsigned(wire147[(1'h1):(1'h0)])),
              ($signed({wire147, wire147}) ?
                  ({wire146, wire147} ?
                      (wire148 ? wire146 : (8'haa)) : (wire146 ?
                          (8'ha5) : (8'hbc))) : wire149[(2'h3):(2'h2)])} ?
          reg150[(4'hd):(2'h2)] : ($unsigned($signed((~wire148))) & ($unsigned(wire148) >> {reg150[(4'hc):(4'ha)],
              reg150[(4'h8):(3'h5)]})));
    end
  assign wire152 = wire149[(4'hf):(2'h3)];
  always
    @(posedge clk) begin
      if ((^(reg151[(1'h1):(1'h0)] ?
          ($signed($unsigned(wire147)) ?
              ($unsigned(wire148) ?
                  $unsigned(wire149) : (wire146 ?
                      (8'hb9) : wire146)) : $unsigned((wire152 >> wire148))) : (((^wire148) ^ $signed(wire152)) && $unsigned((|wire152))))))
        begin
          reg153 <= reg151[(4'ha):(3'h6)];
        end
      else
        begin
          reg153 <= ($unsigned(wire147) ?
              wire146[(4'h8):(3'h7)] : (wire148 ?
                  (~(&$signed((8'haa)))) : wire152));
          reg154 <= $unsigned(reg150[(4'hc):(4'h9)]);
        end
      reg155 <= ((({$unsigned(wire149)} + $unsigned(((8'hb7) ?
                  wire146 : wire147))) ?
              ($unsigned((wire147 ? (8'hba) : wire149)) ?
                  ($signed((8'hbe)) ^~ (wire147 ?
                      reg150 : wire148)) : wire149[(4'h8):(3'h4)]) : wire152[(4'h8):(3'h5)]) ?
          ($unsigned(reg151) ?
              ((8'hac) <= reg154[(4'he):(4'hb)]) : ($signed((wire147 != reg150)) << $unsigned(((8'ha5) ?
                  wire146 : reg154)))) : {(~^(8'ha2))});
      reg156 <= (&(({{wire146}} ?
              ((~|reg151) ? $signed(wire146) : wire149) : {(^wire147)}) ?
          wire152[(2'h2):(1'h1)] : (|$signed((wire148 * reg154)))));
      reg157 <= ($unsigned(reg150) ?
          $unsigned((~(wire149[(4'hf):(4'h8)] << (reg156 < wire147)))) : wire148[(3'h4):(1'h1)]);
    end
  assign wire158 = wire147;
  assign wire159 = ((^~($unsigned(reg153[(4'he):(4'hc)]) ?
                           ($signed(reg153) - $unsigned(wire147)) : (((8'hba) <<< (8'hb3)) ?
                               $unsigned(wire146) : reg157))) ?
                       (|($unsigned(reg154) ^~ reg157)) : $unsigned(wire146[(3'h7):(1'h0)]));
  assign wire160 = {(((wire159[(3'h4):(2'h3)] ?
                               ((8'h9c) <<< reg150) : (reg154 ?
                                   reg151 : wire159)) == wire148[(1'h1):(1'h0)]) ?
                           $unsigned(((8'ha9) ?
                               wire149[(4'hb):(3'h6)] : reg156)) : ((~^(wire146 <<< wire149)) ?
                               $signed((wire146 ?
                                   reg156 : reg155)) : (-reg156)))};
  assign wire161 = $signed($unsigned(($unsigned(reg151[(4'hc):(2'h2)]) == wire158[(1'h1):(1'h1)])));
  assign wire162 = wire148[(4'ha):(4'h8)];
endmodule

module module84
#(parameter param134 = (8'ha6), 
parameter param135 = {((|(8'hbf)) ? (~|((param134 - (8'hb4)) + {param134})) : param134)})
(y, clk, wire88, wire87, wire86, wire85);
  output wire [(32'h241):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire88;
  input wire signed [(5'h10):(1'h0)] wire87;
  input wire [(5'h13):(1'h0)] wire86;
  input wire signed [(3'h6):(1'h0)] wire85;
  wire [(5'h10):(1'h0)] wire133;
  wire [(3'h5):(1'h0)] wire132;
  wire [(3'h6):(1'h0)] wire131;
  wire signed [(5'h12):(1'h0)] wire130;
  wire [(5'h13):(1'h0)] wire129;
  wire [(3'h4):(1'h0)] wire128;
  wire [(4'hf):(1'h0)] wire127;
  wire signed [(3'h4):(1'h0)] wire126;
  wire signed [(4'hf):(1'h0)] wire125;
  wire [(5'h10):(1'h0)] wire124;
  wire [(5'h12):(1'h0)] wire123;
  wire signed [(4'hf):(1'h0)] wire121;
  wire signed [(5'h15):(1'h0)] wire120;
  wire [(5'h13):(1'h0)] wire119;
  wire [(4'h8):(1'h0)] wire118;
  wire signed [(5'h15):(1'h0)] wire117;
  wire [(4'he):(1'h0)] wire92;
  wire [(5'h14):(1'h0)] wire91;
  wire signed [(5'h14):(1'h0)] wire90;
  wire signed [(5'h14):(1'h0)] wire89;
  reg signed [(4'ha):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg115 = (1'h0);
  reg [(5'h13):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg113 = (1'h0);
  reg [(4'h9):(1'h0)] reg112 = (1'h0);
  reg signed [(4'he):(1'h0)] reg111 = (1'h0);
  reg [(4'h9):(1'h0)] reg110 = (1'h0);
  reg [(5'h12):(1'h0)] reg109 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg108 = (1'h0);
  reg [(5'h11):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg104 = (1'h0);
  reg [(4'hb):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg102 = (1'h0);
  reg [(4'hf):(1'h0)] reg101 = (1'h0);
  reg [(4'ha):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg99 = (1'h0);
  reg signed [(4'he):(1'h0)] reg98 = (1'h0);
  reg [(3'h5):(1'h0)] reg97 = (1'h0);
  reg [(4'he):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg95 = (1'h0);
  reg [(3'h5):(1'h0)] reg94 = (1'h0);
  reg [(3'h7):(1'h0)] reg93 = (1'h0);
  assign y = {wire133,
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
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 reg122,
                 reg116,
                 reg115,
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
                 reg95,
                 reg94,
                 reg93,
                 (1'h0)};
  assign wire89 = wire88[(2'h2):(1'h1)];
  assign wire90 = ($signed(((wire87[(4'hf):(4'ha)] ?
                          {wire88, wire89} : $unsigned(wire89)) ?
                      (7'h42) : ($signed(wire88) ?
                          (wire85 - wire88) : $signed(wire85)))) + $signed((&((&(8'hb2)) && wire88[(3'h6):(3'h6)]))));
  assign wire91 = ({(((wire89 ? wire89 : wire88) ?
                          $unsigned(wire88) : (wire86 >>> wire86)) && {wire89[(1'h1):(1'h1)]}),
                      $signed(wire90)} ^~ (8'ha1));
  assign wire92 = ((wire86 ?
                      {{wire87[(4'he):(3'h5)], $unsigned(wire90)},
                          $signed(((8'hb7) < wire86))} : ((~(wire86 ?
                              wire85 : wire85)) ?
                          ((wire87 < wire85) - (&wire89)) : ((~|wire87) ?
                              (wire91 ? wire91 : (8'hb1)) : (wire86 ?
                                  (8'ha0) : wire88)))) != $unsigned(($signed((wire86 != wire86)) - $signed(((8'hab) << wire90)))));
  always
    @(posedge clk) begin
      if (($signed(($unsigned($signed(wire88)) == $signed(wire92))) ?
          wire85 : (wire87[(4'hf):(4'h9)] == $unsigned((&{(8'hbb)})))))
        begin
          reg93 <= (((^~wire86) ?
              wire88[(5'h15):(3'h7)] : (wire89[(4'h9):(2'h3)] & $unsigned(wire85))) <= $unsigned({wire86,
              $unsigned({wire86, wire86})}));
          reg94 <= wire87;
          reg95 <= wire92;
        end
      else
        begin
          reg93 <= wire85[(3'h6):(3'h4)];
          reg94 <= ((~wire91[(4'h9):(3'h6)]) ?
              (8'h9c) : $unsigned((~^(^((8'ha8) * wire88)))));
          reg95 <= ((+$unsigned({reg93[(3'h6):(2'h2)]})) ?
              $unsigned(wire88[(5'h12):(4'ha)]) : ($unsigned($signed((wire89 ?
                  wire91 : wire86))) >= $unsigned($signed({wire92}))));
        end
      reg96 <= $unsigned({{reg94[(2'h2):(1'h1)]}});
      if (($unsigned((-wire90)) >= $unsigned(((|reg96[(4'h9):(3'h4)]) << (wire86 ?
          (reg93 | wire87) : {wire87})))))
        begin
          reg97 <= reg94[(1'h1):(1'h1)];
          reg98 <= ($signed(wire89[(2'h3):(2'h3)]) <= (7'h44));
          reg99 <= $unsigned(($unsigned(((!wire87) >> $unsigned(wire86))) >> (wire92 ~^ {$unsigned(reg94),
              reg95})));
        end
      else
        begin
          if (wire85[(2'h3):(1'h1)])
            begin
              reg97 <= $signed((!{$unsigned($signed(wire86))}));
              reg98 <= ((~$signed($unsigned($signed((8'h9c))))) * $signed((8'ha5)));
              reg99 <= {$unsigned(wire90)};
              reg100 <= ((wire86[(3'h5):(3'h4)] << {$signed(wire86[(5'h11):(2'h2)])}) != reg95);
            end
          else
            begin
              reg97 <= wire85;
              reg98 <= (8'hac);
            end
          if (((wire87 ?
                  $signed((-{reg95, wire90})) : (~($signed((8'hb5)) ?
                      $signed(reg95) : $unsigned(reg97)))) ?
              (^~{(~|wire87), reg94[(1'h0):(1'h0)]}) : ($signed(((~^reg97) ?
                      reg99[(4'h9):(3'h5)] : $unsigned(wire88))) ?
                  ((((8'ha5) ? wire87 : wire87) ^~ {reg96}) ?
                      ({wire91} ?
                          reg94 : $unsigned((8'hb4))) : $unsigned($signed((8'ha1)))) : $signed((((8'hb4) ~^ reg94) ?
                      reg96 : (reg98 ? reg93 : reg98))))))
            begin
              reg101 <= (!$signed($unsigned($unsigned(((8'ha6) ?
                  reg93 : wire87)))));
              reg102 <= (!(-(wire87[(4'hc):(3'h5)] ?
                  (&wire86[(2'h3):(1'h0)]) : wire90[(4'h9):(3'h7)])));
            end
          else
            begin
              reg101 <= (wire88 ?
                  {$signed((wire87 != (~wire88)))} : (~$signed(({reg100} >>> $unsigned((8'hab))))));
              reg102 <= ($signed($unsigned(wire86[(3'h5):(3'h5)])) || $signed((~^((~wire90) ?
                  reg93[(2'h2):(1'h0)] : (+wire89)))));
              reg103 <= reg102[(3'h4):(1'h0)];
              reg104 <= $unsigned(($unsigned($unsigned(reg94[(3'h4):(1'h1)])) ?
                  {$unsigned($signed(wire90))} : wire85[(3'h5):(1'h0)]));
              reg105 <= $signed($unsigned($signed(reg100[(4'h9):(4'h8)])));
            end
          reg106 <= reg93;
          reg107 <= (!reg105[(3'h6):(1'h0)]);
          reg108 <= $unsigned(reg95[(3'h6):(2'h2)]);
        end
      reg109 <= (^~($unsigned(($unsigned(reg97) >>> $signed(reg98))) ?
          ({(wire85 ? reg100 : wire88)} | (wire89 ?
              reg107 : (wire90 | reg107))) : $unsigned(reg94)));
      if (wire85[(2'h3):(2'h3)])
        begin
          reg110 <= $signed($signed((~|$unsigned($unsigned(wire92)))));
          reg111 <= (8'ha1);
          if (reg107[(4'hc):(3'h6)])
            begin
              reg112 <= ($unsigned($unsigned($unsigned($unsigned(wire88)))) ?
                  $signed((($signed(wire85) >> (reg97 ?
                      reg102 : reg95)) >>> wire90[(5'h13):(4'hb)])) : $unsigned(((!{reg104}) ?
                      ((reg99 * reg105) ?
                          $signed(reg107) : (~^wire89)) : (~$unsigned(wire88)))));
              reg113 <= (reg94 < (~&(((reg100 ? reg102 : reg93) ?
                  (wire92 << reg99) : $unsigned(reg94)) ^~ (8'ha3))));
              reg114 <= ({$unsigned((~&(wire90 != (7'h44))))} ?
                  (~^(reg94[(2'h2):(1'h1)] * (reg106[(4'hf):(2'h2)] & ((7'h42) ?
                      (8'ha1) : reg104)))) : $signed((((reg97 ^ reg93) ?
                      (^reg102) : (+reg104)) << {$unsigned(reg100)})));
            end
          else
            begin
              reg112 <= (~^reg101);
            end
          reg115 <= $signed((wire86[(4'he):(4'hb)] ?
              $signed((reg112[(4'h9):(3'h6)] >= wire87)) : ({$unsigned(reg93),
                  (reg97 ? wire88 : reg108)} > $unsigned((~reg113)))));
          if (({$signed($unsigned((|reg114)))} ?
              (~^(|(^~wire92))) : $unsigned((^~(~|(wire88 ^ wire88))))))
            begin
              reg116 <= reg95[(2'h2):(2'h2)];
            end
          else
            begin
              reg116 <= ((reg107[(4'h9):(4'h8)] <<< $signed((-$unsigned(reg107)))) ?
                  $unsigned($unsigned(reg103)) : (($signed($signed(reg116)) ?
                      reg115[(3'h5):(1'h1)] : (|reg104)) != reg99));
            end
        end
      else
        begin
          reg110 <= (~|(8'hbd));
          reg111 <= (~($unsigned({$unsigned(reg97)}) >>> (reg115[(2'h2):(1'h0)] ?
              (~&(reg94 == reg97)) : $signed(reg99))));
          reg112 <= reg115[(3'h7):(3'h4)];
          reg113 <= reg96;
        end
    end
  assign wire117 = reg109;
  assign wire118 = ((-$signed($signed($unsigned(reg97)))) + (&$unsigned(reg95)));
  assign wire119 = $unsigned((!reg101[(4'hd):(3'h5)]));
  assign wire120 = $unsigned((&wire86));
  assign wire121 = ($signed($unsigned(((~&reg116) << (~|reg115)))) ?
                       reg116 : (~|$signed(reg115)));
  always
    @(posedge clk) begin
      reg122 <= reg100;
    end
  assign wire123 = reg114;
  assign wire124 = reg113;
  assign wire125 = {$signed(reg113[(1'h0):(1'h0)]),
                       (~|(reg115 ?
                           $signed($signed(reg98)) : (+wire119[(5'h10):(1'h1)])))};
  assign wire126 = {reg102[(2'h3):(2'h3)]};
  assign wire127 = reg122;
  assign wire128 = {(&{$unsigned($signed(wire127))})};
  assign wire129 = $unsigned({{{$unsigned((8'hb6))}}});
  assign wire130 = {(($signed((reg96 ? reg98 : reg110)) ?
                           ((8'hab) + (wire128 ?
                               reg110 : reg114)) : $unsigned((~&reg109))) ~^ (8'ha6)),
                       $signed((+$unsigned($signed(wire89))))};
  assign wire131 = wire121;
  assign wire132 = ((((reg114[(5'h11):(4'hb)] ?
                           $signed(wire127) : $signed(wire127)) ?
                       ((&wire90) - (wire125 ~^ wire130)) : (((8'hae) ?
                               wire121 : wire128) ?
                           reg94[(2'h2):(2'h2)] : (^~wire124))) >= wire88[(1'h0):(1'h0)]) - wire124[(3'h5):(3'h5)]);
  assign wire133 = $unsigned($unsigned(wire118[(4'h8):(1'h0)]));
endmodule

module module56
#(parameter param80 = (+(({(8'hbe)} ? ({(8'haa), (8'ha6)} < ((8'hb8) ? (8'hb0) : (8'ha0))) : (8'haa)) ? (-(((8'ha5) <= (8'haf)) ? (-(8'h9e)) : {(8'hab), (8'ha4)})) : (-(^~((8'hb7) ? (8'haa) : (8'ha0)))))), 
parameter param81 = ({((param80 + (param80 | param80)) ? (+(^(8'hbb))) : param80), (-param80)} ? {((param80 ? (param80 >= param80) : param80) ? ((param80 ? param80 : param80) ? {param80} : (param80 ? param80 : param80)) : param80), param80} : {(({param80, param80} == (param80 ? param80 : param80)) >>> ((~&param80) ? (param80 + param80) : param80))}))
(y, clk, wire61, wire60, wire59, wire58, wire57);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire61;
  input wire [(5'h11):(1'h0)] wire60;
  input wire [(4'hf):(1'h0)] wire59;
  input wire [(2'h2):(1'h0)] wire58;
  input wire [(5'h11):(1'h0)] wire57;
  wire signed [(5'h11):(1'h0)] wire79;
  wire [(3'h5):(1'h0)] wire78;
  wire [(3'h7):(1'h0)] wire77;
  wire [(3'h4):(1'h0)] wire76;
  wire signed [(4'hb):(1'h0)] wire75;
  wire signed [(2'h2):(1'h0)] wire74;
  wire [(4'hc):(1'h0)] wire73;
  wire [(4'he):(1'h0)] wire72;
  wire [(3'h6):(1'h0)] wire71;
  wire [(2'h3):(1'h0)] wire70;
  wire [(5'h13):(1'h0)] wire69;
  wire signed [(4'ha):(1'h0)] wire66;
  wire [(3'h5):(1'h0)] wire65;
  wire signed [(4'hc):(1'h0)] wire64;
  wire signed [(5'h10):(1'h0)] wire63;
  wire [(4'hb):(1'h0)] wire62;
  reg [(3'h7):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg67 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 reg68,
                 reg67,
                 (1'h0)};
  assign wire62 = (wire57[(3'h5):(1'h0)] * $signed($signed(wire60[(4'he):(4'hd)])));
  assign wire63 = (~^wire58);
  assign wire64 = wire63[(4'hc):(1'h0)];
  assign wire65 = $signed(wire57[(5'h10):(3'h4)]);
  assign wire66 = (({wire65[(1'h1):(1'h0)],
                              (wire63[(4'hf):(4'hd)] >> (wire63 ?
                                  wire57 : wire64))} ?
                          ((8'ha9) ?
                              (wire61 ?
                                  $signed(wire61) : ((8'hb6) >>> wire60)) : $unsigned((wire62 >>> (8'ha6)))) : (~|{wire64[(2'h2):(1'h0)],
                              (wire60 ? wire63 : wire65)})) ?
                      $signed($signed(wire61)) : (wire59[(3'h4):(2'h2)] ?
                          ($signed((wire65 ? wire57 : wire62)) ?
                              $signed((wire61 ?
                                  wire59 : wire61)) : wire59[(2'h3):(1'h0)]) : wire62));
  always
    @(posedge clk) begin
      reg67 <= (wire61 < (^~((~&$unsigned(wire60)) == wire58[(2'h2):(1'h1)])));
      reg68 <= wire64;
    end
  assign wire69 = $signed((wire62[(4'ha):(4'ha)] >= reg68[(3'h6):(3'h5)]));
  assign wire70 = $unsigned((!(-$signed((!wire60)))));
  assign wire71 = (wire66[(4'ha):(4'h9)] ?
                      $unsigned($signed(reg68[(3'h7):(1'h1)])) : wire60);
  assign wire72 = wire57[(4'h8):(2'h2)];
  assign wire73 = $unsigned($signed($unsigned($unsigned({wire69}))));
  assign wire74 = wire69[(3'h4):(2'h3)];
  assign wire75 = $unsigned(wire65[(3'h5):(2'h3)]);
  assign wire76 = {(~wire61),
                      (&(((reg68 ^ wire71) > reg68[(2'h2):(2'h2)]) ?
                          ({wire74, wire69} ?
                              wire70[(1'h1):(1'h1)] : wire75[(1'h1):(1'h0)]) : ((~&wire72) <<< (~|reg68))))};
  assign wire77 = $signed((wire65[(2'h3):(2'h2)] ?
                      $signed(($unsigned(wire58) ^ (wire65 && (8'hb0)))) : (wire64[(3'h7):(3'h7)] ?
                          wire76[(2'h2):(1'h0)] : $signed($unsigned(wire74)))));
  assign wire78 = $signed(wire73[(2'h2):(1'h1)]);
  assign wire79 = wire74;
endmodule
