module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h165):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  reg [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg33 = (1'h0);
  reg [(4'ha):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg5 = (1'h0);
  assign y = {wire7,
                 wire6,
                 reg36,
                 reg35,
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
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= {(~^($signed(wire2) ?
              (wire1[(1'h1):(1'h1)] ^ $unsigned(wire4)) : (8'ha0))),
          wire3[(4'h9):(3'h6)]};
    end
  assign wire6 = {wire0[(1'h1):(1'h1)],
                     $signed((~&$unsigned((wire2 ? wire0 : (7'h44)))))};
  assign wire7 = ($unsigned({wire0}) ^~ $unsigned((~^(~^$signed((8'ha6))))));
  always
    @(posedge clk) begin
      if (((wire0[(4'ha):(1'h0)] ?
              ((~|$signed(wire7)) - (wire2 ?
                  wire0[(4'he):(4'ha)] : wire3[(4'h8):(1'h1)])) : ((wire2 | wire3) ?
                  ($signed(wire4) ?
                      (8'ha2) : (8'hae)) : wire2[(4'hc):(4'ha)])) ?
          (!(wire2 ?
              $unsigned({wire6}) : $signed($unsigned(wire6)))) : ((wire1 ?
                  ((wire7 != (8'ha5)) ? wire2 : (8'h9c)) : $signed((reg5 ?
                      wire4 : (8'hb6)))) ?
              $unsigned($signed(wire2[(1'h0):(1'h0)])) : $signed($unsigned((wire3 ?
                  (8'hb7) : reg5))))))
        begin
          if ((~&(~^reg5)))
            begin
              reg8 <= ((wire3[(2'h2):(2'h2)] & $signed({$signed(wire2)})) ?
                  $signed($unsigned(wire2[(3'h4):(1'h0)])) : wire4);
              reg9 <= (~&$signed($unsigned((^$unsigned(wire7)))));
              reg10 <= (wire2 ^ wire7[(1'h0):(1'h0)]);
              reg11 <= (wire0 << $signed($signed(wire3[(2'h3):(1'h1)])));
              reg12 <= $unsigned($unsigned((wire7[(4'ha):(1'h0)] ?
                  (wire3 && reg11[(2'h2):(1'h0)]) : reg11)));
            end
          else
            begin
              reg8 <= ($signed($unsigned((wire4 | (|reg10)))) - (8'hba));
              reg9 <= ({(($unsigned(wire2) ?
                      (wire1 ?
                          reg10 : (8'h9d)) : $signed(wire1)) || (|$signed(wire4))),
                  (^~(~^(8'hbe)))} && {(8'ha9)});
              reg10 <= (+reg9);
            end
          reg13 <= (~&$signed(((((8'hb5) * reg8) ?
              (reg10 ?
                  wire0 : wire7) : $signed(reg9)) || (~|(reg8 || wire6)))));
          reg14 <= $signed(wire6);
        end
      else
        begin
          reg8 <= (($unsigned(((~|(7'h43)) <<< $signed(reg12))) ^ reg11[(1'h1):(1'h1)]) ?
              wire2[(4'ha):(1'h1)] : $unsigned(({(reg11 <= wire3),
                      (wire7 >>> (8'hb2))} ?
                  {$unsigned(wire7), $unsigned((8'hbb))} : wire1)));
        end
      reg15 <= reg5[(2'h3):(1'h0)];
      if ($unsigned({$signed(($unsigned((7'h43)) ~^ $signed(reg10)))}))
        begin
          reg16 <= (^~$unsigned($signed(wire0[(3'h7):(2'h2)])));
        end
      else
        begin
          if (wire7)
            begin
              reg16 <= {$unsigned({wire4[(1'h0):(1'h0)]}), $signed((8'hae))};
              reg17 <= wire7;
            end
          else
            begin
              reg16 <= (reg16 * (&(reg8[(4'h8):(2'h2)] + reg13)));
              reg17 <= (~^reg5);
              reg18 <= $unsigned($unsigned({((reg8 << reg12) ?
                      wire3[(1'h0):(1'h0)] : (reg14 == (8'hb1))),
                  reg16}));
            end
          if (reg16[(4'h8):(4'h8)])
            begin
              reg19 <= $unsigned($signed(($unsigned(reg16) ?
                  $signed({wire1}) : wire2[(4'h9):(2'h2)])));
            end
          else
            begin
              reg19 <= ((&reg12) ?
                  $unsigned(reg13) : ($unsigned($signed((reg11 + wire6))) ?
                      $unsigned($signed($unsigned(reg5))) : reg16));
              reg20 <= {$signed(((reg15[(4'hb):(3'h4)] ?
                      (&reg17) : $signed(wire2)) << $signed(reg18[(4'h8):(3'h5)])))};
              reg21 <= (wire6[(3'h4):(3'h4)] ^ (($signed($signed(reg17)) + {$unsigned((8'hb6)),
                      reg11[(1'h0):(1'h0)]}) ?
                  {reg12} : (($signed(reg8) <<< (+(8'ha1))) ?
                      $signed(wire1) : $unsigned({(7'h43)}))));
            end
          if ($unsigned({reg14[(2'h2):(1'h1)], $signed(reg11)}))
            begin
              reg22 <= (|wire3);
              reg23 <= ((((-(reg8 && (8'haf))) ?
                  wire1[(2'h2):(1'h0)] : (reg15[(4'hb):(3'h4)] ?
                      (~|wire3) : {(8'hb0)})) ~^ reg16[(5'h11):(4'he)]) | (^~($unsigned({wire0,
                  wire4}) + ((reg16 ? wire6 : (8'ha0)) ? wire1 : wire0))));
              reg24 <= wire6;
            end
          else
            begin
              reg22 <= {(~|$unsigned($unsigned($unsigned(reg11)))),
                  ($unsigned(($unsigned(reg13) ? $signed((8'hbb)) : (~wire0))) ?
                      $signed($unsigned((wire3 ~^ (8'ha1)))) : (((reg8 ?
                              reg14 : reg24) ?
                          wire1[(2'h2):(1'h0)] : $signed(reg17)) != reg12))};
              reg23 <= $signed(reg18);
              reg24 <= wire4;
              reg25 <= {$signed((+($signed(reg23) ^ $unsigned(reg13)))),
                  (-$signed(reg16[(2'h3):(2'h2)]))};
              reg26 <= wire1[(1'h0):(1'h0)];
            end
          if ({$unsigned($unsigned($unsigned((~reg24)))), (+(&reg10))})
            begin
              reg27 <= (|$signed($signed((&$signed(wire1)))));
              reg28 <= (!($signed((|{reg18, reg14})) >= (!(^(reg21 ?
                  wire1 : reg25)))));
              reg29 <= (|(|reg17[(2'h3):(1'h0)]));
              reg30 <= reg25;
            end
          else
            begin
              reg27 <= (~$unsigned($signed($signed($unsigned(reg14)))));
              reg28 <= $unsigned(wire6);
              reg29 <= {{$signed(((reg19 ? reg17 : wire2) || (reg14 ?
                          reg19 : wire0)))}};
            end
          if ((wire1[(2'h3):(2'h2)] == $unsigned({reg8})))
            begin
              reg31 <= ((reg24 && $signed(((&(8'hbb)) ?
                  $unsigned((8'ha2)) : (-reg22)))) > (-reg9));
              reg32 <= $signed(wire0);
              reg33 <= (~|$signed(reg11[(1'h1):(1'h1)]));
              reg34 <= $unsigned($unsigned((reg33 ?
                  $signed({reg12}) : (reg18 << $unsigned(reg16)))));
              reg35 <= (wire0 <<< reg20);
            end
          else
            begin
              reg31 <= ($unsigned(($signed(((8'hb8) <= reg33)) ?
                  $signed(reg25[(4'h9):(2'h2)]) : (8'hb1))) && reg34[(3'h7):(2'h3)]);
              reg32 <= (($unsigned($unsigned((reg20 ? wire3 : reg9))) ?
                  $signed(reg10[(1'h0):(1'h0)]) : $signed((~^reg28[(4'he):(2'h3)]))) ~^ (((^~(reg21 || reg35)) > {(wire3 ?
                      reg33 : reg30),
                  ((8'h9e) || (7'h44))}) == $signed(reg17[(3'h7):(3'h7)])));
              reg33 <= $unsigned($unsigned($unsigned($unsigned({reg35,
                  (8'hbd)}))));
              reg34 <= {(&$signed($signed((reg26 >>> reg34))))};
            end
        end
      reg36 <= $unsigned($signed(wire7[(4'h9):(3'h5)]));
    end
endmodule
