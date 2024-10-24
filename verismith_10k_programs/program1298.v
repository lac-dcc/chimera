module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire147;
  wire signed [(2'h3):(1'h0)] wire146;
  wire signed [(4'hd):(1'h0)] wire144;
  wire [(5'h11):(1'h0)] wire5;
  assign y = {wire147, wire146, wire144, wire5, (1'h0)};
  assign wire5 = {($unsigned(wire4[(4'hd):(1'h0)]) ? wire0 : wire1),
                     ((^wire3[(3'h4):(1'h1)]) ?
                         (wire0[(3'h7):(3'h6)] ?
                             $signed((wire3 || wire0)) : {(wire0 ?
                                     wire3 : wire0)}) : wire3[(3'h5):(1'h1)])};
  module6 #() modinst145 (.wire7(wire3), .wire9(wire4), .wire10(wire5), .y(wire144), .wire8(wire0), .clk(clk));
  assign wire146 = $signed(wire0);
  assign wire147 = ($signed((wire5 * $signed($unsigned(wire4)))) ?
                       (|wire146[(2'h3):(2'h3)]) : wire144);
endmodule

module module6
#(parameter param142 = ((((|((8'h9d) <= (8'ha7))) ? (~^(&(8'hae))) : (((7'h40) ? (8'haf) : (8'hb1)) * (-(7'h40)))) < {{((8'hb8) ? (8'hb0) : (8'hbe))}, (((8'hae) ^ (8'hbd)) ? ((8'ha4) ? (8'ha6) : (8'hb4)) : ((8'ha8) ? (8'ha8) : (8'haa)))}) ? ((|(|((8'hb6) > (8'hbe)))) ? (~^(8'hb5)) : ({((8'haa) - (7'h41))} || (((8'hba) ? (8'h9f) : (8'hb4)) ? ((8'ha9) ? (8'hb3) : (8'ha9)) : {(8'h9d)}))) : (((|(~^(8'hbe))) ? ((~(8'ha9)) || (+(8'hac))) : (((8'hae) >> (8'hb5)) ~^ (-(8'ha6)))) >= {{((7'h43) ? (8'hbd) : (8'ha0)), ((8'hba) >= (8'h9e))}, (((7'h41) | (8'hb7)) | ((8'hba) ? (8'had) : (8'hba)))})), 
parameter param143 = (-(param142 ? (param142 <= {(~^(8'ha2)), (~|param142)}) : (param142 >= (param142 ^~ {param142})))))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h1a1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire10;
  input wire signed [(5'h11):(1'h0)] wire9;
  input wire [(4'h8):(1'h0)] wire8;
  input wire [(5'h11):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire141;
  wire signed [(5'h11):(1'h0)] wire140;
  wire signed [(4'hf):(1'h0)] wire139;
  wire [(5'h12):(1'h0)] wire138;
  wire signed [(4'he):(1'h0)] wire137;
  wire signed [(4'hf):(1'h0)] wire46;
  wire signed [(5'h14):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire12;
  wire signed [(5'h12):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire48;
  wire signed [(4'hc):(1'h0)] wire49;
  wire signed [(4'hf):(1'h0)] wire82;
  wire signed [(4'h9):(1'h0)] wire84;
  wire [(5'h12):(1'h0)] wire85;
  wire [(4'ha):(1'h0)] wire86;
  wire [(2'h3):(1'h0)] wire87;
  wire [(5'h11):(1'h0)] wire88;
  wire signed [(4'hf):(1'h0)] wire89;
  wire signed [(3'h4):(1'h0)] wire90;
  wire signed [(3'h6):(1'h0)] wire91;
  wire [(5'h13):(1'h0)] wire135;
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  assign y = {wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire46,
                 wire22,
                 wire12,
                 wire11,
                 wire48,
                 wire49,
                 wire82,
                 wire84,
                 wire85,
                 wire86,
                 wire87,
                 wire88,
                 wire89,
                 wire90,
                 wire91,
                 wire135,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 (1'h0)};
  assign wire11 = (8'hb2);
  assign wire12 = $signed({{wire10[(1'h0):(1'h0)]}, wire10});
  always
    @(posedge clk) begin
      if ((wire7 | $unsigned(((wire9[(2'h2):(2'h2)] ?
              {wire10, (8'ha5)} : $unsigned(wire7)) ?
          wire12 : (!{(8'hb2), wire9})))))
        begin
          if (((|{$signed($unsigned((8'h9c))),
              $signed({wire8, wire9})}) ^ {(($signed(wire10) ?
                  $unsigned(wire9) : wire12) | wire11[(5'h11):(4'hd)])}))
            begin
              reg13 <= $signed((wire10[(1'h1):(1'h1)] && $unsigned(((wire8 - (8'hb2)) && (wire8 ?
                  wire9 : wire11)))));
              reg14 <= ((8'ha7) << ({($signed(wire8) ?
                      $unsigned(wire7) : wire7[(3'h5):(3'h5)])} >>> {($unsigned(wire8) ?
                      $unsigned(wire10) : (wire9 >= wire9)),
                  wire10[(2'h2):(1'h0)]}));
              reg15 <= (wire12 ~^ wire12[(3'h7):(3'h7)]);
              reg16 <= $signed($signed((reg14 == wire7)));
              reg17 <= $signed($signed((($signed(wire12) ?
                  {reg15, reg13} : $signed(wire12)) & (7'h40))));
            end
          else
            begin
              reg13 <= ((($unsigned(wire7[(2'h2):(1'h1)]) & $signed((wire11 ?
                      wire8 : reg16))) ?
                  {$signed($signed(reg14))} : wire8) == {($unsigned({reg17}) ?
                      (+$unsigned(reg14)) : wire10),
                  wire9[(4'hd):(1'h1)]});
              reg14 <= $signed(wire9);
            end
          reg18 <= $signed(wire7[(1'h0):(1'h0)]);
          reg19 <= $signed((reg13[(4'hb):(3'h6)] | reg16));
          reg20 <= ({reg15, (8'hb9)} ?
              reg15 : {(((^~wire11) ? reg15 : $unsigned(reg17)) <<< ((reg19 ?
                          (8'hb7) : reg14) ?
                      (reg18 ? wire8 : (8'ha1)) : (reg17 ? wire9 : wire11))),
                  (^$signed(wire11))});
        end
      else
        begin
          reg13 <= $signed(wire11);
          reg14 <= $unsigned($signed($signed((|wire7[(3'h4):(1'h1)]))));
          reg15 <= (&($unsigned(reg19) ?
              (-{(reg20 ? reg19 : reg18),
                  wire9[(4'hf):(4'h8)]}) : $unsigned(($signed(wire10) == (reg14 ^~ reg18)))));
          if (($signed((reg17 | reg19)) ?
              (reg18[(1'h0):(1'h0)] ?
                  {$signed({reg17, reg16}),
                      reg20[(2'h3):(2'h2)]} : $signed((~|reg19[(3'h7):(3'h6)]))) : (wire11 ~^ $unsigned(($unsigned(reg18) >= reg14[(3'h7):(2'h3)])))))
            begin
              reg16 <= reg14[(3'h5):(1'h1)];
              reg17 <= {(((&reg16) ?
                          wire7[(4'hb):(4'ha)] : (~|(reg13 ?
                              reg15 : (8'hb1)))) ?
                      {$signed($unsigned((8'hbe))),
                          (8'ha8)} : {$signed($unsigned((8'h9f))),
                          $unsigned((reg15 ? (8'ha2) : (8'had)))}),
                  reg17};
            end
          else
            begin
              reg16 <= (|$unsigned(((~|wire10) ?
                  $unsigned((+reg17)) : (|(reg19 + (7'h42))))));
              reg17 <= $unsigned(wire9[(4'h9):(2'h3)]);
              reg18 <= $unsigned(($unsigned(($unsigned(reg14) * (wire10 ?
                      reg18 : reg18))) ?
                  $unsigned($signed($unsigned((8'hbb)))) : reg17));
            end
        end
      reg21 <= ((&((!(8'ha2)) ?
          (^~(wire12 ? reg15 : wire9)) : {(reg19 ?
                  reg17 : wire9)})) > {reg13[(2'h2):(2'h2)]});
    end
  assign wire22 = ((($signed($signed(wire7)) ?
                              wire9 : (((8'hba) & reg18) ?
                                  ((8'hbc) >= (8'hb7)) : (wire8 || reg14))) ?
                          reg17[(4'h8):(3'h7)] : (reg14 & reg14)) ?
                      $unsigned($signed(reg16[(3'h6):(2'h3)])) : (wire9 != wire9));
  module23 #() modinst47 (wire46, clk, reg18, reg15, reg21, wire7);
  assign wire48 = wire22[(3'h6):(2'h2)];
  assign wire49 = $signed($unsigned($unsigned(reg14[(4'h8):(2'h2)])));
  module50 #() modinst83 (wire82, clk, wire12, wire48, wire22, reg21, wire10);
  assign wire84 = ((reg21 ? $unsigned((-$unsigned(wire9))) : reg21) - (8'h9d));
  assign wire85 = (({(((8'hb8) ? (8'hbb) : wire8) ?
                              reg16 : (~wire8))} >= (^reg17[(3'h5):(1'h0)])) ?
                      $signed(($signed($unsigned(reg15)) ?
                          wire82[(4'hc):(4'hc)] : wire8[(4'h8):(3'h7)])) : ((|(~(~^wire46))) | ((|(8'ha0)) ?
                          reg19[(4'h8):(1'h0)] : reg16)));
  assign wire86 = (&$signed({((~reg16) > $unsigned(reg16)),
                      reg15[(4'h8):(4'h8)]}));
  assign wire87 = (8'ha9);
  assign wire88 = ($unsigned($unsigned(wire48)) ?
                      ($unsigned($signed($signed(wire86))) - ($unsigned($signed((8'hb4))) * $unsigned($signed(wire48)))) : (wire10[(1'h0):(1'h0)] ?
                          {$signed((wire84 != (8'ha3))),
                              ($signed(reg14) ^ $signed(reg15))} : wire22[(3'h5):(2'h2)]));
  assign wire89 = reg16;
  assign wire90 = wire49[(4'hb):(1'h0)];
  assign wire91 = $unsigned((wire84 >>> (~$signed((-wire84)))));
  module92 #() modinst136 (.wire96(wire10), .wire93(wire12), .wire94(wire88), .y(wire135), .clk(clk), .wire95(reg20));
  assign wire137 = (~$unsigned($signed($signed(wire86[(1'h0):(1'h0)]))));
  assign wire138 = (wire91 ?
                       (~(wire137[(4'hc):(3'h7)] ?
                           reg17 : ($signed(wire8) >> $signed(wire10)))) : (~^$unsigned(wire137)));
  assign wire139 = $unsigned(($unsigned((reg15 ^~ wire88[(2'h2):(1'h0)])) + {((wire12 ?
                               (8'hb1) : wire49) ?
                           (wire87 ~^ wire46) : (wire11 ^ (8'ha3))),
                       ($unsigned(wire138) * (wire10 ? reg21 : wire86))}));
  assign wire140 = reg17[(3'h5):(1'h1)];
  assign wire141 = ({wire10} ?
                       {$unsigned(((wire11 - wire22) ?
                               (!wire8) : $unsigned(reg17))),
                           $unsigned($unsigned((wire87 ?
                               wire49 : wire48)))} : $signed((wire48 ?
                           (wire135 ?
                               {reg19,
                                   wire86} : $unsigned(wire7)) : ((^wire22) ?
                               (wire48 ?
                                   wire89 : wire90) : $signed((7'h41))))));
endmodule

module module92  (y, clk, wire96, wire95, wire94, wire93);
  output wire [(32'h1ca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire96;
  input wire signed [(4'hd):(1'h0)] wire95;
  input wire [(5'h11):(1'h0)] wire94;
  input wire [(3'h6):(1'h0)] wire93;
  wire [(5'h14):(1'h0)] wire133;
  wire [(5'h15):(1'h0)] wire132;
  wire [(5'h13):(1'h0)] wire113;
  wire signed [(4'hc):(1'h0)] wire112;
  wire [(5'h15):(1'h0)] wire111;
  wire signed [(5'h10):(1'h0)] wire98;
  wire signed [(4'h8):(1'h0)] wire97;
  reg [(5'h13):(1'h0)] reg134 = (1'h0);
  reg [(2'h2):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg128 = (1'h0);
  reg [(3'h5):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg126 = (1'h0);
  reg [(5'h14):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg123 = (1'h0);
  reg [(4'he):(1'h0)] reg122 = (1'h0);
  reg [(4'hb):(1'h0)] reg121 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg120 = (1'h0);
  reg [(5'h12):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg118 = (1'h0);
  reg [(3'h6):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg116 = (1'h0);
  reg [(4'hb):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg114 = (1'h0);
  reg [(3'h7):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg109 = (1'h0);
  reg [(5'h13):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg107 = (1'h0);
  reg [(3'h4):(1'h0)] reg106 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg105 = (1'h0);
  reg [(3'h7):(1'h0)] reg104 = (1'h0);
  reg [(5'h13):(1'h0)] reg103 = (1'h0);
  reg signed [(4'he):(1'h0)] reg102 = (1'h0);
  reg [(4'hd):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg100 = (1'h0);
  reg [(4'h9):(1'h0)] reg99 = (1'h0);
  assign y = {wire133,
                 wire132,
                 wire113,
                 wire112,
                 wire111,
                 wire98,
                 wire97,
                 reg134,
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
                 reg116,
                 reg115,
                 reg114,
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
                 (1'h0)};
  assign wire97 = wire94;
  assign wire98 = wire96;
  always
    @(posedge clk) begin
      reg99 <= (|$signed(($unsigned(((8'hb4) * wire96)) ?
          $signed($unsigned(wire94)) : wire98)));
      if (wire97)
        begin
          reg100 <= (7'h43);
        end
      else
        begin
          reg100 <= $unsigned(wire96);
          reg101 <= $unsigned($signed(wire95));
          reg102 <= $unsigned(({$signed((~^wire93))} >> (~(wire93[(2'h3):(1'h1)] ?
              reg101[(1'h1):(1'h0)] : (reg99 ? (8'h9e) : wire95)))));
          reg103 <= {{((~^$unsigned(reg101)) > (wire97[(3'h4):(1'h1)] << $unsigned(reg102))),
                  wire98},
              (~|(-(+(reg102 || reg101))))};
        end
      if ((&$signed(wire95)))
        begin
          reg104 <= $unsigned($unsigned(wire97));
          if ((!(~^$signed($unsigned((-wire96))))))
            begin
              reg105 <= reg100[(5'h13):(3'h7)];
              reg106 <= $signed((($unsigned($unsigned(reg100)) ?
                  ($unsigned(reg99) ^ reg101) : (wire97[(4'h8):(1'h0)] ?
                      (reg105 ?
                          reg100 : wire95) : $unsigned((8'h9f)))) || ((((7'h40) ?
                          reg104 : reg105) ?
                      $unsigned(reg104) : (&wire96)) ?
                  ($unsigned(wire97) >= (^~(8'hbe))) : $unsigned((reg101 && wire96)))));
              reg107 <= reg100[(4'ha):(4'h9)];
              reg108 <= {reg107};
            end
          else
            begin
              reg105 <= reg108;
              reg106 <= {(reg104[(3'h7):(3'h6)] != $unsigned((~&(+reg99))))};
              reg107 <= ({(((wire94 - reg108) ?
                          (|reg107) : (reg100 - wire98)) + {(~|wire94),
                          $signed((8'ha2))}),
                      $unsigned($unsigned((~reg106)))} ?
                  reg101[(1'h0):(1'h0)] : ((((~^wire94) ?
                      reg106[(1'h1):(1'h1)] : (reg104 ?
                          reg102 : (8'hb9))) > (^~$signed(reg107))) ^ (|$signed((~&(8'h9c))))));
            end
          reg109 <= $signed((wire93[(3'h5):(1'h0)] ?
              $signed(reg103) : ($signed((reg102 >> wire93)) ?
                  (((8'hb8) ?
                      wire93 : wire98) ~^ $unsigned(wire97)) : reg102)));
          reg110 <= (~^{$signed(($unsigned(reg108) ^ (~|wire98))), wire95});
        end
      else
        begin
          reg104 <= reg101[(4'hd):(4'hb)];
        end
    end
  assign wire111 = $signed((!reg109));
  assign wire112 = {$unsigned($signed($unsigned($signed(reg108))))};
  assign wire113 = $unsigned((~&$unsigned(reg104)));
  always
    @(posedge clk) begin
      if (reg100[(5'h11):(3'h5)])
        begin
          reg114 <= (|$unsigned($signed((reg99 ? $signed(reg110) : wire112))));
        end
      else
        begin
          if ((^((8'hb5) ?
              $unsigned(reg105[(3'h5):(2'h3)]) : (wire112 ?
                  reg107 : $unsigned((wire111 ? reg109 : reg100))))))
            begin
              reg114 <= (((~wire95) ~^ (($signed((7'h44)) || (reg101 ?
                      reg107 : wire98)) ?
                  reg108[(4'he):(4'ha)] : (&$unsigned((7'h42))))) > (~^reg99));
              reg115 <= reg106;
              reg116 <= {($signed($signed(reg100[(4'hb):(2'h3)])) < $unsigned(((reg110 ~^ reg99) ?
                      $unsigned((8'ha9)) : wire111[(5'h13):(4'ha)])))};
              reg117 <= {{(^(reg114[(3'h5):(2'h3)] * reg109))}};
            end
          else
            begin
              reg114 <= (7'h44);
              reg115 <= {(~|$unsigned(reg102[(3'h5):(1'h0)]))};
              reg116 <= reg101;
              reg117 <= ((wire93[(2'h3):(2'h2)] ?
                      ((~|(reg105 ? (8'hb7) : reg117)) ?
                          (wire97[(3'h7):(2'h3)] ?
                              (wire112 <= wire113) : $signed(wire95)) : (8'hb5)) : $signed(wire111[(4'hb):(3'h7)])) ?
                  reg102 : (+($signed((reg99 ? wire96 : reg108)) ?
                      $unsigned(reg108) : (7'h42))));
              reg118 <= $unsigned(wire111[(5'h12):(4'hf)]);
            end
          if ($unsigned({wire112[(3'h5):(3'h4)], reg117}))
            begin
              reg119 <= $unsigned(((~($signed(reg104) > {wire97,
                  reg115})) || wire111[(4'ha):(3'h4)]));
              reg120 <= $unsigned($signed(reg106));
              reg121 <= reg120;
              reg122 <= ((8'haf) <= ((((reg114 ? reg107 : reg102) ^~ (wire94 ?
                  reg101 : reg109)) || (~&(reg115 <= (8'hac)))) < {{{reg120},
                      (reg106 >= reg104)}}));
            end
          else
            begin
              reg119 <= $unsigned((wire111[(1'h0):(1'h0)] ?
                  (8'hab) : reg114[(2'h3):(2'h3)]));
              reg120 <= {(~^(8'h9e))};
              reg121 <= $signed($signed(($unsigned((wire97 ?
                      (8'hbb) : (7'h43))) ?
                  $signed($signed(reg120)) : reg119)));
              reg122 <= ({(-$signed($unsigned(reg106)))} ?
                  $signed($signed({(reg99 > wire93)})) : $unsigned((~|$signed({reg108}))));
            end
          reg123 <= $signed((($unsigned($unsigned(reg117)) >>> $signed($signed(wire111))) | $signed(reg99)));
        end
      reg124 <= $unsigned(reg99[(3'h5):(3'h5)]);
      if (reg99[(1'h1):(1'h1)])
        begin
          reg125 <= wire93;
          reg126 <= (~|$unsigned($signed($unsigned((reg121 ?
              reg114 : reg124)))));
          reg127 <= reg110[(3'h4):(3'h4)];
          reg128 <= reg103;
          reg129 <= ($signed(reg117[(3'h4):(1'h1)]) ?
              (!($signed((wire94 ? reg109 : reg115)) <= (reg102 >>> (reg119 ?
                  reg100 : (8'hbe))))) : (reg119 ~^ reg114));
        end
      else
        begin
          reg125 <= $signed($signed($signed(reg121[(3'h7):(2'h3)])));
          reg126 <= ($signed((|({reg114} ?
                  (reg102 ^ reg124) : (reg122 ? reg125 : reg102)))) ?
              $signed(reg118[(3'h4):(1'h1)]) : reg126);
        end
      reg130 <= {reg128};
      reg131 <= reg124[(3'h4):(1'h1)];
    end
  assign wire132 = (~^{$signed($signed(reg119[(4'hf):(3'h5)]))});
  assign wire133 = (wire95[(1'h0):(1'h0)] == $signed((-reg109)));
  always
    @(posedge clk) begin
      reg134 <= ((($unsigned((reg103 || reg128)) << reg107[(1'h1):(1'h1)]) & reg122) ?
          (^~(&{wire97[(1'h0):(1'h0)],
              (reg110 && reg121)})) : ({((reg102 < (8'ha4)) ?
                      reg119[(4'h8):(1'h1)] : $signed(wire112))} ?
              $unsigned(reg99[(1'h0):(1'h0)]) : $unsigned((+$unsigned(wire98)))));
    end
endmodule

module module50  (y, clk, wire55, wire54, wire53, wire52, wire51);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire55;
  input wire [(4'hb):(1'h0)] wire54;
  input wire [(5'h14):(1'h0)] wire53;
  input wire [(2'h2):(1'h0)] wire52;
  input wire signed [(5'h11):(1'h0)] wire51;
  wire [(5'h12):(1'h0)] wire81;
  wire signed [(2'h2):(1'h0)] wire80;
  wire signed [(4'he):(1'h0)] wire79;
  wire [(5'h14):(1'h0)] wire78;
  wire signed [(4'h9):(1'h0)] wire77;
  wire [(5'h13):(1'h0)] wire76;
  wire signed [(3'h5):(1'h0)] wire75;
  wire [(4'h9):(1'h0)] wire74;
  wire [(5'h10):(1'h0)] wire73;
  wire signed [(5'h14):(1'h0)] wire58;
  wire [(2'h3):(1'h0)] wire57;
  wire [(5'h12):(1'h0)] wire56;
  reg signed [(2'h2):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg71 = (1'h0);
  reg [(5'h11):(1'h0)] reg70 = (1'h0);
  reg [(4'hc):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg67 = (1'h0);
  reg [(4'hf):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg59 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire58,
                 wire57,
                 wire56,
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
                 reg60,
                 reg59,
                 (1'h0)};
  assign wire56 = (!$signed($signed($signed($unsigned(wire51)))));
  assign wire57 = (7'h44);
  assign wire58 = wire57[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg59 <= $signed($signed($unsigned($signed(wire51))));
      if ((((wire56[(3'h4):(2'h2)] == (~|(7'h40))) < (&({wire53, (8'ha8)} ?
          (wire58 ?
              wire55 : wire57) : $unsigned(wire58)))) >> $signed($unsigned(wire56[(4'he):(4'hc)]))))
        begin
          reg60 <= (wire52[(2'h2):(1'h0)] ?
              {($signed({wire57}) > wire56)} : (|(wire56[(1'h1):(1'h1)] ?
                  wire58 : (|wire53[(4'hb):(4'h8)]))));
          reg61 <= wire58;
          reg62 <= ((~^wire57[(2'h2):(1'h0)]) * (wire55[(3'h6):(3'h5)] > $signed(((7'h40) ?
              $signed(wire51) : ((8'hb6) >= reg59)))));
        end
      else
        begin
          reg60 <= $unsigned($unsigned((((!(8'hb6)) >= $signed(reg62)) | reg61)));
          if ($unsigned($unsigned($unsigned($unsigned((~^wire58))))))
            begin
              reg61 <= (($unsigned({{reg59}}) & $unsigned($unsigned((wire58 ?
                  wire58 : wire57)))) >= $unsigned(reg62[(4'ha):(3'h7)]));
            end
          else
            begin
              reg61 <= $signed(wire51[(4'hc):(4'hb)]);
            end
        end
      if ((wire53[(4'h8):(1'h1)] ?
          $signed(wire58[(4'hc):(4'ha)]) : ($unsigned(wire57) ?
              (wire52 < $signed($unsigned(reg59))) : reg61[(1'h1):(1'h0)])))
        begin
          reg63 <= {$unsigned($signed(wire58[(4'he):(4'hc)]))};
          reg64 <= wire57;
        end
      else
        begin
          reg63 <= (~&reg62);
          if ($unsigned({(-((^~(8'ha0)) ^~ wire58[(2'h2):(2'h2)]))}))
            begin
              reg64 <= ((((~&(~^reg63)) ?
                  $signed($unsigned((8'hb2))) : $unsigned(reg61)) == wire51) * $unsigned($unsigned(({(8'hae)} ?
                  (wire55 > (8'hb2)) : (&wire53)))));
              reg65 <= reg61;
              reg66 <= wire57;
              reg67 <= (|{$signed(((wire54 ^ wire57) ~^ {wire58})),
                  (reg64 ?
                      ($unsigned((8'ha5)) || reg64) : ($unsigned(reg66) ?
                          reg62 : $unsigned(wire54)))});
              reg68 <= reg64;
            end
          else
            begin
              reg64 <= (!({((8'hba) ? (~|reg63) : reg60[(3'h5):(2'h2)])} ?
                  (^~reg65[(5'h13):(4'hb)]) : (^~(~|reg62))));
            end
          reg69 <= $unsigned(reg59);
          reg70 <= $unsigned($unsigned(reg68[(1'h1):(1'h1)]));
          reg71 <= reg64;
        end
      reg72 <= reg64[(4'ha):(2'h2)];
    end
  assign wire73 = reg64;
  assign wire74 = reg62;
  assign wire75 = reg65;
  assign wire76 = $unsigned($unsigned((((reg65 ^~ wire75) ?
                          {wire53} : reg70[(1'h0):(1'h0)]) ?
                      ((reg67 ^ reg59) ?
                          (wire51 <<< reg68) : reg60[(1'h0):(1'h0)]) : wire56)));
  assign wire77 = (8'ha3);
  assign wire78 = reg68[(1'h1):(1'h1)];
  assign wire79 = (!wire74[(3'h5):(2'h2)]);
  assign wire80 = reg65[(4'hc):(1'h1)];
  assign wire81 = $unsigned({(((wire80 >= reg65) <<< (reg67 ?
                          wire74 : (8'haf))) | ((wire53 ^~ reg71) ?
                          {reg67, reg59} : (~wire55))),
                      reg72[(1'h0):(1'h0)]});
endmodule

module module23  (y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'hb5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire27;
  input wire signed [(4'hc):(1'h0)] wire26;
  input wire signed [(5'h11):(1'h0)] wire25;
  input wire [(5'h11):(1'h0)] wire24;
  wire signed [(4'he):(1'h0)] wire35;
  wire signed [(3'h7):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire33;
  wire signed [(4'hc):(1'h0)] wire32;
  wire signed [(3'h6):(1'h0)] wire31;
  wire [(3'h5):(1'h0)] wire30;
  wire [(4'he):(1'h0)] wire29;
  wire signed [(5'h11):(1'h0)] wire28;
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg [(3'h4):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
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
  assign wire28 = ($signed($signed(wire27)) ? $signed(wire25) : wire26);
  assign wire29 = (~&wire26[(3'h4):(1'h0)]);
  assign wire30 = $signed((~^$unsigned((|(wire24 ? (8'hbc) : wire27)))));
  assign wire31 = ({wire27} <<< wire25);
  assign wire32 = wire28;
  assign wire33 = $signed((~|((-wire31) - wire29)));
  assign wire34 = (wire32[(3'h6):(2'h2)] + wire33);
  assign wire35 = (wire29[(4'hb):(4'h8)] ?
                      $signed($unsigned((|(wire26 ?
                          wire30 : wire30)))) : (~|(wire29 == {wire24})));
  always
    @(posedge clk) begin
      reg36 <= (+((wire31[(2'h3):(1'h1)] ?
          wire32 : wire35[(3'h5):(3'h5)]) - $unsigned((~|(wire24 ^ wire27)))));
      if (($signed((wire29[(4'he):(2'h2)] || (~|(wire28 ?
          wire30 : wire30)))) > (^~$unsigned(wire34[(2'h3):(2'h2)]))))
        begin
          reg37 <= reg36;
        end
      else
        begin
          reg37 <= (wire25[(2'h3):(1'h0)] ?
              $unsigned($signed(wire32)) : wire29[(2'h3):(2'h2)]);
          reg38 <= (8'hb6);
          reg39 <= reg37[(2'h3):(1'h1)];
          reg40 <= wire30[(3'h4):(3'h4)];
          reg41 <= ($signed((^~wire32)) ?
              $signed($unsigned($unsigned(wire31))) : $unsigned({{(reg39 ?
                          reg37 : reg36)}}));
        end
      reg42 <= reg41[(1'h1):(1'h1)];
      if (((~&((reg42[(3'h4):(2'h2)] ?
              (-wire27) : $signed(wire32)) * $signed($signed((8'ha2))))) ?
          reg40[(4'h8):(4'h8)] : (~|$unsigned($signed($signed((8'ha4)))))))
        begin
          if ($unsigned(wire35[(1'h1):(1'h1)]))
            begin
              reg43 <= {wire29, wire32[(3'h6):(3'h4)]};
              reg44 <= reg37;
            end
          else
            begin
              reg43 <= (8'haf);
            end
        end
      else
        begin
          reg43 <= $signed((^$unsigned({$unsigned(reg39)})));
          reg44 <= $signed(wire31[(2'h2):(2'h2)]);
        end
      reg45 <= ({$signed(wire29), (8'hbf)} ?
          $signed((&wire34)) : ($unsigned((+$signed(wire25))) ?
              wire24[(4'ha):(1'h0)] : $unsigned(wire26)));
    end
endmodule
