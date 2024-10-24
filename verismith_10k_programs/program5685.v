module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire19;
  wire [(5'h10):(1'h0)] wire18;
  wire [(5'h14):(1'h0)] wire4;
  reg [(4'h8):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg5 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire4,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
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
                 (1'h0)};
  assign wire4 = ((-{(((8'hb7) ? wire0 : wire1) <<< $unsigned(wire0)),
                         $signed((wire2 ? wire2 : wire2))}) ?
                     wire0[(1'h0):(1'h0)] : $unsigned((((8'hbb) * (wire1 ?
                         wire2 : wire1)) <= {{(8'ha6), wire3},
                         (wire2 ? wire0 : wire2)})));
  always
    @(posedge clk) begin
      reg5 <= $unsigned(wire1);
      reg6 <= (~|((wire4 && {$unsigned(reg5),
          (wire0 ? wire1 : (8'ha5))}) && wire0));
      reg7 <= $unsigned((!$unsigned((~^((8'hba) << (8'hab))))));
      if (($signed({$signed((7'h44))}) ?
          ((wire1 ? wire0[(2'h3):(2'h2)] : $signed(reg6)) | ((&{reg7, wire3}) ?
              $unsigned($signed(reg5)) : reg5[(1'h0):(1'h0)])) : (wire2 ?
              reg6[(2'h2):(1'h0)] : (reg7 ?
                  $signed((wire2 ? wire4 : wire4)) : {reg7}))))
        begin
          reg8 <= $signed(reg5[(2'h3):(2'h2)]);
          reg9 <= (wire2[(1'h1):(1'h0)] & ({$unsigned((~&(8'hab))),
              $signed(reg7[(1'h1):(1'h0)])} + $signed(reg8[(1'h1):(1'h1)])));
          reg10 <= ({$unsigned((^~((8'hb5) ? wire2 : wire2))), wire1} ?
              reg5[(2'h2):(1'h0)] : (($unsigned({reg6,
                      wire1}) * ({reg6} - (wire3 ? reg6 : wire3))) ?
                  (({reg6} + $signed(reg9)) ?
                      ({reg5, reg9} ?
                          wire4 : $signed((8'hab))) : reg5[(2'h2):(1'h1)]) : $unsigned((reg8[(3'h5):(3'h4)] ?
                      (~wire3) : (reg6 || reg5)))));
          if (wire1)
            begin
              reg11 <= $unsigned((|$unsigned(({wire2} ?
                  $unsigned((7'h40)) : reg8[(4'hc):(4'ha)]))));
              reg12 <= ($unsigned(reg5[(1'h0):(1'h0)]) ?
                  $unsigned(wire2[(4'hc):(3'h6)]) : $signed(((~reg11) & (^~$signed(reg8)))));
            end
          else
            begin
              reg11 <= reg5;
            end
        end
      else
        begin
          reg8 <= (~|reg11);
          reg9 <= $unsigned((wire4[(3'h7):(3'h5)] <<< (8'ha1)));
          reg10 <= $signed($signed((reg11 ?
              ($signed(wire4) ?
                  ((8'hbb) ? reg5 : wire0) : $signed(reg9)) : ($signed(reg10) ?
                  (reg9 ? reg5 : wire1) : $unsigned(reg9)))));
          if ($unsigned(((~|$unsigned($unsigned(wire2))) <<< (((-wire3) * reg12) ?
              reg5[(1'h0):(1'h0)] : reg8))))
            begin
              reg11 <= (~|({((~&reg11) || (wire0 >> wire0))} ?
                  (reg9 << ($signed(wire4) ?
                      $signed(reg11) : $signed(reg11))) : reg6));
              reg12 <= (~^$signed({reg10[(3'h5):(1'h0)]}));
              reg13 <= $signed(wire1[(3'h4):(3'h4)]);
              reg14 <= (+(|{(reg8 ? $signed(reg10) : (&reg10)),
                  ($unsigned((8'hb8)) ?
                      (reg13 ? wire3 : reg6) : wire2[(5'h14):(5'h11)])}));
              reg15 <= ((wire1 ?
                  (!reg7) : (reg8[(2'h2):(1'h1)] ?
                      (wire3[(1'h1):(1'h0)] ?
                          (wire2 ?
                              reg9 : (8'haf)) : {wire3}) : ($unsigned((8'hac)) * reg5[(2'h2):(1'h0)]))) != (((!(reg12 ?
                  reg11 : reg5)) >>> ($unsigned(reg14) ?
                  (wire1 > reg13) : wire4)) <= $signed(({wire2, reg11} ?
                  (reg9 ? wire1 : reg10) : $signed(wire4)))));
            end
          else
            begin
              reg11 <= reg14[(1'h0):(1'h0)];
            end
          reg16 <= $signed({((-{reg14}) != reg8[(5'h11):(4'hb)]),
              ($unsigned($signed(reg8)) ^~ ({reg15,
                  reg5} >= reg5[(1'h0):(1'h0)]))});
        end
      reg17 <= $unsigned(reg7[(4'hb):(1'h1)]);
    end
  assign wire18 = $unsigned($signed($unsigned((|(reg16 ? reg10 : reg10)))));
  assign wire19 = (reg15[(2'h2):(1'h0)] >= (~|reg10[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg20 <= (wire18[(4'h8):(3'h5)] ?
          (wire19 + $unsigned(wire0)) : ((^~$signed(reg14[(2'h3):(2'h3)])) + ($unsigned($unsigned(reg11)) ?
              reg15 : (wire3[(4'he):(4'hd)] > wire0[(1'h0):(1'h0)]))));
      if ($unsigned($signed(wire0[(2'h2):(1'h1)])))
        begin
          reg21 <= {wire1, ((8'ha8) << reg20[(2'h3):(1'h0)])};
          if ((|$signed($unsigned({{wire4, reg13}}))))
            begin
              reg22 <= {reg21[(4'hd):(3'h7)]};
              reg23 <= ($signed($signed(reg21)) ?
                  (|$signed(((reg20 - wire4) ?
                      $signed(reg6) : {reg6,
                          wire3}))) : (($unsigned($signed(wire3)) != ($signed(reg7) != (reg10 ?
                      reg9 : reg9))) <<< $signed((+$signed(reg7)))));
              reg24 <= wire2;
              reg25 <= reg5;
              reg26 <= reg25;
            end
          else
            begin
              reg22 <= reg21;
              reg23 <= {{{((wire18 ? reg11 : reg22) ?
                              (-reg24) : (reg9 >= wire18))},
                      {((~reg26) - (&reg10)), reg22[(4'h9):(3'h4)]}}};
              reg24 <= reg26;
              reg25 <= reg9;
            end
        end
      else
        begin
          reg21 <= $unsigned((&{((~&wire1) >> wire3[(3'h5):(2'h3)])}));
          if ({((reg6 ~^ (~^$unsigned(reg25))) != $signed((wire18[(3'h7):(3'h4)] < (~^reg12)))),
              (reg23 ?
                  reg26[(2'h3):(2'h2)] : $unsigned((((8'hb0) ?
                      reg26 : (8'hbe)) > $unsigned((8'ha6)))))})
            begin
              reg22 <= $signed(reg21);
              reg23 <= $signed($unsigned($unsigned($signed((reg14 ?
                  (8'h9f) : wire2)))));
              reg24 <= ($unsigned($unsigned({reg24})) ?
                  (wire0 ?
                      $unsigned(((reg8 ~^ (8'ha0)) && wire0[(2'h2):(1'h1)])) : $signed((|(reg10 ?
                          reg23 : reg15)))) : $signed(reg7[(5'h12):(4'hb)]));
            end
          else
            begin
              reg22 <= $unsigned(({($unsigned(wire18) ?
                          (^~reg17) : $signed(reg7)),
                      wire4} ?
                  $signed((reg8[(1'h0):(1'h0)] ?
                      (8'ha0) : (reg17 ?
                          reg20 : reg15))) : $unsigned(reg15[(2'h2):(1'h1)])));
              reg23 <= reg10;
              reg24 <= reg17;
              reg25 <= ((wire4[(3'h6):(1'h1)] ?
                      (+wire2[(4'h9):(3'h5)]) : reg13[(3'h4):(1'h0)]) ?
                  (!(reg12 << reg23)) : (^reg14[(1'h1):(1'h0)]));
            end
        end
      reg27 <= $unsigned(reg13[(1'h0):(1'h0)]);
    end
endmodule
