module top
#(parameter param107 = (~(&((~{(8'ha2), (7'h42)}) >>> (((8'ha0) ? (7'h44) : (8'haa)) + ((8'hae) <<< (8'had)))))), 
parameter param108 = param107)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire105;
  wire [(4'hd):(1'h0)] wire21;
  wire signed [(3'h4):(1'h0)] wire20;
  wire [(3'h6):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire18;
  wire signed [(5'h11):(1'h0)] wire17;
  wire signed [(2'h3):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire15;
  wire signed [(4'hc):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire4;
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  reg [(4'he):(1'h0)] reg6 = (1'h0);
  assign y = {wire105,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire5,
                 wire4,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = (|$unsigned((!wire3[(4'h8):(3'h6)])));
  assign wire5 = wire4;
  always
    @(posedge clk) begin
      reg6 <= ({({(~^wire4), wire1[(4'h8):(2'h3)]} < $signed((wire4 + wire2))),
          wire3[(1'h1):(1'h1)]} ~^ (wire2 ?
          $signed($unsigned($signed((8'hae)))) : ((&(^wire3)) ?
              {{wire3}, $unsigned(wire2)} : (wire4 <= wire2))));
      reg7 <= (~(8'hb0));
      reg8 <= ($signed((($signed(reg7) ^~ (8'hbe)) ?
          ((wire4 ? wire5 : reg6) ?
              wire0 : $signed((7'h40))) : (~$unsigned(wire0)))) & (((8'ha1) ?
              {wire0[(3'h5):(2'h3)], (|wire5)} : (wire3 ?
                  $signed((7'h41)) : $signed((8'hae)))) ?
          {wire1} : $unsigned((^((8'hb5) >>> reg7)))));
      reg9 <= (wire3[(2'h2):(2'h2)] << (|(-($unsigned(wire5) > $signed(wire0)))));
    end
  always
    @(posedge clk) begin
      reg10 <= $signed(($unsigned(reg8[(1'h1):(1'h0)]) ?
          reg6 : $signed(((~&wire1) ? (&reg7) : ((8'h9f) <= (8'hb6))))));
      reg11 <= (^~$signed(($unsigned(reg8[(3'h7):(3'h5)]) << ({reg9, reg7} ?
          wire0 : $signed((8'hb4))))));
    end
  assign wire12 = ((reg9 * ({(reg6 > reg8),
                          ((8'ha6) ?
                              wire4 : wire4)} << (~^reg11[(4'ha):(3'h7)]))) ?
                      reg10 : reg10[(4'h9):(2'h2)]);
  assign wire13 = (((+(^~(!reg9))) ^ $signed(((|wire4) ?
                      wire0 : (reg7 + reg10)))) << $unsigned($unsigned($signed((7'h42)))));
  assign wire14 = $unsigned($unsigned(($signed($unsigned(wire12)) ?
                      (+reg8) : $signed((reg9 ? reg9 : wire1)))));
  assign wire15 = (((8'hb5) ?
                      ((reg7 ? $unsigned(reg9) : {wire3}) ?
                          (^$signed(reg11)) : (&((8'hb0) && wire13))) : $signed(reg7[(1'h1):(1'h0)])) && $signed({reg9[(3'h4):(1'h1)]}));
  assign wire16 = $signed($signed((^wire0)));
  assign wire17 = wire16;
  assign wire18 = wire13[(3'h4):(3'h4)];
  assign wire19 = ($unsigned(($unsigned($signed(wire14)) ?
                          (^$signed(reg11)) : (~&(reg9 ? wire13 : wire1)))) ?
                      wire4[(2'h2):(1'h1)] : (({(7'h40), (|reg11)} ?
                              ({wire17} & $unsigned(wire15)) : reg6) ?
                          wire5[(4'h9):(1'h0)] : (&((8'ha9) ?
                              ((8'hac) > (8'haf)) : (wire17 + wire14)))));
  assign wire20 = ($unsigned(wire3) + $unsigned($signed(reg9)));
  assign wire21 = wire15[(4'hf):(2'h3)];
  module22 #() modinst106 (.wire23(wire13), .wire26(wire14), .y(wire105), .wire25(wire2), .clk(clk), .wire24(wire1));
endmodule

module module22
#(parameter param103 = (({{((8'haa) ? (8'hab) : (8'hb3)), {(8'hb5)}}, (^~{(8'hbb)})} ? (~&(((8'ha5) == (8'hb0)) && ((8'hb4) ? (8'hbe) : (8'hb9)))) : ((8'hb7) <<< (~|((8'ha7) & (8'hac))))) ? ((~&{((7'h44) > (8'hb9)), ((8'hbd) >>> (8'h9e))}) >> ({((8'hbf) ? (8'hb1) : (8'haf))} && ((8'h9d) && ((8'hab) ? (7'h42) : (7'h40))))) : ((+({(7'h44), (8'ha0)} ? (+(8'ha5)) : {(8'hb3)})) || ((~(~^(8'hbb))) ? {((8'ha2) ? (8'hbe) : (8'hb9))} : ({(7'h40), (7'h41)} ^ (^~(8'ha7)))))), 
parameter param104 = {(8'ha7)})
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire26;
  input wire [(5'h11):(1'h0)] wire25;
  input wire signed [(5'h11):(1'h0)] wire24;
  input wire signed [(4'hf):(1'h0)] wire23;
  wire [(3'h7):(1'h0)] wire102;
  wire [(4'hf):(1'h0)] wire100;
  wire [(4'hc):(1'h0)] wire64;
  wire [(4'h8):(1'h0)] wire63;
  wire [(5'h15):(1'h0)] wire61;
  assign y = {wire102, wire100, wire64, wire63, wire61, (1'h0)};
  module27 #() modinst62 (wire61, clk, wire25, wire24, wire23, wire26);
  assign wire63 = $signed(((!$unsigned(wire61[(1'h1):(1'h1)])) ?
                      (((~wire26) >>> wire23) << $unsigned(((8'hbd) ?
                          (8'hbe) : wire24))) : $signed($signed({wire61}))));
  assign wire64 = ((^($signed((wire23 ?
                      wire25 : (8'hb4))) ^ {$unsigned((8'haa))})) * (wire23 | $signed((+((8'hb7) ^~ wire63)))));
  module65 #() modinst101 (.wire69(wire23), .wire67(wire26), .wire68(wire25), .wire66(wire61), .clk(clk), .y(wire100));
  assign wire102 = wire61;
endmodule

module module65
#(parameter param98 = (((~{{(8'ha9)}, ((8'hbf) ? (8'hb9) : (8'had))}) == (8'h9e)) ? (((8'had) ^ (8'hb2)) ? ((&((7'h41) ? (8'h9e) : (8'haa))) ? ((+(8'ha5)) << ((7'h43) ? (8'hb2) : (8'ha4))) : (((8'ha1) <= (8'hb6)) | (~|(8'haf)))) : (-{(8'ha5)})) : (+(((8'ha4) ~^ ((8'h9f) >> (8'hb2))) ? (((8'hbc) ? (8'h9c) : (8'ha6)) <<< (~|(8'ha7))) : {(~&(8'hbc)), ((8'hba) + (8'hac))}))), 
parameter param99 = (param98 ? param98 : ((8'hbb) - param98)))
(y, clk, wire69, wire68, wire67, wire66);
  output wire [(32'h15f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire69;
  input wire [(5'h10):(1'h0)] wire68;
  input wire [(4'ha):(1'h0)] wire67;
  input wire signed [(5'h15):(1'h0)] wire66;
  wire [(3'h6):(1'h0)] wire97;
  wire [(3'h4):(1'h0)] wire96;
  wire signed [(5'h13):(1'h0)] wire95;
  wire signed [(5'h10):(1'h0)] wire94;
  wire [(4'h8):(1'h0)] wire93;
  wire signed [(5'h12):(1'h0)] wire92;
  wire [(5'h12):(1'h0)] wire91;
  wire signed [(4'h8):(1'h0)] wire90;
  wire signed [(3'h5):(1'h0)] wire89;
  wire [(4'h8):(1'h0)] wire87;
  wire signed [(5'h11):(1'h0)] wire80;
  wire [(4'hb):(1'h0)] wire79;
  wire signed [(4'hc):(1'h0)] wire78;
  wire signed [(5'h15):(1'h0)] wire77;
  wire signed [(3'h4):(1'h0)] wire76;
  wire signed [(5'h10):(1'h0)] wire75;
  wire signed [(5'h13):(1'h0)] wire74;
  wire [(3'h7):(1'h0)] wire73;
  wire signed [(5'h14):(1'h0)] wire72;
  wire signed [(4'ha):(1'h0)] wire71;
  wire [(5'h13):(1'h0)] wire70;
  reg [(4'he):(1'h0)] reg88 = (1'h0);
  reg [(5'h10):(1'h0)] reg86 = (1'h0);
  reg [(4'he):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg81 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire87,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 reg88,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 (1'h0)};
  assign wire70 = ({(-(7'h44)),
                      ((^(wire69 == wire67)) ?
                          (~^((8'h9c) ?
                              wire67 : wire68)) : $unsigned(wire68[(3'h5):(1'h0)]))} && ($signed((wire67 != $unsigned(wire67))) <<< ($unsigned($signed(wire67)) ?
                      wire69 : $unsigned(((8'hb3) ? wire68 : wire68)))));
  assign wire71 = (wire67[(3'h7):(3'h7)] >= wire66);
  assign wire72 = (-wire70[(4'h9):(2'h3)]);
  assign wire73 = {wire67[(3'h5):(1'h0)]};
  assign wire74 = wire68;
  assign wire75 = {wire69[(4'hf):(4'hb)]};
  assign wire76 = ((+wire69[(3'h4):(2'h2)]) & (~&$unsigned($unsigned($unsigned(wire73)))));
  assign wire77 = wire67;
  assign wire78 = wire74[(1'h0):(1'h0)];
  assign wire79 = $unsigned((wire76[(1'h1):(1'h1)] ?
                      (((^wire69) | (wire77 ? wire71 : wire74)) ?
                          ({wire74, wire66} ?
                              wire72 : (-wire66)) : ($signed(wire77) < wire70[(3'h7):(1'h1)])) : $unsigned(wire76[(1'h0):(1'h0)])));
  assign wire80 = $signed((wire74 <<< (|$signed(wire76[(2'h3):(2'h3)]))));
  always
    @(posedge clk) begin
      if ((-$signed((wire75 ^ {wire79[(4'ha):(3'h4)], (~wire70)}))))
        begin
          reg81 <= (-$signed($unsigned($signed(wire70[(4'hd):(3'h6)]))));
        end
      else
        begin
          reg81 <= wire78[(4'hb):(4'hb)];
          reg82 <= (|wire68);
          reg83 <= reg81[(5'h11):(4'hc)];
          reg84 <= wire74[(4'ha):(3'h4)];
        end
      reg85 <= (^~{($signed(wire66) >= {(wire73 ? reg82 : (8'hb3))})});
      reg86 <= (8'hbe);
    end
  assign wire87 = (~|($signed(wire75[(2'h2):(1'h0)]) != wire79[(3'h6):(1'h0)]));
  always
    @(posedge clk) begin
      reg88 <= $signed($signed($signed($signed($unsigned(reg83)))));
    end
  assign wire89 = ($signed({reg81,
                      wire68[(4'hf):(4'h9)]}) > {$unsigned((|(8'h9c))),
                      reg81[(4'hf):(4'he)]});
  assign wire90 = {wire66, $unsigned(wire68)};
  assign wire91 = {(&$signed(wire78)),
                      $unsigned((($signed(wire71) ^~ wire75) & wire67[(1'h0):(1'h0)]))};
  assign wire92 = {$unsigned($unsigned({(8'haf)})),
                      $signed(reg84[(1'h1):(1'h1)])};
  assign wire93 = (-((($unsigned(wire87) ? (reg81 >= reg84) : $signed(reg85)) ?
                          $unsigned($unsigned(wire76)) : {((8'hb7) ?
                                  wire76 : reg84),
                              {wire91}}) ?
                      $signed({reg83[(2'h2):(1'h1)]}) : (wire74 >> $unsigned($unsigned(wire87)))));
  assign wire94 = ($signed((wire78[(4'h9):(3'h6)] ?
                          ((wire70 & wire68) >>> $signed(wire80)) : wire67)) ?
                      wire87 : wire77[(4'h8):(4'h8)]);
  assign wire95 = (-wire67[(4'h8):(1'h0)]);
  assign wire96 = (((+wire77[(4'hc):(1'h1)]) * (^~wire91[(2'h3):(2'h2)])) ?
                      ((~&$unsigned((wire67 ?
                          wire78 : reg84))) - (-reg81[(4'he):(2'h3)])) : (|(($unsigned(wire87) || (&(8'hb7))) * (^~$signed(reg82)))));
  assign wire97 = ((wire94 ?
                          $signed(wire92[(2'h3):(2'h2)]) : ((wire75 ?
                                  $signed(wire91) : reg88) ?
                              (!(wire79 ?
                                  (8'hb9) : (8'h9d))) : $unsigned((wire93 ?
                                  wire96 : wire91)))) ?
                      (~|$signed($signed($signed(wire80)))) : wire89[(3'h5):(2'h3)]);
endmodule

module module27
#(parameter param60 = (({(8'hb7)} << ({((8'hb2) ? (8'h9c) : (8'h9d))} <= (((8'hba) ? (8'hac) : (7'h41)) != ((8'hac) || (7'h42))))) ? (((~|((8'ha9) ? (8'hbb) : (8'ha3))) ? {((8'ha4) >> (8'hbb)), ((8'ha0) * (8'hae))} : (((8'ha4) > (8'hb6)) != {(8'h9c), (8'h9f)})) != ((^~(~|(8'ha8))) ? ((&(8'had)) ? ((8'hbf) ~^ (8'hb5)) : ((8'haf) >>> (8'hb3))) : (((8'h9d) ? (8'hab) : (8'hbb)) ? ((8'hbf) ? (7'h41) : (8'hba)) : {(8'hb5), (8'hae)}))) : (|((~|(~|(8'h9f))) | (((7'h40) ^ (8'h9d)) + {(8'hbe), (8'ha1)})))))
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h161):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire31;
  input wire [(5'h11):(1'h0)] wire30;
  input wire signed [(3'h5):(1'h0)] wire29;
  input wire signed [(2'h3):(1'h0)] wire28;
  wire [(3'h5):(1'h0)] wire52;
  wire signed [(4'ha):(1'h0)] wire51;
  wire signed [(5'h13):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire49;
  wire signed [(4'h8):(1'h0)] wire48;
  wire signed [(3'h6):(1'h0)] wire42;
  wire signed [(4'h9):(1'h0)] wire37;
  wire [(4'ha):(1'h0)] wire36;
  wire signed [(5'h11):(1'h0)] wire32;
  reg [(5'h12):(1'h0)] reg59 = (1'h0);
  reg [(3'h6):(1'h0)] reg58 = (1'h0);
  reg [(5'h13):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg54 = (1'h0);
  reg [(4'hf):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg47 = (1'h0);
  reg [(3'h7):(1'h0)] reg46 = (1'h0);
  reg [(5'h14):(1'h0)] reg45 = (1'h0);
  reg [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg33 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire42,
                 wire37,
                 wire36,
                 wire32,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire32 = (($signed($unsigned(wire29[(2'h3):(1'h1)])) < $signed(wire31[(2'h3):(2'h2)])) ?
                      wire28 : $signed(($unsigned((wire28 || wire29)) >> $signed(wire29))));
  always
    @(posedge clk) begin
      reg33 <= wire32;
      reg34 <= wire31[(1'h1):(1'h0)];
      reg35 <= wire32;
    end
  assign wire36 = ((8'hb4) ^~ (~^((~|{reg34, wire30}) >= {(wire29 ~^ wire32),
                      wire31})));
  assign wire37 = wire36[(3'h7):(3'h6)];
  always
    @(posedge clk) begin
      reg38 <= wire28[(1'h0):(1'h0)];
      reg39 <= (~&((wire37[(3'h6):(3'h4)] > $unsigned($signed(wire30))) & $signed((!$signed((8'ha7))))));
      reg40 <= (8'ha4);
      reg41 <= wire36[(3'h5):(1'h1)];
    end
  assign wire42 = $unsigned($signed(wire30));
  always
    @(posedge clk) begin
      reg43 <= reg34;
      reg44 <= $signed($unsigned((^~wire36)));
      reg45 <= $signed(reg34);
      reg46 <= (!($unsigned(wire36) == wire37));
      reg47 <= $signed((!{reg43[(3'h4):(2'h2)], {reg46[(2'h2):(1'h0)]}}));
    end
  assign wire48 = reg43;
  assign wire49 = $signed(wire28);
  assign wire50 = (^~reg45);
  assign wire51 = $signed($unsigned((reg33[(1'h1):(1'h1)] ~^ $unsigned({reg35}))));
  assign wire52 = wire32;
  always
    @(posedge clk) begin
      if (wire52[(3'h4):(1'h1)])
        begin
          reg53 <= {($signed((+(wire29 == reg44))) ?
                  reg33[(4'hb):(3'h4)] : ($unsigned($unsigned(wire30)) != $unsigned((reg46 ^ wire49)))),
              $signed(reg38[(1'h0):(1'h0)])};
          if (wire29[(1'h0):(1'h0)])
            begin
              reg54 <= $signed((((^(8'ha7)) ?
                  {$unsigned(reg33), (|reg53)} : {$unsigned(wire51),
                      $unsigned(reg34)}) > wire52[(3'h5):(2'h2)]));
              reg55 <= $unsigned((8'ha4));
              reg56 <= ((!reg55) ^~ ($unsigned(((reg54 && reg53) < reg55[(4'ha):(1'h0)])) - wire37));
              reg57 <= ((~|reg33[(3'h5):(1'h1)]) ?
                  $unsigned($unsigned(wire49[(2'h2):(1'h0)])) : reg45);
            end
          else
            begin
              reg54 <= $signed(reg39[(3'h7):(3'h7)]);
              reg55 <= $signed(reg46[(2'h3):(2'h3)]);
              reg56 <= $unsigned(($signed(((-wire28) | $signed(reg44))) <<< reg39[(3'h6):(3'h4)]));
              reg57 <= (reg56 | (reg56[(1'h0):(1'h0)] == wire51));
            end
        end
      else
        begin
          if ({{(~&(8'hae)), $unsigned(reg53)}})
            begin
              reg53 <= $signed({reg34[(3'h4):(1'h1)]});
            end
          else
            begin
              reg53 <= ({$signed(wire30), (8'ha2)} < {(($signed(wire30) ?
                          $signed((8'hb4)) : (~&reg44)) ?
                      reg53 : $signed({wire29, wire50}))});
              reg54 <= (((~&(~$unsigned(wire42))) ?
                  reg45[(5'h11):(4'hf)] : $unsigned(({(8'ha2),
                      wire42} << {reg34}))) * ((^~$signed($unsigned((7'h44)))) && wire31[(1'h0):(1'h0)]));
            end
          reg55 <= ((^~$signed(((wire50 ?
                  wire49 : wire48) && reg55[(1'h1):(1'h1)]))) ?
              wire37 : $unsigned(wire42[(1'h0):(1'h0)]));
          reg56 <= reg46;
        end
      reg58 <= (($unsigned((reg53[(1'h0):(1'h0)] ?
          reg45[(3'h6):(1'h1)] : (wire28 ?
              (8'hb1) : wire36))) & $unsigned((!reg35))) ^ wire49[(3'h5):(1'h1)]);
      reg59 <= reg56[(5'h11):(2'h2)];
    end
endmodule
