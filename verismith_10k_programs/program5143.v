module top
#(parameter param136 = {({(((8'hbe) ? (8'hb9) : (8'hb8)) < ((8'hbd) ? (8'ha8) : (8'ha8))), (((8'ha5) + (8'hbc)) ? ((8'ha2) ? (8'hb2) : (8'ha7)) : (^~(8'ha8)))} ? (({(8'hbb), (8'hbe)} ? {(8'hb5), (8'hb2)} : ((8'hb4) != (8'hbe))) | (((8'ha8) < (8'ha1)) > {(8'hba)})) : (^({(8'had)} ? ((8'hbb) == (8'hae)) : ((8'hbf) ~^ (8'ha5)))))}, 
parameter param137 = (^~({param136, ((~|(8'ha9)) * param136)} * (~^(^{param136})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h155):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire135;
  wire [(4'ha):(1'h0)] wire134;
  wire signed [(5'h15):(1'h0)] wire132;
  wire signed [(4'hd):(1'h0)] wire28;
  wire [(3'h7):(1'h0)] wire27;
  wire [(5'h15):(1'h0)] wire26;
  wire signed [(5'h14):(1'h0)] wire25;
  wire signed [(4'ha):(1'h0)] wire24;
  wire signed [(5'h10):(1'h0)] wire23;
  wire [(4'hd):(1'h0)] wire5;
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  assign y = {wire135,
                 wire134,
                 wire132,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire5,
                 reg22,
                 reg21,
                 reg20,
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
                 reg6,
                 (1'h0)};
  assign wire5 = wire3;
  always
    @(posedge clk) begin
      reg6 <= $signed((^{$unsigned((~^(8'hb9)))}));
      reg7 <= wire0;
      reg8 <= (reg7 ?
          $unsigned((&(^~$signed(wire1)))) : ((+{(~&wire5)}) > {wire1}));
      reg9 <= $signed((|(&(reg8 <= wire3[(4'he):(3'h4)]))));
      if ((&reg7[(5'h11):(1'h0)]))
        begin
          reg10 <= {$unsigned((($unsigned(wire2) ?
                  wire4 : (wire5 ?
                      wire5 : (8'ha2))) & $unsigned(((8'ha0) < (8'haa))))),
              ((~wire2[(1'h1):(1'h0)]) ?
                  $signed($unsigned(((8'ha5) == reg8))) : wire0[(1'h1):(1'h1)])};
        end
      else
        begin
          if ($unsigned($unsigned(wire5[(3'h7):(3'h7)])))
            begin
              reg10 <= $unsigned(((({reg6} && (wire5 ?
                      reg9 : (8'hb4))) ^ $signed(wire0)) ?
                  $signed((-$signed(reg7))) : wire5));
              reg11 <= reg8[(2'h3):(2'h3)];
              reg12 <= $signed(((&(8'hb4)) ?
                  $unsigned(($signed(reg9) == reg9[(4'h8):(2'h3)])) : (~|((wire1 >>> wire0) ?
                      wire1[(3'h5):(2'h2)] : (reg9 || wire0)))));
            end
          else
            begin
              reg10 <= ((-$unsigned((reg11 - (~(8'ha8))))) ?
                  (reg7[(5'h12):(3'h6)] ^~ (^$signed((wire4 ?
                      (8'hab) : reg11)))) : ($unsigned(reg7[(4'ha):(4'h8)]) ?
                      {((+(8'hb4)) + (wire1 ~^ (8'h9c)))} : reg10));
            end
          reg13 <= reg8[(3'h5):(2'h2)];
          if (((+($signed($unsigned(wire5)) ~^ $signed(reg7))) >= $unsigned(wire2[(3'h4):(1'h1)])))
            begin
              reg14 <= $unsigned(reg11[(4'h9):(2'h3)]);
              reg15 <= (-(&$unsigned($unsigned($signed(reg14)))));
              reg16 <= {(~((^reg14) ~^ $signed(reg11))),
                  $signed(((~(~reg15)) & ((^wire0) ~^ reg15[(5'h11):(4'hd)])))};
              reg17 <= reg15;
              reg18 <= $signed($signed($unsigned((reg15 ?
                  (reg15 ? wire5 : wire3) : $unsigned(wire3)))));
            end
          else
            begin
              reg14 <= (reg17 ^~ $signed($signed(reg16[(1'h0):(1'h0)])));
              reg15 <= (^reg8);
            end
          if (reg6[(4'h8):(3'h4)])
            begin
              reg19 <= (reg15 || $unsigned($unsigned($signed($signed(reg16)))));
              reg20 <= $signed($unsigned({(-$signed(wire1)),
                  ((!wire1) & $unsigned(wire1))}));
              reg21 <= reg7[(5'h15):(2'h2)];
            end
          else
            begin
              reg19 <= (^($signed({wire2[(3'h4):(2'h3)]}) | ($unsigned(reg13[(3'h6):(3'h6)]) ?
                  reg8[(1'h1):(1'h0)] : {reg15[(4'hb):(1'h1)]})));
            end
          reg22 <= reg18;
        end
    end
  assign wire23 = (reg20[(3'h4):(2'h2)] ?
                      (($unsigned((reg22 || reg17)) ?
                          reg15[(3'h7):(3'h5)] : wire4) != reg10[(2'h2):(1'h0)]) : wire1[(4'hc):(1'h0)]);
  assign wire24 = $unsigned($signed((wire4 ^~ wire3[(3'h5):(3'h5)])));
  assign wire25 = $signed($unsigned({reg11[(3'h4):(2'h2)],
                      (wire24[(1'h0):(1'h0)] >= $signed((8'haf)))}));
  assign wire26 = ((reg19 >> (^~$signed($signed((8'ha4))))) == $signed(wire25[(4'h9):(1'h0)]));
  assign wire27 = $signed($signed((~|reg12[(3'h5):(1'h0)])));
  assign wire28 = $unsigned({((|{reg19}) | (+{reg19, reg18})),
                      (~&$unsigned(reg15[(4'hd):(3'h7)]))});
  module29 #() modinst133 (wire132, clk, reg14, wire24, wire1, reg18);
  assign wire134 = wire0[(4'h8):(3'h5)];
  assign wire135 = {$unsigned(({$unsigned(reg9),
                           (wire3 ? wire0 : reg20)} * {{wire27}})),
                       (~|($signed(((8'ha5) || reg14)) ?
                           wire3 : wire5[(4'h9):(4'h9)]))};
endmodule

module module29  (y, clk, wire33, wire32, wire31, wire30);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire33;
  input wire signed [(4'h8):(1'h0)] wire32;
  input wire [(4'hd):(1'h0)] wire31;
  input wire signed [(4'hf):(1'h0)] wire30;
  wire signed [(3'h4):(1'h0)] wire130;
  wire signed [(2'h3):(1'h0)] wire75;
  wire [(5'h13):(1'h0)] wire74;
  wire [(5'h15):(1'h0)] wire72;
  wire [(5'h12):(1'h0)] wire34;
  assign y = {wire130, wire75, wire74, wire72, wire34, (1'h0)};
  assign wire34 = (!wire31[(4'h8):(3'h6)]);
  module35 #() modinst73 (.wire36(wire33), .wire39(wire34), .wire38(wire30), .clk(clk), .wire37(wire31), .y(wire72));
  assign wire74 = ($signed($signed((&wire32))) <= ($signed({$unsigned(wire32)}) <= $signed($unsigned((wire33 ?
                      wire32 : wire32)))));
  assign wire75 = $signed(($unsigned((8'hbe)) == $signed((^~(wire30 ^ wire74)))));
  module76 #() modinst131 (.y(wire130), .wire78(wire34), .clk(clk), .wire77(wire74), .wire79(wire75), .wire80(wire72));
endmodule

module module76
#(parameter param128 = (^(((((8'hb4) <<< (7'h43)) >>> (^~(7'h44))) ? {((8'hba) ? (8'hb4) : (8'hb9))} : ({(8'hac), (8'h9f)} ? {(7'h44), (8'hb4)} : ((8'hbd) ? (8'hb1) : (8'hb1)))) ? {{((8'h9c) && (8'ha4)), ((8'had) ? (8'h9c) : (8'hbf))}, (^~((8'ha1) ? (7'h41) : (8'hb3)))} : (((^(8'hb0)) >= ((8'hbe) < (8'ha2))) | ((+(7'h41)) ? (^~(8'hbc)) : ((7'h40) ? (8'hac) : (8'ha2)))))), 
parameter param129 = (({param128} * ((((8'ha8) > param128) ? {param128} : (^~(8'ha9))) <<< param128)) && param128))
(y, clk, wire80, wire79, wire78, wire77);
  output wire [(32'h243):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire80;
  input wire [(2'h2):(1'h0)] wire79;
  input wire [(4'hc):(1'h0)] wire78;
  input wire signed [(5'h13):(1'h0)] wire77;
  wire signed [(5'h12):(1'h0)] wire127;
  wire signed [(5'h12):(1'h0)] wire126;
  wire [(4'hf):(1'h0)] wire125;
  wire signed [(3'h6):(1'h0)] wire124;
  wire [(4'h9):(1'h0)] wire123;
  wire [(4'hd):(1'h0)] wire122;
  wire [(4'hd):(1'h0)] wire121;
  wire signed [(5'h14):(1'h0)] wire120;
  wire signed [(3'h6):(1'h0)] wire119;
  wire signed [(4'hb):(1'h0)] wire118;
  wire [(5'h12):(1'h0)] wire117;
  wire signed [(3'h5):(1'h0)] wire116;
  wire signed [(3'h6):(1'h0)] wire115;
  wire signed [(3'h7):(1'h0)] wire88;
  wire [(4'he):(1'h0)] wire87;
  wire signed [(4'h8):(1'h0)] wire81;
  reg [(4'hf):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg113 = (1'h0);
  reg [(3'h6):(1'h0)] reg112 = (1'h0);
  reg [(4'hd):(1'h0)] reg111 = (1'h0);
  reg [(4'hd):(1'h0)] reg110 = (1'h0);
  reg [(4'h8):(1'h0)] reg109 = (1'h0);
  reg [(4'h8):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg107 = (1'h0);
  reg [(5'h12):(1'h0)] reg106 = (1'h0);
  reg [(5'h12):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg104 = (1'h0);
  reg [(5'h15):(1'h0)] reg103 = (1'h0);
  reg [(5'h14):(1'h0)] reg102 = (1'h0);
  reg [(3'h7):(1'h0)] reg101 = (1'h0);
  reg [(4'hc):(1'h0)] reg100 = (1'h0);
  reg [(5'h11):(1'h0)] reg99 = (1'h0);
  reg [(5'h10):(1'h0)] reg98 = (1'h0);
  reg [(4'hb):(1'h0)] reg97 = (1'h0);
  reg [(4'hc):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg95 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg93 = (1'h0);
  reg [(4'h8):(1'h0)] reg92 = (1'h0);
  reg [(5'h11):(1'h0)] reg91 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg90 = (1'h0);
  reg [(2'h2):(1'h0)] reg89 = (1'h0);
  reg signed [(4'he):(1'h0)] reg86 = (1'h0);
  reg [(3'h5):(1'h0)] reg85 = (1'h0);
  reg [(5'h11):(1'h0)] reg84 = (1'h0);
  reg [(3'h4):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg82 = (1'h0);
  assign y = {wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire88,
                 wire87,
                 wire81,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
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
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 (1'h0)};
  assign wire81 = (wire79[(1'h1):(1'h0)] ?
                      ((-{$unsigned(wire80), wire77[(2'h2):(1'h0)]}) ?
                          ($unsigned((~^wire78)) ?
                              wire80 : (((8'hba) <= wire78) ?
                                  $unsigned(wire78) : $unsigned(wire79))) : wire78[(4'ha):(1'h0)]) : $signed((wire78 ?
                          wire77[(3'h6):(3'h6)] : ((&wire80) + $unsigned(wire79)))));
  always
    @(posedge clk) begin
      reg82 <= $unsigned((~^$unsigned($signed((wire78 - wire81)))));
      reg83 <= wire79[(1'h1):(1'h1)];
      if (wire79[(1'h1):(1'h0)])
        begin
          reg84 <= wire79[(1'h1):(1'h0)];
        end
      else
        begin
          reg84 <= $signed($unsigned(((!$unsigned((8'hbb))) ?
              reg84 : $unsigned({wire80}))));
          reg85 <= ($unsigned((~|$signed($signed((8'hb6))))) > (^~(^(+$signed(wire80)))));
          reg86 <= (($unsigned({$unsigned(wire80)}) < (reg85 <<< $signed($signed(reg85)))) ^~ ($signed(((^~wire79) << wire79[(2'h2):(1'h1)])) ?
              $unsigned(($signed(wire77) ^ (!wire79))) : reg83));
        end
    end
  assign wire87 = ((wire79[(1'h1):(1'h1)] < wire79[(2'h2):(1'h1)]) ?
                      ((wire78 ?
                              (wire78[(3'h4):(3'h4)] ?
                                  $unsigned(wire77) : $signed(wire79)) : {(^~reg86),
                                  wire81}) ?
                          $signed({(reg86 >> wire81),
                              (7'h41)}) : {(|(wire81 + wire77)),
                              $unsigned(reg84[(2'h3):(1'h1)])}) : wire78[(4'h9):(3'h7)]);
  assign wire88 = (((reg85 ?
                          ((~|wire80) ?
                              reg85[(3'h5):(1'h1)] : $unsigned(reg85)) : ((reg86 || reg85) >= (reg85 ?
                              wire80 : wire79))) ?
                      ($unsigned(wire87[(4'ha):(4'h8)]) ^ wire77[(5'h10):(4'hc)]) : reg83) | wire81);
  always
    @(posedge clk) begin
      if ($unsigned(wire88[(3'h5):(2'h3)]))
        begin
          reg89 <= wire78;
          reg90 <= reg84;
        end
      else
        begin
          reg89 <= (|{{{(!reg86)}, (&(reg90 ? (8'h9c) : wire81))}});
          reg90 <= (8'hb6);
          reg91 <= (|wire88[(2'h2):(1'h0)]);
          if (wire81)
            begin
              reg92 <= ($signed((~&(wire78[(4'ha):(3'h5)] ?
                      {(8'hb5), wire77} : reg84))) ?
                  $signed($unsigned((|reg86[(3'h6):(1'h1)]))) : $signed($unsigned(wire88[(3'h7):(2'h2)])));
              reg93 <= (wire79 ?
                  (7'h42) : (((wire80[(2'h2):(1'h0)] | wire88) <<< ($unsigned((8'ha4)) ^ (wire88 > reg82))) == {$signed($signed(wire88))}));
              reg94 <= (reg92[(1'h1):(1'h0)] ?
                  (reg90 ?
                      $unsigned(reg91) : wire79) : {(+((~|reg83) > $unsigned(reg91)))});
              reg95 <= (!reg85[(1'h1):(1'h0)]);
              reg96 <= (wire81 == (reg95 ?
                  ((wire80 <= $unsigned(wire80)) ^~ $signed(((8'hbb) ?
                      (8'ha0) : reg91))) : wire81));
            end
          else
            begin
              reg92 <= (~|{{wire81[(4'h8):(3'h4)], (!(7'h40))}, reg92});
              reg93 <= reg82;
            end
          if ($unsigned(reg85))
            begin
              reg97 <= wire87[(1'h1):(1'h1)];
            end
          else
            begin
              reg97 <= wire77;
              reg98 <= $unsigned((reg86 ?
                  $unsigned(((wire77 < reg97) ?
                      wire81[(2'h2):(1'h1)] : $unsigned(wire88))) : $signed(reg95[(5'h10):(4'ha)])));
              reg99 <= reg98;
              reg100 <= $signed(reg98[(4'ha):(1'h1)]);
              reg101 <= (~(wire81 >> (&$unsigned({reg98}))));
            end
        end
      if (reg86)
        begin
          reg102 <= $unsigned({((|reg99) <<< reg83)});
          reg103 <= ((~^(+reg93[(3'h6):(1'h1)])) ?
              (((reg100[(3'h4):(2'h2)] | (reg96 >>> reg99)) ?
                      $unsigned((wire77 >= reg97)) : ((~|reg96) >>> (reg97 > wire79))) ?
                  (((reg82 <= reg97) > (reg86 && reg99)) == ($unsigned(reg98) ?
                      $unsigned((8'ha9)) : wire88)) : {$signed((reg98 * wire79)),
                      $unsigned($signed(wire81))}) : (!wire81));
          if (reg86[(1'h0):(1'h0)])
            begin
              reg104 <= wire79;
              reg105 <= $unsigned(reg93);
              reg106 <= $signed($unsigned((({wire79, reg85} ?
                      $signed(reg89) : $unsigned(reg99)) ?
                  (wire78 - $signed((8'hbd))) : reg91)));
              reg107 <= $unsigned({(reg82 ?
                      reg99[(4'hf):(1'h0)] : ({reg85} == $unsigned(reg86))),
                  ($signed((~&reg97)) ?
                      (wire78 ?
                          (+wire81) : $signed(wire80)) : ((~reg97) << reg106))});
              reg108 <= ($signed((+reg90[(3'h4):(3'h4)])) && reg82[(3'h4):(1'h0)]);
            end
          else
            begin
              reg104 <= ((&reg95[(3'h5):(2'h2)]) ? wire78 : $signed((~&reg97)));
              reg105 <= reg98;
              reg106 <= reg106[(4'he):(4'ha)];
              reg107 <= reg104[(3'h7):(3'h7)];
              reg108 <= reg96;
            end
          if (reg104)
            begin
              reg109 <= (^wire79[(1'h0):(1'h0)]);
              reg110 <= $signed({reg108[(2'h2):(1'h1)]});
              reg111 <= (reg95[(5'h11):(4'he)] << (reg107[(4'hc):(4'h9)] >> {reg85}));
              reg112 <= (|((((reg85 > (8'ha1)) ~^ (reg94 && reg107)) ~^ $unsigned(reg104[(1'h0):(1'h0)])) != {{(^~reg111)},
                  $signed($signed(reg85))}));
              reg113 <= (~^(^($unsigned($unsigned(reg89)) ?
                  ((reg82 ?
                      reg98 : reg84) | $unsigned(wire81)) : $unsigned({(8'hbb),
                      reg86}))));
            end
          else
            begin
              reg109 <= $signed(wire77);
              reg110 <= (reg100 ^~ (($signed($unsigned(reg111)) ?
                  ((8'ha8) != (reg101 << wire79)) : reg113[(4'hc):(3'h7)]) - {(reg98 ?
                      $signed(reg83) : $signed(reg101))}));
              reg111 <= $unsigned((~^$signed($unsigned(wire81))));
              reg112 <= reg83[(1'h1):(1'h1)];
              reg113 <= (reg95[(4'hf):(3'h6)] << (-$signed($unsigned((~|wire87)))));
            end
        end
      else
        begin
          reg102 <= $unsigned(reg82);
          if ({(^~reg111[(3'h6):(3'h5)]), $signed(reg90[(4'h8):(1'h1)])})
            begin
              reg103 <= $unsigned($unsigned((((wire88 - reg89) ?
                  $unsigned(reg85) : (wire78 && reg97)) < {(8'hbb),
                  {reg113, wire88}})));
              reg104 <= ((^reg103[(4'h8):(3'h7)]) & $unsigned(reg109[(3'h5):(2'h3)]));
              reg105 <= ($unsigned((~^reg83)) ?
                  ((reg84[(4'ha):(1'h0)] ?
                      (!(8'hb7)) : ($unsigned(reg113) | {reg90})) * (((wire78 ?
                          reg111 : wire87) ?
                      $unsigned(reg106) : $unsigned(reg98)) && reg103[(5'h14):(1'h1)])) : ($signed(($signed(reg97) ?
                      {reg104, wire78} : {reg96, wire79})) & $signed(reg103)));
            end
          else
            begin
              reg103 <= $signed($signed(({(reg109 ~^ (8'hbe)),
                  reg89[(1'h0):(1'h0)]} & $unsigned({reg95}))));
            end
        end
      reg114 <= ((^~(8'h9d)) * $signed((-wire79[(1'h0):(1'h0)])));
    end
  assign wire115 = {wire87[(4'ha):(4'h9)], $unsigned((~&(8'h9c)))};
  assign wire116 = {((+(~^(~^reg93))) ? reg95 : $signed((|(reg93 | reg90)))),
                       $unsigned((((~|reg110) ^~ wire87) ?
                           reg96 : ($signed((8'hb3)) ^ $unsigned(reg84))))};
  assign wire117 = $signed(($signed($signed({(8'ha1)})) <= $signed((+((8'hb3) * reg83)))));
  assign wire118 = $signed((7'h42));
  assign wire119 = $unsigned(reg97[(1'h0):(1'h0)]);
  assign wire120 = {$signed((~&reg95))};
  assign wire121 = ((&((~^$signed(reg110)) <<< wire77)) << wire87[(3'h7):(1'h0)]);
  assign wire122 = (-wire116);
  assign wire123 = reg101[(2'h3):(1'h0)];
  assign wire124 = (8'ha2);
  assign wire125 = (|(wire121[(4'ha):(4'h9)] >= $signed($signed(reg85[(3'h5):(2'h3)]))));
  assign wire126 = ($signed((((~reg98) - (~^reg107)) ?
                           reg106 : ((~|reg84) >= ((7'h40) ?
                               reg114 : wire81)))) ?
                       $signed(reg99) : (+$unsigned({{reg90},
                           (reg98 >>> reg86)})));
  assign wire127 = $signed(reg92);
endmodule

module module35  (y, clk, wire39, wire38, wire37, wire36);
  output wire [(32'h15d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire39;
  input wire [(4'hf):(1'h0)] wire38;
  input wire [(2'h2):(1'h0)] wire37;
  input wire [(4'h8):(1'h0)] wire36;
  wire signed [(4'hd):(1'h0)] wire71;
  wire signed [(4'hf):(1'h0)] wire70;
  wire signed [(5'h11):(1'h0)] wire69;
  wire [(4'h8):(1'h0)] wire68;
  wire signed [(4'h8):(1'h0)] wire57;
  wire signed [(4'hf):(1'h0)] wire56;
  wire signed [(4'he):(1'h0)] wire55;
  wire [(4'h8):(1'h0)] wire54;
  wire [(4'hb):(1'h0)] wire53;
  wire [(4'h8):(1'h0)] wire52;
  wire [(2'h2):(1'h0)] wire51;
  reg signed [(4'he):(1'h0)] reg67 = (1'h0);
  reg [(4'h8):(1'h0)] reg66 = (1'h0);
  reg [(3'h5):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg62 = (1'h0);
  reg [(4'hf):(1'h0)] reg61 = (1'h0);
  reg [(5'h11):(1'h0)] reg60 = (1'h0);
  reg [(4'hb):(1'h0)] reg59 = (1'h0);
  reg [(3'h7):(1'h0)] reg58 = (1'h0);
  reg [(5'h14):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg [(4'hc):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg40 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
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
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg40 <= wire38;
      if (reg40[(4'ha):(3'h6)])
        begin
          if ((($unsigned((~^(wire38 - wire39))) ?
                  (((8'ha4) ~^ (~&wire38)) | reg40) : reg40) ?
              (wire36 ^~ ($signed($signed(wire36)) & wire38[(4'ha):(1'h1)])) : ((&(^~$unsigned(reg40))) ?
                  wire36 : $signed($signed(wire38)))))
            begin
              reg41 <= reg40;
              reg42 <= wire39[(3'h4):(2'h2)];
              reg43 <= ($unsigned({(-{wire37, wire37}),
                  $unsigned({reg41})}) >>> (|((^~(reg41 * reg42)) ?
                  wire39 : $signed(reg42))));
              reg44 <= $unsigned($signed((reg42[(3'h4):(2'h3)] ?
                  $signed({reg40}) : (~wire39))));
              reg45 <= ((^$unsigned(($signed(reg40) <<< ((8'ha8) ?
                      reg40 : wire37)))) ?
                  reg41 : wire36);
            end
          else
            begin
              reg41 <= (wire39[(4'ha):(3'h7)] ?
                  ($unsigned($signed((~|reg42))) * (8'hb9)) : $signed(({(wire38 || reg42)} < ((+reg45) & (+reg45)))));
              reg42 <= $unsigned(((((wire38 ^ reg42) ?
                  wire37 : ((8'hac) ?
                      wire36 : reg41)) ^ $signed($signed(reg45))) < wire37[(1'h1):(1'h1)]));
              reg43 <= reg42;
              reg44 <= reg43[(4'hb):(3'h4)];
            end
          reg46 <= reg42;
          if ((~^($signed($unsigned((wire37 | reg41))) + {($unsigned((8'hbd)) ?
                  (7'h44) : reg45[(2'h2):(2'h2)])})))
            begin
              reg47 <= (&(!{((wire38 ~^ (8'hb4)) == (reg46 ? reg40 : reg46))}));
              reg48 <= reg41[(2'h3):(1'h0)];
            end
          else
            begin
              reg47 <= (reg40[(3'h6):(3'h6)] * ({reg43[(4'hc):(1'h1)],
                      ($unsigned(reg43) >= $unsigned(wire39))} ?
                  ($signed((|wire36)) ?
                      ((^~(7'h42)) ?
                          $signed(wire37) : {reg41}) : $signed($signed(wire39))) : $unsigned($unsigned(reg44[(3'h4):(2'h3)]))));
              reg48 <= wire37[(1'h1):(1'h1)];
            end
        end
      else
        begin
          if (({($unsigned($signed(wire39)) >>> $signed(reg47))} ?
              $signed($signed(reg41)) : ($unsigned(($signed(reg40) ?
                      ((8'hbe) ? wire37 : reg40) : wire36)) ?
                  $unsigned({{reg42}}) : $unsigned((reg44[(4'h9):(3'h7)] * (reg41 == reg44))))))
            begin
              reg41 <= (reg43 != (8'hbc));
              reg42 <= reg41;
            end
          else
            begin
              reg41 <= reg44[(4'h9):(3'h4)];
              reg42 <= ((~&(8'hb2)) ? (8'haf) : $signed(wire38[(4'hb):(3'h7)]));
              reg43 <= ($unsigned((&((|wire37) < {reg48}))) ?
                  (~reg47[(1'h0):(1'h0)]) : ($signed(wire36) | reg44));
            end
          if (wire38[(3'h7):(3'h7)])
            begin
              reg44 <= (!$unsigned($unsigned($signed(((8'hb5) ?
                  reg48 : wire37)))));
              reg45 <= $signed(reg45[(2'h3):(2'h3)]);
              reg46 <= (-((8'h9e) ? reg43 : $unsigned(reg41)));
            end
          else
            begin
              reg44 <= {reg46[(4'h8):(1'h0)]};
            end
          reg47 <= (~$unsigned($signed((~&{reg41}))));
        end
      reg49 <= reg44[(2'h2):(1'h1)];
      reg50 <= $signed(reg46);
    end
  assign wire51 = {((|$signed((~&wire36))) ?
                          (+(reg48[(4'hb):(4'hb)] ?
                              reg47[(2'h2):(2'h2)] : $unsigned(reg47))) : $signed(reg50))};
  assign wire52 = ($unsigned((reg44 <<< reg40)) <= $unsigned((wire36[(3'h4):(2'h2)] << ((wire51 == reg45) && (reg43 ^ reg43)))));
  assign wire53 = reg49;
  assign wire54 = ((~|$signed((reg50[(4'he):(3'h4)] | $unsigned((8'hb0))))) || reg44[(1'h1):(1'h0)]);
  assign wire55 = ((reg46[(4'ha):(3'h6)] ?
                          $unsigned($signed((reg50 ?
                              wire37 : reg45))) : ($signed(reg42[(4'hb):(1'h0)]) ?
                              ((reg45 ? wire54 : wire51) ?
                                  (&reg40) : (~^reg44)) : (wire36[(3'h7):(2'h3)] ~^ (~^(8'ha8))))) ?
                      reg43 : ((reg43 == $unsigned(wire38[(2'h2):(2'h2)])) ^~ $signed(($unsigned(reg50) + (~wire36)))));
  assign wire56 = wire52[(3'h5):(3'h4)];
  assign wire57 = $signed(($signed(((wire38 ? (8'hb8) : reg42) & (^wire39))) ?
                      (((&reg41) ?
                          (reg43 >> reg47) : (wire51 + wire37)) > reg47[(1'h1):(1'h0)]) : $signed((((8'ha2) <<< wire36) <<< wire38[(3'h4):(1'h1)]))));
  always
    @(posedge clk) begin
      reg58 <= (wire57 - (wire36 < (|(wire56 + ((8'ha2) & (8'hb7))))));
      reg59 <= reg58[(3'h6):(1'h1)];
      if (reg47)
        begin
          reg60 <= (^(((&(wire39 > wire55)) ^~ $signed($unsigned(wire51))) ?
              $signed((reg45[(1'h0):(1'h0)] ?
                  reg50 : {(8'hac), reg58})) : (reg43 >>> reg47)));
          if ((8'hab))
            begin
              reg61 <= $signed(wire54);
              reg62 <= (&$signed((+reg42[(4'hb):(4'ha)])));
            end
          else
            begin
              reg61 <= {(~^$signed((^~(reg48 ? wire57 : (8'hac))))),
                  $signed({reg60[(4'ha):(4'h8)]})};
              reg62 <= ((reg60 & reg40) ?
                  (((-reg62[(3'h5):(1'h0)]) ?
                      ((8'ha1) | $unsigned(wire51)) : {$signed(reg48)}) & reg62) : {(($unsigned(reg47) && $signed(reg59)) > wire52[(1'h0):(1'h0)]),
                      (-wire36)});
              reg63 <= {$unsigned((7'h42)),
                  ($signed($unsigned((reg49 >> wire37))) ?
                      reg46 : (reg58[(3'h5):(2'h2)] >> wire57))};
              reg64 <= (8'hba);
            end
          reg65 <= ((wire53 ?
                  $unsigned(($unsigned(reg43) ?
                      reg46 : $unsigned(reg43))) : (wire36 >> reg63)) ?
              ((^((wire53 ? reg48 : reg62) ? $signed(reg47) : (^~reg50))) ?
                  $unsigned((8'hbe)) : ((reg47[(1'h1):(1'h0)] ^ (~wire39)) ?
                      {(~|(7'h42))} : $signed((wire57 ?
                          reg59 : (7'h40))))) : (~&(($signed(reg61) ^ wire55) ?
                  $signed($signed((7'h41))) : $signed(reg43))));
        end
      else
        begin
          reg60 <= (^~{$signed((((8'hb0) ~^ reg41) < reg65)),
              {((|wire38) ? wire57 : ((8'ha1) ? wire37 : wire57))}});
          reg61 <= $signed($unsigned(wire52[(3'h4):(2'h2)]));
          reg62 <= reg41[(3'h5):(2'h3)];
          reg63 <= $signed((8'hac));
        end
      reg66 <= reg44;
      reg67 <= reg46[(4'ha):(4'ha)];
    end
  assign wire68 = (~&$signed(wire57[(3'h5):(1'h1)]));
  assign wire69 = (wire68[(1'h0):(1'h0)] ?
                      {$unsigned($unsigned(reg43[(1'h1):(1'h1)]))} : wire38);
  assign wire70 = reg49[(2'h2):(2'h2)];
  assign wire71 = reg40;
endmodule
