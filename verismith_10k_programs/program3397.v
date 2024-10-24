module top
#(parameter param44 = {{(~(((8'hab) ? (8'ha7) : (8'h9c)) ? (~|(8'hba)) : ((7'h43) ? (8'haf) : (8'hb5)))), (^(8'hba))}})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1ac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire43;
  wire [(3'h7):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire37;
  wire [(4'hb):(1'h0)] wire36;
  wire [(5'h11):(1'h0)] wire35;
  wire signed [(4'h8):(1'h0)] wire34;
  wire [(4'hc):(1'h0)] wire33;
  wire signed [(4'h9):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire20;
  wire signed [(2'h2):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire18;
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg38 = (1'h0);
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg [(2'h3):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg6 = (1'h0);
  reg [(5'h12):(1'h0)] reg5 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((+wire2))
        begin
          reg5 <= (8'hbd);
          reg6 <= (-((wire4[(2'h2):(1'h1)] && ((wire1 ~^ wire4) ?
                  (wire4 ? (8'hb2) : reg5) : wire4)) ?
              wire2[(5'h11):(4'ha)] : ($signed((wire0 >= reg5)) >>> $signed($signed(wire0)))));
          reg7 <= wire3;
          reg8 <= ($unsigned({wire2}) ~^ wire2[(4'hb):(3'h6)]);
          reg9 <= {(($signed(wire2) | $unsigned((reg6 != reg6))) ?
                  (|((wire1 ^~ (8'ha4)) ? (wire3 ^~ wire2) : reg7)) : wire0)};
        end
      else
        begin
          reg5 <= $signed($signed((reg6[(3'h4):(2'h2)] ?
              ($signed(wire1) != (reg6 ?
                  (8'ha6) : wire2)) : ($signed(reg8) * {reg6, wire0}))));
          reg6 <= $signed((!$unsigned((~^$signed((8'hbe))))));
          if ((~^((~|(wire0[(1'h1):(1'h1)] ?
              (~wire3) : wire2[(3'h4):(3'h4)])) >> $signed((~^reg7)))))
            begin
              reg7 <= (reg9[(1'h1):(1'h1)] ?
                  (~&$signed(($unsigned((8'hb7)) + (wire2 ?
                      reg5 : reg7)))) : reg5);
              reg8 <= wire3[(1'h1):(1'h0)];
              reg9 <= ((($signed((wire4 * wire3)) ?
                  $signed(reg5) : wire4) >> (|$unsigned((^~(8'hbd))))) <<< (~^(8'had)));
              reg10 <= {($unsigned(wire2[(5'h12):(4'h9)]) + ({{(8'hbb),
                          (8'hbd)}} | wire2[(1'h0):(1'h0)])),
                  wire2[(2'h3):(2'h2)]};
              reg11 <= wire1;
            end
          else
            begin
              reg7 <= wire3;
              reg8 <= (-($signed($unsigned(wire0)) ?
                  (!(-{reg9, reg9})) : reg7));
            end
          reg12 <= wire2[(3'h5):(1'h0)];
          reg13 <= (reg9[(3'h4):(2'h2)] ?
              ((reg10 ?
                  $signed((reg8 ? reg5 : wire2)) : ($signed(wire2) ?
                      $unsigned(wire0) : {(8'h9c),
                          reg9})) + $unsigned(reg10)) : reg6[(4'h8):(2'h2)]);
        end
      reg14 <= (wire0 < $signed(reg9));
      reg15 <= $signed($unsigned((((^~reg6) <<< (reg6 ^ reg7)) && $signed(((8'hbc) ?
          reg8 : wire0)))));
      reg16 <= ((((+(^~reg5)) + reg9) ~^ $signed({$unsigned(reg9)})) - reg14[(3'h6):(1'h0)]);
      reg17 <= wire4[(1'h0):(1'h0)];
    end
  assign wire18 = $signed((wire4[(1'h1):(1'h0)] << $signed(reg14[(1'h1):(1'h1)])));
  assign wire19 = ((reg10[(1'h0):(1'h0)] >>> $unsigned((&{reg5}))) ?
                      $unsigned($unsigned($signed($signed(reg10)))) : $signed((((+(8'haa)) ?
                          (wire3 ? wire4 : (8'h9f)) : reg11) | (~(~&wire2)))));
  assign wire20 = reg10[(2'h2):(1'h1)];
  assign wire21 = reg8[(4'h9):(1'h1)];
  always
    @(posedge clk) begin
      reg22 <= ((8'hb1) - (~(^wire2[(4'hf):(4'h9)])));
      if (reg15[(1'h1):(1'h1)])
        begin
          reg23 <= ($unsigned(wire2) ?
              {$signed(($unsigned(reg12) != $unsigned(wire18)))} : $unsigned($unsigned({reg15[(3'h4):(2'h2)]})));
          reg24 <= wire3;
          reg25 <= reg13[(5'h10):(3'h7)];
          reg26 <= (8'hbc);
          reg27 <= $unsigned($unsigned((reg16[(3'h7):(2'h3)] ?
              (reg16[(2'h2):(1'h1)] >= $unsigned(reg10)) : reg9[(2'h2):(2'h2)])));
        end
      else
        begin
          if (($unsigned(reg23[(4'ha):(2'h3)]) - (reg26 + $signed(($unsigned(reg23) ?
              $signed(reg14) : reg8[(2'h3):(1'h1)])))))
            begin
              reg23 <= (8'hbd);
              reg24 <= reg25;
              reg25 <= $signed($unsigned((reg26[(3'h6):(2'h3)] ?
                  (8'hb9) : ((|(8'h9d)) & {wire1}))));
              reg26 <= (-$unsigned((!((wire4 ? wire1 : reg12) ?
                  $unsigned(reg7) : $signed(reg22)))));
            end
          else
            begin
              reg23 <= ($unsigned((wire4 <<< reg23)) > ((8'ha4) ?
                  $signed(reg23) : $unsigned($signed($signed((8'hab))))));
              reg24 <= (!wire19[(2'h2):(2'h2)]);
              reg25 <= reg27;
              reg26 <= $signed((&(reg8 > $signed((wire19 ? wire4 : (8'ha3))))));
            end
          if ($unsigned((((^~(reg10 ? reg15 : reg10)) ?
              ($unsigned(reg11) ?
                  reg23[(4'hf):(4'hb)] : (~&(8'hb6))) : (8'hb5)) - $signed((~(+reg12))))))
            begin
              reg27 <= (({(~|reg12),
                  {{reg24},
                      $unsigned((8'hbc))}} <= reg9[(4'hd):(4'hb)]) << (($unsigned({reg15,
                      wire21}) && $unsigned({(8'haf), reg23})) ?
                  (-($unsigned(reg8) ?
                      (reg23 & reg26) : reg14[(3'h4):(2'h2)])) : reg12[(2'h3):(1'h0)]));
              reg28 <= $signed(reg27);
              reg29 <= (~&(($unsigned(reg28[(4'hd):(2'h3)]) | (+(reg27 != (8'hb3)))) ?
                  ((reg10 || reg26[(1'h1):(1'h1)]) != reg7[(1'h0):(1'h0)]) : (reg28 | reg5)));
            end
          else
            begin
              reg27 <= reg25;
            end
          reg30 <= (reg24 ?
              $signed(({(reg8 ^ wire4)} >= (^~(~^reg11)))) : reg8[(4'ha):(4'h8)]);
          reg31 <= $signed({(((~&(8'h9c)) != reg24[(3'h6):(2'h2)]) ?
                  reg22[(1'h1):(1'h1)] : (reg6[(4'hb):(3'h4)] ?
                      $signed(wire3) : (reg27 == wire19))),
              (reg11[(2'h3):(2'h3)] <= wire19)});
          reg32 <= $unsigned($signed((~$signed(reg31[(2'h3):(1'h0)]))));
        end
    end
  assign wire33 = $signed((reg28[(4'hf):(1'h0)] == $signed($signed($signed(reg14)))));
  assign wire34 = $unsigned((8'ha2));
  assign wire35 = (|reg29[(2'h2):(1'h1)]);
  assign wire36 = (|(reg29[(1'h1):(1'h0)] && wire3));
  assign wire37 = $unsigned(reg12[(3'h7):(2'h3)]);
  always
    @(posedge clk) begin
      reg38 <= (wire3[(4'h8):(3'h6)] ?
          ((8'ha8) ?
              (~|(reg5 || reg6[(4'h9):(1'h1)])) : ((+(-(8'h9e))) ?
                  $unsigned({wire36}) : ((wire2 ^~ reg11) ?
                      $unsigned(reg32) : (^~reg24)))) : (reg24[(3'h7):(1'h1)] >= (7'h40)));
      reg39 <= reg10[(2'h2):(1'h1)];
      reg40 <= $unsigned((~^$signed((wire1 < reg17[(4'hf):(3'h7)]))));
      reg41 <= (~reg15);
    end
  assign wire42 = reg27;
  assign wire43 = $unsigned($signed({((reg29 == reg25) ?
                          (~|wire1) : {reg29})}));
endmodule
