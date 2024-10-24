module top
#(parameter param29 = (8'hbf), 
parameter param30 = param29)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hf3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire27;
  wire [(3'h7):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire5;
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  reg [(2'h3):(1'h0)] reg7 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = $signed(wire1);
  assign wire6 = wire3[(4'h8):(1'h1)];
  always
    @(posedge clk) begin
      reg7 <= wire4;
      reg8 <= $signed(wire6);
      if ({reg8[(1'h1):(1'h0)], {((^~wire2) > wire6), wire0[(5'h10):(1'h1)]}})
        begin
          if ((&(wire6[(2'h2):(1'h0)] ?
              (wire0 ?
                  $unsigned($unsigned(wire4)) : $unsigned((wire5 ?
                      wire2 : wire4))) : wire3[(4'hb):(4'h8)])))
            begin
              reg9 <= wire6[(2'h2):(1'h0)];
              reg10 <= wire0;
              reg11 <= $signed(($unsigned((wire4 & (wire6 ^ reg7))) != wire1));
              reg12 <= (~reg9[(1'h1):(1'h1)]);
              reg13 <= ($signed(wire4[(1'h0):(1'h0)]) && {$signed($signed((wire5 | reg9)))});
            end
          else
            begin
              reg9 <= {$unsigned(reg10[(3'h5):(2'h3)]),
                  $signed(wire2[(2'h2):(1'h1)])};
              reg10 <= reg7[(2'h2):(1'h1)];
              reg11 <= $signed((~|$unsigned($signed($unsigned(reg7)))));
              reg12 <= $signed($signed(reg10[(3'h4):(2'h2)]));
            end
          reg14 <= reg13[(3'h4):(1'h1)];
          reg15 <= $signed(reg11);
          reg16 <= wire5[(2'h3):(2'h3)];
        end
      else
        begin
          if ($signed((wire1[(2'h3):(1'h1)] ?
              (reg9 & (~&wire3[(3'h5):(3'h4)])) : wire4)))
            begin
              reg9 <= ($unsigned({reg9}) && $signed($unsigned((|$unsigned(reg11)))));
              reg10 <= wire2;
              reg11 <= reg15;
            end
          else
            begin
              reg9 <= reg14[(1'h0):(1'h0)];
              reg10 <= $signed($signed(wire4));
              reg11 <= (wire5 - reg7[(2'h2):(1'h0)]);
              reg12 <= (~|$unsigned(wire0));
              reg13 <= ($signed(((~^$unsigned(wire3)) ?
                  reg13[(4'hc):(4'hb)] : (!wire3))) != (!({(~^wire6),
                      $unsigned(wire0)} ?
                  wire6[(3'h5):(1'h1)] : $unsigned(wire1[(2'h3):(1'h0)]))));
            end
          reg14 <= $unsigned($unsigned(($unsigned((wire3 ?
              wire3 : (8'h9c))) * wire1)));
          reg15 <= ($unsigned(wire1) ?
              (&(~^((8'hb3) >>> ((8'hab) >= (8'hb4))))) : ((^$signed(((8'ha9) > reg7))) && ((~^(~&wire4)) <= wire3[(2'h3):(1'h0)])));
          reg16 <= reg15;
          reg17 <= reg16;
        end
      if (($signed((~$signed((wire4 >>> wire2)))) != $unsigned($unsigned(wire0))))
        begin
          reg18 <= (8'hb7);
          reg19 <= reg8[(4'hd):(4'h8)];
          reg20 <= reg15;
        end
      else
        begin
          if (reg15)
            begin
              reg18 <= {($unsigned((reg7[(1'h0):(1'h0)] ?
                          reg18[(2'h2):(1'h0)] : reg16)) ?
                      ($signed(wire6) || reg14[(3'h4):(1'h1)]) : ($signed(wire2[(4'h8):(1'h1)]) ?
                          $unsigned((&reg16)) : {(~&reg20)})),
                  wire3};
              reg19 <= ($unsigned(($signed($unsigned(reg13)) ?
                  wire3[(4'ha):(3'h4)] : $unsigned(reg14))) > $unsigned(wire3));
            end
          else
            begin
              reg18 <= (reg8 ?
                  reg18[(3'h5):(3'h4)] : ({wire5, $unsigned((reg19 * wire6))} ?
                      $unsigned(reg11[(4'hc):(3'h5)]) : (~^(reg14 <= (~&(8'haa))))));
            end
          reg20 <= (($signed(reg11[(4'he):(3'h7)]) ?
              ($unsigned($unsigned((7'h41))) ^ ($unsigned(reg17) ^ reg14)) : {$signed(reg14[(1'h1):(1'h0)]),
                  (^(reg8 ? wire0 : reg12))}) << {(reg10 ?
                  {$unsigned(reg16), $unsigned(wire4)} : reg17)});
          if ({$signed((((!reg18) ?
                  (wire1 << reg14) : wire4) >>> wire4[(3'h4):(2'h2)])),
              (((^reg12) > (~&$signed((8'ha2)))) & (7'h40))})
            begin
              reg21 <= (8'hba);
              reg22 <= ($unsigned((~|((8'hb5) ?
                  (reg20 ?
                      reg19 : reg21) : (+wire4)))) | $unsigned((^~$signed((~&(7'h43))))));
            end
          else
            begin
              reg21 <= (($unsigned(($signed(wire2) ^ {wire4})) >> ((^(reg16 >> (8'h9e))) ?
                  $signed(reg18[(2'h3):(1'h1)]) : (reg8[(1'h1):(1'h0)] == $unsigned(reg17)))) || $signed((wire3 ?
                  $signed({reg7}) : (-$signed(reg17)))));
              reg22 <= {($unsigned(({reg13} << $unsigned(reg10))) & $unsigned(reg21[(2'h2):(1'h1)])),
                  reg17[(2'h3):(2'h2)]};
              reg23 <= (reg11 == $unsigned(wire0[(4'he):(4'hc)]));
              reg24 <= (|$signed((8'hb0)));
            end
          reg25 <= ({wire4[(1'h1):(1'h1)],
              (8'hb1)} <= $unsigned($unsigned(((~|wire1) == reg17))));
        end
      reg26 <= (+reg12);
    end
  assign wire27 = reg7;
  assign wire28 = (&($signed(wire6[(3'h4):(1'h0)]) ?
                      (reg16[(3'h7):(3'h6)] ?
                          (^$unsigned((8'hb7))) : (~reg23[(1'h1):(1'h0)])) : $signed($signed((reg26 <= reg23)))));
endmodule
