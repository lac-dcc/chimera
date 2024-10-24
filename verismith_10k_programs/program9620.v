module top
#(parameter param187 = {((&((8'haa) ? {(8'hb6)} : (!(8'hb7)))) > ((+(~(8'h9f))) ^~ (!(8'ha4))))})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire3;
  wire signed [(4'he):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire174;
  wire [(4'hd):(1'h0)] wire176;
  wire [(5'h10):(1'h0)] wire177;
  wire signed [(4'hc):(1'h0)] wire178;
  wire [(4'hd):(1'h0)] wire179;
  wire signed [(3'h7):(1'h0)] wire180;
  wire [(5'h14):(1'h0)] wire181;
  wire [(3'h6):(1'h0)] wire182;
  wire signed [(4'hf):(1'h0)] wire183;
  wire [(4'ha):(1'h0)] wire184;
  wire signed [(5'h14):(1'h0)] wire185;
  assign y = {wire4,
                 wire5,
                 wire174,
                 wire176,
                 wire177,
                 wire178,
                 wire179,
                 wire180,
                 wire181,
                 wire182,
                 wire183,
                 wire184,
                 wire185,
                 (1'h0)};
  assign wire4 = wire3[(2'h3):(1'h0)];
  assign wire5 = $unsigned((-$signed($signed((~&wire1)))));
  module6 #() modinst175 (wire174, clk, wire2, wire4, wire3, wire1);
  assign wire176 = wire3[(3'h5):(1'h0)];
  assign wire177 = $signed($unsigned($unsigned($signed(wire3))));
  assign wire178 = (~^(~^(-$unsigned($unsigned(wire174)))));
  assign wire179 = ((~|(|wire5)) != $unsigned($signed(wire174)));
  assign wire180 = (wire5 >= $signed(((!(wire1 ?
                       wire2 : wire2)) - $unsigned(wire0[(2'h2):(1'h1)]))));
  assign wire181 = $unsigned(wire5);
  assign wire182 = wire178[(4'hb):(3'h5)];
  assign wire183 = (($signed((~&{wire2})) && wire5) && (~(wire182 ?
                       (wire176 != (!wire178)) : (^(~&(8'hb8))))));
  assign wire184 = wire176;
  module111 #() modinst186 (wire185, clk, wire2, wire182, wire183, wire5, wire184);
endmodule

module module6
#(parameter param172 = (~^(~&((|(&(8'hbd))) ? (((8'hb9) ? (8'h9f) : (8'hb7)) ? (!(8'hb7)) : ((8'hae) ^~ (8'h9c))) : (~&{(8'hb5)})))), 
parameter param173 = (((param172 ? ((param172 ? param172 : param172) ^ ((8'haf) ? param172 : param172)) : (|(param172 < param172))) != (((param172 ? param172 : param172) ? (param172 != param172) : ((8'hb1) >= param172)) * ((~param172) && (param172 ? param172 : param172)))) ? {((^~{param172}) ? (~&param172) : ({param172} * {param172}))} : ((^(param172 ? (param172 ~^ param172) : {param172})) ? ((((8'hb2) ? (8'hb5) : param172) ? (~|(8'hbf)) : param172) >>> ((param172 ? param172 : param172) <<< param172)) : (&(!(^(8'hb4)))))))
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h24c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire7;
  input wire signed [(4'he):(1'h0)] wire8;
  input wire [(4'he):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire10;
  wire [(4'ha):(1'h0)] wire170;
  wire [(4'he):(1'h0)] wire169;
  wire signed [(5'h12):(1'h0)] wire167;
  wire [(3'h4):(1'h0)] wire154;
  wire [(4'h9):(1'h0)] wire153;
  wire signed [(4'h8):(1'h0)] wire152;
  wire [(5'h15):(1'h0)] wire126;
  wire [(5'h12):(1'h0)] wire109;
  wire signed [(3'h5):(1'h0)] wire107;
  wire [(5'h14):(1'h0)] wire11;
  wire [(4'hd):(1'h0)] wire35;
  wire [(5'h14):(1'h0)] wire37;
  wire [(4'hf):(1'h0)] wire38;
  wire [(4'hd):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire87;
  reg signed [(5'h12):(1'h0)] reg151 = (1'h0);
  reg [(3'h6):(1'h0)] reg150 = (1'h0);
  reg [(5'h15):(1'h0)] reg149 = (1'h0);
  reg [(5'h15):(1'h0)] reg148 = (1'h0);
  reg [(5'h12):(1'h0)] reg147 = (1'h0);
  reg [(5'h11):(1'h0)] reg146 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg145 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg143 = (1'h0);
  reg [(4'hb):(1'h0)] reg142 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg140 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg137 = (1'h0);
  reg [(2'h2):(1'h0)] reg136 = (1'h0);
  reg [(3'h4):(1'h0)] reg135 = (1'h0);
  reg [(4'hd):(1'h0)] reg134 = (1'h0);
  reg [(5'h11):(1'h0)] reg133 = (1'h0);
  reg [(4'ha):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg89 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg90 = (1'h0);
  reg [(5'h11):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg92 = (1'h0);
  reg [(5'h11):(1'h0)] reg93 = (1'h0);
  reg [(2'h3):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg95 = (1'h0);
  reg [(5'h12):(1'h0)] reg110 = (1'h0);
  assign y = {wire170,
                 wire169,
                 wire167,
                 wire154,
                 wire153,
                 wire152,
                 wire126,
                 wire109,
                 wire107,
                 wire11,
                 wire35,
                 wire37,
                 wire38,
                 wire39,
                 wire87,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
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
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 reg95,
                 reg110,
                 (1'h0)};
  assign wire11 = ((^~wire9[(2'h3):(1'h0)]) && $signed(($signed((~(7'h43))) ~^ ((wire10 ?
                      (8'hb1) : wire9) >> $unsigned(wire7)))));
  module12 #() modinst36 (.wire14(wire10), .wire16(wire7), .wire15(wire11), .clk(clk), .y(wire35), .wire13(wire9));
  assign wire37 = $unsigned($unsigned(($signed($unsigned(wire11)) ?
                      {(8'haa)} : wire8[(1'h1):(1'h0)])));
  assign wire38 = ({$unsigned($unsigned((~|wire35))),
                      {wire37}} && ($signed(wire11[(4'h8):(3'h5)]) <= ((wire35[(2'h2):(1'h0)] ?
                      (wire8 ? wire35 : wire35) : wire11) | (~^wire11))));
  assign wire39 = wire38[(3'h4):(1'h0)];
  module40 #() modinst88 (.wire43(wire7), .wire44(wire35), .wire42(wire10), .wire41(wire8), .y(wire87), .wire45(wire38), .clk(clk));
  always
    @(posedge clk) begin
      reg89 <= (8'h9e);
      reg90 <= $signed((&$unsigned(wire10[(5'h14):(3'h7)])));
      reg91 <= wire87;
      reg92 <= ($unsigned($signed(reg91[(2'h3):(1'h0)])) == ((+$unsigned(((8'hba) <<< wire9))) ?
          $unsigned(((wire35 && wire87) ?
              $signed((8'ha4)) : wire39[(3'h7):(2'h2)])) : (((!(8'hb3)) ?
              wire11 : wire7[(3'h7):(3'h5)]) >> (wire87 - $signed(reg90)))));
    end
  always
    @(posedge clk) begin
      reg93 <= (~|$signed($signed($unsigned((wire38 ? wire39 : (8'h9e))))));
      reg94 <= $signed((wire87 * $signed((~^wire9))));
    end
  always
    @(posedge clk) begin
      reg95 <= (|(^{(&(&reg93)),
          ((^~wire39) ? $unsigned(wire39) : (-wire38))}));
    end
  module96 #() modinst108 (wire107, clk, reg91, reg92, wire10, wire8);
  assign wire109 = (~&reg91);
  always
    @(posedge clk) begin
      reg110 <= ($signed(wire107) || wire7[(3'h6):(3'h5)]);
    end
  module111 #() modinst127 (.wire116(wire10), .wire112(wire9), .wire115(reg91), .y(wire126), .wire114(wire109), .wire113(wire8), .clk(clk));
  always
    @(posedge clk) begin
      reg128 <= ($signed((+(7'h40))) ?
          reg95 : (((-$signed(reg110)) ^ wire38) - reg90[(1'h0):(1'h0)]));
      reg129 <= (~|((^~$unsigned((reg91 ? reg94 : (8'ha5)))) >> (((wire10 ?
              wire126 : reg90) << (reg89 <<< reg89)) ?
          (+$signed(wire9)) : $signed(reg91))));
      reg130 <= (|$unsigned((reg91[(4'ha):(2'h2)] != ((~reg129) + {wire87,
          (8'hb3)}))));
      if ((reg91[(2'h3):(2'h3)] & (&((-$unsigned(wire126)) ?
          $unsigned({wire38}) : ({(7'h40), wire39} != $signed(wire38))))))
        begin
          reg131 <= reg89[(1'h0):(1'h0)];
          reg132 <= wire87;
          reg133 <= (~^({reg92[(4'hb):(3'h6)],
              ((8'ha0) ?
                  reg129[(1'h0):(1'h0)] : (wire109 & wire11))} ~^ reg94[(2'h3):(1'h0)]));
          reg134 <= (~((~(reg92[(4'hb):(3'h5)] > $signed(wire87))) ?
              $signed(((reg91 + (8'ha1)) <= reg94[(2'h3):(2'h3)])) : $unsigned(wire38[(4'hd):(4'ha)])));
        end
      else
        begin
          reg131 <= wire39;
          if (wire126[(1'h0):(1'h0)])
            begin
              reg132 <= reg91;
              reg133 <= $signed({$signed($unsigned($unsigned(reg94))),
                  ($signed($unsigned(wire8)) != ((^wire8) && reg133[(1'h1):(1'h1)]))});
              reg134 <= reg132[(2'h3):(2'h2)];
              reg135 <= $signed($signed((!(reg110[(3'h4):(1'h1)] ~^ reg110))));
            end
          else
            begin
              reg132 <= (wire35[(3'h4):(3'h4)] * $signed((~&(wire9[(3'h7):(3'h7)] + (8'ha2)))));
              reg133 <= ($signed($signed(((~|reg134) ? (-(8'hbb)) : reg92))) ?
                  $signed((~|{$unsigned(wire87),
                      (^(8'ha3))})) : (^~$unsigned(reg129[(2'h3):(2'h3)])));
              reg134 <= reg91[(4'hd):(3'h7)];
              reg135 <= (~&reg93[(3'h6):(1'h1)]);
              reg136 <= $signed((reg93[(4'he):(4'hd)] ?
                  (8'ha8) : reg129[(2'h3):(2'h3)]));
            end
          reg137 <= $unsigned((^(((~(8'hbb)) || (-wire8)) + ($signed(wire10) + wire39))));
          reg138 <= reg93[(4'h9):(2'h3)];
          reg139 <= $unsigned($signed((!(~^(reg128 >= (8'ha4))))));
        end
      if (reg93[(4'ha):(3'h7)])
        begin
          reg140 <= reg137;
          reg141 <= (wire126[(5'h10):(2'h3)] * reg133);
          reg142 <= wire11;
        end
      else
        begin
          reg140 <= (^(7'h42));
          reg141 <= ((~&(reg93 ?
                  ((-(8'hbe)) <= (~^wire107)) : reg137[(2'h3):(1'h1)])) ?
              ((({reg110, (8'hb1)} + (wire87 ?
                  wire107 : reg94)) << $unsigned((reg140 * reg128))) ^~ {$signed((&(8'ha0)))}) : ((&{wire9,
                      (^(8'h9e))}) ?
                  (((^reg110) ? reg131 : $signed((8'hb0))) ?
                      $signed({reg94}) : $signed((wire39 ?
                          reg142 : wire11))) : ($signed($signed(reg132)) || ($unsigned(reg90) || (reg141 ?
                      wire38 : reg138)))));
          if (wire9[(2'h2):(1'h1)])
            begin
              reg142 <= $unsigned({$unsigned({$signed(reg129)}),
                  {{(reg128 ? wire37 : (8'haa))}, $signed($unsigned(reg135))}});
              reg143 <= ($signed(reg136) ^~ ((wire7[(3'h5):(2'h2)] ?
                  (|reg134[(3'h4):(1'h0)]) : reg141[(3'h5):(3'h4)]) && reg139));
              reg144 <= $unsigned(($signed((reg133 ?
                      (wire37 & reg95) : (reg136 ? reg129 : wire9))) ?
                  ($signed(wire38[(4'h9):(3'h6)]) || (~&reg133[(3'h7):(2'h3)])) : wire37));
              reg145 <= reg95;
            end
          else
            begin
              reg142 <= $unsigned(wire8);
              reg143 <= (8'ha7);
              reg144 <= $unsigned({reg128});
              reg145 <= $unsigned(($unsigned((^(+(8'hb1)))) ?
                  $unsigned(reg94) : $unsigned((wire107 ?
                      $unsigned(reg134) : reg138[(1'h1):(1'h1)]))));
            end
          if ((^~(~wire35[(4'hd):(4'h8)])))
            begin
              reg146 <= wire109;
              reg147 <= ((-{reg95,
                  (((8'hb2) ? reg90 : (8'hbe)) ?
                      reg93 : (reg90 ?
                          wire126 : (8'ha1)))}) - $unsigned(wire35[(3'h4):(1'h0)]));
              reg148 <= (($signed(wire11[(5'h10):(4'h9)]) >> $signed(($unsigned(reg134) < $signed(reg129)))) < reg145);
              reg149 <= (8'hb4);
              reg150 <= $signed({{(wire37[(3'h4):(2'h2)] ?
                          reg149 : (wire35 != reg132)),
                      $signed(reg136[(1'h1):(1'h0)])},
                  $unsigned(reg95)});
            end
          else
            begin
              reg146 <= $signed((reg138[(1'h0):(1'h0)] ?
                  (+(-wire126[(2'h2):(1'h1)])) : reg133));
              reg147 <= wire38;
              reg148 <= $unsigned(wire109);
              reg149 <= {$unsigned((~^wire37[(4'hf):(4'ha)]))};
            end
          reg151 <= ($unsigned((!reg146[(2'h3):(1'h1)])) ?
              (~^$unsigned(((+wire107) == (reg136 ?
                  reg147 : reg110)))) : $signed((reg135 ?
                  reg136 : $unsigned(reg134))));
        end
    end
  assign wire152 = (reg148 ?
                       reg151[(3'h5):(3'h5)] : ((wire8[(4'hc):(4'hb)] + ((reg148 ?
                                   wire7 : (8'haa)) ?
                               {reg89} : reg95)) ?
                           reg139 : {(~^(+reg134)), reg89[(1'h0):(1'h0)]}));
  assign wire153 = reg90[(2'h2):(1'h1)];
  assign wire154 = (($signed($signed((!(8'hab)))) > ((reg149 ?
                           $unsigned(reg93) : ((8'ha6) <= reg138)) < ((reg151 ?
                               (8'h9d) : reg146) ?
                           {reg136, reg143} : (~&reg144)))) ?
                       (7'h44) : (~($unsigned((~&reg146)) ?
                           ($signed(reg147) ?
                               (reg90 || reg139) : (wire152 ?
                                   reg137 : reg90)) : {(reg143 ?
                                   wire107 : wire10)})));
  module155 #() modinst168 (wire167, clk, reg129, reg141, reg110, reg89);
  assign wire169 = (^(reg148[(3'h7):(1'h0)] ?
                       $signed((^(|reg133))) : reg135[(3'h4):(1'h1)]));
  module12 #() modinst171 (wire170, clk, wire126, wire87, reg143, reg92);
endmodule

module module155  (y, clk, wire159, wire158, wire157, wire156);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire159;
  input wire [(4'ha):(1'h0)] wire158;
  input wire signed [(3'h6):(1'h0)] wire157;
  input wire [(5'h12):(1'h0)] wire156;
  wire [(4'hc):(1'h0)] wire162;
  wire [(3'h7):(1'h0)] wire161;
  wire signed [(4'h8):(1'h0)] wire160;
  reg signed [(5'h11):(1'h0)] reg166 = (1'h0);
  reg [(3'h4):(1'h0)] reg165 = (1'h0);
  reg [(3'h7):(1'h0)] reg164 = (1'h0);
  reg [(5'h14):(1'h0)] reg163 = (1'h0);
  assign y = {wire162,
                 wire161,
                 wire160,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 (1'h0)};
  assign wire160 = ($signed({$unsigned(wire156),
                       wire156}) != ((8'ha8) == {{{wire159, wire157}},
                       ((8'hae) != (wire156 ^ wire156))}));
  assign wire161 = ($signed($signed(wire159[(3'h5):(3'h5)])) ?
                       (8'hbd) : ($signed($unsigned({wire157, wire157})) ?
                           ($unsigned(wire158) ?
                               (~^{wire157}) : ($signed(wire158) ?
                                   wire157 : ((8'ha9) ^~ wire159))) : {$signed($signed(wire158))}));
  assign wire162 = $signed((8'haf));
  always
    @(posedge clk) begin
      reg163 <= $signed((~^wire160[(4'h8):(2'h3)]));
      reg164 <= $unsigned((~|$signed($unsigned($signed(wire160)))));
      reg165 <= wire162[(1'h1):(1'h0)];
      reg166 <= wire156[(3'h4):(1'h0)];
    end
endmodule

module module111  (y, clk, wire116, wire115, wire114, wire113, wire112);
  output wire [(32'h6a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire116;
  input wire signed [(3'h4):(1'h0)] wire115;
  input wire signed [(4'hf):(1'h0)] wire114;
  input wire signed [(4'he):(1'h0)] wire113;
  input wire [(4'ha):(1'h0)] wire112;
  wire signed [(3'h4):(1'h0)] wire125;
  wire signed [(4'ha):(1'h0)] wire124;
  wire signed [(3'h7):(1'h0)] wire123;
  wire signed [(5'h15):(1'h0)] wire122;
  wire signed [(4'ha):(1'h0)] wire121;
  wire [(4'he):(1'h0)] wire120;
  wire signed [(5'h13):(1'h0)] wire119;
  wire signed [(4'he):(1'h0)] wire118;
  wire [(3'h6):(1'h0)] wire117;
  assign y = {wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 (1'h0)};
  assign wire117 = $unsigned(wire116);
  assign wire118 = ($signed((8'ha0)) ?
                       wire113[(3'h5):(2'h2)] : wire112[(4'h9):(3'h7)]);
  assign wire119 = (-(~|(^(~|$unsigned(wire115)))));
  assign wire120 = wire114[(3'h5):(1'h0)];
  assign wire121 = wire114[(1'h0):(1'h0)];
  assign wire122 = (8'hb7);
  assign wire123 = {(wire112[(2'h3):(2'h3)] < ((8'ha2) < wire120[(4'he):(4'he)]))};
  assign wire124 = wire121;
  assign wire125 = {($unsigned(wire116[(1'h1):(1'h0)]) | ($unsigned($unsigned((8'haa))) ?
                           (+(~wire122)) : ($unsigned(wire119) <= $unsigned(wire120))))};
endmodule

module module96  (y, clk, wire100, wire99, wire98, wire97);
  output wire [(32'h33):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire100;
  input wire signed [(5'h14):(1'h0)] wire99;
  input wire signed [(4'hf):(1'h0)] wire98;
  input wire signed [(4'ha):(1'h0)] wire97;
  wire [(4'ha):(1'h0)] wire106;
  wire [(3'h5):(1'h0)] wire105;
  wire [(4'ha):(1'h0)] wire104;
  wire [(4'h9):(1'h0)] wire102;
  wire signed [(4'hb):(1'h0)] wire101;
  reg [(3'h5):(1'h0)] reg103 = (1'h0);
  assign y = {wire106, wire105, wire104, wire102, wire101, reg103, (1'h0)};
  assign wire101 = wire100[(3'h7):(2'h3)];
  assign wire102 = wire99[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg103 <= (^(({wire100[(1'h0):(1'h0)],
              ((7'h40) >> (7'h41))} != ($signed(wire100) ?
              (~|wire98) : (wire101 >= wire99))) ?
          $unsigned($signed((wire102 < wire97))) : wire99));
    end
  assign wire104 = (+$signed(({((8'ha8) ? wire102 : wire102),
                       (~wire98)} - (~^(wire101 ? wire102 : wire102)))));
  assign wire105 = wire97[(4'h9):(1'h0)];
  assign wire106 = (~&(&wire101));
endmodule

module module40
#(parameter param86 = (~^(8'ha9)))
(y, clk, wire45, wire44, wire43, wire42, wire41);
  output wire [(32'h1dc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire45;
  input wire [(4'hd):(1'h0)] wire44;
  input wire [(2'h3):(1'h0)] wire43;
  input wire [(4'h8):(1'h0)] wire42;
  input wire [(4'hc):(1'h0)] wire41;
  wire [(2'h2):(1'h0)] wire85;
  wire [(5'h14):(1'h0)] wire84;
  wire [(5'h12):(1'h0)] wire73;
  wire [(5'h15):(1'h0)] wire72;
  wire [(4'h8):(1'h0)] wire71;
  wire signed [(5'h10):(1'h0)] wire69;
  wire signed [(5'h14):(1'h0)] wire68;
  wire [(5'h10):(1'h0)] wire67;
  wire signed [(5'h12):(1'h0)] wire64;
  wire signed [(4'hf):(1'h0)] wire63;
  wire signed [(4'hf):(1'h0)] wire51;
  wire signed [(4'h9):(1'h0)] wire50;
  wire signed [(3'h4):(1'h0)] wire47;
  wire [(5'h15):(1'h0)] wire46;
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg [(3'h4):(1'h0)] reg82 = (1'h0);
  reg [(4'hb):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg79 = (1'h0);
  reg [(4'hd):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg77 = (1'h0);
  reg [(3'h5):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg75 = (1'h0);
  reg [(4'hf):(1'h0)] reg74 = (1'h0);
  reg [(5'h12):(1'h0)] reg70 = (1'h0);
  reg [(4'hd):(1'h0)] reg66 = (1'h0);
  reg [(5'h11):(1'h0)] reg65 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg [(2'h3):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg [(4'hc):(1'h0)] reg59 = (1'h0);
  reg [(5'h12):(1'h0)] reg58 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg52 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg48 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire73,
                 wire72,
                 wire71,
                 wire69,
                 wire68,
                 wire67,
                 wire64,
                 wire63,
                 wire51,
                 wire50,
                 wire47,
                 wire46,
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
                 reg70,
                 reg66,
                 reg65,
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
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire46 = $unsigned((wire45[(1'h1):(1'h1)] ?
                      $signed((7'h42)) : $signed($unsigned((wire43 ?
                          wire42 : (8'hab))))));
  assign wire47 = wire42[(3'h6):(2'h2)];
  always
    @(posedge clk) begin
      reg48 <= {((wire47[(1'h0):(1'h0)] ?
              $unsigned($signed(wire46)) : $signed((wire44 && wire41))) << wire42[(3'h5):(1'h0)]),
          (wire45 < ((wire43 ?
              $unsigned(wire45) : $unsigned(wire44)) ~^ (8'ha8)))};
      reg49 <= ((8'hbb) ?
          (^~(wire44 + ((~(8'hb6)) ?
              {wire46} : $unsigned((8'ha4))))) : ((((wire47 ? wire43 : wire41) ?
                  $unsigned(wire42) : $unsigned(wire44)) ?
              wire47[(3'h4):(3'h4)] : ((wire46 ?
                  wire43 : (8'hb1)) ~^ (wire45 <= reg48))) <<< $signed($signed($signed(wire45)))));
    end
  assign wire50 = ((wire45 ?
                      wire42 : ({(~&(8'ha8))} * wire45)) * ((|$signed(wire45[(4'hf):(4'ha)])) ?
                      $signed($unsigned($signed(wire41))) : wire47[(2'h3):(2'h3)]));
  assign wire51 = wire41;
  always
    @(posedge clk) begin
      reg52 <= wire42;
      reg53 <= $signed({$unsigned((wire43[(1'h1):(1'h0)] < (wire41 <= wire51))),
          wire44[(4'h8):(1'h0)]});
      if ($unsigned($signed(($signed($signed((8'hb6))) * (reg52[(2'h3):(1'h0)] ?
          reg52 : (wire46 ? wire44 : reg48))))))
        begin
          reg54 <= wire45;
          reg55 <= (7'h41);
          reg56 <= wire46[(4'h9):(3'h5)];
        end
      else
        begin
          if (wire46[(1'h1):(1'h0)])
            begin
              reg54 <= wire46;
              reg55 <= wire43[(2'h2):(2'h2)];
            end
          else
            begin
              reg54 <= ((8'hb7) ? reg53 : wire51);
              reg55 <= (wire46[(4'h8):(3'h7)] <<< {($unsigned(wire47[(2'h3):(1'h1)]) & $unsigned(((7'h43) <= wire46)))});
              reg56 <= reg54[(4'h8):(4'h8)];
            end
          reg57 <= $unsigned(wire44[(4'h9):(3'h4)]);
          reg58 <= $unsigned(reg55);
          reg59 <= wire43[(2'h2):(1'h1)];
          reg60 <= wire42;
        end
      reg61 <= $unsigned($unsigned($unsigned(reg49)));
      reg62 <= $signed($unsigned(reg54));
    end
  assign wire63 = (|wire50);
  assign wire64 = (wire46[(5'h11):(5'h11)] ? reg53[(2'h2):(1'h1)] : (8'hbc));
  always
    @(posedge clk) begin
      reg65 <= $signed(reg62[(4'hf):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg66 <= $signed((!wire63[(1'h0):(1'h0)]));
    end
  assign wire67 = (~(~|{(!(reg53 ? wire45 : wire41)),
                      $signed($unsigned(wire44))}));
  assign wire68 = reg62;
  assign wire69 = $signed($unsigned((($signed(reg66) ?
                      ((8'h9f) ~^ wire42) : (~&wire45)) || (~&$unsigned((8'ha3))))));
  always
    @(posedge clk) begin
      reg70 <= $unsigned($unsigned($signed($signed((reg60 * reg60)))));
    end
  assign wire71 = reg59[(4'h9):(2'h3)];
  assign wire72 = (8'ha2);
  assign wire73 = wire64;
  always
    @(posedge clk) begin
      reg74 <= {($signed($signed((8'haa))) <= wire51)};
      if ((~|({(~^$signed(wire67))} && (+($unsigned(wire72) ?
          (|wire69) : (8'hb5))))))
        begin
          if ((wire50 ?
              ((8'hb9) > {(-wire71[(3'h4):(2'h3)]),
                  $unsigned($signed(wire43))}) : $signed((wire42[(1'h0):(1'h0)] ?
                  ($unsigned(reg52) << (reg56 ?
                      reg74 : reg65)) : $unsigned((wire51 ?
                      reg60 : (7'h43)))))))
            begin
              reg75 <= $unsigned(((7'h44) || ($signed(reg49) ^~ (&$unsigned(wire71)))));
              reg76 <= $signed({(^~$signed((~|(8'hbc))))});
              reg77 <= wire43[(2'h2):(2'h2)];
              reg78 <= (!((^~(7'h44)) ?
                  $unsigned(wire50) : (!$unsigned((wire63 ? reg52 : wire67)))));
              reg79 <= (reg52 ?
                  $signed((^{(reg48 && reg58),
                      wire64[(2'h3):(1'h0)]})) : (reg75[(1'h0):(1'h0)] <= wire73));
            end
          else
            begin
              reg75 <= $unsigned($unsigned(($signed(wire45[(1'h1):(1'h0)]) * (+reg59))));
              reg76 <= ({reg77[(3'h4):(2'h2)], reg53[(2'h3):(1'h0)]} ?
                  (^$signed(reg48[(4'h9):(4'h8)])) : wire44);
              reg77 <= ((((^~(wire41 ^~ reg61)) != $signed({reg56, reg55})) ?
                      ((-reg79) ?
                          wire67 : reg59[(4'ha):(3'h6)]) : $unsigned($signed(wire73))) ?
                  $unsigned($signed(($signed(reg70) & $signed((8'hbc))))) : (~^(+$unsigned((+reg79)))));
            end
          reg80 <= (8'hae);
        end
      else
        begin
          if (reg54[(4'h9):(2'h2)])
            begin
              reg75 <= (~((($unsigned(wire72) - $unsigned(wire46)) ^~ (reg65[(4'h8):(1'h0)] || (+(8'ha9)))) ?
                  wire42[(2'h2):(1'h0)] : ((reg65[(4'h9):(3'h7)] ?
                          wire46 : $unsigned(wire73)) ?
                      $signed(((8'hbf) ~^ wire63)) : {((8'haf) ? reg61 : reg53),
                          $unsigned(wire67)})));
              reg76 <= reg76;
            end
          else
            begin
              reg75 <= (((wire44[(1'h0):(1'h0)] ?
                          $unsigned((~|reg53)) : ($unsigned(wire46) ?
                              reg77 : $unsigned(wire71))) ?
                      (~^{wire51}) : $unsigned(reg49[(4'h9):(1'h0)])) ?
                  ($signed(($signed((8'haf)) ?
                      reg77 : (reg61 ?
                          wire51 : reg65))) != reg80[(4'hb):(3'h7)]) : (wire42 || reg48));
              reg76 <= $unsigned((~&wire43[(2'h3):(2'h3)]));
            end
          reg77 <= ((($signed($unsigned((8'hb0))) ?
                  (wire43 > (^reg59)) : {(8'hbb)}) ?
              reg57[(4'h9):(1'h0)] : ($unsigned((reg53 ?
                  reg77 : wire41)) || (^reg65))) >>> wire73);
          reg78 <= {($signed(reg76) ?
                  (($signed((8'haf)) ?
                          (reg58 ? reg62 : reg53) : $signed(reg78)) ?
                      reg57[(2'h3):(1'h1)] : ((wire73 ? wire67 : (8'hae)) ?
                          {reg79, wire42} : $signed(reg75))) : {{$signed(reg76),
                          $signed(wire63)},
                      $signed({reg70, reg57})}),
              ((({wire46,
                  (8'h9d)} ~^ $unsigned((7'h42))) >> (+(!wire72))) ^ wire67[(5'h10):(4'hc)])};
        end
      reg81 <= $signed(reg65);
      reg82 <= wire67;
      reg83 <= (8'hb7);
    end
  assign wire84 = reg75;
  assign wire85 = reg83[(2'h2):(2'h2)];
endmodule

module module12
#(parameter param34 = (^~((({(7'h43), (8'hbf)} + ((8'h9c) == (8'had))) <= (((8'ha3) ? (8'hbf) : (8'hb2)) > ((8'ha0) ? (8'hab) : (7'h44)))) ? {(8'hbc), ((8'hac) ? ((8'ha3) ? (7'h41) : (8'hbc)) : (7'h42))} : {(+((8'hab) ? (8'ha6) : (8'hbc))), ((8'hb1) ? (^~(8'had)) : ((8'hbb) * (8'hbd)))})))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'hcb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire16;
  input wire signed [(5'h14):(1'h0)] wire15;
  input wire [(5'h15):(1'h0)] wire14;
  input wire [(4'he):(1'h0)] wire13;
  wire [(3'h4):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire32;
  wire signed [(5'h12):(1'h0)] wire31;
  wire [(3'h7):(1'h0)] wire30;
  wire [(4'hb):(1'h0)] wire29;
  wire [(5'h15):(1'h0)] wire28;
  wire [(3'h4):(1'h0)] wire27;
  wire [(4'hb):(1'h0)] wire26;
  wire [(4'hd):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire24;
  wire signed [(4'h9):(1'h0)] wire18;
  wire [(5'h10):(1'h0)] wire17;
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire18,
                 wire17,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire17 = wire16;
  assign wire18 = ((7'h42) ?
                      wire16 : ($unsigned((wire13 ? (8'hbc) : (^~wire13))) ?
                          (&$signed((8'hbd))) : (~wire13[(4'he):(2'h2)])));
  always
    @(posedge clk) begin
      if ((!((wire18[(4'h8):(2'h3)] ?
          (^~$unsigned((8'ha9))) : wire16) >= wire17)))
        begin
          reg19 <= (wire15 ~^ $unsigned(((8'had) || (-(wire16 ?
              wire15 : (8'hb7))))));
          reg20 <= wire16;
          reg21 <= $signed((7'h41));
          reg22 <= $unsigned({wire16[(4'h9):(4'h8)],
              (reg19 ? (+reg19[(5'h11):(4'hd)]) : wire15)});
          reg23 <= (^wire16);
        end
      else
        begin
          reg19 <= (((((reg19 ? wire18 : wire13) & reg19) ?
                  wire15 : (-{reg20, (8'hb5)})) ?
              (|(&(^wire14))) : wire16[(3'h7):(1'h0)]) - reg20);
          if (($unsigned((~(~^(reg21 ? reg23 : reg19)))) ?
              (7'h41) : {$signed((7'h42))}))
            begin
              reg20 <= $unsigned(wire17);
              reg21 <= {wire14[(5'h14):(5'h12)],
                  ($signed($unsigned(((8'hb1) ? wire15 : (8'hab)))) ?
                      (^$signed(wire15[(4'h8):(1'h1)])) : wire18[(1'h1):(1'h0)])};
            end
          else
            begin
              reg20 <= wire15;
            end
          reg22 <= (~(&$unsigned({wire14, (reg21 ? wire14 : reg21)})));
        end
    end
  assign wire24 = (({{reg23[(3'h4):(3'h4)]},
                          $signed($unsigned((8'h9d)))} <<< (7'h43)) ?
                      wire17[(1'h0):(1'h0)] : $signed(wire18));
  assign wire25 = reg19[(2'h2):(1'h1)];
  assign wire26 = $unsigned($signed(wire24));
  assign wire27 = (-{wire13, (wire15 >> $signed(reg20))});
  assign wire28 = wire27[(2'h3):(1'h1)];
  assign wire29 = ((reg21[(1'h1):(1'h0)] * (|$signed({wire24}))) ?
                      wire17[(4'h9):(3'h6)] : ((8'hb4) || $signed($unsigned((reg20 ?
                          (8'ha2) : reg22)))));
  assign wire30 = (($unsigned((~(wire17 ~^ (7'h43)))) ~^ $unsigned(wire15)) * (~wire29[(3'h6):(1'h1)]));
  assign wire31 = (($unsigned({(reg19 ^ reg22), $signed(wire15)}) ?
                          ((~&wire24[(4'h9):(3'h7)]) >>> $unsigned({reg23})) : $unsigned($unsigned(((8'hbc) >= wire30)))) ?
                      reg19 : $unsigned(({((8'hb1) == wire16),
                          $signed(wire28)} ^ ($unsigned(wire13) ?
                          wire24[(3'h5):(1'h1)] : (7'h42)))));
  assign wire32 = {($signed(($unsigned(wire17) ?
                          reg23 : (wire13 == wire13))) >> ($signed((&(8'hae))) > $unsigned((wire31 == (8'hb4)))))};
  assign wire33 = reg23[(3'h4):(1'h0)];
endmodule
