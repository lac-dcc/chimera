module top
#(parameter param166 = (!{{(+((7'h42) ? (8'ha8) : (8'haa)))}}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h241):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire4;
  input wire [(2'h3):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire165;
  wire signed [(2'h2):(1'h0)] wire163;
  wire [(5'h10):(1'h0)] wire53;
  wire [(4'hc):(1'h0)] wire52;
  wire [(4'ha):(1'h0)] wire51;
  wire signed [(4'ha):(1'h0)] wire50;
  wire [(5'h13):(1'h0)] wire49;
  wire [(5'h13):(1'h0)] wire48;
  wire [(5'h13):(1'h0)] wire47;
  wire signed [(5'h15):(1'h0)] wire46;
  wire [(4'h8):(1'h0)] wire12;
  wire signed [(4'ha):(1'h0)] wire11;
  wire [(4'ha):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg [(3'h4):(1'h0)] reg34 = (1'h0);
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  reg [(3'h7):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(2'h2):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  assign y = {wire165,
                 wire163,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
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
                 (1'h0)};
  assign wire5 = $signed((!(wire4 ?
                     wire0[(4'h9):(3'h5)] : ((wire4 ? wire2 : (8'hbb)) ?
                         wire4 : wire3))));
  assign wire6 = wire4;
  assign wire7 = (wire5[(3'h5):(1'h1)] >= wire2[(3'h7):(3'h7)]);
  assign wire8 = $unsigned(wire4[(3'h7):(3'h4)]);
  assign wire9 = (~wire4[(2'h3):(1'h1)]);
  assign wire10 = (^(~&($signed(wire9[(3'h5):(1'h1)]) ?
                      $unsigned($signed(wire8)) : wire5)));
  assign wire11 = $signed(wire7[(2'h2):(1'h0)]);
  assign wire12 = (8'h9e);
  always
    @(posedge clk) begin
      reg13 <= $unsigned(($unsigned((-(~wire0))) ?
          (8'ha5) : (wire9[(2'h3):(1'h1)] ?
              $signed(wire8[(2'h2):(1'h0)]) : ({wire0} ?
                  wire12 : ((8'hb2) ? wire9 : wire7)))));
    end
  always
    @(posedge clk) begin
      if (wire12)
        begin
          reg14 <= {($unsigned(((wire8 == wire12) & (wire10 << wire2))) ?
                  wire3[(2'h3):(2'h3)] : reg13[(2'h2):(2'h2)]),
              (reg13 ? reg13 : $unsigned($unsigned($signed(wire4))))};
          reg15 <= wire12;
          reg16 <= (+(wire1[(3'h7):(2'h2)] ?
              (($unsigned(reg13) ^ $unsigned((8'hb4))) ?
                  (((8'ha9) <= wire0) ?
                      {wire5, wire1} : ((8'ha3) ?
                          wire11 : wire10)) : reg15[(1'h1):(1'h0)]) : wire7[(1'h0):(1'h0)]));
          reg17 <= wire11;
        end
      else
        begin
          reg14 <= {wire8[(3'h6):(1'h1)]};
          reg15 <= $signed($signed((|(reg13[(4'hb):(2'h3)] ?
              ((8'hbf) ? reg16 : wire4) : (8'had)))));
          reg16 <= $signed($signed($unsigned(reg16)));
          reg17 <= (~&reg16);
        end
      reg18 <= ({reg14[(5'h13):(3'h6)]} ^~ $signed(((7'h41) != wire4[(3'h6):(2'h2)])));
      reg19 <= $signed(($signed(reg17[(4'hc):(3'h4)]) ?
          {(&(+reg17))} : $unsigned($unsigned($unsigned(wire3)))));
    end
  always
    @(posedge clk) begin
      if (({(reg13[(5'h11):(1'h1)] ?
              $signed((&wire1)) : $signed(wire2[(4'h8):(3'h5)])),
          wire2[(4'h9):(4'h9)]} && $signed(wire12)))
        begin
          reg20 <= wire6;
          reg21 <= $signed((^~$unsigned($unsigned((wire10 != wire12)))));
          reg22 <= ((reg13[(4'hc):(1'h0)] ?
              (~&wire0) : (+wire9[(3'h6):(3'h5)])) * ((~&$signed({wire12})) >= ((((7'h44) ?
                  wire10 : wire7) ?
              ((8'ha2) > wire9) : ((8'hb4) >= wire0)) >> ({reg18, reg19} ?
              {(8'h9d)} : wire1))));
          reg23 <= ((&wire12) ?
              $unsigned(reg17[(5'h10):(3'h5)]) : {$signed(({wire3} ?
                      wire2 : (wire8 > wire10))),
                  wire4[(3'h6):(1'h1)]});
        end
      else
        begin
          reg20 <= $signed($signed(($unsigned((&(8'hbc))) ?
              $unsigned((8'hac)) : $unsigned((reg23 > wire8)))));
          reg21 <= (~&(wire6[(3'h5):(3'h5)] ?
              (^~((reg15 && wire7) ?
                  $signed(wire7) : $signed(reg20))) : (($unsigned(wire0) ?
                      (&wire6) : {reg15, reg20}) ?
                  {$unsigned(reg21)} : ((!reg17) <= (wire1 ? reg15 : wire9)))));
          if (wire8)
            begin
              reg22 <= wire6;
              reg23 <= wire9[(2'h2):(1'h1)];
            end
          else
            begin
              reg22 <= ($signed((reg23 & $unsigned((&wire7)))) - reg18[(1'h1):(1'h1)]);
              reg23 <= $signed(reg16[(4'hf):(2'h2)]);
              reg24 <= (reg14[(1'h0):(1'h0)] || $unsigned((+((wire12 ?
                  reg18 : wire12) + reg20))));
              reg25 <= (^~$signed((+((-wire7) < {reg22}))));
              reg26 <= $signed(($unsigned(wire9) ?
                  ($unsigned((wire2 ~^ reg24)) ?
                      wire10 : $signed(wire12)) : $unsigned((~((7'h44) ^~ reg24)))));
            end
        end
      if ({$signed((8'ha7)), $unsigned($unsigned(reg25))})
        begin
          if ($unsigned($unsigned(reg22)))
            begin
              reg27 <= wire4[(1'h1):(1'h1)];
              reg28 <= wire2[(4'h8):(2'h3)];
              reg29 <= $signed($signed(wire11));
            end
          else
            begin
              reg27 <= {{$unsigned(wire4),
                      ($unsigned((wire3 ? reg18 : reg15)) ?
                          ((reg17 ^ reg14) >= (-wire1)) : {(-wire12)})},
                  ((((~reg14) + $unsigned(reg16)) ?
                      ((8'hbc) && $unsigned(wire4)) : ({reg19} == (|wire0))) <<< $signed($unsigned((|reg16))))};
              reg28 <= {(!({reg13, {(8'had), reg23}} && wire9))};
              reg29 <= {{(7'h44)}};
            end
          if (reg19[(2'h3):(2'h2)])
            begin
              reg30 <= reg15;
              reg31 <= reg15[(3'h7):(3'h4)];
              reg32 <= reg15;
              reg33 <= (($unsigned((~|(reg17 | wire4))) ?
                  {$unsigned((^reg29))} : {{((8'hb9) ?
                              reg13 : (7'h40))}}) <= $signed(reg26[(4'h9):(1'h0)]));
              reg34 <= (+(&$signed(reg26[(4'ha):(4'h9)])));
            end
          else
            begin
              reg30 <= (~(($signed(reg24[(2'h2):(1'h1)]) ?
                  (^~reg31[(3'h7):(2'h2)]) : ((|(8'ha4)) ^~ (reg24 | (8'hb4)))) >= reg21));
            end
        end
      else
        begin
          if (($unsigned(wire1[(2'h2):(1'h0)]) ?
              $unsigned($signed($signed((reg16 < reg30)))) : (&$unsigned({wire2}))))
            begin
              reg27 <= $signed($signed($signed((wire10 ?
                  $unsigned(reg33) : (|(7'h42))))));
            end
          else
            begin
              reg27 <= $signed({reg21, $unsigned($unsigned((~|wire8)))});
              reg28 <= reg34;
              reg29 <= ((reg21 ?
                  (reg23 ?
                      (!wire12[(3'h6):(1'h1)]) : ($signed(wire8) ?
                          $signed(wire3) : ((8'haa) & reg22))) : $signed($unsigned($signed(reg31)))) ^ ($unsigned(({reg16} ?
                  {(8'hb9)} : reg24)) <= (!$unsigned(((8'hbd) < wire3)))));
              reg30 <= $signed((&(+$unsigned($unsigned(reg22)))));
            end
          reg31 <= (reg18[(1'h1):(1'h1)] > reg24[(1'h1):(1'h1)]);
          reg32 <= reg23[(4'hb):(3'h7)];
        end
      if ((reg23[(4'ha):(2'h3)] ?
          $unsigned({$signed($signed(wire9)),
              (|(8'ha9))}) : $signed(((!(wire10 ? wire7 : wire1)) > ({reg14,
              reg24} <= ((8'ha7) || wire6))))))
        begin
          reg35 <= ($unsigned(reg13[(4'hc):(2'h3)]) + wire8[(4'h8):(2'h2)]);
          reg36 <= ({$signed(((+wire6) ? $signed(reg26) : $signed(wire4)))} ?
              {reg15} : (!wire9));
          reg37 <= (|(($signed((-wire2)) >> ($unsigned(reg26) ?
              $unsigned(reg19) : $signed((8'hb0)))) | (!($signed(reg32) + reg28[(3'h7):(1'h0)]))));
          reg38 <= wire9[(3'h6):(3'h6)];
          reg39 <= wire5;
        end
      else
        begin
          reg35 <= (8'hb5);
        end
      if (((wire11 ?
          reg37[(3'h5):(2'h3)] : ($unsigned((reg21 ?
              reg23 : reg14)) ^~ (~|reg31[(3'h5):(3'h4)]))) ^ (~&$signed($unsigned(wire2)))))
        begin
          reg40 <= {reg32};
          reg41 <= ((wire5[(2'h3):(1'h0)] | $unsigned($unsigned((reg20 ?
              wire8 : reg22)))) * (((~&(reg21 ?
                  reg16 : reg15)) && $unsigned($unsigned(reg15))) ?
              $unsigned(wire10[(3'h6):(1'h0)]) : (+$signed((wire8 >> (8'haf))))));
          reg42 <= {((~&({reg23} ^ $unsigned(reg25))) ?
                  {wire5, reg34[(1'h0):(1'h0)]} : reg15)};
          reg43 <= (&(reg25 + (((~|reg21) ?
              (~reg33) : (wire1 ?
                  wire1 : wire0)) - ($signed(wire6) >> $signed(reg14)))));
        end
      else
        begin
          reg40 <= (((-$signed({reg26})) ^~ $unsigned(((~&reg28) ?
              {wire4} : (8'ha4)))) - (7'h40));
          reg41 <= (($signed(({reg17, reg24} + (reg36 <= reg34))) ?
              $signed((8'ha4)) : ($unsigned(wire2) ?
                  ({reg40, reg37} ?
                      (|reg34) : $unsigned(reg36)) : (-reg32[(3'h6):(3'h4)]))) + {(&$signed(reg25[(3'h4):(2'h3)]))});
          reg42 <= $signed(((8'hbd) > $signed(reg40)));
          reg43 <= (reg41 ? {reg30[(2'h3):(2'h3)]} : reg43);
          reg44 <= ((&wire9) && reg26);
        end
      reg45 <= reg40;
    end
  assign wire46 = ($unsigned(($unsigned((~^reg37)) < ((reg39 > reg34) ?
                      reg44[(3'h5):(3'h5)] : ((8'hb0) >> wire0)))) >> {(+wire10),
                      reg26[(2'h2):(2'h2)]});
  assign wire47 = (~^({($unsigned(reg36) || (reg25 >= (8'haa))),
                      ((reg24 ?
                          (7'h40) : reg20) && (+wire10))} + reg43[(4'hc):(4'ha)]));
  assign wire48 = $signed(wire0);
  assign wire49 = reg27[(2'h3):(1'h0)];
  assign wire50 = reg32;
  assign wire51 = {{($unsigned(wire5[(3'h4):(1'h1)]) ?
                              $signed((reg17 && reg22)) : reg23[(4'ha):(4'h9)])},
                      $unsigned((~|$signed((reg38 && wire9))))};
  assign wire52 = $unsigned(reg42[(3'h4):(3'h4)]);
  assign wire53 = $unsigned({{(wire5[(2'h2):(1'h0)] >>> reg22[(1'h0):(1'h0)]),
                          $unsigned(((8'ha9) * reg35))}});
  module54 #() modinst164 (wire163, clk, wire6, reg37, reg32, wire0);
  assign wire165 = (wire12[(3'h5):(3'h4)] ?
                       {(({reg43} >>> (~^reg27)) + $signed($signed(reg40)))} : (8'ha0));
endmodule

module module54  (y, clk, wire58, wire57, wire56, wire55);
  output wire [(32'h3a1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire58;
  input wire signed [(4'h9):(1'h0)] wire57;
  input wire [(2'h2):(1'h0)] wire56;
  input wire [(5'h15):(1'h0)] wire55;
  wire [(5'h10):(1'h0)] wire134;
  wire [(5'h13):(1'h0)] wire133;
  wire [(4'hd):(1'h0)] wire88;
  wire signed [(4'hb):(1'h0)] wire87;
  wire signed [(4'ha):(1'h0)] wire86;
  wire [(4'hc):(1'h0)] wire85;
  wire signed [(5'h12):(1'h0)] wire84;
  wire [(5'h14):(1'h0)] wire82;
  wire [(3'h7):(1'h0)] wire59;
  reg signed [(4'hb):(1'h0)] reg162 = (1'h0);
  reg [(2'h2):(1'h0)] reg161 = (1'h0);
  reg [(4'hd):(1'h0)] reg160 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg159 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg157 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg156 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg155 = (1'h0);
  reg [(4'h9):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg152 = (1'h0);
  reg [(4'ha):(1'h0)] reg151 = (1'h0);
  reg [(5'h13):(1'h0)] reg150 = (1'h0);
  reg [(4'hd):(1'h0)] reg149 = (1'h0);
  reg [(3'h5):(1'h0)] reg148 = (1'h0);
  reg [(5'h15):(1'h0)] reg147 = (1'h0);
  reg [(3'h4):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg145 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg144 = (1'h0);
  reg [(4'hf):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg142 = (1'h0);
  reg [(4'he):(1'h0)] reg141 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg139 = (1'h0);
  reg [(4'h8):(1'h0)] reg138 = (1'h0);
  reg [(5'h13):(1'h0)] reg137 = (1'h0);
  reg [(4'he):(1'h0)] reg136 = (1'h0);
  reg [(5'h11):(1'h0)] reg135 = (1'h0);
  reg [(5'h14):(1'h0)] reg132 = (1'h0);
  reg [(2'h2):(1'h0)] reg131 = (1'h0);
  reg [(3'h6):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg128 = (1'h0);
  reg [(5'h13):(1'h0)] reg127 = (1'h0);
  reg [(5'h15):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg125 = (1'h0);
  reg [(4'h8):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg123 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg122 = (1'h0);
  reg [(2'h3):(1'h0)] reg121 = (1'h0);
  reg [(4'he):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg119 = (1'h0);
  reg [(4'hc):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg115 = (1'h0);
  reg [(4'h9):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg113 = (1'h0);
  reg [(4'h9):(1'h0)] reg112 = (1'h0);
  reg [(4'he):(1'h0)] reg111 = (1'h0);
  reg [(5'h11):(1'h0)] reg110 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg109 = (1'h0);
  reg [(5'h10):(1'h0)] reg108 = (1'h0);
  reg [(4'he):(1'h0)] reg107 = (1'h0);
  reg [(5'h11):(1'h0)] reg106 = (1'h0);
  reg [(4'hb):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg101 = (1'h0);
  reg [(2'h3):(1'h0)] reg100 = (1'h0);
  reg [(4'hd):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg98 = (1'h0);
  reg [(3'h5):(1'h0)] reg97 = (1'h0);
  reg [(5'h11):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg95 = (1'h0);
  reg [(4'hc):(1'h0)] reg94 = (1'h0);
  reg [(4'h9):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg92 = (1'h0);
  reg [(3'h7):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg90 = (1'h0);
  reg [(4'h8):(1'h0)] reg89 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire82,
                 wire59,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
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
                 reg118,
                 reg117,
                 reg116,
                 reg115,
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
                 (1'h0)};
  assign wire59 = (($unsigned(((~^(8'ha2)) ?
                              (wire58 && wire56) : $signed(wire58))) ?
                          $unsigned($signed({wire55})) : (((wire57 <<< wire57) ?
                              $signed(wire57) : wire57) - wire57[(1'h1):(1'h0)])) ?
                      {({wire57[(2'h3):(2'h3)]} ? wire57 : $signed((+wire55))),
                          (8'haa)} : (~&wire55));
  module60 #() modinst83 (.wire64(wire59), .y(wire82), .wire61(wire57), .wire62(wire55), .wire63(wire58), .clk(clk));
  assign wire84 = ($signed((-(!$unsigned((8'h9c))))) ?
                      {(wire59[(2'h3):(2'h2)] <= (-wire56[(1'h1):(1'h0)]))} : (~&($unsigned($signed(wire59)) ?
                          ((wire82 ?
                              wire58 : wire58) ~^ $unsigned(wire57)) : $unsigned((-wire56)))));
  assign wire85 = wire82;
  assign wire86 = ({wire57[(3'h4):(1'h0)],
                          (((wire82 & wire58) ?
                              (~wire85) : (wire58 >> wire59)) < $unsigned(wire58[(3'h7):(2'h3)]))} ?
                      wire84[(1'h1):(1'h1)] : ($signed(((|wire55) ?
                          (8'h9d) : $unsigned(wire84))) < (^wire59)));
  assign wire87 = (^(|(|((~&wire56) << $signed(wire84)))));
  assign wire88 = ($signed(({(wire86 & wire59), (wire56 ? wire59 : wire57)} ?
                      wire85 : wire82)) ~^ $signed($signed((|wire59[(3'h7):(3'h7)]))));
  always
    @(posedge clk) begin
      reg89 <= {(&wire82)};
      reg90 <= (~&(+{(~^wire86),
          (wire86 ? (wire59 ~^ wire85) : $signed(reg89))}));
      reg91 <= (wire82[(3'h7):(1'h0)] ?
          ($unsigned(wire85[(4'hc):(3'h5)]) && (~$unsigned((reg89 ?
              wire84 : wire55)))) : $unsigned((~|wire84[(3'h6):(1'h0)])));
      reg92 <= ((wire86 + $signed(((&reg89) ~^ (~^wire86)))) > wire84[(5'h10):(3'h5)]);
      if ((^(wire82[(5'h14):(5'h14)] < reg91)))
        begin
          if ($unsigned(wire82[(4'h8):(3'h4)]))
            begin
              reg93 <= wire87[(4'h8):(3'h4)];
              reg94 <= (wire55 ~^ (8'hb1));
              reg95 <= (^((((+reg92) & $unsigned(reg89)) ^~ wire58) <<< $unsigned(reg93[(2'h2):(1'h0)])));
              reg96 <= ((($unsigned((wire57 - wire86)) < (~reg95[(2'h2):(1'h0)])) ?
                      {($signed(wire59) ? reg95 : $unsigned(reg94)),
                          reg93[(3'h5):(3'h4)]} : (&(|$signed(reg91)))) ?
                  reg89[(1'h1):(1'h0)] : $unsigned({(8'hb6)}));
              reg97 <= $signed($signed((-reg95[(1'h1):(1'h1)])));
            end
          else
            begin
              reg93 <= $signed(wire85);
              reg94 <= wire88;
              reg95 <= wire59[(3'h6):(1'h1)];
            end
          reg98 <= (wire87 != ({{$signed(wire58)}} ?
              {$unsigned({wire85})} : ($unsigned((wire88 ? wire86 : wire85)) ?
                  $unsigned((wire57 & wire86)) : $signed((reg94 > reg90)))));
          if (($unsigned((reg91 ^~ $unsigned((+(8'hb2))))) | $signed(($unsigned(((7'h41) ?
                  reg97 : reg96)) ?
              (reg95 | (reg89 ? reg95 : wire57)) : {(reg93 <= wire82)}))))
            begin
              reg99 <= wire59[(1'h0):(1'h0)];
            end
          else
            begin
              reg99 <= ((($unsigned((~&reg93)) ?
                  ((reg99 ? wire84 : reg89) ?
                      wire88[(1'h0):(1'h0)] : (reg93 ?
                          reg97 : wire55)) : {$signed(reg99),
                      reg96}) >= (^wire59)) >> ($signed($unsigned((+reg89))) - $signed($unsigned(reg96[(1'h0):(1'h0)]))));
            end
        end
      else
        begin
          reg93 <= reg90[(1'h1):(1'h1)];
          reg94 <= $unsigned((reg97 <= (~^$unsigned(reg92[(3'h6):(3'h6)]))));
          reg95 <= $signed($unsigned(wire58[(2'h2):(1'h1)]));
          if (reg98[(2'h2):(2'h2)])
            begin
              reg96 <= (|(wire56[(2'h2):(2'h2)] ^~ (((reg92 | wire85) * (wire58 ?
                      (8'ha8) : reg99)) ?
                  wire85[(4'h9):(2'h2)] : (8'hba))));
              reg97 <= (((({(8'ha0), reg99} < $unsigned(wire59)) ?
                      reg89 : $unsigned((!wire85))) ?
                  wire57[(2'h3):(2'h3)] : (|reg90[(1'h1):(1'h0)])) <<< (($unsigned($signed(reg95)) ?
                      $unsigned((reg93 ?
                          reg98 : reg96)) : wire56[(2'h2):(1'h0)]) ?
                  (wire85[(4'hc):(4'h8)] ?
                      $signed({wire87, wire59}) : ((wire85 ?
                          reg92 : reg91) >> reg96)) : (~&wire55)));
              reg98 <= {((reg96 ? (+$unsigned(wire84)) : wire56) ?
                      reg96[(3'h4):(2'h3)] : wire84),
                  (~wire57)};
            end
          else
            begin
              reg96 <= $unsigned(($signed($signed($unsigned(wire86))) ?
                  reg91[(2'h2):(2'h2)] : {(~(reg95 ? wire59 : reg93))}));
            end
          if ((($unsigned({(-reg91),
              (wire86 ^~ wire57)}) * {$unsigned((^~(7'h40)))}) <= (((7'h41) ?
                  ((+wire59) <= $unsigned(reg92)) : $unsigned(wire58[(2'h3):(2'h2)])) ?
              (~$signed((8'hb9))) : (~^$unsigned($signed(reg91))))))
            begin
              reg99 <= (wire84 ?
                  $signed($unsigned($unsigned($unsigned(wire55)))) : ((!(|(reg89 ?
                      reg99 : reg93))) > {$signed((+wire87)),
                      ((reg99 ? wire86 : wire82) ?
                          $unsigned(reg89) : (wire55 - reg91))}));
              reg100 <= ($unsigned(($signed(reg91[(2'h2):(1'h1)]) ?
                  ((|reg97) ?
                      reg95 : (wire87 ? reg95 : (8'hb5))) : ($signed(wire87) ?
                      (8'hba) : (wire82 ? reg98 : reg94)))) >> ((((reg89 ?
                          wire56 : wire56) ?
                      wire59[(3'h4):(2'h2)] : reg89[(1'h0):(1'h0)]) ?
                  wire84[(4'he):(2'h3)] : reg92) >> $signed((((8'hbb) ?
                  (8'hb2) : wire56) ^~ (wire58 ? reg90 : wire86)))));
              reg101 <= $signed(reg96[(3'h6):(3'h4)]);
              reg102 <= reg91;
            end
          else
            begin
              reg99 <= reg96[(3'h7):(1'h0)];
            end
        end
    end
  always
    @(posedge clk) begin
      reg103 <= (~(^(~&$unsigned(reg92[(3'h6):(2'h2)]))));
      reg104 <= reg101[(3'h7):(3'h7)];
      if (reg95)
        begin
          reg105 <= ($signed($signed($signed((reg89 <= wire57)))) ?
              (wire57[(4'h8):(3'h6)] ?
                  (~|((reg101 >= reg94) ?
                      (wire55 ?
                          wire84 : reg96) : (-(8'ha9)))) : reg98[(3'h4):(3'h4)]) : ($unsigned((|(reg98 ?
                      wire57 : wire84))) ?
                  (8'hbb) : wire86[(3'h7):(3'h4)]));
          if ($signed(wire88[(3'h5):(1'h0)]))
            begin
              reg106 <= $unsigned((8'hb3));
            end
          else
            begin
              reg106 <= $signed(reg94);
              reg107 <= wire84;
            end
          if ($signed((|($signed(reg107[(1'h0):(1'h0)]) ?
              ((8'ha9) >> wire55) : wire82[(4'h8):(4'h8)]))))
            begin
              reg108 <= (^~wire57[(3'h7):(3'h4)]);
              reg109 <= ((((wire55[(4'h9):(4'h9)] ?
                          $unsigned(wire86) : $unsigned(wire87)) ?
                      (~$signed((7'h43))) : wire85) ?
                  ((wire55[(3'h5):(3'h4)] && reg106[(3'h7):(3'h6)]) > ((wire55 + (8'hae)) >> (reg91 + (8'ha0)))) : reg107) <<< ($unsigned(wire59) < wire88[(3'h4):(1'h1)]));
              reg110 <= (!reg95[(3'h4):(2'h2)]);
            end
          else
            begin
              reg108 <= reg90[(1'h1):(1'h1)];
            end
        end
      else
        begin
          reg105 <= $unsigned(({$unsigned($unsigned(reg109)),
              (8'hbe)} * wire84[(1'h0):(1'h0)]));
          if ((~{(((wire85 ^~ wire55) == $signed(reg108)) ?
                  reg92 : reg109[(3'h4):(3'h4)])}))
            begin
              reg106 <= (^~wire86);
              reg107 <= ($unsigned($unsigned($signed(reg108[(4'he):(4'ha)]))) | reg107);
            end
          else
            begin
              reg106 <= reg99[(3'h7):(3'h7)];
              reg107 <= ($unsigned((~$signed((+reg102)))) ^~ (~&(((reg103 ?
                      reg101 : wire86) ?
                  reg90 : reg98[(3'h4):(2'h2)]) ~^ $unsigned(reg96))));
              reg108 <= (((~&reg102[(3'h5):(1'h1)]) | (((reg110 ?
                      reg106 : wire86) == {reg105}) ?
                  wire59[(2'h2):(1'h0)] : $unsigned((~&wire87)))) ^ (^~reg97));
              reg109 <= reg104[(4'ha):(1'h0)];
            end
          reg110 <= (!wire82);
          reg111 <= {$signed(reg103[(3'h7):(2'h3)])};
        end
      reg112 <= reg89[(2'h3):(2'h2)];
    end
  always
    @(posedge clk) begin
      if ((+{($unsigned($unsigned(reg110)) - $unsigned({reg100, reg102}))}))
        begin
          if (wire85)
            begin
              reg113 <= {(^(($signed((8'hab)) ?
                      reg91[(3'h5):(2'h2)] : $unsigned(wire56)) ^ reg100[(2'h2):(1'h1)])),
                  reg110[(3'h7):(3'h6)]};
              reg114 <= (~(^~$signed((^$signed(wire56)))));
              reg115 <= $unsigned(wire82[(5'h10):(3'h7)]);
            end
          else
            begin
              reg113 <= (|$unsigned($unsigned(({reg100, (8'ha0)} ?
                  reg110[(4'ha):(4'h9)] : $unsigned(wire57)))));
            end
        end
      else
        begin
          reg113 <= reg92;
          reg114 <= $unsigned($signed($unsigned($signed($signed(reg110)))));
          reg115 <= (wire55 ?
              (($unsigned((wire86 < wire56)) > reg103[(4'hb):(4'ha)]) ?
                  reg110[(3'h4):(2'h3)] : {(reg97 <<< $unsigned(wire57))}) : ($unsigned({reg100[(2'h3):(2'h3)]}) || ((&$signed(wire87)) ^ $signed(reg113))));
          if (($unsigned(reg101) ?
              $signed($signed(reg98[(2'h3):(2'h3)])) : $unsigned(reg110)))
            begin
              reg116 <= (&wire86[(3'h7):(3'h7)]);
            end
          else
            begin
              reg116 <= reg116[(3'h4):(1'h1)];
              reg117 <= (~^(~^$signed({reg94[(1'h1):(1'h0)]})));
              reg118 <= ({{(7'h43), $signed(reg116)},
                      (($unsigned(reg107) + (reg109 >>> reg102)) ?
                          {{reg101, reg104}, $unsigned(reg115)} : ((wire84 ?
                                  wire84 : reg90) ?
                              $unsigned((8'hae)) : (reg96 <<< reg106)))} ?
                  wire82 : reg94);
              reg119 <= (+(reg90[(2'h3):(1'h0)] < ((~$signed((8'ha0))) > ((&reg96) ?
                  reg98 : (reg91 ? reg111 : reg95)))));
              reg120 <= (^~(+(^~(!(reg115 - reg90)))));
            end
          if (reg100)
            begin
              reg121 <= wire85;
              reg122 <= (7'h41);
              reg123 <= reg110;
            end
          else
            begin
              reg121 <= ($unsigned($unsigned(($signed(wire88) * $unsigned((8'ha7))))) ?
                  $signed(reg108) : wire55[(4'ha):(2'h2)]);
              reg122 <= $signed((~&$unsigned(({reg98, reg114} ?
                  (reg110 <= (8'ha0)) : reg102[(2'h2):(1'h1)]))));
              reg123 <= reg106[(4'hc):(4'hb)];
              reg124 <= (reg119 * (|$signed(((reg97 - wire58) ?
                  reg108[(3'h5):(2'h2)] : $unsigned(reg91)))));
            end
        end
      reg125 <= $signed((($unsigned((^~reg106)) << (~|$signed(reg91))) ?
          reg108 : reg99));
      reg126 <= ((8'hb4) ? (!(8'hbe)) : (reg94 >> reg120[(2'h2):(2'h2)]));
      reg127 <= {($signed(reg115) ~^ reg102[(3'h4):(2'h2)]),
          (reg94 ? wire55[(5'h10):(4'hc)] : (-$unsigned($unsigned((8'hbd)))))};
      reg128 <= reg115[(4'h9):(2'h2)];
    end
  always
    @(posedge clk) begin
      reg129 <= reg126;
    end
  always
    @(posedge clk) begin
      reg130 <= reg110;
      reg131 <= reg126;
      reg132 <= reg89[(2'h2):(2'h2)];
    end
  assign wire133 = ((reg101 & ($unsigned($unsigned(reg89)) ? reg112 : reg103)) ?
                       ($unsigned(reg104[(3'h5):(3'h5)]) * ((|$signed(reg118)) || $unsigned({(8'hbf),
                           (8'hbe)}))) : ($signed((reg92[(2'h2):(2'h2)] ?
                           (~(8'hb2)) : (^~reg117))) >>> ((reg98[(1'h1):(1'h0)] ?
                               (&(7'h42)) : (reg113 != wire56)) ?
                           (~|reg109) : (reg109 * $signed(reg125)))));
  assign wire134 = $unsigned($signed((+($unsigned(reg115) ?
                       ((7'h43) >= (8'hb6)) : $unsigned(reg94)))));
  always
    @(posedge clk) begin
      if ($signed((wire134 ?
          wire57[(3'h6):(1'h1)] : ((reg117[(4'ha):(2'h3)] <= (wire57 >= (8'haf))) ?
              ((7'h41) ?
                  $unsigned(wire82) : reg127[(3'h7):(3'h7)]) : (reg103[(4'ha):(1'h1)] - {reg97})))))
        begin
          reg135 <= $unsigned(reg92[(3'h6):(2'h3)]);
          reg136 <= reg135[(3'h7):(3'h7)];
        end
      else
        begin
          reg135 <= $unsigned(($unsigned({(&wire59)}) ^ $signed($signed(reg135))));
          if ($signed(($signed((^wire59[(3'h6):(3'h4)])) ?
              $unsigned({wire57}) : {$signed((wire133 | wire58))})))
            begin
              reg136 <= $signed(reg135);
              reg137 <= reg98[(1'h1):(1'h0)];
              reg138 <= ($signed(wire55) ^ reg123);
            end
          else
            begin
              reg136 <= $signed($signed((-wire57)));
              reg137 <= (&$signed($signed({reg102[(2'h3):(1'h0)], {reg114}})));
              reg138 <= reg113;
            end
          reg139 <= (^~$signed(wire86));
        end
    end
  always
    @(posedge clk) begin
      if ($unsigned((reg119 ?
          ((-reg123[(1'h0):(1'h0)]) ?
              $signed(wire87[(3'h7):(3'h5)]) : ($signed(wire86) ?
                  reg111 : (reg97 == reg105))) : reg114[(3'h4):(1'h1)])))
        begin
          reg140 <= (&$signed($unsigned(reg125[(3'h5):(3'h4)])));
          reg141 <= $unsigned($unsigned(reg93[(3'h4):(1'h0)]));
        end
      else
        begin
          reg140 <= ((reg131[(2'h2):(2'h2)] == $signed({(wire82 ?
                      (8'haf) : reg97)})) ?
              reg131[(1'h1):(1'h0)] : ((~reg117) != $signed(reg101)));
        end
      reg142 <= $unsigned((~^((|reg139) >> reg115)));
      if ((&(~^reg130)))
        begin
          reg143 <= {wire134};
          reg144 <= reg140;
          if ({reg95[(2'h2):(1'h1)]})
            begin
              reg145 <= $unsigned(((8'h9e) || $unsigned((reg111[(1'h1):(1'h1)] >= (-reg141)))));
              reg146 <= ({$unsigned($signed($unsigned(reg143))),
                      $unsigned(reg101[(4'h8):(2'h3)])} ?
                  (|wire86) : ((wire55[(4'ha):(2'h3)] || $signed((reg104 ?
                          reg101 : wire87))) ?
                      (+$unsigned((~^reg128))) : (+reg115)));
              reg147 <= (({(~(reg122 ? reg121 : reg107))} ?
                      ($signed(reg105[(2'h2):(2'h2)]) > ((wire57 ?
                          reg142 : reg130) * (&reg100))) : (wire85 ?
                          reg103[(5'h12):(5'h11)] : {reg113,
                              ((8'hb7) ? reg136 : wire86)})) ?
                  (((&(wire55 - reg138)) ~^ ($signed(reg120) ?
                          $unsigned(wire82) : wire87)) ?
                      $signed($signed(reg142[(1'h0):(1'h0)])) : (8'hb3)) : {reg139[(4'hb):(3'h7)],
                      (-{$signed(reg97), reg105[(2'h3):(1'h0)]})});
              reg148 <= (($unsigned($unsigned((reg117 != (8'h9c)))) ?
                      reg137 : $signed($signed(reg115[(4'h8):(3'h4)]))) ?
                  reg116 : $signed((reg96[(4'hd):(4'hd)] < ((reg128 << reg125) - $signed(reg89)))));
              reg149 <= (~&((~|reg141) <= reg101[(4'ha):(1'h0)]));
            end
          else
            begin
              reg145 <= $unsigned((^reg145));
              reg146 <= wire86[(3'h6):(3'h6)];
            end
          if ({(reg92 << ((reg106 ?
                  $unsigned(reg138) : {wire59, (8'hb9)}) << ((reg117 ?
                      wire55 : reg142) ?
                  $signed(reg95) : $signed(reg107)))),
              $signed((((reg112 ? (8'haf) : reg146) ?
                  (!wire58) : reg104) ^~ (-reg123)))})
            begin
              reg150 <= $signed((reg141[(3'h5):(3'h5)] ?
                  reg131[(2'h2):(1'h0)] : (!($unsigned(wire87) - (wire84 > reg145)))));
              reg151 <= reg131[(1'h1):(1'h0)];
            end
          else
            begin
              reg150 <= (8'hab);
              reg151 <= (($signed((~|$unsigned(reg90))) ?
                      $signed(reg144[(1'h0):(1'h0)]) : $signed(((reg101 ~^ (8'hb7)) + reg99))) ?
                  reg129 : $signed(((!{reg106}) ?
                      $signed($unsigned(wire85)) : (((8'ha3) << reg97) ?
                          $signed((8'ha8)) : {(8'hbd), reg149}))));
              reg152 <= ($unsigned(wire88) ^~ ($signed((wire134[(4'h8):(1'h0)] >= $unsigned(reg116))) - $unsigned(reg115[(1'h0):(1'h0)])));
              reg153 <= {$signed((reg139 ? $unsigned(reg97) : reg130)),
                  {reg143[(4'he):(1'h0)], (reg100 >> ({reg148} && reg96))}};
            end
        end
      else
        begin
          reg143 <= reg146[(2'h3):(1'h1)];
          reg144 <= ($unsigned((((8'hb2) ? (^wire55) : $signed(reg113)) ?
                  reg129[(3'h4):(1'h0)] : (wire133 ?
                      (reg126 != (8'ha0)) : reg108))) ?
              (wire57[(3'h5):(2'h3)] | ($signed(reg132[(3'h5):(1'h1)]) ?
                  (~|reg130) : (reg123 >>> (reg149 ?
                      wire88 : reg115)))) : wire87[(3'h4):(1'h0)]);
          reg145 <= ((reg117 * wire55[(4'h9):(4'h9)]) ?
              $unsigned(wire134[(4'ha):(1'h1)]) : ({reg120[(4'hc):(4'hc)],
                  reg101[(4'hc):(1'h0)]} >= wire58));
          reg146 <= (~{reg90});
        end
      if (reg138[(1'h0):(1'h0)])
        begin
          reg154 <= reg136;
          reg155 <= {reg92};
          reg156 <= (reg118[(3'h5):(3'h5)] || $unsigned(reg141[(4'hc):(4'hb)]));
          if (((!reg100) ?
              ((&$unsigned((!reg95))) ^~ $signed((8'hb1))) : wire88))
            begin
              reg157 <= $signed((~|(^$signed({reg124, (8'hb7)}))));
              reg158 <= (&$signed((^~(~&$unsigned(reg131)))));
              reg159 <= $signed((wire88[(3'h7):(3'h5)] > reg123[(1'h1):(1'h1)]));
              reg160 <= $unsigned(($unsigned($unsigned((reg141 >>> (8'ha3)))) - $signed((-((8'hb6) ?
                  reg90 : reg113)))));
            end
          else
            begin
              reg157 <= (((reg103 ~^ (reg158[(4'h8):(3'h7)] == $unsigned(reg100))) ?
                  $signed(reg94) : (!(~^$signed((8'hb7))))) >= ($unsigned({reg93,
                  $unsigned((8'hb8))}) >> $unsigned(reg104)));
              reg158 <= ((wire86 && $unsigned(wire59[(3'h4):(3'h4)])) < {$unsigned((8'hb0)),
                  (~^{(reg145 ? reg108 : reg106)})});
              reg159 <= reg125[(4'hc):(4'h8)];
              reg160 <= $signed((8'hbc));
              reg161 <= {(~(reg147[(2'h3):(1'h1)] == reg101))};
            end
          reg162 <= (^~$signed($unsigned(reg156)));
        end
      else
        begin
          if (reg100[(2'h2):(2'h2)])
            begin
              reg154 <= reg160;
              reg155 <= $unsigned(reg128[(2'h2):(2'h2)]);
            end
          else
            begin
              reg154 <= {$unsigned(reg154[(1'h0):(1'h0)])};
              reg155 <= (((reg123[(1'h0):(1'h0)] >> ((reg129 >>> wire134) << ((8'hb9) | wire85))) ?
                      $signed(reg125) : $signed(wire134)) ?
                  (reg142 ?
                      $unsigned(reg92[(3'h6):(3'h5)]) : $unsigned(reg94)) : (+(reg143 ?
                      $unsigned((reg121 ? wire82 : reg113)) : (((7'h41) ?
                          reg120 : (8'ha6)) & (reg120 + reg108)))));
              reg156 <= (wire58 >>> $signed({(+reg119),
                  reg141[(4'hd):(3'h6)]}));
              reg157 <= {((8'hb5) < reg97),
                  ($unsigned(((^reg128) ? reg92 : $unsigned((8'ha4)))) ?
                      $signed({(reg129 - reg96),
                          (wire133 != reg142)}) : ((wire134 ?
                          reg112 : $signed(reg122)) >> (&((8'ha0) ?
                          reg142 : reg96))))};
              reg158 <= wire87[(4'ha):(3'h7)];
            end
        end
    end
endmodule

module module60
#(parameter param81 = (((^~(((8'hba) ? (8'ha9) : (8'hb7)) ? {(8'h9d)} : ((8'h9f) + (8'hab)))) <<< (((~&(8'hbf)) != ((8'haf) > (8'hae))) == (~|(8'hbf)))) >= ((&(-(^~(8'hbc)))) ? (^~({(7'h44)} ? ((7'h41) >>> (8'hb0)) : (~|(8'ha9)))) : ((8'h9e) >>> (~|((8'h9c) - (8'hba)))))))
(y, clk, wire64, wire63, wire62, wire61);
  output wire [(32'hd3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire64;
  input wire signed [(5'h11):(1'h0)] wire63;
  input wire [(5'h15):(1'h0)] wire62;
  input wire signed [(4'h8):(1'h0)] wire61;
  wire signed [(3'h5):(1'h0)] wire80;
  wire [(5'h15):(1'h0)] wire79;
  wire signed [(4'h9):(1'h0)] wire78;
  wire [(4'h9):(1'h0)] wire77;
  wire [(5'h10):(1'h0)] wire75;
  wire signed [(2'h2):(1'h0)] wire70;
  wire [(5'h12):(1'h0)] wire69;
  wire signed [(5'h15):(1'h0)] wire68;
  wire signed [(5'h15):(1'h0)] wire67;
  wire [(4'hb):(1'h0)] wire66;
  wire signed [(5'h10):(1'h0)] wire65;
  reg signed [(5'h10):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg73 = (1'h0);
  reg [(5'h10):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg71 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire75,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 reg76,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 (1'h0)};
  assign wire65 = (|$signed((^~wire61)));
  assign wire66 = wire62[(2'h2):(1'h1)];
  assign wire67 = ((|(wire66[(4'h8):(1'h0)] ? wire65[(4'ha):(2'h3)] : wire66)) ?
                      ((7'h44) ?
                          {wire63} : (~&{(~wire62),
                              (wire64 - (8'h9c))})) : $signed((($signed(wire65) ?
                              ((8'ha2) ? wire64 : wire61) : {(8'ha1), wire64}) ?
                          wire61[(3'h4):(1'h1)] : wire63)));
  assign wire68 = ((-({$signed(wire62),
                      {(8'hae),
                          wire64}} ~^ wire66)) * $signed($signed(wire67[(3'h6):(2'h3)])));
  assign wire69 = wire67[(1'h1):(1'h1)];
  assign wire70 = (($unsigned((^~$unsigned(wire63))) <<< (((8'haa) ?
                      wire67 : wire66) != (~(~wire66)))) * wire64[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg71 <= (~|(wire63[(4'hb):(1'h0)] ?
          {($signed(wire70) - (~wire66)), wire69} : (~^wire68[(4'ha):(4'ha)])));
      reg72 <= ($unsigned((^~((-wire68) & wire69[(3'h4):(1'h1)]))) > ({((8'hb2) != (+wire65)),
              wire65[(4'hc):(4'h8)]} ?
          $unsigned({(wire64 ? wire61 : (8'haa)), reg71}) : (~|(&{wire69}))));
    end
  always
    @(posedge clk) begin
      reg73 <= $signed({(wire64 ?
              ($unsigned(wire61) ?
                  $signed(wire63) : wire65[(4'h8):(1'h1)]) : $unsigned($signed(wire68))),
          wire63[(4'hd):(1'h1)]});
      reg74 <= $signed((~^{$unsigned((wire63 ? wire61 : reg73))}));
    end
  assign wire75 = $signed(((~^wire65) ?
                      wire67 : ($unsigned(reg73) ?
                          $unsigned($unsigned(wire67)) : ($signed(wire67) * $unsigned(wire63)))));
  always
    @(posedge clk) begin
      reg76 <= {wire62};
    end
  assign wire77 = $signed({$unsigned($unsigned((8'haa)))});
  assign wire78 = $unsigned((reg71 == reg76));
  assign wire79 = ({(~|reg76)} < {$signed($signed($unsigned((8'haa)))),
                      (~|$unsigned(wire68))});
  assign wire80 = $unsigned(($unsigned((8'haa)) << (((wire62 >> wire68) < (wire62 ?
                      (8'had) : reg73)) >> (8'ha4))));
endmodule
