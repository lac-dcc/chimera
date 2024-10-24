module top
#(parameter param27 = (((((!(8'hb1)) - ((8'haa) && (8'hb7))) ? (^{(8'ha2), (8'haa)}) : ((^~(8'hb8)) ? (~&(8'h9e)) : {(8'hba), (8'h9d)})) ? ({{(8'hba), (7'h43)}, ((8'ha8) != (8'had))} * (+(7'h42))) : {(~^(!(8'ha3)))}) ~^ {(((~&(8'hbe)) == ((8'ha8) ^~ (8'ha0))) ? (((8'hbc) ? (8'ha5) : (7'h41)) - ((8'h9e) >>> (8'ha2))) : (8'hb0))}), 
parameter param28 = (param27 <= param27))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h12a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire26;
  wire signed [(2'h3):(1'h0)] wire25;
  wire signed [(5'h11):(1'h0)] wire19;
  wire [(2'h3):(1'h0)] wire18;
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(2'h2):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg4 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire19,
                 wire18,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
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
      reg4 <= (wire0 >>> (+wire3));
      reg5 <= ($signed((+(|wire0[(3'h5):(1'h1)]))) && $unsigned(wire3));
      reg6 <= ((-wire2[(5'h10):(5'h10)]) ?
          $unsigned(reg5[(4'hd):(4'hc)]) : wire0[(1'h0):(1'h0)]);
      reg7 <= reg4[(1'h0):(1'h0)];
      if ((~|wire3[(5'h12):(2'h3)]))
        begin
          reg8 <= (-reg6);
          reg9 <= reg8;
        end
      else
        begin
          if ({(&$signed(wire0)),
              (reg8 ?
                  ((8'hba) ?
                      ($unsigned((8'hb0)) ?
                          wire3 : $unsigned(reg9)) : (~(reg6 ^~ (8'hb0)))) : $unsigned(((^reg9) > (reg4 < reg5))))})
            begin
              reg8 <= wire1[(2'h2):(2'h2)];
            end
          else
            begin
              reg8 <= reg5;
              reg9 <= $signed($signed($signed($unsigned((8'ha0)))));
              reg10 <= $signed(wire3[(5'h11):(4'h9)]);
              reg11 <= (reg7[(4'h8):(3'h6)] < $unsigned($unsigned({{(8'h9e)},
                  (-wire2)})));
              reg12 <= $signed(($unsigned(($unsigned(reg9) ?
                  (wire1 ?
                      reg5 : reg11) : $unsigned((8'hbd)))) << $signed((^(~^reg11)))));
            end
          reg13 <= (^~(|{{reg6[(3'h4):(2'h2)]},
              ((reg10 ? reg6 : (8'hb8)) ? reg11 : (reg7 ? reg5 : reg6))}));
          reg14 <= reg8;
          reg15 <= ((reg5[(5'h10):(3'h4)] ?
                  $unsigned((8'ha5)) : (^$unsigned(((8'ha2) << reg5)))) ?
              reg10 : reg6);
          if (reg14)
            begin
              reg16 <= (!(((^(wire3 ? reg8 : reg14)) ?
                      wire3[(5'h11):(4'h9)] : {$signed(reg5),
                          $signed((8'ha8))}) ?
                  (-reg10) : (reg11 ? wire2 : $signed((|wire1)))));
            end
          else
            begin
              reg16 <= (reg4[(2'h2):(2'h2)] ?
                  (($signed((reg11 ? reg5 : reg5)) ?
                      $unsigned(reg5) : (wire0 <<< reg5)) > (~|((!reg11) + (&reg14)))) : ((((reg15 - reg4) != (~&reg16)) + ((~&(8'ha4)) << (reg7 ?
                      reg5 : wire3))) >> (^~((|reg5) ?
                      $unsigned(wire1) : (wire2 ? wire2 : wire1)))));
              reg17 <= (reg8[(2'h2):(2'h2)] >= $unsigned($signed(((reg10 ?
                  reg4 : reg9) >> (wire0 ? reg6 : reg11)))));
            end
        end
    end
  assign wire18 = {wire1[(2'h3):(1'h1)], (^$unsigned((^wire1)))};
  assign wire19 = ($unsigned(reg14[(3'h4):(2'h2)]) ?
                      reg11[(3'h5):(2'h2)] : $unsigned(((reg15[(3'h4):(1'h0)] ?
                          reg17[(2'h3):(1'h0)] : (&reg14)) ^~ {(reg11 ?
                              wire2 : reg11)})));
  always
    @(posedge clk) begin
      if ($unsigned((reg16[(3'h4):(2'h3)] ?
          $signed($signed(wire18[(1'h0):(1'h0)])) : $signed((|(reg8 << wire0))))))
        begin
          if ({(($signed((reg6 < reg17)) | (+(reg12 ^ wire19))) ?
                  ($unsigned($unsigned(wire2)) ?
                      ((^~wire2) ?
                          $unsigned(wire1) : $signed(reg12)) : ((wire2 ?
                          reg15 : reg13) >>> (wire18 ?
                          (8'hb3) : reg9))) : (^~($signed(reg10) ?
                      $signed(wire3) : {reg15, reg11})))})
            begin
              reg20 <= {$unsigned((8'ha5)), (&wire1)};
            end
          else
            begin
              reg20 <= (8'hb6);
              reg21 <= (^$unsigned(reg20[(5'h10):(4'h9)]));
            end
          reg22 <= ($unsigned((wire0[(2'h2):(1'h1)] - (~^reg20[(1'h1):(1'h1)]))) ?
              ($signed((~&(wire3 ?
                  wire3 : reg16))) >> reg14) : $unsigned(reg17[(2'h3):(2'h2)]));
          reg23 <= ((($unsigned($signed(reg21)) ?
                      (~|reg6) : {(~reg20), reg14}) ?
                  wire1 : reg6[(1'h0):(1'h0)]) ?
              {$signed($unsigned((reg8 ?
                      reg5 : reg14)))} : (&(reg8[(2'h2):(2'h2)] ?
                  $signed((reg9 >= reg13)) : reg21[(4'hc):(4'ha)])));
          reg24 <= {(~|wire3)};
        end
      else
        begin
          if ({(&$signed((~((8'ha1) ? reg9 : wire2)))),
              ($unsigned($unsigned((wire1 && reg4))) ?
                  ((reg22 << reg23[(4'h8):(3'h6)]) >> ($unsigned(reg22) >> ((8'h9e) * reg13))) : reg22[(3'h5):(1'h0)])})
            begin
              reg20 <= ({(|(!(~^wire2)))} ?
                  ((&reg24[(3'h6):(3'h5)]) ?
                      (reg22[(1'h1):(1'h1)] ?
                          reg24[(1'h0):(1'h0)] : reg4[(4'h8):(3'h7)]) : ($unsigned((~&reg23)) ?
                          reg9 : ($signed(reg15) ?
                              (reg13 ~^ reg13) : (8'ha6)))) : (($unsigned($signed((8'hb4))) ^ reg7[(3'h5):(1'h0)]) || $signed($unsigned((&wire3)))));
              reg21 <= $signed(((((^~reg6) ^ $signed(wire19)) ?
                      (reg9[(1'h1):(1'h1)] ?
                          reg9 : (^wire19)) : $unsigned((reg17 != reg8))) ?
                  wire2[(4'he):(2'h3)] : wire3[(4'hc):(3'h5)]));
              reg22 <= {$unsigned((reg14 ?
                      (wire19[(4'hc):(4'h9)] ?
                          $signed(wire2) : (reg22 ?
                              reg7 : wire18)) : ($unsigned((7'h41)) ^~ $unsigned(reg12)))),
                  ((^~($signed(wire18) <= reg10[(2'h2):(1'h1)])) >>> reg17)};
              reg23 <= reg6;
            end
          else
            begin
              reg20 <= wire2;
              reg21 <= $signed(($unsigned(((-reg14) <= reg6)) && $signed($unsigned((reg9 * reg5)))));
              reg22 <= reg16[(3'h6):(2'h3)];
              reg23 <= ($signed(reg5) ~^ (reg8[(2'h3):(2'h3)] || reg15));
              reg24 <= wire0;
            end
        end
    end
  assign wire25 = $signed($unsigned(reg23[(4'hc):(4'ha)]));
  assign wire26 = reg14[(1'h1):(1'h1)];
endmodule
