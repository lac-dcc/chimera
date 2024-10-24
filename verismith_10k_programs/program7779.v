module top
#(parameter param96 = ((+{(8'ha7)}) >= ((8'hab) ? ((+((8'hb9) ? (8'hb7) : (8'haf))) ? (8'hb5) : (((8'haa) ? (8'h9f) : (7'h42)) ? (-(8'hb1)) : (&(8'hb8)))) : {(!((8'hbf) <= (8'had)))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h22c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire95;
  wire signed [(3'h4):(1'h0)] wire83;
  wire [(5'h10):(1'h0)] wire82;
  wire [(4'hf):(1'h0)] wire81;
  wire signed [(3'h7):(1'h0)] wire80;
  wire signed [(4'hc):(1'h0)] wire79;
  wire [(4'h9):(1'h0)] wire78;
  wire signed [(5'h12):(1'h0)] wire77;
  wire signed [(5'h15):(1'h0)] wire75;
  wire [(5'h12):(1'h0)] wire10;
  wire signed [(4'h9):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire4;
  reg signed [(5'h13):(1'h0)] reg94 = (1'h0);
  reg [(3'h7):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg91 = (1'h0);
  reg [(4'hb):(1'h0)] reg90 = (1'h0);
  reg [(2'h2):(1'h0)] reg89 = (1'h0);
  reg [(4'h8):(1'h0)] reg88 = (1'h0);
  reg [(5'h12):(1'h0)] reg87 = (1'h0);
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  reg [(5'h12):(1'h0)] reg85 = (1'h0);
  reg [(4'ha):(1'h0)] reg84 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg6 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  assign y = {wire95,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire75,
                 wire10,
                 wire5,
                 wire4,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
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
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = (~^{{{(wire2 ~^ wire3)}, $unsigned((8'hb0))}});
  always
    @(posedge clk) begin
      reg6 <= ($signed($unsigned(wire5)) ?
          wire5[(2'h2):(2'h2)] : ($signed($signed($unsigned(wire2))) ?
              $signed((+(~&wire2))) : (((wire4 && wire0) ?
                      (8'hae) : (^~wire1)) ?
                  (((8'h9d) && (8'hb6)) ?
                      wire0[(3'h7):(1'h0)] : wire1[(3'h4):(2'h3)]) : ((wire4 ?
                          wire5 : wire5) ?
                      (~&wire3) : {wire0}))));
      reg7 <= (wire2 - $unsigned(((wire4 ~^ $signed((8'hbe))) && (^$signed(wire5)))));
      reg8 <= (~|$signed((^$signed((wire2 ? wire4 : wire2)))));
      reg9 <= wire3[(4'h8):(2'h2)];
    end
  assign wire10 = reg8[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg11 <= $unsigned(($signed(reg6[(3'h5):(2'h3)]) ^~ wire2[(3'h6):(3'h5)]));
      if ({(wire0 >= $unsigned((~|wire4[(3'h5):(2'h3)])))})
        begin
          reg12 <= reg8[(4'hb):(2'h2)];
          reg13 <= (~|$unsigned(reg9[(3'h6):(3'h6)]));
          reg14 <= ({(({wire2, reg9} == (8'h9f)) >>> {((8'ha9) != (8'h9e))}),
              (!((reg13 && wire3) == reg8))} >= ((reg8[(4'ha):(3'h4)] ?
                  (wire1[(2'h3):(1'h1)] ?
                      $signed((8'hb1)) : reg11[(2'h2):(1'h0)]) : wire2) ?
              (-(((8'h9d) ? wire0 : (7'h44)) ?
                  (wire0 ?
                      (8'ha4) : wire2) : reg13[(3'h5):(1'h0)])) : $unsigned($unsigned(wire3))));
        end
      else
        begin
          if ((~$unsigned((&reg14[(3'h6):(3'h5)]))))
            begin
              reg12 <= (((($unsigned(wire5) ?
                      $unsigned(wire0) : (^reg13)) == (!(^reg13))) ?
                  ((((8'hb1) ~^ reg9) ?
                          wire4[(3'h4):(1'h1)] : $unsigned(wire2)) ?
                      {reg9,
                          wire1[(3'h5):(2'h3)]} : (|((8'hb8) < (8'ha2)))) : (~$unsigned((wire5 != wire3)))) ~^ ((~(~&(-reg9))) ?
                  $signed($signed(((8'hbf) ?
                      wire10 : reg14))) : $unsigned($unsigned(((8'hb3) ?
                      wire4 : (8'had))))));
              reg13 <= (+((reg11[(3'h7):(3'h5)] >> ((8'hb3) ?
                  reg6 : (wire5 * reg6))) | $unsigned({(|(8'ha6)),
                  (reg14 & wire0)})));
              reg14 <= $signed((|$signed((~|(reg14 ? reg9 : wire2)))));
            end
          else
            begin
              reg12 <= (~&$signed($unsigned((&(+wire10)))));
              reg13 <= $signed($unsigned((~|(wire10 + (!reg9)))));
              reg14 <= wire5[(1'h0):(1'h0)];
              reg15 <= {reg7, (|$signed({wire5}))};
              reg16 <= reg9[(3'h5):(3'h5)];
            end
          if ($signed((($signed(reg12[(4'hb):(1'h1)]) ~^ (~(reg9 ?
              reg6 : reg11))) - ((~|{reg12}) ?
              {(wire0 ? reg12 : reg11), (~reg7)} : wire3[(4'hd):(4'hb)]))))
            begin
              reg17 <= {$signed($signed(($unsigned(wire10) ?
                      (8'hb2) : $signed(reg14))))};
              reg18 <= reg11[(3'h4):(3'h4)];
              reg19 <= (reg6 ?
                  $unsigned($signed((~&(reg15 ?
                      (8'hbb) : wire5)))) : $unsigned((8'hab)));
              reg20 <= (~&$signed((reg8 << (-(reg7 ? reg18 : reg6)))));
            end
          else
            begin
              reg17 <= {$signed(wire5),
                  ($signed(reg15) ? reg11 : reg19[(4'hc):(4'hb)])};
              reg18 <= $unsigned($signed(($signed(reg11[(2'h3):(1'h0)]) ?
                  (-wire3[(5'h11):(1'h0)]) : $signed(((8'haa) ?
                      (8'ha5) : wire3)))));
              reg19 <= wire5[(3'h6):(1'h0)];
            end
          reg21 <= (~^(~|(wire10 << (8'hbf))));
        end
      reg22 <= $unsigned((($unsigned($signed(reg16)) ?
          $unsigned((8'hb5)) : $unsigned((reg20 ? reg14 : reg12))) ~^ reg15));
      if ((^~(((~|(~^reg8)) << ($signed(reg15) >>> $signed(reg9))) + $signed(reg17[(4'hf):(4'h9)]))))
        begin
          reg23 <= ((((reg21 ? reg17[(1'h1):(1'h0)] : reg7) ?
              $unsigned($signed(wire5)) : $unsigned({(8'ha9),
                  reg6})) || $unsigned(((~reg9) ?
              (!reg22) : $signed(reg13)))) ~^ ($signed($signed((|reg12))) ?
              ((!$signed(reg22)) ?
                  ((~^wire1) - (reg15 ?
                      wire10 : reg18)) : reg17) : $unsigned($unsigned({reg18}))));
          reg24 <= reg13;
        end
      else
        begin
          reg23 <= (~(8'hbc));
          reg24 <= (8'hb9);
          reg25 <= {$signed((~^($signed(wire10) || {reg19, reg16})))};
        end
    end
  module26 #() modinst76 (wire75, clk, wire4, reg24, reg25, reg9, wire10);
  assign wire77 = (reg9 < (~&$unsigned(wire1[(3'h6):(2'h2)])));
  assign wire78 = $signed({reg25, wire5});
  assign wire79 = $signed($signed($unsigned((wire75 ?
                      (reg24 ? wire1 : reg22) : ((8'ha2) || (8'hbf))))));
  assign wire80 = {($signed($unsigned($signed(reg24))) ?
                          wire1 : (reg25 <= {(wire4 ? reg19 : reg17)})),
                      ($unsigned(reg6) == $signed($signed({(8'ha9)})))};
  assign wire81 = ((reg23[(2'h3):(1'h0)] << (8'h9e)) ?
                      reg6 : ((reg20 ?
                          reg21[(4'he):(4'hb)] : wire10) >> $signed($unsigned((wire78 ?
                          reg7 : wire2)))));
  assign wire82 = reg16[(4'hb):(1'h1)];
  assign wire83 = ($unsigned((wire5[(3'h5):(3'h5)] >> (~reg17[(4'ha):(1'h1)]))) ^~ ({(^(~^reg20))} ?
                      $signed({(reg21 ?
                              reg15 : (8'hba))}) : (~(^$unsigned((8'hb7))))));
  always
    @(posedge clk) begin
      if ({wire82[(4'h8):(4'h8)]})
        begin
          if (reg24[(4'h8):(1'h0)])
            begin
              reg84 <= $unsigned(((&{reg18, $unsigned((7'h40))}) ?
                  $unsigned((!$unsigned((8'hbb)))) : $signed($signed({wire83}))));
            end
          else
            begin
              reg84 <= $signed(((wire2[(1'h0):(1'h0)] ?
                      (reg18[(3'h7):(3'h6)] ?
                          {reg22, (8'hab)} : (reg25 ^ reg25)) : (7'h44)) ?
                  reg9 : reg18[(1'h1):(1'h1)]));
              reg85 <= (!$unsigned($signed(wire5[(2'h2):(1'h1)])));
              reg86 <= ($unsigned((-((|reg25) ?
                  {wire81} : {reg25, reg17}))) & reg19[(3'h7):(3'h4)]);
              reg87 <= ($signed(reg17[(5'h10):(3'h5)]) ?
                  $unsigned(((reg85 ?
                      (8'h9c) : reg20) > ($unsigned(reg11) <= $unsigned(wire3)))) : (($signed($unsigned(wire80)) ?
                          wire77 : (~{wire82, wire77})) ?
                      (8'hb6) : $signed((-(!reg9)))));
            end
          if ($signed($unsigned(wire3)))
            begin
              reg88 <= (wire77[(2'h2):(1'h0)] >> $unsigned(wire3[(4'hd):(3'h7)]));
              reg89 <= (((-$signed($signed(wire3))) ?
                  (((&reg88) ^ $unsigned(reg22)) ?
                      ($signed(reg85) >>> (reg13 ?
                          reg87 : reg9)) : $signed($signed(wire3))) : ((((8'hb0) ?
                          reg23 : reg19) != wire10) ?
                      ((wire1 ? reg24 : wire4) ?
                          ((8'hbf) ?
                              wire81 : wire3) : (wire78 << wire0)) : $unsigned($unsigned(reg6)))) && (reg8 ?
                  wire1[(3'h7):(3'h4)] : {($signed((7'h44)) << $signed(wire75)),
                      (8'hb0)}));
              reg90 <= ((^reg89[(1'h0):(1'h0)]) ?
                  ((^reg15) ?
                      {$unsigned($signed(reg12))} : ((^wire82) || ($unsigned(reg7) ?
                          (reg24 & wire5) : (~reg22)))) : reg20);
            end
          else
            begin
              reg88 <= wire79[(4'h8):(1'h0)];
              reg89 <= reg12;
              reg90 <= (8'ha0);
            end
          reg91 <= (($unsigned($signed((8'hb5))) != wire78[(3'h4):(1'h0)]) ?
              $unsigned((reg12[(4'hf):(3'h5)] != reg9[(4'hc):(1'h1)])) : wire5);
          reg92 <= (reg15[(4'he):(3'h5)] & ((|(reg87 ?
                  (wire1 <= wire1) : $signed((8'ha6)))) ?
              wire79 : reg24));
          reg93 <= reg87[(3'h4):(2'h3)];
        end
      else
        begin
          reg84 <= (((7'h40) ?
                  wire3[(2'h3):(1'h1)] : $signed({{reg17, reg15}, (~&reg88)})) ?
              reg12[(4'hd):(2'h3)] : ((~&(!(reg91 > reg16))) << (wire5[(3'h4):(1'h0)] ?
                  (-{reg24}) : ((reg13 * wire83) ^ $unsigned(wire78)))));
        end
      reg94 <= reg19;
    end
  assign wire95 = wire77[(2'h3):(2'h2)];
endmodule

module module26
#(parameter param73 = ((((~&(~^(8'ha7))) ? (((8'h9e) ? (7'h44) : (7'h44)) ? (^(8'h9e)) : ((8'hb8) ? (8'ha1) : (7'h43))) : ((|(8'ha8)) ? ((8'h9c) ? (8'hb3) : (8'ha1)) : {(8'hb6)})) * ({((8'hba) - (8'had)), ((8'haf) ? (8'h9c) : (8'ha1))} ? {(&(8'ha4))} : (((8'hb3) || (8'hb4)) ? ((8'ha7) ? (7'h44) : (8'hbf)) : ((8'haf) ? (7'h41) : (8'hae))))) ? ({(((8'hb6) ? (8'hb9) : (8'ha5)) ? (-(8'hb0)) : ((7'h40) ? (8'ha5) : (8'h9d)))} + (+((!(8'hb7)) * (&(8'ha9))))) : {((((8'hb6) ? (8'hae) : (8'ha3)) ? (^(8'had)) : (~^(8'ha6))) ? (((8'ha1) ? (8'hbe) : (8'hab)) & (^(8'hb7))) : (^(+(8'hba))))}), 
parameter param74 = {param73})
(y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'h1b4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire31;
  input wire signed [(4'he):(1'h0)] wire30;
  input wire [(3'h5):(1'h0)] wire29;
  input wire signed [(5'h12):(1'h0)] wire28;
  input wire [(4'ha):(1'h0)] wire27;
  wire signed [(3'h4):(1'h0)] wire71;
  wire signed [(5'h14):(1'h0)] wire70;
  wire [(3'h6):(1'h0)] wire69;
  wire signed [(3'h7):(1'h0)] wire68;
  wire [(5'h15):(1'h0)] wire67;
  wire [(5'h13):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire52;
  wire [(4'ha):(1'h0)] wire51;
  wire signed [(3'h6):(1'h0)] wire50;
  wire signed [(4'hb):(1'h0)] wire47;
  wire [(4'hf):(1'h0)] wire46;
  wire [(5'h13):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire32;
  reg [(4'h9):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg66 = (1'h0);
  reg [(4'he):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg64 = (1'h0);
  reg [(3'h7):(1'h0)] reg63 = (1'h0);
  reg [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  reg [(3'h4):(1'h0)] reg60 = (1'h0);
  reg signed [(4'he):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg58 = (1'h0);
  reg [(2'h2):(1'h0)] reg57 = (1'h0);
  reg [(4'h9):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg49 = (1'h0);
  reg [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  reg [(3'h5):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg42 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(3'h7):(1'h0)] reg40 = (1'h0);
  reg [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(5'h14):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(4'ha):(1'h0)] reg35 = (1'h0);
  reg [(4'hf):(1'h0)] reg34 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire47,
                 wire46,
                 wire33,
                 wire32,
                 reg72,
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
                 reg49,
                 reg48,
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
                 (1'h0)};
  assign wire32 = $unsigned(({(&wire29)} ?
                      $signed(wire27) : $unsigned(wire29)));
  assign wire33 = $signed($unsigned((wire27 ?
                      ((wire28 < wire32) ?
                          wire31 : {wire27}) : $unsigned($unsigned(wire32)))));
  always
    @(posedge clk) begin
      if (wire33[(4'hf):(3'h7)])
        begin
          reg34 <= (wire29 ? wire32 : wire30[(3'h6):(3'h4)]);
          reg35 <= (wire33[(4'hc):(4'h9)] < ((~&{$signed((8'hae))}) ^~ (&((wire32 ?
                  wire28 : wire29) ?
              wire29[(3'h4):(2'h2)] : wire29))));
          reg36 <= wire28;
        end
      else
        begin
          if (wire32[(2'h3):(2'h3)])
            begin
              reg34 <= $unsigned($signed(reg36));
              reg35 <= wire31[(4'he):(4'hb)];
              reg36 <= ($unsigned(($signed({reg34, reg36}) >>> wire33)) ?
                  ($unsigned(wire29[(1'h1):(1'h0)]) ?
                      $signed($signed(wire28)) : wire33[(4'ha):(2'h2)]) : $unsigned(reg36));
              reg37 <= ({(($signed((8'hbb)) >> wire29) ?
                          $unsigned($unsigned(wire31)) : $signed((~(8'hb9))))} ?
                  reg35 : ($signed((&reg34[(4'he):(3'h7)])) ?
                      $unsigned((&(+wire31))) : $signed(((wire33 >= wire29) ?
                          $unsigned(wire29) : (wire33 ? reg34 : wire29)))));
              reg38 <= wire31;
            end
          else
            begin
              reg34 <= wire30;
              reg35 <= wire28[(2'h2):(1'h0)];
            end
          if (((wire29 ?
              ((((8'hbe) ? wire33 : wire27) ? wire29 : $signed(wire32)) ?
                  $unsigned((~&reg36)) : $signed(wire33)) : (&wire33[(2'h3):(2'h3)])) <<< {({((8'had) ?
                          wire33 : (8'hb1)),
                      $signed((7'h40))} ?
                  (reg36[(2'h2):(2'h2)] ?
                      wire31 : $unsigned(wire31)) : $signed(reg34))}))
            begin
              reg39 <= ((!(reg37 != $unsigned((^reg35)))) ^ wire29[(2'h2):(1'h0)]);
              reg40 <= (~|((wire31[(3'h6):(3'h5)] < (&reg37)) ?
                  $signed(({reg39, (8'hbc)} ?
                      reg34[(3'h6):(3'h5)] : $signed(wire33))) : ((^(|reg39)) & ($signed(wire31) <<< {(8'hb2)}))));
              reg41 <= {reg40};
              reg42 <= $signed($signed((8'hb6)));
              reg43 <= {$unsigned($unsigned($unsigned($unsigned(reg40))))};
            end
          else
            begin
              reg39 <= $unsigned((~&$unsigned({{reg34}})));
              reg40 <= (8'had);
              reg41 <= $unsigned((&$unsigned({$signed(reg38)})));
              reg42 <= (^~($signed(wire27[(3'h5):(3'h5)]) ?
                  $unsigned($signed(reg41[(3'h7):(1'h1)])) : $signed((&(8'h9f)))));
            end
        end
      reg44 <= $unsigned($signed(($unsigned($unsigned(reg38)) ?
          wire28 : ((~|wire29) + (^~reg40)))));
      reg45 <= $signed((&(reg34[(2'h2):(2'h2)] ?
          $signed(reg42[(4'hc):(4'h8)]) : ((^~reg35) ?
              reg41[(1'h1):(1'h0)] : (reg36 ~^ reg37)))));
    end
  assign wire46 = reg44;
  assign wire47 = reg34[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg48 <= reg39;
      reg49 <= $signed(({((~^reg41) ?
              ((8'hbd) & wire30) : (wire46 == reg45))} > reg42));
    end
  assign wire50 = $signed(wire27);
  assign wire51 = reg38;
  assign wire52 = $unsigned((~&{$signed((~reg49))}));
  assign wire53 = reg41[(4'h8):(3'h7)];
  always
    @(posedge clk) begin
      reg54 <= (~^$signed(($signed(reg34[(4'ha):(3'h5)]) ?
          $signed($signed((8'ha0))) : wire30)));
      if ({wire29[(3'h4):(1'h0)]})
        begin
          reg55 <= (!$signed((((+reg40) ?
              $unsigned((8'hb6)) : $unsigned(wire28)) < wire31[(4'hd):(4'h9)])));
        end
      else
        begin
          if (reg45)
            begin
              reg55 <= ((reg43 * wire46) ?
                  (!reg35) : (-($unsigned(reg41) ?
                      $unsigned({wire46, reg36}) : (((8'hbc) >>> reg55) ?
                          (!reg49) : $unsigned(reg41)))));
              reg56 <= reg43[(1'h1):(1'h1)];
              reg57 <= reg40[(3'h6):(3'h6)];
            end
          else
            begin
              reg55 <= {((|wire51) >> wire32), wire33};
            end
          reg58 <= {({(|$signed(reg40))} == $signed(((reg36 + reg38) ?
                  wire47 : wire51))),
              ((($unsigned(wire52) ~^ (~&reg56)) || $unsigned($signed(reg54))) ?
                  wire30[(4'hb):(3'h5)] : wire52)};
          if ($signed((|{reg55, (wire28[(5'h11):(3'h4)] > $signed(wire46))})))
            begin
              reg59 <= wire46[(3'h5):(2'h2)];
              reg60 <= reg57[(2'h2):(1'h0)];
              reg61 <= $signed((((reg59 == wire52[(3'h5):(1'h0)]) << reg36) * ($signed((~|reg38)) ^~ reg56)));
              reg62 <= (+$unsigned(wire46[(3'h7):(3'h5)]));
            end
          else
            begin
              reg59 <= (~^$unsigned($unsigned(($unsigned(reg61) ?
                  ((7'h43) ^~ reg36) : ((8'hb5) ? (8'hb8) : wire50)))));
              reg60 <= (^~reg54);
              reg61 <= ((^~reg36[(2'h3):(2'h2)]) ~^ $signed(wire28));
              reg62 <= (reg37[(2'h3):(2'h3)] | ($unsigned(reg39[(1'h0):(1'h0)]) ?
                  wire28 : $unsigned(($signed(wire33) ?
                      {reg58, reg59} : wire47[(3'h5):(3'h4)]))));
              reg63 <= (~&($signed(((8'hb2) + (^~wire53))) ?
                  $unsigned(((~reg35) ?
                      wire50 : (reg42 <= wire28))) : (~|($signed((8'hbe)) << (reg39 ?
                      reg34 : reg43)))));
            end
        end
      reg64 <= ((wire51 > {{$signed(reg54), $unsigned(wire46)},
          $unsigned($unsigned(reg44))}) & $signed($signed((~(wire50 <= reg38)))));
      reg65 <= $unsigned(reg41[(4'ha):(3'h7)]);
      reg66 <= wire29;
    end
  assign wire67 = (7'h40);
  assign wire68 = reg44;
  assign wire69 = $signed((wire52 ?
                      (|(~^$signed(reg34))) : ({wire67[(5'h15):(4'hc)]} ?
                          ($signed(reg37) ?
                              (wire27 ? wire27 : reg55) : reg65) : (8'ha4))));
  assign wire70 = reg38;
  assign wire71 = (|({((~|(8'hb8)) & (reg59 ? wire28 : (8'hba)))} ?
                      (reg54 ?
                          reg43[(1'h0):(1'h0)] : $signed({wire47})) : ($signed({reg36,
                              reg58}) ?
                          {reg42[(3'h5):(1'h0)]} : (~^reg64))));
  always
    @(posedge clk) begin
      reg72 <= (8'hb1);
    end
endmodule
