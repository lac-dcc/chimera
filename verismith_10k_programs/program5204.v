module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h17a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire289;
  wire signed [(5'h13):(1'h0)] wire266;
  wire signed [(4'hd):(1'h0)] wire264;
  wire [(5'h10):(1'h0)] wire207;
  wire [(5'h10):(1'h0)] wire205;
  wire signed [(5'h12):(1'h0)] wire68;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire66;
  wire signed [(4'h9):(1'h0)] wire268;
  wire signed [(4'hf):(1'h0)] wire269;
  wire [(4'hc):(1'h0)] wire270;
  wire [(5'h14):(1'h0)] wire271;
  wire [(2'h3):(1'h0)] wire272;
  wire [(3'h6):(1'h0)] wire277;
  wire [(5'h10):(1'h0)] wire281;
  wire [(4'hb):(1'h0)] wire283;
  wire signed [(4'he):(1'h0)] wire285;
  wire signed [(3'h7):(1'h0)] wire286;
  wire signed [(4'he):(1'h0)] wire287;
  reg [(5'h12):(1'h0)] reg274 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg275 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg276 = (1'h0);
  reg [(3'h5):(1'h0)] reg278 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg279 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg280 = (1'h0);
  reg [(5'h13):(1'h0)] reg282 = (1'h0);
  assign y = {wire289,
                 wire266,
                 wire264,
                 wire207,
                 wire205,
                 wire68,
                 wire5,
                 wire6,
                 wire66,
                 wire268,
                 wire269,
                 wire270,
                 wire271,
                 wire272,
                 wire277,
                 wire281,
                 wire283,
                 wire285,
                 wire286,
                 wire287,
                 reg274,
                 reg275,
                 reg276,
                 reg278,
                 reg279,
                 reg280,
                 reg282,
                 (1'h0)};
  assign wire5 = $unsigned((($signed({wire4}) < $signed($signed((8'hb7)))) ?
                     (-({wire4} ? $unsigned(wire0) : wire2)) : wire2));
  assign wire6 = $unsigned({wire4[(3'h4):(3'h4)]});
  module7 #() modinst67 (wire66, clk, wire6, wire4, wire3, wire0, wire1);
  assign wire68 = (^~wire66[(3'h5):(3'h5)]);
  module69 #() modinst206 (wire205, clk, wire6, wire68, wire1, wire0);
  assign wire207 = $unsigned({$unsigned(((~&wire205) ?
                           $unsigned(wire1) : $unsigned(wire1)))});
  module208 #() modinst265 (.wire209(wire5), .wire211(wire4), .clk(clk), .y(wire264), .wire212(wire205), .wire210(wire66));
  module7 #() modinst267 (.y(wire266), .wire10(wire207), .wire11(wire2), .wire12(wire3), .wire9(wire264), .clk(clk), .wire8(wire6));
  assign wire268 = $unsigned({($unsigned((wire207 || wire3)) ?
                           (+(8'ha8)) : wire68),
                       wire207[(1'h1):(1'h1)]});
  assign wire269 = wire5;
  assign wire270 = wire207[(4'hb):(2'h2)];
  assign wire271 = (^~(wire270[(3'h6):(2'h3)] * wire270));
  module208 #() modinst273 (wire272, clk, wire1, wire266, wire270, wire271);
  always
    @(posedge clk) begin
      reg274 <= $signed(wire66);
      reg275 <= (({wire266[(5'h11):(4'ha)], {$unsigned(wire0)}} ?
          {wire2[(3'h7):(3'h5)]} : ({wire207, $unsigned(wire272)} ?
              (~^wire0) : $signed({wire6,
                  wire207}))) + ({{wire270[(4'hc):(3'h4)]},
              wire0[(3'h6):(1'h0)]} ?
          $signed(wire264) : wire68[(4'hb):(3'h6)]));
      reg276 <= wire270[(4'hc):(3'h7)];
    end
  assign wire277 = (wire270[(4'ha):(2'h2)] ? reg275[(2'h2):(1'h1)] : wire66);
  always
    @(posedge clk) begin
      reg278 <= ({{(7'h41)}} ~^ $unsigned(wire6[(4'h8):(1'h1)]));
      reg279 <= ((^~(~|$signed(reg275))) ?
          wire205 : (+{((reg275 ? wire1 : (8'hb5)) ^~ {wire270, wire266}),
              (~(8'h9d))}));
      reg280 <= $unsigned($signed(wire205));
    end
  assign wire281 = wire269;
  always
    @(posedge clk) begin
      reg282 <= {((wire264 ?
              wire5[(5'h12):(4'hd)] : (+wire2[(3'h4):(2'h2)])) - $signed(wire2[(3'h5):(2'h2)])),
          $signed((8'hb7))};
    end
  module7 #() modinst284 (wire283, clk, wire264, wire6, reg279, wire4, wire281);
  assign wire285 = (~((($signed((7'h41)) | $unsigned(wire1)) ?
                           (8'h9f) : ((wire66 * wire271) ^ ((8'haf) >= wire271))) ?
                       ($unsigned((reg275 == wire277)) ?
                           ((reg282 + wire207) ?
                               (~&wire68) : ((8'ha2) - wire6)) : (8'hb4)) : (-reg275)));
  assign wire286 = ((({$unsigned((7'h40))} || ($unsigned(reg280) ?
                           $unsigned((8'hba)) : reg280[(2'h2):(1'h0)])) ?
                       (wire281[(3'h4):(1'h1)] ^ ((wire269 ^~ wire270) ?
                           {wire0,
                               wire5} : $signed(wire269))) : wire207) <= $unsigned($unsigned($unsigned($unsigned(wire285)))));
  module7 #() modinst288 (.clk(clk), .wire12(reg279), .wire8(wire269), .wire10(wire68), .y(wire287), .wire9(wire266), .wire11(reg282));
  assign wire289 = (reg279[(2'h3):(1'h0)] != (wire3[(2'h3):(2'h3)] ?
                       reg276 : (!wire287[(4'hc):(1'h1)])));
endmodule

module module208  (y, clk, wire212, wire211, wire210, wire209);
  output wire [(32'h11a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire212;
  input wire [(4'hc):(1'h0)] wire211;
  input wire [(4'hc):(1'h0)] wire210;
  input wire [(5'h14):(1'h0)] wire209;
  wire signed [(4'hc):(1'h0)] wire263;
  wire [(4'hf):(1'h0)] wire262;
  wire [(3'h5):(1'h0)] wire261;
  wire signed [(3'h5):(1'h0)] wire242;
  wire [(5'h14):(1'h0)] wire239;
  wire signed [(4'h8):(1'h0)] wire213;
  reg [(4'hc):(1'h0)] reg260 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg259 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg258 = (1'h0);
  reg [(4'h9):(1'h0)] reg257 = (1'h0);
  reg [(3'h4):(1'h0)] reg256 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg255 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg254 = (1'h0);
  reg [(4'ha):(1'h0)] reg253 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg252 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg251 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg250 = (1'h0);
  reg [(4'h8):(1'h0)] reg249 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg248 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg247 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg246 = (1'h0);
  reg [(3'h6):(1'h0)] reg245 = (1'h0);
  reg [(2'h3):(1'h0)] reg244 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg243 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg241 = (1'h0);
  assign y = {wire263,
                 wire262,
                 wire261,
                 wire242,
                 wire239,
                 wire213,
                 reg260,
                 reg259,
                 reg258,
                 reg257,
                 reg256,
                 reg255,
                 reg254,
                 reg253,
                 reg252,
                 reg251,
                 reg250,
                 reg249,
                 reg248,
                 reg247,
                 reg246,
                 reg245,
                 reg244,
                 reg243,
                 reg241,
                 (1'h0)};
  assign wire213 = $unsigned((wire212 >= wire212));
  module214 #() modinst240 (wire239, clk, wire212, wire211, wire213, wire210);
  always
    @(posedge clk) begin
      reg241 <= $signed(wire213);
    end
  assign wire242 = ((~(8'hba)) ?
                       (^$signed($signed((^~wire213)))) : {$signed({{wire210}})});
  always
    @(posedge clk) begin
      if ((wire213 & wire213))
        begin
          if ((($unsigned($unsigned((+wire211))) > wire211) != $signed(wire212)))
            begin
              reg243 <= (^~wire212[(4'hf):(2'h3)]);
              reg244 <= {(~$signed(wire211)),
                  ($unsigned((wire209 <<< wire209[(5'h14):(4'ha)])) ?
                      wire239 : (reg241[(2'h3):(1'h1)] - wire213))};
            end
          else
            begin
              reg243 <= wire212[(1'h0):(1'h0)];
            end
          reg245 <= {wire209, (8'hb2)};
          reg246 <= reg244;
          reg247 <= (~|(wire213 ? {reg246} : (!(~(&wire211)))));
        end
      else
        begin
          reg243 <= reg247[(1'h0):(1'h0)];
          reg244 <= (~|wire211[(3'h7):(2'h2)]);
        end
      if ($unsigned((reg241 ? reg241 : $signed((reg245 & {(8'hb9), (8'hb6)})))))
        begin
          reg248 <= {wire210[(4'h8):(2'h3)]};
        end
      else
        begin
          if ($unsigned(({((wire212 & wire213) ?
                  $unsigned((8'hb9)) : $unsigned(reg241)),
              ($signed(reg248) <<< wire242[(1'h1):(1'h1)])} && $unsigned(wire239))))
            begin
              reg248 <= ({$unsigned((-((8'hb5) ? reg248 : reg244))),
                  $unsigned($signed($unsigned(wire209)))} <= $unsigned((^{reg245[(2'h3):(1'h0)]})));
              reg249 <= (8'had);
            end
          else
            begin
              reg248 <= ({(wire210[(2'h2):(1'h1)] ?
                      reg245 : reg248)} * ((((wire209 ? reg247 : wire239) ?
                      {wire212} : $signed(reg249)) && wire211) ?
                  reg245[(3'h4):(2'h2)] : (~reg243)));
              reg249 <= ({wire211, $signed(reg246)} ?
                  $unsigned(reg248[(3'h5):(1'h0)]) : reg243[(5'h13):(5'h10)]);
              reg250 <= (^~wire211);
              reg251 <= wire213;
            end
        end
      reg252 <= wire213[(1'h1):(1'h0)];
      if ($unsigned($signed(((+$signed(reg247)) ?
          {(wire209 << reg246)} : ((+wire212) - $unsigned(reg248))))))
        begin
          if (reg243[(1'h1):(1'h1)])
            begin
              reg253 <= (+($unsigned($unsigned(reg243)) ?
                  $signed(({(8'hbe)} ?
                      (~(8'haa)) : $signed(reg245))) : wire211[(2'h2):(1'h1)]));
              reg254 <= (!((+((wire211 ~^ reg246) ?
                  wire210 : wire211)) <= $unsigned(({reg248, wire210} ?
                  wire210 : $signed(reg249)))));
              reg255 <= ($unsigned(reg251[(3'h5):(1'h1)]) ?
                  (~reg249[(1'h1):(1'h1)]) : reg253[(4'h8):(4'h8)]);
            end
          else
            begin
              reg253 <= (-(8'ha5));
              reg254 <= ($signed(wire212[(4'hd):(4'ha)]) ?
                  wire210[(3'h6):(3'h4)] : $signed(($signed((^reg241)) ?
                      ((reg241 ? reg247 : wire213) <= (wire242 ?
                          (8'hae) : reg247)) : (+$signed(wire242)))));
            end
          if ((wire211 ?
              ($unsigned(reg255[(3'h5):(2'h2)]) > (^~$unsigned($signed(wire209)))) : (reg252[(3'h6):(1'h1)] >> $unsigned($signed($unsigned(reg243))))))
            begin
              reg256 <= $unsigned(((($signed(wire209) && (reg252 == (8'hb9))) ?
                      (-$unsigned(reg254)) : (~^wire212[(4'h8):(2'h2)])) ?
                  ({(^reg246)} + (~^wire213)) : $signed(reg254[(1'h0):(1'h0)])));
              reg257 <= reg248[(3'h4):(1'h0)];
              reg258 <= {wire213[(3'h5):(2'h3)]};
              reg259 <= $unsigned(reg244);
              reg260 <= (~&$signed($unsigned(reg251[(3'h4):(1'h0)])));
            end
          else
            begin
              reg256 <= (-$signed(((reg246 ?
                  reg244 : (&reg246)) | $unsigned((!wire212)))));
              reg257 <= wire212;
              reg258 <= $unsigned(reg241[(5'h14):(4'hd)]);
            end
        end
      else
        begin
          reg253 <= {$signed(reg246[(1'h0):(1'h0)])};
        end
    end
  assign wire261 = ((((&$signed(reg245)) >= {reg251[(3'h4):(1'h0)]}) ?
                       ((&{reg256, wire210}) >>> ($signed(wire212) < {reg246,
                           reg244})) : (((reg255 + wire211) + reg254) != (((8'haa) <= wire242) ^ reg246))) & reg252[(3'h7):(3'h4)]);
  assign wire262 = (|{($unsigned((^~reg249)) ?
                           wire242 : $signed((reg258 != reg241)))});
  assign wire263 = $unsigned(reg250);
endmodule

module module69
#(parameter param204 = (({(~|(~(8'hba))), ((8'hba) - ((8'ha9) && (7'h42)))} != {(((8'ha8) ^~ (7'h41)) > {(8'hb9)}), (^((8'ha9) ? (8'haf) : (8'hb2)))}) ^~ (8'hbc)))
(y, clk, wire73, wire72, wire71, wire70);
  output wire [(32'h156):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire73;
  input wire [(3'h4):(1'h0)] wire72;
  input wire [(4'h8):(1'h0)] wire71;
  input wire [(4'hc):(1'h0)] wire70;
  wire signed [(5'h10):(1'h0)] wire202;
  wire signed [(4'hb):(1'h0)] wire158;
  wire signed [(5'h11):(1'h0)] wire156;
  wire [(4'hc):(1'h0)] wire97;
  wire [(4'he):(1'h0)] wire96;
  wire [(2'h3):(1'h0)] wire95;
  wire signed [(4'hc):(1'h0)] wire94;
  wire signed [(4'hb):(1'h0)] wire93;
  wire signed [(5'h10):(1'h0)] wire92;
  wire [(5'h13):(1'h0)] wire90;
  wire [(5'h10):(1'h0)] wire89;
  wire signed [(4'hc):(1'h0)] wire81;
  wire signed [(3'h4):(1'h0)] wire80;
  wire [(4'hc):(1'h0)] wire76;
  wire signed [(4'hd):(1'h0)] wire75;
  wire [(3'h5):(1'h0)] wire74;
  reg signed [(2'h2):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg78 = (1'h0);
  reg [(5'h13):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg87 = (1'h0);
  reg [(4'hb):(1'h0)] reg88 = (1'h0);
  reg [(3'h5):(1'h0)] reg91 = (1'h0);
  reg [(4'he):(1'h0)] reg98 = (1'h0);
  assign y = {wire202,
                 wire158,
                 wire156,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire90,
                 wire89,
                 wire81,
                 wire80,
                 wire76,
                 wire75,
                 wire74,
                 reg77,
                 reg78,
                 reg79,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg91,
                 reg98,
                 (1'h0)};
  assign wire74 = $signed(wire71);
  assign wire75 = (~$signed(wire70[(2'h2):(1'h1)]));
  assign wire76 = wire70[(3'h5):(1'h1)];
  always
    @(posedge clk) begin
      reg77 <= ($signed(wire76) <<< ($signed((wire71[(2'h2):(1'h1)] <<< $signed(wire74))) ?
          wire76[(4'h8):(3'h4)] : {(8'hb0),
              (wire75[(4'hc):(2'h2)] ?
                  ((8'ha6) ? wire71 : (8'ha0)) : (wire73 << (8'hae)))}));
      reg78 <= $signed($signed(wire73[(3'h5):(1'h1)]));
      reg79 <= (+$unsigned($signed((((8'ha4) & wire70) <<< $unsigned(reg78)))));
    end
  assign wire80 = {(^~((reg79 ?
                          reg77[(2'h2):(1'h1)] : wire73) > ((-wire76) && $unsigned(wire76)))),
                      $unsigned($unsigned({(wire72 < wire74), wire72}))};
  assign wire81 = $signed({(8'h9d), (^$unsigned(wire72))});
  always
    @(posedge clk) begin
      reg82 <= ((~|wire70[(3'h5):(3'h5)]) - reg78[(2'h2):(2'h2)]);
      reg83 <= $signed(((((8'ha2) == $signed(wire72)) ?
              $signed(wire73) : (((8'ha1) - wire80) | $signed((7'h44)))) ?
          $unsigned($unsigned((wire81 >>> wire75))) : $unsigned($signed(wire80[(1'h1):(1'h1)]))));
      if (wire72)
        begin
          reg84 <= (wire73[(3'h5):(2'h3)] ?
              $unsigned($unsigned(wire76[(4'h8):(1'h1)])) : $signed(((((7'h44) ?
                      wire73 : wire81) ?
                  (wire80 ? (8'hb5) : reg79) : $unsigned(wire80)) - ((reg82 ?
                      reg79 : reg83) ?
                  (&(8'hb8)) : {reg82, wire76}))));
          reg85 <= reg84[(3'h6):(1'h0)];
          reg86 <= wire75[(2'h3):(1'h0)];
          reg87 <= $signed($unsigned(wire72));
        end
      else
        begin
          reg84 <= (((($unsigned(wire72) >> (reg78 ?
              reg79 : wire73)) == $unsigned($signed(wire72))) | (((wire81 ?
                  reg86 : reg78) && (7'h41)) ?
              {wire72[(2'h3):(2'h3)]} : reg85)) != ($unsigned(reg77[(1'h0):(1'h0)]) && ($signed($unsigned(reg84)) * {$unsigned(reg84)})));
          reg85 <= {($signed({(reg79 > reg84)}) >= $unsigned((((8'ha8) ?
                  (8'hb2) : (8'ha5)) * reg87[(4'hd):(4'hc)])))};
          reg86 <= wire81;
          reg87 <= $unsigned((+$signed($signed(reg85[(5'h13):(3'h5)]))));
        end
      reg88 <= $signed(reg77);
    end
  assign wire89 = $unsigned($unsigned($unsigned(($signed(reg78) ?
                      reg77 : (wire81 < wire76)))));
  assign wire90 = wire81[(4'hb):(2'h2)];
  always
    @(posedge clk) begin
      reg91 <= (wire90 - ((((^reg77) > (wire90 ? (8'h9c) : wire76)) ?
          (~^$unsigned(wire89)) : (~&(wire72 <= wire73))) << reg82));
    end
  assign wire92 = (-($signed((~&reg84[(1'h1):(1'h1)])) ?
                      $signed((reg78 * wire89[(4'hf):(4'hb)])) : ({(~|wire81),
                              reg86} ?
                          {{wire80, wire90},
                              (wire81 ? (8'hae) : reg86)} : {$unsigned(wire81),
                              $unsigned(wire80)})));
  assign wire93 = wire72;
  assign wire94 = ((reg77 != ($unsigned((reg79 ?
                          reg85 : reg82)) >= (reg78[(3'h4):(1'h1)] ?
                          reg79[(2'h3):(2'h2)] : (wire71 ? wire92 : wire76)))) ?
                      (reg82[(4'ha):(3'h4)] == (wire75[(4'h8):(3'h7)] >>> (~&reg83))) : $signed((~^wire70)));
  assign wire95 = ($signed($unsigned($unsigned((reg79 ? (8'hbb) : wire81)))) ?
                      ($unsigned({wire73, (reg87 >>> reg78)}) ?
                          ({((8'hb3) ? wire72 : wire93)} || ($signed((8'hbf)) ?
                              $unsigned(wire90) : {reg91,
                                  wire76})) : (wire94[(1'h0):(1'h0)] ?
                              (~wire74[(1'h1):(1'h1)]) : ($signed(wire74) & $unsigned(wire94)))) : wire72);
  assign wire96 = wire75;
  assign wire97 = $signed((wire93 ?
                      (reg83[(3'h7):(3'h5)] && (wire94[(3'h4):(1'h0)] - $unsigned((8'had)))) : (&(~|$unsigned(reg77)))));
  always
    @(posedge clk) begin
      reg98 <= $signed(((wire81[(4'hb):(4'hb)] * wire97[(4'h8):(2'h2)]) >> wire76[(4'h9):(1'h1)]));
    end
  module99 #() modinst157 (wire156, clk, wire81, wire97, reg82, reg98, reg86);
  assign wire158 = wire93;
  module159 #() modinst203 (wire202, clk, reg91, wire93, reg98, wire75);
endmodule

module module7  (y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h274):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire12;
  input wire [(5'h13):(1'h0)] wire11;
  input wire signed [(5'h10):(1'h0)] wire10;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire [(3'h4):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire65;
  wire [(5'h10):(1'h0)] wire50;
  wire [(3'h7):(1'h0)] wire49;
  wire [(3'h5):(1'h0)] wire48;
  wire [(4'h9):(1'h0)] wire43;
  wire signed [(2'h3):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire41;
  wire signed [(4'hf):(1'h0)] wire22;
  reg signed [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(4'h8):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg [(5'h15):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg56 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg [(4'hd):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg52 = (1'h0);
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  reg [(5'h12):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg45 = (1'h0);
  reg signed [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(5'h10):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  assign y = {wire65,
                 wire50,
                 wire49,
                 wire48,
                 wire43,
                 wire42,
                 wire41,
                 wire22,
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
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg40,
                 reg39,
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
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned(wire9[(2'h3):(1'h1)]))
        begin
          reg13 <= wire10[(1'h1):(1'h1)];
          reg14 <= reg13;
        end
      else
        begin
          reg13 <= wire12;
          reg14 <= (wire8 & $signed({$unsigned((7'h40)), (|$signed(reg14))}));
          if ((wire10[(3'h7):(1'h1)] ?
              {((!wire10) ?
                      ((wire8 && (8'ha9)) ?
                          (~|reg14) : (wire10 - reg13)) : reg14[(2'h3):(1'h0)])} : ((reg13 + ((wire11 ^~ wire9) ^~ (^reg14))) ?
                  ((wire8 ?
                      (reg14 ?
                          reg13 : wire10) : wire12[(3'h4):(2'h2)]) || ((reg14 ?
                      wire8 : wire8) ^~ $signed(wire10))) : $unsigned({(~wire9),
                      (wire8 >> reg14)}))))
            begin
              reg15 <= wire9[(1'h0):(1'h0)];
            end
          else
            begin
              reg15 <= (!$signed($unsigned((wire12[(2'h2):(2'h2)] > $signed(reg15)))));
              reg16 <= ({(8'ha7)} ^~ ((reg15 | ($unsigned((7'h43)) == (8'hb7))) + {(reg13[(1'h1):(1'h0)] < $signed(reg14))}));
              reg17 <= wire8[(3'h4):(2'h3)];
              reg18 <= $signed(wire11[(4'h8):(3'h7)]);
              reg19 <= reg17[(3'h4):(1'h1)];
            end
          reg20 <= (wire10 ?
              $signed((reg13[(1'h0):(1'h0)] ?
                  {$unsigned(reg18),
                      reg19[(5'h11):(3'h6)]} : (~^(^(8'hb7))))) : $signed(wire9));
        end
      reg21 <= $signed(reg20[(3'h5):(2'h2)]);
    end
  assign wire22 = ($signed(((^(reg13 ^~ (8'hb3))) ?
                      {$signed(reg21)} : $signed($signed((7'h42))))) & reg17[(4'ha):(2'h3)]);
  always
    @(posedge clk) begin
      reg23 <= ($signed(reg13[(2'h3):(1'h1)]) ?
          (+wire10[(2'h3):(2'h3)]) : reg14);
      if ((((~&{(|wire9)}) << $unsigned($signed((wire10 ? reg19 : wire11)))) ?
          (~(!{reg19[(5'h13):(3'h4)], {wire10}})) : (~wire11[(4'hc):(4'hc)])))
        begin
          if (((-(8'h9e)) <<< {((!((8'h9e) == (8'hbb))) <<< ($unsigned(reg19) < {wire9,
                  reg18}))}))
            begin
              reg24 <= $unsigned(reg20[(3'h5):(2'h2)]);
            end
          else
            begin
              reg24 <= $unsigned(reg14[(2'h2):(2'h2)]);
              reg25 <= $signed($signed((^(8'hb4))));
            end
          reg26 <= wire10;
          reg27 <= wire8[(1'h1):(1'h1)];
        end
      else
        begin
          reg24 <= (((wire8[(1'h0):(1'h0)] > $unsigned((reg27 > reg14))) == {wire12,
              reg19}) ~^ $unsigned($unsigned(reg16)));
          if ((wire9 * (((&$unsigned(reg18)) <<< $signed(((7'h41) >>> reg27))) >> reg20)))
            begin
              reg25 <= $signed((~(+$signed($signed(reg19)))));
              reg26 <= reg26[(3'h6):(1'h0)];
              reg27 <= (-((!$signed(wire12)) >>> reg13[(2'h3):(2'h2)]));
              reg28 <= (($signed((8'hb9)) ?
                      $unsigned(reg18) : ($signed((wire10 || reg16)) >= (wire8 <= (reg25 ~^ wire8)))) ?
                  ({(~wire8)} ?
                      (wire9 < $unsigned((reg13 == reg18))) : wire10[(3'h7):(3'h7)]) : reg23);
            end
          else
            begin
              reg25 <= {$signed(reg28[(1'h0):(1'h0)])};
              reg26 <= $signed($unsigned(($unsigned((reg28 ?
                  reg19 : wire8)) - (8'ha4))));
              reg27 <= ((8'hb3) ? (8'hb7) : reg26[(1'h0):(1'h0)]);
              reg28 <= (8'ha7);
            end
          reg29 <= (8'haf);
        end
      reg30 <= {(({reg24, ((8'ha3) - reg17)} ?
                  $unsigned({reg28}) : reg13[(2'h2):(1'h0)]) ?
              (reg14 ?
                  $signed(((8'hb9) * wire10)) : $unsigned($unsigned(wire9))) : (reg18[(4'h9):(3'h7)] ?
                  ((reg15 ? reg24 : wire11) != (wire8 ?
                      reg20 : reg15)) : $unsigned(((8'hb0) != reg20))))};
      reg31 <= $unsigned({{(wire10[(1'h0):(1'h0)] & reg13[(1'h0):(1'h0)]),
              reg18[(3'h6):(2'h2)]}});
      if (reg27[(1'h0):(1'h0)])
        begin
          reg32 <= (reg23[(4'h8):(3'h7)] ?
              ($unsigned(((^~reg13) ~^ reg25[(2'h3):(1'h0)])) ?
                  (+(reg15 ?
                      (7'h42) : (reg29 == reg31))) : (~&$unsigned($unsigned(reg18)))) : reg25);
          if (($signed($signed($signed(reg31[(2'h3):(1'h1)]))) ?
              $signed($unsigned((!wire11))) : $unsigned($signed(({wire11,
                  wire9} >>> $unsigned((8'h9d)))))))
            begin
              reg33 <= wire9;
              reg34 <= wire22[(3'h6):(2'h2)];
              reg35 <= reg27;
            end
          else
            begin
              reg33 <= (wire10 ~^ reg23[(4'h9):(4'h9)]);
              reg34 <= {((reg20[(1'h0):(1'h0)] && reg20) ?
                      $unsigned($unsigned(reg35[(1'h0):(1'h0)])) : wire8)};
              reg35 <= wire10[(4'ha):(2'h3)];
              reg36 <= $signed($signed(($signed((reg27 ^ wire9)) ?
                  $signed($unsigned(wire11)) : reg27)));
            end
          reg37 <= $unsigned(($signed((reg17[(4'ha):(1'h1)] ?
              ((8'hab) <<< reg26) : (reg29 ?
                  wire9 : reg23))) > (((|(8'hbc)) & $unsigned((8'hbd))) ?
              ((reg24 * reg33) || {reg24}) : $signed((reg14 ?
                  reg34 : reg29)))));
          if ({{{($unsigned((8'ha9)) | $signed(reg27))}}})
            begin
              reg38 <= ((reg31[(4'ha):(4'h9)] + $signed((&$signed(reg17)))) ?
                  (+(~&$unsigned(reg35[(1'h0):(1'h0)]))) : (-$signed(((reg17 <<< reg21) ?
                      (~^(8'hbd)) : {reg35}))));
            end
          else
            begin
              reg38 <= (-$unsigned(reg19));
              reg39 <= wire11;
            end
        end
      else
        begin
          reg32 <= (!$signed($unsigned($unsigned($signed(wire9)))));
          if ((reg37 >= $unsigned($signed((reg26 ^~ reg32[(2'h3):(1'h0)])))))
            begin
              reg33 <= reg30;
              reg34 <= $signed($unsigned(wire10));
            end
          else
            begin
              reg33 <= $unsigned((~^(^~{(|reg32)})));
              reg34 <= reg18[(3'h7):(2'h3)];
              reg35 <= reg37;
            end
          if ($signed((($unsigned((~^reg25)) ?
                  (~|$unsigned(reg19)) : reg28[(2'h3):(2'h3)]) ?
              reg13[(2'h2):(2'h2)] : $signed($signed($unsigned(reg35))))))
            begin
              reg36 <= $signed({(+reg33)});
              reg37 <= (reg21 ?
                  $unsigned(reg18[(4'h8):(2'h3)]) : $unsigned((reg29 >= $unsigned({(8'hb7),
                      (8'haf)}))));
              reg38 <= $signed((|(~^((reg39 << reg39) <= $signed(reg24)))));
              reg39 <= $unsigned(reg15[(1'h1):(1'h1)]);
              reg40 <= (-{$unsigned(wire22[(1'h1):(1'h1)])});
            end
          else
            begin
              reg36 <= ($unsigned((~&reg17[(2'h3):(2'h2)])) ?
                  wire22 : ((~&(!{reg29, reg13})) ?
                      (reg23[(3'h6):(3'h4)] * $signed($signed(reg17))) : reg39));
              reg37 <= {wire11[(4'hd):(1'h1)]};
              reg38 <= ((~|(~^((-wire11) > {reg32, reg40}))) >= reg38);
              reg39 <= $signed((reg37[(4'hc):(1'h1)] >> (&reg19[(2'h2):(2'h2)])));
            end
        end
    end
  assign wire41 = ((8'hb4) >> (~^$signed($unsigned((+reg24)))));
  assign wire42 = (reg38 <= $signed($unsigned(reg21)));
  assign wire43 = $unsigned($signed(reg32[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg44 <= ($signed(reg30[(4'hb):(4'hb)]) ?
          $signed($signed(((reg24 <<< (8'hb3)) ?
              (reg21 ?
                  reg33 : (8'hbd)) : $signed(reg35)))) : $signed(($unsigned(((8'h9f) ?
                  reg19 : wire12)) ?
              reg34[(4'h8):(1'h0)] : $unsigned(((8'ha1) >= reg25)))));
      reg45 <= wire42[(2'h2):(1'h0)];
      reg46 <= ((reg35 < wire11[(4'hd):(1'h1)]) ?
          ($unsigned((reg21[(3'h5):(1'h1)] ? $unsigned(reg32) : (^reg38))) ?
              $unsigned(reg31) : ($unsigned(((8'ha8) ?
                  reg44 : reg17)) > $unsigned(reg16[(1'h1):(1'h0)]))) : ($signed((^~(reg31 ?
              (8'hbd) : reg21))) | (wire12[(3'h4):(2'h2)] == ($unsigned(reg28) * reg27[(1'h1):(1'h1)]))));
      reg47 <= $unsigned(reg46[(4'hb):(3'h7)]);
    end
  assign wire48 = $unsigned(reg13);
  assign wire49 = (&((((~|(7'h44)) ? (reg36 || wire42) : reg27) ?
                          wire10 : $unsigned((reg45 == (8'hb6)))) ?
                      reg47[(3'h7):(3'h7)] : $unsigned(reg36)));
  assign wire50 = {$unsigned((reg20 ? $signed((wire43 == reg31)) : reg16))};
  always
    @(posedge clk) begin
      if (reg38[(4'h9):(4'h9)])
        begin
          reg51 <= (|$unsigned((wire48[(2'h2):(1'h0)] ?
              (+$unsigned(reg24)) : $signed($signed(reg14)))));
          if ((~($signed((reg32[(3'h4):(3'h4)] * reg34[(4'he):(1'h0)])) != reg20)))
            begin
              reg52 <= {($unsigned(wire11) >> wire50), $signed({reg13})};
              reg53 <= $unsigned(reg19);
              reg54 <= reg13[(1'h0):(1'h0)];
            end
          else
            begin
              reg52 <= (~|{(8'ha9),
                  ({{reg37, reg20},
                      (reg13 ? reg51 : wire12)} ~^ $unsigned((-reg29)))});
              reg53 <= (8'ha1);
              reg54 <= reg15[(3'h6):(2'h3)];
              reg55 <= $unsigned($signed($unsigned($signed($signed((8'hbb))))));
              reg56 <= $signed((+wire10[(1'h0):(1'h0)]));
            end
          if ($unsigned($signed(reg34)))
            begin
              reg57 <= ($signed((({reg31} ?
                      reg52 : ((8'hb1) ?
                          wire22 : wire12)) <<< ($signed(reg36) <= (reg28 ?
                      reg14 : reg56)))) ?
                  (^((7'h40) >>> {$signed(reg26), wire22})) : reg37);
              reg58 <= $unsigned((((+{reg45, wire50}) ?
                  (^~(reg34 == wire42)) : $signed($unsigned(reg35))) ~^ $unsigned(reg18)));
              reg59 <= $signed((^~$signed((~|reg54[(2'h2):(2'h2)]))));
            end
          else
            begin
              reg57 <= ($unsigned(({$signed(reg24), $signed(reg31)} ?
                  {wire49} : $signed(((8'ha1) ?
                      wire41 : reg15)))) == ((~^reg52) ~^ $signed($signed($signed(reg39)))));
            end
        end
      else
        begin
          reg51 <= $signed(wire12[(3'h4):(2'h3)]);
        end
      if ({$signed((^({wire41} ? (wire22 || reg55) : $signed(reg26))))})
        begin
          reg60 <= (8'hae);
          reg61 <= (~|{(reg53 ? ((^reg51) + reg40) : $signed(reg59))});
        end
      else
        begin
          reg60 <= reg46[(3'h4):(2'h2)];
        end
      reg62 <= reg60[(2'h3):(1'h1)];
      reg63 <= reg51[(3'h6):(2'h3)];
      reg64 <= reg36;
    end
  assign wire65 = $signed($unsigned((reg17 ~^ wire42[(1'h0):(1'h0)])));
endmodule

module module159
#(parameter param201 = ((((^((8'ha6) ? (8'hb1) : (8'hba))) <<< ({(8'hb7), (8'ha7)} > ((8'haf) ~^ (8'h9e)))) ? ((((8'haa) && (8'hb5)) ? ((8'hb4) ? (8'ha7) : (8'hab)) : (|(8'hbe))) == (~&((8'hb6) ? (8'hae) : (7'h41)))) : (({(8'hb7), (7'h40)} < (^(7'h42))) == ((~^(8'ha1)) + (8'hb1)))) ? (((+(|(7'h41))) ? ((-(8'hbd)) ? ((8'hb7) ? (8'hb3) : (8'hbb)) : (^~(8'hbd))) : ((&(8'hba)) ^~ ((8'hb9) == (8'hb3)))) ? {(~|(^~(8'hb1)))} : ((((8'ha7) ? (8'hb6) : (8'hb1)) | ((8'ha0) <= (8'hb3))) ? (((8'hb1) ? (8'h9f) : (7'h42)) ? ((8'hb1) ^~ (8'hb9)) : (8'hbd)) : ((|(8'hb1)) ? {(8'ha9)} : ((8'hae) ? (8'ha9) : (8'ha8))))) : ((~|(((8'ha8) ? (8'h9d) : (8'ha4)) >> ((8'h9e) - (8'ha5)))) ? (8'hbf) : {((+(8'haf)) ? ((7'h41) ? (8'hbf) : (8'ha5)) : (~|(8'hae))), (+{(8'hb9)})})))
(y, clk, wire163, wire162, wire161, wire160);
  output wire [(32'h1b3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire163;
  input wire [(4'h8):(1'h0)] wire162;
  input wire [(4'he):(1'h0)] wire161;
  input wire signed [(4'hd):(1'h0)] wire160;
  wire [(5'h14):(1'h0)] wire193;
  wire [(4'hb):(1'h0)] wire192;
  wire signed [(4'hc):(1'h0)] wire191;
  wire [(3'h4):(1'h0)] wire190;
  wire [(5'h15):(1'h0)] wire189;
  wire signed [(3'h4):(1'h0)] wire188;
  wire [(4'hf):(1'h0)] wire187;
  wire [(5'h15):(1'h0)] wire177;
  wire [(5'h12):(1'h0)] wire176;
  wire [(5'h12):(1'h0)] wire175;
  wire signed [(4'ha):(1'h0)] wire174;
  wire [(4'h8):(1'h0)] wire173;
  wire signed [(5'h14):(1'h0)] wire172;
  wire signed [(3'h6):(1'h0)] wire171;
  wire signed [(5'h13):(1'h0)] wire170;
  wire signed [(3'h6):(1'h0)] wire169;
  reg signed [(3'h6):(1'h0)] reg200 = (1'h0);
  reg [(4'ha):(1'h0)] reg199 = (1'h0);
  reg [(4'hd):(1'h0)] reg198 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg197 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg196 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg195 = (1'h0);
  reg [(3'h6):(1'h0)] reg194 = (1'h0);
  reg signed [(4'he):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg185 = (1'h0);
  reg [(4'ha):(1'h0)] reg184 = (1'h0);
  reg [(2'h3):(1'h0)] reg183 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg182 = (1'h0);
  reg [(4'h9):(1'h0)] reg181 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg180 = (1'h0);
  reg [(4'hb):(1'h0)] reg179 = (1'h0);
  reg [(3'h6):(1'h0)] reg178 = (1'h0);
  reg [(5'h11):(1'h0)] reg168 = (1'h0);
  reg [(2'h3):(1'h0)] reg167 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg166 = (1'h0);
  reg [(4'hf):(1'h0)] reg165 = (1'h0);
  reg [(5'h14):(1'h0)] reg164 = (1'h0);
  assign y = {wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg164 <= ((!((!(wire163 ?
              wire163 : wire163)) | $unsigned($signed(wire160)))) ?
          wire163[(2'h3):(2'h2)] : (-{$unsigned($unsigned(wire161)), wire162}));
      reg165 <= $unsigned($unsigned((!(~&(^wire160)))));
      reg166 <= {wire163};
      reg167 <= wire161[(4'ha):(3'h6)];
      reg168 <= (($signed($signed($signed(reg167))) ?
          {wire160} : $signed($signed(reg166[(4'hf):(4'h9)]))) >>> wire162[(1'h1):(1'h0)]);
    end
  assign wire169 = ({($signed($signed(reg165)) ?
                               reg164[(1'h0):(1'h0)] : $signed(reg165)),
                           (^~reg167)} ?
                       (^~{(&$unsigned((8'hab)))}) : $unsigned(wire163[(2'h2):(1'h1)]));
  assign wire170 = ((-(reg164[(5'h10):(1'h1)] >= ((wire161 << wire163) ?
                       (7'h41) : $signed(wire162)))) - (~|(wire169[(3'h6):(3'h5)] + ($unsigned(reg166) ?
                       $unsigned(reg164) : reg166))));
  assign wire171 = ($signed((((~^wire162) ? (|reg167) : wire170) ?
                       (+(reg168 ? reg165 : reg167)) : ((wire161 ^ reg165) ?
                           (-wire162) : wire160[(3'h6):(3'h5)]))) >>> wire163[(1'h1):(1'h1)]);
  assign wire172 = wire160[(4'hc):(2'h2)];
  assign wire173 = {($unsigned((^~$unsigned(wire163))) < (&((~|wire169) ?
                           $unsigned(wire163) : ((8'ha6) | reg166))))};
  assign wire174 = $unsigned((8'ha0));
  assign wire175 = {(wire173[(1'h0):(1'h0)] ?
                           ((~^((8'ha0) >= (8'hba))) ?
                               {wire174[(4'ha):(2'h3)]} : ($signed((8'haa)) | $unsigned(wire171))) : $unsigned((8'ha3))),
                       {wire174[(1'h0):(1'h0)]}};
  assign wire176 = reg165;
  assign wire177 = wire174[(4'ha):(4'ha)];
  always
    @(posedge clk) begin
      reg178 <= $unsigned($unsigned((&(wire162 ?
          $unsigned(wire160) : $unsigned(wire169)))));
      if ($signed($unsigned($signed($unsigned((wire161 >= wire173))))))
        begin
          reg179 <= (8'hbd);
          if ($unsigned(($unsigned({$unsigned(wire171)}) && ($unsigned(((8'ha9) >> wire174)) * wire172))))
            begin
              reg180 <= {$unsigned((&(!wire172))), (|(^$unsigned((~wire172))))};
              reg181 <= wire160;
              reg182 <= $signed((8'hb3));
              reg183 <= (wire163 != $unsigned(wire171[(3'h5):(1'h0)]));
              reg184 <= $unsigned(wire163);
            end
          else
            begin
              reg180 <= (^$unsigned((~|reg180[(2'h2):(1'h0)])));
              reg181 <= (-(wire173[(4'h8):(3'h7)] ?
                  $unsigned(reg179) : (!(wire177 ?
                      $signed(reg167) : (~|reg165)))));
              reg182 <= (+(8'h9c));
              reg183 <= ({wire174[(4'h9):(1'h0)]} ?
                  (reg165[(3'h5):(3'h4)] ?
                      $signed((wire170 >= (~reg180))) : (~wire169[(2'h3):(2'h3)])) : ((({(8'hbf)} ?
                      reg183 : (reg180 ?
                          reg178 : (8'hbb))) + (8'h9d)) ^ reg181));
              reg184 <= (+reg178);
            end
          reg185 <= wire170;
          reg186 <= $signed(wire175);
        end
      else
        begin
          reg179 <= $unsigned($unsigned(wire177));
          reg180 <= reg167[(1'h0):(1'h0)];
          reg181 <= (^~$unsigned((({wire163} << $unsigned(reg164)) | {(&(8'h9d))})));
          if (wire172)
            begin
              reg182 <= ($signed((!(reg183[(1'h0):(1'h0)] != (reg181 - (8'h9d))))) >= $unsigned($signed(($unsigned(reg166) & reg186))));
              reg183 <= ({$unsigned(wire163[(1'h0):(1'h0)])} ?
                  ({wire169, (8'hba)} == {($unsigned(wire161) ?
                          $unsigned(reg166) : wire172[(4'ha):(1'h1)])}) : $signed($unsigned($signed(((8'hbe) ?
                      reg181 : wire175)))));
              reg184 <= $unsigned(wire177);
              reg185 <= (reg178[(1'h0):(1'h0)] ?
                  ($unsigned((wire161 ?
                          wire162 : (reg182 ? reg182 : wire169))) ?
                      reg181[(1'h0):(1'h0)] : reg181) : (!wire173));
            end
          else
            begin
              reg182 <= (~&($signed((wire176 < wire170)) << wire175));
              reg183 <= wire176[(3'h7):(3'h4)];
              reg184 <= (&$unsigned((reg180[(2'h3):(1'h1)] ^ (wire176 >= $unsigned(reg166)))));
              reg185 <= {$unsigned($signed((^~((8'hae) ? wire175 : wire171)))),
                  ((&{(wire173 >> reg182)}) * reg184)};
              reg186 <= {{$signed((+$signed(wire162))),
                      (reg182[(3'h5):(3'h4)] ?
                          {(wire172 & wire163),
                              (!(8'ha4))} : {$signed(wire161)})},
                  {reg179}};
            end
        end
    end
  assign wire187 = (^{($unsigned($unsigned(reg167)) ~^ (-$signed((7'h41))))});
  assign wire188 = $signed((|$signed(reg164)));
  assign wire189 = (8'ha9);
  assign wire190 = (wire174[(1'h0):(1'h0)] ? $signed(wire174) : {(&wire163)});
  assign wire191 = $unsigned((wire174 ?
                       (!(~&wire189[(5'h11):(1'h1)])) : {wire174[(1'h1):(1'h1)]}));
  assign wire192 = (!(wire160 ? (~(^~(8'hab))) : (8'hb3)));
  assign wire193 = (~^(+reg164[(3'h6):(3'h6)]));
  always
    @(posedge clk) begin
      reg194 <= {(reg186[(3'h6):(3'h5)] ?
              (({(8'hb3),
                  reg178} < (reg165 || wire189)) * (&$unsigned(reg165))) : (~&((-(8'hbd)) ?
                  (~wire163) : (~wire160))))};
      reg195 <= $signed({(8'ha6)});
      reg196 <= ({reg185[(4'hf):(2'h3)]} ^ $unsigned((($signed(wire160) ?
          $signed(wire162) : wire193[(3'h4):(3'h4)]) * $signed(((8'ha6) ?
          wire187 : reg183)))));
      if (reg167)
        begin
          reg197 <= $unsigned(((7'h40) ~^ (+{(wire161 - (8'ha0)), wire177})));
          reg198 <= $signed({wire191});
          reg199 <= (&wire162);
          reg200 <= $unsigned(({wire174[(4'ha):(2'h2)],
              $signed((^~(7'h42)))} || (^~$unsigned(((8'hb4) & wire173)))));
        end
      else
        begin
          reg197 <= reg199;
          reg198 <= reg182;
          reg199 <= ((~^$unsigned((wire191 ?
              reg197[(3'h6):(2'h3)] : {reg199, reg182}))) >>> ((~&(reg180 ?
                  (reg194 + reg194) : $signed(wire177))) ?
              reg197[(1'h0):(1'h0)] : $unsigned(wire177[(4'he):(3'h4)])));
        end
    end
endmodule

module module99
#(parameter param154 = (((({(8'hb9), (8'hbd)} ? ((7'h43) ? (8'ha4) : (8'ha4)) : ((7'h40) && (8'ha8))) ? {((8'ha2) >> (8'ha7)), ((8'hae) ^~ (8'ha9))} : {(^~(8'haa))}) ? (((|(8'hba)) ? ((8'ha2) + (8'hb5)) : ((8'hbf) ^ (8'hb2))) ? (~((8'ha1) ? (8'hbb) : (8'ha0))) : (^(!(8'hac)))) : ({((7'h44) ^ (8'ha7)), ((8'h9f) >= (8'ha2))} > (((8'hbc) <<< (7'h40)) == (7'h44)))) ? (~^(({(8'ha8)} < ((8'hb5) ? (8'hbf) : (7'h43))) ? (&(-(8'ha7))) : ({(8'hbc), (8'hbe)} ? ((8'ha4) ? (8'ha8) : (8'had)) : ((7'h44) || (8'ha0))))) : (((^~(^(8'had))) != ({(8'ha1)} << ((7'h42) ? (8'ha3) : (8'hbd)))) ? ((&((8'ha0) ? (8'hb9) : (8'hba))) <<< {((7'h44) - (8'hb5))}) : ((((8'hb1) ? (8'h9f) : (8'hbc)) ? ((8'hb2) ? (8'ha6) : (7'h41)) : ((8'ha1) ? (8'ha7) : (7'h43))) ? {(~(8'h9f))} : (((8'hbd) ~^ (8'ha2)) ? {(8'hbb)} : ((8'ha6) != (8'hb4)))))), 
parameter param155 = (((((param154 << param154) && (param154 == param154)) < (7'h42)) ? (-((param154 ? param154 : param154) ? {(8'hb6), param154} : (param154 ? param154 : param154))) : (8'hb0)) + ({param154} ? param154 : (((param154 + param154) == (~^param154)) ? ({param154} ? (~&param154) : (param154 ? param154 : (7'h41))) : (+param154)))))
(y, clk, wire104, wire103, wire102, wire101, wire100);
  output wire [(32'h26e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire104;
  input wire signed [(4'h8):(1'h0)] wire103;
  input wire signed [(4'hb):(1'h0)] wire102;
  input wire signed [(4'h9):(1'h0)] wire101;
  input wire signed [(5'h14):(1'h0)] wire100;
  wire [(4'he):(1'h0)] wire153;
  wire signed [(5'h10):(1'h0)] wire152;
  wire signed [(5'h13):(1'h0)] wire142;
  wire [(5'h11):(1'h0)] wire141;
  wire signed [(5'h14):(1'h0)] wire139;
  wire signed [(4'hc):(1'h0)] wire138;
  wire [(3'h6):(1'h0)] wire137;
  wire [(4'he):(1'h0)] wire113;
  wire [(5'h14):(1'h0)] wire112;
  wire signed [(4'hf):(1'h0)] wire111;
  wire signed [(5'h11):(1'h0)] wire110;
  wire signed [(2'h3):(1'h0)] wire109;
  wire signed [(4'hf):(1'h0)] wire105;
  reg [(2'h2):(1'h0)] reg151 = (1'h0);
  reg [(5'h10):(1'h0)] reg150 = (1'h0);
  reg signed [(4'he):(1'h0)] reg149 = (1'h0);
  reg [(3'h5):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg147 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg143 = (1'h0);
  reg [(5'h14):(1'h0)] reg140 = (1'h0);
  reg [(2'h2):(1'h0)] reg136 = (1'h0);
  reg [(3'h4):(1'h0)] reg135 = (1'h0);
  reg [(5'h10):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg133 = (1'h0);
  reg [(2'h3):(1'h0)] reg132 = (1'h0);
  reg [(2'h2):(1'h0)] reg131 = (1'h0);
  reg [(4'hb):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg129 = (1'h0);
  reg [(5'h13):(1'h0)] reg128 = (1'h0);
  reg [(5'h13):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg126 = (1'h0);
  reg [(5'h12):(1'h0)] reg125 = (1'h0);
  reg [(3'h7):(1'h0)] reg124 = (1'h0);
  reg [(4'h8):(1'h0)] reg123 = (1'h0);
  reg [(5'h10):(1'h0)] reg122 = (1'h0);
  reg [(4'hb):(1'h0)] reg121 = (1'h0);
  reg [(5'h13):(1'h0)] reg120 = (1'h0);
  reg [(5'h12):(1'h0)] reg119 = (1'h0);
  reg [(5'h15):(1'h0)] reg118 = (1'h0);
  reg [(5'h13):(1'h0)] reg117 = (1'h0);
  reg [(5'h11):(1'h0)] reg116 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg115 = (1'h0);
  reg [(2'h2):(1'h0)] reg114 = (1'h0);
  reg [(2'h3):(1'h0)] reg108 = (1'h0);
  reg [(5'h11):(1'h0)] reg107 = (1'h0);
  reg [(4'he):(1'h0)] reg106 = (1'h0);
  assign y = {wire153,
                 wire152,
                 wire142,
                 wire141,
                 wire139,
                 wire138,
                 wire137,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire105,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg140,
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
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg108,
                 reg107,
                 reg106,
                 (1'h0)};
  assign wire105 = ({$unsigned($signed(wire101))} ?
                       $unsigned(((wire103 > (!wire100)) ?
                           {(8'hbd)} : {wire103,
                               wire103[(1'h0):(1'h0)]})) : (^~(wire101 * (wire104 - $signed(wire102)))));
  always
    @(posedge clk) begin
      reg106 <= (~(~(((|wire101) >= {wire105,
          wire100}) ^ $unsigned($unsigned((8'h9e))))));
      reg107 <= reg106[(2'h2):(2'h2)];
      reg108 <= ($unsigned((~|reg106)) ?
          (($unsigned(wire102[(3'h7):(1'h1)]) != ((wire100 >>> wire105) ^~ $unsigned(wire100))) << $signed(($unsigned(wire103) || wire102[(3'h6):(1'h1)]))) : $signed($signed(((reg106 ?
              wire103 : (8'hbb)) >> wire105))));
    end
  assign wire109 = (wire101[(1'h0):(1'h0)] >>> (+$signed((^~reg107))));
  assign wire110 = ($signed(reg107[(2'h2):(1'h1)]) <= (~($unsigned((8'haa)) <= ($signed(wire101) ^~ (wire104 ?
                       wire109 : reg107)))));
  assign wire111 = {($signed($unsigned({wire101,
                           wire104})) <<< $signed(wire103)),
                       wire104[(1'h0):(1'h0)]};
  assign wire112 = wire102;
  assign wire113 = ($signed($unsigned(wire111[(2'h3):(1'h1)])) > $unsigned((^~(wire102[(3'h5):(1'h0)] ?
                       $signed(wire112) : (+wire111)))));
  always
    @(posedge clk) begin
      reg114 <= $signed({((^$signed((8'hab))) ?
              $unsigned((~&wire101)) : $signed(wire102))});
      reg115 <= $unsigned(wire101[(4'h9):(3'h5)]);
      reg116 <= reg106;
      if (({(~&(8'ha0)), $unsigned(wire112[(2'h2):(2'h2)])} ?
          $unsigned(wire100[(3'h4):(2'h3)]) : (|(reg106 >>> reg107[(3'h6):(1'h0)]))))
        begin
          reg117 <= wire103;
          reg118 <= (wire100[(5'h14):(2'h3)] << (($signed($unsigned(wire109)) & $signed((wire109 << wire101))) ?
              $unsigned(reg106) : reg116[(4'h8):(3'h7)]));
          if ($unsigned($unsigned($signed($unsigned((^reg118))))))
            begin
              reg119 <= $unsigned($signed(reg114));
              reg120 <= (~|(~((wire109[(1'h1):(1'h1)] <= ((8'ha3) ?
                      (7'h44) : reg119)) ?
                  $signed($signed(wire105)) : $signed(wire100[(5'h12):(4'h9)]))));
              reg121 <= (|(wire112 ? (~^reg114[(2'h2):(1'h0)]) : wire101));
              reg122 <= (wire100 << wire111);
              reg123 <= (+reg108[(1'h0):(1'h0)]);
            end
          else
            begin
              reg119 <= $unsigned(($signed(reg116[(1'h0):(1'h0)]) == wire112));
              reg120 <= {(8'hb9)};
            end
        end
      else
        begin
          if (($unsigned({$signed(reg123)}) == $signed(wire104)))
            begin
              reg117 <= reg114[(2'h2):(1'h0)];
              reg118 <= $signed(((wire103[(3'h5):(2'h2)] ?
                      ($unsigned(reg114) >> (reg122 ?
                          (8'hb5) : wire100)) : reg114) ?
                  ($signed($unsigned(reg117)) + (~|(reg108 ?
                      (8'hb8) : (8'hb0)))) : (^~wire102[(3'h6):(3'h5)])));
              reg119 <= ((-$unsigned({((8'ha6) ? wire100 : wire105),
                  wire103[(4'h8):(3'h6)]})) >>> wire111);
            end
          else
            begin
              reg117 <= $unsigned($signed(((~(|wire104)) ?
                  reg115 : $signed((reg108 ? wire105 : wire110)))));
              reg118 <= {$signed($signed((reg117[(5'h12):(2'h3)] ?
                      (reg115 <= (8'had)) : reg114[(1'h0):(1'h0)]))),
                  ((~(reg122[(2'h2):(1'h0)] ?
                          $unsigned(reg120) : $signed(reg106))) ?
                      ($signed($signed((8'h9c))) ?
                          (wire109 ?
                              ((8'h9d) || (7'h42)) : reg108[(1'h0):(1'h0)]) : $signed((reg119 > wire103))) : ($signed(wire102[(1'h1):(1'h0)]) ?
                          $unsigned($unsigned(wire111)) : (8'ha4)))};
              reg119 <= reg115;
              reg120 <= reg118[(5'h15):(5'h12)];
            end
        end
      reg124 <= (~&(-wire105[(4'hc):(3'h4)]));
    end
  always
    @(posedge clk) begin
      reg125 <= $unsigned({(({wire112} ?
              $unsigned((8'hba)) : $unsigned(wire100)) + ($signed(reg106) ?
              reg116[(4'ha):(2'h2)] : (~|wire104))),
          $unsigned({wire112[(3'h5):(1'h1)]})});
      if ($signed(reg119[(4'hc):(2'h3)]))
        begin
          if ({(~|(7'h44)),
              $unsigned((reg107[(4'hd):(4'ha)] ?
                  (^~(reg115 | reg106)) : ((reg114 ~^ wire109) ~^ reg107)))})
            begin
              reg126 <= (~|((reg119 != {(^(8'hb1)), $unsigned(wire100)}) ?
                  (8'hb5) : reg121[(4'h9):(4'h8)]));
            end
          else
            begin
              reg126 <= $signed((~&reg115[(1'h0):(1'h0)]));
              reg127 <= reg108;
            end
          if ({reg119})
            begin
              reg128 <= reg114;
              reg129 <= reg127[(2'h3):(2'h3)];
              reg130 <= wire102[(4'hb):(3'h4)];
            end
          else
            begin
              reg128 <= $signed({(reg129[(1'h1):(1'h0)] ? reg121 : wire113)});
            end
          reg131 <= reg106[(1'h0):(1'h0)];
          reg132 <= $unsigned($unsigned(wire109));
        end
      else
        begin
          if ({($unsigned((reg130[(4'hb):(1'h1)] ?
                  reg132[(1'h1):(1'h1)] : $unsigned((8'h9c)))) <<< ($signed($unsigned(reg122)) ?
                  ({(8'hb4), (8'ha0)} >= (8'hbc)) : ((reg124 ?
                          wire102 : wire100) ?
                      wire100[(5'h10):(1'h0)] : (-wire102))))})
            begin
              reg126 <= $signed($unsigned((reg114 ?
                  $unsigned((-reg116)) : wire103)));
              reg127 <= ((reg108[(2'h2):(2'h2)] ?
                  $signed((&wire113)) : ($unsigned(reg128[(4'hd):(4'ha)]) == wire103[(3'h4):(2'h2)])) ^ wire104[(2'h2):(1'h1)]);
            end
          else
            begin
              reg126 <= (~|$signed(wire112));
              reg127 <= reg131;
              reg128 <= wire110;
            end
          reg129 <= $signed((+{$unsigned((reg130 ? reg119 : reg124)), reg131}));
          if ((wire111 ? wire105 : reg116))
            begin
              reg130 <= (8'ha1);
              reg131 <= $signed(reg122[(3'h7):(1'h1)]);
              reg132 <= $unsigned($signed((({reg114,
                      wire110} & (reg122 > reg122)) ?
                  reg128 : (^~(8'hb8)))));
            end
          else
            begin
              reg130 <= (^$unsigned(reg115[(1'h0):(1'h0)]));
              reg131 <= reg115;
              reg132 <= $signed((~|$unsigned(wire105[(4'h8):(3'h6)])));
            end
          reg133 <= (reg129 ?
              (7'h43) : $signed((($unsigned(reg129) ?
                  {(8'hbc)} : reg115[(1'h0):(1'h0)]) & $unsigned((reg124 + reg132)))));
          reg134 <= (8'ha4);
        end
      reg135 <= (reg119 ? (^reg129) : (+(reg127 ? (7'h40) : reg121)));
      reg136 <= (reg117 >> (reg118[(5'h14):(5'h13)] & reg132));
    end
  assign wire137 = wire111;
  assign wire138 = $unsigned((reg106[(4'ha):(4'h9)] | {(^~(^~reg126)),
                       reg108[(2'h3):(2'h2)]}));
  assign wire139 = (reg119[(4'ha):(1'h1)] != $unsigned((|{reg116})));
  always
    @(posedge clk) begin
      reg140 <= (^~(reg114 && ($unsigned(wire105) ~^ {wire100[(3'h5):(2'h3)],
          $signed((8'hab))})));
    end
  assign wire141 = $signed(wire103[(2'h3):(2'h3)]);
  assign wire142 = reg131;
  always
    @(posedge clk) begin
      if ((&($signed(wire103[(3'h7):(1'h0)]) ?
          reg124[(3'h7):(1'h1)] : $unsigned(((~^wire112) ?
              {reg133, (8'hb1)} : (^~wire141))))))
        begin
          reg143 <= wire102[(3'h4):(1'h0)];
          reg144 <= ($signed(((((8'hba) ? reg116 : reg107) ?
              wire138[(3'h7):(1'h0)] : $unsigned((8'ha7))) & ((wire101 & reg130) ?
              wire139 : (reg122 | wire139)))) ^~ wire112);
          reg145 <= (~&(8'ha1));
          reg146 <= $signed(($signed((^reg140[(4'h9):(3'h4)])) ?
              ($unsigned((~|reg118)) * (wire100[(4'h8):(3'h4)] >= reg119)) : $unsigned({{reg134,
                      reg124}})));
        end
      else
        begin
          reg143 <= wire102[(3'h5):(1'h1)];
          reg144 <= $unsigned({$signed({{reg115, wire103}, reg124}),
              ($signed($signed(reg140)) - (|wire103[(3'h4):(1'h0)]))});
          reg145 <= reg118[(1'h1):(1'h1)];
          if (((reg119 ?
                  $signed($unsigned((+wire103))) : $unsigned(wire110[(4'hc):(3'h7)])) ?
              {(~^reg114[(2'h2):(1'h0)])} : (!($signed((reg121 & wire138)) + reg106[(2'h2):(1'h0)]))))
            begin
              reg146 <= (($unsigned($signed(((8'hb7) ^ reg119))) | ((|(reg122 ?
                      reg107 : reg127)) ^~ (wire113 ?
                      reg107 : reg118[(4'hc):(3'h7)]))) ?
                  reg144[(3'h4):(2'h3)] : {reg115[(2'h2):(1'h1)],
                      (($unsigned(wire139) ?
                              $signed(reg133) : {reg129, (7'h41)}) ?
                          $unsigned($unsigned(wire109)) : ((reg118 ~^ reg129) ?
                              reg140 : (wire110 ^ wire103)))});
              reg147 <= reg132[(2'h2):(2'h2)];
              reg148 <= (reg118[(4'hd):(3'h4)] | (reg140 >>> (reg132 ?
                  (~&{wire109, wire109}) : wire113)));
              reg149 <= (reg115[(1'h0):(1'h0)] ?
                  reg126 : $signed((($unsigned(wire142) >>> (!reg133)) != reg146)));
              reg150 <= ((8'hb8) - reg143[(1'h0):(1'h0)]);
            end
          else
            begin
              reg146 <= (((^~(reg143[(2'h3):(2'h3)] <<< (+reg120))) ?
                      {(!((8'ha5) ? wire103 : wire142)),
                          {(-(8'hb3))}} : ((8'hb4) << wire138)) ?
                  ($unsigned($unsigned((~&(8'hb4)))) - reg127) : (reg106[(1'h1):(1'h0)] ?
                      reg121[(1'h1):(1'h0)] : (-reg133[(3'h5):(1'h0)])));
              reg147 <= $unsigned($unsigned((-((reg132 ? wire141 : wire137) ?
                  reg148[(2'h2):(1'h1)] : (~|reg124)))));
              reg148 <= $signed(((^$signed($unsigned(reg118))) ?
                  reg125 : wire110[(2'h2):(1'h0)]));
            end
        end
      reg151 <= wire104[(1'h0):(1'h0)];
    end
  assign wire152 = {reg114[(1'h1):(1'h0)]};
  assign wire153 = reg144[(2'h3):(2'h3)];
endmodule

module module214  (y, clk, wire218, wire217, wire216, wire215);
  output wire [(32'h101):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire218;
  input wire [(3'h7):(1'h0)] wire217;
  input wire signed [(3'h6):(1'h0)] wire216;
  input wire signed [(4'hb):(1'h0)] wire215;
  wire [(5'h14):(1'h0)] wire238;
  wire [(3'h5):(1'h0)] wire237;
  wire signed [(3'h7):(1'h0)] wire236;
  wire [(5'h13):(1'h0)] wire235;
  wire signed [(4'hf):(1'h0)] wire234;
  wire [(5'h11):(1'h0)] wire233;
  wire signed [(5'h12):(1'h0)] wire232;
  wire [(2'h3):(1'h0)] wire231;
  wire signed [(3'h6):(1'h0)] wire230;
  wire signed [(5'h10):(1'h0)] wire229;
  wire signed [(5'h13):(1'h0)] wire228;
  wire [(5'h10):(1'h0)] wire227;
  wire signed [(3'h7):(1'h0)] wire226;
  wire [(4'hc):(1'h0)] wire225;
  wire [(4'he):(1'h0)] wire224;
  wire signed [(3'h7):(1'h0)] wire223;
  wire [(4'hc):(1'h0)] wire222;
  wire signed [(4'hb):(1'h0)] wire221;
  wire [(5'h13):(1'h0)] wire220;
  reg [(4'hd):(1'h0)] reg219 = (1'h0);
  assign y = {wire238,
                 wire237,
                 wire236,
                 wire235,
                 wire234,
                 wire233,
                 wire232,
                 wire231,
                 wire230,
                 wire229,
                 wire228,
                 wire227,
                 wire226,
                 wire225,
                 wire224,
                 wire223,
                 wire222,
                 wire221,
                 wire220,
                 reg219,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg219 <= $signed(wire217[(3'h6):(1'h0)]);
    end
  assign wire220 = wire216[(3'h5):(3'h5)];
  assign wire221 = wire218;
  assign wire222 = wire215;
  assign wire223 = (8'hbd);
  assign wire224 = wire221[(3'h4):(2'h2)];
  assign wire225 = $unsigned(($signed($signed((|reg219))) ?
                       $unsigned(reg219) : (|$unsigned((+wire217)))));
  assign wire226 = $unsigned($signed((^wire217)));
  assign wire227 = $signed($unsigned(wire225));
  assign wire228 = wire217[(3'h4):(2'h2)];
  assign wire229 = wire225;
  assign wire230 = (~|{$signed($unsigned($unsigned((8'h9e))))});
  assign wire231 = $signed(wire229[(2'h3):(2'h3)]);
  assign wire232 = {$unsigned(((-(wire224 <<< wire230)) ?
                           (wire222 ?
                               (~wire231) : (wire217 ?
                                   (8'ha8) : reg219)) : $signed(wire229[(4'hc):(3'h4)])))};
  assign wire233 = ($signed($signed($unsigned($signed(wire229)))) >= $unsigned((|(8'hb8))));
  assign wire234 = (~&$signed((~^wire222)));
  assign wire235 = ((wire230[(2'h2):(1'h0)] ?
                       $signed(reg219[(4'hb):(4'hb)]) : wire217[(2'h3):(1'h1)]) >= ($signed(reg219) ?
                       ($signed(wire217[(3'h5):(3'h4)]) || wire229) : wire224[(1'h1):(1'h0)]));
  assign wire236 = wire231;
  assign wire237 = wire222;
  assign wire238 = ((-$unsigned((^(^~reg219)))) ?
                       wire230[(1'h0):(1'h0)] : {$signed($unsigned((~wire216))),
                           wire233});
endmodule
