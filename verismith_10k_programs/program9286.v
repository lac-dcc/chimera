module top
#(parameter param21 = (!{((!{(8'hbc), (7'h40)}) ? {(|(8'ha7))} : (((7'h42) ? (8'hbe) : (8'ha4)) ^~ ((8'hb8) >> (8'hb6)))), (~((|(8'ha0)) ? ((7'h42) | (8'h9f)) : {(7'h44), (7'h42)}))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h85):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire20;
  wire [(4'hb):(1'h0)] wire19;
  wire signed [(2'h2):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire4;
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(3'h4):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg7 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire6,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = wire0;
  assign wire5 = wire2;
  assign wire6 = $signed(wire5);
  always
    @(posedge clk) begin
      if ((~&wire3))
        begin
          reg7 <= wire2[(2'h2):(1'h1)];
        end
      else
        begin
          reg7 <= wire0;
          reg8 <= reg7;
        end
      if (($unsigned(((~^((8'haa) ? reg7 : wire5)) != wire3[(2'h3):(2'h2)])) ?
          wire0[(5'h13):(1'h1)] : (wire6 * (reg8[(2'h2):(2'h2)] ?
              ((-(8'ha5)) ?
                  wire2 : (~|wire2)) : $signed(wire5[(1'h0):(1'h0)])))))
        begin
          reg9 <= ($unsigned(wire4[(3'h4):(2'h3)]) ?
              reg7[(2'h2):(1'h1)] : (|($signed($unsigned(wire1)) ?
                  ($signed(wire0) ~^ $unsigned((8'h9f))) : ((wire6 && wire6) ?
                      ((8'hb5) ^ wire3) : reg7))));
          if ($signed((~$unsigned(wire5[(3'h5):(1'h0)]))))
            begin
              reg10 <= (~|(({(wire2 ?
                      wire5 : wire4)} && (8'ha1)) ~^ {(reg8[(3'h6):(3'h4)] ~^ reg8),
                  (8'ha4)}));
              reg11 <= {$signed((+($signed(reg8) ?
                      (reg9 <<< (7'h44)) : wire2[(4'hc):(4'hc)]))),
                  $signed(((((8'hb8) ? wire6 : wire5) && (^~wire1)) ?
                      {(~^(8'ha1)),
                          (~^(8'hac))} : $unsigned((wire4 <<< wire2))))};
              reg12 <= $unsigned($unsigned((~^reg11[(2'h3):(1'h0)])));
            end
          else
            begin
              reg10 <= {wire1[(5'h11):(5'h10)], $unsigned(reg12)};
              reg11 <= wire5[(3'h7):(3'h6)];
              reg12 <= ((8'hbe) >= reg9[(2'h3):(1'h1)]);
              reg13 <= (~$signed((~&({reg12, reg12} ~^ reg9))));
            end
          if ((&wire4[(3'h5):(3'h5)]))
            begin
              reg14 <= (!(-reg13));
              reg15 <= $unsigned(reg12);
              reg16 <= ((~(-(!$unsigned(reg8)))) ?
                  wire6[(1'h0):(1'h0)] : $signed(wire1[(2'h2):(1'h0)]));
              reg17 <= $unsigned(wire3[(1'h0):(1'h0)]);
            end
          else
            begin
              reg14 <= (-(wire2 >> $signed({wire6[(1'h1):(1'h0)],
                  (wire0 >> wire4)})));
              reg15 <= $signed((^((~^reg16[(2'h2):(1'h1)]) <= reg13)));
              reg16 <= (reg14 ? (8'had) : reg7);
              reg17 <= {$unsigned((reg14 ?
                      ((wire4 ^~ reg13) * reg17) : {(reg7 & wire3),
                          $signed((8'ha8))})),
                  (($unsigned(wire4) ^~ wire0) ?
                      (~^wire2) : $signed($unsigned(((8'hb1) | reg9))))};
            end
        end
      else
        begin
          reg9 <= ($signed({(~(wire5 != wire0)),
              ($signed((8'ha1)) >= (reg8 <= reg8))}) == $signed((7'h40)));
          if ($unsigned($signed($signed(((wire3 ?
              reg11 : reg16) == $unsigned(wire6))))))
            begin
              reg10 <= $unsigned(((~|(8'hab)) && ((reg10[(4'hd):(3'h4)] < $signed(wire6)) > wire3)));
              reg11 <= $unsigned(($unsigned((~wire2[(1'h0):(1'h0)])) ?
                  ($signed($unsigned(reg9)) ?
                      wire1[(4'h8):(3'h5)] : reg11) : (wire1[(5'h15):(4'hc)] ?
                      reg15 : ((wire5 ?
                          (8'hae) : wire5) * $unsigned((7'h40))))));
              reg12 <= (+(&$unsigned((~^(|reg11)))));
              reg13 <= {($unsigned(wire5) ?
                      (((~^reg17) ?
                          (8'h9e) : $signed(reg9)) <= reg15[(5'h11):(5'h11)]) : ({$signed(reg10)} >>> {$signed(reg15),
                          $unsigned(wire1)}))};
            end
          else
            begin
              reg10 <= (((wire2[(3'h4):(1'h1)] & ({wire0, reg8} ?
                      (^~(8'ha0)) : reg12)) ~^ {wire3[(3'h6):(3'h5)],
                      $unsigned(reg13[(2'h2):(1'h0)])}) ?
                  {((7'h41) || reg12),
                      wire3[(2'h3):(2'h2)]} : $signed({reg16}));
              reg11 <= $unsigned(wire0[(4'hc):(4'h8)]);
            end
          reg14 <= wire6[(2'h2):(1'h0)];
        end
      reg18 <= {(reg16 ? (!(^~wire3)) : {{wire5, {wire4}}}),
          $unsigned(reg11[(2'h2):(1'h0)])};
    end
  assign wire19 = (!reg7[(2'h3):(2'h3)]);
  assign wire20 = ({(!{$signed(reg16), $signed((8'h9e))}),
                          $signed((~|(reg18 ? wire4 : reg18)))} ?
                      reg14[(2'h2):(1'h1)] : (((reg7[(2'h2):(1'h1)] ?
                                  (^~wire19) : $signed(wire19)) ?
                              $signed((reg16 ?
                                  reg9 : wire1)) : (wire3[(1'h1):(1'h0)] ?
                                  (!reg12) : {reg10, wire4})) ?
                          $signed(reg7) : ((!wire0) ?
                              (-$unsigned(wire3)) : ((reg9 ?
                                      (8'hbe) : (8'hb8)) ?
                                  reg13 : (^wire2)))));
endmodule
