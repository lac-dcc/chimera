module top
#(parameter param58 = (~|(&((((8'h9f) ? (8'h9f) : (7'h43)) || ((8'hbe) ? (8'hb9) : (7'h41))) ? (|((8'hbd) ? (8'hb3) : (8'hbe))) : (+((8'ha1) <<< (8'hbf)))))), 
parameter param59 = param58)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h24f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire57;
  wire signed [(5'h12):(1'h0)] wire44;
  wire signed [(5'h10):(1'h0)] wire34;
  wire [(4'hc):(1'h0)] wire33;
  wire [(3'h6):(1'h0)] wire32;
  wire [(5'h14):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire14;
  wire [(4'h9):(1'h0)] wire13;
  reg signed [(4'h8):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg50 = (1'h0);
  reg [(4'hc):(1'h0)] reg49 = (1'h0);
  reg [(3'h4):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg45 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg [(2'h3):(1'h0)] reg41 = (1'h0);
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(4'ha):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(3'h6):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(4'h8):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg5 = (1'h0);
  assign y = {wire57,
                 wire44,
                 wire34,
                 wire33,
                 wire32,
                 wire30,
                 wire14,
                 wire13,
                 reg56,
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
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg31,
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
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (((8'hae) == wire4[(1'h1):(1'h0)]))
        begin
          if ((wire0[(1'h1):(1'h0)] <= wire2[(3'h4):(3'h4)]))
            begin
              reg5 <= wire4[(3'h5):(2'h2)];
            end
          else
            begin
              reg5 <= {(~(((wire2 - wire1) ?
                      wire1 : (8'hb5)) * (reg5 * wire4)))};
              reg6 <= $signed((wire2[(2'h3):(2'h2)] ? (~|wire4) : wire3));
              reg7 <= {reg5[(1'h0):(1'h0)]};
              reg8 <= $signed($signed({(~&reg5[(1'h0):(1'h0)])}));
            end
          if ((((((reg8 ? wire4 : reg5) ?
                          (wire3 ? reg7 : wire4) : $unsigned(wire1)) ?
                      ($unsigned(wire4) ?
                          $signed(wire4) : ((8'hb2) < reg5)) : wire4[(1'h0):(1'h0)]) ?
                  ($signed({wire0}) || ((wire0 + wire2) ?
                      wire3 : (reg8 ? wire4 : wire4))) : reg8) ?
              ($signed(reg5[(1'h0):(1'h0)]) ?
                  (((wire3 ? reg5 : wire4) || (8'ha3)) ?
                      reg7 : $unsigned(wire0[(1'h0):(1'h0)])) : (!((reg5 > wire3) >>> (reg6 << wire3)))) : $unsigned(({wire1[(3'h5):(3'h5)],
                      wire0[(4'hd):(3'h4)]} ?
                  wire4 : $signed($unsigned((8'hb7)))))))
            begin
              reg9 <= ({reg7[(4'hc):(3'h4)]} ?
                  {reg5[(1'h1):(1'h0)],
                      (reg6 <= ((8'hb7) ?
                          (reg6 ?
                              wire2 : reg6) : (8'h9e)))} : $unsigned({($unsigned((8'h9c)) << wire0[(4'hb):(2'h3)])}));
              reg10 <= ($signed($unsigned(wire4[(4'ha):(3'h5)])) + $unsigned($unsigned($signed($unsigned(wire1)))));
            end
          else
            begin
              reg9 <= wire2[(3'h7):(3'h7)];
              reg10 <= wire4;
              reg11 <= ((reg9 * $unsigned((reg8 != {wire2,
                  reg8}))) || ((((wire0 & wire3) ?
                          (~^(8'hb3)) : $signed((8'hb4))) ?
                      (^reg10[(1'h0):(1'h0)]) : wire3[(4'hd):(3'h4)]) ?
                  ({((8'ha3) ? (8'h9c) : reg6), wire0[(1'h1):(1'h1)]} ?
                      $signed($signed(reg8)) : (&wire4[(2'h3):(2'h2)])) : (|reg9)));
            end
        end
      else
        begin
          reg5 <= (|(($signed($unsigned((8'h9e))) ?
                  $unsigned((reg6 ?
                      (8'h9c) : reg5)) : $signed(reg8[(3'h5):(2'h3)])) ?
              (-reg5[(1'h1):(1'h0)]) : ($signed((8'hb5)) ?
                  wire4 : $unsigned(wire0[(4'h9):(2'h3)]))));
          reg6 <= $signed((($unsigned((reg11 ?
              wire1 : reg6)) != (|(-(8'hb8)))) * (reg9[(3'h7):(3'h4)] - $unsigned((reg6 ?
              (8'ha4) : reg8)))));
        end
      reg12 <= ({$unsigned(((~&wire2) <= {wire4, reg11})),
              (((8'h9e) ^~ {reg5, reg10}) ?
                  wire1 : ($unsigned(wire2) <<< (wire2 == reg8)))} ?
          $signed({wire2[(4'hf):(4'hb)]}) : reg5);
    end
  assign wire13 = $signed(($signed(reg11) == reg10[(1'h1):(1'h0)]));
  assign wire14 = wire13[(3'h6):(3'h4)];
  always
    @(posedge clk) begin
      reg15 <= ((~^reg12[(1'h1):(1'h0)]) >= (wire1 || wire0[(3'h5):(3'h4)]));
      reg16 <= wire13[(1'h0):(1'h0)];
      if (wire14)
        begin
          reg17 <= (-(wire0 || $signed(((reg5 << reg15) << reg11))));
          if ((wire13[(1'h1):(1'h0)] ? wire1 : reg10))
            begin
              reg18 <= wire14[(1'h1):(1'h0)];
            end
          else
            begin
              reg18 <= reg10;
              reg19 <= $unsigned({(+{(8'hb6), (reg17 ? reg17 : reg12)}),
                  (+$signed($signed((7'h43))))});
              reg20 <= $signed(wire1[(4'hf):(3'h6)]);
            end
          if ($signed(($unsigned({(~&(8'ha7))}) != (-$signed((-reg9))))))
            begin
              reg21 <= $signed($unsigned(wire3[(4'h9):(2'h2)]));
              reg22 <= wire14[(4'h8):(3'h5)];
              reg23 <= $unsigned(reg16[(1'h1):(1'h0)]);
              reg24 <= ($unsigned((^$signed((reg11 >> (8'haf))))) ?
                  ($unsigned(reg20[(3'h4):(2'h2)]) ?
                      $signed(wire2[(5'h11):(3'h4)]) : $signed(reg23[(1'h0):(1'h0)])) : {((~(8'h9f)) ?
                          wire4[(4'hb):(3'h6)] : {reg5[(2'h2):(1'h1)]})});
              reg25 <= $unsigned(reg8);
            end
          else
            begin
              reg21 <= $signed($signed({((reg10 >= (8'hbb)) <<< $signed(reg17))}));
              reg22 <= $signed(((&({wire3, reg16} ?
                  (&wire4) : (reg20 < reg18))) << (reg5[(1'h1):(1'h0)] <<< (reg15 ?
                  reg8[(2'h3):(2'h2)] : (wire4 ? reg25 : wire13)))));
            end
          reg26 <= reg20;
          reg27 <= wire1;
        end
      else
        begin
          reg17 <= (8'hb2);
          reg18 <= $unsigned(reg21);
        end
      reg28 <= reg5;
      reg29 <= ((reg25 ? reg10 : (|(~$signed(reg6)))) ?
          ((((reg8 > reg15) ^ (reg25 ? reg18 : reg11)) != ((reg20 - reg17) ?
              reg18 : $unsigned(wire14))) ~^ $unsigned(($signed(reg7) || $unsigned(wire0)))) : $signed((((+reg16) < wire4) ?
              wire1 : $unsigned((8'hb9)))));
    end
  assign wire30 = $signed(((-(reg25 ? reg9 : (reg19 > reg15))) ?
                      ($signed((reg15 ?
                          reg23 : reg27)) + (~|$unsigned(reg26))) : reg16));
  always
    @(posedge clk) begin
      reg31 <= {(reg25[(4'h9):(3'h4)] ?
              reg25[(3'h7):(2'h3)] : $unsigned(wire2[(5'h11):(1'h1)])),
          reg24};
    end
  assign wire32 = (reg31[(3'h4):(1'h1)] ?
                      reg5[(2'h2):(1'h0)] : ((~$unsigned($signed(reg20))) || $signed((8'ha8))));
  assign wire33 = reg8[(3'h4):(2'h2)];
  assign wire34 = ((reg23[(1'h0):(1'h0)] ?
                      $unsigned($signed($signed(reg9))) : reg8) >>> $unsigned(reg15));
  always
    @(posedge clk) begin
      reg35 <= wire14;
      if (($signed((wire0[(4'ha):(3'h6)] && $unsigned($signed(wire13)))) ~^ wire32[(3'h6):(3'h5)]))
        begin
          reg36 <= wire32;
          reg37 <= $unsigned((~|$signed($unsigned($unsigned(reg9)))));
        end
      else
        begin
          if (($signed((^reg10)) >= $unsigned(wire3[(3'h7):(1'h0)])))
            begin
              reg36 <= $signed(reg15[(3'h6):(1'h1)]);
              reg37 <= ((|(($signed(wire14) ? (-reg21) : {reg26, (7'h41)}) ?
                      {{reg31, reg36},
                          (reg27 ?
                              wire34 : reg16)} : $signed($signed((8'h9c))))) ?
                  wire34 : (~^$unsigned((+wire13[(3'h5):(2'h2)]))));
              reg38 <= reg28;
              reg39 <= ($signed(reg35) ?
                  (~(~reg9)) : (reg16 | $unsigned((((7'h44) - reg9) ?
                      (+reg10) : $signed(reg9)))));
              reg40 <= $unsigned($signed((wire30[(5'h11):(4'ha)] >= $unsigned($signed(reg36)))));
            end
          else
            begin
              reg36 <= ((~^reg24[(4'ha):(3'h6)]) >>> reg25);
              reg37 <= reg6[(3'h5):(1'h0)];
              reg38 <= {(reg27[(2'h3):(2'h3)] - wire3)};
              reg39 <= $unsigned((-{((reg39 ~^ reg35) ?
                      reg23[(1'h0):(1'h0)] : $signed(reg20)),
                  (7'h43)}));
              reg40 <= (!$signed($unsigned(($signed(reg17) < $unsigned((8'hbc))))));
            end
          if ($unsigned(reg7[(4'h8):(2'h3)]))
            begin
              reg41 <= (~$unsigned(wire34));
            end
          else
            begin
              reg41 <= $unsigned(reg10[(2'h3):(1'h1)]);
              reg42 <= {$signed((&$signed(reg37)))};
            end
          reg43 <= (~&(reg25[(4'hc):(4'h9)] && (reg31[(4'h8):(3'h4)] ?
              ((reg22 ?
                  reg21 : (7'h44)) ^~ $signed((7'h44))) : ($signed(reg10) ?
                  $unsigned(reg25) : $signed(wire1)))));
        end
    end
  assign wire44 = {reg35[(4'h9):(3'h6)],
                      (reg9 ? reg43 : ((~^reg11) ^~ reg20[(4'h8):(3'h6)]))};
  always
    @(posedge clk) begin
      if ((~^reg43[(2'h2):(1'h1)]))
        begin
          reg45 <= reg43[(4'hc):(4'h9)];
          reg46 <= (!(({reg28,
              reg45} >= ((^reg10) <<< $unsigned((8'ha5)))) == {wire2,
              $signed((wire34 ? reg21 : reg23))}));
        end
      else
        begin
          reg45 <= {$unsigned($signed({(wire34 ? reg37 : reg46)}))};
          reg46 <= $unsigned((~((~(reg38 && reg26)) ?
              $unsigned(wire32[(2'h2):(2'h2)]) : $unsigned($unsigned((8'hb6))))));
          if ((~$signed((|{reg43[(4'h8):(1'h0)], (reg36 * (8'ha5))}))))
            begin
              reg47 <= (wire0 ?
                  {reg45} : (!$unsigned((reg21[(1'h0):(1'h0)] ^~ (+(8'hb8))))));
              reg48 <= (!$signed(wire34));
              reg49 <= wire32[(3'h6):(2'h3)];
            end
          else
            begin
              reg47 <= reg21[(4'h9):(3'h7)];
              reg48 <= (8'ha3);
              reg49 <= $unsigned(reg28);
            end
          reg50 <= {reg11};
          reg51 <= (~{(reg8[(4'h8):(3'h6)] ?
                  $signed(((8'hae) ? reg45 : reg40)) : $unsigned(wire44))});
        end
      if ($signed($unsigned($unsigned(($unsigned((7'h44)) ?
          (reg36 ? reg17 : reg26) : $signed(reg7))))))
        begin
          reg52 <= (wire0 != $unsigned((!$unsigned(reg21))));
        end
      else
        begin
          reg52 <= reg47[(3'h6):(3'h4)];
        end
      if ((+wire0))
        begin
          reg53 <= wire2;
          reg54 <= reg7[(4'ha):(2'h2)];
        end
      else
        begin
          reg53 <= ($signed(((~^$signed(reg51)) != (8'ha4))) * $unsigned($signed(reg38)));
          reg54 <= (&{$unsigned({reg37[(1'h0):(1'h0)]})});
        end
      reg55 <= {$unsigned(reg22[(2'h2):(1'h0)]),
          {({{wire2, reg17}, ((7'h42) ? reg40 : reg6)} + $signed((reg40 ?
                  reg40 : reg7)))}};
      reg56 <= $unsigned(reg22[(3'h6):(2'h3)]);
    end
  assign wire57 = reg8;
endmodule
