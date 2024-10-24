module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h23e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire30;
  wire [(4'hb):(1'h0)] wire29;
  wire signed [(4'hf):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire21;
  wire signed [(4'hf):(1'h0)] wire4;
  reg signed [(4'h9):(1'h0)] reg55 = (1'h0);
  reg [(4'h8):(1'h0)] reg54 = (1'h0);
  reg [(4'hd):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg52 = (1'h0);
  reg [(3'h5):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg49 = (1'h0);
  reg [(3'h6):(1'h0)] reg48 = (1'h0);
  reg [(5'h11):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(2'h2):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(4'hd):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg9 = (1'h0);
  reg [(3'h5):(1'h0)] reg8 = (1'h0);
  reg [(2'h2):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(5'h10):(1'h0)] reg5 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire21,
                 wire4,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
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
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
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
  assign wire4 = (~^($unsigned(({wire0} >= $unsigned(wire2))) ?
                     $signed((wire1[(1'h0):(1'h0)] >>> (wire0 > wire3))) : wire3[(4'hb):(4'h8)]));
  always
    @(posedge clk) begin
      if ((~$unsigned($unsigned($signed($unsigned(wire0))))))
        begin
          reg5 <= (wire0[(1'h1):(1'h0)] <<< (8'ha9));
          reg6 <= $unsigned(wire3[(4'hb):(3'h4)]);
        end
      else
        begin
          reg5 <= {(reg5 ?
                  {wire3} : (wire0 ?
                      ((reg5 * wire4) << (-(8'hb0))) : ($unsigned(wire1) && $unsigned(reg5)))),
              (&wire0)};
          reg6 <= (~&reg5[(4'ha):(3'h6)]);
          if ((wire0[(2'h2):(1'h1)] - (~(~|({reg6, wire2} ?
              $unsigned(wire3) : ((8'ha1) ? reg5 : wire3))))))
            begin
              reg7 <= $unsigned(wire0);
              reg8 <= $unsigned($unsigned(wire2));
              reg9 <= wire0;
              reg10 <= wire3[(3'h7):(3'h5)];
              reg11 <= {reg9[(2'h3):(2'h2)]};
            end
          else
            begin
              reg7 <= reg7[(2'h2):(2'h2)];
              reg8 <= wire4;
            end
          reg12 <= $signed((((8'ha6) <<< ((wire2 ?
                  reg10 : reg10) | $unsigned(reg5))) ?
              (wire4[(4'h8):(1'h1)] != wire1[(2'h3):(1'h1)]) : $unsigned($signed((reg7 | reg7)))));
          reg13 <= {{(reg11 >>> reg9)}, $signed(reg8[(2'h2):(1'h0)])};
        end
      reg14 <= (-$unsigned($unsigned({(7'h41)})));
      if ($unsigned({wire1}))
        begin
          reg15 <= reg8[(1'h1):(1'h1)];
          reg16 <= ((+reg8[(2'h2):(2'h2)]) ?
              (((^(-wire0)) <<< ((-(8'hb4)) ?
                      $unsigned(reg13) : (reg14 >= wire4))) ?
                  wire4 : (!(~^reg12[(1'h0):(1'h0)]))) : reg14);
        end
      else
        begin
          reg15 <= ($unsigned((&reg9[(2'h2):(2'h2)])) != {($unsigned(reg5) | $signed((8'hb8))),
              reg7});
          if ({reg5[(3'h6):(2'h2)],
              ((8'had) == $signed(((~reg10) - $unsigned(wire0))))})
            begin
              reg16 <= reg11;
              reg17 <= reg9;
            end
          else
            begin
              reg16 <= $unsigned($signed((~^reg6[(4'he):(1'h1)])));
              reg17 <= reg7;
            end
          reg18 <= ($unsigned(($signed(reg8) ?
                  $unsigned((8'hb0)) : (reg9 ~^ (wire2 & reg15)))) ?
              reg7 : ((!{{reg5, reg10}}) ?
                  (reg6 >= reg13[(1'h0):(1'h0)]) : $signed((-$unsigned(reg15)))));
        end
      reg19 <= (~^(^~$unsigned($unsigned(reg13[(1'h0):(1'h0)]))));
      reg20 <= reg19[(4'hc):(1'h1)];
    end
  assign wire21 = ((reg7[(1'h1):(1'h1)] ?
                          reg18[(4'hc):(3'h7)] : (~&$signed($unsigned(reg16)))) ?
                      (8'hbd) : wire3[(4'he):(4'h8)]);
  always
    @(posedge clk) begin
      reg22 <= ($signed(({reg9[(2'h3):(1'h1)], (wire4 && reg8)} ?
              reg5[(4'hc):(1'h0)] : reg15[(3'h7):(3'h4)])) ?
          wire2 : (^{$unsigned((~(8'h9d)))}));
      reg23 <= ((!$signed(reg15[(3'h6):(2'h3)])) ?
          reg5 : ($unsigned($signed(reg22)) & reg15[(2'h3):(1'h0)]));
      if (((^$signed($signed((wire21 ? reg13 : reg5)))) ?
          $unsigned($signed((reg15[(3'h6):(3'h5)] > (^wire3)))) : $unsigned(($signed($signed(reg5)) >= wire2))))
        begin
          reg24 <= $signed(reg6);
        end
      else
        begin
          reg24 <= (|(~|({$unsigned(reg8),
              {(8'hb0), reg8}} != reg13[(1'h1):(1'h1)])));
          reg25 <= (~^(reg18[(5'h10):(4'hb)] ? reg9 : {{(~&(8'h9f)), reg17}}));
        end
      reg26 <= ($signed(reg17) ?
          ($unsigned($signed((wire21 ?
              reg8 : reg7))) >> reg14[(4'hb):(4'hb)]) : $unsigned(reg18[(4'ha):(1'h1)]));
      reg27 <= ($unsigned(((^(reg10 ? wire0 : (8'hb1))) ?
          ((7'h40) ~^ wire2[(1'h1):(1'h1)]) : (8'ha1))) * {$signed(reg5[(2'h3):(1'h0)]),
          ($signed($signed(reg13)) <= $unsigned($signed(wire4)))});
    end
  assign wire28 = $signed(reg23);
  assign wire29 = $signed((^~(wire21[(4'hd):(2'h2)] ?
                      $signed(reg23[(3'h6):(3'h4)]) : $signed((reg23 ?
                          wire0 : reg5)))));
  assign wire30 = ((&$signed(reg20[(2'h3):(1'h0)])) && reg11);
  always
    @(posedge clk) begin
      reg31 <= $signed(reg10[(3'h5):(3'h5)]);
      reg32 <= (^~reg9[(2'h3):(1'h0)]);
      if ($unsigned($signed(wire29)))
        begin
          if ((8'ha7))
            begin
              reg33 <= $signed((reg6 ?
                  (((reg14 >= (8'hac)) ?
                      $unsigned(reg6) : (^(8'hac))) ^ ((-reg9) ?
                      reg31[(4'hc):(3'h4)] : $signed(reg20))) : (reg32[(3'h5):(2'h3)] ?
                      $signed((~^reg18)) : ((~|wire29) ?
                          (!reg9) : $unsigned((7'h41))))));
              reg34 <= reg13;
            end
          else
            begin
              reg33 <= $signed(reg10[(3'h6):(3'h5)]);
              reg34 <= (~&reg15);
              reg35 <= reg25;
              reg36 <= (reg20[(2'h2):(2'h2)] ?
                  (-(^$signed(reg32[(2'h3):(2'h3)]))) : reg20[(3'h4):(1'h1)]);
              reg37 <= ((reg27[(4'he):(3'h7)] >> {(-(wire3 + reg32)),
                  ($signed(reg6) ?
                      (reg25 ?
                          reg18 : wire4) : {wire30})}) ^ reg24[(1'h0):(1'h0)]);
            end
        end
      else
        begin
          reg33 <= $signed($unsigned(reg37));
          reg34 <= reg6[(4'h9):(1'h1)];
          reg35 <= ($signed(reg14[(4'hb):(1'h0)]) <= $signed($unsigned((&(wire4 ?
              (8'ha7) : reg20)))));
          reg36 <= {(~|(!(reg36 ? $unsigned(reg7) : (reg25 ? wire21 : reg19)))),
              $signed($signed(reg35))};
          if (($unsigned(reg13[(2'h2):(1'h0)]) ?
              {reg6} : (^$signed(($signed(reg33) ? $unsigned(reg37) : reg5)))))
            begin
              reg37 <= reg37;
              reg38 <= (+reg37);
              reg39 <= reg32;
              reg40 <= ($unsigned($signed((((8'haf) > reg31) || $signed(wire21)))) || ((-wire0[(1'h1):(1'h0)]) ?
                  $unsigned(reg36[(3'h4):(1'h0)]) : (~^($unsigned(reg39) ?
                      wire1 : (reg37 ? reg27 : reg39)))));
              reg41 <= $signed($unsigned(reg38[(1'h0):(1'h0)]));
            end
          else
            begin
              reg37 <= (~^(^~(^~reg13)));
              reg38 <= $signed((8'ha6));
              reg39 <= wire3[(4'h8):(1'h0)];
              reg40 <= wire28;
              reg41 <= $unsigned(wire30[(3'h4):(1'h1)]);
            end
        end
    end
  always
    @(posedge clk) begin
      if ((8'hb4))
        begin
          if ((~(8'ha9)))
            begin
              reg42 <= {(8'ha7)};
              reg43 <= (~|$unsigned($unsigned(($signed(reg23) ?
                  (~^(8'hae)) : (~&reg23)))));
              reg44 <= $unsigned($unsigned((|($signed(reg35) ?
                  {wire21, reg27} : (reg14 * reg22)))));
              reg45 <= (~|{reg33});
            end
          else
            begin
              reg42 <= (8'haf);
              reg43 <= reg5;
              reg44 <= $unsigned($unsigned(wire2));
              reg45 <= $unsigned(wire30);
              reg46 <= reg36;
            end
          reg47 <= $signed(($signed({$signed((8'ha0)), reg24}) ?
              (-(+{reg34, reg43})) : $unsigned($signed({reg32}))));
        end
      else
        begin
          reg42 <= (~reg41[(4'h9):(3'h4)]);
        end
      reg48 <= $unsigned(((!{reg12}) <= (^~(8'hb0))));
    end
  always
    @(posedge clk) begin
      if (({reg42} ?
          $unsigned(wire30[(4'h8):(3'h7)]) : (reg23[(4'h8):(3'h5)] - reg46[(1'h0):(1'h0)])))
        begin
          reg49 <= ((^(+(^$signed(reg27)))) || ($unsigned(((reg39 ^~ reg36) * $signed(reg22))) != $unsigned($unsigned((!reg48)))));
          reg50 <= ((^~((~|$unsigned(reg46)) ?
                  {((8'hb8) ? reg18 : reg35),
                      wire2[(1'h1):(1'h1)]} : $unsigned($unsigned(reg33)))) ?
              (reg31[(4'hb):(4'h8)] >>> $signed(reg41)) : reg11);
          reg51 <= ((&($signed($unsigned(wire4)) ?
                  $unsigned((-wire3)) : {$signed(reg27)})) ?
              reg34[(3'h4):(2'h2)] : (^(|wire3)));
          reg52 <= reg11;
        end
      else
        begin
          reg49 <= (7'h41);
          reg50 <= (($signed(reg14[(4'ha):(4'h8)]) ?
              $signed(((reg5 ? reg17 : reg48) ?
                  (wire0 ^~ reg45) : $unsigned(reg43))) : reg16) <= {($unsigned((wire29 != (8'ha5))) ?
                  ((wire30 >> (8'ha2)) ? {(8'hb7), reg23} : {reg33}) : reg8),
              $signed(((reg48 ? (8'ha3) : reg35) >> (reg25 ? reg43 : reg5)))});
        end
      reg53 <= $signed({($signed({reg38}) > $unsigned((~|(8'hbe))))});
      reg54 <= (~reg37[(3'h4):(2'h2)]);
      reg55 <= reg6;
    end
endmodule
