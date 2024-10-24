module top
#(parameter param45 = (~^(~(((-(8'hbb)) ^~ ((8'hab) ? (8'hab) : (7'h40))) ? (((8'ha0) ? (8'ha6) : (7'h42)) ? ((8'hb1) ? (8'ha5) : (8'hb2)) : (!(8'hb5))) : {((8'hb5) == (8'ha6)), ((8'ha2) ? (8'ha8) : (8'hbb))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1f1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire4;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire29;
  wire signed [(4'hc):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire11;
  wire [(4'hd):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(4'hb):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg [(4'h8):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg7 = (1'h0);
  assign y = {wire29,
                 wire12,
                 wire11,
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
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = $unsigned({wire3,
                     (($unsigned(wire0) ?
                         $signed((8'hae)) : (wire1 >> wire2)) && $signed(wire1[(5'h10):(1'h0)]))});
  assign wire6 = (wire1 ? $signed(wire5) : $unsigned(wire1[(5'h10):(2'h2)]));
  always
    @(posedge clk) begin
      reg7 <= wire4;
      reg8 <= wire1[(5'h10):(3'h5)];
      reg9 <= $unsigned($unsigned($signed(wire4[(3'h7):(2'h2)])));
      reg10 <= ((($signed((wire4 ?
          wire3 : wire1)) + reg9[(4'hd):(1'h1)]) == (~^(&(~|reg7)))) - $unsigned($signed(($unsigned(wire0) ?
          reg8[(3'h5):(2'h3)] : $unsigned(reg7)))));
    end
  assign wire11 = $unsigned((wire1 ?
                      (-((reg9 - reg7) - (wire0 ? (8'haa) : reg8))) : reg8));
  assign wire12 = $signed($signed((+((!wire1) ? wire5 : (wire3 + reg8)))));
  always
    @(posedge clk) begin
      reg13 <= {{($signed($unsigned(wire12)) ?
                  {(wire1 ? wire3 : reg8)} : (|(wire2 >= (8'ha5)))),
              {{(wire1 == (8'ha2)), (wire6 ? wire2 : wire2)}}},
          {$signed($unsigned($signed(wire5))),
              ($unsigned({(8'hba)}) << $unsigned((wire6 ? wire6 : wire6)))}};
      if ($signed(($unsigned($signed(reg10[(1'h0):(1'h0)])) ?
          $unsigned((~|(~^wire1))) : reg10)))
        begin
          reg14 <= (((&$signed((!wire5))) >> (wire6[(3'h5):(1'h1)] ?
              (wire12 ?
                  $signed(wire3) : (^wire11)) : (-reg10))) > $unsigned(wire2[(4'hb):(3'h4)]));
          if (reg13[(4'hc):(4'hb)])
            begin
              reg15 <= wire12[(3'h5):(3'h4)];
              reg16 <= (~((~$signed((reg10 ? (8'hbb) : wire1))) << reg7));
              reg17 <= wire11;
              reg18 <= $signed($signed({wire12}));
              reg19 <= reg18;
            end
          else
            begin
              reg15 <= reg14[(4'h9):(4'h8)];
              reg16 <= (((-($unsigned(wire11) >> (wire5 >= wire1))) ?
                      ({{reg9}} ?
                          wire12 : $signed($signed(reg14))) : (wire0[(1'h0):(1'h0)] ?
                          wire6[(3'h5):(1'h0)] : $signed((reg10 >>> wire6)))) ?
                  (reg17 >> wire4) : (wire4[(3'h4):(2'h2)] ?
                      (((!reg14) ? (wire2 >= reg15) : reg16[(1'h1):(1'h0)]) ?
                          wire1[(1'h1):(1'h1)] : reg13[(3'h4):(1'h1)]) : wire4[(3'h4):(1'h1)]));
              reg17 <= $signed(((reg18 ? wire5 : ({reg9} ? (8'hab) : reg9)) ?
                  reg8[(1'h1):(1'h1)] : wire2));
              reg18 <= reg7[(2'h2):(1'h0)];
              reg19 <= $signed({($signed(((8'hb3) << (8'ha7))) ?
                      (reg17 ?
                          wire12[(2'h2):(1'h0)] : (wire3 ?
                              wire6 : wire2)) : reg8[(2'h2):(1'h1)])});
            end
          reg20 <= $signed({reg19[(3'h4):(2'h3)], (~wire5)});
          if (wire3)
            begin
              reg21 <= ($signed(reg7) + reg8[(3'h5):(1'h0)]);
            end
          else
            begin
              reg21 <= ((^~{((^~reg20) < reg16), reg13}) ?
                  $unsigned((8'hb1)) : wire12);
              reg22 <= $unsigned((wire1 ?
                  ((~&$unsigned(reg18)) ~^ $unsigned({wire11,
                      reg20})) : (~reg20[(4'ha):(3'h4)])));
              reg23 <= ({reg17[(2'h3):(2'h2)]} ?
                  (reg20[(2'h2):(1'h0)] ?
                      reg21[(3'h6):(1'h0)] : reg19) : $signed(reg7[(2'h3):(1'h0)]));
            end
          if ((^~((8'hbb) ? reg9 : wire1)))
            begin
              reg24 <= wire3;
              reg25 <= ($signed({reg15[(1'h0):(1'h0)],
                      (reg23 ? (^~reg15) : reg18)}) ?
                  $signed(($signed(wire11) + (reg22[(4'h8):(1'h0)] ?
                      $signed(wire12) : {reg8,
                          reg10}))) : $signed((($signed(reg22) >> reg20[(4'h8):(3'h5)]) ?
                      (^~$signed((8'hb4))) : (reg24[(2'h3):(2'h2)] & (reg13 ?
                          wire0 : reg8)))));
              reg26 <= reg23[(1'h0):(1'h0)];
            end
          else
            begin
              reg24 <= ((-$signed((~|(wire5 ? reg10 : wire11)))) ?
                  reg8 : $signed(wire4));
              reg25 <= $signed($unsigned(reg18[(1'h0):(1'h0)]));
              reg26 <= wire11;
            end
        end
      else
        begin
          reg14 <= (!($signed(reg19[(3'h6):(1'h0)]) != ($signed(wire2[(4'ha):(4'h8)]) == $unsigned((8'hab)))));
          if (($unsigned(((&(reg20 - reg25)) < (-wire0[(2'h2):(1'h1)]))) ?
              {wire3, $unsigned($unsigned((^(8'hab))))} : reg21[(1'h1):(1'h1)]))
            begin
              reg15 <= $unsigned($signed(wire12[(1'h0):(1'h0)]));
              reg16 <= $unsigned({reg22, reg15[(2'h2):(1'h1)]});
              reg17 <= (8'hb8);
            end
          else
            begin
              reg15 <= (((8'hb3) * (!$signed(((8'hbc) >> reg22)))) && (~&$unsigned({(reg25 | reg21),
                  $unsigned(reg9)})));
            end
          reg18 <= reg18[(2'h2):(1'h1)];
          reg19 <= $signed((^~reg24));
        end
      reg27 <= (((^~wire6[(1'h0):(1'h0)]) >= (~$signed(((8'ha8) ^~ reg24)))) ?
          reg21[(4'ha):(3'h6)] : ((wire1 - wire5[(3'h5):(2'h2)]) != $unsigned(((reg24 ?
                  reg26 : wire12) ?
              (reg18 + wire1) : $unsigned((8'hb5))))));
      reg28 <= $signed(wire4);
    end
  assign wire29 = ((((-(-reg19)) ? $unsigned((wire12 ^~ wire4)) : reg9) ?
                      reg20 : reg20) && {reg13[(4'he):(3'h6)]});
  always
    @(posedge clk) begin
      if (((({(7'h43)} & {$signed(reg21)}) ?
          $signed(reg28[(5'h12):(5'h11)]) : reg15) ^~ reg17))
        begin
          reg30 <= reg20;
          reg31 <= (reg14[(4'he):(3'h6)] && (reg23[(4'he):(2'h2)] <= ($unsigned(reg9) * ((wire11 ?
              reg26 : (8'hbd)) >>> {reg8}))));
          if ({(reg30 ? wire4[(2'h2):(1'h0)] : reg30),
              $unsigned({reg31[(4'h8):(4'h8)]})})
            begin
              reg32 <= $signed((!$signed((8'hb0))));
              reg33 <= {{$unsigned(reg20[(4'ha):(1'h1)])}};
              reg34 <= (((8'hb4) ?
                      {wire29, reg18} : $unsigned(wire1[(4'ha):(1'h0)])) ?
                  wire2[(3'h4):(1'h0)] : reg22[(3'h6):(1'h0)]);
            end
          else
            begin
              reg32 <= $unsigned($signed(reg32[(3'h4):(3'h4)]));
              reg33 <= reg16;
              reg34 <= {reg9[(2'h2):(1'h0)], (~reg31[(4'hb):(3'h5)])};
              reg35 <= $unsigned(($signed((~^(wire1 ? reg28 : reg14))) ?
                  reg13 : $signed(({reg31} - reg22))));
            end
        end
      else
        begin
          reg30 <= (-$unsigned((^~reg25[(4'h8):(2'h3)])));
          if ($signed($unsigned((^~(wire6 * reg26[(3'h7):(2'h2)])))))
            begin
              reg31 <= wire11[(1'h0):(1'h0)];
            end
          else
            begin
              reg31 <= $unsigned({(({(8'hb7), wire29} ?
                          reg18 : $unsigned(reg31)) ?
                      reg33 : $unsigned(reg14)),
                  (+reg30)});
              reg32 <= $signed((^~(|((reg15 > wire6) >= $unsigned(reg9)))));
              reg33 <= $unsigned(({(+reg20[(3'h5):(1'h1)]),
                      $unsigned(((8'hb0) ? reg13 : wire2))} ?
                  ((|((8'hbf) && wire6)) > reg15) : (({wire1} ?
                      wire1[(4'hf):(3'h6)] : $unsigned(reg7)) ^~ (|$signed(wire6)))));
            end
          reg34 <= $unsigned(((!$signed((reg23 ? reg16 : (8'ha0)))) < {reg15,
              (wire2 >= (-reg13))}));
          reg35 <= reg19[(2'h2):(1'h1)];
          reg36 <= $unsigned(reg23[(3'h4):(1'h0)]);
        end
      reg37 <= ($signed(wire2) ~^ reg14[(3'h6):(2'h3)]);
      if ($signed(($unsigned(({reg28, reg14} ?
          (reg23 ? reg23 : reg33) : (~|(8'hb4)))) >= $unsigned((+{(8'ha1),
          reg19})))))
        begin
          if ($unsigned($signed(((reg10 ?
              $signed(reg33) : reg8) >>> reg30[(2'h3):(1'h1)]))))
            begin
              reg38 <= {($unsigned((~^(reg27 > reg19))) ?
                      $signed(wire12[(1'h0):(1'h0)]) : $unsigned(((~wire6) > (wire5 <= reg14)))),
                  {$unsigned({(reg32 == reg32), $unsigned(reg20)}),
                      {$signed(reg25[(4'h8):(3'h5)])}}};
              reg39 <= wire29;
            end
          else
            begin
              reg38 <= reg16;
              reg39 <= (!$unsigned(reg33[(4'h9):(2'h2)]));
              reg40 <= $unsigned(({wire4[(3'h5):(1'h1)]} > (&wire5[(4'h8):(1'h1)])));
            end
          reg41 <= wire29;
          reg42 <= (wire2 + {$unsigned($unsigned($unsigned(reg37))),
              $signed($signed({wire5}))});
          reg43 <= reg8[(3'h4):(2'h2)];
          reg44 <= (reg33[(1'h1):(1'h1)] ?
              ((+($signed(wire4) ?
                  $signed(reg10) : (reg43 <<< reg18))) >> $signed(($unsigned(reg27) <= reg31))) : reg41[(5'h12):(5'h11)]);
        end
      else
        begin
          reg38 <= $unsigned((^~(reg26[(3'h6):(2'h2)] <<< (reg39 ?
              (reg41 ? wire6 : wire4) : reg17))));
          if (reg31)
            begin
              reg39 <= wire6[(4'hd):(4'hb)];
              reg40 <= (^~({((^~reg32) | (reg39 ? reg24 : reg17)),
                      $signed(reg7[(1'h0):(1'h0)])} ?
                  ($unsigned({reg25}) ?
                      (((7'h40) == (8'ha7)) ?
                          {wire29,
                              reg32} : $signed((8'hb3))) : reg23) : {$signed((reg44 ?
                          reg22 : wire6)),
                      {reg24[(2'h3):(1'h1)]}}));
              reg41 <= (^reg17);
              reg42 <= $unsigned((~reg41));
            end
          else
            begin
              reg39 <= ($signed($unsigned((reg44[(2'h2):(2'h2)] || reg17[(4'hb):(1'h1)]))) != $signed(((reg27[(3'h7):(2'h2)] ?
                      reg19[(1'h1):(1'h1)] : (|reg30)) ?
                  ((reg31 ? reg36 : reg36) ?
                      reg35[(4'hb):(1'h1)] : (!reg22)) : {(~&reg18)})));
              reg40 <= (-$unsigned((~|reg33[(4'h9):(1'h1)])));
            end
          reg43 <= $signed(({$signed((~|wire11))} != (&$signed($unsigned(wire1)))));
          reg44 <= (&((wire0 ?
              wire11 : $signed((wire1 >= reg13))) >= $signed((8'hb1))));
        end
    end
endmodule
