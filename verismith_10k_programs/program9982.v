module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire21;
  wire signed [(4'h9):(1'h0)] wire20;
  wire [(5'h11):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(3'h4):(1'h0)] reg7 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire6,
                 wire5,
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
  assign wire5 = (^$unsigned({{$signed(wire4)},
                     ({wire3, wire0} | ((8'ha9) ? wire0 : wire4))}));
  assign wire6 = (wire5[(4'h8):(2'h3)] >>> $unsigned(wire0[(2'h3):(1'h1)]));
  always
    @(posedge clk) begin
      if ((|(~^(wire0 ? $unsigned({wire5, wire6}) : wire1))))
        begin
          reg7 <= (~^wire1[(3'h7):(1'h1)]);
          if (wire1[(1'h0):(1'h0)])
            begin
              reg8 <= ((!(wire3[(2'h3):(2'h2)] ?
                  (+wire2[(4'hf):(1'h0)]) : (^$signed(wire4)))) >= (((&wire6[(3'h5):(2'h3)]) >>> wire0[(1'h0):(1'h0)]) || {((wire0 ?
                      (8'h9d) : wire4) >>> $signed(wire2))}));
              reg9 <= $unsigned(((((wire6 ? wire3 : wire6) >> wire3) ?
                  $unsigned($signed(wire6)) : ($unsigned(wire3) == $unsigned((8'had)))) >> $signed(wire5[(3'h7):(3'h7)])));
              reg10 <= {(~wire6[(3'h5):(3'h5)])};
            end
          else
            begin
              reg8 <= $signed({(($signed(wire1) != (wire3 >= (7'h40))) ?
                      $signed((+wire3)) : {wire3[(3'h5):(2'h3)]}),
                  wire5});
              reg9 <= wire4;
              reg10 <= (reg7 ?
                  ((&($unsigned(wire6) ?
                      (^wire5) : (wire4 ^ reg9))) < (((wire3 ?
                          wire6 : wire4) > $signed(wire4)) ?
                      reg7 : {$unsigned(wire6)})) : $unsigned(({$unsigned(wire6),
                      (~(8'hb5))} != ($signed(reg10) ?
                      $signed(reg10) : (~&wire3)))));
              reg11 <= reg7[(2'h2):(2'h2)];
            end
        end
      else
        begin
          reg7 <= $signed($signed(wire2[(4'hb):(1'h1)]));
          reg8 <= (~|$unsigned($signed(reg10)));
          reg9 <= (^(reg9[(3'h7):(3'h6)] ?
              (^~$signed($unsigned(wire2))) : wire0[(3'h5):(3'h5)]));
        end
      if ($signed($unsigned(((^~(^wire0)) - (~|wire1[(4'he):(4'ha)])))))
        begin
          reg12 <= ({wire2} <<< (wire6[(4'h8):(2'h2)] ?
              wire4[(1'h1):(1'h1)] : wire1));
          if ((~^$signed($unsigned(wire0))))
            begin
              reg13 <= ($signed($signed($unsigned($unsigned(reg12)))) <<< ((&((~^reg7) ?
                  (~^reg8) : (reg9 >>> reg8))) + (reg7 != $signed($unsigned(wire3)))));
              reg14 <= $signed(($signed($unsigned((reg7 ^ wire5))) ?
                  ((~&(wire3 != (8'ha1))) ?
                      ({(8'ha6)} > {reg9}) : ($signed(reg9) ?
                          $signed(reg8) : $signed((8'h9d)))) : (8'ha7)));
              reg15 <= $unsigned({reg9[(5'h11):(3'h7)],
                  $unsigned(reg10[(2'h2):(1'h0)])});
              reg16 <= $unsigned(reg13[(5'h12):(1'h0)]);
              reg17 <= (&{((wire0[(1'h0):(1'h0)] ?
                      $signed(reg9) : $unsigned((8'ha1))) - reg13),
                  (reg7 ?
                      ((reg10 ^ reg15) ?
                          ((8'hbc) ?
                              wire6 : reg11) : $unsigned(reg14)) : $unsigned({wire1}))});
            end
          else
            begin
              reg13 <= ({(($unsigned(reg8) ?
                      $signed(reg8) : (reg12 ?
                          reg7 : reg15)) != $unsigned(((8'hae) ?
                      reg13 : wire0))),
                  (-(wire1 ~^ $unsigned(reg11)))} * ((8'hbd) && (~&(reg11[(2'h3):(1'h0)] ~^ (reg9 == (8'hbd))))));
              reg14 <= (!$unsigned($signed(wire3[(5'h10):(4'ha)])));
            end
        end
      else
        begin
          if (wire1)
            begin
              reg12 <= (|$signed($signed(((&wire2) ?
                  $unsigned(wire0) : (~|wire6)))));
              reg13 <= $signed(wire1[(3'h7):(1'h1)]);
              reg14 <= (^~($signed((8'haa)) >= wire0[(4'h8):(3'h5)]));
              reg15 <= wire4[(1'h1):(1'h1)];
            end
          else
            begin
              reg12 <= $signed(reg16[(1'h1):(1'h0)]);
              reg13 <= reg16;
              reg14 <= reg10[(4'h8):(1'h0)];
            end
        end
      reg18 <= $signed($signed({(&(reg8 ? wire0 : wire6)),
          (&(wire4 + wire1))}));
      reg19 <= (~&($unsigned({(wire2 ? reg12 : reg12), $unsigned(wire4)}) ?
          wire0[(4'h9):(1'h0)] : $unsigned({(8'had)})));
    end
  assign wire20 = $signed(((+(8'ha6)) ?
                      ({{reg16, wire1}, reg12[(2'h3):(2'h2)]} ^ {(wire0 ?
                              reg9 : reg17)}) : (reg19[(4'ha):(4'h8)] ^ reg16)));
  assign wire21 = reg18;
endmodule
