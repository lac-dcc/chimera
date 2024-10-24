module top
#(parameter param225 = (^(^((((8'haa) ? (8'hac) : (8'hba)) ? (~(8'hac)) : ((8'hb7) != (8'hab))) ? ((7'h41) ? (+(8'ha9)) : (8'hbe)) : {((8'hb0) ? (8'hb7) : (8'ha1)), ((8'ha4) ? (8'h9c) : (8'h9f))}))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1ba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire3;
  wire [(4'h9):(1'h0)] wire208;
  wire [(5'h12):(1'h0)] wire197;
  wire signed [(4'h9):(1'h0)] wire193;
  wire signed [(4'h9):(1'h0)] wire191;
  wire [(5'h13):(1'h0)] wire122;
  wire [(5'h15):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire120;
  reg signed [(5'h15):(1'h0)] reg224 = (1'h0);
  reg [(4'hf):(1'h0)] reg223 = (1'h0);
  reg [(4'h9):(1'h0)] reg222 = (1'h0);
  reg [(2'h2):(1'h0)] reg221 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg220 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg219 = (1'h0);
  reg [(5'h12):(1'h0)] reg218 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg217 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg216 = (1'h0);
  reg [(4'hb):(1'h0)] reg215 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg214 = (1'h0);
  reg [(3'h6):(1'h0)] reg213 = (1'h0);
  reg [(4'h8):(1'h0)] reg212 = (1'h0);
  reg [(4'hc):(1'h0)] reg211 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg210 = (1'h0);
  reg [(5'h13):(1'h0)] reg209 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg207 = (1'h0);
  reg [(4'hf):(1'h0)] reg206 = (1'h0);
  reg [(4'hb):(1'h0)] reg205 = (1'h0);
  reg [(4'hb):(1'h0)] reg204 = (1'h0);
  reg [(5'h10):(1'h0)] reg203 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg202 = (1'h0);
  reg [(5'h12):(1'h0)] reg201 = (1'h0);
  reg [(3'h4):(1'h0)] reg200 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg199 = (1'h0);
  reg [(4'h8):(1'h0)] reg194 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg195 = (1'h0);
  reg [(4'h9):(1'h0)] reg196 = (1'h0);
  assign y = {wire208,
                 wire197,
                 wire193,
                 wire191,
                 wire122,
                 wire25,
                 wire27,
                 wire120,
                 reg224,
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
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg194,
                 reg195,
                 reg196,
                 (1'h0)};
  module4 #() modinst26 (.y(wire25), .wire6(wire2), .wire7(wire3), .wire5(wire0), .clk(clk), .wire8(wire1));
  assign wire27 = (wire0 ?
                      ($unsigned((wire25 ?
                          (wire3 >>> wire1) : (wire25 <= wire25))) ^ (((^wire1) ?
                              (wire0 == wire25) : $signed(wire3)) ?
                          $unsigned(wire2) : (wire3[(4'h8):(1'h1)] ~^ (|wire3)))) : ((~|{(wire25 ?
                                  wire0 : wire25),
                              (wire25 << wire3)}) ?
                          (^$unsigned((-wire3))) : (+(!(&wire2)))));
  module28 #() modinst121 (wire120, clk, wire25, wire3, wire1, wire0, wire2);
  assign wire122 = $unsigned($unsigned((~((~^wire27) ?
                       $signed(wire1) : $signed(wire2)))));
  module123 #() modinst192 (wire191, clk, wire25, wire120, wire27, wire122);
  assign wire193 = (~|((|wire27[(1'h0):(1'h0)]) ?
                       (^~wire120[(4'ha):(3'h6)]) : ($signed($signed(wire3)) != $unsigned($unsigned(wire0)))));
  always
    @(posedge clk) begin
      reg194 <= (8'hac);
    end
  always
    @(posedge clk) begin
      reg195 <= $signed(wire27[(1'h0):(1'h0)]);
      reg196 <= wire191;
    end
  module28 #() modinst198 (wire197, clk, wire191, wire2, reg196, wire25, wire122);
  always
    @(posedge clk) begin
      reg199 <= ((~^(~wire2[(1'h1):(1'h1)])) ?
          (|(~^wire120)) : (^~{(|$signed(wire191)),
              (wire25[(1'h1):(1'h0)] < wire197)}));
      reg200 <= {$signed(($unsigned((wire2 ? (8'ha9) : wire191)) ?
              (~^{wire0, wire193}) : (~|$signed((8'hb9))))),
          {wire25[(4'hb):(3'h6)], $signed($unsigned((!wire191)))}};
      reg201 <= ($signed($unsigned($unsigned((reg195 ? wire191 : wire191)))) ?
          {$unsigned((wire120 ^ {wire193}))} : {(((|wire25) ~^ wire3) != $signed($unsigned(wire3))),
              (~|(reg195 ? $unsigned(wire25) : $signed(wire1)))});
      reg202 <= (|reg196[(2'h2):(1'h0)]);
      if ($unsigned((((~|$signed(wire122)) && (8'ha1)) >> reg194)))
        begin
          reg203 <= reg199;
          reg204 <= (~(({(wire122 << wire1)} ?
              {$unsigned(wire2)} : wire120[(2'h2):(1'h0)]) ^~ wire0));
          reg205 <= reg196;
          reg206 <= $unsigned(reg200);
          reg207 <= (reg201 <= $signed(($signed(wire2) ?
              ($unsigned(reg201) >> (~reg206)) : ($signed(wire122) ?
                  $unsigned(reg194) : wire1[(3'h6):(1'h1)]))));
        end
      else
        begin
          reg203 <= (+wire120[(4'hc):(3'h6)]);
          if ((~|reg201))
            begin
              reg204 <= ({$signed(reg195[(2'h3):(2'h3)])} != wire2[(4'ha):(4'h9)]);
            end
          else
            begin
              reg204 <= reg196[(4'h9):(3'h4)];
              reg205 <= (^(wire191 ? (|wire27[(3'h7):(3'h5)]) : (|wire27)));
              reg206 <= {{wire197[(2'h2):(2'h2)]}};
            end
        end
    end
  assign wire208 = $signed({$unsigned({$unsigned(reg203),
                           $unsigned(wire193)})});
  always
    @(posedge clk) begin
      reg209 <= reg201;
      if ({wire208[(3'h6):(2'h3)], $signed(reg196)})
        begin
          reg210 <= wire3;
          reg211 <= (($signed(wire122) ?
                  ($signed((reg206 ? wire193 : reg201)) ^ ((reg195 ?
                      wire2 : reg203) > reg200)) : $signed({(!reg210)})) ?
              wire193[(1'h0):(1'h0)] : ($unsigned((8'h9c)) ?
                  (((reg210 + reg206) ?
                      wire2 : $unsigned(reg196)) <<< $signed(reg200[(3'h4):(1'h1)])) : (reg206[(4'ha):(1'h1)] ?
                      (-((8'hb4) + (8'h9f))) : (reg207[(3'h4):(2'h2)] >= reg194))));
          reg212 <= $signed(((^{$unsigned(reg199)}) > ((wire191[(3'h6):(1'h1)] < wire1) < reg210)));
          reg213 <= (wire208[(3'h4):(1'h1)] ?
              (reg200[(3'h4):(1'h0)] > $unsigned((+wire120[(1'h1):(1'h0)]))) : (((reg194[(3'h7):(3'h5)] ?
                      wire197 : $signed((8'hbb))) ?
                  $unsigned($signed(reg201)) : reg206) + $signed($unsigned((~reg212)))));
        end
      else
        begin
          reg210 <= wire3[(3'h7):(3'h6)];
          reg211 <= ({(!(-((8'ha1) ? reg203 : wire120))),
                  wire0[(2'h3):(1'h0)]} ?
              (!(wire27 ?
                  ($unsigned(wire27) * (~^wire0)) : (wire191[(1'h1):(1'h0)] << (!wire120)))) : wire25);
          reg212 <= ((8'hb4) <<< (~|$signed(($unsigned(wire193) & (reg195 ?
              reg195 : wire27)))));
        end
      if (reg195[(3'h4):(1'h0)])
        begin
          if ($unsigned($signed(wire191[(3'h4):(2'h2)])))
            begin
              reg214 <= {(~|(8'hbb)),
                  ($signed((~wire3)) ? $unsigned(reg194) : $signed((8'h9f)))};
            end
          else
            begin
              reg214 <= $unsigned($signed((({wire122, reg210} ?
                      $signed(reg201) : $unsigned((8'h9c))) ?
                  $unsigned({wire25}) : reg194[(2'h2):(2'h2)])));
            end
          reg215 <= reg209[(4'h8):(1'h0)];
          reg216 <= ((8'hac) + ((~((wire120 > reg199) ?
                  (^~wire25) : $signed(wire122))) ?
              $unsigned(wire122[(1'h1):(1'h1)]) : reg200[(2'h3):(1'h1)]));
          reg217 <= (wire1[(3'h4):(2'h2)] ?
              (-wire2[(1'h1):(1'h0)]) : ((reg210 ?
                      $signed((wire25 ? reg211 : (8'hb2))) : $signed(((7'h42) ?
                          reg210 : reg206))) ?
                  wire122[(4'hb):(3'h6)] : $signed(wire1[(1'h1):(1'h1)])));
          if (({(&{reg216[(3'h6):(1'h1)]})} ?
              $signed((~^{reg194[(3'h6):(3'h6)],
                  reg194[(1'h1):(1'h0)]})) : (-reg214[(4'he):(3'h7)])))
            begin
              reg218 <= reg217;
              reg219 <= reg218;
            end
          else
            begin
              reg218 <= ($unsigned($unsigned(wire3[(2'h2):(1'h0)])) >= ($signed(reg211[(3'h4):(1'h1)]) ?
                  $signed((~(^wire122))) : $signed($signed(reg195))));
              reg219 <= $signed($signed(({reg196} || $unsigned($unsigned(wire27)))));
              reg220 <= reg200;
              reg221 <= ((-($signed((8'hb4)) ?
                      $signed(((8'ha2) ? reg206 : reg206)) : (-(+reg206)))) ?
                  reg203[(4'hc):(3'h6)] : reg214[(5'h10):(4'hf)]);
              reg222 <= ($signed((((reg210 ?
                      reg210 : reg194) <<< reg202[(3'h4):(1'h1)]) <<< ((~&reg221) ~^ reg210[(3'h4):(1'h1)]))) ?
                  wire197 : (^(+$signed((reg199 ? wire27 : wire0)))));
            end
        end
      else
        begin
          reg214 <= $signed((-($signed((&wire191)) && $signed((reg201 + reg222)))));
        end
      if (reg200)
        begin
          reg223 <= reg210;
        end
      else
        begin
          reg223 <= ({wire3[(3'h4):(2'h3)], (!wire197)} ?
              {(wire27 ^~ ((~|reg203) ?
                      (reg217 < (8'h9f)) : (reg214 <= wire0))),
                  (wire3 - (reg213 * (+(8'ha8))))} : {reg209[(1'h1):(1'h0)]});
        end
      reg224 <= $unsigned((~^$signed(($signed(wire208) & reg203))));
    end
endmodule

module module123
#(parameter param189 = (((({(8'hb9)} >= ((7'h42) ? (8'ha6) : (8'ha0))) ? (~^{(8'hb2), (8'hb4)}) : (!((7'h42) || (8'hbf)))) - (((-(8'ha3)) ? (^~(8'hb8)) : {(7'h41), (8'hb9)}) ? (((8'ha8) ? (8'hb7) : (8'hb2)) ? ((8'hb4) ? (7'h44) : (8'hb9)) : ((8'hb6) <<< (7'h42))) : (((8'ha3) ? (8'ha7) : (8'had)) ? ((8'h9c) ? (8'h9c) : (8'hb0)) : (^~(8'h9c))))) != ((+(~^((8'hba) >> (7'h41)))) ? ({{(8'h9f), (8'ha8)}} << ((&(8'hab)) ^~ ((8'hb5) ? (8'haa) : (8'ha2)))) : (~&(~|{(7'h41), (8'hb4)})))), 
parameter param190 = (8'ha3))
(y, clk, wire127, wire126, wire125, wire124);
  output wire [(32'h112):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire127;
  input wire signed [(2'h2):(1'h0)] wire126;
  input wire signed [(4'h9):(1'h0)] wire125;
  input wire [(5'h13):(1'h0)] wire124;
  wire [(4'hc):(1'h0)] wire188;
  wire signed [(3'h5):(1'h0)] wire183;
  wire [(4'h9):(1'h0)] wire182;
  wire signed [(5'h12):(1'h0)] wire181;
  wire signed [(4'h9):(1'h0)] wire175;
  wire [(3'h6):(1'h0)] wire173;
  wire signed [(4'h9):(1'h0)] wire134;
  wire [(5'h14):(1'h0)] wire133;
  wire signed [(5'h14):(1'h0)] wire132;
  wire [(4'h9):(1'h0)] wire131;
  wire [(4'hb):(1'h0)] wire130;
  wire signed [(3'h4):(1'h0)] wire129;
  wire [(5'h11):(1'h0)] wire128;
  reg [(5'h11):(1'h0)] reg187 = (1'h0);
  reg [(4'hd):(1'h0)] reg186 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg185 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg180 = (1'h0);
  reg [(3'h4):(1'h0)] reg179 = (1'h0);
  reg [(5'h11):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg176 = (1'h0);
  assign y = {wire188,
                 wire183,
                 wire182,
                 wire181,
                 wire175,
                 wire173,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 (1'h0)};
  assign wire128 = $unsigned($signed((8'hbb)));
  assign wire129 = wire127[(1'h0):(1'h0)];
  assign wire130 = wire127;
  assign wire131 = wire125[(3'h7):(2'h2)];
  assign wire132 = $unsigned((wire125[(3'h5):(1'h1)] ?
                       wire126 : $unsigned($unsigned((~^wire128)))));
  assign wire133 = wire126[(2'h2):(1'h1)];
  assign wire134 = {(+($unsigned(((8'hbd) ? wire124 : wire132)) ?
                           wire130[(4'h9):(3'h6)] : wire128)),
                       (wire129[(1'h0):(1'h0)] ?
                           ($signed(wire124[(3'h7):(3'h6)]) | wire132[(1'h1):(1'h1)]) : ((&{wire131,
                                   wire131}) ?
                               (~(wire131 ?
                                   wire133 : (8'h9c))) : $signed((~&wire130))))};
  module135 #() modinst174 (.wire138(wire134), .clk(clk), .wire136(wire133), .wire137(wire132), .wire139(wire127), .y(wire173));
  assign wire175 = $unsigned(({$signed((~wire131))} ?
                       wire127[(2'h3):(1'h1)] : wire134[(3'h4):(1'h0)]));
  always
    @(posedge clk) begin
      if ($signed((+(wire133[(4'hc):(4'hc)] ^~ ((!wire134) ?
          $signed(wire124) : (|wire129))))))
        begin
          reg176 <= wire126;
          reg177 <= $signed(wire175[(2'h2):(1'h1)]);
          reg178 <= wire127;
          reg179 <= (|wire131);
        end
      else
        begin
          reg176 <= reg179;
          reg177 <= (~|{(((wire125 ? (8'hb8) : reg179) + (8'hac)) ?
                  (|(^~reg179)) : ((reg177 ^ wire134) ?
                      wire127[(4'h8):(1'h0)] : (!wire129))),
              {$signed((-reg178))}});
          reg178 <= (&reg178);
          reg179 <= (wire125[(2'h2):(1'h1)] - ((~&$unsigned(wire132[(5'h11):(4'he)])) ?
              reg177[(4'h9):(2'h3)] : $unsigned(wire131[(2'h2):(1'h0)])));
        end
      reg180 <= $signed(($unsigned({(~|wire124)}) && {wire130[(1'h0):(1'h0)]}));
    end
  assign wire181 = reg179[(1'h1):(1'h0)];
  assign wire182 = ((~^(wire130 ?
                       ({(8'haf), wire181} ?
                           (wire129 ?
                               wire173 : wire124) : (-reg180)) : ($unsigned(wire173) ^ wire130))) | $signed(($signed(((8'hbe) <= wire132)) ?
                       (reg180 ? reg180 : reg178) : ({reg178, wire125} ?
                           $unsigned(reg177) : (wire129 | wire125)))));
  assign wire183 = (8'haa);
  always
    @(posedge clk) begin
      if ((wire132 && {{($signed(wire175) ?
                  (reg176 ? wire126 : wire124) : reg176),
              ($unsigned(wire133) ? wire181[(4'ha):(4'h8)] : $signed(reg178))},
          wire182[(4'h8):(2'h2)]}))
        begin
          reg184 <= (wire124[(4'hc):(4'ha)] || wire181);
        end
      else
        begin
          reg184 <= {(wire181 && reg176[(3'h6):(1'h1)])};
          reg185 <= (wire173[(3'h5):(1'h0)] & wire182);
          reg186 <= $signed((-reg179[(2'h3):(1'h0)]));
          reg187 <= (!(wire182 << (&wire127[(5'h14):(4'hf)])));
        end
    end
  assign wire188 = wire181[(3'h5):(1'h0)];
endmodule

module module28
#(parameter param119 = (!(((((8'hbf) ? (8'hbf) : (8'h9f)) ? ((8'hbb) ? (8'h9c) : (8'hb8)) : (8'haf)) < {(|(8'h9e)), (~&(8'hbb))}) * (~&(!{(8'haa), (8'ha4)})))))
(y, clk, wire29, wire30, wire31, wire32, wire33);
  output wire [(32'h29b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire29;
  input wire signed [(3'h4):(1'h0)] wire30;
  input wire [(4'h8):(1'h0)] wire31;
  input wire [(5'h12):(1'h0)] wire32;
  input wire signed [(4'ha):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire118;
  wire [(2'h2):(1'h0)] wire117;
  wire [(2'h2):(1'h0)] wire116;
  wire signed [(3'h6):(1'h0)] wire115;
  wire signed [(4'h8):(1'h0)] wire104;
  wire signed [(4'h9):(1'h0)] wire102;
  wire [(4'hd):(1'h0)] wire101;
  wire signed [(5'h13):(1'h0)] wire49;
  wire signed [(2'h2):(1'h0)] wire73;
  wire signed [(5'h15):(1'h0)] wire74;
  wire [(3'h6):(1'h0)] wire75;
  wire signed [(4'h9):(1'h0)] wire99;
  reg [(4'hf):(1'h0)] reg114 = (1'h0);
  reg [(5'h13):(1'h0)] reg113 = (1'h0);
  reg [(4'hf):(1'h0)] reg112 = (1'h0);
  reg [(2'h2):(1'h0)] reg111 = (1'h0);
  reg [(2'h3):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg109 = (1'h0);
  reg [(4'ha):(1'h0)] reg108 = (1'h0);
  reg [(4'he):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg106 = (1'h0);
  reg [(4'hb):(1'h0)] reg105 = (1'h0);
  reg [(3'h5):(1'h0)] reg103 = (1'h0);
  reg [(5'h14):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg68 = (1'h0);
  reg [(3'h6):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg66 = (1'h0);
  reg [(5'h14):(1'h0)] reg65 = (1'h0);
  reg [(2'h2):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg [(5'h14):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg58 = (1'h0);
  reg [(4'ha):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg52 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg50 = (1'h0);
  reg [(4'he):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg [(3'h4):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  reg [(2'h3):(1'h0)] reg41 = (1'h0);
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg [(4'hf):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg [(4'hd):(1'h0)] reg37 = (1'h0);
  reg [(2'h2):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire104,
                 wire102,
                 wire101,
                 wire49,
                 wire73,
                 wire74,
                 wire75,
                 wire99,
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
                 reg103,
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
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire33[(3'h6):(2'h2)])
        begin
          reg34 <= ($unsigned(($unsigned((-(8'hb4))) * {((8'hb4) ?
                      wire32 : wire33),
                  $unsigned(wire30)})) ?
              {$unsigned(($unsigned(wire30) & (wire30 & wire33)))} : {$unsigned((!$signed(wire29)))});
          reg35 <= ($unsigned(((!$unsigned(reg34)) ?
                  reg34 : $signed(wire33[(4'h9):(3'h7)]))) ?
              ($signed($signed((wire29 << reg34))) >= wire30) : $signed((8'had)));
          reg36 <= (&$unsigned(wire31));
          if ((^~((wire32[(3'h5):(3'h5)] >>> wire30[(2'h2):(1'h1)]) | ($unsigned($signed(wire32)) ?
              (wire31 ?
                  wire29[(1'h0):(1'h0)] : (wire33 ?
                      wire32 : wire30)) : (~|(reg36 ? reg34 : wire30))))))
            begin
              reg37 <= {$unsigned($signed((8'ha2)))};
              reg38 <= (~&$unsigned((|reg34)));
              reg39 <= $signed(wire33);
            end
          else
            begin
              reg37 <= wire29;
              reg38 <= (($signed({(^~wire32)}) ^~ {wire31[(3'h6):(3'h4)],
                  $signed(reg35[(3'h5):(1'h0)])}) || wire31[(4'h8):(3'h4)]);
              reg39 <= $signed((-((reg35[(3'h4):(3'h4)] ?
                  {reg35} : (wire31 ? wire31 : wire32)) ^ (8'ha4))));
            end
        end
      else
        begin
          reg34 <= (&$unsigned(($signed($signed(reg38)) ?
              $signed(reg38[(4'hc):(1'h1)]) : (((8'hba) ? wire32 : reg34) ?
                  reg39[(2'h2):(2'h2)] : $unsigned(reg36)))));
          if (wire31[(2'h3):(2'h3)])
            begin
              reg35 <= ((wire31[(3'h4):(1'h0)] ?
                      (reg38 ?
                          (~^$unsigned(reg34)) : {(8'hb0),
                              (reg36 ?
                                  wire31 : reg39)}) : $signed($signed(reg38[(2'h3):(1'h0)]))) ?
                  $signed((8'ha0)) : wire32);
              reg36 <= ($signed(reg37[(3'h4):(2'h3)]) ?
                  $unsigned((&wire32[(4'hf):(3'h6)])) : reg36);
              reg37 <= reg34[(2'h3):(1'h1)];
            end
          else
            begin
              reg35 <= $signed(($signed(($signed(wire31) ?
                  $signed((8'had)) : (8'hba))) >= $signed(wire29[(1'h0):(1'h0)])));
              reg36 <= {(reg39 ?
                      ({(!wire33), $unsigned(reg36)} ?
                          $unsigned($signed(wire30)) : wire30[(1'h0):(1'h0)]) : wire30[(1'h0):(1'h0)]),
                  ($signed(((-wire29) << reg35)) ?
                      wire32 : {$unsigned((wire31 ? wire30 : reg36))})};
              reg37 <= ($unsigned(($unsigned(reg34) && (-$unsigned(reg37)))) >= reg38);
              reg38 <= (wire33 ?
                  ((reg35[(3'h4):(2'h3)] >>> ((7'h44) >>> reg38[(1'h0):(1'h0)])) + wire31) : (8'hb2));
            end
          reg39 <= $signed({$unsigned((|(8'ha6)))});
          reg40 <= {$signed($unsigned(((reg38 ?
                  reg39 : reg39) - reg35[(4'h9):(1'h1)])))};
        end
      reg41 <= $unsigned((!(((wire33 ? reg36 : wire30) ?
          (wire33 ? wire29 : reg37) : reg37) * $signed((wire32 || reg35)))));
      if ({($signed((wire31 ?
              $signed((8'hb7)) : $unsigned(reg39))) + $signed((-reg39[(4'he):(3'h5)]))),
          reg34[(3'h7):(1'h1)]})
        begin
          if (reg38)
            begin
              reg42 <= (($unsigned(($signed((8'hb7)) != (wire30 ?
                      reg36 : (8'hb9)))) ?
                  ($unsigned((reg35 ?
                      reg38 : reg34)) && (8'hac)) : reg34[(3'h5):(2'h3)]) - $signed(wire31[(1'h0):(1'h0)]));
              reg43 <= wire33[(1'h1):(1'h1)];
              reg44 <= wire33;
            end
          else
            begin
              reg42 <= (&{(~^$signed((wire29 << reg43))),
                  $unsigned(((reg34 * reg44) ? $signed(wire31) : (|reg36)))});
              reg43 <= reg42[(3'h7):(2'h2)];
            end
          if ({{wire33[(3'h5):(1'h0)]}})
            begin
              reg45 <= ((~{reg34}) ?
                  $unsigned($signed(wire32)) : $signed($unsigned($unsigned((reg44 ?
                      wire30 : reg38)))));
            end
          else
            begin
              reg45 <= reg38;
            end
        end
      else
        begin
          if (reg34)
            begin
              reg42 <= (^~reg34);
              reg43 <= {(($unsigned((~|reg43)) ?
                      ((reg34 <<< reg44) >> wire30) : (reg37 * reg43[(2'h3):(1'h0)])) < wire30),
                  $signed(wire29[(3'h4):(3'h4)])};
              reg44 <= reg39[(4'hd):(4'hc)];
              reg45 <= $signed(($unsigned(wire30) ?
                  wire31[(3'h4):(1'h0)] : $unsigned((((8'ha6) * (8'hb2)) ?
                      reg34 : (|(7'h43))))));
            end
          else
            begin
              reg42 <= (wire30 ?
                  ((((wire33 && reg42) ? (reg44 ~^ reg38) : (wire30 > reg38)) ?
                          $signed((-wire31)) : $unsigned(((8'h9d) ?
                              reg39 : wire30))) ?
                      (($signed((8'h9d)) != $unsigned(reg40)) + ({(8'haa),
                          reg43} * $signed((8'hb5)))) : reg38) : {{reg35[(2'h2):(2'h2)]},
                      wire33});
              reg43 <= reg41[(2'h3):(1'h0)];
              reg44 <= reg43;
              reg45 <= $signed((8'haa));
              reg46 <= (wire30[(1'h1):(1'h1)] ?
                  (((^~(7'h42)) > $unsigned($signed(wire33))) >> $unsigned(wire29[(2'h2):(1'h1)])) : reg38);
            end
          reg47 <= (^~((reg43[(1'h0):(1'h0)] ?
              ((+reg35) >> reg43[(2'h3):(1'h1)]) : ((reg44 ~^ reg44) != $unsigned(reg46))) << $unsigned($signed($unsigned(reg39)))));
        end
      reg48 <= wire31;
    end
  assign wire49 = $unsigned($unsigned(((^(reg37 ? reg48 : reg40)) ?
                      {$signed((8'ha2))} : reg37)));
  always
    @(posedge clk) begin
      if ((reg48[(2'h3):(2'h2)] ? wire29 : reg46))
        begin
          reg50 <= $signed(wire32[(3'h6):(3'h4)]);
          reg51 <= $signed((({reg45, $unsigned(reg34)} ?
              $signed((reg44 ~^ reg34)) : reg47[(3'h5):(3'h5)]) - (^~(reg42[(3'h7):(3'h6)] ?
              (reg41 < reg34) : (~&reg37)))));
        end
      else
        begin
          reg50 <= reg47;
          reg51 <= (({$unsigned(wire30), $unsigned($signed(reg48))} ?
              $signed({wire31[(1'h1):(1'h0)]}) : reg46) | reg43[(2'h2):(1'h0)]);
          if (reg50)
            begin
              reg52 <= (~^$signed({wire30}));
              reg53 <= (~$unsigned((~&({(8'hb9)} ? reg35 : $signed((7'h43))))));
              reg54 <= $unsigned(reg51[(3'h7):(3'h7)]);
              reg55 <= (((reg36[(1'h1):(1'h0)] ?
                          reg46[(1'h0):(1'h0)] : $unsigned((reg51 * (8'hb0)))) ?
                      wire31 : (reg46 & wire33[(2'h2):(1'h1)])) ?
                  $signed(reg43[(2'h3):(1'h1)]) : $unsigned(reg53[(4'h8):(2'h2)]));
            end
          else
            begin
              reg52 <= $signed(reg37);
            end
          reg56 <= ({$unsigned((~&$signed(reg43)))} & $signed(($signed({reg34}) ?
              ({reg50, reg35} ?
                  (reg47 >= reg54) : ((8'ha1) || (8'h9e))) : $unsigned((reg51 ?
                  wire32 : reg53)))));
          reg57 <= ((!$unsigned($unsigned(((8'hbd) >> reg50)))) >= reg39[(2'h3):(1'h0)]);
        end
      if ((7'h44))
        begin
          reg58 <= (&($signed(wire33) ? reg41 : (~reg39[(4'hd):(4'h9)])));
          reg59 <= (7'h42);
        end
      else
        begin
          reg58 <= $signed($unsigned($signed($signed((!wire31)))));
          reg59 <= ((-{$signed((wire49 ? (8'hbe) : reg41)), wire31}) ?
              (+((!((8'haa) ?
                  reg52 : reg45)) > {{wire32}})) : ($signed((!$signed(reg52))) <= $signed(((&reg41) ?
                  $signed(reg39) : ((8'had) ? reg56 : wire29)))));
          reg60 <= $unsigned($unsigned(((^~wire33[(4'ha):(3'h5)]) ?
              $signed($signed((8'hbb))) : (((8'h9c) >= reg47) ?
                  $unsigned(reg44) : (~reg50)))));
          reg61 <= reg55;
        end
      if (((8'hab) & $unsigned($unsigned($signed(reg40[(4'ha):(4'ha)])))))
        begin
          if ((($unsigned((~{(8'hb4)})) ?
                  $signed($unsigned(reg35[(3'h5):(2'h3)])) : (reg56 ?
                      {(reg48 | (8'ha8)),
                          wire33[(3'h7):(3'h7)]} : $signed($unsigned(reg54)))) ?
              reg55 : $unsigned(reg41[(1'h0):(1'h0)])))
            begin
              reg62 <= (($signed($signed((reg57 <<< (8'hbf)))) ?
                      ((~|(reg41 ? reg47 : wire33)) ?
                          (~{wire31,
                              reg60}) : {wire32[(4'hb):(1'h0)]}) : (-(((8'hba) != (8'h9f)) ?
                          (wire49 > reg41) : {reg53}))) ?
                  (-$signed((8'hb6))) : reg53);
              reg63 <= reg37;
              reg64 <= (-(-(reg57 | ($signed(reg48) | (~(8'ha2))))));
              reg65 <= $unsigned((wire32 ?
                  ({$unsigned(wire49), reg50} ^ ($signed(reg55) ?
                      (reg46 ~^ reg57) : $unsigned(wire32))) : (&reg53)));
            end
          else
            begin
              reg62 <= reg62[(4'h9):(3'h4)];
              reg63 <= reg36[(2'h2):(1'h1)];
              reg64 <= reg47[(3'h5):(1'h0)];
              reg65 <= (~&(reg53 >> reg60[(3'h5):(2'h3)]));
              reg66 <= wire31;
            end
          if (wire31)
            begin
              reg67 <= {(~&(($unsigned(reg53) ?
                          wire31[(1'h0):(1'h0)] : (reg42 - reg38)) ?
                      (!$unsigned(reg36)) : (^reg62))),
                  (8'hb0)};
              reg68 <= ($signed(((reg56 & $signed(reg47)) ^ wire31[(3'h4):(2'h3)])) * ($signed($signed($signed(reg63))) < {$signed((8'hb1)),
                  ($signed(reg53) ?
                      reg48[(3'h7):(3'h5)] : (reg38 ^~ (8'ha9)))}));
              reg69 <= (((~|({reg44} < (reg55 <= reg41))) ?
                      $signed($signed($signed(reg46))) : $signed((~&(^~reg56)))) ?
                  (~(reg62[(4'he):(4'he)] ?
                      wire49[(4'he):(3'h6)] : wire32)) : $unsigned((^~reg50)));
              reg70 <= $signed(reg43);
              reg71 <= (((-{reg69[(4'h8):(2'h3)]}) ?
                  $signed((reg51 & reg43[(1'h1):(1'h0)])) : $signed(($unsigned(reg44) ?
                      {reg35, reg37} : (reg45 - reg40)))) ~^ wire29);
            end
          else
            begin
              reg67 <= reg41;
              reg68 <= (-(reg46[(2'h2):(1'h0)] ~^ $unsigned(wire29)));
              reg69 <= {((^{reg38, $unsigned((7'h40))}) ?
                      $signed(reg61[(1'h0):(1'h0)]) : wire30[(3'h4):(2'h3)])};
              reg70 <= $signed($unsigned(reg55));
            end
          reg72 <= $unsigned(reg40[(3'h6):(1'h0)]);
        end
      else
        begin
          reg62 <= {reg62[(5'h15):(3'h6)],
              ($signed($unsigned((reg64 ^ reg52))) ?
                  (((wire49 ? reg65 : (8'hb2)) ?
                      $signed(wire49) : reg62) * $signed((reg51 ?
                      reg52 : (8'hb6)))) : reg43[(2'h2):(2'h2)])};
          if ($unsigned(reg58[(5'h13):(5'h10)]))
            begin
              reg63 <= $unsigned($signed((+{(^~(8'h9d)), (reg47 < reg47)})));
              reg64 <= $signed($unsigned(reg42[(5'h11):(4'hf)]));
              reg65 <= ((-($signed($signed(reg40)) ?
                      $signed({reg58, (8'hae)}) : {(reg58 ? reg39 : wire30),
                          (wire29 ? reg53 : (7'h40))})) ?
                  $signed(reg59) : ({reg68[(5'h13):(5'h13)],
                      ({reg53} < ((7'h41) ?
                          reg37 : (8'ha6)))} << (+($unsigned(reg63) ?
                      (!reg43) : $signed(reg34)))));
              reg66 <= {$unsigned((~&(reg51[(4'hd):(1'h1)] != ((8'h9f) ?
                      (8'hb1) : reg62))))};
            end
          else
            begin
              reg63 <= reg56[(1'h1):(1'h1)];
              reg64 <= {$unsigned((~&wire31[(2'h3):(2'h3)]))};
            end
          reg67 <= ($unsigned((((~^reg34) ?
                  {reg52, reg38} : wire31[(3'h6):(3'h4)]) ?
              wire49[(5'h13):(4'hc)] : (|{reg41}))) * $unsigned(($unsigned($signed(reg64)) ?
              reg38[(2'h3):(1'h1)] : reg57[(1'h1):(1'h1)])));
          reg68 <= (($signed({reg48[(3'h4):(2'h2)], (|(7'h41))}) ?
                  (wire31 ?
                      ($unsigned(reg42) ?
                          $signed(wire49) : reg58[(4'ha):(4'ha)]) : $unsigned({reg54})) : (reg60 ^~ (|reg61))) ?
              (+$signed($unsigned(reg65[(1'h0):(1'h0)]))) : $unsigned($signed($signed((reg53 ?
                  reg36 : reg38)))));
          reg69 <= $unsigned((({$signed(reg48)} >= ((reg34 >>> reg54) ?
                  (reg71 ? reg37 : wire33) : reg66)) ?
              reg52[(1'h0):(1'h0)] : reg68[(2'h3):(2'h2)]));
        end
    end
  assign wire73 = reg39[(4'h9):(1'h0)];
  assign wire74 = reg59;
  assign wire75 = ({((-reg69[(1'h0):(1'h0)]) ^ reg66[(3'h6):(2'h2)]),
                          $signed(reg64[(2'h2):(1'h0)])} ?
                      $unsigned((~($unsigned(reg58) ?
                          wire74 : {reg59}))) : $signed(reg48));
  module76 #() modinst100 (wire99, clk, reg61, reg48, reg41, wire30, reg59);
  assign wire101 = ($signed(($signed(reg68[(4'ha):(1'h1)]) * $signed(reg43))) ?
                       $unsigned(((reg53 | $unsigned(reg52)) ^ ($signed((8'hba)) ?
                           $unsigned(wire30) : $unsigned(reg43)))) : ($signed($unsigned((reg65 - reg36))) ?
                           ((~^reg50) <= (!reg35[(3'h7):(1'h1)])) : $signed((^wire30))));
  assign wire102 = $signed((~&wire75[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg103 <= ((($unsigned(wire73) ?
          (!(reg44 != reg34)) : ($unsigned(wire32) || {wire101,
              wire101})) >> (wire29 && (reg37 << (~&reg56)))) * $unsigned(reg35[(3'h5):(2'h3)]));
    end
  assign wire104 = reg70;
  always
    @(posedge clk) begin
      if (($unsigned((($unsigned(reg70) <<< ((8'ha4) != (8'hbe))) ?
          $unsigned((wire104 * reg61)) : (~$unsigned(reg44)))) + (($unsigned(wire101[(3'h7):(3'h4)]) <= ($unsigned(reg64) ~^ ((8'ha5) ?
              wire33 : reg50))) ?
          (~(&(reg72 ? (8'hbe) : reg55))) : reg50)))
        begin
          if ($signed(((^reg58[(4'he):(4'he)]) ?
              (8'hb9) : $unsigned(wire101[(4'ha):(4'h8)]))))
            begin
              reg105 <= (+wire75);
              reg106 <= (~reg72[(4'hb):(2'h2)]);
              reg107 <= (reg69[(3'h4):(3'h4)] ?
                  ($signed($unsigned(reg61[(3'h6):(1'h1)])) ^ reg105) : $signed((8'had)));
            end
          else
            begin
              reg105 <= (~|(($signed(reg67) * $signed({(7'h40),
                  reg38})) <= wire75));
              reg106 <= ({(($unsigned(wire101) ?
                          (wire99 ?
                              reg70 : reg54) : reg103) ~^ {reg64[(1'h1):(1'h0)],
                          ((8'h9d) ? reg51 : reg38)}),
                      (((reg107 * reg61) ?
                          (~^(8'hbc)) : (8'hb9)) ~^ (~^reg58[(4'hb):(2'h2)]))} ?
                  reg65[(5'h11):(4'hd)] : wire104);
              reg107 <= $unsigned($signed((!reg72[(1'h1):(1'h0)])));
              reg108 <= (~|$unsigned((reg55 ^ ({wire31,
                  reg55} != reg37[(3'h7):(3'h5)]))));
              reg109 <= $unsigned((($unsigned(wire74[(5'h14):(5'h14)]) <<< $unsigned({wire102,
                      wire99})) ?
                  reg36 : $signed(((reg72 ?
                      reg48 : reg50) >>> $signed((8'hb3))))));
            end
          reg110 <= {{($unsigned(reg105) <<< ($signed((8'hb3)) ?
                      reg56[(2'h2):(1'h1)] : (reg66 >>> wire99)))}};
          reg111 <= ({reg42} ?
              ((~^$unsigned(wire29)) ?
                  (!reg62[(2'h3):(2'h3)]) : reg109) : wire31[(3'h4):(3'h4)]);
          reg112 <= $signed((8'ha4));
          reg113 <= reg62[(5'h10):(4'hd)];
        end
      else
        begin
          reg105 <= {({$signed(reg54[(2'h2):(1'h0)])} ?
                  $unsigned(wire99[(1'h1):(1'h1)]) : (~((wire101 >= wire99) >>> wire101)))};
          if (reg34)
            begin
              reg106 <= $unsigned($signed(reg107));
            end
          else
            begin
              reg106 <= (!(-reg48));
            end
        end
    end
  always
    @(posedge clk) begin
      reg114 <= $signed($signed($signed(reg40)));
    end
  assign wire115 = reg55;
  assign wire116 = $unsigned(reg112[(4'hc):(2'h3)]);
  assign wire117 = $signed(reg109);
  assign wire118 = wire74;
endmodule

module module4
#(parameter param24 = (~&((~^(((8'ha0) * (8'ha9)) < ((8'ha3) <= (8'haa)))) >> {((&(8'ha1)) == {(8'ha1), (8'hbc)})})))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'ha1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire8;
  input wire [(4'hb):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire6;
  input wire [(4'hd):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire22;
  wire [(4'hb):(1'h0)] wire21;
  wire signed [(4'h9):(1'h0)] wire20;
  wire [(4'hb):(1'h0)] wire19;
  wire signed [(4'h8):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire16;
  wire [(2'h3):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire9;
  reg [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire16,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 reg17,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire9 = (|wire8[(1'h0):(1'h0)]);
  assign wire10 = (8'ha4);
  assign wire11 = $unsigned(({{wire5, (~&(8'ha3))},
                          ((~&wire5) <= $unsigned(wire7))} ?
                      wire8 : ($signed((wire9 >>> wire5)) ?
                          (wire7 != (^~wire6)) : (~^$unsigned(wire5)))));
  assign wire12 = (8'ha0);
  always
    @(posedge clk) begin
      reg13 <= $unsigned({wire5,
          ((|(~&wire8)) ? wire9[(2'h2):(2'h2)] : wire8)});
    end
  always
    @(posedge clk) begin
      reg14 <= (7'h40);
      reg15 <= {($unsigned({(-wire6)}) == $unsigned((&wire12[(1'h1):(1'h1)]))),
          $unsigned(((&wire10[(2'h3):(2'h2)]) ?
              (&{wire12}) : {((8'had) & wire11)}))};
    end
  assign wire16 = $signed($unsigned((~|$signed(wire6[(3'h4):(2'h2)]))));
  always
    @(posedge clk) begin
      reg17 <= ((($signed(reg15[(3'h7):(1'h0)]) << $unsigned($signed(wire8))) ?
              ($unsigned((wire16 ?
                  wire7 : wire16)) * (^~((8'ha9) * wire5))) : (&($signed(wire10) > (reg14 & (8'ha5))))) ?
          (^($signed(reg15) ^ ((8'ha1) > $unsigned((8'hbd))))) : $unsigned($unsigned($signed(wire9[(1'h0):(1'h0)]))));
    end
  assign wire18 = (wire11 ^~ (8'hbd));
  assign wire19 = (-($signed({(wire16 > (7'h42))}) != {(~&$unsigned(wire5)),
                      (^~(-wire5))}));
  assign wire20 = (~&(+$unsigned(reg13)));
  assign wire21 = (&$unsigned(($signed(reg14) << ((reg17 ?
                      wire8 : wire20) ^~ (!wire19)))));
  assign wire22 = ($signed((($signed(wire10) << {wire12}) ?
                          {$signed(wire18)} : (|(wire9 & reg15)))) ?
                      {(-(|(^~wire5))),
                          reg15[(3'h7):(3'h5)]} : $signed((&(wire10[(2'h2):(1'h0)] == $unsigned(wire18)))));
  assign wire23 = wire21[(2'h2):(1'h1)];
endmodule

module module76  (y, clk, wire81, wire80, wire79, wire78, wire77);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire81;
  input wire signed [(4'he):(1'h0)] wire80;
  input wire signed [(2'h3):(1'h0)] wire79;
  input wire signed [(3'h4):(1'h0)] wire78;
  input wire signed [(4'h8):(1'h0)] wire77;
  wire signed [(2'h2):(1'h0)] wire98;
  wire signed [(4'hc):(1'h0)] wire97;
  wire signed [(4'h8):(1'h0)] wire96;
  wire signed [(3'h5):(1'h0)] wire95;
  wire [(3'h6):(1'h0)] wire91;
  wire [(2'h3):(1'h0)] wire90;
  wire [(3'h6):(1'h0)] wire89;
  wire [(5'h14):(1'h0)] wire88;
  wire signed [(4'h9):(1'h0)] wire87;
  wire [(2'h2):(1'h0)] wire85;
  wire signed [(5'h12):(1'h0)] wire84;
  wire [(5'h14):(1'h0)] wire83;
  wire [(2'h2):(1'h0)] wire82;
  reg [(4'he):(1'h0)] reg94 = (1'h0);
  reg [(4'hd):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg86 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 reg94,
                 reg93,
                 reg92,
                 reg86,
                 (1'h0)};
  assign wire82 = (^{$unsigned(wire80)});
  assign wire83 = wire82;
  assign wire84 = (|$signed(((+wire78) | (((8'hb3) == wire78) ?
                      (wire83 ? wire81 : wire77) : (~^wire80)))));
  assign wire85 = wire84[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg86 <= $signed(($signed((-(wire78 >> (8'hba)))) ?
          wire85 : wire85[(1'h0):(1'h0)]));
    end
  assign wire87 = {(~(({wire81, wire83} ?
                          wire78 : $signed(wire80)) ^ (+$unsigned((8'h9e)))))};
  assign wire88 = wire77[(1'h0):(1'h0)];
  assign wire89 = wire80;
  assign wire90 = {(&((&(8'ha8)) ?
                          ($signed(wire88) ?
                              $unsigned(wire82) : (wire79 - (8'hb5))) : $signed((wire82 ?
                              wire77 : reg86)))),
                      wire87[(3'h5):(1'h0)]};
  assign wire91 = (7'h43);
  always
    @(posedge clk) begin
      reg92 <= {wire80};
      reg93 <= wire83;
      reg94 <= ($signed(wire89) && ((wire81 ?
          $signed((wire85 == reg86)) : {$unsigned(wire82),
              wire80[(4'h8):(3'h7)]}) + {{(wire88 * wire85)}}));
    end
  assign wire95 = wire80;
  assign wire96 = (^{$unsigned(wire85)});
  assign wire97 = $signed({wire95});
  assign wire98 = reg86;
endmodule

module module135
#(parameter param172 = (8'hb7))
(y, clk, wire139, wire138, wire137, wire136);
  output wire [(32'h173):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire139;
  input wire [(4'h9):(1'h0)] wire138;
  input wire [(5'h14):(1'h0)] wire137;
  input wire signed [(4'hc):(1'h0)] wire136;
  wire [(4'he):(1'h0)] wire171;
  wire signed [(5'h12):(1'h0)] wire160;
  wire signed [(3'h5):(1'h0)] wire159;
  wire signed [(4'hc):(1'h0)] wire158;
  wire signed [(5'h13):(1'h0)] wire146;
  wire signed [(4'hc):(1'h0)] wire145;
  wire signed [(3'h5):(1'h0)] wire144;
  wire signed [(3'h5):(1'h0)] wire143;
  wire signed [(2'h3):(1'h0)] wire142;
  wire [(4'ha):(1'h0)] wire141;
  wire [(4'hd):(1'h0)] wire140;
  reg [(4'he):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg169 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg168 = (1'h0);
  reg [(4'hc):(1'h0)] reg167 = (1'h0);
  reg [(5'h11):(1'h0)] reg166 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg165 = (1'h0);
  reg [(5'h14):(1'h0)] reg164 = (1'h0);
  reg [(4'he):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg162 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg161 = (1'h0);
  reg [(4'h9):(1'h0)] reg157 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg156 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg154 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg153 = (1'h0);
  reg [(3'h7):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg151 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg150 = (1'h0);
  reg [(5'h11):(1'h0)] reg149 = (1'h0);
  reg [(5'h11):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg147 = (1'h0);
  assign y = {wire171,
                 wire160,
                 wire159,
                 wire158,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
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
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 (1'h0)};
  assign wire140 = $signed((($unsigned($signed(wire136)) ^ $signed((wire139 ~^ wire138))) + $unsigned(($unsigned(wire138) ?
                       (wire137 < wire136) : (wire137 + wire138)))));
  assign wire141 = wire139;
  assign wire142 = wire137;
  assign wire143 = $unsigned($unsigned(wire139[(4'ha):(3'h4)]));
  assign wire144 = (|$unsigned($signed((~^(&wire138)))));
  assign wire145 = (((+(|(wire140 ?
                           (8'hb8) : wire139))) && ($signed(wire136) > $signed($unsigned(wire141)))) ?
                       wire136 : $signed($unsigned((8'hb3))));
  assign wire146 = $unsigned($unsigned({$unsigned((wire136 ?
                           wire138 : (8'haf))),
                       ($signed(wire136) >> (&wire145))}));
  always
    @(posedge clk) begin
      if ((((|((wire139 ^ wire144) ? wire143 : (wire139 ? wire144 : wire141))) ?
              (~|((~|wire141) ?
                  (&wire146) : $signed(wire145))) : wire140[(2'h3):(2'h3)]) ?
          wire136[(2'h2):(1'h1)] : wire140))
        begin
          if ((8'ha6))
            begin
              reg147 <= $signed(($signed($signed({wire139})) == (8'ha1)));
              reg148 <= $unsigned((&$signed((8'haf))));
              reg149 <= wire143;
              reg150 <= (~|((!($signed(wire142) ?
                      $signed(wire141) : (wire142 < (8'ha7)))) ?
                  ($signed({wire143,
                      wire143}) & wire140[(3'h6):(2'h2)]) : $unsigned(wire137[(5'h12):(4'he)])));
            end
          else
            begin
              reg147 <= reg147[(4'hc):(3'h5)];
              reg148 <= $signed(($signed({$signed(wire139)}) ?
                  $unsigned({(reg148 + wire137), (~&wire137)}) : wire141));
              reg149 <= wire146;
              reg150 <= ($unsigned((8'ha9)) ?
                  $unsigned((!$unsigned($signed(wire145)))) : {$signed(wire144[(3'h4):(2'h3)]),
                      ($signed((~^(8'hba))) ^~ (reg147[(4'ha):(3'h4)] ?
                          (~reg147) : wire140[(3'h5):(3'h5)]))});
            end
          reg151 <= $unsigned($signed(wire145[(3'h5):(2'h2)]));
          reg152 <= $unsigned(wire137);
          reg153 <= $unsigned($unsigned({{(8'hb3), reg149},
              ((wire138 ? (8'hb0) : wire144) || $unsigned(wire137))}));
          reg154 <= wire144[(3'h4):(2'h3)];
        end
      else
        begin
          reg147 <= wire136;
          if (reg153)
            begin
              reg148 <= ({wire141[(2'h2):(1'h1)]} ?
                  $unsigned(wire136[(4'hb):(1'h1)]) : {{($unsigned(reg148) ?
                              (wire140 && wire143) : wire144[(3'h5):(2'h3)]),
                          (wire143[(3'h5):(2'h3)] ?
                              (&reg151) : $signed(reg153))},
                      $unsigned(reg149[(4'h9):(3'h4)])});
            end
          else
            begin
              reg148 <= (($signed($unsigned($signed(wire146))) ?
                  $signed(wire144) : reg150) >> ((^wire146) == (($unsigned((8'ha2)) & (reg152 ?
                  wire144 : wire136)) <<< ($unsigned(reg152) ?
                  $signed(reg154) : (wire144 ? wire145 : reg149)))));
              reg149 <= reg147[(2'h2):(1'h1)];
            end
          reg150 <= (((reg149 >= $unsigned($unsigned(wire146))) ^ {(wire143[(1'h1):(1'h1)] ?
                      $signed(reg153) : (~|reg150))}) ?
              ((reg149 ?
                  ({wire146, wire143} * $signed(wire146)) : (((8'hab) ?
                      wire140 : (8'ha7)) ^ reg148[(2'h3):(2'h3)])) > ((^~(wire137 ^~ reg154)) & (8'hae))) : (~|$signed((^wire142))));
          reg151 <= ($unsigned(wire136[(1'h1):(1'h0)]) ^ wire136);
        end
      reg155 <= (-(((&wire144) > (wire143[(1'h0):(1'h0)] >> reg148[(3'h6):(3'h6)])) ?
          ($unsigned($signed(reg149)) <= (^~(8'haa))) : $unsigned(wire136)));
      reg156 <= reg152;
      reg157 <= ($signed((~&wire138[(4'h8):(3'h6)])) != {$unsigned(((8'ha3) ?
              (reg152 ? (8'h9f) : reg155) : reg149[(4'hc):(2'h2)]))});
    end
  assign wire158 = (wire143[(3'h4):(1'h0)] ^ ((($signed(wire141) ?
                           (-reg153) : $signed(wire141)) ?
                       (^~$signed((8'hb7))) : reg147[(2'h3):(1'h1)]) < (&{(wire145 ?
                           wire138 : (8'hae))})));
  assign wire159 = (wire141[(4'h8):(3'h5)] ?
                       wire158 : (($unsigned($signed(reg157)) ?
                           (wire138[(3'h5):(3'h5)] ?
                               $unsigned((8'ha0)) : (~|wire158)) : {$signed(reg152)}) - reg156[(1'h1):(1'h0)]));
  assign wire160 = $unsigned($unsigned($signed(wire137[(4'h9):(1'h0)])));
  always
    @(posedge clk) begin
      reg161 <= reg155;
      reg162 <= $signed((~$signed({(|(8'haa)), {reg153, (8'ha9)}})));
      reg163 <= (reg148[(4'hd):(3'h6)] ?
          wire142[(1'h1):(1'h0)] : $unsigned((!wire138)));
      reg164 <= reg155;
      if (wire143[(1'h0):(1'h0)])
        begin
          reg165 <= (~|wire146[(4'ha):(2'h3)]);
          reg166 <= (~^(|$signed($signed((~&(7'h40))))));
          reg167 <= (~^(!(+(wire140 && (8'hbf)))));
        end
      else
        begin
          reg165 <= (^$unsigned($signed($unsigned((&wire146)))));
          reg166 <= $signed(reg150);
          reg167 <= (-{$unsigned($signed(reg162[(2'h3):(2'h3)]))});
          reg168 <= $unsigned(($unsigned({{reg155},
              (^~reg166)}) * reg163[(3'h7):(2'h3)]));
          if ({reg154[(4'h9):(4'h9)],
              ((wire144 ? $signed(wire160) : reg153[(1'h1):(1'h0)]) ?
                  (&($signed(reg162) ?
                      wire160 : (reg150 ?
                          wire158 : wire143))) : $signed(wire146))})
            begin
              reg169 <= reg150[(4'h8):(3'h4)];
              reg170 <= $signed((wire145[(4'ha):(3'h6)] ?
                  $unsigned(wire141) : ($signed((reg169 ? wire140 : reg166)) ?
                      (reg169[(4'ha):(4'ha)] + wire160) : wire138[(4'h8):(3'h4)])));
            end
          else
            begin
              reg169 <= reg148;
            end
        end
    end
  assign wire171 = reg153[(3'h6):(1'h1)];
endmodule
