module top
#(parameter param46 = ((+((((8'hbb) >= (7'h44)) ? ((8'hb0) ^~ (8'hb5)) : ((8'hbf) <= (8'haf))) ~^ (+{(8'ha7)}))) ? (^{((^~(8'h9f)) + {(8'hbb), (8'hb3)}), (!((8'hb1) | (8'haa)))}) : {((((8'hba) >= (8'ha8)) ? (~&(8'ha6)) : ((7'h43) | (7'h40))) >>> ((^~(8'hb9)) != (~^(8'ha2))))}), 
parameter param47 = ((^~(8'hb7)) ? (((8'h9c) > (param46 ? (~param46) : (param46 >>> param46))) << (+(~(param46 && param46)))) : (|(({param46, param46} <<< param46) ? param46 : (~&{param46})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1ff):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire43;
  wire [(4'h8):(1'h0)] wire42;
  wire [(4'h8):(1'h0)] wire41;
  wire signed [(5'h11):(1'h0)] wire40;
  wire [(4'hd):(1'h0)] wire31;
  wire [(2'h2):(1'h0)] wire24;
  wire signed [(4'hc):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire22;
  wire [(3'h4):(1'h0)] wire21;
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  reg [(2'h3):(1'h0)] reg44 = (1'h0);
  reg [(5'h10):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(4'hc):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg36 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg25 = (1'h0);
  reg [(2'h3):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(2'h2):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg4 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire31,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg45,
                 reg44,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
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
      if ($signed({(wire2 != wire3[(1'h1):(1'h1)])}))
        begin
          if (($signed(($signed($signed(wire2)) >>> (wire1 ?
                  (7'h44) : (wire3 ? wire2 : wire1)))) ?
              $signed(wire3[(1'h1):(1'h1)]) : wire1))
            begin
              reg4 <= $unsigned(wire3);
              reg5 <= {(~^wire1),
                  (wire3[(1'h0):(1'h0)] ?
                      ((~^wire3) <= (&$signed(reg4))) : $signed($signed((|reg4))))};
              reg6 <= $unsigned((~^$signed(reg4)));
              reg7 <= (8'hb8);
              reg8 <= (&wire0);
            end
          else
            begin
              reg4 <= $signed(({$unsigned(reg6), $signed(((7'h42) | reg6))} ?
                  ((wire1[(3'h6):(3'h5)] ?
                      reg4 : $signed((8'ha0))) ~^ reg8[(2'h3):(2'h3)]) : (reg7[(4'h8):(1'h1)] > {$unsigned(reg8)})));
              reg5 <= reg7[(2'h2):(2'h2)];
              reg6 <= (~^($unsigned({wire2[(5'h13):(5'h13)],
                  $unsigned(wire3)}) < ($unsigned($unsigned(reg8)) << $signed($unsigned((7'h40))))));
              reg7 <= $signed($signed({$signed($unsigned(wire3)),
                  (~|(wire3 ? wire0 : wire2))}));
            end
          if ($signed(($unsigned((reg7 ~^ $unsigned(wire3))) > reg7)))
            begin
              reg9 <= $unsigned(($unsigned($unsigned(wire3)) <= ((~^(wire0 <<< wire0)) - wire3)));
              reg10 <= (^~(8'ha6));
            end
          else
            begin
              reg9 <= $signed($signed(reg8));
            end
          reg11 <= (8'hb5);
          reg12 <= $unsigned({(~wire2[(4'he):(3'h5)])});
        end
      else
        begin
          reg4 <= {$unsigned(($unsigned((~&reg4)) == reg10)),
              (reg4[(4'h8):(3'h4)] ?
                  $unsigned({{(7'h42)}}) : (^$unsigned((wire3 > wire1))))};
        end
      if ({reg4[(4'hd):(4'h8)], reg8[(4'he):(4'h9)]})
        begin
          reg13 <= $unsigned(reg5[(2'h3):(2'h3)]);
          if ($unsigned(reg13[(1'h0):(1'h0)]))
            begin
              reg14 <= $signed($signed($signed({(wire3 ? reg11 : (8'hb2))})));
              reg15 <= $signed($signed($unsigned(reg4[(4'ha):(3'h7)])));
              reg16 <= wire3[(1'h0):(1'h0)];
              reg17 <= (reg4[(4'ha):(3'h7)] <= $signed($signed($unsigned($signed((8'ha5))))));
            end
          else
            begin
              reg14 <= reg14[(4'ha):(4'ha)];
              reg15 <= $signed({$unsigned((+(wire3 ? reg8 : (8'haf)))),
                  (-(-(~|reg7)))});
              reg16 <= reg6;
            end
        end
      else
        begin
          if ($unsigned(reg9))
            begin
              reg13 <= $unsigned($signed((reg6 >> wire3)));
              reg14 <= $signed($signed(reg4));
            end
          else
            begin
              reg13 <= $signed(wire0[(1'h1):(1'h1)]);
              reg14 <= reg15[(4'hd):(1'h0)];
              reg15 <= {wire2[(3'h4):(2'h3)]};
            end
          reg16 <= reg16;
        end
      reg18 <= reg7;
      reg19 <= $signed($signed((^~$signed((8'ha5)))));
      reg20 <= $unsigned(reg19[(4'hf):(3'h6)]);
    end
  assign wire21 = $signed(reg4);
  assign wire22 = $signed($unsigned(reg19[(4'hb):(4'ha)]));
  assign wire23 = (~($signed($unsigned(reg16[(4'hc):(4'hb)])) >>> (~(8'ha6))));
  assign wire24 = $unsigned(($unsigned($signed({wire23})) ?
                      (~(reg8 <= (reg19 ?
                          reg7 : (8'ha8)))) : reg11[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      reg25 <= (($signed($unsigned($unsigned(reg5))) & (($unsigned(wire21) ?
              $signed(reg10) : (wire23 + wire3)) ?
          {$signed(reg5)} : wire22)) && $unsigned((&reg6[(4'hc):(3'h7)])));
      if (((wire2 ?
              $unsigned($signed($unsigned(reg19))) : $unsigned($signed($signed((7'h43))))) ?
          wire22 : $signed((+(reg15 ?
              reg19[(3'h4):(1'h1)] : ((8'ha6) ? (8'ha3) : reg17))))))
        begin
          reg26 <= (reg11[(2'h2):(2'h2)] ?
              wire2 : (-({(reg11 >>> reg9), (+(8'hbe))} ?
                  {$unsigned((8'ha8))} : ((|wire23) ?
                      (reg17 ? reg20 : reg12) : $unsigned(reg20)))));
          reg27 <= {(~(reg8 ~^ (&wire22))), $unsigned($unsigned({wire0}))};
          reg28 <= reg13[(1'h1):(1'h1)];
          if (wire2)
            begin
              reg29 <= reg11[(2'h2):(2'h2)];
            end
          else
            begin
              reg29 <= reg15[(4'hb):(1'h1)];
            end
        end
      else
        begin
          reg26 <= wire1;
          reg27 <= (!{((^wire3[(1'h0):(1'h0)]) ^~ $unsigned($signed(reg29)))});
        end
      reg30 <= (~^reg27[(1'h0):(1'h0)]);
    end
  assign wire31 = $signed((^~reg30[(4'hc):(4'h9)]));
  always
    @(posedge clk) begin
      reg32 <= wire21;
      reg33 <= $unsigned(reg18);
      reg34 <= $signed(reg15[(3'h6):(1'h1)]);
    end
  always
    @(posedge clk) begin
      if ((reg10 ? reg5 : $unsigned($unsigned($signed((!reg18))))))
        begin
          reg35 <= wire23;
        end
      else
        begin
          reg35 <= wire23;
        end
      reg36 <= ((+($signed($signed(reg35)) ?
          ((-reg7) ?
              (reg9 + reg10) : $unsigned(reg25)) : (^~$unsigned(reg33)))) ^~ $signed(reg18[(4'h8):(3'h5)]));
      reg37 <= (8'hb0);
      reg38 <= reg28[(5'h10):(4'h8)];
      reg39 <= (reg32 ?
          $signed($signed({wire21[(1'h0):(1'h0)],
              (|reg12)})) : $signed({(&$unsigned(reg6))}));
    end
  assign wire40 = $unsigned(((reg34[(1'h0):(1'h0)] ?
                          reg34 : $unsigned($signed(reg25))) ?
                      reg8 : reg12[(4'h9):(4'h8)]));
  assign wire41 = $unsigned({(~&((^(8'ha2)) ~^ reg7)), reg30});
  assign wire42 = (reg29 ?
                      $unsigned($unsigned($signed((reg29 || (8'hba))))) : ({(~&$unsigned((8'hb5)))} | ((|$unsigned(reg9)) ^ reg11)));
  assign wire43 = reg14;
  always
    @(posedge clk) begin
      reg44 <= ({({reg36} <= ($signed(reg36) ~^ $signed(reg6)))} ?
          reg15 : $unsigned(($signed((wire23 ? wire42 : (8'h9f))) ?
              ((~&wire21) ?
                  reg25[(3'h6):(2'h3)] : ((8'ha4) | wire1)) : (8'ha2))));
      reg45 <= (reg44 ?
          (((reg10[(1'h0):(1'h0)] ? wire43 : (reg9 >= wire22)) && ((~&reg28) ?
                  $signed(wire31) : wire31[(4'hb):(3'h5)])) ?
              ($unsigned(reg7) >> $unsigned($signed(wire40))) : {((|reg12) ^ $unsigned(wire21))}) : (^reg44));
    end
endmodule
