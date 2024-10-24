module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h121):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire3;
  wire signed [(5'h12):(1'h0)] wire116;
  wire signed [(2'h2):(1'h0)] wire115;
  wire [(4'hb):(1'h0)] wire23;
  wire [(4'hc):(1'h0)] wire24;
  wire [(3'h4):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire113;
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  reg [(5'h11):(1'h0)] reg5 = (1'h0);
  reg [(3'h4):(1'h0)] reg4 = (1'h0);
  assign y = {wire116,
                 wire115,
                 wire23,
                 wire24,
                 wire25,
                 wire113,
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
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed({(wire3 ?
              (^(wire2 ? wire1 : wire1)) : {wire1, (~^(8'ha3))}),
          $signed($signed($unsigned(wire3)))});
      if ((wire1 << ($signed(($signed(wire3) + (wire1 ?
          wire3 : (8'ha0)))) + wire2)))
        begin
          reg5 <= ($unsigned(wire1[(1'h1):(1'h0)]) ?
              ($unsigned(reg4) == $signed(($unsigned((7'h40)) ^ (wire2 ?
                  (8'hab) : wire1)))) : wire1);
          reg6 <= reg4;
          reg7 <= ((wire0 ?
                  $unsigned((wire0 ?
                      ((8'hae) ? wire3 : wire2) : {wire2,
                          reg5})) : $signed(reg6)) ?
              ($signed(($signed(wire0) ?
                  (reg4 || (8'hab)) : (&wire3))) || wire3[(2'h2):(1'h0)]) : (~wire3));
        end
      else
        begin
          reg5 <= $unsigned(((~($unsigned(reg5) ?
                  $signed(reg4) : $unsigned(wire1))) ?
              {((+wire1) ? wire3 : $signed((8'hb0)))} : {{$unsigned(wire0)},
                  (reg4[(2'h2):(2'h2)] && (~|wire2))}));
          if ($unsigned(({reg6[(4'ha):(4'h9)]} <= (~^wire3))))
            begin
              reg6 <= {(wire3[(1'h0):(1'h0)] ?
                      ((~|(wire0 ?
                          reg7 : wire2)) >>> wire3) : ((((8'ha7) ^ wire3) ?
                          (|reg5) : reg4[(1'h1):(1'h1)]) | {(wire3 == (8'ha9)),
                          (-reg7)}))};
              reg7 <= wire2;
            end
          else
            begin
              reg6 <= ($unsigned(reg6) >> wire2[(4'h8):(3'h5)]);
              reg7 <= ((^~(8'ha8)) ?
                  ((wire1[(4'he):(4'hb)] ?
                          ($signed(reg6) | reg4) : wire1[(3'h7):(1'h1)]) ?
                      $signed(((!wire3) ?
                          (reg6 ?
                              reg7 : wire1) : (reg4 - wire1))) : ($signed((wire0 << reg4)) > (~&(reg4 ?
                          reg6 : wire3)))) : (~|(^({wire3, wire3} ~^ (wire1 ?
                      wire1 : reg5)))));
              reg8 <= (reg5[(1'h1):(1'h0)] && wire2[(3'h7):(2'h3)]);
            end
          reg9 <= (~^((($signed(reg6) + (wire2 ? wire0 : wire3)) ?
              wire1 : $signed((-(8'hb3)))) > ((wire3[(1'h1):(1'h0)] ?
                  reg7 : (8'had)) ?
              wire0 : reg6[(4'h9):(4'h8)])));
        end
      reg10 <= wire1;
      if (((reg7 ? (8'hb1) : $unsigned($unsigned(wire0))) ?
          ((~((reg4 >= (8'hb7)) < $unsigned(wire3))) >>> reg6[(4'hb):(1'h0)]) : reg6))
        begin
          reg11 <= (+$signed(wire0[(4'hb):(2'h3)]));
          reg12 <= reg5[(2'h3):(2'h2)];
          reg13 <= ((&{((reg6 ? reg4 : reg9) ?
                  wire3[(2'h2):(1'h0)] : $unsigned(wire3))}) + (8'ha1));
          reg14 <= reg12;
        end
      else
        begin
          reg11 <= (reg7 ?
              ($unsigned((!(8'haf))) ?
                  (reg8[(1'h1):(1'h1)] << {reg4[(2'h2):(1'h1)],
                      reg6[(4'hc):(2'h3)]}) : (reg7 ?
                      $signed($signed(reg4)) : ({wire3} < reg5))) : ($signed($unsigned((+(8'ha5)))) ?
                  ($unsigned({reg5,
                      wire3}) ^ (wire0[(1'h0):(1'h0)] != (~^reg10))) : reg11));
        end
      if (reg7)
        begin
          reg15 <= $unsigned((!wire3[(1'h0):(1'h0)]));
        end
      else
        begin
          reg15 <= reg15;
          if (($unsigned((((|reg9) && $unsigned(reg10)) <<< $signed($signed(reg13)))) ?
              $signed($signed($unsigned(reg12[(4'hd):(4'hc)]))) : $unsigned(reg13)))
            begin
              reg16 <= reg5;
            end
          else
            begin
              reg16 <= (reg14[(3'h6):(3'h6)] ?
                  {reg14,
                      (!((wire1 ? wire2 : reg6) ?
                          $unsigned((8'had)) : $signed(reg16)))} : reg11[(4'hb):(3'h5)]);
              reg17 <= ({(~&reg7[(3'h4):(3'h4)])} ^~ {{(|(reg11 ? reg8 : reg8)),
                      ($signed(wire1) ? wire3 : (reg8 == reg7))}});
              reg18 <= reg8;
            end
          if (reg11[(2'h2):(1'h1)])
            begin
              reg19 <= (reg11[(4'hc):(4'h8)] != (&reg10[(2'h2):(2'h2)]));
              reg20 <= wire1;
            end
          else
            begin
              reg19 <= wire0;
              reg20 <= (~^($unsigned({(-(8'hbe)), $signed(reg18)}) ?
                  reg16[(1'h1):(1'h0)] : wire1[(1'h0):(1'h0)]));
              reg21 <= ($signed(wire1[(5'h11):(1'h1)]) * ((((reg4 + wire0) ?
                  wire1 : {(8'hab)}) > reg5) ^~ {(&{reg4}),
                  ($unsigned(reg6) & reg6)}));
              reg22 <= ($signed(($signed(reg16) ?
                  $signed(reg12) : (~{(8'ha9)}))) >= ({$unsigned((~^(8'had))),
                  wire1} ^~ reg8[(1'h0):(1'h0)]));
            end
        end
    end
  assign wire23 = (reg10[(2'h2):(1'h0)] ?
                      ((reg18[(4'hf):(2'h3)] ? (~|$unsigned(reg7)) : reg13) ?
                          $unsigned((((7'h41) ?
                              reg7 : reg5) * $signed(reg15))) : reg21[(3'h7):(1'h1)]) : {((8'ha2) >>> {$signed(reg11),
                              reg18}),
                          wire3[(1'h0):(1'h0)]});
  assign wire24 = (^$signed((~&$unsigned((reg22 ? (8'hbb) : reg8)))));
  assign wire25 = reg11[(1'h1):(1'h0)];
  module26 #() modinst114 (wire113, clk, reg5, reg9, reg21, wire2, reg14);
  assign wire115 = {$unsigned(wire1[(5'h12):(4'hf)]),
                       ($unsigned(reg15) && reg6[(3'h5):(3'h4)])};
  assign wire116 = ((((wire115[(2'h2):(1'h1)] ?
                           ((8'hbc) ?
                               reg16 : reg20) : (~|reg11)) && reg11[(3'h5):(3'h4)]) ~^ reg5) ?
                       $signed((^{$unsigned((8'hb5)),
                           reg12[(4'hf):(1'h0)]})) : wire113);
endmodule

module module26  (y, clk, wire27, wire28, wire29, wire30, wire31);
  output wire [(32'h178):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire27;
  input wire signed [(4'hd):(1'h0)] wire28;
  input wire signed [(4'hf):(1'h0)] wire29;
  input wire signed [(5'h15):(1'h0)] wire30;
  input wire [(4'hd):(1'h0)] wire31;
  wire signed [(5'h12):(1'h0)] wire112;
  wire signed [(4'he):(1'h0)] wire109;
  wire [(3'h5):(1'h0)] wire85;
  wire [(3'h6):(1'h0)] wire84;
  wire signed [(4'h9):(1'h0)] wire83;
  wire signed [(4'h8):(1'h0)] wire82;
  wire [(4'hd):(1'h0)] wire81;
  wire signed [(4'hc):(1'h0)] wire80;
  wire [(4'hf):(1'h0)] wire67;
  wire signed [(2'h3):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire35;
  wire signed [(5'h12):(1'h0)] wire36;
  wire signed [(4'hb):(1'h0)] wire37;
  wire [(4'h9):(1'h0)] wire38;
  wire [(4'hb):(1'h0)] wire39;
  wire signed [(3'h5):(1'h0)] wire65;
  reg signed [(5'h13):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg79 = (1'h0);
  reg [(3'h5):(1'h0)] reg78 = (1'h0);
  reg [(4'h8):(1'h0)] reg77 = (1'h0);
  reg [(4'he):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg74 = (1'h0);
  reg [(4'ha):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  reg [(5'h15):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg69 = (1'h0);
  reg [(3'h7):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg33 = (1'h0);
  assign y = {wire112,
                 wire109,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire67,
                 wire32,
                 wire35,
                 wire36,
                 wire37,
                 wire38,
                 wire39,
                 wire65,
                 reg111,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire32 = wire27[(4'hb):(1'h0)];
  always
    @(posedge clk) begin
      reg33 <= wire31;
      reg34 <= (&(((^~$signed((8'hb7))) ?
          ($unsigned(wire32) ^~ (wire30 <= wire29)) : ($unsigned(wire30) ~^ wire30[(3'h7):(3'h4)])) ^~ ($signed(wire30[(5'h13):(3'h7)]) == wire30[(4'hb):(4'h8)])));
    end
  assign wire35 = {$unsigned($unsigned({wire27[(1'h1):(1'h1)]}))};
  assign wire36 = $signed((~(^wire35)));
  assign wire37 = (|wire28);
  assign wire38 = ((&wire30[(5'h15):(5'h11)]) >> (({wire31[(3'h5):(1'h0)]} ?
                          wire35 : ((-wire36) ? {wire37, wire36} : wire30)) ?
                      $unsigned({$unsigned(reg33), (8'ha9)}) : {(7'h40),
                          $signed((^reg34))}));
  assign wire39 = {(&($unsigned((wire31 >>> wire31)) || $unsigned((wire37 ?
                          wire36 : reg33)))),
                      $unsigned((($signed((8'h9f)) ~^ wire32[(2'h2):(1'h1)]) ?
                          (-$unsigned(wire30)) : $unsigned(wire36)))};
  module40 #() modinst66 (.wire43(wire32), .wire45(wire30), .wire42(wire29), .wire41(wire31), .clk(clk), .wire44(wire27), .y(wire65));
  assign wire67 = wire32[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      if ({(($unsigned({wire32,
              wire65}) <<< wire39[(4'h8):(4'h8)]) ^ wire36[(3'h6):(3'h5)])})
        begin
          reg68 <= (^~(wire39 ?
              wire30[(5'h11):(5'h10)] : (-wire30[(5'h10):(3'h6)])));
          if (wire67[(4'he):(4'hc)])
            begin
              reg69 <= $unsigned({(!wire36), wire27[(4'ha):(3'h6)]});
              reg70 <= ((&$unsigned(((^wire30) ?
                  (~|reg34) : (~|(8'hb3))))) ^~ ((wire37 << wire67[(4'hc):(3'h5)]) ?
                  (({wire65} > (&wire27)) ?
                      wire38 : $unsigned((wire39 ~^ wire65))) : ($unsigned((wire37 ?
                          reg68 : (8'hb6))) ?
                      $unsigned((wire67 == wire31)) : $signed((wire37 ?
                          wire30 : wire28)))));
              reg71 <= wire32;
              reg72 <= (wire38[(4'h9):(4'h9)] ?
                  $unsigned((((reg68 * reg33) + (!wire35)) < $unsigned(wire31[(3'h4):(3'h4)]))) : $unsigned($unsigned((wire35[(4'h8):(3'h5)] ?
                      $signed(wire67) : ((8'hb4) * reg34)))));
            end
          else
            begin
              reg69 <= wire35;
              reg70 <= ((-(!((&wire31) ^~ (wire36 ? reg69 : (8'hba))))) ?
                  (&{(!{wire65})}) : $unsigned($signed($signed((reg70 ?
                      reg69 : wire39)))));
              reg71 <= $unsigned({$signed(wire28[(4'hc):(3'h5)]),
                  {($unsigned(wire67) ?
                          ((8'hb1) - wire29) : $unsigned(wire31))}});
            end
          reg73 <= {(wire28 <= ((wire27 >= $unsigned(wire67)) ?
                  (~^(^(8'hbc))) : reg69)),
              $unsigned({$unsigned($signed(wire27)), wire28})};
          reg74 <= (|(wire31[(3'h7):(2'h3)] ?
              (+wire65[(1'h1):(1'h1)]) : ({((8'ha8) ? wire36 : wire29),
                  {reg68, (8'had)}} * $unsigned(wire28))));
        end
      else
        begin
          if ((~$signed($unsigned(wire30[(5'h11):(3'h5)]))))
            begin
              reg68 <= $signed($signed((|($signed(reg68) ?
                  reg34 : wire31[(3'h6):(3'h6)]))));
              reg69 <= ((((reg34 || (^~wire37)) || (~^$unsigned(wire31))) < wire27[(3'h7):(3'h6)]) ?
                  (wire37 > $signed(reg34)) : ((reg68[(1'h1):(1'h0)] * $unsigned((+reg72))) * (wire36 ?
                      (8'hb1) : {(reg74 ? wire36 : wire38)})));
              reg70 <= $unsigned(reg71[(2'h3):(2'h2)]);
              reg71 <= ((reg71 ? reg74[(4'hf):(2'h2)] : reg74[(3'h4):(2'h3)]) ?
                  ($unsigned({((8'hbc) ? wire28 : wire29)}) ?
                      ($unsigned($signed(reg34)) < {(reg69 >= (8'ha5)),
                          (reg34 ?
                              wire67 : wire39)}) : $unsigned((reg68 + (^(7'h41))))) : (^(!$signed(wire36[(3'h5):(1'h0)]))));
              reg72 <= wire31;
            end
          else
            begin
              reg68 <= ((({wire65,
                  $unsigned(wire32)} ^ $unsigned((!wire36))) ^~ $unsigned(((~|reg73) + wire39))) | wire31[(3'h6):(2'h3)]);
              reg69 <= $unsigned({$signed($signed((reg69 ? reg70 : reg68)))});
              reg70 <= $signed(($unsigned($unsigned((wire65 ?
                      wire31 : wire29))) ?
                  (($signed(reg34) ? wire29 : (8'h9d)) ^~ (wire35 >>> {wire38,
                      wire35})) : reg68));
              reg71 <= $signed(reg72[(4'hd):(2'h2)]);
            end
          reg73 <= ((+wire30) ? reg69[(1'h1):(1'h1)] : (+wire67));
          if ($signed((^~$signed((wire32[(1'h0):(1'h0)] ?
              (wire31 ? reg70 : reg74) : $signed(reg34))))))
            begin
              reg74 <= reg68;
              reg75 <= ($unsigned($signed({(wire28 * (8'ha1))})) <<< $unsigned(((+$unsigned(wire32)) >> ((wire65 >> reg74) ?
                  wire38[(3'h5):(3'h5)] : (wire37 ^~ reg69)))));
              reg76 <= (+($signed(($signed((8'ha2)) ?
                      (wire36 >> (8'h9f)) : ((8'hb6) || wire30))) ?
                  ((8'ha3) ?
                      ($signed(wire39) ?
                          (reg74 ?
                              reg74 : wire36) : reg70[(4'h9):(3'h6)]) : wire28) : reg69[(4'he):(3'h5)]));
              reg77 <= reg73;
              reg78 <= (reg70 ? wire65 : wire31);
            end
          else
            begin
              reg74 <= (wire27 ?
                  (((^~(wire35 ? reg71 : (8'hba))) >= ((^~wire32) ?
                      (^reg76) : (~reg71))) ~^ $signed((+reg75))) : ($unsigned(wire31[(3'h5):(3'h5)]) * reg78[(3'h4):(1'h0)]));
              reg75 <= (8'hbd);
              reg76 <= $unsigned((({(!reg77), (wire32 && wire36)} != (((7'h43) ?
                  reg71 : wire36) - $unsigned(reg74))) ^ (|$signed($signed(reg71)))));
            end
        end
      reg79 <= ($signed(($unsigned((reg76 ? (8'ha1) : reg78)) ?
              (~(!wire36)) : reg73)) ?
          (($signed((-reg73)) ? $unsigned((!reg73)) : (~^(wire39 == reg73))) ?
              ($signed(wire65) << reg71) : ($signed((wire65 ?
                      wire38 : wire65)) ?
                  (reg68 <<< wire67[(3'h6):(2'h3)]) : wire28)) : $signed($unsigned((~wire35[(2'h2):(1'h1)]))));
    end
  assign wire80 = wire36[(5'h12):(5'h10)];
  assign wire81 = reg70[(1'h1):(1'h0)];
  assign wire82 = (^(&(^$unsigned($signed(wire65)))));
  assign wire83 = $signed(((!wire30[(5'h15):(4'hd)]) ?
                      (8'hba) : ((((8'haa) != wire81) >= ((8'hb4) ~^ (8'hb5))) ?
                          reg68[(3'h7):(3'h7)] : ((wire32 >> wire31) ?
                              (wire65 ? reg70 : wire32) : $unsigned(wire39)))));
  assign wire84 = (wire30 ?
                      $unsigned((wire30 ?
                          (8'ha9) : ($unsigned((8'hb6)) > $signed(wire28)))) : $signed(reg72[(1'h1):(1'h0)]));
  assign wire85 = ((~(~$unsigned(wire81))) ?
                      ($signed(((wire39 ? wire39 : reg33) ?
                          (wire35 ?
                              reg33 : wire32) : wire37[(3'h6):(2'h3)])) <<< ($unsigned(((7'h43) ?
                              wire37 : wire81)) ?
                          $signed(((8'hac) ?
                              wire82 : reg78)) : reg79)) : (reg79 ?
                          $unsigned({(~&wire82),
                              (wire81 ?
                                  wire36 : (8'ha9))}) : {(~^(wire37 | (8'ha0)))}));
  module86 #() modinst110 (wire109, clk, wire80, wire81, reg70, reg71);
  always
    @(posedge clk) begin
      reg111 <= ((&$unsigned((^(~reg72)))) - (({(|wire80)} ?
              (wire67[(1'h0):(1'h0)] ?
                  {wire28} : $unsigned((8'hac))) : (8'hb5)) ?
          wire81[(3'h6):(2'h2)] : (!{wire83[(2'h3):(1'h1)],
              (reg33 == reg77)})));
    end
  assign wire112 = $unsigned(($signed((8'h9e)) ?
                       ((reg76[(3'h7):(2'h2)] ?
                           (8'haf) : reg70) + wire38) : ({(reg68 ?
                               wire109 : reg33)} + ((reg68 ?
                           wire38 : wire109) || {reg34}))));
endmodule

module module86  (y, clk, wire90, wire89, wire88, wire87);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire90;
  input wire signed [(4'h8):(1'h0)] wire89;
  input wire signed [(3'h7):(1'h0)] wire88;
  input wire signed [(5'h15):(1'h0)] wire87;
  wire [(5'h12):(1'h0)] wire108;
  wire signed [(5'h13):(1'h0)] wire107;
  wire signed [(3'h4):(1'h0)] wire106;
  wire signed [(2'h2):(1'h0)] wire105;
  wire [(3'h6):(1'h0)] wire104;
  wire signed [(2'h3):(1'h0)] wire103;
  wire signed [(5'h13):(1'h0)] wire102;
  wire signed [(5'h11):(1'h0)] wire101;
  wire signed [(3'h6):(1'h0)] wire100;
  wire [(4'hc):(1'h0)] wire99;
  wire [(3'h7):(1'h0)] wire98;
  wire [(5'h11):(1'h0)] wire97;
  wire [(3'h4):(1'h0)] wire92;
  wire [(2'h2):(1'h0)] wire91;
  reg signed [(3'h4):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg95 = (1'h0);
  reg [(4'he):(1'h0)] reg94 = (1'h0);
  reg [(5'h15):(1'h0)] reg93 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire92,
                 wire91,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 (1'h0)};
  assign wire91 = ((~|wire90) >>> ((((^(8'hbf)) ?
                              ((8'ha6) ? wire87 : wire88) : $signed((8'haa))) ?
                          wire88 : (wire87[(5'h15):(4'he)] ?
                              wire89 : (^~wire90))) ?
                      $signed($signed($signed(wire88))) : $signed(wire87)));
  assign wire92 = $signed(wire87);
  always
    @(posedge clk) begin
      reg93 <= (&(8'had));
      reg94 <= (^(wire89[(2'h2):(2'h2)] < $unsigned(wire89[(4'h8):(1'h0)])));
      reg95 <= reg94[(1'h0):(1'h0)];
      reg96 <= wire89;
    end
  assign wire97 = (((((wire90 < wire88) >>> wire88[(2'h3):(1'h0)]) || $unsigned($unsigned(wire92))) + (-reg94[(4'hb):(3'h7)])) ?
                      ((!{$unsigned(reg96), wire90}) ?
                          (({wire89, reg94} ?
                                  $unsigned(wire91) : wire90[(3'h7):(2'h3)]) ?
                              $unsigned((wire89 | (8'ha4))) : {wire92[(3'h4):(3'h4)]}) : (wire88[(3'h6):(2'h2)] ?
                              $unsigned($signed(wire91)) : ((~&wire88) ?
                                  (reg95 * reg95) : (&reg94)))) : $unsigned({((~|reg94) + $signed(wire90)),
                          {(|wire87), (&wire89)}}));
  assign wire98 = (&(wire90 ?
                      wire89 : ((~^(reg95 ? wire90 : wire88)) ?
                          $signed((7'h42)) : reg95)));
  assign wire99 = (&(reg96[(1'h1):(1'h0)] ?
                      (wire87[(4'h8):(1'h1)] >= $unsigned((wire88 != wire89))) : {((wire98 ?
                              wire88 : wire89) & (wire97 < reg93))}));
  assign wire100 = $signed(($unsigned(wire89[(1'h1):(1'h0)]) ?
                       ($unsigned($signed(wire98)) > (wire90 >> $unsigned(wire89))) : ({{reg93,
                               wire97}} & ((~|wire97) * $signed((8'hb6))))));
  assign wire101 = $signed(wire90[(2'h3):(1'h0)]);
  assign wire102 = (wire90 && {wire92,
                       ($unsigned((wire97 >> wire99)) && $unsigned(wire87))});
  assign wire103 = $unsigned((wire89 >>> $signed($unsigned((~&reg94)))));
  assign wire104 = (wire92 & $unsigned((8'ha4)));
  assign wire105 = $unsigned($signed($signed((~|wire101))));
  assign wire106 = (8'hac);
  assign wire107 = $signed({{(wire103 & $signed((8'hb7)))}});
  assign wire108 = (wire91[(1'h0):(1'h0)] ?
                       $unsigned($signed(((wire104 ? wire104 : (8'had)) ?
                           {reg95} : ((8'ha7) ? (8'hbe) : wire91)))) : wire106);
endmodule

module module40
#(parameter param63 = {((~^(((8'hb7) ? (8'haa) : (8'hb9)) ? (~&(8'haf)) : (~^(7'h44)))) ? ((|(&(8'had))) ? ((8'h9d) ? (!(8'hb1)) : (+(7'h42))) : {((8'hb8) ? (8'hbe) : (8'ha5)), ((8'ha2) || (8'hab))}) : ({(8'hb8)} ? (!(~|(8'hbd))) : (+((8'hb7) && (7'h44)))))}, 
parameter param64 = param63)
(y, clk, wire45, wire44, wire43, wire42, wire41);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire45;
  input wire signed [(4'hd):(1'h0)] wire44;
  input wire [(2'h2):(1'h0)] wire43;
  input wire [(4'hb):(1'h0)] wire42;
  input wire signed [(4'hd):(1'h0)] wire41;
  wire [(4'h8):(1'h0)] wire52;
  wire signed [(5'h14):(1'h0)] wire51;
  wire [(4'ha):(1'h0)] wire50;
  wire signed [(5'h13):(1'h0)] wire49;
  wire signed [(4'he):(1'h0)] wire48;
  wire [(4'he):(1'h0)] wire47;
  wire signed [(4'hb):(1'h0)] wire46;
  reg [(4'ha):(1'h0)] reg62 = (1'h0);
  reg [(3'h6):(1'h0)] reg61 = (1'h0);
  reg [(5'h14):(1'h0)] reg60 = (1'h0);
  reg [(4'h9):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg57 = (1'h0);
  reg [(2'h3):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg53 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 (1'h0)};
  assign wire46 = $signed(($unsigned(($signed(wire45) | (wire43 >= wire42))) ?
                      {(-(wire45 >= wire45)),
                          wire43[(2'h2):(1'h1)]} : wire43[(1'h0):(1'h0)]));
  assign wire47 = wire46;
  assign wire48 = wire45[(2'h3):(1'h0)];
  assign wire49 = ((&$unsigned((-(wire45 ?
                      wire41 : wire41)))) | ({wire44[(4'h9):(3'h7)], wire48} ?
                      (({wire44} <= $unsigned(wire41)) | wire41) : (^~(|wire45[(1'h1):(1'h0)]))));
  assign wire50 = $signed(wire45);
  assign wire51 = wire45;
  assign wire52 = (7'h43);
  always
    @(posedge clk) begin
      if ($signed(($signed(wire41[(4'h9):(1'h0)]) * (7'h41))))
        begin
          reg53 <= {$unsigned($unsigned(($signed((8'ha9)) == (wire48 ?
                  wire41 : (8'hb4)))))};
          reg54 <= ($signed($signed((+wire44[(3'h6):(1'h0)]))) ?
              wire41[(4'hb):(3'h7)] : $signed((^$unsigned((wire41 != wire51)))));
          reg55 <= wire45[(2'h2):(1'h0)];
          reg56 <= $signed((8'h9e));
          reg57 <= wire41;
        end
      else
        begin
          reg53 <= (&($signed(wire51) ? reg55[(1'h0):(1'h0)] : {reg54}));
          reg54 <= {($signed($signed($signed(wire41))) ?
                  wire51[(2'h2):(2'h2)] : wire42),
              (^({(~^reg54),
                  (~|reg56)} & (wire49[(4'hc):(2'h2)] | reg57[(1'h0):(1'h0)])))};
          reg55 <= ((~&$unsigned(($signed(reg55) >>> reg56))) ?
              ((wire42 ?
                  wire52[(3'h6):(1'h0)] : ($signed(wire52) ~^ (wire44 ?
                      wire45 : wire46))) >> {$signed(reg56[(2'h3):(2'h2)]),
                  wire50[(4'h8):(4'h8)]}) : reg53);
        end
      reg58 <= $signed((wire43[(1'h1):(1'h1)] ?
          {{wire44, $signed(wire45)}} : wire51[(4'h9):(1'h0)]));
      reg59 <= wire48;
    end
  always
    @(posedge clk) begin
      reg60 <= (wire41[(4'h8):(2'h2)] ? reg54 : wire52);
      reg61 <= ({$unsigned({(-(8'hac)), $signed((7'h43))}),
          reg57[(3'h6):(2'h2)]} == reg53[(3'h5):(3'h5)]);
      reg62 <= $unsigned(($unsigned(wire49[(2'h2):(1'h0)]) ?
          wire45[(1'h0):(1'h0)] : ($unsigned(reg55) ?
              reg55[(3'h7):(3'h5)] : (reg60 ?
                  $signed(wire45) : reg57[(2'h3):(2'h3)]))));
    end
endmodule
