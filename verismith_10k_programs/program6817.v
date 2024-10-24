module top
#(parameter param45 = {((&((~&(8'hb6)) && ((8'hac) <<< (8'hbd)))) <<< ((!{(8'ha7), (8'ha7)}) ? {((8'hb3) ? (8'ha3) : (8'hb9)), (&(8'hb0))} : (((8'hbd) ? (8'hbc) : (8'ha7)) ? ((8'haf) ? (8'h9c) : (8'hba)) : ((8'haa) ? (8'hbc) : (8'hbb)))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1ba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire4;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire24;
  wire signed [(4'hb):(1'h0)] wire23;
  wire [(3'h6):(1'h0)] wire22;
  wire [(3'h6):(1'h0)] wire21;
  wire signed [(3'h4):(1'h0)] wire20;
  wire signed [(4'he):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(4'h8):(1'h0)] reg42 = (1'h0);
  reg [(3'h5):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  reg [(3'h5):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(5'h13):(1'h0)] reg36 = (1'h0);
  reg [(5'h11):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg [(5'h15):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  reg [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire7,
                 wire6,
                 wire5,
                 reg44,
                 reg43,
                 reg42,
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
  assign wire5 = $signed(wire1[(1'h1):(1'h1)]);
  assign wire6 = (^~wire5);
  assign wire7 = (wire3 >>> $signed(wire4[(3'h4):(1'h1)]));
  always
    @(posedge clk) begin
      reg8 <= wire3;
      if ({wire6[(3'h5):(3'h5)],
          {wire1, (~&(wire0 ? (wire5 ? reg8 : reg8) : wire4))}})
        begin
          reg9 <= (~^reg8[(1'h0):(1'h0)]);
          reg10 <= (~$unsigned((wire5 ^~ $unsigned((wire4 | wire1)))));
          reg11 <= $unsigned(wire6);
        end
      else
        begin
          reg9 <= (-$unsigned((~|({wire0} << (|wire4)))));
          reg10 <= wire3;
          reg11 <= (!reg11[(2'h2):(2'h2)]);
          reg12 <= ((-reg11[(3'h5):(3'h4)]) ? wire0 : (&(&(7'h42))));
          reg13 <= $signed($signed((reg11[(2'h2):(2'h2)] ?
              $unsigned((wire7 ? reg8 : reg12)) : (~{wire2, (8'hac)}))));
        end
      if (reg10)
        begin
          reg14 <= (wire1[(4'h8):(3'h7)] >>> reg10[(2'h2):(1'h1)]);
        end
      else
        begin
          reg14 <= {((8'hbe) || wire0)};
          reg15 <= ($signed(reg9[(5'h12):(2'h3)]) ?
              (wire1[(4'h8):(3'h4)] | {($signed((7'h43)) ?
                      (reg9 | wire7) : (7'h40))}) : ((~&reg12[(4'hf):(4'hc)]) ^~ reg10));
          reg16 <= (reg8[(4'ha):(1'h1)] ? (!reg14) : (+reg11[(3'h7):(3'h7)]));
          reg17 <= wire4[(3'h6):(1'h1)];
          reg18 <= $signed((8'hbf));
        end
      reg19 <= (((^~(-$unsigned(reg17))) ?
          $unsigned((wire4 ?
              {reg16,
                  reg14} : ((8'hbb) == (8'hae)))) : $signed((8'hae))) == $unsigned($unsigned({$unsigned(reg10),
          reg15[(4'h9):(4'h9)]})));
    end
  assign wire20 = $signed(((~|$signed($unsigned(reg16))) && (($signed(reg11) ?
                          (wire0 ? reg19 : wire2) : (wire5 >>> reg9)) ?
                      $unsigned($signed(reg8)) : {{wire6}, $signed(wire2)})));
  assign wire21 = (wire2[(1'h1):(1'h0)] > $unsigned(((~^reg15[(3'h5):(1'h0)]) ?
                      (wire6[(3'h6):(2'h2)] == (8'hab)) : (!(reg15 ?
                          wire6 : (8'hb6))))));
  assign wire22 = (|{($signed($signed(wire21)) ?
                          ($signed(wire6) * $unsigned(reg11)) : ((reg17 ?
                                  wire20 : wire21) ?
                              $signed((7'h40)) : $unsigned(reg19)))});
  assign wire23 = (wire6[(3'h7):(3'h7)] ?
                      (-(8'hbe)) : ($unsigned({$unsigned(reg11),
                          $unsigned(reg18)}) || wire21[(1'h0):(1'h0)]));
  assign wire24 = wire5;
  always
    @(posedge clk) begin
      reg25 <= ($unsigned($signed(reg14)) ? reg12[(4'h8):(3'h5)] : reg14);
      reg26 <= wire23;
      if (wire3[(3'h6):(3'h6)])
        begin
          if ($unsigned((8'hba)))
            begin
              reg27 <= reg17[(2'h2):(2'h2)];
              reg28 <= ($unsigned((8'hb0)) ?
                  reg8 : $unsigned(((((8'ha5) ? reg12 : wire20) ?
                          ((8'h9c) - (8'hb5)) : (reg8 ? wire5 : reg9)) ?
                      $unsigned(((8'hab) <<< reg8)) : reg12[(5'h10):(2'h2)])));
              reg29 <= wire0[(4'h9):(4'h8)];
              reg30 <= $unsigned(wire7[(4'hd):(4'h9)]);
              reg31 <= ((~^(~((^~(8'hb7)) ?
                  (wire7 <<< reg28) : (reg19 ?
                      reg8 : reg14)))) != {reg17[(4'h8):(4'h8)]});
            end
          else
            begin
              reg27 <= reg29[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg27 <= ((wire20[(3'h4):(1'h1)] ?
              ((reg31 && {wire21}) >= $signed((~|reg29))) : wire20) <<< (&reg28));
          reg28 <= reg19[(3'h6):(1'h1)];
          reg29 <= (!$signed(reg26));
          reg30 <= (8'hb8);
          if ((reg30[(2'h2):(2'h2)] ? wire6 : (!wire20[(2'h2):(1'h0)])))
            begin
              reg31 <= reg25[(2'h3):(1'h1)];
              reg32 <= $signed(($unsigned((|((7'h44) << (8'hb8)))) * wire22[(2'h3):(2'h2)]));
              reg33 <= (reg18 ? {$unsigned($signed($signed((8'hb2))))} : reg19);
              reg34 <= (($unsigned($signed({(7'h43)})) || (~wire3)) ?
                  wire23[(3'h5):(2'h2)] : ($signed(wire0) ?
                      $signed(reg14[(3'h6):(3'h5)]) : (~^(wire0[(1'h1):(1'h1)] == (reg32 >>> wire24)))));
            end
          else
            begin
              reg31 <= reg10;
              reg32 <= $signed((wire22[(1'h0):(1'h0)] * reg13[(4'ha):(3'h4)]));
              reg33 <= (reg17 >= $unsigned(reg13));
              reg34 <= wire6;
            end
        end
      reg35 <= wire21[(3'h4):(2'h2)];
      if ($signed({(((reg18 * wire4) <<< $signed(wire1)) ?
              wire4 : (~&((8'ha5) == wire2))),
          (($unsigned(wire4) < reg13) ?
              reg8[(3'h4):(2'h3)] : $unsigned($signed(reg29)))}))
        begin
          reg36 <= reg31[(2'h3):(2'h2)];
          if (($signed(reg19[(4'h8):(3'h7)]) ?
              (!(8'hb9)) : (($unsigned(reg33) < reg32) ?
                  reg27[(2'h3):(1'h1)] : $signed(($signed((8'ha0)) ?
                      (wire0 ? (8'ha1) : reg15) : wire0)))))
            begin
              reg37 <= (-reg17[(4'h9):(3'h7)]);
              reg38 <= $signed((reg37 <<< $unsigned(reg8[(1'h1):(1'h0)])));
              reg39 <= (((~^{$unsigned(reg30)}) ? reg18 : reg15) ?
                  {(reg14[(3'h4):(2'h2)] > ((reg25 - wire3) ?
                          (reg18 >>> reg14) : {wire20, (8'hb6)})),
                      $unsigned(($signed(reg19) == (~|reg13)))} : reg25);
              reg40 <= (~^((8'hb5) ?
                  {((8'hbd) <= (^~reg12)),
                      (8'hb2)} : $unsigned(reg38[(3'h5):(3'h5)])));
              reg41 <= (~|$signed(reg15[(1'h0):(1'h0)]));
            end
          else
            begin
              reg37 <= (~|$unsigned((^$signed((&reg18)))));
              reg38 <= reg31;
              reg39 <= reg41[(2'h3):(1'h1)];
              reg40 <= ((reg14 ?
                  {reg9,
                      $unsigned(((7'h43) <<< reg32))} : reg30[(1'h0):(1'h0)]) ^~ reg39);
            end
          reg42 <= $signed(((~&$signed(reg11[(3'h6):(1'h1)])) ~^ $signed(wire7)));
          reg43 <= $unsigned(reg35);
        end
      else
        begin
          reg36 <= (!$signed(reg9));
          if (({(8'ha6),
              $unsigned($signed(reg34[(4'ha):(2'h2)]))} != {(^~($signed(wire0) ^~ (wire22 ?
                  wire6 : reg35))),
              (^~wire23[(1'h1):(1'h1)])}))
            begin
              reg37 <= reg42[(3'h4):(3'h4)];
              reg38 <= $signed(({$signed((wire22 ? wire0 : reg36)),
                  {$signed(reg26)}} && wire23));
              reg39 <= ($unsigned((~|wire21[(1'h1):(1'h0)])) ?
                  {$signed($signed($unsigned((8'hb9)))),
                      (reg34 - {$unsigned(wire22)})} : (~{{$unsigned((8'ha1))}}));
              reg40 <= ($signed((8'hb6)) ^~ reg34);
              reg41 <= reg28;
            end
          else
            begin
              reg37 <= $unsigned(reg14[(3'h6):(1'h1)]);
              reg38 <= $signed($unsigned($signed($unsigned((wire22 | reg32)))));
              reg39 <= $unsigned(reg19[(4'h8):(1'h1)]);
              reg40 <= $unsigned((8'ha2));
              reg41 <= (!(reg17 <<< $signed(reg11[(4'h9):(3'h6)])));
            end
          reg42 <= {{($signed({wire23, reg25}) ? (8'ha5) : reg37)},
              $signed($signed($signed(wire7[(4'he):(3'h4)])))};
          reg43 <= $unsigned((reg17[(3'h7):(3'h5)] ?
              $signed($signed(((8'hbd) & wire1))) : wire24));
          reg44 <= reg43[(3'h7):(3'h7)];
        end
    end
endmodule
