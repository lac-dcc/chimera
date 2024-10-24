module top
#(parameter param164 = (({{(~(8'ha0))}} <= (-{((8'hb6) & (8'hbc)), ((8'hbb) ? (8'hbd) : (8'ha6))})) ? (((8'ha5) ? (~&(~|(8'ha3))) : (!(8'ha0))) ? (-(((8'hb5) & (8'hb2)) << ((8'hab) <= (8'ha5)))) : ((!((8'hbe) ? (7'h42) : (8'hba))) ~^ {((8'ha0) ^~ (8'ha8))})) : {((((8'had) < (8'hb0)) ? (^~(7'h44)) : ((8'hb8) ? (8'hbd) : (8'h9f))) ^ (((8'hba) ? (8'hb2) : (8'ha9)) ? (|(7'h44)) : ((7'h42) <= (8'ha1))))}), 
parameter param165 = (-(param164 ? ((param164 == (~param164)) * ({param164} >= (param164 ~^ param164))) : (+(7'h40)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire163;
  wire [(3'h7):(1'h0)] wire162;
  wire [(2'h3):(1'h0)] wire161;
  wire signed [(4'ha):(1'h0)] wire159;
  wire [(4'he):(1'h0)] wire158;
  wire [(5'h13):(1'h0)] wire157;
  wire signed [(5'h13):(1'h0)] wire155;
  wire [(5'h13):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  reg signed [(3'h4):(1'h0)] reg160 = (1'h0);
  assign y = {wire163,
                 wire162,
                 wire161,
                 wire159,
                 wire158,
                 wire157,
                 wire155,
                 wire6,
                 wire5,
                 reg160,
                 (1'h0)};
  assign wire5 = (wire0[(4'h8):(1'h1)] | ((~^(-$unsigned(wire1))) ?
                     $signed((~{(7'h44), wire1})) : wire3[(3'h5):(3'h5)]));
  assign wire6 = ((8'h9e) + wire0);
  module7 #() modinst156 (.y(wire155), .wire9(wire6), .wire11(wire0), .wire10(wire2), .wire8(wire4), .clk(clk));
  assign wire157 = ((8'hb3) ?
                       (($signed({wire155, wire155}) ?
                               $signed(wire4) : $signed((wire6 > (8'hbf)))) ?
                           $unsigned({(~&wire0),
                               wire4[(1'h0):(1'h0)]}) : ($signed($unsigned((8'h9d))) << ($unsigned(wire5) < $signed(wire1)))) : ((8'hb0) == ($signed(wire0[(1'h1):(1'h1)]) ~^ wire155)));
  assign wire158 = (wire155 != wire3);
  assign wire159 = {wire3[(1'h1):(1'h0)], $unsigned((|(~&(^wire155))))};
  always
    @(posedge clk) begin
      reg160 <= wire159;
    end
  assign wire161 = (8'hbb);
  assign wire162 = (wire6[(4'hc):(3'h6)] ?
                       $unsigned(({(|wire157)} ?
                           wire6[(1'h0):(1'h0)] : (wire2[(4'ha):(3'h7)] ?
                               wire1 : $signed(wire158)))) : (~|(+(^(wire159 >> wire158)))));
  assign wire163 = wire155;
endmodule

module module7  (y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h32d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire11;
  input wire signed [(5'h15):(1'h0)] wire10;
  input wire [(5'h13):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire8;
  wire signed [(2'h3):(1'h0)] wire154;
  wire signed [(5'h10):(1'h0)] wire152;
  wire signed [(2'h2):(1'h0)] wire138;
  wire signed [(2'h3):(1'h0)] wire70;
  wire signed [(5'h14):(1'h0)] wire41;
  wire [(4'hb):(1'h0)] wire40;
  wire [(4'hb):(1'h0)] wire72;
  wire [(5'h11):(1'h0)] wire73;
  wire signed [(5'h15):(1'h0)] wire74;
  wire [(4'hc):(1'h0)] wire75;
  wire signed [(4'hb):(1'h0)] wire76;
  wire signed [(5'h11):(1'h0)] wire77;
  wire [(5'h14):(1'h0)] wire103;
  wire signed [(5'h14):(1'h0)] wire104;
  wire signed [(5'h12):(1'h0)] wire105;
  wire signed [(5'h14):(1'h0)] wire106;
  wire signed [(3'h7):(1'h0)] wire107;
  wire [(2'h2):(1'h0)] wire136;
  reg signed [(5'h14):(1'h0)] reg102 = (1'h0);
  reg [(4'hb):(1'h0)] reg101 = (1'h0);
  reg [(4'hb):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg98 = (1'h0);
  reg [(4'hc):(1'h0)] reg97 = (1'h0);
  reg [(5'h13):(1'h0)] reg96 = (1'h0);
  reg [(3'h4):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg94 = (1'h0);
  reg [(4'hd):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg92 = (1'h0);
  reg signed [(4'he):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg90 = (1'h0);
  reg [(5'h10):(1'h0)] reg89 = (1'h0);
  reg [(2'h2):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg82 = (1'h0);
  reg [(5'h12):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg39 = (1'h0);
  assign y = {wire154,
                 wire152,
                 wire138,
                 wire70,
                 wire41,
                 wire40,
                 wire72,
                 wire73,
                 wire74,
                 wire75,
                 wire76,
                 wire77,
                 wire103,
                 wire104,
                 wire105,
                 wire106,
                 wire107,
                 wire136,
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
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
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
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire9[(4'hb):(2'h2)] ?
          (-($signed((|(8'ha1))) ?
              (~^((8'h9c) ?
                  (8'hb6) : (8'h9c))) : wire9)) : (((|(wire8 <<< wire11)) ?
              (|$signed(wire9)) : wire11) + wire10[(3'h5):(3'h4)])))
        begin
          if ((~(^$unsigned(((wire10 != wire8) << (wire9 ? wire9 : wire9))))))
            begin
              reg12 <= ($signed((+(((8'ha1) >>> wire9) ?
                  wire8[(2'h3):(1'h0)] : wire11))) >= (((8'had) >> ($signed((7'h41)) ?
                      (wire10 != wire9) : wire10)) ?
                  wire8 : (^wire10)));
              reg13 <= wire11[(4'h8):(2'h3)];
              reg14 <= {(!$unsigned((reg12 > $signed(wire11))))};
              reg15 <= reg14;
              reg16 <= (^(8'ha6));
            end
          else
            begin
              reg12 <= (wire11 == reg12[(3'h6):(1'h0)]);
              reg13 <= $signed(reg14);
              reg14 <= $signed({$unsigned(({(8'ha4), wire11} ?
                      reg12 : $unsigned((7'h41))))});
              reg15 <= ((((~^wire11) >> ($unsigned((8'hb7)) < wire10)) ~^ (8'hae)) > (~&{$signed($unsigned(wire11)),
                  reg13}));
              reg16 <= {$signed(reg13)};
            end
          reg17 <= ((8'hb5) * (wire10[(4'hd):(4'hd)] ~^ $unsigned(((&(8'hab)) <= wire9))));
          reg18 <= (~reg16[(1'h0):(1'h0)]);
          reg19 <= $unsigned({reg16,
              ($signed((wire9 ~^ reg17)) ?
                  (8'h9d) : (reg13[(3'h7):(3'h4)] ?
                      $unsigned(reg18) : $unsigned(reg13)))});
        end
      else
        begin
          reg12 <= (+(wire11[(4'ha):(3'h7)] ? (^reg19) : reg18));
          reg13 <= (reg14 ?
              (^$signed((|(reg13 == reg15)))) : ($signed((|(^(7'h40)))) ?
                  $signed(wire9[(2'h3):(1'h0)]) : (reg13 ?
                      $unsigned((|wire9)) : $unsigned(reg19))));
          if ($signed((wire9 | {(^~$unsigned(wire9)),
              $unsigned((reg15 & wire10))})))
            begin
              reg14 <= ($signed(((^~(^reg14)) && reg15[(2'h3):(2'h2)])) ?
                  ((8'hbc) + wire9[(4'ha):(1'h0)]) : (+$unsigned(reg17)));
              reg15 <= $unsigned((((!reg13) + $unsigned((+reg15))) ?
                  ((8'h9c) ?
                      $unsigned(reg18[(3'h5):(2'h2)]) : reg12) : {reg15}));
              reg16 <= {$signed($signed(($unsigned((7'h42)) ?
                      wire9[(4'h9):(3'h6)] : reg12))),
                  wire11};
              reg17 <= $signed($unsigned(($unsigned(wire9) * {(8'ha1)})));
              reg18 <= (($signed({reg15[(3'h4):(3'h4)]}) ^~ $unsigned(reg15[(3'h4):(3'h4)])) <= ((!wire11) == (&wire10)));
            end
          else
            begin
              reg14 <= ((~^(^~$unsigned(wire11[(5'h11):(3'h4)]))) ?
                  reg12[(3'h6):(1'h1)] : wire11[(5'h15):(5'h13)]);
              reg15 <= ($signed($unsigned(wire9[(1'h0):(1'h0)])) ?
                  (((|wire10[(3'h6):(1'h0)]) > reg14[(4'hc):(1'h0)]) * reg15) : $signed({(^(~|reg17))}));
              reg16 <= (reg17 ? wire11 : (~{reg14, (8'hb0)}));
            end
          reg19 <= (({reg19,
                  ({reg17} ? (reg16 ? reg15 : (8'hb3)) : reg15)} | (7'h43)) ?
              (!(reg14[(4'he):(3'h6)] | {((7'h41) * wire8),
                  {wire9}})) : $unsigned((~&(wire10 ?
                  $signed((7'h40)) : {wire9}))));
          reg20 <= $signed((reg17 != wire11[(3'h7):(3'h5)]));
        end
      if ((~&reg18))
        begin
          reg21 <= reg18[(2'h2):(2'h2)];
          if ((~&$signed((!({reg19} ? reg18 : reg18)))))
            begin
              reg22 <= wire8[(1'h1):(1'h1)];
              reg23 <= (~^({wire10, $unsigned({reg15, reg20})} <<< reg14));
              reg24 <= reg17;
              reg25 <= $signed({reg23, $signed(reg12[(3'h5):(1'h0)])});
            end
          else
            begin
              reg22 <= (reg15 ?
                  $signed(((reg17[(1'h1):(1'h0)] || reg25[(4'h9):(1'h1)]) <= ({reg20} ?
                      (reg14 < reg23) : $unsigned(reg14)))) : (({((8'h9f) ?
                              reg13 : reg24),
                          $unsigned(wire11)} * (~wire11[(5'h11):(4'h8)])) ?
                      reg19 : $signed(wire8[(3'h5):(3'h4)])));
              reg23 <= (+reg24[(2'h2):(2'h2)]);
              reg24 <= $unsigned(wire8[(1'h1):(1'h1)]);
              reg25 <= reg17[(1'h1):(1'h0)];
              reg26 <= ($unsigned($unsigned(reg18[(3'h7):(2'h3)])) ?
                  {((reg22[(5'h10):(2'h3)] >> $unsigned(reg14)) == (^(reg14 ?
                          (8'hbe) : wire8))),
                      $unsigned(((reg20 >> reg18) ?
                          $signed(reg22) : ((8'hb0) <= reg24)))} : $unsigned(wire9));
            end
          reg27 <= reg25[(3'h6):(2'h2)];
          reg28 <= wire10[(5'h11):(2'h3)];
          reg29 <= reg23;
        end
      else
        begin
          reg21 <= {(reg24 ?
                  (($unsigned(reg17) ? $unsigned(reg23) : (&reg24)) ?
                      {$unsigned(reg24)} : $unsigned((reg14 ^~ (8'hac)))) : $unsigned($unsigned($unsigned(reg14))))};
          reg22 <= $signed($unsigned(reg23[(4'h8):(3'h4)]));
          reg23 <= ((reg29 ?
              $unsigned(({reg13} ^ reg29)) : reg26[(1'h1):(1'h0)]) | $unsigned((~^wire10)));
          reg24 <= $signed(({$signed(reg21)} ?
              reg19[(4'ha):(4'ha)] : reg29[(3'h5):(3'h4)]));
          reg25 <= $signed(reg28);
        end
      reg30 <= (8'hab);
      reg31 <= $signed((~(&(reg20 ? reg22 : $signed(reg13)))));
      if ((reg18 ?
          ($unsigned((reg31[(1'h1):(1'h0)] ? (~|reg13) : (reg13 >= reg28))) ?
              $signed($signed(reg26)) : (wire11 <<< (|$unsigned(reg19)))) : (wire10[(3'h4):(1'h1)] && $signed(reg21[(3'h5):(1'h0)]))))
        begin
          reg32 <= reg31[(4'h9):(4'h9)];
          reg33 <= (reg14 ? reg21[(3'h4):(2'h3)] : reg17);
        end
      else
        begin
          reg32 <= ((~((|wire10) ?
                  $signed((reg25 ? (8'hb5) : reg29)) : $signed({(8'hb8),
                      reg26}))) ?
              $unsigned((~&{((7'h44) * (8'hb0))})) : reg24[(1'h1):(1'h1)]);
          if (reg33[(3'h5):(2'h3)])
            begin
              reg33 <= $unsigned((~^$signed(((~&reg25) ?
                  reg25[(3'h7):(3'h6)] : $signed(wire10)))));
              reg34 <= (reg19[(4'he):(3'h5)] ~^ {$signed(((reg33 ?
                          (8'hb4) : reg22) ?
                      (+reg22) : (reg24 ? reg28 : (8'h9c))))});
              reg35 <= $unsigned(reg18);
            end
          else
            begin
              reg33 <= ($unsigned($unsigned((+{reg27, reg26}))) ?
                  $signed(({reg27, $unsigned(reg30)} ?
                      $unsigned(reg32) : reg20)) : reg31);
            end
          reg36 <= reg15[(4'h8):(3'h7)];
          if (reg36)
            begin
              reg37 <= reg29;
            end
          else
            begin
              reg37 <= reg36;
              reg38 <= {(-reg19), (reg17 >> (~&wire11[(2'h2):(2'h2)]))};
            end
          reg39 <= ((8'hbc) + (reg26[(3'h4):(3'h4)] * reg26));
        end
    end
  assign wire40 = {(reg35 != (({reg19} ?
                              (reg30 < reg19) : (reg31 ? reg38 : reg33)) ?
                          {$signed((8'hbe)),
                              (~&wire8)} : reg19[(4'hf):(3'h5)]))};
  assign wire41 = (~|reg35);
  module42 #() modinst71 (.wire45(reg30), .wire44(wire10), .wire43(wire9), .wire46(wire8), .clk(clk), .y(wire70));
  assign wire72 = reg25;
  assign wire73 = (reg22 ? reg36[(4'hd):(3'h7)] : {wire10});
  assign wire74 = (~|$signed(reg28[(1'h0):(1'h0)]));
  assign wire75 = (~^$unsigned(($unsigned(wire74) || {(reg33 ?
                          reg25 : (8'hb8))})));
  assign wire76 = $unsigned($unsigned($signed($signed($signed(wire9)))));
  assign wire77 = (~&$unsigned($unsigned(wire74)));
  always
    @(posedge clk) begin
      reg78 <= $signed($unsigned($signed(wire8[(3'h7):(3'h5)])));
      if ($signed(reg18[(1'h1):(1'h0)]))
        begin
          reg79 <= reg16[(1'h0):(1'h0)];
          reg80 <= wire8[(4'hf):(1'h0)];
          reg81 <= (~$signed(((~&{wire11, reg80}) ?
              (-(^~reg23)) : $unsigned(reg23[(2'h3):(1'h0)]))));
          reg82 <= $signed($signed((8'hb8)));
        end
      else
        begin
          if (reg19)
            begin
              reg79 <= reg29;
              reg80 <= {(~(~$signed(((8'had) ? reg12 : reg14)))), reg20};
              reg81 <= $signed($unsigned((((reg16 ? reg15 : reg18) ?
                      (wire9 | reg82) : {wire77}) ?
                  ((7'h41) ?
                      (|(8'hbb)) : $signed(reg17)) : ($signed(reg34) * $signed(reg78)))));
              reg82 <= (8'haa);
              reg83 <= ({($signed($signed(wire40)) ?
                      $unsigned($unsigned(reg36)) : reg78[(4'ha):(2'h2)])} | reg17);
            end
          else
            begin
              reg79 <= $unsigned((reg13 == wire10));
              reg80 <= $signed($signed((|reg78)));
              reg81 <= (~^reg35[(2'h3):(1'h1)]);
              reg82 <= $signed({reg19[(4'hc):(1'h1)]});
              reg83 <= (-(~(wire8[(4'ha):(3'h5)] >> (~^reg28[(2'h3):(2'h2)]))));
            end
          if ((|(((~&(reg13 ? reg82 : (8'had))) ?
                  (~(wire75 ?
                      reg29 : reg21)) : $unsigned(reg83[(3'h7):(2'h2)])) ?
              (((reg25 >= reg83) <= reg16) * wire72) : wire11[(1'h1):(1'h1)])))
            begin
              reg84 <= ((~^reg37) ?
                  wire75[(3'h7):(2'h2)] : (wire74 >> $signed((^wire72[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg84 <= wire72[(1'h1):(1'h0)];
            end
          reg85 <= reg26[(1'h1):(1'h1)];
          reg86 <= $signed(wire75[(4'hb):(3'h7)]);
        end
      if (((((^~reg12[(2'h2):(1'h0)]) ? ((~^reg18) * reg26) : reg19) ?
              (($unsigned(wire74) ?
                  (+reg39) : $signed(reg32)) ^ wire70) : $unsigned(((reg23 ?
                      reg31 : reg25) ?
                  reg26[(2'h3):(1'h1)] : (~reg18)))) ?
          ((^reg24[(3'h5):(3'h4)]) || $unsigned({reg27[(2'h2):(1'h1)]})) : reg79))
        begin
          reg87 <= ({wire77[(4'ha):(2'h2)]} ^ reg84);
          reg88 <= $unsigned((({(~(8'ha6))} & (reg86 | (reg82 ?
              reg85 : reg38))) >>> ({(|reg35), reg14} ?
              ($unsigned(reg86) ^ (reg39 <= (8'hab))) : $signed((wire70 - wire9)))));
          reg89 <= ((((((8'hb8) ? reg34 : reg37) * reg87[(3'h5):(2'h2)]) ?
                  (&$signed(wire8)) : $unsigned($signed(wire11))) & ({$unsigned(reg18)} ?
                  {(reg35 >= reg79), reg33} : (~^(7'h41)))) ?
              {(~reg34[(3'h4):(2'h2)])} : $signed($signed({reg24[(3'h5):(3'h5)]})));
          if ((&($signed((reg21[(1'h0):(1'h0)] < reg27[(2'h2):(1'h1)])) ?
              reg38[(1'h0):(1'h0)] : $signed({(8'ha2)}))))
            begin
              reg90 <= {((~&reg30) && (~&(|reg18))),
                  ($unsigned((~wire11)) ?
                      wire76 : $signed(($unsigned(reg80) ?
                          $unsigned(reg16) : reg21)))};
              reg91 <= $unsigned((($unsigned(reg85) == reg32) || (reg84 || $unsigned(reg85))));
              reg92 <= ((~^{((wire9 ? (8'hb7) : (8'h9c)) ?
                          {wire41, (7'h44)} : (~&reg13))}) ?
                  reg33 : $signed($signed($signed(reg83[(4'hd):(3'h4)]))));
              reg93 <= $signed((((reg33 == ((8'hb8) - reg21)) ?
                      (reg18[(1'h0):(1'h0)] >= $signed(wire11)) : reg26) ?
                  ((!reg29) && reg79) : (wire8 << $signed((!wire40)))));
            end
          else
            begin
              reg90 <= reg13[(1'h0):(1'h0)];
              reg91 <= reg24;
            end
          reg94 <= $signed({wire8});
        end
      else
        begin
          reg87 <= wire70[(2'h2):(1'h0)];
          reg88 <= ($unsigned((~$unsigned(reg84))) - $unsigned(reg79[(3'h4):(1'h0)]));
          reg89 <= (reg79[(1'h0):(1'h0)] & $signed(wire73[(3'h5):(2'h2)]));
          if ((!wire9))
            begin
              reg90 <= $unsigned((|($unsigned((^~wire74)) ?
                  ((+(8'ha0)) ?
                      (|reg18) : reg85[(3'h4):(1'h1)]) : $unsigned($signed(reg23)))));
              reg91 <= reg39;
              reg92 <= (^(^~$signed((~$signed(wire74)))));
              reg93 <= reg93[(1'h0):(1'h0)];
              reg94 <= (reg37 || reg26);
            end
          else
            begin
              reg90 <= ((reg16[(1'h1):(1'h1)] * {reg19,
                  $unsigned(((8'hbd) ?
                      (8'hb6) : reg92))}) ^~ $unsigned(((((8'h9c) >= (8'ha5)) ?
                  reg24 : $unsigned(reg14)) & {{reg30, reg26}})));
            end
        end
      if ((^~(^({reg78[(1'h1):(1'h1)]} > $signed({(8'ha0)})))))
        begin
          reg95 <= ((reg79 ?
              (reg91 << ((wire40 ? wire10 : reg17) ?
                  reg31 : $unsigned(reg85))) : reg21) & $unsigned($unsigned(((~&reg83) ~^ ((8'hb3) ?
              wire41 : reg79)))));
        end
      else
        begin
          if ($unsigned((|wire72[(3'h7):(2'h3)])))
            begin
              reg95 <= reg25;
              reg96 <= $unsigned($signed(reg37[(4'h8):(2'h2)]));
            end
          else
            begin
              reg95 <= {(^(((reg39 ? wire74 : (8'haf)) + $signed(reg32)) ?
                      $unsigned((reg36 ? wire10 : reg81)) : {(reg86 + reg31),
                          (reg16 ? reg31 : (8'hba))}))};
              reg96 <= $signed($signed($unsigned((-(+reg86)))));
              reg97 <= (reg93 ?
                  {($unsigned((wire8 ~^ (8'had))) >= $signed((wire8 - reg25)))} : ($signed({(reg19 >= reg38),
                      (wire74 ?
                          reg95 : reg36)}) - (reg86[(2'h3):(1'h1)] >> wire8[(4'hd):(3'h6)])));
              reg98 <= (8'hb3);
            end
          if (wire77[(4'hd):(4'hb)])
            begin
              reg99 <= wire75;
              reg100 <= reg90;
              reg101 <= $signed($signed($signed(reg92[(3'h7):(3'h4)])));
            end
          else
            begin
              reg99 <= (|reg13[(3'h4):(2'h2)]);
              reg100 <= reg22;
            end
          reg102 <= wire76[(4'ha):(3'h4)];
        end
    end
  assign wire103 = ($signed($signed(($signed(reg89) ?
                       (8'haf) : $unsigned(reg38)))) * ($signed($signed({reg86})) ?
                       (8'hba) : (reg27 ?
                           ((reg85 <= reg17) ?
                               ((8'ha1) << (8'h9e)) : reg88[(1'h0):(1'h0)]) : (reg79 ?
                               reg25 : ((8'ha6) ? reg21 : reg97)))));
  assign wire104 = reg18;
  assign wire105 = $unsigned((|({(reg20 ? (8'ha6) : (7'h43)),
                       {reg35, reg81}} >= $signed((reg35 ? wire72 : reg86)))));
  assign wire106 = ($signed($unsigned(($signed(reg30) ~^ (reg18 | reg22)))) + reg35);
  assign wire107 = ((8'haa) || ((~|(reg35[(4'h8):(2'h3)] > reg90[(4'ha):(1'h1)])) ?
                       (&reg30[(3'h6):(3'h6)]) : $unsigned((reg97[(3'h7):(3'h7)] ?
                           {reg82} : $signed(reg31)))));
  module108 #() modinst137 (.clk(clk), .wire109(wire103), .wire112(reg23), .wire111(reg90), .y(wire136), .wire110(reg37));
  assign wire138 = {$unsigned($unsigned((wire70[(1'h0):(1'h0)] ?
                           (reg25 ? reg92 : reg13) : $unsigned(wire75)))),
                       (~|reg100[(3'h6):(3'h6)])};
  module139 #() modinst153 (wire152, clk, reg17, wire106, reg34, reg12, wire73);
  assign wire154 = (~^$unsigned(($unsigned({reg26,
                       reg26}) >> ((reg89 >>> (8'hba)) | $unsigned(reg93)))));
endmodule

module module139  (y, clk, wire144, wire143, wire142, wire141, wire140);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire144;
  input wire [(5'h13):(1'h0)] wire143;
  input wire signed [(5'h15):(1'h0)] wire142;
  input wire [(4'h9):(1'h0)] wire141;
  input wire signed [(5'h11):(1'h0)] wire140;
  wire [(2'h3):(1'h0)] wire151;
  wire signed [(3'h5):(1'h0)] wire150;
  wire signed [(4'hf):(1'h0)] wire149;
  wire [(4'h8):(1'h0)] wire148;
  wire signed [(2'h2):(1'h0)] wire146;
  wire [(4'h8):(1'h0)] wire145;
  reg signed [(4'ha):(1'h0)] reg147 = (1'h0);
  assign y = {wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire146,
                 wire145,
                 reg147,
                 (1'h0)};
  assign wire145 = wire144[(4'h8):(3'h4)];
  assign wire146 = wire144;
  always
    @(posedge clk) begin
      reg147 <= wire141;
    end
  assign wire148 = (((wire143 ^~ (wire142[(4'hf):(1'h0)] ?
                           wire146[(2'h2):(2'h2)] : $signed(wire145))) ?
                       (8'ha7) : $signed((wire140[(4'hc):(3'h6)] ?
                           $signed(wire141) : (+wire146)))) && (^~reg147[(2'h2):(2'h2)]));
  assign wire149 = $unsigned(wire143);
  assign wire150 = reg147;
  assign wire151 = (wire150 << $signed($unsigned($unsigned((wire142 ?
                       wire143 : wire143)))));
endmodule

module module108  (y, clk, wire112, wire111, wire110, wire109);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire112;
  input wire signed [(4'ha):(1'h0)] wire111;
  input wire [(4'hc):(1'h0)] wire110;
  input wire signed [(4'hd):(1'h0)] wire109;
  wire [(5'h10):(1'h0)] wire135;
  wire signed [(4'he):(1'h0)] wire134;
  wire signed [(4'hc):(1'h0)] wire133;
  wire signed [(4'h8):(1'h0)] wire132;
  wire [(3'h6):(1'h0)] wire131;
  wire signed [(4'hd):(1'h0)] wire128;
  wire signed [(2'h3):(1'h0)] wire127;
  wire signed [(4'ha):(1'h0)] wire126;
  wire signed [(3'h5):(1'h0)] wire125;
  wire [(3'h7):(1'h0)] wire124;
  wire signed [(5'h15):(1'h0)] wire123;
  wire [(2'h3):(1'h0)] wire122;
  wire [(2'h2):(1'h0)] wire121;
  wire [(4'hd):(1'h0)] wire120;
  wire [(4'hb):(1'h0)] wire119;
  wire signed [(5'h14):(1'h0)] wire118;
  wire signed [(5'h13):(1'h0)] wire117;
  wire [(4'hb):(1'h0)] wire116;
  wire signed [(3'h6):(1'h0)] wire115;
  wire signed [(3'h5):(1'h0)] wire114;
  wire [(4'hc):(1'h0)] wire113;
  reg [(2'h2):(1'h0)] reg130 = (1'h0);
  reg [(3'h4):(1'h0)] reg129 = (1'h0);
  assign y = {wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire128,
                 wire127,
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
                 wire114,
                 wire113,
                 reg130,
                 reg129,
                 (1'h0)};
  assign wire113 = (~|(wire109 ?
                       ((wire112 ^~ wire111) ?
                           wire111[(3'h4):(2'h3)] : $signed(wire111)) : wire109));
  assign wire114 = (~&wire110[(4'hc):(1'h0)]);
  assign wire115 = $signed((^wire111));
  assign wire116 = {wire115[(1'h0):(1'h0)],
                       ({{(wire112 * wire109)}} ?
                           ((wire111 ? {wire111} : $unsigned(wire115)) ?
                               $signed(wire112[(4'he):(1'h0)]) : wire109[(2'h3):(2'h3)]) : (~&$unsigned((8'hb3))))};
  assign wire117 = $signed((wire109[(3'h6):(3'h6)] >>> wire111[(1'h0):(1'h0)]));
  assign wire118 = (8'hb2);
  assign wire119 = (^wire117);
  assign wire120 = (^~{{((!wire109) > wire110)}});
  assign wire121 = $signed($unsigned(wire110));
  assign wire122 = {(wire115[(3'h6):(1'h0)] >>> (-{(^~(8'hb6))})),
                       (wire115[(3'h5):(1'h1)] < wire120)};
  assign wire123 = {($unsigned({wire116, (wire111 == wire110)}) ?
                           (-$signed({wire122,
                               wire121})) : {$signed(wire121[(1'h1):(1'h0)])}),
                       wire109};
  assign wire124 = (((~^$signed((wire116 >> wire122))) ?
                       wire109[(2'h2):(1'h1)] : ($unsigned({wire114, wire123}) ?
                           ((|wire114) << (~^wire120)) : wire122[(1'h1):(1'h1)])) & $signed(({wire111[(3'h6):(3'h6)],
                           (8'hab)} ?
                       {((8'ha0) >> wire115)} : (wire121 ?
                           (|wire109) : (wire118 >> wire119)))));
  assign wire125 = wire116;
  assign wire126 = $unsigned((~|(!wire124[(3'h6):(1'h1)])));
  assign wire127 = wire117;
  assign wire128 = $unsigned({(-($unsigned(wire125) ?
                           $signed(wire112) : $unsigned(wire127)))});
  always
    @(posedge clk) begin
      reg129 <= {$signed(wire117[(4'h8):(3'h6)])};
      reg130 <= $unsigned(wire111);
    end
  assign wire131 = wire125;
  assign wire132 = $signed($signed($unsigned(wire112[(3'h5):(2'h2)])));
  assign wire133 = (^wire118[(4'he):(4'hb)]);
  assign wire134 = $unsigned((wire109[(4'ha):(4'h8)] ?
                       (($signed(wire117) ?
                           wire131 : wire119) - ((~^(8'hb0)) * $signed(reg129))) : $unsigned(wire128)));
  assign wire135 = $unsigned(((8'ha3) ?
                       $signed(((wire117 ? wire118 : wire126) ?
                           wire134 : (^(8'hb0)))) : (~^$signed((~&wire133)))));
endmodule

module module42  (y, clk, wire46, wire45, wire44, wire43);
  output wire [(32'hf0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire46;
  input wire [(3'h7):(1'h0)] wire45;
  input wire signed [(3'h4):(1'h0)] wire44;
  input wire signed [(4'hc):(1'h0)] wire43;
  wire signed [(4'h8):(1'h0)] wire69;
  wire [(4'h8):(1'h0)] wire68;
  wire [(5'h10):(1'h0)] wire66;
  wire [(2'h2):(1'h0)] wire65;
  reg [(2'h3):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg63 = (1'h0);
  reg [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(4'h8):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg60 = (1'h0);
  reg [(4'hb):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg58 = (1'h0);
  reg [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(5'h10):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg51 = (1'h0);
  reg [(4'ha):(1'h0)] reg50 = (1'h0);
  reg [(4'hc):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg47 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire66,
                 wire65,
                 reg67,
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
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((+((~^$signed(wire46)) >> wire44)))
        begin
          reg47 <= (wire45 ?
              wire46[(4'hc):(4'h9)] : $signed((wire45 != wire44[(2'h3):(2'h3)])));
          reg48 <= $signed(wire43[(4'hc):(4'h8)]);
        end
      else
        begin
          if ((((((wire45 ? wire43 : (8'ha6)) - wire44) - $signed({wire44,
                  reg47})) ?
              (wire45[(3'h4):(1'h1)] ?
                  ($signed(reg48) >>> wire45[(2'h2):(2'h2)]) : ((wire44 >> (7'h40)) || (&wire44))) : {$signed((reg47 >= (8'ha3))),
                  wire46}) >> reg48[(3'h4):(1'h0)]))
            begin
              reg47 <= (+(!($signed((wire46 | (8'hb9))) ?
                  reg48[(1'h1):(1'h1)] : wire45)));
              reg48 <= wire45;
              reg49 <= $unsigned($signed(reg47));
              reg50 <= ($unsigned($signed($signed((~wire45)))) + $unsigned(reg48[(2'h3):(1'h0)]));
              reg51 <= wire46[(2'h2):(1'h0)];
            end
          else
            begin
              reg47 <= ($unsigned($signed(reg51[(4'he):(3'h5)])) ?
                  $unsigned((7'h42)) : $unsigned($signed(($unsigned(reg50) >>> (reg47 <<< reg48)))));
              reg48 <= (-wire45);
            end
          reg52 <= ((^wire44[(1'h1):(1'h1)]) ?
              $signed((~|$unsigned($signed(reg51)))) : $signed(wire44[(2'h3):(1'h0)]));
          if (reg51)
            begin
              reg53 <= ((((&wire44) ^~ (~&(reg49 > reg52))) | ((wire43 ?
                          (wire43 ? reg51 : reg49) : {(8'hb5), reg51}) ?
                      $signed((^~reg48)) : (!{reg50, wire44}))) ?
                  {wire43,
                      ((reg52 & {reg51}) <<< reg49[(3'h4):(3'h4)])} : $unsigned((+$signed((^wire45)))));
              reg54 <= ({({(+(8'hb7))} < (wire45[(3'h6):(2'h3)] ?
                      {(8'hb0), wire46} : $signed(reg50))),
                  $signed($signed((|wire45)))} | {wire44[(2'h2):(1'h1)]});
              reg55 <= wire44;
            end
          else
            begin
              reg53 <= (~reg51[(5'h11):(5'h11)]);
              reg54 <= wire45;
              reg55 <= reg51[(4'hc):(4'ha)];
              reg56 <= $unsigned(wire44[(2'h3):(2'h3)]);
            end
          reg57 <= wire46[(4'hd):(1'h0)];
        end
      if ((~(+(!$signed($unsigned(reg53))))))
        begin
          reg58 <= wire44;
        end
      else
        begin
          if (reg56)
            begin
              reg58 <= {$unsigned($unsigned($unsigned((&wire45))))};
              reg59 <= $unsigned($unsigned(reg48[(3'h4):(1'h1)]));
              reg60 <= $unsigned($unsigned(((reg48 ?
                      $unsigned((7'h44)) : (~^wire44)) ?
                  reg56 : reg50)));
              reg61 <= (wire45[(3'h7):(3'h7)] ?
                  reg58 : (reg52 ? reg60 : $unsigned({$unsigned(reg57)})));
            end
          else
            begin
              reg58 <= reg52;
              reg59 <= {reg57[(1'h1):(1'h0)]};
              reg60 <= $signed(reg52);
            end
          reg62 <= ($unsigned(reg57) ?
              reg50[(3'h4):(3'h4)] : (~|$unsigned(reg54[(3'h7):(2'h2)])));
        end
      reg63 <= (reg54[(4'h8):(1'h1)] ? reg60 : reg57);
      reg64 <= $signed($signed(($signed($signed(reg49)) || $unsigned(wire44))));
    end
  assign wire65 = $signed((^~reg50[(1'h0):(1'h0)]));
  assign wire66 = $signed($signed((((wire65 & wire43) < reg52[(1'h0):(1'h0)]) ?
                      {(reg56 ? reg50 : reg60), reg60} : reg48)));
  always
    @(posedge clk) begin
      reg67 <= reg62;
    end
  assign wire68 = $signed((8'ha3));
  assign wire69 = $unsigned((^(~^$signed((!reg67)))));
endmodule
