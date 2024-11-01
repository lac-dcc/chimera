module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h16b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire3;
  wire signed [(5'h12):(1'h0)] wire131;
  wire [(2'h3):(1'h0)] wire130;
  wire signed [(3'h6):(1'h0)] wire128;
  wire signed [(5'h12):(1'h0)] wire76;
  wire signed [(3'h5):(1'h0)] wire75;
  wire [(3'h6):(1'h0)] wire74;
  wire [(5'h10):(1'h0)] wire73;
  wire signed [(4'hc):(1'h0)] wire72;
  wire signed [(5'h11):(1'h0)] wire70;
  wire signed [(5'h12):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire20;
  wire [(4'hb):(1'h0)] wire31;
  wire [(4'ha):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire52;
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg54 = (1'h0);
  assign y = {wire131,
                 wire130,
                 wire128,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire70,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire19,
                 wire20,
                 wire31,
                 wire33,
                 wire52,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg54,
                 (1'h0)};
  assign wire4 = $unsigned(wire0);
  assign wire5 = {(!(~&((wire1 == wire4) * wire1[(1'h0):(1'h0)]))),
                     $unsigned(wire2)};
  assign wire6 = (wire2[(5'h14):(4'h8)] & {((wire5[(4'he):(1'h0)] < wire5[(1'h0):(1'h0)]) | (|$signed(wire1)))});
  assign wire7 = ($unsigned(wire3) ?
                     (~$signed($signed({(8'hbb),
                         (8'hab)}))) : {wire6[(3'h4):(1'h0)],
                         $unsigned(wire4[(4'hb):(1'h1)])});
  always
    @(posedge clk) begin
      if ($signed((~|wire2[(4'hb):(4'h9)])))
        begin
          if (wire6[(1'h0):(1'h0)])
            begin
              reg8 <= (^~{(&(wire4[(4'hc):(3'h4)] || (^~wire6)))});
              reg9 <= ((~$signed((-(reg8 ? wire3 : wire1)))) ?
                  ($unsigned({((8'ha9) >>> (7'h40))}) ?
                      wire7 : {($unsigned(wire4) ^~ wire4)}) : $unsigned((&wire0[(5'h10):(4'hb)])));
              reg10 <= reg8[(4'h8):(3'h7)];
            end
          else
            begin
              reg8 <= (wire7 ~^ $unsigned($signed(((wire3 & wire1) ?
                  (wire7 ? wire5 : reg9) : wire2))));
              reg9 <= (8'had);
              reg10 <= ($unsigned(reg9) ?
                  ((~wire6[(2'h2):(2'h2)]) >> {wire5,
                      (reg8[(1'h1):(1'h1)] ?
                          ((8'hb3) && wire3) : ((7'h40) ?
                              reg10 : wire7))}) : $unsigned($signed((~|wire4))));
              reg11 <= wire4[(2'h2):(1'h0)];
            end
          reg12 <= wire7[(2'h2):(2'h2)];
        end
      else
        begin
          reg8 <= (~^reg8);
          reg9 <= $unsigned((wire7 || (reg8 ?
              $signed((wire6 ? reg10 : (8'h9d))) : ((7'h43) ?
                  $signed(reg8) : (~^wire1)))));
          reg10 <= $signed(wire2[(4'hf):(2'h3)]);
          reg11 <= {(($signed(reg8) ?
                  $signed($unsigned(wire1)) : {wire6,
                      reg10}) < (($unsigned(reg9) ?
                      ((8'h9f) | reg8) : ((8'ha2) ? reg12 : wire2)) ?
                  ((!wire6) || $signed((8'ha4))) : (+wire1))),
              (($signed($signed((8'ha4))) ?
                  ((&(8'hac)) ?
                      wire5 : $signed(wire6)) : (~^$unsigned(wire7))) * $unsigned(wire6))};
          reg12 <= (wire5 ? {(reg11 ~^ reg10)} : wire6);
        end
      reg13 <= {(((((8'ha1) & wire6) * wire0) ?
              $unsigned(wire3[(1'h1):(1'h1)]) : $signed(wire4)) || (8'hb0))};
      if (($unsigned(wire6[(3'h4):(3'h4)]) + ((reg12[(4'ha):(3'h5)] ?
              (((8'ha4) ? wire2 : wire7) ^~ (8'ha9)) : reg8[(3'h6):(1'h0)]) ?
          $unsigned(reg8[(3'h4):(3'h4)]) : (^~wire7))))
        begin
          reg14 <= (($unsigned(reg9[(3'h5):(2'h2)]) ^ (wire3 ^~ reg10)) * (wire3 ?
              wire1[(2'h2):(1'h0)] : reg12[(3'h7):(3'h4)]));
          reg15 <= $unsigned(wire1[(1'h1):(1'h1)]);
          reg16 <= $signed(({$unsigned((reg13 ? (8'ha8) : wire2)),
              wire7} ~^ $signed((^(reg11 ? wire6 : wire0)))));
          reg17 <= reg14;
          reg18 <= (~|$unsigned({($unsigned(reg13) >= $signed(reg14))}));
        end
      else
        begin
          reg14 <= $unsigned({{({reg10, reg16} ^ (wire6 ? wire5 : (7'h44)))},
              reg15});
          reg15 <= ((&reg9) << (wire5 < ($unsigned(((8'hb4) <= reg11)) << {reg13})));
          reg16 <= wire5[(4'hd):(4'h8)];
        end
    end
  assign wire19 = reg14[(1'h1):(1'h0)];
  assign wire20 = (($unsigned((~|wire3[(1'h1):(1'h1)])) ?
                      $unsigned($signed({reg18,
                          reg18})) : reg18[(1'h0):(1'h0)]) && (~&($signed(reg13) <<< $unsigned(((8'hb6) - (8'ha7))))));
  module21 #() modinst32 (.wire22(reg12), .wire24(reg11), .clk(clk), .y(wire31), .wire23(reg18), .wire25(reg16));
  assign wire33 = {$signed(((~|$signed(reg15)) || (|reg8[(4'h8):(1'h1)])))};
  module34 #() modinst53 (wire52, clk, wire20, reg16, reg11, reg14, reg10);
  always
    @(posedge clk) begin
      reg54 <= (8'hbe);
    end
  module55 #() modinst71 (.wire57(wire1), .wire59(wire7), .y(wire70), .wire58(wire52), .wire56(reg18), .wire60(wire33), .clk(clk));
  assign wire72 = (|(reg17 ?
                      ((-(^~reg54)) ?
                          reg8[(3'h6):(1'h1)] : {{reg12},
                              reg10[(3'h5):(1'h1)]}) : wire19[(2'h3):(2'h3)]));
  assign wire73 = (8'h9d);
  assign wire74 = wire19;
  assign wire75 = {($unsigned(reg15[(4'ha):(1'h1)]) ?
                          (reg18[(3'h4):(2'h2)] ?
                              $signed($unsigned(wire1)) : ((~wire0) ?
                                  (reg15 ^ reg16) : (^~wire4))) : (~&({reg15,
                                  (8'hb3)} ?
                              ((8'haa) ? reg9 : wire6) : (~wire1))))};
  assign wire76 = reg13;
  module77 #() modinst129 (wire128, clk, wire4, wire20, reg15, reg18);
  assign wire130 = $signed((wire2[(4'he):(4'h9)] * (~&$unsigned(reg16))));
  assign wire131 = wire76[(4'ha):(1'h0)];
endmodule

module module77
#(parameter param127 = {{((((7'h44) < (8'h9e)) < (&(8'ha0))) * (|((8'hb5) ? (8'hae) : (7'h43)))), (-{((8'ha5) < (8'hb2))})}, {((!{(8'hae), (7'h42)}) ? (((8'had) * (8'hb0)) ? (~(8'ha5)) : ((7'h42) ? (8'ha7) : (8'hbb))) : (!((8'hb4) ? (8'hb7) : (8'haa)))), {(~|{(8'haf)}), ((|(8'ha6)) >>> {(8'hab), (8'hbe)})}}})
(y, clk, wire81, wire80, wire79, wire78);
  output wire [(32'h106):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire81;
  input wire signed [(4'hd):(1'h0)] wire80;
  input wire signed [(5'h12):(1'h0)] wire79;
  input wire signed [(2'h2):(1'h0)] wire78;
  wire [(5'h15):(1'h0)] wire126;
  wire [(3'h6):(1'h0)] wire125;
  wire signed [(2'h3):(1'h0)] wire123;
  wire [(2'h3):(1'h0)] wire105;
  wire signed [(5'h13):(1'h0)] wire104;
  wire signed [(2'h3):(1'h0)] wire103;
  wire [(4'hb):(1'h0)] wire102;
  wire [(5'h10):(1'h0)] wire101;
  wire [(5'h11):(1'h0)] wire90;
  wire signed [(5'h14):(1'h0)] wire89;
  reg [(3'h6):(1'h0)] reg100 = (1'h0);
  reg [(5'h12):(1'h0)] reg99 = (1'h0);
  reg [(4'h8):(1'h0)] reg98 = (1'h0);
  reg signed [(4'he):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg94 = (1'h0);
  reg [(3'h7):(1'h0)] reg93 = (1'h0);
  reg [(2'h3):(1'h0)] reg92 = (1'h0);
  reg [(4'hc):(1'h0)] reg91 = (1'h0);
  reg [(2'h2):(1'h0)] reg88 = (1'h0);
  reg [(2'h3):(1'h0)] reg87 = (1'h0);
  reg [(4'hd):(1'h0)] reg86 = (1'h0);
  reg [(2'h3):(1'h0)] reg85 = (1'h0);
  reg [(2'h3):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg83 = (1'h0);
  reg [(4'ha):(1'h0)] reg82 = (1'h0);
  assign y = {wire126,
                 wire125,
                 wire123,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire90,
                 wire89,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg82 <= $unsigned((wire81 ?
          (wire80 ?
              wire81 : {(wire80 != wire81),
                  (~^wire80)}) : wire79[(4'he):(3'h7)]));
      reg83 <= $signed((^~(-$signed((wire78 > (8'hb3))))));
      if (((wire80 << wire80) ?
          ({wire79,
              $unsigned($unsigned(wire81))} < wire80[(3'h5):(1'h1)]) : wire78[(1'h1):(1'h1)]))
        begin
          reg84 <= (wire80[(4'hb):(4'ha)] ?
              (wire78[(1'h1):(1'h0)] >= reg82) : {wire80[(3'h6):(1'h0)],
                  (((wire80 ? reg82 : wire79) <<< wire81) >> ((reg82 ?
                          reg82 : reg82) ?
                      (reg83 >>> (8'ha4)) : (^wire78)))});
          if ((wire79[(3'h7):(3'h5)] | $signed(((wire78 < $signed(reg84)) ?
              wire80[(4'h8):(3'h4)] : $signed(reg84)))))
            begin
              reg85 <= wire79[(1'h0):(1'h0)];
            end
          else
            begin
              reg85 <= reg83;
              reg86 <= (^reg85);
            end
          reg87 <= ($unsigned((wire81 | {reg85[(1'h1):(1'h1)]})) >= ((wire79 ?
              reg85[(2'h3):(1'h1)] : (-reg83[(2'h2):(1'h0)])) ~^ $signed((~(wire80 ?
              wire78 : reg86)))));
        end
      else
        begin
          reg84 <= (reg83[(3'h5):(2'h2)] - reg85);
          reg85 <= wire81[(4'h9):(4'h9)];
        end
      reg88 <= (~|reg86);
    end
  assign wire89 = wire80;
  assign wire90 = reg84;
  always
    @(posedge clk) begin
      reg91 <= $unsigned((|((reg88 ? reg86 : (~|wire81)) ?
          ((reg83 | reg85) < $unsigned(reg87)) : ((+reg85) < ((8'ha2) ?
              reg87 : reg83)))));
      reg92 <= (reg84 > $unsigned(reg87));
      reg93 <= $unsigned($signed($signed((((8'h9e) ^~ reg83) & wire79))));
      if ($signed($signed($unsigned($signed((wire89 - wire80))))))
        begin
          reg94 <= (~&wire90);
        end
      else
        begin
          reg94 <= (+(|($signed($unsigned((8'ha1))) ?
              $signed($unsigned(wire90)) : reg91)));
          if (reg92)
            begin
              reg95 <= (8'h9d);
              reg96 <= $unsigned(($signed((8'hb7)) ?
                  $signed(($unsigned(reg87) ?
                      (reg87 ?
                          reg91 : reg83) : $signed(reg83))) : $unsigned({(-reg88),
                      (reg91 && reg82)})));
              reg97 <= wire90[(4'hf):(4'hf)];
              reg98 <= $signed(((reg92[(1'h1):(1'h0)] ?
                  ($unsigned(reg85) + (wire81 < reg92)) : reg93[(3'h4):(3'h4)]) & (({reg97,
                  reg84} & reg93) || ($unsigned(reg92) > (reg87 ?
                  (8'h9f) : (8'ha1))))));
              reg99 <= ($signed($signed({(reg82 >= (7'h41)), $signed(reg95)})) ?
                  $signed(reg83[(2'h3):(1'h1)]) : (((8'ha4) >= $unsigned((reg93 ?
                          reg87 : reg87))) ?
                      {{{reg83, reg93},
                              wire81}} : ((~&reg95[(2'h2):(1'h0)]) || ($unsigned(wire80) ?
                          $unsigned(reg86) : $signed(wire90)))));
            end
          else
            begin
              reg95 <= (7'h43);
              reg96 <= $signed((-$unsigned((&{(8'ha3)}))));
              reg97 <= (reg93[(3'h6):(3'h4)] << $signed(($signed((wire78 ?
                  wire89 : reg82)) >> wire78[(1'h0):(1'h0)])));
              reg98 <= (reg87 | ((((reg94 ? reg92 : (8'hbb)) && (-reg85)) ?
                      (wire78 ?
                          $signed(reg92) : $unsigned(wire81)) : {$unsigned(reg86)}) ?
                  $unsigned({(-wire78)}) : $unsigned({reg82})));
              reg99 <= $unsigned($unsigned((wire90 ?
                  {reg97, (~^reg87)} : $unsigned($unsigned(reg94)))));
            end
        end
      reg100 <= $unsigned($signed({({reg83} ?
              $signed((8'ha1)) : $unsigned(reg93)),
          $signed(wire90[(4'hb):(2'h2)])}));
    end
  assign wire101 = $unsigned(reg97);
  assign wire102 = reg88[(1'h1):(1'h0)];
  assign wire103 = ($signed((~^$unsigned(wire81[(4'he):(4'ha)]))) ?
                       (reg82 ?
                           wire89[(1'h1):(1'h1)] : (((reg94 ?
                               (8'ha9) : reg84) ~^ ((8'ha4) << reg87)) | reg100)) : $signed(reg85));
  assign wire104 = $signed(((~&$unsigned((reg95 ? reg100 : (8'ha3)))) ?
                       $signed($unsigned((wire103 ?
                           (7'h44) : reg95))) : ({(wire79 - wire79), reg86} ?
                           reg98[(3'h4):(2'h2)] : ($signed(reg85) ?
                               (~^(8'haf)) : reg87))));
  assign wire105 = {(-((~{reg100}) ?
                           wire89[(4'hc):(4'hc)] : ($unsigned((8'hb8)) ?
                               (8'haf) : (&wire104))))};
  module106 #() modinst124 (.wire110(reg86), .wire109(reg97), .wire108(reg83), .clk(clk), .y(wire123), .wire107(reg84));
  assign wire125 = (~((!(reg92 ? {reg95, wire123} : (^~wire80))) ?
                       $signed({((8'hba) && reg98), wire102}) : reg95));
  assign wire126 = (^~(8'ha1));
endmodule

module module55
#(parameter param69 = (~^(-{{{(8'hb0)}}, (((8'hb2) < (8'hbf)) ? ((8'hb2) > (8'hb1)) : ((8'hb9) * (8'h9c)))})))
(y, clk, wire60, wire59, wire58, wire57, wire56);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire60;
  input wire signed [(4'ha):(1'h0)] wire59;
  input wire [(4'hb):(1'h0)] wire58;
  input wire signed [(5'h14):(1'h0)] wire57;
  input wire [(4'h9):(1'h0)] wire56;
  wire signed [(4'h9):(1'h0)] wire68;
  wire [(4'ha):(1'h0)] wire67;
  wire [(3'h4):(1'h0)] wire66;
  wire [(2'h3):(1'h0)] wire65;
  wire signed [(5'h11):(1'h0)] wire63;
  wire signed [(5'h10):(1'h0)] wire62;
  wire signed [(4'hd):(1'h0)] wire61;
  reg [(4'he):(1'h0)] reg64 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire63,
                 wire62,
                 wire61,
                 reg64,
                 (1'h0)};
  assign wire61 = (|wire58);
  assign wire62 = ($signed(wire59[(3'h5):(2'h2)]) ^~ wire56[(4'h9):(3'h4)]);
  assign wire63 = $unsigned(($unsigned(((^wire57) <= wire61[(4'h9):(3'h7)])) ?
                      $signed($signed(wire56)) : $signed($unsigned($signed(wire56)))));
  always
    @(posedge clk) begin
      reg64 <= ({(($signed(wire59) ? wire58 : wire60) ?
              wire60 : (~^(wire58 ? wire61 : wire63)))} - $unsigned(wire63));
    end
  assign wire65 = wire59[(2'h3):(2'h3)];
  assign wire66 = wire60[(3'h5):(3'h5)];
  assign wire67 = (wire65[(2'h3):(2'h3)] << (reg64 && ($signed((!(8'hb7))) <= (+$unsigned(wire60)))));
  assign wire68 = $unsigned({(+wire57[(5'h14):(3'h7)])});
endmodule

module module34
#(parameter param51 = (({((8'ha3) ? ((8'hb5) + (8'haf)) : (~^(8'ha8)))} ? ((~^((8'hb1) || (8'ha9))) ? ((|(8'had)) ~^ ((8'hac) ? (8'hbf) : (8'hb3))) : (~|(~|(8'h9f)))) : (((8'hb1) <= ((8'hb1) >>> (8'hbe))) >= (((8'hbe) || (8'ha7)) ? (-(8'hba)) : ((8'hbc) ? (8'hb6) : (8'ha6))))) << {{{{(8'hab), (8'hb6)}, {(7'h44)}}}}))
(y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire39;
  input wire [(5'h15):(1'h0)] wire38;
  input wire signed [(4'hc):(1'h0)] wire37;
  input wire signed [(3'h5):(1'h0)] wire36;
  input wire signed [(4'ha):(1'h0)] wire35;
  wire [(4'ha):(1'h0)] wire49;
  wire [(4'hb):(1'h0)] wire48;
  wire signed [(4'hb):(1'h0)] wire47;
  wire signed [(2'h2):(1'h0)] wire46;
  wire [(3'h7):(1'h0)] wire41;
  wire signed [(5'h13):(1'h0)] wire40;
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(2'h3):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire41,
                 wire40,
                 reg50,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire40 = {(^~wire36[(3'h5):(3'h4)]), wire38};
  assign wire41 = {wire40};
  always
    @(posedge clk) begin
      reg42 <= {$signed((wire38[(5'h11):(5'h10)] ?
              $unsigned($signed(wire37)) : (~^(wire38 ? (8'haf) : wire41)))),
          {(wire39 ?
                  (wire35[(3'h4):(1'h0)] < $signed(wire35)) : ($unsigned(wire41) ^~ (wire38 + wire36)))}};
      reg43 <= ((^wire35[(4'h9):(2'h3)]) ?
          (wire36[(3'h4):(3'h4)] ?
              (reg42 >= $unsigned(wire39)) : ($unsigned(reg42[(4'hf):(1'h1)]) ?
                  ($unsigned(wire41) ~^ (wire40 < wire41)) : ((!reg42) != (wire39 ?
                      reg42 : reg42)))) : reg42);
      if (((^wire35) ~^ wire37[(1'h1):(1'h1)]))
        begin
          if (({(wire38 <= $unsigned((wire41 > reg42))),
                  wire41[(1'h1):(1'h0)]} ?
              ({$signed((~|wire39))} ?
                  (wire38 == wire37[(4'ha):(3'h4)]) : $unsigned($unsigned((reg42 ~^ wire35)))) : $signed((7'h43))))
            begin
              reg44 <= $signed((8'ha7));
              reg45 <= (~|(~|((~wire37[(2'h2):(1'h0)]) & $signed(reg42))));
            end
          else
            begin
              reg44 <= ({(((wire41 * wire38) >> (8'ha9)) ?
                      $signed($signed(wire39)) : (^(7'h42))),
                  {wire35,
                      {$unsigned(reg45),
                          ((8'hb4) ?
                              wire37 : reg42)}}} ^~ wire35[(3'h7):(3'h4)]);
            end
        end
      else
        begin
          reg44 <= (^(|$unsigned($signed((wire36 < (8'hac))))));
        end
    end
  assign wire46 = reg45[(3'h4):(2'h3)];
  assign wire47 = (((($signed(wire35) != wire39[(3'h6):(3'h5)]) ?
                      reg44[(4'h8):(4'h8)] : ($unsigned(wire46) >= $signed(wire46))) && reg43) ~^ $signed($signed($unsigned($unsigned(reg42)))));
  assign wire48 = reg44[(4'hc):(4'h8)];
  assign wire49 = wire47[(3'h5):(2'h2)];
  always
    @(posedge clk) begin
      reg50 <= {$signed(($signed({wire49, wire41}) | reg43[(1'h1):(1'h0)]))};
    end
endmodule

module module21
#(parameter param30 = (|(((&((8'h9f) ? (8'ha4) : (8'hba))) ? (&((8'ha5) + (8'ha6))) : (-(^~(8'ha5)))) ? (({(8'ha4), (8'h9c)} ? (-(8'hbc)) : ((8'haf) ? (8'ha7) : (7'h42))) >> (-(^(8'hab)))) : {((~|(8'hb4)) || ((8'hac) ? (8'hb8) : (8'hab))), (((8'ha9) & (8'h9c)) ? (~^(7'h40)) : ((8'hb2) ? (8'ha9) : (8'hbd)))})))
(y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'h2c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire25;
  input wire signed [(3'h6):(1'h0)] wire24;
  input wire [(4'h9):(1'h0)] wire23;
  input wire signed [(4'hd):(1'h0)] wire22;
  wire [(4'ha):(1'h0)] wire29;
  wire signed [(5'h14):(1'h0)] wire28;
  wire signed [(4'h8):(1'h0)] wire26;
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  assign y = {wire29, wire28, wire26, reg27, (1'h0)};
  assign wire26 = ({(~^(&$unsigned((8'haa))))} ?
                      $unsigned(wire22[(2'h3):(2'h3)]) : (!({$signed((8'h9d)),
                              $unsigned(wire23)} ?
                          (~|$signed(wire23)) : (~^wire23[(3'h7):(2'h2)]))));
  always
    @(posedge clk) begin
      reg27 <= ($unsigned(wire26) & $signed(($unsigned((wire24 ?
              wire26 : wire22)) ?
          ((^~wire23) << $unsigned(wire23)) : (wire26 ?
              $signed(wire22) : $unsigned(wire23)))));
    end
  assign wire28 = wire22[(4'h8):(2'h3)];
  assign wire29 = $signed((($unsigned({wire28,
                      wire28}) <= {$unsigned(wire22)}) > $signed(($signed((8'ha0)) == wire26[(3'h7):(3'h5)]))));
endmodule

module module106
#(parameter param121 = {(-({{(8'ha3)}} < (+(~&(8'ha2))))), ((^~(+((8'haf) ? (8'hb6) : (8'hbd)))) ? ({(~^(8'ha1)), ((8'ha8) ? (8'had) : (8'h9c))} ? {(~|(7'h43))} : (((7'h43) ? (7'h43) : (8'haa)) ^ {(8'ha4)})) : ((((8'ha4) >>> (7'h41)) >>> {(8'hb3)}) ? (8'ha3) : ((~|(8'hb8)) ? (~(8'ha8)) : ((8'h9c) >= (8'ha5)))))}, 
parameter param122 = ((-(param121 >= ((param121 ? param121 : (8'hbc)) > (param121 ? param121 : param121)))) >= (-(((~|param121) == (^param121)) << param121))))
(y, clk, wire110, wire109, wire108, wire107);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire110;
  input wire signed [(4'he):(1'h0)] wire109;
  input wire signed [(3'h4):(1'h0)] wire108;
  input wire [(2'h2):(1'h0)] wire107;
  wire [(5'h14):(1'h0)] wire120;
  wire [(4'h8):(1'h0)] wire119;
  wire signed [(4'h9):(1'h0)] wire118;
  wire [(2'h3):(1'h0)] wire117;
  wire [(3'h4):(1'h0)] wire116;
  wire [(5'h12):(1'h0)] wire115;
  wire signed [(4'hc):(1'h0)] wire114;
  wire [(5'h10):(1'h0)] wire113;
  wire signed [(3'h6):(1'h0)] wire112;
  wire signed [(5'h12):(1'h0)] wire111;
  assign y = {wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 (1'h0)};
  assign wire111 = (-($unsigned((wire107[(1'h0):(1'h0)] << (wire109 ?
                       wire109 : (8'hbd)))) & $unsigned($signed((wire107 ?
                       wire110 : wire110)))));
  assign wire112 = wire108;
  assign wire113 = (wire110[(3'h5):(1'h1)] >> $unsigned($signed((+wire110))));
  assign wire114 = $signed(($unsigned($unsigned(wire107)) ?
                       $signed(((wire110 ?
                           wire111 : wire108) ^ {wire110})) : (wire111[(2'h2):(1'h1)] && {$unsigned((8'hae))})));
  assign wire115 = (&($signed((!(8'hb0))) <<< (wire108[(2'h2):(1'h0)] ?
                       wire110[(3'h5):(3'h4)] : wire109[(1'h0):(1'h0)])));
  assign wire116 = (wire111 >> wire114);
  assign wire117 = $unsigned(($signed({wire114[(3'h6):(3'h6)]}) || (wire107[(2'h2):(1'h0)] ?
                       ((&(8'ha9)) ?
                           wire111 : ((7'h40) << wire113)) : $unsigned({wire115,
                           wire113}))));
  assign wire118 = {(((~&$unsigned(wire111)) ?
                           ($unsigned(wire109) ?
                               wire112[(3'h4):(1'h1)] : (~|wire117)) : (-wire117[(2'h2):(1'h0)])) < wire113[(5'h10):(2'h3)]),
                       {$signed($signed($signed(wire115))),
                           $signed($unsigned(wire116[(1'h1):(1'h0)]))}};
  assign wire119 = wire108[(1'h0):(1'h0)];
  assign wire120 = ({wire119[(3'h4):(2'h3)]} ?
                       (~(^~$signed((wire107 ?
                           wire109 : wire111)))) : $unsigned($unsigned($unsigned(wire107))));
endmodule
