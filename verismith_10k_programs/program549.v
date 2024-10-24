module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h34f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire75;
  wire signed [(5'h15):(1'h0)] wire74;
  wire signed [(5'h11):(1'h0)] wire73;
  wire [(4'hc):(1'h0)] wire72;
  wire signed [(2'h3):(1'h0)] wire71;
  wire signed [(5'h13):(1'h0)] wire70;
  wire signed [(4'he):(1'h0)] wire69;
  wire signed [(2'h3):(1'h0)] wire68;
  wire [(5'h10):(1'h0)] wire66;
  wire [(5'h11):(1'h0)] wire49;
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg65 = (1'h0);
  reg [(2'h3):(1'h0)] reg64 = (1'h0);
  reg [(4'hd):(1'h0)] reg63 = (1'h0);
  reg [(3'h6):(1'h0)] reg62 = (1'h0);
  reg [(3'h6):(1'h0)] reg61 = (1'h0);
  reg [(4'hc):(1'h0)] reg60 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg56 = (1'h0);
  reg [(5'h11):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(4'hd):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg [(4'h9):(1'h0)] reg46 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(3'h6):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(2'h3):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg5 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire66,
                 wire49,
                 reg67,
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
      if ((wire3 ?
          ((wire0 ^ (wire2 ?
              {wire4} : (~^(8'hbf)))) > $unsigned((|$signed(wire1)))) : ({($signed(wire3) ?
                      $signed(wire0) : wire1)} ?
              wire4[(2'h2):(2'h2)] : wire4[(2'h2):(1'h0)])))
        begin
          reg5 <= {($unsigned(({(8'hb6)} ?
                  $signed(wire3) : wire3)) >= {(&((8'hb4) ? wire1 : wire2))})};
          reg6 <= $unsigned(wire0[(2'h3):(1'h1)]);
          reg7 <= $unsigned((~&(-$signed($unsigned(reg6)))));
          reg8 <= $signed(((-(~$signed(wire2))) ? wire4 : (^~reg7)));
        end
      else
        begin
          reg5 <= $unsigned(reg5);
          if ($unsigned((~|reg7[(1'h0):(1'h0)])))
            begin
              reg6 <= $signed(((wire1 <= (-{wire1})) ?
                  wire1[(3'h6):(3'h5)] : (~^{reg8})));
            end
          else
            begin
              reg6 <= ((reg5 ?
                      wire2[(3'h4):(1'h0)] : (($signed((8'ha7)) - $unsigned((7'h40))) >>> $signed(reg8))) ?
                  ((((reg7 ? wire2 : reg5) ?
                              (wire3 >>> wire1) : $signed(wire3)) ?
                          (~(+(8'hb5))) : (wire2[(3'h5):(1'h1)] ?
                              (^wire4) : (+(8'h9d)))) ?
                      (((reg5 >> (8'ha1)) && (8'hb3)) ?
                          ($unsigned(wire4) <<< (&(8'hba))) : ($unsigned(reg8) ?
                              (~^wire2) : (wire1 * wire2))) : ($signed((!reg8)) ?
                          wire2[(3'h4):(2'h3)] : ((wire1 ^~ reg6) ?
                              {wire4} : (~(8'hb9))))) : reg8[(1'h0):(1'h0)]);
              reg7 <= ((~|reg8[(4'hc):(3'h7)]) ?
                  reg8 : ($signed(($signed(reg5) ~^ (wire4 ? wire3 : wire4))) ?
                      ((wire2[(1'h1):(1'h1)] == {reg6, wire0}) ?
                          ($unsigned(reg6) ?
                              {wire1} : wire0[(3'h4):(2'h3)]) : (|(reg5 ?
                              (8'hbb) : reg6))) : wire0));
              reg8 <= {((((reg5 >>> reg7) ?
                          (reg6 >>> wire1) : $signed(wire1)) * (|wire0)) ?
                      reg6 : wire3[(4'ha):(2'h2)]),
                  wire0[(1'h1):(1'h1)]};
              reg9 <= (reg7 ?
                  ($signed(($unsigned((8'ha2)) <<< (reg5 ? wire2 : (8'hb9)))) ?
                      ($unsigned((wire3 > wire2)) || wire3[(4'h8):(4'h8)]) : ((~&{(8'hbd)}) >>> (-wire2[(3'h4):(2'h2)]))) : $unsigned($unsigned((reg6 ?
                      $signed(wire3) : (reg8 < reg6)))));
            end
        end
      if (reg8[(3'h6):(3'h5)])
        begin
          reg10 <= $signed((~|wire3[(3'h7):(3'h6)]));
          reg11 <= $signed($signed(reg7[(1'h1):(1'h0)]));
          reg12 <= $unsigned($unsigned(reg7));
        end
      else
        begin
          if ($unsigned((^($signed(reg8[(5'h10):(2'h3)]) ?
              (~^$unsigned(wire0)) : {$unsigned(reg8), reg12[(3'h6):(2'h3)]}))))
            begin
              reg10 <= (~^wire2[(1'h1):(1'h1)]);
              reg11 <= wire1[(1'h0):(1'h0)];
            end
          else
            begin
              reg10 <= ($unsigned($unsigned($signed((7'h40)))) == wire3[(4'he):(3'h5)]);
              reg11 <= {(((~$unsigned((8'hb7))) ^~ (wire1[(4'hc):(1'h0)] & (reg11 ?
                      wire0 : wire3))) ^~ $unsigned($unsigned((reg6 ?
                      reg12 : (8'hb7)))))};
              reg12 <= reg9;
            end
          if (wire3[(4'h8):(3'h4)])
            begin
              reg13 <= (~|$signed({reg12[(4'hb):(1'h0)],
                  ((&reg8) < (wire1 >= reg10))}));
              reg14 <= (8'ha0);
              reg15 <= reg9;
              reg16 <= reg14;
              reg17 <= $signed(({wire0} ? reg10 : (+$unsigned((|reg8)))));
            end
          else
            begin
              reg13 <= $unsigned((!((reg6 <= (wire3 < wire0)) >>> $unsigned(reg8[(3'h6):(1'h0)]))));
              reg14 <= wire1;
              reg15 <= $signed(reg10);
              reg16 <= $signed(reg5);
              reg17 <= wire0;
            end
          reg18 <= $signed(reg7[(1'h1):(1'h0)]);
        end
    end
  always
    @(posedge clk) begin
      if ($unsigned($signed((reg5[(2'h2):(1'h1)] > reg13))))
        begin
          reg19 <= ({($unsigned(((8'hb0) <<< reg16)) ? (!reg16) : reg17)} ?
              $signed($unsigned((reg6[(5'h13):(2'h2)] ?
                  (reg17 ? (8'ha9) : reg11) : (wire4 ?
                      wire4 : wire0)))) : (~&reg14[(1'h0):(1'h0)]));
          if ((reg9[(2'h2):(1'h0)] ?
              wire1[(5'h10):(2'h2)] : reg8[(4'hd):(4'ha)]))
            begin
              reg20 <= wire4;
              reg21 <= (wire3[(4'hd):(1'h1)] ?
                  {$signed((((8'hbe) * (8'ha2)) ^ reg15[(4'hc):(2'h2)]))} : ((((reg16 - reg16) ?
                          (reg20 ?
                              reg5 : reg8) : reg20) || {reg11[(4'hd):(4'ha)],
                          (wire4 ? reg5 : reg12)}) ?
                      (~&reg10[(4'hd):(3'h4)]) : $signed(wire1[(4'hb):(3'h5)])));
              reg22 <= {wire2,
                  $signed((reg18 ?
                      (reg9[(2'h3):(2'h3)] ?
                          {reg9,
                              (8'hb7)} : (~reg9)) : $signed(reg21[(5'h14):(5'h10)])))};
              reg23 <= (~^((reg15[(4'he):(4'ha)] || $signed($unsigned(reg15))) | $unsigned(($signed(reg13) ?
                  reg11 : (!wire4)))));
              reg24 <= reg11;
            end
          else
            begin
              reg20 <= (!$unsigned(reg7[(2'h2):(2'h2)]));
              reg21 <= (wire3[(1'h1):(1'h0)] ?
                  (8'hb8) : ($unsigned(((wire4 ? (8'hbb) : reg21) ?
                      (reg22 ?
                          reg6 : reg19) : (reg13 == reg21))) > $unsigned(reg18)));
            end
          reg25 <= (reg13[(4'h8):(3'h4)] ? reg22 : reg13);
        end
      else
        begin
          reg19 <= $unsigned(reg18);
        end
      reg26 <= $unsigned($signed((reg24[(2'h3):(2'h2)] ?
          (!{reg22, reg14}) : $unsigned($unsigned(reg20)))));
      reg27 <= (8'ha9);
      if ((reg8 ?
          $unsigned(reg9[(1'h1):(1'h1)]) : ((-$unsigned({wire1,
              reg11})) < wire4[(1'h0):(1'h0)])))
        begin
          reg28 <= $signed($unsigned($unsigned(((~&(8'hbe)) ?
              (reg11 | reg17) : (wire4 ? reg24 : reg5)))));
          reg29 <= reg25;
          reg30 <= $unsigned({$unsigned((reg24 ?
                  (reg29 ? (8'hbb) : wire3) : (8'ha6))),
              ({{(8'ha9), reg15}} ? reg26 : reg6[(4'hc):(3'h4)])});
          reg31 <= (~|$signed($unsigned((~&$signed((8'hb5))))));
        end
      else
        begin
          if (reg27[(5'h13):(4'hd)])
            begin
              reg28 <= (reg23[(2'h3):(2'h3)] ?
                  $unsigned(((^(+reg21)) >> {wire3,
                      (reg25 ? reg21 : reg5)})) : (wire4 ^~ (((reg7 ?
                          wire2 : reg7) ?
                      (reg25 ?
                          wire0 : reg31) : (reg9 | (7'h42))) <= $signed({reg28,
                      reg31}))));
            end
          else
            begin
              reg28 <= reg26;
              reg29 <= reg21[(5'h14):(4'hd)];
              reg30 <= ($signed(((~|(reg15 ?
                      wire1 : reg24)) >> $unsigned((~|reg15)))) ?
                  reg16 : $unsigned(wire1[(1'h0):(1'h0)]));
            end
          reg31 <= $signed(($signed(((-reg15) >= (!reg17))) >> ({reg18,
                  $signed(wire1)} ?
              (|(reg30 <<< reg18)) : (~&(reg21 && reg11)))));
          if ((-$signed({reg15, reg28[(2'h2):(1'h0)]})))
            begin
              reg32 <= (!(+{((!(8'hb8)) << ((8'ha1) <<< (8'hbb))),
                  {$unsigned(wire3), {reg8}}}));
            end
          else
            begin
              reg32 <= ((({$unsigned(reg9)} << reg6) ?
                  $signed({(8'hb6)}) : ((8'hb5) == ((reg23 ?
                      wire0 : reg30) <<< {reg21}))) >> $signed(($unsigned((reg13 != reg23)) ^~ (reg10[(3'h6):(3'h5)] >>> $unsigned(reg7)))));
              reg33 <= $signed(reg21);
              reg34 <= (^~reg28[(1'h0):(1'h0)]);
              reg35 <= {(reg31[(1'h0):(1'h0)] ?
                      {(reg20 ? (-reg6) : (reg29 ? reg6 : (7'h44))),
                          $unsigned($signed(reg10))} : reg22[(2'h2):(1'h0)]),
                  reg21[(4'hf):(4'h9)]};
              reg36 <= $unsigned((reg17 != (-$signed((-(8'hb5))))));
            end
          if ((7'h43))
            begin
              reg37 <= $signed((~&($unsigned(((8'hb4) ? wire0 : (8'hab))) ?
                  ($unsigned(reg6) ^ reg29[(1'h1):(1'h0)]) : {{(8'hb1)}})));
            end
          else
            begin
              reg37 <= $signed(reg13);
            end
          reg38 <= ($signed(reg37[(1'h1):(1'h0)]) <= (wire0 ?
              (((wire1 ? wire2 : (8'hae)) << (wire2 << reg22)) ?
                  $unsigned((&(8'had))) : wire4[(2'h2):(1'h0)]) : (~&{reg9[(1'h1):(1'h0)],
                  reg27[(4'h8):(3'h7)]})));
        end
      reg39 <= wire3[(2'h3):(1'h0)];
    end
  always
    @(posedge clk) begin
      if ($signed(reg8))
        begin
          reg40 <= (^~(~(wire2 ? reg20 : $unsigned({(7'h44)}))));
          reg41 <= (($signed(reg19[(5'h10):(2'h2)]) ?
              (reg33[(3'h5):(3'h4)] != ((~|reg39) ?
                  {reg39} : reg5[(2'h3):(1'h1)])) : {$signed({reg15,
                      reg5})}) ~^ (reg7[(2'h2):(1'h1)] - $unsigned(reg7[(1'h0):(1'h0)])));
          reg42 <= $signed(reg8[(4'he):(1'h0)]);
          reg43 <= (~&$unsigned(reg35));
          if (((~^($unsigned((reg8 ? reg37 : (8'hab))) ?
                  (^~$unsigned(reg35)) : (~$unsigned((8'hab))))) ?
              ($signed((reg34 ?
                  (reg24 ? reg17 : reg10) : $signed(wire2))) - (({reg38} ?
                  ((8'hb4) ?
                      (8'had) : reg5) : {reg21}) ^~ reg27)) : reg40[(4'hc):(4'hb)]))
            begin
              reg44 <= reg39[(1'h1):(1'h0)];
              reg45 <= reg32;
              reg46 <= reg36[(4'hb):(1'h1)];
              reg47 <= (&((^reg5) && ($unsigned((reg28 <= reg21)) ?
                  ((8'hac) > $signed(reg23)) : $unsigned((reg36 << reg18)))));
              reg48 <= $signed($unsigned({(((8'hbe) != reg38) ?
                      reg25[(1'h1):(1'h0)] : $signed((8'hbd)))}));
            end
          else
            begin
              reg44 <= ({$unsigned((-reg17[(4'ha):(3'h7)])),
                      (~$unsigned($unsigned(reg27)))} ?
                  ($unsigned({reg32[(3'h5):(3'h4)],
                      (reg42 && reg28)}) ^~ (reg36 + $signed((reg33 ?
                      reg20 : reg48)))) : wire3);
              reg45 <= $unsigned(reg20[(3'h4):(3'h4)]);
              reg46 <= reg16;
            end
        end
      else
        begin
          if (reg5[(3'h5):(1'h0)])
            begin
              reg40 <= {reg41[(3'h5):(3'h5)]};
              reg41 <= ($signed(reg26[(3'h6):(1'h0)]) || $signed(reg45[(3'h4):(2'h2)]));
            end
          else
            begin
              reg40 <= ((^reg13[(3'h4):(3'h4)]) ?
                  $signed(reg16) : reg27[(5'h13):(5'h12)]);
            end
        end
    end
  assign wire49 = reg44;
  always
    @(posedge clk) begin
      if (reg19[(4'h8):(2'h3)])
        begin
          if ((($signed($unsigned((reg13 <<< reg40))) <= reg42) > wire1))
            begin
              reg50 <= (|(|$unsigned(($signed(reg31) ?
                  (reg5 >> reg43) : (wire49 ? wire1 : (7'h43))))));
              reg51 <= reg14[(1'h1):(1'h0)];
              reg52 <= reg43;
              reg53 <= $signed(($signed({reg32[(1'h0):(1'h0)],
                      ((8'had) ? wire49 : (8'ha9))}) ?
                  (8'hb3) : (!$unsigned((!reg47)))));
              reg54 <= $unsigned(reg31);
            end
          else
            begin
              reg50 <= $signed(reg29[(1'h1):(1'h1)]);
              reg51 <= (($unsigned((wire2 ?
                  reg22 : (reg50 | (8'ha6)))) != {{reg47}}) << (($unsigned((!reg52)) > $unsigned({reg10})) <<< $signed({(reg43 ?
                      reg26 : reg5)})));
              reg52 <= (reg27 + ($signed(reg46) ?
                  reg14[(1'h1):(1'h1)] : {reg44}));
            end
          reg55 <= (reg33 ?
              {$signed(reg26),
                  (~^{(8'hba)})} : $signed($signed($signed((~^reg13)))));
        end
      else
        begin
          if ((8'hb4))
            begin
              reg50 <= reg18[(4'he):(3'h7)];
            end
          else
            begin
              reg50 <= {reg29[(1'h0):(1'h0)],
                  ((($signed(reg43) ? (~^reg34) : ((8'haf) == reg25)) ?
                          reg48[(2'h3):(2'h3)] : $signed((reg11 >= (8'hbe)))) ?
                      $unsigned($signed(reg39[(1'h1):(1'h1)])) : (^~$unsigned((~|wire0))))};
              reg51 <= {(&reg10[(4'hd):(3'h6)]),
                  (reg43 ?
                      ({$unsigned(reg28)} ?
                          ($signed(reg51) ?
                              $unsigned(wire49) : {(8'hb4),
                                  reg45}) : wire4) : $unsigned(reg50))};
              reg52 <= (wire3[(3'h6):(3'h5)] ?
                  (reg53[(3'h7):(3'h5)] + $unsigned((~&(8'ha5)))) : {(7'h42)});
              reg53 <= (((~^((wire2 > reg51) * $signed(reg37))) ?
                      reg41 : (&(8'haa))) ?
                  {$signed(reg23[(1'h0):(1'h0)]),
                      (8'hb7)} : ($unsigned(reg47[(4'h9):(1'h0)]) ?
                      $signed($unsigned((reg31 ?
                          (8'hb5) : (8'ha0)))) : (8'hb2)));
              reg54 <= reg25[(4'hb):(1'h1)];
            end
          reg55 <= ({$signed(($signed(reg21) ?
                      {reg36} : reg30[(1'h1):(1'h0)]))} ?
              (($signed(reg44[(3'h6):(3'h4)]) <<< reg24[(1'h0):(1'h0)]) ?
                  $unsigned(wire3[(1'h1):(1'h0)]) : $unsigned({(~reg34)})) : (&reg47));
          reg56 <= {$signed($unsigned((^~(-reg41))))};
          reg57 <= reg20;
          if ($signed((^reg10[(4'ha):(3'h4)])))
            begin
              reg58 <= ($unsigned(reg46) != ($unsigned(((8'ha3) ?
                      reg22 : (reg36 >>> (8'hb5)))) ?
                  $signed(((8'hbd) ?
                      reg7 : (reg19 ^ reg47))) : (!(reg17 <= reg48))));
              reg59 <= reg21[(3'h7):(3'h4)];
              reg60 <= (((reg45 ? reg22[(2'h2):(2'h2)] : reg7) ?
                  reg18 : (reg32[(2'h3):(2'h2)] ?
                      $signed(reg57) : ((~|reg56) >= ((8'hb9) == reg33)))) <<< reg57);
            end
          else
            begin
              reg58 <= reg38[(4'h9):(3'h7)];
              reg59 <= reg11[(3'h4):(1'h1)];
              reg60 <= reg8[(4'hd):(4'hb)];
              reg61 <= (&(($signed(reg6) ?
                      (reg35 ?
                          (|reg45) : reg27[(3'h4):(2'h2)]) : (-(^~reg58))) ?
                  reg58 : (wire4[(1'h0):(1'h0)] + {{reg38, reg9}, reg41})));
            end
        end
      reg62 <= (-reg26[(4'ha):(3'h7)]);
      reg63 <= reg35[(3'h7):(3'h4)];
      reg64 <= $unsigned(reg33);
      reg65 <= {$signed((((wire2 ? reg38 : (8'hb7)) ?
              reg36 : {reg18, reg34}) - reg17)),
          reg61};
    end
  assign wire66 = ({reg48[(3'h4):(1'h1)],
                      $signed($signed({reg36}))} >= $signed(((|$signed(reg55)) <= ($signed(reg60) > reg56))));
  always
    @(posedge clk) begin
      reg67 <= $signed(reg41[(4'hc):(4'h8)]);
    end
  assign wire68 = $signed(((reg38[(1'h0):(1'h0)] || reg24) ?
                      $unsigned($unsigned((reg51 ?
                          reg8 : reg61))) : (wire3[(1'h1):(1'h1)] ?
                          $unsigned((~|reg33)) : (~$unsigned(reg37)))));
  assign wire69 = reg58[(3'h6):(3'h6)];
  assign wire70 = (~^(!reg5));
  assign wire71 = $signed($unsigned($signed($unsigned(((7'h42) ?
                      reg11 : reg20)))));
  assign wire72 = (~$signed({{(reg54 & reg33), wire71}, (&$unsigned(reg11))}));
  assign wire73 = reg53;
  assign wire74 = (wire71[(1'h1):(1'h1)] || ((~^(reg46 == $signed(reg43))) ?
                      {$unsigned({reg65, reg25})} : {((^~reg50) != reg47)}));
  assign wire75 = ((^~($signed((reg37 * reg51)) ?
                      $unsigned((reg28 != (7'h40))) : (reg27[(4'hb):(4'h8)] ?
                          (reg14 >>> reg34) : $unsigned(reg15)))) ^ $unsigned(reg21));
endmodule
