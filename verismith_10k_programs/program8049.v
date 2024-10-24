module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h25d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire54;
  wire signed [(5'h12):(1'h0)] wire48;
  wire signed [(5'h12):(1'h0)] wire47;
  wire signed [(5'h11):(1'h0)] wire33;
  wire signed [(4'hd):(1'h0)] wire19;
  wire signed [(5'h12):(1'h0)] wire18;
  wire [(3'h5):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire5;
  reg [(4'h9):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg58 = (1'h0);
  reg [(4'he):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg56 = (1'h0);
  reg [(3'h5):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(5'h15):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  reg [(3'h7):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg46 = (1'h0);
  reg [(2'h3):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  reg [(4'h8):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  reg [(5'h14):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(3'h4):(1'h0)] reg32 = (1'h0);
  reg [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(4'hd):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg8 = (1'h0);
  assign y = {wire54,
                 wire48,
                 wire47,
                 wire33,
                 wire19,
                 wire18,
                 wire7,
                 wire6,
                 wire5,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
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
  assign wire5 = wire0[(3'h4):(2'h3)];
  assign wire6 = ($unsigned((wire1 < ((wire2 ? wire4 : wire1) ^ wire2))) ?
                     wire4[(4'h8):(3'h5)] : (($signed((^wire4)) ?
                             (8'ha3) : (((8'h9f) >= (8'h9e)) ?
                                 (wire4 && (8'hbc)) : $signed(wire1))) ?
                         wire2 : {{((8'hb0) ? wire3 : wire3),
                                 wire5[(1'h1):(1'h0)]},
                             ($signed(wire4) > (wire0 >>> wire4))}));
  assign wire7 = $unsigned($unsigned(((^(wire2 > wire5)) >>> $signed((~^wire0)))));
  always
    @(posedge clk) begin
      reg8 <= wire0[(4'he):(3'h7)];
      reg9 <= $unsigned(($signed(({reg8,
          (8'hb8)} <= (^~wire7))) == (^~((wire7 ^~ wire5) ?
          (wire1 ? (8'haf) : wire2) : wire5[(2'h3):(1'h1)]))));
      if ($signed(wire4[(4'hb):(4'hb)]))
        begin
          reg10 <= (wire5[(2'h3):(2'h3)] && (wire6 | wire5[(3'h7):(3'h7)]));
          reg11 <= {(reg10[(5'h13):(4'hc)] <= wire6[(1'h0):(1'h0)])};
        end
      else
        begin
          reg10 <= ($unsigned($signed(wire2[(2'h3):(1'h0)])) ?
              $signed({wire1}) : $signed($unsigned((wire5[(3'h4):(2'h2)] ?
                  (reg11 ~^ wire5) : (reg8 ? (8'hae) : reg11)))));
          reg11 <= (wire3 ?
              $signed($unsigned($signed(wire2))) : wire1[(2'h3):(1'h0)]);
          if ($unsigned(((~|reg9[(4'h9):(3'h5)]) + wire1)))
            begin
              reg12 <= ((((~&wire4[(2'h3):(1'h0)]) || (~&wire7[(2'h3):(2'h3)])) ?
                  $signed((~|(reg10 < wire3))) : ((~(^wire0)) ?
                      ((reg9 ?
                          wire0 : reg11) * wire2[(4'hd):(2'h2)]) : ($unsigned((8'hb5)) > $unsigned(wire0)))) & (wire3 > $unsigned($signed(wire5))));
              reg13 <= reg8[(2'h2):(1'h1)];
              reg14 <= ($signed(reg12) ? $signed(reg11[(3'h5):(1'h0)]) : wire5);
              reg15 <= reg14[(2'h3):(1'h0)];
            end
          else
            begin
              reg12 <= ($unsigned((~((|wire1) ? (^wire7) : $unsigned(reg12)))) ?
                  wire3[(2'h3):(2'h2)] : {wire2,
                      $unsigned((((8'ha7) | reg11) * reg10))});
              reg13 <= wire7;
            end
          reg16 <= ((~|reg15) >>> $unsigned($signed($signed($signed(reg12)))));
          reg17 <= $signed((|$signed((-(wire7 ? wire1 : (7'h43))))));
        end
    end
  assign wire18 = {$signed((8'ha8)), wire7[(2'h3):(2'h3)]};
  assign wire19 = $unsigned(reg17[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg20 <= {wire5[(1'h1):(1'h0)]};
      if ($unsigned((8'ha4)))
        begin
          if ($unsigned($unsigned($signed(($signed(reg16) ?
              reg14 : (~(7'h44)))))))
            begin
              reg21 <= wire6[(1'h0):(1'h0)];
              reg22 <= $unsigned(wire6[(1'h0):(1'h0)]);
              reg23 <= (reg8[(1'h1):(1'h1)] ?
                  {(&$signed((+wire19)))} : ((wire7[(2'h3):(1'h1)] * $unsigned($unsigned(reg14))) ?
                      reg21[(1'h1):(1'h0)] : $unsigned($unsigned(wire3))));
              reg24 <= $unsigned((reg15[(2'h2):(2'h2)] ~^ $signed(reg11)));
              reg25 <= {reg12, ({$signed(wire6)} <= reg8[(1'h1):(1'h0)])};
            end
          else
            begin
              reg21 <= reg24[(2'h2):(2'h2)];
              reg22 <= (~&(~^($signed($signed(reg11)) ~^ reg9)));
              reg23 <= wire19;
            end
        end
      else
        begin
          if (({reg9[(4'hf):(3'h7)], {wire18, wire0[(4'hb):(4'ha)]}} ?
              $unsigned({(8'had),
                  (!(reg9 == reg12))}) : (!(~&wire0[(3'h6):(1'h1)]))))
            begin
              reg21 <= {reg20[(4'hf):(2'h3)]};
              reg22 <= reg20[(4'he):(3'h6)];
              reg23 <= (wire6 ?
                  $signed(($signed(reg11) || $unsigned(reg23[(2'h2):(2'h2)]))) : {reg15,
                      $signed($signed((reg25 && wire0)))});
              reg24 <= $unsigned(((reg13 ?
                  reg21[(2'h2):(1'h0)] : $signed((~^reg10))) ~^ reg21[(2'h2):(1'h0)]));
              reg25 <= ((({(wire1 ? wire4 : reg10), $signed(wire5)} ?
                          reg24[(1'h0):(1'h0)] : $signed((reg14 ?
                              wire6 : (7'h44)))) ?
                      $signed(wire4[(2'h3):(2'h3)]) : wire0) ?
                  (((^~(^reg15)) > reg20[(3'h7):(1'h1)]) + $unsigned($signed($signed(reg20)))) : (~|$unsigned(reg17[(2'h3):(1'h0)])));
            end
          else
            begin
              reg21 <= ($signed(($unsigned(wire2[(4'he):(4'h9)]) - $unsigned(reg22))) ?
                  reg11 : $signed((reg21 && ($unsigned(wire18) < (~|wire19)))));
              reg22 <= $unsigned($unsigned(wire3[(1'h0):(1'h0)]));
              reg23 <= {(^~$signed((wire19 ?
                      {(8'hbd), wire18} : (reg8 ? reg22 : wire4)))),
                  (reg14[(4'h8):(3'h4)] << ((reg8[(1'h1):(1'h1)] ?
                      $signed(wire7) : (!(7'h41))) && (~^(reg20 ^~ wire5))))};
            end
        end
      reg26 <= ($unsigned(reg9[(4'h8):(3'h7)]) & $unsigned($unsigned((reg9[(4'he):(4'hd)] ?
          $unsigned(reg25) : {wire4, reg17}))));
      reg27 <= reg10;
      if ({reg10[(3'h4):(1'h0)]})
        begin
          reg28 <= wire6[(1'h1):(1'h0)];
        end
      else
        begin
          reg28 <= (wire2[(1'h1):(1'h0)] - wire2[(3'h7):(3'h5)]);
          if ($unsigned($unsigned((8'h9e))))
            begin
              reg29 <= $unsigned($unsigned($signed({reg23})));
              reg30 <= reg11;
              reg31 <= (^~wire6[(3'h5):(3'h5)]);
              reg32 <= $unsigned((({(reg24 ? (8'ha1) : reg28)} ?
                  ((reg29 ? reg15 : reg9) ?
                      (reg11 + reg28) : (~wire3)) : wire18) < ({(reg9 >= reg25)} << reg26)));
            end
          else
            begin
              reg29 <= (((reg28[(1'h0):(1'h0)] ?
                      (|(~&reg14)) : $signed((8'hbc))) - (!reg31)) ?
                  $signed(reg28) : reg10);
            end
        end
    end
  assign wire33 = reg13;
  always
    @(posedge clk) begin
      if (reg24[(2'h2):(1'h1)])
        begin
          if ($signed((($signed((reg12 <<< wire3)) ?
                  ($signed(reg23) ?
                      (wire0 ? wire4 : reg26) : (reg32 ?
                          wire1 : reg20)) : reg14[(3'h6):(3'h5)]) ?
              {(~&((8'hae) ?
                      reg30 : (8'hac)))} : $unsigned($unsigned((reg27 & reg24))))))
            begin
              reg34 <= (^(reg24[(2'h2):(1'h1)] ^ $unsigned($signed((wire33 >= reg24)))));
            end
          else
            begin
              reg34 <= (~|($unsigned(($signed(reg21) <= (reg14 ~^ wire18))) >>> ((|wire18) ?
                  (reg28 <<< (reg23 || reg26)) : (wire4 ?
                      (reg16 + reg12) : $unsigned(reg30)))));
            end
        end
      else
        begin
          reg34 <= (|reg24[(1'h1):(1'h0)]);
          if ($signed(reg14))
            begin
              reg35 <= reg23;
              reg36 <= (&(~|(reg26[(2'h3):(1'h1)] ?
                  {reg13[(4'hf):(2'h2)], $signed(wire18)} : $signed(reg34))));
              reg37 <= (8'ha0);
              reg38 <= $unsigned(reg28);
            end
          else
            begin
              reg35 <= $signed($signed($signed((8'hb7))));
              reg36 <= reg21[(1'h1):(1'h1)];
              reg37 <= reg27;
              reg38 <= (wire7 + ({$signed(reg38)} ?
                  reg20 : ($unsigned(wire33[(4'hf):(3'h5)]) << {$signed(wire2),
                      $signed(reg15)})));
              reg39 <= (((wire1[(1'h0):(1'h0)] ?
                      reg8[(2'h2):(1'h0)] : reg37[(5'h14):(4'hc)]) ?
                  $unsigned(((^~reg25) ?
                      $signed(reg17) : reg8)) : (-reg10)) >= ($unsigned(($unsigned(reg27) & $unsigned((8'hb2)))) <<< (reg35 ?
                  ((~^(8'ha2)) ?
                      {reg13} : (reg15 ?
                          reg30 : reg14)) : $signed((~&reg26)))));
            end
          if ((~$signed((($signed(wire5) - $signed((8'hb8))) < (+(~reg21))))))
            begin
              reg40 <= (^~({wire7[(3'h4):(1'h0)],
                  ((~&wire6) + (^wire19))} ~^ (&($unsigned((8'hbb)) >>> reg9))));
            end
          else
            begin
              reg40 <= {$unsigned(reg28), wire6};
              reg41 <= (($unsigned(wire5[(2'h3):(2'h2)]) != $signed(((+reg14) & reg36))) || reg9[(5'h12):(3'h5)]);
            end
        end
      reg42 <= ($signed($signed((~|$signed(reg12)))) - (wire0 >> reg16[(3'h4):(2'h3)]));
      reg43 <= $signed($signed((8'haa)));
    end
  always
    @(posedge clk) begin
      if (reg9[(3'h7):(3'h5)])
        begin
          reg44 <= reg8;
        end
      else
        begin
          if ({reg39, reg27[(4'hd):(4'h9)]})
            begin
              reg44 <= (($unsigned($signed((wire6 ?
                      (8'hab) : reg10))) && wire2[(4'he):(1'h1)]) ?
                  (reg30 * wire5[(2'h3):(1'h1)]) : (+(^~reg43[(3'h5):(1'h0)])));
              reg45 <= reg37[(5'h12):(4'h9)];
              reg46 <= (wire3 | (^(8'haf)));
            end
          else
            begin
              reg44 <= (wire5[(3'h5):(3'h4)] ?
                  {(reg14[(1'h0):(1'h0)] ^ ((reg30 ? reg12 : reg28) ?
                          reg14 : (reg43 ?
                              reg35 : wire0)))} : reg23[(2'h2):(1'h1)]);
              reg45 <= {$unsigned(reg8[(1'h0):(1'h0)]), {(8'ha0), reg37}};
              reg46 <= $signed(reg23[(3'h6):(2'h3)]);
            end
        end
    end
  assign wire47 = (-reg16);
  assign wire48 = $unsigned(wire47);
  always
    @(posedge clk) begin
      reg49 <= (({(-(reg13 & wire19))} >>> reg28[(2'h2):(1'h1)]) != wire48[(4'hb):(2'h2)]);
      reg50 <= (reg43 ? $unsigned(reg10) : reg21[(1'h0):(1'h0)]);
      reg51 <= {wire1, $unsigned(reg28)};
      reg52 <= ((($signed(reg46[(4'ha):(2'h2)]) || (reg12[(2'h3):(2'h2)] || {reg50})) & (!{$unsigned(wire48),
          (reg43 ?
              wire7 : (8'ha8))})) || (reg25 >> ($signed($signed(wire5)) <= {((7'h40) ^ reg24),
          reg8[(1'h1):(1'h0)]})));
      reg53 <= $unsigned((({(reg34 ? reg17 : reg41)} ?
          ($signed(wire19) ?
              reg49 : (reg32 ?
                  wire0 : (8'hbf))) : $signed($unsigned(reg9))) * wire7[(3'h5):(3'h5)]));
    end
  assign wire54 = $unsigned($unsigned((|(reg20[(5'h10):(4'h8)] ?
                      (reg17 * reg17) : reg32[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      reg55 <= reg44[(3'h4):(2'h3)];
      reg56 <= $signed({{reg24}, $signed(reg14)});
      reg57 <= ((($signed((&reg49)) ?
          ($unsigned(reg30) ?
              $unsigned(reg44) : (8'hb1)) : (~$signed(reg32))) & reg46[(4'ha):(1'h0)]) ~^ (~{((~&(8'hb9)) * (wire2 - (7'h43)))}));
      reg58 <= reg16[(1'h1):(1'h0)];
      reg59 <= reg28[(3'h7):(3'h4)];
    end
endmodule
