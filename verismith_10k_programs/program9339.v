module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h25c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire4;
  wire [(3'h7):(1'h0)] wire116;
  wire signed [(4'hd):(1'h0)] wire99;
  wire [(4'hf):(1'h0)] wire98;
  wire [(4'hb):(1'h0)] wire97;
  wire [(4'hc):(1'h0)] wire96;
  wire [(5'h14):(1'h0)] wire95;
  wire signed [(4'he):(1'h0)] wire94;
  wire [(3'h7):(1'h0)] wire93;
  wire signed [(5'h15):(1'h0)] wire92;
  wire [(5'h12):(1'h0)] wire91;
  wire signed [(3'h5):(1'h0)] wire90;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire88;
  reg [(5'h10):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg120 = (1'h0);
  reg [(4'hf):(1'h0)] reg119 = (1'h0);
  reg [(3'h7):(1'h0)] reg118 = (1'h0);
  reg [(5'h13):(1'h0)] reg117 = (1'h0);
  reg [(4'hb):(1'h0)] reg115 = (1'h0);
  reg [(5'h15):(1'h0)] reg114 = (1'h0);
  reg [(4'he):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg111 = (1'h0);
  reg [(3'h5):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg109 = (1'h0);
  reg [(4'hf):(1'h0)] reg108 = (1'h0);
  reg [(3'h4):(1'h0)] reg107 = (1'h0);
  reg [(5'h13):(1'h0)] reg106 = (1'h0);
  reg [(4'hf):(1'h0)] reg105 = (1'h0);
  reg [(4'hf):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg102 = (1'h0);
  reg [(3'h5):(1'h0)] reg101 = (1'h0);
  reg [(4'hd):(1'h0)] reg100 = (1'h0);
  reg [(4'he):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  assign y = {wire116,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire6,
                 wire7,
                 wire88,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= ((&wire2[(3'h5):(1'h0)]) ?
          $signed((8'hbf)) : ($unsigned($signed($signed(wire1))) ?
              $signed({(8'ha3), (wire0 | wire4)}) : $signed(wire2)));
    end
  assign wire6 = $unsigned({wire2[(4'hc):(4'ha)]});
  assign wire7 = (~&wire1);
  always
    @(posedge clk) begin
      if ((($unsigned(((wire4 - reg5) << ((8'h9f) ? wire1 : wire3))) ?
          (~^($signed(wire3) ?
              (&wire6) : $signed(wire2))) : wire0) >> (~$unsigned(wire6))))
        begin
          reg8 <= ($signed($unsigned(wire2[(4'he):(3'h6)])) < (wire7 >>> ({{(8'hb1)},
              (reg5 >= wire7)} | wire6[(4'h9):(1'h0)])));
        end
      else
        begin
          reg8 <= wire0;
          reg9 <= $signed((wire4[(2'h3):(2'h3)] - $signed(wire7[(4'hb):(4'ha)])));
          reg10 <= wire4[(4'ha):(2'h2)];
          reg11 <= (((~|{(8'ha2)}) ?
                  $signed((~|((8'ha9) <= reg8))) : $unsigned($signed($signed(wire2)))) ?
              $signed((|($unsigned(wire6) ?
                  (wire4 ?
                      reg5 : wire6) : (^(8'hb3))))) : $unsigned((($signed(reg5) - (~^reg9)) ?
                  wire3 : $signed((reg5 << wire0)))));
        end
      if ((!(($unsigned(((8'hba) ? wire2 : wire0)) ?
              $unsigned({wire0}) : (wire7 ?
                  ((8'hae) >> wire1) : (wire7 ? wire1 : reg11))) ?
          {wire1[(2'h2):(1'h0)],
              (wire2[(5'h13):(5'h12)] ? reg8 : $signed(wire3))} : reg9)))
        begin
          reg12 <= ($signed(wire7) | (wire2 | reg8));
        end
      else
        begin
          reg12 <= $unsigned(wire6);
          reg13 <= (8'hbf);
          if (reg13[(3'h6):(3'h4)])
            begin
              reg14 <= wire0[(3'h6):(1'h1)];
              reg15 <= (wire7 != (wire2 ?
                  $signed($unsigned(reg14)) : $unsigned(($unsigned(reg10) != $signed(wire4)))));
              reg16 <= (~^(($signed((~(8'hba))) ?
                      (~^(wire2 ? reg14 : (8'haa))) : {(~|(8'ha4)),
                          (wire4 ^~ wire2)}) ?
                  $signed((+(~wire3))) : $unsigned((reg13 ?
                      (^reg13) : {(8'hbe), reg13}))));
              reg17 <= wire6;
            end
          else
            begin
              reg14 <= $unsigned(($signed((-(reg13 ?
                  reg11 : wire3))) && (~&(~(reg15 ? reg9 : reg13)))));
            end
        end
    end
  module18 #() modinst89 (wire88, clk, wire2, wire0, reg5, wire1);
  assign wire90 = $signed(((($signed(reg17) & (8'h9d)) ?
                      $signed((^wire3)) : ((8'hba) <<< (^wire7))) ~^ reg11[(1'h1):(1'h1)]));
  assign wire91 = wire6[(5'h11):(4'hf)];
  assign wire92 = $signed((^~(~reg9)));
  assign wire93 = (reg8[(1'h0):(1'h0)] ? (8'ha8) : reg15);
  assign wire94 = ($signed($signed($unsigned(wire6))) ?
                      (&(-(reg10[(1'h1):(1'h1)] == {reg10,
                          reg15}))) : {$signed(({wire93,
                              (8'hb0)} && {reg12}))});
  assign wire95 = (8'hb0);
  assign wire96 = ($signed(wire2[(4'hc):(1'h1)]) ?
                      wire7[(2'h2):(1'h1)] : $unsigned(wire91[(4'hd):(4'ha)]));
  assign wire97 = {reg5[(1'h1):(1'h1)], reg10[(1'h1):(1'h1)]};
  assign wire98 = wire95;
  assign wire99 = wire7[(3'h6):(1'h0)];
  always
    @(posedge clk) begin
      if ((|$unsigned(wire94)))
        begin
          if ((8'ha7))
            begin
              reg100 <= wire96[(1'h1):(1'h1)];
              reg101 <= $signed($unsigned($unsigned(((~wire91) & reg12))));
            end
          else
            begin
              reg100 <= (wire4 ? wire2[(5'h12):(2'h2)] : reg10[(2'h3):(1'h0)]);
              reg101 <= {$unsigned({($unsigned((8'hbc)) && wire0[(5'h12):(5'h11)])}),
                  (^~wire92)};
            end
          reg102 <= $unsigned($unsigned(({(wire7 << reg11),
              $signed(reg16)} && $unsigned($unsigned(reg17)))));
          reg103 <= (~&((wire96[(3'h4):(2'h2)] - (wire90[(2'h2):(2'h2)] ?
                  $unsigned(reg100) : {wire92})) ?
              (~$unsigned((~^reg100))) : (((+wire92) + (reg15 == reg102)) < wire90)));
          reg104 <= (~wire92[(2'h2):(1'h0)]);
        end
      else
        begin
          reg100 <= $unsigned(reg101);
          if ((!reg102))
            begin
              reg101 <= ({$signed((~&((8'haf) >>> reg103))),
                      $signed((wire93 >> $signed(reg17)))} ?
                  ($signed($unsigned(reg102[(3'h6):(1'h1)])) ?
                      $signed(($unsigned(reg104) != (reg17 ?
                          (8'hab) : wire7))) : (-reg13[(3'h4):(2'h3)])) : reg12[(4'h8):(3'h7)]);
            end
          else
            begin
              reg101 <= {($signed(wire88[(2'h2):(1'h0)]) >> {{wire0[(4'hc):(2'h2)]}})};
              reg102 <= (+(&reg104));
              reg103 <= $signed(($signed(({reg8,
                      reg13} >> reg100[(3'h4):(1'h1)])) ?
                  $unsigned(((wire99 ?
                      reg9 : wire88) <= wire96)) : reg13[(4'hf):(1'h1)]));
              reg104 <= reg15;
            end
          if (reg101[(2'h3):(1'h0)])
            begin
              reg105 <= {((8'ha9) ~^ (^~$signed($signed(wire95)))),
                  wire90[(1'h0):(1'h0)]};
              reg106 <= {((reg10[(1'h0):(1'h0)] ?
                      (!(~|reg9)) : ($signed((7'h44)) ?
                          (wire91 >= reg8) : wire96[(2'h2):(2'h2)])) >>> ($signed($unsigned(wire96)) < (&(wire94 ?
                      wire2 : reg10)))),
                  (($unsigned($unsigned(reg5)) ~^ (reg16[(4'h8):(3'h5)] >>> reg100[(3'h7):(3'h4)])) && ((((8'hb7) ?
                          reg103 : wire3) <<< wire92) ?
                      $unsigned(wire99[(3'h6):(2'h3)]) : ((reg16 ?
                              wire97 : wire90) ?
                          wire91 : (!reg104))))};
            end
          else
            begin
              reg105 <= (^~(^~wire92[(5'h10):(2'h2)]));
              reg106 <= ((!$signed(reg14)) ?
                  $signed(({(reg5 ? (8'hb0) : wire98)} ^ {((8'ha5) ?
                          reg106 : wire91),
                      (reg11 ? (8'hbb) : (7'h41))})) : wire90);
            end
        end
      reg107 <= (8'hb1);
      if ($signed($signed(reg100[(4'hd):(2'h2)])))
        begin
          reg108 <= reg8;
          reg109 <= $signed({$signed($unsigned(reg15))});
          if (({wire7,
              (^(reg107[(2'h2):(1'h0)] ?
                  (wire1 ? (8'ha3) : reg17) : {reg8,
                      wire7}))} ^ $unsigned((&(^~$signed(reg14))))))
            begin
              reg110 <= (((8'hb0) ?
                  ($signed($signed(reg14)) ?
                      $unsigned(reg12) : (reg102[(3'h7):(1'h0)] != $unsigned(reg101))) : ((((8'h9f) <= wire0) << $unsigned(wire3)) ?
                      (!reg8) : (reg14[(2'h3):(1'h0)] ?
                          $unsigned(wire99) : $signed(wire90)))) >= $unsigned((8'ha8)));
            end
          else
            begin
              reg110 <= (($unsigned(wire4[(3'h5):(2'h3)]) ?
                      reg10[(3'h5):(2'h2)] : $unsigned(reg13[(4'hd):(3'h4)])) ?
                  (reg10[(3'h6):(3'h5)] - reg110) : ((~&({wire0,
                          (8'hac)} || reg106)) ?
                      $signed(reg9) : reg100[(1'h0):(1'h0)]));
              reg111 <= wire4;
            end
          reg112 <= ($unsigned(((|(-reg107)) ^ {wire4})) ?
              ($unsigned(wire94[(4'ha):(3'h6)]) ?
                  (wire3 ?
                      (8'haa) : ($unsigned(wire88) ?
                          (+reg13) : $signed(wire98))) : $signed(((wire96 ?
                      (8'hb0) : (8'haf)) <= (wire3 && reg17)))) : ((8'h9d) ?
                  wire95[(4'h8):(4'h8)] : (reg17[(4'ha):(3'h7)] == ($unsigned((8'hba)) > (reg8 + (7'h42))))));
          reg113 <= (reg103 ?
              $signed((^~reg12[(3'h6):(1'h0)])) : $unsigned((8'ha3)));
        end
      else
        begin
          reg108 <= $signed($unsigned((reg9[(1'h0):(1'h0)] || reg16[(4'h8):(3'h4)])));
          reg109 <= (8'h9c);
          reg110 <= (reg107 ?
              $unsigned((wire97 ?
                  $signed($unsigned(wire88)) : wire98)) : $signed(wire97));
        end
      reg114 <= reg103[(5'h10):(1'h1)];
      reg115 <= (8'hb1);
    end
  assign wire116 = $unsigned(((+((~&(7'h42)) ?
                       reg112 : (wire90 != reg107))) + $unsigned(reg102[(2'h3):(2'h3)])));
  always
    @(posedge clk) begin
      reg117 <= (reg106 ?
          ($unsigned(($signed((7'h41)) ?
              wire4 : reg104)) || (((^wire94) >> wire116) ?
              $unsigned((!reg108)) : ((wire97 ^ wire3) - wire93[(1'h0):(1'h0)]))) : ((reg105[(4'hc):(4'ha)] != ((wire2 ^ wire98) >>> $signed(wire3))) ?
              $unsigned($signed((reg103 - (8'ha9)))) : ($signed(reg11) ?
                  $unsigned((&(8'ha7))) : $signed((8'hb0)))));
      reg118 <= (((+$unsigned((reg5 != wire91))) ^ reg108) ?
          $signed(($signed((|reg106)) || wire91[(3'h6):(1'h1)])) : ($unsigned($unsigned(reg109)) ^ $signed({wire0[(1'h0):(1'h0)],
              (~^wire96)})));
      reg119 <= (~|(((+wire92) || $signed(reg15[(2'h2):(2'h2)])) ?
          reg8 : $unsigned({reg103[(5'h10):(4'ha)], reg15})));
      reg120 <= ((8'hb6) ? (+(wire0 ^ $signed($signed(wire88)))) : reg14);
      reg121 <= $signed($unsigned({((reg15 ^~ reg118) ?
              $unsigned(reg12) : $signed(reg105))}));
    end
endmodule

module module18
#(parameter param87 = {{(((~^(8'ha5)) * (+(8'hbf))) | ((~&(7'h43)) ? {(8'ha1)} : {(8'hb6)}))}, (((^~(~(8'ha1))) ? (((8'hac) >>> (7'h41)) ? ((8'hba) <<< (8'ha0)) : ((8'ha7) << (8'h9d))) : ({(8'hb1), (8'hae)} == (8'hb8))) << ((((8'ha1) ? (8'h9d) : (8'hb1)) <= (8'hab)) ? (8'hb1) : ((~^(8'ha2)) ? (-(8'ha6)) : ((8'hb6) ? (8'ha5) : (8'haa)))))})
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h216):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire22;
  input wire [(5'h13):(1'h0)] wire21;
  input wire [(4'he):(1'h0)] wire20;
  input wire [(4'hc):(1'h0)] wire19;
  wire signed [(3'h7):(1'h0)] wire86;
  wire signed [(5'h12):(1'h0)] wire85;
  wire [(4'hc):(1'h0)] wire84;
  wire signed [(4'hd):(1'h0)] wire83;
  wire signed [(4'h9):(1'h0)] wire82;
  wire signed [(4'hc):(1'h0)] wire81;
  wire [(3'h7):(1'h0)] wire80;
  wire signed [(5'h14):(1'h0)] wire79;
  wire signed [(5'h12):(1'h0)] wire78;
  wire [(5'h12):(1'h0)] wire77;
  wire [(5'h13):(1'h0)] wire58;
  wire signed [(4'h9):(1'h0)] wire25;
  wire signed [(4'hf):(1'h0)] wire24;
  wire [(5'h15):(1'h0)] wire23;
  reg signed [(3'h7):(1'h0)] reg76 = (1'h0);
  reg signed [(4'he):(1'h0)] reg75 = (1'h0);
  reg [(4'he):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg73 = (1'h0);
  reg [(2'h2):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(3'h7):(1'h0)] reg70 = (1'h0);
  reg [(4'h8):(1'h0)] reg69 = (1'h0);
  reg [(3'h7):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg67 = (1'h0);
  reg [(5'h12):(1'h0)] reg66 = (1'h0);
  reg [(4'h9):(1'h0)] reg65 = (1'h0);
  reg [(4'h9):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg63 = (1'h0);
  reg [(5'h10):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  reg [(3'h4):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
  reg signed [(4'he):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg33 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  reg [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire58,
                 wire25,
                 wire24,
                 wire23,
                 reg76,
                 reg75,
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
                 reg60,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire23 = (^~wire19);
  assign wire24 = wire19;
  assign wire25 = $unsigned(($unsigned(($signed((7'h43)) ?
                      (wire24 <= wire20) : (wire21 ?
                          wire19 : wire24))) <= wire21[(5'h10):(4'hd)]));
  always
    @(posedge clk) begin
      if (wire24)
        begin
          reg26 <= ($signed(wire25) ?
              ((8'haa) == (7'h44)) : {$unsigned($unsigned($unsigned(wire24)))});
          reg27 <= $signed($unsigned($signed($unsigned($signed(wire23)))));
          if (({$unsigned(wire24[(4'hc):(3'h6)])} ?
              ($signed((wire23 ?
                  {wire23} : $unsigned(wire21))) & wire20) : ((&{$signed(reg27),
                  wire20[(4'hd):(4'h9)]}) << ((wire24 * $unsigned(wire20)) >>> $signed((~&wire21))))))
            begin
              reg28 <= wire21[(3'h6):(1'h1)];
            end
          else
            begin
              reg28 <= $unsigned(wire25);
              reg29 <= ((~&$signed(($unsigned(wire25) != wire24[(1'h0):(1'h0)]))) ?
                  wire20[(3'h6):(2'h3)] : $signed((($signed(wire24) ?
                          {wire21} : wire23[(1'h0):(1'h0)]) ?
                      wire24 : ((8'ha2) && (^wire20)))));
              reg30 <= $unsigned(wire21);
            end
        end
      else
        begin
          reg26 <= wire24[(3'h4):(1'h1)];
          reg27 <= ({{$signed(wire20)}} ?
              ($signed((~(wire19 ?
                  reg26 : (8'h9d)))) & $unsigned($signed($signed(reg26)))) : $unsigned(({(wire20 ^ wire23),
                      (reg29 ? (8'hbb) : reg27)} ?
                  reg30[(2'h2):(2'h2)] : ($unsigned(reg30) ?
                      (reg30 >> wire24) : (wire21 ? (8'hba) : reg28)))));
          reg28 <= $signed(($unsigned((reg28[(4'h9):(3'h4)] ?
                  $unsigned((8'ha4)) : (wire21 ? wire19 : reg29))) ?
              $unsigned({$signed(reg28),
                  $signed(wire25)}) : ($unsigned(wire24[(4'hb):(3'h4)]) > wire21[(4'hf):(4'h8)])));
        end
      reg31 <= (-$unsigned(reg26[(1'h1):(1'h1)]));
      if (wire21[(1'h1):(1'h0)])
        begin
          reg32 <= wire19[(4'h9):(3'h7)];
          if ((((|{reg27[(2'h2):(1'h0)]}) ?
                  ($unsigned($unsigned((8'ha9))) < $unsigned($signed(reg30))) : $unsigned((~^(+wire19)))) ?
              $unsigned($unsigned(wire22[(1'h0):(1'h0)])) : ($signed({reg29,
                      wire23[(3'h7):(3'h6)]}) ?
                  ((!(reg32 << wire19)) ?
                      $unsigned({reg27, reg30}) : (wire25[(3'h5):(2'h3)] ?
                          reg32[(2'h2):(1'h0)] : $signed(wire23))) : ($signed(((8'hb1) ?
                          (7'h40) : reg31)) ?
                      ((reg32 ?
                          wire23 : (7'h43)) ^~ (reg31 ^ reg29)) : reg30[(1'h0):(1'h0)]))))
            begin
              reg33 <= $unsigned(reg32);
              reg34 <= {wire25[(1'h0):(1'h0)], (~^(~&wire24))};
            end
          else
            begin
              reg33 <= (~$signed(((~(reg29 ? reg31 : reg31)) ?
                  $unsigned(wire21) : wire19[(2'h3):(1'h0)])));
              reg34 <= (~|$unsigned($signed({$signed(wire25),
                  (wire21 <<< reg34)})));
              reg35 <= (|((~(~|(+reg33))) ?
                  wire22[(3'h6):(1'h0)] : $signed((reg28[(3'h5):(3'h5)] << wire22[(4'ha):(3'h6)]))));
              reg36 <= wire21[(4'ha):(2'h3)];
            end
        end
      else
        begin
          reg32 <= $signed((($unsigned(((8'had) == reg31)) == (+(reg30 ?
              reg26 : reg33))) > $signed((reg26 ? wire19 : reg26))));
          reg33 <= $unsigned((+wire24));
          if ((reg31 + $signed(wire24)))
            begin
              reg34 <= ({(wire19 ^~ $unsigned($signed(wire25))),
                      $signed(((wire22 ? reg29 : wire22) ?
                          (8'hbc) : $unsigned((8'hbc))))} ?
                  $unsigned($signed(wire22[(3'h5):(3'h5)])) : $unsigned($signed(($signed(wire21) * $unsigned((8'ha1))))));
            end
          else
            begin
              reg34 <= $unsigned($signed((wire24 ?
                  ($signed(reg27) ?
                      reg30[(1'h0):(1'h0)] : $unsigned((8'hb2))) : reg34)));
              reg35 <= $signed((($unsigned((wire24 || reg34)) ?
                  {$signed(wire22)} : $signed((-reg31))) <= reg30[(1'h1):(1'h1)]));
              reg36 <= $unsigned(wire24);
              reg37 <= $unsigned((($unsigned((reg28 ?
                      reg29 : reg31)) ^ (~^((8'hb4) ? reg35 : wire20))) ?
                  $unsigned($unsigned($unsigned(reg32))) : $unsigned(reg30)));
              reg38 <= $signed((~^(~|($signed((7'h41)) ?
                  wire23[(5'h11):(4'hc)] : (wire21 ? reg36 : wire22)))));
            end
          reg39 <= ($unsigned((~^reg27[(4'h8):(3'h4)])) && $unsigned((8'hb2)));
          if (reg34)
            begin
              reg40 <= $unsigned((($signed(reg29[(4'hc):(3'h5)]) ?
                  {(^~reg26)} : {(~|reg29), reg34[(3'h5):(2'h2)]}) | (((reg28 ?
                      reg27 : reg33) > (^reg26)) ?
                  wire22[(3'h7):(3'h6)] : ($unsigned(wire19) ?
                      wire21 : (!(8'h9f))))));
              reg41 <= {((&reg36) ^ $signed({$signed(reg39)})),
                  wire19[(4'hc):(4'hc)]};
              reg42 <= ($signed($signed((~^$unsigned(reg27)))) < wire20);
            end
          else
            begin
              reg40 <= $unsigned({$unsigned(wire22[(4'h8):(3'h7)])});
            end
        end
    end
  module43 #() modinst59 (wire58, clk, reg32, reg39, wire23, wire24);
  always
    @(posedge clk) begin
      if (($signed(((reg30 ? (+reg26) : reg36) && $unsigned($signed(reg34)))) ?
          reg31 : (reg28 ? reg42 : (-((reg41 ? reg28 : reg42) | {wire20})))))
        begin
          reg60 <= $signed($unsigned((&((reg35 != wire21) ?
              reg35[(3'h4):(2'h2)] : $unsigned((8'ha6))))));
        end
      else
        begin
          reg60 <= (reg41 * $signed(((^~$unsigned(wire25)) ?
              ($signed((8'h9e)) > reg38[(1'h1):(1'h0)]) : $unsigned($unsigned(reg29)))));
          reg61 <= $signed((&({wire25,
              $unsigned(reg30)} > reg27[(3'h7):(1'h0)])));
          if (wire20[(4'hd):(4'h9)])
            begin
              reg62 <= wire25[(4'h8):(1'h1)];
              reg63 <= ((^~{$signed(reg32[(4'h8):(2'h2)])}) ?
                  wire58[(5'h10):(4'h9)] : $signed((~{$unsigned(reg31),
                      (&reg61)})));
            end
          else
            begin
              reg62 <= $unsigned(reg60[(1'h1):(1'h0)]);
              reg63 <= $signed((wire22 <<< $signed((wire22 ~^ $signed((8'hb5))))));
              reg64 <= (-(~(&reg29[(1'h1):(1'h0)])));
            end
          reg65 <= (reg35 == ($unsigned($unsigned($unsigned(reg26))) ^~ $unsigned(reg38)));
          reg66 <= (~&reg29[(5'h11):(4'he)]);
        end
      if ($signed($unsigned((~&wire19[(4'ha):(3'h4)]))))
        begin
          reg67 <= $unsigned($unsigned($unsigned(wire58[(4'hd):(4'h9)])));
          reg68 <= reg60[(3'h4):(2'h2)];
          reg69 <= wire25;
          if (reg67)
            begin
              reg70 <= (&$unsigned(($signed({reg66, wire22}) ?
                  reg62[(4'h9):(4'h9)] : ((wire23 ?
                      wire24 : (8'hb1)) != $unsigned((8'h9d))))));
              reg71 <= $unsigned((((+{(8'haa)}) << ($signed(reg41) <<< (reg66 ?
                      reg39 : reg36))) ?
                  (-reg33[(4'ha):(4'h9)]) : ($unsigned(((8'hb2) <= wire19)) ?
                      $unsigned((-reg61)) : $signed((wire58 ?
                          wire23 : reg32)))));
              reg72 <= ($signed((wire19[(3'h6):(2'h3)] ?
                      $unsigned(reg35) : $unsigned((reg36 + wire21)))) ?
                  ({$signed((reg30 ? reg66 : (7'h43))), wire58} ?
                      (+(8'hb5)) : (($signed((8'hab)) ?
                              (~^reg71) : reg61[(1'h0):(1'h0)]) ?
                          (reg41 ^~ $unsigned((7'h42))) : wire20)) : (reg32 ?
                      ((~^reg41) ?
                          ((reg65 ?
                              reg42 : reg26) ~^ $signed(reg38)) : reg29[(4'hc):(4'hb)]) : reg28));
              reg73 <= {reg41[(4'hd):(4'h8)]};
              reg74 <= $signed(reg40);
            end
          else
            begin
              reg70 <= (8'hb3);
              reg71 <= $unsigned({{((reg70 ? reg67 : reg66) < (8'ha6))},
                  $signed($signed((8'hbe)))});
              reg72 <= (~^$unsigned($unsigned(($signed(reg39) >> (~^wire22)))));
              reg73 <= reg62;
              reg74 <= ((+reg62) ?
                  ((((^~reg40) || reg40[(1'h0):(1'h0)]) ?
                          wire22[(4'hb):(4'h9)] : (8'hbf)) ?
                      reg72[(1'h0):(1'h0)] : (reg73 ?
                          ($unsigned(reg73) >= reg63) : reg64[(1'h1):(1'h1)])) : ((((reg29 <<< wire21) <= (reg73 ^ reg29)) ?
                          ((&reg42) || ((8'haf) <<< reg71)) : reg64) ?
                      $unsigned($signed(wire21)) : ($unsigned((reg28 > reg26)) | $signed(((8'hb0) ^ reg37)))));
            end
          reg75 <= $unsigned(reg69);
        end
      else
        begin
          reg67 <= ((reg72 ?
              wire58[(3'h4):(2'h2)] : reg74[(2'h3):(2'h2)]) <= $signed((^~((~|reg61) - $unsigned(reg30)))));
          reg68 <= (~|(reg31 ?
              reg40 : {{$signed(reg75), reg74[(4'hb):(3'h5)]},
                  (((8'ha8) ? (7'h44) : (8'hbe)) ?
                      (reg26 ? reg28 : wire25) : reg32)}));
          if ({$signed(((((8'h9f) ? reg68 : reg36) < (wire20 ?
                  (8'ha1) : reg63)) | {(~&wire20)})),
              reg42[(1'h1):(1'h0)]})
            begin
              reg69 <= $unsigned(reg70);
              reg70 <= (&reg72[(1'h0):(1'h0)]);
              reg71 <= $unsigned((reg73 ? (~&(!(reg73 == wire20))) : (8'ha0)));
            end
          else
            begin
              reg69 <= $signed((|{$unsigned($unsigned(wire24))}));
              reg70 <= {$unsigned(reg40[(4'he):(4'hc)])};
              reg71 <= (8'hb5);
            end
        end
      reg76 <= $unsigned(wire23);
    end
  assign wire77 = reg70;
  assign wire78 = reg31[(5'h13):(4'h9)];
  assign wire79 = ($signed($signed($signed($unsigned(reg39)))) ?
                      (reg60 ?
                          (~^($unsigned(reg32) ^ (!reg37))) : ((^~$unsigned(reg35)) * ((reg36 || reg67) ?
                              $signed(reg61) : ((8'ha7) ?
                                  (8'ha0) : reg35)))) : ($signed(((!reg70) || $unsigned(wire58))) || wire19[(4'hb):(1'h0)]));
  assign wire80 = reg41;
  assign wire81 = ($unsigned(reg42) ?
                      {{$unsigned(reg61[(2'h3):(1'h1)]),
                              wire77[(3'h7):(3'h4)]}} : (~{wire77}));
  assign wire82 = $signed(($signed((~|((8'hb7) != reg29))) ?
                      $unsigned(((reg76 >>> wire77) == (reg30 ?
                          reg29 : wire22))) : $signed((~|$unsigned(wire80)))));
  assign wire83 = reg33[(3'h7):(3'h7)];
  assign wire84 = $unsigned($signed(((~&((8'ha6) & reg66)) ?
                      reg65 : reg37[(3'h6):(1'h0)])));
  assign wire85 = reg41;
  assign wire86 = (($signed($unsigned(reg28[(4'h9):(4'h9)])) >= (8'ha8)) ?
                      wire24 : reg26[(2'h3):(1'h0)]);
endmodule

module module43
#(parameter param56 = (^(~&(^(+{(8'h9e)})))), 
parameter param57 = (~^(param56 ? (8'hb7) : ((~|(param56 != param56)) <<< param56))))
(y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire47;
  input wire [(3'h7):(1'h0)] wire46;
  input wire signed [(5'h15):(1'h0)] wire45;
  input wire [(2'h2):(1'h0)] wire44;
  wire [(4'h8):(1'h0)] wire55;
  wire signed [(4'h9):(1'h0)] wire54;
  wire [(4'hf):(1'h0)] wire53;
  wire [(4'hd):(1'h0)] wire51;
  wire signed [(3'h7):(1'h0)] wire50;
  reg [(3'h4):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg49 = (1'h0);
  reg [(5'h10):(1'h0)] reg48 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire51,
                 wire50,
                 reg52,
                 reg49,
                 reg48,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg48 <= (-wire46);
      reg49 <= wire47[(2'h3):(1'h0)];
    end
  assign wire50 = (!(8'hbc));
  assign wire51 = ({$signed((~&$unsigned(reg48)))} <<< $signed((wire46 ?
                      wire46 : (((8'ha5) | wire50) ^ (reg49 ^ wire44)))));
  always
    @(posedge clk) begin
      reg52 <= $unsigned(wire46[(3'h5):(3'h5)]);
    end
  assign wire53 = (((8'h9c) && $unsigned((+reg48[(2'h3):(2'h2)]))) ~^ wire51);
  assign wire54 = wire53;
  assign wire55 = reg49;
endmodule
