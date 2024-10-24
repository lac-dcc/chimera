module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h170):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire44;
  wire [(2'h3):(1'h0)] wire43;
  wire [(4'hb):(1'h0)] wire42;
  wire signed [(5'h14):(1'h0)] wire41;
  wire signed [(2'h2):(1'h0)] wire29;
  wire [(3'h7):(1'h0)] wire28;
  wire signed [(3'h4):(1'h0)] wire27;
  wire signed [(3'h5):(1'h0)] wire26;
  wire signed [(4'h8):(1'h0)] wire25;
  wire [(4'hc):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire4;
  reg [(2'h3):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg39 = (1'h0);
  reg [(3'h4):(1'h0)] reg38 = (1'h0);
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg36 = (1'h0);
  reg [(2'h3):(1'h0)] reg35 = (1'h0);
  reg [(3'h5):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg [(3'h5):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
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
                 (1'h0)};
  assign wire4 = wire3[(3'h5):(2'h2)];
  assign wire5 = (^~({((^~wire3) ? $signed(wire3) : (&wire4)),
                     ($signed(wire0) ?
                         (wire1 != wire2) : (wire3 >> wire0))} ^ $signed($unsigned(((8'hae) + wire1)))));
  assign wire6 = (wire5 ?
                     wire2[(2'h2):(1'h0)] : $unsigned((^($unsigned(wire1) - (!(8'ha6))))));
  assign wire7 = $signed((($signed(wire5[(2'h2):(1'h0)]) ?
                     {(~&(8'hb6))} : (+wire1[(1'h1):(1'h1)])) >>> (({wire1} ?
                         $unsigned(wire1) : $signed(wire0)) ?
                     wire6[(1'h1):(1'h0)] : wire6[(3'h7):(2'h3)])));
  always
    @(posedge clk) begin
      reg8 <= ($signed($signed(($unsigned((8'hba)) ?
          wire6[(4'h8):(4'h8)] : $signed((8'haf))))) ^ (!wire4));
      if ((^~(wire4 < ($signed($signed(wire0)) ?
          ((wire5 <= wire3) ^ $signed(wire7)) : ((wire0 && wire6) ?
              $signed(wire7) : (wire7 ? wire7 : wire7))))))
        begin
          reg9 <= $signed((~&wire2[(3'h5):(2'h2)]));
          if (wire1)
            begin
              reg10 <= {wire5[(4'h9):(3'h4)],
                  {reg9,
                      $unsigned((((8'hb6) ? reg9 : (8'hbb)) ?
                          (wire4 ? wire4 : wire2) : (^~wire1)))}};
            end
          else
            begin
              reg10 <= $signed($unsigned((~&wire4[(3'h6):(2'h2)])));
              reg11 <= $unsigned(wire2[(5'h13):(5'h12)]);
            end
          if (reg9)
            begin
              reg12 <= $unsigned($signed({wire6,
                  (wire4 ? {wire1} : reg9[(2'h3):(1'h0)])}));
              reg13 <= (wire1[(2'h2):(1'h1)] ?
                  wire1 : {(^$unsigned((wire2 ? wire7 : wire5)))});
            end
          else
            begin
              reg12 <= {($signed(wire3[(3'h5):(2'h2)]) ?
                      $signed({$signed((8'hb5))}) : (reg12[(1'h0):(1'h0)] ?
                          wire7 : ((+reg9) >= $signed(reg12)))),
                  reg11};
              reg13 <= wire7;
              reg14 <= $signed($unsigned((8'ha7)));
            end
        end
      else
        begin
          reg9 <= (((((wire4 ? reg8 : reg14) || wire7) ?
                      wire5 : reg14[(1'h0):(1'h0)]) ?
                  wire5 : ($unsigned(reg10) ?
                      wire2[(3'h5):(3'h5)] : $unsigned($unsigned(wire3)))) ?
              $signed($unsigned(($unsigned((7'h43)) <= $unsigned(wire0)))) : (^wire4));
        end
      if (reg12)
        begin
          reg15 <= wire1[(1'h0):(1'h0)];
          reg16 <= ((reg14 ?
              (reg12 && $signed(wire0[(2'h3):(2'h2)])) : reg9) | $signed($unsigned(reg8)));
          if ((reg13 ?
              reg12[(1'h0):(1'h0)] : ((&$unsigned((^~wire3))) - (8'h9c))))
            begin
              reg17 <= wire6[(3'h7):(3'h4)];
              reg18 <= $unsigned((-$unsigned((wire3 >= $signed(wire4)))));
              reg19 <= $unsigned((~|{(~^reg13)}));
            end
          else
            begin
              reg17 <= $signed({$unsigned(((reg15 || reg13) == (reg11 ?
                      (8'ha9) : wire5)))});
            end
          if ({((wire6 <= $signed((reg15 ^ wire3))) ^ reg16[(3'h5):(3'h4)]),
              ($unsigned($signed(reg9[(3'h4):(1'h0)])) ^ $unsigned(wire5))})
            begin
              reg20 <= (reg8 || {$unsigned(((reg16 && wire6) >>> (&wire6)))});
              reg21 <= (~|$signed((wire1[(2'h2):(1'h0)] || (~&(|reg11)))));
              reg22 <= wire4;
              reg23 <= ($signed({reg11, $signed($signed(reg10))}) ?
                  ((~&$signed((8'hbb))) << (({reg12,
                      wire5} ~^ reg9[(1'h1):(1'h1)]) && {reg20,
                      (|reg11)})) : (reg21 ?
                      (8'hb2) : ((~|reg18) > (wire1 ?
                          reg11[(2'h2):(1'h1)] : $unsigned(reg16)))));
            end
          else
            begin
              reg20 <= {(^($signed((~&reg14)) ?
                      reg8 : (~|wire3[(3'h7):(3'h6)]))),
                  $unsigned($signed((8'ha6)))};
              reg21 <= $unsigned((~&reg17[(2'h2):(1'h1)]));
              reg22 <= ($signed($signed(($signed(reg22) ?
                  wire2 : $unsigned(reg22)))) * {{$unsigned((~|(8'hb5)))},
                  (({reg16, wire3} ? reg19 : (+reg20)) ?
                      ((8'hbf) & $signed(reg17)) : ((|reg13) ?
                          (reg12 == wire2) : $unsigned(reg14)))});
            end
          reg24 <= $unsigned(wire6[(4'h8):(2'h3)]);
        end
      else
        begin
          if (wire5)
            begin
              reg15 <= wire4;
              reg16 <= ((((((8'hbf) ^~ reg15) * {(8'hbe),
                          reg16}) == (!$signed(reg15))) ?
                      (reg10[(3'h6):(2'h3)] ?
                          (&reg14[(1'h0):(1'h0)]) : (^(reg10 ?
                              reg23 : wire1))) : wire1[(1'h0):(1'h0)]) ?
                  ((((&reg23) ?
                          (~^wire5) : $signed(reg8)) >= ($unsigned(wire7) + (wire2 ?
                          reg20 : reg17))) ?
                      (^~wire7) : ($signed((wire4 != reg18)) ?
                          $signed($unsigned(reg23)) : (reg17[(4'hd):(4'h9)] ?
                              {wire7} : (reg17 ?
                                  (8'h9d) : reg23)))) : wire3[(3'h4):(2'h3)]);
              reg17 <= reg10;
              reg18 <= $signed($unsigned({$signed(reg19[(1'h1):(1'h0)]),
                  $signed((~^(8'hb4)))}));
              reg19 <= reg13[(2'h2):(2'h2)];
            end
          else
            begin
              reg15 <= $unsigned((~$unsigned(reg8)));
              reg16 <= ((|(wire3[(4'h9):(3'h7)] >= reg19[(3'h4):(1'h1)])) | (reg21[(4'hb):(4'hb)] ?
                  $signed(reg8[(5'h10):(4'ha)]) : $signed((~^$unsigned(reg14)))));
              reg17 <= reg11;
              reg18 <= reg19[(3'h4):(1'h0)];
              reg19 <= (reg9[(1'h1):(1'h1)] ?
                  (reg13 << $signed(reg14)) : {$unsigned($signed($unsigned((8'hb7)))),
                      ($unsigned($unsigned(reg24)) ?
                          (!wire0[(3'h5):(2'h3)]) : $signed($unsigned(wire4)))});
            end
        end
    end
  assign wire25 = $unsigned((reg17 ?
                      ({reg8, (reg9 <= wire4)} ?
                          ((wire6 < wire2) ?
                              (wire0 ? reg8 : reg21) : (reg10 ?
                                  wire2 : reg23)) : reg11) : (wire0[(1'h0):(1'h0)] ?
                          {$signed(reg22)} : (^~(7'h41)))));
  assign wire26 = $unsigned((reg13 != (wire4 ?
                      $signed(reg21[(3'h6):(2'h3)]) : (reg22[(2'h2):(2'h2)] | wire2))));
  assign wire27 = wire4[(2'h2):(1'h1)];
  assign wire28 = $signed({$signed($unsigned(wire27[(3'h4):(1'h0)]))});
  assign wire29 = reg24;
  always
    @(posedge clk) begin
      reg30 <= (^reg24);
      if ((reg23 ? {reg15, $unsigned((~&wire2[(5'h13):(3'h5)]))} : (8'h9f)))
        begin
          if (((($unsigned((reg18 != wire6)) ?
                  ({reg24,
                      reg9} >> reg9[(2'h2):(1'h0)]) : reg12) >> wire7[(3'h7):(3'h5)]) ?
              (~|((~&(8'hb0)) ?
                  ((^~wire4) ?
                      (reg12 <<< wire28) : ((8'hbc) ?
                          reg19 : reg30)) : ($unsigned(reg24) ?
                      $unsigned((8'h9c)) : (wire0 * (8'hbb))))) : wire5[(4'ha):(3'h6)]))
            begin
              reg31 <= wire0;
              reg32 <= ((({(reg31 <= reg17)} >= $signed((wire4 | reg10))) < (+$signed($unsigned(reg19)))) ~^ $unsigned($unsigned(wire6[(4'h8):(3'h4)])));
            end
          else
            begin
              reg31 <= reg32[(3'h5):(3'h4)];
              reg32 <= wire5;
              reg33 <= (reg8 ?
                  $signed({(8'had)}) : (reg10[(4'he):(4'ha)] ?
                      (wire1[(1'h1):(1'h0)] && {$signed(reg16),
                          $signed(reg20)}) : $signed($unsigned(((8'ha4) & reg16)))));
              reg34 <= (~|(wire5 - ((&(wire2 - wire29)) ?
                  $unsigned((reg12 ?
                      (8'ha0) : reg15)) : reg17[(4'hb):(4'h8)])));
            end
          reg35 <= (8'hb5);
          reg36 <= reg21[(4'h9):(1'h1)];
          reg37 <= reg30[(1'h0):(1'h0)];
          reg38 <= $unsigned($unsigned(wire1));
        end
      else
        begin
          reg31 <= wire0;
          reg32 <= (wire28 - (reg38[(1'h1):(1'h0)] ?
              (^$signed((reg10 || reg20))) : $signed(wire1[(1'h1):(1'h1)])));
        end
      reg39 <= reg13;
      reg40 <= $unsigned((&$signed(((&reg21) | ((8'ha5) ? wire4 : reg35)))));
    end
  assign wire41 = {$signed({{(wire29 ^~ reg40), reg35},
                          {reg37[(3'h6):(2'h2)]}}),
                      $unsigned({$signed((reg39 << (8'hbe))),
                          $unsigned($signed(reg30))})};
  assign wire42 = $unsigned($unsigned((wire3 ~^ $signed((|wire26)))));
  assign wire43 = $unsigned((^~{($unsigned(wire26) >> (^~wire2))}));
  assign wire44 = $unsigned(((($signed(wire3) || (&wire27)) ?
                          ((~(8'haa)) ?
                              wire28 : {(8'hb5),
                                  reg14}) : $unsigned((&reg31))) ?
                      ((!(reg16 | wire2)) ?
                          {(reg31 ? (8'h9d) : wire6),
                              reg18} : wire26[(1'h0):(1'h0)]) : reg8[(4'he):(4'hc)]));
endmodule
