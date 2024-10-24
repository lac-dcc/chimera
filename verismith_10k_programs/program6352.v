module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h28d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire54;
  wire signed [(5'h12):(1'h0)] wire53;
  wire signed [(3'h4):(1'h0)] wire52;
  wire [(4'he):(1'h0)] wire51;
  wire signed [(5'h13):(1'h0)] wire50;
  wire signed [(4'ha):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire48;
  wire [(4'hf):(1'h0)] wire35;
  wire [(5'h12):(1'h0)] wire34;
  wire signed [(5'h11):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire32;
  wire [(4'ha):(1'h0)] wire31;
  wire [(3'h7):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire4;
  reg signed [(5'h15):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg44 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(4'h8):(1'h0)] reg37 = (1'h0);
  reg [(3'h7):(1'h0)] reg36 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire6,
                 wire5,
                 wire4,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
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
  assign wire4 = (wire2 - ((^~{((8'had) * wire0)}) <= (-$unsigned((7'h40)))));
  assign wire5 = $unsigned(($signed((wire2[(4'h9):(3'h6)] * $unsigned(wire2))) >>> wire2[(1'h1):(1'h0)]));
  assign wire6 = wire4[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      if ((^(-wire4)))
        begin
          reg7 <= (~|wire0);
          reg8 <= ((&(($unsigned(reg7) * {wire0, wire3}) ?
              {$unsigned((8'hbf))} : (wire1[(3'h7):(1'h0)] * $signed(reg7)))) >= ($signed((~|wire4[(3'h4):(2'h3)])) ?
              (+((wire2 && (8'ha5)) == (8'hbb))) : wire2));
          reg9 <= (8'ha0);
        end
      else
        begin
          reg7 <= $unsigned((wire2 ?
              $signed((^$unsigned(wire3))) : $unsigned(reg9)));
          reg8 <= (reg9 > {wire3,
              (wire3[(1'h0):(1'h0)] ?
                  ($signed(wire5) ?
                      reg8[(3'h6):(1'h0)] : (|wire2)) : $signed(wire2))});
          if (wire3[(2'h2):(2'h2)])
            begin
              reg9 <= $unsigned($signed(($unsigned($unsigned(wire1)) & (^(wire2 <= (8'hb7))))));
              reg10 <= (|((wire1[(3'h6):(1'h0)] ?
                      ((~(8'hbf)) ?
                          (&(8'h9c)) : wire1[(4'hd):(2'h3)]) : wire2) ?
                  (~&wire2) : (+reg9[(4'hf):(4'hd)])));
              reg11 <= ($unsigned(((8'ha7) ?
                  ((reg7 ?
                      reg7 : wire0) <<< (wire6 | wire4)) : wire5)) >= (!{wire4[(4'hb):(2'h2)],
                  $unsigned((reg10 ? wire5 : reg7))}));
              reg12 <= ({reg11,
                  ((&(&(8'hbc))) ?
                      ($unsigned((8'ha5)) >>> ((8'h9d) ?
                          reg10 : wire1)) : $unsigned(((8'hae) ?
                          wire2 : wire6)))} >> reg11[(2'h2):(2'h2)]);
            end
          else
            begin
              reg9 <= {$signed($signed($unsigned((reg12 ^~ reg9)))),
                  wire6[(2'h3):(2'h2)]};
              reg10 <= (^$signed((~|reg12)));
              reg11 <= (+((((~^wire1) ~^ wire1) + $unsigned(wire0)) >> $unsigned((|$signed(reg10)))));
              reg12 <= reg12;
            end
          if ((~|reg10))
            begin
              reg13 <= $unsigned(wire2);
              reg14 <= $signed((($unsigned((wire1 ^ reg11)) <= (8'hb7)) ?
                  (reg13[(1'h0):(1'h0)] ?
                      $unsigned($signed(reg10)) : $signed((wire1 >> (8'h9f)))) : (~wire6)));
              reg15 <= {{{{wire6}},
                      $signed(($signed(reg9) ?
                          wire4[(4'h8):(2'h2)] : wire1[(4'ha):(3'h6)]))},
                  $unsigned({(~|(8'hb5))})};
              reg16 <= $unsigned((~|(8'hb6)));
            end
          else
            begin
              reg13 <= wire6[(1'h0):(1'h0)];
              reg14 <= ($unsigned((^($signed(reg14) ?
                  (+reg8) : (reg7 ?
                      reg11 : (8'h9f))))) <= {$signed(wire2[(4'hf):(2'h3)]),
                  $unsigned($signed(wire3))});
              reg15 <= {($signed($signed((wire0 ?
                      reg9 : reg10))) == $signed($unsigned((~|wire5)))),
                  $signed(($unsigned($signed(reg9)) || (~$unsigned(wire0))))};
              reg16 <= (((wire5[(4'hc):(3'h5)] ? $signed(wire0) : reg13) ?
                      (wire3[(1'h1):(1'h1)] < reg7) : (reg13[(1'h0):(1'h0)] == (!$unsigned(wire2)))) ?
                  (~|(~|((reg16 >= wire3) - $signed(reg8)))) : ((wire6 ~^ $signed((wire4 ?
                      wire5 : (8'hb4)))) <<< (reg8 ?
                      (7'h42) : {(~wire4), (+wire6)})));
            end
          reg17 <= $unsigned({reg8});
        end
      if (reg16)
        begin
          reg18 <= (reg15[(4'h9):(4'h8)] <<< ($signed(reg7[(5'h11):(3'h5)]) ?
              (~^$signed(wire5[(4'ha):(4'h8)])) : $unsigned(reg13)));
          if ({$unsigned((~&wire1))})
            begin
              reg19 <= ($unsigned({reg10[(4'hb):(2'h2)],
                  {(wire4 > reg12)}}) + $signed((+($unsigned(wire6) == (~^reg10)))));
              reg20 <= $unsigned(((!wire2) >= $unsigned((~^$unsigned(reg8)))));
              reg21 <= reg16;
              reg22 <= (~&reg11);
              reg23 <= $signed((wire5[(4'h8):(3'h4)] != (^~(~^(&wire6)))));
            end
          else
            begin
              reg19 <= $signed((~&{$unsigned($unsigned(reg15)),
                  $unsigned((~reg11))}));
              reg20 <= (wire0[(3'h4):(1'h0)] ? (8'hb4) : reg15);
            end
          if (wire3[(1'h1):(1'h0)])
            begin
              reg24 <= ($signed(reg8[(3'h4):(2'h2)]) ?
                  reg19[(1'h1):(1'h0)] : wire5);
            end
          else
            begin
              reg24 <= wire6;
              reg25 <= reg8[(3'h7):(2'h3)];
              reg26 <= (^~(($signed(reg19) == wire3[(1'h0):(1'h0)]) || (wire2 ?
                  ((^reg17) != $unsigned(reg17)) : $unsigned((reg24 ?
                      reg23 : reg23)))));
              reg27 <= reg16;
              reg28 <= $signed($signed($signed(($unsigned(wire2) >>> (^~(8'hb8))))));
            end
          reg29 <= (wire3[(1'h0):(1'h0)] && (reg10 ?
              (^$signed(reg16[(2'h2):(1'h0)])) : $signed((^$signed(reg17)))));
          reg30 <= (7'h44);
        end
      else
        begin
          reg18 <= {({reg9} + (reg22[(3'h4):(1'h1)] | $signed((~^reg19))))};
          reg19 <= reg25[(4'h9):(2'h2)];
          reg20 <= $unsigned(reg23[(4'he):(4'ha)]);
          if ($unsigned($unsigned(reg20)))
            begin
              reg21 <= (reg21 ?
                  $unsigned($signed({$signed(reg7),
                      $unsigned((7'h43))})) : reg29[(2'h2):(1'h0)]);
            end
          else
            begin
              reg21 <= ((&({reg30[(1'h0):(1'h0)]} * $unsigned((~reg11)))) ?
                  $signed({(reg25 ^~ (reg14 == wire1))}) : (^(reg20 ?
                      wire6 : (-$unsigned(reg15)))));
              reg22 <= {{($signed((reg7 ? reg26 : wire4)) ?
                          (^~(+reg19)) : (~$signed(wire6)))},
                  $unsigned(reg28)};
              reg23 <= (((!{$signed(reg21)}) >= reg15) ^ {{({wire1} >> wire5),
                      ($signed(reg22) ? (wire5 && reg13) : (-reg14))},
                  $unsigned(reg25)});
              reg24 <= $unsigned(reg29);
              reg25 <= $signed({reg25});
            end
        end
    end
  assign wire31 = reg28;
  assign wire32 = reg15;
  assign wire33 = wire5[(3'h4):(1'h1)];
  assign wire34 = (($signed({(^wire33)}) < reg23) <= $unsigned((~&{wire1[(4'ha):(4'h9)]})));
  assign wire35 = wire5[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ((reg10[(3'h5):(3'h5)] >= (((&reg23[(1'h0):(1'h0)]) ^ $signed(((8'ha3) << wire33))) ^~ (8'hba))))
        begin
          if ($unsigned((-{$signed(wire33)})))
            begin
              reg36 <= (~^reg16[(4'h8):(3'h6)]);
            end
          else
            begin
              reg36 <= (~($signed((reg12[(2'h2):(2'h2)] & reg19[(3'h5):(2'h2)])) ?
                  (8'ha0) : ((((8'haa) ? reg12 : reg28) ?
                      (reg30 + wire2) : (8'hba)) < (reg16 > {reg21}))));
              reg37 <= $unsigned($signed(((reg19 > wire34[(5'h10):(4'hc)]) || ((~wire34) <= $signed(wire0)))));
              reg38 <= wire4;
            end
          reg39 <= (((^((reg19 ? reg27 : wire2) ?
                  $signed(wire32) : $signed(wire5))) || $signed({wire33[(1'h1):(1'h1)]})) ?
              (+(~^((reg26 + (8'hb2)) ?
                  $unsigned(wire34) : {reg7, reg25}))) : reg25);
          if ($signed((wire0 ^ (reg29[(1'h1):(1'h0)] ?
              ((wire4 ? (7'h43) : (7'h43)) ?
                  reg15[(3'h7):(1'h0)] : (reg10 ? wire5 : reg21)) : reg25))))
            begin
              reg40 <= reg9[(3'h4):(2'h3)];
              reg41 <= $signed(wire4[(3'h6):(1'h0)]);
              reg42 <= $signed($unsigned({(8'ha4)}));
              reg43 <= $signed($unsigned(wire2[(4'hb):(1'h0)]));
              reg44 <= ($unsigned(($unsigned((reg15 ?
                      reg15 : wire5)) || reg21[(3'h6):(3'h5)])) ?
                  ($unsigned($unsigned(reg30[(3'h6):(3'h6)])) ?
                      ($unsigned({reg40,
                          wire0}) == $unsigned(wire0[(1'h0):(1'h0)])) : wire34[(3'h6):(2'h3)]) : wire3);
            end
          else
            begin
              reg40 <= (reg27[(3'h7):(1'h0)] == (-($signed((~(8'hbb))) >>> $signed($unsigned((8'ha4))))));
              reg41 <= ($signed((reg21[(2'h3):(1'h1)] ?
                  (^{reg7,
                      wire6}) : ($unsigned((8'haf)) ~^ reg13))) >> $unsigned(((8'h9f) ?
                  (wire32[(2'h2):(2'h2)] ?
                      $unsigned(reg42) : $signed(wire4)) : (wire6[(3'h5):(3'h5)] - {reg30}))));
              reg42 <= reg27[(4'hd):(1'h1)];
              reg43 <= reg25;
            end
          reg45 <= $signed({(reg36[(3'h7):(3'h6)] ?
                  $signed((reg8 ?
                      reg18 : (7'h43))) : $signed(((8'hb3) * wire35))),
              ($signed({reg38}) >= reg21)});
        end
      else
        begin
          if ($unsigned({(-(((8'ha7) ? wire2 : wire6) ^ reg22)),
              wire6[(3'h5):(2'h3)]}))
            begin
              reg36 <= (($signed(wire31[(1'h1):(1'h0)]) ?
                      (wire0[(2'h2):(1'h1)] ?
                          wire33 : {reg14,
                              reg38[(3'h4):(3'h4)]}) : $unsigned(wire4)) ?
                  reg10[(4'hd):(4'h9)] : wire5[(3'h4):(1'h0)]);
            end
          else
            begin
              reg36 <= $unsigned((reg42 + reg42[(5'h12):(4'hb)]));
              reg37 <= {reg12, (reg40 << reg36)};
              reg38 <= {(~|((reg45 != $signed(reg39)) > (!(reg17 ?
                      (8'ha6) : reg11))))};
            end
        end
      reg46 <= $signed({{(!(7'h43))}, $unsigned(reg23)});
      reg47 <= $unsigned($signed(($unsigned((reg19 ?
          reg14 : reg9)) & (wire35[(3'h4):(1'h0)] && (reg30 > reg7)))));
    end
  assign wire48 = (($signed(({reg18} > {reg21, (7'h40)})) ?
                          $unsigned((7'h44)) : reg11) ?
                      ({reg37[(3'h4):(1'h0)]} ~^ ((~&(reg24 ?
                          wire0 : reg47)) > (~&$signed(reg17)))) : (-(~($unsigned(reg10) ?
                          $unsigned(reg14) : $unsigned(reg20)))));
  assign wire49 = {reg11,
                      (($unsigned((~&reg29)) ~^ reg25[(2'h2):(1'h1)]) ?
                          ($unsigned((!reg44)) - $unsigned($unsigned(reg46))) : (~&(7'h40)))};
  assign wire50 = (reg43 ? wire49 : reg29[(2'h2):(1'h0)]);
  assign wire51 = (8'hb5);
  assign wire52 = $signed($unsigned(reg18));
  assign wire53 = (^~($signed(($signed(wire1) * $unsigned((8'hb8)))) & $signed($signed($unsigned((8'h9e))))));
  assign wire54 = wire6[(3'h5):(1'h1)];
endmodule
