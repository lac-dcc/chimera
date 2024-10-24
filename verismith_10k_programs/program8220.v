module top
#(parameter param149 = ((~|((7'h43) | ((~(8'ha3)) ? ((8'hb9) <<< (7'h42)) : ((8'hb8) - (8'hba))))) ? (((+(~(8'hbc))) + (7'h40)) ? {(((8'ha0) != (8'hb0)) - ((8'hbe) ? (8'hb8) : (8'hbf))), (~&{(8'hbe)})} : (~&(8'h9f))) : {((|(8'hbe)) ^ ((8'h9d) ? (~^(8'ha7)) : ((8'hb7) ? (8'ha5) : (7'h42))))}), 
parameter param150 = param149)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire3;
  wire [(5'h14):(1'h0)] wire148;
  wire [(3'h6):(1'h0)] wire147;
  wire signed [(4'h8):(1'h0)] wire146;
  wire signed [(3'h5):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire24;
  wire signed [(2'h2):(1'h0)] wire25;
  wire [(3'h6):(1'h0)] wire26;
  wire [(2'h3):(1'h0)] wire144;
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  assign y = {wire148,
                 wire147,
                 wire146,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire24,
                 wire25,
                 wire26,
                 wire144,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 (1'h0)};
  assign wire4 = {$signed(wire2)};
  assign wire5 = wire3[(3'h7):(1'h0)];
  assign wire6 = $unsigned($signed(((~&$signed(wire3)) ?
                     (^~wire0[(3'h4):(2'h2)]) : wire5)));
  assign wire7 = (~|(8'ha0));
  assign wire8 = {$unsigned(($signed($signed(wire7)) - {(&wire5),
                         (wire4 == (8'ha5))})),
                     $signed($signed($unsigned(wire2[(4'h9):(2'h3)])))};
  assign wire9 = wire1;
  assign wire10 = $signed(((^~($signed(wire6) ~^ (&wire2))) <= wire2[(2'h3):(1'h1)]));
  always
    @(posedge clk) begin
      if (wire5)
        begin
          reg11 <= (|((((wire8 ? wire3 : wire9) | (!wire0)) - (8'h9d)) ?
              wire10 : (!($unsigned(wire8) > $signed(wire5)))));
        end
      else
        begin
          if (((!{($signed(wire7) ? wire9[(2'h2):(1'h1)] : {wire4, wire9})}) ?
              (~^({$unsigned(wire4)} ?
                  $signed(wire10[(1'h0):(1'h0)]) : $signed({wire3,
                      wire1}))) : $signed((8'h9e))))
            begin
              reg11 <= ($signed((((^wire5) ?
                      $unsigned((8'hbf)) : $unsigned((8'ha5))) ?
                  (!(|wire2)) : $signed((+wire7)))) - ((-wire10) ?
                  wire4 : ({$signed(wire6)} ?
                      (|wire4[(2'h2):(1'h0)]) : {{reg11}, {wire7}})));
              reg12 <= wire6[(2'h3):(1'h1)];
              reg13 <= $unsigned($signed((+$signed($unsigned(wire3)))));
              reg14 <= ((&wire0[(3'h6):(3'h4)]) ?
                  wire5 : ((~^reg11[(3'h5):(1'h1)]) & (wire9 >>> ((wire4 ?
                          (8'h9c) : (7'h42)) ?
                      ((8'ha6) ? wire3 : reg12) : wire4[(1'h0):(1'h0)]))));
              reg15 <= (-(~^$signed(wire6)));
            end
          else
            begin
              reg11 <= $unsigned({(8'hb0)});
              reg12 <= (wire9 ?
                  $unsigned($signed(wire5[(2'h2):(2'h2)])) : $signed((^~(^wire9[(3'h6):(3'h6)]))));
              reg13 <= $unsigned(($unsigned({{(8'hbd)},
                  $signed(wire4)}) | $unsigned($signed($unsigned(wire2)))));
              reg14 <= (-(!wire1));
              reg15 <= $signed(((8'ha3) << wire10[(2'h3):(1'h0)]));
            end
          reg16 <= $signed(($unsigned((wire7 ?
              reg13[(3'h6):(3'h6)] : (8'hb0))) != (wire6 ?
              {$unsigned(reg15)} : (8'h9d))));
        end
      if ((^wire2))
        begin
          reg17 <= wire3;
          if ((+(~&(+($unsigned((8'hba)) >= ((8'had) ~^ reg15))))))
            begin
              reg18 <= ((8'hbf) ?
                  ((+(+wire5[(1'h0):(1'h0)])) <= $unsigned(wire9)) : $unsigned(wire2));
              reg19 <= $unsigned($signed($unsigned($signed({reg11}))));
              reg20 <= reg14;
            end
          else
            begin
              reg18 <= reg17;
              reg19 <= wire4[(3'h4):(1'h1)];
              reg20 <= $signed((!((reg14[(2'h2):(1'h1)] * $signed((8'hb7))) ?
                  ($signed((8'ha0)) ?
                      $signed(wire0) : reg19) : (!(reg15 | reg16)))));
              reg21 <= wire6[(3'h5):(1'h1)];
            end
        end
      else
        begin
          reg17 <= {(((~(wire5 ?
                  reg20 : reg11)) << wire1[(2'h2):(2'h2)]) & $signed($signed($signed((8'had)))))};
          reg18 <= $signed((~|{{((8'ha5) >= (8'h9f)), (wire2 ^ reg16)},
              (~|(~|wire10))}));
          reg19 <= ($signed((reg14[(1'h0):(1'h0)] ?
              $signed((reg21 << wire1)) : $unsigned(wire6[(4'hf):(3'h5)]))) | (~|(wire5[(3'h7):(3'h4)] ?
              reg19 : (~&wire5))));
          reg20 <= $unsigned($signed((wire3 ?
              reg18 : ((reg17 ^ wire8) ? wire9[(1'h1):(1'h1)] : (|reg21)))));
        end
      reg22 <= ($signed({$signed((wire3 ? wire0 : wire3)),
          ($signed((8'hb2)) >= {(7'h41),
              reg21})}) >> ((~&reg17[(2'h3):(2'h2)]) << $signed((reg17[(4'h8):(2'h2)] || (wire6 >>> reg19)))));
      reg23 <= $unsigned($signed($signed($signed(reg22[(3'h6):(2'h2)]))));
    end
  assign wire24 = reg23;
  assign wire25 = wire4;
  assign wire26 = (~&$signed(reg12[(3'h5):(1'h0)]));
  module27 #() modinst145 (wire144, clk, reg22, wire2, reg15, reg13);
  assign wire146 = ((!wire1[(1'h0):(1'h0)]) ?
                       (&$unsigned($unsigned((!reg15)))) : ((&$signed((wire2 ?
                               reg22 : (8'hae)))) ?
                           $signed((reg13 ?
                               wire26 : (~|(8'hac)))) : $unsigned($signed((+reg18)))));
  assign wire147 = $signed((~&{((wire3 == reg16) <= {reg23, reg23})}));
  assign wire148 = wire147[(2'h3):(2'h3)];
endmodule

module module27
#(parameter param142 = (~^((((+(8'hb0)) ? (7'h42) : ((7'h43) << (8'ha8))) ? (((8'ha5) ~^ (7'h41)) > (8'hb2)) : (((8'hb7) < (8'hbd)) <<< {(8'ha8), (7'h41)})) ? ({((8'ha4) == (8'hb2)), (&(8'ha0))} ? ({(8'ha8), (7'h41)} && (-(7'h44))) : (((8'hb7) ? (8'hb6) : (8'hbe)) ? (&(7'h41)) : ((8'ha7) ^~ (8'hae)))) : (((-(8'ha7)) ^~ (8'h9d)) ? (&(~&(7'h43))) : ({(8'h9e), (8'hb5)} < ((8'haa) ? (7'h40) : (8'hb5)))))), 
parameter param143 = (&(param142 ? param142 : param142)))
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h1a6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire31;
  input wire [(4'hd):(1'h0)] wire30;
  input wire signed [(5'h11):(1'h0)] wire29;
  input wire signed [(4'he):(1'h0)] wire28;
  wire [(2'h2):(1'h0)] wire140;
  wire [(4'h9):(1'h0)] wire88;
  wire [(4'hd):(1'h0)] wire85;
  wire [(4'hd):(1'h0)] wire84;
  wire signed [(3'h5):(1'h0)] wire82;
  wire signed [(5'h13):(1'h0)] wire68;
  wire signed [(5'h12):(1'h0)] wire67;
  wire [(5'h13):(1'h0)] wire65;
  wire signed [(3'h5):(1'h0)] wire40;
  wire signed [(4'h8):(1'h0)] wire39;
  wire signed [(4'hd):(1'h0)] wire38;
  wire [(4'he):(1'h0)] wire37;
  wire [(4'hc):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire35;
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(4'he):(1'h0)] reg32 = (1'h0);
  reg [(5'h15):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg87 = (1'h0);
  reg [(4'hc):(1'h0)] reg89 = (1'h0);
  reg [(5'h12):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg91 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg97 = (1'h0);
  reg [(5'h10):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg99 = (1'h0);
  reg [(4'hc):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg101 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg103 = (1'h0);
  assign y = {wire140,
                 wire88,
                 wire85,
                 wire84,
                 wire82,
                 wire68,
                 wire67,
                 wire65,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 reg34,
                 reg33,
                 reg32,
                 reg86,
                 reg87,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 reg99,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg32 <= (!wire29[(4'hd):(4'h9)]);
      reg33 <= $unsigned(reg32);
      reg34 <= (wire28[(1'h1):(1'h0)] + wire30);
    end
  assign wire35 = ($unsigned(reg34) ?
                      ((~$signed(wire28)) > $signed($unsigned(wire30))) : wire28);
  assign wire36 = ({(^~(wire29[(4'hf):(4'h8)] - (^~wire29))), wire28} ?
                      wire30 : (+$unsigned((reg34 | wire29[(5'h10):(4'h9)]))));
  assign wire37 = ($signed((~|{wire30[(1'h1):(1'h0)],
                      {wire29}})) != wire31[(3'h5):(3'h4)]);
  assign wire38 = ($unsigned($unsigned((wire31 ?
                      {wire37, reg34} : (~|wire37)))) + (~^(!reg33)));
  assign wire39 = $signed($unsigned(wire30));
  assign wire40 = $signed((wire38[(2'h3):(1'h1)] ?
                      wire37[(3'h5):(2'h3)] : wire37));
  module41 #() modinst66 (wire65, clk, reg34, wire36, wire38, wire31, wire28);
  assign wire67 = $unsigned(wire65[(1'h0):(1'h0)]);
  assign wire68 = (wire65[(1'h1):(1'h1)] + (reg32[(4'he):(4'hb)] ^~ (|wire36[(1'h0):(1'h0)])));
  module69 #() modinst83 (.wire70(wire31), .wire73(wire30), .clk(clk), .y(wire82), .wire71(wire28), .wire72(wire38));
  assign wire84 = $unsigned($unsigned(wire65));
  assign wire85 = (({$signed($unsigned(wire29))} >> (((wire40 ?
                                  wire28 : reg34) ?
                              ((8'hbb) ? reg33 : wire65) : $signed(wire31)) ?
                          wire82 : (wire37[(4'he):(1'h1)] ~^ (wire65 ~^ wire84)))) ?
                      wire68 : {reg34[(5'h12):(4'hc)]});
  always
    @(posedge clk) begin
      reg86 <= (|$signed($unsigned($signed({(8'hbe)}))));
      reg87 <= $unsigned((wire37[(4'hd):(4'hc)] ?
          $unsigned((~(+reg33))) : wire36[(3'h4):(2'h3)]));
    end
  assign wire88 = $unsigned((!wire35[(4'h8):(3'h4)]));
  always
    @(posedge clk) begin
      if ($signed(wire68[(2'h2):(1'h1)]))
        begin
          if (reg86[(4'he):(4'hc)])
            begin
              reg89 <= $unsigned((^reg33[(3'h7):(2'h3)]));
            end
          else
            begin
              reg89 <= $unsigned($unsigned({{$unsigned(wire82)},
                  ((+wire84) >> $unsigned(wire39))}));
              reg90 <= wire28[(3'h6):(1'h1)];
            end
          reg91 <= ($signed({$unsigned((^(7'h43))), wire40}) ?
              ((-((wire36 ? wire65 : reg33) ? reg34 : wire28)) ?
                  reg33[(4'h9):(1'h0)] : (-wire36[(3'h6):(1'h1)])) : (((wire40[(3'h4):(2'h3)] * $unsigned(wire84)) & ((~|wire88) ?
                  (wire28 + wire35) : $unsigned(wire36))) ~^ $signed(wire35[(3'h7):(3'h6)])));
          reg92 <= (+(7'h42));
          reg93 <= (^{({wire30} >= wire84[(2'h2):(2'h2)])});
          reg94 <= {reg86,
              ($signed(reg92[(2'h3):(1'h1)]) ?
                  $signed({{(8'haf), (8'ha6)}}) : wire65)};
        end
      else
        begin
          reg89 <= (!wire31);
        end
      reg95 <= $unsigned(((((&reg93) == {(7'h40)}) >>> $signed(wire65[(2'h3):(1'h1)])) >>> (wire35 ?
          (8'hac) : (8'ha7))));
      if (reg87)
        begin
          if (reg34[(3'h6):(3'h4)])
            begin
              reg96 <= ((reg32[(3'h5):(2'h2)] >>> $unsigned((^~(8'hb7)))) ?
                  ((wire39[(3'h5):(2'h3)] ? reg87[(1'h1):(1'h0)] : wire35) ?
                      reg87 : ($unsigned(((8'hb3) + (8'ha3))) ?
                          (&(^reg86)) : ((~|wire28) ?
                              (reg86 ?
                                  wire40 : wire31) : wire65))) : ({$signed((reg92 > wire67)),
                      $unsigned($unsigned(wire37))} > (~(wire88 ?
                      reg90[(4'hb):(4'ha)] : (7'h43)))));
              reg97 <= (reg32 >> {(((8'hb7) ?
                      $unsigned(wire35) : reg96) ^ $signed((+reg93))),
                  $signed($unsigned(wire65[(2'h2):(2'h2)]))});
              reg98 <= wire85[(2'h3):(1'h0)];
              reg99 <= (wire85[(4'hc):(2'h2)] > $signed({$unsigned(reg86[(4'hf):(3'h7)])}));
            end
          else
            begin
              reg96 <= wire85[(1'h1):(1'h1)];
              reg97 <= $signed(($unsigned(wire67) - {reg91}));
            end
          reg100 <= ($signed(($signed(((8'hb5) ?
              wire39 : wire37)) - $unsigned(wire38))) ^~ {$unsigned($unsigned($signed(reg97)))});
          reg101 <= reg99;
          reg102 <= ((wire39[(2'h3):(1'h0)] ?
                  (($signed(reg101) || $signed(reg97)) ?
                      reg95 : $unsigned((reg98 ~^ reg92))) : wire39[(1'h1):(1'h1)]) ?
              ({reg94[(4'h9):(3'h5)]} || wire68[(2'h2):(1'h0)]) : reg96);
          reg103 <= {reg99};
        end
      else
        begin
          reg96 <= reg32[(4'h8):(2'h2)];
          reg97 <= $unsigned(reg89);
        end
    end
  module104 #() modinst141 (wire140, clk, wire67, wire65, wire29, reg100, wire36);
endmodule

module module104
#(parameter param139 = (({(8'h9f), {((8'hb5) & (8'h9e))}} ~^ ((~|(&(8'h9d))) * (((8'haa) >>> (8'hae)) ? (8'ha2) : ((8'h9c) ? (8'hb8) : (8'hb7))))) ? (~((((7'h41) ? (8'hb9) : (8'had)) ? ((8'ha6) < (8'hae)) : {(8'ha0)}) - ((&(8'ha3)) <<< ((8'ha4) && (8'hb8))))) : (^~(7'h42))))
(y, clk, wire109, wire108, wire107, wire106, wire105);
  output wire [(32'h10b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire109;
  input wire [(5'h13):(1'h0)] wire108;
  input wire [(4'h9):(1'h0)] wire107;
  input wire signed [(4'hc):(1'h0)] wire106;
  input wire [(3'h5):(1'h0)] wire105;
  wire [(3'h4):(1'h0)] wire138;
  wire [(4'hc):(1'h0)] wire137;
  wire [(4'hd):(1'h0)] wire118;
  wire signed [(3'h7):(1'h0)] wire117;
  wire signed [(5'h11):(1'h0)] wire116;
  wire signed [(4'hf):(1'h0)] wire115;
  wire [(3'h7):(1'h0)] wire114;
  wire signed [(4'hb):(1'h0)] wire113;
  wire signed [(3'h6):(1'h0)] wire112;
  wire signed [(3'h7):(1'h0)] wire111;
  wire [(5'h10):(1'h0)] wire110;
  reg signed [(3'h7):(1'h0)] reg136 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg134 = (1'h0);
  reg [(4'hb):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg130 = (1'h0);
  reg [(2'h3):(1'h0)] reg129 = (1'h0);
  reg [(5'h13):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg127 = (1'h0);
  reg [(3'h7):(1'h0)] reg126 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg125 = (1'h0);
  reg [(2'h2):(1'h0)] reg124 = (1'h0);
  reg [(2'h2):(1'h0)] reg123 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg121 = (1'h0);
  reg [(3'h5):(1'h0)] reg120 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg119 = (1'h0);
  assign y = {wire138,
                 wire137,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 reg136,
                 reg135,
                 reg134,
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
                 (1'h0)};
  assign wire110 = $unsigned($signed($signed(wire106)));
  assign wire111 = $signed(((+((wire109 & wire110) + (+wire109))) << ({{wire105,
                           wire110}} ^ $signed(wire109[(4'h9):(3'h4)]))));
  assign wire112 = wire109[(1'h1):(1'h1)];
  assign wire113 = {wire105[(2'h2):(2'h2)], wire110};
  assign wire114 = ($unsigned((&({wire106,
                       wire108} != {wire112}))) > (-($signed((wire111 * wire108)) ?
                       (!((8'ha4) >>> (8'hb7))) : (~^wire113[(4'h9):(2'h2)]))));
  assign wire115 = wire106[(4'h9):(3'h6)];
  assign wire116 = (((wire107[(3'h6):(3'h6)] ?
                           $signed(wire109[(4'ha):(1'h0)]) : wire107[(1'h1):(1'h0)]) > (wire113 ?
                           ($signed(wire115) == (wire111 ?
                               wire115 : wire106)) : ((~^wire111) ?
                               (wire110 * wire105) : wire109))) ?
                       wire110[(1'h0):(1'h0)] : ({wire114} >> $signed((!(+(8'hb8))))));
  assign wire117 = (8'hbc);
  assign wire118 = wire116[(4'h9):(3'h4)];
  always
    @(posedge clk) begin
      if (wire114)
        begin
          reg119 <= ($signed((($unsigned(wire111) ?
                  $signed((8'hb5)) : {wire114, wire110}) ?
              {wire113,
                  $signed(wire114)} : wire111[(2'h3):(2'h3)])) - ((8'ha2) * wire107));
          reg120 <= {wire118[(3'h5):(3'h4)]};
          reg121 <= wire106[(4'ha):(2'h3)];
          reg122 <= ($signed(((wire111[(3'h5):(2'h2)] ?
                  (wire117 ? reg120 : wire115) : {wire118, wire115}) ?
              $signed({wire107}) : $unsigned($signed(reg121)))) * {{(8'ha4),
                  wire106[(4'h8):(2'h3)]}});
        end
      else
        begin
          reg119 <= reg122[(2'h3):(1'h1)];
          reg120 <= $signed((wire105 >= reg122));
        end
      reg123 <= wire105[(3'h5):(2'h2)];
      if (reg123)
        begin
          reg124 <= (&wire107[(4'h9):(3'h5)]);
          reg125 <= reg121[(1'h0):(1'h0)];
          reg126 <= $unsigned($signed($unsigned($signed($unsigned(wire106)))));
        end
      else
        begin
          reg124 <= $unsigned($unsigned(wire117));
          reg125 <= $signed((~^$unsigned(wire111[(1'h0):(1'h0)])));
        end
    end
  always
    @(posedge clk) begin
      reg127 <= ($unsigned((8'hb0)) ?
          ((~(^~reg120)) ?
              (reg126 > ((+reg120) == $signed(reg124))) : $unsigned(($unsigned(wire109) - wire111[(2'h2):(1'h0)]))) : $unsigned((&wire108[(4'h9):(3'h6)])));
      if (((((((8'hb0) ? reg122 : (8'hbd)) < wire109[(4'hb):(1'h0)]) ?
              ($signed(wire108) ?
                  $signed(reg127) : $signed(reg125)) : (((8'hae) >> (8'hb1)) > reg123)) ?
          (~|(wire111 ?
              wire110[(4'hb):(4'hb)] : reg121[(1'h1):(1'h1)])) : (+wire113[(3'h7):(3'h7)])) || $signed($signed($signed((wire109 ?
          wire117 : wire110))))))
        begin
          reg128 <= $signed($signed($signed(wire114)));
          reg129 <= $unsigned(reg125);
          reg130 <= ((8'hb5) >> ($signed(((^~wire114) ^ wire108[(3'h6):(3'h4)])) ?
              wire105[(3'h4):(1'h0)] : wire109));
        end
      else
        begin
          reg128 <= $unsigned($unsigned($unsigned(wire106[(4'ha):(3'h5)])));
          reg129 <= {$unsigned(($signed($unsigned(wire112)) ?
                  reg122 : ($unsigned(wire117) ?
                      (~wire109) : wire116[(4'he):(1'h1)])))};
          reg130 <= (^(7'h42));
          if ((wire117[(1'h1):(1'h0)] ?
              wire105[(1'h0):(1'h0)] : (&$unsigned($signed((reg123 ?
                  wire118 : reg129))))))
            begin
              reg131 <= ($unsigned((8'hb3)) * wire108);
              reg132 <= wire112[(1'h0):(1'h0)];
              reg133 <= reg128;
            end
          else
            begin
              reg131 <= reg130[(4'hb):(2'h3)];
              reg132 <= $signed((8'ha3));
              reg133 <= (~|reg119[(2'h3):(2'h3)]);
              reg134 <= $signed(wire116);
            end
        end
      reg135 <= reg119[(1'h0):(1'h0)];
      reg136 <= {({$unsigned(reg121[(1'h1):(1'h0)])} ?
              reg121[(2'h3):(1'h1)] : $unsigned({$unsigned(wire105),
                  (|wire110)})),
          (^{{$signed(reg135), $signed(reg126)},
              (wire108 && reg121[(2'h3):(2'h3)])})};
    end
  assign wire137 = $signed($signed((~|wire111[(3'h6):(2'h2)])));
  assign wire138 = (({reg127} - ({(wire137 ? reg127 : (8'hbc)),
                       $signed(wire108)} | {{reg131}})) ^ $unsigned({(~^wire108[(5'h11):(4'hc)]),
                       (wire111 && $unsigned(reg126))}));
endmodule

module module69
#(parameter param81 = ((~&(~|((+(7'h43)) ? (8'h9c) : ((8'ha6) ? (8'hb2) : (8'hb9))))) == (({((8'ha0) ? (8'h9c) : (8'ha2)), {(8'hb6), (8'ha4)}} ? (&{(8'hb8), (8'ha7)}) : (8'ha0)) ? {(~(|(8'ha5)))} : ((((8'hba) && (8'hb9)) ? {(8'hbf)} : ((7'h43) ? (8'hac) : (8'hac))) == (8'had)))))
(y, clk, wire73, wire72, wire71, wire70);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire73;
  input wire [(4'hb):(1'h0)] wire72;
  input wire [(3'h5):(1'h0)] wire71;
  input wire signed [(3'h5):(1'h0)] wire70;
  wire signed [(3'h6):(1'h0)] wire80;
  wire signed [(4'hf):(1'h0)] wire79;
  wire [(3'h4):(1'h0)] wire78;
  wire [(5'h13):(1'h0)] wire77;
  wire [(4'h8):(1'h0)] wire76;
  wire [(5'h12):(1'h0)] wire75;
  wire signed [(4'he):(1'h0)] wire74;
  assign y = {wire80, wire79, wire78, wire77, wire76, wire75, wire74, (1'h0)};
  assign wire74 = $signed({$unsigned((-wire70))});
  assign wire75 = $signed(wire74);
  assign wire76 = (8'hb1);
  assign wire77 = (~^{((~^(wire74 != wire70)) ?
                          ((+wire71) >> {wire73, wire71}) : $signed((~wire74))),
                      $signed(wire75[(5'h10):(4'he)])});
  assign wire78 = $signed(wire75[(5'h12):(3'h5)]);
  assign wire79 = $signed(wire72);
  assign wire80 = ((wire76 ?
                          $signed(wire71[(1'h0):(1'h0)]) : wire76[(2'h3):(2'h2)]) ?
                      (wire73 >>> wire78[(3'h4):(3'h4)]) : $signed({(wire76[(2'h2):(2'h2)] ?
                              wire72 : $signed(wire77)),
                          {(wire77 ^ wire74)}}));
endmodule

module module41  (y, clk, wire46, wire45, wire44, wire43, wire42);
  output wire [(32'hd1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire46;
  input wire signed [(4'hb):(1'h0)] wire45;
  input wire signed [(4'h8):(1'h0)] wire44;
  input wire [(5'h15):(1'h0)] wire43;
  input wire signed [(4'he):(1'h0)] wire42;
  wire [(5'h15):(1'h0)] wire64;
  wire signed [(5'h11):(1'h0)] wire63;
  wire [(4'hf):(1'h0)] wire62;
  wire [(5'h11):(1'h0)] wire61;
  wire signed [(4'hb):(1'h0)] wire60;
  wire [(3'h4):(1'h0)] wire59;
  wire signed [(5'h14):(1'h0)] wire58;
  wire signed [(4'hb):(1'h0)] wire57;
  wire [(2'h2):(1'h0)] wire56;
  wire signed [(2'h2):(1'h0)] wire55;
  wire signed [(4'hb):(1'h0)] wire54;
  wire [(5'h13):(1'h0)] wire53;
  wire signed [(2'h2):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire51;
  wire [(3'h6):(1'h0)] wire48;
  wire signed [(3'h5):(1'h0)] wire47;
  reg signed [(4'hb):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg49 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire48,
                 wire47,
                 reg50,
                 reg49,
                 (1'h0)};
  assign wire47 = {((~|((~^wire45) ?
                          {wire44,
                              wire44} : (|wire45))) ~^ (wire46 >>> $signed((~^(8'ha1)))))};
  assign wire48 = ((-$signed((+(wire47 * wire43)))) ?
                      wire45[(4'hb):(3'h7)] : $signed(wire43[(4'hb):(1'h0)]));
  always
    @(posedge clk) begin
      reg49 <= (|(8'h9d));
      reg50 <= $signed($unsigned(wire47[(1'h0):(1'h0)]));
    end
  assign wire51 = wire43;
  assign wire52 = ($unsigned($unsigned($unsigned(((7'h42) ?
                      wire42 : wire51)))) || $signed(wire46[(4'he):(4'h8)]));
  assign wire53 = (~((|wire46[(5'h11):(3'h5)]) ?
                      (~|(~{reg50, wire43})) : {((wire47 ?
                              wire48 : (8'ha9)) + $signed(wire43)),
                          ((wire43 ? wire47 : wire43) ?
                              (^~wire46) : (wire45 ? (8'ha1) : wire52))}));
  assign wire54 = ($signed(wire46[(5'h11):(3'h7)]) ?
                      (|(!wire48)) : {(~$unsigned(wire43))});
  assign wire55 = $unsigned(($unsigned((((8'hbf) ?
                          (8'hb3) : (8'h9d)) - (8'hba))) ?
                      {($unsigned(wire47) ? $unsigned(wire51) : wire51),
                          $unsigned($unsigned(wire48))} : {wire43,
                          ((wire53 | wire53) <= $unsigned((8'h9d)))}));
  assign wire56 = $unsigned($signed(wire51[(4'hb):(3'h4)]));
  assign wire57 = $signed((($signed($unsigned(reg49)) ?
                          {$signed(wire48),
                              (wire56 ?
                                  wire52 : (8'hb8))} : (wire48[(3'h5):(2'h2)] ?
                              (^~wire52) : $unsigned(wire42))) ?
                      $signed((-(~(8'hbb)))) : $unsigned($unsigned($signed(reg50)))));
  assign wire58 = wire48;
  assign wire59 = ((reg50[(4'h9):(2'h2)] ?
                          (($signed((7'h44)) - reg49[(1'h1):(1'h1)]) ?
                              wire52 : $signed((wire52 ^~ (7'h41)))) : {(~^wire44[(4'h8):(2'h3)])}) ?
                      $unsigned((-((&wire52) || ((8'ha6) ?
                          wire56 : wire42)))) : $signed(($signed($signed(wire54)) << ((wire47 ?
                          wire51 : wire57) ~^ (wire48 | wire44)))));
  assign wire60 = wire42;
  assign wire61 = wire56;
  assign wire62 = (-($signed($unsigned((~|wire56))) ?
                      wire58[(3'h7):(1'h1)] : $signed(wire53[(2'h3):(2'h2)])));
  assign wire63 = {wire62, wire52};
  assign wire64 = wire59;
endmodule
