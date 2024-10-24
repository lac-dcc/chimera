module top
#(parameter param45 = {((((^(8'hb2)) ? (|(8'hbf)) : ((8'ha7) ? (8'ha6) : (8'hbf))) ? {(|(8'ha6))} : (((7'h41) ? (8'ha1) : (8'hb7)) == {(8'ha9), (8'hae)})) ? ((((7'h44) ^ (8'ha0)) ? (^(8'hb1)) : ((8'hb9) ? (8'h9e) : (8'hab))) ? (|((8'hb9) <<< (8'ha7))) : (!(8'hb6))) : (((!(8'hb4)) ? (~|(8'ha4)) : ((8'hb1) >>> (8'h9d))) ? (((8'ha9) ? (8'ha5) : (8'hab)) >> (^~(8'h9c))) : (((8'ha2) ? (8'h9e) : (8'h9e)) ? ((8'hba) != (8'hb3)) : {(8'hb8)})))}, 
parameter param46 = (!param45))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1e3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire44;
  wire signed [(4'h9):(1'h0)] wire43;
  wire [(4'hc):(1'h0)] wire42;
  wire signed [(4'hc):(1'h0)] wire32;
  wire [(4'hf):(1'h0)] wire31;
  wire [(5'h15):(1'h0)] wire30;
  wire signed [(4'hd):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire4;
  reg signed [(4'hf):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(3'h5):(1'h0)] reg6 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire32,
                 wire31,
                 wire30,
                 wire5,
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
  assign wire4 = ((+{(wire3 <= $unsigned(wire2)), wire3}) == ($signed(({wire1} ?
                         {(8'hb0)} : wire2[(4'h8):(3'h7)])) ?
                     ($signed((wire1 ? wire1 : wire2)) >>> {(~^wire0),
                         wire0}) : $signed(wire2[(4'h8):(1'h1)])));
  assign wire5 = $unsigned(wire2[(4'ha):(4'h9)]);
  always
    @(posedge clk) begin
      if (($unsigned((((wire3 >> wire0) ?
                  wire1[(2'h2):(2'h2)] : $signed((7'h40))) ?
              $unsigned((wire4 + wire0)) : ((wire3 >> wire2) == (wire2 ?
                  wire3 : wire1)))) ?
          $unsigned(($signed($signed(wire4)) > (-(wire3 ?
              wire2 : wire1)))) : (($unsigned((|wire4)) <<< $signed((wire5 ?
              wire0 : wire2))) ^~ wire0)))
        begin
          reg6 <= $unsigned(wire5);
          reg7 <= wire4[(4'hd):(3'h4)];
          if (((($unsigned((wire2 ? wire3 : wire4)) != wire5[(4'h8):(2'h2)]) ?
                  $unsigned({wire5[(2'h3):(1'h0)],
                      reg6[(1'h0):(1'h0)]}) : $unsigned((&reg7[(3'h6):(1'h0)]))) ?
              wire2[(4'hd):(3'h4)] : wire1))
            begin
              reg8 <= $unsigned(((!wire3) ?
                  ({reg6[(3'h5):(1'h1)]} ?
                      reg6[(2'h3):(1'h0)] : {{reg6},
                          reg6}) : $signed({$signed((8'hb2)),
                      $signed(wire4)})));
              reg9 <= reg6;
            end
          else
            begin
              reg8 <= reg8[(1'h0):(1'h0)];
              reg9 <= {(!($unsigned(wire5[(3'h6):(2'h3)]) == {$unsigned((8'haf))})),
                  wire2};
              reg10 <= (reg8[(1'h1):(1'h1)] & $signed(reg8[(3'h5):(1'h1)]));
            end
          reg11 <= ((wire2[(2'h3):(1'h1)] ?
                  $signed($signed((^(8'h9d)))) : reg6[(1'h0):(1'h0)]) ?
              (|(wire2[(3'h6):(1'h1)] && ($signed(reg7) || reg6[(1'h0):(1'h0)]))) : $signed($unsigned((wire4 ^ wire5[(4'hc):(3'h4)]))));
          reg12 <= (8'hba);
        end
      else
        begin
          reg6 <= {reg6};
          reg7 <= $unsigned($unsigned($signed($unsigned((8'hb1)))));
          reg8 <= $unsigned({$signed((+{wire0}))});
          reg9 <= $signed($unsigned($unsigned(((~reg8) ?
              $signed(wire2) : (reg9 != wire3)))));
          reg10 <= $unsigned({$signed((^~(reg6 != wire1))), wire3});
        end
      if (reg9[(1'h0):(1'h0)])
        begin
          reg13 <= $unsigned($unsigned($unsigned(reg8)));
          reg14 <= (((&$unsigned((wire3 <= wire3))) * ((reg9 ?
                  reg9[(1'h1):(1'h1)] : reg6[(2'h3):(1'h1)]) | $signed((reg7 ^ reg8)))) ?
              (reg13 <<< wire3) : reg10[(3'h5):(2'h3)]);
          reg15 <= ($signed(({$signed(wire2), {reg8}} ?
                  $signed({reg8}) : ((reg10 ?
                      wire4 : reg8) >>> (reg11 & (8'h9e))))) ?
              $unsigned({$signed(wire4)}) : ((wire0[(3'h4):(1'h1)] ?
                  (wire2[(3'h4):(2'h2)] + reg9) : $signed(reg11[(3'h5):(2'h2)])) <<< reg8));
          reg16 <= $signed($unsigned($signed({{wire2}})));
          reg17 <= wire4[(3'h5):(1'h1)];
        end
      else
        begin
          reg13 <= (|{(-reg17[(2'h3):(1'h0)])});
        end
      reg18 <= {$signed({$signed(wire0)}), wire2[(4'ha):(3'h7)]};
      if ($unsigned((~&$unsigned(wire1))))
        begin
          if (wire5)
            begin
              reg19 <= $unsigned(($unsigned((reg17 ?
                      reg10[(2'h3):(2'h3)] : $unsigned(reg18))) ?
                  $signed(reg15[(2'h3):(1'h0)]) : $signed($signed(reg14[(1'h0):(1'h0)]))));
              reg20 <= ($signed((($unsigned(reg13) >> (reg6 < wire3)) ?
                      {$unsigned(wire3)} : wire0[(4'hb):(1'h0)])) ?
                  ((reg17[(1'h1):(1'h1)] ?
                      reg19[(4'hc):(3'h6)] : reg19[(4'he):(3'h4)]) > reg17) : (7'h40));
              reg21 <= ({{reg11[(2'h2):(1'h1)]}, {$unsigned(reg16)}} ?
                  ($unsigned((((8'ha5) ?
                      reg11 : reg12) ~^ (8'hbf))) >> $unsigned($unsigned((reg11 ?
                      (8'ha5) : reg6)))) : wire3[(2'h3):(2'h2)]);
              reg22 <= wire1;
            end
          else
            begin
              reg19 <= (reg8 ?
                  {(wire1 ?
                          $unsigned(((8'hb8) ?
                              wire5 : (8'hba))) : reg21[(3'h7):(2'h3)])} : (reg21[(4'hd):(3'h7)] ?
                      $unsigned(((~&(8'hb8)) <= (~(8'ha1)))) : reg10));
              reg20 <= $signed($signed($unsigned(wire2[(4'hf):(4'hd)])));
              reg21 <= (^~$signed(((reg8 ~^ (reg16 ?
                  (8'ha6) : reg13)) || (^~(+reg21)))));
              reg22 <= wire5;
            end
          reg23 <= ({(reg12 - (^(reg7 ? reg17 : reg8))), reg10} ?
              $signed(reg11[(1'h1):(1'h0)]) : wire5);
          if (($unsigned(reg11) ? reg12 : wire1))
            begin
              reg24 <= (^~{reg10[(2'h2):(1'h0)], reg17});
              reg25 <= wire5[(3'h7):(1'h0)];
              reg26 <= $signed(($signed((7'h41)) ?
                  reg9 : $signed($unsigned($signed(wire3)))));
              reg27 <= reg21;
            end
          else
            begin
              reg24 <= (wire0[(3'h6):(1'h1)] ?
                  (|$signed(($unsigned(wire4) ?
                      $signed((8'hb4)) : (reg19 ?
                          reg20 : wire5)))) : ($signed($unsigned((^(8'h9d)))) ?
                      (^~reg16) : $signed($signed((~&(8'hbb))))));
              reg25 <= reg27[(4'hc):(3'h7)];
              reg26 <= (!(|{(((8'hac) <= reg17) ? $unsigned(reg10) : (~|wire1)),
                  $signed($signed(wire3))}));
              reg27 <= reg11[(1'h1):(1'h0)];
            end
          reg28 <= reg12[(4'h9):(3'h7)];
          reg29 <= (^~$signed((((reg9 ? reg20 : wire5) ?
              reg25 : {wire4, wire1}) ~^ reg23)));
        end
      else
        begin
          if (((wire4 ~^ ((reg23[(3'h4):(1'h0)] == reg14[(2'h2):(1'h0)]) && reg12[(4'ha):(3'h5)])) <<< wire0[(3'h5):(1'h0)]))
            begin
              reg19 <= ($unsigned({$unsigned($signed(reg12)),
                      ((&wire2) && (wire2 ? (8'ha0) : reg23))}) ?
                  $unsigned(reg18) : reg8[(3'h7):(3'h6)]);
            end
          else
            begin
              reg19 <= reg12[(4'he):(3'h7)];
              reg20 <= $unsigned(((7'h42) ?
                  ((^~(reg28 ? reg8 : reg23)) + (^~(reg8 ?
                      reg29 : reg10))) : ((^~(reg12 - reg23)) < $unsigned(reg12))));
              reg21 <= $unsigned(({((reg14 ? reg11 : reg10) ?
                      ((7'h43) ?
                          reg10 : (8'hb0)) : (reg10 - reg20))} > $signed(reg17[(3'h5):(3'h5)])));
            end
          if ((|$unsigned($signed(reg22[(1'h0):(1'h0)]))))
            begin
              reg22 <= wire1;
              reg23 <= (|(+reg20));
            end
          else
            begin
              reg22 <= (($signed($signed(wire0[(4'hb):(1'h1)])) ?
                  reg29 : (($unsigned(reg25) << (reg13 || reg9)) >>> ($unsigned(wire0) ^ (^wire3)))) && (reg27 ?
                  (+reg27[(3'h5):(2'h2)]) : (reg25[(3'h4):(2'h3)] ~^ (((7'h44) ?
                          (8'hb9) : reg7) ?
                      (^~(7'h42)) : {reg18}))));
              reg23 <= $unsigned((($signed((~|reg26)) ~^ {(wire2 ?
                          wire3 : wire1)}) ?
                  reg13[(3'h5):(2'h3)] : $unsigned(({reg22,
                      reg27} << wire1[(1'h0):(1'h0)]))));
              reg24 <= ({$unsigned($unsigned((~|wire1))),
                  $unsigned(reg24)} << $signed((($unsigned((8'ha3)) >> wire1[(1'h0):(1'h0)]) << ($signed(reg28) ?
                  $unsigned(wire4) : $unsigned(wire4)))));
              reg25 <= (reg27[(4'hb):(3'h4)] != (8'ha4));
            end
          reg26 <= $signed($signed(reg28));
        end
    end
  assign wire30 = reg9[(1'h0):(1'h0)];
  assign wire31 = (((+((~|wire5) ? (^~reg10) : $signed(reg12))) ?
                      $signed((^$signed(reg18))) : (!($unsigned(reg29) ?
                          reg7[(4'h8):(3'h4)] : $unsigned(wire0)))) >= (reg21 ?
                      $unsigned({{wire4}}) : $unsigned(((8'hb9) ?
                          ((8'hbf) ? reg8 : reg8) : (reg6 + reg26)))));
  assign wire32 = $unsigned(({(&{reg22, reg22}),
                      ((^reg12) + $signed(reg17))} > (8'hb2)));
  always
    @(posedge clk) begin
      if (wire2[(4'hd):(4'ha)])
        begin
          reg33 <= ({((wire3[(1'h0):(1'h0)] ?
                  (reg22 ?
                      wire0 : reg25) : $signed((8'h9c))) != $signed((^~reg11)))} + $signed($signed(((reg16 ?
                  reg15 : reg17) ?
              $signed(wire0) : ((8'haf) ? wire2 : wire3)))));
          reg34 <= reg21;
          reg35 <= reg15;
          reg36 <= $signed(($signed(wire30[(3'h6):(2'h2)]) ?
              $unsigned((reg33 || wire5)) : reg18));
        end
      else
        begin
          reg33 <= reg21[(4'he):(3'h6)];
          if ({(~(reg25 ? $unsigned((8'hbd)) : (7'h42))),
              {$unsigned((((8'haa) ? reg34 : wire2) <= $unsigned(wire0))),
                  $signed(($signed(reg28) ?
                      $signed(reg25) : (reg28 >>> wire1)))}})
            begin
              reg34 <= (8'hb0);
              reg35 <= reg29[(4'hd):(3'h7)];
              reg36 <= $signed(reg24[(2'h3):(2'h2)]);
              reg37 <= ($unsigned(($signed((wire5 != wire1)) && $signed((wire4 ?
                      (8'hb9) : reg10)))) ?
                  (^~reg14[(3'h6):(3'h6)]) : {($signed((~reg6)) >>> $signed(reg21))});
            end
          else
            begin
              reg34 <= ((-$unsigned(reg36)) != $unsigned($unsigned((((8'h9f) ^~ reg7) >> (-(8'hb0))))));
              reg35 <= reg15;
            end
          reg38 <= (^~wire1[(1'h1):(1'h0)]);
        end
      reg39 <= $signed(reg10);
      reg40 <= $signed((+$signed($unsigned(reg35))));
      reg41 <= (reg6[(2'h3):(2'h2)] ^~ (($signed((reg29 < reg14)) < ((wire2 ?
                  (8'h9d) : reg36) ?
              reg8 : (wire30 ~^ reg12))) ?
          (-{$unsigned(reg40)}) : ($signed((~|reg28)) <= $signed({reg24,
              wire0}))));
    end
  assign wire42 = $unsigned((7'h44));
  assign wire43 = {($unsigned({reg39[(1'h0):(1'h0)], (reg28 ? reg27 : reg26)}) ?
                          {$unsigned($signed(reg34))} : $unsigned($unsigned(reg21)))};
  assign wire44 = reg33;
endmodule
