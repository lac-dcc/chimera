module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h130):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire29;
  wire signed [(2'h2):(1'h0)] wire28;
  wire [(4'ha):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire26;
  wire [(4'hb):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire4;
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = ($unsigned($unsigned((8'ha5))) ? wire0 : $signed(wire2));
  assign wire5 = ((({(wire4 ? wire3 : (8'had)),
                         $unsigned(wire3)} > {$unsigned(wire4),
                         ((8'hb2) < wire1)}) ~^ (~{{(8'haf), wire0}})) ?
                     $signed($signed((wire2 << (~|(8'h9f))))) : $unsigned($signed(({wire2} && (wire4 & wire1)))));
  assign wire6 = wire3;
  assign wire7 = wire6;
  always
    @(posedge clk) begin
      if ((((wire1[(4'h9):(3'h5)] ?
              wire6[(4'hc):(3'h6)] : ((wire6 ? wire2 : wire2) ?
                  (^(8'h9d)) : {wire5})) ?
          $signed(wire5[(3'h4):(3'h4)]) : $signed(wire1)) == (~^$unsigned(wire2))))
        begin
          reg8 <= wire2;
          reg9 <= (^wire4[(4'he):(4'h8)]);
          reg10 <= (-((-((~^wire2) || $unsigned(wire2))) * ({$unsigned(wire5)} ?
              (8'ha7) : $unsigned($signed(wire7)))));
          reg11 <= $signed(wire5[(2'h2):(1'h0)]);
          if ((^(wire1 ?
              (wire5[(1'h0):(1'h0)] ?
                  $unsigned({wire1,
                      reg11}) : reg10[(3'h7):(3'h7)]) : $unsigned(($unsigned(wire4) ?
                  {(8'hbe), wire2} : (wire1 != (8'ha6)))))))
            begin
              reg12 <= ($signed((~^{$unsigned(wire6), reg9})) ?
                  $signed($unsigned(reg9)) : wire5[(2'h2):(1'h0)]);
              reg13 <= ((^~(($unsigned(reg9) ?
                          reg12[(3'h6):(1'h1)] : ((8'hb4) + reg9)) ?
                      (wire4 <= (^(8'hb4))) : ((wire5 <<< reg9) ?
                          (wire6 ? wire7 : reg11) : $unsigned(wire2)))) ?
                  $signed(wire5[(3'h4):(2'h3)]) : wire6[(2'h2):(1'h1)]);
            end
          else
            begin
              reg12 <= wire3[(3'h5):(3'h5)];
              reg13 <= $unsigned(wire1);
              reg14 <= (($signed($unsigned((reg11 ? reg10 : wire6))) ?
                  ($unsigned((wire4 ?
                      (8'hbb) : reg13)) != $signed((wire2 <= wire5))) : $signed(reg12)) - $signed($signed(reg10)));
              reg15 <= ((8'h9c) != $unsigned((($signed(wire5) | (~^wire6)) <= (wire2[(4'hc):(3'h7)] ?
                  $unsigned(wire6) : wire6))));
              reg16 <= (&$unsigned($unsigned(reg13)));
            end
        end
      else
        begin
          if (wire0[(2'h2):(1'h1)])
            begin
              reg8 <= ($signed((^~(~^(|reg12)))) ?
                  $unsigned($unsigned($signed((reg12 && reg10)))) : (($unsigned((reg16 ?
                          reg13 : reg12)) ?
                      $unsigned(wire4[(2'h2):(2'h2)]) : reg15[(3'h4):(3'h4)]) >>> (wire4[(4'hb):(3'h4)] == $signed($unsigned((8'hba))))));
            end
          else
            begin
              reg8 <= $signed($unsigned({$unsigned((reg15 * reg15))}));
              reg9 <= $signed(((7'h41) ~^ {($unsigned(reg14) ?
                      wire4 : $signed((8'h9f))),
                  (wire3 ^ $unsigned(wire4))}));
              reg10 <= wire0[(2'h2):(2'h2)];
            end
          reg11 <= $unsigned($unsigned(reg11));
        end
      reg17 <= {wire5, reg10};
      reg18 <= ((($signed(reg17[(3'h5):(2'h3)]) ?
              ($unsigned(wire0) << reg9[(2'h2):(2'h2)]) : ($unsigned((8'ha8)) ?
                  wire2 : (&reg10))) ?
          {(8'h9f),
              (~reg12)} : (~($unsigned(wire2) || wire5[(2'h2):(1'h1)]))) - reg8[(1'h1):(1'h1)]);
      if ($unsigned($signed(reg10[(3'h6):(3'h5)])))
        begin
          reg19 <= (~^(reg13[(3'h5):(1'h0)] ?
              ($unsigned((reg14 ^ reg11)) ?
                  (~&wire6[(3'h4):(2'h3)]) : reg14) : reg8));
          if ((^~(reg18[(5'h12):(2'h3)] ?
              $signed($signed((~^wire4))) : ((reg12 && reg15) < (+reg15)))))
            begin
              reg20 <= {wire5[(1'h0):(1'h0)],
                  ((($signed(reg12) ^ (reg12 ?
                      reg12 : wire5)) & $unsigned((-reg8))) & reg17)};
            end
          else
            begin
              reg20 <= reg10[(3'h7):(3'h7)];
              reg21 <= wire1;
              reg22 <= $unsigned(($unsigned($unsigned($unsigned(reg10))) & (~^{(reg21 ?
                      reg13 : wire5),
                  (reg8 ? reg15 : reg10)})));
              reg23 <= $signed(reg21);
              reg24 <= ((wire2 <= $signed($signed((reg20 | wire3)))) ?
                  (((+reg14[(2'h3):(2'h3)]) ^~ ($signed(reg20) | $unsigned(reg20))) || (wire4 & reg23[(3'h7):(3'h4)])) : reg11);
            end
          reg25 <= ($unsigned(($signed({reg22, reg11}) ?
                  wire2 : $signed((8'ha0)))) ?
              wire2[(4'h9):(3'h5)] : reg17[(2'h2):(1'h0)]);
        end
      else
        begin
          if (($unsigned({wire4[(4'hb):(1'h1)]}) >> wire3))
            begin
              reg19 <= reg25;
              reg20 <= (-$unsigned(((^~wire6) && wire5[(1'h0):(1'h0)])));
              reg21 <= ($signed((8'ha5)) & {$unsigned(({(8'hbe), reg11} ?
                      (~(8'h9d)) : $unsigned(wire1)))});
              reg22 <= reg14;
            end
          else
            begin
              reg19 <= reg25;
              reg20 <= reg12;
              reg21 <= (reg20[(4'hb):(2'h2)] == reg12);
              reg22 <= (&reg12);
            end
          if ({({((+reg13) ?
                      (reg15 != (8'hb2)) : reg20[(3'h5):(2'h2)])} || $signed($signed((wire0 ?
                  wire4 : reg18)))),
              reg22[(1'h0):(1'h0)]})
            begin
              reg23 <= $signed({($unsigned({(8'ha8), wire3}) ?
                      $signed((wire0 ?
                          wire1 : reg21)) : ((wire6 & reg11) - (~^reg23))),
                  reg17[(3'h6):(2'h2)]});
              reg24 <= (!$signed((reg10[(3'h4):(3'h4)] ?
                  $unsigned($unsigned(reg18)) : (~|reg20[(3'h6):(1'h0)]))));
            end
          else
            begin
              reg23 <= (~&({reg21} >> $signed((reg14 ?
                  {reg25, (8'hb5)} : (reg22 * (8'haa))))));
              reg24 <= (!wire2);
              reg25 <= (8'hb5);
            end
        end
    end
  assign wire26 = wire3[(4'h8):(1'h0)];
  assign wire27 = reg11[(5'h13):(1'h1)];
  assign wire28 = {$unsigned($signed(reg18[(4'hb):(4'ha)]))};
  assign wire29 = reg21;
endmodule
