module top
#(parameter param161 = (((({(8'hb3), (8'hb7)} << ((8'ha2) ^~ (8'ha4))) != (((8'ha5) ? (8'hb8) : (8'had)) ? {(8'hb0), (8'hba)} : (8'hb5))) <<< (~|((|(8'hb1)) ? ((8'hb2) ? (8'hb5) : (8'hab)) : {(8'hae)}))) > (-{(((7'h44) > (7'h42)) ? ((8'ha2) ? (8'had) : (8'hac)) : {(8'ha1)})})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h20f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire160;
  wire signed [(4'hf):(1'h0)] wire159;
  wire signed [(3'h5):(1'h0)] wire158;
  wire signed [(4'h9):(1'h0)] wire157;
  wire signed [(4'hd):(1'h0)] wire156;
  wire signed [(4'he):(1'h0)] wire155;
  wire signed [(2'h3):(1'h0)] wire154;
  wire [(4'hd):(1'h0)] wire153;
  wire signed [(4'h9):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire38;
  wire [(4'ha):(1'h0)] wire151;
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  reg [(4'h9):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire5,
                 wire6,
                 wire7,
                 wire38,
                 wire151,
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
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = wire2;
  assign wire6 = $signed((8'hba));
  assign wire7 = $signed($signed(wire4));
  always
    @(posedge clk) begin
      reg8 <= $unsigned((!wire4));
      reg9 <= (((~&wire1[(3'h4):(2'h2)]) ?
          (8'hb7) : $signed(((~|wire7) ?
              (wire0 ? wire4 : wire5) : wire3))) < wire4);
      reg10 <= wire7;
      if (reg10[(1'h0):(1'h0)])
        begin
          reg11 <= wire2;
          if (wire7[(2'h3):(2'h3)])
            begin
              reg12 <= ({({(^reg10), (wire7 ? wire1 : (8'hbd))} ?
                      wire6[(4'he):(4'he)] : wire2[(2'h2):(1'h1)])} >> (^(~^($unsigned(wire7) <<< (reg9 ?
                  wire6 : wire1)))));
              reg13 <= reg8[(5'h12):(3'h5)];
              reg14 <= (($unsigned({(wire7 != reg12), wire1[(3'h6):(2'h3)]}) ?
                  $unsigned({$signed(wire4),
                      wire4[(4'h9):(3'h7)]}) : (-(~|(reg12 >= wire7)))) ~^ wire4);
              reg15 <= (wire4[(3'h4):(1'h1)] <<< (($unsigned($signed(wire4)) ?
                      ((wire4 ?
                          wire6 : reg12) < $signed(wire7)) : $signed($unsigned(reg14))) ?
                  {$unsigned({wire5, (8'hb7)})} : ((8'haf) <<< (+(wire5 ?
                      reg10 : wire2)))));
              reg16 <= wire1;
            end
          else
            begin
              reg12 <= reg14[(4'h8):(3'h4)];
              reg13 <= reg14;
              reg14 <= $signed($unsigned((~^reg13)));
              reg15 <= wire7[(3'h4):(2'h3)];
              reg16 <= $signed((reg9 ? reg9 : reg14));
            end
          reg17 <= (!reg13[(4'hf):(4'h9)]);
          if (((!(+({wire2} ? reg14 : wire7))) ?
              (($signed($unsigned(reg8)) ?
                      wire0[(3'h4):(3'h4)] : $unsigned((reg9 > (8'ha7)))) ?
                  (^wire3[(4'ha):(4'h8)]) : ($signed((~|reg14)) ?
                      reg12[(4'ha):(3'h4)] : ($unsigned(wire3) ?
                          $unsigned((7'h44)) : (8'ha6)))) : ({$signed((wire2 < reg14))} >= (reg8[(2'h2):(1'h1)] * (~|(wire4 > wire6))))))
            begin
              reg18 <= (((($signed(reg16) & $unsigned(wire5)) ?
                  (-reg9) : ($signed(reg8) & {reg9,
                      reg11})) >> wire3) > $unsigned((reg8[(3'h5):(3'h5)] ^ ((wire7 && reg16) || (~^wire6)))));
              reg19 <= reg9;
            end
          else
            begin
              reg18 <= $signed(reg19[(4'ha):(4'h8)]);
              reg19 <= (wire1 ?
                  reg8 : $signed(($unsigned(reg19[(3'h5):(2'h3)]) >= wire3[(4'he):(4'ha)])));
              reg20 <= {(~reg13[(2'h3):(1'h1)]),
                  (((|reg16) ?
                      wire0 : (wire3[(5'h13):(4'hf)] && $signed(reg9))) == ((reg14[(4'hd):(4'h9)] && (~&reg8)) ?
                      $unsigned($signed(reg17)) : ((reg14 >> (8'hb9)) >= reg9[(1'h0):(1'h0)])))};
              reg21 <= (!$unsigned($signed(({wire4} ?
                  $signed(wire6) : (wire4 ^ reg10)))));
            end
        end
      else
        begin
          reg11 <= reg21;
          if (($unsigned($unsigned($unsigned({reg10,
              reg21}))) ~^ {(((reg19 >> reg21) ?
                  wire0[(2'h2):(2'h2)] : $unsigned(reg21)) ^~ $signed((reg10 ^~ reg17)))}))
            begin
              reg12 <= (&$signed($signed(reg10)));
              reg13 <= (wire3[(3'h7):(2'h3)] > {$unsigned(((wire5 >= wire7) < (^reg11))),
                  (((8'h9f) ?
                      (8'ha1) : (wire3 ? reg19 : (8'ha8))) == (~^(&reg17)))});
            end
          else
            begin
              reg12 <= $signed($unsigned($signed($unsigned(reg9[(1'h1):(1'h0)]))));
            end
          reg14 <= $unsigned($signed((wire7 ?
              (reg8[(4'ha):(4'h8)] ?
                  ((8'hbf) & (8'ha3)) : $unsigned(wire6)) : (&wire4))));
        end
      reg22 <= $unsigned($unsigned(wire3[(3'h4):(1'h0)]));
    end
  always
    @(posedge clk) begin
      if (reg21)
        begin
          if (wire4)
            begin
              reg23 <= (reg11 ^ (|$unsigned($unsigned($unsigned(wire7)))));
              reg24 <= {reg23[(5'h10):(3'h4)]};
              reg25 <= reg23[(4'h9):(3'h4)];
            end
          else
            begin
              reg23 <= ($unsigned((($signed(wire3) && {reg16}) ?
                      (reg23[(4'hf):(1'h0)] == (reg20 ?
                          reg17 : (8'ha3))) : (|wire2))) ?
                  ((reg15[(4'h8):(1'h1)] ^ $unsigned({reg11,
                      reg20})) + (^~(wire0 ?
                      $unsigned(wire3) : reg15))) : {wire6[(3'h5):(2'h2)],
                      $signed($unsigned(wire4))});
            end
          if ((&(+{$signed((wire3 ? reg24 : wire0))})))
            begin
              reg26 <= (((($unsigned((8'hb7)) <= {reg16}) ?
                          ($unsigned(reg14) * reg19) : $signed(reg16[(4'ha):(4'h8)])) ?
                      wire6 : {$signed($signed(reg19)), reg16}) ?
                  $signed((|((reg17 && reg11) | (^(8'hb1))))) : {(!$signed(wire7)),
                      reg13[(4'hb):(4'h8)]});
            end
          else
            begin
              reg26 <= (wire1 & $signed(reg8[(5'h12):(4'ha)]));
              reg27 <= (($signed(reg15) | $signed($signed($signed((8'hae))))) * wire1);
              reg28 <= reg10[(3'h5):(1'h1)];
              reg29 <= ((&(7'h44)) ?
                  {$unsigned((wire0 ?
                          (reg11 & wire4) : $unsigned(reg25)))} : reg23);
              reg30 <= $unsigned($signed((wire5[(4'h9):(3'h6)] ?
                  ($signed((8'hb5)) ?
                      reg11 : (reg17 ? reg26 : reg26)) : {reg9[(3'h4):(3'h4)],
                      reg20[(2'h3):(1'h0)]})));
            end
          reg31 <= wire1[(2'h2):(2'h2)];
        end
      else
        begin
          reg23 <= $signed(((!((+reg19) ^~ $signed(reg15))) ?
              wire2[(3'h7):(3'h4)] : ($signed((^~wire2)) - wire3)));
          reg24 <= wire2[(4'h8):(3'h5)];
        end
    end
  always
    @(posedge clk) begin
      reg32 <= reg23[(4'hf):(1'h1)];
      if ((reg13[(4'h8):(2'h2)] ?
          ($signed(($signed(wire1) == wire0)) ?
              reg26[(1'h1):(1'h1)] : $unsigned(((reg27 <= (7'h43)) ?
                  ((8'h9e) ? reg20 : wire7) : (reg25 ?
                      (8'hbc) : reg27)))) : ($signed($unsigned(reg11)) ?
              (^reg30) : $unsigned(($signed((8'hb6)) <= (wire1 ?
                  (8'h9d) : reg12))))))
        begin
          reg33 <= (($signed(reg22[(3'h6):(1'h0)]) ~^ (reg31[(2'h3):(1'h0)] ?
                  $unsigned($unsigned(wire0)) : reg10[(2'h2):(1'h1)])) ?
              {(|reg15)} : (reg13 ^ $unsigned(reg28[(3'h7):(3'h7)])));
          reg34 <= ((~^reg20[(4'h9):(3'h6)]) <= $unsigned(($signed($unsigned(reg16)) ?
              (8'hbb) : reg11[(1'h1):(1'h1)])));
          reg35 <= $signed($signed(reg13[(3'h7):(2'h2)]));
        end
      else
        begin
          reg33 <= $unsigned(((reg33 ?
              $signed(reg35[(4'h8):(3'h4)]) : ({reg10} ~^ {reg24,
                  wire3})) != $unsigned({$unsigned(reg24),
              (wire1 ? wire7 : wire2)})));
          reg34 <= $unsigned($unsigned(reg30[(3'h7):(1'h1)]));
        end
      reg36 <= wire0;
      reg37 <= (reg28[(1'h1):(1'h0)] && reg35);
    end
  assign wire38 = $signed($unsigned(($signed(wire2[(4'hc):(3'h5)]) < (~{wire5,
                      wire2}))));
  module39 #() modinst152 (wire151, clk, reg25, reg24, wire6, reg19, reg33);
  assign wire153 = reg29;
  assign wire154 = (^((wire151 ?
                           {$signed(wire4),
                               $signed(reg20)} : (reg13[(5'h12):(3'h7)] ?
                               $signed(reg14) : ((8'ha0) ? reg16 : wire3))) ?
                       (~&($signed(wire1) >>> $unsigned(wire7))) : (+((reg30 ^~ reg28) & (reg12 | reg15)))));
  assign wire155 = (wire0[(3'h5):(3'h4)] ?
                       reg10 : ((|({reg14} ?
                               ((8'h9e) ~^ reg30) : $unsigned((8'ha7)))) ?
                           $signed($unsigned($signed(reg18))) : ($signed($unsigned(reg33)) ?
                               (!{reg15}) : $unsigned(reg34))));
  assign wire156 = (|(+(~^reg27)));
  assign wire157 = reg32;
  assign wire158 = $unsigned($signed($signed($signed({wire157}))));
  assign wire159 = ($unsigned(((-reg22[(2'h2):(1'h1)]) * ($unsigned(reg23) ^~ reg32[(4'h8):(4'h8)]))) ?
                       wire156[(4'hb):(2'h2)] : ((~((wire0 * reg28) ?
                           (wire38 ?
                               reg35 : (7'h41)) : $signed(reg8))) & (~$signed((+wire153)))));
  assign wire160 = $unsigned($signed($signed({(&wire6)})));
endmodule

module module39  (y, clk, wire44, wire43, wire42, wire41, wire40);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire44;
  input wire signed [(4'hc):(1'h0)] wire43;
  input wire [(4'he):(1'h0)] wire42;
  input wire signed [(4'hd):(1'h0)] wire41;
  input wire [(5'h12):(1'h0)] wire40;
  wire [(5'h11):(1'h0)] wire150;
  wire signed [(4'he):(1'h0)] wire149;
  wire signed [(5'h14):(1'h0)] wire148;
  wire signed [(4'ha):(1'h0)] wire113;
  wire signed [(5'h14):(1'h0)] wire81;
  wire [(5'h15):(1'h0)] wire79;
  wire [(3'h7):(1'h0)] wire78;
  wire [(5'h11):(1'h0)] wire76;
  wire signed [(5'h13):(1'h0)] wire47;
  wire signed [(4'hd):(1'h0)] wire45;
  wire [(5'h10):(1'h0)] wire146;
  reg signed [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(4'hd):(1'h0)] reg80 = (1'h0);
  assign y = {wire150,
                 wire149,
                 wire148,
                 wire113,
                 wire81,
                 wire79,
                 wire78,
                 wire76,
                 wire47,
                 wire45,
                 wire146,
                 reg46,
                 reg80,
                 (1'h0)};
  assign wire45 = (~&$signed({wire43[(1'h1):(1'h0)]}));
  always
    @(posedge clk) begin
      reg46 <= $unsigned((wire45[(2'h3):(1'h0)] ?
          (((wire40 ? (8'ha5) : wire44) ?
              {wire44} : {(8'hba), wire40}) - wire41[(4'hb):(4'ha)]) : wire45));
    end
  assign wire47 = $unsigned(wire44[(2'h2):(2'h2)]);
  module48 #() modinst77 (wire76, clk, wire41, wire42, wire47, wire45, reg46);
  assign wire78 = ($unsigned((^~((reg46 >= wire44) >= (&(8'hb6))))) ?
                      (wire76 ?
                          $signed(reg46[(1'h1):(1'h0)]) : $unsigned(wire76[(2'h2):(2'h2)])) : $unsigned((($signed(wire76) ?
                              (|wire44) : (~wire40)) ?
                          $signed((8'ha2)) : wire44[(3'h4):(1'h0)])));
  assign wire79 = ({wire47, $signed($signed(wire78[(2'h2):(1'h1)]))} ?
                      (&($unsigned(wire45[(4'h9):(3'h4)]) != ($unsigned(wire43) < (&wire45)))) : reg46[(3'h7):(3'h4)]);
  always
    @(posedge clk) begin
      reg80 <= ($unsigned(($signed((~|wire42)) ~^ wire44[(3'h4):(1'h1)])) && (8'hb9));
    end
  assign wire81 = (wire44 | ($signed($unsigned($unsigned(reg46))) ?
                      $signed(wire45) : ($unsigned($signed((8'haa))) <= {$unsigned(wire79)})));
  module82 #() modinst114 (.clk(clk), .wire83(wire76), .wire84(wire40), .y(wire113), .wire85(wire44), .wire86(reg80));
  module115 #() modinst147 (.y(wire146), .wire116(wire41), .wire119(wire44), .clk(clk), .wire118(wire113), .wire120(wire42), .wire117(wire76));
  assign wire148 = $unsigned((reg46 * reg80));
  assign wire149 = $signed($signed($signed((7'h40))));
  assign wire150 = $unsigned($signed($signed((reg80[(2'h2):(1'h0)] * (&wire78)))));
endmodule

module module115  (y, clk, wire120, wire119, wire118, wire117, wire116);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire120;
  input wire signed [(4'hc):(1'h0)] wire119;
  input wire [(4'ha):(1'h0)] wire118;
  input wire signed [(5'h11):(1'h0)] wire117;
  input wire signed [(4'ha):(1'h0)] wire116;
  wire [(5'h13):(1'h0)] wire145;
  wire [(4'ha):(1'h0)] wire144;
  wire [(5'h14):(1'h0)] wire142;
  wire [(4'h8):(1'h0)] wire141;
  wire [(2'h3):(1'h0)] wire125;
  wire [(4'h9):(1'h0)] wire124;
  wire [(4'he):(1'h0)] wire123;
  wire signed [(5'h14):(1'h0)] wire122;
  wire signed [(4'hc):(1'h0)] wire121;
  reg [(4'hc):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg140 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg139 = (1'h0);
  reg [(5'h14):(1'h0)] reg138 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg136 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg135 = (1'h0);
  reg [(3'h4):(1'h0)] reg134 = (1'h0);
  reg [(3'h5):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg132 = (1'h0);
  reg [(5'h13):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg130 = (1'h0);
  reg [(2'h2):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg128 = (1'h0);
  reg [(4'hd):(1'h0)] reg127 = (1'h0);
  reg [(4'ha):(1'h0)] reg126 = (1'h0);
  assign y = {wire145,
                 wire144,
                 wire142,
                 wire141,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 reg143,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
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
                 (1'h0)};
  assign wire121 = $signed((wire117[(3'h5):(1'h1)] ?
                       ($unsigned(wire117[(5'h11):(4'hc)]) != wire120[(1'h0):(1'h0)]) : (((&(7'h41)) < $signed(wire117)) ?
                           ((+wire117) ?
                               (|(8'hb7)) : $unsigned(wire120)) : $unsigned(((8'hba) > wire118)))));
  assign wire122 = (^~({wire116[(3'h4):(1'h1)]} ?
                       (wire116 ?
                           (+(~&(8'ha3))) : (((8'hba) ^ wire119) ?
                               wire117[(4'ha):(4'h9)] : wire118)) : ({(^~wire117),
                               (wire121 != (8'h9d))} ?
                           $unsigned((~&wire118)) : wire116)));
  assign wire123 = ($unsigned(((~&(wire116 ? wire122 : wire120)) ?
                           ({wire119,
                               wire117} - $signed(wire119)) : (-(-wire117)))) ?
                       $unsigned($signed(wire121[(1'h1):(1'h1)])) : (^~wire117[(4'hd):(2'h2)]));
  assign wire124 = wire117;
  assign wire125 = $unsigned((((!wire122) >> (wire122[(5'h14):(5'h11)] && wire120)) << ((wire123 ?
                           (!wire122) : wire123[(3'h6):(2'h3)]) ?
                       (~{(8'haf),
                           wire117}) : ($unsigned(wire122) <<< (-(8'hb9))))));
  always
    @(posedge clk) begin
      reg126 <= (~^((((wire125 ? wire119 : wire123) ? (^wire120) : {wire119}) ?
          {{wire122}} : {(8'hb5),
              ((8'h9c) ? wire116 : wire125)}) ^~ {wire118}));
      reg127 <= (7'h40);
      reg128 <= {wire117, wire117};
    end
  always
    @(posedge clk) begin
      reg129 <= (($signed({(|wire125)}) <<< reg126) ?
          $unsigned((-wire125[(2'h2):(1'h0)])) : ((8'hb3) + (({wire119,
              wire120} <= $unsigned(wire125)) == ((reg128 ?
              reg128 : wire117) >>> (|wire121)))));
      if (($unsigned(wire121[(1'h1):(1'h1)]) > $unsigned((($unsigned(reg129) ?
          (reg128 ? wire120 : wire116) : wire121) <= wire118[(3'h5):(3'h4)]))))
        begin
          if ($signed(wire123))
            begin
              reg130 <= wire123;
              reg131 <= $unsigned({$unsigned(((wire116 ? (8'hbf) : reg130) ?
                      (wire120 != reg127) : $unsigned(wire118)))});
              reg132 <= ((8'hbf) ?
                  {((8'ha4) ?
                          (reg131[(3'h5):(3'h5)] ?
                              $signed(wire125) : (wire118 & (8'hb8))) : (wire119[(3'h4):(1'h0)] ?
                              $signed(wire121) : (~wire118)))} : {$signed(wire118),
                      $unsigned(wire123[(1'h1):(1'h0)])});
              reg133 <= $signed((8'ha6));
            end
          else
            begin
              reg130 <= {((-reg129) ? wire118 : $signed($unsigned({(8'h9d)}))),
                  $signed(wire118)};
              reg131 <= ($signed(reg126) != (($signed((~&reg128)) ~^ reg131[(4'hd):(3'h6)]) ?
                  reg127[(2'h2):(1'h1)] : {$signed($unsigned(reg131)),
                      $signed($unsigned((8'ha7)))}));
            end
          if (wire121[(4'h9):(3'h7)])
            begin
              reg134 <= $unsigned(reg127[(2'h3):(2'h2)]);
              reg135 <= $signed(wire121[(2'h3):(2'h3)]);
              reg136 <= ($signed((&$unsigned($unsigned(reg131)))) == $signed({(~$unsigned((8'hbf))),
                  reg128}));
              reg137 <= $unsigned(reg133);
              reg138 <= (wire119[(3'h7):(2'h2)] ?
                  $unsigned(((!(reg129 ?
                      wire117 : wire123)) ^~ $signed((!wire120)))) : $unsigned($signed(($unsigned(wire121) > $unsigned(wire118)))));
            end
          else
            begin
              reg134 <= (~^($signed(reg128) ? reg134 : reg126));
              reg135 <= (wire119[(1'h1):(1'h0)] >= ((($signed(reg128) && $signed((8'ha9))) * $signed((wire117 && wire125))) ?
                  (|($signed((8'hb7)) ?
                      reg132 : (reg132 ?
                          reg136 : wire122))) : $unsigned({$signed(wire117)})));
              reg136 <= (((reg135 ?
                      $unsigned((reg131 || wire123)) : ((~|(8'hbb)) ?
                          (reg127 < wire125) : (wire117 < reg135))) == (-((reg133 << reg136) ?
                      wire116[(1'h0):(1'h0)] : reg129[(2'h2):(2'h2)]))) ?
                  (^~$unsigned($unsigned(reg129))) : reg138[(1'h1):(1'h1)]);
              reg137 <= $unsigned((wire119 ^ wire124[(3'h5):(2'h3)]));
            end
          reg139 <= $signed(wire116[(3'h4):(2'h3)]);
        end
      else
        begin
          reg130 <= ((!(reg139 ?
              wire119[(2'h3):(1'h0)] : ($unsigned(reg133) << reg135))) >> {wire120});
          reg131 <= $unsigned((((!$unsigned((7'h43))) ?
              ($signed((8'ha0)) ?
                  (wire118 ^~ (8'hba)) : $signed((8'haf))) : (&wire121[(4'hb):(2'h2)])) >= reg126[(4'h8):(1'h0)]));
          reg132 <= reg129;
          reg133 <= $signed((wire122 != {$signed($unsigned(wire119)),
              ({wire116} > (reg130 ? wire118 : reg132))}));
        end
      reg140 <= {($unsigned($unsigned(reg128[(3'h4):(2'h2)])) ?
              wire118 : $signed(reg139[(1'h1):(1'h1)])),
          (~reg127[(3'h7):(3'h6)])};
    end
  assign wire141 = reg132[(4'hd):(4'h9)];
  assign wire142 = wire119[(4'h8):(2'h3)];
  always
    @(posedge clk) begin
      reg143 <= (~&($unsigned(wire118[(2'h3):(2'h3)]) > (!$unsigned($signed(wire125)))));
    end
  assign wire144 = (8'hb3);
  assign wire145 = {{$signed(((^~(8'hbd)) ?
                               ((7'h44) | reg137) : reg134[(2'h2):(1'h0)]))},
                       $unsigned($unsigned(((reg127 ^ reg129) < (~reg134))))};
endmodule

module module82
#(parameter param112 = (~^(({((8'hb9) ? (8'ha1) : (8'ha2))} * {((8'hbd) + (8'hab))}) - ({((7'h44) <<< (8'hba)), ((8'hba) ? (8'hb0) : (8'hbe))} ^~ (!((8'hb6) + (8'ha1)))))))
(y, clk, wire86, wire85, wire84, wire83);
  output wire [(32'hf2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire86;
  input wire [(4'h9):(1'h0)] wire85;
  input wire [(3'h5):(1'h0)] wire84;
  input wire [(4'hc):(1'h0)] wire83;
  wire [(2'h2):(1'h0)] wire89;
  wire [(2'h2):(1'h0)] wire88;
  wire [(3'h6):(1'h0)] wire87;
  reg signed [(3'h7):(1'h0)] reg111 = (1'h0);
  reg [(4'h9):(1'h0)] reg110 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg107 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg106 = (1'h0);
  reg [(3'h7):(1'h0)] reg105 = (1'h0);
  reg [(4'hf):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg101 = (1'h0);
  reg [(4'he):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg99 = (1'h0);
  reg [(5'h11):(1'h0)] reg98 = (1'h0);
  reg [(4'hc):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg96 = (1'h0);
  reg [(3'h5):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg94 = (1'h0);
  reg [(4'hc):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg90 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
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
                 (1'h0)};
  assign wire87 = (|wire83[(4'hb):(2'h3)]);
  assign wire88 = wire84;
  assign wire89 = $signed($signed($unsigned((!$unsigned(wire85)))));
  always
    @(posedge clk) begin
      if ((^~wire83[(3'h7):(3'h4)]))
        begin
          if ((^($unsigned(wire89) ?
              $unsigned(wire84[(3'h5):(3'h5)]) : wire85[(2'h3):(2'h2)])))
            begin
              reg90 <= wire86;
              reg91 <= ($signed((|(wire84 ?
                  {wire88} : $signed(wire86)))) ~^ ($signed($unsigned((~wire84))) == {$signed({(8'hb1),
                      wire87})}));
              reg92 <= $signed(wire83);
              reg93 <= wire87;
              reg94 <= (-(({wire87[(1'h1):(1'h0)]} >= wire85[(3'h6):(3'h5)]) || reg90));
            end
          else
            begin
              reg90 <= $unsigned((wire84 > wire83[(4'h8):(3'h7)]));
              reg91 <= (wire83 - {$signed(wire83)});
            end
          reg95 <= (^(-wire88[(1'h1):(1'h0)]));
          reg96 <= {{wire84, reg95}, (8'hb0)};
        end
      else
        begin
          reg90 <= $signed({reg95});
          reg91 <= {wire86[(1'h1):(1'h0)]};
          reg92 <= ({reg90[(5'h10):(3'h4)],
              wire86[(3'h7):(3'h6)]} <= ($signed(($unsigned(wire85) | $unsigned(reg93))) <<< $signed(reg91[(1'h1):(1'h1)])));
          reg93 <= $unsigned(({reg96[(1'h1):(1'h0)]} && $signed(((wire89 ?
              (8'h9d) : wire84) << $unsigned(wire84)))));
        end
      if ((($unsigned(((reg92 ? reg94 : (8'hbc)) >> wire84)) ?
              (~wire87[(2'h2):(2'h2)]) : {$unsigned(reg90)}) ?
          ($signed(($unsigned(wire89) >= (&reg96))) ?
              (wire85 >>> ((wire84 >>> reg92) ?
                  $signed(wire88) : wire83[(4'h8):(3'h4)])) : $unsigned(wire84)) : ($signed(({(8'hbd)} && (8'hae))) ?
              $signed(reg92) : (~&(((8'ha6) ? reg94 : (8'ha8)) ?
                  (wire86 ~^ reg93) : {reg94})))))
        begin
          if ((($signed(($unsigned(reg91) == (wire84 ? wire87 : wire88))) ?
              (wire83 ?
                  $unsigned((^reg90)) : reg90[(4'h8):(1'h0)]) : reg93[(3'h6):(3'h6)]) - (-(($unsigned(wire88) ?
              (reg94 ~^ reg94) : reg92) ^~ $signed(reg90[(5'h10):(3'h7)])))))
            begin
              reg97 <= wire89[(2'h2):(1'h0)];
              reg98 <= (($signed($unsigned(reg90)) - $unsigned(reg90[(3'h5):(3'h5)])) & (8'hbe));
              reg99 <= $signed(($signed(($unsigned((8'hb1)) > reg90[(4'hd):(1'h1)])) ?
                  ((+(wire88 - wire86)) ? reg93 : reg98) : (((wire86 ?
                          reg92 : reg91) ?
                      (+wire85) : (^reg92)) & ((wire89 & reg95) << (wire87 != reg95)))));
              reg100 <= ({(~^(~&$signed(wire86))),
                  $unsigned({(+reg96), (reg92 ? reg97 : reg94)})} >> reg90);
              reg101 <= (($unsigned((+(~|wire83))) ?
                  (({wire87, reg90} ? $unsigned(wire85) : $signed(reg90)) ?
                      ($unsigned((8'hb8)) * $signed(reg97)) : (reg96[(5'h10):(3'h6)] | wire84[(3'h5):(3'h5)])) : reg97[(4'ha):(3'h4)]) & reg95);
            end
          else
            begin
              reg97 <= reg100[(3'h5):(1'h0)];
              reg98 <= ($unsigned((((^reg99) ~^ reg95) == reg101)) <= (+(~reg91)));
              reg99 <= {(-{((8'hae) <= $signed(reg96))}),
                  $signed(((^(!reg90)) != {(~reg91)}))};
              reg100 <= {wire83[(4'h9):(2'h2)], wire89};
            end
        end
      else
        begin
          reg97 <= $signed({{reg99}, $unsigned(wire84)});
          reg98 <= $unsigned(reg99);
        end
      reg102 <= ($unsigned({(~wire86)}) ?
          $unsigned($signed((~|(^~reg93)))) : wire89[(1'h1):(1'h0)]);
      if ($signed(reg101[(3'h5):(3'h4)]))
        begin
          reg103 <= $unsigned((&(~wire84[(1'h0):(1'h0)])));
          if (($signed((~&(^$unsigned(reg100)))) < wire89))
            begin
              reg104 <= wire86[(3'h5):(3'h4)];
            end
          else
            begin
              reg104 <= $signed(wire89[(1'h0):(1'h0)]);
              reg105 <= $signed(reg97);
              reg106 <= $signed(((8'hb7) || $unsigned(reg90[(4'ha):(2'h3)])));
              reg107 <= ((^~((8'ha9) >= (wire86 ^ wire89))) + $signed((reg102[(3'h5):(3'h5)] <<< (^(reg99 >> wire88)))));
              reg108 <= $signed((~{$signed(reg107[(4'hb):(3'h6)]),
                  ((+(8'hbc)) ? reg104 : reg101)}));
            end
          reg109 <= (~(~|(&wire86[(3'h6):(2'h2)])));
          reg110 <= wire88;
          reg111 <= {(({wire83[(1'h0):(1'h0)], $signed(reg93)} ?
                  $unsigned({(8'hba),
                      (8'ha9)}) : reg98[(3'h5):(2'h2)]) && (!$signed($unsigned(reg97)))),
              ($unsigned({(|reg93)}) ?
                  ({(reg109 ?
                          wire88 : (7'h44))} << reg103[(4'hb):(4'hb)]) : $unsigned((^((8'ha6) ?
                      (7'h41) : reg97))))};
        end
      else
        begin
          if ($signed($unsigned(reg101)))
            begin
              reg103 <= $unsigned($unsigned($signed(({reg92,
                  wire88} * (reg94 * wire84)))));
            end
          else
            begin
              reg103 <= $unsigned(reg93[(4'h9):(1'h1)]);
              reg104 <= reg103[(2'h2):(1'h1)];
              reg105 <= wire83;
              reg106 <= $signed(({{(^~reg107), (wire89 - wire89)},
                  (~&(~|reg108))} ^ ({(8'haa), $unsigned(reg95)} ?
                  wire85 : reg111[(2'h3):(2'h3)])));
            end
          reg107 <= reg101;
        end
    end
endmodule

module module48  (y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'h139):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire53;
  input wire signed [(4'he):(1'h0)] wire52;
  input wire signed [(4'hf):(1'h0)] wire51;
  input wire signed [(4'hd):(1'h0)] wire50;
  input wire signed [(4'ha):(1'h0)] wire49;
  wire [(3'h6):(1'h0)] wire73;
  wire signed [(4'he):(1'h0)] wire72;
  wire [(5'h11):(1'h0)] wire71;
  wire signed [(4'h9):(1'h0)] wire54;
  reg [(5'h14):(1'h0)] reg75 = (1'h0);
  reg [(4'hc):(1'h0)] reg74 = (1'h0);
  reg [(4'h9):(1'h0)] reg70 = (1'h0);
  reg [(4'h9):(1'h0)] reg69 = (1'h0);
  reg signed [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg66 = (1'h0);
  reg [(3'h4):(1'h0)] reg65 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg63 = (1'h0);
  reg [(4'hc):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg60 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(5'h15):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire54,
                 reg75,
                 reg74,
                 reg70,
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
                 reg57,
                 reg56,
                 reg55,
                 (1'h0)};
  assign wire54 = ((~|(8'ha2)) ? wire52[(4'ha):(4'h8)] : wire53);
  always
    @(posedge clk) begin
      reg55 <= wire51[(3'h7):(3'h7)];
      reg56 <= $unsigned($unsigned($signed($unsigned($signed(wire50)))));
      reg57 <= $signed(((&wire50[(4'h8):(1'h1)]) ^ ((&(&reg55)) ?
          wire53[(4'hd):(4'hd)] : $signed(wire49[(1'h0):(1'h0)]))));
      reg58 <= (wire50 ? wire52[(4'h8):(1'h1)] : wire54);
    end
  always
    @(posedge clk) begin
      reg59 <= wire51;
      reg60 <= (~^({((^reg58) >> $unsigned((8'ha7))),
          (^~$unsigned(reg59))} >>> (+({(8'h9f)} >>> (reg55 ?
          (8'hb7) : reg58)))));
      reg61 <= wire50[(3'h4):(3'h4)];
      reg62 <= (reg58[(1'h1):(1'h0)] ?
          (8'h9c) : (((8'hb4) ?
              ($unsigned(reg57) || wire51[(1'h0):(1'h0)]) : (~((8'hbd) ?
                  (8'hba) : (8'hb1)))) ^~ $unsigned({reg55,
              $unsigned((8'haf))})));
      if ({(~($unsigned($signed(reg56)) ?
              (reg55[(1'h0):(1'h0)] ?
                  $signed((8'ha6)) : $signed(wire54)) : $unsigned((wire51 ?
                  wire49 : wire50))))})
        begin
          reg63 <= {($unsigned(wire49[(1'h0):(1'h0)]) == (!{{reg60},
                  reg59[(4'hf):(2'h2)]})),
              ((reg59 ? (|(wire51 >= wire51)) : reg61) ?
                  wire50 : reg56[(4'hd):(1'h0)])};
          if (($unsigned(reg59[(4'ha):(2'h3)]) <= ($signed(wire50) ?
              (-reg62) : reg58[(3'h4):(3'h4)])))
            begin
              reg64 <= ({(~&$signed(reg55))} ?
                  $unsigned(reg60) : {reg61[(4'h9):(1'h0)], (8'hbc)});
              reg65 <= wire51;
            end
          else
            begin
              reg64 <= {reg56[(4'hc):(4'hc)], reg56[(3'h4):(2'h3)]};
              reg65 <= (!$signed(($signed((~|reg58)) ?
                  reg65[(1'h0):(1'h0)] : $signed((wire54 | (8'hbe))))));
            end
          reg66 <= (~&(~|reg56[(2'h3):(1'h0)]));
          reg67 <= (($unsigned((~^$unsigned(reg65))) ?
              (^$signed((&(8'h9e)))) : $signed(($signed(reg64) ?
                  {(7'h44),
                      reg64} : wire51))) <= (&$unsigned($unsigned((^~reg66)))));
          reg68 <= reg67;
        end
      else
        begin
          if ((~&$unsigned($signed($unsigned((wire49 * reg65))))))
            begin
              reg63 <= $unsigned($unsigned((reg65 + (~|(wire54 ?
                  reg61 : reg62)))));
              reg64 <= $signed(reg66);
            end
          else
            begin
              reg63 <= reg68;
              reg64 <= wire54[(1'h0):(1'h0)];
              reg65 <= (~^$signed((^~$signed({reg68, (8'ha0)}))));
              reg66 <= reg65;
            end
          reg67 <= {(&(((reg67 ? (8'ha0) : reg68) + $signed(reg62)) ?
                  (~^(~|wire52)) : wire54[(2'h2):(1'h1)])),
              ({$unsigned(reg64), (+reg66)} * (~^$signed($unsigned(reg57))))};
          reg68 <= (~&reg58[(4'he):(3'h6)]);
          reg69 <= $unsigned({$unsigned(wire52[(3'h7):(3'h4)])});
          reg70 <= (reg69 * (((^reg68[(4'hc):(3'h7)]) == {((8'hb5) <<< wire54)}) ?
              ((((8'hb9) - reg68) - (~reg59)) ?
                  (((8'ha4) ? (8'ha1) : (8'hbe)) ?
                      ((8'h9c) != reg55) : (reg56 ?
                          reg61 : reg59)) : $unsigned((reg60 | wire53))) : wire51));
        end
    end
  assign wire71 = $signed(((reg58 ?
                          $signed((~^reg56)) : $unsigned((+(8'hb4)))) ?
                      reg55[(4'hd):(2'h2)] : reg67));
  assign wire72 = {({((wire71 ? reg60 : reg64) ^~ $signed(reg69)),
                              ((~reg60) || reg58)} ?
                          $signed(reg66[(4'ha):(4'h8)]) : ($signed(reg58[(5'h12):(4'hf)]) ?
                              ($unsigned(wire49) ?
                                  (|wire52) : wire50) : $signed((|reg57))))};
  assign wire73 = reg56;
  always
    @(posedge clk) begin
      reg74 <= $signed(wire52[(4'ha):(3'h4)]);
      reg75 <= $signed((((~^(reg70 ? (8'hb8) : reg60)) ?
              ($unsigned((8'hbf)) * wire52[(3'h7):(1'h0)]) : reg60[(4'hf):(2'h3)]) ?
          ($signed($signed(reg61)) > $unsigned({(8'ha5),
              reg59})) : {{(|wire53)}, $unsigned(wire52)}));
    end
endmodule
