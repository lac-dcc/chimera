module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h134):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire4;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire29;
  wire signed [(4'hb):(1'h0)] wire28;
  wire signed [(3'h6):(1'h0)] wire5;
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire5,
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
  assign wire5 = (^wire4);
  always
    @(posedge clk) begin
      reg6 <= ((|(~|wire3[(2'h2):(2'h2)])) ?
          wire1[(4'hb):(2'h2)] : (wire2[(3'h6):(2'h3)] ?
              ($unsigned(wire1[(5'h11):(4'hf)]) <= ($signed(wire0) >= (+wire3))) : ((~(wire4 ?
                  wire5 : wire2)) >= $signed((wire2 ? (8'hb5) : wire3)))));
      reg7 <= (8'haf);
      if (reg7[(3'h4):(2'h2)])
        begin
          reg8 <= wire3[(3'h5):(1'h0)];
          reg9 <= {wire0[(2'h3):(1'h1)],
              (reg7[(1'h1):(1'h0)] - (-($unsigned(reg6) ?
                  ((8'hbb) ? wire0 : reg8) : {wire5, reg6})))};
          reg10 <= ($unsigned($unsigned($unsigned($signed(wire0)))) ?
              ($unsigned((^~(~wire5))) ? reg7 : reg7) : ($unsigned(wire0) ?
                  (~^$signed(wire3)) : reg8));
          if (reg10[(4'hd):(2'h2)])
            begin
              reg11 <= {(!((((8'ha8) ?
                      wire2 : reg8) == reg10[(3'h5):(2'h2)]) << $unsigned((^~wire3)))),
                  wire0[(1'h0):(1'h0)]};
              reg12 <= (^~(~&wire3));
              reg13 <= ((reg12[(4'hd):(2'h3)] ?
                  reg9 : ($signed((8'ha1)) << reg9)) >>> (|$unsigned({(reg10 ?
                      wire4 : reg10),
                  (|reg11)})));
            end
          else
            begin
              reg11 <= {(-$unsigned(($signed(reg11) << (8'ha3)))),
                  $signed(wire4[(3'h6):(3'h6)])};
              reg12 <= ((^wire2) * reg11);
              reg13 <= $unsigned((8'ha5));
              reg14 <= (8'hbb);
            end
          reg15 <= reg11;
        end
      else
        begin
          if ((wire1[(4'hf):(3'h7)] ?
              (((~reg9) ?
                      $signed((wire3 ? wire3 : wire0)) : ((reg14 ^ (8'hb6)) ?
                          $unsigned(wire1) : {(8'ha9), reg14})) ?
                  ((^reg10[(3'h7):(1'h0)]) ?
                      ((reg15 ~^ reg13) ?
                          (reg15 <= reg11) : $signed((8'hb0))) : $signed((reg6 <= wire0))) : (wire5[(1'h1):(1'h0)] ?
                      $unsigned((reg9 ?
                          (8'hb4) : reg6)) : $signed(reg8))) : $unsigned(wire5[(1'h1):(1'h0)])))
            begin
              reg8 <= reg8[(2'h3):(1'h0)];
              reg9 <= wire1[(5'h10):(3'h7)];
              reg10 <= reg13;
            end
          else
            begin
              reg8 <= {({reg15[(3'h5):(2'h3)],
                          ($signed(reg12) && (wire5 ? reg13 : reg13))} ?
                      reg7[(1'h0):(1'h0)] : $unsigned({{reg12}})),
                  ((~$unsigned((-wire5))) ?
                      (&(8'hb3)) : $signed($signed(reg7[(4'h8):(3'h4)])))};
              reg9 <= (+{$unsigned($signed($unsigned(reg13)))});
            end
          if (($signed((reg7[(2'h3):(1'h0)] || $unsigned($unsigned(wire3)))) ?
              ({$signed((reg12 ? reg8 : reg15)),
                      $unsigned((wire5 ? wire3 : wire0))} ?
                  (8'hb6) : ((8'h9d) ?
                      (8'ha6) : ($signed((8'hb5)) ?
                          (reg6 ?
                              reg13 : wire2) : (reg14 - (8'had))))) : ((8'hb3) - (reg7 ?
                  (-$unsigned(reg14)) : ((reg7 ^ wire5) ?
                      $unsigned(wire2) : ((8'hb1) ? reg13 : reg15))))))
            begin
              reg11 <= (!(+$signed(((|wire5) && $unsigned((8'hb7))))));
              reg12 <= ($unsigned(wire1) < (~^((^~$unsigned((8'h9c))) ?
                  (|reg15) : reg7[(4'h8):(2'h3)])));
            end
          else
            begin
              reg11 <= reg14[(4'h8):(1'h0)];
              reg12 <= {$signed($unsigned(reg9))};
            end
        end
      if ($unsigned((~^(((reg8 ? wire2 : reg7) && $unsigned(reg13)) ?
          reg11 : (8'hb5)))))
        begin
          if (((~&{$signed($unsigned(reg8))}) ?
              $unsigned($unsigned(reg12)) : {$signed($signed((wire2 == (7'h44))))}))
            begin
              reg16 <= {reg15[(3'h5):(2'h2)]};
            end
          else
            begin
              reg16 <= (8'hbe);
            end
          reg17 <= {(8'ha4),
              (((wire5 <<< (reg8 ? (8'hbc) : (8'h9e))) >> reg8[(4'hb):(4'hb)]) ?
                  (^~((reg14 <= wire5) + $unsigned(wire0))) : reg9)};
          reg18 <= $signed((wire5[(3'h5):(1'h0)] + wire3));
        end
      else
        begin
          if ((($unsigned(($unsigned(reg17) ^~ (reg9 < reg6))) ^~ $unsigned($unsigned(reg7))) ?
              (~^(~{(reg13 ? wire1 : reg17)})) : $signed($signed((reg7 ?
                  reg18 : $unsigned(wire3))))))
            begin
              reg16 <= reg12[(3'h7):(2'h2)];
              reg17 <= $unsigned($unsigned(wire5));
              reg18 <= $unsigned(reg7);
            end
          else
            begin
              reg16 <= ((^~(reg11 ?
                      $unsigned((reg17 || wire5)) : ($signed(wire5) | (reg14 ?
                          reg9 : reg12)))) ?
                  ((~($unsigned(reg7) & (reg6 ?
                      reg10 : reg16))) * reg6) : $unsigned(reg15));
              reg17 <= reg9[(4'h9):(1'h0)];
              reg18 <= (((reg8 ?
                  reg14[(1'h1):(1'h1)] : ({reg6} ?
                      (reg13 ?
                          reg15 : (8'ha5)) : (wire1 <= wire1))) <<< {$unsigned((8'hba)),
                  ((reg17 ? wire0 : wire3) ?
                      $signed(reg13) : reg17)}) >> (^(({wire2} ? reg6 : wire1) ?
                  (+reg7[(3'h5):(2'h2)]) : {$signed(reg9)})));
            end
          reg19 <= reg10;
          if ($unsigned(reg17[(2'h2):(1'h0)]))
            begin
              reg20 <= (8'hac);
              reg21 <= (8'hab);
            end
          else
            begin
              reg20 <= $unsigned($signed($unsigned((8'haa))));
            end
          if (wire4)
            begin
              reg22 <= ((reg9[(3'h6):(3'h5)] >> $signed($unsigned($signed(reg18)))) || (($signed((reg19 <<< wire5)) >> reg18[(2'h3):(1'h0)]) ?
                  (8'h9f) : reg11[(2'h3):(1'h0)]));
              reg23 <= (reg19 ?
                  ((($unsigned(wire0) ?
                              wire4[(2'h2):(2'h2)] : (reg20 != reg20)) ?
                          reg22[(5'h14):(3'h4)] : wire4[(3'h5):(2'h3)]) ?
                      (reg18 ?
                          ((reg22 + wire5) + (wire4 ?
                              (8'hb4) : reg13)) : wire3) : $signed(((^~reg14) - reg21))) : $signed($unsigned({reg16})));
              reg24 <= (wire1 ? reg13[(4'h8):(3'h5)] : {wire3});
              reg25 <= $unsigned({((reg12 ?
                          (reg8 << reg23) : ((8'ha9) ^ wire2)) ?
                      reg16 : ((reg8 ? (8'hb3) : reg23) - (reg14 - wire3))),
                  $unsigned(reg14)});
            end
          else
            begin
              reg22 <= $signed((reg22[(3'h6):(1'h0)] || ($signed((~|reg9)) ?
                  ((|(8'hb3)) ?
                      (reg6 != reg7) : {wire3, reg12}) : ((wire3 <<< reg16) ?
                      (reg15 ? reg22 : (8'hbb)) : wire5[(3'h6):(1'h1)]))));
            end
          reg26 <= $signed((-$signed($unsigned(((8'hb8) ? (8'hb8) : wire3)))));
        end
      reg27 <= (wire0 ?
          {(wire5[(1'h1):(1'h0)] || {(^~reg10)}),
              (8'ha4)} : $unsigned($unsigned(reg20[(1'h1):(1'h0)])));
    end
  assign wire28 = reg8[(5'h11):(5'h11)];
  assign wire29 = $signed((~wire3[(1'h1):(1'h0)]));
endmodule
