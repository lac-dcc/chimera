module top
#(parameter param71 = {(~&(((^(8'ha2)) ? {(8'haf), (8'ha4)} : ((8'h9f) >> (8'h9e))) + (~&((8'haa) <<< (8'ha6)))))}, 
parameter param72 = ((param71 >= (((param71 ? param71 : param71) | (param71 & param71)) ^ (~&{param71}))) ? param71 : param71))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h121):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire21;
  wire signed [(4'he):(1'h0)] wire22;
  wire signed [(3'h6):(1'h0)] wire23;
  wire [(4'hc):(1'h0)] wire24;
  wire signed [(4'hf):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire69;
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  assign y = {wire5,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire69,
                 reg6,
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
                 (1'h0)};
  assign wire5 = {(({$unsigned((8'hb1))} ?
                         ($signed((8'haf)) << $signed((8'h9f))) : wire1) <= (wire0 && ((+wire3) * wire2[(1'h0):(1'h0)])))};
  always
    @(posedge clk) begin
      reg6 <= wire3;
      if ($signed((~^$unsigned($signed((wire2 ^ wire1))))))
        begin
          if (($signed($unsigned((~^{wire4,
              wire4}))) < $signed(($unsigned($signed(wire5)) ~^ ((^~wire2) ?
              wire2[(3'h5):(2'h3)] : wire2)))))
            begin
              reg7 <= wire1;
              reg8 <= reg6;
              reg9 <= ((wire3[(2'h2):(1'h1)] ?
                      $unsigned((~^reg8)) : (!{wire4[(4'h9):(2'h2)]})) ?
                  wire5 : {$unsigned(($unsigned(wire5) > (reg6 ?
                          reg7 : (8'haa)))),
                      $signed(wire3[(1'h0):(1'h0)])});
              reg10 <= ($signed((&wire0)) ?
                  $signed(($signed((~|wire2)) >>> $signed(((8'hb7) ?
                      reg7 : wire4)))) : reg9);
            end
          else
            begin
              reg7 <= reg8[(1'h0):(1'h0)];
              reg8 <= ($signed({(wire3[(1'h1):(1'h0)] * $unsigned(wire4)),
                      reg6[(4'ha):(4'ha)]}) ?
                  wire1 : reg6);
              reg9 <= {$unsigned(wire4[(5'h15):(5'h10)]),
                  (^(^reg9[(1'h1):(1'h0)]))};
              reg10 <= (wire3[(1'h0):(1'h0)] ?
                  reg10[(4'hc):(2'h3)] : $signed((~^$unsigned((wire1 || (8'hbf))))));
              reg11 <= wire3[(1'h0):(1'h0)];
            end
          reg12 <= wire5[(4'hf):(4'he)];
          reg13 <= {((({wire2, reg7} ? (reg6 & reg7) : {reg11}) ^ (reg12 ?
                  (^~reg7) : (wire3 ? reg9 : wire3))) && reg9[(2'h3):(2'h2)])};
          if ({wire1[(5'h11):(4'hb)]})
            begin
              reg14 <= (~|(($signed($unsigned(reg10)) ~^ reg6[(4'h8):(3'h4)]) <<< {$unsigned(wire0[(4'hf):(4'h8)]),
                  (wire4[(4'h8):(3'h6)] + $unsigned((7'h44)))}));
            end
          else
            begin
              reg14 <= (((~((wire5 ? wire5 : (8'ha6)) ?
                  wire2 : (~|wire5))) + wire4) << (!$unsigned((8'hb0))));
            end
          if (reg10)
            begin
              reg15 <= (reg13[(1'h0):(1'h0)] ? reg11 : $signed(reg6));
              reg16 <= (8'hb3);
              reg17 <= wire1;
              reg18 <= (~&reg11[(2'h3):(2'h3)]);
              reg19 <= ({wire2} ?
                  (+($unsigned((reg6 ? reg15 : reg14)) ?
                      reg10[(4'hd):(4'h8)] : (reg12 << (reg17 || reg14)))) : reg9[(1'h0):(1'h0)]);
            end
          else
            begin
              reg15 <= wire5[(4'h9):(3'h7)];
              reg16 <= $signed($unsigned(wire1[(2'h2):(1'h0)]));
            end
        end
      else
        begin
          reg7 <= (8'ha1);
          reg8 <= ((reg11 ^ $unsigned(reg16)) ?
              reg13 : $unsigned($unsigned((^reg12))));
          reg9 <= ($unsigned(({$signed(reg15), $unsigned(reg14)} ^~ reg6)) ?
              reg17[(3'h7):(1'h0)] : reg12[(3'h4):(2'h2)]);
          reg10 <= $signed(reg12[(3'h6):(3'h6)]);
        end
      reg20 <= reg19[(4'h9):(3'h4)];
    end
  assign wire21 = reg18;
  assign wire22 = {wire3[(2'h2):(1'h1)], reg12};
  assign wire23 = wire2[(4'h8):(3'h4)];
  assign wire24 = $signed(wire4);
  assign wire25 = (+($unsigned($signed((wire24 ? reg14 : (8'h9c)))) || (reg8 ?
                      ((~|wire0) && $signed(wire24)) : {reg17[(3'h5):(1'h0)]})));
  module26 #() modinst70 (.wire29(reg8), .clk(clk), .y(wire69), .wire27(wire21), .wire30(reg11), .wire28(reg10));
endmodule

module module26
#(parameter param68 = ((((|(+(8'hac))) ? (8'ha5) : (((8'ha2) ^~ (8'hae)) == {(8'ha6)})) + (+{(!(8'ha7))})) * (((((8'hb3) || (7'h40)) ? ((7'h42) & (8'hb6)) : {(8'ha3), (8'had)}) >> (!(~|(8'hb5)))) ? ((+{(8'ha1), (8'hab)}) ^ (((8'hb7) && (8'hac)) ? ((8'h9f) ? (7'h41) : (8'h9c)) : (+(8'hb5)))) : (^~((~(8'h9d)) ^ (+(8'hbc)))))))
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h1c0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire30;
  input wire [(5'h10):(1'h0)] wire29;
  input wire signed [(4'ha):(1'h0)] wire28;
  input wire signed [(4'hb):(1'h0)] wire27;
  wire signed [(5'h13):(1'h0)] wire67;
  wire signed [(2'h3):(1'h0)] wire51;
  wire [(4'ha):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire49;
  wire [(4'ha):(1'h0)] wire48;
  wire [(3'h6):(1'h0)] wire47;
  wire signed [(5'h14):(1'h0)] wire46;
  wire [(3'h5):(1'h0)] wire45;
  wire signed [(4'he):(1'h0)] wire44;
  wire [(3'h6):(1'h0)] wire43;
  reg signed [(5'h15):(1'h0)] reg66 = (1'h0);
  reg [(3'h6):(1'h0)] reg65 = (1'h0);
  reg [(4'hf):(1'h0)] reg64 = (1'h0);
  reg [(5'h14):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg60 = (1'h0);
  reg [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg56 = (1'h0);
  reg [(4'ha):(1'h0)] reg55 = (1'h0);
  reg [(4'hf):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg52 = (1'h0);
  reg [(4'h8):(1'h0)] reg42 = (1'h0);
  reg [(4'hf):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  assign y = {wire67,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
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
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg31 <= (({$signed($unsigned(wire29))} ?
              ((&$unsigned(wire27)) ?
                  (~((8'hbb) & wire29)) : wire29[(2'h2):(2'h2)]) : (-{(wire27 && (7'h42))})) ?
          (wire29[(3'h7):(2'h2)] + (+(wire30[(4'hb):(4'h8)] ?
              $signed(wire30) : $signed(wire30)))) : ($signed($signed(((8'hba) ?
              wire28 : wire27))) <= (|$unsigned((wire27 ? wire29 : wire30)))));
      if ((~|(wire30 | $unsigned(($unsigned(wire29) ^ {wire28})))))
        begin
          reg32 <= reg31;
          if ($unsigned(({{{wire29, reg31}, $unsigned((8'hb6))}, reg32} ?
              wire28 : wire29[(3'h4):(2'h2)])))
            begin
              reg33 <= ($unsigned(wire29) ?
                  (^~reg32) : (wire27[(4'h9):(3'h4)] ?
                      reg32[(2'h3):(2'h3)] : (~$signed((^~wire28)))));
              reg34 <= (wire27 ?
                  (wire29 ~^ $unsigned((!(reg31 ? reg32 : reg31)))) : wire27);
              reg35 <= (wire28[(4'h8):(2'h2)] <= (+(~|{{reg31},
                  (reg33 ? wire30 : (8'hbc))})));
              reg36 <= reg33;
              reg37 <= $signed(($unsigned((+((7'h41) ? (8'hba) : reg33))) ?
                  (^~reg32[(3'h6):(1'h1)]) : reg31));
            end
          else
            begin
              reg33 <= $unsigned(wire28);
            end
          reg38 <= reg36;
          reg39 <= $unsigned((({$unsigned(reg31), (wire28 | reg32)} ?
                  $unsigned((reg37 ?
                      reg38 : reg34)) : $signed($signed(reg35))) ?
              {(8'ha3)} : {{reg36, (reg33 ? wire29 : reg35)},
                  $unsigned($unsigned(wire29))}));
          reg40 <= {((~^(+$unsigned(reg38))) ? reg38 : reg32), reg37};
        end
      else
        begin
          if ((+reg34[(3'h5):(2'h2)]))
            begin
              reg32 <= $signed({reg36, (8'hb4)});
              reg33 <= $signed(reg33[(4'h8):(3'h6)]);
              reg34 <= reg39;
              reg35 <= reg40[(2'h3):(2'h3)];
            end
          else
            begin
              reg32 <= $signed(wire29);
              reg33 <= $unsigned(reg33[(5'h10):(2'h2)]);
              reg34 <= (((wire28 <= wire30) * {$unsigned(reg40),
                      (+reg36[(4'hb):(3'h4)])}) ?
                  (reg31[(3'h5):(2'h2)] ?
                      wire30 : reg39[(4'hf):(4'h9)]) : (((wire28 == wire28[(3'h6):(2'h2)]) >> $signed(reg34[(4'ha):(3'h6)])) ^ (!(8'hbf))));
            end
        end
      reg41 <= reg39[(4'h9):(3'h5)];
      reg42 <= reg41;
    end
  assign wire43 = reg36;
  assign wire44 = {$signed((reg38 ? $unsigned((|reg35)) : reg40)),
                      reg37[(3'h6):(3'h6)]};
  assign wire45 = (8'ha0);
  assign wire46 = (~^(&$unsigned($signed((~&(8'ha0))))));
  assign wire47 = wire43;
  assign wire48 = (+(^{(^~reg36)}));
  assign wire49 = {{{reg37, {$unsigned((8'hbe))}},
                          ($unsigned((^wire47)) ?
                              $signed(wire44[(1'h1):(1'h1)]) : (reg31[(3'h4):(3'h4)] | (reg41 ?
                                  wire28 : reg32)))},
                      wire30};
  assign wire50 = {(reg42 ?
                          ($unsigned(((8'h9c) ? wire48 : reg38)) ?
                              $signed((wire28 ?
                                  reg33 : reg36)) : ($signed(reg40) ?
                                  {wire46} : (reg32 ?
                                      reg42 : (8'hb5)))) : (8'hac)),
                      wire28};
  assign wire51 = wire29[(3'h6):(3'h6)];
  always
    @(posedge clk) begin
      reg52 <= $signed((-(~$signed($signed(wire48)))));
      reg53 <= ({{(wire30 ? (reg38 & wire44) : $unsigned(reg52))}} ?
          (reg33 ?
              reg34[(2'h2):(2'h2)] : ($unsigned((wire50 <= (8'hb8))) < $signed((reg32 ?
                  wire43 : wire51)))) : (-(wire47 <<< ((^~wire51) ?
              (wire44 ? wire51 : reg31) : wire50[(1'h1):(1'h0)]))));
      if (((^~(^~(~^reg36[(2'h3):(2'h3)]))) ?
          $signed((-(!{(8'hbc)}))) : (reg34[(5'h14):(4'hc)] ?
              wire50 : wire51[(2'h2):(1'h1)])))
        begin
          reg54 <= {($unsigned((^wire48)) ?
                  $signed($signed(reg40[(3'h7):(1'h1)])) : (!(^$signed(reg36)))),
              (&{wire48, ({wire44, reg42} ? (8'ha6) : $unsigned(wire29))})};
          reg55 <= ((8'hb9) ? reg41[(4'hf):(4'h9)] : $signed((8'hb6)));
          if ({reg33[(4'he):(4'ha)]})
            begin
              reg56 <= $signed($signed($unsigned((reg38 ?
                  $unsigned(reg36) : wire45))));
              reg57 <= ((wire49[(4'h9):(4'h9)] ?
                  $unsigned((wire27 | (reg54 - wire29))) : (&$unsigned((wire50 ~^ reg40)))) ~^ {(reg55[(2'h3):(1'h1)] ?
                      wire49 : (&(!reg40)))});
              reg58 <= {reg40};
            end
          else
            begin
              reg56 <= (!($signed(reg56[(1'h0):(1'h0)]) ?
                  $unsigned((!reg36)) : $signed($signed({(8'ha2), wire51}))));
              reg57 <= $unsigned((~^$signed((~&$unsigned(wire28)))));
              reg58 <= $unsigned(wire30[(1'h0):(1'h0)]);
              reg59 <= ($unsigned(wire46) ?
                  (wire27[(4'h8):(1'h0)] || {reg40}) : reg33[(3'h5):(1'h0)]);
              reg60 <= $unsigned($signed((~|($unsigned(reg37) || $signed(reg31)))));
            end
          if ((-reg59))
            begin
              reg61 <= (+(8'ha7));
              reg62 <= ($signed({$unsigned(wire30),
                      $unsigned($unsigned(reg40))}) ?
                  $signed($signed({$unsigned(wire30)})) : (8'hbe));
              reg63 <= ((-reg54) ?
                  (((wire46[(5'h12):(3'h4)] ?
                      {wire48,
                          (8'ha3)} : reg35) << (reg34[(5'h11):(1'h1)] <= wire30[(1'h1):(1'h0)])) >>> {reg39[(1'h1):(1'h1)]}) : wire30);
            end
          else
            begin
              reg61 <= reg42;
            end
          reg64 <= (($unsigned(wire43[(1'h0):(1'h0)]) > (($unsigned(reg56) ?
                  (wire46 == wire30) : (|reg40)) ?
              reg57 : ($unsigned(reg38) <<< $unsigned(wire44)))) + $signed($signed((-(wire30 ?
              reg52 : wire27)))));
        end
      else
        begin
          if ($signed((+$unsigned($signed((~reg62))))))
            begin
              reg54 <= (+(-(($unsigned(reg62) ?
                  $signed(reg31) : {reg59,
                      reg41}) >= $unsigned((wire48 - reg62)))));
            end
          else
            begin
              reg54 <= (|reg57[(3'h4):(1'h0)]);
              reg55 <= $unsigned((((!(wire51 | reg59)) > {reg42[(4'h8):(1'h0)],
                  reg54[(4'hc):(3'h4)]}) ~^ ((~|(reg52 && (8'haa))) && reg59[(1'h1):(1'h1)])));
              reg56 <= $unsigned((reg63[(5'h10):(4'h8)] ?
                  (|$signed(wire44[(4'hb):(4'hb)])) : ($unsigned(((8'ha7) == reg61)) ?
                      ((wire27 - wire48) < ((8'hb3) ?
                          wire49 : (8'hab))) : $unsigned(reg36))));
              reg57 <= reg54;
            end
          reg58 <= $unsigned(reg61[(3'h5):(1'h1)]);
          reg59 <= reg40[(1'h1):(1'h1)];
        end
      reg65 <= ((8'hbf) <= $unsigned(reg55));
      if (reg54)
        begin
          reg66 <= reg36[(3'h4):(2'h3)];
        end
      else
        begin
          reg66 <= wire45[(1'h1):(1'h0)];
        end
    end
  assign wire67 = $unsigned(($unsigned(wire50[(1'h0):(1'h0)]) ?
                      (8'hb2) : reg39));
endmodule
