module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h115):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire20;
  wire signed [(5'h11):(1'h0)] wire19;
  wire [(5'h10):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire17;
  reg [(4'h8):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(3'h6):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(4'he):(1'h0)] reg5 = (1'h0);
  reg [(2'h3):(1'h0)] reg4 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 reg21,
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
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire1;
      reg5 <= (~^$unsigned((^~{(reg4 ? reg4 : (8'hb6))})));
      reg6 <= (8'hae);
      reg7 <= reg5;
      if ($unsigned(reg4))
        begin
          reg8 <= $unsigned(wire3);
          reg9 <= $unsigned(reg5);
          if (({$signed(($signed(reg7) << reg8)),
                  ($signed({(7'h44), reg8}) ?
                      $signed((reg7 || wire3)) : $unsigned((~^wire1)))} ?
              (~&{$unsigned((~^reg6))}) : $unsigned((reg8[(3'h6):(3'h4)] <<< $unsigned($unsigned((8'h9c)))))))
            begin
              reg10 <= $unsigned($unsigned($unsigned(wire2)));
            end
          else
            begin
              reg10 <= (~&(+(reg8[(4'h9):(2'h3)] == (8'hbb))));
              reg11 <= reg9;
              reg12 <= $signed(reg10);
              reg13 <= {reg12};
            end
          if ($unsigned(((($signed(reg12) ? reg9 : $signed(wire2)) ?
              (~|(wire0 * reg12)) : $signed(reg13)) || (reg11[(3'h7):(3'h4)] >= reg5[(3'h6):(3'h4)]))))
            begin
              reg14 <= (&(reg9[(5'h14):(3'h5)] + (((reg4 ?
                  reg7 : wire3) <<< $unsigned(reg4)) != (reg7[(4'hd):(3'h4)] == (^wire1)))));
              reg15 <= (reg4[(2'h2):(1'h0)] > ((!$signed((wire2 ?
                  reg8 : wire1))) * $signed(reg9[(5'h10):(2'h3)])));
              reg16 <= reg10[(1'h1):(1'h0)];
            end
          else
            begin
              reg14 <= wire2[(4'ha):(2'h2)];
              reg15 <= reg16;
            end
        end
      else
        begin
          if (wire3[(1'h1):(1'h1)])
            begin
              reg8 <= $signed($unsigned($unsigned(wire3[(3'h4):(1'h1)])));
              reg9 <= $signed(reg14[(2'h2):(1'h1)]);
              reg10 <= (8'hac);
            end
          else
            begin
              reg8 <= $unsigned(reg9);
              reg9 <= (reg9 >>> {$signed(reg4[(1'h0):(1'h0)])});
              reg10 <= $unsigned($signed((~({(8'hae),
                  reg12} && reg15[(1'h1):(1'h0)]))));
              reg11 <= {{reg4, $signed((-((8'hae) ? reg14 : wire3)))},
                  (~{(!{reg11}), (~&(reg4 & reg10))})};
            end
          reg12 <= (~^(~^($signed(((8'hbc) ? wire3 : (8'hb9))) ?
              ($signed(wire0) - wire3) : (~|$signed(reg13)))));
          if ((((7'h40) ? wire3[(3'h7):(2'h3)] : reg7) ^ reg8[(2'h2):(1'h0)]))
            begin
              reg13 <= reg13;
            end
          else
            begin
              reg13 <= (|(!$signed(reg12[(4'h8):(3'h4)])));
              reg14 <= $signed($signed(($signed(wire1) - reg14)));
              reg15 <= (((!reg15[(4'hd):(2'h3)]) || reg13) ?
                  reg8 : (^~wire2[(4'ha):(1'h1)]));
              reg16 <= reg12;
            end
        end
    end
  assign wire17 = reg6[(3'h4):(1'h1)];
  assign wire18 = $unsigned(reg11[(3'h7):(1'h1)]);
  assign wire19 = {(~&(~^{$signed(reg14)})), wire2};
  assign wire20 = reg11[(3'h7):(3'h4)];
  always
    @(posedge clk) begin
      reg21 <= reg6;
    end
  assign wire22 = reg15[(3'h7):(1'h0)];
  assign wire23 = $signed($signed(reg11));
endmodule
