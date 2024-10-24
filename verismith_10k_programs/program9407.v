module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h179):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire33;
  wire signed [(4'hb):(1'h0)] wire32;
  wire signed [(5'h14):(1'h0)] wire31;
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  reg [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg6 = (1'h0);
  reg [(5'h10):(1'h0)] reg5 = (1'h0);
  reg [(5'h10):(1'h0)] reg4 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
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
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((~$unsigned($unsigned(wire1))))
        begin
          if ((wire1 ?
              $unsigned((($signed(wire1) >= wire1[(2'h2):(1'h0)]) ?
                  (+$signed(wire0)) : wire1[(2'h3):(1'h1)])) : (wire3 > (((wire0 ^~ wire0) ?
                      wire2[(2'h2):(1'h1)] : wire2) ?
                  (~wire2[(2'h2):(1'h1)]) : wire3[(4'hf):(4'h8)]))))
            begin
              reg4 <= wire0;
            end
          else
            begin
              reg4 <= (&(&(7'h41)));
              reg5 <= $signed({{($unsigned((8'haf)) >> wire0[(1'h0):(1'h0)])},
                  wire1[(1'h1):(1'h0)]});
            end
          if (((~&$unsigned(wire3)) ? reg5 : wire0[(2'h2):(1'h0)]))
            begin
              reg6 <= (($signed(reg5) >= (^((wire2 >>> wire3) < reg4[(4'ha):(3'h5)]))) & (reg4[(3'h6):(3'h4)] ?
                  wire3 : (~|wire2)));
              reg7 <= ((8'hb5) - wire0);
              reg8 <= $unsigned($signed(wire0));
              reg9 <= reg5[(5'h10):(3'h4)];
            end
          else
            begin
              reg6 <= (&reg6);
              reg7 <= $signed((reg5[(3'h5):(3'h4)] ?
                  reg4[(3'h4):(2'h2)] : ((-(!(8'ha6))) >= wire0[(3'h7):(2'h3)])));
            end
          reg10 <= wire1[(2'h3):(2'h2)];
          reg11 <= reg4[(4'hb):(2'h3)];
        end
      else
        begin
          reg4 <= wire3[(3'h7):(3'h4)];
          reg5 <= reg8[(2'h2):(1'h1)];
          if (reg11)
            begin
              reg6 <= (!((wire0[(2'h3):(2'h3)] + $unsigned($signed(wire0))) ?
                  $unsigned(($unsigned(reg10) ?
                      $unsigned((8'ha9)) : (!wire0))) : $unsigned($signed((wire1 ?
                      reg11 : wire2)))));
              reg7 <= reg8[(2'h3):(2'h2)];
              reg8 <= wire3[(3'h6):(3'h6)];
              reg9 <= (reg7 - reg10[(4'hd):(3'h6)]);
            end
          else
            begin
              reg6 <= $unsigned((($signed((reg5 - (8'haa))) <= ((~^reg6) ?
                      (reg4 == wire0) : (!reg4))) ?
                  $unsigned((^(|wire3))) : ({(reg8 ? reg9 : reg8)} ?
                      $signed($signed(reg6)) : $unsigned(wire1))));
              reg7 <= reg7[(4'hd):(4'hd)];
              reg8 <= ($signed((~^(8'h9e))) ?
                  reg8[(3'h7):(2'h2)] : $unsigned($unsigned($unsigned($unsigned(wire1)))));
            end
        end
      reg12 <= ({reg4, $signed((|wire2))} ?
          $signed(reg4) : (reg4[(3'h5):(3'h4)] ?
              $signed({(wire0 ? reg7 : wire3), reg9}) : reg10[(3'h5):(3'h5)]));
      reg13 <= $unsigned($signed($unsigned({(reg7 * wire3)})));
      reg14 <= $signed($signed(wire3[(2'h3):(1'h0)]));
    end
  always
    @(posedge clk) begin
      if ((+((~reg12[(4'hc):(2'h2)]) >> (reg9[(4'hc):(2'h3)] - reg9))))
        begin
          reg15 <= reg6;
          reg16 <= reg13[(2'h2):(1'h0)];
          reg17 <= $signed({reg15[(1'h1):(1'h0)],
              $signed($signed(reg4[(4'he):(1'h0)]))});
          reg18 <= wire3;
          reg19 <= $unsigned($signed({($signed(reg15) & (&reg16))}));
        end
      else
        begin
          reg15 <= $signed((+reg7[(1'h0):(1'h0)]));
          reg16 <= ($signed((+(reg19 >>> (reg11 ?
              reg4 : reg17)))) >= reg8[(3'h5):(3'h4)]);
          if (reg8[(3'h7):(3'h6)])
            begin
              reg17 <= (($unsigned($signed(reg9[(5'h11):(3'h6)])) ?
                      ((+$unsigned(reg8)) != reg12) : ($signed((wire2 ?
                          wire2 : reg4)) ~^ (-reg13[(3'h5):(2'h2)]))) ?
                  ({reg14, {(^reg8)}} ?
                      (7'h42) : $signed(($signed(reg15) ?
                          ((7'h40) & reg10) : (^~reg9)))) : (($signed(reg18) >>> reg12) & $signed($unsigned((reg14 ?
                      wire0 : reg7)))));
            end
          else
            begin
              reg17 <= $signed((($signed($unsigned(reg13)) ?
                  $unsigned((reg16 >> reg9)) : (8'ha4)) >>> reg8));
              reg18 <= ((~wire1) ?
                  ($signed(($unsigned(reg12) ?
                      $signed(reg6) : (reg4 ?
                          wire3 : reg17))) ^ (reg14 >> $unsigned(reg12[(3'h5):(2'h2)]))) : ({(((8'hbd) ?
                          (8'hb6) : (7'h44)) != $unsigned(reg8)),
                      reg7} || $signed($signed($unsigned(wire3)))));
              reg19 <= (reg17[(1'h1):(1'h1)] ?
                  ($unsigned(reg7[(2'h3):(2'h3)]) ?
                      (~^reg8) : ($unsigned((~reg9)) ?
                          ((~wire3) <= (~reg17)) : $signed((^reg19)))) : $signed((8'ha9)));
              reg20 <= (7'h44);
            end
          if (reg7[(2'h3):(2'h2)])
            begin
              reg21 <= reg12;
            end
          else
            begin
              reg21 <= $signed($unsigned((^~wire1[(2'h2):(2'h2)])));
              reg22 <= {reg15[(1'h0):(1'h0)]};
              reg23 <= ($unsigned(($signed((~^(8'had))) ?
                  ((reg17 ? wire3 : reg12) && reg11[(4'hc):(4'ha)]) : (reg11 ?
                      $unsigned((8'hbb)) : (8'hb3)))) * {$signed((reg19 ^ {reg8}))});
            end
        end
      reg24 <= ($signed(reg21[(4'h9):(2'h2)]) ?
          reg17 : ((reg22[(2'h3):(1'h1)] ?
                  (8'had) : ({wire1} ~^ ((8'ha2) ? reg12 : (8'haf)))) ?
              wire1[(2'h2):(2'h2)] : {$unsigned(reg5[(1'h1):(1'h1)]),
                  (^~wire2)}));
      if ((&((reg8[(3'h5):(1'h0)] >> (!((8'haf) ? (8'ha9) : wire2))) ?
          $signed(((reg12 ?
              wire2 : reg12) || $signed(reg9))) : ((^(^wire0)) >= $signed(reg19)))))
        begin
          reg25 <= (($signed(reg21) && $signed($signed(reg5[(4'h9):(3'h7)]))) ^~ (&reg13[(1'h1):(1'h1)]));
        end
      else
        begin
          if ({$unsigned(reg18), $signed(((~^$signed(reg23)) >> reg24))})
            begin
              reg25 <= $signed(wire0[(1'h1):(1'h0)]);
              reg26 <= $signed((^wire1[(2'h3):(2'h2)]));
              reg27 <= ($signed($signed($signed((reg6 ?
                  reg16 : reg9)))) | $signed($signed($unsigned(reg19[(4'ha):(4'h8)]))));
            end
          else
            begin
              reg25 <= (~&reg27[(4'he):(3'h5)]);
              reg26 <= $unsigned((+(~|reg8)));
              reg27 <= reg6[(4'h8):(2'h2)];
              reg28 <= ($signed($signed(($unsigned(reg10) ^~ reg21[(1'h1):(1'h1)]))) ?
                  ($signed((8'hab)) <= (8'ha0)) : $unsigned(reg11[(4'hf):(3'h7)]));
            end
          reg29 <= reg7[(4'hb):(4'h8)];
          reg30 <= $signed(((reg11 ^~ (reg4 | reg8[(3'h4):(3'h4)])) ?
              (!((&reg21) ?
                  reg10[(2'h3):(2'h2)] : (reg11 <<< reg23))) : ((reg10 & {(8'hb9)}) + {reg24[(1'h0):(1'h0)],
                  $signed(reg14)})));
        end
    end
  assign wire31 = (reg25[(3'h4):(2'h3)] - $unsigned(($unsigned((reg12 ~^ reg6)) ?
                      reg19 : (!$unsigned(wire3)))));
  assign wire32 = {($unsigned($signed($signed(reg7))) ?
                          wire31[(4'hb):(1'h0)] : $signed((8'hb1)))};
  assign wire33 = $unsigned((reg16[(4'h8):(2'h3)] ?
                      $signed(((8'ha7) ?
                          reg17[(3'h5):(3'h5)] : (8'hbb))) : reg24[(5'h12):(5'h12)]));
endmodule
