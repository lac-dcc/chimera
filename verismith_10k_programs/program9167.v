module top
#(parameter param52 = (8'ha8), 
parameter param53 = (+((~|{(7'h42)}) || param52)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h20a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire51;
  wire signed [(5'h10):(1'h0)] wire50;
  wire [(5'h15):(1'h0)] wire48;
  wire [(2'h2):(1'h0)] wire47;
  reg signed [(3'h5):(1'h0)] reg49 = (1'h0);
  reg [(3'h6):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg [(3'h6):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg42 = (1'h0);
  reg [(4'h9):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(4'h9):(1'h0)] reg37 = (1'h0);
  reg [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg28 = (1'h0);
  reg [(4'h8):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg5 = (1'h0);
  reg [(5'h15):(1'h0)] reg4 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire48,
                 wire47,
                 reg49,
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
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire2 == (!(wire0 ?
          ((wire1 << wire1) ^ wire2) : ($unsigned(wire0) ?
              ((8'hbb) * wire1) : wire0[(1'h0):(1'h0)])))))
        begin
          if (({wire1} < $unsigned($unsigned(wire1))))
            begin
              reg4 <= {$unsigned(wire2[(3'h4):(2'h2)]),
                  ((wire1[(4'he):(1'h1)] ?
                      (wire0 < $unsigned(wire1)) : $signed({wire1})) ^~ $unsigned(wire2))};
              reg5 <= wire2;
              reg6 <= wire1;
              reg7 <= (+wire3[(2'h2):(1'h1)]);
            end
          else
            begin
              reg4 <= (wire1[(4'ha):(3'h6)] > ((^$unsigned({(8'ha6)})) > wire3[(1'h0):(1'h0)]));
              reg5 <= $signed((~|((((7'h42) - wire2) && (wire3 ?
                      reg7 : wire1)) ?
                  $signed((reg6 || wire3)) : ((!reg5) != $signed(wire2)))));
              reg6 <= $unsigned((!(reg6[(4'ha):(3'h7)] ?
                  wire2[(2'h3):(2'h2)] : wire2[(1'h0):(1'h0)])));
            end
          if (((!((+{wire1, reg5}) ?
              wire2 : ($signed(reg4) ?
                  reg6[(1'h1):(1'h1)] : $signed(wire0)))) > (wire1 == wire0[(3'h6):(3'h4)])))
            begin
              reg8 <= reg6[(4'hd):(4'h9)];
              reg9 <= reg7;
              reg10 <= wire1[(3'h5):(2'h2)];
              reg11 <= (-$signed(((reg7 == (wire3 ?
                  (8'hb6) : (8'ha7))) >> $unsigned((reg10 ? reg7 : wire1)))));
            end
          else
            begin
              reg8 <= reg5;
              reg9 <= (((+(^~((8'hab) & reg11))) + wire2) ?
                  wire1 : ($signed(((reg7 <<< reg8) ?
                      reg8 : ((8'ha7) ?
                          wire0 : reg10))) > ($unsigned((wire3 & reg8)) ?
                      wire0[(4'hc):(4'ha)] : (((8'hbf) | reg10) ?
                          ((8'h9e) ? reg8 : wire0) : wire0[(3'h6):(2'h2)]))));
            end
          reg12 <= $unsigned({({reg6} ?
                  ($unsigned(reg8) ? $signed(reg7) : reg6) : (~|((8'hb2) ?
                      reg9 : (8'hb9))))});
          reg13 <= $signed(((reg9[(3'h6):(1'h0)] ?
              (reg10[(3'h5):(1'h0)] ?
                  $unsigned(reg11) : (!(7'h44))) : (7'h43)) ^~ ($unsigned($signed((8'ha7))) ?
              reg12 : $signed((~^reg10)))));
        end
      else
        begin
          reg4 <= $unsigned(((reg8[(3'h5):(1'h1)] > (wire2[(2'h2):(2'h2)] & (+(8'hae)))) ~^ (($unsigned((8'ha4)) ?
                  (reg7 ? (7'h44) : reg12) : wire2) ?
              reg10 : reg7[(2'h2):(2'h2)])));
        end
      if ($signed(reg13[(1'h0):(1'h0)]))
        begin
          if (reg6)
            begin
              reg14 <= {reg13};
              reg15 <= $signed($unsigned($signed((~&reg10[(1'h1):(1'h1)]))));
              reg16 <= $unsigned((((reg5 && reg6) || reg10[(3'h4):(2'h2)]) ?
                  $signed(wire0) : (((reg9 ? reg8 : reg10) ?
                      (8'hb2) : reg12) << reg12[(2'h2):(2'h2)])));
              reg17 <= ((~^(-((wire2 <<< reg12) ?
                      $unsigned((7'h43)) : $unsigned(reg10)))) ?
                  $signed((~|(^{reg10}))) : wire1[(3'h6):(2'h2)]);
            end
          else
            begin
              reg14 <= ((~&reg7) <= reg16[(1'h0):(1'h0)]);
              reg15 <= (+$unsigned(reg17[(4'h8):(3'h7)]));
            end
          if ($unsigned($unsigned($unsigned($signed($unsigned(reg16))))))
            begin
              reg18 <= (($unsigned(reg14) || (~$unsigned($signed(reg4)))) ?
                  reg10 : $signed(($signed(reg5[(1'h0):(1'h0)]) ~^ {((8'hbc) ?
                          reg14 : reg16)})));
              reg19 <= ((^~((!(-(8'ha9))) + $unsigned({(8'hb3)}))) <= $unsigned({$unsigned($unsigned(reg15)),
                  ((reg12 | reg15) > $signed(reg11))}));
              reg20 <= $signed((((8'hbe) ?
                  $signed(((8'ha4) ?
                      reg4 : reg9)) : $unsigned($signed(reg9))) + (-$signed((reg14 ?
                  reg19 : wire2)))));
              reg21 <= (&(7'h43));
              reg22 <= (reg7[(3'h5):(3'h5)] >> (({(reg7 - reg21),
                      reg12[(4'h9):(1'h0)]} || (((8'ha3) ^ reg7) ?
                      (-(8'hab)) : reg4[(5'h13):(1'h0)])) ?
                  {(~(^wire3))} : (&{reg8[(3'h4):(1'h0)]})));
            end
          else
            begin
              reg18 <= $signed({{$unsigned(reg8[(2'h3):(1'h1)])}});
              reg19 <= reg16;
            end
          reg23 <= $unsigned($signed(reg15));
          if ((wire1 & (reg9 ?
              $signed($unsigned(reg12[(3'h5):(1'h1)])) : ({reg4} ?
                  ((reg6 * wire1) ^~ reg12[(5'h11):(4'he)]) : (&$unsigned(reg21))))))
            begin
              reg24 <= reg8[(3'h4):(2'h3)];
              reg25 <= (~^$signed({($unsigned(reg4) <<< (reg21 ?
                      reg4 : reg20))}));
              reg26 <= $unsigned(reg8[(3'h4):(2'h2)]);
            end
          else
            begin
              reg24 <= ($unsigned(reg23) ?
                  ((8'ha8) ?
                      {(+(reg18 ? (8'hb9) : (8'h9d))),
                          (reg26[(2'h2):(2'h2)] <= (-reg18))} : reg23[(4'h9):(3'h7)]) : reg24);
              reg25 <= (~$signed(reg13[(1'h1):(1'h0)]));
              reg26 <= reg9;
              reg27 <= ($unsigned(reg11) ?
                  ({reg17[(1'h0):(1'h0)]} || ($signed(reg26) + {reg14[(4'h9):(3'h6)],
                      reg19})) : $unsigned(($unsigned($unsigned(reg21)) & (8'hbd))));
            end
        end
      else
        begin
          reg14 <= $unsigned((8'h9d));
          reg15 <= (wire3[(3'h4):(2'h2)] ?
              reg18 : $unsigned((reg17 >> $signed({wire2, reg6}))));
          reg16 <= wire0[(4'h9):(3'h4)];
        end
      reg28 <= (&(reg7 ? (~reg27) : reg7));
      if (($unsigned((|reg23[(3'h4):(3'h4)])) <<< ((8'haa) ?
          $unsigned($unsigned($unsigned(reg7))) : (~wire0[(2'h2):(1'h0)]))))
        begin
          reg29 <= {reg10[(2'h3):(2'h3)],
              (!$signed(({reg28, reg24} ?
                  reg26[(2'h2):(2'h2)] : (reg18 & reg9))))};
          reg30 <= {reg7[(3'h5):(1'h1)]};
        end
      else
        begin
          reg29 <= {reg15};
          reg30 <= (^$signed((~reg29)));
          reg31 <= (+reg13[(1'h0):(1'h0)]);
        end
    end
  always
    @(posedge clk) begin
      reg32 <= wire0;
      reg33 <= reg5;
      if ($signed(($unsigned(((wire1 & reg19) ? (&reg14) : $signed(wire1))) ?
          ($signed((reg32 != wire1)) << $signed((reg12 ?
              reg22 : (8'hbd)))) : $signed(((reg7 <<< reg4) ?
              $unsigned(reg11) : $signed(reg8))))))
        begin
          reg34 <= reg5;
          reg35 <= (+$unsigned((~|$signed(((8'h9f) >= reg23)))));
          reg36 <= reg30[(3'h5):(1'h1)];
        end
      else
        begin
          if (reg13)
            begin
              reg34 <= reg28[(2'h3):(2'h2)];
              reg35 <= $signed($signed(reg32));
            end
          else
            begin
              reg34 <= (reg30[(3'h6):(1'h0)] ?
                  (~^{(|reg25[(3'h5):(1'h1)])}) : {(wire0[(5'h10):(2'h2)] || $unsigned((reg23 > reg21)))});
              reg35 <= (+reg10);
            end
          reg36 <= $signed({(!$unsigned((&reg20)))});
        end
      if ((&reg25[(2'h2):(2'h2)]))
        begin
          reg37 <= (!$unsigned($unsigned($unsigned($unsigned(reg16)))));
          if ($unsigned(((reg33[(4'hb):(4'hb)] ?
                  $unsigned((~&reg28)) : (!(reg7 ? wire3 : reg36))) ?
              ({reg23[(3'h6):(3'h6)]} != (~(reg13 ?
                  (8'ha2) : reg36))) : (&(+(reg5 ~^ reg18))))))
            begin
              reg38 <= ($unsigned(wire3[(3'h4):(2'h2)]) ?
                  wire0[(3'h5):(1'h0)] : reg21[(2'h2):(1'h1)]);
              reg39 <= $unsigned(($signed((8'hbd)) ?
                  $signed({(reg13 ? reg25 : reg24), (|reg16)}) : {reg6}));
            end
          else
            begin
              reg38 <= reg18[(4'hd):(3'h5)];
              reg39 <= {{$signed(($signed(reg4) < ((8'ha9) * (8'hb3)))),
                      ($signed(reg9[(1'h1):(1'h0)]) > reg8)},
                  reg26[(1'h0):(1'h0)]};
              reg40 <= (reg35[(4'ha):(1'h0)] < $signed(((reg9[(2'h3):(1'h1)] ?
                      reg21[(3'h7):(3'h4)] : {reg39}) ?
                  reg22 : $unsigned($unsigned((8'hbd))))));
              reg41 <= {$unsigned(reg36), reg28[(1'h0):(1'h0)]};
              reg42 <= ((8'hbe) & ((-(reg7[(2'h2):(2'h2)] ? {reg8} : reg4)) ?
                  reg4 : reg10));
            end
        end
      else
        begin
          if (wire2[(3'h4):(3'h4)])
            begin
              reg37 <= ((reg15 ?
                  (~^reg17) : {((reg7 >> reg37) ?
                          (reg19 >>> reg27) : (reg28 ? reg41 : reg39)),
                      $signed(reg14)}) >= $unsigned($unsigned($signed($unsigned(reg30)))));
              reg38 <= ((^~reg13[(1'h0):(1'h0)]) ?
                  {$signed(reg8[(4'hd):(3'h4)])} : ((reg39[(4'hb):(3'h5)] * reg7[(2'h2):(2'h2)]) > reg20));
            end
          else
            begin
              reg37 <= (^~reg10[(2'h2):(1'h0)]);
              reg38 <= $unsigned((wire2[(2'h2):(1'h0)] > $unsigned($unsigned($unsigned(reg10)))));
            end
          if ((((^~((reg11 - (8'hbf)) <<< reg21[(3'h4):(2'h3)])) ?
                  ((reg4[(4'hb):(3'h7)] ? $unsigned(reg35) : reg11) ?
                      $unsigned(((8'ha0) | (7'h40))) : ((reg27 ?
                          reg17 : reg22) + $signed(reg18))) : {reg25,
                      (^{reg30, (8'ha3)})}) ?
              ({((reg26 >>> (8'hab)) | (reg23 >>> reg36))} ?
                  $signed($signed(wire0[(4'h8):(3'h4)])) : (reg31 * ((reg28 == reg24) ?
                      (|(8'hb1)) : (reg7 ?
                          reg6 : reg20)))) : {$unsigned(reg42)}))
            begin
              reg39 <= $unsigned(reg40[(4'he):(3'h4)]);
            end
          else
            begin
              reg39 <= ((^reg36) && (|$unsigned({{reg5}})));
              reg40 <= ($unsigned(((~^reg8) ?
                      reg23 : {reg41[(2'h3):(2'h2)], $unsigned(reg5)})) ?
                  {$signed(reg39[(2'h3):(2'h2)])} : reg32[(3'h5):(3'h5)]);
            end
          reg41 <= reg26;
          if (reg15)
            begin
              reg42 <= reg35[(2'h2):(1'h0)];
              reg43 <= reg26;
              reg44 <= reg41;
              reg45 <= (reg32[(1'h1):(1'h0)] >= reg38[(5'h10):(3'h4)]);
            end
          else
            begin
              reg42 <= (!$unsigned(wire3[(1'h0):(1'h0)]));
            end
          reg46 <= $signed(({reg38} ~^ $signed(((reg29 == reg15) ?
              $unsigned(reg23) : (-reg41)))));
        end
    end
  assign wire47 = wire3[(3'h5):(2'h2)];
  assign wire48 = (8'h9e);
  always
    @(posedge clk) begin
      reg49 <= reg44;
    end
  assign wire50 = reg39;
  assign wire51 = {$signed({(~|$unsigned(wire2))})};
endmodule
