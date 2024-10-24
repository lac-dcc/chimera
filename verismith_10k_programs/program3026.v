module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h192):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire0;
  input wire [(2'h2):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire3;
  wire [(5'h10):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire11;
  wire signed [(2'h3):(1'h0)] wire12;
  wire [(3'h7):(1'h0)] wire40;
  wire [(3'h4):(1'h0)] wire102;
  reg signed [(5'h15):(1'h0)] reg4 = (1'h0);
  reg [(4'hc):(1'h0)] reg5 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg33 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  assign y = {wire7,
                 wire8,
                 wire11,
                 wire12,
                 wire40,
                 wire102,
                 reg4,
                 reg5,
                 reg6,
                 reg9,
                 reg10,
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
      reg4 <= (!(8'ha7));
      reg5 <= wire3[(2'h3):(2'h3)];
      reg6 <= $signed($signed($unsigned({wire3})));
    end
  assign wire7 = ({(&(|(wire0 > (8'hb5))))} <<< wire3);
  assign wire8 = (($signed((-$unsigned(wire7))) ?
                         $signed($signed((wire7 && wire1))) : (~$unsigned((~|wire2)))) ?
                     (wire7 ?
                         $signed(wire0[(1'h0):(1'h0)]) : reg5[(4'ha):(4'h8)]) : $signed($signed(reg5)));
  always
    @(posedge clk) begin
      reg9 <= $signed((!$unsigned(wire2[(2'h3):(2'h3)])));
      reg10 <= wire2;
    end
  assign wire11 = (reg6 && (|(|{(wire2 ? reg5 : (8'ha5)), $signed((8'hb7))})));
  assign wire12 = ((wire7 << $signed((~|(wire1 ? wire2 : reg9)))) ?
                      {reg4[(4'hf):(3'h4)], reg9[(3'h7):(1'h1)]} : wire3);
  always
    @(posedge clk) begin
      reg13 <= (8'ha2);
      if ({wire2[(1'h1):(1'h0)]})
        begin
          reg14 <= $unsigned((reg10[(4'hb):(3'h6)] * (&{wire1[(1'h1):(1'h0)],
              wire7[(4'hb):(1'h1)]})));
          reg15 <= {(-{reg13})};
          reg16 <= wire8;
          if (({reg4[(4'hf):(3'h5)]} ?
              (|wire2[(2'h3):(1'h0)]) : $unsigned($signed((^$signed((8'ha5)))))))
            begin
              reg17 <= wire8[(3'h5):(2'h3)];
              reg18 <= ($signed((reg4[(5'h12):(4'hb)] ?
                  (reg17[(2'h2):(1'h1)] * (~&(8'hba))) : reg5[(3'h7):(1'h1)])) >> $unsigned((($unsigned((8'hb2)) ~^ (wire11 || (8'ha4))) ?
                  $signed((-reg10)) : (reg15 ?
                      (reg13 ^~ wire12) : (reg13 ? reg9 : reg13)))));
              reg19 <= (&wire7[(4'hc):(4'hc)]);
              reg20 <= ($signed(($unsigned((-wire12)) ? (8'h9d) : (^~wire12))) ?
                  ((-((wire12 ~^ reg10) >= wire7)) == {$signed(reg10[(3'h4):(2'h2)]),
                      wire7[(1'h1):(1'h1)]}) : $unsigned(wire0[(2'h2):(2'h2)]));
              reg21 <= reg6[(4'ha):(2'h2)];
            end
          else
            begin
              reg17 <= ($signed($signed({(~reg17)})) ?
                  (^~reg13[(3'h4):(3'h4)]) : ($signed(wire2) != $unsigned((wire11 ?
                      (reg18 ? (7'h42) : reg16) : $unsigned(wire1)))));
              reg18 <= (~|$unsigned(reg6[(4'h8):(4'h8)]));
            end
          reg22 <= wire0;
        end
      else
        begin
          if ({$unsigned($signed((reg4 ? $unsigned(wire7) : wire3)))})
            begin
              reg14 <= (~|wire8);
              reg15 <= reg4;
              reg16 <= $unsigned({reg21[(3'h6):(2'h3)], reg14[(2'h2):(1'h0)]});
              reg17 <= $signed($unsigned((wire3 ^ ((reg20 ?
                  (8'ha4) : wire11) != reg15))));
            end
          else
            begin
              reg14 <= (reg15 << reg14[(1'h1):(1'h1)]);
              reg15 <= ({{(~|(reg22 & wire11)), reg14}} ?
                  {$signed((+(reg9 ? reg20 : wire11))),
                      (($signed(wire2) ?
                          wire8[(3'h4):(1'h0)] : (wire1 >>> wire11)) >> $unsigned({wire12}))} : $signed((!({reg17,
                          reg22} ?
                      $unsigned(reg13) : $unsigned(reg19)))));
              reg16 <= (~&{$unsigned($signed($signed(reg13)))});
              reg17 <= (wire8[(4'ha):(3'h4)] >>> $unsigned((|reg6)));
              reg18 <= (!$unsigned(($signed((8'hb7)) << ($signed(reg21) >> (reg9 << reg6)))));
            end
          if (reg13[(1'h1):(1'h1)])
            begin
              reg19 <= reg21[(2'h3):(2'h3)];
              reg20 <= {reg6[(4'he):(4'ha)]};
              reg21 <= reg14[(1'h1):(1'h1)];
              reg22 <= $signed($signed({reg10}));
              reg23 <= $signed($unsigned(reg14));
            end
          else
            begin
              reg19 <= reg15[(3'h5):(2'h3)];
            end
          reg24 <= wire7;
        end
      reg25 <= (~(~^(((~reg22) + {reg4, wire2}) ?
          (reg13 ?
              (wire0 ?
                  wire3 : reg20) : (reg9 && reg15)) : (reg24 <= (-reg17)))));
      if ((~^wire11[(2'h2):(2'h2)]))
        begin
          reg26 <= (reg24[(2'h2):(1'h1)] == (|reg19[(3'h4):(2'h3)]));
        end
      else
        begin
          if ((wire11[(2'h2):(2'h2)] * $unsigned(reg13[(2'h2):(2'h2)])))
            begin
              reg26 <= ($unsigned($signed(wire3)) >> ($signed($unsigned(((7'h43) ?
                      reg13 : wire7))) ?
                  (~|reg14) : (+reg21)));
              reg27 <= reg10[(3'h7):(3'h6)];
              reg28 <= ((~|$unsigned(reg25)) <= wire0[(1'h1):(1'h1)]);
            end
          else
            begin
              reg26 <= (+reg18[(1'h1):(1'h0)]);
              reg27 <= ((({(~&reg25)} && (~|reg4)) <<< (reg6 == (~(reg27 ^~ wire0)))) <= (~&reg13[(2'h2):(2'h2)]));
              reg28 <= {wire0};
              reg29 <= $unsigned($unsigned($unsigned(((reg13 ?
                  reg9 : (8'hb3)) << (wire3 & reg6)))));
              reg30 <= {$unsigned(((|(reg27 | reg13)) ?
                      $signed((~^reg13)) : $unsigned(reg29[(2'h3):(2'h2)]))),
                  (7'h40)};
            end
          if ({((-$signed((&reg25))) - reg17),
              (($signed((-reg10)) ? {reg19} : reg5) ?
                  {(reg6 <<< (~|reg16)),
                      $unsigned(((8'hb4) ? wire3 : reg27))} : reg6)})
            begin
              reg31 <= (($unsigned((^$signed(reg16))) <= ((reg5 ?
                      (!reg20) : (wire7 + (8'hbc))) ?
                  (reg23 << $unsigned(reg10)) : ((8'hb6) & (~&reg10)))) <<< (reg4[(3'h4):(2'h3)] ?
                  {($signed(reg26) - $unsigned(reg18)),
                      $unsigned((^~(8'hbd)))} : ((+$unsigned(reg28)) ?
                      (-(reg17 ? reg25 : reg17)) : {(-wire11)})));
              reg32 <= reg14[(1'h1):(1'h0)];
              reg33 <= (!reg14);
              reg34 <= reg16;
            end
          else
            begin
              reg31 <= reg31[(4'h9):(4'h9)];
              reg32 <= (($unsigned($signed((reg13 <<< reg15))) ?
                      {$unsigned(reg5)} : reg13) ?
                  ((+$unsigned((8'ha6))) ?
                      {$unsigned(reg29[(4'h8):(3'h5)]),
                          reg32[(4'h9):(3'h5)]} : ($signed($signed(reg13)) ?
                          reg16 : $signed((^~reg33)))) : (~^({((8'ha9) ?
                              reg24 : reg9)} ?
                      reg16 : $unsigned((wire8 & (7'h42))))));
              reg33 <= reg21[(1'h0):(1'h0)];
              reg34 <= reg27;
              reg35 <= reg10;
            end
          reg36 <= (+$unsigned(({wire7} ?
              wire12[(1'h0):(1'h0)] : $signed((~&reg18)))));
          reg37 <= ($unsigned(reg34[(3'h4):(2'h2)]) + $unsigned(reg27[(1'h1):(1'h0)]));
          reg38 <= ($signed($unsigned($signed((wire11 == reg6)))) ?
              ($unsigned($signed(reg22[(2'h2):(2'h2)])) || ({((8'ha5) >= reg31)} | reg31)) : (8'hb4));
        end
      reg39 <= (-(~^wire0[(1'h0):(1'h0)]));
    end
  assign wire40 = (^($unsigned({reg17}) >= reg34));
  module41 #() modinst103 (wire102, clk, reg20, reg29, wire11, reg30);
endmodule

module module41  (y, clk, wire42, wire43, wire44, wire45);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire42;
  input wire [(4'hc):(1'h0)] wire43;
  input wire [(4'hf):(1'h0)] wire44;
  input wire signed [(2'h2):(1'h0)] wire45;
  wire signed [(5'h10):(1'h0)] wire101;
  wire [(4'h9):(1'h0)] wire100;
  wire signed [(4'he):(1'h0)] wire98;
  wire [(5'h13):(1'h0)] wire87;
  wire [(2'h3):(1'h0)] wire86;
  wire [(5'h11):(1'h0)] wire46;
  wire signed [(5'h14):(1'h0)] wire47;
  wire [(5'h15):(1'h0)] wire48;
  wire [(4'hf):(1'h0)] wire49;
  wire [(4'ha):(1'h0)] wire84;
  assign y = {wire101,
                 wire100,
                 wire98,
                 wire87,
                 wire86,
                 wire46,
                 wire47,
                 wire48,
                 wire49,
                 wire84,
                 (1'h0)};
  assign wire46 = ((~&$unsigned($unsigned(((8'hac) >= wire43)))) ?
                      (($signed((wire45 >= wire42)) ?
                          (!wire45) : ((wire44 ?
                              (8'had) : wire45) > (wire43 << wire43))) - $unsigned((^(^~wire44)))) : (($unsigned($signed((8'ha1))) * (+(wire43 ?
                              wire44 : wire45))) ?
                          $signed((^~wire45[(1'h1):(1'h1)])) : (wire44 - ((^~wire43) ?
                              (~^wire43) : (wire42 > wire44)))));
  assign wire47 = (~(-$signed($signed($unsigned(wire45)))));
  assign wire48 = wire46[(5'h11):(4'he)];
  assign wire49 = (-{$unsigned(wire44[(4'hc):(2'h3)]), wire45[(2'h2):(1'h0)]});
  module50 #() modinst85 (wire84, clk, wire46, wire47, wire48, wire42, wire49);
  assign wire86 = (wire43 ? $unsigned(wire47[(2'h2):(1'h1)]) : wire45);
  assign wire87 = $signed($unsigned(($unsigned((wire46 || wire43)) ?
                      wire48 : {$signed(wire42)})));
  module88 #() modinst99 (wire98, clk, wire87, wire47, wire43, wire42);
  assign wire100 = (!($unsigned($unsigned(wire49[(2'h2):(2'h2)])) << wire84[(1'h0):(1'h0)]));
  assign wire101 = ($signed(wire45) <= ($unsigned($signed((-wire87))) == wire45));
endmodule

module module88  (y, clk, wire92, wire91, wire90, wire89);
  output wire [(32'h2f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire92;
  input wire signed [(2'h2):(1'h0)] wire91;
  input wire signed [(4'hc):(1'h0)] wire90;
  input wire signed [(5'h10):(1'h0)] wire89;
  wire [(3'h7):(1'h0)] wire97;
  wire [(4'h9):(1'h0)] wire96;
  wire signed [(4'h9):(1'h0)] wire95;
  wire signed [(3'h5):(1'h0)] wire93;
  reg [(5'h10):(1'h0)] reg94 = (1'h0);
  assign y = {wire97, wire96, wire95, wire93, reg94, (1'h0)};
  assign wire93 = wire91[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg94 <= (wire93 >> ((wire90[(4'h9):(1'h1)] ?
              wire90[(2'h3):(1'h1)] : wire93[(3'h5):(2'h2)]) ?
          wire90[(4'hc):(3'h4)] : $signed(((wire92 >= wire91) <= $unsigned(wire91)))));
    end
  assign wire95 = $unsigned(({$unsigned({wire93, wire91}),
                      $signed($signed(wire90))} > (&reg94[(1'h1):(1'h0)])));
  assign wire96 = (reg94 ? wire95[(2'h3):(1'h0)] : wire91);
  assign wire97 = (^~(wire91[(1'h0):(1'h0)] || (|wire90)));
endmodule

module module50  (y, clk, wire55, wire54, wire53, wire52, wire51);
  output wire [(32'h11e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire55;
  input wire [(5'h14):(1'h0)] wire54;
  input wire [(5'h15):(1'h0)] wire53;
  input wire signed [(4'he):(1'h0)] wire52;
  input wire [(4'hf):(1'h0)] wire51;
  wire [(2'h3):(1'h0)] wire83;
  wire [(3'h5):(1'h0)] wire82;
  wire signed [(4'hc):(1'h0)] wire81;
  wire [(4'hd):(1'h0)] wire80;
  wire signed [(4'h8):(1'h0)] wire72;
  wire [(5'h13):(1'h0)] wire71;
  wire [(5'h12):(1'h0)] wire70;
  wire signed [(4'hc):(1'h0)] wire69;
  wire [(4'h8):(1'h0)] wire68;
  wire [(3'h4):(1'h0)] wire67;
  wire signed [(4'h8):(1'h0)] wire57;
  wire [(4'hc):(1'h0)] wire56;
  reg [(5'h10):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg78 = (1'h0);
  reg [(3'h7):(1'h0)] reg77 = (1'h0);
  reg [(3'h5):(1'h0)] reg76 = (1'h0);
  reg [(4'hb):(1'h0)] reg75 = (1'h0);
  reg [(4'hb):(1'h0)] reg74 = (1'h0);
  reg [(4'h8):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg64 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(4'h8):(1'h0)] reg60 = (1'h0);
  reg [(3'h7):(1'h0)] reg59 = (1'h0);
  reg [(3'h7):(1'h0)] reg58 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire57,
                 wire56,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 (1'h0)};
  assign wire56 = ($unsigned({(wire53 <<< (~&wire52))}) ?
                      wire52 : wire55[(1'h1):(1'h1)]);
  assign wire57 = (~&(-(((wire54 <<< wire54) ^ wire55) ?
                      ($unsigned(wire56) >= $signed(wire54)) : (8'hb2))));
  always
    @(posedge clk) begin
      reg58 <= wire52;
      reg59 <= (wire52 + (wire57[(4'h8):(3'h4)] > (($signed(wire56) ?
          (8'hb2) : (wire52 ^~ wire54)) ~^ $unsigned((8'hb6)))));
      reg60 <= $unsigned((&$unsigned(({reg58, wire53} ?
          (wire51 ? wire57 : reg58) : (wire52 < (8'ha8))))));
      if ((wire53[(5'h11):(4'h8)] * (~|(^~(~reg59[(1'h0):(1'h0)])))))
        begin
          reg61 <= (~&$unsigned(reg59));
        end
      else
        begin
          if (({{(+wire55[(4'hc):(1'h0)])},
              ((~wire54[(4'he):(2'h2)]) | ((|reg60) ?
                  (wire56 >>> wire55) : (wire52 | wire55)))} >> (~(((wire54 ?
              wire52 : reg58) < reg58[(3'h5):(1'h0)]) + ((~|reg58) ?
              reg61[(5'h14):(4'hb)] : (wire57 ~^ reg59))))))
            begin
              reg61 <= (~wire57);
              reg62 <= ((+(|$signed(wire53[(3'h7):(1'h0)]))) >= wire57);
              reg63 <= $signed(wire53);
            end
          else
            begin
              reg61 <= {$unsigned(reg58[(3'h6):(3'h6)]),
                  {(^((^~reg59) ? {(8'had)} : (wire52 ? wire54 : (8'ha6))))}};
              reg62 <= {(~(8'haa))};
              reg63 <= (~wire57[(4'h8):(4'h8)]);
              reg64 <= $signed($signed(($unsigned((!wire55)) == $signed((reg60 + (8'h9c))))));
              reg65 <= wire51[(3'h6):(3'h4)];
            end
        end
      reg66 <= {wire55[(4'h8):(1'h1)]};
    end
  assign wire67 = (~|(reg64 * (~&(reg59[(3'h7):(2'h2)] ?
                      (wire57 ? reg59 : reg62) : (reg63 ? wire53 : wire51)))));
  assign wire68 = reg66[(1'h0):(1'h0)];
  assign wire69 = reg65[(1'h0):(1'h0)];
  assign wire70 = {{((-$unsigned((7'h44))) + reg59),
                          (^~((-reg65) >= $signed(wire52)))},
                      ($unsigned(({wire57} ?
                              wire55[(3'h4):(3'h4)] : $unsigned(wire67))) ?
                          (wire68[(1'h1):(1'h0)] <<< $signed((reg61 ?
                              (8'ha0) : (8'hab)))) : {$unsigned((^(8'hb7)))})};
  assign wire71 = (({(~&(~wire54))} >> $unsigned(((-reg58) & (wire68 ?
                          reg61 : reg62)))) ?
                      $unsigned(wire70) : wire55);
  assign wire72 = (^{reg62});
  always
    @(posedge clk) begin
      reg73 <= $unsigned((|($unsigned($unsigned(wire55)) ?
          (reg58 > (wire69 ? wire54 : wire69)) : wire71)));
      if ((wire67 - ((wire51 * $signed($unsigned((8'h9d)))) == wire54)))
        begin
          reg74 <= reg59;
          reg75 <= $unsigned(wire67);
          if ({$signed(($signed(wire55[(1'h0):(1'h0)]) ?
                  ((!wire68) >>> {reg75, reg61}) : $signed(wire53)))})
            begin
              reg76 <= $unsigned({(reg66[(2'h3):(2'h2)] || (wire69[(4'hb):(2'h2)] ~^ {wire51,
                      wire70}))});
              reg77 <= {(^(^({wire69, reg62} ^ {wire67, (8'ha0)})))};
              reg78 <= wire71;
            end
          else
            begin
              reg76 <= $signed((^~reg59));
              reg77 <= (|{$signed((~|wire55[(1'h0):(1'h0)]))});
            end
        end
      else
        begin
          if ((^~$signed(({(reg64 < wire72)} * (~$unsigned(reg76))))))
            begin
              reg74 <= ($unsigned($unsigned((wire55 <<< $signed(wire55)))) ?
                  ($signed($unsigned($unsigned((8'hac)))) ?
                      (~^reg73[(3'h5):(1'h1)]) : ((~&$unsigned(wire57)) == ((wire72 <<< reg77) ?
                          (|wire54) : wire52[(1'h1):(1'h0)]))) : reg60[(3'h4):(1'h1)]);
              reg75 <= reg76;
              reg76 <= $signed($signed((wire55 - wire68)));
              reg77 <= (($unsigned((reg61[(4'hf):(3'h5)] ?
                      ((8'hb7) ? reg61 : wire52) : reg63)) ?
                  wire68[(2'h3):(1'h1)] : reg74[(2'h3):(2'h3)]) - reg58);
              reg78 <= (+reg75[(1'h1):(1'h1)]);
            end
          else
            begin
              reg74 <= (wire55 ? (~^reg74) : (~^wire53));
              reg75 <= (^~($signed((reg77[(1'h0):(1'h0)] ?
                      $signed(wire53) : wire72)) ?
                  (-{(wire53 == reg77),
                      $signed(reg64)}) : reg77[(1'h0):(1'h0)]));
              reg76 <= (8'hb6);
              reg77 <= ((wire57[(3'h6):(3'h4)] ^~ ($unsigned($unsigned(reg76)) || $unsigned($unsigned(reg66)))) | wire56[(2'h2):(1'h1)]);
            end
        end
      reg79 <= ($unsigned(reg61[(2'h3):(2'h2)]) ^ $unsigned(reg60));
    end
  assign wire80 = (~&(~&$unsigned((~^wire52))));
  assign wire81 = reg61[(4'hf):(3'h6)];
  assign wire82 = (reg59 ?
                      (+{(reg58 ?
                              reg77[(1'h0):(1'h0)] : $signed((8'hba)))}) : wire55[(5'h10):(2'h2)]);
  assign wire83 = ({((!reg77[(3'h5):(1'h0)]) ?
                              reg78[(3'h5):(2'h3)] : (-$unsigned(wire56))),
                          $unsigned($unsigned($unsigned(reg79)))} ?
                      ($signed(reg64[(1'h1):(1'h0)]) << $unsigned($signed((reg78 ~^ wire70)))) : $unsigned(($unsigned((~^reg58)) ?
                          wire82[(1'h0):(1'h0)] : wire56)));
endmodule
