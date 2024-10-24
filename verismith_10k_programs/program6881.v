module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h248):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire50;
  wire [(2'h3):(1'h0)] wire49;
  wire signed [(5'h12):(1'h0)] wire48;
  wire [(4'hc):(1'h0)] wire47;
  wire signed [(4'hd):(1'h0)] wire46;
  wire signed [(2'h3):(1'h0)] wire45;
  wire signed [(5'h15):(1'h0)] wire44;
  wire signed [(5'h11):(1'h0)] wire43;
  wire signed [(4'hc):(1'h0)] wire42;
  wire signed [(5'h11):(1'h0)] wire38;
  wire signed [(4'hc):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire25;
  wire signed [(5'h12):(1'h0)] wire24;
  wire signed [(5'h10):(1'h0)] wire23;
  wire signed [(4'hd):(1'h0)] wire22;
  wire signed [(4'hb):(1'h0)] wire21;
  wire [(4'ha):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  reg signed [(4'hb):(1'h0)] reg41 = (1'h0);
  reg [(3'h7):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(2'h3):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(4'hb):(1'h0)] reg30 = (1'h0);
  reg [(2'h2):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire38,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire6,
                 wire5,
                 reg41,
                 reg40,
                 reg39,
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
                 (1'h0)};
  assign wire5 = $signed({(wire1[(3'h5):(1'h0)] + wire1),
                     (wire0[(3'h5):(3'h5)] ?
                         wire2 : ((&wire4) >> (wire4 ~^ wire0)))});
  assign wire6 = {(((^(wire4 ? (8'ha2) : wire4)) != ((|wire2) ?
                             (~&wire2) : $unsigned(wire3))) ?
                         (~(~&(wire4 < wire0))) : wire0[(4'hf):(4'hb)]),
                     $signed(((-wire0[(3'h4):(1'h1)]) - (&wire3[(2'h2):(2'h2)])))};
  always
    @(posedge clk) begin
      reg7 <= (~({(!wire1[(4'ha):(4'h8)]),
          {(wire6 ? wire1 : wire6),
              $unsigned(wire5)}} << wire2[(4'h9):(3'h7)]));
      reg8 <= wire3;
      if (($unsigned(reg7) ^ reg8[(2'h3):(2'h3)]))
        begin
          if ((^~(reg7[(3'h5):(3'h5)] >>> {(~&(wire6 ? wire4 : wire2))})))
            begin
              reg9 <= (wire2 > {($unsigned((|reg8)) && (~|(wire4 ?
                      wire1 : (8'ha3))))});
            end
          else
            begin
              reg9 <= $signed((!(wire4[(2'h2):(1'h0)] > ($signed(wire3) | wire3))));
              reg10 <= (8'ha5);
              reg11 <= (((((8'hbf) != $unsigned(wire1)) ?
                      $unsigned((~^reg9)) : wire2[(3'h6):(1'h1)]) | wire5) ?
                  (+reg10[(4'hc):(4'ha)]) : (!((|reg9[(5'h10):(2'h3)]) ?
                      (~|$signed((8'hb2))) : reg9)));
            end
        end
      else
        begin
          reg9 <= wire1[(4'hd):(4'ha)];
        end
      if (wire3)
        begin
          reg12 <= $unsigned($signed((|$signed($unsigned((8'hb9))))));
          reg13 <= ($unsigned((^~{$signed((8'ha4)),
              {reg9}})) < $unsigned(reg12));
          reg14 <= $unsigned($signed((reg9[(4'hb):(4'h8)] ?
              ((8'hbc) & reg9[(2'h3):(2'h3)]) : {(wire5 ? reg9 : wire3),
                  reg10})));
          if ((((~{(-wire5)}) ^ wire0) & ($signed($unsigned(reg7)) != (7'h44))))
            begin
              reg15 <= reg8[(3'h6):(1'h0)];
              reg16 <= $signed(reg11[(4'h8):(3'h6)]);
            end
          else
            begin
              reg15 <= reg14[(1'h1):(1'h1)];
              reg16 <= ($signed($unsigned((wire3[(3'h4):(1'h0)] ?
                  (reg7 ?
                      reg14 : (8'hb0)) : (^~(8'hac))))) && ((($unsigned((8'hb3)) ?
                          $unsigned(wire4) : $unsigned(reg10)) ?
                      (8'hb3) : $unsigned((wire6 ? wire6 : wire4))) ?
                  (8'haf) : {(^~{wire0})}));
            end
          if ({{wire6[(4'h9):(4'h9)], ((!wire1[(3'h6):(1'h0)]) > wire0)}})
            begin
              reg17 <= ($unsigned((reg16[(1'h0):(1'h0)] ?
                      (8'h9f) : $unsigned((&wire0)))) ?
                  (wire1 ?
                      ((!wire6) >> {reg8[(3'h7):(3'h6)],
                          (wire1 ?
                              (8'hb8) : reg11)}) : $signed($unsigned($unsigned(wire4)))) : (~|reg14));
              reg18 <= wire3[(3'h4):(2'h2)];
              reg19 <= reg11[(1'h1):(1'h0)];
              reg20 <= reg8[(3'h7):(1'h1)];
            end
          else
            begin
              reg17 <= ((^~$unsigned(((~reg16) || reg20[(4'hf):(2'h2)]))) ?
                  (~&(&reg12[(1'h1):(1'h0)])) : $signed(((reg14[(4'h8):(2'h2)] <= $unsigned(reg15)) ?
                      reg19 : wire4)));
              reg18 <= $signed(reg14[(3'h7):(3'h5)]);
              reg19 <= reg18[(3'h7):(3'h5)];
            end
        end
      else
        begin
          reg12 <= wire0;
          if ({(reg7[(3'h4):(1'h0)] != (reg7 <= (((8'hbc) * wire0) ?
                  (^~reg11) : $signed(reg11)))),
              (+$signed(wire1[(4'h9):(3'h7)]))})
            begin
              reg13 <= wire2[(1'h1):(1'h0)];
              reg14 <= {wire3[(2'h3):(1'h1)],
                  {(~reg10[(3'h6):(1'h1)]),
                      (reg19 ?
                          $unsigned((~^(8'haa))) : $signed($unsigned(reg19)))}};
              reg15 <= reg16;
              reg16 <= {($unsigned({wire0}) ? wire4 : reg15)};
            end
          else
            begin
              reg13 <= $signed((|((~$signed(reg12)) ?
                  reg7[(2'h2):(2'h2)] : ($signed(wire1) ^~ $signed(reg9)))));
              reg14 <= reg11[(3'h7):(2'h3)];
              reg15 <= (~reg11[(4'hb):(4'ha)]);
              reg16 <= ((^~($unsigned($unsigned((8'hb6))) == reg20[(3'h7):(1'h1)])) ?
                  reg9[(4'hd):(4'hc)] : ($signed((^~(~^reg14))) ?
                      $signed($unsigned((wire1 >>> reg10))) : ({(reg9 >> wire1),
                              $signed(reg10)} ?
                          ((-reg20) ~^ $unsigned((8'hbf))) : $unsigned(reg11[(1'h1):(1'h0)]))));
            end
          reg17 <= $signed(($unsigned((~^(^reg9))) > $unsigned($signed($unsigned(reg19)))));
          reg18 <= wire5[(2'h2):(2'h2)];
        end
    end
  assign wire21 = $signed(((~|($signed(reg8) ?
                      $unsigned(wire1) : $unsigned(reg17))) ^~ (~&wire0[(2'h3):(2'h3)])));
  assign wire22 = $unsigned((reg18[(4'hb):(4'ha)] * (((&wire4) ?
                          $signed(reg15) : reg20[(4'hf):(4'hb)]) ?
                      wire21 : reg8[(2'h2):(1'h1)])));
  assign wire23 = wire5;
  assign wire24 = {((((wire6 >= reg7) >= wire22) + ((reg19 ?
                              reg17 : reg13) + $unsigned((8'ha3)))) ?
                          wire6[(4'h9):(4'h9)] : ((~^$signed((8'hb0))) + ($signed((8'h9f)) ?
                              reg17 : $signed(reg13)))),
                      ({reg18} ?
                          ($signed(reg17) ?
                              $unsigned({reg19}) : reg18) : ({$signed(reg15)} & {$signed(wire2)}))};
  assign wire25 = $signed(reg10[(3'h5):(1'h1)]);
  assign wire26 = {$unsigned(wire0[(4'h8):(3'h5)]),
                      $unsigned($signed(($signed(reg13) ?
                          $signed(reg11) : $unsigned(reg19))))};
  always
    @(posedge clk) begin
      reg27 <= $signed($unsigned($unsigned(reg18)));
      reg28 <= (~|$unsigned(reg19));
      reg29 <= (reg17[(3'h7):(2'h3)] < $unsigned((reg9[(4'hb):(4'h9)] == reg27)));
      if ((({(~^reg17), reg13[(4'hd):(1'h0)]} ?
              $signed(wire4[(2'h3):(1'h0)]) : (wire26[(4'hc):(2'h3)] == $signed((reg17 | wire25)))) ?
          $signed({((wire0 ^ reg12) ?
                  reg7[(2'h2):(1'h1)] : reg17[(1'h1):(1'h1)]),
              (((8'ha2) * reg15) >= (|(8'h9f)))}) : ({$signed($unsigned((8'ha7)))} && $unsigned($unsigned(reg16[(3'h5):(2'h3)])))))
        begin
          reg30 <= ($unsigned((8'ha6)) <= (+(~$unsigned((+(8'hb7))))));
          if (($signed(reg18) ? reg30 : (8'h9c)))
            begin
              reg31 <= (wire1 + (wire24[(5'h11):(4'hf)] ?
                  $signed(reg28[(4'hf):(4'ha)]) : $unsigned((~^(reg17 ?
                      reg11 : wire25)))));
            end
          else
            begin
              reg31 <= reg12[(1'h0):(1'h0)];
              reg32 <= ((~^($unsigned((~^reg18)) ?
                  $unsigned((-(8'hb8))) : ((~|wire21) ?
                      (^wire6) : (wire6 << wire24)))) >>> wire0[(3'h6):(3'h4)]);
              reg33 <= reg12[(1'h1):(1'h1)];
            end
          reg34 <= ({($signed($signed(wire1)) || {(^~reg9), reg16})} ?
              $signed((reg29 >= ((reg30 && (8'hb5)) ?
                  wire1[(3'h4):(3'h4)] : (~^reg7)))) : $signed(((((8'haf) ?
                      wire21 : wire21) ?
                  (~|wire24) : wire23) | wire3)));
          reg35 <= $unsigned((^(&reg18[(4'hb):(3'h5)])));
          reg36 <= $signed($unsigned(wire2));
        end
      else
        begin
          reg30 <= {wire2};
          reg31 <= $signed($unsigned(reg14[(1'h1):(1'h1)]));
          reg32 <= ({reg36[(4'hc):(1'h1)]} - (~$unsigned((+$unsigned((8'hb2))))));
          reg33 <= (reg18[(4'hb):(4'h8)] ~^ {reg14});
          reg34 <= $unsigned((~|((((8'ha0) & reg17) == $unsigned(wire23)) ?
              $signed((8'hb0)) : ({wire21} > reg16))));
        end
      reg37 <= (~&(reg32[(2'h3):(1'h0)] ^ wire4[(1'h1):(1'h1)]));
    end
  assign wire38 = reg19;
  always
    @(posedge clk) begin
      reg39 <= ((&(((wire6 ? reg32 : reg17) ?
          (wire26 < reg32) : wire3) ~^ ({reg32, reg18} ?
          (wire22 & reg11) : reg33[(4'he):(4'ha)]))) <= wire26[(4'h9):(3'h4)]);
      reg40 <= $unsigned($signed((|{$signed((8'haf)), (reg20 >= wire4)})));
      reg41 <= ($signed(($signed($signed((8'hba))) & wire26)) ?
          $signed(((&(reg9 ^~ wire5)) ^~ (reg28[(5'h15):(5'h14)] & wire3[(2'h2):(1'h1)]))) : $signed(((reg15[(3'h6):(3'h4)] != $unsigned(wire3)) ?
              {$unsigned(wire6), $unsigned((8'haf))} : reg34)));
    end
  assign wire42 = reg10[(3'h7):(2'h3)];
  assign wire43 = reg35[(2'h2):(1'h0)];
  assign wire44 = (^~($unsigned(((reg19 > reg30) && wire26[(4'hb):(1'h0)])) ?
                      (~|$unsigned($signed(wire22))) : wire21));
  assign wire45 = (8'hb5);
  assign wire46 = (~&(($signed(((8'ha9) ? wire42 : wire2)) ?
                      ($signed(wire23) ?
                          ((8'ha4) ~^ wire42) : (reg32 ?
                              reg10 : reg32)) : reg18) << reg11));
  assign wire47 = {((reg28 ?
                              (!$unsigned((8'h9e))) : (-(reg41 ?
                                  reg15 : (8'hb1)))) ?
                          wire38 : reg36)};
  assign wire48 = ($unsigned((!(reg7[(2'h2):(2'h2)] - $unsigned(wire0)))) ?
                      ($unsigned((|((8'hb7) ~^ (8'ha6)))) ?
                          reg14[(1'h1):(1'h1)] : wire23[(1'h1):(1'h0)]) : reg32);
  assign wire49 = $signed(((+$unsigned($unsigned(reg9))) || (-(8'ha8))));
  assign wire50 = $signed({($signed((&wire23)) >= $signed((&wire4)))});
endmodule
