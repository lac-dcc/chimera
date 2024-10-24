module top
#(parameter param54 = (!(~&(((~&(8'hbb)) | (~|(8'ha3))) ? (~&((8'ha7) & (8'hb6))) : (((8'hbf) <= (8'hb6)) ? (8'hb1) : (^~(8'haa)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h258):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire51;
  wire signed [(4'hc):(1'h0)] wire18;
  wire signed [(4'he):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire4;
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg50 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg [(4'h8):(1'h0)] reg47 = (1'h0);
  reg [(4'h8):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(4'hb):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(4'hd):(1'h0)] reg37 = (1'h0);
  reg [(5'h15):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg34 = (1'h0);
  reg [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  assign y = {wire51,
                 wire18,
                 wire17,
                 wire5,
                 wire4,
                 reg53,
                 reg52,
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
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
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
  assign wire4 = $unsigned((({wire3[(3'h4):(2'h3)]} ?
                     {((8'hbe) ?
                             (8'ha2) : wire1)} : $unsigned($unsigned(wire0))) & $signed(wire3)));
  assign wire5 = wire2[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg6 <= wire2[(3'h6):(1'h1)];
      if (((^~{wire0, wire5[(1'h0):(1'h0)]}) ?
          $signed((((wire0 ? reg6 : wire1) >= wire2) ?
              wire3[(3'h6):(2'h2)] : ($signed(reg6) ?
                  ((8'hac) >= wire2) : (reg6 >= (8'hb1))))) : {reg6,
              (^$unsigned((wire2 != wire2)))}))
        begin
          if (((^wire5) ? (8'hac) : wire3))
            begin
              reg7 <= {$signed(wire0)};
              reg8 <= (8'hb5);
              reg9 <= ($unsigned(wire0[(2'h3):(1'h0)]) ?
                  ({reg6[(1'h1):(1'h0)], wire4} || $signed(((reg7 != wire2) ?
                      (wire1 ? wire0 : (7'h41)) : {wire2,
                          wire4}))) : (+$unsigned(((^wire5) ?
                      {wire3} : reg8[(4'ha):(4'h8)]))));
              reg10 <= reg6;
            end
          else
            begin
              reg7 <= (reg6 ?
                  (+(^({reg9} ?
                      reg7[(4'hd):(3'h4)] : $unsigned((8'hae))))) : ($unsigned($signed($unsigned(wire5))) ^ reg10[(5'h15):(2'h3)]));
              reg8 <= reg7[(4'ha):(3'h6)];
              reg9 <= {wire2[(1'h0):(1'h0)]};
              reg10 <= $signed((~|wire0));
            end
          reg11 <= reg6;
          reg12 <= (($unsigned(($unsigned(reg10) ?
                  (wire0 > (8'ha7)) : (^~wire5))) >>> (8'hb0)) ?
              (~&{reg7[(4'h9):(3'h4)]}) : (~|$unsigned($signed((|wire1)))));
          reg13 <= $signed((wire4[(1'h1):(1'h0)] ?
              ($signed($signed(wire4)) * ({reg6,
                  wire4} ~^ $unsigned(wire1))) : (((reg9 ? (8'hab) : (8'hbe)) ?
                      {reg6, (8'hb3)} : (&wire2)) ?
                  (8'ha4) : ($signed(wire3) ?
                      (reg8 ? wire5 : wire5) : (~(8'ha2))))));
        end
      else
        begin
          if ((wire0 ?
              (((8'ha3) ? $unsigned((reg12 & reg10)) : wire0) ?
                  ((&reg9) ?
                      (8'hb8) : {$unsigned(wire0),
                          $signed(wire2)}) : $unsigned({reg12,
                      $signed(reg10)})) : {($unsigned(reg12) && (wire1 ?
                      (wire1 <<< wire3) : wire0[(1'h1):(1'h0)])),
                  reg8[(1'h1):(1'h1)]}))
            begin
              reg7 <= reg13[(4'h8):(1'h0)];
              reg8 <= {$signed($signed((!$unsigned(wire2))))};
              reg9 <= (8'hb4);
              reg10 <= $unsigned($unsigned(((reg12[(3'h4):(2'h2)] ?
                  wire5[(5'h12):(3'h6)] : (8'hb0)) == (+wire0))));
              reg11 <= ($signed((^(~|(wire5 ? reg10 : (8'haf))))) ?
                  ({(wire2 ? (wire4 > reg7) : $unsigned(wire4)),
                          wire1[(1'h1):(1'h1)]} ?
                      reg8[(3'h4):(1'h1)] : $unsigned((~{reg11,
                          wire4}))) : reg12[(2'h2):(1'h1)]);
            end
          else
            begin
              reg7 <= ((|(wire0 ?
                  reg9 : wire0[(1'h0):(1'h0)])) >= ($unsigned($signed(reg6[(4'he):(4'h8)])) >> wire0[(3'h5):(1'h0)]));
            end
          reg12 <= {(~|wire2), $unsigned(({wire1} + wire0))};
        end
      reg14 <= $signed(reg8[(4'hf):(2'h2)]);
      reg15 <= reg14;
      reg16 <= (((reg6[(3'h7):(1'h1)] != $unsigned($signed((8'hb3)))) ?
              ((&(reg12 ? (8'hae) : reg13)) ?
                  $unsigned(wire3[(5'h12):(5'h10)]) : ((~^reg15) ?
                      $unsigned((8'haa)) : (reg13 & reg7))) : $signed($unsigned(reg15[(1'h0):(1'h0)]))) ?
          $signed((8'ha6)) : reg12[(3'h4):(3'h4)]);
    end
  assign wire17 = reg7[(3'h4):(1'h0)];
  assign wire18 = reg15;
  always
    @(posedge clk) begin
      reg19 <= $signed(reg6[(2'h2):(1'h0)]);
      reg20 <= (reg13[(4'h9):(3'h7)] ?
          $signed((!$unsigned(((8'hb9) ? wire1 : reg12)))) : reg7);
      reg21 <= ($signed((($unsigned(wire17) ? {reg19} : (!wire1)) ?
              $signed($unsigned(reg12)) : ((~reg8) - $unsigned(wire0)))) ?
          reg14[(3'h5):(3'h4)] : {{$unsigned(reg8[(4'h9):(3'h7)])}});
      if ($signed($unsigned({((reg13 && reg13) ? $unsigned(wire1) : reg13)})))
        begin
          if (wire2)
            begin
              reg22 <= ((({(reg8 ? reg8 : reg15), (wire18 < (8'hb4))} ?
                      $unsigned(wire17) : $signed((wire5 * wire3))) >= (!(&$signed((8'ha2))))) ?
                  reg21 : ($unsigned({reg11, {reg8, reg10}}) ?
                      (|($unsigned(wire2) ?
                          wire18 : {reg10, reg7})) : (|wire2[(5'h13):(4'he)])));
              reg23 <= reg14;
              reg24 <= wire18;
              reg25 <= (~|$signed($signed($signed(reg12[(4'h9):(3'h6)]))));
            end
          else
            begin
              reg22 <= (~{(wire17[(3'h7):(3'h7)] ?
                      reg25[(1'h1):(1'h0)] : (~&{reg6})),
                  $unsigned(((reg22 ? wire5 : reg20) | $unsigned(reg23)))});
              reg23 <= $unsigned((^~{((reg7 ? reg15 : wire4) ?
                      reg11[(4'hb):(1'h1)] : (-reg12)),
                  (reg9[(1'h1):(1'h1)] ? (~(8'ha6)) : $unsigned(reg23))}));
              reg24 <= {$signed(((~reg23[(3'h6):(2'h3)]) ?
                      (reg14 ? reg7 : (^~reg10)) : (((8'hbb) | reg25) ?
                          $unsigned((7'h41)) : reg6)))};
              reg25 <= reg9;
              reg26 <= (wire4 ? (+reg20[(2'h3):(1'h0)]) : (8'ha1));
            end
          reg27 <= reg21;
          reg28 <= wire3[(1'h0):(1'h0)];
          reg29 <= $unsigned((reg6 ^ (((-(8'h9f)) ?
              $signed(reg8) : wire17[(4'h8):(1'h0)]) << $signed((|(8'haf))))));
          if (reg6[(4'he):(1'h1)])
            begin
              reg30 <= ((+{(^~(8'ha9))}) && reg19);
            end
          else
            begin
              reg30 <= (wire18 ? wire4[(2'h2):(1'h0)] : wire18[(2'h2):(1'h1)]);
              reg31 <= reg26[(2'h2):(2'h2)];
              reg32 <= (((^reg9) ^ $unsigned((8'hb0))) ?
                  ($unsigned((~|(reg19 ?
                      reg29 : (8'ha5)))) > wire18) : ($signed((&wire1)) >> $signed(wire17)));
              reg33 <= reg12[(1'h1):(1'h0)];
              reg34 <= reg29[(3'h4):(2'h2)];
            end
        end
      else
        begin
          reg22 <= (~&reg25[(3'h6):(2'h3)]);
          reg23 <= $signed((reg11[(3'h6):(3'h5)] ?
              reg21[(4'h8):(3'h6)] : wire0));
        end
      if ($signed((+$unsigned(reg29))))
        begin
          if (((reg28 ? reg34 : $signed(wire3[(4'h9):(3'h5)])) ?
              (^~{reg16[(3'h6):(2'h2)]}) : ((^$unsigned(reg33[(4'hb):(3'h7)])) ~^ $signed((8'ha7)))))
            begin
              reg35 <= $unsigned($signed((reg21[(5'h10):(4'hb)] ?
                  $signed((~reg11)) : ((reg21 >= wire4) | {wire5}))));
              reg36 <= $signed((({{wire5},
                  (wire0 <= reg11)} + reg12[(4'hc):(4'ha)]) - wire1[(2'h2):(1'h0)]));
              reg37 <= ((reg29[(4'ha):(3'h7)] <<< (&(8'hac))) ?
                  (wire2[(4'ha):(4'h9)] != (!({(8'hae), (8'h9f)} ?
                      $unsigned(reg27) : reg27[(1'h1):(1'h1)]))) : $unsigned((((reg19 | reg36) + reg28) ?
                      reg32[(4'h9):(4'h9)] : $signed($unsigned(reg34)))));
              reg38 <= (~^$signed({reg7}));
            end
          else
            begin
              reg35 <= {reg24[(3'h6):(2'h3)],
                  (((~{reg28}) ?
                      $unsigned(reg33[(4'hb):(1'h0)]) : ((wire2 == reg7) ?
                          (wire1 & reg38) : reg32)) != (+$unsigned((reg22 ?
                      (8'ha0) : reg30))))};
              reg36 <= (~^(reg12 != wire3[(4'hd):(3'h6)]));
              reg37 <= $signed(wire18[(1'h1):(1'h1)]);
              reg38 <= ((({(~reg24), reg10[(4'ha):(4'h9)]} << ($signed(reg36) ?
                      $signed(wire17) : $signed(reg6))) ?
                  ({(reg32 ? reg20 : reg29)} ?
                      $signed($signed(reg28)) : $unsigned(wire2[(4'h9):(4'h9)])) : $signed($signed((reg31 ?
                      reg12 : reg7)))) - (((reg6 ?
                      $unsigned((8'ha3)) : reg8) * (wire2[(4'hf):(3'h4)] - $signed(reg20))) ?
                  (~reg8[(3'h5):(3'h5)]) : (((8'h9d) != $unsigned(wire0)) ?
                      reg27[(3'h6):(2'h2)] : $unsigned((reg23 || (8'hbf))))));
              reg39 <= (^((^~$unsigned(reg36)) ?
                  {((~|(8'hb6)) <<< (reg30 <<< reg10)),
                      (-{reg11,
                          (8'hac)})} : ($signed(((8'hb1) * reg24)) >= $unsigned($signed((7'h41))))));
            end
          if ($unsigned(({($signed(reg39) ? (8'ha9) : $signed(wire1)),
              $signed((~|reg10))} > (&(^reg20[(3'h7):(3'h4)])))))
            begin
              reg40 <= ($signed($signed((~&$signed((8'hae))))) < ($unsigned($signed(reg13)) ?
                  reg25 : ($signed(reg30[(1'h1):(1'h0)]) ?
                      reg35[(1'h0):(1'h0)] : $signed($signed(reg13)))));
              reg41 <= (((8'h9c) ?
                  ($unsigned((~(8'ha8))) ?
                      (~^(~&reg29)) : $unsigned($signed(wire17))) : wire1) & reg11);
              reg42 <= reg25[(4'h9):(3'h5)];
              reg43 <= ($signed(({(reg6 ?
                          reg27 : reg38)} >> reg24[(3'h7):(2'h2)])) ?
                  ((|((wire5 ? reg9 : (8'hb5)) ?
                          (reg38 ? reg33 : reg24) : $signed(wire1))) ?
                      (8'hb0) : ($unsigned(reg8) ?
                          (((7'h44) ? reg23 : reg42) ^~ (reg36 ?
                              reg21 : reg41)) : reg36[(5'h14):(2'h2)])) : reg26[(1'h0):(1'h0)]);
            end
          else
            begin
              reg40 <= $unsigned(reg28[(3'h5):(1'h0)]);
              reg41 <= (wire1 && reg25);
              reg42 <= $unsigned((reg33 ?
                  reg12[(4'he):(1'h0)] : reg26[(2'h3):(1'h0)]));
              reg43 <= wire3[(4'h8):(1'h0)];
            end
          reg44 <= reg34;
          reg45 <= $signed(({(reg13[(4'hc):(3'h5)] ?
                      reg22 : reg42[(4'h9):(3'h4)]),
                  (-(^~wire2))} ?
              {(&reg30[(3'h4):(2'h3)]),
                  ($signed(reg15) ?
                      (reg44 <<< reg34) : (^~reg23))} : (|wire4)));
        end
      else
        begin
          reg35 <= (^~reg45);
          if ($unsigned((&((reg22 ?
              {reg8, reg8} : $unsigned(reg32)) || $unsigned((-reg11))))))
            begin
              reg36 <= {reg14};
              reg37 <= (reg37[(4'h9):(4'h9)] * wire3[(2'h2):(1'h1)]);
              reg38 <= ($unsigned(reg40) >= reg42);
              reg39 <= wire4[(2'h2):(1'h1)];
              reg40 <= reg19[(1'h1):(1'h1)];
            end
          else
            begin
              reg36 <= $unsigned(reg26[(2'h3):(2'h2)]);
              reg37 <= ($signed(reg29[(4'he):(4'hd)]) >>> (^(~^$unsigned(wire17[(3'h4):(1'h1)]))));
              reg38 <= {($unsigned((8'haf)) >> (|((&(8'h9e)) <= $signed(reg19)))),
                  $unsigned(reg44)};
              reg39 <= reg19[(3'h5):(2'h3)];
              reg40 <= $unsigned((~(reg43 >= ($signed(reg36) ?
                  reg43 : reg21))));
            end
          reg41 <= $signed((-(~^($unsigned(reg33) ^ (reg13 << (8'hac))))));
          reg42 <= ((&reg22[(2'h2):(1'h1)]) > (((^~$unsigned(reg26)) <= $unsigned(reg15)) ?
              $signed($unsigned($unsigned((8'hb1)))) : $unsigned($unsigned((wire1 && wire2)))));
          if (((~|(wire2[(4'hf):(4'h9)] >= ($unsigned(wire3) >= (reg43 ?
              wire4 : reg26)))) * (^$signed(((reg40 ?
              (8'hae) : reg35) + reg15)))))
            begin
              reg43 <= reg7[(3'h4):(1'h1)];
              reg44 <= ($unsigned(($signed((~reg30)) <= $unsigned(((7'h40) ?
                  reg25 : reg31)))) > $unsigned($unsigned(((~reg37) + (reg11 + (7'h40))))));
              reg45 <= reg30[(3'h6):(2'h2)];
              reg46 <= (|reg13[(4'h9):(4'h8)]);
              reg47 <= reg9[(2'h3):(2'h3)];
            end
          else
            begin
              reg43 <= $unsigned($signed(((reg40 ?
                      reg15[(1'h1):(1'h1)] : ((8'ha1) ? (8'hab) : reg34)) ?
                  $unsigned($unsigned(reg15)) : ($signed(reg29) != (reg10 ?
                      reg10 : reg46)))));
              reg44 <= $signed(((^(^$signed(wire17))) && reg32));
              reg45 <= wire5[(1'h1):(1'h1)];
            end
        end
    end
  always
    @(posedge clk) begin
      reg48 <= $signed(wire2[(4'ha):(4'ha)]);
      reg49 <= wire5[(5'h15):(3'h7)];
      reg50 <= ($signed((8'hb1)) ?
          ($unsigned($unsigned(reg29[(3'h5):(1'h1)])) ~^ {(8'ha4),
              ((reg41 && reg21) ?
                  reg39[(1'h1):(1'h1)] : $unsigned((7'h44)))}) : (((~^(reg6 <<< reg47)) ?
                  reg49 : reg24[(2'h3):(1'h0)]) ?
              wire4[(2'h2):(2'h2)] : ((reg16[(3'h5):(2'h3)] ?
                  (reg7 >= reg9) : (reg43 ?
                      reg21 : wire1)) != $signed(reg14))));
    end
  assign wire51 = (~^$signed({((^~reg41) != {wire1, reg32})}));
  always
    @(posedge clk) begin
      reg52 <= (+wire1);
      reg53 <= reg44[(3'h4):(2'h3)];
    end
endmodule
