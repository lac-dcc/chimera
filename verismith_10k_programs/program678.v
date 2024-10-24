module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h147):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire35;
  wire signed [(4'h8):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire4;
  reg signed [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg [(2'h3):(1'h0)] reg32 = (1'h0);
  reg [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg6 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire5,
                 wire4,
                 reg34,
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
                 (1'h0)};
  assign wire4 = $signed($unsigned(wire1[(1'h1):(1'h0)]));
  assign wire5 = ((-$signed({{wire3, (8'ha2)}, $signed(wire3)})) ?
                     $unsigned(((~|(wire3 || wire4)) ?
                         $signed(wire3) : $unsigned((wire0 + (8'h9c))))) : (!$signed(wire1[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg6 <= (($signed(((~^wire3) * $signed(wire3))) >= ((wire4 ^~ (wire5 && wire0)) ?
          (^~wire1) : wire4)) > wire0[(4'hb):(4'h8)]);
      if (wire3[(4'h9):(1'h0)])
        begin
          reg7 <= ($signed(wire0) ?
              $unsigned((~|{((8'ha2) || wire1)})) : ((7'h42) ?
                  (8'haf) : (~^wire0[(4'hb):(3'h4)])));
          if (wire4)
            begin
              reg8 <= ((wire2[(3'h7):(3'h5)] || (wire2 ?
                      (wire2[(1'h0):(1'h0)] ? (-reg6) : wire0) : ({(8'ha3)} ?
                          $unsigned(wire1) : {wire4}))) ?
                  {{$signed({wire3}), $signed($signed(reg6))},
                      (wire1[(4'hd):(4'h8)] <<< wire0[(4'h8):(3'h7)])} : ($unsigned((^~(wire0 == wire4))) ?
                      $signed((reg6 ?
                          (|wire0) : $signed(wire5))) : ($unsigned((wire0 == wire1)) ?
                          (~|$signed(reg6)) : ((wire4 < reg7) ?
                              {wire4, wire3} : (wire2 ? (8'hbc) : reg6)))));
              reg9 <= ((((~(-(8'hb4))) ?
                  wire0[(1'h0):(1'h0)] : (wire4[(4'h9):(3'h7)] >= {wire2})) >= {(-(reg7 ?
                      wire0 : wire1)),
                  {(wire0 ?
                          wire1 : reg7)}}) <<< $unsigned($unsigned(wire4[(4'h8):(1'h0)])));
              reg10 <= reg9[(2'h2):(1'h0)];
            end
          else
            begin
              reg8 <= wire3;
              reg9 <= $unsigned(((($unsigned((8'haa)) ?
                          wire1 : wire5[(2'h2):(1'h0)]) ?
                      (wire1[(3'h5):(3'h5)] ?
                          (wire1 <<< reg10) : $unsigned((7'h40))) : $unsigned((|wire1))) ?
                  wire5[(1'h0):(1'h0)] : $unsigned($signed(reg7))));
            end
        end
      else
        begin
          reg7 <= $signed(((wire5[(3'h7):(3'h4)] ?
                  $unsigned((~&reg7)) : $signed((wire0 - wire4))) ?
              (~|(wire4 < (reg8 ? reg8 : (8'hac)))) : $signed((~&reg10))));
          reg8 <= $signed((~&wire1));
          reg9 <= wire3[(3'h7):(1'h0)];
          reg10 <= wire1;
        end
      reg11 <= $unsigned((7'h42));
    end
  always
    @(posedge clk) begin
      if (reg9[(2'h2):(1'h0)])
        begin
          reg12 <= {({$unsigned($signed(wire1)), $unsigned(wire3)} ?
                  (wire3 ? reg8 : reg7) : (8'hba)),
              ($signed($unsigned((|reg10))) ?
                  (({(8'ha5)} <= (reg10 ?
                      (8'hb9) : reg7)) >= wire0[(3'h5):(3'h4)]) : $signed($signed({reg10,
                      wire3})))};
        end
      else
        begin
          reg12 <= wire5[(2'h3):(2'h2)];
          if (reg9[(1'h1):(1'h0)])
            begin
              reg13 <= reg11;
              reg14 <= (wire3 != wire2);
            end
          else
            begin
              reg13 <= wire4;
              reg14 <= $signed($unsigned({reg11[(3'h7):(2'h2)],
                  ($unsigned(reg12) ? reg11 : reg7)}));
            end
          reg15 <= (+$unsigned((reg10[(3'h5):(3'h5)] == wire3)));
          reg16 <= reg8;
          reg17 <= {$signed((~|reg9[(1'h1):(1'h1)])),
              (~|((reg13[(4'h9):(3'h5)] ? reg6 : $signed(reg15)) || reg16))};
        end
      if ($unsigned($signed(($unsigned((8'hb3)) ?
          ((reg7 ? reg10 : reg8) ?
              (reg15 << reg10) : reg7[(4'hf):(4'h8)]) : $unsigned(((8'ha2) ?
              reg12 : wire0))))))
        begin
          reg18 <= {{reg16}};
          reg19 <= {$unsigned($unsigned(wire2)),
              ((+($signed(wire0) & {reg11, reg12})) ?
                  wire5[(4'h8):(3'h4)] : $unsigned(reg11))};
          reg20 <= wire1;
          if ((~&$unsigned(({$signed(reg13), $unsigned((8'ha0))} & reg9))))
            begin
              reg21 <= reg17;
              reg22 <= (({$unsigned($signed(reg7)), reg13[(3'h6):(3'h6)]} ?
                      ((^reg17) ?
                          ((^~wire0) ^ $signed(reg15)) : $unsigned($signed(reg10))) : {(reg18 || reg14[(3'h6):(3'h6)])}) ?
                  {(~{$unsigned((8'hb6)), $signed(reg17)}),
                      ((~&reg7) <<< reg10[(1'h1):(1'h1)])} : reg9);
              reg23 <= (($unsigned(($unsigned((8'ha6)) ?
                      ((8'hb2) ?
                          reg12 : reg22) : $unsigned(reg6))) + (((^~reg19) >> reg20[(1'h0):(1'h0)]) ?
                      (8'hb6) : $signed((reg11 == reg15)))) ?
                  ($unsigned(reg7) ?
                      (((wire0 - wire4) | (~&wire3)) ?
                          ((reg21 > reg18) <<< reg14[(3'h6):(3'h4)]) : ($signed(wire3) >= $signed((8'h9d)))) : $unsigned((^(wire5 >> reg21)))) : wire5[(2'h2):(2'h2)]);
              reg24 <= ($signed($unsigned($unsigned((reg19 ^ reg20)))) ?
                  ($signed((reg19[(1'h0):(1'h0)] <<< $signed(reg10))) <<< (8'hbd)) : $signed($signed((!(reg7 ?
                      reg20 : wire4)))));
              reg25 <= $signed(wire0[(4'ha):(4'h8)]);
            end
          else
            begin
              reg21 <= reg13[(2'h3):(2'h2)];
              reg22 <= $signed($signed(reg17));
              reg23 <= $unsigned((^~(8'hac)));
            end
        end
      else
        begin
          if ($signed($signed((|$unsigned((reg18 == reg21))))))
            begin
              reg18 <= $unsigned($signed(((+(reg18 | wire2)) ?
                  {{reg20, reg21}} : ({(8'ha8), reg24} ^~ (^reg16)))));
              reg19 <= (^~reg21);
              reg20 <= (reg13[(4'h8):(3'h4)] ? reg10 : wire5[(3'h5):(3'h4)]);
              reg21 <= {($signed((8'ha2)) ? reg20 : reg22[(4'ha):(2'h3)]),
                  (({(reg18 ? (8'had) : reg7)} ?
                      $signed($signed(reg6)) : $unsigned((wire4 <= reg20))) >> (8'hb1))};
            end
          else
            begin
              reg18 <= reg13;
              reg19 <= $signed($signed(reg13));
            end
          reg22 <= (+(~^((reg7 * ((8'hac) ? reg12 : (7'h40))) ?
              reg14[(3'h6):(3'h5)] : reg22[(4'h8):(2'h3)])));
          reg23 <= {$signed(($unsigned($signed(reg15)) ?
                  ((reg20 ? reg14 : reg21) ^ (~|wire4)) : {(8'hba),
                      (reg11 ? reg6 : reg22)}))};
        end
      if (reg14[(4'h9):(1'h1)])
        begin
          reg26 <= ((($unsigned({(8'h9e)}) ?
                  (~(reg23 << wire3)) : ({reg12} ?
                      ((8'hae) ?
                          reg9 : reg17) : ((8'hab) && (8'hb5)))) != (&((|reg14) ?
                  reg15 : reg13))) ?
              $unsigned(reg14[(3'h4):(2'h3)]) : ($unsigned({{reg22},
                  (reg21 ? (7'h40) : (8'hb0))}) || reg6));
          if (((^$signed(reg17)) ?
              ($signed(($signed(reg25) ? $signed(reg18) : $unsigned(wire4))) ?
                  ((reg13[(2'h3):(2'h2)] ? $unsigned(reg14) : (-(8'ha9))) ?
                      reg17[(1'h1):(1'h1)] : ($unsigned(wire5) ?
                          {reg23,
                              (8'hb2)} : wire1)) : (^$signed(wire5[(3'h7):(1'h1)]))) : $signed($signed(wire2))))
            begin
              reg27 <= $signed($unsigned($unsigned($signed(wire0[(4'hb):(3'h6)]))));
              reg28 <= ((~$signed(wire2)) != $unsigned($unsigned((~|(reg22 >= wire3)))));
            end
          else
            begin
              reg27 <= $unsigned((8'h9f));
              reg28 <= ($unsigned((reg14[(4'h8):(1'h0)] >>> $signed(wire3[(3'h6):(3'h6)]))) ?
                  (($signed(wire4) ?
                      reg12 : ($unsigned(reg24) ?
                          (!reg13) : $signed(wire4))) + (^$unsigned((~&(8'hab))))) : reg15);
              reg29 <= $unsigned(reg17[(4'ha):(4'ha)]);
            end
          reg30 <= reg7[(4'h9):(4'h8)];
          reg31 <= $unsigned(reg27[(1'h0):(1'h0)]);
          reg32 <= wire3;
        end
      else
        begin
          if (wire4)
            begin
              reg26 <= $unsigned(reg30[(4'ha):(3'h7)]);
              reg27 <= (((|(reg12[(3'h5):(3'h5)] ?
                      (~reg24) : (reg13 ? (8'hbc) : reg31))) ?
                  reg10 : (((8'hbd) | reg24) >> ({wire2} ?
                      $signed(reg24) : (reg18 ?
                          reg15 : reg9)))) << (wire1 ^~ $signed((8'hbb))));
              reg28 <= $signed($signed(({$unsigned((8'hb6)),
                  reg32[(1'h0):(1'h0)]} != ($unsigned((8'hbc)) == reg7[(4'he):(3'h5)]))));
              reg29 <= $unsigned(reg21);
            end
          else
            begin
              reg26 <= (-wire2[(4'hb):(2'h2)]);
              reg27 <= {($unsigned((~|$signed(reg20))) + reg24),
                  reg18[(4'h8):(1'h1)]};
              reg28 <= reg23;
              reg29 <= reg16;
              reg30 <= $unsigned({reg12[(3'h5):(3'h5)]});
            end
          reg31 <= wire3;
          reg32 <= $unsigned(reg24[(4'h8):(2'h3)]);
          reg33 <= reg19[(2'h3):(2'h2)];
          reg34 <= $unsigned($unsigned(wire2));
        end
    end
  assign wire35 = reg9[(1'h1):(1'h1)];
  assign wire36 = (~|{((-$unsigned(reg18)) ?
                          reg21[(4'h8):(3'h5)] : $signed((!(8'hbc)))),
                      reg20});
endmodule
