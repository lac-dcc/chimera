module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h20d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire44;
  wire signed [(4'hf):(1'h0)] wire35;
  wire [(3'h6):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire4;
  reg signed [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(5'h10):(1'h0)] reg41 = (1'h0);
  reg [(3'h6):(1'h0)] reg40 = (1'h0);
  reg [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  reg [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(3'h5):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  reg [(4'ha):(1'h0)] reg6 = (1'h0);
  assign y = {wire44,
                 wire35,
                 wire34,
                 wire5,
                 wire4,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
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
                 (1'h0)};
  assign wire4 = (({(8'hbb)} <<< wire0) == wire3);
  assign wire5 = (~&$signed((wire3[(4'h8):(1'h0)] << ($unsigned(wire1) ?
                     $unsigned(wire2) : wire2))));
  always
    @(posedge clk) begin
      if ((8'h9f))
        begin
          reg6 <= wire5[(3'h7):(2'h2)];
          reg7 <= $unsigned((~^wire0));
          reg8 <= ((8'ha4) - $unsigned(wire1));
        end
      else
        begin
          if ((+(($signed((reg7 ?
              reg6 : (8'haa))) <= (reg7[(3'h7):(3'h4)] - $unsigned(reg8))) == $signed((7'h41)))))
            begin
              reg6 <= $unsigned(wire4);
              reg7 <= (|(((|wire0) && reg7) ^~ (~^((wire2 ? wire2 : wire0) ?
                  reg7[(1'h1):(1'h1)] : (wire5 >> wire0)))));
            end
          else
            begin
              reg6 <= ((reg7[(3'h4):(1'h1)] ?
                  (~^$signed((8'hb1))) : reg7) - ($signed({(~reg7),
                  $unsigned(wire3)}) <<< reg8[(3'h7):(1'h0)]));
              reg7 <= $unsigned($unsigned(((reg8[(4'h9):(3'h7)] >> reg7) ?
                  {(~(8'ha5)), (8'hac)} : $signed((-wire1)))));
              reg8 <= ((wire2[(4'h8):(2'h2)] ?
                  ($unsigned({reg7}) ^ ((~&(8'hbb)) ?
                      wire5[(3'h6):(3'h4)] : $unsigned(wire1))) : $signed(reg7[(4'ha):(1'h0)])) * reg6);
            end
          if ((reg6 << $unsigned({($signed(wire1) != reg8),
              $signed((reg8 ? reg7 : (8'hb8)))})))
            begin
              reg9 <= ((reg6[(3'h5):(1'h0)] | {(~$signed(wire5)),
                      {$unsigned(wire5), $signed(wire3)}}) ?
                  (reg8[(4'h8):(3'h6)] ?
                      ($signed((wire3 ? reg7 : wire1)) ?
                          ((~|wire3) ?
                              wire3[(4'hd):(3'h4)] : (+wire5)) : $signed((wire5 == reg7))) : (wire5 ?
                          (reg6 + (-wire4)) : (wire4 < reg8))) : {$signed($signed((wire0 > (8'haf)))),
                      wire1[(4'hc):(3'h5)]});
              reg10 <= (+(^~$unsigned((&(wire4 || reg8)))));
            end
          else
            begin
              reg9 <= $unsigned(({$unsigned((!wire4)),
                  wire0[(3'h6):(2'h2)]} && $unsigned(($unsigned(reg9) * (!reg6)))));
              reg10 <= $unsigned(reg8);
              reg11 <= reg10;
              reg12 <= ($unsigned((-{reg7[(4'hd):(3'h6)]})) <= wire1);
            end
          reg13 <= (($unsigned(((~wire2) >= {(8'h9d),
              wire5})) & reg7[(2'h2):(1'h0)]) < $signed($signed((reg8 ?
              (+reg9) : {(8'haa), wire3}))));
          reg14 <= $unsigned($unsigned({((~&wire5) ?
                  $unsigned(wire4) : $unsigned(reg10))}));
        end
      reg15 <= $unsigned(({reg11, (~|(&reg11))} ?
          $unsigned((&reg10)) : (+wire2[(4'hc):(3'h7)])));
    end
  always
    @(posedge clk) begin
      reg16 <= ({$signed((&(+wire3))), (|reg10)} ^~ (reg13[(1'h0):(1'h0)] ?
          $unsigned(reg9) : wire0[(1'h0):(1'h0)]));
      reg17 <= reg8[(1'h0):(1'h0)];
      reg18 <= reg16;
    end
  always
    @(posedge clk) begin
      reg19 <= reg8;
      reg20 <= (!{({reg13[(3'h6):(1'h0)]} ?
              $signed((wire3 ? (8'hbc) : wire2)) : (reg9[(2'h2):(1'h0)] ?
                  $unsigned(reg6) : ((8'ha7) ? (8'ha2) : (8'hb3)))),
          wire2});
      if ((~^(((-$unsigned(reg14)) && reg19[(1'h0):(1'h0)]) ?
          {wire1} : ((|$unsigned(wire3)) ? reg10 : reg8))))
        begin
          reg21 <= $unsigned(($signed(reg17[(3'h4):(2'h3)]) ?
              (((reg10 | reg7) ?
                  ((8'haf) ? reg12 : wire1) : {reg19}) ~^ ((reg7 ?
                      reg10 : reg20) ?
                  (reg18 ? reg7 : wire5) : (~wire1))) : $signed(((reg12 ?
                  reg12 : reg15) ^~ reg12[(2'h3):(2'h2)]))));
        end
      else
        begin
          if ($unsigned({(&reg15[(4'hb):(2'h3)]),
              (({wire1} ? ((8'hbf) <<< reg6) : $unsigned((8'hb0))) >>> {{reg9},
                  (reg14 < reg15)})}))
            begin
              reg21 <= (8'h9d);
              reg22 <= $unsigned((($unsigned(reg13[(4'hc):(2'h2)]) ?
                  ((~&reg6) & reg14[(1'h1):(1'h1)]) : (((8'hab) ?
                      (8'ha3) : reg6) ^~ $signed(wire4))) ^ (~^($unsigned(reg21) ?
                  $signed(wire3) : reg19))));
              reg23 <= (^reg13);
              reg24 <= $signed((wire1[(2'h2):(2'h2)] ?
                  reg23[(3'h4):(2'h3)] : reg13));
            end
          else
            begin
              reg21 <= $signed((~|wire3));
              reg22 <= reg16;
              reg23 <= wire4[(1'h1):(1'h1)];
            end
          reg25 <= reg8[(1'h0):(1'h0)];
          if ({reg7[(4'hb):(2'h3)], reg10[(2'h2):(1'h0)]})
            begin
              reg26 <= $signed($unsigned({reg12[(4'h8):(2'h3)],
                  $signed((reg12 ~^ wire2))}));
            end
          else
            begin
              reg26 <= (~|(8'hb1));
            end
        end
      if (((^wire1) ?
          ((!$unsigned($unsigned(reg13))) ^ reg11[(4'hb):(4'ha)]) : (reg9[(4'hc):(2'h3)] ?
              ((reg16[(3'h6):(3'h4)] >= (~|reg8)) ?
                  $signed((reg11 ? reg18 : reg17)) : reg25) : (~&({reg14,
                      wire4} ?
                  $signed(reg20) : $unsigned((8'ha2)))))))
        begin
          reg27 <= $unsigned($signed((reg15[(4'ha):(1'h1)] ?
              ((+reg26) > ((8'hb1) ? reg10 : wire2)) : reg9[(4'hf):(4'hd)])));
        end
      else
        begin
          reg27 <= $unsigned($unsigned({({reg14} ?
                  (wire1 + wire2) : (reg27 > reg7))}));
          if (reg21[(3'h5):(3'h5)])
            begin
              reg28 <= $signed({$signed((~&((8'h9f) ? reg27 : reg6))),
                  (((^wire5) ? (!reg26) : (reg16 ? (8'hbe) : reg22)) ?
                      reg24[(4'he):(3'h5)] : (wire1[(2'h3):(1'h0)] ?
                          reg12[(2'h2):(1'h1)] : (~&wire0)))});
              reg29 <= reg23;
              reg30 <= ((8'hbb) + (($unsigned({reg24}) <= (reg16[(2'h2):(1'h0)] ?
                  $unsigned(reg23) : $unsigned(wire4))) <= (reg28[(3'h4):(2'h2)] ?
                  $signed($signed(wire2)) : wire2[(3'h6):(1'h0)])));
            end
          else
            begin
              reg28 <= (reg24 ^~ $unsigned($unsigned((reg16 ?
                  reg6 : reg18[(3'h5):(3'h4)]))));
              reg29 <= wire2;
              reg30 <= $unsigned(reg18);
              reg31 <= (~&$signed(wire1[(3'h5):(1'h1)]));
              reg32 <= reg20;
            end
          reg33 <= (&reg21[(4'hb):(3'h7)]);
        end
    end
  assign wire34 = (~((!reg22[(3'h7):(2'h2)]) ?
                      $signed(reg22[(4'hc):(4'h8)]) : reg22[(3'h7):(1'h0)]));
  assign wire35 = reg22[(4'hc):(4'ha)];
  always
    @(posedge clk) begin
      if ($signed((^~(!($unsigned(wire0) && (!reg18))))))
        begin
          if (((reg29[(4'h9):(1'h0)] && ($signed(reg17[(2'h2):(1'h0)]) || (reg25[(4'hd):(3'h4)] << (reg31 ?
                  (8'hbc) : reg10)))) ?
              reg30[(4'hb):(4'ha)] : ($signed(($unsigned(reg30) ?
                      (reg16 != reg32) : (~^reg26))) ?
                  $signed($unsigned((wire35 ?
                      reg17 : wire1))) : $unsigned($unsigned($signed(reg8))))))
            begin
              reg36 <= (8'h9c);
              reg37 <= (-reg27);
              reg38 <= $signed((8'hbf));
              reg39 <= $unsigned($signed(reg9));
              reg40 <= (!(wire3 << $signed($unsigned((wire1 ?
                  (8'ha3) : reg14)))));
            end
          else
            begin
              reg36 <= (((reg18 ? (|((7'h44) ? reg11 : (8'hb6))) : reg17) ?
                      reg32 : ($unsigned((~&reg20)) ?
                          (^(~reg6)) : (reg17 | $unsigned(reg18)))) ?
                  (~^{(reg6 <= reg40[(3'h5):(3'h5)]),
                      $signed((reg25 ? wire0 : reg27))}) : (reg32 ?
                      ((-(|reg7)) | reg10) : $signed((~&(reg29 ?
                          (8'hb8) : wire0)))));
              reg37 <= (|wire34);
              reg38 <= $signed($unsigned((reg15[(3'h4):(3'h4)] ?
                  $signed({reg14, wire2}) : $signed(reg25))));
              reg39 <= (!(!((-{reg18}) ? (-{reg20}) : reg27)));
              reg40 <= reg36;
            end
          reg41 <= (wire1 >>> (+((!(8'ha3)) ?
              (reg18 ?
                  reg37 : {reg29}) : ((reg13 ^~ reg29) || $signed(reg31)))));
          reg42 <= reg12;
        end
      else
        begin
          reg36 <= ($signed(((+reg26) >= reg38)) ~^ (((8'hbe) ?
                  reg39 : (reg7 ? reg26[(1'h1):(1'h1)] : (~^reg27))) ?
              (+({reg21,
                  (8'hb1)} < reg42[(2'h2):(1'h0)])) : reg29[(1'h1):(1'h0)]));
          reg37 <= ($signed(reg13[(4'hb):(1'h0)]) <<< reg28);
          reg38 <= ($signed($unsigned(reg21)) & (-$signed($signed($signed(wire4)))));
        end
      reg43 <= wire3;
    end
  assign wire44 = (reg38 ^ {(8'hac), $signed($signed($signed((8'hbe))))});
endmodule
