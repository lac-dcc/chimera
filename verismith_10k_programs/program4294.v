module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h193):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire4;
  wire [(3'h6):(1'h0)] wire132;
  wire [(5'h12):(1'h0)] wire91;
  wire [(5'h15):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire48;
  wire signed [(4'he):(1'h0)] wire93;
  wire [(4'hb):(1'h0)] wire94;
  wire signed [(5'h13):(1'h0)] wire95;
  wire [(4'hc):(1'h0)] wire96;
  wire [(5'h15):(1'h0)] wire97;
  wire [(5'h12):(1'h0)] wire103;
  wire [(4'h9):(1'h0)] wire104;
  wire [(4'h9):(1'h0)] wire105;
  wire [(5'h14):(1'h0)] wire106;
  wire signed [(4'he):(1'h0)] wire107;
  wire signed [(3'h7):(1'h0)] wire130;
  reg signed [(4'he):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg101 = (1'h0);
  reg [(5'h14):(1'h0)] reg100 = (1'h0);
  reg [(5'h10):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  assign y = {wire132,
                 wire91,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire48,
                 wire93,
                 wire94,
                 wire95,
                 wire96,
                 wire97,
                 wire103,
                 wire104,
                 wire105,
                 wire106,
                 wire107,
                 wire130,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg11,
                 reg12,
                 reg13,
                 (1'h0)};
  assign wire5 = $unsigned($signed(((^~{wire4}) ?
                     ($unsigned(wire1) ~^ (8'hb7)) : $unsigned(wire0[(1'h1):(1'h1)]))));
  assign wire6 = {wire1};
  assign wire7 = $signed(wire2);
  assign wire8 = wire3[(2'h3):(2'h2)];
  assign wire9 = wire3;
  assign wire10 = (~&$signed(wire1));
  always
    @(posedge clk) begin
      reg11 <= (wire0[(1'h0):(1'h0)] ?
          ($unsigned(wire7[(3'h6):(3'h6)]) * wire1) : {$unsigned((wire3 ?
                  (~|wire1) : (wire8 ? wire10 : wire10))),
              ((wire4 ? (wire6 < (8'hb7)) : (-wire1)) ?
                  ((&wire2) ? (wire9 ? wire3 : wire10) : {wire8}) : wire6)});
      reg12 <= (~^wire7);
      reg13 <= wire8;
    end
  module14 #() modinst49 (.wire16(wire4), .wire18(reg12), .wire19(wire5), .wire15(wire10), .y(wire48), .clk(clk), .wire17(reg13));
  module50 #() modinst92 (wire91, clk, wire2, wire10, wire48, reg12);
  assign wire93 = $signed($unsigned($unsigned(wire0[(2'h3):(1'h1)])));
  assign wire94 = (({((~&reg13) > (wire9 <<< wire91)), reg11[(4'h8):(2'h3)]} ?
                          wire10 : {wire0, $unsigned((reg11 != (8'hba)))}) ?
                      wire0[(2'h2):(1'h0)] : $unsigned((|{$signed(wire1),
                          (wire93 ? wire1 : wire91)})));
  assign wire95 = wire91[(5'h12):(2'h3)];
  assign wire96 = wire94;
  assign wire97 = wire95;
  always
    @(posedge clk) begin
      reg98 <= $unsigned((&$unsigned((^~(wire6 * wire96)))));
      reg99 <= (wire97 <<< reg12[(3'h6):(3'h4)]);
      reg100 <= $unsigned(($signed(wire1[(4'ha):(4'ha)]) ?
          ({((8'h9e) ? wire97 : (8'hae)),
              wire9[(2'h2):(1'h1)]} - ((wire3 | reg13) ?
              wire97[(2'h3):(1'h1)] : $unsigned(wire93))) : (|$unsigned({reg99,
              wire1}))));
      reg101 <= ($unsigned($signed($signed((reg99 != reg13)))) > $signed($unsigned(wire3[(2'h2):(2'h2)])));
      reg102 <= wire8[(1'h1):(1'h0)];
    end
  assign wire103 = reg11[(3'h5):(3'h4)];
  assign wire104 = $signed((!$unsigned($unsigned(reg11))));
  assign wire105 = (&({$unsigned((wire10 ? wire6 : (7'h42)))} ?
                       $unsigned($signed(reg98[(2'h2):(1'h1)])) : wire2));
  assign wire106 = ((reg101[(3'h7):(3'h4)] ?
                           (wire9 ?
                               wire95 : {wire104,
                                   (8'hb1)}) : ($unsigned((reg102 ?
                               wire91 : wire91)) + reg101)) ?
                       wire6 : wire48);
  assign wire107 = reg100[(5'h11):(5'h10)];
  module108 #() modinst131 (.wire113(wire0), .wire112(wire103), .wire109(wire105), .clk(clk), .wire111(wire7), .y(wire130), .wire110(wire9));
  assign wire132 = (wire95[(1'h1):(1'h0)] ?
                       ((($unsigned((8'hab)) ?
                                   (~|reg98) : (wire10 >= (8'hbd))) ?
                               (^$signed((8'ha5))) : wire6) ?
                           $unsigned({(reg100 != wire97)}) : (wire105[(4'h8):(3'h5)] >>> (|reg12))) : $unsigned((($unsigned(wire91) ?
                               $signed((7'h41)) : $signed(wire130)) ?
                           $signed((~&wire48)) : wire106)));
endmodule

module module108
#(parameter param129 = (!(~((~|((8'hae) > (7'h40))) > (((8'h9d) ? (8'h9d) : (8'had)) ? ((8'hbc) ? (8'hb7) : (8'hb9)) : (&(8'had)))))))
(y, clk, wire113, wire112, wire111, wire110, wire109);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire113;
  input wire signed [(5'h12):(1'h0)] wire112;
  input wire signed [(3'h7):(1'h0)] wire111;
  input wire [(4'hc):(1'h0)] wire110;
  input wire [(2'h3):(1'h0)] wire109;
  wire signed [(4'hd):(1'h0)] wire128;
  wire [(5'h13):(1'h0)] wire127;
  wire [(3'h5):(1'h0)] wire126;
  wire signed [(4'he):(1'h0)] wire117;
  wire [(3'h4):(1'h0)] wire116;
  wire [(5'h10):(1'h0)] wire115;
  wire [(3'h7):(1'h0)] wire114;
  reg signed [(4'he):(1'h0)] reg125 = (1'h0);
  reg [(5'h13):(1'h0)] reg124 = (1'h0);
  reg [(3'h5):(1'h0)] reg123 = (1'h0);
  reg [(5'h12):(1'h0)] reg122 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg120 = (1'h0);
  reg [(3'h7):(1'h0)] reg119 = (1'h0);
  reg [(2'h3):(1'h0)] reg118 = (1'h0);
  assign y = {wire128,
                 wire127,
                 wire126,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 (1'h0)};
  assign wire114 = wire110;
  assign wire115 = $unsigned((($signed($signed(wire112)) ?
                           wire113[(2'h3):(2'h3)] : {$signed(wire112),
                               (wire111 ? wire111 : (8'hb6))}) ?
                       (8'h9e) : $unsigned(((^wire111) > wire114[(1'h1):(1'h1)]))));
  assign wire116 = $unsigned({(~|$signed(wire111)), wire115});
  assign wire117 = (wire114[(1'h1):(1'h1)] ?
                       $unsigned(wire113[(4'ha):(3'h6)]) : (^~wire114[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      reg118 <= $signed((+((wire115 <= wire109[(1'h1):(1'h1)]) + wire112)));
      reg119 <= wire116;
      if ($unsigned($unsigned(wire109)))
        begin
          reg120 <= $signed(wire116);
        end
      else
        begin
          reg120 <= wire114[(3'h6):(2'h2)];
        end
      reg121 <= wire116;
      if (wire116)
        begin
          reg122 <= $signed((&(~{$unsigned(wire111)})));
          if ((reg121[(3'h4):(1'h1)] ?
              {{((^reg118) ?
                          wire111[(3'h5):(1'h1)] : reg119[(2'h2):(2'h2)])}} : (wire117[(4'ha):(3'h5)] >> ({wire111[(1'h0):(1'h0)],
                      $unsigned((8'hb3))} ?
                  wire117 : wire112))))
            begin
              reg123 <= $unsigned(wire111[(2'h2):(1'h0)]);
              reg124 <= $signed($unsigned($unsigned($unsigned((reg121 ?
                  (8'h9f) : reg122)))));
            end
          else
            begin
              reg123 <= {reg118};
              reg124 <= ($unsigned((+(reg120 ?
                  (!reg123) : reg121))) | ((reg120 ?
                  ((&reg118) ?
                      $signed(wire115) : (-wire109)) : $unsigned($signed((8'hbe)))) - $unsigned((~^(|(7'h41))))));
              reg125 <= (wire109[(2'h2):(1'h0)] >= ((((^wire116) ~^ wire109[(1'h1):(1'h0)]) ?
                      {(-wire111)} : {$unsigned(reg121)}) ?
                  reg120[(4'h8):(3'h4)] : $unsigned(reg119[(3'h5):(3'h5)])));
            end
        end
      else
        begin
          reg122 <= {(wire110[(4'hc):(2'h3)] ?
                  (~&(|$signed((8'h9f)))) : ((8'ha3) ?
                      ((~^wire116) ^~ {wire116}) : ($unsigned(wire110) ?
                          (~^reg122) : ((8'hb1) ? reg124 : wire112)))),
              $unsigned(wire113)};
        end
    end
  assign wire126 = (^$signed(wire117));
  assign wire127 = wire110[(4'h9):(1'h1)];
  assign wire128 = wire117[(3'h7):(1'h0)];
endmodule

module module50
#(parameter param90 = (((({(8'hba), (8'ha3)} || ((8'hb8) ? (8'haa) : (8'ha5))) ? {(&(8'ha3))} : {((8'ha7) <= (8'h9c)), (~&(8'hae))}) ? ((((8'hb9) ? (7'h44) : (8'hba)) >> {(8'ha4)}) ? (((7'h44) > (8'hab)) ? (8'ha0) : ((8'haa) != (8'hab))) : ((~(7'h42)) ? (~&(8'ha4)) : ((8'hac) ^~ (8'hb6)))) : {((!(8'hac)) ? ((8'ha1) != (8'hb4)) : ((8'ha3) ? (8'ha8) : (8'hbe))), (!(~&(8'hbe)))}) << (((7'h42) ? {(^~(8'haa))} : (~&(~|(8'ha7)))) ~^ {((&(7'h40)) ? (|(8'hbc)) : {(8'haf)}), (((8'hb0) ? (8'hb8) : (8'hb8)) ? (|(8'hbd)) : (^~(8'hab)))})))
(y, clk, wire54, wire53, wire52, wire51);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire54;
  input wire signed [(5'h10):(1'h0)] wire53;
  input wire [(5'h10):(1'h0)] wire52;
  input wire [(4'hf):(1'h0)] wire51;
  wire [(5'h15):(1'h0)] wire89;
  wire signed [(4'hf):(1'h0)] wire87;
  wire signed [(5'h15):(1'h0)] wire57;
  wire signed [(5'h14):(1'h0)] wire56;
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  assign y = {wire89, wire87, wire57, wire56, reg55, (1'h0)};
  always
    @(posedge clk) begin
      reg55 <= wire52[(4'hc):(3'h5)];
    end
  assign wire56 = (&$unsigned(((~^(wire54 ? (8'hbd) : reg55)) ?
                      ($unsigned(reg55) > wire51[(4'hf):(4'hb)]) : wire51[(1'h1):(1'h0)])));
  assign wire57 = (wire54 & {$signed(wire51[(3'h7):(1'h1)]), (&wire54)});
  module58 #() modinst88 (.clk(clk), .wire61(reg55), .y(wire87), .wire59(wire52), .wire62(wire51), .wire63(wire57), .wire60(wire53));
  assign wire89 = wire57[(1'h0):(1'h0)];
endmodule

module module14  (y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'h110):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire19;
  input wire signed [(4'hc):(1'h0)] wire18;
  input wire signed [(2'h2):(1'h0)] wire17;
  input wire signed [(4'h9):(1'h0)] wire16;
  input wire signed [(2'h2):(1'h0)] wire15;
  wire [(3'h4):(1'h0)] wire47;
  wire [(4'h8):(1'h0)] wire34;
  wire signed [(4'hd):(1'h0)] wire33;
  wire [(5'h12):(1'h0)] wire32;
  wire [(3'h5):(1'h0)] wire31;
  wire signed [(4'hb):(1'h0)] wire30;
  wire [(4'hc):(1'h0)] wire29;
  wire signed [(4'hd):(1'h0)] wire28;
  reg signed [(3'h7):(1'h0)] reg46 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg [(3'h4):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg43 = (1'h0);
  reg [(3'h7):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg38 = (1'h0);
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  assign y = {wire47,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
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
                 reg35,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg20 <= wire16;
      reg21 <= (8'haf);
      reg22 <= (8'hba);
      reg23 <= {(8'hbb)};
      if (reg22[(1'h0):(1'h0)])
        begin
          if ($signed((!reg22[(2'h2):(1'h0)])))
            begin
              reg24 <= ($signed($signed($signed($unsigned(wire16)))) ~^ wire17);
            end
          else
            begin
              reg24 <= reg24[(4'ha):(3'h6)];
              reg25 <= wire19;
              reg26 <= (~^$unsigned(reg22));
              reg27 <= $signed((($unsigned($signed(wire18)) && reg25) - reg21));
            end
        end
      else
        begin
          reg24 <= reg26;
          if (reg24[(3'h4):(1'h0)])
            begin
              reg25 <= $unsigned(($signed((~&$unsigned(wire15))) * $unsigned(((reg25 ~^ wire16) ?
                  (+(8'h9d)) : (~^reg26)))));
              reg26 <= wire17[(1'h1):(1'h1)];
            end
          else
            begin
              reg25 <= reg27[(3'h4):(1'h0)];
              reg26 <= ((!reg26[(1'h1):(1'h1)]) ?
                  ($unsigned(wire17) ?
                      ($unsigned((+reg25)) && reg27[(1'h1):(1'h1)]) : {((reg20 ?
                                  reg26 : reg26) ?
                              (8'had) : $signed(wire19))}) : (+reg23));
              reg27 <= (~&((wire16[(1'h0):(1'h0)] ?
                  wire18[(4'hb):(3'h5)] : reg21) && (^wire15)));
            end
        end
    end
  assign wire28 = ({{wire19[(1'h1):(1'h0)]},
                          $signed($unsigned($unsigned(reg25)))} ?
                      (+$unsigned(reg25[(4'hc):(4'hb)])) : reg26[(3'h7):(2'h2)]);
  assign wire29 = ((!({reg24, (-reg27)} ?
                          ({wire17} - (reg24 <= (8'hac))) : $unsigned(reg21))) ?
                      $unsigned($unsigned((&(reg27 && wire18)))) : $signed(wire16));
  assign wire30 = $signed(($signed(wire28) || wire19));
  assign wire31 = $unsigned((wire16 ?
                      (wire30[(3'h5):(3'h4)] * $signed(wire17[(1'h0):(1'h0)])) : reg22[(1'h1):(1'h0)]));
  assign wire32 = $signed(wire29[(2'h3):(2'h3)]);
  assign wire33 = (wire19 ?
                      ($signed(($signed((7'h43)) + (~^reg22))) <<< wire19[(2'h2):(2'h2)]) : $unsigned(reg24));
  assign wire34 = $unsigned((wire32[(3'h7):(3'h6)] ?
                      reg20[(1'h1):(1'h0)] : reg23));
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(((reg26 ? reg25 : ((8'hbb) ? wire32 : wire33)) ?
          reg25[(4'he):(4'hc)] : wire31[(3'h5):(2'h3)]))))
        begin
          if (((~|reg23) << (8'ha5)))
            begin
              reg35 <= wire16;
              reg36 <= $unsigned((|wire19[(4'h9):(3'h5)]));
              reg37 <= $unsigned((-wire17[(1'h0):(1'h0)]));
              reg38 <= (!$unsigned((8'hb6)));
              reg39 <= ((|$unsigned(reg21)) ?
                  $signed((reg27[(3'h4):(1'h0)] < (~(wire31 ?
                      wire33 : reg36)))) : (wire34[(1'h0):(1'h0)] ?
                      reg26 : (({wire15} ?
                              (wire28 ?
                                  reg24 : (8'ha6)) : wire19[(3'h7):(3'h7)]) ?
                          wire31 : wire30[(3'h6):(1'h0)])));
            end
          else
            begin
              reg35 <= $unsigned((!(((|wire28) ^~ wire32) * wire29[(1'h1):(1'h0)])));
              reg36 <= (8'h9d);
              reg37 <= {$unsigned((reg37 ?
                      wire16[(3'h7):(3'h5)] : wire17[(2'h2):(1'h1)])),
                  reg37};
            end
          if ((^~(&(+((^reg38) <<< {reg20})))))
            begin
              reg40 <= wire30[(3'h5):(2'h2)];
            end
          else
            begin
              reg40 <= ((reg40[(1'h0):(1'h0)] || {$signed($signed(reg25)),
                      (~&(|reg26))}) ?
                  ($unsigned(((!reg35) != {wire15})) & (((reg20 ?
                      wire32 : reg20) + $signed(wire28)) >> reg35[(2'h2):(1'h1)])) : ($signed({wire19[(4'h8):(4'h8)]}) == {(reg40[(1'h1):(1'h1)] ^ ((8'hb7) ?
                          reg27 : reg40)),
                      (~^(reg36 <= reg26))}));
              reg41 <= (7'h43);
              reg42 <= wire16[(3'h7):(3'h5)];
              reg43 <= (wire31[(1'h0):(1'h0)] ^~ wire16);
            end
        end
      else
        begin
          reg35 <= (~|(8'hb9));
          if ($signed(($signed(reg26[(3'h4):(2'h3)]) ?
              (^~((wire17 ^ wire18) ?
                  wire31 : $signed(reg36))) : $unsigned(reg39))))
            begin
              reg36 <= $unsigned($signed({(~|reg40), (^(8'ha7))}));
              reg37 <= reg42[(3'h5):(3'h5)];
              reg38 <= ({{$unsigned((8'hab)), {(reg23 ? wire30 : wire19)}},
                      ({$signed((8'hb9)), reg38[(5'h13):(5'h11)]} ?
                          reg42[(2'h3):(1'h0)] : ((~(8'ha6)) ?
                              reg21 : $unsigned(reg39)))} ?
                  (!$signed(wire17[(2'h2):(2'h2)])) : (reg43[(2'h3):(1'h0)] ?
                      (wire28[(4'hc):(4'ha)] + ($signed(reg27) >> (wire18 ?
                          reg41 : (7'h40)))) : $signed($unsigned(reg42[(1'h0):(1'h0)]))));
              reg39 <= reg22[(2'h3):(2'h3)];
              reg40 <= wire15;
            end
          else
            begin
              reg36 <= ((wire29 ?
                  $signed((wire19[(2'h3):(1'h1)] ?
                      $unsigned(reg21) : (wire34 <= (8'hb6)))) : reg35) >= ((-($signed(reg21) ^~ $signed(reg26))) ?
                  reg42[(3'h7):(2'h2)] : (8'hbb)));
              reg37 <= $unsigned(wire31[(2'h3):(2'h3)]);
              reg38 <= reg36;
            end
          if ($unsigned(wire18))
            begin
              reg41 <= wire28;
              reg42 <= $signed((reg24[(5'h10):(4'hf)] ?
                  ($unsigned(((7'h42) ?
                      reg24 : wire15)) && reg35) : ({$unsigned(wire15),
                      $signed(reg38)} ~^ $signed((reg36 ? (8'ha9) : reg41)))));
              reg43 <= (reg21[(3'h4):(1'h0)] >= (!$signed($signed((^wire33)))));
              reg44 <= (^reg39);
              reg45 <= (-(~&$unsigned($unsigned({reg39, wire31}))));
            end
          else
            begin
              reg41 <= reg43[(3'h5):(3'h5)];
              reg42 <= $signed(reg25);
            end
          reg46 <= reg24[(3'h6):(3'h6)];
        end
    end
  assign wire47 = $unsigned({reg36});
endmodule

module module58
#(parameter param85 = (({(((8'ha5) + (8'ha6)) || (~|(8'h9f)))} ? {{((8'h9f) << (8'haa))}} : ((^~(+(8'haa))) - (|((7'h43) << (8'hbf))))) | (((~^(8'h9c)) ? (&{(8'hbf), (8'h9f)}) : (((8'hbe) < (8'hb4)) ? ((8'ha4) ? (8'ha4) : (8'h9e)) : ((8'hbd) ? (8'h9c) : (8'hb4)))) >>> (~|(!{(7'h41), (8'hbc)})))), 
parameter param86 = ({(-((~^param85) ? (param85 < (8'h9f)) : (~&param85))), (8'haf)} > {(~|((param85 << param85) ? (param85 ~^ param85) : (param85 + param85)))}))
(y, clk, wire63, wire62, wire61, wire60, wire59);
  output wire [(32'hd5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire63;
  input wire signed [(2'h2):(1'h0)] wire62;
  input wire signed [(3'h4):(1'h0)] wire61;
  input wire signed [(4'he):(1'h0)] wire60;
  input wire [(3'h4):(1'h0)] wire59;
  wire signed [(4'h8):(1'h0)] wire84;
  wire [(4'hd):(1'h0)] wire83;
  wire signed [(3'h6):(1'h0)] wire82;
  wire signed [(4'h8):(1'h0)] wire81;
  wire [(4'h8):(1'h0)] wire68;
  wire signed [(4'hf):(1'h0)] wire67;
  wire [(3'h4):(1'h0)] wire66;
  wire signed [(2'h2):(1'h0)] wire65;
  wire signed [(5'h13):(1'h0)] wire64;
  reg signed [(5'h11):(1'h0)] reg80 = (1'h0);
  reg [(3'h5):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg78 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg75 = (1'h0);
  reg [(4'h8):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg73 = (1'h0);
  reg [(2'h2):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg69 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
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
                 (1'h0)};
  assign wire64 = (~^wire62);
  assign wire65 = $signed(wire60[(4'h8):(1'h1)]);
  assign wire66 = ((-$unsigned($signed((8'hb0)))) > $signed((~^$signed(((8'haf) ?
                      wire60 : wire63)))));
  assign wire67 = (7'h40);
  assign wire68 = ($unsigned(wire63) * (~|{wire64}));
  always
    @(posedge clk) begin
      reg69 <= ($unsigned($signed($signed($unsigned(wire62)))) ?
          wire63 : $signed($signed((+(wire68 & wire63)))));
      reg70 <= wire64[(5'h13):(1'h0)];
      if ($unsigned(reg69[(4'hc):(2'h2)]))
        begin
          reg71 <= $signed(wire64);
          reg72 <= reg69[(3'h5):(1'h1)];
        end
      else
        begin
          if (($signed(reg69[(4'hb):(3'h4)]) ?
              $signed($signed(({wire59, reg71} ?
                  $unsigned(reg71) : reg70[(3'h5):(1'h1)]))) : ({(8'ha4),
                      {{wire66, wire63}}} ?
                  $signed($signed((wire60 | wire68))) : (~{(wire59 ?
                          wire61 : wire59)}))))
            begin
              reg71 <= ({wire66[(3'h4):(2'h2)],
                  (|$signed((wire65 >= (8'hae))))} | (^~((wire59 ?
                  wire66[(2'h3):(2'h2)] : ((8'had) == (7'h40))) - wire59)));
              reg72 <= (8'ha4);
              reg73 <= ((!((wire65[(1'h1):(1'h1)] ?
                      $signed(reg72) : (8'ha9)) < ((wire59 > wire60) ?
                      (^~reg70) : $unsigned(wire64)))) ?
                  $signed(((wire67[(4'hf):(1'h1)] >>> (~wire61)) >>> $signed(wire61))) : ((~$signed((wire62 ?
                          (8'ha6) : wire65))) ?
                      (((reg69 >>> wire68) ?
                          wire68[(3'h4):(2'h2)] : {wire61}) | reg70) : (($unsigned(wire65) ?
                          $unsigned(wire60) : (~reg70)) >= $unsigned($signed(wire64)))));
              reg74 <= ((~((7'h43) - ((wire65 ?
                  (8'hb2) : (8'h9f)) & $unsigned(wire63)))) == ((((~&wire59) == (wire63 ?
                  wire66 : wire63)) & reg70) < (~^$unsigned($signed(reg72)))));
            end
          else
            begin
              reg71 <= ($signed(wire66[(1'h1):(1'h0)]) ?
                  (wire68[(2'h2):(1'h1)] ?
                      $signed(((reg74 ? reg70 : wire59) ?
                          (7'h43) : {wire62})) : ((+(reg70 ? wire62 : reg74)) ?
                          $signed(wire66[(1'h0):(1'h0)]) : $unsigned((reg74 ?
                              reg70 : reg71)))) : wire65);
              reg72 <= wire62;
            end
          reg75 <= $signed($signed($unsigned(($unsigned(wire61) ?
              wire59[(3'h4):(1'h1)] : $signed(wire64)))));
          reg76 <= {$unsigned($unsigned($signed(((7'h40) ? reg74 : wire68))))};
          reg77 <= ((reg70[(3'h6):(3'h6)] ?
              ($unsigned(wire65[(1'h0):(1'h0)]) < $unsigned(reg76[(4'hb):(1'h1)])) : {wire65[(1'h0):(1'h0)]}) <= (~(((wire66 || reg72) << $signed((8'hab))) & ($signed(wire64) < $signed(reg73)))));
          if (wire62)
            begin
              reg78 <= $signed($unsigned(wire67));
              reg79 <= reg74[(2'h3):(1'h1)];
              reg80 <= ((reg73[(2'h2):(1'h1)] * ((8'ha5) ?
                      $unsigned((~^wire60)) : wire65)) ?
                  ($signed({(wire60 ^~ reg72)}) << {($unsigned((8'ha4)) ?
                          $unsigned(reg75) : (wire65 - wire64)),
                      ($unsigned(wire63) ?
                          wire67 : {reg72,
                              (8'hb0)})}) : $unsigned(($unsigned(reg69) ?
                      $signed($unsigned((8'hb4))) : $unsigned((|reg78)))));
            end
          else
            begin
              reg78 <= wire59;
              reg79 <= (!{(&$unsigned(reg79))});
              reg80 <= $unsigned(wire67[(1'h0):(1'h0)]);
            end
        end
    end
  assign wire81 = (wire66 ?
                      (({wire62} | (~&reg73)) != $unsigned($unsigned(reg72))) : (~^($unsigned($unsigned(wire64)) & (^(reg77 ?
                          (8'h9e) : reg80)))));
  assign wire82 = (~&{$signed(((~reg77) ?
                          (wire66 ? reg71 : reg70) : $signed((8'hb7)))),
                      $unsigned(reg80[(5'h11):(4'hc)])});
  assign wire83 = (({wire67[(4'hd):(4'hb)]} | $unsigned($signed({(8'haa)}))) && {((&(wire82 ?
                              reg72 : wire64)) ?
                          $signed($signed((7'h44))) : (-{(8'h9e)}))});
  assign wire84 = wire83[(3'h7):(3'h6)];
endmodule
