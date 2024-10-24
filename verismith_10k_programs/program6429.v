module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1b5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  wire signed [(4'he):(1'h0)] wire167;
  wire [(5'h11):(1'h0)] wire166;
  wire [(4'hf):(1'h0)] wire165;
  wire [(4'h8):(1'h0)] wire164;
  wire signed [(3'h5):(1'h0)] wire163;
  wire [(5'h10):(1'h0)] wire162;
  wire [(3'h6):(1'h0)] wire161;
  wire [(4'hb):(1'h0)] wire159;
  wire signed [(5'h11):(1'h0)] wire86;
  wire signed [(3'h7):(1'h0)] wire84;
  wire [(5'h15):(1'h0)] wire21;
  wire [(5'h15):(1'h0)] wire22;
  wire signed [(3'h7):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire24;
  wire signed [(4'hc):(1'h0)] wire25;
  wire signed [(5'h12):(1'h0)] wire26;
  wire [(2'h3):(1'h0)] wire82;
  reg signed [(3'h6):(1'h0)] reg4 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg5 = (1'h0);
  reg [(4'hf):(1'h0)] reg6 = (1'h0);
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg85 = (1'h0);
  assign y = {wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire159,
                 wire86,
                 wire84,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire82,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
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
                 reg19,
                 reg20,
                 reg85,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (~(~&wire1[(3'h5):(3'h4)]));
    end
  always
    @(posedge clk) begin
      reg5 <= (wire0[(3'h6):(3'h5)] >> $unsigned(reg4));
      reg6 <= ({$unsigned({$signed((8'hac))})} ?
          wire0 : ((~^((-reg5) ? $signed(wire2) : $unsigned(wire3))) ?
              ((wire3[(4'hd):(1'h1)] ? {(8'hbf)} : (reg5 < (8'ha2))) ?
                  $signed(((8'ha5) >> (7'h42))) : (~|(wire3 < reg5))) : ($unsigned((reg4 >= reg5)) < reg4[(1'h0):(1'h0)])));
      if ((|$unsigned($unsigned(reg5))))
        begin
          reg7 <= $unsigned((8'ha4));
          reg8 <= (+$signed({wire3[(4'h9):(3'h4)]}));
          reg9 <= reg5[(4'ha):(3'h5)];
          reg10 <= $unsigned($signed({((reg7 ? (8'hab) : reg6) ?
                  (reg6 < wire1) : reg5)}));
          reg11 <= (~&wire1[(4'h8):(3'h4)]);
        end
      else
        begin
          reg7 <= wire0[(4'h8):(1'h1)];
          if (reg11[(4'h9):(2'h2)])
            begin
              reg8 <= $signed(reg4);
              reg9 <= (reg4 ?
                  $unsigned((&(reg7 ?
                      (wire2 <<< wire3) : reg8))) : $unsigned(reg5[(5'h13):(4'hc)]));
              reg10 <= reg6[(4'hb):(2'h2)];
              reg11 <= ((^(^~$signed($unsigned(wire0)))) - $unsigned(reg5[(3'h6):(1'h0)]));
              reg12 <= wire3;
            end
          else
            begin
              reg8 <= $unsigned((wire1[(2'h2):(2'h2)] ?
                  {reg8[(3'h4):(3'h4)]} : $unsigned($unsigned((!wire2)))));
              reg9 <= {{wire1[(3'h6):(2'h3)]},
                  $unsigned((((reg12 ?
                          (8'had) : reg12) <= reg10[(4'he):(1'h0)]) ?
                      reg6[(1'h0):(1'h0)] : (reg10 || reg7)))};
              reg10 <= (8'hbc);
              reg11 <= ({reg6[(1'h1):(1'h0)]} ?
                  $unsigned($signed(reg10)) : (wire0[(3'h7):(1'h1)] ^~ {((reg11 & reg9) ?
                          (reg4 ? (7'h44) : reg4) : (reg5 ? reg11 : reg4))}));
            end
          reg13 <= $unsigned((((reg6[(3'h7):(3'h4)] ? (wire3 == reg4) : wire1) ?
              $unsigned(reg4[(1'h1):(1'h0)]) : reg11[(3'h7):(3'h7)]) * (reg11[(4'h9):(4'h8)] ?
              {(reg9 + reg8)} : reg4[(3'h5):(2'h3)])));
          if (({((+(reg11 ? wire2 : wire3)) > $unsigned($unsigned(wire0))),
                  $signed($signed($signed(reg5)))} ?
              {reg5[(1'h0):(1'h0)]} : reg12))
            begin
              reg14 <= (&wire3);
              reg15 <= $unsigned($signed(($unsigned($unsigned(wire3)) ?
                  {$unsigned(wire1), wire2} : $signed((reg9 == reg10)))));
              reg16 <= reg7;
              reg17 <= reg11;
            end
          else
            begin
              reg14 <= {({{(wire2 << reg5)}} > reg5[(5'h12):(1'h1)]),
                  reg16[(3'h4):(3'h4)]};
              reg15 <= $signed((&wire0));
              reg16 <= reg13[(3'h4):(3'h4)];
              reg17 <= $unsigned(reg4);
              reg18 <= $signed($signed(reg7));
            end
          reg19 <= $unsigned((8'hb5));
        end
      reg20 <= reg18[(4'h8):(1'h0)];
    end
  assign wire21 = {$signed(reg13[(3'h6):(1'h0)])};
  assign wire22 = (+$unsigned((((reg14 <= reg9) ?
                          (reg14 ? (7'h43) : reg11) : (wire1 <<< reg10)) ?
                      (reg16[(3'h7):(3'h5)] < (~&reg15)) : reg7)));
  assign wire23 = (((~|reg7) <= {wire0}) ?
                      $unsigned((&(^~(reg13 >= reg11)))) : (reg10 ?
                          (~|$signed(reg4[(3'h4):(2'h2)])) : wire22));
  assign wire24 = {{{$signed($unsigned(reg14))}, $unsigned(reg17)}};
  assign wire25 = (reg12 ? $unsigned(reg6) : reg7);
  assign wire26 = reg10[(4'he):(1'h0)];
  module27 #() modinst83 (wire82, clk, wire26, reg8, wire21, reg19, wire0);
  assign wire84 = (($signed((8'hb3)) ?
                          $signed({reg15[(2'h3):(2'h2)],
                              $unsigned(reg18)}) : reg9) ?
                      reg8 : $unsigned(reg8[(2'h3):(1'h0)]));
  always
    @(posedge clk) begin
      reg85 <= $unsigned((8'hb9));
    end
  assign wire86 = (^(^(((!reg5) ? wire2[(4'hb):(3'h4)] : (wire82 | reg9)) ?
                      (|((8'ha8) ? reg15 : wire23)) : wire24[(2'h2):(1'h1)])));
  module87 #() modinst160 (wire159, clk, wire0, reg15, reg19, reg6, wire2);
  assign wire161 = ($signed((wire2[(4'h8):(1'h0)] ?
                           $unsigned((^reg12)) : $unsigned($unsigned(reg20)))) ?
                       reg15[(5'h11):(4'he)] : (((&{reg12,
                               (8'hb4)}) != ($signed(reg8) ?
                               (reg12 ? (8'ha0) : (7'h42)) : ((8'h9e) ?
                                   reg20 : wire22))) ?
                           ((~&wire25) <<< reg8[(4'h9):(4'h8)]) : (~^(8'haa))));
  assign wire162 = ((wire3[(4'hb):(3'h7)] * reg10) == $signed($signed(reg6[(4'ha):(2'h3)])));
  assign wire163 = ($unsigned({(^~wire22[(3'h6):(3'h6)]),
                           $unsigned(wire26[(3'h6):(3'h6)])}) ?
                       (~$unsigned((reg19 ^ (reg5 ?
                           reg13 : (8'h9f))))) : $signed((((^~(8'h9d)) >>> (wire161 && wire86)) ?
                           {wire2, (&reg6)} : reg10[(4'hc):(4'hc)])));
  assign wire164 = (7'h43);
  assign wire165 = ((-(~^$unsigned((wire82 | (8'hbb))))) << wire21[(1'h1):(1'h0)]);
  assign wire166 = (~&(~$signed((8'h9c))));
  assign wire167 = (((wire84[(2'h2):(1'h1)] ?
                           (^$signed(wire82)) : {$signed(reg11),
                               $unsigned(wire82)}) ?
                       (((~^reg9) ^ wire3[(4'hc):(1'h0)]) && wire161) : (8'h9c)) - {(($unsigned(reg6) ?
                               $unsigned(wire2) : wire163) ?
                           (reg18[(2'h2):(2'h2)] > wire84) : $signed((wire165 && reg7))),
                       $unsigned(($unsigned(wire86) * reg16[(3'h5):(1'h1)]))});
endmodule

module module87  (y, clk, wire92, wire91, wire90, wire89, wire88);
  output wire [(32'hf3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire92;
  input wire [(5'h11):(1'h0)] wire91;
  input wire [(5'h11):(1'h0)] wire90;
  input wire [(4'hf):(1'h0)] wire89;
  input wire signed [(2'h2):(1'h0)] wire88;
  wire signed [(4'h8):(1'h0)] wire158;
  wire signed [(5'h13):(1'h0)] wire157;
  wire [(2'h3):(1'h0)] wire156;
  wire [(4'ha):(1'h0)] wire155;
  wire [(5'h15):(1'h0)] wire154;
  wire signed [(2'h3):(1'h0)] wire153;
  wire [(5'h12):(1'h0)] wire152;
  wire [(5'h13):(1'h0)] wire151;
  wire [(3'h5):(1'h0)] wire150;
  wire [(5'h10):(1'h0)] wire149;
  wire signed [(4'hb):(1'h0)] wire146;
  wire [(4'hf):(1'h0)] wire145;
  wire [(4'ha):(1'h0)] wire144;
  wire [(4'he):(1'h0)] wire142;
  wire [(4'ha):(1'h0)] wire95;
  wire [(4'hf):(1'h0)] wire94;
  wire [(5'h14):(1'h0)] wire93;
  reg [(5'h14):(1'h0)] reg148 = (1'h0);
  reg [(3'h5):(1'h0)] reg147 = (1'h0);
  assign y = {wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire146,
                 wire145,
                 wire144,
                 wire142,
                 wire95,
                 wire94,
                 wire93,
                 reg148,
                 reg147,
                 (1'h0)};
  assign wire93 = {{$signed(($unsigned(wire92) > $unsigned(wire91))),
                          {((!wire91) ?
                                  $unsigned(wire88) : wire89[(1'h1):(1'h1)])}},
                      $unsigned($signed((&(wire90 ? wire90 : wire90))))};
  assign wire94 = wire90[(5'h10):(2'h3)];
  assign wire95 = ((^~(wire88 & $signed(wire92))) ?
                      $unsigned(wire91[(5'h10):(4'hd)]) : $unsigned((wire92[(4'hc):(2'h3)] <<< (wire92[(4'he):(4'h8)] >> (^wire93)))));
  module96 #() modinst143 (.clk(clk), .wire100(wire94), .y(wire142), .wire97(wire95), .wire99(wire89), .wire98(wire91));
  assign wire144 = wire88[(2'h2):(1'h1)];
  assign wire145 = (($signed(wire89) ?
                           (wire93 ?
                               $unsigned(wire144[(3'h7):(3'h4)]) : {$unsigned(wire142)}) : wire89) ?
                       (8'hb4) : (($unsigned($signed(wire95)) < (^~$signed((8'haa)))) ?
                           wire93[(3'h7):(3'h7)] : $signed($signed((&wire90)))));
  assign wire146 = $unsigned($signed($signed({(!wire145), (^~wire144)})));
  always
    @(posedge clk) begin
      reg147 <= ((~&$signed((~&{(8'h9c), wire88}))) ?
          wire95 : $unsigned($signed((wire144[(4'ha):(3'h5)] ?
              wire95[(1'h1):(1'h0)] : (wire90 ? wire88 : wire146)))));
      reg148 <= $unsigned({$signed($unsigned($signed(wire145))),
          wire145[(1'h1):(1'h1)]});
    end
  assign wire149 = ($signed($unsigned((!$unsigned((8'hba))))) ?
                       {{wire142, (~$signed((8'hac)))},
                           (|(wire94[(3'h6):(3'h6)] >> $signed(wire92)))} : wire89[(4'hd):(4'hc)]);
  assign wire150 = $unsigned((~^$unsigned((8'hbb))));
  assign wire151 = $unsigned(wire90);
  assign wire152 = ((~|{(reg147 * $signed(wire90))}) ^ {(($signed(wire91) == $signed(wire142)) - (~^((8'had) ?
                           reg148 : reg147))),
                       (($signed(wire89) ?
                           (~|wire90) : (-wire151)) != wire94)});
  assign wire153 = wire144[(3'h7):(3'h4)];
  assign wire154 = $signed((~&$unsigned($unsigned(wire144))));
  assign wire155 = reg148;
  assign wire156 = ((^~{wire152,
                       wire151}) <<< $unsigned(wire89[(3'h7):(2'h3)]));
  assign wire157 = (wire154 <= (^~wire155[(1'h1):(1'h1)]));
  assign wire158 = wire93[(3'h4):(2'h3)];
endmodule

module module27
#(parameter param81 = ((+((!((8'hba) || (8'hbc))) == {((8'hb7) ? (8'hb5) : (8'hb8)), (~^(8'h9e))})) ? (((|((8'hb1) ? (8'hac) : (8'hba))) ? ((^~(8'hba)) != ((8'had) ? (8'hb4) : (8'h9e))) : (&(^(8'ha5)))) && {(((8'h9e) ^~ (8'ha9)) ? ((8'hb4) >> (8'hb2)) : (~(8'hb1))), (7'h42)}) : (^(!(((8'hbc) ? (8'hb9) : (8'hbf)) ? ((8'hb0) ? (8'hb9) : (8'h9d)) : (^(8'ha4)))))))
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire32;
  input wire signed [(5'h14):(1'h0)] wire31;
  input wire [(4'he):(1'h0)] wire30;
  input wire signed [(4'hf):(1'h0)] wire29;
  input wire signed [(5'h14):(1'h0)] wire28;
  wire signed [(3'h4):(1'h0)] wire80;
  wire [(5'h10):(1'h0)] wire79;
  wire [(5'h12):(1'h0)] wire78;
  wire signed [(4'he):(1'h0)] wire56;
  wire signed [(5'h14):(1'h0)] wire58;
  wire signed [(4'hc):(1'h0)] wire76;
  assign y = {wire80, wire79, wire78, wire56, wire58, wire76, (1'h0)};
  module33 #() modinst57 (wire56, clk, wire30, wire28, wire32, wire31, wire29);
  assign wire58 = (~|(wire28 ? wire32[(1'h1):(1'h1)] : $signed(wire56)));
  module59 #() modinst77 (.wire64(wire58), .wire62(wire29), .clk(clk), .y(wire76), .wire61(wire31), .wire60(wire56), .wire63(wire32));
  assign wire78 = $signed(wire30[(1'h1):(1'h0)]);
  assign wire79 = (wire32 >= $signed(wire31[(1'h1):(1'h1)]));
  assign wire80 = ($signed((~^wire30[(4'ha):(2'h3)])) > (^$signed(((wire78 << wire79) ?
                      wire78[(5'h12):(4'h8)] : (^~wire79)))));
endmodule

module module59  (y, clk, wire64, wire63, wire62, wire61, wire60);
  output wire [(32'h85):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire64;
  input wire signed [(5'h12):(1'h0)] wire63;
  input wire signed [(4'h9):(1'h0)] wire62;
  input wire signed [(3'h5):(1'h0)] wire61;
  input wire [(3'h5):(1'h0)] wire60;
  wire signed [(3'h5):(1'h0)] wire75;
  wire [(4'hb):(1'h0)] wire74;
  wire [(4'hc):(1'h0)] wire73;
  wire signed [(5'h12):(1'h0)] wire72;
  wire [(5'h15):(1'h0)] wire71;
  wire signed [(3'h7):(1'h0)] wire70;
  wire [(2'h2):(1'h0)] wire69;
  wire signed [(4'hd):(1'h0)] wire68;
  wire [(4'h8):(1'h0)] wire67;
  wire [(4'hf):(1'h0)] wire66;
  wire [(5'h14):(1'h0)] wire65;
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 (1'h0)};
  assign wire65 = ((&((wire63 ? ((8'hb9) ? wire64 : wire64) : wire63) ?
                          $unsigned((~^wire64)) : {(8'ha3),
                              wire64[(2'h2):(2'h2)]})) ?
                      $signed((wire62[(2'h2):(1'h0)] ?
                          {$unsigned(wire63)} : (~&(&wire61)))) : (wire61[(1'h1):(1'h1)] >> ({wire62[(3'h6):(3'h4)],
                              wire61} ?
                          wire64 : wire60)));
  assign wire66 = wire65[(5'h10):(4'hf)];
  assign wire67 = (wire61[(3'h4):(2'h3)] > ($signed(wire65) << ($unsigned(wire64[(2'h2):(1'h1)]) - (&(wire60 & wire64)))));
  assign wire68 = $unsigned(wire61[(2'h2):(1'h0)]);
  assign wire69 = (^wire66);
  assign wire70 = $signed($unsigned({$signed((^~wire64))}));
  assign wire71 = {wire60[(3'h5):(3'h5)]};
  assign wire72 = $unsigned((8'hb0));
  assign wire73 = wire60;
  assign wire74 = wire65[(4'he):(4'h9)];
  assign wire75 = $signed($unsigned(wire72[(2'h3):(2'h3)]));
endmodule

module module33
#(parameter param55 = (~^({(((8'hab) <<< (8'haf)) || ((8'ha9) >= (8'hae))), {{(8'ha4)}}} >> ((7'h44) >= (~(+(8'hb8)))))))
(y, clk, wire38, wire37, wire36, wire35, wire34);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire38;
  input wire [(3'h5):(1'h0)] wire37;
  input wire [(4'h8):(1'h0)] wire36;
  input wire signed [(5'h14):(1'h0)] wire35;
  input wire signed [(2'h2):(1'h0)] wire34;
  wire [(4'hc):(1'h0)] wire54;
  wire signed [(5'h11):(1'h0)] wire53;
  wire signed [(4'he):(1'h0)] wire52;
  wire [(4'hf):(1'h0)] wire51;
  wire signed [(4'hb):(1'h0)] wire50;
  wire [(5'h14):(1'h0)] wire47;
  wire [(5'h15):(1'h0)] wire46;
  wire signed [(5'h14):(1'h0)] wire45;
  wire [(5'h10):(1'h0)] wire44;
  wire [(4'he):(1'h0)] wire40;
  wire signed [(4'h9):(1'h0)] wire39;
  reg signed [(4'hc):(1'h0)] reg49 = (1'h0);
  reg [(4'h9):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  reg [(5'h13):(1'h0)] reg41 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire40,
                 wire39,
                 reg49,
                 reg48,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  assign wire39 = $unsigned(wire36[(1'h1):(1'h1)]);
  assign wire40 = ($unsigned($unsigned((8'ha8))) ~^ wire39[(3'h7):(3'h5)]);
  always
    @(posedge clk) begin
      reg41 <= {(wire40[(3'h4):(1'h1)] >>> wire36),
          ($signed(wire35[(4'ha):(3'h6)]) ? wire40[(4'h8):(1'h1)] : (-wire39))};
      reg42 <= wire34[(1'h0):(1'h0)];
      reg43 <= $signed(wire37[(2'h2):(2'h2)]);
    end
  assign wire44 = wire39;
  assign wire45 = wire35[(4'hf):(4'he)];
  assign wire46 = wire35;
  assign wire47 = $unsigned($unsigned($unsigned(($unsigned(reg41) ?
                      $signed(wire36) : wire46[(2'h2):(1'h1)]))));
  always
    @(posedge clk) begin
      reg48 <= (wire36 ? wire37 : wire45[(4'h9):(1'h0)]);
      reg49 <= (~&($signed((+$signed(wire46))) ^~ $signed(({(8'hbb),
          wire40} != wire38[(4'h8):(1'h0)]))));
    end
  assign wire50 = wire44[(4'ha):(3'h6)];
  assign wire51 = (wire40 & wire44);
  assign wire52 = (wire39[(2'h2):(2'h2)] != $signed({(wire51[(3'h6):(3'h5)] ?
                          (wire36 ? wire37 : (8'hbf)) : wire40),
                      (^~(wire36 <= reg43))}));
  assign wire53 = wire39;
  assign wire54 = wire37;
endmodule

module module96
#(parameter param141 = ((8'haa) <<< (^(({(7'h40)} | {(8'hb8)}) != (((8'ha7) ? (8'hab) : (8'hb1)) * ((8'had) != (8'had)))))))
(y, clk, wire100, wire99, wire98, wire97);
  output wire [(32'h180):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire100;
  input wire [(4'hf):(1'h0)] wire99;
  input wire [(2'h3):(1'h0)] wire98;
  input wire [(4'ha):(1'h0)] wire97;
  wire signed [(4'h9):(1'h0)] wire140;
  wire signed [(2'h3):(1'h0)] wire139;
  wire [(3'h6):(1'h0)] wire138;
  wire signed [(4'he):(1'h0)] wire137;
  wire [(2'h3):(1'h0)] wire136;
  wire signed [(4'he):(1'h0)] wire135;
  wire signed [(4'hb):(1'h0)] wire134;
  wire signed [(5'h11):(1'h0)] wire125;
  wire signed [(3'h7):(1'h0)] wire124;
  wire [(4'h9):(1'h0)] wire123;
  wire [(5'h14):(1'h0)] wire122;
  wire signed [(4'he):(1'h0)] wire121;
  wire signed [(3'h5):(1'h0)] wire120;
  wire [(2'h2):(1'h0)] wire119;
  wire [(3'h7):(1'h0)] wire118;
  wire signed [(5'h12):(1'h0)] wire117;
  wire signed [(5'h15):(1'h0)] wire116;
  wire signed [(3'h7):(1'h0)] wire115;
  wire signed [(2'h2):(1'h0)] wire114;
  reg [(4'h8):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg131 = (1'h0);
  reg [(3'h7):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg128 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg126 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg111 = (1'h0);
  reg [(4'hd):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg109 = (1'h0);
  reg [(3'h7):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg107 = (1'h0);
  reg [(2'h3):(1'h0)] reg106 = (1'h0);
  reg [(5'h10):(1'h0)] reg105 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg104 = (1'h0);
  reg [(2'h2):(1'h0)] reg103 = (1'h0);
  reg signed [(4'he):(1'h0)] reg102 = (1'h0);
  reg [(5'h14):(1'h0)] reg101 = (1'h0);
  assign y = {wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
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
                 wire114,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg101 <= (wire98[(1'h1):(1'h1)] ~^ (8'ha8));
      reg102 <= $signed(wire98[(1'h0):(1'h0)]);
      reg103 <= $signed(($signed($signed(reg101)) ?
          ($signed($signed(reg102)) << $unsigned($signed(wire98))) : (^$unsigned(wire99))));
      if ($signed($unsigned({($signed(reg103) ?
              (wire98 <= wire99) : wire100[(1'h0):(1'h0)])})))
        begin
          reg104 <= wire99[(4'ha):(1'h0)];
          reg105 <= $signed((^~$signed(wire99[(4'hf):(4'hd)])));
          if (wire99[(3'h7):(3'h5)])
            begin
              reg106 <= wire97;
              reg107 <= $unsigned((wire97[(3'h5):(1'h0)] ?
                  {($signed(reg102) * (wire97 >>> reg102)),
                      wire100} : $signed({$signed(wire98), (~&wire100)})));
              reg108 <= ((reg101[(4'hf):(2'h3)] ?
                  reg105 : ($unsigned(((8'hb2) ? reg107 : reg105)) ?
                      ((^wire100) * (reg105 ? wire99 : wire97)) : ((8'ha8) ?
                          reg102[(4'hb):(3'h7)] : reg103))) > reg104);
              reg109 <= ({(~^(^~$unsigned(reg104)))} ?
                  reg108[(3'h6):(1'h1)] : wire97[(3'h4):(2'h3)]);
            end
          else
            begin
              reg106 <= $unsigned(((^~(8'ha9)) ?
                  wire97[(3'h7):(2'h2)] : $signed((~reg103[(1'h1):(1'h1)]))));
              reg107 <= $signed({(reg103[(2'h2):(2'h2)] & {(|(8'hbb)),
                      $unsigned(reg103)}),
                  (^~$unsigned((~|(8'ha8))))});
              reg108 <= (wire100 ?
                  wire100 : (((7'h44) > $unsigned(reg107)) != reg106));
              reg109 <= reg105;
              reg110 <= $signed({(reg109 >= (!reg104[(1'h0):(1'h0)])),
                  $unsigned((!{reg103}))});
            end
          reg111 <= {reg110[(1'h0):(1'h0)]};
          reg112 <= ($unsigned($signed(reg106[(1'h1):(1'h1)])) ?
              reg105[(4'ha):(1'h0)] : (wire97 ?
                  $unsigned($unsigned(reg109)) : $signed(({wire100,
                      reg109} + (reg109 || reg101)))));
        end
      else
        begin
          reg104 <= $unsigned((reg108[(3'h4):(2'h3)] ?
              (wire98 <<< $unsigned((+(8'ha4)))) : reg106[(2'h2):(1'h1)]));
          reg105 <= $unsigned(($signed((!$unsigned((8'ha4)))) ?
              (~reg111[(2'h3):(2'h3)]) : {(reg102[(1'h0):(1'h0)] + $signed(wire98)),
                  reg108[(3'h4):(3'h4)]}));
        end
      reg113 <= (reg108[(2'h3):(1'h1)] ?
          $signed(reg110[(4'h8):(1'h0)]) : wire98);
    end
  assign wire114 = wire99;
  assign wire115 = reg106[(2'h2):(2'h2)];
  assign wire116 = (~^{(($signed(reg113) ?
                           $signed(reg105) : ((8'ha8) ?
                               (8'ha1) : wire98)) >= $unsigned(reg110)),
                       (wire98 << $signed($signed(wire99)))});
  assign wire117 = (^(((|(reg106 << reg109)) >> (-$unsigned((8'had)))) ^ reg107[(3'h4):(2'h2)]));
  assign wire118 = $unsigned(reg105[(4'h9):(4'h9)]);
  assign wire119 = $signed(((~^((reg104 ? wire99 : (8'ha1)) ?
                           (reg110 ? reg113 : reg103) : $signed(reg104))) ?
                       (^~$unsigned(wire99[(3'h6):(3'h6)])) : wire116));
  assign wire120 = $unsigned($unsigned($signed($unsigned($signed(wire98)))));
  assign wire121 = ((-(+{(wire114 ? wire115 : reg104)})) ?
                       reg106[(2'h2):(2'h2)] : ($unsigned((reg106 ?
                               (reg108 >>> reg101) : $signed(wire118))) ?
                           (8'haf) : {$signed((reg104 != wire115)),
                               wire118[(1'h1):(1'h0)]}));
  assign wire122 = ((-($unsigned({reg102, (8'hbc)}) ?
                           $unsigned($unsigned((8'h9d))) : $unsigned((wire118 >> wire99)))) ?
                       $unsigned((reg109[(4'hf):(4'hb)] ?
                           ($signed(wire116) > wire120[(3'h5):(1'h0)]) : (^~{reg102}))) : (8'hb9));
  assign wire123 = $unsigned($unsigned(reg113[(1'h1):(1'h1)]));
  assign wire124 = $unsigned(reg104[(1'h0):(1'h0)]);
  assign wire125 = ($unsigned((|$signed(reg106))) > wire121[(4'hd):(2'h3)]);
  always
    @(posedge clk) begin
      if ((~^(~&reg113[(1'h0):(1'h0)])))
        begin
          reg126 <= reg103[(1'h0):(1'h0)];
        end
      else
        begin
          reg126 <= ((!((8'ha9) < wire123)) ?
              $signed(reg102[(4'h8):(3'h6)]) : $signed($unsigned(($signed(reg107) < (^wire124)))));
          if ($signed((((!reg111) && (8'h9e)) ?
              wire120[(3'h4):(2'h3)] : $unsigned(((~&wire124) ?
                  (reg110 >>> reg106) : $unsigned((7'h40)))))))
            begin
              reg127 <= $unsigned((wire123 >> wire122[(5'h11):(4'ha)]));
              reg128 <= reg102;
              reg129 <= $unsigned((~((+(~|reg127)) ?
                  {{(8'h9d)}, (wire121 < reg106)} : $unsigned((~^reg111)))));
              reg130 <= wire115;
              reg131 <= wire119[(2'h2):(2'h2)];
            end
          else
            begin
              reg127 <= ($unsigned($signed(($unsigned(reg131) != ((8'h9c) ?
                  reg101 : reg104)))) - {wire125[(3'h5):(1'h0)]});
              reg128 <= $signed({reg112[(3'h7):(3'h5)]});
              reg129 <= ((~reg101) << ($signed($unsigned((reg131 ?
                      wire117 : reg107))) ?
                  $unsigned(((reg104 ?
                      (8'hb7) : reg106) >>> (~reg126))) : $unsigned($unsigned(wire122[(4'ha):(3'h4)]))));
              reg130 <= $signed((^(~&wire125[(1'h0):(1'h0)])));
              reg131 <= wire98[(1'h0):(1'h0)];
            end
        end
      reg132 <= wire116;
      reg133 <= reg131;
    end
  assign wire134 = $signed({$unsigned(({reg110, reg109} - {wire100, wire99})),
                       ((8'had) <<< ($signed(reg104) <= {reg107}))});
  assign wire135 = (~|$signed(wire115));
  assign wire136 = $signed(wire124[(1'h0):(1'h0)]);
  assign wire137 = reg128;
  assign wire138 = $signed({reg130,
                       (~|((wire118 << reg110) ?
                           (wire137 + wire98) : reg132))});
  assign wire139 = wire135;
  assign wire140 = reg106;
endmodule
