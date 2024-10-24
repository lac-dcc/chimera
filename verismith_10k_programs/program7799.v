module top
#(parameter param94 = {{{(((8'ha0) ? (8'hb7) : (8'hb8)) ? (|(8'ha3)) : ((8'hb0) ? (8'hb5) : (7'h40))), {(8'hae), (-(8'hb2))}}}, {(-(((8'ha0) | (8'ha1)) ? {(8'hae)} : {(8'hbf)}))}})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h196):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire93;
  wire [(4'hf):(1'h0)] wire92;
  wire signed [(5'h15):(1'h0)] wire88;
  wire [(4'hf):(1'h0)] wire87;
  wire signed [(4'hb):(1'h0)] wire86;
  wire [(4'hb):(1'h0)] wire84;
  wire signed [(4'hb):(1'h0)] wire23;
  wire [(3'h4):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire4;
  reg [(4'hd):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg90 = (1'h0);
  reg [(4'hc):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire88,
                 wire87,
                 wire86,
                 wire84,
                 wire23,
                 wire5,
                 wire4,
                 reg91,
                 reg90,
                 reg89,
                 reg24,
                 reg22,
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
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = wire2[(1'h0):(1'h0)];
  assign wire5 = $signed((|($unsigned(wire4) != $signed(wire0))));
  always
    @(posedge clk) begin
      if ($signed(wire0))
        begin
          reg6 <= wire0;
          reg7 <= $unsigned(wire2);
        end
      else
        begin
          reg6 <= $signed($unsigned(reg6));
          reg7 <= $unsigned(reg7[(4'ha):(4'h8)]);
          reg8 <= $unsigned(wire0[(3'h5):(1'h1)]);
          reg9 <= wire5;
          reg10 <= (7'h44);
        end
      reg11 <= ((&{$unsigned((8'hbd))}) ?
          ((reg9[(2'h2):(2'h2)] ~^ reg7) >>> (8'hb7)) : reg9[(4'h9):(4'h8)]);
      reg12 <= reg10;
      if ((reg9[(4'h8):(3'h6)] ^ (^~$signed(wire5))))
        begin
          if ($unsigned(((~&$unsigned(wire5)) ?
              $signed((wire3 ? (^~(7'h41)) : $unsigned(reg9))) : reg8)))
            begin
              reg13 <= (^~(+wire5));
              reg14 <= ($signed(wire4[(1'h0):(1'h0)]) ?
                  {((reg8[(3'h5):(1'h0)] ?
                          $signed(reg10) : (8'hac)) <= (8'hbe)),
                      $unsigned((~^wire3))} : reg8[(1'h0):(1'h0)]);
              reg15 <= ($signed((!$unsigned($signed((8'hb2))))) ?
                  ((+(reg14[(3'h7):(3'h5)] ?
                      (wire0 ?
                          reg12 : wire0) : $signed((7'h43)))) + $unsigned(reg11)) : wire2);
            end
          else
            begin
              reg13 <= reg8;
              reg14 <= $unsigned((+$signed((wire2 ?
                  (^~reg8) : (wire2 > reg12)))));
            end
          reg16 <= wire5[(1'h0):(1'h0)];
          if (({$signed((wire1 >>> (reg10 ? wire0 : (8'hb3)))),
              $unsigned($unsigned(wire2))} << reg11[(3'h6):(3'h6)]))
            begin
              reg17 <= {$unsigned($signed(wire0)),
                  $signed($unsigned((+reg16)))};
              reg18 <= (~&((~&(wire0[(4'h9):(1'h1)] ?
                  $signed(reg16) : reg8[(3'h5):(3'h5)])) > ({(8'ha3),
                  $signed(reg6)} >> wire4)));
              reg19 <= reg8;
              reg20 <= ($unsigned({(wire2[(1'h1):(1'h1)] >>> (^reg7)),
                  wire5[(2'h2):(1'h0)]}) >> reg9[(2'h3):(2'h2)]);
              reg21 <= $signed(reg8);
            end
          else
            begin
              reg17 <= $unsigned((^~wire5));
              reg18 <= ($unsigned($unsigned($signed($unsigned(reg16)))) << reg15);
              reg19 <= (!reg8);
            end
          reg22 <= (reg9 ? reg13[(2'h3):(2'h3)] : $unsigned($signed(reg17)));
        end
      else
        begin
          reg13 <= $unsigned($signed((+((reg11 >> wire4) ?
              (^(8'hbf)) : reg14))));
          reg14 <= ({$unsigned((^(wire2 && reg10))),
                  {$signed(wire5), $signed($signed(wire4))}} ?
              $signed(($unsigned(reg8) ^ $unsigned(reg17[(2'h2):(1'h1)]))) : (reg9[(1'h1):(1'h0)] ^ reg22[(2'h3):(1'h0)]));
          reg15 <= ((+$signed($signed((reg22 ^ reg10)))) ?
              reg15[(3'h7):(2'h3)] : reg11[(2'h2):(1'h0)]);
        end
    end
  assign wire23 = $signed($signed((((wire5 ? reg19 : reg18) ?
                      (wire0 ? reg14 : wire1) : {reg19}) <= ((^reg19) ?
                      $unsigned(reg16) : $unsigned(reg18)))));
  always
    @(posedge clk) begin
      reg24 <= (+(8'hb7));
    end
  module25 #() modinst85 (.wire26(reg6), .wire29(reg17), .wire28(reg12), .wire27(reg24), .y(wire84), .clk(clk));
  assign wire86 = ((8'ha7) - wire84);
  assign wire87 = $unsigned($unsigned(($signed((reg15 != reg19)) ?
                      ((reg9 ~^ reg22) - {reg17}) : (~$unsigned(wire23)))));
  assign wire88 = ((~^{wire3}) <<< reg14[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg89 <= reg13;
      if ($signed(($unsigned((&(^~wire4))) & ($signed($unsigned(wire1)) ?
          $signed($signed(reg15)) : (~|wire23)))))
        begin
          reg90 <= reg17;
          reg91 <= reg20;
        end
      else
        begin
          reg90 <= $unsigned((((~^(^~(8'ha3))) ?
                  $unsigned($signed((7'h42))) : $unsigned((reg18 ?
                      wire3 : (8'hb8)))) ?
              {((|reg12) ^~ (wire23 < reg89)),
                  reg9[(5'h11):(3'h4)]} : (|((~wire84) ?
                  (wire88 ? wire5 : (8'haa)) : (reg9 ? reg10 : reg18)))));
          reg91 <= wire4;
        end
    end
  assign wire92 = ((($unsigned($signed(wire5)) ?
                      $signed(reg24) : reg13[(4'hc):(2'h3)]) < ($unsigned((wire4 ?
                      reg21 : reg6)) + (~^(reg8 ?
                      reg14 : reg20)))) ^~ wire1[(4'hf):(3'h5)]);
  assign wire93 = $unsigned($unsigned({(wire87[(4'hf):(4'hf)] ?
                          ((7'h42) ? wire2 : reg13) : (+reg11)),
                      $signed(reg8[(3'h4):(1'h1)])}));
endmodule

module module25  (y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h165):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire29;
  input wire [(5'h13):(1'h0)] wire28;
  input wire signed [(5'h13):(1'h0)] wire27;
  input wire [(3'h5):(1'h0)] wire26;
  wire signed [(4'ha):(1'h0)] wire83;
  wire signed [(4'hf):(1'h0)] wire82;
  wire [(3'h4):(1'h0)] wire81;
  wire [(5'h12):(1'h0)] wire80;
  wire signed [(2'h3):(1'h0)] wire79;
  wire signed [(4'he):(1'h0)] wire78;
  wire signed [(2'h3):(1'h0)] wire77;
  wire signed [(4'hc):(1'h0)] wire76;
  wire signed [(3'h6):(1'h0)] wire75;
  wire [(3'h5):(1'h0)] wire74;
  wire signed [(5'h11):(1'h0)] wire72;
  wire signed [(4'h8):(1'h0)] wire33;
  wire [(4'hb):(1'h0)] wire32;
  wire [(4'h8):(1'h0)] wire31;
  wire signed [(5'h11):(1'h0)] wire30;
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg37 = (1'h0);
  reg [(3'h5):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg39 = (1'h0);
  reg [(4'h8):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg [(5'h10):(1'h0)] reg46 = (1'h0);
  reg [(5'h14):(1'h0)] reg47 = (1'h0);
  reg [(2'h2):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(5'h12):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg54 = (1'h0);
  reg [(4'hf):(1'h0)] reg55 = (1'h0);
  reg [(3'h4):(1'h0)] reg56 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire72,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 (1'h0)};
  assign wire30 = (wire27[(4'hd):(4'hc)] ? (8'ha0) : (8'hac));
  assign wire31 = $signed($unsigned((8'hac)));
  assign wire32 = ($signed($signed(wire27[(4'hf):(3'h5)])) ?
                      $unsigned((wire30 ?
                          ((wire26 ~^ wire31) > wire30) : ($unsigned(wire28) >>> $unsigned(wire27)))) : ({({wire26} ?
                              (8'hba) : (wire26 ? wire26 : wire29)),
                          $signed(wire27)} != wire26));
  assign wire33 = $signed($unsigned(wire27));
  always
    @(posedge clk) begin
      if (wire29[(3'h7):(2'h3)])
        begin
          reg34 <= (^$unsigned(($signed((~wire28)) ?
              ((wire33 ? (8'hba) : wire32) | wire29) : ({wire32,
                  wire26} > $unsigned(wire30)))));
          if ($signed((|$unsigned(((!wire28) <= $signed(wire33))))))
            begin
              reg35 <= (8'hba);
              reg36 <= $unsigned($signed((&(~(reg34 >>> wire32)))));
              reg37 <= wire32[(2'h3):(1'h0)];
              reg38 <= {((((wire28 ?
                          reg36 : reg34) | wire29[(4'h8):(2'h2)]) <<< wire32) ?
                      ($signed((wire33 + wire29)) ?
                          (^$signed(reg37)) : ((&wire33) + (!reg37))) : (~^(wire28[(4'he):(3'h5)] ^~ {wire32,
                          wire26}))),
                  $unsigned(wire26[(3'h5):(2'h2)])};
              reg39 <= (!(wire31[(3'h7):(3'h4)] ?
                  $unsigned({(wire33 ? wire26 : reg37),
                      (~^wire32)}) : $signed(wire33)));
            end
          else
            begin
              reg35 <= (wire31 || $unsigned(({(8'hba),
                  $unsigned(wire26)} * $signed((~^(8'haf))))));
              reg36 <= ((($signed(wire32[(4'h9):(3'h5)]) ?
                      reg37[(1'h0):(1'h0)] : (-wire31[(3'h7):(3'h6)])) < (8'ha8)) ?
                  (^~(&(wire27[(5'h11):(3'h6)] ^ (~|reg39)))) : {$unsigned(($unsigned(reg39) << (~&reg39)))});
              reg37 <= wire31[(4'h8):(2'h3)];
            end
          if (reg37)
            begin
              reg40 <= wire27[(4'hc):(3'h6)];
              reg41 <= {($signed({wire27[(4'hd):(3'h4)],
                      (reg36 ~^ reg34)}) && (~|($unsigned(wire29) & $signed(wire29))))};
              reg42 <= $unsigned($signed(((~|(wire31 < wire31)) <<< wire32[(3'h4):(1'h0)])));
              reg43 <= reg34;
            end
          else
            begin
              reg40 <= (+reg36);
              reg41 <= (($signed($signed((reg43 << reg34))) == (wire27[(3'h5):(3'h5)] ?
                      reg35[(1'h0):(1'h0)] : ($unsigned(reg34) >> (wire27 >>> reg35)))) ?
                  (reg36 * $signed((reg37 ?
                      (wire26 ?
                          reg42 : wire28) : (8'haa)))) : $unsigned({(~&reg42)}));
              reg42 <= reg42[(1'h1):(1'h1)];
            end
          reg44 <= wire28[(5'h10):(1'h0)];
          reg45 <= (8'ha8);
        end
      else
        begin
          if (reg40[(3'h7):(1'h1)])
            begin
              reg34 <= $unsigned((^~{reg40, {$signed((8'hb9)), reg42}}));
              reg35 <= wire30;
              reg36 <= reg35;
              reg37 <= ($signed($signed($unsigned(reg39))) > (^$unsigned($signed((reg44 < reg35)))));
            end
          else
            begin
              reg34 <= (&{$unsigned((^(reg39 ? (8'had) : reg34))),
                  (-reg39[(4'h8):(4'h8)])});
            end
          reg38 <= (^~(~|$signed((reg39 ? (+reg44) : wire27))));
          reg39 <= $unsigned(wire33);
          reg40 <= (8'hb8);
        end
      reg46 <= $unsigned($unsigned({((wire29 ? (8'hb6) : reg35) ?
              reg40 : (reg43 ? reg38 : wire29))}));
      reg47 <= $signed((&$signed(($unsigned(reg38) ?
          reg36 : $unsigned(reg42)))));
      if (reg35[(1'h0):(1'h0)])
        begin
          reg48 <= wire27[(5'h12):(2'h2)];
          reg49 <= (8'hb2);
          reg50 <= (^reg41);
          if ((reg42[(1'h0):(1'h0)] ?
              $signed((((~^reg43) ^~ (wire30 ^~ reg37)) ?
                  ($signed(wire30) ?
                      (wire32 ?
                          reg43 : reg46) : $unsigned(wire31)) : wire32)) : wire32))
            begin
              reg51 <= (reg45[(3'h6):(2'h3)] >= reg47);
              reg52 <= ($signed($unsigned($unsigned(wire32[(1'h1):(1'h0)]))) ?
                  reg35 : reg50);
              reg53 <= ($unsigned($signed(((wire26 <<< reg46) && reg37[(2'h3):(2'h2)]))) << $signed($signed(((wire26 ?
                      reg38 : reg42) ?
                  $signed(wire29) : $unsigned(reg39)))));
              reg54 <= ($signed(($unsigned((reg44 ? wire33 : reg37)) ?
                  reg36 : reg41)) < (~^(((reg47 >= (8'ha5)) ?
                      $signed((8'ha1)) : reg43[(3'h4):(1'h1)]) ?
                  $signed(reg48) : reg34)));
              reg55 <= {$signed({((^wire33) ? {reg42} : (reg35 <<< reg40)),
                      $unsigned(reg44)}),
                  reg40};
            end
          else
            begin
              reg51 <= (8'had);
            end
          reg56 <= {(~reg41), reg55[(4'hb):(3'h6)]};
        end
      else
        begin
          reg48 <= $unsigned($signed((8'hb9)));
        end
    end
  module57 #() modinst73 (.wire60(wire27), .wire62(reg51), .wire59(reg47), .wire58(wire29), .clk(clk), .wire61(reg34), .y(wire72));
  assign wire74 = (&(($signed((reg56 & wire32)) ?
                      reg45 : ($signed(reg38) ?
                          $unsigned(wire28) : (reg52 <= wire33))) == {reg55[(4'ha):(1'h0)]}));
  assign wire75 = {wire72[(3'h7):(1'h1)],
                      $unsigned((((wire74 ?
                              reg46 : reg42) << wire33[(1'h0):(1'h0)]) ?
                          (7'h42) : $signed($signed(wire26))))};
  assign wire76 = reg50[(1'h1):(1'h0)];
  assign wire77 = reg49[(3'h7):(2'h3)];
  assign wire78 = wire30[(4'ha):(2'h2)];
  assign wire79 = (((reg38 != (8'h9c)) ?
                          ($unsigned({reg41}) ?
                              {reg40[(2'h2):(1'h1)],
                                  (wire32 || reg55)} : reg44[(1'h1):(1'h1)]) : (!(&(reg47 && reg52)))) ?
                      (reg36[(3'h5):(1'h0)] ?
                          (|reg41[(2'h2):(1'h1)]) : (reg35[(1'h1):(1'h0)] ?
                              ($unsigned(reg42) ?
                                  $signed(wire74) : $signed(reg43)) : reg34[(3'h7):(3'h4)])) : $signed(($unsigned($unsigned(reg52)) ?
                          $signed($signed(reg48)) : (|(^~(8'hb9))))));
  assign wire80 = $unsigned((8'h9d));
  assign wire81 = $signed(wire72);
  assign wire82 = $signed(($signed({(~wire30)}) ?
                      (((^wire31) ?
                          $unsigned(reg54) : (~|(8'hba))) < reg53) : reg48[(1'h0):(1'h0)]));
  assign wire83 = {wire32};
endmodule

module module57
#(parameter param71 = ((((^((8'hb2) ? (8'hb7) : (7'h43))) * ((8'hae) ? (~&(7'h41)) : ((8'hba) ? (8'ha6) : (8'h9e)))) <= {(~&(-(8'hb9)))}) ~^ ({((!(8'ha4)) ? {(8'ha1), (8'ha5)} : ((8'haf) == (8'hac))), (^~{(8'hb1), (8'hba)})} ? ((((8'ha0) ? (8'ha8) : (8'h9e)) ? ((8'hb2) ? (8'ha5) : (8'hb2)) : {(8'had)}) >= {(|(8'hb1))}) : (7'h42))))
(y, clk, wire62, wire61, wire60, wire59, wire58);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire62;
  input wire signed [(4'h8):(1'h0)] wire61;
  input wire [(3'h4):(1'h0)] wire60;
  input wire [(3'h6):(1'h0)] wire59;
  input wire [(5'h13):(1'h0)] wire58;
  wire [(4'hd):(1'h0)] wire70;
  wire signed [(5'h10):(1'h0)] wire69;
  wire signed [(4'hd):(1'h0)] wire68;
  wire [(5'h14):(1'h0)] wire67;
  wire [(5'h10):(1'h0)] wire66;
  wire signed [(5'h13):(1'h0)] wire65;
  wire signed [(3'h6):(1'h0)] wire63;
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire63,
                 reg64,
                 (1'h0)};
  assign wire63 = wire59[(3'h6):(3'h4)];
  always
    @(posedge clk) begin
      reg64 <= wire63[(1'h1):(1'h0)];
    end
  assign wire65 = $signed(((8'ha7) ?
                      $unsigned((+wire60[(1'h0):(1'h0)])) : $signed(((~|(8'ha9)) == (|wire58)))));
  assign wire66 = wire63;
  assign wire67 = wire65;
  assign wire68 = $unsigned((!(8'hb6)));
  assign wire69 = wire66;
  assign wire70 = wire59[(2'h3):(2'h3)];
endmodule
