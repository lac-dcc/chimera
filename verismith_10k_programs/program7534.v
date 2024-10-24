module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1c2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire39;
  wire [(4'he):(1'h0)] wire20;
  wire [(3'h4):(1'h0)] wire19;
  wire [(5'h10):(1'h0)] wire18;
  reg signed [(4'ha):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg37 = (1'h0);
  reg [(5'h15):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg33 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg [(2'h2):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(2'h3):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg5 = (1'h0);
  reg [(3'h7):(1'h0)] reg4 = (1'h0);
  assign y = {wire39,
                 wire20,
                 wire19,
                 wire18,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
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
      reg4 <= $unsigned((^wire3));
      if (wire0)
        begin
          reg5 <= (wire2 ?
              $unsigned(((8'hb2) ?
                  $unsigned(((8'hb7) - wire0)) : reg4)) : $unsigned((reg4[(1'h1):(1'h1)] ?
                  wire3 : reg4[(3'h6):(3'h4)])));
          reg6 <= wire0[(1'h0):(1'h0)];
          reg7 <= $unsigned(reg6);
          if (($unsigned((($unsigned(reg4) ^ reg7[(2'h3):(1'h1)]) + $signed((reg5 ^ wire2)))) ?
              (reg6[(3'h5):(2'h2)] + wire0) : wire3[(1'h0):(1'h0)]))
            begin
              reg8 <= wire1;
              reg9 <= reg5[(1'h1):(1'h1)];
              reg10 <= $signed($signed(wire2[(5'h10):(2'h3)]));
              reg11 <= ((&(|reg10)) ^ $unsigned($signed({(-reg5),
                  reg8[(2'h3):(1'h1)]})));
              reg12 <= (~^($unsigned(({reg10,
                  wire1} ^ $unsigned(reg11))) ^ ((~(wire1 ^ reg5)) ?
                  (reg5 >>> (-reg4)) : reg6[(4'h8):(1'h1)])));
            end
          else
            begin
              reg8 <= reg9;
              reg9 <= $signed({$signed(wire0[(3'h5):(3'h4)])});
              reg10 <= reg12[(2'h2):(1'h1)];
            end
          reg13 <= (!$signed(((|(wire1 == reg7)) ^~ ((wire0 ? wire3 : reg12) ?
              (reg11 != reg11) : reg5[(4'hc):(2'h3)]))));
        end
      else
        begin
          if (reg5[(4'hd):(1'h0)])
            begin
              reg5 <= {$signed((+wire1[(3'h5):(2'h3)])), reg5[(3'h7):(2'h3)]};
            end
          else
            begin
              reg5 <= $signed($unsigned({(!(reg8 >>> (8'h9c)))}));
              reg6 <= $signed(reg4[(3'h4):(2'h2)]);
            end
          if (({$unsigned(((reg13 ?
                  (8'ha4) : reg10) > (~&(8'hae))))} < wire3[(1'h0):(1'h0)]))
            begin
              reg7 <= (reg10[(4'hc):(4'h9)] ?
                  (^~$unsigned($unsigned(wire0))) : $unsigned(reg5[(4'h8):(3'h5)]));
              reg8 <= reg8[(3'h4):(2'h3)];
              reg9 <= $signed(($signed(reg13[(4'h9):(2'h3)]) < {(8'haf)}));
              reg10 <= $unsigned((!$unsigned($signed(reg10[(4'hc):(4'ha)]))));
              reg11 <= ((reg10[(1'h0):(1'h0)] - $unsigned(reg7)) > reg13);
            end
          else
            begin
              reg7 <= reg9[(3'h6):(3'h5)];
              reg8 <= (8'ha3);
              reg9 <= {$unsigned((8'hbe))};
            end
        end
      if ($unsigned(($unsigned({wire3}) ?
          $signed($signed(wire3[(2'h2):(1'h1)])) : $unsigned($unsigned({reg10})))))
        begin
          reg14 <= ((wire0 ?
              (($signed(reg6) & $signed((8'ha3))) ?
                  reg8 : wire0[(3'h4):(1'h0)]) : (^~(~|reg12))) != $signed(reg13));
          reg15 <= reg12;
        end
      else
        begin
          reg14 <= reg5;
        end
      reg16 <= {$signed(reg7[(1'h1):(1'h1)])};
      reg17 <= (((wire1[(4'hd):(1'h1)] ? {$signed(wire1), (&reg10)} : reg13) ?
              {(reg16 <<< $unsigned(reg5))} : $signed(reg4[(1'h0):(1'h0)])) ?
          reg8 : (reg10[(4'hc):(4'hb)] > $unsigned(((8'ha9) || ((8'ha6) ?
              reg13 : wire2)))));
    end
  assign wire18 = (8'ha1);
  assign wire19 = {reg5[(4'ha):(4'h9)], reg12[(2'h2):(2'h2)]};
  assign wire20 = ((8'hb4) ?
                      (&($unsigned((wire2 <= reg17)) & {wire18[(2'h2):(1'h1)],
                          (wire2 >> (7'h40))})) : reg7);
  always
    @(posedge clk) begin
      if (reg12)
        begin
          reg21 <= wire18[(2'h2):(1'h1)];
          reg22 <= reg21[(1'h0):(1'h0)];
          reg23 <= {($signed(reg4[(1'h0):(1'h0)]) == reg14[(4'h8):(4'h8)])};
        end
      else
        begin
          reg21 <= ((&((reg23[(4'hf):(4'ha)] ? reg17 : (reg23 & reg12)) ?
                  $unsigned({reg13}) : reg15[(3'h4):(2'h3)])) ?
              ({$unsigned(reg16[(1'h1):(1'h1)]),
                      ((-reg22) <= (reg7 ? reg15 : (8'hb9)))} ?
                  (($unsigned((8'hae)) ?
                          (reg14 ? reg22 : wire18) : (reg13 <<< (7'h43))) ?
                      $unsigned({wire2, reg6}) : (-(wire20 - reg16))) : (wire2 ?
                      (^$signed(reg22)) : $signed($unsigned(reg15)))) : ((wire20 ?
                  $unsigned((8'hbd)) : (~&(reg12 ?
                      wire18 : reg15))) | {((wire0 ? reg6 : (8'hb0)) ?
                      (reg21 * (8'hb7)) : wire1)}));
          if (((($signed(reg8[(1'h1):(1'h0)]) >> wire18[(5'h10):(3'h6)]) ?
              (-(reg12[(2'h3):(2'h3)] * (wire2 ?
                  reg9 : reg8))) : (!(^(-reg12)))) - (reg6[(4'hd):(4'ha)] << ($unsigned((^~(8'h9e))) ?
              reg14[(2'h3):(1'h0)] : wire1))))
            begin
              reg22 <= $unsigned(wire18[(4'hf):(1'h1)]);
              reg23 <= $unsigned((8'h9f));
              reg24 <= $unsigned(($unsigned(({wire19} >> (~wire20))) > (^(|(&(8'ha6))))));
            end
          else
            begin
              reg22 <= ((((&wire0) > $unsigned((reg5 >= reg6))) ^ (~^reg24[(4'hb):(4'hb)])) << $unsigned($signed(reg15)));
              reg23 <= (+$unsigned((|$unsigned(wire20[(4'ha):(1'h0)]))));
              reg24 <= (~&((8'h9c) ? reg24 : reg24[(4'hb):(2'h3)]));
              reg25 <= (~^$unsigned(reg16));
            end
          reg26 <= $unsigned($unsigned(reg12));
          if ($unsigned(($unsigned($signed((!reg23))) >= (^~($unsigned(reg15) << ((7'h42) ?
              (7'h40) : wire19))))))
            begin
              reg27 <= (~^wire1[(4'hb):(3'h5)]);
              reg28 <= $signed((8'haf));
              reg29 <= $unsigned(reg4[(2'h2):(1'h0)]);
              reg30 <= $unsigned(reg15);
            end
          else
            begin
              reg27 <= ($unsigned(reg24[(4'ha):(3'h5)]) * (+$signed($signed((wire20 <<< reg27)))));
              reg28 <= reg17[(2'h2):(1'h0)];
            end
          reg31 <= $signed($signed($unsigned($signed($unsigned(wire18)))));
        end
      if (reg10[(4'h8):(1'h0)])
        begin
          reg32 <= ($signed(reg8[(3'h4):(2'h3)]) - (&$unsigned(reg22[(4'hb):(1'h1)])));
          reg33 <= reg11[(1'h1):(1'h1)];
          reg34 <= ($signed((($signed(reg13) && $signed(reg6)) ?
              ((reg23 ~^ wire18) <= $signed(reg4)) : $unsigned({wire1,
                  reg31}))) & reg21);
          if ($signed((~^(~|wire3[(1'h1):(1'h1)]))))
            begin
              reg35 <= ((reg21[(1'h0):(1'h0)] >>> (((reg5 ?
                          reg32 : reg34) - $unsigned(reg21)) ?
                      $signed({reg31, reg9}) : $signed(reg13))) ?
                  $signed($unsigned($signed({reg30,
                      wire3}))) : (~&reg26[(1'h1):(1'h1)]));
              reg36 <= $unsigned((reg35 && {$unsigned($unsigned(reg24))}));
              reg37 <= wire20[(4'h9):(4'h9)];
            end
          else
            begin
              reg35 <= (^(^$signed((8'hac))));
              reg36 <= (((reg33[(2'h2):(1'h0)] >= $unsigned(reg27)) ?
                  {($signed(reg22) << $unsigned(reg27)),
                      (reg9[(4'he):(4'h9)] << ((8'hb0) < reg35))} : $signed($signed(reg35))) | (^$unsigned(reg25[(1'h0):(1'h0)])));
            end
          reg38 <= reg31;
        end
      else
        begin
          reg32 <= wire2[(4'hf):(3'h6)];
          if ($unsigned($unsigned(((reg31 < (wire3 ? reg35 : reg28)) ?
              ($unsigned(reg32) & $unsigned(reg11)) : ((reg24 || reg25) ?
                  reg32 : (wire3 ? reg16 : reg4))))))
            begin
              reg33 <= ($unsigned($unsigned(reg36[(5'h14):(3'h4)])) != $unsigned((reg12 ?
                  (^~$signed(reg7)) : ($signed(wire1) >> (reg9 ?
                      reg33 : reg10)))));
              reg34 <= $unsigned(({reg17[(2'h2):(1'h0)], reg9[(4'hc):(4'h8)]} ?
                  (reg11[(1'h1):(1'h0)] & $signed(reg4[(3'h4):(3'h4)])) : ($signed(reg11) ?
                      ($signed(wire18) <= (|reg27)) : $signed($unsigned(reg5)))));
            end
          else
            begin
              reg33 <= {(^reg16)};
            end
          reg35 <= ((reg33[(3'h6):(1'h0)] ?
                  $unsigned((+reg17)) : (-(~^(-reg23)))) ?
              ($unsigned(((~&wire1) ?
                  reg30[(3'h4):(3'h4)] : reg17)) ^~ ((+(wire20 ?
                  reg13 : reg16)) ^~ $signed(((8'h9c) ?
                  (8'ha9) : (8'hbd))))) : reg9[(3'h5):(1'h0)]);
          reg36 <= reg12[(1'h0):(1'h0)];
          reg37 <= reg12;
        end
    end
  assign wire39 = (($unsigned($signed(((7'h42) ^ reg28))) ?
                      reg7[(1'h1):(1'h1)] : $unsigned($signed((-(7'h42))))) && ((~&(!$unsigned(reg6))) && {(reg25[(3'h5):(3'h4)] ?
                          (wire20 != reg25) : reg35)}));
endmodule
