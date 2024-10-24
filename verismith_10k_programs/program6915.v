module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h116):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire26;
  wire [(5'h12):(1'h0)] wire25;
  wire signed [(3'h7):(1'h0)] wire24;
  wire [(4'hb):(1'h0)] wire23;
  wire [(4'he):(1'h0)] wire22;
  wire [(4'h9):(1'h0)] wire18;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire4;
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire18,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg21,
                 reg20,
                 reg19,
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
                 (1'h0)};
  assign wire4 = (^wire1);
  assign wire5 = (($signed($signed({(8'h9f)})) * ({wire3[(2'h2):(1'h1)]} ?
                         ($unsigned(wire1) ?
                             ((8'ha0) ? wire3 : wire0) : (wire0 ?
                                 wire3 : wire0)) : (|(wire0 ^ wire1)))) ?
                     $signed((~&wire1[(3'h4):(2'h3)])) : ({{(~wire4),
                             (wire0 ?
                                 (8'hbb) : wire4)}} >= $unsigned($unsigned(wire2[(2'h2):(1'h0)]))));
  assign wire6 = wire3;
  assign wire7 = (^$unsigned($signed(($unsigned(wire6) ?
                     {wire2} : (wire6 ? wire0 : wire0)))));
  always
    @(posedge clk) begin
      reg8 <= $signed({$signed($signed($unsigned(wire0)))});
      reg9 <= wire2;
      reg10 <= reg8;
      if (({wire0[(4'hd):(2'h3)],
              (wire3 >>> ({wire7, reg9} && wire0[(4'h8):(1'h1)]))} ?
          $signed(($signed((^~(8'ha9))) < ($signed(wire7) >= (^wire0)))) : wire2))
        begin
          reg11 <= (wire5 ^ $signed((^~$signed((&wire1)))));
          reg12 <= $signed($unsigned($unsigned($unsigned({wire2, wire5}))));
          reg13 <= reg11;
          reg14 <= (~wire2);
          reg15 <= {(((wire5[(1'h0):(1'h0)] <<< (~^wire0)) >> ((reg11 ?
                      (8'h9e) : reg12) ?
                  (|wire5) : wire2[(3'h6):(3'h5)])) * $unsigned(reg12)),
              ($signed({$unsigned(wire1),
                  (reg14 ? wire4 : wire6)}) >= (~&((^wire1) && (^wire1))))};
        end
      else
        begin
          reg11 <= ($unsigned(wire1) ~^ (^~wire4[(1'h0):(1'h0)]));
          reg12 <= reg10[(1'h0):(1'h0)];
          if ((|reg9[(1'h0):(1'h0)]))
            begin
              reg13 <= wire7;
              reg14 <= {$unsigned((~|$signed({wire1, wire6})))};
              reg15 <= (((~&($unsigned(wire3) > ((8'hbd) << reg14))) >>> reg11[(4'hd):(4'h8)]) ?
                  (wire0 ^~ wire7) : (wire4[(1'h1):(1'h1)] - reg8[(4'hf):(1'h0)]));
            end
          else
            begin
              reg13 <= $signed(wire4[(3'h6):(2'h3)]);
              reg14 <= $signed((reg15[(4'h8):(2'h2)] ?
                  ($signed((wire6 ?
                      reg10 : reg13)) ^~ reg12[(2'h3):(1'h1)]) : wire2));
              reg15 <= (($unsigned(wire4[(3'h7):(2'h3)]) && ((8'hb5) >>> $unsigned((~|reg15)))) && (~&reg14[(1'h0):(1'h0)]));
            end
          reg16 <= wire7[(3'h6):(3'h6)];
          reg17 <= (&$unsigned(({reg10[(1'h1):(1'h1)]} ?
              $unsigned($signed(reg15)) : $unsigned((reg10 ? reg10 : wire5)))));
        end
    end
  assign wire18 = $signed((-(&((reg11 ? reg8 : wire6) ^ $signed(wire7)))));
  always
    @(posedge clk) begin
      reg19 <= wire1[(3'h4):(3'h4)];
      reg20 <= {{(wire5 | (^~$unsigned((8'hb2))))},
          $unsigned(($unsigned(wire3) ?
              {(~&reg13), reg10} : reg12[(4'hf):(4'hb)]))};
      reg21 <= $signed(wire0);
    end
  assign wire22 = reg15[(1'h1):(1'h0)];
  assign wire23 = ((wire4 ?
                      ({(^~reg10), ((8'hbb) >= wire0)} ?
                          ((reg20 >>> reg12) ?
                              ((8'hac) ?
                                  wire0 : reg9) : $unsigned(wire7)) : (reg19[(4'h9):(2'h3)] >= {reg21})) : $signed($signed($signed((8'h9c))))) != $signed((~^reg13[(4'ha):(3'h7)])));
  assign wire24 = (|wire4);
  assign wire25 = $unsigned($signed((~&wire18[(2'h2):(2'h2)])));
  assign wire26 = (wire7 ?
                      $unsigned(reg12[(4'hf):(4'hb)]) : (~|{$signed((reg9 ?
                              reg9 : wire18))}));
endmodule
