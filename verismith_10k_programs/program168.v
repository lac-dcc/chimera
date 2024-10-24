module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h12f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire0;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire164;
  wire signed [(3'h4):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire162;
  reg signed [(5'h15):(1'h0)] reg6 = (1'h0);
  reg [(3'h4):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(4'ha):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  assign y = {wire164,
                 wire5,
                 wire162,
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
                 reg26,
                 (1'h0)};
  assign wire5 = wire3[(4'h9):(3'h7)];
  always
    @(posedge clk) begin
      if ({wire1, wire4})
        begin
          reg6 <= ((~|(^$unsigned($unsigned(wire2)))) ?
              wire0[(3'h4):(2'h2)] : wire1);
          if ($signed(reg6[(3'h5):(1'h1)]))
            begin
              reg7 <= $signed($signed(wire0[(3'h4):(1'h1)]));
              reg8 <= $unsigned((wire4[(3'h5):(1'h0)] ?
                  $unsigned((wire2[(1'h1):(1'h1)] + (|(8'ha6)))) : $signed(((reg6 ?
                      (8'hab) : wire4) && wire3))));
            end
          else
            begin
              reg7 <= $unsigned(($signed((8'h9f)) ?
                  ({wire2[(1'h0):(1'h0)], reg6} ?
                      (^~wire5) : ($unsigned((8'hb5)) ^~ {wire4})) : (({wire4,
                          reg6} ?
                      $signed(wire0) : reg7[(2'h2):(1'h0)]) <= ((reg7 ?
                      wire1 : (8'ha0)) > (~&reg6)))));
            end
          reg9 <= (^~wire0[(2'h2):(1'h0)]);
        end
      else
        begin
          reg6 <= reg7[(1'h0):(1'h0)];
          reg7 <= (reg8 ?
              ($signed(($signed(reg8) - (8'hb0))) - (reg9[(4'h9):(2'h2)] || ((8'hbc) >>> reg7))) : (wire0[(3'h5):(3'h5)] ^~ $unsigned(reg7[(1'h1):(1'h0)])));
          reg8 <= (wire3 ?
              (&$signed(($unsigned(wire5) ?
                  $unsigned(wire0) : wire0[(3'h7):(3'h7)]))) : wire5[(1'h0):(1'h0)]);
          reg9 <= $signed((({(^wire3)} ?
                  $unsigned(reg8[(5'h13):(5'h11)]) : ((8'hac) ?
                      $signed(reg7) : wire4[(4'hf):(4'hb)])) ?
              $signed((~wire1)) : {(wire0 ?
                      (8'hba) : ((8'hb0) ? (7'h42) : wire5)),
                  (8'ha5)}));
          reg10 <= reg7[(2'h2):(2'h2)];
        end
    end
  always
    @(posedge clk) begin
      reg11 <= (reg6 >> ((wire3 ^~ reg7[(2'h2):(1'h1)]) ?
          (((wire5 ?
              wire5 : reg10) << reg7[(1'h1):(1'h1)]) + (&{wire5})) : (wire2[(1'h1):(1'h1)] ?
              $unsigned((wire1 ? wire0 : wire2)) : reg8)));
      if ($unsigned($signed((^~$signed($unsigned(wire3))))))
        begin
          reg12 <= reg6[(3'h5):(2'h2)];
          if ((~&(-reg7)))
            begin
              reg13 <= $unsigned(wire2);
              reg14 <= $unsigned($signed(($unsigned($signed(reg11)) ?
                  reg6[(3'h4):(3'h4)] : (~&$unsigned(reg7)))));
              reg15 <= wire4[(1'h1):(1'h0)];
            end
          else
            begin
              reg13 <= (wire2 ?
                  (!(~|($unsigned(reg11) ~^ (-(8'ha4))))) : reg13);
              reg14 <= $signed($unsigned({(8'hbd)}));
              reg15 <= (^(~|reg8));
              reg16 <= (~^$signed((({reg10} ?
                  (reg13 & wire3) : $unsigned(reg14)) < $unsigned((-wire0)))));
            end
          if (wire5[(2'h3):(1'h1)])
            begin
              reg17 <= $signed(reg10);
              reg18 <= $unsigned($unsigned($signed(reg7[(1'h0):(1'h0)])));
            end
          else
            begin
              reg17 <= reg6;
              reg18 <= ({(reg8 ?
                          (reg13 >> ((8'had) ?
                              wire0 : reg14)) : wire5[(2'h3):(2'h2)])} ?
                  $signed((&$unsigned(reg18[(2'h3):(1'h0)]))) : $unsigned((($signed(wire3) ?
                      (wire1 ?
                          reg12 : wire2) : reg6[(1'h0):(1'h0)]) >> (&$signed((8'hb2))))));
              reg19 <= (-($signed((wire4[(4'h9):(3'h7)] ^ ((8'haf) ?
                      reg8 : reg18))) ?
                  (&$signed($unsigned(reg18))) : ((|(reg7 ? reg16 : reg6)) ?
                      reg12[(3'h7):(2'h2)] : (!$signed(reg9)))));
            end
        end
      else
        begin
          if (reg18[(1'h0):(1'h0)])
            begin
              reg12 <= ((-($signed(reg11) ? wire1 : (-wire1))) != reg7);
              reg13 <= ($signed($unsigned(((8'hb4) ?
                      {wire4, (8'h9f)} : wire4))) ?
                  $unsigned($unsigned($unsigned($signed(reg14)))) : $unsigned($signed(reg16[(2'h2):(2'h2)])));
            end
          else
            begin
              reg12 <= ((+wire3[(5'h11):(3'h4)]) ?
                  (~&(wire3[(4'hf):(4'h9)] != $signed($signed(reg13)))) : (wire2 && ((wire2[(2'h2):(2'h2)] == reg7) ^~ ((wire5 ?
                      wire4 : reg10) ^ reg10[(2'h3):(2'h2)]))));
              reg13 <= (((7'h40) | ({wire4,
                  (wire0 ?
                      reg13 : reg9)} * reg9[(4'ha):(3'h4)])) ~^ $unsigned((~&((wire2 ^~ reg8) | $unsigned(wire5)))));
              reg14 <= ($signed({(reg14[(3'h5):(1'h1)] * wire0),
                      $unsigned($unsigned(reg17))}) ?
                  reg8[(4'hb):(3'h5)] : reg12);
              reg15 <= $signed($signed(reg6[(1'h1):(1'h0)]));
              reg16 <= (8'had);
            end
          if ((^~(~(^{(reg8 ? reg19 : reg14), wire1}))))
            begin
              reg17 <= $unsigned(reg6);
              reg18 <= $unsigned($unsigned(wire2[(2'h2):(1'h1)]));
              reg19 <= $unsigned($unsigned(reg17));
              reg20 <= (reg14 << $unsigned($signed(reg10[(3'h4):(1'h0)])));
              reg21 <= reg14[(4'h8):(1'h1)];
            end
          else
            begin
              reg17 <= wire3[(5'h13):(1'h0)];
              reg18 <= reg17[(4'hc):(1'h1)];
              reg19 <= {wire5};
              reg20 <= (^$unsigned(((((7'h41) >> wire2) + {(8'hbe), reg19}) ?
                  wire2[(2'h2):(2'h2)] : (|$unsigned(reg6)))));
            end
          reg22 <= (wire3 || ((^~reg16[(1'h1):(1'h0)]) < ($unsigned(wire0) > reg9[(3'h7):(2'h2)])));
          reg23 <= $signed(reg7[(1'h1):(1'h0)]);
        end
      if (reg6[(3'h5):(3'h4)])
        begin
          reg24 <= reg11[(1'h0):(1'h0)];
        end
      else
        begin
          reg24 <= $signed(($unsigned(((reg7 ? reg8 : reg12) ?
                  reg16[(3'h4):(1'h1)] : wire5[(1'h1):(1'h1)])) ?
              wire0[(1'h1):(1'h1)] : ({reg9} ?
                  ($unsigned(wire3) <<< $unsigned(reg13)) : {(-reg9)})));
        end
      reg25 <= reg13[(2'h3):(2'h3)];
      reg26 <= (($unsigned(reg10) >= $signed(((reg8 - reg18) ?
          (~reg11) : wire1))) < reg17);
    end
  module27 #() modinst163 (.wire29(reg7), .wire28(wire2), .wire30(reg6), .wire31(reg17), .clk(clk), .y(wire162));
  assign wire164 = ((8'hbc) ? reg9 : $unsigned($signed({$signed(wire1)})));
endmodule

module module27  (y, clk, wire28, wire29, wire30, wire31);
  output wire [(32'h10c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire28;
  input wire signed [(3'h4):(1'h0)] wire29;
  input wire [(5'h15):(1'h0)] wire30;
  input wire signed [(5'h14):(1'h0)] wire31;
  wire [(4'h9):(1'h0)] wire161;
  wire signed [(4'h8):(1'h0)] wire160;
  wire [(4'hd):(1'h0)] wire159;
  wire [(5'h11):(1'h0)] wire149;
  wire signed [(5'h13):(1'h0)] wire77;
  wire [(2'h3):(1'h0)] wire76;
  wire [(4'hd):(1'h0)] wire75;
  wire signed [(3'h7):(1'h0)] wire74;
  wire [(5'h12):(1'h0)] wire73;
  wire [(5'h11):(1'h0)] wire72;
  wire [(4'hb):(1'h0)] wire71;
  wire signed [(5'h10):(1'h0)] wire32;
  wire [(4'hf):(1'h0)] wire69;
  reg signed [(4'hf):(1'h0)] reg158 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg157 = (1'h0);
  reg [(5'h11):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg155 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg153 = (1'h0);
  reg [(4'hf):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg151 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire149,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire32,
                 wire69,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 (1'h0)};
  assign wire32 = (-(wire31 || wire29));
  module33 #() modinst70 (wire69, clk, wire31, wire32, wire30, wire29, wire28);
  assign wire71 = (wire32 ? $unsigned({$signed({wire69, wire29})}) : wire69);
  assign wire72 = $signed($unsigned(wire31[(1'h0):(1'h0)]));
  assign wire73 = $signed($unsigned(($signed(wire71[(1'h0):(1'h0)]) ?
                      ((wire71 ? wire71 : wire29) ?
                          (8'hb1) : wire32) : wire72)));
  assign wire74 = (wire72[(2'h2):(2'h2)] >>> wire31[(1'h1):(1'h0)]);
  assign wire75 = $signed($signed(wire72));
  assign wire76 = (($signed($unsigned((!wire29))) ~^ $unsigned(wire71)) | wire75[(4'hb):(4'hb)]);
  assign wire77 = wire29;
  module78 #() modinst150 (.clk(clk), .y(wire149), .wire80(wire32), .wire82(wire31), .wire81(wire29), .wire79(wire28));
  always
    @(posedge clk) begin
      if ($unsigned((~^$unsigned(wire149))))
        begin
          reg151 <= wire74[(3'h6):(2'h3)];
        end
      else
        begin
          reg151 <= (!$unsigned(($unsigned((^reg151)) & ($signed((8'ha4)) >>> (wire76 ?
              wire73 : wire72)))));
          reg152 <= wire30[(2'h2):(1'h1)];
          if ($signed((8'h9d)))
            begin
              reg153 <= wire28[(1'h0):(1'h0)];
            end
          else
            begin
              reg153 <= $unsigned((wire28[(1'h0):(1'h0)] ?
                  (-$signed({wire73})) : wire69));
              reg154 <= ({wire32[(4'he):(2'h3)],
                  wire32[(3'h4):(1'h1)]} <<< (|(($unsigned(wire31) ?
                  (reg153 || wire77) : wire32[(4'he):(4'h8)]) ^ $unsigned(wire31[(3'h5):(2'h3)]))));
            end
          reg155 <= $unsigned({(wire31[(4'h8):(4'h8)] ?
                  $unsigned((wire30 >> wire28)) : {reg153[(4'h8):(3'h4)],
                      wire149[(3'h5):(1'h1)]}),
              $unsigned(((reg153 ? wire69 : wire76) ?
                  (8'ha0) : wire72[(4'h8):(2'h2)]))});
        end
      reg156 <= ($signed((~^($signed((8'hb9)) ?
              $unsigned((8'ha3)) : (wire71 ? reg152 : wire69)))) ?
          (&$unsigned($unsigned($signed(wire72)))) : $unsigned(reg151[(4'hb):(1'h0)]));
      reg157 <= ($unsigned(($unsigned((wire30 ?
          wire75 : wire29)) ^ reg156[(4'ha):(1'h0)])) && $unsigned((reg155 ?
          (wire76[(2'h2):(1'h0)] ?
              $signed(reg151) : (8'ha6)) : wire76[(1'h0):(1'h0)])));
      reg158 <= (8'ha0);
    end
  assign wire159 = $unsigned(reg153[(4'hc):(4'hc)]);
  assign wire160 = wire74;
  assign wire161 = wire77;
endmodule

module module78  (y, clk, wire82, wire81, wire80, wire79);
  output wire [(32'h27c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire82;
  input wire [(2'h2):(1'h0)] wire81;
  input wire [(3'h4):(1'h0)] wire80;
  input wire [(3'h4):(1'h0)] wire79;
  wire [(4'h9):(1'h0)] wire148;
  wire [(4'h9):(1'h0)] wire147;
  wire [(2'h2):(1'h0)] wire146;
  wire signed [(3'h6):(1'h0)] wire145;
  wire [(5'h13):(1'h0)] wire144;
  wire signed [(4'hd):(1'h0)] wire143;
  wire [(4'hf):(1'h0)] wire142;
  wire signed [(4'hc):(1'h0)] wire119;
  wire signed [(3'h4):(1'h0)] wire114;
  wire [(5'h15):(1'h0)] wire113;
  wire [(4'ha):(1'h0)] wire104;
  wire signed [(3'h4):(1'h0)] wire103;
  wire [(2'h3):(1'h0)] wire102;
  reg signed [(4'hb):(1'h0)] reg141 = (1'h0);
  reg [(5'h10):(1'h0)] reg140 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg139 = (1'h0);
  reg [(4'h9):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg135 = (1'h0);
  reg [(4'h8):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg133 = (1'h0);
  reg [(5'h10):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg131 = (1'h0);
  reg [(2'h3):(1'h0)] reg130 = (1'h0);
  reg signed [(4'he):(1'h0)] reg129 = (1'h0);
  reg [(4'hd):(1'h0)] reg128 = (1'h0);
  reg [(2'h2):(1'h0)] reg127 = (1'h0);
  reg [(4'hf):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg125 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg121 = (1'h0);
  reg signed [(4'he):(1'h0)] reg120 = (1'h0);
  reg [(4'h8):(1'h0)] reg118 = (1'h0);
  reg [(4'h9):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg116 = (1'h0);
  reg [(4'hc):(1'h0)] reg115 = (1'h0);
  reg [(4'hb):(1'h0)] reg112 = (1'h0);
  reg [(4'ha):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg110 = (1'h0);
  reg [(5'h12):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg108 = (1'h0);
  reg [(2'h2):(1'h0)] reg107 = (1'h0);
  reg [(3'h4):(1'h0)] reg106 = (1'h0);
  reg [(3'h6):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg100 = (1'h0);
  reg [(4'he):(1'h0)] reg99 = (1'h0);
  reg [(2'h3):(1'h0)] reg98 = (1'h0);
  reg [(4'he):(1'h0)] reg97 = (1'h0);
  reg [(4'h9):(1'h0)] reg96 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg95 = (1'h0);
  reg [(3'h4):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg93 = (1'h0);
  reg [(4'h8):(1'h0)] reg92 = (1'h0);
  reg [(4'h8):(1'h0)] reg91 = (1'h0);
  reg signed [(4'he):(1'h0)] reg90 = (1'h0);
  reg [(4'hc):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg88 = (1'h0);
  reg [(4'hb):(1'h0)] reg87 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg86 = (1'h0);
  reg [(4'h9):(1'h0)] reg85 = (1'h0);
  reg [(4'h8):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg83 = (1'h0);
  assign y = {wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire119,
                 wire114,
                 wire113,
                 wire104,
                 wire103,
                 wire102,
                 reg141,
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
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg83 <= wire80[(2'h2):(1'h0)];
      if ((^(8'hb3)))
        begin
          if (((|reg83) ?
              {(wire80[(3'h4):(1'h1)] ?
                      ((wire80 ? wire79 : wire82) ?
                          wire80[(1'h0):(1'h0)] : wire80[(2'h2):(1'h1)]) : {((8'hb4) > wire82)})} : $unsigned(($unsigned((~wire82)) < $unsigned($unsigned(wire79))))))
            begin
              reg84 <= (({wire79, (&((8'haf) + (8'hbd)))} || reg83) << wire80);
            end
          else
            begin
              reg84 <= $unsigned($signed(((((8'hb9) && (7'h40)) & (reg84 & wire81)) ?
                  reg83 : ((reg84 >> reg84) ?
                      $unsigned((8'ha2)) : wire80[(2'h3):(1'h1)]))));
              reg85 <= ((!{(^wire81)}) ?
                  ((^~(&{wire82, wire82})) ?
                      (|(7'h44)) : wire79) : ({wire80} - ((+reg84) >= $unsigned(wire80))));
              reg86 <= (8'hbb);
            end
          reg87 <= {reg86[(1'h0):(1'h0)], (&{reg84[(4'h8):(1'h1)]})};
          if ((reg85 <<< (+(wire80[(1'h1):(1'h1)] ?
              $signed($signed(reg85)) : ((reg84 ^~ reg83) ?
                  (wire82 ^~ wire80) : (reg84 ~^ wire81))))))
            begin
              reg88 <= $unsigned(reg83);
              reg89 <= $unsigned({($unsigned((-reg85)) <<< wire81[(1'h0):(1'h0)])});
            end
          else
            begin
              reg88 <= reg85[(3'h5):(2'h3)];
              reg89 <= ($unsigned({(^$signed(reg87)),
                  ($unsigned(reg86) >> $signed(reg89))}) & (wire80 ?
                  wire82[(3'h5):(3'h5)] : (reg85[(2'h2):(1'h0)] ?
                      ($signed(reg85) ?
                          ((8'hbe) ? wire81 : wire79) : wire80) : wire80)));
            end
          if (($signed({reg86[(1'h1):(1'h1)], $signed((~&(7'h44)))}) ?
              reg88[(4'h9):(3'h6)] : wire80[(2'h2):(2'h2)]))
            begin
              reg90 <= wire80[(1'h0):(1'h0)];
              reg91 <= (+(-({reg88[(4'ha):(4'ha)], (reg85 ? reg84 : reg86)} ?
                  reg86[(2'h2):(2'h2)] : reg89[(4'ha):(3'h6)])));
              reg92 <= wire82[(4'hc):(1'h0)];
              reg93 <= (~^(!(((wire79 ? wire82 : reg85) ?
                  wire79[(2'h3):(1'h0)] : (8'hb5)) + $unsigned({(8'hb9),
                  reg83}))));
              reg94 <= wire82[(3'h6):(2'h2)];
            end
          else
            begin
              reg90 <= reg93[(3'h5):(2'h2)];
              reg91 <= reg87;
              reg92 <= (reg86[(2'h3):(2'h3)] >> $unsigned(({reg83} ?
                  {$unsigned(reg87), reg92} : wire81[(1'h0):(1'h0)])));
            end
          reg95 <= wire80[(2'h2):(1'h0)];
        end
      else
        begin
          reg84 <= $signed(reg92);
        end
      if ($signed((+($unsigned((&wire81)) ?
          reg88[(2'h3):(1'h1)] : $signed({reg85, wire82})))))
        begin
          reg96 <= (+(reg88[(1'h0):(1'h0)] ?
              reg89 : (reg88 ?
                  $signed((reg95 ? reg84 : wire81)) : reg90[(4'he):(2'h3)])));
          if (reg83[(1'h0):(1'h0)])
            begin
              reg97 <= ((((((7'h41) & reg84) ?
                          reg91 : (reg90 ? reg87 : wire82)) ?
                      wire79[(3'h4):(3'h4)] : $unsigned($signed(reg92))) ?
                  ($signed((|(8'hb6))) < $unsigned(reg89)) : {(~^(&wire81)),
                      {wire80}}) << (($unsigned((-reg85)) ?
                      (^wire82[(5'h14):(4'h8)]) : $unsigned((reg86 ?
                          reg87 : reg88))) ?
                  (+(+(reg90 ^ reg93))) : (-(reg89[(3'h6):(2'h2)] ?
                      (|reg95) : reg96[(3'h4):(1'h1)]))));
            end
          else
            begin
              reg97 <= $unsigned(wire80[(1'h0):(1'h0)]);
              reg98 <= ((~^reg96[(3'h5):(3'h5)]) <= $unsigned((~|$signed($signed(reg96)))));
              reg99 <= $signed(((((wire80 ? reg89 : wire79) - reg88) ?
                      $signed((reg88 ? wire82 : reg91)) : wire80) ?
                  (wire79 ?
                      (wire82[(1'h0):(1'h0)] ~^ reg84) : (wire80[(3'h4):(3'h4)] >= wire80)) : reg91[(2'h2):(1'h0)]));
            end
          reg100 <= ((~^wire82[(4'hd):(3'h4)]) ? reg83 : reg94[(1'h1):(1'h0)]);
        end
      else
        begin
          reg96 <= $signed((~^(8'ha2)));
          reg97 <= {(reg100[(1'h0):(1'h0)] ^~ reg97[(3'h5):(2'h2)]),
              reg87[(4'h9):(1'h0)]};
          reg98 <= (7'h41);
        end
      reg101 <= $unsigned((+$unsigned((!(!(8'ha0))))));
    end
  assign wire102 = $signed(reg85);
  assign wire103 = (~&$unsigned((|$unsigned(reg86[(1'h0):(1'h0)]))));
  assign wire104 = ((~(wire103 >= $signed(wire102[(1'h1):(1'h1)]))) ?
                       (wire103[(2'h3):(2'h2)] << $unsigned({$signed(wire102)})) : reg88);
  always
    @(posedge clk) begin
      if ({(8'h9f),
          ($signed(reg87[(1'h1):(1'h0)]) < ((^(wire103 == reg85)) || $signed($unsigned((7'h41)))))})
        begin
          reg105 <= ($unsigned(($signed($signed((8'hb0))) <<< wire103)) & wire81);
          if (($signed(reg100[(3'h5):(1'h1)]) ? reg85 : wire104[(3'h6):(3'h4)]))
            begin
              reg106 <= reg98[(1'h0):(1'h0)];
              reg107 <= reg89;
              reg108 <= {$unsigned($signed(reg93)),
                  (((-reg93) ~^ $unsigned($signed(reg93))) >>> (((reg84 ?
                          reg93 : wire102) && $unsigned(reg87)) ?
                      ($unsigned(reg89) ?
                          reg97 : reg98[(1'h1):(1'h1)]) : (reg89 != (reg90 ^ reg84))))};
            end
          else
            begin
              reg106 <= (~^(8'ha1));
              reg107 <= reg105[(3'h5):(2'h3)];
              reg108 <= {(8'h9f)};
            end
        end
      else
        begin
          reg105 <= $signed({$unsigned(wire103)});
          if (reg93)
            begin
              reg106 <= {(8'hb9),
                  ((!($unsigned(wire82) >>> (reg90 ?
                      wire81 : (8'hb3)))) <= $signed({((8'hae) ?
                          reg97 : wire104),
                      (reg90 ? (8'hb2) : reg97)}))};
              reg107 <= $signed($signed(($signed($unsigned(reg98)) != (~&(reg99 ?
                  wire103 : reg100)))));
            end
          else
            begin
              reg106 <= (reg95[(3'h5):(1'h0)] && $unsigned((reg92[(1'h0):(1'h0)] ?
                  (reg94 ?
                      (reg106 ? reg108 : reg101) : reg91) : $signed(reg89))));
            end
          reg108 <= reg100;
          reg109 <= reg92[(3'h4):(1'h0)];
          reg110 <= (reg107[(1'h0):(1'h0)] ?
              (reg101[(1'h0):(1'h0)] ?
                  (^~(+reg86[(1'h1):(1'h1)])) : (+$signed((reg109 ?
                      (7'h41) : reg85)))) : (($unsigned((reg108 >>> reg106)) != reg107) < $signed($signed((8'ha1)))));
        end
      reg111 <= reg101;
      reg112 <= reg94[(2'h3):(1'h0)];
    end
  assign wire113 = $unsigned(reg90);
  assign wire114 = {wire81[(1'h0):(1'h0)],
                       ((reg92 ?
                           (~^(reg105 || reg109)) : reg100[(1'h0):(1'h0)]) != $signed(reg89))};
  always
    @(posedge clk) begin
      reg115 <= reg88[(1'h1):(1'h0)];
      reg116 <= $signed(wire82);
      reg117 <= $signed(reg112);
      reg118 <= (~^(!((|$unsigned((8'ha9))) ?
          $unsigned(reg100[(2'h2):(1'h0)]) : ({reg116, wire102} ?
              {reg106} : reg91[(2'h3):(1'h1)]))));
    end
  assign wire119 = $signed((8'hb3));
  always
    @(posedge clk) begin
      reg120 <= {(~reg106[(2'h2):(1'h0)]), reg116};
      if ((&(!(($signed(reg95) ? (~(8'hb4)) : (&wire113)) ?
          reg112[(3'h4):(1'h0)] : $signed({reg106})))))
        begin
          if (reg109[(3'h7):(3'h6)])
            begin
              reg121 <= ((|reg88) ?
                  (({$unsigned(reg118)} ?
                      (&(|reg105)) : reg105[(1'h1):(1'h1)]) ^~ (reg105 ?
                      $unsigned((reg107 - reg117)) : (~&wire82[(4'hf):(2'h3)]))) : ((|(reg96[(3'h4):(2'h3)] ?
                      $unsigned(reg116) : reg117[(4'h8):(3'h7)])) & {reg89[(4'hc):(1'h1)]}));
            end
          else
            begin
              reg121 <= (-$signed(($unsigned(reg118[(3'h4):(1'h1)]) ?
                  $signed(reg89) : ((8'hac) ? (~reg89) : {(8'hbf)}))));
              reg122 <= wire114[(2'h3):(2'h3)];
              reg123 <= {(~^(7'h40))};
            end
          reg124 <= (((+$signed({(8'ha9)})) > {(|reg107[(2'h2):(1'h1)]),
                  $signed(reg86)}) ?
              $signed((wire114 ?
                  {(reg109 ? wire102 : reg117),
                      (^~reg109)} : (~&(reg86 >>> reg83)))) : ((($signed(reg84) & $signed(reg97)) ?
                      $unsigned($unsigned((8'h9f))) : ($signed(reg107) ?
                          ((8'hb7) >= wire114) : wire119[(2'h3):(2'h2)])) ?
                  $unsigned((|$signed((7'h41)))) : ($unsigned($unsigned(wire114)) ^ ($signed((8'ha8)) < $signed(reg107)))));
          if (reg94[(1'h0):(1'h0)])
            begin
              reg125 <= $unsigned($unsigned($signed($unsigned($unsigned(reg123)))));
              reg126 <= ((~&{wire119[(4'hb):(2'h2)],
                      $unsigned($signed(reg100))}) ?
                  $unsigned($unsigned(({wire81} ?
                      reg98 : (reg121 ?
                          reg90 : reg85)))) : (reg115[(4'hb):(3'h6)] ?
                      reg105[(3'h5):(2'h3)] : {$unsigned($signed((8'ha1))),
                          reg95[(1'h0):(1'h0)]}));
              reg127 <= reg89[(1'h1):(1'h0)];
              reg128 <= reg115;
              reg129 <= ((reg98 >= (reg112[(3'h6):(3'h4)] ?
                      {(reg120 ? reg120 : reg99)} : wire103)) ?
                  (wire113 ^~ $unsigned((^~{reg95}))) : ($signed($unsigned($signed(reg111))) >>> wire114));
            end
          else
            begin
              reg125 <= {(~^$unsigned($unsigned((~^(7'h43))))),
                  reg121[(2'h2):(2'h2)]};
              reg126 <= reg95;
              reg127 <= reg111[(2'h3):(1'h1)];
              reg128 <= reg108[(3'h7):(2'h2)];
              reg129 <= $unsigned($unsigned({((wire104 ?
                      wire79 : wire102) < reg108[(4'h8):(4'h8)]),
                  (8'hb8)}));
            end
          if (reg105)
            begin
              reg130 <= {(-(7'h40))};
              reg131 <= $signed(($unsigned($unsigned((wire102 ?
                      wire80 : reg125))) ?
                  (!$unsigned((reg107 && reg111))) : $signed(reg98[(2'h3):(2'h2)])));
              reg132 <= $signed($unsigned(reg115));
              reg133 <= ((8'hae) != ($signed({(^(8'h9e))}) ?
                  reg95[(3'h7):(2'h2)] : reg88));
            end
          else
            begin
              reg130 <= (reg98[(2'h3):(2'h2)] || (~^wire103));
              reg131 <= $unsigned($signed($signed(((reg96 && wire114) ?
                  (^(8'hb9)) : reg100[(3'h4):(1'h1)]))));
            end
          reg134 <= (reg95[(3'h6):(3'h5)] > (&$unsigned($signed($signed(reg93)))));
        end
      else
        begin
          reg121 <= {reg118, wire114};
          reg122 <= wire79[(2'h2):(1'h1)];
        end
    end
  always
    @(posedge clk) begin
      reg135 <= (|{$unsigned(reg108),
          ($unsigned($unsigned(reg120)) ? reg128[(4'hb):(1'h1)] : reg131)});
      if ($unsigned(($signed($unsigned($unsigned(reg128))) ^ $unsigned((!(^reg108))))))
        begin
          if (((reg118 + {({wire103} | (~^reg101))}) || $unsigned($signed({$signed(reg131),
              reg116[(1'h0):(1'h0)]}))))
            begin
              reg136 <= ($unsigned((~|{reg115, (wire81 ? reg126 : reg110)})) ?
                  (($signed((8'hb3)) ?
                      {(~|reg127)} : reg101) ~^ ($signed(reg109[(4'hd):(4'hd)]) != (reg87[(2'h2):(1'h0)] + $unsigned(wire82)))) : (+$signed((8'ha7))));
              reg137 <= $unsigned(((~&((reg95 ?
                  reg111 : reg85) != $signed(reg118))) != $unsigned({(+reg115),
                  $unsigned(reg98)})));
              reg138 <= $signed((reg108[(4'h8):(4'h8)] ?
                  $signed(reg105) : (((&reg88) ^~ {wire103,
                      reg124}) | wire113[(3'h4):(1'h0)])));
            end
          else
            begin
              reg136 <= (|$signed($signed(({reg115, (8'hab)} ?
                  reg83 : $signed(reg135)))));
              reg137 <= $unsigned((~&reg107[(1'h1):(1'h1)]));
              reg138 <= reg83;
              reg139 <= $unsigned(reg99);
              reg140 <= (^$unsigned((~|wire114[(3'h4):(1'h1)])));
            end
          reg141 <= (&$signed($unsigned(((wire114 >= (8'hb2)) ?
              ((8'hae) ? (8'hab) : reg120) : (reg139 ? wire79 : reg128)))));
        end
      else
        begin
          if (((^$signed((reg141 ?
              reg84[(4'h8):(2'h3)] : (reg128 ?
                  reg122 : wire104)))) >= ((({(8'h9f), reg88} ?
                      $signed(wire82) : (reg137 ^ reg124)) ?
                  ((reg129 ? reg125 : reg95) && (^~reg135)) : (8'hb0)) ?
              $signed(reg88[(4'h8):(2'h2)]) : $unsigned(reg134[(1'h1):(1'h0)]))))
            begin
              reg136 <= $signed($signed((reg121[(5'h10):(4'hb)] ?
                  (~&(wire81 ? reg112 : reg109)) : (~^$signed((8'h9d))))));
            end
          else
            begin
              reg136 <= reg84;
              reg137 <= (((8'hb7) ?
                  $signed((~|{wire80, (8'hbb)})) : $signed(((7'h42) ?
                      (reg86 ?
                          reg123 : wire114) : reg133[(3'h4):(2'h3)]))) << reg87[(3'h7):(1'h0)]);
              reg138 <= ($unsigned((reg106[(1'h1):(1'h0)] >>> $signed((reg139 ?
                      reg139 : reg107)))) ?
                  ((reg127[(1'h0):(1'h0)] ? (8'ha3) : (&$unsigned(reg116))) ?
                      ({(&reg98), $unsigned(reg120)} ?
                          (reg106[(1'h1):(1'h1)] ?
                              ((8'h9d) ?
                                  reg95 : wire102) : (!reg122)) : (~|(reg91 ^~ reg98))) : ($signed((reg132 >= reg118)) ?
                          (|reg89) : reg122)) : reg115);
              reg139 <= ((~^$unsigned(reg89[(4'hb):(3'h5)])) ?
                  reg108 : ((reg84 && reg120) ?
                      {(8'ha8), reg133} : {$signed((+reg109)),
                          $signed(reg106[(1'h1):(1'h1)])}));
              reg140 <= (reg141 >= (~^(reg129[(4'h8):(2'h2)] != wire119[(3'h4):(2'h3)])));
            end
        end
    end
  assign wire142 = $unsigned($unsigned(($signed((reg95 * reg133)) ?
                       (reg131[(4'h8):(1'h1)] ?
                           $unsigned(reg124) : {reg89}) : (|$unsigned(reg105)))));
  assign wire143 = (reg130 ?
                       ($signed((8'ha1)) >>> reg130) : (reg129 <<< (wire119 && reg124)));
  assign wire144 = $unsigned((+({$signed(reg90)} ?
                       (-reg117[(3'h6):(2'h2)]) : wire80[(1'h1):(1'h1)])));
  assign wire145 = ((8'hb7) ?
                       reg85 : (reg122 ?
                           (reg107[(1'h1):(1'h1)] ?
                               (~&(|reg134)) : $signed(reg83)) : $unsigned(({wire103,
                               reg128} - $unsigned((8'ha2))))));
  assign wire146 = {$unsigned((((wire102 ?
                           reg126 : reg109) == (^~wire103)) ^ reg115[(1'h1):(1'h1)])),
                       ($unsigned(reg133[(3'h4):(1'h0)]) ?
                           $signed(reg139[(3'h4):(2'h2)]) : reg96)};
  assign wire147 = $unsigned({(|(-$unsigned((8'hbe)))),
                       $signed(reg135[(3'h5):(1'h1)])});
  assign wire148 = reg141[(3'h4):(2'h2)];
endmodule

module module33  (y, clk, wire38, wire37, wire36, wire35, wire34);
  output wire [(32'h14f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire38;
  input wire [(5'h10):(1'h0)] wire37;
  input wire signed [(4'he):(1'h0)] wire36;
  input wire signed [(3'h4):(1'h0)] wire35;
  input wire signed [(2'h2):(1'h0)] wire34;
  wire [(4'h9):(1'h0)] wire68;
  wire [(2'h2):(1'h0)] wire67;
  wire [(4'hd):(1'h0)] wire61;
  wire [(4'ha):(1'h0)] wire60;
  wire signed [(4'h8):(1'h0)] wire59;
  wire [(3'h5):(1'h0)] wire58;
  wire signed [(3'h6):(1'h0)] wire57;
  wire signed [(5'h13):(1'h0)] wire56;
  wire signed [(4'h9):(1'h0)] wire55;
  wire [(3'h5):(1'h0)] wire50;
  wire [(5'h10):(1'h0)] wire49;
  wire signed [(3'h4):(1'h0)] wire48;
  wire [(5'h11):(1'h0)] wire47;
  wire [(5'h11):(1'h0)] wire46;
  wire signed [(5'h10):(1'h0)] wire45;
  wire [(4'hd):(1'h0)] wire44;
  wire [(5'h10):(1'h0)] wire43;
  reg [(4'h8):(1'h0)] reg66 = (1'h0);
  reg [(4'hc):(1'h0)] reg65 = (1'h0);
  reg [(5'h12):(1'h0)] reg64 = (1'h0);
  reg [(2'h3):(1'h0)] reg63 = (1'h0);
  reg [(5'h11):(1'h0)] reg62 = (1'h0);
  reg [(3'h7):(1'h0)] reg54 = (1'h0);
  reg [(5'h10):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg41 = (1'h0);
  reg [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned($signed($signed((wire35 ? wire38 : $signed(wire36))))))
        begin
          reg39 <= $unsigned((8'hb8));
        end
      else
        begin
          reg39 <= $unsigned(($signed($unsigned(wire34[(1'h0):(1'h0)])) >>> wire38[(3'h7):(2'h3)]));
        end
      reg40 <= wire37;
      reg41 <= {$signed({(wire38[(4'h8):(3'h4)] ?
                  reg39[(2'h3):(1'h1)] : (wire35 ? wire38 : wire35)),
              $unsigned({(8'hb5)})})};
      reg42 <= $unsigned(wire37);
    end
  assign wire43 = wire35;
  assign wire44 = (reg39[(3'h6):(1'h0)] ?
                      (reg39[(1'h1):(1'h0)] | ($unsigned(wire37[(1'h0):(1'h0)]) ?
                          $unsigned({(8'hbf),
                              wire36}) : $signed(wire38[(1'h1):(1'h0)]))) : (((8'hba) ?
                              ((reg40 && reg42) ?
                                  (wire38 ?
                                      (8'hbf) : (8'ha2)) : (wire36 != (8'haf))) : $signed(wire43[(2'h3):(1'h1)])) ?
                          reg42 : {reg42[(4'h9):(2'h3)]}));
  assign wire45 = (!(((8'haa) ?
                          reg42[(3'h5):(1'h1)] : $unsigned(reg42[(2'h3):(2'h3)])) ?
                      (wire36 ? (8'hb9) : (&wire34)) : (8'hbf)));
  assign wire46 = (^~wire43);
  assign wire47 = (&reg39);
  assign wire48 = (($signed((wire47 ? wire44[(3'h7):(3'h6)] : wire44)) ?
                      ({$unsigned(reg40)} ?
                          {(+(8'ha4))} : wire36[(3'h7):(1'h1)]) : (wire47[(1'h0):(1'h0)] ?
                          reg42[(1'h0):(1'h0)] : ((wire35 - reg39) ?
                              $unsigned(wire35) : {wire37,
                                  reg39}))) > ((~|wire47[(2'h2):(1'h1)]) > (wire46[(4'hc):(4'h9)] <= (wire46[(5'h11):(4'h8)] ?
                      (|(8'ha8)) : reg39[(1'h0):(1'h0)]))));
  assign wire49 = ((&((~&(8'ha9)) ?
                      (8'ha7) : ((8'hb4) ?
                          {reg42} : $unsigned(reg42)))) >> reg41);
  assign wire50 = ($unsigned(($signed($signed(wire43)) ?
                          $unsigned($unsigned(wire34)) : (^wire43[(3'h5):(2'h3)]))) ?
                      ((~$unsigned((~|wire49))) > wire45) : $unsigned({$unsigned((wire43 >>> wire36)),
                          wire47[(1'h0):(1'h0)]}));
  always
    @(posedge clk) begin
      reg51 <= $unsigned(wire47);
      reg52 <= (((wire34 ?
              (wire46 ?
                  {(8'hb4),
                      wire35} : wire48[(2'h2):(1'h1)]) : $signed(reg42)) - (((!wire50) ?
              (7'h40) : (reg41 ?
                  (7'h40) : reg41)) != (wire48[(2'h3):(2'h3)] >= $signed((8'ha4))))) ?
          wire49 : $unsigned($unsigned((|wire35[(2'h3):(2'h2)]))));
      reg53 <= (($signed((((8'hbd) ? wire38 : (8'h9e)) ?
              (-wire44) : $signed((8'ha6)))) ?
          (^$unsigned((reg52 ? (8'hb4) : wire36))) : wire44) >>> reg41);
      reg54 <= wire34[(1'h1):(1'h0)];
    end
  assign wire55 = ($unsigned(($signed({wire49}) || (reg39 << {reg42,
                      wire38}))) | (reg51[(5'h12):(4'hf)] - (-{$unsigned(reg54),
                      (|reg40)})));
  assign wire56 = wire35;
  assign wire57 = $unsigned($signed(({$unsigned(wire50)} ^~ ((8'h9c) < (^(8'hb8))))));
  assign wire58 = ($unsigned((+{{(8'had)}, $unsigned(reg51)})) ^ ({(|(reg40 ?
                          wire48 : wire56)),
                      $unsigned(reg41[(4'h9):(2'h2)])} - (!(((8'ha9) ^~ wire48) && {wire57}))));
  assign wire59 = (+(((^~(8'hba)) || $signed((~&wire34))) > ((^(|(7'h44))) | {(-wire50)})));
  assign wire60 = $unsigned($signed($unsigned({((7'h42) | (7'h40))})));
  assign wire61 = ((({$unsigned(wire50), $signed(reg41)} ?
                          ($unsigned(wire38) <= (8'hbd)) : ({wire48} ?
                              wire47[(5'h10):(3'h5)] : (~|wire34))) >>> $unsigned(((wire48 == reg40) ?
                          {reg51} : (~^wire49)))) ?
                      $signed((reg53[(3'h7):(2'h3)] < (((8'h9c) ^~ (8'hab)) * reg40))) : wire45);
  always
    @(posedge clk) begin
      if ((reg41 ?
          $signed((wire60 - wire44[(3'h6):(3'h5)])) : ($unsigned(wire58[(2'h3):(2'h3)]) ?
              {(-(8'h9d))} : $signed($unsigned($unsigned(wire35))))))
        begin
          reg62 <= $signed((((wire34[(1'h1):(1'h1)] >> $unsigned(wire48)) ?
                  ((^wire55) ? (8'ha0) : (wire34 <<< wire47)) : wire35) ?
              wire50 : wire57[(3'h5):(2'h2)]));
        end
      else
        begin
          reg62 <= ((8'hbf) >= (wire55[(2'h2):(2'h2)] ?
              wire36[(1'h1):(1'h1)] : wire56[(3'h5):(2'h2)]));
          reg63 <= (((((reg42 ? (8'haa) : reg51) ?
                  (wire34 ^~ (8'h9f)) : (wire50 ? wire49 : wire56)) ?
              {reg41[(3'h7):(3'h5)]} : $unsigned(reg62[(4'hb):(2'h3)])) ~^ reg52) << (wire44 ?
              $unsigned((wire45 ?
                  $unsigned(wire49) : wire44[(1'h1):(1'h1)])) : $unsigned(wire38[(1'h1):(1'h0)])));
        end
      reg64 <= wire49[(3'h6):(1'h0)];
      reg65 <= (((!({wire61, wire45} && $unsigned(reg54))) ?
          wire56 : $signed(((~|reg40) ?
              ((8'ha5) == wire35) : $signed(reg39)))) << $unsigned(reg41[(3'h7):(3'h5)]));
      reg66 <= wire55[(2'h2):(1'h0)];
    end
  assign wire67 = reg54[(2'h2):(2'h2)];
  assign wire68 = (8'hb8);
endmodule
