module top
#(parameter param42 = (^~(!(^{(^~(7'h42)), {(8'hb0)}}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1b8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire4;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  reg [(4'hc):(1'h0)] reg41 = (1'h0);
  reg [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(4'hd):(1'h0)] reg34 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(3'h5):(1'h0)] reg10 = (1'h0);
  assign y = {wire19,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = wire4[(1'h0):(1'h0)];
  assign wire6 = ($unsigned((wire0[(4'h8):(3'h5)] ?
                         (((8'hbf) ?
                             wire2 : wire0) != wire5[(3'h7):(3'h4)]) : wire2[(1'h1):(1'h0)])) ?
                     $unsigned($signed(wire2)) : $signed($unsigned((wire5 ~^ (~&wire5)))));
  assign wire7 = ($unsigned((^~wire0)) ?
                     (($signed(wire1[(4'ha):(1'h1)]) * (8'ha3)) ?
                         (-wire6[(1'h0):(1'h0)]) : $signed(wire2[(2'h2):(1'h1)])) : (wire6 != $unsigned($unsigned($signed(wire0)))));
  assign wire8 = {{$unsigned(($unsigned(wire5) ? (~|wire4) : wire1)),
                         $signed($unsigned((8'hbe)))}};
  assign wire9 = ($signed({$unsigned(wire6),
                         ((wire2 + wire7) ? $unsigned(wire1) : wire6)}) ?
                     $signed($unsigned($unsigned($signed(wire0)))) : (((-(wire1 >>> (8'hab))) > $signed((8'hb7))) <<< {(wire2 >= (wire4 ?
                             wire0 : (8'hb2)))}));
  always
    @(posedge clk) begin
      if (wire0)
        begin
          reg10 <= wire2;
          if ((wire0[(2'h2):(2'h2)] ?
              reg10[(1'h0):(1'h0)] : ((+{(+wire4),
                  (wire4 ^ wire6)}) < (+$unsigned((-wire8))))))
            begin
              reg11 <= (&wire5[(3'h5):(3'h4)]);
              reg12 <= $signed(((($signed(wire1) && wire5) ?
                      wire9[(4'he):(2'h3)] : reg10) ?
                  (((reg10 ? (8'hab) : wire2) - wire7) << ({wire4} ?
                      $unsigned(wire4) : wire3)) : ({reg11[(3'h5):(1'h1)]} ~^ $unsigned(wire4))));
              reg13 <= {(~&$unsigned(wire9[(4'h8):(2'h3)]))};
            end
          else
            begin
              reg11 <= (-(wire1 ?
                  (-$signed(wire8)) : (~&wire1[(1'h0):(1'h0)])));
              reg12 <= wire2;
              reg13 <= (^(^~(wire6 * $signed((wire8 - wire4)))));
            end
          reg14 <= wire0[(4'hb):(3'h5)];
        end
      else
        begin
          if ($unsigned(((~|$unsigned(wire8)) ?
              (&(^(wire2 ? wire7 : reg12))) : $unsigned($unsigned((|reg14))))))
            begin
              reg10 <= $unsigned((+reg14[(1'h0):(1'h0)]));
              reg11 <= $unsigned($signed($unsigned($unsigned((8'hbc)))));
              reg12 <= (&(wire8[(3'h5):(3'h5)] | $unsigned(wire2[(1'h1):(1'h1)])));
              reg13 <= ($unsigned($unsigned((reg14[(1'h0):(1'h0)] <<< $signed((8'ha1))))) != (reg11 - wire7[(4'h8):(2'h3)]));
            end
          else
            begin
              reg10 <= $unsigned($signed(($unsigned((wire2 ? (8'hbf) : reg13)) ?
                  ($signed((8'ha4)) ? (~&reg12) : $unsigned(wire5)) : reg12)));
              reg11 <= $unsigned(((($signed(reg11) == $signed(reg11)) && $unsigned((&wire7))) ?
                  ((|$unsigned(reg11)) <= ((8'ha2) - (^wire0))) : $unsigned(wire2)));
            end
          reg14 <= ((7'h43) <<< $signed({$signed($unsigned(wire1)),
              (-wire5[(5'h13):(4'h8)])}));
          reg15 <= $signed(wire7[(3'h4):(1'h0)]);
          reg16 <= wire7;
          reg17 <= (^({wire4[(3'h4):(1'h1)]} ?
              (8'hb4) : $unsigned(reg13[(4'h8):(3'h6)])));
        end
      reg18 <= (&({((wire0 >>> wire4) - (wire7 ? wire6 : wire5)),
          ($signed(wire7) && {reg16})} && wire1));
    end
  assign wire19 = $unsigned(((((wire5 - wire2) ?
                              $signed(wire3) : (wire9 ~^ reg17)) ?
                          (^~$unsigned(reg10)) : wire5[(1'h1):(1'h0)]) ?
                      reg16 : (|$signed($unsigned(wire8)))));
  always
    @(posedge clk) begin
      if ($unsigned(reg16[(4'h8):(1'h1)]))
        begin
          reg20 <= (&$signed(wire5));
          reg21 <= (reg13 ? $signed(reg12) : $signed(reg16));
          if ((~|$signed(reg16[(5'h13):(4'h9)])))
            begin
              reg22 <= ($signed($unsigned(($unsigned(reg11) ?
                  (wire8 ~^ (8'ha2)) : reg14[(1'h1):(1'h1)]))) & wire9);
            end
          else
            begin
              reg22 <= (~^$unsigned((~^wire19)));
              reg23 <= (($signed(($signed(reg21) ?
                          (reg22 ? reg12 : (7'h44)) : (wire5 ?
                              reg16 : reg20))) ?
                      (^~$signed(wire5)) : (~($unsigned(wire2) ?
                          (|reg10) : (|reg16)))) ?
                  $unsigned((~|(reg14 - (reg11 ?
                      reg12 : wire19)))) : $unsigned($signed(((reg22 ?
                          wire9 : wire7) ?
                      {reg22, reg20} : $unsigned(reg13)))));
              reg24 <= ((^~(((8'ha8) * {(8'hbd),
                  wire2}) > $signed(wire2[(1'h1):(1'h0)]))) || (8'hbe));
              reg25 <= {{$signed(reg24)}};
            end
          reg26 <= $unsigned($signed($unsigned(({wire9, (7'h40)} ?
              $signed(wire9) : (|wire6)))));
        end
      else
        begin
          reg20 <= (wire4[(2'h3):(1'h0)] != (wire1[(3'h6):(3'h6)] * ((8'hb9) ~^ $unsigned($signed(wire3)))));
          if (($signed(((reg25 ? $unsigned(wire19) : {wire2, wire7}) ?
                  $signed((reg12 ?
                      wire0 : (8'ha6))) : ($signed(wire4) != $signed((8'hbb))))) ?
              (|reg25[(2'h2):(1'h0)]) : wire7[(1'h1):(1'h0)]))
            begin
              reg21 <= wire6;
              reg22 <= $unsigned($unsigned($unsigned(wire9)));
            end
          else
            begin
              reg21 <= ((7'h44) ?
                  (|{wire5,
                      {((8'ha3) ? wire5 : (8'hbb)),
                          wire5}}) : ((~|(wire3 && {reg10,
                      reg15})) >>> $signed($unsigned($signed(reg17)))));
              reg22 <= wire1;
              reg23 <= $unsigned({(~^(|$signed(reg25)))});
              reg24 <= ($signed($unsigned((-(|wire9)))) + $unsigned({{(reg26 ?
                          reg20 : reg25),
                      wire8[(3'h7):(2'h3)]}}));
              reg25 <= $unsigned(reg14[(3'h4):(2'h3)]);
            end
          reg26 <= {((|wire19[(4'hd):(1'h0)]) != $signed((!wire6))),
              $unsigned(($unsigned((wire2 ?
                  (8'hb3) : wire9)) & reg15[(3'h7):(2'h2)]))};
          reg27 <= $signed(wire0);
          reg28 <= ($unsigned((reg13 ?
              (|$signed((8'haa))) : ($unsigned((8'h9c)) <<< $unsigned(wire8)))) * $unsigned($unsigned($unsigned(wire6[(4'h8):(2'h3)]))));
        end
      reg29 <= $signed($signed((reg24 && ((reg15 ? reg11 : wire5) ?
          (~&wire6) : (8'h9d)))));
      reg30 <= $signed($unsigned({(8'ha8), (reg11 ? reg22 : {reg18})}));
      if ({reg22[(1'h0):(1'h0)]})
        begin
          reg31 <= {$unsigned(wire19[(3'h7):(2'h3)])};
        end
      else
        begin
          reg31 <= $unsigned($unsigned(wire19[(4'hb):(4'h9)]));
          reg32 <= $unsigned((reg22 ?
              ((((8'h9c) ? wire7 : reg23) ?
                  $signed(wire5) : reg30[(4'hc):(1'h1)]) + (&$unsigned(reg27))) : (((8'hac) == (reg29 || (7'h44))) ~^ reg24)));
          if (((~&$unsigned((~wire4[(3'h4):(1'h0)]))) ?
              ((^~(wire19[(3'h4):(1'h0)] & $unsigned((8'ha0)))) ?
                  $signed($unsigned(((8'hb4) >>> (8'hb9)))) : $signed(wire7)) : reg13[(4'h9):(3'h7)]))
            begin
              reg33 <= $signed($unsigned(reg14[(1'h0):(1'h0)]));
              reg34 <= $signed($signed((^((reg15 ? reg16 : reg24) || wire1))));
              reg35 <= (!reg32);
              reg36 <= (wire6[(3'h7):(3'h6)] ?
                  reg29 : $unsigned(({$unsigned((8'hb2))} ?
                      $unsigned($signed(reg28)) : wire9[(4'ha):(4'h8)])));
            end
          else
            begin
              reg33 <= (reg12[(3'h4):(1'h1)] | (~&wire0[(4'hb):(3'h6)]));
              reg34 <= (((((reg11 || reg29) ? wire0[(4'hc):(4'hc)] : reg30) ?
                      (+(reg25 <<< (8'h9d))) : {{wire19}}) & reg32[(1'h1):(1'h0)]) ?
                  (-reg28) : (({(reg32 ? wire9 : reg28), reg20[(3'h4):(3'h4)]} ?
                          $signed(reg16[(5'h13):(5'h13)]) : {$signed(reg23),
                              $unsigned((8'hac))}) ?
                      ($unsigned((^~reg11)) ?
                          wire19[(4'he):(2'h2)] : wire6) : (reg36[(4'hc):(3'h6)] ?
                          {(reg10 ? reg36 : wire1),
                              $unsigned(wire3)} : ($signed((8'ha6)) ?
                              {wire3, reg11} : reg10))));
              reg35 <= reg29;
            end
        end
      reg37 <= ({($signed((reg30 ? reg20 : reg34)) ?
              (((8'ha2) | (8'ha7)) || reg13[(4'hc):(2'h3)]) : ((-reg10) ?
                  (reg36 ? wire5 : reg13) : $unsigned(reg10))),
          $unsigned(reg36[(5'h12):(2'h2)])} > ($unsigned({$unsigned(wire3),
              (reg12 ? wire9 : (8'h9f))}) ?
          reg25[(2'h2):(2'h2)] : ($signed((^reg21)) ?
              $signed(((8'hb4) > reg14)) : (~&{reg18}))));
    end
  always
    @(posedge clk) begin
      reg38 <= $signed(reg35);
      reg39 <= {(reg37[(3'h4):(2'h3)] ?
              {$unsigned($signed((8'hae))), (^~$unsigned(wire19))} : reg36),
          (!wire1)};
      reg40 <= ($signed(((|$unsigned(wire6)) ?
              $signed((reg39 ^~ wire5)) : (!$unsigned(reg12)))) ?
          (reg34 ?
              wire1 : ((^~reg32) ?
                  (~(8'had)) : (|$unsigned(wire5)))) : ((!{$signed(wire2)}) != $signed(($signed(wire9) ?
              (reg31 == (8'hbe)) : wire8))));
      reg41 <= (8'hb9);
    end
endmodule
