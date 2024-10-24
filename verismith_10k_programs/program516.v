module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1f6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire4;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire119;
  wire signed [(4'hf):(1'h0)] wire118;
  wire [(4'hc):(1'h0)] wire117;
  wire [(3'h4):(1'h0)] wire113;
  wire [(4'ha):(1'h0)] wire112;
  wire signed [(5'h14):(1'h0)] wire110;
  wire signed [(4'he):(1'h0)] wire37;
  wire [(4'hf):(1'h0)] wire36;
  wire [(2'h3):(1'h0)] wire35;
  wire [(3'h6):(1'h0)] wire34;
  wire [(4'h8):(1'h0)] wire33;
  wire signed [(5'h10):(1'h0)] wire32;
  wire signed [(4'hb):(1'h0)] wire31;
  wire [(5'h11):(1'h0)] wire30;
  wire signed [(4'h8):(1'h0)] wire5;
  reg [(4'hb):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg21 = (1'h0);
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(2'h3):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire117,
                 wire113,
                 wire112,
                 wire110,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire5,
                 reg116,
                 reg115,
                 reg114,
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
                 (1'h0)};
  assign wire5 = (wire1 ^ (~&($signed($signed(wire2)) ?
                     (~&((8'ha8) ^ wire2)) : (~&$signed((8'hbc))))));
  always
    @(posedge clk) begin
      if ({$unsigned(wire0)})
        begin
          reg6 <= wire1;
        end
      else
        begin
          reg6 <= wire1[(3'h6):(3'h5)];
          if (wire0)
            begin
              reg7 <= wire1;
              reg8 <= $unsigned(((!((!wire4) && (^~(7'h41)))) ^ $unsigned($signed((wire4 || wire0)))));
              reg9 <= $signed(($signed((~|(~wire1))) ?
                  $unsigned({{reg8, reg6},
                      wire2[(3'h5):(3'h5)]}) : $unsigned(reg8[(4'h9):(4'h8)])));
              reg10 <= reg9[(2'h2):(1'h0)];
            end
          else
            begin
              reg7 <= ($signed($signed($signed($unsigned(wire1)))) ?
                  (($unsigned((^~reg10)) == $unsigned($unsigned(wire0))) >= ($signed($unsigned(wire0)) * (-$signed(wire2)))) : reg7[(1'h0):(1'h0)]);
              reg8 <= $unsigned({wire0[(2'h2):(1'h1)]});
              reg9 <= $signed(wire5);
              reg10 <= $signed((wire1[(4'hb):(4'h9)] ?
                  reg6[(3'h6):(1'h0)] : ((^$unsigned(reg7)) || $signed((|wire1)))));
            end
          reg11 <= reg7[(1'h0):(1'h0)];
        end
      if ((~reg10[(4'h9):(3'h5)]))
        begin
          reg12 <= $unsigned($signed(($signed(reg7[(2'h3):(1'h0)]) ?
              $signed(reg11[(3'h4):(3'h4)]) : $unsigned((-wire1)))));
          if (reg9[(1'h0):(1'h0)])
            begin
              reg13 <= wire4[(1'h0):(1'h0)];
              reg14 <= $unsigned($signed(reg8[(2'h3):(2'h2)]));
            end
          else
            begin
              reg13 <= $signed(reg11[(2'h3):(1'h1)]);
              reg14 <= reg14[(4'h9):(3'h4)];
              reg15 <= $signed($unsigned((!((wire5 ?
                  reg9 : wire0) || $signed(reg8)))));
              reg16 <= (|($signed(wire2[(2'h2):(1'h0)]) | reg8));
            end
          if ($unsigned(wire5[(3'h4):(1'h1)]))
            begin
              reg17 <= $unsigned(reg10);
            end
          else
            begin
              reg17 <= wire2[(3'h5):(2'h2)];
            end
          reg18 <= $unsigned((^~reg12));
        end
      else
        begin
          reg12 <= (7'h41);
          if ((($signed($unsigned(wire1[(4'h9):(3'h6)])) || (({wire0,
              reg18} || ((8'h9f) ? reg8 : reg17)) >>> (wire0 ?
              (+reg8) : $unsigned(reg14)))) | wire0[(1'h1):(1'h0)]))
            begin
              reg13 <= $unsigned(({((reg7 ?
                          reg16 : (8'hb7)) != wire1[(3'h6):(3'h4)])} ?
                  reg6[(2'h2):(1'h1)] : wire5));
              reg14 <= (reg8[(3'h7):(3'h4)] ?
                  {{wire4[(1'h1):(1'h1)]},
                      $signed((((8'hab) ^ reg14) ?
                          (reg7 >> reg11) : reg14))} : (&((reg12 > {reg6}) ?
                      ((|wire0) | reg7[(2'h2):(1'h0)]) : reg12)));
              reg15 <= reg15;
            end
          else
            begin
              reg13 <= (wire2 * ($unsigned($signed((|reg8))) != (^~$unsigned((~&reg17)))));
            end
        end
      if (reg12[(2'h2):(1'h1)])
        begin
          if (reg16[(3'h5):(2'h2)])
            begin
              reg19 <= ({reg11} ?
                  reg9 : (reg11[(3'h5):(1'h0)] ?
                      reg16[(4'he):(4'hb)] : $signed({wire5[(3'h4):(2'h3)]})));
              reg20 <= (($unsigned((&(reg13 ? reg15 : wire0))) - {({reg13} ?
                      (wire4 + (8'ha9)) : (-wire4)),
                  (!(reg9 ? reg11 : (8'ha0)))}) < ((({wire1,
                      reg10} ^~ wire5) && $signed((|reg19))) ?
                  {((8'hbc) ? wire5[(1'h1):(1'h1)] : $signed(reg18)),
                      reg16} : $unsigned(((reg16 ?
                      (8'hac) : reg8) != (8'hae)))));
              reg21 <= reg12[(3'h7):(2'h3)];
              reg22 <= wire0[(1'h1):(1'h0)];
              reg23 <= reg6[(4'ha):(3'h4)];
            end
          else
            begin
              reg19 <= (($signed((8'haa)) << ($unsigned((^~reg8)) ?
                  reg21[(1'h0):(1'h0)] : ((reg7 ? wire4 : wire3) ?
                      (8'hb4) : (reg12 ?
                          reg8 : reg13)))) & (reg10 <= wire3[(1'h0):(1'h0)]));
            end
          if ($unsigned((((|(8'h9c)) ^~ (((8'hbd) && reg19) <<< reg19)) >> $signed((wire3[(2'h2):(1'h1)] < reg18[(2'h3):(2'h3)])))))
            begin
              reg24 <= reg18;
              reg25 <= (((~&reg6[(4'h9):(2'h2)]) << reg18) ?
                  ($signed(reg17[(2'h2):(2'h2)]) == (reg22[(1'h0):(1'h0)] ^ ((&(8'hb2)) && (reg10 ?
                      wire2 : (8'hb5))))) : $unsigned(({reg8[(4'ha):(1'h0)],
                      (!reg8)} ^~ ((wire0 & wire3) ?
                      {reg22} : (reg20 ? wire3 : reg21)))));
              reg26 <= $unsigned(reg9[(2'h3):(2'h2)]);
            end
          else
            begin
              reg24 <= (reg24[(3'h7):(2'h2)] ?
                  $unsigned($signed(reg8)) : (-($unsigned($unsigned(wire4)) * wire0)));
              reg25 <= ({wire4[(2'h2):(1'h1)],
                  (~wire1)} >= $signed(reg6[(4'h8):(1'h1)]));
            end
        end
      else
        begin
          reg19 <= (reg13[(2'h3):(2'h2)] && ($signed($unsigned($unsigned(reg18))) - {((reg24 & reg8) ?
                  $unsigned(reg26) : (reg16 ? reg11 : (8'hb8))),
              $signed($signed((8'hbe)))}));
          if ($unsigned(reg9[(1'h0):(1'h0)]))
            begin
              reg20 <= (reg19 << (&(^(|(+wire4)))));
            end
          else
            begin
              reg20 <= reg12[(4'h9):(3'h4)];
              reg21 <= (reg13[(3'h6):(2'h2)] ?
                  {reg22,
                      (~&$unsigned((8'ha2)))} : $unsigned({$unsigned((+reg16))}));
              reg22 <= $unsigned(($unsigned(({reg18} < $unsigned(reg22))) ?
                  $unsigned($signed((reg15 - wire3))) : $signed($signed((&reg13)))));
            end
          reg23 <= (($signed({((8'hab) ? wire0 : wire2)}) >> reg26) ?
              (~^wire4[(1'h1):(1'h1)]) : (|$unsigned(((reg10 ~^ reg23) ?
                  reg8 : (reg6 ~^ wire4)))));
          reg24 <= (^$signed(wire2));
          if ($signed($unsigned(($unsigned((~|reg14)) ?
              (~&$signed(reg15)) : $signed((reg8 & reg26))))))
            begin
              reg25 <= reg26[(3'h7):(3'h6)];
              reg26 <= (~reg23[(3'h5):(3'h4)]);
              reg27 <= $unsigned($signed((reg14 ?
                  (^(wire3 ? reg25 : reg26)) : $unsigned(wire5))));
            end
          else
            begin
              reg25 <= ($signed((~^(^(wire2 <= reg10)))) ?
                  $signed(reg6) : {reg18,
                      ((wire3 <= $unsigned(reg19)) ?
                          $unsigned((^~reg6)) : ((8'ha8) ?
                              reg17[(3'h5):(2'h3)] : (reg6 ? wire2 : reg21)))});
              reg26 <= wire5;
              reg27 <= $unsigned($signed($signed(((reg8 - reg7) ?
                  $signed(reg16) : $signed(reg6)))));
              reg28 <= $signed(({reg12[(3'h5):(2'h3)], reg17} ?
                  $signed($unsigned((^~wire5))) : wire2[(3'h5):(1'h0)]));
            end
        end
      reg29 <= $signed(reg11[(3'h5):(1'h0)]);
    end
  assign wire30 = ((~^($signed({(8'ha1), reg21}) ?
                          $signed($signed(reg22)) : $unsigned((reg9 + reg13)))) ?
                      $signed({((reg17 ? wire2 : (8'hbe)) ~^ $signed(wire2)),
                          $unsigned(reg6)}) : ($unsigned({(7'h41),
                          $signed(reg28)}) || $signed($unsigned((8'hb8)))));
  assign wire31 = ((reg20[(2'h3):(1'h1)] - ($unsigned((~reg13)) ~^ reg24[(4'h8):(1'h0)])) == (reg20 ?
                      reg17[(1'h1):(1'h0)] : (~^wire4[(1'h0):(1'h0)])));
  assign wire32 = ($signed((~(|$signed(wire30)))) > $signed($unsigned((|{reg9}))));
  assign wire33 = ($unsigned(($unsigned($unsigned(wire0)) ^~ $signed(wire5))) ^ wire4[(2'h2):(1'h0)]);
  assign wire34 = $signed((~^(^reg24[(4'h9):(3'h7)])));
  assign wire35 = (^~$signed(reg13[(2'h3):(2'h2)]));
  assign wire36 = $unsigned(reg18);
  assign wire37 = wire3[(2'h2):(1'h0)];
  module38 #() modinst111 (wire110, clk, wire1, reg29, reg26, wire5);
  assign wire112 = ((~|$signed($signed((wire2 ^~ reg12)))) > (!(-$signed({reg12,
                       reg12}))));
  assign wire113 = (~(wire4 >= ($unsigned(wire2[(2'h2):(1'h1)]) != (8'h9d))));
  always
    @(posedge clk) begin
      if (wire0[(1'h1):(1'h0)])
        begin
          reg114 <= $unsigned(reg25);
          reg115 <= {reg20};
          reg116 <= reg23;
        end
      else
        begin
          reg114 <= wire0[(2'h2):(1'h0)];
        end
    end
  assign wire117 = $signed((wire32 == {reg114[(3'h6):(2'h3)]}));
  assign wire118 = $signed(($unsigned($signed($unsigned((8'hb9)))) >>> reg11[(3'h5):(1'h0)]));
  assign wire119 = $signed((wire37[(4'hd):(4'h8)] > $signed(reg21)));
endmodule

module module38  (y, clk, wire39, wire40, wire41, wire42);
  output wire [(32'h112):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire39;
  input wire [(5'h12):(1'h0)] wire40;
  input wire [(5'h11):(1'h0)] wire41;
  input wire [(4'h8):(1'h0)] wire42;
  wire [(4'ha):(1'h0)] wire109;
  wire signed [(4'hd):(1'h0)] wire90;
  wire [(4'ha):(1'h0)] wire89;
  wire [(4'hb):(1'h0)] wire43;
  wire [(3'h5):(1'h0)] wire44;
  wire [(4'hf):(1'h0)] wire45;
  wire [(5'h15):(1'h0)] wire87;
  reg [(3'h6):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg107 = (1'h0);
  reg [(4'ha):(1'h0)] reg106 = (1'h0);
  reg [(4'h8):(1'h0)] reg105 = (1'h0);
  reg [(5'h12):(1'h0)] reg104 = (1'h0);
  reg [(4'hd):(1'h0)] reg103 = (1'h0);
  reg [(5'h14):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg101 = (1'h0);
  reg [(4'ha):(1'h0)] reg100 = (1'h0);
  reg [(5'h11):(1'h0)] reg99 = (1'h0);
  reg [(3'h6):(1'h0)] reg98 = (1'h0);
  reg [(3'h7):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg96 = (1'h0);
  reg [(2'h2):(1'h0)] reg95 = (1'h0);
  reg [(5'h11):(1'h0)] reg94 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg93 = (1'h0);
  reg [(4'he):(1'h0)] reg92 = (1'h0);
  reg [(5'h12):(1'h0)] reg91 = (1'h0);
  assign y = {wire109,
                 wire90,
                 wire89,
                 wire43,
                 wire44,
                 wire45,
                 wire87,
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
                 (1'h0)};
  assign wire43 = (~|wire41);
  assign wire44 = $unsigned(wire43[(3'h6):(2'h2)]);
  assign wire45 = $unsigned((|(wire43[(2'h2):(1'h0)] ?
                      (wire40 | $unsigned(wire43)) : $signed(wire39))));
  module46 #() modinst88 (.wire47(wire41), .wire51(wire39), .y(wire87), .clk(clk), .wire48(wire45), .wire50(wire40), .wire49(wire43));
  assign wire89 = ((-$signed(wire41)) ?
                      (^~(7'h43)) : ((7'h41) + ($signed($unsigned(wire44)) ?
                          (~&$unsigned(wire45)) : wire41[(4'h9):(2'h2)])));
  assign wire90 = wire45;
  always
    @(posedge clk) begin
      reg91 <= ((($signed(wire40[(3'h6):(1'h1)]) ?
                  (&$signed(wire43)) : wire89[(3'h6):(2'h2)]) ?
              wire43 : ({(wire39 >>> (8'hac)), (wire90 ? wire87 : wire40)} ?
                  (wire41[(2'h3):(1'h0)] ?
                      $signed(wire39) : (wire44 ?
                          wire89 : (8'hbf))) : wire43[(4'hb):(4'ha)])) ?
          {(~&(-(~wire41)))} : (wire43[(3'h7):(2'h2)] != ((((8'h9c) ?
                  wire39 : wire87) << wire40[(2'h3):(2'h3)]) ?
              (8'hb7) : (|(wire87 + wire40)))));
      if ((((~|$unsigned($unsigned(wire89))) <<< wire42[(1'h0):(1'h0)]) ?
          ((~^(&$unsigned(wire44))) <<< wire41[(2'h3):(2'h2)]) : wire39))
        begin
          reg92 <= $unsigned((|(wire40 ?
              $signed(wire39) : (^$signed(wire87)))));
          reg93 <= ($signed((+wire41)) ?
              ($signed(($unsigned(reg91) ?
                  wire44[(2'h2):(2'h2)] : wire42)) >> $unsigned($signed(wire40))) : ($unsigned((~{reg92})) ?
                  wire44[(3'h4):(3'h4)] : $signed((^~$unsigned(reg91)))));
          reg94 <= ({$unsigned((8'hb6))} * wire41);
        end
      else
        begin
          if ($signed(((&(-$unsigned(wire89))) ?
              wire39[(3'h6):(2'h2)] : {wire40[(4'hf):(4'hf)]})))
            begin
              reg92 <= $unsigned(reg92);
            end
          else
            begin
              reg92 <= ($unsigned($unsigned({{wire39,
                      (8'hb8)}})) * $unsigned((wire41 ?
                  reg92[(3'h7):(3'h7)] : ((reg93 ? wire89 : wire41) ?
                      $unsigned(wire90) : wire90))));
              reg93 <= $signed($unsigned((8'hb4)));
            end
          reg94 <= $signed(($unsigned($signed((reg91 << wire41))) > {(!$unsigned(wire87)),
              $signed((reg91 ~^ reg94))}));
          if ({wire90})
            begin
              reg95 <= ((wire43[(1'h0):(1'h0)] >= (((wire90 ? (8'hb4) : reg91) ?
                          reg93[(2'h3):(1'h0)] : wire39[(2'h2):(1'h1)]) ?
                      {(!reg93)} : ((wire40 << reg93) ? wire87 : (+wire43)))) ?
                  $unsigned(wire89[(4'ha):(3'h5)]) : ((-$unsigned((reg93 ~^ wire90))) ?
                      (-wire43) : $signed($unsigned((wire89 | reg91)))));
              reg96 <= reg91[(2'h3):(1'h1)];
            end
          else
            begin
              reg95 <= ($unsigned(wire39) ?
                  reg92[(1'h1):(1'h0)] : $signed((($unsigned(wire45) ?
                          (wire39 > reg93) : reg91) ?
                      $unsigned($unsigned(wire40)) : $signed((|wire43)))));
              reg96 <= ($unsigned({($signed(wire39) ?
                          (wire43 ? wire39 : wire45) : (reg95 != wire41)),
                      ($unsigned(wire40) >>> (+wire41))}) ?
                  $unsigned(reg95) : ({wire41[(1'h1):(1'h1)]} <<< wire45));
              reg97 <= wire87[(4'hf):(4'hc)];
            end
          reg98 <= $signed(reg93[(3'h7):(2'h2)]);
          if ((&(($unsigned((&(8'ha2))) ^ (~|$signed(reg94))) <= (+{(wire43 ?
                  wire90 : reg92),
              (reg98 ^ reg97)}))))
            begin
              reg99 <= {($signed(((+reg93) ?
                          (reg92 ~^ wire45) : $signed(reg93))) ?
                      reg91 : (((wire43 ? wire89 : wire87) ?
                          wire45[(3'h4):(1'h1)] : wire90[(4'h8):(3'h5)]) + (((8'h9d) ?
                              reg93 : wire41) ?
                          reg97[(1'h0):(1'h0)] : (!wire41))))};
            end
          else
            begin
              reg99 <= (~&{reg92[(3'h7):(3'h4)],
                  (|({(8'hae), (8'ha0)} - {reg98}))});
            end
        end
      if ((+(8'haf)))
        begin
          reg100 <= reg99;
          reg101 <= (&reg94[(3'h6):(2'h3)]);
          reg102 <= wire45;
          if ((~|(!wire87)))
            begin
              reg103 <= ($signed($signed((reg91 ?
                  (wire40 > reg99) : (~wire90)))) || {$unsigned($signed((reg94 * wire41)))});
              reg104 <= (($signed((~^reg91)) ?
                  ($unsigned((wire41 - reg92)) && ((~^(7'h40)) - reg100[(1'h0):(1'h0)])) : (((reg92 ?
                          wire89 : wire44) >>> $unsigned(reg102)) ?
                      {reg102} : $unsigned(wire87))) >>> (8'hbd));
              reg105 <= reg93[(1'h0):(1'h0)];
            end
          else
            begin
              reg103 <= reg91;
              reg104 <= {(wire44[(1'h0):(1'h0)] ?
                      $signed((~^(^reg101))) : $unsigned($unsigned((wire89 ?
                          reg91 : reg101)))),
                  (~^$unsigned((wire39[(1'h0):(1'h0)] ?
                      $unsigned(reg100) : $signed(wire87))))};
              reg105 <= wire89[(3'h6):(2'h3)];
            end
        end
      else
        begin
          reg100 <= reg96[(2'h3):(1'h0)];
          if (wire45)
            begin
              reg101 <= {reg95[(2'h2):(1'h0)],
                  ((reg104 == wire39[(3'h7):(3'h4)]) + {(!(-(8'ha4)))})};
              reg102 <= wire43;
              reg103 <= reg100;
            end
          else
            begin
              reg101 <= {$unsigned($signed(wire45[(2'h3):(2'h2)])),
                  (wire90 | $unsigned({(reg103 ? (8'haa) : reg103)}))};
              reg102 <= (~&wire40[(4'h8):(3'h4)]);
              reg103 <= (wire87 & reg97);
              reg104 <= reg101[(4'h9):(2'h3)];
              reg105 <= (~$unsigned(wire42[(2'h2):(1'h1)]));
            end
          reg106 <= {$signed(reg91)};
          reg107 <= {wire45, {$unsigned(wire45[(2'h3):(1'h1)])}};
        end
      reg108 <= wire90[(4'hd):(1'h1)];
    end
  assign wire109 = $signed($unsigned((((reg106 - wire39) > (wire43 && reg102)) ?
                       ((|reg91) >>> $signed(reg91)) : $signed((&reg103)))));
endmodule

module module46  (y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'h182):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire51;
  input wire signed [(5'h12):(1'h0)] wire50;
  input wire signed [(4'hb):(1'h0)] wire49;
  input wire signed [(3'h7):(1'h0)] wire48;
  input wire [(5'h11):(1'h0)] wire47;
  wire [(2'h2):(1'h0)] wire77;
  wire [(4'he):(1'h0)] wire76;
  wire [(4'h9):(1'h0)] wire75;
  wire signed [(3'h7):(1'h0)] wire74;
  wire signed [(4'hf):(1'h0)] wire73;
  wire [(2'h3):(1'h0)] wire72;
  wire signed [(4'h8):(1'h0)] wire71;
  wire signed [(5'h14):(1'h0)] wire70;
  wire [(4'h8):(1'h0)] wire57;
  wire signed [(3'h5):(1'h0)] wire56;
  wire signed [(4'he):(1'h0)] wire55;
  wire [(4'ha):(1'h0)] wire54;
  wire signed [(4'hb):(1'h0)] wire53;
  wire signed [(4'hd):(1'h0)] wire52;
  reg signed [(5'h11):(1'h0)] reg86 = (1'h0);
  reg [(2'h3):(1'h0)] reg85 = (1'h0);
  reg [(4'h8):(1'h0)] reg84 = (1'h0);
  reg [(3'h7):(1'h0)] reg83 = (1'h0);
  reg [(5'h14):(1'h0)] reg82 = (1'h0);
  reg [(4'ha):(1'h0)] reg81 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg78 = (1'h0);
  reg [(5'h15):(1'h0)] reg69 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg68 = (1'h0);
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  reg [(3'h5):(1'h0)] reg66 = (1'h0);
  reg [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(3'h4):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg61 = (1'h0);
  reg [(5'h12):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg58 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
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
                 (1'h0)};
  assign wire52 = ((8'hbf) > wire51);
  assign wire53 = (8'h9f);
  assign wire54 = wire50[(3'h6):(3'h4)];
  assign wire55 = $unsigned((((~&(wire53 ? wire54 : wire53)) - ((8'ha3) ?
                          (&wire48) : wire49)) ?
                      (wire52[(3'h6):(1'h0)] * (~&(wire51 * wire48))) : (&$unsigned($signed(wire50)))));
  assign wire56 = $unsigned({(~|$unsigned((~&wire53)))});
  assign wire57 = (wire47[(4'ha):(3'h4)] != wire53);
  always
    @(posedge clk) begin
      if ((+wire51[(3'h5):(1'h1)]))
        begin
          reg58 <= ((!((((7'h42) | wire53) <= (wire48 ? wire47 : (8'ha3))) ?
                  (8'hb1) : (^wire53))) ?
              $signed(wire56[(2'h2):(1'h0)]) : ((~^$signed((8'hbc))) && wire57[(3'h7):(1'h1)]));
          reg59 <= (7'h42);
        end
      else
        begin
          reg58 <= wire48;
          reg59 <= $unsigned($unsigned((^~$unsigned((wire48 + wire56)))));
        end
      reg60 <= wire50;
      reg61 <= ((wire53 | ($signed($unsigned(reg60)) ?
              (~^(wire50 == wire47)) : wire56)) ?
          reg58 : wire54[(1'h0):(1'h0)]);
      if ((-{$signed($unsigned($unsigned(wire52)))}))
        begin
          if (reg61[(4'hc):(1'h1)])
            begin
              reg62 <= ($unsigned((reg61[(2'h3):(2'h2)] <= $signed(wire57[(3'h4):(2'h2)]))) ?
                  reg60 : $signed(($signed(wire52[(3'h4):(1'h0)]) ?
                      (8'had) : $unsigned(((7'h43) ? wire56 : reg59)))));
              reg63 <= $unsigned(((^(~^reg61)) ?
                  (((reg59 - (8'ha5)) ? $signed(reg59) : $unsigned((7'h40))) ?
                      (~$unsigned(reg62)) : reg58[(1'h0):(1'h0)]) : (&(wire48[(2'h3):(1'h0)] ?
                      (wire57 > wire49) : $signed(wire51)))));
              reg64 <= $signed($unsigned(($unsigned((&wire57)) * wire47)));
            end
          else
            begin
              reg62 <= {$unsigned(($signed($signed(reg64)) ?
                      $unsigned($signed(wire47)) : reg62))};
              reg63 <= wire56;
            end
          if ((($unsigned(wire55[(4'h8):(4'h8)]) | wire54) ?
              $unsigned((wire57[(2'h3):(1'h0)] && (reg62[(1'h0):(1'h0)] | wire51))) : (~^{(^~wire55),
                  wire51[(3'h5):(1'h1)]})))
            begin
              reg65 <= wire53;
            end
          else
            begin
              reg65 <= (reg61 ?
                  ($unsigned(reg64) ?
                      $unsigned(($signed((8'hb6)) ?
                          reg58[(1'h0):(1'h0)] : (~&wire52))) : (^~($unsigned(reg61) ?
                          wire47 : {wire47}))) : ($unsigned((reg64[(3'h4):(2'h2)] ~^ $signed(wire57))) == $signed(wire52[(3'h4):(2'h2)])));
              reg66 <= ($signed($signed((7'h44))) && ($unsigned(wire57[(3'h5):(2'h2)]) ^ (reg58 ?
                  (&(reg58 <= wire51)) : $signed({reg64}))));
              reg67 <= $unsigned(wire52);
            end
          reg68 <= reg61[(3'h7):(3'h7)];
        end
      else
        begin
          reg62 <= $unsigned($signed($unsigned(((reg67 ? reg67 : reg59) ?
              ((7'h40) ~^ wire55) : wire51))));
          if ($signed($unsigned($signed((&$unsigned(reg66))))))
            begin
              reg63 <= reg66[(1'h0):(1'h0)];
              reg64 <= $unsigned({(reg60 >= reg64[(2'h2):(1'h0)])});
              reg65 <= reg66;
              reg66 <= $unsigned(($signed($unsigned({(8'haa)})) && $signed(reg65)));
              reg67 <= (^reg64[(2'h2):(1'h1)]);
            end
          else
            begin
              reg63 <= (8'hae);
              reg64 <= {reg64[(2'h2):(1'h0)], reg60[(4'h9):(4'h8)]};
            end
        end
      reg69 <= ((&reg66[(1'h1):(1'h0)]) ~^ ($signed(reg61) <= ((|wire51) ?
          (8'hb9) : ({wire51} ?
              (wire51 ? wire56 : reg63) : (wire47 | reg68)))));
    end
  assign wire70 = ($signed($signed($signed(reg60[(4'hb):(2'h2)]))) ?
                      wire56 : reg67[(2'h2):(2'h2)]);
  assign wire71 = reg69[(3'h4):(2'h2)];
  assign wire72 = {wire52[(4'hd):(1'h0)], $unsigned(wire56)};
  assign wire73 = ($unsigned((~$unsigned(wire47[(3'h6):(3'h5)]))) ^ (+$signed(wire50[(4'h9):(3'h5)])));
  assign wire74 = {$signed({$signed(wire54[(3'h6):(3'h5)])}),
                      $unsigned(wire52)};
  assign wire75 = ($signed(reg69[(4'h8):(1'h1)]) ?
                      $unsigned({((wire53 >> reg63) ~^ $signed(reg63)),
                          $signed(reg65[(1'h1):(1'h0)])}) : ($unsigned(($signed(wire55) ?
                              ((7'h43) ? reg59 : wire74) : ((7'h40) ?
                                  wire48 : reg66))) ?
                          {$signed(wire47),
                              (~&(^reg66))} : {((reg66 <<< wire73) ?
                                  {wire52, (8'ha7)} : $signed((8'hb0)))}));
  assign wire76 = reg69[(5'h14):(4'ha)];
  assign wire77 = $signed((((wire49 >= (wire74 | (7'h43))) ?
                      ((reg68 ?
                          wire51 : wire76) | $unsigned((8'hb8))) : (8'hbd)) << (^~(~^wire72))));
  always
    @(posedge clk) begin
      if ($unsigned(wire52))
        begin
          reg78 <= wire77[(2'h2):(1'h1)];
          reg79 <= (~|wire53);
          if (wire71)
            begin
              reg80 <= wire55[(4'h9):(2'h2)];
              reg81 <= $unsigned((($signed((wire75 ?
                  wire72 : (8'hb3))) - $signed((reg66 != wire52))) >= wire52[(3'h4):(2'h3)]));
            end
          else
            begin
              reg80 <= (8'hac);
              reg81 <= $unsigned($unsigned($unsigned($signed(reg79[(4'h9):(3'h4)]))));
            end
          if (($unsigned({(~&reg61)}) ~^ $signed((&(~|$unsigned(wire49))))))
            begin
              reg82 <= ((8'ha0) && ((+$signed((reg65 ^ reg63))) & ((~$unsigned(wire54)) ?
                  (^~(wire48 ? (8'hb1) : reg58)) : (-$signed(reg80)))));
              reg83 <= (reg69[(4'ha):(4'h8)] ?
                  reg78 : ((!wire73) ?
                      $signed((((8'hb4) != reg81) && $signed(reg61))) : reg66[(1'h1):(1'h1)]));
              reg84 <= reg67[(3'h4):(2'h3)];
              reg85 <= $unsigned($unsigned(wire48[(3'h4):(1'h0)]));
            end
          else
            begin
              reg82 <= (reg60 ? $unsigned(wire52) : reg65);
              reg83 <= (&reg58);
              reg84 <= wire71[(2'h3):(2'h2)];
            end
        end
      else
        begin
          reg78 <= $signed(wire74[(2'h2):(1'h0)]);
        end
      reg86 <= $unsigned($unsigned(reg65[(4'hd):(3'h4)]));
    end
endmodule
