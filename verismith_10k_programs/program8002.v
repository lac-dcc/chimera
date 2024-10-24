module top
#(parameter param45 = ((8'hba) ? (8'hb1) : ({((7'h40) ? ((8'hb7) | (8'h9c)) : ((7'h42) <= (8'h9f)))} ^~ (+((^~(7'h44)) - ((8'hbe) ? (8'ha0) : (8'hb5)))))), 
parameter param46 = param45)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1af):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire44;
  wire [(3'h5):(1'h0)] wire43;
  wire signed [(3'h5):(1'h0)] wire42;
  wire signed [(3'h7):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire4;
  reg signed [(5'h14):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg40 = (1'h0);
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(3'h4):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(4'hb):(1'h0)] reg30 = (1'h0);
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg8 = (1'h0);
  reg [(2'h2):(1'h0)] reg7 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire6,
                 wire5,
                 wire4,
                 reg41,
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
  assign wire4 = $signed(wire0[(4'h8):(1'h0)]);
  assign wire5 = ((&(^((wire2 & wire3) ?
                     wire3 : (wire1 == wire2)))) <= $signed((~(~&$unsigned(wire4)))));
  assign wire6 = wire3;
  always
    @(posedge clk) begin
      if ($signed(((~|wire5[(4'hb):(3'h6)]) ?
          $signed((((8'hab) ?
              wire4 : wire3) << wire2[(1'h1):(1'h1)])) : $signed($signed((wire0 >>> wire4))))))
        begin
          if ((((!$unsigned(wire2)) ?
                  (wire0[(2'h3):(2'h3)] != ((-wire2) <<< (wire0 ?
                      (8'ha5) : wire5))) : wire3) ?
              ((wire4[(4'hc):(4'hb)] >= wire4) >= wire4) : wire3))
            begin
              reg7 <= $signed({(((~|wire6) * $unsigned(wire1)) ?
                      ($unsigned((8'hb9)) ?
                          $unsigned(wire0) : (8'had)) : {{wire5, wire0}})});
              reg8 <= (^(~(wire2 * {(wire2 <<< wire4), (~&(7'h44))})));
              reg9 <= wire1;
            end
          else
            begin
              reg7 <= $unsigned((+$unsigned(wire3)));
              reg8 <= reg8;
              reg9 <= {(+(($signed(wire3) > $unsigned(reg7)) <= ({wire2} - wire1[(4'hb):(4'ha)]))),
                  (~^($signed(wire1) ?
                      $signed($signed(reg7)) : $signed($unsigned(reg9))))};
              reg10 <= (8'ha7);
              reg11 <= ({wire5[(3'h5):(2'h2)],
                      ((~|$signed(reg10)) ?
                          ($unsigned(reg10) ? (8'haa) : (|wire3)) : (&reg7))} ?
                  reg8 : $signed((wire0[(4'h8):(3'h4)] ?
                      wire4 : wire3[(5'h13):(2'h3)])));
            end
          if ($signed((-(reg9[(3'h4):(2'h2)] ?
              ($signed((8'hbc)) * (wire5 ^ reg8)) : reg7))))
            begin
              reg12 <= $signed((!$unsigned(reg8[(4'h9):(3'h7)])));
              reg13 <= $unsigned($signed(reg10[(1'h0):(1'h0)]));
            end
          else
            begin
              reg12 <= $unsigned((wire2[(3'h5):(1'h0)] ?
                  {$unsigned(wire4[(3'h6):(3'h4)])} : ((reg13 || (reg8 ?
                      wire0 : reg9)) || $unsigned($signed(reg9)))));
              reg13 <= ({(($unsigned(reg13) ?
                          $unsigned(wire0) : wire3[(1'h1):(1'h1)]) & (&wire3)),
                      ((((8'hbc) <= wire5) != (reg13 ? wire0 : reg8)) ?
                          (~|((8'hbd) ? wire1 : (8'ha2))) : reg13)} ?
                  wire0 : wire2);
            end
          if ((^((reg11 == (^~reg7[(1'h1):(1'h0)])) ?
              reg8[(2'h3):(2'h3)] : ({(^~reg10),
                  $signed(reg9)} <= $unsigned((~&reg8))))))
            begin
              reg14 <= (~(reg10[(5'h13):(5'h13)] ?
                  $unsigned(((wire6 ?
                      (8'h9e) : reg12) ~^ (^~(8'hbe)))) : ($signed($signed(wire4)) ?
                      {(reg8 | reg9)} : $unsigned(reg7[(1'h1):(1'h0)]))));
            end
          else
            begin
              reg14 <= reg10;
              reg15 <= reg11[(2'h2):(1'h0)];
              reg16 <= {(wire0[(3'h4):(2'h2)] - $signed(reg13))};
              reg17 <= wire2[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg7 <= (reg8[(4'ha):(3'h6)] + (~&reg14[(1'h1):(1'h1)]));
          if ((-{reg9[(4'h9):(1'h0)], $signed(reg8[(3'h5):(2'h3)])}))
            begin
              reg8 <= {$unsigned({(^(reg16 && wire1))})};
              reg9 <= $unsigned((wire0[(4'h8):(2'h3)] * reg16[(1'h1):(1'h0)]));
              reg10 <= ($unsigned((wire5 ?
                      (&(-reg14)) : ((reg12 ?
                          reg9 : reg12) << $unsigned((8'had))))) ?
                  (&$signed((~&$signed(wire2)))) : (~^$unsigned(wire1)));
              reg11 <= ((&(8'ha1)) ?
                  $unsigned($signed((+(reg14 ^ wire4)))) : ($signed(($signed(reg14) ?
                      ((8'hb3) ?
                          reg14 : reg10) : reg10)) + reg10[(3'h5):(1'h1)]));
              reg12 <= $unsigned(reg7);
            end
          else
            begin
              reg8 <= $unsigned((((^$unsigned(wire3)) ?
                  ((8'hbc) >> $unsigned(wire5)) : ((reg14 > (8'hbd)) < $signed(reg8))) == (|reg9[(2'h3):(2'h3)])));
            end
        end
      reg18 <= (reg9[(1'h1):(1'h1)] ?
          ((reg15[(2'h2):(2'h2)] >= (&reg8[(4'ha):(1'h0)])) >= ((+$unsigned(wire0)) >>> ($unsigned(reg9) << $unsigned(reg7)))) : (wire3[(4'ha):(4'h9)] < (($unsigned(reg10) && wire0) ?
              (reg10 ?
                  {wire6,
                      wire4} : wire6[(2'h2):(1'h0)]) : ((^~(8'ha4)) >>> (8'hb8)))));
      if ($unsigned((|wire2)))
        begin
          reg19 <= {$unsigned(((reg11[(4'h8):(4'h8)] << {(8'ha1)}) ?
                  reg10 : reg12[(4'hb):(4'hb)])),
              $unsigned((7'h42))};
          reg20 <= (^~((~|reg13) ?
              (wire0[(1'h0):(1'h0)] || $signed($unsigned(reg13))) : reg17[(4'h8):(3'h6)]));
          reg21 <= ($unsigned($signed(((wire5 ? reg7 : reg10) | {reg17}))) ?
              reg12 : (reg16 >= $signed($unsigned(reg13))));
          reg22 <= wire0;
          if ($signed(reg8))
            begin
              reg23 <= (^~(((~|reg19) ? reg20 : (reg12 | (~reg13))) ?
                  reg14 : ($signed((&wire4)) < wire6[(1'h0):(1'h0)])));
              reg24 <= reg15[(2'h2):(1'h0)];
              reg25 <= wire3[(5'h12):(3'h6)];
              reg26 <= reg12;
              reg27 <= $unsigned($unsigned($signed($unsigned($signed(reg7)))));
            end
          else
            begin
              reg23 <= ((~&$unsigned(((8'h9d) >>> $signed((8'hbc))))) ?
                  $unsigned(wire3) : ((+$unsigned($unsigned(reg13))) ?
                      (+{$unsigned(reg20)}) : $unsigned((reg11[(3'h7):(2'h3)] + $unsigned(reg22)))));
              reg24 <= $signed((&({wire6, (|reg17)} || {(&reg26), reg24})));
            end
        end
      else
        begin
          reg19 <= (!reg24[(1'h0):(1'h0)]);
          reg20 <= (($signed((|reg11[(1'h0):(1'h0)])) ?
              (~|(wire3[(4'h8):(3'h7)] ?
                  (8'haa) : $signed(reg15))) : wire2[(3'h4):(2'h2)]) * $unsigned((((reg26 <<< wire4) > wire3[(4'hf):(1'h1)]) ?
              (reg22 ?
                  $signed(wire4) : $signed(wire0)) : $signed((reg16 >>> (8'ha6))))));
          reg21 <= reg13;
          reg22 <= ($unsigned(reg12[(2'h2):(2'h2)]) >> reg12[(3'h7):(3'h4)]);
          reg23 <= ($unsigned(reg13[(1'h1):(1'h1)]) ?
              (7'h42) : wire0[(4'ha):(4'ha)]);
        end
      if (reg24[(4'h8):(1'h1)])
        begin
          reg28 <= reg27[(2'h3):(1'h0)];
          if ((8'ha3))
            begin
              reg29 <= ($unsigned((reg19[(4'hb):(3'h7)] > $signed(reg27))) ^~ ((~|({reg18,
                      reg8} | $signed(reg8))) ?
                  (((reg23 - wire4) <= {reg24, reg13}) > (wire2 ?
                      (reg14 ?
                          reg14 : reg15) : ((8'hb3) * wire4))) : (|$unsigned((~^reg25)))));
              reg30 <= (~(reg16[(4'h9):(3'h4)] >= ($signed($signed(reg21)) >>> ($unsigned(reg28) >>> {reg25}))));
              reg31 <= $unsigned(((((reg28 + reg24) ?
                      reg15 : (reg11 ? reg28 : wire1)) ?
                  reg29[(3'h6):(2'h2)] : $unsigned(reg22[(2'h3):(2'h2)])) == $unsigned(($signed(reg16) | ((8'ha9) ?
                  (8'ha3) : (8'ha3))))));
              reg32 <= ($signed((((^~wire5) ?
                  (wire0 ? (8'hae) : reg13) : $signed(reg30)) < $signed((reg9 ?
                  reg20 : wire1)))) ^~ wire2);
              reg33 <= (({$unsigned($signed(reg26)), $signed(wire4)} ?
                  (!$signed((^~reg20))) : (($signed(reg19) - (reg8 ?
                      wire5 : reg14)) > $unsigned(reg10))) << reg30);
            end
          else
            begin
              reg29 <= {reg19[(4'he):(4'he)], $unsigned(reg28)};
              reg30 <= reg10[(4'hd):(3'h7)];
              reg31 <= {wire5[(1'h0):(1'h0)],
                  ((^~$signed($signed(reg20))) - reg17)};
              reg32 <= (($signed((reg19[(4'hd):(4'hd)] & wire6)) ^ (8'hb9)) >>> (reg16[(2'h2):(1'h1)] ?
                  $unsigned(reg33) : $signed(wire6[(3'h4):(2'h3)])));
              reg33 <= ((^~(^$unsigned($signed(reg9)))) ?
                  $signed(reg13) : ($unsigned($unsigned((reg28 ?
                          reg17 : wire3))) ?
                      (^reg17) : (8'hb0)));
            end
          reg34 <= ($unsigned($signed($unsigned((+reg11)))) ?
              {$unsigned($unsigned($signed(reg7)))} : $unsigned($unsigned($signed({reg27,
                  reg33}))));
          if ((~|(8'hbe)))
            begin
              reg35 <= $unsigned(((8'ha7) ?
                  reg22[(2'h3):(1'h1)] : $signed({$unsigned((8'hae))})));
              reg36 <= $signed(({$unsigned({reg29})} ^ wire4));
            end
          else
            begin
              reg35 <= $unsigned(($signed(reg22[(1'h1):(1'h1)]) - (&reg21)));
              reg36 <= reg18;
              reg37 <= ($unsigned(wire1) <= $signed((~^$signed(reg7[(1'h1):(1'h1)]))));
              reg38 <= reg17[(3'h7):(3'h7)];
              reg39 <= ((!$signed(reg11[(4'h9):(1'h1)])) ~^ reg22[(2'h3):(1'h1)]);
            end
          reg40 <= reg19;
        end
      else
        begin
          reg28 <= (~&((($signed(reg16) >> $signed(reg22)) ?
              $signed($signed(reg13)) : reg28) < ((-{reg15}) >= (+(~^reg8)))));
          reg29 <= ({({(reg8 >= (8'ha0)), $signed((8'ha4))} ?
                  ((reg12 <<< reg17) <<< wire3[(3'h7):(2'h3)]) : reg10),
              wire4[(4'hc):(1'h1)]} >>> ((7'h40) & {((wire3 ? wire4 : wire1) ?
                  {reg24} : reg30[(3'h5):(1'h1)]),
              reg13[(3'h4):(2'h2)]}));
          if ((~^reg10))
            begin
              reg30 <= ({reg14,
                  (^reg36[(1'h0):(1'h0)])} || wire4[(1'h1):(1'h1)]);
              reg31 <= (((((reg16 > wire4) ?
                  reg9[(2'h2):(1'h1)] : $unsigned((8'hbb))) << reg13) && $signed(($signed(reg19) ?
                  $unsigned(wire2) : $signed(wire2)))) ^~ reg14[(1'h0):(1'h0)]);
              reg32 <= reg26;
              reg33 <= reg18[(4'hd):(4'h9)];
              reg34 <= (~|reg30[(4'ha):(4'ha)]);
            end
          else
            begin
              reg30 <= reg14[(2'h2):(1'h1)];
              reg31 <= (wire5 ? reg40[(3'h5):(2'h3)] : wire3[(4'hd):(4'h9)]);
              reg32 <= {(($unsigned(reg40[(4'h8):(3'h5)]) ?
                          ($unsigned((8'hb8)) ?
                              reg34[(1'h0):(1'h0)] : (^reg35)) : $unsigned($unsigned(reg9))) ?
                      reg40[(4'hb):(3'h4)] : (reg11 <= ({reg26,
                          reg19} * (reg29 ^~ wire0)))),
                  (~^(reg33[(1'h0):(1'h0)] >>> (8'ha3)))};
              reg33 <= (+$signed($unsigned(((8'haa) > $signed(reg27)))));
            end
        end
      reg41 <= $signed((~&{((reg8 ? (8'hb1) : reg9) ?
              reg29[(4'h8):(1'h0)] : {reg32}),
          (reg38 ? (^~reg32) : reg10)}));
    end
  assign wire42 = $signed($unsigned($unsigned(((reg17 - reg33) || (reg31 <= reg33)))));
  assign wire43 = {reg33[(1'h0):(1'h0)],
                      $signed((((reg23 ?
                          reg15 : reg24) <<< $unsigned(wire6)) >>> $unsigned($unsigned(reg17))))};
  assign wire44 = (+((8'hb0) - $signed(reg40[(1'h0):(1'h0)])));
endmodule
