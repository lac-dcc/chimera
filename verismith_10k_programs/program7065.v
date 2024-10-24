module top
#(parameter param183 = (((+(8'hbd)) - ((((8'h9f) * (8'ha5)) ? ((8'ha3) ? (8'hb9) : (8'hb8)) : (^(8'hbf))) != (|(-(8'ha4))))) ? (^~(+((8'hb8) ? ((8'ha8) ~^ (8'hb6)) : ((7'h41) || (8'hbd))))) : (|((!((8'ha6) >> (8'hbd))) ? (((7'h44) ? (8'hab) : (8'hbd)) ? ((8'hb4) || (8'hbd)) : {(8'hb6), (8'ha6)}) : (((8'h9d) ? (8'hba) : (8'ha2)) ? (8'haf) : ((8'ha2) ? (8'hb7) : (8'hab)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h204):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire0;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire4;
  wire [(2'h3):(1'h0)] wire180;
  wire signed [(5'h15):(1'h0)] wire179;
  wire [(5'h13):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire31;
  wire [(3'h5):(1'h0)] wire101;
  wire signed [(5'h11):(1'h0)] wire103;
  wire signed [(5'h12):(1'h0)] wire104;
  wire signed [(4'hf):(1'h0)] wire173;
  reg signed [(5'h15):(1'h0)] reg182 = (1'h0);
  reg [(5'h13):(1'h0)] reg181 = (1'h0);
  reg [(4'ha):(1'h0)] reg178 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg5 = (1'h0);
  assign y = {wire180,
                 wire179,
                 wire30,
                 wire31,
                 wire101,
                 wire103,
                 wire104,
                 wire173,
                 reg182,
                 reg181,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
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
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= ({wire3[(1'h1):(1'h1)]} - $signed((~|{$signed(wire2),
          $signed(wire3)})));
      if ((&$unsigned((^~$signed((wire1 ? reg5 : wire4))))))
        begin
          reg6 <= wire1;
          reg7 <= wire3;
          reg8 <= $unsigned(((((wire2 ? wire2 : wire2) >= $signed(wire4)) ?
                  {wire3, wire3} : wire2[(4'h8):(1'h1)]) ?
              (wire4[(3'h5):(2'h2)] <<< $signed($signed(wire2))) : $signed($signed($signed(wire2)))));
        end
      else
        begin
          reg6 <= wire4[(4'h8):(3'h6)];
          if ($signed(wire0))
            begin
              reg7 <= $unsigned((~({(wire2 ? wire1 : wire3)} ?
                  {(reg7 + wire1)} : ((reg7 + wire2) <<< (wire4 & wire3)))));
            end
          else
            begin
              reg7 <= (wire1 | $signed(((|$unsigned(wire2)) ?
                  wire0[(2'h2):(1'h0)] : (-(wire1 <<< wire3)))));
              reg8 <= wire2;
            end
          reg9 <= ($unsigned((|$signed($signed((8'hb9))))) ?
              ($unsigned($signed(reg6)) ?
                  reg6 : ((~&(reg8 < reg5)) ?
                      $unsigned({(8'hbb)}) : wire0[(1'h1):(1'h0)])) : wire4[(3'h4):(2'h3)]);
        end
      if ((8'hb3))
        begin
          if ($signed({wire0[(1'h0):(1'h0)]}))
            begin
              reg10 <= (-(8'hb8));
              reg11 <= (reg5 & {$signed($unsigned($unsigned(wire1))),
                  (reg9 ? reg8[(4'hb):(1'h0)] : ($unsigned(reg6) - (&wire3)))});
              reg12 <= (|{(-wire4)});
              reg13 <= $signed({(reg12[(3'h4):(1'h0)] >> $signed($signed((8'ha7)))),
                  (((wire4 < wire1) > (8'haf)) ?
                      reg8[(3'h7):(1'h1)] : {reg10[(2'h3):(2'h2)],
                          (reg7 & (7'h44))})});
            end
          else
            begin
              reg10 <= wire4[(2'h3):(1'h0)];
              reg11 <= $signed((~^(((reg12 ? reg10 : reg7) ?
                      reg10 : ((7'h43) || reg5)) ?
                  wire2[(1'h0):(1'h0)] : reg6[(2'h2):(2'h2)])));
              reg12 <= ((~reg9) || $unsigned(reg6));
              reg13 <= (8'hbd);
            end
          if ({(reg13[(3'h6):(2'h3)] < $signed(reg6[(3'h4):(1'h0)]))})
            begin
              reg14 <= reg6;
            end
          else
            begin
              reg14 <= reg7;
              reg15 <= wire2;
              reg16 <= ($unsigned($signed(({(8'hbf),
                  reg6} + reg10[(2'h2):(1'h0)]))) <<< reg8);
            end
          reg17 <= reg7[(1'h0):(1'h0)];
          reg18 <= {$signed(($signed((reg9 >= (8'hbb))) ?
                  reg8[(1'h0):(1'h0)] : {$signed(reg7)}))};
        end
      else
        begin
          reg10 <= (^~reg5[(3'h6):(2'h2)]);
          if ((reg6[(3'h6):(3'h4)] == $signed((&reg5))))
            begin
              reg11 <= {($unsigned((^~$signed((8'hb3)))) ?
                      reg7[(2'h2):(2'h2)] : (wire0[(1'h1):(1'h1)] ~^ $unsigned((reg15 ?
                          (8'h9c) : wire0)))),
                  $signed(($unsigned(reg13[(1'h1):(1'h0)]) ?
                      {$unsigned(reg13)} : reg18))};
              reg12 <= $signed(($signed(reg15) ?
                  $unsigned(reg10[(2'h3):(1'h1)]) : $signed($unsigned((-wire2)))));
              reg13 <= (^~((!$signed((reg15 - (8'ha4)))) ?
                  reg8 : (((~^wire1) && $unsigned(reg14)) + $unsigned($unsigned(reg9)))));
              reg14 <= reg16;
            end
          else
            begin
              reg11 <= reg13;
              reg12 <= (!$unsigned(wire3));
              reg13 <= wire0;
              reg14 <= (+(~{{(^wire1)}}));
              reg15 <= reg13[(2'h3):(1'h0)];
            end
          reg16 <= ((~^(&reg6)) ?
              ((wire0 ? (~|(reg8 <<< reg9)) : (^~$unsigned(reg13))) ?
                  (reg16 ? (wire4 ? $signed(reg17) : reg5) : wire1) : ({wire0} ?
                      reg13[(2'h3):(1'h1)] : reg17[(2'h2):(1'h0)])) : (!(wire4 * (8'hb8))));
          reg17 <= reg17;
          reg18 <= reg9[(4'he):(4'ha)];
        end
      if (reg7)
        begin
          reg19 <= $signed({((~&((8'hbd) < wire0)) ?
                  ($signed(reg17) ?
                      reg18 : (reg15 + (8'had))) : reg18[(4'hc):(4'hb)])});
          if (reg12[(2'h2):(2'h2)])
            begin
              reg20 <= $signed(({$signed(wire3)} ?
                  reg6[(1'h0):(1'h0)] : reg18[(4'hc):(4'hc)]));
              reg21 <= $signed($signed($signed($unsigned(reg18))));
              reg22 <= reg8;
              reg23 <= {((reg8 ?
                      ($unsigned(reg6) ?
                          $unsigned(reg13) : reg9[(4'ha):(4'h8)]) : $unsigned((~|(8'hac)))) >>> ($unsigned($signed(reg6)) ?
                      (((8'ha5) ? reg6 : reg18) >> (8'hb2)) : ({reg9,
                          reg7} >> {reg16}))),
                  $unsigned($unsigned(reg13))};
            end
          else
            begin
              reg20 <= $unsigned((reg21[(3'h7):(3'h4)] ?
                  wire3 : reg19[(4'h8):(3'h7)]));
              reg21 <= reg12[(1'h0):(1'h0)];
              reg22 <= $unsigned(((^($signed(reg5) ?
                      $unsigned(wire0) : (!(8'ha9)))) ?
                  (~reg14) : {$signed($signed(wire0)),
                      {{(8'had)}, $signed(reg18)}}));
            end
          if ((($signed(wire1[(2'h3):(2'h3)]) ?
                  (($unsigned(reg20) & (~|(8'hb5))) > $signed($unsigned(reg14))) : reg9[(3'h7):(3'h6)]) ?
              $signed(($unsigned({reg11}) <= wire4)) : $signed({$unsigned((reg9 ?
                      reg21 : (8'hac)))})))
            begin
              reg24 <= (|((8'hae) ?
                  $unsigned((8'hb0)) : (!$signed((reg13 ? (8'hb9) : wire4)))));
              reg25 <= (~|(reg19[(3'h6):(3'h6)] - $unsigned(((reg6 >> (8'ha4)) <= $unsigned(reg12)))));
              reg26 <= ($signed((~^$signed($signed(wire4)))) >>> (~|$signed($unsigned((reg13 ~^ reg7)))));
            end
          else
            begin
              reg24 <= ($unsigned(wire3) ?
                  reg7[(1'h0):(1'h0)] : (~^($signed($unsigned(reg10)) ?
                      wire0 : ($signed(wire1) < (reg12 * reg7)))));
              reg25 <= $signed(reg16);
            end
          if (wire3[(5'h12):(3'h7)])
            begin
              reg27 <= wire3;
              reg28 <= (reg8 ?
                  reg21[(3'h4):(2'h2)] : $unsigned(reg15[(2'h2):(1'h1)]));
            end
          else
            begin
              reg27 <= reg14[(4'ha):(1'h1)];
              reg28 <= reg23;
              reg29 <= $signed(($signed(wire3[(2'h2):(1'h0)]) ?
                  (~^(((8'hb2) ? reg15 : reg13) ? (~|wire0) : reg23)) : reg19));
            end
        end
      else
        begin
          reg19 <= $signed((-(&(~&$unsigned(reg17)))));
          reg20 <= reg19[(2'h3):(2'h2)];
          if (($unsigned(wire4[(1'h1):(1'h0)]) || (($signed((reg14 ?
                      reg26 : reg16)) ?
                  ((reg28 >> wire4) ?
                      $unsigned((8'ha2)) : ((8'hb6) ^~ reg29)) : (reg22[(4'h8):(3'h7)] ?
                      ((7'h41) >= reg18) : (~|reg25))) ?
              ((reg8 ~^ ((8'ha1) ? reg24 : wire0)) ?
                  reg28 : ((-(8'haf)) ? (~&reg11) : {(8'hae)})) : (~|reg28))))
            begin
              reg21 <= reg14;
            end
          else
            begin
              reg21 <= {$unsigned($unsigned(((~&reg23) << (reg27 * reg20))))};
              reg22 <= $unsigned((|reg10));
            end
        end
    end
  assign wire30 = (^$signed(reg11[(3'h4):(2'h2)]));
  assign wire31 = (wire0[(2'h3):(1'h0)] ?
                      {(reg18 > (reg12[(1'h0):(1'h0)] ?
                              $signed(wire4) : (reg18 ?
                                  reg11 : reg22)))} : reg22[(4'he):(3'h4)]);
  module32 #() modinst102 (wire101, clk, reg25, reg11, reg7, reg26, reg28);
  assign wire103 = ({$signed($signed(reg23)), reg14} ? reg9 : reg19);
  assign wire104 = $signed($signed($signed(wire1[(3'h7):(3'h7)])));
  module105 #() modinst174 (wire173, clk, reg28, wire104, reg22, reg24);
  always
    @(posedge clk) begin
      reg175 <= $unsigned(($unsigned((~&(reg7 ?
          (8'hb9) : wire3))) <= $unsigned(($unsigned(reg22) << (&wire104)))));
      reg176 <= reg18;
      reg177 <= (8'ha8);
      reg178 <= ((8'hae) || {((((8'had) >= (8'h9f)) ?
              $signed(wire103) : $signed(reg16)) - (-(reg11 != (8'ha5)))),
          (!(~|reg16))});
    end
  assign wire179 = reg29;
  assign wire180 = ($unsigned($signed(($unsigned(wire30) <= (~^(8'hbb))))) || reg11);
  always
    @(posedge clk) begin
      reg181 <= ((~(^((reg18 << reg9) <= (~&reg12)))) < wire30[(4'h9):(3'h7)]);
      reg182 <= ($unsigned(reg181[(4'hd):(4'hb)]) >>> reg27);
    end
endmodule

module module105  (y, clk, wire106, wire107, wire108, wire109);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire106;
  input wire [(5'h12):(1'h0)] wire107;
  input wire [(4'hb):(1'h0)] wire108;
  input wire signed [(5'h15):(1'h0)] wire109;
  wire [(4'h9):(1'h0)] wire171;
  wire signed [(5'h13):(1'h0)] wire146;
  wire signed [(4'hc):(1'h0)] wire145;
  wire signed [(2'h3):(1'h0)] wire144;
  wire signed [(5'h14):(1'h0)] wire110;
  wire signed [(4'h9):(1'h0)] wire142;
  reg [(5'h14):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg149 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg150 = (1'h0);
  reg [(3'h6):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg152 = (1'h0);
  assign y = {wire171,
                 wire146,
                 wire145,
                 wire144,
                 wire110,
                 wire142,
                 reg147,
                 reg148,
                 reg149,
                 reg150,
                 reg151,
                 reg152,
                 (1'h0)};
  assign wire110 = wire109[(3'h5):(1'h1)];
  module111 #() modinst143 (wire142, clk, wire106, wire110, wire107, wire109, wire108);
  assign wire144 = {$unsigned(((~&(~^(8'ha3))) ?
                           $unsigned(wire107[(4'hb):(3'h7)]) : wire107)),
                       ((~&wire107[(4'hf):(1'h1)]) ?
                           (&$signed($unsigned(wire107))) : ((wire107 ?
                                   $signed(wire110) : wire108[(2'h3):(1'h0)]) ?
                               wire107[(5'h12):(3'h5)] : (~&{wire142,
                                   wire107})))};
  assign wire145 = wire144;
  assign wire146 = (^~wire145[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg147 <= wire144[(2'h2):(1'h0)];
      reg148 <= wire108;
      if ($unsigned((wire146 << (^~$unsigned($unsigned(wire145))))))
        begin
          if ($signed($unsigned((!$signed(((8'hb5) - wire106))))))
            begin
              reg149 <= (reg148[(4'he):(4'ha)] || ((((wire109 + wire108) > (!(8'hb0))) ^~ (wire106[(4'hc):(1'h1)] ?
                      $signed(wire142) : $signed(wire106))) ?
                  (({(7'h44)} ?
                      ((8'hb4) ?
                          wire108 : wire146) : $unsigned(wire109)) ^ reg148[(5'h14):(4'hf)]) : $signed($unsigned($signed(wire144)))));
              reg150 <= $signed(($signed((wire142[(2'h2):(1'h0)] && $unsigned(wire109))) ?
                  (($signed(wire110) < {wire110, (8'ha3)}) ?
                      wire145[(2'h2):(2'h2)] : {wire146,
                          $signed(wire110)}) : wire106));
              reg151 <= $signed((((wire146 ?
                          {(8'ha7), reg149} : reg148[(3'h7):(3'h5)]) ?
                      ((reg148 >> (8'ha2)) ?
                          ((7'h43) != wire109) : wire108[(3'h4):(2'h3)]) : $signed((wire108 ?
                          wire145 : wire106))) ?
                  $signed($signed(wire110[(4'hc):(2'h3)])) : wire142[(2'h2):(1'h1)]));
            end
          else
            begin
              reg149 <= (reg147 ? $unsigned(wire108) : (+(|wire107)));
              reg150 <= reg149;
              reg151 <= (|(({(wire144 ? (8'ha9) : reg147),
                      {wire142}} && reg148) ?
                  $signed(((reg149 <= (8'ha2)) ?
                      (8'hb9) : wire145[(4'hc):(4'h9)])) : wire107[(1'h0):(1'h0)]));
            end
        end
      else
        begin
          reg149 <= $signed($unsigned((wire109[(2'h2):(2'h2)] - (|(reg147 >= (8'hb7))))));
        end
      reg152 <= $signed(($unsigned(wire108[(3'h5):(3'h4)]) ?
          (+$unsigned(reg149)) : (~($signed(wire144) <= (^~wire109)))));
    end
  module153 #() modinst172 (wire171, clk, reg148, wire142, wire146, reg149, reg150);
endmodule

module module32
#(parameter param99 = (^~((((-(7'h40)) ? ((8'hbd) < (7'h41)) : (~|(8'hb7))) ? (((8'ha5) ? (8'ha7) : (8'hb6)) >= ((8'hbe) ? (8'hbb) : (8'hb5))) : {{(8'hb3)}}) + {((&(7'h40)) ? ((8'hb9) ? (7'h42) : (8'ha6)) : ((8'ha4) ? (8'ha6) : (8'hb5))), {{(8'haa)}}})), 
parameter param100 = param99)
(y, clk, wire33, wire34, wire35, wire36, wire37);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire33;
  input wire signed [(3'h4):(1'h0)] wire34;
  input wire [(5'h15):(1'h0)] wire35;
  input wire [(5'h10):(1'h0)] wire36;
  input wire [(4'ha):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire98;
  wire [(2'h2):(1'h0)] wire97;
  wire [(4'ha):(1'h0)] wire96;
  wire [(4'hb):(1'h0)] wire95;
  wire signed [(5'h13):(1'h0)] wire94;
  wire [(4'hd):(1'h0)] wire93;
  wire [(4'hd):(1'h0)] wire92;
  wire signed [(3'h6):(1'h0)] wire91;
  wire [(5'h14):(1'h0)] wire90;
  wire [(4'h9):(1'h0)] wire89;
  wire signed [(5'h13):(1'h0)] wire88;
  wire signed [(2'h2):(1'h0)] wire38;
  wire signed [(4'h8):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire40;
  wire signed [(3'h7):(1'h0)] wire41;
  wire [(5'h12):(1'h0)] wire42;
  wire signed [(3'h5):(1'h0)] wire86;
  assign y = {wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire42,
                 wire86,
                 (1'h0)};
  assign wire38 = $unsigned($unsigned((wire33[(2'h2):(1'h0)] ?
                      wire36 : (wire34[(1'h0):(1'h0)] ?
                          $signed(wire34) : (wire37 && wire34)))));
  assign wire39 = $unsigned(wire35[(2'h2):(2'h2)]);
  assign wire40 = $signed(wire36);
  assign wire41 = (8'hb2);
  assign wire42 = $unsigned(wire33);
  module43 #() modinst87 (wire86, clk, wire37, wire39, wire36, wire35, wire33);
  assign wire88 = {(&{wire33[(4'h9):(2'h2)]})};
  assign wire89 = wire38[(2'h2):(1'h1)];
  assign wire90 = wire86[(1'h1):(1'h1)];
  assign wire91 = (~|wire88);
  assign wire92 = ((8'hb6) <= wire88[(3'h7):(2'h3)]);
  assign wire93 = ((wire86 ?
                          ($signed({wire36}) ?
                              $unsigned((wire40 ?
                                  wire92 : wire92)) : $unsigned(wire90[(3'h5):(3'h4)])) : $signed($unsigned($signed(wire33)))) ?
                      ((~^$signed((wire35 == wire90))) ?
                          {(wire86 ?
                                  (wire92 ?
                                      wire34 : wire86) : (-wire39))} : (8'ha6)) : ({wire37[(3'h7):(3'h5)],
                          wire39[(3'h5):(2'h3)]} >>> wire38[(1'h0):(1'h0)]));
  assign wire94 = wire42;
  assign wire95 = ($signed((wire39[(4'h8):(3'h6)] >> $unsigned((^~wire94)))) ?
                      $unsigned(wire90) : (wire91[(3'h5):(1'h1)] ?
                          ((wire34 * $unsigned(wire35)) ?
                              $unsigned($unsigned(wire91)) : $unsigned($unsigned(wire38))) : (wire37 ?
                              ((wire40 ?
                                  wire34 : (7'h41)) <= $unsigned(wire91)) : $unsigned(wire90))));
  assign wire96 = $signed($signed(($signed($unsigned((8'haa))) | ({wire39,
                      wire39} || {wire36}))));
  assign wire97 = (-($unsigned(wire86) || $signed(((wire95 ? wire40 : wire37) ?
                      (+(8'ha9)) : {wire33}))));
  assign wire98 = (wire96 && (-(((wire92 + wire35) >> wire94) >= $signed(((8'h9d) ?
                      wire38 : wire92)))));
endmodule

module module43
#(parameter param84 = (&(((((8'hb8) == (8'hbd)) + (~|(8'hbc))) ? (((8'hb4) ? (8'ha4) : (8'hb1)) <= {(8'hba)}) : {{(8'hbe)}}) && (&(8'ha4)))), 
parameter param85 = (^param84))
(y, clk, wire48, wire47, wire46, wire45, wire44);
  output wire [(32'h1c3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire48;
  input wire [(3'h4):(1'h0)] wire47;
  input wire [(3'h4):(1'h0)] wire46;
  input wire signed [(5'h15):(1'h0)] wire45;
  input wire [(5'h14):(1'h0)] wire44;
  wire signed [(4'he):(1'h0)] wire83;
  wire [(5'h12):(1'h0)] wire82;
  wire [(4'he):(1'h0)] wire81;
  wire signed [(4'he):(1'h0)] wire80;
  wire [(5'h15):(1'h0)] wire65;
  wire [(4'hc):(1'h0)] wire64;
  wire [(5'h12):(1'h0)] wire63;
  wire signed [(4'hf):(1'h0)] wire55;
  wire signed [(5'h13):(1'h0)] wire54;
  wire signed [(5'h10):(1'h0)] wire53;
  wire signed [(4'he):(1'h0)] wire52;
  wire signed [(5'h14):(1'h0)] wire51;
  wire [(3'h4):(1'h0)] wire50;
  wire signed [(4'hd):(1'h0)] wire49;
  reg signed [(4'hf):(1'h0)] reg79 = (1'h0);
  reg [(2'h3):(1'h0)] reg78 = (1'h0);
  reg [(5'h14):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg76 = (1'h0);
  reg [(5'h15):(1'h0)] reg75 = (1'h0);
  reg [(3'h5):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg73 = (1'h0);
  reg [(4'he):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg71 = (1'h0);
  reg signed [(4'he):(1'h0)] reg70 = (1'h0);
  reg [(4'hf):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg67 = (1'h0);
  reg [(4'he):(1'h0)] reg66 = (1'h0);
  reg [(2'h2):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(3'h7):(1'h0)] reg58 = (1'h0);
  reg [(4'hd):(1'h0)] reg57 = (1'h0);
  reg [(5'h12):(1'h0)] reg56 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire65,
                 wire64,
                 wire63,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 reg79,
                 reg78,
                 reg77,
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
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  assign wire49 = wire48;
  assign wire50 = (~^wire46[(1'h0):(1'h0)]);
  assign wire51 = (wire45 ?
                      $signed({wire46[(3'h4):(2'h3)],
                          wire44[(4'he):(3'h4)]}) : wire49);
  assign wire52 = wire45;
  assign wire53 = {{$signed(wire47[(3'h4):(3'h4)])},
                      (wire49 ?
                          ($unsigned($unsigned(wire52)) ?
                              (~|wire52[(3'h6):(2'h3)]) : {$unsigned(wire50),
                                  $unsigned(wire48)}) : (!wire48))};
  assign wire54 = (wire51[(3'h6):(3'h4)] >> wire46);
  assign wire55 = wire54;
  always
    @(posedge clk) begin
      reg56 <= (^~wire51[(4'hf):(4'ha)]);
      reg57 <= {wire46[(2'h2):(2'h2)], wire52[(4'hc):(4'hc)]};
      if (((~^$signed(({wire51} < {wire48, wire45}))) < $signed((wire45 ?
          $unsigned({wire52, wire53}) : $signed($unsigned(wire55))))))
        begin
          if ((!(&(~|((!wire51) ? (|wire51) : {wire49})))))
            begin
              reg58 <= (~|(~|$unsigned((((7'h41) ?
                  (8'hac) : reg56) | wire55))));
              reg59 <= wire47[(2'h2):(1'h1)];
            end
          else
            begin
              reg58 <= $unsigned(($signed(((wire48 ~^ reg57) ~^ wire49[(3'h6):(1'h0)])) ?
                  (|wire46[(1'h1):(1'h1)]) : reg57));
              reg59 <= ($signed(wire47[(2'h3):(2'h2)]) ?
                  (~&reg58[(3'h4):(2'h2)]) : (wire50[(1'h1):(1'h1)] ?
                      (wire48 * ($unsigned((8'had)) != $unsigned((8'ha5)))) : (^~reg56)));
            end
          reg60 <= ({wire44,
              ((reg59 ? wire46 : (~|(8'h9c))) ? wire49 : (8'ha0))} && wire54);
          reg61 <= (-$unsigned(((!reg56[(5'h12):(2'h3)]) ?
              wire49[(3'h6):(2'h2)] : ($unsigned(reg56) ?
                  (8'ha0) : {wire52}))));
        end
      else
        begin
          reg58 <= (8'hbb);
          reg59 <= $unsigned($unsigned((~&$signed($unsigned(wire53)))));
          reg60 <= $unsigned((($signed($unsigned(wire49)) | $unsigned(wire54[(2'h3):(2'h2)])) <= reg61));
        end
      reg62 <= wire52;
    end
  assign wire63 = $unsigned(reg60);
  assign wire64 = (!(((((8'ha4) >= reg61) ? reg58 : {reg62, wire63}) ?
                      wire50 : wire52[(4'ha):(4'h8)]) + (&(^~(wire53 && wire44)))));
  assign wire65 = $signed(((~(~$unsigned(wire63))) >= ((&wire64[(4'h9):(2'h3)]) >>> $signed(reg57[(2'h3):(2'h2)]))));
  always
    @(posedge clk) begin
      reg66 <= ((|{((wire64 ? wire54 : wire48) ?
                  (~^reg61) : ((8'hb1) ? (7'h44) : wire55))}) ?
          ((&$unsigned((^reg56))) ?
              $signed(wire49[(3'h6):(1'h1)]) : wire50[(1'h0):(1'h0)]) : (~|reg59));
      reg67 <= {(~|reg56), (^$signed(wire63[(4'hb):(2'h3)]))};
      if (reg56[(5'h10):(4'h9)])
        begin
          reg68 <= ($signed($signed(wire54[(3'h7):(3'h4)])) > (|($signed((wire49 << reg67)) > ((^~wire44) ?
              (wire65 ? reg60 : (8'hbe)) : $unsigned(wire54)))));
          reg69 <= (|$signed($unsigned($unsigned({reg61, (8'ha2)}))));
          if ((reg61[(2'h3):(2'h2)] ? $unsigned(reg58[(3'h5):(3'h4)]) : wire49))
            begin
              reg70 <= $unsigned((+wire65));
              reg71 <= $signed({$unsigned($unsigned((wire65 ?
                      wire45 : wire47)))});
              reg72 <= ($unsigned(reg62[(2'h2):(1'h1)]) ?
                  ((+$signed($unsigned(wire46))) ?
                      $unsigned((~&(reg68 != reg62))) : {(!(wire63 ?
                              reg71 : (8'ha0)))}) : ($signed($unsigned((-wire65))) ?
                      reg59 : $signed($signed((reg67 ? wire47 : wire46)))));
              reg73 <= (($unsigned(wire47[(2'h3):(2'h3)]) ?
                      wire46[(1'h1):(1'h0)] : ({$signed(wire44)} << $unsigned(wire47[(1'h1):(1'h1)]))) ?
                  {wire46} : (|reg71));
              reg74 <= $signed((8'hba));
            end
          else
            begin
              reg70 <= $signed($unsigned(wire44));
              reg71 <= $unsigned($signed((!{$unsigned((8'hab)), (8'hbc)})));
            end
          reg75 <= $unsigned((&$unsigned({(~reg59), (wire53 < (8'h9c))})));
        end
      else
        begin
          reg68 <= reg71[(3'h4):(2'h3)];
        end
      reg76 <= $signed(reg75[(3'h4):(1'h0)]);
      if (reg69[(3'h4):(2'h3)])
        begin
          reg77 <= reg72;
        end
      else
        begin
          reg77 <= {$unsigned((^(~{wire54, wire65})))};
          if (reg72)
            begin
              reg78 <= $unsigned(reg58);
              reg79 <= reg66[(4'hc):(3'h6)];
            end
          else
            begin
              reg78 <= $signed($signed($unsigned(wire49)));
              reg79 <= reg75[(3'h6):(3'h6)];
            end
        end
    end
  assign wire80 = $signed((reg74 & $signed(((reg67 > reg66) || reg72[(4'ha):(4'h9)]))));
  assign wire81 = $signed(reg57[(4'hb):(4'h8)]);
  assign wire82 = $signed($unsigned($signed((wire65 ?
                      reg59 : wire64[(2'h3):(2'h2)]))));
  assign wire83 = reg76;
endmodule

module module153  (y, clk, wire158, wire157, wire156, wire155, wire154);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire158;
  input wire signed [(3'h6):(1'h0)] wire157;
  input wire [(5'h13):(1'h0)] wire156;
  input wire [(2'h3):(1'h0)] wire155;
  input wire [(2'h3):(1'h0)] wire154;
  wire signed [(5'h11):(1'h0)] wire170;
  wire [(4'hf):(1'h0)] wire169;
  wire signed [(4'h8):(1'h0)] wire168;
  wire [(4'h9):(1'h0)] wire167;
  wire signed [(5'h11):(1'h0)] wire166;
  wire signed [(5'h15):(1'h0)] wire165;
  wire signed [(5'h13):(1'h0)] wire164;
  wire [(3'h4):(1'h0)] wire163;
  wire [(5'h13):(1'h0)] wire162;
  wire signed [(3'h6):(1'h0)] wire161;
  wire signed [(4'h9):(1'h0)] wire160;
  wire signed [(4'he):(1'h0)] wire159;
  assign y = {wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 (1'h0)};
  assign wire159 = $unsigned((wire156 ?
                       ((wire158 <= (8'hb3)) ~^ wire156[(3'h7):(2'h3)]) : (^~$signed((8'ha4)))));
  assign wire160 = wire155;
  assign wire161 = $unsigned(wire155);
  assign wire162 = {$signed(wire155[(1'h1):(1'h0)])};
  assign wire163 = $unsigned({($unsigned(wire158[(2'h2):(2'h2)]) <= {$signed((7'h43))}),
                       $unsigned(wire157)});
  assign wire164 = ((wire154[(1'h0):(1'h0)] <<< wire154[(1'h0):(1'h0)]) ?
                       $signed((($signed((8'had)) ?
                               (wire163 ? wire161 : wire159) : (&wire163)) ?
                           wire157[(3'h4):(3'h4)] : $unsigned({wire159}))) : wire155[(1'h1):(1'h0)]);
  assign wire165 = $unsigned((((wire157 < $signed(wire157)) ?
                           ((wire155 ? wire161 : wire160) << (wire163 ?
                               wire158 : wire158)) : ($signed(wire158) << wire156)) ?
                       $signed({(~wire157)}) : (~^$signed({wire163,
                           wire156}))));
  assign wire166 = $signed((^wire164));
  assign wire167 = ($unsigned($signed($unsigned((^~wire156)))) <= $signed($signed(wire159)));
  assign wire168 = ({(($signed(wire163) ?
                               (wire155 ^~ wire159) : (wire163 || wire157)) < (|(wire157 ~^ wire166))),
                           {(-$unsigned((8'hb7))), wire158}} ?
                       $signed($signed(((wire167 ? wire158 : (8'haf)) ?
                           wire164[(4'hd):(4'ha)] : $signed((8'had))))) : (!(8'h9f)));
  assign wire169 = wire157[(2'h3):(2'h2)];
  assign wire170 = wire154;
endmodule

module module111
#(parameter param141 = {(~|((((8'h9c) ? (7'h43) : (8'ha1)) ? {(8'h9d)} : (-(8'hbd))) >>> (&(^~(8'hb3))))), ((|(((8'hb7) ? (8'haa) : (7'h40)) & {(8'hba), (8'h9c)})) ? ((((8'hbc) <= (8'hb8)) ? ((8'hbb) ? (8'haf) : (8'hbc)) : ((8'haf) >>> (8'hac))) && (((7'h44) ? (8'hb6) : (8'ha5)) ? (8'ha9) : (-(8'hb3)))) : ((|((8'hb3) ? (8'ha2) : (8'haf))) ? (((7'h41) ? (8'haa) : (8'h9c)) ? ((8'hb9) ? (8'ha6) : (8'hbb)) : (^(8'ha4))) : (^(8'haa))))})
(y, clk, wire116, wire115, wire114, wire113, wire112);
  output wire [(32'h113):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire116;
  input wire [(4'ha):(1'h0)] wire115;
  input wire signed [(4'hb):(1'h0)] wire114;
  input wire [(5'h15):(1'h0)] wire113;
  input wire [(4'hb):(1'h0)] wire112;
  wire [(2'h2):(1'h0)] wire140;
  wire [(5'h11):(1'h0)] wire139;
  wire signed [(5'h13):(1'h0)] wire138;
  wire [(4'hf):(1'h0)] wire137;
  wire signed [(3'h4):(1'h0)] wire132;
  wire [(2'h3):(1'h0)] wire131;
  wire signed [(5'h13):(1'h0)] wire130;
  wire [(3'h5):(1'h0)] wire129;
  wire signed [(4'ha):(1'h0)] wire128;
  wire [(4'h9):(1'h0)] wire127;
  wire [(4'h9):(1'h0)] wire122;
  wire signed [(4'hf):(1'h0)] wire121;
  wire signed [(3'h4):(1'h0)] wire120;
  wire [(2'h3):(1'h0)] wire119;
  wire signed [(4'ha):(1'h0)] wire118;
  wire signed [(5'h15):(1'h0)] wire117;
  reg signed [(5'h12):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg125 = (1'h0);
  reg [(3'h5):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg123 = (1'h0);
  assign y = {wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 (1'h0)};
  assign wire117 = wire114;
  assign wire118 = {(&(&wire114)), (~&(~^{wire114, (+wire117)}))};
  assign wire119 = ((($signed({wire117}) ^ ({wire113, wire118} ?
                       $signed(wire114) : wire112)) < wire115) >> ($unsigned(wire118) < ((|{wire113}) ?
                       $unsigned((!wire114)) : (!$unsigned(wire118)))));
  assign wire120 = $unsigned(($signed((!((8'hbe) ? wire118 : (8'ha2)))) ?
                       ((|(|wire115)) ?
                           (wire118 != (~wire118)) : wire112[(4'ha):(1'h0)]) : ((~&(wire118 ?
                           (8'hb7) : wire115)) >> (!(^wire116)))));
  assign wire121 = (^$signed($signed({wire115[(4'ha):(3'h7)]})));
  assign wire122 = $unsigned($unsigned(($unsigned((wire112 ?
                           wire114 : wire114)) ?
                       ($unsigned(wire117) ?
                           $unsigned((8'hb8)) : $signed(wire113)) : ((+wire119) ?
                           (-(8'ha8)) : (wire114 ? wire119 : wire113)))));
  always
    @(posedge clk) begin
      reg123 <= wire118;
      reg124 <= $unsigned($signed((wire114 ?
          (~|((7'h41) ? wire118 : wire113)) : $signed(((7'h44) >> wire113)))));
      reg125 <= $unsigned(($unsigned(({wire120} + (wire122 ?
              wire118 : wire114))) ?
          $signed((8'hb2)) : wire113[(5'h12):(4'hf)]));
    end
  always
    @(posedge clk) begin
      reg126 <= $signed({(~&$signed($signed(wire114))), $unsigned(reg125)});
    end
  assign wire127 = wire121[(4'h9):(2'h3)];
  assign wire128 = reg123;
  assign wire129 = ({(!{$signed(reg126)})} ?
                       ((-$signed($unsigned(wire118))) ?
                           wire121 : (~((~|wire117) <<< reg126[(4'hd):(2'h3)]))) : (reg125[(1'h1):(1'h0)] ^ (reg124 | ($signed(reg126) ?
                           (^reg126) : $unsigned(wire121)))));
  assign wire130 = (wire117[(2'h2):(1'h1)] >= $unsigned($signed($signed(wire112[(4'h8):(2'h3)]))));
  assign wire131 = $signed(((wire127[(2'h3):(2'h3)] ?
                       (+(wire128 ^~ reg126)) : (wire121[(3'h4):(2'h3)] ?
                           $signed(wire120) : (!wire112))) - ($signed($signed(wire122)) ?
                       (^wire122) : wire117)));
  assign wire132 = $signed((~&wire120[(2'h2):(1'h1)]));
  always
    @(posedge clk) begin
      reg133 <= ({(+$signed($signed((8'hb7))))} ?
          ((((reg125 * wire116) ^ (&wire120)) - ({wire132,
              wire119} < (wire119 >> wire116))) == ({(wire113 + wire112)} ~^ ($signed((8'hbc)) + (wire122 ?
              reg126 : (7'h43))))) : (|$unsigned(wire117)));
      reg134 <= (((wire118[(1'h0):(1'h0)] ?
              ((reg133 ? wire117 : (8'hbd)) <= (wire116 ?
                  wire121 : (8'hab))) : {$signed(wire117)}) | wire130) ?
          $unsigned($signed(((^~reg123) * $signed(wire112)))) : {(!$unsigned(reg126)),
              $unsigned((~^(8'hab)))});
      reg135 <= wire116;
      reg136 <= ($signed((reg134 ?
              (+(!wire121)) : (wire112[(3'h7):(3'h6)] ^~ $unsigned(wire114)))) ?
          $unsigned($signed({wire112[(3'h6):(1'h1)]})) : (~^(^{$unsigned(reg133)})));
    end
  assign wire137 = (wire115[(1'h1):(1'h1)] <<< (~$signed((+$signed(reg123)))));
  assign wire138 = $signed($unsigned((+wire115[(2'h2):(1'h0)])));
  assign wire139 = wire119;
  assign wire140 = $signed($signed($unsigned((reg124[(2'h3):(1'h1)] ?
                       $unsigned(wire128) : reg124[(2'h2):(1'h1)]))));
endmodule
