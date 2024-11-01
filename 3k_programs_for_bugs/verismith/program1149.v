module top
#(parameter param125 = (|(-(8'ha2))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire124;
  wire signed [(5'h12):(1'h0)] wire123;
  wire signed [(4'hc):(1'h0)] wire121;
  wire [(5'h10):(1'h0)] wire116;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire76;
  wire signed [(5'h15):(1'h0)] wire118;
  wire signed [(3'h6):(1'h0)] wire119;
  reg [(5'h15):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg80 = (1'h0);
  reg [(4'hb):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg78 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire121,
                 wire116,
                 wire5,
                 wire76,
                 wire118,
                 wire119,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 (1'h0)};
  assign wire5 = wire0;
  module6 #() modinst77 (wire76, clk, wire0, wire2, wire4, wire5, wire3);
  always
    @(posedge clk) begin
      if ($signed(wire3[(1'h0):(1'h0)]))
        begin
          reg78 <= $signed(wire1[(3'h5):(1'h0)]);
          if ((reg78[(3'h4):(2'h3)] ?
              ((&((^wire1) ? $unsigned(reg78) : ((8'ha4) ? wire5 : (8'hb3)))) ?
                  ((wire5[(4'he):(2'h3)] ?
                      ((8'hae) * wire5) : $signed(wire4)) * ((&wire0) > $signed(wire1))) : $signed({wire1[(3'h5):(2'h2)],
                      (wire76 * wire4)})) : $unsigned(reg78[(3'h4):(2'h2)])))
            begin
              reg79 <= (~^((wire76 >= (8'hbc)) ?
                  wire4[(2'h2):(2'h2)] : $unsigned((((8'hb2) && reg78) ?
                      ((8'hb3) ? wire3 : wire76) : wire0[(3'h6):(2'h2)]))));
            end
          else
            begin
              reg79 <= ($signed(reg78[(1'h1):(1'h1)]) | ($unsigned(reg79) >>> (|$unsigned(wire5))));
              reg80 <= wire76;
            end
          reg81 <= (~&reg80[(3'h5):(1'h0)]);
        end
      else
        begin
          reg78 <= $unsigned(($signed(($unsigned(wire4) + (wire2 ?
              reg80 : wire4))) >>> $signed(wire5)));
          reg79 <= (8'ha7);
          reg80 <= $unsigned(wire2);
          reg81 <= $unsigned(wire0);
        end
    end
  module82 #() modinst117 (.y(wire116), .wire87(reg79), .clk(clk), .wire85(wire76), .wire83(wire2), .wire84(reg81), .wire86(wire1));
  assign wire118 = (wire2 ? {$signed($signed((8'ha2)))} : (8'hbf));
  module6 #() modinst120 (wire119, clk, wire5, wire116, wire0, wire118, wire4);
  module90 #() modinst122 (wire121, clk, wire118, reg80, wire2, reg81);
  assign wire123 = ((-$unsigned(wire1[(4'he):(4'hb)])) ?
                       (~^(((~&wire119) ?
                           (reg80 ? (7'h43) : reg80) : {wire116,
                               wire1}) > wire121)) : reg79);
  assign wire124 = (($unsigned($unsigned((~wire2))) <<< wire5) ?
                       $unsigned(wire119[(2'h3):(1'h0)]) : ((^~$signed((|wire1))) ?
                           ($signed(((8'ha2) || reg79)) ?
                               wire76[(5'h12):(2'h2)] : wire1[(2'h3):(2'h2)]) : reg80[(2'h2):(1'h1)]));
endmodule

module module82  (y, clk, wire87, wire86, wire85, wire84, wire83);
  output wire [(32'h28):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire87;
  input wire signed [(4'he):(1'h0)] wire86;
  input wire [(2'h3):(1'h0)] wire85;
  input wire signed [(5'h14):(1'h0)] wire84;
  input wire signed [(3'h6):(1'h0)] wire83;
  wire signed [(3'h7):(1'h0)] wire115;
  wire [(3'h4):(1'h0)] wire113;
  wire [(5'h15):(1'h0)] wire89;
  wire [(3'h7):(1'h0)] wire88;
  assign y = {wire115, wire113, wire89, wire88, (1'h0)};
  assign wire88 = $signed(wire83);
  assign wire89 = (wire84[(2'h3):(1'h0)] >>> ($unsigned((wire85 != (wire84 ?
                          wire85 : wire84))) ?
                      wire87[(3'h5):(1'h0)] : (wire88[(1'h0):(1'h0)] ?
                          wire83 : $unsigned((wire88 ? (8'hb9) : wire84)))));
  module90 #() modinst114 (.y(wire113), .wire91(wire85), .clk(clk), .wire92(wire84), .wire94(wire89), .wire93(wire83));
  assign wire115 = (wire85[(2'h2):(1'h1)] != ({{(wire113 | (8'haf)),
                               {wire83, (8'haa)}},
                           ($signed(wire85) ?
                               $signed(wire86) : $signed(wire88))} ?
                       wire88[(3'h6):(3'h5)] : ((-((7'h41) ?
                               (7'h41) : wire84)) ?
                           wire84[(3'h6):(3'h6)] : $signed(wire87))));
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire11;
  input wire [(3'h5):(1'h0)] wire10;
  input wire [(4'hc):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire [(5'h11):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire75;
  wire signed [(5'h15):(1'h0)] wire74;
  wire signed [(4'hb):(1'h0)] wire73;
  wire signed [(3'h5):(1'h0)] wire72;
  wire [(4'he):(1'h0)] wire32;
  wire signed [(3'h4):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire34;
  wire [(4'hc):(1'h0)] wire35;
  wire [(2'h2):(1'h0)] wire70;
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire32,
                 wire12,
                 wire34,
                 wire35,
                 wire70,
                 (1'h0)};
  assign wire12 = wire10;
  module13 #() modinst33 (.wire16(wire9), .wire15(wire10), .wire14(wire12), .clk(clk), .wire18(wire7), .y(wire32), .wire17(wire11));
  assign wire34 = $unsigned((wire9 > ((wire12[(2'h3):(1'h1)] ~^ $signed(wire8)) ?
                      ((wire32 ?
                          wire7 : wire12) && $unsigned(wire7)) : $unsigned($unsigned(wire7)))));
  assign wire35 = wire8;
  module36 #() modinst71 (wire70, clk, wire8, wire32, wire11, wire34, wire9);
  assign wire72 = {wire70, $unsigned(wire7)};
  assign wire73 = $signed(wire70);
  assign wire74 = $signed(wire72[(2'h2):(2'h2)]);
  assign wire75 = (^$unsigned(wire8[(5'h12):(5'h12)]));
endmodule

module module36  (y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'h17e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire41;
  input wire signed [(4'he):(1'h0)] wire40;
  input wire signed [(4'he):(1'h0)] wire39;
  input wire [(2'h2):(1'h0)] wire38;
  input wire signed [(3'h7):(1'h0)] wire37;
  wire signed [(5'h11):(1'h0)] wire69;
  wire signed [(5'h12):(1'h0)] wire58;
  wire signed [(4'ha):(1'h0)] wire57;
  wire signed [(4'he):(1'h0)] wire56;
  wire [(3'h6):(1'h0)] wire54;
  wire [(5'h14):(1'h0)] wire53;
  wire [(4'hf):(1'h0)] wire52;
  wire [(5'h14):(1'h0)] wire51;
  wire [(4'hd):(1'h0)] wire44;
  wire signed [(4'he):(1'h0)] wire43;
  wire [(5'h11):(1'h0)] wire42;
  reg [(4'h9):(1'h0)] reg68 = (1'h0);
  reg [(5'h12):(1'h0)] reg67 = (1'h0);
  reg [(3'h4):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg63 = (1'h0);
  reg [(4'ha):(1'h0)] reg62 = (1'h0);
  reg signed [(4'he):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg60 = (1'h0);
  reg [(4'he):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg50 = (1'h0);
  reg signed [(4'he):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg48 = (1'h0);
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg [(5'h12):(1'h0)] reg45 = (1'h0);
  assign y = {wire69,
                 wire58,
                 wire57,
                 wire56,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire44,
                 wire43,
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
                 reg55,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire42 = wire39;
  assign wire43 = $signed($unsigned(wire41[(2'h2):(1'h0)]));
  assign wire44 = $signed({(-((~wire38) << wire40[(1'h0):(1'h0)]))});
  always
    @(posedge clk) begin
      reg45 <= wire39;
      reg46 <= $signed({((wire40[(2'h3):(1'h1)] ?
                  wire40[(3'h5):(2'h3)] : wire38[(1'h1):(1'h1)]) ?
              ($unsigned((8'hab)) ? (-wire42) : $signed(wire44)) : wire42),
          wire42});
      if ($unsigned(($unsigned(wire42[(4'h8):(3'h6)]) ?
          {((~^wire37) & (wire40 | wire38))} : (~|{{wire37}}))))
        begin
          reg47 <= reg45;
          reg48 <= ((wire42 < ((~|$unsigned((8'hb8))) ?
              ((|reg45) + (!wire41)) : $unsigned($unsigned(wire44)))) >>> $unsigned($unsigned($signed($signed(wire37)))));
        end
      else
        begin
          reg47 <= wire37[(1'h1):(1'h1)];
          reg48 <= reg46;
        end
      reg49 <= ($unsigned($signed(((wire41 | reg46) ?
              (~|reg45) : $unsigned(wire44)))) ?
          (^~reg45) : $unsigned((&reg48)));
      reg50 <= ((reg46[(3'h7):(3'h7)] + $signed(wire42[(5'h10):(4'hb)])) ?
          $signed((|(wire40[(4'hc):(4'ha)] ?
              {reg47} : (wire44 > reg47)))) : $signed((-wire41)));
    end
  assign wire51 = (~^(~|(&$unsigned((8'hb3)))));
  assign wire52 = {{wire41, reg49}};
  assign wire53 = $signed((((^~(reg45 ?
                          wire38 : wire39)) * reg46[(2'h3):(2'h2)]) ?
                      (((~|reg46) + $unsigned(wire52)) ?
                          wire42 : (^~(~|wire39))) : $unsigned(wire38[(2'h2):(2'h2)])));
  assign wire54 = wire41;
  always
    @(posedge clk) begin
      reg55 <= {$signed(wire52), wire51[(5'h13):(5'h10)]};
    end
  assign wire56 = $unsigned(wire44);
  assign wire57 = $unsigned((reg50[(1'h1):(1'h0)] ?
                      $unsigned(reg49) : $signed($unsigned($signed((8'ha2))))));
  assign wire58 = reg55[(4'he):(4'hb)];
  always
    @(posedge clk) begin
      if (wire56)
        begin
          if ((&(&$signed((reg48[(1'h1):(1'h1)] + wire43[(4'hc):(4'ha)])))))
            begin
              reg59 <= wire54[(3'h6):(3'h5)];
            end
          else
            begin
              reg59 <= ((|$unsigned((reg46 ~^ {wire40, reg46}))) ?
                  reg50 : reg48);
              reg60 <= ($signed($signed($signed(reg55[(2'h3):(2'h2)]))) - (reg46 ?
                  $signed({$unsigned(wire40), {wire37, reg59}}) : reg48));
              reg61 <= wire52[(3'h5):(1'h0)];
              reg62 <= {wire57,
                  ((reg61 ?
                          reg49[(4'h9):(4'h8)] : {(reg46 ? wire44 : wire40),
                              (wire56 << reg46)}) ?
                      (7'h40) : $signed($signed((wire37 ? wire39 : wire41))))};
              reg63 <= $unsigned((((^~(&reg49)) << $unsigned({reg48})) ?
                  (+((reg45 == wire57) ?
                      (|wire44) : (reg46 | reg47))) : {({wire40} >> {wire51,
                          wire56})}));
            end
          reg64 <= reg46;
          reg65 <= reg48[(3'h7):(2'h2)];
        end
      else
        begin
          reg59 <= $unsigned(({wire53, wire51[(4'hc):(3'h5)]} * reg60));
          reg60 <= {$unsigned($signed(($signed((7'h41)) >= (!reg61))))};
          if ($signed(reg50))
            begin
              reg61 <= (reg46 ?
                  $signed((((reg61 ? reg47 : reg48) ^ {reg48, wire42}) ?
                      $signed(((8'hbe) >>> wire41)) : (^~wire54[(1'h0):(1'h0)]))) : $signed({($unsigned(reg64) && $unsigned(reg61))}));
              reg62 <= (~^($signed($signed(((8'ha4) != wire42))) <= (({reg65,
                      (7'h42)} ?
                  (+reg47) : (reg55 ?
                      wire57 : wire56)) * (~&wire52[(4'hc):(1'h1)]))));
            end
          else
            begin
              reg61 <= $signed({reg47[(4'ha):(4'h8)]});
              reg62 <= (-(reg63 ?
                  (!reg60[(4'ha):(3'h6)]) : $unsigned({(reg48 ?
                          wire41 : wire58),
                      (wire58 >> wire38)})));
            end
          if (wire39)
            begin
              reg63 <= reg49[(4'he):(2'h2)];
            end
          else
            begin
              reg63 <= wire42;
            end
        end
      reg66 <= wire53[(2'h3):(1'h1)];
      reg67 <= $unsigned(reg50);
      reg68 <= $unsigned(({wire56, (~|reg63[(1'h0):(1'h0)])} ?
          ((8'ha6) >>> wire44) : ({((8'hac) ? reg50 : reg47)} ?
              (&wire53[(5'h13):(4'hb)]) : $signed($unsigned(wire58)))));
    end
  assign wire69 = (~|wire51[(4'hd):(4'hd)]);
endmodule

module module13
#(parameter param31 = (+({((~&(8'h9d)) ? {(8'hb8)} : {(8'ha8)})} + (((~(8'had)) > ((8'h9c) >> (8'hae))) ^ (((8'hb7) + (8'hb2)) << (~&(7'h44)))))))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'ha1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire18;
  input wire signed [(3'h5):(1'h0)] wire17;
  input wire signed [(4'hb):(1'h0)] wire16;
  input wire [(3'h5):(1'h0)] wire15;
  input wire signed [(3'h4):(1'h0)] wire14;
  wire [(5'h14):(1'h0)] wire30;
  wire signed [(4'h8):(1'h0)] wire29;
  wire signed [(3'h6):(1'h0)] wire28;
  wire signed [(5'h11):(1'h0)] wire27;
  wire [(5'h12):(1'h0)] wire26;
  wire [(5'h10):(1'h0)] wire25;
  wire signed [(3'h4):(1'h0)] wire24;
  wire signed [(5'h12):(1'h0)] wire23;
  wire [(4'hb):(1'h0)] wire22;
  wire [(4'hb):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire20;
  wire [(4'hb):(1'h0)] wire19;
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 (1'h0)};
  assign wire19 = (($unsigned($unsigned((wire15 > wire15))) ?
                          (wire16[(1'h0):(1'h0)] ?
                              ((&wire15) ?
                                  wire18[(3'h7):(2'h3)] : $unsigned((8'haa))) : $unsigned($unsigned(wire17))) : $unsigned((wire14[(2'h2):(1'h1)] ?
                              $unsigned(wire18) : ((8'hbd) | wire18)))) ?
                      {(wire18[(3'h6):(2'h2)] ?
                              (~|wire15[(2'h3):(1'h1)]) : $unsigned(wire17)),
                          wire18} : (wire14[(1'h0):(1'h0)] <<< (wire14 <= ($signed(wire14) ?
                          (8'h9c) : wire16))));
  assign wire20 = wire16[(3'h4):(1'h1)];
  assign wire21 = ((wire18[(3'h4):(2'h2)] != ({wire20[(5'h11):(4'hc)]} <= (|$unsigned(wire18)))) | $signed((~|wire18[(3'h4):(2'h3)])));
  assign wire22 = (^~{wire14, wire19});
  assign wire23 = (8'ha7);
  assign wire24 = (wire21 ?
                      $signed(wire16[(3'h7):(1'h1)]) : wire16[(4'ha):(2'h3)]);
  assign wire25 = $signed((({wire15[(1'h0):(1'h0)], (8'hb1)} ?
                          (!(wire18 ?
                              wire17 : wire19)) : (|$unsigned(wire15))) ?
                      {$unsigned((wire17 & (8'h9f)))} : ($unsigned((wire23 ?
                          wire17 : wire24)) * $signed((wire23 ?
                          wire16 : wire21)))));
  assign wire26 = $signed((^~(!{$signed((8'ha2)), wire22})));
  assign wire27 = wire25[(1'h1):(1'h1)];
  assign wire28 = wire25;
  assign wire29 = {(+$signed(wire21))};
  assign wire30 = ({($unsigned(wire24[(2'h2):(1'h0)]) ?
                              ((wire26 > wire15) ?
                                  wire18 : wire19[(4'ha):(3'h6)]) : wire19[(1'h0):(1'h0)]),
                          $unsigned((wire18[(3'h4):(2'h2)] * (wire29 ^~ wire23)))} ?
                      (wire21[(2'h2):(1'h0)] ?
                          $signed(((~wire15) ?
                              $unsigned((8'hb8)) : wire19[(4'h9):(4'h9)])) : wire25) : $unsigned((^~((wire16 > wire28) ?
                          (&wire24) : (wire18 << (8'ha1))))));
endmodule

module module90
#(parameter param112 = ((((+((8'h9e) == (8'hb6))) > (^~((7'h42) ? (8'ha3) : (8'hae)))) ? (!(~^((8'h9c) >= (8'ha8)))) : ((((8'hb6) ? (8'hbc) : (8'hb2)) ^ {(8'hb9), (8'h9d)}) << ((8'hae) > {(8'ha8), (8'hbc)}))) ? (((((8'hbc) ? (8'had) : (8'h9d)) ? ((8'hbc) >>> (8'hb3)) : (+(7'h40))) ? (|((8'hac) ? (8'hb8) : (8'h9d))) : (((8'h9e) ? (8'ha2) : (8'h9d)) ? {(8'hb9), (8'ha6)} : ((8'haa) ? (8'ha7) : (8'hae)))) >>> ({(~|(8'h9d)), (~(8'hab))} ? {(!(8'ha0))} : {((8'ha6) >>> (7'h44)), ((8'ha7) ? (8'hb6) : (8'ha3))})) : ((({(8'ha3)} ? ((8'ha1) >= (8'hae)) : ((7'h42) ? (8'h9f) : (8'h9c))) ? (^~{(8'h9f), (8'hbe)}) : (!((8'haa) ? (8'hb4) : (8'ha1)))) >= (8'ha0))))
(y, clk, wire94, wire93, wire92, wire91);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire94;
  input wire [(2'h3):(1'h0)] wire93;
  input wire [(5'h14):(1'h0)] wire92;
  input wire [(2'h2):(1'h0)] wire91;
  wire [(5'h11):(1'h0)] wire111;
  wire [(2'h2):(1'h0)] wire110;
  wire signed [(4'h9):(1'h0)] wire109;
  wire signed [(3'h4):(1'h0)] wire108;
  wire signed [(5'h10):(1'h0)] wire106;
  wire signed [(4'h8):(1'h0)] wire105;
  wire [(4'he):(1'h0)] wire104;
  wire signed [(3'h4):(1'h0)] wire103;
  wire signed [(5'h10):(1'h0)] wire102;
  wire [(4'h9):(1'h0)] wire101;
  wire [(3'h5):(1'h0)] wire100;
  wire signed [(4'hf):(1'h0)] wire99;
  wire signed [(4'he):(1'h0)] wire98;
  wire signed [(3'h7):(1'h0)] wire97;
  wire [(2'h2):(1'h0)] wire96;
  wire signed [(5'h14):(1'h0)] wire95;
  reg signed [(4'hc):(1'h0)] reg107 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire109,
                 wire108,
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
                 wire96,
                 wire95,
                 reg107,
                 (1'h0)};
  assign wire95 = $signed((wire92[(1'h1):(1'h1)] ?
                      $unsigned(((wire93 ? wire91 : (8'ha0)) ?
                          (8'had) : $unsigned((8'hb2)))) : wire92));
  assign wire96 = wire94[(4'ha):(3'h4)];
  assign wire97 = wire93[(1'h1):(1'h0)];
  assign wire98 = $unsigned(wire96[(2'h2):(1'h0)]);
  assign wire99 = ($unsigned({$unsigned((wire95 ? wire91 : wire95)),
                          $unsigned(wire94)}) ?
                      $signed($unsigned($signed((8'ha7)))) : wire95);
  assign wire100 = (7'h44);
  assign wire101 = wire96;
  assign wire102 = ($unsigned(wire91[(1'h1):(1'h0)]) ?
                       {wire93,
                           (((wire93 <= wire97) >>> (^~wire91)) & ($signed(wire91) ^ wire96[(1'h1):(1'h1)]))} : ((~|{wire101[(3'h7):(3'h6)],
                           (~&wire97)}) >= $unsigned((&$unsigned(wire101)))));
  assign wire103 = ({(|$unsigned((^~wire93)))} ?
                       (~&wire101) : $unsigned(wire101[(2'h2):(2'h2)]));
  assign wire104 = $unsigned(wire94[(2'h2):(1'h0)]);
  assign wire105 = (~&(((~(wire101 ? wire94 : wire100)) ?
                       (wire95[(3'h4):(1'h1)] <<< $unsigned(wire97)) : $unsigned($unsigned(wire99))) && ($signed(((8'hb5) ^ wire102)) ?
                       (~&$unsigned(wire102)) : (wire100[(2'h2):(1'h1)] && (wire99 + wire103)))));
  assign wire106 = wire105;
  always
    @(posedge clk) begin
      reg107 <= (8'ha0);
    end
  assign wire108 = $unsigned({$signed(wire92[(3'h6):(2'h3)]),
                       $unsigned(((wire102 ? wire103 : (8'hae)) ?
                           wire94[(5'h10):(4'ha)] : (wire97 >>> (7'h40))))});
  assign wire109 = $unsigned(wire104[(2'h2):(2'h2)]);
  assign wire110 = wire97;
  assign wire111 = $signed(wire92[(4'hf):(2'h3)]);
endmodule
