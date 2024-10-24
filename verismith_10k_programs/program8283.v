module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire21;
  wire [(4'h9):(1'h0)] wire22;
  wire signed [(4'h8):(1'h0)] wire117;
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire20,
                 wire21,
                 wire22,
                 wire117,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = (wire0[(4'hb):(2'h2)] ^~ ((wire1 ?
                         $signed((^~wire4)) : $signed(wire0[(1'h0):(1'h0)])) ?
                     ($signed(wire2) ^~ {(wire1 == (8'hbf))}) : ((~^wire1[(3'h6):(3'h4)]) < $unsigned(wire3[(4'h8):(1'h0)]))));
  assign wire6 = {$signed((($unsigned(wire4) >>> (wire2 ?
                         wire1 : wire5)) ~^ $unsigned(wire0[(4'ha):(1'h0)])))};
  always
    @(posedge clk) begin
      reg7 <= wire4;
    end
  always
    @(posedge clk) begin
      reg8 <= (wire3 ?
          $unsigned($signed(($unsigned(wire6) ?
              $signed(wire3) : reg7))) : $unsigned(wire2[(5'h15):(2'h3)]));
    end
  always
    @(posedge clk) begin
      if ($unsigned((!(wire2[(4'hb):(4'hb)] > wire6[(3'h4):(1'h1)]))))
        begin
          reg9 <= reg7[(3'h4):(1'h1)];
          if ((wire0[(1'h1):(1'h1)] ?
              (($signed({wire6}) ?
                  $signed(wire5[(4'ha):(3'h6)]) : $unsigned(wire5[(3'h4):(3'h4)])) ^~ {$signed((wire0 ?
                      wire1 : (8'hb2)))}) : ((8'ha3) ^ wire1)))
            begin
              reg10 <= (|{($signed($signed(reg9)) ~^ (+$signed(wire0)))});
              reg11 <= wire2[(4'hb):(4'ha)];
              reg12 <= ((-reg8[(4'hc):(3'h7)]) >>> ($signed(reg7) ?
                  {(8'ha1)} : (wire0[(4'hc):(3'h4)] & ({(8'hb7)} <<< wire4[(5'h14):(4'hb)]))));
            end
          else
            begin
              reg10 <= $signed($signed(wire0));
              reg11 <= $unsigned((~^((+$unsigned(wire0)) ?
                  (8'hb4) : (|(~wire5)))));
            end
          if ((reg8 <<< ((~^reg11) ^~ (reg10 < wire0[(3'h6):(2'h3)]))))
            begin
              reg13 <= (($signed(($unsigned(reg11) ?
                          (wire6 ? wire4 : wire6) : wire4[(5'h14):(5'h10)])) ?
                      $signed(($signed(wire4) ?
                          $signed(wire5) : $signed(wire3))) : (^~(wire4 ?
                          (^~wire1) : (wire5 >= wire6)))) ?
                  (((~&$signed(reg12)) >= $signed((wire3 ? reg12 : wire6))) ?
                      (~&reg7) : (!(|(reg9 ^ wire4)))) : $unsigned((({wire4} << $signed((8'hb8))) ?
                      {{reg11, wire3}} : $signed($signed(reg7)))));
              reg14 <= (+$unsigned($unsigned($unsigned((reg8 | wire3)))));
              reg15 <= ($signed(wire5[(4'hd):(4'h8)]) ^ {reg7[(1'h1):(1'h0)]});
              reg16 <= {$signed(($signed((reg10 >>> reg14)) == ({reg8, wire5} ?
                      (~&reg10) : (reg12 * reg11))))};
              reg17 <= (&reg11);
            end
          else
            begin
              reg13 <= (!{$signed(wire3)});
              reg14 <= (-wire4);
              reg15 <= {$unsigned($signed((~&$unsigned(reg17)))),
                  $unsigned(wire6)};
              reg16 <= ((|wire6[(2'h3):(1'h1)]) ?
                  {($signed($signed(reg12)) ^~ wire5)} : wire3);
              reg17 <= $unsigned((reg8[(1'h1):(1'h1)] >>> ({$unsigned(wire4),
                      reg8} ?
                  ((reg13 ? wire3 : reg8) ^ (~^reg10)) : (|$signed(reg11)))));
            end
          reg18 <= (~|$unsigned(((8'hbe) ?
              wire3 : ($unsigned(wire1) ?
                  reg16[(4'h9):(3'h4)] : $unsigned(wire4)))));
        end
      else
        begin
          reg9 <= $signed(reg11);
          reg10 <= $signed({$unsigned(($unsigned(reg15) << wire6))});
          reg11 <= $unsigned((($unsigned((wire2 ? reg12 : (8'hab))) ?
              ($signed(wire5) ?
                  {wire4} : $unsigned(reg14)) : $signed($signed((7'h44)))) ^ $unsigned((((8'ha9) << reg18) && (reg8 < reg10)))));
        end
      reg19 <= (wire0 - reg10);
    end
  assign wire20 = $unsigned($signed(((reg15 ?
                          (reg11 > reg15) : $unsigned(reg11)) ?
                      ((reg7 ? wire3 : reg9) ?
                          $unsigned(reg17) : $signed((8'hb1))) : $unsigned(reg9[(2'h3):(2'h3)]))));
  assign wire21 = ($signed((8'ha9)) >> reg17);
  assign wire22 = $signed(reg18[(3'h4):(3'h4)]);
  module23 #() modinst118 (.wire26(wire1), .wire27(reg11), .wire25(wire4), .wire24(wire3), .clk(clk), .wire28(reg19), .y(wire117));
endmodule

module module23
#(parameter param116 = ((|(~|((^(8'hb3)) ? (8'hac) : {(8'ha5), (8'haa)}))) ? (~(~|(|((8'had) ? (8'h9f) : (8'hbd))))) : (((-((8'ha3) <= (8'hb3))) ? (((8'hbe) ? (8'hab) : (8'hbb)) ? (~^(8'hb5)) : (8'h9d)) : (((8'ha9) >> (7'h41)) ? ((8'hba) ? (8'haf) : (8'haa)) : ((8'h9c) <= (8'hb4)))) ? {{((8'hb5) ? (8'hb5) : (7'h43))}} : ((8'ha0) ? ((&(8'ha3)) < ((8'h9c) * (8'hbc))) : (!(!(7'h42)))))))
(y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire28;
  input wire [(5'h14):(1'h0)] wire27;
  input wire signed [(4'he):(1'h0)] wire26;
  input wire [(4'hf):(1'h0)] wire25;
  input wire [(5'h15):(1'h0)] wire24;
  wire signed [(3'h6):(1'h0)] wire115;
  wire signed [(4'h8):(1'h0)] wire114;
  wire [(5'h15):(1'h0)] wire113;
  wire [(4'hf):(1'h0)] wire112;
  wire signed [(5'h12):(1'h0)] wire111;
  wire signed [(5'h12):(1'h0)] wire105;
  wire signed [(3'h5):(1'h0)] wire104;
  wire signed [(5'h14):(1'h0)] wire102;
  wire [(4'hd):(1'h0)] wire73;
  wire [(5'h14):(1'h0)] wire29;
  reg signed [(5'h10):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg108 = (1'h0);
  reg [(3'h4):(1'h0)] reg107 = (1'h0);
  reg [(5'h10):(1'h0)] reg106 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire105,
                 wire104,
                 wire102,
                 wire73,
                 wire29,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 (1'h0)};
  assign wire29 = wire28;
  module30 #() modinst74 (wire73, clk, wire27, wire24, wire26, wire25);
  module75 #() modinst103 (.wire76(wire24), .wire77(wire29), .wire79(wire73), .wire78(wire27), .y(wire102), .clk(clk));
  assign wire104 = $signed(wire29);
  assign wire105 = $signed(wire73);
  always
    @(posedge clk) begin
      reg106 <= $signed(wire28[(1'h0):(1'h0)]);
      reg107 <= $signed((reg106[(3'h6):(3'h4)] < (|wire26[(4'ha):(1'h1)])));
      reg108 <= $signed({wire24[(1'h0):(1'h0)],
          $unsigned(wire24[(3'h7):(3'h5)])});
      reg109 <= $unsigned($signed(wire24));
      reg110 <= ($unsigned((((reg108 != reg108) | (wire105 ?
          wire27 : wire73)) * wire105[(4'hf):(3'h5)])) && $unsigned(($signed((|wire26)) || $signed((wire104 || reg109)))));
    end
  assign wire111 = wire28[(1'h1):(1'h0)];
  assign wire112 = {wire27, (~^(reg106[(4'hc):(3'h4)] || wire26))};
  assign wire113 = wire73[(4'hc):(4'hc)];
  assign wire114 = {{reg108,
                           ((((8'hbb) ? reg107 : wire102) <= (^wire113)) ?
                               (~|(wire29 ?
                                   (8'ha7) : reg109)) : $unsigned(wire27))}};
  assign wire115 = (~&wire111);
endmodule

module module75
#(parameter param101 = ({(({(8'hab), (8'hb8)} ? ((8'hbf) ? (8'ha6) : (8'hac)) : (~|(7'h44))) ? {((8'hb3) ? (8'ha8) : (7'h40)), {(8'hb0)}} : (~^(!(8'had))))} != (~^{((+(8'ha5)) ? ((8'hbb) << (8'hbf)) : ((7'h43) & (8'hb6)))})))
(y, clk, wire79, wire78, wire77, wire76);
  output wire [(32'h108):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire79;
  input wire [(3'h7):(1'h0)] wire78;
  input wire [(4'h8):(1'h0)] wire77;
  input wire [(5'h15):(1'h0)] wire76;
  wire signed [(4'hb):(1'h0)] wire100;
  wire [(3'h5):(1'h0)] wire99;
  wire [(5'h13):(1'h0)] wire98;
  wire [(5'h13):(1'h0)] wire97;
  wire [(4'hc):(1'h0)] wire96;
  wire [(5'h13):(1'h0)] wire95;
  wire signed [(2'h2):(1'h0)] wire94;
  wire [(4'hd):(1'h0)] wire82;
  wire signed [(3'h7):(1'h0)] wire81;
  wire [(5'h15):(1'h0)] wire80;
  reg [(3'h7):(1'h0)] reg93 = (1'h0);
  reg [(4'hc):(1'h0)] reg92 = (1'h0);
  reg [(4'he):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg85 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg84 = (1'h0);
  reg [(4'hf):(1'h0)] reg83 = (1'h0);
  assign y = {wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire82,
                 wire81,
                 wire80,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 (1'h0)};
  assign wire80 = ($unsigned(wire78) <= ($unsigned((+$signed(wire78))) ?
                      wire77 : $signed($signed(wire79))));
  assign wire81 = $unsigned((&wire76));
  assign wire82 = wire80[(4'he):(2'h3)];
  always
    @(posedge clk) begin
      reg83 <= $signed($unsigned((wire77 & $unsigned(wire77))));
      if ({{$unsigned((^~$signed((8'hb0))))}})
        begin
          if ($unsigned({wire76[(4'he):(4'h8)]}))
            begin
              reg84 <= $signed(($unsigned($unsigned(wire80[(5'h15):(4'he)])) >>> (wire77[(2'h3):(2'h3)] || wire76)));
              reg85 <= ((7'h44) & (((((7'h43) << wire78) ?
                      wire76[(4'he):(2'h2)] : (wire81 || (8'hb9))) ?
                  ({wire82,
                      wire78} <<< $signed(reg83)) : $signed(wire76[(3'h7):(2'h3)])) && (wire80[(2'h2):(1'h1)] ?
                  wire78[(2'h2):(1'h1)] : wire82)));
              reg86 <= ($signed({($unsigned(reg85) ?
                          (+(8'hab)) : (wire81 ~^ reg85)),
                      $signed({(8'hb1), wire80})}) ?
                  (-wire78[(1'h0):(1'h0)]) : (~(-(~|(wire77 >> reg85)))));
              reg87 <= reg85;
            end
          else
            begin
              reg84 <= reg86;
            end
          reg88 <= {{$unsigned(wire79)},
              (wire78 <= (wire76 || $unsigned((wire80 ? reg83 : wire82))))};
          if ((wire80[(5'h11):(4'hf)] || (~(-($signed(reg83) ?
              reg87[(2'h3):(2'h3)] : $unsigned(wire81))))))
            begin
              reg89 <= ((((wire79 != (~&reg87)) < $unsigned((reg85 ?
                      reg88 : wire82))) ?
                  ($unsigned((8'hb9)) ?
                      (+wire78[(3'h5):(2'h3)]) : ((reg87 >>> reg85) & reg85[(4'h9):(3'h7)])) : {(reg87[(2'h2):(1'h0)] + reg84),
                      reg84[(3'h5):(3'h5)]}) && $unsigned(wire80));
              reg90 <= wire82;
            end
          else
            begin
              reg89 <= reg84[(2'h2):(1'h1)];
              reg90 <= (~^(~^{({reg84} ? wire78 : $signed(wire77))}));
              reg91 <= $unsigned(reg83[(4'h9):(4'h8)]);
              reg92 <= wire82[(2'h3):(1'h0)];
              reg93 <= $unsigned((wire80 ?
                  (($unsigned(reg85) ?
                      $unsigned((7'h43)) : reg85) * (reg85[(4'hf):(3'h5)] != {wire82,
                      wire78})) : reg83));
            end
        end
      else
        begin
          if ((8'haf))
            begin
              reg84 <= (~^$unsigned(reg84));
              reg85 <= (^(reg88[(3'h6):(3'h5)] ?
                  wire81[(2'h3):(1'h0)] : reg85));
              reg86 <= reg91;
              reg87 <= reg83;
            end
          else
            begin
              reg84 <= reg84[(3'h4):(2'h3)];
              reg85 <= {$unsigned((((reg88 ? reg87 : (7'h40)) ?
                      ((8'hb9) ?
                          wire79 : wire81) : (wire79 != wire76)) || (+$unsigned(wire82))))};
              reg86 <= (|wire82);
            end
        end
    end
  assign wire94 = $unsigned(reg88);
  assign wire95 = $unsigned($unsigned((~|$unsigned(reg86))));
  assign wire96 = wire76[(4'hd):(4'h8)];
  assign wire97 = $unsigned({(!$signed((wire94 <<< wire96))),
                      $signed(reg89[(3'h5):(1'h1)])});
  assign wire98 = wire94[(1'h1):(1'h1)];
  assign wire99 = $unsigned(((8'hbc) > (((wire98 > reg86) > (wire82 ?
                          reg85 : wire79)) ?
                      (!reg84[(1'h1):(1'h0)]) : wire98)));
  assign wire100 = (($unsigned(({wire78, reg83} >= (wire95 ?
                       (8'h9c) : reg84))) + ((!$signed(wire79)) ?
                       wire76[(5'h14):(5'h11)] : {{wire76,
                               wire76}})) ~^ $unsigned($unsigned($signed({reg89,
                       (7'h41)}))));
endmodule

module module30
#(parameter param72 = ((|(((~|(8'hb8)) ? ((8'hbc) ? (8'hb4) : (8'ha3)) : (~|(8'ha0))) ^ (((8'ha3) ^~ (8'haa)) ? (|(8'hb7)) : ((7'h42) ^ (8'ha5))))) ? {(|{{(8'hbc)}})} : (((8'hb8) == (8'hb5)) ~^ (((&(8'h9d)) ? ((8'hbf) ? (8'ha4) : (7'h44)) : ((8'hb5) ? (8'hb2) : (8'hb6))) - (8'hac)))))
(y, clk, wire34, wire33, wire32, wire31);
  output wire [(32'h1a5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire34;
  input wire signed [(3'h4):(1'h0)] wire33;
  input wire [(4'h8):(1'h0)] wire32;
  input wire [(4'h8):(1'h0)] wire31;
  wire signed [(4'h8):(1'h0)] wire71;
  wire signed [(4'ha):(1'h0)] wire70;
  wire [(4'h9):(1'h0)] wire61;
  wire signed [(3'h7):(1'h0)] wire60;
  wire [(3'h4):(1'h0)] wire59;
  wire signed [(5'h13):(1'h0)] wire58;
  wire signed [(5'h11):(1'h0)] wire57;
  wire [(4'hc):(1'h0)] wire56;
  wire [(4'he):(1'h0)] wire55;
  wire [(4'ha):(1'h0)] wire54;
  wire [(5'h10):(1'h0)] wire53;
  wire [(4'hc):(1'h0)] wire52;
  wire signed [(5'h14):(1'h0)] wire51;
  wire [(3'h7):(1'h0)] wire50;
  wire [(5'h12):(1'h0)] wire49;
  wire [(5'h11):(1'h0)] wire48;
  wire [(3'h6):(1'h0)] wire47;
  wire signed [(2'h2):(1'h0)] wire35;
  reg signed [(3'h6):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  reg [(5'h12):(1'h0)] reg66 = (1'h0);
  reg [(5'h10):(1'h0)] reg65 = (1'h0);
  reg [(2'h2):(1'h0)] reg64 = (1'h0);
  reg [(2'h3):(1'h0)] reg63 = (1'h0);
  reg [(4'hf):(1'h0)] reg62 = (1'h0);
  reg [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg [(3'h7):(1'h0)] reg36 = (1'h0);
  assign y = {wire71,
                 wire70,
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
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire35,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg46,
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
  assign wire35 = ($unsigned((-(&(wire33 ? wire34 : wire34)))) ?
                      ($signed((&(^wire33))) ?
                          (({(8'hb2)} ? $signed(wire34) : (wire33 ^~ (8'ha8))) ?
                              $unsigned(wire31) : ((~&wire31) ?
                                  $signed(wire34) : (wire34 ?
                                      wire32 : wire33))) : wire33) : wire34[(4'hd):(4'hd)]);
  always
    @(posedge clk) begin
      if ((wire33[(2'h3):(2'h3)] - (wire32 ?
          $signed(wire33) : wire34[(5'h12):(5'h10)])))
        begin
          reg36 <= {(~|wire32[(3'h4):(2'h2)]), wire31[(1'h0):(1'h0)]};
          reg37 <= $signed((!{wire32[(2'h3):(2'h2)]}));
          reg38 <= (((&((wire33 < wire32) << {wire35})) <<< (($signed(wire34) ?
                  (~wire35) : wire34) ?
              wire34 : wire31[(2'h2):(1'h1)])) * (|$unsigned(($unsigned(reg37) ?
              (wire31 & wire31) : $signed(reg37)))));
          reg39 <= wire32;
          reg40 <= reg38[(3'h6):(1'h1)];
        end
      else
        begin
          reg36 <= reg38;
        end
      reg41 <= wire31[(2'h2):(2'h2)];
      reg42 <= $unsigned({(~(&$unsigned(reg40)))});
      if ($signed({$unsigned((!reg40[(4'hd):(2'h2)]))}))
        begin
          reg43 <= ((((((8'hac) >= (8'haa)) ?
                      (reg39 ~^ wire33) : $unsigned(reg39)) ?
                  reg36 : (-reg39[(3'h5):(1'h1)])) != $signed($unsigned((reg42 ?
                  (8'h9f) : reg36)))) ?
              ((!reg36[(3'h6):(1'h1)]) || (wire34[(1'h0):(1'h0)] ?
                  $unsigned($unsigned(wire31)) : wire31)) : reg42[(5'h10):(4'hf)]);
        end
      else
        begin
          reg43 <= wire31[(2'h3):(1'h0)];
          if ($signed(($signed((-wire32[(3'h5):(3'h5)])) ?
              $unsigned(reg43) : (~&$signed({(8'hb8), reg39})))))
            begin
              reg44 <= $unsigned((8'hb4));
              reg45 <= $unsigned({(&reg41[(3'h5):(3'h4)])});
            end
          else
            begin
              reg44 <= wire34;
              reg45 <= wire35[(2'h2):(2'h2)];
            end
          reg46 <= (~|$unsigned(($unsigned(reg43[(4'h9):(3'h6)]) ?
              reg36[(2'h3):(2'h2)] : ({reg37, reg44} | (&reg36)))));
        end
    end
  assign wire47 = ($signed(reg38[(3'h4):(3'h4)]) ^~ reg43);
  assign wire48 = $unsigned({$signed(($signed(wire31) >= (reg37 ?
                          (8'h9d) : reg36)))});
  assign wire49 = $unsigned(($signed($signed($signed(wire32))) >> $unsigned($unsigned(((8'h9e) ?
                      (8'hb1) : reg36)))));
  assign wire50 = ($unsigned(({{wire48, (8'ha0)}, ((8'hbb) ? reg39 : wire47)} ?
                          ($unsigned(wire33) ?
                              $signed(reg43) : $unsigned(reg36)) : {reg46[(4'h9):(3'h7)]})) ?
                      (~&$signed(($unsigned(reg42) <<< (reg39 | (8'h9e))))) : (wire31 || reg40[(4'he):(4'h9)]));
  assign wire51 = wire49;
  assign wire52 = {($signed({((8'hbe) ? wire51 : reg38), (reg40 <= wire32)}) ?
                          $signed(($signed(reg41) >= {wire49})) : wire51[(5'h14):(1'h0)]),
                      {{wire31[(3'h7):(2'h2)], wire51[(5'h10):(3'h5)]},
                          (~|wire33)}};
  assign wire53 = reg45;
  assign wire54 = (8'had);
  assign wire55 = (wire32 ?
                      $signed($unsigned((reg46[(5'h10):(4'he)] < wire52[(4'h9):(4'h8)]))) : (~|($unsigned((wire51 << wire49)) ?
                          wire53[(5'h10):(4'ha)] : wire52[(3'h7):(3'h6)])));
  assign wire56 = wire33[(3'h4):(2'h2)];
  assign wire57 = ((({(wire34 < reg39)} ~^ reg46[(4'h8):(1'h0)]) ?
                      wire52[(2'h3):(2'h3)] : $unsigned(($unsigned(reg37) ^ $unsigned(wire51)))) - (8'hb0));
  assign wire58 = (!{reg41[(2'h2):(2'h2)], wire34});
  assign wire59 = wire33[(2'h2):(1'h0)];
  assign wire60 = reg44;
  assign wire61 = wire49[(4'hc):(2'h3)];
  always
    @(posedge clk) begin
      reg62 <= $signed(((reg42 ~^ (+((8'hb6) >> wire59))) ?
          $unsigned($unsigned((reg43 ?
              wire53 : wire52))) : wire57[(3'h5):(3'h5)]));
      if (reg37[(4'h8):(4'h8)])
        begin
          reg63 <= $signed(wire47);
          if (($unsigned(reg36[(1'h1):(1'h0)]) ?
              reg44[(4'h8):(2'h3)] : (|reg41)))
            begin
              reg64 <= (((reg63[(2'h3):(1'h1)] <= ({reg39} ?
                          (wire49 ? reg37 : wire60) : (wire33 <<< (8'hb4)))) ?
                      wire32 : $signed(reg38)) ?
                  $unsigned({(+$signed(wire56))}) : (wire57 ?
                      $unsigned((reg42 ?
                          $unsigned(wire51) : {wire56,
                              reg43})) : $signed((7'h41))));
              reg65 <= {wire55};
              reg66 <= (reg36[(2'h2):(1'h1)] ^ reg36);
              reg67 <= ((^~(reg42[(3'h6):(3'h6)] == $unsigned($unsigned(wire34)))) ?
                  (reg38 <<< ((|(&reg43)) - ($signed(reg40) * wire56[(3'h4):(2'h3)]))) : (+wire34));
            end
          else
            begin
              reg64 <= {($signed(reg40[(4'ha):(3'h6)]) != wire61[(1'h1):(1'h1)]),
                  {($unsigned(reg39[(4'he):(4'hc)]) < $signed((wire49 ?
                          wire58 : reg62))),
                      (7'h43)}};
            end
          reg68 <= (8'hab);
          reg69 <= $unsigned((wire56[(4'h8):(3'h5)] ?
              (wire58[(4'he):(4'h8)] || $signed((wire55 ?
                  reg64 : reg65))) : (8'ha0)));
        end
      else
        begin
          reg63 <= $signed($signed($unsigned(reg67[(1'h1):(1'h1)])));
          reg64 <= $unsigned($unsigned(wire56[(3'h6):(2'h3)]));
        end
    end
  assign wire70 = (~^(((-(reg66 << wire35)) ^ (~wire60[(1'h1):(1'h0)])) ?
                      wire31 : $unsigned((8'hac))));
  assign wire71 = (~&(wire49[(3'h4):(1'h1)] ?
                      reg67[(1'h0):(1'h0)] : wire49[(5'h12):(3'h7)]));
endmodule
