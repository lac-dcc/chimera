module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h144):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire4;
  wire [(4'hb):(1'h0)] wire122;
  wire signed [(5'h14):(1'h0)] wire121;
  wire [(2'h3):(1'h0)] wire120;
  wire [(4'hc):(1'h0)] wire110;
  wire [(5'h11):(1'h0)] wire109;
  wire [(3'h7):(1'h0)] wire108;
  wire signed [(4'h8):(1'h0)] wire106;
  wire [(4'hf):(1'h0)] wire26;
  reg signed [(2'h2):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg128 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg125 = (1'h0);
  reg [(5'h13):(1'h0)] reg124 = (1'h0);
  reg [(4'hd):(1'h0)] reg123 = (1'h0);
  reg [(2'h3):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg118 = (1'h0);
  reg [(4'he):(1'h0)] reg117 = (1'h0);
  reg [(4'hc):(1'h0)] reg116 = (1'h0);
  reg [(4'h8):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg113 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  assign y = {wire122,
                 wire121,
                 wire120,
                 wire110,
                 wire109,
                 wire108,
                 wire106,
                 wire26,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (({(((~|wire4) ? wire4[(1'h1):(1'h0)] : (~wire1)) ?
                  $signed((+wire4)) : (+wire0)),
              $unsigned((wire2[(1'h1):(1'h1)] >>> (~|wire2)))} ?
          ((8'hbf) ?
              wire0[(4'h9):(4'h9)] : (~|{$unsigned((8'hac)),
                  wire0})) : ((wire1 ?
              $unsigned((8'ha8)) : $unsigned(wire2)) != (7'h43))))
        begin
          reg5 <= ((+((8'hb7) ?
                  (wire1[(4'hc):(2'h3)] >> wire0) : $unsigned((wire0 ^ wire1)))) ?
              (~$signed((~|$signed(wire3)))) : $signed({{(!wire4)},
                  (wire3 ? wire0[(3'h7):(2'h3)] : $unsigned(wire3))}));
        end
      else
        begin
          reg5 <= $signed($signed((!(^~$unsigned(wire2)))));
          reg6 <= reg5[(4'hf):(3'h5)];
        end
      reg7 <= wire2[(2'h3):(2'h2)];
      reg8 <= $unsigned(wire3[(3'h4):(2'h3)]);
      reg9 <= (((-$signed($signed(reg7))) ?
          {{wire3},
              (^(wire4 & reg5))} : (~^$signed({reg7}))) * reg5[(4'he):(4'ha)]);
    end
  module10 #() modinst27 (.wire13(wire4), .y(wire26), .wire12(wire2), .wire14(wire0), .wire11(reg6), .clk(clk));
  module28 #() modinst107 (wire106, clk, reg9, reg5, wire3, wire26);
  assign wire108 = wire0[(4'h9):(1'h1)];
  assign wire109 = {reg8};
  assign wire110 = ($unsigned(((-(wire0 ? (7'h40) : (8'hb4))) ^ ((reg5 ?
                           wire4 : (8'ha7)) ?
                       reg9 : wire2[(1'h0):(1'h0)]))) > $unsigned($signed({(wire3 ?
                           reg5 : wire106),
                       $signed(reg6)})));
  always
    @(posedge clk) begin
      if ((^~(wire2 || ((~|$signed(reg5)) > $unsigned(reg9)))))
        begin
          reg111 <= $signed((8'h9f));
          reg112 <= wire108;
        end
      else
        begin
          reg111 <= $signed(reg111[(1'h1):(1'h0)]);
          reg112 <= {(~|(-(wire108 ? (^wire108) : $unsigned(wire106))))};
          reg113 <= ($signed((($unsigned(wire4) || $signed(reg8)) + ({wire3,
                      reg9} ?
                  ((8'ha6) < reg6) : wire106))) ?
              ((((reg111 ? (8'hb5) : reg112) <<< (^(8'haf))) ?
                  ($unsigned(reg6) && wire110) : (!{wire3,
                      wire0})) ~^ (({wire110} != (8'hba)) && reg8[(1'h0):(1'h0)])) : $unsigned((reg8[(1'h0):(1'h0)] & reg5[(3'h4):(2'h3)])));
          reg114 <= reg113[(3'h5):(1'h1)];
          reg115 <= ($unsigned(wire4) ?
              reg5 : {wire26[(3'h6):(2'h2)], (wire106[(3'h7):(3'h4)] & reg7)});
        end
      reg116 <= {(($signed({reg8}) ?
              $unsigned($unsigned(reg114)) : ({reg5} ?
                  $unsigned(reg112) : (wire109 <<< reg8))) << $signed($signed($unsigned(wire26)))),
          (^~(((reg6 ? wire2 : wire108) >>> (~(8'hbb))) ?
              ($unsigned(wire0) >>> $unsigned((8'hb1))) : $signed(reg113[(1'h0):(1'h0)])))};
      reg117 <= $unsigned($unsigned($signed(wire3)));
      reg118 <= reg7;
      if (($unsigned((reg9[(4'hf):(2'h2)] * (!(wire108 ^~ reg6)))) ?
          ((reg112[(1'h0):(1'h0)] ? $signed((reg6 ? wire4 : wire108)) : wire4) ?
              (wire106 ^ reg117) : ($unsigned(wire2[(3'h4):(2'h2)]) ?
                  (8'hbf) : (-{wire26,
                      reg118}))) : $unsigned((&((+wire110) | (wire4 && reg117))))))
        begin
          reg119 <= ({{({(8'hb4), (8'hb5)} ?
                      (wire2 ? reg111 : reg112) : (reg8 ? wire110 : wire3))},
              (reg113 ? wire106 : reg111[(4'hc):(3'h4)])} | wire106);
        end
      else
        begin
          reg119 <= (({$unsigned($signed(reg8))} ?
                  (({wire26, (8'ha0)} == (wire109 >>> wire1)) ^ (((8'h9e) ?
                          reg119 : reg118) ?
                      $unsigned(reg118) : (reg111 ~^ (8'hb2)))) : reg113[(4'hb):(3'h7)]) ?
              $signed({reg116[(1'h0):(1'h0)],
                  reg6[(4'hb):(1'h1)]}) : $unsigned($signed(reg115)));
        end
    end
  assign wire120 = ({(!((~|wire109) > {reg113,
                           (8'h9d)}))} > {{($unsigned(reg9) != (wire4 ?
                               wire0 : (8'hbf)))},
                       reg113[(4'hb):(3'h6)]});
  assign wire121 = (reg116 ?
                       wire110 : $signed(($signed(wire26) * $signed($signed(wire3)))));
  assign wire122 = ((^~(~|$unsigned((^~reg8)))) << $unsigned((reg113 ?
                       wire110 : (reg111[(3'h5):(2'h3)] ?
                           (reg119 ? reg118 : reg112) : $signed((8'ha4))))));
  always
    @(posedge clk) begin
      reg123 <= ((~&reg7[(2'h2):(1'h1)]) ?
          (+($unsigned($unsigned(reg6)) && $unsigned($unsigned(wire110)))) : wire4);
      reg124 <= reg118;
      if ((reg113 ^ (($unsigned((reg116 <<< reg7)) ?
              {reg9[(4'hb):(1'h1)]} : {(reg117 ? reg5 : wire120)}) ?
          {$signed((wire120 <<< wire120))} : {wire26})))
        begin
          if (($unsigned(reg113[(4'h8):(3'h5)]) ?
              ((~(^wire120[(2'h2):(2'h2)])) ?
                  $signed(($unsigned(reg5) ?
                      {reg7} : {reg119, reg114})) : (|({wire3} ?
                      (~&wire122) : (^reg118)))) : wire0))
            begin
              reg125 <= (wire4[(4'hf):(2'h2)] < ({($signed(wire109) ?
                          (&wire26) : (reg114 <<< (8'haf))),
                      (~|((8'hb5) ? wire4 : reg112))} ?
                  $unsigned(reg117[(3'h5):(2'h3)]) : {reg8[(3'h6):(1'h0)],
                      {$unsigned(reg117)}}));
            end
          else
            begin
              reg125 <= $signed($unsigned(reg112[(1'h1):(1'h1)]));
              reg126 <= ((((reg111[(4'h9):(3'h7)] ? {wire121, reg6} : reg113) ?
                      (|reg113) : ($unsigned(reg125) ?
                          (reg116 > wire108) : (reg112 << wire26))) ?
                  $signed(wire106[(3'h6):(3'h6)]) : (reg5 > reg124)) <= {$signed((~^$signed((7'h44))))});
              reg127 <= ((^$signed($signed(reg124))) ?
                  (^~(~$signed($signed(reg7)))) : wire109[(3'h5):(2'h3)]);
              reg128 <= {($signed((8'hb1)) << reg9[(1'h0):(1'h0)])};
            end
        end
      else
        begin
          reg125 <= (~^{$unsigned((~^$unsigned(reg128)))});
          reg126 <= ((8'h9c) && (-($signed(reg115) == $signed((!reg8)))));
          reg127 <= $signed({($unsigned(wire108[(3'h5):(2'h2)]) > $unsigned($unsigned(reg113)))});
          reg128 <= reg124;
          reg129 <= (($unsigned(((-reg125) <= reg126[(4'hf):(3'h6)])) > wire120) >= reg126[(3'h4):(2'h2)]);
        end
    end
endmodule

module module28
#(parameter param104 = (7'h43), 
parameter param105 = (param104 ? (~|(8'ha8)) : param104))
(y, clk, wire29, wire30, wire31, wire32);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire29;
  input wire [(4'hd):(1'h0)] wire30;
  input wire signed [(5'h13):(1'h0)] wire31;
  input wire [(4'hf):(1'h0)] wire32;
  wire [(4'h8):(1'h0)] wire103;
  wire [(4'he):(1'h0)] wire102;
  wire signed [(5'h12):(1'h0)] wire101;
  wire [(5'h14):(1'h0)] wire100;
  wire [(5'h13):(1'h0)] wire92;
  wire [(5'h13):(1'h0)] wire90;
  wire [(5'h13):(1'h0)] wire33;
  wire [(5'h12):(1'h0)] wire35;
  wire [(5'h12):(1'h0)] wire36;
  wire [(4'hf):(1'h0)] wire37;
  wire [(3'h4):(1'h0)] wire38;
  wire [(4'he):(1'h0)] wire39;
  wire [(3'h5):(1'h0)] wire75;
  reg [(3'h6):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg94 = (1'h0);
  reg [(5'h12):(1'h0)] reg93 = (1'h0);
  reg [(3'h4):(1'h0)] reg34 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire92,
                 wire90,
                 wire33,
                 wire35,
                 wire36,
                 wire37,
                 wire38,
                 wire39,
                 wire75,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg34,
                 (1'h0)};
  assign wire33 = ($signed($signed(wire31[(5'h12):(5'h11)])) | (((~^$unsigned((8'hb0))) >> (wire29[(1'h0):(1'h0)] || (wire30 ?
                          wire29 : wire29))) ?
                      wire32[(3'h4):(1'h1)] : $signed($signed((wire31 ?
                          wire32 : wire30)))));
  always
    @(posedge clk) begin
      reg34 <= wire33;
    end
  assign wire35 = wire32[(1'h1):(1'h0)];
  assign wire36 = wire33[(3'h7):(1'h1)];
  assign wire37 = (&(((wire36[(4'hf):(3'h7)] >>> wire36) ^ wire33[(3'h4):(2'h2)]) ?
                      {(8'ha4),
                          $signed($unsigned(reg34))} : $signed(($signed(wire31) ?
                          (wire32 ? wire35 : wire31) : $signed(wire31)))));
  assign wire38 = {({$signed((8'ha8)), $signed(reg34[(2'h2):(1'h0)])} ?
                          (wire36 - (7'h41)) : wire32)};
  assign wire39 = $unsigned((wire32 ? wire29[(4'h8):(3'h5)] : $signed(wire29)));
  module40 #() modinst76 (wire75, clk, wire31, wire39, wire32, wire30, wire33);
  module77 #() modinst91 (.wire80(wire35), .clk(clk), .wire78(wire32), .y(wire90), .wire79(wire29), .wire81(wire30));
  assign wire92 = $unsigned((wire75[(1'h0):(1'h0)] ?
                      $unsigned($signed($signed(wire29))) : (8'hb4)));
  always
    @(posedge clk) begin
      reg93 <= (^~((!wire29) ?
          {(~^{wire30, (8'ha4)})} : {wire29[(3'h5):(1'h1)],
              (((8'h9c) >>> wire32) || (wire33 ? wire31 : wire90))}));
      reg94 <= wire75;
    end
  always
    @(posedge clk) begin
      reg95 <= $signed($unsigned(((!(reg93 ?
          (8'hb4) : wire90)) - {$unsigned((8'ha4))})));
      reg96 <= ((8'hba) * ((8'hb4) >= wire31[(4'hf):(4'ha)]));
      reg97 <= (reg34 ? $signed($unsigned((7'h40))) : (~&wire90));
      reg98 <= wire90[(5'h10):(4'ha)];
      reg99 <= ((((!(-wire32)) || ($unsigned(reg34) ?
              wire90[(2'h3):(1'h1)] : {wire29, wire30})) >> (7'h41)) ?
          (($signed(((7'h44) <<< reg93)) && ((8'hbf) <<< wire90[(1'h0):(1'h0)])) ?
              $signed($unsigned(reg96)) : wire35) : ($unsigned(wire36[(4'h8):(2'h3)]) ?
              (~($unsigned(reg34) ? (|wire30) : (reg97 << wire31))) : wire35));
    end
  assign wire100 = ($unsigned({wire90[(4'hf):(3'h6)]}) ^~ $unsigned(((&((8'hb7) ?
                           reg95 : wire35)) ?
                       ((wire29 < reg96) ?
                           (8'hb7) : wire33[(4'hb):(3'h5)]) : ($unsigned(reg93) ~^ wire39))));
  assign wire101 = $signed(wire31);
  assign wire102 = $unsigned(((({reg96} ~^ (wire31 <<< reg95)) ?
                           ($signed(wire75) * (8'hab)) : (~&reg99[(2'h3):(2'h2)])) ?
                       (({reg96} ?
                               wire36[(4'h8):(2'h3)] : (wire92 ^~ (8'hb6))) ?
                           wire35[(2'h3):(1'h1)] : $unsigned(reg93)) : {($signed(wire36) ?
                               wire36 : $unsigned(wire92)),
                           {(wire37 ? reg93 : reg96), wire30}}));
  assign wire103 = wire92[(4'ha):(1'h1)];
endmodule

module module10
#(parameter param25 = ((^~(-({(8'ha5)} > (!(8'ha7))))) << (~|{((8'hac) << ((8'hb3) >>> (8'ha3)))})))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire14;
  input wire [(5'h13):(1'h0)] wire13;
  input wire [(3'h5):(1'h0)] wire12;
  input wire [(4'h8):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire22;
  wire [(4'hc):(1'h0)] wire21;
  wire [(2'h3):(1'h0)] wire20;
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  assign y = {wire24,
                 wire22,
                 wire21,
                 wire20,
                 reg23,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg15 <= $signed($unsigned(($signed(wire12[(3'h5):(2'h3)]) - (8'had))));
      reg16 <= $unsigned(($signed((+$signed(wire14))) & $signed(((wire11 ?
              wire14 : wire11) ?
          $signed(wire11) : ((8'hac) ? reg15 : wire11)))));
      reg17 <= ($signed($unsigned((8'hbd))) > wire13[(2'h2):(2'h2)]);
      reg18 <= ($unsigned($unsigned(wire13[(5'h12):(4'h8)])) ?
          reg17 : ((reg16[(4'h8):(3'h6)] ?
              wire11[(3'h6):(1'h1)] : $signed((^~(8'hab)))) && wire13[(1'h1):(1'h0)]));
      reg19 <= ($signed((!(((8'hb0) ?
              wire13 : reg16) + reg18[(3'h7):(3'h7)]))) ?
          (reg15 * (reg17[(5'h10):(3'h5)] ?
              (&(wire11 ?
                  reg16 : reg18)) : (|(|reg16)))) : (~$signed($unsigned($unsigned(wire11)))));
    end
  assign wire20 = ((($unsigned($unsigned(reg17)) | reg18) ?
                          reg17[(3'h5):(2'h2)] : ((~^(wire12 ?
                              wire14 : reg18)) == (^~{reg17}))) ?
                      (~|((wire13 ?
                          (wire11 < (8'had)) : (^~wire12)) ~^ wire12[(1'h0):(1'h0)])) : reg17[(4'h8):(1'h1)]);
  assign wire21 = ({wire12} ?
                      $signed(((&$unsigned(wire12)) ?
                          reg17[(4'hf):(1'h1)] : ((reg18 ? (8'hba) : wire11) ?
                              (&(8'ha7)) : (wire12 ?
                                  wire14 : wire13)))) : reg15[(3'h6):(3'h4)]);
  assign wire22 = ({($signed((reg19 > wire21)) ?
                              {wire14,
                                  (wire13 && wire20)} : wire21[(4'hc):(3'h5)])} ?
                      (wire14 <<< $signed($unsigned($unsigned((8'ha1))))) : ((8'hba) ?
                          (reg18 == {(^~wire14), reg19}) : $signed((8'hb1))));
  always
    @(posedge clk) begin
      reg23 <= (wire12 >= (wire22[(3'h7):(2'h2)] ~^ $unsigned($signed($signed(reg15)))));
    end
  assign wire24 = wire13[(4'hb):(2'h3)];
endmodule

module module77
#(parameter param88 = (^(((-((8'ha5) ? (7'h41) : (8'h9e))) != (((8'hb0) ? (8'hb1) : (8'hb6)) ? {(8'ha9)} : ((8'hbc) ? (8'hbd) : (8'hb2)))) >= ((+{(8'h9d)}) ? (-(8'haa)) : (-((8'ha2) ? (8'ha4) : (8'ha6)))))), 
parameter param89 = param88)
(y, clk, wire81, wire80, wire79, wire78);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire81;
  input wire signed [(5'h12):(1'h0)] wire80;
  input wire signed [(3'h6):(1'h0)] wire79;
  input wire signed [(4'ha):(1'h0)] wire78;
  wire signed [(4'he):(1'h0)] wire87;
  wire signed [(4'hb):(1'h0)] wire86;
  wire [(4'hf):(1'h0)] wire85;
  wire signed [(4'h8):(1'h0)] wire84;
  wire [(5'h15):(1'h0)] wire83;
  wire signed [(5'h13):(1'h0)] wire82;
  assign y = {wire87, wire86, wire85, wire84, wire83, wire82, (1'h0)};
  assign wire82 = $unsigned(wire80);
  assign wire83 = $signed(wire81[(2'h3):(1'h1)]);
  assign wire84 = $signed((!(!(~^$unsigned(wire81)))));
  assign wire85 = (|{wire80[(5'h10):(4'h8)],
                      ($unsigned(wire83[(4'h9):(1'h1)]) ?
                          (^{wire80}) : wire84[(2'h2):(1'h1)])});
  assign wire86 = $unsigned(($unsigned((|(wire78 ^ wire80))) ?
                      $signed((8'hab)) : (~^(~&(wire82 - (8'hb8))))));
  assign wire87 = wire80[(4'hc):(3'h7)];
endmodule

module module40  (y, clk, wire45, wire44, wire43, wire42, wire41);
  output wire [(32'h157):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire45;
  input wire [(4'hd):(1'h0)] wire44;
  input wire signed [(4'h8):(1'h0)] wire43;
  input wire signed [(4'hb):(1'h0)] wire42;
  input wire [(5'h13):(1'h0)] wire41;
  wire [(4'hf):(1'h0)] wire74;
  wire [(3'h5):(1'h0)] wire73;
  wire [(3'h6):(1'h0)] wire72;
  wire [(5'h12):(1'h0)] wire71;
  wire signed [(4'ha):(1'h0)] wire70;
  wire [(3'h5):(1'h0)] wire69;
  wire signed [(4'h9):(1'h0)] wire68;
  wire [(5'h14):(1'h0)] wire56;
  wire [(2'h2):(1'h0)] wire55;
  wire signed [(3'h5):(1'h0)] wire54;
  wire [(4'hf):(1'h0)] wire53;
  wire [(4'he):(1'h0)] wire52;
  wire [(5'h13):(1'h0)] wire51;
  wire [(4'hd):(1'h0)] wire50;
  wire [(5'h14):(1'h0)] wire49;
  wire [(3'h4):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire47;
  wire [(4'he):(1'h0)] wire46;
  reg [(2'h3):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg [(4'hd):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg61 = (1'h0);
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(5'h10):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
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
                 (1'h0)};
  assign wire46 = wire42[(3'h7):(2'h3)];
  assign wire47 = ((|((8'hb4) << wire46)) ?
                      (((8'ha3) < (-$unsigned(wire42))) ?
                          ((wire41 + $signed(wire43)) ?
                              ({wire42, wire45} ?
                                  $unsigned(wire46) : {wire42}) : wire44[(3'h5):(1'h0)]) : {(~(~^wire43))}) : wire46[(4'hc):(4'h9)]);
  assign wire48 = (^~wire43);
  assign wire49 = (^$unsigned({wire45}));
  assign wire50 = (($signed((|(wire46 ?
                      wire43 : wire47))) >= {$signed($unsigned(wire43)),
                      ($signed(wire45) + (~|wire42))}) * (($signed($signed(wire48)) ?
                      wire48[(3'h4):(1'h1)] : $unsigned(wire48[(1'h0):(1'h0)])) != (8'hb4)));
  assign wire51 = wire44[(1'h0):(1'h0)];
  assign wire52 = ((($signed((8'hb7)) || wire43[(4'h8):(2'h2)]) ?
                          wire48 : wire44) ?
                      wire46 : {($unsigned(wire45) ?
                              $unsigned(wire42[(4'ha):(3'h4)]) : wire48),
                          wire42});
  assign wire53 = wire51[(4'h8):(3'h5)];
  assign wire54 = {$signed(wire42[(4'ha):(3'h7)])};
  assign wire55 = ((~&(|(wire51[(2'h2):(1'h1)] ~^ $unsigned(wire43)))) && $signed(((^wire49[(4'h8):(3'h5)]) < wire46)));
  assign wire56 = wire43;
  always
    @(posedge clk) begin
      if ($unsigned((wire45[(4'h9):(4'h9)] >> $signed(wire41[(4'hd):(3'h5)]))))
        begin
          reg57 <= {((8'hb3) ?
                  wire48 : {wire55[(2'h2):(2'h2)],
                      ($signed((8'hb0)) ?
                          (wire54 ? wire55 : wire44) : (wire52 && wire49))}),
              (wire50 >> $unsigned((8'haf)))};
          reg58 <= {wire42[(1'h1):(1'h0)]};
        end
      else
        begin
          reg57 <= (+({(^~$unsigned((8'hab))), (!(wire44 ? wire53 : wire44))} ?
              ((!$signed(wire48)) >= wire46) : $unsigned(({wire42} || $signed(wire47)))));
        end
      if (($signed($unsigned($signed({wire44, (8'hbe)}))) ?
          ($signed(($signed(reg58) * {wire48})) == $unsigned($signed((~^(8'hb2))))) : ((~^(+reg58)) >= ($unsigned($signed((8'ha0))) >>> wire49))))
        begin
          reg59 <= wire56;
          if ($signed($signed({$unsigned(wire49)})))
            begin
              reg60 <= (^(($unsigned($signed(wire42)) ?
                  (wire42[(3'h7):(3'h7)] ?
                      $signed(wire50) : $signed(wire52)) : wire54) << (wire44[(4'hd):(3'h6)] ?
                  reg59[(2'h3):(2'h2)] : ($unsigned(wire53) ?
                      (~&wire52) : (reg57 <<< wire43)))));
            end
          else
            begin
              reg60 <= $unsigned((~|{reg59[(4'h8):(3'h5)]}));
            end
          reg61 <= ((-$unsigned(($signed(wire55) + (reg58 ?
                  wire51 : wire55)))) ?
              wire49[(4'hf):(4'hb)] : (wire50 ?
                  wire55 : (wire54[(3'h4):(2'h3)] ?
                      (8'ha9) : $unsigned(reg57))));
        end
      else
        begin
          if ($unsigned((((~&(wire50 >>> reg57)) * ({reg58} < (~wire44))) ?
              wire56 : ($signed($unsigned(wire51)) || ((wire54 != reg61) >> $signed((8'ha7)))))))
            begin
              reg59 <= ((^~wire47) ?
                  ({$signed((~|wire50))} & $signed((|$signed(wire44)))) : (~|reg59));
              reg60 <= reg57[(1'h1):(1'h1)];
              reg61 <= $signed(wire55[(1'h0):(1'h0)]);
              reg62 <= $unsigned(wire49);
            end
          else
            begin
              reg59 <= wire43[(4'h8):(1'h1)];
              reg60 <= wire49;
              reg61 <= $signed($unsigned(wire41[(4'hc):(3'h7)]));
              reg62 <= ($unsigned(((~|wire46[(2'h3):(1'h1)]) > ($unsigned(wire48) ?
                      $unsigned((8'hb5)) : $unsigned(reg58)))) ?
                  (|{$unsigned($unsigned((8'hb1)))}) : (wire50[(4'hc):(3'h5)] | {$unsigned((-wire47)),
                      ($signed((8'ha5)) ?
                          (wire56 ? wire53 : wire44) : wire53)}));
              reg63 <= $unsigned($unsigned({wire46[(4'h8):(3'h5)],
                  $signed({wire44})}));
            end
          reg64 <= wire51;
          reg65 <= {(^~$unsigned(((8'h9c) ?
                  (reg61 ? reg58 : wire42) : (wire54 ~^ wire56))))};
        end
      reg66 <= wire42;
      reg67 <= (^~reg58[(3'h6):(3'h6)]);
    end
  assign wire68 = (wire42 || $signed({wire51}));
  assign wire69 = wire68[(3'h5):(3'h4)];
  assign wire70 = $unsigned((wire50 <<< $signed((reg63 || $signed(wire49)))));
  assign wire71 = ((wire53 <= $unsigned(({wire47, wire52} ?
                      {wire46, wire46} : $unsigned(wire56)))) >> ((^wire41) ?
                      ((reg62[(3'h7):(3'h6)] ?
                          reg59 : (reg67 ?
                              wire50 : reg60)) == (wire50[(4'h8):(3'h6)] ?
                          wire46[(4'hb):(3'h7)] : (8'h9f))) : $unsigned($unsigned((~^reg65)))));
  assign wire72 = {(~|wire42),
                      $signed(($signed((reg59 ? wire71 : wire51)) ?
                          wire55[(2'h2):(1'h1)] : {(reg60 <= wire42)}))};
  assign wire73 = reg60[(4'he):(2'h3)];
  assign wire74 = ((wire42 ? wire50 : (8'hbc)) >= (!(|({wire72} ?
                      (reg63 - reg64) : (~^wire72)))));
endmodule
