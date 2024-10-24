module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h103):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire [(3'h4):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire25;
  wire signed [(5'h10):(1'h0)] wire24;
  wire [(4'h9):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire22;
  wire [(4'ha):(1'h0)] wire21;
  wire signed [(4'ha):(1'h0)] wire20;
  wire [(3'h6):(1'h0)] wire19;
  wire [(4'hf):(1'h0)] wire18;
  wire signed [(4'hf):(1'h0)] wire17;
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg [(3'h6):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  reg [(4'hd):(1'h0)] reg5 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
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
      if ($unsigned($unsigned(wire3)))
        begin
          reg5 <= $signed(($signed($unsigned((|wire2))) ?
              $signed($unsigned(wire1[(1'h0):(1'h0)])) : (8'hb4)));
          reg6 <= (+(($unsigned((wire2 ? wire2 : wire0)) ?
                  ((wire2 <= wire1) - $unsigned(wire2)) : $unsigned((^wire0))) ?
              wire1[(1'h1):(1'h0)] : (~|(8'ha7))));
          reg7 <= (8'hb1);
        end
      else
        begin
          if (((reg6 * ($signed($unsigned(wire2)) >> reg5[(2'h2):(2'h2)])) ?
              reg6 : ((8'hbd) ?
                  ({(wire1 ? wire3 : reg5)} ?
                      ((wire0 ? wire4 : wire1) ?
                          ((8'hb1) + wire1) : wire3) : ({wire4, wire2} ?
                          (reg7 == wire3) : (wire1 || reg7))) : ({wire0} ?
                      ((reg7 - reg5) ? {(8'hb5), wire2} : (-wire0)) : ((8'hb5) ?
                          $unsigned(reg5) : $signed(wire1))))))
            begin
              reg5 <= {reg7[(3'h5):(3'h4)],
                  ({wire3[(3'h4):(2'h3)]} ? $signed(wire2) : wire0)};
              reg6 <= ($signed($signed($signed(reg7[(3'h4):(1'h0)]))) ?
                  $signed((wire3[(1'h1):(1'h0)] ?
                      ($signed(wire3) ?
                          $unsigned(wire1) : {wire2}) : (|$signed(wire2)))) : ((($signed(wire4) || (8'ha8)) ?
                      (~|{wire3,
                          reg7}) : {(wire3 && wire0)}) << (((reg6 << wire3) ?
                      $signed(reg5) : {(8'hb7), wire4}) | $unsigned((wire4 ?
                      (8'hb2) : wire4)))));
              reg7 <= reg5[(4'h9):(4'h9)];
              reg8 <= $unsigned((~(((wire4 << (7'h41)) >>> {(8'hb8), reg5}) ?
                  (wire3[(2'h3):(2'h2)] <= (~&wire2)) : $signed((wire2 & (8'hb0))))));
              reg9 <= reg7[(3'h6):(3'h6)];
            end
          else
            begin
              reg5 <= (8'h9d);
              reg6 <= (8'hbe);
              reg7 <= (wire1[(2'h2):(1'h0)] == (7'h44));
              reg8 <= ($signed($signed($signed(wire2))) ~^ $unsigned(($unsigned(reg6) && $unsigned($signed((8'hb5))))));
              reg9 <= reg8[(3'h4):(1'h0)];
            end
        end
      reg10 <= (reg5[(3'h6):(2'h2)] ?
          ((($unsigned(reg9) ? {reg6, wire3} : {wire1, reg8}) < {(7'h42),
                  wire1}) ?
              $unsigned(($signed((8'hb9)) ?
                  reg6[(3'h6):(3'h4)] : wire4[(4'hc):(4'hc)])) : (^$signed($signed(reg7)))) : {wire2[(1'h0):(1'h0)]});
      if ((reg5[(4'h9):(1'h1)] ?
          ($unsigned(({reg8, (8'hb0)} - (reg9 ?
              reg6 : reg8))) * $signed((!$unsigned(reg9)))) : reg5[(4'h9):(4'h9)]))
        begin
          if ((&$unsigned((((reg8 || reg9) ?
              ((8'hac) ?
                  (8'ha6) : wire1) : (wire0 || wire4)) || ((&reg6) >> reg9)))))
            begin
              reg11 <= wire3;
              reg12 <= {(reg7[(1'h0):(1'h0)] - reg10[(3'h6):(2'h3)]),
                  $unsigned(reg7[(3'h7):(2'h3)])};
              reg13 <= (wire3[(1'h1):(1'h1)] >>> ($unsigned((~|(^~wire3))) > $unsigned(reg6[(3'h4):(2'h2)])));
              reg14 <= $unsigned(((~({wire0} ? wire2 : wire3[(1'h1):(1'h1)])) ?
                  $signed(($unsigned(wire3) >> (^wire3))) : $signed(reg11[(4'ha):(1'h1)])));
            end
          else
            begin
              reg11 <= (^(+(wire4 & reg9)));
              reg12 <= (!($unsigned($unsigned(((7'h44) + wire3))) ?
                  $signed(reg5) : $unsigned($signed((!(8'ha3))))));
              reg13 <= (~^{($unsigned((8'haa)) + reg6)});
              reg14 <= reg7[(1'h1):(1'h0)];
              reg15 <= wire4[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg11 <= ($signed(reg10[(1'h0):(1'h0)]) ?
              $unsigned((reg5[(4'hd):(4'h8)] ?
                  ({wire0} > (reg8 > wire0)) : ((8'hb7) ?
                      $unsigned(reg9) : reg8))) : reg5[(1'h1):(1'h0)]);
          reg12 <= reg13;
        end
      reg16 <= (~&$unsigned(($signed($signed(reg14)) > (-reg7[(1'h1):(1'h1)]))));
    end
  assign wire17 = $unsigned((+(reg13 < ((8'h9f) <= $unsigned(wire0)))));
  assign wire18 = wire1;
  assign wire19 = $signed($unsigned((reg7[(3'h4):(2'h3)] ^~ wire17[(2'h2):(1'h0)])));
  assign wire20 = $signed(reg13[(5'h11):(3'h4)]);
  assign wire21 = reg6[(4'h8):(4'h8)];
  assign wire22 = wire0;
  assign wire23 = (wire22[(2'h3):(1'h0)] >> $unsigned($unsigned({{(8'hb6)},
                      $unsigned(reg16)})));
  assign wire24 = $signed($signed($signed($signed((8'ha8)))));
  assign wire25 = $unsigned(wire17);
endmodule
