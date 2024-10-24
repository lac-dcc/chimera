module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h209):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire48;
  wire signed [(4'he):(1'h0)] wire47;
  wire signed [(4'hf):(1'h0)] wire44;
  wire [(5'h15):(1'h0)] wire43;
  wire [(5'h12):(1'h0)] wire42;
  wire [(4'h9):(1'h0)] wire41;
  wire signed [(5'h10):(1'h0)] wire40;
  wire signed [(4'h8):(1'h0)] wire39;
  wire signed [(4'ha):(1'h0)] wire38;
  wire [(4'hc):(1'h0)] wire37;
  wire [(5'h15):(1'h0)] wire36;
  wire [(4'h8):(1'h0)] wire35;
  wire signed [(3'h7):(1'h0)] wire34;
  wire [(4'h9):(1'h0)] wire33;
  wire [(5'h12):(1'h0)] wire32;
  wire signed [(3'h5):(1'h0)] wire31;
  reg signed [(2'h2):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg6 = (1'h0);
  reg [(4'h8):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg4 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 reg46,
                 reg45,
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
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed($unsigned((~^({wire3, wire1} ~^ {wire0, (7'h44)})))))
        begin
          reg4 <= ({wire2} <= $unsigned($unsigned($signed(wire2[(2'h3):(2'h2)]))));
          reg5 <= wire1;
          reg6 <= (({reg5} >= (7'h44)) & (((~&{wire3}) + wire0[(4'ha):(3'h4)]) || {reg4}));
          reg7 <= $signed({reg5[(4'h8):(2'h2)]});
        end
      else
        begin
          reg4 <= reg6;
          reg5 <= {((wire2 ?
                      ($signed(wire0) ? wire1 : wire3) : ($signed(reg7) ?
                          reg5[(3'h7):(3'h4)] : (reg5 ? wire3 : wire2))) ?
                  wire0 : reg6[(1'h0):(1'h0)])};
          reg6 <= $unsigned(wire0[(2'h2):(1'h1)]);
          reg7 <= (^~$unsigned(($unsigned((-reg6)) ?
              (8'hb1) : (wire3[(3'h5):(1'h0)] ?
                  (wire2 ? reg5 : wire0) : (~&wire0)))));
        end
      reg8 <= wire0[(3'h6):(3'h5)];
      if (reg4[(3'h5):(1'h0)])
        begin
          reg9 <= $unsigned(reg5[(1'h1):(1'h0)]);
          reg10 <= ($signed(wire2[(2'h3):(2'h2)]) <= wire2);
        end
      else
        begin
          reg9 <= {{$signed(($unsigned(reg9) ?
                      (!reg9) : reg4[(3'h5):(2'h2)]))}};
          reg10 <= $signed((~reg7[(5'h10):(1'h0)]));
        end
    end
  always
    @(posedge clk) begin
      reg11 <= wire1;
      if ($signed((+$signed($signed($signed((8'hab)))))))
        begin
          reg12 <= wire2[(2'h2):(1'h0)];
          if ($unsigned(($signed($unsigned((8'hbb))) << {reg4,
              (reg4 ? reg12 : (reg7 || reg8))})))
            begin
              reg13 <= reg12;
              reg14 <= ((^~$unsigned($signed(reg4[(4'hb):(4'hb)]))) ?
                  $signed(reg6) : reg9);
              reg15 <= $unsigned((~|(reg9 == (reg13 < (~(8'haf))))));
              reg16 <= reg13;
            end
          else
            begin
              reg13 <= $unsigned((8'had));
              reg14 <= $unsigned((~^wire3));
              reg15 <= ($signed((($unsigned(wire1) ?
                      $signed(reg9) : (reg10 ? wire0 : reg12)) ?
                  ($signed(reg4) ?
                      $signed((8'hb3)) : {wire2}) : $unsigned((!reg15)))) && (({(~|reg13),
                      $signed(reg4)} ?
                  wire2 : $signed($signed(wire3))) == reg10));
              reg16 <= ((-reg12[(3'h7):(2'h3)]) - (~$unsigned((^$signed(reg10)))));
            end
          reg17 <= reg9;
          if ({wire1[(4'ha):(1'h1)],
              ($unsigned((-reg13[(2'h3):(1'h1)])) != $signed(reg5[(3'h5):(1'h0)]))})
            begin
              reg18 <= (7'h40);
              reg19 <= (~^$unsigned({$unsigned($unsigned(wire3)),
                  (reg18 ? (reg6 + (8'hac)) : (reg9 || (8'haa)))}));
              reg20 <= ($signed((reg19[(5'h12):(1'h1)] > (8'hbb))) ^~ (8'ha6));
              reg21 <= (&(reg10[(1'h0):(1'h0)] ?
                  $signed(wire0[(3'h6):(2'h3)]) : (reg15 >>> ($unsigned(reg20) << ((8'hba) >= wire3)))));
              reg22 <= reg12[(3'h5):(3'h4)];
            end
          else
            begin
              reg18 <= wire3;
              reg19 <= (-wire3);
              reg20 <= $unsigned(reg8);
              reg21 <= reg5[(4'h8):(3'h5)];
              reg22 <= reg11;
            end
          if ({(&{reg8})})
            begin
              reg23 <= reg15;
            end
          else
            begin
              reg23 <= (reg23[(3'h4):(1'h1)] ^~ reg7);
              reg24 <= reg15;
              reg25 <= $signed((reg17[(5'h10):(4'hc)] ?
                  $signed((wire1 ? (~^reg21) : (reg23 >> reg18))) : wire1));
            end
        end
      else
        begin
          reg12 <= $signed((reg12[(1'h0):(1'h0)] ?
              (((wire3 ? reg9 : reg25) ?
                  $unsigned((8'ha3)) : reg16) != (8'h9e)) : $unsigned(reg16[(3'h6):(2'h2)])));
          reg13 <= reg18[(1'h0):(1'h0)];
          reg14 <= reg16;
          if (($signed((({reg6,
              reg16} || reg16) >= (reg15[(3'h5):(1'h1)] | $unsigned(reg7)))) ^ ($unsigned(((reg18 || reg25) * (reg20 ?
                  wire3 : (8'ha8)))) ?
              reg24 : reg17[(5'h10):(4'he)])))
            begin
              reg15 <= ($signed({$signed({(8'hb1), reg5})}) ?
                  (((&{reg24, reg21}) >= ((-reg4) * (reg5 ?
                      reg14 : reg17))) == {($signed(reg14) & {(8'hb9)})}) : (reg14[(2'h2):(2'h2)] << $signed((^~(reg21 ?
                      reg9 : reg7)))));
              reg16 <= ($unsigned((($unsigned(reg12) ?
                      $signed(reg16) : {(8'hb6), (8'hbc)}) ?
                  reg13 : (wire1 <<< $signed((8'hbd))))) ~^ reg16[(3'h5):(1'h0)]);
            end
          else
            begin
              reg15 <= (~|wire1[(4'hb):(4'ha)]);
              reg16 <= {($signed(reg20) ?
                      reg16[(1'h0):(1'h0)] : (reg7 || ($signed(wire2) ?
                          $signed(reg15) : $signed(reg21)))),
                  $unsigned($signed($signed((wire3 ^~ reg15))))};
              reg17 <= (wire2[(1'h1):(1'h1)] && (~&reg9));
              reg18 <= $unsigned($unsigned((({reg5} ?
                      reg14 : (reg21 ? reg13 : wire1)) ?
                  ((reg16 ? reg13 : reg5) ?
                      reg4[(3'h6):(3'h6)] : (reg19 ~^ reg8)) : reg11)));
            end
          reg19 <= reg5[(3'h7):(3'h7)];
        end
      if (reg21)
        begin
          if ({$unsigned(((!wire3) - {(wire0 ^~ reg9), (!reg17)})),
              $unsigned(reg6[(1'h0):(1'h0)])})
            begin
              reg26 <= reg12[(4'h8):(1'h1)];
              reg27 <= reg6[(1'h0):(1'h0)];
              reg28 <= $unsigned($unsigned(reg13[(3'h4):(3'h4)]));
              reg29 <= wire0;
            end
          else
            begin
              reg26 <= ((8'ha3) ?
                  $signed($unsigned(reg14)) : (-(&$unsigned((~reg24)))));
              reg27 <= (~(!$signed({(reg16 ? reg29 : reg16)})));
            end
        end
      else
        begin
          reg26 <= (reg6[(2'h2):(1'h0)] ?
              reg25 : $unsigned(($signed(reg26[(4'hd):(3'h4)]) ?
                  ((-reg23) ?
                      (reg7 << reg9) : {reg29, reg23}) : $signed((!reg10)))));
          reg27 <= (reg11 != ($unsigned(($unsigned(reg13) ?
                  wire2[(3'h4):(2'h3)] : (reg26 < reg22))) ?
              $unsigned($signed((reg11 == reg24))) : {(reg28[(2'h2):(1'h1)] - $signed((8'ha2)))}));
        end
      reg30 <= (((((reg29 <<< reg10) - reg25[(2'h2):(2'h2)]) >= $signed(reg8)) ?
              (-{reg28}) : (~(reg21 ^ $unsigned(reg6)))) ?
          $signed({($unsigned(reg26) ?
                  wire0[(3'h7):(3'h6)] : ((8'hac) ?
                      reg28 : reg6))}) : wire3[(2'h3):(1'h1)]);
    end
  assign wire31 = reg26[(3'h5):(2'h2)];
  assign wire32 = reg10[(2'h3):(2'h2)];
  assign wire33 = reg13[(2'h2):(1'h0)];
  assign wire34 = wire3[(3'h6):(2'h2)];
  assign wire35 = reg5;
  assign wire36 = {wire34};
  assign wire37 = ($signed($signed((reg20 < wire31[(2'h2):(2'h2)]))) >> $unsigned((~|wire31)));
  assign wire38 = reg15;
  assign wire39 = reg13[(2'h2):(1'h1)];
  assign wire40 = {{reg28, ((8'h9d) << $unsigned(reg12))}};
  assign wire41 = reg23;
  assign wire42 = $signed(($signed($unsigned(wire33[(2'h3):(2'h3)])) ?
                      {({wire0, wire39} * (wire34 ? reg6 : reg7)),
                          (((8'h9c) ?
                              wire41 : reg19) != reg28[(2'h2):(1'h0)])} : $unsigned(reg8[(4'ha):(3'h7)])));
  assign wire43 = (((8'hb5) ?
                      wire40[(3'h4):(1'h0)] : (reg20[(4'hb):(3'h6)] ?
                          $signed((reg22 >> reg27)) : ((reg16 ?
                                  reg14 : (8'hab)) ?
                              $signed(reg25) : reg13[(3'h4):(1'h1)]))) | $signed((-(reg17 ?
                      (wire33 ? wire31 : reg16) : reg12[(3'h5):(2'h3)]))));
  assign wire44 = $signed({$signed((8'hb6)), $unsigned($unsigned(wire31))});
  always
    @(posedge clk) begin
      reg45 <= {(wire41[(3'h5):(1'h1)] < $unsigned({reg7,
              wire44[(4'he):(4'ha)]}))};
      reg46 <= {$signed($signed({(wire2 ~^ reg20)}))};
    end
  assign wire47 = $signed(wire0);
  assign wire48 = reg17;
endmodule
