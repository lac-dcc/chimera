module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h21c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire4;
  wire signed [(4'h9):(1'h0)] wire236;
  wire [(5'h11):(1'h0)] wire215;
  wire signed [(4'ha):(1'h0)] wire214;
  wire [(4'he):(1'h0)] wire213;
  wire [(5'h10):(1'h0)] wire212;
  wire signed [(5'h13):(1'h0)] wire201;
  wire signed [(4'ha):(1'h0)] wire89;
  wire [(5'h15):(1'h0)] wire88;
  wire [(4'he):(1'h0)] wire86;
  wire signed [(5'h15):(1'h0)] wire44;
  wire signed [(5'h14):(1'h0)] wire42;
  wire [(4'hf):(1'h0)] wire203;
  wire signed [(4'hb):(1'h0)] wire204;
  wire signed [(5'h14):(1'h0)] wire205;
  wire [(5'h14):(1'h0)] wire206;
  wire [(5'h11):(1'h0)] wire207;
  wire [(4'hf):(1'h0)] wire208;
  wire signed [(4'h9):(1'h0)] wire209;
  wire signed [(3'h5):(1'h0)] wire210;
  reg [(4'hb):(1'h0)] reg235 = (1'h0);
  reg [(4'hd):(1'h0)] reg234 = (1'h0);
  reg [(5'h11):(1'h0)] reg233 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg232 = (1'h0);
  reg [(4'hd):(1'h0)] reg231 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg230 = (1'h0);
  reg [(4'hb):(1'h0)] reg229 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg228 = (1'h0);
  reg [(5'h13):(1'h0)] reg227 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg226 = (1'h0);
  reg [(5'h10):(1'h0)] reg225 = (1'h0);
  reg [(3'h7):(1'h0)] reg224 = (1'h0);
  reg [(3'h7):(1'h0)] reg223 = (1'h0);
  reg [(3'h4):(1'h0)] reg222 = (1'h0);
  reg [(5'h14):(1'h0)] reg221 = (1'h0);
  reg [(5'h11):(1'h0)] reg220 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg219 = (1'h0);
  reg [(2'h2):(1'h0)] reg218 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg217 = (1'h0);
  reg [(5'h15):(1'h0)] reg216 = (1'h0);
  assign y = {wire236,
                 wire215,
                 wire214,
                 wire213,
                 wire212,
                 wire201,
                 wire89,
                 wire88,
                 wire86,
                 wire44,
                 wire42,
                 wire203,
                 wire204,
                 wire205,
                 wire206,
                 wire207,
                 wire208,
                 wire209,
                 wire210,
                 reg235,
                 reg234,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 (1'h0)};
  module5 #() modinst43 (wire42, clk, wire0, wire1, wire4, wire2, wire3);
  assign wire44 = $unsigned(((!$signed({(8'ha5)})) & wire0[(5'h10):(4'h8)]));
  module45 #() modinst87 (.wire47(wire4), .clk(clk), .wire49(wire3), .wire46(wire44), .y(wire86), .wire48(wire0));
  assign wire88 = (^~(($unsigned(wire3[(2'h2):(2'h2)]) ?
                      {$signed(wire4),
                          wire1} : {(wire2 || wire0)}) ^ (~&$signed((wire44 << wire2)))));
  assign wire89 = (~^(+(|{$unsigned(wire88)})));
  module90 #() modinst202 (.wire93(wire0), .wire94(wire2), .wire92(wire44), .y(wire201), .clk(clk), .wire91(wire3), .wire95(wire4));
  assign wire203 = $unsigned($signed(wire4[(4'h8):(4'h8)]));
  assign wire204 = wire86;
  assign wire205 = wire2;
  assign wire206 = wire205[(5'h10):(1'h1)];
  assign wire207 = wire3[(5'h10):(2'h3)];
  assign wire208 = $signed(wire1);
  assign wire209 = $unsigned($signed((8'h9f)));
  module90 #() modinst211 (.wire92(wire88), .wire95(wire44), .clk(clk), .wire93(wire42), .wire91(wire201), .y(wire210), .wire94(wire3));
  assign wire212 = $signed({$signed(({wire1} < $unsigned(wire44))), wire207});
  assign wire213 = ((~^$unsigned(wire42[(4'hf):(4'h9)])) ^~ wire212[(2'h3):(1'h1)]);
  assign wire214 = (((~|(~^wire208)) ? wire208 : $signed(wire212)) ?
                       wire4[(4'h8):(3'h7)] : wire213[(3'h6):(3'h6)]);
  assign wire215 = (~^wire206[(4'hc):(2'h2)]);
  always
    @(posedge clk) begin
      if ((wire205[(4'hf):(2'h2)] ?
          $signed(wire209[(1'h0):(1'h0)]) : ((wire2 ~^ (~&$unsigned(wire204))) != wire215)))
        begin
          reg216 <= (($unsigned(wire89[(2'h3):(1'h0)]) && (~^wire0[(3'h6):(3'h5)])) < (~|(wire42[(3'h7):(3'h7)] ?
              wire86 : ($signed(wire4) < $signed(wire89)))));
        end
      else
        begin
          reg216 <= ({(8'h9d), (~&$unsigned((8'ha5)))} ? (8'hb9) : wire88);
          if ((-$signed({((wire208 >>> (7'h42)) ?
                  (wire44 * wire215) : (wire213 ? (7'h42) : wire86))})))
            begin
              reg217 <= wire201;
            end
          else
            begin
              reg217 <= reg216;
              reg218 <= (8'hbd);
            end
          reg219 <= $unsigned(wire201[(3'h5):(3'h5)]);
          if ($signed($unsigned((wire212 ?
              (wire207 ?
                  $unsigned(wire214) : (reg218 ?
                      wire207 : wire201)) : ((&wire210) ?
                  {wire86, (8'h9c)} : wire201)))))
            begin
              reg220 <= (~&$signed($unsigned(($unsigned(wire207) == $unsigned(wire204)))));
              reg221 <= $signed(wire215);
              reg222 <= ((~(wire215 ?
                  $signed((wire206 >> wire207)) : ({wire0, (8'ha8)} ?
                      (~&wire0) : $signed((8'hb0))))) >= $unsigned(($signed(wire210[(1'h0):(1'h0)]) ?
                  wire203 : (wire205[(3'h5):(3'h5)] ?
                      (wire204 ? wire86 : (8'hb7)) : (~^wire215)))));
              reg223 <= (((wire204[(3'h4):(3'h4)] << (+(wire44 ?
                      wire88 : wire3))) ^~ reg222) ?
                  wire207[(4'he):(4'hc)] : wire0);
              reg224 <= ((8'h9e) ?
                  {$unsigned((wire214[(3'h6):(3'h4)] * (reg217 ?
                          wire1 : wire2))),
                      $signed(wire209[(4'h8):(3'h5)])} : {((8'ha2) ^~ {(^wire208),
                          (wire42 + wire215)}),
                      wire208[(4'ha):(3'h7)]});
            end
          else
            begin
              reg220 <= (+(($unsigned((+wire0)) ^~ (8'hb8)) ?
                  $unsigned((~{wire215})) : $signed(wire44)));
              reg221 <= (-$signed((wire208 >= ((wire212 >> reg217) ?
                  wire2[(4'hc):(4'h9)] : (^wire86)))));
            end
          reg225 <= wire0;
        end
      reg226 <= $signed(($signed(reg217) ?
          (wire44[(3'h4):(2'h3)] ?
              ((reg223 ? wire205 : (8'h9f)) ?
                  ((8'hb8) ? reg221 : wire2) : ((8'had) ?
                      (8'hbe) : wire89)) : (((8'h9e) ? wire215 : reg220) ?
                  (wire212 ?
                      (8'hbe) : wire1) : (wire214 >= wire204))) : $signed($signed(wire86[(1'h1):(1'h1)]))));
      reg227 <= {(($signed($signed(reg221)) ^~ {{wire42}}) ?
              $unsigned((((8'h9d) - wire2) ?
                  (reg222 > (8'hb8)) : (wire44 * wire215))) : {reg220,
                  $signed($unsigned((8'hbe)))}),
          wire86};
      if (wire1[(4'h9):(3'h7)])
        begin
          reg228 <= (wire203[(4'he):(4'h8)] ?
              $unsigned((({reg224, (7'h44)} ?
                  wire201 : $unsigned(reg218)) << (~&reg224))) : (~&(((8'hbf) >= (~(8'hb8))) != reg221[(5'h10):(4'hf)])));
          reg229 <= (reg224 ?
              (reg222[(2'h2):(1'h1)] ?
                  wire89 : $signed($unsigned((wire86 || wire2)))) : $signed({wire1}));
          reg230 <= $signed(($signed(reg226[(2'h2):(1'h1)]) || $signed(($unsigned(wire44) ?
              reg227 : (wire207 < (8'hb4))))));
          reg231 <= (~^(($signed($unsigned(wire88)) ?
                  (wire3[(4'hf):(4'hf)] && (reg228 ?
                      wire1 : reg223)) : wire207[(4'hd):(3'h6)]) ?
              reg223 : $signed(((~wire214) ^~ {reg216}))));
        end
      else
        begin
          reg228 <= $unsigned(reg226);
          reg229 <= ((($signed((reg228 ?
                  wire42 : (8'hbf))) ^~ $unsigned($signed(reg229))) ?
              ($unsigned($signed(wire214)) ~^ reg222) : (~^$unsigned($unsigned(reg221)))) ^~ (!$unsigned(reg219[(4'hf):(3'h6)])));
          if (reg216[(4'hb):(3'h4)])
            begin
              reg230 <= ($unsigned(($unsigned({(8'ha0)}) ?
                      ((reg216 ? wire208 : reg231) ?
                          wire204[(4'h9):(3'h4)] : ((8'hbc) && wire212)) : (~&(wire2 ?
                          (8'hb1) : reg219)))) ?
                  {wire1[(3'h5):(3'h4)]} : reg218);
              reg231 <= $unsigned(reg229[(3'h5):(2'h3)]);
              reg232 <= $unsigned($unsigned((+wire207)));
              reg233 <= (reg227 ^ ((reg226 ?
                  {wire4, (reg229 - wire86)} : (((8'hbf) ?
                      (8'ha6) : wire3) ^~ {wire3})) == $signed({wire215[(5'h11):(1'h1)],
                  wire89[(4'h8):(3'h4)]})));
            end
          else
            begin
              reg230 <= (~&$signed(reg228));
              reg231 <= (~&(({(wire208 ?
                      reg231 : wire3)} >> (~^reg223[(3'h6):(3'h4)])) <= $signed(((8'haa) ?
                  (wire215 && wire1) : $unsigned(wire4)))));
              reg232 <= reg223;
              reg233 <= (wire208[(2'h2):(1'h1)] ?
                  (wire208 && ($signed($unsigned(reg220)) ~^ (wire206 ?
                      reg221[(4'hb):(2'h2)] : (reg232 <= wire208)))) : reg233);
              reg234 <= (($unsigned(wire88) ?
                      $signed($signed(wire215)) : (~^$unsigned((~wire207)))) ?
                  ($unsigned({$unsigned(wire0)}) ?
                      wire204[(3'h7):(2'h2)] : wire206) : (reg223[(1'h0):(1'h0)] ?
                      (^wire88) : reg229[(4'h9):(2'h2)]));
            end
        end
      reg235 <= reg218[(1'h0):(1'h0)];
    end
  assign wire236 = $signed(wire1[(4'h8):(1'h0)]);
endmodule

module module90
#(parameter param199 = {((^~(((8'hb8) < (8'h9d)) != {(8'hbf), (8'h9c)})) == ((((8'hb6) << (8'hba)) + ((8'ha9) ? (8'hb5) : (8'ha4))) ? ((~(8'ha3)) ? {(8'hb3), (8'hb7)} : (~|(8'h9f))) : (!((8'h9e) ? (8'hac) : (8'hb1))))), ((((^(8'ha2)) ? ((7'h40) != (8'hae)) : ((8'ha7) ? (8'ha4) : (8'ha9))) ? {(~&(7'h42))} : (((8'hb5) ? (8'hb2) : (8'ha2)) | (~&(8'hb7)))) != (((~&(8'ha7)) != ((8'hba) * (8'hac))) ? (8'ha5) : {((8'hb9) ? (8'hb0) : (8'hac)), (8'hbd)}))}, 
parameter param200 = param199)
(y, clk, wire95, wire94, wire93, wire92, wire91);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire95;
  input wire [(4'he):(1'h0)] wire94;
  input wire signed [(4'hc):(1'h0)] wire93;
  input wire [(5'h15):(1'h0)] wire92;
  input wire [(5'h13):(1'h0)] wire91;
  wire [(4'hf):(1'h0)] wire197;
  wire [(5'h10):(1'h0)] wire186;
  wire [(4'hc):(1'h0)] wire185;
  wire signed [(4'hf):(1'h0)] wire184;
  wire signed [(4'he):(1'h0)] wire183;
  wire [(5'h12):(1'h0)] wire182;
  wire signed [(4'he):(1'h0)] wire181;
  wire signed [(4'hc):(1'h0)] wire180;
  wire [(4'hb):(1'h0)] wire179;
  wire [(5'h11):(1'h0)] wire178;
  wire signed [(5'h14):(1'h0)] wire177;
  wire [(3'h6):(1'h0)] wire176;
  wire [(4'hd):(1'h0)] wire175;
  wire signed [(3'h4):(1'h0)] wire174;
  wire signed [(4'hd):(1'h0)] wire173;
  wire signed [(5'h13):(1'h0)] wire172;
  wire signed [(3'h6):(1'h0)] wire120;
  wire [(5'h13):(1'h0)] wire97;
  wire signed [(4'he):(1'h0)] wire96;
  wire signed [(5'h10):(1'h0)] wire123;
  wire signed [(3'h7):(1'h0)] wire170;
  reg [(4'hd):(1'h0)] reg122 = (1'h0);
  assign y = {wire197,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
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
                 wire120,
                 wire97,
                 wire96,
                 wire123,
                 wire170,
                 reg122,
                 (1'h0)};
  assign wire96 = (+{($signed($signed(wire93)) ?
                          (^~wire95[(4'hd):(4'hb)]) : (wire92[(3'h7):(3'h4)] ?
                              wire92[(3'h7):(2'h3)] : (^~wire93))),
                      (8'hb0)});
  assign wire97 = $signed($signed(((&(!wire95)) ?
                      {wire93} : {(wire94 != wire92),
                          (wire93 ? wire96 : wire93)})));
  module98 #() modinst121 (wire120, clk, wire97, wire95, wire96, wire92, wire93);
  always
    @(posedge clk) begin
      reg122 <= ({wire120[(3'h4):(3'h4)], wire91} ?
          ($signed($unsigned((wire92 ?
              wire91 : wire96))) + wire120) : wire96[(3'h5):(3'h5)]);
    end
  assign wire123 = (wire91[(4'hf):(4'he)] ^ (~|(({wire96, wire91} ?
                       $signed(wire95) : (^~wire94)) << {(!wire96),
                       (wire91 ? wire120 : wire97)})));
  module124 #() modinst171 (wire170, clk, wire97, reg122, wire123, wire96);
  assign wire172 = $unsigned(wire91[(2'h2):(1'h0)]);
  assign wire173 = (^(wire97[(4'hb):(3'h6)] << wire96[(4'hd):(2'h2)]));
  assign wire174 = {$signed((+(wire123[(4'hd):(1'h1)] ?
                           (wire92 ~^ wire123) : wire170[(3'h6):(3'h5)]))),
                       (-(reg122[(3'h5):(3'h5)] >>> (wire94 ?
                           $unsigned(wire91) : (~wire172))))};
  assign wire175 = (wire96 ?
                       wire120[(1'h1):(1'h0)] : (~|wire120[(3'h5):(3'h5)]));
  assign wire176 = reg122[(4'h8):(3'h7)];
  assign wire177 = (($unsigned((wire123[(4'hb):(3'h5)] ?
                       wire93[(1'h0):(1'h0)] : {wire175,
                           wire176})) && $unsigned(((wire97 && wire172) | $unsigned(wire93)))) - (wire95 == wire91));
  assign wire178 = ((!$signed($unsigned(((8'ha9) ? wire96 : wire172)))) ?
                       ({$unsigned((!wire120))} ?
                           ((-wire97[(4'h8):(1'h1)]) ?
                               ((wire97 >>> wire97) ?
                                   $signed(wire123) : (^~wire92)) : wire174[(1'h1):(1'h0)]) : $signed((^~(wire123 ?
                               wire97 : wire120)))) : wire174[(1'h1):(1'h1)]);
  assign wire179 = wire178[(2'h3):(2'h2)];
  assign wire180 = ((wire177[(4'hf):(4'hc)] != wire177) ?
                       wire97[(4'h9):(1'h0)] : (~&($signed($signed(wire178)) + $unsigned(((8'ha8) <= wire179)))));
  assign wire181 = $unsigned((~&wire174[(1'h1):(1'h0)]));
  assign wire182 = $signed($unsigned(wire172[(2'h2):(1'h1)]));
  assign wire183 = ((({(wire95 ? wire123 : (8'hb8)),
                                   (wire91 ? wire172 : wire95)} ?
                               ((~&(8'hba)) * ((8'ha2) <= wire178)) : (~{reg122,
                                   (7'h40)})) ?
                           (+$unsigned(wire94)) : $unsigned((^(wire174 || wire172)))) ?
                       ($unsigned(((~&wire92) ?
                           $signed(wire173) : ((8'hb4) ?
                               wire179 : reg122))) == $unsigned(wire92[(4'hb):(2'h2)])) : $signed(((-(wire93 ?
                               wire172 : reg122)) ?
                           ($signed(wire178) ?
                               (wire177 & wire180) : (wire123 - wire96)) : wire123)));
  assign wire184 = $signed(wire123[(4'h8):(2'h3)]);
  assign wire185 = (^$unsigned(($unsigned(wire91[(5'h10):(2'h2)]) && wire91)));
  assign wire186 = wire97;
  module187 #() modinst198 (wire197, clk, wire172, wire173, wire183, wire178);
endmodule

module module45
#(parameter param84 = (8'ha2), 
parameter param85 = (((((+param84) ? {param84} : {param84, param84}) >> (~^param84)) ? param84 : (&((param84 != param84) <= param84))) ^ (((~&(param84 >> param84)) + (param84 ? ((8'hb2) + param84) : param84)) >> {param84})))
(y, clk, wire49, wire48, wire47, wire46);
  output wire [(32'h193):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire49;
  input wire signed [(4'ha):(1'h0)] wire48;
  input wire [(4'hc):(1'h0)] wire47;
  input wire signed [(5'h13):(1'h0)] wire46;
  wire signed [(3'h7):(1'h0)] wire83;
  wire [(5'h11):(1'h0)] wire82;
  wire [(5'h14):(1'h0)] wire81;
  wire [(4'hd):(1'h0)] wire80;
  wire signed [(4'h9):(1'h0)] wire56;
  wire [(5'h12):(1'h0)] wire55;
  wire signed [(5'h11):(1'h0)] wire50;
  reg [(4'hd):(1'h0)] reg79 = (1'h0);
  reg signed [(4'he):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg77 = (1'h0);
  reg [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg75 = (1'h0);
  reg [(4'h8):(1'h0)] reg74 = (1'h0);
  reg [(5'h11):(1'h0)] reg73 = (1'h0);
  reg [(3'h4):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg70 = (1'h0);
  reg signed [(4'he):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg68 = (1'h0);
  reg [(2'h3):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg66 = (1'h0);
  reg [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(5'h12):(1'h0)] reg64 = (1'h0);
  reg [(3'h5):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg62 = (1'h0);
  reg [(3'h6):(1'h0)] reg61 = (1'h0);
  reg [(2'h2):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg53 = (1'h0);
  reg [(5'h12):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire56,
                 wire55,
                 wire50,
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
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  assign wire50 = (wire48 ?
                      ({(!wire46[(2'h3):(1'h1)]),
                          (~|((8'hb2) + wire46))} + wire46) : wire46[(4'ha):(2'h2)]);
  always
    @(posedge clk) begin
      reg51 <= $signed((wire48 ?
          (8'hae) : (^{(~&(8'hb0)), ((8'hb1) << wire48)})));
      reg52 <= wire47[(3'h5):(3'h4)];
      reg53 <= wire50[(5'h11):(1'h0)];
      reg54 <= $signed(reg53[(2'h2):(1'h0)]);
    end
  assign wire55 = wire47[(4'ha):(3'h5)];
  assign wire56 = ($signed(reg54) ?
                      $unsigned(((^~$signed(wire49)) ?
                          reg53[(4'hf):(4'he)] : (+$signed(wire50)))) : ($signed($signed($signed(reg52))) <<< $unsigned((~|(reg54 >= wire55)))));
  always
    @(posedge clk) begin
      if ($signed(((~&(wire56[(3'h6):(2'h3)] << (7'h44))) ?
          $signed($unsigned((reg54 ? wire55 : reg54))) : $signed(({wire49} ?
              (+wire46) : $unsigned(reg52))))))
        begin
          reg57 <= ((&(^~($unsigned(wire55) ~^ (8'hae)))) ?
              $unsigned((~|(((8'hb9) && reg51) != (wire48 && wire49)))) : {reg52[(3'h6):(1'h0)],
                  ($signed($unsigned((7'h44))) ?
                      (~&$unsigned(reg54)) : $unsigned((reg51 ?
                          wire55 : wire50)))});
          if ((reg57[(2'h2):(2'h2)] == (&$signed($signed({(8'hb8), (8'ha4)})))))
            begin
              reg58 <= (wire56 < (~&wire49[(3'h5):(1'h0)]));
              reg59 <= (($signed($signed((8'ha5))) * {((reg57 ?
                              (8'h9d) : reg53) ?
                          $unsigned(reg52) : $signed(wire56))}) ?
                  $unsigned((^(&(reg52 & reg53)))) : (|$unsigned(wire49[(3'h5):(3'h5)])));
              reg60 <= reg53;
            end
          else
            begin
              reg58 <= ((wire55 >>> $signed(((reg58 >>> (8'hb8)) * (reg53 ?
                  (8'hbb) : wire56)))) >>> $signed((~&$signed($unsigned(reg52)))));
            end
          if (({reg60} ?
              (wire50[(5'h11):(3'h7)] + ($signed($signed(reg54)) < $signed((wire55 << wire50)))) : $signed($unsigned((reg57 && (wire47 >= reg51))))))
            begin
              reg61 <= $unsigned((~|((wire55 < ((8'had) ?
                  wire55 : reg59)) <<< $unsigned($unsigned(reg58)))));
            end
          else
            begin
              reg61 <= ($signed($signed((reg58[(3'h5):(3'h4)] <<< (reg58 ?
                      (8'hb0) : wire49)))) ?
                  reg53 : reg53[(4'hd):(4'hb)]);
              reg62 <= (reg53 & ($signed(reg59[(5'h11):(4'ha)]) ?
                  {wire48[(3'h5):(1'h1)],
                      {$unsigned(reg53)}} : wire55[(2'h3):(2'h2)]));
            end
          if (wire46[(4'hf):(4'hb)])
            begin
              reg63 <= $signed(($unsigned((wire56[(3'h4):(3'h4)] < $unsigned(wire55))) ?
                  {reg58, {wire55[(4'ha):(1'h0)]}} : {{$signed(reg59)},
                      ($signed(reg58) ? $signed(wire48) : {reg59, wire49})}));
              reg64 <= reg61;
              reg65 <= (wire47 ?
                  $unsigned((^reg64)) : (^($signed((wire56 ?
                      reg54 : reg63)) >= wire49)));
              reg66 <= ($signed($unsigned({reg59})) ?
                  $signed($signed((-wire55))) : (((+(reg65 <<< reg51)) ?
                          $signed($unsigned(reg58)) : {reg64}) ?
                      $signed($unsigned((!wire56))) : ($unsigned({reg61}) ?
                          wire49 : $signed((wire46 ? (8'hb3) : wire55)))));
              reg67 <= wire55;
            end
          else
            begin
              reg63 <= wire55;
              reg64 <= ((^~wire48[(4'ha):(3'h6)]) ?
                  $signed({$signed(reg54[(4'h9):(1'h1)]),
                      ((reg57 >> (8'hb3)) ?
                          $signed(wire49) : $unsigned(reg64))}) : ((8'hb6) ?
                      ($signed((reg58 >= reg60)) - (+wire55[(1'h1):(1'h0)])) : $signed((wire46[(4'h9):(3'h4)] ?
                          (^~(7'h41)) : $unsigned(wire50)))));
              reg65 <= (&(((reg66 * wire48[(2'h3):(2'h3)]) != (reg53[(4'hf):(4'hd)] <<< (reg63 >> reg65))) <<< reg65[(5'h15):(4'h8)]));
              reg66 <= wire56;
            end
          if (wire47)
            begin
              reg68 <= (reg67 ? wire50[(4'hd):(3'h6)] : (^reg59));
              reg69 <= reg51;
              reg70 <= ({{reg52[(5'h12):(4'ha)],
                      wire50[(4'hb):(1'h1)]}} & (reg57 ? wire48 : reg52));
            end
          else
            begin
              reg68 <= {reg67};
              reg69 <= (($unsigned($unsigned(wire50[(4'ha):(3'h7)])) ?
                      reg53 : $signed($signed((wire50 != (8'h9c))))) ?
                  wire56 : (reg69 ? (^~(^{wire56})) : $signed(wire50)));
            end
        end
      else
        begin
          if ({(~&wire50)})
            begin
              reg57 <= (&((!$unsigned(reg69)) ?
                  wire50[(5'h10):(4'hd)] : wire48));
              reg58 <= (^~((-wire56) ?
                  $signed(($signed(reg53) || (~wire48))) : (((wire55 * (8'ha7)) <<< $unsigned(reg67)) ?
                      reg60[(2'h2):(1'h0)] : (reg58 ?
                          ((8'hb2) ? reg63 : wire49) : (~wire50)))));
              reg59 <= {((-($unsigned(wire46) ~^ reg60[(1'h0):(1'h0)])) << $unsigned($unsigned($unsigned((8'ha1))))),
                  $signed($signed((~reg51)))};
              reg60 <= $signed((+wire46));
              reg61 <= reg53[(4'he):(4'h8)];
            end
          else
            begin
              reg57 <= (~^$unsigned($signed((reg58 ?
                  reg57[(3'h5):(3'h4)] : (~|reg70)))));
            end
          reg62 <= $signed(({$signed($signed((8'hbe)))} ^ $signed($unsigned(reg65))));
          reg63 <= reg68[(2'h3):(1'h0)];
        end
      reg71 <= reg51;
      if ($unsigned(wire49[(3'h6):(3'h6)]))
        begin
          reg72 <= wire56;
          if ((&$unsigned((reg54[(2'h3):(1'h0)] ?
              (!(reg59 ?
                  (8'hb3) : reg64)) : ($unsigned(reg64) || reg69[(2'h2):(1'h0)])))))
            begin
              reg73 <= reg66[(3'h6):(1'h0)];
              reg74 <= wire55;
              reg75 <= {(reg59[(5'h10):(4'he)] > (~&wire48))};
              reg76 <= $unsigned(((~|$signed(reg74[(3'h5):(1'h0)])) ?
                  wire55 : (~|((reg73 ? reg70 : wire47) * $signed(reg63)))));
              reg77 <= (^~$unsigned((($signed(reg60) ?
                  wire56 : reg61) < $unsigned((&reg51)))));
            end
          else
            begin
              reg73 <= (^((8'hbe) ?
                  $unsigned($unsigned($unsigned(reg73))) : (($signed(wire50) <<< reg60) ?
                      $unsigned((reg61 & wire47)) : $signed((reg75 ?
                          wire47 : wire50)))));
              reg74 <= $signed($signed($unsigned(($signed(reg51) ?
                  {(7'h44), reg72} : reg72))));
              reg75 <= $signed({$unsigned(reg60[(2'h2):(1'h1)])});
              reg76 <= ($unsigned($signed(({reg70} ?
                  (|wire55) : reg73[(3'h6):(1'h1)]))) ^ ($unsigned((~&reg54[(2'h2):(1'h0)])) ?
                  $unsigned((reg71[(4'h9):(3'h6)] ?
                      wire49 : $signed(reg75))) : (reg54[(2'h3):(1'h1)] ?
                      $unsigned($signed(reg63)) : (|$signed(reg76)))));
            end
        end
      else
        begin
          reg72 <= reg70[(1'h0):(1'h0)];
        end
      reg78 <= reg60;
      reg79 <= $unsigned(reg61);
    end
  assign wire80 = reg63;
  assign wire81 = ($signed((&(wire80 ?
                      reg59 : (reg63 ^~ reg73)))) & ((+$signed(reg64)) < ((&$signed(reg68)) ?
                      $unsigned((wire47 ? reg66 : reg57)) : ({reg54,
                          reg76} != reg78))));
  assign wire82 = wire50[(4'h8):(3'h6)];
  assign wire83 = ($signed(wire81[(2'h3):(1'h1)]) ?
                      ((reg73 >>> wire56[(4'h8):(1'h1)]) ?
                          ($unsigned($unsigned(wire55)) ?
                              (&(~|reg68)) : reg68) : (($signed(wire50) > (reg76 ^~ reg71)) ?
                              reg65 : $unsigned(((8'ha5) ~^ reg64)))) : reg77[(2'h2):(1'h0)]);
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h158):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire10;
  input wire signed [(4'hb):(1'h0)] wire9;
  input wire [(3'h4):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire7;
  input wire signed [(4'hd):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire41;
  wire signed [(4'hf):(1'h0)] wire40;
  wire [(2'h2):(1'h0)] wire39;
  wire signed [(3'h7):(1'h0)] wire27;
  wire [(4'h8):(1'h0)] wire26;
  wire signed [(5'h11):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire13;
  wire signed [(3'h7):(1'h0)] wire12;
  wire [(3'h4):(1'h0)] wire11;
  reg signed [(3'h6):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire27,
                 wire26,
                 wire25,
                 wire13,
                 wire12,
                 wire11,
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
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire11 = wire6[(4'hd):(3'h4)];
  assign wire12 = (wire10[(1'h1):(1'h0)] ?
                      (~$signed(wire10[(3'h7):(3'h7)])) : $signed($signed($unsigned((wire9 << wire7)))));
  assign wire13 = wire10[(5'h10):(2'h2)];
  always
    @(posedge clk) begin
      if (wire7[(3'h4):(1'h0)])
        begin
          reg14 <= wire7[(1'h1):(1'h0)];
          if (($unsigned($signed($signed(wire6))) ?
              (wire12[(3'h4):(2'h3)] >>> wire6[(4'h9):(4'h9)]) : $signed($unsigned($unsigned(wire9)))))
            begin
              reg15 <= $signed($unsigned((~$unsigned((wire7 ?
                  wire10 : wire10)))));
              reg16 <= wire11;
              reg17 <= wire10[(5'h11):(4'hb)];
              reg18 <= {{$unsigned(((reg15 + wire11) ?
                          ((8'haa) ? wire8 : reg15) : {wire11}))}};
            end
          else
            begin
              reg15 <= wire13;
              reg16 <= ($unsigned(wire7) ?
                  $signed({(-reg17[(2'h3):(1'h1)])}) : ((+(-(wire6 ?
                      reg15 : (8'hbf)))) == reg18[(4'h8):(3'h5)]));
              reg17 <= $unsigned((-wire11[(2'h3):(1'h1)]));
              reg18 <= ($unsigned(($signed((~&(8'ha3))) >>> {(wire9 << wire10)})) << reg17);
            end
          reg19 <= wire6[(4'hc):(3'h4)];
          if ($unsigned($unsigned(((~^reg14[(1'h1):(1'h1)]) <= (reg18[(3'h4):(2'h2)] ^~ $signed(wire13))))))
            begin
              reg20 <= $signed(({{{wire9}},
                  $signed(wire6)} + $unsigned(((reg17 ? (8'ha0) : wire11) ?
                  $unsigned(reg19) : $unsigned((7'h43))))));
            end
          else
            begin
              reg20 <= {$signed(({{reg15, reg15}} ?
                      (reg18[(1'h1):(1'h0)] ?
                          (reg16 ?
                              wire11 : wire6) : $unsigned(wire11)) : $unsigned((^(7'h44)))))};
              reg21 <= $signed(reg19);
            end
          reg22 <= ($signed(((~^(wire9 ? wire6 : (8'h9f))) ?
                  {$signed(wire13),
                      (wire7 ? wire11 : reg17)} : {(wire11 < (8'h9d))})) ?
              ((({wire12, (8'hab)} ?
                  (wire10 ? reg14 : reg17) : (wire13 ?
                      reg15 : (8'hb7))) >= (|reg15)) * reg15) : (|($unsigned($unsigned(reg15)) ?
                  {(reg21 >>> wire11), (~^reg19)} : $signed((^~(8'ha9))))));
        end
      else
        begin
          if ($signed((wire11 >= wire13)))
            begin
              reg14 <= wire8;
            end
          else
            begin
              reg14 <= (($unsigned(((+(8'hb1)) + reg16)) ?
                  $signed($signed((reg16 + wire11))) : reg20[(3'h4):(2'h2)]) - $unsigned((~^{$signed(wire10),
                  (reg20 ? reg19 : wire6)})));
            end
          reg15 <= reg15[(3'h4):(1'h1)];
          reg16 <= ({$unsigned((~wire6[(4'h9):(3'h4)])),
              reg19[(3'h7):(3'h4)]} <<< ((wire7[(5'h10):(1'h0)] ?
                  wire11[(2'h2):(2'h2)] : ($unsigned((8'h9f)) <= (reg18 >>> (8'hb7)))) ?
              (((~&wire10) ? wire9 : (reg19 ? reg17 : reg21)) ?
                  wire12 : (reg16[(5'h11):(2'h2)] ^ (wire7 ?
                      reg14 : reg19))) : wire6));
          reg17 <= $unsigned($signed({(&(wire8 + wire8))}));
          reg18 <= {(+$unsigned(reg19[(1'h0):(1'h0)])), reg19};
        end
      reg23 <= wire9[(1'h1):(1'h0)];
      reg24 <= $signed(((reg17[(1'h1):(1'h0)] ?
          {(^~reg15),
              reg16[(3'h6):(3'h4)]} : $signed((&(7'h41)))) == (&reg20[(2'h3):(2'h2)])));
    end
  assign wire25 = (8'ha5);
  assign wire26 = (~($signed((^(^wire10))) ?
                      wire6 : ($unsigned(wire6[(3'h4):(1'h0)]) >= wire6[(4'hc):(3'h7)])));
  assign wire27 = $unsigned(((|{(reg18 ? wire25 : wire9)}) != $signed(wire6)));
  always
    @(posedge clk) begin
      reg28 <= (^~reg24[(4'h8):(2'h3)]);
      reg29 <= $unsigned(reg18[(1'h0):(1'h0)]);
      reg30 <= $unsigned({(^~reg29[(2'h3):(1'h0)])});
      reg31 <= {$signed((wire26[(3'h5):(2'h2)] ?
              ((reg23 ? wire7 : (8'h9e)) << (wire8 ?
                  reg14 : reg28)) : ($unsigned(wire13) ?
                  (~^reg30) : wire25[(3'h6):(1'h1)])))};
      reg32 <= ((8'hbe) ? reg15[(2'h2):(1'h0)] : (^reg24));
    end
  always
    @(posedge clk) begin
      if ((~&$unsigned(reg32[(1'h0):(1'h0)])))
        begin
          reg33 <= ($signed((({reg32} == $unsigned(wire7)) == (reg18[(1'h0):(1'h0)] <= $signed((8'hab))))) ?
              ((~&$signed((!(8'ha5)))) ?
                  (reg14[(1'h1):(1'h0)] >> wire6) : reg29) : reg18[(1'h1):(1'h1)]);
          reg34 <= $unsigned($unsigned((^$signed((wire25 ~^ wire25)))));
          reg35 <= reg22[(3'h6):(1'h0)];
        end
      else
        begin
          reg33 <= ($unsigned((|$signed($unsigned(reg33)))) ?
              reg29 : $signed($unsigned({(|reg35)})));
        end
      reg36 <= $unsigned((reg33[(1'h1):(1'h1)] ?
          reg19 : (~$unsigned($signed(reg31)))));
    end
  always
    @(posedge clk) begin
      reg37 <= ($signed((((|reg24) != reg35) ?
              reg34 : ((+reg14) ?
                  (wire27 >= (8'hb6)) : wire10[(4'hc):(1'h0)]))) ?
          reg21[(2'h2):(1'h0)] : (^~(&($unsigned(reg33) ?
              $unsigned(reg21) : {reg32}))));
      reg38 <= reg20;
    end
  assign wire39 = {($signed((!reg19[(2'h3):(2'h3)])) ?
                          $signed(wire7) : $signed((reg14[(4'hb):(4'ha)] ?
                              (wire8 <<< reg22) : (8'h9f))))};
  assign wire40 = (~^wire7[(5'h13):(4'hd)]);
  assign wire41 = ((wire6 >= $signed(reg15)) >= reg38);
endmodule

module module187  (y, clk, wire191, wire190, wire189, wire188);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire191;
  input wire [(4'hc):(1'h0)] wire190;
  input wire signed [(4'h8):(1'h0)] wire189;
  input wire signed [(5'h10):(1'h0)] wire188;
  wire [(4'hf):(1'h0)] wire196;
  wire signed [(2'h2):(1'h0)] wire195;
  wire signed [(4'h9):(1'h0)] wire194;
  wire signed [(5'h12):(1'h0)] wire193;
  wire [(4'hb):(1'h0)] wire192;
  assign y = {wire196, wire195, wire194, wire193, wire192, (1'h0)};
  assign wire192 = $signed(($signed((+wire191)) | wire188));
  assign wire193 = (wire188[(4'h8):(2'h3)] <= (wire191 << (~^wire188)));
  assign wire194 = (|$signed(($signed(wire191) | (^~(wire190 ?
                       wire191 : wire189)))));
  assign wire195 = $unsigned({wire193});
  assign wire196 = $unsigned($unsigned($signed((wire192[(4'h8):(4'h8)] || $unsigned(wire195)))));
endmodule

module module124  (y, clk, wire128, wire127, wire126, wire125);
  output wire [(32'h1c6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire128;
  input wire signed [(3'h5):(1'h0)] wire127;
  input wire signed [(4'ha):(1'h0)] wire126;
  input wire [(4'he):(1'h0)] wire125;
  wire [(4'hb):(1'h0)] wire169;
  wire [(4'he):(1'h0)] wire168;
  wire signed [(4'hb):(1'h0)] wire167;
  wire [(4'hb):(1'h0)] wire166;
  wire [(3'h6):(1'h0)] wire164;
  wire [(2'h3):(1'h0)] wire163;
  wire [(4'hc):(1'h0)] wire162;
  wire signed [(5'h11):(1'h0)] wire161;
  wire signed [(4'h8):(1'h0)] wire160;
  wire signed [(4'hf):(1'h0)] wire159;
  wire signed [(4'h9):(1'h0)] wire142;
  wire [(2'h2):(1'h0)] wire141;
  wire [(3'h4):(1'h0)] wire140;
  wire signed [(4'hd):(1'h0)] wire131;
  wire [(4'he):(1'h0)] wire130;
  wire [(5'h15):(1'h0)] wire129;
  reg signed [(3'h5):(1'h0)] reg165 = (1'h0);
  reg [(4'ha):(1'h0)] reg158 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg157 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg156 = (1'h0);
  reg [(4'he):(1'h0)] reg155 = (1'h0);
  reg [(5'h11):(1'h0)] reg154 = (1'h0);
  reg [(4'hc):(1'h0)] reg153 = (1'h0);
  reg [(2'h2):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg151 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg149 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg147 = (1'h0);
  reg [(4'hc):(1'h0)] reg146 = (1'h0);
  reg [(5'h12):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg144 = (1'h0);
  reg [(5'h10):(1'h0)] reg143 = (1'h0);
  reg [(4'h8):(1'h0)] reg139 = (1'h0);
  reg [(3'h4):(1'h0)] reg138 = (1'h0);
  reg [(4'he):(1'h0)] reg137 = (1'h0);
  reg [(4'hd):(1'h0)] reg136 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg135 = (1'h0);
  reg [(3'h7):(1'h0)] reg134 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg133 = (1'h0);
  reg [(5'h12):(1'h0)] reg132 = (1'h0);
  assign y = {wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire142,
                 wire141,
                 wire140,
                 wire131,
                 wire130,
                 wire129,
                 reg165,
                 reg158,
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
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 (1'h0)};
  assign wire129 = (~|wire128[(3'h6):(1'h0)]);
  assign wire130 = $signed({(+{wire127[(1'h0):(1'h0)]}),
                       $unsigned(wire127[(1'h1):(1'h1)])});
  assign wire131 = wire127[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if (wire125)
        begin
          if (wire131[(4'hb):(4'h9)])
            begin
              reg132 <= $signed(($unsigned((-wire127)) ? wire126 : wire127));
              reg133 <= wire125[(2'h3):(2'h3)];
            end
          else
            begin
              reg132 <= (wire131 ?
                  $unsigned($signed(($unsigned(reg132) + reg132))) : (({(wire131 == wire125),
                      $signed(wire125)} >= wire130[(4'hd):(3'h6)]) != $unsigned($signed(wire130))));
              reg133 <= $unsigned($signed((($signed((8'h9f)) ?
                      wire129 : $signed(wire129)) ?
                  $unsigned($unsigned(wire129)) : (!(~^wire130)))));
              reg134 <= $unsigned(((7'h42) << $signed(wire126)));
              reg135 <= reg132[(1'h1):(1'h0)];
              reg136 <= {reg135, {wire130[(4'hc):(3'h5)]}};
            end
          reg137 <= (wire128[(2'h3):(2'h2)] ^~ $unsigned({{$signed(wire127)},
              {(reg133 > reg135), $unsigned(wire127)}}));
          reg138 <= (($unsigned($unsigned($unsigned(wire129))) && wire127) || reg135[(4'ha):(3'h4)]);
          reg139 <= (wire129[(4'ha):(3'h5)] ?
              {(~$unsigned(((8'ha3) < reg134))),
                  ((8'hb6) ?
                      {(~reg137)} : $signed((wire125 ?
                          reg133 : wire131)))} : reg138);
        end
      else
        begin
          reg132 <= $unsigned($unsigned(reg133));
        end
    end
  assign wire140 = reg135;
  assign wire141 = (((^{reg133[(1'h0):(1'h0)]}) ?
                           ({(&wire125)} < (&(reg134 ?
                               reg134 : wire131))) : ($unsigned((wire126 ?
                                   (8'hb2) : wire129)) ?
                               (-(wire127 ?
                                   reg133 : reg132)) : $signed($signed(wire130)))) ?
                       {wire131[(2'h3):(2'h2)],
                           (!(~|(wire128 ?
                               wire126 : wire128)))} : $signed((!(~wire128[(2'h2):(1'h1)]))));
  assign wire142 = wire126[(3'h6):(2'h3)];
  always
    @(posedge clk) begin
      reg143 <= $unsigned($unsigned($unsigned(wire127)));
      reg144 <= ({$signed({{reg139}})} ?
          {({wire141[(1'h0):(1'h0)],
                  (reg138 ?
                      reg143 : wire130)} <<< $signed((~reg138)))} : {$unsigned(wire127),
              $unsigned((~|wire129))});
      reg145 <= (^(wire141 <<< reg144));
      if ({$unsigned((((8'had) ? wire126 : $signed((8'ha1))) ?
              (8'hb3) : ((reg132 ? reg144 : wire128) ?
                  ((8'ha3) | wire141) : (^wire131)))),
          {((+(~|reg143)) ? wire125 : (8'hbd))}})
        begin
          if (({{(^~wire128[(1'h1):(1'h1)])},
                  ($signed((reg133 ?
                      wire126 : reg144)) >>> $unsigned($signed(reg137)))} ?
              ((((&wire141) ? (^reg134) : (wire125 ? wire127 : wire127)) ?
                  (^$unsigned(reg137)) : (~&reg143[(4'h9):(3'h7)])) * ($unsigned((reg143 | (8'hb9))) ?
                  $unsigned($unsigned(wire127)) : reg144[(4'he):(4'h8)])) : {$unsigned({((8'haf) ?
                          reg135 : (8'ha0))}),
                  ($signed($signed(reg132)) ~^ ((~&reg138) ?
                      (reg134 >>> (8'hb9)) : {wire126}))}))
            begin
              reg146 <= (-$signed(wire125));
              reg147 <= ((8'h9c) ^ wire141[(2'h2):(1'h0)]);
              reg148 <= wire128;
              reg149 <= reg133[(1'h0):(1'h0)];
              reg150 <= reg136[(1'h1):(1'h0)];
            end
          else
            begin
              reg146 <= $signed(($signed((8'hb1)) ^ reg133));
              reg147 <= reg146;
              reg148 <= (8'hbe);
            end
          if ((+($signed((-$unsigned(wire130))) + $unsigned($signed(wire129[(2'h3):(1'h1)])))))
            begin
              reg151 <= wire127;
              reg152 <= (!reg150[(1'h0):(1'h0)]);
              reg153 <= $unsigned(reg150);
              reg154 <= (~&$signed(reg139));
              reg155 <= $signed(wire140);
            end
          else
            begin
              reg151 <= $signed(reg133[(2'h3):(2'h2)]);
              reg152 <= (!reg155[(4'h8):(3'h6)]);
            end
          reg156 <= (((~^{$unsigned(wire125), (reg133 != reg145)}) ?
              $signed((reg152 + reg149)) : (~&(reg139[(1'h0):(1'h0)] ?
                  {reg134} : wire141[(2'h2):(2'h2)]))) + ((reg143[(4'hc):(4'hb)] ?
                  reg147[(3'h5):(2'h3)] : {$unsigned(reg133),
                      (reg152 ? wire129 : reg147)}) ?
              (+$signed($unsigned(reg132))) : (+(!{reg136, reg138}))));
          reg157 <= ({((((8'ha8) != (8'h9e)) ?
                          $unsigned(wire140) : wire126[(4'h9):(4'h8)]) ?
                      (8'h9f) : $signed(reg152)),
                  ((((8'ha2) ? (8'hb5) : (8'hb7)) ?
                          $unsigned(reg152) : (reg146 ? reg143 : reg135)) ?
                      reg132[(5'h10):(4'hf)] : reg153)} ?
              ({$unsigned((reg155 ? reg149 : reg146)),
                  $signed((reg150 << reg155))} && $unsigned(wire131[(3'h7):(2'h3)])) : ((((wire129 ?
                      reg132 : reg149) << (&reg144)) ?
                  {(wire141 >>> reg136)} : {{wire125}}) || (^$signed(wire142[(2'h2):(1'h1)]))));
        end
      else
        begin
          reg146 <= ((({{wire128, (8'had)}} ?
                  reg148 : {reg139,
                      $signed((8'ha7))}) & $unsigned($signed((reg152 != reg149)))) ?
              ((~|((&wire142) <<< $signed(reg149))) >> reg147) : ($signed($signed(reg136)) ~^ reg137));
        end
      reg158 <= $signed($signed($signed(((wire142 || wire142) ?
          (reg134 ? reg136 : reg135) : $unsigned(reg157)))));
    end
  assign wire159 = (~&reg136);
  assign wire160 = ({(reg150 ? $signed($unsigned(reg153)) : reg132),
                           ((8'haa) > $signed(wire142[(4'h8):(1'h1)]))} ?
                       $unsigned(reg144[(4'ha):(3'h5)]) : $unsigned($signed((+(|reg148)))));
  assign wire161 = (wire125 ?
                       $signed(reg149) : {($unsigned(wire127[(3'h4):(2'h3)]) * wire131),
                           reg153});
  assign wire162 = $signed($unsigned($unsigned($signed(reg143))));
  assign wire163 = wire131[(3'h6):(2'h2)];
  assign wire164 = (7'h43);
  always
    @(posedge clk) begin
      reg165 <= ((8'hba) ~^ (-((&$signed(reg151)) ?
          {$unsigned(reg157)} : {(wire127 ? reg158 : wire141),
              wire142[(1'h0):(1'h0)]})));
    end
  assign wire166 = (|$signed($unsigned((~&(!reg134)))));
  assign wire167 = $unsigned((($signed($unsigned(wire162)) ?
                           (wire141[(1'h1):(1'h1)] ?
                               $unsigned((7'h44)) : reg138[(1'h0):(1'h0)]) : (reg145 || reg138[(1'h1):(1'h0)])) ?
                       ($signed(((8'ha2) ? wire142 : reg152)) ?
                           (^$unsigned(reg134)) : $unsigned(wire125[(4'he):(1'h0)])) : $unsigned({(reg153 ?
                               reg157 : reg145),
                           wire162})));
  assign wire168 = ((8'hb0) ?
                       ($unsigned(((+reg147) ?
                               (reg155 ? reg158 : reg155) : ((8'ha3) ?
                                   reg165 : reg157))) ?
                           (wire161 ?
                               $signed(reg143[(4'h9):(3'h4)]) : ($unsigned(reg138) >> $signed(wire163))) : (~|wire159[(4'hc):(2'h2)])) : reg153);
  assign wire169 = reg158;
endmodule

module module98
#(parameter param118 = ((((((8'hb7) ? (8'hb7) : (8'ha8)) * ((8'hb7) ^ (8'haa))) ^ ((&(8'hbc)) << ((8'hac) << (8'hbf)))) << ({{(8'hbc)}, (8'ha3)} ? ((7'h43) ? ((8'hbb) ~^ (8'hb1)) : ((8'haf) ^~ (8'hb1))) : ((^~(8'hb2)) && (~(8'hb8))))) && (((|((8'hb6) >>> (7'h44))) - (((8'ha8) ? (8'ha4) : (8'ha1)) ? (|(7'h41)) : {(8'ha6), (8'hb9)})) + (7'h40))), 
parameter param119 = (!({(8'hbe)} >> {((param118 + param118) ? (~&param118) : {param118})})))
(y, clk, wire103, wire102, wire101, wire100, wire99);
  output wire [(32'hbe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire103;
  input wire [(4'hb):(1'h0)] wire102;
  input wire signed [(3'h6):(1'h0)] wire101;
  input wire signed [(5'h15):(1'h0)] wire100;
  input wire signed [(2'h3):(1'h0)] wire99;
  wire [(4'he):(1'h0)] wire117;
  wire signed [(4'ha):(1'h0)] wire115;
  wire [(4'hc):(1'h0)] wire114;
  wire [(5'h14):(1'h0)] wire113;
  wire signed [(4'h8):(1'h0)] wire112;
  wire [(5'h13):(1'h0)] wire111;
  wire [(5'h14):(1'h0)] wire110;
  wire [(5'h10):(1'h0)] wire109;
  wire [(4'he):(1'h0)] wire108;
  wire signed [(5'h11):(1'h0)] wire107;
  wire signed [(4'hf):(1'h0)] wire106;
  wire [(3'h5):(1'h0)] wire105;
  wire [(2'h2):(1'h0)] wire104;
  reg signed [(5'h11):(1'h0)] reg116 = (1'h0);
  assign y = {wire117,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 reg116,
                 (1'h0)};
  assign wire104 = wire101;
  assign wire105 = ((wire100[(4'hb):(3'h7)] - (^wire99[(2'h2):(2'h2)])) ?
                       (!$signed($signed((wire101 ?
                           wire102 : wire99)))) : $signed(wire101[(1'h0):(1'h0)]));
  assign wire106 = $signed($signed((wire104[(2'h2):(2'h2)] & {wire105[(2'h3):(2'h2)]})));
  assign wire107 = ((wire102 ~^ wire105) ?
                       (~&wire101[(3'h4):(1'h1)]) : ((&{$unsigned(wire102),
                           {wire101, wire103}}) >>> (&wire101[(3'h5):(2'h2)])));
  assign wire108 = {{(^~$unsigned((!wire106))), wire101},
                       ((8'ha2) ?
                           (7'h42) : ($signed(((8'hb7) << wire102)) ?
                               ((~^wire101) ?
                                   (wire107 ?
                                       wire103 : wire104) : (wire101 < (8'hbe))) : wire106))};
  assign wire109 = (&{(|$signed((wire106 ? wire108 : wire106))),
                       (|$unsigned($unsigned(wire107)))});
  assign wire110 = wire102[(2'h3):(1'h0)];
  assign wire111 = {({wire104,
                           ((~^(8'hbf)) >>> $signed(wire101))} >= wire100[(3'h4):(1'h0)])};
  assign wire112 = (({$unsigned({wire110}),
                       (((7'h40) ? (8'ha4) : wire100) ?
                           {wire109,
                               (8'ha8)} : wire106[(4'hd):(3'h7)])} || (^~{(wire100 >> wire107)})) << wire102[(2'h2):(1'h1)]);
  assign wire113 = ($unsigned(({$signed(wire103),
                           (wire102 >> wire109)} ~^ {wire111,
                           wire109[(4'hd):(3'h5)]})) ?
                       $unsigned(($signed(wire105) & $unsigned((+wire101)))) : wire112);
  assign wire114 = ($unsigned(($unsigned((wire106 > wire110)) | $signed(((7'h42) >>> wire110)))) ?
                       (wire111 ?
                           $signed(($unsigned(wire100) && {wire99})) : wire99[(2'h2):(1'h0)]) : $signed(wire100));
  assign wire115 = $unsigned($unsigned((~|wire109[(4'h8):(2'h3)])));
  always
    @(posedge clk) begin
      reg116 <= ((+(wire99 ~^ ($unsigned(wire99) - $unsigned(wire113)))) <<< ((^~$signed((+wire107))) && wire113));
    end
  assign wire117 = (~&((wire99[(2'h2):(1'h0)] ?
                       (((8'hbf) ? wire109 : wire103) ?
                           $unsigned((8'hb6)) : (~|(7'h41))) : $unsigned((^~wire107))) && $unsigned((^wire104[(1'h0):(1'h0)]))));
endmodule
