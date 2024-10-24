module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h113):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire3;
  wire signed [(5'h12):(1'h0)] wire237;
  wire signed [(4'hd):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire14;
  wire [(3'h6):(1'h0)] wire15;
  wire signed [(3'h6):(1'h0)] wire25;
  wire signed [(3'h7):(1'h0)] wire26;
  wire [(5'h14):(1'h0)] wire235;
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg4 = (1'h0);
  assign y = {wire237,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire25,
                 wire26,
                 wire235,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire3)
        begin
          reg4 <= (^~wire2);
          if ((~^wire0[(2'h2):(1'h1)]))
            begin
              reg5 <= $unsigned(wire0);
              reg6 <= $unsigned(reg5[(4'hb):(2'h2)]);
              reg7 <= (($unsigned((wire0 != (reg6 >> reg6))) ~^ reg4[(2'h2):(1'h1)]) == (wire0 < ($signed((~|reg4)) ?
                  (|{reg6}) : (wire3 ?
                      ((8'h9e) ? reg4 : reg4) : $unsigned(reg4)))));
              reg8 <= ((~^(7'h41)) ?
                  wire2[(1'h1):(1'h0)] : ((&(&$unsigned(reg7))) ~^ ((reg4 + (wire0 ?
                      reg4 : reg5)) >= $unsigned((8'hb7)))));
            end
          else
            begin
              reg5 <= (~^wire1[(4'hc):(3'h4)]);
              reg6 <= ($unsigned(((~|reg4[(4'ha):(2'h3)]) ?
                      (reg4[(4'hd):(3'h4)] ?
                          (reg5 ?
                              reg8 : wire2) : $signed(reg4)) : $signed((wire2 ^~ reg5)))) ?
                  wire0 : reg6[(2'h2):(1'h0)]);
              reg7 <= $unsigned(reg4[(3'h5):(3'h5)]);
              reg8 <= ((~&reg8[(1'h0):(1'h0)]) >>> (wire1 ?
                  wire0[(3'h4):(3'h4)] : $signed(wire0)));
            end
          reg9 <= wire3[(2'h2):(1'h1)];
          reg10 <= ($unsigned(wire2) ?
              (~|{($unsigned(reg5) ? (~|reg9) : wire3),
                  ((reg6 - reg6) >= (~|reg9))}) : (8'ha6));
        end
      else
        begin
          reg4 <= (~&(((reg4 ?
                  (~wire0) : (reg8 ?
                      wire3 : reg9)) & ((wire0 && reg4) << reg5)) ?
              reg5[(4'he):(4'h9)] : (~|reg9)));
          if (((($signed(reg8[(3'h6):(3'h5)]) ?
                  (reg10 - {reg8, wire2}) : $unsigned((reg8 | wire3))) ?
              (~reg8) : (wire0 || $unsigned((reg10 & (8'hae))))) << (8'ha3)))
            begin
              reg5 <= $signed(reg8);
            end
          else
            begin
              reg5 <= (reg10[(4'he):(3'h6)] == wire0);
              reg6 <= $signed(reg6);
              reg7 <= (^~{{(!(reg4 ? wire2 : (8'ha2))),
                      $unsigned($signed(reg5))},
                  (8'hb6)});
              reg8 <= wire0[(1'h0):(1'h0)];
            end
        end
      reg11 <= (($signed(wire0[(1'h0):(1'h0)]) ?
              $signed($signed((!reg5))) : (!reg8[(3'h6):(3'h4)])) ?
          $signed($unsigned($signed($signed(reg6)))) : ((reg7[(3'h6):(1'h0)] ?
                  (^(|reg6)) : {wire2[(3'h6):(2'h3)]}) ?
              wire2[(1'h0):(1'h0)] : (wire0 | ({wire2, wire2} ?
                  wire2 : (7'h41)))));
    end
  assign wire12 = $unsigned(reg9);
  assign wire13 = (reg11[(1'h1):(1'h1)] == reg9);
  assign wire14 = (-(!(8'hb0)));
  assign wire15 = (wire1 >>> $signed(wire3));
  always
    @(posedge clk) begin
      if (wire1[(5'h11):(4'he)])
        begin
          if (($unsigned(reg4[(3'h6):(1'h1)]) <= $signed($signed($signed($unsigned(wire2))))))
            begin
              reg16 <= wire2[(1'h1):(1'h0)];
              reg17 <= ((wire14 & {$signed(reg16[(3'h4):(3'h4)]),
                  wire1[(4'hc):(4'h9)]}) ^ $signed(reg16));
            end
          else
            begin
              reg16 <= reg5[(1'h1):(1'h0)];
              reg17 <= (~{reg16[(3'h6):(2'h2)],
                  (&{(wire12 ? (8'ha7) : (8'hbc)), (wire3 || wire0)})});
              reg18 <= {$unsigned((8'ha5))};
              reg19 <= ((^$unsigned(reg11[(4'h8):(1'h0)])) ?
                  ((&$unsigned((reg9 ? reg17 : reg8))) | {($signed(wire2) ?
                          {(8'h9d)} : (^~(8'had))),
                      $unsigned($unsigned(wire15))}) : reg10[(4'he):(4'h9)]);
            end
        end
      else
        begin
          reg16 <= wire1;
          if ($unsigned($unsigned($signed(wire12[(2'h2):(2'h2)]))))
            begin
              reg17 <= wire12[(2'h2):(1'h0)];
              reg18 <= $signed((reg8[(3'h4):(2'h2)] >> ($signed((reg16 ?
                  reg6 : (8'hab))) - reg8)));
              reg19 <= (~reg19[(4'ha):(4'h8)]);
              reg20 <= $signed(wire14);
            end
          else
            begin
              reg17 <= (($unsigned($signed($signed(wire2))) ?
                      (+reg4[(2'h2):(1'h0)]) : $signed(((wire14 < reg11) == ((8'hae) ?
                          (8'h9d) : reg10)))) ?
                  reg7[(1'h0):(1'h0)] : ($signed(($unsigned(reg16) >>> wire2[(2'h3):(2'h2)])) ?
                      reg7 : reg5[(4'h9):(2'h3)]));
            end
        end
      reg21 <= {$signed(reg4[(3'h7):(1'h0)]),
          ($unsigned(((reg19 << reg8) ? $unsigned((8'hba)) : $unsigned(reg5))) ?
              (((wire1 || reg6) ^ reg5[(4'hc):(4'h9)]) ?
                  ($unsigned((8'hb9)) >> $unsigned(reg8)) : wire14[(4'hf):(4'ha)]) : ((wire13 > wire14[(4'hb):(1'h0)]) > (^reg19)))};
      reg22 <= (^$signed(((!reg4[(1'h1):(1'h0)]) <= $signed((~&reg7)))));
      reg23 <= $unsigned($signed($unsigned(reg17[(3'h6):(3'h6)])));
      reg24 <= wire13[(2'h2):(2'h2)];
    end
  assign wire25 = $unsigned(($signed($signed($signed(wire12))) ?
                      $unsigned($unsigned(wire14[(4'h9):(4'h9)])) : (8'hbf)));
  assign wire26 = ((wire15 ?
                      (^~$unsigned(reg20[(2'h3):(2'h3)])) : reg20) << wire15);
  module27 #() modinst236 (wire235, clk, reg20, wire12, reg7, reg11, reg19);
  assign wire237 = $unsigned((~(~$signed((~^wire12)))));
endmodule

module module27  (y, clk, wire28, wire29, wire30, wire31, wire32);
  output wire [(32'h2e6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire28;
  input wire [(4'hb):(1'h0)] wire29;
  input wire [(4'h9):(1'h0)] wire30;
  input wire signed [(4'he):(1'h0)] wire31;
  input wire [(3'h6):(1'h0)] wire32;
  wire [(5'h10):(1'h0)] wire233;
  wire signed [(2'h3):(1'h0)] wire193;
  wire [(4'hc):(1'h0)] wire189;
  wire signed [(4'h8):(1'h0)] wire187;
  wire [(2'h3):(1'h0)] wire165;
  wire signed [(5'h14):(1'h0)] wire140;
  wire signed [(5'h11):(1'h0)] wire139;
  wire [(4'hf):(1'h0)] wire33;
  wire [(4'h9):(1'h0)] wire34;
  wire [(4'hc):(1'h0)] wire82;
  wire [(5'h15):(1'h0)] wire119;
  wire [(5'h15):(1'h0)] wire120;
  wire [(5'h13):(1'h0)] wire121;
  wire signed [(5'h10):(1'h0)] wire122;
  wire signed [(4'hc):(1'h0)] wire123;
  wire signed [(5'h11):(1'h0)] wire124;
  wire signed [(4'h8):(1'h0)] wire125;
  wire signed [(3'h5):(1'h0)] wire126;
  wire signed [(5'h10):(1'h0)] wire137;
  reg signed [(4'h9):(1'h0)] reg192 = (1'h0);
  reg [(2'h3):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg118 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg115 = (1'h0);
  reg [(5'h12):(1'h0)] reg114 = (1'h0);
  reg [(5'h14):(1'h0)] reg113 = (1'h0);
  reg [(2'h3):(1'h0)] reg112 = (1'h0);
  reg [(4'he):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg110 = (1'h0);
  reg [(5'h14):(1'h0)] reg109 = (1'h0);
  reg [(5'h13):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg107 = (1'h0);
  reg [(3'h4):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg104 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg103 = (1'h0);
  reg [(4'ha):(1'h0)] reg102 = (1'h0);
  reg [(5'h14):(1'h0)] reg101 = (1'h0);
  reg [(5'h13):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg99 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg98 = (1'h0);
  reg [(5'h12):(1'h0)] reg97 = (1'h0);
  reg [(4'hf):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg92 = (1'h0);
  reg [(4'hd):(1'h0)] reg91 = (1'h0);
  reg [(3'h4):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg89 = (1'h0);
  reg [(4'hc):(1'h0)] reg88 = (1'h0);
  reg [(4'hf):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg86 = (1'h0);
  reg [(5'h12):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg84 = (1'h0);
  assign y = {wire233,
                 wire193,
                 wire189,
                 wire187,
                 wire165,
                 wire140,
                 wire139,
                 wire33,
                 wire34,
                 wire82,
                 wire119,
                 wire120,
                 wire121,
                 wire122,
                 wire123,
                 wire124,
                 wire125,
                 wire126,
                 wire137,
                 reg192,
                 reg191,
                 reg190,
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
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 (1'h0)};
  assign wire33 = wire29[(4'hb):(4'ha)];
  assign wire34 = $signed(wire33);
  module35 #() modinst83 (wire82, clk, wire29, wire33, wire30, wire32);
  always
    @(posedge clk) begin
      reg84 <= $signed((!$unsigned(({wire28, wire31} ?
          $signed(wire28) : wire31[(4'h9):(1'h0)]))));
      if ($signed(wire32[(3'h4):(1'h1)]))
        begin
          if ({(!(&wire29)),
              (|(((~|wire31) << (wire29 ? wire33 : wire32)) ?
                  (8'ha4) : {wire28}))})
            begin
              reg85 <= $signed(wire34[(4'h9):(4'h8)]);
              reg86 <= (((((wire29 ? wire30 : wire31) << (~^wire31)) & wire33) ?
                  (~|$signed($signed(wire28))) : wire33[(3'h7):(1'h0)]) <<< $unsigned(wire82));
              reg87 <= ({(reg85[(4'h8):(2'h3)] ?
                      reg85 : (reg85[(4'h9):(1'h0)] * $unsigned(reg85))),
                  reg84[(4'h9):(2'h3)]} ^~ (^wire31[(3'h4):(1'h0)]));
              reg88 <= ((((~$signed(wire30)) ?
                      ($unsigned(reg86) ?
                          wire33[(3'h4):(1'h1)] : (~^wire29)) : (!(reg85 ?
                          (8'haf) : (7'h42)))) ?
                  $unsigned(reg84[(5'h10):(2'h2)]) : $signed($signed((reg85 | wire29)))) != $unsigned($unsigned((&wire33))));
              reg89 <= ((wire34[(3'h6):(1'h1)] ?
                      ($unsigned((wire29 ?
                          reg84 : wire31)) << wire30[(3'h4):(1'h1)]) : $unsigned($signed((reg85 && reg87)))) ?
                  (~|$signed((wire29 ?
                      $signed(wire28) : (reg85 ?
                          (8'hb2) : wire82)))) : ((~|$signed((!wire32))) >= ($unsigned((+wire34)) + (wire30 == {reg85,
                      wire31}))));
            end
          else
            begin
              reg85 <= $unsigned(((wire28 << (+(8'ha8))) || $unsigned((reg87 ^ $signed(reg88)))));
            end
          if ({{{wire31[(2'h2):(2'h2)]}, (8'haa)}})
            begin
              reg90 <= ((reg87 >>> (wire34[(3'h6):(1'h0)] ?
                      $signed($signed(reg88)) : (-wire34))) ?
                  ((((8'hac) << wire33[(2'h2):(1'h1)]) ~^ $unsigned($signed(reg87))) << (($signed((7'h42)) * {reg88,
                      wire32}) + reg85[(4'hb):(3'h6)])) : wire31[(3'h5):(2'h3)]);
            end
          else
            begin
              reg90 <= ($signed(($signed($signed(reg90)) ?
                      reg90 : (|wire32[(2'h3):(2'h3)]))) ?
                  reg87 : wire33);
              reg91 <= ((~(8'hbc)) ?
                  $signed(reg88[(1'h0):(1'h0)]) : $unsigned({(~(reg84 ?
                          wire82 : reg89))}));
            end
          if (wire30[(3'h5):(2'h3)])
            begin
              reg92 <= (&$signed(reg91));
              reg93 <= reg87[(2'h3):(2'h2)];
            end
          else
            begin
              reg92 <= $unsigned(reg85[(4'h8):(3'h4)]);
              reg93 <= ((+(wire30[(3'h7):(3'h6)] ?
                  {(8'hbf)} : reg85)) <<< reg84);
            end
          if ({((((wire29 ? wire28 : reg92) ? wire82 : $signed(wire29)) ?
                      ($unsigned(reg87) ?
                          (reg88 & wire82) : (reg89 >>> reg86)) : ({reg91} & wire34[(3'h7):(3'h4)])) ?
                  $unsigned(($signed(wire32) & (wire29 >= reg87))) : {reg91})})
            begin
              reg94 <= $unsigned(reg85);
              reg95 <= ((^~reg85[(3'h6):(3'h4)]) ?
                  $signed((^wire30[(3'h6):(3'h5)])) : reg94);
              reg96 <= $signed((&$unsigned(wire33)));
              reg97 <= $unsigned(wire34[(3'h5):(1'h1)]);
            end
          else
            begin
              reg94 <= reg85[(4'h8):(2'h3)];
              reg95 <= $unsigned(($signed({wire34, {reg94}}) ?
                  (~((reg94 ? wire30 : reg87) != (|reg91))) : reg89));
              reg96 <= reg90;
            end
        end
      else
        begin
          if (reg96)
            begin
              reg85 <= ($signed($unsigned(((wire31 ? wire28 : reg86) ?
                  (reg87 <= wire33) : $unsigned(reg85)))) * (7'h42));
              reg86 <= (~&$unsigned($signed(((wire30 & reg97) <= reg86))));
              reg87 <= reg94;
              reg88 <= (~|wire34[(4'h8):(4'h8)]);
            end
          else
            begin
              reg85 <= ({reg84[(3'h7):(3'h6)]} ?
                  $signed(reg85[(1'h0):(1'h0)]) : $signed(reg86[(4'h8):(3'h7)]));
              reg86 <= (($signed((reg93[(4'ha):(4'h9)] == $signed(wire29))) & (~&{reg84[(1'h1):(1'h1)],
                  (~reg95)})) ^~ ($signed({reg94[(1'h0):(1'h0)]}) > ((wire34[(4'h8):(2'h3)] >= (reg90 || reg93)) ?
                  ((~|(8'hab)) ?
                      ((8'hb9) ?
                          reg87 : wire30) : $signed(wire32)) : (7'h43))));
              reg87 <= {$signed((|reg96)), wire33};
              reg88 <= reg88;
              reg89 <= $unsigned({(^(reg87[(1'h1):(1'h1)] ?
                      {wire31} : (wire32 ? (8'h9d) : wire32)))});
            end
          reg90 <= wire31;
          reg91 <= $unsigned(wire34);
        end
      if ((+(~^(|$signed((reg96 & wire29))))))
        begin
          reg98 <= wire82[(2'h3):(2'h3)];
          reg99 <= $unsigned(wire28);
          reg100 <= reg98[(3'h4):(3'h4)];
          if ((~&(!(reg90[(1'h0):(1'h0)] ?
              (+{(7'h44)}) : ((~|reg89) ? wire33 : reg88)))))
            begin
              reg101 <= reg85;
            end
          else
            begin
              reg101 <= $signed(wire82[(3'h4):(1'h0)]);
              reg102 <= $signed({reg84[(4'hd):(3'h6)], reg97[(5'h10):(3'h7)]});
              reg103 <= reg102;
            end
        end
      else
        begin
          if (reg90[(3'h4):(1'h1)])
            begin
              reg98 <= $signed(wire30[(3'h5):(2'h2)]);
              reg99 <= (!$unsigned(reg88[(4'h8):(2'h2)]));
              reg100 <= (^($unsigned(($unsigned(reg93) || (&reg91))) == reg85[(4'he):(1'h1)]));
            end
          else
            begin
              reg98 <= reg98;
              reg99 <= ((~^$unsigned(((^~reg85) >> {reg99,
                  reg93}))) | (wire32[(3'h5):(3'h5)] ?
                  (+$unsigned(wire29)) : ((~&(8'haa)) == $signed($unsigned(reg89)))));
              reg100 <= (~|$unsigned((~&(reg101[(4'hc):(3'h5)] ^~ (wire29 ?
                  reg86 : wire33)))));
            end
          reg101 <= {(|$unsigned(($signed(wire31) >>> (~|reg84)))), (-(8'hbc))};
          reg102 <= (8'ha2);
        end
    end
  always
    @(posedge clk) begin
      reg104 <= ((($signed(((8'hb8) < reg92)) & {(reg100 ? reg100 : reg87),
              (reg91 ? wire33 : wire28)}) ?
          reg98 : wire28[(3'h7):(1'h1)]) - {(({reg92} ?
                  (reg86 ? reg94 : reg90) : reg84) ?
              reg101 : (^(reg94 && reg86))),
          {$signed(((8'hba) + reg97)),
              (reg91[(4'hd):(3'h6)] ? $unsigned(wire31) : $unsigned(reg88))}});
      reg105 <= reg97;
      reg106 <= $unsigned((~&reg89[(3'h4):(2'h2)]));
    end
  always
    @(posedge clk) begin
      reg107 <= reg98;
      reg108 <= {$unsigned({($unsigned(reg87) ? {(8'had), wire29} : (~reg93)),
              (+wire34)}),
          ({wire33[(3'h4):(3'h4)], ($unsigned(reg103) ^ reg101)} ?
              $signed($unsigned((reg94 | reg90))) : wire29)};
      if ((^~$unsigned((($unsigned(reg104) ?
          (wire29 ?
              reg85 : reg94) : (reg92 > reg106)) ^ $unsigned($signed(reg101))))))
        begin
          if ($unsigned(($signed((~^(reg105 * reg95))) ?
              $unsigned(((reg100 ?
                  reg86 : reg100) < $unsigned(wire33))) : reg84)))
            begin
              reg109 <= {{(^~wire28[(1'h0):(1'h0)]), $unsigned({{reg98}})},
                  (((|(8'hb8)) > $unsigned(reg106[(3'h4):(2'h2)])) ?
                      (((~&reg86) >= {reg90, reg106}) ?
                          $unsigned($signed(wire32)) : reg103) : (((wire32 ?
                              reg85 : reg95) ?
                          {reg107} : (reg85 ? reg108 : reg90)) ^~ reg93))};
              reg110 <= (~|(reg87 == ($signed((~(8'ha9))) == ({wire82, reg101} ?
                  (^wire29) : (reg98 ? reg102 : wire33)))));
              reg111 <= reg92;
              reg112 <= $signed($unsigned(($signed(wire30) ?
                  reg92[(4'h8):(3'h4)] : reg94[(4'h8):(3'h6)])));
              reg113 <= ((((&reg98) >>> reg96) ?
                  $unsigned(((reg105 >> reg94) <= $unsigned(reg101))) : ($unsigned((^reg84)) ?
                      $unsigned($unsigned((8'hba))) : $unsigned({reg89}))) >>> reg84);
            end
          else
            begin
              reg109 <= (~^{({$unsigned(reg96)} ?
                      $unsigned((&(8'hbe))) : $unsigned($signed(reg108))),
                  reg84[(3'h6):(2'h2)]});
              reg110 <= (~(reg108[(4'h9):(3'h4)] ^~ $signed(reg101)));
              reg111 <= ($signed(($unsigned((reg100 ?
                  reg105 : reg89)) | {reg89[(5'h14):(5'h10)]})) == (+((reg94 ^~ reg85) ?
                  (-$unsigned((8'ha1))) : (!(^~wire31)))));
              reg112 <= ($unsigned(($unsigned((+reg101)) ?
                  (-wire30) : ($signed(reg99) > (&reg94)))) & (reg90 << reg94[(4'h8):(3'h6)]));
            end
          reg114 <= ($unsigned($unsigned(reg105)) ?
              reg102 : reg94[(3'h6):(1'h0)]);
          reg115 <= wire31[(3'h6):(3'h4)];
          if ($signed($unsigned((^~reg84))))
            begin
              reg116 <= reg101[(4'ha):(3'h6)];
              reg117 <= reg97[(5'h11):(3'h4)];
              reg118 <= reg85;
            end
          else
            begin
              reg116 <= ($signed((+$signed($unsigned(reg115)))) <= reg109);
              reg117 <= (~^(-reg114));
              reg118 <= {$signed($signed($signed($signed(reg113))))};
            end
        end
      else
        begin
          reg109 <= (($signed(((reg104 >= wire28) >>> $unsigned(reg99))) || (7'h42)) ^~ $signed($signed((+(reg115 <= (8'h9e))))));
          if (reg97[(3'h4):(1'h0)])
            begin
              reg110 <= (wire30 ^ {(~|((reg111 && (8'h9c)) ?
                      (wire32 == reg109) : reg86)),
                  (8'hb1)});
            end
          else
            begin
              reg110 <= (reg84 ?
                  $unsigned(($unsigned($signed(reg95)) ?
                      wire32[(3'h6):(3'h5)] : reg95[(3'h5):(1'h0)])) : $unsigned($signed({(reg85 ?
                          reg91 : reg117),
                      $unsigned(reg115)})));
            end
        end
    end
  assign wire119 = reg94[(3'h5):(2'h2)];
  assign wire120 = ((+(reg95[(1'h0):(1'h0)] * reg100[(2'h3):(2'h3)])) << ($unsigned(reg98) != reg100[(1'h1):(1'h1)]));
  assign wire121 = (!reg105[(4'h9):(1'h0)]);
  assign wire122 = {$signed(reg118[(3'h6):(3'h6)])};
  assign wire123 = (8'hae);
  assign wire124 = $signed(reg85[(4'hd):(2'h2)]);
  assign wire125 = ((8'ha8) >>> $unsigned(($unsigned({wire30, reg103}) ?
                       wire32 : reg114)));
  assign wire126 = wire124[(2'h3):(1'h0)];
  module127 #() modinst138 (.wire130(wire119), .wire131(reg112), .wire129(reg116), .wire128(reg91), .clk(clk), .y(wire137));
  assign wire139 = (wire32 ?
                       $signed($unsigned({(wire30 ? wire123 : reg105),
                           (7'h43)})) : {({wire34} ?
                               ($unsigned(reg114) ?
                                   $unsigned(reg112) : (+reg88)) : $unsigned(reg108))});
  assign wire140 = ($unsigned((~wire139)) ?
                       reg101[(2'h2):(1'h1)] : reg117[(1'h0):(1'h0)]);
  module141 #() modinst166 (.clk(clk), .y(wire165), .wire145(reg100), .wire144(reg89), .wire146(reg84), .wire143(wire122), .wire142(wire82));
  module167 #() modinst188 (.wire168(reg114), .y(wire187), .wire171(wire121), .wire169(reg111), .wire170(wire139), .clk(clk));
  assign wire189 = (!$unsigned($signed({(reg90 || reg100)})));
  always
    @(posedge clk) begin
      reg190 <= (~^(~^wire31));
      reg191 <= $unsigned((^~wire34));
      reg192 <= $unsigned(($unsigned((~|(!(8'hbe)))) ~^ wire139));
    end
  assign wire193 = $unsigned((-($unsigned((reg114 & wire34)) ?
                       reg99[(2'h2):(1'h1)] : (reg91 - (reg192 > reg87)))));
  module194 #() modinst234 (.y(wire233), .wire195(reg190), .wire197(reg85), .clk(clk), .wire196(reg108), .wire198(reg116));
endmodule

module module194  (y, clk, wire198, wire197, wire196, wire195);
  output wire [(32'h1aa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire198;
  input wire signed [(5'h12):(1'h0)] wire197;
  input wire [(3'h6):(1'h0)] wire196;
  input wire [(4'he):(1'h0)] wire195;
  wire signed [(4'he):(1'h0)] wire232;
  wire [(5'h12):(1'h0)] wire231;
  wire signed [(4'hb):(1'h0)] wire215;
  wire [(4'he):(1'h0)] wire214;
  wire [(5'h14):(1'h0)] wire213;
  wire [(4'hc):(1'h0)] wire212;
  wire [(3'h4):(1'h0)] wire211;
  wire signed [(4'hd):(1'h0)] wire210;
  wire signed [(5'h15):(1'h0)] wire209;
  wire [(4'hd):(1'h0)] wire203;
  wire signed [(5'h14):(1'h0)] wire202;
  wire signed [(5'h12):(1'h0)] wire201;
  wire signed [(4'h9):(1'h0)] wire200;
  wire signed [(4'he):(1'h0)] wire199;
  reg [(5'h11):(1'h0)] reg230 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg229 = (1'h0);
  reg [(3'h6):(1'h0)] reg228 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg227 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg226 = (1'h0);
  reg [(2'h3):(1'h0)] reg225 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg224 = (1'h0);
  reg [(4'hf):(1'h0)] reg223 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg222 = (1'h0);
  reg [(5'h11):(1'h0)] reg221 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg220 = (1'h0);
  reg [(4'hb):(1'h0)] reg219 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg218 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg217 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg216 = (1'h0);
  reg [(3'h5):(1'h0)] reg208 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg207 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg206 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg205 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg204 = (1'h0);
  assign y = {wire232,
                 wire231,
                 wire215,
                 wire214,
                 wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 (1'h0)};
  assign wire199 = $signed(wire198[(4'hf):(3'h4)]);
  assign wire200 = ($signed($signed($signed(wire197))) >>> $unsigned(wire199[(2'h2):(1'h0)]));
  assign wire201 = ($unsigned(wire196) - $unsigned({$unsigned(((8'hbe) ^ wire197)),
                       $unsigned(wire200[(4'h9):(2'h3)])}));
  assign wire202 = (wire199 ? (^wire200[(2'h3):(1'h0)]) : $signed(wire201));
  assign wire203 = wire199[(4'h8):(3'h6)];
  always
    @(posedge clk) begin
      reg204 <= $unsigned((($unsigned((~&wire199)) ?
              (wire201 ? {wire202} : $unsigned((8'hb1))) : ((wire200 ?
                  wire199 : wire198) | wire203[(4'h8):(2'h2)])) ?
          wire201 : wire195));
      reg205 <= $signed(wire197[(4'h9):(4'h9)]);
    end
  always
    @(posedge clk) begin
      reg206 <= (~((~&(wire199[(4'h8):(1'h0)] || (wire199 >> reg205))) * (~^wire201[(3'h4):(1'h1)])));
      reg207 <= ((({wire203, reg206} ?
                  ({wire200} ^ wire198) : (+$signed(wire196))) ?
              wire200 : reg206) ?
          wire203 : (reg206[(4'h8):(3'h6)] ?
              ($unsigned(reg204) - $unsigned((wire200 << wire195))) : reg206));
      reg208 <= $unsigned($signed(wire203));
    end
  assign wire209 = (~&{((~|{wire198, wire195}) ?
                           reg204 : {(+reg205), (reg208 & wire199)})});
  assign wire210 = $signed(($signed($unsigned(((8'h9f) ? reg205 : wire196))) ?
                       $signed((wire197[(5'h12):(5'h11)] ?
                           $signed(reg207) : (reg208 <= wire201))) : reg207));
  assign wire211 = $unsigned($unsigned(wire198));
  assign wire212 = (((((~&wire197) > wire210[(4'hd):(3'h7)]) ?
                       reg205 : (^~(wire201 >= wire202))) == $signed(wire196[(3'h4):(1'h0)])) ^~ ($signed(wire202) ?
                       {wire195[(1'h1):(1'h1)],
                           (~|$unsigned(wire209))} : $signed((wire211[(1'h1):(1'h1)] ^ reg206[(3'h7):(1'h1)]))));
  assign wire213 = (({wire196, $unsigned($signed(wire200))} ?
                       ($unsigned($unsigned(wire196)) & $unsigned((^wire202))) : {((reg208 ?
                               wire210 : wire203) <<< $signed(wire195))}) >>> wire199[(1'h1):(1'h0)]);
  assign wire214 = wire213[(5'h12):(4'he)];
  assign wire215 = (wire197 ?
                       $unsigned({$signed((^~wire203))}) : $signed((wire198 - (^~(~|wire201)))));
  always
    @(posedge clk) begin
      reg216 <= ($unsigned((~|((wire203 ? (8'ha3) : reg208) ?
          (|(8'ha2)) : $unsigned(wire199)))) < reg204);
      reg217 <= reg206;
      if ({$signed($signed((wire198[(4'ha):(3'h5)] & wire197)))})
        begin
          reg218 <= wire203[(3'h7):(2'h3)];
          if ((reg205[(3'h5):(3'h4)] * wire197))
            begin
              reg219 <= reg204;
              reg220 <= $unsigned(($signed($signed(((8'ha4) >>> wire197))) | wire210));
            end
          else
            begin
              reg219 <= wire210[(3'h6):(3'h6)];
              reg220 <= $signed($signed(reg217[(2'h2):(1'h0)]));
              reg221 <= ((+(~&$signed((~|(8'hb3))))) ?
                  $signed(((((8'ha7) ?
                      wire211 : reg206) ^ (&reg205)) >= (((8'hb7) || wire199) ?
                      wire212 : (+reg219)))) : (~|$signed(((reg207 ?
                      wire199 : wire199) & wire214[(4'h9):(3'h4)]))));
              reg222 <= wire195;
              reg223 <= {$unsigned((((~&(8'ha2)) ^~ (+reg221)) ?
                      {(wire214 ? wire200 : wire195)} : $unsigned((+reg222)))),
                  $unsigned((~|{$unsigned(wire210), $signed((8'hb4))}))};
            end
          reg224 <= $unsigned(reg206);
        end
      else
        begin
          reg218 <= ($unsigned(wire199[(3'h6):(2'h3)]) ?
              $unsigned($unsigned((^reg204))) : (|((8'ha5) ?
                  wire196 : reg224[(1'h0):(1'h0)])));
        end
      if ($signed($signed(reg205)))
        begin
          reg225 <= reg207[(3'h5):(2'h2)];
          reg226 <= wire195;
          reg227 <= $unsigned($unsigned(reg216[(4'he):(4'he)]));
          reg228 <= {(wire212[(3'h5):(2'h3)] != wire209[(5'h12):(5'h12)])};
          reg229 <= $unsigned(reg225);
        end
      else
        begin
          reg225 <= $signed((reg204 ?
              reg222[(3'h6):(3'h4)] : wire210[(4'hb):(3'h7)]));
          if (reg220)
            begin
              reg226 <= $signed($unsigned((8'hbe)));
              reg227 <= $signed(reg221[(2'h3):(1'h1)]);
              reg228 <= $unsigned($unsigned(({$signed(wire212),
                      $unsigned(reg225)} ?
                  reg219 : $unsigned((reg206 ? reg217 : reg224)))));
              reg229 <= (($signed($signed(reg228[(2'h2):(2'h2)])) ?
                      $unsigned(wire202) : ($signed($signed(wire211)) ?
                          reg225[(1'h1):(1'h0)] : $unsigned(reg221))) ?
                  ({(&reg220)} << $unsigned($unsigned((^wire213)))) : wire196);
            end
          else
            begin
              reg226 <= wire209[(4'hd):(4'hb)];
            end
          reg230 <= reg204;
        end
    end
  assign wire231 = ({$unsigned((reg230 >>> (reg218 ?
                           (8'h9e) : reg206)))} <= {{wire212[(3'h5):(3'h5)],
                           $signed((reg223 <= wire201))}});
  assign wire232 = (($signed($signed(((8'ha1) && wire196))) ?
                       reg208 : (({wire211} << reg228[(2'h3):(2'h2)]) ?
                           (8'h9e) : reg228[(2'h2):(2'h2)])) && ((^reg222) * wire198));
endmodule

module module167  (y, clk, wire171, wire170, wire169, wire168);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire171;
  input wire [(5'h11):(1'h0)] wire170;
  input wire signed [(4'he):(1'h0)] wire169;
  input wire signed [(2'h3):(1'h0)] wire168;
  wire [(4'h9):(1'h0)] wire177;
  wire signed [(4'ha):(1'h0)] wire176;
  wire [(4'he):(1'h0)] wire175;
  wire [(4'he):(1'h0)] wire174;
  wire [(3'h7):(1'h0)] wire173;
  wire [(4'hb):(1'h0)] wire172;
  reg signed [(5'h10):(1'h0)] reg186 = (1'h0);
  reg [(4'ha):(1'h0)] reg185 = (1'h0);
  reg [(5'h13):(1'h0)] reg184 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg181 = (1'h0);
  reg [(3'h5):(1'h0)] reg180 = (1'h0);
  reg [(5'h11):(1'h0)] reg179 = (1'h0);
  reg [(4'hb):(1'h0)] reg178 = (1'h0);
  assign y = {wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 (1'h0)};
  assign wire172 = $unsigned({$unsigned({(8'haa), wire169[(2'h2):(1'h0)]})});
  assign wire173 = wire172[(3'h4):(2'h3)];
  assign wire174 = (|((~&$signed((~&wire168))) ?
                       (wire173[(3'h6):(3'h5)] ?
                           {(wire169 ~^ wire170),
                               {wire171,
                                   wire168}} : wire170[(4'hd):(3'h7)]) : wire171));
  assign wire175 = (($signed(($unsigned(wire169) ?
                           $signed(wire169) : (wire172 + (8'ha0)))) > wire174[(3'h6):(3'h5)]) ?
                       $unsigned({($unsigned(wire174) | wire171)}) : wire172[(1'h0):(1'h0)]);
  assign wire176 = $unsigned((($signed(wire172) || (|{wire172})) + (wire168 >= wire175)));
  assign wire177 = $signed((+{wire170}));
  always
    @(posedge clk) begin
      if (wire175)
        begin
          reg178 <= wire171;
          if ((~(wire171[(4'h9):(1'h0)] & {$unsigned(wire175)})))
            begin
              reg179 <= wire174;
              reg180 <= (wire168 ?
                  ((~^$unsigned((wire177 <<< wire173))) < {(~^wire170[(3'h4):(3'h4)]),
                      wire170[(3'h4):(1'h0)]}) : $unsigned(wire177));
            end
          else
            begin
              reg179 <= $unsigned(wire172);
            end
          reg181 <= (((8'ha8) | wire175[(2'h2):(1'h1)]) ^ {(wire171 != $signed((wire169 & wire176))),
              (wire168 ?
                  ($unsigned(wire176) ?
                      (wire176 ? reg178 : reg179) : wire170) : {{wire177}})});
          reg182 <= {wire172[(2'h2):(1'h0)]};
          reg183 <= $unsigned(wire170);
        end
      else
        begin
          reg178 <= $unsigned(((8'ha2) ?
              $signed(wire176) : reg181[(5'h13):(4'h9)]));
          reg179 <= $unsigned(wire173);
          reg180 <= ((^($signed((+reg180)) ?
              wire174[(4'ha):(1'h1)] : ({reg182, wire173} ?
                  (+reg181) : $unsigned(wire175)))) == (^(+(wire172[(3'h7):(2'h2)] ?
              {wire171} : wire175[(4'h9):(1'h0)]))));
          reg181 <= wire175[(4'ha):(4'h9)];
          if ($signed((($signed((wire174 ^~ (8'hb6))) ?
              $signed(reg178[(3'h4):(1'h0)]) : {(+reg180),
                  {wire170, wire174}}) & reg183)))
            begin
              reg182 <= wire171;
              reg183 <= ((($unsigned($unsigned(wire171)) ?
                      ($signed(wire174) ?
                          wire177 : $unsigned(wire177)) : (~^(reg183 ?
                          wire173 : (8'hae)))) >= $signed($unsigned(wire170))) ?
                  (((~(wire168 ? wire171 : wire173)) ?
                      $unsigned(wire172) : $signed(wire173[(3'h5):(1'h0)])) + wire168[(2'h3):(2'h2)]) : ((reg180[(2'h3):(1'h0)] - $signed((wire173 ?
                          wire172 : reg182))) ?
                      ($unsigned((reg180 - wire175)) <<< wire172[(4'h9):(3'h5)]) : $unsigned((~&(wire176 << wire176)))));
            end
          else
            begin
              reg182 <= $signed(wire168[(2'h2):(1'h1)]);
              reg183 <= $unsigned((8'ha5));
              reg184 <= $unsigned($unsigned($signed(($signed((8'haa)) ^~ wire175))));
              reg185 <= $unsigned((-($unsigned(wire177) * wire174)));
              reg186 <= $unsigned(wire172);
            end
        end
    end
endmodule

module module141
#(parameter param163 = ((7'h42) ? (8'hac) : ((^{{(8'ha0)}, {(8'ha0), (8'hba)}}) || ((+((8'hbc) + (8'ha5))) + {((8'hac) << (8'h9c))}))), 
parameter param164 = param163)
(y, clk, wire146, wire145, wire144, wire143, wire142);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire146;
  input wire [(5'h13):(1'h0)] wire145;
  input wire [(4'he):(1'h0)] wire144;
  input wire [(4'hd):(1'h0)] wire143;
  input wire signed [(4'hc):(1'h0)] wire142;
  wire signed [(5'h13):(1'h0)] wire162;
  wire [(5'h13):(1'h0)] wire161;
  wire signed [(5'h14):(1'h0)] wire160;
  wire signed [(5'h11):(1'h0)] wire159;
  wire [(3'h5):(1'h0)] wire148;
  wire [(3'h7):(1'h0)] wire147;
  reg signed [(3'h7):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg157 = (1'h0);
  reg [(4'hd):(1'h0)] reg156 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg155 = (1'h0);
  reg [(5'h11):(1'h0)] reg154 = (1'h0);
  reg [(3'h6):(1'h0)] reg153 = (1'h0);
  reg [(2'h2):(1'h0)] reg152 = (1'h0);
  reg [(2'h3):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg150 = (1'h0);
  reg [(5'h14):(1'h0)] reg149 = (1'h0);
  assign y = {wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire148,
                 wire147,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 (1'h0)};
  assign wire147 = $unsigned((8'hb0));
  assign wire148 = $signed($signed((((wire142 ? wire143 : wire144) ?
                       wire144 : wire144) > (!wire143[(1'h1):(1'h0)]))));
  always
    @(posedge clk) begin
      if (wire148[(1'h1):(1'h1)])
        begin
          if ($signed((-$signed($signed((^wire148))))))
            begin
              reg149 <= (~$signed({wire146[(3'h5):(1'h0)]}));
            end
          else
            begin
              reg149 <= wire147[(3'h5):(1'h1)];
              reg150 <= $unsigned({(wire142 ?
                      wire143 : ($unsigned(wire144) ^ ((8'hbe) ?
                          wire146 : (8'had)))),
                  reg149});
              reg151 <= {(((~((8'h9d) << wire143)) && ($unsigned((8'h9f)) || (~reg150))) ~^ $signed((8'ha7))),
                  ((((&wire142) >> (wire143 ?
                          wire144 : (8'hb8))) << $unsigned({reg149, wire146})) ?
                      $signed((~&$signed(wire143))) : wire142)};
            end
          reg152 <= (7'h40);
          reg153 <= $signed(wire147);
        end
      else
        begin
          reg149 <= {((|$signed((reg149 > reg153))) ?
                  $signed(wire144[(3'h5):(2'h2)]) : reg153),
              $unsigned($unsigned(((wire144 ~^ (8'h9f)) ?
                  reg149[(5'h13):(4'hb)] : $signed(reg149))))};
          if (((!wire143[(4'ha):(3'h4)]) ?
              (~(~(~&$unsigned(wire148)))) : wire144))
            begin
              reg150 <= $signed((+(($unsigned(reg153) ?
                  (wire143 ?
                      wire145 : reg153) : $unsigned((8'hbe))) == {$unsigned(reg151)})));
              reg151 <= (&wire147[(3'h4):(3'h4)]);
              reg152 <= (-reg150);
              reg153 <= wire142[(3'h7):(3'h5)];
              reg154 <= (8'had);
            end
          else
            begin
              reg150 <= (wire144 ?
                  reg154[(2'h3):(2'h3)] : $signed(((wire146[(4'h8):(3'h7)] | (~|reg153)) - wire144)));
              reg151 <= reg152;
              reg152 <= ($unsigned(({(-reg150),
                  (wire147 ?
                      wire148 : wire145)} > reg154)) <= (~wire142[(4'hb):(2'h2)]));
              reg153 <= (^~$signed(($unsigned($unsigned(wire147)) ?
                  (-(&wire148)) : wire142)));
              reg154 <= wire143;
            end
          reg155 <= $unsigned({reg150});
          if ($signed($signed($unsigned((&$signed(wire143))))))
            begin
              reg156 <= wire146[(4'ha):(2'h2)];
            end
          else
            begin
              reg156 <= (~reg151);
              reg157 <= (-($unsigned($signed(wire146[(4'h9):(2'h3)])) ?
                  (!$unsigned(reg152[(1'h0):(1'h0)])) : $unsigned($unsigned($unsigned(wire146)))));
            end
          reg158 <= $unsigned((reg152 ?
              reg152[(1'h1):(1'h1)] : ((reg157 ^ reg153[(1'h1):(1'h1)]) ?
                  wire145 : ({wire147} ^~ (reg150 | (8'hb9))))));
        end
    end
  assign wire159 = {$signed(((8'ha5) >> ((~&(8'hb4)) ?
                           reg153[(3'h6):(1'h0)] : (~wire148))))};
  assign wire160 = ($unsigned(reg155[(3'h6):(3'h5)]) ?
                       (~^$signed($signed($signed(wire143)))) : (wire146[(4'hb):(2'h2)] >>> {reg156[(4'hc):(3'h7)]}));
  assign wire161 = (8'hbf);
  assign wire162 = (!reg156);
endmodule

module module127  (y, clk, wire131, wire130, wire129, wire128);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire131;
  input wire signed [(5'h13):(1'h0)] wire130;
  input wire signed [(2'h3):(1'h0)] wire129;
  input wire [(4'h9):(1'h0)] wire128;
  wire [(4'hf):(1'h0)] wire136;
  wire signed [(5'h14):(1'h0)] wire135;
  wire [(4'h9):(1'h0)] wire134;
  wire [(5'h15):(1'h0)] wire133;
  wire [(5'h11):(1'h0)] wire132;
  assign y = {wire136, wire135, wire134, wire133, wire132, (1'h0)};
  assign wire132 = $signed(wire129[(2'h2):(1'h0)]);
  assign wire133 = wire129[(2'h2):(1'h1)];
  assign wire134 = wire132[(3'h5):(2'h3)];
  assign wire135 = (wire133 ?
                       wire134[(3'h4):(3'h4)] : (((-$signed(wire131)) ?
                               (~^wire132[(4'hd):(4'hc)]) : wire134) ?
                           (-($signed(wire129) ?
                               wire129[(2'h2):(1'h0)] : (wire130 ?
                                   wire128 : wire134))) : ((8'hb5) || $unsigned((wire134 < wire128)))));
  assign wire136 = $signed(wire135[(4'h8):(1'h1)]);
endmodule

module module35
#(parameter param81 = ((((~^((8'ha6) ? (8'hb4) : (8'hb6))) >>> (((8'hbe) == (8'hae)) || ((8'hb9) | (8'ha0)))) ? (8'hb4) : ({((8'ha2) <<< (8'ha0))} <<< ((!(8'ha0)) >= (+(8'had))))) < {((^((8'hb2) && (7'h41))) ? (((7'h42) ? (8'h9f) : (8'hb1)) ? ((8'ha1) ? (8'h9f) : (8'h9d)) : (|(7'h41))) : (((8'hba) >>> (8'had)) ? {(8'h9f), (8'hb9)} : ((8'hbe) + (8'hb8))))}))
(y, clk, wire39, wire38, wire37, wire36);
  output wire [(32'h1f8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire39;
  input wire signed [(4'hf):(1'h0)] wire38;
  input wire [(4'h9):(1'h0)] wire37;
  input wire signed [(3'h6):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire79;
  wire [(4'h8):(1'h0)] wire72;
  wire [(4'h9):(1'h0)] wire71;
  wire [(5'h14):(1'h0)] wire53;
  wire signed [(5'h12):(1'h0)] wire52;
  wire [(5'h13):(1'h0)] wire51;
  wire [(4'hf):(1'h0)] wire50;
  wire signed [(5'h11):(1'h0)] wire49;
  wire [(5'h13):(1'h0)] wire48;
  wire [(3'h6):(1'h0)] wire47;
  wire signed [(3'h7):(1'h0)] wire46;
  wire [(4'hf):(1'h0)] wire45;
  wire [(5'h14):(1'h0)] wire44;
  wire [(4'he):(1'h0)] wire43;
  wire [(4'h9):(1'h0)] wire42;
  wire signed [(4'h8):(1'h0)] wire41;
  wire [(3'h4):(1'h0)] wire40;
  reg [(4'he):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg77 = (1'h0);
  reg [(5'h10):(1'h0)] reg76 = (1'h0);
  reg [(4'hf):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg74 = (1'h0);
  reg [(4'hf):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg70 = (1'h0);
  reg [(4'hd):(1'h0)] reg69 = (1'h0);
  reg [(4'h8):(1'h0)] reg68 = (1'h0);
  reg [(4'hf):(1'h0)] reg67 = (1'h0);
  reg [(4'he):(1'h0)] reg66 = (1'h0);
  reg [(3'h7):(1'h0)] reg65 = (1'h0);
  reg [(4'hd):(1'h0)] reg64 = (1'h0);
  reg [(2'h3):(1'h0)] reg63 = (1'h0);
  reg [(3'h7):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg61 = (1'h0);
  reg [(4'hd):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg59 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg56 = (1'h0);
  reg [(4'ha):(1'h0)] reg55 = (1'h0);
  reg [(4'hd):(1'h0)] reg54 = (1'h0);
  assign y = {wire79,
                 wire72,
                 wire71,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 reg80,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
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
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 (1'h0)};
  assign wire40 = wire37[(4'h8):(3'h6)];
  assign wire41 = (wire37[(1'h1):(1'h0)] ? wire38[(3'h6):(2'h3)] : (|wire37));
  assign wire42 = wire36[(2'h2):(1'h1)];
  assign wire43 = (|(&$signed(((wire41 & wire41) ?
                      (~^wire36) : (wire39 == wire41)))));
  assign wire44 = wire42;
  assign wire45 = $signed($unsigned(wire44[(5'h11):(3'h7)]));
  assign wire46 = wire45[(3'h6):(3'h5)];
  assign wire47 = $unsigned($unsigned(({wire43} ?
                      ($unsigned((8'h9d)) ?
                          wire44[(4'h8):(1'h1)] : wire36) : wire36)));
  assign wire48 = (wire44[(5'h14):(2'h2)] >> $signed((~$unsigned((~|wire40)))));
  assign wire49 = wire39;
  assign wire50 = $unsigned(wire36);
  assign wire51 = {($signed($unsigned(wire38[(4'hf):(1'h1)])) ?
                          (((8'ha5) >= wire48) ?
                              (wire43[(4'he):(4'h9)] ?
                                  (wire37 ?
                                      wire37 : wire42) : $unsigned(wire45)) : (!$unsigned(wire36))) : wire45[(3'h4):(3'h4)]),
                      (wire42[(2'h2):(1'h0)] & wire37[(2'h3):(1'h1)])};
  assign wire52 = wire39;
  assign wire53 = wire44;
  always
    @(posedge clk) begin
      reg54 <= (wire41 ? $signed((8'hb5)) : $signed(wire40));
      reg55 <= (^~($signed(((wire51 ? wire51 : wire40) ?
              (-wire36) : (wire37 || reg54))) ?
          {$signed($unsigned((8'ha1))), {$unsigned(wire42)}} : wire41));
      if ((^(wire49 ? wire36[(3'h6):(3'h6)] : {wire49})))
        begin
          if (wire39)
            begin
              reg56 <= ((($unsigned(wire38[(1'h1):(1'h0)]) ?
                          ((|reg55) ^ (wire44 ? wire49 : wire52)) : ({(7'h40)} ?
                              wire43[(4'ha):(1'h0)] : $unsigned(wire48))) ?
                      (($unsigned((8'hba)) ^ wire41) ?
                          $unsigned($signed((8'ha7))) : wire40) : ($signed(wire44) > wire48[(1'h1):(1'h1)])) ?
                  $signed(wire40[(1'h1):(1'h0)]) : wire39[(3'h7):(2'h3)]);
            end
          else
            begin
              reg56 <= ($unsigned($signed($unsigned((+wire53)))) ?
                  (((8'hbe) ? $unsigned(wire47) : wire41[(2'h3):(2'h2)]) ?
                      wire52[(4'hf):(2'h2)] : wire53[(3'h5):(3'h4)]) : (!$unsigned(wire44)));
              reg57 <= reg54;
              reg58 <= wire53[(5'h12):(4'hd)];
            end
        end
      else
        begin
          reg56 <= wire51;
          if (wire48[(4'h9):(3'h5)])
            begin
              reg57 <= wire52[(3'h5):(1'h0)];
              reg58 <= wire36[(1'h0):(1'h0)];
              reg59 <= ({$unsigned((!(^~wire41))), $unsigned(wire39)} ?
                  $unsigned(wire38[(1'h1):(1'h0)]) : $signed((($unsigned(wire53) >>> wire39[(3'h6):(2'h2)]) + wire44[(4'hb):(3'h4)])));
              reg60 <= reg58;
              reg61 <= $signed(((!$signed(((8'hbc) ?
                  wire42 : wire44))) | $unsigned(reg55[(1'h0):(1'h0)])));
            end
          else
            begin
              reg57 <= $unsigned(($unsigned((wire41 ?
                  {(8'hbd), wire42} : ((8'ha3) ? reg56 : wire44))) >= wire46));
              reg58 <= $unsigned($signed($unsigned((wire50 <<< $unsigned(wire47)))));
              reg59 <= ($signed((wire36 ?
                      {reg60[(3'h6):(3'h5)]} : {(wire44 <<< wire48)})) ?
                  $unsigned((~&wire41)) : $signed(((~^reg60[(1'h1):(1'h0)]) ?
                      {$unsigned(wire46)} : {(+wire44)})));
            end
        end
      if (wire50[(2'h3):(1'h1)])
        begin
          reg62 <= wire36[(1'h1):(1'h0)];
          reg63 <= $signed((reg61[(2'h2):(1'h1)] - reg57[(1'h1):(1'h1)]));
        end
      else
        begin
          if ($signed($unsigned(reg63)))
            begin
              reg62 <= {$unsigned((|{$unsigned(reg62), wire44})),
                  $signed($signed((wire52[(1'h0):(1'h0)] ?
                      wire42 : $signed(wire50))))};
              reg63 <= (8'ha3);
              reg64 <= wire53;
              reg65 <= reg58;
            end
          else
            begin
              reg62 <= $unsigned(wire47[(3'h5):(2'h2)]);
              reg63 <= (&$unsigned((wire40 >>> wire43[(4'h8):(1'h0)])));
              reg64 <= $signed(wire38);
              reg65 <= (reg65 ?
                  $unsigned((|$unsigned((wire45 && wire40)))) : {wire50,
                      (&wire37)});
              reg66 <= wire50[(4'hd):(2'h3)];
            end
          reg67 <= $unsigned(($signed((~&$signed(reg66))) ?
              reg54 : {((wire48 == wire36) ?
                      (wire48 < reg63) : (reg54 > wire40)),
                  wire49}));
          reg68 <= $signed(wire47[(3'h6):(3'h5)]);
          reg69 <= (~^(8'ha1));
        end
      reg70 <= {((8'hbb) - {$signed((wire37 != reg56))}),
          (reg55 ? {$unsigned($signed((8'hb8))), reg65} : wire41)};
    end
  assign wire71 = ($unsigned($unsigned($unsigned((-(8'ha1))))) < (~&$signed($signed((~&wire50)))));
  assign wire72 = $unsigned($unsigned($signed((8'haa))));
  always
    @(posedge clk) begin
      reg73 <= ((7'h40) <<< wire40[(1'h0):(1'h0)]);
      reg74 <= $unsigned(wire52[(3'h6):(3'h6)]);
      if ((^(wire51 ?
          (((reg65 ? reg65 : wire41) ?
              $signed(reg59) : (wire40 ?
                  wire40 : wire51)) ^ reg66[(4'h9):(2'h3)]) : $unsigned(($signed(reg60) || wire38)))))
        begin
          reg75 <= $signed((($unsigned(reg73) - (~&$unsigned(reg55))) ?
              wire43 : $signed(reg73[(3'h6):(1'h0)])));
        end
      else
        begin
          reg75 <= $unsigned((wire71 ^ $signed(wire45)));
          reg76 <= {{wire37, wire44[(4'hf):(4'hd)]}};
          reg77 <= wire46;
        end
      reg78 <= (reg73 ?
          reg76 : ((&$signed(reg75[(4'ha):(1'h0)])) <= (~$unsigned(reg56))));
    end
  assign wire79 = ($unsigned(wire49[(4'h8):(1'h0)]) && (reg78 | (8'h9c)));
  always
    @(posedge clk) begin
      reg80 <= reg65;
    end
endmodule
