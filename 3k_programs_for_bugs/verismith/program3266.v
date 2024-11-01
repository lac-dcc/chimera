module top
#(parameter param176 = (({(((8'ha2) | (8'hb6)) << (^~(7'h43))), (~^((7'h42) >>> (8'hb0)))} ^~ {(((8'h9d) & (7'h41)) >> (~&(8'ha3)))}) ? (~((^((8'ha8) ? (8'h9f) : (8'hac))) ? (((8'hbe) ? (8'ha3) : (7'h41)) ? (|(8'hbf)) : (8'ha6)) : (~((8'had) ? (8'ha0) : (7'h43))))) : (^~({((8'h9d) ? (8'hb9) : (8'hb4)), (|(8'hb1))} ? (&((8'hae) ? (7'h40) : (8'haa))) : {((8'hb7) ? (8'hbd) : (8'ha4))}))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1bb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  wire [(3'h7):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire12;
  wire [(4'h8):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire15;
  wire [(4'hc):(1'h0)] wire25;
  wire [(3'h5):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire27;
  wire [(4'hf):(1'h0)] wire28;
  wire signed [(3'h5):(1'h0)] wire29;
  wire signed [(3'h5):(1'h0)] wire30;
  wire signed [(3'h5):(1'h0)] wire31;
  wire signed [(2'h2):(1'h0)] wire32;
  wire [(3'h7):(1'h0)] wire36;
  wire signed [(4'hd):(1'h0)] wire169;
  reg [(4'hb):(1'h0)] reg175 = (1'h0);
  reg [(4'h9):(1'h0)] reg174 = (1'h0);
  reg [(4'hd):(1'h0)] reg173 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg172 = (1'h0);
  reg [(5'h14):(1'h0)] reg171 = (1'h0);
  reg [(5'h10):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(5'h13):(1'h0)] reg35 = (1'h0);
  assign y = {wire4,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire36,
                 wire169,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg33,
                 reg34,
                 reg35,
                 (1'h0)};
  assign wire4 = ((((((8'ha1) ? wire1 : wire0) || $signed((8'hbc))) ?
                             wire3[(4'hf):(4'hd)] : wire0[(3'h5):(3'h5)]) ?
                         $unsigned(wire1[(5'h10):(3'h5)]) : ((+$unsigned(wire2)) < wire2)) ?
                     $signed($unsigned(wire3[(4'hc):(2'h3)])) : wire2[(4'hc):(3'h4)]);
  always
    @(posedge clk) begin
      reg5 <= {{$unsigned($unsigned(wire0[(3'h7):(3'h5)])), {wire3}},
          wire0[(3'h5):(3'h5)]};
      if ((~wire2))
        begin
          reg6 <= $signed(($unsigned(((wire4 + wire2) - wire0[(2'h2):(1'h1)])) <= reg5[(2'h2):(1'h1)]));
          if ((wire0 ? {wire1[(4'hb):(1'h1)]} : $signed(wire0[(3'h4):(1'h0)])))
            begin
              reg7 <= $unsigned($unsigned($unsigned(wire2)));
              reg8 <= (&{$signed((reg7[(2'h2):(1'h1)] ?
                      $signed(wire4) : $unsigned(wire0)))});
            end
          else
            begin
              reg7 <= $unsigned(((~($signed(wire3) ?
                      wire4[(3'h4):(2'h2)] : {wire0, wire3})) ?
                  $unsigned(((^~wire2) ?
                      (wire2 & (8'hbe)) : ((8'hb4) ?
                          reg5 : wire0))) : wire4[(1'h0):(1'h0)]));
              reg8 <= $signed($signed((8'ha9)));
              reg9 <= (&$signed(reg8[(4'hd):(4'h9)]));
              reg10 <= wire0[(3'h5):(1'h0)];
            end
          reg11 <= reg6;
        end
      else
        begin
          reg6 <= wire2[(3'h6):(1'h1)];
          reg7 <= reg8[(1'h1):(1'h0)];
        end
    end
  assign wire12 = $unsigned($unsigned((wire1[(1'h1):(1'h0)] ?
                      $unsigned(reg9) : reg10[(1'h1):(1'h0)])));
  assign wire13 = (((^~(-$unsigned(reg9))) > ((^~$unsigned(wire0)) >> reg7)) | ({(^(reg9 < wire1))} ?
                      (((wire1 >> wire4) ?
                          (-reg7) : (reg10 ?
                              (8'ha6) : wire0)) - $unsigned($unsigned(reg10))) : $signed((wire2 ?
                          $unsigned(reg9) : (reg9 ^~ wire3)))));
  assign wire14 = wire4;
  assign wire15 = (((reg10 ?
                          wire13 : $signed((reg11 ?
                              reg6 : wire13))) >= (((reg9 ?
                              reg7 : reg8) == ((8'had) ? (8'ha3) : reg9)) ?
                          wire0[(3'h5):(1'h1)] : ((reg8 ? wire4 : wire4) ?
                              reg7[(2'h3):(2'h3)] : $unsigned(wire3)))) ?
                      ((&(!wire14[(3'h5):(2'h2)])) ?
                          (({wire2, wire0} == $unsigned(wire4)) ?
                              $unsigned((^~reg10)) : {(wire2 + wire3),
                                  wire4}) : $unsigned($signed(wire13))) : (reg7[(1'h0):(1'h0)] ?
                          $unsigned($signed((wire0 ? reg9 : (8'hae)))) : reg9));
  always
    @(posedge clk) begin
      reg16 <= reg9[(5'h13):(3'h6)];
    end
  always
    @(posedge clk) begin
      reg17 <= ((^~wire3) ?
          $unsigned((((8'ha4) ? $unsigned((8'hb4)) : $signed(reg6)) ?
              ((wire13 <= wire3) || reg16) : reg10[(1'h1):(1'h0)])) : ($signed({$signed(wire2),
              (-reg6)}) ~^ wire1[(5'h11):(3'h5)]));
      reg18 <= reg5;
      reg19 <= {(wire13 - (~$unsigned((-reg8)))),
          (wire12 ?
              {(wire4[(1'h0):(1'h0)] ? (+wire1) : $unsigned(wire3)),
                  (8'hb4)} : wire12)};
      reg20 <= $signed($unsigned($signed(reg16)));
    end
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(($signed($unsigned(reg17)) ?
          $unsigned(wire3) : (~|wire0[(1'h1):(1'h0)])))))
        begin
          reg21 <= $signed({(^~($unsigned(reg8) ?
                  (wire3 ? (8'ha6) : reg6) : (reg9 > reg19)))});
          reg22 <= ($signed(($unsigned((!(8'hb7))) ?
                  reg8 : $signed($unsigned((8'ha4))))) ?
              reg9 : wire3[(4'hf):(1'h1)]);
          reg23 <= reg6;
          reg24 <= $unsigned($unsigned((wire15 <<< reg22)));
        end
      else
        begin
          reg21 <= $signed($unsigned((+(7'h40))));
        end
    end
  assign wire25 = reg20;
  assign wire26 = $signed((!((((8'hbc) ^ reg24) ?
                      (reg5 ? reg23 : wire2) : (^reg18)) | reg8)));
  assign wire27 = (|{reg19[(4'hd):(4'hd)]});
  assign wire28 = $unsigned($unsigned({reg10}));
  assign wire29 = $unsigned($unsigned(reg11[(3'h4):(1'h0)]));
  assign wire30 = $unsigned(($signed((reg7 ?
                      wire3[(4'hc):(1'h0)] : wire26)) >>> reg24[(3'h4):(1'h1)]));
  assign wire31 = (8'hb5);
  assign wire32 = wire25[(3'h5):(2'h3)];
  always
    @(posedge clk) begin
      reg33 <= (wire27[(4'ha):(3'h5)] ?
          $signed($unsigned($unsigned((reg20 ?
              (8'ha7) : wire2)))) : $signed((8'hb7)));
      reg34 <= $signed(wire4);
      reg35 <= {$signed(($signed((wire30 ? reg19 : wire31)) ?
              $signed($signed(wire14)) : $signed($signed(wire14)))),
          (^~(~^(~^(reg11 ? reg23 : reg5))))};
    end
  assign wire36 = $unsigned({reg6[(3'h4):(3'h4)]});
  module37 #() modinst170 (wire169, clk, wire36, reg18, wire12, wire28);
  always
    @(posedge clk) begin
      reg171 <= ((^~reg20[(3'h5):(3'h4)]) >>> (+$unsigned($unsigned($signed(wire30)))));
      reg172 <= ($signed(reg21) ?
          $unsigned($signed((~$signed((8'ha4))))) : $unsigned($signed({(reg20 || reg19),
              $signed(wire27)})));
      reg173 <= reg172;
      reg174 <= $signed($unsigned(wire36[(3'h4):(1'h1)]));
      reg175 <= $signed(wire14);
    end
endmodule

module module37
#(parameter param168 = ({((^(+(8'hb6))) ? (((8'h9e) ? (8'hba) : (8'hb0)) ? ((8'h9f) * (8'ha2)) : {(8'hb6), (8'hbb)}) : ((~^(8'h9f)) ? (~(8'hb9)) : {(8'ha1), (8'hbd)})), (~^{(^~(8'hbd))})} ? (8'hbe) : (8'hbd)))
(y, clk, wire38, wire39, wire40, wire41);
  output wire [(32'h32c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire38;
  input wire signed [(4'hc):(1'h0)] wire39;
  input wire [(2'h2):(1'h0)] wire40;
  input wire signed [(4'he):(1'h0)] wire41;
  wire [(4'ha):(1'h0)] wire167;
  wire signed [(5'h14):(1'h0)] wire166;
  wire signed [(3'h4):(1'h0)] wire165;
  wire signed [(3'h6):(1'h0)] wire164;
  wire signed [(4'h8):(1'h0)] wire42;
  wire [(4'he):(1'h0)] wire43;
  wire signed [(4'hc):(1'h0)] wire44;
  wire [(4'ha):(1'h0)] wire45;
  wire signed [(4'hc):(1'h0)] wire49;
  wire [(4'ha):(1'h0)] wire93;
  wire signed [(4'hc):(1'h0)] wire95;
  wire [(3'h6):(1'h0)] wire148;
  wire [(4'hd):(1'h0)] wire149;
  wire signed [(5'h13):(1'h0)] wire162;
  reg signed [(4'hd):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg145 = (1'h0);
  reg [(5'h11):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg143 = (1'h0);
  reg [(3'h6):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg141 = (1'h0);
  reg [(4'ha):(1'h0)] reg140 = (1'h0);
  reg [(4'h9):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg138 = (1'h0);
  reg [(4'ha):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg136 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg135 = (1'h0);
  reg [(3'h6):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg133 = (1'h0);
  reg [(3'h4):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg130 = (1'h0);
  reg [(4'ha):(1'h0)] reg129 = (1'h0);
  reg [(4'h8):(1'h0)] reg128 = (1'h0);
  reg [(4'he):(1'h0)] reg127 = (1'h0);
  reg [(5'h11):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg125 = (1'h0);
  reg [(4'hb):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg123 = (1'h0);
  reg [(5'h15):(1'h0)] reg122 = (1'h0);
  reg [(2'h3):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg118 = (1'h0);
  reg [(4'he):(1'h0)] reg117 = (1'h0);
  reg [(5'h10):(1'h0)] reg116 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg114 = (1'h0);
  reg [(5'h14):(1'h0)] reg113 = (1'h0);
  reg [(5'h15):(1'h0)] reg112 = (1'h0);
  reg [(4'hf):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg110 = (1'h0);
  reg [(3'h6):(1'h0)] reg109 = (1'h0);
  reg [(3'h4):(1'h0)] reg108 = (1'h0);
  reg [(2'h2):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg106 = (1'h0);
  reg [(5'h14):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg102 = (1'h0);
  reg [(5'h11):(1'h0)] reg101 = (1'h0);
  reg [(5'h10):(1'h0)] reg100 = (1'h0);
  reg [(5'h11):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg98 = (1'h0);
  reg [(3'h6):(1'h0)] reg97 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg96 = (1'h0);
  reg [(4'hc):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg48 = (1'h0);
  assign y = {wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire42,
                 wire43,
                 wire44,
                 wire45,
                 wire49,
                 wire93,
                 wire95,
                 wire148,
                 wire149,
                 wire162,
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
                 reg46,
                 reg47,
                 reg48,
                 (1'h0)};
  assign wire42 = $unsigned(wire38);
  assign wire43 = (~^wire38);
  assign wire44 = $unsigned($signed(((-(wire42 * wire38)) + wire40)));
  assign wire45 = (wire38 ? $signed($signed(wire41)) : wire40[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg46 <= {wire39};
      reg47 <= wire38[(3'h4):(3'h4)];
      reg48 <= wire39[(3'h5):(3'h4)];
    end
  assign wire49 = wire45;
  module50 #() modinst94 (.clk(clk), .y(wire93), .wire53(wire42), .wire54(reg46), .wire55(wire38), .wire52(wire45), .wire51(wire41));
  assign wire95 = {(($unsigned((wire40 ? wire93 : wire45)) ?
                          wire93 : ((wire38 ? (8'haa) : wire42) ?
                              wire42 : $signed(wire42))) - wire43)};
  always
    @(posedge clk) begin
      reg96 <= (+$unsigned(wire38));
      if ($signed(wire93))
        begin
          if ((((8'hbe) ?
              {(~|(8'hbb))} : {reg46, $unsigned((~wire45))}) <<< (~|(~&(wire40 ?
              wire44[(4'ha):(4'h9)] : (wire40 ? wire95 : wire39))))))
            begin
              reg97 <= wire38[(1'h1):(1'h0)];
              reg98 <= $signed(({reg48[(3'h4):(2'h2)],
                  (reg46 - wire40)} ^~ $unsigned($unsigned((wire40 ?
                  (8'ha7) : wire38)))));
              reg99 <= (|$unsigned(wire44[(3'h5):(3'h4)]));
              reg100 <= $signed(wire45[(2'h2):(1'h0)]);
              reg101 <= wire93[(1'h0):(1'h0)];
            end
          else
            begin
              reg97 <= {wire43,
                  (((wire41[(3'h5):(3'h5)] - (reg96 + wire38)) < $unsigned($unsigned(reg98))) * $unsigned($unsigned((reg98 ?
                      wire40 : wire49))))};
            end
        end
      else
        begin
          reg97 <= wire41[(4'hb):(1'h0)];
          reg98 <= ((wire44[(4'hb):(3'h5)] ?
                  reg100[(3'h5):(2'h2)] : (+wire38)) ?
              $signed((($unsigned(wire93) ?
                      (wire41 ? wire43 : wire44) : $signed(wire40)) ?
                  reg101 : (8'had))) : $signed((~(-reg47))));
        end
      reg102 <= reg48;
      reg103 <= (^~(~&(reg96[(3'h4):(3'h4)] ?
          $unsigned({wire93, reg48}) : ($signed(wire45) ?
              wire42[(3'h6):(2'h3)] : $unsigned(reg46)))));
      reg104 <= $signed((^~($signed($signed(wire41)) ?
          $signed({wire41, wire43}) : ((wire95 ^ (8'hb6)) != wire49))));
    end
  always
    @(posedge clk) begin
      if ({$signed($unsigned(reg97[(1'h0):(1'h0)]))})
        begin
          reg105 <= wire95;
          if ({(~|(($unsigned(reg47) ?
                  {reg98, wire39} : (~wire41)) < $signed((reg97 ~^ wire42))))})
            begin
              reg106 <= ((&$unsigned(((reg104 ?
                  (8'hae) : reg99) * $unsigned(wire40)))) == $unsigned(({reg47,
                      wire95} ?
                  (~^(~^reg104)) : $unsigned($signed(wire45)))));
              reg107 <= $unsigned(($signed($signed((~^reg105))) ?
                  wire95 : $signed(((wire93 ? reg104 : reg97) >>> (~wire41)))));
              reg108 <= $unsigned(((reg106[(2'h2):(1'h0)] >= (|(wire45 ?
                      (8'ha4) : reg99))) ?
                  {($unsigned(wire41) ? (reg100 != reg96) : (^reg48)),
                      ($unsigned(reg48) > (reg46 ?
                          reg102 : wire38))} : ($signed(((8'h9d) ?
                          wire45 : wire45)) ?
                      (!(+wire41)) : reg101[(4'ha):(2'h3)])));
              reg109 <= ({wire41[(4'hc):(4'h9)]} ? (7'h42) : wire40);
              reg110 <= $unsigned($unsigned((($unsigned(wire95) ?
                      reg48 : (+(8'ha3))) ?
                  $unsigned((~reg97)) : $signed((reg48 ? (8'hac) : reg105)))));
            end
          else
            begin
              reg106 <= (~&($signed(wire93[(2'h3):(1'h1)]) ?
                  ((((8'hac) > reg102) && wire95) + (reg97[(1'h0):(1'h0)] <<< (reg107 ?
                      reg102 : (8'hb6)))) : (reg96[(3'h4):(2'h3)] <= $unsigned(((8'hb1) + wire44)))));
              reg107 <= {(&reg101[(5'h11):(4'hb)]),
                  (((wire95 ? reg48[(3'h5):(3'h5)] : $unsigned(wire45)) ?
                          ((wire45 ~^ wire38) ?
                              {wire40,
                                  reg108} : reg102[(3'h5):(1'h1)]) : (8'ha9)) ?
                      $signed(reg107) : $signed($unsigned(((8'hae) ?
                          reg109 : reg47))))};
              reg108 <= $signed($signed({(~&{(7'h41), reg98})}));
              reg109 <= reg97;
              reg110 <= reg48[(2'h2):(1'h1)];
            end
          reg111 <= (reg106[(1'h1):(1'h0)] || $unsigned(reg103));
        end
      else
        begin
          reg105 <= $unsigned((^{$unsigned((!reg97))}));
          if ({($signed(reg102) ?
                  (((reg107 ~^ (8'hb2)) << reg106) <<< $signed(wire95[(3'h6):(3'h6)])) : $signed((+((8'ha3) | (8'hbd)))))})
            begin
              reg106 <= (+wire41[(4'hd):(1'h0)]);
              reg107 <= ((((!(~reg101)) - (!(wire95 && reg106))) | $signed(wire38)) <<< (reg110[(4'hf):(4'he)] & {reg98[(2'h2):(1'h1)],
                  (8'h9d)}));
              reg108 <= (~|(-reg108[(1'h0):(1'h0)]));
            end
          else
            begin
              reg106 <= ($signed((8'hbc)) && (reg101 ?
                  $unsigned((~&(reg46 <<< reg99))) : (-($unsigned(reg100) >= wire95))));
              reg107 <= wire40[(2'h2):(1'h1)];
              reg108 <= $signed(wire39[(3'h6):(2'h2)]);
              reg109 <= $signed(($unsigned($signed($signed(wire39))) ?
                  {$unsigned((|(8'ha8)))} : (!$signed(reg98[(3'h7):(1'h0)]))));
            end
          if (wire93)
            begin
              reg110 <= (($signed($unsigned(reg100)) <= (reg107[(2'h2):(2'h2)] ?
                  reg105 : (!(reg106 ? wire45 : reg109)))) ~^ reg97);
              reg111 <= wire38;
              reg112 <= ($signed($signed({(wire49 + reg100)})) ^ wire95);
            end
          else
            begin
              reg110 <= $unsigned(reg111[(1'h0):(1'h0)]);
              reg111 <= reg112[(4'hf):(4'hd)];
              reg112 <= (-(reg110[(3'h5):(2'h3)] > reg102));
              reg113 <= {({wire95} & wire41)};
              reg114 <= reg48;
            end
          if (wire45)
            begin
              reg115 <= reg108;
              reg116 <= (reg113[(1'h0):(1'h0)] ?
                  wire41[(3'h4):(2'h2)] : reg102);
              reg117 <= (($unsigned($signed(reg114)) ?
                  $signed($unsigned(reg47)) : reg106[(3'h4):(1'h1)]) ^~ (reg103[(3'h4):(1'h0)] ?
                  ($signed($signed(reg114)) ?
                      $signed(reg105[(3'h6):(3'h4)]) : reg96[(1'h1):(1'h0)]) : reg46[(3'h4):(2'h2)]));
              reg118 <= (8'hae);
            end
          else
            begin
              reg115 <= reg48;
              reg116 <= reg109;
            end
        end
      if (reg109)
        begin
          reg119 <= reg111[(3'h7):(1'h0)];
        end
      else
        begin
          if ($signed(((|$unsigned(wire43)) ?
              $unsigned(wire44) : wire93[(3'h6):(1'h1)])))
            begin
              reg119 <= wire44[(4'hb):(1'h0)];
            end
          else
            begin
              reg119 <= wire45[(3'h4):(3'h4)];
              reg120 <= (^reg119);
              reg121 <= $signed($unsigned(wire42));
              reg122 <= $signed(((reg116 ?
                  {wire41[(2'h3):(2'h3)]} : {$signed(reg110),
                      {wire39, reg114}}) > reg103[(1'h1):(1'h0)]));
              reg123 <= (8'hac);
            end
          reg124 <= (+(!(^~$signed($signed(reg104)))));
          if ({$signed(reg113[(4'h8):(3'h7)])})
            begin
              reg125 <= (&$unsigned($unsigned((~$unsigned(wire49)))));
              reg126 <= wire93;
              reg127 <= reg117;
            end
          else
            begin
              reg125 <= $unsigned((|(7'h42)));
              reg126 <= reg109[(1'h1):(1'h1)];
            end
          reg128 <= $signed((&{reg96[(1'h0):(1'h0)]}));
        end
      if ((!reg123[(2'h2):(1'h0)]))
        begin
          reg129 <= $unsigned($signed((^~(reg119 ? {reg114} : {wire41}))));
          if (wire43[(4'h9):(3'h4)])
            begin
              reg130 <= reg106;
              reg131 <= reg112;
              reg132 <= wire95;
            end
          else
            begin
              reg130 <= {((8'hab) ?
                      $unsigned(reg116[(4'hd):(3'h7)]) : $signed(($unsigned(reg129) ?
                          reg98[(4'h8):(1'h0)] : (&reg119))))};
              reg131 <= $signed((|$unsigned(wire43[(4'h8):(3'h4)])));
              reg132 <= (wire43[(1'h1):(1'h1)] ?
                  {$unsigned(reg113[(1'h1):(1'h1)])} : $unsigned((reg99[(2'h2):(1'h0)] ?
                      (-(reg131 ?
                          reg120 : wire41)) : $signed($unsigned(wire41)))));
              reg133 <= ($unsigned({{reg125[(4'hb):(3'h5)], {wire44, reg105}},
                  {(-reg126), $signed(reg119)}}) < $unsigned({((reg46 ?
                      reg107 : reg105) ~^ (wire38 ? reg118 : (7'h42))),
                  $signed({reg100})}));
            end
        end
      else
        begin
          reg129 <= ((reg99 ?
                  reg107[(2'h2):(1'h1)] : ((((8'hbd) ? reg48 : reg131) ?
                      reg100 : $unsigned(reg103)) - $unsigned(reg115[(1'h0):(1'h0)]))) ?
              (^~$signed({(+reg129), {(7'h40)}})) : reg105[(3'h4):(3'h4)]);
          reg130 <= {$signed(reg117[(4'hc):(1'h1)]), reg46[(4'hb):(3'h4)]};
          reg131 <= $unsigned(reg125[(4'h9):(3'h7)]);
          reg132 <= reg127;
          if ((reg130[(4'h9):(3'h5)] >> ((((8'hbb) ?
              wire49[(4'hc):(1'h0)] : (reg97 ~^ wire43)) == reg102[(1'h0):(1'h0)]) <<< reg100)))
            begin
              reg133 <= wire40[(1'h1):(1'h1)];
              reg134 <= $signed(((+($unsigned(reg126) ?
                  (-reg125) : {reg126})) ^ (7'h40)));
            end
          else
            begin
              reg133 <= {(reg98[(4'h8):(2'h2)] ?
                      {(~^$unsigned(reg122)),
                          {(|wire44), $signed(reg99)}} : ($signed((reg114 ?
                          reg122 : reg97)) + (wire45 ?
                          reg118[(1'h0):(1'h0)] : $signed((8'h9f))))),
                  reg131[(1'h1):(1'h1)]};
            end
        end
    end
  always
    @(posedge clk) begin
      reg135 <= (^~$unsigned(((reg110[(2'h2):(1'h0)] <= $signed((8'hbd))) || $signed((wire93 ?
          reg121 : reg121)))));
      if ((|(!reg111[(3'h6):(3'h6)])))
        begin
          if ((+((($unsigned(reg132) ? reg109[(3'h6):(2'h2)] : (&reg111)) ?
                  reg133 : {$unsigned((8'hb1)), reg111[(4'hb):(4'ha)]}) ?
              $signed((reg100[(4'h9):(1'h0)] ?
                  (reg116 ?
                      reg123 : reg105) : (|wire93))) : ($unsigned((reg132 ^ reg105)) ?
                  wire40 : (+wire38[(3'h7):(3'h5)])))))
            begin
              reg136 <= ((reg110 ?
                  $signed(wire93) : reg96[(3'h4):(1'h1)]) - ((-({(8'ha3)} - (^~wire44))) << reg113));
              reg137 <= reg47[(5'h11):(4'hf)];
              reg138 <= (8'hb6);
              reg139 <= (($unsigned(((8'hb8) >>> $unsigned(reg108))) + reg47) ?
                  ($signed((~^$unsigned(reg113))) ?
                      ({$signed(reg47), $unsigned((8'hb0))} - $signed({reg131,
                          reg112})) : $unsigned($unsigned((reg115 ?
                          wire43 : reg135)))) : $unsigned((reg106[(1'h1):(1'h1)] < (&$signed(reg99)))));
            end
          else
            begin
              reg136 <= $unsigned($signed(reg100));
              reg137 <= (&($unsigned(reg120) <<< ((reg118[(1'h1):(1'h1)] ?
                      reg116[(1'h0):(1'h0)] : wire42) ?
                  (-$unsigned(reg103)) : $signed((reg130 & reg117)))));
              reg138 <= (reg101[(1'h1):(1'h0)] * reg124);
            end
          reg140 <= ((~&reg107) < {(~|reg102), reg129[(4'h9):(1'h1)]});
          if ($signed($signed(reg136[(3'h5):(2'h2)])))
            begin
              reg141 <= reg104;
              reg142 <= reg140[(4'h9):(3'h4)];
              reg143 <= (reg137 ?
                  reg132[(3'h4):(1'h1)] : (reg142[(3'h6):(1'h0)] <<< ($unsigned(reg96[(3'h6):(2'h2)]) > reg46[(4'h8):(2'h3)])));
            end
          else
            begin
              reg141 <= {reg129};
              reg142 <= ($unsigned((^$unsigned((+reg101)))) ?
                  ({reg114,
                      (reg122 >> $unsigned((8'ha7)))} << ($signed(wire42) <<< reg134[(3'h4):(3'h4)])) : reg101);
              reg143 <= reg127;
              reg144 <= reg104[(4'h8):(1'h1)];
              reg145 <= wire95;
            end
        end
      else
        begin
          reg136 <= reg109[(1'h1):(1'h0)];
          reg137 <= ((~&reg117[(4'he):(3'h5)]) >= $unsigned({(&reg103),
              ((reg112 <= reg105) <= $signed((8'hb8)))}));
        end
      reg146 <= reg135;
      reg147 <= ($signed($unsigned((~|reg116))) ?
          (reg145 ?
              ({(reg122 >> reg47)} != (~&(reg106 ?
                  reg103 : (8'haf)))) : reg134) : ($signed($signed($unsigned(reg117))) ^ (&reg117[(3'h7):(3'h7)])));
    end
  assign wire148 = $unsigned($signed((({reg116} != $signed(reg129)) && $signed($signed(reg103)))));
  assign wire149 = $unsigned((~^(8'h9d)));
  module150 #() modinst163 (.wire155(reg113), .wire151(reg122), .wire154(reg99), .wire153(reg96), .y(wire162), .clk(clk), .wire152(wire44));
  assign wire164 = (8'ha0);
  assign wire165 = (reg142 + (((((8'hb4) ? reg138 : (8'hb6)) ~^ {reg117,
                           wire38}) ?
                       reg116[(4'ha):(4'h9)] : $signed($signed(reg100))) ^ wire164));
  assign wire166 = (7'h40);
  assign wire167 = ($unsigned({(((8'had) ? wire43 : reg47) ?
                           wire44 : reg113)}) >> ($signed(($signed(reg124) > $signed(reg143))) & reg105));
endmodule

module module150
#(parameter param160 = ((((((8'hbe) & (8'h9c)) ? ((8'h9c) - (8'ha5)) : ((8'h9f) & (8'hb7))) ? (~^(^~(8'hbd))) : ((+(8'ha6)) && (~|(8'hb1)))) ? (+(((8'hab) >>> (8'h9d)) || ((8'hac) <<< (8'hb9)))) : (-(^((8'hb9) & (8'ha5))))) ? (({(~(8'hb2))} >> ((|(8'ha6)) << {(8'hb9)})) * (({(8'ha4), (8'haa)} < {(8'ha3)}) ? (8'ha6) : (8'hac))) : ((|(((7'h43) << (8'h9f)) || ((8'ha0) ? (8'hbe) : (8'ha8)))) ? (!(((8'h9f) || (7'h43)) ? ((8'ha1) >= (8'hbf)) : ((8'ha5) ? (8'ha5) : (8'ha3)))) : {(8'ha4), (&((8'hba) ^~ (8'hbd)))})), 
parameter param161 = (+({(+(param160 ? param160 : (8'hb3)))} >> param160)))
(y, clk, wire155, wire154, wire153, wire152, wire151);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire155;
  input wire signed [(3'h6):(1'h0)] wire154;
  input wire [(4'h8):(1'h0)] wire153;
  input wire signed [(4'hb):(1'h0)] wire152;
  input wire signed [(5'h15):(1'h0)] wire151;
  wire [(5'h15):(1'h0)] wire159;
  wire signed [(4'hf):(1'h0)] wire158;
  wire [(4'hb):(1'h0)] wire157;
  wire signed [(4'h8):(1'h0)] wire156;
  assign y = {wire159, wire158, wire157, wire156, (1'h0)};
  assign wire156 = (+wire155[(1'h0):(1'h0)]);
  assign wire157 = $signed((wire151 ?
                       (wire155 ?
                           ((wire153 ?
                               wire155 : wire155) < (&wire156)) : (wire152 ?
                               wire153[(3'h4):(1'h0)] : $unsigned(wire154))) : {$unsigned(wire154[(2'h3):(2'h2)]),
                           $signed(wire154)}));
  assign wire158 = wire152;
  assign wire159 = ((((8'hb3) != (+(wire154 >> wire156))) < $signed($signed(wire151[(4'h8):(3'h6)]))) ?
                       ((($unsigned(wire151) * (&wire154)) >>> (wire151[(3'h7):(2'h2)] ?
                           wire151 : (8'haa))) <<< $signed({wire151})) : wire157[(2'h3):(2'h3)]);
endmodule

module module50
#(parameter param91 = {{({{(8'hb6), (8'hab)}, ((8'ha2) | (8'ha0))} != (~&(~(8'hae))))}}, 
parameter param92 = (-(!param91)))
(y, clk, wire55, wire54, wire53, wire52, wire51);
  output wire [(32'h1ba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire55;
  input wire signed [(4'hc):(1'h0)] wire54;
  input wire [(4'h8):(1'h0)] wire53;
  input wire [(4'ha):(1'h0)] wire52;
  input wire [(4'he):(1'h0)] wire51;
  wire [(5'h15):(1'h0)] wire85;
  wire [(4'ha):(1'h0)] wire84;
  wire [(4'he):(1'h0)] wire79;
  wire signed [(5'h10):(1'h0)] wire78;
  wire [(3'h4):(1'h0)] wire74;
  wire [(5'h10):(1'h0)] wire73;
  wire signed [(4'hf):(1'h0)] wire72;
  wire [(5'h13):(1'h0)] wire71;
  wire [(4'hb):(1'h0)] wire70;
  wire [(4'h8):(1'h0)] wire69;
  wire signed [(5'h12):(1'h0)] wire68;
  wire [(5'h13):(1'h0)] wire67;
  wire signed [(4'h9):(1'h0)] wire66;
  wire [(5'h11):(1'h0)] wire65;
  reg [(5'h11):(1'h0)] reg90 = (1'h0);
  reg [(4'hd):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg87 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg83 = (1'h0);
  reg [(3'h7):(1'h0)] reg82 = (1'h0);
  reg [(5'h11):(1'h0)] reg81 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg76 = (1'h0);
  reg signed [(4'he):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg64 = (1'h0);
  reg [(4'hb):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg62 = (1'h0);
  reg [(3'h7):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg60 = (1'h0);
  reg [(2'h3):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg56 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire79,
                 wire78,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg77,
                 reg76,
                 reg75,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg56 <= (~|(((&wire52[(1'h0):(1'h0)]) | ((wire51 < wire53) ?
              (wire54 << wire54) : (wire52 ? wire52 : wire53))) ?
          (((~|wire55) ?
              $unsigned((8'hb9)) : ((8'hab) ?
                  wire53 : wire52)) <<< {wire54[(3'h4):(1'h1)]}) : wire55[(2'h2):(2'h2)]));
      if ((-$signed((8'hbf))))
        begin
          if ({$unsigned((((^~reg56) ? reg56 : (wire51 ~^ wire53)) ?
                  {$signed(wire55), (^~reg56)} : wire54)),
              (~&(wire51[(4'hb):(3'h6)] ^~ reg56[(3'h5):(1'h1)]))})
            begin
              reg57 <= ((wire55[(1'h0):(1'h0)] & ((wire53 ?
                      $signed(reg56) : (~|(8'ha0))) ?
                  $unsigned((wire53 - reg56)) : wire52)) >> (~&wire54));
              reg58 <= reg57;
            end
          else
            begin
              reg57 <= (reg56 ^ ($unsigned(({wire55, wire54} < (reg56 ?
                  wire52 : wire51))) >= reg57));
              reg58 <= $unsigned(($signed((wire55[(3'h7):(3'h5)] ?
                      (~|wire53) : $unsigned(reg56))) ?
                  reg56 : {((wire52 >> reg56) != wire55[(3'h4):(2'h3)])}));
              reg59 <= (((reg58 << $unsigned((reg56 > wire53))) <<< (^{$signed((8'hb4))})) <<< $unsigned($unsigned($signed(wire55[(3'h6):(3'h4)]))));
              reg60 <= (~^$unsigned((((wire52 ? reg59 : wire53) ?
                      $unsigned((8'ha2)) : (&(8'ha7))) ?
                  wire51 : ($signed((8'h9d)) ?
                      (reg57 ? reg56 : reg58) : $unsigned(reg59)))));
            end
        end
      else
        begin
          reg57 <= reg56;
          reg58 <= ($unsigned((^reg57[(5'h15):(1'h1)])) == wire52);
          if (wire53)
            begin
              reg59 <= wire51;
              reg60 <= (!reg59[(1'h0):(1'h0)]);
              reg61 <= ((8'hb1) && ({(&(|reg56)),
                  ($signed(reg60) & (+reg60))} != (wire54[(4'hb):(3'h7)] ~^ (reg59[(2'h3):(2'h2)] ?
                  (reg56 ? reg60 : reg59) : $signed(wire53)))));
              reg62 <= $signed((({(reg56 ?
                          reg60 : reg58)} <= ($unsigned(reg56) ?
                      (reg57 < wire52) : $unsigned(reg60))) ?
                  {(^$unsigned(reg61))} : $signed($unsigned(reg57))));
            end
          else
            begin
              reg59 <= (reg58[(1'h0):(1'h0)] >> $signed(wire55));
              reg60 <= ({(~|$unsigned($unsigned(reg56)))} ?
                  (reg60[(3'h6):(3'h5)] ?
                      reg59 : (reg59 ?
                          ($signed(reg56) * (8'hbd)) : (&(wire52 ?
                              reg57 : wire51)))) : ((~$signed($unsigned(wire55))) != ((~|wire52[(3'h5):(3'h5)]) ?
                      (&(reg61 && (8'hae))) : reg57)));
              reg61 <= $signed($unsigned((wire53[(3'h5):(1'h1)] ?
                  $signed(wire54[(3'h5):(3'h5)]) : (8'hb5))));
              reg62 <= ((!$unsigned(($unsigned(reg59) && $signed(reg60)))) > reg57);
              reg63 <= {($unsigned($signed(wire53[(3'h6):(1'h1)])) && (!{$unsigned(reg61),
                      {reg57}})),
                  (wire55[(3'h5):(1'h1)] ?
                      (({reg59, wire51} ?
                          $unsigned(wire53) : reg56) - (&$signed(wire52))) : $signed(($unsigned(reg57) ^~ wire53)))};
            end
        end
      reg64 <= ($unsigned((+$signed($signed(reg61)))) ?
          reg60[(2'h2):(1'h0)] : reg58[(2'h2):(1'h1)]);
    end
  assign wire65 = reg56;
  assign wire66 = wire53[(1'h0):(1'h0)];
  assign wire67 = reg60;
  assign wire68 = ((8'ha0) ^~ $unsigned($signed(($signed(reg62) ?
                      wire54 : $signed((8'hba))))));
  assign wire69 = (((^~{reg58[(1'h1):(1'h0)], $unsigned(reg61)}) ?
                          reg60[(3'h7):(3'h6)] : reg62) ?
                      reg56 : reg58);
  assign wire70 = reg62[(2'h2):(2'h2)];
  assign wire71 = ($unsigned((~|reg64[(4'ha):(4'h9)])) ?
                      $signed(wire51[(2'h3):(1'h0)]) : {wire68[(2'h3):(1'h0)],
                          {wire52[(4'h9):(3'h7)]}});
  assign wire72 = {((reg64[(5'h10):(4'hc)] ^~ (reg58[(1'h1):(1'h1)] ?
                          wire66 : (8'ha7))) << wire69),
                      (~^(^$unsigned((~&wire69))))};
  assign wire73 = (reg59[(1'h1):(1'h0)] ?
                      (!(wire72[(4'ha):(2'h2)] ?
                          {(wire53 || wire52),
                              (~(8'ha4))} : $unsigned((wire68 ~^ (8'ha8))))) : (wire70 ?
                          {$signed($signed(wire72)),
                              ($signed(reg58) ?
                                  wire52 : (7'h43))} : $unsigned((~wire65))));
  assign wire74 = $signed({$signed(((reg56 ? wire66 : reg62) ?
                          $signed(reg58) : $unsigned((8'ha4)))),
                      wire54});
  always
    @(posedge clk) begin
      reg75 <= ($unsigned(reg58) ?
          ((8'h9f) ?
              reg60[(2'h2):(2'h2)] : {reg62[(2'h2):(2'h2)],
                  (~|((8'hbd) ?
                      wire66 : (8'hbc)))}) : ((($unsigned(wire55) == ((7'h40) ?
              wire51 : wire73)) | $signed(wire72)) << reg59));
      reg76 <= (wire54 ? $signed(reg75) : $signed(reg58[(2'h3):(2'h3)]));
      reg77 <= $unsigned(((({reg75} ?
              (reg62 > (8'hbd)) : reg61[(1'h0):(1'h0)]) ?
          $signed((wire70 & (8'hb4))) : $signed(reg59[(1'h1):(1'h0)])) >>> wire51));
    end
  assign wire78 = {$unsigned(wire65)};
  assign wire79 = ((8'hbd) - $unsigned(wire51));
  always
    @(posedge clk) begin
      reg80 <= $unsigned(((((~^wire70) << $signed((8'ha4))) ?
              (^(&(8'ha7))) : ((wire74 ? wire66 : reg58) ?
                  wire53 : {wire67, wire54})) ?
          $signed(((reg64 ?
              (8'haf) : wire73) >>> {wire78})) : ($signed(wire67[(4'ha):(3'h5)]) ?
              $signed((|(8'h9c))) : {wire52, wire68[(1'h1):(1'h1)]})));
      reg81 <= $signed(reg75[(4'h8):(3'h7)]);
      reg82 <= reg77;
      reg83 <= ($signed(wire78) ?
          (~&(~&wire69)) : (reg61[(3'h6):(3'h6)] ?
              (!(8'haa)) : $unsigned((^~(~(8'hb2))))));
    end
  assign wire84 = ((wire67[(4'hb):(3'h7)] ?
                          (((8'had) ?
                              (wire55 | (8'hb1)) : (&wire69)) * reg83) : $signed({$signed((7'h41))})) ?
                      ($signed(($signed(wire69) ?
                              ((8'ha3) > reg62) : $signed(wire53))) ?
                          $signed($unsigned(reg58)) : $signed(((wire67 ?
                              reg77 : wire74) ~^ (-wire51)))) : ($signed((+(+wire51))) ~^ reg58));
  assign wire85 = (($signed($unsigned(reg77)) <= (&(7'h42))) ?
                      ($unsigned(reg76[(1'h0):(1'h0)]) ?
                          wire84 : reg83[(2'h3):(2'h3)]) : wire65);
  always
    @(posedge clk) begin
      reg86 <= {wire70};
      if ($signed((wire71[(4'hd):(2'h3)] ^ $unsigned((8'ha4)))))
        begin
          if ($unsigned(wire54))
            begin
              reg87 <= (((^~$unsigned(reg64[(1'h1):(1'h1)])) <= reg83) <<< (+(-({wire74,
                  reg64} != (wire69 <<< wire71)))));
              reg88 <= ((!(((wire66 ? wire78 : reg62) ?
                      wire53[(4'h8):(2'h3)] : (+reg58)) ~^ reg57[(3'h5):(3'h5)])) ?
                  reg87[(5'h12):(3'h6)] : wire73[(3'h7):(2'h2)]);
            end
          else
            begin
              reg87 <= $unsigned({$unsigned(reg63[(2'h2):(2'h2)]),
                  wire68[(1'h0):(1'h0)]});
              reg88 <= $unsigned(wire66);
              reg89 <= wire53;
              reg90 <= (7'h44);
            end
        end
      else
        begin
          reg87 <= ((8'ha5) || wire55[(3'h4):(2'h3)]);
        end
    end
endmodule
