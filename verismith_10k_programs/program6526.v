module top
#(parameter param43 = ((((((8'hb9) ^ (7'h42)) ? (^~(7'h40)) : (|(8'ha3))) ? ((~(8'hb5)) ? ((8'ha5) <<< (8'hb9)) : ((8'h9e) || (8'h9e))) : (+{(7'h42)})) <<< ((&((7'h44) <<< (8'hbc))) - (((8'haf) ? (8'h9c) : (8'hba)) ? ((8'hb1) | (7'h42)) : {(8'hbc)}))) ? (((((8'ha9) ? (8'hb5) : (8'hbb)) ? ((8'hb6) ^~ (8'hab)) : ((7'h42) * (8'had))) == (((8'haa) | (8'hbe)) ? ((7'h42) ? (8'ha0) : (8'h9d)) : (|(8'hbd)))) <<< (((8'hb1) ? ((8'had) >> (7'h42)) : (^~(8'h9c))) ? (~^((8'h9d) | (8'hac))) : (~&(~|(8'haf))))) : ((((~(8'hbd)) ? (^(8'h9f)) : {(8'ha8), (8'hac)}) * (((8'hbf) ? (8'ha1) : (8'hbc)) | ((7'h42) && (8'hb2)))) ? {(!(^~(8'hbf)))} : ((((8'hac) ? (8'ha3) : (8'hbe)) == (~(8'hb3))) ? (((8'hb4) & (8'haa)) || ((8'h9f) >>> (8'ha0))) : (-((8'hb9) && (8'ha7)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h19a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire42;
  wire signed [(4'hb):(1'h0)] wire41;
  wire [(4'ha):(1'h0)] wire22;
  wire signed [(4'hf):(1'h0)] wire21;
  reg signed [(4'h9):(1'h0)] reg40 = (1'h0);
  reg [(5'h10):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg30 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg28 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg5 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire22,
                 wire21,
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
      if ({$signed((8'ha6)), wire3[(1'h0):(1'h0)]})
        begin
          reg5 <= wire0[(3'h5):(1'h1)];
          reg6 <= reg5[(4'h9):(1'h0)];
          reg7 <= reg6[(1'h0):(1'h0)];
          reg8 <= ($unsigned($signed((~|((8'hba) < wire0)))) ?
              reg7[(2'h2):(1'h0)] : $signed($signed(wire4)));
        end
      else
        begin
          if (reg7[(2'h3):(2'h2)])
            begin
              reg5 <= ($signed(({(wire0 ?
                          reg6 : wire4)} || $unsigned(reg6[(2'h2):(1'h0)]))) ?
                  ($signed($unsigned($unsigned(reg5))) - $unsigned(wire3[(4'h8):(1'h1)])) : (!(&$unsigned((7'h40)))));
              reg6 <= $signed($unsigned({$unsigned($unsigned(reg7)), wire1}));
              reg7 <= ($signed(((reg8[(1'h1):(1'h1)] ?
                          reg7[(2'h2):(2'h2)] : (wire3 >>> reg7)) ?
                      (wire2 | ((8'ha9) ^~ (8'h9e))) : ($unsigned((8'hb0)) | (wire4 && reg8)))) ?
                  wire4 : $unsigned($unsigned($signed({wire0, reg8}))));
              reg8 <= $unsigned(($unsigned($signed((reg5 ? wire3 : (8'hb5)))) ?
                  {reg7[(2'h3):(2'h2)]} : (8'hb7)));
            end
          else
            begin
              reg5 <= $unsigned((reg6 >> $signed($signed(wire2))));
              reg6 <= (reg7 + reg8);
              reg7 <= ($signed((($signed(wire3) ^ (~reg7)) * ((|wire1) & {(7'h43),
                  (8'ha7)}))) | (wire4[(3'h6):(2'h2)] ?
                  {($unsigned(wire2) ?
                          {reg8,
                              wire3} : $unsigned(wire1))} : $unsigned($unsigned(wire3))));
              reg8 <= reg8[(3'h6):(3'h6)];
              reg9 <= (|reg8);
            end
          reg10 <= ((^(8'had)) ? reg8 : reg7);
          if (($signed(($unsigned((reg9 <= wire0)) ?
                  reg7[(2'h3):(1'h1)] : $signed((reg10 ? (8'hb2) : wire1)))) ?
              reg5[(3'h6):(1'h0)] : reg6))
            begin
              reg11 <= $signed($signed((^(~^wire0[(1'h1):(1'h1)]))));
              reg12 <= wire2;
              reg13 <= $signed(((!($unsigned((8'hab)) != $signed(wire0))) == $signed(((wire2 ?
                      (8'hab) : reg7) ?
                  reg6 : {wire2}))));
              reg14 <= (|reg11);
            end
          else
            begin
              reg11 <= (reg11[(3'h6):(3'h4)] ?
                  reg9 : (-$signed((reg7[(2'h3):(2'h2)] - reg13))));
              reg12 <= (($signed(reg12[(2'h2):(1'h1)]) ?
                  $unsigned(({reg14} ?
                      (reg13 ?
                          reg8 : reg10) : (~wire4))) : $signed(reg10)) + wire2);
              reg13 <= $signed(reg12);
            end
          reg15 <= (wire4 ?
              wire3[(3'h7):(3'h5)] : {$signed((reg5[(1'h1):(1'h0)] ?
                      {reg12} : ((8'hba) ? wire2 : reg9))),
                  reg7[(1'h0):(1'h0)]});
        end
      if ($unsigned(reg10))
        begin
          reg16 <= {(wire3 ?
                  (reg15 ?
                      ((|reg11) | $signed(reg9)) : $unsigned((reg15 ?
                          wire4 : reg7))) : ($signed($signed(wire0)) ?
                      reg10 : reg5)),
              reg6};
          reg17 <= $unsigned(reg13);
          reg18 <= ((8'hb2) ? ($unsigned((8'h9d)) & reg12) : reg6);
          reg19 <= reg8[(3'h6):(1'h1)];
        end
      else
        begin
          reg16 <= $unsigned($unsigned((~^((wire4 - reg6) ?
              (wire2 ? wire0 : wire1) : reg16))));
          if (($signed((($signed(reg6) << (+wire2)) ?
                  $signed((reg7 >>> reg14)) : $signed((~&(8'ha8))))) ?
              {(((!reg16) ? reg10 : reg5) ?
                      reg19[(4'h8):(1'h0)] : {(reg16 * (8'had)),
                          (^wire3)})} : ((reg10[(4'hf):(3'h5)] < (wire0[(1'h0):(1'h0)] ?
                      wire4[(4'hb):(3'h7)] : (|(8'hab)))) ?
                  reg6 : $signed(($signed(reg7) ?
                      $unsigned(wire3) : (reg7 >> reg8))))))
            begin
              reg17 <= reg8[(3'h4):(2'h3)];
              reg18 <= $signed(reg11[(4'hb):(4'hb)]);
            end
          else
            begin
              reg17 <= reg9[(1'h0):(1'h0)];
              reg18 <= ((({(reg14 ? reg17 : wire0),
                          $signed(reg16)} >> $unsigned($signed(reg10))) ?
                      (~^(+$signed(reg17))) : wire1) ?
                  reg13[(5'h11):(4'ha)] : (^(reg9[(2'h2):(1'h1)] >= $unsigned((wire3 << (7'h44))))));
            end
        end
      reg20 <= {$signed(reg14[(2'h2):(2'h2)])};
    end
  assign wire21 = $unsigned($signed($unsigned(reg18)));
  assign wire22 = reg12;
  always
    @(posedge clk) begin
      if ({wire22[(3'h6):(3'h5)],
          (reg7 != (((reg11 ?
              wire1 : (8'hb4)) <= reg8[(3'h6):(2'h2)]) | (+((8'ha7) ?
              wire0 : reg12))))})
        begin
          reg23 <= (-($unsigned(reg15[(3'h6):(2'h2)]) ?
              {($signed(reg19) ?
                      $signed(reg20) : {(8'hb3),
                          (8'hb7)})} : (reg18[(5'h10):(4'hb)] ?
                  reg14[(2'h2):(1'h0)] : $unsigned($signed(reg12)))));
          if (($signed($signed(wire1[(1'h0):(1'h0)])) >= (reg5[(3'h7):(3'h6)] | $unsigned(((reg20 ?
              (8'ha3) : wire4) >> $unsigned(reg13))))))
            begin
              reg24 <= wire0;
              reg25 <= $signed(({$unsigned(reg17[(1'h1):(1'h1)])} && {{$unsigned(reg12),
                      (reg15 ? reg8 : (8'hab))}}));
              reg26 <= $signed($unsigned($unsigned(($unsigned(wire22) ~^ (|reg20)))));
            end
          else
            begin
              reg24 <= reg8[(1'h1):(1'h1)];
              reg25 <= $signed(((&$unsigned((reg14 ?
                  reg25 : (8'ha9)))) + (~|$unsigned(reg20))));
              reg26 <= (8'haf);
              reg27 <= ({{$unsigned((wire21 | wire21))},
                  ($signed((wire21 ^ (8'ha9))) >>> reg26)} | $signed(reg9));
            end
          reg28 <= (wire22[(2'h3):(2'h2)] ?
              (wire3 ? (+wire0) : (-reg9)) : $signed((({reg14} ?
                      reg23[(5'h12):(4'hf)] : (~reg17)) ?
                  (~((8'hbb) * wire1)) : $unsigned((wire22 && wire21)))));
        end
      else
        begin
          reg23 <= ((reg15[(4'h8):(1'h0)] ?
              (^~((^~reg18) ?
                  (-reg27) : $unsigned(reg11))) : $signed(($signed(reg17) ?
                  $signed(wire0) : $signed(reg8)))) - wire21[(3'h4):(3'h4)]);
          reg24 <= ($unsigned(wire1) ? wire21 : (^{(~^$signed(wire22))}));
          reg25 <= ($signed(($unsigned(wire2) ?
              (-$unsigned(wire1)) : reg25[(2'h3):(1'h1)])) || (8'hb4));
        end
      if ((&(8'ha8)))
        begin
          if ((8'hba))
            begin
              reg29 <= wire22;
              reg30 <= (~&$unsigned(reg24));
              reg31 <= (^((~^(!((8'hbe) ? wire2 : wire2))) ?
                  $unsigned(reg12[(3'h4):(3'h4)]) : reg17[(5'h10):(4'hc)]));
              reg32 <= wire21;
            end
          else
            begin
              reg29 <= ((+(8'ha2)) | {reg31[(1'h0):(1'h0)]});
              reg30 <= (($signed(reg32[(2'h3):(1'h0)]) ?
                  wire21 : {(-(|reg23)),
                      $unsigned((|reg12))}) ^~ $unsigned(reg6));
              reg31 <= $signed((wire2 ?
                  $signed(({reg12, reg30} ?
                      (reg29 <<< wire22) : (wire4 ? reg27 : reg31))) : reg23));
              reg32 <= $unsigned((~(($signed(reg19) ?
                  $unsigned(reg7) : reg16) - $unsigned((wire21 ?
                  (7'h43) : (8'hb1))))));
              reg33 <= reg24[(1'h1):(1'h0)];
            end
          if (wire2[(4'ha):(3'h7)])
            begin
              reg34 <= ($unsigned({((reg30 ~^ reg26) >= wire1[(4'he):(1'h0)]),
                  {reg27[(3'h6):(3'h6)]}}) ~^ reg5[(4'h8):(3'h4)]);
              reg35 <= (~|(wire3[(4'h8):(3'h6)] ?
                  ($signed(((8'hab) ^ wire22)) ?
                      reg27[(3'h4):(2'h2)] : $signed($signed(reg8))) : (reg7[(2'h2):(1'h0)] ?
                      $unsigned((reg7 - reg9)) : $unsigned(reg15))));
              reg36 <= (($signed((^~(reg27 <<< reg33))) >>> $unsigned(reg23[(4'h8):(3'h5)])) | {{$unsigned(reg13[(4'h9):(4'h8)]),
                      {(reg34 != wire0)}}});
            end
          else
            begin
              reg34 <= (reg10[(4'hd):(4'hd)] ~^ $unsigned(wire2));
              reg35 <= $unsigned($unsigned(reg29));
              reg36 <= wire1;
              reg37 <= $unsigned((~&reg19));
            end
        end
      else
        begin
          if ((reg12[(4'hb):(2'h3)] ?
              reg29 : (((reg31 ?
                      $signed((8'hb8)) : (reg8 >>> wire4)) * ((^~reg15) ?
                      $unsigned(reg18) : (^reg31))) ?
                  (!reg5[(4'hb):(3'h5)]) : $unsigned($signed((reg7 ?
                      reg31 : reg16))))))
            begin
              reg29 <= reg27;
              reg30 <= $signed($signed(($unsigned(reg31[(1'h0):(1'h0)]) ?
                  (reg32 == (wire21 ?
                      reg18 : wire1)) : ((~|reg23) <= $unsigned(reg14)))));
              reg31 <= (~^{reg34});
              reg32 <= {(($unsigned((wire3 ? reg19 : reg9)) ?
                          (~^{(7'h44), reg26}) : $unsigned((reg11 == reg10))) ?
                      $signed($unsigned(reg32[(4'hb):(1'h1)])) : ($signed((&wire21)) + reg14)),
                  reg23};
            end
          else
            begin
              reg29 <= {(!$signed(reg6[(2'h2):(2'h2)])),
                  (~&$unsigned((((8'hb0) == reg8) ? reg30 : reg29)))};
              reg30 <= reg8;
            end
          reg33 <= {{reg14[(1'h0):(1'h0)], $signed($signed({reg7, wire2}))}};
        end
      reg38 <= wire0;
      reg39 <= reg33[(3'h6):(1'h1)];
      reg40 <= (-$signed($signed(reg25[(3'h7):(3'h7)])));
    end
  assign wire41 = ((-$unsigned(($unsigned(wire2) ?
                          $signed(reg37) : (reg28 ? wire22 : reg28)))) ?
                      (reg37[(4'hb):(3'h6)] ?
                          $signed(reg18) : reg18) : $unsigned(reg28[(2'h3):(1'h1)]));
  assign wire42 = {$unsigned($signed($signed((wire2 ? wire41 : reg14)))),
                      $signed(((+$unsigned(reg26)) ?
                          $unsigned((reg37 <<< (8'hab))) : $signed({reg31})))};
endmodule
