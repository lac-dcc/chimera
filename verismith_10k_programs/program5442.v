module top
#(parameter param49 = (({(~&((8'hbb) & (7'h41)))} ? ((|((8'ha9) ? (8'h9c) : (8'ha7))) ? {{(8'hb5), (8'hb0)}, {(8'hb0)}} : {((8'ha3) - (8'ha1))}) : ((((8'hb0) ? (8'h9f) : (7'h42)) ? ((7'h42) ? (8'ha2) : (8'ha4)) : ((8'ha6) << (8'hba))) ? (((7'h40) ? (8'had) : (8'h9e)) ? ((7'h41) ~^ (8'h9c)) : ((8'hac) ? (8'ha1) : (8'hb0))) : (^~((8'ha4) >>> (7'h44))))) ? (({(+(8'haf))} - ((!(8'ha0)) * ((8'hbf) ? (8'ha9) : (7'h44)))) >>> (^~(((8'ha4) + (8'ha7)) ? ((8'hbe) ~^ (8'hbc)) : ((7'h40) + (8'hbe))))) : {(|{((8'ha6) ? (7'h40) : (8'ha7)), (~(8'ha7))})}), 
parameter param50 = (+(((-(^(8'hba))) ? ((param49 ? param49 : param49) ? param49 : param49) : ((param49 >= param49) >= (param49 ? param49 : param49))) << param49)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h216):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire48;
  wire [(2'h2):(1'h0)] wire47;
  wire [(3'h5):(1'h0)] wire46;
  wire [(3'h4):(1'h0)] wire45;
  wire [(5'h13):(1'h0)] wire44;
  wire [(5'h12):(1'h0)] wire43;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire4;
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg [(4'hc):(1'h0)] reg39 = (1'h0);
  reg signed [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(3'h5):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire6,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = wire1[(1'h1):(1'h0)];
  assign wire5 = $signed(({wire2} ~^ $unsigned(($signed(wire0) ~^ (wire0 * wire3)))));
  assign wire6 = wire0[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ((($unsigned({$signed(wire4), (~&wire3)}) ?
          ({(wire6 ? wire5 : wire2), $unsigned(wire0)} ?
              ((wire1 ? wire6 : wire5) ?
                  $signed(wire3) : (wire2 + wire2)) : $unsigned(((8'hab) ?
                  wire0 : wire3))) : wire0) * ($unsigned($unsigned($signed((8'hb4)))) ?
          (wire3 == ((wire1 ? wire5 : wire2) ?
              $unsigned(wire5) : $unsigned(wire6))) : wire6[(2'h2):(1'h0)])))
        begin
          reg7 <= (wire1 == wire6);
          if (wire2)
            begin
              reg8 <= ({(!wire1),
                  (&wire4[(3'h7):(3'h5)])} + (wire3[(1'h1):(1'h1)] ^~ wire0));
              reg9 <= reg8[(4'hc):(3'h4)];
            end
          else
            begin
              reg8 <= wire6[(1'h1):(1'h0)];
              reg9 <= ($signed(wire4) ?
                  ((wire1[(1'h0):(1'h0)] || $unsigned($unsigned(reg7))) ~^ $signed({$unsigned(reg9)})) : {($unsigned((~&wire3)) ?
                          wire1 : (~(reg8 * wire2))),
                      (wire3 - (^~(reg7 * reg9)))});
              reg10 <= wire1;
              reg11 <= ((+wire5[(4'h9):(3'h6)]) >= wire1);
              reg12 <= $unsigned((^(8'hba)));
            end
          reg13 <= {(7'h40)};
          if ((~^(((~&$unsigned((8'hb3))) >= reg8) & (!reg7[(4'h8):(3'h5)]))))
            begin
              reg14 <= wire0;
              reg15 <= reg9[(4'hf):(4'hb)];
              reg16 <= ($unsigned((((^reg9) >= $signed(reg10)) > reg9[(5'h11):(4'h8)])) ?
                  (!reg7[(3'h6):(1'h0)]) : $unsigned(wire1[(1'h1):(1'h0)]));
            end
          else
            begin
              reg14 <= wire6;
              reg15 <= {$signed($unsigned((8'hae)))};
              reg16 <= ($unsigned((&$unsigned((wire4 >> reg15)))) ?
                  wire4 : wire1);
              reg17 <= $signed(({reg13[(1'h0):(1'h0)],
                  {(7'h40), (reg16 >= (8'ha1))}} << reg14[(4'hb):(3'h5)]));
            end
          if ($unsigned($unsigned({wire3[(2'h2):(1'h0)], $signed(wire3)})))
            begin
              reg18 <= ({$signed(reg13[(1'h1):(1'h0)])} ?
                  $signed(((~^$signed(reg11)) ?
                      ((!reg12) > (~&wire0)) : (7'h44))) : $signed($signed(((reg11 <<< (8'hb8)) != $unsigned(reg9)))));
              reg19 <= reg14;
            end
          else
            begin
              reg18 <= (~|wire5[(3'h6):(2'h3)]);
              reg19 <= wire4[(1'h1):(1'h1)];
              reg20 <= $unsigned((reg13[(1'h1):(1'h0)] > {$signed(wire6),
                  $unsigned((wire3 ? (8'h9d) : wire6))}));
            end
        end
      else
        begin
          if (reg9)
            begin
              reg7 <= (|$signed(reg7));
              reg8 <= $unsigned((wire5 ?
                  (((+wire4) - reg7) ?
                      $signed((!wire3)) : $signed(wire4)) : (reg15 == (~^(~wire0)))));
              reg9 <= $unsigned((^~wire3));
              reg10 <= (($signed({(reg16 ? reg16 : reg10)}) && (~reg18)) ?
                  $signed(reg9) : $signed($unsigned(reg20)));
              reg11 <= wire4[(2'h3):(2'h2)];
            end
          else
            begin
              reg7 <= reg16[(5'h10):(1'h0)];
              reg8 <= $signed(reg9[(4'hb):(4'h9)]);
            end
          reg12 <= $unsigned((reg17[(3'h7):(3'h5)] ?
              $signed(((wire2 ?
                  wire3 : reg14) & (8'hb1))) : (~&({wire6} ^ {reg18, wire5}))));
          reg13 <= (reg20 == ((8'had) >>> ((wire5 ?
                  ((8'haf) <<< reg17) : $signed((8'hb7))) ?
              $unsigned(((7'h41) * reg10)) : reg19)));
          if ((~^$signed(($unsigned(reg7) ?
              $unsigned(reg9) : ((wire5 ? wire2 : wire4) ?
                  wire1[(2'h2):(1'h0)] : reg10)))))
            begin
              reg14 <= wire0;
              reg15 <= reg20[(4'h9):(1'h1)];
              reg16 <= (-reg8[(1'h1):(1'h1)]);
            end
          else
            begin
              reg14 <= (^~$signed($unsigned((~|reg18[(4'h8):(3'h6)]))));
              reg15 <= ($signed(reg17[(2'h3):(1'h1)]) - $unsigned(($unsigned((~&reg18)) != (~|$unsigned(reg16)))));
              reg16 <= $unsigned($signed(($unsigned($unsigned(wire5)) > ((|(8'ha7)) ?
                  reg17[(2'h2):(2'h2)] : (reg16 <<< reg8)))));
            end
          reg17 <= wire5;
        end
      if ((reg14[(3'h7):(3'h4)] ?
          $signed((^reg20[(3'h6):(3'h4)])) : $unsigned($signed((8'hb8)))))
        begin
          if ((-$unsigned(reg14)))
            begin
              reg21 <= reg10;
              reg22 <= wire2;
              reg23 <= $signed(wire0);
              reg24 <= $unsigned((8'hb0));
            end
          else
            begin
              reg21 <= (reg7 == reg21);
              reg22 <= (wire3 ?
                  $unsigned((reg18 + $signed(reg16))) : ((~&((^reg24) | (wire6 << reg24))) + $signed($unsigned((reg24 >= (7'h41))))));
              reg23 <= reg9;
              reg24 <= $unsigned((^$signed((((8'hb5) ? wire0 : reg21) ?
                  reg13 : $signed(reg15)))));
              reg25 <= wire0;
            end
          reg26 <= ($unsigned(((~$signed(reg25)) << reg7)) >= $unsigned((8'hb0)));
        end
      else
        begin
          if ($unsigned(wire5))
            begin
              reg21 <= reg19[(1'h0):(1'h0)];
            end
          else
            begin
              reg21 <= (($signed((^(8'hb2))) ~^ ($signed({wire1}) - {(wire2 ?
                          wire5 : wire1)})) ?
                  reg11[(5'h10):(4'hc)] : wire0[(1'h1):(1'h1)]);
            end
        end
      reg27 <= reg26;
      if ({(-(!reg10[(1'h1):(1'h0)]))})
        begin
          reg28 <= (reg26[(4'he):(3'h6)] <<< reg13);
        end
      else
        begin
          if (({$unsigned((7'h41))} ?
              (reg28 <= $signed(({(8'hbb)} <= reg9))) : ((reg11[(3'h7):(2'h3)] ?
                  (8'hba) : $signed($signed(wire4))) && ((8'ha7) ^~ reg22))))
            begin
              reg28 <= $unsigned((~|$signed(wire4[(4'hb):(2'h2)])));
              reg29 <= (wire1[(1'h0):(1'h0)] ?
                  (wire6 ?
                      reg28[(3'h5):(2'h3)] : {$unsigned((|reg12)),
                          (!$signed((8'hbd)))}) : reg14);
            end
          else
            begin
              reg28 <= ($signed(((((8'hb2) ? reg19 : reg14) ?
                          reg20 : reg13[(2'h2):(2'h2)]) ?
                      {(reg15 ?
                              reg17 : (8'hb6))} : ((&wire1) == $signed(reg20)))) ?
                  {reg21} : $signed((^$signed($unsigned(wire4)))));
              reg29 <= reg17;
              reg30 <= reg22;
            end
          if ($unsigned(($signed((&(7'h42))) || {(~|(wire1 > reg13))})))
            begin
              reg31 <= $signed((^($signed((|reg10)) <= reg27[(4'hc):(3'h5)])));
              reg32 <= {$signed(($signed((8'hb4)) | ($signed(reg29) & (reg30 + (8'hbd))))),
                  $unsigned({wire5[(5'h13):(4'h9)]})};
              reg33 <= (({($unsigned(reg21) >>> $unsigned(reg22)),
                      $unsigned(((8'hae) ?
                          (8'h9c) : wire4))} || reg22[(1'h0):(1'h0)]) ?
                  ($unsigned((-((8'h9f) ~^ reg7))) <<< {$unsigned(reg8),
                      reg19[(3'h7):(2'h2)]}) : {reg7,
                      $signed((^~$unsigned(reg30)))});
              reg34 <= ((~&wire3[(1'h0):(1'h0)]) | $unsigned((^{$unsigned(wire1),
                  (wire4 ? reg27 : reg12)})));
              reg35 <= reg19[(3'h7):(2'h3)];
            end
          else
            begin
              reg31 <= $signed(({$unsigned(((7'h40) >= reg24)),
                  ((reg14 | reg11) ?
                      $signed(reg27) : $signed(reg27))} + (($unsigned((8'ha1)) && reg27[(2'h2):(1'h1)]) <= $unsigned(reg33[(4'he):(4'hb)]))));
              reg32 <= $signed($unsigned(reg13[(1'h1):(1'h0)]));
              reg33 <= ($unsigned((+$unsigned($unsigned((8'h9e))))) ?
                  (|{$signed(reg9[(3'h5):(2'h2)]),
                      (~reg18)}) : $unsigned({wire3[(2'h2):(1'h0)]}));
              reg34 <= (|wire3);
            end
          reg36 <= (~&((reg15[(3'h6):(1'h1)] ?
              (!$unsigned(reg19)) : {{(8'hbb)}}) ~^ $signed((+{reg25,
              (8'ha5)}))));
          reg37 <= (^$unsigned($unsigned($signed($signed(reg7)))));
          reg38 <= $unsigned((((|(reg27 ? reg27 : reg8)) + ($unsigned(reg17) ?
              {wire2, reg29} : ((8'hb0) ? reg34 : reg7))) >> reg33));
        end
      if (($signed(reg9) ? reg33 : {wire2[(4'hb):(4'hb)], reg13}))
        begin
          reg39 <= reg28;
          reg40 <= $signed(wire4[(3'h6):(1'h1)]);
          reg41 <= reg26[(2'h2):(1'h0)];
          reg42 <= ($unsigned(reg14) >> $signed((wire4 ^ (^~(~(8'hab))))));
        end
      else
        begin
          reg39 <= $signed(((((|reg20) & ((8'hac) ? (7'h41) : reg31)) ?
                  wire6[(2'h3):(1'h1)] : $signed($signed(wire3))) ?
              (reg40[(2'h3):(1'h0)] == reg23[(1'h1):(1'h0)]) : reg41[(4'h8):(3'h5)]));
          if (reg41)
            begin
              reg40 <= (~|wire5[(3'h6):(1'h1)]);
            end
          else
            begin
              reg40 <= ($unsigned((($signed(wire6) >>> wire1) ?
                      $unsigned($unsigned((8'hb3))) : (reg17 ?
                          (|reg30) : (!reg14)))) ?
                  wire2[(3'h4):(1'h0)] : $signed($signed($signed((reg14 < (8'ha7))))));
              reg41 <= (wire6 > ($unsigned(({reg42} <<< (reg31 & reg40))) || (wire0 ?
                  {$unsigned(reg20), $unsigned(wire2)} : {(reg17 >>> reg7),
                      ((8'hb8) ? (8'hb4) : reg39)})));
            end
        end
    end
  assign wire43 = {($unsigned((reg30[(3'h5):(3'h5)] >> reg22)) ?
                          $unsigned($signed((^~(8'hac)))) : ((-reg41) * (-{wire4})))};
  assign wire44 = reg21[(2'h2):(2'h2)];
  assign wire45 = (($unsigned($unsigned($signed(wire44))) < reg11[(3'h4):(3'h4)]) < wire1);
  assign wire46 = (($signed((|reg14[(3'h7):(3'h5)])) & (&$unsigned($unsigned(reg26)))) ?
                      $signed(reg7) : (~^(~&$unsigned(reg29))));
  assign wire47 = $unsigned($unsigned((^~reg40[(3'h5):(2'h3)])));
  assign wire48 = $unsigned(reg38);
endmodule
