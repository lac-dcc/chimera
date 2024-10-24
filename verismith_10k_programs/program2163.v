module top
#(parameter param207 = ({(!(^~{(8'hbb)})), (((8'ha4) ? {(7'h42)} : ((8'hb8) ~^ (8'hbf))) ? (&{(7'h42), (8'ha5)}) : (8'ha3))} * (((8'h9f) ? (^~((8'ha5) & (8'hb1))) : (((8'hb5) ? (8'h9c) : (8'ha3)) * (8'hba))) << ((!((8'hb2) ? (8'hae) : (8'hb7))) != (^~((8'hb5) ? (8'ha8) : (8'hb1)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'ha5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire205;
  wire [(4'he):(1'h0)] wire204;
  wire [(4'hd):(1'h0)] wire203;
  wire [(4'hc):(1'h0)] wire202;
  wire [(5'h15):(1'h0)] wire56;
  wire signed [(5'h15):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  wire signed [(4'ha):(1'h0)] wire200;
  assign y = {wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire56,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 wire200,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = (wire0[(3'h4):(2'h3)] <<< (~^(wire1 ?
                     (&(wire0 <= wire3)) : wire2[(4'hd):(4'hb)])));
  assign wire6 = ($signed($signed(((wire0 ? wire0 : wire4) <<< {(8'h9f)}))) ?
                     {((^$unsigned((8'ha6))) ?
                             ((~^wire2) ? wire4 : $unsigned(wire4)) : wire2),
                         $unsigned(wire1[(4'h9):(4'h9)])} : {(~^(wire1[(3'h4):(1'h1)] <= ((7'h43) & wire2))),
                         ((wire3[(5'h11):(1'h0)] ?
                             wire0 : wire2) || wire3[(5'h13):(2'h3)])});
  assign wire7 = wire4;
  assign wire8 = wire1[(3'h5):(1'h1)];
  module9 #() modinst57 (wire56, clk, wire0, wire2, wire4, wire8, wire7);
  module58 #() modinst201 (.y(wire200), .wire59(wire3), .wire61(wire0), .wire62(wire2), .clk(clk), .wire63(wire56), .wire60(wire1));
  assign wire202 = wire7[(1'h0):(1'h0)];
  assign wire203 = ({$unsigned((((8'ha8) ?
                           (8'hb2) : wire200) >>> (wire5 >>> wire1))),
                       wire1[(1'h1):(1'h1)]} | ($signed((-(8'ha9))) ?
                       $signed((-(&wire6))) : wire8));
  assign wire204 = wire200[(1'h0):(1'h0)];
  module38 #() modinst206 (.wire42(wire204), .y(wire205), .wire40(wire5), .wire39(wire8), .wire41(wire56), .clk(clk));
endmodule

module module58  (y, clk, wire63, wire62, wire61, wire60, wire59);
  output wire [(32'hce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire63;
  input wire signed [(5'h15):(1'h0)] wire62;
  input wire signed [(2'h2):(1'h0)] wire61;
  input wire [(5'h14):(1'h0)] wire60;
  input wire signed [(4'he):(1'h0)] wire59;
  wire [(2'h3):(1'h0)] wire199;
  wire [(5'h12):(1'h0)] wire198;
  wire [(5'h11):(1'h0)] wire197;
  wire [(2'h2):(1'h0)] wire196;
  wire [(4'he):(1'h0)] wire122;
  wire [(4'h8):(1'h0)] wire64;
  wire [(5'h11):(1'h0)] wire128;
  wire [(5'h11):(1'h0)] wire129;
  wire signed [(4'h8):(1'h0)] wire160;
  wire [(3'h7):(1'h0)] wire162;
  wire [(3'h6):(1'h0)] wire163;
  wire [(2'h2):(1'h0)] wire194;
  reg signed [(4'hb):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg65 = (1'h0);
  reg signed [(4'he):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg126 = (1'h0);
  reg [(2'h3):(1'h0)] reg127 = (1'h0);
  assign y = {wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire122,
                 wire64,
                 wire128,
                 wire129,
                 wire160,
                 wire162,
                 wire163,
                 wire194,
                 reg67,
                 reg66,
                 reg65,
                 reg124,
                 reg125,
                 reg126,
                 reg127,
                 (1'h0)};
  assign wire64 = (~|(~^wire59));
  always
    @(posedge clk) begin
      reg65 <= (!((((wire61 | wire64) ?
          (wire59 < wire61) : $signed(wire60)) >> ((~wire61) ?
          (^~(8'haa)) : (wire60 <= wire64))) >> ((wire63[(3'h5):(2'h3)] << {wire61,
          wire59}) << {(wire61 >> wire59)})));
      reg66 <= wire63[(4'h8):(3'h4)];
      reg67 <= ($unsigned($unsigned((^~wire62[(3'h4):(2'h3)]))) ?
          $unsigned($signed((^~wire60[(4'hf):(4'h8)]))) : wire63[(2'h3):(2'h2)]);
    end
  module68 #() modinst123 (wire122, clk, wire59, wire60, wire63, reg67);
  always
    @(posedge clk) begin
      reg124 <= {$unsigned(((+$unsigned(wire60)) >>> {(wire63 <<< reg66)}))};
      reg125 <= $unsigned(wire64);
      reg126 <= ($unsigned({$unsigned($signed(wire62)),
              wire63[(3'h7):(3'h7)]}) ?
          wire61[(1'h1):(1'h1)] : $signed($signed((~$unsigned(wire64)))));
      reg127 <= {(!$unsigned(wire64[(4'h8):(1'h0)]))};
    end
  assign wire128 = (|$signed($signed(wire122)));
  assign wire129 = wire122;
  module130 #() modinst161 (wire160, clk, reg125, wire62, reg67, wire129);
  assign wire162 = (((reg67[(4'h9):(1'h0)] ?
                           wire128[(4'h8):(2'h3)] : ((~reg127) || ((8'haf) + reg125))) ~^ (~|((!reg126) + (reg125 * wire122)))) ?
                       (wire64[(3'h7):(1'h0)] ?
                           $signed(wire63) : (~&({wire160} ?
                               wire122[(3'h4):(2'h3)] : (wire128 ?
                                   wire63 : reg126)))) : ((^~$signed((^~wire64))) ?
                           reg66[(4'h9):(2'h3)] : ((&$signed(wire61)) * $unsigned(((8'hb9) == reg125)))));
  assign wire163 = $signed((reg127[(2'h2):(1'h0)] ?
                       (wire160[(1'h0):(1'h0)] ?
                           wire63 : $unsigned($unsigned((8'h9d)))) : reg124));
  module164 #() modinst195 (wire194, clk, wire128, wire122, wire60, reg66);
  assign wire196 = ((wire62 ^~ $signed(reg125)) ?
                       {(~{$unsigned(wire162)})} : ($unsigned(reg67) ?
                           ({reg127[(1'h1):(1'h1)]} >>> (~$unsigned(reg65))) : $signed(wire194[(1'h1):(1'h0)])));
  assign wire197 = wire63[(4'h8):(1'h1)];
  assign wire198 = $unsigned((reg125 ?
                       ($unsigned((^reg65)) ?
                           reg67 : $signed({reg66, reg126})) : wire63));
  assign wire199 = ((((((8'ha2) && wire194) >>> $signed(wire196)) || reg65) == wire160[(2'h3):(2'h2)]) ?
                       $unsigned(wire129) : reg66);
endmodule

module module9
#(parameter param55 = {(^~((((8'hb4) * (8'ha7)) || {(8'hb1), (8'ha5)}) != (((8'ha5) && (8'hae)) ? {(8'ha1)} : ((7'h40) <= (7'h41)))))})
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire14;
  input wire signed [(3'h6):(1'h0)] wire13;
  input wire signed [(5'h10):(1'h0)] wire12;
  input wire [(5'h15):(1'h0)] wire11;
  input wire [(4'hc):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire54;
  wire signed [(4'hf):(1'h0)] wire53;
  wire [(4'hb):(1'h0)] wire52;
  wire signed [(3'h5):(1'h0)] wire51;
  wire [(4'ha):(1'h0)] wire50;
  wire [(2'h3):(1'h0)] wire48;
  wire [(5'h15):(1'h0)] wire36;
  wire [(4'ha):(1'h0)] wire15;
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire48,
                 wire36,
                 wire15,
                 (1'h0)};
  assign wire15 = (wire13[(3'h4):(2'h2)] <= wire12);
  module16 #() modinst37 (wire36, clk, wire12, wire10, wire14, wire15);
  module38 #() modinst49 (wire48, clk, wire10, wire36, wire11, wire12);
  assign wire50 = (^~$signed(((8'ha3) != wire12[(4'hc):(2'h2)])));
  assign wire51 = (wire15[(2'h3):(2'h2)] - ((wire10 - (+(~wire10))) ?
                      (($signed(wire50) <= $signed(wire10)) ?
                          wire48[(2'h2):(1'h1)] : $signed($signed((8'hba)))) : {($signed(wire13) < wire36[(4'hc):(2'h2)]),
                          ($signed(wire13) ?
                              (wire10 ?
                                  wire12 : wire10) : wire50[(2'h3):(1'h1)])}));
  assign wire52 = $unsigned(wire11[(5'h10):(3'h6)]);
  assign wire53 = wire14[(4'h8):(1'h1)];
  assign wire54 = $signed(wire50[(3'h7):(2'h3)]);
endmodule

module module38
#(parameter param47 = (&((((~^(8'hac)) <<< (|(7'h44))) ? (((8'ha6) ? (8'hb5) : (8'hbc)) ? (~|(8'haf)) : (^~(8'haf))) : (8'hb3)) >= (+(((7'h43) ? (8'ha9) : (8'ha6)) ? ((7'h42) | (7'h41)) : ((7'h44) ? (8'hb3) : (8'ha4)))))))
(y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'h2c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire42;
  input wire [(5'h15):(1'h0)] wire41;
  input wire [(5'h15):(1'h0)] wire40;
  input wire signed [(5'h10):(1'h0)] wire39;
  wire signed [(3'h5):(1'h0)] wire46;
  wire [(5'h15):(1'h0)] wire45;
  wire [(4'h8):(1'h0)] wire43;
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  assign y = {wire46, wire45, wire43, reg44, (1'h0)};
  assign wire43 = (((&(!$signed(wire41))) ?
                      wire40 : (~^wire40)) >>> wire40[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg44 <= (!wire41);
    end
  assign wire45 = $signed((&(!((~&wire39) ?
                      (wire43 || wire40) : $signed((7'h44))))));
  assign wire46 = wire45;
endmodule

module module16  (y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'had):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire20;
  input wire [(3'h6):(1'h0)] wire19;
  input wire [(4'he):(1'h0)] wire18;
  input wire [(3'h7):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire35;
  wire [(2'h3):(1'h0)] wire34;
  wire signed [(5'h11):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire31;
  wire signed [(3'h7):(1'h0)] wire30;
  wire [(3'h5):(1'h0)] wire29;
  wire signed [(3'h7):(1'h0)] wire28;
  wire signed [(3'h4):(1'h0)] wire26;
  wire signed [(4'ha):(1'h0)] wire25;
  wire signed [(4'ha):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire23;
  wire [(4'h8):(1'h0)] wire22;
  wire signed [(4'h8):(1'h0)] wire21;
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg27,
                 (1'h0)};
  assign wire21 = {$signed(wire17), wire20[(4'h9):(4'h9)]};
  assign wire22 = $unsigned($signed($signed($signed(wire18))));
  assign wire23 = $signed(((^~((wire18 ?
                      wire20 : wire18) <= (!wire22))) << ((|((8'hbe) ?
                      wire17 : wire20)) | ($signed(wire19) << (&wire21)))));
  assign wire24 = (8'hbd);
  assign wire25 = (wire22 <<< wire22[(3'h6):(3'h6)]);
  assign wire26 = $unsigned(($unsigned(wire25) ?
                      ({wire18[(4'h8):(2'h3)]} + $signed((wire20 << wire22))) : wire18));
  always
    @(posedge clk) begin
      reg27 <= ($unsigned($signed($signed((wire18 ^~ wire24)))) == wire17);
    end
  assign wire28 = wire23[(1'h0):(1'h0)];
  assign wire29 = {$signed({{wire17}}),
                      $unsigned(($unsigned($unsigned(wire17)) ?
                          ((wire24 & wire28) ?
                              (8'ha8) : (+wire23)) : $signed({wire24,
                              wire23})))};
  assign wire30 = ($unsigned(wire26) ?
                      (8'hbf) : (~^($signed((wire29 ?
                          wire22 : wire24)) ^~ (!wire21[(4'h8):(2'h2)]))));
  assign wire31 = (wire23 * (~wire25));
  assign wire32 = $unsigned(wire23[(3'h7):(3'h4)]);
  assign wire33 = (wire29 >> {wire25, {$unsigned({wire18}), wire18}});
  assign wire34 = wire30[(3'h6):(2'h3)];
  assign wire35 = (+{wire26});
endmodule

module module164  (y, clk, wire168, wire167, wire166, wire165);
  output wire [(32'h128):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire168;
  input wire [(4'he):(1'h0)] wire167;
  input wire signed [(2'h2):(1'h0)] wire166;
  input wire signed [(5'h13):(1'h0)] wire165;
  wire [(5'h13):(1'h0)] wire182;
  wire signed [(5'h14):(1'h0)] wire181;
  wire [(4'hf):(1'h0)] wire180;
  wire signed [(2'h2):(1'h0)] wire179;
  wire signed [(5'h12):(1'h0)] wire178;
  wire signed [(4'hb):(1'h0)] wire177;
  wire [(5'h13):(1'h0)] wire176;
  wire signed [(4'hf):(1'h0)] wire175;
  wire signed [(5'h12):(1'h0)] wire174;
  wire [(3'h4):(1'h0)] wire173;
  wire signed [(2'h3):(1'h0)] wire172;
  wire [(4'he):(1'h0)] wire171;
  wire [(3'h4):(1'h0)] wire170;
  wire [(4'h9):(1'h0)] wire169;
  reg signed [(4'hd):(1'h0)] reg193 = (1'h0);
  reg [(5'h11):(1'h0)] reg192 = (1'h0);
  reg [(2'h2):(1'h0)] reg191 = (1'h0);
  reg [(5'h10):(1'h0)] reg190 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg189 = (1'h0);
  reg [(5'h12):(1'h0)] reg188 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg187 = (1'h0);
  reg [(2'h3):(1'h0)] reg186 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg185 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg183 = (1'h0);
  assign y = {wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
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
                 (1'h0)};
  assign wire169 = $unsigned((7'h43));
  assign wire170 = wire167[(1'h0):(1'h0)];
  assign wire171 = $unsigned(wire170[(1'h1):(1'h0)]);
  assign wire172 = $unsigned(wire167);
  assign wire173 = wire166;
  assign wire174 = {wire169[(2'h3):(1'h0)], (wire172 ^ $signed({{wire166}}))};
  assign wire175 = ({wire165[(5'h10):(4'h9)], wire173} ^~ wire171);
  assign wire176 = $unsigned(wire166[(1'h0):(1'h0)]);
  assign wire177 = (wire168[(2'h3):(1'h0)] == ($signed(wire175[(1'h1):(1'h1)]) < wire167[(1'h0):(1'h0)]));
  assign wire178 = ($unsigned((^~((wire166 >>> wire170) ?
                           (wire174 ?
                               (8'hb0) : wire172) : (wire177 ~^ wire171)))) ?
                       wire166 : (-{(+(wire173 ? wire165 : wire174)),
                           wire165[(1'h0):(1'h0)]}));
  assign wire179 = wire172;
  assign wire180 = (8'haf);
  assign wire181 = (wire170 || wire173);
  assign wire182 = ($signed($unsigned(($signed(wire176) ?
                           wire165 : {wire181, wire167}))) ?
                       $signed(((wire171 <= wire172) < (wire173 == $unsigned(wire172)))) : $unsigned(wire180));
  always
    @(posedge clk) begin
      reg183 <= wire166;
      reg184 <= (wire176[(4'hf):(3'h6)] ^~ wire179);
      if ($unsigned({($unsigned((wire168 - wire181)) ?
              reg183 : (&{wire181, wire180})),
          (8'ha0)}))
        begin
          reg185 <= $unsigned(wire173);
          reg186 <= wire170;
          if (({$unsigned($signed((^~wire179)))} ~^ wire179[(1'h0):(1'h0)]))
            begin
              reg187 <= $unsigned($unsigned((&$unsigned($signed(wire181)))));
              reg188 <= ($signed($unsigned(wire167)) ? wire171 : (7'h42));
              reg189 <= ((reg185 < (reg188 & ($signed((8'hb7)) ?
                  $unsigned(wire169) : (wire165 ?
                      wire181 : wire168)))) >= (!($unsigned($unsigned(wire174)) ?
                  ((wire170 | (8'hb5)) ?
                      reg187[(2'h3):(2'h3)] : wire174[(4'he):(1'h1)]) : wire172)));
            end
          else
            begin
              reg187 <= wire181[(4'hd):(3'h6)];
              reg188 <= (8'haf);
              reg189 <= ({wire169} * {$unsigned(wire167[(4'hb):(1'h0)])});
            end
          reg190 <= wire174[(1'h0):(1'h0)];
          reg191 <= $unsigned(($signed(reg190[(2'h2):(2'h2)]) ?
              (~|$unsigned((!wire177))) : $unsigned(((reg190 && wire178) < $unsigned(reg189)))));
        end
      else
        begin
          reg185 <= wire178[(4'h9):(4'h8)];
          reg186 <= $unsigned(wire182[(4'hd):(1'h1)]);
          if ((~^wire181))
            begin
              reg187 <= ((8'ha2) ?
                  $signed({reg185[(2'h3):(1'h1)],
                      ((~wire172) <<< wire175)}) : (~wire174));
              reg188 <= $unsigned(wire176);
              reg189 <= {((!((reg184 >>> reg187) ?
                      wire180[(4'h8):(3'h4)] : wire169)) ^ {{(^~wire170)}}),
                  wire170[(2'h3):(1'h1)]};
              reg190 <= (+(8'ha6));
              reg191 <= (8'ha0);
            end
          else
            begin
              reg187 <= ($unsigned($unsigned((8'ha0))) | (~&($unsigned($unsigned(wire175)) != wire175[(4'hc):(4'h9)])));
            end
          reg192 <= $signed((&($unsigned($signed((7'h43))) && (~|{reg185,
              reg184}))));
          reg193 <= (((|$unsigned($signed(reg190))) ?
                  (~^(wire171[(4'ha):(2'h3)] && (wire168 ?
                      wire178 : wire165))) : ((!(wire173 || reg191)) >>> {(8'ha4)})) ?
              (-{$signed((reg192 && wire177)),
                  ((~^wire170) >>> {reg188,
                      wire168})}) : ((!{{reg192}}) != reg190));
        end
    end
endmodule

module module130
#(parameter param159 = (+{(~|((|(8'h9d)) & ((8'hb7) >> (8'ha3))))}))
(y, clk, wire134, wire133, wire132, wire131);
  output wire [(32'hef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire134;
  input wire signed [(4'ha):(1'h0)] wire133;
  input wire signed [(3'h7):(1'h0)] wire132;
  input wire [(5'h11):(1'h0)] wire131;
  wire [(4'hf):(1'h0)] wire158;
  wire signed [(2'h2):(1'h0)] wire157;
  wire [(4'ha):(1'h0)] wire156;
  wire [(3'h6):(1'h0)] wire155;
  wire signed [(3'h6):(1'h0)] wire154;
  wire signed [(3'h6):(1'h0)] wire153;
  wire signed [(4'hd):(1'h0)] wire146;
  wire [(4'hf):(1'h0)] wire145;
  wire signed [(5'h10):(1'h0)] wire144;
  wire [(5'h12):(1'h0)] wire143;
  wire signed [(4'hc):(1'h0)] wire142;
  wire [(4'h8):(1'h0)] wire141;
  wire signed [(3'h7):(1'h0)] wire140;
  wire signed [(5'h13):(1'h0)] wire139;
  wire [(4'hc):(1'h0)] wire138;
  wire signed [(5'h10):(1'h0)] wire137;
  wire signed [(4'hc):(1'h0)] wire136;
  wire [(2'h2):(1'h0)] wire135;
  reg [(4'h9):(1'h0)] reg152 = (1'h0);
  reg [(2'h3):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg150 = (1'h0);
  reg [(4'he):(1'h0)] reg149 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg147 = (1'h0);
  assign y = {wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 (1'h0)};
  assign wire135 = (($signed((~&wire131[(4'hb):(3'h4)])) ?
                       $signed($signed((wire133 + wire131))) : $unsigned((+wire131[(4'h8):(3'h4)]))) > (((|(~|(8'h9c))) ?
                       (~|(+wire132)) : wire131[(4'hc):(2'h3)]) >>> {wire134}));
  assign wire136 = $signed(((($signed(wire131) >>> ((8'haa) ?
                               wire131 : wire131)) ?
                           {(wire131 * wire135)} : wire133) ?
                       wire131 : {(wire133 <<< ((8'hb8) <= (8'hb4)))}));
  assign wire137 = $unsigned(wire134[(1'h0):(1'h0)]);
  assign wire138 = wire132;
  assign wire139 = (|$signed((&$signed({wire132, wire136}))));
  assign wire140 = wire139;
  assign wire141 = $signed(wire134);
  assign wire142 = wire141;
  assign wire143 = (-(wire140[(1'h1):(1'h1)] ?
                       $unsigned($unsigned($unsigned(wire140))) : (^$signed(wire138[(2'h2):(1'h1)]))));
  assign wire144 = ($unsigned($unsigned(((8'ha6) + (wire134 + wire143)))) & (8'hb7));
  assign wire145 = $signed((~(~^$unsigned((wire142 || wire134)))));
  assign wire146 = (wire138[(2'h3):(2'h2)] ?
                       wire137[(4'h9):(3'h5)] : {((|(wire136 && wire143)) - $unsigned({wire131}))});
  always
    @(posedge clk) begin
      reg147 <= ($signed((+($unsigned(wire135) << (-wire134)))) >>> ((~&wire140[(3'h5):(1'h0)]) >> (!$signed((wire145 ?
          (7'h41) : wire133)))));
      reg148 <= wire136[(4'h8):(1'h0)];
      if ($signed(((wire132[(3'h7):(2'h2)] >>> (wire134 >= ((8'ha6) ^~ wire132))) ~^ (wire137[(4'hc):(1'h1)] - $signed((+reg148))))))
        begin
          reg149 <= {(wire143 << $unsigned(((wire143 >>> wire131) ?
                  (^~(8'h9d)) : $signed(wire134))))};
        end
      else
        begin
          reg149 <= (&wire138);
          reg150 <= ((($unsigned((wire146 ?
                  (8'h9c) : (8'hb5))) | $signed((reg149 << (8'hbc)))) >> ((^~$signed(wire131)) ?
                  {wire145[(4'hb):(4'h8)]} : $unsigned(wire144[(4'hd):(2'h3)]))) ?
              reg148 : (8'h9f));
          reg151 <= ((wire131 ?
              (reg148 <<< wire136[(3'h6):(3'h5)]) : $signed($unsigned(wire137[(3'h5):(2'h3)]))) >= (((wire131[(4'hc):(1'h1)] & wire136[(4'hb):(2'h3)]) != $signed((wire132 ?
                  wire144 : reg149))) ?
              $unsigned(wire141[(4'h8):(1'h1)]) : {$unsigned(((8'ha8) ?
                      wire139 : wire137)),
                  {(wire142 ^ (8'hac))}}));
        end
      reg152 <= wire146[(1'h1):(1'h1)];
    end
  assign wire153 = {wire134};
  assign wire154 = wire141;
  assign wire155 = (wire140 ?
                       reg149[(4'h8):(3'h6)] : $unsigned($unsigned((&wire136[(4'ha):(2'h2)]))));
  assign wire156 = $unsigned(wire140[(3'h7):(1'h1)]);
  assign wire157 = {wire134};
  assign wire158 = $unsigned(({{(~|reg151), $signed(wire139)},
                       (wire139[(5'h10):(4'hd)] << $unsigned(wire146))} - $unsigned(wire144[(4'hf):(3'h7)])));
endmodule

module module68
#(parameter param121 = ({(|{((8'hac) ? (8'hb6) : (8'h9e)), {(8'ha5)}})} ? ((((~|(8'hb7)) ^ ((8'ha6) ? (8'haa) : (8'hb7))) ? {((7'h40) ? (8'had) : (8'had))} : (~|((8'hab) ? (8'hb5) : (8'ha8)))) ? ((8'h9e) ? (((8'ha8) < (8'ha9)) - {(8'h9e)}) : (-((8'h9e) ? (8'h9c) : (8'hba)))) : (({(8'ha8)} ~^ {(7'h41), (8'hb1)}) ? ({(7'h42), (8'ha1)} == ((8'haa) ? (8'ha7) : (8'ha1))) : (-((8'ha9) << (8'h9e))))) : {({((8'hb7) <<< (8'ha4))} | (|{(8'hb7)})), ((((7'h42) ? (8'hb0) : (8'hba)) + (^~(8'hbe))) <= {((7'h42) ? (8'hbb) : (8'ha1))})}))
(y, clk, wire72, wire71, wire70, wire69);
  output wire [(32'h1e2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire72;
  input wire signed [(2'h3):(1'h0)] wire71;
  input wire [(4'hd):(1'h0)] wire70;
  input wire [(4'h8):(1'h0)] wire69;
  wire [(2'h3):(1'h0)] wire120;
  wire signed [(5'h13):(1'h0)] wire119;
  wire [(3'h6):(1'h0)] wire99;
  wire signed [(5'h10):(1'h0)] wire98;
  wire [(5'h14):(1'h0)] wire97;
  wire [(4'h9):(1'h0)] wire96;
  wire signed [(4'ha):(1'h0)] wire95;
  wire signed [(4'hf):(1'h0)] wire81;
  wire signed [(4'hc):(1'h0)] wire80;
  wire [(5'h11):(1'h0)] wire79;
  wire [(4'h9):(1'h0)] wire77;
  wire [(5'h14):(1'h0)] wire76;
  wire signed [(2'h3):(1'h0)] wire75;
  wire [(3'h5):(1'h0)] wire74;
  wire signed [(4'hb):(1'h0)] wire73;
  reg signed [(3'h5):(1'h0)] reg118 = (1'h0);
  reg [(5'h12):(1'h0)] reg117 = (1'h0);
  reg [(4'hb):(1'h0)] reg116 = (1'h0);
  reg [(4'hb):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg114 = (1'h0);
  reg [(3'h7):(1'h0)] reg113 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg112 = (1'h0);
  reg [(4'h8):(1'h0)] reg111 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg110 = (1'h0);
  reg [(3'h5):(1'h0)] reg109 = (1'h0);
  reg [(2'h2):(1'h0)] reg108 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg107 = (1'h0);
  reg [(4'ha):(1'h0)] reg106 = (1'h0);
  reg [(4'hf):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg104 = (1'h0);
  reg signed [(4'he):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg94 = (1'h0);
  reg [(5'h13):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg91 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg90 = (1'h0);
  reg [(4'hf):(1'h0)] reg89 = (1'h0);
  reg [(4'h8):(1'h0)] reg88 = (1'h0);
  reg [(2'h2):(1'h0)] reg87 = (1'h0);
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  reg [(5'h12):(1'h0)] reg85 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg78 = (1'h0);
  assign y = {wire120,
                 wire119,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire81,
                 wire80,
                 wire79,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 reg118,
                 reg117,
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
                 reg78,
                 (1'h0)};
  assign wire73 = wire70;
  assign wire74 = {((~$signed((-wire71))) ?
                          wire70 : $signed($unsigned($signed(wire73)))),
                      {(((wire71 * wire70) ?
                                  $signed(wire72) : $signed(wire71)) ?
                              wire73[(3'h5):(1'h1)] : ($unsigned(wire72) ?
                                  $signed(wire69) : (wire73 >>> wire70)))}};
  assign wire75 = (-(^$unsigned((&(-wire71)))));
  assign wire76 = (wire73[(4'h8):(2'h3)] != $unsigned($signed($signed($unsigned(wire70)))));
  assign wire77 = {wire74[(3'h4):(2'h3)]};
  always
    @(posedge clk) begin
      reg78 <= wire76[(5'h11):(3'h7)];
    end
  assign wire79 = wire74;
  assign wire80 = (wire73[(3'h5):(3'h4)] == $signed(($unsigned($signed((8'hb0))) ?
                      wire70 : $signed((wire77 | wire75)))));
  assign wire81 = $signed(((!wire72) >>> $unsigned(wire70)));
  always
    @(posedge clk) begin
      reg82 <= $unsigned({((8'ha5) & wire77[(3'h7):(1'h0)]),
          $unsigned($unsigned({(8'hbc)}))});
      if ($signed($unsigned(wire71[(2'h2):(1'h0)])))
        begin
          if ({$signed({wire76[(2'h3):(1'h0)],
                  $unsigned((wire71 ? wire70 : wire74))}),
              reg78[(3'h6):(3'h6)]})
            begin
              reg83 <= $unsigned(((!(&wire74)) ?
                  $unsigned($signed(wire77[(3'h7):(2'h3)])) : ((wire76[(5'h13):(4'hf)] & wire80) ?
                      $unsigned((!wire70)) : (~$unsigned(wire76)))));
            end
          else
            begin
              reg83 <= {$signed((~&reg82))};
              reg84 <= $unsigned($signed((wire71[(2'h2):(1'h0)] ?
                  $signed($unsigned(wire81)) : {{wire71}, (~&(8'hb4))})));
              reg85 <= {(~reg84),
                  ((|(wire71[(2'h2):(1'h1)] ^ reg83)) ?
                      (8'hb9) : {{(wire73 != wire71)}, wire75})};
            end
          reg86 <= $signed((wire71[(2'h3):(1'h1)] >= (~wire75)));
        end
      else
        begin
          reg83 <= (~&$unsigned(wire73[(1'h1):(1'h0)]));
        end
      if ((((reg83[(1'h1):(1'h0)] ~^ $signed((~&reg86))) - ((-$unsigned(wire76)) ?
              $unsigned(wire75[(1'h1):(1'h0)]) : {wire71[(2'h2):(1'h0)]})) ?
          (~$signed(wire71[(2'h3):(1'h0)])) : reg82))
        begin
          reg87 <= wire79;
          reg88 <= (((8'hbe) ~^ $signed($signed((reg83 > wire73)))) || {({(~reg85)} > $unsigned((+reg83))),
              (+($signed(wire76) ?
                  (wire69 ? wire79 : wire79) : $unsigned(wire77)))});
          reg89 <= ({$unsigned((~^(wire77 << (8'hb6))))} ~^ (reg87 ?
              $unsigned($unsigned(reg78)) : $unsigned(reg84[(1'h1):(1'h0)])));
        end
      else
        begin
          reg87 <= $unsigned((~$unsigned((8'ha7))));
          if ({(8'haa)})
            begin
              reg88 <= ((wire77 ?
                  ($unsigned(reg82) + ($signed(reg78) ~^ $unsigned(wire72))) : (8'hac)) < $unsigned($unsigned(($unsigned(wire79) < reg78[(3'h6):(3'h6)]))));
              reg89 <= (~$unsigned($unsigned(((reg83 ? reg87 : (8'ha3)) ?
                  reg86[(3'h7):(3'h7)] : {wire71}))));
            end
          else
            begin
              reg88 <= {({reg83[(1'h1):(1'h1)],
                      {(~^reg86), $unsigned(wire75)}} >= wire73)};
              reg89 <= wire76[(4'h8):(3'h6)];
              reg90 <= (({$signed(reg82[(1'h1):(1'h1)]),
                      wire74[(1'h1):(1'h1)]} ?
                  ({(reg86 != wire74)} <= wire79[(4'ha):(2'h3)]) : (8'h9c)) >> ((^~$unsigned(reg88)) ?
                  {(+wire71)} : reg88));
            end
        end
      if ((|($unsigned((|$signed(wire71))) ? wire80 : (~|(|(reg82 - reg84))))))
        begin
          reg91 <= (wire75 < $unsigned({$signed(reg83), (|$signed(wire76))}));
          reg92 <= reg89[(4'hc):(2'h2)];
          reg93 <= $signed({(wire80 ? $signed({reg87}) : (~&$unsigned(wire81))),
              ($unsigned((reg90 ? reg91 : wire76)) ?
                  ({reg90} ^ (reg89 ?
                      wire79 : wire77)) : wire76[(5'h14):(5'h10)])});
          reg94 <= $unsigned($signed((wire79 ?
              (((8'ha7) ? reg89 : wire75) && {wire75,
                  wire70}) : (~^$signed(reg78)))));
        end
      else
        begin
          reg91 <= (8'ha2);
        end
    end
  assign wire95 = wire74[(2'h3):(2'h2)];
  assign wire96 = reg94;
  assign wire97 = (reg93 ?
                      (reg89 ?
                          (~|$signed(wire75)) : (!wire79)) : {(wire81 > $unsigned({wire76,
                              reg92})),
                          (reg87 - (reg85[(3'h4):(2'h3)] ?
                              (reg85 ? wire72 : wire80) : {reg88}))});
  assign wire98 = (&(wire72[(2'h2):(2'h2)] != reg94));
  assign wire99 = ((&((!(~wire77)) - (~^reg87))) == (!$unsigned((((8'hb1) ^~ wire77) + (!reg89)))));
  always
    @(posedge clk) begin
      if (reg90[(1'h1):(1'h1)])
        begin
          reg100 <= (wire73[(1'h0):(1'h0)] < reg93[(5'h10):(1'h1)]);
          reg101 <= ($unsigned((((~^wire73) != wire74) & ((~&reg87) == (~|reg82)))) ^~ wire70);
          reg102 <= (((^$unsigned(wire95)) ?
              wire99[(2'h3):(1'h1)] : {(8'hba)}) - (~|(~&$unsigned($unsigned(wire73)))));
          reg103 <= $unsigned((~^(({wire75} ?
              $unsigned(reg100) : (reg90 ?
                  (8'haf) : reg84)) && (&$signed(wire96)))));
        end
      else
        begin
          reg100 <= ((|((^~$unsigned(wire75)) * wire77)) && (&reg102[(2'h3):(2'h3)]));
        end
    end
  always
    @(posedge clk) begin
      reg104 <= (~^{($signed(reg85[(2'h3):(2'h2)]) < (^wire98[(3'h6):(3'h4)])),
          {(~&wire72)}});
      reg105 <= {(8'ha6)};
      reg106 <= (~$unsigned((wire99 ?
          (~^(wire75 ? wire74 : wire74)) : $signed($unsigned(reg102)))));
      if ($signed(reg101))
        begin
          reg107 <= (8'ha1);
          reg108 <= reg104;
          if ($signed(reg88[(4'h8):(3'h7)]))
            begin
              reg109 <= (~|wire96[(3'h7):(3'h4)]);
              reg110 <= (|(wire69[(2'h2):(2'h2)] - reg92));
              reg111 <= $unsigned(reg87[(2'h2):(2'h2)]);
            end
          else
            begin
              reg109 <= $signed({({(reg84 ^~ (8'hb0)), reg104[(4'hb):(3'h4)]} ?
                      (wire72[(3'h4):(2'h3)] ?
                          (8'hb8) : $signed(wire69)) : reg106),
                  (reg87[(1'h1):(1'h1)] ?
                      (8'had) : $signed((wire95 ~^ reg85)))});
            end
          if (wire69)
            begin
              reg112 <= $unsigned(reg93);
              reg113 <= reg106[(3'h7):(3'h5)];
              reg114 <= {($unsigned(wire75[(1'h0):(1'h0)]) ?
                      ((^~(!wire71)) <= ((|reg110) & (~reg89))) : (wire81[(1'h0):(1'h0)] - ((+(8'hb0)) ^ (reg111 < reg110)))),
                  $signed({$unsigned((wire70 ? (8'h9e) : reg111))})};
            end
          else
            begin
              reg112 <= $signed((reg105 + ($signed(wire98) ?
                  $signed(reg100) : wire74)));
              reg113 <= {wire72[(4'hd):(2'h3)]};
              reg114 <= {(wire95 ?
                      (^~wire69[(1'h0):(1'h0)]) : (^~reg87[(1'h0):(1'h0)]))};
            end
        end
      else
        begin
          if (((($signed((wire99 ? reg92 : wire73)) ?
                      $unsigned(reg114[(4'h9):(2'h3)]) : ((wire95 ^ wire76) | (!wire76))) ?
                  (^$signed($unsigned(wire74))) : ((~^$signed((8'hb4))) == reg88[(3'h4):(2'h3)])) ?
              $unsigned($unsigned(reg107[(1'h1):(1'h0)])) : ({(~|$unsigned(reg105)),
                  reg84} || {(~|$signed(wire96))})))
            begin
              reg107 <= $unsigned(((({wire95} ?
                  (reg100 ?
                      wire73 : wire95) : $unsigned((8'had))) > reg92[(3'h7):(1'h1)]) >>> reg103[(3'h6):(3'h6)]));
              reg108 <= $unsigned(reg84[(1'h0):(1'h0)]);
            end
          else
            begin
              reg107 <= (reg93[(3'h7):(3'h4)] != $signed((($unsigned(wire72) ?
                  reg106 : (reg105 | (8'hb0))) ~^ (wire81[(1'h1):(1'h1)] * $unsigned((7'h43))))));
              reg108 <= reg110[(3'h4):(1'h0)];
            end
          reg109 <= wire69[(3'h5):(1'h0)];
        end
      if (($unsigned((!reg101[(1'h1):(1'h1)])) ?
          $unsigned(($signed((reg82 ?
              reg114 : reg102)) >> $signed(reg104))) : wire97[(4'h8):(2'h3)]))
        begin
          reg115 <= reg104[(4'hb):(2'h3)];
          reg116 <= reg109;
        end
      else
        begin
          reg115 <= ((&$unsigned((~reg115[(3'h4):(1'h1)]))) | (-$signed((reg78[(3'h5):(1'h0)] ^ reg84[(1'h0):(1'h0)]))));
          reg116 <= $unsigned($unsigned(((7'h44) ?
              $signed($signed(reg100)) : (8'hb4))));
          reg117 <= (8'haf);
          reg118 <= ((~&wire74) ?
              ({(((8'ha3) * reg82) & reg105),
                  reg87[(1'h0):(1'h0)]} || (reg83 > ({wire79, wire96} ?
                  (wire98 >= wire79) : $unsigned(reg92)))) : (~(^~({reg91} ~^ (reg92 ?
                  wire81 : reg78)))));
        end
    end
  assign wire119 = $signed((|$unsigned((wire95[(2'h3):(2'h3)] >> $signed(reg84)))));
  assign wire120 = wire77[(3'h6):(1'h0)];
endmodule
