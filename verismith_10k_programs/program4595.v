module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h192):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire37;
  wire signed [(3'h7):(1'h0)] wire30;
  wire signed [(3'h5):(1'h0)] wire29;
  wire signed [(4'hb):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire4;
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(2'h2):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  assign y = {wire37,
                 wire30,
                 wire29,
                 wire5,
                 wire4,
                 reg36,
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
                 (1'h0)};
  assign wire4 = wire0;
  assign wire5 = (^wire3);
  always
    @(posedge clk) begin
      if ((wire0[(5'h11):(4'hb)] ?
          $unsigned(wire3[(4'h9):(3'h4)]) : wire1[(1'h0):(1'h0)]))
        begin
          reg6 <= (^~(~^wire2));
          if (wire5[(4'hb):(3'h7)])
            begin
              reg7 <= (($unsigned($signed($unsigned((8'h9e)))) ^ $signed({((8'hb4) ~^ wire4),
                      $unsigned((8'h9c))})) ?
                  wire1 : wire3);
              reg8 <= $unsigned(wire1[(4'h9):(3'h7)]);
              reg9 <= $signed(wire2);
              reg10 <= wire3;
            end
          else
            begin
              reg7 <= ((wire5[(4'h8):(3'h6)] ?
                      wire4[(4'hb):(4'h9)] : ((reg8[(3'h4):(2'h2)] ?
                              (wire4 < (8'hbb)) : (reg9 == wire2)) ?
                          wire0[(4'hd):(3'h5)] : wire4[(4'h8):(3'h7)])) ?
                  $unsigned((+(!(~(8'haa))))) : reg7);
              reg8 <= reg8[(4'h8):(2'h3)];
              reg9 <= $signed(wire5);
              reg10 <= wire2;
            end
        end
      else
        begin
          reg6 <= wire4[(1'h1):(1'h0)];
          if ($signed((-$signed((wire4[(5'h10):(4'hc)] < $signed(wire0))))))
            begin
              reg7 <= {wire0, wire0[(5'h14):(3'h4)]};
              reg8 <= (~^wire1);
              reg9 <= ({(8'had)} ?
                  $signed(($unsigned(reg8) == wire4[(3'h6):(2'h3)])) : {wire2[(3'h5):(2'h3)],
                      ({$signed((8'hbe)),
                          {wire0}} ~^ (((8'hbc) >>> reg8) * reg6))});
            end
          else
            begin
              reg7 <= ($unsigned(wire5[(3'h7):(2'h2)]) ?
                  reg9[(4'he):(3'h5)] : ($signed(reg7[(3'h4):(2'h2)]) - $signed(wire2)));
              reg8 <= (($signed(wire5[(1'h1):(1'h1)]) - reg8[(2'h2):(1'h1)]) ?
                  wire1 : $unsigned(wire0[(4'hb):(4'ha)]));
              reg9 <= $unsigned(reg8[(3'h7):(3'h4)]);
              reg10 <= wire3;
              reg11 <= (8'hba);
            end
          if (wire1[(4'hd):(4'hd)])
            begin
              reg12 <= (((8'h9f) == reg10[(4'hc):(4'hb)]) ?
                  (({reg7} ?
                      (8'hb8) : (reg9[(4'h8):(4'h8)] && (~^wire4))) <<< (~^reg10[(3'h6):(2'h3)])) : wire1);
              reg13 <= $signed(wire2);
            end
          else
            begin
              reg12 <= reg12[(4'hc):(4'hb)];
              reg13 <= ($unsigned($signed((~wire5))) ?
                  ((&reg9) > $signed(((&(8'hb5)) ?
                      wire5 : $signed(reg11)))) : {(-((wire2 ? (8'hbf) : reg9) ?
                          wire1[(3'h6):(1'h0)] : {(8'haf)}))});
              reg14 <= (!reg9);
              reg15 <= (-($unsigned((reg13[(1'h0):(1'h0)] ?
                      $unsigned(wire3) : ((8'hbc) ? reg13 : reg10))) ?
                  (-(wire4 ? reg13[(3'h4):(3'h4)] : (~&wire0))) : reg9));
              reg16 <= (^~($signed(reg9) ?
                  $signed(reg7[(4'ha):(2'h2)]) : {wire4[(5'h12):(4'h9)]}));
            end
          reg17 <= reg10;
          reg18 <= $unsigned(((~reg17[(2'h2):(1'h1)]) || $unsigned(wire0[(5'h10):(4'ha)])));
        end
      if ($signed(($unsigned((&(wire3 ?
          reg11 : reg15))) >> $signed($signed($unsigned(wire0))))))
        begin
          reg19 <= wire5[(2'h3):(1'h0)];
          reg20 <= $signed((8'h9f));
          reg21 <= (+(reg13 ?
              (((~^wire1) || (reg8 ? wire0 : reg20)) ?
                  $unsigned((reg7 ?
                      wire2 : (8'hac))) : $unsigned({reg19})) : (~^((~&(8'hbd)) ?
                  (8'hba) : (reg13 << wire5)))));
          reg22 <= (((~&$signed((reg7 ? reg8 : reg21))) && reg20) - wire0);
          reg23 <= ((|$unsigned(reg15[(3'h5):(1'h0)])) ?
              ($unsigned((~&(~&wire2))) ?
                  wire2[(2'h3):(1'h0)] : $signed(wire5[(3'h6):(1'h0)])) : $signed((+((-reg13) ?
                  (reg22 ? (8'ha3) : reg19) : $signed(wire2)))));
        end
      else
        begin
          reg19 <= {($unsigned($signed((reg7 ^ (8'ha4)))) ~^ (wire2 && $signed(wire4)))};
          reg20 <= $unsigned(reg18);
          reg21 <= $unsigned($signed((-$signed($signed(reg20)))));
        end
      reg24 <= (($signed($unsigned((~wire4))) ?
              $unsigned(wire1[(3'h5):(2'h2)]) : wire1[(1'h0):(1'h0)]) ?
          reg10 : $signed({(reg15 + $signed(reg19)), $signed({reg10})}));
      reg25 <= wire1;
    end
  always
    @(posedge clk) begin
      reg26 <= ((8'hbc) ?
          {$unsigned($signed((reg10 && reg24))),
              $unsigned(($unsigned((8'ha9)) * (!reg14)))} : $unsigned((reg8[(3'h4):(3'h4)] ~^ ($signed(reg9) + reg11))));
      reg27 <= {{{$signed(reg20), ((wire3 ? (8'hb3) : reg21) & (~|(8'ha5)))},
              (!($unsigned(reg25) ? (^(8'hbe)) : reg15[(2'h2):(2'h2)]))}};
      reg28 <= (&(({reg7[(1'h0):(1'h0)], reg18[(1'h1):(1'h1)]} ?
              wire2 : wire2[(3'h6):(3'h5)]) ?
          reg20 : (({wire0} > (reg15 ~^ reg18)) ?
              $signed($unsigned(reg24)) : $unsigned(reg14))));
    end
  assign wire29 = (+$signed((reg7 * $unsigned(((8'ha4) ? wire3 : reg13)))));
  assign wire30 = $signed((reg13[(3'h5):(2'h3)] ?
                      ($signed((reg19 && wire0)) ?
                          reg15 : ((reg20 ? wire2 : reg15) ?
                              wire29 : (8'hbe))) : $unsigned(wire5[(4'ha):(4'ha)])));
  always
    @(posedge clk) begin
      reg31 <= $unsigned(reg8);
      reg32 <= {((($unsigned(reg15) ?
              (reg24 != (8'hb3)) : ((8'hbb) - reg25)) && ($unsigned(reg26) ?
              $signed((8'hb7)) : reg14)) && $signed($unsigned((reg21 ?
              reg11 : (8'hbd)))))};
    end
  always
    @(posedge clk) begin
      reg33 <= $unsigned($signed({{(reg6 ? wire5 : wire1), (^reg8)}}));
      reg34 <= ($signed(((~^(^~reg12)) != {wire5[(2'h2):(1'h0)]})) ?
          (reg7[(2'h3):(2'h2)] ?
              reg32 : {((wire5 >> reg11) * reg11),
                  reg15[(1'h0):(1'h0)]}) : {$unsigned($signed((~|(8'ha7))))});
      reg35 <= reg18;
      reg36 <= $signed(($signed(((~^wire1) != reg10[(5'h10):(4'hd)])) || reg14));
    end
  assign wire37 = $signed((~($unsigned((~wire30)) ?
                      reg19[(1'h1):(1'h1)] : $unsigned($unsigned(reg12)))));
endmodule
