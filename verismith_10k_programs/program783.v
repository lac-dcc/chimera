module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire0;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire [(2'h3):(1'h0)] wire115;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire9;
  wire [(4'hb):(1'h0)] wire15;
  wire signed [(5'h11):(1'h0)] wire16;
  wire signed [(4'hf):(1'h0)] wire53;
  wire [(4'he):(1'h0)] wire55;
  wire signed [(3'h5):(1'h0)] wire113;
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  assign y = {wire115,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire15,
                 wire16,
                 wire53,
                 wire55,
                 wire113,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 (1'h0)};
  assign wire5 = wire4;
  assign wire6 = (wire3 | (($unsigned({wire4}) <<< wire0[(1'h1):(1'h1)]) >> wire1));
  assign wire7 = {(^wire0[(3'h6):(2'h2)])};
  assign wire8 = $unsigned((&($unsigned((wire2 ? wire1 : (7'h42))) ?
                     (8'ha1) : (+$signed(wire4)))));
  assign wire9 = $unsigned($signed((wire0[(4'hb):(2'h3)] ?
                     ($unsigned(wire0) < (wire2 ?
                         wire1 : wire7)) : (wire3 == {wire3, wire0}))));
  always
    @(posedge clk) begin
      reg10 <= $signed((^~$signed(wire5)));
      if (wire9)
        begin
          reg11 <= wire4;
          reg12 <= reg10[(1'h0):(1'h0)];
          reg13 <= ($signed((^~{$unsigned(wire7)})) ?
              (&((8'ha4) ?
                  wire2 : ((wire5 == wire3) ?
                      wire6[(4'h9):(3'h5)] : (~&wire9)))) : wire3[(2'h2):(1'h1)]);
          reg14 <= (~|(wire7[(1'h1):(1'h0)] || (8'hb4)));
        end
      else
        begin
          reg11 <= $unsigned((8'hbd));
        end
    end
  assign wire15 = $unsigned({(($signed(wire6) <= wire3) >>> (|(wire9 * wire4))),
                      wire4[(2'h3):(1'h0)]});
  assign wire16 = ((|({{reg14}} ? reg13[(1'h0):(1'h0)] : wire5)) ?
                      (({wire6[(4'ha):(3'h7)]} || wire6) ?
                          $unsigned(reg11[(2'h2):(1'h1)]) : (wire1[(1'h0):(1'h0)] ?
                              ((!reg10) ?
                                  (wire2 <= wire5) : wire9) : ((&wire0) ?
                                  (wire8 ? reg12 : wire15) : (wire7 ?
                                      wire9 : (8'ha8))))) : ((~^$signed((reg10 >> wire8))) ?
                          wire9 : ($signed(wire6) ?
                              (wire8 ?
                                  ((8'ha6) ?
                                      wire15 : reg10) : $unsigned(wire1)) : reg11)));
  module17 #() modinst54 (wire53, clk, reg13, wire6, reg11, reg12, wire9);
  assign wire55 = wire2;
  module56 #() modinst114 (.wire61(wire5), .wire59(wire4), .wire58(wire9), .wire57(wire53), .clk(clk), .wire60(wire6), .y(wire113));
  assign wire115 = ((^~$signed((wire2[(4'hc):(3'h7)] != wire113))) ?
                       wire55[(3'h6):(1'h0)] : (!$unsigned({$unsigned(wire5)})));
endmodule

module module56
#(parameter param112 = (8'ha7))
(y, clk, wire57, wire58, wire59, wire60, wire61);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire57;
  input wire [(4'ha):(1'h0)] wire58;
  input wire signed [(5'h15):(1'h0)] wire59;
  input wire signed [(4'h9):(1'h0)] wire60;
  input wire signed [(4'hc):(1'h0)] wire61;
  wire [(3'h7):(1'h0)] wire111;
  wire signed [(2'h2):(1'h0)] wire62;
  wire [(5'h11):(1'h0)] wire63;
  wire [(2'h3):(1'h0)] wire64;
  wire signed [(5'h12):(1'h0)] wire65;
  wire [(5'h11):(1'h0)] wire109;
  assign y = {wire111, wire62, wire63, wire64, wire65, wire109, (1'h0)};
  assign wire62 = {wire59[(3'h7):(2'h2)], wire58[(1'h1):(1'h0)]};
  assign wire63 = wire62;
  assign wire64 = $signed(wire59);
  assign wire65 = (^{$unsigned(wire59)});
  module66 #() modinst110 (wire109, clk, wire61, wire58, wire65, wire57, wire64);
  assign wire111 = wire109;
endmodule

module module17
#(parameter param52 = ((8'hbb) ? (+(^~{((7'h43) >= (7'h42)), ((8'haf) ^~ (7'h40))})) : ((8'hb5) ? (|{((7'h41) ? (8'ha0) : (7'h44)), (^(7'h44))}) : (!({(8'ha0)} << (^(8'hac)))))))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'hf4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire22;
  input wire [(4'he):(1'h0)] wire21;
  input wire signed [(4'hb):(1'h0)] wire20;
  input wire [(5'h14):(1'h0)] wire19;
  input wire signed [(4'hf):(1'h0)] wire18;
  wire [(2'h2):(1'h0)] wire51;
  wire signed [(4'he):(1'h0)] wire50;
  wire [(5'h15):(1'h0)] wire49;
  wire [(5'h11):(1'h0)] wire46;
  wire [(5'h11):(1'h0)] wire36;
  wire signed [(5'h12):(1'h0)] wire35;
  wire signed [(5'h14):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire23;
  reg [(3'h5):(1'h0)] reg48 = (1'h0);
  reg [(5'h10):(1'h0)] reg47 = (1'h0);
  reg [(5'h10):(1'h0)] reg45 = (1'h0);
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg42 = (1'h0);
  reg signed [(4'he):(1'h0)] reg41 = (1'h0);
  reg [(4'h9):(1'h0)] reg40 = (1'h0);
  reg [(3'h7):(1'h0)] reg39 = (1'h0);
  reg [(2'h2):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire46,
                 wire36,
                 wire35,
                 wire33,
                 wire23,
                 reg48,
                 reg47,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire23 = (~&wire19);
  module24 #() modinst34 (wire33, clk, wire19, wire18, wire23, wire21);
  assign wire35 = $signed(wire19[(1'h0):(1'h0)]);
  assign wire36 = wire22;
  always
    @(posedge clk) begin
      if (wire19[(5'h12):(1'h0)])
        begin
          reg37 <= (!wire22);
        end
      else
        begin
          reg37 <= (-{$unsigned($signed($unsigned(wire18)))});
          reg38 <= wire19[(4'hf):(4'hc)];
          reg39 <= {(wire36 ? wire35 : wire33[(1'h1):(1'h1)])};
        end
      if ($unsigned((7'h43)))
        begin
          reg40 <= $signed({{$unsigned($signed(reg39))},
              ($unsigned($unsigned((8'haa))) ?
                  wire18[(1'h0):(1'h0)] : $unsigned({wire22}))});
          if ({(8'ha9)})
            begin
              reg41 <= $signed($unsigned((+{(wire20 ? wire19 : wire20),
                  $unsigned((8'hb6))})));
              reg42 <= ((-wire36) ?
                  (~|((7'h43) > wire33[(4'ha):(1'h1)])) : ($signed(wire33[(1'h1):(1'h0)]) != $unsigned((8'hb1))));
            end
          else
            begin
              reg41 <= ((~^wire35) & (wire35 ?
                  (~reg40[(2'h2):(1'h1)]) : {reg39, (~reg42[(4'h8):(3'h4)])}));
              reg42 <= (8'h9d);
              reg43 <= ($signed((!$unsigned($unsigned(reg40)))) > ((8'haf) + ($unsigned({(8'hb2),
                      wire21}) ?
                  reg38[(1'h0):(1'h0)] : ((wire18 ?
                      wire18 : wire20) ^~ $signed(wire36)))));
            end
        end
      else
        begin
          if (wire20[(3'h7):(3'h7)])
            begin
              reg40 <= ($signed(reg39) ?
                  (|($unsigned((8'hb3)) >>> reg42[(5'h10):(5'h10)])) : wire33);
              reg41 <= $unsigned(((~|{$unsigned((8'hb1)), $unsigned(reg42)}) ?
                  $unsigned(reg41) : (reg37[(4'ha):(3'h4)] + (+(reg40 >= wire36)))));
              reg42 <= (&{(wire23 ? (~|wire35) : reg40)});
            end
          else
            begin
              reg40 <= $unsigned(wire36[(4'h8):(3'h7)]);
              reg41 <= $signed(reg40[(3'h5):(1'h0)]);
              reg42 <= $signed((wire36[(4'hd):(3'h5)] ?
                  (8'ha1) : (reg38[(2'h2):(1'h1)] ?
                      (((8'hb8) & wire36) << reg37[(2'h2):(1'h0)]) : (((8'hbe) && wire22) ?
                          reg39[(1'h1):(1'h1)] : $signed((8'ha8))))));
              reg43 <= wire21;
              reg44 <= ((^~(-((reg41 || wire33) ?
                      wire35[(2'h3):(2'h2)] : reg37[(4'h8):(3'h7)]))) ?
                  wire20[(2'h3):(1'h0)] : (^(!wire19)));
            end
        end
      reg45 <= wire23[(3'h6):(1'h0)];
    end
  assign wire46 = ((wire18 ~^ (^~((reg44 && wire22) * reg42))) + ((reg43 ?
                          $unsigned(reg42[(3'h7):(3'h7)]) : $unsigned((reg40 ?
                              reg43 : wire23))) ?
                      $unsigned($unsigned(reg43[(3'h4):(2'h3)])) : ($unsigned((8'ha1)) != (~^{reg37,
                          (8'hb0)}))));
  always
    @(posedge clk) begin
      reg47 <= $unsigned(((((wire36 << reg41) | reg43[(4'hc):(2'h2)]) == ($unsigned(reg38) ^~ (|wire36))) * (wire23 | {$signed(reg42),
          {(8'ha6), reg45}})));
      reg48 <= wire21;
    end
  assign wire49 = (^~(8'hb6));
  assign wire50 = {((((wire36 & reg40) ?
                              $unsigned(reg48) : (8'hab)) != (reg43[(4'he):(3'h4)] ?
                              (reg37 ? wire36 : (8'hb0)) : (wire23 ?
                                  wire35 : wire49))) ?
                          wire46 : $unsigned(($unsigned(reg39) ?
                              (reg41 ?
                                  wire23 : wire46) : wire23[(3'h4):(3'h4)])))};
  assign wire51 = ($signed(({(reg44 ? (8'hb4) : reg42),
                          ((8'hb5) ? reg37 : wire20)} ?
                      {$unsigned(wire36)} : {wire23[(1'h1):(1'h1)]})) & reg40[(3'h6):(3'h5)]);
endmodule

module module24  (y, clk, wire28, wire27, wire26, wire25);
  output wire [(32'h18):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire28;
  input wire signed [(4'hf):(1'h0)] wire27;
  input wire signed [(3'h7):(1'h0)] wire26;
  input wire signed [(4'he):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire32;
  wire [(4'ha):(1'h0)] wire31;
  wire [(2'h2):(1'h0)] wire30;
  wire [(3'h5):(1'h0)] wire29;
  assign y = {wire32, wire31, wire30, wire29, (1'h0)};
  assign wire29 = (($signed({((8'hbe) && (7'h41)),
                      (wire26 ?
                          wire27 : wire26)}) < (^(|$signed((8'ha1))))) << $unsigned((~^$signed({wire28,
                      wire28}))));
  assign wire30 = ($unsigned($unsigned(wire26[(2'h3):(1'h0)])) ?
                      $signed((+(^(wire25 ? wire25 : wire25)))) : (wire25 ?
                          wire26[(1'h1):(1'h1)] : {(~|wire26[(1'h0):(1'h0)]),
                              wire26}));
  assign wire31 = $unsigned((wire29[(2'h2):(1'h0)] ?
                      (~^{wire27, $signed(wire30)}) : $unsigned(((-wire28) ?
                          (7'h42) : (-wire28)))));
  assign wire32 = wire26;
endmodule

module module66  (y, clk, wire71, wire70, wire69, wire68, wire67);
  output wire [(32'h1bd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire71;
  input wire signed [(4'ha):(1'h0)] wire70;
  input wire signed [(4'h9):(1'h0)] wire69;
  input wire [(4'hf):(1'h0)] wire68;
  input wire signed [(2'h3):(1'h0)] wire67;
  wire [(4'he):(1'h0)] wire108;
  wire [(3'h7):(1'h0)] wire107;
  wire [(4'hd):(1'h0)] wire106;
  wire signed [(3'h4):(1'h0)] wire105;
  wire [(4'ha):(1'h0)] wire104;
  wire signed [(4'he):(1'h0)] wire103;
  wire signed [(3'h5):(1'h0)] wire83;
  wire signed [(3'h5):(1'h0)] wire80;
  wire [(4'hf):(1'h0)] wire79;
  wire signed [(3'h4):(1'h0)] wire78;
  wire [(3'h4):(1'h0)] wire77;
  wire signed [(4'hd):(1'h0)] wire76;
  wire [(4'hd):(1'h0)] wire75;
  wire [(5'h12):(1'h0)] wire73;
  wire signed [(5'h13):(1'h0)] wire72;
  reg signed [(2'h3):(1'h0)] reg102 = (1'h0);
  reg [(5'h10):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg99 = (1'h0);
  reg [(4'h9):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg96 = (1'h0);
  reg [(5'h10):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg94 = (1'h0);
  reg [(3'h5):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg91 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg89 = (1'h0);
  reg [(4'h8):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg85 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg84 = (1'h0);
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg81 = (1'h0);
  reg [(3'h5):(1'h0)] reg74 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire83,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire73,
                 wire72,
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
                 reg82,
                 reg81,
                 reg74,
                 (1'h0)};
  assign wire72 = ({$signed(((wire67 ? wire70 : (8'ha5)) | wire70)),
                      wire70} >= wire70[(3'h7):(3'h6)]);
  assign wire73 = $signed(((8'ha3) ?
                      (((-wire68) ?
                          (~&wire70) : $signed(wire69)) ~^ $signed((&(8'hac)))) : wire68));
  always
    @(posedge clk) begin
      reg74 <= wire67;
    end
  assign wire75 = (~$signed(wire73[(2'h2):(2'h2)]));
  assign wire76 = (+{$signed({wire70, wire68})});
  assign wire77 = $signed(((^wire75) ?
                      wire67 : $signed(wire72[(4'ha):(1'h0)])));
  assign wire78 = wire76[(4'h9):(4'h9)];
  assign wire79 = wire71;
  assign wire80 = {$signed((8'h9e))};
  always
    @(posedge clk) begin
      reg81 <= wire76;
      reg82 <= (~|wire71);
    end
  assign wire83 = $signed(($unsigned($unsigned((~^wire76))) ?
                      (-$unsigned(wire78[(1'h0):(1'h0)])) : $signed(reg74)));
  always
    @(posedge clk) begin
      reg84 <= ({$unsigned((!$unsigned(wire68))),
              ($unsigned($unsigned(wire67)) < $unsigned((wire78 ?
                  wire83 : wire68)))} ?
          $unsigned($signed({$unsigned(wire69)})) : (^~{((&reg82) ?
                  wire77[(3'h4):(3'h4)] : (8'hb7)),
              (~(wire80 ? reg74 : wire75))}));
      reg85 <= ((~^$signed($unsigned(((8'ha7) ?
          wire80 : wire78)))) >>> (($signed((|wire69)) ?
              wire75 : {wire78[(1'h1):(1'h0)], wire68}) ?
          {$signed($unsigned(wire68)),
              ((8'hb6) ~^ wire68)} : $signed((8'hb8))));
      if (wire80)
        begin
          reg86 <= wire78[(2'h2):(1'h1)];
          reg87 <= (reg85 ?
              (~&$unsigned(((|wire71) ? (~wire75) : (^~reg86)))) : wire76);
          if ({$unsigned((wire70 ? $unsigned(wire75) : wire76[(4'hb):(1'h1)])),
              wire73[(4'h8):(3'h6)]})
            begin
              reg88 <= wire76;
              reg89 <= $unsigned(wire75);
              reg90 <= $unsigned($unsigned(((~&$signed((8'ha9))) ?
                  wire75[(4'h8):(4'h8)] : reg84)));
              reg91 <= $signed((((&(wire71 >= wire83)) ?
                      ((reg86 ? (8'ha1) : reg89) >>> reg88) : reg85) ?
                  (^$signed((8'had))) : wire75));
            end
          else
            begin
              reg88 <= wire69[(1'h1):(1'h1)];
              reg89 <= $unsigned(wire67[(2'h2):(2'h2)]);
            end
          if ((($signed(reg85) <= $unsigned(($unsigned(reg87) > wire79[(1'h1):(1'h1)]))) ~^ {$unsigned(({wire72} < wire70)),
              $signed(((-wire69) ? (reg89 - reg91) : {wire67, reg89}))}))
            begin
              reg92 <= reg82[(5'h10):(1'h0)];
              reg93 <= {(!(8'h9c)), {(|(&reg85[(5'h11):(3'h6)]))}};
              reg94 <= (wire70 & (~^(8'hb2)));
              reg95 <= $unsigned($signed($unsigned(((|wire70) ?
                  (reg81 - wire78) : reg88[(3'h4):(3'h4)]))));
            end
          else
            begin
              reg92 <= $unsigned(reg91[(5'h13):(5'h11)]);
              reg93 <= wire76;
              reg94 <= $signed(wire68[(2'h3):(2'h3)]);
              reg95 <= ((-$unsigned(((wire71 ?
                  wire70 : reg88) + ((8'hae) >= (8'ha9))))) < {(wire71[(2'h2):(1'h1)] ?
                      ($signed(wire68) ?
                          (^(8'ha2)) : (reg88 <= wire72)) : ($unsigned(reg82) ?
                          wire78 : (reg81 && (8'ha2)))),
                  $signed(((+wire77) * $unsigned(reg81)))});
              reg96 <= reg86;
            end
          if ($signed((&((~$unsigned(reg89)) + reg88[(2'h3):(2'h3)]))))
            begin
              reg97 <= $signed({(8'hba),
                  $unsigned({reg85, (wire75 != reg81)})});
              reg98 <= $unsigned(reg86[(3'h7):(1'h1)]);
              reg99 <= (~&(+(reg98[(4'h8):(3'h7)] << ({wire79,
                  (7'h40)} >= (~wire75)))));
            end
          else
            begin
              reg97 <= {$unsigned((+$signed(reg89))), wire68[(1'h1):(1'h1)]};
              reg98 <= wire75;
              reg99 <= (~|$unsigned($unsigned($signed((wire80 ?
                  (8'h9e) : wire76)))));
              reg100 <= {(~reg89[(3'h4):(2'h2)])};
            end
        end
      else
        begin
          reg86 <= $signed(((reg74[(1'h0):(1'h0)] ?
                  ($signed(wire75) && $unsigned((8'ha8))) : $signed($signed(reg85))) ?
              $signed($unsigned(reg82[(4'he):(4'hc)])) : reg97[(3'h6):(3'h6)]));
        end
      reg101 <= $signed($signed({((reg99 >> wire76) >= reg84[(1'h1):(1'h0)])}));
      reg102 <= (~$unsigned((-((reg87 ? reg84 : reg92) + $unsigned((8'h9d))))));
    end
  assign wire103 = wire77[(3'h4):(1'h1)];
  assign wire104 = (^($unsigned((((8'ha8) ? reg100 : reg82) ?
                           $unsigned(reg99) : $signed((7'h43)))) ?
                       ((~$signed((8'hb6))) ?
                           $signed(reg95[(3'h4):(2'h2)]) : wire72) : $unsigned($unsigned((^~reg81)))));
  assign wire105 = wire67;
  assign wire106 = $unsigned($signed(($unsigned((&reg86)) - reg86[(3'h5):(1'h0)])));
  assign wire107 = ($unsigned({((reg84 >>> wire75) ?
                           ((8'hb8) ?
                               (8'ha1) : reg89) : wire105)}) <= reg82[(4'he):(4'hd)]);
  assign wire108 = (-$signed((((reg86 ? reg95 : (8'hb0)) ? {wire104} : wire71) ?
                       ($signed(wire69) ?
                           wire69[(1'h0):(1'h0)] : (reg97 <= wire79)) : wire105[(2'h3):(1'h1)])));
endmodule
