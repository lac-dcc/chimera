module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h145):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire4;
  wire signed [(3'h4):(1'h0)] wire101;
  wire signed [(5'h10):(1'h0)] wire100;
  wire [(5'h13):(1'h0)] wire99;
  wire [(5'h14):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire24;
  wire signed [(3'h7):(1'h0)] wire25;
  wire signed [(4'hd):(1'h0)] wire26;
  wire [(4'h8):(1'h0)] wire97;
  reg signed [(4'h8):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  assign y = {wire101,
                 wire100,
                 wire99,
                 wire5,
                 wire6,
                 wire7,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire97,
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
  assign wire5 = $signed({wire2});
  assign wire6 = ((!$signed(wire0[(1'h1):(1'h1)])) >> wire5);
  assign wire7 = $unsigned(wire4[(3'h5):(1'h0)]);
  always
    @(posedge clk) begin
      reg8 <= (wire3[(4'ha):(1'h1)] ?
          {wire6} : $unsigned($unsigned(((^~(7'h41)) < (wire7 ?
              wire2 : wire0)))));
      if (wire6[(2'h2):(1'h0)])
        begin
          reg9 <= {(8'hb6), {(((wire7 >>> wire5) ^~ wire2) >= wire5)}};
        end
      else
        begin
          reg9 <= reg9[(4'ha):(2'h3)];
          if (($signed(($signed($signed(wire4)) && (~&(8'h9c)))) <= (-$unsigned($signed((wire1 ?
              (8'hab) : reg8))))))
            begin
              reg10 <= {(8'had), $signed(wire3)};
              reg11 <= reg8[(2'h2):(1'h0)];
              reg12 <= wire6[(1'h1):(1'h1)];
              reg13 <= (({$unsigned(reg12[(4'h9):(1'h0)])} ^~ $unsigned($unsigned((wire1 ?
                      (8'hba) : wire0)))) ?
                  wire0 : $signed($unsigned($signed((reg11 + reg12)))));
              reg14 <= wire2;
            end
          else
            begin
              reg10 <= wire3[(3'h7):(3'h4)];
              reg11 <= $unsigned(reg11[(4'hd):(3'h6)]);
              reg12 <= ({(^~(8'hab)),
                  $signed($signed($unsigned(wire4)))} * wire4);
              reg13 <= reg13[(2'h2):(2'h2)];
              reg14 <= $signed(({((wire3 ? (8'hb0) : wire5) ?
                      ((8'hb1) > wire7) : $unsigned((8'ha2)))} - (wire6[(3'h5):(3'h4)] ?
                  ({wire3, reg10} & (reg13 ? reg13 : wire0)) : ({(8'ha2)} ?
                      $unsigned(wire0) : (&wire0)))));
            end
          reg15 <= ({$signed(reg10[(1'h1):(1'h0)])} == $signed(reg11));
          reg16 <= (~|$signed(wire7));
          if ($signed((($signed($unsigned(wire3)) ^~ {(wire2 | wire0),
                  $unsigned(wire6)}) ?
              {((~|wire3) != (~|reg16)),
                  (reg10 || wire6[(3'h6):(2'h3)])} : (reg10 ?
                  {(wire7 & wire2), wire6} : ((wire6 ^~ reg11) >> {wire2})))))
            begin
              reg17 <= reg13[(2'h3):(2'h3)];
            end
          else
            begin
              reg17 <= $signed((-(reg9[(4'hc):(3'h5)] ?
                  ($signed(reg13) ?
                      (reg10 & reg14) : $signed(reg16)) : (|$unsigned(wire3)))));
              reg18 <= (wire2 || $unsigned((|($signed(wire4) ?
                  wire1[(1'h0):(1'h0)] : (wire6 <= wire4)))));
              reg19 <= wire5[(1'h1):(1'h1)];
              reg20 <= wire7[(3'h5):(1'h1)];
            end
        end
      reg21 <= ((+wire7[(4'hb):(1'h0)]) ?
          (|(wire2[(3'h6):(3'h6)] <<< reg17[(1'h1):(1'h1)])) : reg15[(2'h3):(1'h0)]);
    end
  assign wire22 = $signed((8'ha4));
  assign wire23 = (reg9[(3'h5):(3'h4)] ?
                      (~|$unsigned((8'haf))) : $signed((wire5 ?
                          {$signed(reg19),
                              $signed(reg16)} : (-$unsigned((8'hbd))))));
  assign wire24 = ((^~(^~reg13)) >> (+{{(reg9 <<< wire3)}}));
  assign wire25 = $signed((reg14 == reg18[(2'h2):(1'h1)]));
  assign wire26 = reg10;
  module27 #() modinst98 (.wire28(reg17), .clk(clk), .wire32(wire6), .wire29(wire1), .y(wire97), .wire31(reg16), .wire30(wire4));
  assign wire99 = reg13;
  assign wire100 = ((+((reg10 && (8'had)) <<< $signed((!wire24)))) ?
                       $unsigned($unsigned($signed((wire6 >= reg14)))) : reg12);
  assign wire101 = (($unsigned(($unsigned(reg14) ?
                           wire4[(3'h4):(1'h1)] : (wire100 ?
                               reg12 : reg14))) >= (+wire99)) ?
                       wire0 : (~^$signed((~&(reg12 <= wire6)))));
endmodule

module module27  (y, clk, wire28, wire29, wire30, wire31, wire32);
  output wire [(32'h10f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire28;
  input wire signed [(5'h12):(1'h0)] wire29;
  input wire signed [(3'h6):(1'h0)] wire30;
  input wire signed [(4'hb):(1'h0)] wire31;
  input wire signed [(5'h10):(1'h0)] wire32;
  wire [(3'h5):(1'h0)] wire96;
  wire [(4'ha):(1'h0)] wire95;
  wire [(5'h14):(1'h0)] wire94;
  wire signed [(5'h12):(1'h0)] wire91;
  wire signed [(2'h2):(1'h0)] wire90;
  wire signed [(2'h3):(1'h0)] wire89;
  wire [(2'h3):(1'h0)] wire88;
  wire signed [(4'ha):(1'h0)] wire87;
  wire signed [(3'h4):(1'h0)] wire86;
  wire signed [(5'h13):(1'h0)] wire85;
  wire [(4'ha):(1'h0)] wire84;
  wire [(5'h11):(1'h0)] wire83;
  wire signed [(5'h12):(1'h0)] wire82;
  wire [(3'h7):(1'h0)] wire81;
  wire [(3'h7):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire34;
  wire [(4'h9):(1'h0)] wire35;
  wire signed [(4'he):(1'h0)] wire36;
  wire [(4'hf):(1'h0)] wire37;
  wire [(3'h6):(1'h0)] wire38;
  wire [(5'h15):(1'h0)] wire39;
  wire [(5'h12):(1'h0)] wire79;
  reg signed [(4'he):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg92 = (1'h0);
  assign y = {wire96,
                 wire95,
                 wire94,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire33,
                 wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire38,
                 wire39,
                 wire79,
                 reg93,
                 reg92,
                 (1'h0)};
  assign wire33 = $signed(wire28);
  assign wire34 = (({wire29[(1'h0):(1'h0)],
                          (~&wire29)} >= wire31[(3'h4):(2'h3)]) ?
                      (((-$signed(wire29)) | $signed((wire29 ?
                              wire30 : wire28))) ?
                          $signed(wire31) : ((~^wire30) ?
                              wire30[(3'h5):(1'h0)] : (((8'hbc) ?
                                      wire32 : wire32) ?
                                  $signed(wire30) : $signed(wire32)))) : (&{(wire31 ?
                              (wire30 ?
                                  wire28 : wire32) : (wire29 | wire28))}));
  assign wire35 = (^(~$unsigned($unsigned((wire33 - wire29)))));
  assign wire36 = (~|wire32);
  assign wire37 = $signed(wire29);
  assign wire38 = wire31;
  assign wire39 = ($unsigned((|$unsigned(((8'hac) >> wire35)))) ?
                      {$signed(wire33)} : (wire32[(4'he):(3'h5)] ?
                          $unsigned(($unsigned(wire35) & ((8'haa) ?
                              wire28 : wire37))) : ((!(~wire32)) ?
                              (!(wire36 ?
                                  (7'h41) : wire30)) : wire28[(2'h3):(2'h2)])));
  module40 #() modinst80 (wire79, clk, wire35, wire32, wire39, wire34, wire33);
  assign wire81 = (~^(($signed((wire31 ? wire39 : wire32)) + ({wire31, wire33} ?
                      $signed(wire30) : (-wire39))) + $signed($signed(wire32[(2'h2):(1'h1)]))));
  assign wire82 = (wire79 ? wire81 : $signed(wire30));
  assign wire83 = $unsigned($unsigned($signed(((wire30 <= wire34) ?
                      $unsigned(wire37) : $unsigned(wire39)))));
  assign wire84 = ({wire35[(4'h9):(3'h5)]} <<< (wire33[(2'h3):(1'h1)] ?
                      ({$signed(wire36),
                          (wire28 != (7'h41))} * ((wire33 - wire30) ?
                          wire34 : (-wire35))) : wire30[(3'h6):(1'h0)]));
  assign wire85 = $signed({(($unsigned(wire33) ?
                          (wire83 ?
                              wire31 : wire34) : wire35[(1'h1):(1'h1)]) * (~^$unsigned(wire81)))});
  assign wire86 = ({(wire81 ?
                          (~|$unsigned(wire83)) : $signed(wire38[(3'h6):(1'h1)]))} ^ $signed(wire31[(3'h6):(1'h1)]));
  assign wire87 = $signed((((&(wire28 ?
                      wire33 : wire79)) ~^ (8'h9d)) * wire86));
  assign wire88 = wire84[(4'h8):(3'h4)];
  assign wire89 = (wire82 ?
                      wire88[(1'h1):(1'h1)] : $unsigned((~|$unsigned($unsigned(wire30)))));
  assign wire90 = ((((wire37 ^~ (wire79 ? wire79 : wire86)) ?
                          wire34 : wire85) && $unsigned(wire35[(3'h6):(3'h6)])) ?
                      (wire32[(2'h3):(1'h1)] ?
                          ((wire37[(4'h8):(1'h1)] ?
                                  (wire32 ?
                                      wire89 : wire35) : $signed(wire89)) ?
                              (((8'hb8) ?
                                  wire39 : wire39) | $signed(wire82)) : $unsigned(wire34[(3'h4):(2'h2)])) : (+wire39[(2'h2):(1'h1)])) : wire85[(4'hb):(3'h6)]);
  assign wire91 = $signed(wire87);
  always
    @(posedge clk) begin
      reg92 <= wire28;
      reg93 <= (~&wire35[(1'h0):(1'h0)]);
    end
  assign wire94 = ($signed((+(wire79[(4'h9):(2'h3)] ?
                          $unsigned(wire85) : (~(8'ha0))))) ?
                      ((-wire82[(4'hd):(1'h0)]) ?
                          (!wire86) : $unsigned((wire89 ?
                              $signed(wire31) : wire30))) : (~&(wire87 ^~ (8'hb4))));
  assign wire95 = wire29;
  assign wire96 = (((~&$unsigned($unsigned(wire28))) ?
                      $signed(((wire35 >> wire90) ?
                          (wire90 * wire85) : wire90[(1'h0):(1'h0)])) : wire87) ^~ (((reg93[(3'h7):(2'h3)] & wire29[(4'hf):(4'hb)]) ?
                          $signed($unsigned(wire39)) : wire34) ?
                      {{wire32},
                          $signed({wire34,
                              wire87})} : (&$signed($unsigned(wire89)))));
endmodule

module module40  (y, clk, wire45, wire44, wire43, wire42, wire41);
  output wire [(32'h18c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire45;
  input wire signed [(4'he):(1'h0)] wire44;
  input wire [(5'h15):(1'h0)] wire43;
  input wire signed [(4'h8):(1'h0)] wire42;
  input wire signed [(3'h4):(1'h0)] wire41;
  wire [(4'h9):(1'h0)] wire77;
  wire signed [(3'h5):(1'h0)] wire76;
  wire signed [(5'h15):(1'h0)] wire75;
  wire [(4'he):(1'h0)] wire74;
  wire signed [(3'h5):(1'h0)] wire70;
  wire signed [(5'h12):(1'h0)] wire69;
  wire signed [(3'h4):(1'h0)] wire68;
  wire [(4'hc):(1'h0)] wire50;
  wire signed [(5'h11):(1'h0)] wire49;
  wire [(4'he):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire47;
  wire signed [(4'h8):(1'h0)] wire46;
  reg signed [(3'h5):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg71 = (1'h0);
  reg [(4'ha):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(4'h8):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg62 = (1'h0);
  reg [(3'h6):(1'h0)] reg61 = (1'h0);
  reg [(4'h8):(1'h0)] reg60 = (1'h0);
  reg [(4'hf):(1'h0)] reg59 = (1'h0);
  reg [(4'h9):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg56 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg signed [(4'he):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg52 = (1'h0);
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire70,
                 wire69,
                 wire68,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 reg78,
                 reg73,
                 reg72,
                 reg71,
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
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  assign wire46 = (($unsigned(((!wire41) & $signed(wire42))) - $unsigned(wire44)) ?
                      ($signed(wire43[(3'h7):(3'h5)]) ?
                          $signed(((wire41 >> wire45) * (!wire42))) : $unsigned($signed($signed(wire45)))) : ((wire41 >> wire45[(4'h9):(1'h0)]) > (($signed((8'ha0)) || wire43) + wire45)));
  assign wire47 = (|(((~|$signed(wire42)) + (wire44 || (wire43 ?
                          wire42 : wire42))) ?
                      (8'hab) : wire43[(5'h12):(2'h2)]));
  assign wire48 = ((8'h9f) <<< $signed($signed(wire42[(3'h7):(2'h3)])));
  assign wire49 = $signed(wire41);
  assign wire50 = wire48;
  always
    @(posedge clk) begin
      if (wire44)
        begin
          reg51 <= ((($unsigned(wire45[(3'h5):(1'h1)]) >= (wire45 ?
                  (wire47 <<< wire47) : $signed((8'ha6)))) ?
              $signed((wire46 ?
                  (wire42 ^~ wire47) : (|(8'hbb)))) : (wire50[(4'h9):(2'h3)] ^~ ((wire50 ~^ wire46) - $signed((7'h41))))) <= (wire50 >>> $signed({(wire42 ~^ wire49),
              {(8'ha1)}})));
        end
      else
        begin
          reg51 <= $unsigned(wire42[(3'h7):(2'h2)]);
          if ($signed($signed($signed(wire49))))
            begin
              reg52 <= ((~|((8'h9d) ?
                  (~(~|(8'hb5))) : $unsigned($signed(wire45)))) | (^(&($signed(wire45) ?
                  (7'h43) : (wire41 ? wire47 : wire46)))));
              reg53 <= $unsigned((({(wire41 * reg51),
                  ((7'h43) ? wire48 : reg51)} < $unsigned((wire49 ?
                  (8'ha0) : (8'hb7)))) && $unsigned((8'had))));
              reg54 <= wire41;
            end
          else
            begin
              reg52 <= {$unsigned(((~&wire44) ~^ wire41))};
              reg53 <= ($unsigned((($unsigned(wire47) * {wire46,
                  wire45}) > $signed((!wire47)))) <<< reg52);
              reg54 <= $signed(((wire48 + wire47) < $signed(wire45[(4'h9):(1'h1)])));
              reg55 <= wire42[(3'h6):(1'h1)];
            end
        end
      reg56 <= wire43[(4'hf):(4'hc)];
      reg57 <= wire46;
      reg58 <= reg52;
    end
  always
    @(posedge clk) begin
      reg59 <= $signed($signed(((wire44[(3'h7):(2'h3)] ?
          (reg57 ? reg53 : wire44) : reg53) != reg52)));
      if ((wire47[(4'ha):(2'h2)] ?
          (reg53[(3'h6):(2'h2)] ?
              $signed((wire45[(2'h2):(1'h0)] ?
                  reg51 : wire50)) : wire49[(4'he):(4'h8)]) : $unsigned((^$unsigned(reg57)))))
        begin
          if ($unsigned($signed($signed($unsigned(((8'hb1) > reg53))))))
            begin
              reg60 <= $unsigned(((reg51[(1'h1):(1'h1)] ?
                      $signed((!reg58)) : $signed($signed(wire47))) ?
                  reg55[(4'hb):(2'h2)] : $signed(wire45[(4'h9):(3'h4)])));
              reg61 <= reg52;
              reg62 <= $signed((-(reg59[(4'h9):(3'h5)] + $unsigned((~&reg55)))));
              reg63 <= ({$unsigned($unsigned({wire47, wire48})),
                  ($signed({(8'hba), reg51}) ?
                      ($unsigned(wire46) ~^ $signed(reg60)) : (~(^reg54)))} ~^ $unsigned((wire48 <= {(|wire42),
                  $unsigned((8'hbe))})));
            end
          else
            begin
              reg60 <= wire43;
              reg61 <= reg58[(3'h6):(1'h1)];
              reg62 <= reg62[(2'h2):(1'h0)];
            end
        end
      else
        begin
          reg60 <= (((wire43[(4'hd):(4'h9)] ?
              $signed((~|reg59)) : (wire50 ?
                  $unsigned(reg52) : (wire48 & wire44))) == (^(^~$unsigned(reg51)))) - $signed($unsigned(reg61)));
          reg61 <= ((~^(!(~|$unsigned((8'haf))))) ?
              $signed($unsigned((^~((8'had) ?
                  (7'h41) : (8'hb6))))) : (wire47[(2'h3):(2'h3)] ?
                  (~reg59) : {$unsigned($signed(wire46)),
                      ($signed(reg51) >>> reg59[(3'h4):(3'h4)])}));
          if (wire42)
            begin
              reg62 <= (~^($signed((reg52[(2'h2):(1'h0)] << (wire47 ^~ wire43))) ?
                  wire47 : ((&reg62[(2'h3):(2'h2)]) ?
                      $signed($unsigned(reg56)) : $unsigned($signed(reg54)))));
              reg63 <= (~&($signed(reg58[(3'h4):(1'h1)]) >= ({$signed(wire48)} ?
                  {reg51[(1'h0):(1'h0)]} : $unsigned((reg58 >>> reg53)))));
              reg64 <= reg51[(3'h5):(1'h1)];
              reg65 <= ((((wire44 ? (|reg57) : {wire49, reg62}) ?
                      (+(8'ha9)) : $signed($signed(reg51))) ?
                  {((&wire42) >> (reg57 > reg59)),
                      $signed($unsigned(wire41))} : ({{reg55, reg64}} ?
                      reg56 : (+(+(8'had))))) != (~&{($signed(reg56) >= (~&reg62))}));
              reg66 <= $unsigned($unsigned((^(~&(reg61 >= reg54)))));
            end
          else
            begin
              reg62 <= reg51[(1'h0):(1'h0)];
              reg63 <= wire49[(4'hb):(1'h0)];
            end
          reg67 <= (((reg59 == wire42[(3'h6):(3'h6)]) <= ($unsigned((+wire43)) ?
              (~$unsigned(reg60)) : $signed($signed(reg65)))) != (reg56 != reg51));
        end
    end
  assign wire68 = $signed((reg57[(1'h0):(1'h0)] ? wire49 : reg58));
  assign wire69 = $signed((^{{(wire50 ? reg60 : reg54)}}));
  assign wire70 = (reg65 ?
                      $signed(($unsigned((&reg52)) >>> {(8'ha6),
                          $signed(wire44)})) : $unsigned((($signed((7'h42)) ?
                              (~^wire50) : wire45[(3'h7):(1'h1)]) ?
                          reg62[(1'h0):(1'h0)] : ((wire47 || reg62) ?
                              $signed(reg57) : $signed(reg63)))));
  always
    @(posedge clk) begin
      reg71 <= wire41[(2'h3):(1'h0)];
      reg72 <= reg62;
      reg73 <= wire50[(4'hb):(4'hb)];
    end
  assign wire74 = ((({{reg55, wire68}, (|wire46)} ?
                          (reg60 ? (wire69 << (8'hbd)) : (^~reg58)) : reg56) ?
                      (&(reg55[(5'h12):(1'h0)] - $signed(reg72))) : (wire42 ?
                          (~&(wire48 >> reg72)) : {$signed(wire45),
                              ((8'hb0) << reg52)})) || reg52);
  assign wire75 = ($unsigned(($signed(reg55) ?
                      wire41[(2'h3):(2'h2)] : wire47)) | wire50[(3'h7):(2'h2)]);
  assign wire76 = (!(^~(reg58[(4'h8):(3'h4)] - (~|(reg51 <<< reg67)))));
  assign wire77 = (7'h41);
  always
    @(posedge clk) begin
      reg78 <= $signed((reg73 ? (^$signed((wire75 ? wire75 : reg59))) : reg51));
    end
endmodule
