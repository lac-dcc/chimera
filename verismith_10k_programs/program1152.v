module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h327):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire144;
  wire signed [(5'h14):(1'h0)] wire143;
  wire [(4'ha):(1'h0)] wire129;
  wire signed [(5'h14):(1'h0)] wire99;
  wire [(5'h12):(1'h0)] wire98;
  wire signed [(4'hd):(1'h0)] wire97;
  wire [(2'h3):(1'h0)] wire96;
  wire signed [(4'hc):(1'h0)] wire95;
  wire signed [(3'h4):(1'h0)] wire94;
  wire signed [(5'h10):(1'h0)] wire92;
  wire [(3'h7):(1'h0)] wire22;
  wire [(3'h6):(1'h0)] wire21;
  reg signed [(3'h4):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg142 = (1'h0);
  reg [(3'h4):(1'h0)] reg141 = (1'h0);
  reg [(5'h13):(1'h0)] reg140 = (1'h0);
  reg [(3'h7):(1'h0)] reg139 = (1'h0);
  reg signed [(4'he):(1'h0)] reg138 = (1'h0);
  reg [(5'h11):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg135 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg134 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg132 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg131 = (1'h0);
  reg [(4'h8):(1'h0)] reg130 = (1'h0);
  reg [(4'ha):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg127 = (1'h0);
  reg [(4'he):(1'h0)] reg126 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg125 = (1'h0);
  reg [(3'h7):(1'h0)] reg124 = (1'h0);
  reg signed [(4'he):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg122 = (1'h0);
  reg [(4'he):(1'h0)] reg121 = (1'h0);
  reg [(3'h7):(1'h0)] reg120 = (1'h0);
  reg [(4'hf):(1'h0)] reg119 = (1'h0);
  reg [(3'h7):(1'h0)] reg118 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg117 = (1'h0);
  reg [(4'hd):(1'h0)] reg116 = (1'h0);
  reg [(2'h3):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg111 = (1'h0);
  reg [(3'h7):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg109 = (1'h0);
  reg [(4'he):(1'h0)] reg108 = (1'h0);
  reg [(4'h9):(1'h0)] reg107 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg102 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg101 = (1'h0);
  reg [(4'he):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg5 = (1'h0);
  reg [(4'he):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  assign y = {wire144,
                 wire143,
                 wire129,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire92,
                 wire22,
                 wire21,
                 reg145,
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
                 reg5,
                 reg6,
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
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (wire0 <= wire2[(4'h9):(3'h7)]);
      if (wire0[(1'h0):(1'h0)])
        begin
          reg6 <= $signed((!$unsigned((wire0 + $signed(wire3)))));
          reg7 <= (wire4[(3'h7):(3'h4)] ?
              ($unsigned($signed((+(7'h44)))) & (|(((7'h42) * wire2) ^ (8'h9c)))) : ($signed(wire2[(4'h9):(1'h1)]) ?
                  (($unsigned(wire4) ?
                      wire4 : (wire1 ?
                          wire4 : wire3)) <<< ($signed(wire2) >>> {wire3,
                      (8'hb2)})) : {(~^$signed(wire1))}));
        end
      else
        begin
          reg6 <= $signed(wire1[(1'h1):(1'h1)]);
          if (wire0[(3'h6):(1'h0)])
            begin
              reg7 <= (^(8'h9e));
              reg8 <= ((~reg7) ^~ wire0);
              reg9 <= {($unsigned(wire0[(3'h4):(1'h0)]) <<< (~&wire1))};
              reg10 <= reg5[(3'h5):(1'h0)];
            end
          else
            begin
              reg7 <= reg9;
              reg8 <= (-(+wire0));
            end
          reg11 <= (({reg7[(3'h5):(1'h1)],
              (!(wire3 ? wire3 : reg6))} >= (~^((reg7 ? reg6 : reg9) ?
              (wire2 ? reg9 : reg9) : ((8'hac) ?
                  (8'hba) : (8'hab))))) <= $unsigned($signed($signed($unsigned(reg8)))));
          reg12 <= ((8'hbc) ?
              ((^~((wire4 * wire4) ? {reg11} : (wire3 && reg7))) ?
                  (~|((reg8 ? reg10 : reg8) && {wire2,
                      reg9})) : $signed((~|(~|wire0)))) : reg9);
          reg13 <= reg7[(2'h2):(2'h2)];
        end
      if ((~^(~|(-($signed(reg6) << wire4)))))
        begin
          reg14 <= (reg5[(3'h4):(3'h4)] ? reg8 : $signed($signed(wire2)));
          reg15 <= ($signed($signed({reg14[(1'h0):(1'h0)]})) ?
              $unsigned((wire3 > $signed((~&reg6)))) : (reg14[(1'h1):(1'h0)] ?
                  wire1 : reg7[(4'hf):(3'h7)]));
          if (($signed(reg8) ?
              $signed(reg9[(1'h0):(1'h0)]) : reg6[(3'h5):(1'h0)]))
            begin
              reg16 <= reg9[(4'ha):(3'h7)];
              reg17 <= (($signed((((7'h42) ?
                      reg11 : reg10) | (reg15 ^~ wire2))) <<< $signed(wire2[(3'h7):(3'h5)])) ?
                  $signed((reg14 ?
                      reg11[(1'h0):(1'h0)] : {wire0})) : $unsigned({reg13[(4'hd):(4'h9)],
                      (~^(wire1 | wire4))}));
            end
          else
            begin
              reg16 <= ((^~reg9) ?
                  (~|wire3[(2'h2):(1'h0)]) : {(8'haf), $signed(wire0)});
              reg17 <= $unsigned(($signed(({(8'hbd), reg7} ?
                      reg9 : $unsigned((8'ha7)))) ?
                  reg10[(4'h8):(3'h5)] : reg11));
              reg18 <= $unsigned(wire2[(1'h1):(1'h1)]);
              reg19 <= ($signed((((wire4 || reg18) ?
                      $unsigned(reg6) : {wire3}) <<< {wire0, (~|wire4)})) ?
                  (&wire1[(4'hc):(2'h3)]) : {$unsigned($unsigned({reg11}))});
            end
        end
      else
        begin
          reg14 <= $signed((|reg13));
          reg15 <= (^~$signed(($unsigned((reg7 ? reg7 : reg5)) ?
              (|((8'ha9) ? wire4 : reg19)) : reg6)));
          reg16 <= (~^(8'hb0));
        end
    end
  always
    @(posedge clk) begin
      reg20 <= ((~&(!(reg13[(2'h2):(1'h1)] >>> reg14))) | ({reg14,
          reg13[(3'h4):(2'h2)]} ^ $signed(((reg18 ?
          reg13 : wire2) || $unsigned((8'ha3))))));
    end
  assign wire21 = reg9[(2'h3):(2'h2)];
  assign wire22 = (^~($signed((~|(|reg14))) ?
                      $signed($unsigned($signed(reg8))) : (($unsigned(reg18) <<< $unsigned(reg19)) ?
                          ((-(8'ha4)) << (wire0 & wire21)) : reg15)));
  module23 #() modinst93 (wire92, clk, reg11, wire3, wire2, reg15, reg8);
  assign wire94 = {reg8, (wire0 ? $signed(reg8[(4'ha):(2'h2)]) : reg13)};
  assign wire95 = (((^~(reg11 && (^reg6))) != (&($signed(reg9) ?
                          reg7 : (wire2 ? (8'ha8) : (8'hb5))))) ?
                      (~(((reg15 ? reg6 : wire4) == $unsigned(reg11)) ?
                          (^(8'haa)) : (reg5[(1'h1):(1'h1)] <<< reg6[(3'h5):(1'h1)]))) : (!{$unsigned({reg14})}));
  assign wire96 = $unsigned(($unsigned((((8'ha3) ? reg16 : reg13) ?
                      wire4 : (reg12 ?
                          reg13 : wire0))) - ($signed($signed(wire4)) ?
                      ($signed(reg10) != $signed(wire94)) : reg10[(4'hd):(1'h1)])));
  assign wire97 = $unsigned(($unsigned(($signed(reg16) ?
                      {(8'ha1)} : wire96)) && reg14[(1'h1):(1'h0)]));
  assign wire98 = (-wire3);
  assign wire99 = (+reg14);
  always
    @(posedge clk) begin
      reg100 <= reg13[(3'h5):(2'h3)];
      if (($unsigned((((~wire0) * (reg20 - wire1)) ?
          wire3 : ({reg14} ?
              reg19[(3'h5):(1'h0)] : (reg8 ? reg11 : (8'hba))))) - (!reg6)))
        begin
          reg101 <= ($unsigned($unsigned(({reg14} ?
              (reg6 & wire95) : $signed((8'hbe))))) & wire21);
          if ((^~$signed(wire96[(1'h0):(1'h0)])))
            begin
              reg102 <= wire98[(2'h3):(2'h2)];
              reg103 <= (7'h41);
              reg104 <= $signed($unsigned((&($signed(wire96) - $signed(reg100)))));
              reg105 <= (-reg12);
            end
          else
            begin
              reg102 <= ((|wire21[(2'h3):(2'h2)]) > ($signed($unsigned(reg5)) ~^ ($unsigned($signed(wire98)) - reg105)));
              reg103 <= (8'hbd);
              reg104 <= (-(reg18 ?
                  $signed(((+wire3) - (reg8 ?
                      reg8 : wire3))) : {reg16[(3'h5):(3'h5)],
                      (+$unsigned(wire97))}));
            end
          reg106 <= ((reg17[(5'h13):(4'ha)] ~^ $unsigned($unsigned($unsigned(wire98)))) ?
              ($unsigned(($unsigned(reg102) - reg5)) <= reg7) : (-$signed({(reg15 ?
                      reg104 : reg8)})));
          reg107 <= (reg16[(4'hf):(3'h5)] ?
              $signed(reg11[(4'h9):(4'h9)]) : wire96[(1'h0):(1'h0)]);
          reg108 <= (~^({$signed(wire92[(1'h0):(1'h0)])} ~^ ((wire99[(4'h8):(1'h0)] ?
                  $unsigned(wire95) : $signed(reg17)) ?
              reg11[(1'h0):(1'h0)] : ($signed(reg106) ?
                  reg12 : wire99[(4'ha):(4'h9)]))));
        end
      else
        begin
          reg101 <= ((+wire22[(3'h7):(1'h0)]) ?
              wire1[(4'hb):(4'h8)] : ($unsigned(reg20) ?
                  (~($unsigned(wire92) ?
                      $signed(wire95) : $signed(wire99))) : reg107[(3'h6):(2'h3)]));
          reg102 <= (~&($unsigned({$signed(wire95)}) >>> (^reg19[(3'h5):(1'h1)])));
          reg103 <= $unsigned($unsigned(((~&(!reg18)) ?
              (~(reg5 ? wire22 : wire22)) : reg100[(4'h9):(3'h4)])));
          reg104 <= $unsigned((~&reg18));
          reg105 <= (^({reg16[(4'hb):(1'h1)], (!reg14)} ?
              wire4[(4'hb):(3'h7)] : $unsigned($unsigned(reg20))));
        end
      if ((~^((8'hb9) ?
          reg19 : (((wire1 ? reg5 : (8'ha6)) == reg104[(1'h0):(1'h0)]) ?
              $unsigned((reg101 ~^ wire97)) : ($unsigned(wire21) ?
                  (+reg103) : $unsigned(wire21))))))
        begin
          reg109 <= reg10[(1'h1):(1'h1)];
          reg110 <= ({(~&reg107[(1'h0):(1'h0)])} ?
              ({((reg16 ? wire96 : reg16) ? reg19 : reg12),
                      $signed((reg8 >= reg106))} ?
                  {$signed($signed(reg6)),
                      reg10[(2'h3):(1'h0)]} : wire97) : $unsigned(reg104));
          reg111 <= wire96[(1'h0):(1'h0)];
          reg112 <= ((reg101 ? wire99 : {{(|(8'hab))}, reg108}) ?
              reg102 : $unsigned((~&((wire1 >= (8'hbe)) ?
                  $signed(wire21) : {reg7, (8'h9e)}))));
        end
      else
        begin
          reg109 <= {($signed((reg100 ? reg106 : reg103)) <= ({{wire96},
                      (&wire0)} ?
                  reg12 : ($signed((8'hb0)) ~^ $unsigned(wire92))))};
          reg110 <= reg103[(1'h0):(1'h0)];
        end
      reg113 <= $signed(((+(reg13 < $signed(reg7))) == (|$unsigned(reg108[(3'h4):(1'h0)]))));
      if ($signed((reg15[(1'h0):(1'h0)] ? wire98 : reg109)))
        begin
          if ({((($unsigned(reg110) ? reg7 : reg6[(3'h7):(3'h5)]) ?
                      $signed($unsigned(reg12)) : {reg112,
                          wire92[(4'h9):(3'h4)]}) ?
                  {$signed(wire99[(1'h1):(1'h0)])} : ($unsigned((reg108 >>> wire0)) ?
                      $signed(reg14[(2'h2):(2'h2)]) : ((8'haa) ?
                          {reg110} : reg5[(3'h4):(3'h4)]))),
              ((reg107[(3'h7):(1'h0)] ? $signed((-reg107)) : {wire97}) ?
                  wire92[(5'h10):(3'h4)] : $unsigned(reg10[(3'h5):(2'h3)]))})
            begin
              reg114 <= {$signed((-$unsigned((wire2 > wire21)))),
                  ((8'ha0) ^ $unsigned(($signed((8'h9e)) | $signed(reg109))))};
              reg115 <= (+$unsigned(wire1));
              reg116 <= reg101[(1'h1):(1'h0)];
              reg117 <= (reg11[(3'h7):(1'h1)] ~^ (reg15 ?
                  {$unsigned((|reg9))} : $signed(reg116)));
            end
          else
            begin
              reg114 <= {reg109, reg19[(1'h1):(1'h0)]};
              reg115 <= wire4[(3'h6):(1'h0)];
              reg116 <= wire3[(5'h10):(2'h3)];
              reg117 <= reg16[(5'h12):(3'h7)];
              reg118 <= {reg15};
            end
          if ($signed((reg104 ? {$signed(reg115[(1'h0):(1'h0)])} : wire97)))
            begin
              reg119 <= wire4[(4'hd):(4'hd)];
              reg120 <= $signed(reg15[(4'hb):(2'h2)]);
            end
          else
            begin
              reg119 <= {((8'hba) <= $unsigned(((^~reg102) ?
                      wire0 : (8'ha1))))};
              reg120 <= wire99[(3'h7):(3'h4)];
              reg121 <= (!$signed(reg118));
              reg122 <= (reg9 ?
                  ($unsigned(reg115) ?
                      reg120[(3'h5):(1'h0)] : $signed((~$signed((8'hb9))))) : ((({reg107} ?
                              reg115[(2'h2):(2'h2)] : $unsigned((8'hb3))) ?
                          ((~|wire97) ?
                              $signed((7'h40)) : (reg108 ?
                                  wire3 : (8'ha7))) : $signed((reg118 & reg107))) ?
                      (reg114[(3'h4):(2'h2)] ?
                          (wire4 <= reg17[(5'h13):(4'hf)]) : ({reg9,
                              (8'ha6)} != (8'hb1))) : (~^(&{reg12, reg19}))));
            end
          reg123 <= $unsigned((^reg14));
          if ((&wire94))
            begin
              reg124 <= reg107;
              reg125 <= $unsigned(reg121[(4'h9):(4'h8)]);
              reg126 <= ((^({(reg10 ? wire1 : wire21),
                  {wire1, wire0}} <<< ((reg118 ? wire96 : reg122) ?
                  $unsigned(reg116) : reg112[(1'h1):(1'h1)]))) >= reg125[(2'h2):(1'h0)]);
              reg127 <= ((&(^$signed(reg119[(4'h8):(1'h0)]))) ?
                  {(~^(|((8'hb4) ? (7'h41) : (7'h40)))),
                      (~&(reg6[(4'hc):(3'h4)] != (reg10 ?
                          (8'ha8) : reg14)))} : ((~&$unsigned($unsigned(reg110))) ?
                      $unsigned({$signed(reg110),
                          {(8'h9c), reg111}}) : ((wire22 ?
                              (reg120 ?
                                  (7'h42) : reg9) : wire96[(1'h1):(1'h0)]) ?
                          reg123 : reg113[(2'h3):(2'h2)])));
            end
          else
            begin
              reg124 <= (^$unsigned($signed(((~&reg102) <<< {wire0}))));
              reg125 <= (^~(^~$unsigned(wire3[(5'h11):(1'h0)])));
              reg126 <= (reg6[(3'h7):(3'h4)] ? (8'hbe) : wire95);
              reg127 <= $unsigned(($unsigned(reg107[(4'h8):(3'h4)]) >= ($unsigned($unsigned(reg105)) < reg109[(1'h1):(1'h0)])));
            end
          reg128 <= $signed(reg102[(4'h8):(1'h1)]);
        end
      else
        begin
          reg114 <= reg107;
          reg115 <= (^((((reg118 ? wire95 : reg11) ?
                  ((8'hbf) - reg115) : (~wire2)) ^~ (-{reg107})) ?
              $signed(reg124) : $signed({$unsigned(reg19)})));
          reg116 <= reg110;
        end
    end
  assign wire129 = $unsigned(reg125[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg130 <= {$signed(reg15[(4'h8):(2'h3)]), reg103};
      reg131 <= ({$signed(reg102), reg120[(1'h0):(1'h0)]} ?
          (wire3 ? wire4[(4'hb):(2'h2)] : reg5[(1'h0):(1'h0)]) : reg123);
      reg132 <= {$signed(wire3),
          ($signed($unsigned($unsigned((8'hb3)))) <<< ((8'haf) & reg106))};
      if (reg20[(5'h11):(4'hc)])
        begin
          reg133 <= ($signed({wire22[(3'h5):(3'h4)],
              reg11[(4'h8):(3'h7)]}) - reg15[(3'h6):(1'h0)]);
          reg134 <= {((wire129[(1'h0):(1'h0)] ?
                      ({(7'h44), reg104} ?
                          $unsigned(reg118) : (8'h9e)) : $signed(((8'hbf) ?
                          (8'hbb) : wire22))) ?
                  reg124 : (wire2 ? $unsigned((~&reg131)) : wire1))};
          if ((^~(wire92 ?
              {((reg132 || reg18) ? wire92 : reg122)} : $unsigned(wire98))))
            begin
              reg135 <= (((((reg127 <= reg113) ?
                      $signed(reg13) : (reg20 >> wire99)) >> (reg20 <= (reg18 ?
                      reg7 : wire92))) ?
                  reg108 : (^reg125)) <= $unsigned((^~$unsigned(reg107))));
            end
          else
            begin
              reg135 <= reg131;
              reg136 <= reg126;
              reg137 <= reg130;
            end
          reg138 <= (|reg116[(2'h2):(1'h0)]);
        end
      else
        begin
          reg133 <= $signed(reg113);
          if (((^~{(^~reg135)}) & $signed(((wire95 || (reg115 ?
                  reg10 : wire99)) ?
              wire92 : reg13))))
            begin
              reg134 <= wire92[(4'hc):(1'h0)];
              reg135 <= (wire95 ?
                  $signed(reg108[(3'h5):(2'h2)]) : ({reg126,
                      (reg9 ? reg106 : (reg16 >>> reg101))} ~^ (7'h41)));
            end
          else
            begin
              reg134 <= {reg106,
                  ((~&{reg116}) <= (reg106[(2'h2):(2'h2)] ?
                      $unsigned($signed(reg105)) : (reg116 ?
                          (reg112 != reg106) : $signed(reg135))))};
              reg135 <= wire99[(5'h14):(4'hc)];
            end
          if ($signed($unsigned((|$signed(wire97[(4'h8):(3'h5)])))))
            begin
              reg136 <= ((^((|((8'hac) ? reg10 : reg125)) ?
                      (reg8 ?
                          wire97 : (reg112 ?
                              reg106 : reg121)) : $signed(reg120[(3'h4):(3'h4)]))) ?
                  (($signed((reg19 ? (8'hb8) : reg103)) ?
                          (-(reg102 ? reg119 : (8'hb0))) : (|{reg100,
                              reg101})) ?
                      (~|reg131) : $unsigned(reg138[(4'h8):(1'h1)])) : wire97[(2'h2):(1'h1)]);
              reg137 <= (reg9 ?
                  $unsigned($signed(($unsigned(reg134) ?
                      $unsigned(reg118) : $signed(reg18)))) : ($signed(((-reg8) >= (&(8'haf)))) + (~($unsigned(reg126) ?
                      $signed(reg110) : (reg123 && reg106)))));
              reg138 <= reg117;
              reg139 <= reg112[(3'h6):(2'h2)];
            end
          else
            begin
              reg136 <= $unsigned($unsigned((-((reg127 << reg116) ?
                  (~&reg125) : (reg11 ? (8'hb4) : (8'had))))));
              reg137 <= $unsigned($unsigned(reg17[(3'h7):(3'h6)]));
              reg138 <= (reg19[(3'h4):(3'h4)] ?
                  $unsigned(reg104) : ((((wire94 | reg113) ?
                              reg121 : (~reg104)) ?
                          reg102 : {(reg5 < (8'hac)), $unsigned(reg6)}) ?
                      $unsigned((|$signed((8'haf)))) : $unsigned((~&(^wire96)))));
              reg139 <= $unsigned(wire92[(4'ha):(4'h8)]);
              reg140 <= (~|(|(^~{(reg112 << (8'hb1))})));
            end
          reg141 <= ($signed(((+(reg120 ? reg17 : reg113)) ?
                  reg9[(4'hb):(4'h9)] : {((8'hb5) ? wire4 : (8'hb7))})) ?
              $signed((reg139[(3'h5):(2'h2)] ?
                  {$signed(reg103),
                      (reg9 <= (8'hb3))} : (wire98[(3'h7):(3'h5)] ?
                      {reg120, reg19} : (!reg105)))) : $signed(reg137));
          reg142 <= $signed($unsigned($signed((!(reg103 - (8'ha6))))));
        end
    end
  assign wire143 = wire0;
  assign wire144 = ((~$signed($unsigned(((8'h9f) || reg137)))) | reg6[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      reg145 <= wire99[(5'h11):(5'h11)];
    end
endmodule

module module23
#(parameter param91 = (((-{(~(8'ha2))}) != {(((8'ha7) ? (8'hb3) : (8'hbc)) << (-(8'ha6))), (^((8'ha9) ? (8'ha5) : (8'had)))}) < (((+(^(7'h43))) ? (((8'hbf) <= (8'hbd)) ? {(8'ha6)} : {(8'hb2), (8'hac)}) : (((8'ha3) < (8'hbd)) | ((8'hb4) >>> (8'ha5)))) > (((~&(8'hb5)) ^~ (!(7'h44))) ? {((8'hb6) >= (8'hbd))} : {((8'ha8) ? (8'hba) : (8'ha8))}))))
(y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire28;
  input wire [(5'h11):(1'h0)] wire27;
  input wire [(4'hf):(1'h0)] wire26;
  input wire [(4'he):(1'h0)] wire25;
  input wire [(5'h12):(1'h0)] wire24;
  wire signed [(5'h13):(1'h0)] wire76;
  wire [(2'h3):(1'h0)] wire33;
  wire [(4'h9):(1'h0)] wire32;
  wire [(4'he):(1'h0)] wire31;
  wire [(5'h15):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire29;
  reg signed [(4'he):(1'h0)] reg90 = (1'h0);
  reg signed [(4'he):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg86 = (1'h0);
  reg [(4'h8):(1'h0)] reg85 = (1'h0);
  reg [(4'hb):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg83 = (1'h0);
  reg [(3'h5):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg81 = (1'h0);
  reg [(5'h10):(1'h0)] reg80 = (1'h0);
  reg [(3'h7):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg78 = (1'h0);
  assign y = {wire76,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
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
                 reg78,
                 (1'h0)};
  assign wire29 = $signed(wire27[(2'h2):(2'h2)]);
  assign wire30 = $unsigned({wire29});
  assign wire31 = wire26[(4'hd):(4'hc)];
  assign wire32 = ($unsigned($signed((wire28 ? $signed(wire24) : wire26))) ?
                      wire25 : wire30[(5'h14):(2'h2)]);
  assign wire33 = wire25[(3'h6):(3'h5)];
  module34 #() modinst77 (.wire38(wire29), .clk(clk), .wire35(wire31), .wire37(wire24), .y(wire76), .wire36(wire27));
  always
    @(posedge clk) begin
      reg78 <= wire28[(1'h0):(1'h0)];
      if (($signed(($signed((wire31 << wire26)) ^ $unsigned({(8'ha6)}))) ?
          wire27 : (($unsigned((wire24 ? (8'ha2) : wire33)) ?
                  {$unsigned((8'hb2))} : (8'had)) ?
              (^~(-$signed(wire31))) : $unsigned($signed((wire76 ?
                  wire33 : wire24))))))
        begin
          reg79 <= (8'ha4);
          reg80 <= (reg78 ?
              (!wire28) : (^($signed((^~wire26)) > $signed({(8'hb9)}))));
          reg81 <= ((^~((8'ha3) + (8'hb1))) <= $unsigned(wire29[(4'he):(4'h9)]));
          reg82 <= ($signed(wire24) >>> (-((wire24[(4'h9):(1'h1)] * (&wire27)) ?
              ((reg78 ? reg79 : wire25) ?
                  (reg78 ? wire25 : (8'hbc)) : ((8'hae) ?
                      (8'h9d) : wire28)) : reg81[(1'h0):(1'h0)])));
          if ((-(reg78[(5'h10):(1'h1)] || wire25)))
            begin
              reg83 <= ((^wire76) * (reg78[(3'h4):(2'h3)] ?
                  {$signed(((8'hb1) >> reg81)), wire25} : $unsigned((!reg78))));
              reg84 <= $signed(wire28);
              reg85 <= $unsigned((wire29[(4'ha):(4'ha)] >= {{$unsigned(reg80)}}));
              reg86 <= $signed(((&($unsigned(wire33) ?
                      (7'h42) : $unsigned(wire31))) ?
                  $signed($unsigned(wire32)) : $signed((~^((8'hb1) ?
                      wire33 : (8'hb7))))));
            end
          else
            begin
              reg83 <= (reg85[(1'h1):(1'h0)] & $unsigned({{(^~reg84), wire33},
                  $unsigned((8'hb1))}));
              reg84 <= {(wire32[(2'h2):(1'h1)] ?
                      ((reg81[(1'h1):(1'h0)] ?
                              $signed(wire33) : $unsigned((8'ha2))) ?
                          $unsigned($signed((8'hbf))) : wire28) : wire28[(3'h4):(3'h4)])};
              reg85 <= $signed($unsigned($signed(((reg81 ^ (7'h42)) ?
                  (reg86 + wire28) : wire33))));
              reg86 <= ($unsigned((&({wire33} ?
                  (wire24 ?
                      reg85 : (8'hb5)) : reg83))) <= (reg82[(1'h1):(1'h1)] >> wire24));
              reg87 <= reg79[(3'h5):(1'h0)];
            end
        end
      else
        begin
          reg79 <= (|reg84);
          if ($unsigned((reg87[(1'h1):(1'h0)] ?
              $signed(wire33) : ({reg78} ?
                  $signed((reg85 - wire28)) : wire33))))
            begin
              reg80 <= $unsigned((8'h9f));
              reg81 <= wire33;
            end
          else
            begin
              reg80 <= (~^(((-(wire29 + wire29)) ?
                  $signed(((8'hb2) >= (8'hb0))) : ((wire30 ?
                      reg87 : wire24) >>> (&reg84))) << ((reg86[(1'h0):(1'h0)] != wire26[(4'hc):(4'h9)]) ?
                  $unsigned((~wire30)) : {reg86, (wire25 >> wire27)})));
              reg81 <= $signed($unsigned({wire31, $signed($signed(reg81))}));
              reg82 <= $unsigned(reg80[(1'h0):(1'h0)]);
              reg83 <= wire28[(2'h2):(2'h2)];
              reg84 <= ({$unsigned($signed(wire29[(3'h7):(3'h5)]))} ?
                  ($signed(($signed(wire24) >> wire26[(4'hc):(3'h4)])) + $signed(($unsigned(reg84) ?
                      $unsigned(reg84) : $signed((8'haa))))) : ((^($signed(reg80) ?
                      $signed(wire26) : {(7'h42),
                          wire76})) >= $signed(((wire25 ? reg84 : wire29) ?
                      (~|reg82) : wire33[(1'h1):(1'h1)]))));
            end
          if (wire30)
            begin
              reg85 <= (wire29 ? wire31[(2'h2):(1'h1)] : (-(~|wire29)));
            end
          else
            begin
              reg85 <= $unsigned($unsigned(wire24[(5'h11):(4'hf)]));
            end
        end
      reg88 <= wire31;
      reg89 <= $unsigned({$signed((((8'ha4) ?
              wire32 : wire29) - $unsigned(reg84))),
          $unsigned(reg83[(3'h4):(2'h3)])});
      reg90 <= (!wire28[(1'h0):(1'h0)]);
    end
endmodule

module module34
#(parameter param75 = ((!((((8'hb4) ? (8'hbc) : (8'h9f)) ? ((8'hac) ? (7'h40) : (8'h9e)) : (&(8'hbe))) != (((8'had) ? (8'ha0) : (8'hb1)) ? ((8'hbf) ? (8'hb0) : (8'hbe)) : (~|(8'hab))))) ? {(8'haa)} : (~&((~|(~^(8'hb1))) ? (((7'h43) ? (8'hbc) : (8'hb5)) ? (8'hb5) : (~^(7'h43))) : (|(8'haf))))))
(y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'h1b8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire38;
  input wire signed [(2'h3):(1'h0)] wire37;
  input wire [(5'h11):(1'h0)] wire36;
  input wire signed [(4'he):(1'h0)] wire35;
  wire signed [(5'h14):(1'h0)] wire73;
  wire signed [(5'h10):(1'h0)] wire69;
  wire signed [(2'h3):(1'h0)] wire68;
  wire [(3'h7):(1'h0)] wire67;
  wire signed [(5'h11):(1'h0)] wire66;
  wire [(5'h12):(1'h0)] wire65;
  wire [(4'ha):(1'h0)] wire64;
  wire signed [(4'h9):(1'h0)] wire63;
  wire signed [(5'h13):(1'h0)] wire62;
  wire signed [(3'h5):(1'h0)] wire46;
  wire signed [(3'h7):(1'h0)] wire45;
  wire signed [(4'hb):(1'h0)] wire44;
  wire signed [(5'h14):(1'h0)] wire42;
  wire [(5'h12):(1'h0)] wire41;
  wire signed [(3'h6):(1'h0)] wire40;
  wire signed [(2'h2):(1'h0)] wire39;
  reg [(2'h3):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg71 = (1'h0);
  reg [(5'h10):(1'h0)] reg70 = (1'h0);
  reg [(5'h12):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg58 = (1'h0);
  reg [(5'h15):(1'h0)] reg57 = (1'h0);
  reg [(3'h7):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg54 = (1'h0);
  reg [(4'h8):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(4'hd):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg50 = (1'h0);
  reg [(2'h3):(1'h0)] reg49 = (1'h0);
  reg [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg47 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  assign y = {wire73,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire46,
                 wire45,
                 wire44,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 reg74,
                 reg72,
                 reg71,
                 reg70,
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
                 reg48,
                 reg47,
                 reg43,
                 (1'h0)};
  assign wire39 = (&$unsigned($signed({wire37, (+wire35)})));
  assign wire40 = $signed(wire35[(4'hd):(4'h9)]);
  assign wire41 = wire39[(2'h2):(1'h0)];
  assign wire42 = $signed(($signed($unsigned(wire36[(2'h2):(1'h1)])) ?
                      $unsigned(((wire38 != wire38) ?
                          $unsigned(wire37) : ((8'hae) << (8'hac)))) : ($unsigned((wire35 + (8'h9d))) << wire41)));
  always
    @(posedge clk) begin
      reg43 <= wire42[(5'h12):(4'ha)];
    end
  assign wire44 = (reg43[(4'hd):(4'hd)] ?
                      wire37 : {$signed(($signed(wire40) ^~ reg43[(4'hf):(3'h6)]))});
  assign wire45 = (!wire37);
  assign wire46 = $unsigned(wire39);
  always
    @(posedge clk) begin
      reg47 <= (+$unsigned(wire35));
      reg48 <= $unsigned($unsigned($unsigned($unsigned(wire37))));
      if ($unsigned(((~^$unsigned($unsigned(wire41))) ?
          (~((wire44 ? wire46 : wire44) ?
              wire39[(1'h0):(1'h0)] : (&reg48))) : $unsigned((~|wire41)))))
        begin
          reg49 <= (8'ha0);
          if (wire46)
            begin
              reg50 <= ((8'h9c) & (~^$signed((~^(&reg47)))));
            end
          else
            begin
              reg50 <= (((wire45 ?
                      ($signed(reg43) <= ((8'hb0) ?
                          reg47 : reg43)) : (^wire45[(2'h2):(1'h1)])) | (+$signed(wire46[(2'h2):(1'h0)]))) ?
                  {wire45[(3'h4):(2'h2)]} : reg43);
              reg51 <= (~($signed((!(wire36 ?
                  wire44 : wire44))) << $signed(reg50[(5'h14):(1'h1)])));
              reg52 <= (~(($unsigned((8'ha0)) ?
                      ((8'ha7) ?
                          $signed((8'ha4)) : (wire38 ^~ reg47)) : (^~wire41[(3'h5):(2'h3)])) ?
                  ($unsigned($signed((8'ha7))) ?
                      wire36[(4'hb):(4'h9)] : reg43[(4'hf):(4'hb)]) : reg48));
              reg53 <= wire45;
            end
          reg54 <= ((|($signed((wire36 && wire42)) && ((wire39 + reg51) ?
                  (reg53 <<< reg49) : (wire42 || reg52)))) ?
              (reg53[(1'h0):(1'h0)] >= {wire35}) : $unsigned((wire44[(4'h8):(3'h4)] ?
                  $signed((!reg43)) : (((8'h9d) & (8'hba)) * (wire44 < wire37)))));
          reg55 <= reg49;
        end
      else
        begin
          reg49 <= ($signed((wire45 - (~|(-reg51)))) - {($signed((wire46 ?
                      wire45 : reg54)) ?
                  reg51[(3'h4):(3'h4)] : (+wire46)),
              ((wire42[(4'hf):(4'he)] == $unsigned(wire42)) || (reg49[(2'h2):(1'h1)] <<< wire45[(3'h4):(1'h1)]))});
          reg50 <= $unsigned($signed((~&$unsigned((~(8'hbe))))));
          reg51 <= (|reg55[(2'h2):(1'h0)]);
          if ($unsigned($signed((|(^~(^reg43))))))
            begin
              reg52 <= ((^~$unsigned(wire45[(2'h3):(1'h0)])) > reg54[(5'h11):(4'he)]);
            end
          else
            begin
              reg52 <= $signed($unsigned(($signed($unsigned(reg54)) ?
                  ((~(8'hae)) ?
                      (reg50 ?
                          (8'hb3) : wire38) : $unsigned(reg43)) : ($unsigned(reg52) ?
                      $unsigned(wire45) : (reg48 << (8'ha5))))));
              reg53 <= reg48[(2'h3):(2'h3)];
              reg54 <= $unsigned(reg53[(3'h5):(3'h4)]);
              reg55 <= ($unsigned((($unsigned(reg50) > (reg54 * wire40)) < ((reg48 ?
                          reg49 : (8'hbb)) ?
                      $signed(reg49) : (wire44 ? wire42 : reg48)))) ?
                  reg43[(4'hf):(3'h4)] : {$signed($signed($unsigned(reg43))),
                      (&reg48)});
              reg56 <= ({(~&$unsigned($signed(wire44)))} * (!(&((reg53 ?
                      wire41 : reg51) ?
                  reg55 : $signed(wire42)))));
            end
          if (reg56[(2'h2):(1'h0)])
            begin
              reg57 <= (-$unsigned(((~reg51[(2'h2):(2'h2)]) >= ((~|wire40) + $unsigned(reg49)))));
              reg58 <= (|wire40[(1'h0):(1'h0)]);
              reg59 <= $unsigned($signed({wire46[(1'h1):(1'h0)],
                  ((8'hb4) ? (reg52 <<< reg52) : (~&wire41))}));
              reg60 <= ((8'hbd) ?
                  reg53 : (~&$unsigned((reg57 && $unsigned(wire40)))));
            end
          else
            begin
              reg57 <= ((((reg51 ? ((7'h42) ? reg52 : wire38) : (8'ha8)) ?
                      ($signed(wire46) ?
                          (wire46 ?
                              reg43 : (8'hab)) : $unsigned(wire42)) : (!wire45)) >> $unsigned($unsigned(reg54[(4'hf):(4'ha)]))) ?
                  reg53 : $unsigned((!wire42[(3'h5):(1'h0)])));
              reg58 <= wire46[(3'h5):(1'h1)];
              reg59 <= $unsigned($signed($signed(reg56[(3'h6):(2'h3)])));
              reg60 <= ($signed($unsigned(((wire35 <= reg52) ?
                      (+reg60) : (~^reg49)))) ?
                  reg47 : (wire40[(1'h1):(1'h1)] > ((!wire36) << (^~{reg58,
                      reg54}))));
              reg61 <= $unsigned((($unsigned($unsigned((8'hae))) ?
                  ((reg59 ?
                      (8'hb1) : reg50) || wire40[(3'h4):(1'h1)]) : $signed($unsigned((8'ha6)))) << wire44));
            end
        end
    end
  assign wire62 = (~(wire37 ?
                      $signed(($signed(wire39) ?
                          (wire37 ^ wire39) : (reg47 ?
                              reg54 : reg51))) : $signed((wire44[(1'h0):(1'h0)] ?
                          (reg57 ? wire35 : reg59) : reg60[(5'h11):(3'h5)]))));
  assign wire63 = $unsigned(($signed(wire44) ?
                      wire39[(1'h1):(1'h0)] : (wire37[(1'h1):(1'h1)] ?
                          (~|(wire40 ?
                              wire44 : reg52)) : $signed(wire39[(1'h1):(1'h1)]))));
  assign wire64 = $unsigned($signed((&wire63[(3'h7):(3'h7)])));
  assign wire65 = $signed($signed(wire44));
  assign wire66 = $unsigned($unsigned(($unsigned(reg59) | wire46[(3'h4):(2'h3)])));
  assign wire67 = reg53;
  assign wire68 = reg55[(1'h0):(1'h0)];
  assign wire69 = wire37[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg70 <= $signed((|(|reg60[(4'hd):(4'hd)])));
      reg71 <= (&wire35);
      reg72 <= (reg61 ?
          ($unsigned((~&reg59)) ^ {(reg55[(3'h4):(1'h1)] <<< {reg56}),
              ($signed(wire37) >> ((8'hbc) ?
                  (8'hbe) : wire68))}) : ((~^$signed(reg70)) ?
              reg55[(4'hf):(4'hf)] : $signed((~^wire45))));
    end
  assign wire73 = reg50;
  always
    @(posedge clk) begin
      reg74 <= reg54;
    end
endmodule
