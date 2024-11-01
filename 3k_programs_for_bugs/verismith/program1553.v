module top
#(parameter param165 = {((|({(8'hb9), (8'hb4)} ^~ (~(7'h41)))) >>> ((~|(~|(8'ha2))) + (((8'hb2) && (8'hb2)) && (|(8'ha0))))), ((({(8'hb7), (8'haa)} ? ((8'ha3) ? (8'hab) : (8'ha0)) : (!(8'hb3))) <= (!(~^(8'h9c)))) + ((|((7'h43) || (8'ha9))) & ((!(8'ha9)) != ((8'hab) ? (8'hb3) : (8'hac)))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h20c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire164;
  wire [(4'h8):(1'h0)] wire78;
  wire signed [(4'hc):(1'h0)] wire47;
  wire signed [(5'h14):(1'h0)] wire42;
  wire [(4'ha):(1'h0)] wire41;
  wire [(3'h6):(1'h0)] wire20;
  wire signed [(3'h7):(1'h0)] wire19;
  wire [(4'hb):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire17;
  wire signed [(3'h4):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire11;
  wire [(3'h5):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire80;
  wire signed [(3'h6):(1'h0)] wire162;
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  reg [(5'h10):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(4'hc):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(3'h4):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  assign y = {wire164,
                 wire78,
                 wire47,
                 wire42,
                 wire41,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire80,
                 wire162,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire5 = (~^(8'ha5));
  assign wire6 = wire2;
  assign wire7 = wire3;
  assign wire8 = wire3[(1'h0):(1'h0)];
  assign wire9 = (wire6 & wire4[(4'h8):(3'h5)]);
  assign wire10 = wire0;
  assign wire11 = wire6[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg12 <= (-wire0[(2'h2):(1'h0)]);
      reg13 <= wire2[(2'h2):(1'h0)];
      reg14 <= ((^(|wire7[(3'h4):(3'h4)])) - $signed(wire1));
      reg15 <= (~wire11[(3'h4):(1'h0)]);
    end
  assign wire16 = reg13;
  assign wire17 = (^$signed({($signed(wire6) <= (wire8 ^ wire8)),
                      ((reg15 ^ wire11) * wire10)}));
  assign wire18 = {reg12};
  assign wire19 = (!wire8);
  assign wire20 = (^~(((wire5[(2'h2):(1'h0)] & {wire16,
                      (8'hb1)}) && wire17) < (~|($signed(wire0) ?
                      reg12 : ((8'hb3) ? wire4 : wire2)))));
  always
    @(posedge clk) begin
      if ((8'ha0))
        begin
          reg21 <= ($unsigned($signed(wire8)) ?
              (~(-((wire16 ? wire18 : wire19) ?
                  (wire16 ?
                      wire3 : wire20) : (-wire0)))) : (wire17[(2'h2):(1'h0)] ?
                  $unsigned((&{wire19, (8'hae)})) : wire19[(3'h6):(2'h2)]));
        end
      else
        begin
          reg21 <= wire11[(4'h9):(3'h7)];
          reg22 <= (wire6[(3'h4):(3'h4)] ? wire3 : (-wire8));
          reg23 <= $unsigned($unsigned(wire10));
          reg24 <= wire17[(3'h5):(1'h1)];
          reg25 <= (+(|wire9));
        end
      reg26 <= (8'haf);
      if (((~|wire7) ?
          ((!wire16[(1'h1):(1'h1)]) ?
              $signed((!wire20[(3'h5):(3'h4)])) : wire2[(2'h2):(1'h0)]) : wire1))
        begin
          reg27 <= (-$unsigned($unsigned($signed(wire7[(3'h7):(3'h4)]))));
          reg28 <= (((wire3 ?
                  ($signed(reg22) | (wire8 > reg23)) : ($signed(wire19) ^ $unsigned((8'hbe)))) && (8'ha5)) ?
              $signed(reg27) : $signed($unsigned(reg21[(3'h6):(1'h1)])));
          if (($unsigned({$signed((wire8 ? wire1 : reg22)), wire11}) ?
              reg27 : reg15[(2'h2):(1'h1)]))
            begin
              reg29 <= ($signed(wire2) ?
                  wire6[(3'h4):(1'h0)] : $unsigned(((+wire17[(1'h1):(1'h1)]) ?
                      (wire0[(3'h4):(3'h4)] ?
                          reg12 : wire9[(4'h8):(3'h6)]) : (^$signed(wire9)))));
              reg30 <= (($signed(((reg25 ?
                      wire3 : wire5) >> {(8'ha7)})) <= wire20[(3'h6):(3'h6)]) ?
                  {wire2[(1'h0):(1'h0)],
                      (~^$signed(wire6[(3'h4):(1'h0)]))} : (($unsigned((reg13 ?
                          wire4 : reg21)) ?
                      wire19[(3'h4):(2'h2)] : ($signed((8'hae)) && (wire10 | wire6))) - (reg22 ?
                      wire16[(2'h2):(1'h1)] : ((8'had) ?
                          {wire8, reg23} : $signed(reg24)))));
              reg31 <= $signed((~|wire10));
              reg32 <= $unsigned(((~&((!(8'h9c)) ~^ (reg30 && reg31))) << $unsigned($signed({reg28,
                  (8'h9e)}))));
              reg33 <= $unsigned(($unsigned(reg31) ?
                  $signed($unsigned(reg24)) : reg29[(4'hd):(1'h0)]));
            end
          else
            begin
              reg29 <= (wire4 ?
                  $unsigned($unsigned(reg13[(4'h9):(4'h8)])) : reg21[(4'h8):(2'h3)]);
              reg30 <= (reg25[(1'h1):(1'h0)] ?
                  $signed(reg14[(2'h2):(1'h0)]) : wire10[(1'h1):(1'h0)]);
              reg31 <= $unsigned(wire6);
              reg32 <= ((~^reg33[(3'h6):(2'h2)]) < wire1);
              reg33 <= ($signed($signed(wire17[(3'h6):(3'h6)])) < ($signed({wire9[(3'h4):(1'h0)]}) ?
                  ($unsigned((reg27 ? (8'ha2) : (8'hb7))) > {{(8'ha7),
                          reg22}}) : $unsigned($signed($signed(reg22)))));
            end
          if (wire8)
            begin
              reg34 <= (^~(^{wire3}));
              reg35 <= (8'hbe);
            end
          else
            begin
              reg34 <= reg28;
              reg35 <= wire10;
              reg36 <= wire17[(3'h7):(3'h5)];
              reg37 <= {(|{(~^$unsigned(wire17)),
                      ($unsigned(reg24) < $unsigned((8'hb9)))})};
              reg38 <= reg30[(4'he):(3'h6)];
            end
        end
      else
        begin
          reg27 <= (~|reg26);
          if ($signed($unsigned({wire5[(3'h5):(2'h3)], reg28})))
            begin
              reg28 <= ((!(-$unsigned((wire20 & wire1)))) >= $unsigned(((-$unsigned(wire17)) ?
                  (wire3 ?
                      (wire5 ?
                          reg33 : wire4) : wire16) : wire18[(4'h8):(1'h0)])));
              reg29 <= (+wire9);
              reg30 <= $unsigned($unsigned(((^(reg12 ? wire3 : wire3)) ?
                  {(wire6 ? (8'h9f) : (8'hb4))} : $unsigned($signed(reg36)))));
            end
          else
            begin
              reg28 <= ((8'ha5) <= ($signed(((^~reg13) ?
                      (^reg13) : $signed(reg26))) ?
                  (($signed(wire3) ?
                      (wire2 ?
                          wire19 : wire6) : wire16[(1'h1):(1'h1)]) != (~&wire16)) : $unsigned($signed({wire16,
                      reg29}))));
              reg29 <= (reg31 ?
                  $signed((wire20[(1'h1):(1'h0)] == {$unsigned(wire8)})) : (~|($unsigned($signed(reg36)) ?
                      ((^~reg13) ?
                          $unsigned(wire2) : reg38[(3'h7):(1'h0)]) : $signed({wire1}))));
              reg30 <= reg37;
              reg31 <= $unsigned((reg37 ?
                  $signed((~^((8'had) >>> reg27))) : wire9));
            end
        end
      reg39 <= $unsigned((($unsigned($signed(wire8)) ?
          wire11[(1'h0):(1'h0)] : {$signed(reg13)}) - {reg38[(4'ha):(3'h4)],
          reg29}));
      reg40 <= ({(7'h41),
          (reg29[(4'hb):(3'h4)] >> wire6[(2'h2):(1'h0)])} ^~ reg38[(4'he):(2'h2)]);
    end
  assign wire41 = {$unsigned(wire2)};
  assign wire42 = $unsigned($signed((8'hbc)));
  always
    @(posedge clk) begin
      reg43 <= reg13;
      reg44 <= $unsigned($unsigned(((wire42[(1'h0):(1'h0)] + ((8'ha4) ?
              reg36 : (8'hb2))) ?
          (wire1 ? (8'hae) : (~^reg38)) : ({wire3, wire2} ?
              wire10[(1'h0):(1'h0)] : ((8'hbe) & reg35)))));
      reg45 <= $signed(reg34);
      reg46 <= reg38[(3'h5):(2'h3)];
    end
  assign wire47 = (^reg27);
  module48 #() modinst79 (wire78, clk, wire2, reg23, wire3, wire42, reg46);
  assign wire80 = ({reg23} ? reg29 : $unsigned(reg23[(4'h8):(1'h1)]));
  module81 #() modinst163 (wire162, clk, wire17, reg26, wire11, reg40, wire41);
  assign wire164 = wire11;
endmodule

module module81
#(parameter param160 = (|(^~(|((^~(8'ha9)) - ((8'hb9) ? (7'h40) : (8'h9c)))))), 
parameter param161 = param160)
(y, clk, wire86, wire85, wire84, wire83, wire82);
  output wire [(32'h339):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire86;
  input wire [(4'hd):(1'h0)] wire85;
  input wire [(2'h2):(1'h0)] wire84;
  input wire [(4'hb):(1'h0)] wire83;
  input wire signed [(4'ha):(1'h0)] wire82;
  wire [(4'ha):(1'h0)] wire156;
  wire [(4'h8):(1'h0)] wire134;
  wire [(5'h11):(1'h0)] wire133;
  wire [(2'h2):(1'h0)] wire132;
  wire [(4'hf):(1'h0)] wire131;
  wire signed [(4'h8):(1'h0)] wire119;
  wire signed [(5'h11):(1'h0)] wire118;
  wire signed [(5'h12):(1'h0)] wire117;
  wire [(3'h4):(1'h0)] wire116;
  wire signed [(4'hb):(1'h0)] wire108;
  wire signed [(2'h3):(1'h0)] wire99;
  wire [(4'h9):(1'h0)] wire89;
  wire signed [(3'h5):(1'h0)] wire88;
  wire signed [(4'h9):(1'h0)] wire87;
  reg [(4'h9):(1'h0)] reg159 = (1'h0);
  reg [(3'h7):(1'h0)] reg158 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg154 = (1'h0);
  reg [(4'h9):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg151 = (1'h0);
  reg [(3'h4):(1'h0)] reg150 = (1'h0);
  reg [(4'ha):(1'h0)] reg149 = (1'h0);
  reg signed [(4'he):(1'h0)] reg148 = (1'h0);
  reg [(4'hc):(1'h0)] reg147 = (1'h0);
  reg [(5'h11):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg145 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg144 = (1'h0);
  reg [(4'h9):(1'h0)] reg143 = (1'h0);
  reg [(4'h8):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg141 = (1'h0);
  reg [(5'h12):(1'h0)] reg140 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg139 = (1'h0);
  reg [(3'h6):(1'h0)] reg138 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg137 = (1'h0);
  reg [(3'h5):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg135 = (1'h0);
  reg [(4'h9):(1'h0)] reg130 = (1'h0);
  reg [(4'hd):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg128 = (1'h0);
  reg [(5'h12):(1'h0)] reg127 = (1'h0);
  reg signed [(4'he):(1'h0)] reg126 = (1'h0);
  reg [(5'h11):(1'h0)] reg125 = (1'h0);
  reg [(4'hf):(1'h0)] reg124 = (1'h0);
  reg [(4'hf):(1'h0)] reg123 = (1'h0);
  reg [(4'h9):(1'h0)] reg122 = (1'h0);
  reg [(4'hd):(1'h0)] reg121 = (1'h0);
  reg [(5'h13):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg115 = (1'h0);
  reg [(4'h8):(1'h0)] reg114 = (1'h0);
  reg [(5'h10):(1'h0)] reg113 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg112 = (1'h0);
  reg [(4'h9):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg110 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg109 = (1'h0);
  reg [(4'hf):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg106 = (1'h0);
  reg [(5'h11):(1'h0)] reg105 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg104 = (1'h0);
  reg [(4'hb):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg101 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg98 = (1'h0);
  reg [(5'h14):(1'h0)] reg97 = (1'h0);
  reg [(4'ha):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg94 = (1'h0);
  reg [(5'h14):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg91 = (1'h0);
  reg [(3'h7):(1'h0)] reg90 = (1'h0);
  assign y = {wire156,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire108,
                 wire99,
                 wire89,
                 wire88,
                 wire87,
                 reg159,
                 reg158,
                 reg157,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
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
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 (1'h0)};
  assign wire87 = (^$signed(((+wire82) == (^(^wire85)))));
  assign wire88 = (((+(~$signed(wire84))) ^ $signed((~&(wire82 < wire83)))) ^~ ((wire84[(1'h1):(1'h1)] >>> wire87[(2'h3):(2'h3)]) ?
                      (^wire83) : $signed(wire83)));
  assign wire89 = $signed(($signed($unsigned($signed(wire87))) ?
                      wire84 : (((wire88 << wire83) ?
                          $unsigned(wire83) : {wire85}) | wire83)));
  always
    @(posedge clk) begin
      if ($unsigned(wire86[(4'ha):(3'h4)]))
        begin
          reg90 <= (^($signed((8'hbe)) ? $signed((&(~&wire89))) : wire85));
          reg91 <= (8'hb4);
          reg92 <= ((reg91 ?
              $signed(((8'haa) << $signed(reg91))) : reg91[(3'h5):(2'h2)]) == $unsigned($unsigned($signed($signed((8'hb5))))));
        end
      else
        begin
          reg90 <= wire85;
        end
      if ((reg91[(3'h6):(3'h6)] | $unsigned($unsigned(($unsigned(reg91) * (reg92 == wire84))))))
        begin
          reg93 <= wire85;
        end
      else
        begin
          reg93 <= $signed(wire89[(2'h2):(1'h0)]);
          reg94 <= {$signed($unsigned($signed(reg92)))};
          reg95 <= wire86;
        end
      reg96 <= reg90;
      reg97 <= ($unsigned({(~(wire88 ? wire88 : reg93))}) ?
          wire86[(2'h3):(2'h2)] : (reg94 >>> (&(~|wire89[(2'h3):(2'h2)]))));
      reg98 <= ((wire85[(4'hc):(3'h6)] ?
          wire83[(2'h2):(1'h1)] : ((8'hac) ?
              $signed(reg91) : (~(reg97 ?
                  reg90 : reg91)))) > (&($signed((^~(8'hab))) ?
          ((wire89 <<< reg92) ?
              (reg95 == (7'h40)) : $unsigned(reg90)) : ((~^wire84) ?
              reg95[(4'ha):(1'h0)] : $unsigned(reg96)))));
    end
  assign wire99 = ((reg97 <= (8'hae)) - (reg93 >= (8'hb6)));
  always
    @(posedge clk) begin
      if ((~($signed($signed(((8'hb0) ? (8'hae) : wire99))) ?
          ($unsigned($unsigned(reg90)) * (+(wire86 ?
              wire99 : (8'hbd)))) : reg93[(1'h0):(1'h0)])))
        begin
          reg100 <= reg91;
          reg101 <= $unsigned((~($signed($signed(wire99)) ?
              {reg92[(1'h0):(1'h0)], $signed(reg98)} : wire85[(4'h9):(3'h6)])));
          reg102 <= reg90;
          reg103 <= $unsigned((reg94 & (($signed(reg101) > (wire99 | reg95)) >= (~|$unsigned(reg90)))));
          reg104 <= {((8'hb8) || (($signed((7'h42)) <<< (wire99 || reg100)) < reg102[(5'h13):(4'h9)]))};
        end
      else
        begin
          if ((7'h41))
            begin
              reg100 <= (reg103 <= (($signed(wire86[(4'h9):(1'h0)]) == {$signed((8'hb9)),
                      (reg102 ? wire85 : reg103)}) ?
                  ((-(reg104 ?
                      wire85 : reg93)) > (&$signed(reg95))) : $signed($signed((+reg100)))));
              reg101 <= reg103;
              reg102 <= wire83[(1'h0):(1'h0)];
              reg103 <= (7'h43);
              reg104 <= wire89[(2'h2):(1'h1)];
            end
          else
            begin
              reg100 <= (~|$signed($signed($signed({wire88}))));
              reg101 <= reg94[(1'h0):(1'h0)];
              reg102 <= (^(reg98[(2'h3):(1'h1)] - reg94[(2'h2):(1'h0)]));
              reg103 <= wire84[(1'h1):(1'h1)];
            end
        end
      reg105 <= reg96;
      if ($unsigned(($signed(reg97[(3'h6):(1'h1)]) ?
          {wire84, $signed($signed(reg102))} : reg103[(2'h2):(2'h2)])))
        begin
          reg106 <= $unsigned(({reg92} ?
              ((~&$unsigned((8'haf))) ?
                  wire82 : {$unsigned(reg95),
                      $signed(reg94)}) : ({reg105[(3'h7):(3'h4)],
                  (^wire84)} >= ({reg102, reg95} ?
                  (wire88 << reg98) : (reg93 ? wire84 : wire99)))));
          reg107 <= $signed(wire83[(3'h6):(3'h4)]);
        end
      else
        begin
          reg106 <= {(8'hbf)};
          reg107 <= (&{$signed({{wire86, wire84}})});
        end
    end
  assign wire108 = $unsigned(wire83[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      if ((reg103[(4'ha):(2'h2)] || (^(~|wire108))))
        begin
          if ((wire85[(3'h4):(1'h1)] ?
              $signed(($unsigned($unsigned(wire85)) + $signed($signed(wire82)))) : $signed($unsigned((+$signed(reg92))))))
            begin
              reg109 <= (+(reg95 ? reg102[(5'h14):(1'h1)] : {(|reg102)}));
              reg110 <= reg96[(3'h5):(2'h2)];
            end
          else
            begin
              reg109 <= (8'hb0);
              reg110 <= reg106[(3'h6):(3'h4)];
              reg111 <= {$unsigned(reg92)};
              reg112 <= (^~(7'h40));
            end
        end
      else
        begin
          if ($signed((~((wire108[(4'h8):(3'h7)] ^ $unsigned(wire86)) ?
              (|reg91[(1'h1):(1'h0)]) : (^~(reg91 & reg95))))))
            begin
              reg109 <= $unsigned($unsigned((wire87[(3'h5):(3'h4)] ?
                  ({reg103} ? (+wire82) : (reg111 < wire88)) : (+(wire86 ?
                      reg95 : reg103)))));
              reg110 <= (-reg92[(1'h0):(1'h0)]);
              reg111 <= $unsigned((((~|wire84) <<< $unsigned(reg96)) << $unsigned(wire108[(4'hb):(3'h5)])));
              reg112 <= reg95[(3'h7):(3'h4)];
            end
          else
            begin
              reg109 <= $unsigned((($unsigned(wire85[(4'hc):(4'h9)]) ^ {reg102}) != (8'hb4)));
            end
          reg113 <= {((^(~|reg110[(1'h1):(1'h1)])) ?
                  (($unsigned(reg106) != wire108) ?
                      ($signed(reg105) < wire89[(4'h9):(3'h4)]) : reg95) : (^($unsigned(wire99) ?
                      wire86 : wire85)))};
        end
      reg114 <= (+$unsigned((~|(reg110[(2'h3):(2'h2)] || ((8'hb0) ?
          reg110 : reg91)))));
      reg115 <= ((8'hb7) ?
          $signed(reg96[(4'h9):(3'h4)]) : ({$signed((reg105 ? reg101 : wire99)),
              $signed((+reg103))} | (reg94[(1'h0):(1'h0)] >>> ({reg96} ~^ wire85[(4'h9):(2'h3)]))));
    end
  assign wire116 = (~|(wire89 ?
                       $unsigned($unsigned((~&reg104))) : $signed(wire108[(4'h9):(4'h8)])));
  assign wire117 = (~|$signed({reg98[(4'hc):(3'h4)]}));
  assign wire118 = reg101[(4'hb):(4'ha)];
  assign wire119 = (8'hac);
  always
    @(posedge clk) begin
      reg120 <= (reg98 ?
          ($signed($signed($signed(reg105))) * {((reg100 ? wire118 : wire88) ?
                  ((8'hb2) ?
                      (8'hb8) : wire89) : $unsigned(reg102))}) : $signed(((+$signed(reg91)) ^~ ((~&reg113) ?
              wire82 : reg93))));
      reg121 <= {{(((~(8'ha2)) < $signed(reg106)) << $unsigned($unsigned((8'ha1))))},
          reg90[(1'h1):(1'h0)]};
      reg122 <= {{$signed($unsigned($unsigned(reg106))),
              ($unsigned(((8'hb8) > reg103)) ? {wire89} : wire99)},
          reg109[(3'h6):(2'h3)]};
      if ($unsigned((^(~&{reg106[(4'ha):(1'h1)], reg112}))))
        begin
          reg123 <= (|{($signed(reg112[(1'h1):(1'h0)]) ?
                  (^$unsigned(wire83)) : reg91[(2'h3):(1'h1)])});
        end
      else
        begin
          if ($signed($unsigned($unsigned(reg92))))
            begin
              reg123 <= {wire108[(4'h9):(3'h6)],
                  $signed(($signed((~|reg94)) && $signed($signed(reg93))))};
              reg124 <= $unsigned(reg95);
              reg125 <= (((|$unsigned($signed(reg124))) ?
                      reg112 : reg100[(1'h1):(1'h1)]) ?
                  (wire83[(4'h8):(1'h1)] + {{(wire108 << reg98)}}) : ($signed(reg101) ?
                      $signed(wire89) : (^(^~reg95))));
              reg126 <= $unsigned({reg109});
              reg127 <= $unsigned((7'h44));
            end
          else
            begin
              reg123 <= ($unsigned(reg106) ?
                  $unsigned(reg124) : (reg103[(3'h4):(2'h3)] ?
                      (reg109[(3'h6):(1'h1)] ?
                          $unsigned(wire108[(4'h9):(4'h8)]) : $unsigned((^reg106))) : reg121[(2'h2):(1'h0)]));
            end
          reg128 <= $signed(({$signed(reg107), wire108[(4'ha):(4'ha)]} ?
              (~^(|$signed(reg111))) : wire89));
          reg129 <= (8'hb7);
        end
      reg130 <= reg126;
    end
  assign wire131 = $signed(($unsigned((^{(8'h9d)})) <= ((^~(^~reg95)) <<< wire86)));
  assign wire132 = (wire85 <= (|$unsigned(($unsigned(reg106) - $unsigned(reg95)))));
  assign wire133 = reg95;
  assign wire134 = reg121;
  always
    @(posedge clk) begin
      reg135 <= $signed((^~{(^(|reg94))}));
      if ($signed(($signed((wire86 * (reg115 >> reg103))) && {$unsigned((wire83 ?
              (8'hb6) : reg123))})))
        begin
          reg136 <= {$unsigned(wire116[(1'h1):(1'h0)]),
              (wire99[(1'h0):(1'h0)] ~^ $signed((reg96[(2'h3):(1'h1)] <= $signed(reg98))))};
        end
      else
        begin
          reg136 <= $unsigned((~|($signed((~(8'hb3))) ?
              (~|$signed(reg95)) : (wire133 <= $unsigned(reg104)))));
          if (reg110[(1'h0):(1'h0)])
            begin
              reg137 <= $signed((((reg103[(4'h9):(4'h8)] ?
                          $unsigned(reg95) : ((7'h44) ? (8'hba) : wire85)) ?
                      {wire86[(1'h0):(1'h0)],
                          $unsigned(reg130)} : (wire88[(2'h2):(2'h2)] <= reg96[(4'h8):(4'h8)])) ?
                  (reg125 == $signed(reg127[(2'h3):(2'h3)])) : (-{(wire83 * (8'hb0)),
                      (~reg120)})));
              reg138 <= $signed(($unsigned((|$signed(reg92))) != reg128));
              reg139 <= $signed(reg129[(3'h5):(3'h5)]);
              reg140 <= (reg91[(2'h2):(1'h1)] ?
                  {$signed({$signed(reg104)})} : (+{$unsigned(wire89),
                      ($signed(wire116) ? $unsigned(reg135) : {reg93})}));
            end
          else
            begin
              reg137 <= (&(($unsigned((reg104 ? wire116 : reg101)) ?
                  $signed(reg109[(4'h9):(3'h5)]) : (&(reg111 & reg104))) ^ ($signed($unsigned(reg100)) ?
                  $signed((reg95 * reg122)) : reg101[(1'h1):(1'h1)])));
              reg138 <= wire86;
            end
          if (reg94)
            begin
              reg141 <= (~^((~|wire87[(2'h2):(1'h1)]) ^ (reg102 ?
                  $unsigned((reg136 ? reg100 : reg98)) : (-reg115))));
              reg142 <= {(~|wire131[(4'hb):(3'h6)]), reg94[(2'h2):(1'h0)]};
            end
          else
            begin
              reg141 <= ({$signed(reg98)} < wire131);
            end
          reg143 <= $signed(reg102[(4'he):(4'h8)]);
          reg144 <= {$signed(reg103)};
        end
      reg145 <= $unsigned($signed(wire116[(3'h4):(2'h2)]));
      if (reg127)
        begin
          reg146 <= $unsigned(wire117);
        end
      else
        begin
          reg146 <= $signed((~|wire89));
          reg147 <= (~^$unsigned($unsigned($signed(((8'h9c) && reg96)))));
          reg148 <= (reg122[(2'h3):(1'h0)] >>> ((reg126[(4'he):(1'h1)] ?
                  reg97[(5'h14):(2'h3)] : (reg137 >> (reg114 ?
                      reg92 : reg110))) ?
              reg121 : (((8'hb8) && (wire131 ? reg93 : wire118)) ?
                  {$unsigned(reg102), (wire131 >>> wire82)} : ({reg142,
                          wire119} ?
                      (-reg130) : reg143[(4'h9):(4'h9)]))));
          if ({($signed(reg143[(4'h9):(4'h9)]) ^ ($unsigned($unsigned(reg137)) + (~wire86[(1'h1):(1'h0)]))),
              $unsigned((((wire99 ? reg109 : wire116) << $unsigned(wire108)) ?
                  $unsigned((reg146 == reg106)) : (reg101[(2'h3):(2'h3)] << (reg121 ?
                      wire108 : wire117))))})
            begin
              reg149 <= ((^~(^($signed(reg135) ?
                      (reg90 * (7'h42)) : $signed((8'hb6))))) ?
                  (|{((reg140 ? reg125 : reg115) | ((7'h40) ?
                          reg100 : reg124))}) : $signed(({$signed(reg111)} & (~|wire116[(3'h4):(2'h2)]))));
            end
          else
            begin
              reg149 <= (&((!reg142) - wire82));
              reg150 <= $signed(({((wire117 >> reg121) ? {reg139} : (|reg100)),
                      (reg147[(1'h1):(1'h0)] ?
                          (reg143 <= reg95) : (wire132 ? reg123 : reg107))} ?
                  (8'ha4) : {wire82[(3'h5):(1'h0)],
                      (wire89[(3'h4):(1'h0)] ? reg109 : (!reg101))}));
              reg151 <= (!(({$signed(reg106)} ?
                  $signed(reg102) : $unsigned($signed(reg122))) && (8'hb9)));
              reg152 <= $unsigned((((~^$signed(reg100)) >> ($signed(reg102) ?
                      $unsigned(reg123) : (+reg93))) ?
                  reg135 : $unsigned((~&$unsigned(reg143)))));
              reg153 <= $unsigned((($signed($signed((8'ha1))) ?
                  $unsigned(reg107) : ((reg137 ?
                      reg148 : reg107) ^ (~|reg128))) << reg126[(4'he):(4'hd)]));
            end
          reg154 <= reg141[(4'hb):(2'h3)];
        end
      reg155 <= ($signed(($signed(wire88) ?
              (8'h9f) : ((8'ha9) ?
                  (reg143 ? reg111 : reg141) : (reg96 | wire116)))) ?
          $signed((~&$unsigned((reg121 & wire86)))) : (-$unsigned({$signed(reg123),
              wire85})));
    end
  assign wire156 = $unsigned(((^~(+reg135)) ?
                       $signed({reg149[(3'h4):(1'h0)]}) : reg91));
  always
    @(posedge clk) begin
      if (((reg90[(3'h7):(3'h7)] <<< $unsigned(({reg92} > reg105))) <<< (^~$unsigned(wire87[(3'h5):(1'h1)]))))
        begin
          reg157 <= $signed((reg135 ?
              $signed($unsigned((reg147 < (8'h9f)))) : wire85[(4'h8):(3'h5)]));
        end
      else
        begin
          reg157 <= $signed($signed({reg153}));
          reg158 <= ($unsigned(({{reg152, wire85}} ?
                  $signed((8'h9c)) : reg105)) ?
              reg96 : $unsigned(reg110));
        end
    end
  always
    @(posedge clk) begin
      reg159 <= ($signed(reg130[(3'h4):(2'h3)]) && $signed(((reg92[(1'h0):(1'h0)] ?
              (wire108 && reg94) : (~&(8'hab))) ?
          wire118[(4'hf):(3'h7)] : ($unsigned((7'h44)) ?
              wire84 : $unsigned(reg90)))));
    end
endmodule

module module48
#(parameter param77 = ((~&{({(8'hbd)} <<< {(8'ha1)})}) == (((8'h9e) != (8'hb9)) >= ({((8'had) >>> (8'hbd)), ((8'ha9) << (8'hbc))} ? {((8'hbd) ? (8'hbe) : (8'ha5)), (!(8'hba))} : (((8'h9f) ? (8'hb7) : (8'hb5)) ? (&(8'hb9)) : (8'hbc))))))
(y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire53;
  input wire signed [(4'hd):(1'h0)] wire52;
  input wire [(4'hf):(1'h0)] wire51;
  input wire [(5'h14):(1'h0)] wire50;
  input wire signed [(4'hb):(1'h0)] wire49;
  wire signed [(5'h14):(1'h0)] wire60;
  wire [(5'h13):(1'h0)] wire59;
  wire signed [(5'h15):(1'h0)] wire58;
  wire signed [(5'h15):(1'h0)] wire57;
  wire [(2'h3):(1'h0)] wire55;
  wire [(2'h2):(1'h0)] wire54;
  reg signed [(5'h15):(1'h0)] reg76 = (1'h0);
  reg [(2'h3):(1'h0)] reg75 = (1'h0);
  reg [(4'hf):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg71 = (1'h0);
  reg [(4'hd):(1'h0)] reg70 = (1'h0);
  reg [(4'hb):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg65 = (1'h0);
  reg [(5'h10):(1'h0)] reg64 = (1'h0);
  reg [(3'h6):(1'h0)] reg63 = (1'h0);
  reg [(3'h5):(1'h0)] reg62 = (1'h0);
  reg [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg56 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire55,
                 wire54,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg56,
                 (1'h0)};
  assign wire54 = ($signed($unsigned((wire49 ?
                      (~|wire53) : ((8'hbd) ?
                          wire53 : wire49)))) >>> (wire51[(4'ha):(3'h6)] ?
                      wire52 : ($unsigned(wire49) ?
                          (wire49[(3'h4):(2'h2)] ?
                              wire52[(3'h5):(1'h0)] : wire50[(5'h11):(4'h8)]) : ((wire49 ?
                                  wire51 : wire51) ?
                              wire51[(4'ha):(3'h6)] : $unsigned(wire49)))));
  assign wire55 = ($signed(wire50) ?
                      ((7'h41) - (wire49 ?
                          {$signed((8'hb0)),
                              {wire54}} : (8'hbf))) : $unsigned((^(+$unsigned(wire52)))));
  always
    @(posedge clk) begin
      reg56 <= wire51[(4'h8):(2'h3)];
    end
  assign wire57 = (($unsigned(wire55) ?
                          ({(wire51 ?
                                  wire51 : wire50)} || wire53[(4'he):(2'h2)]) : wire52) ?
                      wire55 : (reg56[(3'h5):(2'h2)] ?
                          (((wire51 < wire55) ?
                              (&(8'hb5)) : {wire49}) ~^ wire53) : (-reg56)));
  assign wire58 = {$signed(((!$unsigned(wire53)) ?
                          wire50[(1'h0):(1'h0)] : reg56))};
  assign wire59 = (((~^(8'ha2)) ?
                      {($signed(wire52) >> $unsigned(wire51)),
                          wire51} : {(wire53[(3'h7):(1'h0)] ?
                              {wire55, (8'h9d)} : (wire58 ? wire55 : wire49)),
                          wire53}) + wire55[(2'h2):(1'h1)]);
  assign wire60 = (wire50 ?
                      (+{wire49,
                          wire54[(1'h1):(1'h1)]}) : ((8'h9e) < wire51[(4'hb):(1'h0)]));
  always
    @(posedge clk) begin
      reg61 <= ((~&($signed($unsigned(wire54)) ?
              ($signed((8'ha8)) ?
                  (+wire52) : $unsigned(wire52)) : (wire57 + wire49))) ?
          wire54 : (wire49 ? wire59 : (wire53 < $signed($signed(wire54)))));
    end
  always
    @(posedge clk) begin
      if ((!(~|(wire54[(1'h1):(1'h1)] ?
          ({wire49, wire60} || $unsigned(wire57)) : {wire51,
              (wire53 <<< wire51)}))))
        begin
          reg62 <= wire59;
          reg63 <= wire54[(1'h1):(1'h1)];
          if ({(^($unsigned((reg63 ? (8'ha3) : wire50)) <<< (wire54 == (wire51 ?
                  (8'hac) : wire49)))),
              $unsigned($unsigned({reg56[(1'h0):(1'h0)], wire58}))})
            begin
              reg64 <= (~wire53);
              reg65 <= ({(^~$unsigned((reg61 > wire51)))} <<< $unsigned((wire52 & (~$signed(reg56)))));
            end
          else
            begin
              reg64 <= (wire55 == $unsigned(wire57));
              reg65 <= reg61;
              reg66 <= ($unsigned({({reg63} ^ (7'h43)),
                  {(reg63 || (8'ha0)),
                      (reg64 * reg65)}}) ^~ (+$signed(reg56[(4'ha):(3'h4)])));
              reg67 <= reg61[(4'he):(2'h3)];
              reg68 <= $signed($unsigned(reg66[(4'ha):(2'h2)]));
            end
        end
      else
        begin
          if (wire54)
            begin
              reg62 <= (~|(!(~|((wire53 | reg67) ?
                  wire58[(1'h1):(1'h0)] : wire54))));
            end
          else
            begin
              reg62 <= $signed(((~|($signed(wire57) ?
                  $signed((8'h9d)) : (wire60 ?
                      (7'h42) : wire54))) & wire58[(1'h0):(1'h0)]));
              reg63 <= (reg66[(1'h0):(1'h0)] ?
                  (8'ha8) : ($unsigned($signed((-reg56))) >= $signed(wire52)));
              reg64 <= (!$signed($signed($unsigned((|reg63)))));
              reg65 <= {(&(wire58 <= wire55[(1'h0):(1'h0)])),
                  ($unsigned(wire58[(4'ha):(3'h4)]) ?
                      wire59[(4'he):(4'he)] : $unsigned($unsigned((wire52 + reg63))))};
            end
        end
      if ((~$signed(((8'haa) <<< reg62[(1'h1):(1'h0)]))))
        begin
          reg69 <= (($unsigned((~^(wire55 <= reg65))) ?
              ((reg67 ? (reg56 == (8'ha7)) : wire60) ^~ ((reg65 ?
                  reg66 : reg65) <= ((8'ha4) ?
                  wire59 : wire54))) : (&$unsigned(wire59))) ^~ ($signed(reg68[(1'h0):(1'h0)]) ?
              wire60[(5'h12):(4'he)] : $signed((((8'hbb) ?
                  (7'h42) : (8'hbd)) || (!(8'hb3))))));
          reg70 <= $signed(reg65[(1'h1):(1'h1)]);
          if (({$signed($unsigned($unsigned(reg63)))} != reg63))
            begin
              reg71 <= $signed(($unsigned((reg69 & ((8'ha5) >= reg67))) ?
                  reg64 : reg67[(3'h4):(1'h1)]));
              reg72 <= $unsigned((&(|wire59[(4'hb):(4'ha)])));
              reg73 <= $signed($unsigned(({$unsigned((8'ha5)),
                      (wire53 != wire57)} ?
                  $unsigned(wire54[(1'h1):(1'h0)]) : reg67)));
              reg74 <= $unsigned((reg67 ?
                  (8'had) : $unsigned($signed((reg56 ? wire54 : reg64)))));
              reg75 <= wire57;
            end
          else
            begin
              reg71 <= (reg66 + reg70[(3'h7):(2'h2)]);
              reg72 <= (^~(~&(((^~wire58) ?
                      (reg70 ? wire51 : (8'hba)) : wire53) ?
                  reg61 : (!(wire51 < (8'hb3))))));
              reg73 <= $signed({reg72});
            end
          reg76 <= $signed(({($unsigned((8'hbe)) ?
                  (~reg65) : wire55[(1'h1):(1'h0)]),
              $signed((wire51 * wire54))} ^~ $signed((&wire51))));
        end
      else
        begin
          reg69 <= $unsigned(($unsigned(wire50) > ((~|$signed(reg61)) > $signed(reg72))));
        end
    end
endmodule
