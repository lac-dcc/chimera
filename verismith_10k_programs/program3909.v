module top
#(parameter param124 = (((|(((8'ha6) ? (8'ha7) : (8'hb8)) == ((8'hbc) ? (7'h40) : (8'h9d)))) <<< (^~{{(8'hb5), (7'h44)}, {(7'h43), (8'h9c)}})) ^ (({((8'hb5) != (8'hb6)), ((8'hb3) ? (8'hb6) : (8'hae))} > (^~(|(8'hb3)))) ? {(((7'h44) || (8'ha3)) ^ ((8'hae) >>> (8'had)))} : ({((7'h41) && (7'h40)), ((8'ha8) ? (8'h9d) : (8'hac))} != ((+(8'haa)) ? ((8'ha8) ? (8'hbd) : (8'had)) : (+(8'ha3)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire123;
  wire signed [(3'h4):(1'h0)] wire122;
  wire signed [(3'h6):(1'h0)] wire121;
  wire signed [(3'h6):(1'h0)] wire116;
  wire [(2'h3):(1'h0)] wire20;
  wire [(5'h15):(1'h0)] wire19;
  wire signed [(3'h4):(1'h0)] wire18;
  wire signed [(4'hf):(1'h0)] wire17;
  wire signed [(4'h9):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire13;
  reg [(4'he):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg119 = (1'h0);
  reg [(5'h14):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg5 = (1'h0);
  reg signed [(4'he):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  assign y = {wire123,
                 wire122,
                 wire121,
                 wire116,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire14,
                 wire13,
                 reg120,
                 reg119,
                 reg118,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg15,
                 reg16,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $signed({{$signed(wire1), $unsigned((~|wire1))},
          $signed($signed((wire3 && wire3)))});
      if ((^$signed($signed(({wire2} ? $unsigned(wire1) : $signed(wire4))))))
        begin
          if ($unsigned({((~|(|wire0)) >>> {$unsigned(reg5)})}))
            begin
              reg6 <= wire4[(5'h13):(4'he)];
              reg7 <= ((|$signed($signed($unsigned(wire4)))) ?
                  (~(wire1[(3'h5):(3'h4)] ?
                      {(wire3 * wire2),
                          $signed(wire0)} : $signed(wire2[(3'h5):(3'h5)]))) : wire1);
              reg8 <= $signed(wire4);
            end
          else
            begin
              reg6 <= ($unsigned(wire3[(5'h15):(3'h6)]) && $signed((&((wire2 ?
                  (7'h42) : wire3) != {(8'h9c), wire1}))));
            end
          reg9 <= $unsigned($signed($signed(((^wire3) ?
              (!wire0) : ((8'haa) ? wire2 : reg8)))));
          reg10 <= reg8[(2'h3):(1'h1)];
        end
      else
        begin
          reg6 <= $signed(((8'hbf) * {{{wire1, (8'hb8)}, {(8'hb2), reg7}}}));
          reg7 <= reg7;
        end
      reg11 <= $unsigned(wire0);
      reg12 <= (($unsigned(reg9[(2'h3):(2'h3)]) ?
              $signed(((wire1 != reg6) ~^ $signed(wire2))) : $signed(wire0)) ?
          ($signed(((~^wire2) ?
              {reg5,
                  wire0} : (~reg11))) > $signed(({reg5} >>> {wire1}))) : ($unsigned($unsigned(wire0[(2'h3):(2'h2)])) == reg6[(4'hc):(1'h1)]));
    end
  assign wire13 = $unsigned(wire4);
  assign wire14 = reg5;
  always
    @(posedge clk) begin
      reg15 <= reg8[(4'hc):(1'h0)];
      reg16 <= wire4[(2'h2):(1'h1)];
    end
  assign wire17 = wire2[(3'h6):(1'h0)];
  assign wire18 = reg10;
  assign wire19 = (^~reg10[(1'h1):(1'h1)]);
  assign wire20 = $unsigned($signed({$unsigned({wire19, reg10})}));
  module21 #() modinst117 (.wire25(wire19), .y(wire116), .wire22(reg11), .wire23(reg16), .clk(clk), .wire26(wire17), .wire24(reg12));
  always
    @(posedge clk) begin
      reg118 <= $signed(reg6);
      if (wire4[(3'h5):(2'h2)])
        begin
          reg119 <= ($signed((^wire0[(2'h2):(1'h0)])) ?
              $unsigned((wire20[(1'h0):(1'h0)] - {$unsigned(wire17),
                  wire20[(1'h1):(1'h0)]})) : $unsigned($unsigned($unsigned({(8'hb4),
                  wire19}))));
          reg120 <= {((&$signed({reg8})) ?
                  (reg10 != reg5) : reg12[(4'hd):(2'h3)])};
        end
      else
        begin
          reg119 <= wire19;
        end
    end
  assign wire121 = (~&$signed({reg16}));
  assign wire122 = wire2[(1'h1):(1'h1)];
  assign wire123 = ((|($signed((8'had)) < $signed(wire20[(2'h2):(1'h1)]))) & (8'hb9));
endmodule

module module21  (y, clk, wire26, wire25, wire24, wire23, wire22);
  output wire [(32'h123):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire26;
  input wire signed [(3'h4):(1'h0)] wire25;
  input wire [(5'h11):(1'h0)] wire24;
  input wire signed [(5'h10):(1'h0)] wire23;
  input wire [(5'h12):(1'h0)] wire22;
  wire signed [(3'h5):(1'h0)] wire115;
  wire [(4'hd):(1'h0)] wire114;
  wire signed [(2'h3):(1'h0)] wire113;
  wire signed [(4'hb):(1'h0)] wire112;
  wire signed [(3'h4):(1'h0)] wire110;
  wire signed [(5'h14):(1'h0)] wire69;
  wire signed [(4'he):(1'h0)] wire67;
  wire signed [(5'h13):(1'h0)] wire31;
  wire [(4'he):(1'h0)] wire30;
  wire signed [(5'h13):(1'h0)] wire29;
  wire signed [(3'h6):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire27;
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg [(5'h13):(1'h0)] reg38 = (1'h0);
  reg [(4'hc):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg40 = (1'h0);
  reg [(5'h10):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg43 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire110,
                 wire69,
                 wire67,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 (1'h0)};
  assign wire27 = $unsigned(wire22[(4'h8):(1'h0)]);
  assign wire28 = (~($unsigned($unsigned(wire23[(3'h5):(2'h3)])) ?
                      $signed(((-(8'ha0)) ?
                          $signed(wire25) : $unsigned(wire25))) : ((^~$unsigned(wire23)) ?
                          ((wire25 != wire25) ?
                              (wire25 ?
                                  wire26 : (8'h9d)) : ((7'h41) >>> wire23)) : (wire27[(4'h8):(1'h0)] >>> (wire25 ?
                              wire22 : wire27)))));
  assign wire29 = $signed((^~wire23[(4'h9):(1'h1)]));
  assign wire30 = (&wire23);
  assign wire31 = $unsigned(wire23[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      if ($unsigned(wire25[(2'h2):(1'h0)]))
        begin
          reg32 <= ($signed($signed($signed((wire29 >> wire24)))) | (+$signed($unsigned((wire24 && wire23)))));
          reg33 <= (~wire27);
          reg34 <= wire31[(3'h5):(1'h1)];
        end
      else
        begin
          reg32 <= {$signed($signed(wire30))};
          reg33 <= wire22[(1'h0):(1'h0)];
          if ((^~(-$signed(wire30))))
            begin
              reg34 <= $unsigned(wire26[(2'h2):(2'h2)]);
              reg35 <= (8'hbf);
              reg36 <= $signed((($signed((reg35 == (7'h44))) ?
                  {(reg33 <= reg35), $signed(wire25)} : {((8'hb3) ?
                          wire31 : reg33),
                      $signed(wire24)}) > $unsigned($signed((wire24 ?
                  reg35 : wire27)))));
              reg37 <= $signed(($unsigned(wire30) ?
                  (!wire27) : (~^($signed(wire30) | reg33[(4'hf):(2'h2)]))));
            end
          else
            begin
              reg34 <= ($signed(wire31[(4'ha):(3'h6)]) ?
                  $unsigned({({(8'hba), reg37} ? {wire28} : {wire28}),
                      $unsigned((wire27 ?
                          wire26 : reg36))}) : $signed((+reg36[(2'h2):(1'h1)])));
              reg35 <= {(reg32 ^ wire23)};
              reg36 <= (wire23 * ($unsigned(wire28[(3'h4):(2'h3)]) ?
                  reg33[(5'h10):(2'h2)] : (&$signed($unsigned((8'hbe))))));
            end
          reg38 <= wire26;
          if ($unsigned($signed($unsigned($signed((reg33 ^ wire28))))))
            begin
              reg39 <= wire31[(2'h2):(1'h1)];
            end
          else
            begin
              reg39 <= ((~|(&{$unsigned(wire25),
                  $signed((8'hbf))})) == $signed((wire31 ?
                  {((7'h44) <<< wire29),
                      (wire23 - wire23)} : reg35[(4'h8):(3'h6)])));
              reg40 <= (((wire27[(4'h9):(1'h1)] ~^ wire24[(2'h3):(1'h1)]) && reg37[(1'h0):(1'h0)]) < ($unsigned($unsigned(wire25[(2'h2):(2'h2)])) != (8'h9e)));
              reg41 <= (~&(8'hac));
              reg42 <= wire25[(1'h0):(1'h0)];
              reg43 <= (((reg36 ?
                      reg36[(1'h1):(1'h0)] : ((wire31 <<< reg40) != $signed(reg40))) ?
                  (($unsigned(wire30) ?
                      $signed(wire28) : reg32) < (~|wire27)) : $unsigned((reg41 == ((8'hab) >> (8'had))))) == {$signed(((reg35 ?
                          reg40 : wire29) ?
                      (8'hb5) : $signed((8'ha7)))),
                  $unsigned(wire30[(4'he):(2'h2)])});
            end
        end
    end
  module44 #() modinst68 (.y(wire67), .wire45(reg37), .wire48(reg40), .wire46(wire29), .clk(clk), .wire49(wire23), .wire47(reg41));
  assign wire69 = $signed(wire24);
  module70 #() modinst111 (wire110, clk, reg40, wire27, wire26, reg36);
  assign wire112 = (wire110[(2'h2):(1'h0)] >> ({wire22} ^~ $unsigned((reg43 << $unsigned(wire23)))));
  assign wire113 = reg37;
  assign wire114 = ($unsigned((wire22[(4'h8):(2'h2)] ?
                           (-(~&wire23)) : reg41[(4'he):(3'h6)])) ?
                       $unsigned($signed({$signed(wire23)})) : (wire28 ^~ $signed(reg36)));
  assign wire115 = ((8'hac) << reg39);
endmodule

module module70  (y, clk, wire74, wire73, wire72, wire71);
  output wire [(32'h18a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire74;
  input wire signed [(4'hb):(1'h0)] wire73;
  input wire signed [(4'hd):(1'h0)] wire72;
  input wire signed [(4'hd):(1'h0)] wire71;
  wire [(5'h13):(1'h0)] wire107;
  wire signed [(4'hf):(1'h0)] wire106;
  wire [(5'h10):(1'h0)] wire95;
  wire signed [(5'h11):(1'h0)] wire89;
  wire signed [(3'h4):(1'h0)] wire88;
  wire [(4'hf):(1'h0)] wire87;
  wire signed [(5'h14):(1'h0)] wire86;
  wire [(4'ha):(1'h0)] wire84;
  wire [(4'hc):(1'h0)] wire75;
  reg [(3'h5):(1'h0)] reg109 = (1'h0);
  reg [(2'h3):(1'h0)] reg108 = (1'h0);
  reg [(4'h8):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg104 = (1'h0);
  reg [(3'h7):(1'h0)] reg103 = (1'h0);
  reg [(5'h13):(1'h0)] reg102 = (1'h0);
  reg [(5'h12):(1'h0)] reg101 = (1'h0);
  reg [(5'h15):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg99 = (1'h0);
  reg [(5'h12):(1'h0)] reg98 = (1'h0);
  reg [(3'h6):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg94 = (1'h0);
  reg [(3'h6):(1'h0)] reg93 = (1'h0);
  reg [(4'h9):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg90 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg85 = (1'h0);
  reg [(4'h9):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg82 = (1'h0);
  reg [(5'h13):(1'h0)] reg81 = (1'h0);
  reg [(4'hd):(1'h0)] reg80 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg79 = (1'h0);
  reg [(5'h14):(1'h0)] reg78 = (1'h0);
  reg [(4'h8):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg76 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire95,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire84,
                 wire75,
                 reg109,
                 reg108,
                 reg105,
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
                 reg85,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 (1'h0)};
  assign wire75 = (wire73 ?
                      $unsigned(($signed({wire71,
                          (8'ha5)}) < $signed($unsigned((8'ha2))))) : $unsigned($unsigned((-{wire72}))));
  always
    @(posedge clk) begin
      reg76 <= $unsigned({wire74, wire73[(1'h1):(1'h0)]});
      if ((wire71 ? (~|wire72[(3'h7):(2'h2)]) : {wire71[(4'hc):(2'h2)]}))
        begin
          reg77 <= (|(wire73 ? (8'hb1) : reg76));
          reg78 <= ((&reg77[(3'h5):(3'h5)]) <= wire72[(3'h4):(3'h4)]);
          reg79 <= {$unsigned((reg77 == (wire71[(4'hc):(4'hb)] >> wire73[(3'h4):(2'h3)])))};
        end
      else
        begin
          reg77 <= wire74[(4'h8):(3'h5)];
          if ($unsigned((wire75 > (reg79 >> (~^$unsigned(wire73))))))
            begin
              reg78 <= {($unsigned(reg77[(3'h4):(2'h2)]) ?
                      wire75[(3'h5):(1'h1)] : (($unsigned((8'ha1)) ?
                          (reg76 >> reg78) : wire73) >> ((wire73 << reg77) <= wire75[(4'ha):(3'h5)])))};
            end
          else
            begin
              reg78 <= (~&($unsigned({$unsigned(reg76)}) <<< (((^(7'h40)) ?
                  wire72 : (reg76 != reg77)) != $signed((~|reg79)))));
              reg79 <= wire73[(1'h0):(1'h0)];
              reg80 <= (reg77[(3'h6):(1'h1)] || ({({wire72, reg79} ?
                      wire73 : (~&wire71)),
                  {wire74}} == (({(8'hba)} || {(8'hb8)}) | $unsigned($unsigned(wire71)))));
            end
          reg81 <= {(wire75 ?
                  $unsigned(((wire73 >= wire74) ?
                      (reg78 && (8'hab)) : ((8'ha2) ?
                          reg76 : wire71))) : (+(8'ha0))),
              ((((wire75 ? reg76 : reg78) << {(7'h44)}) ? wire75 : (7'h42)) ?
                  (reg79[(4'ha):(1'h1)] ?
                      (~&(wire73 ?
                          wire72 : wire71)) : $signed(wire75[(2'h2):(1'h0)])) : reg76[(1'h1):(1'h0)])};
        end
      reg82 <= reg80;
      reg83 <= wire71;
    end
  assign wire84 = $signed(reg82);
  always
    @(posedge clk) begin
      reg85 <= $signed($unsigned(reg77[(2'h3):(1'h1)]));
    end
  assign wire86 = (~$unsigned($signed(wire84[(3'h4):(3'h4)])));
  assign wire87 = (reg81[(5'h10):(4'hf)] << reg80[(2'h2):(2'h2)]);
  assign wire88 = wire71[(3'h4):(3'h4)];
  assign wire89 = $unsigned(({{(wire71 << wire86), wire72[(4'hc):(3'h7)]},
                      $signed({reg77})} || ({(reg80 <= reg77),
                          reg80[(2'h3):(1'h1)]} ?
                      ($unsigned(wire88) ?
                          $signed((8'ha3)) : ((8'hb9) * (8'hb4))) : $signed((~^wire72)))));
  always
    @(posedge clk) begin
      reg90 <= reg76[(3'h5):(2'h3)];
      if ({reg83[(3'h6):(3'h5)], (~|$unsigned(reg81[(2'h3):(2'h2)]))})
        begin
          reg91 <= {(^~wire74[(1'h1):(1'h1)])};
          reg92 <= wire75;
          reg93 <= wire75;
        end
      else
        begin
          reg91 <= (reg79 ?
              $unsigned(reg93[(3'h5):(2'h3)]) : ((!($signed(reg90) >> (^~(8'hb6)))) ?
                  wire71 : $unsigned(wire75)));
          reg92 <= wire88[(2'h3):(1'h1)];
        end
      reg94 <= $signed((wire75[(1'h0):(1'h0)] ^ $signed(wire75[(1'h0):(1'h0)])));
    end
  assign wire95 = reg85[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ((^~(~$signed(reg76))))
        begin
          reg96 <= ($signed($unsigned(reg79[(2'h3):(1'h0)])) << {$signed(((reg94 * (8'hab)) ?
                  {reg82, (8'hbc)} : reg80[(1'h1):(1'h0)])),
              ((8'hab) < $unsigned($unsigned(reg85)))});
        end
      else
        begin
          reg96 <= $unsigned(wire71[(3'h5):(3'h4)]);
          if (((($signed((!wire95)) ^~ ($signed(wire87) ?
              $unsigned((8'ha0)) : (8'hbf))) ^~ wire84) == wire89[(3'h4):(1'h0)]))
            begin
              reg97 <= ((reg78 <<< (($signed(wire86) ?
                      (reg85 ? (8'haa) : reg81) : reg92[(3'h6):(1'h1)]) ?
                  ((|reg83) ? $signed((8'hb1)) : (wire95 >>> wire84)) : {wire84,
                      (^~(8'hae))})) == reg92[(3'h5):(2'h3)]);
              reg98 <= $signed(reg81);
              reg99 <= ($unsigned($unsigned($unsigned(((8'hb3) ?
                  wire75 : reg91)))) <= wire87);
            end
          else
            begin
              reg97 <= {(-wire73), $signed(reg99[(5'h11):(4'h8)])};
              reg98 <= $unsigned(reg90);
              reg99 <= ($unsigned((~((reg77 & reg76) ?
                  reg91[(3'h4):(2'h3)] : reg97[(1'h0):(1'h0)]))) ^~ ((wire87 <= $unsigned((^wire74))) ~^ (|($signed(wire95) ?
                  $signed(reg82) : (reg90 <<< reg90)))));
            end
          reg100 <= reg83[(3'h7):(3'h7)];
          reg101 <= (($unsigned((8'ha7)) ^ ((~(reg91 * wire74)) ?
                  {(~|wire72), reg98[(4'hb):(4'h9)]} : reg92)) ?
              (~^$unsigned((^~$unsigned(wire73)))) : (!reg80[(4'ha):(3'h7)]));
          reg102 <= wire75;
        end
      reg103 <= (&reg77[(3'h4):(1'h1)]);
      reg104 <= ((~&reg101[(3'h7):(3'h7)]) ?
          (&wire89[(3'h5):(3'h4)]) : $signed({{((8'hb7) ? (8'hb6) : wire95),
                  reg85}}));
      reg105 <= ((7'h41) <<< (((+(~reg98)) ?
          wire75[(4'h8):(1'h1)] : (reg96[(1'h0):(1'h0)] <= (reg93 >> wire75))) < reg90));
    end
  assign wire106 = (8'hbe);
  assign wire107 = reg93;
  always
    @(posedge clk) begin
      reg108 <= ((|(wire87[(4'h8):(3'h5)] ?
          ($signed(wire89) ?
              (reg92 ? (8'hba) : reg76) : {wire73, wire88}) : {((8'hb3) ?
                  reg90 : reg78),
              reg104[(3'h5):(1'h0)]})) >>> $signed({(wire107[(5'h11):(3'h7)] ?
              (reg96 ? reg93 : reg103) : (reg96 ? (8'hb3) : reg94)),
          reg83}));
      reg109 <= ($signed($unsigned((((8'ha6) ? reg97 : wire106) || {wire87}))) ?
          (+{reg96,
              ((reg83 ?
                  wire106 : wire95) ~^ $signed(reg91))}) : $unsigned(($unsigned(reg79) | ((reg90 ?
                  reg98 : reg81) ?
              (-reg103) : (~&(8'h9c))))));
    end
endmodule

module module44
#(parameter param66 = ((((~|(&(8'ha8))) - (~&((8'ha9) ? (8'hbb) : (8'hb4)))) >> (!((-(7'h43)) <= (&(8'had))))) ? (((((8'hba) ? (8'h9c) : (8'hb4)) ? ((8'ha4) ? (8'h9f) : (8'hb0)) : {(8'hb2)}) >= ((~^(8'ha7)) >> ((8'hab) + (7'h41)))) ? ((8'hbf) ? ((~^(8'ha9)) ? (&(8'hbb)) : (~|(8'h9c))) : (|((8'haf) ? (8'ha0) : (8'hbe)))) : ((+((8'ha6) != (8'ha5))) - {((8'hbe) ? (8'hb8) : (8'ha1)), (+(8'hbd))})) : ((({(8'hab), (8'ha8)} ^~ (8'hbc)) >= (((8'hab) ? (8'ha4) : (8'hbb)) ? (~|(8'haa)) : (^(7'h41)))) ? (^~(((8'ha1) || (8'hbe)) + ((8'hb2) << (8'ha2)))) : {{{(8'ha0), (8'hb3)}}})))
(y, clk, wire49, wire48, wire47, wire46, wire45);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire49;
  input wire signed [(4'hd):(1'h0)] wire48;
  input wire signed [(5'h10):(1'h0)] wire47;
  input wire signed [(4'ha):(1'h0)] wire46;
  input wire [(4'hf):(1'h0)] wire45;
  wire [(4'hf):(1'h0)] wire60;
  wire [(5'h13):(1'h0)] wire59;
  wire [(5'h15):(1'h0)] wire58;
  wire signed [(3'h4):(1'h0)] wire57;
  reg [(3'h4):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg61 = (1'h0);
  reg [(5'h12):(1'h0)] reg56 = (1'h0);
  reg [(5'h14):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg52 = (1'h0);
  reg [(2'h3):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire46)
        begin
          reg50 <= ((8'hbc) ?
              wire46[(4'h8):(3'h5)] : ((-($unsigned(wire46) ?
                  (wire46 ?
                      wire47 : wire47) : (wire45 >> wire49))) && (-wire46)));
          reg51 <= (8'hbb);
          reg52 <= $signed((^wire46));
          if (wire47[(2'h3):(2'h2)])
            begin
              reg53 <= (~&$signed($signed(reg51)));
              reg54 <= wire46[(3'h4):(2'h2)];
              reg55 <= (reg54 >> (8'h9f));
            end
          else
            begin
              reg53 <= $unsigned((!($signed(reg53[(3'h4):(3'h4)]) ~^ ((|wire45) ?
                  reg53[(2'h2):(1'h0)] : $signed(wire45)))));
              reg54 <= {(($signed(reg50[(1'h1):(1'h0)]) <= $signed(wire46)) < (~&reg55[(2'h2):(1'h0)]))};
              reg55 <= ((8'ha5) ?
                  ($unsigned(wire49) ?
                      (~wire47[(4'ha):(4'ha)]) : {$unsigned({wire49,
                              wire47})}) : reg53);
            end
          reg56 <= reg50;
        end
      else
        begin
          reg50 <= ($unsigned((~reg53)) ?
              (reg54[(2'h3):(2'h3)] ?
                  (!(wire48 | wire47)) : {(^{reg52}),
                      ((!wire48) || wire47)}) : $unsigned((($unsigned(reg50) >> $signed(reg56)) >> {reg54,
                  (reg52 ? wire46 : (7'h44))})));
        end
    end
  assign wire57 = reg55;
  assign wire58 = $unsigned($signed((^$unsigned($signed(wire45)))));
  assign wire59 = wire49;
  assign wire60 = (~&$signed(($unsigned($signed(wire46)) ?
                      (((8'ha0) ?
                          reg52 : reg54) >> $unsigned((8'ha6))) : wire45[(4'hb):(3'h7)])));
  always
    @(posedge clk) begin
      reg61 <= reg55[(4'ha):(1'h1)];
      reg62 <= ((reg55[(1'h0):(1'h0)] <<< ($signed($unsigned(reg54)) ?
          reg51[(1'h1):(1'h1)] : (+$unsigned(wire58)))) & ((({reg52} ?
              (+reg53) : wire59) >> ({(8'hb7), (8'haa)} != (-reg56))) ?
          {$unsigned((reg52 ?
                  wire58 : wire58))} : $unsigned((~|$unsigned(reg51)))));
      reg63 <= ((~&(~^((wire59 != (8'hbe)) == reg55[(2'h3):(2'h2)]))) ?
          reg56 : ((+{reg56, $signed(wire46)}) ? reg51 : (~$signed((7'h43)))));
      reg64 <= $signed($unsigned($unsigned($signed(wire59[(1'h1):(1'h0)]))));
      reg65 <= (reg53[(4'ha):(3'h7)] | $signed($signed({wire60[(3'h4):(2'h2)],
          (8'hb5)})));
    end
endmodule
