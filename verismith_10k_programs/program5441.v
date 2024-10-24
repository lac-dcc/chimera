module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h126):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire180;
  wire [(5'h12):(1'h0)] wire179;
  wire signed [(4'h9):(1'h0)] wire178;
  wire signed [(5'h10):(1'h0)] wire176;
  wire [(4'ha):(1'h0)] wire163;
  wire signed [(5'h14):(1'h0)] wire165;
  wire [(4'h8):(1'h0)] wire166;
  wire signed [(3'h7):(1'h0)] wire171;
  wire signed [(5'h12):(1'h0)] wire172;
  wire [(5'h10):(1'h0)] wire173;
  wire signed [(4'hd):(1'h0)] wire174;
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg5 = (1'h0);
  reg [(5'h15):(1'h0)] reg4 = (1'h0);
  reg [(5'h10):(1'h0)] reg167 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg169 = (1'h0);
  reg signed [(4'he):(1'h0)] reg170 = (1'h0);
  assign y = {wire180,
                 wire179,
                 wire178,
                 wire176,
                 wire163,
                 wire165,
                 wire166,
                 wire171,
                 wire172,
                 wire173,
                 wire174,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 reg167,
                 reg168,
                 reg169,
                 reg170,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (!$unsigned(wire1[(4'hc):(3'h4)]));
      reg5 <= $unsigned((($signed(reg4[(3'h6):(3'h5)]) ?
          (wire0 ^ wire0) : ((+(8'hba)) ?
              $signed(wire3) : $unsigned(wire0))) == $signed((~|$signed(wire3)))));
      reg6 <= (|$signed($unsigned((&(^(8'h9c))))));
      reg7 <= wire1;
      reg8 <= ({wire1[(2'h2):(2'h2)],
          (~$signed(wire2[(3'h5):(2'h2)]))} << (($signed(wire0[(4'hd):(4'h8)]) - reg7) ?
          wire0 : wire1[(4'h8):(3'h5)]));
    end
  module9 #() modinst164 (wire163, clk, reg8, wire1, reg6, reg4);
  assign wire165 = $signed($unsigned($unsigned((~(~&wire1)))));
  assign wire166 = $signed($unsigned($unsigned((reg4[(4'h9):(2'h3)] ^~ (wire3 >>> reg4)))));
  always
    @(posedge clk) begin
      reg167 <= {wire166,
          $unsigned(($signed($unsigned(wire2)) + ({wire0} ?
              wire166[(3'h4):(1'h1)] : (^~reg8))))};
      reg168 <= $signed((wire163 ?
          reg167[(3'h7):(3'h5)] : ($signed((~^wire1)) || (^~(+wire2)))));
      reg169 <= reg8;
      reg170 <= ({(~(reg8 ^ reg7[(4'h9):(3'h4)])),
          ((+$signed(wire165)) << {(-wire166),
              reg5[(4'h9):(4'h8)]})} | ({$unsigned((+(8'hb1)))} << (~^$signed(wire2))));
    end
  assign wire171 = reg7;
  assign wire172 = $signed(wire3);
  assign wire173 = $signed(({wire166[(2'h3):(1'h0)],
                       $unsigned($unsigned(reg7))} - wire3[(3'h6):(1'h1)]));
  module45 #() modinst175 (wire174, clk, reg168, wire163, reg169, reg5);
  module45 #() modinst177 (.y(wire176), .wire46(wire2), .wire48(wire166), .wire47(reg4), .clk(clk), .wire49(reg169));
  assign wire178 = $signed($signed(reg6));
  assign wire179 = (+(8'h9f));
  assign wire180 = ({$unsigned(wire179),
                       ((wire171 << wire176) ^ $unsigned((wire173 ?
                           (8'hbc) : wire166)))} >>> $signed(wire174[(3'h6):(3'h6)]));
endmodule

module module9
#(parameter param162 = ((-({((7'h43) * (8'ha3)), (~(8'haa))} ? {(8'ha6), (+(8'hae))} : {(-(8'hb4)), (-(8'ha7))})) ? ((~|(~((8'hb2) ? (8'hbe) : (8'h9c)))) ? (!(((8'ha0) * (7'h41)) <<< {(8'ha9)})) : (~^(^((8'ha9) + (8'hbf))))) : (&((((8'ha8) && (7'h41)) >> {(8'hae), (8'ha0)}) ? (((8'hbf) ? (8'hbc) : (8'hb2)) ? {(8'h9d), (7'h42)} : (|(7'h42))) : ((-(8'hab)) ? (|(8'hbd)) : (^(7'h43)))))))
(y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'h18e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire13;
  input wire [(5'h11):(1'h0)] wire12;
  input wire [(5'h11):(1'h0)] wire11;
  input wire [(4'hc):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire161;
  wire [(4'hc):(1'h0)] wire160;
  wire signed [(2'h2):(1'h0)] wire159;
  wire signed [(5'h14):(1'h0)] wire151;
  wire [(4'h8):(1'h0)] wire150;
  wire [(4'hf):(1'h0)] wire81;
  wire signed [(5'h11):(1'h0)] wire44;
  wire signed [(5'h10):(1'h0)] wire43;
  wire signed [(4'hf):(1'h0)] wire41;
  wire signed [(5'h15):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire18;
  wire [(4'hf):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire83;
  wire signed [(5'h15):(1'h0)] wire84;
  wire [(4'h8):(1'h0)] wire85;
  wire [(5'h15):(1'h0)] wire124;
  wire signed [(2'h3):(1'h0)] wire126;
  wire signed [(4'hf):(1'h0)] wire148;
  reg signed [(5'h15):(1'h0)] reg158 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg154 = (1'h0);
  reg [(5'h11):(1'h0)] reg153 = (1'h0);
  reg signed [(4'he):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire151,
                 wire150,
                 wire81,
                 wire44,
                 wire43,
                 wire41,
                 wire19,
                 wire18,
                 wire14,
                 wire83,
                 wire84,
                 wire85,
                 wire124,
                 wire126,
                 wire148,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire14 = (7'h40);
  always
    @(posedge clk) begin
      reg15 <= $unsigned(wire12);
      reg16 <= $signed(wire10[(2'h2):(2'h2)]);
      reg17 <= $unsigned(wire11);
    end
  assign wire18 = $signed($unsigned($unsigned(($signed(reg15) | (wire11 ?
                      wire13 : (8'ha9))))));
  assign wire19 = (~|(~$unsigned(wire14[(4'hb):(3'h6)])));
  module20 #() modinst42 (wire41, clk, wire12, wire13, wire19, wire10);
  assign wire43 = ({$unsigned(((wire10 && wire14) == wire10))} ?
                      {({$signed((8'hbe))} << wire10[(1'h1):(1'h0)])} : $signed(reg17[(1'h0):(1'h0)]));
  assign wire44 = ($signed($signed({(wire13 ? wire13 : wire18),
                          (wire41 << wire12)})) ?
                      $signed($unsigned(($unsigned(wire12) != {wire13,
                          reg16}))) : {$unsigned(reg16)});
  module45 #() modinst82 (wire81, clk, wire14, reg16, wire19, wire43);
  assign wire83 = wire14;
  assign wire84 = (&(((wire81 ^ $signed(wire10)) ?
                      $signed($signed((8'hba))) : $signed($unsigned((8'hbb)))) <= ($signed(wire10) ?
                      $signed(reg17[(4'hb):(4'hb)]) : (((8'hbe) - reg15) ?
                          $unsigned(wire12) : (wire18 ~^ reg16)))));
  assign wire85 = ((~^{$signed(wire84[(4'hb):(3'h4)])}) ?
                      (wire19 ?
                          wire13[(3'h7):(1'h1)] : (reg17[(3'h4):(3'h4)] & (!$signed(wire84)))) : ($signed({$signed(reg16),
                          (~&(8'hb6))}) > wire14[(4'he):(2'h2)]));
  module86 #() modinst125 (.wire88(wire43), .clk(clk), .y(wire124), .wire87(wire19), .wire90(wire84), .wire89(wire11));
  assign wire126 = $signed((^(((wire11 != wire18) ?
                           {wire18} : $unsigned(reg16)) ?
                       {(wire41 && wire19)} : $signed((8'ha1)))));
  module127 #() modinst149 (.wire129(wire13), .wire130(wire124), .y(wire148), .wire128(reg16), .wire131(wire83), .clk(clk));
  assign wire150 = wire12;
  assign wire151 = wire85[(3'h4):(2'h2)];
  always
    @(posedge clk) begin
      if (((&$signed((+(8'h9f)))) + $signed(reg16[(5'h11):(1'h1)])))
        begin
          if ((~|wire126[(2'h3):(1'h0)]))
            begin
              reg152 <= $unsigned($signed(wire85));
              reg153 <= ($signed((wire151[(3'h4):(1'h0)] == (wire83[(3'h4):(2'h2)] ?
                  wire84 : (~wire126)))) >>> (~($unsigned(wire13) > wire43[(4'hf):(4'h8)])));
              reg154 <= $signed((~|((+$signed((8'ha9))) ^~ wire12)));
              reg155 <= ($unsigned(($unsigned((wire150 ~^ wire11)) * wire43[(3'h5):(2'h2)])) ?
                  {reg15,
                      wire81[(2'h2):(2'h2)]} : $unsigned((($unsigned((8'ha7)) ?
                      reg152 : (&reg154)) ^~ ({reg15} ?
                      wire18[(3'h4):(2'h2)] : $unsigned((7'h43))))));
              reg156 <= ((+(-((!wire19) < {wire151, (8'ha1)}))) ?
                  wire148[(4'he):(4'h8)] : wire18[(3'h5):(3'h5)]);
            end
          else
            begin
              reg152 <= $unsigned({$signed(($signed(wire14) ?
                      (wire14 ~^ (7'h42)) : (wire19 ^ (8'h9c)))),
                  wire126});
            end
          reg157 <= $unsigned(($unsigned(reg154[(2'h2):(1'h0)]) * reg154[(3'h4):(2'h2)]));
          reg158 <= (~|$unsigned($unsigned((reg153 << $signed(wire14)))));
        end
      else
        begin
          if ((~^(({reg153} * ($signed(wire18) <<< {(7'h44),
              reg156})) || (~|(+$unsigned(wire18))))))
            begin
              reg152 <= (reg154 == wire11);
              reg153 <= ($unsigned({(!$signed(reg154)),
                      $signed(((8'hb8) >> wire126))}) ?
                  ((^(8'hb7)) <<< (reg156[(4'hd):(2'h2)] >> ((reg154 ?
                          reg158 : wire83) ?
                      (8'ha0) : (wire81 ? reg155 : wire41)))) : {(8'hb5)});
            end
          else
            begin
              reg152 <= (-(($unsigned((wire18 | reg152)) > (+wire43)) >= wire18));
              reg153 <= ($unsigned(wire126[(2'h3):(1'h1)]) == {(((~^wire148) & wire44) ?
                      ($unsigned(wire83) >>> {reg155,
                          reg154}) : (~^wire150[(3'h4):(1'h0)])),
                  ($unsigned((reg16 ?
                      wire19 : wire43)) >= ((reg152 <= wire83) <= $unsigned(wire18)))});
            end
          reg154 <= $unsigned(wire150);
          reg155 <= wire126[(1'h1):(1'h1)];
          reg156 <= (~|wire11);
          reg157 <= reg158[(3'h5):(3'h4)];
        end
    end
  assign wire159 = $unsigned($unsigned((^~((wire126 + wire10) ?
                       (~&reg157) : {reg155}))));
  assign wire160 = ((~^wire126) ?
                       (~^($signed((wire159 ~^ reg154)) ?
                           $signed((|(8'h9e))) : $signed((~reg158)))) : wire11[(3'h4):(3'h4)]);
  assign wire161 = $unsigned({$unsigned({wire150[(1'h0):(1'h0)],
                           (reg158 ? wire14 : (8'h9c))})});
endmodule

module module127
#(parameter param147 = (~^(!(-{{(8'ha5)}}))))
(y, clk, wire131, wire130, wire129, wire128);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire131;
  input wire signed [(5'h15):(1'h0)] wire130;
  input wire signed [(5'h12):(1'h0)] wire129;
  input wire signed [(5'h13):(1'h0)] wire128;
  wire [(3'h5):(1'h0)] wire146;
  wire signed [(3'h5):(1'h0)] wire141;
  wire signed [(5'h10):(1'h0)] wire140;
  wire signed [(4'he):(1'h0)] wire139;
  wire [(3'h7):(1'h0)] wire136;
  wire [(2'h2):(1'h0)] wire135;
  wire [(2'h3):(1'h0)] wire134;
  wire signed [(5'h15):(1'h0)] wire133;
  wire signed [(4'hf):(1'h0)] wire132;
  reg [(5'h12):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg144 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg138 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg137 = (1'h0);
  assign y = {wire146,
                 wire141,
                 wire140,
                 wire139,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg138,
                 reg137,
                 (1'h0)};
  assign wire132 = ($signed(wire130[(5'h11):(4'h9)]) - $signed({wire130}));
  assign wire133 = (wire128 ^~ ($signed(wire130[(4'ha):(1'h0)]) || (~^$signed(wire130[(3'h4):(2'h2)]))));
  assign wire134 = wire128[(5'h12):(3'h5)];
  assign wire135 = (~|(wire129[(4'hf):(4'ha)] ?
                       wire130 : wire133[(1'h0):(1'h0)]));
  assign wire136 = (!$signed($unsigned(((wire132 * wire131) - $signed(wire131)))));
  always
    @(posedge clk) begin
      reg137 <= ((wire135[(1'h1):(1'h1)] < {((^wire133) ^~ (wire129 ?
              wire128 : wire129)),
          wire130[(3'h5):(3'h4)]}) && $signed(wire128[(4'he):(4'h8)]));
      reg138 <= (-(wire136[(3'h6):(2'h2)] ?
          (8'hac) : $unsigned($unsigned((wire130 ? reg137 : (8'haf))))));
    end
  assign wire139 = wire132;
  assign wire140 = $signed((wire130 && $unsigned($unsigned({reg137}))));
  assign wire141 = wire133[(5'h14):(4'hf)];
  always
    @(posedge clk) begin
      reg142 <= {$unsigned(((~|(wire132 ? wire135 : reg138)) ?
              wire128[(4'hd):(1'h0)] : $unsigned($signed(wire128)))),
          $unsigned(wire136)};
      reg143 <= (8'ha0);
      reg144 <= (!{$unsigned($unsigned($unsigned(wire132)))});
      reg145 <= $signed($unsigned(wire128));
    end
  assign wire146 = $unsigned($unsigned((8'h9d)));
endmodule

module module86
#(parameter param123 = (((8'hbd) != (~&(^~((8'ha4) << (8'ha6))))) ? {((((7'h44) * (8'hbc)) | ((8'h9e) ? (8'h9e) : (8'hae))) >>> (((8'ha7) ? (8'ha1) : (7'h43)) ? (&(8'hae)) : {(8'hb6), (8'hb2)}))} : (((^((8'ha1) ? (8'hb4) : (8'hab))) != ({(8'hb1)} <= (!(8'ha5)))) ~^ (8'h9e))))
(y, clk, wire90, wire89, wire88, wire87);
  output wire [(32'h16e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire90;
  input wire [(5'h11):(1'h0)] wire89;
  input wire signed [(5'h10):(1'h0)] wire88;
  input wire [(5'h15):(1'h0)] wire87;
  wire [(4'hc):(1'h0)] wire122;
  wire signed [(4'ha):(1'h0)] wire121;
  wire signed [(4'ha):(1'h0)] wire111;
  wire signed [(5'h11):(1'h0)] wire110;
  wire signed [(4'hb):(1'h0)] wire107;
  wire [(2'h2):(1'h0)] wire106;
  wire signed [(3'h4):(1'h0)] wire105;
  wire signed [(4'ha):(1'h0)] wire104;
  wire signed [(3'h6):(1'h0)] wire103;
  wire [(5'h11):(1'h0)] wire102;
  wire [(5'h10):(1'h0)] wire101;
  wire [(4'hf):(1'h0)] wire100;
  wire signed [(5'h14):(1'h0)] wire99;
  wire [(4'he):(1'h0)] wire91;
  reg [(5'h10):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg118 = (1'h0);
  reg [(4'hb):(1'h0)] reg117 = (1'h0);
  reg [(2'h2):(1'h0)] reg116 = (1'h0);
  reg [(4'ha):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg114 = (1'h0);
  reg [(3'h7):(1'h0)] reg113 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg109 = (1'h0);
  reg [(5'h15):(1'h0)] reg108 = (1'h0);
  reg [(4'h9):(1'h0)] reg98 = (1'h0);
  reg [(2'h3):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg96 = (1'h0);
  reg [(4'hf):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg93 = (1'h0);
  reg [(4'h9):(1'h0)] reg92 = (1'h0);
  assign y = {wire122,
                 wire121,
                 wire111,
                 wire110,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire91,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg109,
                 reg108,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  assign wire91 = ((&$unsigned(((-(8'hab)) ?
                      wire87[(1'h1):(1'h0)] : $signed((8'hb8))))) ^ wire89);
  always
    @(posedge clk) begin
      if ({(~|($unsigned(wire91) >>> wire88[(4'hd):(1'h1)]))})
        begin
          reg92 <= {$unsigned((+wire91[(1'h0):(1'h0)])), wire91[(4'h8):(1'h1)]};
          reg93 <= $signed({$unsigned(wire87), wire88[(3'h7):(1'h1)]});
        end
      else
        begin
          if (((~$signed((wire89 ?
              wire87[(2'h3):(2'h3)] : $unsigned(wire89)))) < $unsigned({$signed((reg93 << reg92))})))
            begin
              reg92 <= reg92[(1'h1):(1'h0)];
              reg93 <= (($signed({{wire91}}) & $unsigned(wire89[(4'hb):(2'h3)])) ?
                  ((reg93 ?
                      ({wire89} | $signed(reg92)) : $signed(reg93)) < (^~(-wire91[(4'hd):(3'h6)]))) : (^~(((wire88 >> reg93) ?
                      (wire89 - wire90) : $signed(reg93)) >> $unsigned($signed(wire91)))));
              reg94 <= $signed(({(+$unsigned(reg93))} ^ (~wire90)));
            end
          else
            begin
              reg92 <= (-$signed(wire88));
              reg93 <= (wire90 ?
                  {({(!reg94)} - wire90), reg93} : (($signed({(8'hbb), reg93}) ?
                          wire90 : $unsigned($unsigned(wire91))) ?
                      $unsigned((reg94 ~^ {wire90, (8'ha7)})) : wire90));
              reg94 <= $unsigned((($unsigned($signed((7'h42))) ?
                  {(-wire88),
                      ((7'h42) | reg94)} : $signed($unsigned(wire87))) <<< wire91[(2'h3):(2'h3)]));
              reg95 <= (&{(reg94 ^ (|wire90[(4'ha):(3'h7)])),
                  reg92[(4'h8):(3'h4)]});
            end
          reg96 <= reg93;
          reg97 <= ($unsigned((|$signed(reg94))) ?
              (8'ha1) : (^{(+(&wire87)), (+{reg95})}));
        end
      reg98 <= {$unsigned(wire89[(5'h11):(4'h9)]),
          $unsigned(((+reg92[(3'h5):(1'h0)]) != ((wire90 && (8'had)) ^ (reg96 ?
              wire89 : reg97))))};
    end
  assign wire99 = ($signed($unsigned(($unsigned(reg95) ?
                      reg98[(3'h4):(1'h1)] : (reg98 ?
                          reg94 : (8'ha8))))) == (wire91[(3'h6):(1'h1)] ?
                      (wire91 - reg98) : (($unsigned(reg97) < ((8'ha2) + reg93)) >= $signed((~|wire88)))));
  assign wire100 = $signed((^(&$unsigned(((8'hb8) <<< wire87)))));
  assign wire101 = reg97[(1'h1):(1'h0)];
  assign wire102 = ((wire90 ? (!$unsigned($signed(wire91))) : reg93) - (reg92 ?
                       (|((&reg93) ?
                           $unsigned(wire89) : (wire100 ?
                               wire101 : reg98))) : (8'ha1)));
  assign wire103 = wire100;
  assign wire104 = (wire103 ?
                       reg97 : (wire100[(4'hf):(4'h9)] <= (&(|(^reg98)))));
  assign wire105 = {wire88};
  assign wire106 = $signed($unsigned(wire103[(3'h6):(3'h4)]));
  assign wire107 = (wire90[(1'h1):(1'h0)] >> $unsigned(reg93[(4'hc):(1'h0)]));
  always
    @(posedge clk) begin
      reg108 <= (^{($unsigned(wire103[(2'h2):(2'h2)]) ?
              reg97[(2'h3):(2'h3)] : $signed($unsigned(wire102))),
          $signed(reg96)});
      reg109 <= (((reg94[(1'h1):(1'h1)] ?
              ((reg98 < wire107) & wire99[(1'h0):(1'h0)]) : ($signed((8'hab)) ?
                  (wire104 ^ (8'haa)) : reg94)) != $signed(wire104[(2'h3):(2'h3)])) ?
          reg108[(4'h8):(1'h0)] : ((wire89[(5'h10):(5'h10)] >= ($unsigned(wire89) & (reg92 ?
                  wire100 : wire102))) ?
              ({((7'h42) ?
                      wire104 : wire90)} ^ (!wire105)) : $unsigned((!(wire87 | (8'h9d))))));
    end
  assign wire110 = ($signed((wire99 ?
                           $signed($signed(reg108)) : $unsigned(reg92))) ?
                       $unsigned((~^(~&wire105[(2'h2):(1'h0)]))) : ($signed({{reg95,
                               (8'hbe)}}) || wire99));
  assign wire111 = $signed((~{(|(reg97 == (8'haf))),
                       ($signed(reg98) ^~ {reg96})}));
  always
    @(posedge clk) begin
      reg112 <= wire90[(2'h3):(1'h1)];
      reg113 <= reg112;
      reg114 <= ($signed((-wire100)) ?
          wire110[(4'hf):(3'h4)] : ($unsigned((wire110[(4'ha):(1'h0)] ?
                  (8'ha2) : $unsigned(reg108))) ?
              $unsigned(wire89[(3'h4):(1'h0)]) : wire100[(1'h1):(1'h0)]));
      if (reg113[(3'h7):(2'h3)])
        begin
          reg115 <= $unsigned($unsigned(wire104[(3'h4):(1'h0)]));
          reg116 <= (($signed((|$unsigned(reg97))) << wire105[(2'h3):(2'h3)]) <<< $unsigned((reg112[(1'h1):(1'h0)] < wire91)));
          if ({wire100[(1'h0):(1'h0)]})
            begin
              reg117 <= wire105[(2'h2):(2'h2)];
              reg118 <= $unsigned((~^$signed($signed((8'hb3)))));
              reg119 <= $signed($unsigned((reg109 ?
                  ((reg95 ? wire111 : wire99) ?
                      wire91 : $signed(wire87)) : $unsigned((reg96 | (8'ha5))))));
            end
          else
            begin
              reg117 <= ((8'hab) || wire89);
              reg118 <= ((!$unsigned(((|reg97) ?
                  $unsigned(wire88) : (wire87 ?
                      (8'hab) : reg118)))) * ((-wire105) ?
                  ((^~reg116) ?
                      reg118[(1'h1):(1'h1)] : $signed((8'hbc))) : (&({wire104} ?
                      $unsigned(wire107) : (wire102 ? (8'hbe) : (8'hb8))))));
              reg119 <= $unsigned({{{wire103[(3'h4):(1'h0)]},
                      reg116[(1'h0):(1'h0)]}});
              reg120 <= ((^~wire100[(4'hf):(1'h1)]) ^~ $unsigned((wire87 <= ($signed(wire103) < $signed((8'hae))))));
            end
        end
      else
        begin
          reg115 <= ((~|$unsigned($unsigned(reg95))) ~^ ($unsigned(reg96[(4'h8):(3'h5)]) <<< ((~(reg92 ?
                  reg92 : reg115)) ?
              wire107 : reg120)));
          reg116 <= (&$signed(reg98[(4'h8):(2'h2)]));
        end
    end
  assign wire121 = $unsigned(wire105);
  assign wire122 = reg98;
endmodule

module module45
#(parameter param79 = (|({(((8'ha1) ? (8'hbb) : (8'hab)) ? (~(8'ha3)) : (!(8'h9d))), (((8'h9e) ? (8'hbe) : (8'ha4)) >>> (+(8'ha3)))} ^~ (~&((8'ha2) ? ((8'hb9) < (8'hb8)) : (-(8'hb5)))))), 
parameter param80 = (~&param79))
(y, clk, wire49, wire48, wire47, wire46);
  output wire [(32'h112):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire49;
  input wire [(3'h7):(1'h0)] wire48;
  input wire [(5'h15):(1'h0)] wire47;
  input wire [(5'h10):(1'h0)] wire46;
  wire [(5'h10):(1'h0)] wire78;
  wire [(2'h2):(1'h0)] wire77;
  wire [(2'h2):(1'h0)] wire76;
  wire signed [(4'ha):(1'h0)] wire72;
  wire [(4'he):(1'h0)] wire71;
  wire signed [(3'h4):(1'h0)] wire70;
  wire signed [(4'hc):(1'h0)] wire57;
  wire signed [(5'h11):(1'h0)] wire56;
  wire signed [(3'h5):(1'h0)] wire55;
  wire signed [(4'hd):(1'h0)] wire50;
  reg signed [(2'h3):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg74 = (1'h0);
  reg [(3'h7):(1'h0)] reg73 = (1'h0);
  reg [(2'h2):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg68 = (1'h0);
  reg [(4'hc):(1'h0)] reg67 = (1'h0);
  reg [(5'h13):(1'h0)] reg66 = (1'h0);
  reg [(4'h8):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg62 = (1'h0);
  reg [(3'h6):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg54 = (1'h0);
  reg [(4'h8):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg52 = (1'h0);
  reg [(3'h5):(1'h0)] reg51 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire72,
                 wire71,
                 wire70,
                 wire57,
                 wire56,
                 wire55,
                 wire50,
                 reg75,
                 reg74,
                 reg73,
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
                 reg59,
                 reg58,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  assign wire50 = $unsigned(wire46[(3'h7):(2'h2)]);
  always
    @(posedge clk) begin
      reg51 <= (wire49[(4'hd):(2'h3)] ?
          {(&$signed(wire47)),
              (($signed(wire48) | (wire46 ^ wire49)) ?
                  $unsigned($unsigned(wire47)) : (8'ha8))} : $signed(wire49));
      reg52 <= $unsigned({((reg51[(3'h4):(3'h4)] ~^ (~&wire46)) ?
              wire49 : ((wire49 > wire48) ? reg51 : (~reg51)))});
      reg53 <= ((wire46 * ($signed((wire46 ?
          wire46 : (8'haf))) >= ($signed(wire47) ?
          wire50 : $signed(wire50)))) ~^ wire47);
      reg54 <= wire47[(2'h3):(1'h0)];
    end
  assign wire55 = ((8'ha9) != ({wire49,
                          ($signed(reg54) >>> wire50[(1'h0):(1'h0)])} ?
                      (reg51 ?
                          $signed((reg53 > reg53)) : wire46[(3'h4):(2'h2)]) : $signed(($signed((8'hb6)) ?
                          (8'h9c) : wire48[(3'h4):(1'h0)]))));
  assign wire56 = $signed((($unsigned((reg54 ?
                      reg54 : reg51)) <= wire46) || (-((wire48 * reg51) ^ wire50))));
  assign wire57 = ($signed(wire49[(1'h0):(1'h0)]) ?
                      ((wire47 || (^~$unsigned(reg52))) ^~ wire56) : ((|(~^(reg51 ?
                              (8'hb4) : (8'ha6)))) ?
                          $unsigned(((8'ha1) ?
                              (wire56 ? wire48 : wire55) : (wire49 ?
                                  (7'h44) : wire56))) : $unsigned($signed({wire49,
                              wire50}))));
  always
    @(posedge clk) begin
      reg58 <= reg51;
      if (wire56)
        begin
          if (reg51[(3'h4):(1'h1)])
            begin
              reg59 <= $signed($unsigned($signed($unsigned($unsigned((8'had))))));
              reg60 <= wire56[(2'h2):(1'h1)];
              reg61 <= wire55[(2'h3):(1'h0)];
              reg62 <= $unsigned($unsigned($unsigned(reg53[(3'h7):(3'h5)])));
            end
          else
            begin
              reg59 <= $unsigned((^~reg52));
              reg60 <= reg59[(1'h0):(1'h0)];
              reg61 <= (({reg58, (~&wire48)} ?
                  $unsigned(reg59) : (+reg58[(4'hf):(4'hf)])) <<< {wire48,
                  wire47});
              reg62 <= reg53;
              reg63 <= (^(~^wire48));
            end
          reg64 <= (reg61 <<< ((&$unsigned({reg54})) ?
              $signed((wire55[(2'h2):(1'h0)] > $unsigned(wire56))) : (($signed(reg59) ?
                      {wire56, reg63} : wire57[(3'h4):(1'h0)]) ?
                  ($signed(reg62) & $signed(reg60)) : ($unsigned((8'hbe)) ?
                      $unsigned((8'ha1)) : reg60[(1'h0):(1'h0)]))));
          reg65 <= (($signed($unsigned($signed(reg59))) ?
              {{$unsigned((8'ha5)), (8'h9c)},
                  (+(reg54 + wire48))} : (+reg53)) ^~ $unsigned((reg54[(1'h1):(1'h1)] <= (reg59[(1'h1):(1'h1)] << $unsigned(reg58)))));
          if ($signed($unsigned(reg59)))
            begin
              reg66 <= (reg61[(1'h0):(1'h0)] ? reg63 : {reg62[(2'h3):(1'h1)]});
              reg67 <= ((reg61 ?
                      $unsigned($unsigned((reg59 <= (8'ha6)))) : wire48) ?
                  $signed(wire55) : ($signed(reg62[(3'h5):(2'h3)]) < reg66[(5'h13):(4'h8)]));
              reg68 <= (~&$unsigned(reg52));
            end
          else
            begin
              reg66 <= reg59[(1'h0):(1'h0)];
              reg67 <= $unsigned((8'h9e));
            end
          reg69 <= (($unsigned((((8'hb7) == reg51) || $unsigned((8'hb0)))) ?
                  reg60 : (reg53[(3'h6):(1'h0)] ?
                      reg53[(3'h6):(2'h2)] : ((wire55 ? reg60 : wire50) ?
                          wire57[(3'h4):(2'h2)] : reg63[(4'h8):(1'h1)]))) ?
              (((!$signed((8'hb3))) <<< $unsigned(((8'hab) <= wire49))) >> (reg66[(4'hb):(4'hb)] == $signed((+reg52)))) : $signed($unsigned(reg61)));
        end
      else
        begin
          reg59 <= reg65;
          reg60 <= reg59;
          reg61 <= (((((!reg59) > reg65[(4'h8):(2'h3)]) ?
                      ($signed(wire56) < (reg67 ?
                          reg62 : reg67)) : reg63[(3'h6):(3'h6)]) ?
                  wire57[(4'h9):(1'h1)] : ({reg52, wire57} ?
                      reg53[(4'h8):(3'h4)] : wire57)) ?
              $unsigned(reg68[(4'hf):(4'hc)]) : ((^~(-(reg64 && reg65))) ?
                  $signed(reg58) : $unsigned((8'hb9))));
        end
    end
  assign wire70 = {$signed((reg58[(4'hf):(4'hb)] != ((wire55 ?
                          wire46 : reg69) * reg53[(2'h3):(2'h2)]))),
                      $signed((|(~^(~|wire57))))};
  assign wire71 = ((reg63 ? wire55 : reg69[(1'h0):(1'h0)]) ?
                      (8'hb3) : ({((~&wire70) ?
                              $unsigned(reg58) : $signed(reg68))} == $unsigned({((8'hab) ?
                              reg58 : wire56)})));
  assign wire72 = (!(8'hb9));
  always
    @(posedge clk) begin
      if (reg65)
        begin
          reg73 <= (($unsigned($unsigned($unsigned((8'ha6)))) ?
                  $unsigned(reg67) : ($signed($signed(wire48)) + ($signed(reg53) ?
                      (reg69 ? reg69 : reg63) : reg59[(1'h1):(1'h1)]))) ?
              ($unsigned(wire50[(1'h1):(1'h0)]) | (({wire48} ?
                      (reg54 == reg64) : wire49[(2'h3):(2'h2)]) ?
                  reg58[(1'h1):(1'h1)] : wire49)) : ($unsigned((~|reg67)) ^~ (~^reg68[(1'h0):(1'h0)])));
        end
      else
        begin
          reg73 <= reg63;
          reg74 <= ($unsigned(reg58[(4'h8):(3'h7)]) ?
              $unsigned((reg52 ?
                  {((8'h9e) ? wire47 : reg60),
                      {reg67,
                          wire46}} : (&(reg61 ^~ reg62)))) : ($signed((~|(reg67 <= reg59))) >> (&reg59[(1'h1):(1'h0)])));
        end
      reg75 <= {wire72,
          $unsigned(($unsigned(reg68[(5'h13):(4'h8)]) ~^ (^~{wire72})))};
    end
  assign wire76 = $signed($unsigned(reg62));
  assign wire77 = (($signed((((8'hb1) >> reg59) ?
                      $unsigned(wire55) : (|(8'hb7)))) != $unsigned($unsigned({reg67,
                      reg63}))) >> wire49[(2'h3):(1'h0)]);
  assign wire78 = $signed(({((wire77 ? reg53 : wire46) ?
                          $unsigned(reg68) : (reg59 ?
                              reg73 : reg63))} ^~ reg64));
endmodule

module module20
#(parameter param40 = ((7'h40) <= {(({(8'hbf)} ? {(8'hbc), (8'hbb)} : ((8'ha3) ? (8'haa) : (8'hb1))) ? ((|(8'ha1)) <<< {(8'hb6), (8'hb3)}) : ((8'ha3) ? ((8'ha4) ? (8'ha0) : (8'hb8)) : (+(8'hae))))}))
(y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire24;
  input wire signed [(4'hb):(1'h0)] wire23;
  input wire signed [(4'ha):(1'h0)] wire22;
  input wire [(4'h8):(1'h0)] wire21;
  wire signed [(2'h2):(1'h0)] wire39;
  wire signed [(5'h11):(1'h0)] wire38;
  wire signed [(4'hf):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire35;
  wire [(4'h9):(1'h0)] wire34;
  wire signed [(5'h14):(1'h0)] wire32;
  wire signed [(4'hc):(1'h0)] wire31;
  wire signed [(4'hb):(1'h0)] wire30;
  wire signed [(5'h10):(1'h0)] wire29;
  wire signed [(4'hb):(1'h0)] wire28;
  wire [(2'h2):(1'h0)] wire27;
  wire signed [(3'h7):(1'h0)] wire26;
  wire signed [(3'h7):(1'h0)] wire25;
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 reg33,
                 (1'h0)};
  assign wire25 = $signed($unsigned({(~|$unsigned((8'hb2)))}));
  assign wire26 = $unsigned(($signed($unsigned($unsigned(wire21))) == ((wire25[(3'h7):(3'h7)] ?
                          $unsigned(wire23) : (&wire22)) ?
                      wire21 : $signed(wire24[(4'ha):(3'h5)]))));
  assign wire27 = (~&(((~^(|wire21)) >> wire21) ?
                      wire25 : ($signed((wire22 ? wire25 : wire24)) ?
                          $unsigned((~^wire23)) : (wire22[(4'h9):(4'h8)] ?
                              wire26 : (wire25 ? wire26 : wire25)))));
  assign wire28 = ($unsigned(($unsigned((-(8'hac))) * wire23[(1'h0):(1'h0)])) <= (8'hbb));
  assign wire29 = $unsigned($signed((^~(wire24 ?
                      (wire25 ? wire27 : (8'h9c)) : (^(7'h44))))));
  assign wire30 = wire27;
  assign wire31 = wire25[(2'h2):(2'h2)];
  assign wire32 = wire30[(4'h8):(1'h0)];
  always
    @(posedge clk) begin
      reg33 <= (((~($signed(wire24) ^ $unsigned(wire30))) == (8'hb0)) ?
          (($unsigned((wire22 * wire23)) ?
                  $signed((wire28 ? wire25 : (8'hab))) : wire24) ?
              $signed($unsigned((wire22 ^ wire25))) : ((8'hbf) ?
                  wire24[(3'h5):(2'h2)] : $signed((wire29 & wire31)))) : {$unsigned(wire28)});
    end
  assign wire34 = (|(($signed($signed(wire23)) ? wire27 : wire29) ?
                      wire30 : (7'h40)));
  assign wire35 = $unsigned(wire27[(1'h1):(1'h1)]);
  assign wire36 = $signed(wire34[(4'h8):(4'h8)]);
  assign wire37 = ((wire32 ? wire36 : wire34[(3'h5):(3'h4)]) ?
                      wire36 : ((-(wire21[(3'h7):(2'h3)] ?
                          (wire24 && wire25) : (&wire34))) >> (+$unsigned((^~wire36)))));
  assign wire38 = ($signed(wire37[(3'h6):(2'h3)]) ~^ wire27[(2'h2):(1'h0)]);
  assign wire39 = {reg33[(3'h6):(1'h1)]};
endmodule
