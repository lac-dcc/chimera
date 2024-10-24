module top
#(parameter param53 = ((&((((8'hb1) ? (8'had) : (8'hae)) || (8'ha0)) ? (~&(^(8'h9d))) : (((8'h9f) != (8'ha2)) ? ((8'hbe) - (8'hb5)) : (^~(8'hb7))))) ? ({(((8'hb1) & (8'hb8)) ? (~|(8'ha9)) : (8'hb3)), (((8'haa) <= (8'hb9)) <<< {(8'hb4)})} ? (8'ha3) : (((~|(8'hbd)) ? {(7'h44), (8'ha1)} : ((8'ha3) ^~ (8'hbe))) >>> (((8'ha8) || (8'hbb)) > {(8'ha0), (8'hae)}))) : ((^((~(8'hab)) ? (8'had) : {(8'hac)})) ? (8'hb3) : {({(8'ha1)} ? ((8'h9c) ? (8'ha5) : (8'ha1)) : (8'ha9)), (|{(8'hac)})})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1fd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire51;
  wire [(4'he):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire49;
  wire [(3'h5):(1'h0)] wire48;
  wire [(4'hf):(1'h0)] wire47;
  wire signed [(5'h10):(1'h0)] wire46;
  wire signed [(4'hd):(1'h0)] wire45;
  wire signed [(4'h9):(1'h0)] wire21;
  wire [(4'h8):(1'h0)] wire20;
  wire signed [(4'hc):(1'h0)] wire19;
  wire [(2'h3):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire15;
  reg signed [(5'h12):(1'h0)] reg44 = (1'h0);
  reg [(4'h9):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(4'hc):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg37 = (1'h0);
  reg [(4'h9):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(2'h3):(1'h0)] reg29 = (1'h0);
  reg signed [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  reg [(3'h6):(1'h0)] reg5 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
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
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire0[(4'h9):(4'h8)];
      reg6 <= wire2;
      if ((~^wire2[(4'hd):(2'h2)]))
        begin
          reg7 <= ({((&$unsigned(reg6)) ^~ $signed((!reg5)))} >> (~wire4));
          reg8 <= ((((reg7 ? (~^reg7) : $signed(wire1)) < ({(8'ha5)} ?
                      (reg7 == wire1) : (reg6 ? wire2 : wire0))) ?
                  $unsigned(wire0) : reg7) ?
              ($signed($unsigned($unsigned((7'h42)))) | (&$unsigned((wire2 ?
                  reg6 : reg5)))) : wire3);
          reg9 <= $signed(wire2);
          reg10 <= reg6;
        end
      else
        begin
          if (wire3[(4'ha):(3'h5)])
            begin
              reg7 <= (|(+{reg6[(4'h8):(3'h5)], wire3[(2'h3):(2'h3)]}));
            end
          else
            begin
              reg7 <= (($signed($signed($unsigned(reg8))) ?
                      (($signed((8'hac)) << wire2[(4'h9):(2'h2)]) | wire3[(4'hc):(4'ha)]) : (wire0 ?
                          ({reg9} != (~|reg5)) : reg6)) ?
                  (^~wire4) : $unsigned((8'hbd)));
            end
          reg8 <= (reg5[(3'h5):(2'h3)] >> reg5);
          reg9 <= wire2[(1'h1):(1'h0)];
          reg10 <= $signed(reg9);
          if (reg5)
            begin
              reg11 <= (|reg8[(4'h9):(3'h6)]);
              reg12 <= $unsigned(reg8);
            end
          else
            begin
              reg11 <= (wire2 ?
                  (reg11[(3'h4):(1'h0)] ?
                      wire4[(3'h6):(3'h6)] : ((&wire4) ?
                          reg10 : $signed((wire3 ?
                              reg8 : wire2)))) : $signed($unsigned(($signed(reg10) <= $unsigned(wire3)))));
              reg12 <= $unsigned((-reg6));
              reg13 <= ((({(wire0 >> reg7)} <= $signed($unsigned((7'h42)))) ?
                  (wire3[(1'h0):(1'h0)] != ((!wire4) ?
                      reg11[(2'h3):(1'h1)] : reg12[(2'h2):(1'h0)])) : wire4) >>> $signed($unsigned($unsigned((8'hbb)))));
            end
        end
      reg14 <= $signed((($unsigned(reg7) >>> ($signed(wire1) ?
          reg10[(2'h2):(1'h0)] : $signed(wire0))) <= (reg12 ?
          {$unsigned(reg6)} : wire1)));
    end
  assign wire15 = ((((~^(&wire0)) ?
                          (&reg9) : $signed(reg14[(3'h4):(1'h0)])) | $unsigned((~^(reg8 < reg12)))) ?
                      (!($unsigned($unsigned((8'ha6))) ?
                          $unsigned((wire3 ?
                              wire2 : reg10)) : reg8[(4'hd):(2'h2)])) : wire2[(4'hb):(1'h1)]);
  assign wire16 = wire4;
  assign wire17 = (reg10[(4'he):(4'hc)] <<< $signed($unsigned(reg9[(2'h3):(1'h1)])));
  assign wire18 = (^wire15[(4'hb):(1'h0)]);
  assign wire19 = wire15;
  assign wire20 = ($signed($unsigned(($unsigned(reg8) ?
                      reg13 : $signed(reg7)))) > {(-((wire18 ?
                          reg9 : wire18) - (wire16 || reg11))),
                      {$unsigned({wire18, wire2}),
                          ((reg9 ? wire3 : reg9) >> (wire19 ?
                              (8'hb1) : reg6))}});
  assign wire21 = $signed($unsigned($unsigned($unsigned($signed(reg10)))));
  always
    @(posedge clk) begin
      reg22 <= (+(~^(|$signed(wire4[(5'h10):(3'h6)]))));
      if (wire16[(3'h5):(1'h0)])
        begin
          reg23 <= (wire21 ?
              reg13 : {($unsigned((|wire21)) ?
                      (reg8 <<< (reg5 ~^ wire16)) : $signed(((7'h40) || wire18))),
                  ($unsigned(wire16) ? (8'hb6) : reg11)});
          reg24 <= wire15[(3'h7):(2'h3)];
          reg25 <= (8'ha5);
          if (wire16)
            begin
              reg26 <= reg24;
              reg27 <= (~^wire15[(2'h2):(1'h1)]);
              reg28 <= $unsigned($signed((|$unsigned(wire2))));
            end
          else
            begin
              reg26 <= reg25[(4'hc):(4'h8)];
              reg27 <= (^wire17);
              reg28 <= reg28;
              reg29 <= ($signed($unsigned($unsigned(reg25))) ^~ {wire19[(4'h8):(1'h1)]});
              reg30 <= reg8[(5'h11):(2'h3)];
            end
        end
      else
        begin
          reg23 <= wire2;
          if ($signed(reg13))
            begin
              reg24 <= reg5;
              reg25 <= reg22;
              reg26 <= ((wire1 >= ($signed($unsigned(reg25)) < $unsigned((reg25 ?
                      reg9 : (8'hb3))))) ?
                  (reg13[(1'h1):(1'h1)] ?
                      $signed(($signed((8'hbc)) ?
                          $unsigned(reg6) : (~^wire3))) : (+($unsigned(reg27) ?
                          reg30 : wire18[(2'h2):(2'h2)]))) : ($signed((reg28 ?
                          (wire21 * reg26) : (reg12 ? wire18 : (8'ha5)))) ?
                      $unsigned($unsigned(reg8)) : {$unsigned(reg9),
                          $signed(wire17)}));
              reg27 <= reg26;
              reg28 <= $unsigned($signed((((reg12 ?
                  reg29 : (8'hb1)) < ((8'h9f) ^ wire1)) && ({wire20} | (wire16 >>> (8'hac))))));
            end
          else
            begin
              reg24 <= ((wire15[(4'h9):(3'h4)] * reg6) ~^ reg22);
            end
          reg29 <= reg5[(2'h3):(2'h2)];
          if ((!$unsigned(reg24[(4'hc):(4'h9)])))
            begin
              reg30 <= {reg11, $unsigned(($signed({(8'ha8)}) <= wire3))};
              reg31 <= $signed($unsigned(reg25));
              reg32 <= (((({wire3, reg23} ?
                              reg26[(2'h2):(1'h0)] : (reg26 ? wire2 : wire3)) ?
                          ($unsigned(reg29) ?
                              ((8'hbb) ^~ wire3) : wire20[(4'h8):(2'h2)]) : wire2[(5'h12):(4'h9)]) ?
                      (reg11 ^ $signed(wire20[(2'h3):(1'h1)])) : ({reg12,
                          $unsigned(wire19)} == {wire19, $unsigned((8'h9e))})) ?
                  (($signed($unsigned(reg28)) && ((~^wire0) ~^ $signed(wire18))) | (reg13 >>> ($unsigned(reg13) ?
                      reg14[(3'h5):(1'h1)] : (8'hac)))) : $signed((({wire16,
                              reg25} ?
                          wire3 : (reg10 ~^ wire18)) ?
                      reg26 : wire17)));
              reg33 <= $signed(($signed($signed(wire15)) ?
                  reg7 : (((reg32 ? reg32 : wire19) ?
                      wire17 : reg10) | reg12[(2'h2):(1'h1)])));
            end
          else
            begin
              reg30 <= ((((~|wire1[(2'h3):(2'h2)]) ?
                      $signed(reg5[(1'h1):(1'h1)]) : {$unsigned(reg31)}) ?
                  $signed(wire16[(4'h8):(3'h5)]) : (|(^~$unsigned(reg29)))) != reg25);
              reg31 <= {reg23[(4'ha):(2'h2)]};
              reg32 <= $unsigned(wire1);
              reg33 <= reg30[(2'h2):(1'h1)];
              reg34 <= $signed($unsigned((+reg30)));
            end
        end
      reg35 <= {{(~^({reg10, reg25} ?
                  (wire17 ? wire4 : wire3) : (wire4 ? wire4 : wire0))),
              reg9[(3'h5):(3'h5)]},
          ($signed(reg14) * (7'h40))};
      if ($signed(reg12[(1'h1):(1'h1)]))
        begin
          reg36 <= (((8'hb2) ?
              ($unsigned((reg22 >= reg14)) ?
                  $signed(wire2[(5'h12):(4'ha)]) : $signed((^~reg6))) : $unsigned(({reg14,
                      reg11} ?
                  {reg29,
                      wire1} : (wire18 && reg24)))) ~^ reg32[(1'h0):(1'h0)]);
          if (wire21)
            begin
              reg37 <= (($unsigned({(wire4 ? wire21 : reg13)}) ?
                  wire0[(4'hc):(4'h9)] : (8'h9c)) != reg6[(2'h3):(1'h0)]);
              reg38 <= $signed(((!((|(8'h9c)) ?
                  reg25[(4'h8):(1'h1)] : ((8'hae) - reg22))) - (~^reg22[(4'hd):(2'h2)])));
              reg39 <= (~|reg9);
              reg40 <= (^~wire0);
              reg41 <= $signed((^~(~($unsigned(reg14) ?
                  reg9 : (reg38 ? reg38 : wire3)))));
            end
          else
            begin
              reg37 <= reg39;
              reg38 <= ($signed((wire2 ~^ ($unsigned(wire18) >>> (!reg6)))) ^ {$unsigned($unsigned(((8'ha4) >> wire4))),
                  ((((8'haa) + (8'ha6)) >= {reg29}) && reg13[(3'h5):(2'h2)])});
              reg39 <= {reg8, ($signed($signed((~^reg26))) | wire16)};
            end
          reg42 <= $unsigned($signed($signed((reg34[(3'h6):(1'h0)] ?
              (!reg40) : $unsigned(wire21)))));
          reg43 <= $unsigned($unsigned(($signed(reg42) > (((8'hbd) ?
                  (8'hb2) : reg38) ?
              $unsigned(reg26) : reg9))));
          reg44 <= {wire0, reg7[(4'h9):(1'h0)]};
        end
      else
        begin
          reg36 <= (~wire20[(4'h8):(4'h8)]);
          reg37 <= reg10[(2'h2):(2'h2)];
          reg38 <= reg26[(2'h3):(2'h2)];
          reg39 <= reg23[(4'ha):(4'ha)];
          if ((($signed(wire2[(2'h3):(2'h2)]) ~^ (!$unsigned((reg36 >>> reg9)))) != ((~wire17[(4'ha):(2'h2)]) ?
              ($signed({(8'hab)}) ?
                  $signed((wire18 ?
                      (8'hac) : wire17)) : $signed(reg37[(4'hf):(4'he)])) : $unsigned(((^reg39) ~^ wire0)))))
            begin
              reg40 <= (+$signed((($unsigned((8'hb8)) ?
                  wire21[(4'h8):(1'h0)] : reg6[(5'h15):(5'h10)]) || (^$signed(wire20)))));
              reg41 <= ((8'h9e) <= (8'hae));
              reg42 <= reg30[(2'h2):(1'h1)];
              reg43 <= ((wire3[(4'h9):(3'h6)] ~^ $signed(($unsigned(wire18) ?
                      $unsigned(reg11) : $signed(reg22)))) ?
                  ((~|(8'ha9)) << $signed($signed($unsigned(reg29)))) : $signed({(reg9 ?
                          $signed(reg42) : (reg43 >= reg14))}));
              reg44 <= ((8'ha4) <<< (($signed($unsigned(reg24)) ^ $signed($unsigned(reg14))) ?
                  (($unsigned(wire1) ?
                      ((7'h43) ?
                          wire3 : reg29) : $unsigned(reg14)) >>> $signed((reg6 ~^ reg42))) : $signed({$unsigned(reg40),
                      (wire21 ? reg25 : reg29)})));
            end
          else
            begin
              reg40 <= (~&((!({reg39} ?
                  (~|(8'hb1)) : $signed(reg10))) == reg7));
              reg41 <= $signed($unsigned($unsigned((!(reg6 ?
                  wire20 : wire18)))));
              reg42 <= $signed(reg5);
            end
        end
    end
  assign wire45 = (|{reg13});
  assign wire46 = $signed((reg29[(2'h3):(1'h1)] < reg6[(4'h8):(1'h0)]));
  assign wire47 = $signed($unsigned((~&((|reg28) ?
                      wire2 : wire45[(4'h9):(3'h7)]))));
  assign wire48 = $signed(((~|(+$unsigned(wire21))) ?
                      wire46 : reg13[(3'h7):(2'h3)]));
  assign wire49 = (7'h42);
  assign wire50 = {$signed($signed((-(wire4 ? reg5 : reg43))))};
  assign wire51 = $signed((8'ha7));
  assign wire52 = (reg37[(2'h3):(1'h0)] ?
                      ((~$signed((^reg26))) > $signed((~|(^reg6)))) : reg6);
endmodule
