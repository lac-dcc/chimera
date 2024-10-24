module top
#(parameter param147 = ((({{(8'h9c)}, ((8'hbe) != (8'ha5))} & ({(8'hba), (7'h44)} < (~^(7'h43)))) <= (|({(8'hbc)} ? ((8'hb1) ? (8'hb8) : (7'h44)) : {(8'hb4)}))) ? (-{(^~{(8'hb1), (8'hae)}), (((8'ha9) ? (8'hb2) : (8'h9e)) << (~^(8'ha5)))}) : {((((8'hbe) ^~ (7'h44)) ? ((8'haf) ? (8'h9f) : (8'ha0)) : (~(8'ha9))) <= (((8'hb1) ? (8'hbb) : (7'h40)) + ((7'h40) ? (8'hbe) : (8'hbf))))}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire146;
  wire signed [(3'h6):(1'h0)] wire145;
  wire signed [(3'h6):(1'h0)] wire49;
  wire signed [(4'hf):(1'h0)] wire51;
  wire [(5'h14):(1'h0)] wire52;
  wire signed [(5'h12):(1'h0)] wire141;
  wire [(5'h10):(1'h0)] wire143;
  assign y = {wire146,
                 wire145,
                 wire49,
                 wire51,
                 wire52,
                 wire141,
                 wire143,
                 (1'h0)};
  module5 #() modinst50 (wire49, clk, wire2, wire3, wire1, wire4);
  assign wire51 = ((($signed($unsigned(wire3)) <= {(wire1 ^ wire2),
                          $unsigned(wire2)}) || (($signed(wire0) - (8'ha8)) ?
                          wire0[(3'h4):(3'h4)] : wire4[(4'ha):(2'h3)])) ?
                      {$unsigned(wire2)} : (wire0[(3'h4):(1'h1)] ?
                          wire2 : wire4));
  assign wire52 = {{wire4[(1'h0):(1'h0)]}, (~^wire3[(2'h3):(1'h0)])};
  module53 #() modinst142 (.wire57(wire0), .wire55(wire1), .clk(clk), .y(wire141), .wire56(wire3), .wire54(wire52));
  module89 #() modinst144 (wire143, clk, wire3, wire52, wire2, wire0, wire51);
  assign wire145 = $unsigned((wire49[(2'h3):(2'h3)] << wire4[(3'h7):(3'h5)]));
  assign wire146 = wire3[(1'h0):(1'h0)];
endmodule

module module53
#(parameter param140 = (^{{{(~|(8'hb0))}, (^(8'hb4))}}))
(y, clk, wire54, wire55, wire56, wire57);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire54;
  input wire signed [(5'h14):(1'h0)] wire55;
  input wire signed [(3'h7):(1'h0)] wire56;
  input wire signed [(5'h12):(1'h0)] wire57;
  wire signed [(4'hb):(1'h0)] wire139;
  wire signed [(5'h15):(1'h0)] wire138;
  wire signed [(4'h8):(1'h0)] wire137;
  wire [(4'hf):(1'h0)] wire84;
  wire signed [(4'he):(1'h0)] wire86;
  wire signed [(2'h3):(1'h0)] wire87;
  wire [(4'hd):(1'h0)] wire88;
  wire signed [(4'hf):(1'h0)] wire135;
  assign y = {wire139,
                 wire138,
                 wire137,
                 wire84,
                 wire86,
                 wire87,
                 wire88,
                 wire135,
                 (1'h0)};
  module58 #() modinst85 (.wire60(wire54), .clk(clk), .wire61(wire56), .wire59(wire57), .wire62(wire55), .y(wire84));
  assign wire86 = ((-$unsigned($signed(wire84))) ?
                      ({(wire55 << wire55[(4'hc):(3'h5)])} ?
                          $unsigned((~&wire84[(3'h6):(3'h5)])) : $unsigned({$unsigned(wire54),
                              $signed(wire55)})) : (wire84 ?
                          $signed(((~^wire56) ?
                              $signed(wire54) : $signed(wire54))) : wire57));
  assign wire87 = ((7'h42) <= wire55[(5'h14):(5'h12)]);
  assign wire88 = $unsigned($signed($signed((~|(wire54 ~^ wire84)))));
  module89 #() modinst136 (.wire90(wire55), .y(wire135), .wire91(wire57), .wire92(wire87), .clk(clk), .wire94(wire88), .wire93(wire84));
  assign wire137 = wire88[(1'h0):(1'h0)];
  assign wire138 = ($signed(wire86) ?
                       wire135[(2'h3):(1'h1)] : $unsigned({$signed(wire57[(4'hc):(3'h7)]),
                           $signed((wire55 ? wire88 : wire54))}));
  assign wire139 = (-$unsigned(((^wire137) ? wire87 : wire137)));
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire8;
  input wire signed [(3'h5):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire47;
  wire [(5'h11):(1'h0)] wire22;
  wire signed [(5'h15):(1'h0)] wire21;
  wire [(4'hd):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire19;
  wire signed [(4'ha):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire10;
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg11 = (1'h0);
  assign y = {wire47,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire13,
                 wire10,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire10 = ({($unsigned(((8'h9e) ? wire7 : wire8)) ?
                          ((!wire7) ?
                              wire6 : (wire8 ?
                                  wire7 : wire9)) : (wire9[(4'hc):(3'h5)] ?
                              (wire7 ? wire6 : wire6) : (&wire9))),
                      wire6[(3'h6):(1'h1)]} >>> (8'hb5));
  always
    @(posedge clk) begin
      reg11 <= wire7[(1'h0):(1'h0)];
      reg12 <= $signed($unsigned(wire10));
    end
  assign wire13 = wire6;
  always
    @(posedge clk) begin
      reg14 <= (wire9 ? ((-(^wire13)) ^ (~wire9)) : (7'h41));
      if ((8'hb3))
        begin
          reg15 <= (&{wire6, reg12});
          reg16 <= ((wire9[(4'hc):(3'h7)] ?
                  (&{$unsigned(wire9)}) : reg15[(3'h7):(3'h7)]) ?
              ($unsigned(($signed(wire10) - (wire13 ^~ reg12))) ?
                  $signed(((~|(8'ha8)) || reg11)) : $signed(reg11[(2'h3):(1'h0)])) : wire7);
        end
      else
        begin
          reg15 <= (+reg16[(4'h9):(3'h4)]);
        end
      reg17 <= reg15[(3'h5):(1'h0)];
    end
  assign wire18 = reg16[(1'h1):(1'h0)];
  assign wire19 = (8'haa);
  assign wire20 = $unsigned((8'hb4));
  assign wire21 = ($signed(reg16[(3'h6):(1'h0)]) >> (8'ha4));
  assign wire22 = $unsigned(reg12[(4'he):(3'h5)]);
  module23 #() modinst48 (wire47, clk, wire9, wire6, wire21, wire10);
endmodule

module module23
#(parameter param46 = {(((^~((8'ha5) ? (8'ha1) : (8'hb2))) ? (8'hbb) : (+((8'ha7) ? (8'hac) : (7'h43)))) ? (~|(((8'hb2) >>> (8'h9e)) ? ((8'hbe) ? (8'hbf) : (8'hae)) : {(8'h9c)})) : {{((7'h44) ? (8'ha5) : (8'hab)), (|(8'ha4))}})})
(y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire27;
  input wire signed [(5'h15):(1'h0)] wire26;
  input wire [(5'h15):(1'h0)] wire25;
  input wire signed [(4'hf):(1'h0)] wire24;
  wire [(4'hc):(1'h0)] wire41;
  wire signed [(3'h5):(1'h0)] wire40;
  wire [(2'h3):(1'h0)] wire39;
  wire [(3'h5):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire37;
  wire [(4'h9):(1'h0)] wire36;
  wire signed [(2'h3):(1'h0)] wire35;
  wire signed [(5'h12):(1'h0)] wire34;
  wire signed [(5'h10):(1'h0)] wire33;
  wire [(3'h5):(1'h0)] wire32;
  wire signed [(3'h6):(1'h0)] wire31;
  wire signed [(4'h9):(1'h0)] wire30;
  reg signed [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg29,
                 reg28,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg28 <= (((((8'hb7) >>> (wire24 ? wire26 : wire24)) ?
              (~|{(8'ha7),
                  wire25}) : wire25) && {($unsigned(wire26) >> $unsigned(wire26))}) ?
          (8'ha4) : wire25[(3'h4):(1'h0)]);
      reg29 <= {reg28[(3'h6):(1'h1)], $signed(wire25)};
    end
  assign wire30 = (7'h43);
  assign wire31 = (&((!(wire30[(2'h3):(1'h1)] >= (^reg29))) ?
                      $signed({reg28}) : ((-(!reg29)) * (|wire25[(5'h12):(4'ha)]))));
  assign wire32 = ((wire24[(4'hd):(4'ha)] ?
                      {(~(wire27 ^~ reg28))} : $signed((~|(wire27 ?
                          wire30 : wire31)))) ^ (reg28[(2'h3):(1'h1)] | ((~^reg29) ?
                      wire30[(4'h8):(4'h8)] : $unsigned({wire31}))));
  assign wire33 = $signed(((^$signed(wire26)) >> $unsigned($unsigned((wire25 & reg28)))));
  assign wire34 = $signed(reg28);
  assign wire35 = $unsigned({(($unsigned((8'h9f)) >> (+reg28)) + ((wire32 + (7'h43)) ^ $signed(wire25))),
                      wire26[(3'h7):(1'h0)]});
  assign wire36 = $unsigned(wire27[(4'h8):(3'h4)]);
  assign wire37 = ((((wire31 ~^ (8'ha6)) ?
                      $signed($unsigned(wire30)) : (reg29[(2'h2):(1'h0)] || (~wire34))) >> $unsigned(wire32[(3'h4):(2'h3)])) <= ((|(-$unsigned(wire24))) + wire36));
  assign wire38 = $unsigned(wire31[(1'h0):(1'h0)]);
  assign wire39 = ($signed(wire34) + ((!$unsigned({wire38})) & ((!(wire34 * (8'ha1))) << (((8'ha3) ?
                          wire38 : wire37) ?
                      $signed(wire27) : wire25))));
  assign wire40 = (wire26[(4'h8):(3'h4)] || wire33);
  assign wire41 = (^(wire25[(3'h7):(3'h4)] ?
                      $signed($signed(wire33[(2'h2):(2'h2)])) : $signed(wire30[(2'h3):(1'h1)])));
  always
    @(posedge clk) begin
      reg42 <= $unsigned(($unsigned(($unsigned((7'h44)) ?
              $unsigned(wire31) : {wire33, wire25})) ?
          wire27 : $unsigned(((wire34 ? reg29 : wire33) ?
              (wire37 ? wire33 : wire35) : $unsigned(wire37)))));
      reg43 <= (&(^(8'haf)));
      if (wire40[(2'h3):(1'h0)])
        begin
          reg44 <= ((wire38[(1'h1):(1'h1)] >>> ((wire33[(4'h8):(3'h4)] & wire27[(4'hb):(1'h0)]) >> {{wire24},
              wire40[(1'h0):(1'h0)]})) << {wire30,
              $signed((&(wire41 >> reg29)))});
          reg45 <= $signed(((~&$signed((reg44 ?
              wire30 : wire39))) == wire25[(4'ha):(4'h9)]));
        end
      else
        begin
          reg44 <= $signed(wire31[(3'h6):(3'h5)]);
        end
    end
endmodule

module module89  (y, clk, wire94, wire93, wire92, wire91, wire90);
  output wire [(32'h1db):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire94;
  input wire signed [(4'hf):(1'h0)] wire93;
  input wire signed [(2'h2):(1'h0)] wire92;
  input wire signed [(3'h4):(1'h0)] wire91;
  input wire signed [(4'hf):(1'h0)] wire90;
  wire [(2'h3):(1'h0)] wire134;
  wire [(2'h3):(1'h0)] wire116;
  wire [(5'h12):(1'h0)] wire115;
  wire signed [(2'h2):(1'h0)] wire114;
  wire signed [(4'hd):(1'h0)] wire113;
  wire signed [(2'h3):(1'h0)] wire112;
  wire [(3'h7):(1'h0)] wire111;
  wire signed [(4'he):(1'h0)] wire110;
  wire [(5'h13):(1'h0)] wire109;
  wire signed [(5'h13):(1'h0)] wire108;
  wire signed [(3'h5):(1'h0)] wire107;
  wire signed [(3'h6):(1'h0)] wire106;
  wire signed [(4'h8):(1'h0)] wire105;
  wire [(3'h5):(1'h0)] wire104;
  wire signed [(5'h15):(1'h0)] wire103;
  wire [(3'h4):(1'h0)] wire102;
  wire signed [(5'h12):(1'h0)] wire101;
  wire signed [(5'h12):(1'h0)] wire99;
  reg [(4'h8):(1'h0)] reg133 = (1'h0);
  reg [(3'h6):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg131 = (1'h0);
  reg [(4'he):(1'h0)] reg130 = (1'h0);
  reg [(3'h5):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg126 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg123 = (1'h0);
  reg [(4'he):(1'h0)] reg122 = (1'h0);
  reg signed [(4'he):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg120 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg119 = (1'h0);
  reg [(5'h13):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg100 = (1'h0);
  reg [(3'h6):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg96 = (1'h0);
  reg [(4'hf):(1'h0)] reg95 = (1'h0);
  assign y = {wire134,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire99,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg100,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg95 <= $unsigned(wire93[(4'he):(4'h9)]);
      reg96 <= $unsigned((~|$unsigned({(|wire91), $unsigned(wire94)})));
      reg97 <= wire93[(4'ha):(4'h9)];
      reg98 <= wire94;
    end
  assign wire99 = {$signed($unsigned((-$unsigned(wire93))))};
  always
    @(posedge clk) begin
      reg100 <= $unsigned(reg97);
    end
  assign wire101 = (^(~^$signed({reg98[(2'h3):(1'h1)], (!wire90)})));
  assign wire102 = ((|$unsigned($unsigned((8'hbc)))) ?
                       wire91 : ($signed(reg100) <= (($unsigned(reg98) <<< (reg95 + reg96)) ?
                           $signed((^~wire91)) : ($signed(wire99) || (reg95 & reg95)))));
  assign wire103 = (($signed(({wire99} & reg98)) ?
                       (8'hbe) : ($unsigned(wire91) ^ (-$unsigned(wire93)))) << (wire93 == reg96[(4'hb):(4'h8)]));
  assign wire104 = $unsigned((^~(((8'ha7) ?
                       wire102[(2'h3):(1'h0)] : {(8'ha4),
                           reg100}) || (^$signed(reg95)))));
  assign wire105 = wire102;
  assign wire106 = ($signed(wire90) ?
                       (8'hb0) : (($unsigned($unsigned(reg100)) | $unsigned((&wire105))) ?
                           wire99[(4'h8):(1'h1)] : $signed(($signed(reg96) || $signed(wire105)))));
  assign wire107 = (~|{((~&(wire106 ? reg100 : wire92)) >> ((+reg96) ?
                           (wire106 ? wire102 : wire94) : (8'hae)))});
  assign wire108 = wire103[(5'h12):(4'h8)];
  assign wire109 = wire101[(5'h10):(4'hd)];
  assign wire110 = ($unsigned(((wire105 * $signed(reg97)) ?
                       $signed((wire102 >>> (8'ha7))) : wire93)) == $signed(wire108[(4'hc):(2'h2)]));
  assign wire111 = $unsigned(wire103[(2'h3):(2'h3)]);
  assign wire112 = (~wire111);
  assign wire113 = $signed(((+wire108) ?
                       wire112[(1'h1):(1'h1)] : $unsigned(wire103[(4'h9):(2'h2)])));
  assign wire114 = (wire111[(2'h3):(2'h2)] << $unsigned((|$signed($signed(reg97)))));
  assign wire115 = ($signed(wire109[(4'he):(3'h5)]) ?
                       wire99[(2'h2):(1'h1)] : (wire92[(2'h2):(1'h1)] ?
                           (wire93 ?
                               (-(+reg100)) : (~&wire106)) : $unsigned($unsigned((reg97 ?
                               wire92 : wire93)))));
  assign wire116 = $unsigned(((wire93[(3'h6):(3'h4)] || wire111[(1'h1):(1'h1)]) || $unsigned({(wire91 ?
                           wire90 : wire112),
                       {reg97}})));
  always
    @(posedge clk) begin
      reg117 <= (reg96 ?
          (~$signed($unsigned((wire106 ?
              wire93 : wire104)))) : wire106[(3'h6):(3'h5)]);
      reg118 <= $unsigned($unsigned((~&(^~(~^wire112)))));
      if ($signed(wire114))
        begin
          if (($unsigned($unsigned(wire101[(2'h2):(1'h0)])) < wire105[(4'h8):(3'h7)]))
            begin
              reg119 <= ($unsigned(((wire107 ?
                          (wire106 || reg95) : reg118[(4'ha):(3'h6)]) ?
                      wire101[(5'h11):(4'hc)] : (^~(~&reg95)))) ?
                  wire107[(1'h1):(1'h0)] : wire94);
            end
          else
            begin
              reg119 <= (8'ha5);
              reg120 <= $signed(wire92[(1'h1):(1'h1)]);
              reg121 <= ($unsigned((~|((!reg98) ?
                      $unsigned(reg96) : $unsigned(wire107)))) ?
                  (-({(wire91 >>> wire93), wire104} ?
                      (((7'h44) <= wire90) ?
                          (wire102 ?
                              wire109 : wire116) : (^~reg100)) : ((&wire106) << $signed(wire109)))) : (|(wire105[(2'h2):(2'h2)] ?
                      wire111[(1'h1):(1'h1)] : $unsigned((wire112 < reg120)))));
            end
        end
      else
        begin
          if (($signed($signed(((~&(8'ha7)) <= reg118))) ?
              $unsigned($unsigned(($unsigned((8'hbf)) > (wire106 ?
                  wire105 : wire107)))) : wire111[(3'h7):(2'h3)]))
            begin
              reg119 <= $unsigned((wire104 ?
                  wire112 : ($signed(wire93) <= $signed($unsigned(wire94)))));
              reg120 <= {{({wire116[(1'h0):(1'h0)]} ?
                          wire93[(4'hc):(3'h7)] : wire109[(3'h5):(1'h1)])},
                  $unsigned(reg121)};
              reg121 <= (reg121[(4'he):(3'h5)] ~^ {$unsigned(wire92[(2'h2):(1'h0)])});
            end
          else
            begin
              reg119 <= wire112[(2'h2):(1'h0)];
              reg120 <= reg119[(2'h2):(2'h2)];
              reg121 <= (|wire111[(3'h4):(1'h0)]);
            end
          reg122 <= $signed((!(~|$signed((7'h42)))));
          reg123 <= wire99;
          reg124 <= wire110;
          if ((wire105 ?
              ((~|({wire116, (8'h9f)} ? $signed(reg118) : (!reg123))) ?
                  $unsigned((+{reg118})) : $unsigned($signed(wire94))) : ((^(wire99 * $unsigned(wire103))) * (reg119[(4'h9):(3'h7)] ?
                  ({(8'hae),
                      (8'ha9)} && $unsigned(reg97)) : reg123[(5'h15):(5'h15)]))))
            begin
              reg125 <= wire111;
              reg126 <= wire105[(1'h0):(1'h0)];
            end
          else
            begin
              reg125 <= (~|(wire103 ^ $signed(reg100[(5'h11):(1'h0)])));
              reg126 <= wire102;
              reg127 <= $signed($signed((^(^{reg100, wire115}))));
              reg128 <= $unsigned(wire92[(2'h2):(1'h1)]);
            end
        end
      if (wire90)
        begin
          reg129 <= wire92[(1'h1):(1'h0)];
          reg130 <= (((reg117[(2'h3):(1'h0)] ? (&wire101) : reg127) ?
              reg96 : reg96) >= (&$signed(((reg125 ?
              wire106 : reg127) || reg126))));
          reg131 <= wire112[(1'h1):(1'h1)];
        end
      else
        begin
          reg129 <= ($unsigned((-$signed(wire102))) > reg124);
          reg130 <= (((($unsigned(wire92) && ((8'h9e) ? wire103 : reg124)) ?
                  wire115 : (|$signed(reg130))) ^~ $signed($signed(reg117))) ?
              wire109[(1'h0):(1'h0)] : {(~&reg120)});
          reg131 <= (reg128 ? $signed(reg96) : $signed($unsigned(wire93)));
          reg132 <= reg97[(3'h4):(2'h2)];
        end
      reg133 <= (^reg97);
    end
  assign wire134 = wire114[(2'h2):(2'h2)];
endmodule

module module58
#(parameter param83 = (&{((((8'ha7) ? (8'haa) : (8'hb8)) * (+(8'hba))) ? ((!(8'ha8)) * (8'hb9)) : ((~|(8'h9e)) - ((8'h9f) * (8'hbd)))), {{((8'hbe) >>> (8'ha9))}}}))
(y, clk, wire62, wire61, wire60, wire59);
  output wire [(32'hdc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire62;
  input wire signed [(3'h7):(1'h0)] wire61;
  input wire signed [(2'h3):(1'h0)] wire60;
  input wire [(5'h12):(1'h0)] wire59;
  wire [(3'h7):(1'h0)] wire82;
  wire [(5'h13):(1'h0)] wire81;
  wire [(5'h15):(1'h0)] wire80;
  wire [(2'h3):(1'h0)] wire79;
  wire signed [(5'h14):(1'h0)] wire78;
  wire [(5'h10):(1'h0)] wire77;
  wire [(4'h9):(1'h0)] wire76;
  wire [(3'h4):(1'h0)] wire75;
  wire signed [(5'h14):(1'h0)] wire74;
  wire [(3'h6):(1'h0)] wire66;
  wire signed [(4'h9):(1'h0)] wire64;
  wire [(3'h4):(1'h0)] wire63;
  reg [(3'h7):(1'h0)] reg73 = (1'h0);
  reg [(4'hf):(1'h0)] reg72 = (1'h0);
  reg [(5'h15):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg70 = (1'h0);
  reg [(3'h7):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg65 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire66,
                 wire64,
                 wire63,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg65,
                 (1'h0)};
  assign wire63 = (((wire62[(5'h12):(2'h2)] ?
                      $unsigned((^~wire60)) : $signed($signed(wire59))) ~^ (~(^~$unsigned(wire61)))) + ($unsigned((8'had)) ?
                      $unsigned($signed((&(8'hbf)))) : ({wire62} * (wire59 ?
                          (wire61 >= wire59) : (wire62 - wire60)))));
  assign wire64 = wire62[(5'h11):(5'h10)];
  always
    @(posedge clk) begin
      reg65 <= $signed(wire59[(4'he):(1'h0)]);
    end
  assign wire66 = ($signed($unsigned(reg65)) ?
                      wire64[(2'h3):(2'h3)] : ($signed((-(wire63 ?
                          (8'hb0) : wire59))) >>> {{$signed(wire63),
                              (wire63 - wire59)}}));
  always
    @(posedge clk) begin
      reg67 <= (wire59[(4'h8):(3'h6)] ?
          $unsigned(($unsigned($unsigned(reg65)) > (8'h9d))) : ($unsigned(wire64[(2'h3):(2'h2)]) != $signed($signed(wire59[(5'h10):(1'h0)]))));
      reg68 <= (reg65[(1'h0):(1'h0)] != ((wire61 ? (!{wire61}) : reg67) ?
          $signed(wire59) : (reg67[(3'h4):(1'h0)] >> wire64[(1'h1):(1'h1)])));
      if ((8'ha2))
        begin
          reg69 <= $signed({$signed(wire64),
              (((wire62 ?
                  wire66 : wire64) >> wire66[(3'h5):(2'h2)]) | $signed(wire63))});
          reg70 <= (((&(8'hb6)) ~^ (~^wire64)) ^ $signed(reg68[(3'h6):(1'h1)]));
        end
      else
        begin
          reg69 <= ((wire63 ?
              reg68[(1'h1):(1'h1)] : wire61[(2'h3):(2'h2)]) > $unsigned((wire61[(1'h1):(1'h0)] ?
              (|(reg69 ? wire59 : reg68)) : $signed({reg67}))));
          reg70 <= $signed(wire63);
          if ((wire61[(2'h3):(1'h0)] >= (!reg70)))
            begin
              reg71 <= $unsigned(wire61[(3'h4):(2'h3)]);
              reg72 <= (-$signed(($unsigned($signed(wire63)) >>> $signed(wire66[(2'h3):(1'h0)]))));
              reg73 <= $signed($signed((wire59[(3'h7):(2'h2)] || $signed(reg68))));
            end
          else
            begin
              reg71 <= (($unsigned((8'hb4)) ~^ $signed((~{wire59,
                  reg65}))) ^ ({($signed((8'hb6)) ?
                      ((8'ha3) * reg71) : wire66[(3'h6):(3'h5)])} ^~ reg73[(3'h5):(2'h2)]));
            end
        end
    end
  assign wire74 = $signed((^~wire62[(3'h7):(3'h4)]));
  assign wire75 = (^~(-$unsigned((~&wire66[(3'h6):(1'h1)]))));
  assign wire76 = (((-reg65) ?
                          {(!$unsigned(wire63)),
                              ($unsigned(wire66) ?
                                  (~^reg72) : {(8'ha1)})} : reg65[(1'h1):(1'h1)]) ?
                      $signed(({{wire61}, (^reg67)} ?
                          $unsigned($unsigned(wire61)) : $signed((8'haf)))) : $signed(($signed($signed(reg72)) * (wire64[(3'h7):(3'h6)] <<< wire66))));
  assign wire77 = $unsigned(($signed({(wire61 ? (8'ha1) : wire75),
                      {reg65, reg73}}) ~^ (&{wire74, wire61})));
  assign wire78 = {$signed(($unsigned((reg65 + reg72)) ?
                          (7'h44) : $unsigned($signed(wire62)))),
                      (reg70 << (~(!(8'hbf))))};
  assign wire79 = {wire61[(2'h3):(1'h1)]};
  assign wire80 = $signed((~^$signed(((wire78 ? reg68 : wire59) ?
                      (wire62 & wire75) : (~reg65)))));
  assign wire81 = ({$signed($signed($unsigned(wire79)))} ?
                      {reg71[(4'h8):(3'h7)]} : (8'ha2));
  assign wire82 = $signed(($unsigned({{(8'haf)}, (~^(8'ha3))}) ?
                      reg73[(3'h6):(3'h5)] : $unsigned({(wire63 ?
                              reg70 : wire61)})));
endmodule
