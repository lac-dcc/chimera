module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h195):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire38;
  wire [(3'h6):(1'h0)] wire37;
  wire [(5'h10):(1'h0)] wire36;
  wire [(3'h5):(1'h0)] wire35;
  wire [(4'h8):(1'h0)] wire34;
  wire [(5'h15):(1'h0)] wire33;
  wire [(3'h5):(1'h0)] wire5;
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(4'h8):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  reg [(3'h4):(1'h0)] reg6 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire5,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
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
  assign wire5 = wire1[(4'hb):(4'ha)];
  always
    @(posedge clk) begin
      reg6 <= ({($unsigned((&wire3)) & wire3[(3'h7):(3'h5)]),
              ({$unsigned(wire3), $unsigned((8'hbd))} >= wire5)} ?
          ($unsigned(wire5) ?
              wire0 : (wire1 >>> ($unsigned(wire2) ?
                  $unsigned(wire4) : (^wire0)))) : wire2[(5'h10):(3'h4)]);
      if (wire5)
        begin
          if (wire0[(3'h5):(3'h4)])
            begin
              reg7 <= wire0;
              reg8 <= wire0;
              reg9 <= reg7[(4'hb):(3'h7)];
              reg10 <= reg8[(1'h0):(1'h0)];
              reg11 <= wire4[(1'h0):(1'h0)];
            end
          else
            begin
              reg7 <= ($signed((reg10[(3'h6):(1'h1)] ?
                      reg9[(1'h1):(1'h1)] : (|(wire2 == wire3)))) ?
                  (reg11 << reg8[(2'h2):(1'h0)]) : ((~&(wire2[(1'h1):(1'h0)] ?
                      ((8'hbb) ? (8'hac) : reg9) : ((8'h9f) ?
                          wire3 : reg7))) ~^ $signed(wire2)));
              reg8 <= reg7;
            end
          reg12 <= ((wire0[(2'h3):(1'h1)] ?
              $signed(wire0[(3'h4):(1'h0)]) : reg8[(2'h2):(1'h1)]) <<< (($unsigned((reg11 >= (8'ha0))) - wire0) + ($unsigned((reg7 ?
              reg6 : wire5)) >= ($unsigned(reg10) ?
              $unsigned(reg9) : (wire5 ^ wire0)))));
          if ($unsigned(((reg11 ^~ $signed((reg9 != wire4))) ?
              {$signed((^reg10)), (7'h41)} : (&((wire5 ^ reg10) ?
                  wire4[(2'h3):(2'h3)] : $unsigned(reg12))))))
            begin
              reg13 <= (((!(((8'hb5) ^~ wire2) || (wire2 ? reg11 : (8'ha5)))) ?
                  (wire0 ?
                      $signed((wire3 > wire1)) : {$unsigned(wire4)}) : reg11) >> (($unsigned((|wire3)) ?
                  wire0[(4'hb):(4'h8)] : reg10[(4'hb):(4'hb)]) + $unsigned((|(reg9 && (8'ha6))))));
              reg14 <= reg8[(1'h0):(1'h0)];
              reg15 <= {$unsigned($unsigned(reg8[(2'h2):(1'h0)]))};
              reg16 <= {{($unsigned(reg12[(1'h0):(1'h0)]) && reg8[(1'h1):(1'h0)])},
                  (+reg6)};
            end
          else
            begin
              reg13 <= ((~((wire4[(4'h8):(1'h0)] ?
                      wire4 : reg6[(2'h2):(2'h2)]) || ((|wire5) | (8'ha8)))) ?
                  wire3[(4'ha):(2'h3)] : (reg9[(1'h0):(1'h0)] ?
                      $unsigned(reg10) : $unsigned((reg8[(1'h1):(1'h0)] >= $signed(reg7)))));
            end
        end
      else
        begin
          reg7 <= $unsigned(reg6[(2'h2):(2'h2)]);
        end
      reg17 <= reg14[(4'h8):(2'h2)];
      reg18 <= ((reg7[(2'h2):(2'h2)] && ({$signed(wire0)} ?
          (reg14[(3'h5):(2'h3)] > reg10[(4'h9):(3'h7)]) : wire5[(2'h3):(1'h0)])) > $unsigned(reg9));
    end
  always
    @(posedge clk) begin
      reg19 <= (^~((&$unsigned((reg6 ?
          wire3 : wire3))) && ((reg14[(4'h9):(1'h0)] >> (~^(7'h40))) ?
          ((reg11 != reg11) ? reg10 : (reg18 ? reg17 : (7'h41))) : ((~reg17) ?
              wire2 : (wire0 ? reg8 : reg10)))));
      reg20 <= (((&{{reg14, reg9}}) ?
          ((8'hbc) <= ({reg16, wire4} ?
              wire4[(1'h1):(1'h0)] : (wire3 ? reg19 : reg15))) : $signed({reg11,
              (reg7 ? reg7 : (8'hb1))})) ^ $unsigned($unsigned({(reg15 ?
              (8'h9c) : wire0),
          reg14[(3'h6):(2'h2)]})));
      reg21 <= $unsigned(($signed(((wire1 == wire4) >>> {wire2})) ?
          {reg19[(4'ha):(2'h3)], reg9[(2'h2):(1'h1)]} : ((^~(reg13 ?
                  reg16 : reg17)) ?
              reg15 : $signed(((8'hbb) != reg16)))));
      if (wire2[(2'h2):(1'h1)])
        begin
          reg22 <= $signed((wire3 <<< $unsigned(((~^(8'haa)) ?
              reg8 : (reg10 ? (8'hb8) : reg7)))));
          reg23 <= (8'haa);
          reg24 <= wire0;
          reg25 <= $signed($signed((~$signed($signed(reg16)))));
          reg26 <= ({((8'ha3) ?
                  $unsigned((reg6 == reg18)) : ($signed(reg15) ^ $signed((8'hbf))))} != (~|(^reg19)));
        end
      else
        begin
          if ($unsigned($unsigned($signed((^(7'h40))))))
            begin
              reg22 <= reg24;
              reg23 <= (wire0 < (~$signed({(reg20 ? wire1 : reg25),
                  $signed(reg13)})));
              reg24 <= ($unsigned(((((7'h44) < reg9) ?
                  $unsigned(reg12) : wire4) | ((reg15 ? reg24 : reg10) ?
                  {wire2} : (|reg16)))) == ((~(reg15[(5'h11):(4'h8)] | $unsigned(reg11))) ?
                  (^~{(reg10 ? reg16 : reg25),
                      {wire4, wire4}}) : $unsigned(reg11[(1'h1):(1'h0)])));
              reg25 <= $unsigned($unsigned($unsigned(reg17[(4'he):(3'h6)])));
            end
          else
            begin
              reg22 <= (8'hb0);
            end
          reg26 <= wire2;
          if ($signed(reg22))
            begin
              reg27 <= (8'hb2);
              reg28 <= ((reg17[(3'h5):(3'h5)] == {(reg15 != (wire0 ?
                          reg17 : (7'h42)))}) ?
                  ((&((+wire0) + $unsigned(reg18))) >>> reg7) : (reg20[(4'hb):(4'h8)] ?
                      ((((8'h9d) ^ wire5) <= (reg10 <= reg6)) || $unsigned($unsigned(reg12))) : reg8));
            end
          else
            begin
              reg27 <= reg18[(1'h0):(1'h0)];
              reg28 <= (wire3[(2'h2):(1'h1)] ?
                  $signed($unsigned($signed((reg23 <= reg21)))) : ($signed($unsigned(reg25[(3'h5):(1'h0)])) ?
                      (wire0[(4'ha):(1'h0)] ?
                          $unsigned((-reg11)) : ((reg14 ?
                              wire1 : (8'hab)) <<< (reg7 ?
                              reg23 : reg14))) : (reg9[(2'h2):(2'h2)] <<< ($signed(reg14) + wire1[(4'hc):(3'h7)]))));
              reg29 <= (((!(((8'hba) ? wire5 : reg25) ?
                          (reg8 >> reg23) : (reg11 | reg24))) ?
                      $unsigned(reg15) : (~&($unsigned(reg16) ?
                          (reg17 ? wire3 : wire2) : {reg9}))) ?
                  (reg8 - {$unsigned($signed(reg23))}) : (!((~&(reg19 ?
                      reg10 : wire1)) + (reg8 <= (reg10 < reg24)))));
              reg30 <= {((8'hb4) ?
                      (reg14[(4'h8):(4'h8)] ?
                          reg11[(3'h4):(3'h4)] : reg28[(3'h6):(2'h3)]) : reg20)};
            end
          reg31 <= $unsigned(reg7);
        end
      reg32 <= $unsigned(($unsigned($signed($signed(wire3))) >> $signed(reg19)));
    end
  assign wire33 = $signed($unsigned($signed({reg11})));
  assign wire34 = (-({reg7, (-(reg23 << (8'ha5)))} ?
                      {(|(8'ha6)), $signed(reg16)} : (($unsigned(reg11) ?
                              (-reg28) : (~^reg10)) ?
                          $unsigned((~^reg28)) : reg29)));
  assign wire35 = $signed(wire5);
  assign wire36 = reg27;
  assign wire37 = wire34;
  assign wire38 = (((~|($unsigned(reg12) <<< {(8'hbe)})) >>> $signed({(|reg23)})) <= reg17[(4'hd):(3'h5)]);
  assign wire39 = reg27[(1'h0):(1'h0)];
endmodule
