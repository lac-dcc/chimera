module top
#(parameter param87 = ((~|(8'hb6)) ? (^~(((|(8'ha6)) >= ((8'ha6) ? (8'h9d) : (8'hb1))) & ((+(8'hb1)) + ((8'ha6) ? (8'hb8) : (8'hb9))))) : ((~(~((8'hbd) ? (8'hae) : (8'ha5)))) > ((((8'ha3) ? (8'ha0) : (8'h9c)) <<< ((8'hb0) ^ (8'hbd))) & ((7'h42) >> ((8'hb1) + (8'hb3)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1f7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire86;
  wire [(5'h14):(1'h0)] wire85;
  wire signed [(5'h13):(1'h0)] wire84;
  wire [(4'hb):(1'h0)] wire83;
  wire signed [(4'hb):(1'h0)] wire82;
  wire [(5'h14):(1'h0)] wire81;
  wire signed [(2'h3):(1'h0)] wire79;
  wire [(2'h3):(1'h0)] wire45;
  wire signed [(3'h5):(1'h0)] wire33;
  wire signed [(4'he):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire31;
  wire signed [(3'h7):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire29;
  wire [(5'h12):(1'h0)] wire28;
  wire [(3'h6):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  reg signed [(4'hc):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg [(3'h4):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(4'hb):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg37 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg44 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire79,
                 wire45,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire6,
                 wire5,
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
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
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
                 (1'h0)};
  assign wire5 = ((!$signed($signed({wire3}))) != ($unsigned({(^~wire3),
                         (wire4 ? (8'hab) : wire4)}) ?
                     ($unsigned((8'hb2)) ?
                         (7'h42) : (~^(8'ha1))) : $unsigned({(&wire2)})));
  assign wire6 = wire0;
  always
    @(posedge clk) begin
      reg7 <= {wire4};
      if ((8'hbe))
        begin
          reg8 <= ($unsigned({wire6, $signed((wire0 ? (8'hb4) : wire3))}) ?
              $signed(wire0) : {(wire2 ?
                      wire1[(3'h5):(2'h2)] : $unsigned((~&wire2)))});
          if (($unsigned(((~^$unsigned(wire3)) >> {$signed(wire4),
              (wire4 < (7'h42))})) & (~|(+(!((8'ha4) ? wire5 : wire5))))))
            begin
              reg9 <= (wire0 ?
                  $signed({(((8'hbd) <= wire2) ? wire5 : wire2[(3'h7):(3'h6)]),
                      ((+(8'ha5)) ?
                          wire6[(3'h4):(1'h1)] : $signed(wire5))}) : (wire3[(5'h12):(3'h7)] & {((wire5 | wire2) ?
                          wire0[(3'h5):(3'h4)] : (wire4 ? wire0 : wire2))}));
              reg10 <= $unsigned($unsigned(((~&$unsigned(wire0)) ?
                  (-(~^wire6)) : reg8[(1'h0):(1'h0)])));
              reg11 <= $unsigned($signed($signed($unsigned((reg7 && (7'h43))))));
            end
          else
            begin
              reg9 <= ($unsigned((8'ha0)) && {((wire6 >> $unsigned(wire3)) ?
                      wire4[(4'ha):(4'h8)] : $signed((wire2 ? reg9 : wire3))),
                  {(^$signed(reg10))}});
              reg10 <= ($signed((((|wire1) ? (^~reg11) : (^~wire3)) ?
                      ($signed(reg9) ?
                          (8'hb8) : $unsigned(wire1)) : $signed((reg8 ^~ wire1)))) ?
                  (+reg10) : (~|($signed({reg11}) ? reg9 : $signed(reg8))));
              reg11 <= reg10;
              reg12 <= (~|((~|$signed(((8'ha9) ?
                  (8'hbe) : reg11))) <<< $signed((&reg10[(3'h4):(1'h1)]))));
              reg13 <= wire3;
            end
          reg14 <= $unsigned(($signed({reg7[(4'hb):(4'h8)]}) ?
              (($signed(reg12) ? $unsigned(wire3) : $signed(reg10)) ?
                  (wire4[(3'h7):(3'h4)] >> wire0[(3'h4):(2'h3)]) : $unsigned((wire6 - reg8))) : ($unsigned($unsigned(wire6)) >> $unsigned(reg11[(2'h3):(1'h0)]))));
        end
      else
        begin
          reg8 <= $unsigned(wire2[(3'h5):(1'h1)]);
          reg9 <= {$signed(reg10), reg14};
          reg10 <= {wire5, {reg13[(4'h9):(1'h0)]}};
          reg11 <= $signed(($signed(($signed((8'hbd)) << (~reg11))) >> $unsigned($signed({reg11,
              reg8}))));
          if ($unsigned($signed(reg10[(3'h6):(2'h2)])))
            begin
              reg12 <= (reg7[(3'h5):(3'h5)] ?
                  $signed(reg13[(2'h2):(2'h2)]) : (|wire0));
              reg13 <= ($unsigned($unsigned(((wire4 ?
                      wire2 : (8'hb2)) << reg11[(1'h0):(1'h0)]))) ?
                  ((&reg14[(1'h0):(1'h0)]) ?
                      wire2[(2'h3):(2'h2)] : ((&$unsigned(wire0)) ?
                          (~$signed(reg8)) : $unsigned($unsigned(reg13)))) : $unsigned((~&(reg14[(3'h6):(1'h1)] <<< (reg8 - wire6)))));
            end
          else
            begin
              reg12 <= ((wire6 ?
                      {$unsigned(reg9[(3'h4):(2'h3)])} : $unsigned({$unsigned(reg10),
                          (8'hb9)})) ?
                  wire3[(3'h7):(2'h3)] : $signed(wire6[(1'h0):(1'h0)]));
              reg13 <= $unsigned((~&(~reg13)));
              reg14 <= ($unsigned($unsigned($signed(reg13))) | (((reg8 ^ ((8'hae) ?
                      wire6 : wire4)) ^ {(reg12 ? reg9 : reg10), (-reg12)}) ?
                  $unsigned((reg9 <<< $unsigned(reg10))) : wire3[(5'h10):(5'h10)]));
              reg15 <= ((&reg13) <<< $signed(reg11[(3'h4):(3'h4)]));
            end
        end
      reg16 <= ((^~reg10[(3'h7):(1'h0)]) + ($unsigned(reg9[(4'h9):(1'h1)]) ?
          $unsigned((8'ha1)) : (reg13 == reg8[(2'h2):(2'h2)])));
      if (wire5)
        begin
          reg17 <= (|wire5);
          reg18 <= $signed(wire4);
        end
      else
        begin
          reg17 <= {wire1};
          reg18 <= $signed(((($signed((8'ha7)) ?
              $unsigned(wire0) : reg10) >= reg9[(4'h9):(3'h4)]) ^ (reg14[(3'h5):(3'h5)] ?
              (~(wire2 | (8'ha7))) : $signed(wire3[(5'h13):(3'h6)]))));
          reg19 <= reg9[(2'h3):(2'h2)];
        end
      if (({$signed(wire0)} ?
          ((($unsigned(reg9) ^ (~^reg15)) ?
              wire3[(2'h3):(1'h1)] : (!{wire3, reg8})) + (8'hae)) : (^reg7)))
        begin
          if (wire0[(2'h3):(2'h3)])
            begin
              reg20 <= $signed(($unsigned(reg16) ?
                  (($unsigned(reg14) << $signed(reg16)) ^~ {$signed(reg7)}) : wire1[(1'h0):(1'h0)]));
            end
          else
            begin
              reg20 <= ((~^$unsigned(((reg8 << reg18) ?
                  wire5 : (reg18 << reg13)))) | {(((wire5 | wire4) ?
                      $unsigned(wire1) : $signed(reg11)) ^~ reg10),
                  wire0[(2'h2):(2'h2)]});
              reg21 <= $unsigned($unsigned(((^(reg7 ?
                  reg14 : reg10)) <<< reg14)));
              reg22 <= $unsigned($unsigned($signed((-(^reg18)))));
            end
          if ($signed($signed((8'hb3))))
            begin
              reg23 <= (reg10 < $unsigned($unsigned(((wire3 ?
                  wire2 : reg8) - reg22))));
              reg24 <= ((wire4[(4'hd):(3'h5)] ?
                      ($signed({reg9}) * ($unsigned(reg12) ?
                          (-reg17) : wire6)) : $unsigned(reg10)) ?
                  (^reg13[(4'h8):(3'h6)]) : $unsigned(((~^(7'h42)) ?
                      $unsigned($unsigned((8'ha4))) : (~^(reg12 || reg22)))));
            end
          else
            begin
              reg23 <= reg7;
              reg24 <= $signed(reg15);
              reg25 <= (((&(~reg13)) >>> reg16) && reg8);
              reg26 <= $unsigned(((~^(reg11[(1'h0):(1'h0)] ?
                      (|reg18) : (reg14 ? reg24 : reg7))) ?
                  {reg16} : $signed(reg19[(1'h1):(1'h0)])));
            end
          reg27 <= $signed($unsigned((8'hbd)));
        end
      else
        begin
          if ($unsigned($signed(reg12)))
            begin
              reg20 <= ($unsigned($unsigned((8'had))) != ((reg11 == (8'hb4)) ?
                  (~|((~&reg26) ?
                      (reg10 ?
                          (8'hae) : reg10) : reg20)) : reg23[(3'h4):(1'h0)]));
              reg21 <= $unsigned((((|wire0) >= ((8'h9d) ?
                      (reg9 ? wire6 : reg13) : (^~reg15))) ?
                  {reg11} : ((reg21[(4'hc):(3'h6)] << reg7[(3'h7):(1'h1)]) >> (|(^~reg13)))));
              reg22 <= reg23[(3'h4):(3'h4)];
            end
          else
            begin
              reg20 <= reg8[(1'h1):(1'h0)];
              reg21 <= reg21;
              reg22 <= (!reg27);
            end
          reg23 <= {(&({$signed(reg24),
                  $signed(reg18)} >> $signed((reg17 < reg8)))),
              $signed($signed((+$signed(reg18))))};
          reg24 <= ((8'hb5) ?
              $unsigned({(^(^reg25))}) : ({wire3[(4'h9):(2'h3)],
                      $unsigned(reg19)} ?
                  reg14[(1'h0):(1'h0)] : reg26[(3'h7):(3'h6)]));
        end
    end
  assign wire28 = reg26;
  assign wire29 = (($signed($unsigned(((8'ha8) != reg24))) ?
                      (~&($unsigned(reg15) * $unsigned(reg18))) : ({reg21,
                              reg7} ?
                          reg23[(1'h0):(1'h0)] : reg7)) * (^~(^~(&(+(8'hb5))))));
  assign wire30 = $unsigned(((reg8[(1'h0):(1'h0)] * {reg22,
                      reg9}) << (~&$unsigned($unsigned(reg8)))));
  assign wire31 = $signed((|($signed((~&reg18)) <= $signed((^~wire30)))));
  assign wire32 = (wire6 - ((^~(!wire31[(1'h0):(1'h0)])) ~^ {reg9[(4'h9):(1'h1)]}));
  assign wire33 = {reg21,
                      ((((~reg17) ? $signed(reg22) : wire0) ?
                          (~reg13) : $signed(wire3)) >= wire29[(3'h5):(2'h3)])};
  always
    @(posedge clk) begin
      reg34 <= (8'ha9);
      reg35 <= $signed($unsigned((8'hb9)));
      reg36 <= wire2[(3'h6):(1'h1)];
      if (((reg16 * {reg13, {(~&wire32)}}) ^~ wire30))
        begin
          reg37 <= ($signed(wire28) != {($unsigned(reg15) ?
                  ((~reg10) ?
                      $unsigned((8'ha5)) : (^(8'ha2))) : ($signed(reg22) ?
                      wire28[(4'hf):(4'hd)] : reg11)),
              (+$unsigned({reg34}))});
          reg38 <= (($unsigned($unsigned({reg14})) >= ($unsigned(((8'hbc) ?
                  reg15 : reg23)) <= reg14[(4'ha):(4'h9)])) ?
              $unsigned(reg11[(1'h1):(1'h0)]) : (^~$unsigned($unsigned((!wire29)))));
          reg39 <= reg34[(3'h6):(2'h2)];
          reg40 <= $unsigned((reg26 ?
              reg12[(4'ha):(3'h7)] : ((~(~&reg13)) - (~(reg21 >= wire1)))));
        end
      else
        begin
          if (reg13[(3'h6):(1'h1)])
            begin
              reg37 <= (&(($unsigned((~wire33)) >= (~&((8'h9f) ?
                      reg18 : reg12))) ?
                  reg21[(3'h5):(2'h2)] : (^~reg40[(3'h5):(3'h4)])));
              reg38 <= (8'ha9);
              reg39 <= reg26;
            end
          else
            begin
              reg37 <= $unsigned((|reg23[(2'h2):(1'h0)]));
              reg38 <= {$unsigned((((8'hb7) >= $signed(wire0)) <<< ($signed(wire5) ?
                      $signed(reg12) : wire5[(3'h6):(3'h5)])))};
              reg39 <= (($unsigned((((8'hba) ?
                      wire31 : reg19) | (reg17 > wire2))) ?
                  $unsigned(reg39[(1'h1):(1'h1)]) : ((~&(~&(7'h44))) ^ (wire29[(4'h8):(2'h3)] >= (wire6 != wire0)))) >= $unsigned(($unsigned(reg11[(1'h1):(1'h0)]) ?
                  $unsigned((wire32 >>> reg11)) : reg35)));
              reg40 <= $unsigned($signed($unsigned(((^reg27) ?
                  $unsigned(reg24) : (^~reg12)))));
            end
          reg41 <= reg34;
          reg42 <= ($signed(($unsigned(reg23) & $unsigned($unsigned(reg26)))) & reg20[(2'h2):(1'h1)]);
          reg43 <= wire28;
          reg44 <= reg39[(4'hc):(4'h9)];
        end
    end
  assign wire45 = $signed($unsigned(reg41[(1'h0):(1'h0)]));
  module46 #() modinst80 (.wire47(reg12), .wire48(reg39), .wire49(reg35), .wire50(reg34), .clk(clk), .wire51(reg40), .y(wire79));
  assign wire81 = $unsigned($signed(wire3));
  assign wire82 = $unsigned(({((~|reg43) ? wire29 : (~&reg9))} ?
                      {((reg13 != reg24) ? (^reg26) : (reg22 + reg8)),
                          $signed(reg42)} : (($signed(reg22) >> (8'h9d)) ?
                          $unsigned($signed(wire5)) : reg10[(1'h0):(1'h0)])));
  assign wire83 = (^~(~|$signed(wire33[(2'h3):(1'h1)])));
  assign wire84 = reg15[(4'hb):(2'h3)];
  assign wire85 = reg27[(4'hb):(4'h8)];
  assign wire86 = (($signed($unsigned((|wire1))) & reg23[(1'h0):(1'h0)]) >= $signed(wire5[(4'h8):(1'h0)]));
endmodule

module module46
#(parameter param78 = (8'hb0))
(y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'h118):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire51;
  input wire signed [(3'h7):(1'h0)] wire50;
  input wire [(3'h5):(1'h0)] wire49;
  input wire signed [(4'hd):(1'h0)] wire48;
  input wire [(4'h8):(1'h0)] wire47;
  wire signed [(4'he):(1'h0)] wire73;
  wire signed [(4'h9):(1'h0)] wire72;
  wire signed [(4'h9):(1'h0)] wire71;
  wire signed [(5'h14):(1'h0)] wire70;
  reg signed [(5'h10):(1'h0)] reg77 = (1'h0);
  reg [(3'h5):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg69 = (1'h0);
  reg [(3'h6):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg [(4'hf):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  reg [(4'h8):(1'h0)] reg60 = (1'h0);
  reg [(3'h6):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg [(5'h15):(1'h0)] reg57 = (1'h0);
  reg [(4'hb):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg55 = (1'h0);
  reg [(3'h5):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg52 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire70,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed(({({wire50} ? $signed(wire49) : wire49)} ?
          (!($unsigned(wire51) ?
              wire47[(1'h0):(1'h0)] : wire47[(4'h8):(3'h6)])) : ($signed(wire51) << (-(^(8'ha8)))))))
        begin
          reg52 <= (~|($unsigned($signed((wire47 ? wire50 : wire47))) ?
              $unsigned((wire50[(3'h5):(2'h3)] >> (^~wire50))) : (!wire49)));
          reg53 <= (wire48 + ({$signed({(8'hb4), reg52})} ?
              wire48[(4'hb):(4'h9)] : (($unsigned(wire48) | $unsigned(wire51)) ?
                  (8'haf) : ((wire49 ? wire47 : wire48) | $unsigned(wire49)))));
          reg54 <= {($unsigned(((!(8'hb4)) > $signed(wire51))) << $unsigned(wire48[(4'h9):(3'h7)])),
              wire50};
        end
      else
        begin
          reg52 <= wire50;
        end
      if (((~$unsigned($unsigned((~^wire47)))) ?
          $unsigned(reg53) : ((reg54[(2'h3):(2'h3)] ?
              $unsigned($unsigned(wire48)) : $signed(wire48[(4'h9):(1'h1)])) - wire49[(2'h2):(1'h0)])))
        begin
          reg55 <= wire51[(4'h9):(1'h1)];
          reg56 <= (+(+($unsigned($unsigned(reg55)) < reg52)));
          reg57 <= $unsigned($unsigned((($unsigned(reg53) ^~ (-reg55)) != ((-wire47) == wire50))));
          reg58 <= reg52[(2'h2):(1'h1)];
          reg59 <= (~(wire49[(1'h1):(1'h1)] - (($unsigned(wire47) ?
                  $signed(reg57) : (reg58 ? (8'hbc) : (8'had))) ?
              (&wire49[(2'h3):(2'h2)]) : $unsigned(wire49[(3'h4):(1'h1)]))));
        end
      else
        begin
          reg55 <= (+$signed(reg58[(5'h12):(1'h0)]));
          reg56 <= $signed(reg59);
          if (((~(~|reg59)) ?
              ({$unsigned(wire51)} ?
                  (~|(reg56 ?
                      {wire51,
                          reg58} : $unsigned(reg57))) : (~reg57[(4'hc):(4'ha)])) : $signed(((8'hbe) ?
                  (wire47 ? reg53 : (7'h42)) : ({reg59} <= reg56)))))
            begin
              reg57 <= $signed(wire49);
              reg58 <= reg52;
              reg59 <= $signed(($unsigned({(reg53 & (8'hb3)),
                  reg53[(1'h1):(1'h1)]}) * ((|(reg55 ^~ reg54)) >>> $signed((wire47 >>> (8'hb6))))));
              reg60 <= reg52[(2'h2):(2'h2)];
              reg61 <= $unsigned((~&wire48));
            end
          else
            begin
              reg57 <= reg57[(2'h3):(1'h1)];
              reg58 <= reg53[(2'h2):(1'h0)];
              reg59 <= $unsigned($signed((~(reg55 ? {(8'ha4)} : (&reg59)))));
            end
          if ((reg61 <= $unsigned((($signed(reg52) && wire51) ?
              (~|(reg59 | reg59)) : ((reg54 ?
                  wire47 : (8'ha5)) * (reg59 - reg53))))))
            begin
              reg62 <= reg60[(2'h3):(1'h1)];
              reg63 <= (($unsigned(($signed((8'hb3)) ?
                  (wire47 ?
                      reg52 : wire49) : {reg53})) & $signed((-$signed(reg58)))) << $unsigned((((reg62 ?
                      reg57 : reg62) >> {(8'ha8)}) ?
                  ((reg57 - wire50) && (reg61 ?
                      reg53 : (8'hbc))) : (~|$unsigned(reg54)))));
              reg64 <= reg53[(1'h1):(1'h1)];
            end
          else
            begin
              reg62 <= reg63[(4'h9):(3'h7)];
            end
          if (reg54[(1'h0):(1'h0)])
            begin
              reg65 <= (~^wire50);
              reg66 <= ($signed(reg60) ?
                  (reg59 ?
                      wire49[(1'h0):(1'h0)] : reg57[(3'h7):(3'h6)]) : (8'h9c));
              reg67 <= reg63[(4'hd):(4'h9)];
              reg68 <= reg58;
              reg69 <= {reg67[(5'h13):(1'h1)], reg68};
            end
          else
            begin
              reg65 <= (reg56 ?
                  (8'hbe) : $signed($unsigned($unsigned(reg60[(3'h7):(3'h6)]))));
            end
        end
    end
  assign wire70 = ((-$unsigned($signed($signed(reg69)))) ?
                      $signed((reg63 - reg61[(3'h4):(2'h2)])) : $signed((~|{(reg69 < reg62),
                          (reg67 ? wire49 : reg61)})));
  assign wire71 = reg62;
  assign wire72 = $signed(reg60);
  assign wire73 = ((+$unsigned(($unsigned(wire70) ?
                          reg62[(1'h1):(1'h1)] : (reg66 >> reg53)))) ?
                      (~(|((~wire71) ?
                          {(8'hb1)} : $signed(reg67)))) : (&reg61));
  always
    @(posedge clk) begin
      if ((^$unsigned({$unsigned($unsigned((8'hbe))),
          $unsigned(((8'hb3) ? wire48 : (8'ha9)))})))
        begin
          reg74 <= reg55;
          reg75 <= ((-reg59[(3'h6):(2'h2)]) & ((($signed(wire70) * $signed(wire48)) <= $signed(wire48)) ?
              $unsigned(($unsigned((8'h9c)) ?
                  (reg61 < wire51) : $unsigned(wire73))) : wire73[(4'ha):(2'h3)]));
          reg76 <= (~$signed((|reg52)));
        end
      else
        begin
          reg74 <= reg62[(4'hd):(4'hc)];
          reg75 <= (((-$signed(reg61)) <<< reg57[(4'hf):(1'h1)]) ?
              reg65 : $signed((~^reg66[(5'h10):(4'hc)])));
          reg76 <= reg55[(4'h8):(3'h4)];
          reg77 <= (($unsigned((|(~&(8'haf)))) ?
              (7'h42) : $unsigned((7'h42))) ^~ $unsigned((reg68 != wire70[(4'he):(2'h3)])));
        end
    end
endmodule
