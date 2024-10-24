module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h175):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire35;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  reg [(4'hf):(1'h0)] reg34 = (1'h0);
  reg [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  assign y = {wire35,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = $signed({{wire0[(3'h5):(3'h5)], (!(wire1 ^ wire4))}});
  assign wire6 = (8'hbb);
  always
    @(posedge clk) begin
      if ($unsigned(wire5))
        begin
          reg7 <= ({$unsigned(wire4[(3'h6):(3'h4)]),
              {((wire6 * wire4) >> wire6[(2'h3):(1'h0)]),
                  ($signed(wire0) != $signed(wire4))}} < {wire2});
          reg8 <= $unsigned((wire4[(2'h3):(1'h0)] ^ {($unsigned(wire4) ^ $signed((8'hba))),
              $signed(wire0[(3'h4):(3'h4)])}));
          if (wire2)
            begin
              reg9 <= (!$signed({$unsigned({reg8, wire4})}));
            end
          else
            begin
              reg9 <= (7'h42);
            end
        end
      else
        begin
          reg7 <= {reg7[(3'h7):(3'h6)], $unsigned(wire6[(3'h5):(1'h0)])};
        end
      reg10 <= (8'ha7);
      reg11 <= (~^(|$signed(((wire1 ? wire0 : wire6) <<< $unsigned(reg9)))));
      if (reg11[(3'h4):(3'h4)])
        begin
          reg12 <= (wire2 ?
              $unsigned(wire3[(5'h10):(3'h7)]) : ($signed((reg10[(3'h6):(3'h5)] & (wire2 != reg9))) ^~ ({(8'h9d)} ?
                  ($unsigned(reg8) << ((8'hbe) ?
                      wire1 : (8'hb2))) : wire4[(4'hb):(3'h4)])));
        end
      else
        begin
          reg12 <= ((wire5 ? reg10 : reg9) << (reg7 ?
              wire0[(1'h1):(1'h1)] : (~&reg9)));
          if (({reg10, $signed(reg12)} | ($signed(wire6) ?
              $unsigned((reg10[(1'h1):(1'h0)] ?
                  (wire6 ^ reg11) : wire4)) : ($signed(reg11[(2'h2):(1'h0)]) >> $signed($unsigned(reg11))))))
            begin
              reg13 <= {$unsigned(wire2[(4'ha):(2'h2)]),
                  {$signed(reg8[(4'hf):(4'he)])}};
              reg14 <= wire0;
            end
          else
            begin
              reg13 <= reg8;
              reg14 <= $unsigned(((^wire3[(1'h1):(1'h0)]) | wire4[(3'h4):(1'h0)]));
              reg15 <= {($unsigned(((!wire3) - $signed(wire2))) << ($unsigned((^~reg11)) ?
                      $unsigned($signed(reg11)) : (wire1 ?
                          (~reg14) : (~|reg14)))),
                  (!wire3[(4'hf):(3'h4)])};
              reg16 <= {$signed(($unsigned(reg9[(4'ha):(4'ha)]) ?
                      ($signed(wire3) ?
                          reg11[(1'h1):(1'h0)] : reg13[(2'h2):(1'h1)]) : (|reg13[(1'h0):(1'h0)]))),
                  (((~&$signed((7'h41))) ^ $unsigned($unsigned((8'hb9)))) || {$unsigned(reg15[(1'h1):(1'h0)]),
                      ((wire3 ? reg8 : wire1) ^~ reg8[(4'h8):(2'h2)])})};
            end
          reg17 <= $signed($unsigned((8'hba)));
        end
      reg18 <= (reg16 ?
          (^(wire3 == $signed($unsigned(reg13)))) : $signed(reg13[(1'h1):(1'h0)]));
    end
  always
    @(posedge clk) begin
      if ({$signed((&({reg8} ? {(8'ha7), reg13} : reg12)))})
        begin
          reg19 <= (7'h44);
          reg20 <= ($unsigned({$unsigned((wire3 * wire1))}) && wire2);
          reg21 <= (8'h9d);
          reg22 <= (~^$signed(({$signed(reg14),
              wire2[(4'h8):(3'h6)]} < $unsigned((~|reg19)))));
        end
      else
        begin
          reg19 <= reg10;
          if ((~&(!(+$unsigned({reg12, reg20})))))
            begin
              reg20 <= ($unsigned($signed(((wire5 | reg15) ?
                      (~|wire1) : (~&reg17)))) ?
                  $signed($signed({reg8[(4'ha):(3'h7)]})) : (($signed(wire0) > ({reg9} * ((8'ha8) >>> wire2))) ?
                      $unsigned($unsigned((^~wire6))) : reg21[(3'h7):(3'h5)]));
              reg21 <= ($signed($unsigned(wire1)) ?
                  {$unsigned(reg16[(3'h6):(3'h4)])} : ({reg22,
                          $signed(((8'ha4) > (8'hb2)))} ?
                      $unsigned(((|(8'haf)) >>> $signed(wire5))) : $signed($unsigned(reg7))));
              reg22 <= {((|(!reg7[(3'h7):(3'h5)])) >= $signed(({reg18,
                      reg21} <<< $unsigned(reg13))))};
            end
          else
            begin
              reg20 <= $signed(reg21[(1'h0):(1'h0)]);
              reg21 <= (|$unsigned($signed(reg18[(2'h2):(2'h2)])));
              reg22 <= $unsigned(reg8);
              reg23 <= (($signed($signed(reg22[(4'he):(4'h8)])) ?
                      reg16[(4'h9):(3'h6)] : reg13[(1'h0):(1'h0)]) ?
                  $signed((({reg7} ?
                      $signed(reg15) : reg14) - ((wire4 * reg14) < wire5[(3'h7):(3'h4)]))) : ($signed((reg11[(2'h3):(2'h2)] ?
                      $signed(reg15) : {(8'ha0)})) << wire0));
              reg24 <= (!reg13);
            end
          reg25 <= ((7'h44) == ($signed((!(~^wire0))) ?
              reg24[(1'h0):(1'h0)] : ($unsigned(reg23) & $signed((~^wire0)))));
          reg26 <= reg20[(3'h4):(3'h4)];
        end
      if ($signed(reg24))
        begin
          reg27 <= $unsigned($signed({($unsigned(reg18) > ((8'hab) >>> reg10))}));
          reg28 <= reg10[(4'ha):(2'h3)];
          reg29 <= (((reg27 ?
                  $signed(reg24) : ({wire5,
                      reg12} || $signed(reg25))) <<< reg23) ?
              (wire4 - (wire0[(3'h6):(2'h3)] & ((reg23 << reg8) ?
                  {reg25} : reg25))) : ((reg23[(4'hb):(3'h4)] ?
                      (8'ha6) : ($unsigned(reg8) ?
                          ((8'had) << (8'ha4)) : (&reg16))) ?
                  ((8'ha5) ?
                      wire6[(2'h3):(2'h2)] : (reg10 || (reg14 ?
                          reg17 : reg27))) : reg24[(4'h8):(3'h7)]));
        end
      else
        begin
          reg27 <= {(wire0 ?
                  (8'hbd) : ((reg7 ?
                      (^~wire5) : $signed((8'hac))) << $signed((wire2 ^~ (8'hb3))))),
              $signed(reg21[(2'h2):(2'h2)])};
          reg28 <= ($signed($unsigned(reg27[(4'he):(4'he)])) ?
              (~^(reg17 ?
                  $unsigned((~reg16)) : reg29[(4'hc):(2'h3)])) : (^reg9));
          reg29 <= $unsigned(reg24[(2'h2):(1'h1)]);
          reg30 <= reg13[(2'h2):(1'h0)];
        end
      if (reg11[(2'h2):(1'h1)])
        begin
          reg31 <= $unsigned(((~((~wire1) >>> $unsigned((8'h9d)))) ?
              (((-reg22) != $unsigned(reg30)) >= (~|$unsigned((8'h9d)))) : ({$unsigned(reg10),
                      reg9} ?
                  $unsigned((reg8 <<< reg14)) : $signed(((8'hbf) * reg8)))));
          reg32 <= reg11[(2'h3):(1'h1)];
          reg33 <= $unsigned($signed($unsigned((&((8'ha6) ?
              (8'ha9) : reg28)))));
          reg34 <= (($signed({$signed(wire1)}) - ({(8'ha1)} ?
                  $unsigned(wire2[(3'h6):(1'h0)]) : $signed($unsigned(reg27)))) ?
              ((~(8'hbf)) - ($unsigned($signed(reg29)) >> $signed($unsigned((8'hbc))))) : {reg14[(2'h3):(2'h3)],
                  (($unsigned(wire1) << {(7'h43), reg22}) ?
                      {reg15} : {((8'hab) >>> reg16), $signed(reg11)})});
        end
      else
        begin
          reg31 <= wire2;
          reg32 <= $signed((~|{$unsigned({reg32})}));
          reg33 <= reg17;
        end
    end
  assign wire35 = {$unsigned((-(~|reg22)))};
endmodule
