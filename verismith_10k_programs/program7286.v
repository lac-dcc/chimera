module top
#(parameter param156 = ((+{(((8'hb0) && (8'h9e)) ? ((8'hae) ? (7'h43) : (8'hb4)) : (~&(8'hb4))), {((8'ha6) ^~ (7'h40))}}) ? (&(~((-(7'h43)) ? (|(8'hb3)) : (|(8'ha6))))) : (((((8'ha5) ^~ (8'ha7)) ? (+(8'hb6)) : ((8'ha9) | (8'hab))) >>> {((8'hb4) ? (8'hbd) : (8'ha1)), ((8'hba) <<< (8'hb2))}) || ((((8'h9c) ? (8'ha2) : (7'h40)) ^~ ((8'ha7) + (8'h9d))) ? ((~^(8'ha1)) == {(8'hbc), (8'hb6)}) : (^(~&(8'hb8)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire155;
  wire [(3'h5):(1'h0)] wire153;
  wire signed [(2'h2):(1'h0)] wire152;
  wire signed [(3'h7):(1'h0)] wire150;
  wire [(5'h15):(1'h0)] wire4;
  reg signed [(3'h5):(1'h0)] reg154 = (1'h0);
  assign y = {wire155, wire153, wire152, wire150, wire4, reg154, (1'h0)};
  assign wire4 = $signed($unsigned(wire2));
  module5 #() modinst151 (wire150, clk, wire4, wire3, wire1, wire2);
  assign wire152 = $unsigned(((($signed(wire3) != wire2) ?
                       ((~|(8'ha4)) ?
                           (wire1 << wire2) : (wire0 && (8'ha3))) : $signed((wire0 > wire1))) != wire150[(1'h1):(1'h0)]));
  assign wire153 = ((-wire1[(3'h7):(1'h1)]) ?
                       wire1[(2'h3):(1'h0)] : $unsigned((^~(wire1[(4'h9):(3'h6)] + (wire152 ?
                           wire2 : wire4)))));
  always
    @(posedge clk) begin
      reg154 <= $signed((wire4[(4'hb):(2'h2)] ^ (-wire150)));
    end
  assign wire155 = wire152;
endmodule

module module5
#(parameter param148 = (8'ha1), 
parameter param149 = ({(((~|param148) ? (8'ha2) : param148) ? ((-param148) ? (|param148) : ((8'ha4) ? param148 : param148)) : ((|(8'hbe)) & {param148})), {(~(~param148)), param148}} ? (param148 - param148) : ((^((param148 ? param148 : param148) > (param148 ? param148 : param148))) ~^ (~|(^(param148 > param148))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h1ef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire [(3'h6):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire7;
  input wire [(5'h14):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire147;
  wire signed [(5'h10):(1'h0)] wire146;
  wire [(4'ha):(1'h0)] wire144;
  wire [(4'h8):(1'h0)] wire106;
  wire [(2'h3):(1'h0)] wire104;
  wire signed [(4'hd):(1'h0)] wire38;
  wire signed [(5'h12):(1'h0)] wire37;
  wire [(5'h10):(1'h0)] wire36;
  wire signed [(5'h15):(1'h0)] wire35;
  wire signed [(3'h6):(1'h0)] wire34;
  wire signed [(5'h10):(1'h0)] wire26;
  wire signed [(4'ha):(1'h0)] wire25;
  wire signed [(4'hf):(1'h0)] wire24;
  wire [(4'he):(1'h0)] wire23;
  wire signed [(4'he):(1'h0)] wire22;
  wire signed [(3'h5):(1'h0)] wire21;
  wire [(4'hb):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire19;
  wire signed [(2'h2):(1'h0)] wire18;
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg41 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  assign y = {wire147,
                 wire146,
                 wire144,
                 wire106,
                 wire104,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($unsigned(wire8) ?
          wire8[(3'h4):(2'h2)] : ($unsigned({{(8'h9d), wire8}}) ?
              wire8 : wire9[(2'h3):(1'h1)])))
        begin
          reg10 <= wire9;
          if (wire8)
            begin
              reg11 <= $unsigned((!(!$signed((~|wire9)))));
              reg12 <= wire8;
              reg13 <= (~^(&(~|{(~^reg10), wire7[(4'hd):(4'ha)]})));
              reg14 <= ((8'ha2) && {$signed(wire7),
                  (!$signed($unsigned((8'ha2))))});
            end
          else
            begin
              reg11 <= (($signed($signed((reg12 ?
                      reg12 : wire6))) - (!(~^(reg14 ? reg10 : reg11)))) ?
                  $unsigned((8'haa)) : {$signed($signed((|reg11)))});
              reg12 <= $signed($unsigned((-(~&$unsigned(reg14)))));
              reg13 <= (($unsigned(((reg11 << reg14) ?
                          wire9[(3'h5):(3'h4)] : (~(8'ha8)))) ?
                      wire9 : $signed(((8'ha0) ?
                          {reg11, reg13} : (wire7 ? wire6 : reg12)))) ?
                  {reg14[(1'h1):(1'h1)]} : $unsigned(((wire6[(3'h4):(3'h4)] == (&reg12)) ?
                      reg14 : $unsigned($unsigned((8'hb3))))));
              reg14 <= (reg11 ?
                  $signed(wire7) : $signed((wire7[(4'hc):(2'h3)] ?
                      reg10[(1'h1):(1'h0)] : (wire6[(4'h9):(3'h5)] ?
                          $unsigned(reg14) : (~|reg13)))));
            end
        end
      else
        begin
          reg10 <= $unsigned($signed((((reg11 ?
                  reg14 : wire6) ^~ (reg14 > wire8)) ?
              reg12 : ((wire8 ? reg10 : reg10) ?
                  (wire9 >= wire7) : $signed(reg10)))));
          reg11 <= (|(-reg12));
          reg12 <= (~^(reg13[(3'h4):(3'h4)] << $signed(wire7[(4'he):(1'h1)])));
        end
      reg15 <= reg14[(1'h1):(1'h1)];
      reg16 <= (~^wire6[(2'h2):(1'h0)]);
      reg17 <= ($unsigned($unsigned($signed((reg14 <<< wire8)))) ?
          $unsigned(wire6[(4'he):(4'hd)]) : $unsigned((^$unsigned(((8'haf) >= reg14)))));
    end
  assign wire18 = reg12[(4'h8):(2'h3)];
  assign wire19 = (^{(~^(+{reg12, (8'hb0)}))});
  assign wire20 = wire18[(1'h0):(1'h0)];
  assign wire21 = ($unsigned((((~&wire18) > reg13) ?
                          $unsigned($unsigned((7'h42))) : $unsigned($unsigned(wire19)))) ?
                      (8'hb4) : $unsigned(wire19[(1'h1):(1'h0)]));
  assign wire22 = (^~{$signed((^~(-(8'ha5))))});
  assign wire23 = (((+reg10) >> $unsigned($unsigned((~wire7)))) ~^ $unsigned((~|$signed((|wire21)))));
  assign wire24 = (reg10[(3'h4):(2'h3)] ?
                      (~(~wire6[(4'hf):(2'h2)])) : (~&$signed((8'hae))));
  assign wire25 = (($signed(wire6) << wire20[(4'hb):(3'h5)]) + {{wire7[(4'hd):(4'hb)],
                          wire21},
                      $unsigned((8'hae))});
  assign wire26 = reg12;
  always
    @(posedge clk) begin
      reg27 <= (-$unsigned($signed({(reg11 ? wire26 : wire19)})));
      if ($unsigned($signed(((-(wire9 ~^ wire26)) <<< $signed($signed(wire24))))))
        begin
          if (($unsigned($unsigned(wire24)) ?
              reg15[(3'h7):(2'h3)] : (~^wire18[(1'h1):(1'h0)])))
            begin
              reg28 <= $signed(($signed(((~wire22) ?
                  $unsigned((8'h9f)) : wire18)) >= (8'hbd)));
              reg29 <= (+wire26[(4'hd):(3'h5)]);
            end
          else
            begin
              reg28 <= (~&wire26);
              reg29 <= $signed({(!((^~wire22) != {reg16, reg28}))});
              reg30 <= (-(8'had));
              reg31 <= reg16[(4'hd):(3'h7)];
            end
          reg32 <= $unsigned(reg29);
          reg33 <= reg10;
        end
      else
        begin
          reg28 <= ((!(($unsigned((7'h43)) ?
                      (reg32 ? reg13 : wire9) : {wire22, wire25}) ?
                  $unsigned((~reg15)) : ({wire7, wire25} * (^reg12)))) ?
              $signed(wire8) : $signed($unsigned((8'h9e))));
          reg29 <= $unsigned($signed($signed($unsigned(reg33))));
          reg30 <= reg31[(4'he):(4'hd)];
          reg31 <= ((|$signed($unsigned($signed(reg14)))) || (wire18 ?
              reg11[(5'h13):(4'hb)] : $signed((&(~^wire21)))));
        end
    end
  assign wire34 = reg13;
  assign wire35 = (~^(8'hb3));
  assign wire36 = {$unsigned(wire21), reg12};
  assign wire37 = $signed(reg11);
  assign wire38 = $unsigned(wire36[(2'h3):(1'h1)]);
  always
    @(posedge clk) begin
      reg39 <= $signed($signed(((((8'ha3) * wire38) ^~ (~(8'ha1))) ?
          wire24[(1'h0):(1'h0)] : ({(8'hbd), wire7} | wire19[(1'h0):(1'h0)]))));
      if ({reg39[(4'hd):(4'hb)],
          $unsigned((wire7 ?
              {wire38, $signed(reg27)} : (~&(wire23 ? reg33 : wire35))))})
        begin
          reg40 <= {$signed(wire22[(1'h1):(1'h1)]),
              {$unsigned($signed((&wire7)))}};
          reg41 <= ($signed(reg17[(2'h3):(1'h1)]) ?
              (((&wire7[(5'h10):(4'hf)]) <<< ((reg29 ?
                      reg11 : wire20) * (&wire7))) ?
                  {(-(reg13 > reg12))} : ((reg16 ^~ ((8'hb1) == wire20)) ?
                      (reg29 & (!wire6)) : (wire34[(3'h4):(3'h4)] ?
                          (&wire35) : reg16[(3'h5):(3'h4)]))) : (+(((^~wire36) ?
                      $signed((8'hb6)) : reg28) ?
                  $unsigned((~^reg39)) : reg14)));
          reg42 <= $unsigned((~|wire26[(2'h2):(1'h1)]));
        end
      else
        begin
          if ((reg10[(3'h7):(1'h1)] >= ($signed((!$unsigned((8'hac)))) ?
              {wire35,
                  reg41[(3'h7):(1'h1)]} : ((~^reg40) & reg10[(1'h1):(1'h1)]))))
            begin
              reg40 <= ((({$unsigned(wire23)} ?
                      wire36 : $unsigned((wire26 ? (8'ha9) : (8'hb5)))) ?
                  $signed($unsigned((wire21 ?
                      wire8 : reg29))) : (^~((~^wire23) || reg13))) < {$signed(($signed((8'hbd)) ?
                      wire25[(3'h7):(1'h0)] : $signed(wire18)))});
              reg41 <= ((~^$unsigned(wire24)) ?
                  reg33 : ({$signed($unsigned(reg27))} ?
                      ($unsigned(wire6[(4'hd):(1'h0)]) ?
                          {(reg10 ? reg31 : reg32),
                              (wire19 ? (8'hac) : wire7)} : ($unsigned(reg28) ?
                              $signed((8'hb8)) : reg39[(4'ha):(1'h1)])) : (((~reg39) > $signed(reg39)) ?
                          (~$unsigned(wire35)) : reg30)));
            end
          else
            begin
              reg40 <= (-reg29[(2'h2):(1'h1)]);
              reg41 <= reg33;
            end
          reg42 <= (~&$signed(({((7'h43) <= (8'hae))} ^ reg28)));
          reg43 <= (&($signed((~(+reg27))) && reg42[(3'h6):(2'h3)]));
        end
      reg44 <= $signed((reg29 ?
          (-((&wire7) > wire34[(2'h2):(2'h2)])) : {$signed((reg41 ?
                  (7'h40) : wire36)),
              $signed(wire36[(3'h4):(3'h4)])}));
      reg45 <= ($unsigned((!$unsigned(wire18[(1'h0):(1'h0)]))) ?
          reg32 : $unsigned((reg27 ?
              reg32[(4'h8):(3'h6)] : {(-reg39), (~reg11)})));
    end
  module46 #() modinst105 (.wire51(reg14), .clk(clk), .wire48(wire8), .wire49(wire23), .wire50(wire7), .y(wire104), .wire47(wire38));
  assign wire106 = (((^($signed(reg10) == $unsigned(wire25))) ?
                       (wire21 ? reg15 : (-(~&(8'ha3)))) : (((-wire23) ?
                               $signed(reg16) : reg33) ?
                           reg44[(2'h2):(1'h1)] : {(~^(8'hbb)),
                               (reg13 ?
                                   (8'ha4) : wire35)})) || $unsigned($unsigned($signed((reg29 + reg41)))));
  module107 #() modinst145 (wire144, clk, wire26, reg27, wire22, reg10);
  assign wire146 = (^~$unsigned(wire19[(2'h2):(1'h0)]));
  assign wire147 = (~^wire26[(4'hd):(3'h5)]);
endmodule

module module107
#(parameter param143 = ((~|{{(~^(8'ha6))}}) ? (~|(8'ha9)) : ((^{{(8'hb5), (8'hab)}, ((8'hb9) != (8'ha5))}) ? (8'ha1) : (((^~(8'ha3)) ? (+(7'h41)) : (+(8'h9f))) ? (^~(-(8'h9c))) : ((~|(8'ha5)) ? (|(8'ha4)) : {(8'hbe), (8'ha6)})))))
(y, clk, wire111, wire110, wire109, wire108);
  output wire [(32'h164):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire111;
  input wire [(5'h12):(1'h0)] wire110;
  input wire signed [(4'he):(1'h0)] wire109;
  input wire signed [(4'hb):(1'h0)] wire108;
  wire signed [(5'h10):(1'h0)] wire142;
  wire signed [(3'h6):(1'h0)] wire141;
  wire [(2'h2):(1'h0)] wire140;
  wire [(4'hb):(1'h0)] wire139;
  wire [(5'h12):(1'h0)] wire138;
  wire [(3'h5):(1'h0)] wire124;
  wire [(3'h4):(1'h0)] wire123;
  wire signed [(5'h12):(1'h0)] wire122;
  wire signed [(4'h9):(1'h0)] wire121;
  wire [(5'h10):(1'h0)] wire120;
  wire signed [(4'ha):(1'h0)] wire119;
  wire [(5'h11):(1'h0)] wire118;
  wire signed [(4'hd):(1'h0)] wire117;
  wire [(5'h15):(1'h0)] wire116;
  reg signed [(3'h5):(1'h0)] reg137 = (1'h0);
  reg signed [(4'he):(1'h0)] reg136 = (1'h0);
  reg [(5'h14):(1'h0)] reg135 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg134 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg131 = (1'h0);
  reg [(4'hf):(1'h0)] reg130 = (1'h0);
  reg [(4'h9):(1'h0)] reg129 = (1'h0);
  reg [(4'h9):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg127 = (1'h0);
  reg [(4'ha):(1'h0)] reg126 = (1'h0);
  reg [(4'he):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg113 = (1'h0);
  reg [(3'h6):(1'h0)] reg112 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
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
                 reg125,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((8'ha3))
        begin
          reg112 <= $unsigned(({(wire109[(4'ha):(1'h1)] ?
                      {wire108} : (8'hba))} ?
              $unsigned(((~^wire111) ?
                  (wire111 ?
                      (7'h40) : wire109) : $signed(wire110))) : (~|$unsigned($unsigned(wire110)))));
        end
      else
        begin
          reg112 <= $signed(wire110[(4'hb):(3'h5)]);
        end
      reg113 <= $signed(($signed((wire108[(4'ha):(1'h1)] ?
          reg112[(3'h4):(1'h1)] : wire110)) >> $unsigned((^~(reg112 ^~ reg112)))));
      reg114 <= ($signed(((&(~wire108)) & ($unsigned(wire110) ?
          reg112 : (wire109 ?
              (8'haa) : wire111)))) << $signed((reg113[(1'h0):(1'h0)] <<< wire110[(4'h9):(1'h1)])));
      reg115 <= reg114[(1'h1):(1'h1)];
    end
  assign wire116 = ((wire109[(2'h2):(1'h0)] | ($unsigned({reg113}) | {(reg115 ?
                           reg113 : wire110),
                       $signed(wire109)})) ~^ (~((^~(~reg114)) ?
                       {wire111} : $unsigned($signed(reg112)))));
  assign wire117 = (~|(8'hb5));
  assign wire118 = {$unsigned($signed((wire109 ~^ (-(8'ha4)))))};
  assign wire119 = ((8'ha4) ?
                       (-(~|(((8'ha3) >> (8'ha4)) > $signed(reg115)))) : reg114);
  assign wire120 = wire119;
  assign wire121 = wire110;
  assign wire122 = reg115;
  assign wire123 = wire121;
  assign wire124 = $signed((reg113 ? wire108 : wire123));
  always
    @(posedge clk) begin
      reg125 <= (7'h43);
      if ($unsigned(({(+$signed(wire108))} & (((reg114 && wire118) ?
              $signed(wire119) : $signed(wire124)) ?
          $signed((wire117 != wire111)) : $signed((!reg115))))))
        begin
          reg126 <= (((|(8'hbf)) ?
              $unsigned(({wire118} >= $unsigned((8'ha6)))) : ((|(!wire116)) + $signed($unsigned(wire116)))) != $signed({wire116,
              wire109[(2'h2):(1'h0)]}));
          reg127 <= $signed(reg125);
          if ((^~{$signed(wire120), (&wire111[(3'h6):(2'h3)])}))
            begin
              reg128 <= $unsigned(reg126);
              reg129 <= ({(7'h43),
                  $signed((~|$unsigned(reg113)))} - (wire120[(3'h4):(1'h1)] ?
                  $unsigned($signed((reg113 ~^ reg114))) : ($unsigned($signed(reg113)) ?
                      ({reg128,
                          reg127} >>> (~|(7'h42))) : wire117[(3'h5):(2'h2)])));
            end
          else
            begin
              reg128 <= wire109;
              reg129 <= $signed($unsigned((((reg115 == wire119) >> (wire108 <<< reg114)) ?
                  (reg127[(5'h11):(3'h5)] ? {reg126} : {wire118}) : (8'hbd))));
              reg130 <= reg115;
            end
        end
      else
        begin
          reg126 <= $unsigned(reg125);
          if ($signed(($unsigned($unsigned($unsigned(reg130))) ?
              ((wire122[(2'h3):(1'h1)] * (^~reg130)) == (wire118[(4'hc):(2'h3)] ?
                  (reg125 == wire122) : (8'ha2))) : (~&(^{reg128})))))
            begin
              reg127 <= ({$unsigned($unsigned(wire110)),
                      $unsigned(reg114[(1'h0):(1'h0)])} ?
                  {reg125,
                      (~&wire121)} : $signed($signed(wire116[(2'h3):(1'h0)])));
              reg128 <= ($signed(((&(wire119 ?
                      wire124 : wire110)) > {$unsigned(reg115)})) ?
                  $unsigned($signed(($unsigned(wire111) ?
                      reg126[(3'h7):(2'h2)] : ((7'h42) >= (8'hb0))))) : $unsigned({((&reg126) ?
                          wire109 : (~^wire116)),
                      ((reg130 >> wire117) ?
                          wire110[(3'h5):(1'h1)] : (~&wire120))}));
              reg129 <= wire116;
            end
          else
            begin
              reg127 <= (($signed($signed(wire118)) ?
                      (&$signed((~&wire108))) : ((^~wire108[(4'hb):(3'h5)]) ?
                          (~|(~&wire123)) : (~^$unsigned(reg112)))) ?
                  $unsigned({(-(8'hb0)),
                      $signed((~&wire121))}) : $signed((^$unsigned((reg125 ?
                      (8'h9c) : reg113)))));
            end
          reg130 <= $signed((wire118[(4'hd):(3'h7)] ^~ $unsigned($signed(reg130[(3'h6):(1'h1)]))));
        end
    end
  always
    @(posedge clk) begin
      reg131 <= (wire110 ?
          $unsigned(wire116) : (($unsigned(reg128) ~^ ($signed(wire120) ?
                  {reg113, (8'hb6)} : (wire119 ~^ wire117))) ?
              ($signed((wire118 || wire122)) ^~ $unsigned(wire121)) : $unsigned(reg128)));
      if ($signed($unsigned(reg126)))
        begin
          reg132 <= {$signed(wire123)};
          if ($unsigned(wire123[(1'h1):(1'h0)]))
            begin
              reg133 <= (wire123[(1'h0):(1'h0)] >> reg114[(2'h2):(1'h1)]);
            end
          else
            begin
              reg133 <= ($unsigned((^(&$unsigned(wire109)))) | $signed(reg126));
            end
          reg134 <= $signed({wire116[(4'hf):(4'hd)],
              (&({wire119} <<< reg131[(4'h9):(1'h0)]))});
          reg135 <= $signed($signed((($signed(reg112) ?
                  {reg134} : (wire109 ? reg134 : (8'hb5))) ?
              $signed((~^reg113)) : reg134)));
        end
      else
        begin
          reg132 <= {(~^(~&{(wire116 ? reg131 : reg128)})),
              ({$signed(reg132[(4'h9):(3'h6)]),
                  ($signed(wire117) ?
                      (&wire111) : wire123)} & (reg134[(1'h1):(1'h1)] ?
                  $signed(reg129[(1'h1):(1'h1)]) : ($signed(reg133) ?
                      (~|(7'h41)) : wire124)))};
          reg133 <= (~^((($signed(reg135) <= reg133) < $unsigned(wire116[(4'h9):(3'h5)])) ?
              ((&wire123) ^~ {$signed(wire108),
                  (~wire111)}) : ($unsigned(wire122) ?
                  ($unsigned(reg114) ?
                      reg112 : reg128) : reg126[(3'h5):(2'h3)])));
          reg134 <= $unsigned($signed($unsigned((~(reg127 << wire119)))));
        end
      reg136 <= reg129;
      reg137 <= reg113[(2'h2):(1'h0)];
    end
  assign wire138 = $signed($signed($signed(wire121)));
  assign wire139 = $unsigned($signed(($unsigned((&reg125)) * ((-wire121) ?
                       ((8'h9c) ?
                           wire109 : (8'hb7)) : reg112[(3'h4):(2'h3)]))));
  assign wire140 = (({(+(wire119 ~^ reg132))} == (((^~(8'hb4)) || $unsigned(reg129)) ?
                       ($signed((8'hb1)) ?
                           $signed(wire118) : $signed(wire120)) : ((wire122 ?
                           wire108 : reg132) ~^ reg115))) & ($signed((~&$unsigned(wire123))) ?
                       {($unsigned(wire123) ?
                               reg128 : $signed(reg137))} : {$signed($unsigned(wire111)),
                           wire117[(4'hc):(4'ha)]}));
  assign wire141 = wire122[(5'h10):(4'h9)];
  assign wire142 = $signed(reg131[(5'h10):(3'h5)]);
endmodule

module module46
#(parameter param103 = {((({(8'hac), (8'ha6)} && ((8'ha5) ? (8'ha4) : (8'hbd))) != (|((8'hae) ? (8'hbe) : (7'h41)))) ? ({{(8'hb6)}, ((8'haa) < (8'hb8))} ~^ {{(8'hb1)}, {(8'hb6)}}) : ((~|((7'h43) ? (8'ha5) : (7'h41))) >> (&(+(8'hb1)))))})
(y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'h238):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire51;
  input wire [(5'h14):(1'h0)] wire50;
  input wire [(4'he):(1'h0)] wire49;
  input wire [(3'h6):(1'h0)] wire48;
  input wire signed [(4'hd):(1'h0)] wire47;
  wire signed [(4'h9):(1'h0)] wire102;
  wire signed [(5'h15):(1'h0)] wire101;
  wire [(4'ha):(1'h0)] wire100;
  wire [(5'h13):(1'h0)] wire84;
  wire signed [(3'h7):(1'h0)] wire83;
  wire signed [(4'hc):(1'h0)] wire82;
  wire [(2'h2):(1'h0)] wire62;
  wire signed [(4'hd):(1'h0)] wire61;
  reg [(4'he):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg98 = (1'h0);
  reg [(3'h7):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg96 = (1'h0);
  reg [(4'h8):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg93 = (1'h0);
  reg [(5'h12):(1'h0)] reg92 = (1'h0);
  reg [(5'h15):(1'h0)] reg91 = (1'h0);
  reg [(3'h5):(1'h0)] reg90 = (1'h0);
  reg [(5'h15):(1'h0)] reg89 = (1'h0);
  reg [(3'h4):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg86 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg85 = (1'h0);
  reg [(5'h11):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg76 = (1'h0);
  reg [(5'h13):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg73 = (1'h0);
  reg [(4'hc):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg68 = (1'h0);
  reg [(4'h9):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg65 = (1'h0);
  reg [(4'hf):(1'h0)] reg64 = (1'h0);
  reg [(3'h6):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg58 = (1'h0);
  reg [(4'ha):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg54 = (1'h0);
  reg [(4'hb):(1'h0)] reg53 = (1'h0);
  reg [(4'hb):(1'h0)] reg52 = (1'h0);
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire84,
                 wire83,
                 wire82,
                 wire62,
                 wire61,
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
                 reg81,
                 reg80,
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
                 reg65,
                 reg64,
                 reg63,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg52 <= ($signed(((-$unsigned(wire51)) <= (wire47[(2'h3):(2'h2)] && $unsigned(wire49)))) || (wire47 > wire48));
      if ($unsigned($unsigned($unsigned(wire51))))
        begin
          reg53 <= ((^~(^~$signed((wire48 ? reg52 : wire50)))) < wire51);
          reg54 <= ($unsigned(({wire50[(3'h5):(3'h4)]} ?
              ((~|wire48) ?
                  (-wire49) : $signed(wire51)) : wire48[(2'h3):(2'h2)])) <<< $signed(reg53[(4'hb):(1'h1)]));
          reg55 <= wire48;
          reg56 <= ($unsigned((8'haa)) ^~ (~(reg52[(3'h4):(2'h2)] << wire50)));
          reg57 <= $signed(wire50);
        end
      else
        begin
          reg53 <= (7'h41);
        end
      reg58 <= ($unsigned(((-(^~wire47)) ?
              ((-(8'hbb)) ?
                  (~|reg52) : wire51[(2'h2):(2'h2)]) : $signed((reg55 ~^ wire48)))) ?
          reg55[(2'h3):(1'h1)] : (!($unsigned(wire49[(2'h3):(1'h0)]) ?
              $unsigned((~&reg56)) : (~(reg57 ? (8'h9c) : reg57)))));
      reg59 <= $signed((((~&reg56) ?
          (reg58[(2'h3):(2'h2)] << wire48[(1'h0):(1'h0)]) : ($signed(reg55) ?
              (~|wire49) : (reg52 & reg56))) >> ($signed((^~reg56)) > (|(reg56 ?
          wire47 : reg53)))));
      reg60 <= reg56;
    end
  assign wire61 = $unsigned(reg57[(4'h8):(2'h3)]);
  assign wire62 = ($signed(reg56[(4'hc):(2'h3)]) ^ wire49[(4'h8):(3'h4)]);
  always
    @(posedge clk) begin
      if ({wire62[(2'h2):(1'h1)], {(wire51 | wire47[(3'h5):(2'h3)])}})
        begin
          reg63 <= $signed(($unsigned($unsigned($signed(reg54))) ^~ reg57));
          reg64 <= reg54[(2'h2):(1'h0)];
          if (((~&(reg55 ? reg60 : reg54)) == {$signed((&(&wire62)))}))
            begin
              reg65 <= $signed((reg54[(2'h2):(1'h1)] ? reg58 : reg60));
              reg66 <= wire49;
              reg67 <= {((-(((8'hbe) >= reg57) ?
                          (reg57 ? wire48 : reg59) : (reg58 ^~ (8'hae)))) ?
                      ($signed(wire62) ?
                          $unsigned((reg64 * reg66)) : (wire48 >> (7'h42))) : (wire51 ?
                          (~&reg58[(3'h4):(2'h3)]) : ((reg53 & reg55) - (wire47 ?
                              wire61 : reg58))))};
              reg68 <= (wire50 ?
                  $unsigned($unsigned(reg53[(1'h1):(1'h0)])) : ($signed(({reg55} ?
                          (^~reg64) : (reg60 | wire62))) ?
                      ((~^((8'ha1) ? reg63 : reg53)) ?
                          (+(~&reg57)) : ((~|wire61) ~^ $unsigned(wire50))) : $unsigned((|$signed(reg58)))));
            end
          else
            begin
              reg65 <= reg56;
            end
        end
      else
        begin
          if ({reg67})
            begin
              reg63 <= ($unsigned($unsigned(reg68)) ?
                  wire47 : {{(|reg53[(1'h0):(1'h0)]), (&(&wire47))},
                      (wire50[(5'h13):(4'hc)] ?
                          reg66[(1'h0):(1'h0)] : (!$signed(wire61)))});
              reg64 <= reg63[(1'h1):(1'h0)];
              reg65 <= (($signed(((|reg63) ?
                          reg58[(1'h1):(1'h1)] : (reg53 ? wire47 : reg56))) ?
                      wire49 : reg64[(2'h2):(1'h0)]) ?
                  reg53[(4'hb):(3'h4)] : wire61[(3'h6):(2'h3)]);
              reg66 <= $signed(reg66);
            end
          else
            begin
              reg63 <= (($signed(reg54[(1'h0):(1'h0)]) == $unsigned(((reg55 ^~ reg57) < {reg59}))) ?
                  ($signed($signed($signed(wire50))) ?
                      ({((8'hab) ? reg63 : wire50)} ?
                          {reg64[(3'h7):(3'h4)],
                              $signed(reg64)} : reg57[(4'h9):(3'h4)]) : reg63[(1'h0):(1'h0)]) : {reg55[(2'h3):(1'h0)],
                      ($unsigned($signed(wire47)) ?
                          $unsigned((&reg53)) : (wire47 ^ wire49))});
            end
          if ((^reg57))
            begin
              reg67 <= ($signed((($signed(reg65) | wire50) ^~ reg57[(2'h3):(1'h0)])) ^ ($unsigned($unsigned((wire51 ?
                      reg64 : reg63))) ?
                  $signed({wire48[(3'h5):(2'h3)],
                      (&wire49)}) : ((~(reg66 ~^ wire61)) ?
                      ((~^reg63) ? wire47 : wire51) : {reg54[(1'h0):(1'h0)],
                          {reg64, reg68}})));
              reg68 <= $signed((reg60[(1'h1):(1'h0)] && $unsigned(($unsigned(reg53) << reg54))));
              reg69 <= (~^{(&({reg58} ? ((8'ha1) << reg55) : $signed(reg57)))});
              reg70 <= ($signed($signed($unsigned($unsigned(reg66)))) ?
                  reg57 : (^~($unsigned((wire48 ^ reg68)) == {(reg67 ?
                          reg68 : reg56)})));
            end
          else
            begin
              reg67 <= wire62;
              reg68 <= (((^(|reg65[(3'h4):(1'h0)])) | ({wire61,
                      (wire61 && reg69)} || {wire51, $unsigned(wire50)})) ?
                  (|((wire50[(4'ha):(4'h9)] ?
                          $unsigned(reg68) : reg54[(1'h0):(1'h0)]) ?
                      $signed({wire62}) : (-{(8'hae)}))) : reg69[(4'hd):(3'h7)]);
              reg69 <= $unsigned((8'hac));
              reg70 <= (^~reg69[(5'h10):(4'he)]);
            end
        end
      reg71 <= ($signed((|(~&reg63[(1'h1):(1'h1)]))) ?
          (^~reg70) : (^$signed((^(wire47 ? reg65 : reg69)))));
      reg72 <= reg56;
      reg73 <= wire50;
      if (((reg66[(3'h5):(2'h3)] != $unsigned(reg67[(2'h3):(1'h0)])) << reg66))
        begin
          reg74 <= ($signed({wire62[(1'h1):(1'h1)],
                  {$unsigned(reg56), (8'ha2)}}) ?
              ((reg71 >= (~^(reg63 ? wire47 : wire49))) ?
                  reg54[(1'h0):(1'h0)] : (^(reg65 <= {reg66,
                      (8'ha5)}))) : reg54);
          if (wire48[(2'h2):(1'h0)])
            begin
              reg75 <= (reg57[(3'h4):(2'h3)] * $signed(reg71));
              reg76 <= ((reg59 <<< (~|reg71)) ?
                  $signed(($signed((~(8'hb4))) * $unsigned($signed(reg73)))) : (reg68[(4'ha):(4'h9)] ?
                      reg55 : (wire61[(1'h1):(1'h0)] ?
                          ((reg69 ^ (8'h9e)) ?
                              (|(8'h9d)) : reg71) : $signed(reg68))));
              reg77 <= $unsigned($unsigned(reg54[(1'h0):(1'h0)]));
            end
          else
            begin
              reg75 <= $unsigned($signed($signed($unsigned({reg74}))));
              reg76 <= ((~|wire62[(2'h2):(1'h1)]) > $unsigned(({$unsigned(reg77),
                  $unsigned(reg63)} ^ $signed({(7'h41)}))));
              reg77 <= ((!$unsigned($signed((~&(8'ha5))))) ?
                  {((~|(reg55 ?
                          reg68 : wire49)) == wire48[(2'h2):(2'h2)])} : wire48[(3'h5):(3'h5)]);
              reg78 <= (^reg64[(3'h4):(1'h1)]);
              reg79 <= wire62;
            end
          reg80 <= reg53[(2'h3):(1'h0)];
          reg81 <= ((wire48[(2'h3):(1'h0)] ?
              reg72[(3'h5):(3'h5)] : wire49) >> reg76);
        end
      else
        begin
          reg74 <= (($signed({reg56[(4'h8):(3'h6)]}) ?
              $signed((~$unsigned(reg81))) : ($signed((wire50 <= reg54)) != $unsigned($unsigned(reg68)))) ^~ $signed($unsigned(reg77)));
          reg75 <= {(($unsigned((reg57 <= wire49)) ?
                  reg60 : $unsigned(((8'hbc) ? (8'ha1) : reg59))) <= ((8'ha2) ?
                  ($signed(reg80) ^~ (~reg80)) : ((~^wire62) ?
                      (reg81 ? reg56 : reg76) : (wire50 ? (8'h9f) : reg75)))),
              ({(wire49 ? wire62 : reg56[(3'h7):(3'h4)]),
                  ($unsigned(reg74) && (reg77 ? reg73 : reg79))} < {(reg80 ?
                      $unsigned(wire47) : reg70)})};
        end
    end
  assign wire82 = $signed((8'ha6));
  assign wire83 = $unsigned(wire51);
  assign wire84 = ({(reg79[(1'h0):(1'h0)] ?
                              (^$signed((8'hb9))) : {(wire48 ? reg56 : reg52),
                                  $unsigned(wire47)}),
                          $signed(((reg78 >>> reg52) || $unsigned(reg81)))} ?
                      $signed($signed($signed($unsigned(reg68)))) : ($unsigned({reg55,
                              $signed(wire49)}) ?
                          reg71[(4'h8):(1'h0)] : (~(~&reg71[(1'h1):(1'h0)]))));
  always
    @(posedge clk) begin
      if (wire50)
        begin
          if ($signed({reg54[(1'h0):(1'h0)]}))
            begin
              reg85 <= wire61;
              reg86 <= reg85;
              reg87 <= ($signed((-wire50[(2'h2):(1'h0)])) < (-$signed(reg71)));
            end
          else
            begin
              reg85 <= (&(^~(~{(reg78 ? (8'ha6) : wire49),
                  wire83[(3'h6):(3'h5)]})));
              reg86 <= reg69;
              reg87 <= ((!$signed(($signed((8'hae)) ?
                  reg78[(3'h5):(2'h2)] : {(8'hb0),
                      wire62}))) | (((~((8'hb0) - reg75)) <<< $signed((reg65 ?
                  wire47 : reg66))) ~^ (($signed((8'ha7)) ?
                  (+reg77) : $signed((8'hb4))) <= reg56)));
              reg88 <= $unsigned($unsigned($unsigned($signed((8'hb7)))));
            end
          reg89 <= (+$signed(reg66));
          reg90 <= reg76[(2'h3):(2'h2)];
          reg91 <= reg89;
        end
      else
        begin
          if (reg74)
            begin
              reg85 <= (~reg55[(1'h1):(1'h0)]);
              reg86 <= (reg78[(1'h1):(1'h1)] ?
                  wire82[(2'h3):(2'h2)] : $signed($unsigned(reg81[(3'h4):(1'h1)])));
              reg87 <= $unsigned($signed(((reg52 ?
                      $signed(reg52) : $signed(wire49)) ?
                  $signed((+reg69)) : reg80)));
            end
          else
            begin
              reg85 <= (reg77[(2'h3):(2'h2)] < ($signed(reg77[(3'h4):(1'h0)]) ?
                  $unsigned(((-reg87) ~^ wire61)) : ((~(wire62 ?
                      reg59 : wire50)) << ((reg85 & reg72) ?
                      wire84[(5'h11):(4'hd)] : (^wire49)))));
              reg86 <= reg60[(1'h0):(1'h0)];
              reg87 <= $signed({($unsigned((7'h42)) ?
                      $signed((reg79 ? (8'hb3) : (8'ha9))) : reg59)});
            end
          if (reg58)
            begin
              reg88 <= $unsigned(reg68);
              reg89 <= (reg55[(1'h0):(1'h0)] ?
                  reg76[(1'h0):(1'h0)] : $signed(($signed($signed(reg64)) ?
                      (((8'hbe) ? (8'ha9) : reg88) ^ (reg71 ?
                          wire51 : reg57)) : $signed((~^reg66)))));
              reg90 <= wire51[(2'h3):(1'h0)];
              reg91 <= $signed($unsigned($signed(((reg66 ?
                  (8'ha7) : reg67) >= (reg52 != wire48)))));
            end
          else
            begin
              reg88 <= $unsigned((+(wire83 ?
                  wire84[(5'h13):(5'h11)] : reg70[(1'h1):(1'h0)])));
              reg89 <= reg66;
              reg90 <= reg52;
            end
          if ($unsigned(((reg87[(1'h0):(1'h0)] - ($signed(reg75) ^~ $signed(wire82))) ?
              {(^~{reg60, wire83}),
                  $signed(reg89)} : $unsigned(((reg90 >= reg67) ?
                  $signed(reg80) : (|reg88))))))
            begin
              reg92 <= reg78[(3'h6):(3'h5)];
              reg93 <= {reg58, $signed($unsigned((&{wire49})))};
              reg94 <= (~&($signed((~|$unsigned(reg88))) ^ {((^(8'ha4)) & $unsigned((8'hb2)))}));
              reg95 <= (reg94[(1'h1):(1'h1)] ?
                  (($unsigned(reg52[(3'h5):(1'h1)]) + {{wire84},
                      $signed(reg52)}) == {wire51,
                      wire51[(2'h2):(1'h0)]}) : $signed(reg64[(1'h1):(1'h1)]));
            end
          else
            begin
              reg92 <= (~$unsigned({($signed((8'h9d)) >> (reg64 & reg78)),
                  (reg72 ? (reg89 ? reg91 : reg53) : reg77)}));
              reg93 <= ($signed($signed(((reg80 || reg63) >>> (wire50 * reg87)))) ?
                  $signed((-((~^reg92) <<< wire62[(2'h2):(1'h1)]))) : wire49[(4'hc):(4'h9)]);
              reg94 <= reg64[(4'h8):(3'h5)];
            end
        end
      reg96 <= $unsigned($signed($unsigned((~{reg71, reg81}))));
      reg97 <= reg77[(3'h4):(3'h4)];
      reg98 <= reg52;
      reg99 <= (wire62[(1'h0):(1'h0)] ?
          {(reg56[(4'hc):(1'h1)] ?
                  $unsigned(reg73) : ($unsigned(reg79) ^~ $signed(reg74))),
              reg74} : ((reg70 ?
              reg53[(3'h7):(2'h3)] : ((~&(8'ha5)) | (reg79 ?
                  (8'h9f) : wire84))) - (($signed(wire47) ?
              (^(8'hbf)) : (reg93 <= (7'h44))) ^ (!{wire82}))));
    end
  assign wire100 = reg71;
  assign wire101 = $signed($unsigned(reg74[(5'h15):(4'h8)]));
  assign wire102 = (8'ha9);
endmodule
