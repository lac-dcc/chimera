module top
#(parameter param41 = (^(((((8'ha0) >>> (8'hb5)) ? ((8'hac) ? (8'h9e) : (8'ha3)) : (&(8'h9c))) ? ((!(8'hb4)) < (-(8'hb5))) : (((8'hbf) ? (7'h42) : (8'hba)) >= ((8'ha4) ? (8'h9e) : (8'h9e)))) - {(((8'haa) ? (8'hab) : (8'hb9)) << ((8'h9d) ? (8'hbd) : (8'ha3)))})), 
parameter param42 = (param41 + param41))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1a3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire24;
  wire [(3'h6):(1'h0)] wire23;
  wire [(4'hd):(1'h0)] wire22;
  wire signed [(2'h3):(1'h0)] wire21;
  wire [(4'ha):(1'h0)] wire20;
  wire [(4'hc):(1'h0)] wire19;
  wire signed [(4'hd):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire6;
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg [(3'h4):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg36 = (1'h0);
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  reg [(4'h8):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg7 = (1'h0);
  reg [(4'ha):(1'h0)] reg5 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg4 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire6,
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
                 reg26,
                 reg25,
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
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (($signed(wire3[(2'h2):(2'h2)]) ?
          $signed($signed((~wire0))) : wire3[(3'h4):(2'h3)]) > ((($unsigned(wire2) ?
              (!wire2) : ((8'ha0) & wire2)) ?
          $unsigned(wire2) : wire3) << $signed({(8'hbd), wire0})));
      reg5 <= (wire0[(4'h8):(1'h1)] <= ((|{wire1[(3'h5):(1'h1)],
          (^~reg4)}) & $signed({$unsigned(reg4), {wire3}})));
    end
  assign wire6 = (^((wire3[(3'h5):(3'h4)] ?
                     ((wire1 != (8'hbc)) ?
                         (reg4 ?
                             wire3 : wire1) : (reg4 * (8'ha8))) : reg4) ^~ $unsigned(wire2)));
  always
    @(posedge clk) begin
      if (wire0[(2'h2):(2'h2)])
        begin
          reg7 <= ($signed(((8'hbe) <<< wire1)) ? reg4 : (8'hb7));
          reg8 <= reg4[(3'h7):(3'h7)];
          if ($signed(wire3))
            begin
              reg9 <= $signed(((8'h9c) ?
                  $unsigned(($unsigned(reg8) ?
                      reg5 : reg5[(2'h2):(2'h2)])) : $unsigned(wire0)));
              reg10 <= (~&{(($signed(wire2) | wire0[(4'h8):(4'h8)]) << ((reg9 ?
                          reg8 : (7'h41)) ?
                      (wire3 > (8'hb3)) : $unsigned(reg9)))});
              reg11 <= wire2[(4'h8):(1'h1)];
            end
          else
            begin
              reg9 <= (!(^~wire1));
              reg10 <= ($unsigned(wire6) ?
                  ((($unsigned(wire0) ?
                      reg10[(4'h8):(3'h5)] : reg5[(3'h6):(1'h1)]) | wire0[(4'h8):(2'h3)]) ^~ (~((reg11 < reg9) ?
                      (8'hba) : ((7'h42) ?
                          reg7 : wire6)))) : reg5[(1'h0):(1'h0)]);
              reg11 <= wire6;
              reg12 <= ($signed(wire0) + wire0[(1'h1):(1'h0)]);
            end
          if ((!$unsigned((($unsigned((8'had)) >>> reg5[(4'h9):(2'h3)]) ?
              (reg7[(1'h0):(1'h0)] ?
                  reg10 : (wire1 ? reg10 : (8'hb9))) : {{wire6, wire6}}))))
            begin
              reg13 <= {($signed(($unsigned((8'hbf)) ?
                          (reg5 >= wire0) : wire1)) ?
                      reg11[(4'hb):(4'hb)] : {((reg4 || (8'hb8)) ?
                              reg11[(4'hb):(3'h4)] : $unsigned(reg11))})};
              reg14 <= reg7;
              reg15 <= (~|(7'h41));
            end
          else
            begin
              reg13 <= reg12;
              reg14 <= ($signed((8'ha4)) < wire6);
            end
          reg16 <= ((8'ha2) ? (8'hae) : $unsigned(reg10));
        end
      else
        begin
          reg7 <= reg5;
        end
      reg17 <= reg12[(2'h2):(1'h0)];
    end
  assign wire18 = ($unsigned($signed(($signed(reg15) + {reg4}))) ^~ $unsigned(reg9));
  assign wire19 = (~|reg14[(3'h5):(3'h5)]);
  assign wire20 = wire3[(2'h3):(1'h1)];
  assign wire21 = $unsigned($unsigned(wire3[(2'h2):(1'h0)]));
  assign wire22 = wire1[(4'hc):(1'h0)];
  assign wire23 = ({(((wire20 ? wire2 : reg13) ?
                              reg15 : ((8'hbe) ?
                                  (8'hb8) : wire20)) ^ reg16[(4'hb):(3'h4)]),
                          $signed($signed((reg12 ? reg9 : wire6)))} ?
                      $unsigned(wire21[(2'h2):(2'h2)]) : $unsigned((8'h9c)));
  assign wire24 = reg8[(3'h5):(1'h1)];
  always
    @(posedge clk) begin
      if ({$unsigned(reg7[(3'h4):(3'h4)]), reg15[(1'h0):(1'h0)]})
        begin
          reg25 <= reg9[(2'h3):(1'h1)];
          reg26 <= wire2;
          reg27 <= wire21;
        end
      else
        begin
          if ((wire24[(5'h10):(1'h0)] * $unsigned($signed((wire2 ?
              $unsigned(reg16) : (^reg13))))))
            begin
              reg25 <= reg11[(4'ha):(2'h2)];
              reg26 <= reg16;
            end
          else
            begin
              reg25 <= reg11[(3'h6):(2'h2)];
              reg26 <= $signed((~reg12));
              reg27 <= ($unsigned($unsigned($unsigned({reg5, wire18}))) ?
                  (|(~$signed(((8'hb7) ^~ reg11)))) : $unsigned($unsigned(({wire23} != reg15[(3'h5):(3'h4)]))));
            end
        end
      if ((reg11 | $unsigned($unsigned((wire1[(2'h2):(1'h0)] ?
          $signed(wire2) : {wire6, wire21})))))
        begin
          reg28 <= wire3[(3'h5):(2'h3)];
          if (((-wire2[(4'he):(2'h3)]) ? wire0[(4'h8):(4'h8)] : (8'hbf)))
            begin
              reg29 <= ($signed(reg11) <<< ({reg5[(3'h5):(3'h5)],
                  (-(-wire20))} <= ($signed(reg13) & {wire23[(1'h1):(1'h1)],
                  wire0[(2'h3):(1'h0)]})));
              reg30 <= (~{reg13,
                  ((+$unsigned(wire20)) - (((8'hb9) >>> wire21) || (wire20 ?
                      wire24 : reg13)))});
            end
          else
            begin
              reg29 <= {(^~(^~(&reg9[(2'h2):(1'h0)])))};
              reg30 <= ($unsigned($signed(wire19)) ?
                  $unsigned($signed((!{wire3, reg4}))) : reg8[(4'h8):(3'h7)]);
              reg31 <= $signed(((reg5 == $signed($unsigned(reg28))) ?
                  reg30[(4'hc):(1'h0)] : (8'hba)));
            end
          if ($signed(($unsigned($signed(reg29)) >> (8'haa))))
            begin
              reg32 <= wire3;
            end
          else
            begin
              reg32 <= reg16;
              reg33 <= {((7'h44) << ((-(wire22 > reg26)) & {$signed(reg16),
                      reg29[(2'h2):(2'h2)]}))};
            end
        end
      else
        begin
          if ($unsigned($signed((($unsigned(reg5) ?
              (-(8'ha8)) : reg8) << (^reg7)))))
            begin
              reg28 <= $signed(reg15);
              reg29 <= $signed((^(({reg25,
                  reg27} != $signed(reg10)) ~^ wire23[(3'h6):(2'h2)])));
              reg30 <= ($signed(wire3[(2'h2):(2'h2)]) ?
                  $signed(wire24) : (wire6[(2'h3):(1'h0)] - {$unsigned((reg8 ?
                          (8'hb0) : (8'hbd))),
                      $signed(wire23[(1'h1):(1'h0)])}));
              reg31 <= (8'ha9);
              reg32 <= reg9[(2'h2):(2'h2)];
            end
          else
            begin
              reg28 <= (|reg4[(3'h7):(2'h3)]);
              reg29 <= (~^reg8[(4'h8):(4'h8)]);
              reg30 <= $unsigned(wire20[(4'h8):(4'h8)]);
            end
        end
      if ((reg17[(1'h1):(1'h1)] ?
          (((reg31 != wire1) >> $unsigned((-wire20))) ?
              (((^reg7) ? {reg16} : (wire22 - wire2)) ?
                  $signed(reg8[(1'h0):(1'h0)]) : (reg30[(3'h6):(2'h2)] <<< reg13)) : wire21[(1'h0):(1'h0)]) : (~|reg17)))
        begin
          if ($signed({wire23[(3'h4):(2'h2)], (^~((^reg30) >= wire18))}))
            begin
              reg34 <= $signed($signed($signed((!((8'hb9) && reg7)))));
              reg35 <= reg33;
            end
          else
            begin
              reg34 <= reg35;
            end
          if ($unsigned($unsigned($signed($signed(wire1[(1'h0):(1'h0)])))))
            begin
              reg36 <= {$unsigned($signed(wire20[(3'h5):(1'h0)]))};
            end
          else
            begin
              reg36 <= (((~|((wire22 << (8'h9c)) ?
                      (reg15 < (8'hab)) : ((8'hb8) <= reg29))) == reg13[(3'h6):(1'h1)]) ?
                  reg17[(4'hb):(3'h5)] : (+wire21));
              reg37 <= ((~^(~{((8'hbe) <<< wire23),
                  (~&wire22)})) > ($signed(wire19) | (reg17[(3'h4):(1'h0)] ?
                  (wire2 >> ((8'hb5) ? reg15 : (8'h9f))) : wire22)));
              reg38 <= reg36[(3'h4):(1'h0)];
              reg39 <= {($signed($signed((!wire3))) ?
                      reg25 : reg15[(4'h8):(2'h3)])};
              reg40 <= (|reg37);
            end
        end
      else
        begin
          if ($unsigned((((^~{wire0}) ?
                  reg30 : (reg39[(1'h1):(1'h1)] <= wire19)) ?
              wire2[(3'h5):(1'h0)] : {reg30, (|$signed(reg15))})))
            begin
              reg34 <= $signed(wire20);
              reg35 <= $signed(($unsigned(reg34[(3'h5):(1'h1)]) << reg7));
              reg36 <= $unsigned(wire3);
              reg37 <= $unsigned(reg33);
            end
          else
            begin
              reg34 <= {((~|($signed(reg40) > (reg38 ?
                      wire22 : reg4))) >= reg29[(4'hc):(3'h4)]),
                  (8'hb1)};
              reg35 <= {($signed(((~^reg9) ?
                      reg15 : (8'hb4))) ^ (~^{{wire21}})),
                  reg32[(2'h3):(1'h1)]};
            end
        end
    end
endmodule
