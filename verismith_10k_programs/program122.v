module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire23;
  wire [(3'h7):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire21;
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(4'hb):(1'h0)] reg6 = (1'h0);
  reg [(4'ha):(1'h0)] reg5 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg4 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
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
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ($signed((~(^{(8'hb6), wire0}))) ^ (~&(|((^wire3) != (wire1 ?
          wire0 : wire2)))));
      if ((^wire3))
        begin
          reg5 <= (8'haa);
          if (wire1[(1'h1):(1'h1)])
            begin
              reg6 <= wire1;
              reg7 <= $signed(({(8'ha5)} ?
                  ($signed(((8'h9e) ? wire3 : reg6)) ?
                      $unsigned((wire2 + wire3)) : $unsigned(((8'ha1) || wire0))) : (reg4[(3'h6):(2'h2)] ?
                      (reg6[(2'h2):(1'h1)] >= reg5) : wire0[(3'h6):(3'h5)])));
              reg8 <= {$signed((8'hb0)), reg5[(3'h4):(3'h4)]};
            end
          else
            begin
              reg6 <= $unsigned(wire0[(5'h12):(4'hb)]);
            end
          if ($unsigned(($unsigned(($unsigned(reg5) ?
                  $signed(reg5) : (8'hb2))) ?
              $signed($unsigned((reg4 ?
                  wire1 : wire2))) : ((~|(~&wire0)) > (8'hb8)))))
            begin
              reg9 <= (+{reg5[(3'h6):(2'h2)], (~(8'hb1))});
              reg10 <= (8'hb4);
              reg11 <= $unsigned(reg10[(2'h2):(1'h0)]);
              reg12 <= $unsigned({((8'ha0) >> (~&{(8'ha5), wire2}))});
            end
          else
            begin
              reg9 <= reg9;
              reg10 <= (&((reg10 < ($signed(wire3) | reg11[(4'h8):(3'h4)])) >= $unsigned(($unsigned((8'hb7)) ?
                  (+wire3) : $signed((7'h41))))));
              reg11 <= (|(reg10[(2'h3):(2'h2)] ?
                  reg11 : ($unsigned($signed(wire2)) ?
                      (reg8 ? reg8[(2'h2):(1'h0)] : (8'hb8)) : {$signed(reg11),
                          reg5[(3'h6):(3'h6)]})));
              reg12 <= wire0;
              reg13 <= wire0[(5'h12):(4'he)];
            end
          if ((reg7[(3'h7):(3'h5)] || $signed(wire0)))
            begin
              reg14 <= {reg7[(4'hd):(4'hd)],
                  ($unsigned({{(8'hae), (8'hbc)},
                      ((8'hab) * (8'hbe))}) + (!$unsigned((reg11 ^ (8'ha2)))))};
              reg15 <= (reg11[(3'h7):(2'h2)] ?
                  $unsigned(wire0) : ((-wire3) <<< $signed({$signed(wire1),
                      (reg6 ? reg9 : wire2)})));
              reg16 <= $signed((reg14 ? $signed(wire3) : reg7));
              reg17 <= (^$signed($unsigned(reg16[(4'h8):(3'h6)])));
            end
          else
            begin
              reg14 <= $signed(((reg6 ?
                      reg7[(3'h5):(2'h3)] : $unsigned((reg10 ? reg9 : wire3))) ?
                  ($signed(reg4) * (~^$unsigned(reg15))) : (((reg5 ?
                              reg15 : (7'h42)) ?
                          $signed((7'h43)) : reg14) ?
                      (~^$unsigned(reg5)) : $unsigned($signed(wire1)))));
              reg15 <= $signed($signed((reg16 | ({(8'hb9), reg8} ?
                  $unsigned(wire2) : (reg16 ? reg15 : reg12)))));
              reg16 <= $unsigned(((wire2 ?
                  ({(8'hbb)} * (reg16 ?
                      reg7 : reg11)) : $signed($signed(reg13))) <= reg6));
              reg17 <= reg16[(2'h3):(1'h1)];
            end
        end
      else
        begin
          reg5 <= reg16;
          if (wire2)
            begin
              reg6 <= $signed((^((&((8'had) ? reg8 : reg14)) ?
                  wire0[(4'hb):(2'h3)] : ($signed(reg11) ?
                      (reg6 & reg5) : (~^(8'ha1))))));
              reg7 <= (8'hbf);
              reg8 <= reg9;
              reg9 <= wire3;
              reg10 <= (8'ha0);
            end
          else
            begin
              reg6 <= wire2[(4'hd):(1'h1)];
              reg7 <= (~^$unsigned(($signed($unsigned(reg8)) ?
                  ((wire3 ? wire3 : reg5) + reg15) : reg8[(4'h9):(3'h4)])));
              reg8 <= reg16[(2'h2):(1'h0)];
            end
          if (wire0)
            begin
              reg11 <= $signed((7'h41));
            end
          else
            begin
              reg11 <= {reg10};
              reg12 <= $signed($signed(({(reg11 ? reg17 : wire3), reg8} ?
                  reg8[(2'h3):(1'h0)] : wire3[(2'h3):(2'h2)])));
              reg13 <= ((&$signed((reg4 ? (!reg11) : $unsigned(reg5)))) ?
                  (wire3 ~^ (~&$unsigned($signed(reg4)))) : reg4);
              reg14 <= reg9;
              reg15 <= (~((!$signed((wire0 - reg10))) != reg8));
            end
          reg16 <= $signed((8'ha6));
        end
      reg18 <= $signed($signed(((8'ha4) - (~|(|wire0)))));
      reg19 <= $signed($signed({(8'hbe), reg15[(4'ha):(1'h0)]}));
      reg20 <= {($unsigned($unsigned($signed(reg9))) ^ $unsigned($signed(reg18[(3'h4):(2'h2)])))};
    end
  assign wire21 = $signed((~|wire3));
  assign wire22 = $unsigned(($signed(reg17) & $unsigned(({reg14} >= wire2))));
  assign wire23 = $unsigned($signed((((reg20 + reg7) && (-reg16)) > (reg18[(4'h8):(3'h4)] ?
                      (reg20 > reg6) : (reg16 > (8'ha5))))));
endmodule
