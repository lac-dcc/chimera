module top
#(parameter param63 = (~&(((((8'ha2) < (8'had)) >= (~|(8'ha7))) ? (~^(8'hb2)) : (((8'hb2) || (8'ha9)) > ((8'hb8) ? (8'hb8) : (8'hb0)))) ? ((((8'h9f) ? (8'hab) : (8'h9c)) ? {(8'ha8)} : {(8'ha9), (8'ha1)}) >> {((8'ha4) < (8'hb4)), {(8'hbc)}}) : (!(-(~(8'hac)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1a4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire4;
  wire signed [(4'he):(1'h0)] wire62;
  wire signed [(5'h15):(1'h0)] wire61;
  wire [(4'ha):(1'h0)] wire60;
  wire [(4'ha):(1'h0)] wire51;
  wire [(4'hb):(1'h0)] wire50;
  wire signed [(2'h3):(1'h0)] wire47;
  wire [(5'h15):(1'h0)] wire46;
  wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(3'h5):(1'h0)] wire44;
  reg signed [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(4'hc):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg55 = (1'h0);
  reg [(4'h8):(1'h0)] reg54 = (1'h0);
  reg [(5'h11):(1'h0)] reg53 = (1'h0);
  reg [(4'h8):(1'h0)] reg52 = (1'h0);
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire60,
                 wire51,
                 wire50,
                 wire47,
                 wire46,
                 wire5,
                 wire44,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg49,
                 reg48,
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
  assign wire5 = ($unsigned($unsigned(wire3[(4'h9):(4'h8)])) >= (|(((^wire3) && (wire2 ?
                     (8'hb4) : wire4)) >> wire1)));
  always
    @(posedge clk) begin
      reg6 <= (wire4[(1'h1):(1'h1)] * wire0[(5'h12):(1'h0)]);
      reg7 <= (($signed(((^(8'hb4)) ~^ (wire5 > wire1))) ?
          (reg6 >>> (+(~&(8'h9e)))) : $unsigned(wire4)) ~^ (~^$unsigned(((wire5 ?
          (8'ha0) : wire2) + (~^reg6)))));
      reg8 <= (((((reg7 ~^ reg7) ?
              (wire0 == reg6) : (+wire2)) * (&wire0[(5'h11):(5'h11)])) ^~ (~^(~^(wire2 ?
              wire4 : reg6)))) ?
          wire0[(4'h9):(1'h1)] : wire4[(1'h1):(1'h0)]);
      if (((~|(~|wire4[(1'h0):(1'h0)])) ?
          (8'hb4) : (((!$signed((8'hb5))) ~^ ($signed(reg7) >> $signed(wire1))) ?
              ($signed(reg8[(1'h1):(1'h0)]) ?
                  $unsigned(((8'hae) ?
                      wire3 : reg8)) : (~&(&reg7))) : ((!wire4[(2'h3):(1'h1)]) ?
                  wire5[(3'h5):(1'h0)] : wire2[(1'h0):(1'h0)]))))
        begin
          reg9 <= ($unsigned(reg7[(5'h10):(2'h2)]) ?
              {({wire4} - wire0[(5'h13):(5'h12)]), (8'hb7)} : wire2);
          if ((^$signed((~|(+wire3)))))
            begin
              reg10 <= $unsigned(wire3);
              reg11 <= (((wire3 ?
                  $signed((wire2 <= reg8)) : $signed(wire0)) * (8'hb5)) <= wire2[(3'h7):(2'h3)]);
              reg12 <= reg6;
              reg13 <= $unsigned(reg7[(3'h4):(1'h1)]);
              reg14 <= wire4;
            end
          else
            begin
              reg10 <= $signed(reg11);
              reg11 <= $signed(wire3);
              reg12 <= ($signed((~^wire2)) * ($unsigned(((^~reg10) | (wire1 ?
                  wire0 : reg7))) == $signed(wire5[(2'h2):(1'h0)])));
              reg13 <= ((!((!reg6) == reg14)) ?
                  $signed($signed(((wire4 ^ reg9) ?
                      $signed((8'ha6)) : $signed(wire5)))) : ((^~{(|reg6),
                          $unsigned(reg11)}) ?
                      (7'h44) : reg12));
              reg14 <= {$signed((!$unsigned((wire1 ? wire1 : reg13))))};
            end
          reg15 <= wire0;
          if (wire5)
            begin
              reg16 <= $unsigned(reg10[(2'h2):(1'h0)]);
            end
          else
            begin
              reg16 <= reg13;
            end
          reg17 <= (reg6 * $signed({reg8[(4'he):(4'hd)]}));
        end
      else
        begin
          reg9 <= {reg8[(4'ha):(3'h4)]};
          reg10 <= (((!$unsigned($unsigned(reg11))) - ((^~reg16[(2'h3):(1'h0)]) == (wire5[(2'h2):(2'h2)] * $signed(wire4)))) ?
              $signed($signed(((wire4 ?
                  wire1 : wire1) < reg7))) : ($signed(wire4) ^ ($unsigned($signed(wire3)) ?
                  {(reg13 == reg6)} : reg7)));
          if (((reg8 >>> $unsigned(wire5[(2'h2):(2'h2)])) >= $unsigned($unsigned(((reg8 ?
              (8'h9f) : (8'hbf)) == reg13)))))
            begin
              reg11 <= wire0[(4'hf):(1'h0)];
              reg12 <= ((^~$unsigned(wire3)) ?
                  $signed({($signed(reg14) | $signed(reg16))}) : $signed(reg12[(1'h0):(1'h0)]));
            end
          else
            begin
              reg11 <= (8'ha1);
              reg12 <= $signed(reg11[(3'h7):(3'h4)]);
              reg13 <= wire5[(4'hc):(4'h9)];
              reg14 <= $unsigned(reg9[(3'h6):(3'h5)]);
              reg15 <= $signed({reg16});
            end
          if (reg11)
            begin
              reg16 <= ($signed($unsigned(((^(8'ha8)) || $unsigned(wire2)))) ~^ $unsigned((((~wire2) ?
                      (reg17 ? reg12 : reg13) : (wire0 ? (8'hbc) : reg10)) ?
                  reg15 : reg9[(2'h2):(1'h0)])));
              reg17 <= reg17;
            end
          else
            begin
              reg16 <= reg8;
              reg17 <= ($unsigned($unsigned(wire2[(4'h8):(4'h8)])) == wire3);
              reg18 <= (+{(($signed(reg17) ?
                      $signed(reg15) : (!reg17)) <= ($unsigned(wire2) ^~ (wire0 | wire2))),
                  $signed(($unsigned(reg15) && (reg7 ? wire0 : reg6)))});
            end
          reg19 <= $signed(wire4[(3'h4):(3'h4)]);
        end
    end
  module20 #() modinst45 (.wire21(reg12), .wire24(wire0), .wire25(reg10), .wire22(reg16), .wire23(reg15), .clk(clk), .y(wire44));
  assign wire46 = (8'hbd);
  assign wire47 = reg12[(5'h14):(4'he)];
  always
    @(posedge clk) begin
      reg48 <= wire3[(3'h6):(2'h2)];
      reg49 <= (~&wire0[(3'h7):(1'h0)]);
    end
  assign wire50 = ($signed(reg10[(3'h5):(1'h1)]) ?
                      (^~(reg18 < $unsigned($signed(wire2)))) : (reg17 ?
                          (^wire3[(5'h11):(4'hc)]) : (&(^(reg17 ?
                              (8'ha0) : wire5)))));
  assign wire51 = $unsigned((~^$unsigned(reg49[(3'h4):(1'h0)])));
  always
    @(posedge clk) begin
      reg52 <= $unsigned($unsigned(($signed((wire2 ?
          reg14 : (8'haf))) - reg17[(3'h7):(3'h4)])));
      reg53 <= wire50[(4'hb):(3'h5)];
      reg54 <= $unsigned({$signed((wire3[(2'h2):(1'h1)] ?
              reg18[(1'h0):(1'h0)] : (wire2 == (8'ha7))))});
      if ((((reg53[(3'h7):(3'h5)] ? (8'hb6) : $unsigned((~wire1))) ?
          $signed((reg16 <= (wire1 ?
              reg12 : reg53))) : (8'hb9)) != (~&(~&reg9))))
        begin
          reg55 <= (~&(|$signed(((reg13 ? wire2 : reg16) || (|reg18)))));
          reg56 <= $unsigned(reg53[(4'hf):(4'h8)]);
          reg57 <= $signed(({(^~(~&(8'ha3))),
              $signed((^~reg48))} & ((!reg6[(1'h1):(1'h1)]) ?
              $unsigned($unsigned((8'hbd))) : (^(reg7 << reg16)))));
          reg58 <= (~&(reg7[(4'hd):(2'h3)] << wire3[(4'h8):(3'h5)]));
          reg59 <= (~|reg18[(1'h1):(1'h0)]);
        end
      else
        begin
          reg55 <= (~&(reg59 | (((8'hb4) <= $unsigned(reg59)) ?
              wire4 : $unsigned((8'hb2)))));
        end
    end
  assign wire60 = ((~&((^~wire46[(4'he):(1'h0)]) < ((wire46 == reg9) ?
                          wire44[(3'h4):(1'h1)] : (reg6 ^~ reg8)))) ?
                      wire3[(4'hb):(3'h6)] : {reg57[(3'h6):(3'h5)]});
  assign wire61 = reg6[(3'h5):(1'h0)];
  assign wire62 = {{reg56}};
endmodule

module module20
#(parameter param43 = (8'hbc))
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h8f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire25;
  input wire [(4'hb):(1'h0)] wire24;
  input wire [(4'he):(1'h0)] wire23;
  input wire signed [(5'h12):(1'h0)] wire22;
  input wire signed [(5'h14):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire42;
  wire [(3'h7):(1'h0)] wire41;
  wire [(4'hb):(1'h0)] wire40;
  wire [(2'h3):(1'h0)] wire28;
  wire signed [(3'h4):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire26;
  reg signed [(3'h4):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg36 = (1'h0);
  reg [(3'h5):(1'h0)] reg35 = (1'h0);
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  reg [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(2'h2):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(3'h4):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire28,
                 wire27,
                 wire26,
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
                 (1'h0)};
  assign wire26 = ((~{(^~((8'hb5) ? wire23 : wire24)),
                          $signed($unsigned(wire24))}) ?
                      (wire21 ?
                          (($signed(wire25) == $unsigned((8'ha9))) > (^~{wire25,
                              wire24})) : $unsigned(($signed((8'hbc)) ?
                              $unsigned(wire25) : (wire24 ^ (8'h9f))))) : wire22[(4'hd):(1'h0)]);
  assign wire27 = wire23;
  assign wire28 = ($unsigned($unsigned(((wire24 != (8'hb0)) ?
                          (wire27 ? wire23 : wire25) : (wire23 ?
                              wire27 : wire27)))) ?
                      (-(!{{wire26}})) : wire21);
  always
    @(posedge clk) begin
      reg29 <= $unsigned(wire24);
      if ($unsigned(({{(wire26 <<< (8'ha7))}} ?
          {$unsigned(wire24[(4'h8):(1'h0)])} : (wire23 ?
              $unsigned($unsigned(wire28)) : $unsigned($unsigned(wire22))))))
        begin
          reg30 <= $unsigned($unsigned($signed($unsigned((wire21 && (8'hb9))))));
          reg31 <= wire24[(2'h2):(2'h2)];
        end
      else
        begin
          reg30 <= $unsigned($signed(($unsigned(wire28[(2'h3):(2'h2)]) == wire26)));
        end
      reg32 <= ($signed(($signed(wire24) ?
              {$unsigned(wire24), $signed(wire22)} : $signed((wire26 ?
                  wire24 : reg31)))) ?
          $signed((wire26[(2'h2):(2'h2)] ?
              $unsigned((~&wire21)) : ($signed(wire28) + {wire22,
                  reg30}))) : wire28);
      reg33 <= $signed($unsigned($signed(wire21)));
      if ($signed((~^wire21[(5'h10):(1'h1)])))
        begin
          reg34 <= (((8'hb2) ?
                  (wire24[(2'h3):(1'h1)] ?
                      ($unsigned((8'haf)) ^~ $unsigned((8'hbf))) : (wire23[(4'hc):(4'h8)] ?
                          (wire27 ?
                              wire26 : reg30) : $unsigned(reg32))) : ({(~wire26),
                      ((8'hae) == wire27)} && wire24[(4'hb):(3'h6)])) ?
              reg29 : $signed($unsigned($unsigned(wire28[(2'h3):(2'h3)]))));
        end
      else
        begin
          if (reg29)
            begin
              reg34 <= (((!$signed((!reg30))) ?
                  {reg34[(2'h3):(1'h1)],
                      ((8'hb1) ?
                          reg34 : (~|(8'hb9)))} : $signed($unsigned($unsigned(wire21)))) & $signed((!(wire22 != $signed(wire27)))));
              reg35 <= $unsigned(({$unsigned(wire26[(2'h2):(2'h2)]),
                      $signed(reg29[(4'hc):(3'h7)])} ?
                  (~|(~&$unsigned(reg33))) : reg32));
            end
          else
            begin
              reg34 <= ({{(~(8'ha4))}} ?
                  reg32 : $unsigned({$signed($unsigned(wire25)),
                      ((reg31 ? wire26 : reg35) >= reg31[(1'h0):(1'h0)])}));
              reg35 <= reg33;
              reg36 <= ((~^wire21) ? wire23[(3'h7):(3'h5)] : wire24);
              reg37 <= (reg33[(4'hc):(3'h7)] ?
                  $signed(reg33) : $unsigned($signed({reg29})));
              reg38 <= $signed(((~|$signed(wire27[(2'h2):(1'h0)])) <<< $unsigned($signed(reg32[(1'h1):(1'h1)]))));
            end
          reg39 <= {($signed(wire23[(1'h1):(1'h0)]) ?
                  $signed((|((8'haa) ? reg30 : (8'hbe)))) : {{(wire27 <= reg37),
                          $signed(wire26)}})};
        end
    end
  assign wire40 = $unsigned((wire21 >> (^{((8'ha7) ? reg36 : reg38),
                      (wire26 != reg35)})));
  assign wire41 = ({wire24} <<< ((reg35 <<< ($signed(reg31) >> reg38[(2'h2):(2'h2)])) ?
                      $signed((!(8'had))) : {((|wire24) * (reg38 && reg30)),
                          reg37}));
  assign wire42 = ((~&reg30[(2'h2):(1'h0)]) <<< {$unsigned(reg38[(1'h1):(1'h1)]),
                      reg35});
endmodule
