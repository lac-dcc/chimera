module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h2e0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire72;
  wire [(2'h2):(1'h0)] wire71;
  wire [(4'hf):(1'h0)] wire68;
  wire [(3'h6):(1'h0)] wire67;
  wire [(3'h6):(1'h0)] wire66;
  wire [(3'h7):(1'h0)] wire48;
  wire signed [(4'h9):(1'h0)] wire26;
  wire [(3'h7):(1'h0)] wire25;
  wire [(5'h15):(1'h0)] wire24;
  wire signed [(4'he):(1'h0)] wire23;
  wire signed [(4'hc):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  reg [(4'hb):(1'h0)] reg70 = (1'h0);
  reg [(4'ha):(1'h0)] reg69 = (1'h0);
  reg [(3'h6):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg63 = (1'h0);
  reg [(4'h9):(1'h0)] reg62 = (1'h0);
  reg [(3'h5):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg57 = (1'h0);
  reg [(3'h5):(1'h0)] reg56 = (1'h0);
  reg [(4'hf):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg52 = (1'h0);
  reg [(2'h2):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg49 = (1'h0);
  reg [(3'h5):(1'h0)] reg47 = (1'h0);
  reg [(4'h9):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(3'h4):(1'h0)] reg41 = (1'h0);
  reg [(2'h2):(1'h0)] reg40 = (1'h0);
  reg [(3'h5):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg28 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire68,
                 wire67,
                 wire66,
                 wire48,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire7,
                 wire6,
                 wire5,
                 reg70,
                 reg69,
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
                 (1'h0)};
  assign wire5 = {{($unsigned($signed((8'haa))) + (^(wire0 <<< (8'hbd)))),
                         ((~&(~wire2)) ?
                             (~&((8'ha5) ?
                                 wire4 : wire3)) : wire2[(1'h0):(1'h0)])}};
  assign wire6 = (|{$signed(wire0[(3'h6):(1'h1)])});
  assign wire7 = $signed(wire6[(3'h4):(1'h0)]);
  always
    @(posedge clk) begin
      if ((|wire0[(4'h8):(1'h0)]))
        begin
          reg8 <= wire4;
          if ({{($unsigned(wire7) ? wire6 : $signed($unsigned(wire2)))},
              (reg8 ?
                  $signed($signed({wire7,
                      wire7})) : (wire3[(2'h2):(1'h1)] >>> (wire1 ?
                      wire4[(1'h1):(1'h1)] : wire5)))})
            begin
              reg9 <= (7'h44);
            end
          else
            begin
              reg9 <= (|$unsigned($unsigned((reg9 ?
                  $signed(wire0) : ((8'hb3) | wire2)))));
              reg10 <= $unsigned($signed($unsigned($signed($unsigned(wire4)))));
            end
          reg11 <= $unsigned($unsigned({wire4[(1'h1):(1'h0)], wire6}));
          reg12 <= $signed((&reg10));
        end
      else
        begin
          if ($unsigned((wire0 ?
              (((reg11 ?
                  wire7 : (8'ha8)) > ((8'hb8) > wire5)) ^~ ({reg10} >> wire6)) : wire1[(1'h0):(1'h0)])))
            begin
              reg8 <= reg12;
            end
          else
            begin
              reg8 <= $unsigned(((wire6 >>> wire7) << reg12[(3'h4):(2'h2)]));
              reg9 <= ((!($unsigned(wire2) ?
                      reg11 : $signed(((8'ha4) >>> reg8)))) ?
                  ((8'hb2) ?
                      reg9[(2'h2):(1'h0)] : ((-(wire6 ? (8'hb8) : wire5)) ?
                          $signed((wire6 ? wire0 : reg9)) : ((wire5 ?
                              reg9 : wire3) >> $unsigned((8'h9f))))) : $unsigned((8'ha6)));
            end
          reg10 <= wire5[(2'h3):(2'h2)];
        end
      if (wire3[(3'h6):(1'h1)])
        begin
          reg13 <= (~|{(reg9 - ($signed(reg8) && wire1))});
          if ((wire5[(2'h3):(2'h3)] ?
              (((wire7 ?
                  (7'h41) : (wire3 ~^ wire7)) || wire1) && reg10[(1'h0):(1'h0)]) : wire6[(1'h0):(1'h0)]))
            begin
              reg14 <= {reg9[(1'h1):(1'h0)]};
            end
          else
            begin
              reg14 <= ((~((^~reg8) <= ((reg10 ?
                  wire7 : wire1) ^~ (|wire5)))) || wire2[(2'h3):(1'h0)]);
              reg15 <= {({reg13,
                          ($unsigned(wire0) ?
                              $signed(reg12) : $unsigned(wire2))} ?
                      $unsigned({((8'hbd) ? wire7 : wire5),
                          {wire4}}) : $unsigned(wire6[(2'h2):(1'h0)]))};
              reg16 <= reg13[(4'h9):(1'h1)];
              reg17 <= wire0;
            end
          reg18 <= (-$unsigned({((~^(8'hb2)) ? reg9[(2'h2):(1'h1)] : (|wire7)),
              (7'h42)}));
          reg19 <= wire0;
          reg20 <= $signed(($signed($unsigned($unsigned((8'ha6)))) == {($signed(reg12) <= (^~wire3)),
              (reg9[(1'h1):(1'h0)] <= (reg12 >> reg14))}));
        end
      else
        begin
          if (wire2)
            begin
              reg13 <= (!$unsigned(wire4[(1'h1):(1'h0)]));
              reg14 <= {$signed({$unsigned({reg8, wire1})})};
              reg15 <= ({((~^$unsigned(reg19)) <<< ((reg11 ?
                      reg17 : reg20) == reg11))} | (reg12[(2'h3):(2'h3)] ?
                  $signed(reg16) : wire2));
              reg16 <= ($unsigned($unsigned((^(reg10 ?
                  wire1 : reg9)))) * $unsigned($signed(wire1[(1'h0):(1'h0)])));
              reg17 <= ($signed({$unsigned((-(8'hb3)))}) > (~($unsigned(reg15) | (reg15[(5'h10):(4'ha)] && {(8'hb1),
                  wire3}))));
            end
          else
            begin
              reg13 <= reg19;
              reg14 <= $signed(({($signed(reg11) ^~ wire7)} ?
                  $signed($signed(reg17)) : $signed(((reg10 ?
                      (8'ha1) : reg12) << $signed(reg19)))));
              reg15 <= ({((&((8'hb9) | reg16)) * ((reg10 == (8'h9c)) >> (reg9 ?
                          reg9 : wire5))),
                      reg9[(2'h3):(2'h3)]} ?
                  reg17[(5'h13):(1'h0)] : reg19);
            end
        end
      reg21 <= reg20[(2'h3):(2'h2)];
      reg22 <= $signed(reg12);
    end
  assign wire23 = $unsigned(($signed(wire2) ?
                      {$signed((8'hbd))} : ({$signed(reg14),
                          $unsigned(reg10)} << (wire0 || reg21[(4'ha):(3'h5)]))));
  assign wire24 = (((^~$signed(reg17)) ?
                          wire4[(2'h3):(1'h1)] : $signed((reg13 ^~ reg16))) ?
                      (reg17 ?
                          (^(8'hab)) : reg18[(4'h8):(4'h8)]) : $signed((~|{$unsigned(reg12),
                          $signed(wire7)})));
  assign wire25 = wire5[(4'hc):(3'h7)];
  assign wire26 = ((8'h9c) ~^ ((~(^~{reg22})) | ($signed((reg13 * (8'hae))) >= $unsigned(wire7[(4'h8):(3'h7)]))));
  always
    @(posedge clk) begin
      if ((wire25[(3'h6):(2'h3)] >= wire3))
        begin
          if (((($signed($signed((8'ha6))) || wire4) >= $signed($unsigned(wire0[(3'h4):(2'h3)]))) >> {$signed($signed((reg22 ?
                  wire6 : reg14))),
              ((^~reg17[(4'hf):(2'h2)]) + ($unsigned(wire25) ?
                  wire0[(3'h4):(3'h4)] : reg20[(2'h3):(2'h3)]))}))
            begin
              reg27 <= {reg16[(2'h2):(1'h1)]};
              reg28 <= (^wire7);
              reg29 <= wire7;
              reg30 <= $unsigned($unsigned(reg20));
              reg31 <= $signed(reg18);
            end
          else
            begin
              reg27 <= reg31;
              reg28 <= $signed($unsigned(reg28));
              reg29 <= ($signed((!(~&reg15))) || (($unsigned((reg10 ?
                      reg19 : reg13)) ?
                  ((reg10 ~^ reg22) >= $signed(reg29)) : ($unsigned(wire5) & (!reg15))) || (((reg8 ?
                      reg13 : (8'hb0)) ?
                  $signed(wire4) : (reg12 ?
                      reg17 : (8'ha5))) >= wire2[(3'h5):(2'h2)])));
              reg30 <= reg9[(1'h0):(1'h0)];
              reg31 <= $signed((~|reg12[(4'hf):(4'hd)]));
            end
          reg32 <= reg20;
          if (reg30[(4'h8):(1'h1)])
            begin
              reg33 <= (8'haa);
            end
          else
            begin
              reg33 <= {reg15[(5'h12):(5'h12)], ($unsigned((|reg33)) << reg9)};
              reg34 <= wire24[(4'he):(4'hd)];
            end
          reg35 <= {wire2};
        end
      else
        begin
          reg27 <= wire25[(1'h0):(1'h0)];
          reg28 <= $signed(reg31);
          reg29 <= reg9[(1'h1):(1'h0)];
        end
      reg36 <= ($signed($unsigned((~|(wire26 ? wire26 : wire1)))) ?
          (!wire24) : reg16[(3'h6):(1'h0)]);
      reg37 <= (((&reg30) ?
              ($signed((reg14 ?
                  (8'hb5) : (7'h44))) > (8'h9f)) : {wire6[(1'h0):(1'h0)],
                  (-wire23)}) ?
          reg32 : (reg29[(3'h4):(2'h2)] ?
              $signed({$unsigned((8'hb7))}) : ({reg33[(4'he):(3'h6)]} ?
                  ((8'ha9) + $unsigned(reg11)) : ($signed(wire25) ^~ (reg17 ?
                      reg15 : wire6)))));
      reg38 <= ($signed($signed(reg31[(1'h0):(1'h0)])) || $signed({$signed((|wire26))}));
      if ((($signed((reg13 ? $signed(wire25) : $unsigned((8'hb8)))) ?
              (~&(reg20[(1'h1):(1'h1)] ?
                  (~wire5) : (reg32 >> reg22))) : (~&$unsigned((~(8'hab))))) ?
          {$signed($signed({wire6}))} : (~^reg32)))
        begin
          if (wire0)
            begin
              reg39 <= (wire4 ?
                  ((~|(^$signed(reg11))) && (!wire5)) : {$unsigned($signed(wire23[(2'h3):(1'h1)]))});
              reg40 <= $unsigned(reg9[(2'h3):(2'h2)]);
              reg41 <= (^(reg31 ?
                  ((~|reg12[(3'h7):(3'h6)]) ?
                      ($unsigned(reg33) ^ (~(8'hab))) : (^(reg19 ?
                          (7'h41) : reg32))) : $signed(reg27[(2'h2):(1'h0)])));
              reg42 <= $unsigned(reg35[(2'h2):(1'h0)]);
              reg43 <= $signed($signed((+(-wire3))));
            end
          else
            begin
              reg39 <= reg35;
              reg40 <= $signed(reg35[(4'he):(4'h9)]);
              reg41 <= $unsigned($unsigned(reg37[(1'h1):(1'h0)]));
              reg42 <= ($unsigned((((!reg31) < (reg28 == reg41)) ?
                      $unsigned(reg43[(4'hd):(1'h0)]) : $signed((wire3 ?
                          (8'hb1) : wire24)))) ?
                  (|$signed({wire3, (~|reg21)})) : {({wire5} ?
                          ($unsigned((7'h40)) < $unsigned(reg37)) : wire6[(2'h2):(1'h0)])});
              reg43 <= wire23[(4'h9):(1'h0)];
            end
          if (reg27)
            begin
              reg44 <= $signed(($unsigned($signed((-(8'ha4)))) ?
                  reg32[(3'h6):(2'h2)] : (~^((reg37 > (8'hab)) ?
                      $unsigned(reg18) : reg15))));
            end
          else
            begin
              reg44 <= ({(reg22[(3'h7):(1'h1)] ?
                          (~|$signed(reg21)) : $unsigned(reg37[(5'h12):(3'h5)])),
                      $signed($unsigned(reg42))} ?
                  {$signed($signed(reg34[(2'h2):(1'h0)])),
                      $signed($signed(wire0))} : (8'hb1));
            end
          if (($unsigned({$unsigned((reg8 + (8'hb8)))}) ?
              wire0[(3'h4):(1'h0)] : $unsigned(reg19)))
            begin
              reg45 <= {(((~|{reg11}) ?
                      ((8'ha1) && reg11) : ($signed(wire4) ?
                          reg28[(4'ha):(1'h1)] : reg28)) <<< ({{wire25}} ?
                      $signed($signed(reg22)) : $signed(((8'hbf) >= reg21)))),
                  reg39[(1'h0):(1'h0)]};
              reg46 <= $signed(reg18[(5'h11):(5'h11)]);
              reg47 <= $unsigned($signed((reg44 ?
                  ($signed(reg11) ?
                      $signed(reg18) : reg16[(1'h1):(1'h0)]) : $unsigned((reg16 <= wire3)))));
            end
          else
            begin
              reg45 <= reg30[(4'h8):(4'h8)];
              reg46 <= $unsigned(((8'ha3) | $signed((~reg21[(2'h2):(1'h1)]))));
              reg47 <= {(~|reg34)};
            end
        end
      else
        begin
          reg39 <= (((reg11 ?
              ((reg20 ? reg43 : reg16) || reg22) : ({(8'haa), wire1} ~^ (wire4 ?
                  reg34 : reg42))) ^~ ((|((8'h9e) ? reg11 : reg32)) ?
              {$signed(reg42)} : {(8'had)})) >= ($signed(wire23[(4'hc):(3'h7)]) ?
              ($signed(reg46[(1'h1):(1'h0)]) | reg46) : (!(+$unsigned(reg27)))));
          reg40 <= reg17;
          reg41 <= $signed((((8'ha4) < $signed($signed(wire3))) >>> $unsigned(wire25)));
        end
    end
  assign wire48 = wire3[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg49 <= (((|reg30) ?
              reg35[(4'hf):(4'hd)] : ($signed(reg21) ?
                  (~$signed(wire23)) : $unsigned(reg22))) ?
          {$unsigned(wire0[(1'h1):(1'h0)])} : $unsigned(wire3));
      reg50 <= reg33[(3'h6):(2'h2)];
      if (($unsigned(((reg14 != reg32) ?
          $signed(reg46) : reg28)) >>> $unsigned(reg11)))
        begin
          if (reg42[(1'h1):(1'h1)])
            begin
              reg51 <= $unsigned((reg34[(3'h6):(1'h0)] >>> $signed(((wire3 ?
                      reg28 : reg38) ?
                  (reg39 == reg49) : $signed(reg19)))));
            end
          else
            begin
              reg51 <= $unsigned(($signed({(|reg43)}) ?
                  (reg22 >>> $unsigned((reg9 < reg13))) : $unsigned($unsigned(reg13[(4'hd):(4'ha)]))));
              reg52 <= reg28;
              reg53 <= reg43[(4'hf):(4'h8)];
            end
          reg54 <= {(~^wire6[(1'h0):(1'h0)]), $unsigned(wire2[(4'he):(4'h8)])};
          if ($signed($unsigned({(((8'ha6) - reg49) ^ $unsigned(reg8))})))
            begin
              reg55 <= ($unsigned($signed((7'h40))) ?
                  ((($unsigned((7'h40)) >>> $signed(reg47)) < {(wire23 ?
                              reg47 : reg38),
                          wire48[(3'h5):(1'h1)]}) ?
                      (!{reg54[(1'h0):(1'h0)]}) : $unsigned({(reg41 & (8'haf)),
                          (reg28 ? reg9 : reg14)})) : (8'h9f));
              reg56 <= $unsigned((((|(wire7 || reg49)) ?
                      (8'ha1) : $unsigned((reg38 ? reg32 : (8'h9c)))) ?
                  (^~(~(^wire4))) : (wire48[(3'h7):(2'h2)] == reg42)));
            end
          else
            begin
              reg55 <= ((((reg45[(4'he):(4'he)] && $unsigned(reg31)) >>> reg28[(4'ha):(1'h1)]) ~^ (!(!reg33))) || $signed(reg14));
              reg56 <= $signed($unsigned({$unsigned((&wire6))}));
              reg57 <= $unsigned($unsigned($signed(($unsigned((8'ha2)) ?
                  reg45[(1'h0):(1'h0)] : wire25))));
              reg58 <= $signed((~|wire0[(3'h4):(1'h1)]));
              reg59 <= reg56;
            end
          if (({$signed($signed(wire4[(3'h5):(3'h4)]))} ?
              (($signed(reg15) ^ reg34[(2'h3):(2'h2)]) | (((reg39 > wire6) ?
                  wire23[(4'h9):(1'h1)] : wire7[(4'h8):(2'h2)]) ^~ ((reg17 != wire7) && wire1))) : (&reg19)))
            begin
              reg60 <= (&{(reg16[(3'h5):(1'h1)] >= ((reg50 & reg55) ^ (reg56 ?
                      reg27 : reg51))),
                  $unsigned(reg59[(1'h1):(1'h0)])});
              reg61 <= reg14;
              reg62 <= reg43[(4'hc):(1'h1)];
              reg63 <= ($signed($signed($signed($signed((7'h44))))) ^ ((((^reg53) ?
                      $unsigned(reg44) : $signed(reg44)) ~^ {$signed(reg45)}) ?
                  ($signed((reg9 <= wire0)) & (~(~^(8'hba)))) : (($signed(reg44) * reg52[(1'h1):(1'h1)]) ?
                      $signed($signed(reg8)) : (^((8'hbf) >= wire24)))));
              reg64 <= $unsigned((((8'h9f) << reg55[(2'h3):(2'h2)]) ?
                  (reg33 ? reg30 : reg34) : {{(~reg59)}}));
            end
          else
            begin
              reg60 <= $unsigned(reg58[(4'h9):(2'h2)]);
              reg61 <= $signed(wire7);
              reg62 <= (((({reg37,
                          reg39} >>> (|reg55)) || ((^~reg61) << reg9[(1'h1):(1'h0)])) ?
                      (((reg21 ^ reg39) <= $signed(reg40)) * $signed(reg49)) : (reg55 >> reg40)) ?
                  (((8'ha9) <<< $signed((reg31 == reg31))) ?
                      reg62 : ((8'ha5) < ((reg42 ~^ (8'ha3)) ?
                          reg47 : $unsigned(wire0)))) : reg18);
              reg63 <= $unsigned(wire26);
            end
          reg65 <= reg52[(1'h1):(1'h1)];
        end
      else
        begin
          reg51 <= ($unsigned((reg50 ?
                  $unsigned(reg11[(4'hc):(4'hc)]) : (+$unsigned(reg38)))) ?
              (({(reg60 ? (8'hac) : reg58),
                      $unsigned(reg42)} < (reg65[(1'h1):(1'h1)] ?
                      (reg34 ? reg60 : (7'h41)) : (reg21 - reg39))) ?
                  (^~(|(wire23 ?
                      reg15 : reg62))) : $signed(wire2)) : (reg37[(1'h1):(1'h1)] && (+reg15)));
          reg52 <= reg21;
          if ($signed($signed(reg57[(5'h10):(3'h7)])))
            begin
              reg53 <= reg40[(2'h2):(2'h2)];
            end
          else
            begin
              reg53 <= ((|wire4[(3'h4):(1'h0)]) ?
                  reg60 : (($signed((reg63 ?
                      reg60 : wire5)) - reg47) ^~ wire7[(4'ha):(4'h9)]));
              reg54 <= (8'haf);
              reg55 <= ($unsigned($unsigned(reg13)) < reg55);
              reg56 <= $signed($signed(($signed((reg18 * wire6)) ~^ (~^$unsigned(wire0)))));
            end
          reg57 <= ((reg11[(5'h10):(4'hc)] ?
              reg21 : ($unsigned(reg10) ?
                  reg28[(4'he):(2'h3)] : {reg45})) >= wire2[(4'hb):(3'h6)]);
        end
    end
  assign wire66 = {{$signed(($signed(reg47) == (^reg40))), (8'hb8)}};
  assign wire67 = $signed((wire6 ~^ $unsigned(reg20[(1'h0):(1'h0)])));
  assign wire68 = $signed($unsigned((~{(reg39 ? reg19 : reg32), (!wire7)})));
  always
    @(posedge clk) begin
      if ((~^$signed((&reg39[(2'h2):(1'h1)]))))
        begin
          reg69 <= (&reg27[(3'h4):(2'h3)]);
        end
      else
        begin
          reg69 <= ((((reg40 ? (+reg30) : ((8'ha7) ? reg43 : (8'hbb))) ?
              ($signed(reg27) ~^ wire24[(4'hc):(4'h9)]) : $signed((wire23 || reg14))) == ((!$unsigned(reg50)) <= $unsigned($signed(reg18)))) <<< reg45);
        end
      reg70 <= ((wire23[(2'h2):(2'h2)] || ($unsigned((~|(8'haf))) < $signed($signed(reg60)))) ?
          ((wire2[(3'h5):(3'h4)] ?
                  $signed(wire1) : ((reg18 & (8'h9e)) ~^ $unsigned(reg59))) ?
              (((~|reg12) <<< reg53) ?
                  {(-reg12), ((7'h40) | reg15)} : (wire48 + ((8'hac) ?
                      reg22 : reg45))) : wire4) : reg36);
    end
  assign wire71 = reg62[(1'h1):(1'h0)];
  assign wire72 = $signed((~(~|$signed(reg57[(4'hb):(3'h4)]))));
endmodule
