module top
#(parameter param160 = {(8'hb3), ((({(8'haa)} ? {(8'ha6)} : ((8'hae) ? (8'hb6) : (8'ha5))) ? ((7'h43) ~^ ((8'h9e) <= (8'hae))) : {(+(8'ha3)), (&(8'ha6))}) || ((8'ha1) ? {{(8'hb6), (8'h9d)}, ((8'hbf) <= (8'hb4))} : (((8'ha6) * (7'h41)) ^ ((8'hb2) ? (8'haa) : (8'hb9)))))}, 
parameter param161 = (8'ha5))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h13d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire3;
  wire signed [(4'ha):(1'h0)] wire159;
  wire signed [(4'hf):(1'h0)] wire158;
  wire signed [(4'ha):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire21;
  wire signed [(4'hb):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire156;
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(4'h8):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(2'h3):(1'h0)] reg5 = (1'h0);
  assign y = {wire159,
                 wire158,
                 wire4,
                 wire21,
                 wire32,
                 wire34,
                 wire156,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = $signed(wire3[(3'h5):(1'h0)]);
  always
    @(posedge clk) begin
      if (((wire1[(1'h1):(1'h0)] ^ (^~$unsigned((wire1 ?
          wire3 : wire4)))) ^ wire0))
        begin
          reg5 <= $unsigned({(|wire0[(4'hd):(1'h1)])});
          reg6 <= reg5[(2'h3):(1'h0)];
          reg7 <= wire4[(1'h1):(1'h0)];
          reg8 <= (|(~|(wire0 ?
              ($unsigned(wire0) ?
                  reg5 : $signed(reg5)) : ((!wire0) < (|wire4)))));
        end
      else
        begin
          reg5 <= wire1[(3'h4):(2'h2)];
          reg6 <= reg5;
          reg7 <= wire1;
          if ($signed($signed($unsigned(reg5[(2'h2):(1'h1)]))))
            begin
              reg8 <= $unsigned({$signed({$unsigned(wire1)}),
                  wire2[(2'h2):(1'h0)]});
              reg9 <= {wire0[(4'hd):(2'h2)]};
            end
          else
            begin
              reg8 <= (~(&(reg8[(3'h4):(1'h0)] ?
                  ((wire2 ? wire2 : wire3) >= {reg9, wire3}) : reg8)));
              reg9 <= reg6;
              reg10 <= $unsigned(reg7);
              reg11 <= $signed(reg10[(4'h9):(4'h9)]);
              reg12 <= wire2;
            end
          if (((reg12[(4'hb):(4'hb)] && reg9) ?
              {(&(wire2 & (reg8 | reg9))), (&{(reg11 && reg7)})} : {wire1}))
            begin
              reg13 <= wire2[(3'h6):(2'h2)];
              reg14 <= $unsigned(((8'hb1) != (($signed(reg12) <= (8'ha6)) < {$unsigned(reg13),
                  $unsigned((8'hb3))})));
              reg15 <= $unsigned({(((wire3 ? reg14 : wire4) ?
                          (reg10 >> wire1) : $unsigned(reg13)) ?
                      {reg5, (~^(8'ha2))} : (-$unsigned(reg12)))});
              reg16 <= ((|reg15) ?
                  $signed($unsigned((-$unsigned((7'h43))))) : (!(^~{(~wire4),
                      $signed((8'hae))})));
              reg17 <= (+$signed($unsigned($unsigned($signed(reg14)))));
            end
          else
            begin
              reg13 <= $signed((~|(wire0 & reg8)));
              reg14 <= (8'ha4);
            end
        end
      reg18 <= ($signed(wire4) && ($signed($unsigned($signed(reg11))) + (~^((reg11 ?
          reg17 : wire0) <= (wire4 << reg10)))));
      reg19 <= $unsigned({reg15, wire3[(3'h4):(1'h1)]});
      reg20 <= (($signed((+reg15)) >> reg6) ? reg5 : reg12[(2'h2):(1'h1)]);
    end
  assign wire21 = $unsigned((wire0[(4'ha):(3'h7)] ? wire3 : wire4));
  module22 #() modinst33 (wire32, clk, reg8, reg17, reg7, reg11);
  assign wire34 = ((~^($unsigned((|wire2)) * $unsigned(reg10))) ?
                      (reg15[(2'h2):(1'h1)] ?
                          reg19[(4'ha):(3'h6)] : ($signed((reg20 ?
                              reg18 : reg15)) || (reg11[(4'ha):(4'h8)] ?
                              reg17 : (reg18 ?
                                  wire2 : wire2)))) : reg7[(3'h7):(1'h1)]);
  module35 #() modinst157 (wire156, clk, reg12, reg15, reg6, reg13, wire2);
  assign wire158 = (((^~(|(reg19 != reg8))) ?
                       (~|($signed(wire1) != {reg8})) : ((((8'hb4) <<< wire32) <= $signed((8'haa))) ?
                           reg12 : wire4)) != $unsigned((((!wire156) >>> {reg15,
                           reg15}) ?
                       $unsigned(reg7[(3'h5):(3'h4)]) : {{reg8, reg6},
                           (-wire1)})));
  assign wire159 = (8'hbd);
endmodule

module module35
#(parameter param155 = ((((8'h9d) ^ (((8'hac) ? (8'hbe) : (8'hb2)) ? ((7'h43) ? (8'haf) : (8'hbf)) : ((8'hbf) ? (8'hb6) : (8'ha6)))) ? (((-(7'h41)) ? ((8'hbb) & (8'hba)) : {(8'ha6)}) & ({(8'hb3)} ? ((8'hbb) ~^ (7'h41)) : (|(8'ha4)))) : (8'haf)) > (^~((^~((8'ha6) | (8'hbc))) > {(^~(8'hb5))}))))
(y, clk, wire36, wire37, wire38, wire39, wire40);
  output wire [(32'h111):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire36;
  input wire [(5'h13):(1'h0)] wire37;
  input wire [(5'h13):(1'h0)] wire38;
  input wire signed [(5'h15):(1'h0)] wire39;
  input wire signed [(4'he):(1'h0)] wire40;
  wire signed [(5'h10):(1'h0)] wire154;
  wire signed [(3'h6):(1'h0)] wire153;
  wire signed [(5'h10):(1'h0)] wire152;
  wire [(3'h6):(1'h0)] wire151;
  wire [(2'h3):(1'h0)] wire149;
  wire [(5'h12):(1'h0)] wire122;
  wire [(5'h14):(1'h0)] wire121;
  wire [(4'h9):(1'h0)] wire120;
  wire signed [(5'h12):(1'h0)] wire119;
  wire signed [(4'hb):(1'h0)] wire118;
  wire [(2'h3):(1'h0)] wire117;
  wire [(4'hf):(1'h0)] wire116;
  wire signed [(5'h11):(1'h0)] wire41;
  wire [(4'he):(1'h0)] wire69;
  wire signed [(4'ha):(1'h0)] wire71;
  wire signed [(5'h12):(1'h0)] wire72;
  wire signed [(4'hc):(1'h0)] wire73;
  wire [(2'h3):(1'h0)] wire74;
  wire signed [(5'h15):(1'h0)] wire100;
  wire [(5'h10):(1'h0)] wire114;
  reg signed [(5'h14):(1'h0)] reg123 = (1'h0);
  assign y = {wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire149,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire41,
                 wire69,
                 wire71,
                 wire72,
                 wire73,
                 wire74,
                 wire100,
                 wire114,
                 reg123,
                 (1'h0)};
  assign wire41 = $unsigned(wire39);
  module42 #() modinst70 (wire69, clk, wire37, wire39, wire40, wire41);
  assign wire71 = $unsigned(wire38[(1'h0):(1'h0)]);
  assign wire72 = ((8'hbb) ^ ({$signed($unsigned(wire41)),
                      ($signed(wire69) ?
                          (~^wire36) : {wire38})} << $signed($unsigned($unsigned(wire40)))));
  assign wire73 = {($unsigned($signed((wire38 ?
                          wire71 : wire71))) <<< ({(wire36 ?
                              (8'hb4) : (8'hb8))} | (wire40[(4'hb):(4'hb)] ^ (wire37 & wire38))))};
  assign wire74 = ($signed(({wire40[(4'hd):(4'h8)]} <<< {(wire38 >= wire41),
                      (wire41 ?
                          wire73 : wire36)})) ^~ (^~wire38[(4'hd):(4'h8)]));
  module75 #() modinst101 (.wire78(wire41), .wire76(wire40), .clk(clk), .wire79(wire73), .wire77(wire38), .y(wire100));
  module102 #() modinst115 (.y(wire114), .wire107(wire69), .wire105(wire36), .wire106(wire72), .clk(clk), .wire103(wire71), .wire104(wire41));
  assign wire116 = (wire73[(2'h2):(1'h0)] ?
                       ($signed(($signed(wire38) ^~ $signed(wire74))) ?
                           $signed((7'h40)) : $signed({$signed(wire37)})) : ({$unsigned($unsigned(wire74)),
                               ((wire71 ? wire73 : (8'ha6)) ?
                                   ((8'ha5) <= wire39) : ((8'h9e) ?
                                       wire73 : (7'h44)))} ?
                           wire37 : ($unsigned({wire36}) | ((wire71 ?
                               wire69 : wire72) & $unsigned((8'h9d))))));
  assign wire117 = ((|wire36[(5'h10):(4'ha)]) ?
                       ({(~|wire39[(1'h0):(1'h0)])} ?
                           (8'hb0) : $signed($unsigned((wire41 ?
                               wire37 : (8'h9c))))) : (8'ha6));
  assign wire118 = ((wire71[(3'h6):(2'h2)] ?
                       $unsigned(wire71[(2'h3):(1'h1)]) : $signed(((~&wire114) ?
                           $signed(wire116) : wire100))) ~^ (~$signed($signed(wire38[(5'h11):(4'h8)]))));
  assign wire119 = wire74[(1'h0):(1'h0)];
  assign wire120 = (|$unsigned($signed((&(wire114 ? wire39 : (8'hb8))))));
  assign wire121 = wire118[(3'h7):(3'h4)];
  assign wire122 = ((wire73 ?
                       (wire100 ?
                           $signed(wire36) : wire117) : ($unsigned((&wire74)) ?
                           (~(-wire114)) : $unsigned((wire40 < wire69)))) + ((((wire120 | wire72) * {wire37,
                               (8'h9e)}) ?
                           ({wire39, wire72} ?
                               (wire38 ?
                                   wire114 : wire100) : wire120[(4'h8):(3'h7)]) : $unsigned((wire71 ?
                               wire39 : wire41))) ?
                       (-$unsigned($signed(wire72))) : {{(~|wire71)},
                           (~(|wire37))}));
  always
    @(posedge clk) begin
      reg123 <= $unsigned((!$unsigned($signed(((8'h9d) ? wire41 : wire73)))));
    end
  module124 #() modinst150 (.y(wire149), .wire128(wire116), .wire127(wire100), .clk(clk), .wire126(wire38), .wire125(wire121));
  assign wire151 = {{$signed($signed(wire74[(2'h2):(2'h2)])),
                           ((wire69[(3'h5):(2'h3)] ? {wire37} : wire36) ?
                               (~&wire119[(4'hd):(2'h3)]) : $unsigned({wire100,
                                   reg123}))}};
  assign wire152 = wire119;
  assign wire153 = (wire119[(1'h1):(1'h0)] ^~ (~^(wire37[(4'hf):(1'h1)] - $signed($signed(wire72)))));
  assign wire154 = ($signed({wire36}) >>> (8'ha7));
endmodule

module module22
#(parameter param31 = (~|{(&(+{(8'ha0)})), ({{(8'h9f)}, {(8'hae)}} ? ((-(8'hac)) + (~|(8'h9e))) : (+(|(8'haf))))}))
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h2e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire26;
  input wire signed [(5'h15):(1'h0)] wire25;
  input wire [(3'h5):(1'h0)] wire24;
  input wire signed [(4'hf):(1'h0)] wire23;
  wire signed [(3'h5):(1'h0)] wire30;
  wire [(5'h14):(1'h0)] wire29;
  wire signed [(3'h7):(1'h0)] wire28;
  wire [(4'hd):(1'h0)] wire27;
  assign y = {wire30, wire29, wire28, wire27, (1'h0)};
  assign wire27 = $unsigned($unsigned($unsigned(((wire24 << wire24) ?
                      wire24 : wire24))));
  assign wire28 = wire25[(5'h15):(5'h12)];
  assign wire29 = ($unsigned({wire25[(5'h15):(4'he)],
                          ((wire23 >= (8'haa)) ? wire25 : $unsigned(wire24))}) ?
                      wire27[(1'h1):(1'h1)] : $signed($signed($unsigned(wire27))));
  assign wire30 = (($unsigned($unsigned($unsigned(wire28))) >> $unsigned($signed($unsigned(wire24)))) ?
                      ($signed((wire27 ?
                          wire29[(5'h13):(3'h6)] : $unsigned(wire29))) >>> wire26[(1'h1):(1'h0)]) : ((+$signed($unsigned((8'hab)))) ?
                          $signed(($signed(wire28) == $signed((8'hb4)))) : (8'hae)));
endmodule

module module124
#(parameter param147 = ({(8'ha0)} & (((8'hb7) ? ({(8'haa), (7'h42)} >> ((8'hb1) ? (8'hae) : (8'had))) : ({(8'h9d), (8'hbe)} ? ((8'hb4) ? (7'h44) : (8'ha8)) : (~|(7'h41)))) ^~ (~&{(~^(8'hb1))}))), 
parameter param148 = (~(param147 > ((^(^~(8'ha6))) ? (~|(8'hb5)) : ((7'h44) <= (param147 ^ param147))))))
(y, clk, wire128, wire127, wire126, wire125);
  output wire [(32'hd4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire128;
  input wire [(4'he):(1'h0)] wire127;
  input wire signed [(2'h3):(1'h0)] wire126;
  input wire [(4'h9):(1'h0)] wire125;
  wire [(3'h6):(1'h0)] wire137;
  wire [(4'hc):(1'h0)] wire130;
  wire signed [(5'h13):(1'h0)] wire129;
  reg signed [(4'hb):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg142 = (1'h0);
  reg [(2'h2):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg139 = (1'h0);
  reg [(4'he):(1'h0)] reg138 = (1'h0);
  reg [(5'h11):(1'h0)] reg136 = (1'h0);
  reg [(3'h6):(1'h0)] reg135 = (1'h0);
  reg [(2'h2):(1'h0)] reg134 = (1'h0);
  reg [(5'h15):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg132 = (1'h0);
  reg [(4'he):(1'h0)] reg131 = (1'h0);
  assign y = {wire137,
                 wire130,
                 wire129,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 (1'h0)};
  assign wire129 = wire127[(4'he):(4'ha)];
  assign wire130 = $signed($signed(wire126));
  always
    @(posedge clk) begin
      if ((~^wire126))
        begin
          reg131 <= (((!$unsigned((~^wire125))) ?
              (8'ha5) : (|{((8'hb6) >> wire126)})) == wire130);
        end
      else
        begin
          reg131 <= $unsigned(wire127);
          reg132 <= (~wire127[(4'hc):(3'h7)]);
          reg133 <= {$unsigned($unsigned(wire129)),
              $signed(reg131[(3'h5):(3'h4)])};
          if ($signed((&$signed(wire127[(4'he):(3'h6)]))))
            begin
              reg134 <= ((((8'h9d) ?
                      reg133[(4'he):(4'hd)] : $signed($unsigned(wire128))) >>> reg133[(1'h0):(1'h0)]) ?
                  (+(^reg133)) : {(|($signed(reg132) ?
                          reg131[(4'h9):(4'h9)] : ((8'hab) ?
                              (8'hac) : reg132))),
                      ((~&((8'hbe) != reg132)) ?
                          (!{wire125}) : ({reg133,
                              reg131} >>> reg132[(1'h1):(1'h1)]))});
              reg135 <= wire128[(3'h4):(1'h1)];
            end
          else
            begin
              reg134 <= wire127;
              reg135 <= (^~reg134);
              reg136 <= reg133;
            end
        end
    end
  assign wire137 = (wire127 << $unsigned($unsigned(wire127)));
  always
    @(posedge clk) begin
      if (wire128[(1'h1):(1'h0)])
        begin
          reg138 <= ((wire128 || {wire130}) ?
              {wire137[(3'h4):(1'h0)], reg135[(3'h4):(1'h0)]} : wire126);
          reg139 <= $unsigned($signed($signed($unsigned($signed((8'haa))))));
          reg140 <= $unsigned($signed(reg138));
          if (reg140[(2'h3):(1'h1)])
            begin
              reg141 <= reg134[(1'h0):(1'h0)];
              reg142 <= (^$signed(((wire129[(5'h13):(2'h3)] && (^reg134)) ?
                  (~&reg138[(3'h5):(2'h3)]) : {$signed(reg138),
                      (wire126 > (8'h9e))})));
              reg143 <= reg142;
              reg144 <= (($unsigned($unsigned(reg142[(3'h4):(2'h2)])) ?
                  $signed(($unsigned(reg135) == (&reg143))) : $signed(reg140)) || (+reg143[(4'ha):(1'h0)]));
            end
          else
            begin
              reg141 <= (reg131 * {$unsigned(reg138[(4'hd):(3'h7)])});
              reg142 <= reg136[(4'hc):(4'hb)];
              reg143 <= ($signed(reg138) <= $signed(((~^$unsigned(wire130)) ?
                  reg142 : (wire130[(3'h7):(3'h5)] >= wire130[(3'h5):(2'h2)]))));
              reg144 <= {(8'hab)};
              reg145 <= wire137;
            end
        end
      else
        begin
          reg138 <= reg135;
          if ((~^$signed(($unsigned({reg140, (8'hbb)}) ^~ {$signed((8'ha1))}))))
            begin
              reg139 <= (reg142 << (^~($signed((reg144 ?
                  wire125 : reg133)) && (~reg133))));
            end
          else
            begin
              reg139 <= ((wire128 ?
                  wire127[(1'h0):(1'h0)] : {(wire126 ?
                          $signed(reg140) : {reg133, reg135}),
                      $unsigned((reg135 && (8'ha7)))}) > reg132);
              reg140 <= ($unsigned($signed(reg132[(2'h2):(1'h0)])) >> (~|$unsigned(((reg136 < reg133) ?
                  reg131[(3'h6):(3'h6)] : reg131))));
              reg141 <= reg144;
              reg142 <= reg145;
              reg143 <= reg133;
            end
        end
      reg146 <= $unsigned($unsigned((+(^reg138))));
    end
endmodule

module module102  (y, clk, wire107, wire106, wire105, wire104, wire103);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire107;
  input wire [(5'h12):(1'h0)] wire106;
  input wire [(5'h13):(1'h0)] wire105;
  input wire signed [(4'hb):(1'h0)] wire104;
  input wire signed [(4'ha):(1'h0)] wire103;
  wire signed [(4'ha):(1'h0)] wire113;
  wire signed [(3'h5):(1'h0)] wire112;
  wire [(4'hd):(1'h0)] wire111;
  wire signed [(5'h14):(1'h0)] wire110;
  wire signed [(5'h12):(1'h0)] wire109;
  wire signed [(4'ha):(1'h0)] wire108;
  assign y = {wire113, wire112, wire111, wire110, wire109, wire108, (1'h0)};
  assign wire108 = {(~^{{wire107[(4'hc):(2'h2)], (^~wire105)},
                           ($unsigned(wire106) ? wire103 : {wire107})}),
                       wire105[(4'hc):(4'hc)]};
  assign wire109 = wire104;
  assign wire110 = {(((wire105 ?
                               (wire103 <= wire103) : wire104[(4'h9):(3'h6)]) - (8'ha6)) ?
                           ($signed(wire108[(3'h4):(2'h2)]) >>> ({wire107} ?
                               (wire103 <= wire105) : (wire109 ?
                                   (8'h9f) : wire109))) : {wire106}),
                       ((~^wire107[(2'h3):(1'h1)]) ?
                           wire104[(1'h1):(1'h1)] : wire103)};
  assign wire111 = wire106[(3'h7):(1'h1)];
  assign wire112 = wire103[(4'h9):(1'h0)];
  assign wire113 = $signed($signed(wire106));
endmodule

module module75  (y, clk, wire79, wire78, wire77, wire76);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire79;
  input wire signed [(4'h9):(1'h0)] wire78;
  input wire [(4'hf):(1'h0)] wire77;
  input wire [(4'h9):(1'h0)] wire76;
  wire [(2'h2):(1'h0)] wire99;
  wire [(5'h12):(1'h0)] wire98;
  wire signed [(2'h3):(1'h0)] wire84;
  wire signed [(5'h12):(1'h0)] wire83;
  wire signed [(5'h14):(1'h0)] wire82;
  wire [(4'hc):(1'h0)] wire81;
  wire signed [(4'hc):(1'h0)] wire80;
  reg [(4'hc):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg95 = (1'h0);
  reg [(4'hd):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg93 = (1'h0);
  reg [(5'h14):(1'h0)] reg92 = (1'h0);
  reg [(4'ha):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg90 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg89 = (1'h0);
  reg [(3'h5):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg87 = (1'h0);
  reg [(5'h14):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg85 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
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
                 (1'h0)};
  assign wire80 = wire79[(3'h7):(3'h6)];
  assign wire81 = (8'hbb);
  assign wire82 = $signed(wire76[(1'h1):(1'h1)]);
  assign wire83 = ($signed($unsigned({(!wire80),
                      (!wire78)})) ^~ $unsigned((($signed(wire76) < $signed(wire81)) ^ wire82[(4'h9):(3'h5)])));
  assign wire84 = ($unsigned(($unsigned({wire82}) ~^ wire81[(4'h9):(1'h0)])) ?
                      ({wire80} >>> $unsigned(($unsigned(wire81) ?
                          (wire80 ? wire78 : wire80) : (wire82 ?
                              wire77 : wire78)))) : ((((&wire81) ?
                          (~&wire82) : wire83) && (+$signed(wire77))) + ($signed(wire79[(3'h7):(2'h2)]) - wire80[(4'h9):(3'h5)])));
  always
    @(posedge clk) begin
      reg85 <= (&(~|wire79[(3'h4):(1'h1)]));
      if (wire81)
        begin
          if ((^wire77[(3'h6):(3'h6)]))
            begin
              reg86 <= ($unsigned(wire77) >> (8'ha4));
              reg87 <= {$unsigned(((-(wire80 ?
                      wire78 : wire83)) < $signed($unsigned(wire80)))),
                  ((~|$unsigned($signed(wire76))) || $signed($unsigned((wire79 ?
                      (8'ha7) : wire79))))};
            end
          else
            begin
              reg86 <= (8'hbb);
            end
          if ((|$signed($signed((~^(+reg86))))))
            begin
              reg88 <= $signed(wire83[(4'hc):(1'h1)]);
              reg89 <= $signed(wire76[(1'h1):(1'h1)]);
              reg90 <= wire81[(3'h7):(3'h7)];
            end
          else
            begin
              reg88 <= reg89;
              reg89 <= (($signed({wire79}) ~^ $signed($unsigned(wire84))) ?
                  (~|($unsigned(wire81) * (((8'hbd) ?
                      wire80 : reg87) * (8'hbd)))) : {reg86[(2'h2):(1'h0)]});
              reg90 <= reg85;
              reg91 <= $unsigned($unsigned(reg88[(2'h2):(2'h2)]));
              reg92 <= $unsigned(({$signed((wire81 ? (8'hbb) : reg86)),
                      $signed($unsigned(wire84))} ?
                  $unsigned((wire80[(4'ha):(3'h5)] ?
                      $unsigned(wire78) : $signed(wire81))) : (wire78[(1'h1):(1'h0)] > wire81[(3'h4):(1'h1)])));
            end
          reg93 <= $signed($signed((|(8'h9d))));
        end
      else
        begin
          reg86 <= (!$unsigned(($unsigned(wire81[(4'ha):(3'h6)]) ?
              $signed($signed(reg92)) : ((reg86 ^ wire76) ?
                  ((7'h42) < reg86) : (&reg85)))));
          reg87 <= ($unsigned((~^(~|$signed(reg87)))) ?
              (&(((~|(8'hb3)) ?
                  $signed(reg92) : (+wire76)) <= $signed($signed(wire83)))) : reg88[(3'h5):(2'h3)]);
        end
    end
  always
    @(posedge clk) begin
      reg94 <= (($signed($signed(wire78)) < $unsigned($unsigned($signed(wire79)))) ?
          $signed(reg92) : $unsigned(wire78[(3'h7):(1'h1)]));
      reg95 <= reg94[(4'hc):(4'ha)];
      reg96 <= reg93;
      reg97 <= $unsigned(reg89[(2'h3):(2'h2)]);
    end
  assign wire98 = $unsigned($signed(wire77));
  assign wire99 = (reg94[(4'hd):(3'h4)] | reg92[(4'hf):(3'h5)]);
endmodule

module module42
#(parameter param67 = {{(+(|(^(8'ha1))))}}, 
parameter param68 = param67)
(y, clk, wire46, wire45, wire44, wire43);
  output wire [(32'hf3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire46;
  input wire signed [(5'h15):(1'h0)] wire45;
  input wire signed [(4'he):(1'h0)] wire44;
  input wire [(5'h11):(1'h0)] wire43;
  wire signed [(4'h9):(1'h0)] wire66;
  wire [(5'h14):(1'h0)] wire48;
  wire [(2'h3):(1'h0)] wire47;
  reg signed [(4'he):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(4'hd):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg60 = (1'h0);
  reg [(5'h14):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(5'h11):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(4'he):(1'h0)] reg52 = (1'h0);
  reg [(3'h4):(1'h0)] reg51 = (1'h0);
  reg [(3'h7):(1'h0)] reg50 = (1'h0);
  reg [(4'hd):(1'h0)] reg49 = (1'h0);
  assign y = {wire66,
                 wire48,
                 wire47,
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
                 reg49,
                 (1'h0)};
  assign wire47 = $unsigned(wire46);
  assign wire48 = ($signed(wire43[(3'h5):(3'h4)]) & $signed($unsigned(wire47)));
  always
    @(posedge clk) begin
      if (wire46[(4'he):(4'h9)])
        begin
          reg49 <= ($signed(wire43[(3'h7):(3'h6)]) ?
              $signed((((7'h43) ? $signed(wire45) : wire44[(4'he):(1'h1)]) ?
                  ($signed(wire47) * (-wire48)) : wire44)) : {((8'h9d) == $signed(wire43))});
          reg50 <= wire46[(3'h5):(2'h2)];
          if ($unsigned(($unsigned(($signed((8'ha6)) ^~ (wire46 <= wire47))) && (~$unsigned($unsigned(wire48))))))
            begin
              reg51 <= (!$signed($unsigned(wire46)));
              reg52 <= ({(-(wire43 ? $signed(reg49) : $signed(wire48)))} ?
                  reg51[(1'h1):(1'h0)] : $unsigned($unsigned(reg49)));
              reg53 <= wire45;
              reg54 <= wire44;
            end
          else
            begin
              reg51 <= (8'hbe);
              reg52 <= reg53;
              reg53 <= ((!$signed($signed($signed(reg54)))) ?
                  reg51 : ((^~{reg49[(4'hd):(4'ha)], $signed(wire47)}) ?
                      ((((8'ha6) ? reg49 : wire43) ?
                          $unsigned(wire47) : wire48[(5'h13):(5'h13)]) <<< (~|$unsigned(wire45))) : (reg53[(4'hb):(4'h9)] - $unsigned((^~wire48)))));
              reg54 <= wire47[(1'h1):(1'h0)];
              reg55 <= wire46;
            end
          reg56 <= $signed({({reg51} & {{wire48}})});
        end
      else
        begin
          if ($signed(reg49))
            begin
              reg49 <= {wire47[(1'h1):(1'h1)], reg52};
              reg50 <= reg55;
              reg51 <= (&((($unsigned(wire45) ~^ $signed(reg51)) ?
                  reg56[(1'h0):(1'h0)] : $unsigned($unsigned(reg56))) != $unsigned(((reg51 > reg51) <<< {reg51,
                  reg55}))));
            end
          else
            begin
              reg49 <= $unsigned(((((!reg52) ? (8'hbb) : reg52[(4'ha):(3'h7)]) ?
                      ($unsigned(reg53) < wire44[(4'ha):(2'h2)]) : wire47) ?
                  ((((8'hb7) != reg49) ~^ reg56) ?
                      reg50[(3'h6):(1'h1)] : $signed(((8'ha6) <= wire48))) : (~|wire46[(1'h1):(1'h0)])));
            end
        end
      reg57 <= {$signed((^~$signed(reg49[(1'h1):(1'h0)])))};
      reg58 <= $unsigned($unsigned((~&(8'hbc))));
      if ({wire43})
        begin
          reg59 <= $unsigned($unsigned((reg51[(2'h3):(1'h1)] ^ reg52)));
          reg60 <= ($unsigned(($unsigned(wire48) - reg55[(4'hf):(4'he)])) ?
              (8'ha9) : (8'ha8));
          reg61 <= reg54;
          if (($unsigned(($unsigned(reg60) ?
                  $signed({reg54, wire43}) : reg50)) ?
              (({$signed((8'hb5)), (reg51 ? (8'hae) : wire45)} != (reg57 ?
                  (~&wire47) : reg52)) >= $unsigned($unsigned((!reg56)))) : (((~|reg53[(4'hc):(3'h7)]) ?
                      (|$unsigned(reg50)) : (reg59 ?
                          $unsigned(wire44) : (~&reg59))) ?
                  {wire45} : (8'ha4))))
            begin
              reg62 <= reg52[(4'hb):(3'h5)];
              reg63 <= $unsigned((($unsigned({reg59}) >>> $unsigned((reg57 ?
                      reg57 : reg61))) ?
                  (^{(wire48 ^~ (8'ha1)), (reg54 <<< wire45)}) : ((8'h9e) ?
                      reg53[(4'hb):(1'h0)] : $unsigned((reg50 ?
                          wire45 : reg50)))));
              reg64 <= ($unsigned(reg56[(1'h1):(1'h0)]) ?
                  reg54 : {reg52,
                      ((|((8'haf) ? (8'hb9) : wire46)) ?
                          reg60[(3'h4):(2'h2)] : (reg50[(3'h7):(1'h0)] && wire45))});
            end
          else
            begin
              reg62 <= (|wire46);
            end
          reg65 <= reg51;
        end
      else
        begin
          if (reg54[(4'hc):(3'h5)])
            begin
              reg59 <= {reg64};
              reg60 <= ($unsigned(($unsigned(reg63) >> $signed((wire43 >>> wire43)))) == reg61);
            end
          else
            begin
              reg59 <= wire43[(5'h11):(5'h11)];
              reg60 <= {reg65[(4'hd):(4'h9)],
                  {$unsigned((~(reg56 <<< wire45)))}};
            end
          reg61 <= (+reg58[(2'h3):(1'h0)]);
        end
    end
  assign wire66 = {$unsigned(($signed((&reg63)) ?
                          $unsigned((~^wire48)) : reg56[(2'h2):(2'h2)])),
                      ((reg62[(3'h4):(1'h0)] >>> {$unsigned(reg62),
                              (reg53 >>> reg59)}) ?
                          {((wire47 || reg59) ?
                                  $signed(reg49) : $signed(reg53))} : (({reg51} ?
                              (reg65 >> reg53) : reg58[(4'h8):(1'h0)]) ~^ ($unsigned(reg56) ?
                              reg51 : reg63[(3'h6):(3'h4)])))};
endmodule
