module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1b9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire43;
  wire [(4'hd):(1'h0)] wire42;
  wire signed [(3'h4):(1'h0)] wire41;
  wire [(4'h8):(1'h0)] wire26;
  wire [(5'h12):(1'h0)] wire24;
  wire signed [(4'ha):(1'h0)] wire20;
  wire [(3'h6):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire18;
  wire [(4'h8):(1'h0)] wire17;
  wire signed [(4'hb):(1'h0)] wire4;
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg36 = (1'h0);
  reg [(3'h4):(1'h0)] reg35 = (1'h0);
  reg [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  reg [(4'he):(1'h0)] reg5 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire26,
                 wire24,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire4,
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
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg25,
                 reg23,
                 reg22,
                 reg21,
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
  assign wire4 = ($signed(wire0) ? wire1 : (!$signed($unsigned(wire1))));
  always
    @(posedge clk) begin
      reg5 <= (-{($signed($unsigned((8'hb8))) ? {$signed(wire4)} : (8'ha5)),
          wire2});
      if (wire3)
        begin
          reg6 <= wire3;
          reg7 <= $signed({wire3[(5'h15):(2'h3)]});
          reg8 <= wire1;
          reg9 <= wire3;
          if ($signed(($signed($signed($signed(wire1))) || ($unsigned((reg7 || wire1)) + (7'h40)))))
            begin
              reg10 <= wire3;
              reg11 <= ((|(8'hb1)) & reg5);
              reg12 <= wire0;
              reg13 <= $unsigned(wire3);
            end
          else
            begin
              reg10 <= reg8;
              reg11 <= reg5[(2'h3):(2'h2)];
              reg12 <= ((&wire4) ?
                  reg6 : (&$signed({reg5[(4'h8):(3'h6)], {reg12}})));
              reg13 <= (8'hab);
            end
        end
      else
        begin
          reg6 <= (^~(wire4[(1'h1):(1'h1)] << $unsigned($unsigned((reg7 || reg8)))));
          reg7 <= {wire0, (&$signed($signed({(8'hb4)})))};
          reg8 <= (wire4[(4'ha):(4'h8)] && $signed(reg5));
          if (($signed(($unsigned($signed(reg13)) ?
              (reg10[(3'h4):(1'h1)] ? {reg10} : reg5) : (+(|wire1)))) * reg9))
            begin
              reg9 <= ((!wire2[(3'h4):(1'h1)]) >> $signed(reg13[(1'h0):(1'h0)]));
            end
          else
            begin
              reg9 <= ($unsigned((^(^~$unsigned(reg10)))) ~^ $signed($unsigned($unsigned((reg8 ?
                  reg11 : reg9)))));
              reg10 <= ($unsigned(((+$signed((8'ha3))) ?
                      (+$unsigned(reg6)) : ((!wire0) ?
                          (reg12 ? reg13 : wire2) : (reg10 & (8'h9e))))) ?
                  (-wire0[(1'h1):(1'h1)]) : reg13[(3'h4):(2'h2)]);
            end
          if ($signed($signed(wire4[(4'h8):(4'h8)])))
            begin
              reg11 <= (({wire4[(3'h6):(2'h2)]} ^ ({wire0[(1'h0):(1'h0)],
                      (wire3 | reg8)} || {(|reg10)})) ?
                  (~^reg12) : (reg6 ? reg12 : wire3[(2'h2):(2'h2)]));
              reg12 <= reg6[(4'hc):(3'h6)];
              reg13 <= $signed((&wire1));
              reg14 <= (-(8'hab));
              reg15 <= ((|{reg9}) <<< reg5);
            end
          else
            begin
              reg11 <= $unsigned(reg5);
              reg12 <= $signed($signed(reg6));
              reg13 <= (~&$unsigned(wire3));
            end
        end
      reg16 <= $unsigned((reg10[(3'h7):(2'h3)] ?
          reg15[(2'h3):(2'h3)] : (($signed(reg7) ?
                  $unsigned(reg13) : $unsigned(wire2)) ?
              reg11 : $unsigned((+reg15)))));
    end
  assign wire17 = {$signed((~&(~&(wire4 ? reg11 : wire2))))};
  assign wire18 = wire4;
  assign wire19 = ((8'hb5) ^ $signed(wire0));
  assign wire20 = $signed(reg5[(4'hd):(4'hb)]);
  always
    @(posedge clk) begin
      reg21 <= (+wire3);
      reg22 <= $unsigned((&$signed(wire19)));
      reg23 <= ((~&$signed(((wire17 ? wire4 : reg16) ?
          $signed(reg13) : (reg13 << wire17)))) + $unsigned((^~((!reg8) ?
          ((8'hb3) > reg16) : (reg16 ? reg11 : wire19)))));
    end
  assign wire24 = wire2;
  always
    @(posedge clk) begin
      reg25 <= ($unsigned(reg12) ?
          reg7[(3'h4):(1'h1)] : ((-({wire24, reg15} != wire4[(3'h5):(3'h5)])) ?
              (~|((~wire1) ?
                  (8'hbe) : $signed(wire17))) : $unsigned(reg15[(4'h8):(1'h1)])));
    end
  assign wire26 = $signed((wire24[(4'hf):(4'hd)] >= (~&((reg11 && wire0) ^ {reg5}))));
  always
    @(posedge clk) begin
      if (((~^($unsigned((8'ha9)) ?
              (wire19[(3'h5):(2'h2)] >> $unsigned((8'ha0))) : wire17[(2'h2):(1'h0)])) ?
          $signed(($unsigned(reg9[(3'h5):(1'h0)]) ?
              wire2 : $unsigned(((8'hb3) & wire0)))) : $unsigned(((reg5 ?
                  wire17 : {reg25, wire18}) ?
              reg22 : ($signed(reg13) || (wire3 && reg16))))))
        begin
          if (reg11[(3'h7):(1'h1)])
            begin
              reg27 <= wire17[(3'h4):(2'h2)];
              reg28 <= (~^(~&wire2));
              reg29 <= $signed(((8'hb6) ?
                  $unsigned((reg11 ? wire2[(2'h2):(1'h1)] : (8'haf))) : reg23));
            end
          else
            begin
              reg27 <= (~($signed((wire26[(2'h3):(2'h2)] && (reg28 > wire4))) >= reg12[(3'h5):(3'h5)]));
              reg28 <= ({({(wire4 ?
                          wire1 : reg22)} ~^ $unsigned(wire26))} * (~&{reg13}));
              reg29 <= (~|$unsigned((|reg13[(3'h7):(3'h6)])));
            end
          if (reg25[(5'h11):(1'h0)])
            begin
              reg30 <= $unsigned((wire1 ?
                  (($signed(reg13) <= $unsigned(wire17)) * ((reg28 <<< (8'hbc)) - reg16[(4'h8):(2'h2)])) : ($signed({reg28,
                      reg16}) || $unsigned($unsigned(wire18)))));
              reg31 <= $signed($signed(reg7[(3'h7):(3'h6)]));
              reg32 <= wire26[(2'h3):(2'h2)];
              reg33 <= $unsigned((-wire19[(3'h4):(2'h2)]));
            end
          else
            begin
              reg30 <= wire24;
            end
          reg34 <= $unsigned(reg29);
          if (((($signed((wire3 & reg23)) <= ((8'h9d) == $signed(wire3))) >= ((8'hb2) ?
              ({reg34,
                  reg6} * (|wire19)) : reg23)) || {{{reg22[(1'h0):(1'h0)]}},
              $unsigned({(reg7 ? reg10 : wire20)})}))
            begin
              reg35 <= $signed((reg33 ?
                  $unsigned({reg5, (8'h9e)}) : wire4[(3'h6):(1'h1)]));
              reg36 <= {wire24};
              reg37 <= {$signed((&{(7'h42)})),
                  (wire20[(1'h0):(1'h0)] && reg10[(1'h1):(1'h0)])};
              reg38 <= reg5;
              reg39 <= ($signed(((8'hba) ?
                  (8'ha2) : reg22[(2'h3):(2'h3)])) | (($signed((8'hae)) < {(wire24 * (8'hb0)),
                  (wire17 - wire26)}) && wire26));
            end
          else
            begin
              reg35 <= $unsigned($unsigned((-$signed({(8'haf)}))));
              reg36 <= ($signed(reg36[(2'h3):(1'h1)]) < (reg28 ^ $signed(((reg12 ?
                  (8'hbb) : wire0) ^ $unsigned(reg21)))));
              reg37 <= (reg35 && $signed((reg35[(1'h0):(1'h0)] | ((-(7'h43)) ?
                  (reg30 & reg35) : reg38))));
            end
          reg40 <= reg32;
        end
      else
        begin
          if (({(8'hbc),
              ((reg23[(2'h2):(1'h0)] ?
                      (reg21 <<< reg5) : (wire0 ? reg5 : wire17)) ?
                  reg15[(4'h9):(3'h4)] : ($unsigned(reg27) | $signed(reg12)))} * (!(((reg6 <<< reg31) > $signed(wire20)) ?
              reg6[(1'h1):(1'h0)] : (-$signed(wire19))))))
            begin
              reg27 <= wire0;
              reg28 <= {wire0, (8'h9f)};
              reg29 <= reg40;
              reg30 <= (8'hb7);
              reg31 <= $unsigned((($unsigned(wire20[(3'h6):(3'h5)]) ?
                  reg28 : {reg37[(2'h2):(1'h1)]}) && (^$unsigned((reg31 ?
                  wire17 : reg21)))));
            end
          else
            begin
              reg27 <= (8'ha1);
              reg28 <= (7'h44);
              reg29 <= {$signed($unsigned(((-wire20) * (reg15 <= reg13)))),
                  (+(reg38[(3'h4):(1'h0)] * wire3[(3'h7):(1'h1)]))};
              reg30 <= (~(~$signed($signed(reg9[(3'h6):(1'h0)]))));
            end
          reg32 <= ((reg38[(1'h1):(1'h0)] | reg34) >>> (~&$unsigned((8'hbe))));
          reg33 <= wire4;
          if (reg35[(1'h1):(1'h0)])
            begin
              reg34 <= ((($unsigned((wire17 ? reg11 : reg40)) ?
                      {(reg31 > reg7)} : ((reg16 ? (7'h40) : wire4) || {reg12,
                          reg8})) ?
                  (reg28[(3'h7):(3'h6)] >> reg9[(1'h0):(1'h0)]) : wire0) == reg35);
              reg35 <= reg23[(1'h0):(1'h0)];
              reg36 <= (wire3[(1'h0):(1'h0)] < reg29[(1'h0):(1'h0)]);
              reg37 <= $signed($unsigned(($unsigned({reg38}) & (|(reg5 + reg30)))));
            end
          else
            begin
              reg34 <= (^~($unsigned(reg33[(2'h3):(2'h3)]) <<< reg6));
              reg35 <= ({wire17, reg31} ?
                  $unsigned(({((8'ha9) < (8'hba))} >>> wire1[(4'ha):(4'h9)])) : (reg32 ?
                      ($unsigned(wire0) ?
                          (reg8 ?
                              reg28 : $unsigned(reg25)) : ((~(8'hb9)) || $unsigned(reg38))) : reg33));
              reg36 <= $signed((reg27 ?
                  ((7'h43) ^~ {wire4[(2'h2):(2'h2)]}) : reg13[(4'hd):(4'hd)]));
              reg37 <= {reg15[(4'h8):(1'h1)]};
            end
          reg38 <= wire2[(2'h2):(2'h2)];
        end
    end
  assign wire41 = $unsigned(($unsigned($signed((+wire0))) ^ ((8'hb6) ?
                      $unsigned((~&reg37)) : {(reg13 ? reg37 : (8'hb3))})));
  assign wire42 = wire4[(4'h8):(1'h0)];
  assign wire43 = (&(wire42 + ({wire18, wire2[(2'h3):(2'h3)]} - (^~(wire1 ?
                      reg11 : reg23)))));
endmodule
