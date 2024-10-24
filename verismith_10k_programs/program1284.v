module top
#(parameter param59 = ((~^(((!(7'h41)) ? (^~(7'h42)) : ((8'ha6) ? (8'hba) : (8'h9f))) ? (((8'hb6) ^~ (8'hb7)) < ((8'hb6) ? (8'ha5) : (8'hbd))) : (((8'hba) ^ (8'ha2)) ? (^(8'hbe)) : ((8'hb9) ? (8'hb5) : (8'h9e))))) == (((|((8'h9d) && (8'hba))) ? (^~((8'ha0) ? (8'hbc) : (8'hb7))) : ((~^(8'ha8)) ? ((8'ha1) ? (8'hb7) : (8'hab)) : (8'hb8))) | (^~(^(-(7'h41)))))), 
parameter param60 = param59)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h27a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire48;
  wire signed [(3'h5):(1'h0)] wire47;
  wire [(3'h7):(1'h0)] wire46;
  wire signed [(4'hf):(1'h0)] wire45;
  wire [(4'hf):(1'h0)] wire44;
  wire signed [(4'h8):(1'h0)] wire43;
  wire [(4'he):(1'h0)] wire42;
  wire [(4'hf):(1'h0)] wire41;
  wire [(2'h2):(1'h0)] wire40;
  wire [(5'h12):(1'h0)] wire28;
  wire signed [(3'h5):(1'h0)] wire27;
  wire [(4'he):(1'h0)] wire26;
  wire signed [(3'h4):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire24;
  wire signed [(4'hb):(1'h0)] wire23;
  wire [(4'hc):(1'h0)] wire22;
  wire [(3'h6):(1'h0)] wire21;
  wire [(4'ha):(1'h0)] wire20;
  wire signed [(4'hb):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire4;
  reg signed [(5'h14):(1'h0)] reg58 = (1'h0);
  reg [(4'hd):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg55 = (1'h0);
  reg [(4'hf):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg53 = (1'h0);
  reg [(4'h8):(1'h0)] reg52 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg51 = (1'h0);
  reg [(3'h7):(1'h0)] reg50 = (1'h0);
  reg [(4'hb):(1'h0)] reg49 = (1'h0);
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg38 = (1'h0);
  reg [(2'h3):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(4'hf):(1'h0)] reg34 = (1'h0);
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(4'h9):(1'h0)] reg6 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire5,
                 wire4,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
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
  assign wire4 = $unsigned((wire1[(1'h0):(1'h0)] == (wire3 ?
                     $signed((wire0 ? (8'haf) : wire1)) : (7'h40))));
  assign wire5 = {$signed({wire0[(3'h6):(2'h3)]}),
                     (~|(&(wire0[(4'hf):(4'h9)] << (wire4 ? wire0 : wire3))))};
  always
    @(posedge clk) begin
      reg6 <= $unsigned(wire3);
      if (wire1[(2'h2):(1'h1)])
        begin
          if (wire5[(4'h8):(3'h6)])
            begin
              reg7 <= $unsigned(wire2[(2'h3):(1'h1)]);
              reg8 <= (wire5 ~^ wire1[(1'h0):(1'h0)]);
              reg9 <= wire4;
              reg10 <= $signed((^~(&$unsigned($unsigned(reg9)))));
              reg11 <= wire4;
            end
          else
            begin
              reg7 <= (^~(reg11 ?
                  ($unsigned((wire3 ^~ reg8)) ?
                      {wire5} : (wire2[(3'h5):(2'h3)] ?
                          $unsigned(wire0) : $signed(wire4))) : wire4));
              reg8 <= ({(~|$unsigned((7'h40))), $signed(reg7)} ?
                  ($unsigned({((7'h41) - wire0), wire5[(1'h0):(1'h0)]}) ?
                      (~&({reg8} * {reg9})) : wire5[(4'hb):(4'h9)]) : $signed((|$signed(reg7))));
            end
          reg12 <= $unsigned($signed(wire2));
          reg13 <= reg7[(3'h5):(3'h4)];
          if ((8'hb8))
            begin
              reg14 <= ($unsigned((reg11[(4'hf):(3'h5)] <<< ((wire4 ^~ wire4) ?
                  $unsigned((8'hb9)) : (reg11 ?
                      wire0 : reg11)))) >= $signed({(((8'h9d) ? wire0 : wire5) ?
                      (wire5 ? reg6 : wire4) : $unsigned(reg6)),
                  $signed({reg9})}));
              reg15 <= (reg9 << (($signed((reg8 ? (8'hac) : (8'hb5))) ?
                      $signed((reg10 ?
                          (8'haf) : reg11)) : reg13[(3'h7):(2'h2)]) ?
                  reg8[(4'h8):(1'h1)] : reg11));
              reg16 <= (~&(^~(wire0[(4'hf):(2'h3)] << (~|reg13))));
            end
          else
            begin
              reg14 <= (~|reg8[(4'h9):(3'h6)]);
            end
          reg17 <= $signed(wire0[(4'hd):(1'h1)]);
        end
      else
        begin
          if ($signed({($signed($unsigned(reg14)) & $signed(((8'had) ?
                  reg13 : reg8))),
              $unsigned($signed({reg6}))}))
            begin
              reg7 <= (reg17[(4'he):(4'ha)] >= $signed((~^$signed({(8'h9e)}))));
              reg8 <= ((8'ha8) ?
                  wire5 : (+((reg12 ?
                      $signed(reg11) : reg13[(1'h0):(1'h0)]) ^~ $signed($unsigned(wire1)))));
              reg9 <= reg6;
            end
          else
            begin
              reg7 <= {$signed($signed(reg16))};
            end
          if (((~&$signed(reg17)) ?
              wire1[(2'h3):(1'h0)] : (~^reg15[(4'hd):(4'h8)])))
            begin
              reg10 <= (({$signed($signed(reg13))} ?
                  ($signed($unsigned(reg17)) ?
                      ((reg7 ? wire4 : wire1) ?
                          (reg7 ?
                              (8'hb3) : reg12) : reg7[(3'h7):(2'h2)]) : ((~|wire0) ?
                          (^~reg10) : {reg12,
                              reg13})) : $signed(wire4[(2'h3):(1'h1)])) >= $unsigned(((~&(~|reg14)) * wire2)));
              reg11 <= reg7;
              reg12 <= $unsigned(reg16);
              reg13 <= (($signed((|reg16[(2'h2):(1'h1)])) - reg16) ?
                  wire2 : reg9[(4'he):(4'hb)]);
            end
          else
            begin
              reg10 <= $signed(wire4[(4'ha):(4'ha)]);
              reg11 <= ($signed($signed(wire5)) < wire5[(3'h5):(2'h2)]);
              reg12 <= $unsigned((~^(($signed((8'ha4)) ?
                      (wire4 > wire4) : (8'hae)) ?
                  $signed($signed(reg10)) : $signed((~^reg14)))));
            end
          reg14 <= ($signed((-{reg6, {wire3, reg6}})) ?
              ((7'h43) ?
                  (($signed((8'haf)) - (reg7 ?
                      reg12 : reg13)) ^ reg14[(4'hd):(3'h5)]) : reg9) : (((|wire3) ^~ (reg8 ?
                      (~|wire4) : {wire1, (8'hbe)})) ?
                  reg7 : (+wire5)));
          if ({($signed((((8'had) ? reg13 : reg9) >> {reg7, reg12})) ?
                  (&{wire1,
                      reg6[(3'h5):(1'h1)]}) : $signed($signed((~|reg10))))})
            begin
              reg15 <= $signed((($signed(reg6) <= (8'hb2)) <<< $signed(((&wire3) ^~ (-wire5)))));
              reg16 <= $signed(({reg6[(3'h4):(3'h4)]} >> wire3));
              reg17 <= (reg17 | $unsigned(wire4));
              reg18 <= $unsigned((reg15[(4'hc):(4'hc)] ?
                  {$unsigned((reg8 ? (8'hbd) : reg11)),
                      ((wire5 ? wire4 : reg15) ?
                          $signed(reg16) : {reg8})} : (^~wire1)));
            end
          else
            begin
              reg15 <= wire0[(3'h7):(2'h3)];
            end
          reg19 <= $signed((8'had));
        end
    end
  assign wire20 = ($signed((reg17[(4'h8):(3'h4)] ?
                          {wire0[(4'h9):(3'h4)]} : (-(reg10 & reg13)))) ?
                      $signed((reg11[(2'h2):(2'h2)] >>> $unsigned($signed(reg8)))) : (|((~(&(8'hbb))) ?
                          wire2 : ((wire1 < wire2) ?
                              (reg6 >> (7'h40)) : wire5[(4'h8):(3'h4)]))));
  assign wire21 = wire4[(1'h1):(1'h1)];
  assign wire22 = wire4[(4'ha):(3'h7)];
  assign wire23 = (^~$signed((($unsigned(wire1) >= {(7'h42),
                      (8'hb8)}) <= (wire4 + $unsigned(wire3)))));
  assign wire24 = ((!$signed(reg6)) ?
                      ({$unsigned(wire3)} ?
                          ($unsigned(reg12[(1'h1):(1'h0)]) == $unsigned(reg6)) : $unsigned({wire0[(2'h2):(2'h2)]})) : reg6[(2'h3):(2'h3)]);
  assign wire25 = $unsigned($signed(reg19));
  assign wire26 = (((+($unsigned((8'ha2)) ?
                              (reg14 * (8'hb5)) : $signed(reg6))) ?
                          $signed($signed(reg16)) : wire2) ?
                      $unsigned(reg17[(2'h2):(2'h2)]) : {$signed((reg8 ?
                              (+reg11) : $signed(wire4))),
                          {reg15[(5'h13):(2'h3)],
                              $signed(reg16[(3'h6):(2'h2)])}});
  assign wire27 = $unsigned({{wire23}});
  assign wire28 = ((^~(~$unsigned((wire1 ? wire27 : reg12)))) ?
                      (+$unsigned(wire5)) : wire27[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      if (reg17[(3'h5):(1'h1)])
        begin
          reg29 <= ({{($signed(reg9) ? reg6 : $unsigned(wire0)), (^reg8)},
                  {$signed(wire28), $signed($signed(reg8))}} ?
              reg8[(4'hd):(4'hc)] : ($signed((reg7 ?
                      (7'h42) : {reg15, (8'ha9)})) ?
                  (~&($signed((8'hb8)) == $signed(wire2))) : $unsigned(wire0[(4'h8):(3'h7)])));
          reg30 <= reg7[(3'h6):(2'h2)];
          if ({reg30,
              ((($signed(wire25) <= (reg12 << reg18)) & (&(!wire4))) == reg16)})
            begin
              reg31 <= $unsigned(reg14[(3'h6):(3'h4)]);
            end
          else
            begin
              reg31 <= $signed(reg11);
              reg32 <= reg11;
              reg33 <= reg14;
              reg34 <= ($signed((|(^~(reg13 ? reg7 : wire28)))) ?
                  reg19 : reg13[(3'h7):(3'h7)]);
              reg35 <= wire22[(3'h5):(3'h5)];
            end
          reg36 <= $signed(wire20);
        end
      else
        begin
          reg29 <= wire27[(3'h5):(1'h1)];
          if ((reg9 ?
              (^~$signed(wire28)) : (|({(8'hac)} ?
                  $signed((wire1 <<< reg13)) : (-wire0)))))
            begin
              reg30 <= {$unsigned($unsigned($unsigned(wire23)))};
              reg31 <= ($signed((((reg18 > reg12) ?
                      ((8'hb1) ? wire26 : wire22) : (reg15 ?
                          reg16 : wire3)) << (~|$unsigned((8'hbf))))) ?
                  $signed($unsigned((+(~^(8'h9f))))) : $unsigned(reg15[(4'h9):(4'h9)]));
              reg32 <= (~|(~|((wire21[(2'h2):(2'h2)] ?
                  reg19 : (reg10 ? (8'h9d) : wire24)) << {$signed(reg36),
                  $unsigned(wire28)})));
              reg33 <= (($unsigned((reg9[(5'h10):(5'h10)] ?
                  (wire26 ?
                      reg12 : reg33) : reg14)) >= $signed($unsigned(wire28))) != $signed(($unsigned($signed(wire20)) ?
                  reg19[(4'he):(2'h3)] : (~(wire0 ? (8'haf) : wire28)))));
            end
          else
            begin
              reg30 <= reg30[(4'hc):(4'h9)];
              reg31 <= ({$unsigned({reg29}), reg19[(3'h6):(3'h4)]} ?
                  $unsigned(((!$signed(wire23)) ?
                      $unsigned($unsigned(reg12)) : {(8'hae),
                          {reg31}})) : $unsigned($signed($unsigned($unsigned(wire0)))));
              reg32 <= wire4;
            end
        end
      reg37 <= $signed(($signed($unsigned($signed(wire5))) ?
          {reg13} : (reg13 * (reg34 + $signed((8'hae))))));
      reg38 <= wire2;
      reg39 <= (reg14 ?
          ($signed({(reg29 ? reg38 : reg35)}) ?
              $unsigned(wire24) : (wire26[(1'h1):(1'h1)] - ((reg19 ?
                      (8'ha4) : reg10) ?
                  reg8 : reg35))) : (&$unsigned(reg34[(4'h8):(3'h4)])));
    end
  assign wire40 = (((~&$unsigned($unsigned(reg6))) ~^ reg7[(2'h2):(2'h2)]) ?
                      wire23 : (~$unsigned(((reg36 << wire5) | $unsigned(wire3)))));
  assign wire41 = $signed(wire23);
  assign wire42 = $signed($signed((((reg37 ?
                      wire41 : reg39) <= (reg8 >> reg11)) >>> {(wire22 ?
                          wire23 : wire27)})));
  assign wire43 = ((~wire1[(3'h4):(1'h1)]) < (&{(wire42[(4'hd):(2'h3)] - $signed(reg13)),
                      $unsigned(reg17[(1'h0):(1'h0)])}));
  assign wire44 = ((reg38[(3'h4):(1'h0)] ?
                      wire21[(2'h3):(2'h3)] : ($signed((wire43 ?
                              wire24 : wire25)) ?
                          ($unsigned(reg32) <= {(8'hb5)}) : ((~wire43) && (|reg7)))) * $signed($unsigned($signed(wire5[(4'hb):(3'h7)]))));
  assign wire45 = reg29[(4'he):(4'hd)];
  assign wire46 = (wire40[(1'h0):(1'h0)] ?
                      ((!{$signed(reg13),
                          $unsigned(reg11)}) <= ($unsigned($unsigned(wire22)) ?
                          {(~|reg32),
                              (reg9 | wire41)} : wire3[(1'h1):(1'h1)])) : (-$unsigned(($unsigned(wire45) >= (wire25 == (7'h41))))));
  assign wire47 = (^~$unsigned(((wire2 ?
                      (reg13 ?
                          reg13 : reg9) : {reg11}) > $unsigned($signed(wire5)))));
  assign wire48 = (~&($signed($signed(wire41)) ?
                      $unsigned($signed(reg9[(1'h0):(1'h0)])) : $unsigned(reg15)));
  always
    @(posedge clk) begin
      reg49 <= {(((((8'hbf) ^~ reg7) ? (8'ha9) : {wire4}) ?
                  wire25 : (wire45 ? (^~wire0) : (&wire42))) ?
              (reg12[(4'hd):(3'h6)] ?
                  (8'hbd) : $signed({(8'hae), (8'hba)})) : wire26)};
      reg50 <= {{wire4[(4'ha):(4'h9)]},
          (wire40 | $signed(($unsigned((7'h42)) ? $unsigned(wire3) : reg33)))};
      reg51 <= $unsigned((^(~reg39[(3'h5):(2'h3)])));
      if (($signed((!$signed((reg8 ?
          wire0 : reg8)))) ~^ (~&wire41[(4'h9):(1'h0)])))
        begin
          reg52 <= $signed($signed(($unsigned(wire46) ?
              (!(wire4 ? wire20 : reg13)) : ($unsigned(reg13) >> ((8'hab) ?
                  reg49 : reg10)))));
        end
      else
        begin
          reg52 <= wire0;
          if (reg6[(3'h6):(2'h2)])
            begin
              reg53 <= ($signed($signed(reg8)) ?
                  $signed(reg33[(3'h4):(1'h0)]) : wire46);
              reg54 <= (8'ha2);
            end
          else
            begin
              reg53 <= (reg13[(1'h0):(1'h0)] ?
                  reg10[(4'h8):(2'h3)] : {(reg50[(1'h0):(1'h0)] ?
                          (reg50[(1'h0):(1'h0)] * reg7) : $unsigned($unsigned(wire1))),
                      ({$signed(reg35)} <= $unsigned((8'ha0)))});
            end
          if ((|($signed($unsigned(reg38[(4'h8):(2'h2)])) <<< $unsigned(wire20[(2'h2):(2'h2)]))))
            begin
              reg55 <= reg33;
              reg56 <= $unsigned((!$signed(reg35)));
            end
          else
            begin
              reg55 <= ($unsigned({$signed($unsigned(wire23))}) ?
                  $unsigned(wire26[(2'h2):(1'h0)]) : (~(wire41 > wire47)));
              reg56 <= (reg17[(1'h0):(1'h0)] ?
                  reg37[(1'h0):(1'h0)] : (reg37[(2'h3):(1'h0)] ?
                      $unsigned($unsigned(reg51)) : (reg51 ?
                          $signed({wire28, wire0}) : ((|wire48) ?
                              (~|reg38) : $signed(wire24)))));
              reg57 <= wire25[(3'h4):(2'h2)];
            end
          reg58 <= $signed(wire5);
        end
    end
endmodule
