module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h136):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire248;
  wire [(4'hb):(1'h0)] wire239;
  wire signed [(4'hb):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire241;
  wire signed [(5'h15):(1'h0)] wire242;
  wire [(5'h14):(1'h0)] wire250;
  wire [(5'h11):(1'h0)] wire251;
  wire [(4'hd):(1'h0)] wire252;
  wire signed [(3'h7):(1'h0)] wire253;
  wire [(4'hc):(1'h0)] wire254;
  wire signed [(2'h3):(1'h0)] wire255;
  wire [(5'h11):(1'h0)] wire264;
  reg signed [(3'h5):(1'h0)] reg263 = (1'h0);
  reg [(4'hc):(1'h0)] reg262 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg261 = (1'h0);
  reg [(3'h4):(1'h0)] reg260 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg259 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg258 = (1'h0);
  reg [(4'ha):(1'h0)] reg257 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg256 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg247 = (1'h0);
  reg [(4'hf):(1'h0)] reg246 = (1'h0);
  reg [(5'h14):(1'h0)] reg245 = (1'h0);
  reg [(4'h8):(1'h0)] reg244 = (1'h0);
  assign y = {wire248,
                 wire239,
                 wire5,
                 wire4,
                 wire241,
                 wire242,
                 wire250,
                 wire251,
                 wire252,
                 wire253,
                 wire254,
                 wire255,
                 wire264,
                 reg263,
                 reg262,
                 reg261,
                 reg260,
                 reg259,
                 reg258,
                 reg257,
                 reg256,
                 reg247,
                 reg246,
                 reg245,
                 reg244,
                 (1'h0)};
  assign wire4 = ($signed(({wire3} ^ $signed($unsigned(wire0)))) ?
                     wire3[(3'h7):(3'h6)] : wire3);
  assign wire5 = wire0;
  module6 #() modinst240 (.clk(clk), .wire10(wire4), .y(wire239), .wire7(wire2), .wire9(wire1), .wire8(wire5), .wire11(wire3));
  assign wire241 = $unsigned($unsigned((&wire0)));
  module6 #() modinst243 (wire242, clk, wire4, wire241, wire0, wire3, wire1);
  always
    @(posedge clk) begin
      reg244 <= ($signed((wire2[(4'hb):(4'ha)] <<< (-$signed(wire3)))) ?
          (wire242[(4'hf):(3'h7)] | $unsigned(($signed(wire4) ?
              $unsigned((8'ha1)) : {(8'ha2), wire3}))) : (~^(-(~wire5))));
      reg245 <= $unsigned((~^$unsigned((!(~^wire239)))));
      reg246 <= {$unsigned($unsigned($unsigned(wire0[(2'h2):(2'h2)]))),
          $signed(wire2[(2'h3):(2'h3)])};
      reg247 <= $signed($signed(((wire239 ?
              wire241[(1'h0):(1'h0)] : (wire1 ? wire5 : wire5)) ?
          $unsigned($signed(wire239)) : {wire242})));
    end
  module167 #() modinst249 (wire248, clk, reg245, wire239, reg246, wire241, wire242);
  assign wire250 = ($signed(wire3) + ($signed(reg244[(4'h8):(3'h4)]) >>> reg246[(4'hd):(3'h5)]));
  assign wire251 = $unsigned(((($signed((8'hb4)) | $signed(reg247)) ?
                           $signed((8'h9e)) : (wire250 >= (&wire4))) ?
                       $unsigned($signed(wire1[(4'ha):(4'h8)])) : wire248[(2'h2):(1'h0)]));
  assign wire252 = wire2;
  assign wire253 = (~^(~wire241));
  assign wire254 = $unsigned($unsigned(wire251));
  assign wire255 = (reg245 && wire1);
  always
    @(posedge clk) begin
      reg256 <= ($signed(($signed((~wire3)) ?
              $unsigned(wire248) : (((8'ha0) | wire3) >>> (wire242 ?
                  (8'h9e) : wire248)))) ?
          $signed(({((7'h41) >> reg244), (wire0 * wire250)} ?
              (wire1 ^ (wire248 == wire5)) : (~wire242[(5'h14):(5'h14)]))) : wire239);
      if (((~&(8'ha1)) != (-{{$unsigned(wire254)}})))
        begin
          if ((($unsigned(wire4[(5'h12):(4'hf)]) ?
              $unsigned(wire251[(4'hb):(1'h0)]) : wire254[(4'ha):(1'h0)]) + $signed(wire254)))
            begin
              reg257 <= {$signed((($signed(reg256) ?
                      $signed(wire1) : (~|wire251)) << $signed({(7'h43),
                      (8'h9c)}))),
                  $unsigned(reg247[(1'h1):(1'h1)])};
            end
          else
            begin
              reg257 <= (!$unsigned(reg246[(1'h0):(1'h0)]));
              reg258 <= (($signed(wire252[(4'h9):(2'h3)]) ?
                      $unsigned(reg256[(3'h6):(1'h1)]) : $signed(wire248)) ?
                  reg256 : wire251);
              reg259 <= ((~&(~|((wire254 ?
                  wire3 : reg256) != $unsigned(reg244)))) != (&reg256[(1'h0):(1'h0)]));
              reg260 <= $signed({($signed(wire253[(2'h3):(2'h3)]) ?
                      (^~{wire250, reg244}) : wire255)});
              reg261 <= (|(8'hbe));
            end
          reg262 <= ((wire248[(3'h5):(2'h3)] ?
                  ({$unsigned(wire3), $signed(wire248)} ?
                      ((~wire1) <<< wire241) : reg261) : ($signed($signed(wire254)) ?
                      reg257[(3'h5):(2'h2)] : ((wire252 < reg244) >> $unsigned(reg245)))) ?
              $signed(wire242) : ((~^$unsigned(wire252[(4'h9):(3'h7)])) ?
                  wire250[(2'h3):(2'h2)] : $unsigned({(!reg260)})));
        end
      else
        begin
          if (((+(8'hb6)) ? (8'ha1) : wire251[(5'h10):(5'h10)]))
            begin
              reg257 <= $unsigned(wire3);
            end
          else
            begin
              reg257 <= $signed($signed((wire3[(1'h1):(1'h1)] ?
                  wire251[(1'h0):(1'h0)] : reg260[(2'h3):(1'h0)])));
              reg258 <= $unsigned((($signed({reg259,
                      wire2}) & {(reg244 != reg261), (^~reg257)}) ?
                  wire239 : reg244[(4'h8):(1'h0)]));
              reg259 <= $unsigned(reg260[(3'h4):(1'h0)]);
            end
          reg260 <= $unsigned($unsigned({wire253, (8'h9d)}));
          reg261 <= reg244[(3'h7):(2'h3)];
          reg262 <= (^(+(^(&(wire248 ? wire5 : reg258)))));
          reg263 <= wire255[(1'h0):(1'h0)];
        end
    end
  module15 #() modinst265 (.wire19(reg258), .wire17(wire241), .wire20(wire254), .y(wire264), .wire18(wire5), .wire16(reg245), .clk(clk));
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h1d2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire7;
  input wire [(4'hb):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire9;
  input wire signed [(4'hc):(1'h0)] wire10;
  input wire signed [(5'h10):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire238;
  wire signed [(5'h12):(1'h0)] wire237;
  wire [(5'h11):(1'h0)] wire162;
  wire signed [(3'h5):(1'h0)] wire104;
  wire signed [(3'h7):(1'h0)] wire102;
  wire signed [(4'h8):(1'h0)] wire35;
  wire signed [(4'he):(1'h0)] wire34;
  wire signed [(5'h14):(1'h0)] wire33;
  wire [(3'h6):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire13;
  wire signed [(4'he):(1'h0)] wire14;
  wire [(3'h4):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire164;
  wire [(3'h4):(1'h0)] wire165;
  wire signed [(5'h13):(1'h0)] wire166;
  wire [(4'hf):(1'h0)] wire198;
  wire [(4'he):(1'h0)] wire200;
  wire signed [(5'h13):(1'h0)] wire201;
  wire signed [(5'h15):(1'h0)] wire202;
  wire [(4'hb):(1'h0)] wire235;
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg203 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg204 = (1'h0);
  reg [(5'h13):(1'h0)] reg205 = (1'h0);
  reg [(3'h7):(1'h0)] reg206 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg207 = (1'h0);
  reg [(4'he):(1'h0)] reg208 = (1'h0);
  reg [(5'h10):(1'h0)] reg209 = (1'h0);
  reg [(5'h15):(1'h0)] reg210 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg211 = (1'h0);
  reg [(5'h13):(1'h0)] reg212 = (1'h0);
  reg signed [(4'he):(1'h0)] reg213 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg214 = (1'h0);
  assign y = {wire238,
                 wire237,
                 wire162,
                 wire104,
                 wire102,
                 wire35,
                 wire34,
                 wire33,
                 wire12,
                 wire13,
                 wire14,
                 wire28,
                 wire164,
                 wire165,
                 wire166,
                 wire198,
                 wire200,
                 wire201,
                 wire202,
                 wire235,
                 reg32,
                 reg31,
                 reg30,
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
                 (1'h0)};
  assign wire12 = wire8;
  assign wire13 = {wire11};
  assign wire14 = (+wire8[(4'hb):(4'ha)]);
  module15 #() modinst29 (wire28, clk, wire10, wire14, wire9, wire7, wire13);
  always
    @(posedge clk) begin
      reg30 <= ($signed(({{wire11, wire14},
              $signed(wire8)} ^ {(wire28 ^~ wire11), $unsigned(wire12)})) ?
          (+wire12[(3'h6):(2'h3)]) : (wire8 >> (~&(8'hba))));
      reg31 <= $signed((~|(~|(wire28 ? (wire11 > wire11) : (^~wire9)))));
      reg32 <= wire28[(2'h2):(1'h0)];
    end
  assign wire33 = wire11[(1'h0):(1'h0)];
  assign wire34 = $unsigned($unsigned((^((reg30 ?
                      wire7 : wire14) && (reg32 ^ wire9)))));
  assign wire35 = ({(-$signed((wire14 << reg31))),
                          {{$unsigned(wire33), wire7[(5'h11):(4'hf)]}}} ?
                      $signed((((wire11 ? wire9 : (7'h41)) ?
                              (reg32 & (8'hb2)) : (|wire13)) ?
                          $unsigned($unsigned((8'had))) : wire10[(2'h2):(1'h0)])) : (|(&(~(^~reg32)))));
  module36 #() modinst103 (wire102, clk, wire11, wire8, wire13, wire7, reg31);
  assign wire104 = (wire8 > ((wire9 <<< (~|wire35[(3'h7):(3'h5)])) ?
                       ($signed(wire10[(4'ha):(3'h5)]) != wire35) : $signed((wire13[(4'hc):(3'h4)] >>> wire33[(5'h14):(5'h14)]))));
  module105 #() modinst163 (.wire107(wire34), .wire109(wire8), .y(wire162), .clk(clk), .wire106(wire13), .wire108(reg31));
  assign wire164 = ((^~(+((&wire104) ? $signed(wire35) : {wire33, wire8}))) ?
                       wire7 : ((-wire8) > wire8));
  assign wire165 = wire14[(2'h3):(1'h0)];
  assign wire166 = (((^~$signed(wire165[(2'h3):(1'h0)])) | wire9) && (($unsigned((wire9 >= wire162)) ?
                       wire8[(2'h3):(1'h0)] : $signed($unsigned(wire13))) > {(~|$signed(wire8))}));
  module167 #() modinst199 (wire198, clk, wire33, wire102, reg32, wire35, wire10);
  assign wire200 = ((wire165 ? wire165[(2'h3):(1'h1)] : $unsigned(wire164)) ?
                       ((^~wire164) == {$signed($unsigned(wire7))}) : ($signed((~|(wire162 ?
                           wire28 : reg31))) + reg31[(4'ha):(2'h2)]));
  assign wire201 = (^wire13[(5'h13):(4'hc)]);
  assign wire202 = ((((~|$signed(wire12)) ?
                           {(reg32 ? wire104 : reg30),
                               (wire13 <= wire164)} : $unsigned(reg32)) & (~&(-(wire198 * wire10)))) ?
                       reg31[(4'h8):(2'h2)] : $signed(wire14));
  always
    @(posedge clk) begin
      reg203 <= (~wire34);
      if (($unsigned(wire10) * (((wire201[(4'he):(4'h9)] ?
                  (wire198 * wire10) : wire201) ?
              reg203 : (8'hb6)) ?
          ($signed($unsigned(reg32)) ?
              ($signed(reg32) ?
                  {(8'hbf)} : (wire102 << wire164)) : $signed((+wire8))) : (wire165 != $unsigned(wire104[(1'h0):(1'h0)])))))
        begin
          if ($signed($unsigned(wire7)))
            begin
              reg204 <= (^~((wire8 ?
                      wire34[(2'h3):(2'h3)] : (wire202 - $unsigned((8'ha6)))) ?
                  wire165[(2'h2):(2'h2)] : ({$signed(wire9)} ?
                      $signed($unsigned(wire9)) : ((reg32 ? wire35 : wire165) ?
                          wire7 : reg32[(4'hc):(2'h2)]))));
              reg205 <= wire28;
              reg206 <= $signed(reg32);
              reg207 <= wire164[(2'h3):(1'h1)];
            end
          else
            begin
              reg204 <= wire166;
              reg205 <= $unsigned($unsigned((8'h9e)));
              reg206 <= $signed(wire13[(4'ha):(2'h3)]);
            end
        end
      else
        begin
          reg204 <= (8'hb4);
        end
      if (wire166)
        begin
          reg208 <= ($unsigned(($signed((~wire165)) & wire9[(3'h4):(1'h0)])) ?
              $signed((+{$signed(wire33)})) : wire8[(2'h3):(2'h3)]);
        end
      else
        begin
          reg208 <= $signed($unsigned((((-wire200) == $signed(wire14)) ?
              wire11 : wire14[(4'ha):(3'h4)])));
          reg209 <= {wire9[(1'h1):(1'h1)]};
          reg210 <= $signed($unsigned((wire13 ?
              $signed($signed(wire9)) : wire201[(2'h2):(2'h2)])));
          reg211 <= (^wire166[(3'h5):(2'h2)]);
          reg212 <= $unsigned($unsigned(((~&(&(8'hbd))) <<< reg204)));
        end
      reg213 <= wire166;
      reg214 <= ($unsigned({reg30[(1'h0):(1'h0)]}) < $signed({{(reg209 ?
                  wire200 : wire162),
              (reg208 ? (8'hb8) : reg211)},
          wire34}));
    end
  module215 #() modinst236 (wire235, clk, reg204, wire11, wire102, wire162);
  assign wire237 = wire104[(2'h2):(1'h1)];
  assign wire238 = ($signed((+wire28[(2'h2):(1'h0)])) ?
                       reg210[(2'h2):(2'h2)] : ($unsigned($unsigned(wire12[(3'h4):(3'h4)])) ?
                           ($unsigned((8'hac)) >>> reg209) : ($signed({wire164,
                               wire11}) <= (+(wire198 ? wire14 : wire33)))));
endmodule

module module215
#(parameter param234 = ({(-((~^(8'ha6)) & ((7'h40) <= (8'ha4))))} ? (~&({((8'h9e) ? (8'hac) : (8'h9e))} ? (!((8'haa) ? (8'ha4) : (7'h40))) : (^{(7'h43)}))) : (((((8'ha7) >> (8'haf)) ? (^~(8'hb0)) : ((7'h41) || (8'ha6))) & (((8'hb7) && (8'ha5)) ? (-(8'hb7)) : ((8'hb3) ? (8'hb8) : (8'ha8)))) ? ((((8'hb6) ? (8'hb5) : (8'hbf)) | ((8'h9e) >= (8'ha9))) >> ((~^(8'h9f)) ^~ (8'ha9))) : (~^(-((8'ha6) ? (8'ha7) : (8'hb0)))))))
(y, clk, wire219, wire218, wire217, wire216);
  output wire [(32'h95):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire219;
  input wire [(3'h4):(1'h0)] wire218;
  input wire [(3'h5):(1'h0)] wire217;
  input wire signed [(5'h11):(1'h0)] wire216;
  wire signed [(3'h5):(1'h0)] wire233;
  wire signed [(5'h15):(1'h0)] wire232;
  wire signed [(4'h9):(1'h0)] wire231;
  wire signed [(4'h8):(1'h0)] wire230;
  wire [(4'ha):(1'h0)] wire229;
  wire signed [(4'h9):(1'h0)] wire228;
  wire [(5'h15):(1'h0)] wire227;
  wire [(4'hd):(1'h0)] wire226;
  wire [(5'h14):(1'h0)] wire223;
  wire [(3'h6):(1'h0)] wire222;
  wire [(4'h8):(1'h0)] wire221;
  wire [(2'h2):(1'h0)] wire220;
  reg [(2'h3):(1'h0)] reg225 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg224 = (1'h0);
  assign y = {wire233,
                 wire232,
                 wire231,
                 wire230,
                 wire229,
                 wire228,
                 wire227,
                 wire226,
                 wire223,
                 wire222,
                 wire221,
                 wire220,
                 reg225,
                 reg224,
                 (1'h0)};
  assign wire220 = {($unsigned(wire216[(4'ha):(2'h2)]) ?
                           wire216 : (($unsigned(wire218) >>> wire219) ^ (wire216 * (~^wire216))))};
  assign wire221 = {$unsigned(wire217), (8'hae)};
  assign wire222 = wire216[(4'h9):(1'h0)];
  assign wire223 = ({wire219[(1'h0):(1'h0)], ({(~wire222)} | wire220)} ?
                       wire217 : wire217);
  always
    @(posedge clk) begin
      reg224 <= $unsigned($signed($signed(wire220)));
      reg225 <= wire220[(2'h2):(1'h1)];
    end
  assign wire226 = wire222;
  assign wire227 = wire216[(4'hb):(4'hb)];
  assign wire228 = $signed(wire219);
  assign wire229 = {wire219[(2'h3):(2'h3)],
                       $signed(((+((7'h41) ? reg225 : wire221)) ?
                           {wire227[(3'h5):(1'h0)]} : ($signed(reg225) ?
                               (wire223 ?
                                   wire219 : reg225) : ((7'h43) <= wire218))))};
  assign wire230 = wire226;
  assign wire231 = ((^~$signed((&(wire219 * wire227)))) ?
                       $signed((($unsigned(wire222) || wire218[(1'h1):(1'h1)]) ?
                           (wire217[(2'h3):(2'h3)] >>> reg225[(1'h0):(1'h0)]) : ((reg225 == wire220) > $signed(wire218)))) : $unsigned($signed(((~&wire222) ~^ $unsigned(reg225)))));
  assign wire232 = ((8'hb8) ^ wire223);
  assign wire233 = (^~{(|{(7'h40), (7'h41)})});
endmodule

module module167  (y, clk, wire172, wire171, wire170, wire169, wire168);
  output wire [(32'h10e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire172;
  input wire [(3'h7):(1'h0)] wire171;
  input wire signed [(3'h4):(1'h0)] wire170;
  input wire [(4'h8):(1'h0)] wire169;
  input wire [(3'h5):(1'h0)] wire168;
  wire [(3'h7):(1'h0)] wire197;
  wire signed [(2'h2):(1'h0)] wire196;
  wire signed [(4'hf):(1'h0)] wire194;
  wire signed [(3'h7):(1'h0)] wire193;
  wire [(3'h4):(1'h0)] wire181;
  wire signed [(4'ha):(1'h0)] wire180;
  wire [(4'hc):(1'h0)] wire179;
  wire signed [(4'hd):(1'h0)] wire178;
  wire signed [(4'h8):(1'h0)] wire177;
  wire [(4'hf):(1'h0)] wire176;
  wire [(4'hd):(1'h0)] wire175;
  wire signed [(2'h3):(1'h0)] wire174;
  wire [(5'h14):(1'h0)] wire173;
  reg signed [(4'hf):(1'h0)] reg195 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg191 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg190 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg189 = (1'h0);
  reg [(3'h5):(1'h0)] reg188 = (1'h0);
  reg [(5'h12):(1'h0)] reg187 = (1'h0);
  reg [(4'hb):(1'h0)] reg186 = (1'h0);
  reg [(5'h15):(1'h0)] reg185 = (1'h0);
  reg [(3'h4):(1'h0)] reg184 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg183 = (1'h0);
  reg [(4'he):(1'h0)] reg182 = (1'h0);
  assign y = {wire197,
                 wire196,
                 wire194,
                 wire193,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 reg195,
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
                 (1'h0)};
  assign wire173 = $unsigned({{(~^(wire170 - wire172)),
                           $unsigned($unsigned(wire172))},
                       (({wire172} && (^wire168)) & (|(wire171 ?
                           wire172 : wire171)))});
  assign wire174 = wire173[(4'he):(3'h6)];
  assign wire175 = wire171;
  assign wire176 = wire172;
  assign wire177 = wire176[(1'h0):(1'h0)];
  assign wire178 = $signed($signed((wire171 - ($unsigned(wire168) == $signed(wire176)))));
  assign wire179 = (8'h9e);
  assign wire180 = (wire175[(2'h3):(1'h1)] && wire170[(1'h1):(1'h1)]);
  assign wire181 = (wire173 ^ wire173[(4'h9):(4'h8)]);
  always
    @(posedge clk) begin
      reg182 <= wire175[(4'ha):(2'h3)];
      if ((~(wire169 ?
          $signed((wire174 ^ wire176)) : (~^$unsigned({wire177, wire170})))))
        begin
          if ($signed((((wire177 ? $unsigned(wire174) : (wire173 > wire178)) ?
                  wire179[(1'h1):(1'h1)] : (~&(7'h44))) ?
              (^~(!(|wire170))) : wire169)))
            begin
              reg183 <= (~&$signed((wire172[(1'h1):(1'h0)] ?
                  $signed((^wire172)) : (~|(wire180 && wire170)))));
              reg184 <= {((^~$unsigned((wire179 ?
                      reg182 : wire169))) ^~ wire172[(4'hd):(3'h5)]),
                  wire176};
              reg185 <= $signed((+wire174));
            end
          else
            begin
              reg183 <= wire172[(3'h6):(2'h3)];
            end
          if (wire180[(1'h1):(1'h0)])
            begin
              reg186 <= wire175[(1'h1):(1'h0)];
              reg187 <= wire173;
              reg188 <= $signed($signed(((^~(-wire175)) && $unsigned(wire181))));
            end
          else
            begin
              reg186 <= reg187[(4'he):(4'he)];
              reg187 <= (($unsigned(wire178) ?
                      wire169[(3'h6):(3'h4)] : $signed((~|{wire169}))) ?
                  $unsigned(wire174) : wire169);
            end
        end
      else
        begin
          reg183 <= ({$signed((-$unsigned(wire175)))} != {wire177,
              $signed(wire180)});
          if (wire175[(4'hb):(4'h9)])
            begin
              reg184 <= reg182[(1'h1):(1'h0)];
              reg185 <= (wire181 ?
                  $signed((!(reg183[(1'h0):(1'h0)] ?
                      (wire177 ?
                          wire168 : reg185) : $unsigned(wire181)))) : $signed($unsigned((!wire169[(3'h5):(3'h4)]))));
              reg186 <= ((wire177 >= (-reg187)) ?
                  (((~&((8'hb7) ? (8'hbd) : wire173)) ^ reg186[(3'h5):(3'h5)]) ?
                      (~&$signed((8'h9c))) : (~&(wire180 ?
                          wire178 : $unsigned(wire168)))) : wire168[(1'h0):(1'h0)]);
            end
          else
            begin
              reg184 <= wire179;
              reg185 <= wire173;
            end
          reg187 <= $signed({wire179, (^~$unsigned(wire169))});
        end
      reg189 <= ($signed(($signed((8'haa)) ? wire176 : reg186)) != wire179);
    end
  always
    @(posedge clk) begin
      reg190 <= wire178;
      reg191 <= ((($unsigned((^reg187)) < reg188[(3'h4):(3'h4)]) ?
              $signed($signed((+(8'h9c)))) : (8'hb4)) ?
          (~|$signed(((8'ha7) ?
              (reg185 | wire170) : $unsigned(wire170)))) : {(8'ha5),
              {($unsigned(wire176) ^ {wire173})}});
      reg192 <= (reg189 ?
          $unsigned(($unsigned((wire175 == wire171)) < {$unsigned(reg186),
              reg191[(3'h4):(2'h3)]})) : $signed((8'hbb)));
    end
  assign wire193 = ($unsigned(wire169) > (~&$signed((wire169 <= (~|wire170)))));
  assign wire194 = {($unsigned({reg185, reg191}) & reg183)};
  always
    @(posedge clk) begin
      reg195 <= (~(~&{{$unsigned(reg186), $unsigned(reg191)}, reg192}));
    end
  assign wire196 = ((wire179 <<< (~&{{(8'ha8)},
                       (reg184 ? reg183 : (8'hac))})) > ((((reg184 ?
                               reg185 : wire177) ^ $unsigned(wire179)) ?
                           wire173[(1'h0):(1'h0)] : (8'h9e)) ?
                       reg184[(2'h3):(1'h0)] : (8'ha7)));
  assign wire197 = (~(!$unsigned($unsigned(((8'hb3) ~^ reg187)))));
endmodule

module module105
#(parameter param161 = (((^~(((8'h9f) && (8'h9c)) ? (!(8'hb1)) : {(7'h43)})) ? (({(7'h41), (8'hb1)} ? ((8'ha9) != (8'hb3)) : (!(8'ha8))) < ({(8'haf), (8'hbf)} ? {(8'hb8), (8'hbe)} : ((8'ha8) ? (8'h9d) : (8'ha0)))) : ((((8'ha4) >= (8'ha8)) ? {(8'hb3)} : ((8'ha6) ? (7'h43) : (7'h44))) ? (((8'h9e) & (8'hb6)) ? ((8'hb1) & (8'hb9)) : ((8'hb6) << (8'h9e))) : (((8'hbc) ? (8'h9d) : (8'hab)) ? ((8'h9f) ? (8'ha1) : (8'hac)) : ((8'ha3) * (7'h44))))) ? (+{(8'hba)}) : (-(^{((8'ha5) ? (8'h9e) : (8'ha7))}))))
(y, clk, wire109, wire108, wire107, wire106);
  output wire [(32'h258):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire109;
  input wire [(3'h5):(1'h0)] wire108;
  input wire signed [(3'h4):(1'h0)] wire107;
  input wire signed [(4'h9):(1'h0)] wire106;
  wire [(4'hc):(1'h0)] wire160;
  wire [(3'h6):(1'h0)] wire159;
  wire [(3'h5):(1'h0)] wire158;
  wire signed [(2'h2):(1'h0)] wire157;
  wire [(4'he):(1'h0)] wire156;
  wire signed [(4'hc):(1'h0)] wire155;
  wire signed [(5'h13):(1'h0)] wire154;
  wire signed [(5'h12):(1'h0)] wire153;
  wire signed [(5'h10):(1'h0)] wire145;
  wire [(4'hf):(1'h0)] wire144;
  wire signed [(5'h14):(1'h0)] wire143;
  wire signed [(3'h5):(1'h0)] wire142;
  wire signed [(5'h14):(1'h0)] wire141;
  wire signed [(5'h13):(1'h0)] wire136;
  wire signed [(3'h4):(1'h0)] wire135;
  wire [(5'h14):(1'h0)] wire134;
  wire [(3'h7):(1'h0)] wire110;
  reg [(5'h10):(1'h0)] reg152 = (1'h0);
  reg [(5'h12):(1'h0)] reg151 = (1'h0);
  reg [(4'hb):(1'h0)] reg150 = (1'h0);
  reg [(4'h9):(1'h0)] reg149 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg148 = (1'h0);
  reg [(2'h2):(1'h0)] reg147 = (1'h0);
  reg [(4'hf):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg140 = (1'h0);
  reg [(3'h5):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg138 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg137 = (1'h0);
  reg [(5'h14):(1'h0)] reg133 = (1'h0);
  reg [(4'he):(1'h0)] reg132 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg131 = (1'h0);
  reg signed [(4'he):(1'h0)] reg130 = (1'h0);
  reg [(4'he):(1'h0)] reg129 = (1'h0);
  reg [(5'h10):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg127 = (1'h0);
  reg [(4'ha):(1'h0)] reg126 = (1'h0);
  reg [(3'h6):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg124 = (1'h0);
  reg [(4'he):(1'h0)] reg123 = (1'h0);
  reg [(4'hc):(1'h0)] reg122 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg121 = (1'h0);
  reg [(3'h4):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg119 = (1'h0);
  reg [(4'he):(1'h0)] reg118 = (1'h0);
  reg [(3'h5):(1'h0)] reg117 = (1'h0);
  reg [(5'h14):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg113 = (1'h0);
  reg [(3'h6):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg111 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire136,
                 wire135,
                 wire134,
                 wire110,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
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
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 (1'h0)};
  assign wire110 = (wire106[(3'h5):(1'h1)] - wire107);
  always
    @(posedge clk) begin
      reg111 <= ({$unsigned({$signed(wire108)})} ?
          (~$unsigned({wire109})) : wire110);
      reg112 <= (wire110[(2'h2):(1'h1)] >= wire108[(3'h5):(1'h1)]);
      reg113 <= $signed({(~&$unsigned($unsigned(wire109)))});
      if (reg111[(5'h10):(2'h2)])
        begin
          if ((($unsigned($unsigned($signed(wire108))) ?
              $unsigned(reg111) : reg113[(3'h4):(2'h3)]) < ((~^wire109[(2'h2):(1'h1)]) ^~ ($signed((reg112 >= reg111)) ?
              reg112 : (reg111[(5'h10):(1'h0)] ?
                  (|wire110) : (wire109 >>> wire109))))))
            begin
              reg114 <= $unsigned(wire108);
              reg115 <= (($signed((^{reg114,
                  wire109})) & $signed({(7'h41)})) << reg113);
              reg116 <= ({{$unsigned(((8'hb0) ? wire107 : reg115)),
                          reg111[(4'hb):(3'h7)]}} ?
                  $unsigned(($unsigned(((8'hb8) << wire106)) ?
                      wire109 : $unsigned((~^wire108)))) : $unsigned({reg112[(1'h0):(1'h0)],
                      $signed(wire109[(1'h0):(1'h0)])}));
            end
          else
            begin
              reg114 <= reg114[(2'h3):(1'h0)];
              reg115 <= $unsigned($unsigned({$signed(reg116), reg112}));
              reg116 <= $unsigned((^~(^$unsigned(wire107[(2'h3):(1'h0)]))));
              reg117 <= {(-$signed(((-reg113) * $unsigned(reg114))))};
              reg118 <= ($signed(reg112[(2'h2):(2'h2)]) - ((|(reg112 == (+(8'ha6)))) - reg117[(1'h1):(1'h0)]));
            end
          if (reg118)
            begin
              reg119 <= reg111;
              reg120 <= $signed($unsigned($signed((reg111 ?
                  (~wire109) : wire108))));
            end
          else
            begin
              reg119 <= reg115;
              reg120 <= reg111;
            end
          if (reg118)
            begin
              reg121 <= $signed($unsigned(wire107));
              reg122 <= wire109;
              reg123 <= $unsigned((^$signed({{reg116}, (wire110 - reg111)})));
            end
          else
            begin
              reg121 <= (~^reg119);
              reg122 <= $unsigned((^(~|$unsigned(reg115[(3'h7):(3'h7)]))));
              reg123 <= (((({wire110,
                  reg119} <<< (|wire110)) > (8'hba)) & reg113) <= reg121);
              reg124 <= (8'haa);
            end
        end
      else
        begin
          if (reg121[(4'h8):(3'h5)])
            begin
              reg114 <= (^$unsigned((8'had)));
            end
          else
            begin
              reg114 <= (!$signed({reg120}));
              reg115 <= reg114[(3'h4):(1'h0)];
              reg116 <= wire108;
              reg117 <= $unsigned({$signed((~|(reg115 <<< reg112))),
                  (&wire109[(3'h5):(1'h1)])});
            end
        end
      if ($unsigned(({$unsigned((wire110 ^~ reg119)), reg124} >> (8'hbc))))
        begin
          if ((!((((reg111 ? reg124 : reg116) ?
                  $unsigned(wire110) : ((8'haa) ?
                      reg116 : wire106)) && ($unsigned(reg119) ?
                  $unsigned(reg117) : {reg113})) ?
              $signed($signed((!reg114))) : (8'ha8))))
            begin
              reg125 <= (~((reg111 ?
                  $signed(reg117[(1'h1):(1'h1)]) : reg114[(3'h4):(1'h1)]) > wire110[(3'h7):(2'h3)]));
            end
          else
            begin
              reg125 <= $unsigned((((~^(wire109 * (7'h41))) >>> $unsigned((reg115 ?
                      (8'hb8) : wire106))) ?
                  ($unsigned({reg114, (8'ha9)}) || ((reg120 <= reg115) ?
                      (wire107 > reg112) : (reg118 | reg113))) : $unsigned(wire106)));
              reg126 <= $signed($signed({($signed(wire107) && {reg113, reg124}),
                  {$unsigned(wire107)}}));
              reg127 <= wire106;
              reg128 <= reg112[(2'h3):(2'h2)];
            end
          if ((~^(+(7'h44))))
            begin
              reg129 <= {$unsigned((~reg114))};
              reg130 <= (reg122 ?
                  ({wire107[(2'h2):(1'h0)]} + $unsigned((8'h9c))) : (({$signed(reg123),
                      $signed(wire110)} ^ (^(reg118 ?
                      reg111 : reg118))) >>> (wire107[(2'h3):(1'h0)] < ($signed(reg125) ?
                      reg117 : reg120))));
              reg131 <= reg117;
              reg132 <= ($signed((!(~|reg128))) || reg124);
            end
          else
            begin
              reg129 <= ((!$unsigned(($unsigned(reg116) ?
                  {(8'ha9),
                      reg120} : reg127[(5'h11):(2'h2)]))) * reg123[(3'h5):(3'h4)]);
              reg130 <= reg129;
              reg131 <= reg121;
              reg132 <= reg112;
              reg133 <= (7'h44);
            end
        end
      else
        begin
          reg125 <= (|{wire110,
              ((wire109[(2'h3):(1'h1)] | $signed(reg133)) != $signed(reg126))});
          reg126 <= ($unsigned(((!{reg130, reg128}) ?
                  reg131[(1'h0):(1'h0)] : ((reg121 >= reg126) << reg111[(1'h1):(1'h0)]))) ?
              (((-((8'ha0) <<< reg121)) ?
                      {$signed(reg112)} : (~|(reg119 < reg118))) ?
                  reg115 : wire107[(2'h3):(1'h1)]) : $unsigned(reg115));
          reg127 <= reg122[(4'h8):(2'h3)];
          reg128 <= $signed((~&($signed(reg127) > wire108)));
          if (reg126)
            begin
              reg129 <= reg122;
              reg130 <= {((wire108[(3'h5):(3'h5)] ?
                          $signed($signed(reg120)) : ((+reg133) ?
                              (+reg115) : (reg130 ? wire108 : reg129))) ?
                      (reg130 <<< reg114) : $signed({(~&reg124)})),
                  reg130};
            end
          else
            begin
              reg129 <= wire109;
              reg130 <= reg121[(3'h5):(2'h2)];
            end
        end
    end
  assign wire134 = ($unsigned(reg131) && $signed(($unsigned($signed(wire109)) ?
                       (&((8'h9f) <<< reg116)) : (~^(reg111 ?
                           reg127 : reg121)))));
  assign wire135 = (reg112[(2'h2):(1'h1)] ?
                       reg127[(1'h0):(1'h0)] : $unsigned(wire107[(2'h3):(2'h3)]));
  assign wire136 = ((($unsigned(((7'h44) ? (8'hb4) : reg129)) ?
                       (~&$unsigned((8'ha3))) : (reg112[(2'h3):(2'h2)] ?
                           (reg133 ? wire106 : reg118) : (reg117 ?
                               reg117 : reg132))) << (~^($unsigned(reg115) ?
                       (reg124 ?
                           reg111 : reg121) : reg130))) ~^ {(^($signed(reg124) >>> (~&reg126)))});
  always
    @(posedge clk) begin
      reg137 <= {reg124[(4'hf):(4'ha)]};
      reg138 <= $unsigned((((8'hb1) || $unsigned((^~reg114))) - (reg129[(4'h8):(1'h1)] << $unsigned((reg116 ?
          reg124 : reg116)))));
      reg139 <= ({wire106, (^$signed($signed(reg123)))} ?
          reg128[(4'h9):(3'h7)] : reg133[(4'he):(4'hd)]);
      reg140 <= reg127;
    end
  assign wire141 = (|$signed(((!$unsigned(wire107)) ?
                       $unsigned((~^reg113)) : $signed(((8'hb6) >= wire110)))));
  assign wire142 = $unsigned((!wire136[(1'h1):(1'h1)]));
  assign wire143 = ((reg127 ? wire109 : wire134[(3'h7):(1'h1)]) ?
                       $unsigned($unsigned(((wire142 ? reg116 : reg139) ?
                           $unsigned(reg130) : $signed(reg115)))) : $unsigned((~reg138[(1'h1):(1'h1)])));
  assign wire144 = reg116;
  assign wire145 = $unsigned({$unsigned(reg130[(4'hd):(4'hb)])});
  always
    @(posedge clk) begin
      reg146 <= ($unsigned($signed(((8'hb2) ?
              ((7'h43) ? reg124 : reg114) : (^(8'haf))))) ?
          $signed($unsigned(((!reg119) ?
              (-reg119) : ((8'ha8) && reg123)))) : reg140);
      reg147 <= $unsigned($signed((8'hae)));
      if ((reg137[(1'h1):(1'h0)] >= {(8'hbd)}))
        begin
          reg148 <= reg121;
        end
      else
        begin
          reg148 <= {{$signed(wire110)}};
          reg149 <= {reg122, (|wire106)};
          reg150 <= (~^(^(~|reg133)));
          reg151 <= wire106;
          reg152 <= ((-$unsigned(((reg127 ? wire142 : reg138) ?
              (reg128 ? (8'hbd) : wire110) : reg133))) ^~ (~|(reg150 ?
              reg150[(1'h1):(1'h0)] : $unsigned((~^reg129)))));
        end
    end
  assign wire153 = (~^({$signed({reg138}),
                       reg125[(1'h0):(1'h0)]} << $signed($signed($signed(reg118)))));
  assign wire154 = wire141[(5'h13):(2'h3)];
  assign wire155 = {(^~$signed(wire110)), reg123[(4'hd):(1'h1)]};
  assign wire156 = $unsigned((reg128 | $unsigned(reg132[(3'h6):(2'h3)])));
  assign wire157 = wire110[(1'h0):(1'h0)];
  assign wire158 = $unsigned($signed(((|(reg146 * wire154)) ?
                       ((|wire157) ?
                           wire144[(4'hd):(4'hd)] : (reg114 ?
                               reg130 : reg126)) : ({wire109} ?
                           reg111 : (|(8'hba))))));
  assign wire159 = $signed($signed($unsigned(($unsigned(wire143) <= reg131[(1'h0):(1'h0)]))));
  assign wire160 = reg148;
endmodule

module module36  (y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'h2c2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire41;
  input wire signed [(3'h5):(1'h0)] wire40;
  input wire [(5'h10):(1'h0)] wire39;
  input wire [(3'h5):(1'h0)] wire38;
  input wire signed [(3'h5):(1'h0)] wire37;
  wire signed [(2'h3):(1'h0)] wire60;
  wire signed [(3'h7):(1'h0)] wire59;
  wire signed [(4'ha):(1'h0)] wire58;
  wire [(4'hf):(1'h0)] wire57;
  wire [(4'ha):(1'h0)] wire56;
  wire [(5'h12):(1'h0)] wire55;
  wire [(4'hb):(1'h0)] wire49;
  wire signed [(4'h9):(1'h0)] wire43;
  wire [(4'hf):(1'h0)] wire42;
  reg [(5'h13):(1'h0)] reg101 = (1'h0);
  reg [(4'hc):(1'h0)] reg100 = (1'h0);
  reg [(3'h4):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg98 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg97 = (1'h0);
  reg [(3'h6):(1'h0)] reg96 = (1'h0);
  reg [(5'h11):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg94 = (1'h0);
  reg [(5'h12):(1'h0)] reg93 = (1'h0);
  reg [(3'h7):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg91 = (1'h0);
  reg [(4'hd):(1'h0)] reg90 = (1'h0);
  reg [(2'h2):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg88 = (1'h0);
  reg [(3'h6):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg86 = (1'h0);
  reg [(3'h4):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg83 = (1'h0);
  reg [(5'h15):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg81 = (1'h0);
  reg [(5'h14):(1'h0)] reg80 = (1'h0);
  reg [(4'h9):(1'h0)] reg79 = (1'h0);
  reg [(5'h10):(1'h0)] reg78 = (1'h0);
  reg [(4'h8):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg76 = (1'h0);
  reg [(5'h11):(1'h0)] reg75 = (1'h0);
  reg [(5'h14):(1'h0)] reg74 = (1'h0);
  reg [(3'h7):(1'h0)] reg73 = (1'h0);
  reg [(3'h4):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg70 = (1'h0);
  reg signed [(4'he):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg67 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg65 = (1'h0);
  reg [(5'h15):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg63 = (1'h0);
  reg [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(3'h6):(1'h0)] reg61 = (1'h0);
  reg [(3'h5):(1'h0)] reg54 = (1'h0);
  reg [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg45 = (1'h0);
  reg signed [(4'he):(1'h0)] reg44 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire49,
                 wire43,
                 wire42,
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
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 (1'h0)};
  assign wire42 = (wire40 ^~ ((wire41 ^ (~|(wire37 * (8'hb5)))) - $signed((^(~(8'had))))));
  assign wire43 = $unsigned($signed((^~$signed((|wire37)))));
  always
    @(posedge clk) begin
      reg44 <= (($signed(wire43) ?
          wire38[(3'h4):(2'h3)] : $signed(($unsigned(wire37) ?
              {wire42,
                  wire41} : ((8'hbd) >> wire39)))) <<< $signed((^~(|(wire39 ?
          wire42 : wire38)))));
      reg45 <= (|$signed((({(8'had),
          wire39} <<< $unsigned(reg44)) - $unsigned(((8'hbb) ?
          wire42 : wire37)))));
      reg46 <= (~(wire38 && ($unsigned(wire43) && wire42[(4'hb):(4'hb)])));
      reg47 <= (({wire40,
              $unsigned((^~wire38))} < $signed($signed($signed(wire42)))) ?
          $unsigned((8'ha7)) : $unsigned(wire38));
      reg48 <= $signed(wire38[(2'h3):(1'h0)]);
    end
  assign wire49 = (((8'ha8) * (wire38[(3'h4):(2'h3)] && {$unsigned(wire41),
                      ((8'hbd) ?
                          (8'hac) : wire38)})) > {$unsigned((reg45[(4'h8):(3'h7)] ?
                          (8'hb4) : (wire43 * wire38)))});
  always
    @(posedge clk) begin
      reg50 <= (-reg45[(3'h4):(1'h0)]);
      reg51 <= wire38[(3'h5):(1'h0)];
      reg52 <= reg44[(4'hd):(1'h0)];
      reg53 <= (wire41 ? reg45[(4'hf):(2'h2)] : wire38[(3'h5):(1'h1)]);
      reg54 <= ({reg46, {((8'hb9) + (^(8'hb3))), $signed({wire38, reg52})}} ?
          reg46[(4'ha):(4'ha)] : $signed(((8'hb3) ?
              $unsigned((reg47 ? reg45 : wire38)) : (8'hb5))));
    end
  assign wire55 = (~&$unsigned(wire40));
  assign wire56 = $signed($signed($unsigned(($signed(reg46) & reg50))));
  assign wire57 = $unsigned({{reg50[(2'h3):(2'h3)]}});
  assign wire58 = $signed($signed(wire39));
  assign wire59 = wire39;
  assign wire60 = (&wire41);
  always
    @(posedge clk) begin
      if ((7'h40))
        begin
          if (reg46)
            begin
              reg61 <= (8'ha1);
              reg62 <= reg50[(2'h2):(1'h0)];
              reg63 <= reg52[(1'h1):(1'h0)];
              reg64 <= $unsigned((!((wire49[(2'h3):(2'h3)] != (reg62 * (8'ha0))) == $unsigned((wire55 ?
                  (8'hba) : reg63)))));
              reg65 <= {reg44[(1'h1):(1'h0)]};
            end
          else
            begin
              reg61 <= $unsigned(($signed($signed(reg50)) ?
                  ($unsigned($signed(reg44)) << $signed(reg62[(2'h2):(2'h2)])) : (|$unsigned((!reg53)))));
              reg62 <= (wire38[(1'h1):(1'h0)] ? reg61 : wire58[(4'h8):(1'h1)]);
            end
          reg66 <= $unsigned(({$unsigned((wire57 | wire56))} < {$signed(reg61)}));
          reg67 <= $signed(reg53);
          reg68 <= $unsigned((reg51 ? $signed(wire40) : $unsigned((8'hac))));
          if (((|$unsigned($unsigned(reg44[(2'h2):(1'h0)]))) ?
              reg67[(3'h4):(2'h2)] : wire56))
            begin
              reg69 <= (~{wire39[(4'hd):(3'h5)],
                  ((wire55 << (reg62 <= wire41)) ? reg54 : (!(^reg62)))});
              reg70 <= (({$signed(((8'hb2) ? reg48 : reg47)),
                  reg52[(2'h3):(2'h2)]} != (($signed((8'hbd)) < (reg69 ?
                  reg66 : wire59)) ~^ wire40[(1'h0):(1'h0)])) && (wire56 * ((reg63[(1'h1):(1'h0)] ~^ $unsigned(reg52)) ?
                  $signed($signed(reg69)) : wire43)));
            end
          else
            begin
              reg69 <= ((!(^(^(8'had)))) >> ((|(~|$signed(reg46))) ^ (((^~reg66) ?
                  $unsigned(reg46) : $unsigned((8'hbe))) ~^ wire59[(1'h1):(1'h0)])));
              reg70 <= (reg61 ? {(|(8'h9c))} : wire49[(4'hb):(1'h0)]);
              reg71 <= wire37[(1'h1):(1'h1)];
              reg72 <= reg65;
              reg73 <= ((($unsigned($signed(reg70)) ?
                      $unsigned({wire37}) : reg64) ?
                  wire39[(4'h9):(4'h9)] : $unsigned($signed((reg72 ?
                      reg52 : wire58)))) <<< $signed((^~($unsigned((8'hae)) ?
                  $unsigned(reg46) : reg62))));
            end
        end
      else
        begin
          if (({{reg72[(2'h3):(1'h1)], reg67[(3'h6):(3'h6)]},
                  $signed((|$unsigned(wire41)))} ?
              wire49[(2'h3):(1'h1)] : (~^$unsigned(wire59[(3'h5):(2'h3)]))))
            begin
              reg61 <= (((~|{$unsigned(wire42), reg50[(4'h8):(2'h3)]}) ?
                  (($signed((8'hba)) ? (&(8'hb5)) : (~|(8'ha7))) ~^ (&(reg68 ?
                      reg50 : wire58))) : $signed($signed(wire56))) && (&(~|(reg71[(1'h1):(1'h0)] >> $unsigned(reg67)))));
            end
          else
            begin
              reg61 <= ({(~(wire37[(2'h2):(1'h0)] ?
                      (wire59 + wire40) : (wire49 ?
                          reg50 : reg44)))} || $signed(($signed((wire59 != reg61)) << (8'ha9))));
              reg62 <= wire42;
              reg63 <= (~^$unsigned($signed($signed((wire56 * wire40)))));
              reg64 <= $signed((~|$unsigned($signed(reg72))));
              reg65 <= wire40[(2'h2):(2'h2)];
            end
          reg66 <= ((wire42 * reg48[(3'h7):(3'h6)]) ?
              $unsigned(reg72) : wire49);
          reg67 <= (reg66[(4'ha):(4'h9)] ?
              reg50[(5'h10):(1'h0)] : {$unsigned(($unsigned(wire37) & $signed(reg70)))});
          reg68 <= (&(reg69[(4'he):(3'h6)] ?
              (7'h43) : (wire55[(4'h8):(1'h0)] ^~ wire40[(3'h5):(2'h3)])));
          reg69 <= ((8'ha7) == reg47[(1'h1):(1'h0)]);
        end
      if (wire49[(4'hb):(2'h2)])
        begin
          reg74 <= wire56[(3'h5):(1'h0)];
          reg75 <= wire60[(2'h3):(2'h3)];
          if ($signed(($unsigned(((wire43 ~^ reg50) ?
                  (wire56 & wire39) : (^reg46))) ?
              reg68[(2'h3):(2'h2)] : reg62)))
            begin
              reg76 <= ((wire49[(4'h9):(1'h0)] <<< $signed($unsigned($signed(wire57)))) & (reg71 ?
                  (!{wire38, reg70}) : reg69[(1'h1):(1'h0)]));
              reg77 <= (&{((!wire55[(2'h3):(1'h0)]) ^~ $signed($signed(wire56)))});
              reg78 <= ((|reg44[(2'h2):(1'h0)]) ?
                  ($signed(wire56) ?
                      ($signed(reg64[(5'h12):(3'h7)]) - $signed((reg73 ?
                          reg64 : reg65))) : ((reg71 ?
                              $signed(wire38) : (~|(8'h9d))) ?
                          wire37[(2'h3):(2'h3)] : {reg72[(3'h4):(1'h0)]})) : (7'h43));
              reg79 <= (~reg74[(3'h6):(1'h0)]);
            end
          else
            begin
              reg76 <= $unsigned((reg48[(2'h2):(1'h0)] ?
                  $unsigned($unsigned((&reg69))) : ($unsigned((wire57 ?
                          (8'hba) : reg51)) ?
                      $signed((reg46 && (8'hb5))) : ((reg61 ?
                          wire60 : reg63) >>> (&(7'h44))))));
            end
          if (wire56)
            begin
              reg80 <= reg51[(3'h5):(3'h5)];
              reg81 <= (wire60 ?
                  (!(($signed(wire58) & $signed((7'h44))) ?
                      (reg76 ?
                          (reg76 ?
                              (8'haa) : wire56) : (reg78 && (7'h41))) : {reg54,
                          (reg71 >= reg80)})) : (($unsigned((^~(8'ha0))) ?
                          $signed({(8'hbd)}) : {$signed(wire60),
                              reg77[(3'h6):(3'h4)]}) ?
                      {($signed(reg46) == (~reg50)), (~|{wire55})} : (|reg48)));
              reg82 <= reg61;
              reg83 <= reg74;
            end
          else
            begin
              reg80 <= (($signed($signed((reg72 ? (8'hb4) : (8'ha2)))) ?
                  (|reg54) : $signed(($unsigned((8'hb3)) * (wire59 + reg82)))) * $unsigned((!($unsigned(reg52) ?
                  $unsigned(reg67) : (reg71 ? (8'haa) : wire37)))));
              reg81 <= ($unsigned({$signed({reg81})}) ?
                  wire39 : $signed($unsigned(reg77)));
              reg82 <= ($signed(wire60) ?
                  $unsigned(wire56) : reg45[(4'hc):(3'h7)]);
              reg83 <= wire40;
              reg84 <= ($signed((8'hbb)) ?
                  $signed($signed({(~&(8'ha0)),
                      $signed(wire43)})) : (!$signed(((^~(8'hb2)) * (8'ha5)))));
            end
          if ((8'hbd))
            begin
              reg85 <= wire38;
              reg86 <= reg70;
              reg87 <= reg52;
              reg88 <= (|reg61[(1'h1):(1'h0)]);
            end
          else
            begin
              reg85 <= ((reg68[(3'h5):(3'h4)] >>> reg73[(3'h5):(2'h3)]) ?
                  $unsigned(reg76) : $signed({(reg45[(5'h13):(4'hd)] ?
                          (reg62 ? reg71 : reg47) : $unsigned(reg84)),
                      {(reg77 ? wire58 : reg65), wire41}}));
              reg86 <= {$unsigned({reg53, $signed((&reg74))}),
                  ($unsigned(((reg78 <= wire56) ?
                      ((8'h9e) ^ reg52) : (reg52 ?
                          reg83 : wire55))) != (reg48[(4'h8):(3'h6)] - reg75))};
            end
        end
      else
        begin
          if (reg61[(1'h1):(1'h0)])
            begin
              reg74 <= ((((-$signed(wire39)) ?
                          $signed((&(8'hb9))) : {(reg66 > reg82)}) ?
                      reg84 : (({wire40} ?
                              $signed(wire59) : wire43[(3'h5):(3'h5)]) ?
                          reg82 : ((wire40 ?
                              reg80 : (8'had)) ^ $unsigned(reg51)))) ?
                  ($unsigned({wire56[(4'ha):(1'h1)]}) << (((8'hbc) ?
                      (wire43 ?
                          reg69 : reg85) : $unsigned(reg66)) != reg77)) : ($signed(($signed(reg54) ?
                          {reg52} : wire39)) ?
                      reg48[(1'h0):(1'h0)] : $signed(reg69)));
              reg75 <= reg84[(3'h5):(1'h0)];
              reg76 <= reg80[(3'h4):(1'h1)];
              reg77 <= ({(~^(!reg74[(5'h14):(2'h3)])),
                  (wire56 ?
                      (|{reg61,
                          reg67}) : (~&$unsigned(reg80)))} - $signed(reg87));
            end
          else
            begin
              reg74 <= $unsigned($unsigned(({reg83[(4'hb):(3'h7)]} >= ($unsigned(reg78) <<< (~^reg84)))));
              reg75 <= ((~|(~&(reg46 ~^ wire37[(1'h0):(1'h0)]))) >>> (({$unsigned(reg72)} ?
                      $unsigned(((8'h9c) << (8'haa))) : (~reg46)) ?
                  reg64 : (~^$unsigned(((8'h9f) ? reg82 : reg75)))));
              reg76 <= reg79[(4'h8):(3'h4)];
              reg77 <= {reg54, $unsigned(reg73[(1'h0):(1'h0)])};
              reg78 <= (&$signed(reg63));
            end
        end
      if ($unsigned(({wire59[(3'h4):(2'h2)]} ?
          {(reg51 ?
                  (&wire58) : (wire42 ?
                      reg45 : reg87))} : reg78[(3'h5):(1'h1)])))
        begin
          if ((8'hb4))
            begin
              reg89 <= wire57[(4'hb):(4'h9)];
              reg90 <= reg89;
              reg91 <= (reg64[(5'h15):(4'hf)] | wire59[(3'h4):(2'h3)]);
            end
          else
            begin
              reg89 <= {($signed(reg79) ?
                      {(^$signed(wire40)),
                          (&{reg85})} : $unsigned($unsigned($unsigned(wire42))))};
            end
          if ($signed(((|((reg68 >= reg77) ?
                  $unsigned(wire60) : (reg79 + reg53))) ?
              reg44[(3'h6):(1'h1)] : (&(~(8'ha0))))))
            begin
              reg92 <= reg91[(2'h2):(1'h1)];
              reg93 <= reg64;
              reg94 <= (((({reg62} ?
                  reg48[(4'h9):(1'h0)] : $unsigned(reg77)) < {$signed(wire56),
                  $signed(reg70)}) & $signed((^$signed(wire56)))) - (^($signed((|reg85)) <= (wire37[(3'h4):(2'h3)] ?
                  (8'ha6) : $unsigned(reg63)))));
              reg95 <= reg44[(3'h4):(1'h1)];
            end
          else
            begin
              reg92 <= $signed(wire60);
              reg93 <= {$unsigned(((wire42[(4'hd):(3'h6)] ^ (wire56 ?
                          reg89 : reg87)) ?
                      $unsigned((reg48 ?
                          reg86 : reg64)) : reg78[(3'h7):(1'h0)])),
                  {reg45}};
              reg94 <= $unsigned($signed({wire43[(1'h0):(1'h0)]}));
              reg95 <= wire40;
              reg96 <= ({(~^((reg92 != (8'hb1)) ? $signed((7'h42)) : reg89)),
                  wire55} * ($unsigned(reg82[(4'hb):(4'h8)]) ?
                  {reg70} : wire59));
            end
          if (reg69)
            begin
              reg97 <= (reg96[(2'h2):(2'h2)] ~^ $signed($signed(reg45[(4'hf):(4'hb)])));
              reg98 <= (|{{(reg61 & (reg64 <= wire40)), reg63}});
              reg99 <= (((reg75[(4'h8):(3'h6)] - (-{reg74})) ?
                  ((^(^~wire59)) > $signed(reg54)) : (($unsigned(reg82) && reg94[(5'h11):(2'h3)]) ?
                      $unsigned(reg65[(1'h0):(1'h0)]) : reg62[(3'h5):(1'h0)])) >> $signed($signed(($signed(reg88) && (-reg77)))));
            end
          else
            begin
              reg97 <= (reg69 >>> (~&reg79[(2'h3):(2'h2)]));
              reg98 <= (($signed(($unsigned(reg84) >= $signed(reg87))) ?
                  (((reg98 ? reg62 : reg93) >>> $unsigned(wire41)) ?
                      (reg52 <<< {reg69}) : (reg71 ?
                          reg91 : (|reg50))) : $signed({{(7'h40), reg86},
                      (-reg90)})) != ($signed(((wire42 == reg50) << reg45)) ?
                  reg80 : $signed(reg61[(3'h4):(3'h4)])));
              reg99 <= $signed(wire43[(2'h2):(1'h1)]);
            end
          reg100 <= (|reg89);
        end
      else
        begin
          reg89 <= reg85[(2'h3):(1'h0)];
          if ((+{reg78[(4'hf):(1'h1)], $unsigned($signed($unsigned(reg83)))}))
            begin
              reg90 <= $unsigned((({reg47[(1'h1):(1'h0)],
                  wire43[(2'h3):(2'h3)]} >= (&$unsigned(reg97))) < $unsigned($signed((8'hb4)))));
            end
          else
            begin
              reg90 <= reg51;
              reg91 <= wire55[(4'h9):(1'h1)];
            end
          reg92 <= reg76[(1'h0):(1'h0)];
        end
      reg101 <= (~&(~$signed(((|reg88) ? (!reg44) : reg79))));
    end
endmodule

module module15
#(parameter param27 = (((({(8'hb6), (8'ha3)} ? ((8'hbe) || (8'ha8)) : ((8'ha6) ? (8'hb9) : (8'h9e))) ? (((8'ha7) >> (8'hb4)) ? {(8'hb6), (8'hb3)} : ((8'hbe) <<< (8'hb5))) : {{(8'ha7), (8'ha7)}}) ? (((^~(8'hb0)) >= ((8'hb0) >>> (8'ha8))) >>> ({(8'ha9)} ? (^(8'hae)) : ((8'hb5) ? (8'ha9) : (8'haa)))) : (((7'h44) ? (~(8'hbf)) : (^~(8'hbc))) | ((&(7'h43)) * ((8'h9c) * (8'h9e))))) ? (+(({(8'hb7), (8'hba)} << (~(8'had))) ? {(8'h9e)} : (((8'ha9) - (7'h41)) ? (~^(8'hbc)) : (~^(8'ha8))))) : ({({(8'ha6)} ^ ((8'hbb) << (8'hb3))), ({(8'had), (7'h40)} & ((8'hbe) == (8'hb5)))} ^~ (8'h9f))))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire20;
  input wire [(4'he):(1'h0)] wire19;
  input wire [(4'hb):(1'h0)] wire18;
  input wire [(5'h15):(1'h0)] wire17;
  input wire signed [(5'h14):(1'h0)] wire16;
  wire signed [(3'h6):(1'h0)] wire26;
  wire [(2'h2):(1'h0)] wire25;
  wire [(5'h12):(1'h0)] wire24;
  wire signed [(3'h6):(1'h0)] wire23;
  wire [(5'h12):(1'h0)] wire22;
  wire [(4'ha):(1'h0)] wire21;
  assign y = {wire26, wire25, wire24, wire23, wire22, wire21, (1'h0)};
  assign wire21 = (((((wire19 ? wire16 : wire20) && wire20) ?
                      ($unsigned(wire19) ?
                          ((8'h9f) + (8'hbe)) : $unsigned(wire17)) : wire16[(2'h2):(1'h0)]) || $unsigned((-(wire17 <<< wire16)))) <= (-(((~^wire16) ?
                      (wire20 == wire20) : {wire16}) <= ((~&wire18) << (8'hb0)))));
  assign wire22 = wire16;
  assign wire23 = wire21[(4'h8):(2'h2)];
  assign wire24 = ((8'h9e) ?
                      wire23[(1'h1):(1'h1)] : $signed($unsigned(wire23)));
  assign wire25 = (wire22[(3'h6):(3'h5)] >> (wire16 ?
                      (^~(8'hbc)) : {wire18[(4'h8):(2'h3)],
                          {wire21[(1'h1):(1'h1)], (wire17 || (8'had))}}));
  assign wire26 = ((~&wire17[(4'hb):(3'h6)]) && (!$signed(({(8'hae)} >> wire21[(1'h0):(1'h0)]))));
endmodule
