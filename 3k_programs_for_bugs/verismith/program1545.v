module top
#(parameter param39 = (+(((((8'hae) ? (8'hae) : (8'hba)) ? ((8'ha6) ? (7'h41) : (8'had)) : ((8'had) <= (8'ha5))) ? ({(8'hbd), (7'h43)} + (&(8'h9c))) : (^(-(8'hbe)))) ? (({(8'hb7)} ~^ (^(8'hb1))) ? {{(8'hab), (7'h40)}, (-(8'ha0))} : {((8'hbf) >= (8'hab))}) : ((|((8'hbb) << (8'ha4))) ? (-((8'hac) == (7'h40))) : ((~^(7'h43)) - (|(8'ha6)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h177):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire38;
  wire signed [(5'h11):(1'h0)] wire37;
  wire [(3'h7):(1'h0)] wire34;
  reg signed [(5'h11):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(2'h3):(1'h0)] reg32 = (1'h0);
  reg [(2'h3):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(3'h5):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(3'h4):(1'h0)] reg7 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg5 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire34,
                 reg36,
                 reg35,
                 reg33,
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
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire3 + ($unsigned(wire1) ? wire4 : $signed(wire3[(4'ha):(3'h5)]))))
        begin
          if ({wire1[(1'h0):(1'h0)], wire2})
            begin
              reg5 <= (~^$signed($signed(((7'h40) != (|wire4)))));
              reg6 <= ($unsigned(($unsigned((~wire2)) >> (wire2 ?
                  {wire2} : wire4[(2'h3):(1'h1)]))) ~^ (!wire4));
            end
          else
            begin
              reg5 <= reg5;
              reg6 <= (+(-$unsigned($signed(wire4))));
              reg7 <= $signed({wire2});
              reg8 <= (+(8'had));
              reg9 <= ((^(wire2 & reg6[(1'h0):(1'h0)])) ?
                  (!$signed($unsigned(wire4))) : wire1);
            end
          reg10 <= $signed($unsigned({(wire4 >> (~reg9))}));
        end
      else
        begin
          if (reg8)
            begin
              reg5 <= reg10;
              reg6 <= ($signed(((7'h42) ?
                      $signed($signed(reg10)) : {((8'hb5) | wire1),
                          (reg9 ? wire4 : wire2)})) ?
                  ((^(~&reg10)) ?
                      ({$unsigned(reg9)} << reg5[(4'hb):(3'h5)]) : wire0[(3'h7):(2'h2)]) : wire2[(1'h0):(1'h0)]);
              reg7 <= reg9[(1'h0):(1'h0)];
              reg8 <= (wire1 ?
                  (!wire4[(3'h6):(3'h5)]) : $unsigned($unsigned($unsigned(reg8))));
              reg9 <= wire3;
            end
          else
            begin
              reg5 <= {reg10[(3'h4):(3'h4)], $unsigned(wire1[(1'h0):(1'h0)])};
            end
          reg10 <= (wire0[(3'h5):(2'h2)] ?
              ($unsigned(wire2) ?
                  {(8'ha5), reg10} : ($unsigned((reg5 ~^ wire2)) ?
                      (8'ha1) : (reg5 ?
                          (~^wire2) : (wire4 < wire2)))) : $signed((&($unsigned(reg8) ?
                  $signed(wire3) : $unsigned(reg6)))));
          reg11 <= (!(~&reg6));
          if (reg5[(3'h5):(3'h4)])
            begin
              reg12 <= $unsigned((~(wire0[(2'h3):(1'h1)] | reg8)));
            end
          else
            begin
              reg12 <= $signed($unsigned(($unsigned(((8'haa) ?
                  (8'ha0) : reg6)) >= $unsigned($signed((8'ha4))))));
              reg13 <= $unsigned((reg7 << (($unsigned(reg10) != (~(8'ha2))) ?
                  $unsigned($signed(reg5)) : wire1)));
              reg14 <= ($signed((|$signed((8'ha8)))) != $unsigned(($unsigned(wire4) ?
                  (!wire0) : (-(wire0 ? reg7 : reg7)))));
              reg15 <= {($unsigned($unsigned($unsigned(reg7))) ?
                      $unsigned({((8'ha4) ~^ wire1),
                          $unsigned(wire0)}) : (~|{$signed(reg14),
                          $signed(reg13)})),
                  reg7};
            end
        end
      if ($unsigned((+wire1)))
        begin
          if ((8'haa))
            begin
              reg16 <= reg15[(4'h8):(3'h7)];
            end
          else
            begin
              reg16 <= wire3;
              reg17 <= (|(^~((^{wire2, reg9}) * reg10[(3'h4):(1'h0)])));
              reg18 <= (~reg15[(4'hb):(1'h0)]);
              reg19 <= ({reg5[(5'h11):(5'h11)]} ?
                  ($signed((wire4 || reg18)) || (~^(|(reg5 | reg9)))) : (((reg17[(4'ha):(2'h3)] ^~ (~|wire3)) ^ reg14[(1'h1):(1'h1)]) ?
                      $unsigned($signed((-reg7))) : $unsigned(($unsigned(reg5) < $signed(reg16)))));
              reg20 <= $signed(reg16);
            end
          reg21 <= (~{(^~((reg13 ? reg13 : reg15) ? reg20 : wire1))});
          if ($unsigned($signed($unsigned(($unsigned(reg18) ?
              wire2[(3'h5):(2'h3)] : (~&reg11))))))
            begin
              reg22 <= (7'h42);
              reg23 <= $signed({$signed((wire1 ?
                      (reg15 ? reg10 : reg8) : (&reg15))),
                  (($unsigned((8'ha2)) ?
                      reg11[(1'h0):(1'h0)] : $signed(reg11)) * reg21)});
              reg24 <= $signed((reg14 ?
                  $unsigned(((reg15 > reg16) ?
                      wire2 : (reg22 | (8'ha4)))) : $unsigned((8'ha6))));
            end
          else
            begin
              reg22 <= $unsigned((~^(+$signed(wire2))));
              reg23 <= {{reg14, (8'ha4)}, reg5};
              reg24 <= $signed(reg21);
            end
          reg25 <= {($signed($unsigned(reg19[(2'h3):(2'h3)])) ?
                  $unsigned(({(8'hab)} ^~ ((7'h41) >>> reg24))) : reg11)};
          if ($unsigned((($unsigned((reg6 * reg23)) ?
                  wire1[(1'h1):(1'h0)] : ($unsigned(wire4) ?
                      ((7'h40) ? reg23 : reg12) : wire3)) ?
              (((reg25 >>> (8'hb6)) >>> (reg8 ~^ wire4)) << ((wire3 ?
                  reg21 : reg12) < reg15)) : (+reg6[(2'h3):(2'h3)]))))
            begin
              reg26 <= $signed($signed((&wire4[(4'h9):(1'h0)])));
              reg27 <= $unsigned((7'h42));
            end
          else
            begin
              reg26 <= reg25;
              reg27 <= $unsigned(reg27);
              reg28 <= (reg5[(5'h13):(4'he)] && reg23[(1'h0):(1'h0)]);
              reg29 <= {((&wire4[(4'h8):(3'h4)]) ?
                      (((!(8'hbe)) ~^ reg11) ?
                          ($signed(reg28) > $signed(reg6)) : {(+reg8)}) : wire1),
                  reg20};
              reg30 <= (reg19 || (reg16[(4'hc):(3'h6)] ^ $unsigned(reg24[(1'h1):(1'h0)])));
            end
        end
      else
        begin
          reg16 <= reg12;
          if (($unsigned((!({reg13, (8'ha6)} ^ $signed(reg13)))) ?
              $unsigned((((+reg9) > $signed((8'h9e))) || $signed(reg24))) : $signed(reg23[(3'h5):(1'h1)])))
            begin
              reg17 <= ((reg10[(2'h2):(1'h1)] | $signed((^~$unsigned(reg18)))) ?
                  reg21[(3'h4):(1'h0)] : $signed(((reg22 | $unsigned(reg15)) ?
                      wire4[(1'h1):(1'h0)] : $signed(reg26[(3'h6):(3'h5)]))));
            end
          else
            begin
              reg17 <= ($unsigned($signed(reg12)) ?
                  $unsigned(reg15) : $unsigned(((+reg22[(4'h8):(3'h4)]) ?
                      $signed($unsigned(reg18)) : $unsigned(reg17[(4'hb):(3'h6)]))));
              reg18 <= $signed($unsigned($signed((reg8 ^ $signed((8'hba))))));
              reg19 <= (reg29 ?
                  (~&((~$signed((7'h44))) ?
                      reg13[(3'h6):(1'h0)] : (-(reg17 < (8'ha2))))) : $unsigned($signed((^reg15[(4'h9):(2'h3)]))));
              reg20 <= ((~^((&(|reg5)) ~^ $unsigned(reg23[(3'h7):(2'h3)]))) ?
                  reg19 : (($signed(reg25[(1'h1):(1'h0)]) ?
                          $unsigned((reg22 ? reg11 : reg25)) : (8'ha8)) ?
                      ((8'hb9) ?
                          $unsigned(reg29[(1'h1):(1'h0)]) : {reg23}) : reg19));
            end
          reg21 <= ($signed((+reg18[(4'h9):(1'h0)])) << $unsigned($unsigned(reg10[(2'h2):(2'h2)])));
        end
      reg31 <= ($unsigned($unsigned($signed((reg19 - reg17)))) & {$signed($unsigned((|reg7)))});
      reg32 <= wire4;
      reg33 <= {{$unsigned((reg7[(1'h1):(1'h0)] ? reg12 : (^reg15))),
              (+(wire3 ? {reg28, reg15} : (reg21 + reg20)))}};
    end
  assign wire34 = reg32;
  always
    @(posedge clk) begin
      reg35 <= $signed($signed((^~reg33[(4'hd):(4'h9)])));
      reg36 <= $signed((reg16 ? $unsigned(reg10) : reg35[(1'h1):(1'h1)]));
    end
  assign wire37 = reg29[(1'h0):(1'h0)];
  assign wire38 = $unsigned((-(~^(^~$unsigned(reg36)))));
endmodule
