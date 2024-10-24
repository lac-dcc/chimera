module top
#(parameter param50 = (|(~({(|(8'haa))} >> (((7'h40) ? (8'ha0) : (8'hb6)) ? {(8'hbd), (8'ha8)} : ((8'ha6) ^ (8'hae)))))), 
parameter param51 = ((~&((param50 << (param50 ^~ (8'had))) >>> {param50})) ? ((param50 ? (~|((8'hb3) ? param50 : param50)) : param50) ? ((8'hbc) <= param50) : (-(((8'hbf) ? param50 : (7'h43)) > param50))) : param50))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h202):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire20;
  wire [(3'h6):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire17;
  wire signed [(4'hd):(1'h0)] wire16;
  wire signed [(5'h11):(1'h0)] wire15;
  wire [(4'ha):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire4;
  reg [(3'h7):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(3'h7):(1'h0)] reg45 = (1'h0);
  reg [(5'h11):(1'h0)] reg44 = (1'h0);
  reg [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(2'h2):(1'h0)] reg38 = (1'h0);
  reg [(4'hc):(1'h0)] reg37 = (1'h0);
  reg [(5'h12):(1'h0)] reg36 = (1'h0);
  reg [(5'h13):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(3'h6):(1'h0)] reg7 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire5,
                 wire4,
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
  assign wire4 = ((({$unsigned((8'hb5)), (+wire0)} != ((wire3 && wire3) ?
                             wire3 : $unsigned(wire1))) ?
                         wire1 : $signed($signed($signed(wire1)))) ?
                     (wire2 ?
                         (($unsigned((8'hbb)) ?
                                 $unsigned(wire2) : wire2[(1'h0):(1'h0)]) ?
                             wire3 : ((!wire1) >> $unsigned(wire0))) : wire1[(4'h9):(3'h5)]) : $unsigned($unsigned(wire1[(4'h8):(4'h8)])));
  assign wire5 = (wire0 || $unsigned(wire0));
  always
    @(posedge clk) begin
      reg6 <= $unsigned(wire1);
      if ((8'hb2))
        begin
          reg7 <= {(&($unsigned((^wire1)) ?
                  (~&{(8'hb0)}) : (wire4[(4'h9):(4'h9)] ?
                      (wire4 ? (8'hbc) : wire5) : wire3))),
              ($signed(reg6[(2'h2):(1'h1)]) ?
                  ((!$unsigned(wire2)) - ((wire0 > reg6) <<< (wire0 ?
                      wire2 : (8'hb5)))) : wire1[(2'h3):(1'h0)])};
        end
      else
        begin
          reg7 <= (((-wire3) ?
                  wire3[(1'h1):(1'h0)] : $signed($unsigned(wire1[(1'h1):(1'h1)]))) ?
              wire2 : $signed((wire1[(3'h6):(3'h4)] - $unsigned((-reg6)))));
          if (reg6)
            begin
              reg8 <= (~^$unsigned(($signed({reg7, (8'hbe)}) == (8'haa))));
              reg9 <= (reg7 == reg6);
              reg10 <= reg9;
              reg11 <= $unsigned((+reg6));
            end
          else
            begin
              reg8 <= (wire1 != (!reg10));
              reg9 <= $unsigned({$signed(({wire4} * (reg8 ~^ reg7)))});
              reg10 <= $signed((|wire4[(2'h2):(2'h2)]));
            end
        end
      reg12 <= $signed(((7'h40) || reg11[(1'h1):(1'h1)]));
      reg13 <= $unsigned(reg12);
      reg14 <= (~&($unsigned(reg13[(3'h6):(3'h4)]) ?
          wire1[(3'h6):(3'h4)] : wire1[(4'h8):(3'h6)]));
    end
  assign wire15 = wire1[(3'h6):(2'h2)];
  assign wire16 = (({(+$signed(wire0)),
                      reg11[(2'h2):(2'h2)]} | {$signed($unsigned(reg10))}) <= $unsigned(reg6));
  assign wire17 = $unsigned($unsigned((((~|reg6) == $unsigned((8'h9d))) ^ reg8)));
  assign wire18 = (8'ha9);
  assign wire19 = (+(|($unsigned($signed(reg8)) - reg8)));
  assign wire20 = $unsigned($unsigned($unsigned(wire2)));
  assign wire21 = $signed(wire18[(4'h9):(3'h4)]);
  always
    @(posedge clk) begin
      reg22 <= $signed(reg14[(4'h8):(1'h0)]);
      reg23 <= ((($unsigned((^~wire21)) <= (wire16[(3'h5):(1'h1)] ?
                  $signed(reg12) : (wire21 ^~ reg13))) ?
              (((~wire16) | (wire17 > reg8)) && ((wire19 >> wire15) ?
                  wire5[(3'h5):(3'h5)] : reg9[(2'h2):(1'h0)])) : $signed({$signed(wire19)})) ?
          (~|(8'had)) : {$signed(wire0[(2'h2):(2'h2)]),
              ($signed($signed(reg9)) ? $unsigned($signed(wire16)) : reg9)});
      reg24 <= $signed($unsigned(wire1[(3'h7):(3'h6)]));
    end
  always
    @(posedge clk) begin
      if ((~|$unsigned((($unsigned(reg23) ? (~&reg13) : reg12[(1'h0):(1'h0)]) ?
          $unsigned($signed(reg22)) : ((wire19 != wire4) && reg12[(1'h0):(1'h0)])))))
        begin
          reg25 <= (~((reg9[(1'h1):(1'h0)] ?
                  ((+wire20) && {reg8,
                      wire5}) : $unsigned(wire3[(3'h7):(3'h4)])) ?
              ((~&(reg8 >> reg10)) ?
                  $signed(((8'hab) ? wire1 : wire17)) : ($unsigned(reg8) ?
                      (wire4 ^ (8'hab)) : wire16[(1'h1):(1'h0)])) : wire15[(4'h8):(1'h1)]));
        end
      else
        begin
          reg25 <= $signed($unsigned($signed(reg7[(3'h6):(3'h5)])));
          reg26 <= wire2;
          if ({reg9[(1'h1):(1'h0)],
              ($unsigned((^reg9[(1'h1):(1'h0)])) | wire1)})
            begin
              reg27 <= reg13[(3'h7):(1'h0)];
              reg28 <= reg13[(3'h4):(1'h1)];
            end
          else
            begin
              reg27 <= $signed($unsigned($unsigned(wire3[(4'hc):(4'h9)])));
            end
        end
      if ($signed((^~(8'hb2))))
        begin
          if ($unsigned(reg14[(3'h7):(2'h2)]))
            begin
              reg29 <= ($signed(reg13) || reg13[(3'h5):(2'h3)]);
            end
          else
            begin
              reg29 <= $unsigned($unsigned((^~{{(8'hae)},
                  reg22[(4'hf):(4'h8)]})));
              reg30 <= (~^$signed(($signed((wire1 >>> wire19)) ?
                  wire5[(1'h1):(1'h0)] : ((~^reg9) ?
                      (reg9 ? wire21 : reg24) : wire18[(1'h1):(1'h1)]))));
              reg31 <= (({$unsigned((&reg28)),
                      $signed($signed(reg14))} - (&reg23)) ?
                  (8'hbc) : ((8'ha6) ?
                      $unsigned($signed((reg22 ? wire2 : wire17))) : ((~(wire0 ?
                          reg6 : wire5)) > $unsigned((!wire17)))));
            end
          if (($unsigned(wire21) ? wire0[(4'h8):(3'h6)] : wire19))
            begin
              reg32 <= {((~|$unsigned($unsigned(reg10))) ?
                      $unsigned($signed((reg25 ?
                          reg24 : wire20))) : reg11[(3'h7):(3'h4)])};
              reg33 <= (+$unsigned({$unsigned($unsigned(reg28))}));
              reg34 <= ({(((wire1 >> reg12) ?
                          (+reg11) : (reg32 ? (8'ha1) : reg7)) ?
                      {(&wire15)} : wire20[(4'hc):(4'ha)])} + ($unsigned($signed(reg10)) ?
                  wire3 : $unsigned(($unsigned((8'hb8)) < reg28))));
              reg35 <= $signed({$signed((8'hb1)),
                  ($unsigned($signed(reg34)) ?
                      (-reg7[(3'h5):(3'h4)]) : ($unsigned((8'hbe)) ?
                          (reg10 && wire5) : $unsigned(wire3)))});
              reg36 <= ((~&reg30) >> reg8);
            end
          else
            begin
              reg32 <= (~|(reg27 ?
                  reg6[(2'h3):(1'h1)] : (($signed(reg26) >> reg26[(1'h0):(1'h0)]) * $unsigned((wire20 ?
                      reg7 : reg13)))));
            end
          if ({($unsigned(reg26) ?
                  $signed($signed($unsigned(wire3))) : wire4[(4'h9):(4'h9)])})
            begin
              reg37 <= (+wire4);
              reg38 <= (($signed((&wire15)) >> $signed(reg12)) < wire21);
              reg39 <= reg36;
              reg40 <= (($unsigned((~|(reg27 >= wire18))) * ($signed((reg35 ?
                      wire3 : wire17)) ?
                  $unsigned({wire19, (8'hae)}) : ($unsigned(wire1) ?
                      (reg24 <= wire0) : reg25))) >> reg27[(3'h7):(3'h4)]);
              reg41 <= wire5[(2'h3):(1'h0)];
            end
          else
            begin
              reg37 <= (!($signed(($unsigned(wire3) * $signed(reg26))) >> $unsigned(wire0)));
              reg38 <= (~$unsigned((~wire2[(2'h2):(2'h2)])));
              reg39 <= reg9;
              reg40 <= ((~^(7'h42)) << wire4[(4'h8):(4'h8)]);
            end
          if (((~^(-{(reg36 ? reg30 : reg13), reg9[(1'h1):(1'h0)]})) ?
              $signed((~^(8'ha0))) : $unsigned((&wire21[(3'h6):(2'h2)]))))
            begin
              reg42 <= reg38[(1'h0):(1'h0)];
              reg43 <= (wire15 + reg42[(1'h1):(1'h1)]);
              reg44 <= $unsigned({($unsigned((reg27 ?
                      reg34 : reg38)) < {$unsigned((8'ha0)), {reg10, reg24}})});
              reg45 <= reg28[(2'h2):(2'h2)];
              reg46 <= (8'hb2);
            end
          else
            begin
              reg42 <= reg6[(2'h2):(1'h1)];
            end
        end
      else
        begin
          if (reg14[(4'h8):(3'h4)])
            begin
              reg29 <= (^(~|((~^reg40) ? reg36[(2'h2):(2'h2)] : reg31)));
              reg30 <= reg46[(3'h5):(2'h2)];
              reg31 <= reg10;
            end
          else
            begin
              reg29 <= {$signed(reg43),
                  ($signed($unsigned($signed(wire0))) ?
                      $unsigned(reg30[(3'h6):(1'h0)]) : (^~$signed((^wire4))))};
              reg30 <= (((!reg33[(4'ha):(3'h6)]) ?
                      {reg37[(1'h1):(1'h1)]} : (((reg37 ?
                          wire19 : reg41) || wire1[(1'h0):(1'h0)]) + $unsigned(reg44[(4'hc):(4'hc)]))) ?
                  $unsigned(reg24[(4'hb):(2'h2)]) : reg13[(1'h0):(1'h0)]);
              reg31 <= wire0[(4'hd):(4'h9)];
              reg32 <= (~^$signed((!$unsigned((^~wire21)))));
            end
          reg33 <= wire2;
        end
      reg47 <= $unsigned({(&$signed((wire16 ? reg23 : wire16)))});
      reg48 <= wire4;
      reg49 <= (~|$signed(({$signed(wire5)} || ((reg35 ~^ reg44) ?
          $unsigned(wire5) : {(8'haa)}))));
    end
endmodule
