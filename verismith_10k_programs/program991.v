module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h208):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire155;
  wire signed [(5'h15):(1'h0)] wire47;
  wire [(3'h6):(1'h0)] wire46;
  wire [(5'h12):(1'h0)] wire45;
  wire [(4'h8):(1'h0)] wire44;
  wire signed [(5'h13):(1'h0)] wire36;
  wire [(4'h8):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire34;
  wire [(5'h15):(1'h0)] wire33;
  wire signed [(5'h13):(1'h0)] wire32;
  wire [(3'h7):(1'h0)] wire31;
  wire signed [(3'h5):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire5;
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg [(2'h3):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg43 = (1'h0);
  assign y = {wire155,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire26,
                 wire5,
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
                 reg24,
                 reg25,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 (1'h0)};
  assign wire5 = wire3[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg6 <= (~wire2);
      reg7 <= $signed($unsigned($unsigned(($signed(wire4) ?
          (wire4 ? reg6 : wire3) : (-wire3)))));
      if ((~^(~|(&{(wire2 ^ reg6)}))))
        begin
          reg8 <= $unsigned(((+$unsigned((|wire2))) ~^ (wire4 + wire1)));
          reg9 <= wire0[(2'h3):(1'h1)];
          reg10 <= (&$signed($signed((~(reg8 ? reg7 : (8'haf))))));
          reg11 <= {($unsigned((|(wire0 ? (8'ha5) : wire1))) ?
                  (~|reg9[(3'h7):(2'h3)]) : $signed(reg8)),
              $signed($signed((~|(reg7 ? wire3 : reg6))))};
        end
      else
        begin
          if ($signed(reg10))
            begin
              reg8 <= $signed((($signed($signed(wire0)) ?
                  (^~((8'hb0) < wire3)) : $signed((~|wire3))) >>> (reg10[(5'h10):(4'hd)] << $signed(wire0[(3'h5):(1'h0)]))));
              reg9 <= $unsigned((wire1[(3'h6):(2'h3)] >>> {(^(wire1 > reg6)),
                  $unsigned((^wire4))}));
            end
          else
            begin
              reg8 <= ($signed({(reg9 ? reg8 : $unsigned(reg10)), {{reg10}}}) ?
                  {$signed((8'ha4)),
                      {$signed((-reg6))}} : (($unsigned((-(7'h42))) ?
                      reg8[(3'h6):(1'h0)] : $signed(reg8[(5'h12):(5'h12)])) ^~ ({(~&wire2)} && {(wire1 ?
                          (8'h9d) : wire2),
                      (reg7 >>> wire1)})));
              reg9 <= $signed((~(wire2[(4'hf):(2'h3)] ?
                  $signed((wire4 & wire3)) : $signed($unsigned(reg11)))));
              reg10 <= $signed(({wire2} ?
                  $unsigned((!(reg8 <= (8'hbb)))) : reg11[(1'h1):(1'h0)]));
            end
          reg11 <= reg10;
          if ($signed((^(((~^wire4) == wire5[(4'ha):(1'h0)]) || $unsigned(reg11)))))
            begin
              reg12 <= (~&reg7);
            end
          else
            begin
              reg12 <= (8'ha9);
              reg13 <= $unsigned({({(reg7 | reg6), wire2} ?
                      $signed((~|reg7)) : ((reg9 << wire4) <= (wire1 > (8'ha1))))});
              reg14 <= ((~&wire1) ~^ $signed(($unsigned(reg8[(4'h9):(1'h0)]) ?
                  ((reg8 * reg6) & wire1[(3'h4):(2'h2)]) : wire4)));
              reg15 <= (~&(^~wire3));
            end
          if ((&wire2))
            begin
              reg16 <= ($signed(((^~(wire3 ? wire4 : wire4)) ?
                  ({reg14, (8'hb9)} ?
                      reg13 : ((8'hb1) ?
                          (7'h43) : reg13)) : (|reg11[(2'h3):(2'h3)]))) & reg11);
              reg17 <= wire3[(2'h3):(1'h1)];
              reg18 <= (^$signed(reg11[(2'h3):(2'h3)]));
              reg19 <= {{(($unsigned(wire2) & $unsigned(reg8)) == reg7)},
                  ($signed(reg9) ?
                      ($unsigned((!wire5)) ?
                          (wire5[(3'h7):(3'h4)] ?
                              (-wire4) : {reg13}) : wire3) : wire5)};
            end
          else
            begin
              reg16 <= ((|(reg7 & $unsigned($signed(reg7)))) ?
                  $signed(((&(reg6 > reg11)) ?
                      {(reg19 ?
                              reg19 : wire2)} : wire3)) : ($unsigned(reg8[(5'h13):(4'ha)]) ?
                      ($signed((reg14 ?
                          (8'hb9) : (7'h41))) != $unsigned((reg19 - (8'ha6)))) : reg19));
              reg17 <= (-(!wire3[(1'h0):(1'h0)]));
              reg18 <= ((~|reg6[(2'h2):(2'h2)]) ? reg13 : reg16);
              reg19 <= (8'hb1);
            end
        end
      reg20 <= (reg6 >>> (~^$unsigned((~^wire0))));
      if ($signed(reg14[(1'h0):(1'h0)]))
        begin
          reg21 <= $unsigned(wire4[(4'h9):(1'h1)]);
          reg22 <= ({(-{wire4[(2'h2):(1'h1)],
                  wire1[(1'h0):(1'h0)]})} == (-{$unsigned((reg7 ?
                  reg7 : (8'h9f))),
              reg10}));
          reg23 <= {((!(-(~&reg19))) ?
                  reg20[(4'he):(4'hd)] : $unsigned(((^~reg14) <= (reg12 <<< reg15))))};
          reg24 <= $signed(((~^reg11[(1'h1):(1'h0)]) ^~ $unsigned(reg7)));
          reg25 <= (~^$unsigned(reg15[(2'h2):(2'h2)]));
        end
      else
        begin
          reg21 <= reg17;
          reg22 <= wire2[(3'h6):(2'h3)];
          if ($signed(wire2))
            begin
              reg23 <= $unsigned(wire4);
              reg24 <= ($signed($unsigned(reg15)) ?
                  ((~^(reg18 & (~|(7'h42)))) <= reg15[(3'h6):(2'h2)]) : (~^$unsigned({reg15[(3'h4):(2'h2)]})));
            end
          else
            begin
              reg23 <= wire3[(2'h2):(2'h2)];
            end
        end
    end
  assign wire26 = ((+$signed(wire2)) & (-wire5[(4'he):(4'h8)]));
  always
    @(posedge clk) begin
      if (($signed({{(reg15 * reg18), {reg16, wire1}}}) + reg13[(4'hb):(3'h6)]))
        begin
          reg27 <= (~&(reg8[(3'h4):(1'h1)] & reg7));
          reg28 <= reg14[(1'h1):(1'h0)];
        end
      else
        begin
          reg27 <= {($signed($unsigned(reg8[(4'he):(4'ha)])) ?
                  $signed(((reg14 ?
                      reg25 : wire4) | ((8'hbd) >>> reg25))) : (|($unsigned((8'ha6)) ?
                      $unsigned(wire1) : (reg15 ? (8'ha8) : reg25))))};
          reg28 <= $signed((+(7'h40)));
          reg29 <= $signed($signed(reg15[(2'h2):(1'h0)]));
        end
      reg30 <= (~reg8[(4'h8):(4'h8)]);
    end
  assign wire31 = $signed(((reg27 >> (~^$unsigned(reg23))) ?
                      reg14 : $signed(reg29)));
  assign wire32 = reg29;
  assign wire33 = ((reg15 ?
                          ((reg25[(2'h3):(2'h3)] | (8'hb1)) ?
                              (^~reg25) : (-(reg15 && reg8))) : $signed(reg25)) ?
                      {$signed({reg29, (~&(8'ha2))}),
                          reg29[(3'h7):(1'h0)]} : ($signed($unsigned((^reg7))) ?
                          ({(reg24 | reg30),
                              reg11} <<< $unsigned($unsigned(reg21))) : $signed(reg29[(4'ha):(2'h2)])));
  assign wire34 = ($unsigned(reg21[(3'h6):(2'h3)]) * $signed(((((8'hbf) ?
                      wire31 : reg23) << reg12) >>> reg11)));
  assign wire35 = $signed($signed($unsigned($signed(wire2[(4'h8):(1'h0)]))));
  assign wire36 = (~&(reg15[(2'h2):(2'h2)] >= (|reg18[(2'h3):(2'h3)])));
  always
    @(posedge clk) begin
      if (((reg17 ?
              (-$signed((reg13 ? (7'h42) : reg15))) : reg11[(2'h3):(2'h3)]) ?
          (reg30 ?
              (^((8'ha0) ?
                  (^~wire33) : reg7)) : reg18) : $unsigned(wire32[(4'hd):(3'h5)])))
        begin
          reg37 <= reg24[(2'h3):(1'h0)];
          reg38 <= $signed($unsigned({({(8'ha6)} ?
                  (wire35 ? (8'hb0) : reg21) : (-reg9)),
              $unsigned((~wire26))}));
          reg39 <= wire36;
        end
      else
        begin
          reg37 <= reg8[(4'hd):(3'h5)];
          if ((~&reg8))
            begin
              reg38 <= (^~$signed((&$unsigned((wire31 ? reg21 : reg28)))));
            end
          else
            begin
              reg38 <= $signed(((reg29[(4'hd):(1'h0)] ?
                      wire0 : ((reg13 ? wire33 : wire36) ?
                          $signed(reg17) : wire36[(4'h9):(3'h6)])) ?
                  (~&$unsigned(((8'hab) ?
                      wire31 : reg22))) : (wire0 || ((~reg21) - {wire33,
                      wire35}))));
            end
          reg39 <= $unsigned((8'hb2));
          reg40 <= reg21[(4'hf):(4'hb)];
        end
      reg41 <= $unsigned((~^$unsigned(($signed(wire2) ?
          $signed(reg9) : reg25[(3'h4):(3'h4)]))));
      reg42 <= (+(reg39[(3'h7):(3'h4)] ?
          (($unsigned(wire4) >>> {reg17, reg27}) & ((wire0 ?
              reg40 : reg29) == (reg28 >>> reg38))) : $unsigned(reg30)));
      reg43 <= reg22;
    end
  assign wire44 = ($signed($signed($signed({(8'haf), reg8}))) ?
                      reg41[(3'h5):(3'h5)] : (^($unsigned(((7'h44) ?
                              reg14 : wire2)) ?
                          ((-reg21) ?
                              reg18 : (wire2 * (7'h44))) : $unsigned((reg22 ?
                              reg39 : wire5)))));
  assign wire45 = (~(reg8[(4'h9):(1'h0)] ?
                      (!$unsigned((|reg14))) : (+wire0[(2'h2):(2'h2)])));
  assign wire46 = $unsigned({(~|(&{wire36})),
                      $unsigned((~(wire0 ? reg37 : wire0)))});
  assign wire47 = wire32[(4'h9):(2'h2)];
  module48 #() modinst156 (wire155, clk, wire26, wire47, reg17, reg38, reg6);
endmodule

module module48
#(parameter param153 = ((&(((!(8'haf)) ? ((8'ha0) ? (8'h9f) : (8'hb8)) : ((8'hb8) ? (8'h9e) : (8'ha1))) ? (((8'hb8) ~^ (8'had)) ^~ (~|(8'hba))) : (|{(8'hb1), (8'h9f)}))) * ((|(^{(8'hb6), (7'h43)})) < (~|((&(8'ha9)) < ((8'hac) < (8'hb2)))))), 
parameter param154 = (8'hae))
(y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire53;
  input wire signed [(5'h15):(1'h0)] wire52;
  input wire [(5'h11):(1'h0)] wire51;
  input wire [(3'h7):(1'h0)] wire50;
  input wire [(4'hf):(1'h0)] wire49;
  wire signed [(4'hc):(1'h0)] wire151;
  wire signed [(4'ha):(1'h0)] wire107;
  wire signed [(2'h2):(1'h0)] wire106;
  wire [(2'h2):(1'h0)] wire104;
  wire signed [(4'hf):(1'h0)] wire103;
  wire signed [(4'h8):(1'h0)] wire102;
  wire signed [(3'h7):(1'h0)] wire101;
  wire signed [(4'hc):(1'h0)] wire99;
  wire signed [(5'h15):(1'h0)] wire54;
  reg signed [(2'h3):(1'h0)] reg105 = (1'h0);
  assign y = {wire151,
                 wire107,
                 wire106,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire99,
                 wire54,
                 reg105,
                 (1'h0)};
  assign wire54 = (wire49[(2'h2):(2'h2)] + (|($unsigned((&wire49)) <<< wire53)));
  module55 #() modinst100 (wire99, clk, wire49, wire50, wire52, wire54);
  assign wire101 = {$signed(wire54[(5'h14):(4'h8)]), wire49[(3'h7):(3'h7)]};
  assign wire102 = $signed(((~&((wire53 <<< wire54) ?
                       $unsigned(wire101) : (wire52 || wire49))) && $signed(wire51[(2'h3):(1'h1)])));
  assign wire103 = (!($signed(($unsigned(wire49) > {wire102, wire50})) ?
                       wire50[(3'h6):(2'h2)] : ((wire54[(4'hd):(4'h9)] ?
                           (wire99 ? (8'ha2) : wire51) : wire101) >>> wire52)));
  assign wire104 = {$signed(wire49[(4'ha):(3'h7)]), $unsigned((8'ha3))};
  always
    @(posedge clk) begin
      reg105 <= (+wire104[(1'h0):(1'h0)]);
    end
  assign wire106 = wire103[(3'h7):(3'h6)];
  assign wire107 = wire99;
  module108 #() modinst152 (.wire112(wire103), .wire109(wire102), .y(wire151), .wire111(wire51), .clk(clk), .wire110(wire49));
endmodule

module module108
#(parameter param149 = (^((((+(8'hb0)) ? ((8'hb0) - (8'hb5)) : {(8'hba)}) ? ({(8'ha7)} >> ((7'h44) ? (8'hb8) : (8'hbf))) : ((7'h43) || (^~(8'hbc)))) ~^ ({((8'hb1) & (7'h40)), ((8'hb7) ^ (8'ha2))} ? {((8'h9e) << (8'ha9))} : (|(^~(8'hbe)))))), 
parameter param150 = (~^param149))
(y, clk, wire112, wire111, wire110, wire109);
  output wire [(32'h16d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire112;
  input wire [(5'h11):(1'h0)] wire111;
  input wire [(2'h3):(1'h0)] wire110;
  input wire signed [(4'h8):(1'h0)] wire109;
  wire signed [(4'hb):(1'h0)] wire148;
  wire [(4'ha):(1'h0)] wire147;
  wire signed [(3'h7):(1'h0)] wire146;
  wire [(3'h6):(1'h0)] wire145;
  wire signed [(4'he):(1'h0)] wire144;
  wire signed [(2'h3):(1'h0)] wire143;
  wire [(3'h4):(1'h0)] wire142;
  wire signed [(2'h3):(1'h0)] wire141;
  wire signed [(4'hc):(1'h0)] wire140;
  wire [(3'h7):(1'h0)] wire139;
  wire signed [(4'he):(1'h0)] wire138;
  wire [(4'ha):(1'h0)] wire135;
  wire signed [(4'he):(1'h0)] wire118;
  wire [(5'h15):(1'h0)] wire117;
  wire [(4'h8):(1'h0)] wire116;
  wire signed [(2'h3):(1'h0)] wire115;
  wire signed [(5'h13):(1'h0)] wire114;
  wire [(4'he):(1'h0)] wire113;
  reg signed [(4'h9):(1'h0)] reg137 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg136 = (1'h0);
  reg [(5'h12):(1'h0)] reg134 = (1'h0);
  reg [(3'h6):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg130 = (1'h0);
  reg [(4'hb):(1'h0)] reg129 = (1'h0);
  reg [(3'h6):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg127 = (1'h0);
  reg [(5'h12):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg124 = (1'h0);
  reg [(3'h5):(1'h0)] reg123 = (1'h0);
  reg [(4'ha):(1'h0)] reg122 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg120 = (1'h0);
  reg [(4'ha):(1'h0)] reg119 = (1'h0);
  assign y = {wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire135,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 reg137,
                 reg136,
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
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 (1'h0)};
  assign wire113 = (~|(-(wire112[(4'h8):(2'h3)] != wire110[(1'h1):(1'h1)])));
  assign wire114 = {$signed(wire113[(2'h2):(2'h2)]),
                       $signed($unsigned($unsigned($unsigned(wire113))))};
  assign wire115 = (wire114[(1'h0):(1'h0)] ?
                       wire112 : $signed((wire114 <= (((7'h42) | wire113) > (wire114 ?
                           wire111 : (7'h43))))));
  assign wire116 = (wire109 == ({((~&wire112) ?
                               (wire109 <<< wire113) : $signed(wire111)),
                           $unsigned($signed(wire111))} ?
                       ($unsigned(wire113) ?
                           (~&$unsigned(wire109)) : ($signed(wire115) & $signed(wire109))) : (wire113 ?
                           wire109[(3'h4):(2'h3)] : (((8'haf) ?
                                   wire111 : wire114) ?
                               wire113[(3'h6):(1'h1)] : $signed(wire109)))));
  assign wire117 = ((wire109 <<< wire114[(3'h6):(3'h6)]) > wire116[(3'h5):(2'h2)]);
  assign wire118 = (wire113 ?
                       $signed($signed((wire109[(2'h3):(2'h3)] ^ $unsigned((8'h9f))))) : wire111[(4'hc):(3'h4)]);
  always
    @(posedge clk) begin
      reg119 <= {wire110[(1'h1):(1'h1)],
          ((-{(wire115 ? wire116 : wire110),
              $signed(wire111)}) << $unsigned($signed(wire117[(4'hf):(1'h1)])))};
      reg120 <= $unsigned((wire111 || (wire109 ?
          wire117[(1'h0):(1'h0)] : wire111)));
      if ((^~$signed((&(~$unsigned(reg120))))))
        begin
          if (wire116)
            begin
              reg121 <= wire118[(4'ha):(4'h8)];
              reg122 <= reg121;
              reg123 <= (&(({$signed(reg119), wire112[(4'h9):(3'h6)]} ?
                      wire113[(3'h4):(2'h2)] : (~|$unsigned(reg121))) ?
                  (8'hbf) : (((wire109 ?
                      wire118 : wire117) <= reg122) >> $unsigned((wire113 >> wire112)))));
              reg124 <= wire113;
              reg125 <= wire116;
            end
          else
            begin
              reg121 <= (wire112[(3'h6):(3'h5)] - {({$signed(wire110)} << $signed({wire113,
                      wire117}))});
            end
          reg126 <= reg119;
          reg127 <= reg123[(2'h3):(2'h2)];
          if ((($signed({wire114[(4'hc):(4'ha)], reg127[(3'h4):(2'h2)]}) ?
              $unsigned(reg119) : ($unsigned(reg125) != $signed($unsigned(wire113)))) + (^reg121[(3'h4):(2'h2)])))
            begin
              reg128 <= (reg126[(3'h6):(1'h0)] << wire117[(5'h13):(1'h1)]);
              reg129 <= (((8'hbb) ^ (&wire117[(4'hc):(2'h2)])) > reg128[(3'h4):(1'h1)]);
              reg130 <= $unsigned((^reg129));
              reg131 <= (8'hb5);
            end
          else
            begin
              reg128 <= ((^~($signed(reg129[(4'h8):(2'h3)]) ?
                  (+(reg130 ? wire112 : wire110)) : $signed(((8'hbc) ?
                      reg124 : (8'hbe))))) & (+$signed({(wire116 ?
                      (8'h9f) : wire109),
                  {reg126}})));
              reg129 <= {(-$signed((^~(~|wire117)))), reg120[(3'h4):(1'h1)]};
              reg130 <= $signed((!$unsigned(reg128[(2'h3):(2'h3)])));
              reg131 <= (8'ha1);
              reg132 <= reg126[(2'h3):(1'h0)];
            end
        end
      else
        begin
          reg121 <= $signed($signed({$signed($signed(reg128)),
              wire113[(4'ha):(3'h6)]}));
        end
      reg133 <= $signed((^reg124[(3'h5):(2'h3)]));
      reg134 <= (wire112 ?
          ($unsigned((reg130 ?
                  ((8'h9f) && reg128) : (wire115 ? wire113 : reg124))) ?
              $unsigned($unsigned($signed(reg131))) : reg128) : ({$signed($signed(reg131))} ?
              (($unsigned((8'hb1)) ? (|reg122) : (wire110 ? reg126 : reg133)) ?
                  (+reg133) : ((^reg122) <<< ((8'hb2) ?
                      wire109 : wire118))) : $signed((7'h44))));
    end
  assign wire135 = ((|(-($signed(reg128) & (wire110 > reg122)))) >= (^(reg120[(3'h6):(3'h6)] * reg120)));
  always
    @(posedge clk) begin
      reg136 <= $signed((^{wire116[(3'h6):(3'h4)],
          ((8'h9e) ? $unsigned(reg123) : wire135[(4'h8):(2'h2)])}));
      reg137 <= reg130;
    end
  assign wire138 = (&(7'h44));
  assign wire139 = (((~&reg126) >> (~^$signed($signed(reg130)))) >= ((-(|reg136[(3'h6):(2'h2)])) != (wire117[(4'h8):(2'h3)] ?
                       {reg136[(3'h7):(1'h1)]} : ((^reg125) ?
                           wire114[(5'h12):(4'h9)] : (reg136 < reg130)))));
  assign wire140 = reg134;
  assign wire141 = $signed($signed(wire139[(3'h5):(3'h4)]));
  assign wire142 = (reg124[(3'h5):(2'h2)] ?
                       (reg128 & wire112) : $unsigned($signed((!(~wire109)))));
  assign wire143 = (^~$signed(($signed(wire112) | ($unsigned(wire142) ?
                       wire141 : wire138[(4'hd):(1'h0)]))));
  assign wire144 = ((~&wire114[(3'h4):(1'h0)]) || $signed($unsigned(reg133)));
  assign wire145 = reg131[(3'h4):(1'h1)];
  assign wire146 = $unsigned(((reg132[(4'h8):(3'h6)] ?
                       wire109 : $unsigned({wire145})) >= ((reg131 ?
                           (!wire114) : (reg120 != wire143)) ?
                       wire140 : ((reg124 >= reg131) <= wire138))));
  assign wire147 = ($signed($unsigned(($signed(wire139) ?
                           (~&wire135) : wire141[(1'h1):(1'h1)]))) ?
                       (wire115[(2'h3):(1'h1)] ?
                           wire110[(2'h3):(2'h2)] : ((^(^~wire142)) && ({reg119,
                                   (8'hb0)} ?
                               (wire135 ^~ wire109) : (reg123 + (8'hbe))))) : $signed($unsigned(reg121)));
  assign wire148 = wire147[(1'h1):(1'h1)];
endmodule

module module55  (y, clk, wire59, wire58, wire57, wire56);
  output wire [(32'h184):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire59;
  input wire [(3'h6):(1'h0)] wire58;
  input wire [(5'h15):(1'h0)] wire57;
  input wire signed [(5'h11):(1'h0)] wire56;
  wire signed [(3'h6):(1'h0)] wire98;
  wire signed [(3'h4):(1'h0)] wire97;
  wire [(5'h12):(1'h0)] wire96;
  wire [(4'hd):(1'h0)] wire95;
  wire signed [(4'h9):(1'h0)] wire94;
  wire [(4'h9):(1'h0)] wire93;
  wire signed [(4'hd):(1'h0)] wire92;
  wire signed [(5'h12):(1'h0)] wire91;
  wire signed [(3'h7):(1'h0)] wire90;
  wire [(5'h14):(1'h0)] wire89;
  wire [(2'h2):(1'h0)] wire88;
  wire [(3'h6):(1'h0)] wire87;
  wire [(4'h8):(1'h0)] wire86;
  wire [(4'hb):(1'h0)] wire85;
  wire [(4'hc):(1'h0)] wire84;
  wire [(4'hd):(1'h0)] wire83;
  wire [(4'hb):(1'h0)] wire78;
  wire signed [(3'h6):(1'h0)] wire77;
  wire [(4'hd):(1'h0)] wire76;
  wire signed [(4'hc):(1'h0)] wire60;
  reg [(3'h7):(1'h0)] reg82 = (1'h0);
  reg [(5'h14):(1'h0)] reg81 = (1'h0);
  reg [(4'he):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg79 = (1'h0);
  reg [(5'h12):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg74 = (1'h0);
  reg [(4'h8):(1'h0)] reg73 = (1'h0);
  reg [(4'hd):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg71 = (1'h0);
  reg [(4'hf):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg69 = (1'h0);
  reg [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg66 = (1'h0);
  reg [(5'h10):(1'h0)] reg65 = (1'h0);
  reg [(2'h3):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg [(2'h2):(1'h0)] reg62 = (1'h0);
  reg [(4'h9):(1'h0)] reg61 = (1'h0);
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
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire78,
                 wire77,
                 wire76,
                 wire60,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
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
                 reg62,
                 reg61,
                 (1'h0)};
  assign wire60 = ((8'hb6) && (|wire58));
  always
    @(posedge clk) begin
      reg61 <= $unsigned($signed({wire58[(3'h4):(1'h1)]}));
      reg62 <= $signed((!wire57));
      if (wire56[(4'h8):(3'h7)])
        begin
          reg63 <= ($signed(reg61[(3'h5):(3'h5)]) ?
              wire60[(3'h7):(3'h6)] : $unsigned(wire58[(1'h1):(1'h0)]));
          reg64 <= $unsigned(($signed(((wire60 && wire60) || (^wire57))) ^~ $signed(wire60[(4'hc):(3'h4)])));
          if ((&$signed(((wire57[(1'h0):(1'h0)] ?
                  $unsigned(reg62) : $signed(wire58)) ?
              $signed((reg61 || reg61)) : wire58[(2'h3):(1'h1)]))))
            begin
              reg65 <= ($unsigned({$signed((reg62 != reg63))}) << ((reg64[(1'h0):(1'h0)] ^~ (wire57 ?
                  wire60 : wire59[(4'hb):(2'h3)])) <= wire56[(3'h6):(3'h4)]));
              reg66 <= $unsigned($signed($unsigned($signed($unsigned(wire60)))));
              reg67 <= ($signed(($unsigned((reg66 ? wire58 : reg63)) ?
                  $unsigned(((8'ha4) | reg63)) : reg61[(1'h1):(1'h0)])) ~^ ($signed(($unsigned(reg65) ?
                  wire58[(3'h4):(1'h0)] : reg65)) || ($signed(wire56[(4'hf):(4'hc)]) ?
                  reg64 : $signed(wire60[(4'hb):(4'h9)]))));
              reg68 <= ($signed(reg62[(2'h2):(1'h1)]) ? wire57 : (^wire56));
              reg69 <= reg67;
            end
          else
            begin
              reg65 <= $unsigned((8'ha9));
              reg66 <= $unsigned(((~&($signed(wire57) ?
                  wire59 : (wire59 ? wire59 : (8'hae)))) && {((reg64 ?
                      wire56 : wire56) & (^~reg67)),
                  ((wire60 ? wire60 : wire59) <<< (!reg62))}));
            end
          reg70 <= $unsigned(wire58);
          if ((|(~^reg68[(2'h2):(1'h1)])))
            begin
              reg71 <= $signed(($unsigned(reg69) > (8'hb5)));
              reg72 <= $unsigned($unsigned((8'hb3)));
              reg73 <= (~&reg65[(4'hc):(2'h2)]);
              reg74 <= $signed((^~reg71));
            end
          else
            begin
              reg71 <= $unsigned((&$unsigned($unsigned(reg67[(3'h5):(2'h3)]))));
              reg72 <= reg72[(2'h2):(1'h1)];
              reg73 <= $signed($signed(reg63[(4'ha):(3'h6)]));
              reg74 <= (reg73 ?
                  $unsigned((-reg63)) : (reg72[(1'h0):(1'h0)] ?
                      (wire59 ? reg61 : (~^reg70)) : {reg72[(1'h1):(1'h0)],
                          ($signed(reg62) != reg71)}));
              reg75 <= {wire57[(3'h5):(2'h2)]};
            end
        end
      else
        begin
          reg63 <= reg64;
          reg64 <= {$unsigned(((-wire57) ?
                  ({wire57} ?
                      $signed((8'had)) : $signed(wire57)) : wire57[(3'h4):(2'h3)]))};
          reg65 <= $signed(wire60);
          reg66 <= (!((!(8'hb6)) <<< $unsigned(($signed((8'haa)) >= (reg63 * wire59)))));
        end
    end
  assign wire76 = (wire59[(4'hc):(3'h7)] >= $signed(reg67));
  assign wire77 = ($signed(reg75[(4'hc):(1'h0)]) | reg69);
  assign wire78 = {(~^$signed((-$unsigned((8'hba)))))};
  always
    @(posedge clk) begin
      reg79 <= wire78[(2'h2):(1'h1)];
      reg80 <= $unsigned($unsigned(reg69));
      reg81 <= $signed(({$unsigned((!(8'ha9)))} ?
          wire76 : (!$unsigned((reg70 * reg61)))));
      reg82 <= (reg74[(1'h0):(1'h0)] ?
          (($signed((~&reg68)) ?
              (-$signed(reg68)) : (!(reg68 ?
                  reg66 : reg61))) * $unsigned(($signed(reg64) > wire58[(1'h0):(1'h0)]))) : reg71[(4'h8):(4'h8)]);
    end
  assign wire83 = $unsigned($unsigned($unsigned((|(wire57 && reg61)))));
  assign wire84 = $signed(((~(~&wire59[(1'h0):(1'h0)])) != (((^~wire58) >= reg63[(4'hb):(1'h0)]) ~^ reg80[(3'h6):(3'h5)])));
  assign wire85 = reg67;
  assign wire86 = ({reg69,
                      $unsigned((^~(reg71 ?
                          wire78 : (7'h41))))} ^ (wire83 > (((-(8'haf)) ?
                      $signed(reg81) : $signed(wire76)) ^~ reg73[(3'h5):(3'h4)])));
  assign wire87 = reg72;
  assign wire88 = (~|$unsigned($unsigned(reg70[(1'h1):(1'h0)])));
  assign wire89 = reg80;
  assign wire90 = wire60;
  assign wire91 = $unsigned(reg71[(3'h7):(2'h2)]);
  assign wire92 = $unsigned($unsigned(reg68[(1'h1):(1'h0)]));
  assign wire93 = reg69;
  assign wire94 = $unsigned($signed(reg61));
  assign wire95 = wire56;
  assign wire96 = (+((wire89 >= (wire94[(3'h5):(3'h4)] != (reg61 ?
                          reg65 : wire89))) ?
                      (-((!wire85) < (wire78 ?
                          reg66 : wire56))) : $signed({wire85[(1'h0):(1'h0)],
                          (~&wire92)})));
  assign wire97 = ($unsigned((-(~^$unsigned(reg61)))) * (($signed((wire83 != wire84)) ?
                          (8'hb0) : $unsigned(wire88[(1'h1):(1'h0)])) ?
                      wire88 : (8'hb1)));
  assign wire98 = wire84[(2'h2):(1'h0)];
endmodule
