module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2fd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire66;
  wire [(4'he):(1'h0)] wire65;
  wire signed [(4'hc):(1'h0)] wire64;
  wire signed [(4'h9):(1'h0)] wire63;
  wire [(4'h8):(1'h0)] wire53;
  wire [(2'h2):(1'h0)] wire52;
  wire [(2'h3):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire20;
  wire signed [(5'h10):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire17;
  wire [(4'h9):(1'h0)] wire16;
  wire [(4'ha):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire14;
  reg [(4'hb):(1'h0)] reg62 = (1'h0);
  reg [(5'h14):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg55 = (1'h0);
  reg [(4'hd):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg50 = (1'h0);
  reg [(5'h10):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg46 = (1'h0);
  reg [(5'h12):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg41 = (1'h0);
  reg [(5'h12):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(5'h13):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(2'h2):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg4 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire53,
                 wire52,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
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
                 reg22,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed($signed(wire2));
      reg5 <= (((!((8'hb7) ? (^~wire0) : (reg4 >>> wire2))) ?
          $signed($unsigned($signed(reg4))) : wire3) >> ($unsigned(reg4[(1'h0):(1'h0)]) ?
          (~^(wire2 - (wire3 >= wire2))) : $signed(wire1)));
      if ($unsigned($unsigned(reg5)))
        begin
          reg6 <= $signed(reg4[(1'h0):(1'h0)]);
          reg7 <= $unsigned({reg6, wire2[(3'h7):(3'h6)]});
          reg8 <= reg4;
        end
      else
        begin
          reg6 <= (+{reg4[(2'h2):(1'h1)], $signed(wire3[(2'h2):(1'h1)])});
          if (wire1[(5'h10):(1'h1)])
            begin
              reg7 <= reg8;
              reg8 <= wire1;
            end
          else
            begin
              reg7 <= wire3[(3'h5):(1'h1)];
              reg8 <= $signed((!(($signed(wire0) ?
                  {reg5, wire1} : (^~reg5)) > ((~^reg5) ^ $unsigned(reg6)))));
              reg9 <= $signed(((|$unsigned((reg4 >> wire2))) ?
                  wire1[(1'h0):(1'h0)] : (({wire3,
                          reg5} | wire1[(1'h1):(1'h0)]) ?
                      wire0[(1'h0):(1'h0)] : (wire3 ?
                          (8'h9c) : (reg8 ? wire2 : wire1)))));
              reg10 <= $unsigned(({$unsigned((reg8 == reg4))} ?
                  (((^reg8) ? wire1[(4'hf):(4'hf)] : (+wire1)) ^~ {{wire3,
                          reg9}}) : wire0[(3'h4):(2'h2)]));
            end
          reg11 <= $signed((-reg4));
        end
      reg12 <= (~|reg8);
      reg13 <= reg11;
    end
  assign wire14 = ((reg8[(4'hb):(3'h6)] ?
                          wire2[(3'h7):(2'h2)] : $signed((8'hb8))) ?
                      (reg13 ?
                          ($unsigned(wire1) ?
                              ((-wire3) * $signed(reg9)) : reg13[(2'h2):(1'h0)]) : (-((~|reg5) | wire3[(3'h5):(2'h2)]))) : $signed($unsigned({$unsigned(reg6)})));
  assign wire15 = ((reg12[(1'h1):(1'h0)] > wire1) ?
                      reg5 : $signed((($unsigned(reg13) >> (~^wire0)) ?
                          (-{wire14}) : ((8'hae) >>> {reg11, reg12}))));
  assign wire16 = (8'ha9);
  assign wire17 = $unsigned((|((^reg11) ?
                      ((reg8 == reg5) ?
                          $signed(wire14) : (reg9 - reg12)) : wire0[(4'hb):(3'h4)])));
  assign wire18 = ($signed($signed($signed($unsigned(wire2)))) ?
                      ($unsigned(wire16[(4'h9):(4'h8)]) << $unsigned($unsigned((wire16 | wire3)))) : (~{wire2[(3'h6):(3'h4)]}));
  assign wire19 = $signed({wire15[(1'h0):(1'h0)]});
  assign wire20 = {reg10[(2'h3):(1'h1)]};
  assign wire21 = (($unsigned($signed($unsigned(reg13))) <= $unsigned(wire3)) ?
                      {{(((8'haa) < (8'hb4)) == reg11[(2'h2):(1'h1)])}} : (^~(!wire17[(3'h4):(1'h1)])));
  always
    @(posedge clk) begin
      if ($unsigned(wire17[(1'h1):(1'h0)]))
        begin
          reg22 <= (-wire14[(2'h2):(1'h1)]);
          if ((+(reg13[(1'h0):(1'h0)] > $unsigned((((8'ha5) & reg9) > $unsigned(wire15))))))
            begin
              reg23 <= $signed(wire21[(2'h3):(2'h2)]);
              reg24 <= wire19;
              reg25 <= $unsigned(reg22);
              reg26 <= wire21;
            end
          else
            begin
              reg23 <= (((&wire19[(4'h9):(3'h5)]) ?
                  reg22[(3'h7):(3'h6)] : (reg12 ?
                      (~^(wire16 ? reg26 : reg25)) : (wire14 ?
                          reg7 : {wire3}))) ^ wire14);
              reg24 <= (+$unsigned(reg26[(1'h1):(1'h1)]));
              reg25 <= $unsigned({reg12[(4'h9):(1'h0)]});
              reg26 <= reg5[(5'h10):(3'h6)];
              reg27 <= wire21[(2'h2):(1'h0)];
            end
        end
      else
        begin
          reg22 <= (~^{((!(reg7 ? wire19 : reg22)) ?
                  (wire21[(2'h2):(2'h2)] <= {wire14}) : (reg12[(1'h0):(1'h0)] * (~&reg10)))});
          reg23 <= $signed(((reg6 ?
                  $signed(reg24[(1'h0):(1'h0)]) : (~&(wire2 ?
                      wire0 : wire15))) ?
              {$unsigned((reg26 == wire16)), wire2[(2'h3):(2'h3)]} : (8'ha2)));
          if (reg7)
            begin
              reg24 <= (wire19 > $signed((reg4[(3'h5):(3'h5)] ?
                  ($signed(wire19) ?
                      (~reg8) : $signed(wire16)) : ($unsigned(reg10) & (~reg24)))));
              reg25 <= reg27[(1'h0):(1'h0)];
              reg26 <= (reg9 >= $unsigned(reg8[(2'h3):(2'h3)]));
              reg27 <= $signed((~^{($unsigned(wire21) ?
                      {wire21} : $signed(reg5)),
                  (^(7'h41))}));
            end
          else
            begin
              reg24 <= wire1;
              reg25 <= $unsigned(wire17);
              reg26 <= (($unsigned($signed($signed(reg13))) + ($unsigned($signed(wire3)) ?
                  (((8'hbb) ? wire18 : wire0) ?
                      (~&wire16) : $unsigned((8'haf))) : $unsigned((^~reg24)))) && $unsigned((+((wire17 ?
                      reg4 : wire19) ?
                  (8'hb1) : wire20[(4'he):(3'h4)]))));
              reg27 <= wire1[(4'he):(2'h2)];
            end
          if ({$signed(((+(~|(8'hba))) <<< ((~reg7) ?
                  (reg9 ? wire16 : wire14) : {wire0})))})
            begin
              reg28 <= $signed((~|$unsigned($unsigned((wire16 ?
                  (8'h9e) : wire19)))));
              reg29 <= wire20;
              reg30 <= reg10[(1'h0):(1'h0)];
            end
          else
            begin
              reg28 <= {(~&((+reg28) < (((8'hba) ? reg8 : wire2) ?
                      reg8[(2'h3):(1'h0)] : $signed(wire3))))};
              reg29 <= wire21;
              reg30 <= {$unsigned((reg30 ?
                      reg7[(3'h4):(3'h4)] : wire16[(3'h4):(2'h3)]))};
              reg31 <= (~&($signed(($unsigned(reg12) + (wire14 ?
                      wire18 : (8'hb3)))) ?
                  wire20[(1'h1):(1'h1)] : ($signed($unsigned(wire15)) >>> $unsigned((8'hbe)))));
              reg32 <= ($unsigned(($unsigned($unsigned((8'hb7))) | ((reg24 <<< (8'hae)) || $unsigned(reg9)))) ?
                  ((|$signed((wire15 ? wire0 : wire18))) * {({wire18, (8'hb8)} ?
                          reg23[(3'h7):(1'h0)] : (^~wire21))}) : $unsigned($unsigned($unsigned(((8'hab) <= reg11)))));
            end
        end
      reg33 <= ((~$signed(reg5[(4'h9):(1'h1)])) < $unsigned($unsigned({(+(8'ha0)),
          (+reg30)})));
      if (wire18[(4'hb):(3'h7)])
        begin
          reg34 <= ((~|(-(~wire19[(4'hd):(2'h3)]))) << ({$signed($signed(wire3)),
              ($unsigned(reg23) ?
                  $signed((8'hab)) : (^reg8))} <<< ((^$signed((8'h9d))) ?
              ($signed(wire0) ^~ wire3[(3'h4):(2'h3)]) : ($unsigned(reg32) + ((8'ha9) ^ reg6)))));
          reg35 <= (^~reg6);
          if (reg34[(3'h5):(3'h5)])
            begin
              reg36 <= (((($unsigned((8'hbe)) ?
                          (-wire14) : (wire1 ?
                              reg5 : wire18)) <<< (reg30[(2'h2):(1'h0)] ^ reg32)) ?
                      $signed($unsigned($signed(reg5))) : ((wire19[(3'h7):(1'h1)] ?
                              {reg31} : (^reg23)) ?
                          reg32 : (8'hbb))) ?
                  $unsigned((((^reg22) ? reg5 : (~&reg10)) ?
                      wire15[(4'h8):(2'h3)] : ($signed(reg26) ?
                          wire15 : $signed((8'ha3))))) : $unsigned((^reg10)));
              reg37 <= (^$unsigned((~^($signed(reg29) ?
                  (reg31 != (8'haa)) : (-(8'had))))));
            end
          else
            begin
              reg36 <= $signed({(~^$unsigned($unsigned((8'hb2)))), (&reg22)});
              reg37 <= $unsigned($signed(reg12));
              reg38 <= (wire19 || (reg11[(1'h1):(1'h1)] == $unsigned((wire3[(2'h3):(1'h1)] ?
                  $signed((8'hbe)) : (~^reg22)))));
              reg39 <= $signed(($unsigned((reg8 == reg8)) ?
                  {reg8} : reg33[(2'h3):(2'h2)]));
            end
        end
      else
        begin
          reg34 <= wire19[(4'hb):(2'h3)];
          reg35 <= $signed({($signed((reg29 <<< (7'h41))) <= $signed((~|reg34))),
              ($unsigned((reg31 ? reg13 : reg25)) <= (reg11 ?
                  $unsigned(wire1) : (wire18 ? reg10 : reg39)))});
        end
      if ($unsigned(((reg6[(4'h8):(1'h1)] ?
          reg9[(2'h2):(2'h2)] : (wire18 ?
              {reg26} : (wire15 <= reg32))) * reg30)))
        begin
          reg40 <= $signed(reg10[(2'h2):(1'h0)]);
          reg41 <= $signed($signed($signed({wire16, (reg29 == reg9)})));
          if ($unsigned({$signed(((reg22 ? reg31 : reg4) ?
                  {reg29, wire15} : wire17[(3'h7):(3'h4)]))}))
            begin
              reg42 <= ({reg8,
                      ((reg36[(3'h5):(2'h3)] * {reg40, reg22}) ?
                          (~&(-reg27)) : reg23[(3'h6):(2'h2)])} ?
                  ((((8'h9f) ?
                          (reg24 << reg24) : reg7[(4'hd):(4'hd)]) & $signed((reg22 ?
                          wire17 : wire19))) ?
                      $unsigned((^~reg26)) : $unsigned(wire0[(1'h0):(1'h0)])) : reg24[(2'h3):(2'h3)]);
              reg43 <= $signed(((~^({reg30} <= (reg42 <= reg24))) ?
                  reg41[(1'h0):(1'h0)] : reg9[(2'h2):(2'h2)]));
            end
          else
            begin
              reg42 <= reg23[(1'h0):(1'h0)];
            end
          reg44 <= wire0;
          reg45 <= $signed((reg42[(3'h7):(3'h6)] ^ (wire0 ?
              reg33 : $unsigned($unsigned(wire15)))));
        end
      else
        begin
          reg40 <= $signed($unsigned(reg42));
          if (reg39[(4'hb):(3'h7)])
            begin
              reg41 <= $unsigned(({{wire20[(3'h4):(2'h2)],
                          wire20[(3'h5):(2'h3)]},
                      ((^reg4) ? {reg33} : reg42)} ?
                  ($unsigned(reg28) ?
                      (wire16 <= $signed(wire15)) : {(wire14 ?
                              reg36 : reg42)}) : ({$unsigned(reg7),
                          (~|wire17)} ?
                      (~|{reg44}) : (~|(reg9 ? reg24 : wire1)))));
              reg42 <= (reg5[(3'h7):(3'h4)] ?
                  $signed({(^$signed(reg41)),
                      $unsigned($unsigned((8'ha4)))}) : {((^~$unsigned((8'hbb))) | $signed($unsigned(reg45)))});
              reg43 <= (!reg36[(2'h2):(1'h0)]);
              reg44 <= (reg37 ? $signed((!(7'h40))) : $signed(reg40));
            end
          else
            begin
              reg41 <= (^((((reg40 > reg23) ?
                      (reg9 >>> reg13) : wire17[(2'h2):(1'h0)]) ?
                  $unsigned($unsigned((8'hbc))) : (8'hbf)) < {((wire19 + reg7) ?
                      (wire17 ? reg32 : reg12) : (wire2 >= (8'hbc))),
                  $unsigned((reg36 > reg45))}));
              reg42 <= $unsigned((reg40[(1'h0):(1'h0)] <<< reg4[(2'h3):(2'h3)]));
              reg43 <= $unsigned(({{(reg10 <<< reg22),
                          (reg26 ? reg28 : reg9)}} ?
                  (($unsigned(reg4) ? (reg31 ? reg36 : reg13) : (8'hb1)) ?
                      ({(8'h9d), wire15} ?
                          $unsigned(wire18) : (~|reg9)) : $unsigned(wire20[(4'h9):(2'h3)])) : (|((reg26 ?
                      reg30 : reg45) < $unsigned(reg25)))));
              reg44 <= $unsigned(({(reg8 ? $signed(reg38) : wire17),
                  ((reg23 ?
                      (8'haf) : reg13) != $unsigned(reg30))} + reg39[(4'hf):(2'h2)]));
            end
          if (reg22)
            begin
              reg45 <= wire16;
              reg46 <= $unsigned((~|({reg43[(2'h3):(1'h1)], {reg44, reg24}} ?
                  {(reg44 & (8'haf)), (~reg9)} : (wire1 ?
                      $signed(wire15) : ((7'h43) ? reg25 : wire0)))));
              reg47 <= wire20;
              reg48 <= ((~|reg31) && (reg27 * ((reg40 ^ $unsigned(wire18)) < (+(reg42 ?
                  reg8 : reg11)))));
            end
          else
            begin
              reg45 <= (((^(~&(wire17 ? reg13 : reg32))) ?
                      (|reg39[(4'ha):(3'h7)]) : $signed(reg41)) ?
                  ($signed(wire19[(4'ha):(3'h5)]) ?
                      (8'h9d) : reg22[(2'h3):(1'h0)]) : wire3);
              reg46 <= wire14[(4'hd):(2'h2)];
              reg47 <= $unsigned(((reg13[(1'h0):(1'h0)] ?
                  ((&reg27) ?
                      (wire1 ?
                          reg27 : reg10) : reg47[(1'h0):(1'h0)]) : ((~^reg47) ?
                      (reg11 && reg11) : (reg13 ? reg25 : reg43))) || reg39));
              reg48 <= $signed(reg44[(3'h5):(2'h3)]);
              reg49 <= (((!$unsigned(reg24[(3'h5):(3'h5)])) != wire15) >> (wire16 ~^ $signed({(reg23 && reg13)})));
            end
          reg50 <= $unsigned($signed($signed($unsigned((-(8'hb9))))));
          reg51 <= {(+(8'hb1))};
        end
    end
  assign wire52 = reg26;
  assign wire53 = reg6[(4'h9):(2'h3)];
  always
    @(posedge clk) begin
      reg54 <= $signed(wire16[(3'h5):(3'h4)]);
      if ((|$unsigned((wire14[(3'h6):(3'h5)] ~^ ($signed(reg4) << ((8'h9c) * reg34))))))
        begin
          reg55 <= ((((8'ha0) ?
              ((reg54 ?
                  reg38 : wire16) >= $signed(reg22)) : reg27) && $unsigned(((wire53 ?
              wire17 : reg26) && (reg32 ?
              reg5 : wire14)))) == (^($signed((reg42 ?
              reg28 : wire14)) >> $unsigned((reg49 == reg23)))));
          if (reg44[(3'h7):(3'h7)])
            begin
              reg56 <= ({((-reg4[(3'h5):(2'h3)]) ?
                      ((~|wire1) >> {(8'hbb)}) : (&wire16[(4'h8):(2'h3)])),
                  reg7} && (^~wire20[(2'h2):(1'h0)]));
              reg57 <= ((wire2[(3'h7):(1'h1)] ^ reg26) & reg34);
              reg58 <= ((((&(wire16 >= (7'h44))) >> wire18[(5'h11):(4'ha)]) | $unsigned($unsigned($signed((8'hba))))) ?
                  (^~((reg5[(1'h0):(1'h0)] || $unsigned((8'hb0))) >> reg13)) : $unsigned(reg24[(4'h9):(4'h9)]));
            end
          else
            begin
              reg56 <= $unsigned(reg9);
            end
          reg59 <= (((reg11 <= wire16[(4'h9):(1'h1)]) >> ({wire17[(3'h7):(3'h5)],
                  (reg25 ? reg58 : reg9)} || $signed(wire19[(2'h2):(1'h1)]))) ?
              reg42[(4'he):(3'h4)] : reg58);
          reg60 <= (^reg42[(4'hf):(2'h3)]);
          if (reg60[(5'h12):(4'h8)])
            begin
              reg61 <= $unsigned({$signed((~|$unsigned(reg10)))});
              reg62 <= {$signed((($signed(reg11) <<< (!reg54)) ?
                      (reg50[(4'h9):(3'h6)] << {reg55,
                          reg60}) : $signed(wire3[(2'h2):(1'h0)])))};
            end
          else
            begin
              reg61 <= ((~$signed((~|(-reg43)))) != wire1[(5'h11):(2'h3)]);
              reg62 <= (8'hb4);
            end
        end
      else
        begin
          if ({(wire0[(4'ha):(1'h0)] ? reg5 : reg45[(4'h9):(2'h3)])})
            begin
              reg55 <= wire14[(4'h8):(1'h1)];
              reg56 <= (|(^$unsigned(((reg54 ? reg26 : wire15) ?
                  wire2 : (reg32 ? reg58 : reg51)))));
              reg57 <= $signed($unsigned((reg56[(4'hb):(3'h6)] & wire16)));
            end
          else
            begin
              reg55 <= wire14;
              reg56 <= $signed(((~|(^(reg6 == reg22))) & reg5));
              reg57 <= (!reg31[(3'h7):(3'h5)]);
              reg58 <= ((+reg8) ?
                  (reg6 ?
                      (($unsigned(reg13) ?
                          (+wire2) : $unsigned(wire52)) & ((reg29 ?
                          reg44 : reg38) + $signed(reg4))) : {($unsigned(reg50) - (reg35 >> reg11)),
                          $signed($unsigned(reg46))}) : $unsigned(reg60));
            end
        end
    end
  assign wire63 = reg27[(1'h1):(1'h0)];
  assign wire64 = $signed($unsigned(((!(reg39 | reg39)) - $unsigned(((8'ha8) ?
                      reg54 : reg8)))));
  assign wire65 = $unsigned($unsigned($signed(wire2[(3'h6):(3'h4)])));
  assign wire66 = (({$signed((8'ha5))} <<< (reg35 ?
                      (wire16[(3'h5):(1'h1)] ^~ $signed(reg9)) : (reg24[(3'h5):(3'h4)] ?
                          (reg58 ? reg34 : wire21) : {reg46,
                              reg55}))) << $unsigned($unsigned(((reg38 ?
                          reg37 : reg28) ?
                      reg51 : $signed(reg9)))));
endmodule
