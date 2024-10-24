module top
#(parameter param35 = ((~&(~&(-{(8'h9d), (8'hbb)}))) >= (^~(({(8'had)} && (~&(8'ha4))) && (~(^~(8'ha3)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h18c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire33;
  wire signed [(5'h15):(1'h0)] wire32;
  wire signed [(2'h2):(1'h0)] wire31;
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  reg [(5'h10):(1'h0)] reg5 = (1'h0);
  assign y = {wire34,
                 wire33,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $unsigned((&$signed(wire2[(1'h1):(1'h1)])));
      if (((&(wire0[(4'hc):(1'h1)] ?
              ((^(8'hb0)) ?
                  (8'ha8) : (wire4 ?
                      (8'hba) : wire2)) : $unsigned($signed(reg5)))) ?
          wire0[(4'h9):(4'h9)] : wire2[(1'h1):(1'h0)]))
        begin
          reg6 <= $unsigned(((~^wire2) ?
              reg5[(4'he):(2'h2)] : $signed(wire1[(3'h4):(2'h3)])));
          if ($unsigned(wire4[(2'h3):(2'h2)]))
            begin
              reg7 <= $unsigned(wire3[(1'h1):(1'h1)]);
            end
          else
            begin
              reg7 <= {($signed({(wire2 ~^ wire4)}) ?
                      ($unsigned($signed(reg5)) ?
                          $signed({wire4}) : $signed(wire2)) : (wire3[(1'h1):(1'h0)] - (reg5 ~^ $signed(reg6)))),
                  ((|wire1) > (~|reg7[(3'h6):(2'h3)]))};
              reg8 <= {($unsigned(wire3[(1'h0):(1'h0)]) > reg5)};
              reg9 <= $unsigned($signed((reg8 ?
                  reg7[(3'h7):(2'h3)] : (wire3 + $signed(reg6)))));
              reg10 <= (((!$signed(wire3)) ?
                      (((+reg7) >= reg7[(4'h9):(3'h4)]) == (!(^reg8))) : ($unsigned(reg8[(4'h9):(3'h7)]) + $signed($unsigned((8'hb6))))) ?
                  $signed($unsigned($unsigned($signed(reg5)))) : $signed(($unsigned($unsigned(reg9)) ?
                      ((-(8'hbb)) ?
                          $signed(wire0) : (reg7 ?
                              wire2 : wire0)) : {$signed(wire0),
                          reg7[(4'h9):(3'h5)]})));
            end
          reg11 <= (7'h41);
          if ($signed(((~((7'h41) ? $unsigned(wire1) : reg10)) ?
              reg7[(4'ha):(4'h8)] : (~|reg9[(2'h3):(1'h0)]))))
            begin
              reg12 <= reg6;
              reg13 <= (&((~^reg5) ?
                  reg12 : (reg8 ?
                      $signed((reg7 ? reg5 : wire4)) : reg12[(3'h7):(3'h7)])));
              reg14 <= reg9[(1'h1):(1'h1)];
            end
          else
            begin
              reg12 <= wire2;
              reg13 <= (reg6[(3'h4):(1'h0)] >>> reg10[(3'h5):(3'h5)]);
              reg14 <= {($signed(reg5) ~^ ($signed(reg10) ?
                      ({(8'hac),
                          reg11} ^~ $signed(reg9)) : {reg8[(4'ha):(4'ha)],
                          (~reg5)}))};
              reg15 <= $signed(($unsigned(wire1) ?
                  ($signed((wire2 ? reg13 : wire0)) == ((^~reg8) ?
                      {wire4, wire2} : (!reg6))) : reg9));
              reg16 <= ($unsigned({($unsigned(reg13) ^~ {reg11, reg8}),
                      reg14[(2'h3):(1'h0)]}) ?
                  $signed($signed(reg8)) : $signed(reg14[(4'h8):(3'h4)]));
            end
          reg17 <= reg6;
        end
      else
        begin
          if ({$unsigned($unsigned(reg9)),
              (reg14[(4'h8):(3'h7)] >> reg12[(4'hc):(4'h9)])})
            begin
              reg6 <= reg16;
              reg7 <= (wire3 || $unsigned((reg6 ?
                  (+reg14) : (~^reg5[(1'h1):(1'h0)]))));
              reg8 <= $unsigned(($signed(wire4[(1'h1):(1'h1)]) >> (($signed(wire1) > $signed(reg15)) ?
                  ($unsigned((8'ha6)) ?
                      $unsigned((8'hba)) : reg8) : $unsigned(((8'hbb) >= reg13)))));
              reg9 <= reg5;
            end
          else
            begin
              reg6 <= $unsigned((($unsigned(reg7[(3'h7):(3'h6)]) ?
                      {(|wire0), (reg8 ~^ reg5)} : reg16) ?
                  reg9[(2'h3):(1'h0)] : $unsigned((((8'hbd) ^~ reg10) ?
                      (reg14 ? reg8 : reg13) : (~wire4)))));
              reg7 <= ($signed(wire4[(2'h2):(2'h2)]) ^ reg15[(3'h7):(3'h6)]);
              reg8 <= wire1;
              reg9 <= {($signed(($signed(wire4) ?
                          reg11 : ((8'hb7) >>> wire1))) ?
                      (-(-(8'ha1))) : $unsigned({wire2[(2'h2):(1'h0)]})),
                  $unsigned((($unsigned(wire4) ?
                      wire2 : wire0) >>> $unsigned((~|wire4))))};
            end
          if ($unsigned(((wire0 ?
              ((wire1 ? reg7 : reg9) ?
                  $unsigned(reg5) : (reg9 >> reg15)) : $unsigned({wire1,
                  reg11})) >> ($unsigned($signed(reg10)) ~^ $signed((reg17 + wire1))))))
            begin
              reg10 <= reg9;
              reg11 <= reg17[(3'h7):(3'h7)];
              reg12 <= ({(wire2[(2'h3):(2'h2)] ^~ (wire4 == $unsigned(wire2))),
                      reg8} ?
                  $unsigned(($unsigned($signed(reg5)) == $unsigned(reg9[(2'h3):(2'h3)]))) : $signed(reg10));
            end
          else
            begin
              reg10 <= (reg9[(3'h4):(1'h1)] + (8'hb6));
              reg11 <= ($unsigned((~&(!reg5))) >> reg15);
            end
          reg13 <= (($unsigned(wire4[(3'h4):(3'h4)]) ?
              reg5[(4'h9):(4'h8)] : {($signed(reg10) ?
                      (reg13 ? reg13 : reg14) : reg12[(3'h7):(3'h6)]),
                  $unsigned({wire0, (8'ha5)})}) || $signed((^wire2)));
          reg14 <= $signed(reg13[(3'h4):(1'h1)]);
          reg15 <= $unsigned(reg15[(2'h3):(1'h0)]);
        end
      if ((reg14 - (reg14 ?
          ((|reg7) ?
              ($unsigned(reg15) ?
                  $unsigned((8'ha5)) : {(7'h44),
                      reg9}) : $unsigned(reg17[(3'h7):(1'h1)])) : (8'h9e))))
        begin
          reg18 <= reg10;
          reg19 <= reg6;
          if (reg5)
            begin
              reg20 <= wire3;
              reg21 <= (reg19 <= ((^~$signed(reg11)) ^~ $signed((&reg9))));
              reg22 <= ($unsigned($signed(wire2[(1'h0):(1'h0)])) ?
                  (^reg21[(3'h4):(2'h3)]) : ($signed($signed((reg11 >>> reg5))) >>> $signed((^wire0[(4'hd):(3'h6)]))));
              reg23 <= $signed(({$unsigned((reg5 ? wire4 : wire4))} ?
                  $signed($signed(reg7)) : (~^($unsigned(reg15) ?
                      (reg5 >>> reg12) : ((8'hb3) >> reg18)))));
              reg24 <= (&$signed(reg20));
            end
          else
            begin
              reg20 <= reg16;
              reg21 <= reg18;
              reg22 <= (^reg20[(3'h6):(3'h5)]);
              reg23 <= (8'h9f);
              reg24 <= $signed((reg22 >= reg24[(3'h4):(2'h2)]));
            end
          if ((^$unsigned((wire4 ?
              (wire0[(1'h0):(1'h0)] >> (reg23 ?
                  reg15 : reg13)) : ((8'hac) - (wire2 ? reg7 : (8'haf)))))))
            begin
              reg25 <= ((reg16 & (|reg10[(3'h4):(1'h1)])) ?
                  $unsigned(reg24[(1'h1):(1'h1)]) : ($signed($signed((reg17 ^ (8'hab)))) ?
                      $signed((reg20[(3'h7):(2'h3)] ~^ $signed(reg13))) : wire4));
              reg26 <= ($signed((-((+reg6) ?
                  wire0[(2'h2):(1'h1)] : $unsigned(reg14)))) == reg20);
              reg27 <= {{reg7[(2'h2):(1'h0)],
                      ($unsigned($unsigned(reg19)) <= {$unsigned(reg23)})}};
              reg28 <= ($unsigned(wire2) * $signed((reg8 + ((reg15 ?
                  reg27 : reg22) - $signed(reg11)))));
              reg29 <= reg5[(2'h2):(1'h0)];
            end
          else
            begin
              reg25 <= (wire1 == (^$signed($unsigned({reg17}))));
              reg26 <= (reg16[(3'h5):(3'h5)] <= $unsigned($unsigned(reg7[(3'h7):(1'h0)])));
              reg27 <= reg20[(4'hd):(4'h8)];
              reg28 <= reg24[(4'hc):(4'h9)];
            end
          reg30 <= $signed($signed((8'ha9)));
        end
      else
        begin
          reg18 <= ((^reg5) ?
              ($signed(wire2) >> ((((7'h43) < reg30) ?
                      (reg7 ? reg22 : reg14) : reg25[(2'h3):(1'h0)]) ?
                  ((reg30 != wire0) ^~ reg21[(1'h0):(1'h0)]) : ((reg13 ?
                      reg19 : reg7) + {wire4, reg19}))) : ((-{{(8'hb6),
                      reg22}}) | reg22));
          if ({{(($unsigned(reg21) * (reg17 + reg29)) || $signed(wire4[(1'h0):(1'h0)])),
                  wire3},
              (^(reg6[(3'h7):(3'h7)] ^ reg21))})
            begin
              reg19 <= ((^{reg20[(1'h0):(1'h0)],
                  (!(reg5 ? reg21 : reg23))}) << (~|(|$signed((8'hbe)))));
            end
          else
            begin
              reg19 <= $unsigned((+(-reg29[(2'h2):(1'h1)])));
            end
          reg20 <= $signed((reg21 - ((~^(reg25 ~^ reg22)) > ($signed((8'ha3)) << (!reg15)))));
          reg21 <= (^~{(~&(((8'hb6) ? reg6 : (8'h9c)) >> reg12[(4'h8):(1'h0)])),
              ((&(reg8 == reg19)) ?
                  (reg12[(4'h8):(1'h0)] ? wire2 : (^~wire1)) : (8'haf))});
        end
    end
  assign wire31 = ($unsigned(((^~reg20) | reg17)) ?
                      (!$signed(($signed(reg9) ?
                          reg5 : (reg29 ? reg20 : reg18)))) : reg10);
  assign wire32 = (reg28[(1'h1):(1'h1)] ?
                      wire3[(3'h7):(3'h7)] : (^~((reg9[(2'h2):(1'h1)] ?
                          (reg23 | reg20) : (reg28 ?
                              reg14 : reg5)) ^~ ((reg28 * reg24) ?
                          (+wire2) : (~reg13)))));
  assign wire33 = (((+(|(~^reg23))) << (8'ha3)) ^~ {reg7[(3'h6):(3'h6)],
                      reg8[(3'h4):(3'h4)]});
  assign wire34 = (8'hbc);
endmodule
