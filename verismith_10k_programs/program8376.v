module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h10f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire24;
  wire signed [(2'h3):(1'h0)] wire22;
  wire signed [(3'h7):(1'h0)] wire21;
  wire [(5'h15):(1'h0)] wire20;
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg [(2'h3):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg5 = (1'h0);
  reg [(3'h7):(1'h0)] reg4 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire22,
                 wire21,
                 wire20,
                 reg23,
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
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (8'hbb);
      reg5 <= reg4[(3'h5):(2'h2)];
      reg6 <= (-(&($signed((~^reg5)) <= (~|(wire3 && (8'hbf))))));
      if ({$unsigned(wire3)})
        begin
          reg7 <= (+wire1[(2'h3):(2'h2)]);
          if (wire2)
            begin
              reg8 <= $signed(wire2);
              reg9 <= ((|(wire3[(5'h11):(4'hb)] ?
                      reg7[(4'hc):(2'h2)] : (8'hb2))) ?
                  reg6[(5'h10):(3'h4)] : {(-wire0)});
            end
          else
            begin
              reg8 <= (~wire0[(4'h9):(3'h5)]);
            end
        end
      else
        begin
          if ($unsigned(wire3[(3'h5):(2'h3)]))
            begin
              reg7 <= {(&($signed((~&reg9)) ?
                      wire3[(5'h15):(5'h13)] : ({reg4, wire2} ?
                          (reg7 != reg9) : (reg8 ^ reg8)))),
                  reg4[(3'h7):(3'h4)]};
            end
          else
            begin
              reg7 <= $unsigned(reg8);
              reg8 <= (wire2[(1'h0):(1'h0)] ?
                  wire1[(2'h3):(1'h0)] : (+$signed((reg8 & reg9))));
              reg9 <= reg6[(4'he):(2'h3)];
            end
          if ($signed($unsigned(((^(-wire0)) ?
              $signed(wire2[(2'h3):(2'h2)]) : $signed((+reg7))))))
            begin
              reg10 <= reg9[(4'hb):(4'hb)];
              reg11 <= $signed($unsigned($signed(reg9)));
              reg12 <= reg11;
              reg13 <= reg5;
            end
          else
            begin
              reg10 <= (($unsigned((^~$signed(reg12))) ^ {{(wire2 ?
                              wire1 : wire1)},
                      $signed((^reg4))}) ?
                  ((wire2 | reg4) ?
                      (~reg9[(4'he):(3'h4)]) : $unsigned($unsigned($unsigned(reg7)))) : {(reg4[(3'h5):(3'h5)] ?
                          ($unsigned((8'hbc)) ?
                              wire2[(2'h3):(2'h2)] : $signed(reg11)) : (+reg9)),
                      $signed(reg8[(1'h0):(1'h0)])});
              reg11 <= reg7[(3'h5):(2'h3)];
              reg12 <= ((^wire3[(4'he):(3'h4)]) ?
                  ($unsigned($unsigned(reg9[(2'h2):(2'h2)])) ?
                      {reg10, $unsigned(wire0)} : (((reg8 ? wire3 : reg12) ?
                          reg12[(4'h9):(3'h7)] : reg10[(3'h7):(2'h2)]) == ({reg12} >> wire3))) : $unsigned(($unsigned((~|reg10)) <= (~|$signed(reg6)))));
            end
          reg14 <= (reg7 ? wire2 : $signed((8'hbc)));
          if (reg14)
            begin
              reg15 <= {(reg14[(2'h3):(2'h3)] >>> ((&(~|reg12)) <= {(reg13 ?
                          wire1 : reg13)})),
                  (reg12[(2'h2):(1'h0)] ?
                      (|$signed(reg9)) : (reg12[(2'h3):(1'h0)] >>> reg5))};
              reg16 <= ($unsigned(reg4) > $unsigned($signed((wire2 != reg15))));
              reg17 <= reg16[(1'h1):(1'h1)];
              reg18 <= ((~&(reg8[(2'h2):(1'h0)] & wire0)) ?
                  (~^(-((^reg10) >= $unsigned(reg11)))) : reg10[(1'h0):(1'h0)]);
            end
          else
            begin
              reg15 <= ({({(~|reg12), (reg17 ? reg14 : wire3)} ?
                          $unsigned({(8'hbd)}) : ($unsigned(reg15) == $unsigned(reg13)))} ?
                  $signed(reg10) : $signed($signed({reg17[(5'h12):(4'hc)],
                      $unsigned((8'ha3))})));
              reg16 <= reg14[(2'h3):(2'h3)];
              reg17 <= reg15[(1'h1):(1'h1)];
              reg18 <= {(($unsigned((8'hb3)) * reg11[(4'h9):(1'h1)]) ?
                      $unsigned({reg5[(4'he):(2'h3)],
                          reg18[(3'h5):(3'h4)]}) : (~|(~^reg17))),
                  (-(($signed(wire1) >>> (reg15 ? reg12 : wire3)) ?
                      (reg15[(1'h1):(1'h1)] <<< (reg14 ?
                          (8'hb4) : reg10)) : reg9))};
            end
          reg19 <= (reg8 <= {($signed((|reg15)) ?
                  (wire2[(1'h1):(1'h0)] * reg8[(2'h2):(1'h0)]) : $signed(((8'hb7) ?
                      wire2 : reg10)))});
        end
    end
  assign wire20 = (reg18 & (~^{((reg9 >> reg13) ?
                          reg15[(3'h4):(1'h0)] : reg19[(2'h2):(1'h1)])}));
  assign wire21 = reg15[(4'h9):(4'h9)];
  assign wire22 = (^(reg12[(3'h6):(2'h2)] ?
                      $unsigned($signed($signed(reg12))) : (reg19 ?
                          ($unsigned(reg4) ?
                              (reg5 ?
                                  reg8 : reg15) : $signed(wire0)) : (wire20[(5'h14):(5'h10)] | $unsigned(reg6)))));
  always
    @(posedge clk) begin
      reg23 <= $unsigned((-(~reg8)));
    end
  assign wire24 = ((~reg5[(4'he):(4'he)]) ?
                      $signed(($signed($signed(reg17)) + $signed((reg12 ?
                          wire3 : wire0)))) : reg17[(4'hb):(4'h8)]);
  assign wire25 = (-(reg14[(1'h1):(1'h0)] ? reg13 : reg14));
endmodule
