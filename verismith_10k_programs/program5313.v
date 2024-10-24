module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h102):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire25;
  wire [(2'h3):(1'h0)] wire24;
  reg signed [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(2'h3):(1'h0)] reg7 = (1'h0);
  reg [(2'h3):(1'h0)] reg6 = (1'h0);
  reg [(5'h10):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg4 = (1'h0);
  assign y = {wire25,
                 wire24,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
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
      if (wire3)
        begin
          if ($unsigned(($unsigned(wire0[(1'h0):(1'h0)]) <= $unsigned(wire0[(2'h3):(2'h3)]))))
            begin
              reg4 <= $signed($signed((|(7'h44))));
            end
          else
            begin
              reg4 <= (-(($unsigned($unsigned(wire3)) || $unsigned($signed(reg4))) != (~^(-wire2))));
              reg5 <= reg4;
              reg6 <= wire3[(4'hf):(1'h1)];
              reg7 <= ((~&wire3[(4'hb):(3'h6)]) ?
                  ($unsigned($unsigned((+(8'ha0)))) ?
                      (-$signed($unsigned(reg5))) : wire3[(4'hd):(4'hc)]) : reg4[(2'h2):(1'h0)]);
            end
          if ((~(reg5[(4'ha):(3'h7)] ?
              (reg6 ?
                  ({wire0, (8'ha9)} ?
                      $unsigned(wire3) : ((8'hbe) ?
                          reg7 : reg4)) : $unsigned(wire0[(1'h1):(1'h1)])) : (((-wire1) <<< {reg7,
                  reg6}) < (!$unsigned(wire0))))))
            begin
              reg8 <= $signed({$unsigned((((8'h9d) ? reg7 : reg5) >= {reg6}))});
              reg9 <= (|(($signed(((8'ha3) == reg7)) ?
                      (8'ha7) : ((reg5 - wire2) == (reg5 ? wire1 : reg4))) ?
                  wire2[(3'h5):(3'h4)] : $signed(reg8[(1'h1):(1'h1)])));
            end
          else
            begin
              reg8 <= wire3[(4'h8):(3'h5)];
              reg9 <= {(($signed(((8'hb3) ? wire2 : reg6)) && (((8'h9c) ?
                          reg6 : (8'hb8)) ?
                      $unsigned(reg9) : $unsigned(wire1))) >= wire2[(4'h8):(3'h4)])};
              reg10 <= $unsigned(wire3[(2'h2):(1'h1)]);
              reg11 <= (reg7[(1'h0):(1'h0)] > ((((&(8'hab)) ?
                      (wire3 ? reg8 : reg9) : {reg4}) << reg7[(2'h3):(2'h3)]) ?
                  wire1[(4'ha):(3'h5)] : (wire0 > wire3[(4'hf):(4'hb)])));
            end
          reg12 <= (~((~|$signed(wire2[(3'h7):(3'h7)])) & ($signed(wire0) >>> reg6[(1'h0):(1'h0)])));
          reg13 <= reg5;
          reg14 <= $signed((~((((8'hbe) ? (8'hbe) : reg9) ?
              reg5[(4'ha):(2'h3)] : {reg6}) + (+reg12[(1'h0):(1'h0)]))));
        end
      else
        begin
          reg4 <= {$signed(reg8[(3'h7):(1'h1)])};
        end
      if (((wire3 != $signed((wire3 ?
          $signed(reg14) : reg11))) << reg10[(3'h4):(1'h1)]))
        begin
          reg15 <= $unsigned(((~^(reg14 * wire0[(3'h5):(2'h2)])) + reg12));
        end
      else
        begin
          reg15 <= reg9[(3'h6):(3'h6)];
          reg16 <= ({(($signed((8'hab)) ?
                          (wire2 ? reg10 : reg13) : reg10[(3'h7):(3'h4)]) ?
                      ((reg12 >> reg12) <<< $signed(wire2)) : $unsigned((reg5 ?
                          reg11 : (8'ha3)))),
                  reg12} ?
              (~^$unsigned(((^reg14) ?
                  (reg11 < reg11) : (wire0 ?
                      reg15 : reg4)))) : (!{((~reg8) * reg4[(2'h2):(1'h0)])}));
          reg17 <= reg5;
          reg18 <= $unsigned(((~^$signed(wire3)) <= $unsigned($signed((^reg9)))));
        end
      reg19 <= (&$signed((reg14[(3'h4):(1'h1)] & $signed((reg9 + wire2)))));
      reg20 <= $signed((reg12 != (reg4[(1'h1):(1'h0)] ?
          $signed((reg13 ^ reg13)) : ((wire2 ? wire1 : reg10) + wire0))));
      reg21 <= {reg16};
    end
  always
    @(posedge clk) begin
      reg22 <= $signed((((^(reg12 >>> reg18)) ?
          reg8 : reg16[(1'h1):(1'h1)]) < (+$unsigned(((8'hb3) ?
          reg11 : reg6)))));
      reg23 <= $signed(($signed(wire2) ?
          $signed(($unsigned(reg20) >> {(8'ha2)})) : (~($signed(reg22) ?
              ((8'haf) ? wire0 : reg20) : reg14))));
    end
  assign wire24 = reg16[(1'h0):(1'h0)];
  assign wire25 = {reg13,
                      $unsigned(((+(reg14 ?
                          wire0 : wire3)) + ($signed(wire3) + (reg14 * reg9))))};
  always
    @(posedge clk) begin
      reg26 <= {reg11[(1'h0):(1'h0)]};
      if ($unsigned(reg15[(3'h5):(2'h3)]))
        begin
          reg27 <= {$signed(wire3[(4'ha):(2'h3)]),
              $signed($unsigned(reg7[(2'h3):(1'h1)]))};
          reg28 <= {reg17[(3'h6):(2'h3)], reg5[(1'h0):(1'h0)]};
        end
      else
        begin
          reg27 <= (|$unsigned({$unsigned((^reg5)), wire0[(3'h7):(3'h4)]}));
        end
      reg29 <= (reg20 ?
          (|($unsigned({reg4, reg14}) ?
              $signed(reg21[(3'h4):(3'h4)]) : $signed((wire3 || reg22)))) : wire2[(4'h9):(4'h8)]);
      reg30 <= (reg21[(5'h14):(3'h4)] != ($signed(reg8) << wire25[(2'h3):(1'h1)]));
      reg31 <= (reg23[(3'h4):(2'h3)] & $signed($signed($unsigned((7'h41)))));
    end
endmodule
