module top
#(parameter param45 = {(!(&(((7'h40) >>> (8'ha6)) ? {(8'hbc)} : ((8'hb8) ? (8'hbe) : (8'hb3)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h229):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire44;
  wire [(5'h13):(1'h0)] wire43;
  wire [(4'hc):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire41;
  wire signed [(2'h3):(1'h0)] wire40;
  wire signed [(4'h9):(1'h0)] wire39;
  wire signed [(5'h10):(1'h0)] wire38;
  wire signed [(4'hc):(1'h0)] wire37;
  wire [(3'h7):(1'h0)] wire36;
  wire [(4'hd):(1'h0)] wire35;
  wire signed [(5'h14):(1'h0)] wire24;
  wire signed [(5'h13):(1'h0)] wire23;
  wire signed [(4'hd):(1'h0)] wire22;
  wire signed [(5'h13):(1'h0)] wire21;
  wire signed [(4'hf):(1'h0)] wire20;
  wire [(5'h11):(1'h0)] wire19;
  wire signed [(4'ha):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire4;
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg signed [(4'he):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
  assign wire4 = $unsigned($signed((wire3[(4'he):(4'hc)] ?
                     {$signed(wire3), wire1} : wire1)));
  assign wire5 = ($unsigned($unsigned(wire2[(1'h1):(1'h1)])) ?
                     (8'ha0) : $signed(((~^$unsigned(wire0)) ?
                         ($unsigned(wire3) ?
                             (^~(7'h43)) : wire3) : wire2[(1'h0):(1'h0)])));
  assign wire6 = (!(~|((&{wire4}) ?
                     (~|(wire2 && wire3)) : $signed(wire2[(1'h1):(1'h1)]))));
  assign wire7 = wire0;
  always
    @(posedge clk) begin
      reg8 <= (($unsigned((^~(7'h43))) ^~ $signed((~^wire1[(2'h3):(1'h0)]))) || ({(!(wire1 ~^ wire5)),
              {$unsigned(wire6), wire7[(4'h8):(3'h7)]}} ?
          wire4 : (~&wire5)));
      if ($signed(($unsigned((wire1 <= wire4)) ? wire6[(1'h1):(1'h0)] : wire5)))
        begin
          if ({wire2,
              ($unsigned(($signed(wire7) ?
                  (reg8 >>> wire4) : (reg8 ?
                      wire5 : (8'hbe)))) <<< $unsigned({wire0}))})
            begin
              reg9 <= $unsigned((wire1[(3'h4):(1'h0)] ?
                  wire4 : $unsigned($unsigned((wire2 && (8'ha8))))));
              reg10 <= $signed($signed(($signed(wire7[(3'h7):(2'h3)]) | $unsigned(wire4[(2'h3):(1'h1)]))));
              reg11 <= (^~$signed({$signed((|wire1))}));
            end
          else
            begin
              reg9 <= {(($signed({wire6, reg11}) ? wire0 : wire4) ?
                      wire6[(2'h3):(1'h0)] : ($signed((reg10 ^~ wire7)) ?
                          $unsigned($unsigned(wire6)) : $signed(wire2))),
                  $signed((&$unsigned($signed((8'haf)))))};
              reg10 <= $unsigned(reg8[(5'h10):(3'h6)]);
              reg11 <= ({$signed($signed(wire4[(1'h0):(1'h0)]))} ?
                  $signed(({$unsigned(wire0), $unsigned(wire4)} ?
                      (-$unsigned(wire1)) : wire3)) : wire5[(2'h3):(2'h3)]);
              reg12 <= {wire5, (^~$signed(wire1[(3'h4):(2'h3)]))};
              reg13 <= wire1;
            end
        end
      else
        begin
          if (reg10)
            begin
              reg9 <= $signed(wire1[(1'h0):(1'h0)]);
              reg10 <= $unsigned((~^$signed(reg9)));
            end
          else
            begin
              reg9 <= (-wire5[(3'h7):(3'h7)]);
              reg10 <= ($signed((^reg11[(4'hc):(1'h1)])) ~^ (($signed($signed(wire4)) <= wire7[(4'ha):(4'ha)]) == (reg11[(2'h3):(2'h2)] ~^ ($signed(wire2) >>> {reg10}))));
              reg11 <= $unsigned($signed(((|(&wire4)) ?
                  $signed($signed(reg9)) : wire6)));
            end
          reg12 <= $unsigned(reg10);
          if (wire0)
            begin
              reg13 <= $signed($unsigned(wire4[(1'h1):(1'h1)]));
              reg14 <= reg13;
              reg15 <= {$signed((-($signed((8'hb4)) ?
                      $signed(reg12) : (reg10 * wire4))))};
              reg16 <= (~|reg8[(2'h3):(1'h1)]);
              reg17 <= ($signed((+$unsigned((wire5 ?
                  reg10 : reg9)))) || $unsigned($unsigned($unsigned(((8'had) | reg15)))));
            end
          else
            begin
              reg13 <= {$unsigned(((8'ha4) ?
                      $unsigned((+wire7)) : reg10[(3'h6):(2'h2)]))};
            end
        end
      reg18 <= $signed(({wire0[(3'h7):(1'h1)]} ?
          ({$signed(reg16), (wire6 <= reg12)} ?
              ((wire2 ?
                  wire1 : wire0) | reg16[(2'h3):(1'h0)]) : (^wire4)) : $unsigned(reg15)));
    end
  assign wire19 = $unsigned(wire4);
  assign wire20 = (+$signed((^$signed((reg9 ? reg14 : reg14)))));
  assign wire21 = wire4;
  assign wire22 = wire3[(3'h4):(1'h0)];
  assign wire23 = ($unsigned(reg13[(2'h2):(1'h1)]) + $unsigned((wire7[(2'h2):(2'h2)] ?
                      wire5 : ({wire19, wire7} ^ (reg17 ? reg11 : wire20)))));
  assign wire24 = (!wire20);
  always
    @(posedge clk) begin
      reg25 <= wire20;
      reg26 <= $signed({wire5});
      if (({wire1[(2'h2):(1'h1)]} + wire1))
        begin
          reg27 <= $unsigned(wire24[(4'hc):(4'h9)]);
          if ((reg26[(4'hb):(2'h2)] ?
              (^wire1) : $unsigned($signed(($signed(reg9) ?
                  (~wire7) : (wire22 ? (8'hb5) : (8'ha5)))))))
            begin
              reg28 <= $signed(($unsigned($signed($signed(wire19))) ?
                  $unsigned($unsigned(wire3)) : (^wire19[(3'h5):(1'h1)])));
              reg29 <= {wire5};
              reg30 <= {$unsigned(reg12)};
              reg31 <= (reg10 ?
                  {(wire19 ?
                          ($signed(wire5) ?
                              reg11[(1'h0):(1'h0)] : (+reg16)) : wire4)} : $unsigned(({$unsigned(wire23)} ?
                      $signed((wire20 ?
                          wire0 : (8'hbf))) : (~$unsigned(reg26)))));
              reg32 <= $unsigned($signed($unsigned($unsigned($unsigned(reg13)))));
            end
          else
            begin
              reg28 <= reg13;
              reg29 <= wire5;
              reg30 <= reg30;
            end
        end
      else
        begin
          if ({reg10[(3'h4):(2'h2)], (8'hab)})
            begin
              reg27 <= (8'hab);
              reg28 <= ($signed($unsigned($unsigned((reg8 ^~ reg14)))) != wire19);
            end
          else
            begin
              reg27 <= ((^$signed((8'hae))) ?
                  ({$unsigned(reg17)} << $unsigned(((reg15 <<< reg14) <<< $signed((8'hba))))) : (|wire2));
              reg28 <= wire19[(4'hd):(4'hd)];
              reg29 <= ((wire21 ?
                  $signed($unsigned((7'h43))) : ((wire20[(3'h7):(2'h2)] ?
                          (&reg14) : (~&reg29)) ?
                      reg30[(2'h3):(2'h2)] : $signed(reg16))) > wire1);
              reg30 <= ($unsigned(($unsigned($signed(wire23)) ?
                  wire1[(3'h6):(3'h5)] : (|reg11))) ^~ $unsigned(reg15));
            end
        end
      reg33 <= wire19;
    end
  always
    @(posedge clk) begin
      reg34 <= (&$unsigned(($unsigned(reg28) ^ ((&reg33) && (reg32 ?
          reg26 : (8'ha1))))));
    end
  assign wire35 = ($signed($unsigned(reg13)) ?
                      reg31 : (reg26 | reg27[(3'h7):(2'h2)]));
  assign wire36 = $signed(((($unsigned(reg31) < (|reg10)) ?
                      reg31[(1'h1):(1'h0)] : (8'hba)) > ((-reg30) > ($signed(wire4) | wire21[(2'h3):(2'h2)]))));
  assign wire37 = ($signed($signed($unsigned((reg13 ? reg31 : (7'h44))))) ?
                      $signed((8'h9d)) : {((^~wire2[(1'h0):(1'h0)]) - wire24),
                          reg17});
  assign wire38 = $unsigned(((~&{(reg8 ^ (8'hb1))}) ?
                      wire24 : reg25[(2'h2):(2'h2)]));
  assign wire39 = wire37[(4'ha):(3'h7)];
  assign wire40 = wire3[(3'h6):(3'h5)];
  assign wire41 = $unsigned((wire0[(3'h6):(1'h1)] ^~ ((+((8'ha9) ?
                          reg10 : reg16)) ?
                      (8'hb9) : $unsigned($signed(reg17)))));
  assign wire42 = (-$unsigned(wire21));
  assign wire43 = wire36[(2'h2):(1'h0)];
  assign wire44 = (reg29[(1'h0):(1'h0)] <<< $signed(wire1));
endmodule
