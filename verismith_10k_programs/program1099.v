module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1ad):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire201;
  wire [(2'h3):(1'h0)] wire200;
  wire [(5'h14):(1'h0)] wire180;
  wire [(4'h8):(1'h0)] wire179;
  wire [(5'h13):(1'h0)] wire174;
  wire [(2'h3):(1'h0)] wire173;
  wire signed [(5'h15):(1'h0)] wire172;
  wire signed [(3'h6):(1'h0)] wire171;
  wire [(5'h14):(1'h0)] wire170;
  wire signed [(5'h13):(1'h0)] wire169;
  wire signed [(5'h14):(1'h0)] wire163;
  reg [(2'h2):(1'h0)] reg199 = (1'h0);
  reg [(4'ha):(1'h0)] reg198 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg197 = (1'h0);
  reg [(5'h13):(1'h0)] reg196 = (1'h0);
  reg [(4'hc):(1'h0)] reg195 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg194 = (1'h0);
  reg [(4'ha):(1'h0)] reg193 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg192 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg191 = (1'h0);
  reg [(3'h5):(1'h0)] reg190 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg189 = (1'h0);
  reg [(4'h9):(1'h0)] reg188 = (1'h0);
  reg [(5'h15):(1'h0)] reg187 = (1'h0);
  reg [(3'h4):(1'h0)] reg186 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg185 = (1'h0);
  reg [(5'h14):(1'h0)] reg184 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg183 = (1'h0);
  reg [(4'h8):(1'h0)] reg182 = (1'h0);
  reg signed [(4'he):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg178 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg177 = (1'h0);
  reg [(5'h11):(1'h0)] reg176 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg168 = (1'h0);
  reg [(3'h4):(1'h0)] reg167 = (1'h0);
  reg [(3'h6):(1'h0)] reg166 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg165 = (1'h0);
  assign y = {wire201,
                 wire200,
                 wire180,
                 wire179,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire163,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
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
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 (1'h0)};
  module5 #() modinst164 (.y(wire163), .wire6(wire2), .wire7(wire3), .wire8(wire1), .clk(clk), .wire9(wire4));
  always
    @(posedge clk) begin
      reg165 <= wire163[(5'h11):(4'hb)];
      reg166 <= $signed(wire1);
      reg167 <= $signed(((~wire0) ?
          ((wire163 ?
              {wire2} : {reg166,
                  reg166}) > $signed($signed(wire4))) : wire163[(4'h8):(3'h5)]));
      reg168 <= ({$unsigned($unsigned(((8'hbc) ? wire0 : wire1)))} ?
          wire163 : $signed((((|wire3) <= wire3[(4'hd):(3'h7)]) ~^ ($unsigned(wire3) ?
              wire3 : $unsigned((8'ha6))))));
    end
  assign wire169 = $unsigned($unsigned(wire0));
  assign wire170 = ($unsigned({$signed($unsigned((8'h9c))),
                           wire2[(4'h8):(3'h6)]}) ?
                       $signed({reg167[(1'h0):(1'h0)],
                           $signed((^wire163))}) : ((wire163[(3'h4):(2'h2)] >> ($unsigned(wire3) ?
                               $signed((8'h9f)) : $unsigned(reg165))) ?
                           $unsigned((reg167[(2'h3):(2'h2)] ?
                               $signed(wire4) : {wire3,
                                   reg166})) : $signed((-(!wire3)))));
  assign wire171 = {$signed(reg165)};
  assign wire172 = $signed($unsigned($signed((((8'hb5) || reg168) ?
                       $signed(wire170) : (~^wire163)))));
  assign wire173 = wire169[(3'h4):(3'h4)];
  assign wire174 = (~&((~^$signed(reg166[(3'h4):(2'h3)])) ~^ (-(wire163[(5'h13):(1'h0)] ~^ wire170[(4'hd):(3'h6)]))));
  always
    @(posedge clk) begin
      reg175 <= (|$signed({wire0[(3'h5):(3'h4)], reg165[(2'h2):(1'h1)]}));
      reg176 <= (((((reg166 >> wire0) ?
                      $unsigned(wire163) : wire170[(4'he):(4'hd)]) ?
                  wire0 : (+(&(8'hae)))) ?
              wire174 : wire4) ?
          {(reg165 ?
                  (~reg167[(2'h2):(1'h0)]) : (wire0[(4'h8):(4'h8)] & (wire163 ?
                      wire163 : wire4)))} : $signed(wire1));
      reg177 <= ($signed(reg166) ?
          ((|$unsigned($unsigned(wire172))) <<< reg167[(1'h0):(1'h0)]) : ((-$signed((~^wire171))) ?
              wire2[(3'h4):(2'h3)] : reg176[(4'hd):(4'hc)]));
      reg178 <= wire0[(4'ha):(4'ha)];
    end
  assign wire179 = {reg166[(1'h0):(1'h0)]};
  assign wire180 = wire174;
  always
    @(posedge clk) begin
      reg181 <= {wire170[(5'h14):(3'h7)], $signed(wire4)};
      reg182 <= ({(|wire171[(2'h3):(2'h3)]), $signed({reg176})} ?
          (wire171[(3'h6):(2'h2)] ?
              reg166 : ((&$signed(reg165)) ?
                  $signed((reg168 * wire173)) : $signed($unsigned((8'hbc))))) : {(wire172 <= wire179[(1'h0):(1'h0)])});
      reg183 <= reg182[(3'h4):(1'h0)];
      if ($unsigned((reg165 - (wire163 ^~ $unsigned((wire173 ?
          reg167 : (7'h43)))))))
        begin
          reg184 <= $unsigned((8'had));
          reg185 <= ((wire174[(5'h10):(4'ha)] ?
                  wire4[(4'hf):(3'h5)] : $unsigned($unsigned({(8'hb0)}))) ?
              $unsigned(((wire4 ?
                  reg167[(3'h4):(1'h1)] : wire169[(3'h5):(3'h4)]) ^ ((reg175 - wire3) ?
                  wire170 : (wire163 ? wire1 : reg165)))) : $signed(reg168));
          reg186 <= {(wire3 | wire172)};
          if ($signed(reg178[(5'h10):(5'h10)]))
            begin
              reg187 <= (-({{$signed(wire173), $unsigned(wire1)}} ?
                  (^$unsigned((wire179 == wire1))) : ((|{(8'hb9), (8'h9f)}) ?
                      (reg165 ?
                          $signed(reg184) : (wire173 | reg185)) : (~reg166))));
            end
          else
            begin
              reg187 <= ($signed((($signed(reg168) ?
                      {wire1} : $signed(wire169)) ?
                  {$unsigned(reg167),
                      (wire3 ?
                          wire170 : reg186)} : (wire2[(5'h11):(3'h5)] <<< wire180))) ^~ {(8'hab),
                  $unsigned($signed($unsigned(reg168)))});
              reg188 <= wire0;
            end
        end
      else
        begin
          if ($unsigned((8'hb0)))
            begin
              reg184 <= ($signed(($unsigned((8'hb7)) ?
                  $unsigned(reg165) : wire174)) - (+(&$unsigned(wire4[(4'ha):(4'h9)]))));
              reg185 <= $signed(reg167);
            end
          else
            begin
              reg184 <= reg181[(2'h3):(1'h0)];
            end
          if ((+reg181[(1'h0):(1'h0)]))
            begin
              reg186 <= (8'hba);
              reg187 <= ((reg178[(3'h6):(3'h6)] >= ((reg176[(4'hb):(3'h4)] ~^ ((8'h9c) || wire4)) ?
                  $unsigned($signed(wire2)) : $unsigned($unsigned(reg185)))) || {(-reg168[(3'h4):(3'h4)]),
                  wire2[(4'h9):(1'h0)]});
              reg188 <= reg184[(3'h4):(1'h1)];
              reg189 <= {(wire179[(3'h4):(2'h3)] ?
                      $unsigned($signed($signed(reg168))) : (((wire4 ^ reg178) ?
                          $unsigned(wire4) : {reg184}) << ((-reg165) ?
                          (^~(7'h41)) : (reg185 >> reg185))))};
              reg190 <= $signed(wire170);
            end
          else
            begin
              reg186 <= reg186;
            end
          reg191 <= $unsigned(reg181);
        end
      if (({$unsigned(reg182)} * reg188[(2'h2):(1'h0)]))
        begin
          if ($signed($unsigned(wire163[(1'h1):(1'h1)])))
            begin
              reg192 <= reg186;
              reg193 <= ($unsigned(wire179) ?
                  $unsigned($signed((8'hbd))) : wire172);
            end
          else
            begin
              reg192 <= wire169[(1'h0):(1'h0)];
              reg193 <= ((~|{(wire173 ?
                          $signed(reg168) : (reg189 ? (8'hb1) : (8'had)))}) ?
                  reg177[(3'h7):(3'h5)] : ($signed(($unsigned((8'ha0)) < $unsigned((8'hb4)))) - reg184[(1'h0):(1'h0)]));
            end
        end
      else
        begin
          if ((($unsigned(($unsigned(reg191) <<< $signed(reg184))) ?
                  $signed({$unsigned(reg192)}) : reg178[(5'h11):(4'h8)]) ?
              wire172[(4'hf):(2'h3)] : $unsigned(($signed(reg178[(5'h10):(4'hc)]) & wire170))))
            begin
              reg192 <= $signed(wire170);
              reg193 <= (8'hb6);
              reg194 <= (reg181 + ((~&$unsigned((wire174 << (8'hbc)))) ?
                  $signed($signed((reg192 ?
                      reg192 : wire3))) : ((~^(reg189 + reg187)) < $unsigned((reg184 * wire180)))));
            end
          else
            begin
              reg192 <= $signed({$unsigned($signed((reg178 >>> reg191))),
                  (+(|(reg189 ? reg188 : wire179)))});
              reg193 <= (($signed((+(7'h41))) > (^(~^{reg191,
                  wire0}))) > (!((reg183 << (&reg178)) != ((reg192 ?
                  wire4 : wire170) <= reg184[(3'h5):(2'h3)]))));
            end
          reg195 <= $unsigned($signed({wire1[(5'h10):(1'h0)]}));
          reg196 <= ($unsigned((($unsigned(wire1) ?
                  $unsigned(reg178) : $signed(reg167)) != wire174)) ?
              wire179 : (reg178 ?
                  (-$unsigned((+(8'hbf)))) : ($unsigned((reg184 ^ reg181)) << wire3)));
          reg197 <= {wire3};
          if ($unsigned($signed($signed(($signed(reg193) <<< (^~(8'hba)))))))
            begin
              reg198 <= $unsigned(($unsigned($unsigned((reg190 ?
                  (8'hb5) : reg165))) > $signed($signed((8'hb9)))));
            end
          else
            begin
              reg198 <= $unsigned((+(8'h9e)));
              reg199 <= wire4[(3'h4):(2'h3)];
            end
        end
    end
  assign wire200 = $signed({($unsigned((^~wire3)) * (8'ha8)),
                       (((-(8'hba)) >> reg181[(4'he):(2'h3)]) ?
                           ($unsigned(reg187) ?
                               (wire173 ?
                                   reg186 : wire163) : (reg165 >> reg183)) : $signed(wire170[(4'hc):(4'hc)]))});
  assign wire201 = $signed((!$unsigned({reg187[(4'h9):(3'h7)],
                       (wire163 ? reg198 : reg190)})));
endmodule

module module5
#(parameter param162 = (({(((8'hb8) - (7'h40)) <= ((8'ha2) | (8'ha1)))} + ((|(+(8'hbb))) ? (((8'hba) ? (8'haa) : (8'hac)) ? ((8'hb7) <= (8'hb7)) : ((8'hb5) ? (8'hb8) : (8'hae))) : ((!(8'h9d)) ? ((7'h43) ? (8'had) : (8'hb4)) : (-(8'hbc))))) ? ((((~(7'h44)) != ((8'h9c) ? (8'hab) : (8'hb7))) ? (((8'hbd) + (8'ha1)) ? {(8'h9f)} : ((8'hae) >= (8'haa))) : ((~&(8'hb3)) ? (~|(8'hac)) : ((8'hb9) & (7'h40)))) ? (8'ha6) : (((+(8'hba)) < (~&(8'hab))) ? {{(8'had)}} : (((8'hb6) ? (7'h43) : (8'hb1)) && (8'ha2)))) : ({{((8'hbe) >> (8'ha0)), (^(8'hbb))}} > ({(&(7'h44)), (~|(8'haa))} ? (~|((8'haf) ? (8'hbe) : (8'hbe))) : (((8'hbb) ? (8'hb2) : (8'hb4)) | {(8'h9f), (8'hbb)})))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h263):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire161;
  wire [(5'h14):(1'h0)] wire160;
  wire signed [(4'hf):(1'h0)] wire156;
  wire [(4'hc):(1'h0)] wire155;
  wire [(2'h3):(1'h0)] wire154;
  wire signed [(4'h9):(1'h0)] wire144;
  wire signed [(5'h15):(1'h0)] wire143;
  wire [(4'hd):(1'h0)] wire141;
  wire [(3'h5):(1'h0)] wire82;
  wire signed [(4'hb):(1'h0)] wire81;
  wire signed [(5'h15):(1'h0)] wire80;
  wire [(4'hf):(1'h0)] wire69;
  wire signed [(3'h4):(1'h0)] wire68;
  wire signed [(5'h10):(1'h0)] wire66;
  wire signed [(5'h13):(1'h0)] wire34;
  reg [(2'h3):(1'h0)] reg159 = (1'h0);
  reg [(5'h12):(1'h0)] reg158 = (1'h0);
  reg [(2'h2):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg153 = (1'h0);
  reg [(3'h5):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg151 = (1'h0);
  reg [(5'h10):(1'h0)] reg150 = (1'h0);
  reg [(4'he):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg147 = (1'h0);
  reg [(5'h15):(1'h0)] reg146 = (1'h0);
  reg [(3'h6):(1'h0)] reg145 = (1'h0);
  reg [(5'h12):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg71 = (1'h0);
  reg [(4'he):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  reg [(5'h15):(1'h0)] reg75 = (1'h0);
  reg [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(5'h14):(1'h0)] reg77 = (1'h0);
  reg [(2'h2):(1'h0)] reg78 = (1'h0);
  reg [(3'h4):(1'h0)] reg79 = (1'h0);
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg [(4'hf):(1'h0)] reg84 = (1'h0);
  reg [(5'h10):(1'h0)] reg85 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg87 = (1'h0);
  reg [(4'hb):(1'h0)] reg88 = (1'h0);
  reg [(4'he):(1'h0)] reg89 = (1'h0);
  reg [(4'he):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg91 = (1'h0);
  reg [(3'h5):(1'h0)] reg92 = (1'h0);
  reg [(3'h7):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg95 = (1'h0);
  reg [(5'h10):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg97 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire156,
                 wire155,
                 wire154,
                 wire144,
                 wire143,
                 wire141,
                 wire82,
                 wire81,
                 wire80,
                 wire69,
                 wire68,
                 wire66,
                 wire34,
                 reg159,
                 reg158,
                 reg157,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 (1'h0)};
  module10 #() modinst35 (.y(wire34), .clk(clk), .wire11((8'hb8)), .wire15(wire6), .wire14(wire9), .wire12(wire7), .wire13(wire8));
  module36 #() modinst67 (.wire38(wire34), .wire40(wire7), .wire37(wire8), .wire39(wire6), .clk(clk), .y(wire66));
  assign wire68 = $unsigned((wire8 ^~ (8'ha6)));
  assign wire69 = (^(|$signed((wire6[(4'ha):(4'h8)] ? (!wire9) : (+wire34)))));
  always
    @(posedge clk) begin
      reg70 <= (8'haf);
      if ((8'hbf))
        begin
          reg71 <= {{wire8, wire7[(4'hf):(3'h4)]}};
          if ((^~($signed($unsigned(wire8)) ?
              reg71[(4'hb):(3'h6)] : $unsigned($signed($signed(wire68))))))
            begin
              reg72 <= wire68;
              reg73 <= $signed($signed((~^($unsigned(wire6) ?
                  (reg71 + wire7) : $signed(wire34)))));
            end
          else
            begin
              reg72 <= (~|(7'h41));
              reg73 <= {reg70};
              reg74 <= ($unsigned($signed((8'hb0))) ?
                  $unsigned($unsigned(({reg71, wire8} ?
                      (wire68 ?
                          wire68 : reg73) : (reg71 <= (8'hb7))))) : reg72);
              reg75 <= (((($unsigned(reg70) << (wire6 ? reg74 : wire9)) ?
                  ($unsigned((8'h9c)) << (~^wire69)) : ({reg70} ?
                      (reg70 & reg74) : $signed(wire6))) <<< reg72) <= ((&(wire66[(3'h4):(3'h4)] ?
                  reg73 : ((8'h9f) ?
                      wire69 : wire7))) ~^ ($signed(reg73[(3'h5):(1'h1)]) + $signed((^wire66)))));
              reg76 <= $signed(($signed((wire34[(5'h12):(4'ha)] ?
                      (reg73 ^ wire7) : $unsigned(wire7))) ?
                  wire8[(5'h12):(3'h4)] : wire6));
            end
        end
      else
        begin
          reg71 <= ({$unsigned(reg74)} | (reg75[(4'hc):(3'h5)] || reg73[(5'h13):(3'h7)]));
        end
      reg77 <= (~reg70[(3'h6):(2'h3)]);
      reg78 <= $unsigned((~$signed($signed((+(8'hb5))))));
      reg79 <= wire8;
    end
  assign wire80 = (~|(+$signed((-((8'hb0) ? (7'h40) : reg76)))));
  assign wire81 = $unsigned($signed({((wire68 ? wire69 : wire66) ?
                          $unsigned(wire34) : (wire80 - wire6))}));
  assign wire82 = $signed($unsigned($unsigned(wire9)));
  always
    @(posedge clk) begin
      if ((-$unsigned($signed($unsigned((reg79 + wire68))))))
        begin
          reg83 <= wire66[(4'h9):(2'h3)];
        end
      else
        begin
          reg83 <= reg77[(4'hb):(4'h9)];
          reg84 <= (({$signed({(8'hb2), reg83}),
              ($unsigned(wire9) > reg79)} - wire66[(4'hf):(2'h2)]) && (wire7 ?
              (|$signed($unsigned(wire82))) : (wire7[(1'h1):(1'h0)] != {(7'h40)})));
          reg85 <= reg74[(1'h0):(1'h0)];
        end
      if (wire81)
        begin
          reg86 <= (($unsigned(reg73[(5'h13):(1'h0)]) ?
                  {($signed((8'hbf)) << (reg75 ?
                          reg70 : wire66))} : {({wire81} ?
                          {wire81, reg74} : reg78),
                      $signed($unsigned(reg74))}) ?
              $unsigned((~^$signed($signed((8'hae))))) : ($unsigned(wire6[(3'h4):(2'h3)]) ?
                  wire80 : (8'hbf)));
          reg87 <= (~|wire82[(3'h5):(1'h0)]);
          if ({(^~{((~reg75) ? (!wire34) : $unsigned(wire69)),
                  $signed((reg70 ? reg73 : wire81))}),
              $signed($unsigned($unsigned((reg71 ? wire68 : reg84))))})
            begin
              reg88 <= reg77;
              reg89 <= (8'had);
              reg90 <= (($unsigned(((reg79 | reg72) >= $signed(reg89))) ?
                  $signed($signed((reg77 >= wire80))) : {$signed((~|reg79)),
                      $signed((wire69 > wire7))}) + (reg71[(4'h9):(3'h7)] ?
                  (!$signed((reg72 ~^ wire6))) : $signed($signed((~^wire68)))));
              reg91 <= ((-$unsigned((+$unsigned(wire34)))) ?
                  ((reg83 << $signed($signed(reg88))) ?
                      reg85 : (+$unsigned({(8'hbc),
                          (8'hb2)}))) : ((reg90[(4'hd):(2'h2)] ?
                          (~((8'ha2) || (8'haf))) : reg76) ?
                      $unsigned($signed(reg85)) : $unsigned(reg74[(4'hc):(4'h9)])));
              reg92 <= (~reg90[(3'h7):(2'h2)]);
            end
          else
            begin
              reg88 <= $unsigned($unsigned(reg88[(4'hb):(1'h1)]));
              reg89 <= $unsigned(reg77[(4'h9):(2'h2)]);
            end
          reg93 <= ({(((~reg76) != (&(8'had))) ?
                  reg70[(3'h4):(1'h0)] : $signed($unsigned((8'ha1)))),
              (($signed(reg92) < (~^reg73)) && (+$signed(reg78)))} >>> $unsigned($unsigned(reg83)));
          reg94 <= reg79[(2'h2):(1'h1)];
        end
      else
        begin
          reg86 <= (reg94[(1'h1):(1'h0)] >= wire82[(3'h5):(2'h2)]);
          if ($signed(((($unsigned(reg74) ? {reg86} : (^~reg71)) ?
                  {reg89, {reg78}} : reg94[(3'h4):(2'h3)]) ?
              $signed(reg88[(4'h8):(2'h3)]) : $signed(((reg72 <= reg77) >= reg71)))))
            begin
              reg87 <= (-$signed((8'had)));
              reg88 <= (~^(({wire66} > {$unsigned(reg77)}) ^~ reg72[(3'h6):(3'h5)]));
              reg89 <= reg94;
            end
          else
            begin
              reg87 <= reg94;
              reg88 <= $signed(($unsigned(wire82[(1'h1):(1'h0)]) << (8'hb5)));
              reg89 <= $signed(((reg92 ?
                  ($signed(reg88) ?
                      (wire6 ?
                          wire9 : reg89) : $unsigned(reg70)) : ((wire6 ^~ wire34) ?
                      reg70 : reg76)) != wire8[(4'h9):(1'h0)]));
              reg90 <= $unsigned(($signed($unsigned((reg72 ?
                      wire7 : (8'ha0)))) ?
                  {$signed((wire66 - wire6))} : ({reg70[(5'h10):(4'ha)],
                          (8'hbc)} ?
                      wire6[(4'h8):(1'h1)] : (~(reg85 ? reg85 : reg89)))));
            end
        end
      reg95 <= {($unsigned({((7'h42) << reg76)}) ?
              ((~^(+(8'hbc))) ?
                  wire69 : ((^reg92) ?
                      $signed(wire82) : ((8'h9d) < reg79))) : reg89[(4'h9):(1'h1)])};
    end
  always
    @(posedge clk) begin
      reg96 <= ($signed((({reg72, (8'ha5)} ?
              $signed(reg87) : (wire6 ? reg73 : reg74)) ?
          (reg73[(3'h5):(1'h0)] ?
              (wire9 ?
                  reg89 : wire34) : (reg84 == (7'h40))) : ((+wire34) & reg79))) < $unsigned(reg76[(3'h4):(2'h3)]));
      reg97 <= (&(&{((wire7 < wire69) ^ wire9), reg70}));
    end
  module98 #() modinst142 (wire141, clk, reg84, reg89, reg71, wire8, wire80);
  assign wire143 = ((wire34[(4'hc):(3'h7)] ?
                       wire68 : ({$unsigned(reg74)} >= reg92[(1'h1):(1'h1)])) ^ {(~&(~&$unsigned(reg83)))});
  assign wire144 = (!(-{$signed(reg73[(4'he):(4'he)])}));
  always
    @(posedge clk) begin
      reg145 <= reg72[(3'h7):(3'h4)];
      reg146 <= $unsigned((reg91 | (reg88 < reg83[(2'h3):(2'h3)])));
    end
  always
    @(posedge clk) begin
      reg147 <= {wire7, reg94};
      reg148 <= (((-reg85) && (wire141 ?
          reg73[(1'h1):(1'h0)] : (~|(7'h40)))) | (reg87 ?
          ($unsigned((~(8'h9e))) == ((8'ha3) >>> reg145)) : $unsigned(reg72[(4'h8):(3'h6)])));
      if ($signed($unsigned(wire6)))
        begin
          if ($unsigned((($unsigned($signed(wire69)) ?
              reg73[(5'h10):(4'hc)] : reg148[(2'h2):(1'h0)]) || $signed((&(reg97 ?
              wire82 : reg96))))))
            begin
              reg149 <= ($signed(({wire68[(3'h4):(2'h2)]} ?
                  {$unsigned((8'ha0)),
                      $signed(wire6)} : reg77[(2'h3):(1'h0)])) + reg96);
            end
          else
            begin
              reg149 <= (wire143[(3'h4):(1'h1)] && $signed({$signed({wire8,
                      reg147}),
                  $signed($signed(reg71))}));
              reg150 <= (wire7[(4'he):(1'h1)] << reg93[(3'h5):(2'h3)]);
            end
          reg151 <= (~(~reg89[(1'h0):(1'h0)]));
          reg152 <= ($unsigned(reg93[(1'h0):(1'h0)]) ?
              $unsigned(wire34) : (reg78 ?
                  $signed(((|reg75) | (reg89 ?
                      (8'ha4) : (8'ha4)))) : ((wire144[(4'h8):(1'h1)] ?
                          {reg150, wire8} : $unsigned(reg77)) ?
                      $signed((|(8'hb3))) : (((7'h40) >= reg151) ?
                          (wire144 - reg147) : $unsigned(reg88)))));
          reg153 <= $signed(reg95);
        end
      else
        begin
          reg149 <= $signed(reg79);
          reg150 <= reg145[(3'h4):(2'h3)];
          reg151 <= ($signed($unsigned(reg85)) && (reg86 ?
              reg77[(4'hc):(4'h8)] : reg147[(2'h3):(2'h2)]));
        end
    end
  assign wire154 = $signed($signed(({(reg72 ? wire69 : (8'hbb)),
                           {reg92, wire9}} ?
                       ($unsigned(reg146) + reg79) : reg148)));
  assign wire155 = ({($signed(wire141[(3'h6):(3'h5)]) == (|(8'hb3)))} ?
                       ($unsigned($signed($signed(wire68))) == wire80[(4'hf):(3'h4)]) : $signed((reg150 << reg72[(3'h6):(1'h0)])));
  assign wire156 = wire154[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg157 <= reg149;
      reg158 <= $signed((reg86[(4'h8):(1'h0)] != $signed({(reg71 != wire156),
          (-wire68)})));
      reg159 <= $signed($unsigned(reg72[(3'h4):(2'h2)]));
    end
  assign wire160 = (~{(reg85[(4'hd):(2'h2)] ?
                           wire34 : ((wire143 | wire6) ?
                               $unsigned(reg83) : $unsigned(reg86))),
                       (8'hb3)});
  assign wire161 = reg84[(3'h4):(1'h0)];
endmodule

module module98
#(parameter param140 = (8'hb7))
(y, clk, wire103, wire102, wire101, wire100, wire99);
  output wire [(32'h1a3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire103;
  input wire signed [(4'he):(1'h0)] wire102;
  input wire signed [(4'h8):(1'h0)] wire101;
  input wire signed [(4'hf):(1'h0)] wire100;
  input wire [(5'h15):(1'h0)] wire99;
  wire [(2'h3):(1'h0)] wire139;
  wire [(4'ha):(1'h0)] wire138;
  wire [(4'hd):(1'h0)] wire136;
  wire signed [(5'h12):(1'h0)] wire129;
  wire signed [(4'ha):(1'h0)] wire128;
  wire [(5'h10):(1'h0)] wire127;
  wire signed [(4'ha):(1'h0)] wire126;
  wire [(5'h13):(1'h0)] wire125;
  wire [(4'hc):(1'h0)] wire113;
  wire signed [(5'h12):(1'h0)] wire112;
  wire signed [(3'h6):(1'h0)] wire111;
  reg [(5'h14):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg135 = (1'h0);
  reg [(4'hc):(1'h0)] reg134 = (1'h0);
  reg [(3'h5):(1'h0)] reg133 = (1'h0);
  reg [(4'hf):(1'h0)] reg132 = (1'h0);
  reg [(3'h7):(1'h0)] reg131 = (1'h0);
  reg [(2'h3):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg124 = (1'h0);
  reg [(4'h9):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg122 = (1'h0);
  reg [(3'h4):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg117 = (1'h0);
  reg signed [(4'he):(1'h0)] reg116 = (1'h0);
  reg [(5'h15):(1'h0)] reg115 = (1'h0);
  reg [(2'h2):(1'h0)] reg114 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg110 = (1'h0);
  reg [(3'h6):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg107 = (1'h0);
  reg [(4'hf):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg105 = (1'h0);
  reg [(5'h13):(1'h0)] reg104 = (1'h0);
  assign y = {wire139,
                 wire138,
                 wire136,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire113,
                 wire112,
                 wire111,
                 reg137,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
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
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (((~(8'hbd)) ?
          (|wire101[(2'h3):(1'h0)]) : $unsigned($signed(($unsigned(wire99) ^~ {wire103,
              wire100})))))
        begin
          reg104 <= wire99[(5'h14):(3'h4)];
          reg105 <= (wire100[(1'h0):(1'h0)] ?
              $signed(wire101[(3'h4):(1'h0)]) : $signed($unsigned($signed($signed(wire102)))));
          reg106 <= $signed((^$signed($unsigned($unsigned(wire99)))));
        end
      else
        begin
          reg104 <= reg105;
        end
      reg107 <= reg104;
      reg108 <= reg107[(4'h8):(1'h1)];
      reg109 <= wire101[(2'h2):(2'h2)];
      reg110 <= reg106;
    end
  assign wire111 = (-$unsigned($signed(((&wire103) || reg105[(4'h8):(3'h7)]))));
  assign wire112 = {$unsigned((reg105 ?
                           $unsigned({wire111,
                               reg106}) : $signed(wire101[(3'h4):(2'h2)])))};
  assign wire113 = $unsigned((~reg106[(3'h7):(3'h5)]));
  always
    @(posedge clk) begin
      reg114 <= (~$unsigned(wire100[(1'h1):(1'h1)]));
      reg115 <= $unsigned($unsigned($signed(reg106)));
      if ($signed((reg115 ?
          {((wire99 ? reg106 : (8'hbf)) ?
                  $signed(wire99) : (~^reg104))} : (8'had))))
        begin
          reg116 <= {($unsigned(wire112[(4'hf):(2'h2)]) ?
                  ((^{wire100}) || $unsigned((reg108 ?
                      reg115 : wire112))) : reg107[(1'h0):(1'h0)]),
              (~&(wire100 ? (|$signed(reg109)) : reg109))};
          if (wire111)
            begin
              reg117 <= reg104[(4'hc):(1'h0)];
              reg118 <= $signed(wire111);
              reg119 <= (^$unsigned(reg106[(4'hc):(4'h9)]));
              reg120 <= ({(reg108 + $unsigned($signed(reg118)))} ?
                  $signed({$unsigned(reg117[(4'hc):(3'h6)])}) : $signed(reg106[(4'h8):(2'h3)]));
              reg121 <= {$unsigned($signed((!(wire103 ? reg105 : wire99))))};
            end
          else
            begin
              reg117 <= (($unsigned(reg109) ?
                      wire99[(2'h2):(1'h1)] : wire112[(5'h10):(3'h7)]) ?
                  reg104 : (reg106[(4'hc):(2'h3)] | reg121));
              reg118 <= wire103[(2'h3):(2'h3)];
              reg119 <= $unsigned((reg121 > {reg106[(4'ha):(4'ha)],
                  reg108[(2'h2):(1'h0)]}));
            end
          reg122 <= ((wire101[(2'h2):(2'h2)] == ({(^reg114),
                  (reg105 | reg109)} ?
              $unsigned((reg115 + (7'h42))) : {$unsigned(wire112)})) >= $unsigned($signed({(reg108 ~^ (8'ha9))})));
          reg123 <= reg121;
          reg124 <= ($unsigned({({reg108, wire99} ?
                      (reg122 >> (8'ha1)) : reg105[(4'hb):(2'h3)]),
                  ((~&wire100) == $unsigned(reg121))}) ?
              ({wire113[(4'h8):(2'h2)], (^$unsigned(reg120))} ?
                  $unsigned((~$unsigned(reg107))) : reg121) : $unsigned(reg104[(3'h6):(3'h6)]));
        end
      else
        begin
          if (wire99)
            begin
              reg116 <= $unsigned(({reg120, $signed((wire103 ^~ reg123))} ?
                  reg105 : reg122[(2'h3):(1'h0)]));
              reg117 <= $unsigned($signed($unsigned(reg106)));
              reg118 <= $unsigned(reg110[(4'h9):(4'h8)]);
              reg119 <= wire99[(5'h10):(2'h3)];
            end
          else
            begin
              reg116 <= ((^~$signed($signed($unsigned(reg115)))) << $unsigned(reg117[(4'ha):(2'h2)]));
              reg117 <= ($unsigned({($signed(wire113) ? reg121 : (~reg118)),
                      reg108}) ?
                  {(~|reg121[(2'h3):(2'h3)]),
                      (~|{$signed(reg120),
                          $unsigned(wire99)})} : $unsigned($signed(($signed(wire100) > (wire100 ^~ wire103)))));
              reg118 <= $unsigned(reg123[(4'h8):(1'h1)]);
              reg119 <= $unsigned((wire100[(3'h4):(3'h4)] ?
                  $unsigned(({wire111,
                      (8'h9d)} - {reg109})) : $signed(reg107)));
            end
          reg120 <= $signed(((~|(wire103[(4'h9):(4'h9)] ?
                  $signed(reg104) : $unsigned(reg106))) ?
              reg110[(4'h8):(4'h8)] : $signed((reg106 <<< (reg108 ?
                  reg110 : reg114)))));
          reg121 <= {((({reg121, reg119} ^~ (reg122 ^ reg118)) ?
                  (8'h9e) : reg119) * reg118[(2'h3):(1'h0)])};
          reg122 <= $unsigned(($signed($signed(wire111)) ?
              (!reg122[(3'h4):(2'h2)]) : ((reg117[(1'h1):(1'h0)] ?
                  reg118[(3'h5):(3'h4)] : $signed(wire111)) >> $signed(((8'hab) >> reg117)))));
        end
    end
  assign wire125 = $unsigned((+(~^(((8'hb7) ?
                       wire99 : reg108) <<< $signed(wire112)))));
  assign wire126 = wire99;
  assign wire127 = $unsigned((8'hb3));
  assign wire128 = (&({reg114[(1'h0):(1'h0)]} ^ (-{$unsigned(reg106),
                       (~|(8'hab))})));
  assign wire129 = $unsigned($signed((^~(&wire111))));
  always
    @(posedge clk) begin
      reg130 <= (~^(-((7'h42) ?
          (~^reg104[(4'h8):(3'h5)]) : {(wire111 ? wire99 : reg110)})));
      if (reg108[(3'h5):(3'h4)])
        begin
          reg131 <= (~(8'ha7));
        end
      else
        begin
          reg131 <= $signed(reg108[(4'hc):(3'h5)]);
          reg132 <= (reg105 ? wire102[(3'h4):(1'h1)] : (~^reg124));
          reg133 <= $unsigned(wire100);
          reg134 <= (reg107 ?
              reg118[(4'h8):(3'h4)] : (reg121 ?
                  $signed($signed($unsigned(wire99))) : ($unsigned((reg118 ?
                      (8'h9f) : reg117)) ^~ wire129)));
        end
      reg135 <= wire101;
    end
  assign wire136 = $signed(reg122);
  always
    @(posedge clk) begin
      reg137 <= reg109;
    end
  assign wire138 = wire126;
  assign wire139 = $signed({$signed(reg137)});
endmodule

module module36  (y, clk, wire40, wire39, wire38, wire37);
  output wire [(32'h105):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire40;
  input wire signed [(5'h12):(1'h0)] wire39;
  input wire signed [(4'ha):(1'h0)] wire38;
  input wire signed [(3'h6):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire65;
  wire [(5'h15):(1'h0)] wire64;
  wire [(4'h8):(1'h0)] wire50;
  wire [(5'h10):(1'h0)] wire49;
  wire signed [(3'h6):(1'h0)] wire48;
  wire signed [(4'h9):(1'h0)] wire47;
  wire [(5'h12):(1'h0)] wire46;
  wire [(4'ha):(1'h0)] wire45;
  wire [(4'hb):(1'h0)] wire44;
  wire [(4'h9):(1'h0)] wire43;
  wire signed [(4'ha):(1'h0)] wire42;
  wire [(2'h3):(1'h0)] wire41;
  reg signed [(3'h6):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg62 = (1'h0);
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  reg [(5'h10):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg58 = (1'h0);
  reg [(3'h4):(1'h0)] reg57 = (1'h0);
  reg [(5'h11):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg55 = (1'h0);
  reg [(3'h7):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg53 = (1'h0);
  reg [(2'h2):(1'h0)] reg52 = (1'h0);
  reg [(4'h8):(1'h0)] reg51 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
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
                 (1'h0)};
  assign wire41 = wire38;
  assign wire42 = (wire38 && ((~^((wire37 >> wire37) * (~wire41))) ?
                      (^$signed({wire37, wire37})) : $unsigned(wire38)));
  assign wire43 = wire40;
  assign wire44 = ($signed($signed((&(&(7'h43))))) ?
                      wire37[(1'h0):(1'h0)] : (wire43 - wire39[(1'h0):(1'h0)]));
  assign wire45 = (&((~&wire41[(1'h1):(1'h0)]) && wire43[(2'h3):(1'h1)]));
  assign wire46 = $signed({{($signed(wire41) != (~&wire40)),
                          wire40[(1'h0):(1'h0)]}});
  assign wire47 = (wire46 ? wire40[(1'h0):(1'h0)] : {{(|$unsigned(wire40))}});
  assign wire48 = wire37;
  assign wire49 = (-($signed(($signed(wire40) ?
                          (^wire40) : (wire37 << wire48))) ?
                      wire39[(2'h2):(1'h1)] : wire46[(4'hf):(3'h4)]));
  assign wire50 = wire41[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg51 <= wire43;
      reg52 <= $unsigned({$signed(wire43[(3'h6):(3'h4)]), wire45});
      if (((wire43[(4'h8):(1'h1)] >= ((^~$signed(wire44)) <= wire40[(3'h5):(2'h3)])) ?
          ($signed(wire50) ?
              (8'hb0) : $signed((+wire49[(3'h7):(2'h2)]))) : (~&wire41)))
        begin
          reg53 <= (wire42[(3'h6):(2'h3)] ?
              ($signed(((wire48 ^~ wire41) ~^ (^~wire38))) ~^ $unsigned(($signed(wire42) - $unsigned(wire48)))) : (~|$signed(wire41)));
          reg54 <= $unsigned(wire42[(1'h0):(1'h0)]);
        end
      else
        begin
          if ($signed($signed({$signed(((8'ha1) ~^ reg53)),
              ((~|reg54) ? (wire43 ^~ reg53) : (reg51 * wire44))})))
            begin
              reg53 <= wire40[(3'h4):(1'h0)];
              reg54 <= ($signed((~^reg54[(3'h5):(2'h3)])) >>> wire44[(3'h6):(3'h4)]);
              reg55 <= reg53[(1'h0):(1'h0)];
              reg56 <= wire41;
            end
          else
            begin
              reg53 <= $unsigned((&$signed(wire46)));
            end
          reg57 <= wire45[(3'h6):(1'h0)];
          if ((-$unsigned((reg54 ?
              $unsigned((&wire40)) : $signed((wire47 ? wire42 : wire43))))))
            begin
              reg58 <= $unsigned(((~(|reg55)) == $signed(wire48)));
              reg59 <= ((-({(reg51 ? reg52 : wire38)} ?
                  wire38 : reg53)) < reg53[(2'h3):(1'h1)]);
              reg60 <= wire38;
              reg61 <= ((({$unsigned(wire43)} > ({reg58,
                      wire41} ^ $unsigned(wire43))) ?
                  (wire38 ?
                      $unsigned((&(8'haf))) : ($signed(reg60) + reg54)) : (^wire44[(3'h7):(3'h4)])) + $signed($unsigned($signed($unsigned((8'hac))))));
            end
          else
            begin
              reg58 <= $signed(wire47);
            end
          reg62 <= reg54;
        end
      reg63 <= (|$unsigned($signed($unsigned(((8'hac) ? (8'hbd) : reg58)))));
    end
  assign wire64 = (($unsigned(((+wire50) ?
                          reg57 : (wire38 < reg51))) >= $signed(($unsigned((8'hbe)) ?
                          $unsigned(reg54) : $signed(reg56)))) ?
                      {(~|((wire43 - reg53) ?
                              wire45[(3'h7):(3'h6)] : wire47))} : (((8'had) == (~^(7'h41))) ?
                          (wire45[(1'h0):(1'h0)] ?
                              $signed(wire41) : (!((8'h9e) >= wire46))) : $signed(((&wire39) && {wire50}))));
  assign wire65 = reg62[(4'hf):(1'h0)];
endmodule

module module10
#(parameter param33 = ((((((8'haa) >>> (8'ha5)) ? ((8'ha2) ^~ (8'hb0)) : (~(8'h9f))) ? ({(8'hba), (8'hb2)} ? (8'hb3) : ((7'h43) ^~ (8'hae))) : (((8'hb6) ? (8'hab) : (8'ha0)) ? ((8'hbb) ? (7'h44) : (8'haf)) : ((8'hbb) >>> (8'hb7)))) ? (^((7'h43) && {(7'h44)})) : ((~((8'hbe) ? (8'ha3) : (8'h9d))) ? (8'hb7) : (8'hb3))) ? {{((~|(8'haa)) | {(8'hb3), (8'hb8)}), ({(8'hb0), (8'haa)} >>> ((7'h41) ? (7'h43) : (8'hb0)))}} : (|{(((8'hab) ? (8'hb0) : (8'hb4)) - ((7'h44) != (8'h9d))), (((8'ha4) <<< (8'hbc)) ? ((7'h40) < (8'ha7)) : ((8'hae) ? (7'h43) : (8'ha5)))})))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'hd5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire15;
  input wire signed [(4'hc):(1'h0)] wire14;
  input wire signed [(5'h15):(1'h0)] wire13;
  input wire signed [(5'h14):(1'h0)] wire12;
  input wire [(4'hb):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire32;
  wire signed [(5'h10):(1'h0)] wire31;
  wire [(3'h6):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire29;
  wire signed [(5'h12):(1'h0)] wire28;
  wire signed [(5'h12):(1'h0)] wire27;
  wire signed [(4'hb):(1'h0)] wire26;
  wire signed [(2'h3):(1'h0)] wire25;
  wire signed [(4'hd):(1'h0)] wire24;
  wire signed [(4'hb):(1'h0)] wire23;
  wire signed [(3'h6):(1'h0)] wire22;
  wire signed [(5'h15):(1'h0)] wire18;
  wire [(3'h7):(1'h0)] wire17;
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire18,
                 wire17,
                 reg21,
                 reg20,
                 reg19,
                 reg16,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg16 <= ((wire14 ?
              (!wire14[(2'h2):(2'h2)]) : $unsigned({(wire11 >>> wire14),
                  ((8'hab) ? wire13 : wire11)})) ?
          wire14 : wire15);
    end
  assign wire17 = ($unsigned(wire12[(2'h3):(1'h1)]) ?
                      reg16[(4'h9):(1'h0)] : ((^~{reg16[(4'h9):(1'h1)],
                          $unsigned(wire11)}) || (((wire14 ? (8'hb1) : wire13) ?
                              (wire14 ? (8'hb2) : wire13) : {(8'hbf)}) ?
                          {(~|(8'hb8)), (|reg16)} : (-{wire11}))));
  assign wire18 = {$unsigned(reg16[(3'h6):(1'h1)]),
                      ((~^(+(wire11 ?
                          wire15 : wire15))) < $unsigned($unsigned($signed(wire17))))};
  always
    @(posedge clk) begin
      reg19 <= $signed(({($unsigned(reg16) ?
                  reg16[(4'h8):(3'h6)] : {wire14, (8'hb2)})} ?
          (7'h41) : wire18));
      reg20 <= wire15[(1'h1):(1'h1)];
      reg21 <= (|(^wire12));
    end
  assign wire22 = $signed((^($signed(reg20[(2'h2):(1'h1)]) ?
                      ($unsigned(wire13) ?
                          (reg19 << wire15) : $signed(reg16)) : (wire18[(5'h15):(3'h7)] != $unsigned(reg20)))));
  assign wire23 = ($signed(($signed((-reg16)) ?
                          reg20 : wire15[(4'hb):(2'h2)])) ?
                      wire22[(3'h4):(1'h0)] : (~$signed((-wire12[(2'h2):(1'h0)]))));
  assign wire24 = ($signed((($signed((8'ha2)) ^ (wire14 ? wire11 : (8'hba))) ?
                          ((8'hb7) * (wire18 ?
                              (8'ha8) : wire18)) : ($unsigned(wire11) ?
                              {reg20} : (8'hac)))) ?
                      $unsigned(wire17) : $unsigned($unsigned((^~(|wire15)))));
  assign wire25 = $unsigned(((~^$unsigned($unsigned((8'ha8)))) ?
                      (8'hbe) : $signed($unsigned((|(8'ha1))))));
  assign wire26 = wire25;
  assign wire27 = $signed(wire18);
  assign wire28 = ($signed(reg16) && {(wire23[(4'h9):(3'h6)] ?
                          ({(8'h9f)} ?
                              (|reg16) : wire25[(2'h2):(2'h2)]) : (!(reg16 ?
                              wire25 : (8'h9d)))),
                      {(~&(~^(8'hba)))}});
  assign wire29 = $unsigned({wire17[(2'h2):(2'h2)], $unsigned((+wire17))});
  assign wire30 = $signed((+($signed(((8'ha8) != wire14)) | $unsigned((~(7'h43))))));
  assign wire31 = ((8'hb1) <<< ((wire13[(1'h1):(1'h1)] ?
                      wire24 : $unsigned((|wire28))) * wire22[(2'h2):(1'h0)]));
  assign wire32 = $unsigned((((~&(reg16 || wire18)) ?
                          $signed((^wire30)) : $signed(reg19)) ?
                      (!{((7'h40) & (8'hb9))}) : $signed((&wire12[(4'h8):(3'h7)]))));
endmodule
