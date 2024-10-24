module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h297):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire64;
  wire signed [(2'h2):(1'h0)] wire63;
  wire [(3'h7):(1'h0)] wire62;
  wire signed [(2'h3):(1'h0)] wire61;
  wire signed [(5'h14):(1'h0)] wire49;
  wire signed [(5'h15):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire47;
  wire signed [(5'h10):(1'h0)] wire46;
  wire [(4'hc):(1'h0)] wire45;
  wire [(3'h7):(1'h0)] wire44;
  wire signed [(5'h13):(1'h0)] wire43;
  wire [(4'h8):(1'h0)] wire42;
  wire signed [(3'h6):(1'h0)] wire30;
  wire signed [(3'h5):(1'h0)] wire29;
  wire [(4'hb):(1'h0)] wire28;
  wire signed [(4'h8):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire14;
  reg signed [(5'h11):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg65 = (1'h0);
  reg [(2'h3):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg54 = (1'h0);
  reg [(5'h10):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg52 = (1'h0);
  reg [(4'h9):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg36 = (1'h0);
  reg [(2'h3):(1'h0)] reg35 = (1'h0);
  reg [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg33 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  reg [(2'h2):(1'h0)] reg7 = (1'h0);
  reg [(4'h9):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg5 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire30,
                 wire29,
                 wire28,
                 wire15,
                 wire14,
                 reg66,
                 reg65,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
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
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
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
      reg5 <= wire1;
      reg6 <= $unsigned((^{wire1}));
      if ((8'ha5))
        begin
          reg7 <= $signed(reg6[(1'h0):(1'h0)]);
          reg8 <= (wire0 * ({(wire3 != $unsigned(wire0))} >= wire3));
        end
      else
        begin
          reg7 <= {$signed((wire2 ? (-$signed(reg6)) : reg8)),
              $signed($unsigned((reg6 ?
                  $unsigned((8'hb8)) : reg8[(3'h7):(3'h6)])))};
          reg8 <= wire4[(4'hb):(3'h6)];
          if ((^~wire3[(3'h6):(3'h5)]))
            begin
              reg9 <= $unsigned($unsigned((|$unsigned((wire4 != reg7)))));
              reg10 <= {(&wire4)};
            end
          else
            begin
              reg9 <= (~|reg9);
              reg10 <= (+reg6[(4'h9):(2'h2)]);
              reg11 <= ({$signed(((reg7 || reg10) | (reg5 ?
                          reg10 : (8'hbd))))} ?
                  $unsigned(((~&(~&reg8)) >= ((wire4 - wire4) ?
                      reg7[(2'h2):(2'h2)] : $unsigned(reg6)))) : $signed((~|wire0)));
              reg12 <= reg10;
            end
          reg13 <= $signed($signed((($signed(wire1) ?
              reg8[(4'h8):(1'h1)] : {wire0, reg6}) < reg12)));
        end
    end
  assign wire14 = reg13[(2'h2):(1'h0)];
  assign wire15 = {(-$unsigned((&wire0[(2'h2):(1'h1)]))),
                      ($signed(reg7) < ((~&wire3[(3'h5):(1'h0)]) ?
                          $unsigned((~(8'hb9))) : (!$unsigned((8'hb6)))))};
  always
    @(posedge clk) begin
      reg16 <= reg13;
      if ($unsigned($unsigned(wire14[(3'h4):(2'h3)])))
        begin
          reg17 <= $signed($unsigned(reg6[(1'h0):(1'h0)]));
          reg18 <= (wire0 ?
              reg9 : ((($signed(reg16) >>> $signed(reg6)) ?
                  wire15[(1'h0):(1'h0)] : $unsigned(((8'hb5) ?
                      wire14 : reg17))) <<< reg17));
          if (reg9)
            begin
              reg19 <= {$signed(($signed($unsigned((7'h40))) <<< (reg5[(5'h14):(4'h8)] ?
                      wire1 : reg11[(1'h0):(1'h0)])))};
              reg20 <= $unsigned((((-(reg10 ~^ wire14)) ?
                  (reg19[(2'h2):(2'h2)] ?
                      (reg9 >>> reg16) : (&reg16)) : wire4[(4'h8):(3'h4)]) & reg19));
              reg21 <= wire14[(4'h9):(4'h9)];
            end
          else
            begin
              reg19 <= $unsigned($unsigned((&(((8'ha7) ? reg5 : wire14) ?
                  $unsigned(reg17) : reg19[(1'h0):(1'h0)]))));
              reg20 <= (~reg8);
            end
          reg22 <= ($signed($signed(($signed(reg18) >= (reg9 && reg11)))) ?
              reg8 : $unsigned((!(~|reg13[(3'h4):(2'h3)]))));
        end
      else
        begin
          reg17 <= (~&({$signed((reg19 ? reg20 : reg22)),
              ((-reg22) * reg16)} && {((~wire1) ~^ reg12[(4'ha):(2'h3)]),
              (~^$signed(reg22))}));
          reg18 <= (~&reg19);
        end
      if (reg20)
        begin
          reg23 <= reg16;
          reg24 <= (reg13 - (!(~|wire0[(2'h3):(2'h2)])));
        end
      else
        begin
          reg23 <= (8'h9d);
          reg24 <= reg11;
          reg25 <= (~reg18);
          reg26 <= reg11;
          reg27 <= reg23[(3'h4):(1'h0)];
        end
    end
  assign wire28 = reg10[(4'hc):(3'h6)];
  assign wire29 = reg18[(3'h6):(1'h1)];
  assign wire30 = (8'hb3);
  always
    @(posedge clk) begin
      if (($unsigned($signed({wire30[(1'h0):(1'h0)]})) >>> reg10[(3'h4):(3'h4)]))
        begin
          reg31 <= reg10[(3'h7):(2'h3)];
          reg32 <= wire2;
        end
      else
        begin
          reg31 <= $unsigned((!reg24[(3'h4):(1'h1)]));
          if (reg17[(4'he):(3'h5)])
            begin
              reg32 <= reg20;
              reg33 <= ((((wire30 ? (reg18 ? (8'had) : wire2) : (^reg12)) ?
                      (8'ha6) : reg17) ?
                  (wire28[(2'h3):(1'h0)] ?
                      reg27 : (!(reg5 + reg22))) : $unsigned(((~&wire2) ?
                      (8'hb3) : wire30[(1'h1):(1'h0)]))) < (wire15[(2'h3):(2'h2)] | $signed(((~|(7'h40)) ?
                  reg24 : $unsigned(reg17)))));
            end
          else
            begin
              reg32 <= ((reg17 > (!({wire15} ?
                  (reg19 <= reg22) : $signed(wire2)))) + wire1);
              reg33 <= reg19[(1'h1):(1'h0)];
              reg34 <= (((8'hb6) <= (8'hb8)) ?
                  $signed($unsigned({wire4})) : (reg23[(4'hc):(2'h3)] ?
                      reg10 : wire2[(4'ha):(1'h1)]));
            end
          reg35 <= wire2;
          if ($unsigned(reg13[(3'h4):(1'h0)]))
            begin
              reg36 <= $signed(wire2);
            end
          else
            begin
              reg36 <= {reg36};
              reg37 <= reg17[(4'hd):(4'hc)];
            end
          reg38 <= {($unsigned($unsigned(reg5)) ^~ wire29),
              {reg34[(2'h3):(1'h0)]}};
        end
      reg39 <= {reg16[(3'h7):(3'h6)], wire30[(3'h6):(2'h2)]};
      reg40 <= ($signed({(reg27[(4'h9):(2'h2)] ? $signed((8'hba)) : (8'ha8))}) ?
          $signed(reg6) : (reg23 ?
              $unsigned(reg26[(2'h2):(1'h1)]) : (reg21 ?
                  reg22 : wire28[(3'h7):(2'h2)])));
      reg41 <= $signed((reg23 == {$unsigned(reg37)}));
    end
  assign wire42 = $signed((|($unsigned((reg25 & reg39)) ?
                      ((^reg11) == (^~reg21)) : (&$signed(reg31)))));
  assign wire43 = wire28[(3'h6):(2'h3)];
  assign wire44 = reg17[(1'h1):(1'h0)];
  assign wire45 = $unsigned(reg27[(3'h7):(1'h0)]);
  assign wire46 = $unsigned((~|($signed((reg6 - reg34)) ?
                      $unsigned($unsigned(reg17)) : reg19[(3'h4):(1'h1)])));
  assign wire47 = (~&$unsigned((!({reg13} <= {wire30}))));
  assign wire48 = reg18;
  assign wire49 = reg37[(3'h6):(2'h2)];
  always
    @(posedge clk) begin
      if ((|($unsigned((~{(7'h43)})) >> (wire43 ?
          (~(reg37 & wire15)) : $signed(reg35[(1'h1):(1'h1)])))))
        begin
          reg50 <= reg19;
          if (reg11)
            begin
              reg51 <= $signed($unsigned({{$unsigned(reg17)}, reg39}));
            end
          else
            begin
              reg51 <= (8'haf);
              reg52 <= $unsigned((reg40 ?
                  ($signed(reg32) ?
                      (8'ha4) : reg18[(1'h0):(1'h0)]) : reg50[(2'h3):(1'h0)]));
              reg53 <= $unsigned((+({(reg40 ? reg26 : reg36)} && (^~((8'hb6) ?
                  reg40 : wire1)))));
            end
          reg54 <= $unsigned(reg25[(4'hc):(1'h0)]);
          reg55 <= $signed($signed((((+reg16) ?
                  {reg17} : (reg25 ? reg6 : reg39)) ?
              $unsigned((8'ha8)) : (!reg52[(4'hd):(4'hd)]))));
        end
      else
        begin
          reg50 <= reg53[(3'h5):(2'h2)];
          reg51 <= (wire15[(3'h7):(3'h7)] || (+$unsigned(((reg32 * reg51) << {wire48}))));
          reg52 <= (^~$unsigned(($unsigned(reg31) ?
              $signed($signed(reg21)) : $signed($signed(reg7)))));
          reg53 <= wire15;
          if (wire4[(4'hb):(4'ha)])
            begin
              reg54 <= $unsigned(wire44);
              reg55 <= (reg39[(2'h3):(2'h3)] ?
                  ((|($unsigned(reg10) - $unsigned((8'hb7)))) >>> $signed(reg10)) : (8'ha9));
              reg56 <= reg41;
              reg57 <= (~&((~^((|reg35) ~^ reg13[(2'h3):(1'h1)])) ?
                  (reg7 > $signed((reg55 ? wire3 : reg35))) : (reg34 ?
                      (wire47 ? wire3 : reg27) : ((~|reg32) ?
                          {(8'hb9)} : reg26[(2'h3):(2'h3)]))));
            end
          else
            begin
              reg54 <= (7'h41);
              reg55 <= reg20;
              reg56 <= reg6;
            end
        end
      reg58 <= (!reg31);
      reg59 <= $unsigned(($unsigned(wire43[(4'h8):(1'h1)]) != (~|(~^(~|wire14)))));
      reg60 <= $signed(reg11[(3'h5):(1'h0)]);
    end
  assign wire61 = (reg26 != reg23[(4'h8):(1'h0)]);
  assign wire62 = $unsigned((~^(($signed(reg6) ?
                          (wire28 << (8'ha8)) : (&reg20)) ?
                      $unsigned(reg23) : reg13)));
  assign wire63 = ((^~((|{wire1, reg10}) <= $signed(reg8[(5'h11):(4'h9)]))) ?
                      $unsigned((reg55[(1'h1):(1'h0)] > ((wire30 ?
                              wire49 : wire43) ?
                          reg23 : ((8'hb1) ?
                              reg32 : reg51)))) : ($unsigned(reg58[(2'h2):(1'h1)]) == $unsigned(reg53[(2'h2):(1'h0)])));
  assign wire64 = (~|$signed($unsigned(wire30)));
  always
    @(posedge clk) begin
      reg65 <= ((((wire49[(2'h2):(1'h1)] ?
              $signed(wire43) : reg50) == reg13) || reg21[(4'h8):(4'h8)]) ?
          $signed($unsigned({(reg58 ? reg57 : (8'hbf))})) : {reg31, reg52});
      reg66 <= ((!(~&$signed({(8'ha5), reg16}))) ?
          $signed((|((wire49 & (8'hbd)) ? {reg21} : reg32))) : reg56);
    end
endmodule
