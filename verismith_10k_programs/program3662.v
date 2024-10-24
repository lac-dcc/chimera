module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h12b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire4;
  wire signed [(4'he):(1'h0)] wire186;
  wire [(3'h4):(1'h0)] wire184;
  wire [(3'h4):(1'h0)] wire109;
  wire [(2'h2):(1'h0)] wire108;
  wire [(4'hb):(1'h0)] wire107;
  wire signed [(5'h15):(1'h0)] wire106;
  wire signed [(5'h12):(1'h0)] wire105;
  wire signed [(4'h9):(1'h0)] wire95;
  wire signed [(2'h2):(1'h0)] wire88;
  reg signed [(4'h8):(1'h0)] reg189 = (1'h0);
  reg [(3'h5):(1'h0)] reg188 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg187 = (1'h0);
  reg [(4'hc):(1'h0)] reg104 = (1'h0);
  reg [(4'hf):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg102 = (1'h0);
  reg [(4'ha):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg99 = (1'h0);
  reg [(5'h13):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg94 = (1'h0);
  reg [(4'hd):(1'h0)] reg93 = (1'h0);
  reg [(5'h15):(1'h0)] reg92 = (1'h0);
  reg [(3'h4):(1'h0)] reg91 = (1'h0);
  reg [(5'h12):(1'h0)] reg90 = (1'h0);
  assign y = {wire186,
                 wire184,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire95,
                 wire88,
                 reg189,
                 reg188,
                 reg187,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 (1'h0)};
  module5 #() modinst89 (.wire6(wire4), .wire7(wire0), .wire9(wire3), .y(wire88), .wire10(wire2), .wire8(wire1), .clk(clk));
  always
    @(posedge clk) begin
      reg90 <= wire3[(1'h1):(1'h0)];
      reg91 <= $unsigned($signed(wire3[(4'hb):(4'ha)]));
      reg92 <= wire1[(3'h7):(1'h1)];
      reg93 <= ({reg92[(2'h2):(2'h2)],
              (~&(((8'hb6) ? wire1 : (8'hb4)) ?
                  wire3[(3'h6):(2'h2)] : (reg90 != wire3)))} ?
          {((!(wire88 >>> reg92)) ?
                  $unsigned(((8'haf) && reg92)) : $signed((reg92 ^~ reg90))),
              (wire2 != ($signed(reg90) >>> wire2))} : wire1[(2'h3):(2'h2)]);
      reg94 <= $signed($unsigned(($signed(((8'hae) ? (8'haf) : wire2)) ?
          ($unsigned(wire88) ^~ $signed(wire3)) : (reg93[(2'h2):(1'h0)] ~^ reg90))));
    end
  assign wire95 = $signed(wire88[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg96 <= wire88;
      if ($signed((~^{$signed(wire4[(2'h3):(2'h3)])})))
        begin
          reg97 <= $unsigned($signed(((-(~(8'hb4))) <<< reg93[(1'h0):(1'h0)])));
          reg98 <= ($unsigned(((&$unsigned(reg90)) >> ($unsigned(wire4) ?
              (-reg90) : (+(8'haf))))) >= {$unsigned(reg92[(4'hb):(4'h9)])});
          reg99 <= {$signed((wire4[(3'h7):(3'h7)] >> {reg94})), wire0};
          reg100 <= (wire95[(4'h8):(3'h6)] ?
              $signed({({(7'h43)} || (wire0 && wire1)), (8'hb1)}) : (|(8'haf)));
        end
      else
        begin
          if ((reg92[(3'h4):(1'h1)] ?
              (-($signed(wire0[(4'hb):(4'hb)]) ?
                  $unsigned((reg90 >>> wire3)) : $signed((wire88 | reg98)))) : reg90))
            begin
              reg97 <= wire4;
              reg98 <= $unsigned(((+reg96) ?
                  (^$unsigned($unsigned(reg99))) : $unsigned((reg99 ?
                      reg94 : {reg90, (8'hbf)}))));
              reg99 <= {$unsigned((&{{reg92}, (reg96 <= (8'hb9))}))};
              reg100 <= reg94[(1'h1):(1'h0)];
              reg101 <= wire1[(4'hf):(3'h4)];
            end
          else
            begin
              reg97 <= (~({{(wire3 ? reg101 : reg91)}} ?
                  ((8'h9f) >>> $unsigned((wire2 << (8'ha8)))) : (reg91 != $signed((reg93 >= reg100)))));
              reg98 <= {(reg93 == ({wire2} ?
                      (^~$signed((8'hb4))) : reg93[(4'hd):(4'h8)])),
                  (wire0 ? wire4[(3'h6):(3'h6)] : reg98[(4'he):(2'h3)])};
              reg99 <= reg90[(5'h12):(5'h12)];
              reg100 <= reg90[(5'h11):(4'hb)];
            end
        end
      reg102 <= $unsigned($signed(reg94[(3'h7):(2'h2)]));
      reg103 <= $unsigned($unsigned({$signed(reg101[(1'h1):(1'h0)]), reg94}));
      reg104 <= (7'h43);
    end
  assign wire105 = reg91[(1'h0):(1'h0)];
  assign wire106 = $unsigned($signed((!(reg91 ? (wire2 ^~ reg90) : (|reg99)))));
  assign wire107 = $unsigned(($signed(reg92) ?
                       reg101 : (($unsigned(wire95) ?
                           (~^wire3) : $signed(reg90)) << reg100[(4'hd):(4'h8)])));
  assign wire108 = (~|$unsigned(($signed(((8'hb5) > wire4)) || reg103)));
  assign wire109 = ($unsigned((+(reg91[(2'h2):(1'h1)] ?
                           $unsigned(reg93) : reg90))) ?
                       ($signed((^(wire107 ? wire88 : wire95))) ?
                           (((reg96 ^ reg99) | $signed(reg102)) << wire3) : reg103[(3'h6):(3'h4)]) : (8'hae));
  module110 #() modinst185 (.wire113(reg90), .wire114(reg101), .wire111(reg92), .wire112(reg97), .clk(clk), .y(wire184));
  assign wire186 = $signed(($unsigned(wire1) ?
                       ({$signed(reg96),
                           ((7'h42) ?
                               reg104 : wire109)} ^ reg101[(3'h7):(2'h2)]) : $unsigned(((reg98 ?
                               reg94 : (8'hb5)) ?
                           (wire184 ? wire95 : wire108) : $signed((8'h9e))))));
  always
    @(posedge clk) begin
      reg187 <= ($unsigned(wire106) ?
          $unsigned((&(~&$signed((8'h9e))))) : (!(^(^(reg91 - wire106)))));
      reg188 <= {$unsigned((wire95 >>> ({wire107} << $unsigned(reg93)))),
          (-{(~&$signed(wire184)), wire108})};
    end
  always
    @(posedge clk) begin
      reg189 <= reg93[(4'ha):(4'h9)];
    end
endmodule

module module110  (y, clk, wire111, wire112, wire113, wire114);
  output wire [(32'h1dc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire111;
  input wire signed [(5'h10):(1'h0)] wire112;
  input wire [(4'h9):(1'h0)] wire113;
  input wire [(4'ha):(1'h0)] wire114;
  wire signed [(4'he):(1'h0)] wire183;
  wire signed [(5'h12):(1'h0)] wire167;
  wire signed [(4'h8):(1'h0)] wire166;
  wire signed [(3'h7):(1'h0)] wire115;
  wire [(4'hd):(1'h0)] wire116;
  wire signed [(4'h9):(1'h0)] wire117;
  wire signed [(4'hc):(1'h0)] wire118;
  wire signed [(4'hc):(1'h0)] wire119;
  wire signed [(4'hd):(1'h0)] wire120;
  wire signed [(3'h5):(1'h0)] wire121;
  wire signed [(5'h13):(1'h0)] wire122;
  wire signed [(4'ha):(1'h0)] wire123;
  wire [(3'h7):(1'h0)] wire124;
  wire [(2'h2):(1'h0)] wire125;
  wire signed [(4'hf):(1'h0)] wire126;
  wire [(4'h9):(1'h0)] wire136;
  wire signed [(5'h12):(1'h0)] wire164;
  reg signed [(5'h11):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg181 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg179 = (1'h0);
  reg [(4'he):(1'h0)] reg178 = (1'h0);
  reg [(5'h10):(1'h0)] reg177 = (1'h0);
  reg [(5'h11):(1'h0)] reg176 = (1'h0);
  reg [(4'he):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg174 = (1'h0);
  reg [(4'h8):(1'h0)] reg173 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg172 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg171 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg170 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg169 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg168 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg135 = (1'h0);
  reg [(4'hc):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg133 = (1'h0);
  reg [(4'hc):(1'h0)] reg132 = (1'h0);
  reg [(2'h2):(1'h0)] reg131 = (1'h0);
  reg [(2'h2):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg129 = (1'h0);
  reg [(4'ha):(1'h0)] reg128 = (1'h0);
  reg [(4'hc):(1'h0)] reg127 = (1'h0);
  assign y = {wire183,
                 wire167,
                 wire166,
                 wire115,
                 wire116,
                 wire117,
                 wire118,
                 wire119,
                 wire120,
                 wire121,
                 wire122,
                 wire123,
                 wire124,
                 wire125,
                 wire126,
                 wire136,
                 wire164,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 (1'h0)};
  assign wire115 = (wire114 ?
                       $signed({(|(+wire113))}) : (((|wire112) > ((^wire112) << (|wire113))) ?
                           ($signed((wire114 ?
                               (8'hbc) : wire111)) ~^ ((^(8'hbb)) - $unsigned(wire114))) : (((wire111 ?
                                       wire113 : wire111) ?
                                   (&wire114) : (+(8'haf))) ?
                               $signed($unsigned(wire114)) : $unsigned((wire113 < wire112)))));
  assign wire116 = $signed($signed($signed(wire112)));
  assign wire117 = ($unsigned($signed((~|(!wire113)))) ~^ $signed((((wire111 ?
                               wire114 : wire111) ?
                           wire116 : (wire111 ? wire116 : wire111)) ?
                       wire116[(3'h6):(3'h5)] : ((wire112 - wire111) * wire115))));
  assign wire118 = ($signed(wire112) ?
                       {$signed({(wire114 ? wire111 : wire116),
                               (wire116 >= wire116)})} : $signed(wire116));
  assign wire119 = (!$unsigned((~({wire118} ?
                       $signed((7'h42)) : $signed(wire111)))));
  assign wire120 = (~&(~^$unsigned($signed((8'ha1)))));
  assign wire121 = (~wire113[(2'h3):(1'h1)]);
  assign wire122 = (wire120 ? wire117[(4'h8):(3'h6)] : wire117);
  assign wire123 = (8'hb6);
  assign wire124 = ($signed(wire113) ?
                       $unsigned((~|(~^(^wire121)))) : (({$unsigned((8'ha1))} ?
                               $unsigned((wire113 ?
                                   wire121 : wire117)) : wire111) ?
                           $unsigned(wire117[(1'h1):(1'h1)]) : {((wire115 ?
                                       wire119 : wire117) ?
                                   wire112 : (&wire111))}));
  assign wire125 = $signed((~wire114));
  assign wire126 = $signed($unsigned($unsigned(wire122)));
  always
    @(posedge clk) begin
      if (wire124)
        begin
          reg127 <= (~&(8'hab));
          reg128 <= (8'had);
        end
      else
        begin
          reg127 <= $unsigned(wire117[(3'h6):(2'h3)]);
          reg128 <= ((wire124 ? wire111[(3'h7):(3'h7)] : wire114) ?
              $unsigned((|wire125[(2'h2):(1'h0)])) : {$unsigned(wire115)});
          reg129 <= ((wire119 >= $signed(((reg127 << (8'ha6)) * wire125))) ?
              (wire119[(4'h9):(3'h7)] * wire122[(1'h1):(1'h0)]) : $signed($signed((wire121 ?
                  $unsigned(wire124) : (8'hbc)))));
          if ((+$unsigned($signed(wire120))))
            begin
              reg130 <= ((~|$signed($signed((wire113 ?
                  wire117 : wire121)))) > reg127[(3'h7):(2'h3)]);
              reg131 <= ($signed({$signed(reg127[(4'hb):(3'h7)]),
                      wire121[(3'h5):(2'h2)]}) ?
                  (~^wire115) : wire111);
              reg132 <= (^wire116);
              reg133 <= $unsigned((-$unsigned(wire115[(1'h0):(1'h0)])));
            end
          else
            begin
              reg130 <= {((8'ha0) ?
                      (~^$unsigned((reg127 ? reg130 : wire126))) : (wire126 ?
                          {wire122} : (((8'ha9) ?
                              wire122 : reg127) | wire118)))};
              reg131 <= ($signed(wire112[(4'ha):(3'h6)]) != $signed((~((wire115 ^ wire115) ?
                  wire120[(4'h8):(2'h2)] : (reg130 ^~ reg131)))));
              reg132 <= (7'h40);
              reg133 <= $signed((^wire124[(2'h2):(1'h0)]));
            end
        end
      reg134 <= reg129;
      reg135 <= (~$signed($unsigned({wire126, $signed(wire124)})));
    end
  assign wire136 = $unsigned($signed((~&($unsigned(wire123) || wire112))));
  module137 #() modinst165 (.wire139(wire123), .wire138(wire116), .clk(clk), .wire141(wire136), .y(wire164), .wire142(reg134), .wire140(reg133));
  assign wire166 = $signed({($unsigned($unsigned((7'h41))) ?
                           $unsigned((^reg127)) : (&(7'h43))),
                       reg128});
  assign wire167 = $unsigned({$unsigned(reg134)});
  always
    @(posedge clk) begin
      if ((&{reg131, (-wire166[(2'h2):(1'h0)])}))
        begin
          if ((~|((wire122 <= ((wire116 ? wire126 : wire119) ?
              $unsigned(reg129) : ((8'ha8) ?
                  wire136 : wire136))) <<< (wire123[(3'h6):(1'h1)] <<< ($unsigned((8'haa)) || $signed(reg128))))))
            begin
              reg168 <= ((^~((!(|wire122)) ?
                      reg131[(1'h0):(1'h0)] : $unsigned((wire111 ~^ wire112)))) ?
                  (^wire167[(4'h9):(3'h4)]) : wire125[(1'h0):(1'h0)]);
              reg169 <= ($signed($signed({$signed(wire123),
                      (wire123 ~^ wire116)})) ?
                  {$signed($signed((wire121 ? wire126 : wire125))),
                      wire113} : wire124[(2'h2):(2'h2)]);
              reg170 <= wire124[(3'h6):(3'h6)];
              reg171 <= $unsigned($unsigned(wire112));
              reg172 <= reg169[(2'h3):(1'h1)];
            end
          else
            begin
              reg168 <= (wire136 << (|$signed((8'hb0))));
              reg169 <= (((-wire114) == reg168) ?
                  (($unsigned(wire118) ?
                          $unsigned(wire119) : $unsigned($unsigned(wire126))) ?
                      {(&(~|reg134)),
                          $signed($unsigned(reg130))} : reg127[(3'h5):(3'h5)]) : $signed($signed({wire123[(4'ha):(3'h4)]})));
              reg170 <= $unsigned((-$signed((8'ha3))));
            end
          reg173 <= reg128[(1'h0):(1'h0)];
          reg174 <= $signed((~wire115));
          reg175 <= (~|$unsigned(wire113));
          reg176 <= (reg171[(1'h1):(1'h1)] < wire116[(3'h4):(2'h3)]);
        end
      else
        begin
          reg168 <= wire126[(3'h5):(1'h0)];
          reg169 <= wire123;
          if (({{{(reg172 - reg127)}},
                  $unsigned($unsigned(reg135[(2'h2):(1'h1)]))} ?
              reg132 : {reg174}))
            begin
              reg170 <= reg135;
              reg171 <= (wire111[(4'h9):(3'h5)] & reg170[(2'h2):(1'h0)]);
              reg172 <= reg133;
              reg173 <= $signed(wire112[(5'h10):(3'h6)]);
              reg174 <= (+$unsigned((8'ha0)));
            end
          else
            begin
              reg170 <= $signed((wire164 ^ (wire112 | reg168[(1'h1):(1'h0)])));
            end
          if (wire118[(1'h0):(1'h0)])
            begin
              reg175 <= ($signed(wire117[(3'h6):(2'h2)]) ?
                  ((8'haf) > $signed({(wire118 ? wire167 : (8'haf)),
                      $signed(wire166)})) : ($signed({wire125[(1'h1):(1'h1)]}) ?
                      $signed(($unsigned((8'hbb)) ?
                          (+(8'had)) : wire123)) : reg129));
              reg176 <= $signed((-reg135));
              reg177 <= (~(~|$unsigned(reg129[(3'h6):(3'h4)])));
            end
          else
            begin
              reg175 <= {($unsigned($signed(((8'ha9) || wire122))) ?
                      {wire111} : reg172[(2'h3):(2'h2)])};
            end
          reg178 <= $signed(((8'hb6) ^~ {(~&reg133), $unsigned((|reg127))}));
        end
      reg179 <= reg171;
      reg180 <= wire123[(3'h6):(3'h6)];
      reg181 <= (!reg177);
      reg182 <= reg131;
    end
  assign wire183 = ((|{reg173[(3'h5):(2'h3)],
                       {((8'ha0) >>> reg130)}}) <= ({reg175[(3'h4):(2'h3)],
                           ($signed(reg178) << {wire124})} ?
                       (($unsigned(wire167) && (&wire123)) <= $unsigned($unsigned((8'haf)))) : reg169[(3'h4):(1'h0)]));
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h1d1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire6;
  input wire [(5'h14):(1'h0)] wire7;
  input wire [(5'h14):(1'h0)] wire8;
  input wire signed [(4'ha):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire10;
  wire [(4'hd):(1'h0)] wire87;
  wire [(4'ha):(1'h0)] wire86;
  wire signed [(4'hb):(1'h0)] wire85;
  wire [(5'h11):(1'h0)] wire72;
  wire signed [(4'h8):(1'h0)] wire45;
  wire signed [(4'he):(1'h0)] wire44;
  wire signed [(5'h15):(1'h0)] wire43;
  wire signed [(3'h4):(1'h0)] wire42;
  wire signed [(5'h12):(1'h0)] wire41;
  wire [(3'h4):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire23;
  reg signed [(5'h10):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg83 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg82 = (1'h0);
  reg [(4'hd):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg78 = (1'h0);
  reg [(3'h7):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg76 = (1'h0);
  reg [(5'h10):(1'h0)] reg75 = (1'h0);
  reg signed [(4'he):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg27 = (1'h0);
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg36 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg40 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire72,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire25,
                 wire23,
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
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 (1'h0)};
  module11 #() modinst24 (wire23, clk, wire6, wire7, wire10, wire8, wire9);
  assign wire25 = wire7;
  always
    @(posedge clk) begin
      if ($unsigned($unsigned((wire8 ?
          ({wire10, (8'ha3)} ?
              (wire6 ?
                  wire23 : (8'hbf)) : {(8'hbc)}) : (wire10[(3'h6):(3'h6)] < (wire6 ^~ (8'haf)))))))
        begin
          if ($signed(wire8))
            begin
              reg26 <= (^$signed((wire6 ?
                  $unsigned(wire8[(3'h5):(1'h1)]) : ({wire25,
                      (8'hbe)} >= $unsigned(wire7)))));
              reg27 <= wire23;
              reg28 <= reg26;
              reg29 <= (wire25[(2'h2):(1'h0)] == $unsigned(({(wire8 ?
                      wire23 : reg26),
                  wire25} && (|(^wire25)))));
            end
          else
            begin
              reg26 <= (7'h44);
            end
          reg30 <= (&(wire23 ?
              (((wire23 ?
                  reg26 : wire25) * $signed(wire23)) * wire10) : (reg27 ?
                  (+(^~wire6)) : (reg26[(2'h3):(1'h1)] ?
                      {wire10} : (|wire25)))));
        end
      else
        begin
          reg26 <= (^~({($signed(wire6) < reg29[(4'hd):(1'h0)])} <= wire8[(1'h0):(1'h0)]));
          if (wire23[(4'h8):(2'h3)])
            begin
              reg27 <= wire6;
              reg28 <= wire10;
            end
          else
            begin
              reg27 <= reg30;
              reg28 <= wire25[(2'h2):(2'h2)];
              reg29 <= reg29;
              reg30 <= {reg28};
            end
          reg31 <= (8'ha4);
          reg32 <= (&($unsigned(wire10[(4'ha):(4'ha)]) ?
              $signed($unsigned(wire10[(4'hd):(2'h3)])) : (((wire8 <= reg30) >> $signed(reg28)) & (|{wire6}))));
          reg33 <= wire23[(1'h0):(1'h0)];
        end
      if ((((((wire8 >= (8'hac)) > {reg33}) && $unsigned((~|wire7))) && (reg30 < wire23[(3'h5):(1'h0)])) || $signed($unsigned(($signed((8'haf)) ?
          $unsigned((8'had)) : (!reg26))))))
        begin
          reg34 <= (($signed(((wire8 <= reg31) ?
              (|wire23) : (|reg27))) >>> (!reg31)) == {$unsigned(reg33[(2'h2):(2'h2)]),
              $signed(({reg31, reg32} && (~^reg29)))});
          reg35 <= $unsigned(wire8);
          reg36 <= (reg34 ?
              {(reg35 ?
                      ($signed(reg28) ?
                          (-wire9) : $unsigned(wire8)) : (^~wire23[(3'h4):(2'h3)])),
                  (~&reg28[(3'h6):(1'h0)])} : ({wire9[(1'h1):(1'h1)]} && reg30[(3'h7):(2'h2)]));
          if ($signed((~|$signed(((reg31 ? (8'hbe) : wire23) ?
              $unsigned(reg29) : (reg35 ? (8'ha7) : (8'ha1)))))))
            begin
              reg37 <= reg32[(3'h4):(2'h2)];
              reg38 <= ((8'ha4) ?
                  wire25 : $signed($signed($signed($signed((8'ha5))))));
              reg39 <= (($signed(reg31[(3'h6):(3'h6)]) | $unsigned($unsigned(reg28[(3'h5):(3'h4)]))) ?
                  {($unsigned((reg36 ? reg31 : reg38)) - $unsigned((~^reg30))),
                      wire6[(3'h4):(2'h3)]} : ($signed(({reg27, reg38} ?
                          $signed(reg38) : (reg29 >= reg26))) ?
                      {wire8} : $signed({$signed(reg33),
                          wire8[(3'h5):(3'h4)]})));
              reg40 <= wire10;
            end
          else
            begin
              reg37 <= {reg29[(5'h13):(4'he)],
                  $unsigned(((~^$signed(wire25)) == ($signed(wire9) ~^ (+reg26))))};
              reg38 <= reg37;
            end
        end
      else
        begin
          reg34 <= $signed((8'hba));
        end
    end
  assign wire41 = (reg39 ?
                      (reg36 ?
                          reg37[(4'hd):(4'h9)] : $unsigned(((8'ha8) ?
                              $signed(reg30) : (^wire23)))) : $unsigned($signed(wire6)));
  assign wire42 = (-reg36);
  assign wire43 = $unsigned($signed(wire25[(1'h1):(1'h1)]));
  assign wire44 = (~&(8'hb3));
  assign wire45 = $signed({$signed(reg33),
                      ($unsigned((^~wire41)) ?
                          (!(reg31 <<< wire7)) : (wire8 * (~&reg37)))});
  module46 #() modinst73 (.clk(clk), .wire48(wire41), .wire49(wire8), .y(wire72), .wire47(reg31), .wire51(wire9), .wire50(wire43));
  always
    @(posedge clk) begin
      if ($signed((!reg28)))
        begin
          if (wire41)
            begin
              reg74 <= (($signed((&(~&reg27))) & (-wire45[(1'h0):(1'h0)])) | ($signed((reg28 > (~&wire25))) ?
                  $unsigned(($unsigned(reg28) ?
                      wire7 : (~|wire45))) : ({(^~(8'ha7)), reg28} ^ reg38)));
              reg75 <= (reg27 >= ((!reg29[(4'h8):(3'h5)]) ?
                  (reg35[(1'h0):(1'h0)] ?
                      (~reg26) : $signed($unsigned(wire44))) : wire7[(2'h3):(1'h1)]));
            end
          else
            begin
              reg74 <= $signed((reg31[(4'hb):(4'ha)] >= $signed(((7'h40) ?
                  (!reg32) : wire10))));
            end
          reg76 <= (^~reg34);
          if (reg37)
            begin
              reg77 <= $unsigned(($unsigned(wire45) ?
                  $signed((8'had)) : $unsigned(($unsigned((8'hbd)) ?
                      wire9 : {reg37, (8'hb3)}))));
            end
          else
            begin
              reg77 <= (reg30 ? {$unsigned((|$signed((8'hb3))))} : wire23);
              reg78 <= wire42;
              reg79 <= (reg28 ?
                  {(reg76 ?
                          ((reg33 ? reg75 : (7'h41)) ?
                              $signed(wire45) : (&reg35)) : (^$unsigned((8'hb1)))),
                      (~{$unsigned(reg33)})} : reg31);
            end
          if ($signed($unsigned(wire6)))
            begin
              reg80 <= $signed((8'ha3));
              reg81 <= (~((reg40[(4'hd):(4'h8)] ?
                      $unsigned((reg28 ? reg26 : wire72)) : (8'ha5)) ?
                  {reg29} : reg76));
              reg82 <= (8'hbe);
              reg83 <= ((^reg30[(3'h6):(1'h0)]) ?
                  ($signed({$signed(reg34)}) ?
                      (((reg26 ? reg40 : reg32) ?
                              (wire7 == reg79) : (~|reg31)) ?
                          wire9[(3'h4):(2'h2)] : $signed(wire23[(3'h6):(1'h1)])) : wire25) : (^$signed(((~wire44) - (8'hb6)))));
            end
          else
            begin
              reg80 <= (reg35 <= reg40);
              reg81 <= ((reg39 | $signed((~$unsigned(reg38)))) || $signed((~|reg83[(1'h1):(1'h0)])));
              reg82 <= (($unsigned((~|((8'ha5) + reg28))) ?
                      (+((reg33 ? wire44 : wire45) ?
                          $unsigned(wire6) : $signed(reg27))) : $signed({$unsigned(reg32),
                          reg80})) ?
                  {(+$unsigned((~|reg76)))} : $unsigned($unsigned(reg27[(1'h1):(1'h1)])));
            end
        end
      else
        begin
          if ((reg78 ? reg83 : reg81))
            begin
              reg74 <= (wire44 ?
                  $signed(($unsigned((reg78 || reg81)) >= ((wire44 << reg28) < $unsigned((8'hb2))))) : ((($signed(reg75) ?
                      (reg82 + (8'hbe)) : $unsigned(reg30)) ~^ (reg75[(4'ha):(3'h4)] ~^ (reg28 ?
                      reg76 : reg80))) <<< ($unsigned($signed(reg82)) | reg34[(1'h1):(1'h0)])));
              reg75 <= (-$unsigned(reg74[(4'hb):(4'hb)]));
              reg76 <= reg77;
              reg77 <= $unsigned(wire6);
              reg78 <= wire6;
            end
          else
            begin
              reg74 <= (|$unsigned($signed((~|(wire72 ? reg36 : (8'ha1))))));
            end
          if ((|(reg38[(4'he):(4'h9)] ?
              {(wire43 ? $unsigned(reg26) : (|reg76)), reg79} : reg27)))
            begin
              reg79 <= (^~(+$unsigned({$unsigned(reg79), reg28})));
              reg80 <= reg39[(4'ha):(4'ha)];
              reg81 <= wire10[(1'h1):(1'h0)];
            end
          else
            begin
              reg79 <= ({($unsigned((wire10 ? reg35 : reg77)) ?
                      ($signed((8'hb2)) ~^ (reg27 <<< (8'ha1))) : reg29),
                  (((reg30 ? reg33 : wire41) || $unsigned(reg83)) ?
                      $signed(wire23) : ((^reg27) ?
                          $signed((8'ha3)) : $signed(reg80)))} << reg35);
            end
        end
      reg84 <= $unsigned(wire25[(2'h3):(2'h2)]);
    end
  assign wire85 = {$unsigned($signed(($signed(reg77) ?
                          $signed(reg80) : $unsigned(reg84))))};
  assign wire86 = $signed(wire8[(4'he):(1'h1)]);
  assign wire87 = (reg81 ?
                      reg26[(5'h10):(5'h10)] : (($unsigned(wire45) ^ reg78) >>> wire72[(3'h7):(1'h1)]));
endmodule

module module46  (y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire51;
  input wire [(4'hd):(1'h0)] wire50;
  input wire [(5'h14):(1'h0)] wire49;
  input wire signed [(5'h12):(1'h0)] wire48;
  input wire [(5'h13):(1'h0)] wire47;
  wire [(5'h12):(1'h0)] wire71;
  wire signed [(4'hc):(1'h0)] wire70;
  wire [(5'h12):(1'h0)] wire63;
  reg signed [(4'hf):(1'h0)] reg69 = (1'h0);
  reg [(3'h4):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg62 = (1'h0);
  reg [(4'hb):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(4'he):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire63,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg52 <= (((((^wire48) ?
              $signed(wire48) : (8'h9d)) > wire47[(5'h12):(4'he)]) ?
          wire47[(1'h1):(1'h0)] : ($signed($signed(wire50)) ^~ $signed($unsigned(wire51)))) >>> $unsigned({({wire47} + (wire51 >= wire51)),
          ($unsigned(wire47) ? (wire48 ^ wire48) : (~wire47))}));
      reg53 <= $signed((-$signed(($unsigned(wire47) ?
          $unsigned(wire51) : wire47))));
      if ($signed((($unsigned(reg53) & ({reg53} == $signed(wire51))) ?
          $unsigned($unsigned(((8'hbd) ? wire49 : wire47))) : wire49)))
        begin
          reg54 <= wire49;
          reg55 <= (reg53[(4'hf):(4'ha)] <<< $signed($signed((wire48[(5'h11):(3'h7)] ?
              $unsigned((7'h43)) : $unsigned(wire48)))));
          reg56 <= (reg54 ? reg54 : reg54);
          if (reg56)
            begin
              reg57 <= (8'ha6);
              reg58 <= $signed(reg53[(5'h10):(4'ha)]);
            end
          else
            begin
              reg57 <= (+($signed(($signed(reg53) ?
                  (^~reg56) : (~^reg52))) << reg52[(4'hb):(3'h4)]));
              reg58 <= $unsigned(((|(wire51 ? $signed(wire50) : reg54)) ?
                  (($signed(reg55) <= $unsigned(reg52)) >>> (reg52[(1'h0):(1'h0)] != reg52)) : $unsigned($unsigned(wire50))));
              reg59 <= (wire51[(1'h1):(1'h1)] ?
                  (!(((reg55 <<< (8'haf)) ?
                      reg52 : {(8'hb2)}) <<< $unsigned((-reg57)))) : (!{$unsigned({wire50}),
                      ($signed(wire49) ?
                          (wire47 ? reg52 : reg54) : (+reg53))}));
              reg60 <= reg55;
            end
          reg61 <= $unsigned($unsigned({wire49}));
        end
      else
        begin
          reg54 <= $signed((!$signed(($signed(reg57) + (wire50 < wire50)))));
          reg55 <= (!(|wire47));
        end
      reg62 <= $signed(reg61);
    end
  assign wire63 = reg55;
  always
    @(posedge clk) begin
      reg64 <= $signed({(reg59 ?
              $unsigned(((7'h41) == reg62)) : (reg58 ?
                  wire49 : (wire51 ? wire48 : (8'hb7)))),
          $unsigned((~&reg53[(2'h2):(2'h2)]))});
      if ((+(reg56[(1'h1):(1'h1)] ~^ $unsigned($signed((reg60 ~^ reg59))))))
        begin
          if ($signed(reg59))
            begin
              reg65 <= (-$signed(reg61));
            end
          else
            begin
              reg65 <= ($signed($signed($signed(reg65))) | (((^$unsigned(reg64)) | $signed(wire47[(1'h1):(1'h1)])) & $signed(reg58[(2'h2):(1'h1)])));
              reg66 <= wire63[(1'h0):(1'h0)];
            end
          reg67 <= ($signed(reg59[(4'h9):(2'h2)]) ?
              $signed((reg56 ?
                  ($unsigned(reg58) ?
                      (~reg66) : (!wire63)) : $signed($signed(wire50)))) : $signed(((!wire48[(1'h1):(1'h0)]) != wire63)));
        end
      else
        begin
          reg65 <= ($signed({$unsigned((reg55 ?
                  reg62 : reg59))}) || (reg54[(3'h4):(3'h4)] ?
              {(~^((8'hbe) ? reg54 : wire48)),
                  $unsigned({reg55,
                      reg58})} : $unsigned($unsigned($unsigned((8'ha8))))));
        end
      reg68 <= (~$unsigned($signed(((~(8'hb0)) ?
          {reg53, wire48} : (wire47 ? reg67 : wire49)))));
      reg69 <= (&wire50[(4'hb):(4'h8)]);
    end
  assign wire70 = ((~^($signed((reg64 ^ wire50)) >= ($signed((8'hb9)) ?
                          (reg61 <<< (8'hac)) : (~(8'hb2))))) ?
                      $unsigned($signed((reg55[(3'h7):(2'h3)] <= wire48[(4'hf):(3'h4)]))) : (($signed((reg54 ?
                                  reg62 : (8'hbc))) ?
                              $signed((7'h41)) : (reg62[(3'h5):(3'h4)] ?
                                  $unsigned(reg65) : reg66)) ?
                          $signed(reg68[(2'h3):(2'h2)]) : $signed((reg58[(2'h3):(2'h3)] != $signed((8'haa))))));
  assign wire71 = $signed((~(+(-(reg58 == reg61)))));
endmodule

module module11
#(parameter param22 = (&(~(((~|(8'hb5)) <= (^~(8'ha4))) ? (((8'hb7) << (8'had)) && {(8'hbb)}) : (((7'h44) ? (8'ha1) : (8'hbe)) ? ((8'h9f) ^~ (8'ha4)) : ((8'hac) >>> (8'hbb)))))))
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire16;
  input wire [(4'hf):(1'h0)] wire15;
  input wire signed [(5'h15):(1'h0)] wire14;
  input wire signed [(4'hd):(1'h0)] wire13;
  input wire signed [(2'h3):(1'h0)] wire12;
  wire signed [(4'h9):(1'h0)] wire21;
  wire [(4'hd):(1'h0)] wire20;
  wire signed [(5'h11):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire18;
  wire signed [(5'h14):(1'h0)] wire17;
  assign y = {wire21, wire20, wire19, wire18, wire17, (1'h0)};
  assign wire17 = ($signed($signed((&wire13))) > ($unsigned((+$unsigned(wire16))) ?
                      $signed((wire16[(4'h9):(1'h1)] && (&wire14))) : wire14[(3'h5):(3'h5)]));
  assign wire18 = wire17;
  assign wire19 = (8'haa);
  assign wire20 = wire12;
  assign wire21 = (8'hbd);
endmodule

module module137
#(parameter param163 = (((~&((~&(8'hb1)) ~^ ((8'ha0) ? (7'h40) : (8'ha2)))) >> (^(((8'ha0) ? (8'hbd) : (8'h9c)) ? (^~(8'hae)) : ((8'hb8) >>> (8'hb4))))) ? (((((7'h42) ? (7'h44) : (8'hb1)) >>> ((8'hac) ? (8'ha7) : (8'hb8))) ? (((8'ha7) << (7'h41)) ? ((8'ha3) ? (8'hb4) : (8'hbd)) : ((7'h42) ? (8'hb7) : (8'ha3))) : (((8'haa) ? (8'h9e) : (7'h40)) * {(8'hbe), (7'h42)})) ? ((8'hb9) & {((8'hb5) ? (7'h41) : (8'hb0)), (!(8'had))}) : ((((8'h9f) ^~ (8'ha8)) ? (^(7'h40)) : (!(8'ha4))) ? (((8'ha1) >>> (7'h42)) ? ((8'hb5) ? (8'haf) : (8'hb8)) : (8'hae)) : (((8'ha9) ? (7'h41) : (7'h42)) ? ((8'hab) || (8'ha1)) : ((8'ha2) >> (8'hb7))))) : ((({(8'hbe)} == (~^(7'h44))) ? {((8'hb4) + (8'haf)), (^(8'hb5))} : (~|(+(8'ha0)))) < {((~^(7'h44)) ? (|(7'h42)) : {(8'ha2), (8'h9d)})})))
(y, clk, wire142, wire141, wire140, wire139, wire138);
  output wire [(32'hf1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire142;
  input wire [(4'h9):(1'h0)] wire141;
  input wire signed [(3'h7):(1'h0)] wire140;
  input wire [(4'ha):(1'h0)] wire139;
  input wire signed [(4'hd):(1'h0)] wire138;
  wire [(5'h11):(1'h0)] wire162;
  wire [(5'h13):(1'h0)] wire161;
  wire signed [(2'h2):(1'h0)] wire160;
  wire [(4'hf):(1'h0)] wire159;
  wire [(4'hf):(1'h0)] wire150;
  wire signed [(3'h6):(1'h0)] wire149;
  wire [(5'h15):(1'h0)] wire148;
  wire [(5'h15):(1'h0)] wire147;
  wire signed [(4'hb):(1'h0)] wire146;
  wire signed [(4'hf):(1'h0)] wire145;
  wire [(5'h10):(1'h0)] wire144;
  wire signed [(3'h4):(1'h0)] wire143;
  reg [(5'h13):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg157 = (1'h0);
  reg [(4'hc):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg155 = (1'h0);
  reg [(3'h6):(1'h0)] reg154 = (1'h0);
  reg [(3'h6):(1'h0)] reg153 = (1'h0);
  reg [(4'hb):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg151 = (1'h0);
  assign y = {wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 (1'h0)};
  assign wire143 = $unsigned(((wire140 != (wire139 ?
                       $unsigned(wire142) : wire141)) ^ $unsigned((8'haa))));
  assign wire144 = {$unsigned(($signed(wire143[(3'h4):(1'h0)]) ?
                           ((wire140 >> wire141) ?
                               wire140[(1'h0):(1'h0)] : (wire138 ?
                                   wire142 : wire141)) : ((|wire139) - wire139)))};
  assign wire145 = $unsigned(wire143[(1'h1):(1'h1)]);
  assign wire146 = $signed($signed(wire144));
  assign wire147 = ((((8'hbf) && ((wire140 ? wire146 : wire145) + (wire144 ?
                           wire142 : wire141))) ?
                       ($signed((~|(7'h40))) >> wire142[(4'hb):(3'h4)]) : wire145) << ($signed((wire140[(3'h4):(2'h3)] ?
                           (wire144 <= (8'hbb)) : (wire141 ?
                               wire139 : wire142))) ?
                       (wire140[(1'h1):(1'h0)] ?
                           {{(8'ha6), wire140},
                               wire141[(3'h6):(3'h5)]} : $signed((wire138 && wire144))) : (8'ha7)));
  assign wire148 = wire147[(5'h14):(3'h4)];
  assign wire149 = (+(~|(~^((wire145 ?
                       wire145 : wire148) == $signed(wire145)))));
  assign wire150 = (wire148[(3'h4):(1'h1)] << (wire139[(4'h8):(3'h4)] > wire146));
  always
    @(posedge clk) begin
      if ($unsigned($unsigned((wire144[(3'h5):(2'h3)] > {$signed(wire147)}))))
        begin
          reg151 <= $signed((wire141 ?
              $signed($signed((|wire146))) : wire150[(4'hf):(4'h9)]));
        end
      else
        begin
          reg151 <= $signed(((^$unsigned($unsigned(wire139))) << reg151[(3'h5):(1'h0)]));
          if (((-wire147[(4'hf):(4'hf)]) ?
              (^(~^(|{wire139, wire149}))) : $signed(wire142[(4'hc):(4'h9)])))
            begin
              reg152 <= reg151[(3'h4):(1'h0)];
              reg153 <= (+$signed(reg152));
              reg154 <= (wire143[(2'h2):(2'h2)] & $unsigned($signed((&$unsigned((8'hac))))));
              reg155 <= $unsigned($unsigned(({$unsigned(wire150)} ?
                  $unsigned(((7'h41) ?
                      wire145 : wire142)) : $signed($signed(reg151)))));
              reg156 <= {(wire143[(2'h3):(1'h0)] ?
                      wire145[(2'h3):(1'h0)] : (~|$unsigned((^~wire149))))};
            end
          else
            begin
              reg152 <= $signed(($signed(wire149) + wire139));
              reg153 <= $unsigned(wire149[(2'h2):(1'h1)]);
              reg154 <= (8'hbd);
              reg155 <= (~^((({(8'ha0)} ?
                  $signed(wire146) : ((7'h40) ?
                      wire148 : wire141)) <= wire141[(4'h9):(3'h7)]) | {{wire138}}));
              reg156 <= (($unsigned($signed((^reg155))) ~^ $unsigned(wire145)) ?
                  (((wire142 ^~ wire145[(4'hb):(2'h2)]) == ((!(8'hb1)) ?
                      (wire145 ? reg152 : reg156) : (wire144 ?
                          reg156 : wire138))) | (^((^~reg154) ?
                      $unsigned(wire138) : {wire145}))) : wire147[(1'h1):(1'h1)]);
            end
        end
      reg157 <= $unsigned({({reg154,
              (wire145 >> wire146)} != $signed((8'haf)))});
      reg158 <= ($signed((((reg156 ? reg154 : wire144) ?
              (wire142 << wire150) : (~&wire147)) <<< {(reg153 ?
                  wire150 : wire149),
              (-wire140)})) ?
          (~reg154[(1'h1):(1'h0)]) : $signed(($unsigned(wire150) ?
              $signed((wire146 | wire140)) : {$signed(reg152)})));
    end
  assign wire159 = reg151[(3'h4):(3'h4)];
  assign wire160 = $unsigned($signed(reg154));
  assign wire161 = ($unsigned((~&$unsigned(wire146[(4'ha):(4'ha)]))) ?
                       reg153 : $signed($signed(wire142[(1'h1):(1'h1)])));
  assign wire162 = (&((8'hbc) >>> $unsigned(((-reg157) ?
                       wire144 : (wire140 ? reg157 : reg154)))));
endmodule
