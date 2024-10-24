module top
#(parameter param58 = (~&(+{((~&(8'hb2)) <<< (!(8'hab))), (~&((8'ha4) && (8'hb6)))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h270):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire57;
  wire [(3'h5):(1'h0)] wire56;
  wire signed [(5'h10):(1'h0)] wire54;
  wire signed [(4'hb):(1'h0)] wire53;
  wire [(3'h7):(1'h0)] wire52;
  wire [(5'h12):(1'h0)] wire51;
  wire [(4'h8):(1'h0)] wire50;
  wire signed [(4'hf):(1'h0)] wire49;
  wire signed [(5'h11):(1'h0)] wire30;
  wire [(5'h11):(1'h0)] wire29;
  wire signed [(4'hd):(1'h0)] wire28;
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg48 = (1'h0);
  reg [(5'h12):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg44 = (1'h0);
  reg [(3'h7):(1'h0)] reg43 = (1'h0);
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg36 = (1'h0);
  reg [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg6 = (1'h0);
  reg [(4'h9):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg4 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire30,
                 wire29,
                 wire28,
                 reg55,
                 reg48,
                 reg47,
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
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
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
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire1[(3'h7):(3'h4)])
        begin
          reg4 <= (-(+wire1[(4'hd):(3'h6)]));
          if ((((8'hbf) & $signed(($unsigned(wire1) ?
                  wire3 : wire0[(4'he):(3'h5)]))) ?
              (reg4 ?
                  $signed($unsigned((reg4 ?
                      (8'ha7) : wire1))) : (-wire2)) : wire1))
            begin
              reg5 <= {$unsigned(((wire2 ?
                      (wire3 != wire2) : (reg4 <= reg4)) || (wire0[(3'h7):(3'h7)] ?
                      (wire0 ? wire3 : (8'hbd)) : {wire2, wire2})))};
              reg6 <= ((&$unsigned(wire2)) > ($signed((|((7'h43) ?
                      wire2 : wire1))) ?
                  $signed(wire1[(1'h1):(1'h1)]) : $unsigned((~&(&wire1)))));
              reg7 <= ((wire2[(1'h0):(1'h0)] << (({reg4} >>> $unsigned((8'hb1))) ?
                      $signed(wire0[(2'h3):(1'h1)]) : (reg5[(1'h1):(1'h0)] ?
                          $unsigned(reg6) : reg6[(4'hb):(1'h0)]))) ?
                  $signed($unsigned((|$signed(wire3)))) : ({wire2[(4'hb):(1'h0)],
                      (wire1 ?
                          (8'haf) : $unsigned(reg5))} <<< {($signed((8'hba)) ?
                          $signed(wire1) : (wire1 ? wire2 : wire2)),
                      (-(wire0 && reg6))}));
              reg8 <= $unsigned(wire3[(4'hd):(4'hb)]);
            end
          else
            begin
              reg5 <= (~|$signed($unsigned((^reg6[(4'h8):(4'h8)]))));
              reg6 <= $signed((($signed((wire2 >= reg8)) >= (!(-reg5))) && $signed(reg8[(3'h4):(1'h1)])));
              reg7 <= (^$unsigned({wire3, ((wire2 && (7'h43)) <= reg8)}));
            end
        end
      else
        begin
          reg4 <= (wire0[(4'hf):(3'h6)] ? reg8 : reg4);
          if ($signed($signed($unsigned(reg5[(1'h0):(1'h0)]))))
            begin
              reg5 <= reg5[(1'h0):(1'h0)];
              reg6 <= reg6[(4'h9):(4'h8)];
            end
          else
            begin
              reg5 <= $unsigned(reg7);
              reg6 <= (8'h9c);
              reg7 <= $signed((8'haf));
              reg8 <= {wire3};
              reg9 <= (wire0[(4'ha):(1'h0)] << (reg4 ?
                  wire0 : ($signed((reg6 != wire2)) ?
                      ((reg8 ? reg8 : wire0) ?
                          (~&reg4) : (wire3 * wire0)) : reg4)));
            end
          reg10 <= reg8;
          reg11 <= reg4[(2'h3):(1'h1)];
          if ($unsigned($unsigned($unsigned(reg7))))
            begin
              reg12 <= $signed($unsigned(reg10));
              reg13 <= $signed({reg11});
              reg14 <= reg8[(3'h7):(2'h3)];
              reg15 <= ((reg8 ? wire2 : reg13) ^ (reg14[(3'h7):(2'h3)] ?
                  (^($signed(reg6) ?
                      reg10[(1'h1):(1'h0)] : (^reg9))) : reg12[(1'h1):(1'h0)]));
              reg16 <= (~&(reg8[(1'h1):(1'h1)] ?
                  {reg12[(3'h7):(2'h2)]} : (reg9 ?
                      {reg9[(1'h0):(1'h0)], (reg6 ? reg13 : reg13)} : {wire1,
                          $signed(reg5)})));
            end
          else
            begin
              reg12 <= ($unsigned((((reg13 >>> (8'h9e)) ?
                          (~^reg9) : (~|reg14)) ?
                      ($unsigned(reg7) ?
                          (reg6 ? reg9 : reg7) : {reg15,
                              reg6}) : (((8'hb6) >= reg13) ?
                          reg7 : $signed(reg13)))) ?
                  (~&{{reg6[(2'h2):(1'h1)]}, $unsigned((8'ha1))}) : (reg5 ?
                      ((-(&reg8)) < (!(reg16 >>> reg9))) : (+((reg5 ?
                          wire2 : (8'ha3)) || (reg14 != reg7)))));
              reg13 <= reg8;
              reg14 <= ($signed((((reg11 >>> reg4) ?
                      $signed(reg8) : $unsigned(reg8)) ?
                  ((&wire1) ?
                      $unsigned((8'hbf)) : $unsigned(wire3)) : reg8)) | ($unsigned(reg14[(4'hd):(1'h0)]) ?
                  $unsigned(((reg8 ? reg13 : reg10) ?
                      (wire0 ?
                          (8'hb1) : reg5) : $signed(reg10))) : reg10[(2'h3):(1'h0)]));
              reg15 <= $unsigned((+(({reg8, reg8} <<< $signed(reg15)) ?
                  (~|((8'hb6) < reg13)) : (~&$signed((8'hae))))));
            end
        end
      if ($signed($unsigned($unsigned((7'h40)))))
        begin
          reg17 <= (8'ha7);
          if ($unsigned(($unsigned(($signed(reg15) ^ $signed((7'h43)))) ^~ reg10[(3'h5):(1'h1)])))
            begin
              reg18 <= $unsigned((8'haf));
              reg19 <= reg11;
              reg20 <= $signed(reg10[(1'h0):(1'h0)]);
              reg21 <= (-($signed(reg12[(1'h1):(1'h0)]) ~^ ((~&$unsigned(reg9)) ?
                  ($unsigned(reg14) >= $signed((7'h41))) : wire1[(3'h6):(3'h4)])));
            end
          else
            begin
              reg18 <= (^~(reg18 ? $unsigned(reg18) : reg11));
            end
        end
      else
        begin
          reg17 <= wire1;
          reg18 <= {wire1};
          reg19 <= $signed(reg5[(3'h6):(1'h1)]);
          reg20 <= {$unsigned((|$unsigned((~|reg12)))), reg19};
          if (((~^$unsigned((^reg20))) ^~ (reg20 ?
              (({reg9, (8'hb6)} | reg9) ?
                  reg13[(3'h5):(3'h4)] : wire1[(3'h5):(3'h5)]) : (($signed((7'h41)) ?
                      (reg15 <<< reg6) : (reg11 ~^ (8'h9e))) ?
                  ($signed(reg19) && reg11) : $signed((8'hb9))))))
            begin
              reg21 <= $signed({{$signed((reg21 ? reg10 : reg11))},
                  (reg21 ?
                      ((reg20 == reg15) >> (!wire3)) : (reg7 ?
                          {reg13} : reg13))});
              reg22 <= reg13;
              reg23 <= {(-reg11)};
              reg24 <= reg9;
            end
          else
            begin
              reg21 <= (reg24 ?
                  (^~reg9) : $unsigned({reg5[(2'h3):(2'h3)],
                      ($signed(reg4) != (reg16 <= reg17))}));
              reg22 <= (8'hbf);
              reg23 <= $signed((reg20[(5'h13):(5'h10)] ?
                  reg9[(3'h4):(2'h3)] : $signed($unsigned(reg9[(4'ha):(4'h8)]))));
              reg24 <= (8'h9f);
            end
        end
      reg25 <= (~^$unsigned($unsigned(reg9)));
      reg26 <= $signed({$signed(({reg16, (8'hbe)} ?
              (^wire1) : (reg25 ^ reg11)))});
      reg27 <= ($signed(($unsigned((~^reg6)) ^ ((reg5 * reg13) ?
          (+reg25) : $signed(wire3)))) - (reg19[(4'ha):(1'h1)] ?
          {$unsigned($signed(reg17))} : (~reg20)));
    end
  assign wire28 = $signed(wire0);
  assign wire29 = reg8;
  assign wire30 = reg17[(4'hd):(2'h3)];
  always
    @(posedge clk) begin
      reg31 <= $unsigned(reg17);
      if ((reg10[(1'h0):(1'h0)] ? reg24 : reg8[(3'h7):(3'h5)]))
        begin
          reg32 <= ($unsigned(reg9) || $unsigned($unsigned(((~|reg23) << (reg10 * reg23)))));
        end
      else
        begin
          if ((reg9[(4'hd):(4'hc)] <= $signed((reg21 || (~^(wire30 ?
              wire28 : reg20))))))
            begin
              reg32 <= reg12;
              reg33 <= ($unsigned((~^$signed(reg8))) == $unsigned($signed(((~&(8'haa)) ?
                  ((8'hbb) ? reg15 : reg6) : reg12))));
              reg34 <= reg4[(1'h1):(1'h0)];
              reg35 <= {$unsigned((&reg7[(1'h1):(1'h1)]))};
              reg36 <= ((($unsigned($signed(reg14)) ?
                          (reg26[(3'h6):(1'h0)] ?
                              (~|reg11) : reg22[(1'h1):(1'h1)]) : (reg18 ?
                              (reg14 > reg27) : {reg7})) ?
                      reg15 : (8'ha6)) ?
                  (reg23 * (^~(^(reg24 << wire30)))) : {reg21});
            end
          else
            begin
              reg32 <= (reg12 ?
                  (reg12 - reg4[(1'h1):(1'h1)]) : $signed($unsigned((reg19[(4'ha):(2'h2)] ?
                      $unsigned((8'ha1)) : (reg35 ^~ reg23)))));
              reg33 <= (~|(((~^wire0[(4'h8):(1'h1)]) ~^ $unsigned(reg17[(4'h9):(2'h2)])) ?
                  $unsigned(((reg33 ? (8'h9e) : (8'h9f)) ?
                      reg27 : (reg24 * reg4))) : reg18));
            end
          reg37 <= ({({(~&reg20)} ?
                  wire28[(3'h7):(3'h5)] : reg19[(1'h1):(1'h1)])} * $signed((reg9[(3'h6):(3'h6)] ?
              ((reg12 - reg14) ?
                  (reg23 || reg11) : $signed(reg36)) : ({wire0} <= {reg13,
                  reg10}))));
          if (reg31[(4'ha):(4'ha)])
            begin
              reg38 <= wire3[(4'hd):(4'hd)];
              reg39 <= $unsigned($unsigned({$signed($signed(wire0))}));
              reg40 <= $signed($signed((~&$signed(((7'h43) ?
                  (7'h40) : reg31)))));
            end
          else
            begin
              reg38 <= ($signed(reg32) + wire3);
              reg39 <= $unsigned(reg36);
            end
          reg41 <= reg32[(1'h0):(1'h0)];
          if ((^~($unsigned($signed((~|reg35))) <= {((reg27 ?
                  wire3 : reg14) >= (reg24 > reg14)),
              {reg7[(1'h0):(1'h0)], ((8'hbd) <<< (8'hba))}})))
            begin
              reg42 <= wire28;
              reg43 <= (^~reg23);
              reg44 <= {$unsigned(reg13), (~&{wire1[(5'h13):(5'h10)], reg27})};
              reg45 <= ((({$signed(reg37),
                  $unsigned(reg44)} * (~&(wire3 << reg23))) || reg23) > (($signed((&reg17)) && reg20) ?
                  ({$signed(wire29), $unsigned(reg18)} ?
                      $signed((reg13 ?
                          reg14 : reg34)) : reg42) : (+$signed($signed(reg10)))));
            end
          else
            begin
              reg42 <= ($signed((&($unsigned(reg11) ?
                  reg7[(1'h0):(1'h0)] : reg42[(1'h0):(1'h0)]))) * $unsigned((reg21[(2'h3):(1'h1)] >= reg38)));
              reg43 <= ($unsigned(((|reg45[(2'h3):(2'h3)]) ?
                      reg14[(5'h10):(4'hd)] : reg37)) ?
                  reg40 : $unsigned(reg27[(4'he):(3'h4)]));
              reg44 <= (wire30[(2'h3):(1'h0)] << $signed((reg44 ?
                  ($unsigned(reg5) - (~&(8'ha7))) : {$unsigned(wire2),
                      (wire0 & reg11)})));
              reg45 <= $unsigned($unsigned(reg27));
              reg46 <= wire3[(2'h2):(1'h0)];
            end
        end
      reg47 <= reg44;
      reg48 <= (^~(reg24 ?
          reg8 : (~^(reg24[(4'h8):(2'h3)] ?
              {(8'hb3), reg40} : (reg27 <<< reg44)))));
    end
  assign wire49 = (|(~^reg26));
  assign wire50 = reg32;
  assign wire51 = {wire29};
  assign wire52 = $signed((~^wire3[(2'h2):(2'h2)]));
  assign wire53 = reg38;
  assign wire54 = reg38[(3'h7):(3'h6)];
  always
    @(posedge clk) begin
      reg55 <= wire29;
    end
  assign wire56 = (reg16[(1'h0):(1'h0)] ?
                      $unsigned((+((8'hae) ?
                          (reg41 << reg15) : {reg37}))) : {($unsigned($signed((7'h40))) ?
                              ((^~reg44) <<< $unsigned(reg15)) : (-(&wire0))),
                          (|(+(&(8'hb4))))});
  assign wire57 = reg21[(2'h3):(1'h1)];
endmodule
