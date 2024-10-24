module top
#(parameter param102 = (|((((!(8'ha1)) ? ((8'hb6) ? (8'ha1) : (8'hb8)) : (8'h9d)) ^~ {((8'ha3) ? (8'hb7) : (8'hae))}) + (^~(8'hbe)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h18f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire101;
  wire [(3'h5):(1'h0)] wire100;
  wire [(4'hc):(1'h0)] wire99;
  wire signed [(4'hf):(1'h0)] wire98;
  wire [(5'h12):(1'h0)] wire97;
  wire [(4'h9):(1'h0)] wire96;
  wire signed [(3'h5):(1'h0)] wire94;
  wire [(3'h5):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire22;
  wire [(4'h9):(1'h0)] wire5;
  reg [(3'h6):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(2'h2):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  assign y = {wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire94,
                 wire30,
                 wire22,
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
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 (1'h0)};
  assign wire5 = $signed($unsigned($signed((-(wire2 ^~ wire0)))));
  always
    @(posedge clk) begin
      reg6 <= (~&wire4);
      if ({($signed((!$signed(reg6))) <<< reg6[(2'h3):(1'h0)])})
        begin
          reg7 <= $unsigned({(&{$signed(wire0)}), $signed((|wire3))});
          if ($signed({wire5}))
            begin
              reg8 <= (~^$unsigned($signed(reg7)));
            end
          else
            begin
              reg8 <= ((-($unsigned(reg8[(1'h0):(1'h0)]) | {$signed(wire3),
                      (^~reg7)})) ?
                  wire5 : $unsigned($signed(($signed(wire0) - (&wire1)))));
              reg9 <= ({{wire4, ((reg6 ? wire2 : wire4) != (^wire1))}} * reg7);
              reg10 <= ((!$unsigned(({(8'h9f)} | wire2[(4'hb):(2'h3)]))) ?
                  wire2 : wire1);
              reg11 <= wire5;
              reg12 <= $unsigned(reg11[(4'ha):(3'h4)]);
            end
          reg13 <= $unsigned(reg6[(2'h3):(1'h0)]);
        end
      else
        begin
          reg7 <= (wire2[(2'h2):(1'h0)] ?
              reg9 : (wire3 ?
                  (wire5 * {((8'h9e) ? wire1 : reg10),
                      wire0[(3'h4):(2'h2)]}) : $unsigned($unsigned(reg9[(4'hf):(4'ha)]))));
          reg8 <= ((wire1 ?
              ((-wire0) == (+wire1[(2'h2):(2'h2)])) : (!{reg10[(2'h3):(1'h0)]})) | $unsigned(wire0));
          reg9 <= reg13[(3'h5):(1'h1)];
        end
      reg14 <= reg8;
      reg15 <= $unsigned($unsigned(reg9[(1'h1):(1'h0)]));
    end
  always
    @(posedge clk) begin
      if (($signed(((^~reg10[(1'h1):(1'h1)]) ?
              {$signed(reg12), {(8'h9c)}} : reg9[(4'hc):(3'h4)])) ?
          $signed($signed(wire1[(1'h1):(1'h1)])) : (~$unsigned((8'h9e)))))
        begin
          if (($signed(wire1[(4'h9):(2'h2)]) ?
              $unsigned($signed({(~^reg10),
                  reg6[(1'h0):(1'h0)]})) : wire0[(1'h1):(1'h1)]))
            begin
              reg16 <= reg7;
              reg17 <= $signed((reg9[(4'ha):(1'h1)] ?
                  ($signed((reg11 ? wire5 : reg13)) ?
                      wire4 : $signed(((8'haa) ?
                          reg7 : reg14))) : {(reg16 < reg13[(3'h5):(1'h0)]),
                      reg15}));
              reg18 <= wire4[(3'h4):(1'h0)];
              reg19 <= ((((-(^reg8)) >>> reg9) ?
                      $signed($unsigned({reg8})) : $unsigned($signed($signed(reg18)))) ?
                  {$unsigned(reg10[(3'h4):(3'h4)])} : (($unsigned((reg8 < reg9)) == $unsigned(wire5[(3'h5):(3'h4)])) == (~($unsigned(reg10) | $unsigned(reg13)))));
            end
          else
            begin
              reg16 <= ((($unsigned({reg8,
                  reg13}) - wire5[(1'h1):(1'h1)]) || {reg9[(4'hc):(2'h3)]}) - {wire1,
                  $unsigned({reg7})});
              reg17 <= {(-$unsigned(((wire5 && wire3) >> ((8'hbe) ?
                      reg15 : wire4))))};
              reg18 <= reg19[(2'h3):(2'h3)];
              reg19 <= reg14;
            end
          reg20 <= (~^((~|wire3[(1'h1):(1'h0)]) && (~&{{wire4},
              (reg11 ~^ reg11)})));
        end
      else
        begin
          if (wire0)
            begin
              reg16 <= $signed($signed((8'ha5)));
              reg17 <= {reg16[(5'h10):(4'ha)]};
              reg18 <= (reg13 ?
                  reg10[(1'h1):(1'h1)] : {(wire0[(2'h3):(2'h3)] ?
                          $unsigned({(8'hbf)}) : (8'ha5))});
              reg19 <= $signed(($unsigned(($unsigned(reg14) ? reg10 : reg12)) ?
                  {$signed(reg20), reg6[(3'h4):(1'h0)]} : reg15));
            end
          else
            begin
              reg16 <= reg20;
              reg17 <= $signed((^$signed(((!reg17) ?
                  (reg17 ~^ reg15) : {reg6, reg10}))));
              reg18 <= reg8[(1'h1):(1'h0)];
            end
        end
      reg21 <= $signed((($unsigned(reg19[(3'h6):(1'h0)]) & $signed(reg20[(1'h1):(1'h1)])) * (reg17 ?
          {$signed((8'ha9)),
              $signed((8'hb2))} : $unsigned(wire4[(2'h2):(2'h2)]))));
    end
  assign wire22 = (reg18 >>> $unsigned(($signed({reg6}) || $signed((wire1 ?
                      reg19 : reg13)))));
  always
    @(posedge clk) begin
      if ((({reg17, $unsigned($signed(reg13))} ?
              $signed(reg11) : (^((&(8'hb7)) + reg20[(2'h2):(1'h0)]))) ?
          {($unsigned(((7'h42) >> wire5)) >> (reg10[(1'h1):(1'h0)] >= reg13))} : (~reg6)))
        begin
          reg23 <= reg10[(1'h0):(1'h0)];
          reg24 <= (reg15 - (^~($signed($signed(reg23)) <= reg19)));
        end
      else
        begin
          reg23 <= {reg13[(2'h3):(2'h3)]};
          reg24 <= ($signed($signed($unsigned((~^reg17)))) ?
              (+{((reg10 < wire3) ?
                      reg9[(4'hf):(4'hd)] : (wire4 <<< reg7))}) : ((-($signed(reg15) <<< $unsigned(reg20))) ?
                  ({$signed(reg15),
                      reg14[(3'h7):(2'h2)]} == ($unsigned(reg12) != (+(8'ha0)))) : reg15[(4'ha):(1'h0)]));
          reg25 <= ((^$unsigned($unsigned(reg21[(3'h4):(2'h2)]))) >>> {reg18[(4'ha):(3'h7)],
              (reg18[(3'h6):(3'h4)] ?
                  wire0[(1'h0):(1'h0)] : $signed($signed(reg11)))});
          reg26 <= reg24[(5'h11):(3'h4)];
        end
      reg27 <= (wire5[(4'h8):(1'h1)] <<< $unsigned((reg13 ?
          (((8'hbe) ? reg15 : reg13) ?
              $signed(wire5) : $unsigned(reg9)) : ($signed(wire5) ~^ (&wire4)))));
      reg28 <= $signed((~$unsigned(reg13)));
      reg29 <= reg24[(3'h4):(2'h3)];
    end
  assign wire30 = reg7[(3'h5):(1'h0)];
  module31 #() modinst95 (.y(wire94), .wire34(reg19), .wire36(reg15), .wire35(reg13), .wire32(reg14), .clk(clk), .wire33(reg18));
  assign wire96 = $signed(wire1);
  assign wire97 = {reg27[(4'hf):(3'h6)]};
  assign wire98 = reg20;
  assign wire99 = $signed($unsigned(({(wire97 * reg12), {wire0, reg9}} ?
                      ($unsigned((8'hb2)) ?
                          (+wire94) : (wire98 ^~ reg12)) : (~|wire3[(2'h3):(2'h3)]))));
  assign wire100 = $signed((-($signed(((8'ha5) < reg7)) + $signed($signed(wire94)))));
  assign wire101 = wire3[(3'h4):(2'h3)];
endmodule

module module31
#(parameter param93 = ((({((7'h43) ? (8'ha5) : (8'ha2)), ((7'h40) & (8'ha7))} - (((8'hbf) ~^ (8'h9f)) >>> (7'h42))) <= (8'hb9)) == ((^~((8'h9f) ? ((8'hae) ? (8'hb8) : (8'hb7)) : ((8'hbe) >= (8'hbf)))) ? ({((8'hb2) ? (8'h9f) : (8'ha0)), ((8'hb2) ? (8'h9e) : (8'hbd))} <<< (((8'ha2) ? (8'ha2) : (7'h40)) & ((8'h9c) != (8'ha6)))) : ((~^(|(8'hac))) ^ {((7'h40) + (8'hb3)), (8'hba)}))))
(y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'h82):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire36;
  input wire signed [(5'h11):(1'h0)] wire35;
  input wire signed [(4'he):(1'h0)] wire34;
  input wire [(5'h13):(1'h0)] wire33;
  input wire signed [(5'h12):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire92;
  wire [(3'h5):(1'h0)] wire90;
  wire signed [(4'hf):(1'h0)] wire76;
  wire signed [(3'h4):(1'h0)] wire75;
  wire signed [(5'h13):(1'h0)] wire74;
  wire signed [(3'h7):(1'h0)] wire73;
  wire [(2'h3):(1'h0)] wire72;
  wire [(4'ha):(1'h0)] wire70;
  wire signed [(4'hf):(1'h0)] wire40;
  wire signed [(5'h15):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire38;
  wire signed [(3'h6):(1'h0)] wire37;
  assign y = {wire92,
                 wire90,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire70,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 (1'h0)};
  assign wire37 = {wire34};
  assign wire38 = ((~(wire33 ? $signed((wire35 ? (8'hbb) : wire33)) : wire34)) ?
                      (8'ha0) : (^$signed((+(wire34 && wire34)))));
  assign wire39 = (^wire32[(5'h12):(3'h7)]);
  assign wire40 = wire37[(3'h6):(2'h2)];
  module41 #() modinst71 (.wire42(wire39), .wire44(wire33), .wire45(wire35), .wire43(wire32), .clk(clk), .y(wire70));
  assign wire72 = (|$unsigned(wire34[(4'hc):(3'h7)]));
  assign wire73 = (($unsigned(wire70) ? wire34[(4'he):(2'h2)] : wire35) ?
                      wire33 : wire34[(4'ha):(3'h6)]);
  assign wire74 = $signed((wire35[(4'he):(4'hd)] ?
                      $unsigned((wire37 ?
                          wire39 : $signed(wire32))) : $unsigned(wire35[(3'h6):(2'h3)])));
  assign wire75 = $unsigned({($signed({wire36}) ?
                          ($signed(wire33) ?
                              wire74[(3'h7):(3'h7)] : wire32) : (~^(wire73 ?
                              (8'hbb) : wire72)))});
  assign wire76 = (~^(!($unsigned((wire73 < wire74)) != ((wire74 >>> wire38) << $signed(wire33)))));
  module77 #() modinst91 (wire90, clk, wire37, wire32, wire36, wire74);
  assign wire92 = (($unsigned((wire34 ? wire70 : (~|wire70))) ?
                          ((~&wire38) < $unsigned($signed(wire36))) : (~&wire34)) ?
                      ((-(~&(^wire36))) >>> $signed({(^wire74),
                          $signed((8'ha4))})) : (wire40 ?
                          ($signed(((8'ha2) ? (8'h9e) : (8'hbc))) ?
                              $signed($unsigned(wire33)) : ((wire35 ~^ wire73) <<< (wire36 ?
                                  (8'hac) : wire70))) : (((wire32 ?
                              (8'hb2) : wire34) && $unsigned(wire38)) <<< ((&(8'hbe)) << $signed(wire73)))));
endmodule

module module77  (y, clk, wire81, wire80, wire79, wire78);
  output wire [(32'h64):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire81;
  input wire signed [(5'h11):(1'h0)] wire80;
  input wire signed [(4'hd):(1'h0)] wire79;
  input wire signed [(4'hd):(1'h0)] wire78;
  wire [(5'h11):(1'h0)] wire89;
  wire signed [(3'h6):(1'h0)] wire88;
  wire signed [(4'hc):(1'h0)] wire87;
  wire [(5'h15):(1'h0)] wire86;
  wire signed [(4'hc):(1'h0)] wire85;
  wire signed [(5'h10):(1'h0)] wire84;
  wire signed [(4'hd):(1'h0)] wire83;
  wire signed [(2'h2):(1'h0)] wire82;
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 (1'h0)};
  assign wire82 = $signed({(($signed((8'hbf)) ?
                              $signed(wire81) : (wire81 ? wire81 : wire79)) ?
                          $signed(((8'hae) ?
                              wire78 : wire81)) : {$signed((8'ha3)), (8'hb5)}),
                      (-$unsigned($unsigned(wire78)))});
  assign wire83 = (((|{(wire80 ? wire82 : (7'h43)), wire81}) ?
                      (^~wire81) : $unsigned($unsigned((wire79 <= wire80)))) * (8'ha0));
  assign wire84 = ((~&(~&wire82[(2'h2):(1'h0)])) ?
                      {$unsigned($signed($unsigned((8'hb3))))} : {$unsigned($unsigned(wire80[(4'hf):(1'h1)])),
                          wire80});
  assign wire85 = $unsigned($signed(wire79[(4'ha):(3'h5)]));
  assign wire86 = $signed(($unsigned((~|wire82[(2'h2):(1'h1)])) >= ((~|((8'hbd) ?
                      (7'h43) : wire79)) >> wire78[(3'h7):(3'h7)])));
  assign wire87 = (wire82[(2'h2):(2'h2)] ?
                      $unsigned(wire81[(2'h3):(2'h3)]) : wire80[(2'h3):(2'h2)]);
  assign wire88 = {$unsigned((((wire80 ? wire86 : wire81) ^~ (wire79 ?
                              wire84 : wire86)) ?
                          wire84 : {wire85[(1'h0):(1'h0)], (^wire84)}))};
  assign wire89 = $signed($signed((wire88 ? wire88 : wire83)));
endmodule

module module41
#(parameter param69 = ((8'hb5) ~^ ({(8'had), {{(8'had)}}} <= (^(((7'h42) <= (8'hb9)) >> {(8'ha6)})))))
(y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'h116):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire45;
  input wire signed [(4'h9):(1'h0)] wire44;
  input wire signed [(5'h10):(1'h0)] wire43;
  input wire [(5'h15):(1'h0)] wire42;
  wire signed [(5'h14):(1'h0)] wire66;
  wire [(5'h10):(1'h0)] wire65;
  wire [(2'h2):(1'h0)] wire49;
  wire signed [(5'h11):(1'h0)] wire48;
  wire [(3'h5):(1'h0)] wire47;
  wire [(3'h6):(1'h0)] wire46;
  reg [(5'h11):(1'h0)] reg68 = (1'h0);
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  reg [(3'h4):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg63 = (1'h0);
  reg [(5'h11):(1'h0)] reg62 = (1'h0);
  reg [(4'hf):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg60 = (1'h0);
  reg [(4'ha):(1'h0)] reg59 = (1'h0);
  reg [(4'hb):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg57 = (1'h0);
  reg [(3'h6):(1'h0)] reg56 = (1'h0);
  reg [(3'h5):(1'h0)] reg55 = (1'h0);
  reg [(4'he):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg53 = (1'h0);
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg [(4'hb):(1'h0)] reg51 = (1'h0);
  reg [(5'h13):(1'h0)] reg50 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 reg68,
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
                 (1'h0)};
  assign wire46 = wire43;
  assign wire47 = $unsigned($unsigned($unsigned((wire45 << (~^wire45)))));
  assign wire48 = (((|$signed((wire47 >> wire44))) <<< wire45) ?
                      ($unsigned((~^$unsigned(wire42))) ~^ wire46) : (~&wire43));
  assign wire49 = wire42[(3'h5):(2'h2)];
  always
    @(posedge clk) begin
      if ($unsigned(wire42[(1'h1):(1'h1)]))
        begin
          reg50 <= ((wire43 ?
              (~&(wire48 <<< $signed(wire49))) : ({(-wire44)} <= wire47)) < (wire45[(3'h7):(3'h6)] ^ wire47));
          if (wire47[(2'h2):(1'h0)])
            begin
              reg51 <= $signed(($unsigned({(8'ha7),
                  $signed(wire44)}) <<< $signed((&(wire46 ~^ wire46)))));
              reg52 <= $signed(wire46);
              reg53 <= wire42[(4'hf):(4'h9)];
              reg54 <= ($signed((($signed(wire45) ?
                          (wire45 == (8'ha5)) : $signed(wire42)) ?
                      ({reg51,
                          reg52} || $unsigned(wire43)) : $signed((wire48 < wire49)))) ?
                  $signed((|(8'hb7))) : $signed((~|$unsigned(reg52[(4'ha):(4'h9)]))));
              reg55 <= $unsigned(wire47[(1'h1):(1'h1)]);
            end
          else
            begin
              reg51 <= $unsigned(reg54);
              reg52 <= (8'hbd);
            end
          if ($unsigned((~(($signed(wire48) < (reg51 ~^ reg51)) ?
              {$signed(reg51)} : ($unsigned(wire48) <<< {wire47, reg53})))))
            begin
              reg56 <= ($signed(wire48) * (($unsigned(reg54[(3'h4):(1'h0)]) ?
                  (|(-reg52)) : reg52) != ($unsigned(reg52) ?
                  $signed(reg55[(3'h4):(1'h0)]) : ({(8'h9d),
                      wire48} < (~wire45)))));
            end
          else
            begin
              reg56 <= $signed(reg51[(4'ha):(3'h5)]);
              reg57 <= ($signed(({(reg50 ? reg54 : reg50), (!wire46)} ?
                  (wire48 + ((8'hb3) | reg54)) : $unsigned({wire45}))) >> ($signed($signed((&reg53))) ?
                  $unsigned($signed((wire42 >>> (8'hb9)))) : wire44[(2'h3):(1'h0)]));
              reg58 <= wire47[(2'h3):(2'h3)];
              reg59 <= (&(((^$unsigned(reg55)) ?
                  $unsigned(reg51) : {(^(7'h43)),
                      $signed(reg52)}) <<< (reg57[(1'h0):(1'h0)] ?
                  ((wire43 != (8'hb8)) ?
                      ((8'had) ?
                          reg58 : reg54) : $signed(wire45)) : (wire49 << (-wire46)))));
            end
          reg60 <= wire47[(2'h3):(1'h0)];
          reg61 <= $signed($unsigned((~^$signed((reg52 ? wire43 : reg52)))));
        end
      else
        begin
          if ($signed(reg51))
            begin
              reg50 <= reg51;
              reg51 <= $signed((8'h9e));
              reg52 <= ((~($unsigned({reg59}) * $unsigned({wire43,
                  (8'hb4)}))) >>> (~|{reg51[(4'h8):(1'h1)]}));
              reg53 <= reg57;
            end
          else
            begin
              reg50 <= $signed(($unsigned(((&wire49) != (reg59 >> reg59))) ?
                  (((8'hac) >= wire48[(4'hd):(4'ha)]) <<< $unsigned((8'ha0))) : ($unsigned(wire44) ?
                      ($unsigned(reg55) >>> (wire44 ?
                          reg61 : reg61)) : ($unsigned(reg51) ^~ (^reg60)))));
            end
          reg54 <= $unsigned(($signed(((wire43 <= (8'hba)) ?
                  wire47[(2'h3):(2'h3)] : reg58)) ?
              $unsigned((^reg50[(4'h9):(4'h9)])) : wire48[(2'h2):(1'h0)]));
          reg55 <= $unsigned(($unsigned((&$signed(wire44))) << wire45[(4'h8):(3'h7)]));
        end
      reg62 <= (|wire42);
      reg63 <= ((8'hab) == reg59);
      reg64 <= $unsigned($unsigned((-$unsigned((|reg54)))));
    end
  assign wire65 = $unsigned(reg54);
  assign wire66 = (((($signed(reg52) ? $unsigned(wire65) : (~|wire42)) ?
                              $unsigned($signed((8'hb8))) : {wire42[(5'h10):(4'h9)],
                                  wire44}) ?
                          (($unsigned(wire42) ? (reg62 <= (8'hab)) : reg62) ?
                              ((8'hb3) <<< ((8'ha1) ?
                                  wire47 : reg51)) : {(reg50 << wire44),
                                  (wire49 ?
                                      wire45 : reg50)}) : $signed(reg64)) ?
                      (^(~reg63[(3'h4):(1'h1)])) : (-$signed(((reg62 ?
                              reg54 : wire65) ?
                          reg62 : $unsigned(reg62)))));
  always
    @(posedge clk) begin
      reg67 <= (~^(8'hb5));
      reg68 <= $unsigned((|$signed(reg56)));
    end
endmodule
