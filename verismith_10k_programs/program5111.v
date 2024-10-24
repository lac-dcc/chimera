module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire4;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire23;
  wire [(4'hd):(1'h0)] wire22;
  wire signed [(4'h8):(1'h0)] wire21;
  wire signed [(4'he):(1'h0)] wire20;
  wire signed [(5'h10):(1'h0)] wire19;
  wire signed [(5'h15):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire17;
  wire signed [(3'h6):(1'h0)] wire5;
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg [(3'h6):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg6 = (1'h0);
  assign y = {wire26,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire5,
                 reg28,
                 reg27,
                 reg25,
                 reg24,
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
  assign wire5 = ($unsigned(wire2) >> $signed((+wire1[(5'h12):(3'h4)])));
  always
    @(posedge clk) begin
      reg6 <= {wire3, (~|wire3[(4'ha):(1'h1)])};
      if (((($unsigned($unsigned(wire3)) | (+wire5[(2'h2):(1'h1)])) ?
              ($unsigned(wire4) & ((wire2 ? wire2 : (8'hb9)) ?
                  $unsigned((8'haa)) : (reg6 == wire0))) : (|$signed($signed(wire3)))) ?
          wire3 : wire4))
        begin
          if ((($unsigned(wire0) <<< ((^$unsigned(wire3)) * ($unsigned(wire4) ?
              (~^reg6) : (&wire4)))) == reg6))
            begin
              reg7 <= wire5[(3'h6):(1'h0)];
              reg8 <= wire1;
            end
          else
            begin
              reg7 <= (~&(($unsigned($unsigned(wire1)) ?
                  ((wire2 ? reg7 : wire0) ?
                      (-reg7) : (reg6 - (8'hab))) : reg7[(1'h1):(1'h0)]) != (wire0 ?
                  ($unsigned(reg6) ?
                      (~&wire0) : wire5[(3'h4):(2'h2)]) : (~^(&(7'h40))))));
              reg8 <= wire0[(2'h3):(1'h0)];
              reg9 <= (^((~$signed((~wire0))) ?
                  wire1[(3'h6):(2'h3)] : $unsigned(wire2[(1'h0):(1'h0)])));
              reg10 <= (^~{((^~(-wire5)) ?
                      ($signed((8'hba)) >= wire1[(4'h8):(4'h8)]) : $unsigned(((7'h43) ^ reg7))),
                  reg9});
              reg11 <= $signed($unsigned(($signed(wire5[(3'h5):(2'h3)]) & ($signed((8'hb7)) ^ (&reg10)))));
            end
          if (($signed(((wire3 < reg7) && $signed(reg11[(1'h1):(1'h0)]))) ?
              ((reg10 * (((8'hb6) ? (8'ha2) : reg9) <<< {reg7,
                  wire0})) ~^ $unsigned((reg10[(1'h0):(1'h0)] ?
                  (wire2 ? reg10 : wire2) : (wire5 ? wire2 : wire0)))) : wire5))
            begin
              reg12 <= ({((~^reg8) ?
                          {{reg8, wire1},
                              (wire5 ?
                                  (8'hb4) : (8'ha0))} : (&(wire4 != (7'h43)))),
                      ((^reg8[(2'h3):(2'h2)]) ?
                          {$unsigned(reg7),
                              (8'hbc)} : $unsigned($signed(wire1)))} ?
                  {$signed(reg8),
                      (wire2 + wire1[(2'h2):(2'h2)])} : ((^~wire1[(5'h12):(4'ha)]) ?
                      (reg11 + (((8'hb1) ^ reg8) ?
                          (reg9 << wire5) : (^~wire5))) : $signed($unsigned({wire2,
                          wire5}))));
              reg13 <= wire4[(1'h1):(1'h0)];
              reg14 <= $signed($signed($signed((reg10[(1'h1):(1'h0)] ?
                  $unsigned(reg9) : wire2[(2'h2):(2'h2)]))));
            end
          else
            begin
              reg12 <= reg7[(3'h4):(1'h1)];
              reg13 <= ($unsigned(((wire4 - (^~wire3)) ?
                      ({wire1, reg8} ?
                          {wire5} : (reg10 ~^ reg14)) : wire5[(2'h3):(1'h0)])) ?
                  (~&reg7) : reg11[(1'h1):(1'h0)]);
              reg14 <= (reg7 ?
                  reg12 : $signed((+($signed(wire2) || $unsigned(wire0)))));
            end
          reg15 <= (({$signed(reg7[(4'h8):(1'h0)])} < $unsigned(wire2)) ^~ ($unsigned({{(8'ha5),
                  reg12},
              (reg6 ^ reg10)}) || $signed(reg7)));
          reg16 <= $signed(wire2);
        end
      else
        begin
          reg7 <= $signed((|wire1));
          reg8 <= reg11;
          reg9 <= (~&$signed($unsigned($unsigned(((8'hbd) ? reg14 : wire5)))));
          reg10 <= reg12;
          reg11 <= (!$unsigned(reg13));
        end
    end
  assign wire17 = reg6[(2'h3):(2'h2)];
  assign wire18 = ((^$unsigned(reg13[(1'h0):(1'h0)])) ?
                      reg16[(4'hf):(4'hc)] : reg14);
  assign wire19 = $unsigned($unsigned(reg9));
  assign wire20 = (+((reg11[(3'h7):(3'h4)] ?
                      (~&$signed((8'haa))) : $signed($signed(wire1))) || ($unsigned($unsigned(reg16)) ^ ({wire5} ?
                      $signed(reg11) : $unsigned(reg11)))));
  assign wire21 = wire19[(4'hd):(3'h4)];
  assign wire22 = (-($unsigned(wire20) & (+$unsigned(wire20))));
  assign wire23 = $unsigned($unsigned(wire17[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg24 <= reg14[(3'h6):(2'h2)];
      reg25 <= wire19[(4'hd):(3'h6)];
    end
  assign wire26 = $unsigned(wire20[(4'hb):(4'ha)]);
  always
    @(posedge clk) begin
      reg27 <= $unsigned(({((wire26 ? reg6 : reg13) ? {wire3} : (~^reg9))} ?
          (~{wire23[(4'ha):(3'h4)],
              $unsigned(reg8)}) : $signed((!$unsigned(wire26)))));
      reg28 <= {$unsigned(wire1)};
    end
endmodule
