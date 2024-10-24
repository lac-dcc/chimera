module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h21c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire4;
  wire [(4'hb):(1'h0)] wire130;
  wire [(3'h6):(1'h0)] wire129;
  wire signed [(4'hd):(1'h0)] wire128;
  wire signed [(4'hd):(1'h0)] wire127;
  wire signed [(4'h8):(1'h0)] wire126;
  wire signed [(5'h13):(1'h0)] wire125;
  wire signed [(4'hf):(1'h0)] wire124;
  wire [(3'h7):(1'h0)] wire123;
  wire signed [(3'h4):(1'h0)] wire122;
  wire signed [(4'h9):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire92;
  reg signed [(3'h7):(1'h0)] reg121 = (1'h0);
  reg [(4'hc):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg119 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg116 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg115 = (1'h0);
  reg [(5'h11):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg113 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg109 = (1'h0);
  reg [(5'h12):(1'h0)] reg108 = (1'h0);
  reg [(5'h11):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg106 = (1'h0);
  reg [(4'hf):(1'h0)] reg105 = (1'h0);
  reg [(5'h12):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg103 = (1'h0);
  reg [(2'h2):(1'h0)] reg102 = (1'h0);
  reg [(2'h3):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg100 = (1'h0);
  reg [(4'hb):(1'h0)] reg99 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg98 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg97 = (1'h0);
  reg signed [(4'he):(1'h0)] reg96 = (1'h0);
  reg [(4'hc):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg94 = (1'h0);
  reg [(2'h2):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  assign y = {wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire5,
                 wire9,
                 wire10,
                 wire11,
                 wire92,
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
                 reg6,
                 reg7,
                 reg8,
                 (1'h0)};
  assign wire5 = wire1;
  always
    @(posedge clk) begin
      reg6 <= wire1;
      reg7 <= {$unsigned(((~|{wire0}) >> wire4)), wire3[(1'h0):(1'h0)]};
      reg8 <= $unsigned({((wire5[(1'h0):(1'h0)] ?
              (wire4 ~^ wire0) : wire1[(3'h4):(1'h0)]) == $signed((wire3 | wire1))),
          $unsigned((!$unsigned(reg6)))});
    end
  assign wire9 = ((((&wire2) + wire0[(3'h7):(2'h3)]) != (~|((~&reg7) ?
                         wire3[(4'hf):(4'hb)] : {reg7, wire0}))) ?
                     (wire4[(4'h9):(3'h5)] ?
                         reg8 : ($signed(reg8) ?
                             wire2 : wire1[(1'h1):(1'h1)])) : $signed(wire1[(1'h1):(1'h1)]));
  assign wire10 = reg8;
  assign wire11 = (!((8'hb0) <<< (wire10[(3'h7):(1'h0)] ?
                      $unsigned(wire0) : (wire10 ? wire1 : (reg6 & (8'h9e))))));
  module12 #() modinst93 (.wire14(wire9), .y(wire92), .wire16(wire0), .clk(clk), .wire15(reg8), .wire13(wire3));
  always
    @(posedge clk) begin
      reg94 <= wire2[(2'h3):(2'h2)];
      if (reg6[(1'h1):(1'h0)])
        begin
          reg95 <= (wire3 ? wire5[(3'h5):(1'h1)] : wire11);
          reg96 <= $signed(wire0[(1'h1):(1'h0)]);
          if ((~$signed($signed($signed(reg95[(4'hc):(1'h0)])))))
            begin
              reg97 <= wire3[(4'hd):(3'h6)];
              reg98 <= wire9[(5'h13):(4'hf)];
              reg99 <= (8'ha2);
              reg100 <= reg96[(4'hb):(1'h0)];
              reg101 <= $unsigned({$signed($unsigned((+wire4)))});
            end
          else
            begin
              reg97 <= {reg97[(2'h2):(1'h0)]};
            end
        end
      else
        begin
          reg95 <= (~^((&$unsigned((wire2 ^~ wire11))) * ($signed((8'hb2)) * ((7'h42) ?
              {reg100, wire11} : (reg98 ~^ reg96)))));
          if (wire92)
            begin
              reg96 <= ((~^$unsigned(wire9)) && $signed($signed(wire92[(3'h7):(3'h5)])));
              reg97 <= $signed($unsigned($unsigned($unsigned((wire2 ^~ (8'hb9))))));
              reg98 <= (~$unsigned((((~wire2) ~^ (reg100 || wire4)) ?
                  {(reg95 ? (8'h9d) : wire1), (reg95 <= wire3)} : {(^reg6),
                      (reg8 ? wire9 : reg96)})));
              reg99 <= $unsigned((({$unsigned(reg94)} >> {reg7[(3'h5):(2'h3)],
                      $unsigned(wire4)}) ?
                  $unsigned($signed({wire1,
                      reg96})) : $signed($signed((wire4 ~^ wire92)))));
              reg100 <= $unsigned(reg96[(4'ha):(3'h4)]);
            end
          else
            begin
              reg96 <= $signed(reg8[(1'h0):(1'h0)]);
              reg97 <= (!($unsigned((!{wire0,
                  reg95})) * ($signed(reg7[(3'h6):(3'h5)]) ?
                  $signed((8'h9f)) : $unsigned(((8'ha6) ^~ wire1)))));
            end
          if ((8'haa))
            begin
              reg101 <= wire0;
              reg102 <= (wire92[(4'h8):(4'h8)] != $unsigned($signed(reg99)));
              reg103 <= $unsigned((^{$signed(reg98[(4'h9):(1'h0)]),
                  $unsigned($unsigned(reg96))}));
              reg104 <= reg94;
            end
          else
            begin
              reg101 <= {$signed($unsigned(reg95[(1'h1):(1'h0)])),
                  $unsigned({(reg97 ? reg96[(3'h6):(3'h6)] : reg6), wire2})};
              reg102 <= wire4;
              reg103 <= $signed((~(((8'ha8) ?
                  reg99[(4'h9):(3'h7)] : (wire3 ?
                      reg98 : (8'hbe))) <= (8'hb6))));
              reg104 <= wire4;
              reg105 <= {$unsigned((((reg96 ? wire11 : wire0) ?
                      {(7'h42), reg97} : reg100) <= ((reg104 >= reg6) << {reg97,
                      (7'h40)})))};
            end
          reg106 <= $signed((|wire2[(1'h1):(1'h1)]));
        end
      reg107 <= reg106[(2'h3):(2'h3)];
      if ({$unsigned((((-wire92) >= $unsigned((7'h41))) > ({reg103, reg94} ?
              $signed(wire10) : reg96[(4'h8):(4'h8)]))),
          (8'hbd)})
        begin
          reg108 <= ((+$unsigned(($signed(reg101) != $signed((8'hb5))))) ?
              reg7[(3'h4):(2'h2)] : (~^$unsigned(({wire2} == (reg100 ?
                  wire92 : reg95)))));
          reg109 <= $signed(wire92[(4'hc):(4'hb)]);
          reg110 <= reg105;
        end
      else
        begin
          reg108 <= wire92[(3'h6):(1'h1)];
          if ($signed((&$signed($signed(wire0[(4'h9):(4'h8)])))))
            begin
              reg109 <= $unsigned($unsigned(reg94));
              reg110 <= reg107;
              reg111 <= ((reg106 ~^ (|wire92[(4'ha):(1'h1)])) >= $unsigned($signed((~&$signed(reg104)))));
              reg112 <= reg101;
            end
          else
            begin
              reg109 <= ({(^~((reg101 ? reg96 : wire9) ? wire4 : {reg107})),
                      $unsigned($unsigned((~^reg112)))} ?
                  ((~&wire4) <<< reg101) : $unsigned(reg99[(1'h1):(1'h0)]));
            end
          reg113 <= reg6;
          reg114 <= $unsigned($signed($unsigned(((reg103 ?
              wire11 : reg98) ^ {reg98, reg7}))));
        end
      if (($unsigned(((~^reg114[(1'h1):(1'h0)]) ?
              reg99[(3'h7):(3'h4)] : ($signed((8'h9d)) ?
                  (wire5 <= reg102) : reg113[(1'h0):(1'h0)]))) ?
          {$signed((^$signed(wire9))),
              (~|$unsigned($signed(reg110)))} : (wire0 ?
              (reg108[(4'h9):(2'h3)] ?
                  ($unsigned(reg100) ^~ (wire10 != reg100)) : wire10[(2'h3):(1'h1)]) : $signed($signed({reg94})))))
        begin
          if ($signed((~((~&$signed(reg6)) ?
              ((+wire92) >>> reg96[(3'h7):(2'h3)]) : wire92))))
            begin
              reg115 <= reg112;
              reg116 <= {reg96[(3'h7):(2'h3)]};
              reg117 <= (((((7'h43) ~^ {reg113}) ~^ (+(~|wire9))) <<< wire11[(2'h3):(1'h0)]) <<< ($unsigned($signed($signed(wire11))) ?
                  ($unsigned(((8'h9f) <<< wire1)) ?
                      $unsigned($signed(reg109)) : (+$unsigned(reg110))) : ((~^(reg109 ?
                      wire2 : reg99)) != (7'h43))));
              reg118 <= (reg96[(1'h0):(1'h0)] << ($signed((~&reg104)) >> (!$unsigned({wire92}))));
            end
          else
            begin
              reg115 <= $unsigned(reg114[(4'hf):(3'h7)]);
              reg116 <= ($unsigned($unsigned(reg95[(3'h4):(1'h0)])) <<< (reg111[(1'h1):(1'h0)] ?
                  (reg98 ?
                      {$unsigned(reg118),
                          (wire11 == (8'hba))} : reg118[(3'h7):(3'h4)]) : (~|reg99[(4'ha):(2'h3)])));
              reg117 <= reg110;
            end
          reg119 <= ({(-{{(8'hb9)}})} >>> $signed(($signed({reg8}) ^ $signed((~reg117)))));
          reg120 <= $signed($unsigned((+{$unsigned(reg7)})));
          reg121 <= $signed(reg109);
        end
      else
        begin
          reg115 <= reg119;
          reg116 <= $signed(($unsigned(({reg118, (8'hb9)} && $unsigned(reg6))) ?
              ($signed($unsigned(reg101)) ?
                  ({reg121} < reg6) : reg107) : $unsigned(reg112[(2'h3):(2'h2)])));
          reg117 <= (($unsigned(($unsigned(reg113) >= {reg113})) >>> (!$signed((!reg95)))) ?
              ($signed((^$unsigned(wire4))) + ((wire3[(2'h2):(1'h0)] ?
                      reg107[(4'hf):(3'h4)] : (reg6 > (8'hb4))) ?
                  ((reg98 || wire2) >>> {reg120,
                      wire10}) : reg107)) : reg97[(2'h2):(1'h0)]);
        end
    end
  assign wire122 = $unsigned(reg106[(2'h2):(1'h1)]);
  assign wire123 = ($signed((wire0 != (~^reg106[(5'h14):(4'hb)]))) | reg116);
  assign wire124 = $unsigned($unsigned(reg101));
  assign wire125 = $signed($signed((|reg104[(3'h7):(3'h7)])));
  assign wire126 = $unsigned(($unsigned(($unsigned(reg96) || ((7'h42) ?
                           reg106 : (8'ha0)))) ?
                       reg108[(3'h7):(1'h1)] : reg110));
  assign wire127 = (($unsigned({$unsigned(reg97),
                       reg114}) ^~ wire11[(4'h8):(3'h4)]) << $unsigned((($unsigned(reg116) < (reg112 || wire4)) ?
                       {(wire5 >> (8'ha6))} : $signed((reg101 + reg96)))));
  assign wire128 = ((8'hbe) < ((!wire10[(4'hf):(4'hd)]) >>> wire1));
  assign wire129 = {$signed({reg7}), (+$unsigned(reg119[(1'h0):(1'h0)]))};
  assign wire130 = ({reg102} ?
                       wire9[(5'h10):(2'h3)] : ($unsigned(($unsigned(reg6) ?
                               (+(7'h40)) : reg119[(4'hc):(1'h0)])) ?
                           (~$unsigned($signed(reg104))) : $unsigned(($unsigned(wire92) << wire11))));
endmodule

module module12
#(parameter param90 = ((((&((8'hb0) > (8'hb1))) ? ({(8'ha9)} ^~ (~|(8'ha0))) : {(|(8'h9d)), (+(8'hbe))}) > (~(-((8'hbf) ? (8'hb7) : (8'hb5))))) ~^ (-(8'hb9))), 
parameter param91 = (-(8'hab)))
(y, clk, wire13, wire14, wire15, wire16);
  output wire [(32'h168):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire13;
  input wire signed [(4'h9):(1'h0)] wire14;
  input wire signed [(3'h5):(1'h0)] wire15;
  input wire signed [(3'h5):(1'h0)] wire16;
  wire signed [(5'h11):(1'h0)] wire80;
  wire [(5'h12):(1'h0)] wire47;
  wire [(5'h14):(1'h0)] wire46;
  wire signed [(4'h8):(1'h0)] wire45;
  wire [(4'ha):(1'h0)] wire44;
  wire signed [(2'h2):(1'h0)] wire43;
  wire [(4'hb):(1'h0)] wire17;
  wire signed [(4'hc):(1'h0)] wire18;
  wire signed [(4'hd):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire20;
  wire [(3'h7):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire27;
  wire [(4'he):(1'h0)] wire28;
  wire signed [(4'ha):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire30;
  wire signed [(2'h2):(1'h0)] wire31;
  wire signed [(3'h7):(1'h0)] wire41;
  reg [(2'h3):(1'h0)] reg89 = (1'h0);
  reg [(5'h11):(1'h0)] reg88 = (1'h0);
  reg [(3'h4):(1'h0)] reg87 = (1'h0);
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg85 = (1'h0);
  reg signed [(4'he):(1'h0)] reg84 = (1'h0);
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg [(5'h14):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  assign y = {wire80,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire41,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire17 = (wire13 << $signed($unsigned({(|wire13)})));
  assign wire18 = $signed(wire16);
  assign wire19 = $unsigned($unsigned((~|$unsigned(wire17))));
  assign wire20 = wire15;
  always
    @(posedge clk) begin
      reg21 <= ((|{wire16}) ?
          (wire18[(2'h3):(2'h2)] ?
              ($signed((wire17 >> wire13)) ?
                  wire17 : $signed($unsigned(wire16))) : (wire14 ?
                  (wire16[(1'h0):(1'h0)] >> wire15) : $signed(wire18))) : ((wire17[(1'h1):(1'h0)] != wire16[(3'h5):(3'h5)]) >= {(~wire19[(4'ha):(2'h3)]),
              wire13[(3'h4):(2'h3)]}));
      reg22 <= wire19;
      reg23 <= ($signed((({wire16,
          reg22} & $signed(wire14)) && wire15[(2'h2):(2'h2)])) - (~|$signed(wire13)));
      reg24 <= (wire17 ?
          {$unsigned({(+reg21)}),
              (~|({reg21} ?
                  wire14 : $unsigned(wire13)))} : (reg22[(4'hf):(1'h0)] ?
              $unsigned(wire13) : {wire14[(1'h0):(1'h0)],
                  $signed($unsigned(reg23))}));
      reg25 <= ({reg24} | ({(((8'ha1) <<< wire14) ? wire20 : (~|reg21)),
          (((8'hae) ? wire19 : reg24) ?
              $unsigned(reg22) : (wire20 ?
                  wire15 : reg23))} - $signed(reg24[(4'h9):(3'h4)])));
    end
  assign wire26 = $signed({reg21});
  assign wire27 = (($unsigned($signed({(8'hb2), (8'hae)})) ?
                          ((reg22 ? (reg23 << reg22) : wire20[(3'h4):(2'h2)]) ?
                              (|(~(8'hb3))) : {(wire18 ? reg24 : wire19),
                                  (reg23 ?
                                      reg24 : (8'hae))}) : wire20[(1'h1):(1'h1)]) ?
                      (~&((&((8'hae) ?
                          wire16 : (8'hbc))) | wire13[(4'ha):(1'h1)])) : (-(((!wire13) ?
                          wire26[(3'h6):(3'h5)] : (wire16 & (7'h41))) < $unsigned((wire26 ^ reg21)))));
  assign wire28 = ((^$unsigned(reg25[(2'h3):(2'h3)])) > reg24);
  assign wire29 = (wire18 ? reg21[(3'h5):(3'h4)] : $signed(reg22));
  assign wire30 = wire18[(3'h4):(2'h2)];
  assign wire31 = {$unsigned($signed(wire14[(2'h2):(1'h1)])),
                      ((&wire30[(4'hc):(1'h0)]) ~^ (^($signed(wire20) ^ $unsigned(reg24))))};
  module32 #() modinst42 (.wire34(wire20), .wire36(wire26), .wire33(wire19), .y(wire41), .wire35(reg25), .clk(clk));
  assign wire43 = (~^(^~wire15));
  assign wire44 = wire30;
  assign wire45 = (((($signed(wire31) ?
                                  wire17[(1'h1):(1'h0)] : wire31[(1'h0):(1'h0)]) ?
                              (8'hb2) : (-$signed(wire43))) ?
                          (wire15[(1'h1):(1'h1)] * (wire30[(2'h2):(1'h1)] ?
                              $signed((8'hb7)) : (wire19 ?
                                  wire26 : wire28))) : (((~wire41) ^~ $unsigned(wire13)) & ({wire16} >>> $signed(wire13)))) ?
                      $signed($unsigned((wire26[(1'h1):(1'h1)] ?
                          (wire18 ?
                              reg23 : wire14) : $signed(wire19)))) : wire19);
  assign wire46 = wire14;
  assign wire47 = wire14[(1'h0):(1'h0)];
  module48 #() modinst81 (.wire50(wire18), .clk(clk), .y(wire80), .wire52(wire19), .wire49(reg24), .wire51(wire30), .wire53(wire47));
  always
    @(posedge clk) begin
      reg82 <= (-{(&((wire20 >> reg22) & (~wire31)))});
      if ($signed(wire29[(3'h6):(2'h2)]))
        begin
          reg83 <= $signed($signed(wire45[(3'h6):(3'h4)]));
          reg84 <= (wire28 << wire31[(1'h0):(1'h0)]);
          if ((wire18 ?
              $unsigned($unsigned(reg21[(4'hb):(4'hb)])) : (reg23[(2'h2):(2'h2)] >> (^~$signed($unsigned(wire15))))))
            begin
              reg85 <= (reg83[(1'h0):(1'h0)] ?
                  (((+reg84) && $signed(wire18[(4'hc):(1'h0)])) ?
                      wire46 : $signed((wire19 ?
                          $unsigned(wire29) : (wire28 ?
                              (8'h9c) : wire30)))) : wire31[(2'h2):(2'h2)]);
            end
          else
            begin
              reg85 <= wire45[(4'h8):(3'h5)];
              reg86 <= {wire80, $unsigned((^$unsigned($unsigned(reg84))))};
              reg87 <= ($unsigned(wire43) ~^ ($signed(($signed(wire80) || $unsigned(wire27))) ?
                  reg24[(2'h3):(1'h1)] : (reg23[(1'h1):(1'h0)] <<< $signed({wire41}))));
              reg88 <= ($signed(({$unsigned(wire27),
                  ((8'hba) ? (8'hb1) : wire43)} < {$unsigned(reg82),
                  (|reg22)})) ~^ (|{(~^$unsigned(reg86))}));
            end
          reg89 <= wire43;
        end
      else
        begin
          reg83 <= ((~^(+((wire45 ?
              reg22 : wire16) || $signed(reg88)))) ~^ $unsigned((~|($unsigned(wire47) ?
              {wire43, reg87} : $signed(wire14)))));
          reg84 <= (((7'h41) & (~|(((8'haa) >= wire43) ^~ reg87))) << (($unsigned((&wire19)) < ($unsigned(wire43) ?
              (7'h40) : $signed(reg82))) >= (+(^~((8'hba) >> (8'ha4))))));
          if ((|(wire47[(3'h4):(3'h4)] >>> $signed($signed((wire41 ?
              reg88 : wire43))))))
            begin
              reg85 <= wire29[(1'h1):(1'h1)];
              reg86 <= $signed((8'had));
            end
          else
            begin
              reg85 <= ((+(~($unsigned((8'hb7)) ?
                      $signed(reg89) : (reg84 ? wire28 : reg22)))) ?
                  wire47[(5'h11):(2'h2)] : wire47[(3'h6):(2'h2)]);
            end
          reg87 <= (^~$signed($unsigned(($unsigned((8'hbf)) + (wire26 ?
              reg23 : (8'ha3))))));
        end
    end
endmodule

module module48
#(parameter param79 = ((((8'ha3) ? (~|{(8'h9c), (8'hab)}) : {(+(8'h9f)), ((8'hb7) != (8'hba))}) ^ ((((8'haf) ? (8'hb6) : (8'hb6)) ? ((8'h9c) ? (8'had) : (8'ha9)) : (|(8'hb7))) ? (((8'hbd) ? (8'hb4) : (8'ha1)) ? (~&(8'h9f)) : ((8'hb9) ? (8'hb3) : (8'ha4))) : (((8'h9d) >>> (8'hb5)) == ((8'hb8) ? (8'hb0) : (8'hbd))))) >>> {((~{(8'hbf)}) - (8'hbc))}))
(y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire53;
  input wire [(3'h6):(1'h0)] wire52;
  input wire signed [(5'h15):(1'h0)] wire51;
  input wire [(4'hc):(1'h0)] wire50;
  input wire signed [(5'h14):(1'h0)] wire49;
  wire signed [(3'h6):(1'h0)] wire78;
  wire [(2'h3):(1'h0)] wire77;
  wire signed [(4'hf):(1'h0)] wire76;
  wire [(5'h15):(1'h0)] wire75;
  wire [(3'h7):(1'h0)] wire70;
  wire signed [(5'h14):(1'h0)] wire69;
  wire signed [(4'h9):(1'h0)] wire68;
  wire [(3'h7):(1'h0)] wire67;
  wire [(2'h3):(1'h0)] wire66;
  wire signed [(5'h14):(1'h0)] wire65;
  wire signed [(4'he):(1'h0)] wire61;
  wire [(5'h12):(1'h0)] wire60;
  wire [(4'hd):(1'h0)] wire59;
  reg [(3'h7):(1'h0)] reg74 = (1'h0);
  reg [(2'h2):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg72 = (1'h0);
  reg [(2'h2):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg62 = (1'h0);
  reg [(4'ha):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg57 = (1'h0);
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg [(4'ha):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire61,
                 wire60,
                 wire59,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg64,
                 reg63,
                 reg62,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg54 <= {wire50[(3'h4):(2'h2)]};
      reg55 <= $unsigned(wire53);
      reg56 <= (wire52[(2'h3):(1'h0)] * (($signed($signed(wire53)) <= $unsigned((wire50 != reg54))) ?
          wire51 : $unsigned((wire53 * (reg55 ? reg55 : reg55)))));
      reg57 <= {wire53[(4'h9):(4'h8)]};
      reg58 <= $signed(reg54[(5'h11):(4'h9)]);
    end
  assign wire59 = ($unsigned(wire52) <<< reg54[(2'h3):(2'h3)]);
  assign wire60 = $signed(((|$unsigned(wire51[(5'h10):(1'h1)])) ?
                      (($signed(reg54) ^~ reg57[(4'hb):(1'h0)]) ?
                          $unsigned({(8'haa),
                              reg58}) : $unsigned($signed((8'haa)))) : (^(reg55[(1'h0):(1'h0)] || wire52))));
  assign wire61 = ((wire60[(3'h5):(2'h2)] ?
                      ({(reg58 > wire50)} < $signed((~&wire59))) : wire51[(4'h9):(3'h7)]) * ($unsigned((wire50[(2'h2):(2'h2)] & (reg58 ?
                          reg56 : (7'h41)))) ?
                      ($unsigned($signed((7'h42))) ?
                          $signed($unsigned((8'hba))) : ((wire52 << (7'h41)) & wire53[(3'h5):(2'h2)])) : {(wire59[(4'h8):(2'h2)] ?
                              (8'h9c) : (wire51 ? reg54 : reg56)),
                          wire59[(3'h4):(3'h4)]}));
  always
    @(posedge clk) begin
      reg62 <= ($unsigned((8'hac)) >>> wire51);
      reg63 <= (|wire49);
      reg64 <= ((+reg58) ?
          {$unsigned(wire60[(4'hf):(4'hd)]),
              reg55[(3'h7):(3'h4)]} : ($unsigned((|(+(8'hac)))) ~^ (^~(&(reg62 ?
              wire53 : reg58)))));
    end
  assign wire65 = (~reg57[(3'h7):(3'h4)]);
  assign wire66 = {(wire59[(4'hc):(3'h6)] ?
                          {($unsigned(reg62) | $signed(reg55)),
                              {(reg55 ? wire60 : (8'hae)),
                                  (wire59 != wire49)}} : (reg62[(5'h11):(1'h1)] != $signed((wire50 <= (8'ha6))))),
                      wire65[(4'h9):(3'h6)]};
  assign wire67 = (~wire52[(1'h1):(1'h0)]);
  assign wire68 = (+(~&reg56));
  assign wire69 = ((|(!reg55[(2'h2):(2'h2)])) > {({wire60, reg54} ?
                          $unsigned((^reg56)) : (wire67 < (wire59 ?
                              (8'hb1) : (8'h9e))))});
  assign wire70 = (($signed((wire52[(2'h2):(1'h1)] >> (reg56 ?
                          wire69 : reg64))) ?
                      ((+$signed(wire68)) ?
                          reg63 : $signed($signed(wire49))) : $signed($signed((~^(8'hb5))))) >= $unsigned(reg57[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg71 <= {reg56[(4'h9):(3'h4)],
          (wire53[(4'h8):(2'h2)] + wire52[(1'h0):(1'h0)])};
      reg72 <= wire51[(1'h0):(1'h0)];
      reg73 <= reg71;
      reg74 <= ($unsigned($unsigned(($unsigned(reg54) ?
              reg64[(1'h0):(1'h0)] : (8'ha3)))) ?
          wire65[(5'h14):(1'h1)] : (wire50[(3'h6):(2'h3)] ?
              $signed($signed((wire68 && wire65))) : ((^~$unsigned(reg58)) ?
                  wire67[(1'h1):(1'h0)] : ($signed(reg72) * $signed((8'hae))))));
    end
  assign wire75 = (~&((8'hb3) ?
                      (wire52[(2'h3):(2'h3)] ?
                          $unsigned($signed(reg58)) : reg72[(2'h2):(2'h2)]) : $unsigned(((reg74 ?
                          (8'had) : reg71) > (8'hb6)))));
  assign wire76 = $signed($signed(wire65[(5'h10):(3'h7)]));
  assign wire77 = (((^~{(wire70 && reg73),
                      $unsigned(wire52)}) ^ $signed(((wire53 < (8'haa)) && $signed(wire70)))) - (8'hab));
  assign wire78 = reg64;
endmodule

module module32  (y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'h16):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire36;
  input wire signed [(5'h11):(1'h0)] wire35;
  input wire signed [(3'h6):(1'h0)] wire34;
  input wire signed [(4'ha):(1'h0)] wire33;
  wire [(4'hc):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire39;
  wire signed [(2'h2):(1'h0)] wire38;
  wire [(2'h2):(1'h0)] wire37;
  assign y = {wire40, wire39, wire38, wire37, (1'h0)};
  assign wire37 = ($unsigned((&(^wire36[(1'h1):(1'h0)]))) < $signed($unsigned($unsigned($unsigned(wire34)))));
  assign wire38 = ({wire34, wire36} << $signed(((7'h42) * wire34)));
  assign wire39 = ((~wire35[(3'h4):(1'h0)]) ?
                      $unsigned($unsigned(wire33[(2'h2):(1'h1)])) : (((wire34 ?
                          $unsigned(wire34) : wire37[(2'h2):(1'h1)]) != wire33) > $unsigned($unsigned((wire36 ?
                          wire38 : wire36)))));
  assign wire40 = $signed((~wire35));
endmodule
