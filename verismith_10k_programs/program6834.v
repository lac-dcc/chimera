module top
#(parameter param55 = ((((+((8'hb4) || (8'ha6))) >= {(^(8'hac)), {(8'hb6)}}) ? ({{(8'hbd)}} ? ((~(8'hae)) && {(8'haf), (8'hb6)}) : (~{(8'hae)})) : (!(8'hba))) ? ((({(7'h44)} ? ((8'ha3) == (8'hb2)) : (-(8'hb4))) >> {{(8'hb7)}, {(8'ha8)}}) >> (~(((8'hbb) ? (8'h9e) : (8'ha9)) ? ((8'h9e) ? (8'hbc) : (7'h43)) : (~(7'h41))))) : ((((~(8'hb8)) == {(8'hbb), (7'h41)}) ? ({(8'hb1)} >> (~^(8'ha9))) : (((8'hae) ? (8'hb2) : (7'h43)) >= {(8'ha4), (8'h9d)})) >>> (~{((8'ha7) ? (8'hb1) : (7'h41))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h22a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire54;
  wire [(4'he):(1'h0)] wire53;
  wire signed [(5'h10):(1'h0)] wire52;
  wire [(5'h13):(1'h0)] wire51;
  wire signed [(5'h15):(1'h0)] wire23;
  wire [(4'hd):(1'h0)] wire22;
  wire signed [(5'h10):(1'h0)] wire21;
  wire [(4'ha):(1'h0)] wire5;
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  reg [(3'h4):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg46 = (1'h0);
  reg [(3'h7):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg [(3'h7):(1'h0)] reg42 = (1'h0);
  reg [(5'h11):(1'h0)] reg41 = (1'h0);
  reg [(3'h5):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire23,
                 wire22,
                 wire21,
                 wire5,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
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
                 reg24,
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
  assign wire5 = (8'hac);
  always
    @(posedge clk) begin
      if ((($signed(($unsigned((8'hae)) < $unsigned(wire0))) ?
          wire2[(3'h6):(3'h6)] : wire2) >>> $signed(($unsigned((wire3 ?
              wire2 : wire5)) ?
          wire0[(4'h8):(4'h8)] : (^~(8'hb6))))))
        begin
          if (($unsigned($signed((-$signed(wire4)))) > {$unsigned($signed($signed(wire1)))}))
            begin
              reg6 <= wire3;
              reg7 <= wire0[(3'h6):(3'h5)];
              reg8 <= $unsigned($unsigned((((wire4 ?
                      reg6 : wire3) && $unsigned(wire0)) ?
                  $unsigned($unsigned(reg7)) : reg7)));
              reg9 <= ({$signed({{wire1, wire1}}),
                  (wire2[(2'h3):(2'h2)] >>> ((wire0 & wire3) != (reg8 ?
                      wire2 : wire1)))} ~^ (-$unsigned($signed((wire3 ?
                  reg6 : wire3)))));
              reg10 <= wire1[(3'h4):(1'h1)];
            end
          else
            begin
              reg6 <= (-(^reg10[(4'ha):(1'h0)]));
              reg7 <= (~^$unsigned($signed(wire5)));
              reg8 <= (^~$signed((($unsigned(wire1) ?
                      (wire5 ? (7'h40) : reg6) : (wire0 ? reg9 : wire5)) ?
                  $signed((reg10 ? reg9 : (8'ha5))) : reg6)));
            end
          if ($signed(({(!{reg9}),
              $unsigned($unsigned(wire5))} == wire0[(4'h8):(2'h3)])))
            begin
              reg11 <= (wire0 ? wire0 : $signed((7'h41)));
            end
          else
            begin
              reg11 <= $unsigned(reg9[(1'h1):(1'h1)]);
            end
        end
      else
        begin
          if (((8'hae) ?
              ($unsigned((|$signed(reg7))) | $signed($signed($unsigned(reg8)))) : {$signed($unsigned(wire5))}))
            begin
              reg6 <= (^~($signed($unsigned((wire3 ?
                  wire2 : reg7))) && wire2[(3'h5):(2'h3)]));
              reg7 <= $unsigned($unsigned($signed(reg10)));
              reg8 <= $unsigned($unsigned((&wire5[(1'h0):(1'h0)])));
              reg9 <= $unsigned((^~(($unsigned(reg10) == (reg7 ~^ reg7)) ?
                  ($signed(reg9) && (^~reg10)) : (~|(-(8'hb0))))));
              reg10 <= wire4[(3'h5):(3'h5)];
            end
          else
            begin
              reg6 <= wire3;
              reg7 <= (reg7 > $unsigned((^$signed($signed(wire0)))));
              reg8 <= (&$signed((reg9 || (+(wire1 != (8'h9d))))));
            end
        end
      if (reg7)
        begin
          reg12 <= (|$unsigned(wire3[(3'h6):(2'h2)]));
        end
      else
        begin
          reg12 <= wire3;
          reg13 <= reg9;
        end
      reg14 <= {(8'h9e)};
      reg15 <= wire3[(5'h11):(4'hf)];
      if (($unsigned(reg14) ?
          {(reg15 == ((reg7 ? wire5 : reg14) ?
                  reg6[(1'h1):(1'h0)] : $signed(reg6))),
              (~&reg13)} : $signed(reg7)))
        begin
          if ({wire5[(3'h7):(2'h2)]})
            begin
              reg16 <= $unsigned($unsigned(reg14[(4'h8):(3'h4)]));
              reg17 <= reg7[(3'h6):(3'h5)];
              reg18 <= ($signed($unsigned(reg9[(1'h0):(1'h0)])) <= {reg6,
                  wire3});
            end
          else
            begin
              reg16 <= reg18[(3'h4):(1'h1)];
              reg17 <= ($unsigned((($unsigned(reg16) ?
                  $signed(wire3) : $unsigned(wire4)) ^ reg6)) << (reg11[(4'h8):(1'h1)] >> $unsigned(reg15[(2'h2):(1'h0)])));
            end
          reg19 <= $unsigned((($unsigned(((8'had) <<< (8'ha5))) >> $signed(wire3[(5'h10):(5'h10)])) * $signed(($unsigned((7'h41)) ^ (^~reg9)))));
          reg20 <= (reg13 ? $signed({{((8'ha9) & wire0)}}) : (-{reg8}));
        end
      else
        begin
          if ($unsigned(reg18[(5'h10):(4'he)]))
            begin
              reg16 <= reg8;
              reg17 <= (8'hae);
            end
          else
            begin
              reg16 <= wire1[(3'h5):(2'h3)];
              reg17 <= reg11;
              reg18 <= reg12;
              reg19 <= (~^(~reg11));
            end
        end
    end
  assign wire21 = {$unsigned($unsigned($signed($signed(wire2))))};
  assign wire22 = (reg16[(4'h8):(3'h5)] || wire0[(4'h9):(3'h5)]);
  assign wire23 = reg6[(4'hc):(1'h0)];
  always
    @(posedge clk) begin
      reg24 <= reg13;
      reg25 <= $unsigned((reg6 >> (&reg14)));
      if ((reg8[(4'h9):(4'h9)] & (|($signed(wire0) * $signed(((8'hb2) ?
          (7'h42) : (8'haa)))))))
        begin
          if (reg14)
            begin
              reg26 <= $unsigned(wire3[(4'hf):(1'h1)]);
              reg27 <= $signed($signed($signed($unsigned((~(7'h42))))));
              reg28 <= reg14;
              reg29 <= $signed(wire23);
              reg30 <= ($unsigned(reg14) ^ reg19);
            end
          else
            begin
              reg26 <= {((|({(7'h40), (8'ha0)} ?
                      (+reg27) : $unsigned((8'hb1)))) < reg28),
                  {(|(|(+reg26)))}};
              reg27 <= $signed((7'h41));
              reg28 <= {(~^($signed(wire23[(3'h5):(1'h0)]) ?
                      ($signed(wire5) ?
                          {reg30} : $signed(reg11)) : $unsigned({reg30,
                          (8'ha5)})))};
              reg29 <= (reg16[(3'h4):(1'h1)] >> (reg30[(2'h2):(2'h2)] ^ $signed((reg20 ?
                  $unsigned(reg29) : reg29[(1'h1):(1'h0)]))));
            end
          reg31 <= (7'h40);
        end
      else
        begin
          reg26 <= reg20;
          if ($signed(reg27[(3'h6):(3'h6)]))
            begin
              reg27 <= wire5[(3'h7):(3'h6)];
              reg28 <= wire3[(3'h5):(1'h1)];
              reg29 <= $unsigned((reg13[(3'h5):(1'h1)] >> ((8'had) ?
                  (~(reg30 << wire21)) : $unsigned((8'ha4)))));
              reg30 <= {$signed((+(+$unsigned(wire4))))};
              reg31 <= (~$signed(reg24));
            end
          else
            begin
              reg27 <= ($signed((reg29[(3'h5):(2'h3)] && {$unsigned(reg8),
                      $signed(reg24)})) ?
                  ($unsigned(($signed(reg15) ?
                      $unsigned(reg29) : (wire23 ?
                          (8'h9e) : (8'hae)))) && reg27[(4'hd):(4'hd)]) : (($signed(wire0) ?
                          (reg10 <<< {(8'ha1),
                              reg30}) : ($signed(reg15) == (8'hb8))) ?
                      ((!{reg7}) || reg27) : $signed(reg24[(2'h2):(2'h2)])));
              reg28 <= reg15[(2'h3):(2'h3)];
              reg29 <= {{$signed((~(~^(8'ha3)))), reg12[(4'h9):(1'h0)]},
                  (({((8'h9d) ? (7'h44) : reg8)} ?
                          $signed($signed(reg11)) : ($signed((8'ha7)) << (wire3 ?
                              reg17 : wire1))) ?
                      {$unsigned(reg11[(3'h5):(2'h2)])} : ((reg26 < {wire4}) & reg18[(3'h4):(1'h0)]))};
            end
          if ($unsigned($unsigned($unsigned((^$unsigned(wire1))))))
            begin
              reg32 <= $signed((-(wire1[(2'h2):(1'h0)] >> (reg19[(1'h0):(1'h0)] ?
                  (~(7'h40)) : (wire0 ^~ reg16)))));
              reg33 <= ($unsigned(reg20) ?
                  {(($signed((8'ha9)) ? (!reg24) : (reg15 > (8'hb2))) ?
                          $unsigned($unsigned(reg10)) : (^~reg20[(4'ha):(3'h4)]))} : reg14[(4'he):(2'h2)]);
              reg34 <= {reg25[(3'h7):(3'h7)],
                  (~|$signed(((wire21 * wire23) ? (8'ha9) : $unsigned(reg6))))};
            end
          else
            begin
              reg32 <= reg18[(4'hc):(4'ha)];
              reg33 <= {{({(reg9 == wire22), (~^(8'hbd))} ?
                          ((reg32 ? wire3 : reg17) ?
                              $signed(reg29) : (reg15 >>> (8'h9e))) : reg7[(4'h8):(4'h8)]),
                      (7'h42)},
                  wire23[(5'h11):(5'h10)]};
            end
          reg35 <= ((reg13[(3'h4):(3'h4)] ~^ {wire5}) * (~|reg7));
          reg36 <= reg6;
        end
      reg37 <= $signed({$signed($signed($unsigned(reg11))),
          $unsigned(((&reg33) - reg27[(3'h5):(1'h0)]))});
      if (reg19[(2'h3):(2'h3)])
        begin
          if (reg33[(1'h0):(1'h0)])
            begin
              reg38 <= (^~$unsigned(reg10));
              reg39 <= $unsigned(reg29[(2'h3):(1'h0)]);
              reg40 <= (8'hbd);
              reg41 <= reg26;
              reg42 <= $signed($signed((~^$unsigned(reg19))));
            end
          else
            begin
              reg38 <= $signed(reg36[(5'h10):(2'h2)]);
              reg39 <= ($signed(reg13) ?
                  $signed(((~&$signed((8'hab))) < (reg29 >>> $unsigned(wire2)))) : reg34[(3'h7):(1'h1)]);
            end
        end
      else
        begin
          reg38 <= ((reg34[(4'h9):(1'h0)] && (~^$unsigned((reg35 - (8'ha7))))) == (+($unsigned($signed(reg14)) * ({reg13,
              (8'hb6)} <= $unsigned(reg20)))));
          reg39 <= $signed(reg34[(2'h2):(1'h1)]);
          if ($signed(reg35))
            begin
              reg40 <= {reg41[(5'h11):(2'h2)]};
            end
          else
            begin
              reg40 <= ((((wire21[(4'hc):(4'hb)] ?
                      (reg13 + reg31) : (wire3 ? reg26 : reg38)) ?
                  $signed($unsigned((8'ha9))) : (~^(8'ha0))) ^ $signed(((reg15 ?
                      reg34 : reg35) ?
                  {reg38} : $signed(reg26)))) >>> ($signed($signed(reg8)) & (($unsigned(reg7) ?
                  reg41[(4'hb):(3'h5)] : (wire4 < reg17)) | $unsigned({(8'ha6)}))));
              reg41 <= (reg35[(2'h2):(2'h2)] << ($signed((reg7 ?
                      {reg28, wire4} : reg40[(3'h5):(2'h3)])) ?
                  ($signed((-wire23)) <<< ($signed(reg24) ?
                      {reg17, (8'hbd)} : (reg15 ~^ reg33))) : (8'hb8)));
            end
          if ($unsigned(reg39[(1'h1):(1'h1)]))
            begin
              reg42 <= (&$signed($signed(reg6[(3'h4):(2'h3)])));
              reg43 <= reg41;
              reg44 <= (8'ha3);
            end
          else
            begin
              reg42 <= (wire23 ?
                  $unsigned((|$unsigned($unsigned(reg14)))) : {{reg34[(4'h9):(4'h9)],
                          ({wire21, reg40} ? $signed(reg14) : (-(8'h9d)))}});
              reg43 <= {reg32[(2'h2):(1'h1)]};
              reg44 <= $unsigned(reg34);
              reg45 <= ((~^$signed({wire4,
                  (8'ha2)})) * ((reg32 && $signed($signed(wire2))) ?
                  {(~(wire1 <<< reg38)),
                      $unsigned($unsigned(reg15))} : {($unsigned(wire1) ?
                          $unsigned((8'ha0)) : ((8'ha2) ? reg29 : reg20)),
                      $unsigned({reg25, reg32})}));
              reg46 <= reg36[(3'h4):(2'h2)];
            end
          reg47 <= (wire4[(4'h9):(4'h8)] ?
              reg7 : (^~{(~(reg27 < wire23)), $signed(reg15[(1'h0):(1'h0)])}));
        end
    end
  always
    @(posedge clk) begin
      reg48 <= ($signed(({$signed(reg29)} ?
          $signed((reg38 && reg32)) : ((8'hb5) ?
              wire21[(1'h1):(1'h1)] : (|reg26)))) || {($signed((8'hab)) ^ {(reg24 ?
                  reg34 : reg32),
              $signed(reg25)}),
          $signed($signed($signed(reg9)))});
      reg49 <= {(($signed(reg48) ?
              (reg41[(4'ha):(2'h2)] ?
                  reg39 : (reg9 >> (8'h9f))) : (wire4[(2'h3):(2'h3)] > reg27[(4'hf):(4'he)])) > (|(reg15[(3'h4):(1'h0)] < $unsigned(reg47))))};
      reg50 <= ($unsigned({(reg26[(3'h4):(2'h3)] ? reg26 : (~^wire4)),
          {reg40}}) - ({$unsigned(reg25), $signed(reg15[(3'h4):(2'h3)])} ?
          reg6 : reg16));
    end
  assign wire51 = wire3[(4'h8):(2'h3)];
  assign wire52 = reg50[(3'h4):(1'h1)];
  assign wire53 = (({(~{wire5}), ({(8'ha4), (8'hb0)} <= $unsigned(wire23))} ?
                      (($unsigned(reg30) ?
                          (reg41 ?
                              reg36 : (8'hb0)) : reg30[(4'hc):(1'h0)]) || reg20) : $unsigned((8'h9f))) ^~ (reg42[(1'h0):(1'h0)] - reg18[(1'h0):(1'h0)]));
  assign wire54 = $signed(wire53[(4'hb):(4'hb)]);
endmodule
