module top
#(parameter param59 = (((((|(8'ha2)) ? ((8'h9c) ? (8'hab) : (8'hae)) : ((8'h9d) ? (8'ha4) : (8'hb0))) ? (((8'h9d) & (8'hb7)) ? ((8'hb0) ? (7'h44) : (8'hb7)) : ((8'hb0) ? (8'ha4) : (8'haa))) : (((8'ha9) ^~ (8'h9c)) ? ((8'hb0) >>> (8'hb3)) : ((8'haa) << (7'h41)))) ? (~(((7'h43) | (8'ha2)) ^~ ((8'hb6) ~^ (8'had)))) : ((~|((8'hbf) ? (7'h42) : (8'ha7))) ~^ (((8'hbe) ? (8'hb3) : (8'haf)) >>> ((8'hb2) ? (8'hbb) : (8'hac))))) ? (((((8'ha5) ? (8'ha1) : (8'ha2)) >> ((8'hb1) && (8'hb0))) >>> ({(8'hb9), (8'hb8)} <<< (8'ha7))) ~^ (((^~(8'ha2)) || {(8'hbe), (8'hb3)}) != (((8'hb2) < (8'h9f)) > {(8'hae)}))) : (({{(8'h9c)}, ((7'h41) ? (8'ha5) : (7'h40))} <= (((8'h9d) <= (8'ha4)) > ((8'hb2) + (7'h44)))) <<< {(((8'h9e) <<< (7'h40)) ^ ((8'h9f) > (7'h40)))})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h270):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire4;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire58;
  wire [(5'h15):(1'h0)] wire57;
  wire signed [(3'h7):(1'h0)] wire56;
  wire [(4'he):(1'h0)] wire55;
  wire signed [(4'hc):(1'h0)] wire36;
  wire signed [(4'ha):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire29;
  wire signed [(5'h11):(1'h0)] wire28;
  wire [(3'h5):(1'h0)] wire24;
  reg signed [(4'ha):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg53 = (1'h0);
  reg [(3'h5):(1'h0)] reg52 = (1'h0);
  reg [(4'hb):(1'h0)] reg51 = (1'h0);
  reg [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg47 = (1'h0);
  reg [(4'he):(1'h0)] reg46 = (1'h0);
  reg [(2'h3):(1'h0)] reg45 = (1'h0);
  reg [(4'ha):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg [(3'h6):(1'h0)] reg42 = (1'h0);
  reg [(5'h11):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg32 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(2'h2):(1'h0)] reg5 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire36,
                 wire30,
                 wire29,
                 wire28,
                 wire24,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
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
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg27,
                 reg26,
                 reg25,
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
  always
    @(posedge clk) begin
      if (($signed($unsigned(((~wire3) ? wire3 : wire1))) ?
          (wire4[(1'h0):(1'h0)] + {wire2,
              $unsigned((|wire4))}) : $unsigned($signed(wire3[(2'h2):(2'h2)]))))
        begin
          reg5 <= {{(((&wire3) > (wire0 ?
                      wire4 : wire4)) <= ((wire4 ^ wire3) >= $signed(wire0))),
                  ((((8'ha4) * (8'hbc)) | (&wire1)) ? (8'hbd) : wire0)},
              wire3[(4'h8):(2'h2)]};
          reg6 <= wire0[(4'hc):(4'hb)];
          if ($signed(wire1[(4'hd):(4'h8)]))
            begin
              reg7 <= (&($signed($unsigned((wire0 ?
                  wire1 : wire1))) >>> (reg6[(1'h1):(1'h0)] ?
                  (^~wire1) : wire3)));
              reg8 <= wire4;
              reg9 <= (~((-$unsigned(wire1[(4'h9):(2'h3)])) <= reg5[(1'h0):(1'h0)]));
              reg10 <= wire4[(1'h0):(1'h0)];
            end
          else
            begin
              reg7 <= (reg6 ?
                  $unsigned(((8'hb0) ^~ $signed($unsigned(wire2)))) : $signed(((((8'hbb) & wire4) >= wire3) && reg9)));
            end
          if (reg8)
            begin
              reg11 <= $unsigned(($signed(((reg8 ? reg10 : wire1) ?
                      {wire0} : $unsigned((8'h9f)))) ?
                  {reg7} : {(~&(wire2 ^~ reg10))}));
            end
          else
            begin
              reg11 <= (((~((^~reg7) <= reg6[(2'h2):(2'h2)])) ?
                      wire3[(1'h1):(1'h1)] : ({(reg7 <= reg8)} ?
                          (|reg5) : ((~&reg10) >= (reg5 != wire3)))) ?
                  $signed(($unsigned($unsigned(reg7)) << (|(wire1 ?
                      reg11 : reg6)))) : (!$signed((~^{reg6}))));
            end
          if ((((~|$signed((reg9 ? wire3 : reg8))) ?
                  (((wire4 ? reg5 : reg8) ?
                      wire4 : ((8'ha3) && wire0)) | (reg10 != $signed(reg5))) : $signed(((reg7 <<< reg9) <= (reg7 ?
                      (8'ha2) : wire2)))) ?
              reg10 : reg8))
            begin
              reg12 <= reg8[(4'hb):(4'h8)];
              reg13 <= (~^(wire3[(1'h1):(1'h0)] ?
                  (((wire0 << wire4) ?
                      $signed(reg12) : $unsigned(reg6)) & $signed((8'hab))) : reg6));
            end
          else
            begin
              reg12 <= reg5[(2'h2):(1'h0)];
            end
        end
      else
        begin
          reg5 <= ($signed(($unsigned(reg13[(3'h7):(3'h6)]) ^~ reg9)) <= $unsigned((($signed(reg8) < wire0[(1'h0):(1'h0)]) ^~ (wire4[(3'h5):(3'h5)] ?
              {(8'hac)} : (reg8 ? (8'haf) : reg5)))));
          if ((!reg5[(2'h2):(1'h0)]))
            begin
              reg6 <= {$signed((reg7[(4'hf):(3'h4)] ?
                      $unsigned(wire3[(2'h3):(2'h2)]) : $signed(reg6[(3'h4):(1'h1)])))};
              reg7 <= reg7[(1'h0):(1'h0)];
              reg8 <= {{reg12},
                  ((~&($signed(wire4) <<< $unsigned(reg5))) ?
                      $unsigned(reg7) : $unsigned(($signed(reg8) ?
                          $signed(reg5) : (^~wire2))))};
              reg9 <= {(($unsigned($signed(reg12)) - (8'hba)) ?
                      (+$unsigned(((8'ha0) ?
                          reg8 : wire4))) : (reg8[(4'h9):(2'h2)] ?
                          ($signed((8'ha4)) + wire0) : ((wire2 ?
                                  reg10 : wire4) ?
                              (reg7 & wire1) : wire3))),
                  $signed((!reg10))};
              reg10 <= wire3;
            end
          else
            begin
              reg6 <= $signed(wire1[(5'h11):(4'hf)]);
              reg7 <= $signed({{$unsigned((!wire2))}});
              reg8 <= $signed(wire4);
            end
          reg11 <= (~^{(~|$signed($unsigned((8'hbf)))), (8'hb6)});
          if ($unsigned($signed(reg11)))
            begin
              reg12 <= (!$signed(($unsigned((reg11 ?
                  wire2 : reg9)) != $signed($unsigned(reg13)))));
              reg13 <= $unsigned(({((8'had) == (^~reg6)),
                      ($signed(reg11) ?
                          $signed(reg11) : wire1[(2'h2):(1'h0)])} ?
                  (~wire2[(2'h2):(2'h2)]) : reg9[(4'h9):(4'h8)]));
              reg14 <= ($unsigned(reg6) ?
                  wire0[(2'h2):(2'h2)] : (((wire2 ?
                      $signed(wire3) : (~reg10)) <<< {$signed((8'ha7))}) && reg9));
            end
          else
            begin
              reg12 <= $signed(reg10[(1'h0):(1'h0)]);
              reg13 <= ($unsigned((reg13 ?
                  ((~&(8'h9d)) ? (|reg11) : (reg14 ? wire1 : reg5)) : (|{wire1,
                      reg6}))) <<< reg14[(1'h0):(1'h0)]);
              reg14 <= reg6;
              reg15 <= $signed(($unsigned(wire2[(3'h4):(1'h1)]) ~^ {($unsigned(reg5) <<< (reg9 ?
                      reg8 : reg10))}));
            end
          reg16 <= wire1[(4'hf):(4'he)];
        end
      if ($signed(wire4[(3'h7):(1'h1)]))
        begin
          reg17 <= $unsigned((reg10 ?
              (reg5 <= $signed({reg13, wire2})) : reg12));
          reg18 <= wire1[(4'ha):(3'h7)];
          reg19 <= (|$signed((($signed(wire2) ?
              (reg18 == reg7) : {wire2}) <<< $unsigned(reg13[(1'h1):(1'h1)]))));
        end
      else
        begin
          if (reg6[(3'h4):(2'h3)])
            begin
              reg17 <= $signed(reg14[(2'h3):(1'h1)]);
              reg18 <= ($unsigned($unsigned(((reg14 == reg8) == (reg17 | reg15)))) ?
                  $unsigned(reg10[(3'h7):(3'h5)]) : $signed($signed((~&reg9[(4'h8):(3'h6)]))));
              reg19 <= reg11[(1'h0):(1'h0)];
              reg20 <= $signed(((({wire3} ?
                  (~&reg9) : reg11) <= wire1[(4'hd):(4'hb)]) != ((reg11 && $unsigned(reg7)) ?
                  reg6[(4'h9):(3'h4)] : (-$unsigned(reg8)))));
              reg21 <= ((8'hb7) << reg16);
            end
          else
            begin
              reg17 <= $unsigned((($unsigned((8'hba)) & $unsigned((reg18 - reg15))) ?
                  (+reg11) : reg17[(3'h6):(1'h1)]));
            end
          reg22 <= (~|reg9[(2'h2):(1'h0)]);
          reg23 <= wire2;
        end
    end
  assign wire24 = $unsigned(reg9);
  always
    @(posedge clk) begin
      reg25 <= ((((~(|reg13)) * $unsigned((reg8 != reg21))) ?
          $unsigned(reg17) : reg9) >= wire0[(3'h4):(3'h4)]);
      reg26 <= wire1;
    end
  always
    @(posedge clk) begin
      reg27 <= reg23[(3'h6):(3'h5)];
    end
  assign wire28 = {(^~($signed((reg10 | (8'hb2))) ?
                          (((8'hb4) > reg21) | $unsigned(wire24)) : (^reg20[(4'hb):(4'hb)]))),
                      $signed($unsigned(reg7))};
  assign wire29 = wire3;
  assign wire30 = ((~&wire1) >= reg10[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg31 <= (^(~|{wire1, $signed(reg21)}));
      reg32 <= reg5[(1'h0):(1'h0)];
      reg33 <= (8'hae);
      reg34 <= reg21[(1'h1):(1'h0)];
      reg35 <= $unsigned((reg11 ?
          ($signed({reg17, (8'h9d)}) ?
              wire0 : (((8'ha7) ?
                  reg23 : reg16) + (wire1 + reg15))) : ($signed($signed((8'hb7))) > reg7)));
    end
  assign wire36 = reg13;
  always
    @(posedge clk) begin
      reg37 <= (((^~$unsigned(((8'ha4) || (8'ha9)))) ?
          $unsigned(($unsigned(reg21) ?
              (&reg35) : (reg10 >>> wire24))) : (((reg31 | reg25) >> $unsigned(wire1)) << reg6[(5'h11):(4'hf)])) >> (wire36[(1'h1):(1'h1)] ?
          (8'ha3) : (($signed((8'ha5)) <= (8'ha3)) ?
              (-{reg17}) : ((8'hb7) ? {(8'hae)} : (reg12 ? reg27 : (8'hb4))))));
      reg38 <= wire1[(3'h6):(2'h2)];
      if ($signed($signed($unsigned($unsigned({reg23, wire29})))))
        begin
          reg39 <= $unsigned(reg16[(5'h10):(5'h10)]);
          reg40 <= $signed((^reg19[(4'ha):(3'h7)]));
        end
      else
        begin
          reg39 <= (&$signed(reg9[(3'h7):(3'h6)]));
          reg40 <= (^((^~$signed(reg14)) ^ (wire28[(4'hb):(4'hb)] ?
              ((~|reg10) ?
                  (+reg7) : (reg16 ?
                      (8'hac) : wire30)) : $unsigned($signed(reg35)))));
          reg41 <= $unsigned(reg21[(4'h9):(4'h9)]);
          reg42 <= reg34;
          if ($unsigned({$unsigned($unsigned({reg23})), wire36}))
            begin
              reg43 <= $signed($signed(wire4[(3'h5):(3'h5)]));
              reg44 <= $signed($signed((+{(!reg27)})));
              reg45 <= {$unsigned(reg43),
                  {$signed({(~^reg26)}), $unsigned((+(!reg17)))}};
              reg46 <= reg45;
            end
          else
            begin
              reg43 <= {($signed(($unsigned((8'hbb)) ?
                      reg21 : reg19[(4'h9):(3'h5)])) <<< (wire24 ^~ (~^reg34))),
                  reg37};
            end
        end
    end
  always
    @(posedge clk) begin
      reg47 <= (~&reg43);
      reg48 <= (reg7 ? $signed({reg9}) : reg35[(4'h8):(1'h0)]);
      reg49 <= ((reg37[(1'h1):(1'h1)] ?
              reg40[(4'h8):(3'h5)] : ($unsigned($unsigned(reg27)) >> (+$signed(reg48)))) ?
          reg40[(1'h1):(1'h0)] : (~|$signed((~&$unsigned(reg40)))));
      if (wire3[(3'h7):(2'h3)])
        begin
          reg50 <= (8'hb4);
          reg51 <= (^~reg8[(3'h6):(2'h2)]);
        end
      else
        begin
          reg50 <= reg35[(4'h8):(2'h2)];
          if ({((+{(~|reg19)}) ?
                  $signed((reg39 > (8'hbb))) : reg9[(2'h2):(1'h1)]),
              $unsigned((~|(reg13 ? (~&reg16) : $signed(reg32))))})
            begin
              reg51 <= {((~$signed($signed(wire30))) && (((+reg21) ?
                      $signed(reg33) : reg43) && {{(8'hbc), reg37}})),
                  reg7};
            end
          else
            begin
              reg51 <= $signed(reg10[(2'h3):(2'h3)]);
              reg52 <= wire0[(3'h5):(3'h5)];
            end
          reg53 <= {reg25};
          reg54 <= {(($unsigned(reg6) ?
                  (~|{(8'ha7),
                      wire24}) : (8'hb5)) && (~$unsigned($signed(reg16))))};
        end
    end
  assign wire55 = {reg32};
  assign wire56 = (^({$unsigned($unsigned(reg49)),
                      reg13[(1'h0):(1'h0)]} <= reg17));
  assign wire57 = reg5;
  assign wire58 = (~^(((&(&reg14)) ?
                      ($unsigned((8'hbc)) >>> $signed(reg11)) : wire28) == {reg33[(1'h0):(1'h0)],
                      ((reg44 ? reg43 : (8'hbe)) ?
                          $signed((8'hb2)) : (8'hb0))}));
endmodule
