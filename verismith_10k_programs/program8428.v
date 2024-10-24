module top
#(parameter param105 = (((((~(8'hbd)) >>> (^(8'hbb))) ? (~&((8'hae) | (8'haf))) : (~&((8'ha2) ? (8'hb6) : (8'hb6)))) ? (((~&(8'ha3)) ? ((8'hbb) ? (8'hae) : (8'ha4)) : ((8'hb1) == (8'ha4))) > {(^~(8'ha4))}) : (((~^(8'haf)) ? ((7'h41) ? (8'ha1) : (8'h9e)) : (8'h9c)) ? (((7'h40) ? (8'hb8) : (7'h42)) ? ((7'h42) >> (8'had)) : ((8'ha3) >= (8'hb1))) : ((~|(8'hb3)) * ((8'ha3) ? (8'ha4) : (8'haa))))) != (~^((~^(&(8'had))) | (~((8'hb7) ^ (8'hb6)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h17d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire104;
  wire [(2'h2):(1'h0)] wire103;
  wire signed [(4'ha):(1'h0)] wire102;
  wire signed [(5'h14):(1'h0)] wire101;
  wire [(4'he):(1'h0)] wire100;
  wire signed [(3'h4):(1'h0)] wire99;
  wire signed [(4'hd):(1'h0)] wire98;
  wire [(5'h15):(1'h0)] wire97;
  wire signed [(4'hb):(1'h0)] wire96;
  wire signed [(3'h5):(1'h0)] wire95;
  wire [(5'h14):(1'h0)] wire82;
  wire signed [(3'h7):(1'h0)] wire22;
  wire signed [(2'h2):(1'h0)] wire21;
  wire signed [(3'h6):(1'h0)] wire20;
  wire [(4'ha):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire4;
  wire [(4'hb):(1'h0)] wire93;
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire82,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire6,
                 wire5,
                 wire4,
                 wire93,
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
                 (1'h0)};
  assign wire4 = (-{($signed($unsigned((8'ha3))) >= $unsigned($unsigned(wire2))),
                     (&((wire2 ? wire0 : wire3) + wire2))});
  assign wire5 = $unsigned($signed(wire2[(4'hb):(3'h6)]));
  assign wire6 = ((^{wire1[(3'h5):(2'h3)], wire2[(3'h7):(3'h4)]}) ?
                     $unsigned(wire0) : wire4[(4'h8):(4'h8)]);
  always
    @(posedge clk) begin
      if ((^~wire4))
        begin
          reg7 <= (($unsigned((!(!wire3))) ?
                  (wire4[(1'h1):(1'h1)] > ((8'ha4) ?
                      wire5[(1'h1):(1'h0)] : (8'ha0))) : (wire0[(2'h2):(1'h0)] ?
                      wire0 : {wire6, (wire1 ? wire6 : wire0)})) ?
              (~((|(wire1 >>> wire6)) ?
                  wire0[(1'h0):(1'h0)] : ($unsigned(wire2) ~^ (wire4 ?
                      wire3 : wire5)))) : $signed($unsigned(((&wire6) ?
                  $signed(wire0) : wire6[(1'h1):(1'h1)]))));
        end
      else
        begin
          reg7 <= wire6;
        end
      reg8 <= (&wire1);
      if ({reg8})
        begin
          reg9 <= reg7;
        end
      else
        begin
          reg9 <= ({(7'h43), wire2[(4'ha):(2'h2)]} <<< wire4[(4'hb):(3'h5)]);
          reg10 <= (((|((&(8'hb2)) ?
                  (reg8 ?
                      reg9 : reg8) : wire0[(3'h4):(3'h4)])) - $unsigned((~(wire3 >> wire2)))) ?
              wire5 : $signed($unsigned(wire6[(3'h5):(3'h5)])));
          reg11 <= reg7;
          if ({(8'hb3),
              $signed(((&$unsigned(wire3)) ?
                  ((wire1 >> reg10) >> (wire5 >= wire5)) : (reg7 ?
                      (wire2 && wire3) : ((8'hb9) ? wire5 : wire2))))})
            begin
              reg12 <= (reg10 ?
                  {((~|(^reg7)) ? (^~(~|reg10)) : $signed((wire3 > wire4))),
                      wire4} : (reg9[(3'h6):(3'h5)] != $unsigned((wire3[(5'h10):(3'h6)] >> $signed(reg9)))));
              reg13 <= ((!reg11) >> $signed((~|reg12)));
              reg14 <= reg13;
              reg15 <= reg9[(4'h9):(1'h1)];
            end
          else
            begin
              reg12 <= {$unsigned((~|((wire6 ? wire5 : (8'ha7)) >> {reg8,
                      (8'hb2)}))),
                  (+(wire1[(4'hd):(4'h8)] ^~ {(+(8'hbd)), $signed(reg8)}))};
              reg13 <= {{reg7[(4'ha):(2'h3)],
                      ({$signed(wire6)} == $signed((wire0 && (8'hb8))))}};
              reg14 <= $signed(reg9);
              reg15 <= $unsigned(reg14[(5'h13):(3'h4)]);
              reg16 <= $unsigned(((reg7 ?
                      reg12[(3'h6):(3'h5)] : (((8'ha5) ? reg12 : reg12) ?
                          (wire5 ^~ reg7) : (wire1 ? wire5 : wire4))) ?
                  reg10 : (^~wire4[(3'h6):(1'h0)])));
            end
        end
      reg17 <= reg8[(4'ha):(4'h9)];
      reg18 <= ((wire4[(3'h5):(3'h4)] >= (reg9[(5'h10):(4'h9)] <= ((&wire5) ?
          $signed((8'hb6)) : wire6))) <<< {({{wire3, wire3}} >> wire1)});
    end
  assign wire19 = $unsigned($unsigned({$unsigned(reg13[(4'ha):(1'h1)]),
                      (~^(reg13 ? wire2 : wire6))}));
  assign wire20 = (($signed($signed(reg18[(4'h8):(2'h2)])) ?
                      (~^reg11) : (((wire0 > (8'ha8)) ?
                          (reg14 ? wire1 : reg15) : (reg9 ?
                              wire1 : (7'h42))) >>> reg12[(3'h7):(2'h2)])) + $unsigned($unsigned(wire0[(1'h1):(1'h1)])));
  assign wire21 = (8'ha5);
  assign wire22 = $unsigned($unsigned(wire3));
  module23 #() modinst83 (wire82, clk, reg12, reg16, wire1, reg13);
  module84 #() modinst94 (wire93, clk, reg8, reg14, reg17, wire6);
  assign wire95 = (-$unsigned($signed(((~&(7'h43)) ?
                      $signed(wire1) : (reg12 - reg9)))));
  assign wire96 = $signed((wire82[(4'h9):(1'h1)] && reg8[(1'h1):(1'h1)]));
  assign wire97 = wire3[(3'h4):(2'h2)];
  assign wire98 = (^({((wire22 >= reg13) || reg14[(5'h12):(4'hf)]),
                          ((reg18 ? wire82 : reg13) ?
                              (wire96 ? reg11 : wire95) : {wire21})} ?
                      (8'hba) : reg12));
  assign wire99 = ((^{$signed($unsigned(reg16))}) ?
                      ($unsigned(({wire4} ?
                              $signed(wire6) : $unsigned(wire0))) ?
                          wire2 : {((!(8'hba)) ?
                                  $unsigned(reg12) : (reg15 ? reg18 : reg13)),
                              $unsigned(wire21)}) : (7'h40));
  assign wire100 = reg18;
  assign wire101 = $unsigned($unsigned((wire96[(2'h3):(1'h0)] ?
                       {(wire1 ? reg13 : (8'hb9)),
                           $signed(wire19)} : (reg15 >> ((8'haa) - wire4)))));
  assign wire102 = wire3;
  assign wire103 = (wire95 ?
                       (reg11 ?
                           $unsigned(wire95) : ((^(wire1 >> wire96)) ?
                               (8'hb8) : wire101)) : wire5[(1'h0):(1'h0)]);
  assign wire104 = (!$signed($unsigned($unsigned($signed((7'h42))))));
endmodule

module module84  (y, clk, wire88, wire87, wire86, wire85);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire88;
  input wire [(4'hb):(1'h0)] wire87;
  input wire [(5'h11):(1'h0)] wire86;
  input wire [(3'h5):(1'h0)] wire85;
  wire [(4'ha):(1'h0)] wire92;
  wire signed [(4'ha):(1'h0)] wire91;
  wire [(5'h13):(1'h0)] wire90;
  wire [(5'h12):(1'h0)] wire89;
  assign y = {wire92, wire91, wire90, wire89, (1'h0)};
  assign wire89 = (wire86[(2'h3):(2'h2)] <<< wire85);
  assign wire90 = ($signed({wire86[(3'h6):(1'h0)], wire87}) ?
                      wire87 : (^{wire88[(4'hf):(4'h8)]}));
  assign wire91 = (^{(!(wire87[(3'h6):(1'h0)] ?
                          $signed(wire89) : $unsigned((8'hbc))))});
  assign wire92 = wire89;
endmodule

module module23
#(parameter param81 = (^{(&({(8'hb6), (8'hb6)} < (&(8'hb0)))), ((((7'h44) ~^ (8'hbb)) ? ((7'h43) > (8'hbd)) : (^(8'haf))) >= (((8'hbe) <= (8'ha4)) ? ((7'h40) != (8'h9d)) : ((8'hbc) == (8'ha5))))}))
(y, clk, wire24, wire25, wire26, wire27);
  output wire [(32'h12f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire24;
  input wire [(3'h4):(1'h0)] wire25;
  input wire [(5'h15):(1'h0)] wire26;
  input wire [(3'h5):(1'h0)] wire27;
  wire signed [(4'hb):(1'h0)] wire77;
  wire signed [(5'h10):(1'h0)] wire76;
  wire signed [(5'h12):(1'h0)] wire75;
  wire [(4'he):(1'h0)] wire74;
  wire signed [(3'h7):(1'h0)] wire73;
  wire [(4'hb):(1'h0)] wire72;
  wire signed [(5'h11):(1'h0)] wire71;
  wire [(4'hc):(1'h0)] wire69;
  wire [(4'hb):(1'h0)] wire68;
  wire [(4'ha):(1'h0)] wire67;
  wire [(4'hb):(1'h0)] wire66;
  wire [(4'h9):(1'h0)] wire65;
  wire [(4'hf):(1'h0)] wire64;
  wire [(4'ha):(1'h0)] wire63;
  wire signed [(4'he):(1'h0)] wire28;
  wire [(5'h13):(1'h0)] wire29;
  wire [(5'h15):(1'h0)] wire30;
  wire [(5'h12):(1'h0)] wire31;
  wire [(5'h10):(1'h0)] wire61;
  reg signed [(3'h6):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg79 = (1'h0);
  reg [(4'h9):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg70 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire61,
                 reg80,
                 reg79,
                 reg78,
                 reg70,
                 (1'h0)};
  assign wire28 = wire25[(3'h4):(3'h4)];
  assign wire29 = wire25[(2'h2):(2'h2)];
  assign wire30 = wire29[(5'h12):(5'h10)];
  assign wire31 = (({(wire27[(2'h3):(1'h1)] ?
                                  (~wire25) : (wire29 << (8'hb8)))} ?
                          $unsigned($signed((wire29 ?
                              wire26 : wire24))) : $unsigned(((wire26 ?
                              wire29 : wire25) < (wire28 ?
                              (7'h42) : wire24)))) ?
                      (|wire28[(3'h4):(2'h2)]) : $signed($signed(((wire24 ?
                              wire29 : wire26) ?
                          wire26 : (wire28 ? wire29 : wire27)))));
  module32 #() modinst62 (.wire33(wire29), .wire36(wire24), .wire37(wire28), .wire34(wire26), .wire35(wire30), .clk(clk), .y(wire61));
  assign wire63 = $unsigned({(~^(((8'hb3) * wire25) ?
                          (~|wire31) : $signed((8'hb0)))),
                      wire31});
  assign wire64 = {wire25};
  assign wire65 = $signed(wire63[(2'h2):(2'h2)]);
  assign wire66 = $unsigned(wire25[(3'h4):(2'h3)]);
  assign wire67 = ((wire25 - wire27[(1'h1):(1'h0)]) < wire64);
  assign wire68 = (|(~|({wire63[(3'h4):(1'h0)]} ~^ wire31)));
  assign wire69 = wire29[(4'h9):(2'h3)];
  always
    @(posedge clk) begin
      reg70 <= $unsigned($unsigned(((~&wire68) == $unsigned(wire64))));
    end
  assign wire71 = $signed({$unsigned(((wire61 - wire63) ?
                          (wire66 <= wire63) : ((8'ha5) ?
                              (8'hb9) : (7'h43))))});
  assign wire72 = (!$unsigned($unsigned({(^~(8'hb1)), wire25[(1'h0):(1'h0)]})));
  assign wire73 = (~^wire24);
  assign wire74 = ((8'haa) << (^~{(wire64[(2'h3):(1'h1)] == (wire68 ?
                          wire24 : wire31)),
                      ($unsigned(wire73) ?
                          (wire25 ? wire24 : wire69) : wire31)}));
  assign wire75 = (^~({(~&{wire66})} & wire24[(4'ha):(4'h9)]));
  assign wire76 = (~&wire27[(2'h3):(1'h0)]);
  assign wire77 = ($signed((wire73[(3'h6):(1'h1)] ?
                      wire76[(4'hd):(4'hb)] : $signed(wire75[(4'h9):(4'h9)]))) | (!wire31[(4'hc):(4'h9)]));
  always
    @(posedge clk) begin
      reg78 <= $signed(((~{(wire73 & wire30),
          $unsigned(wire24)}) == $signed($signed((wire29 && wire25)))));
      reg79 <= $signed(wire30);
      reg80 <= (~&$unsigned(wire66[(1'h1):(1'h0)]));
    end
endmodule

module module32  (y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'hf7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire37;
  input wire signed [(5'h10):(1'h0)] wire36;
  input wire signed [(5'h15):(1'h0)] wire35;
  input wire signed [(5'h15):(1'h0)] wire34;
  input wire signed [(3'h6):(1'h0)] wire33;
  wire signed [(5'h10):(1'h0)] wire60;
  wire [(3'h4):(1'h0)] wire59;
  wire signed [(2'h3):(1'h0)] wire58;
  wire signed [(3'h7):(1'h0)] wire57;
  wire [(4'h8):(1'h0)] wire56;
  wire signed [(3'h7):(1'h0)] wire41;
  wire [(5'h11):(1'h0)] wire40;
  wire [(2'h3):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire38;
  reg [(4'hd):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg54 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg53 = (1'h0);
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(3'h4):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg48 = (1'h0);
  reg [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg46 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(5'h12):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
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
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire38 = wire37[(2'h2):(1'h1)];
  assign wire39 = (wire33[(3'h5):(2'h2)] >>> $signed((~|$unsigned(wire35))));
  assign wire40 = (~(^wire38));
  assign wire41 = $signed($unsigned($signed($signed($signed(wire40)))));
  always
    @(posedge clk) begin
      if (((&$signed($unsigned(wire34))) ?
          $signed(({$unsigned(wire41),
              wire34[(5'h12):(4'h9)]} <= wire36)) : ($signed(wire37[(3'h5):(1'h0)]) ?
              $unsigned($signed($unsigned(wire34))) : (8'hbf))))
        begin
          reg42 <= {({wire33[(2'h3):(2'h2)],
                      (wire40[(2'h3):(2'h2)] ?
                          (^~wire37) : wire38[(1'h1):(1'h1)])} ?
                  $unsigned((^~(^~wire37))) : $unsigned(((wire37 ?
                      wire41 : wire36) || (wire37 ? wire39 : wire37)))),
              $unsigned($unsigned((~wire35)))};
          reg43 <= (((~^($unsigned(wire33) & $unsigned(wire35))) ?
              $signed(wire36[(4'he):(3'h6)]) : ((wire33[(2'h3):(1'h0)] | wire37) ^~ $signed((wire38 ?
                  wire38 : wire34)))) <= wire35);
        end
      else
        begin
          if (wire36)
            begin
              reg42 <= ((($unsigned((^~wire38)) ~^ $unsigned(wire41[(2'h3):(2'h3)])) ?
                      $signed({$unsigned(reg42)}) : $unsigned((reg43 < wire38[(3'h6):(2'h2)]))) ?
                  (~$signed((|$signed(wire41)))) : (reg43[(5'h12):(3'h5)] ?
                      ((~|(^wire37)) + {$signed(reg42)}) : (7'h44)));
              reg43 <= reg43[(5'h12):(4'ha)];
              reg44 <= wire35[(5'h14):(4'hf)];
            end
          else
            begin
              reg42 <= $signed((!$signed(($unsigned((8'ha9)) > (reg42 ?
                  (7'h41) : (8'h9c))))));
              reg43 <= $signed((~|$unsigned((~(~^reg43)))));
              reg44 <= wire39[(1'h0):(1'h0)];
              reg45 <= wire38;
              reg46 <= (+($unsigned(($unsigned(wire41) ?
                  $signed((8'hb5)) : wire39[(1'h0):(1'h0)])) - $signed(wire35)));
            end
          reg47 <= ($unsigned({(~^(+reg45))}) ?
              $signed(wire36) : ($unsigned(((~|(8'hb9)) ?
                  wire36[(3'h5):(1'h0)] : (wire35 ~^ reg45))) & reg44));
          if (wire36)
            begin
              reg48 <= wire34;
              reg49 <= $unsigned($signed(($unsigned((~^wire41)) ?
                  ((wire37 ?
                      wire37 : (8'h9d)) >>> reg46[(2'h2):(1'h0)]) : reg43[(5'h13):(4'h8)])));
              reg50 <= $signed((((8'hac) < ((reg42 ? (8'hb2) : wire41) ?
                      (wire39 && wire33) : (reg45 ? wire41 : wire35))) ?
                  (($unsigned(reg45) >>> wire33[(2'h2):(1'h0)]) ^~ wire38) : wire41));
              reg51 <= ((~|((~(reg43 ?
                      wire37 : reg49)) >>> $signed((~reg49)))) ?
                  wire36 : ((^wire38) & wire41[(2'h2):(1'h1)]));
              reg52 <= wire35;
            end
          else
            begin
              reg48 <= ((~&$unsigned(($signed(wire34) <<< wire41[(3'h7):(1'h1)]))) >>> (~&(~^$unsigned((wire41 < wire38)))));
              reg49 <= (!(^~((wire37 ^ $signed(reg50)) ?
                  (^~wire33) : (|reg48))));
            end
          if ($signed((wire33[(1'h1):(1'h1)] ?
              {$unsigned(((8'hbc) ? reg46 : reg46)),
                  (|(reg51 ?
                      reg42 : reg42))} : ($unsigned(reg49[(1'h0):(1'h0)]) ?
                  reg48[(4'hd):(4'h9)] : wire41[(2'h3):(2'h3)]))))
            begin
              reg53 <= reg51;
            end
          else
            begin
              reg53 <= {(wire33 && (~|$signed((wire39 >= reg45))))};
              reg54 <= (({wire34} < (!$signed((^reg50)))) ?
                  (|wire36[(3'h6):(1'h0)]) : (reg46[(3'h6):(2'h3)] <<< {(~|(~|reg51))}));
              reg55 <= (reg54[(2'h2):(2'h2)] ?
                  $unsigned(((reg46 ? {(8'hae)} : (wire40 ~^ reg50)) ?
                      (+wire34) : ((reg48 ? reg45 : reg53) ?
                          (wire41 ?
                              (8'ha9) : wire34) : wire35[(5'h11):(4'ha)]))) : (^~wire41[(2'h3):(1'h0)]));
            end
        end
    end
  assign wire56 = ((!($unsigned((wire41 ?
                      reg53 : reg50)) >>> $unsigned((!reg45)))) > (wire41[(3'h5):(3'h4)] + reg42));
  assign wire57 = reg42;
  assign wire58 = {($signed($signed((8'h9c))) ?
                          $signed(wire35) : ((-reg45) != $unsigned(((8'had) ?
                              reg48 : reg46)))),
                      ((~^$unsigned($unsigned(reg48))) ?
                          $unsigned($signed($unsigned(reg55))) : reg43[(5'h11):(4'hf)])};
  assign wire59 = wire38[(1'h0):(1'h0)];
  assign wire60 = (~$signed($unsigned($signed((8'hae)))));
endmodule
