module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h153):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire102;
  wire signed [(4'h9):(1'h0)] wire101;
  wire [(3'h7):(1'h0)] wire100;
  wire [(4'hc):(1'h0)] wire99;
  wire signed [(3'h6):(1'h0)] wire98;
  wire signed [(3'h4):(1'h0)] wire78;
  wire [(4'hd):(1'h0)] wire77;
  wire [(5'h12):(1'h0)] wire76;
  wire [(5'h13):(1'h0)] wire75;
  wire signed [(4'h9):(1'h0)] wire73;
  wire signed [(5'h10):(1'h0)] wire72;
  wire signed [(3'h5):(1'h0)] wire71;
  wire signed [(3'h4):(1'h0)] wire69;
  wire [(5'h14):(1'h0)] wire5;
  reg [(3'h5):(1'h0)] reg97 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg93 = (1'h0);
  reg [(4'hc):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg91 = (1'h0);
  reg [(5'h12):(1'h0)] reg90 = (1'h0);
  reg [(4'hc):(1'h0)] reg89 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg88 = (1'h0);
  reg [(4'hb):(1'h0)] reg87 = (1'h0);
  reg [(3'h5):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg84 = (1'h0);
  reg [(5'h13):(1'h0)] reg83 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg81 = (1'h0);
  reg [(4'hc):(1'h0)] reg80 = (1'h0);
  reg [(4'ha):(1'h0)] reg79 = (1'h0);
  reg [(4'hd):(1'h0)] reg74 = (1'h0);
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire73,
                 wire72,
                 wire71,
                 wire69,
                 wire5,
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
                 reg74,
                 (1'h0)};
  assign wire5 = $unsigned((8'hba));
  module6 #() modinst70 (.wire9(wire2), .clk(clk), .wire10(wire3), .wire7(wire5), .y(wire69), .wire8(wire1));
  assign wire71 = wire69;
  assign wire72 = ((!$signed(wire71)) | $unsigned(($signed((~&wire0)) ?
                      $unsigned((wire4 ^ wire1)) : (|wire1))));
  assign wire73 = wire5[(5'h10):(2'h3)];
  always
    @(posedge clk) begin
      reg74 <= wire1;
    end
  assign wire75 = ({{reg74}} ?
                      $unsigned($unsigned($signed((~&wire69)))) : ((8'hb9) ?
                          (-{wire3[(3'h7):(3'h6)]}) : wire3));
  assign wire76 = wire4;
  assign wire77 = ($unsigned(wire69) ?
                      wire75 : $signed((+wire69[(2'h3):(2'h2)])));
  assign wire78 = $signed(($unsigned(wire75) ?
                      (wire76 ?
                          ({(8'hbc)} ?
                              wire2 : ((8'ha3) ?
                                  wire76 : wire5)) : wire72) : wire76[(4'h9):(2'h2)]));
  always
    @(posedge clk) begin
      reg79 <= $unsigned((~&((^$unsigned(wire76)) >> $signed($unsigned(wire72)))));
      reg80 <= (((^~($signed(reg74) ?
                  $unsigned(wire73) : wire77[(3'h6):(3'h6)])) ?
              (^((reg74 ?
                  wire78 : wire69) + (~wire69))) : wire76[(3'h7):(2'h3)]) ?
          $signed($signed(reg74)) : $signed($unsigned($signed((~^wire3)))));
      if (((8'hb7) ?
          $signed(wire2[(2'h2):(2'h2)]) : (wire69 ?
              (((wire75 ? wire3 : wire75) ?
                  $signed(reg79) : (~&(8'ha7))) <= (8'hab)) : ((!wire73) ?
                  ($signed(wire1) ?
                      $signed(reg79) : {wire77}) : ($unsigned(wire2) ?
                      (wire1 || wire72) : (^wire0))))))
        begin
          reg81 <= (($signed({(wire75 | wire73), (wire75 ? (8'ha3) : wire5)}) ?
              $signed((wire73 & wire78[(1'h0):(1'h0)])) : (wire69 + wire69[(1'h1):(1'h0)])) >> ((!wire76[(4'h9):(3'h7)]) >= wire71[(1'h1):(1'h1)]));
          reg82 <= $unsigned($unsigned(reg79));
          if (wire1[(1'h0):(1'h0)])
            begin
              reg83 <= {$unsigned({(reg80[(4'h8):(4'h8)] <<< (8'ha5)),
                      $signed((~wire76))}),
                  wire0};
              reg84 <= (~(wire2 ?
                  $signed({(8'hb4)}) : ({$unsigned((8'hae))} != ((+(8'ha5)) && (~^reg80)))));
            end
          else
            begin
              reg83 <= (^(~&((~wire78) ?
                  (!$unsigned(reg83)) : $unsigned($unsigned(wire1)))));
              reg84 <= ((8'h9e) <<< (reg80[(2'h3):(2'h2)] - $unsigned($unsigned((wire0 & wire78)))));
              reg85 <= wire1;
            end
          reg86 <= $unsigned(wire0[(2'h2):(1'h1)]);
          if ($unsigned((wire5 ?
              $unsigned(((wire69 ? reg83 : reg74) ?
                  (wire2 && reg84) : $signed(reg80))) : (~^(wire75 ?
                  $signed(wire78) : reg85)))))
            begin
              reg87 <= $unsigned(wire3);
              reg88 <= $unsigned(wire2[(2'h3):(1'h0)]);
              reg89 <= (7'h43);
            end
          else
            begin
              reg87 <= {(((^~wire3[(4'ha):(3'h4)]) ?
                          (8'hb6) : {(wire2 ? wire0 : (8'h9e))}) ?
                      $unsigned((!(-wire73))) : {($signed(wire2) ~^ $signed(wire5))})};
              reg88 <= wire72[(2'h3):(2'h2)];
              reg89 <= $unsigned(wire1);
              reg90 <= reg88[(2'h3):(1'h0)];
              reg91 <= $signed($unsigned(wire73[(3'h6):(3'h6)]));
            end
        end
      else
        begin
          reg81 <= (reg81[(2'h2):(1'h1)] <<< wire76);
          reg82 <= (~^(wire78[(2'h3):(2'h2)] | (^$signed(reg89[(4'hb):(1'h0)]))));
          reg83 <= $signed((!$unsigned($unsigned(reg85))));
        end
      reg92 <= ((8'hb3) ^ $unsigned((($unsigned((7'h40)) ?
          (!(8'ha7)) : reg80[(3'h7):(1'h1)]) - wire5)));
    end
  always
    @(posedge clk) begin
      reg93 <= $signed(reg86[(3'h4):(2'h3)]);
      reg94 <= {reg87};
      reg95 <= $signed({wire69[(2'h2):(2'h2)]});
      reg96 <= wire5;
      reg97 <= (wire71 >= $signed(($unsigned((wire3 ?
          reg74 : (8'hb0))) == ((wire73 ? wire0 : reg82) - (+(7'h40))))));
    end
  assign wire98 = (7'h42);
  assign wire99 = ((8'hb3) ?
                      (~&((+(~wire3)) ?
                          $signed((reg81 != reg92)) : wire69)) : (reg82 ?
                          (($unsigned((8'hbe)) ? (&wire77) : $signed(wire2)) ?
                              reg92[(3'h4):(2'h2)] : ({reg88, wire4} ?
                                  (reg85 ? (8'hbc) : reg74) : {(8'hb7),
                                      wire72})) : {(reg97[(3'h5):(1'h1)] + reg86[(3'h4):(1'h1)])}));
  assign wire100 = $unsigned((^~$signed(((reg94 * (8'hbf)) * wire73))));
  assign wire101 = (reg84 <<< (7'h43));
  assign wire102 = $unsigned({wire1});
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h285):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire10;
  input wire signed [(2'h2):(1'h0)] wire9;
  input wire signed [(3'h4):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire68;
  wire signed [(4'hc):(1'h0)] wire67;
  wire [(4'hd):(1'h0)] wire66;
  wire signed [(4'he):(1'h0)] wire65;
  wire [(5'h11):(1'h0)] wire64;
  wire [(5'h14):(1'h0)] wire63;
  wire [(4'hf):(1'h0)] wire61;
  wire [(5'h11):(1'h0)] wire53;
  wire [(5'h10):(1'h0)] wire52;
  wire [(3'h7):(1'h0)] wire51;
  wire [(2'h3):(1'h0)] wire50;
  wire signed [(5'h14):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire48;
  wire [(5'h13):(1'h0)] wire35;
  wire [(2'h2):(1'h0)] wire11;
  reg signed [(4'h9):(1'h0)] reg62 = (1'h0);
  reg [(2'h2):(1'h0)] reg60 = (1'h0);
  reg [(4'he):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg56 = (1'h0);
  reg [(2'h2):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(5'h11):(1'h0)] reg47 = (1'h0);
  reg [(4'hc):(1'h0)] reg46 = (1'h0);
  reg [(4'hc):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(2'h3):(1'h0)] reg41 = (1'h0);
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  reg [(5'h12):(1'h0)] reg39 = (1'h0);
  reg [(5'h14):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  reg [(4'h8):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire61,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire35,
                 wire11,
                 reg62,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
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
                 reg37,
                 reg36,
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
                 (1'h0)};
  assign wire11 = $unsigned(wire10);
  always
    @(posedge clk) begin
      if ((+(~^wire11[(2'h2):(1'h1)])))
        begin
          reg12 <= $signed($signed(($unsigned((8'ha4)) | $unsigned((wire7 && wire10)))));
          reg13 <= $unsigned((((&reg12) >> ($unsigned((8'h9d)) ?
                  (wire10 ? wire11 : reg12) : $unsigned(wire11))) ?
              (({wire9} <= (~&wire10)) ?
                  wire11 : wire9[(2'h2):(2'h2)]) : $signed($signed(wire8))));
          reg14 <= $signed(reg13);
        end
      else
        begin
          reg12 <= (^(reg13[(1'h1):(1'h0)] ^~ (+(wire7[(3'h6):(2'h2)] ?
              (reg13 <<< reg12) : $signed(reg14)))));
          if (((wire9 - (reg14[(4'he):(4'hb)] ?
                  $unsigned($signed(wire8)) : (!reg13[(2'h2):(1'h1)]))) ?
              wire10[(4'ha):(3'h6)] : reg12[(1'h0):(1'h0)]))
            begin
              reg13 <= reg12;
              reg14 <= reg14;
              reg15 <= (8'hba);
              reg16 <= (~|(~|(8'hab)));
            end
          else
            begin
              reg13 <= wire11[(2'h2):(2'h2)];
              reg14 <= (reg12[(2'h3):(2'h3)] | reg13[(1'h0):(1'h0)]);
              reg15 <= wire8;
              reg16 <= reg12;
              reg17 <= $signed(wire9[(1'h0):(1'h0)]);
            end
          reg18 <= wire9[(1'h1):(1'h0)];
          reg19 <= {reg15[(3'h5):(3'h5)]};
          reg20 <= wire9;
        end
      reg21 <= wire11[(1'h0):(1'h0)];
      if ((^~(~^wire7)))
        begin
          if ($unsigned(wire10[(2'h2):(1'h0)]))
            begin
              reg22 <= {(reg16 ?
                      $unsigned((!(wire10 + wire11))) : (reg14 ?
                          $signed(reg18) : ($signed(reg13) > $signed(reg15))))};
              reg23 <= $signed(reg15);
              reg24 <= (($unsigned(({reg17} <<< reg20)) ?
                      (^reg19) : $unsigned(($signed((8'hb6)) <<< $unsigned(reg13)))) ?
                  reg15 : $unsigned(wire10));
              reg25 <= ((8'hb0) ?
                  (reg21 ?
                      $signed(wire11) : ($signed((~^reg13)) ?
                          (~|(reg14 ?
                              reg12 : wire11)) : wire7)) : $unsigned($signed(((reg24 ?
                          (8'hae) : reg16) ?
                      (wire7 <= reg17) : $unsigned(reg12)))));
              reg26 <= (^~(($unsigned(reg22) ?
                      ($unsigned(reg18) || ((7'h44) ?
                          reg17 : (7'h42))) : (reg19[(2'h2):(1'h0)] ^~ reg18)) ?
                  (8'hb9) : (^$unsigned($signed(reg24)))));
            end
          else
            begin
              reg22 <= {((reg18 << wire8) >>> reg14),
                  (~|$unsigned(reg13[(1'h1):(1'h1)]))};
              reg23 <= reg14;
              reg24 <= (+$unsigned({{wire7[(5'h13):(1'h0)]}}));
              reg25 <= (({$signed((reg15 ^ wire11)),
                  reg19[(2'h3):(2'h2)]} && $unsigned(reg22)) - ({((reg18 * wire8) ?
                      reg12[(1'h1):(1'h0)] : (+(8'haa)))} == (8'hb9)));
            end
          if ($signed(reg24))
            begin
              reg27 <= reg26[(3'h5):(2'h3)];
            end
          else
            begin
              reg27 <= (8'ha0);
              reg28 <= (($signed($unsigned((reg25 & reg18))) ?
                  (-reg20) : ($signed($unsigned(wire9)) ?
                      (|{reg26,
                          reg17}) : $signed((reg20 > reg27)))) != (~$signed($signed((reg15 << reg22)))));
              reg29 <= $unsigned(((8'hb5) ? (~&reg18[(3'h7):(2'h3)]) : wire8));
              reg30 <= (^wire11[(1'h1):(1'h1)]);
            end
          if ((wire8 ?
              $unsigned((^{$signed((8'ha6)),
                  $signed(reg30)})) : $unsigned((~(reg28 ^ (|reg28))))))
            begin
              reg31 <= $signed(($unsigned(reg22) ?
                  (($unsigned(reg26) == (&reg29)) ^~ (reg26 ?
                      $signed(reg15) : (wire9 ?
                          (7'h41) : reg30))) : (($unsigned(reg15) - $signed(reg14)) ?
                      $signed($signed(wire8)) : reg15[(4'hc):(2'h3)])));
              reg32 <= (reg26 || $signed(wire11[(2'h2):(1'h0)]));
            end
          else
            begin
              reg31 <= $signed((~^((reg28 & (reg29 ? reg22 : wire9)) ?
                  (~|$signed(reg25)) : $unsigned(reg20))));
            end
          reg33 <= reg14;
        end
      else
        begin
          reg22 <= ((reg32 - (8'ha5)) ~^ $unsigned(wire7[(4'hb):(4'h9)]));
          reg23 <= {({$signed((reg24 ?
                      reg29 : (8'hbb)))} >>> (reg19[(1'h0):(1'h0)] ?
                  ((reg24 >> reg33) >= {reg25, reg32}) : {(~|reg12)}))};
          if ((+$unsigned(wire7[(5'h14):(4'h8)])))
            begin
              reg24 <= reg14[(4'h8):(2'h3)];
              reg25 <= {(|(^~(-reg25)))};
            end
          else
            begin
              reg24 <= $unsigned($unsigned(reg20[(3'h4):(2'h2)]));
              reg25 <= (7'h43);
              reg26 <= $signed((($signed($signed((8'hb4))) != $unsigned((reg28 << wire8))) > $unsigned(reg30)));
            end
        end
      reg34 <= ((wire8 << (($unsigned(reg13) <<< (~&reg15)) ?
              $signed(reg17) : ((~|reg28) ^ $unsigned(wire7)))) ?
          reg15 : reg23[(2'h3):(1'h0)]);
    end
  assign wire35 = reg22[(4'hd):(3'h5)];
  always
    @(posedge clk) begin
      reg36 <= $signed(reg15[(1'h0):(1'h0)]);
      if ((+(^~(reg26[(2'h3):(2'h3)] ?
          (|$unsigned((8'ha4))) : $unsigned((~reg16))))))
        begin
          reg37 <= reg18;
          reg38 <= (reg37 ?
              (wire8[(1'h0):(1'h0)] - (8'hb5)) : (((reg17 && $signed(reg17)) ?
                  ($unsigned(wire11) - (~|(8'ha8))) : ((8'ha3) ?
                      (-reg31) : reg25)) == $unsigned(reg28[(3'h7):(3'h6)])));
        end
      else
        begin
          reg37 <= {(((reg25 ?
                      (reg32 ^ reg27) : reg33) ^ (-(reg29 <<< reg29))) ?
                  ($unsigned($signed(reg27)) ?
                      (^~(~^reg34)) : ($signed(reg20) ?
                          $signed(reg16) : (reg24 >= reg30))) : wire7[(4'hb):(3'h4)])};
          reg38 <= $unsigned(((|$unsigned((reg18 == wire10))) ?
              (~^((reg36 ? (8'hb7) : wire7) && (reg15 ?
                  reg12 : reg17))) : $signed((~(~reg27)))));
          reg39 <= $unsigned((reg18[(3'h6):(2'h2)] >> reg38));
          reg40 <= $signed(reg27[(1'h0):(1'h0)]);
        end
      reg41 <= $signed({((((7'h41) == reg19) ?
              wire35[(3'h6):(1'h1)] : (reg29 ?
                  wire9 : wire7)) == ($signed(reg15) != (reg34 != reg27))),
          $unsigned({(reg25 ? reg36 : reg14)})});
      if ($signed((($signed((^~reg37)) ?
          reg24[(2'h2):(2'h2)] : reg40[(4'h9):(3'h6)]) > reg26[(3'h5):(3'h4)])))
        begin
          reg42 <= reg20[(3'h4):(3'h4)];
          reg43 <= (reg15 >> $signed($signed(reg15)));
          reg44 <= (reg23[(2'h3):(2'h3)] < (reg38 < ((&$signed(reg21)) >= $unsigned({wire10,
              wire9}))));
          reg45 <= {(8'h9d)};
          reg46 <= (reg32[(4'h8):(2'h3)] ? reg21 : reg42);
        end
      else
        begin
          reg42 <= $unsigned((^~$signed((+(^~reg43)))));
          if ($unsigned($signed((&($unsigned((8'ha6)) - {reg19, (8'hbf)})))))
            begin
              reg43 <= {{$signed(((~&wire11) ?
                          $signed(reg44) : ((8'haa) ? reg22 : reg23))),
                      $unsigned(reg19)}};
              reg44 <= reg20;
              reg45 <= $signed($signed(wire11[(1'h0):(1'h0)]));
              reg46 <= $unsigned(($unsigned(reg40) >= ({reg25,
                  (reg37 ? reg27 : reg17)} ^~ reg17[(4'hf):(3'h4)])));
            end
          else
            begin
              reg43 <= $signed(reg39[(4'h9):(2'h3)]);
              reg44 <= (reg25[(2'h3):(1'h1)] <<< {($unsigned(reg42) | $unsigned({reg12,
                      reg31})),
                  ($signed(reg27[(1'h0):(1'h0)]) >> (reg42[(4'h9):(4'h9)] & (~^reg16)))});
              reg45 <= reg45;
              reg46 <= ((+(~$unsigned(reg16))) ?
                  reg34[(3'h6):(1'h0)] : (-($signed((^~wire10)) ?
                      reg40 : (reg15[(3'h6):(2'h3)] ?
                          $signed((7'h40)) : $signed((8'ha1))))));
              reg47 <= $unsigned((reg18[(3'h4):(2'h2)] < ({$signed(reg33)} ?
                  ($signed((8'hb2)) ?
                      (8'hb1) : $unsigned(reg13)) : $unsigned(wire35))));
            end
        end
    end
  assign wire48 = {reg45[(4'hb):(3'h4)]};
  assign wire49 = $unsigned($unsigned(((-$unsigned(reg34)) ~^ (~{reg21}))));
  assign wire50 = {(($unsigned((-reg45)) ?
                              $unsigned((~^wire11)) : (-(~reg42))) ?
                          $signed($unsigned({reg32, reg13})) : (reg19 ?
                              $signed($signed((8'hba))) : $unsigned($signed((8'ha3)))))};
  assign wire51 = $unsigned((^$unsigned((^$signed(reg16)))));
  assign wire52 = (((8'hae) || $signed(wire50)) * $signed(wire35[(3'h7):(3'h6)]));
  assign wire53 = $signed($unsigned($unsigned($signed((reg40 ^ reg30)))));
  always
    @(posedge clk) begin
      reg54 <= (((reg29[(3'h4):(2'h3)] >= (reg37[(3'h4):(1'h0)] != reg17[(3'h7):(2'h2)])) ?
          reg34 : wire9[(1'h0):(1'h0)]) | $signed(($unsigned(reg36[(3'h6):(3'h4)]) * {(&reg38),
          reg24})));
      reg55 <= (&$unsigned((~&reg16[(3'h6):(1'h1)])));
      if (reg46)
        begin
          if ({$unsigned(($unsigned((wire51 ~^ reg46)) ?
                  reg31[(2'h2):(1'h1)] : (|reg27[(2'h2):(1'h1)])))})
            begin
              reg56 <= $signed({(8'hb9)});
              reg57 <= {(^(($unsigned(wire48) ?
                      reg40[(1'h1):(1'h1)] : (reg17 + reg39)) * wire8[(1'h1):(1'h0)])),
                  (!reg13)};
              reg58 <= $signed($unsigned((wire8[(2'h3):(2'h2)] | $signed((reg12 <= reg15)))));
            end
          else
            begin
              reg56 <= (wire8 == (~^(((wire52 <= reg25) ?
                      (-(8'hb1)) : $unsigned((8'ha9))) ?
                  (reg33[(4'ha):(2'h2)] ?
                      wire9 : reg54[(1'h1):(1'h0)]) : {(8'hbd)})));
              reg57 <= (((!(|wire7)) < (~|wire53)) ?
                  $unsigned(wire49[(2'h3):(1'h1)]) : ({$unsigned($unsigned((8'ha5)))} * $signed((wire35 == $unsigned(wire52)))));
            end
          reg59 <= {$unsigned(reg26[(3'h7):(3'h5)]),
              ($signed((reg30 ?
                  $unsigned(wire48) : reg14)) & ((7'h43) >> (reg20 ^~ wire52)))};
          reg60 <= (-$signed($signed((8'hbd))));
        end
      else
        begin
          reg56 <= $unsigned(reg18[(3'h6):(3'h4)]);
          reg57 <= $unsigned(($unsigned((+reg20[(3'h4):(3'h4)])) ?
              reg33 : (~|$unsigned($signed(reg14)))));
          reg58 <= reg42;
        end
    end
  assign wire61 = $unsigned((-$unsigned(({reg22, reg18} ?
                      $signed(reg47) : (reg28 ? reg56 : wire50)))));
  always
    @(posedge clk) begin
      reg62 <= reg29[(3'h6):(2'h3)];
    end
  assign wire63 = (&$signed(reg30));
  assign wire64 = (~&((!{(wire35 ? (8'h9e) : reg21),
                      (reg56 < reg62)}) * ($signed((~&wire8)) || wire9)));
  assign wire65 = {(-$signed((reg38[(1'h1):(1'h1)] ?
                          $unsigned(reg19) : $signed(reg21))))};
  assign wire66 = $unsigned(((reg44[(1'h1):(1'h1)] ?
                          $unsigned({wire8, reg45}) : $unsigned((^~reg62))) ?
                      wire8 : reg55[(2'h2):(1'h0)]));
  assign wire67 = $signed($unsigned(reg46));
  assign wire68 = $unsigned({$unsigned(reg18),
                      (reg12 ?
                          ($unsigned((8'ha1)) > {reg36,
                              reg58}) : ((reg59 <= wire11) ?
                              (+reg26) : (~reg13)))});
endmodule
