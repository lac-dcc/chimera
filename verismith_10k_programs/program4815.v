module top #(parameter param156 = (7'h44)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1c5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire134;
  wire signed [(3'h4):(1'h0)] wire132;
  wire signed [(5'h13):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire24;
  reg signed [(4'h9):(1'h0)] reg155 = (1'h0);
  reg [(4'h9):(1'h0)] reg154 = (1'h0);
  reg [(5'h15):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg152 = (1'h0);
  reg [(3'h6):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg150 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg149 = (1'h0);
  reg [(5'h15):(1'h0)] reg148 = (1'h0);
  reg [(4'h8):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg146 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg145 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg144 = (1'h0);
  reg [(4'hc):(1'h0)] reg143 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg142 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg141 = (1'h0);
  reg [(4'hb):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg138 = (1'h0);
  reg [(4'hf):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg136 = (1'h0);
  reg [(4'hd):(1'h0)] reg135 = (1'h0);
  reg [(3'h5):(1'h0)] reg4 = (1'h0);
  reg [(5'h13):(1'h0)] reg5 = (1'h0);
  reg [(3'h4):(1'h0)] reg6 = (1'h0);
  reg [(2'h2):(1'h0)] reg7 = (1'h0);
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  assign y = {wire134,
                 wire132,
                 wire25,
                 wire24,
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
                 reg21,
                 reg22,
                 reg23,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((!$signed($unsigned($unsigned({wire3})))))
        begin
          reg4 <= (8'hb7);
          if ((-($signed(wire3) <= $signed(($unsigned(wire3) * (wire0 ^ wire0))))))
            begin
              reg5 <= ({wire2[(2'h3):(1'h1)]} >>> $unsigned(wire2[(4'hb):(4'hb)]));
              reg6 <= ($signed((+(~&(wire2 ? wire2 : reg4)))) ?
                  wire2[(4'ha):(4'h8)] : (|{((8'hbd) ? reg5 : ((8'ha0) > reg4)),
                      (wire2[(1'h0):(1'h0)] ? (+wire1) : (&reg4))}));
              reg7 <= $signed($signed((^$unsigned($unsigned(wire1)))));
              reg8 <= {reg7, wire3};
              reg9 <= wire1;
            end
          else
            begin
              reg5 <= wire0;
            end
          if ((wire0 ?
              $signed((reg9 ~^ reg5)) : (^~$signed((~|$unsigned(reg7))))))
            begin
              reg10 <= wire2[(2'h3):(1'h1)];
              reg11 <= ({{(reg5 <<< wire3),
                      ((wire2 ? wire3 : wire0) ?
                          $unsigned(reg10) : reg4[(3'h4):(3'h4)])}} > reg9);
              reg12 <= reg5;
            end
          else
            begin
              reg10 <= reg11[(1'h1):(1'h0)];
              reg11 <= $unsigned(reg10);
              reg12 <= ($signed(wire0[(2'h2):(1'h0)]) != reg5);
              reg13 <= $unsigned($signed(($signed($signed((8'hb2))) ?
                  (~(reg9 ? wire1 : reg4)) : $unsigned((+wire3)))));
              reg14 <= $unsigned((wire0 ?
                  {((^~(7'h44)) ? reg11 : (~|wire2))} : (reg13[(4'h9):(4'h9)] ?
                      wire2 : (reg8 ?
                          (reg6 ? reg12 : (8'hba)) : $signed(reg5)))));
            end
          reg15 <= $signed($signed(reg13[(4'h9):(2'h2)]));
        end
      else
        begin
          if (wire2[(4'h9):(3'h7)])
            begin
              reg4 <= wire3[(2'h3):(1'h0)];
              reg5 <= reg10[(4'hc):(4'ha)];
              reg6 <= ($unsigned($signed($unsigned($unsigned(wire0)))) ?
                  $signed(reg10[(4'ha):(3'h4)]) : $signed(reg13));
            end
          else
            begin
              reg4 <= (8'ha6);
              reg5 <= (^~reg13);
              reg6 <= (reg6 ^~ ((~&{(reg14 <= wire2)}) < reg10[(1'h1):(1'h0)]));
              reg7 <= reg4;
              reg8 <= wire1[(4'he):(4'hb)];
            end
          reg9 <= {wire1[(4'h8):(3'h6)]};
        end
      reg16 <= (&(({$signed((8'hbc)), (!reg5)} >= reg14[(1'h0):(1'h0)]) ?
          ({((8'hbc) >= reg11),
              ((8'hb9) << reg6)} > $signed(wire2[(1'h0):(1'h0)])) : $unsigned((~((8'ha0) ?
              reg6 : reg5)))));
      if ((|$unsigned((wire1[(4'hb):(3'h6)] && {$signed(reg11)}))))
        begin
          if (wire2[(4'hc):(3'h6)])
            begin
              reg17 <= {$signed(($unsigned(reg5[(4'ha):(1'h1)]) ?
                      wire1[(3'h7):(3'h5)] : reg12))};
            end
          else
            begin
              reg17 <= ($unsigned({((reg12 - reg14) <<< (wire2 ?
                          (8'hba) : wire1)),
                      reg7}) ?
                  $unsigned($signed(((|reg16) ?
                      (^wire3) : reg10))) : $unsigned($signed(((~|reg11) + wire3[(3'h7):(3'h5)]))));
            end
        end
      else
        begin
          reg17 <= $signed(reg6[(2'h2):(2'h2)]);
          reg18 <= (reg17 ?
              $signed($unsigned($signed({reg9, reg4}))) : reg5[(5'h13):(4'h9)]);
          if (reg16)
            begin
              reg19 <= $signed($unsigned({($unsigned(wire3) + (~|reg11)),
                  (((8'ha2) - reg12) ? (8'hb7) : {reg7})}));
              reg20 <= $unsigned(reg12);
              reg21 <= ($signed(reg19) ?
                  ($unsigned({((8'hb6) ? reg14 : wire2), $signed(reg13)}) ?
                      $signed((8'haa)) : $signed($unsigned((8'ha0)))) : (((8'ha9) || ((wire3 ?
                              reg7 : reg19) ?
                          $signed((8'haf)) : (reg10 >>> reg12))) ?
                      $signed($signed(reg20)) : (($unsigned(reg19) * {wire1}) ~^ $signed(reg14))));
            end
          else
            begin
              reg19 <= $signed(reg9);
              reg20 <= ($signed($unsigned((^wire0[(1'h1):(1'h1)]))) ~^ (($signed($unsigned(reg7)) | {(+(8'h9c)),
                  reg5}) ^ {reg14[(4'h8):(3'h5)]}));
            end
        end
      reg22 <= $unsigned({wire2, ((^~reg11) | reg5[(3'h5):(3'h4)])});
      reg23 <= ($signed(((!(reg7 <<< reg20)) ?
              ((+reg5) ? $unsigned(reg11) : {reg21}) : reg8)) ?
          (~reg17[(3'h5):(1'h1)]) : (wire0 ?
              $signed(reg17) : ($signed({reg6, (8'ha2)}) - ({(8'ha0), reg9} ?
                  $unsigned(reg22) : $signed(reg5)))));
    end
  assign wire24 = (reg10 + (reg21 == {(reg13[(3'h5):(1'h1)] | (^reg20))}));
  assign wire25 = $unsigned(({(8'hb6)} >>> $signed(reg8)));
  module26 #() modinst133 (.wire28(wire24), .wire29(reg15), .clk(clk), .wire31(reg12), .wire30(reg11), .wire27(wire1), .y(wire132));
  assign wire134 = (($signed(($signed(reg16) >> {reg19})) ^ (reg16[(4'h8):(3'h4)] * wire24)) ?
                       $unsigned(({(wire1 ? wire0 : reg6)} ?
                           reg7[(2'h2):(1'h1)] : $signed($unsigned((8'hb8))))) : {(reg12[(2'h3):(2'h2)] != wire24)});
  always
    @(posedge clk) begin
      if ($signed((^~$signed(($unsigned(reg11) ? reg10 : $signed(reg6))))))
        begin
          reg135 <= ($signed(({reg11, wire2} < wire132[(1'h0):(1'h0)])) ?
              ({$unsigned(reg11)} && reg18) : ($signed((((7'h41) + (8'ha7)) ?
                  $unsigned(reg6) : $signed(wire134))) * $unsigned((reg7[(2'h2):(1'h0)] ?
                  $unsigned(reg16) : (|wire3)))));
          reg136 <= (reg11 != reg19);
          reg137 <= reg20[(4'hc):(4'hb)];
        end
      else
        begin
          if ({$signed(($unsigned((reg137 ? reg9 : reg135)) ?
                  (reg21[(2'h3):(1'h1)] ?
                      ((8'hab) < (8'hb8)) : $signed(reg16)) : $unsigned(wire1))),
              (8'h9e)})
            begin
              reg135 <= $signed((reg21 ? wire24 : (!$signed(wire24))));
              reg136 <= reg137[(4'hd):(3'h6)];
              reg137 <= ($unsigned((wire132 && (wire0[(3'h6):(3'h6)] ?
                      (wire3 ~^ (8'ha6)) : reg21[(1'h1):(1'h0)]))) ?
                  reg17 : {wire3});
            end
          else
            begin
              reg135 <= ($unsigned($signed($unsigned($unsigned(reg20)))) ?
                  {($unsigned($signed(reg13)) < ($signed(reg6) ^~ (reg16 && reg136))),
                      $signed((~^reg15))} : ($signed(reg16[(2'h2):(2'h2)]) ?
                      ($unsigned({reg22}) ?
                          $signed({reg7}) : reg14[(3'h5):(3'h5)]) : ((reg10 ?
                              $signed(wire2) : (reg23 ? reg135 : wire134)) ?
                          (^~reg21[(1'h1):(1'h0)]) : ((~|reg135) ?
                              {wire24, reg20} : $signed(reg10)))));
            end
          if (($unsigned(wire0[(1'h0):(1'h0)]) ?
              reg137[(1'h1):(1'h0)] : reg135))
            begin
              reg138 <= $signed((~|wire25));
              reg139 <= reg7[(1'h1):(1'h1)];
              reg140 <= $unsigned((&(|reg15[(3'h4):(1'h0)])));
              reg141 <= $signed($unsigned(($unsigned(reg10[(4'h8):(1'h0)]) ?
                  (reg19[(4'ha):(2'h3)] ^ $signed(wire134)) : $signed((reg140 ?
                      wire0 : reg9)))));
              reg142 <= $signed(((^(8'ha6)) > {(^reg12),
                  $unsigned(reg137[(3'h4):(3'h4)])}));
            end
          else
            begin
              reg138 <= ($unsigned(($signed($unsigned((8'ha6))) ?
                      wire2[(3'h7):(2'h2)] : $unsigned((reg11 ?
                          reg20 : wire132)))) ?
                  ((8'ha6) ?
                      reg16[(4'he):(4'hb)] : ($unsigned(wire134[(2'h2):(1'h0)]) ?
                          wire134 : ((reg4 & reg137) ?
                              (reg138 > reg15) : $unsigned(reg10)))) : $signed(($unsigned({(8'hb6),
                      reg5}) + ($signed(wire24) ? reg21 : (^reg14)))));
              reg139 <= reg21[(3'h7):(3'h6)];
            end
          if ({{(8'hbc)}})
            begin
              reg143 <= ($signed(reg12) ?
                  $signed((((~^reg18) > (reg139 * wire0)) > $unsigned(wire0))) : reg137);
              reg144 <= reg14;
              reg145 <= $signed($signed($signed((&(reg144 ? reg17 : reg14)))));
            end
          else
            begin
              reg143 <= reg15;
              reg144 <= ((({(reg140 ? reg144 : reg8),
                          reg139[(3'h5):(3'h4)]} <<< wire2[(4'ha):(2'h3)]) ?
                      reg12[(1'h0):(1'h0)] : (8'hb5)) ?
                  ((^~(!((7'h40) ? reg16 : reg141))) ?
                      ({(+reg10), (reg15 <<< reg19)} ?
                          (8'hb6) : (&{wire24, reg22})) : (~&{$unsigned(reg11),
                          (8'ha3)})) : reg8[(1'h1):(1'h0)]);
              reg145 <= reg135;
              reg146 <= (|{$signed(reg4[(1'h0):(1'h0)]),
                  $signed({{reg9}, (reg8 ? reg23 : reg17)})});
              reg147 <= (reg9[(1'h1):(1'h1)] ^~ (-wire0));
            end
          if ((^~reg141))
            begin
              reg148 <= (reg136[(4'hc):(1'h0)] & ((~^(~(reg4 >> (7'h42)))) && $signed((8'haf))));
              reg149 <= reg142;
              reg150 <= reg23[(3'h7):(3'h5)];
            end
          else
            begin
              reg148 <= (+reg23[(3'h4):(2'h2)]);
              reg149 <= ($unsigned($unsigned((reg22 * reg19[(3'h5):(1'h0)]))) | ($signed((~|reg10[(2'h2):(1'h0)])) ?
                  (reg139 + reg150) : $unsigned((7'h42))));
              reg150 <= $unsigned((8'hb5));
              reg151 <= {(wire0 ^~ (~^(&$unsigned(reg22))))};
              reg152 <= $signed($unsigned($unsigned($signed((wire1 ?
                  reg12 : wire1)))));
            end
          reg153 <= wire132[(1'h1):(1'h0)];
        end
      reg154 <= $unsigned($unsigned((((wire24 <= reg135) ?
              {reg143, reg19} : $unsigned((7'h43))) ?
          $signed($signed(reg22)) : ((reg145 ? reg145 : (8'hb4)) ?
              reg14 : (|reg23)))));
      reg155 <= $signed($signed((^~$signed($signed((8'hb9))))));
    end
endmodule

module module26  (y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'h183):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire31;
  input wire [(3'h5):(1'h0)] wire30;
  input wire signed [(4'he):(1'h0)] wire29;
  input wire signed [(4'ha):(1'h0)] wire28;
  input wire [(4'ha):(1'h0)] wire27;
  wire signed [(4'ha):(1'h0)] wire131;
  wire [(4'h8):(1'h0)] wire130;
  wire signed [(4'h8):(1'h0)] wire129;
  wire signed [(3'h7):(1'h0)] wire128;
  wire [(4'hd):(1'h0)] wire127;
  wire [(4'hf):(1'h0)] wire89;
  wire signed [(4'hb):(1'h0)] wire55;
  wire signed [(4'hf):(1'h0)] wire54;
  wire signed [(4'h9):(1'h0)] wire37;
  wire signed [(5'h12):(1'h0)] wire36;
  wire signed [(3'h4):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire33;
  wire [(5'h15):(1'h0)] wire32;
  wire signed [(5'h14):(1'h0)] wire91;
  wire [(3'h6):(1'h0)] wire92;
  wire [(4'h9):(1'h0)] wire125;
  reg signed [(4'hb):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg50 = (1'h0);
  reg [(3'h6):(1'h0)] reg49 = (1'h0);
  reg [(5'h11):(1'h0)] reg48 = (1'h0);
  reg [(4'h9):(1'h0)] reg47 = (1'h0);
  reg [(4'hc):(1'h0)] reg46 = (1'h0);
  reg [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(3'h6):(1'h0)] reg44 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(5'h11):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(2'h2):(1'h0)] reg38 = (1'h0);
  assign y = {wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire89,
                 wire55,
                 wire54,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire91,
                 wire92,
                 wire125,
                 reg53,
                 reg52,
                 reg51,
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
                 reg39,
                 reg38,
                 (1'h0)};
  assign wire32 = (wire31 ^ ((wire27 ?
                          ($unsigned(wire28) << wire28[(3'h5):(2'h3)]) : ((~^wire28) ?
                              (wire29 ~^ wire28) : (|wire29))) ?
                      wire30[(2'h3):(2'h3)] : wire29));
  assign wire33 = $unsigned($unsigned(($unsigned($unsigned((8'ha6))) - wire30)));
  assign wire34 = (-wire30[(2'h2):(1'h0)]);
  assign wire35 = (wire34[(4'hc):(4'h9)] ?
                      ((8'hac) ? wire34 : wire30) : (($unsigned((wire27 ?
                              (8'hbd) : wire27)) << wire27[(4'h9):(3'h7)]) ?
                          wire32[(5'h11):(3'h7)] : (-((wire33 ?
                              wire29 : wire34) <<< $unsigned(wire29)))));
  assign wire36 = (wire28 * $signed($signed($unsigned(wire27[(3'h7):(3'h7)]))));
  assign wire37 = wire31;
  always
    @(posedge clk) begin
      if ((8'hb4))
        begin
          reg38 <= wire28;
          if (($unsigned($unsigned(wire29[(1'h0):(1'h0)])) ?
              $unsigned(wire34) : (wire32[(5'h10):(1'h0)] <<< $signed(wire31))))
            begin
              reg39 <= (&(((^wire35) ?
                  wire36 : $unsigned($unsigned((8'h9f)))) < ((-$unsigned(wire29)) <<< wire37[(3'h7):(3'h5)])));
              reg40 <= $unsigned((~&(wire34 ?
                  $unsigned((8'hb8)) : wire33[(4'hb):(4'h8)])));
              reg41 <= $signed(reg38);
            end
          else
            begin
              reg39 <= (+((8'had) ?
                  wire28[(1'h1):(1'h1)] : {($unsigned(wire37) + $signed(wire33))}));
              reg40 <= (8'hb1);
              reg41 <= $unsigned($signed($unsigned((-$unsigned(wire32)))));
              reg42 <= {$signed((&(wire30 ?
                      $unsigned(wire30) : ((8'hb9) ? wire32 : reg38)))),
                  (7'h41)};
            end
          if ($unsigned($unsigned((wire34[(3'h6):(3'h4)] ~^ reg41))))
            begin
              reg43 <= ((wire37 ?
                      $signed(($unsigned(reg39) != wire33[(5'h11):(2'h2)])) : $unsigned(wire30[(3'h4):(2'h2)])) ?
                  $signed((wire32 ?
                      $unsigned((wire27 ?
                          (8'ha9) : (8'hb5))) : $signed($unsigned(reg39)))) : (&$signed($unsigned($signed(reg41)))));
            end
          else
            begin
              reg43 <= (reg39 ? wire32 : reg40);
            end
          reg44 <= {reg41};
          reg45 <= {{{(+{(8'hb0)}), $unsigned((~wire27))},
                  reg38[(1'h1):(1'h1)]}};
        end
      else
        begin
          reg38 <= $unsigned($unsigned((((reg39 ? wire30 : wire28) < (wire31 ?
                  wire34 : wire30)) ?
              (reg43 | {reg43, reg44}) : ((~^wire37) ?
                  (!wire27) : $signed(reg40)))));
          reg39 <= $signed(wire32[(3'h6):(2'h3)]);
          reg40 <= (7'h42);
          reg41 <= $signed(wire27[(4'h9):(1'h1)]);
        end
      if (reg41[(4'h8):(2'h3)])
        begin
          if (wire30)
            begin
              reg46 <= $unsigned((((|(reg43 || wire36)) ?
                  (^$unsigned(wire34)) : (~|$signed(reg39))) & (^(reg43[(4'hb):(3'h5)] || $signed(wire29)))));
              reg47 <= (wire37 ^~ $unsigned((^~$unsigned((wire28 < (8'hbd))))));
              reg48 <= ({wire36} ?
                  $unsigned($unsigned((((8'hac) ? reg45 : reg42) ?
                      (&reg38) : (~|reg38)))) : reg38);
              reg49 <= (~&$signed(wire32));
              reg50 <= ((({{reg38, (8'hbe)}} * $signed({wire34})) ?
                      wire27 : ((wire33[(4'hf):(4'hb)] || (8'hb3)) < $unsigned({reg47,
                          reg48}))) ?
                  reg43[(2'h2):(2'h2)] : $unsigned($unsigned(((~&reg49) ?
                      (reg38 | reg47) : {wire35}))));
            end
          else
            begin
              reg46 <= (!wire29);
              reg47 <= (~^((wire32 ^ {$signed(reg43),
                      (wire31 ? reg46 : wire30)}) ?
                  reg39 : reg40));
              reg48 <= wire28[(3'h5):(2'h3)];
              reg49 <= wire30;
              reg50 <= wire27;
            end
          reg51 <= reg49[(3'h6):(3'h5)];
          reg52 <= reg50;
        end
      else
        begin
          if (reg46[(2'h2):(1'h1)])
            begin
              reg46 <= (~&wire32);
              reg47 <= wire37[(3'h7):(1'h0)];
            end
          else
            begin
              reg46 <= $unsigned(reg49[(3'h4):(2'h3)]);
              reg47 <= wire29[(3'h7):(3'h5)];
              reg48 <= ($signed(($signed((wire35 ? (7'h43) : wire35)) ?
                      (!(wire37 ? wire37 : reg48)) : wire29)) ?
                  {(&{{wire36}, $signed(reg47)}),
                      reg39[(3'h6):(3'h5)]} : {(reg43 || (-(reg51 & reg40)))});
              reg49 <= reg45[(2'h2):(2'h2)];
            end
          reg50 <= reg51[(3'h4):(1'h1)];
          reg51 <= (8'ha6);
          reg52 <= reg46[(2'h2):(1'h1)];
          reg53 <= ((((!{wire32, wire29}) <= $unsigned((wire35 ?
                      reg48 : reg48))) ?
                  (((&(7'h40)) ? reg49 : ((8'ha6) ? wire34 : reg41)) ?
                      $unsigned($signed(reg41)) : $unsigned((~^(8'hb7)))) : wire30[(1'h0):(1'h0)]) ?
              wire28 : reg49[(2'h3):(2'h3)]);
        end
    end
  assign wire54 = reg45;
  assign wire55 = reg45;
  module56 #() modinst90 (.y(wire89), .clk(clk), .wire59(reg46), .wire60(reg49), .wire57(reg48), .wire58(wire34));
  assign wire91 = $signed($signed($signed(wire35)));
  assign wire92 = ($unsigned($signed(((wire27 ~^ wire37) - wire36[(1'h1):(1'h0)]))) < wire37[(2'h3):(1'h0)]);
  module93 #() modinst126 (wire125, clk, reg41, wire91, wire37, wire27);
  assign wire127 = wire36[(2'h3):(2'h3)];
  assign wire128 = $signed(($signed(wire55[(3'h7):(1'h1)]) ?
                       $signed((reg46 ?
                           $signed(wire31) : $unsigned(wire37))) : ({wire32,
                               $unsigned((8'hab))} ?
                           (8'ha1) : $signed((wire28 ? (8'haa) : reg39)))));
  assign wire129 = ((8'ha3) ? reg49[(1'h1):(1'h0)] : {wire37});
  assign wire130 = ($unsigned($unsigned(wire127[(3'h6):(3'h4)])) | $signed((reg39[(1'h1):(1'h0)] ?
                       $signed(reg38[(1'h1):(1'h0)]) : (-(^wire28)))));
  assign wire131 = $unsigned(reg41[(3'h4):(1'h0)]);
endmodule

module module93
#(parameter param124 = ((((((8'hab) ? (8'ha7) : (8'h9f)) * (|(8'hbd))) >>> (^((8'ha1) ? (8'hb6) : (8'hb3)))) ? (~&(~|(~|(8'ha3)))) : {(((8'hb1) <= (8'ha4)) ? {(8'hbd)} : (&(8'hb7)))}) < (((((8'hbc) ? (7'h41) : (8'hbe)) * (~|(8'ha7))) > (^((8'hab) ? (8'haa) : (8'hba)))) ? (~|(^~((8'hab) <= (8'hae)))) : {{{(8'h9f), (8'hb1)}}})))
(y, clk, wire97, wire96, wire95, wire94);
  output wire [(32'h137):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire97;
  input wire [(5'h14):(1'h0)] wire96;
  input wire [(4'h8):(1'h0)] wire95;
  input wire signed [(4'ha):(1'h0)] wire94;
  wire [(4'h9):(1'h0)] wire123;
  wire [(3'h4):(1'h0)] wire122;
  wire signed [(2'h2):(1'h0)] wire121;
  wire [(5'h14):(1'h0)] wire120;
  wire signed [(2'h2):(1'h0)] wire119;
  wire [(5'h10):(1'h0)] wire117;
  wire [(5'h15):(1'h0)] wire116;
  wire [(4'h9):(1'h0)] wire115;
  wire [(4'hc):(1'h0)] wire114;
  wire [(3'h4):(1'h0)] wire113;
  wire [(5'h15):(1'h0)] wire112;
  reg [(2'h3):(1'h0)] reg118 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg110 = (1'h0);
  reg [(4'he):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg108 = (1'h0);
  reg [(4'hc):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg104 = (1'h0);
  reg [(5'h15):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg101 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg100 = (1'h0);
  reg [(5'h11):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg98 = (1'h0);
  assign y = {wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 reg118,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg98 <= $signed({wire94});
      reg99 <= {wire97};
      if ((reg99[(1'h0):(1'h0)] ?
          wire96 : $unsigned((+($signed(wire96) == (-reg98))))))
        begin
          reg100 <= reg98;
          reg101 <= (8'hac);
          reg102 <= (-{reg98});
        end
      else
        begin
          reg100 <= (({(reg100[(1'h1):(1'h1)] < wire96),
              $unsigned((~wire95))} < $unsigned($signed((!reg101)))) >= wire96);
          reg101 <= ($unsigned((({wire95} ?
                  {reg99} : ((8'hb6) ? reg98 : (8'ha7))) ~^ $unsigned(reg98))) ?
              ($signed(reg101) >> $unsigned($signed({reg100}))) : ($unsigned((^~reg99[(3'h7):(1'h0)])) * $unsigned(({wire94,
                      reg101} ?
                  (reg99 ~^ (8'ha7)) : (wire95 ? wire95 : wire95)))));
        end
      if (reg98)
        begin
          if ($signed({$unsigned($unsigned((^~wire96))), reg99}))
            begin
              reg103 <= wire96[(2'h2):(1'h0)];
              reg104 <= (($unsigned($signed(reg99[(4'h9):(2'h2)])) ?
                      (wire95 ?
                          $unsigned($unsigned(reg103)) : reg101[(1'h0):(1'h0)]) : reg103) ?
                  ((8'ha5) & (|(~&reg100))) : (~$signed(((^~reg103) ?
                      (^~wire95) : wire94[(1'h1):(1'h0)]))));
            end
          else
            begin
              reg103 <= wire94[(1'h0):(1'h0)];
              reg104 <= $signed({{$unsigned((-wire96))},
                  (&reg102[(1'h1):(1'h1)])});
              reg105 <= ($signed(wire97) == wire97[(4'h9):(4'h8)]);
            end
          if ($unsigned(($unsigned(((^reg105) ^ (wire97 ? reg104 : (8'hbb)))) ?
              reg105 : (-{reg100}))))
            begin
              reg106 <= ((reg105 ?
                      (-(^~(8'hb8))) : ($unsigned(reg102[(1'h0):(1'h0)]) | $unsigned($unsigned(reg100)))) ?
                  {(wire97[(3'h6):(2'h2)] && (wire97[(4'h8):(3'h5)] ?
                          $unsigned(reg99) : $unsigned(reg104)))} : $unsigned($unsigned(wire95[(2'h3):(2'h2)])));
              reg107 <= $signed(reg102[(5'h14):(4'ha)]);
              reg108 <= (&$signed($signed(((reg106 + reg98) ?
                  ((8'hb3) ? reg102 : wire97) : (reg103 & (8'hb1))))));
              reg109 <= {(~|(+reg104))};
            end
          else
            begin
              reg106 <= reg103;
            end
          reg110 <= $signed(reg109);
        end
      else
        begin
          if ((8'ha4))
            begin
              reg103 <= reg108;
              reg104 <= {((~|$unsigned((reg106 <= reg105))) == ({reg100[(2'h2):(1'h1)]} ^~ ($unsigned(reg110) ?
                      (^reg107) : reg103)))};
              reg105 <= ((reg102 ?
                      $unsigned({wire97,
                          reg101[(2'h2):(1'h0)]}) : $signed(reg106[(3'h5):(3'h5)])) ?
                  $signed(reg103[(4'h8):(1'h1)]) : (({(reg110 >> wire94)} >>> ((wire95 > wire96) + (reg99 ?
                          reg106 : wire97))) ?
                      ($unsigned(reg99[(3'h5):(3'h4)]) ?
                          $signed((+(8'h9e))) : (reg109 ^~ $unsigned((8'h9e)))) : $unsigned($signed(reg105[(1'h1):(1'h1)]))));
              reg106 <= $signed((({(reg102 ? reg101 : reg106),
                      reg100[(3'h4):(2'h3)]} ^~ ({wire95} ?
                      (wire97 != (8'hb4)) : {(8'hbc), reg105})) ?
                  wire95[(4'h8):(2'h2)] : $unsigned({$unsigned(reg102),
                      (reg103 & wire96)})));
              reg107 <= ($unsigned({wire95[(1'h0):(1'h0)],
                  wire96}) <= reg101[(1'h0):(1'h0)]);
            end
          else
            begin
              reg103 <= ($unsigned($unsigned((reg104[(2'h2):(1'h1)] ?
                  $signed(reg100) : (+reg110)))) & (reg109[(1'h0):(1'h0)] ?
                  reg99[(4'h9):(4'h9)] : ($signed($unsigned(wire97)) ^~ wire96[(5'h10):(1'h0)])));
              reg104 <= reg107[(3'h4):(3'h4)];
              reg105 <= $signed($unsigned((8'hb5)));
              reg106 <= ((!reg101) ?
                  reg107 : $unsigned((+((8'hbc) >> ((8'hae) - reg98)))));
            end
        end
      reg111 <= $unsigned((8'haa));
    end
  assign wire112 = reg110;
  assign wire113 = ((~|$signed((|$unsigned((8'h9d))))) ?
                       ((^~reg99[(2'h2):(1'h1)]) ~^ $unsigned(((reg102 ?
                           reg108 : (8'hb7)) & {reg102}))) : $signed(reg102));
  assign wire114 = wire94[(4'h8):(1'h0)];
  assign wire115 = (~&(&(|{$unsigned(reg104), $unsigned((8'hab))})));
  assign wire116 = (~^$signed($signed((reg99[(4'h8):(2'h2)] ?
                       reg102 : (reg98 < reg100)))));
  assign wire117 = ($unsigned(wire114[(2'h2):(1'h1)]) > (({$signed(reg100),
                           $unsigned((8'ha0))} ?
                       (~|(reg110 - wire113)) : (reg103 ?
                           (reg99 ?
                               reg111 : (8'hab)) : wire115[(1'h0):(1'h0)])) >= (&$signed((~|reg98)))));
  always
    @(posedge clk) begin
      reg118 <= $signed($signed(wire97));
    end
  assign wire119 = wire95[(2'h3):(1'h1)];
  assign wire120 = $signed($unsigned($unsigned((-{(8'h9d)}))));
  assign wire121 = wire115;
  assign wire122 = ($unsigned((wire112[(3'h4):(2'h3)] ?
                       (&$unsigned(wire115)) : $signed(reg99[(4'hf):(3'h4)]))) <<< ((~^(!((8'ha3) ?
                           wire120 : wire113))) ?
                       wire119 : $unsigned(reg101[(1'h0):(1'h0)])));
  assign wire123 = (~^(($signed((reg100 ? reg99 : reg111)) ^~ ((&(8'hb7)) ?
                       reg99 : wire94)) && (wire121 ^ $unsigned(((8'hbd) ?
                       reg118 : reg101)))));
endmodule

module module56  (y, clk, wire60, wire59, wire58, wire57);
  output wire [(32'h14b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire60;
  input wire [(4'h9):(1'h0)] wire59;
  input wire signed [(4'hf):(1'h0)] wire58;
  input wire signed [(5'h11):(1'h0)] wire57;
  wire signed [(4'h9):(1'h0)] wire88;
  wire [(4'hc):(1'h0)] wire87;
  wire signed [(3'h5):(1'h0)] wire86;
  wire signed [(5'h15):(1'h0)] wire85;
  wire signed [(5'h12):(1'h0)] wire73;
  wire [(2'h2):(1'h0)] wire72;
  wire [(4'hb):(1'h0)] wire71;
  wire [(5'h10):(1'h0)] wire70;
  wire signed [(3'h5):(1'h0)] wire69;
  wire signed [(5'h12):(1'h0)] wire63;
  wire [(3'h4):(1'h0)] wire62;
  wire [(4'hb):(1'h0)] wire61;
  reg [(5'h12):(1'h0)] reg84 = (1'h0);
  reg [(4'ha):(1'h0)] reg83 = (1'h0);
  reg [(4'h9):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg81 = (1'h0);
  reg [(2'h2):(1'h0)] reg80 = (1'h0);
  reg [(5'h12):(1'h0)] reg79 = (1'h0);
  reg [(5'h12):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(4'hb):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire63,
                 wire62,
                 wire61,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 (1'h0)};
  assign wire61 = $signed(($unsigned($unsigned({wire59})) || (^{(wire58 ?
                          wire57 : wire59)})));
  assign wire62 = $unsigned(wire61[(1'h1):(1'h1)]);
  assign wire63 = wire59;
  always
    @(posedge clk) begin
      if (((wire62 ? $unsigned((8'hba)) : $signed((wire57 ? wire57 : wire62))) ?
          wire61 : (8'h9c)))
        begin
          reg64 <= $unsigned($unsigned({((wire58 ? (8'had) : wire59) ?
                  $signed(wire58) : $signed(wire59)),
              (wire61 || (wire63 || wire62))}));
        end
      else
        begin
          reg64 <= {(-$signed(((wire60 ^~ wire60) ~^ wire62[(2'h3):(1'h1)]))),
              wire58};
          reg65 <= ($unsigned(($unsigned($unsigned(wire58)) ?
                  ((wire57 << wire59) ?
                      wire58 : (wire63 ? wire57 : wire58)) : wire60)) ?
              wire60 : (^((reg64[(4'hb):(3'h5)] + wire63) ?
                  wire63 : ((|wire60) == $unsigned((8'h9d))))));
          reg66 <= (($signed((~(wire61 | wire61))) || (8'ha3)) & $unsigned(((wire61[(1'h0):(1'h0)] ?
              (&wire62) : wire62[(2'h3):(2'h3)]) >> ({wire58} ?
              $signed(wire63) : (&wire62)))));
          reg67 <= (&(wire58[(2'h3):(1'h1)] ?
              {wire59[(1'h0):(1'h0)]} : $unsigned($unsigned(wire59[(3'h4):(1'h1)]))));
          reg68 <= $unsigned((&reg67));
        end
    end
  assign wire69 = $unsigned($signed($unsigned($unsigned($unsigned(wire62)))));
  assign wire70 = $unsigned(({$unsigned($unsigned(wire63))} ?
                      reg67 : reg65[(3'h4):(2'h3)]));
  assign wire71 = wire59[(3'h7):(1'h0)];
  assign wire72 = $unsigned($signed($signed((!{reg67, wire69}))));
  assign wire73 = wire60[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      if ($signed($signed(((^~$unsigned(wire70)) & (reg65[(2'h3):(2'h3)] ?
          reg64[(3'h5):(3'h5)] : (reg65 >> wire60))))))
        begin
          if (wire71)
            begin
              reg74 <= (wire61[(4'hb):(4'h8)] ?
                  wire69[(2'h2):(2'h2)] : $signed(reg67[(1'h0):(1'h0)]));
              reg75 <= (8'h9d);
              reg76 <= {(8'hb7)};
            end
          else
            begin
              reg74 <= ((8'hb6) | $signed(wire73[(5'h12):(4'hc)]));
              reg75 <= $signed($signed($unsigned($unsigned(wire60))));
              reg76 <= (~(reg65[(2'h2):(2'h2)] * reg68[(3'h4):(3'h4)]));
              reg77 <= $signed(wire60);
              reg78 <= $unsigned(reg77);
            end
          reg79 <= ((($unsigned((+wire61)) >>> $signed((wire62 | wire69))) ?
              reg68[(4'hb):(4'h8)] : wire69) <<< ($signed(wire57[(4'h8):(3'h5)]) >= (8'ha4)));
          reg80 <= reg74[(4'hc):(3'h6)];
          reg81 <= reg65;
        end
      else
        begin
          reg74 <= wire60;
          reg75 <= $unsigned((reg67[(1'h1):(1'h0)] >= ($unsigned((wire59 ?
              (8'h9c) : reg74)) || wire73[(5'h11):(3'h6)])));
          reg76 <= (wire62[(1'h0):(1'h0)] ?
              wire62[(1'h1):(1'h0)] : {reg76,
                  (((reg80 ? wire63 : wire60) <<< $unsigned((7'h42))) ?
                      $signed((&reg66)) : $signed((reg68 ? wire71 : wire57)))});
        end
      reg82 <= $unsigned(wire59[(3'h5):(1'h0)]);
      reg83 <= ($unsigned($signed((wire71 ? reg64 : reg76[(3'h7):(3'h5)]))) ?
          wire59[(2'h2):(1'h0)] : (~&$signed({reg78,
              (wire60 ? reg81 : reg76)})));
      reg84 <= $unsigned({$signed((reg80 < reg81[(4'ha):(3'h4)]))});
    end
  assign wire85 = ({(&$signed(reg65))} ?
                      $signed(reg81[(3'h5):(3'h5)]) : $signed(reg74[(3'h7):(3'h4)]));
  assign wire86 = reg66;
  assign wire87 = ((wire62[(3'h4):(1'h0)] ?
                          $signed(((wire57 ~^ reg84) ?
                              (reg78 + reg76) : {reg79})) : $unsigned((8'hbe))) ?
                      $unsigned(wire73[(4'hb):(1'h1)]) : reg84[(4'hc):(3'h5)]);
  assign wire88 = ($unsigned(reg84[(2'h3):(1'h0)]) ?
                      (~&reg75[(2'h3):(1'h1)]) : (8'ha2));
endmodule
