module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire4;
  wire signed [(2'h2):(1'h0)] wire177;
  wire signed [(4'hd):(1'h0)] wire176;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire17;
  wire [(3'h5):(1'h0)] wire171;
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(2'h2):(1'h0)] reg8 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg173 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg174 = (1'h0);
  reg signed [(4'he):(1'h0)] reg175 = (1'h0);
  assign y = {wire177,
                 wire176,
                 wire5,
                 wire6,
                 wire17,
                 wire171,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg173,
                 reg174,
                 reg175,
                 (1'h0)};
  assign wire5 = $signed($signed(wire2));
  assign wire6 = wire5[(4'ha):(3'h7)];
  always
    @(posedge clk) begin
      reg7 <= wire2;
      reg8 <= (^$signed(((~|$signed(wire5)) ?
          $signed((&wire5)) : $unsigned($signed(wire5)))));
      reg9 <= wire3[(4'h8):(2'h2)];
      if (({$signed(wire2[(4'h9):(1'h1)]),
          ((-(~&reg8)) + {reg9[(1'h0):(1'h0)]})} != $signed((-reg9[(1'h0):(1'h0)]))))
        begin
          reg10 <= (!wire6[(4'ha):(4'h8)]);
          if (reg10)
            begin
              reg11 <= {$signed(wire2), $unsigned((8'h9f))};
              reg12 <= wire2[(4'he):(3'h4)];
              reg13 <= reg9[(3'h4):(2'h3)];
            end
          else
            begin
              reg11 <= (^~reg12[(3'h5):(3'h4)]);
              reg12 <= $unsigned((wire4 ?
                  (^~({reg11, wire5} << (~|(8'hba)))) : wire1[(2'h3):(2'h2)]));
              reg13 <= wire3;
            end
          if (wire1)
            begin
              reg14 <= wire4[(3'h5):(1'h0)];
              reg15 <= $signed($unsigned((wire5 ?
                  $signed((reg11 >= reg9)) : (+((8'ha2) & reg14)))));
              reg16 <= ((^(^~(~&(wire0 - reg12)))) == (($signed(((8'hac) ?
                  wire3 : wire3)) < {wire2[(4'hb):(4'h9)]}) + (reg11[(4'h9):(2'h2)] >> $unsigned((reg10 ^~ (7'h40))))));
            end
          else
            begin
              reg14 <= reg12;
              reg15 <= ($signed($unsigned($signed((~|reg12)))) <<< ($signed(((wire3 && (8'hb4)) ?
                  (reg14 > wire5) : (wire5 && (8'h9e)))) >= (wire1[(4'ha):(2'h2)] ^~ $unsigned($signed(wire1)))));
            end
        end
      else
        begin
          reg10 <= $signed($unsigned(wire0[(2'h3):(1'h1)]));
          reg11 <= reg8[(2'h2):(1'h0)];
        end
    end
  assign wire17 = wire2;
  module18 #() modinst172 (.wire22(reg11), .wire21(reg10), .y(wire171), .wire23(reg14), .wire20(reg16), .clk(clk), .wire19(wire4));
  always
    @(posedge clk) begin
      reg173 <= reg12;
      reg174 <= wire17;
      reg175 <= {$signed(reg12)};
    end
  assign wire176 = wire171;
  module52 #() modinst178 (.clk(clk), .wire57(wire4), .wire55(wire6), .wire56(reg12), .wire53(wire5), .wire54(wire17), .y(wire177));
endmodule

module module18
#(parameter param170 = (~&(&(^((|(8'ha3)) ? ((8'hbf) ? (8'h9c) : (8'hb9)) : ((8'h9f) >> (8'haa)))))))
(y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h159):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire23;
  input wire signed [(4'hb):(1'h0)] wire22;
  input wire [(4'hf):(1'h0)] wire21;
  input wire signed [(4'hc):(1'h0)] wire20;
  input wire signed [(3'h6):(1'h0)] wire19;
  wire signed [(5'h12):(1'h0)] wire168;
  wire signed [(4'hf):(1'h0)] wire105;
  wire [(4'hb):(1'h0)] wire93;
  wire signed [(5'h13):(1'h0)] wire41;
  wire signed [(3'h5):(1'h0)] wire25;
  wire signed [(5'h13):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire44;
  wire signed [(4'he):(1'h0)] wire45;
  wire [(5'h11):(1'h0)] wire46;
  wire signed [(4'hd):(1'h0)] wire47;
  wire [(4'h9):(1'h0)] wire48;
  wire [(4'ha):(1'h0)] wire49;
  wire [(4'he):(1'h0)] wire50;
  wire signed [(4'hd):(1'h0)] wire51;
  wire signed [(2'h3):(1'h0)] wire91;
  wire signed [(4'he):(1'h0)] wire107;
  wire [(4'h9):(1'h0)] wire156;
  reg [(4'h8):(1'h0)] reg169 = (1'h0);
  reg [(5'h15):(1'h0)] reg167 = (1'h0);
  reg [(3'h5):(1'h0)] reg166 = (1'h0);
  reg [(4'hb):(1'h0)] reg165 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg164 = (1'h0);
  reg [(4'hc):(1'h0)] reg163 = (1'h0);
  reg [(5'h10):(1'h0)] reg162 = (1'h0);
  reg [(3'h5):(1'h0)] reg161 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg160 = (1'h0);
  reg [(3'h4):(1'h0)] reg159 = (1'h0);
  reg [(4'h8):(1'h0)] reg158 = (1'h0);
  assign y = {wire168,
                 wire105,
                 wire93,
                 wire41,
                 wire25,
                 wire24,
                 wire43,
                 wire44,
                 wire45,
                 wire46,
                 wire47,
                 wire48,
                 wire49,
                 wire50,
                 wire51,
                 wire91,
                 wire107,
                 wire156,
                 reg169,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 (1'h0)};
  assign wire24 = (-$unsigned((+((wire23 ~^ wire23) ?
                      (wire22 == wire21) : (wire20 ? (8'ha3) : wire23)))));
  assign wire25 = ((wire20 ?
                      $signed($unsigned((wire22 || (8'ha5)))) : wire23) >>> (+(~&(^~(wire23 > wire24)))));
  module26 #() modinst42 (wire41, clk, wire21, wire23, wire25, wire19, wire22);
  assign wire43 = (~&$unsigned((({wire22, wire20} ?
                      wire25[(2'h3):(2'h2)] : (~^wire25)) > wire19[(3'h5):(1'h0)])));
  assign wire44 = wire21[(3'h5):(1'h0)];
  assign wire45 = wire24;
  assign wire46 = wire43[(4'hd):(4'hd)];
  assign wire47 = ($signed(wire25) ?
                      wire43[(4'h9):(3'h5)] : ((($unsigned((7'h44)) == wire22) ?
                              {{(8'hac)}} : $unsigned(wire20[(4'ha):(3'h6)])) ?
                          wire23[(4'ha):(1'h1)] : ({wire25[(3'h5):(3'h4)]} ?
                              wire45[(2'h3):(2'h2)] : wire25)));
  assign wire48 = wire46;
  assign wire49 = ((~&({(-wire24), (8'ha2)} ?
                          (((8'hbf) ? wire41 : wire20) ?
                              wire20[(1'h0):(1'h0)] : wire45[(3'h6):(3'h5)]) : ((+wire41) | $signed(wire45)))) ?
                      {$signed((8'ha9))} : (~{$unsigned(wire19[(3'h6):(3'h4)])}));
  assign wire50 = (wire23 || wire46[(3'h5):(2'h2)]);
  assign wire51 = ({(wire24[(3'h5):(3'h5)] ?
                          $unsigned($unsigned((8'ha1))) : (wire44 >> wire46[(3'h5):(2'h2)]))} >= wire24[(3'h4):(3'h4)]);
  module52 #() modinst92 (wire91, clk, wire23, wire20, wire41, wire47, wire19);
  assign wire93 = ((~|(^wire41)) ? wire25[(3'h4):(2'h2)] : wire47);
  module94 #() modinst106 (.wire98(wire45), .wire97(wire51), .wire95(wire50), .wire99(wire19), .wire96(wire24), .y(wire105), .clk(clk));
  assign wire107 = (wire47[(3'h5):(1'h0)] ? wire105[(3'h5):(3'h4)] : wire49);
  module108 #() modinst157 (.wire109(wire47), .wire113(wire41), .wire112(wire46), .wire110(wire93), .clk(clk), .wire111(wire44), .y(wire156));
  always
    @(posedge clk) begin
      if ($signed({wire91[(2'h3):(1'h0)]}))
        begin
          reg158 <= (8'hbd);
          reg159 <= wire93[(2'h3):(1'h1)];
        end
      else
        begin
          if ((8'ha5))
            begin
              reg158 <= $unsigned({wire43[(4'h9):(4'h9)]});
              reg159 <= $signed(reg159);
            end
          else
            begin
              reg158 <= wire46;
              reg159 <= (8'hab);
              reg160 <= $signed((~&wire44));
            end
          if ((^~wire22))
            begin
              reg161 <= {reg159};
              reg162 <= reg161[(2'h3):(2'h3)];
            end
          else
            begin
              reg161 <= $unsigned(({(wire45 & wire22), $unsigned(reg158)} ?
                  wire156 : reg159));
              reg162 <= (((~&(~|(reg162 <<< wire43))) ^~ wire45) ?
                  wire44 : reg159);
              reg163 <= (~^(~(((wire93 & reg162) ^~ wire46) ?
                  (~(^~wire93)) : $unsigned(wire41[(4'hf):(4'h8)]))));
              reg164 <= wire51;
              reg165 <= (&(&wire23[(3'h4):(2'h3)]));
            end
        end
      reg166 <= $signed($unsigned(($unsigned((wire43 ~^ wire107)) <<< (~$unsigned(wire49)))));
      reg167 <= $signed($signed($signed($signed((~|wire51)))));
    end
  assign wire168 = (($unsigned(wire23[(3'h6):(3'h5)]) ?
                           (({reg159, wire19} ?
                               wire50[(3'h5):(1'h1)] : wire47) << {$signed((8'hb9))}) : {{{wire23},
                                   $unsigned(wire107)},
                               $unsigned($unsigned(reg165))}) ?
                       ($unsigned({wire41[(4'hc):(3'h5)]}) ?
                           (wire41 << ((wire19 ?
                               (7'h43) : wire21) & (wire20 <= reg162))) : $signed(wire23)) : $unsigned((((wire91 ?
                               reg162 : reg162) + wire107[(3'h5):(2'h3)]) ?
                           ({wire19, (8'hb7)} ?
                               (|reg162) : $signed(wire44)) : wire46)));
  always
    @(posedge clk) begin
      reg169 <= reg167;
    end
endmodule

module module108
#(parameter param155 = (((8'hac) ? {(8'hb0), (((8'ha5) ^~ (7'h43)) ? ((8'hb8) ? (8'hb0) : (8'hbc)) : ((8'hb0) ? (8'ha3) : (8'hb7)))} : {((~(8'h9e)) ? (~(8'hb7)) : {(7'h44)})}) <<< (!{(((8'hb3) <= (8'ha3)) >> ((8'hb0) ? (7'h40) : (7'h42)))})))
(y, clk, wire113, wire112, wire111, wire110, wire109);
  output wire [(32'h1e3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire113;
  input wire signed [(5'h11):(1'h0)] wire112;
  input wire signed [(5'h14):(1'h0)] wire111;
  input wire [(3'h4):(1'h0)] wire110;
  input wire signed [(4'hd):(1'h0)] wire109;
  wire signed [(3'h5):(1'h0)] wire154;
  wire [(4'ha):(1'h0)] wire150;
  wire [(5'h14):(1'h0)] wire149;
  wire signed [(5'h13):(1'h0)] wire148;
  wire signed [(4'he):(1'h0)] wire125;
  wire [(2'h3):(1'h0)] wire124;
  wire signed [(3'h5):(1'h0)] wire123;
  wire [(4'h9):(1'h0)] wire119;
  wire signed [(5'h15):(1'h0)] wire118;
  wire signed [(4'he):(1'h0)] wire117;
  wire [(3'h4):(1'h0)] wire116;
  wire [(2'h2):(1'h0)] wire115;
  wire [(3'h4):(1'h0)] wire114;
  reg [(3'h4):(1'h0)] reg153 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg152 = (1'h0);
  reg [(5'h15):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg147 = (1'h0);
  reg [(2'h3):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg144 = (1'h0);
  reg [(2'h2):(1'h0)] reg143 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg141 = (1'h0);
  reg [(2'h3):(1'h0)] reg140 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg139 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg138 = (1'h0);
  reg [(3'h5):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg136 = (1'h0);
  reg [(5'h12):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg134 = (1'h0);
  reg [(5'h12):(1'h0)] reg133 = (1'h0);
  reg [(5'h15):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg130 = (1'h0);
  reg [(5'h14):(1'h0)] reg129 = (1'h0);
  reg [(5'h12):(1'h0)] reg128 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg127 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg126 = (1'h0);
  reg [(2'h2):(1'h0)] reg122 = (1'h0);
  reg [(5'h13):(1'h0)] reg121 = (1'h0);
  reg [(5'h12):(1'h0)] reg120 = (1'h0);
  assign y = {wire154,
                 wire150,
                 wire149,
                 wire148,
                 wire125,
                 wire124,
                 wire123,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 reg153,
                 reg152,
                 reg151,
                 reg147,
                 reg146,
                 reg145,
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
                 reg122,
                 reg121,
                 reg120,
                 (1'h0)};
  assign wire114 = $signed($unsigned($unsigned({{wire112}})));
  assign wire115 = ($unsigned($signed((8'ha4))) > (wire114 ?
                       (-wire110[(1'h1):(1'h1)]) : (~$signed((-wire111)))));
  assign wire116 = $unsigned(wire115[(2'h2):(1'h0)]);
  assign wire117 = $signed($signed(wire111[(5'h14):(1'h0)]));
  assign wire118 = $unsigned(wire112[(4'hb):(1'h1)]);
  assign wire119 = wire112[(4'h9):(3'h4)];
  always
    @(posedge clk) begin
      reg120 <= (^~(|($unsigned($unsigned(wire110)) ?
          (8'hb1) : (^~wire114[(2'h3):(1'h0)]))));
      reg121 <= $signed({{wire114}});
      reg122 <= wire116;
    end
  assign wire123 = (({wire109, wire115} - (((wire112 ?
                           (8'h9c) : reg120) * $unsigned(reg122)) ^~ (-(reg122 ?
                           wire118 : wire116)))) ?
                       reg122 : $unsigned(($signed($unsigned(reg121)) ?
                           (wire116[(2'h3):(2'h3)] ?
                               (~^wire113) : $signed(wire113)) : ((wire119 >= (8'hb9)) ~^ (8'hb5)))));
  assign wire124 = ((^~(($signed(wire109) && (reg122 ?
                       reg121 : reg120)) != $signed($unsigned(reg120)))) & wire118);
  assign wire125 = $unsigned(((({reg120} ?
                           (wire112 >> wire115) : $unsigned(reg120)) || wire111) ?
                       wire124 : {((reg120 >= wire124) ?
                               (wire111 ? wire112 : (8'hbf)) : wire114),
                           (wire123[(1'h0):(1'h0)] ?
                               reg122 : (wire116 << wire111))}));
  always
    @(posedge clk) begin
      if (wire110)
        begin
          reg126 <= (~^wire109);
          reg127 <= reg121;
          reg128 <= (&{$unsigned($signed($signed(reg120))),
              wire123[(1'h1):(1'h1)]});
        end
      else
        begin
          reg126 <= wire116[(2'h2):(1'h0)];
          reg127 <= ($unsigned(reg128[(3'h5):(3'h5)]) >= $signed($unsigned(reg128)));
          reg128 <= (wire113 >= ((+reg127[(3'h7):(1'h0)]) ?
              wire119 : (|$signed($signed(wire125)))));
        end
      reg129 <= (wire119 ?
          reg126[(3'h5):(3'h5)] : ({{$signed(reg126)},
                  ($unsigned(wire110) == (wire125 || (8'ha9)))} ?
              ($unsigned((~wire113)) ?
                  $signed((wire124 != reg126)) : (~(~&wire110))) : {((|wire123) ?
                      reg121[(4'hd):(4'h9)] : wire124)}));
      if (((~|$signed($signed(reg128[(3'h6):(2'h3)]))) ?
          $signed((reg126 ?
              wire119[(2'h3):(2'h3)] : $unsigned((reg127 ?
                  wire119 : reg121)))) : wire116[(1'h1):(1'h0)]))
        begin
          reg130 <= wire124;
          reg131 <= wire112[(4'h8):(2'h2)];
          if ($signed(wire116))
            begin
              reg132 <= (8'ha8);
              reg133 <= ((~^$signed($unsigned(reg126))) ?
                  {{{(reg127 < (8'ha1)), (wire125 ~^ reg128)},
                          ($unsigned(reg129) - $signed(wire125))}} : $unsigned((7'h41)));
            end
          else
            begin
              reg132 <= ((reg126 << (&((~^wire110) >= (wire124 ^~ wire112)))) > $signed((8'hb1)));
              reg133 <= reg126;
              reg134 <= ((reg126 <<< ($signed(((8'hab) ?
                  wire123 : wire114)) >= wire119)) ~^ (reg120[(4'h8):(2'h2)] ^~ (wire116[(2'h2):(2'h2)] & reg121)));
              reg135 <= (((~|$unsigned($signed(wire119))) < wire109) ?
                  ($unsigned({wire111, (8'hbd)}) ?
                      {($signed(reg130) ?
                              wire119 : {wire116})} : (^~((wire125 - reg122) >> wire117[(4'hb):(3'h6)]))) : $unsigned((reg132 ?
                      ((reg122 ? reg133 : wire110) ?
                          reg131[(1'h1):(1'h1)] : (!wire111)) : ((wire124 ?
                              wire117 : reg126) ?
                          (wire116 ? reg132 : reg130) : reg134))));
              reg136 <= $unsigned($unsigned($unsigned((|(reg134 ?
                  reg126 : (8'h9f))))));
            end
          reg137 <= ($signed(reg122[(1'h0):(1'h0)]) <<< wire119[(2'h2):(1'h1)]);
        end
      else
        begin
          reg130 <= $unsigned($unsigned((^~$unsigned((wire117 ?
              wire115 : (8'ha4))))));
          reg131 <= reg128;
          if (reg127)
            begin
              reg132 <= (reg128 < reg127);
              reg133 <= $unsigned($signed($unsigned({(wire124 || (8'ha4)),
                  reg127[(4'h8):(3'h4)]})));
              reg134 <= reg132[(4'h9):(1'h1)];
              reg135 <= (~|$unsigned(wire112));
            end
          else
            begin
              reg132 <= wire114[(2'h3):(1'h0)];
            end
        end
      if (reg131[(3'h6):(1'h0)])
        begin
          reg138 <= wire118;
          if ((^~reg128))
            begin
              reg139 <= $unsigned(reg129[(4'hc):(3'h4)]);
              reg140 <= reg130[(1'h0):(1'h0)];
            end
          else
            begin
              reg139 <= {$signed($signed($signed((wire116 ?
                      wire117 : reg140)))),
                  (~|$signed($signed((wire110 <<< reg121))))};
              reg140 <= $unsigned((reg121 ^~ reg136[(1'h0):(1'h0)]));
              reg141 <= (wire115 ^ ((~((~^wire118) >> wire114[(3'h4):(1'h0)])) ?
                  (!$unsigned($unsigned(reg137))) : $unsigned({((8'hbf) ?
                          wire110 : reg138),
                      (wire115 == (8'hb5))})));
              reg142 <= $signed((~(wire118 - $signed(reg128))));
              reg143 <= $signed($unsigned(reg136[(3'h4):(2'h3)]));
            end
          if (reg122[(2'h2):(2'h2)])
            begin
              reg144 <= ($unsigned((8'hb3)) ?
                  (~(~($signed(wire114) * (8'ha7)))) : ({((^~reg143) + $unsigned(reg141))} >>> reg130));
              reg145 <= wire112;
              reg146 <= $unsigned((&(&$unsigned(reg122))));
              reg147 <= ($unsigned($signed($signed(reg145))) ?
                  {(reg137[(1'h0):(1'h0)] ?
                          {(reg136 ? wire123 : wire124),
                              wire119[(1'h1):(1'h1)]} : (wire118 != $unsigned(wire112)))} : $signed((reg121[(4'hb):(3'h5)] || ($unsigned(wire119) ?
                      ((7'h44) ~^ (8'h9d)) : $unsigned(reg142)))));
            end
          else
            begin
              reg144 <= (reg131 ?
                  $signed((reg139[(1'h0):(1'h0)] ?
                      {((8'ha7) > (8'hb9))} : reg143[(1'h1):(1'h0)])) : (($signed(reg120) ?
                      $unsigned(reg132) : {$signed((7'h43)),
                          (reg145 ? reg140 : reg122)}) << reg134));
            end
        end
      else
        begin
          reg138 <= $signed({$signed(wire123[(2'h3):(2'h2)]),
              {reg135, ($unsigned(wire124) <= (~|(8'h9d)))}});
        end
    end
  assign wire148 = (({(reg132[(4'hd):(4'hd)] & wire115[(1'h1):(1'h0)]),
                       $unsigned($unsigned((8'hba)))} > ($signed($signed(reg126)) & (&{reg126,
                       reg121}))) ~^ (reg146[(1'h1):(1'h0)] ?
                       $signed({(reg120 ?
                               reg147 : wire124)}) : (~&(wire117[(4'hd):(1'h1)] <<< (wire117 & reg145)))));
  assign wire149 = {$signed((^$signed(reg146[(2'h3):(1'h0)])))};
  assign wire150 = ((reg139[(2'h2):(1'h1)] <<< $unsigned($signed(wire148))) * (wire119[(3'h7):(1'h0)] >= (wire113 == reg131[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg151 <= {wire123[(1'h1):(1'h1)]};
      reg152 <= (~|$unsigned(({((8'ha6) ? reg136 : reg136)} ?
          $unsigned((~|reg120)) : {(wire113 ? wire149 : reg120),
              $signed(reg133)})));
      reg153 <= reg141[(1'h1):(1'h1)];
    end
  assign wire154 = wire124[(1'h0):(1'h0)];
endmodule

module module94
#(parameter param104 = (((+(((8'hae) ? (8'ha2) : (8'had)) ? ((8'h9c) >>> (8'hb4)) : (~|(8'hb5)))) ? {(((8'hab) - (8'hbf)) ~^ ((7'h40) ? (8'hbd) : (7'h41))), ((8'hba) > ((8'ha6) + (8'hb6)))} : (({(8'ha5), (8'haa)} ? (~(8'hbd)) : (&(8'hbf))) <<< (((8'ha5) >>> (8'haf)) ? ((8'h9c) ? (8'hb0) : (8'h9c)) : ((8'hab) ^ (8'ha1))))) ? (8'ha8) : ((((~^(8'ha9)) ? ((8'haf) ? (8'ha6) : (7'h43)) : ((8'hb7) * (8'ha8))) ? (((7'h43) * (8'hb6)) ? ((7'h42) ? (8'ha6) : (8'ha5)) : ((8'hbf) ? (8'hbe) : (8'ha2))) : (((7'h43) ? (8'hb8) : (8'ha4)) ? ((8'ha5) >> (8'ha1)) : ((8'hb4) ? (8'ha9) : (8'hb1)))) ? (((+(8'hb7)) ? (8'h9f) : (^(7'h44))) ? (((8'had) ? (8'ha2) : (8'ha8)) ? ((8'hab) < (8'hb5)) : ((8'hb9) >>> (8'ha2))) : (((8'ha9) ? (8'haa) : (8'hb4)) || ((8'ha5) ? (8'hbb) : (8'hbc)))) : {({(7'h42), (8'h9d)} ? ((8'haf) ? (7'h40) : (8'hbe)) : ((8'hba) | (8'h9f))), {((8'hbc) << (8'h9f))}})))
(y, clk, wire99, wire98, wire97, wire96, wire95);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire99;
  input wire [(3'h4):(1'h0)] wire98;
  input wire signed [(4'h8):(1'h0)] wire97;
  input wire [(5'h13):(1'h0)] wire96;
  input wire signed [(3'h4):(1'h0)] wire95;
  wire [(5'h10):(1'h0)] wire103;
  wire signed [(5'h13):(1'h0)] wire102;
  wire [(5'h14):(1'h0)] wire101;
  wire [(5'h14):(1'h0)] wire100;
  assign y = {wire103, wire102, wire101, wire100, (1'h0)};
  assign wire100 = (~&((~$signed($signed((8'ha4)))) ?
                       ($unsigned(wire98[(3'h4):(2'h3)]) ?
                           $unsigned((wire99 ?
                               wire96 : wire97)) : ((!wire98) ^ wire98[(3'h4):(2'h3)])) : {{$unsigned(wire99)}}));
  assign wire101 = (8'ha4);
  assign wire102 = $unsigned(wire97[(2'h3):(1'h1)]);
  assign wire103 = (+(8'hb7));
endmodule

module module52
#(parameter param89 = {(|((((8'ha7) ? (8'ha1) : (8'haf)) ? (^~(8'hbd)) : (^(8'hb9))) <<< {(|(8'hb8))}))}, 
parameter param90 = param89)
(y, clk, wire57, wire56, wire55, wire54, wire53);
  output wire [(32'h162):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire57;
  input wire signed [(2'h2):(1'h0)] wire56;
  input wire [(5'h12):(1'h0)] wire55;
  input wire [(3'h7):(1'h0)] wire54;
  input wire [(3'h4):(1'h0)] wire53;
  wire signed [(4'h8):(1'h0)] wire84;
  wire signed [(5'h14):(1'h0)] wire83;
  wire [(5'h14):(1'h0)] wire82;
  wire signed [(4'ha):(1'h0)] wire81;
  wire [(5'h10):(1'h0)] wire80;
  wire [(4'hf):(1'h0)] wire66;
  reg [(2'h2):(1'h0)] reg88 = (1'h0);
  reg [(5'h10):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg86 = (1'h0);
  reg [(2'h3):(1'h0)] reg85 = (1'h0);
  reg [(4'hb):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg78 = (1'h0);
  reg [(3'h4):(1'h0)] reg77 = (1'h0);
  reg [(4'hb):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg74 = (1'h0);
  reg [(5'h11):(1'h0)] reg73 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg71 = (1'h0);
  reg [(5'h14):(1'h0)] reg70 = (1'h0);
  reg [(5'h10):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg68 = (1'h0);
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg59 = (1'h0);
  reg [(4'h9):(1'h0)] reg58 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire66,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
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
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned(((($signed(wire55) <<< (wire54 ? wire56 : (8'hb8))) ?
              (~&wire54) : {wire55, (-(8'hab))}) ?
          $unsigned((wire54 ? (wire54 - wire56) : (8'ha0))) : wire57)))
        begin
          reg58 <= ((wire57[(4'hc):(4'hb)] || (+(^~(wire55 ?
                  wire54 : wire54)))) ?
              wire57 : $unsigned(wire54[(3'h6):(2'h3)]));
          reg59 <= $unsigned(reg58[(3'h6):(3'h6)]);
          if ((($signed(((wire53 ^ wire56) ?
              ((8'hb7) != wire53) : $signed(wire57))) && reg59) > $unsigned($signed(((~|reg59) <= (wire54 >= (8'hb0)))))))
            begin
              reg60 <= {$unsigned((((&wire56) ? reg59 : (^~wire55)) ?
                      (|(wire55 <<< wire55)) : reg58[(4'h8):(3'h7)]))};
              reg61 <= ((^((|(8'ha1)) & ($unsigned(reg58) ?
                      reg60 : $unsigned(reg58)))) ?
                  ((^(((8'hae) ? wire55 : reg58) >= (reg58 <<< (8'h9f)))) ?
                      ($signed($unsigned(wire57)) && wire56[(2'h2):(2'h2)]) : (wire55[(3'h4):(2'h2)] ?
                          ((wire55 ? wire55 : (8'hbd)) ?
                              $unsigned(reg59) : ((8'hbc) | reg58)) : $unsigned(reg60))) : $unsigned(reg60[(2'h3):(2'h3)]));
              reg62 <= wire53[(3'h4):(1'h1)];
              reg63 <= $unsigned(wire57);
              reg64 <= $unsigned(($signed(((wire54 && reg58) ?
                  (8'h9d) : {wire56, wire54})) | {$unsigned($signed((8'hb6))),
                  $signed($signed(reg59))}));
            end
          else
            begin
              reg60 <= {$unsigned($signed(reg61))};
              reg61 <= $signed(reg59[(3'h5):(1'h1)]);
              reg62 <= $signed(($unsigned((7'h40)) <<< $unsigned((^reg59[(1'h0):(1'h0)]))));
            end
          reg65 <= (wire55 ?
              ({$unsigned((~^(8'ha5))),
                  ($unsigned(reg59) ?
                      (&wire57) : reg59)} * (~&(&reg59))) : $unsigned(wire56[(1'h0):(1'h0)]));
        end
      else
        begin
          reg58 <= $unsigned(reg58[(1'h1):(1'h0)]);
          reg59 <= (wire57[(1'h1):(1'h0)] <<< $unsigned($signed({$unsigned(reg65)})));
          reg60 <= (+(~(8'h9d)));
          reg61 <= {wire55[(4'h9):(2'h2)],
              $signed(({reg62[(3'h7):(2'h2)]} ?
                  ((!reg60) >>> reg61[(1'h0):(1'h0)]) : reg60[(4'h8):(3'h4)]))};
        end
    end
  assign wire66 = (8'hb2);
  always
    @(posedge clk) begin
      reg67 <= reg65;
      if (($unsigned($signed({(reg67 ? wire66 : reg64)})) ?
          ($unsigned((~&(~(8'ha8)))) - (reg65 & $signed((8'hb2)))) : $signed(reg67)))
        begin
          if (wire54)
            begin
              reg68 <= reg62;
              reg69 <= ({$unsigned(($signed(reg63) ? (^wire54) : (!reg64))),
                      {wire57[(4'ha):(4'h9)], $signed((-wire66))}} ?
                  $signed({($unsigned(reg62) ?
                          (reg68 ? reg64 : reg61) : (wire66 ?
                              reg63 : wire53))}) : (-reg63));
              reg70 <= (~(~^wire56));
              reg71 <= ($unsigned(wire53[(2'h3):(2'h3)]) ?
                  reg60[(1'h1):(1'h0)] : $signed(($unsigned((reg64 << wire55)) ?
                      $unsigned((~(8'ha0))) : wire53[(1'h1):(1'h0)])));
            end
          else
            begin
              reg68 <= ($signed({((|reg67) ?
                          reg68[(3'h5):(1'h1)] : reg61[(2'h2):(1'h0)])}) ?
                  ((~(wire54[(3'h5):(3'h4)] ? reg63 : (reg59 >>> reg62))) ?
                      ($signed($unsigned(wire56)) ?
                          wire66[(4'ha):(1'h0)] : (8'hb5)) : reg60[(3'h6):(1'h1)]) : (^~(wire55 ^~ reg65)));
              reg69 <= wire54;
              reg70 <= ($signed($unsigned($signed($signed(reg68)))) ?
                  wire56[(1'h1):(1'h1)] : reg65[(4'h9):(1'h0)]);
              reg71 <= wire56[(2'h2):(1'h0)];
            end
          reg72 <= $signed(reg69);
          if (($unsigned(wire56) >> reg58))
            begin
              reg73 <= ({(!$unsigned(reg62[(1'h0):(1'h0)])),
                      (($signed(wire55) > $unsigned((8'haf))) >= $unsigned((wire53 ^ reg69)))} ?
                  reg59[(2'h2):(1'h1)] : {$unsigned({wire53[(3'h4):(2'h2)]})});
              reg74 <= $unsigned((((7'h41) ?
                      {wire55[(5'h10):(5'h10)], $signed(reg71)} : {((8'hbd) ?
                              reg72 : wire56)}) ?
                  ($signed((+reg71)) ?
                      $signed(reg64[(3'h5):(1'h1)]) : {$unsigned((8'ha9))}) : $signed($signed(reg72))));
              reg75 <= (~^$unsigned(reg73));
            end
          else
            begin
              reg73 <= $unsigned($signed($unsigned((7'h43))));
              reg74 <= reg69[(4'hc):(3'h6)];
            end
          reg76 <= $signed(((|$unsigned((wire56 ? reg74 : wire66))) ?
              $unsigned({wire54[(3'h4):(3'h4)],
                  (wire55 ? reg59 : wire56)}) : (8'hab)));
        end
      else
        begin
          reg68 <= ({(wire57[(4'h9):(3'h7)] ^ (~$signed(reg61)))} <<< $unsigned(reg58[(1'h0):(1'h0)]));
          if ({((reg76 ?
                      ((^~reg65) & wire57[(4'hd):(1'h0)]) : ((8'hb5) ?
                          $signed(reg75) : (~|reg76))) ?
                  $signed(wire66[(2'h2):(1'h0)]) : reg60),
              (((&$unsigned((8'ha8))) ?
                  ((reg65 >> reg74) != (reg72 || reg63)) : $unsigned($unsigned((8'ha0)))) ^ reg61)})
            begin
              reg69 <= reg60[(3'h6):(3'h5)];
              reg70 <= $unsigned(reg62);
            end
          else
            begin
              reg69 <= $signed($unsigned(wire57[(4'hc):(3'h4)]));
            end
          reg71 <= $signed((+$unsigned($unsigned(reg73))));
          reg72 <= (({(-$unsigned(reg58))} ?
                  $unsigned(((!reg65) << $unsigned(reg71))) : reg76) ?
              $unsigned((8'ha9)) : (+$unsigned(((reg73 + reg75) ?
                  (-reg59) : ((8'hbd) < reg75)))));
        end
      reg77 <= $unsigned(reg67);
      reg78 <= reg74[(2'h3):(2'h3)];
      reg79 <= reg77;
    end
  assign wire80 = $unsigned($unsigned((8'hb0)));
  assign wire81 = reg77;
  assign wire82 = ($unsigned($signed(wire55[(4'hb):(4'h9)])) ?
                      $unsigned(wire57[(4'hc):(3'h4)]) : (-$signed(reg59)));
  assign wire83 = (8'hb5);
  assign wire84 = reg78;
  always
    @(posedge clk) begin
      reg85 <= reg77[(2'h3):(1'h1)];
      reg86 <= (+((&$unsigned({reg64, wire55})) ?
          $signed(($signed(wire81) ?
              $unsigned(reg60) : (!wire57))) : $unsigned($unsigned(wire55[(2'h3):(1'h1)]))));
      reg87 <= $unsigned(reg67[(1'h1):(1'h1)]);
      reg88 <= reg63;
    end
endmodule

module module26  (y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire31;
  input wire signed [(4'hf):(1'h0)] wire30;
  input wire signed [(3'h4):(1'h0)] wire29;
  input wire [(3'h6):(1'h0)] wire28;
  input wire signed [(4'hb):(1'h0)] wire27;
  wire signed [(2'h3):(1'h0)] wire40;
  wire [(5'h13):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire33;
  wire signed [(5'h13):(1'h0)] wire32;
  reg signed [(3'h7):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire32 = ((wire27 ?
                          (wire29[(1'h0):(1'h0)] ?
                              $signed(wire29[(3'h4):(1'h1)]) : (+{wire29,
                                  wire29})) : (wire30[(4'he):(3'h5)] >> wire28)) ?
                      {((&$signed((8'hab))) ?
                              $unsigned(wire29) : $signed((wire28 ?
                                  wire28 : (7'h40)))),
                          wire29[(1'h1):(1'h1)]} : (|$signed(wire30)));
  assign wire33 = (({wire27[(2'h2):(1'h0)]} ? wire31 : $signed(wire28)) ?
                      (~&$signed($signed((wire29 | wire29)))) : $unsigned((|wire29)));
  assign wire34 = ((-wire33[(2'h2):(2'h2)]) ?
                      $unsigned($unsigned(wire33[(5'h12):(3'h6)])) : wire29);
  assign wire35 = {({{(&wire34), $unsigned(wire33)}} ?
                          ((&(wire34 < wire27)) - ($signed(wire28) ?
                              wire33[(4'hf):(3'h6)] : wire31)) : wire27)};
  always
    @(posedge clk) begin
      reg36 <= wire27;
      reg37 <= $signed((~^(|{(wire34 == wire27)})));
      reg38 <= ({wire31[(4'he):(4'h8)]} ?
          ($unsigned((wire29 == $signed(wire32))) & reg36) : $unsigned($signed(wire29[(2'h3):(2'h2)])));
    end
  assign wire39 = $signed(reg37[(4'h8):(3'h6)]);
  assign wire40 = (~&wire27[(2'h2):(2'h2)]);
endmodule
