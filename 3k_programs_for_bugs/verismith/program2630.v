module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1ed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire51;
  wire signed [(4'hf):(1'h0)] wire50;
  wire [(3'h4):(1'h0)] wire49;
  wire signed [(2'h2):(1'h0)] wire48;
  wire [(4'h8):(1'h0)] wire15;
  wire signed [(4'he):(1'h0)] wire14;
  wire [(3'h6):(1'h0)] wire13;
  wire signed [(2'h3):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire4;
  reg signed [(3'h5):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg46 = (1'h0);
  reg [(5'h15):(1'h0)] reg45 = (1'h0);
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(3'h4):(1'h0)] reg34 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(4'h8):(1'h0)] reg8 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire15,
                 wire14,
                 wire13,
                 wire7,
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
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire4 = $unsigned({(wire0 + wire0), wire3[(1'h1):(1'h1)]});
  assign wire5 = $signed(wire3);
  assign wire6 = $unsigned(($unsigned({(wire5 ? wire4 : wire3)}) ?
                     ((^~$unsigned(wire2)) <= ((~wire2) ?
                         (wire3 < wire3) : (8'ha8))) : wire1[(2'h2):(1'h0)]));
  assign wire7 = {wire6[(3'h6):(1'h1)]};
  always
    @(posedge clk) begin
      reg8 <= $unsigned(wire0[(3'h7):(3'h6)]);
      reg9 <= $unsigned((&wire7));
      reg10 <= $unsigned(($unsigned(($signed(wire7) >> (reg8 ^ reg8))) ?
          wire5[(2'h3):(1'h1)] : ($unsigned($signed(wire1)) ?
              $unsigned(wire4[(4'ha):(1'h1)]) : $signed($signed(reg9)))));
      reg11 <= ((!$unsigned(wire0[(4'h9):(3'h5)])) ?
          ((reg8[(3'h7):(3'h7)] ? wire1 : reg8[(3'h6):(3'h6)]) ?
              (~^wire1[(4'h8):(3'h4)]) : ({$signed(reg9)} ^ $unsigned((~&wire1)))) : $unsigned($signed({(^wire3)})));
      reg12 <= (wire0[(1'h0):(1'h0)] == ((((reg8 ? wire6 : wire3) ?
          (wire3 ? wire4 : reg11) : (wire2 ?
              wire0 : wire7)) && $unsigned($unsigned(reg11))) == ($signed((wire2 == (7'h41))) != reg11[(2'h2):(1'h1)])));
    end
  assign wire13 = reg11;
  assign wire14 = (~^wire3);
  assign wire15 = reg11;
  always
    @(posedge clk) begin
      if (wire6)
        begin
          if ((~|wire15[(2'h3):(1'h1)]))
            begin
              reg16 <= (8'hbc);
            end
          else
            begin
              reg16 <= wire5;
              reg17 <= wire2;
              reg18 <= $unsigned(($signed(reg12) ?
                  reg17[(4'h9):(3'h4)] : (+((|wire2) & wire7))));
              reg19 <= ((+reg10) ?
                  ((8'h9c) ?
                      $signed($unsigned($unsigned((8'ha1)))) : $unsigned(wire7)) : wire13);
              reg20 <= wire6[(3'h5):(1'h1)];
            end
          if (wire5)
            begin
              reg21 <= (((($unsigned(reg9) ?
                          (reg18 + reg10) : wire13) & $signed($signed((8'hb3)))) ?
                      $unsigned(reg18[(4'hb):(1'h0)]) : ({wire3[(2'h2):(1'h1)]} ?
                          $signed((+reg11)) : ((+wire4) ?
                              wire15[(2'h3):(1'h1)] : {reg19}))) ?
                  wire0[(4'ha):(3'h5)] : (7'h40));
              reg22 <= $unsigned(reg11[(1'h0):(1'h0)]);
              reg23 <= $unsigned($signed((^((wire1 ?
                  reg21 : (8'hbd)) ~^ (wire3 ? reg22 : reg17)))));
              reg24 <= reg9;
            end
          else
            begin
              reg21 <= $signed(($unsigned({wire6[(1'h1):(1'h0)]}) ?
                  (~&(reg11 >> $signed(wire7))) : reg21[(5'h12):(4'hc)]));
              reg22 <= ($unsigned($signed(reg10)) ? wire3 : {wire7});
              reg23 <= ({$unsigned({wire13})} << ($unsigned((wire5[(1'h1):(1'h1)] - $unsigned(reg9))) ?
                  reg11 : $unsigned((~|$unsigned(wire2)))));
            end
        end
      else
        begin
          reg16 <= (|reg23[(1'h0):(1'h0)]);
        end
      if ((~^(wire3[(3'h5):(2'h2)] ?
          wire15[(4'h8):(3'h5)] : ((reg18 < $unsigned(wire13)) ?
              $unsigned((reg20 << (7'h41))) : wire14[(3'h4):(1'h1)]))))
        begin
          if ($unsigned((wire14[(4'h9):(4'h8)] ? $unsigned(reg11) : reg22)))
            begin
              reg25 <= $unsigned((((reg24[(4'hc):(4'hb)] ?
                      (wire14 != reg9) : $signed(wire13)) ?
                  $signed(wire14[(2'h2):(2'h2)]) : $signed($unsigned(wire6))) ~^ reg19));
              reg26 <= {$unsigned(((wire5 ?
                      (reg16 ? wire2 : wire2) : reg18) > (~|(reg23 ?
                      (8'hb9) : reg20))))};
            end
          else
            begin
              reg25 <= $signed(($unsigned(reg19[(1'h0):(1'h0)]) - wire3[(3'h5):(1'h0)]));
              reg26 <= wire4;
            end
          reg27 <= $signed((wire15 ?
              {((wire0 ? wire15 : wire15) ?
                      (-reg16) : $unsigned(wire15))} : (wire0 ^ reg26)));
          if (({$unsigned(reg21[(2'h2):(1'h1)])} ?
              (reg27[(1'h0):(1'h0)] ?
                  {$signed(wire7),
                      $signed({reg20,
                          reg17})} : reg25[(2'h3):(1'h0)]) : (8'h9c)))
            begin
              reg28 <= reg23;
            end
          else
            begin
              reg28 <= reg16[(3'h5):(2'h3)];
              reg29 <= {reg21};
              reg30 <= (!((-reg21[(4'h9):(3'h7)]) ?
                  $signed((reg11 ^~ {reg16,
                      reg19})) : (-$signed(((8'ha0) && (8'hb8))))));
              reg31 <= {{wire5,
                      ({(reg11 ? reg12 : wire13)} ?
                          reg29[(3'h6):(2'h2)] : ({reg24} > $unsigned(wire7)))}};
            end
          reg32 <= wire4[(2'h3):(2'h3)];
          reg33 <= ({$signed(($signed(reg10) ?
                      reg22[(2'h2):(1'h0)] : $signed(reg8))),
                  (~$unsigned($signed(reg22)))} ?
              (8'hb1) : (~|((reg24 * (wire15 & reg16)) ?
                  ((reg10 | reg11) ?
                      reg28[(3'h6):(3'h6)] : reg32[(3'h5):(3'h5)]) : ((wire3 >> reg30) > (wire4 ?
                      (8'ha3) : (8'had))))));
        end
      else
        begin
          if (((reg30[(3'h4):(3'h4)] - (~^$unsigned(reg16))) ?
              reg11 : $unsigned((reg17 ?
                  $signed(reg19[(3'h4):(2'h2)]) : (~(wire0 ? reg31 : reg22))))))
            begin
              reg25 <= wire2[(2'h3):(1'h0)];
              reg26 <= (^{$signed($signed((reg18 >>> wire6))),
                  $unsigned(((8'ha2) && (reg9 ^~ (8'ha5))))});
              reg27 <= $unsigned(reg17);
              reg28 <= (|$signed({$signed((reg21 ? reg16 : wire4)),
                  $unsigned($unsigned(reg32))}));
              reg29 <= reg19;
            end
          else
            begin
              reg25 <= ((8'hb4) ?
                  $signed(reg11[(3'h6):(2'h2)]) : wire14[(3'h4):(2'h2)]);
              reg26 <= {wire2,
                  ($signed(reg21) > (({wire1} < $signed(reg23)) ?
                      (reg24 <<< (reg8 * wire13)) : wire5[(2'h3):(2'h3)]))};
              reg27 <= ($signed($unsigned(((reg20 < wire15) <<< (wire0 ^~ reg28)))) ?
                  (~$unsigned((~$signed(wire7)))) : wire5[(1'h1):(1'h0)]);
              reg28 <= reg21;
            end
          reg30 <= {$unsigned(reg17[(2'h2):(2'h2)])};
          reg31 <= (^{$unsigned($signed(reg29[(4'h8):(3'h5)])),
              reg23[(2'h3):(2'h3)]});
          reg32 <= reg22;
          reg33 <= (wire13 != wire7);
        end
      reg34 <= ($unsigned(((wire0[(4'hd):(4'ha)] - $signed(wire1)) >= ({wire14,
              (8'ha8)} ?
          (^~wire2) : ((8'had) ? reg8 : (8'ha7))))) && reg29);
      if ({reg18,
          $signed((+((~|reg10) ? $unsigned(wire6) : (reg22 ~^ wire4))))})
        begin
          if (((reg26 ?
                  reg18 : (($signed(reg20) >> wire15[(3'h7):(2'h2)]) - reg33)) ?
              ($unsigned($unsigned(wire7)) < {wire4}) : wire4[(1'h0):(1'h0)]))
            begin
              reg35 <= ((!($unsigned($signed(reg29)) << {$signed((8'hac))})) < ((-((reg17 ?
                  reg19 : reg30) >> (wire13 ^~ reg30))) >> $unsigned($unsigned((reg29 <<< wire7)))));
            end
          else
            begin
              reg35 <= (((($unsigned(reg32) <= reg17[(5'h12):(4'hc)]) ?
                      (reg34[(1'h0):(1'h0)] >>> $signed(reg20)) : (~^{reg16})) >= reg20) ?
                  (-{(~^(reg9 ? reg35 : wire15)),
                      ((wire7 ? reg12 : reg19) ?
                          reg28[(4'h9):(1'h1)] : $unsigned(reg25))}) : {{$unsigned($unsigned(reg17))},
                      (~|((^reg34) ^~ reg17))});
              reg36 <= ((8'h9f) ^~ {(+$unsigned($unsigned(reg21)))});
              reg37 <= reg20;
              reg38 <= $unsigned((!(reg21[(4'ha):(3'h4)] ?
                  ((!wire7) ?
                      (|reg24) : (reg28 ?
                          reg16 : reg33)) : reg9[(3'h6):(2'h2)])));
            end
        end
      else
        begin
          if (reg28)
            begin
              reg35 <= {$unsigned($unsigned($signed(reg34))), wire4};
            end
          else
            begin
              reg35 <= wire13[(3'h4):(3'h4)];
              reg36 <= (reg21[(4'ha):(3'h6)] << $signed($unsigned((reg26 << (8'h9e)))));
              reg37 <= $signed($unsigned(((reg35[(5'h13):(4'hc)] ?
                      reg21[(1'h1):(1'h0)] : $unsigned((8'ha9))) ?
                  (8'ha4) : $signed($signed(reg35)))));
              reg38 <= $signed((((-(wire2 ?
                  reg8 : reg28)) ~^ (7'h40)) < (~wire14[(4'hd):(1'h1)])));
            end
          if (reg9)
            begin
              reg39 <= reg34;
            end
          else
            begin
              reg39 <= {(8'ha6),
                  (wire5 < (((reg34 ?
                      reg37 : reg29) - (!reg38)) ^~ {$signed(reg27)}))};
              reg40 <= $unsigned(wire1);
              reg41 <= (^~(~^$unsigned(reg9[(1'h1):(1'h1)])));
            end
          reg42 <= (~|reg11[(2'h3):(1'h0)]);
          if ((^~(&wire2)))
            begin
              reg43 <= reg24;
              reg44 <= reg34[(3'h4):(3'h4)];
              reg45 <= reg37;
              reg46 <= (~($signed({(reg8 ? reg37 : reg18)}) ?
                  (&(&$signed((8'hb0)))) : reg34));
            end
          else
            begin
              reg43 <= ((~((|$unsigned(reg29)) ?
                  $signed((reg26 ?
                      reg39 : reg21)) : ((8'hb6) << reg32))) | $signed(({$unsigned(wire14)} ?
                  ((wire0 << wire2) ?
                      reg41[(4'h9):(4'h8)] : $signed(wire3)) : $unsigned($unsigned((8'hbb))))));
            end
          reg47 <= ((reg24[(4'he):(3'h6)] && reg46[(3'h4):(2'h3)]) ?
              reg21 : $signed((($signed(reg43) ?
                      (wire15 ~^ reg29) : (!wire14)) ?
                  $signed((wire0 ? reg19 : (7'h40))) : (+$unsigned(reg24)))));
        end
    end
  assign wire48 = ($unsigned(reg44[(2'h3):(1'h0)]) + $signed(wire2[(3'h5):(2'h3)]));
  assign wire49 = (-reg43);
  assign wire50 = wire14[(3'h6):(1'h1)];
  assign wire51 = $signed(((|(~&reg11[(1'h0):(1'h0)])) ?
                      ($signed($unsigned((8'hbb))) ?
                          ($signed(reg11) ?
                              (reg22 ?
                                  wire50 : reg45) : (+wire0)) : ($signed(reg28) ?
                              ((8'ha4) ?
                                  reg33 : (7'h43)) : $signed(reg35))) : (~&({(8'ha6)} + ((8'hbe) ?
                          wire50 : reg16)))));
endmodule
