module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h15a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire46;
  wire [(5'h12):(1'h0)] wire45;
  wire signed [(5'h12):(1'h0)] wire43;
  wire signed [(3'h5):(1'h0)] wire31;
  wire [(5'h10):(1'h0)] wire30;
  wire signed [(5'h15):(1'h0)] wire29;
  wire signed [(2'h2):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire43,
                 wire31,
                 wire30,
                 wire29,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = {$signed(wire2[(5'h14):(3'h6)])};
  assign wire6 = (($unsigned($signed((wire4 << wire0))) ?
                         (wire4[(5'h15):(2'h3)] ?
                             (-(wire4 ?
                                 wire3 : wire0)) : wire5[(3'h6):(3'h6)]) : wire3) ?
                     $signed(wire1) : {(!wire5), wire1[(4'h9):(4'h9)]});
  always
    @(posedge clk) begin
      reg7 <= $unsigned($unsigned((&{((8'haf) ? wire5 : wire2),
          (wire5 >>> (8'ha9))})));
      if ($signed($signed(($unsigned((wire2 ?
          wire5 : wire5)) >>> $unsigned($unsigned((7'h44)))))))
        begin
          reg8 <= $signed(({$unsigned($signed(reg7)),
              $signed(reg7)} - $signed(wire1[(4'he):(1'h1)])));
          if (wire0)
            begin
              reg9 <= (~^wire6);
              reg10 <= ((wire1 ? reg9 : wire4[(1'h0):(1'h0)]) ?
                  wire6 : wire5[(3'h4):(1'h1)]);
              reg11 <= ($unsigned(({(reg9 + wire0), $signed(wire1)} ?
                      $signed($unsigned(reg8)) : $signed((wire0 <<< (8'haf))))) ?
                  $signed($unsigned(wire2)) : ((((8'hb2) ? reg9 : (~wire1)) ?
                          ((wire0 <= reg8) ?
                              (reg8 <= (8'hac)) : (8'ha6)) : (wire1 > $signed(wire3))) ?
                      wire0 : (7'h43)));
              reg12 <= $signed((+($unsigned($unsigned(wire2)) ?
                  ((~^wire3) ? (!wire1) : wire1[(3'h6):(2'h2)]) : ({reg10,
                          (8'hbf)} ?
                      reg11 : (-wire0)))));
              reg13 <= wire1;
            end
          else
            begin
              reg9 <= $unsigned($unsigned(wire1[(4'hb):(3'h6)]));
              reg10 <= wire5;
              reg11 <= (~|({{reg8}} >>> {$signed((~^reg12)),
                  $unsigned(wire3)}));
              reg12 <= $unsigned($signed((^~((reg12 ^ wire6) ?
                  $unsigned(reg8) : (wire3 != wire4)))));
            end
          reg14 <= (~&reg9[(4'hf):(3'h5)]);
          reg15 <= ($signed($signed(({reg9, reg9} ?
                  {wire1, reg13} : (^reg8)))) ?
              wire6 : reg8[(1'h1):(1'h1)]);
        end
      else
        begin
          reg8 <= $unsigned((reg14[(2'h2):(1'h1)] <<< (+(~|$signed((8'haa))))));
        end
      reg16 <= reg7;
      if (($signed(wire3[(1'h1):(1'h0)]) ? (^~wire0[(3'h4):(1'h0)]) : reg8))
        begin
          reg17 <= {reg9,
              {$unsigned($unsigned($unsigned(wire0))),
                  (^~$signed({reg8, reg11}))}};
          reg18 <= {$unsigned($unsigned((7'h40)))};
          if (($unsigned({((reg17 ? reg13 : reg8) <<< (~^reg13))}) ?
              $signed(($unsigned(((8'ha8) & reg16)) ?
                  $signed((^wire6)) : $unsigned((~|reg18)))) : (^~$signed($unsigned(reg17[(1'h0):(1'h0)])))))
            begin
              reg19 <= wire3[(2'h2):(1'h1)];
              reg20 <= wire5;
              reg21 <= wire0;
            end
          else
            begin
              reg19 <= $signed(((((!wire5) ?
                  $signed(reg15) : (reg13 >>> reg13)) + (8'ha0)) >> $unsigned((8'hbe))));
            end
          reg22 <= $signed((($unsigned($signed(reg9)) || (^~$unsigned(reg11))) ^ {reg20[(1'h1):(1'h0)]}));
          reg23 <= (!wire3[(5'h10):(1'h0)]);
        end
      else
        begin
          reg17 <= ($signed($unsigned(reg14[(3'h5):(1'h0)])) & (wire2[(3'h4):(3'h4)] ?
              (-(wire1[(3'h7):(3'h7)] ?
                  (reg13 >= wire3) : (reg18 ~^ reg10))) : (reg12 + $signed((~^(7'h44))))));
          if ((reg17 >> reg23))
            begin
              reg18 <= reg7;
              reg19 <= $unsigned({reg8,
                  ($signed($signed(reg15)) ? (8'ha4) : $signed((~wire2)))});
              reg20 <= wire4[(5'h13):(5'h11)];
              reg21 <= ($unsigned($signed((wire5[(2'h2):(1'h1)] ?
                      reg23 : (reg10 ? (7'h43) : reg19)))) ?
                  reg15 : reg19[(1'h0):(1'h0)]);
              reg22 <= $unsigned($signed(($unsigned(reg20[(3'h6):(1'h0)]) ?
                  wire4 : $signed($signed((8'h9e))))));
            end
          else
            begin
              reg18 <= ($signed($signed(reg19[(2'h2):(1'h1)])) ?
                  $unsigned(($unsigned(reg17) ?
                      reg13 : (wire0[(1'h1):(1'h0)] ~^ (reg10 >= (8'ha0))))) : reg8[(1'h0):(1'h0)]);
              reg19 <= (8'hb4);
            end
          if ($unsigned((&(((reg12 + wire6) | (wire0 || wire4)) ?
              (!$unsigned((8'hb0))) : (+{reg16, wire4})))))
            begin
              reg23 <= $unsigned((((+$signed((8'ha3))) == wire6) <= {$signed(reg18[(1'h1):(1'h0)]),
                  reg13}));
            end
          else
            begin
              reg23 <= $signed($unsigned(reg8));
              reg24 <= $unsigned($signed((~&($unsigned(wire4) ?
                  wire1[(4'hf):(4'h8)] : (reg23 == reg9)))));
              reg25 <= $signed($signed($signed($unsigned((wire4 ?
                  reg10 : reg12)))));
            end
          reg26 <= $signed(($signed((^reg25[(3'h5):(1'h0)])) <<< (~^$unsigned({wire6}))));
          reg27 <= ((&wire6) == {(|(((8'ha0) ^~ reg20) ?
                  $signed(reg17) : reg8)),
              reg14[(4'h8):(3'h5)]});
        end
      reg28 <= (((^reg18) ?
          (((~reg14) ?
              $signed(reg14) : (reg16 & reg14)) && reg9) : {($signed(wire0) ?
                  $signed((8'h9c)) : {reg27})}) & {$unsigned(($signed((8'hbe)) * {reg12})),
          $unsigned(reg12[(2'h3):(1'h0)])});
    end
  assign wire29 = $unsigned($signed($unsigned($signed(reg28[(1'h0):(1'h0)]))));
  assign wire30 = $signed((reg20 != (~((wire5 ?
                      reg23 : reg22) >= reg24[(3'h4):(3'h4)]))));
  assign wire31 = ((reg11[(5'h15):(2'h2)] << $unsigned({(~|reg18),
                          $unsigned(reg13)})) ?
                      ((~|$signed($signed((8'ha2)))) ?
                          (!$signed($signed(reg7))) : {(reg25[(4'hb):(3'h4)] ?
                                  $signed(wire29) : {reg26,
                                      reg16})}) : $unsigned(reg14[(4'ha):(2'h2)]));
  module32 #() modinst44 (wire43, clk, wire4, reg25, wire29, reg17);
  assign wire45 = ($unsigned($unsigned($signed((&reg12)))) >= reg8[(1'h1):(1'h1)]);
  assign wire46 = reg27[(1'h1):(1'h1)];
endmodule

module module32  (y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire36;
  input wire signed [(4'ha):(1'h0)] wire35;
  input wire signed [(5'h14):(1'h0)] wire34;
  input wire [(4'he):(1'h0)] wire33;
  wire [(4'h8):(1'h0)] wire42;
  wire signed [(4'h8):(1'h0)] wire41;
  wire signed [(4'hf):(1'h0)] wire40;
  wire [(3'h6):(1'h0)] wire39;
  wire [(5'h15):(1'h0)] wire38;
  wire [(2'h3):(1'h0)] wire37;
  assign y = {wire42, wire41, wire40, wire39, wire38, wire37, (1'h0)};
  assign wire37 = (~^$unsigned((&(8'h9c))));
  assign wire38 = (~&$unsigned((((^wire36) <= wire33) ^~ (^$signed(wire35)))));
  assign wire39 = $signed($unsigned((~|$unsigned((wire36 ? wire38 : wire36)))));
  assign wire40 = $signed({$unsigned(((!wire37) ?
                          $unsigned(wire33) : {(8'haa), (8'ha5)})),
                      $signed((&((8'hb6) ? wire34 : wire33)))});
  assign wire41 = (~|({wire37[(2'h2):(1'h0)], (^~(wire38 ? wire35 : wire38))} ?
                      $signed(wire40) : (((wire39 ? wire39 : wire39) ?
                          (wire35 ?
                              wire33 : wire34) : wire38[(2'h3):(2'h3)]) + ((wire35 >> wire34) ?
                          wire40 : $unsigned(wire36)))));
  assign wire42 = {{(-$signed(wire38[(3'h4):(2'h3)])),
                          ((wire36 ?
                              $unsigned(wire35) : $signed(wire35)) || $unsigned((wire39 ?
                              (8'hbf) : wire35)))},
                      {wire40}};
endmodule
