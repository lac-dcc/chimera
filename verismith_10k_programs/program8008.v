module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h151):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire194;
  wire signed [(2'h2):(1'h0)] wire193;
  wire [(3'h4):(1'h0)] wire192;
  wire [(4'hd):(1'h0)] wire191;
  wire signed [(2'h2):(1'h0)] wire190;
  wire signed [(3'h7):(1'h0)] wire183;
  wire [(4'hc):(1'h0)] wire22;
  wire signed [(5'h15):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire20;
  wire signed [(5'h10):(1'h0)] wire19;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  wire [(2'h3):(1'h0)] wire185;
  wire signed [(4'hd):(1'h0)] wire186;
  wire [(5'h13):(1'h0)] wire187;
  wire signed [(4'hd):(1'h0)] wire188;
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(2'h2):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg6 = (1'h0);
  assign y = {wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire183,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire5,
                 wire4,
                 wire185,
                 wire186,
                 wire187,
                 wire188,
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
                 (1'h0)};
  assign wire4 = $signed((((((8'ha4) ? wire3 : (8'hbf)) ?
                         wire0[(1'h1):(1'h0)] : $unsigned(wire3)) ?
                     (wire2 ?
                         $unsigned(wire0) : wire1) : (wire3[(2'h3):(2'h3)] ^ wire1)) * ((wire3[(2'h3):(2'h3)] ?
                         (~^wire2) : wire0) ?
                     $signed((wire0 ? wire0 : wire0)) : {((8'h9d) ?
                             wire1 : wire1)})));
  assign wire5 = $unsigned((+wire4[(3'h7):(1'h1)]));
  always
    @(posedge clk) begin
      reg6 <= wire0[(1'h1):(1'h1)];
      reg7 <= wire4[(4'hd):(4'hb)];
      if (wire2[(5'h13):(4'hf)])
        begin
          reg8 <= ($signed((~$signed(wire3))) * (-$unsigned((8'ha9))));
          reg9 <= (&(8'hbb));
          reg10 <= $unsigned((wire2[(5'h11):(4'hb)] ?
              wire5 : $unsigned((+{reg9, reg7}))));
          if ({((((reg10 ? wire5 : reg10) <= wire5) ?
                  $signed((wire0 > wire1)) : (+(8'hb2))) <= (reg10[(5'h11):(4'ha)] >> ($unsigned(reg9) >> reg8)))})
            begin
              reg11 <= reg6;
              reg12 <= ((({(~wire1),
                      (reg10 ?
                          wire0 : (8'ha7))} == (+(reg9 == wire1))) <<< (^((^wire2) || (reg8 != wire0)))) ?
                  wire5[(4'he):(4'h9)] : wire2[(4'h8):(2'h2)]);
              reg13 <= reg12;
            end
          else
            begin
              reg11 <= $signed($unsigned(((reg6[(2'h3):(2'h3)] ?
                  ((7'h41) ? wire5 : reg6) : (reg10 | reg13)) ^~ {(^reg7),
                  $unsigned(wire2)})));
              reg12 <= ($signed($signed((|{wire3, reg11}))) | (^~wire3));
            end
        end
      else
        begin
          reg8 <= $unsigned($unsigned($signed(reg9[(3'h5):(1'h1)])));
          reg9 <= $unsigned({$signed({(wire1 ? reg9 : reg11)}),
              wire1[(4'ha):(1'h0)]});
          reg10 <= wire3;
          reg11 <= ($signed(reg12[(2'h2):(1'h1)]) ?
              reg9 : $signed((~&(wire0 <<< ((8'hb3) == reg8)))));
        end
      if ($unsigned((|wire4[(2'h2):(2'h2)])))
        begin
          if (($unsigned((!reg10)) <<< ((~{(|reg9), $signed(wire5)}) ?
              wire4 : (~(reg11[(3'h5):(3'h5)] ?
                  $signed(reg13) : (reg8 ? wire5 : wire3))))))
            begin
              reg14 <= (~|{$unsigned((wire1[(1'h1):(1'h1)] ?
                      $signed(reg8) : $unsigned(reg9)))});
              reg15 <= reg9[(3'h6):(2'h2)];
              reg16 <= $unsigned((reg14 ?
                  ((|(reg13 != wire0)) ?
                      wire4 : ({reg12} <<< (reg14 ?
                          reg6 : reg7))) : wire1[(3'h6):(1'h0)]));
              reg17 <= {$unsigned(($signed((+wire2)) ?
                      {reg6, $unsigned(reg13)} : ((wire3 < reg8) ?
                          reg14 : (wire5 >> reg6))))};
            end
          else
            begin
              reg14 <= $signed($unsigned($unsigned(((|wire0) << $signed(reg10)))));
              reg15 <= (($unsigned($signed((~&wire4))) == ({$signed(reg15),
                  {reg17, reg12}} ^ reg17[(1'h0):(1'h0)])) || (&((~^((8'hbf) ?
                  reg12 : wire4)) << (8'hb0))));
            end
        end
      else
        begin
          reg14 <= {reg17[(3'h7):(3'h5)], wire5[(4'hb):(1'h0)]};
          reg15 <= (~|((8'hbd) > $signed(wire1)));
        end
      reg18 <= reg6;
    end
  assign wire19 = $signed(($signed({(-wire2)}) | ($unsigned(((8'hbc) ?
                      reg7 : wire2)) >>> reg11[(3'h4):(3'h4)])));
  assign wire20 = {wire5[(1'h1):(1'h1)]};
  assign wire21 = $unsigned((-$unsigned((wire4 ?
                      $unsigned(reg12) : $signed((8'ha7))))));
  assign wire22 = (&reg15);
  module23 #() modinst184 (.wire26(wire0), .wire24(wire1), .wire25(reg16), .y(wire183), .clk(clk), .wire28(wire21), .wire27(reg15));
  assign wire185 = (~wire4[(4'he):(2'h3)]);
  assign wire186 = wire3;
  assign wire187 = {((~&reg11) << $unsigned((reg6 ?
                           reg15[(4'h9):(3'h6)] : $unsigned(wire19)))),
                       ($unsigned(wire22) > (~^$signed($unsigned(wire185))))};
  module23 #() modinst189 (wire188, clk, wire4, wire22, wire187, wire5, wire21);
  assign wire190 = $signed((~|{($unsigned((8'hb1)) > $unsigned(reg18))}));
  assign wire191 = wire22[(3'h5):(2'h2)];
  assign wire192 = ((-(^~($signed((8'ha1)) || $unsigned(wire190)))) ?
                       (($unsigned({(8'hbf)}) ?
                               {wire1[(3'h7):(3'h5)],
                                   wire4[(4'ha):(1'h1)]} : $unsigned((~|wire0))) ?
                           (|($unsigned(reg15) ?
                               reg11 : (&reg7))) : (~wire1)) : $unsigned(($unsigned((wire0 ~^ reg10)) || ((wire186 - reg16) ?
                           wire20 : reg11))));
  assign wire193 = (~|$unsigned(wire4[(4'ha):(3'h5)]));
  assign wire194 = wire1;
endmodule

module module23  (y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'h118):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire28;
  input wire signed [(4'hc):(1'h0)] wire27;
  input wire signed [(5'h13):(1'h0)] wire26;
  input wire [(5'h15):(1'h0)] wire25;
  input wire signed [(5'h11):(1'h0)] wire24;
  wire [(5'h15):(1'h0)] wire181;
  wire [(5'h15):(1'h0)] wire152;
  wire [(5'h11):(1'h0)] wire102;
  wire signed [(5'h15):(1'h0)] wire29;
  wire signed [(3'h5):(1'h0)] wire104;
  wire [(4'hd):(1'h0)] wire111;
  wire [(5'h15):(1'h0)] wire112;
  wire [(4'ha):(1'h0)] wire113;
  wire signed [(3'h6):(1'h0)] wire130;
  wire [(5'h11):(1'h0)] wire132;
  wire [(5'h12):(1'h0)] wire133;
  wire [(3'h4):(1'h0)] wire134;
  wire signed [(3'h5):(1'h0)] wire135;
  wire signed [(5'h13):(1'h0)] wire150;
  reg [(5'h15):(1'h0)] reg105 = (1'h0);
  reg [(2'h3):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg107 = (1'h0);
  reg [(5'h11):(1'h0)] reg108 = (1'h0);
  reg [(4'hd):(1'h0)] reg109 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg110 = (1'h0);
  assign y = {wire181,
                 wire152,
                 wire102,
                 wire29,
                 wire104,
                 wire111,
                 wire112,
                 wire113,
                 wire130,
                 wire132,
                 wire133,
                 wire134,
                 wire135,
                 wire150,
                 reg105,
                 reg106,
                 reg107,
                 reg108,
                 reg109,
                 reg110,
                 (1'h0)};
  assign wire29 = ($unsigned($unsigned((^~$signed((8'h9d))))) >>> $unsigned($unsigned(($signed((8'hb4)) ?
                      wire28 : (~^wire24)))));
  module30 #() modinst103 (.wire33(wire28), .wire34(wire26), .wire35(wire24), .wire31(wire29), .y(wire102), .wire32(wire27), .clk(clk));
  assign wire104 = (((($unsigned(wire24) ?
                           $signed(wire26) : $unsigned(wire24)) ?
                       ($unsigned(wire102) ?
                           (~^(8'haf)) : ((8'h9f) > wire25)) : $signed((~|wire26))) != $signed({wire102})) != wire29[(4'ha):(1'h0)]);
  always
    @(posedge clk) begin
      reg105 <= (($unsigned($unsigned($signed(wire27))) ?
              $signed(($unsigned(wire24) ?
                  $signed(wire27) : (wire25 <<< (8'hbd)))) : ((-(8'ha9)) ?
                  wire27 : wire27[(4'hb):(3'h6)])) ?
          ((8'h9d) ?
              ((wire28 ? {wire102, wire28} : wire25) < $signed((wire102 ?
                  wire27 : wire104))) : wire28) : (-(wire104[(3'h4):(2'h3)] << $unsigned($unsigned(wire24)))));
      reg106 <= (((($unsigned(wire24) ~^ (wire28 ?
              wire25 : wire25)) <= wire29) ?
          {wire27[(2'h2):(1'h1)]} : (((wire25 & wire28) & (~wire24)) | wire29[(2'h3):(2'h2)])) ~^ (^wire26));
      if (((^~$signed(wire24)) ?
          reg105[(3'h7):(3'h6)] : (^($unsigned($signed(wire26)) ?
              ($unsigned(wire28) << reg106[(1'h1):(1'h0)]) : ((wire26 * wire26) ?
                  (wire28 != wire24) : (~&reg105))))))
        begin
          reg107 <= wire25[(5'h10):(5'h10)];
          reg108 <= $signed($signed($unsigned(reg107[(1'h0):(1'h0)])));
          reg109 <= $signed(wire29);
          reg110 <= $signed({wire29[(1'h1):(1'h0)]});
        end
      else
        begin
          reg107 <= (reg108 ?
              ((8'ha0) == $unsigned(((wire102 ? wire26 : (8'ha3)) ?
                  reg108[(5'h10):(4'ha)] : $unsigned(reg107)))) : (|(wire104 ^~ (-wire104[(1'h0):(1'h0)]))));
        end
    end
  assign wire111 = $signed((reg107 ^ reg105[(4'h9):(1'h0)]));
  assign wire112 = $signed({reg107[(4'h9):(3'h5)], $unsigned(reg106)});
  assign wire113 = wire104;
  module114 #() modinst131 (.wire118(reg109), .clk(clk), .y(wire130), .wire116(reg108), .wire117(wire27), .wire115(wire113));
  assign wire132 = (((~|(7'h41)) << (reg108 ?
                       wire112[(4'h9):(4'h8)] : (!(~^reg105)))) ^~ wire102);
  assign wire133 = ($signed((~&($unsigned(wire29) ?
                       wire130[(2'h3):(1'h1)] : (+wire26)))) ^~ wire113[(2'h2):(1'h0)]);
  assign wire134 = reg108[(1'h0):(1'h0)];
  assign wire135 = (wire27 ? reg107[(2'h3):(2'h3)] : (~(^~(~wire104))));
  module136 #() modinst151 (wire150, clk, wire112, wire111, wire102, wire130, wire132);
  assign wire152 = ((~|(!$signed(wire130[(1'h1):(1'h0)]))) ?
                       (~&($unsigned($unsigned(wire130)) ?
                           wire113 : $unsigned($signed(wire29)))) : $unsigned((reg107 ?
                           {(+reg106), {reg107, wire26}} : $unsigned({wire104,
                               reg107}))));
  module153 #() modinst182 (.wire154(wire133), .wire156(wire113), .wire158(wire28), .wire155(reg109), .wire157(wire150), .clk(clk), .y(wire181));
endmodule

module module153  (y, clk, wire158, wire157, wire156, wire155, wire154);
  output wire [(32'h10e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire158;
  input wire signed [(5'h13):(1'h0)] wire157;
  input wire [(4'h9):(1'h0)] wire156;
  input wire signed [(4'hd):(1'h0)] wire155;
  input wire [(4'hc):(1'h0)] wire154;
  wire signed [(3'h4):(1'h0)] wire174;
  wire signed [(5'h13):(1'h0)] wire173;
  wire [(4'ha):(1'h0)] wire172;
  wire [(3'h7):(1'h0)] wire171;
  wire [(2'h3):(1'h0)] wire170;
  wire [(4'ha):(1'h0)] wire169;
  wire [(5'h15):(1'h0)] wire168;
  wire signed [(4'hc):(1'h0)] wire167;
  wire [(5'h15):(1'h0)] wire166;
  wire [(5'h13):(1'h0)] wire163;
  wire [(3'h4):(1'h0)] wire162;
  wire signed [(2'h2):(1'h0)] wire161;
  wire [(4'hb):(1'h0)] wire160;
  wire [(5'h11):(1'h0)] wire159;
  reg [(5'h12):(1'h0)] reg180 = (1'h0);
  reg [(5'h13):(1'h0)] reg179 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg178 = (1'h0);
  reg [(4'hd):(1'h0)] reg177 = (1'h0);
  reg [(5'h14):(1'h0)] reg176 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg165 = (1'h0);
  reg signed [(4'he):(1'h0)] reg164 = (1'h0);
  assign y = {wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg165,
                 reg164,
                 (1'h0)};
  assign wire159 = (~((!wire157[(2'h2):(1'h1)]) >= (wire158 ^ ((8'haa) > wire154[(3'h4):(1'h0)]))));
  assign wire160 = $signed(wire155[(2'h3):(2'h2)]);
  assign wire161 = $signed((&($signed({(7'h40)}) == (+wire155[(2'h3):(2'h3)]))));
  assign wire162 = $signed((!$signed(wire154[(4'hb):(4'h8)])));
  assign wire163 = $unsigned(wire158);
  always
    @(posedge clk) begin
      reg164 <= $unsigned(($unsigned(wire162) ?
          ((-(wire156 + wire157)) >> ($signed(wire156) ^ wire159[(4'ha):(1'h1)])) : $signed((~&(wire161 ?
              (8'haf) : wire158)))));
      reg165 <= $unsigned($unsigned(wire163));
    end
  assign wire166 = $signed($unsigned($signed(((wire156 >>> wire163) ?
                       $signed(wire158) : $signed(wire158)))));
  assign wire167 = (wire159[(4'ha):(4'h8)] ?
                       wire159[(4'ha):(2'h2)] : $signed((reg165[(2'h2):(1'h1)] | ((wire157 >>> wire158) && $unsigned(wire157)))));
  assign wire168 = ({((8'h9d) ?
                               $signed($signed(wire167)) : {wire156[(3'h6):(1'h0)]})} ?
                       wire160[(4'h9):(4'h9)] : {wire167[(4'h8):(3'h6)]});
  assign wire169 = $signed((wire168[(3'h6):(3'h5)] >= (($signed(wire159) - $unsigned(wire160)) ?
                       $signed({wire168}) : $unsigned($unsigned(wire156)))));
  assign wire170 = $unsigned(wire163);
  assign wire171 = $signed((^~(~$signed({wire167, reg165}))));
  assign wire172 = (((~^wire166[(1'h0):(1'h0)]) << wire160) != (~(+$unsigned({(8'hb8),
                       wire154}))));
  assign wire173 = $unsigned(reg165);
  assign wire174 = (($signed((wire172 - $signed(wire154))) && $signed(wire159[(4'ha):(1'h0)])) && ((~|wire172[(3'h5):(1'h0)]) >> (wire169 != (~reg164[(3'h5):(1'h1)]))));
  always
    @(posedge clk) begin
      reg175 <= (^~(wire173 ?
          ($unsigned(wire174) < $unsigned($unsigned(wire169))) : ($unsigned((^wire167)) ?
              (-$signed(wire159)) : wire166[(4'ha):(2'h3)])));
      reg176 <= $signed((((8'hb5) << $unsigned(wire155[(4'hb):(3'h5)])) <<< reg164[(4'he):(4'hc)]));
      reg177 <= {$unsigned(({(wire157 <<< reg176), $unsigned(wire158)} ?
              (8'ha3) : {$signed((8'hb8))})),
          wire168};
      reg178 <= wire167[(1'h1):(1'h0)];
      if (((&reg175[(3'h7):(3'h7)]) & $signed(wire163)))
        begin
          reg179 <= (^~reg165[(1'h1):(1'h1)]);
          reg180 <= ($signed((wire163 ?
                  $unsigned((wire167 ?
                      wire171 : wire155)) : $unsigned(wire162[(3'h4):(1'h0)]))) ?
              wire156 : (wire163 ?
                  (^~((!reg177) & wire163)) : (|$signed((|wire174)))));
        end
      else
        begin
          reg179 <= $unsigned(reg177);
        end
    end
endmodule

module module136  (y, clk, wire141, wire140, wire139, wire138, wire137);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire141;
  input wire [(4'hd):(1'h0)] wire140;
  input wire signed [(5'h11):(1'h0)] wire139;
  input wire [(2'h2):(1'h0)] wire138;
  input wire [(5'h11):(1'h0)] wire137;
  wire signed [(5'h10):(1'h0)] wire149;
  wire [(4'h9):(1'h0)] wire148;
  wire signed [(3'h7):(1'h0)] wire144;
  wire [(5'h10):(1'h0)] wire143;
  wire [(4'hd):(1'h0)] wire142;
  reg signed [(4'ha):(1'h0)] reg147 = (1'h0);
  reg [(4'hd):(1'h0)] reg146 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg145 = (1'h0);
  assign y = {wire149,
                 wire148,
                 wire144,
                 wire143,
                 wire142,
                 reg147,
                 reg146,
                 reg145,
                 (1'h0)};
  assign wire142 = $signed($unsigned(wire138[(1'h1):(1'h1)]));
  assign wire143 = (((8'ha2) ? wire137 : (8'had)) ?
                       (&(wire139[(2'h2):(1'h1)] ?
                           {$signed(wire141)} : (-$unsigned(wire141)))) : wire137);
  assign wire144 = wire138;
  always
    @(posedge clk) begin
      reg145 <= (8'hae);
      reg146 <= (((^$unsigned(wire144)) ?
          wire144 : (wire144 != (~$unsigned(wire137)))) ^ $unsigned($signed((wire142 ?
          wire138 : (wire144 ? wire143 : wire142)))));
      reg147 <= ($unsigned(wire140[(3'h5):(2'h3)]) ?
          wire139[(1'h1):(1'h1)] : wire138);
    end
  assign wire148 = ($signed(wire141) >= $signed(reg145[(2'h2):(1'h0)]));
  assign wire149 = wire148;
endmodule

module module114
#(parameter param129 = (~|(((((8'hbe) ? (8'ha0) : (8'hbb)) - ((8'hb7) ? (8'ha0) : (8'hbf))) >= ({(8'hba), (8'hab)} ? {(8'hbe)} : ((8'hb9) <<< (8'hb7)))) ? ((!((8'hb0) <= (8'h9e))) * {((8'ha2) >= (8'hb1)), ((8'hbf) | (8'ha2))}) : (((~&(8'ha1)) || ((8'hb1) ^~ (7'h44))) ? (!((8'h9d) ? (8'ha2) : (8'hab))) : (~((8'ha2) ? (8'hbe) : (8'h9e)))))))
(y, clk, wire118, wire117, wire116, wire115);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire118;
  input wire [(4'h9):(1'h0)] wire117;
  input wire signed [(5'h11):(1'h0)] wire116;
  input wire signed [(2'h3):(1'h0)] wire115;
  wire signed [(2'h2):(1'h0)] wire128;
  wire signed [(5'h13):(1'h0)] wire127;
  wire [(5'h12):(1'h0)] wire126;
  wire [(4'hd):(1'h0)] wire125;
  wire [(4'hc):(1'h0)] wire124;
  wire signed [(2'h3):(1'h0)] wire123;
  wire signed [(3'h6):(1'h0)] wire122;
  wire signed [(4'h8):(1'h0)] wire121;
  wire signed [(4'he):(1'h0)] wire120;
  wire signed [(2'h2):(1'h0)] wire119;
  assign y = {wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 (1'h0)};
  assign wire119 = wire118;
  assign wire120 = wire115[(1'h1):(1'h1)];
  assign wire121 = (wire119[(1'h0):(1'h0)] ?
                       $signed(($signed(wire116[(4'hb):(4'ha)]) - $signed(wire116[(2'h3):(1'h0)]))) : wire118[(3'h6):(3'h6)]);
  assign wire122 = $unsigned(((8'hb0) ?
                       $unsigned($signed(wire118)) : ($unsigned(wire121[(3'h7):(1'h0)]) > $signed(wire120[(1'h0):(1'h0)]))));
  assign wire123 = {$unsigned((wire120[(4'hc):(1'h1)] > wire119[(1'h1):(1'h1)]))};
  assign wire124 = wire122[(3'h4):(1'h1)];
  assign wire125 = (((wire124 ?
                       (wire123[(1'h1):(1'h0)] ?
                           wire122 : (^wire124)) : (-wire121[(3'h5):(2'h2)])) && (-wire115[(1'h1):(1'h0)])) - $unsigned(wire122[(3'h5):(2'h2)]));
  assign wire126 = $signed({$unsigned(wire120)});
  assign wire127 = (~^wire115);
  assign wire128 = {$unsigned(wire123[(1'h0):(1'h0)]), wire123[(2'h2):(2'h2)]};
endmodule

module module30
#(parameter param101 = ((!((-((8'ha1) ? (8'had) : (8'hb4))) * (((7'h41) ? (7'h43) : (8'hb1)) ? {(7'h42), (8'had)} : (~|(8'hb8))))) <= (~&{((~|(8'hab)) > ((7'h40) ? (8'hb6) : (8'hb2))), (((7'h44) != (8'hbd)) ? (&(8'h9f)) : (!(8'hb2)))})))
(y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'h2c1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire35;
  input wire [(5'h13):(1'h0)] wire34;
  input wire [(2'h2):(1'h0)] wire33;
  input wire signed [(4'h8):(1'h0)] wire32;
  input wire [(5'h15):(1'h0)] wire31;
  wire signed [(4'hb):(1'h0)] wire100;
  wire [(4'hd):(1'h0)] wire99;
  wire signed [(4'hc):(1'h0)] wire98;
  wire signed [(4'hb):(1'h0)] wire97;
  wire [(5'h15):(1'h0)] wire85;
  wire signed [(4'h9):(1'h0)] wire84;
  wire [(4'he):(1'h0)] wire83;
  wire [(4'he):(1'h0)] wire82;
  wire signed [(3'h4):(1'h0)] wire81;
  wire [(3'h7):(1'h0)] wire80;
  wire signed [(3'h6):(1'h0)] wire79;
  wire signed [(5'h10):(1'h0)] wire78;
  wire [(3'h6):(1'h0)] wire77;
  wire signed [(2'h3):(1'h0)] wire76;
  wire signed [(3'h6):(1'h0)] wire75;
  wire signed [(3'h6):(1'h0)] wire60;
  wire [(4'ha):(1'h0)] wire59;
  wire signed [(5'h15):(1'h0)] wire58;
  wire signed [(5'h11):(1'h0)] wire57;
  reg [(4'h9):(1'h0)] reg96 = (1'h0);
  reg [(5'h12):(1'h0)] reg95 = (1'h0);
  reg [(4'h8):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg91 = (1'h0);
  reg [(4'hc):(1'h0)] reg90 = (1'h0);
  reg [(5'h13):(1'h0)] reg89 = (1'h0);
  reg [(3'h7):(1'h0)] reg88 = (1'h0);
  reg [(4'he):(1'h0)] reg87 = (1'h0);
  reg [(3'h5):(1'h0)] reg86 = (1'h0);
  reg [(4'ha):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg73 = (1'h0);
  reg [(3'h5):(1'h0)] reg72 = (1'h0);
  reg [(4'he):(1'h0)] reg71 = (1'h0);
  reg [(2'h2):(1'h0)] reg70 = (1'h0);
  reg signed [(4'he):(1'h0)] reg69 = (1'h0);
  reg [(2'h2):(1'h0)] reg68 = (1'h0);
  reg [(4'ha):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg66 = (1'h0);
  reg [(4'hd):(1'h0)] reg65 = (1'h0);
  reg [(2'h3):(1'h0)] reg64 = (1'h0);
  reg [(3'h7):(1'h0)] reg63 = (1'h0);
  reg [(5'h12):(1'h0)] reg62 = (1'h0);
  reg [(2'h2):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg55 = (1'h0);
  reg [(5'h11):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(5'h15):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg [(4'h8):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(5'h12):(1'h0)] reg46 = (1'h0);
  reg [(4'hc):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg43 = (1'h0);
  reg [(3'h7):(1'h0)] reg42 = (1'h0);
  reg [(5'h10):(1'h0)] reg41 = (1'h0);
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg [(3'h7):(1'h0)] reg36 = (1'h0);
  assign y = {wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
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
                 reg56,
                 reg55,
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
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg36 <= wire34;
      if ((&wire34))
        begin
          if ((($signed(reg36[(1'h1):(1'h1)]) > ((((8'hbc) ?
                  wire32 : wire32) - wire35) ?
              ($signed(wire33) ?
                  (wire33 <<< wire31) : {wire33}) : wire32[(2'h2):(1'h0)])) ^ wire32[(1'h0):(1'h0)]))
            begin
              reg37 <= $signed(wire31);
            end
          else
            begin
              reg37 <= (wire35[(1'h1):(1'h1)] ?
                  wire34[(4'hf):(4'hb)] : {wire31});
              reg38 <= $unsigned($signed(({$unsigned(wire31)} + ($unsigned(wire33) >= $signed(wire34)))));
              reg39 <= reg36;
            end
          if (((^$signed($unsigned($unsigned(wire31)))) ?
              reg37 : $unsigned((((reg39 ? wire35 : wire34) ?
                  (~|reg39) : $unsigned(wire35)) != $unsigned(wire32[(3'h4):(2'h2)])))))
            begin
              reg40 <= reg37;
            end
          else
            begin
              reg40 <= reg36;
              reg41 <= (8'hb3);
              reg42 <= wire34;
              reg43 <= $signed(wire31[(4'hf):(3'h6)]);
              reg44 <= $signed(wire35);
            end
        end
      else
        begin
          if (wire31)
            begin
              reg37 <= $signed(wire33);
              reg38 <= (reg44[(3'h5):(1'h0)] <<< wire33);
              reg39 <= $unsigned((|{((reg42 + reg44) ?
                      wire35[(4'hb):(3'h7)] : (wire34 - wire34))}));
              reg40 <= reg43[(2'h3):(1'h0)];
              reg41 <= $unsigned((~^$signed($signed(wire33[(1'h1):(1'h1)]))));
            end
          else
            begin
              reg37 <= wire33[(2'h2):(1'h1)];
              reg38 <= wire35[(4'hd):(4'ha)];
              reg39 <= (~($signed($signed($signed(reg43))) >>> $unsigned($unsigned($signed((8'haf))))));
              reg40 <= {(~&(~&reg43)), (~|reg44)};
            end
          if ((~&(8'hbb)))
            begin
              reg42 <= ((((~&(reg42 ?
                      wire34 : (8'hb6))) <<< reg44[(4'he):(4'h8)]) ?
                  {(&reg40[(1'h1):(1'h1)])} : {(reg44[(4'hc):(2'h3)] ?
                          reg43 : (+reg38)),
                      {$signed((8'haf))}}) | (~&reg37[(3'h7):(1'h0)]));
              reg43 <= $signed($unsigned((^((reg37 > (8'hbf)) >> (reg41 & reg38)))));
              reg44 <= $unsigned((+({$unsigned(wire33), reg40} - (8'h9f))));
            end
          else
            begin
              reg42 <= reg39[(2'h3):(1'h0)];
            end
          reg45 <= reg44;
          reg46 <= reg45[(4'hc):(3'h4)];
        end
      if ($unsigned($unsigned(((~&(|reg41)) ^ $signed(wire33)))))
        begin
          reg47 <= (reg44[(4'he):(1'h0)] ?
              $signed($unsigned($unsigned(reg42[(3'h5):(1'h0)]))) : reg36);
          if ((reg47 * (reg41 <= $signed(wire34))))
            begin
              reg48 <= (~&($signed((+(~|reg44))) ?
                  $unsigned(((8'hb3) || (8'hba))) : $unsigned($signed(reg45[(3'h6):(2'h3)]))));
              reg49 <= ($signed({wire31[(5'h15):(4'hb)]}) ?
                  wire31 : wire34[(5'h11):(2'h2)]);
              reg50 <= wire33[(1'h0):(1'h0)];
              reg51 <= $signed((~|$signed($signed($unsigned(reg38)))));
            end
          else
            begin
              reg48 <= (reg37 ?
                  (^(($unsigned(reg47) <= reg50) ?
                      $unsigned($signed(reg38)) : ($signed(reg45) & (^reg46)))) : $signed({reg51,
                      $unsigned($signed((8'ha8)))}));
              reg49 <= (^((~reg39) ? (!{(reg41 ^~ reg40)}) : reg38));
              reg50 <= reg45;
            end
        end
      else
        begin
          reg47 <= reg47[(3'h6):(2'h3)];
          if ((~&(wire35[(5'h10):(4'hf)] < $unsigned(wire32))))
            begin
              reg48 <= $signed(reg46[(1'h0):(1'h0)]);
              reg49 <= ($unsigned(reg51) ?
                  $signed(reg44[(4'hb):(3'h4)]) : (reg38 ?
                      (reg36 > ($signed((8'ha9)) - (+reg51))) : ((~(reg49 || reg41)) | reg43)));
              reg50 <= ($unsigned({((reg41 ?
                      reg45 : reg51) || (~(8'hbd)))}) >= reg36[(3'h6):(1'h1)]);
              reg51 <= $unsigned(($signed(($unsigned(reg41) && $unsigned((8'ha6)))) ?
                  $unsigned(($unsigned(reg40) - (-reg42))) : (wire34 ?
                      $signed(((8'hbd) | reg45)) : {{(8'hb8)}})));
              reg52 <= reg38[(2'h3):(2'h3)];
            end
          else
            begin
              reg48 <= ((|(((reg37 >>> reg41) - (8'hb1)) | (((8'ha5) ?
                  reg43 : (8'ha8)) || wire31))) * $signed(((!reg41[(4'hb):(2'h2)]) * reg50[(4'hd):(4'h8)])));
              reg49 <= $signed({$signed(wire31)});
            end
          reg53 <= {reg40};
          reg54 <= $unsigned({{($signed(reg52) ?
                      $unsigned(reg43) : reg38[(1'h0):(1'h0)])}});
        end
      reg55 <= $unsigned({$unsigned($signed({wire32}))});
      reg56 <= ((~|(|$unsigned(reg39[(4'h9):(3'h5)]))) ?
          $unsigned(reg47) : (&$unsigned($signed((wire33 ? wire35 : reg44)))));
    end
  assign wire57 = (wire32 + reg49);
  assign wire58 = $unsigned(((({reg38} ?
                          $signed((8'h9f)) : reg53[(3'h5):(3'h4)]) ^~ $signed((!wire35))) ?
                      reg39 : {(~|reg42[(3'h6):(2'h2)])}));
  assign wire59 = ($unsigned({$signed((8'haf)),
                      $signed($signed((8'hbd)))}) == (reg42 == {(reg45[(4'h8):(2'h3)] ?
                          reg50[(4'hf):(4'hd)] : (reg55 ? reg51 : reg55))}));
  assign wire60 = ((reg55 ?
                          reg49 : (reg48[(1'h0):(1'h0)] ?
                              {$signed(reg41)} : reg56[(2'h3):(1'h0)])) ?
                      reg41[(4'hd):(4'h8)] : reg42[(3'h4):(1'h1)]);
  always
    @(posedge clk) begin
      if ({(^~(~&(8'hab)))})
        begin
          if (reg36)
            begin
              reg61 <= (~|{reg54[(3'h5):(3'h5)],
                  (^(wire32 ? (~reg44) : $signed(wire32)))});
              reg62 <= ({reg43, (~$unsigned($unsigned((8'ha2))))} ?
                  ($unsigned(({(8'hbe), (8'hb7)} | (reg41 ?
                          (8'hae) : (8'haa)))) ?
                      (8'hb6) : $signed((~^reg51))) : reg49);
            end
          else
            begin
              reg61 <= $signed((reg38 && (reg52[(4'hb):(3'h5)] && $signed($unsigned((8'hb6))))));
              reg62 <= $signed(reg61[(1'h0):(1'h0)]);
              reg63 <= ({(8'hbc)} >>> $unsigned(reg39[(2'h3):(2'h2)]));
            end
          if ((&(^reg42)))
            begin
              reg64 <= {{(|((reg53 ~^ reg41) != reg37[(4'h9):(2'h3)])),
                      (wire34[(3'h5):(1'h0)] | $signed((wire31 ?
                          reg37 : wire33)))},
                  $signed(((~^(reg56 || reg39)) ?
                      $signed(reg51[(3'h7):(2'h3)]) : reg47))};
            end
          else
            begin
              reg64 <= $unsigned($unsigned(wire35));
              reg65 <= ((8'ha6) < $unsigned((-(|reg55))));
              reg66 <= reg37[(5'h10):(2'h2)];
              reg67 <= (reg61 ?
                  (reg64 ?
                      $signed(((reg55 ?
                          reg65 : wire31) && reg44[(5'h11):(3'h7)])) : $unsigned(((^~(8'hb6)) > (reg56 ?
                          reg65 : wire31)))) : $unsigned(($signed(reg36) - ($unsigned(reg65) && (+wire60)))));
            end
          if ((wire35[(5'h10):(4'hd)] ?
              reg67[(3'h7):(1'h1)] : $unsigned((reg36[(3'h4):(3'h4)] ?
                  (7'h41) : ({reg36, reg47} ?
                      (8'h9c) : (reg49 ? reg67 : (8'hb1)))))))
            begin
              reg68 <= ($signed($signed(($signed(reg44) - $signed(reg67)))) + wire35[(3'h6):(2'h3)]);
              reg69 <= ($unsigned($signed((~^(reg65 & (8'ha2))))) * ({$unsigned($signed(wire32)),
                      ($signed(reg67) ? reg41 : (reg66 + reg68))} ?
                  {wire60[(2'h3):(2'h2)]} : ($signed((^~(8'haf))) ?
                      $unsigned($unsigned(reg49)) : (&(~&reg67)))));
              reg70 <= (-((($signed(wire33) ? $signed(reg43) : reg54) ?
                  $signed((reg48 >= reg62)) : (~^(!reg46))) * ($unsigned((reg41 == wire35)) != (8'ha1))));
              reg71 <= (((^~(+((8'hac) ^~ reg49))) && reg47[(3'h5):(2'h3)]) >> wire59[(2'h2):(2'h2)]);
              reg72 <= (7'h40);
            end
          else
            begin
              reg68 <= (($unsigned($signed(wire32[(3'h4):(1'h1)])) * (&(~&$unsigned(reg49)))) ?
                  reg39 : ({reg67[(3'h5):(2'h3)],
                      (-(wire57 ? reg37 : (7'h43)))} < (^((wire33 ?
                      reg67 : reg46) * (reg37 ~^ reg36)))));
              reg69 <= reg48;
              reg70 <= reg40;
              reg71 <= ($signed((!(8'hbd))) ?
                  (|(wire59 ?
                      ({wire57, reg67} ?
                          (~^reg49) : wire59[(3'h5):(2'h3)]) : ({reg63,
                          reg48} * (~^(7'h40))))) : reg70);
              reg72 <= (reg70[(1'h1):(1'h1)] - ($unsigned(wire60[(3'h4):(2'h3)]) ?
                  $unsigned((~&(reg46 | reg46))) : ((~(reg49 ?
                      (8'had) : reg42)) ~^ $unsigned(((8'ha8) ?
                      wire33 : reg61)))));
            end
        end
      else
        begin
          if ((^~reg62[(5'h11):(4'hd)]))
            begin
              reg61 <= ((-$unsigned(reg62[(4'ha):(4'h9)])) >= ((~$signed(wire34[(3'h4):(1'h1)])) >>> $signed(reg63)));
            end
          else
            begin
              reg61 <= $signed(reg44);
            end
          reg62 <= $unsigned((-(reg61[(1'h0):(1'h0)] ?
              $signed($signed(reg45)) : $signed(wire34))));
          reg63 <= $signed((|reg37[(5'h14):(3'h5)]));
          if (($signed({reg48[(3'h6):(1'h1)]}) ?
              (reg54[(5'h10):(4'h9)] ?
                  reg66[(3'h6):(1'h0)] : reg56) : (reg67[(4'h8):(3'h4)] ?
                  $unsigned(reg68) : $signed(wire35[(3'h6):(2'h3)]))))
            begin
              reg64 <= (^~($unsigned((&((8'had) ? wire34 : (8'h9f)))) ?
                  (!(8'ha0)) : $signed($signed($unsigned(reg38)))));
            end
          else
            begin
              reg64 <= $signed(({$signed((8'ha9))} ?
                  reg45[(2'h2):(2'h2)] : reg40));
              reg65 <= reg52;
              reg66 <= $signed(((8'hb5) ?
                  ($signed(reg36) ?
                      reg71 : $signed((reg39 ? wire33 : reg36))) : wire58));
              reg67 <= {$unsigned($unsigned(($unsigned(reg68) != (^wire34))))};
              reg68 <= wire33;
            end
          if ((reg52[(2'h2):(2'h2)] ?
              reg48 : $unsigned($unsigned((reg61 * $signed(reg50))))))
            begin
              reg69 <= reg49;
            end
          else
            begin
              reg69 <= wire33[(1'h0):(1'h0)];
              reg70 <= reg50;
            end
        end
      reg73 <= reg61;
      reg74 <= reg52[(3'h7):(2'h3)];
    end
  assign wire75 = ((7'h44) & reg63);
  assign wire76 = reg50;
  assign wire77 = ($unsigned(reg70[(1'h1):(1'h0)]) <<< ({(~|(reg56 ?
                              (8'hba) : reg73)),
                          reg48[(3'h4):(1'h0)]} ?
                      reg74[(1'h1):(1'h0)] : $unsigned(($signed(reg62) ?
                          {reg64} : reg55[(3'h7):(3'h5)]))));
  assign wire78 = {(|reg74), (reg43 << (~$unsigned($signed(reg56))))};
  assign wire79 = ({(((reg46 >= wire33) ?
                              (reg51 || reg38) : {wire77,
                                  reg69}) <<< ($unsigned(reg64) & $signed(reg54)))} ?
                      $signed($signed({(~reg47),
                          ((8'ha8) ? reg49 : reg67)})) : {$unsigned(reg68)});
  assign wire80 = reg51[(3'h6):(2'h2)];
  assign wire81 = wire57;
  assign wire82 = (~(reg43[(3'h6):(2'h3)] ?
                      (((^reg50) + (reg71 < reg68)) != $unsigned($unsigned(reg62))) : ((~|{reg64,
                          reg52}) | $unsigned(reg70[(1'h0):(1'h0)]))));
  assign wire83 = reg65;
  assign wire84 = reg55[(3'h6):(3'h6)];
  assign wire85 = {reg65[(3'h7):(1'h1)]};
  always
    @(posedge clk) begin
      reg86 <= wire84[(3'h6):(1'h0)];
      reg87 <= $unsigned((reg63 ?
          ((~&wire57) ~^ reg72) : $unsigned((reg38[(2'h2):(2'h2)] <= (wire75 ?
              reg55 : reg44)))));
    end
  always
    @(posedge clk) begin
      if (({$signed($unsigned($unsigned(reg44))),
          reg66[(3'h5):(1'h1)]} <<< $signed($signed((^~{(8'hb4), reg71})))))
        begin
          if (((~&$unsigned((+(8'hab)))) ?
              $unsigned($unsigned(wire34[(5'h13):(4'hd)])) : $unsigned(reg87[(4'hd):(3'h5)])))
            begin
              reg88 <= reg50[(4'hf):(3'h6)];
              reg89 <= (((~|(reg47 ? reg86 : (wire58 ? wire59 : (8'h9e)))) ?
                  ({(reg73 ? (7'h44) : reg51), $signed((8'hbd))} >> ({reg49,
                      wire84} << reg63[(2'h2):(2'h2)])) : $unsigned($signed(((8'ha8) != wire60)))) != $unsigned((&reg72)));
              reg90 <= {$unsigned(wire80),
                  $unsigned(($unsigned((~&(8'had))) ~^ (reg62 > $unsigned(reg63))))};
              reg91 <= wire75;
            end
          else
            begin
              reg88 <= $signed((($signed((reg91 >= wire79)) | ($unsigned(reg74) ?
                      $signed(reg50) : $unsigned(reg62))) ?
                  ($signed(reg39) ~^ ((reg46 ?
                      reg43 : (8'hbb)) <<< ((8'hbd) >= reg86))) : $unsigned({reg71,
                      $signed(wire58)})));
              reg89 <= reg50;
              reg90 <= {((((reg65 + reg61) >> $signed(wire77)) ?
                          (reg61[(1'h0):(1'h0)] ? reg68 : (+reg41)) : wire31) ?
                      (reg68[(2'h2):(1'h1)] ?
                          $unsigned(((8'hbb) ?
                              wire57 : wire84)) : ($unsigned((8'hae)) >> {reg40})) : $signed(($unsigned(reg63) + (-reg41))))};
              reg91 <= $unsigned(wire76);
              reg92 <= (^$unsigned(reg74[(2'h3):(2'h3)]));
            end
        end
      else
        begin
          if ($signed($unsigned({$signed((!wire80))})))
            begin
              reg88 <= ((8'hb1) <= $unsigned($signed((~|$unsigned(wire60)))));
              reg89 <= (~^reg42[(1'h1):(1'h0)]);
              reg90 <= wire84;
              reg91 <= reg53;
              reg92 <= (wire82[(1'h1):(1'h0)] ?
                  ((wire35[(3'h7):(3'h5)] ?
                      (!(^~reg52)) : wire83[(4'he):(4'h9)]) ^ reg89) : $unsigned((reg40[(4'h8):(1'h1)] ?
                      wire84 : ((wire76 ?
                          reg36 : reg47) >>> $signed(wire57)))));
            end
          else
            begin
              reg88 <= $signed(wire58[(4'hb):(3'h4)]);
            end
          reg93 <= {$unsigned((8'hb3))};
          reg94 <= (reg90 | ({$signed($unsigned(wire81))} ?
              $signed(((!wire77) || $signed(reg71))) : (|$signed(reg56))));
          reg95 <= $signed($signed(({$unsigned((8'ha0)),
              (8'haf)} & $signed(reg38[(2'h3):(1'h0)]))));
          reg96 <= reg48[(2'h2):(1'h0)];
        end
    end
  assign wire97 = reg44;
  assign wire98 = (~|$unsigned(reg41));
  assign wire99 = reg36;
  assign wire100 = {{$signed((~$unsigned(reg88)))},
                       (wire81 ?
                           ({$unsigned((7'h43))} >> $signed((8'had))) : $unsigned($signed($signed(reg94))))};
endmodule
