module top
#(parameter param38 = ((({((8'hb2) < (8'hb0)), ((8'hb9) ? (8'hbb) : (7'h42))} ? (&(|(8'haa))) : {(&(8'hab))}) * ({((7'h41) | (8'hbc))} ? (-{(8'hb4)}) : {{(8'hb0), (8'ha3)}})) ? (^(-(((8'hb9) - (8'h9d)) >>> (8'hba)))) : (^(~&(((8'hb0) <<< (8'hae)) == (7'h41))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h15c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire37;
  wire signed [(5'h11):(1'h0)] wire36;
  wire signed [(3'h7):(1'h0)] wire30;
  wire [(4'hb):(1'h0)] wire29;
  wire [(3'h5):(1'h0)] wire4;
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg34 = (1'h0);
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg9 = (1'h0);
  reg [(4'h9):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  reg [(3'h4):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg5 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire30,
                 wire29,
                 wire4,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
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
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = ({$unsigned(({(8'h9d), wire1} ~^ wire2))} ?
                     $unsigned(wire3[(3'h4):(2'h3)]) : {($unsigned((8'h9d)) ?
                             wire0[(2'h2):(1'h0)] : {$unsigned(wire0)}),
                         (|wire2[(1'h1):(1'h0)])});
  always
    @(posedge clk) begin
      if (wire0)
        begin
          reg5 <= (!$unsigned(wire2[(3'h6):(3'h5)]));
          reg6 <= $unsigned(($unsigned($signed((~^(8'hb6)))) == (|($signed(wire2) ?
              (wire3 != wire0) : wire0[(1'h1):(1'h1)]))));
          if ((reg5[(4'h8):(4'h8)] ?
              (-wire2[(2'h2):(2'h2)]) : (wire2[(2'h3):(2'h3)] - $signed($signed((wire1 < (8'hbd)))))))
            begin
              reg7 <= (~^(|({reg6, {wire1, wire2}} | $unsigned({reg6}))));
              reg8 <= (wire1[(4'hc):(4'h9)] <<< (8'hb4));
            end
          else
            begin
              reg7 <= ($signed($unsigned(reg5)) ? (&wire1) : wire4);
              reg8 <= (($signed(({reg5, reg6} ?
                  (~|(8'hbb)) : (wire0 ? reg8 : reg6))) << $signed({(!wire2),
                  $signed(wire2)})) ^~ ((reg8 >>> (|$signed(reg6))) ?
                  (wire3[(3'h5):(3'h4)] ?
                      ($signed(reg7) ?
                          wire0[(1'h0):(1'h0)] : $signed(reg6)) : (8'ha7)) : {$signed((reg6 - reg7))}));
              reg9 <= ((8'ha7) ?
                  (({{(8'had), (8'h9d)}, (-wire0)} < $unsigned(wire3)) ?
                      (reg7[(1'h0):(1'h0)] ?
                          wire4[(2'h2):(1'h1)] : reg8) : reg6) : $signed($signed((~&$signed(wire1)))));
              reg10 <= (^$signed(reg6[(2'h3):(1'h1)]));
            end
          reg11 <= $unsigned(($unsigned($unsigned((+reg10))) ?
              (({wire1, reg8} || $signed(reg7)) ?
                  reg8 : ((reg7 <= wire0) ?
                      (!(8'ha7)) : wire3[(2'h2):(1'h0)])) : reg5[(2'h3):(1'h0)]));
          if (((wire3 ? reg11 : wire1) ?
              wire1 : (+$signed((~^reg7[(1'h1):(1'h0)])))))
            begin
              reg12 <= $signed((wire4[(1'h1):(1'h0)] < $unsigned(({wire1} ?
                  reg10 : (^~reg9)))));
              reg13 <= ({reg8,
                      (((wire3 | reg6) ? reg11 : reg11) ?
                          ({(7'h43), reg9} <= (wire4 ?
                              wire2 : wire1)) : ($signed(reg10) != wire1[(4'h8):(2'h2)]))} ?
                  wire1 : wire0);
              reg14 <= ((wire0 ?
                  (wire0[(1'h1):(1'h0)] ?
                      ((wire4 >= reg11) ?
                          reg6 : {wire4,
                              reg5}) : (~|$unsigned(wire2))) : {(~|$signed(reg6))}) << (reg10[(2'h2):(2'h2)] ?
                  $unsigned($unsigned((wire2 >= wire4))) : {((reg12 ?
                          reg11 : reg9) || ((8'ha3) ? wire4 : reg13))}));
              reg15 <= (((($signed(reg12) ?
                      reg10[(1'h1):(1'h1)] : reg9[(1'h1):(1'h0)]) && ((8'hb5) || reg10[(2'h2):(2'h2)])) ?
                  wire2 : reg6) | {(~|$unsigned($unsigned(reg6))),
                  reg12[(3'h6):(1'h1)]});
            end
          else
            begin
              reg12 <= (~reg14[(4'hb):(2'h3)]);
              reg13 <= ($unsigned(reg13) ?
                  $unsigned((($signed(wire2) ? reg13 : (reg9 ? reg11 : wire1)) ?
                      $unsigned(reg8) : ($unsigned(wire0) > $signed(reg5)))) : $signed(reg15[(1'h0):(1'h0)]));
            end
        end
      else
        begin
          if ((8'hba))
            begin
              reg5 <= $signed(reg15);
              reg6 <= $unsigned(($signed(wire4[(1'h0):(1'h0)]) ?
                  (reg14 >= $signed($unsigned(reg12))) : $unsigned(($signed((8'ha2)) <= (8'hbb)))));
              reg7 <= $signed(((($unsigned(reg9) ?
                          (^~reg13) : $unsigned((8'ha0))) ?
                      (~&(reg13 || reg5)) : $signed($signed(wire0))) ?
                  reg9[(2'h3):(2'h2)] : reg10[(1'h0):(1'h0)]));
              reg8 <= $unsigned((^reg13[(2'h2):(2'h2)]));
            end
          else
            begin
              reg5 <= reg15;
              reg6 <= $signed((reg14 & reg6[(2'h2):(2'h2)]));
              reg7 <= (^((&((reg13 ? (8'ha8) : reg14) ?
                  wire0[(1'h0):(1'h0)] : (reg11 < reg9))) & ({reg14} ?
                  reg13[(2'h2):(1'h1)] : {(wire4 ? reg6 : wire3)})));
            end
          reg9 <= reg15;
          if ($signed({$signed(wire2)}))
            begin
              reg10 <= $unsigned(($unsigned($unsigned(wire1[(3'h7):(3'h6)])) & (^(~^(reg13 * reg7)))));
              reg11 <= {(~^(|$signed($unsigned(wire2))))};
              reg12 <= {reg8,
                  (wire1 ?
                      (|($unsigned(wire4) < {reg5,
                          reg13})) : (^$unsigned(reg6[(3'h4):(2'h2)])))};
              reg13 <= ((8'hb4) ?
                  $signed(({wire4, $signed(reg10)} ?
                      $signed(reg11) : $unsigned(((8'hb9) - reg6)))) : {reg12});
              reg14 <= ($unsigned((~$signed((~^reg12)))) ^ (+reg11[(2'h3):(2'h2)]));
            end
          else
            begin
              reg10 <= reg10;
            end
          reg15 <= reg7;
          if (reg5[(3'h7):(3'h7)])
            begin
              reg16 <= ($signed(((+(|(8'hb7))) ?
                      (~&wire0) : ($unsigned(reg15) ?
                          reg10[(2'h2):(1'h1)] : (~^wire1)))) ?
                  $unsigned($unsigned({wire1,
                      ((8'h9c) ? (8'hab) : wire1)})) : reg8[(4'h9):(2'h3)]);
              reg17 <= $unsigned(reg10[(2'h2):(1'h0)]);
              reg18 <= $signed(({((~reg7) ?
                          reg16[(2'h3):(2'h3)] : ((8'ha6) | reg17)),
                      $signed($signed(reg5))} ?
                  ((reg12[(4'he):(3'h7)] ?
                          (~&(8'ha8)) : (reg10 ? reg15 : wire0)) ?
                      ((-reg9) ?
                          (!wire2) : ((8'ha2) ?
                              wire0 : reg17)) : $signed((!(8'hb8)))) : {((wire3 ?
                              wire2 : (8'hbc)) ?
                          reg11[(5'h10):(2'h3)] : reg15),
                      ((reg7 > reg16) | $unsigned((8'ha5)))}));
            end
          else
            begin
              reg16 <= (reg10 ? wire1 : wire1[(4'h8):(3'h6)]);
              reg17 <= (~^(8'ha2));
              reg18 <= reg9[(1'h1):(1'h1)];
            end
        end
      reg19 <= reg18[(2'h2):(1'h0)];
      reg20 <= {$signed((8'ha9)),
          $signed({($unsigned((8'ha2)) + $signed(reg11)),
              ($signed(reg10) ? ((8'h9c) & (8'hbe)) : $signed((8'hab)))})};
      if (($signed(reg17[(4'h9):(2'h2)]) ~^ $signed(wire1)))
        begin
          reg21 <= {($signed($unsigned((reg13 ? wire0 : reg14))) & reg5)};
          reg22 <= (!$unsigned({((wire0 || reg21) ? $signed(reg8) : reg12),
              ((wire4 ? reg10 : reg15) ? reg12 : (wire3 * reg16))}));
          if ($signed($unsigned({((reg18 ? reg17 : wire2) <<< wire3),
              {$unsigned(reg9)}})))
            begin
              reg23 <= ((($unsigned((reg22 & reg11)) ?
                  (8'ha9) : ((reg12 <<< reg20) ?
                      (reg12 ?
                          reg17 : reg8) : $signed((8'ha8)))) | (($signed(wire1) ?
                  {(8'hbd),
                      reg6} : $unsigned(reg19)) <= (8'hbb))) != (((wire4 - (reg8 * reg8)) ?
                  $unsigned(reg5) : {((8'hbf) ? reg7 : (8'ha5)),
                      $signed(wire4)}) ^ (~|($signed((7'h44)) ?
                  {reg20, reg16} : {reg11, wire4}))));
              reg24 <= ($signed($signed({{reg16},
                  wire3[(1'h1):(1'h0)]})) ^ reg18[(4'ha):(2'h2)]);
            end
          else
            begin
              reg23 <= $unsigned((({(!reg13)} ?
                      (+(&wire3)) : reg12[(4'hc):(3'h4)]) ?
                  $signed((~(-wire2))) : $unsigned(reg9)));
              reg24 <= $unsigned(($signed((((8'hb1) ? reg7 : reg6) ?
                  (reg20 ?
                      reg9 : reg9) : $unsigned(reg7))) + (reg9 ^~ $unsigned((reg18 <= reg15)))));
              reg25 <= (-((wire0 ^~ (|(wire3 & reg24))) ^ ((^$signed(reg6)) && $signed((reg18 ?
                  (8'hb2) : reg17)))));
              reg26 <= reg16[(1'h1):(1'h1)];
            end
          reg27 <= reg12[(3'h6):(3'h4)];
          reg28 <= ((($unsigned(reg6) ? (-{reg19, reg5}) : $signed(reg12)) ?
              $unsigned(wire0) : (|$signed($signed(wire4)))) >> reg18[(3'h5):(1'h1)]);
        end
      else
        begin
          reg21 <= $signed($signed((8'ha9)));
          reg22 <= wire4[(1'h1):(1'h0)];
        end
    end
  assign wire29 = $unsigned((wire3 ?
                      $unsigned(({reg9} ?
                          $signed(reg22) : {reg25})) : ($unsigned(reg13) ?
                          wire0 : ((reg25 & reg23) ?
                              (reg11 == reg27) : {reg7}))));
  assign wire30 = (reg10[(2'h2):(1'h0)] ?
                      ((&reg5) | reg11[(4'hb):(4'ha)]) : $unsigned(reg13));
  always
    @(posedge clk) begin
      reg31 <= {$unsigned($unsigned($unsigned($unsigned((8'hae)))))};
      reg32 <= $unsigned({reg24});
      reg33 <= $signed(($unsigned($unsigned(reg10)) < reg16));
      reg34 <= (^~(^~((-reg26[(1'h1):(1'h1)]) > {reg7[(2'h2):(1'h1)]})));
      reg35 <= ((~^(reg31 ?
          (reg33 ~^ ((8'hba) ?
              reg11 : reg17)) : (^$signed(wire0)))) - reg28[(1'h1):(1'h1)]);
    end
  assign wire36 = (wire4 ^ reg24[(2'h2):(2'h2)]);
  assign wire37 = $unsigned(reg5[(1'h1):(1'h0)]);
endmodule
