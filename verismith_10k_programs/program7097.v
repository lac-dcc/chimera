module top
#(parameter param169 = ((((((8'ha2) ? (8'ha6) : (8'hbd)) ^ ((8'haa) ? (8'hbe) : (8'hb0))) || ({(8'hab), (8'ha9)} >>> ((8'ha4) < (8'hb5)))) ? {{((8'hbf) ? (8'hb1) : (8'haf))}, (~^(8'h9e))} : {(!(!(8'hba))), (^((8'hb4) < (7'h43)))}) ^ {(~^(~&((8'ha0) ^~ (8'ha7))))}), 
parameter param170 = (((param169 ? {(param169 < param169)} : ((param169 && param169) + (~|param169))) ~^ (-((param169 ? (7'h43) : param169) != (param169 ? param169 : param169)))) ? (~^(|param169)) : ((((param169 ? param169 : param169) ? (param169 >= param169) : (param169 ? param169 : param169)) ? {(^~param169), (param169 ? param169 : param169)} : (param169 ? (~(8'ha5)) : {param169})) ~^ {param169})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire168;
  wire signed [(5'h10):(1'h0)] wire167;
  wire [(4'hd):(1'h0)] wire166;
  wire [(5'h12):(1'h0)] wire165;
  wire [(4'hc):(1'h0)] wire163;
  wire signed [(4'ha):(1'h0)] wire4;
  assign y = {wire168, wire167, wire166, wire165, wire163, wire4, (1'h0)};
  assign wire4 = (-wire3[(3'h7):(3'h6)]);
  module5 #() modinst164 (.y(wire163), .wire6(wire2), .wire9(wire3), .wire8(wire0), .wire7(wire4), .clk(clk));
  assign wire165 = $unsigned(((-(!wire3[(4'h8):(4'h8)])) - ((wire4[(1'h0):(1'h0)] ?
                           $signed(wire2) : (wire1 - wire3)) ?
                       wire163[(4'ha):(2'h3)] : wire163[(3'h4):(3'h4)])));
  assign wire166 = (&(-$unsigned({$signed(wire0)})));
  assign wire167 = wire1;
  assign wire168 = wire4;
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h1ec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire6;
  input wire signed [(4'ha):(1'h0)] wire7;
  input wire [(5'h11):(1'h0)] wire8;
  input wire [(4'hd):(1'h0)] wire9;
  wire [(3'h6):(1'h0)] wire162;
  wire signed [(5'h15):(1'h0)] wire160;
  wire signed [(3'h7):(1'h0)] wire142;
  wire [(3'h4):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire26;
  wire signed [(5'h12):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire28;
  wire [(3'h5):(1'h0)] wire29;
  wire [(5'h12):(1'h0)] wire30;
  wire [(4'hc):(1'h0)] wire31;
  wire [(4'ha):(1'h0)] wire33;
  wire [(4'hf):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire40;
  wire [(2'h3):(1'h0)] wire41;
  wire [(5'h14):(1'h0)] wire68;
  wire signed [(4'hf):(1'h0)] wire70;
  wire signed [(4'hc):(1'h0)] wire140;
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  reg [(3'h4):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  assign y = {wire162,
                 wire160,
                 wire142,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire33,
                 wire39,
                 wire40,
                 wire41,
                 wire68,
                 wire70,
                 wire140,
                 reg10,
                 reg11,
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
                 reg32,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= $signed({{((wire9 ? wire8 : wire7) ?
                  $unsigned(wire7) : ((8'haa) || wire6)),
              (|$unsigned(wire9))},
          wire6});
      if (($signed($signed(((wire6 ?
          (7'h42) : (8'ha8)) * {(8'hba)}))) <<< (~wire9[(4'h9):(3'h6)])))
        begin
          if ({({({(8'ha2)} ?
                      wire9[(3'h6):(1'h1)] : $unsigned(wire9))} <= wire7)})
            begin
              reg11 <= wire8[(3'h7):(3'h5)];
            end
          else
            begin
              reg11 <= $signed((reg10 ?
                  reg10[(2'h3):(2'h2)] : {((reg11 ? reg10 : wire8) ?
                          $unsigned(wire9) : $unsigned(wire8)),
                      (~&wire7)}));
              reg12 <= reg10;
              reg13 <= wire9;
            end
          reg14 <= (reg12[(2'h2):(1'h0)] >= (wire6[(4'h8):(1'h0)] <<< reg12[(4'hc):(1'h1)]));
          reg15 <= {wire9[(4'hc):(3'h4)], wire6[(4'ha):(4'h9)]};
          if ($signed((($unsigned(reg10[(1'h1):(1'h0)]) ?
                  (wire8 <<< $unsigned(wire9)) : $signed(reg13[(2'h3):(1'h1)])) ?
              ((^~((7'h44) > reg14)) ?
                  (~&reg11) : $unsigned(reg11[(1'h0):(1'h0)])) : (($unsigned(reg12) >> (wire9 && reg14)) >>> (wire8 & (-reg13))))))
            begin
              reg16 <= (reg10 ?
                  reg13 : $unsigned($signed(((reg14 && wire7) ^~ (reg11 ?
                      wire6 : reg13)))));
              reg17 <= $signed($unsigned(reg14));
              reg18 <= ($unsigned(reg15) * wire7);
              reg19 <= reg17;
            end
          else
            begin
              reg16 <= ($unsigned((8'had)) ?
                  (-$unsigned(wire7[(3'h5):(2'h3)])) : (({(wire8 && reg13),
                              wire9} ?
                          $signed((reg18 != reg11)) : $signed(reg19)) ?
                      (8'hb3) : $signed(reg17)));
              reg17 <= reg16[(3'h6):(3'h6)];
              reg18 <= (reg16 ?
                  (wire8[(4'ha):(4'ha)] ?
                      ($unsigned(reg19[(3'h5):(3'h4)]) < ($unsigned(reg16) ?
                          wire7[(3'h7):(2'h2)] : $signed(reg16))) : ($unsigned((8'ha2)) << (~&(|reg10)))) : $signed({{$unsigned(reg17),
                          $unsigned(wire8)}}));
              reg19 <= ({(~^$unsigned($unsigned(reg15)))} ~^ reg14);
              reg20 <= ((&reg16) ?
                  ((~^reg15) ?
                      (reg13[(1'h0):(1'h0)] || $signed((~wire6))) : (8'hbf)) : $unsigned({(-$unsigned((7'h44))),
                      $signed((~&reg12))}));
            end
          reg21 <= $signed(((wire7 & wire9[(4'hc):(2'h2)]) != $signed(((reg17 ^~ reg15) ?
              {(8'had)} : $unsigned((8'ha5))))));
        end
      else
        begin
          reg11 <= ((~(^~((~|(8'hab)) < wire6[(2'h3):(2'h2)]))) | (((reg19[(3'h6):(1'h0)] <= (reg18 ?
                  wire8 : wire9)) >= (wire9[(3'h5):(2'h3)] | (reg10 ?
                  reg12 : (8'hb0)))) ?
              $signed(reg17[(1'h0):(1'h0)]) : reg20[(4'ha):(4'h9)]));
          reg12 <= $signed((reg11[(3'h4):(1'h0)] ?
              $unsigned(reg15) : ({reg20[(1'h1):(1'h0)], (^~reg21)} ?
                  $unsigned(reg16[(3'h4):(1'h0)]) : ($signed(reg20) ^~ $unsigned(reg19)))));
          if (wire6)
            begin
              reg13 <= (((~&wire8[(2'h2):(2'h2)]) != $unsigned((~|(reg16 ?
                      reg14 : reg14)))) ?
                  ({(8'hb3)} ?
                      reg13 : ($unsigned($unsigned(reg18)) ~^ reg14[(4'hc):(3'h4)])) : reg16[(4'h9):(2'h2)]);
              reg14 <= $unsigned({{((~&reg14) && reg17[(3'h4):(3'h4)]),
                      reg15[(4'hb):(2'h3)]},
                  $signed(reg14)});
              reg15 <= $unsigned({(wire7[(3'h6):(3'h6)] ?
                      $signed((reg13 ?
                          reg16 : wire7)) : $unsigned($unsigned(wire8))),
                  reg20[(1'h0):(1'h0)]});
              reg16 <= {(~^$signed($unsigned($unsigned(wire8)))), wire6};
            end
          else
            begin
              reg13 <= {$unsigned({reg18, $unsigned((8'hb7))})};
              reg14 <= $unsigned($signed(reg11[(4'h9):(3'h7)]));
              reg15 <= reg11[(5'h12):(4'ha)];
            end
          reg17 <= ((8'hbe) != {reg21});
        end
      reg22 <= (8'hb9);
      reg23 <= $unsigned({(|{(reg19 - reg17)}), $signed((^$signed((8'h9c))))});
      reg24 <= $unsigned($signed($unsigned({$unsigned((8'ha0)),
          reg17[(2'h2):(1'h1)]})));
    end
  assign wire25 = ((({$signed(wire7),
                          (wire8 ? wire9 : reg24)} ^ reg21[(3'h4):(3'h4)]) ?
                      reg22 : ((reg24[(4'hc):(1'h1)] << (7'h40)) ?
                          $unsigned((reg20 ?
                              reg21 : reg22)) : (7'h40))) >> (({(-wire9)} <= {wire8[(3'h6):(3'h4)],
                      $signed(wire7)}) ~^ reg11[(3'h7):(1'h0)]));
  assign wire26 = reg15[(3'h6):(1'h1)];
  assign wire27 = $signed((&({reg21[(3'h4):(2'h3)],
                      ((8'ha6) ?
                          (7'h44) : (8'ha5))} + $signed(reg13[(2'h2):(2'h2)]))));
  assign wire28 = wire9;
  assign wire29 = reg12;
  assign wire30 = $unsigned((~(reg11[(3'h4):(1'h1)] ? reg12 : (~&(^wire6)))));
  assign wire31 = $signed((($unsigned((reg18 ? reg16 : wire27)) ?
                          ($unsigned((8'hbe)) ?
                              wire6[(3'h7):(2'h2)] : $signed(wire28)) : ({wire7} >> (&reg10))) ?
                      $unsigned({((8'ha9) ?
                              reg21 : reg19)}) : (~&(wire30 != {wire9,
                          reg22}))));
  always
    @(posedge clk) begin
      reg32 <= $unsigned(($unsigned($unsigned((wire26 ?
          reg20 : wire26))) | $unsigned((^~(8'had)))));
    end
  assign wire33 = ($signed(wire8) ^ wire27);
  always
    @(posedge clk) begin
      reg34 <= reg18[(3'h7):(3'h4)];
    end
  always
    @(posedge clk) begin
      reg35 <= ((-(~&(^~(!reg12)))) ? {wire7, reg19} : (~|(reg18 <= wire31)));
      reg36 <= (((~^(^$signed(reg13))) - $unsigned($signed((reg24 ?
          wire26 : reg22)))) ~^ $signed($signed(reg35[(2'h2):(2'h2)])));
      reg37 <= wire30;
      reg38 <= reg37;
    end
  assign wire39 = reg15;
  assign wire40 = (reg34[(1'h1):(1'h1)] ?
                      (({(wire8 ? reg35 : reg35)} ~^ {(wire28 ? wire9 : reg19),
                          wire29[(1'h1):(1'h0)]}) ~^ wire9[(4'hb):(4'ha)]) : (~$signed({(reg35 + reg11)})));
  assign wire41 = (!$signed(wire33[(1'h0):(1'h0)]));
  module42 #() modinst69 (wire68, clk, reg36, reg23, wire31, wire8, reg20);
  assign wire70 = (^reg22);
  module71 #() modinst141 (wire140, clk, reg15, reg13, reg18, wire30, reg37);
  assign wire142 = $unsigned(reg21);
  module143 #() modinst161 (.y(wire160), .wire145(reg18), .wire144(reg20), .clk(clk), .wire146(wire27), .wire147(wire142));
  assign wire162 = (~|$unsigned((wire160 | (-(wire25 ? wire70 : reg36)))));
endmodule

module module143
#(parameter param158 = ((7'h43) && {(((~(8'hbb)) > (~|(8'hbc))) ? (~&((8'hb2) ? (8'h9e) : (8'hb4))) : (~^((8'hbd) >>> (8'hb5))))}), 
parameter param159 = (((((param158 ^~ (8'hb1)) ? (~param158) : ((8'haf) >>> param158)) >= (^(~&param158))) ? (((param158 >>> param158) * {param158}) <= param158) : (&param158)) ? (~|(((~^(8'hab)) >>> (8'ha0)) ? {(8'hb9), (-param158)} : (+(^~param158)))) : ((((param158 ? param158 : param158) ? param158 : param158) & ({param158} * (8'hb8))) ? {(param158 ? (param158 ? param158 : param158) : ((8'hb3) - param158))} : {((8'had) ? (^~param158) : (^~param158))})))
(y, clk, wire147, wire146, wire145, wire144);
  output wire [(32'hb2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire147;
  input wire [(3'h5):(1'h0)] wire146;
  input wire [(4'hd):(1'h0)] wire145;
  input wire signed [(4'h9):(1'h0)] wire144;
  wire [(5'h12):(1'h0)] wire157;
  wire [(5'h15):(1'h0)] wire151;
  wire [(5'h14):(1'h0)] wire150;
  wire [(4'hc):(1'h0)] wire149;
  wire [(5'h12):(1'h0)] wire148;
  reg [(5'h11):(1'h0)] reg156 = (1'h0);
  reg [(5'h11):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg154 = (1'h0);
  reg [(5'h12):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg152 = (1'h0);
  assign y = {wire157,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 (1'h0)};
  assign wire148 = wire145;
  assign wire149 = (^(-(wire147[(3'h6):(1'h0)] - ((~^wire144) >> $unsigned((8'h9e))))));
  assign wire150 = (~&$signed((wire148[(4'hb):(4'h8)] ?
                       (wire148 ^~ $signed(wire146)) : $signed((!wire147)))));
  assign wire151 = $signed((($signed((^~wire144)) - {wire150[(5'h11):(4'h9)]}) ?
                       (&wire147) : $unsigned($signed(wire149))));
  always
    @(posedge clk) begin
      reg152 <= ({((~|wire145) | wire145),
          (^~{((7'h42) ? wire151 : wire145)})} <= wire144);
      if (reg152[(4'hc):(3'h6)])
        begin
          reg153 <= $unsigned($unsigned((((+wire150) ?
                  wire147[(3'h6):(2'h2)] : wire147[(1'h1):(1'h1)]) ?
              (-((8'haa) + wire149)) : wire149)));
          reg154 <= wire150;
        end
      else
        begin
          reg153 <= wire147;
          reg154 <= reg154;
          reg155 <= $unsigned((((!(~^wire144)) - $signed(wire147)) < (wire149[(4'hc):(3'h4)] != {reg152[(4'hb):(3'h5)],
              $unsigned(reg153)})));
        end
      reg156 <= $unsigned((wire144[(3'h5):(3'h4)] & $signed(((wire149 ?
              wire147 : wire149) ?
          (~reg153) : wire147))));
    end
  assign wire157 = wire150;
endmodule

module module71  (y, clk, wire76, wire75, wire74, wire73, wire72);
  output wire [(32'h28b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire76;
  input wire [(4'h9):(1'h0)] wire75;
  input wire signed [(5'h13):(1'h0)] wire74;
  input wire [(4'h8):(1'h0)] wire73;
  input wire [(2'h2):(1'h0)] wire72;
  wire signed [(5'h11):(1'h0)] wire139;
  wire [(4'h8):(1'h0)] wire138;
  wire signed [(4'hf):(1'h0)] wire128;
  wire signed [(4'hf):(1'h0)] wire92;
  wire [(3'h4):(1'h0)] wire91;
  wire [(3'h7):(1'h0)] wire90;
  wire [(4'h9):(1'h0)] wire89;
  wire [(4'ha):(1'h0)] wire82;
  wire signed [(4'h9):(1'h0)] wire81;
  wire [(3'h6):(1'h0)] wire80;
  wire signed [(5'h14):(1'h0)] wire79;
  wire [(4'hf):(1'h0)] wire78;
  wire signed [(5'h10):(1'h0)] wire77;
  reg signed [(5'h12):(1'h0)] reg137 = (1'h0);
  reg [(4'he):(1'h0)] reg136 = (1'h0);
  reg [(3'h6):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg134 = (1'h0);
  reg [(5'h15):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg132 = (1'h0);
  reg [(2'h3):(1'h0)] reg131 = (1'h0);
  reg [(5'h15):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg129 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg127 = (1'h0);
  reg [(4'hb):(1'h0)] reg126 = (1'h0);
  reg [(4'ha):(1'h0)] reg125 = (1'h0);
  reg [(4'hf):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg123 = (1'h0);
  reg [(2'h2):(1'h0)] reg122 = (1'h0);
  reg [(5'h12):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg120 = (1'h0);
  reg [(3'h6):(1'h0)] reg119 = (1'h0);
  reg [(5'h15):(1'h0)] reg118 = (1'h0);
  reg [(4'hf):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg114 = (1'h0);
  reg [(3'h6):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg112 = (1'h0);
  reg [(2'h2):(1'h0)] reg111 = (1'h0);
  reg [(4'hb):(1'h0)] reg110 = (1'h0);
  reg [(3'h4):(1'h0)] reg109 = (1'h0);
  reg [(4'ha):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg107 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg106 = (1'h0);
  reg [(2'h3):(1'h0)] reg105 = (1'h0);
  reg [(4'hb):(1'h0)] reg104 = (1'h0);
  reg [(5'h11):(1'h0)] reg103 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg98 = (1'h0);
  reg [(3'h4):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg96 = (1'h0);
  reg [(3'h6):(1'h0)] reg95 = (1'h0);
  reg [(4'hf):(1'h0)] reg94 = (1'h0);
  reg [(4'ha):(1'h0)] reg93 = (1'h0);
  reg [(2'h3):(1'h0)] reg88 = (1'h0);
  reg [(5'h12):(1'h0)] reg87 = (1'h0);
  reg [(3'h7):(1'h0)] reg86 = (1'h0);
  reg signed [(4'he):(1'h0)] reg85 = (1'h0);
  reg [(4'hc):(1'h0)] reg84 = (1'h0);
  reg [(3'h7):(1'h0)] reg83 = (1'h0);
  assign y = {wire139,
                 wire138,
                 wire128,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
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
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
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
                 reg95,
                 reg94,
                 reg93,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 (1'h0)};
  assign wire77 = ((wire76[(3'h4):(3'h4)] ?
                          $unsigned((~^(wire73 ?
                              wire76 : wire75))) : (((-(8'hae)) && (&wire73)) ?
                              $signed((~&wire72)) : $unsigned((wire73 ?
                                  wire74 : (8'h9f))))) ?
                      (((!$signed(wire73)) & (wire72 + wire75[(3'h7):(1'h0)])) ?
                          wire73[(3'h6):(1'h0)] : wire76[(3'h6):(2'h3)]) : $signed({wire72[(1'h0):(1'h0)],
                          ($signed(wire74) ? (+(8'hbd)) : (~&(7'h41)))}));
  assign wire78 = wire72;
  assign wire79 = wire72[(2'h2):(1'h1)];
  assign wire80 = ((wire75[(3'h4):(1'h1)] & (8'hb5)) + wire76);
  assign wire81 = ((^((+wire74) ? (8'hbf) : $unsigned($unsigned((7'h43))))) ?
                      wire72[(2'h2):(2'h2)] : ((((wire76 || wire79) >= $unsigned(wire78)) ?
                          $unsigned((wire77 ?
                              wire72 : (7'h44))) : wire76[(4'hc):(4'hb)]) << ((-$unsigned(wire74)) ?
                          $unsigned($unsigned(wire73)) : ((wire78 ?
                                  wire76 : wire74) ?
                              $unsigned(wire78) : $signed(wire79)))));
  assign wire82 = $unsigned((($signed(wire75) > (8'hb6)) ?
                      wire73 : $signed((^(^wire79)))));
  always
    @(posedge clk) begin
      if ($unsigned($signed($signed(((wire81 ? wire74 : wire81) ?
          wire81 : ((8'ha9) & wire74))))))
        begin
          reg83 <= $signed((&$unsigned($signed($signed(wire75)))));
        end
      else
        begin
          reg83 <= ($signed($signed($unsigned(wire81))) ?
              (wire80[(3'h5):(1'h1)] >= (-$signed(wire74[(4'hf):(4'hf)]))) : {($signed((wire78 ?
                      wire81 : wire74)) - wire78),
                  $unsigned(($unsigned(wire81) ?
                      wire74 : (wire79 ? wire77 : wire82)))});
          reg84 <= {$unsigned(($unsigned($signed(wire75)) | $unsigned($unsigned(wire75))))};
          reg85 <= (~|((((wire81 == wire80) ?
              wire82 : $signed(wire74)) != wire72) >> $signed($unsigned((!reg84)))));
        end
      reg86 <= {((-reg83[(3'h7):(2'h2)]) ?
              ((wire82[(3'h7):(3'h6)] <<< wire81[(4'h8):(4'h8)]) == reg85[(3'h7):(1'h1)]) : $signed(($signed(wire73) ?
                  wire81 : reg84[(3'h5):(2'h3)])))};
    end
  always
    @(posedge clk) begin
      reg87 <= wire74;
      reg88 <= ($signed($signed(reg86[(1'h1):(1'h1)])) ?
          (8'hbe) : (wire72[(2'h2):(2'h2)] >= wire77));
    end
  assign wire89 = $unsigned(({wire81, (~$unsigned(wire73))} * reg85));
  assign wire90 = (~|($unsigned(({reg86, wire78} ?
                      (reg83 ? wire77 : wire76) : {wire76,
                          (7'h44)})) ^ (+((wire74 ? wire82 : wire82) ?
                      wire73 : (wire77 ? reg85 : wire80)))));
  assign wire91 = {$signed(wire90[(1'h1):(1'h1)]),
                      ((~&({wire89, wire73} <= $signed(wire82))) << wire76)};
  assign wire92 = ((((&reg88[(2'h3):(1'h0)]) != $signed((wire78 ?
                      wire89 : wire74))) >= (wire90 | (8'hbd))) || ((&{$signed(wire78),
                      $signed(wire80)}) || (8'hbe)));
  always
    @(posedge clk) begin
      if ($signed($unsigned(reg83[(1'h1):(1'h1)])))
        begin
          reg93 <= (~(8'ha3));
          reg94 <= ((^~$signed(($signed(wire92) & wire89[(2'h2):(1'h0)]))) ?
              wire78[(4'ha):(3'h5)] : $unsigned($signed((((8'haa) >= reg85) ?
                  wire82[(4'h8):(3'h5)] : ((8'hb9) >> reg84)))));
        end
      else
        begin
          if (($unsigned((~|{(wire78 ^ reg93)})) * ($signed($signed(wire80)) ?
              ($signed(wire89[(3'h7):(1'h0)]) ?
                  $unsigned((8'ha8)) : {$signed(wire73),
                      $unsigned(reg88)}) : ($unsigned((wire76 ?
                  wire72 : wire90)) ^ (~|wire91[(1'h1):(1'h0)])))))
            begin
              reg93 <= {$signed(reg93[(4'h9):(1'h0)]),
                  ($signed(wire75) ^~ $unsigned((reg83[(3'h5):(2'h2)] << (+wire89))))};
              reg94 <= wire82;
              reg95 <= ((^wire90) ?
                  $unsigned((reg85[(1'h1):(1'h1)] ?
                      reg85[(4'he):(1'h1)] : {wire75})) : ((wire89 ?
                      (+wire75[(1'h1):(1'h1)]) : (~|$signed((8'haf)))) <= $unsigned((8'hb1))));
            end
          else
            begin
              reg93 <= $signed(($unsigned(((reg87 ?
                      wire75 : (8'h9e)) ^~ wire73[(1'h0):(1'h0)])) ?
                  wire91[(1'h0):(1'h0)] : $signed(((wire74 ? reg86 : (8'ha4)) ?
                      $unsigned(wire81) : reg87[(4'h9):(3'h5)]))));
              reg94 <= $unsigned(reg88[(1'h0):(1'h0)]);
            end
          reg96 <= (8'h9d);
          reg97 <= (reg85 - $unsigned($unsigned((+$unsigned(wire81)))));
          if ($signed(reg84))
            begin
              reg98 <= $signed((&(((wire82 * wire74) > (~&wire80)) + wire79)));
              reg99 <= (~wire90);
              reg100 <= reg83[(3'h7):(1'h0)];
            end
          else
            begin
              reg98 <= {(^reg94[(1'h0):(1'h0)])};
              reg99 <= wire91;
              reg100 <= wire73[(1'h0):(1'h0)];
            end
        end
      reg101 <= $signed($unsigned((((reg93 ? (8'ha5) : reg83) ^~ reg95) ?
          wire81[(1'h1):(1'h1)] : ($signed((8'hb5)) ?
              $unsigned(reg85) : reg87[(3'h7):(3'h5)]))));
      if (wire91)
        begin
          if ($signed((((~|(wire76 ? wire78 : reg83)) >>> ($unsigned(reg93) ?
              wire82[(3'h4):(1'h0)] : (~|(8'haf)))) <<< wire74[(5'h13):(4'hc)])))
            begin
              reg102 <= $unsigned($unsigned(wire77[(4'h8):(1'h0)]));
              reg103 <= wire92;
            end
          else
            begin
              reg102 <= (8'had);
              reg103 <= (reg95 ? $signed($signed(wire75)) : wire80);
              reg104 <= $unsigned(reg102[(1'h1):(1'h0)]);
              reg105 <= {$signed((~((wire77 ? reg84 : wire79) ?
                      {wire91} : wire73[(1'h0):(1'h0)]))),
                  (|$signed({$unsigned(reg101)}))};
            end
          reg106 <= ($unsigned(wire90) > (~&$signed(({reg99, wire90} ?
              (&wire82) : (|reg104)))));
          reg107 <= ($unsigned(reg85) >>> reg102);
          reg108 <= {reg93[(4'h9):(4'h8)]};
        end
      else
        begin
          if ($signed(reg103[(4'he):(4'hd)]))
            begin
              reg102 <= ($unsigned($unsigned({wire74[(5'h10):(3'h6)],
                      $signed(reg93)})) ?
                  (wire75 || (reg104 ?
                      reg104[(3'h6):(2'h3)] : {(wire73 ? reg97 : reg96),
                          $signed(reg95)})) : (+$signed({(wire91 * reg93),
                      (&wire90)})));
            end
          else
            begin
              reg102 <= (reg98 >= (($signed($signed(reg104)) ?
                  (^{(8'hb1)}) : reg97) || (((wire80 ? wire82 : reg87) ?
                  (reg107 ~^ wire82) : wire81) == ({wire77} ?
                  $signed((7'h42)) : reg95))));
              reg103 <= {$signed(reg94[(3'h5):(3'h4)]),
                  ($signed(wire81) ^ $signed(reg94[(4'hc):(4'hc)]))};
            end
        end
      if ((~^wire72[(2'h2):(1'h0)]))
        begin
          reg109 <= $signed((reg94 | wire80));
          reg110 <= reg102;
          reg111 <= $signed(($signed((reg86[(1'h1):(1'h0)] ?
              $unsigned(reg101) : (&reg102))) ~^ wire91));
          reg112 <= reg109;
          reg113 <= (8'ha7);
        end
      else
        begin
          reg109 <= $signed(((~&{$unsigned(reg83)}) ?
              $signed(reg100[(3'h4):(1'h1)]) : (((reg102 >>> wire73) ?
                  $signed(reg94) : (wire77 ~^ reg99)) > $signed($unsigned(reg88)))));
          reg110 <= (reg109[(1'h1):(1'h0)] ?
              ($signed((^~$signed(reg109))) ?
                  $signed((-(reg103 ?
                      (8'ha2) : reg105))) : ($signed(wire89[(3'h5):(2'h3)]) > ($unsigned(reg102) < (reg104 ?
                      reg88 : reg110)))) : ($unsigned((&$signed(reg86))) ?
                  $unsigned((^$signed(reg86))) : wire75[(1'h1):(1'h1)]));
          if ((reg108 ?
              {reg110[(1'h0):(1'h0)], {wire80}} : {(~&wire76[(3'h4):(1'h1)])}))
            begin
              reg111 <= wire75[(2'h3):(2'h3)];
              reg112 <= ($signed(wire90) >= {$signed(((reg102 == reg96) ?
                      reg103[(5'h11):(4'hf)] : $signed(reg84)))});
              reg113 <= ($signed($unsigned((|{reg102, reg110}))) ?
                  (((reg97[(1'h1):(1'h1)] - $signed(wire74)) ?
                          $signed({(8'hba), wire76}) : {$unsigned(wire76)}) ?
                      (reg88[(2'h2):(1'h0)] ?
                          (8'hb8) : (~^reg110)) : (~($signed(wire72) ?
                          ((8'hbb) ^ reg104) : (reg96 || reg111)))) : (wire72[(1'h1):(1'h1)] >> (($unsigned((8'hb3)) ^ $signed(reg85)) ?
                      (+$unsigned((8'hb1))) : reg83[(3'h5):(1'h1)])));
              reg114 <= $unsigned(wire77);
              reg115 <= wire89;
            end
          else
            begin
              reg111 <= (+$unsigned((!{$unsigned(reg86)})));
            end
          reg116 <= $unsigned((^(($unsigned(reg111) ?
              $unsigned((7'h41)) : wire79) < $unsigned((8'hae)))));
        end
    end
  always
    @(posedge clk) begin
      reg117 <= reg101;
      if (((&(reg104[(3'h6):(3'h5)] << (|{reg116}))) ?
          (~^wire82) : ($unsigned({(reg99 >= wire72)}) == (+$signed(reg117)))))
        begin
          if ($signed(reg101))
            begin
              reg118 <= $unsigned((~|$signed(reg101[(1'h0):(1'h0)])));
              reg119 <= reg88[(2'h2):(2'h2)];
              reg120 <= $unsigned((reg99 >> $signed($unsigned((reg88 <<< reg104)))));
            end
          else
            begin
              reg118 <= $unsigned($unsigned({wire79[(5'h12):(5'h10)],
                  (((7'h44) * reg100) != {reg84})}));
            end
          reg121 <= $unsigned($signed($signed($signed(((8'ha8) == reg109)))));
          reg122 <= reg105[(1'h0):(1'h0)];
          reg123 <= wire90;
          reg124 <= $unsigned($unsigned($unsigned((((7'h44) ?
              wire80 : (8'h9d)) >>> (~reg107)))));
        end
      else
        begin
          if ((reg111[(2'h2):(1'h0)] <<< $unsigned(($signed(reg108[(3'h6):(3'h5)]) ?
              $signed($signed(reg115)) : $signed((!wire79))))))
            begin
              reg118 <= $signed((($signed((wire75 ?
                  reg121 : reg98)) & (~&reg106[(2'h2):(2'h2)])) == (|(|reg102[(3'h5):(2'h2)]))));
              reg119 <= $unsigned(($signed(($unsigned(wire92) * $unsigned(reg104))) | $unsigned((8'hb0))));
              reg120 <= wire92[(3'h5):(3'h5)];
              reg121 <= (|(reg114 * $unsigned({$signed((8'ha0)),
                  ((8'hb1) ? reg107 : reg109)})));
            end
          else
            begin
              reg118 <= (((~^$unsigned((wire81 < wire75))) ?
                      wire73[(3'h7):(3'h6)] : $signed(wire92)) ?
                  reg105[(2'h3):(1'h1)] : (reg96[(4'he):(4'hc)] ?
                      $signed((^~(~|reg103))) : (!($signed(reg93) >= $signed((8'ha7))))));
              reg119 <= reg116[(2'h3):(2'h2)];
              reg120 <= reg122;
              reg121 <= $unsigned(({(+(reg113 & wire78))} == {reg98[(4'h8):(3'h7)]}));
              reg122 <= $unsigned(reg119);
            end
          reg123 <= (((reg83 ?
              (!reg94) : $signed(wire75[(2'h3):(2'h2)])) > $signed((&(reg106 < (8'ha1))))) <= reg84[(2'h3):(2'h2)]);
          reg124 <= wire72[(2'h2):(1'h1)];
          reg125 <= $signed(((($unsigned(reg111) ~^ (wire89 ?
                      wire73 : (8'ha9))) ?
                  reg113 : $signed($unsigned(reg105))) ?
              reg87 : {($unsigned((8'ha7)) ?
                      ((8'hbf) ? wire74 : wire80) : $unsigned(reg96)),
                  wire90[(2'h3):(1'h0)]}));
        end
    end
  always
    @(posedge clk) begin
      reg126 <= (^~$unsigned($unsigned(reg118)));
      reg127 <= $signed(reg126[(3'h5):(2'h2)]);
    end
  assign wire128 = (((^~$unsigned((reg125 ? reg112 : reg118))) ?
                       reg109[(2'h2):(1'h0)] : (~^reg121[(3'h6):(2'h2)])) + reg126[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg129 <= wire79[(2'h3):(2'h3)];
      reg130 <= (~&reg122[(2'h2):(1'h1)]);
      if (reg108[(1'h0):(1'h0)])
        begin
          reg131 <= ($signed(reg83[(3'h4):(1'h1)]) ?
              {wire128[(4'hc):(4'hc)]} : (-$unsigned($signed((reg106 ?
                  (8'hac) : reg111)))));
          reg132 <= (8'ha0);
          reg133 <= (8'ha5);
        end
      else
        begin
          if ((reg118 >> reg110[(2'h2):(1'h0)]))
            begin
              reg131 <= reg118;
              reg132 <= (reg98 >>> reg133);
            end
          else
            begin
              reg131 <= $signed(wire77);
              reg132 <= {(wire72 * (($unsigned(reg106) && {reg101, reg122}) ?
                      {(!(8'hbc))} : reg113[(3'h4):(2'h3)])),
                  reg115};
            end
          reg133 <= wire82;
          if ((+(reg97[(2'h2):(1'h1)] ?
              reg94[(1'h0):(1'h0)] : (-reg133[(2'h2):(1'h1)]))))
            begin
              reg134 <= (8'hb4);
              reg135 <= reg112;
            end
          else
            begin
              reg134 <= ((reg116[(3'h5):(3'h4)] ?
                      $signed($unsigned((^~reg122))) : (((reg134 ?
                              wire90 : reg98) >>> (~|reg134)) ?
                          $unsigned($unsigned(wire82)) : $signed((|wire74)))) ?
                  $unsigned((reg111 ?
                      ((reg109 - wire73) << (wire81 ?
                          reg124 : reg125)) : reg112[(2'h2):(1'h1)])) : (^$unsigned($unsigned($unsigned(reg88)))));
            end
          reg136 <= reg103;
          reg137 <= ($signed((reg102[(3'h7):(2'h2)] | ((reg125 ?
                  (7'h44) : (8'ha5)) << $signed(reg110)))) ?
              reg124[(1'h0):(1'h0)] : (~(reg113[(2'h2):(2'h2)] ?
                  $signed($signed(reg93)) : ((wire72 ?
                      reg86 : reg123) <= (reg120 ? wire82 : (8'hb6))))));
        end
    end
  assign wire138 = (8'hab);
  assign wire139 = wire89;
endmodule

module module42  (y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire47;
  input wire signed [(4'he):(1'h0)] wire46;
  input wire signed [(3'h7):(1'h0)] wire45;
  input wire signed [(3'h7):(1'h0)] wire44;
  input wire signed [(3'h7):(1'h0)] wire43;
  wire signed [(4'h8):(1'h0)] wire57;
  wire signed [(4'hc):(1'h0)] wire56;
  wire signed [(4'ha):(1'h0)] wire53;
  wire signed [(5'h11):(1'h0)] wire52;
  wire [(4'he):(1'h0)] wire51;
  wire [(4'hc):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire49;
  wire signed [(4'ha):(1'h0)] wire48;
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  reg [(4'h8):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg64 = (1'h0);
  reg [(5'h11):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg62 = (1'h0);
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg [(2'h2):(1'h0)] reg59 = (1'h0);
  reg [(3'h4):(1'h0)] reg58 = (1'h0);
  reg [(5'h13):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg55,
                 reg54,
                 (1'h0)};
  assign wire48 = wire45[(1'h1):(1'h1)];
  assign wire49 = {$signed(({wire47} <<< (wire45[(3'h6):(3'h4)] ~^ $unsigned(wire46))))};
  assign wire50 = (($unsigned(wire49) ?
                      wire44 : {$unsigned((wire44 ?
                              wire49 : (8'hb2)))}) ^ $signed($signed($unsigned($signed(wire47)))));
  assign wire51 = wire49;
  assign wire52 = (^((wire49[(1'h1):(1'h0)] ?
                      ($signed(wire43) ?
                          wire45 : $signed((8'hbc))) : (^~(|wire47))) < wire47[(1'h1):(1'h1)]));
  assign wire53 = $signed((|(8'h9f)));
  always
    @(posedge clk) begin
      reg54 <= wire43;
      reg55 <= (reg54 < (~{($unsigned(wire51) >>> (wire43 >= wire49))}));
    end
  assign wire56 = reg54;
  assign wire57 = wire46[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      reg58 <= (($unsigned((^~{wire43})) << (wire46 ?
              {$unsigned(reg54), (wire46 ? wire52 : wire52)} : {(wire48 ?
                      wire53 : wire46),
                  (wire48 ? wire50 : wire47)})) ?
          wire50 : wire47);
      reg59 <= (reg58[(1'h0):(1'h0)] ?
          {((8'hb3) || $signed((wire44 >>> wire49))), wire50} : (~^reg55));
      if (((^wire44) ? wire56 : (~&wire51)))
        begin
          reg60 <= $unsigned((~^(-$signed((wire52 ? reg55 : wire47)))));
          reg61 <= (!({$signed((wire51 ? wire46 : wire48))} ?
              reg60 : {$unsigned(wire51)}));
          if ({$unsigned(wire44[(3'h7):(2'h2)]),
              $unsigned((((~|reg54) > (~&(8'haa))) ?
                  wire47[(2'h2):(1'h1)] : $unsigned((reg61 ?
                      wire57 : reg60))))})
            begin
              reg62 <= wire45[(2'h3):(2'h3)];
              reg63 <= wire50;
            end
          else
            begin
              reg62 <= ($signed((^wire44[(1'h0):(1'h0)])) <= ((!$signed(reg60)) ?
                  reg60[(3'h4):(2'h2)] : (($signed(reg60) && {wire53,
                          (8'haf)}) ?
                      (wire44[(1'h0):(1'h0)] <<< (8'hb5)) : ((reg54 ?
                          (8'hb2) : reg59) >> $signed((8'hb1))))));
              reg63 <= (8'haa);
            end
          reg64 <= {$unsigned((+($unsigned(wire51) <= $signed(wire48))))};
          reg65 <= {(|((~^$signed(reg54)) ?
                  $signed(wire50) : ((!reg59) ? {wire45, reg54} : (|reg55))))};
        end
      else
        begin
          reg60 <= $signed(wire44[(2'h3):(2'h2)]);
        end
      reg66 <= wire44[(2'h3):(1'h1)];
      reg67 <= $unsigned((~|{$unsigned(((8'hac) && reg65))}));
    end
endmodule
