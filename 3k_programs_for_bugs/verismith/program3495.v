module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h249):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire45;
  wire [(3'h6):(1'h0)] wire44;
  wire [(5'h15):(1'h0)] wire43;
  wire signed [(5'h10):(1'h0)] wire42;
  wire signed [(5'h12):(1'h0)] wire41;
  wire signed [(4'hd):(1'h0)] wire35;
  wire signed [(4'h9):(1'h0)] wire34;
  wire [(5'h13):(1'h0)] wire33;
  wire [(5'h15):(1'h0)] wire32;
  wire signed [(2'h2):(1'h0)] wire23;
  wire [(4'h9):(1'h0)] wire22;
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg49 = (1'h0);
  reg [(4'ha):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg47 = (1'h0);
  reg [(3'h7):(1'h0)] reg46 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg30 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg5 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire23,
                 wire22,
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
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= {wire4};
      if ($signed((^(&wire3[(3'h4):(2'h2)]))))
        begin
          reg6 <= (($unsigned(wire3[(5'h12):(1'h0)]) ~^ wire2[(2'h3):(1'h0)]) >> $signed(wire1[(4'ha):(1'h0)]));
          reg7 <= $unsigned((($unsigned({wire4}) ^ $signed((wire2 ?
              wire3 : wire3))) & (-wire1)));
          reg8 <= ($signed(({(wire1 ? wire1 : wire3),
                  (wire3 ? reg7 : (8'had))} ?
              {reg5} : ((7'h41) >>> reg5[(2'h2):(1'h0)]))) ^ $signed(reg6[(4'he):(1'h0)]));
        end
      else
        begin
          reg6 <= (($signed(((+wire2) < (|wire4))) == wire1[(3'h4):(2'h2)]) <= $unsigned($unsigned({{wire4,
                  wire4}})));
          reg7 <= wire0;
          reg8 <= $signed($unsigned((($unsigned(reg8) ?
              {wire3} : (wire1 >= reg6)) <<< $signed(reg8))));
          if ((($signed(((wire0 && wire1) ?
                  (wire4 ?
                      reg8 : (8'hb4)) : ((8'hbb) - wire1))) - {((wire2 ^ wire2) ?
                      (|(8'ha2)) : (reg7 ^~ reg5))}) ?
              $unsigned(reg8[(3'h5):(3'h4)]) : reg8))
            begin
              reg9 <= (((8'hb2) | $signed($unsigned({(8'ha1), reg7}))) ?
                  reg8 : (reg8 >>> $signed(($unsigned((8'hac)) << (reg8 ?
                      wire2 : wire4)))));
              reg10 <= ((8'hbf) ?
                  (wire0[(3'h4):(1'h0)] ?
                      $unsigned($unsigned($unsigned(wire1))) : {$signed($signed(reg8)),
                          ((reg9 > reg9) <<< (reg9 ~^ reg8))}) : $signed(wire3));
              reg11 <= (-{({(^~wire4), $signed(wire1)} ?
                      (8'hb0) : (!$signed((8'h9e)))),
                  reg8[(2'h2):(2'h2)]});
              reg12 <= $unsigned((&(+((wire1 >>> reg8) ?
                  $signed(wire4) : reg9[(1'h1):(1'h0)]))));
            end
          else
            begin
              reg9 <= ((!wire1[(4'hd):(3'h4)]) ? wire0[(3'h5):(1'h0)] : reg12);
              reg10 <= reg11;
              reg11 <= $unsigned((~$signed(reg6)));
              reg12 <= (wire1 ?
                  (reg5 | $signed(reg10[(2'h2):(1'h0)])) : (reg9[(3'h6):(2'h3)] <<< {reg7,
                      ((wire1 != wire0) ? $signed(wire2) : reg11)}));
            end
        end
      reg13 <= ((($signed((reg7 && reg10)) || $signed((reg5 - wire0))) && $unsigned(((|reg6) ~^ reg12))) ^~ (((reg7[(3'h5):(2'h3)] ?
              (reg8 + wire0) : {reg5, reg10}) & (~&(^~reg5))) ?
          ({wire1, {wire1}} ? $signed(((7'h41) ~^ reg9)) : reg10) : reg12));
      reg14 <= reg11;
      if ({(-((~$unsigned((8'h9f))) ? (+{reg8}) : wire2[(2'h3):(1'h0)]))})
        begin
          reg15 <= reg6;
          reg16 <= (~|$signed((^~(^~(wire4 ? reg8 : (7'h44))))));
        end
      else
        begin
          reg15 <= (~&(((reg10 && reg15[(2'h3):(1'h1)]) << $signed((wire3 ?
              (8'hb4) : reg7))) <= $signed((~|(+wire0)))));
          reg16 <= reg12;
          reg17 <= reg9[(2'h2):(1'h1)];
          if ($signed($unsigned({{(reg15 & (8'ha0))}})))
            begin
              reg18 <= (^~$unsigned(reg10[(2'h3):(1'h0)]));
              reg19 <= ((&reg11) ?
                  (($unsigned((~reg11)) ?
                          (!$unsigned(reg13)) : $signed($unsigned((8'haf)))) ?
                      $signed(($signed(reg18) ?
                          $unsigned(reg16) : $signed(reg14))) : reg16) : {{((reg8 ?
                              reg14 : reg5) < (wire0 << (8'hbe)))}});
              reg20 <= wire4;
            end
          else
            begin
              reg18 <= {reg13[(3'h5):(3'h5)],
                  $signed(((wire0[(5'h13):(2'h3)] ^~ (reg20 && reg6)) ?
                      reg5[(1'h1):(1'h1)] : $unsigned((reg14 ?
                          wire3 : wire1))))};
            end
          reg21 <= $unsigned($signed(({reg15[(3'h7):(3'h5)], reg11} ?
              $unsigned(reg16[(3'h4):(2'h2)]) : (8'haa))));
        end
    end
  assign wire22 = (!reg6[(3'h5):(1'h0)]);
  assign wire23 = $unsigned((8'hb2));
  always
    @(posedge clk) begin
      reg24 <= $signed($signed(reg5));
      reg25 <= wire3[(4'h8):(3'h7)];
      reg26 <= (^~$signed($signed((!(reg7 ? reg19 : (8'h9c))))));
      if ($unsigned((((reg12[(5'h10):(3'h7)] <= reg7[(1'h1):(1'h1)]) ~^ wire4[(3'h6):(2'h2)]) ?
          ($signed($unsigned(reg18)) ?
              reg20[(1'h0):(1'h0)] : $signed(wire23[(1'h1):(1'h1)])) : $signed($unsigned($signed(wire22))))))
        begin
          reg27 <= reg12[(4'h9):(3'h7)];
          reg28 <= $signed(wire3);
          reg29 <= ((~&reg9) | ($unsigned(($unsigned((8'had)) ?
                  reg13[(3'h5):(2'h2)] : reg19[(3'h7):(3'h7)])) ?
              (reg10[(1'h1):(1'h0)] >= reg15) : $signed(reg26[(3'h6):(3'h6)])));
          reg30 <= ($unsigned($signed(wire23[(1'h0):(1'h0)])) ?
              reg11 : ((^~(reg10 < $unsigned(reg7))) ?
                  wire0[(3'h4):(1'h1)] : wire0));
          reg31 <= reg30;
        end
      else
        begin
          reg27 <= $unsigned(reg8);
          reg28 <= wire22;
          if ($unsigned(wire2))
            begin
              reg29 <= $signed((!reg31));
              reg30 <= {(~^$signed({(^~reg16)}))};
            end
          else
            begin
              reg29 <= {wire3[(3'h5):(2'h2)],
                  $unsigned($unsigned(reg26[(3'h6):(3'h5)]))};
            end
        end
    end
  assign wire32 = $signed(reg11[(4'h9):(3'h6)]);
  assign wire33 = (~&reg30[(3'h5):(3'h5)]);
  assign wire34 = reg7;
  assign wire35 = $unsigned($unsigned($signed((~|(~&reg26)))));
  always
    @(posedge clk) begin
      reg36 <= reg29;
      reg37 <= wire32[(3'h4):(2'h2)];
      reg38 <= (($unsigned(wire34) + $signed((((8'h9c) << reg31) ?
          (~&reg25) : (wire32 ?
              reg28 : wire22)))) ^~ $unsigned(reg26[(3'h7):(3'h6)]));
      reg39 <= ((~&($unsigned(reg38[(4'hb):(2'h3)]) < (~wire1[(4'he):(4'ha)]))) ^~ ($unsigned($unsigned((reg26 >> reg8))) <= $unsigned(($unsigned((8'hbe)) ?
          $unsigned((8'haf)) : (~|(8'hb1))))));
      reg40 <= {(reg21[(4'h9):(1'h0)] ?
              (-{$unsigned(reg24)}) : $unsigned((8'h9f)))};
    end
  assign wire41 = {(~&{reg28})};
  assign wire42 = $signed((~|wire3[(1'h0):(1'h0)]));
  assign wire43 = (~$unsigned({(^~reg18[(5'h11):(2'h2)])}));
  assign wire44 = (((|(|reg16[(3'h4):(2'h3)])) ?
                      (((&wire23) ?
                          (~&wire35) : reg5[(4'hc):(4'hc)]) & (&(7'h41))) : {reg24,
                          reg12}) != reg6[(3'h5):(2'h3)]);
  assign wire45 = (reg15[(4'ha):(4'h9)] >= (-(+(7'h44))));
  always
    @(posedge clk) begin
      reg46 <= reg16[(3'h4):(3'h4)];
      if ($signed((^~($unsigned(((8'hb8) ? reg30 : reg13)) ?
          reg36[(2'h2):(1'h1)] : reg6[(2'h3):(1'h0)]))))
        begin
          reg47 <= (8'hbc);
        end
      else
        begin
          reg47 <= {(reg38 ?
                  ((+(reg30 ?
                      reg17 : (8'ha4))) << reg14) : (~^(reg21[(3'h4):(3'h4)] ?
                      (reg10 ? wire34 : (8'hbe)) : $unsigned((8'hbb)))))};
        end
      if ($signed(reg29))
        begin
          if (reg29)
            begin
              reg48 <= (($signed(wire32[(1'h0):(1'h0)]) ?
                      $signed((~^wire44)) : $signed(($unsigned(wire3) ?
                          reg8 : $signed(wire4)))) ?
                  (|(~&reg17)) : {(^(~&$signed(reg14))),
                      {(+$unsigned((8'ha1)))}});
              reg49 <= $unsigned($unsigned($signed(($unsigned(reg24) ?
                  wire2 : {reg17, reg24}))));
              reg50 <= (reg46[(2'h3):(2'h2)] << reg21[(3'h5):(3'h5)]);
              reg51 <= ($unsigned((-((|reg9) > (^~reg11)))) ?
                  (|(^~{(8'hbe)})) : (-reg46));
              reg52 <= ((({reg29[(2'h3):(2'h3)], reg20} ?
                          (wire2[(3'h4):(3'h4)] ?
                              $signed(reg50) : (^wire3)) : reg50[(3'h7):(2'h3)]) ?
                      reg31[(2'h2):(1'h0)] : {reg20}) ?
                  $signed((wire23[(1'h0):(1'h0)] >>> (~|(reg39 ?
                      reg7 : reg24)))) : (^~reg8));
            end
          else
            begin
              reg48 <= (wire2[(3'h4):(2'h2)] * $unsigned(((reg24[(3'h5):(3'h5)] ?
                      (|reg40) : (reg19 <= reg9)) ?
                  reg7[(2'h2):(1'h0)] : reg16[(1'h1):(1'h1)])));
              reg49 <= $unsigned((^$unsigned((reg17 ?
                  reg11 : (reg17 << reg50)))));
              reg50 <= (~^$unsigned((reg47[(4'hb):(1'h0)] <<< {wire33})));
              reg51 <= wire22[(3'h7):(3'h5)];
            end
          reg53 <= $signed($unsigned((~^($signed(reg49) <= reg13[(3'h5):(1'h1)]))));
        end
      else
        begin
          if ({$unsigned((~^(reg16 ?
                  reg30[(3'h6):(1'h1)] : $unsigned(reg47))))})
            begin
              reg48 <= wire44;
            end
          else
            begin
              reg48 <= (^~$unsigned((reg40 ? reg16 : (~reg8))));
              reg49 <= (+(reg48 >= ((reg7 ^ (reg16 ? reg46 : reg30)) ?
                  wire0 : reg16[(2'h3):(2'h3)])));
              reg50 <= (~^(8'ha1));
            end
          reg51 <= wire43;
          reg52 <= reg9[(3'h6):(3'h4)];
          reg53 <= (((wire44[(3'h4):(3'h4)] ?
                  ($unsigned(wire32) + $signed(wire45)) : reg15) ?
              (|(&{(8'hb2), reg7})) : (|($unsigned(reg15) ?
                  {wire32} : (8'hb2)))) == $unsigned((reg39[(4'h9):(3'h5)] ?
              {$signed(reg17), wire4[(4'hc):(1'h1)]} : (+$unsigned(reg16)))));
        end
      reg54 <= wire3;
      reg55 <= ((wire23 ^~ (wire2 ^ ((reg28 == (8'ha9)) == $unsigned(reg29)))) || reg40);
    end
endmodule
