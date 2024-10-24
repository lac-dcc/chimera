module top
#(parameter param116 = ((-(~&((~&(8'hbe)) <= {(8'hba), (8'ha1)}))) ? ((((~^(8'hb1)) ? (+(7'h41)) : (~(8'hb2))) || (|((8'ha1) ? (8'hb1) : (8'hb4)))) <= {{((8'hac) ~^ (7'h41))}}) : (&((|((8'ha4) ? (8'haf) : (8'hb1))) >= (((8'hbd) ? (8'hb7) : (8'ha1)) ? ((8'hb1) ? (8'hb8) : (8'ha9)) : ((8'ha9) ? (8'hb5) : (8'hb2)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire17;
  wire signed [(4'hf):(1'h0)] wire18;
  wire [(3'h7):(1'h0)] wire19;
  wire [(4'hf):(1'h0)] wire23;
  wire signed [(5'h10):(1'h0)] wire114;
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(4'h9):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire23,
                 wire114,
                 reg22,
                 reg21,
                 reg20,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = ((~|(wire3[(3'h5):(2'h2)] * wire4)) <= (!$unsigned(wire0[(3'h6):(2'h2)])));
  assign wire6 = {(wire5 ?
                         $signed((wire5 ?
                             wire0 : $unsigned(wire5))) : $signed($signed((wire1 ?
                             wire5 : (8'ha3)))))};
  always
    @(posedge clk) begin
      reg7 <= $unsigned(wire2);
      if (wire1[(2'h2):(1'h0)])
        begin
          reg8 <= {$unsigned($unsigned((8'haf))),
              $signed((-(~|wire6[(3'h7):(2'h2)])))};
          reg9 <= wire4[(1'h1):(1'h1)];
        end
      else
        begin
          if (((-wire2[(4'h9):(4'h9)]) >= wire0))
            begin
              reg8 <= reg9;
              reg9 <= wire4[(2'h2):(1'h1)];
              reg10 <= $signed((reg8 ?
                  {wire2[(1'h0):(1'h0)]} : reg7[(2'h2):(1'h1)]));
            end
          else
            begin
              reg8 <= $unsigned((+$signed($signed(reg8))));
            end
        end
      if (($signed(((~wire6[(3'h6):(3'h4)]) == (~$signed(reg8)))) - ($unsigned((-$signed(wire0))) | (($signed(reg9) ?
              reg8 : $signed(reg10)) ?
          ((reg7 | reg9) ?
              wire3 : (reg7 == wire5)) : $signed($signed(wire5))))))
        begin
          if (wire4[(2'h2):(2'h2)])
            begin
              reg11 <= wire3;
              reg12 <= $unsigned($signed($signed(($signed(reg10) > reg7))));
            end
          else
            begin
              reg11 <= reg11;
              reg12 <= (~&{wire3[(3'h5):(2'h3)]});
              reg13 <= (~$signed(reg10));
              reg14 <= reg7[(3'h6):(3'h4)];
            end
        end
      else
        begin
          reg11 <= ({({(reg14 ? reg11 : reg13)} != {wire4})} ?
              (8'hb8) : (~{((8'h9e) ?
                      (wire1 ? reg12 : wire3) : wire0[(1'h0):(1'h0)]),
                  {reg13, $unsigned(reg8)}}));
          reg12 <= (((&((!wire0) < $signed(wire4))) ?
              {$unsigned((reg14 * reg8))} : (~|$signed((wire6 * wire0)))) && (((reg7[(3'h5):(1'h0)] + (~reg12)) + ((reg13 <= wire5) <<< $unsigned(wire5))) ?
              (!$signed(wire6)) : (~^(8'haa))));
          reg13 <= {(wire0 ? wire3 : (^$unsigned({reg14}))), $signed(reg9)};
          reg14 <= ((|(wire3[(1'h0):(1'h0)] ~^ $unsigned(((8'hac) ?
                  wire0 : reg7)))) ?
              $unsigned($unsigned(wire2[(3'h4):(2'h3)])) : {$signed($unsigned(wire2)),
                  (($signed(wire4) << (reg10 ^ reg9)) ~^ wire5[(3'h7):(2'h3)])});
        end
      reg15 <= {$unsigned($unsigned(((reg8 ?
              (7'h42) : wire5) < reg13[(4'hc):(2'h3)]))),
          wire6};
    end
  assign wire16 = (~($unsigned(((|wire2) ? (reg9 < wire1) : $signed((8'ha1)))) ?
                      wire5 : (~reg8[(2'h2):(1'h0)])));
  assign wire17 = $unsigned((+($signed(reg15[(1'h1):(1'h0)]) && (8'h9e))));
  assign wire18 = $signed($unsigned(($signed($unsigned(reg7)) ?
                      $unsigned((|reg8)) : (~wire16[(1'h1):(1'h0)]))));
  assign wire19 = (7'h41);
  always
    @(posedge clk) begin
      reg20 <= {(wire2 ^~ {$signed((7'h44))})};
      reg21 <= {wire5, $unsigned(reg13[(3'h5):(3'h5)])};
      reg22 <= $signed((wire6[(3'h7):(3'h6)] ?
          (((!(8'hba)) ?
              (^wire0) : {wire2,
                  wire3}) ~^ $unsigned($unsigned(wire3))) : (~&(~|$signed(reg13)))));
    end
  assign wire23 = $signed((^~reg22[(1'h0):(1'h0)]));
  module24 #() modinst115 (.wire28(reg11), .wire26(wire17), .wire27(reg10), .clk(clk), .y(wire114), .wire29(reg22), .wire25(reg14));
endmodule

module module24
#(parameter param112 = (((&(^~((8'h9f) != (8'hb3)))) ? ((8'haa) ~^ (((8'ha8) == (8'hab)) ? ((8'hbf) ? (8'hac) : (8'hae)) : ((7'h44) ~^ (8'h9e)))) : (7'h42)) ? {(~&(((8'hb6) >> (8'h9f)) != ((8'hb9) >>> (8'hba))))} : ((({(8'h9e), (8'hae)} == (~|(8'hb2))) ? (((8'h9d) ? (8'hab) : (7'h40)) != (^~(8'ha9))) : (((8'ha4) ? (8'hb1) : (7'h41)) ? (^(8'hbb)) : ((8'haa) << (7'h44)))) ? {({(8'h9c)} >>> (|(8'hb5)))} : ({((8'hba) < (8'ha9)), {(8'hb4), (8'haa)}} << (((8'hb9) ? (8'hb7) : (8'hb4)) | {(8'hb6), (7'h40)})))), 
parameter param113 = (-(((~^{param112, (8'hb6)}) ? ((param112 > param112) | (param112 ? param112 : param112)) : ((&param112) > (~|param112))) ? (((param112 ? (8'haa) : (8'hae)) ? (param112 ^ (8'hb2)) : param112) - {{param112}}) : (~^((param112 ? param112 : param112) ? param112 : param112)))))
(y, clk, wire29, wire28, wire27, wire26, wire25);
  output wire [(32'h200):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire29;
  input wire signed [(4'ha):(1'h0)] wire28;
  input wire signed [(3'h4):(1'h0)] wire27;
  input wire signed [(5'h12):(1'h0)] wire26;
  input wire signed [(4'h9):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire96;
  wire signed [(5'h14):(1'h0)] wire95;
  wire signed [(4'h8):(1'h0)] wire94;
  wire signed [(4'hd):(1'h0)] wire93;
  wire signed [(4'he):(1'h0)] wire92;
  wire [(4'hb):(1'h0)] wire76;
  wire signed [(2'h2):(1'h0)] wire75;
  wire signed [(4'hc):(1'h0)] wire74;
  wire [(4'hb):(1'h0)] wire73;
  wire signed [(4'h8):(1'h0)] wire71;
  wire signed [(3'h5):(1'h0)] wire70;
  wire [(4'hb):(1'h0)] wire69;
  wire [(3'h4):(1'h0)] wire67;
  wire [(5'h14):(1'h0)] wire30;
  reg signed [(4'h9):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg110 = (1'h0);
  reg signed [(4'he):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg108 = (1'h0);
  reg [(2'h3):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg105 = (1'h0);
  reg [(4'hb):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg103 = (1'h0);
  reg [(2'h2):(1'h0)] reg102 = (1'h0);
  reg [(4'hd):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg100 = (1'h0);
  reg [(3'h6):(1'h0)] reg99 = (1'h0);
  reg [(4'he):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg91 = (1'h0);
  reg [(4'hd):(1'h0)] reg90 = (1'h0);
  reg [(5'h11):(1'h0)] reg89 = (1'h0);
  reg [(5'h10):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg87 = (1'h0);
  reg [(4'hc):(1'h0)] reg86 = (1'h0);
  reg [(5'h11):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg84 = (1'h0);
  reg [(4'hc):(1'h0)] reg83 = (1'h0);
  reg [(5'h15):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg80 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg79 = (1'h0);
  reg [(2'h3):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg72 = (1'h0);
  assign y = {wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire71,
                 wire70,
                 wire69,
                 wire67,
                 wire30,
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
                 reg72,
                 (1'h0)};
  assign wire30 = (($unsigned((((8'hb9) << (7'h43)) ?
                              (wire25 ? wire29 : wire29) : $unsigned(wire25))) ?
                          (!{$unsigned(wire27),
                              wire29}) : wire29[(4'h8):(3'h4)]) ?
                      $unsigned($signed((+wire29[(4'hc):(2'h3)]))) : (7'h43));
  module31 #() modinst68 (.wire33(wire26), .wire34(wire28), .y(wire67), .wire35(wire25), .clk(clk), .wire32(wire30));
  assign wire69 = (^~(7'h40));
  assign wire70 = (^(wire28 >= ({$signed(wire28),
                      (-wire30)} ^ wire28[(4'h9):(2'h2)])));
  assign wire71 = wire67[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg72 <= {$unsigned(({((8'haf) & wire28)} < ((!wire28) >= $signed(wire70))))};
    end
  assign wire73 = (~^((wire70 ?
                      wire67 : ((wire28 ? (7'h41) : wire30) + (wire70 ?
                          wire67 : wire29))) < (({(8'h9c)} - wire69[(1'h0):(1'h0)]) ?
                      $unsigned((reg72 * wire30)) : (!(wire26 ?
                          (8'hb8) : (7'h43))))));
  assign wire74 = $signed(($unsigned((wire26[(2'h2):(1'h0)] >> wire28)) ?
                      (&((wire67 ?
                          wire67 : wire73) * wire28[(3'h5):(1'h1)])) : (wire30[(3'h4):(3'h4)] | $unsigned(wire27))));
  assign wire75 = {((^~wire70[(3'h4):(1'h1)]) ?
                          $unsigned(((wire27 ? wire28 : wire69) && ((8'hba) ?
                              wire26 : wire70))) : (!wire26)),
                      (^~((+$unsigned(wire25)) ?
                          (((8'hbe) | wire28) < (8'hab)) : wire74[(2'h3):(1'h1)]))};
  assign wire76 = $signed((wire70[(3'h5):(2'h2)] ?
                      reg72[(2'h3):(1'h1)] : (wire26 ? wire30 : wire69)));
  always
    @(posedge clk) begin
      if ($unsigned((wire74[(4'h8):(3'h6)] * ((^$signed(wire27)) ?
          wire27[(2'h3):(2'h3)] : (wire28 ? (&(8'ha8)) : (|reg72))))))
        begin
          if ($signed($signed(wire74)))
            begin
              reg77 <= wire26;
              reg78 <= $unsigned({wire76,
                  {wire30[(3'h7):(3'h7)], (~^(wire71 ? reg77 : wire28))}});
              reg79 <= ((+wire29[(4'h8):(3'h5)]) != wire69);
              reg80 <= (~|($unsigned(wire69[(4'hb):(2'h2)]) ^ {(((8'hb8) | wire74) ?
                      reg79 : (reg79 >> wire69))}));
              reg81 <= ((wire70[(3'h4):(1'h0)] ?
                  ($signed((~|reg77)) ?
                      wire26[(5'h11):(3'h5)] : {$unsigned(reg78)}) : $signed(({wire26} ?
                      $unsigned((8'hb4)) : {(8'hab)}))) <<< wire75[(1'h0):(1'h0)]);
            end
          else
            begin
              reg77 <= $unsigned({{$signed($signed(wire67))}});
              reg78 <= reg72[(1'h0):(1'h0)];
              reg79 <= wire67;
              reg80 <= $unsigned(wire75[(1'h1):(1'h0)]);
              reg81 <= wire73;
            end
          if (($unsigned((wire29 ?
              (^$signed((8'hb4))) : {{reg80,
                      reg78}})) | (~&(($unsigned((8'hb4)) ?
                  (wire28 ? wire29 : reg72) : wire73) ?
              (+(wire71 ? reg79 : (8'hb9))) : {$signed(wire75),
                  $signed((8'hb0))}))))
            begin
              reg82 <= (wire27 ?
                  {$signed((~(~|reg80))),
                      (~|$unsigned((^~reg78)))} : $signed($unsigned($signed((wire28 <= reg78)))));
              reg83 <= reg72;
              reg84 <= wire74[(2'h2):(2'h2)];
              reg85 <= wire28[(2'h2):(1'h1)];
            end
          else
            begin
              reg82 <= ($unsigned(reg80) * (8'hb0));
              reg83 <= wire30;
            end
          reg86 <= $signed(reg85);
          if ((!wire69))
            begin
              reg87 <= wire27;
              reg88 <= {$signed($unsigned($unsigned((reg72 ? reg77 : wire25)))),
                  $signed((^((&(8'hbf)) ^ (reg85 ? wire71 : wire75))))};
              reg89 <= {{wire75[(2'h2):(2'h2)]}};
              reg90 <= (wire26 ?
                  (wire30[(4'hb):(3'h7)] <<< (wire74[(4'ha):(3'h5)] ?
                      ($signed(reg78) <= (reg83 ?
                          wire74 : wire71)) : $signed({reg87}))) : {$signed($unsigned({(8'hb5),
                          reg77}))});
              reg91 <= $signed($unsigned(reg89[(3'h7):(2'h3)]));
            end
          else
            begin
              reg87 <= {(+$unsigned(({wire26} < (reg88 ? wire25 : wire73))))};
              reg88 <= ($unsigned($unsigned($unsigned((|wire26)))) < {wire25[(2'h3):(1'h0)],
                  (~|(reg89[(1'h0):(1'h0)] > (|wire25)))});
              reg89 <= ((8'hb3) == $signed(((8'ha6) || $signed($unsigned(reg86)))));
              reg90 <= ((!(reg90[(1'h0):(1'h0)] ?
                  (^$signed(wire25)) : wire25)) < $unsigned($unsigned((wire70 ?
                  $unsigned(wire73) : wire74))));
            end
        end
      else
        begin
          if (reg85)
            begin
              reg77 <= $unsigned(($unsigned((((8'hba) || wire75) ^ (&reg82))) ?
                  wire29 : (wire75[(1'h0):(1'h0)] | reg84[(4'ha):(4'h9)])));
              reg78 <= {$unsigned((!{wire74, $signed(reg86)})),
                  (($signed((reg90 >>> reg88)) ?
                      $signed(reg81[(4'hc):(4'h8)]) : {(wire70 ? reg84 : reg85),
                          $unsigned(reg77)}) - reg87[(1'h1):(1'h0)])};
            end
          else
            begin
              reg77 <= reg91;
              reg78 <= reg77;
            end
          reg79 <= reg84;
          reg80 <= $unsigned(wire69[(2'h2):(1'h1)]);
          reg81 <= $unsigned((reg90 == reg90));
        end
    end
  assign wire92 = {(~wire70),
                      $signed(($unsigned($signed(wire71)) >= {reg84,
                          (wire70 < reg87)}))};
  assign wire93 = ((reg81 ?
                          ($signed($unsigned((8'hab))) - (7'h41)) : reg86[(3'h7):(3'h4)]) ?
                      (+reg83) : (^(wire69[(3'h5):(3'h4)] & $unsigned($signed(wire71)))));
  assign wire94 = $signed((wire73[(4'hb):(1'h1)] | ($unsigned($unsigned(wire70)) ?
                      reg88 : (((8'hb3) ? (7'h43) : wire28) >= (8'hab)))));
  assign wire95 = ($signed(wire69[(2'h3):(2'h2)]) >>> {{($signed(wire25) > (wire93 ?
                              (8'hb7) : (7'h41)))},
                      ({(wire28 >> reg81)} ?
                          reg81 : {((8'hb7) ? reg83 : wire67), {reg77}})});
  assign wire96 = $unsigned($signed(reg89[(3'h6):(1'h1)]));
  always
    @(posedge clk) begin
      if ((8'hac))
        begin
          if (((|(reg87 ?
                  $unsigned(reg80) : $unsigned(reg82[(5'h12):(4'hb)]))) ?
              $signed(($signed(((8'hbd) <<< wire73)) + reg88[(4'hd):(2'h2)])) : $signed((($unsigned(wire29) << $unsigned(wire27)) ?
                  $signed(wire71[(4'h8):(3'h7)]) : wire67))))
            begin
              reg97 <= $signed($unsigned((~&({(8'ha1), (8'hbf)} ?
                  (|wire25) : $signed(wire93)))));
              reg98 <= ((~({wire93[(3'h4):(1'h1)]} ?
                  ((~wire25) != reg72[(2'h3):(1'h1)]) : $signed($signed(wire30)))) << reg82);
              reg99 <= (!(reg90 ? wire76[(1'h0):(1'h0)] : (!wire25)));
              reg100 <= wire27[(1'h0):(1'h0)];
              reg101 <= reg100[(3'h4):(2'h2)];
            end
          else
            begin
              reg97 <= $signed($signed($signed((reg88[(4'hb):(3'h7)] ?
                  $signed(reg87) : reg72))));
              reg98 <= ((^~(8'hb0)) - $signed(reg99));
              reg99 <= $signed((7'h40));
            end
          reg102 <= reg97[(3'h4):(3'h4)];
          reg103 <= $signed(wire96[(3'h5):(3'h5)]);
        end
      else
        begin
          reg97 <= {((reg91 + wire67) ?
                  wire25[(4'h8):(1'h1)] : ($signed(reg90) < (8'hb6))),
              (($unsigned(reg87) + reg81) == (((wire95 ?
                      reg89 : (8'hb0)) <<< (~reg97)) ?
                  {wire93[(4'h9):(3'h4)], $unsigned(reg88)} : ($signed(wire92) ?
                      (reg100 ? reg87 : (8'hbc)) : (reg83 ? reg72 : reg81))))};
          if ((+$signed(wire75[(1'h1):(1'h0)])))
            begin
              reg98 <= (reg90[(3'h5):(3'h4)] ?
                  {$unsigned($signed(((8'hb2) ? wire94 : reg90))),
                      (($signed(reg90) ? reg99 : $unsigned(wire71)) ?
                          (^reg99) : $signed((!reg79)))} : ((wire67 ?
                      $unsigned($signed(wire69)) : wire71[(3'h7):(3'h4)]) != ((-((7'h41) * reg85)) ?
                      (!$unsigned(wire29)) : (-reg100))));
              reg99 <= (~&wire67);
              reg100 <= ($signed((reg88 << $signed($unsigned((8'ha6))))) ?
                  wire94 : (reg102[(1'h1):(1'h1)] >> reg101));
              reg101 <= {$unsigned(reg88)};
            end
          else
            begin
              reg98 <= $signed((~|reg88));
              reg99 <= (^~(!reg97));
            end
          reg102 <= $signed({reg82[(3'h5):(3'h4)]});
          if (reg103[(1'h1):(1'h1)])
            begin
              reg103 <= $signed($unsigned($signed(($unsigned(wire71) ^ wire92[(1'h0):(1'h0)]))));
              reg104 <= (^~reg98[(4'hc):(3'h6)]);
              reg105 <= (&$signed(reg89));
              reg106 <= reg87;
              reg107 <= $signed(($signed(wire74[(3'h5):(3'h5)]) ?
                  wire74 : ($unsigned($unsigned(wire30)) > {(~&wire27),
                      (wire25 ? reg81 : reg89)})));
            end
          else
            begin
              reg103 <= $signed($signed((^~reg81[(1'h0):(1'h0)])));
              reg104 <= ({{reg78, (~&{reg79, reg104})},
                  $unsigned($signed({wire76,
                      reg81}))} & $signed($unsigned(((&(8'hbe)) ?
                  (reg84 * wire74) : $signed(reg107)))));
              reg105 <= $unsigned($unsigned((~&((-reg77) <<< reg103))));
              reg106 <= (wire70[(3'h5):(1'h1)] ?
                  $unsigned({((wire74 ?
                          wire92 : wire26) == reg97[(2'h3):(1'h0)])}) : (7'h42));
            end
        end
      if ($signed(wire75[(1'h0):(1'h0)]))
        begin
          reg108 <= wire92;
          reg109 <= $unsigned(reg78);
        end
      else
        begin
          reg108 <= ((^(($unsigned(reg104) ? (|reg82) : $signed(reg108)) ?
                  ((~reg88) > ((7'h44) ?
                      reg89 : wire70)) : $signed((reg105 || (8'ha6))))) ?
              wire92 : (reg91 ^~ reg78));
        end
      reg110 <= $unsigned((&wire73[(2'h2):(2'h2)]));
      reg111 <= reg89;
    end
endmodule

module module31
#(parameter param65 = (|{((((8'hbb) ? (7'h42) : (8'h9f)) ? ((8'hb3) ? (8'h9c) : (8'h9d)) : (~|(7'h41))) == (|((8'ha7) ? (8'hb4) : (7'h44)))), ((8'h9d) || (~^((8'ha5) * (8'hb1))))}), 
parameter param66 = ((~param65) ? (((param65 && (~|param65)) ? ({param65, param65} ? (param65 ? param65 : param65) : (param65 ? param65 : param65)) : param65) != (param65 ^ ((param65 ? param65 : param65) >> (param65 == param65)))) : param65))
(y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'h139):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire35;
  input wire [(4'ha):(1'h0)] wire34;
  input wire signed [(5'h12):(1'h0)] wire33;
  input wire signed [(5'h14):(1'h0)] wire32;
  wire [(5'h10):(1'h0)] wire64;
  wire signed [(3'h4):(1'h0)] wire63;
  wire signed [(5'h12):(1'h0)] wire62;
  wire signed [(2'h3):(1'h0)] wire61;
  wire [(5'h15):(1'h0)] wire60;
  reg [(4'h8):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg52 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg [(5'h11):(1'h0)] reg50 = (1'h0);
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  reg [(3'h6):(1'h0)] reg48 = (1'h0);
  reg [(5'h11):(1'h0)] reg47 = (1'h0);
  reg [(3'h4):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg44 = (1'h0);
  reg [(3'h5):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg42 = (1'h0);
  reg [(4'he):(1'h0)] reg41 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
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
      if ($signed(($signed($unsigned((wire35 ~^ wire32))) ?
          (($unsigned(wire35) ?
              (wire34 ?
                  wire33 : wire35) : (wire32 & wire33)) < (8'hb0)) : {((wire33 <= wire33) ?
                  wire33 : $signed(wire32))})))
        begin
          if ((+(7'h43)))
            begin
              reg36 <= wire35;
            end
          else
            begin
              reg36 <= ({($signed(((8'had) & wire33)) ?
                          $unsigned((8'ha1)) : $unsigned($signed(wire35))),
                      $unsigned($unsigned((wire32 <= reg36)))} ?
                  $unsigned(wire35[(3'h5):(2'h3)]) : ((|$unsigned(wire34)) ?
                      wire35[(3'h6):(1'h1)] : {$signed($signed((8'hb8))),
                          $unsigned(wire33[(5'h11):(1'h0)])}));
              reg37 <= ((wire33 ? wire33 : reg36) ?
                  $signed(((~$signed(wire34)) ?
                      $signed(reg36) : wire33)) : (|$unsigned(((reg36 ?
                      wire33 : wire35) << (wire34 ? wire32 : wire35)))));
            end
          reg38 <= reg36;
        end
      else
        begin
          reg36 <= ($unsigned($signed((~|(8'h9d)))) | (!(~|wire35[(1'h0):(1'h0)])));
        end
      reg39 <= wire34[(4'ha):(3'h7)];
      reg40 <= {$unsigned($unsigned(((reg38 == wire33) ?
              reg36 : {(8'hb5), wire32})))};
      reg41 <= (+$signed($signed(((|reg39) ? {reg36} : $unsigned(wire32)))));
      reg42 <= {((($signed(reg40) ? (8'ha0) : $unsigned(reg36)) ?
              $signed(reg37[(1'h0):(1'h0)]) : $unsigned((reg39 >= reg41))) || ({(reg41 ?
                  reg38 : wire32)} * (((8'hb2) ? reg38 : wire33) ?
              wire32[(4'he):(1'h0)] : $signed(wire33)))),
          $signed($unsigned((~&$signed(wire34))))};
    end
  always
    @(posedge clk) begin
      if ({($unsigned({$unsigned(reg39)}) ?
              $unsigned((wire35[(3'h7):(2'h2)] * (wire33 > reg37))) : wire33[(4'he):(2'h2)])})
        begin
          reg43 <= (|(wire33 > (^$signed($signed((8'h9f))))));
        end
      else
        begin
          reg43 <= {$unsigned(reg37)};
        end
    end
  always
    @(posedge clk) begin
      if ($signed(reg42))
        begin
          if ($signed((8'ha5)))
            begin
              reg44 <= {(($unsigned(wire32) < wire35) ?
                      reg42[(4'h8):(2'h3)] : ($unsigned({reg43, wire32}) ?
                          $unsigned(wire33) : wire33)),
                  ($unsigned(reg37) | ((reg37[(1'h1):(1'h1)] > (+reg41)) > ($unsigned(reg40) != $unsigned(reg38))))};
              reg45 <= (8'hbf);
              reg46 <= reg43;
            end
          else
            begin
              reg44 <= wire35[(1'h0):(1'h0)];
              reg45 <= (7'h43);
            end
          reg47 <= reg46;
        end
      else
        begin
          reg44 <= (~((8'hac) ?
              (!$signed((~|reg36))) : (((reg39 ? reg44 : reg46) > (^~(8'haa))) ?
                  reg42[(1'h1):(1'h1)] : reg36)));
          reg45 <= $unsigned(reg36[(4'h8):(4'h8)]);
          reg46 <= $unsigned(reg38[(1'h1):(1'h0)]);
          reg47 <= $unsigned($signed((^($unsigned((8'hba)) ?
              $unsigned(wire34) : (wire34 > reg39)))));
        end
      reg48 <= $signed({(~reg44),
          $signed(((reg46 * (8'h9e)) ? ((8'hb9) | (8'hac)) : reg41))});
    end
  always
    @(posedge clk) begin
      reg49 <= (!$unsigned(wire35));
      if (wire33)
        begin
          reg50 <= ((~&{(8'hb0)}) ?
              (($signed(((7'h42) & reg44)) ?
                      (((8'ha2) || reg40) * {reg48, reg48}) : reg38) ?
                  (8'hb7) : ($signed({reg39, reg49}) ?
                      (!(wire34 ? reg43 : wire32)) : $signed((wire33 ?
                          reg45 : wire35)))) : wire34);
          reg51 <= reg39;
          reg52 <= reg37;
          if ((8'hae))
            begin
              reg53 <= (|(|reg45[(3'h6):(3'h5)]));
              reg54 <= (~^wire34[(3'h5):(1'h1)]);
              reg55 <= reg38[(3'h4):(1'h0)];
              reg56 <= reg40[(3'h6):(2'h3)];
              reg57 <= $signed({reg48[(2'h2):(1'h1)]});
            end
          else
            begin
              reg53 <= $signed(((!$unsigned((~|reg54))) == reg37));
              reg54 <= (~^$signed((reg49[(1'h1):(1'h0)] << $unsigned(((8'hac) ?
                  wire35 : wire35)))));
              reg55 <= ($signed(reg51) ?
                  reg41[(1'h1):(1'h1)] : ($unsigned($unsigned((wire33 - reg54))) << $signed((~|(reg53 < reg50)))));
              reg56 <= reg55[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg50 <= (~^(reg36 ?
              ($unsigned((reg38 <= (8'hbb))) && ((reg56 ?
                  wire34 : reg46) && (~&reg42))) : {$signed({reg45, reg47}),
                  ($unsigned(reg39) & reg51[(1'h0):(1'h0)])}));
          reg51 <= reg49[(1'h0):(1'h0)];
          reg52 <= $signed(reg40);
        end
      reg58 <= reg50;
      reg59 <= reg51[(2'h2):(2'h2)];
    end
  assign wire60 = reg54;
  assign wire61 = ($unsigned($signed({$unsigned(reg56)})) ?
                      reg53 : (reg54 ?
                          {(wire60[(2'h2):(1'h0)] > $unsigned(reg37)),
                              (~|$unsigned(reg52))} : $unsigned({$unsigned(reg45),
                              $unsigned((8'hb0))})));
  assign wire62 = reg58[(3'h5):(3'h5)];
  assign wire63 = ($signed($signed((8'ha2))) ?
                      $signed((($signed(reg52) >>> $signed(reg46)) && $signed($unsigned(reg58)))) : (|(reg52[(4'hc):(4'h8)] ?
                          $unsigned(((8'hbc) ?
                              (8'hb3) : wire62)) : $signed($signed(reg46)))));
  assign wire64 = $unsigned($signed($signed((^~$signed(reg54)))));
endmodule
