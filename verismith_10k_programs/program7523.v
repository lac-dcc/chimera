module top
#(parameter param135 = (((-(&((8'ha8) != (8'hb5)))) ? ((8'ha6) ? ((~|(8'h9e)) - ((7'h43) ^ (8'h9f))) : (-((8'hbf) <<< (8'hbe)))) : (((8'hb4) ? (^(8'hb0)) : ((8'ha3) ? (7'h43) : (8'had))) ? (((8'ha3) ^ (8'ha1)) ? (+(8'hb4)) : (^(8'ha4))) : (+{(8'hae), (8'ha5)}))) & (|((!{(8'hb3), (8'ha2)}) ? (~|((8'hb1) ? (8'hb1) : (8'hac))) : (((7'h43) ? (8'hb9) : (8'h9e)) ? ((8'hba) ? (8'ha4) : (8'ha7)) : ((8'hb4) ? (8'ha6) : (8'ha1)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire134;
  wire [(4'h8):(1'h0)] wire133;
  wire [(4'he):(1'h0)] wire132;
  wire signed [(3'h6):(1'h0)] wire131;
  wire signed [(2'h2):(1'h0)] wire130;
  wire signed [(3'h5):(1'h0)] wire128;
  assign y = {wire134, wire133, wire132, wire131, wire130, wire128, (1'h0)};
  module4 #() modinst129 (.clk(clk), .wire8(wire2), .y(wire128), .wire7(wire0), .wire6(wire1), .wire5(wire3));
  assign wire130 = $unsigned(wire3[(1'h0):(1'h0)]);
  assign wire131 = wire130[(1'h1):(1'h0)];
  assign wire132 = wire1[(3'h7):(2'h2)];
  assign wire133 = $unsigned(wire3);
  assign wire134 = ($signed($signed($signed($signed(wire1)))) ?
                       wire1[(4'hf):(1'h1)] : wire3[(4'hf):(1'h0)]);
endmodule

module module4  (y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h21c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire8;
  input wire signed [(4'h9):(1'h0)] wire7;
  input wire [(3'h6):(1'h0)] wire6;
  input wire [(3'h4):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire127;
  wire signed [(4'hf):(1'h0)] wire125;
  wire signed [(5'h14):(1'h0)] wire70;
  wire [(5'h14):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire32;
  wire [(3'h4):(1'h0)] wire31;
  wire signed [(5'h13):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire29;
  wire [(5'h15):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire10;
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg72 = (1'h0);
  reg [(4'he):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg74 = (1'h0);
  reg [(3'h7):(1'h0)] reg75 = (1'h0);
  reg [(5'h15):(1'h0)] reg76 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg77 = (1'h0);
  reg [(4'he):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg79 = (1'h0);
  reg [(4'hd):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg82 = (1'h0);
  reg [(3'h5):(1'h0)] reg83 = (1'h0);
  reg [(4'he):(1'h0)] reg84 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg85 = (1'h0);
  assign y = {wire127,
                 wire125,
                 wire70,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire11,
                 wire10,
                 reg35,
                 reg34,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
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
                 reg9,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg9 <= wire6;
    end
  assign wire10 = $signed($signed($signed($unsigned((-(8'hab))))));
  assign wire11 = (wire5 ?
                      (wire7 ?
                          ($unsigned({wire7}) != (~(wire6 & wire8))) : {({wire8} ?
                                  (wire8 == reg9) : {wire8,
                                      wire10})}) : $unsigned($signed($signed($unsigned(wire6)))));
  always
    @(posedge clk) begin
      if ((reg9 * {(~(~|$signed(wire8)))}))
        begin
          reg12 <= ((wire5 ?
                  (+$signed((wire8 ?
                      wire6 : wire11))) : $signed($unsigned((wire5 ?
                      wire11 : wire5)))) ?
              ($unsigned((8'hbd)) ?
                  ($signed((wire11 ^ wire11)) ?
                      (wire10[(4'h9):(3'h5)] ?
                          (wire6 ? wire6 : wire8) : ((7'h40) ?
                              (8'hbc) : wire7)) : ((|wire7) || wire10)) : wire5) : reg9[(1'h1):(1'h0)]);
        end
      else
        begin
          reg12 <= {wire5};
          reg13 <= wire11[(3'h7):(2'h2)];
          reg14 <= $signed({$signed($unsigned($signed(wire8)))});
          if (wire11[(3'h4):(2'h3)])
            begin
              reg15 <= {wire10, $signed(wire8[(4'hf):(3'h7)])};
            end
          else
            begin
              reg15 <= reg12;
              reg16 <= $signed(($unsigned($signed((wire5 ? wire8 : reg9))) ?
                  reg14 : $signed(wire6[(3'h5):(1'h0)])));
              reg17 <= (~^$unsigned($signed((~&(+reg16)))));
            end
        end
      if ($unsigned((~^$unsigned(wire5))))
        begin
          if (wire7[(1'h1):(1'h0)])
            begin
              reg18 <= ((8'ha8) ? (8'ha7) : wire10[(4'h8):(1'h0)]);
              reg19 <= (~$unsigned(((^~reg14) >= $signed((reg18 ?
                  reg14 : wire8)))));
              reg20 <= (({(reg14[(1'h0):(1'h0)] ?
                      wire11[(3'h5):(3'h4)] : ((8'ha3) ?
                          reg15 : reg13))} & wire8[(2'h3):(2'h2)]) << (~reg19[(5'h10):(1'h1)]));
              reg21 <= $signed($signed(($signed(reg12[(3'h7):(3'h6)]) ?
                  ($signed(wire7) ?
                      (^reg13) : ((7'h41) ?
                          wire5 : reg17)) : $signed((&wire6)))));
              reg22 <= wire8;
            end
          else
            begin
              reg18 <= wire8[(4'he):(2'h2)];
            end
          reg23 <= $unsigned((8'hbf));
          reg24 <= reg16;
          if (reg14)
            begin
              reg25 <= (~&$unsigned((^(wire5 <= $unsigned(wire7)))));
              reg26 <= reg13[(1'h1):(1'h1)];
              reg27 <= (8'ha0);
              reg28 <= reg25[(1'h1):(1'h0)];
            end
          else
            begin
              reg25 <= (((reg23[(3'h4):(2'h2)] >> $signed($signed(reg21))) || (reg18 * (~|$signed(reg9)))) - reg13);
            end
        end
      else
        begin
          reg18 <= (reg22 - (|$signed(reg19)));
          reg19 <= $signed({$unsigned((+(&(7'h40)))), wire7});
        end
    end
  assign wire29 = (^~reg9);
  assign wire30 = $unsigned(wire10);
  assign wire31 = (~^$unsigned(wire8));
  assign wire32 = wire29;
  assign wire33 = $signed(reg18[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg34 <= reg25[(2'h2):(1'h1)];
      reg35 <= reg9;
    end
  module36 #() modinst71 (.wire40(wire29), .wire38(reg27), .wire41(reg26), .y(wire70), .clk(clk), .wire37(wire8), .wire39(reg15));
  always
    @(posedge clk) begin
      reg72 <= (+$signed((($signed(reg15) + {(8'hb5),
          reg20}) ^~ (~&(~|(7'h43))))));
    end
  always
    @(posedge clk) begin
      reg73 <= (&reg17[(5'h12):(1'h1)]);
      reg74 <= (8'hac);
      reg75 <= wire31[(1'h1):(1'h1)];
      reg76 <= (|(+(~&((8'hbd) >> (!(8'hbf))))));
      reg77 <= reg35;
    end
  always
    @(posedge clk) begin
      reg78 <= reg76;
      if ($unsigned($unsigned({reg28[(2'h2):(1'h0)],
          ({reg76, reg78} * $signed((8'ha4)))})))
        begin
          reg79 <= (reg16[(2'h2):(2'h2)] ^~ ($signed((~{reg13, wire6})) ?
              $unsigned(wire6) : $signed(((wire31 ^ (8'h9c)) ?
                  (reg18 ~^ reg21) : {reg35}))));
          reg80 <= wire5[(1'h0):(1'h0)];
          if ((wire30[(2'h3):(2'h3)] ?
              reg72[(5'h13):(4'ha)] : $unsigned(reg76)))
            begin
              reg81 <= $signed((reg34 ?
                  (|{reg14[(2'h2):(2'h2)],
                      reg21[(2'h2):(1'h1)]}) : reg12[(4'he):(4'hb)]));
              reg82 <= reg35;
              reg83 <= reg21[(2'h2):(2'h2)];
              reg84 <= $signed(reg25);
              reg85 <= (reg77 ?
                  ((^(wire11[(2'h2):(1'h1)] ?
                      $unsigned(wire30) : $signed(wire29))) <= ($unsigned((~^(8'hb8))) != ({reg72,
                      reg17} * $unsigned((8'haa))))) : ($signed((8'hac)) ?
                      (~&(&$signed((8'hb1)))) : reg82));
            end
          else
            begin
              reg81 <= reg24;
            end
        end
      else
        begin
          reg79 <= {((8'haa) ?
                  $signed((reg19[(4'he):(1'h1)] > (wire30 ?
                      reg9 : reg85))) : wire32)};
          reg80 <= reg17[(4'h9):(4'h9)];
        end
    end
  module86 #() modinst126 (.clk(clk), .wire90(reg80), .wire91(wire70), .y(wire125), .wire88(wire7), .wire89(reg76), .wire87(reg27));
  assign wire127 = (reg79[(4'ha):(4'h9)] > reg75[(3'h7):(3'h4)]);
endmodule

module module86
#(parameter param124 = (({{((8'hb2) > (8'hba))}} != ((!{(8'hb0), (8'ha8)}) || ((^(8'hbe)) ^ (~|(8'ha1))))) ~^ (^(((~|(8'hb3)) ? (8'hbc) : {(8'ha8)}) | ((^(8'ha3)) - {(8'hb3), (8'ha2)})))))
(y, clk, wire91, wire90, wire89, wire88, wire87);
  output wire [(32'h156):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire91;
  input wire signed [(4'hd):(1'h0)] wire90;
  input wire [(5'h14):(1'h0)] wire89;
  input wire [(4'h9):(1'h0)] wire88;
  input wire signed [(4'hd):(1'h0)] wire87;
  wire [(5'h14):(1'h0)] wire123;
  wire signed [(5'h14):(1'h0)] wire122;
  wire signed [(4'ha):(1'h0)] wire121;
  wire signed [(4'h8):(1'h0)] wire110;
  wire [(4'h8):(1'h0)] wire109;
  wire signed [(4'hc):(1'h0)] wire108;
  wire [(4'he):(1'h0)] wire107;
  wire signed [(4'hd):(1'h0)] wire106;
  wire signed [(4'hc):(1'h0)] wire105;
  wire signed [(3'h4):(1'h0)] wire96;
  wire [(3'h5):(1'h0)] wire95;
  wire signed [(4'hf):(1'h0)] wire94;
  wire [(3'h7):(1'h0)] wire93;
  wire signed [(3'h6):(1'h0)] wire92;
  reg [(4'hd):(1'h0)] reg120 = (1'h0);
  reg [(4'hf):(1'h0)] reg119 = (1'h0);
  reg [(5'h15):(1'h0)] reg118 = (1'h0);
  reg [(2'h3):(1'h0)] reg117 = (1'h0);
  reg [(3'h4):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg115 = (1'h0);
  reg [(3'h6):(1'h0)] reg114 = (1'h0);
  reg [(2'h2):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg111 = (1'h0);
  reg [(4'hd):(1'h0)] reg104 = (1'h0);
  reg [(5'h14):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg101 = (1'h0);
  reg [(5'h13):(1'h0)] reg100 = (1'h0);
  reg [(5'h10):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg97 = (1'h0);
  assign y = {wire123,
                 wire122,
                 wire121,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
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
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 (1'h0)};
  assign wire92 = wire90[(3'h5):(2'h2)];
  assign wire93 = (wire91[(4'hd):(3'h4)] ?
                      (wire91 ?
                          $unsigned((^~(-wire89))) : ({$signed(wire92)} ?
                              $unsigned((wire91 && wire91)) : ($signed(wire88) ?
                                  (wire89 ~^ wire92) : {wire89,
                                      wire90}))) : $unsigned((8'hb4)));
  assign wire94 = wire92[(1'h1):(1'h0)];
  assign wire95 = $unsigned($signed(wire92));
  assign wire96 = {(wire92[(2'h3):(2'h2)] ?
                          (&((wire87 >= (8'hb5)) - (7'h44))) : wire93[(1'h0):(1'h0)])};
  always
    @(posedge clk) begin
      if ($signed({wire93}))
        begin
          reg97 <= ((+(8'ha5)) ?
              wire94[(3'h4):(1'h0)] : $signed($unsigned(wire90[(4'hd):(3'h6)])));
          reg98 <= $signed({$signed($signed((8'ha4)))});
          reg99 <= (8'hbd);
          if (wire90[(3'h6):(3'h6)])
            begin
              reg100 <= (8'hb3);
              reg101 <= {$unsigned(wire94[(4'hd):(1'h0)]), (8'h9c)};
              reg102 <= reg101[(3'h6):(3'h4)];
              reg103 <= ($signed(($unsigned(wire92[(3'h6):(2'h3)]) ?
                  $signed(reg98) : ($unsigned(reg99) ?
                      (reg100 || reg100) : $signed(reg98)))) >>> ({$unsigned($signed(wire95)),
                      ((wire91 <= (8'h9e)) <= (wire87 ? wire96 : wire89))} ?
                  {$unsigned((^~wire90)),
                      $signed((wire94 > reg99))} : (reg100[(5'h12):(3'h7)] || wire94[(2'h2):(1'h1)])));
              reg104 <= $unsigned($signed(($unsigned($unsigned(wire95)) + wire92[(1'h1):(1'h0)])));
            end
          else
            begin
              reg100 <= $signed((-$unsigned((^(&reg101)))));
              reg101 <= wire90[(4'h9):(3'h6)];
              reg102 <= ((^$unsigned(wire93)) ? reg99 : wire88[(3'h4):(1'h1)]);
            end
        end
      else
        begin
          reg97 <= ($signed(($signed($signed(wire93)) ?
              ((reg103 * wire93) || $unsigned((8'ha8))) : {(|wire90),
                  (wire90 ~^ wire87)})) >> $unsigned($signed(($unsigned(reg100) && (wire92 ?
              reg103 : wire94)))));
          reg98 <= reg103[(3'h7):(3'h6)];
        end
    end
  assign wire105 = wire93;
  assign wire106 = (wire91 ?
                       (8'haf) : $signed(($signed(reg102[(1'h0):(1'h0)]) > (wire89 ?
                           (wire96 ? wire94 : reg99) : ((8'hbf) ?
                               wire87 : reg99)))));
  assign wire107 = $signed($unsigned($signed((7'h43))));
  assign wire108 = $signed($signed(({reg98,
                       wire89[(3'h7):(1'h1)]} & ($unsigned(wire95) ?
                       (8'hbc) : reg102))));
  assign wire109 = (wire92 ?
                       (wire96 ?
                           ($signed($unsigned(wire93)) < (~$signed(wire108))) : (-(wire108 ?
                               (wire87 - wire108) : $signed(wire96)))) : (^$unsigned($unsigned($signed(wire95)))));
  assign wire110 = (wire109[(3'h6):(3'h4)] ? $signed(wire88) : wire94);
  always
    @(posedge clk) begin
      reg111 <= wire92[(2'h2):(1'h1)];
      reg112 <= (~$unsigned(reg97));
      if (reg103)
        begin
          reg113 <= (-($signed((8'had)) >> reg112[(1'h1):(1'h1)]));
          if ((-({reg97} ?
              $unsigned($unsigned(wire90)) : ($signed((~&reg104)) ?
                  (reg104 <= $unsigned(wire95)) : {(reg98 || reg98)}))))
            begin
              reg114 <= (^reg99);
              reg115 <= reg104[(4'hd):(4'h8)];
              reg116 <= ({(~|wire90),
                  (^$signed((wire91 * (8'hb9))))} > ({(8'hbb)} ?
                  wire109[(1'h1):(1'h1)] : reg100[(2'h2):(1'h0)]));
            end
          else
            begin
              reg114 <= (&$signed((&$unsigned(wire88[(4'h8):(1'h1)]))));
              reg115 <= wire87;
              reg116 <= $unsigned(((+(8'h9c)) == (reg115 ?
                  {wire110[(1'h0):(1'h0)], reg97} : wire93[(1'h1):(1'h0)])));
            end
          reg117 <= {(reg101 ?
                  (~$signed((!(8'haa)))) : $unsigned($signed((reg113 ?
                      reg101 : wire96)))),
              (~&$unsigned($unsigned($signed(wire107))))};
          if ((~^$unsigned(wire109)))
            begin
              reg118 <= reg101[(2'h2):(1'h1)];
              reg119 <= ($signed($unsigned(wire88[(1'h1):(1'h0)])) != reg117[(1'h0):(1'h0)]);
              reg120 <= ((($signed($signed(reg111)) >> {reg102}) ?
                      $signed((^~reg112[(1'h0):(1'h0)])) : {wire94[(3'h4):(1'h0)],
                          reg111[(1'h1):(1'h1)]}) ?
                  wire94 : reg112[(1'h1):(1'h0)]);
            end
          else
            begin
              reg118 <= $unsigned(((^~((reg104 ? wire92 : reg116) ?
                      $signed(reg116) : $signed(reg111))) ?
                  $unsigned($unsigned(((8'hac) ^~ wire106))) : (|reg115)));
              reg119 <= ($signed(($unsigned((reg111 ^~ (8'ha6))) ?
                  ($unsigned(reg119) ?
                      (+reg117) : $signed((8'ha6))) : ($signed(wire91) ?
                      $unsigned(reg117) : (wire110 ?
                          wire87 : wire93)))) ^~ $signed((|($signed((8'hb9)) > wire105))));
              reg120 <= (reg111 ?
                  (^{($signed(reg117) ? (&(8'hb5)) : (reg119 < (8'had))),
                      reg104}) : {($unsigned((reg98 ?
                          wire87 : reg102)) << (~&$signed((8'hae)))),
                      ((reg118[(2'h2):(2'h2)] != $unsigned(wire89)) || $signed(((8'ha0) < wire91)))});
            end
        end
      else
        begin
          if ({((7'h40) > ((wire106[(2'h3):(2'h2)] ?
                      $signed(wire93) : $signed(wire96)) ?
                  ($signed(reg116) ^~ (wire109 ?
                      wire106 : reg101)) : $signed({wire89})))})
            begin
              reg113 <= ($signed(reg114[(2'h3):(2'h3)]) ?
                  ($unsigned((-wire87[(2'h2):(2'h2)])) || (~&$unsigned(((8'hbe) << wire108)))) : (+reg98));
              reg114 <= reg97[(3'h5):(3'h4)];
              reg115 <= (($unsigned($unsigned((wire109 ~^ wire89))) || (|((~|wire89) <= $unsigned(reg104)))) ?
                  {(+{wire90, (reg117 ? wire87 : wire106)})} : (!wire107));
              reg116 <= ({$signed(({(8'hb9), reg102} ?
                          wire110[(2'h3):(2'h3)] : (wire106 ?
                              reg120 : (8'hbc)))),
                      (&(reg115[(1'h0):(1'h0)] & (~&reg97)))} ?
                  (wire91 ?
                      $unsigned(reg99) : (wire90 >> $unsigned({reg113}))) : (~reg115));
              reg117 <= reg120[(4'hc):(4'hc)];
            end
          else
            begin
              reg113 <= wire93[(2'h2):(1'h0)];
              reg114 <= $signed((reg97 >> (~reg111)));
              reg115 <= ($unsigned($unsigned($unsigned((reg117 ?
                      reg119 : wire91)))) ?
                  reg103[(5'h10):(1'h0)] : ($signed((8'ha3)) ?
                      (reg104[(4'hc):(1'h1)] ?
                          ($unsigned(wire92) << wire94[(2'h3):(2'h3)]) : $signed((-reg101))) : ($unsigned(reg117[(2'h2):(1'h0)]) ?
                          reg97 : reg99)));
              reg116 <= $unsigned((+({(reg118 ? wire107 : reg101)} ?
                  $signed($unsigned(reg101)) : (8'hb2))));
            end
          reg118 <= $signed($signed((reg104[(3'h4):(1'h1)] ?
              ((wire88 ~^ wire95) - reg117[(2'h3):(1'h1)]) : $unsigned(wire87[(4'hb):(4'hb)]))));
        end
    end
  assign wire121 = {(|{$unsigned($unsigned(wire96))}),
                       $signed(reg102[(3'h6):(2'h2)])};
  assign wire122 = (8'ha8);
  assign wire123 = {(8'ha2)};
endmodule

module module36
#(parameter param69 = (8'hb8))
(y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire41;
  input wire [(3'h7):(1'h0)] wire40;
  input wire signed [(5'h12):(1'h0)] wire39;
  input wire signed [(5'h11):(1'h0)] wire38;
  input wire [(5'h12):(1'h0)] wire37;
  wire [(3'h4):(1'h0)] wire57;
  wire signed [(3'h4):(1'h0)] wire56;
  wire signed [(3'h6):(1'h0)] wire55;
  wire signed [(3'h7):(1'h0)] wire54;
  wire [(3'h4):(1'h0)] wire53;
  wire [(4'hd):(1'h0)] wire42;
  reg [(5'h11):(1'h0)] reg68 = (1'h0);
  reg [(2'h2):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg65 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg63 = (1'h0);
  reg [(5'h10):(1'h0)] reg62 = (1'h0);
  reg [(4'hf):(1'h0)] reg61 = (1'h0);
  reg [(5'h11):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg58 = (1'h0);
  reg [(3'h6):(1'h0)] reg52 = (1'h0);
  reg [(5'h10):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg50 = (1'h0);
  reg [(2'h3):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg47 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(3'h6):(1'h0)] reg43 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire42,
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
                 (1'h0)};
  assign wire42 = wire38[(4'hc):(4'hb)];
  always
    @(posedge clk) begin
      reg43 <= ({$signed(wire42), wire41} * $unsigned((~^wire39)));
      if ($unsigned((($unsigned((wire37 ? reg43 : wire40)) ?
              ((wire39 | wire42) ?
                  (wire37 ?
                      wire41 : wire37) : (~(8'hba))) : ((8'h9c) * wire40)) ?
          (~&$signed((~|(8'hbf)))) : wire40)))
        begin
          reg44 <= (wire37 <<< wire42[(3'h6):(3'h4)]);
          reg45 <= (wire40[(2'h2):(1'h0)] ? (8'h9c) : (7'h44));
          reg46 <= (~{wire42[(1'h1):(1'h0)]});
          if (reg43)
            begin
              reg47 <= ({reg46} ?
                  $unsigned($unsigned($unsigned(wire37))) : wire37[(3'h5):(1'h0)]);
              reg48 <= (~^wire41[(2'h3):(1'h1)]);
              reg49 <= $unsigned(wire41[(2'h2):(2'h2)]);
              reg50 <= $signed({wire37, $signed({$signed(reg47)})});
              reg51 <= (((({reg44, reg47} ?
                          {reg43, (8'ha6)} : reg49) | (!$signed(reg47))) ?
                      (((~reg48) ?
                              (wire38 ? reg48 : reg43) : $unsigned(reg49)) ?
                          (wire37[(5'h10):(4'h8)] || wire42) : reg50) : $unsigned(wire42)) ?
                  $signed(reg43[(3'h4):(1'h0)]) : $signed($unsigned(wire41)));
            end
          else
            begin
              reg47 <= ((&wire37[(1'h0):(1'h0)]) <<< $unsigned({$unsigned((wire41 ?
                      reg44 : (8'hbe)))}));
              reg48 <= wire41;
              reg49 <= (-(^~$unsigned(reg44[(5'h10):(4'he)])));
              reg50 <= $signed(($signed($signed(reg43)) ?
                  ({$signed(wire38),
                      $signed(wire39)} != $signed({(8'ha8)})) : (~^(8'hb0))));
            end
          reg52 <= {reg47[(3'h6):(1'h1)], wire41[(2'h2):(1'h0)]};
        end
      else
        begin
          reg44 <= $signed(reg44);
          if (reg43)
            begin
              reg45 <= {$unsigned($unsigned((+$unsigned(wire41))))};
              reg46 <= {((wire37 & reg45) ?
                      $signed(wire38[(5'h11):(3'h5)]) : wire42[(4'hd):(3'h5)]),
                  {$unsigned((~|(reg52 >>> reg46))),
                      ((|(&wire41)) != ($unsigned(reg49) ?
                          (8'hab) : {reg49, wire41}))}};
            end
          else
            begin
              reg45 <= $signed(wire42);
              reg46 <= reg52;
              reg47 <= $unsigned(wire39[(1'h0):(1'h0)]);
              reg48 <= $unsigned(($signed($signed(wire42[(4'ha):(3'h4)])) ?
                  $unsigned(({reg45} ? reg45 : (^~reg45))) : $signed(reg50)));
            end
          reg49 <= reg43;
          reg50 <= (reg49[(1'h1):(1'h0)] ?
              $signed((wire39[(3'h7):(3'h5)] <<< {$unsigned(reg47),
                  $unsigned(wire38)})) : reg44[(5'h13):(2'h3)]);
        end
    end
  assign wire53 = (8'ha6);
  assign wire54 = $unsigned(reg45);
  assign wire55 = (reg48 ? wire41[(2'h3):(2'h2)] : (^$signed(reg48)));
  assign wire56 = wire37;
  assign wire57 = $unsigned($signed({wire40[(3'h6):(3'h4)]}));
  always
    @(posedge clk) begin
      reg58 <= (&reg50[(3'h4):(1'h0)]);
      reg59 <= reg51[(4'ha):(1'h1)];
      reg60 <= $signed(($signed(wire41) >= ($unsigned({reg49,
          wire37}) > wire41[(2'h2):(2'h2)])));
      reg61 <= $unsigned((+reg59));
      if ({$signed(({$signed(reg58)} | ($signed(reg50) == (reg43 ?
              wire55 : wire42))))})
        begin
          reg62 <= reg50[(2'h3):(2'h2)];
          if ($unsigned($signed($signed((reg59 + ((8'ha3) >>> reg49))))))
            begin
              reg63 <= wire53;
              reg64 <= $unsigned((reg45 << {$unsigned((8'h9f))}));
              reg65 <= $unsigned(wire41[(2'h2):(2'h2)]);
            end
          else
            begin
              reg63 <= (^~reg51[(4'hf):(2'h2)]);
              reg64 <= $unsigned((reg61[(4'h8):(3'h5)] > $signed((reg52[(3'h4):(3'h4)] >> reg43))));
              reg65 <= $signed(reg45);
              reg66 <= ((|reg43) ?
                  reg62 : $signed((wire57[(1'h1):(1'h1)] ?
                      ($unsigned(wire54) | wire40[(2'h3):(2'h3)]) : (wire53[(1'h1):(1'h1)] ?
                          (~|reg64) : reg50))));
              reg67 <= wire54;
            end
          reg68 <= $unsigned(reg51);
        end
      else
        begin
          reg62 <= {($unsigned((reg44 ? wire42 : {(8'hb5), reg58})) ?
                  ($signed(wire53) << wire53[(1'h1):(1'h1)]) : $signed($signed((wire54 ?
                      wire39 : wire54))))};
          if ($unsigned($signed((wire55[(1'h0):(1'h0)] <= $signed((~&wire57))))))
            begin
              reg63 <= reg46;
              reg64 <= {$unsigned(reg46[(4'h8):(2'h3)])};
              reg65 <= $signed(reg46);
              reg66 <= $unsigned((({$signed(wire54)} ?
                      reg43[(1'h0):(1'h0)] : ((~^wire57) ?
                          reg58 : (reg63 >= reg64))) ?
                  {($signed(wire53) ~^ {(8'hb9), wire40}),
                      (-(^reg63))} : (~&(wire37[(5'h11):(3'h6)] != (reg63 ?
                      reg43 : reg46)))));
              reg67 <= reg51[(4'he):(4'h8)];
            end
          else
            begin
              reg63 <= reg63;
              reg64 <= reg45;
            end
        end
    end
endmodule
