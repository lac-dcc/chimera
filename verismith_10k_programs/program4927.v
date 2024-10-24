module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h202):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire128;
  wire [(4'hd):(1'h0)] wire127;
  wire [(3'h6):(1'h0)] wire126;
  wire [(4'h9):(1'h0)] wire125;
  wire signed [(5'h13):(1'h0)] wire124;
  wire signed [(4'ha):(1'h0)] wire123;
  wire [(3'h5):(1'h0)] wire122;
  wire [(5'h11):(1'h0)] wire121;
  wire signed [(2'h3):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire18;
  wire signed [(5'h13):(1'h0)] wire19;
  wire signed [(2'h3):(1'h0)] wire25;
  wire signed [(4'ha):(1'h0)] wire40;
  wire signed [(5'h11):(1'h0)] wire55;
  wire signed [(5'h11):(1'h0)] wire56;
  wire [(4'ha):(1'h0)] wire119;
  reg [(5'h11):(1'h0)] reg54 = (1'h0);
  reg [(3'h7):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg52 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg50 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  reg [(2'h2):(1'h0)] reg48 = (1'h0);
  reg [(4'hb):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg24 = (1'h0);
  assign y = {wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire5,
                 wire6,
                 wire7,
                 wire18,
                 wire19,
                 wire25,
                 wire40,
                 wire55,
                 wire56,
                 wire119,
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
                 reg44,
                 reg43,
                 reg42,
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
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 (1'h0)};
  assign wire5 = wire4[(4'hb):(4'ha)];
  assign wire6 = ($signed((^(|(wire0 ? wire0 : wire0)))) ?
                     $unsigned($signed((wire3 ?
                         $unsigned(wire1) : wire3[(2'h3):(2'h2)]))) : (^{wire0}));
  assign wire7 = wire4;
  always
    @(posedge clk) begin
      reg8 <= (wire3[(1'h1):(1'h1)] - ($signed((wire7 ?
          wire6[(4'ha):(2'h3)] : ((8'h9c) ?
              wire4 : wire0))) ~^ $unsigned(($signed((8'haa)) | wire1[(3'h7):(3'h7)]))));
      if (wire0[(1'h0):(1'h0)])
        begin
          reg9 <= reg8[(4'h8):(1'h1)];
          if (((($unsigned((wire3 ? wire5 : reg8)) ?
                      wire3 : ((!wire6) ?
                          (wire0 ? wire7 : wire6) : wire5[(2'h2):(1'h0)])) ?
                  wire3[(1'h1):(1'h1)] : wire6) ?
              ({wire7} ? $unsigned(wire5) : (8'hbb)) : {wire1[(3'h4):(1'h1)]}))
            begin
              reg10 <= (|(wire0 ? (7'h40) : (&((!wire0) + $signed((8'ha9))))));
              reg11 <= (+({($unsigned(wire0) ^~ (reg9 + wire5))} ?
                  ($signed((wire0 != (8'hb2))) != (|$signed(wire0))) : wire1));
              reg12 <= (|$signed(wire4[(5'h11):(4'hb)]));
              reg13 <= wire7[(1'h1):(1'h0)];
              reg14 <= wire0;
            end
          else
            begin
              reg10 <= reg9[(3'h6):(3'h5)];
              reg11 <= (reg10[(1'h0):(1'h0)] ?
                  wire1[(4'he):(4'he)] : wire1[(5'h11):(4'he)]);
              reg12 <= wire1;
              reg13 <= $unsigned({({(wire0 | wire4), $unsigned((7'h40))} ?
                      ((reg14 ^~ wire3) ? $unsigned(reg11) : wire5) : (reg14 ?
                          {(8'hbb)} : reg14[(1'h0):(1'h0)])),
                  ({$unsigned(reg11), (wire0 << wire6)} ?
                      (&wire4) : (~&(reg13 + wire7)))});
              reg14 <= $signed({$signed({$unsigned(reg8)})});
            end
        end
      else
        begin
          if ({$unsigned((~|$signed(((8'hac) ? wire2 : wire5))))})
            begin
              reg9 <= $unsigned({$unsigned(((reg10 ?
                      wire6 : reg12) >= wire4[(5'h15):(1'h1)])),
                  reg11});
            end
          else
            begin
              reg9 <= wire5;
              reg10 <= reg12;
              reg11 <= {$unsigned($unsigned((((8'hbe) ?
                      wire6 : (8'hba)) << (wire2 && wire2)))),
                  reg10[(1'h0):(1'h0)]};
              reg12 <= (8'ha3);
            end
          reg13 <= reg8[(4'h8):(3'h4)];
          reg14 <= ($unsigned($unsigned((~^(^reg14)))) & (+{{wire4[(4'ha):(2'h2)],
                  (wire4 ? wire2 : (8'hb8))}}));
        end
      reg15 <= $unsigned(($unsigned(($signed(wire3) <= reg9[(2'h3):(1'h0)])) || {$signed((reg14 ?
              wire6 : reg11)),
          (~|{wire4, (7'h44)})}));
      reg16 <= (~&(-$unsigned(wire3)));
      reg17 <= (8'hb6);
    end
  assign wire18 = wire7;
  assign wire19 = $unsigned(($unsigned(reg8[(4'h8):(2'h2)]) ?
                      ($signed(reg13[(4'hd):(4'hd)]) ?
                          ((8'hbc) < (8'hb0)) : $signed((reg10 ?
                              wire0 : reg17))) : $signed(wire5)));
  always
    @(posedge clk) begin
      reg20 <= $unsigned($signed((|wire2[(1'h0):(1'h0)])));
      reg21 <= (((wire5[(1'h1):(1'h1)] > ($signed(reg9) ^ $unsigned((8'h9c)))) ?
          $unsigned((~(wire4 ?
              wire6 : reg12))) : $signed(wire19)) ^ $unsigned({(^~(wire4 << wire0)),
          $signed({reg9, reg15})}));
      reg22 <= $unsigned(reg10[(4'h9):(3'h7)]);
      reg23 <= {(&$unsigned($unsigned((^reg9)))), wire1};
      reg24 <= (8'ha3);
    end
  assign wire25 = (!(~((~|$signed((8'hae))) ?
                      $unsigned($signed(reg15)) : $unsigned((reg20 ?
                          reg20 : (8'hb8))))));
  module26 #() modinst41 (.wire27(reg21), .wire30(wire25), .clk(clk), .wire28(reg15), .y(wire40), .wire29(reg10), .wire31(wire18));
  always
    @(posedge clk) begin
      if (((wire18 * (7'h41)) & ({wire18[(3'h6):(2'h3)], reg16} ?
          wire1[(4'hd):(1'h0)] : $signed(reg20))))
        begin
          reg42 <= reg12[(5'h11):(4'h9)];
        end
      else
        begin
          reg42 <= $signed({{{$unsigned(wire25), $signed(reg16)}, (~&wire5)}});
          reg43 <= {$signed((-wire5))};
          reg44 <= ($signed((wire5 != $unsigned((~(8'hb7))))) < (wire6 ?
              reg24 : ($signed((^~reg23)) ?
                  ($unsigned(wire2) >> $signed(reg23)) : {((8'ha5) ?
                          wire5 : reg10),
                      $signed((8'ha1))})));
          reg45 <= $unsigned((~|((~&reg10) && $signed($signed(reg16)))));
          reg46 <= reg8[(1'h1):(1'h0)];
        end
      reg47 <= (reg45[(2'h3):(2'h2)] > wire25);
      reg48 <= (({(reg11[(1'h0):(1'h0)] ? $signed(reg24) : (-wire25))} ?
              ((8'hb1) << {$signed(reg24)}) : {$signed((wire3 ?
                      wire19 : (8'had)))}) ?
          $signed($signed(reg8[(3'h7):(3'h7)])) : $signed({(|(reg8 * wire5))}));
      if (wire6)
        begin
          reg49 <= reg12;
          if ($unsigned(reg14[(2'h2):(2'h2)]))
            begin
              reg50 <= $unsigned($signed(wire2));
            end
          else
            begin
              reg50 <= reg22[(2'h3):(2'h2)];
            end
          reg51 <= ($signed($unsigned((((8'hb6) != wire18) ?
                  ((8'hba) ? reg45 : reg43) : $unsigned(reg11)))) ?
              $unsigned(reg23[(4'h9):(1'h0)]) : reg48);
          reg52 <= ($unsigned(reg16) ?
              reg14 : $unsigned(({{wire3, reg46}} + $unsigned({reg21}))));
        end
      else
        begin
          if (({{($unsigned(reg21) <= $signed((8'h9f))),
                      (((8'hb7) ? wire6 : wire1) == reg11)},
                  {$signed((wire6 + wire1))}} ?
              $unsigned($signed(((wire0 ?
                  reg9 : reg9) || (~|reg49)))) : ((reg12[(4'hb):(1'h0)] ?
                  $signed(wire0[(2'h3):(2'h3)]) : reg49) && wire1)))
            begin
              reg49 <= (reg44[(1'h0):(1'h0)] ?
                  ((|reg10) & $signed(((wire6 ? wire1 : reg42) ?
                      ((8'ha6) ? wire2 : reg21) : reg8))) : ($unsigned(reg24) ?
                      ($unsigned((reg10 ?
                          reg46 : reg48)) * $signed($signed(reg17))) : reg15[(3'h7):(2'h2)]));
              reg50 <= $signed((reg44 ?
                  (+reg44) : ({wire18[(5'h13):(4'hf)], (~&reg10)} ?
                      ((~&reg8) ?
                          reg48 : (wire2 ?
                              reg16 : (8'hb0))) : ($unsigned(reg16) ?
                          reg42 : (reg47 ^ reg14)))));
              reg51 <= ((wire3 ?
                  (reg8[(3'h5):(3'h5)] ?
                      $unsigned((^~reg50)) : reg9[(3'h6):(3'h5)]) : reg52[(4'hf):(4'he)]) >= {({reg47[(4'ha):(4'h8)]} ?
                      ((^reg17) & reg44[(4'ha):(1'h1)]) : wire25)});
              reg52 <= {(wire25[(1'h1):(1'h0)] >> reg48[(1'h0):(1'h0)])};
              reg53 <= (~|{{$signed($unsigned(reg20))}});
            end
          else
            begin
              reg49 <= $signed((wire4[(3'h7):(2'h2)] != reg13[(2'h3):(1'h1)]));
              reg50 <= $signed((|reg49));
            end
        end
      reg54 <= (+({((reg21 << (8'hbf)) >> $unsigned(reg49))} ?
          $signed($unsigned((reg23 ? wire1 : reg51))) : wire7[(1'h0):(1'h0)]));
    end
  assign wire55 = $unsigned(wire2);
  assign wire56 = wire19;
  module57 #() modinst120 (wire119, clk, reg54, wire56, reg47, reg51, reg15);
  assign wire121 = reg42;
  assign wire122 = (!$unsigned((((reg44 && (7'h40)) ?
                       reg14 : $unsigned((8'hb0))) & ((~|reg11) != $signed(reg15)))));
  assign wire123 = $unsigned(((wire6[(1'h1):(1'h1)] + (|(wire121 ?
                       reg49 : (8'hbd)))) > {reg21[(3'h5):(2'h3)], reg42}));
  assign wire124 = (($signed((reg49[(4'h8):(1'h0)] | reg21[(2'h3):(2'h3)])) ?
                       ((+$unsigned(wire123)) && $signed($unsigned(reg16))) : (wire121[(3'h7):(2'h3)] ?
                           $signed($unsigned(reg46)) : $unsigned((reg22 ?
                               wire4 : reg52)))) != (8'ha2));
  assign wire125 = $signed((~|(&(-$unsigned(reg10)))));
  assign wire126 = wire3[(2'h3):(2'h3)];
  assign wire127 = (((wire18[(2'h3):(2'h2)] ?
                           (reg23[(2'h3):(1'h0)] ?
                               $unsigned(reg9) : wire56[(4'hd):(1'h0)]) : $signed((reg43 >= (8'ha8)))) ?
                       reg12[(5'h11):(2'h3)] : $signed(reg11[(1'h1):(1'h1)])) == reg45);
  assign wire128 = wire7;
endmodule

module module57  (y, clk, wire58, wire59, wire60, wire61, wire62);
  output wire [(32'h77):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire58;
  input wire signed [(5'h11):(1'h0)] wire59;
  input wire [(4'h8):(1'h0)] wire60;
  input wire [(4'hd):(1'h0)] wire61;
  input wire [(4'hb):(1'h0)] wire62;
  wire signed [(5'h12):(1'h0)] wire118;
  wire [(4'hd):(1'h0)] wire117;
  wire signed [(5'h13):(1'h0)] wire115;
  wire [(5'h14):(1'h0)] wire113;
  wire signed [(5'h11):(1'h0)] wire63;
  wire signed [(5'h10):(1'h0)] wire64;
  wire signed [(3'h4):(1'h0)] wire77;
  reg [(4'hb):(1'h0)] reg116 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire115,
                 wire113,
                 wire63,
                 wire64,
                 wire77,
                 reg116,
                 (1'h0)};
  assign wire63 = (((wire62[(1'h0):(1'h0)] ? {wire58} : wire58[(4'hb):(3'h4)]) ?
                      $unsigned(wire60) : wire58) << $signed({((wire62 ?
                              wire59 : wire60) ?
                          wire61 : {wire58})}));
  assign wire64 = $unsigned(($signed(wire62[(2'h3):(1'h1)]) < $unsigned(wire61)));
  module65 #() modinst78 (.wire67(wire60), .wire70(wire64), .y(wire77), .wire66(wire59), .wire69(wire62), .wire68(wire58), .clk(clk));
  module79 #() modinst114 (wire113, clk, wire59, wire58, wire61, wire62);
  assign wire115 = (8'hbc);
  always
    @(posedge clk) begin
      reg116 <= wire77;
    end
  assign wire117 = {{(|(8'ha4))},
                       {(~|$unsigned((wire113 ? (8'hbb) : wire58))),
                           (~|(^~{wire113}))}};
  assign wire118 = (~(-wire77));
endmodule

module module26  (y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire31;
  input wire [(2'h2):(1'h0)] wire30;
  input wire signed [(4'h8):(1'h0)] wire29;
  input wire [(4'h8):(1'h0)] wire28;
  input wire [(5'h11):(1'h0)] wire27;
  wire signed [(4'hc):(1'h0)] wire39;
  wire [(4'h9):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire37;
  wire [(5'h13):(1'h0)] wire36;
  wire signed [(4'hd):(1'h0)] wire35;
  wire signed [(4'h9):(1'h0)] wire34;
  wire [(2'h3):(1'h0)] wire33;
  wire signed [(3'h4):(1'h0)] wire32;
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 (1'h0)};
  assign wire32 = wire30;
  assign wire33 = $unsigned((-$signed(wire27[(3'h4):(2'h2)])));
  assign wire34 = wire32;
  assign wire35 = (wire31 || wire27[(3'h5):(3'h4)]);
  assign wire36 = wire28[(3'h4):(3'h4)];
  assign wire37 = (wire27[(4'he):(1'h1)] << $signed($unsigned($unsigned({wire33}))));
  assign wire38 = $unsigned($unsigned(wire32[(3'h4):(3'h4)]));
  assign wire39 = wire37;
endmodule

module module79
#(parameter param112 = ((((((8'ha1) ? (8'ha6) : (8'hbf)) ^ ((8'hb1) ? (8'hb1) : (8'haa))) >>> ((^~(8'hbb)) || {(7'h40), (8'ha4)})) >>> ({((8'haa) | (8'haf)), (^(7'h40))} ? (~|((8'hbc) << (8'ha6))) : ((^~(8'hbe)) <= ((8'ha5) ? (8'ha1) : (8'hb5))))) > ({((-(8'hac)) ~^ ((8'hba) ^ (8'hbd))), ((^(8'hb7)) ? {(8'h9c)} : (!(7'h42)))} != ((~|((8'haf) ? (8'hb2) : (8'h9c))) <= ((^~(8'hb1)) ? ((7'h42) * (7'h40)) : ((8'ha4) + (8'hbf)))))))
(y, clk, wire83, wire82, wire81, wire80);
  output wire [(32'h17d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire83;
  input wire signed [(3'h4):(1'h0)] wire82;
  input wire [(4'hd):(1'h0)] wire81;
  input wire [(4'hb):(1'h0)] wire80;
  wire [(4'hd):(1'h0)] wire98;
  wire signed [(5'h15):(1'h0)] wire97;
  wire signed [(5'h11):(1'h0)] wire87;
  wire signed [(3'h7):(1'h0)] wire86;
  wire signed [(4'he):(1'h0)] wire85;
  wire signed [(5'h13):(1'h0)] wire84;
  reg signed [(4'hf):(1'h0)] reg111 = (1'h0);
  reg [(4'ha):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg107 = (1'h0);
  reg signed [(4'he):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg105 = (1'h0);
  reg [(2'h3):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg102 = (1'h0);
  reg [(2'h3):(1'h0)] reg101 = (1'h0);
  reg [(4'hc):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg96 = (1'h0);
  reg [(5'h14):(1'h0)] reg95 = (1'h0);
  reg [(2'h2):(1'h0)] reg94 = (1'h0);
  reg [(5'h15):(1'h0)] reg93 = (1'h0);
  reg [(3'h5):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg91 = (1'h0);
  reg [(5'h12):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg89 = (1'h0);
  reg [(5'h10):(1'h0)] reg88 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 (1'h0)};
  assign wire84 = (8'hb6);
  assign wire85 = wire84[(5'h12):(5'h12)];
  assign wire86 = (wire83[(2'h2):(1'h0)] ?
                      wire82 : $unsigned($unsigned($unsigned((wire85 ?
                          wire81 : wire84)))));
  assign wire87 = $signed(((($signed(wire85) >= ((8'ha4) * (8'hac))) ^ $signed((wire83 ?
                      wire83 : wire85))) - ((~^(wire82 ?
                      wire86 : wire85)) < ({wire86} <<< (~|(8'hb7))))));
  always
    @(posedge clk) begin
      if (wire83)
        begin
          if (wire81[(4'hd):(2'h3)])
            begin
              reg88 <= ((((^(wire86 ? wire84 : wire81)) ?
                      $unsigned(wire85) : $unsigned($signed(wire82))) == wire87[(1'h1):(1'h0)]) ?
                  {(7'h42)} : ($unsigned(wire82[(1'h0):(1'h0)]) ?
                      {(wire84 ? (wire82 ? wire84 : wire85) : wire85),
                          $unsigned($signed(wire86))} : $signed((wire81[(2'h2):(2'h2)] ?
                          wire84[(2'h2):(1'h1)] : (~&wire87)))));
              reg89 <= $signed((({{wire87},
                  (wire83 ?
                      wire86 : (8'hb5))} * $unsigned($signed(wire80))) ^~ (({(8'hb2)} >>> wire83[(2'h2):(2'h2)]) ?
                  (~&((8'ha6) >> wire83)) : wire82[(2'h2):(2'h2)])));
              reg90 <= ((wire87 >>> (&(wire83[(2'h3):(1'h0)] ?
                  (^~wire86) : wire87[(5'h11):(5'h10)]))) < wire85[(4'ha):(3'h6)]);
              reg91 <= $unsigned({((8'h9e) == (^(wire85 ^ wire82)))});
              reg92 <= {((^~$unsigned((~wire87))) ?
                      wire82[(3'h4):(2'h3)] : (reg90[(4'ha):(3'h7)] ?
                          (&(wire86 ^ wire85)) : ($unsigned(wire80) ?
                              $signed(wire80) : (wire82 ? reg89 : wire86))))};
            end
          else
            begin
              reg88 <= ($unsigned($signed(($unsigned(reg92) != reg88))) ?
                  $unsigned($signed($unsigned(((7'h40) ?
                      reg88 : reg89)))) : $signed(((~$signed((8'hb9))) < $unsigned($signed(wire87)))));
              reg89 <= $unsigned(((~(~|wire84[(4'hd):(3'h6)])) ?
                  wire83[(2'h2):(1'h0)] : (|wire85)));
            end
        end
      else
        begin
          reg88 <= wire82[(2'h3):(2'h2)];
        end
      if ({(~^wire83[(2'h2):(2'h2)]),
          (((^~((8'ha1) ? reg92 : reg88)) >>> (-wire87)) == (8'hb7))})
        begin
          reg93 <= (~(!wire84));
        end
      else
        begin
          reg93 <= (-{$signed($unsigned($signed((8'h9f))))});
        end
      reg94 <= ($signed(($unsigned(wire85[(4'h8):(4'h8)]) <= reg88)) >>> ($signed($signed((wire84 || (8'ha7)))) | ($unsigned($signed(wire81)) ?
          $unsigned($signed(reg91)) : $signed((~wire81)))));
      reg95 <= (!reg91[(3'h5):(3'h5)]);
    end
  always
    @(posedge clk) begin
      reg96 <= ((($unsigned($unsigned(reg88)) <<< reg91[(3'h7):(1'h1)]) ?
          ({(reg92 ? wire81 : wire80)} ?
              $signed((wire81 >> reg93)) : reg94[(1'h1):(1'h0)]) : (~^reg90)) > $signed($signed((~$unsigned(reg93)))));
    end
  assign wire97 = ({{(wire85 ? wire83 : $signed(reg90))},
                      $unsigned(({reg92,
                          reg90} & $unsigned(wire80)))} < ((!($signed(reg90) ?
                      (^(8'hb5)) : reg91)) + {$unsigned((reg92 ?
                          wire83 : wire82))}));
  assign wire98 = wire85;
  always
    @(posedge clk) begin
      reg99 <= $unsigned((+$signed(($unsigned(wire97) < (reg96 <= reg95)))));
    end
  always
    @(posedge clk) begin
      reg100 <= reg99;
      reg101 <= $signed((({$unsigned(wire87), $signed(reg91)} ?
          (~|$unsigned(wire87)) : reg90[(1'h1):(1'h1)]) >> (&(^~$signed(wire98)))));
      reg102 <= wire83[(3'h5):(2'h2)];
      if ((8'hb9))
        begin
          reg103 <= $unsigned((~^$unsigned(($unsigned(reg100) ?
              {(8'hb6)} : (wire85 ^~ wire80)))));
          if (((+($signed($signed(wire85)) ?
                  (+(wire86 ? reg95 : reg99)) : ((~|reg94) ?
                      $unsigned(reg88) : (8'hab)))) ?
              reg91[(3'h5):(2'h3)] : ((8'ha7) ?
                  reg88[(3'h6):(2'h3)] : (!(8'ha2)))))
            begin
              reg104 <= (-(~|(reg92[(2'h2):(1'h0)] ?
                  (reg89[(5'h11):(5'h10)] ^ wire98) : (reg102[(4'h9):(3'h6)] ?
                      (wire84 ? reg94 : reg89) : $signed(wire86)))));
              reg105 <= reg94;
              reg106 <= (~&$unsigned((+$unsigned(((8'ha8) || wire84)))));
            end
          else
            begin
              reg104 <= wire86;
              reg105 <= (&(reg106[(2'h3):(2'h3)] | $unsigned((^~$signed(reg94)))));
              reg106 <= wire85;
            end
        end
      else
        begin
          reg103 <= $unsigned($signed((+$unsigned($signed(wire97)))));
          reg104 <= $unsigned((($signed($signed(reg100)) ?
                  $signed($unsigned((8'hb6))) : (~reg89)) ?
              reg102 : $unsigned((reg96 <<< (reg93 ? wire86 : wire82)))));
          reg105 <= $unsigned((wire86 ?
              reg103[(2'h3):(2'h3)] : (reg91[(1'h1):(1'h0)] ?
                  (~^(reg91 ? reg90 : wire83)) : ($unsigned(reg95) ?
                      (reg93 & wire83) : $unsigned(reg94)))));
          reg106 <= reg90;
          if ((-($signed($unsigned($unsigned(wire83))) ?
              reg93 : $unsigned(wire86))))
            begin
              reg107 <= reg93;
              reg108 <= (&{(reg106 ? $signed((&reg95)) : reg94)});
              reg109 <= ((&wire98) ~^ ((reg88[(5'h10):(1'h0)] ?
                  $signed((8'haf)) : (&reg101)) ^ (+$unsigned($signed(reg107)))));
              reg110 <= $signed((^~(~^($signed(reg109) ^~ $unsigned(reg92)))));
              reg111 <= $unsigned(($unsigned(reg107[(3'h7):(2'h3)]) * $signed(reg90[(2'h2):(1'h0)])));
            end
          else
            begin
              reg107 <= $unsigned((reg101 ?
                  (((wire98 ? reg96 : reg103) ?
                          $signed(wire82) : reg102[(2'h3):(2'h2)]) ?
                      $signed((~^reg104)) : ({reg93, reg100} ?
                          reg88[(1'h1):(1'h1)] : (!reg94))) : $unsigned({(reg100 & (8'hac)),
                      $signed(reg89)})));
              reg108 <= ($signed(((reg94 || $unsigned(wire83)) == $unsigned((^reg102)))) <= {((~&(wire84 < reg102)) || ((reg88 ?
                          reg91 : wire86) ?
                      (&reg107) : $signed((8'haf)))),
                  $unsigned(wire98)});
              reg109 <= (~$signed(reg91));
            end
        end
    end
endmodule

module module65
#(parameter param75 = ((~|(+(+{(8'ha6)}))) & (((~|((8'hbd) & (8'ha7))) ? (((8'ha6) << (8'hb2)) ? ((8'ha5) ? (8'h9c) : (8'ha7)) : {(8'hbb)}) : (~|{(8'ha8)})) ? (+(((8'ha4) << (8'ha6)) - (&(8'hb2)))) : (+(8'h9f)))), 
parameter param76 = {param75})
(y, clk, wire70, wire69, wire68, wire67, wire66);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire70;
  input wire signed [(4'h9):(1'h0)] wire69;
  input wire signed [(5'h11):(1'h0)] wire68;
  input wire signed [(2'h3):(1'h0)] wire67;
  input wire signed [(3'h5):(1'h0)] wire66;
  wire [(4'hc):(1'h0)] wire74;
  wire signed [(4'hc):(1'h0)] wire73;
  wire signed [(5'h13):(1'h0)] wire72;
  wire [(4'he):(1'h0)] wire71;
  assign y = {wire74, wire73, wire72, wire71, (1'h0)};
  assign wire71 = (wire69 ?
                      ((+wire67) ? wire69 : (^wire68)) : ($unsigned(((7'h44) ?
                          wire68[(3'h4):(2'h3)] : $signed(wire68))) + ($signed((wire66 >>> wire68)) ?
                          ((~&wire69) ? (^~wire70) : (^~wire68)) : ({wire69,
                              wire69} && (wire68 ? wire69 : (8'hbc))))));
  assign wire72 = (wire67 ?
                      (8'ha4) : $unsigned((($unsigned(wire66) && (^wire66)) | wire67[(2'h2):(1'h0)])));
  assign wire73 = (~|wire72);
  assign wire74 = ($signed($unsigned($unsigned(wire69))) > $unsigned(wire67));
endmodule
