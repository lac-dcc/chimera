module top
#(parameter param232 = (+(((^~((8'haf) ^ (8'hb0))) ? (&((8'hb6) ? (8'ha1) : (8'had))) : (&((8'ha2) ? (8'hb2) : (8'hae)))) ? (~|({(8'hb0), (8'hb4)} ^~ ((8'had) ? (8'hba) : (8'hb8)))) : (8'ha0))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  wire [(4'hf):(1'h0)] wire223;
  wire signed [(5'h13):(1'h0)] wire225;
  wire [(5'h13):(1'h0)] wire226;
  wire [(5'h11):(1'h0)] wire227;
  wire signed [(4'hb):(1'h0)] wire228;
  wire signed [(4'hf):(1'h0)] wire229;
  wire [(3'h7):(1'h0)] wire230;
  assign y = {wire223,
                 wire225,
                 wire226,
                 wire227,
                 wire228,
                 wire229,
                 wire230,
                 (1'h0)};
  module4 #() modinst224 (.wire9(wire3), .clk(clk), .wire7(wire2), .wire6(wire1), .wire5((8'h9c)), .wire8(wire0), .y(wire223));
  assign wire225 = $unsigned({wire2[(4'ha):(3'h5)], wire1});
  assign wire226 = (~^$signed((($signed((8'hb3)) ? wire2 : wire1) >>> ((wire0 ?
                           wire3 : (7'h43)) ?
                       (wire0 ? wire0 : wire223) : $unsigned(wire1)))));
  assign wire227 = ((^~wire3[(2'h2):(1'h0)]) ?
                       $unsigned({$signed({(8'hbc),
                               wire1})}) : {(wire2 >>> wire0[(3'h4):(2'h3)]),
                           (7'h43)});
  assign wire228 = (~|(wire223 > ($signed((wire223 ~^ wire0)) ?
                       $unsigned((wire223 ?
                           (7'h43) : wire1)) : wire3[(3'h5):(1'h0)])));
  assign wire229 = wire0[(3'h7):(1'h0)];
  module4 #() modinst231 (.wire8(wire3), .clk(clk), .wire5(wire226), .wire7(wire225), .wire6(wire223), .wire9(wire0), .y(wire230));
endmodule

module module4  (y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h178):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire9;
  input wire signed [(4'hd):(1'h0)] wire8;
  input wire signed [(5'h13):(1'h0)] wire7;
  input wire [(4'hf):(1'h0)] wire6;
  input wire signed [(5'h13):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire222;
  wire [(4'h9):(1'h0)] wire221;
  wire signed [(5'h14):(1'h0)] wire216;
  wire [(3'h6):(1'h0)] wire214;
  wire signed [(2'h3):(1'h0)] wire174;
  wire [(4'hb):(1'h0)] wire153;
  wire signed [(4'hd):(1'h0)] wire96;
  wire signed [(4'hb):(1'h0)] wire63;
  wire [(5'h14):(1'h0)] wire58;
  wire [(4'hc):(1'h0)] wire19;
  wire signed [(5'h13):(1'h0)] wire18;
  wire signed [(4'hd):(1'h0)] wire17;
  wire signed [(5'h10):(1'h0)] wire14;
  wire [(5'h14):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire212;
  reg signed [(5'h12):(1'h0)] reg220 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg219 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg218 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg217 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg60 = (1'h0);
  reg [(4'hc):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg62 = (1'h0);
  assign y = {wire222,
                 wire221,
                 wire216,
                 wire214,
                 wire174,
                 wire153,
                 wire96,
                 wire63,
                 wire58,
                 wire19,
                 wire18,
                 wire17,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire212,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg16,
                 reg15,
                 reg60,
                 reg61,
                 reg62,
                 (1'h0)};
  assign wire10 = {wire6, wire9};
  assign wire11 = wire10;
  assign wire12 = wire10[(3'h7):(3'h6)];
  assign wire13 = $signed($unsigned($unsigned($unsigned((~wire9)))));
  assign wire14 = ((8'h9f) | $signed(wire10));
  always
    @(posedge clk) begin
      reg15 <= $signed((~|wire8));
      if ($unsigned((~|((((8'haa) >>> wire11) ?
          $unsigned(wire10) : wire9) * (wire8[(3'h4):(1'h1)] ?
          (wire5 == wire11) : {wire5})))))
        begin
          reg16 <= {$unsigned($signed(wire10[(2'h3):(1'h0)]))};
        end
      else
        begin
          reg16 <= wire9[(3'h7):(3'h5)];
        end
    end
  assign wire17 = $unsigned(wire7);
  assign wire18 = wire12[(4'h8):(4'h8)];
  assign wire19 = {wire13};
  module20 #() modinst59 (wire58, clk, wire7, wire8, reg15, wire9, wire6);
  always
    @(posedge clk) begin
      reg60 <= {wire13[(3'h5):(3'h4)]};
      reg61 <= (~|$signed((^~wire12[(2'h2):(1'h1)])));
      reg62 <= (^({($unsigned(reg15) ?
                  (wire10 ? wire19 : wire8) : (reg16 ? reg61 : wire12)),
              reg60[(3'h7):(1'h1)]} ?
          {((|(8'haa)) ^ (wire14 > wire6))} : wire14));
    end
  assign wire63 = wire12;
  module64 #() modinst97 (wire96, clk, wire63, reg62, wire5, wire7, wire12);
  module98 #() modinst154 (wire153, clk, wire10, wire63, reg60, wire58, wire11);
  module155 #() modinst175 (wire174, clk, wire96, wire19, wire17, wire18, wire7);
  module176 #() modinst213 (wire212, clk, wire13, wire9, reg16, reg61, wire17);
  module64 #() modinst215 (wire214, clk, reg15, wire18, wire153, wire12, wire14);
  assign wire216 = wire5[(5'h13):(5'h13)];
  always
    @(posedge clk) begin
      reg217 <= wire19;
      reg218 <= (wire5[(4'h9):(1'h0)] ?
          $signed((reg60[(3'h6):(1'h0)] ?
              reg15[(3'h4):(2'h3)] : ((wire212 > wire18) ?
                  (&wire7) : (wire7 >> wire5)))) : ((|$signed($signed(wire5))) ?
              ((+wire17) - (wire5 >= wire96[(4'h9):(1'h0)])) : (!$unsigned($signed(wire5)))));
      reg219 <= (~|(8'hb8));
      reg220 <= wire10;
    end
  assign wire221 = reg16[(4'hc):(4'ha)];
  assign wire222 = wire19;
endmodule

module module176
#(parameter param210 = {{((~|((8'hb4) && (8'hb1))) <= (((8'hae) ? (8'h9d) : (7'h40)) - ((8'ha5) ? (8'haf) : (8'hb4))))}, {(({(8'h9d), (8'h9c)} && (~(7'h41))) ~^ (!((8'hb2) ? (8'h9f) : (8'ha1)))), (&((8'h9c) << ((8'ha7) | (7'h43))))}}, 
parameter param211 = param210)
(y, clk, wire181, wire180, wire179, wire178, wire177);
  output wire [(32'h160):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire181;
  input wire [(3'h5):(1'h0)] wire180;
  input wire signed [(5'h12):(1'h0)] wire179;
  input wire [(4'hc):(1'h0)] wire178;
  input wire signed [(4'hb):(1'h0)] wire177;
  wire signed [(2'h2):(1'h0)] wire209;
  wire [(4'ha):(1'h0)] wire208;
  wire [(5'h13):(1'h0)] wire199;
  wire [(4'h9):(1'h0)] wire192;
  wire [(5'h11):(1'h0)] wire191;
  wire [(5'h13):(1'h0)] wire190;
  wire [(5'h10):(1'h0)] wire189;
  wire signed [(3'h7):(1'h0)] wire182;
  reg signed [(5'h12):(1'h0)] reg207 = (1'h0);
  reg [(5'h13):(1'h0)] reg206 = (1'h0);
  reg [(4'hb):(1'h0)] reg205 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg204 = (1'h0);
  reg [(3'h6):(1'h0)] reg203 = (1'h0);
  reg [(5'h14):(1'h0)] reg202 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg201 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg200 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg198 = (1'h0);
  reg [(4'hd):(1'h0)] reg197 = (1'h0);
  reg [(5'h14):(1'h0)] reg196 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg195 = (1'h0);
  reg [(2'h3):(1'h0)] reg194 = (1'h0);
  reg [(4'hc):(1'h0)] reg193 = (1'h0);
  reg signed [(4'he):(1'h0)] reg188 = (1'h0);
  reg [(4'hb):(1'h0)] reg187 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg185 = (1'h0);
  reg signed [(4'he):(1'h0)] reg184 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg183 = (1'h0);
  assign y = {wire209,
                 wire208,
                 wire199,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire182,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 (1'h0)};
  assign wire182 = (^~wire180);
  always
    @(posedge clk) begin
      reg183 <= (($unsigned(wire181) > ($unsigned((wire181 ?
              wire182 : wire177)) ?
          (|wire181[(3'h7):(3'h7)]) : ((^~wire181) != wire181[(4'ha):(3'h4)]))) - (wire177 ?
          (|wire177) : $signed(wire180)));
      reg184 <= wire181[(4'ha):(4'ha)];
      if ((^((~^((wire180 ? reg184 : wire181) || {(8'ha5)})) ?
          $unsigned((|(reg184 ?
              (7'h42) : wire181))) : ($signed((wire182 ~^ wire182)) != $unsigned((wire180 >>> (8'hb2)))))))
        begin
          reg185 <= (^wire178[(3'h7):(3'h4)]);
        end
      else
        begin
          reg185 <= (reg185 ^~ wire178);
          reg186 <= ($unsigned(wire177) ?
              {$unsigned((^(reg183 <= (8'hab)))),
                  (-(wire182[(3'h6):(3'h4)] * $unsigned(wire178)))} : $unsigned({((~&wire180) != {reg183})}));
          reg187 <= $unsigned(wire177);
          reg188 <= (~&wire177[(3'h5):(3'h5)]);
        end
    end
  assign wire189 = $unsigned($unsigned($signed((reg188 ?
                       $signed(wire179) : wire182[(3'h6):(3'h5)]))));
  assign wire190 = (wire179[(5'h11):(2'h3)] - (^~((~&{wire189, reg185}) ?
                       $signed((&(8'hb9))) : $signed(((8'ha3) << wire179)))));
  assign wire191 = (({(^$signed(wire182)), reg185[(4'hb):(3'h6)]} ?
                       (($unsigned(wire178) ?
                           wire177[(4'h8):(2'h2)] : wire180) <= reg184[(2'h3):(2'h2)]) : ((^$signed(reg186)) ?
                           $signed(((8'h9e) ?
                               wire181 : reg186)) : $signed(wire190))) || $signed(reg183[(1'h0):(1'h0)]));
  assign wire192 = wire178[(4'h9):(3'h6)];
  always
    @(posedge clk) begin
      if (((wire191 ?
          (|{$unsigned((8'hb0)), reg188[(3'h7):(3'h7)]}) : wire181) + ((7'h42) ?
          wire179[(3'h5):(2'h3)] : $signed(wire192[(3'h5):(3'h4)]))))
        begin
          reg193 <= (^~{(wire179[(5'h10):(4'hc)] ?
                  wire177 : (~^(wire178 & wire179)))});
          reg194 <= ((reg185 ?
              ($signed(((7'h43) - wire177)) ^ (8'hb6)) : (8'ha6)) ~^ reg183[(2'h2):(1'h1)]);
          reg195 <= $unsigned({$signed((~^(^~reg187))),
              $signed(wire189[(5'h10):(4'hc)])});
        end
      else
        begin
          reg193 <= $unsigned(wire179[(4'hf):(4'hd)]);
        end
      reg196 <= wire178;
      reg197 <= ($unsigned(reg188) > wire191[(4'hb):(2'h2)]);
      reg198 <= wire189;
    end
  assign wire199 = $unsigned(({reg198[(3'h6):(2'h2)]} > (wire180 != (~(~(8'hb5))))));
  always
    @(posedge clk) begin
      reg200 <= $unsigned(((~((~^wire177) ^~ (!reg193))) ?
          wire178 : $unsigned($signed($unsigned(wire199)))));
      reg201 <= $unsigned((|$unsigned($signed(wire180))));
      reg202 <= ((!{(|(wire190 ~^ reg185))}) ? wire178[(4'h9):(3'h5)] : reg187);
      if ((-(8'hb7)))
        begin
          reg203 <= (((~&(^~$signed(wire199))) ?
                  (reg188 ?
                      ((reg194 + reg196) ?
                          wire180 : $signed((8'hb3))) : $signed((8'hbc))) : $signed($unsigned($signed(reg200)))) ?
              ($unsigned($unsigned(reg196[(2'h3):(1'h0)])) ?
                  (reg200[(2'h3):(2'h2)] ?
                      (+$unsigned(reg200)) : ({reg201} >>> (8'ha1))) : (+(reg185[(5'h12):(4'he)] ?
                      (^~reg201) : (wire189 ?
                          reg183 : wire181)))) : $unsigned(((reg198[(2'h2):(1'h1)] ?
                      (reg193 << reg196) : {wire177, reg183}) ?
                  $unsigned($signed((8'hbe))) : $unsigned(wire181))));
          reg204 <= $unsigned(reg202[(4'h9):(4'h8)]);
          reg205 <= (($signed((reg186[(2'h3):(1'h0)] ?
              {reg185} : wire190)) < (^~{{reg196}})) > ((wire190 && $unsigned((reg198 ?
                  wire178 : wire179))) ?
              (((reg200 * (8'hba)) <= $signed((8'ha3))) ?
                  reg187 : {$unsigned(reg200)}) : (wire180[(2'h2):(1'h0)] >>> reg188[(3'h4):(3'h4)])));
          reg206 <= reg202;
        end
      else
        begin
          reg203 <= reg195;
          if ((!wire180))
            begin
              reg204 <= reg205[(1'h1):(1'h0)];
              reg205 <= $unsigned((~^($unsigned($unsigned(reg203)) >>> $unsigned($signed(reg204)))));
              reg206 <= (($unsigned((reg200[(3'h4):(1'h0)] ?
                  reg194[(1'h0):(1'h0)] : wire192[(3'h5):(1'h0)])) > (~|$signed((&reg206)))) != reg184);
              reg207 <= ($signed(($unsigned((^~(7'h43))) << (8'hb1))) ?
                  $unsigned(wire190) : {$unsigned({(|reg197), $signed(reg185)}),
                      reg193});
            end
          else
            begin
              reg204 <= (&reg203);
              reg205 <= (+(~|$signed((~|reg197))));
              reg206 <= reg206;
            end
        end
    end
  assign wire208 = $signed($unsigned(reg201));
  assign wire209 = reg187;
endmodule

module module155  (y, clk, wire160, wire159, wire158, wire157, wire156);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire160;
  input wire signed [(4'hc):(1'h0)] wire159;
  input wire [(4'hd):(1'h0)] wire158;
  input wire signed [(4'hb):(1'h0)] wire157;
  input wire [(3'h5):(1'h0)] wire156;
  wire [(4'ha):(1'h0)] wire173;
  wire [(4'hc):(1'h0)] wire172;
  wire signed [(4'hf):(1'h0)] wire171;
  wire [(5'h12):(1'h0)] wire170;
  wire [(5'h15):(1'h0)] wire169;
  wire signed [(3'h4):(1'h0)] wire168;
  wire [(5'h15):(1'h0)] wire167;
  wire signed [(5'h14):(1'h0)] wire166;
  wire [(3'h4):(1'h0)] wire165;
  wire signed [(3'h4):(1'h0)] wire164;
  wire [(4'hd):(1'h0)] wire163;
  wire [(4'h8):(1'h0)] wire162;
  wire signed [(5'h11):(1'h0)] wire161;
  assign y = {wire173,
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
                 wire161,
                 (1'h0)};
  assign wire161 = $unsigned({(-$unsigned($signed(wire160)))});
  assign wire162 = $signed($unsigned($unsigned(wire156[(2'h3):(1'h1)])));
  assign wire163 = wire158[(4'hb):(2'h2)];
  assign wire164 = ((~$unsigned({$unsigned(wire158), $signed(wire161)})) ?
                       wire161[(4'hf):(1'h1)] : {(|$unsigned(wire163[(3'h7):(2'h3)]))});
  assign wire165 = ((^wire157[(1'h0):(1'h0)]) || (-($signed((wire157 != (8'h9e))) ?
                       $signed(wire157[(2'h3):(2'h2)]) : ((wire160 ^~ wire158) ^~ wire163))));
  assign wire166 = wire156[(3'h5):(1'h0)];
  assign wire167 = (8'ha1);
  assign wire168 = $signed((wire163 < (^($unsigned(wire165) ?
                       $unsigned(wire161) : wire162))));
  assign wire169 = $unsigned((!wire166));
  assign wire170 = wire157;
  assign wire171 = $unsigned((wire159[(3'h5):(2'h3)] == (-{wire166[(3'h5):(3'h5)],
                       (8'ha2)})));
  assign wire172 = (8'ha0);
  assign wire173 = (wire172[(3'h7):(1'h0)] <<< wire166);
endmodule

module module98
#(parameter param151 = (({((!(8'hab)) ? {(8'haa)} : (~|(8'hbe)))} & ({{(8'hbd)}} >>> (((8'hb6) * (8'hba)) <<< ((8'haf) ? (8'haa) : (8'hb3))))) ~^ (|((~^((8'ha6) << (8'h9c))) > ({(8'hb4)} ? ((8'ha6) ? (8'hae) : (7'h42)) : (~(8'hbc)))))), 
parameter param152 = {{(8'hb6), param151}})
(y, clk, wire103, wire102, wire101, wire100, wire99);
  output wire [(32'h213):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire103;
  input wire [(4'h9):(1'h0)] wire102;
  input wire signed [(5'h13):(1'h0)] wire101;
  input wire [(5'h14):(1'h0)] wire100;
  input wire signed [(5'h11):(1'h0)] wire99;
  wire signed [(5'h14):(1'h0)] wire150;
  wire signed [(3'h5):(1'h0)] wire149;
  wire [(4'ha):(1'h0)] wire148;
  wire signed [(3'h4):(1'h0)] wire147;
  wire signed [(5'h11):(1'h0)] wire146;
  wire [(4'hb):(1'h0)] wire145;
  wire [(4'h9):(1'h0)] wire120;
  wire [(4'h9):(1'h0)] wire119;
  wire [(4'hf):(1'h0)] wire118;
  wire signed [(2'h2):(1'h0)] wire115;
  wire [(5'h14):(1'h0)] wire112;
  wire signed [(4'h8):(1'h0)] wire106;
  wire [(4'ha):(1'h0)] wire105;
  wire signed [(4'h8):(1'h0)] wire104;
  reg signed [(3'h6):(1'h0)] reg144 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg143 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg142 = (1'h0);
  reg signed [(4'he):(1'h0)] reg141 = (1'h0);
  reg [(4'hb):(1'h0)] reg140 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg139 = (1'h0);
  reg [(3'h7):(1'h0)] reg138 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg137 = (1'h0);
  reg [(3'h6):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg134 = (1'h0);
  reg [(4'ha):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg128 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg127 = (1'h0);
  reg [(5'h15):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg123 = (1'h0);
  reg [(4'hf):(1'h0)] reg122 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg121 = (1'h0);
  reg [(4'hd):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg114 = (1'h0);
  reg [(5'h13):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg109 = (1'h0);
  reg signed [(4'he):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg107 = (1'h0);
  assign y = {wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire120,
                 wire119,
                 wire118,
                 wire115,
                 wire112,
                 wire106,
                 wire105,
                 wire104,
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
                 reg123,
                 reg122,
                 reg121,
                 reg117,
                 reg116,
                 reg114,
                 reg113,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 (1'h0)};
  assign wire104 = $unsigned($unsigned((~|$signed($unsigned(wire102)))));
  assign wire105 = ($signed(((wire100[(4'he):(4'hc)] <<< wire103) != (((8'ha1) ?
                           (8'ha0) : wire99) ?
                       $signed(wire101) : $signed(wire99)))) << $unsigned($unsigned(((-wire101) ?
                       $signed(wire103) : $signed(wire103)))));
  assign wire106 = ((wire105 ?
                       ((^~$unsigned(wire99)) ?
                           wire104[(4'h8):(2'h3)] : wire103[(4'he):(1'h1)]) : (((8'ha2) ?
                           (wire105 ?
                               (8'haf) : wire102) : (wire99 <<< wire104)) - (~&wire99[(1'h1):(1'h0)]))) * (+((7'h41) - ((wire102 ?
                           wire103 : wire103) ?
                       wire105 : (~&wire103)))));
  always
    @(posedge clk) begin
      reg107 <= $signed($signed(wire103[(4'h8):(3'h7)]));
      reg108 <= $signed($signed($unsigned(((wire101 ? wire101 : (7'h40)) ?
          {(7'h44), wire103} : (wire103 ^ (8'hba))))));
      reg109 <= ((wire104[(2'h2):(1'h1)] ?
              $signed(wire100[(2'h3):(1'h1)]) : (^wire103[(4'hf):(3'h4)])) ?
          {wire101,
              wire100[(3'h6):(3'h4)]} : ($unsigned(wire104[(4'h8):(1'h1)]) ^~ (!$unsigned({(8'hb7)}))));
      reg110 <= (8'ha2);
    end
  always
    @(posedge clk) begin
      reg111 <= (reg108 ?
          (reg107 || reg107[(4'he):(4'hd)]) : $signed($unsigned(((wire100 ?
              wire99 : wire102) | (8'hb7)))));
    end
  assign wire112 = reg111[(4'hf):(1'h1)];
  always
    @(posedge clk) begin
      reg113 <= reg108[(4'hd):(3'h7)];
      reg114 <= $unsigned(((~&$signed(reg108[(3'h6):(3'h5)])) ?
          (($unsigned(wire105) | wire101[(1'h0):(1'h0)]) & reg113[(5'h11):(1'h0)]) : {$signed((wire100 || wire103)),
              {((8'ha5) ? wire103 : wire102), (&(8'ha9))}}));
    end
  assign wire115 = wire112[(5'h12):(3'h4)];
  always
    @(posedge clk) begin
      reg116 <= {(~^reg110[(2'h2):(2'h2)]), wire99[(4'hb):(3'h5)]};
      reg117 <= $unsigned(wire115);
    end
  assign wire118 = (reg107 ?
                       {(((~wire105) | (~&(8'hbf))) == {(wire115 && reg109),
                               $signed(reg111)}),
                           ($signed($signed(wire104)) & {{wire105, reg117},
                               {reg109}})} : $signed(((|reg107[(4'hd):(1'h1)]) ?
                           (wire100[(3'h7):(3'h6)] ?
                               (!wire101) : {wire115}) : (^(wire99 >>> wire100)))));
  assign wire119 = $unsigned(wire118);
  assign wire120 = $unsigned((reg110 >> reg116[(3'h6):(3'h5)]));
  always
    @(posedge clk) begin
      reg121 <= (($unsigned($signed($signed(wire104))) ^ (-(-wire118))) ?
          (~$unsigned($signed((8'hb8)))) : ((^~$signed(reg108[(4'hb):(3'h6)])) ?
              wire102 : wire120[(3'h7):(3'h5)]));
      reg122 <= wire120[(3'h7):(2'h2)];
      if (wire106)
        begin
          if ($unsigned((($unsigned({reg121,
                  reg111}) <= $unsigned((wire106 && (8'hb3)))) ?
              (~|((wire99 ?
                  (8'ha9) : reg121) + wire118[(3'h4):(1'h0)])) : ((reg108 * (^~wire101)) ?
                  ((wire100 <= (8'hae)) ?
                      {wire112,
                          (8'h9c)} : wire100[(4'hd):(4'h9)]) : ($unsigned(wire99) >> ((8'hb8) ?
                      wire104 : reg114))))))
            begin
              reg123 <= $signed((wire99 & $signed({(8'haf),
                  wire99[(5'h10):(4'ha)]})));
              reg124 <= ($unsigned($unsigned($unsigned(((8'ha9) ?
                  (8'h9e) : reg122)))) ^ ((($unsigned(wire119) <= $signed(reg114)) || $unsigned(wire115[(2'h2):(1'h0)])) ?
                  ($signed($signed((8'h9d))) ?
                      {(reg108 ?
                              wire118 : wire103)} : reg110[(2'h3):(2'h2)]) : reg122));
              reg125 <= (|(8'hb5));
            end
          else
            begin
              reg123 <= reg111[(4'ha):(4'ha)];
              reg124 <= $unsigned((-reg114[(4'hd):(4'hc)]));
              reg125 <= (+wire118[(4'he):(1'h1)]);
              reg126 <= wire118[(2'h3):(1'h0)];
              reg127 <= (((7'h43) <= (^~((reg109 ?
                  reg126 : (8'hb6)) < (^reg122)))) ^ reg109);
            end
          if ($signed(reg109[(1'h0):(1'h0)]))
            begin
              reg128 <= reg113;
            end
          else
            begin
              reg128 <= $signed(((~wire102) ?
                  (~|(&reg110[(4'h9):(4'h9)])) : (((~&(8'hb5)) ?
                          $signed(reg113) : (reg114 || wire119)) ?
                      ((wire101 > reg111) ^~ (~&wire118)) : reg125)));
              reg129 <= (-((~|(|{reg107, (8'h9e)})) ?
                  wire103 : wire106[(3'h5):(2'h3)]));
              reg130 <= (^~$unsigned($signed({wire115[(1'h0):(1'h0)]})));
              reg131 <= reg123[(3'h7):(1'h0)];
            end
          if (({($unsigned((wire112 ? reg110 : reg129)) ?
                      $signed(wire105[(1'h1):(1'h0)]) : reg107[(3'h5):(2'h2)])} ?
              ((reg113 ?
                  (8'hbd) : $signed((reg123 ?
                      wire115 : (8'hb4)))) ^ (!($signed(reg114) > reg130))) : $unsigned($signed(reg113[(1'h1):(1'h0)]))))
            begin
              reg132 <= (^~$signed($signed({{wire102, reg125}})));
              reg133 <= (reg122 ?
                  ($unsigned($unsigned($signed(reg114))) >= {((reg132 ?
                              wire120 : reg124) ?
                          wire106[(1'h0):(1'h0)] : (reg127 ^~ wire118))}) : reg108);
            end
          else
            begin
              reg132 <= {$signed(wire102[(1'h1):(1'h0)]),
                  ($signed($signed(((8'h9f) ? wire104 : wire100))) ?
                      (~|wire104[(3'h4):(1'h0)]) : $signed((&reg130)))};
              reg133 <= ($unsigned($signed({reg125[(5'h12):(3'h5)],
                      $signed(reg116)})) ?
                  (8'hb5) : ($unsigned((wire115 | reg113)) << ((~(reg127 ?
                          wire100 : wire102)) ?
                      (8'haf) : (^~$unsigned(reg113)))));
              reg134 <= $signed(reg133);
              reg135 <= (((!(~&reg116)) ?
                  wire103 : ({$unsigned(wire100), $unsigned(reg121)} ?
                      (^~(reg130 ?
                          reg126 : (7'h41))) : ({reg129} != $signed(wire105)))) ^~ reg123);
              reg136 <= (^(!$unsigned(reg109[(1'h0):(1'h0)])));
            end
          if (reg113)
            begin
              reg137 <= (~$signed((^~reg107)));
            end
          else
            begin
              reg137 <= reg107;
              reg138 <= $signed(reg121[(3'h4):(2'h2)]);
              reg139 <= {reg121,
                  ((reg108 <<< $unsigned(reg123[(3'h7):(1'h1)])) ^ ({(+reg123),
                          wire99[(4'hd):(2'h3)]} ?
                      ($signed(reg110) ?
                          (^~reg131) : (wire100 - reg116)) : $signed((reg110 ?
                          reg137 : wire102))))};
            end
        end
      else
        begin
          reg123 <= reg135;
          reg124 <= ($signed($unsigned($unsigned($signed(wire106)))) ^~ (~^$unsigned(($signed(reg139) || reg116))));
        end
      reg140 <= {(reg111 ?
              (8'hbc) : $signed(($unsigned(reg107) ?
                  reg125[(5'h14):(4'hb)] : ((8'ha7) || reg117)))),
          (8'ha2)};
      reg141 <= (&reg113);
    end
  always
    @(posedge clk) begin
      reg142 <= $signed(reg124[(3'h6):(2'h2)]);
      reg143 <= $unsigned($signed((&(&(wire100 ? (7'h42) : reg116)))));
      reg144 <= $unsigned((8'ha4));
    end
  assign wire145 = (($unsigned(((~reg136) >> reg111[(5'h13):(5'h13)])) >= (reg108 >> reg142)) ?
                       $unsigned($unsigned($unsigned(wire112))) : reg130);
  assign wire146 = reg129[(1'h1):(1'h0)];
  assign wire147 = (&(&$unsigned($unsigned((^~reg128)))));
  assign wire148 = ({$signed(reg137[(3'h5):(2'h3)])} ?
                       wire146 : $signed((~wire112[(3'h7):(1'h0)])));
  assign wire149 = (($signed((-reg137)) >> (8'hb1)) ^~ (~^(((8'hb2) >> (~^reg116)) >> $unsigned(reg141[(4'ha):(3'h4)]))));
  assign wire150 = (~&reg116);
endmodule

module module64
#(parameter param95 = ((((((8'ha0) <<< (8'hba)) ? ((8'hab) != (8'haa)) : {(8'haa)}) ? (~|((8'hb0) ? (8'hb3) : (8'hae))) : (((8'had) >= (8'hb1)) ? (&(8'hb0)) : (+(8'ha4)))) ? (^(((8'hb1) ? (8'ha1) : (8'hb4)) ? ((8'hbd) != (7'h40)) : ((8'ha6) ? (8'hb3) : (8'hb2)))) : ((((8'haf) ? (8'h9f) : (8'hb7)) <= ((8'hb6) ? (7'h44) : (8'ha0))) <<< (((8'hac) ? (7'h43) : (8'hb5)) ? (&(8'hb4)) : ((8'h9e) ? (8'hb6) : (8'hbe))))) ? (^~(|(^~(7'h43)))) : {(+{(^~(7'h40)), {(8'hbe), (7'h42)}}), ((^~((8'hb1) ? (8'hab) : (8'ha3))) ? (8'hb1) : (^(^~(8'hba))))}))
(y, clk, wire69, wire68, wire67, wire66, wire65);
  output wire [(32'h12d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire69;
  input wire [(4'h9):(1'h0)] wire68;
  input wire signed [(4'h9):(1'h0)] wire67;
  input wire signed [(4'hb):(1'h0)] wire66;
  input wire signed [(4'h8):(1'h0)] wire65;
  wire [(5'h12):(1'h0)] wire94;
  wire signed [(5'h15):(1'h0)] wire93;
  wire [(3'h4):(1'h0)] wire76;
  wire [(4'hb):(1'h0)] wire75;
  wire [(3'h4):(1'h0)] wire74;
  wire signed [(5'h13):(1'h0)] wire73;
  wire [(5'h10):(1'h0)] wire72;
  wire [(4'h8):(1'h0)] wire71;
  wire signed [(4'ha):(1'h0)] wire70;
  reg signed [(3'h4):(1'h0)] reg92 = (1'h0);
  reg [(4'he):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg89 = (1'h0);
  reg [(4'hc):(1'h0)] reg88 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg87 = (1'h0);
  reg [(4'hf):(1'h0)] reg86 = (1'h0);
  reg [(3'h4):(1'h0)] reg85 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg84 = (1'h0);
  reg [(4'hd):(1'h0)] reg83 = (1'h0);
  reg [(4'hd):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg80 = (1'h0);
  reg [(5'h12):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg77 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
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
                 (1'h0)};
  assign wire70 = $signed(($signed(((&wire67) >> wire66)) >= ((~(wire67 ?
                      (8'ha2) : wire67)) <<< wire66)));
  assign wire71 = (wire70 ? wire65 : wire69);
  assign wire72 = (&($signed($unsigned(wire70)) ?
                      $unsigned(wire68) : {wire65[(4'h8):(3'h5)],
                          (~|{wire66, wire65})}));
  assign wire73 = {((+$signed($unsigned(wire65))) ?
                          ($signed(wire68) ?
                              ((wire68 ^ wire70) ?
                                  (+wire69) : wire72) : wire70) : wire65[(3'h4):(2'h2)]),
                      ((($unsigned(wire72) + (wire65 >> wire70)) ?
                          ((wire69 ? wire65 : (7'h44)) ?
                              wire72[(4'h9):(2'h3)] : (7'h40)) : $signed($signed(wire66))) | wire72[(4'ha):(4'h9)])};
  assign wire74 = $signed((($signed((8'hb1)) ? wire65 : (+$unsigned(wire68))) ?
                      (wire73[(5'h13):(5'h13)] >>> $unsigned($signed((8'hb8)))) : $signed(({wire65} >>> wire68[(1'h1):(1'h0)]))));
  assign wire75 = wire68[(4'h8):(2'h2)];
  assign wire76 = (~|{(+($unsigned(wire72) || $signed(wire65))),
                      (($unsigned((8'hbc)) ?
                          (^~wire65) : wire67) != $signed($unsigned(wire67)))});
  always
    @(posedge clk) begin
      reg77 <= $unsigned(wire74);
      if ((wire70 << (wire65[(2'h2):(1'h0)] ^~ (8'hb2))))
        begin
          reg78 <= $unsigned((wire73[(4'hf):(4'hc)] + $unsigned({$signed(wire75),
              {wire70}})));
          reg79 <= (!wire69[(2'h3):(2'h2)]);
          reg80 <= $signed(wire74[(2'h3):(1'h0)]);
          reg81 <= ($unsigned(wire76[(1'h0):(1'h0)]) ?
              (~&reg79) : ($unsigned((7'h40)) >= {wire71[(1'h1):(1'h0)],
                  wire70[(2'h3):(2'h3)]}));
          reg82 <= ((wire76 >> (wire73[(4'hc):(3'h4)] ?
              reg79[(4'h9):(1'h1)] : ($signed(wire76) != reg81[(4'hb):(3'h5)]))) ~^ (($unsigned({wire69}) ^ wire66[(4'hb):(3'h4)]) ?
              (~&$signed(wire70)) : {(!(!(8'ha9)))}));
        end
      else
        begin
          reg78 <= $signed((8'hbc));
          reg79 <= (wire75[(1'h0):(1'h0)] > reg80[(3'h7):(2'h3)]);
        end
      if (wire71)
        begin
          reg83 <= reg82;
          if (reg78[(3'h7):(1'h1)])
            begin
              reg84 <= (((!($unsigned(wire70) ^ wire67[(4'h9):(3'h5)])) ?
                  reg80[(3'h5):(3'h4)] : reg78) > wire76[(2'h3):(1'h1)]);
              reg85 <= (wire71[(4'h8):(2'h3)] ?
                  $signed(wire68) : $signed((-({wire74,
                      (8'hb6)} <<< (^(8'ha4))))));
              reg86 <= (|$unsigned((((wire76 ?
                  (8'ha2) : reg81) + (-wire71)) != (&{reg84, wire65}))));
            end
          else
            begin
              reg84 <= reg79[(5'h12):(4'h8)];
              reg85 <= wire71;
              reg86 <= {$unsigned((|reg84[(2'h2):(1'h0)])),
                  (+$signed((|(wire67 + reg78))))};
            end
          reg87 <= ($unsigned((((wire71 ? (8'haf) : wire74) ?
                  (wire75 >= reg77) : (reg79 ? wire74 : reg78)) ?
              $unsigned({(8'hbd), (7'h43)}) : $signed((reg78 ?
                  reg84 : wire67)))) <<< (^~reg84[(3'h4):(3'h4)]));
          if (($unsigned($unsigned(wire76)) << reg81))
            begin
              reg88 <= ($signed($signed({(|wire69), (~&wire75)})) ?
                  ($signed(($signed(wire74) >>> wire71[(2'h3):(1'h0)])) * $unsigned($signed((reg83 ?
                      wire70 : (8'hab))))) : reg77);
              reg89 <= reg78[(4'hd):(4'ha)];
              reg90 <= (8'had);
              reg91 <= $signed((|($signed(reg86) != (reg80[(1'h0):(1'h0)] ?
                  (^reg78) : wire65[(4'h8):(1'h0)]))));
              reg92 <= (~|($unsigned((~(wire68 ?
                  wire75 : wire74))) >= (~^($unsigned(reg84) ?
                  $unsigned(reg89) : reg77))));
            end
          else
            begin
              reg88 <= ((&$unsigned($signed((reg86 ?
                  reg91 : (8'hae))))) * (wire72 ?
                  (((wire65 << reg89) <<< $signed(reg82)) ^~ wire69) : wire69));
              reg89 <= ($unsigned($signed((7'h44))) || (reg84[(1'h0):(1'h0)] < $unsigned(((&reg84) + (-reg87)))));
              reg90 <= (&(((reg81[(1'h1):(1'h1)] ?
                      $unsigned(wire65) : wire76[(1'h1):(1'h1)]) != reg84[(3'h4):(1'h0)]) ?
                  reg78[(3'h6):(1'h1)] : ((8'h9c) && reg77)));
            end
        end
      else
        begin
          if ({wire67})
            begin
              reg83 <= $unsigned(reg86);
              reg84 <= ($unsigned(($signed($signed(reg90)) ?
                  reg85[(1'h1):(1'h0)] : {((8'h9c) ? (8'hb0) : reg88),
                      (+wire65)})) ^ $unsigned((~^(wire68 - wire74[(1'h1):(1'h0)]))));
              reg85 <= $unsigned((8'h9f));
              reg86 <= $signed(wire72[(5'h10):(4'hb)]);
            end
          else
            begin
              reg83 <= {reg88,
                  (reg84[(1'h0):(1'h0)] < {$signed($unsigned(wire73)),
                      (wire75 >= ((8'h9d) > reg89))})};
              reg84 <= $unsigned($signed(($signed(reg90) <= ($signed(reg89) - (wire66 ^ reg83)))));
              reg85 <= ((reg92 ?
                  ($signed((8'hab)) ?
                      ($unsigned(reg85) ?
                          reg84[(4'ha):(2'h2)] : (~&(8'hb9))) : wire69) : (wire74 >>> wire73)) == wire69[(1'h1):(1'h1)]);
              reg86 <= ($unsigned(wire75[(3'h5):(3'h5)]) <= (reg85[(2'h3):(2'h3)] ?
                  {wire73[(3'h6):(3'h4)], reg86} : (wire73[(4'ha):(2'h2)] ?
                      ((wire66 ?
                          reg91 : wire68) ~^ reg91[(4'ha):(1'h0)]) : $unsigned((~reg78)))));
            end
        end
    end
  assign wire93 = $unsigned(wire76);
  assign wire94 = (+$signed((~&(~reg90))));
endmodule

module module20
#(parameter param57 = (^~(-((-(^~(8'ha1))) + (^(~(8'hbc)))))))
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h183):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire25;
  input wire signed [(4'h8):(1'h0)] wire24;
  input wire signed [(2'h3):(1'h0)] wire23;
  input wire [(3'h6):(1'h0)] wire22;
  input wire [(4'hf):(1'h0)] wire21;
  wire signed [(4'hf):(1'h0)] wire56;
  wire [(4'hf):(1'h0)] wire55;
  wire signed [(5'h11):(1'h0)] wire54;
  wire [(4'he):(1'h0)] wire53;
  wire [(5'h10):(1'h0)] wire52;
  wire [(4'hc):(1'h0)] wire51;
  wire signed [(4'ha):(1'h0)] wire50;
  wire [(2'h3):(1'h0)] wire39;
  wire signed [(5'h12):(1'h0)] wire38;
  wire [(5'h12):(1'h0)] wire35;
  wire [(5'h14):(1'h0)] wire34;
  wire [(4'h8):(1'h0)] wire33;
  wire [(4'hc):(1'h0)] wire32;
  wire signed [(2'h2):(1'h0)] wire31;
  wire signed [(2'h3):(1'h0)] wire30;
  wire [(2'h2):(1'h0)] wire29;
  wire [(4'hd):(1'h0)] wire28;
  wire signed [(4'hd):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire26;
  reg signed [(3'h7):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg48 = (1'h0);
  reg [(5'h15):(1'h0)] reg47 = (1'h0);
  reg [(4'h9):(1'h0)] reg46 = (1'h0);
  reg signed [(4'he):(1'h0)] reg45 = (1'h0);
  reg [(4'hb):(1'h0)] reg44 = (1'h0);
  reg [(4'ha):(1'h0)] reg43 = (1'h0);
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg [(5'h10):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(4'hf):(1'h0)] reg36 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire39,
                 wire38,
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
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire26 = wire22[(3'h4):(3'h4)];
  assign wire27 = wire24[(3'h5):(1'h1)];
  assign wire28 = wire25[(4'h9):(4'h9)];
  assign wire29 = $unsigned((((~|(~^wire22)) ? wire27 : wire22) ?
                      $signed($unsigned({(7'h42)})) : wire21[(2'h3):(2'h3)]));
  assign wire30 = ($unsigned((+(wire22 << $signed(wire25)))) ?
                      (!$signed({{wire25,
                              wire21}})) : (~&(^(+$signed(wire22)))));
  assign wire31 = wire22[(3'h4):(2'h3)];
  assign wire32 = wire27[(1'h1):(1'h0)];
  assign wire33 = $signed(((!{{wire31, wire29}}) ?
                      wire31 : $signed((wire25 ?
                          ((8'h9c) <<< wire31) : $unsigned(wire31)))));
  assign wire34 = ($signed($unsigned($unsigned($signed((8'ha8))))) ?
                      (8'h9f) : $unsigned($signed($signed((wire26 + (8'had))))));
  assign wire35 = (+$signed($unsigned(((&wire27) ?
                      (wire27 ^ wire23) : wire24[(1'h1):(1'h1)]))));
  always
    @(posedge clk) begin
      reg36 <= (wire32[(2'h2):(1'h1)] - {(wire21 - (&(wire23 ~^ wire31)))});
      reg37 <= wire23[(2'h2):(1'h0)];
    end
  assign wire38 = $unsigned(reg36);
  assign wire39 = $unsigned((+(wire28[(2'h3):(2'h3)] <<< $unsigned(wire35[(4'hd):(3'h7)]))));
  always
    @(posedge clk) begin
      reg40 <= $signed($unsigned($signed($unsigned({wire26}))));
      reg41 <= ({(((wire28 ? (8'hb4) : wire22) ^~ reg40[(1'h1):(1'h0)]) ?
              $signed((~&wire25)) : (8'ha3)),
          wire25} > ((^~wire30[(2'h2):(1'h0)]) ?
          wire23[(1'h0):(1'h0)] : reg37[(2'h3):(1'h0)]));
      reg42 <= $signed(($signed(((wire22 ? wire38 : wire34) ?
              wire35 : $signed(wire33))) ?
          (wire29[(1'h0):(1'h0)] >= {wire21[(3'h4):(2'h3)],
              reg41[(4'h9):(3'h7)]}) : {(8'hb9), wire35}));
      reg43 <= (|(wire23 ? $unsigned(wire29[(2'h2):(1'h1)]) : wire27));
      if ($unsigned($signed(reg40)))
        begin
          reg44 <= ((wire31[(1'h1):(1'h0)] ?
                  {reg37[(4'hc):(3'h4)]} : ((~^reg42) ?
                      (wire29[(1'h1):(1'h0)] != (~|wire29)) : (wire27[(4'h9):(3'h7)] ?
                          $unsigned(reg41) : (~|(8'hb8))))) ?
              (|reg40[(2'h3):(1'h0)]) : (!(&($unsigned(reg42) ^~ $signed(wire25)))));
          if ((-$unsigned(wire34[(1'h0):(1'h0)])))
            begin
              reg45 <= {(^~wire39)};
              reg46 <= (^~$signed($signed(wire25)));
            end
          else
            begin
              reg45 <= (reg44[(3'h4):(2'h3)] <= reg36[(4'h9):(3'h4)]);
            end
          reg47 <= $unsigned((8'hb6));
          reg48 <= $unsigned($signed((-(~|wire26[(1'h0):(1'h0)]))));
          reg49 <= wire38;
        end
      else
        begin
          if (((reg43 ~^ $signed((^(!(8'ha8))))) ?
              ((~&$unsigned((wire24 ? wire29 : reg47))) ?
                  reg37 : (~&reg44)) : ($unsigned((^{reg44, wire33})) ?
                  wire27 : (!((wire29 ? reg45 : wire39) ?
                      $signed(reg40) : (^wire23))))))
            begin
              reg44 <= reg36[(3'h6):(3'h4)];
              reg45 <= wire26;
              reg46 <= (|{((|{reg46}) ? wire34[(4'hf):(3'h7)] : wire28),
                  {wire39[(1'h1):(1'h0)], (~&{wire28})}});
              reg47 <= {wire25[(3'h7):(1'h0)]};
              reg48 <= (reg45 << (&{(-$unsigned(wire33))}));
            end
          else
            begin
              reg44 <= (8'had);
            end
          reg49 <= $unsigned($signed(((8'hb9) >> $unsigned({(8'haf), reg36}))));
        end
    end
  assign wire50 = wire21[(4'h8):(3'h4)];
  assign wire51 = wire38;
  assign wire52 = $unsigned(((wire23[(2'h3):(2'h3)] ?
                          {((8'hbd) >> reg44), wire30} : $signed((&reg49))) ?
                      wire31 : $signed(reg46)));
  assign wire53 = (!(wire21[(4'hd):(2'h2)] - ($unsigned((reg44 ?
                          (8'hbc) : wire22)) ?
                      ($signed((8'ha3)) && {wire31,
                          reg37}) : $signed((^~reg48)))));
  assign wire54 = ((^wire26) < reg37[(2'h3):(1'h0)]);
  assign wire55 = reg36[(3'h4):(1'h1)];
  assign wire56 = wire22;
endmodule
