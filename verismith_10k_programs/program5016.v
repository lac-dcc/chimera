module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h24b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire106;
  wire signed [(5'h12):(1'h0)] wire105;
  wire [(3'h5):(1'h0)] wire96;
  wire [(5'h13):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire23;
  wire [(5'h12):(1'h0)] wire24;
  wire signed [(4'h9):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire94;
  reg signed [(5'h12):(1'h0)] reg120 = (1'h0);
  reg [(4'h8):(1'h0)] reg119 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg116 = (1'h0);
  reg [(5'h10):(1'h0)] reg115 = (1'h0);
  reg [(3'h7):(1'h0)] reg114 = (1'h0);
  reg [(4'hd):(1'h0)] reg113 = (1'h0);
  reg [(5'h13):(1'h0)] reg112 = (1'h0);
  reg [(4'ha):(1'h0)] reg111 = (1'h0);
  reg [(4'hd):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg108 = (1'h0);
  reg signed [(4'he):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg101 = (1'h0);
  reg [(4'hd):(1'h0)] reg100 = (1'h0);
  reg [(4'ha):(1'h0)] reg99 = (1'h0);
  reg [(2'h3):(1'h0)] reg98 = (1'h0);
  reg [(2'h3):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg6 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire96,
                 wire5,
                 wire23,
                 wire24,
                 wire25,
                 wire94,
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
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
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
  assign wire5 = ((~|(^~(+wire2))) - $unsigned(wire3));
  always
    @(posedge clk) begin
      reg6 <= (+wire3);
      if ($unsigned(($unsigned($unsigned($unsigned((8'haa)))) ?
          wire4[(4'h9):(1'h0)] : (reg6 ? ((-wire4) <= (!wire4)) : wire4))))
        begin
          reg7 <= wire0;
          if ((8'ha6))
            begin
              reg8 <= $signed(wire1[(1'h0):(1'h0)]);
            end
          else
            begin
              reg8 <= (~({wire5[(5'h11):(3'h5)], reg8} && ((!(wire2 ?
                  wire5 : reg8)) != {wire0[(2'h3):(1'h1)]})));
              reg9 <= wire0[(2'h3):(2'h2)];
              reg10 <= (~&reg6[(3'h4):(1'h1)]);
            end
        end
      else
        begin
          if (($signed(wire4) ?
              wire3 : (~(wire5[(4'he):(3'h5)] ?
                  wire0 : $signed($unsigned(reg7))))))
            begin
              reg7 <= (!$signed(((~^$unsigned(reg9)) ?
                  $unsigned((|wire3)) : ((8'hb7) ?
                      wire4[(4'ha):(4'h9)] : (^(8'haf))))));
              reg8 <= (8'haa);
              reg9 <= $unsigned((!(8'h9d)));
              reg10 <= reg9[(1'h0):(1'h0)];
              reg11 <= (~|(^~(|$signed($unsigned(reg8)))));
            end
          else
            begin
              reg7 <= $unsigned(reg11[(2'h3):(2'h2)]);
              reg8 <= wire2[(2'h3):(2'h2)];
              reg9 <= ({wire4} < $unsigned((|$unsigned((wire1 ?
                  wire0 : wire3)))));
            end
          reg12 <= reg8;
          reg13 <= (~(8'ha0));
          if ($unsigned(wire5[(3'h7):(2'h3)]))
            begin
              reg14 <= $unsigned(reg9);
              reg15 <= reg9;
              reg16 <= (wire0[(2'h2):(1'h0)] & reg7);
            end
          else
            begin
              reg14 <= reg10[(1'h1):(1'h1)];
              reg15 <= (&reg8[(4'hd):(2'h3)]);
              reg16 <= ($unsigned((((reg6 ? (8'h9d) : wire0) ?
                  wire5[(2'h2):(1'h1)] : ((8'haf) + wire5)) ~^ wire5)) - $signed(($unsigned((reg16 ?
                  wire5 : reg7)) - ($signed((7'h44)) ?
                  $signed((7'h44)) : (reg13 >> wire0)))));
              reg17 <= wire1;
              reg18 <= $signed($signed((((reg9 ?
                  (8'ha6) : wire1) <= reg14) << wire5[(4'hd):(4'ha)])));
            end
          reg19 <= $signed(reg14);
        end
      reg20 <= (reg12[(3'h5):(3'h5)] ? ((8'ha5) << reg17) : (|reg13));
      reg21 <= (($signed($signed($unsigned((8'hb2)))) ^~ $signed(reg9)) + ($signed((~&(reg15 == wire1))) ?
          reg18[(1'h1):(1'h0)] : (~|{((8'hb0) ? reg14 : reg20),
              ((8'ha1) || reg20)})));
      reg22 <= ($unsigned((((wire4 ? (7'h42) : (8'haf)) > (reg19 ^ reg7)) ?
              reg18 : reg11)) ?
          {reg21[(2'h3):(2'h2)],
              $signed(reg15)} : (!(($unsigned(reg15) <<< reg7[(4'ha):(1'h1)]) ?
              $signed(wire3) : ((8'hb5) ? $unsigned(reg19) : $signed(reg14)))));
    end
  assign wire23 = $unsigned($unsigned(($unsigned((^~wire0)) ?
                      (~(wire3 ? (8'hb9) : reg12)) : {(reg17 ?
                              reg18 : reg11)})));
  assign wire24 = reg18[(2'h3):(2'h3)];
  assign wire25 = wire24;
  module26 #() modinst95 (.clk(clk), .wire27(wire5), .wire31(wire2), .wire30(reg7), .wire28(reg11), .wire29(wire24), .y(wire94));
  assign wire96 = (+$unsigned(($signed(reg20[(3'h4):(3'h4)]) >= $unsigned((reg19 ?
                      reg22 : wire1)))));
  always
    @(posedge clk) begin
      reg97 <= {(|(((wire25 ?
              reg7 : wire24) - {wire4}) * wire5[(4'ha):(1'h1)]))};
      reg98 <= (wire23[(3'h5):(3'h5)] || ((~^reg12) | (~|reg7[(3'h7):(3'h6)])));
      reg99 <= (reg12 ^ $signed((8'hb0)));
      if ((~(wire96 << reg99[(1'h0):(1'h0)])))
        begin
          if ((&((wire25 + {(^~reg99),
              ((7'h40) ? wire0 : reg97)}) & ($unsigned((reg7 ?
              wire3 : (7'h43))) - reg98[(1'h0):(1'h0)]))))
            begin
              reg100 <= ($unsigned(((^$signed((8'had))) != ({(8'hb7)} >= $unsigned(reg12)))) << (wire24[(3'h4):(2'h3)] || (reg6[(3'h4):(2'h2)] ?
                  reg14[(3'h5):(2'h2)] : ((-wire1) >> reg12))));
              reg101 <= (~^(^~($unsigned({reg12, reg97}) * (reg99 ?
                  (^~wire3) : {reg19}))));
            end
          else
            begin
              reg100 <= {(((|(wire23 ? reg101 : wire96)) * ((8'hb9) || (wire25 ?
                          reg15 : reg21))) ?
                      $signed(($unsigned(reg100) == (~&(8'ha3)))) : reg9[(3'h6):(2'h2)]),
                  ({({reg22, reg6} | (reg18 ? (8'hb1) : reg11)),
                          reg15[(3'h7):(1'h1)]} ?
                      reg10[(1'h0):(1'h0)] : reg11[(3'h7):(3'h4)])};
              reg101 <= {wire3, (!(&$signed(wire5)))};
              reg102 <= wire2;
              reg103 <= reg14;
            end
          reg104 <= (reg19[(2'h2):(2'h2)] | {(|$unsigned(reg9))});
        end
      else
        begin
          reg100 <= reg97[(1'h0):(1'h0)];
          reg101 <= reg7[(2'h2):(1'h0)];
        end
    end
  assign wire105 = reg14[(2'h2):(1'h0)];
  assign wire106 = reg16[(4'hb):(3'h5)];
  always
    @(posedge clk) begin
      reg107 <= ((reg99 < $signed((8'hac))) < reg16[(4'h8):(3'h5)]);
      reg108 <= ((+(reg11[(3'h4):(1'h1)] ? reg12 : (~|{(7'h41), reg99}))) ?
          wire5 : $signed({wire23[(3'h6):(3'h4)]}));
      reg109 <= reg6[(2'h3):(1'h1)];
      reg110 <= ((^wire5[(4'hf):(4'h9)]) || (8'hb6));
      reg111 <= (~|({$unsigned(((8'ha1) >> reg7)),
              $unsigned($unsigned((8'hb8)))} ?
          ($signed({(8'h9c)}) ?
              {(!reg102), $signed(reg18)} : (~&(reg20 ?
                  reg102 : reg16))) : (((reg108 ?
              wire105 : (8'hba)) == wire2) && (~reg6[(3'h5):(2'h3)]))));
    end
  always
    @(posedge clk) begin
      if ({($signed(((reg101 ? reg97 : reg10) >>> wire94[(2'h2):(2'h2)])) ?
              $unsigned(reg103[(5'h15):(5'h14)]) : (-reg102))})
        begin
          if (reg100[(4'h8):(1'h1)])
            begin
              reg112 <= (^reg101[(1'h0):(1'h0)]);
              reg113 <= $unsigned((&reg15));
            end
          else
            begin
              reg112 <= reg17[(4'h9):(2'h3)];
              reg113 <= reg13[(3'h4):(2'h2)];
              reg114 <= wire25;
            end
          if ((|(~|(($unsigned((8'hbe)) > (reg18 ?
              wire25 : (8'hab))) ~^ $unsigned((reg22 ? reg112 : reg110))))))
            begin
              reg115 <= (!(|reg10));
            end
          else
            begin
              reg115 <= reg15[(3'h4):(1'h0)];
              reg116 <= $signed((~|reg98[(1'h1):(1'h0)]));
              reg117 <= (~&(((!(+reg8)) || reg97) < $unsigned(((^~reg13) ?
                  {reg115, wire3} : (reg112 ? reg101 : wire94)))));
            end
          reg118 <= (~(-reg15[(4'hb):(1'h1)]));
          if (((reg101 ?
                  ((~&$unsigned(reg109)) ^~ ((reg22 ?
                      reg97 : reg18) <= wire23[(3'h4):(2'h3)])) : (+$signed((reg109 ?
                      (8'hb8) : wire94)))) ?
              reg16[(4'hb):(4'h8)] : (reg8[(4'h9):(2'h2)] != (~^reg21))))
            begin
              reg119 <= (~^(~(~^reg19[(5'h11):(3'h4)])));
              reg120 <= (((+$signed((7'h43))) ?
                  $unsigned($signed(reg9)) : $unsigned(($signed(wire106) ?
                      $signed((8'had)) : wire105[(3'h5):(2'h3)]))) == reg10[(1'h1):(1'h1)]);
            end
          else
            begin
              reg119 <= wire25;
              reg120 <= (((~{reg115}) != ((^~(reg117 ? reg19 : wire1)) ?
                  (~(reg117 ?
                      reg101 : reg99)) : reg101[(2'h2):(1'h0)])) ~^ $unsigned(reg97));
            end
        end
      else
        begin
          if ($signed(reg13[(4'hb):(2'h2)]))
            begin
              reg112 <= $signed(($signed($signed($signed(reg8))) ?
                  $unsigned($signed(reg114)) : ($signed((|wire0)) ?
                      {(reg9 ~^ reg17),
                          (reg11 ^~ reg115)} : $signed((wire96 >> reg111)))));
              reg113 <= (~^(8'hb0));
              reg114 <= (wire23 >>> (reg13[(4'hb):(3'h6)] >= {{(reg99 <= reg113)}}));
            end
          else
            begin
              reg112 <= wire1;
            end
          reg115 <= ((reg120[(4'h8):(4'h8)] ?
              $signed($unsigned(reg109[(3'h5):(2'h3)])) : reg20) | (~|{$unsigned(((7'h41) ?
                  reg6 : (8'hbc)))}));
          if ($unsigned((+(((wire1 == reg6) ?
              wire24 : $signed(reg18)) ^ {reg110[(4'hb):(3'h7)],
              (reg103 >> wire3)}))))
            begin
              reg116 <= {$unsigned((|reg97[(1'h0):(1'h0)]))};
              reg117 <= reg20;
              reg118 <= reg109;
            end
          else
            begin
              reg116 <= wire2[(4'hb):(3'h6)];
              reg117 <= $signed($signed($signed($signed(wire106[(4'he):(4'he)]))));
              reg118 <= wire0[(2'h2):(1'h1)];
            end
          reg119 <= reg107;
          reg120 <= ($unsigned($unsigned({(+reg120)})) ?
              $signed($signed((~{reg104, wire96}))) : reg100[(4'ha):(4'h9)]);
        end
    end
endmodule

module module26  (y, clk, wire27, wire28, wire29, wire30, wire31);
  output wire [(32'h211):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire27;
  input wire signed [(2'h3):(1'h0)] wire28;
  input wire [(5'h12):(1'h0)] wire29;
  input wire signed [(4'hb):(1'h0)] wire30;
  input wire [(4'ha):(1'h0)] wire31;
  wire [(4'hf):(1'h0)] wire83;
  wire [(5'h13):(1'h0)] wire82;
  wire [(4'hc):(1'h0)] wire80;
  wire signed [(3'h5):(1'h0)] wire32;
  wire signed [(5'h15):(1'h0)] wire33;
  wire signed [(4'ha):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire57;
  wire [(5'h13):(1'h0)] wire78;
  reg signed [(4'hf):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg91 = (1'h0);
  reg [(5'h10):(1'h0)] reg90 = (1'h0);
  reg [(4'hc):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg88 = (1'h0);
  reg [(5'h11):(1'h0)] reg87 = (1'h0);
  reg [(5'h14):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg85 = (1'h0);
  reg [(5'h13):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg81 = (1'h0);
  reg [(3'h7):(1'h0)] reg56 = (1'h0);
  reg [(4'hb):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg52 = (1'h0);
  reg [(5'h14):(1'h0)] reg51 = (1'h0);
  reg [(3'h5):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg49 = (1'h0);
  reg [(2'h3):(1'h0)] reg48 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg47 = (1'h0);
  reg [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg44 = (1'h0);
  reg [(5'h15):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg signed [(4'he):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  reg [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(5'h10):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire80,
                 wire32,
                 wire33,
                 wire34,
                 wire57,
                 wire78,
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
                 reg81,
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
                 reg35,
                 (1'h0)};
  assign wire32 = $signed(wire30);
  assign wire33 = (8'h9f);
  assign wire34 = (wire30[(1'h1):(1'h1)] ?
                      $signed((|$unsigned(((8'hb7) << (8'ha4))))) : $unsigned($signed(wire27[(2'h2):(1'h1)])));
  always
    @(posedge clk) begin
      reg35 <= ((~^$unsigned(((~^wire29) || {wire34, wire28}))) ?
          {(((wire32 ? wire33 : wire31) ? $unsigned(wire31) : $signed(wire31)) ?
                  $unsigned((wire33 ?
                      wire27 : wire27)) : $signed((wire28 << (8'h9c))))} : (({{wire31}} ?
                  wire30[(2'h2):(1'h1)] : (wire33[(5'h15):(3'h7)] << wire28)) ?
              ($signed((^wire28)) & ((wire27 ? wire27 : (8'hbd)) ?
                  $unsigned(wire32) : (~wire30))) : {$signed((wire30 ?
                      wire28 : wire31)),
                  (8'h9c)}));
      if ((wire31 ? wire32[(3'h4):(3'h4)] : (^~(8'hb0))))
        begin
          reg36 <= (wire32[(1'h1):(1'h1)] * wire28);
          if ({$unsigned($unsigned((-(!wire28)))), wire31})
            begin
              reg37 <= wire29[(1'h0):(1'h0)];
              reg38 <= reg36;
              reg39 <= reg36;
              reg40 <= $signed((wire27 ? {(~(reg37 && (7'h44)))} : wire32));
              reg41 <= wire33;
            end
          else
            begin
              reg37 <= $signed({(~|{wire34, wire34[(1'h0):(1'h0)]}),
                  $signed(reg37)});
              reg38 <= ((wire30[(3'h4):(1'h1)] ?
                      (($unsigned(wire34) || wire33) * reg40) : $signed($signed((reg36 ?
                          reg41 : reg38)))) ?
                  wire30[(3'h4):(2'h2)] : $unsigned((((wire31 >>> reg39) == wire30[(3'h5):(2'h3)]) ?
                      wire32 : wire28)));
              reg39 <= wire28[(2'h3):(2'h3)];
              reg40 <= (&$signed(reg37));
              reg41 <= $signed({$unsigned((wire34[(3'h5):(1'h0)] ?
                      $unsigned(reg36) : $unsigned(wire27))),
                  reg36[(1'h0):(1'h0)]});
            end
        end
      else
        begin
          reg36 <= $unsigned($signed(reg37[(3'h5):(2'h3)]));
        end
      if ({$unsigned($unsigned($signed({reg37})))})
        begin
          reg42 <= $unsigned($unsigned($unsigned(($signed(reg36) >>> wire33[(1'h0):(1'h0)]))));
        end
      else
        begin
          reg42 <= (-(^~{$signed((wire30 ? (8'ha1) : reg36))}));
          reg43 <= (($signed($unsigned($unsigned((7'h44)))) ?
                  reg35[(4'hb):(1'h0)] : (^~$unsigned((reg35 + reg41)))) ?
              $signed((($signed((8'hb5)) ?
                      (wire29 <<< reg38) : wire27[(3'h7):(3'h4)]) ?
                  $signed((wire30 ?
                      (8'hbb) : wire30)) : reg36[(3'h6):(3'h6)])) : (!$unsigned($unsigned((wire32 ?
                  (8'hae) : wire33)))));
          reg44 <= $signed({wire29});
          if ((~reg36))
            begin
              reg45 <= reg38;
              reg46 <= (-$signed(reg42[(1'h1):(1'h1)]));
              reg47 <= ((8'h9d) >= (|$signed((8'ha1))));
            end
          else
            begin
              reg45 <= reg40;
              reg46 <= ($unsigned((~{{wire31, wire29},
                  reg46[(2'h3):(2'h3)]})) & $signed(wire27[(1'h1):(1'h0)]));
            end
          reg48 <= reg39[(1'h0):(1'h0)];
        end
      reg49 <= ((reg39[(3'h7):(1'h0)] ?
              wire32[(3'h4):(2'h3)] : $unsigned({wire34, reg40})) ?
          reg36 : wire32);
      if (($signed($unsigned($unsigned({(8'ha8), wire27}))) * reg44))
        begin
          reg50 <= $unsigned(((($unsigned(wire31) ^ $signed(reg49)) && reg36[(3'h4):(2'h2)]) ?
              reg46[(3'h4):(1'h0)] : (reg43[(5'h12):(4'ha)] ?
                  wire29 : {(reg42 || reg42), $signed(wire28)})));
        end
      else
        begin
          if (wire32)
            begin
              reg50 <= (8'ha0);
              reg51 <= reg40;
            end
          else
            begin
              reg50 <= wire33[(4'hd):(2'h2)];
              reg51 <= ((8'hba) | (((&reg46) < (reg36[(3'h5):(1'h0)] - (reg51 ~^ (7'h44)))) + reg35[(3'h4):(2'h3)]));
              reg52 <= $signed({(~|$signed((wire34 ? reg42 : reg38)))});
              reg53 <= reg45;
            end
          reg54 <= ((reg51[(5'h14):(1'h1)] ?
                  ($signed($unsigned(reg40)) ?
                      reg43 : $signed($unsigned(reg43))) : ((reg37 ?
                      (~&reg40) : $signed((8'hb5))) == (!(&reg48)))) ?
              (!((^(|wire27)) ?
                  wire27 : $unsigned(reg35[(4'h8):(4'h8)]))) : $signed((wire34 ?
                  $unsigned(((8'ha0) ^~ wire31)) : $unsigned((^~reg47)))));
          reg55 <= (8'hb9);
        end
    end
  always
    @(posedge clk) begin
      reg56 <= $signed(reg50[(3'h4):(2'h3)]);
    end
  assign wire57 = reg56;
  module58 #() modinst79 (wire78, clk, reg45, reg43, wire27, wire30, wire29);
  assign wire80 = $signed((+reg43));
  always
    @(posedge clk) begin
      reg81 <= $unsigned((~^$unsigned(($unsigned((8'ha3)) ?
          (~&reg43) : (-reg47)))));
    end
  assign wire82 = $unsigned(((8'hb0) * $unsigned(((|reg38) != reg49))));
  assign wire83 = reg50[(3'h5):(2'h2)];
  always
    @(posedge clk) begin
      reg84 <= (reg51[(4'ha):(4'h9)] ?
          reg42 : (({$signed(reg35), {reg35}} ?
                  ((reg36 || reg56) ~^ (8'ha6)) : $unsigned((reg53 ?
                      reg36 : wire80))) ?
              (~|{{reg42, wire57}}) : (8'ha2)));
      reg85 <= {reg55[(3'h5):(2'h2)]};
      if (reg46)
        begin
          if (wire32[(1'h0):(1'h0)])
            begin
              reg86 <= reg35[(2'h3):(2'h3)];
              reg87 <= reg40[(4'hc):(3'h5)];
            end
          else
            begin
              reg86 <= ((^wire83[(3'h5):(2'h2)]) & reg41[(4'he):(3'h7)]);
              reg87 <= reg39;
              reg88 <= ((!$unsigned((^(8'hb3)))) > (reg46 ?
                  $unsigned($unsigned((wire28 ^~ wire28))) : {(reg44[(2'h3):(1'h0)] >> {reg41,
                          reg85})}));
              reg89 <= reg53;
            end
          reg90 <= (+$unsigned((8'hb3)));
        end
      else
        begin
          if (reg89)
            begin
              reg86 <= wire32;
              reg87 <= {{(~^(^~reg43))}};
            end
          else
            begin
              reg86 <= (~({(~&(^~wire29)),
                  (wire34 * $unsigned(reg52))} >= $signed({$signed(reg38)})));
              reg87 <= $signed(($signed($signed(reg56)) ?
                  $signed(((&reg37) ?
                      $signed(reg86) : wire83)) : $unsigned($signed((wire82 + reg50)))));
              reg88 <= $unsigned((!(^~$unsigned((reg49 ? reg81 : (8'hae))))));
            end
          reg89 <= wire78[(4'ha):(1'h0)];
          if (((wire31[(2'h3):(1'h0)] ?
              (({reg46, (7'h44)} || $signed(reg52)) ?
                  $signed(((8'hac) & reg47)) : $unsigned(reg45[(3'h4):(2'h3)])) : wire31[(1'h0):(1'h0)]) == ({$unsigned((~^wire57)),
              (~|reg90[(1'h1):(1'h1)])} || $unsigned(reg89))))
            begin
              reg90 <= wire28;
              reg91 <= reg88;
            end
          else
            begin
              reg90 <= wire29;
              reg91 <= $unsigned(reg85[(1'h0):(1'h0)]);
              reg92 <= (&wire57[(4'hb):(4'ha)]);
            end
        end
      reg93 <= $signed((reg85 ?
          $unsigned((8'ha5)) : {(reg43 < $signed(wire28))}));
    end
endmodule

module module58
#(parameter param77 = (~&((((|(8'h9f)) ? {(8'ha0), (8'hb0)} : ((8'haf) ? (8'hac) : (7'h40))) + {(8'hb2)}) <= ((((7'h41) - (8'h9d)) + ((7'h40) > (8'hb6))) <= (((8'h9c) ^ (8'hb8)) ? ((7'h43) ? (8'hb2) : (8'ha4)) : ((8'hb6) && (8'hb5)))))))
(y, clk, wire63, wire62, wire61, wire60, wire59);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire63;
  input wire signed [(4'hc):(1'h0)] wire62;
  input wire signed [(3'h4):(1'h0)] wire61;
  input wire [(4'hb):(1'h0)] wire60;
  input wire signed [(4'hd):(1'h0)] wire59;
  wire signed [(5'h13):(1'h0)] wire76;
  wire signed [(5'h13):(1'h0)] wire75;
  wire signed [(4'h9):(1'h0)] wire74;
  wire signed [(4'h9):(1'h0)] wire68;
  wire signed [(4'hb):(1'h0)] wire67;
  wire signed [(5'h13):(1'h0)] wire66;
  wire [(5'h10):(1'h0)] wire65;
  wire [(4'he):(1'h0)] wire64;
  reg [(2'h3):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg70 = (1'h0);
  reg [(5'h13):(1'h0)] reg69 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 (1'h0)};
  assign wire64 = (wire62 ?
                      (({(wire61 ? (8'hbb) : wire60)} ?
                              $unsigned(((8'hb0) ? wire63 : wire60)) : wire61) ?
                          wire63 : wire59[(3'h7):(3'h4)]) : $signed((&((+(8'hb8)) ?
                          wire60[(3'h4):(1'h1)] : (^~wire59)))));
  assign wire65 = ((~^{((wire64 != wire61) != (wire63 || wire60)),
                      $signed(wire60[(3'h6):(3'h5)])}) & ($signed((+(|wire60))) * $unsigned($unsigned(((8'hb2) >>> wire63)))));
  assign wire66 = wire64;
  assign wire67 = (8'haf);
  assign wire68 = {{$signed(({(7'h44)} <<< (wire60 > wire60)))},
                      wire64[(4'hb):(3'h5)]};
  always
    @(posedge clk) begin
      reg69 <= wire63[(1'h0):(1'h0)];
      reg70 <= wire63;
      reg71 <= ($signed($unsigned($unsigned(wire65))) ?
          $unsigned({(wire66[(4'hf):(4'h8)] ?
                  $unsigned(wire62) : wire63)}) : (^~({$unsigned(wire67),
              $unsigned(wire65)} + wire65)));
      reg72 <= wire68;
      reg73 <= (&wire61[(2'h2):(1'h1)]);
    end
  assign wire74 = $unsigned($signed((~((reg70 + wire59) & (-wire61)))));
  assign wire75 = ((((-(wire74 ?
                              (8'hb8) : reg71)) >>> $signed((wire66 == reg72))) ?
                          $signed((^~$signed(wire65))) : {(&(reg73 ?
                                  wire64 : wire63))}) ?
                      (-wire68[(2'h2):(1'h0)]) : $unsigned({$unsigned(wire68),
                          ((reg72 ? (8'ha8) : (8'hbe)) != $unsigned(wire67))}));
  assign wire76 = wire65;
endmodule
