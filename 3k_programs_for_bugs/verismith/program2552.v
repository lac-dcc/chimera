module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h372):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire114;
  wire [(2'h2):(1'h0)] wire113;
  wire [(2'h2):(1'h0)] wire111;
  wire signed [(5'h10):(1'h0)] wire79;
  wire [(2'h2):(1'h0)] wire78;
  wire signed [(5'h10):(1'h0)] wire77;
  wire [(3'h5):(1'h0)] wire74;
  wire [(5'h11):(1'h0)] wire73;
  wire signed [(4'hc):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire21;
  reg [(4'ha):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg72 = (1'h0);
  reg [(5'h10):(1'h0)] reg71 = (1'h0);
  reg [(5'h14):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg69 = (1'h0);
  reg [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg67 = (1'h0);
  reg [(5'h13):(1'h0)] reg66 = (1'h0);
  reg [(4'hb):(1'h0)] reg65 = (1'h0);
  reg [(2'h2):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg62 = (1'h0);
  reg [(4'ha):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg60 = (1'h0);
  reg signed [(4'he):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg58 = (1'h0);
  reg [(5'h10):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg56 = (1'h0);
  reg [(4'he):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg53 = (1'h0);
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  reg [(5'h13):(1'h0)] reg51 = (1'h0);
  reg [(4'ha):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg47 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg45 = (1'h0);
  reg [(5'h12):(1'h0)] reg44 = (1'h0);
  reg [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(4'hd):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg5 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire111,
                 wire79,
                 wire78,
                 wire77,
                 wire74,
                 wire73,
                 wire22,
                 wire21,
                 reg76,
                 reg75,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
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
      reg5 <= wire0[(3'h4):(1'h1)];
      if ($unsigned(reg5))
        begin
          reg6 <= (7'h41);
          reg7 <= ((^$unsigned($signed($unsigned(wire4)))) ?
              wire3[(4'hb):(3'h6)] : $signed($unsigned(reg6)));
          if ((((~^wire0[(3'h7):(3'h5)]) ?
              $signed($unsigned((reg7 ?
                  wire3 : wire0))) : {reg7}) - (~^(~&($signed(wire1) <<< (wire4 != (8'ha1)))))))
            begin
              reg8 <= $unsigned(((~|$signed($unsigned((8'haa)))) ?
                  $unsigned((8'hbc)) : (~&{(^~wire3), reg6})));
            end
          else
            begin
              reg8 <= ($unsigned(reg7[(3'h4):(1'h0)]) && $unsigned({{$signed(reg7),
                      (reg7 ^~ reg5)},
                  wire0[(4'hb):(4'ha)]}));
              reg9 <= (~|(^({wire1} ^~ wire4)));
              reg10 <= ({(+reg7[(3'h5):(1'h0)])} != (~(~$signed(reg7))));
              reg11 <= $signed($unsigned(wire2));
              reg12 <= $unsigned(reg7);
            end
          reg13 <= wire4[(2'h2):(1'h1)];
          reg14 <= (($signed($unsigned((8'ha4))) ?
                  ($unsigned((8'ha0)) | {$signed(wire4),
                      (^~(8'hb5))}) : wire3[(4'ha):(1'h0)]) ?
              wire1[(5'h10):(3'h4)] : $unsigned(((-(reg10 ?
                  (7'h40) : reg10)) >= {{reg8}, (~|reg5)})));
        end
      else
        begin
          reg6 <= ($signed(wire1[(1'h1):(1'h0)]) & ({(!(reg8 ?
                  wire2 : reg9))} && reg6[(3'h7):(3'h4)]));
          reg7 <= $unsigned($unsigned((reg13[(2'h3):(1'h0)] >> ($unsigned(wire3) ?
              $signed(reg9) : $unsigned(reg10)))));
          reg8 <= reg14;
          if ($signed(wire0[(3'h7):(3'h4)]))
            begin
              reg9 <= {(!((^~reg12) >= reg7)), (-reg13[(5'h12):(4'hd)])};
              reg10 <= wire1[(3'h4):(1'h1)];
              reg11 <= (8'h9c);
              reg12 <= (8'hbf);
            end
          else
            begin
              reg9 <= $signed(($signed($signed({wire1, reg5})) ?
                  {$unsigned((wire2 ? (8'h9e) : wire0)),
                      $signed(wire2[(4'he):(1'h1)])} : ($signed({reg11, reg6}) ?
                      ($unsigned((8'ha0)) ?
                          reg8[(1'h1):(1'h0)] : (^reg5)) : (-wire1))));
              reg10 <= (~wire1[(4'h9):(3'h7)]);
              reg11 <= $unsigned((^~$signed({reg5[(2'h2):(1'h1)],
                  wire0[(4'hb):(4'ha)]})));
            end
        end
      if (wire2[(4'hf):(2'h2)])
        begin
          if (($signed((reg14[(4'ha):(4'ha)] ?
              ($unsigned(wire2) + $signed(reg8)) : (reg11[(3'h5):(3'h5)] ?
                  reg8[(4'ha):(3'h4)] : {reg8}))) > $unsigned($signed(((wire1 ?
                  wire3 : wire1) ?
              wire4 : (wire3 ? (8'ha4) : reg5))))))
            begin
              reg15 <= reg5;
              reg16 <= wire2;
              reg17 <= $signed(($unsigned(reg16) ?
                  wire4[(3'h4):(3'h4)] : {reg10}));
              reg18 <= (~|reg15[(4'ha):(4'h8)]);
              reg19 <= {(wire2[(3'h6):(1'h1)] ? reg16 : $signed((-reg13)))};
            end
          else
            begin
              reg15 <= {wire2};
              reg16 <= (8'haf);
              reg17 <= (^~reg16[(2'h3):(1'h1)]);
              reg18 <= $unsigned(reg19);
              reg19 <= (~&reg16);
            end
        end
      else
        begin
          reg15 <= reg17[(4'he):(4'hd)];
          reg16 <= reg6;
          reg17 <= ((+(wire3 ?
                  ((wire2 ? (8'ha9) : (8'hae)) ?
                      $unsigned(reg12) : $signed(wire2)) : reg7[(1'h1):(1'h0)])) ?
              ((&($unsigned(reg19) ? $signed(reg16) : (wire3 ? reg6 : reg15))) ?
                  (reg10[(2'h2):(2'h2)] ~^ (reg15 ?
                      {(8'ha6),
                          reg10} : $signed(wire3))) : (+((8'ha2) ^~ $unsigned((8'hbf))))) : {reg18[(3'h6):(1'h1)]});
          reg18 <= $signed($signed(($signed(wire3[(1'h0):(1'h0)]) > $unsigned((+reg6)))));
        end
      reg20 <= (wire4[(4'h9):(3'h4)] ?
          reg16[(3'h5):(3'h5)] : $unsigned({wire2[(4'hc):(3'h6)],
              wire4[(3'h7):(3'h4)]}));
    end
  assign wire21 = wire1;
  assign wire22 = {$signed((^$unsigned((reg20 ? wire4 : reg16)))),
                      reg17[(5'h11):(4'ha)]};
  always
    @(posedge clk) begin
      reg23 <= (wire21[(3'h5):(1'h1)] ?
          wire1 : ($signed({$signed(wire3), $signed(reg15)}) ?
              reg16[(2'h3):(1'h1)] : (~(~|wire0[(4'h9):(1'h1)]))));
      reg24 <= (+((reg5 ?
          ((8'hb4) < $unsigned(reg17)) : {(~reg14)}) >= (8'h9f)));
      if ((7'h43))
        begin
          reg25 <= $unsigned((&{((reg9 * (7'h41)) << wire21),
              {(reg11 ? reg7 : wire4), $signed(reg6)}}));
          if (((8'h9c) ~^ (7'h40)))
            begin
              reg26 <= (reg20[(4'h8):(2'h2)] != $signed((8'h9e)));
              reg27 <= ((|reg7) ?
                  {reg24[(2'h2):(1'h0)]} : $signed((reg19 ?
                      reg16 : ($unsigned(reg12) == (reg26 ^~ reg11)))));
              reg28 <= $unsigned(((((reg15 - (8'hbb)) < wire21) < (|(8'ha7))) + (($signed(reg5) ?
                      $signed(reg6) : (reg6 ? reg26 : (8'hab))) ?
                  ({wire2} ?
                      reg14[(4'h8):(2'h3)] : (wire1 ?
                          reg26 : reg18)) : (((8'hb6) >> reg25) ?
                      (wire22 ? reg17 : reg25) : {(8'hb5)}))));
            end
          else
            begin
              reg26 <= ($unsigned(wire4[(4'h9):(4'h9)]) ?
                  (~^($signed((~(8'had))) ^~ wire22)) : {(reg15 - ((reg27 ?
                          wire22 : wire0) >= $unsigned(reg10)))});
              reg27 <= wire21[(3'h4):(2'h2)];
              reg28 <= (|((((reg17 + reg17) ?
                  (8'hbb) : reg16[(3'h7):(3'h5)]) - wire21) ~^ (((reg25 ?
                  reg5 : (8'hac)) ^ $unsigned(reg18)) ^~ ((+reg13) ?
                  {reg18, reg8} : reg26))));
            end
          reg29 <= $unsigned((^~reg26));
          reg30 <= $unsigned(reg27[(1'h1):(1'h0)]);
        end
      else
        begin
          reg25 <= reg27[(2'h2):(2'h2)];
          reg26 <= (+(^~((^~reg7[(3'h5):(2'h2)]) >> {$signed((8'ha5))})));
          if ($signed($signed(reg8)))
            begin
              reg27 <= $unsigned((^~((reg15[(2'h3):(1'h0)] * {reg16}) ?
                  $signed($signed(reg13)) : ($unsigned(reg25) * (reg20 ?
                      reg12 : reg7)))));
            end
          else
            begin
              reg27 <= ((&{({wire22, wire0} && (reg13 ? reg20 : wire21)),
                      ((^reg28) ? {reg17} : (^~wire4))}) ?
                  reg24 : $signed((~&(8'hbb))));
              reg28 <= (((({(8'hb6)} ? (^wire21) : $signed(reg7)) ?
                  ($signed(reg17) ?
                      (reg15 * reg23) : (&reg18)) : $unsigned(reg9[(4'hb):(4'hb)])) ^ (wire4 ?
                  (-{reg12,
                      reg29}) : (~|reg27[(3'h4):(2'h2)]))) * (~reg19[(1'h0):(1'h0)]));
              reg29 <= $unsigned(reg16);
              reg30 <= reg10[(1'h1):(1'h0)];
            end
          if ($signed((+(reg30[(1'h0):(1'h0)] ?
              {wire4, $signed(reg6)} : $unsigned(reg8[(4'ha):(2'h2)])))))
            begin
              reg31 <= $unsigned(((~|(reg26[(1'h0):(1'h0)] ?
                  (!reg19) : reg9[(3'h7):(1'h1)])) << reg29));
              reg32 <= $unsigned((~|reg16[(3'h7):(2'h2)]));
              reg33 <= reg20;
              reg34 <= (8'ha3);
            end
          else
            begin
              reg31 <= ((wire4 ?
                  $signed($unsigned($signed(reg23))) : $signed({$unsigned(wire4),
                      $signed((7'h42))})) <<< $unsigned((~|((reg16 || reg28) ?
                  (^wire2) : $signed(reg13)))));
              reg32 <= (~(^wire1));
              reg33 <= reg14[(2'h3):(2'h2)];
              reg34 <= {(8'ha4)};
            end
          reg35 <= ((reg26 <= $unsigned(($signed(wire2) >>> (reg30 == reg25)))) ?
              (reg15 ? $signed((-(reg15 >= reg25))) : (8'hb8)) : ((^reg14) ?
                  (wire2[(2'h2):(2'h2)] == (reg28 ?
                      (reg20 >> wire21) : $unsigned(reg29))) : {reg28,
                      $unsigned($signed(reg29))}));
        end
      if ($unsigned(reg9))
        begin
          reg36 <= ({(($unsigned(reg16) ?
                      (reg13 <<< reg25) : (~&reg18)) > $unsigned($signed(reg27))),
                  $signed($unsigned(((8'ha7) ~^ reg19)))} ?
              (+(!$unsigned($signed(wire0)))) : wire0[(4'hc):(1'h1)]);
          reg37 <= (reg7[(1'h0):(1'h0)] ?
              ($unsigned($signed(((8'ha8) ^~ reg7))) < {$unsigned(reg27),
                  (+$unsigned(reg34))}) : (!(!$signed((reg9 ?
                  wire4 : reg30)))));
          reg38 <= (|reg23[(3'h5):(1'h0)]);
        end
      else
        begin
          reg36 <= ((|reg5[(1'h1):(1'h1)]) + (~^reg32));
          reg37 <= (^~$unsigned(($unsigned(reg30) ?
              $signed($unsigned(reg37)) : {(~&reg12)})));
          reg38 <= wire1[(2'h2):(2'h2)];
        end
      reg39 <= (^(8'hbb));
    end
  always
    @(posedge clk) begin
      if ($signed((wire2 ?
          (((~&reg28) ? $unsigned(wire0) : $unsigned(reg18)) ?
              {(reg27 ~^ reg28), reg36} : ((reg17 ? reg25 : reg32) ?
                  $signed(wire4) : (8'hb0))) : (~^reg33))))
        begin
          reg40 <= wire1;
        end
      else
        begin
          if ($signed(wire3[(3'h6):(3'h6)]))
            begin
              reg40 <= (!wire0[(4'hd):(4'hd)]);
              reg41 <= (!(reg13 <<< reg16));
              reg42 <= (8'ha6);
              reg43 <= $unsigned(reg35);
            end
          else
            begin
              reg40 <= reg9;
              reg41 <= (reg41 ^ reg12);
              reg42 <= wire4;
            end
        end
      reg44 <= (wire0 ?
          reg12[(3'h4):(1'h0)] : $signed($unsigned((reg8 & $unsigned(reg20)))));
      if ($signed({reg35, ((^$signed(reg10)) <<< reg34)}))
        begin
          if (((~(reg8 ?
                  (reg26[(1'h0):(1'h0)] + (!reg24)) : {(wire0 ? reg27 : reg32),
                      ((8'hb7) ? reg9 : reg13)})) ?
              reg8 : (|wire4)))
            begin
              reg45 <= {reg38, $unsigned($unsigned(reg40[(1'h1):(1'h1)]))};
              reg46 <= (&($unsigned(((reg38 | reg14) ?
                      (&reg43) : (wire2 ? wire22 : reg41))) ?
                  reg19 : (((|reg24) ?
                      {reg41} : (~|reg7)) <= ((reg24 * reg34) != $signed((8'ha2))))));
              reg47 <= $unsigned(reg29);
              reg48 <= $signed(($unsigned($unsigned($unsigned(reg20))) ?
                  ($signed({(8'haf), reg31}) ?
                      $signed($signed(reg17)) : ((^~reg10) >> reg23[(3'h4):(2'h3)])) : wire21[(4'hc):(1'h0)]));
              reg49 <= $signed($unsigned($signed(reg10)));
            end
          else
            begin
              reg45 <= reg26;
              reg46 <= $unsigned($signed({$signed(wire1)}));
              reg47 <= reg23[(3'h5):(1'h1)];
              reg48 <= (reg32[(4'h8):(2'h2)] >= ($signed(reg9) - $unsigned(reg13)));
            end
          reg50 <= $unsigned($signed((8'ha1)));
        end
      else
        begin
          if (({((7'h41) ? reg17 : $unsigned($signed(reg15)))} ?
              {(~$unsigned((!reg29))),
                  $signed((-$unsigned(reg42)))} : wire22[(4'ha):(1'h1)]))
            begin
              reg45 <= reg46[(4'he):(2'h3)];
              reg46 <= (((~reg19[(1'h0):(1'h0)]) ?
                      $unsigned(((reg30 ?
                          reg43 : reg30) ~^ (reg13 ~^ reg8))) : (($unsigned(wire4) <<< (~reg23)) ?
                          (reg13 ?
                              (reg24 != (8'ha5)) : (reg38 >> reg38)) : wire2[(3'h7):(1'h1)])) ?
                  ($unsigned({$signed(reg16)}) != reg15[(4'h8):(3'h5)]) : reg29[(1'h1):(1'h1)]);
              reg47 <= ($signed((8'ha6)) ?
                  reg35[(4'hd):(3'h6)] : (reg18[(2'h2):(1'h1)] ?
                      ($signed((reg32 || reg7)) + $unsigned((~|reg44))) : (8'hac)));
              reg48 <= (!({(~|((8'h9c) & reg50))} ?
                  (reg25[(2'h3):(1'h1)] ?
                      (~^{reg30}) : ((7'h40) >>> $signed(wire0))) : reg48[(1'h1):(1'h0)]));
              reg49 <= reg14;
            end
          else
            begin
              reg45 <= reg27[(1'h1):(1'h0)];
              reg46 <= ((reg49[(4'hd):(3'h6)] == ($unsigned((~&reg28)) ?
                      reg44[(3'h4):(2'h2)] : reg39[(4'hc):(3'h6)])) ?
                  $unsigned(reg11[(4'ha):(3'h4)]) : reg45[(1'h0):(1'h0)]);
              reg47 <= $unsigned((!reg46[(3'h7):(3'h5)]));
              reg48 <= reg49[(4'he):(3'h7)];
            end
          reg50 <= $unsigned((reg10[(1'h0):(1'h0)] ^ {(reg44[(2'h2):(1'h1)] ?
                  reg35 : {reg16, reg27})}));
          reg51 <= reg36;
          reg52 <= reg44;
        end
      reg53 <= wire0[(4'hc):(2'h3)];
      if ($unsigned(($unsigned((reg43 ? (~^reg43) : $signed(reg41))) ?
          wire4 : reg39[(3'h5):(2'h2)])))
        begin
          reg54 <= $unsigned($unsigned($signed((&(~wire3)))));
        end
      else
        begin
          if (({reg29[(1'h1):(1'h0)], reg36[(2'h2):(1'h1)]} ?
              {{(&$unsigned(reg37))},
                  (reg47[(4'hd):(2'h2)] | (wire4[(4'h9):(4'h8)] ?
                      (reg16 ? reg38 : reg8) : $unsigned(reg9)))} : reg26))
            begin
              reg54 <= reg36;
              reg55 <= ((8'ha1) ?
                  $unsigned((!{reg35[(5'h12):(4'hc)]})) : reg45[(4'h8):(3'h4)]);
            end
          else
            begin
              reg54 <= $unsigned((~|((reg31[(3'h5):(3'h5)] >>> (+reg13)) ?
                  {reg45[(3'h6):(2'h2)]} : (wire2[(4'he):(2'h2)] ?
                      {reg51, reg27} : reg27[(4'hc):(4'ha)]))));
              reg55 <= reg44;
              reg56 <= {(|reg33)};
              reg57 <= ($signed(reg40[(2'h2):(1'h1)]) ?
                  (7'h42) : $unsigned(reg9[(2'h3):(1'h1)]));
              reg58 <= ($signed((8'hb8)) >> reg8[(4'h9):(4'h9)]);
            end
          reg59 <= ((((7'h42) ^~ ((-reg10) == reg57)) ?
              reg51 : (reg33 ?
                  wire1[(4'h8):(2'h2)] : $signed((~&reg6)))) - reg41[(2'h2):(1'h0)]);
          reg60 <= reg32;
          reg61 <= reg43;
        end
    end
  always
    @(posedge clk) begin
      if (((wire21 ?
          (^~$signed((reg61 == reg5))) : $unsigned(($unsigned((8'h9c)) ?
              (8'haf) : $signed(reg17)))) > ({$unsigned(wire22),
          $unsigned(((8'hbb) ?
              reg26 : reg59))} + ({reg32[(2'h2):(2'h2)]} <<< $signed(reg43)))))
        begin
          reg62 <= ((-(($signed(reg45) ~^ reg43) ?
              (reg11 > $unsigned(reg11)) : ((reg54 ^~ reg38) ?
                  ((8'ha7) ?
                      reg30 : reg9) : (reg47 >> reg44)))) ^~ (!(reg57[(4'hd):(3'h5)] && ((8'ha8) - (^~reg10)))));
          if (($unsigned(reg54[(1'h1):(1'h1)]) || (8'ha2)))
            begin
              reg63 <= $signed($unsigned($signed($unsigned($unsigned(reg8)))));
              reg64 <= (({(reg54[(2'h2):(1'h0)] ?
                          $signed(reg58) : reg36[(2'h2):(2'h2)])} <= {$unsigned($unsigned(reg39))}) ?
                  $signed({$unsigned($signed(reg27)),
                      reg44}) : {((^reg54[(1'h0):(1'h0)]) > $signed(reg14[(3'h6):(3'h4)]))});
              reg65 <= ($signed(reg49) ?
                  (8'hac) : $unsigned(($unsigned(reg5) ?
                      (^~((7'h41) << reg32)) : $signed((reg19 ?
                          reg14 : reg62)))));
            end
          else
            begin
              reg63 <= reg61[(2'h2):(1'h0)];
              reg64 <= (|$signed($signed(reg14[(1'h1):(1'h0)])));
            end
          reg66 <= ((^$signed(($unsigned(reg16) ?
                  $signed(reg37) : (wire0 ? reg48 : reg42)))) ?
              ($unsigned((reg54 ^ {reg64, reg10})) ?
                  $signed($signed($unsigned((8'ha2)))) : ($unsigned((wire2 <= reg25)) ?
                      (+{reg19, reg17}) : (reg50[(3'h4):(2'h3)] ?
                          $signed(reg60) : $unsigned(reg26)))) : {(8'hb0),
                  reg18});
          reg67 <= (-$signed((-((reg63 | reg34) ?
              (reg28 ? reg12 : reg12) : (reg37 ? wire4 : wire22)))));
          reg68 <= (-$signed($signed((^reg18[(3'h4):(2'h2)]))));
        end
      else
        begin
          reg62 <= {({reg10[(3'h5):(2'h2)]} >>> $unsigned((wire2 >= reg24[(2'h2):(1'h1)]))),
              (reg34 != (reg12 & reg14[(3'h7):(3'h5)]))};
          reg63 <= reg68[(1'h1):(1'h0)];
          reg64 <= $signed($signed((((reg10 * wire3) ?
              ((8'ha0) | reg36) : $signed(reg41)) << $signed($unsigned(reg62)))));
          reg65 <= (8'hb3);
          reg66 <= $signed(reg14[(1'h0):(1'h0)]);
        end
      reg69 <= $unsigned((~^(&((~^reg14) ? {reg53} : (reg41 || reg46)))));
      reg70 <= {$unsigned($unsigned($signed($signed(reg51)))),
          ((($unsigned(reg40) ?
                  $unsigned(reg38) : (reg38 & reg66)) != reg40[(2'h2):(2'h2)]) ?
              $unsigned(reg58[(2'h2):(1'h1)]) : (((~|reg14) ?
                      (8'ha5) : reg58[(3'h5):(1'h0)]) ?
                  {(reg56 & reg24), ((8'had) <<< (8'hbf))} : ((reg15 ?
                      reg19 : wire2) & wire1[(2'h2):(1'h1)])))};
      reg71 <= (((reg55 ? $unsigned((wire0 ? wire3 : reg26)) : reg55) ?
              reg62 : (~^$unsigned($signed(wire0)))) ?
          $unsigned(reg56[(3'h5):(1'h1)]) : $signed($signed(reg14)));
      reg72 <= ($unsigned(((reg32[(3'h6):(1'h0)] ?
              (reg23 < wire2) : reg63[(4'hc):(4'h9)]) <= (reg38[(2'h2):(2'h2)] ?
              reg59 : $unsigned(reg30)))) ?
          (+reg16[(3'h7):(1'h0)]) : (^($unsigned($signed(reg53)) | ((8'hac) + $unsigned((8'hb5))))));
    end
  assign wire73 = $signed(($unsigned(((~^(8'hb6)) ?
                          $signed(reg44) : {(8'ha6), reg72})) ?
                      $unsigned($signed((^reg60))) : reg69));
  assign wire74 = reg41[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg75 <= (($unsigned(wire74[(2'h2):(1'h1)]) ?
          (^(~&reg51[(4'hf):(3'h5)])) : (8'hb1)) > (({$unsigned(reg24),
              {reg38, (8'hac)}} || $signed(reg26)) ?
          ($signed($signed(reg40)) ?
              $signed((reg39 <<< reg58)) : (!wire4[(1'h1):(1'h0)])) : (((reg5 ~^ (8'h9e)) >= $signed(reg57)) ?
              ((&reg63) ? reg42 : (^reg37)) : reg62[(3'h6):(3'h4)])));
      reg76 <= $signed(($signed($signed($signed((8'ha0)))) ?
          $signed((((8'hb1) ?
              reg12 : reg48) ^ (~reg33))) : (((wire1 || reg7) << wire4) || (&$signed(reg11)))));
    end
  assign wire77 = reg29;
  assign wire78 = (8'ha6);
  assign wire79 = $unsigned(((wire21[(3'h7):(1'h0)] ?
                          ($unsigned(reg10) ?
                              reg35 : wire22[(3'h7):(2'h2)]) : $signed(reg18)) ?
                      (+((reg36 ? reg8 : reg23) ?
                          (reg40 * reg55) : $unsigned(reg67))) : (wire22 ?
                          reg43[(5'h14):(2'h3)] : wire78)));
  module80 #() modinst112 (wire111, clk, reg72, wire21, reg8, wire73);
  assign wire113 = reg42[(4'hd):(1'h1)];
  assign wire114 = $signed({(+((reg30 ? reg18 : wire77) ?
                           (-reg15) : $signed(reg69)))});
endmodule

module module80
#(parameter param109 = (((((8'haa) <<< ((8'hac) ? (8'hb4) : (8'ha0))) | (8'haa)) ? {{((8'ha8) ? (8'hb2) : (8'ha7)), ((8'ha4) ? (8'h9d) : (8'h9e))}} : ({((8'hb4) ~^ (8'ha9))} > (((8'hb3) ^ (8'ha9)) <<< (8'ha0)))) ? {(((-(8'hb4)) ? ((8'ha0) ? (8'ha3) : (8'h9f)) : ((8'hb4) == (8'ha1))) ? (^~((7'h40) ? (7'h44) : (8'hbf))) : (((8'hb0) << (8'hbf)) ~^ ((8'h9f) ? (8'ha1) : (8'hb3))))} : (~&({((8'hb0) ? (8'hae) : (8'hb5))} ? (|{(8'h9c)}) : (((8'ha5) & (8'ha2)) ? ((8'ha6) >>> (8'hbd)) : ((8'haf) ? (8'haf) : (8'hbc)))))), 
parameter param110 = (&{param109}))
(y, clk, wire84, wire83, wire82, wire81);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire84;
  input wire [(2'h2):(1'h0)] wire83;
  input wire [(4'h9):(1'h0)] wire82;
  input wire signed [(4'hd):(1'h0)] wire81;
  wire [(4'h8):(1'h0)] wire108;
  wire [(5'h15):(1'h0)] wire107;
  wire signed [(4'he):(1'h0)] wire106;
  wire [(4'he):(1'h0)] wire105;
  wire signed [(3'h5):(1'h0)] wire104;
  wire signed [(4'hb):(1'h0)] wire103;
  wire signed [(5'h13):(1'h0)] wire102;
  wire signed [(2'h2):(1'h0)] wire96;
  wire signed [(3'h5):(1'h0)] wire95;
  wire signed [(4'ha):(1'h0)] wire85;
  reg [(4'hd):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg99 = (1'h0);
  reg [(5'h12):(1'h0)] reg98 = (1'h0);
  reg [(3'h6):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg93 = (1'h0);
  reg [(4'ha):(1'h0)] reg92 = (1'h0);
  reg [(4'h8):(1'h0)] reg91 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg90 = (1'h0);
  reg [(5'h15):(1'h0)] reg89 = (1'h0);
  reg [(4'hd):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg86 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire96,
                 wire95,
                 wire85,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 (1'h0)};
  assign wire85 = ((wire82[(3'h5):(1'h0)] ?
                          ((&$unsigned(wire81)) - $unsigned(wire81[(2'h2):(2'h2)])) : $signed((~^{wire82}))) ?
                      ((+wire83[(2'h2):(1'h1)]) || {wire81}) : wire81[(3'h5):(1'h1)]);
  always
    @(posedge clk) begin
      reg86 <= wire84[(1'h0):(1'h0)];
      if (($signed(($signed(wire83) ? $signed($unsigned(wire83)) : (8'hae))) ?
          (~wire85[(1'h1):(1'h0)]) : $signed($unsigned($unsigned($signed((8'hbc)))))))
        begin
          reg87 <= (|$unsigned(((+(8'ha6)) ?
              wire81 : ($unsigned(wire83) ?
                  {(8'hb7)} : (reg86 ? wire81 : wire82)))));
          reg88 <= wire83[(2'h2):(1'h0)];
          reg89 <= ((!$signed($unsigned($unsigned((8'hbb))))) < reg87);
          reg90 <= wire85;
          reg91 <= {(|$signed($unsigned(reg88[(3'h5):(3'h5)])))};
        end
      else
        begin
          reg87 <= reg90;
          reg88 <= (!wire83);
          if ($signed($signed($unsigned(((~^(8'ha7)) ?
              $signed((8'hbd)) : wire83[(2'h2):(1'h0)])))))
            begin
              reg89 <= (wire85 == (8'hba));
              reg90 <= $signed(reg87[(3'h4):(2'h2)]);
              reg91 <= (((!$unsigned(reg88)) ?
                  ((reg90 ? (+(7'h41)) : (reg90 >= wire81)) ?
                      reg88[(4'hb):(2'h3)] : (~{reg87,
                          reg88})) : reg89[(4'hf):(2'h2)]) ^~ reg86);
            end
          else
            begin
              reg89 <= (reg91 ?
                  $unsigned(({reg87,
                      (-wire85)} <<< (((7'h43) ~^ reg89) > reg89[(2'h2):(1'h0)]))) : reg88[(4'h9):(3'h5)]);
              reg90 <= wire84[(3'h6):(1'h1)];
              reg91 <= ($signed((reg86 * (~^wire84[(2'h2):(1'h0)]))) && $unsigned($signed((&reg87[(1'h1):(1'h1)]))));
            end
          reg92 <= $unsigned(wire85);
          reg93 <= reg87[(2'h3):(2'h2)];
        end
      reg94 <= {$unsigned({$unsigned($unsigned(reg87))})};
    end
  assign wire95 = reg86[(2'h3):(1'h0)];
  assign wire96 = {$signed(reg87[(2'h3):(2'h3)]), reg92[(3'h4):(3'h4)]};
  always
    @(posedge clk) begin
      reg97 <= (|reg91[(3'h5):(1'h1)]);
      reg98 <= reg91[(2'h2):(2'h2)];
      reg99 <= $signed($signed((reg87[(2'h3):(1'h0)] - ((8'hb0) >= (-reg98)))));
      reg100 <= wire83;
      reg101 <= $signed((~^{(wire85 ? (~|reg93) : $unsigned(reg98)),
          $unsigned(((8'hb9) ? reg88 : (7'h42)))}));
    end
  assign wire102 = $unsigned($signed((((reg88 ?
                           reg88 : reg92) < $signed(reg89)) ?
                       {$signed(wire96), {reg91}} : (~^(^reg87)))));
  assign wire103 = $signed({reg97[(1'h0):(1'h0)], $signed($signed({reg90}))});
  assign wire104 = ((reg101 ?
                           $signed(wire102) : $signed(reg100[(4'h8):(3'h5)])) ?
                       (reg92 >> $signed(wire103)) : reg90[(4'h8):(1'h0)]);
  assign wire105 = $signed($signed($unsigned(($signed(wire104) + $unsigned(wire103)))));
  assign wire106 = $signed($unsigned(((|(wire103 ? reg93 : wire82)) ?
                       reg100[(3'h6):(1'h0)] : (wire95[(1'h1):(1'h1)] ?
                           (reg86 + wire95) : wire85[(4'ha):(4'h8)]))));
  assign wire107 = $unsigned(reg99[(2'h2):(1'h0)]);
  assign wire108 = $signed((~&{wire95, $signed({reg99, reg99})}));
endmodule
