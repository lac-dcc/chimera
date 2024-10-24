module top
#(parameter param174 = ((-(8'ha3)) ? {(~|(~^(-(8'hbd)))), (~&(((8'hbd) | (8'hb3)) >> ((8'h9e) ? (8'hba) : (8'ha8))))} : (8'h9c)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h264):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire173;
  wire [(4'h9):(1'h0)] wire172;
  wire [(3'h6):(1'h0)] wire170;
  wire signed [(4'hf):(1'h0)] wire105;
  wire [(2'h3):(1'h0)] wire104;
  wire signed [(2'h2):(1'h0)] wire103;
  wire signed [(4'hd):(1'h0)] wire102;
  wire signed [(4'hc):(1'h0)] wire101;
  wire [(3'h5):(1'h0)] wire100;
  wire [(3'h7):(1'h0)] wire99;
  wire signed [(5'h12):(1'h0)] wire87;
  wire signed [(5'h13):(1'h0)] wire85;
  wire signed [(4'h8):(1'h0)] wire32;
  wire signed [(3'h4):(1'h0)] wire31;
  wire [(5'h12):(1'h0)] wire30;
  wire signed [(4'ha):(1'h0)] wire29;
  wire signed [(2'h2):(1'h0)] wire28;
  wire [(5'h10):(1'h0)] wire27;
  wire signed [(3'h7):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  reg [(3'h5):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg88 = (1'h0);
  reg [(4'hf):(1'h0)] reg89 = (1'h0);
  reg [(4'ha):(1'h0)] reg90 = (1'h0);
  reg [(3'h5):(1'h0)] reg91 = (1'h0);
  reg [(5'h15):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg94 = (1'h0);
  reg [(5'h14):(1'h0)] reg95 = (1'h0);
  reg [(5'h13):(1'h0)] reg96 = (1'h0);
  reg [(4'he):(1'h0)] reg97 = (1'h0);
  reg [(4'hd):(1'h0)] reg98 = (1'h0);
  assign y = {wire173,
                 wire172,
                 wire170,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire87,
                 wire85,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire6,
                 wire5,
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
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 (1'h0)};
  assign wire5 = $signed((wire0 & wire3[(1'h0):(1'h0)]));
  assign wire6 = $unsigned(($signed({(wire0 ?
                         wire2 : wire2)}) == ((wire2[(2'h3):(2'h3)] ?
                     (^wire4) : (-wire2)) <= wire0[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg7 <= wire1[(5'h14):(3'h6)];
      if (wire0)
        begin
          reg8 <= (-((~wire5) ?
              (wire5 | wire3) : ($signed((wire3 ? wire5 : wire2)) ?
                  wire4[(1'h1):(1'h0)] : $signed($unsigned(wire2)))));
          reg9 <= (|(((wire0 - (~&wire0)) | (((8'hbb) ? wire2 : wire4) ?
              $signed(reg8) : $signed(wire5))) != ((reg8[(1'h1):(1'h0)] ?
              (-reg8) : $unsigned(wire2)) <<< $unsigned(wire4[(4'h9):(1'h1)]))));
          if (wire1[(5'h13):(5'h10)])
            begin
              reg10 <= wire4;
              reg11 <= $unsigned(wire1);
            end
          else
            begin
              reg10 <= (8'hba);
              reg11 <= ($signed($unsigned((!wire4[(4'hb):(1'h0)]))) ?
                  (reg8[(1'h0):(1'h0)] || wire5) : (wire3[(1'h0):(1'h0)] ?
                      $unsigned(((reg9 - reg10) ?
                          wire6[(3'h6):(1'h1)] : wire2)) : $signed(($signed(reg7) ?
                          $unsigned(wire1) : $signed(wire4)))));
            end
          if ($signed((&{wire2[(1'h0):(1'h0)]})))
            begin
              reg12 <= wire6[(3'h5):(1'h0)];
            end
          else
            begin
              reg12 <= {$signed($signed(reg10[(4'ha):(2'h2)]))};
              reg13 <= $unsigned($signed($signed(($unsigned(wire5) ^ $unsigned(reg8)))));
              reg14 <= $unsigned((8'hb2));
            end
        end
      else
        begin
          reg8 <= reg8;
        end
    end
  always
    @(posedge clk) begin
      reg15 <= (reg13 ?
          ($signed((~|wire5)) ?
              {(-{wire3,
                      reg11})} : (|$signed((wire5 ^~ (7'h40))))) : wire1[(4'hd):(3'h6)]);
      reg16 <= (&wire4);
      reg17 <= (($signed(wire4[(3'h6):(3'h5)]) ?
          (&((wire2 - wire6) == wire3[(2'h2):(1'h0)])) : {$unsigned(reg9),
              (^(8'hb8))}) < $signed((~^$unsigned({reg16}))));
      if (wire2[(2'h2):(2'h2)])
        begin
          if (reg15[(1'h1):(1'h1)])
            begin
              reg18 <= wire1;
            end
          else
            begin
              reg18 <= (~|($signed((-(wire2 && reg16))) ?
                  (!(!$unsigned(reg13))) : $signed(({reg11, reg16} ?
                      $signed(reg8) : (wire1 ? wire1 : wire5)))));
              reg19 <= $signed(wire3);
              reg20 <= $signed($unsigned((^(reg13[(1'h0):(1'h0)] != $signed(reg14)))));
            end
          reg21 <= $unsigned($signed((~^$unsigned($signed(reg17)))));
          reg22 <= reg15[(5'h11):(4'h9)];
        end
      else
        begin
          reg18 <= (~&$unsigned((^~{(wire5 >= wire2)})));
          if ({$signed($unsigned((reg8[(3'h4):(1'h0)] & reg12)))})
            begin
              reg19 <= wire1[(2'h3):(1'h1)];
              reg20 <= $signed(reg10);
              reg21 <= reg11;
            end
          else
            begin
              reg19 <= {(8'hac), ($unsigned(wire0[(2'h2):(2'h2)]) + reg16)};
              reg20 <= (~|$signed({((^~(7'h42)) ? $signed(wire2) : (+wire4)),
                  $unsigned(reg21)}));
              reg21 <= (((~|$signed(reg20)) ?
                      reg10[(4'he):(3'h5)] : ((reg22[(3'h4):(2'h3)] ?
                              $signed((8'ha6)) : (reg16 ? reg8 : wire0)) ?
                          $signed($unsigned((8'hac))) : (~{wire5}))) ?
                  $unsigned((~&($signed(wire6) ?
                      ((8'h9e) ?
                          reg18 : wire2) : $unsigned(reg10)))) : reg8[(1'h0):(1'h0)]);
            end
          if ((reg19 - (8'hac)))
            begin
              reg22 <= ($unsigned((reg18 && $unsigned({reg8, wire6}))) ?
                  (reg9 ?
                      (^reg15) : {reg11,
                          wire0}) : ($signed((reg14[(5'h11):(3'h4)] < (reg21 ?
                          reg18 : (8'hb9)))) ?
                      (~|(~^{reg8})) : $unsigned(($signed(wire4) != (reg21 << reg21)))));
              reg23 <= reg22[(2'h2):(2'h2)];
              reg24 <= $signed((wire6[(3'h7):(3'h6)] <<< wire1[(5'h15):(5'h12)]));
              reg25 <= reg11;
              reg26 <= $unsigned((~^$signed(reg9)));
            end
          else
            begin
              reg22 <= (~|(wire0 >= (reg16[(2'h2):(1'h1)] ?
                  $unsigned((reg19 ? reg22 : reg20)) : ($unsigned(reg22) ?
                      $signed(reg15) : $unsigned((8'hb9))))));
            end
        end
    end
  assign wire27 = wire6[(3'h5):(1'h0)];
  assign wire28 = $signed((~|(($signed(reg23) != (reg21 ? reg16 : (8'hb0))) ?
                      ($signed((8'hb1)) ?
                          $signed(reg18) : reg19[(2'h3):(1'h0)]) : reg10)));
  assign wire29 = ((^($signed(reg10) ?
                          ((reg12 || reg26) || reg11) : reg12[(2'h3):(1'h1)])) ?
                      (reg19 ?
                          $unsigned(reg8) : reg7[(2'h2):(1'h0)]) : (7'h43));
  assign wire30 = (reg23[(1'h0):(1'h0)] ? (8'h9f) : wire0);
  assign wire31 = (reg15 >= reg11[(3'h6):(3'h6)]);
  assign wire32 = ((-{($signed(reg18) ? ((8'ha9) || wire2) : (^~reg22))}) ?
                      $unsigned(reg22) : (&$unsigned(((reg18 | reg8) ?
                          $unsigned(reg11) : reg14))));
  module33 #() modinst86 (wire85, clk, wire4, reg13, reg14, wire30);
  assign wire87 = (wire3 + ((wire0 > $signed((wire4 * wire30))) << $unsigned({{reg20}})));
  always
    @(posedge clk) begin
      reg88 <= (~^reg7[(2'h2):(1'h0)]);
      if (wire32)
        begin
          reg89 <= (&reg21);
          if (reg15)
            begin
              reg90 <= $unsigned(wire27);
            end
          else
            begin
              reg90 <= wire4;
              reg91 <= (reg10[(3'h4):(2'h3)] ?
                  {{({reg89, wire29} ? wire30 : (reg90 * reg24)),
                          {(8'hba), ((8'hbf) || reg16)}}} : (~&($signed(reg19) ?
                      reg88 : (-((8'ha6) * reg25)))));
              reg92 <= (~|reg24[(4'hd):(4'hb)]);
              reg93 <= wire32;
            end
          if ($unsigned((~&reg15[(5'h12):(5'h10)])))
            begin
              reg94 <= ({reg8} <= $signed(reg25));
              reg95 <= reg21;
            end
          else
            begin
              reg94 <= $signed(reg91);
              reg95 <= wire31;
            end
          reg96 <= {(~^reg12[(1'h0):(1'h0)]),
              $signed(((~&{reg95, reg17}) >>> (reg15[(4'hd):(3'h6)] ?
                  (&wire6) : reg19[(2'h3):(1'h0)])))};
        end
      else
        begin
          reg89 <= (~($signed(($signed(reg19) ?
              (reg91 | reg10) : (reg88 <= wire3))) >= reg20));
          if ($signed((|$unsigned($unsigned($signed(wire27))))))
            begin
              reg90 <= ((+$unsigned(reg21[(3'h6):(3'h5)])) >>> (^~$unsigned($signed($signed(wire30)))));
              reg91 <= {(~(wire29[(3'h6):(3'h5)] <<< {$signed(wire30)}))};
              reg92 <= $signed((~|wire27));
              reg93 <= {reg96, wire6};
            end
          else
            begin
              reg90 <= $signed((-reg94[(3'h5):(2'h2)]));
              reg91 <= reg17;
              reg92 <= reg7[(2'h3):(1'h0)];
              reg93 <= ($unsigned(wire85) ^ ($unsigned($unsigned($unsigned(reg13))) == ($signed((reg8 - reg17)) * wire6)));
              reg94 <= wire30[(2'h2):(2'h2)];
            end
          reg95 <= reg91;
          reg96 <= reg20[(3'h6):(2'h3)];
        end
      reg97 <= $unsigned((reg93 | wire29[(3'h5):(3'h4)]));
      if ((~^$signed((^(&(wire2 ? reg9 : reg17))))))
        begin
          reg98 <= wire0[(1'h1):(1'h1)];
        end
      else
        begin
          reg98 <= reg16;
        end
    end
  assign wire99 = $unsigned((wire28[(1'h1):(1'h0)] * $unsigned((+$signed(wire85)))));
  assign wire100 = $unsigned($signed(((~&(-wire30)) > (-(^wire2)))));
  assign wire101 = $unsigned($signed($signed((8'h9e))));
  assign wire102 = (((|(^wire0[(2'h2):(1'h1)])) & reg25) ?
                       (((reg23 >> (&reg9)) ? reg88 : wire4) ?
                           (&$unsigned($unsigned(reg97))) : reg13[(4'h9):(3'h7)]) : (8'hb0));
  assign wire103 = (reg14 >>> $unsigned(($signed({wire101}) ?
                       wire87[(4'ha):(2'h2)] : (-$unsigned(reg91)))));
  assign wire104 = $unsigned(wire27);
  assign wire105 = (($signed(wire30[(3'h5):(1'h0)]) ?
                           $unsigned(wire1[(1'h0):(1'h0)]) : reg92[(4'h8):(3'h7)]) ?
                       (~|wire85[(4'hb):(4'ha)]) : (~&$signed(reg25[(4'he):(4'hb)])));
  module106 #() modinst171 (wire170, clk, reg92, reg89, wire102, reg7, wire3);
  assign wire172 = wire30;
  assign wire173 = {(+(|{wire2[(1'h1):(1'h1)]})),
                       $signed((reg24[(4'hf):(4'hb)] ?
                           reg97 : reg98[(4'hc):(3'h6)]))};
endmodule

module module106
#(parameter param169 = {{((((8'ha2) != (8'h9e)) ? {(8'hba), (8'ha2)} : (~^(8'hb1))) ? ((~|(8'ha5)) > {(8'hbe), (7'h41)}) : ((&(8'hbb)) << (!(8'hac))))}})
(y, clk, wire107, wire108, wire109, wire110, wire111);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire107;
  input wire [(4'hf):(1'h0)] wire108;
  input wire [(3'h7):(1'h0)] wire109;
  input wire signed [(4'hc):(1'h0)] wire110;
  input wire signed [(4'hf):(1'h0)] wire111;
  wire [(5'h12):(1'h0)] wire163;
  wire signed [(5'h14):(1'h0)] wire162;
  wire [(4'h9):(1'h0)] wire161;
  wire signed [(4'hd):(1'h0)] wire160;
  wire signed [(3'h7):(1'h0)] wire159;
  wire [(5'h13):(1'h0)] wire158;
  wire [(5'h14):(1'h0)] wire115;
  wire signed [(3'h6):(1'h0)] wire116;
  wire signed [(2'h2):(1'h0)] wire156;
  reg [(5'h15):(1'h0)] reg168 = (1'h0);
  reg [(4'he):(1'h0)] reg167 = (1'h0);
  reg [(4'h8):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg165 = (1'h0);
  reg [(4'hc):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg114 = (1'h0);
  reg [(5'h11):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg112 = (1'h0);
  assign y = {wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire115,
                 wire116,
                 wire156,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg114,
                 reg113,
                 reg112,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg112 <= (((8'hbd) != (8'hb6)) ~^ wire107[(4'hd):(3'h7)]);
      reg113 <= ($unsigned(wire107) ?
          $unsigned(((~^wire111) ~^ wire110)) : (^~$unsigned(wire107[(2'h3):(2'h2)])));
      reg114 <= (~wire108[(4'hd):(2'h2)]);
    end
  assign wire115 = $signed(({{wire109, $unsigned(wire111)}, (8'hac)} ?
                       $signed({(!wire109)}) : reg114[(2'h2):(1'h0)]));
  assign wire116 = $unsigned((~&{(|$unsigned(wire110)),
                       (((8'hbc) ?
                           wire107 : wire107) == wire115[(4'h9):(3'h6)])}));
  module117 #() modinst157 (.wire119(reg113), .clk(clk), .wire121(reg114), .wire122(wire107), .y(wire156), .wire120(wire115), .wire118(wire110));
  assign wire158 = (wire108 ?
                       wire109[(2'h2):(1'h0)] : (^~$signed(wire110[(4'h8):(1'h1)])));
  assign wire159 = ({($signed(wire107) ?
                           ($signed((8'hb5)) ?
                               wire111 : {wire158,
                                   wire108}) : ($signed(wire111) ?
                               (^wire109) : (+wire115)))} < ((~^$signed((wire108 | reg113))) ^~ (!wire115)));
  assign wire160 = reg113[(4'ha):(4'ha)];
  assign wire161 = wire160[(4'hb):(1'h1)];
  assign wire162 = ($unsigned((~^(!$unsigned(reg112)))) << (~^$signed((~|(7'h40)))));
  assign wire163 = (~^($unsigned(wire158) ?
                       wire108[(3'h7):(3'h7)] : wire116[(3'h6):(3'h4)]));
  always
    @(posedge clk) begin
      if (((wire109 ?
              $unsigned($signed((wire159 != wire162))) : (~|$signed((8'hb1)))) ?
          $unsigned((wire160 ?
              $unsigned($signed(wire108)) : (~^(wire158 || wire156)))) : (&wire110[(3'h5):(3'h4)])))
        begin
          reg164 <= wire158[(3'h5):(2'h2)];
        end
      else
        begin
          reg164 <= wire156[(1'h0):(1'h0)];
        end
      reg165 <= ((8'hb1) & {(reg164 <<< ((wire162 ?
              wire159 : wire116) <= reg113))});
      reg166 <= wire161[(2'h2):(2'h2)];
      reg167 <= (8'h9c);
      reg168 <= (~|$signed(wire110[(3'h7):(1'h0)]));
    end
endmodule

module module33
#(parameter param83 = (-(^~((8'haf) >>> (((8'hba) < (8'hac)) | ((8'h9f) ? (8'ha5) : (7'h41)))))), 
parameter param84 = {{(((param83 ? param83 : param83) >>> {(8'hab), param83}) - (((7'h40) && (8'hbe)) ? (param83 ? param83 : param83) : (~param83))), (((param83 ? param83 : (8'hae)) ? (~^param83) : param83) == (param83 ? param83 : {param83}))}})
(y, clk, wire37, wire36, wire35, wire34);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire37;
  input wire [(2'h3):(1'h0)] wire36;
  input wire [(4'hc):(1'h0)] wire35;
  input wire [(5'h12):(1'h0)] wire34;
  wire signed [(2'h3):(1'h0)] wire82;
  wire signed [(4'hd):(1'h0)] wire77;
  wire [(4'h9):(1'h0)] wire76;
  wire [(4'he):(1'h0)] wire74;
  wire [(4'h9):(1'h0)] wire41;
  wire [(5'h11):(1'h0)] wire40;
  wire signed [(5'h14):(1'h0)] wire39;
  wire signed [(4'hf):(1'h0)] wire38;
  reg signed [(3'h6):(1'h0)] reg81 = (1'h0);
  reg [(2'h3):(1'h0)] reg80 = (1'h0);
  reg [(4'hb):(1'h0)] reg79 = (1'h0);
  reg [(4'ha):(1'h0)] reg78 = (1'h0);
  assign y = {wire82,
                 wire77,
                 wire76,
                 wire74,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 (1'h0)};
  assign wire38 = {(~^$signed(wire36))};
  assign wire39 = ($unsigned((($unsigned(wire38) ~^ wire36) ?
                          wire38[(1'h0):(1'h0)] : wire35)) ?
                      wire38 : $unsigned({$signed($unsigned(wire34))}));
  assign wire40 = (^(((^(wire35 ? wire34 : wire37)) ?
                          $signed((8'hb9)) : $signed((wire34 && wire35))) ?
                      wire36 : ($signed((8'haa)) & ((^~wire35) ?
                          wire35[(4'hb):(3'h7)] : $unsigned(wire38)))));
  assign wire41 = wire36[(1'h0):(1'h0)];
  module42 #() modinst75 (.wire46(wire37), .y(wire74), .wire43(wire40), .clk(clk), .wire44(wire34), .wire45(wire41));
  assign wire76 = wire40;
  assign wire77 = $unsigned(wire39);
  always
    @(posedge clk) begin
      if ((8'hbb))
        begin
          reg78 <= (&(~^$unsigned({{wire38, wire37}, (wire74 >>> wire36)})));
        end
      else
        begin
          if ((wire41[(2'h2):(1'h1)] == (8'ha2)))
            begin
              reg78 <= $signed($signed(wire40));
              reg79 <= $unsigned($signed(wire74));
              reg80 <= wire76[(2'h3):(2'h2)];
            end
          else
            begin
              reg78 <= (((^(~^wire39)) ?
                      $signed(((wire38 ^ (8'ha7)) ?
                          $unsigned((7'h40)) : (~^wire38))) : $unsigned({((8'h9f) ?
                              reg78 : (8'hbd))})) ?
                  $unsigned(wire36[(2'h2):(1'h1)]) : (^(!wire34[(4'hc):(3'h7)])));
              reg79 <= ((wire76[(4'h8):(1'h1)] ^ wire77) >>> $signed(wire34[(4'ha):(1'h1)]));
            end
          reg81 <= {(!$unsigned($unsigned({(8'ha6)})))};
        end
    end
  assign wire82 = ((((reg79 | $unsigned(wire40)) ?
                              $signed(reg79[(4'h8):(3'h6)]) : $signed($unsigned(wire37))) ?
                          wire77[(2'h2):(1'h1)] : (wire41[(2'h2):(1'h1)] * $signed((!wire34)))) ?
                      $unsigned(wire40[(4'h9):(1'h0)]) : (~&wire35[(4'hb):(3'h5)]));
endmodule

module module42
#(parameter param73 = (({(8'ha1)} ? {(((8'hbf) ? (7'h42) : (8'ha3)) ? (8'haa) : ((8'h9c) == (7'h41)))} : ((((8'hb0) ? (8'hb0) : (8'hb2)) > {(8'h9e), (8'ha5)}) && {((8'haf) <<< (7'h44))})) ? ((8'h9d) ? ({(!(8'hac)), {(8'hbb)}} + (~|((8'hab) ? (8'hb8) : (8'hb8)))) : (~^((~&(7'h43)) ? {(8'had), (8'hb7)} : ((8'hb2) ? (7'h44) : (8'haa))))) : (((^((8'haa) + (8'hb7))) && (((8'hbc) ? (7'h40) : (7'h44)) - ((8'ha6) << (8'hb6)))) & (^~{(|(8'hac))}))))
(y, clk, wire46, wire45, wire44, wire43);
  output wire [(32'h108):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire46;
  input wire signed [(2'h3):(1'h0)] wire45;
  input wire signed [(5'h12):(1'h0)] wire44;
  input wire signed [(5'h11):(1'h0)] wire43;
  wire [(4'hc):(1'h0)] wire72;
  wire [(2'h2):(1'h0)] wire71;
  wire [(4'hb):(1'h0)] wire58;
  wire signed [(3'h6):(1'h0)] wire57;
  wire [(4'hb):(1'h0)] wire56;
  wire [(4'hf):(1'h0)] wire55;
  wire [(4'h8):(1'h0)] wire54;
  wire [(5'h12):(1'h0)] wire53;
  wire signed [(3'h7):(1'h0)] wire52;
  wire [(3'h5):(1'h0)] wire51;
  wire signed [(5'h13):(1'h0)] wire50;
  wire [(3'h4):(1'h0)] wire49;
  wire [(3'h7):(1'h0)] wire48;
  wire signed [(2'h2):(1'h0)] wire47;
  reg signed [(4'hd):(1'h0)] reg70 = (1'h0);
  reg [(5'h14):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg66 = (1'h0);
  reg [(5'h12):(1'h0)] reg65 = (1'h0);
  reg [(4'h8):(1'h0)] reg64 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg63 = (1'h0);
  reg [(2'h3):(1'h0)] reg62 = (1'h0);
  reg [(3'h5):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg59 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
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
                 (1'h0)};
  assign wire47 = (8'haa);
  assign wire48 = (~&wire47);
  assign wire49 = (~|(-wire44));
  assign wire50 = $signed((wire44 ^ ({(^wire48)} ?
                      $signed((8'hb2)) : (8'ha1))));
  assign wire51 = (-wire43);
  assign wire52 = wire47[(1'h1):(1'h0)];
  assign wire53 = wire50[(4'hf):(4'hd)];
  assign wire54 = ((wire45 == $signed(wire48)) << (~((^$signed(wire53)) ?
                      ((&wire50) ^~ wire48[(2'h2):(1'h0)]) : wire45[(1'h0):(1'h0)])));
  assign wire55 = $signed((wire43 ?
                      (8'ha3) : ((~|$unsigned(wire51)) ?
                          $signed(wire47) : {{wire54, wire53},
                              (wire51 < (8'ha2))})));
  assign wire56 = wire49;
  assign wire57 = $unsigned($signed((^~wire52)));
  assign wire58 = $signed((~&$unsigned((wire45[(1'h1):(1'h1)] ?
                      (!wire52) : wire49))));
  always
    @(posedge clk) begin
      reg59 <= {$signed($signed(wire53[(2'h2):(1'h0)]))};
      reg60 <= {wire44[(5'h12):(2'h3)]};
      if ((!$signed(((wire48 ? wire53 : $unsigned(reg60)) == wire48))))
        begin
          if ($unsigned(((~&((wire43 >>> wire49) ?
              (-wire57) : $signed(reg59))) ^ (^~(~^((8'hbf) >= wire57))))))
            begin
              reg61 <= ((~&(7'h41)) ?
                  (wire44 ?
                      ($signed(wire47) ^~ {(wire49 >> wire57)}) : (wire44 ?
                          ((wire51 ?
                              wire54 : wire47) - (8'hb3)) : wire48)) : ($unsigned($unsigned(wire45[(2'h3):(2'h2)])) ~^ wire46[(3'h7):(1'h1)]));
              reg62 <= (&(wire51 <<< wire50));
              reg63 <= {reg60[(2'h2):(1'h0)]};
              reg64 <= ({$unsigned(wire52)} ? wire58 : $unsigned(wire53));
              reg65 <= $unsigned($signed((~^(wire43[(4'hf):(4'ha)] ^ reg61[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg61 <= $unsigned(wire58[(1'h0):(1'h0)]);
            end
          if ({$signed((~&($unsigned(wire49) << $unsigned(reg61)))),
              (!{(wire51 ? $unsigned(reg62) : wire46[(4'h8):(3'h6)]),
                  (^~$unsigned(wire44))})})
            begin
              reg66 <= wire57;
              reg67 <= reg64[(1'h1):(1'h1)];
              reg68 <= wire48;
            end
          else
            begin
              reg66 <= ({(+wire47),
                      {(wire47 >= reg60),
                          ({wire47} ? (-reg61) : (reg64 ? reg68 : wire48))}} ?
                  {($unsigned($signed(reg60)) ?
                          wire45 : wire50[(4'he):(2'h3)])} : reg66[(1'h0):(1'h0)]);
              reg67 <= wire43;
              reg68 <= $unsigned(wire46[(1'h0):(1'h0)]);
            end
        end
      else
        begin
          if ((~(^~(!wire44[(3'h7):(2'h3)]))))
            begin
              reg61 <= ((^~(!((^~(7'h42)) << $signed(wire57)))) >= wire54);
              reg62 <= {(~^reg64[(3'h7):(1'h1)]), wire43[(5'h10):(4'he)]};
              reg63 <= ((($signed(wire48) ?
                      ($unsigned(reg68) ?
                          (wire47 <<< (8'hb8)) : (wire45 >= wire56)) : $signed($unsigned(wire47))) ~^ wire52) ?
                  wire53[(4'hc):(1'h1)] : ($unsigned($signed($signed(wire53))) ?
                      $unsigned($unsigned($unsigned(wire49))) : wire43[(4'hb):(1'h1)]));
            end
          else
            begin
              reg61 <= (wire44 ? wire46 : $signed({reg65[(4'h9):(4'h8)]}));
              reg62 <= wire47[(1'h1):(1'h1)];
              reg63 <= $unsigned((^~((~&wire43) ?
                  (8'hac) : wire52[(3'h4):(2'h3)])));
              reg64 <= $unsigned(((wire53[(4'h9):(4'h9)] ?
                  reg68 : $signed((wire58 * reg68))) ^ (-$unsigned($unsigned(wire49)))));
              reg65 <= (wire57[(2'h2):(1'h0)] ?
                  (~&($signed(reg68[(4'hb):(4'h9)]) ^~ $signed(wire58[(3'h7):(2'h2)]))) : {wire58[(3'h5):(3'h5)]});
            end
          if ($signed($signed(wire46)))
            begin
              reg66 <= {((!((wire52 >= reg62) & $unsigned(wire54))) - $unsigned($signed(wire56)))};
              reg67 <= $signed(wire56[(4'ha):(2'h2)]);
            end
          else
            begin
              reg66 <= (~|reg68);
            end
        end
      reg69 <= {{$signed((((8'hba) ? wire52 : wire52) && $signed(wire43))),
              reg59[(3'h6):(1'h1)]}};
      reg70 <= (($unsigned($signed(reg60[(4'he):(3'h6)])) & $signed((^~(reg68 ?
          reg63 : wire49)))) - reg63);
    end
  assign wire71 = ($signed((!$signed(wire44[(4'he):(4'he)]))) ?
                      $signed(reg62) : reg65[(4'hf):(3'h6)]);
  assign wire72 = (~&(+(($unsigned((8'hb8)) & $unsigned(reg68)) ?
                      wire56[(4'ha):(3'h6)] : $signed((~^wire47)))));
endmodule

module module117
#(parameter param155 = {(((|((8'hbf) > (8'ha0))) ? (((8'had) ? (8'hb1) : (8'ha1)) + ((8'hbf) ? (8'h9c) : (7'h41))) : ({(8'hb6)} ? (~^(8'haf)) : {(8'h9e)})) ? (((8'hb4) ? ((8'h9d) <= (8'ha3)) : (-(8'ha3))) ? (~^(~^(7'h44))) : (&(^(8'hbb)))) : ((((8'hb2) ? (8'ha8) : (8'h9c)) ? (7'h44) : ((8'hba) || (8'hb4))) ~^ (((8'ha8) ? (8'hb3) : (8'haf)) ? {(8'hbe), (8'h9c)} : {(8'hb9), (8'h9e)})))})
(y, clk, wire122, wire121, wire120, wire119, wire118);
  output wire [(32'h141):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire122;
  input wire [(4'hd):(1'h0)] wire121;
  input wire [(5'h14):(1'h0)] wire120;
  input wire signed [(5'h10):(1'h0)] wire119;
  input wire signed [(2'h3):(1'h0)] wire118;
  wire [(4'h9):(1'h0)] wire154;
  wire signed [(2'h3):(1'h0)] wire153;
  wire [(5'h10):(1'h0)] wire143;
  wire signed [(3'h4):(1'h0)] wire142;
  wire signed [(5'h15):(1'h0)] wire141;
  wire [(4'hd):(1'h0)] wire130;
  wire signed [(4'he):(1'h0)] wire129;
  wire signed [(3'h6):(1'h0)] wire124;
  wire signed [(5'h13):(1'h0)] wire123;
  reg signed [(2'h3):(1'h0)] reg152 = (1'h0);
  reg [(2'h3):(1'h0)] reg151 = (1'h0);
  reg [(3'h4):(1'h0)] reg150 = (1'h0);
  reg [(5'h10):(1'h0)] reg149 = (1'h0);
  reg [(5'h11):(1'h0)] reg148 = (1'h0);
  reg [(3'h7):(1'h0)] reg147 = (1'h0);
  reg [(5'h10):(1'h0)] reg146 = (1'h0);
  reg [(4'hb):(1'h0)] reg145 = (1'h0);
  reg [(4'h8):(1'h0)] reg144 = (1'h0);
  reg [(2'h2):(1'h0)] reg140 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg138 = (1'h0);
  reg [(4'ha):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg136 = (1'h0);
  reg [(2'h2):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg134 = (1'h0);
  reg [(4'ha):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg132 = (1'h0);
  reg [(4'h8):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg128 = (1'h0);
  reg [(4'ha):(1'h0)] reg127 = (1'h0);
  reg [(4'hd):(1'h0)] reg126 = (1'h0);
  reg [(4'he):(1'h0)] reg125 = (1'h0);
  assign y = {wire154,
                 wire153,
                 wire143,
                 wire142,
                 wire141,
                 wire130,
                 wire129,
                 wire124,
                 wire123,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
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
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 (1'h0)};
  assign wire123 = ((wire119[(1'h1):(1'h1)] ?
                           $unsigned({wire121[(3'h5):(3'h4)]}) : (~^((~^wire122) ?
                               $unsigned((8'ha4)) : $unsigned((8'ha5))))) ?
                       $signed(wire119) : wire118);
  assign wire124 = ({wire123[(4'hc):(1'h1)]} ?
                       (~&($signed((wire119 ?
                           wire122 : (8'hb0))) ~^ (|$unsigned((8'hb1))))) : {$signed((~(|wire118)))});
  always
    @(posedge clk) begin
      reg125 <= (!$signed($signed((wire124 ?
          (wire118 ? (8'h9c) : (8'h9c)) : wire119[(2'h3):(2'h3)]))));
      reg126 <= {$unsigned(wire124)};
    end
  always
    @(posedge clk) begin
      reg127 <= wire123[(4'h8):(3'h4)];
      reg128 <= $signed((^~({(&wire122), $signed(wire120)} ?
          reg127 : (reg126 ? (wire122 > (8'ha2)) : $unsigned(wire124)))));
    end
  assign wire129 = $signed({$unsigned(((~&wire121) ?
                           reg126 : (reg128 - wire122)))});
  assign wire130 = wire124;
  always
    @(posedge clk) begin
      reg131 <= (7'h42);
      reg132 <= wire122;
    end
  always
    @(posedge clk) begin
      if (($unsigned((|reg126)) || $signed(wire124)))
        begin
          reg133 <= $unsigned($signed($unsigned($unsigned($signed(wire119)))));
          reg134 <= (|wire121[(2'h3):(2'h2)]);
          reg135 <= $signed(reg131);
          reg136 <= {((reg135 && (reg127 ?
                      wire121[(4'hd):(4'h9)] : $signed(wire120))) ?
                  $unsigned($signed($unsigned((8'hb4)))) : ({(reg128 <= wire120),
                      wire130[(2'h2):(1'h1)]} ^ ((reg131 & wire123) ?
                      $signed(wire121) : (wire121 <= reg126))))};
        end
      else
        begin
          if ((+(wire130[(2'h2):(2'h2)] == $unsigned(reg133))))
            begin
              reg133 <= reg135[(2'h2):(2'h2)];
              reg134 <= ($signed(reg125) ?
                  (^reg126) : (reg132[(1'h0):(1'h0)] << (reg125[(4'hd):(2'h2)] >> ((wire129 ?
                          wire121 : wire123) ?
                      (!(8'ha8)) : reg127[(4'ha):(2'h3)]))));
              reg135 <= $unsigned(wire119);
            end
          else
            begin
              reg133 <= (^~(reg136[(3'h4):(3'h4)] ?
                  $unsigned(reg125[(2'h3):(2'h3)]) : ($signed($unsigned(reg134)) * {wire130,
                      (reg134 && wire119)})));
              reg134 <= wire119;
            end
          reg136 <= wire119;
        end
      reg137 <= reg133;
      reg138 <= (+wire124);
      reg139 <= wire120;
      reg140 <= $signed(((-(&(reg134 >>> wire118))) >> ($signed(reg136) ?
          {(~&reg132)} : wire123)));
    end
  assign wire141 = $signed(reg136[(1'h1):(1'h0)]);
  assign wire142 = $unsigned($unsigned(({$signed(reg134),
                       wire129} & $unsigned(wire124[(2'h3):(1'h1)]))));
  assign wire143 = $unsigned({$signed($unsigned($signed(reg134)))});
  always
    @(posedge clk) begin
      if ((8'h9f))
        begin
          reg144 <= (+{wire120, $signed(reg136[(4'hb):(3'h7)])});
          if ($unsigned((((wire129[(1'h0):(1'h0)] + $unsigned(reg125)) && reg127[(4'h9):(3'h5)]) ?
              ((reg139 != $signed(wire121)) ?
                  $unsigned((&(8'hb0))) : ((!wire143) << (~|reg128))) : reg128)))
            begin
              reg145 <= reg138;
              reg146 <= $signed((reg139[(1'h1):(1'h1)] ?
                  (wire143[(3'h7):(3'h6)] ? (8'haa) : reg135) : (+reg126)));
              reg147 <= ($unsigned($signed((&reg132))) ?
                  reg127[(2'h3):(2'h2)] : $signed($unsigned((reg139[(1'h1):(1'h1)] - (^~wire121)))));
              reg148 <= reg139;
              reg149 <= ($signed($unsigned((~|(8'haf)))) ?
                  $signed($unsigned($signed(reg137[(3'h4):(1'h1)]))) : $signed(($signed($unsigned(reg125)) ^~ $signed(((8'ha8) ?
                      wire130 : reg134)))));
            end
          else
            begin
              reg145 <= $unsigned($signed((((^reg136) > reg128) * $signed({reg133}))));
            end
          reg150 <= (~&($unsigned(wire119) <<< reg136[(3'h4):(1'h0)]));
          reg151 <= $signed(($unsigned($signed((wire141 | reg126))) ?
              (wire141[(3'h5):(3'h4)] >= {$signed(reg149)}) : wire141[(4'h9):(3'h4)]));
        end
      else
        begin
          reg144 <= ({reg147, (~|reg131)} << (~&$signed($signed({reg136,
              (8'hbb)}))));
          reg145 <= (((($unsigned(reg132) * reg135[(1'h1):(1'h0)]) >>> $unsigned({(8'ha3)})) < ((reg145[(3'h6):(3'h6)] ?
                  wire141 : (!(8'ha9))) ?
              wire124 : $signed(wire118))) <<< (^(8'had)));
          reg146 <= (!$unsigned((reg151 ?
              (wire123[(3'h5):(2'h3)] ?
                  (~&reg147) : $unsigned((8'hb6))) : ((wire119 ~^ reg138) >= (&wire142)))));
        end
      reg152 <= (((((~|wire123) ?
              (reg151 ?
                  reg148 : wire123) : $signed((8'hba))) >>> $unsigned((reg148 + reg135))) > (-($signed((8'hb3)) & ((8'ha2) <= (8'hbb))))) ?
          reg136[(1'h0):(1'h0)] : {($unsigned(((8'ha3) >>> wire123)) <= (-{reg137,
                  (7'h40)})),
              $unsigned(((8'hb4) >>> (wire122 ? wire121 : (8'hb4))))});
    end
  assign wire153 = (reg125 & reg144[(1'h0):(1'h0)]);
  assign wire154 = reg132[(2'h2):(1'h1)];
endmodule
