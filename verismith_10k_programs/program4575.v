module top
#(parameter param178 = ({((8'ha1) ? ({(8'hb7)} > (~(8'hb0))) : {{(8'hb8)}}), (!(~|((8'ha3) ? (8'ha4) : (8'ha5))))} << (|(+((!(8'hb6)) < (&(8'hab)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire177;
  wire signed [(5'h13):(1'h0)] wire167;
  wire signed [(3'h5):(1'h0)] wire166;
  wire signed [(4'h8):(1'h0)] wire165;
  wire signed [(3'h7):(1'h0)] wire164;
  wire signed [(4'ha):(1'h0)] wire163;
  wire signed [(5'h12):(1'h0)] wire161;
  wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire4;
  reg signed [(5'h12):(1'h0)] reg176 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg175 = (1'h0);
  reg [(4'he):(1'h0)] reg174 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg173 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg171 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg170 = (1'h0);
  reg [(3'h7):(1'h0)] reg169 = (1'h0);
  reg signed [(4'he):(1'h0)] reg168 = (1'h0);
  assign y = {wire177,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire161,
                 wire6,
                 wire5,
                 wire4,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 (1'h0)};
  assign wire4 = $signed(((($unsigned(wire3) != $signed((8'ha3))) || (((8'ha4) ?
                         wire1 : wire0) ?
                     (&wire2) : $unsigned(wire2))) ^~ wire0));
  assign wire5 = wire2[(2'h2):(1'h0)];
  assign wire6 = wire0;
  module7 #() modinst162 (.wire8(wire5), .wire9(wire6), .wire11(wire1), .y(wire161), .wire10(wire4), .clk(clk));
  assign wire163 = (($signed(wire1[(4'he):(4'ha)]) - (wire3 ?
                       $unsigned(((8'hbb) ?
                           wire1 : (8'ha9))) : wire4[(4'h9):(3'h5)])) >>> wire4[(4'he):(2'h3)]);
  assign wire164 = {($unsigned((8'haf)) ?
                           ($signed((^wire5)) ?
                               ($signed(wire163) > (wire6 ?
                                   wire1 : wire4)) : $unsigned((wire6 + wire163))) : (wire0 ?
                               (+$unsigned(wire5)) : ((wire163 ^ wire6) & $signed(wire0))))};
  assign wire165 = $signed((^~wire2[(3'h4):(2'h2)]));
  assign wire166 = $signed(wire1);
  assign wire167 = ((~|wire163[(3'h4):(1'h1)]) ?
                       (wire4 ?
                           $signed((~|wire164[(3'h7):(3'h6)])) : (wire166 < wire166)) : $unsigned($unsigned($unsigned((wire6 ?
                           wire166 : wire163)))));
  always
    @(posedge clk) begin
      reg168 <= wire166[(3'h4):(1'h0)];
      if ({(-(~&$signed(wire5[(3'h5):(3'h4)])))})
        begin
          reg169 <= $signed(($unsigned(((^~wire5) >>> (wire167 ?
                  (8'hb4) : wire167))) ?
              (~^(~|wire1)) : $signed(wire164)));
          reg170 <= (|(($signed({wire166}) ?
              {(wire0 ?
                      (8'haf) : wire161)} : wire5) ~^ (~|wire165[(4'h8):(2'h2)])));
        end
      else
        begin
          reg169 <= $signed((|(~|(~&(wire3 ? wire163 : reg170)))));
          reg170 <= {(((wire166 << $signed((8'haf))) == {(~(7'h44)),
                      (wire167 ? wire165 : (8'ha7))}) ?
                  ((+$signed(wire163)) ?
                      ((reg168 ^ (8'hb1)) ?
                          $unsigned((8'hb0)) : (wire5 ?
                              wire167 : wire6)) : (&(wire6 && wire6))) : (reg168[(4'ha):(1'h1)] ?
                      (~&wire161) : ((wire164 ?
                          wire167 : wire3) && $unsigned(wire163))))};
          if (($signed(($signed(((8'ha7) ? wire3 : wire166)) ?
              $signed(reg168[(2'h3):(1'h1)]) : (wire4[(3'h6):(3'h5)] < {(8'hab)}))) >>> {({(8'ha2)} <<< $unsigned($unsigned(wire0)))}))
            begin
              reg171 <= {$unsigned(wire166),
                  {{(-(wire1 ? wire2 : (8'hbf))),
                          ((wire0 <<< reg169) >= $signed(reg170))},
                      wire164}};
              reg172 <= reg170[(1'h0):(1'h0)];
              reg173 <= $signed((~|wire164[(3'h5):(1'h1)]));
              reg174 <= $signed(wire0[(3'h7):(2'h3)]);
            end
          else
            begin
              reg171 <= wire0[(2'h3):(1'h1)];
            end
          reg175 <= wire167;
        end
      reg176 <= $unsigned((8'ha3));
    end
  assign wire177 = reg176;
endmodule

module module7
#(parameter param160 = ((^((((8'h9f) == (8'hb6)) ? (&(8'hb9)) : {(8'ha4)}) + ({(8'h9f)} << ((8'hb5) & (8'hbd))))) ? {((~^((8'ha4) ? (8'hb6) : (7'h43))) >= (+((8'hbe) ~^ (8'ha1)))), (({(8'hae), (8'hb8)} >> {(8'haa)}) >>> (|((8'hbe) && (8'hac))))} : ((!(((8'hbf) ? (8'haf) : (7'h40)) ? ((8'ha3) || (8'hbe)) : ((8'hb7) & (8'ha7)))) ? {{{(8'hb2), (8'hbd)}, (+(8'ha4))}} : (~&(^((8'ha4) ? (7'h42) : (8'ha9)))))))
(y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'h106):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire8;
  input wire [(2'h3):(1'h0)] wire9;
  input wire [(4'h8):(1'h0)] wire10;
  input wire signed [(5'h12):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire159;
  wire signed [(4'he):(1'h0)] wire158;
  wire [(5'h14):(1'h0)] wire69;
  wire signed [(5'h12):(1'h0)] wire71;
  wire [(4'hb):(1'h0)] wire72;
  wire [(3'h5):(1'h0)] wire73;
  wire signed [(5'h11):(1'h0)] wire156;
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  assign y = {wire159,
                 wire158,
                 wire69,
                 wire71,
                 wire72,
                 wire73,
                 wire156,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($unsigned((+$unsigned($signed(wire10)))) | (wire8 ?
          (~&(8'ha7)) : (8'ha6))))
        begin
          reg12 <= (wire10 ?
              (-((wire11[(1'h1):(1'h1)] && $unsigned(wire9)) ?
                  (-{wire10, wire9}) : $unsigned((wire9 ?
                      wire9 : wire8)))) : (8'hb2));
          reg13 <= wire11[(5'h11):(4'hd)];
          if (reg13[(2'h3):(1'h1)])
            begin
              reg14 <= $unsigned($unsigned(wire9));
            end
          else
            begin
              reg14 <= {wire11[(4'hd):(4'hc)], wire8};
              reg15 <= (8'ha3);
              reg16 <= ((($unsigned($signed(reg12)) ?
                  $signed({reg12}) : wire10) != wire10[(3'h4):(3'h4)]) - (~&(&(reg12[(2'h3):(2'h3)] - $unsigned(wire8)))));
              reg17 <= $unsigned({$signed(wire10[(4'h8):(3'h4)]),
                  (reg15 ?
                      reg15[(1'h0):(1'h0)] : ($signed((8'haf)) ?
                          $signed(wire9) : $signed(wire10)))});
              reg18 <= (^$signed(((8'hb7) ?
                  {reg17} : ((8'hb0) ? wire10 : $unsigned(reg17)))));
            end
          reg19 <= wire10[(3'h6):(3'h4)];
        end
      else
        begin
          if (($unsigned((~|reg17[(2'h2):(2'h2)])) ?
              ({reg18,
                  (&reg15)} & (~^reg13)) : (reg12[(2'h3):(2'h3)] * wire8[(3'h4):(1'h0)])))
            begin
              reg12 <= ((|$unsigned(reg16)) ?
                  ((reg19[(3'h7):(1'h0)] != ((+wire8) ?
                      $unsigned(wire10) : (7'h40))) < wire11[(5'h10):(2'h3)]) : reg12[(3'h5):(1'h0)]);
              reg13 <= (8'hae);
              reg14 <= reg15;
            end
          else
            begin
              reg12 <= reg19;
              reg13 <= reg12[(1'h1):(1'h1)];
              reg14 <= wire8[(1'h0):(1'h0)];
            end
        end
      if (wire10)
        begin
          reg20 <= wire11;
        end
      else
        begin
          if (($unsigned($signed((+{(7'h44),
              wire8}))) <<< ($unsigned(($signed(reg19) ?
              reg20 : {reg14,
                  reg15})) <= $signed($unsigned($unsigned(wire11))))))
            begin
              reg20 <= (($unsigned($unsigned((^~reg18))) ?
                  (8'hae) : ($unsigned((reg16 ?
                      (8'hb0) : reg17)) <= (8'h9c))) + reg20[(3'h5):(2'h2)]);
              reg21 <= {(wire8[(2'h3):(2'h2)] ?
                      wire9 : (reg16[(1'h0):(1'h0)] ^~ $signed($signed(reg12))))};
              reg22 <= reg14;
              reg23 <= reg17[(4'hf):(4'hb)];
              reg24 <= $signed((7'h42));
            end
          else
            begin
              reg20 <= reg14[(1'h1):(1'h0)];
              reg21 <= $signed((reg24[(4'h9):(1'h1)] <= (reg24[(4'ha):(3'h5)] << (~((8'hae) ?
                  reg19 : wire8)))));
              reg22 <= reg23;
            end
        end
      reg25 <= ({reg15[(2'h2):(1'h0)], (reg17 << reg16)} ?
          (!reg20) : reg17[(3'h5):(3'h5)]);
    end
  module26 #() modinst70 (wire69, clk, wire8, reg21, reg16, wire11);
  assign wire71 = {$unsigned((reg19 ?
                          wire69 : (((7'h43) ? reg25 : (8'hb8)) ?
                              (+reg21) : {reg15, (8'ha4)})))};
  assign wire72 = (reg21 ?
                      {$signed($signed((wire71 * wire11))),
                          $signed((wire11 ?
                              ((8'hae) | reg19) : ((8'ha7) ?
                                  reg13 : (8'ha1))))} : $signed($unsigned(reg21[(4'ha):(2'h3)])));
  assign wire73 = {$unsigned((wire72[(4'ha):(1'h0)] ?
                          $unsigned((-reg18)) : reg21))};
  module74 #() modinst157 (.wire77(wire71), .wire76(reg25), .y(wire156), .wire75(reg21), .clk(clk), .wire78(reg17));
  assign wire158 = $unsigned(((^~($unsigned(reg15) ?
                           $unsigned(reg13) : reg20[(3'h5):(1'h0)])) ?
                       $signed({(wire10 ^ wire8),
                           reg15}) : $signed($signed((-reg15)))));
  assign wire159 = {{(((wire71 ?
                               reg20 : (8'ha9)) != reg13) + (|$unsigned(reg21))),
                           (reg17 < ($signed(wire8) ?
                               reg13[(2'h3):(1'h1)] : $unsigned((7'h44))))},
                       (((8'ha0) ?
                           ($signed((7'h42)) ?
                               (~|(8'ha9)) : reg24) : (((8'ha1) > reg22) < reg18)) >> reg22)};
endmodule

module module74
#(parameter param155 = (8'ha4))
(y, clk, wire78, wire77, wire76, wire75);
  output wire [(32'h33d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire78;
  input wire [(4'hf):(1'h0)] wire77;
  input wire signed [(5'h14):(1'h0)] wire76;
  input wire [(4'ha):(1'h0)] wire75;
  wire [(5'h10):(1'h0)] wire154;
  wire signed [(4'h9):(1'h0)] wire153;
  wire [(3'h5):(1'h0)] wire152;
  wire signed [(4'he):(1'h0)] wire151;
  wire [(5'h14):(1'h0)] wire113;
  wire [(4'hc):(1'h0)] wire112;
  wire [(4'hb):(1'h0)] wire111;
  wire signed [(3'h5):(1'h0)] wire110;
  wire signed [(3'h6):(1'h0)] wire107;
  wire [(5'h11):(1'h0)] wire106;
  wire signed [(4'ha):(1'h0)] wire105;
  wire [(4'hc):(1'h0)] wire104;
  wire [(3'h7):(1'h0)] wire103;
  wire signed [(4'hd):(1'h0)] wire102;
  wire [(4'h9):(1'h0)] wire101;
  wire signed [(5'h14):(1'h0)] wire100;
  wire [(5'h12):(1'h0)] wire99;
  wire signed [(3'h7):(1'h0)] wire98;
  wire signed [(2'h2):(1'h0)] wire97;
  reg signed [(5'h13):(1'h0)] reg150 = (1'h0);
  reg [(5'h12):(1'h0)] reg149 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg148 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg143 = (1'h0);
  reg [(4'ha):(1'h0)] reg142 = (1'h0);
  reg [(4'h9):(1'h0)] reg141 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg140 = (1'h0);
  reg [(3'h7):(1'h0)] reg139 = (1'h0);
  reg [(2'h2):(1'h0)] reg138 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg137 = (1'h0);
  reg [(4'hb):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg135 = (1'h0);
  reg [(5'h15):(1'h0)] reg134 = (1'h0);
  reg [(3'h4):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg131 = (1'h0);
  reg [(4'hb):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg129 = (1'h0);
  reg [(4'h9):(1'h0)] reg128 = (1'h0);
  reg [(5'h11):(1'h0)] reg127 = (1'h0);
  reg signed [(4'he):(1'h0)] reg126 = (1'h0);
  reg [(3'h7):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg124 = (1'h0);
  reg [(4'h9):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg122 = (1'h0);
  reg [(4'hc):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg119 = (1'h0);
  reg [(2'h2):(1'h0)] reg118 = (1'h0);
  reg [(4'hf):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg116 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg115 = (1'h0);
  reg [(3'h7):(1'h0)] reg114 = (1'h0);
  reg signed [(4'he):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg108 = (1'h0);
  reg [(3'h4):(1'h0)] reg96 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg95 = (1'h0);
  reg [(4'hc):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg93 = (1'h0);
  reg [(4'h9):(1'h0)] reg92 = (1'h0);
  reg [(2'h3):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg90 = (1'h0);
  reg [(3'h6):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg88 = (1'h0);
  reg [(4'h8):(1'h0)] reg87 = (1'h0);
  reg [(4'hf):(1'h0)] reg86 = (1'h0);
  reg [(4'h8):(1'h0)] reg85 = (1'h0);
  reg [(5'h15):(1'h0)] reg84 = (1'h0);
  reg [(5'h15):(1'h0)] reg83 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(3'h6):(1'h0)] reg81 = (1'h0);
  reg [(5'h10):(1'h0)] reg80 = (1'h0);
  reg [(4'hf):(1'h0)] reg79 = (1'h0);
  assign y = {wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
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
                 reg109,
                 reg108,
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
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire77[(4'hc):(3'h4)] >>> $unsigned($signed({(8'ha5),
          wire76[(4'he):(4'h8)]}))))
        begin
          reg79 <= ({$unsigned($signed(wire77[(4'hf):(4'hc)])),
                  ($signed((8'hb5)) ?
                      wire76[(4'hd):(4'hb)] : ($unsigned((8'hb6)) << {wire78,
                          wire75}))} ?
              wire77[(3'h7):(3'h4)] : $signed($signed($unsigned((wire78 ?
                  wire76 : wire77)))));
          if ((wire78[(1'h1):(1'h0)] - $unsigned((wire75 | (-$unsigned(wire75))))))
            begin
              reg80 <= wire77;
              reg81 <= reg79[(4'hc):(3'h5)];
              reg82 <= reg79[(4'he):(4'hc)];
              reg83 <= $unsigned((reg82 || (~^$signed((~&wire77)))));
              reg84 <= $unsigned(wire76);
            end
          else
            begin
              reg80 <= wire77[(3'h5):(2'h2)];
              reg81 <= $unsigned($signed(reg82));
              reg82 <= $signed(reg84[(4'h8):(1'h1)]);
              reg83 <= $signed(wire77);
            end
          if ((wire76[(1'h0):(1'h0)] ^~ ({$signed(reg83[(4'he):(4'hd)]),
              (~&reg82)} | ($unsigned(reg79[(4'h9):(1'h1)]) <<< (-((8'haf) - reg82))))))
            begin
              reg85 <= $signed($signed($signed(($signed(reg79) ?
                  $unsigned((8'ha1)) : (+wire78)))));
              reg86 <= reg85;
              reg87 <= reg86[(4'h8):(3'h6)];
              reg88 <= ({(^((wire77 >= wire75) ~^ $unsigned(reg86))),
                  ($signed((reg83 >> reg80)) ?
                      ((reg83 >> wire76) ?
                          (~|reg85) : (wire75 ?
                              (7'h43) : reg80)) : $unsigned((8'hae)))} >> (8'hb9));
            end
          else
            begin
              reg85 <= $signed((^~$unsigned($unsigned((reg82 ?
                  reg81 : reg81)))));
              reg86 <= (((((reg82 | reg87) ^ $signed(wire77)) >> reg87) ?
                  reg84 : (reg82 ? reg79 : reg80)) < ((wire78 ?
                      reg84[(2'h3):(2'h2)] : {(~&(7'h40)),
                          (reg88 ? reg82 : wire75)}) ?
                  reg85 : reg79[(4'h8):(4'h8)]));
              reg87 <= {(~|((reg88 ? (wire76 ? wire78 : (8'ha9)) : wire75) ?
                      {$unsigned(reg87)} : (!(reg81 ? (7'h41) : (8'h9f))))),
                  $signed((-(!(!reg82))))};
            end
          reg89 <= (^$signed($signed((wire76 << {wire76, reg81}))));
          reg90 <= (~&$unsigned(((^~reg84) < ((^reg80) ?
              $unsigned((8'h9d)) : wire75))));
        end
      else
        begin
          reg79 <= $signed({({wire77[(4'ha):(1'h1)],
                  (reg90 >= reg79)} != (^{reg89, reg80}))});
          reg80 <= (+wire76[(1'h0):(1'h0)]);
        end
      if (({wire75[(3'h7):(1'h1)]} - reg86[(4'hd):(3'h5)]))
        begin
          reg91 <= $signed(((($unsigned((8'hbb)) + {reg82}) ?
              ($signed(reg85) ?
                  ((8'hb6) ?
                      wire78 : reg86) : reg80) : (^~(reg86 * reg88))) + ($signed((~wire76)) * reg86[(4'hc):(3'h4)])));
          reg92 <= ($signed(reg90) ?
              $signed(reg84[(4'h8):(2'h3)]) : wire75[(2'h3):(2'h2)]);
          reg93 <= (~^$signed($unsigned(reg80)));
          reg94 <= wire78[(1'h0):(1'h0)];
          reg95 <= $signed((~&$unsigned({(reg82 <= reg84)})));
        end
      else
        begin
          reg91 <= $unsigned($unsigned((reg83[(3'h5):(1'h1)] & reg80[(5'h10):(3'h5)])));
          reg92 <= (~&($unsigned(wire76[(4'he):(2'h3)]) ?
              ((~reg84[(5'h14):(5'h13)]) - {$signed(reg82),
                  {reg92}}) : reg92[(4'h9):(3'h6)]));
          reg93 <= $signed(((+(8'hb8)) ?
              $signed(reg94) : (reg94[(3'h5):(2'h3)] ?
                  reg81[(1'h1):(1'h1)] : $signed(reg92))));
          reg94 <= $signed(reg81);
        end
      reg96 <= ((&$unsigned((~|$unsigned(reg90)))) ?
          $unsigned((({reg82} ? $unsigned(reg86) : (wire77 || reg79)) ?
              (-(reg94 ? reg85 : reg87)) : (7'h43))) : reg82);
    end
  assign wire97 = {$unsigned((|(reg84 ^ (^wire78)))),
                      $signed($unsigned(reg96[(1'h1):(1'h1)]))};
  assign wire98 = reg83;
  assign wire99 = wire97;
  assign wire100 = reg93[(4'h8):(3'h5)];
  assign wire101 = $signed(((wire98[(2'h2):(2'h2)] ?
                           $unsigned({(8'ha5)}) : (~^$signed(reg82))) ?
                       (((8'hb9) ? $signed(reg85) : reg91) ?
                           {wire78} : ((~&reg82) & (8'ha1))) : $unsigned($signed((+wire75)))));
  assign wire102 = $unsigned($signed({(-(^~reg86))}));
  assign wire103 = $unsigned($signed(((8'ha6) ?
                       reg81[(2'h3):(2'h2)] : ({reg90} ?
                           $signed((8'hbb)) : reg82[(2'h2):(1'h0)]))));
  assign wire104 = ((wire102[(3'h7):(3'h6)] >= (^~(&(wire75 ?
                           (8'h9c) : reg83)))) ?
                       (((reg89 ?
                           (wire78 > wire75) : ((7'h41) >= reg89)) >> ((^reg81) ?
                           reg96 : ((8'ha1) & wire101))) & (reg79[(3'h5):(3'h4)] ?
                           reg82[(2'h3):(2'h2)] : $signed($unsigned(reg87)))) : reg89[(3'h5):(2'h2)]);
  assign wire105 = {$signed($signed($unsigned({(8'hb2), (8'ha5)})))};
  assign wire106 = wire77;
  assign wire107 = $unsigned($unsigned((~^$unsigned((wire78 == (8'hb8))))));
  always
    @(posedge clk) begin
      reg108 <= (8'ha5);
      reg109 <= (~^((+wire75) >> (wire107[(2'h3):(2'h2)] ?
          $signed((~|wire104)) : $unsigned($signed(wire99)))));
    end
  assign wire110 = $unsigned($signed(reg87));
  assign wire111 = (($unsigned($unsigned($unsigned((8'hb4)))) ?
                           $unsigned($signed(reg85[(3'h7):(2'h3)])) : (wire75 ?
                               (+(!wire77)) : $unsigned(reg88[(3'h4):(2'h3)]))) ?
                       $signed(((~&(reg88 ?
                           wire103 : wire106)) ^~ (+$unsigned(reg89)))) : reg85);
  assign wire112 = (7'h43);
  assign wire113 = ($signed((8'hac)) ? $signed(reg88[(4'h8):(4'h8)]) : wire98);
  always
    @(posedge clk) begin
      reg114 <= ((&$signed({wire100,
          (wire103 ? reg94 : wire97)})) < reg84[(4'hf):(4'he)]);
      if ({((8'h9f) & $signed((!$unsigned(wire113))))})
        begin
          reg115 <= $signed($unsigned($unsigned((((8'hbe) <<< wire103) != (+wire103)))));
          reg116 <= $unsigned((reg95[(4'ha):(3'h7)] >>> (((^~wire101) & reg84[(1'h0):(1'h0)]) ?
              {$signed(reg83)} : reg114[(2'h2):(1'h1)])));
          if ($unsigned(wire78[(3'h7):(3'h6)]))
            begin
              reg117 <= $signed(wire107[(3'h6):(2'h2)]);
              reg118 <= reg108[(3'h5):(2'h2)];
              reg119 <= $unsigned((reg86[(3'h6):(2'h2)] ?
                  reg88[(2'h2):(1'h0)] : (wire103[(1'h0):(1'h0)] ?
                      ($unsigned(wire78) ?
                          ((8'hbb) != wire106) : reg96) : (|(~^wire76)))));
              reg120 <= wire105;
              reg121 <= (($unsigned((-reg88)) >>> $unsigned(reg84)) ^ ((8'hac) >>> ((reg95[(2'h2):(2'h2)] ?
                  (~^reg83) : (wire102 ?
                      reg90 : reg120)) <<< ($unsigned(reg81) <= $signed(wire78)))));
            end
          else
            begin
              reg117 <= $signed(((reg109 ?
                      (7'h42) : ((wire104 <= wire107) ? reg91 : reg95)) ?
                  (($unsigned(wire98) ? (reg93 ? reg118 : (8'hb2)) : wire75) ?
                      ($signed(reg79) ?
                          wire99[(3'h5):(1'h0)] : (reg83 ?
                              reg121 : wire104)) : ((&reg81) ^~ (+(8'hab)))) : reg90));
              reg118 <= (^wire101[(4'h8):(1'h0)]);
              reg119 <= wire75[(3'h7):(3'h6)];
            end
        end
      else
        begin
          reg115 <= (|$signed(wire75));
          reg116 <= (~^$unsigned(wire113[(4'hf):(3'h7)]));
          if (reg86[(3'h4):(2'h3)])
            begin
              reg117 <= {wire78[(3'h5):(2'h3)],
                  ({(reg94[(1'h1):(1'h0)] ? (~(8'hac)) : $unsigned(reg79)),
                          ({reg88, reg84} >> $signed(reg108))} ?
                      ($unsigned(reg84) + reg91) : $signed(((wire77 ?
                          reg109 : reg87) >>> (~|(8'h9c)))))};
              reg118 <= wire97[(1'h0):(1'h0)];
              reg119 <= wire75[(3'h7):(3'h4)];
              reg120 <= (reg81[(1'h1):(1'h1)] ?
                  (({(reg114 ?
                          (8'ha5) : (8'hbc))} >= $signed((reg90 == (8'hbb)))) ~^ ({((8'ha1) ?
                          (8'haa) : reg81)} && {$unsigned(reg79),
                      (wire107 ? (7'h43) : reg95)})) : $unsigned(({(reg87 ?
                              reg96 : wire101)} ?
                      (reg119[(3'h4):(1'h0)] != ((8'hb9) ?
                          reg116 : (7'h43))) : {$unsigned((8'ha5)), wire100})));
              reg121 <= ((8'ha2) ~^ reg87);
            end
          else
            begin
              reg117 <= (^$unsigned($signed(reg84[(4'hd):(4'hc)])));
              reg118 <= (!{($signed(wire97) + wire78[(4'h9):(1'h0)]),
                  (({(8'ha7)} >= $unsigned(reg121)) ?
                      {(wire100 ?
                              (8'hbd) : wire110)} : $signed(wire104[(3'h4):(1'h1)]))});
              reg119 <= wire112;
              reg120 <= ({(^~$unsigned((^~wire113))),
                      (!(wire112 ? reg120[(4'hd):(2'h3)] : {(8'hab)}))} ?
                  ($unsigned((reg108 ?
                      (-reg116) : (wire106 ?
                          wire110 : wire110))) > reg86) : $unsigned($unsigned({reg85[(2'h3):(2'h3)]})));
            end
          if ((~reg121[(1'h0):(1'h0)]))
            begin
              reg122 <= $unsigned($unsigned((^~$signed((~|wire99)))));
            end
          else
            begin
              reg122 <= reg83[(3'h5):(2'h3)];
            end
          reg123 <= ((reg91[(2'h2):(1'h0)] | (wire104[(4'h8):(2'h3)] ?
              (+reg95) : wire101[(1'h1):(1'h1)])) || $signed($unsigned($unsigned($signed((8'haf))))));
        end
      reg124 <= $signed(reg83);
    end
  always
    @(posedge clk) begin
      if (reg83)
        begin
          reg125 <= $signed((8'hbd));
          reg126 <= $signed(reg115);
          if (reg118[(1'h0):(1'h0)])
            begin
              reg127 <= (~&(wire105 ?
                  wire100[(4'h9):(2'h2)] : wire99[(4'h9):(3'h4)]));
              reg128 <= ({(&$signed($signed(reg87)))} ?
                  $unsigned((!(reg116 >> $signed(reg91)))) : $signed(wire100));
              reg129 <= (-$unsigned(reg128[(3'h7):(3'h6)]));
              reg130 <= ($unsigned($signed($unsigned($unsigned((7'h43))))) < ((($unsigned(wire101) ?
                      (8'haf) : wire77) ?
                  $signed((~wire112)) : wire112[(3'h6):(3'h5)]) > ({reg87[(2'h2):(1'h0)],
                  ((8'had) & wire98)} ^ ((~&wire105) ? reg87 : (^~reg82)))));
              reg131 <= reg109[(2'h3):(2'h2)];
            end
          else
            begin
              reg127 <= {($unsigned(($signed(wire111) + wire75)) + $signed(((+reg116) ?
                      (8'hbe) : wire110)))};
              reg128 <= $unsigned((|(^(8'haf))));
              reg129 <= ($signed({reg80[(2'h2):(1'h0)],
                  reg122[(1'h0):(1'h0)]}) + ((({wire103, (8'hb5)} ?
                          (wire112 > reg92) : (^~reg115)) ?
                      ((+reg119) && $signed(reg82)) : (reg128 * (reg117 ?
                          reg130 : (8'hb7)))) ?
                  $signed((~|$unsigned(reg128))) : (~(!reg95))));
              reg130 <= ((&$signed($unsigned(wire101))) ?
                  $unsigned($signed(reg125)) : (~$unsigned($signed({reg95}))));
              reg131 <= reg119;
            end
          reg132 <= $unsigned((reg86[(4'hc):(4'h9)] ?
              ($unsigned((~|wire99)) ?
                  (+$unsigned((8'hb6))) : wire98) : ((8'ha2) ?
                  wire107[(3'h6):(2'h3)] : $unsigned($signed(reg118)))));
          if ($signed(wire104))
            begin
              reg133 <= wire112;
              reg134 <= reg91;
              reg135 <= $unsigned(reg80[(4'hb):(1'h0)]);
              reg136 <= reg116[(4'h8):(2'h2)];
            end
          else
            begin
              reg133 <= ($unsigned((reg128 && reg92[(4'h8):(4'h8)])) ?
                  (-(~&(~(wire110 ? wire100 : wire107)))) : $signed(reg90));
            end
        end
      else
        begin
          reg125 <= reg81[(3'h4):(1'h0)];
          reg126 <= reg92[(4'h8):(3'h5)];
          reg127 <= (~((((^~wire112) > $unsigned(wire105)) == wire110[(1'h1):(1'h1)]) <= (reg126[(1'h1):(1'h0)] >= $signed((+reg93)))));
          reg128 <= (!(($unsigned($signed(reg135)) ~^ $signed(wire111)) < (wire75[(4'ha):(4'h9)] >>> reg125)));
        end
      reg137 <= (($signed($signed(reg86)) - $signed((reg125 + $signed(reg131)))) && $unsigned(reg85[(2'h3):(1'h1)]));
      if (reg123[(3'h4):(3'h4)])
        begin
          reg138 <= (~&reg91);
        end
      else
        begin
          if (((~&(wire107 > {(~reg125)})) ?
              {$signed(($unsigned(wire105) - (wire111 ?
                      (8'ha8) : reg136)))} : $unsigned((((~^reg82) >> (reg87 ?
                      reg87 : wire111)) ?
                  $signed((wire75 ? reg84 : reg96)) : $unsigned((reg118 ?
                      reg114 : wire102))))))
            begin
              reg138 <= (|((+{(reg120 ? reg128 : reg85),
                  $unsigned(reg108)}) | (reg137 ^~ ($unsigned(wire110) & $unsigned(wire78)))));
              reg139 <= (((~&$unsigned($unsigned(reg109))) ?
                  $unsigned($unsigned((reg122 - wire97))) : reg124) ~^ (~(((reg94 ?
                      wire97 : reg130) << reg127[(4'hc):(2'h3)]) ?
                  {(wire76 ? wire104 : wire97),
                      (wire100 ? wire105 : reg96)} : {(~reg127),
                      (reg119 || reg95)})));
              reg140 <= $unsigned($signed(wire77[(1'h0):(1'h0)]));
            end
          else
            begin
              reg138 <= reg80;
              reg139 <= (-$unsigned(reg118[(1'h0):(1'h0)]));
              reg140 <= reg140[(1'h1):(1'h1)];
              reg141 <= wire100[(3'h4):(1'h1)];
              reg142 <= (8'hba);
            end
          reg143 <= ((wire97[(1'h0):(1'h0)] ?
                  reg132[(2'h3):(2'h3)] : $signed(wire111[(4'hb):(4'h8)])) ?
              reg134[(4'hd):(4'h9)] : $signed(reg87));
          if ($signed((((reg89 + $signed((8'ha9))) + $unsigned(wire105)) ?
              $signed({$unsigned((7'h44)), reg141}) : reg141[(1'h1):(1'h1)])))
            begin
              reg144 <= {((8'hb4) ?
                      (-$signed($unsigned(wire77))) : ({(reg124 ?
                                  wire102 : reg115)} ?
                          reg133 : wire112[(4'hc):(4'ha)])),
                  (({reg122} * (!$unsigned(reg143))) && reg83[(5'h10):(3'h6)])};
              reg145 <= (^((|reg86[(3'h6):(1'h0)]) <<< reg119[(1'h0):(1'h0)]));
              reg146 <= $signed(reg131[(2'h3):(2'h2)]);
            end
          else
            begin
              reg144 <= $signed(((~^reg142) == {$signed({reg132, wire110})}));
              reg145 <= reg118;
              reg146 <= (!reg120[(4'hf):(3'h6)]);
              reg147 <= $unsigned($unsigned(reg139));
              reg148 <= $unsigned($signed(((~&$signed(reg143)) ?
                  reg118[(1'h1):(1'h1)] : ((+reg116) ?
                      reg131[(3'h6):(3'h4)] : (reg126 & wire111)))));
            end
        end
      reg149 <= wire101;
      reg150 <= $signed(((~&reg79[(4'h9):(4'h8)]) ^ $signed((((8'hb3) ?
              reg144 : reg94) ?
          ((8'hbe) ? reg147 : reg91) : $signed(reg86)))));
    end
  assign wire151 = $unsigned(($signed(reg88[(4'ha):(4'ha)]) ?
                       $unsigned(((8'hb2) - $signed(reg108))) : reg115[(2'h3):(1'h1)]));
  assign wire152 = reg133[(1'h0):(1'h0)];
  assign wire153 = {(reg89[(2'h3):(1'h0)] ?
                           {{$signed(reg83), reg90},
                               ($unsigned(reg139) ?
                                   reg91[(2'h2):(1'h0)] : $signed((8'ha2)))} : $unsigned(reg142[(3'h5):(2'h3)])),
                       (reg79 >> reg125[(2'h3):(1'h1)])};
  assign wire154 = $unsigned((~|((^~wire100) << (^{reg121, reg85}))));
endmodule

module module26
#(parameter param67 = ((((~&(-(7'h40))) ? ((~^(8'hbc)) ? (&(8'hb9)) : (|(8'h9d))) : ((~|(7'h42)) ? (~^(8'hab)) : ((8'ha0) ? (8'hb0) : (8'hbb)))) ? (!(~|(-(8'ha3)))) : ((~((8'h9d) ? (8'hbc) : (8'ha4))) || (-(^~(8'hbf))))) ? (~^(((8'h9c) <= (+(7'h43))) <<< (((8'hab) ? (8'hbe) : (8'hbf)) ? (~|(8'hb9)) : ((8'hb9) ? (8'hb6) : (8'hb0))))) : {({(~&(8'h9f))} ? {((8'hb7) ? (8'ha1) : (8'ha3))} : (((8'haf) ? (8'hb7) : (8'had)) <<< ((8'ha1) < (8'hb6)))), (8'ha8)}), 
parameter param68 = (param67 ? {(((8'h9f) * (param67 == param67)) | {(~(8'hbf))}), ((param67 ? param67 : {param67, param67}) - ((param67 <= param67) ? param67 : (param67 >= param67)))} : param67))
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h187):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire30;
  input wire signed [(4'ha):(1'h0)] wire29;
  input wire [(5'h10):(1'h0)] wire28;
  input wire [(2'h2):(1'h0)] wire27;
  wire [(4'h8):(1'h0)] wire66;
  wire [(5'h10):(1'h0)] wire65;
  wire signed [(3'h7):(1'h0)] wire62;
  wire [(3'h7):(1'h0)] wire61;
  wire signed [(5'h13):(1'h0)] wire60;
  wire [(5'h11):(1'h0)] wire59;
  wire signed [(5'h14):(1'h0)] wire58;
  wire signed [(5'h11):(1'h0)] wire57;
  wire signed [(3'h6):(1'h0)] wire56;
  wire signed [(4'he):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire41;
  wire [(4'hb):(1'h0)] wire40;
  wire signed [(5'h13):(1'h0)] wire39;
  wire [(2'h2):(1'h0)] wire38;
  wire [(4'h8):(1'h0)] wire37;
  wire signed [(3'h7):(1'h0)] wire36;
  wire signed [(2'h3):(1'h0)] wire35;
  wire signed [(4'he):(1'h0)] wire34;
  wire [(4'ha):(1'h0)] wire31;
  reg signed [(5'h10):(1'h0)] reg64 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(4'hc):(1'h0)] reg55 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg51 = (1'h0);
  reg [(5'h10):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg49 = (1'h0);
  reg [(4'ha):(1'h0)] reg48 = (1'h0);
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg [(4'hb):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  reg [(3'h4):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire52,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire31,
                 reg64,
                 reg63,
                 reg55,
                 reg54,
                 reg53,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg33,
                 reg32,
                 (1'h0)};
  assign wire31 = (^($signed((-wire30)) ^~ (8'ha2)));
  always
    @(posedge clk) begin
      if (wire27[(1'h1):(1'h0)])
        begin
          reg32 <= (^~$signed((~&(wire30[(4'he):(4'hb)] ^~ (wire31 ?
              wire28 : (7'h43))))));
          reg33 <= $signed($unsigned(wire30));
        end
      else
        begin
          reg32 <= (wire28 ^ ($unsigned((((8'hb2) ? reg33 : wire27) ?
                  (!wire31) : wire29[(3'h4):(1'h0)])) ?
              (wire28[(1'h0):(1'h0)] | ((~&wire31) == $unsigned((8'hb7)))) : wire30[(1'h0):(1'h0)]));
        end
    end
  assign wire34 = (&wire28[(2'h3):(1'h1)]);
  assign wire35 = ($unsigned({wire29, {wire27, $unsigned((8'h9f))}}) ?
                      wire31 : ($signed(wire28) - (8'had)));
  assign wire36 = ((($signed((wire30 ? wire31 : wire29)) ?
                          ($unsigned(wire28) == wire30[(4'h9):(3'h6)]) : reg32[(2'h3):(1'h1)]) <= wire27) ?
                      $unsigned(wire35[(1'h1):(1'h0)]) : (wire28[(1'h1):(1'h0)] ?
                          $signed((wire34 ?
                              $signed(reg32) : (reg33 ?
                                  wire30 : (8'hb2)))) : {wire28[(4'h9):(2'h3)]}));
  assign wire37 = wire31[(3'h7):(3'h7)];
  assign wire38 = (((wire31 ? wire30 : $signed((reg33 & reg32))) ^~ (wire30 ?
                          ($unsigned(wire30) ?
                              (wire30 | wire34) : $unsigned(wire37)) : {$unsigned(wire29),
                              reg32[(1'h1):(1'h0)]})) ?
                      {$signed((!wire28[(1'h0):(1'h0)])),
                          $unsigned(wire35[(1'h0):(1'h0)])} : (~({$unsigned((8'hbd)),
                              (wire37 >>> wire35)} ?
                          wire35 : (reg33 <<< {wire36}))));
  assign wire39 = $signed(wire37);
  assign wire40 = $signed(wire30);
  assign wire41 = (~|wire40);
  always
    @(posedge clk) begin
      if (((wire31[(3'h6):(1'h1)] > (($signed(wire40) == (^~wire41)) ?
          $signed($signed(wire31)) : $unsigned((^~wire41)))) <= $signed(wire38)))
        begin
          reg42 <= $signed(wire38);
          reg43 <= (^(8'h9e));
          if ($unsigned((8'ha7)))
            begin
              reg44 <= {wire41[(3'h5):(1'h1)]};
              reg45 <= ($signed(wire28) ?
                  $signed(reg42) : (~|(-($signed(wire37) | wire41[(4'hb):(4'h9)]))));
            end
          else
            begin
              reg44 <= $signed(wire29[(3'h7):(3'h4)]);
              reg45 <= reg44[(3'h4):(1'h1)];
              reg46 <= $unsigned(wire39[(1'h0):(1'h0)]);
              reg47 <= ((reg42[(3'h4):(2'h2)] * $unsigned(((reg45 << wire39) + wire28[(2'h3):(2'h3)]))) ?
                  (({$unsigned(wire41), $unsigned(reg45)} ?
                      {$signed(wire34)} : wire29[(4'h8):(3'h4)]) <= ({((8'had) ?
                              (8'hb0) : wire31),
                          $unsigned(wire36)} ?
                      {((8'hb0) ?
                              wire40 : wire29)} : reg45)) : wire30[(1'h1):(1'h0)]);
            end
          reg48 <= wire40[(3'h4):(2'h3)];
          reg49 <= (reg46 ?
              (+(wire30[(1'h0):(1'h0)] ^ reg45[(1'h1):(1'h1)])) : ($signed($signed((~reg42))) && $unsigned(reg48)));
        end
      else
        begin
          reg42 <= ($signed((^~(~reg32))) != wire28[(4'hd):(2'h2)]);
          if ($unsigned($signed((+({reg48, wire35} == ((8'hb2) ?
              reg43 : reg33))))))
            begin
              reg43 <= reg49;
            end
          else
            begin
              reg43 <= reg33;
              reg44 <= reg49[(3'h4):(1'h0)];
            end
          reg45 <= ({$unsigned(reg42), reg45[(1'h1):(1'h1)]} ?
              ($signed((!$signed((8'ha1)))) < $unsigned((8'haf))) : (($unsigned((reg33 ?
                  reg32 : wire35)) << (!wire41)) * wire38));
        end
      reg50 <= ({{($signed(reg43) ? reg49 : {reg42})},
              $unsigned(wire38[(2'h2):(2'h2)])} ?
          $unsigned(((wire37 ?
              $signed(wire28) : (&(8'h9f))) >>> reg48[(4'h9):(1'h0)])) : $signed(({$signed(wire39),
              $unsigned(reg42)} ^ reg46)));
      reg51 <= $unsigned({((!reg32[(1'h0):(1'h0)]) >= $signed((&wire36)))});
    end
  assign wire52 = (wire29 + {reg43[(3'h5):(1'h0)]});
  always
    @(posedge clk) begin
      reg53 <= wire31[(3'h5):(1'h1)];
      reg54 <= reg32;
      reg55 <= (reg43 ^ $signed(wire39[(4'hb):(4'ha)]));
    end
  assign wire56 = (&((|$signed($signed((8'hbc)))) - wire40[(4'h9):(4'h8)]));
  assign wire57 = (reg45 ?
                      wire27[(2'h2):(1'h1)] : ($unsigned($signed((wire38 ?
                              wire56 : wire37))) ?
                          $unsigned(wire38[(1'h0):(1'h0)]) : ({wire56} <= reg50[(4'ha):(4'ha)])));
  assign wire58 = $unsigned($unsigned((8'hbc)));
  assign wire59 = {(!$unsigned({$unsigned(reg44)})),
                      (((~&(wire31 >>> wire52)) && wire37) << {reg51})};
  assign wire60 = (^($unsigned(($unsigned(wire56) < wire31)) ?
                      reg48 : $signed(wire36)));
  assign wire61 = ((^reg48) ?
                      $unsigned(reg53[(2'h2):(1'h0)]) : ((wire52[(4'ha):(2'h3)] ?
                          (((8'ha5) <= (8'hb7)) > (wire52 ?
                              reg54 : (8'hb8))) : ($signed(wire39) ^ wire60)) != {wire41,
                          ((|wire36) ? (&reg51) : reg33)}));
  assign wire62 = ((reg45 ^ (~|$unsigned(wire57[(5'h11):(4'ha)]))) ^~ $unsigned({(8'hb4),
                      ($signed(wire59) ? (|wire27) : wire58[(5'h10):(4'hb)])}));
  always
    @(posedge clk) begin
      reg63 <= wire58;
      reg64 <= (~|(&wire30));
    end
  assign wire65 = {reg53[(2'h2):(1'h1)],
                      $unsigned((($signed(reg50) <<< (reg43 ?
                          wire31 : reg49)) << wire28[(3'h5):(3'h4)]))};
  assign wire66 = {($signed($unsigned((~^(8'hb7)))) <<< ($unsigned((+wire36)) ?
                          wire65 : ((~|(7'h43)) ?
                              (reg47 << reg32) : $unsigned((7'h42))))),
                      $unsigned((~{(wire37 ? wire30 : wire57), {(8'hb0)}}))};
endmodule
