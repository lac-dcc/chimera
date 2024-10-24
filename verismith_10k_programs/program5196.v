module top
#(parameter param111 = ((((^(8'ha9)) ? (((8'ha9) && (8'hb6)) ? (^~(8'hb4)) : ((8'h9d) ? (8'hb9) : (8'ha8))) : ((!(8'ha3)) < ((8'hb6) ? (8'hbe) : (8'ha6)))) >>> ((((8'hb9) ? (8'had) : (8'ha1)) ? {(8'hac)} : {(8'ha5), (8'hbc)}) | (((8'ha0) ? (8'hb7) : (7'h42)) * (~^(8'hb4))))) == ({(((8'hb1) ^~ (7'h41)) + (7'h40))} | (|{(~&(8'h9e)), (-(8'ha9))}))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h153):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire110;
  wire signed [(4'hf):(1'h0)] wire109;
  wire [(4'ha):(1'h0)] wire108;
  wire [(5'h15):(1'h0)] wire107;
  wire [(5'h15):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire21;
  wire [(5'h15):(1'h0)] wire105;
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg6 = (1'h0);
  reg [(4'hd):(1'h0)] reg5 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire7,
                 wire21,
                 wire105,
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
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (wire2[(1'h0):(1'h0)] + $unsigned($unsigned({wire2[(1'h1):(1'h0)]})));
      reg6 <= $signed((((~&(reg5 << wire0)) >>> $signed($signed(wire3))) - reg5[(4'hd):(4'h8)]));
    end
  assign wire7 = ((wire0[(5'h13):(5'h11)] || (+$unsigned((wire2 > reg5)))) ?
                     wire4[(2'h3):(1'h1)] : (($unsigned((8'hb6)) << ((wire0 ?
                                 wire3 : wire4) ?
                             wire1 : reg5)) ?
                         (reg6 ?
                             wire0[(2'h2):(1'h0)] : $signed({(8'hb0),
                                 wire0})) : (8'ha6)));
  always
    @(posedge clk) begin
      reg8 <= $signed(((8'hbd) ? (8'haf) : wire0[(4'h9):(1'h0)]));
      if ($signed((~^(~&(+wire1)))))
        begin
          reg9 <= $signed((+$signed((reg8[(2'h3):(2'h3)] == $unsigned(wire1)))));
          reg10 <= ((wire0 ?
              ($unsigned((wire0 - wire3)) ?
                  (!reg5) : (~|$unsigned(wire7))) : ({$signed((8'ha8)),
                      $unsigned(wire4)} ?
                  ((wire7 ?
                      wire0 : wire7) < wire7[(1'h1):(1'h0)]) : (((7'h44) ^~ wire7) ?
                      reg8 : (reg9 ?
                          (8'ha5) : wire4)))) - $signed(((~^(reg6 ^ wire2)) != ($unsigned(wire0) ?
              $unsigned(wire3) : $signed(wire0)))));
          reg11 <= $signed({wire0[(3'h6):(1'h0)]});
          reg12 <= wire4[(1'h0):(1'h0)];
          reg13 <= reg8;
        end
      else
        begin
          reg9 <= reg5;
          reg10 <= $signed($signed(((~&(wire2 ? reg8 : reg10)) ?
              reg10[(4'ha):(3'h4)] : (reg13[(3'h6):(3'h6)] ?
                  (-reg10) : (-(8'hb6))))));
        end
      if ($signed({{(+reg9), (~&(reg8 ? reg10 : wire1))}}))
        begin
          reg14 <= ((~|(^$unsigned(wire1))) && wire3);
          reg15 <= reg14;
        end
      else
        begin
          reg14 <= (reg8 | $signed($signed($unsigned(((8'hbd) && reg14)))));
          reg15 <= reg6;
          reg16 <= $unsigned((reg12 < $signed($signed((^~reg5)))));
          reg17 <= ((|wire4[(2'h2):(1'h1)]) | wire7[(3'h5):(1'h1)]);
          reg18 <= (($signed(((wire4 ? wire0 : reg8) ?
              reg17 : wire0[(3'h6):(3'h4)])) >> (8'hae)) | reg6);
        end
      reg19 <= $signed(wire1);
      reg20 <= reg6[(4'hb):(1'h0)];
    end
  assign wire21 = (($signed(wire2[(2'h2):(1'h1)]) == $unsigned((^~$unsigned(reg11)))) - (reg5 * $unsigned(wire0[(4'hc):(2'h2)])));
  module22 #() modinst106 (.wire25(reg20), .wire23(reg10), .clk(clk), .y(wire105), .wire27(wire7), .wire24(reg19), .wire26(reg18));
  assign wire107 = $unsigned((&reg9));
  assign wire108 = (!($unsigned($unsigned({wire0})) ?
                       (~&$unsigned(reg15[(4'hb):(2'h2)])) : $signed($signed($unsigned(reg16)))));
  assign wire109 = (~&(8'hbc));
  assign wire110 = reg6[(3'h6):(1'h1)];
endmodule

module module22  (y, clk, wire23, wire24, wire25, wire26, wire27);
  output wire [(32'h178):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire23;
  input wire [(4'he):(1'h0)] wire24;
  input wire signed [(4'h8):(1'h0)] wire25;
  input wire [(4'hf):(1'h0)] wire26;
  input wire signed [(5'h15):(1'h0)] wire27;
  wire signed [(3'h4):(1'h0)] wire95;
  wire signed [(5'h14):(1'h0)] wire94;
  wire [(4'he):(1'h0)] wire93;
  wire signed [(4'hf):(1'h0)] wire92;
  wire [(5'h11):(1'h0)] wire91;
  wire signed [(4'he):(1'h0)] wire90;
  wire signed [(4'h9):(1'h0)] wire89;
  wire [(4'hc):(1'h0)] wire88;
  wire [(4'h9):(1'h0)] wire87;
  wire [(5'h12):(1'h0)] wire86;
  wire [(4'hf):(1'h0)] wire84;
  wire signed [(2'h2):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire29;
  wire signed [(4'hb):(1'h0)] wire30;
  wire [(5'h11):(1'h0)] wire31;
  wire [(4'h8):(1'h0)] wire35;
  wire [(4'ha):(1'h0)] wire71;
  reg [(5'h11):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg102 = (1'h0);
  reg [(4'hf):(1'h0)] reg101 = (1'h0);
  reg [(3'h4):(1'h0)] reg100 = (1'h0);
  reg [(5'h12):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg98 = (1'h0);
  reg [(4'he):(1'h0)] reg97 = (1'h0);
  reg [(4'he):(1'h0)] reg96 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire84,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire35,
                 wire71,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg32,
                 reg33,
                 reg34,
                 (1'h0)};
  assign wire28 = wire26[(2'h3):(2'h3)];
  assign wire29 = $signed((wire24[(4'h8):(3'h6)] ^ wire27[(4'he):(4'ha)]));
  assign wire30 = wire26[(3'h5):(3'h5)];
  assign wire31 = wire28;
  always
    @(posedge clk) begin
      reg32 <= (wire29 ?
          ((wire30[(1'h0):(1'h0)] || (-wire23)) ?
              (wire30 ?
                  $unsigned(wire29) : wire27[(2'h2):(1'h0)]) : (~^$unsigned((wire24 <<< wire26)))) : wire28[(1'h1):(1'h1)]);
      reg33 <= wire30;
      reg34 <= wire23[(3'h5):(2'h2)];
    end
  assign wire35 = wire24;
  module36 #() modinst72 (wire71, clk, wire23, reg34, wire24, reg33, wire27);
  module73 #() modinst85 (wire84, clk, wire29, wire23, reg33, wire26, wire31);
  assign wire86 = (wire27[(3'h6):(3'h6)] + (-{wire31, wire84[(4'ha):(2'h3)]}));
  assign wire87 = {wire23[(4'he):(3'h5)]};
  assign wire88 = $signed($unsigned(wire84));
  assign wire89 = (-$unsigned({$unsigned($unsigned(wire27))}));
  assign wire90 = {wire88[(2'h2):(1'h1)],
                      {$signed({(wire27 > wire29), (reg33 < wire29)}),
                          {{(^~(8'haa))},
                              (((8'h9f) ? wire25 : wire84) ?
                                  wire26[(3'h5):(1'h1)] : reg33)}}};
  assign wire91 = (~|wire23);
  assign wire92 = wire87;
  assign wire93 = $unsigned((|$signed({(wire91 ? (8'hac) : (8'hba)),
                      {wire84}})));
  assign wire94 = ((|(~&{{wire86, wire90},
                      (wire71 ~^ (8'hb7))})) << ({wire25[(3'h7):(3'h4)],
                      $signed($signed(wire35))} | $signed((wire92 ?
                      {wire91, wire24} : {wire26, wire27}))));
  assign wire95 = {(wire24 > (wire71 ?
                          $unsigned(wire28) : $signed($unsigned((8'hbb)))))};
  always
    @(posedge clk) begin
      reg96 <= (wire27 ^ wire30[(4'hb):(3'h6)]);
      if (reg96[(4'ha):(3'h4)])
        begin
          reg97 <= (wire27 && (|wire25[(4'h8):(1'h0)]));
          if (({((~^(|reg34)) - (wire28[(2'h2):(1'h1)] ?
                  {wire89, wire24} : (wire88 ? wire23 : wire71))),
              (((+wire25) ? ((8'hb1) << reg33) : ((8'h9c) ? wire31 : wire87)) ?
                  (wire90 ?
                      (&wire92) : $unsigned(wire35)) : $signed((~^wire28)))} < wire26[(4'hd):(4'hd)]))
            begin
              reg98 <= (~^wire91[(4'h8):(3'h5)]);
            end
          else
            begin
              reg98 <= ((wire95 ?
                      $unsigned($unsigned((reg33 ?
                          reg32 : wire28))) : {$unsigned($unsigned(wire86)),
                          ($signed(wire30) >= wire88)}) ?
                  (8'hb7) : ($signed((~(wire87 > wire89))) ?
                      (8'hb1) : ({{wire95, wire71}, (~^reg96)} ?
                          ((wire23 ^ wire86) ?
                              (8'hae) : reg33) : wire90[(4'h9):(2'h2)])));
              reg99 <= (~|(&{$unsigned((wire23 ? reg33 : wire90))}));
            end
          reg100 <= wire71[(2'h3):(2'h2)];
          if ($signed($unsigned((!$unsigned(((8'hbe) && reg97))))))
            begin
              reg101 <= (($unsigned(({wire84, wire29} && (wire24 ?
                      wire92 : reg99))) + (({(8'ha7), wire29} ?
                          reg99[(4'hd):(2'h2)] : (~^wire90)) ?
                      wire89 : $signed($unsigned((8'ha5))))) ?
                  $signed($unsigned(($unsigned(reg97) ?
                      (wire29 | reg32) : {wire89}))) : (wire89 ?
                      wire88[(4'h9):(4'h9)] : ((+(reg100 ?
                          (8'hbc) : wire29)) != {(^~wire24), (~wire91)})));
              reg102 <= (^~($unsigned((~&$unsigned(wire94))) ?
                  wire27 : $signed((^(7'h42)))));
            end
          else
            begin
              reg101 <= ((($signed($signed((8'ha2))) ?
                      ($signed(reg100) <= ((8'hbb) ?
                          wire30 : (8'hbf))) : (^~reg32[(4'h9):(3'h6)])) ^ $signed(wire91)) ?
                  (-($unsigned((~wire84)) ?
                      ((~^wire27) == ((8'ha0) ?
                          (8'hba) : wire27)) : $signed({wire30}))) : $unsigned((&reg32)));
              reg102 <= wire94;
              reg103 <= {$signed((-wire95))};
            end
        end
      else
        begin
          reg97 <= (((!(^~$unsigned(reg32))) >> (~^wire95[(1'h1):(1'h1)])) ^~ (reg100 > reg103[(3'h5):(1'h1)]));
          if (wire89[(2'h2):(2'h2)])
            begin
              reg98 <= $signed(({(8'ha7)} & {$signed((~wire95)),
                  {$unsigned(wire91)}}));
            end
          else
            begin
              reg98 <= (wire84 - ({wire24[(4'h8):(3'h6)]} >> (&((reg101 ?
                  wire89 : wire91) >= (reg102 & wire87)))));
              reg99 <= $signed($unsigned(({$unsigned(wire93)} ?
                  (reg32 ^ wire92[(1'h1):(1'h1)]) : ($signed((8'hac)) ?
                      wire95[(2'h3):(1'h0)] : (wire23 ^ (8'hae))))));
              reg100 <= ({{reg103[(4'h9):(3'h4)]}} ?
                  wire93 : (|$unsigned(wire90)));
            end
        end
      reg104 <= (($unsigned($signed($signed(wire27))) - $unsigned(((wire93 >> wire35) ^~ wire35))) ?
          (wire28[(1'h0):(1'h0)] | $signed(reg99)) : reg101[(2'h2):(1'h0)]);
    end
endmodule

module module73
#(parameter param83 = {((|(((8'ha6) ? (8'h9e) : (8'hb9)) || {(8'h9c), (8'ha4)})) ? (~{((8'hbc) ? (8'ha8) : (8'h9d))}) : (&(((8'had) ? (8'hb3) : (8'ha6)) ^ ((8'ha6) ? (8'ha1) : (8'hbd))))), (((((8'ha4) ? (8'hbf) : (8'h9c)) ? (8'ha4) : (~^(8'haa))) - {(^(8'ha7)), {(8'hb8), (8'hb7)}}) >>> (-(~&((8'hb1) ? (8'ha7) : (8'ha2)))))})
(y, clk, wire78, wire77, wire76, wire75, wire74);
  output wire [(32'h30):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire78;
  input wire signed [(5'h14):(1'h0)] wire77;
  input wire signed [(5'h15):(1'h0)] wire76;
  input wire signed [(4'hf):(1'h0)] wire75;
  input wire signed [(5'h11):(1'h0)] wire74;
  wire signed [(4'ha):(1'h0)] wire82;
  wire signed [(4'hb):(1'h0)] wire81;
  wire [(4'hd):(1'h0)] wire80;
  wire [(4'hd):(1'h0)] wire79;
  assign y = {wire82, wire81, wire80, wire79, (1'h0)};
  assign wire79 = $unsigned(wire75);
  assign wire80 = wire77[(3'h5):(1'h0)];
  assign wire81 = $unsigned($unsigned(wire77[(5'h10):(4'hd)]));
  assign wire82 = wire74[(4'he):(4'hb)];
endmodule

module module36
#(parameter param70 = ((~^{((~|(8'haa)) ^~ (~(7'h43))), {((8'ha0) ? (7'h43) : (8'hb0))}}) ? (((((8'hae) > (8'ha0)) ? ((8'haf) ? (7'h41) : (8'hb6)) : (^~(8'hb8))) <<< ((~(8'hb9)) && ((8'hbd) ? (8'hbe) : (8'hab)))) ? ((((8'hb7) > (7'h43)) && ((8'haf) ? (8'hb1) : (8'hab))) ? (((8'h9e) ? (8'hbd) : (8'hbf)) <<< ((8'hb1) ? (8'hb6) : (8'hb9))) : ((~&(8'hbe)) ? (^(8'hb6)) : ((8'h9c) < (8'ha4)))) : ((~|{(8'hb4), (8'hb6)}) ? (|((8'hb3) < (7'h43))) : (((8'hbf) ? (8'hb9) : (8'ha0)) == ((8'ha0) >= (7'h40))))) : (-{(((8'hb4) ^~ (8'hb3)) >> ((8'hba) ? (8'ha7) : (8'h9e))), (((8'ha0) ? (8'ha4) : (8'hb5)) ? (!(8'ha5)) : ((8'ha3) - (8'ha9)))})))
(y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'h12f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire41;
  input wire [(4'hd):(1'h0)] wire40;
  input wire signed [(4'h9):(1'h0)] wire39;
  input wire signed [(4'hc):(1'h0)] wire38;
  input wire [(5'h15):(1'h0)] wire37;
  wire [(5'h12):(1'h0)] wire69;
  wire signed [(4'h8):(1'h0)] wire68;
  wire signed [(4'h8):(1'h0)] wire67;
  wire [(4'ha):(1'h0)] wire66;
  wire [(5'h13):(1'h0)] wire65;
  wire signed [(5'h10):(1'h0)] wire64;
  wire [(4'ha):(1'h0)] wire63;
  wire signed [(5'h15):(1'h0)] wire62;
  wire [(3'h4):(1'h0)] wire60;
  wire [(4'hb):(1'h0)] wire59;
  wire [(2'h2):(1'h0)] wire58;
  wire [(5'h10):(1'h0)] wire57;
  wire signed [(5'h12):(1'h0)] wire56;
  wire [(2'h2):(1'h0)] wire44;
  wire [(3'h6):(1'h0)] wire43;
  wire signed [(3'h6):(1'h0)] wire42;
  reg signed [(4'hd):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg54 = (1'h0);
  reg [(4'hd):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  reg [(5'h12):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg50 = (1'h0);
  reg [(5'h11):(1'h0)] reg49 = (1'h0);
  reg [(5'h10):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg45 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire44,
                 wire43,
                 wire42,
                 reg61,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire42 = wire39[(4'h8):(2'h3)];
  assign wire43 = wire42[(3'h6):(2'h3)];
  assign wire44 = ($signed($signed({$signed(wire37)})) ?
                      wire38[(3'h5):(2'h3)] : wire40);
  always
    @(posedge clk) begin
      reg45 <= (($signed((~^{wire38})) <<< {$unsigned($unsigned(wire44))}) ?
          $signed($unsigned($signed(wire40[(1'h0):(1'h0)]))) : ((~{(8'ha2),
              $unsigned(wire41)}) | wire37[(1'h0):(1'h0)]));
      reg46 <= wire42;
      if ($unsigned(({reg45, ((reg45 >> wire42) == (|wire38))} ?
          wire40 : ((&{wire39}) ?
              reg45[(4'hd):(3'h5)] : ({reg45, wire39} >>> $signed(wire43))))))
        begin
          reg47 <= ($unsigned((wire41 ?
              {((8'hac) ^~ reg45), (|wire43)} : $unsigned((reg46 ?
                  (8'h9f) : (7'h42))))) ^ {$unsigned((~$signed(wire41)))});
        end
      else
        begin
          reg47 <= wire37;
          reg48 <= (wire37 <<< reg47[(2'h2):(2'h2)]);
          reg49 <= $signed(wire37);
          if (wire44)
            begin
              reg50 <= reg47;
              reg51 <= (reg46 <= (~$signed((^(^reg50)))));
            end
          else
            begin
              reg50 <= reg46;
              reg51 <= reg51[(4'hf):(1'h1)];
              reg52 <= ($unsigned(reg48[(3'h6):(2'h3)]) ?
                  $unsigned(reg45[(3'h5):(2'h3)]) : wire42[(2'h3):(2'h3)]);
              reg53 <= $signed((wire39 ?
                  wire42 : $signed(reg52[(2'h2):(1'h1)])));
            end
          reg54 <= $unsigned($signed({reg46,
              ((wire37 ~^ wire43) ? wire40 : (wire41 + wire41))}));
        end
      reg55 <= ((8'hb8) ?
          $signed(((wire39[(1'h0):(1'h0)] ?
              (wire44 ?
                  wire44 : reg50) : $signed(reg49)) + reg46)) : $signed(wire37[(3'h6):(1'h1)]));
    end
  assign wire56 = $unsigned((!($unsigned(wire40) <= wire40[(3'h4):(1'h1)])));
  assign wire57 = wire37;
  assign wire58 = (8'hbe);
  assign wire59 = $unsigned((!reg49[(4'hd):(3'h4)]));
  assign wire60 = $unsigned($unsigned(wire40[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg61 <= reg55;
    end
  assign wire62 = $signed({$signed(($unsigned((8'hba)) | wire41))});
  assign wire63 = wire57;
  assign wire64 = {$unsigned(wire62),
                      ($signed($unsigned(((8'had) ? wire59 : wire62))) ?
                          $unsigned(($signed(wire59) & (reg55 ?
                              wire42 : (8'hbd)))) : (((wire40 ?
                                  (8'hbc) : wire59) ?
                              (&wire39) : $unsigned(wire38)) | ($unsigned(reg47) + (wire57 && wire39))))};
  assign wire65 = (wire37 ^~ (+wire37));
  assign wire66 = ($unsigned($signed(wire41)) ?
                      ({wire39[(1'h0):(1'h0)]} ^~ (~&reg46)) : (wire42 ?
                          (^~($signed(reg46) != $signed(wire59))) : $signed(($unsigned(wire62) ?
                              $signed((8'haa)) : $unsigned(wire37)))));
  assign wire67 = $signed(reg45);
  assign wire68 = $signed((^(reg46 + wire57)));
  assign wire69 = (((($unsigned(reg46) | $signed(reg50)) > {wire58[(2'h2):(1'h1)],
                      (|reg47)}) > {(-(~|wire58)),
                      (wire41 ? (8'hb4) : $signed(wire64))}) >> (|(-wire62)));
endmodule
