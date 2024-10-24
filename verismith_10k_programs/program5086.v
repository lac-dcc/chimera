module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h20c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire42;
  wire [(5'h14):(1'h0)] wire4;
  reg signed [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(4'hc):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(2'h2):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg5 = (1'h0);
  assign y = {wire42,
                 wire4,
                 reg41,
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
  assign wire4 = wire1;
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(($unsigned((wire2 <= wire0)) ?
          $unsigned($signed(wire1)) : {$signed((8'h9c)), (~&(8'hb7))}))))
        begin
          reg5 <= wire1;
          reg6 <= wire3;
          reg7 <= wire4;
          reg8 <= {$signed(wire3[(1'h0):(1'h0)]),
              (({{wire3}, (|wire4)} ?
                  wire1 : ((wire4 || (8'hb1)) ?
                      wire2 : (wire0 ? wire3 : wire2))) * reg6[(3'h6):(3'h4)])};
        end
      else
        begin
          if (wire0)
            begin
              reg5 <= ($unsigned($unsigned(reg6)) > ((+(~|$unsigned(wire4))) ?
                  {((wire4 ? wire1 : reg6) ? {wire1, wire0} : (+wire3)),
                      reg6[(4'hf):(4'hd)]} : $unsigned(reg5)));
              reg6 <= (^$unsigned((((&reg7) ?
                  $signed(wire1) : (reg7 != reg8)) < $signed((^~reg7)))));
              reg7 <= reg7;
            end
          else
            begin
              reg5 <= ({wire4[(3'h5):(3'h5)]} + wire1);
              reg6 <= reg6;
              reg7 <= (((^~(7'h43)) ?
                      (^~(|{wire4, reg8})) : wire2[(2'h3):(1'h0)]) ?
                  ({(wire0[(2'h2):(2'h2)] ?
                              ((8'hb7) != wire2) : (wire0 || wire2)),
                          (^(wire2 ? wire3 : (8'h9d)))} ?
                      (((wire1 << reg6) != (7'h40)) ?
                          (reg6[(2'h3):(1'h1)] ?
                              (wire1 != wire1) : (reg7 ?
                                  (8'ha1) : reg5)) : {(wire3 || (7'h41)),
                              (-wire3)}) : ($unsigned({wire2,
                          wire2}) - {reg7[(3'h6):(1'h1)]})) : (8'hb9));
            end
          reg8 <= (-(reg7 ? reg6[(4'hf):(4'hf)] : (8'ha4)));
          reg9 <= wire0;
          reg10 <= $unsigned(((~|(&$signed(wire0))) ?
              {({wire3} & (~^reg9)),
                  ((|reg5) >>> $signed(wire0))} : (~(wire4[(5'h12):(4'ha)] ?
                  $unsigned((8'hb2)) : $signed(wire3)))));
          reg11 <= wire0[(3'h6):(2'h2)];
        end
      if ((~($unsigned($unsigned($signed(wire3))) ?
          $signed($unsigned($signed(wire1))) : reg6)))
        begin
          reg12 <= wire4[(4'hd):(4'hc)];
          reg13 <= ($signed($unsigned((!$signed(reg12)))) ?
              (^~$signed($unsigned((!reg10)))) : wire0[(3'h6):(1'h1)]);
          reg14 <= reg7;
        end
      else
        begin
          reg12 <= $signed($unsigned(wire2));
          reg13 <= ((+$signed((^(!reg6)))) <= (($signed(wire3) ~^ (|$signed(reg7))) >> reg9[(3'h4):(1'h1)]));
          reg14 <= (reg6 <<< ({((wire3 - reg12) <= reg10[(3'h6):(2'h2)]),
              {$signed(reg10)}} + (reg8[(3'h7):(2'h3)] ?
              $signed($unsigned((8'h9e))) : $signed(reg9))));
          reg15 <= $signed(($signed((&(wire1 << reg8))) <= reg8[(3'h4):(2'h3)]));
          reg16 <= reg5;
        end
      reg17 <= $signed(({$signed($unsigned(wire2))} == $signed(((reg11 | reg8) ?
          wire2 : (wire2 ? wire4 : reg12)))));
      reg18 <= $unsigned(reg11);
    end
  always
    @(posedge clk) begin
      if ((((wire2 >= $unsigned({wire1})) ?
          wire4[(5'h10):(4'hd)] : (((wire4 << reg5) || reg17) ?
              ($signed(reg16) & $signed((8'haf))) : (~reg9[(4'ha):(2'h2)]))) != (8'hb2)))
        begin
          reg19 <= $unsigned(wire4);
          reg20 <= (($unsigned(reg6) ? (8'ha8) : reg5) ?
              reg17 : reg6[(5'h12):(1'h0)]);
          if ($signed($unsigned($unsigned(reg19[(2'h2):(1'h0)]))))
            begin
              reg21 <= $unsigned((reg11 ?
                  $unsigned(wire0) : reg10[(4'hd):(3'h6)]));
              reg22 <= (^~$unsigned(reg18[(1'h0):(1'h0)]));
              reg23 <= $signed((($signed($signed(reg18)) == $unsigned($unsigned(reg22))) & (&$unsigned(reg15[(4'h9):(1'h0)]))));
              reg24 <= (wire2[(2'h2):(2'h2)] ?
                  {((~|reg15[(2'h3):(2'h3)]) << reg7[(2'h3):(1'h0)]),
                      (+((wire1 ?
                          (7'h42) : reg8) || $signed(reg9)))} : (|({wire4[(3'h6):(2'h2)],
                      (reg5 ? wire0 : reg5)} | reg20[(3'h4):(3'h4)])));
              reg25 <= (^~{{($signed(reg16) ?
                          $signed((8'hb7)) : (reg24 ? (8'hb5) : reg9)),
                      {reg24[(2'h3):(2'h2)]}},
                  (reg9 ?
                      ((wire0 * reg9) ?
                          (-wire3) : (^(8'hbf))) : $unsigned($unsigned(wire4)))});
            end
          else
            begin
              reg21 <= $signed(((reg24 ?
                  $unsigned(reg14[(3'h5):(2'h3)]) : ({wire0, reg16} ~^ (reg21 ?
                      reg5 : reg10))) > (~^reg10[(3'h4):(1'h0)])));
            end
          if ((8'hb4))
            begin
              reg26 <= $unsigned($unsigned({reg7}));
              reg27 <= (8'haf);
              reg28 <= ($signed({({reg17} ?
                          $unsigned(reg27) : $signed(reg19))}) ?
                  (($signed($signed(wire2)) < reg6[(4'hc):(2'h3)]) & wire3) : reg16);
              reg29 <= reg9;
            end
          else
            begin
              reg26 <= wire2;
              reg27 <= $signed(wire3);
              reg28 <= (wire4[(1'h1):(1'h0)] ?
                  ($signed(reg6[(5'h14):(5'h10)]) ~^ reg25[(1'h1):(1'h1)]) : reg15);
              reg29 <= $signed($unsigned($signed(reg19[(2'h3):(1'h1)])));
              reg30 <= (^~((~^$unsigned((+reg18))) && (8'ha0)));
            end
          reg31 <= (+reg10);
        end
      else
        begin
          reg19 <= (-reg20[(1'h0):(1'h0)]);
          reg20 <= (8'h9f);
          reg21 <= (~(^~$unsigned((~&$unsigned((8'hac))))));
          reg22 <= ((^~$unsigned($unsigned($signed(reg26)))) & (~$signed(reg23)));
        end
      if ($signed({({reg23, (8'hb7)} << $signed($signed(reg9))),
          $signed({(~wire3), reg5})}))
        begin
          reg32 <= $unsigned((~|(reg16 ?
              (^reg27[(4'ha):(2'h3)]) : ({reg30} * (~|reg24)))));
        end
      else
        begin
          reg32 <= (~|{((8'hbb) < (~reg28)),
              (((reg22 && reg16) != (reg7 - (8'h9d))) ?
                  (+$unsigned(reg15)) : {(~&reg20)})});
          reg33 <= $signed(reg16[(4'h8):(3'h7)]);
          reg34 <= ($signed((reg21[(4'ha):(2'h3)] ?
                  ({reg22, (8'h9c)} ?
                      $unsigned(reg30) : $signed((8'hb0))) : reg20)) ?
              ((~^({(8'ha1)} ?
                  (~wire0) : (wire0 ?
                      reg5 : wire4))) || ($signed($unsigned(reg19)) ?
                  ($unsigned(wire1) != $unsigned(reg24)) : (reg27[(3'h7):(1'h0)] ?
                      reg26 : $unsigned(reg32)))) : reg17);
          if ((reg25 <<< (-{$unsigned((!reg28)), $signed($signed(wire2))})))
            begin
              reg35 <= $unsigned(reg10[(5'h13):(4'hc)]);
              reg36 <= (&(wire0 <= (reg15 + {$unsigned(reg30)})));
              reg37 <= (-((($signed(reg34) >>> $signed((7'h41))) ?
                  wire0[(2'h3):(2'h3)] : ((reg24 ~^ reg5) <<< {reg17})) ^ (~^$signed((reg18 >= reg24)))));
              reg38 <= ($signed(reg16[(4'ha):(1'h1)]) ?
                  wire4 : $unsigned(($unsigned((reg35 * reg14)) ?
                      ({reg25} || (reg30 ~^ reg34)) : $signed(reg36))));
            end
          else
            begin
              reg35 <= $signed({$signed((reg22 ? (+reg26) : (-reg38)))});
              reg36 <= (reg37 * (($unsigned($signed(reg16)) ?
                      $unsigned((wire1 <<< (8'hb2))) : $signed({(8'hb8),
                          reg24})) ?
                  {($unsigned(reg25) ? wire2[(3'h7):(3'h4)] : reg15),
                      ($unsigned(reg29) + $unsigned(wire1))} : ($signed($signed(reg32)) < {(~^reg17)})));
            end
        end
      reg39 <= $signed($unsigned(($unsigned(((8'ha2) <= reg37)) ?
          ((^reg34) ? reg25[(4'hf):(3'h5)] : $signed(reg25)) : reg30)));
      reg40 <= reg36;
      reg41 <= $signed((!({$signed(reg18), (reg24 >>> wire2)} ?
          wire0[(1'h0):(1'h0)] : (-reg13))));
    end
  assign wire42 = $signed($signed(({reg20[(3'h5):(3'h5)],
                      reg16[(4'hb):(3'h7)]} & wire1[(1'h0):(1'h0)])));
endmodule
