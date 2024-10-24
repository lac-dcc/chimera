module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1d1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire43;
  wire signed [(2'h2):(1'h0)] wire42;
  wire signed [(4'hb):(1'h0)] wire41;
  wire [(4'hc):(1'h0)] wire40;
  wire [(5'h10):(1'h0)] wire39;
  wire [(2'h3):(1'h0)] wire38;
  wire [(5'h11):(1'h0)] wire32;
  wire [(3'h5):(1'h0)] wire31;
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  reg [(4'h8):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg4 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire32,
                 wire31,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
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
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire3[(1'h0):(1'h0)];
      if ((&$unsigned($signed((~^(wire3 ? wire3 : wire0))))))
        begin
          reg5 <= (reg4 << $unsigned($signed((!(wire0 >> wire3)))));
          reg6 <= ({((((8'hba) ? wire3 : wire1) | (~&wire0)) & (|(~^(8'ha1)))),
                  ((&$unsigned(reg5)) + reg4[(4'h8):(2'h2)])} ?
              (reg5 ?
                  $unsigned((~&wire0)) : $unsigned(($signed(wire0) ?
                      $unsigned(reg5) : reg4[(1'h0):(1'h0)]))) : {$signed(reg5)});
          reg7 <= (wire1[(2'h3):(1'h1)] ?
              (({(wire3 != reg6), (&wire2)} ?
                      (((7'h42) <= wire3) & (reg4 ?
                          wire1 : (8'hb8))) : (reg6 << (wire2 && wire2))) ?
                  (wire1 ?
                      ($unsigned(reg4) <= ((8'h9c) == (8'hac))) : ((^wire0) ~^ $signed((8'hbd)))) : wire1[(4'h8):(3'h6)]) : wire3);
          if ((wire3 && reg7))
            begin
              reg8 <= reg4;
              reg9 <= reg6;
            end
          else
            begin
              reg8 <= (~|reg6);
              reg9 <= reg7;
              reg10 <= (~&$unsigned((wire0 ?
                  reg6[(1'h0):(1'h0)] : reg4[(3'h6):(3'h5)])));
            end
          if ((reg5 ?
              reg4 : (~$unsigned((reg10[(4'hd):(4'hb)] & $signed(wire2))))))
            begin
              reg11 <= reg4[(3'h5):(2'h3)];
            end
          else
            begin
              reg11 <= (-reg10);
              reg12 <= ((reg5[(1'h0):(1'h0)] ?
                  {$signed({wire0, wire3}),
                      (reg7[(4'h8):(3'h4)] ^ {reg8})} : reg9) && $signed((reg5[(3'h4):(1'h1)] + ($unsigned(reg6) ?
                  $unsigned(reg7) : $unsigned(reg8)))));
              reg13 <= reg5[(3'h7):(1'h0)];
              reg14 <= $signed((&{reg7[(3'h6):(2'h2)]}));
              reg15 <= ($signed($signed(((!reg5) ?
                      {reg7, reg4} : (reg8 ~^ reg14)))) ?
                  ({wire2[(3'h7):(3'h4)], wire2[(2'h3):(2'h2)]} ?
                      (&(+reg8)) : reg6) : ((8'hbd) == (+reg14)));
            end
        end
      else
        begin
          if ($signed((reg8 ?
              (~|($unsigned(reg13) && (&wire2))) : (~&((~^reg4) && (reg14 & (8'hb6)))))))
            begin
              reg5 <= reg11;
              reg6 <= ($signed((~|$unsigned(reg7))) ?
                  (((&$signed(wire3)) ?
                          ({wire1, reg12} ?
                              (^reg4) : reg5[(2'h2):(2'h2)]) : reg9) ?
                      reg6 : (~&($unsigned(reg9) <= $unsigned((8'hbf))))) : $unsigned($unsigned(((reg12 ?
                      reg14 : reg11) != reg7[(4'ha):(1'h0)]))));
              reg7 <= ((!reg6) == ((8'ha8) ?
                  ($signed(wire2) ?
                      reg4 : $signed($unsigned(reg6))) : $unsigned($signed($unsigned(reg7)))));
              reg8 <= $unsigned((wire2 ?
                  wire2 : $unsigned((reg11 ?
                      (reg10 ? reg10 : reg15) : (~&wire2)))));
              reg9 <= reg7[(4'hc):(3'h4)];
            end
          else
            begin
              reg5 <= (8'hbe);
              reg6 <= {{(~^((~&wire2) ? (wire0 || reg13) : (8'ha5))),
                      $unsigned(wire1)}};
              reg7 <= reg6;
            end
          reg10 <= reg15[(2'h2):(2'h2)];
          reg11 <= $signed($unsigned(((~|reg12) <<< $signed(reg9))));
          reg12 <= (8'ha4);
        end
      if ($signed(reg13[(4'hb):(2'h2)]))
        begin
          reg16 <= $signed(($signed({$unsigned((7'h41))}) || $signed(reg15)));
          reg17 <= ((^~$signed($unsigned(reg7[(3'h6):(3'h4)]))) - {$unsigned(({(8'h9f)} ?
                  (wire1 ? (8'hac) : reg10) : (reg10 ? (8'hb1) : reg9))),
              $signed((8'hb8))});
        end
      else
        begin
          reg16 <= $signed({reg10[(4'ha):(4'h9)], reg7});
        end
      if ((!reg8[(2'h3):(2'h2)]))
        begin
          reg18 <= $signed($unsigned({reg17}));
          reg19 <= $unsigned($unsigned(reg8));
        end
      else
        begin
          if ((reg15 ? reg13 : ((8'hb9) ? reg10 : wire2[(4'ha):(4'h8)])))
            begin
              reg18 <= reg10;
              reg19 <= (8'hbd);
              reg20 <= ($unsigned($signed(wire1[(2'h3):(2'h3)])) ?
                  reg18 : $unsigned((wire3 ?
                      $signed(((8'haf) << reg11)) : reg8)));
              reg21 <= reg9[(3'h6):(2'h3)];
            end
          else
            begin
              reg18 <= $unsigned((wire3[(1'h1):(1'h0)] == reg21));
              reg19 <= ((~(~^$unsigned(reg15))) + reg20[(1'h0):(1'h0)]);
            end
          if ((8'ha3))
            begin
              reg22 <= $signed(($signed((|$unsigned(reg18))) ?
                  {$signed(reg8)} : {reg7[(3'h5):(3'h4)], reg6}));
            end
          else
            begin
              reg22 <= (~^($unsigned((((8'ha4) ? (8'ha0) : reg20) ?
                  reg5 : (reg16 >> reg7))) && ((-((8'hbb) ?
                  reg19 : (8'hbd))) <= $signed((~^reg17)))));
              reg23 <= $signed((~|reg9));
              reg24 <= {reg18[(4'h9):(3'h5)]};
              reg25 <= reg5[(3'h6):(3'h6)];
              reg26 <= (~|{($signed({reg24}) << reg13[(2'h3):(1'h0)]), reg23});
            end
          reg27 <= {(($signed(reg24) < wire0) ?
                  (|$unsigned((reg6 ? (8'hb4) : wire0))) : $unsigned(({reg7,
                      reg18} >= reg8[(1'h1):(1'h1)]))),
              reg16[(2'h3):(2'h2)]};
          reg28 <= reg11;
          reg29 <= wire0;
        end
      reg30 <= $unsigned($unsigned({{(reg19 && (8'hb0))}}));
    end
  assign wire31 = (wire2[(2'h2):(1'h0)] ?
                      reg18 : ((8'h9f) - {((~&wire1) ?
                              (reg29 ? reg29 : reg23) : reg18[(2'h2):(1'h0)]),
                          (~^reg10)}));
  assign wire32 = {$unsigned({{(reg20 <<< (8'hb4)), (wire3 * (7'h42))}}),
                      {{reg16[(3'h6):(1'h1)], reg5[(3'h6):(3'h4)]},
                          reg22[(3'h7):(1'h0)]}};
  always
    @(posedge clk) begin
      reg33 <= $unsigned($unsigned(wire31[(2'h3):(1'h0)]));
      reg34 <= ($signed($signed({reg9[(4'hb):(4'ha)]})) ?
          (8'ha9) : (~^(reg8 - (+(wire2 * wire3)))));
      if ({($unsigned(reg10[(3'h4):(2'h2)]) ?
              $signed(($signed(reg4) ^~ (reg26 ?
                  reg24 : wire1))) : reg22[(4'h9):(3'h6)]),
          ((reg8 >= ((^~reg25) && wire1)) ?
              reg30 : $signed($signed($unsigned(wire31))))})
        begin
          reg35 <= ((($unsigned(reg13[(3'h7):(2'h3)]) ?
              $unsigned((8'hb2)) : {reg25[(1'h1):(1'h0)],
                  $unsigned(reg9)}) && (|(((8'ha7) < reg7) ?
              {reg34, (8'hb7)} : reg4[(4'ha):(1'h1)]))) | reg7);
          reg36 <= $signed(reg26[(3'h6):(3'h6)]);
        end
      else
        begin
          reg35 <= reg6;
          reg36 <= $signed(({wire31} > ((8'hba) < $unsigned(reg6))));
          reg37 <= $unsigned(($unsigned($unsigned(wire32)) ?
              $signed($unsigned($unsigned(reg36))) : wire2[(4'hc):(4'h8)]));
        end
    end
  assign wire38 = (reg5[(2'h2):(1'h0)] ?
                      ((-{reg12, ((8'hba) ? reg11 : reg29)}) ?
                          ((-(8'haf)) ?
                              ((reg5 ? (8'hb0) : reg14) ?
                                  reg36 : (wire2 - wire2)) : $signed(wire32)) : (wire1 - {(~|reg29),
                              $signed(reg29)})) : reg10[(1'h1):(1'h0)]);
  assign wire39 = (-reg9);
  assign wire40 = (($unsigned((((8'had) ? reg15 : reg22) ?
                      $unsigned(wire31) : reg17)) & {(reg9 ^~ (reg25 < reg22))}) == (reg11 && $signed(((reg11 << reg27) ?
                      $unsigned(wire2) : ((8'ha8) >> reg37)))));
  assign wire41 = reg5[(3'h6):(2'h2)];
  assign wire42 = ((($signed(wire39) && {wire40}) ?
                          $unsigned($signed(reg18[(4'h8):(1'h1)])) : (((reg15 ?
                              reg18 : reg25) >>> (^~reg37)) - reg28[(1'h0):(1'h0)])) ?
                      {(reg25 ?
                              $unsigned($unsigned(reg27)) : (wire3[(1'h0):(1'h0)] ?
                                  reg29 : $unsigned(reg21)))} : $unsigned((wire32 && reg29)));
  assign wire43 = wire39[(4'he):(3'h4)];
endmodule
