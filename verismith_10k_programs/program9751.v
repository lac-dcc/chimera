module top
#(parameter param225 = (^{((((7'h42) + (7'h43)) ? ((8'hb3) <= (8'hb5)) : ((8'haf) ? (8'ha7) : (8'hae))) ? ((~(7'h44)) ~^ ((8'hb7) ? (8'ha7) : (8'hbb))) : (~^{(8'had)})), ((((8'h9f) < (8'hb5)) && (7'h43)) ? (8'hbc) : (((7'h40) ? (7'h41) : (7'h41)) ? ((7'h44) * (8'hbd)) : ((8'hbb) ? (8'hb6) : (8'hb5))))}), 
parameter param226 = (param225 ? (~&param225) : param225))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h17d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire219;
  wire signed [(3'h6):(1'h0)] wire218;
  wire [(5'h14):(1'h0)] wire217;
  wire [(4'hd):(1'h0)] wire207;
  wire [(5'h11):(1'h0)] wire111;
  wire [(5'h11):(1'h0)] wire9;
  wire signed [(5'h15):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire196;
  wire signed [(4'hf):(1'h0)] wire198;
  wire [(4'hf):(1'h0)] wire199;
  wire [(5'h13):(1'h0)] wire200;
  wire [(4'hf):(1'h0)] wire201;
  wire signed [(3'h4):(1'h0)] wire202;
  wire [(3'h5):(1'h0)] wire203;
  wire [(5'h13):(1'h0)] wire204;
  wire [(3'h7):(1'h0)] wire205;
  wire [(2'h3):(1'h0)] wire221;
  wire [(3'h4):(1'h0)] wire223;
  reg signed [(4'he):(1'h0)] reg222 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg216 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg215 = (1'h0);
  reg [(4'hd):(1'h0)] reg214 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg213 = (1'h0);
  reg [(4'h8):(1'h0)] reg212 = (1'h0);
  reg [(4'hf):(1'h0)] reg211 = (1'h0);
  reg [(4'he):(1'h0)] reg210 = (1'h0);
  reg [(4'hd):(1'h0)] reg209 = (1'h0);
  reg [(3'h5):(1'h0)] reg208 = (1'h0);
  assign y = {wire219,
                 wire218,
                 wire217,
                 wire207,
                 wire111,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire196,
                 wire198,
                 wire199,
                 wire200,
                 wire201,
                 wire202,
                 wire203,
                 wire204,
                 wire205,
                 wire221,
                 wire223,
                 reg222,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 (1'h0)};
  assign wire5 = {(&((^$unsigned(wire0)) ?
                         (~^(~^wire1)) : ($signed(wire0) ~^ wire3)))};
  assign wire6 = ((wire3 ?
                     wire4 : wire3[(3'h5):(2'h3)]) <<< (|{($signed(wire4) >>> wire1)}));
  assign wire7 = (((+(~|$unsigned(wire4))) | $unsigned($unsigned(wire5[(2'h2):(1'h0)]))) <<< (~wire0));
  assign wire8 = $signed((wire3[(1'h0):(1'h0)] ^~ wire5));
  assign wire9 = $unsigned(((8'hbf) ? wire0 : $unsigned(wire0)));
  module10 #() modinst112 (wire111, clk, wire8, wire5, wire9, wire3, wire4);
  module113 #() modinst197 (wire196, clk, wire8, wire2, wire4, wire6);
  assign wire198 = (wire2[(4'hc):(4'ha)] && ((wire196[(4'he):(3'h5)] || (&wire2[(2'h3):(2'h2)])) ?
                       wire8 : (~^wire2)));
  assign wire199 = wire9;
  assign wire200 = {(8'hac)};
  assign wire201 = (8'hac);
  assign wire202 = (&{(7'h43), wire201});
  assign wire203 = wire202[(2'h2):(1'h1)];
  assign wire204 = (+(~^{{(!wire203)}}));
  module16 #() modinst206 (.wire20(wire5), .wire21(wire9), .wire18(wire201), .wire19(wire204), .clk(clk), .y(wire205), .wire17(wire8));
  assign wire207 = $unsigned($signed((wire200 ?
                       wire198 : (+(wire199 ? wire203 : wire3)))));
  always
    @(posedge clk) begin
      if (wire198)
        begin
          reg208 <= (|wire205);
          if (wire9[(2'h2):(1'h0)])
            begin
              reg209 <= ({$signed((!wire4[(3'h6):(2'h2)]))} ?
                  ((({wire196} >= wire196[(2'h2):(1'h1)]) ^ $signed((wire111 ^ wire8))) ~^ (~((wire202 ?
                      (7'h41) : wire6) && $unsigned(wire201)))) : {$signed($signed($signed(wire1))),
                      ((|wire3) ?
                          (wire9 == (wire7 ?
                              wire7 : (8'h9c))) : $signed({wire198,
                              (8'had)}))});
              reg210 <= $signed((wire8 ?
                  wire0[(4'ha):(4'h9)] : reg209[(4'h8):(3'h6)]));
              reg211 <= $signed({(&(reg208 ?
                      (wire203 ? (8'hba) : wire198) : $unsigned(reg208)))});
              reg212 <= wire6[(4'ha):(3'h4)];
              reg213 <= (~$unsigned(({$signed(wire201),
                  wire196} && $unsigned(reg208))));
            end
          else
            begin
              reg209 <= $unsigned((wire205 ? wire6 : wire196[(5'h11):(4'hf)]));
              reg210 <= wire5;
              reg211 <= (wire201 == ({{wire199}} - ($signed((wire0 ?
                      (8'ha5) : wire7)) ?
                  $signed((8'hb7)) : {wire203[(2'h3):(1'h0)]})));
              reg212 <= $unsigned(wire201);
              reg213 <= ((8'h9f) >>> $signed($unsigned(wire1)));
            end
          reg214 <= wire207;
          reg215 <= $unsigned((wire203[(3'h5):(2'h3)] ?
              (wire2 ?
                  (wire203[(2'h3):(1'h0)] ?
                      wire1[(5'h11):(4'hc)] : (~reg210)) : (wire3 ?
                      wire202 : wire0)) : (^~$signed(wire201[(4'hb):(3'h6)]))));
          reg216 <= $unsigned((($unsigned(reg210) ?
              wire202[(2'h2):(2'h2)] : {(^wire204),
                  $unsigned(wire204)}) || {(((8'hb6) - wire4) ^ $signed(wire8))}));
        end
      else
        begin
          reg208 <= $unsigned($signed(($unsigned({reg214, reg208}) ^~ (wire198 ?
              (~wire7) : (wire7 | wire111)))));
          reg209 <= wire111[(3'h5):(3'h4)];
        end
    end
  assign wire217 = ((^~wire111) == (wire205[(2'h3):(2'h3)] * (|((wire201 ?
                           wire111 : wire198) ?
                       wire200[(4'hf):(4'hb)] : wire6))));
  assign wire218 = $unsigned($unsigned(wire0[(1'h0):(1'h0)]));
  module10 #() modinst220 (.wire14(wire201), .wire15(wire8), .wire11(wire196), .clk(clk), .y(wire219), .wire13(wire3), .wire12(wire4));
  assign wire221 = ($unsigned((^~({reg213} < reg209))) ?
                       reg214[(4'hd):(2'h2)] : (&$signed({{wire2}})));
  always
    @(posedge clk) begin
      reg222 <= ((!wire202[(1'h1):(1'h0)]) & $unsigned(((8'ha7) >= $unsigned(reg209))));
    end
  module55 #() modinst224 (.wire57(reg213), .wire59(wire196), .y(wire223), .wire60(reg211), .wire58(wire7), .wire56(wire204), .clk(clk));
endmodule

module module113
#(parameter param195 = (~^((({(8'h9c), (7'h40)} ? ((8'haf) & (8'hba)) : ((8'hac) != (8'hb6))) ? (((8'haa) >>> (8'ha0)) >= ((7'h40) ^ (8'hac))) : (~&((8'ha9) << (8'hb4)))) ? (&(!((8'ha6) ? (8'hbc) : (8'hbc)))) : (^{(+(8'hb5))}))))
(y, clk, wire114, wire115, wire116, wire117);
  output wire [(32'h1de):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire114;
  input wire [(4'hf):(1'h0)] wire115;
  input wire [(5'h10):(1'h0)] wire116;
  input wire [(4'h9):(1'h0)] wire117;
  wire [(3'h6):(1'h0)] wire182;
  wire signed [(2'h3):(1'h0)] wire181;
  wire signed [(4'hd):(1'h0)] wire180;
  wire signed [(3'h6):(1'h0)] wire174;
  wire [(4'hb):(1'h0)] wire173;
  wire signed [(4'hc):(1'h0)] wire172;
  wire signed [(2'h3):(1'h0)] wire118;
  wire [(3'h5):(1'h0)] wire119;
  wire [(5'h15):(1'h0)] wire120;
  wire [(4'ha):(1'h0)] wire121;
  wire signed [(4'hc):(1'h0)] wire122;
  wire [(5'h14):(1'h0)] wire123;
  wire signed [(3'h4):(1'h0)] wire124;
  wire [(4'h8):(1'h0)] wire135;
  wire signed [(5'h15):(1'h0)] wire136;
  wire signed [(5'h14):(1'h0)] wire137;
  wire signed [(3'h6):(1'h0)] wire138;
  wire [(4'hd):(1'h0)] wire139;
  wire [(2'h3):(1'h0)] wire170;
  reg [(5'h11):(1'h0)] reg194 = (1'h0);
  reg [(4'ha):(1'h0)] reg193 = (1'h0);
  reg [(4'hc):(1'h0)] reg192 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg191 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg190 = (1'h0);
  reg [(4'hb):(1'h0)] reg189 = (1'h0);
  reg [(4'he):(1'h0)] reg188 = (1'h0);
  reg [(5'h11):(1'h0)] reg187 = (1'h0);
  reg [(2'h3):(1'h0)] reg186 = (1'h0);
  reg [(4'hc):(1'h0)] reg185 = (1'h0);
  reg [(2'h3):(1'h0)] reg184 = (1'h0);
  reg [(2'h3):(1'h0)] reg183 = (1'h0);
  reg [(2'h2):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg178 = (1'h0);
  reg [(4'hf):(1'h0)] reg177 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg176 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg175 = (1'h0);
  reg [(4'he):(1'h0)] reg134 = (1'h0);
  reg [(4'h9):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg132 = (1'h0);
  reg [(2'h3):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg129 = (1'h0);
  reg [(5'h11):(1'h0)] reg128 = (1'h0);
  reg [(4'ha):(1'h0)] reg127 = (1'h0);
  reg [(4'h8):(1'h0)] reg126 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg125 = (1'h0);
  assign y = {wire182,
                 wire181,
                 wire180,
                 wire174,
                 wire173,
                 wire172,
                 wire118,
                 wire119,
                 wire120,
                 wire121,
                 wire122,
                 wire123,
                 wire124,
                 wire135,
                 wire136,
                 wire137,
                 wire138,
                 wire139,
                 wire170,
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
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
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
                 (1'h0)};
  assign wire118 = (^~((((^wire114) ^~ (8'haa)) ^ wire117[(2'h3):(2'h2)]) ^ wire114));
  assign wire119 = $unsigned({($unsigned((~|wire116)) ?
                           wire118[(2'h3):(2'h3)] : ($unsigned(wire118) >= $unsigned(wire116))),
                       {$unsigned((+wire117))}});
  assign wire120 = wire119[(2'h2):(1'h1)];
  assign wire121 = $signed($unsigned((7'h40)));
  assign wire122 = ($signed(wire117[(3'h7):(2'h2)]) ?
                       (!(8'hb4)) : (-wire118[(1'h1):(1'h1)]));
  assign wire123 = $signed(wire122);
  assign wire124 = $signed((~|($signed((wire116 ?
                       wire122 : wire121)) & {wire118})));
  always
    @(posedge clk) begin
      if (wire116[(3'h7):(2'h3)])
        begin
          if ($unsigned({((((8'ha0) <= wire119) | (wire122 != wire122)) ?
                  wire121[(4'h9):(4'h9)] : (^wire123[(5'h14):(4'hf)]))}))
            begin
              reg125 <= wire118[(1'h1):(1'h1)];
              reg126 <= {$unsigned((!{$unsigned(wire123),
                      (reg125 ? wire121 : wire116)}))};
              reg127 <= {wire114, wire122};
            end
          else
            begin
              reg125 <= $unsigned(reg126);
            end
          reg128 <= (~&$unsigned(reg127[(1'h0):(1'h0)]));
          reg129 <= $unsigned((~&(({reg127, wire117} ?
              (wire114 | wire122) : (8'hac)) >>> (^~(wire120 ?
              reg126 : reg127)))));
          reg130 <= (~^wire118[(2'h3):(1'h1)]);
          if ((8'ha3))
            begin
              reg131 <= wire114[(2'h2):(1'h1)];
              reg132 <= ($unsigned($signed(((wire122 < reg129) ?
                      reg128 : (wire123 << reg125)))) ?
                  {$signed($unsigned({reg127})), $signed(reg130)} : (wire124 ?
                      {$signed((8'hab)), wire122} : wire124));
            end
          else
            begin
              reg131 <= $unsigned((&{wire118[(2'h3):(1'h1)], (~&(!wire114))}));
              reg132 <= wire120;
            end
        end
      else
        begin
          reg125 <= $signed(wire118[(2'h2):(1'h1)]);
          reg126 <= wire116;
          reg127 <= (~wire117);
          if ($signed(wire117))
            begin
              reg128 <= $signed($unsigned((8'h9f)));
              reg129 <= $unsigned($unsigned($signed(reg125[(3'h7):(2'h2)])));
            end
          else
            begin
              reg128 <= wire123;
            end
        end
      reg133 <= (reg132 >= (8'hbc));
      reg134 <= wire122;
    end
  assign wire135 = (wire119 * $unsigned(($unsigned(reg126) ?
                       (|((8'hbd) >> wire124)) : reg129)));
  assign wire136 = reg129[(4'h8):(2'h3)];
  assign wire137 = reg128;
  assign wire138 = (^wire122[(3'h4):(3'h4)]);
  assign wire139 = $unsigned((8'ha9));
  module140 #() modinst171 (.wire143(reg127), .wire142(reg126), .y(wire170), .wire141(wire138), .clk(clk), .wire145(wire122), .wire144(wire123));
  assign wire172 = wire137[(3'h7):(2'h2)];
  assign wire173 = (wire119 ^ ($unsigned($signed((!wire136))) ^~ (wire115[(4'ha):(3'h7)] && (~^(wire115 ?
                       reg132 : (8'hba))))));
  assign wire174 = (wire124[(1'h1):(1'h1)] ?
                       reg134 : (~$unsigned(wire120[(3'h4):(1'h1)])));
  always
    @(posedge clk) begin
      reg175 <= (((~^$unsigned((^~wire120))) << wire139[(3'h7):(3'h5)]) ?
          wire121 : reg130[(4'hc):(3'h7)]);
      reg176 <= ({wire138} > ({$unsigned({reg175})} << wire122));
      reg177 <= wire135;
      reg178 <= reg126[(3'h4):(1'h1)];
      reg179 <= $signed(wire123[(2'h2):(2'h2)]);
    end
  assign wire180 = (wire118[(2'h2):(2'h2)] ? (!wire120) : {wire138});
  assign wire181 = reg176;
  assign wire182 = ((reg132[(3'h5):(3'h4)] ?
                           $signed($unsigned(reg177[(3'h6):(1'h1)])) : (($signed(wire137) ~^ $signed(reg133)) ?
                               $unsigned($unsigned(wire170)) : (^~(~reg125)))) ?
                       {(^wire181[(2'h2):(2'h2)]),
                           (($signed(wire174) >> wire139[(4'hc):(4'h9)]) ~^ reg179)} : (!$unsigned((8'h9f))));
  always
    @(posedge clk) begin
      reg183 <= reg177;
    end
  always
    @(posedge clk) begin
      if ($signed($signed(((~&(reg179 < wire118)) ~^ (reg183 >= (-reg131))))))
        begin
          if (reg133)
            begin
              reg184 <= (^~$unsigned({reg134[(3'h4):(2'h3)]}));
              reg185 <= $signed((reg179 << wire124[(3'h4):(3'h4)]));
              reg186 <= $signed((^~(({wire124, reg125} ?
                  (&wire180) : reg126[(2'h3):(1'h1)]) ^~ reg134)));
            end
          else
            begin
              reg184 <= ($signed((wire173[(3'h7):(2'h2)] ~^ $unsigned({reg133}))) >> ((!wire136[(4'hb):(4'ha)]) & (|(wire182[(3'h4):(3'h4)] >>> (reg178 ?
                  reg133 : wire121)))));
              reg185 <= ($signed((!(^(wire137 << wire124)))) ?
                  $unsigned(((wire123 ?
                      reg125 : (~&wire137)) != ($unsigned(reg132) ~^ {(8'hba),
                      wire137}))) : $unsigned((~&reg134[(3'h4):(2'h3)])));
            end
          reg187 <= {($unsigned(wire115[(2'h2):(1'h0)]) ?
                  reg176 : ($unsigned({reg175, wire122}) < wire122))};
          reg188 <= (~(~$signed((wire116[(1'h0):(1'h0)] ?
              (reg187 <= reg176) : {reg185}))));
          reg189 <= (~^((($unsigned((8'ha4)) - wire124) ?
                  reg127[(4'h9):(4'h9)] : (+(wire115 ? reg185 : reg187))) ?
              (|$unsigned((!(8'hb1)))) : ($unsigned((!(8'ha4))) - (-{wire121,
                  (8'ha3)}))));
          reg190 <= {(~{reg187})};
        end
      else
        begin
          if ((|$signed((($unsigned(reg134) ? (~reg183) : $signed(wire172)) ?
              ((reg176 ? reg185 : reg125) ?
                  (~&wire117) : wire124) : (-reg184)))))
            begin
              reg184 <= $signed((-{$unsigned($unsigned(reg189)),
                  wire137[(4'hf):(4'he)]}));
              reg185 <= {wire174[(1'h0):(1'h0)], reg125[(3'h7):(3'h4)]};
            end
          else
            begin
              reg184 <= wire173;
              reg185 <= wire123[(4'he):(2'h3)];
              reg186 <= $signed((!($unsigned($unsigned(wire138)) ^ $signed({reg132}))));
            end
          if ((({((~|wire123) ~^ $unsigned(wire120))} ?
              (~|(8'ha9)) : {$signed((reg187 ^~ reg127))}) - wire118[(1'h0):(1'h0)]))
            begin
              reg187 <= ($unsigned(wire115[(4'hd):(2'h2)]) ?
                  wire124 : $signed({((8'ha4) == wire117),
                      $signed($signed((8'ha2)))}));
              reg188 <= wire124[(1'h1):(1'h1)];
              reg189 <= (~|((&((reg126 ? wire115 : (8'ha0)) ?
                      reg133 : reg179[(2'h2):(1'h0)])) ?
                  $signed($signed((~&wire114))) : wire120[(4'hc):(4'h9)]));
            end
          else
            begin
              reg187 <= ({$unsigned($signed(reg128[(2'h3):(2'h2)]))} ^~ $signed((^~(8'h9d))));
              reg188 <= wire181;
              reg189 <= $unsigned((($unsigned(reg125) >> $unsigned(wire180)) ?
                  {($unsigned(wire136) ?
                          wire181[(2'h2):(2'h2)] : (reg175 ?
                              wire117 : wire114)),
                      ({(8'hb0), wire180} ?
                          (~&reg189) : {(8'hb6)})} : ((((8'hb4) ?
                      wire118 : wire116) | (|reg190)) ^~ $unsigned($signed(wire180)))));
            end
          reg190 <= {(~^$signed(wire135[(4'h8):(2'h2)])),
              wire119[(3'h4):(3'h4)]};
          reg191 <= $unsigned($signed($signed((8'hb2))));
        end
      reg192 <= {(~&(&$signed((wire170 ? wire170 : reg186)))),
          $unsigned(wire139)};
      reg193 <= {reg133, reg130};
      reg194 <= reg189[(4'hb):(1'h1)];
    end
endmodule

module module10  (y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h111):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire15;
  input wire [(4'hf):(1'h0)] wire14;
  input wire [(4'h9):(1'h0)] wire13;
  input wire [(5'h13):(1'h0)] wire12;
  input wire [(5'h12):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire110;
  wire [(5'h10):(1'h0)] wire33;
  wire [(4'hb):(1'h0)] wire40;
  wire signed [(4'ha):(1'h0)] wire41;
  wire signed [(3'h4):(1'h0)] wire42;
  wire [(5'h12):(1'h0)] wire108;
  reg [(2'h3):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg44 = (1'h0);
  reg [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg [(3'h5):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg35 = (1'h0);
  assign y = {wire110,
                 wire33,
                 wire40,
                 wire41,
                 wire42,
                 wire108,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 (1'h0)};
  module16 #() modinst34 (.wire18(wire13), .wire21(wire15), .wire19(wire11), .wire20(wire14), .y(wire33), .wire17(wire12), .clk(clk));
  always
    @(posedge clk) begin
      if (wire15)
        begin
          reg35 <= wire33;
        end
      else
        begin
          reg35 <= (wire13 ?
              $unsigned($unsigned(($unsigned(wire33) ?
                  wire13 : (&wire12)))) : wire11);
          reg36 <= $unsigned($signed(($unsigned((wire11 & wire11)) ?
              (wire15[(5'h11):(4'ha)] - $signed(wire12)) : $signed((&(7'h40))))));
          if (wire14[(2'h2):(1'h1)])
            begin
              reg37 <= {wire33[(3'h7):(1'h1)],
                  $signed($unsigned((reg36 || $unsigned(wire33))))};
            end
          else
            begin
              reg37 <= {wire14[(1'h1):(1'h1)], wire33};
              reg38 <= wire33[(3'h7):(1'h0)];
            end
        end
      reg39 <= (-((reg38[(1'h0):(1'h0)] ?
          {reg38} : $unsigned({wire13, reg36})) > (&$unsigned((8'hb7)))));
    end
  assign wire40 = reg39;
  assign wire41 = (~&($signed({wire33[(4'hb):(2'h2)]}) ?
                      $signed($unsigned($signed(reg38))) : wire14));
  assign wire42 = (|$unsigned($signed(($unsigned(reg37) || $unsigned((8'ha5))))));
  always
    @(posedge clk) begin
      if (reg38[(1'h1):(1'h1)])
        begin
          if (wire15)
            begin
              reg43 <= $signed({reg35, ((^~wire12[(1'h0):(1'h0)]) ^~ wire12)});
              reg44 <= (-(8'ha5));
              reg45 <= {wire15,
                  (($signed((wire41 ? reg37 : wire15)) ?
                          (^~((8'hb7) ?
                              wire11 : wire41)) : reg44[(4'he):(3'h5)]) ?
                      $unsigned(((wire40 ? (8'hae) : wire15) ?
                          (reg36 ?
                              reg44 : reg37) : (wire40 << reg43))) : $unsigned($unsigned((wire14 <= reg36))))};
              reg46 <= (((wire42[(1'h1):(1'h1)] ?
                      ((reg38 ?
                          wire12 : wire33) >>> wire33[(4'h8):(4'h8)]) : $unsigned((|(8'hab)))) ^ wire40) ?
                  wire33 : (wire15 ?
                      $signed(((wire14 && reg44) ?
                          {reg43} : reg35[(2'h3):(1'h0)])) : (~wire14[(1'h1):(1'h0)])));
              reg47 <= (~{$unsigned({(~|reg35), (reg37 ? reg45 : reg39)})});
            end
          else
            begin
              reg43 <= {$signed(wire42)};
              reg44 <= {((($signed(wire40) ?
                          (reg37 >= (8'hb6)) : $unsigned((8'hb4))) < ((wire42 ^~ (8'hb4)) < (&wire40))) ?
                      wire42[(1'h1):(1'h1)] : ($signed($unsigned(reg37)) == {(8'hab),
                          (reg36 ? reg46 : wire11)})),
                  (-reg37)};
              reg45 <= (wire41 ?
                  {($signed({wire42}) ?
                          $signed((!(8'ha8))) : ((+(8'hb5)) ?
                              reg39[(5'h13):(2'h2)] : $unsigned((7'h44)))),
                      ($signed((reg43 > reg45)) ?
                          (-(+reg38)) : {(wire11 && wire42),
                              (reg39 ?
                                  reg47 : wire13)})} : $signed((reg37[(2'h2):(1'h1)] & $unsigned(reg43))));
              reg46 <= (-($unsigned(reg46) ?
                  $signed($signed(wire33)) : (!{(wire11 ? wire12 : wire33),
                      (wire12 ? reg46 : (8'hb7))})));
              reg47 <= wire41[(2'h3):(1'h0)];
            end
          if (reg46)
            begin
              reg48 <= (|($signed((reg44[(4'he):(3'h4)] + (!wire14))) >>> wire33[(1'h1):(1'h0)]));
            end
          else
            begin
              reg48 <= (reg43[(3'h4):(1'h0)] ?
                  (&(reg39[(3'h4):(3'h4)] ?
                      reg45 : ((8'ha1) << wire41))) : ($unsigned($signed($signed(reg47))) ?
                      ((|((8'hb1) || (8'ha8))) ?
                          (reg46[(2'h2):(1'h0)] ?
                              (~|wire42) : (~|wire42)) : (((8'haf) > wire42) << (reg46 ?
                              wire40 : wire11))) : $unsigned(($unsigned(reg35) ?
                          $signed((8'hbc)) : {reg37}))));
              reg49 <= ($unsigned(reg44[(4'hd):(3'h5)]) ?
                  reg45 : $signed({wire40}));
              reg50 <= wire13[(2'h2):(1'h0)];
              reg51 <= ((^reg49) ?
                  {(+(&$unsigned(reg50)))} : (({reg45[(1'h1):(1'h0)],
                              (~^wire15)} ?
                          {wire41[(2'h3):(1'h1)],
                              $unsigned(reg48)} : (~wire13[(1'h0):(1'h0)])) ?
                      ($signed((8'haa)) ?
                          $unsigned($unsigned(reg49)) : (wire41[(2'h3):(1'h0)] ?
                              (reg43 && reg49) : wire13[(1'h1):(1'h0)])) : wire40[(3'h5):(2'h2)]));
            end
          reg52 <= {((-((8'hbe) ~^ $signed(reg50))) ?
                  (8'ha2) : $signed((^wire14[(3'h6):(3'h4)])))};
          reg53 <= reg44[(1'h0):(1'h0)];
          reg54 <= ($signed(((~&$unsigned(reg43)) - (^~$signed(reg38)))) ?
              $unsigned($signed((~|(reg51 - wire42)))) : ($signed($signed($signed(reg39))) != (|((|reg50) ?
                  $unsigned(wire40) : (wire13 ? (8'hb2) : reg37)))));
        end
      else
        begin
          reg43 <= (reg48 * $signed(($signed(reg36) ?
              ($unsigned((8'hb8)) | reg48[(1'h1):(1'h1)]) : (reg45[(3'h4):(2'h2)] && wire13[(4'h9):(1'h0)]))));
          if ($signed($unsigned($signed(($unsigned(wire33) ?
              {wire15} : (!wire13))))))
            begin
              reg44 <= $unsigned(reg36);
            end
          else
            begin
              reg44 <= {(((^{reg36, reg54}) ?
                          (wire15[(5'h10):(3'h6)] ?
                              $unsigned(reg52) : (~(7'h42))) : (!reg54)) ?
                      $unsigned($unsigned({wire15})) : reg53),
                  (~&reg37)};
              reg45 <= wire12[(4'h8):(1'h1)];
              reg46 <= $signed(reg52);
              reg47 <= (|(~{(~$unsigned(reg37)), (!(+wire41))}));
              reg48 <= ((reg54 || (((-reg48) == (reg46 | (8'ha9))) | (8'hb6))) > wire14);
            end
        end
    end
  module55 #() modinst109 (.wire56(wire42), .wire59(reg45), .wire57(reg37), .clk(clk), .wire58(wire33), .y(wire108), .wire60(wire14));
  assign wire110 = $unsigned($unsigned($signed(((wire15 << reg54) > (wire41 ?
                       reg44 : reg51)))));
endmodule

module module55  (y, clk, wire60, wire59, wire58, wire57, wire56);
  output wire [(32'h208):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire60;
  input wire signed [(4'hd):(1'h0)] wire59;
  input wire signed [(4'hc):(1'h0)] wire58;
  input wire [(3'h4):(1'h0)] wire57;
  input wire [(3'h4):(1'h0)] wire56;
  wire [(3'h5):(1'h0)] wire107;
  wire signed [(4'h8):(1'h0)] wire106;
  wire signed [(4'he):(1'h0)] wire105;
  wire [(3'h5):(1'h0)] wire104;
  wire [(4'h8):(1'h0)] wire90;
  wire [(4'hd):(1'h0)] wire89;
  wire signed [(4'hc):(1'h0)] wire88;
  wire [(4'h8):(1'h0)] wire77;
  wire signed [(5'h12):(1'h0)] wire70;
  wire signed [(2'h2):(1'h0)] wire69;
  wire [(4'hf):(1'h0)] wire68;
  wire [(2'h3):(1'h0)] wire67;
  wire [(3'h5):(1'h0)] wire66;
  wire signed [(4'h8):(1'h0)] wire62;
  wire signed [(4'he):(1'h0)] wire61;
  reg signed [(3'h6):(1'h0)] reg103 = (1'h0);
  reg [(3'h4):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg101 = (1'h0);
  reg [(4'hd):(1'h0)] reg100 = (1'h0);
  reg [(4'ha):(1'h0)] reg99 = (1'h0);
  reg [(4'hc):(1'h0)] reg98 = (1'h0);
  reg [(5'h11):(1'h0)] reg97 = (1'h0);
  reg [(4'h9):(1'h0)] reg96 = (1'h0);
  reg [(2'h3):(1'h0)] reg95 = (1'h0);
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg [(5'h14):(1'h0)] reg93 = (1'h0);
  reg [(2'h2):(1'h0)] reg92 = (1'h0);
  reg [(2'h3):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg82 = (1'h0);
  reg [(4'hb):(1'h0)] reg81 = (1'h0);
  reg [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg79 = (1'h0);
  reg signed [(4'he):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg76 = (1'h0);
  reg [(5'h12):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg74 = (1'h0);
  reg [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(5'h15):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg [(2'h2):(1'h0)] reg63 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire90,
                 wire89,
                 wire88,
                 wire77,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire62,
                 wire61,
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
                 reg91,
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
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg65,
                 reg64,
                 reg63,
                 (1'h0)};
  assign wire61 = wire57;
  assign wire62 = (+(!(&(~&{wire60}))));
  always
    @(posedge clk) begin
      reg63 <= $unsigned(wire59[(3'h6):(3'h4)]);
      reg64 <= $signed(wire61);
      reg65 <= (reg63[(2'h2):(2'h2)] < (~^wire57[(2'h3):(2'h3)]));
    end
  assign wire66 = $signed((&wire58));
  assign wire67 = (reg64 ?
                      ($unsigned(wire61) ?
                          (($unsigned(wire66) ? (~^reg63) : $unsigned(wire59)) ?
                              wire60 : $unsigned((8'hba))) : ({(^(8'hac))} ?
                              $unsigned($unsigned(wire57)) : ((+wire66) ?
                                  $unsigned(wire59) : ((8'hba) <<< (8'ha3))))) : $unsigned(reg63[(1'h0):(1'h0)]));
  assign wire68 = {(({wire59[(1'h0):(1'h0)]} & $signed((-wire62))) ?
                          (~&{(8'ha8),
                              (wire67 << wire67)}) : $unsigned((((8'hbe) != wire61) <<< $signed(wire66)))),
                      $signed($signed(wire62[(3'h6):(1'h1)]))};
  assign wire69 = {wire56[(1'h1):(1'h0)],
                      $signed(((!wire62) ?
                          $signed($signed(wire56)) : wire57[(2'h3):(1'h0)]))};
  assign wire70 = (8'hae);
  always
    @(posedge clk) begin
      reg71 <= $signed($signed((~|$signed(wire57[(2'h3):(2'h2)]))));
    end
  always
    @(posedge clk) begin
      reg72 <= (|(8'ha1));
      reg73 <= reg72[(4'h9):(2'h2)];
      reg74 <= wire61;
      reg75 <= reg71[(2'h3):(2'h3)];
      reg76 <= ($signed((((reg73 >= reg65) ?
          $unsigned(wire56) : (~^(8'ha6))) ^~ wire58)) >> wire67[(1'h0):(1'h0)]);
    end
  assign wire77 = reg76;
  always
    @(posedge clk) begin
      if ($signed($unsigned((-$unsigned({wire60})))))
        begin
          reg78 <= $unsigned($signed(reg63));
          reg79 <= ((~&wire58) ~^ wire59[(4'hc):(3'h5)]);
        end
      else
        begin
          if ((-$signed((&(reg76 ?
              (reg76 ? wire68 : reg73) : ((8'hb2) ? reg73 : wire70))))))
            begin
              reg78 <= $signed($unsigned((($signed(wire57) ?
                  wire77 : (wire68 ?
                      reg73 : wire56)) | $signed($signed(wire67)))));
              reg79 <= $unsigned({(+$unsigned((wire57 | (8'h9f))))});
              reg80 <= $unsigned((($signed(reg79) || ((|wire68) ?
                  $signed(reg64) : {wire68})) | ($unsigned(reg78) && ($signed(wire57) ?
                  $unsigned(wire61) : {reg73}))));
              reg81 <= $unsigned(reg75);
              reg82 <= $unsigned($unsigned($unsigned((~|(wire58 ?
                  reg72 : wire58)))));
            end
          else
            begin
              reg78 <= {$signed($signed((~&(reg79 ? wire66 : wire56))))};
              reg79 <= (reg73 & $signed($unsigned((+(reg63 ?
                  wire62 : reg71)))));
              reg80 <= (wire62 ?
                  reg75 : {$unsigned((((8'hb6) ~^ (8'hb1)) ?
                          (~&(8'hbb)) : $signed(wire62))),
                      wire61});
            end
          reg83 <= (((($signed(reg73) ~^ $unsigned(wire69)) ?
                  reg75[(5'h11):(4'hf)] : (^~(reg65 >> wire68))) ?
              (($signed(reg75) ? $signed(reg81) : $unsigned(reg78)) ?
                  $signed(((8'hac) >= wire60)) : (+(wire62 ?
                      reg71 : (8'had)))) : ((wire68 ?
                  (reg74 >>> (7'h42)) : $unsigned((8'ha4))) << reg72)) >> (8'haa));
        end
      reg84 <= ($signed(({wire77} ^ wire67[(1'h0):(1'h0)])) ?
          wire62[(3'h5):(2'h3)] : (~^$unsigned({(wire56 & reg72)})));
      reg85 <= $unsigned($signed($unsigned((wire66 >>> (reg81 != reg83)))));
    end
  always
    @(posedge clk) begin
      reg86 <= $signed((($unsigned(wire60) == $signed((wire66 ^ reg72))) | (($unsigned(wire61) ~^ (wire66 + reg85)) ?
          (reg81[(3'h7):(1'h0)] == ((8'ha6) ?
              reg71 : (7'h40))) : ((-reg74) + wire67))));
      reg87 <= (((wire77[(3'h5):(1'h0)] * $unsigned($unsigned(reg63))) && (wire57[(2'h2):(2'h2)] ?
          $signed($unsigned((8'hb4))) : (reg63 ?
              $unsigned((8'haf)) : (wire69 ?
                  reg76 : reg78)))) + wire70[(3'h4):(1'h0)]);
    end
  assign wire88 = $signed(((-(|(+reg74))) ? reg85 : wire67));
  assign wire89 = reg75;
  assign wire90 = $unsigned(($signed((reg75[(3'h7):(3'h6)] >> $signed(wire67))) ?
                      ($signed((reg86 > (8'hb9))) - $unsigned((wire77 ?
                          wire89 : wire62))) : wire58[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      if (wire61[(4'ha):(3'h7)])
        begin
          reg91 <= wire60;
          reg92 <= (((!($unsigned(reg79) ?
                  (reg63 + reg72) : {wire56,
                      (8'ha8)})) || reg73[(3'h7):(1'h0)]) ?
              (!(reg84[(1'h0):(1'h0)] ?
                  $unsigned(wire69[(1'h1):(1'h1)]) : wire57[(1'h0):(1'h0)])) : $unsigned(($signed(reg82[(3'h7):(3'h7)]) && $unsigned((reg81 && reg81)))));
          reg93 <= (!({wire61} ?
              $unsigned((^{reg92})) : (-$signed($unsigned(reg85)))));
          if (reg72[(3'h6):(3'h6)])
            begin
              reg94 <= {wire59, reg71};
              reg95 <= wire57[(2'h3):(2'h3)];
              reg96 <= (!reg94);
              reg97 <= (~(!((reg65 >= $signed(wire57)) ?
                  ($unsigned(reg85) ?
                      ((8'hb9) << reg64) : $signed(wire66)) : (~&(+(8'ha3))))));
              reg98 <= reg73[(1'h0):(1'h0)];
            end
          else
            begin
              reg94 <= (wire88[(2'h3):(1'h1)] ?
                  reg95[(1'h0):(1'h0)] : $unsigned(wire61));
              reg95 <= $signed((reg96[(2'h3):(1'h1)] ?
                  $unsigned((&reg91[(1'h1):(1'h1)])) : reg65));
              reg96 <= ((($signed((reg75 ?
                      wire88 : reg72)) < wire70) & (8'h9e)) ?
                  $unsigned(((~^reg95[(1'h0):(1'h0)]) ?
                      ((reg73 > reg95) << reg93[(3'h5):(3'h5)]) : $signed(reg83))) : (reg64[(4'hc):(3'h6)] == {(wire56 ?
                          (|reg75) : (|wire66)),
                      reg91}));
              reg97 <= (~&(~(-$signed((^wire88)))));
              reg98 <= $unsigned(($unsigned((~reg84)) != ((((7'h44) ?
                      reg65 : wire56) <= reg63) ?
                  (^$unsigned(reg63)) : (reg91 < (-wire56)))));
            end
          reg99 <= ({(!reg85)} ? reg94 : (!reg95[(1'h0):(1'h0)]));
        end
      else
        begin
          if ({$signed(((^~{wire70, (8'ha4)}) ^ (+((8'ha3) ^~ (8'h9c)))))})
            begin
              reg91 <= $signed($signed($signed($unsigned((reg82 ?
                  reg98 : wire68)))));
              reg92 <= ((|$signed($unsigned(wire66))) ^ ($signed({(~&(8'hbb))}) * $unsigned((^{(8'ha9),
                  wire77}))));
              reg93 <= reg92[(1'h0):(1'h0)];
              reg94 <= {reg86, reg99[(2'h3):(1'h0)]};
            end
          else
            begin
              reg91 <= {$unsigned($unsigned($unsigned($unsigned(reg85))))};
              reg92 <= ($signed(reg76[(1'h0):(1'h0)]) ?
                  $signed(wire69[(2'h2):(1'h1)]) : (~|reg82[(1'h0):(1'h0)]));
              reg93 <= $signed({(&wire90)});
            end
          if ($unsigned((wire66 ?
              ($signed((reg95 ? reg73 : reg64)) && $unsigned((reg85 ?
                  reg86 : reg87))) : ($unsigned(reg76[(2'h3):(1'h1)]) ?
                  (~&(reg83 ? reg64 : reg85)) : (^~$unsigned(reg86))))))
            begin
              reg95 <= reg72;
              reg96 <= wire77[(2'h3):(2'h2)];
            end
          else
            begin
              reg95 <= (reg85[(4'h8):(3'h7)] || (-$unsigned((wire88[(2'h3):(2'h2)] != {reg79,
                  reg82}))));
            end
        end
      reg100 <= (wire89 ?
          (&($unsigned($unsigned(wire60)) ?
              $signed($signed(wire77)) : wire88)) : (^~$unsigned((!wire67[(2'h2):(1'h0)]))));
      reg101 <= wire62;
      reg102 <= {reg93[(1'h0):(1'h0)]};
      reg103 <= ($unsigned($unsigned((reg84[(4'hb):(1'h1)] >= (wire57 >> reg99)))) <<< wire89);
    end
  assign wire104 = (&{$unsigned(reg100)});
  assign wire105 = ((((&$signed(reg82)) ?
                               wire89[(2'h2):(1'h1)] : (reg98 | $signed(reg80))) ?
                           {$unsigned(reg93)} : (^~(8'ha8))) ?
                       reg71 : $signed(wire58));
  assign wire106 = (~|$unsigned((~^($unsigned(reg71) ?
                       $signed(wire58) : (reg64 <<< reg73)))));
  assign wire107 = (^$signed({(!reg74[(4'hb):(1'h1)]),
                       {wire68, (reg79 ? reg102 : wire70)}}));
endmodule

module module16
#(parameter param31 = ({((((8'hbe) ? (8'ha9) : (8'hb7)) ? ((8'ha2) >>> (8'haa)) : (~&(8'hba))) && (^~((8'hb9) ? (8'ha8) : (8'hb2))))} <= (&(((&(8'haa)) + ((8'hb9) || (8'hb9))) ? ((+(8'hbb)) >= (8'hab)) : {((8'hbd) ? (8'h9d) : (8'ha4)), (-(8'ha6))}))), 
parameter param32 = (((({param31} ? {param31} : (param31 & param31)) ? ((+param31) ? {param31, param31} : (-param31)) : (-(|param31))) == (((~|param31) ? (~&param31) : (param31 * param31)) ? ({param31} ? (!param31) : (param31 ^ (8'ha0))) : ((|param31) ? param31 : (+param31)))) ^ ({param31, ((~&param31) != (8'hb9))} ? (((param31 <= param31) && param31) ? param31 : ((!param31) >= (param31 << param31))) : {param31, ((^~param31) ~^ (param31 ? (8'hb1) : param31))})))
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire21;
  input wire [(4'h9):(1'h0)] wire20;
  input wire [(5'h12):(1'h0)] wire19;
  input wire signed [(3'h6):(1'h0)] wire18;
  input wire [(4'hb):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire30;
  wire signed [(2'h3):(1'h0)] wire29;
  wire [(5'h12):(1'h0)] wire28;
  wire [(2'h3):(1'h0)] wire27;
  wire [(4'ha):(1'h0)] wire26;
  wire signed [(4'h9):(1'h0)] wire25;
  wire signed [(4'hc):(1'h0)] wire24;
  wire [(3'h4):(1'h0)] wire23;
  wire signed [(3'h7):(1'h0)] wire22;
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 (1'h0)};
  assign wire22 = wire17;
  assign wire23 = (^~((wire17[(2'h2):(1'h0)] ?
                      {(wire22 && wire22)} : wire18[(1'h0):(1'h0)]) == (7'h41)));
  assign wire24 = {(~^$unsigned((~^$signed(wire19))))};
  assign wire25 = wire20;
  assign wire26 = $signed(wire22);
  assign wire27 = wire24[(4'hc):(4'hb)];
  assign wire28 = $signed($signed((+wire27)));
  assign wire29 = (&(wire20 == $unsigned(((wire23 ^ (8'hb5)) && $signed((7'h42))))));
  assign wire30 = $signed((wire29[(2'h2):(1'h1)] > ($unsigned($signed(wire29)) ?
                      ((wire27 >= wire26) ?
                          $signed(wire27) : wire18[(1'h0):(1'h0)]) : wire22)));
endmodule

module module140  (y, clk, wire145, wire144, wire143, wire142, wire141);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire145;
  input wire signed [(5'h13):(1'h0)] wire144;
  input wire signed [(4'ha):(1'h0)] wire143;
  input wire signed [(3'h7):(1'h0)] wire142;
  input wire signed [(3'h6):(1'h0)] wire141;
  wire [(5'h11):(1'h0)] wire169;
  wire signed [(5'h11):(1'h0)] wire161;
  wire signed [(3'h5):(1'h0)] wire160;
  wire signed [(3'h6):(1'h0)] wire159;
  wire signed [(3'h7):(1'h0)] wire158;
  wire [(4'hb):(1'h0)] wire157;
  wire [(5'h14):(1'h0)] wire156;
  wire signed [(3'h5):(1'h0)] wire155;
  wire [(4'he):(1'h0)] wire154;
  wire [(2'h2):(1'h0)] wire153;
  wire signed [(2'h3):(1'h0)] wire147;
  wire signed [(2'h3):(1'h0)] wire146;
  reg signed [(2'h3):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg167 = (1'h0);
  reg [(5'h15):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg165 = (1'h0);
  reg [(3'h6):(1'h0)] reg164 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg163 = (1'h0);
  reg [(2'h3):(1'h0)] reg162 = (1'h0);
  reg signed [(4'he):(1'h0)] reg152 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg148 = (1'h0);
  assign y = {wire169,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire147,
                 wire146,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 (1'h0)};
  assign wire146 = (wire143[(3'h5):(2'h2)] ?
                       $signed($unsigned(($unsigned(wire142) * $signed(wire145)))) : (!(wire144[(2'h2):(1'h0)] || $signed((wire143 == wire142)))));
  assign wire147 = $unsigned({(8'hb0)});
  always
    @(posedge clk) begin
      reg148 <= wire142;
      reg149 <= $signed({$signed(wire143[(3'h5):(3'h4)]),
          $unsigned((^(wire145 ^ reg148)))});
      reg150 <= {($unsigned(((~&wire145) ? (~reg149) : (&reg148))) << ((8'ha6) ?
              (+$unsigned(wire145)) : $signed((wire147 ~^ (8'hb3))))),
          (^~reg149)};
      reg151 <= $signed({$unsigned({(+wire145)})});
      reg152 <= reg149[(5'h10):(4'ha)];
    end
  assign wire153 = (~^$unsigned({$unsigned($signed(reg148)),
                       $signed($signed(wire142))}));
  assign wire154 = $signed($signed(($signed(reg150[(3'h6):(2'h3)]) ?
                       $signed((!(8'ha1))) : wire145)));
  assign wire155 = ($unsigned((wire153 | $signed(wire145[(1'h0):(1'h0)]))) <<< (wire145 ?
                       reg151 : $unsigned((+wire145[(3'h7):(3'h4)]))));
  assign wire156 = (^reg151);
  assign wire157 = (~|$unsigned({$signed((wire145 ? wire153 : reg150))}));
  assign wire158 = wire145[(1'h1):(1'h0)];
  assign wire159 = $unsigned((&wire143[(4'h8):(3'h6)]));
  assign wire160 = (~|wire159);
  assign wire161 = $unsigned(wire158);
  always
    @(posedge clk) begin
      if (wire143[(4'ha):(3'h5)])
        begin
          if (reg152)
            begin
              reg162 <= (^(((((8'ha6) < (8'hbd)) ? wire161 : (~|wire141)) ?
                  ($unsigned(wire141) ?
                      (-(8'hb5)) : wire144) : $unsigned((wire158 > wire145))) >= (wire160[(1'h1):(1'h0)] | ((wire146 * wire146) ?
                  (wire157 ? (8'hbb) : wire159) : $signed((8'hbb))))));
              reg163 <= $signed($unsigned(wire141));
              reg164 <= (!wire159[(3'h5):(3'h4)]);
              reg165 <= wire142[(3'h6):(3'h6)];
            end
          else
            begin
              reg162 <= reg148;
              reg163 <= $signed($unsigned($signed($signed((reg165 ?
                  reg149 : (8'hb9))))));
            end
          reg166 <= (&wire157);
          reg167 <= wire156[(4'h9):(3'h4)];
        end
      else
        begin
          if (wire156[(2'h3):(2'h3)])
            begin
              reg162 <= reg167;
              reg163 <= (({(wire156 ^~ (+wire158))} * ($signed(wire156) ^~ (wire158[(3'h6):(2'h3)] ?
                  {wire147, wire153} : wire159[(3'h6):(2'h3)]))) >>> ((wire153 ?
                  $signed((reg151 << wire153)) : $unsigned((^~wire153))) - $unsigned($unsigned(wire161))));
              reg164 <= $signed(($unsigned(((wire143 ? wire158 : reg166) ?
                      wire155[(2'h2):(1'h1)] : {wire145})) ?
                  (((~wire155) ? $signed(reg151) : $unsigned(wire161)) ?
                      (wire156[(1'h1):(1'h0)] && $unsigned((8'hb2))) : $unsigned(((8'hb6) ~^ reg164))) : {$signed(wire147)}));
              reg165 <= ($signed(((&wire160[(1'h0):(1'h0)]) ?
                      wire156 : (wire160 != (reg163 ? reg151 : (8'hb6))))) ?
                  {(({reg149, wire155} ?
                          $signed(reg164) : ((8'hb5) ?
                              reg164 : wire157)) >= reg149[(4'h8):(1'h1)]),
                      ((^~$signed(wire154)) ?
                          $signed((wire146 ?
                              wire159 : wire144)) : ($unsigned(reg150) + wire153))} : ($unsigned(($unsigned(reg152) ?
                          (~wire153) : {wire157})) ?
                      ((~&wire157[(4'h8):(2'h2)]) | (reg167[(5'h13):(4'ha)] ?
                          $unsigned((8'hb6)) : ((8'hb2) > reg165))) : wire153[(1'h0):(1'h0)]));
            end
          else
            begin
              reg162 <= wire146;
            end
          reg166 <= (wire160 & ($signed(reg151) ?
              reg165 : (((reg151 > reg164) < wire157[(4'h9):(4'h9)]) ?
                  reg162 : $signed($unsigned(wire160)))));
          reg167 <= reg166[(4'h9):(4'h9)];
          reg168 <= reg150;
        end
    end
  assign wire169 = (wire146 ? wire159[(2'h2):(2'h2)] : reg162);
endmodule
