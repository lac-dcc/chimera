module top
#(parameter param140 = ((~^{({(8'hb5)} ? ((8'ha9) << (8'hb7)) : ((8'hb2) ? (7'h40) : (8'h9f)))}) | ({{((8'ha3) ? (8'ha8) : (8'hb9))}, ((^(8'hbc)) ~^ (~(8'h9e)))} & (8'hbc))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h201):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire3;
  wire signed [(4'ha):(1'h0)] wire138;
  wire signed [(5'h13):(1'h0)] wire137;
  wire signed [(2'h3):(1'h0)] wire136;
  wire signed [(4'he):(1'h0)] wire135;
  wire [(2'h3):(1'h0)] wire17;
  wire signed [(2'h2):(1'h0)] wire31;
  wire [(4'hf):(1'h0)] wire33;
  wire [(4'ha):(1'h0)] wire34;
  wire signed [(3'h4):(1'h0)] wire36;
  wire signed [(5'h11):(1'h0)] wire45;
  wire signed [(4'he):(1'h0)] wire46;
  wire [(4'he):(1'h0)] wire47;
  wire [(5'h12):(1'h0)] wire48;
  wire [(4'hd):(1'h0)] wire49;
  wire signed [(5'h14):(1'h0)] wire50;
  wire [(5'h11):(1'h0)] wire133;
  reg signed [(5'h10):(1'h0)] reg139 = (1'h0);
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(2'h3):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg40 = (1'h0);
  reg [(5'h12):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg [(4'hc):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg4 = (1'h0);
  assign y = {wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire17,
                 wire31,
                 wire33,
                 wire34,
                 wire36,
                 wire45,
                 wire46,
                 wire47,
                 wire48,
                 wire49,
                 wire50,
                 wire133,
                 reg139,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg35,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire1;
      if (wire2)
        begin
          reg5 <= $unsigned((((+(|(8'h9d))) <= (((7'h43) ? wire1 : wire2) ?
                  $unsigned(wire2) : wire0[(3'h4):(2'h3)])) ?
              $signed({$signed(wire1),
                  wire0[(3'h5):(3'h5)]}) : wire0[(3'h4):(2'h3)]));
          reg6 <= $unsigned(($signed({$signed(wire0), {reg5, (8'h9d)}}) ?
              (~^reg4) : reg5[(3'h6):(1'h0)]));
          reg7 <= (8'hb3);
          if ((|{(((8'hab) + (^reg4)) ? wire1 : $unsigned({reg6, wire0}))}))
            begin
              reg8 <= $signed((^~reg4[(4'ha):(4'h9)]));
              reg9 <= {{reg4, $unsigned(wire0)}};
              reg10 <= $unsigned(($signed($signed(((8'ha8) ?
                  wire0 : reg5))) ~^ ((8'ha1) || reg9)));
              reg11 <= ((-{reg10, ((8'ha1) >>> {reg8, reg7})}) ?
                  (((~&$signed(wire1)) ?
                      reg9 : (wire2 && (&reg5))) > (~^wire2)) : ({(wire2 ^ (^(8'hbb))),
                      $unsigned(reg7)} <<< $unsigned(reg10[(4'ha):(4'h8)])));
              reg12 <= (+({(!$signed(wire1)), wire3[(2'h3):(2'h2)]} ?
                  $signed($unsigned(wire2[(1'h1):(1'h1)])) : reg9));
            end
          else
            begin
              reg8 <= reg12[(2'h2):(1'h0)];
              reg9 <= $signed($signed($unsigned(($signed((8'hbc)) ?
                  $unsigned((8'ha9)) : $signed(reg4)))));
            end
          reg13 <= (((reg4[(2'h3):(2'h2)] >>> (~|reg6)) ?
              reg12 : reg4[(3'h5):(1'h1)]) > reg6[(4'h8):(3'h7)]);
        end
      else
        begin
          reg5 <= $signed(({(~^{reg8}),
              $unsigned((~reg5))} >>> (((|wire3) - (reg10 << reg11)) ~^ {((8'had) ?
                  wire3 : reg4)})));
          reg6 <= ((~^(&($unsigned(wire2) + reg5[(4'hf):(4'h8)]))) + $unsigned({$signed($signed(reg8))}));
        end
      reg14 <= ($unsigned({(|$unsigned(reg11))}) ?
          $unsigned($signed($signed(reg13))) : (8'ha7));
      reg15 <= {(wire0 >>> (wire1[(2'h2):(1'h1)] ? wire2 : $signed({reg6}))),
          (wire2 ? ((8'ha8) <<< ((|reg4) > wire2[(3'h6):(1'h0)])) : reg9)};
      reg16 <= (((($unsigned(wire0) ? (wire3 << reg13) : {(8'ha3), wire2}) ?
                  (|(~|reg10)) : wire1) ?
              (&((7'h41) ? {reg8, wire0} : $signed(wire2))) : reg15) ?
          ((reg8[(4'hc):(1'h1)] ^ $signed((!(8'hae)))) >= $unsigned(((+reg15) & reg14[(3'h6):(2'h3)]))) : $signed(($signed((^~reg11)) ?
              (reg9 ?
                  $unsigned(reg14) : (^reg14)) : ((8'hba) < $unsigned(reg14)))));
    end
  assign wire17 = ((~^(!{(~^wire2)})) << (reg16 + ({$unsigned((8'hb8))} >= $unsigned($unsigned(reg8)))));
  module18 #() modinst32 (wire31, clk, reg15, reg10, reg5, reg8);
  assign wire33 = {(~^reg8[(4'he):(4'hb)]),
                      $signed({$signed(((8'h9d) ? wire17 : reg13))})};
  assign wire34 = reg8[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg35 <= ((^~$signed($unsigned(reg5[(5'h15):(3'h4)]))) < reg6[(4'ha):(3'h5)]);
    end
  assign wire36 = (~^reg10[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      reg37 <= (~&((+((reg16 ? reg8 : wire36) ?
          (wire33 ~^ reg8) : (reg35 ? reg14 : reg6))) ^~ $unsigned({(reg16 ?
              wire1 : reg13),
          (wire31 ~^ wire31)})));
      if ($signed(($unsigned(wire3) ?
          (($signed(reg13) ^~ reg9) | ((+(8'hb8)) ?
              $unsigned(reg14) : (reg8 ?
                  reg5 : reg10))) : (^~$unsigned((wire36 ? reg11 : reg10))))))
        begin
          reg38 <= $unsigned($unsigned($signed((reg4[(2'h2):(1'h0)] <<< (reg7 ?
              reg35 : reg12)))));
          reg39 <= $unsigned(wire17);
          reg40 <= (&($unsigned(wire33) ?
              (reg7 ?
                  $unsigned((reg13 | reg12)) : ({wire17,
                      reg11} == $unsigned(reg6))) : reg8));
          reg41 <= $signed(($signed((reg13[(4'h9):(3'h4)] == $signed(reg11))) ?
              (^$signed((reg9 ? (8'ha1) : (8'ha1)))) : reg38));
        end
      else
        begin
          reg38 <= $unsigned(reg38);
          reg39 <= wire0;
          reg40 <= {$unsigned($signed(($signed(reg4) ?
                  $unsigned((8'hbb)) : ((8'haa) >> wire17)))),
              ($signed(((wire17 ^ reg13) > $unsigned((8'ha7)))) - reg9[(2'h2):(1'h1)])};
          reg41 <= ((reg40 ?
              ({$unsigned(reg12),
                  reg15} && (-(reg35 < reg6))) : (|(^wire17))) < $unsigned($unsigned(((reg15 ?
              reg7 : reg12) * $unsigned(reg38)))));
          reg42 <= reg14[(3'h6):(3'h4)];
        end
      reg43 <= reg38[(2'h2):(1'h1)];
      reg44 <= $unsigned((~^$signed(reg11)));
    end
  assign wire45 = $unsigned($signed($signed((reg11 ~^ (8'hbe)))));
  assign wire46 = (8'ha7);
  assign wire47 = (^((&(^~$signed((8'ha4)))) != (~reg14)));
  assign wire48 = ((~^((~|reg11) ?
                      $unsigned($signed(reg4)) : wire36)) - ($signed({(reg4 - reg10)}) ?
                      $signed($unsigned((wire2 ^~ wire0))) : reg37));
  assign wire49 = $signed($unsigned(reg4));
  assign wire50 = (|($unsigned($unsigned((^wire47))) ?
                      (&(wire48 << (wire31 ?
                          reg38 : (8'ha8)))) : {$signed((wire0 * wire31))}));
  module51 #() modinst134 (wire133, clk, wire46, reg14, reg40, reg4, reg6);
  assign wire135 = $signed(wire33);
  assign wire136 = (($unsigned((8'h9e)) & ($signed({wire3, reg39}) ?
                       wire135 : reg13[(1'h0):(1'h0)])) & ($signed($unsigned(wire36)) & (-((~&reg15) >= (reg16 ?
                       reg10 : wire47)))));
  assign wire137 = $signed(reg13[(2'h3):(2'h2)]);
  assign wire138 = {(reg9[(1'h0):(1'h0)] ?
                           $signed((reg40 != reg6[(5'h10):(4'h8)])) : ({{wire3,
                                   reg40},
                               $unsigned(wire46)} * wire36)),
                       (wire137 ?
                           $unsigned((~|{reg4, (8'hae)})) : (((&reg12) ?
                                   ((7'h40) ? wire45 : wire50) : (7'h40)) ?
                               wire2[(2'h2):(1'h0)] : $unsigned(reg13)))};
  always
    @(posedge clk) begin
      reg139 <= ((8'h9f) ?
          wire36 : {reg10[(4'ha):(3'h4)],
              (((|reg13) ? wire49 : reg40[(3'h7):(1'h0)]) ?
                  $signed($unsigned(reg6)) : $signed({reg42}))});
    end
endmodule

module module51
#(parameter param132 = (-((~^{(8'h9e)}) != (~|((~&(8'ha8)) || ((8'ha9) >= (8'hbb)))))))
(y, clk, wire56, wire55, wire54, wire53, wire52);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire56;
  input wire [(5'h15):(1'h0)] wire55;
  input wire [(4'ha):(1'h0)] wire54;
  input wire [(5'h15):(1'h0)] wire53;
  input wire [(5'h10):(1'h0)] wire52;
  wire signed [(4'hb):(1'h0)] wire131;
  wire signed [(5'h13):(1'h0)] wire130;
  wire [(4'he):(1'h0)] wire129;
  wire [(4'ha):(1'h0)] wire128;
  wire signed [(4'he):(1'h0)] wire124;
  wire signed [(4'hd):(1'h0)] wire99;
  wire signed [(2'h3):(1'h0)] wire63;
  wire signed [(5'h10):(1'h0)] wire59;
  wire [(4'he):(1'h0)] wire58;
  wire [(3'h7):(1'h0)] wire122;
  reg [(3'h5):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg126 = (1'h0);
  reg [(5'h11):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg60 = (1'h0);
  reg [(4'ha):(1'h0)] reg57 = (1'h0);
  assign y = {wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire124,
                 wire99,
                 wire63,
                 wire59,
                 wire58,
                 wire122,
                 reg127,
                 reg126,
                 reg125,
                 reg62,
                 reg61,
                 reg60,
                 reg57,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg57 <= $unsigned(wire56);
    end
  assign wire58 = reg57[(3'h5):(3'h5)];
  assign wire59 = (wire53[(3'h6):(3'h5)] & {wire52[(4'hb):(4'h9)],
                      wire54[(3'h5):(3'h4)]});
  always
    @(posedge clk) begin
      if ($signed($signed(((wire53[(5'h11):(1'h1)] ?
          $signed(wire56) : $signed(wire55)) & $unsigned($unsigned(wire53))))))
        begin
          reg60 <= $signed($unsigned(wire55));
        end
      else
        begin
          if (wire53)
            begin
              reg60 <= (|$signed(wire54));
            end
          else
            begin
              reg60 <= ($unsigned($signed($signed((!reg57)))) ~^ reg60[(2'h3):(2'h2)]);
              reg61 <= $unsigned($unsigned($unsigned({wire58[(3'h5):(2'h3)]})));
              reg62 <= (~$unsigned($unsigned(((wire54 ?
                  wire59 : (8'hb3)) <= $signed(wire54)))));
            end
        end
    end
  assign wire63 = ((+wire54[(3'h4):(2'h2)]) <= ((|{$signed(wire58), wire54}) ?
                      $signed({$unsigned(wire53),
                          $unsigned((8'hb6))}) : (({wire54} ?
                              $unsigned(wire59) : ((8'h9f) ?
                                  (8'hb2) : wire54)) ?
                          (7'h43) : $signed({wire55, wire54}))));
  module64 #() modinst100 (.y(wire99), .wire67(wire55), .wire66(reg60), .wire68(reg62), .wire65(wire54), .clk(clk), .wire69(wire59));
  module101 #() modinst123 (wire122, clk, wire53, wire55, wire59, reg61, reg57);
  assign wire124 = (((^reg62) >= $unsigned(wire63)) ?
                       (wire59 & (reg57 <<< (+$signed((7'h40))))) : $signed($unsigned(wire56)));
  always
    @(posedge clk) begin
      reg125 <= ({reg57, wire54[(1'h1):(1'h1)]} <<< {reg57});
      reg126 <= wire55[(4'he):(1'h0)];
      reg127 <= wire63;
    end
  assign wire128 = (((~|reg126[(1'h0):(1'h0)]) | wire53[(4'hf):(4'hf)]) ?
                       reg57[(4'h9):(4'h9)] : {$unsigned($signed(reg61))});
  assign wire129 = wire59[(5'h10):(3'h7)];
  assign wire130 = (8'hab);
  assign wire131 = (wire53[(3'h6):(2'h3)] & (^~wire122[(2'h3):(1'h0)]));
endmodule

module module18
#(parameter param30 = (((~&({(8'h9e), (8'h9d)} ? ((8'hba) ? (8'ha7) : (8'haa)) : ((8'h9c) || (8'hb5)))) ? {(((8'ha7) ? (7'h44) : (8'hb8)) ? ((8'h9c) ? (7'h44) : (8'hb9)) : (!(8'ha9)))} : ((~^(!(8'hb7))) ? ((~|(8'ha2)) ? ((8'ha0) ? (8'hb5) : (7'h44)) : ((7'h40) != (8'ha5))) : (((8'hb5) ? (8'ha5) : (7'h40)) ? (~|(8'haf)) : ((8'hb9) < (8'ha2))))) >> (~^((~((8'hb7) << (7'h40))) ? (((8'ha6) ? (8'ha5) : (8'ha9)) ? (~^(8'hbe)) : {(8'hbf)}) : (^~((8'ha4) ? (8'hb9) : (8'hbf)))))))
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire22;
  input wire signed [(4'hc):(1'h0)] wire21;
  input wire [(5'h13):(1'h0)] wire20;
  input wire signed [(3'h5):(1'h0)] wire19;
  wire signed [(2'h2):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire27;
  wire [(4'h9):(1'h0)] wire26;
  wire signed [(5'h11):(1'h0)] wire25;
  wire [(4'hd):(1'h0)] wire24;
  wire signed [(5'h11):(1'h0)] wire23;
  assign y = {wire29, wire28, wire27, wire26, wire25, wire24, wire23, (1'h0)};
  assign wire23 = {($signed({$unsigned((8'haa)), $unsigned(wire22)}) ?
                          (!(~^(~|wire20))) : wire21),
                      (wire19 <<< (+(-$signed(wire20))))};
  assign wire24 = wire19;
  assign wire25 = (-$unsigned($unsigned(((wire24 >= wire21) ?
                      wire24 : wire21))));
  assign wire26 = ((~|wire21) ? wire22 : wire21);
  assign wire27 = ($unsigned({$unsigned($unsigned(wire19)), (!(~wire23))}) ?
                      $unsigned(((^~(^wire23)) < (~&$unsigned(wire25)))) : (~|$signed((((8'haf) ?
                              wire21 : wire19) ?
                          (|wire20) : (&(8'hab))))));
  assign wire28 = (~|wire20);
  assign wire29 = wire28;
endmodule

module module101  (y, clk, wire106, wire105, wire104, wire103, wire102);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire106;
  input wire signed [(5'h15):(1'h0)] wire105;
  input wire signed [(4'hf):(1'h0)] wire104;
  input wire [(4'hc):(1'h0)] wire103;
  input wire [(3'h6):(1'h0)] wire102;
  wire signed [(5'h14):(1'h0)] wire121;
  wire signed [(5'h10):(1'h0)] wire120;
  wire signed [(3'h7):(1'h0)] wire119;
  wire [(3'h4):(1'h0)] wire118;
  wire signed [(4'he):(1'h0)] wire117;
  wire [(5'h15):(1'h0)] wire116;
  wire signed [(3'h6):(1'h0)] wire115;
  wire [(4'h8):(1'h0)] wire114;
  wire signed [(5'h13):(1'h0)] wire113;
  wire signed [(4'h8):(1'h0)] wire112;
  wire [(4'ha):(1'h0)] wire111;
  wire [(2'h3):(1'h0)] wire110;
  wire signed [(3'h5):(1'h0)] wire109;
  wire signed [(4'h9):(1'h0)] wire108;
  wire signed [(4'hd):(1'h0)] wire107;
  assign y = {wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 (1'h0)};
  assign wire107 = ((({{(8'ha3)}, $signed(wire106)} ?
                           $signed(((7'h44) <= wire103)) : ($unsigned(wire103) != wire105)) > $signed((~&{wire104,
                           wire104}))) ?
                       wire106[(4'h9):(1'h1)] : wire104[(4'hf):(3'h4)]);
  assign wire108 = wire105;
  assign wire109 = wire108[(3'h7):(3'h7)];
  assign wire110 = $signed($unsigned(((~^(!(8'h9d))) ?
                       $unsigned($signed(wire109)) : $unsigned((+(8'ha5))))));
  assign wire111 = {$signed({(wire105[(3'h6):(1'h0)] <= wire105[(5'h14):(5'h13)]),
                           wire105})};
  assign wire112 = $unsigned((((!{wire104, wire102}) ?
                       (wire107 ?
                           (wire105 ?
                               wire110 : wire111) : wire111) : wire103) < {(8'hb1)}));
  assign wire113 = ($signed($signed((wire106[(3'h6):(3'h6)] ?
                           (wire102 - wire106) : (wire111 * wire108)))) ?
                       $signed({((~&wire104) != (wire105 & wire107))}) : (~(+wire109[(1'h1):(1'h1)])));
  assign wire114 = (^~{(wire107 ^ $unsigned((wire112 * wire112))),
                       $unsigned($unsigned(((8'hb3) ? (7'h43) : wire102)))});
  assign wire115 = $signed(wire102[(1'h1):(1'h1)]);
  assign wire116 = wire103[(1'h1):(1'h0)];
  assign wire117 = wire109[(3'h5):(1'h0)];
  assign wire118 = (~|{(wire113[(4'he):(2'h3)] ?
                           wire109 : $unsigned({wire115, wire105})),
                       (!(^wire106[(3'h5):(3'h4)]))});
  assign wire119 = {$signed($signed(((wire114 < wire112) ?
                           $unsigned(wire107) : $unsigned((8'hb8)))))};
  assign wire120 = wire106[(4'hc):(1'h1)];
  assign wire121 = $signed($unsigned({$unsigned((wire108 != wire113)),
                       $signed(wire120)}));
endmodule

module module64
#(parameter param98 = ((^(^(((8'hb9) ? (8'ha7) : (8'ha9)) < ((8'ha2) ? (8'hbd) : (7'h43))))) ? (~^{(~{(8'hb6), (8'hbd)})}) : ((-((|(8'haa)) ? (&(8'h9f)) : (8'hb3))) ? ((((8'hbe) ? (8'hbd) : (8'hb2)) * ((8'hb7) ? (8'hab) : (8'ha4))) <<< (((8'h9f) | (8'hbd)) ? {(8'hab), (7'h41)} : {(8'ha3), (8'haf)})) : (|((-(8'hab)) ? {(8'had)} : (8'hb0))))))
(y, clk, wire69, wire68, wire67, wire66, wire65);
  output wire [(32'h151):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire69;
  input wire signed [(4'hf):(1'h0)] wire68;
  input wire [(4'hc):(1'h0)] wire67;
  input wire signed [(3'h6):(1'h0)] wire66;
  input wire [(4'ha):(1'h0)] wire65;
  wire signed [(4'hb):(1'h0)] wire97;
  wire [(4'ha):(1'h0)] wire96;
  wire signed [(4'he):(1'h0)] wire95;
  wire signed [(4'h9):(1'h0)] wire94;
  wire signed [(2'h2):(1'h0)] wire93;
  wire [(3'h7):(1'h0)] wire92;
  wire [(3'h5):(1'h0)] wire73;
  wire signed [(5'h14):(1'h0)] wire72;
  reg [(4'ha):(1'h0)] reg91 = (1'h0);
  reg [(5'h15):(1'h0)] reg90 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg89 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg87 = (1'h0);
  reg [(3'h6):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg83 = (1'h0);
  reg [(2'h2):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg81 = (1'h0);
  reg [(4'hb):(1'h0)] reg80 = (1'h0);
  reg [(4'hb):(1'h0)] reg79 = (1'h0);
  reg [(4'h9):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg77 = (1'h0);
  reg [(5'h12):(1'h0)] reg76 = (1'h0);
  reg [(5'h12):(1'h0)] reg75 = (1'h0);
  reg [(2'h2):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg71 = (1'h0);
  reg [(5'h11):(1'h0)] reg70 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire73,
                 wire72,
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
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg71,
                 reg70,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg70 <= {wire67[(1'h1):(1'h1)]};
      reg71 <= $unsigned($signed($unsigned($unsigned(wire67[(3'h7):(2'h3)]))));
    end
  assign wire72 = reg70;
  assign wire73 = (~$unsigned(reg70[(3'h6):(3'h5)]));
  always
    @(posedge clk) begin
      reg74 <= (|reg71);
      reg75 <= (wire73[(2'h3):(2'h3)] ?
          (reg70 ?
              $unsigned(((wire68 ? wire72 : wire73) >> {wire72,
                  (8'hbc)})) : $signed(wire69)) : $unsigned($unsigned($signed($unsigned(reg71)))));
      reg76 <= wire73[(2'h2):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg77 <= (~|{wire73[(1'h0):(1'h0)], {$unsigned(wire69)}});
      reg78 <= (({((~^(8'ha0)) * $unsigned(wire68))} ?
          (~($signed(wire73) < (~wire66))) : $signed(((wire69 * reg75) + {(8'hb8),
              reg75}))) | (8'h9f));
      reg79 <= reg71[(5'h12):(2'h3)];
      if ($signed($signed(reg71)))
        begin
          reg80 <= wire67[(2'h3):(2'h2)];
        end
      else
        begin
          if ((!$unsigned($signed((8'hb0)))))
            begin
              reg80 <= (~($unsigned(wire66[(1'h0):(1'h0)]) ?
                  $signed((!wire67[(1'h1):(1'h1)])) : (reg78 ^ ({reg79} == ((8'h9c) ?
                      (8'h9f) : reg76)))));
              reg81 <= $signed($unsigned(($unsigned($unsigned(wire67)) ?
                  (&(wire67 - wire68)) : ($unsigned(reg78) ?
                      $unsigned(reg70) : (-wire69)))));
              reg82 <= (reg78[(2'h3):(2'h3)] ?
                  $unsigned((^((wire72 | wire72) || wire65[(4'ha):(3'h5)]))) : wire66[(1'h1):(1'h1)]);
            end
          else
            begin
              reg80 <= ((reg75 ?
                  $signed((~|$unsigned(reg76))) : reg78) >> (8'h9d));
            end
          if (reg74)
            begin
              reg83 <= (~|$signed($signed($unsigned(wire67[(3'h7):(2'h2)]))));
              reg84 <= $unsigned(($unsigned($signed($signed(reg82))) << wire69[(4'h8):(3'h7)]));
              reg85 <= $signed(reg75);
              reg86 <= (8'hb2);
              reg87 <= ((|(-(~reg74[(2'h2):(2'h2)]))) & {$unsigned({(-reg74),
                      $signed(reg71)})});
            end
          else
            begin
              reg83 <= wire65[(4'ha):(1'h0)];
              reg84 <= {reg70[(5'h11):(3'h4)]};
              reg85 <= wire67[(3'h6):(3'h6)];
              reg86 <= reg86;
              reg87 <= reg77[(5'h11):(5'h10)];
            end
          reg88 <= reg75;
          if (reg83)
            begin
              reg89 <= ($signed({$unsigned(reg88)}) + {(^~$signed($unsigned(reg81)))});
            end
          else
            begin
              reg89 <= $signed($unsigned((!$signed($signed(reg80)))));
              reg90 <= ($unsigned(($signed(((8'hb3) ? (8'h9c) : wire73)) ?
                  (!(&wire66)) : (&(-reg81)))) && reg80);
              reg91 <= reg82[(1'h0):(1'h0)];
            end
        end
    end
  assign wire92 = (wire73 ?
                      (wire68[(1'h1):(1'h0)] <= $signed($unsigned({(8'h9f)}))) : $unsigned(((7'h42) ~^ {(8'hb2),
                          (reg76 ? reg76 : reg89)})));
  assign wire93 = {(~|wire66)};
  assign wire94 = ($signed((7'h40)) ?
                      reg79[(3'h4):(2'h2)] : wire68[(4'hf):(2'h2)]);
  assign wire95 = reg71;
  assign wire96 = ($signed((reg85 < (~^(reg83 ? reg78 : wire67)))) ?
                      $signed((((~^reg74) ?
                          $unsigned(reg85) : $unsigned(wire93)) >>> (wire73 && $signed((8'had))))) : $signed(reg74));
  assign wire97 = reg79;
endmodule
