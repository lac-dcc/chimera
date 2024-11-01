module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1f0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire123;
  wire signed [(4'hc):(1'h0)] wire122;
  wire signed [(4'hd):(1'h0)] wire86;
  wire [(4'h9):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire88;
  wire [(3'h6):(1'h0)] wire120;
  reg signed [(4'hc):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg102 = (1'h0);
  reg [(3'h7):(1'h0)] reg101 = (1'h0);
  reg [(3'h4):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg98 = (1'h0);
  reg [(4'hf):(1'h0)] reg97 = (1'h0);
  reg [(5'h11):(1'h0)] reg96 = (1'h0);
  reg [(5'h12):(1'h0)] reg95 = (1'h0);
  reg [(4'h9):(1'h0)] reg94 = (1'h0);
  reg [(5'h12):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg90 = (1'h0);
  reg [(3'h5):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(3'h5):(1'h0)] reg5 = (1'h0);
  assign y = {wire123,
                 wire122,
                 wire86,
                 wire10,
                 wire88,
                 wire120,
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
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire1[(3'h7):(3'h6)];
    end
  always
    @(posedge clk) begin
      reg6 <= (|wire4);
      reg7 <= $unsigned($unsigned((+$unsigned($signed(wire3)))));
      reg8 <= reg6[(3'h4):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg9 <= $unsigned($signed($signed((|(+wire0)))));
    end
  assign wire10 = $signed($signed($signed(($unsigned(wire1) - (wire1 ?
                      wire0 : reg8)))));
  always
    @(posedge clk) begin
      reg11 <= reg7[(3'h4):(2'h2)];
      if ((~wire0))
        begin
          reg12 <= (wire2 == (wire10 & reg8));
          reg13 <= reg6;
          reg14 <= {reg7[(1'h1):(1'h1)]};
          reg15 <= (((8'ha6) << $unsigned(((!reg13) ?
              (wire4 || (8'had)) : (^reg12)))) >>> ((($signed(wire3) <<< reg9) - $unsigned($signed(reg7))) <<< wire3[(4'h8):(2'h2)]));
        end
      else
        begin
          reg12 <= ($unsigned((reg8 ?
              (-reg13) : (-(reg14 ?
                  reg8 : reg12)))) < $signed(((+((8'hba) > wire4)) ?
              reg6 : (+reg13[(3'h6):(1'h1)]))));
          reg13 <= $signed(({{wire4,
                  reg15[(3'h4):(1'h1)]}} <= (($signed(wire3) ^ reg7) ?
              $unsigned($unsigned(reg7)) : $signed(reg6[(3'h6):(1'h0)]))));
          reg14 <= $unsigned({(^reg12),
              $unsigned($unsigned($signed((8'ha7))))});
          if ((reg7 ?
              (reg6 ?
                  wire3[(1'h1):(1'h0)] : $signed($signed(wire0))) : $unsigned((wire4 >= reg7))))
            begin
              reg15 <= ({wire4, (7'h44)} > {wire1[(3'h6):(2'h3)]});
            end
          else
            begin
              reg15 <= reg9;
              reg16 <= $unsigned((!$unsigned((reg8[(3'h4):(2'h2)] >>> {reg7}))));
              reg17 <= {(|(~^{reg13})), (!$signed((-$signed(wire2))))};
            end
          reg18 <= ({reg9[(3'h4):(1'h1)], {$signed((wire10 ? reg9 : reg7))}} ?
              (($signed((+reg14)) != ({wire1, (8'h9f)} ?
                      wire2[(3'h5):(2'h2)] : $unsigned(reg8))) ?
                  $signed($signed(reg16[(3'h5):(3'h4)])) : reg16) : {$signed(reg14[(3'h4):(2'h3)])});
        end
      if (wire1[(1'h1):(1'h0)])
        begin
          reg19 <= reg11;
          if ($signed(wire4))
            begin
              reg20 <= $signed((wire1 << ((reg13 ?
                      (reg11 ? wire1 : reg15) : (~^wire3)) ?
                  $unsigned($unsigned(reg11)) : reg13)));
            end
          else
            begin
              reg20 <= reg5[(2'h2):(1'h1)];
            end
        end
      else
        begin
          if (((!reg19[(1'h1):(1'h1)]) ?
              $signed((reg5 <= {(wire4 ?
                      reg17 : reg17)})) : reg16[(3'h7):(3'h7)]))
            begin
              reg19 <= (($unsigned((reg20 || reg12[(1'h0):(1'h0)])) && ((reg13 >> (reg14 > (8'ha3))) & (|$signed(wire10)))) <<< ($unsigned(wire0) ?
                  {reg6} : {$unsigned((~wire2)), (8'hbc)}));
              reg20 <= $unsigned(({reg8[(2'h3):(1'h1)]} ?
                  wire2[(1'h1):(1'h1)] : (!wire4[(4'h8):(4'h8)])));
              reg21 <= reg19[(2'h2):(1'h1)];
              reg22 <= {(!reg20),
                  ((($signed(reg11) >= wire1[(1'h0):(1'h0)]) + $unsigned($signed(reg6))) << {(reg21[(4'ha):(3'h4)] + (~^wire4)),
                      reg16})};
            end
          else
            begin
              reg19 <= (($signed(((reg18 == reg12) <= reg8[(2'h2):(2'h2)])) ?
                  ({(reg14 ? reg9 : wire10), $signed(reg7)} ?
                      ($unsigned((8'hbd)) ?
                          (+wire3) : (wire0 & reg11)) : $unsigned((8'hb0))) : ((reg8 ?
                      (-reg8) : wire3[(4'h8):(4'h8)]) || {$signed(reg18)})) & (~$signed($signed(((7'h43) ?
                  (7'h40) : reg16)))));
            end
        end
      reg23 <= {$signed($unsigned(wire4))};
    end
  always
    @(posedge clk) begin
      reg24 <= reg8[(2'h3):(1'h1)];
      reg25 <= ($unsigned($unsigned({(reg7 ^~ reg12), {reg18, (8'ha4)}})) ?
          reg19[(3'h6):(3'h6)] : $unsigned((~^reg8)));
      reg26 <= reg18[(1'h1):(1'h0)];
      reg27 <= {(|reg9[(1'h0):(1'h0)]),
          ((~^reg22) ?
              (wire2[(3'h4):(1'h1)] >>> ((reg26 ?
                  reg5 : reg12) >> reg25[(1'h0):(1'h0)])) : reg24[(4'he):(2'h3)])};
      reg28 <= wire3;
    end
  module29 #() modinst87 (wire86, clk, reg28, reg22, wire3, reg9, reg26);
  assign wire88 = $signed($signed((~$unsigned(reg21))));
  always
    @(posedge clk) begin
      reg89 <= reg16;
      if (wire88[(3'h5):(3'h4)])
        begin
          if (((8'hb6) == reg11[(1'h1):(1'h1)]))
            begin
              reg90 <= ((((~|reg21) ?
                  (~^$signed(reg15)) : ({(8'h9e)} ?
                      reg19[(3'h7):(3'h7)] : wire10)) >> (+{$signed(reg9),
                  (^reg15)})) >= (($unsigned((reg17 | wire88)) ?
                      (~|(reg8 << reg20)) : reg6[(4'h8):(1'h1)]) ?
                  $unsigned(reg5) : reg19[(1'h1):(1'h0)]));
              reg91 <= (~|$signed((7'h40)));
              reg92 <= $unsigned((((-$signed(reg17)) ?
                      (reg21[(4'hd):(1'h1)] << wire10) : wire4) ?
                  (({reg27, reg91} + (reg18 ? reg7 : reg28)) ?
                      reg7 : ({(8'ha8)} ?
                          (reg14 ~^ reg23) : $unsigned(reg28))) : ($signed({(8'hb2)}) + wire88[(1'h1):(1'h0)])));
              reg93 <= reg5[(3'h5):(1'h1)];
              reg94 <= reg20[(4'ha):(3'h5)];
            end
          else
            begin
              reg90 <= reg25;
              reg91 <= reg21;
              reg92 <= (reg8[(1'h0):(1'h0)] ? (~wire0) : (8'hb4));
              reg93 <= (&$signed((&(reg22 ?
                  (reg18 ? reg18 : reg26) : (reg27 ^~ reg90)))));
            end
          if (reg28[(2'h3):(1'h0)])
            begin
              reg95 <= $signed($signed(((-$unsigned(reg91)) ?
                  $unsigned((8'hb9)) : (reg92[(3'h4):(1'h0)] <= reg92))));
              reg96 <= (8'hac);
            end
          else
            begin
              reg95 <= (8'hac);
            end
          if (({wire4,
              (wire3[(2'h2):(1'h1)] > $unsigned((reg93 ?
                  reg14 : reg27)))} + $signed((~$unsigned($signed(reg9))))))
            begin
              reg97 <= {$signed(({$signed((8'hac)),
                      wire1[(2'h2):(1'h0)]} * wire1))};
              reg98 <= (+(((-$signed(reg93)) ?
                  ((reg6 ? reg25 : wire0) ?
                      (wire0 >>> (8'hba)) : (reg23 ?
                          reg17 : reg89)) : reg5[(2'h3):(2'h3)]) != (~^$unsigned(reg24))));
              reg99 <= (~wire0[(3'h4):(1'h0)]);
              reg100 <= (((|(8'ha0)) ?
                  reg26[(5'h13):(4'h9)] : reg26[(5'h15):(3'h6)]) < reg28[(3'h7):(3'h6)]);
              reg101 <= (($unsigned($unsigned((~|reg99))) ?
                      $signed((|(^reg11))) : reg13) ?
                  $signed({$signed(reg92[(2'h2):(2'h2)]),
                      $signed($unsigned(reg13))}) : reg24);
            end
          else
            begin
              reg97 <= {$signed((reg91[(3'h4):(1'h0)] ^~ (8'hae))),
                  reg22[(1'h1):(1'h0)]};
              reg98 <= {reg19[(1'h1):(1'h0)]};
              reg99 <= ((((!(reg97 | reg91)) + reg12[(3'h5):(1'h1)]) < ($signed(reg7[(1'h0):(1'h0)]) | $signed((^~reg7)))) ?
                  (^~$unsigned((reg18 <= (reg24 + reg92)))) : $signed(($unsigned($unsigned((8'hbd))) ?
                      {((8'hb3) ? reg95 : reg15),
                          $unsigned(wire0)} : ((reg19 != reg22) ?
                          {reg15} : $signed(reg17)))));
              reg100 <= (reg95 & $signed(reg13[(1'h1):(1'h1)]));
            end
          reg102 <= reg23[(4'h8):(1'h1)];
          reg103 <= {({$signed(reg90[(4'ha):(4'h8)])} ?
                  ((~|(reg93 ? reg6 : (8'ha1))) ~^ ((reg89 ? wire1 : wire86) ?
                      wire10[(3'h6):(1'h1)] : $signed(reg20))) : $signed(($unsigned(reg16) != $unsigned(reg8))))};
        end
      else
        begin
          if ($signed(reg14[(2'h3):(1'h1)]))
            begin
              reg90 <= ({(({reg27} ? $unsigned(reg28) : {(8'hb0)}) >= reg9)} ?
                  (~$unsigned(reg97[(1'h1):(1'h0)])) : ((&$unsigned($signed(reg24))) ?
                      (-reg27[(2'h2):(1'h1)]) : (reg14[(1'h0):(1'h0)] >>> $signed($unsigned(reg13)))));
              reg91 <= reg103;
              reg92 <= (!(!$signed(($unsigned((8'ha6)) ~^ (reg26 ?
                  reg100 : (8'hae))))));
            end
          else
            begin
              reg90 <= (-(wire3[(2'h2):(1'h1)] ?
                  {$signed(wire4[(1'h0):(1'h0)]),
                      $unsigned($signed(reg25))} : reg16[(2'h2):(1'h1)]));
              reg91 <= reg94[(4'h8):(1'h0)];
            end
        end
    end
  module104 #() modinst121 (.wire109(reg93), .clk(clk), .wire108(reg24), .wire107(reg11), .wire105(reg13), .wire106(wire3), .y(wire120));
  assign wire122 = {(~|(~|((reg11 ? reg95 : reg28) ^ (+(8'hbb)))))};
  assign wire123 = ({(8'h9e),
                           ($signed((reg7 ? reg18 : reg23)) ?
                               ((wire10 <<< reg94) ?
                                   ((8'hbe) ?
                                       reg97 : reg23) : (8'ha9)) : ($signed(reg90) + $signed(reg21)))} ?
                       (^reg96) : (reg99[(3'h7):(3'h5)] * (~^$unsigned(reg16))));
endmodule

module module104
#(parameter param118 = (~|(&{((~|(8'hab)) >>> (~&(7'h41)))})), 
parameter param119 = param118)
(y, clk, wire109, wire108, wire107, wire106, wire105);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire109;
  input wire signed [(5'h14):(1'h0)] wire108;
  input wire signed [(4'hc):(1'h0)] wire107;
  input wire [(3'h4):(1'h0)] wire106;
  input wire [(5'h11):(1'h0)] wire105;
  wire signed [(3'h4):(1'h0)] wire117;
  wire [(4'h9):(1'h0)] wire116;
  wire [(2'h2):(1'h0)] wire115;
  wire [(5'h14):(1'h0)] wire114;
  wire [(4'hf):(1'h0)] wire113;
  wire signed [(5'h10):(1'h0)] wire112;
  wire [(4'hb):(1'h0)] wire111;
  wire signed [(4'h9):(1'h0)] wire110;
  assign y = {wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 (1'h0)};
  assign wire110 = $unsigned((8'hb9));
  assign wire111 = $signed((wire105 || ((-(+wire107)) & ((~|wire106) ^ {wire105,
                       wire105}))));
  assign wire112 = wire109[(5'h11):(4'h9)];
  assign wire113 = wire112[(3'h4):(1'h1)];
  assign wire114 = ((~&({{(8'h9e)}, $unsigned(wire110)} ?
                       (wire109 >= (wire113 ?
                           wire111 : wire106)) : {$unsigned(wire106),
                           $unsigned((8'hb5))})) + (($unsigned((!wire106)) <= $signed(((8'ha7) ?
                           (8'ha0) : wire111))) ?
                       (((wire109 ? wire105 : wire108) < (wire107 ?
                               wire109 : wire107)) ?
                           wire105 : wire109) : {{(~|wire105),
                               (wire105 <<< wire109)}}));
  assign wire115 = wire107;
  assign wire116 = $signed((~wire109[(3'h4):(3'h4)]));
  assign wire117 = (+((~^(wire113 ?
                       (8'hb9) : (!wire114))) != ($signed((-wire108)) ?
                       (wire116 >>> (wire115 >= wire115)) : (~^(8'ha7)))));
endmodule

module module29
#(parameter param84 = ((((((8'ha6) * (8'ha0)) >= ((8'h9c) << (8'hbb))) ? (((8'hb0) ? (8'hb8) : (8'hb4)) * (^~(8'h9c))) : (((8'hb3) ^ (7'h41)) <= (^(8'hb1)))) ? (^(!{(8'ha2)})) : (({(8'ha6), (8'hb0)} ? (8'had) : ((8'h9c) << (8'haf))) < {((8'hb1) ? (8'hbf) : (8'ha3)), (^~(8'hae))})) ? (((^~((8'hb8) && (7'h44))) ? (((7'h44) >= (8'ha2)) ? ((8'h9d) ? (8'ha8) : (7'h40)) : (-(8'ha6))) : ({(8'hb2)} ? {(8'hb0)} : ((8'ha3) ? (8'ha9) : (8'hb5)))) != {({(8'hb8), (7'h40)} & ((8'hae) ? (7'h42) : (8'hb5))), (~((8'hb6) ? (7'h40) : (8'hb2)))}) : (~&({((8'hb5) - (8'h9f)), ((8'ha8) ? (8'ha9) : (8'haa))} ? (8'hb6) : (8'hbf)))), 
parameter param85 = ((+(^~(|(&param84)))) ? (param84 >> (((param84 & param84) > (8'ha3)) ? (~|param84) : (!(+(7'h41))))) : (-(|(param84 ? (param84 >= param84) : (-param84))))))
(y, clk, wire34, wire33, wire32, wire31, wire30);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire34;
  input wire [(2'h3):(1'h0)] wire33;
  input wire signed [(4'hd):(1'h0)] wire32;
  input wire signed [(5'h12):(1'h0)] wire31;
  input wire signed [(3'h5):(1'h0)] wire30;
  wire [(5'h11):(1'h0)] wire83;
  wire [(4'h9):(1'h0)] wire82;
  wire signed [(4'hc):(1'h0)] wire80;
  wire [(3'h5):(1'h0)] wire55;
  wire [(3'h7):(1'h0)] wire54;
  wire signed [(5'h10):(1'h0)] wire53;
  wire signed [(4'hf):(1'h0)] wire52;
  wire [(4'h8):(1'h0)] wire44;
  wire [(4'hb):(1'h0)] wire43;
  wire [(3'h5):(1'h0)] wire42;
  wire [(5'h13):(1'h0)] wire41;
  wire [(3'h5):(1'h0)] wire40;
  wire [(4'hb):(1'h0)] wire39;
  wire [(5'h10):(1'h0)] wire38;
  wire [(5'h13):(1'h0)] wire37;
  wire [(5'h15):(1'h0)] wire36;
  wire [(3'h6):(1'h0)] wire35;
  reg signed [(5'h13):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg47 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg49 = (1'h0);
  reg [(5'h12):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg51 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire80,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 (1'h0)};
  assign wire35 = wire34;
  assign wire36 = $signed({(+{$unsigned(wire33), (wire35 >= wire33)}), wire35});
  assign wire37 = wire30[(2'h2):(2'h2)];
  assign wire38 = $unsigned($signed(({(wire33 <= wire37),
                      $signed(wire30)} & (~&$unsigned(wire31)))));
  assign wire39 = (^~wire36);
  assign wire40 = ((|{(&wire30), wire35}) ?
                      wire31 : (!{(-wire37[(4'h8):(1'h1)]),
                          ($signed(wire38) | wire39)}));
  assign wire41 = wire40;
  assign wire42 = $unsigned($signed($signed(((wire34 ?
                      wire36 : wire36) && $unsigned((8'hbb))))));
  assign wire43 = ((wire32[(2'h3):(1'h1)] ^ {wire31[(1'h0):(1'h0)]}) ?
                      $unsigned(((~^$signed(wire33)) <= (~|$unsigned(wire34)))) : ((((|(8'h9f)) >> $unsigned(wire37)) >>> {(wire42 - wire36)}) ?
                          (8'hb1) : ($signed((8'ha4)) ?
                              $unsigned($unsigned(wire32)) : wire38)));
  assign wire44 = (wire38[(1'h0):(1'h0)] > ({(~&((8'h9f) & (8'ha0)))} - wire30[(2'h3):(2'h2)]));
  always
    @(posedge clk) begin
      if (wire41)
        begin
          reg45 <= wire42[(2'h3):(1'h0)];
          reg46 <= $signed($unsigned($unsigned((7'h40))));
          reg47 <= wire43;
          if ($signed((!((^wire43[(1'h1):(1'h0)]) ?
              $unsigned($unsigned(wire32)) : $signed($signed(wire43))))))
            begin
              reg48 <= reg47[(1'h1):(1'h0)];
            end
          else
            begin
              reg48 <= $signed(wire37[(4'he):(2'h2)]);
              reg49 <= wire32[(4'h8):(2'h2)];
            end
        end
      else
        begin
          if ($unsigned($unsigned((wire38 >>> $signed((reg45 ?
              wire31 : reg45))))))
            begin
              reg45 <= {$unsigned(reg45),
                  ((8'hb7) ?
                      wire32 : (((reg49 ~^ (8'hb6)) || $unsigned((8'ha6))) ?
                          ((^wire44) ?
                              (~wire33) : (wire30 > wire38)) : (^(8'hb9))))};
            end
          else
            begin
              reg45 <= {((^wire33) ? wire37 : $signed({(reg48 != reg47)})),
                  $signed({((wire44 ? wire32 : wire38) & (reg47 <= reg47)),
                      $unsigned(((8'hae) & (7'h40)))})};
            end
          reg46 <= {(wire40 ?
                  reg49[(3'h4):(2'h3)] : $signed(wire38[(4'ha):(3'h4)]))};
          reg47 <= reg47[(1'h0):(1'h0)];
          reg48 <= $signed(reg45[(1'h0):(1'h0)]);
        end
      reg50 <= (^(((-$unsigned((8'ha2))) ?
          {(|wire39), (&wire40)} : (((8'ha9) ^ reg47) ?
              wire32[(4'h9):(1'h1)] : $signed((8'ha3)))) + $unsigned($signed(wire44[(2'h3):(2'h2)]))));
      reg51 <= wire34[(1'h0):(1'h0)];
    end
  assign wire52 = (~^$unsigned(($signed((reg51 ?
                      wire41 : (8'haa))) >= wire42)));
  assign wire53 = (|wire34[(4'hd):(4'hd)]);
  assign wire54 = $unsigned((($signed((wire34 != reg51)) ^ {(wire40 > wire37),
                      (reg49 ? reg49 : (8'ha5))}) | {wire40}));
  assign wire55 = ((({wire39[(3'h7):(2'h3)]} ?
                              (8'ha1) : ((reg50 ? wire40 : wire54) ?
                                  $unsigned(wire34) : (^wire34))) ?
                          $signed((7'h43)) : ($signed(wire30[(1'h0):(1'h0)]) ?
                              (wire54 ?
                                  wire41 : (wire34 + (8'hae))) : $signed($signed(wire35)))) ?
                      $signed((8'hb4)) : (~wire36));
  module56 #() modinst81 (wire80, clk, reg49, wire39, wire54, wire31, wire35);
  assign wire82 = (reg49[(2'h2):(1'h1)] != $unsigned({wire39[(2'h3):(2'h2)]}));
  assign wire83 = $unsigned($unsigned(({reg50[(5'h12):(4'hc)],
                      wire36[(2'h2):(1'h1)]} | $unsigned($unsigned(reg46)))));
endmodule

module module56  (y, clk, wire61, wire60, wire59, wire58, wire57);
  output wire [(32'hbe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire61;
  input wire signed [(2'h2):(1'h0)] wire60;
  input wire signed [(3'h7):(1'h0)] wire59;
  input wire [(5'h12):(1'h0)] wire58;
  input wire [(3'h6):(1'h0)] wire57;
  wire [(5'h13):(1'h0)] wire77;
  wire [(4'he):(1'h0)] wire76;
  wire signed [(3'h5):(1'h0)] wire75;
  wire signed [(2'h2):(1'h0)] wire74;
  wire [(4'h8):(1'h0)] wire73;
  wire [(5'h12):(1'h0)] wire71;
  wire signed [(3'h6):(1'h0)] wire70;
  wire signed [(3'h6):(1'h0)] wire69;
  wire [(4'ha):(1'h0)] wire68;
  wire signed [(5'h14):(1'h0)] wire67;
  wire signed [(3'h5):(1'h0)] wire66;
  wire signed [(4'h9):(1'h0)] wire65;
  wire [(2'h2):(1'h0)] wire64;
  wire signed [(3'h5):(1'h0)] wire62;
  reg signed [(4'hf):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg63 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire62,
                 reg79,
                 reg78,
                 reg72,
                 reg63,
                 (1'h0)};
  assign wire62 = $signed(wire61);
  always
    @(posedge clk) begin
      reg63 <= {$unsigned(((wire59[(1'h0):(1'h0)] << wire62[(2'h2):(1'h0)]) ?
              ((~&wire62) ?
                  ((8'hbe) ?
                      wire58 : wire58) : (~wire59)) : ($signed(wire59) != wire62[(3'h4):(2'h3)])))};
    end
  assign wire64 = $unsigned($unsigned($unsigned(((^wire61) ^ $unsigned((8'hab))))));
  assign wire65 = $signed((((8'ha8) + $unsigned((wire57 ?
                      wire62 : wire64))) <<< (~wire57[(3'h6):(1'h0)])));
  assign wire66 = wire61;
  assign wire67 = $signed(($signed($signed({wire57, wire59})) != wire62));
  assign wire68 = {$unsigned((&wire64[(2'h2):(1'h1)]))};
  assign wire69 = $signed(wire66);
  assign wire70 = $unsigned(wire61[(3'h7):(1'h0)]);
  assign wire71 = wire59[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg72 <= {(8'hbd),
          (-($unsigned(reg63[(4'h9):(1'h1)]) ?
              (~^(wire68 && wire61)) : $unsigned((wire65 ? wire65 : wire59))))};
    end
  assign wire73 = (^~$unsigned($signed(({wire59} ?
                      (wire71 ? wire61 : (8'ha6)) : $signed(wire57)))));
  assign wire74 = ((wire73 < ((&(~&wire59)) ?
                      $signed({wire61, wire68}) : (wire61[(3'h5):(1'h1)] ?
                          wire65[(3'h5):(1'h1)] : (wire70 ^~ wire68)))) * wire57);
  assign wire75 = (&(~|$signed((+$unsigned(wire64)))));
  assign wire76 = $unsigned($signed((((~&wire62) ^~ (wire66 ?
                          wire64 : wire73)) ?
                      (8'hb1) : wire68)));
  assign wire77 = $unsigned(({wire66} ?
                      $signed((~^(reg72 & (8'hbf)))) : (~&wire65[(4'h9):(1'h0)])));
  always
    @(posedge clk) begin
      reg78 <= ((8'haf) ? $signed(wire65[(3'h7):(3'h5)]) : wire65);
      reg79 <= $signed((reg72[(2'h2):(1'h1)] || $unsigned($unsigned((wire71 >= (8'hbe))))));
    end
endmodule
