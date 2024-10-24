module top
#(parameter param117 = (+((~{((8'hbd) || (8'h9f)), (~&(8'hba))}) ? ((8'hb1) ? (((7'h40) ? (7'h40) : (8'ha6)) * {(8'ha9), (8'hb3)}) : ((~|(8'ha3)) ? ((7'h44) ? (8'hae) : (8'hbd)) : ((8'hbe) ? (8'ha8) : (8'hb1)))) : (&(8'hab)))), 
parameter param118 = {(^param117)})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h220):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire116;
  wire signed [(5'h12):(1'h0)] wire115;
  wire [(4'he):(1'h0)] wire114;
  wire [(4'hb):(1'h0)] wire100;
  wire signed [(3'h5):(1'h0)] wire99;
  wire signed [(5'h10):(1'h0)] wire98;
  wire [(4'he):(1'h0)] wire97;
  wire signed [(4'he):(1'h0)] wire96;
  wire [(5'h10):(1'h0)] wire95;
  wire signed [(5'h12):(1'h0)] wire93;
  wire signed [(3'h6):(1'h0)] wire26;
  wire signed [(4'h8):(1'h0)] wire16;
  wire signed [(3'h7):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire13;
  wire signed [(4'h8):(1'h0)] wire12;
  wire [(3'h4):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire5;
  reg [(3'h7):(1'h0)] reg113 = (1'h0);
  reg [(4'hf):(1'h0)] reg112 = (1'h0);
  reg [(4'he):(1'h0)] reg111 = (1'h0);
  reg [(4'ha):(1'h0)] reg110 = (1'h0);
  reg [(3'h7):(1'h0)] reg109 = (1'h0);
  reg [(4'hc):(1'h0)] reg108 = (1'h0);
  reg [(4'hb):(1'h0)] reg107 = (1'h0);
  reg [(5'h15):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg104 = (1'h0);
  reg [(4'h9):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg101 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  assign y = {wire116,
                 wire115,
                 wire114,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire93,
                 wire26,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire5,
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
                 reg6,
                 reg7,
                 reg8,
                 reg9,
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
  assign wire5 = (+$unsigned(({$unsigned((8'ha7))} ~^ ((wire0 != wire3) <= $unsigned(wire4)))));
  always
    @(posedge clk) begin
      reg6 <= wire5;
      reg7 <= (($unsigned(wire4) ?
          (($signed(wire4) | $signed(wire3)) ?
              $unsigned(((7'h44) ~^ wire3)) : {reg6}) : (&wire0[(3'h5):(2'h3)])) != ($unsigned(($signed(wire1) - wire1[(1'h1):(1'h0)])) ?
          (wire2 ?
              $signed($unsigned(wire1)) : (wire0[(3'h4):(3'h4)] ?
                  (^(8'ha4)) : (wire4 ^ wire5))) : (8'hb3)));
      reg8 <= $signed($signed(wire3[(3'h7):(3'h7)]));
      reg9 <= $unsigned(wire2[(3'h7):(3'h4)]);
    end
  assign wire10 = (wire2 ? wire5 : wire1[(3'h7):(3'h4)]);
  assign wire11 = ({(~&((wire10 >= (8'ha8)) - (wire10 >= reg9)))} + wire0[(3'h5):(3'h4)]);
  assign wire12 = wire2[(4'hd):(3'h6)];
  assign wire13 = (wire0[(3'h5):(2'h2)] * {((~&(wire4 ? (8'hbb) : reg8)) ?
                          (!{reg7}) : wire5)});
  assign wire14 = wire1[(4'hc):(3'h5)];
  assign wire15 = $unsigned({(~^$signed((reg8 >= reg7))), reg9});
  assign wire16 = {wire10[(4'h8):(3'h7)]};
  always
    @(posedge clk) begin
      reg17 <= $unsigned({($signed($unsigned((8'hbe))) << wire10),
          $unsigned(wire12)});
      reg18 <= wire3;
      if ($unsigned({$unsigned($signed(wire1[(4'hb):(4'ha)])),
          ((8'ha3) ?
              ((-(8'h9c)) ?
                  (wire4 >> reg18) : $signed(wire14)) : $signed(wire13))}))
        begin
          if ({(^reg9[(2'h2):(1'h0)])})
            begin
              reg19 <= (~^(~|$signed($unsigned((~reg17)))));
              reg20 <= $signed({$signed(wire10), wire1});
              reg21 <= (wire2[(4'h9):(3'h7)] ?
                  (({reg7} <= $signed($signed(wire0))) && (~|$signed(wire15[(3'h7):(1'h0)]))) : {(((reg20 || wire11) ?
                          $unsigned(wire15) : (reg17 ?
                              (8'ha6) : wire16)) ^ (~^$signed(reg7))),
                      wire2[(2'h2):(2'h2)]});
              reg22 <= (&($signed(($signed(wire0) >>> (8'ha2))) == ((!(reg8 >>> wire2)) == wire10[(2'h2):(2'h2)])));
              reg23 <= ((wire12 - wire10) ?
                  $unsigned((!($unsigned((8'hbf)) ?
                      $unsigned(wire3) : ((8'ha3) ?
                          wire14 : wire15)))) : (((wire15 | $signed(reg22)) < (wire14 ?
                      (reg21 >= wire1) : ((8'hb7) && (8'hb6)))) > (&(~reg7))));
            end
          else
            begin
              reg19 <= ($signed(wire15) ?
                  (reg20[(4'hc):(1'h1)] ?
                      wire14 : reg23) : {$unsigned(($unsigned(reg6) ?
                          wire0 : (wire16 <= wire14))),
                      (($signed(reg9) >= (~&reg7)) > $signed((~^wire0)))});
              reg20 <= ({$signed({((8'ha9) ^ (8'hae))}),
                      $unsigned($unsigned((~wire4)))} ?
                  $signed((~|(~^$signed(reg20)))) : reg22);
            end
        end
      else
        begin
          reg19 <= $signed(wire3);
          reg20 <= $signed($signed((wire10[(4'hb):(3'h5)] ?
              ((reg22 ? wire2 : (8'hbf)) ~^ wire2) : {(~&reg9), reg18})));
          if ({$unsigned((^(^~(wire0 << wire15))))})
            begin
              reg21 <= wire13;
            end
          else
            begin
              reg21 <= $unsigned(wire4);
              reg22 <= ($signed(wire13) ? reg23 : (|reg7));
            end
          reg23 <= wire3;
          reg24 <= wire4[(1'h1):(1'h1)];
        end
      reg25 <= {reg22,
          $unsigned((^(((8'hb8) ? reg18 : (8'h9d)) ^ $signed(wire0))))};
    end
  assign wire26 = (($signed(reg17) != ({$signed(reg20),
                      $signed((8'hb8))} ^~ (-wire3[(4'ha):(4'h9)]))) ^ reg17);
  module27 #() modinst94 (wire93, clk, wire10, reg19, reg17, wire16, reg6);
  assign wire95 = reg17;
  assign wire96 = reg17[(1'h0):(1'h0)];
  assign wire97 = {(((~|(&wire93)) || (((8'hbc) & reg9) ?
                              {wire10} : {wire12, (8'hb5)})) ?
                          $signed($signed(wire2[(2'h3):(2'h2)])) : (wire0 << (wire12 | wire2[(4'hb):(3'h4)]))),
                      (($unsigned($unsigned(reg8)) > wire1) - $signed(({wire2} ^ $unsigned(reg20))))};
  assign wire98 = {{wire4}};
  assign wire99 = $unsigned(wire98[(4'h9):(3'h6)]);
  assign wire100 = (wire13 <= $signed({((wire10 ?
                           (8'hb5) : wire99) == reg19[(2'h3):(1'h0)]),
                       {{wire96, (8'ha9)}, $signed(wire12)}}));
  always
    @(posedge clk) begin
      reg101 <= wire0;
      reg102 <= wire12[(3'h5):(3'h4)];
      reg103 <= $signed((~($signed((wire14 & wire3)) << $unsigned((reg21 ?
          wire13 : wire3)))));
      if ({$signed($unsigned($unsigned(reg102)))})
        begin
          reg104 <= (^(wire5 && (wire12[(3'h5):(1'h1)] ?
              (!reg103) : $signed(((8'h9f) ? reg21 : reg103)))));
          if ({$unsigned($signed((^(reg7 >> wire11)))), wire5})
            begin
              reg105 <= (~|(($unsigned((wire1 ? wire13 : reg17)) ?
                  (&{wire100,
                      (8'hb9)}) : $signed({wire11})) << wire97[(4'hd):(2'h3)]));
              reg106 <= wire4;
              reg107 <= ($signed(reg101[(5'h11):(1'h1)]) <<< $unsigned(wire13));
              reg108 <= ($unsigned((reg19[(5'h10):(4'hc)] >> (!$unsigned(wire100)))) ?
                  (~^(~|{(^wire99),
                      (wire12 > wire95)})) : $unsigned(((((8'ha2) >> (8'hb4)) == wire98) ?
                      reg8[(1'h0):(1'h0)] : (reg19 ?
                          $unsigned(reg7) : ((8'haa) & wire98)))));
            end
          else
            begin
              reg105 <= reg8[(3'h4):(1'h0)];
              reg106 <= wire98[(1'h0):(1'h0)];
              reg107 <= $unsigned(($signed(((~^wire3) ~^ {reg6,
                  wire13})) < wire10[(3'h6):(2'h2)]));
              reg108 <= (reg106 ^ $signed(((reg101 ?
                      $signed(reg107) : ((8'ha8) ? wire10 : (8'had))) ?
                  wire1 : (|{reg101}))));
            end
          reg109 <= $signed((((~(|reg6)) - (~&((8'hb8) | wire2))) > reg104[(4'h8):(1'h0)]));
          reg110 <= (reg108[(2'h2):(1'h1)] ^~ $signed({wire26[(1'h1):(1'h0)],
              $signed((wire26 ? reg21 : reg21))}));
          if (wire98[(5'h10):(4'ha)])
            begin
              reg111 <= reg105[(1'h1):(1'h1)];
              reg112 <= $signed((+(wire93[(3'h6):(3'h5)] >>> (8'ha1))));
              reg113 <= $signed($signed($unsigned($signed({reg18}))));
            end
          else
            begin
              reg111 <= ((((8'hb5) ?
                      {((7'h44) != wire99)} : (&wire3[(3'h6):(2'h3)])) < $unsigned($unsigned((~(7'h43))))) ?
                  (((~&(reg7 ?
                          reg113 : reg106)) ~^ $unsigned($unsigned(reg24))) ?
                      reg108[(4'hb):(4'h8)] : (wire0[(1'h0):(1'h0)] ^~ (8'hb8))) : $unsigned((~^(~|wire14))));
              reg112 <= $signed(({(reg108 ?
                          (wire10 <= wire93) : (reg103 ? wire96 : wire2))} ?
                  (((reg20 ?
                      wire93 : reg111) | $unsigned(reg24)) >> reg24[(3'h6):(3'h5)]) : (reg105[(3'h4):(2'h3)] ?
                      (wire3[(2'h3):(1'h1)] & $signed(reg113)) : wire97[(3'h5):(3'h4)])));
            end
        end
      else
        begin
          reg104 <= $signed($signed(reg22));
          if (reg24[(3'h7):(3'h4)])
            begin
              reg105 <= $unsigned(({$signed($signed(reg9)), {$signed(wire4)}} ?
                  $signed((wire12[(3'h6):(3'h5)] ?
                      ((8'hb0) & reg24) : (-reg102))) : $unsigned((-$unsigned(reg23)))));
              reg106 <= $unsigned({($unsigned($signed(reg103)) ~^ $signed(reg25[(1'h0):(1'h0)]))});
              reg107 <= ((((reg22[(3'h7):(3'h5)] && reg25) >= ($signed(reg110) ?
                          reg8 : (&wire10))) ?
                      reg7 : (~^(wire4[(4'h9):(3'h6)] ?
                          (-reg18) : (wire4 ? wire12 : wire100)))) ?
                  reg24 : wire12);
            end
          else
            begin
              reg105 <= $unsigned((~|reg9));
              reg106 <= (($signed((reg112 << $unsigned(reg107))) ?
                  ($signed((reg101 <<< reg111)) >> ($signed(reg18) ?
                      $unsigned(wire0) : ((8'hb0) ^ wire100))) : (|((wire96 >>> wire100) ?
                      wire2 : wire0))) + (!((+$signed(reg18)) ?
                  $signed($unsigned((8'hbe))) : $unsigned($signed(wire11)))));
              reg107 <= reg25;
              reg108 <= {$signed($signed(({reg101, reg101} ?
                      (7'h41) : $signed(wire93))))};
              reg109 <= (8'hac);
            end
          reg110 <= (wire3 ?
              ($signed(($unsigned(wire1) ?
                      (wire26 >= wire96) : $unsigned(wire96))) ?
                  $unsigned(({reg112} ?
                      ((8'hb7) >= reg110) : $signed(reg6))) : reg21) : ($signed(((reg109 ?
                      reg101 : reg21) < reg101)) ?
                  reg101 : $signed($unsigned((reg20 ? reg101 : wire100)))));
        end
    end
  assign wire114 = $signed((($signed($unsigned(reg101)) < wire0[(2'h3):(1'h0)]) < ({wire3[(4'ha):(1'h0)]} ~^ $signed(wire100))));
  assign wire115 = ({(^$unsigned($signed(wire98))),
                       reg25} - (reg7[(3'h4):(1'h1)] ?
                       ({reg17} < $signed(reg21[(4'h9):(2'h2)])) : (+((~|wire14) && ((8'h9e) + wire0)))));
  assign wire116 = ($signed(reg102) ?
                       $signed((((reg6 ?
                               reg112 : reg22) | wire99[(3'h5):(2'h2)]) ?
                           ((reg109 ? reg106 : wire14) < (reg24 ?
                               wire99 : reg22)) : wire10[(1'h1):(1'h1)])) : (reg25[(4'hf):(4'hd)] * (&(~|$signed((7'h42))))));
endmodule

module module27  (y, clk, wire28, wire29, wire30, wire31, wire32);
  output wire [(32'h1e9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire28;
  input wire signed [(5'h13):(1'h0)] wire29;
  input wire signed [(2'h2):(1'h0)] wire30;
  input wire signed [(4'h8):(1'h0)] wire31;
  input wire [(5'h10):(1'h0)] wire32;
  wire [(3'h6):(1'h0)] wire92;
  wire [(3'h4):(1'h0)] wire73;
  wire [(4'he):(1'h0)] wire72;
  wire signed [(5'h14):(1'h0)] wire70;
  wire signed [(4'hd):(1'h0)] wire69;
  wire signed [(5'h12):(1'h0)] wire55;
  wire [(5'h11):(1'h0)] wire33;
  wire signed [(5'h11):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire35;
  wire [(5'h10):(1'h0)] wire36;
  wire [(4'hf):(1'h0)] wire37;
  wire [(4'hc):(1'h0)] wire53;
  reg signed [(5'h10):(1'h0)] reg91 = (1'h0);
  reg [(4'he):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg89 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg88 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg86 = (1'h0);
  reg [(5'h11):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg84 = (1'h0);
  reg [(4'hf):(1'h0)] reg83 = (1'h0);
  reg [(4'h8):(1'h0)] reg82 = (1'h0);
  reg [(4'h8):(1'h0)] reg81 = (1'h0);
  reg [(3'h4):(1'h0)] reg80 = (1'h0);
  reg [(4'h9):(1'h0)] reg79 = (1'h0);
  reg [(2'h2):(1'h0)] reg78 = (1'h0);
  reg [(5'h12):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg75 = (1'h0);
  reg [(4'hb):(1'h0)] reg74 = (1'h0);
  reg [(4'hf):(1'h0)] reg71 = (1'h0);
  reg [(3'h5):(1'h0)] reg68 = (1'h0);
  reg [(2'h2):(1'h0)] reg67 = (1'h0);
  reg [(4'h9):(1'h0)] reg66 = (1'h0);
  reg [(4'ha):(1'h0)] reg65 = (1'h0);
  reg [(5'h15):(1'h0)] reg64 = (1'h0);
  reg [(3'h7):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg61 = (1'h0);
  reg [(4'hc):(1'h0)] reg60 = (1'h0);
  reg [(4'he):(1'h0)] reg59 = (1'h0);
  reg [(4'hf):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg56 = (1'h0);
  assign y = {wire92,
                 wire73,
                 wire72,
                 wire70,
                 wire69,
                 wire55,
                 wire33,
                 wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire53,
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
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg71,
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
                 (1'h0)};
  assign wire33 = (wire31[(3'h5):(3'h5)] ?
                      (+(({wire29} ? wire30 : (8'hb5)) ?
                          $signed((wire28 != wire29)) : $unsigned($unsigned(wire32)))) : $signed(wire31));
  assign wire34 = wire28;
  assign wire35 = $unsigned((wire30[(2'h2):(1'h1)] ?
                      $signed({(wire33 ? wire33 : wire29),
                          (wire28 ?
                              wire31 : wire33)}) : wire28[(1'h0):(1'h0)]));
  assign wire36 = $unsigned((wire28[(1'h0):(1'h0)] ? (8'hb2) : wire31));
  assign wire37 = wire35[(1'h1):(1'h0)];
  module38 #() modinst54 (wire53, clk, wire31, wire33, wire35, wire37, wire36);
  assign wire55 = wire34;
  always
    @(posedge clk) begin
      reg56 <= ($unsigned((~{(-wire36),
          (wire36 ? (8'h9c) : (8'ha2))})) != wire34[(2'h3):(2'h2)]);
      if ($unsigned(wire34[(5'h11):(4'ha)]))
        begin
          reg57 <= ((-wire32[(4'h8):(4'h8)]) < $unsigned(wire29));
          reg58 <= $unsigned($unsigned($unsigned(wire34)));
        end
      else
        begin
          reg57 <= ($signed(({wire55[(1'h1):(1'h0)],
              wire29} <<< $unsigned({wire36,
              wire37}))) << (&($unsigned((wire33 < (8'hb9))) ?
              (^wire37[(3'h4):(2'h2)]) : $signed(wire30[(1'h0):(1'h0)]))));
          if ({$signed(wire55[(4'hd):(3'h5)])})
            begin
              reg58 <= (!(reg57 ? wire55 : wire30));
              reg59 <= $signed(($unsigned(wire30) <<< $signed((&(~wire28)))));
            end
          else
            begin
              reg58 <= ({wire53[(2'h2):(1'h1)]} < wire55);
              reg59 <= $unsigned(reg57[(2'h3):(2'h2)]);
              reg60 <= (|wire28[(1'h0):(1'h0)]);
              reg61 <= $unsigned({(!(^~wire29[(4'hc):(3'h6)])),
                  (($signed(wire35) - (^~wire55)) ?
                      ({wire55} + $unsigned(wire36)) : $unsigned((wire37 ?
                          wire31 : wire55)))});
            end
          reg62 <= (~|reg60);
          reg63 <= (+((&(wire30[(2'h2):(1'h1)] == wire29[(5'h11):(4'h9)])) <= wire32[(3'h4):(2'h3)]));
          if (($signed($unsigned(wire33[(3'h4):(1'h0)])) ?
              $signed((reg63 + ({wire29} <= $signed(wire35)))) : (^((wire31[(3'h7):(3'h6)] ?
                  $unsigned(wire53) : reg61[(1'h1):(1'h0)]) & wire30))))
            begin
              reg64 <= $unsigned($unsigned(wire36[(3'h6):(3'h5)]));
              reg65 <= $unsigned($unsigned({((reg59 - wire35) ?
                      reg58[(1'h0):(1'h0)] : $signed(wire30))}));
              reg66 <= $signed((^~(~|($unsigned(wire55) ?
                  $unsigned(reg61) : ((7'h41) * reg65)))));
              reg67 <= ((!$signed($signed(reg65[(3'h5):(1'h0)]))) ?
                  reg59[(1'h0):(1'h0)] : (^wire34[(4'hf):(2'h2)]));
              reg68 <= (($signed((wire53[(4'h9):(3'h4)] >= $signed(reg61))) != wire53[(4'hb):(4'hb)]) ?
                  {((~&wire29[(4'hc):(4'h8)]) ?
                          (~|$signed((8'hb3))) : ($signed(wire30) >> $unsigned((8'h9c))))} : {reg60});
            end
          else
            begin
              reg64 <= reg56[(1'h1):(1'h1)];
              reg65 <= (wire55 || ((~(+reg60[(2'h3):(1'h0)])) ?
                  (($signed(wire32) || $signed(wire37)) ?
                      $unsigned($signed(reg56)) : (reg61 ^ wire35)) : $unsigned($unsigned(reg62[(4'hb):(3'h4)]))));
            end
        end
    end
  assign wire69 = ({((~|(reg59 ? reg59 : wire53)) || {reg64,
                          $unsigned(wire31)})} >> $unsigned((^(wire35[(5'h14):(4'ha)] ?
                      (reg57 + wire37) : {wire53, reg61}))));
  assign wire70 = wire34;
  always
    @(posedge clk) begin
      reg71 <= wire53;
    end
  assign wire72 = $unsigned({(~&((~(8'ha4)) ? wire32 : (wire53 == wire55)))});
  assign wire73 = wire33;
  always
    @(posedge clk) begin
      if (wire30)
        begin
          reg74 <= $unsigned(wire28);
        end
      else
        begin
          reg74 <= wire37[(4'hb):(2'h3)];
          reg75 <= {$signed(($signed(wire31) ?
                  reg61[(1'h0):(1'h0)] : (|$signed(wire73))))};
          if ($unsigned(($unsigned((^wire70[(5'h10):(4'hf)])) ?
              (reg60 - reg65) : (~&((reg68 ? (8'hb1) : wire36) ?
                  wire34[(3'h7):(3'h6)] : $unsigned(wire55))))))
            begin
              reg76 <= reg67[(2'h2):(1'h0)];
              reg77 <= ($signed(reg76) ?
                  (~^$unsigned((wire30 >= wire69[(4'h8):(3'h5)]))) : $signed((+((reg66 ?
                      reg65 : reg75) * (reg58 ? wire35 : reg63)))));
              reg78 <= ($signed({((^reg64) ?
                          reg65[(4'ha):(1'h1)] : reg60[(3'h7):(2'h3)]),
                      (wire55 ? (8'hac) : $signed(reg63))}) ?
                  ({$signed(reg67)} ?
                      wire72 : (^~(!(8'hbb)))) : {($unsigned(wire32) ?
                          {(wire28 << wire70),
                              $unsigned(reg60)} : (wire72[(4'hc):(4'ha)] >> (wire37 ?
                              (8'hbc) : reg57))),
                      reg77[(5'h11):(1'h1)]});
            end
          else
            begin
              reg76 <= $signed(((|{wire35}) ?
                  wire32[(4'hd):(4'h9)] : $unsigned({$unsigned(wire37)})));
              reg77 <= (~|reg74[(3'h6):(1'h1)]);
              reg78 <= ((((reg60[(1'h0):(1'h0)] | wire73) >>> (((8'h9c) && reg58) ?
                      {reg77, reg57} : $unsigned(reg68))) ?
                  (~$unsigned((reg65 && reg61))) : $signed(wire69)) != (^(|reg76[(3'h4):(1'h1)])));
            end
          if ({wire33,
              ($unsigned(((reg71 ?
                  wire28 : wire55) | $unsigned(reg58))) ^~ (^($signed(wire34) ?
                  (reg71 ? reg75 : wire29) : (reg57 >>> (8'haa)))))})
            begin
              reg79 <= (!reg56);
              reg80 <= reg79;
              reg81 <= reg75[(1'h1):(1'h0)];
            end
          else
            begin
              reg79 <= (~&{reg67[(1'h1):(1'h0)]});
              reg80 <= $unsigned(wire32[(3'h4):(2'h3)]);
            end
        end
      if (wire53[(1'h1):(1'h1)])
        begin
          reg82 <= ((wire30[(1'h0):(1'h0)] ?
              (7'h40) : $unsigned($signed(wire30))) ^~ {{((reg62 | (8'hbe)) ?
                      $unsigned(wire29) : (~^reg75)),
                  ($unsigned(wire37) ? (wire32 >>> wire31) : $signed(reg74))}});
          if (((((reg60 ? $unsigned(reg58) : (reg57 >>> wire34)) ?
                      $signed((~wire53)) : {$unsigned(wire29)}) ?
                  ((+$signed((8'ha3))) && {wire72[(3'h6):(1'h0)],
                      reg66[(2'h3):(1'h1)]}) : ({wire31[(2'h2):(2'h2)]} ?
                      $signed({wire36, wire69}) : reg56[(4'ha):(3'h4)])) ?
              (reg67 <= (reg75[(1'h0):(1'h0)] < reg59[(4'ha):(3'h5)])) : reg81[(3'h4):(2'h3)]))
            begin
              reg83 <= $unsigned(($signed(($signed(wire33) ?
                      {(7'h44)} : {wire55, reg63})) ?
                  reg58 : $signed(({wire37, reg68} ?
                      ((8'ha2) ^~ wire37) : (wire35 != reg68)))));
              reg84 <= (!(!$unsigned($unsigned(reg61))));
              reg85 <= (&wire34[(2'h3):(2'h2)]);
              reg86 <= ($unsigned(($signed($signed(reg57)) ~^ reg80[(1'h1):(1'h0)])) < (+reg77[(4'h8):(1'h1)]));
            end
          else
            begin
              reg83 <= (~|(&(8'ha1)));
            end
          if ((reg60[(4'hc):(3'h6)] >> reg62))
            begin
              reg87 <= $signed(reg74[(4'hb):(1'h0)]);
              reg88 <= wire28;
            end
          else
            begin
              reg87 <= $unsigned(reg86);
              reg88 <= (~&(^~$signed($unsigned(wire72))));
              reg89 <= (!reg76);
              reg90 <= (^$signed(reg82));
            end
        end
      else
        begin
          reg82 <= $signed((&(((~|reg84) ?
              $signed(reg74) : (reg75 ? (8'hb3) : reg90)) ^ wire30)));
          reg83 <= (~^($signed(reg87[(3'h5):(1'h1)]) ?
              {$unsigned(((8'hae) ~^ wire35)), reg66} : $unsigned((!{reg68,
                  (8'h9d)}))));
        end
      reg91 <= reg68;
    end
  assign wire92 = reg61[(2'h3):(1'h0)];
endmodule

module module38  (y, clk, wire43, wire42, wire41, wire40, wire39);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire43;
  input wire [(5'h11):(1'h0)] wire42;
  input wire [(5'h14):(1'h0)] wire41;
  input wire [(4'hf):(1'h0)] wire40;
  input wire signed [(5'h10):(1'h0)] wire39;
  wire signed [(2'h3):(1'h0)] wire52;
  wire [(5'h15):(1'h0)] wire51;
  wire [(4'h9):(1'h0)] wire48;
  wire signed [(4'hb):(1'h0)] wire47;
  wire signed [(4'hd):(1'h0)] wire46;
  wire [(4'hb):(1'h0)] wire45;
  wire [(4'hd):(1'h0)] wire44;
  reg [(3'h6):(1'h0)] reg50 = (1'h0);
  reg [(3'h7):(1'h0)] reg49 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 reg50,
                 reg49,
                 (1'h0)};
  assign wire44 = (+({(^wire40),
                      ((!wire43) ?
                          (|wire40) : (wire40 ? wire41 : wire39))} + ((7'h44) ?
                      ((!wire43) ?
                          wire39 : $unsigned(wire40)) : $signed($unsigned((8'hb5))))));
  assign wire45 = ((wire43[(2'h2):(1'h0)] ^~ $signed((-{wire43,
                      wire44}))) >> $unsigned($signed((^{wire41}))));
  assign wire46 = (|(|(~|$signed({wire40}))));
  assign wire47 = wire42[(4'h9):(3'h4)];
  assign wire48 = wire47;
  always
    @(posedge clk) begin
      reg49 <= wire44;
      reg50 <= $unsigned(wire48[(1'h1):(1'h1)]);
    end
  assign wire51 = (&$unsigned((~|(^(wire39 ? wire45 : wire46)))));
  assign wire52 = $unsigned(((+({reg50} > $unsigned((8'h9f)))) >= $signed($unsigned($signed(wire48)))));
endmodule
