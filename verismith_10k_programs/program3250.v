module top
#(parameter param128 = {({(~(-(8'ha1)))} >> {(((8'ha8) != (8'hba)) >>> ((8'h9d) && (8'had))), (-((8'hb1) ? (8'hb2) : (8'hb6)))}), (+((((8'ha5) >> (8'hac)) < ((8'hb1) << (8'h9d))) | (^~((7'h42) ? (8'ha1) : (8'ha4)))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h2dd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire126;
  wire [(5'h15):(1'h0)] wire66;
  wire [(2'h3):(1'h0)] wire37;
  wire signed [(5'h13):(1'h0)] wire36;
  wire [(5'h13):(1'h0)] wire35;
  wire [(3'h7):(1'h0)] wire34;
  wire signed [(3'h7):(1'h0)] wire27;
  wire signed [(2'h3):(1'h0)] wire26;
  wire [(4'h8):(1'h0)] wire24;
  wire signed [(3'h4):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  reg [(4'hf):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg33 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(3'h5):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg41 = (1'h0);
  reg [(4'h8):(1'h0)] reg42 = (1'h0);
  reg [(3'h6):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(5'h10):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg46 = (1'h0);
  reg [(4'h9):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg49 = (1'h0);
  reg [(3'h4):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg54 = (1'h0);
  reg [(2'h2):(1'h0)] reg55 = (1'h0);
  reg [(4'h9):(1'h0)] reg56 = (1'h0);
  reg [(5'h12):(1'h0)] reg57 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg [(5'h11):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg61 = (1'h0);
  reg [(3'h7):(1'h0)] reg62 = (1'h0);
  reg [(5'h11):(1'h0)] reg63 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(3'h7):(1'h0)] reg65 = (1'h0);
  assign y = {wire126,
                 wire66,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire27,
                 wire26,
                 wire24,
                 wire22,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg23,
                 reg25,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 (1'h0)};
  assign wire5 = (&wire2[(4'hd):(4'h9)]);
  assign wire6 = {$signed((^wire4[(4'hd):(1'h0)]))};
  assign wire7 = wire2[(1'h0):(1'h0)];
  assign wire8 = (~((8'hb9) >>> wire7));
  always
    @(posedge clk) begin
      reg9 <= wire1[(3'h7):(3'h5)];
      reg10 <= wire0;
      if ({(~^(8'had)),
          (((wire8 <= wire1[(1'h1):(1'h0)]) >>> (~wire8)) ?
              ({wire2} ?
                  $unsigned(reg10) : wire5[(4'hc):(1'h1)]) : $unsigned({wire5,
                  (wire7 | wire2)}))})
        begin
          if ((($signed((^~wire5)) << $unsigned(reg10)) ^~ ((((wire8 & wire3) ^~ $signed((8'h9f))) && $signed(((8'ha1) == reg10))) ?
              wire2 : $signed(wire3[(3'h5):(2'h3)]))))
            begin
              reg11 <= (~(reg9 >= (wire7 ? reg9 : $unsigned((8'hac)))));
              reg12 <= $signed(wire4[(4'ha):(3'h5)]);
              reg13 <= ((!{reg11}) > $signed($unsigned((reg10[(5'h10):(4'hc)] ?
                  (reg11 & wire4) : wire2))));
              reg14 <= $unsigned(wire1);
              reg15 <= ((^(+((+reg13) ?
                  (reg13 != (8'h9d)) : $unsigned(reg14)))) << reg13[(4'h8):(1'h0)]);
            end
          else
            begin
              reg11 <= $unsigned(reg12);
              reg12 <= (^reg9);
            end
          reg16 <= wire0[(3'h4):(3'h4)];
          if (wire1)
            begin
              reg17 <= reg9;
              reg18 <= ({(~(~reg16[(1'h1):(1'h1)])),
                  wire3} || reg9[(3'h5):(3'h5)]);
              reg19 <= reg16[(3'h4):(2'h3)];
            end
          else
            begin
              reg17 <= (7'h43);
              reg18 <= $unsigned((wire2[(3'h5):(1'h1)] << wire1));
              reg19 <= reg15[(4'hd):(4'hb)];
            end
        end
      else
        begin
          reg11 <= (~&reg19);
          if ((wire6[(2'h2):(2'h2)] ^~ $signed((-$unsigned(wire2)))))
            begin
              reg12 <= (-($signed($signed(((8'hb1) ?
                  reg18 : reg14))) || ($signed({reg15, wire3}) ^ (8'ha2))));
              reg13 <= (wire1 ?
                  $unsigned((~^(reg10 * {(8'hb9)}))) : $signed(reg18));
              reg14 <= ((^~(((+(7'h43)) ? (wire4 && (8'ha8)) : {wire8, wire3}) ?
                      {{(8'hac), reg10}, wire4[(2'h2):(2'h2)]} : {(reg11 ?
                              reg14 : (8'hb8)),
                          wire4[(4'hb):(4'hb)]})) ?
                  $unsigned(reg11) : $unsigned((~&(wire0[(3'h5):(2'h3)] ?
                      {wire8} : (8'h9e)))));
              reg15 <= $signed(($signed((|{reg14, reg15})) ?
                  reg9[(4'ha):(1'h1)] : reg14[(2'h3):(1'h1)]));
            end
          else
            begin
              reg12 <= reg12;
              reg13 <= wire8;
              reg14 <= (&wire3);
            end
          reg16 <= {({(wire2[(1'h1):(1'h0)] ?
                      (~&reg11) : (~^wire3))} && (8'h9c)),
              (^~reg13)};
          reg17 <= ((+reg9) || ({$signed(wire7)} ?
              ($unsigned((8'had)) ?
                  (wire4[(3'h6):(3'h6)] ?
                      $signed(reg19) : (~&reg9)) : reg16[(4'h8):(3'h4)]) : (~|$signed((wire3 > reg13)))));
        end
      reg20 <= ({((reg19 - (wire6 >= wire5)) && ((reg11 != wire7) ?
              $signed(reg17) : wire0[(3'h5):(3'h4)]))} ^ (|$signed((+reg16[(1'h0):(1'h0)]))));
      reg21 <= wire0[(1'h1):(1'h1)];
    end
  assign wire22 = (8'hb2);
  always
    @(posedge clk) begin
      reg23 <= {wire8[(3'h5):(2'h2)],
          $signed(($unsigned((reg11 ^ wire22)) ?
              wire1[(2'h2):(1'h0)] : wire7))};
    end
  assign wire24 = $signed({(reg9[(1'h1):(1'h0)] ^ $signed((reg11 & wire1)))});
  always
    @(posedge clk) begin
      reg25 <= reg13[(4'hb):(3'h6)];
    end
  assign wire26 = (wire5[(4'he):(2'h3)] == $unsigned(reg14[(4'he):(3'h4)]));
  assign wire27 = {reg9[(3'h6):(3'h5)],
                      ({(8'hb7), wire6[(3'h4):(1'h0)]} ?
                          wire5[(1'h0):(1'h0)] : (((wire6 ? reg9 : reg16) ?
                              reg12 : $signed(reg17)) >>> (^reg11)))};
  always
    @(posedge clk) begin
      reg28 <= $unsigned($signed($unsigned(wire6[(2'h2):(1'h1)])));
      if ({(-((+reg28[(3'h5):(1'h1)]) < ($signed(reg20) ?
              (wire7 ? reg9 : wire3) : $signed(reg14)))),
          (~&((!(reg10 ? reg16 : wire4)) - (wire27 != {reg25, (8'h9e)})))})
        begin
          reg29 <= $unsigned((|(!reg25[(1'h1):(1'h1)])));
        end
      else
        begin
          reg29 <= $signed(reg9[(4'hc):(2'h2)]);
          reg30 <= (wire3 * reg16[(2'h2):(2'h2)]);
          reg31 <= ($unsigned((((8'hae) ^~ $signed(wire0)) ?
              $signed((~|reg29)) : (!reg10[(3'h4):(3'h4)]))) - $unsigned((((reg14 ?
                      reg16 : wire8) ?
                  reg23 : (reg28 ? (7'h42) : reg19)) ?
              reg19 : reg17)));
          reg32 <= (~^reg13);
          reg33 <= {reg29[(4'ha):(3'h6)]};
        end
    end
  assign wire34 = reg16[(3'h5):(2'h3)];
  assign wire35 = (8'hae);
  assign wire36 = ($signed($signed((~^(~wire22)))) * (wire27[(1'h0):(1'h0)] ?
                      $unsigned({$signed(wire8),
                          (reg18 >> reg13)}) : reg17[(5'h14):(5'h12)]));
  assign wire37 = wire1;
  always
    @(posedge clk) begin
      reg38 <= $signed(($unsigned((~^$signed(wire37))) ?
          (((wire0 | wire27) ?
                  ((8'hb5) ? wire22 : wire2) : $unsigned((8'hb5))) ?
              $unsigned((~&wire24)) : ({wire6, wire6} ?
                  $signed(wire22) : (wire36 < (8'haf)))) : (8'hbf)));
      if ({({(!{wire26, wire22}),
              (wire6[(2'h2):(1'h0)] ?
                  wire34[(3'h6):(2'h3)] : $unsigned(wire37))} && (~|$signed($unsigned(wire4))))})
        begin
          reg39 <= (((&(reg28[(3'h5):(1'h1)] + ((8'ha6) ?
                  wire5 : reg15))) >= ((~&{(7'h42),
                  wire37}) || (wire36 | $unsigned(reg15)))) ?
              reg9[(3'h4):(1'h1)] : {{{reg12, (^reg23)},
                      ({reg30, wire2} << $signed(reg19))},
                  (+{(reg33 >>> reg19)})});
          reg40 <= ($unsigned((wire22 ?
                  ($signed(reg31) <= $unsigned(reg19)) : wire1[(1'h1):(1'h0)])) ?
              $signed(($unsigned(wire35[(3'h7):(2'h3)]) <= ((^~reg18) >= {wire5}))) : ((wire34 ?
                      (&(reg18 == reg16)) : reg29[(4'hd):(4'h9)]) ?
                  reg19 : $signed((&wire3[(4'h8):(2'h2)]))));
          if (({$unsigned((8'ha2))} <= $signed($unsigned({$signed((8'ha7))}))))
            begin
              reg41 <= reg38;
              reg42 <= ((~{(&(reg13 >> wire26))}) ?
                  reg23[(1'h1):(1'h0)] : (($signed((reg12 > (7'h44))) ?
                          reg17 : ({(8'ha2)} && (~&reg17))) ?
                      $unsigned($unsigned((wire36 ?
                          reg40 : reg14))) : $signed((|reg23))));
              reg43 <= wire6[(1'h0):(1'h0)];
              reg44 <= $unsigned(wire5);
              reg45 <= {(reg16 != reg15)};
            end
          else
            begin
              reg41 <= $unsigned({(wire0 < ((wire24 ? wire34 : reg42) ?
                      (reg39 ? reg19 : reg45) : wire1))});
              reg42 <= ((-reg25) ?
                  $signed($signed((reg15 ^ reg28[(4'h8):(3'h7)]))) : (((8'hb3) ?
                          (&(reg9 ? reg21 : reg42)) : ($unsigned(reg21) ?
                              $signed(reg9) : (reg17 ? reg15 : reg38))) ?
                      $unsigned(((^~reg10) != $unsigned(reg38))) : $signed((+wire24))));
              reg43 <= wire6[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg39 <= $unsigned((8'h9c));
        end
      reg46 <= ((8'ha2) << $signed(($signed((reg14 >= reg45)) * (&wire5[(3'h4):(3'h4)]))));
      reg47 <= (-((wire27[(3'h4):(2'h3)] ?
          $unsigned($unsigned(reg40)) : $unsigned($unsigned((8'hba)))) <= (({reg10,
              reg43} ?
          reg29 : (reg20 || wire35)) == reg10)));
    end
  always
    @(posedge clk) begin
      if ($unsigned(reg19[(3'h4):(1'h1)]))
        begin
          reg48 <= {(8'hbc)};
          if ($signed((|$signed($unsigned($unsigned(reg40))))))
            begin
              reg49 <= reg38;
              reg50 <= (8'hb0);
              reg51 <= $unsigned($unsigned($unsigned($unsigned(reg19[(4'hb):(3'h4)]))));
              reg52 <= (|(+reg25[(2'h2):(2'h2)]));
            end
          else
            begin
              reg49 <= ($unsigned((((!wire7) ?
                  ((8'h9f) * reg15) : wire36[(5'h10):(1'h1)]) ~^ $signed(((8'hbc) ?
                  wire0 : reg43)))) || $signed(reg41));
              reg50 <= (&reg14[(4'ha):(2'h3)]);
              reg51 <= ((reg38[(4'hb):(3'h4)] ?
                  $unsigned(reg16) : reg10) * ((~^(reg50[(2'h2):(1'h1)] ?
                  reg25 : wire37)) ^ reg17));
              reg52 <= reg25[(1'h0):(1'h0)];
              reg53 <= (+$unsigned((({wire3, (8'h9d)} >= $unsigned(reg20)) ?
                  reg28 : (wire8 ? reg29[(4'ha):(3'h4)] : reg14))));
            end
          if ((($unsigned(reg21) & reg19) ?
              (reg23 ?
                  (~&$signed($unsigned(reg40))) : (wire35 >>> wire22[(2'h2):(2'h2)])) : (^(^~{(reg48 ?
                      wire37 : wire35),
                  (wire4 ? reg29 : reg52)}))))
            begin
              reg54 <= (~|(reg14 <= reg23[(2'h2):(1'h1)]));
            end
          else
            begin
              reg54 <= (^~$unsigned(reg18[(5'h14):(4'he)]));
              reg55 <= ($signed((wire8[(4'hc):(4'hb)] ^~ (|(~&reg30)))) || reg43[(3'h4):(1'h1)]);
              reg56 <= ($unsigned($signed($unsigned((&reg38)))) > (~^wire2[(2'h2):(1'h1)]));
            end
          reg57 <= reg42[(3'h7):(2'h2)];
        end
      else
        begin
          reg48 <= $unsigned($signed(((8'hb1) || $unsigned({reg39, wire4}))));
          reg49 <= ((|wire7[(1'h0):(1'h0)]) != $signed(wire1[(3'h7):(2'h2)]));
          reg50 <= ((reg53 >> {{reg56[(3'h6):(2'h3)], $unsigned(wire26)}}) ?
              $signed((8'hae)) : (reg16 | ($signed((~reg48)) && (wire35 - (reg50 ?
                  reg49 : reg39)))));
          reg51 <= $signed((+reg30));
        end
      if ($signed(((^(-reg15[(4'h8):(3'h4)])) | wire8)))
        begin
          reg58 <= $unsigned((((-wire24[(3'h5):(2'h2)]) ?
                  (reg53 ?
                      (wire6 ?
                          reg31 : reg48) : $unsigned(reg30)) : (reg28[(3'h4):(2'h2)] ?
                      (reg9 ? reg38 : reg33) : (reg18 ? reg40 : wire37))) ?
              (reg31[(1'h1):(1'h1)] >>> (reg41[(1'h0):(1'h0)] ?
                  $signed(reg46) : (reg53 ?
                      reg41 : (7'h42)))) : (reg28 >= {reg52})));
          if (reg30[(1'h0):(1'h0)])
            begin
              reg59 <= (($unsigned((reg48[(2'h2):(2'h2)] + (!reg40))) > (7'h44)) * (^(($signed(wire37) * (reg58 ?
                      reg55 : reg17)) ?
                  $signed(((8'ha7) ? wire2 : reg43)) : wire26[(2'h2):(2'h2)])));
              reg60 <= reg10[(5'h15):(5'h15)];
            end
          else
            begin
              reg59 <= reg50;
              reg60 <= ((!({$signed(wire1)} ?
                  ((reg40 ^ reg47) - {reg9}) : ((|reg25) >= reg58[(4'ha):(4'h9)]))) + ($signed((~|reg13[(3'h7):(3'h4)])) ?
                  (reg54 ?
                      (reg14[(4'h8):(1'h1)] & wire36[(4'hd):(3'h5)]) : (+(^~wire2))) : ($signed((~|reg46)) == ((-reg13) | $unsigned(reg11)))));
            end
          reg61 <= $signed($signed((8'ha2)));
          reg62 <= (((($unsigned(wire6) & wire1) ?
                  $signed((reg44 ?
                      reg25 : reg16)) : $unsigned((&wire3))) >>> (!wire2[(4'hc):(4'h9)])) ?
              reg43 : $unsigned(((((7'h42) >> wire36) && (reg32 ?
                  reg32 : (8'hb5))) | reg46)));
        end
      else
        begin
          reg58 <= wire24[(2'h3):(2'h2)];
          reg59 <= $unsigned($unsigned($signed($signed(reg51[(2'h2):(2'h2)]))));
          reg60 <= ({$signed($signed($unsigned(reg58)))} ?
              ($unsigned(reg61) && (wire22[(3'h4):(1'h1)] ?
                  reg49 : reg32[(4'h8):(3'h5)])) : wire5[(3'h7):(2'h2)]);
          reg61 <= (8'hb5);
          reg62 <= reg21[(2'h2):(2'h2)];
        end
      if ((((-$unsigned($signed(reg56))) ? reg42 : $unsigned(reg40)) ?
          $signed({reg9[(4'he):(4'hc)],
              (~^$signed(wire5))}) : (reg29[(4'ha):(2'h2)] ?
              (($unsigned(reg13) ?
                  $unsigned(reg61) : $unsigned(reg23)) > (-{reg52})) : (!reg30[(1'h0):(1'h0)]))))
        begin
          reg63 <= {$signed(reg21[(3'h5):(1'h1)])};
          reg64 <= wire7[(3'h5):(2'h3)];
          reg65 <= $unsigned((~^$unsigned(reg19)));
        end
      else
        begin
          if (reg45[(4'he):(3'h6)])
            begin
              reg63 <= $signed(reg15);
              reg64 <= ($signed(reg21) <<< (~&($signed(reg64) ?
                  $signed(wire3[(3'h4):(2'h3)]) : reg19[(4'ha):(3'h4)])));
            end
          else
            begin
              reg63 <= {reg43,
                  {$unsigned({(wire34 ? reg10 : wire0), (~^reg31)}),
                      (~(^(reg28 ? reg21 : (8'hac))))}};
              reg64 <= (!$signed((7'h43)));
            end
          reg65 <= {$unsigned(((|(wire24 ? wire34 : (8'ha6))) ?
                  (reg55[(1'h0):(1'h0)] * reg65[(1'h0):(1'h0)]) : $unsigned(reg59)))};
        end
    end
  assign wire66 = ((&($unsigned(wire26) ?
                          $signed(reg17) : (^~reg39[(5'h11):(4'hc)]))) ?
                      ((|reg18[(4'he):(4'he)]) < $signed(wire24[(1'h0):(1'h0)])) : (^(($signed(wire3) ?
                          (+reg59) : reg31[(2'h3):(1'h1)]) || (^{reg50}))));
  module67 #() modinst127 (.wire71(wire1), .clk(clk), .y(wire126), .wire68(reg10), .wire72(reg20), .wire69(reg14), .wire70(wire36));
endmodule

module module67
#(parameter param125 = (^{(+(((8'h9f) > (8'hb9)) || (-(8'hba)))), (+(((8'hb4) ~^ (8'hb8)) ? (!(8'ha4)) : ((8'hac) * (8'had))))}))
(y, clk, wire68, wire69, wire70, wire71, wire72);
  output wire [(32'had):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire68;
  input wire [(4'he):(1'h0)] wire69;
  input wire signed [(5'h13):(1'h0)] wire70;
  input wire signed [(2'h2):(1'h0)] wire71;
  input wire [(4'h9):(1'h0)] wire72;
  wire signed [(5'h13):(1'h0)] wire73;
  wire [(4'h9):(1'h0)] wire74;
  wire signed [(5'h12):(1'h0)] wire75;
  wire [(4'ha):(1'h0)] wire78;
  wire signed [(4'hd):(1'h0)] wire79;
  wire signed [(3'h5):(1'h0)] wire80;
  wire [(4'hf):(1'h0)] wire81;
  wire signed [(5'h13):(1'h0)] wire82;
  wire [(5'h10):(1'h0)] wire83;
  wire signed [(5'h12):(1'h0)] wire123;
  reg signed [(5'h10):(1'h0)] reg76 = (1'h0);
  reg [(4'he):(1'h0)] reg77 = (1'h0);
  assign y = {wire73,
                 wire74,
                 wire75,
                 wire78,
                 wire79,
                 wire80,
                 wire81,
                 wire82,
                 wire83,
                 wire123,
                 reg76,
                 reg77,
                 (1'h0)};
  assign wire73 = ((wire70 ? wire68[(4'hc):(3'h6)] : {wire72[(1'h0):(1'h0)]}) ?
                      $unsigned($unsigned($signed({wire68}))) : $unsigned(wire71));
  assign wire74 = wire73;
  assign wire75 = wire70[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg76 <= (wire72[(4'h9):(1'h0)] ~^ (((wire75 ?
                  (wire73 <<< wire74) : $signed(wire70)) ?
              {(wire71 != wire68)} : $unsigned(wire75)) ?
          (~$unsigned(wire68[(1'h0):(1'h0)])) : {$signed({(8'hb5), wire73}),
              $unsigned($unsigned(wire70))}));
      reg77 <= (wire69 ? wire69 : wire75[(3'h6):(3'h5)]);
    end
  assign wire78 = (((wire71 ? wire74 : ((8'ha4) >>> (wire72 >= (8'hba)))) ?
                          $signed(wire73[(4'ha):(4'ha)]) : (wire73 && (wire75 ?
                              (wire73 || (8'haf)) : (^~(8'hb5))))) ?
                      (wire73[(4'he):(3'h5)] >>> (!wire71)) : {$unsigned($unsigned((wire70 & wire75)))});
  assign wire79 = wire69;
  assign wire80 = (&$unsigned($unsigned(wire73[(4'hc):(4'ha)])));
  assign wire81 = $unsigned((wire70 || $signed((((8'h9e) ? (8'hbd) : wire72) ?
                      (7'h40) : $unsigned((8'hbc))))));
  assign wire82 = $signed($unsigned((($signed(wire70) >>> (8'hb0)) ?
                      (-$signed(wire68)) : wire73)));
  assign wire83 = {{(wire72 + $signed(((8'ha3) != wire71))), wire71},
                      wire68[(1'h0):(1'h0)]};
  module84 #() modinst124 (.y(wire123), .wire87(wire70), .wire88(reg77), .wire85(wire79), .wire86(wire68), .clk(clk));
endmodule

module module84
#(parameter param121 = {(~^{({(8'hae)} != ((8'hb6) ? (8'hb4) : (8'had)))}), ((^~(((8'h9d) ? (8'ha7) : (8'ha7)) ? (^~(8'had)) : ((8'ha5) ~^ (8'hbf)))) ? (~&(8'hac)) : (&((~(8'hbc)) ? {(7'h40), (8'hb1)} : (|(8'hbc)))))}, 
parameter param122 = param121)
(y, clk, wire88, wire87, wire86, wire85);
  output wire [(32'h192):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire88;
  input wire signed [(5'h13):(1'h0)] wire87;
  input wire signed [(4'hb):(1'h0)] wire86;
  input wire signed [(4'hd):(1'h0)] wire85;
  wire signed [(5'h11):(1'h0)] wire120;
  wire signed [(5'h13):(1'h0)] wire119;
  wire signed [(4'h8):(1'h0)] wire118;
  wire [(5'h11):(1'h0)] wire105;
  wire signed [(4'hd):(1'h0)] wire94;
  wire [(5'h13):(1'h0)] wire93;
  wire [(4'hd):(1'h0)] wire92;
  wire signed [(3'h7):(1'h0)] wire91;
  wire signed [(5'h11):(1'h0)] wire90;
  reg [(5'h11):(1'h0)] reg117 = (1'h0);
  reg [(5'h10):(1'h0)] reg116 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg115 = (1'h0);
  reg [(5'h14):(1'h0)] reg114 = (1'h0);
  reg [(2'h2):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg112 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg111 = (1'h0);
  reg [(5'h12):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg108 = (1'h0);
  reg [(2'h3):(1'h0)] reg107 = (1'h0);
  reg [(4'h8):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg103 = (1'h0);
  reg [(5'h12):(1'h0)] reg102 = (1'h0);
  reg [(4'h8):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg100 = (1'h0);
  reg [(4'h8):(1'h0)] reg99 = (1'h0);
  reg [(5'h11):(1'h0)] reg98 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg97 = (1'h0);
  reg [(4'hf):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg95 = (1'h0);
  reg [(5'h13):(1'h0)] reg89 = (1'h0);
  assign y = {wire120,
                 wire119,
                 wire118,
                 wire105,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg89,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg89 <= $unsigned($signed($signed(((8'ha5) ? wire85 : wire88))));
    end
  assign wire90 = $signed((&{reg89, $unsigned((wire87 ^~ wire85))}));
  assign wire91 = ((~&($signed($unsigned(wire90)) ?
                      ((wire87 ^ wire87) ?
                          (reg89 ?
                              (8'hba) : reg89) : wire88) : reg89[(5'h12):(5'h12)])) ^ wire85[(4'ha):(2'h2)]);
  assign wire92 = $signed(wire86);
  assign wire93 = (|{wire92});
  assign wire94 = $signed($unsigned((((~&wire93) >>> (wire93 || wire87)) + ($signed(wire93) ?
                      $unsigned(wire92) : $unsigned(wire92)))));
  always
    @(posedge clk) begin
      reg95 <= wire91;
      reg96 <= ((wire94[(3'h5):(2'h2)] << (^(-$unsigned(wire92)))) ?
          wire88 : $signed(wire91));
      if ($unsigned($signed(wire92)))
        begin
          reg97 <= (reg89[(4'hb):(3'h7)] <= (reg96[(3'h5):(2'h2)] < (~|{(reg96 ^~ wire85)})));
        end
      else
        begin
          reg97 <= (($signed((-(wire91 ?
              (8'haf) : wire85))) > ({wire92[(4'ha):(1'h0)],
              wire92} && wire87[(4'h8):(4'h8)])) | wire92[(2'h3):(2'h3)]);
          if (wire90)
            begin
              reg98 <= ((wire85[(2'h2):(2'h2)] ?
                  (+{$signed((8'ha4)),
                      ((8'hb9) <= reg95)}) : wire93) == $signed($unsigned((reg96[(2'h3):(2'h3)] ?
                  (reg97 << reg89) : $signed((8'hae))))));
              reg99 <= wire87[(5'h13):(3'h5)];
              reg100 <= wire88[(1'h1):(1'h0)];
              reg101 <= (($signed({{reg99, reg98}}) && (8'haa)) ?
                  $unsigned(($unsigned($signed(reg100)) >> $signed({wire92,
                      wire91}))) : ($unsigned($signed((wire94 ?
                      wire93 : reg96))) && $signed(wire94[(4'h8):(3'h4)])));
              reg102 <= ($signed(wire92) ?
                  wire86[(4'hb):(2'h2)] : (($unsigned({wire85}) ?
                      ($signed(reg96) ?
                          $unsigned(wire88) : wire85) : wire87[(2'h2):(2'h2)]) <<< {{reg97,
                          $signed(reg89)},
                      $signed(wire94)}));
            end
          else
            begin
              reg98 <= (wire87[(4'he):(4'hc)] ~^ ((^$signed(((8'hbd) ?
                  (8'hb6) : wire92))) | $signed($signed(reg89))));
              reg99 <= reg100;
              reg100 <= $signed(($unsigned((~|$signed(wire92))) ?
                  {wire91,
                      $unsigned($signed(wire87))} : (!(~$signed((7'h44))))));
              reg101 <= ($unsigned($signed(reg100)) >= wire94[(2'h3):(1'h0)]);
              reg102 <= (-(^~reg99[(3'h6):(3'h4)]));
            end
          reg103 <= $unsigned(($signed(reg98) >> $unsigned($unsigned(reg96))));
          if ($unsigned($signed((+{$signed(reg97)}))))
            begin
              reg104 <= $unsigned((reg97 ?
                  $unsigned(wire85[(4'ha):(4'ha)]) : $unsigned(wire87[(4'ha):(3'h5)])));
            end
          else
            begin
              reg104 <= (7'h42);
            end
        end
    end
  assign wire105 = (($unsigned(($unsigned(wire88) != wire86)) || {(&(|reg104)),
                       ((7'h41) ?
                           $signed(reg101) : $signed(reg102))}) + wire86);
  always
    @(posedge clk) begin
      if ($unsigned((!(~&(|wire93[(4'hb):(4'h9)])))))
        begin
          reg106 <= $unsigned($unsigned($unsigned(((wire85 ?
              reg95 : reg98) <= (reg104 | wire91)))));
          reg107 <= (8'ha3);
          reg108 <= wire91;
          reg109 <= $signed((((8'ha3) != wire88) - wire88[(1'h1):(1'h0)]));
          if ($signed({$signed((8'hb4)),
              $signed(((reg102 >> reg104) ? {reg107} : $signed(wire105)))}))
            begin
              reg110 <= wire88;
              reg111 <= ({(({reg89, (8'hbb)} ?
                          wire105[(2'h2):(1'h0)] : wire94[(4'ha):(4'h9)]) ?
                      $unsigned(wire91) : wire85[(2'h2):(1'h0)])} >= (wire87[(4'hb):(1'h1)] & (|$signed((reg98 - reg97)))));
            end
          else
            begin
              reg110 <= $unsigned(wire87[(4'hd):(2'h3)]);
              reg111 <= wire93[(2'h3):(2'h2)];
              reg112 <= reg97;
              reg113 <= ((reg110[(4'he):(4'ha)] ?
                  (((+wire93) ?
                      (wire93 ?
                          wire85 : reg102) : reg100[(2'h3):(1'h0)]) ^ reg107[(1'h0):(1'h0)]) : ($unsigned(reg101) ?
                      ((wire93 & (8'hbb)) ?
                          wire85 : (reg106 ^ reg112)) : $signed((-(8'hbc))))) << ((&wire86) + (~&($signed(reg97) == $unsigned((8'hb8))))));
            end
        end
      else
        begin
          reg106 <= $unsigned(($unsigned($signed((reg112 - wire105))) ~^ {wire93}));
        end
      reg114 <= ($unsigned($unsigned(reg96)) ^~ {wire93[(4'h8):(2'h2)],
          reg109});
    end
  always
    @(posedge clk) begin
      reg115 <= ($signed(((reg108 ?
          reg97 : $unsigned(reg114)) >= (~&(wire88 | (8'hba))))) * ((~|wire105[(5'h11):(4'he)]) ?
          $unsigned(wire105) : {((^wire93) || (7'h41))}));
      reg116 <= wire93;
      reg117 <= wire90[(5'h11):(1'h0)];
    end
  assign wire118 = $signed(reg109);
  assign wire119 = $unsigned({({(8'hb4)} ?
                           ((!wire94) ?
                               (reg104 ?
                                   wire88 : reg111) : ((8'hbb) >>> reg100)) : $signed(reg89)),
                       $unsigned((wire87 ?
                           (~|wire105) : reg110[(4'hb):(4'ha)]))});
  assign wire120 = $signed({$signed(reg113)});
endmodule
