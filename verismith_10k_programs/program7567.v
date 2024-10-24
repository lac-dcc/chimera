module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h23c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire46;
  wire [(5'h14):(1'h0)] wire45;
  wire [(5'h14):(1'h0)] wire39;
  wire signed [(5'h11):(1'h0)] wire38;
  wire signed [(4'hc):(1'h0)] wire37;
  wire signed [(3'h6):(1'h0)] wire36;
  wire [(4'hf):(1'h0)] wire34;
  reg signed [(3'h4):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(5'h14):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(4'he):(1'h0)] reg6 = (1'h0);
  reg [(5'h11):(1'h0)] reg5 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire34,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg35,
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
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire2)
        begin
          reg5 <= $unsigned((+((~{wire1}) & $signed($signed(wire4)))));
        end
      else
        begin
          reg5 <= reg5;
        end
      reg6 <= wire3[(1'h0):(1'h0)];
      reg7 <= {(wire4 ? wire2 : (-(&(wire4 != wire4))))};
      reg8 <= ((~{$signed((!wire0))}) ?
          ($signed(wire2[(4'h9):(3'h4)]) >> wire3) : (^(wire1 ^ wire2)));
      reg9 <= (($signed(($unsigned(wire2) + reg6)) + (reg6 ?
              ({reg8} & ((8'h9c) ? wire4 : (8'hae))) : wire2)) ?
          {{(+(wire3 ? wire1 : wire2))},
              reg7[(3'h4):(2'h3)]} : wire2[(2'h3):(2'h2)]);
    end
  always
    @(posedge clk) begin
      if ($unsigned((($signed((8'h9d)) ?
          ($signed((8'hb6)) + (reg8 != wire1)) : $unsigned($signed((8'hbc)))) < (^~((8'hb2) << wire2[(4'h8):(3'h4)])))))
        begin
          if ($unsigned($signed($unsigned(reg9))))
            begin
              reg10 <= ((reg5 ? wire1 : reg5[(2'h3):(2'h2)]) ?
                  ($signed($unsigned((reg8 >> wire0))) ?
                      (~|$signed($unsigned(reg9))) : $signed($unsigned($unsigned(reg8)))) : ($signed(reg9[(1'h1):(1'h1)]) == $unsigned(wire0)));
              reg11 <= ((-reg10) ?
                  reg8[(2'h2):(1'h1)] : $signed((reg7 ?
                      (^~{wire2}) : wire3[(4'h9):(1'h1)])));
              reg12 <= {(~&$unsigned({$unsigned(reg6), $signed(wire0)}))};
              reg13 <= (wire1 ?
                  {{($unsigned(reg5) * {wire1}), (&reg8[(1'h1):(1'h0)])},
                      ((+reg8[(1'h1):(1'h1)]) >= ((~^reg8) ?
                          (^~reg9) : reg9[(4'h9):(3'h7)]))} : (^~($unsigned({wire0,
                      (8'ha8)}) <= (~$signed((7'h40))))));
            end
          else
            begin
              reg10 <= reg5[(3'h6):(2'h3)];
              reg11 <= $unsigned(reg13);
            end
          reg14 <= (wire2[(4'h8):(3'h5)] ?
              $unsigned(wire1[(4'ha):(2'h3)]) : $signed($unsigned(reg12[(1'h1):(1'h1)])));
          reg15 <= $signed((wire2[(1'h0):(1'h0)] || (reg11[(1'h0):(1'h0)] ^~ reg8[(1'h1):(1'h0)])));
        end
      else
        begin
          reg10 <= $signed($unsigned($signed(({reg5, (8'h9f)} ?
              $unsigned(reg11) : $unsigned(reg11)))));
        end
      if (wire3[(2'h2):(2'h2)])
        begin
          if ($signed((+reg5)))
            begin
              reg16 <= (wire0 ?
                  (^(^$unsigned($signed((8'hbd))))) : (&(^~(+wire4[(4'hd):(4'hb)]))));
              reg17 <= wire4[(4'ha):(3'h4)];
            end
          else
            begin
              reg16 <= wire2[(4'hd):(4'h9)];
              reg17 <= reg5;
              reg18 <= $unsigned((~{$unsigned((|reg5))}));
              reg19 <= $unsigned(reg13);
            end
          reg20 <= (wire4[(5'h12):(4'h8)] ?
              ((~$signed((reg10 ? reg11 : reg19))) ?
                  reg15 : ($unsigned(reg8[(1'h0):(1'h0)]) ?
                      $unsigned((~&wire1)) : $signed((reg8 <<< wire2)))) : ($signed(reg14) <<< $signed($unsigned(reg5[(3'h7):(1'h0)]))));
          reg21 <= ((~^reg7) < (+reg5));
          reg22 <= (&reg9);
          reg23 <= $unsigned(reg18);
        end
      else
        begin
          if (((reg13[(3'h6):(2'h2)] ?
              ((~&(&wire4)) ? (!$signed(wire0)) : reg14) : $signed(((reg20 ?
                  wire0 : reg12) & reg6))) != $unsigned(($signed((wire2 ?
                  reg16 : wire3)) ?
              (^$signed(reg7)) : reg8))))
            begin
              reg16 <= $unsigned({(reg20 & reg16)});
              reg17 <= $unsigned($signed(((reg20 ?
                  reg6 : (reg8 ?
                      reg8 : wire0)) && $unsigned((reg19 >>> reg18)))));
              reg18 <= reg7;
              reg19 <= reg8;
              reg20 <= reg13;
            end
          else
            begin
              reg16 <= $signed((~&reg15));
            end
          reg21 <= reg5;
          reg22 <= reg22[(3'h4):(2'h2)];
        end
      if (wire3)
        begin
          reg24 <= reg12;
          reg25 <= (reg6[(4'hc):(2'h2)] ?
              (($signed((reg10 == reg14)) ~^ $signed(reg14)) ?
                  reg22 : {($unsigned((7'h42)) ?
                          (reg6 ?
                              reg11 : reg7) : $unsigned(wire0))}) : reg15[(2'h3):(2'h3)]);
          reg26 <= {$signed($unsigned((~^reg6))), (8'hb6)};
        end
      else
        begin
          reg24 <= (^reg20);
          reg25 <= {$unsigned({reg8[(1'h0):(1'h0)], (8'ha6)}),
              $unsigned((~^(8'hac)))};
          reg26 <= $signed(reg24);
          if (reg17)
            begin
              reg27 <= $unsigned({({(reg10 && reg14),
                      reg24[(5'h12):(2'h3)]} == (~&(reg25 ?
                      reg10 : (8'hb3))))});
              reg28 <= $signed((|wire0));
            end
          else
            begin
              reg27 <= (((~^reg14[(1'h1):(1'h1)]) ?
                  (&(!(reg7 != reg8))) : (+reg6)) && $unsigned(((~&reg12) ?
                  (-((8'ha8) ? reg19 : reg6)) : (wire2 ?
                      wire0[(2'h2):(1'h0)] : {wire4, reg25}))));
              reg28 <= {reg25[(1'h0):(1'h0)], reg16[(4'ha):(4'h9)]};
              reg29 <= $unsigned($unsigned($signed($unsigned({wire1, reg16}))));
              reg30 <= (reg8[(1'h0):(1'h0)] ?
                  $unsigned($unsigned((8'hbd))) : $unsigned(($signed((^reg25)) ?
                      (|$unsigned((8'h9e))) : reg19)));
              reg31 <= $signed(($signed((~|{wire2})) ?
                  ((((8'hb7) ? wire1 : reg12) ? (+reg5) : {reg15}) ?
                      (reg21 ?
                          (reg7 ? reg10 : reg24) : {reg10,
                              reg8}) : (~{reg21})) : (8'hb1)));
            end
        end
      reg32 <= (8'ha9);
      reg33 <= ((reg16[(3'h4):(1'h1)] <= reg17) ?
          (($unsigned($unsigned(reg16)) ~^ (reg10 > {wire2, reg29})) ?
              reg25[(2'h3):(2'h2)] : reg16) : (~^$signed(((wire4 ?
              reg9 : (8'hb9)) != reg24[(3'h4):(1'h1)]))));
    end
  assign wire34 = $signed((((+reg31[(3'h6):(1'h1)]) ?
                      wire3[(4'hd):(2'h3)] : (~&$signed(reg22))) < {reg26}));
  always
    @(posedge clk) begin
      reg35 <= $signed(($signed($unsigned((~|reg10))) ?
          ({(!reg8),
              wire2[(4'hc):(3'h7)]} & $unsigned(reg7[(5'h10):(4'hc)])) : $signed(($unsigned(wire34) ^ wire1))));
    end
  assign wire36 = $signed(reg12[(3'h6):(3'h6)]);
  assign wire37 = $unsigned(reg7[(2'h2):(1'h0)]);
  assign wire38 = reg21[(4'he):(4'h9)];
  assign wire39 = {((reg31 ? reg20[(2'h3):(2'h3)] : $signed($signed(reg9))) ?
                          reg22 : $unsigned(reg27))};
  always
    @(posedge clk) begin
      reg40 <= (reg9[(3'h7):(3'h4)] ?
          (-reg16[(2'h2):(1'h1)]) : reg24[(4'h9):(3'h5)]);
      reg41 <= (~^$signed(reg28));
      reg42 <= $unsigned($unsigned((^reg32)));
      reg43 <= (-$signed(reg14));
      reg44 <= ($unsigned(((((8'ha6) ? reg31 : (8'hba)) ?
              $signed(reg33) : (wire39 ? wire2 : (8'hb1))) << (~&wire2))) ?
          reg43[(4'h9):(3'h7)] : (8'hb7));
    end
  assign wire45 = (&reg14[(1'h1):(1'h0)]);
  assign wire46 = ((|($signed(wire39[(4'h9):(1'h1)]) <<< reg10[(4'he):(1'h1)])) ^~ ($unsigned({$signed(wire39),
                      (~wire4)}) <<< reg33));
endmodule
