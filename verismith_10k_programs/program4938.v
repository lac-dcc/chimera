module top
#(parameter param159 = {{(8'ha0), (((~&(8'ha2)) ? ((8'ha9) ~^ (8'ha5)) : (~|(8'ha1))) || (((8'hb9) ? (7'h44) : (8'hbf)) ? (~^(8'ha8)) : ((8'hbb) >> (8'hb4))))}})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h15d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire158;
  wire [(3'h7):(1'h0)] wire156;
  wire signed [(5'h12):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire29;
  wire [(5'h14):(1'h0)] wire28;
  wire [(3'h5):(1'h0)] wire27;
  wire signed [(4'hb):(1'h0)] wire26;
  wire signed [(5'h14):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire23;
  wire [(3'h7):(1'h0)] wire22;
  wire signed [(3'h6):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire20;
  wire [(3'h5):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire13;
  wire signed [(3'h4):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire4;
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(3'h4):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  assign y = {wire158,
                 wire156,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire13,
                 wire5,
                 wire4,
                 reg24,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = $signed(wire1);
  assign wire5 = (~|wire0[(3'h7):(1'h1)]);
  always
    @(posedge clk) begin
      reg6 <= wire5;
    end
  always
    @(posedge clk) begin
      if ($signed(wire3))
        begin
          reg7 <= $unsigned($unsigned((($unsigned(wire1) < $signed(wire1)) ?
              wire3[(1'h1):(1'h1)] : $unsigned($unsigned(wire0)))));
        end
      else
        begin
          reg7 <= wire1[(3'h4):(1'h0)];
          reg8 <= wire0;
        end
      reg9 <= ($unsigned($unsigned({reg7})) ?
          ((~wire4) >>> {$unsigned((wire3 ? wire0 : wire3)),
              $unsigned({wire2, (8'hae)})}) : (wire1 & wire2));
      reg10 <= reg9;
      reg11 <= $unsigned(reg7);
      reg12 <= wire2;
    end
  assign wire13 = ($signed(reg6[(3'h7):(3'h5)]) << (-($signed(reg6) >> reg6)));
  always
    @(posedge clk) begin
      reg14 <= $unsigned((~|{$signed($unsigned(wire4)), reg6[(5'h10):(4'h8)]}));
      reg15 <= (8'hb2);
      reg16 <= wire2[(3'h7):(2'h3)];
      reg17 <= reg16[(4'hc):(3'h6)];
      reg18 <= $signed(($unsigned((~^reg12[(1'h0):(1'h0)])) ?
          ($signed($unsigned(wire13)) ? reg11 : {wire13}) : wire3));
    end
  assign wire19 = reg10;
  assign wire20 = $signed((reg6[(4'hd):(4'hd)] ?
                      $signed((8'hb6)) : (-(~&reg6))));
  assign wire21 = wire4;
  assign wire22 = $unsigned(reg16[(3'h5):(2'h3)]);
  assign wire23 = $signed(reg10);
  always
    @(posedge clk) begin
      reg24 <= $signed(wire20[(3'h5):(1'h1)]);
    end
  assign wire25 = (-reg9);
  assign wire26 = $signed(((~^({wire19, reg10} ? (&reg16) : wire19)) > wire20));
  assign wire27 = reg18;
  assign wire28 = wire2;
  assign wire29 = ($signed($unsigned($signed((^~wire13)))) + (reg14[(1'h1):(1'h1)] || {(-wire0[(2'h3):(1'h0)]),
                      $unsigned($unsigned(reg9))}));
  assign wire30 = $unsigned(wire13);
  module31 #() modinst157 (wire156, clk, wire30, wire25, wire23, wire28);
  assign wire158 = ({$signed({wire3, wire5})} > {($signed(wire19) ?
                           {reg16, $signed(reg6)} : {(~&wire28),
                               $signed(reg8)})});
endmodule

module module31
#(parameter param155 = ((({(!(8'had))} ^ (((8'h9e) ? (8'hb2) : (8'hb6)) ? (+(8'ha6)) : ((8'hb1) ? (8'h9c) : (8'h9f)))) ? ((((8'hbc) < (8'hb1)) >= (-(8'hbd))) >>> ((~&(8'h9c)) ? ((8'ha2) << (8'hbe)) : (|(7'h42)))) : ((+{(8'hbb), (8'ha0)}) ? {(-(8'hbf))} : (-((8'hae) || (7'h42))))) ? {((^~((8'ha9) + (8'hbb))) ? (~(^(8'ha5))) : (!(8'hba))), ((((7'h44) < (8'hb4)) >>> ((8'hb2) + (8'hb0))) < (((8'ha3) || (8'h9e)) ? {(8'h9e), (7'h41)} : ((8'hbf) ? (8'h9c) : (8'ha5))))} : ((({(8'hb9), (8'ha3)} == (!(8'h9f))) >>> (~(-(8'hab)))) ? ((-((8'hb8) <= (8'hb2))) >>> (|((8'ha7) ? (8'ha8) : (8'ha5)))) : ((&((7'h40) ? (7'h41) : (8'ha2))) ? (((8'hbb) >>> (8'hae)) ? ((8'ha6) >= (8'hbb)) : (!(8'had))) : (((8'had) ? (7'h42) : (8'had)) && ((8'ha1) ? (8'hbe) : (8'hb8)))))))
(y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'h1a6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire35;
  input wire signed [(5'h14):(1'h0)] wire34;
  input wire signed [(5'h14):(1'h0)] wire33;
  input wire signed [(4'hb):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire154;
  wire [(4'hc):(1'h0)] wire153;
  wire [(4'hb):(1'h0)] wire152;
  wire [(4'hd):(1'h0)] wire150;
  wire signed [(3'h7):(1'h0)] wire122;
  wire signed [(3'h5):(1'h0)] wire121;
  wire [(3'h6):(1'h0)] wire120;
  wire signed [(2'h3):(1'h0)] wire119;
  wire signed [(5'h13):(1'h0)] wire118;
  wire signed [(5'h15):(1'h0)] wire117;
  wire [(5'h12):(1'h0)] wire116;
  wire signed [(4'hd):(1'h0)] wire115;
  wire signed [(3'h4):(1'h0)] wire114;
  wire [(5'h12):(1'h0)] wire100;
  wire signed [(4'h9):(1'h0)] wire96;
  wire signed [(4'h9):(1'h0)] wire92;
  wire [(3'h5):(1'h0)] wire91;
  wire [(5'h11):(1'h0)] wire89;
  wire signed [(4'h9):(1'h0)] wire37;
  wire [(2'h3):(1'h0)] wire36;
  reg [(3'h7):(1'h0)] reg93 = (1'h0);
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg [(4'h9):(1'h0)] reg95 = (1'h0);
  reg [(4'h9):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg101 = (1'h0);
  reg [(5'h11):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg104 = (1'h0);
  reg signed [(4'he):(1'h0)] reg105 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg108 = (1'h0);
  reg [(4'hc):(1'h0)] reg109 = (1'h0);
  reg [(5'h11):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg111 = (1'h0);
  reg [(5'h12):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg113 = (1'h0);
  assign y = {wire154,
                 wire153,
                 wire152,
                 wire150,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire100,
                 wire96,
                 wire92,
                 wire91,
                 wire89,
                 wire37,
                 wire36,
                 reg93,
                 reg94,
                 reg95,
                 reg97,
                 reg98,
                 reg99,
                 reg101,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 reg106,
                 reg107,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 reg112,
                 reg113,
                 (1'h0)};
  assign wire36 = (({($unsigned((8'hb8)) ?
                              (wire34 ? wire34 : wire33) : wire33)} ?
                      (($unsigned(wire32) ? wire34[(4'h8):(3'h4)] : (~wire35)) ?
                          (8'hb4) : (^wire32[(4'h8):(3'h5)])) : {({wire34,
                              wire33} >= $signed(wire32))}) != (~^((^~wire35[(1'h0):(1'h0)]) ?
                      (^wire35) : wire35[(3'h6):(3'h4)])));
  assign wire37 = wire36;
  module38 #() modinst90 (.wire39(wire37), .clk(clk), .wire41(wire34), .wire40(wire32), .wire42(wire35), .y(wire89));
  assign wire91 = wire89;
  assign wire92 = (wire91 ?
                      $unsigned($unsigned((wire35 ?
                          (wire33 ?
                              wire37 : wire37) : wire36))) : wire33[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      reg93 <= $signed($signed($unsigned($signed(wire36))));
      reg94 <= wire32;
      reg95 <= $signed((wire89 > (~&(&(~|wire36)))));
    end
  assign wire96 = wire32;
  always
    @(posedge clk) begin
      reg97 <= $unsigned(wire92);
      if ($unsigned(wire34))
        begin
          reg98 <= wire36[(2'h3):(2'h2)];
        end
      else
        begin
          reg98 <= (({$signed($signed(wire32)),
                      $unsigned((wire37 ? wire89 : (8'hac)))} ?
                  (-(~|$unsigned(wire35))) : wire37[(2'h2):(2'h2)]) ?
              $signed((8'hb9)) : wire35[(4'hc):(3'h4)]);
        end
      reg99 <= ($unsigned($unsigned(wire37)) >= (|(!wire34[(5'h13):(3'h5)])));
    end
  assign wire100 = (($unsigned($signed((wire96 ?
                       wire32 : reg93))) << ((reg97[(3'h4):(2'h2)] ?
                           $signed(wire92) : $unsigned(wire96)) ?
                       $signed($signed(wire91)) : (!(reg94 ?
                           wire32 : wire34)))) - wire89);
  always
    @(posedge clk) begin
      reg101 <= (^wire89[(3'h4):(2'h3)]);
      reg102 <= reg94[(1'h1):(1'h1)];
      reg103 <= (^~$unsigned($signed({reg102[(4'hd):(4'ha)]})));
      if ($signed(wire35[(3'h5):(1'h0)]))
        begin
          reg104 <= {(reg93[(3'h6):(3'h5)] ?
                  reg99[(4'hd):(4'h8)] : {$signed((reg102 ^~ wire100))})};
          reg105 <= $signed(($signed((+(&wire36))) ?
              $unsigned(wire36[(2'h2):(2'h2)]) : $signed((wire36[(2'h3):(1'h0)] ?
                  (wire34 ? wire91 : (8'h9d)) : (+(8'ha3))))));
          if (({wire91[(2'h3):(2'h2)]} ?
              $unsigned($unsigned(({wire34,
                  reg97} | (~|reg95)))) : $signed(reg102[(4'hc):(1'h1)])))
            begin
              reg106 <= $unsigned($signed({$signed($signed(reg102))}));
              reg107 <= ((+$unsigned(reg102[(3'h4):(2'h3)])) ?
                  (($signed((reg101 ? (8'hac) : wire35)) ?
                          (^$unsigned(wire92)) : reg95[(1'h1):(1'h1)]) ?
                      (-{$unsigned(wire92),
                          $unsigned(reg95)}) : ($signed(reg98[(1'h0):(1'h0)]) * $signed(wire35[(4'hd):(4'ha)]))) : $signed(reg95));
            end
          else
            begin
              reg106 <= $signed(wire35[(5'h10):(4'ha)]);
              reg107 <= ((&reg107[(2'h3):(2'h2)]) ?
                  ((~&$signed((~|reg97))) ?
                      ($unsigned(reg98[(2'h2):(1'h0)]) ^~ {reg99[(4'he):(1'h1)],
                          (~|wire91)}) : (reg107 <= {(reg97 ~^ (8'h9e)),
                          ((8'hbd) - reg104)})) : $signed(reg103));
              reg108 <= reg102;
              reg109 <= (&reg93);
            end
          if ({(wire89 ? reg94[(4'hd):(1'h1)] : reg93)})
            begin
              reg110 <= $unsigned(reg101);
            end
          else
            begin
              reg110 <= ({reg107,
                  $signed($unsigned((wire92 ?
                      (8'ha2) : reg107)))} ^ ($signed(((wire92 ?
                  wire96 : wire92) >= (wire36 ^~ (8'ha2)))) >> ({(7'h41),
                      reg94[(4'hb):(3'h7)]} ?
                  reg107 : $unsigned(reg97[(3'h6):(3'h4)]))));
              reg111 <= ($signed($unsigned((wire37 ?
                  wire91 : reg98))) || $signed($unsigned(wire100)));
            end
        end
      else
        begin
          if ($unsigned(reg108))
            begin
              reg104 <= (!reg94[(4'h8):(3'h6)]);
              reg105 <= $unsigned(wire100[(1'h0):(1'h0)]);
              reg106 <= reg101;
              reg107 <= ($unsigned(((~^(wire36 == reg95)) ?
                  reg101 : reg98)) | wire36[(2'h3):(2'h3)]);
              reg108 <= ($unsigned((wire35[(4'he):(1'h1)] ?
                  ($unsigned(reg95) ~^ reg111) : reg105[(2'h2):(1'h0)])) >> (~(|($unsigned(reg108) ?
                  reg97[(3'h4):(3'h4)] : ((8'ha4) <<< reg108)))));
            end
          else
            begin
              reg104 <= reg104[(3'h4):(2'h2)];
              reg105 <= $signed((reg109 ?
                  (wire33 ?
                      reg108[(2'h3):(2'h2)] : (8'h9f)) : $signed($unsigned((reg98 ?
                      reg93 : wire100)))));
              reg106 <= reg105;
            end
          reg109 <= {$signed(wire96),
              (~($unsigned($unsigned(reg107)) ?
                  ((~wire33) ?
                      $unsigned((8'haf)) : (wire96 ?
                          wire92 : reg105)) : ((-(8'hb2)) >= $signed(reg107))))};
          reg110 <= ($unsigned($signed($signed((!reg93)))) * {reg106[(4'h8):(2'h3)],
              reg105[(2'h2):(1'h1)]});
          reg111 <= $unsigned($signed((~^wire34[(2'h3):(2'h3)])));
          reg112 <= (({(reg97 ? $signed(reg98) : $signed(wire100))} ?
                  $unsigned({((8'h9e) && reg106),
                      wire37[(3'h7):(3'h5)]}) : (reg104[(1'h0):(1'h0)] ?
                      ((~|wire34) <<< (~&reg99)) : reg95)) ?
              reg108 : ((((!reg107) ?
                  $unsigned((8'hae)) : $signed(wire91)) > reg107[(1'h1):(1'h1)]) - wire33[(1'h0):(1'h0)]));
        end
      reg113 <= $signed($signed((~^{$unsigned(wire33)})));
    end
  assign wire114 = $signed($signed((reg110 >>> reg110)));
  assign wire115 = reg108[(2'h3):(1'h0)];
  assign wire116 = $unsigned(wire114);
  assign wire117 = (({(~(reg107 >>> wire91))} || $signed(((reg107 ^~ (8'ha4)) * wire92))) && ((^~(!reg111)) ?
                       ((+(reg95 ? wire34 : reg95)) ?
                           $unsigned(reg112) : (~|wire89[(3'h5):(1'h0)])) : (((~^reg110) ?
                           (wire37 ?
                               reg105 : wire114) : $signed((8'hbc))) << ($unsigned((8'hb0)) + reg95))));
  assign wire118 = reg103;
  assign wire119 = wire37;
  assign wire120 = $signed((($unsigned($unsigned(reg108)) || reg112) ^ $signed(((wire118 != reg105) || (8'h9f)))));
  assign wire121 = wire34;
  assign wire122 = reg104;
  module123 #() modinst151 (wire150, clk, wire33, wire89, reg102, reg95, reg105);
  assign wire152 = $unsigned($signed({(8'hab)}));
  assign wire153 = (((-(((8'ha1) ? reg105 : reg107) || (reg101 ?
                           wire120 : (8'hb0)))) ?
                       wire100 : $unsigned($signed($unsigned(reg107)))) != ($unsigned((^~reg104[(2'h2):(1'h0)])) + reg103));
  assign wire154 = wire36[(1'h0):(1'h0)];
endmodule

module module123  (y, clk, wire128, wire127, wire126, wire125, wire124);
  output wire [(32'he8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire128;
  input wire [(5'h11):(1'h0)] wire127;
  input wire signed [(5'h11):(1'h0)] wire126;
  input wire signed [(2'h3):(1'h0)] wire125;
  input wire [(4'he):(1'h0)] wire124;
  wire [(4'h8):(1'h0)] wire149;
  wire signed [(5'h15):(1'h0)] wire148;
  wire signed [(4'hc):(1'h0)] wire147;
  wire [(5'h11):(1'h0)] wire146;
  wire signed [(5'h14):(1'h0)] wire145;
  wire [(2'h2):(1'h0)] wire144;
  wire signed [(4'h8):(1'h0)] wire143;
  wire [(4'he):(1'h0)] wire139;
  wire [(4'ha):(1'h0)] wire138;
  wire [(5'h15):(1'h0)] wire137;
  wire [(3'h5):(1'h0)] wire136;
  wire signed [(2'h2):(1'h0)] wire135;
  wire signed [(4'h9):(1'h0)] wire133;
  wire [(5'h12):(1'h0)] wire132;
  wire signed [(2'h3):(1'h0)] wire131;
  wire [(5'h11):(1'h0)] wire130;
  wire signed [(3'h4):(1'h0)] wire129;
  reg signed [(3'h6):(1'h0)] reg142 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg140 = (1'h0);
  reg [(2'h3):(1'h0)] reg134 = (1'h0);
  assign y = {wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 reg142,
                 reg141,
                 reg140,
                 reg134,
                 (1'h0)};
  assign wire129 = wire126[(2'h2):(2'h2)];
  assign wire130 = (8'ha2);
  assign wire131 = wire126;
  assign wire132 = wire131;
  assign wire133 = ((wire125 ?
                           ($unsigned({wire128, (8'hb6)}) ?
                               ((8'hbc) ?
                                   (wire128 ~^ wire126) : (|wire124)) : wire127) : wire124) ?
                       wire124[(4'ha):(1'h0)] : {$unsigned((wire124[(3'h6):(2'h3)] > {wire126,
                               (8'hb3)})),
                           (8'hbe)});
  always
    @(posedge clk) begin
      reg134 <= ((($unsigned($unsigned((8'ha3))) <= $unsigned((|wire129))) ~^ wire133) ?
          $signed((~^{$unsigned(wire131)})) : $unsigned($signed(wire125[(2'h2):(1'h1)])));
    end
  assign wire135 = (~&((&(wire124[(3'h7):(2'h3)] << ((8'hb3) + wire124))) ?
                       ((8'hba) <<< ((7'h42) ?
                           $signed(wire124) : wire124[(1'h1):(1'h1)])) : $signed($unsigned($unsigned(wire126)))));
  assign wire136 = {(|(wire129 ?
                           ((wire130 ?
                               wire131 : wire129) | $unsigned(wire130)) : wire129[(3'h4):(2'h2)])),
                       (|$signed(($signed((8'hb9)) & wire128[(5'h12):(3'h4)])))};
  assign wire137 = wire133[(3'h5):(1'h1)];
  assign wire138 = (-(wire128[(4'he):(4'hc)] ?
                       (^~(~&wire130[(4'he):(4'hb)])) : wire135));
  assign wire139 = $unsigned(((^~wire137) ?
                       (8'hb8) : $unsigned(wire129[(3'h4):(2'h3)])));
  always
    @(posedge clk) begin
      reg140 <= reg134;
      reg141 <= wire130;
      reg142 <= {reg141[(3'h7):(1'h0)]};
    end
  assign wire143 = ((&(!wire126[(2'h2):(1'h0)])) >>> wire127);
  assign wire144 = wire127;
  assign wire145 = (($unsigned($signed(wire133)) - {(~^((8'ha6) ^~ wire129))}) ?
                       reg141 : $signed($signed($unsigned($unsigned(wire132)))));
  assign wire146 = (wire137[(4'hd):(2'h2)] ?
                       $unsigned($unsigned(((~^wire133) ?
                           wire138 : $signed(wire139)))) : (($signed((wire126 ?
                               reg134 : reg134)) || (^~(~&wire130))) ?
                           {({wire128, wire125} ?
                                   (!wire145) : {(8'ha2), (8'hba)}),
                               $unsigned({wire131, (8'h9f)})} : wire131));
  assign wire147 = (reg140[(3'h6):(2'h2)] >>> (&$signed((wire132[(2'h3):(2'h3)] << (8'hae)))));
  assign wire148 = wire138;
  assign wire149 = $signed({((~(!wire139)) != $signed((wire128 ?
                           (8'hb8) : wire131))),
                       ((~^(~(8'hb4))) ?
                           (-wire126) : (^~wire126[(4'hd):(4'h9)]))});
endmodule

module module38
#(parameter param88 = (+(((^((8'hb9) >= (8'ha4))) < (((8'ha4) != (8'hb5)) >> {(8'haa)})) ~^ ((+((8'h9f) | (8'ha9))) ? (^{(7'h42), (8'hbc)}) : ((&(8'hbd)) ? (~(8'h9f)) : (8'hbc))))))
(y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'h231):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire42;
  input wire signed [(4'hf):(1'h0)] wire41;
  input wire [(2'h2):(1'h0)] wire40;
  input wire [(3'h6):(1'h0)] wire39;
  wire [(3'h5):(1'h0)] wire87;
  wire signed [(5'h14):(1'h0)] wire86;
  wire signed [(3'h7):(1'h0)] wire85;
  wire signed [(4'h9):(1'h0)] wire84;
  wire [(3'h7):(1'h0)] wire71;
  wire [(4'he):(1'h0)] wire70;
  wire signed [(3'h6):(1'h0)] wire69;
  wire signed [(5'h13):(1'h0)] wire68;
  wire signed [(4'he):(1'h0)] wire67;
  wire [(4'ha):(1'h0)] wire50;
  wire [(4'ha):(1'h0)] wire49;
  wire [(4'h9):(1'h0)] wire48;
  wire [(4'hb):(1'h0)] wire46;
  wire [(5'h14):(1'h0)] wire45;
  wire signed [(5'h15):(1'h0)] wire44;
  wire signed [(4'hf):(1'h0)] wire43;
  reg [(3'h4):(1'h0)] reg83 = (1'h0);
  reg [(4'hc):(1'h0)] reg82 = (1'h0);
  reg [(4'hf):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg79 = (1'h0);
  reg [(5'h15):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg75 = (1'h0);
  reg [(3'h5):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg73 = (1'h0);
  reg [(4'he):(1'h0)] reg72 = (1'h0);
  reg [(5'h12):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg signed [(4'he):(1'h0)] reg62 = (1'h0);
  reg [(3'h5):(1'h0)] reg61 = (1'h0);
  reg [(3'h7):(1'h0)] reg60 = (1'h0);
  reg [(5'h15):(1'h0)] reg59 = (1'h0);
  reg [(5'h10):(1'h0)] reg58 = (1'h0);
  reg [(5'h13):(1'h0)] reg57 = (1'h0);
  reg [(4'h9):(1'h0)] reg56 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg54 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg [(3'h6):(1'h0)] reg51 = (1'h0);
  reg signed [(4'he):(1'h0)] reg47 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire50,
                 wire49,
                 wire48,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
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
                 reg73,
                 reg72,
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
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg47,
                 (1'h0)};
  assign wire43 = $signed($signed($signed((wire40 ?
                      (wire42 >> wire40) : wire41))));
  assign wire44 = $unsigned($signed((((~wire39) ?
                      wire41[(3'h7):(1'h0)] : {wire41}) + (8'hbd))));
  assign wire45 = ($signed(($signed($signed((8'hb6))) ?
                          $signed($unsigned(wire41)) : wire41[(3'h5):(3'h5)])) ?
                      {$unsigned($unsigned((wire44 ? wire39 : wire41))),
                          wire41} : $unsigned(($unsigned((~|(8'ha8))) ?
                          {wire39[(2'h2):(1'h0)],
                              (~^wire44)} : wire41[(4'he):(3'h6)])));
  assign wire46 = {{{(wire44[(1'h0):(1'h0)] - (~^wire42)), (&$signed(wire44))},
                          (&$unsigned(wire45[(4'he):(3'h4)]))}};
  always
    @(posedge clk) begin
      reg47 <= (wire41[(4'hc):(3'h7)] ? wire42 : {wire40[(1'h1):(1'h1)]});
    end
  assign wire48 = ($unsigned($unsigned({wire46[(4'h8):(1'h0)]})) ?
                      wire45 : $signed((^~wire44[(4'he):(4'hd)])));
  assign wire49 = ({($unsigned(wire39[(2'h3):(2'h3)]) ?
                              $signed($signed(wire40)) : $signed(((8'ha9) ^~ wire44))),
                          $unsigned((8'ha0))} ?
                      $signed(reg47[(4'hb):(1'h0)]) : $signed((-(-$unsigned(wire41)))));
  assign wire50 = (((^~{(8'hbe)}) ?
                      (wire43[(4'hd):(1'h1)] ^ {(~^wire39)}) : (($unsigned(wire39) >= {reg47}) ?
                          {(reg47 >= wire42)} : wire42)) ~^ $signed((($signed(wire39) ?
                          wire46[(3'h5):(3'h5)] : (wire44 ? wire48 : wire45)) ?
                      $unsigned({(8'hbc), wire44}) : $signed((8'hbe)))));
  always
    @(posedge clk) begin
      reg51 <= (($signed(wire39[(3'h5):(2'h3)]) ?
              wire50[(1'h1):(1'h1)] : (-(~{wire42}))) ?
          reg47 : (8'hb0));
      reg52 <= $signed(wire40[(2'h2):(1'h0)]);
      if ({reg47, (wire49[(2'h3):(1'h1)] || reg52[(3'h4):(3'h4)])})
        begin
          if ((-$signed((wire40[(1'h1):(1'h0)] ?
              (~wire41[(4'hf):(4'he)]) : ((&wire41) << (wire49 ?
                  wire50 : (8'ha1)))))))
            begin
              reg53 <= $unsigned($signed(wire43));
              reg54 <= (wire49 ?
                  (8'hae) : $signed({(wire45[(3'h6):(1'h0)] + $unsigned(reg52)),
                      ($signed(reg51) ?
                          reg51[(3'h6):(2'h3)] : wire50[(4'h9):(1'h0)])}));
              reg55 <= wire40[(1'h0):(1'h0)];
              reg56 <= {wire40[(1'h1):(1'h0)]};
            end
          else
            begin
              reg53 <= wire44;
              reg54 <= $unsigned((!{((~|wire40) ?
                      (wire46 <<< wire43) : {reg56, (8'hbd)})}));
              reg55 <= (~(~(((wire42 ? wire45 : wire42) ?
                  wire50[(3'h5):(2'h2)] : (wire48 ?
                      reg54 : wire40)) >> $unsigned({reg54, wire43}))));
              reg56 <= $signed(reg56);
            end
          if (reg47[(4'hb):(3'h6)])
            begin
              reg57 <= $unsigned($unsigned(wire40[(1'h1):(1'h1)]));
              reg58 <= {reg53[(3'h7):(3'h5)], $signed(reg52)};
              reg59 <= (wire46[(3'h4):(2'h2)] << (~^(+$unsigned($unsigned((8'hb1))))));
              reg60 <= reg55;
            end
          else
            begin
              reg57 <= (+(8'ha7));
              reg58 <= (8'ha7);
              reg59 <= $signed(($signed($unsigned($unsigned((8'hb3)))) & (8'had)));
              reg60 <= $unsigned({(+$unsigned((&(8'hb7))))});
            end
          reg61 <= reg53[(3'h5):(2'h2)];
          if (wire41[(4'hc):(3'h5)])
            begin
              reg62 <= wire46[(2'h3):(1'h1)];
              reg63 <= (~^reg54[(4'ha):(4'ha)]);
              reg64 <= $unsigned((^$unsigned(($unsigned((8'hb7)) <= wire46[(1'h1):(1'h1)]))));
            end
          else
            begin
              reg62 <= $signed(wire39[(2'h2):(1'h1)]);
            end
          reg65 <= wire44[(5'h12):(4'he)];
        end
      else
        begin
          reg53 <= reg63[(2'h2):(2'h2)];
          reg54 <= {$signed((+({wire41, reg60} - (reg58 >= reg52)))), reg59};
          if ((-$unsigned((8'had))))
            begin
              reg55 <= reg60[(1'h0):(1'h0)];
              reg56 <= reg57;
              reg57 <= wire41[(4'hc):(3'h4)];
              reg58 <= wire50[(3'h6):(2'h3)];
            end
          else
            begin
              reg55 <= ({$unsigned(reg56)} < reg52[(2'h2):(1'h1)]);
              reg56 <= (8'ha7);
              reg57 <= reg56;
              reg58 <= $unsigned($signed(wire49[(4'ha):(2'h3)]));
            end
          reg59 <= wire49[(2'h2):(1'h0)];
          if (((!$unsigned(($signed((8'h9d)) && $signed(reg63)))) + reg62))
            begin
              reg60 <= $signed($signed(reg63));
            end
          else
            begin
              reg60 <= $signed((!(wire42[(4'h9):(2'h2)] - reg60[(2'h3):(2'h3)])));
              reg61 <= {(($unsigned((wire40 ^~ reg56)) != (8'hb6)) << $unsigned(wire49))};
            end
        end
      reg66 <= reg62;
    end
  assign wire67 = $signed(((~|(~^reg51)) ?
                      (7'h40) : (reg56 | $unsigned((wire39 + reg55)))));
  assign wire68 = $signed((reg58[(4'h9):(1'h1)] < ($unsigned(reg59[(4'ha):(3'h6)]) ^ {$signed((8'h9c))})));
  assign wire69 = {(~&{reg57}), $unsigned($unsigned((~&$signed(wire40))))};
  assign wire70 = (reg60[(2'h3):(1'h1)] ^ ({(!(~reg62)),
                          ((~reg58) ? $unsigned(reg52) : $unsigned(reg57))} ?
                      (~|(^(-wire50))) : (reg60 ?
                          (~((8'hac) & reg54)) : (reg63[(4'hd):(1'h1)] & wire39))));
  assign wire71 = $signed(($signed({wire46}) ?
                      wire68[(5'h13):(3'h4)] : reg58[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg72 <= (&reg61);
      if ({reg51[(3'h6):(2'h2)]})
        begin
          reg73 <= wire48[(2'h3):(1'h0)];
          if ((|$signed((reg54[(1'h0):(1'h0)] ?
              ((wire48 ^~ wire42) ? (&wire41) : wire70) : {wire71}))))
            begin
              reg74 <= wire70;
              reg75 <= {($unsigned($unsigned(reg57[(3'h4):(1'h0)])) ?
                      ((reg56[(3'h7):(3'h6)] & (wire40 ?
                          wire46 : (8'hb0))) ^~ $signed($signed(wire69))) : (~&reg72)),
                  ($unsigned(reg65) ?
                      ({$signed(wire41),
                          $signed(wire48)} >> (8'h9d)) : {(!(^(8'ha3))),
                          reg57[(3'h6):(1'h0)]})};
              reg76 <= {$signed(wire71[(3'h7):(1'h0)])};
              reg77 <= ($unsigned($signed(reg75)) ?
                  (~reg74) : $unsigned(({{reg76, reg56},
                      reg55[(3'h5):(1'h1)]} & (+reg72[(3'h5):(1'h0)]))));
              reg78 <= $signed(({{(8'haa)}, $unsigned({reg66})} ?
                  (reg60[(3'h5):(3'h5)] ?
                      (^(wire48 <<< reg76)) : reg51[(3'h4):(1'h1)]) : $signed({$unsigned(wire44)})));
            end
          else
            begin
              reg74 <= wire41[(3'h6):(1'h1)];
              reg75 <= wire49;
              reg76 <= (~&(($signed($signed((8'h9d))) ^~ wire50) ?
                  reg61 : $unsigned((((8'ha6) != reg52) ?
                      (reg74 ? wire70 : wire43) : reg66[(4'hd):(1'h0)]))));
              reg77 <= (((wire43 >= ({(8'h9f), wire49} + (~reg75))) ?
                  wire39[(2'h3):(2'h3)] : $signed(reg78[(4'ha):(4'h9)])) == wire48);
            end
          if (wire45)
            begin
              reg79 <= $signed({($signed(wire44) || reg75[(2'h3):(1'h0)])});
            end
          else
            begin
              reg79 <= ($signed(wire40[(1'h1):(1'h1)]) ?
                  (($unsigned($signed(reg79)) ~^ reg56[(3'h4):(2'h2)]) ?
                      $signed($unsigned((-reg75))) : $unsigned(reg66[(4'he):(2'h3)])) : $signed((wire67[(4'ha):(1'h1)] ~^ (+(^~(8'had))))));
              reg80 <= wire68;
              reg81 <= (!(+((reg57 == $unsigned(wire39)) ^ reg75)));
            end
          reg82 <= {(((((8'hbc) ? wire69 : wire39) ?
                          $unsigned(wire69) : (~|(8'ha6))) ?
                      (^(wire49 & reg79)) : reg51[(1'h0):(1'h0)]) ?
                  (((!reg56) ? (!wire69) : {(8'h9c)}) || ((wire43 >> wire49) ?
                      (reg61 ?
                          reg72 : wire39) : reg75[(4'hc):(4'h9)])) : ($unsigned({reg53,
                          wire46}) ?
                      ((wire68 & wire48) ?
                          (~&wire48) : ((7'h42) * wire40)) : $signed($signed(reg66)))),
              reg74};
        end
      else
        begin
          reg73 <= (7'h42);
          reg74 <= reg77[(3'h7):(1'h0)];
          if (reg53[(1'h1):(1'h0)])
            begin
              reg75 <= reg51;
            end
          else
            begin
              reg75 <= wire71[(2'h3):(2'h2)];
              reg76 <= $unsigned($signed(wire49[(2'h3):(1'h0)]));
            end
          reg77 <= ($signed((reg77[(1'h0):(1'h0)] ?
                  ($signed(reg61) ?
                      (wire41 ?
                          (8'ha0) : (7'h41)) : (^~wire44)) : ((reg54 == reg59) ?
                      ((8'haf) - reg80) : $signed((8'hba))))) ?
              {(((reg62 ^ wire44) - $signed(wire49)) <<< (8'haf))} : $signed(($unsigned($signed((7'h42))) ?
                  $signed(reg63) : wire41)));
          reg78 <= wire41;
        end
      reg83 <= (-(($unsigned(reg63[(1'h0):(1'h0)]) < ($unsigned(wire44) ?
          (reg66 >>> reg72) : wire42)) <= $unsigned($signed(((8'haa) ?
          (7'h42) : reg51)))));
    end
  assign wire84 = (!$signed(((~{reg61}) & reg80)));
  assign wire85 = $signed($unsigned(wire69));
  assign wire86 = ($unsigned((8'hbb)) ?
                      $signed(reg53) : (~&$unsigned((8'hb7))));
  assign wire87 = {$signed((^$signed(wire45))), $signed($signed(reg75))};
endmodule
