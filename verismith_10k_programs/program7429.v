module top
#(parameter param53 = ({(((~&(8'hb4)) ? ((8'hab) ? (8'hb6) : (8'hab)) : (~(8'hae))) ^~ ({(8'h9e)} * ((8'ha5) ? (8'hb3) : (8'ha1)))), ({((7'h44) ? (8'hae) : (8'ha9))} ? (~|{(8'ha3), (8'hb4)}) : (((8'hb8) * (8'ha6)) ? ((8'ha8) <= (8'ha3)) : ((8'hbe) || (8'ha0))))} <= (~&(+((~&(8'ha3)) == {(8'hbe), (8'hb1)})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h20e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire4;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire52;
  wire [(4'h8):(1'h0)] wire51;
  wire [(3'h5):(1'h0)] wire50;
  wire signed [(5'h11):(1'h0)] wire49;
  wire signed [(5'h11):(1'h0)] wire48;
  wire [(4'he):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire38;
  wire signed [(4'hb):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire36;
  wire [(4'ha):(1'h0)] wire35;
  wire signed [(4'ha):(1'h0)] wire34;
  wire [(3'h4):(1'h0)] wire33;
  wire [(5'h11):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire31;
  wire signed [(3'h5):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire29;
  wire [(4'h9):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire5;
  reg [(5'h12):(1'h0)] reg47 = (1'h0);
  reg [(4'hb):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg45 = (1'h0);
  reg [(4'ha):(1'h0)] reg44 = (1'h0);
  reg [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(3'h6):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg41 = (1'h0);
  reg [(5'h12):(1'h0)] reg40 = (1'h0);
  reg [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg [(3'h4):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(4'he):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg6 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire11,
                 wire5,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
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
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = $signed(((wire2[(2'h3):(2'h3)] ?
                         (wire1 > (~^wire4)) : (-(wire4 + wire2))) ?
                     wire0 : wire2[(4'h9):(3'h7)]));
  always
    @(posedge clk) begin
      if ((|(&wire4)))
        begin
          if ($unsigned($signed(wire1)))
            begin
              reg6 <= wire0[(3'h6):(3'h4)];
              reg7 <= (^$signed(wire3[(3'h7):(2'h3)]));
              reg8 <= ((7'h41) ^ $signed($signed(wire0[(5'h14):(3'h7)])));
            end
          else
            begin
              reg6 <= $signed(wire4);
              reg7 <= (&reg6);
            end
          reg9 <= ((&(wire3 == $signed($signed(wire2)))) > (^~reg7[(1'h1):(1'h0)]));
        end
      else
        begin
          reg6 <= $signed(($signed(wire2) ?
              {wire5} : $unsigned(reg9[(1'h1):(1'h0)])));
          reg7 <= $signed((|wire2));
          reg8 <= (~|(((^(wire1 ? reg7 : wire2)) ?
                  $signed($unsigned(reg6)) : wire4[(3'h4):(2'h3)]) ?
              reg6 : reg7[(4'h8):(4'h8)]));
        end
      reg10 <= (^~{reg6[(1'h0):(1'h0)]});
    end
  assign wire11 = reg7[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg12 <= (reg6[(1'h0):(1'h0)] > (reg10 | {((wire1 ? reg10 : (8'ha6)) ?
              reg10 : (wire5 != reg6)),
          (~&(wire5 != (8'hb3)))}));
      if ((($unsigned((~&$signed(reg6))) <<< (reg7[(1'h0):(1'h0)] > ((~wire5) ?
              (!wire5) : (+wire1)))) ?
          reg9 : (reg10 ?
              $signed(((8'hb2) ?
                  $unsigned((8'hb1)) : wire3[(3'h4):(2'h3)])) : $signed({(~^wire1),
                  wire1[(2'h2):(1'h1)]}))))
        begin
          reg13 <= $unsigned((^~$unsigned(wire1[(2'h2):(1'h1)])));
          if ((|{(^~(|reg6))}))
            begin
              reg14 <= $signed(wire11[(4'h9):(3'h6)]);
              reg15 <= wire3;
              reg16 <= wire2;
            end
          else
            begin
              reg14 <= wire11;
              reg15 <= ({(wire3[(3'h6):(1'h1)] >> ($unsigned(reg14) ?
                      wire11 : (reg9 * reg8))),
                  {(-((8'hbc) ? reg9 : (8'ha0))),
                      $unsigned(reg13[(1'h1):(1'h1)])}} << (8'hb2));
            end
          reg17 <= $signed(($unsigned(reg8[(3'h5):(3'h5)]) ?
              $signed(reg6[(2'h2):(2'h2)]) : (!($signed(reg13) ?
                  ((8'hb8) | reg12) : (wire0 ? wire1 : wire0)))));
          if (reg8[(5'h14):(4'h8)])
            begin
              reg18 <= $signed({((&$unsigned(reg13)) + $signed(reg14))});
              reg19 <= (^~{{$unsigned((reg7 ? reg15 : reg10)), {{(8'hb5)}}}});
              reg20 <= ((8'hbe) ?
                  (reg17[(3'h5):(3'h5)] < $signed(((8'ha5) ?
                      (~|reg6) : (8'hbf)))) : (reg18[(1'h0):(1'h0)] >> $signed(((reg6 ?
                      reg8 : reg9) ^~ (wire0 ? reg16 : reg7)))));
            end
          else
            begin
              reg18 <= (reg16[(4'h9):(4'h9)] ?
                  wire4[(4'h8):(3'h7)] : reg20[(4'hb):(3'h5)]);
              reg19 <= $unsigned(((((~&reg20) ?
                          reg15[(1'h1):(1'h1)] : (reg16 ? wire4 : reg6)) ?
                      reg7[(4'he):(1'h1)] : reg20[(2'h3):(1'h0)]) ?
                  (~|$unsigned((reg13 > reg7))) : $unsigned((reg7[(2'h2):(1'h0)] || $unsigned(wire0)))));
              reg20 <= ($unsigned($signed(({reg16} | $unsigned(reg6)))) ?
                  $signed(($signed({reg15}) ?
                      ((|(8'ha3)) ^~ $unsigned(wire4)) : reg7)) : (~^($signed(wire5[(5'h10):(4'hb)]) ?
                      {wire3} : ($signed(reg17) < wire2))));
              reg21 <= (8'ha9);
              reg22 <= reg16;
            end
        end
      else
        begin
          if (((reg12 ?
                  (((reg15 != wire11) & $signed(wire5)) ?
                      (reg21[(1'h1):(1'h1)] ?
                          $unsigned(reg14) : $signed((8'hb4))) : wire2) : ($signed((reg12 >> reg18)) << {(~|reg9)})) ?
              ($signed({wire1[(4'hb):(3'h5)],
                  (reg17 * reg22)}) | $signed({{reg21,
                      wire11}})) : (wire5 < ($signed($signed(reg8)) ?
                  ($signed((8'h9d)) - $signed((8'hbe))) : {(^(8'ha3))}))))
            begin
              reg13 <= reg10;
            end
          else
            begin
              reg13 <= reg13[(2'h2):(2'h2)];
            end
          if (wire2[(4'ha):(4'ha)])
            begin
              reg14 <= (wire0 ?
                  $signed({(8'ha0)}) : $signed((wire5[(5'h13):(5'h10)] ^~ wire0[(4'h9):(2'h3)])));
              reg15 <= reg12;
              reg16 <= wire2[(4'h9):(3'h7)];
              reg17 <= $unsigned({(&((~|wire1) ~^ (reg7 ? reg22 : (8'ha6))))});
            end
          else
            begin
              reg14 <= {wire0[(3'h7):(3'h5)]};
              reg15 <= (-reg12[(3'h6):(3'h5)]);
              reg16 <= $unsigned((|(($unsigned(reg15) << wire4[(1'h0):(1'h0)]) ?
                  reg21 : $signed(reg6[(1'h0):(1'h0)]))));
              reg17 <= reg12[(3'h5):(3'h5)];
            end
          reg18 <= $signed((({reg10} ?
                  {(reg7 ? wire4 : wire0), (~&reg16)} : (~^(8'hb5))) ?
              $unsigned($unsigned((~^reg7))) : ($unsigned(reg15) ?
                  (~$unsigned((8'ha0))) : {$unsigned((8'hb8)), reg9})));
          reg19 <= (~$unsigned((+reg10)));
        end
      reg23 <= (+wire1[(2'h2):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg24 <= (reg22[(3'h5):(3'h4)] ?
          (-(((wire4 < wire1) ~^ (-(8'ha4))) <= $signed((8'hb5)))) : $unsigned(((8'hbc) ?
              wire5[(5'h10):(4'hd)] : {(wire4 ? (8'hbd) : reg15)})));
      reg25 <= ($unsigned(($unsigned((~&reg12)) ?
          reg15[(4'hc):(4'hc)] : wire3[(4'h8):(3'h4)])) + ($unsigned(((~^reg19) ?
              $unsigned(wire5) : reg22[(3'h5):(2'h2)])) ?
          reg17[(1'h0):(1'h0)] : $unsigned($unsigned((~reg23)))));
      reg26 <= {(reg8 <<< (~^{(~|reg21), reg14[(3'h6):(3'h5)]}))};
      reg27 <= reg21[(5'h12):(3'h6)];
      reg28 <= reg26[(2'h3):(1'h1)];
    end
  assign wire29 = (~&($unsigned(reg25[(1'h1):(1'h1)]) != $unsigned(wire1)));
  assign wire30 = $signed(((-$unsigned(reg17)) ?
                      ({(~reg13)} ?
                          $unsigned((reg7 ?
                              reg23 : wire1)) : reg9[(3'h4):(1'h0)]) : ($unsigned($unsigned(reg25)) ?
                          (|$unsigned(reg17)) : {(+wire2)})));
  assign wire31 = wire4[(5'h11):(4'hf)];
  assign wire32 = $signed($unsigned((reg18 - {$unsigned((8'hb9)),
                      ((8'h9d) + reg12)})));
  assign wire33 = $signed(wire1);
  assign wire34 = {wire3[(3'h6):(2'h2)]};
  assign wire35 = $signed($signed($signed(wire32)));
  assign wire36 = wire30[(3'h4):(1'h0)];
  assign wire37 = $signed({reg26[(2'h2):(2'h2)],
                      $unsigned($unsigned((reg6 >> (8'h9c))))});
  assign wire38 = {reg15[(4'hd):(4'hb)],
                      $unsigned(({(reg7 ? reg19 : wire29)} ?
                          (reg8 ?
                              {reg16, (8'hba)} : (~(8'hb4))) : (~|(~reg27))))};
  assign wire39 = wire11[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg40 <= $signed($unsigned(($unsigned((wire33 <= reg21)) ?
          $signed({reg8, wire4}) : reg16[(4'ha):(4'h9)])));
      reg41 <= (!((((reg25 ?
          reg19 : reg18) - $signed(wire39)) >> ((wire31 & reg40) ?
          (wire2 ?
              reg7 : reg12) : (8'hab))) - $signed($signed($signed((8'h9c))))));
      if ($signed((($unsigned(reg8[(4'hd):(4'h9)]) ?
          (wire38[(1'h0):(1'h0)] * wire37[(2'h2):(1'h1)]) : ($signed(reg12) ?
              $signed(wire0) : $signed(reg28))) ^~ wire38[(4'ha):(1'h0)])))
        begin
          reg42 <= $unsigned($signed((^$signed((wire37 == reg24)))));
        end
      else
        begin
          if ($signed($signed($unsigned((!(~^reg16))))))
            begin
              reg42 <= {((wire0[(4'h9):(2'h2)] ?
                      ((reg22 ?
                          reg7 : reg28) || (~wire37)) : (~^$unsigned(reg41))) < {(^(reg12 ?
                          reg25 : (8'hba)))})};
              reg43 <= wire34;
              reg44 <= (({(wire35[(4'ha):(1'h1)] == $signed(wire11)),
                  {$signed(wire32),
                      (reg17 <<< wire31)}} >> ((((8'hb3) <<< reg19) == (8'hb7)) ?
                  wire32[(3'h7):(1'h1)] : {$unsigned(reg6)})) | (8'hbf));
              reg45 <= $unsigned(($unsigned({(reg26 * reg12)}) && $signed($signed(reg19[(1'h1):(1'h0)]))));
            end
          else
            begin
              reg42 <= {((~|$unsigned((~|reg6))) ^ reg25[(1'h1):(1'h1)])};
              reg43 <= ((^$signed(wire38[(4'he):(4'hb)])) ?
                  (({$signed((8'hb2))} ?
                          wire35 : {{wire29, reg23}, wire37[(3'h6):(3'h4)]}) ?
                      (((wire2 ? reg41 : reg18) ?
                          $signed(reg25) : (wire5 > wire38)) ^~ ($unsigned(wire5) ?
                          (wire29 >> reg6) : wire1)) : wire3[(3'h7):(1'h1)]) : $signed((($unsigned(reg15) + $unsigned((8'hb0))) ?
                      (reg6[(1'h0):(1'h0)] + ((7'h41) <<< reg28)) : {wire35,
                          (wire35 ? reg18 : reg14)})));
              reg44 <= ((reg26 ?
                      reg10[(1'h0):(1'h0)] : {$signed($unsigned(wire2)),
                          wire0[(4'hb):(4'h9)]}) ?
                  ($unsigned(((+reg24) ?
                      reg10[(4'h9):(2'h2)] : (reg15 >> reg43))) | (8'hb7)) : wire5[(2'h3):(1'h1)]);
            end
          reg46 <= $unsigned(reg19);
          reg47 <= wire34;
        end
    end
  assign wire48 = ($signed(reg8[(2'h2):(1'h1)]) << (|((+$signed(wire35)) ?
                      {{reg40}, $signed(reg21)} : reg16[(3'h6):(3'h5)])));
  assign wire49 = ((reg41[(1'h1):(1'h1)] ?
                          $unsigned((!wire31[(3'h4):(1'h1)])) : (~&$unsigned((reg25 ?
                              wire31 : wire2)))) ?
                      $signed(wire5) : (^~$unsigned(reg19)));
  assign wire50 = (($unsigned($unsigned($signed((8'hab)))) ~^ ($signed((!reg42)) ?
                          (^$unsigned(reg10)) : wire49[(2'h2):(2'h2)])) ?
                      {wire0[(1'h0):(1'h0)]} : $unsigned((($unsigned(reg12) ?
                          {wire30} : wire32[(3'h7):(3'h4)]) <= ((+wire36) ?
                          $unsigned(wire31) : ((8'hb4) ^ reg21)))));
  assign wire51 = reg42[(3'h6):(2'h3)];
  assign wire52 = wire38[(4'hd):(1'h1)];
endmodule
